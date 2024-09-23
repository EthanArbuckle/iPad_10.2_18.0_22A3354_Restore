void sub_1AA842A54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ATXPBProactiveSuggestionUISpecificationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  void *v23;
  int *v24;
  int *v25;
  ATXPBProactiveSuggestionLayoutConfig *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  BOOL v67;
  uint64_t v68;
  uint64_t v69;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = &OBJC_IVAR___ATXPBRequestForContextualActionSuggestions__originatorId;
  v8 = &OBJC_IVAR___ATXPBRequestForContextualActionSuggestions__originatorId;
  v9 = (int *)MEMORY[0x1E0D82BB8];
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
      v15 = v14 + 1;
      if (v14 == -1 || v15 > *(_QWORD *)(a2 + *v4))
        break;
      v16 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v14);
      *(_QWORD *)(a2 + v13) = v15;
      v12 |= (unint64_t)(v16 & 0x7F) << v10;
      if ((v16 & 0x80) == 0)
        goto LABEL_12;
      v10 += 7;
      v17 = v11++ >= 9;
      if (v17)
      {
        v12 = 0;
        v18 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v18 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v12 = 0;
LABEL_14:
    if (v18 || (v12 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v12 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v7[36];
        goto LABEL_24;
      case 2u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v8[37];
        goto LABEL_24;
      case 3u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 40;
LABEL_24:
        v23 = *(void **)(a1 + v21);
        *(_QWORD *)(a1 + v21) = v20;

        goto LABEL_95;
      case 4u:
        v24 = v8;
        v25 = v7;
        v26 = objc_alloc_init(ATXPBProactiveSuggestionLayoutConfig);
        -[ATXPBProactiveSuggestionUISpecification addPreferredLayoutConfigs:](a1, v26);
        if (PBReaderPlaceMark()
          && (ATXPBProactiveSuggestionLayoutConfigReadFrom((uint64_t)v26, a2) & 1) != 0)
        {
          PBReaderRecallMark();

          v7 = v25;
          v8 = v24;
LABEL_95:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 5u:
        v27 = 0;
        v28 = 0;
        v29 = 0;
        *(_BYTE *)(a1 + 68) |= 0x10u;
        while (2)
        {
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          v32 = v31 + 1;
          if (v31 == -1 || v32 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v31);
            *(_QWORD *)(a2 + v30) = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if (v33 < 0)
            {
              v27 += 7;
              v17 = v28++ >= 9;
              if (v17)
              {
                v29 = 0;
                goto LABEL_72;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v29 = 0;
LABEL_72:
        v67 = v29 != 0;
        v68 = 65;
        goto LABEL_85;
      case 6u:
        v34 = 0;
        v35 = 0;
        v36 = 0;
        *(_BYTE *)(a1 + 68) |= 8u;
        while (2)
        {
          v37 = *v3;
          v38 = *(_QWORD *)(a2 + v37);
          v39 = v38 + 1;
          if (v38 == -1 || v39 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v38);
            *(_QWORD *)(a2 + v37) = v39;
            v36 |= (unint64_t)(v40 & 0x7F) << v34;
            if (v40 < 0)
            {
              v34 += 7;
              v17 = v35++ >= 9;
              if (v17)
              {
                v36 = 0;
                goto LABEL_76;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v36 = 0;
LABEL_76:
        v67 = v36 != 0;
        v68 = 64;
        goto LABEL_85;
      case 7u:
        v41 = 0;
        v42 = 0;
        v43 = 0;
        *(_BYTE *)(a1 + 68) |= 0x20u;
        while (2)
        {
          v44 = *v3;
          v45 = *(_QWORD *)(a2 + v44);
          v46 = v45 + 1;
          if (v45 == -1 || v46 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v47 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v45);
            *(_QWORD *)(a2 + v44) = v46;
            v43 |= (unint64_t)(v47 & 0x7F) << v41;
            if (v47 < 0)
            {
              v41 += 7;
              v17 = v42++ >= 9;
              if (v17)
              {
                v43 = 0;
                goto LABEL_80;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v43 = 0;
LABEL_80:
        v67 = v43 != 0;
        v68 = 66;
        goto LABEL_85;
      case 8u:
        v48 = 0;
        v49 = 0;
        v50 = 0;
        *(_BYTE *)(a1 + 68) |= 0x40u;
        while (2)
        {
          v51 = *v3;
          v52 = *(_QWORD *)(a2 + v51);
          v53 = v52 + 1;
          if (v52 == -1 || v53 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v52);
            *(_QWORD *)(a2 + v51) = v53;
            v50 |= (unint64_t)(v54 & 0x7F) << v48;
            if (v54 < 0)
            {
              v48 += 7;
              v17 = v49++ >= 9;
              if (v17)
              {
                v50 = 0;
                goto LABEL_84;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v50 = 0;
LABEL_84:
        v67 = v50 != 0;
        v68 = 67;
LABEL_85:
        *(_BYTE *)(a1 + v68) = v67;
        goto LABEL_95;
      case 9u:
        v55 = 0;
        v56 = 0;
        v57 = 0;
        *(_BYTE *)(a1 + 68) |= 4u;
        while (2)
        {
          v58 = *v3;
          v59 = *(_QWORD *)(a2 + v58);
          v60 = v59 + 1;
          if (v59 == -1 || v60 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v61 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v59);
            *(_QWORD *)(a2 + v58) = v60;
            v57 |= (unint64_t)(v61 & 0x7F) << v55;
            if (v61 < 0)
            {
              v55 += 7;
              v17 = v56++ >= 9;
              if (v17)
              {
                v57 = 0;
                goto LABEL_89;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v57 = 0;
LABEL_89:
        *(_QWORD *)(a1 + 24) = v57;
        goto LABEL_95;
      case 0xAu:
        *(_BYTE *)(a1 + 68) |= 2u;
        v62 = *v3;
        v63 = *(_QWORD *)(a2 + v62);
        if (v63 <= 0xFFFFFFFFFFFFFFF7 && v63 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v64 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v63);
          *(_QWORD *)(a2 + v62) = v63 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v64 = 0;
        }
        v69 = 16;
        goto LABEL_94;
      case 0xBu:
        *(_BYTE *)(a1 + 68) |= 1u;
        v65 = *v3;
        v66 = *(_QWORD *)(a2 + v65);
        if (v66 <= 0xFFFFFFFFFFFFFFF7 && v66 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v64 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v66);
          *(_QWORD *)(a2 + v65) = v66 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v64 = 0;
        }
        v69 = 8;
LABEL_94:
        *(_QWORD *)(a1 + v69) = v64;
        goto LABEL_95;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_95;
    }
  }
}

uint64_t ATXPBProactiveSuggestionLayoutConfigReadFrom(uint64_t a1, uint64_t a2)
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
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
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

BOOL ATXPBProactiveSuggestionReadFrom(uint64_t a1, uint64_t a2)
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
  ATXPBProactiveSuggestionClientModelSpecification *v18;

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
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(ATXPBProactiveSuggestionClientModelSpecification **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = v17;
        goto LABEL_34;
      case 2u:
        v18 = objc_alloc_init(ATXPBProactiveSuggestionClientModelSpecification);
        objc_storeStrong((id *)(a1 + 8), v18);
        if (!PBReaderPlaceMark()
          || (ATXPBProactiveSuggestionClientModelSpecificationReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
          goto LABEL_38;
        }
        goto LABEL_33;
      case 3u:
        v18 = objc_alloc_init(ATXPBProactiveSuggestionExecutableSpecification);
        objc_storeStrong((id *)(a1 + 16), v18);
        if (!PBReaderPlaceMark()
          || (ATXPBProactiveSuggestionExecutableSpecificationReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
          goto LABEL_38;
        }
        goto LABEL_33;
      case 4u:
        v18 = objc_alloc_init(ATXPBProactiveSuggestionUISpecification);
        objc_storeStrong((id *)(a1 + 32), v18);
        if (!PBReaderPlaceMark()
          || (ATXPBProactiveSuggestionUISpecificationReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
          goto LABEL_38;
        }
        goto LABEL_33;
      case 5u:
        v18 = objc_alloc_init(ATXPBProactiveSuggestionScoreSpecification);
        objc_storeStrong((id *)(a1 + 24), v18);
        if (PBReaderPlaceMark()
          && (ATXPBProactiveSuggestionScoreSpecificationReadFrom((uint64_t)v18, a2) & 1) != 0)
        {
LABEL_33:
          PBReaderRecallMark();
LABEL_34:

LABEL_35:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_38:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_35;
    }
  }
}

uint64_t ATXPBProactiveSuggestionScoreSpecificationReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
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
      if ((v10 >> 3) == 2)
      {
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 20) |= 2u;
        while (1)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          v26 = v25 + 1;
          if (v25 == -1 || v26 > *(_QWORD *)(a2 + *v4))
            break;
          v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
          *(_QWORD *)(a2 + v24) = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0)
            goto LABEL_33;
          v21 += 7;
          v15 = v22++ >= 9;
          if (v15)
          {
            LODWORD(v23) = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_35:
        *(_DWORD *)(a1 + 16) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        *(_BYTE *)(a1 + 20) |= 1u;
        v18 = *v3;
        v19 = *(_QWORD *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v19);
          *(_QWORD *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        *(_QWORD *)(a1 + 8) = v20;
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

uint64_t ATXPBProactiveSuggestionExecutableSpecificationReadFrom(uint64_t a1, uint64_t a2)
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
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_32;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 52) |= 1u;
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
                  goto LABEL_43;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_43:
          *(_QWORD *)(a1 + 8) = v22;
          continue;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_32;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_32;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
LABEL_32:
          v26 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 6u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          *(_BYTE *)(a1 + 52) |= 2u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v30 = *v3;
        v31 = *(_QWORD *)(a2 + v30);
        if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
          break;
        v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
        *(_QWORD *)(a2 + v30) = v31 + 1;
        v29 |= (unint64_t)(v32 & 0x7F) << v27;
        if ((v32 & 0x80) == 0)
          goto LABEL_45;
        v27 += 7;
        v14 = v28++ >= 9;
        if (v14)
        {
          LODWORD(v29) = 0;
          goto LABEL_47;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v29) = 0;
LABEL_47:
      *(_DWORD *)(a1 + 48) = v29;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ATXPBProactiveSuggestionClientModelSpecificationReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v18;
  uint64_t v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;
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
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_34;
          v20 += 7;
          v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_36;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_36:
        *(_DWORD *)(a1 + 24) = v22;
      }
      else
      {
        if ((_DWORD)v17 == 2)
        {
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 16;
        }
        else
        {
          if ((_DWORD)v17 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 8;
        }
        v26 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ATXPBSuggestionLayoutReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v30;
  ATXPBProactiveSuggestion *v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  void *v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  BOOL v68;
  uint64_t v69;

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
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 116) |= 4u;
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
            goto LABEL_81;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_83;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_81:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_83:
        *(_DWORD *)(a1 + 40) = v20;
        goto LABEL_107;
      case 2u:
        *(_BYTE *)(a1 + 116) |= 1u;
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
        goto LABEL_107;
      case 3u:
        PBReaderReadString();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = 96;
        goto LABEL_67;
      case 4u:
        v31 = objc_alloc_init(ATXPBProactiveSuggestion);
        -[ATXPBSuggestionLayout addOneByOneSuggestions:](a1, v31);
        goto LABEL_77;
      case 5u:
        v31 = objc_alloc_init(ATXPBProactiveSuggestion);
        -[ATXPBSuggestionLayout addOneByTwoSuggestions:](a1, v31);
        goto LABEL_77;
      case 6u:
        v31 = objc_alloc_init(ATXPBProactiveSuggestion);
        -[ATXPBSuggestionLayout addTwoByTwoSuggestions:](a1, v31);
        goto LABEL_77;
      case 7u:
        v31 = objc_alloc_init(ATXPBProactiveSuggestion);
        -[ATXPBSuggestionLayout addOneByFourSuggestions:](a1, v31);
        goto LABEL_77;
      case 8u:
        v31 = objc_alloc_init(ATXPBProactiveSuggestion);
        -[ATXPBSuggestionLayout addTwoByFourSuggestions:](a1, v31);
        goto LABEL_77;
      case 9u:
        v32 = 0;
        v33 = 0;
        v34 = 0;
        *(_BYTE *)(a1 + 116) |= 0x40u;
        while (2)
        {
          v35 = *v3;
          v36 = *(_QWORD *)(a2 + v35);
          v37 = v36 + 1;
          if (v36 == -1 || v37 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
            *(_QWORD *)(a2 + v35) = v37;
            v34 |= (unint64_t)(v38 & 0x7F) << v32;
            if (v38 < 0)
            {
              v32 += 7;
              v15 = v33++ >= 9;
              if (v15)
              {
                v34 = 0;
                goto LABEL_87;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v34 = 0;
LABEL_87:
        v68 = v34 != 0;
        v69 = 115;
        goto LABEL_100;
      case 0xAu:
        v39 = 0;
        v40 = 0;
        v41 = 0;
        *(_BYTE *)(a1 + 116) |= 8u;
        while (2)
        {
          v42 = *v3;
          v43 = *(_QWORD *)(a2 + v42);
          v44 = v43 + 1;
          if (v43 == -1 || v44 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v43);
            *(_QWORD *)(a2 + v42) = v44;
            v41 |= (unint64_t)(v45 & 0x7F) << v39;
            if (v45 < 0)
            {
              v39 += 7;
              v15 = v40++ >= 9;
              if (v15)
              {
                v41 = 0;
                goto LABEL_91;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v41 = 0;
LABEL_91:
        v68 = v41 != 0;
        v69 = 112;
        goto LABEL_100;
      case 0xBu:
        v46 = 0;
        v47 = 0;
        v48 = 0;
        *(_BYTE *)(a1 + 116) |= 0x20u;
        while (2)
        {
          v49 = *v3;
          v50 = *(_QWORD *)(a2 + v49);
          v51 = v50 + 1;
          if (v50 == -1 || v51 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v52 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v50);
            *(_QWORD *)(a2 + v49) = v51;
            v48 |= (unint64_t)(v52 & 0x7F) << v46;
            if (v52 < 0)
            {
              v46 += 7;
              v15 = v47++ >= 9;
              if (v15)
              {
                v48 = 0;
                goto LABEL_95;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v48 = 0;
LABEL_95:
        v68 = v48 != 0;
        v69 = 114;
        goto LABEL_100;
      case 0xCu:
        PBReaderReadString();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = 104;
        goto LABEL_67;
      case 0xDu:
        v53 = 0;
        v54 = 0;
        v55 = 0;
        *(_BYTE *)(a1 + 116) |= 0x10u;
        while (2)
        {
          v56 = *v3;
          v57 = *(_QWORD *)(a2 + v56);
          v58 = v57 + 1;
          if (v57 == -1 || v58 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v59 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v57);
            *(_QWORD *)(a2 + v56) = v58;
            v55 |= (unint64_t)(v59 & 0x7F) << v53;
            if (v59 < 0)
            {
              v53 += 7;
              v15 = v54++ >= 9;
              if (v15)
              {
                v55 = 0;
                goto LABEL_99;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v55 = 0;
LABEL_99:
        v68 = v55 != 0;
        v69 = 113;
LABEL_100:
        *(_BYTE *)(a1 + v69) = v68;
        goto LABEL_107;
      case 0xEu:
        PBReaderReadString();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = 88;
LABEL_67:
        v60 = *(void **)(a1 + v30);
        *(_QWORD *)(a1 + v30) = v29;

        goto LABEL_107;
      case 0xFu:
        v61 = 0;
        v62 = 0;
        v63 = 0;
        *(_BYTE *)(a1 + 116) |= 2u;
        while (2)
        {
          v64 = *v3;
          v65 = *(_QWORD *)(a2 + v64);
          v66 = v65 + 1;
          if (v65 == -1 || v66 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v67 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v65);
            *(_QWORD *)(a2 + v64) = v66;
            v63 |= (unint64_t)(v67 & 0x7F) << v61;
            if (v67 < 0)
            {
              v61 += 7;
              v15 = v62++ >= 9;
              if (v15)
              {
                v63 = 0;
                goto LABEL_104;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v63 = 0;
LABEL_104:
        *(_QWORD *)(a1 + 16) = v63;
        goto LABEL_107;
      case 0x10u:
        v31 = objc_alloc_init(ATXPBProactiveSuggestion);
        -[ATXPBSuggestionLayout addFourByFourSuggestions:](a1, v31);
        goto LABEL_77;
      case 0x11u:
        v31 = objc_alloc_init(ATXPBProactiveSuggestion);
        -[ATXPBSuggestionLayout addFourByEightSuggestions:](a1, v31);
LABEL_77:
        if (PBReaderPlaceMark() && ATXPBProactiveSuggestionReadFrom((uint64_t)v31, a2))
        {
          PBReaderRecallMark();

LABEL_107:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_107;
    }
  }
}

void sub_1AA8479F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __atxlog_handle_blending()
{
  if (__atxlog_handle_blending_onceToken != -1)
    dispatch_once(&__atxlog_handle_blending_onceToken, &__block_literal_global_34_0);
  return (id)__atxlog_handle_blending_log;
}

id __atxlog_handle_xpc()
{
  if (__atxlog_handle_xpc_onceToken != -1)
    dispatch_once(&__atxlog_handle_xpc_onceToken, &__block_literal_global_3);
  return (id)__atxlog_handle_xpc_log;
}

void sub_1AA8495D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __atxlog_handle_blending_internal_cache()
{
  if (__atxlog_handle_blending_internal_cache_onceToken != -1)
    dispatch_once(&__atxlog_handle_blending_internal_cache_onceToken, &__block_literal_global_36_0);
  return (id)__atxlog_handle_blending_internal_cache_log;
}

void sub_1AA849AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AA849D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL ATXPBUIFeedbackPriorContextReadFrom(char *a1, uint64_t a2)
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
  ATXPBBlendingModelUICacheUpdate *v17;
  uint64_t v18;
  uint64_t v19;

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
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = (ATXPBBlendingModelUICacheUpdate *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(a1, "addCacheUpdateOrdering:", v17);
        goto LABEL_33;
      case 2u:
        v17 = objc_alloc_init(ATXPBBlendingModelUICacheUpdate);
        objc_msgSend(a1, "addBlendingModelCacheUpdates:", v17);
        if (!PBReaderPlaceMark() || (ATXPBBlendingModelUICacheUpdateReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_37;
        goto LABEL_28;
      case 3u:
        v17 = objc_alloc_init(ATXPBClientModelCacheUpdate);
        objc_msgSend(a1, "addClientModelCacheUpdates:", v17);
        if (PBReaderPlaceMark() && (ATXPBClientModelCacheUpdateReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_28:
          PBReaderRecallMark();
LABEL_33:

LABEL_34:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_37:

        return 0;
      case 4u:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 32;
        goto LABEL_32;
      case 5u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 40;
        goto LABEL_32;
      case 6u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 48;
LABEL_32:
        v17 = *(ATXPBBlendingModelUICacheUpdate **)&a1[v19];
        *(_QWORD *)&a1[v19] = v18;
        goto LABEL_33;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_34;
    }
  }
}

uint64_t ATXPBClientModelCacheUpdateReadFrom(uint64_t a1, uint64_t a2)
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
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  ATXPBProactiveSuggestion *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;

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
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
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
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 48;
        goto LABEL_27;
      case 2u:
        v21 = objc_alloc_init(ATXPBProactiveSuggestion);
        objc_msgSend((id)a1, "addSuggestions:", v21);
        if (!PBReaderPlaceMark() || !ATXPBProactiveSuggestionReadFrom((uint64_t)v21, a2))
          goto LABEL_38;
        goto LABEL_33;
      case 3u:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 24;
        goto LABEL_27;
      case 4u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
LABEL_27:
        v22 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_36;
      case 5u:
        *(_BYTE *)(a1 + 56) |= 1u;
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v25 = 0;
        }
        *(_QWORD *)(a1 + 8) = v25;
        goto LABEL_36;
      case 6u:
        v21 = objc_alloc_init(ATXPBResponseForRequestForSuggestions);
        objc_storeStrong((id *)(a1 + 32), v21);
        if (PBReaderPlaceMark()
          && (ATXPBResponseForRequestForSuggestionsReadFrom((uint64_t)v21, a2) & 1) != 0)
        {
LABEL_33:
          PBReaderRecallMark();

LABEL_36:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_38:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_36;
    }
  }
}

uint64_t ATXPBBlendingModelUICacheUpdateReadFrom(uint64_t a1, uint64_t a2)
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
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  void *v21;
  ATXPBHomeScreenCachedSuggestion *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;

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
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
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
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 64;
        goto LABEL_23;
      case 2u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 32;
LABEL_23:
        v21 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_41;
      case 3u:
        PBReaderReadString();
        v22 = (ATXPBHomeScreenCachedSuggestion *)objc_claimAutoreleasedReturnValue();
        if (v22)
          -[ATXPBBlendingModelUICacheUpdate addClientModelIds:](a1, v22);
        goto LABEL_40;
      case 4u:
        PBReaderReadString();
        v22 = (ATXPBHomeScreenCachedSuggestion *)objc_claimAutoreleasedReturnValue();
        if (v22)
          -[ATXPBBlendingModelUICacheUpdate addClientModelCacheUpdateUUIDStrings:](a1, v22);
        goto LABEL_40;
      case 5u:
        v22 = objc_alloc_init(ATXPBHomeScreenCachedSuggestion);
        objc_storeStrong((id *)(a1 + 40), v22);
        if (!PBReaderPlaceMark() || !ATXPBHomeScreenCachedSuggestionReadFrom((uint64_t)v22, a2))
          goto LABEL_46;
        goto LABEL_39;
      case 6u:
        v22 = objc_alloc_init(ATXPBSuggestionLayout);
        objc_storeStrong((id *)(a1 + 56), v22);
        if (!PBReaderPlaceMark() || (ATXPBSuggestionLayoutReadFrom((uint64_t)v22, a2) & 1) == 0)
          goto LABEL_46;
        goto LABEL_39;
      case 7u:
        *(_BYTE *)(a1 + 72) |= 1u;
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v25 = 0;
        }
        *(_QWORD *)(a1 + 8) = v25;
        goto LABEL_41;
      case 8u:
        v22 = objc_alloc_init(ATXPBSpotlightSuggestionLayout);
        objc_storeStrong((id *)(a1 + 48), v22);
        if (PBReaderPlaceMark() && (ATXPBSpotlightSuggestionLayoutReadFrom(v22, a2) & 1) != 0)
        {
LABEL_39:
          PBReaderRecallMark();
LABEL_40:

LABEL_41:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_46:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_41;
    }
  }
}

BOOL ATXPBHomeScreenCachedSuggestionReadFrom(uint64_t a1, uint64_t a2)
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
  ATXPBSuggestionLayout *v18;

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
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(ATXPBSuggestionLayout **)(a1 + 80);
        *(_QWORD *)(a1 + 80) = v17;
        goto LABEL_42;
      case 2u:
        PBReaderReadString();
        v18 = (ATXPBSuggestionLayout *)objc_claimAutoreleasedReturnValue();
        if (v18)
          -[ATXPBHomeScreenCachedSuggestion addCachedSuggestionWidgetIds:](a1, v18);
        goto LABEL_42;
      case 3u:
        v18 = objc_alloc_init(ATXPBSuggestionLayout);
        -[ATXPBHomeScreenCachedSuggestion addCachedSuggestionWidgetLayouts:](a1, v18);
        goto LABEL_34;
      case 4u:
        PBReaderReadString();
        v18 = (ATXPBSuggestionLayout *)objc_claimAutoreleasedReturnValue();
        if (v18)
          -[ATXPBHomeScreenCachedSuggestion addCachedTopOfStackLayoutKeys:](a1, v18);
        goto LABEL_42;
      case 5u:
        v18 = objc_alloc_init(ATXPBSuggestionLayout);
        -[ATXPBHomeScreenCachedSuggestion addCachedTopOfStackLayouts:](a1, v18);
        goto LABEL_34;
      case 6u:
        v18 = objc_alloc_init(ATXPBProactiveSuggestion);
        -[ATXPBHomeScreenCachedSuggestion addFallbackSuggestions:](a1, v18);
        if (!PBReaderPlaceMark() || !ATXPBProactiveSuggestionReadFrom((uint64_t)v18, a2))
          goto LABEL_46;
        goto LABEL_41;
      case 7u:
        PBReaderReadString();
        v18 = (ATXPBSuggestionLayout *)objc_claimAutoreleasedReturnValue();
        if (v18)
          -[ATXPBHomeScreenCachedSuggestion addCachedAppPredictionPanelIds:](a1, v18);
        goto LABEL_42;
      case 8u:
        v18 = objc_alloc_init(ATXPBSuggestionLayout);
        -[ATXPBHomeScreenCachedSuggestion addCachedAppPredictionPanelLayouts:](a1, v18);
LABEL_34:
        if (!PBReaderPlaceMark() || (ATXPBSuggestionLayoutReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_46;
        goto LABEL_41;
      case 9u:
        PBReaderReadString();
        v18 = (ATXPBSuggestionLayout *)objc_claimAutoreleasedReturnValue();
        if (v18)
          -[ATXPBHomeScreenCachedSuggestion addCachedSuggestedWidgetLayoutListKeys:](a1, v18);
        goto LABEL_42;
      case 0xAu:
        v18 = objc_alloc_init(ATXPBSuggestionLayoutList);
        -[ATXPBHomeScreenCachedSuggestion addCachedSuggestedWidgetLayoutLists:](a1, v18);
        if (PBReaderPlaceMark() && (ATXPBSuggestionLayoutListReadFrom((uint64_t)v18, a2) & 1) != 0)
        {
LABEL_41:
          PBReaderRecallMark();
LABEL_42:

LABEL_43:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_46:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_43;
    }
  }
}

id __atxlog_handle_gi()
{
  if (__atxlog_handle_gi_onceToken != -1)
    dispatch_once(&__atxlog_handle_gi_onceToken, &__block_literal_global_22_0);
  return (id)__atxlog_handle_gi_log;
}

id __atxlog_handle_blending_ecosystem()
{
  if (__atxlog_handle_blending_ecosystem_onceToken != -1)
    dispatch_once(&__atxlog_handle_blending_ecosystem_onceToken, &__block_literal_global_38);
  return (id)__atxlog_handle_blending_ecosystem_log;
}

id __atxlog_handle_feedback()
{
  if (__atxlog_handle_feedback_onceToken != -1)
    dispatch_once(&__atxlog_handle_feedback_onceToken, &__block_literal_global_14);
  return (id)__atxlog_handle_feedback_log;
}

void sub_1AA851480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t ATXPBInfoSuggestionReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;

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
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 48;
          goto LABEL_54;
        case 2u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 112;
          goto LABEL_54;
        case 3u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 120;
          goto LABEL_54;
        case 4u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 128) |= 4u;
          while (2)
          {
            v24 = *v3;
            v25 = *(_QWORD *)(a2 + v24);
            v26 = v25 + 1;
            if (v25 == -1 || v26 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
              *(_QWORD *)(a2 + v24) = v26;
              v23 |= (unint64_t)(v27 & 0x7F) << v21;
              if (v27 < 0)
              {
                v21 += 7;
                v15 = v22++ >= 9;
                if (v15)
                {
                  v23 = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v23 = 0;
LABEL_58:
          v42 = 24;
          goto LABEL_63;
        case 5u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 104;
          goto LABEL_54;
        case 6u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 80;
          goto LABEL_54;
        case 7u:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 56;
          goto LABEL_54;
        case 8u:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 72;
          goto LABEL_54;
        case 9u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 96;
          goto LABEL_54;
        case 0xAu:
          v28 = 0;
          v29 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 128) |= 1u;
          break;
        case 0xBu:
          *(_BYTE *)(a1 + 128) |= 8u;
          v34 = *v3;
          v35 = *(_QWORD *)(a2 + v34);
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v36 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v35);
            *(_QWORD *)(a2 + v34) = v35 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v36 = 0;
          }
          v43 = 32;
          goto LABEL_70;
        case 0xCu:
          *(_BYTE *)(a1 + 128) |= 0x10u;
          v37 = *v3;
          v38 = *(_QWORD *)(a2 + v37);
          if (v38 <= 0xFFFFFFFFFFFFFFF7 && v38 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v36 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v38 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v36 = 0;
          }
          v43 = 40;
          goto LABEL_70;
        case 0xDu:
          *(_BYTE *)(a1 + 128) |= 2u;
          v39 = *v3;
          v40 = *(_QWORD *)(a2 + v39);
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v36 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v40);
            *(_QWORD *)(a2 + v39) = v40 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v36 = 0;
          }
          v43 = 16;
LABEL_70:
          *(_QWORD *)(a1 + v43) = v36;
          continue;
        case 0xEu:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 88;
          goto LABEL_54;
        case 0xFu:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 64;
LABEL_54:
          v41 = *(void **)(a1 + v19);
          *(_QWORD *)(a1 + v19) = v18;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v30 = *v3;
        v31 = *(_QWORD *)(a2 + v30);
        v32 = v31 + 1;
        if (v31 == -1 || v32 > *(_QWORD *)(a2 + *v4))
          break;
        v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
        *(_QWORD *)(a2 + v30) = v32;
        v23 |= (unint64_t)(v33 & 0x7F) << v28;
        if ((v33 & 0x80) == 0)
          goto LABEL_60;
        v28 += 7;
        v15 = v29++ >= 9;
        if (v15)
        {
          v23 = 0;
          goto LABEL_62;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_60:
      if (*(_BYTE *)(a2 + *v5))
        v23 = 0;
LABEL_62:
      v42 = 8;
LABEL_63:
      *(_QWORD *)(a1 + v42) = v23;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void ____atxlog_handle_blending_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "blending");
  v1 = (void *)__atxlog_handle_blending_log;
  __atxlog_handle_blending_log = (uint64_t)v0;

}

uint64_t ATXPBSpotlightSuggestionLayoutReadFrom(_QWORD *a1, uint64_t a2)
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
  uint64_t v16;
  int v17;
  int v18;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t result;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  ATXPBSuggestionCollection *v28;
  uint64_t v29;
  unint64_t v30;

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
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *v5;
          v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *v5;
      v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(_BYTE *)(a2 + v16))
        v10 = 0;
LABEL_14:
      v18 = v10 & 7;
      if (v17 || v18 == 4)
        break;
      v20 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        if (v18 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v24 = (unint64_t *)(a2 + *v3);
            v25 = *v24;
            v26 = *(_QWORD *)(a2 + *v4);
            if (*v24 >= v26)
              break;
            v27 = *v5;
            if (*(_BYTE *)(a2 + v27))
              break;
            if (v25 > 0xFFFFFFFFFFFFFFF7 || v25 + 8 > v26)
              *(_BYTE *)(a2 + v27) = 1;
            else
              *v24 = v25 + 8;
            PBRepeatedDoubleAdd();
          }
          PBReaderRecallMark();
        }
        else
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)(a2 + *v4))
            *(_QWORD *)(a2 + v29) = v30 + 8;
          else
            *(_BYTE *)(a2 + v16) = 1;
          PBRepeatedDoubleAdd();
        }
      }
      else if ((_DWORD)v20 == 2)
      {
        v28 = objc_alloc_init(ATXPBSuggestionCollection);
        objc_msgSend(a1, "addCollections:", v28);
        if (!PBReaderPlaceMark() || !ATXPBSuggestionCollectionReadFrom((char *)v28, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((_DWORD)v20 == 1)
      {
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)a1[5];
        a1[5] = v21;

      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ATXPBShortcutsEditorEventReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t result;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  void *v30;
  ATXPBShortcutsEditorEventMetadata *v31;

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
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        *(_BYTE *)(a1 + 48) |= 1u;
        v18 = *v3;
        v19 = *(_QWORD *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v19);
          *(_QWORD *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        *(_QWORD *)(a1 + 8) = v20;
        goto LABEL_44;
      case 2u:
        v22 = 0;
        v23 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 48) |= 2u;
        while (2)
        {
          v25 = *v3;
          v26 = *(_QWORD *)(a2 + v25);
          v27 = v26 + 1;
          if (v26 == -1 || v27 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
            *(_QWORD *)(a2 + v25) = v27;
            v24 |= (unint64_t)(v28 & 0x7F) << v22;
            if (v28 < 0)
            {
              v22 += 7;
              v15 = v23++ >= 9;
              if (v15)
              {
                v24 = 0;
                goto LABEL_41;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v24 = 0;
LABEL_41:
        *(_QWORD *)(a1 + 16) = v24;
        goto LABEL_44;
      case 3u:
        PBReaderReadString();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v29;

        goto LABEL_44;
      case 4u:
        PBReaderReadString();
        v31 = (ATXPBShortcutsEditorEventMetadata *)objc_claimAutoreleasedReturnValue();
        if (v31)
          objc_msgSend((id)a1, "addSuggestionUUIDs:", v31);
        goto LABEL_37;
      case 5u:
        v31 = objc_alloc_init(ATXPBShortcutsEditorEventMetadata);
        objc_storeStrong((id *)(a1 + 32), v31);
        if (PBReaderPlaceMark() && (ATXPBShortcutsEditorEventMetadataReadFrom((uint64_t)v31, a2) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_37:

LABEL_44:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_44;
    }
  }
}

uint64_t ATXPBRequestForContextualActionSuggestionsReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  void *v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;

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
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 48;
          goto LABEL_25;
        case 2u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 40;
          goto LABEL_25;
        case 3u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 24;
          goto LABEL_25;
        case 4u:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 16;
LABEL_25:
          v21 = *(void **)(a1 + v19);
          *(_QWORD *)(a1 + v19) = v18;

          continue;
        case 5u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          *(_BYTE *)(a1 + 56) |= 2u;
          break;
        case 6u:
          *(_BYTE *)(a1 + 56) |= 1u;
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v31 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v30 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v31 = 0;
          }
          *(_QWORD *)(a1 + 8) = v31;
          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v25 = *v3;
        v26 = *(_QWORD *)(a2 + v25);
        v27 = v26 + 1;
        if (v26 == -1 || v27 > *(_QWORD *)(a2 + *v4))
          break;
        v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
        *(_QWORD *)(a2 + v25) = v27;
        v24 |= (unint64_t)(v28 & 0x7F) << v22;
        if ((v28 & 0x80) == 0)
          goto LABEL_37;
        v22 += 7;
        v15 = v23++ >= 9;
        if (v15)
        {
          LODWORD(v24) = 0;
          goto LABEL_39;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v24) = 0;
LABEL_39:
      *(_DWORD *)(a1 + 32) = v24;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

uint64_t ATXPBLightweightProactiveSuggestionReadFrom(uint64_t a1, uint64_t a2)
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
  void *v20;
  ATXPBProactiveSuggestionScoreSpecification *v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;

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
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
        goto LABEL_23;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
LABEL_23:
        v20 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_38;
      case 3u:
        v21 = objc_alloc_init(ATXPBProactiveSuggestionScoreSpecification);
        objc_storeStrong((id *)(a1 + 32), v21);
        if (PBReaderPlaceMark()
          && (ATXPBProactiveSuggestionScoreSpecificationReadFrom((uint64_t)v21, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_38:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 4u:
        v22 = 0;
        v23 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 40) |= 1u;
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
            v24 |= (unint64_t)(v27 & 0x7F) << v22;
            if (v27 < 0)
            {
              v22 += 7;
              v14 = v23++ >= 9;
              if (v14)
              {
                v24 = 0;
                goto LABEL_37;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v24 = 0;
LABEL_37:
        *(_QWORD *)(a1 + 8) = v24;
        goto LABEL_38;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_38;
    }
  }
}

void sub_1AA857DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1AA85D6B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1AA85D91C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AA85E4A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1AA861DB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AA861F44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AA862408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1AA862E2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1AA862F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1AA863AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_1AA863C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL ATXPBSuggestionCollectionReadFrom(char *a1, uint64_t a2)
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
  ATXPBProactiveSuggestion *v20;

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
        v20 = objc_alloc_init(ATXPBProactiveSuggestion);
        objc_msgSend(a1, "addSuggestions:", v20);
        if (!PBReaderPlaceMark() || !ATXPBProactiveSuggestionReadFrom((uint64_t)v20, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_27;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 8;
        goto LABEL_23;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_29:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = 16;
LABEL_23:
    v20 = *(ATXPBProactiveSuggestion **)&a1[v19];
    *(_QWORD *)&a1[v19] = v18;
LABEL_27:

    goto LABEL_29;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1AA866880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1AA866C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return objc_opt_class();
}

uint64_t ATXPBContextualActionsGroupedUIFeedbackResultReadFrom(uint64_t a1, uint64_t a2)
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
  ATXPBProactiveSuggestionGroupedUIFeedbackResult *v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t result;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;

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
          v17 = objc_alloc_init(ATXPBProactiveSuggestionGroupedUIFeedbackResult);
          objc_storeStrong((id *)(a1 + 32), v17);
          if (PBReaderPlaceMark()
            && (ATXPBProactiveSuggestionGroupedUIFeedbackResultReadFrom((uint64_t)v17, a2) & 1) != 0)
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 40) |= 4u;
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
              goto LABEL_46;
            v18 += 7;
            v14 = v19++ >= 9;
            if (v14)
            {
              v20 = 0;
              goto LABEL_48;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_46:
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_48:
          v35 = 24;
          goto LABEL_57;
        case 3u:
          v24 = 0;
          v25 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 40) |= 2u;
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
              v20 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  v20 = 0;
                  goto LABEL_52;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_52:
          v35 = 16;
          goto LABEL_57;
        case 6u:
          v30 = 0;
          v31 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 40) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v32 = *v3;
        v33 = *(_QWORD *)(a2 + v32);
        if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
          break;
        v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
        *(_QWORD *)(a2 + v32) = v33 + 1;
        v20 |= (unint64_t)(v34 & 0x7F) << v30;
        if ((v34 & 0x80) == 0)
          goto LABEL_54;
        v30 += 7;
        v14 = v31++ >= 9;
        if (v14)
        {
          v20 = 0;
          goto LABEL_56;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_54:
      if (*(_BYTE *)(a2 + *v5))
        v20 = 0;
LABEL_56:
      v35 = 8;
LABEL_57:
      *(_QWORD *)(a1 + v35) = v20;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1AA8692B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AA8694F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AA86980C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x16u);
}

id __atxlog_handle_default()
{
  if (__atxlog_handle_default_onceToken != -1)
    dispatch_once(&__atxlog_handle_default_onceToken, &__block_literal_global_7);
  return (id)__atxlog_handle_default_log;
}

void ____atxlog_handle_default_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "general");
  v1 = (void *)__atxlog_handle_default_log;
  __atxlog_handle_default_log = (uint64_t)v0;

}

void ____atxlog_handle_xpc_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "xpc");
  v1 = (void *)__atxlog_handle_xpc_log;
  __atxlog_handle_xpc_log = (uint64_t)v0;

}

id __atxlog_handle_heuristic()
{
  if (__atxlog_handle_heuristic_onceToken != -1)
    dispatch_once(&__atxlog_handle_heuristic_onceToken, &__block_literal_global_5);
  return (id)__atxlog_handle_heuristic_log;
}

void ____atxlog_handle_heuristic_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "heuristic");
  v1 = (void *)__atxlog_handle_heuristic_log;
  __atxlog_handle_heuristic_log = (uint64_t)v0;

}

id __atxlog_handle_notifications()
{
  if (__atxlog_handle_notifications_onceToken != -1)
    dispatch_once(&__atxlog_handle_notifications_onceToken, &__block_literal_global_7);
  return (id)__atxlog_handle_notifications_log;
}

void ____atxlog_handle_notifications_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "notifications");
  v1 = (void *)__atxlog_handle_notifications_log;
  __atxlog_handle_notifications_log = (uint64_t)v0;

}

id __atxlog_handle_pmm()
{
  if (__atxlog_handle_pmm_onceToken != -1)
    dispatch_once(&__atxlog_handle_pmm_onceToken, &__block_literal_global_9);
  return (id)__atxlog_handle_pmm_log;
}

void ____atxlog_handle_pmm_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.mm", "GENERAL");
  v1 = (void *)__atxlog_handle_pmm_log;
  __atxlog_handle_pmm_log = (uint64_t)v0;

}

id __atxlog_handle_dailyroutines()
{
  if (__atxlog_handle_dailyroutines_onceToken != -1)
    dispatch_once(&__atxlog_handle_dailyroutines_onceToken, &__block_literal_global_12);
  return (id)__atxlog_handle_dailyroutines_log;
}

void ____atxlog_handle_dailyroutines_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "dailyroutines");
  v1 = (void *)__atxlog_handle_dailyroutines_log;
  __atxlog_handle_dailyroutines_log = (uint64_t)v0;

}

void ____atxlog_handle_feedback_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "feedback");
  v1 = (void *)__atxlog_handle_feedback_log;
  __atxlog_handle_feedback_log = (uint64_t)v0;

}

id __atxlog_handle_modes()
{
  if (__atxlog_handle_modes_onceToken != -1)
    dispatch_once(&__atxlog_handle_modes_onceToken, &__block_literal_global_16);
  return (id)__atxlog_handle_modes_log;
}

void ____atxlog_handle_modes_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "modes");
  v1 = (void *)__atxlog_handle_modes_log;
  __atxlog_handle_modes_log = (uint64_t)v0;

}

id __atxlog_handle_hero()
{
  if (__atxlog_handle_hero_onceToken != -1)
    dispatch_once(&__atxlog_handle_hero_onceToken, &__block_literal_global_18_0);
  return (id)__atxlog_handle_hero_log;
}

void ____atxlog_handle_hero_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "hero");
  v1 = (void *)__atxlog_handle_hero_log;
  __atxlog_handle_hero_log = (uint64_t)v0;

}

id __atxlog_handle_deletions()
{
  if (__atxlog_handle_deletions_onceToken != -1)
    dispatch_once(&__atxlog_handle_deletions_onceToken, &__block_literal_global_20_0);
  return (id)__atxlog_handle_deletions_log;
}

void ____atxlog_handle_deletions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "deletions");
  v1 = (void *)__atxlog_handle_deletions_log;
  __atxlog_handle_deletions_log = (uint64_t)v0;

}

void ____atxlog_handle_gi_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "information");
  v1 = (void *)__atxlog_handle_gi_log;
  __atxlog_handle_gi_log = (uint64_t)v0;

}

id __atxlog_handle_timeline()
{
  if (__atxlog_handle_timeline_onceToken != -1)
    dispatch_once(&__atxlog_handle_timeline_onceToken, &__block_literal_global_24);
  return (id)__atxlog_handle_timeline_log;
}

void ____atxlog_handle_timeline_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "timeline");
  v1 = (void *)__atxlog_handle_timeline_log;
  __atxlog_handle_timeline_log = (uint64_t)v0;

}

id __atxlog_handle_relevant_shortcut()
{
  if (__atxlog_handle_relevant_shortcut_onceToken != -1)
    dispatch_once(&__atxlog_handle_relevant_shortcut_onceToken, &__block_literal_global_26);
  return (id)__atxlog_handle_relevant_shortcut_log;
}

void ____atxlog_handle_relevant_shortcut_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "relevant_shortcut");
  v1 = (void *)__atxlog_handle_relevant_shortcut_log;
  __atxlog_handle_relevant_shortcut_log = (uint64_t)v0;

}

id __atxlog_handle_relevance_model()
{
  if (__atxlog_handle_relevance_model_onceToken != -1)
    dispatch_once(&__atxlog_handle_relevance_model_onceToken, &__block_literal_global_28);
  return (id)__atxlog_handle_relevance_model_log;
}

void ____atxlog_handle_relevance_model_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "relevance_model");
  v1 = (void *)__atxlog_handle_relevance_model_log;
  __atxlog_handle_relevance_model_log = (uint64_t)v0;

}

id __atxlog_handle_watch()
{
  if (__atxlog_handle_watch_onceToken != -1)
    dispatch_once(&__atxlog_handle_watch_onceToken, &__block_literal_global_30_0);
  return (id)__atxlog_handle_watch_log;
}

void ____atxlog_handle_watch_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "watch");
  v1 = (void *)__atxlog_handle_watch_log;
  __atxlog_handle_watch_log = (uint64_t)v0;

}

id __atxlog_handle_ui()
{
  if (__atxlog_handle_ui_onceToken != -1)
    dispatch_once(&__atxlog_handle_ui_onceToken, &__block_literal_global_32);
  return (id)__atxlog_handle_ui_log;
}

void ____atxlog_handle_ui_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "UI");
  v1 = (void *)__atxlog_handle_ui_log;
  __atxlog_handle_ui_log = (uint64_t)v0;

}

void ____atxlog_handle_blending_internal_cache_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "blending_internal_cache");
  v1 = (void *)__atxlog_handle_blending_internal_cache_log;
  __atxlog_handle_blending_internal_cache_log = (uint64_t)v0;

}

void ____atxlog_handle_blending_ecosystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "blending_ecosystem");
  v1 = (void *)__atxlog_handle_blending_ecosystem_log;
  __atxlog_handle_blending_ecosystem_log = (uint64_t)v0;

}

id __atxlog_handle_home_screen()
{
  if (__atxlog_handle_home_screen_onceToken != -1)
    dispatch_once(&__atxlog_handle_home_screen_onceToken, &__block_literal_global_40);
  return (id)__atxlog_handle_home_screen_log;
}

void ____atxlog_handle_home_screen_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "homescreen");
  v1 = (void *)__atxlog_handle_home_screen_log;
  __atxlog_handle_home_screen_log = (uint64_t)v0;

}

id __atxlog_handle_sleep_schedule()
{
  if (__atxlog_handle_sleep_schedule_onceToken != -1)
    dispatch_once(&__atxlog_handle_sleep_schedule_onceToken, &__block_literal_global_42);
  return (id)__atxlog_handle_sleep_schedule_log;
}

void ____atxlog_handle_sleep_schedule_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "sleepschedule");
  v1 = (void *)__atxlog_handle_sleep_schedule_log;
  __atxlog_handle_sleep_schedule_log = (uint64_t)v0;

}

id __atxlog_handle_lock_screen()
{
  if (__atxlog_handle_lock_screen_onceToken != -1)
    dispatch_once(&__atxlog_handle_lock_screen_onceToken, &__block_literal_global_44);
  return (id)__atxlog_handle_lock_screen_log;
}

void ____atxlog_handle_lock_screen_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "lockscreen");
  v1 = (void *)__atxlog_handle_lock_screen_log;
  __atxlog_handle_lock_screen_log = (uint64_t)v0;

}

id __atxlog_handle_anchor()
{
  if (__atxlog_handle_anchor_onceToken != -1)
    dispatch_once(&__atxlog_handle_anchor_onceToken, &__block_literal_global_46);
  return (id)__atxlog_handle_anchor_log;
}

void ____atxlog_handle_anchor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "anchor");
  v1 = (void *)__atxlog_handle_anchor_log;
  __atxlog_handle_anchor_log = (uint64_t)v0;

}

id __atxlog_handle_app_prediction()
{
  if (__atxlog_handle_app_prediction_onceToken != -1)
    dispatch_once(&__atxlog_handle_app_prediction_onceToken, &__block_literal_global_48);
  return (id)__atxlog_handle_app_prediction_log;
}

void ____atxlog_handle_app_prediction_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "app_prediction");
  v1 = (void *)__atxlog_handle_app_prediction_log;
  __atxlog_handle_app_prediction_log = (uint64_t)v0;

}

id __atxlog_handle_action_prediction()
{
  if (__atxlog_handle_action_prediction_onceToken != -1)
    dispatch_once(&__atxlog_handle_action_prediction_onceToken, &__block_literal_global_50);
  return (id)__atxlog_handle_action_prediction_log;
}

void ____atxlog_handle_action_prediction_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "action_prediction");
  v1 = (void *)__atxlog_handle_action_prediction_log;
  __atxlog_handle_action_prediction_log = (uint64_t)v0;

}

id __atxlog_handle_app_library()
{
  if (__atxlog_handle_app_library_onceToken != -1)
    dispatch_once(&__atxlog_handle_app_library_onceToken, &__block_literal_global_52);
  return (id)__atxlog_handle_app_library_log;
}

void ____atxlog_handle_app_library_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "app_library");
  v1 = (void *)__atxlog_handle_app_library_log;
  __atxlog_handle_app_library_log = (uint64_t)v0;

}

id __atxlog_handle_app_install()
{
  if (__atxlog_handle_app_install_onceToken != -1)
    dispatch_once(&__atxlog_handle_app_install_onceToken, &__block_literal_global_54);
  return (id)__atxlog_handle_app_install_log;
}

void ____atxlog_handle_app_install_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "app_install");
  v1 = (void *)__atxlog_handle_app_install_log;
  __atxlog_handle_app_install_log = (uint64_t)v0;

}

id __atxlog_handle_backup()
{
  if (__atxlog_handle_backup_onceToken != -1)
    dispatch_once(&__atxlog_handle_backup_onceToken, &__block_literal_global_56);
  return (id)__atxlog_handle_backup_log;
}

void ____atxlog_handle_backup_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "backup");
  v1 = (void *)__atxlog_handle_backup_log;
  __atxlog_handle_backup_log = (uint64_t)v0;

}

id __atxlog_handle_metrics()
{
  if (__atxlog_handle_metrics_onceToken != -1)
    dispatch_once(&__atxlog_handle_metrics_onceToken, &__block_literal_global_58);
  return (id)__atxlog_handle_metrics_log;
}

void ____atxlog_handle_metrics_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "metrics");
  v1 = (void *)__atxlog_handle_metrics_log;
  __atxlog_handle_metrics_log = (uint64_t)v0;

}

id __atxlog_handle_trial_assets()
{
  if (__atxlog_handle_trial_assets_onceToken != -1)
    dispatch_once(&__atxlog_handle_trial_assets_onceToken, &__block_literal_global_60);
  return (id)__atxlog_handle_trial_assets_log;
}

void ____atxlog_handle_trial_assets_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "trial_assets");
  v1 = (void *)__atxlog_handle_trial_assets_log;
  __atxlog_handle_trial_assets_log = (uint64_t)v0;

}

id __atxlog_handle_notification_management()
{
  if (__atxlog_handle_notification_management_onceToken != -1)
    dispatch_once(&__atxlog_handle_notification_management_onceToken, &__block_literal_global_62);
  return (id)__atxlog_handle_notification_management_log;
}

void ____atxlog_handle_notification_management_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "notification_management");
  v1 = (void *)__atxlog_handle_notification_management_log;
  __atxlog_handle_notification_management_log = (uint64_t)v0;

}

id __atxlog_handle_contextual_actions()
{
  if (__atxlog_handle_contextual_actions_onceToken != -1)
    dispatch_once(&__atxlog_handle_contextual_actions_onceToken, &__block_literal_global_64);
  return (id)__atxlog_handle_contextual_actions_log;
}

void ____atxlog_handle_contextual_actions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "contextual_actions");
  v1 = (void *)__atxlog_handle_contextual_actions_log;
  __atxlog_handle_contextual_actions_log = (uint64_t)v0;

}

id __atxlog_handle_intents_helper()
{
  if (__atxlog_handle_intents_helper_onceToken != -1)
    dispatch_once(&__atxlog_handle_intents_helper_onceToken, &__block_literal_global_66);
  return (id)__atxlog_handle_intents_helper_log;
}

void ____atxlog_handle_intents_helper_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "intents_helper");
  v1 = (void *)__atxlog_handle_intents_helper_log;
  __atxlog_handle_intents_helper_log = (uint64_t)v0;

}

id __atxlog_handle_context_heuristic()
{
  if (__atxlog_handle_context_heuristic_onceToken != -1)
    dispatch_once(&__atxlog_handle_context_heuristic_onceToken, &__block_literal_global_68);
  return (id)__atxlog_handle_context_heuristic_log;
}

void ____atxlog_handle_context_heuristic_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "context_heuristic");
  v1 = (void *)__atxlog_handle_context_heuristic_log;
  __atxlog_handle_context_heuristic_log = (uint64_t)v0;

}

id __atxlog_handle_zkw_hide()
{
  if (__atxlog_handle_zkw_hide_onceToken != -1)
    dispatch_once(&__atxlog_handle_zkw_hide_onceToken, &__block_literal_global_70);
  return (id)__atxlog_handle_zkw_hide_log;
}

void ____atxlog_handle_zkw_hide_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "zkw_hide");
  v1 = (void *)__atxlog_handle_zkw_hide_log;
  __atxlog_handle_zkw_hide_log = (uint64_t)v0;

}

id __atxlog_handle_context_user_education_suggestions()
{
  if (__atxlog_handle_context_user_education_suggestions_onceToken != -1)
    dispatch_once(&__atxlog_handle_context_user_education_suggestions_onceToken, &__block_literal_global_72);
  return (id)__atxlog_handle_context_user_education_suggestions_log;
}

void ____atxlog_handle_context_user_education_suggestions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "user_education_suggestions");
  v1 = (void *)__atxlog_handle_context_user_education_suggestions_log;
  __atxlog_handle_context_user_education_suggestions_log = (uint64_t)v0;

}

id __atxlog_handle_time_intelligence()
{
  if (__atxlog_handle_time_intelligence_onceToken != -1)
    dispatch_once(&__atxlog_handle_time_intelligence_onceToken, &__block_literal_global_74);
  return (id)__atxlog_handle_time_intelligence_log;
}

void ____atxlog_handle_time_intelligence_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "time");
  v1 = (void *)__atxlog_handle_time_intelligence_log;
  __atxlog_handle_time_intelligence_log = (uint64_t)v0;

}

id __atxlog_handle_contextual_engine()
{
  if (__atxlog_handle_contextual_engine_onceToken != -1)
    dispatch_once(&__atxlog_handle_contextual_engine_onceToken, &__block_literal_global_76);
  return (id)__atxlog_handle_contextual_engine_log;
}

void ____atxlog_handle_contextual_engine_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "contextualengine");
  v1 = (void *)__atxlog_handle_contextual_engine_log;
  __atxlog_handle_contextual_engine_log = (uint64_t)v0;

}

id __atxlog_handle_usage_insights()
{
  if (__atxlog_handle_usage_insights_onceToken != -1)
    dispatch_once(&__atxlog_handle_usage_insights_onceToken, &__block_literal_global_78);
  return (id)__atxlog_handle_usage_insights_log;
}

void ____atxlog_handle_usage_insights_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "usage_insights");
  v1 = (void *)__atxlog_handle_usage_insights_log;
  __atxlog_handle_usage_insights_log = (uint64_t)v0;

}

id __atxlog_handle_notification_categorization()
{
  if (__atxlog_handle_notification_categorization_onceToken != -1)
    dispatch_once(&__atxlog_handle_notification_categorization_onceToken, &__block_literal_global_80);
  return (id)__atxlog_handle_notification_categorization_log;
}

void ____atxlog_handle_notification_categorization_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "notification_categorization");
  v1 = (void *)__atxlog_handle_notification_categorization_log;
  __atxlog_handle_notification_categorization_log = (uint64_t)v0;

}

id __atxlog_handle_settings_actions()
{
  if (__atxlog_handle_settings_actions_onceToken != -1)
    dispatch_once(&__atxlog_handle_settings_actions_onceToken, &__block_literal_global_82);
  return (id)__atxlog_handle_settings_actions_log;
}

void ____atxlog_handle_settings_actions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "settings_actions");
  v1 = (void *)__atxlog_handle_settings_actions_log;
  __atxlog_handle_settings_actions_log = (uint64_t)v0;

}

uint64_t ATXPBProactiveSuggestionGroupedUIFeedbackResultReadFrom(uint64_t a1, uint64_t a2)
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
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
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
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;

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
          *(_WORD *)(a1 + 76) |= 0x20u;
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
              goto LABEL_77;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_79;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_77:
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_79:
          v68 = 48;
          goto LABEL_100;
        case 2u:
          v26 = 0;
          v27 = 0;
          v20 = 0;
          *(_WORD *)(a1 + 76) |= 0x40u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            v30 = v29 + 1;
            if (v29 == -1 || v30 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v30;
              v20 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v15 = v27++ >= 9;
                if (v15)
                {
                  v20 = 0;
                  goto LABEL_83;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_83:
          v68 = 56;
          goto LABEL_100;
        case 3u:
          v32 = 0;
          v33 = 0;
          v20 = 0;
          *(_WORD *)(a1 + 76) |= 0x10u;
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
              v20 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v15 = v33++ >= 9;
                if (v15)
                {
                  v20 = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_87:
          v68 = 40;
          goto LABEL_100;
        case 4u:
          v38 = 0;
          v39 = 0;
          v20 = 0;
          *(_WORD *)(a1 + 76) |= 4u;
          while (2)
          {
            v40 = *v3;
            v41 = *(_QWORD *)(a2 + v40);
            v42 = v41 + 1;
            if (v41 == -1 || v42 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v41);
              *(_QWORD *)(a2 + v40) = v42;
              v20 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v15 = v39++ >= 9;
                if (v15)
                {
                  v20 = 0;
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_91:
          v68 = 24;
          goto LABEL_100;
        case 5u:
          v44 = 0;
          v45 = 0;
          v20 = 0;
          *(_WORD *)(a1 + 76) |= 8u;
          while (2)
          {
            v46 = *v3;
            v47 = *(_QWORD *)(a2 + v46);
            v48 = v47 + 1;
            if (v47 == -1 || v48 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v47);
              *(_QWORD *)(a2 + v46) = v48;
              v20 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                v15 = v45++ >= 9;
                if (v15)
                {
                  v20 = 0;
                  goto LABEL_95;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_95:
          v68 = 32;
          goto LABEL_100;
        case 6u:
          v50 = 0;
          v51 = 0;
          v20 = 0;
          *(_WORD *)(a1 + 76) |= 2u;
          while (2)
          {
            v52 = *v3;
            v53 = *(_QWORD *)(a2 + v52);
            v54 = v53 + 1;
            if (v53 == -1 || v54 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v53);
              *(_QWORD *)(a2 + v52) = v54;
              v20 |= (unint64_t)(v55 & 0x7F) << v50;
              if (v55 < 0)
              {
                v50 += 7;
                v15 = v51++ >= 9;
                if (v15)
                {
                  v20 = 0;
                  goto LABEL_99;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_99:
          v68 = 16;
LABEL_100:
          *(_QWORD *)(a1 + v68) = v20;
          continue;
        case 7u:
          v56 = 0;
          v57 = 0;
          v58 = 0;
          *(_WORD *)(a1 + 76) |= 0x100u;
          break;
        case 8u:
          *(_WORD *)(a1 + 76) |= 0x80u;
          v63 = *v3;
          v64 = *(_QWORD *)(a2 + v63);
          if (v64 <= 0xFFFFFFFFFFFFFFF7 && v64 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v65 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v64);
            *(_QWORD *)(a2 + v63) = v64 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v65 = 0;
          }
          v69 = 64;
          goto LABEL_109;
        case 9u:
          *(_WORD *)(a1 + 76) |= 1u;
          v66 = *v3;
          v67 = *(_QWORD *)(a2 + v66);
          if (v67 <= 0xFFFFFFFFFFFFFFF7 && v67 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v65 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v67);
            *(_QWORD *)(a2 + v66) = v67 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v65 = 0;
          }
          v69 = 8;
LABEL_109:
          *(_QWORD *)(a1 + v69) = v65;
          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v59 = *v3;
        v60 = *(_QWORD *)(a2 + v59);
        v61 = v60 + 1;
        if (v60 == -1 || v61 > *(_QWORD *)(a2 + *v4))
          break;
        v62 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v60);
        *(_QWORD *)(a2 + v59) = v61;
        v58 |= (unint64_t)(v62 & 0x7F) << v56;
        if ((v62 & 0x80) == 0)
          goto LABEL_102;
        v56 += 7;
        v15 = v57++ >= 9;
        if (v15)
        {
          v58 = 0;
          goto LABEL_104;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_102:
      if (*(_BYTE *)(a2 + *v5))
        v58 = 0;
LABEL_104:
      *(_BYTE *)(a1 + 72) = v58 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

uint64_t ATXPBSpotlightUIEventReadFrom(uint64_t a1, uint64_t a2)
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
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;

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
          v18 = 40;
          goto LABEL_25;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_25;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_25;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
LABEL_25:
          v20 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 5u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 48) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          break;
        v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
        *(_QWORD *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0)
          goto LABEL_34;
        v21 += 7;
        v14 = v22++ >= 9;
        if (v14)
        {
          v23 = 0;
          goto LABEL_36;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
      if (*(_BYTE *)(a2 + *v5))
        v23 = 0;
LABEL_36:
      *(_QWORD *)(a1 + 8) = v23;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 2u);
}

const __CFString *stringForATXSuggestionPredictionReasonCode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x2A)
    return CFSTR("Generic");
  else
    return off_1E57CF608[a1 - 1];
}

void ATXSuggestionPredictionReasonEnumerateReasonCodes(unint64_t a1, void *a2)
{
  uint64_t i;
  void (**v4)(id, _QWORD);

  v4 = a2;
  if (a1)
  {
    for (i = 0; i != 43; ++i)
    {
      if (((a1 >> i) & 1) != 0)
        v4[2](v4, i);
    }
  }

}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return objc_opt_class();
}

_BYTE *OUTLINED_FUNCTION_13(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void sub_1AA882F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a51, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1AA884080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AA8843B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t ATXPBRequestForIntentSuggestionsReadFrom(uint64_t a1, uint64_t a2)
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
  ATXPBRequestForSuggestions *v17;
  uint64_t result;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;

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
          v17 = objc_alloc_init(ATXPBRequestForSuggestions);
          objc_storeStrong((id *)(a1 + 8), v17);
          if (PBReaderPlaceMark() && (ATXPBRequestForSuggestionsReadFrom((uint64_t)v17, a2) & 1) != 0)
          {
            PBReaderRecallMark();
            goto LABEL_28;
          }

          return 0;
        case 2u:
          PBReaderReadString();
          v17 = (ATXPBRequestForSuggestions *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend((id)a1, "addBundleIds:", v17);
          goto LABEL_28;
        case 3u:
          PBReaderReadString();
          v17 = (ATXPBRequestForSuggestions *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend((id)a1, "addIntentClassNames:", v17);
LABEL_28:

          continue;
        case 4u:
          v19 = 0;
          v20 = 0;
          v21 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
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
          goto LABEL_37;
        v19 += 7;
        v14 = v20++ >= 9;
        if (v14)
        {
          LODWORD(v21) = 0;
          goto LABEL_39;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v21) = 0;
LABEL_39:
      *(_DWORD *)(a1 + 32) = v21;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1AA88694C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location)
{
  id *v34;
  uint64_t v35;

  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t ATXMPBBlendingClientModelEngagementClientCacheAgeTrackerReadFrom(uint64_t a1, uint64_t a2)
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
  BOOL v16;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  void *v26;

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
        if (v15)
          v16 = 1;
        else
          v16 = (v10 & 7) == 4;
        if (!v16)
        {
          switch((v10 >> 3))
          {
            case 1u:
              v17 = 0;
              v18 = 0;
              v19 = 0;
              *(_BYTE *)(a1 + 36) |= 1u;
              break;
            case 2u:
              PBReaderReadString();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = 16;
              goto LABEL_31;
            case 3u:
              PBReaderReadString();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = 24;
              goto LABEL_31;
            case 4u:
              PBReaderReadString();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = 8;
LABEL_31:
              v26 = *(void **)(a1 + v25);
              *(_QWORD *)(a1 + v25) = v24;

              goto LABEL_36;
            default:
              result = PBReaderSkipValueWithTag();
              if (!(_DWORD)result)
                return result;
LABEL_36:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
          }
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
              goto LABEL_33;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_35;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_35:
          *(_DWORD *)(a1 + 32) = v19;
          goto LABEL_36;
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1AA889DE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t ATXPBRequestForInteractionSuggestionsReadFrom(uint64_t a1, uint64_t a2)
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
  int v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;

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
          v13 = v12 + 1;
          if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
            break;
          v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
          *(_QWORD *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0)
            goto LABEL_12;
          v8 += 7;
          if (v9++ >= 9)
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
        if (v16)
          v17 = 1;
        else
          v17 = (v10 & 7) == 4;
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              PBReaderReadString();
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = 40;
              goto LABEL_25;
            case 2u:
              PBReaderReadString();
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = 24;
              goto LABEL_25;
            case 3u:
              PBReaderReadString();
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = 16;
              goto LABEL_25;
            case 4u:
              PBReaderReadData();
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = 32;
LABEL_25:
              v21 = *(void **)(a1 + v19);
              *(_QWORD *)(a1 + v19) = v18;

              goto LABEL_26;
            case 5u:
              *(_BYTE *)(a1 + 48) |= 1u;
              v22 = *v3;
              v23 = *(_QWORD *)(a2 + v22);
              if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v24 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v23);
                *(_QWORD *)(a2 + v22) = v23 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v24 = 0;
              }
              *(_QWORD *)(a1 + 8) = v24;
              goto LABEL_26;
            default:
              result = PBReaderSkipValueWithTag();
              if (!(_DWORD)result)
                return result;
LABEL_26:
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

uint64_t OUTLINED_FUNCTION_3_1()
{
  return objc_opt_class();
}

void sub_1AA894928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

id ATXProactiveSuggestionRealTimeProviderXPCInterface()
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

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEB98DD8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1AF421DC4]();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0, 0);
  objc_autoreleasePoolPop(v1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_suggestionsForInteractionSuggestionRequest_clientModelId_reply_, 0, 0);

  v3 = (void *)MEMORY[0x1AF421DC4]();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0, 0);
  objc_autoreleasePoolPop(v3);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_suggestionsForInteractionSuggestionRequest_clientModelId_reply_, 0, 1);

  v5 = (void *)MEMORY[0x1AF421DC4]();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0, 0);
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_suggestionsForContextualActionSuggestionRequest_clientModelId_reply_, 0, 0);

  v7 = (void *)MEMORY[0x1AF421DC4]();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0, 0);
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_suggestionsForContextualActionSuggestionRequest_clientModelId_reply_, 0, 1);

  v9 = (void *)MEMORY[0x1AF421DC4]();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0, 0);
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_suggestionsForIntentSuggestionRequest_clientModelId_reply_, 0, 0);

  v11 = (void *)MEMORY[0x1AF421DC4]();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0, 0);
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_suggestionsForIntentSuggestionRequest_clientModelId_reply_, 0, 1);

  return v0;
}

uint64_t ATXPBSuggestionLayoutListReadFrom(uint64_t a1, uint64_t a2)
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
  ATXPBSuggestionLayout *v17;
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
        v17 = objc_alloc_init(ATXPBSuggestionLayout);
        -[ATXPBSuggestionLayoutList addLayout:](a1, v17);
        if (!PBReaderPlaceMark() || (ATXPBSuggestionLayoutReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

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

uint64_t ATXMPBBlendingClientModelEngagementTrackerReadFrom(uint64_t a1, uint64_t a2)
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
  char v41;
  unsigned int v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  void *v46;
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
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 56;
          goto LABEL_61;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_61;
        case 3u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 72) |= 8u;
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
                  LODWORD(v22) = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_65:
          v47 = 64;
          goto LABEL_82;
        case 4u:
          v26 = 0;
          v27 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 72) |= 0x10u;
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
              v22 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_69:
          v47 = 68;
          goto LABEL_82;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_61;
        case 6u:
          v31 = 0;
          v32 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 72) |= 4u;
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
              v22 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                v14 = v32++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_73:
          v47 = 52;
          goto LABEL_82;
        case 7u:
          v36 = 0;
          v37 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 72) |= 2u;
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
              v22 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                v14 = v37++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_77:
          v47 = 48;
          goto LABEL_82;
        case 8u:
          v41 = 0;
          v42 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 72) |= 1u;
          break;
        case 9u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_61;
        case 0xAu:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
LABEL_61:
          v46 = *(void **)(a1 + v18);
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
        v43 = *v3;
        v44 = *(_QWORD *)(a2 + v43);
        if (v44 == -1 || v44 >= *(_QWORD *)(a2 + *v4))
          break;
        v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v44);
        *(_QWORD *)(a2 + v43) = v44 + 1;
        v22 |= (unint64_t)(v45 & 0x7F) << v41;
        if ((v45 & 0x80) == 0)
          goto LABEL_79;
        v41 += 7;
        v14 = v42++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_81;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_79:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_81:
      v47 = 24;
LABEL_82:
      *(_DWORD *)(a1 + v47) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ATXPBLightweightClientModelCacheUpdateReadFrom(uint64_t a1, uint64_t a2)
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
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  ATXPBLightweightProactiveSuggestion *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;

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
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
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
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 32;
        goto LABEL_26;
      case 2u:
        v21 = objc_alloc_init(ATXPBLightweightProactiveSuggestion);
        objc_msgSend((id)a1, "addSuggestions:", v21);
        if (PBReaderPlaceMark()
          && (ATXPBLightweightProactiveSuggestionReadFrom((uint64_t)v21, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_32:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 3u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
LABEL_26:
        v22 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_32;
      case 4u:
        *(_BYTE *)(a1 + 40) |= 1u;
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v25 = 0;
        }
        *(_QWORD *)(a1 + 8) = v25;
        goto LABEL_32;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_32;
    }
  }
}

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t ATXPBShortcutsEditorEventMetadataReadFrom(uint64_t a1, uint64_t a2)
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
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
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

uint64_t ATXMPBBlendingSessionEngagementTrackerReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
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
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 8;
      }
      else
      {
        if ((_DWORD)v17 == 2)
        {
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 28) |= 1u;
          while (1)
          {
            v24 = *v3;
            v25 = *(_QWORD *)(a2 + v24);
            if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
              break;
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if ((v26 & 0x80) == 0)
              goto LABEL_34;
            v21 += 7;
            v14 = v22++ >= 9;
            if (v14)
            {
              LODWORD(v23) = 0;
              goto LABEL_36;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v23) = 0;
LABEL_36:
          *(_DWORD *)(a1 + 24) = v23;
          continue;
        }
        if ((_DWORD)v17 != 1)
        {
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
        }
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
      }
      v20 = *(void **)(a1 + v19);
      *(_QWORD *)(a1 + v19) = v18;

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ATXPBResponseForRequestForSuggestionsReadFrom(uint64_t a1, uint64_t a2)
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
  ATXPBProactiveSuggestion *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;
  uint64_t result;

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
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 64;
        goto LABEL_32;
      case 2u:
        v19 = objc_alloc_init(ATXPBProactiveSuggestion);
        objc_msgSend((id)a1, "addSuggestions:", v19);
        if (!PBReaderPlaceMark() || !ATXPBProactiveSuggestionReadFrom((uint64_t)v19, a2))
          goto LABEL_50;
        goto LABEL_43;
      case 3u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
        goto LABEL_32;
      case 4u:
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 72) |= 1u;
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
                LODWORD(v22) = 0;
                goto LABEL_47;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_47:
        *(_DWORD *)(a1 + 48) = v22;
        goto LABEL_48;
      case 5u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
LABEL_32:
        v26 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_48;
      case 0xAu:
        v19 = objc_alloc_init(ATXPBRequestForInteractionSuggestions);
        objc_storeStrong((id *)(a1 + 40), v19);
        if (!PBReaderPlaceMark()
          || (ATXPBRequestForInteractionSuggestionsReadFrom((uint64_t)v19, a2) & 1) == 0)
        {
          goto LABEL_50;
        }
        goto LABEL_43;
      case 0xBu:
        v19 = objc_alloc_init(ATXPBRequestForContextualActionSuggestions);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (!PBReaderPlaceMark()
          || (ATXPBRequestForContextualActionSuggestionsReadFrom((uint64_t)v19, a2) & 1) == 0)
        {
          goto LABEL_50;
        }
        goto LABEL_43;
      case 0xCu:
        v19 = objc_alloc_init(ATXPBRequestForIntentSuggestions);
        objc_storeStrong((id *)(a1 + 32), v19);
        if (PBReaderPlaceMark() && (ATXPBRequestForIntentSuggestionsReadFrom((uint64_t)v19, a2) & 1) != 0)
        {
LABEL_43:
          PBReaderRecallMark();

LABEL_48:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_50:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_48;
    }
  }
}

const __CFString *stringForATXTrendPlotGranularity(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("None");
  else
    return off_1E57CFD40[a1 - 1];
}

void sub_1AA89CF50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ATXMPBBlendingClientModelEngagementUICacheAgeTrackerReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v25;
  void *v26;
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
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 8;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
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
                goto LABEL_34;
              v18 += 7;
              v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
            if (*(_BYTE *)(a2 + *v5))
              LODWORD(v20) = 0;
LABEL_36:
            *(_DWORD *)(a1 + 24) = v20;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 16;
      }
      v26 = *(void **)(a1 + v25);
      *(_QWORD *)(a1 + v25) = v24;

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ATXPBRequestForSuggestionsReadFrom(uint64_t a1, uint64_t a2)
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
  int v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t result;
  void *v24;

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
          v13 = v12 + 1;
          if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
            break;
          v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
          *(_QWORD *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0)
            goto LABEL_12;
          v8 += 7;
          if (v9++ >= 9)
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
        if (v16)
          v17 = 1;
        else
          v17 = (v10 & 7) == 4;
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              PBReaderReadString();
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = 32;
              goto LABEL_27;
            case 2u:
              PBReaderReadString();
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = 24;
              goto LABEL_27;
            case 3u:
              PBReaderReadString();
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = 16;
LABEL_27:
              v24 = *(void **)(a1 + v19);
              *(_QWORD *)(a1 + v19) = v18;

              goto LABEL_30;
            case 4u:
              *(_BYTE *)(a1 + 40) |= 1u;
              v20 = *v3;
              v21 = *(_QWORD *)(a2 + v20);
              if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v21);
                *(_QWORD *)(a2 + v20) = v21 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v22 = 0;
              }
              *(_QWORD *)(a1 + 8) = v22;
              goto LABEL_30;
            default:
              result = PBReaderSkipValueWithTag();
              if (!(_DWORD)result)
                return result;
LABEL_30:
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

id ATXInfoSuggestionXPCInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEB98E98);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1AF421DC4]();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_timelineDidReloadForWidget_parentApp_withEntries_completion_, 0, 0);

  v3 = (void *)MEMORY[0x1AF421DC4]();
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v5 = objc_opt_class();
  v6 = (void *)objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v3);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_timelineDidReloadForWidget_parentApp_withEntries_completion_, 2, 0);

  v7 = (void *)MEMORY[0x1AF421DC4]();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_userDidDismissSuggestion_isDismissalLongTerm_completion_, 0, 0);

  v9 = (void *)MEMORY[0x1AF421DC4]();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_stackDidRotateProactivelyForInfoSuggestion_isStalenessRotation_, 0, 0);

  return v0;
}

id ATXCreateProactiveSuggestionClientModelXPCInterface()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEB8CE48);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1AF421DC4]();
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  v4 = (void *)objc_msgSend(v2, "initWithObjects:", v3, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_clientModelUpdatedSuggestions_feedbackMetadata_clientModelId_completion_, 0, 0);

  v5 = (void *)MEMORY[0x1AF421DC4]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_retrieveSuggestionsForClientModelId_reply_, 0, 1);

  v9 = (void *)MEMORY[0x1AF421DC4]();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0, 0);
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_generateLayoutForRequest_reply_, 0, 0);

  v11 = (void *)MEMORY[0x1AF421DC4]();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0, 0);
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_generateLayoutForRequest_reply_, 0, 1);

  v13 = (void *)MEMORY[0x1AF421DC4]();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0, 0);
  objc_autoreleasePoolPop(v13);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_generateRankedSuggestionsForRequest_limit_reply_, 0, 0);

  v15 = (void *)MEMORY[0x1AF421DC4]();
  v16 = objc_alloc(MEMORY[0x1E0C99E60]);
  v17 = objc_opt_class();
  v18 = (void *)objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v15);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_generateRankedSuggestionsForRequest_limit_reply_, 0, 1);

  return v0;
}

uint64_t ATXPBBiomeProactiveSuggestionUIFeedbackResultReadFrom(_BYTE *a1, uint64_t a2)
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
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  ATXPBLightweightProactiveSuggestion *v29;
  uint64_t v30;

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
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
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
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 72;
        goto LABEL_28;
      case 2u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 32;
        goto LABEL_28;
      case 3u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 40;
        goto LABEL_28;
      case 4u:
        a1[88] |= 1u;
        v21 = *v3;
        v22 = *(_QWORD *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v23 = 0;
        }
        v30 = 8;
        goto LABEL_47;
      case 5u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 48;
LABEL_28:
        v24 = *(void **)&a1[v19];
        *(_QWORD *)&a1[v19] = v18;

        goto LABEL_48;
      case 6u:
        a1[88] |= 4u;
        v25 = *v3;
        v26 = *(_QWORD *)(a2 + v25);
        if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v26);
          *(_QWORD *)(a2 + v25) = v26 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v23 = 0;
        }
        v30 = 24;
        goto LABEL_47;
      case 7u:
        a1[88] |= 2u;
        v27 = *v3;
        v28 = *(_QWORD *)(a2 + v27);
        if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v23 = 0;
        }
        v30 = 16;
LABEL_47:
        *(_QWORD *)&a1[v30] = v23;
        goto LABEL_48;
      case 8u:
        v29 = objc_alloc_init(ATXPBLightweightProactiveSuggestion);
        objc_msgSend(a1, "addShownSuggestions:", v29);
        goto LABEL_38;
      case 9u:
        v29 = objc_alloc_init(ATXPBLightweightProactiveSuggestion);
        objc_msgSend(a1, "addEngagedSuggestions:", v29);
        goto LABEL_38;
      case 0xAu:
        v29 = objc_alloc_init(ATXPBLightweightProactiveSuggestion);
        objc_msgSend(a1, "addRejectedSuggestions:", v29);
LABEL_38:
        if (PBReaderPlaceMark()
          && (ATXPBLightweightProactiveSuggestionReadFrom((uint64_t)v29, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_48:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_48;
    }
  }
}

uint64_t ATXBucketUInt32BetweenValuesWithRounding()
{
  return MEMORY[0x1E0CF93A0]();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

uint64_t INIntentWithTypedIntent()
{
  return MEMORY[0x1E0CBD4A0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
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

uint64_t PBRepeatedDoubleAdd()
{
  return MEMORY[0x1E0D82D68]();
}

uint64_t PBRepeatedDoubleClear()
{
  return MEMORY[0x1E0D82D70]();
}

uint64_t PBRepeatedDoubleCopy()
{
  return MEMORY[0x1E0D82D78]();
}

uint64_t PBRepeatedDoubleHash()
{
  return MEMORY[0x1E0D82D80]();
}

uint64_t PBRepeatedDoubleIsEqual()
{
  return MEMORY[0x1E0D82D88]();
}

uint64_t PBRepeatedDoubleNSArray()
{
  return MEMORY[0x1E0D82D90]();
}

uint64_t PBRepeatedDoubleSet()
{
  return MEMORY[0x1E0D82D98]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _PASIsInternalDevice()
{
  return MEMORY[0x1E0D816E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
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

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

