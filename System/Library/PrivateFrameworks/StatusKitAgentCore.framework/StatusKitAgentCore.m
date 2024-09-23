void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_2188E3854(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_2188E3F44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_2188E7A40(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_2188E9988(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_2188E9B68(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2188E9CE4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t SharedChannelPublishOffGridPayloadRequestReadFrom(uint64_t a1, uint64_t a2)
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
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
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
      if ((v10 >> 3) == 2)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
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
            goto LABEL_31;
          v19 += 7;
          v14 = v20++ >= 9;
          if (v14)
          {
            v21 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_33:
        *(_QWORD *)(a1 + 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v17;

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

uint64_t SharedChannelCreateRequestReadFrom(uint64_t a1, uint64_t a2)
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
  AuthCredential *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  void *v27;

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
        v18 = 32;
        goto LABEL_33;
      case 2u:
        v20 = objc_alloc_init(AuthCredential);
        objc_storeStrong((id *)(a1 + 16), v20);
        if (PBReaderPlaceMark() && (AuthCredentialReadFrom((uint64_t)v20, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_38:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 3u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 40) |= 1u;
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
                goto LABEL_37;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_37:
        *(_DWORD *)(a1 + 24) = v23;
        goto LABEL_38;
      case 4u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_33:
        v27 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_38;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_38;
    }
  }
}

uint64_t DecryptedParticipantPayloadReadFrom(uint64_t a1, uint64_t a2)
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
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_32;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_32;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_32;
        case 4u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 48) |= 1u;
          break;
        case 5u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
LABEL_32:
          v26 = *(void **)(a1 + v18);
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
          v22 = 0;
          goto LABEL_36;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
      if (*(_BYTE *)(a2 + *v5))
        v22 = 0;
LABEL_36:
      *(_QWORD *)(a1 + 8) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_2188EDAC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  id *v22;
  id *v23;
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

uint64_t ChannelActivityPollingResponseReadFrom(_QWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  unint64_t v8;
  int *v9;
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
  uint64_t result;
  uint64_t v26;
  void *v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  unint64_t v40;
  ChannelActivityParticipantPayload *v41;
  char v42;
  unsigned int v43;
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
  uint64_t v57;
  uint64_t v58;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = 0x254FFF000uLL;
  v8 = 0x254FFF000uLL;
  v9 = (int *)MEMORY[0x24BE7AF30];
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
      v15 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v14);
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
        *((_BYTE *)a1 + *(int *)(v7 + 2664)) |= 0x10u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_68;
          v19 += 7;
          v16 = v20++ >= 9;
          if (v16)
          {
            LODWORD(v21) = 0;
            goto LABEL_70;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_68:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_70:
        v57 = *(int *)(v8 + 2668);
        goto LABEL_92;
      case 2u:
        PBReaderReadData();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)a1[6];
        a1[6] = v26;

        goto LABEL_93;
      case 3u:
        v28 = 0;
        v29 = 0;
        v30 = 0;
        *((_BYTE *)a1 + *(int *)(v7 + 2664)) |= 1u;
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
            v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v32);
            *(_QWORD *)(a2 + v31) = v32 + 1;
            v30 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              v16 = v29++ >= 9;
              if (v16)
              {
                v30 = 0;
                goto LABEL_74;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v30 = 0;
LABEL_74:
        v58 = 1;
        goto LABEL_79;
      case 4u:
        v34 = 0;
        v35 = 0;
        v30 = 0;
        *((_BYTE *)a1 + *(int *)(v7 + 2664)) |= 2u;
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
            v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v37);
            *(_QWORD *)(a2 + v36) = v37 + 1;
            v30 |= (unint64_t)(v38 & 0x7F) << v34;
            if (v38 < 0)
            {
              v34 += 7;
              v16 = v35++ >= 9;
              if (v16)
              {
                v30 = 0;
                goto LABEL_78;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v30 = 0;
LABEL_78:
        v58 = 2;
LABEL_79:
        a1[v58] = v30;
        goto LABEL_93;
      case 5u:
        v39 = v7;
        v40 = v8;
        v41 = objc_alloc_init(ChannelActivityParticipantPayload);
        objc_msgSend(a1, "addParticipantPayload:", v41);
        if (PBReaderPlaceMark() && (ChannelActivityParticipantPayloadReadFrom((uint64_t)v41, a2) & 1) != 0)
        {
          PBReaderRecallMark();

          v8 = v40;
          v7 = v39;
LABEL_93:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 6u:
        v42 = 0;
        v43 = 0;
        v21 = 0;
        *((_BYTE *)a1 + *(int *)(v7 + 2664)) |= 4u;
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
            v46 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v45);
            *(_QWORD *)(a2 + v44) = v45 + 1;
            v21 |= (unint64_t)(v46 & 0x7F) << v42;
            if (v46 < 0)
            {
              v42 += 7;
              v16 = v43++ >= 9;
              if (v16)
              {
                LODWORD(v21) = 0;
                goto LABEL_83;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_83:
        v57 = 32;
        goto LABEL_92;
      case 7u:
        v47 = 0;
        v48 = 0;
        v21 = 0;
        *((_BYTE *)a1 + *(int *)(v7 + 2664)) |= 0x20u;
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
            v51 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v50);
            *(_QWORD *)(a2 + v49) = v50 + 1;
            v21 |= (unint64_t)(v51 & 0x7F) << v47;
            if (v51 < 0)
            {
              v47 += 7;
              v16 = v48++ >= 9;
              if (v16)
              {
                LODWORD(v21) = 0;
                goto LABEL_87;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_87:
        v57 = 44;
        goto LABEL_92;
      case 8u:
        v52 = 0;
        v53 = 0;
        v21 = 0;
        *((_BYTE *)a1 + *(int *)(v7 + 2664)) |= 8u;
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
            v56 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v55);
            *(_QWORD *)(a2 + v54) = v55 + 1;
            v21 |= (unint64_t)(v56 & 0x7F) << v52;
            if (v56 < 0)
            {
              v52 += 7;
              v16 = v53++ >= 9;
              if (v16)
              {
                LODWORD(v21) = 0;
                goto LABEL_91;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_91:
        v57 = 36;
LABEL_92:
        *(_DWORD *)((char *)a1 + v57) = v21;
        goto LABEL_93;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_93;
    }
  }
}

void sub_2188F07D8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_2188F1520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v9);
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

void sub_2188F28CC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_2188F9AEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2188F9C30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2188FD334(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2188FFC5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_13(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_17(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_21890051C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_218900EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  uint64_t v13;

  objc_destroyWeak((id *)(v13 - 136));
  _Unwind_Resume(a1);
}

void sub_218901CDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  uint64_t v11;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 96));
  _Unwind_Resume(a1);
}

void sub_21890280C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_218902F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  uint64_t v12;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 96));
  _Unwind_Resume(a1);
}

void sub_218903A38(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
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

void sub_218903EE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218907DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  uint64_t v9;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v9 - 128));
  _Unwind_Resume(a1);
}

void sub_21890841C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_2189095FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_14_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_15_0(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "status");
}

BOOL SharedChannelPublishResponseReadFrom(uint64_t a1, uint64_t a2)
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
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  BOOL v23;
  int *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;

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
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 16) |= 2u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
          {
            v24 = &OBJC_IVAR___SharedChannelPublishResponse__status;
            goto LABEL_38;
          }
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            break;
          v17 += 7;
          v23 = v18++ > 8;
          if (v23)
          {
            LODWORD(v19) = 0;
            v24 = &OBJC_IVAR___SharedChannelPublishResponse__status;
            goto LABEL_41;
          }
        }
        v24 = &OBJC_IVAR___SharedChannelPublishResponse__status;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_41:
        *(_DWORD *)(a1 + *v24) = v19;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_42:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v25 = 0;
    v26 = 0;
    v19 = 0;
    *(_BYTE *)(a1 + 16) |= 1u;
    while (1)
    {
      v27 = *v3;
      v28 = *(_QWORD *)(a2 + v27);
      if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
        break;
      v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
      *(_QWORD *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        v24 = &OBJC_IVAR___SharedChannelPublishResponse__retryIntervalSeconds;
        goto LABEL_39;
      }
      v25 += 7;
      v23 = v26++ > 8;
      if (v23)
      {
        LODWORD(v19) = 0;
        v24 = &OBJC_IVAR___SharedChannelPublishResponse__retryIntervalSeconds;
        goto LABEL_41;
      }
    }
    v24 = &OBJC_IVAR___SharedChannelPublishResponse__retryIntervalSeconds;
LABEL_38:
    *(_BYTE *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SharedChannelProvisionOffGridPacketInfoReadFrom(uint64_t a1, uint64_t a2)
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
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_32;
        case 2u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_32;
        case 3u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 48) |= 1u;
          break;
        case 4u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_32;
        case 5u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
LABEL_32:
          v26 = *(void **)(a1 + v18);
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
          v22 = 0;
          goto LABEL_36;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
      if (*(_BYTE *)(a2 + *v5))
        v22 = 0;
LABEL_36:
      *(_QWORD *)(a1 + 8) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL SharedChannelProvisionOffGridPayloadRequestReadFrom(uint64_t a1, uint64_t a2)
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
  AuthCredential *v17;

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
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(AuthCredential);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (AuthCredentialReadFrom((uint64_t)v17, a2) & 1) == 0)
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
    v17 = objc_alloc_init(ChannelDeferredPublishInfo);
    objc_storeStrong((id *)(a1 + 16), v17);
    if (!PBReaderPlaceMark() || (ChannelDeferredPublishInfoReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SharedChannelProvisionStoragePacketInfoReadFrom(uint64_t a1, uint64_t a2)
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

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
              *(_BYTE *)(a1 + 40) |= 1u;
              break;
            case 2u:
              PBReaderReadData();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = 24;
              goto LABEL_31;
            case 3u:
              PBReaderReadData();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = 16;
              goto LABEL_31;
            case 4u:
              PBReaderReadData();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = 32;
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
              v19 = 0;
              goto LABEL_35;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_35:
          *(_QWORD *)(a1 + 8) = v19;
          goto LABEL_36;
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SharedChannelProvisionStorageValueReadFrom(uint64_t a1, uint64_t a2)
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
  SharedChannelProvisionStoragePacketInfo *v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
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
      if ((v10 >> 3) == 2)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
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
            goto LABEL_33;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_35:
        *(_DWORD *)(a1 + 16) = v20;
      }
      else if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(SharedChannelProvisionStoragePacketInfo);
        objc_msgSend((id)a1, "addChannelPublishProvisionPacketInfo:", v17);
        if (!PBReaderPlaceMark()
          || (SharedChannelProvisionStoragePacketInfoReadFrom((uint64_t)v17, a2) & 1) == 0)
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

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_218915650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

uint64_t ChannelActivityParticipantPayloadReadFrom(uint64_t a1, uint64_t a2)
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
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
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
      if ((v10 >> 3) == 2)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
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
            goto LABEL_31;
          v19 += 7;
          v14 = v20++ >= 9;
          if (v14)
          {
            v21 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_33:
        *(_QWORD *)(a1 + 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v17;

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

uint64_t ChannelIdentityReadFrom(uint64_t a1, uint64_t a2)
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
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_24;
        case 2u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_24;
        case 3u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
LABEL_24:
          v20 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 4u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
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
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          break;
        v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
        *(_QWORD *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0)
          goto LABEL_33;
        v21 += 7;
        v14 = v22++ >= 9;
        if (v14)
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
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

uint64_t SharedChannelPublishPayloadReadFrom(uint64_t a1, uint64_t a2)
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
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
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
      if ((v10 >> 3) == 2)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
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
            goto LABEL_31;
          v19 += 7;
          v14 = v20++ >= 9;
          if (v14)
          {
            v21 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_33:
        *(_QWORD *)(a1 + 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v17;

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

uint64_t SharedChannelCreateResponseReadFrom(uint64_t a1, uint64_t a2)
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
  ChannelIdentity *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;

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
        *(_BYTE *)(a1 + 32) |= 4u;
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
            goto LABEL_46;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_48;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_46:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_48:
        v36 = 28;
        goto LABEL_53;
      case 2u:
        v24 = objc_alloc_init(ChannelIdentity);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (PBReaderPlaceMark() && (ChannelIdentityReadFrom((uint64_t)v24, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_58:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 3u:
        v25 = 0;
        v26 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 32) |= 2u;
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
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_52:
        v36 = 24;
LABEL_53:
        *(_DWORD *)(a1 + v36) = v19;
        goto LABEL_58;
      case 4u:
        v30 = 0;
        v31 = 0;
        v32 = 0;
        *(_BYTE *)(a1 + 32) |= 1u;
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
            v32 |= (unint64_t)(v35 & 0x7F) << v30;
            if (v35 < 0)
            {
              v30 += 7;
              v14 = v31++ >= 9;
              if (v14)
              {
                v32 = 0;
                goto LABEL_57;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v32 = 0;
LABEL_57:
        *(_QWORD *)(a1 + 8) = v32;
        goto LABEL_58;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_58;
    }
  }
}

uint64_t ChannelActivityDeactivationRequestReadFrom(uint64_t a1, uint64_t a2)
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
  AuthCredential *v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  void *v27;

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
        v17 = objc_alloc_init(AuthCredential);
        objc_storeStrong((id *)(a1 + 24), v17);
        if (PBReaderPlaceMark() && (AuthCredentialReadFrom((uint64_t)v17, a2) & 1) != 0)
          goto LABEL_26;
        goto LABEL_43;
      case 2u:
        v17 = objc_alloc_init(ChannelIdentity);
        objc_storeStrong((id *)(a1 + 32), v17);
        if (PBReaderPlaceMark() && (ChannelIdentityReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_26:
          PBReaderRecallMark();

LABEL_41:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_43:

        return 0;
      case 3u:
        PBReaderReadData();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 40;
        goto LABEL_36;
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
                v23 = 0;
                goto LABEL_40;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_40:
        *(_QWORD *)(a1 + 8) = v23;
        goto LABEL_41;
      case 5u:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 16;
LABEL_36:
        v27 = *(void **)(a1 + v20);
        *(_QWORD *)(a1 + v20) = v19;

        goto LABEL_41;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_41;
    }
  }
}

void sub_2189203A8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2189204A4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t AuthCredentialReadFrom(uint64_t a1, uint64_t a2)
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
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  SharedOwnershipAuth *v24;
  uint64_t v25;
  void *v26;
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
      v17 = v10 >> 3;
      if ((v10 >> 3) == 2)
      {
        objc_msgSend((id)a1, "clearOneofValuesForAuthCredentialOneof");
        *(_BYTE *)(a1 + 32) |= 1u;
        *(_DWORD *)(a1 + 8) = 2;
        v24 = objc_alloc_init(SharedOwnershipAuth);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark() || !SharedOwnershipAuthReadFrom((uint64_t)v24, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((_DWORD)v17 == 1)
      {
        objc_msgSend((id)a1, "clearOneofValuesForAuthCredentialOneof");
        *(_BYTE *)(a1 + 32) |= 1u;
        *(_DWORD *)(a1 + 8) = 1;
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v25;

      }
      else if ((_DWORD)v17)
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
      else
      {
        v18 = 0;
        while (1)
        {
          v19 = *v3;
          v20 = *(_QWORD *)(a2 + v19);
          if (v20 == -1 || v20 >= *(_QWORD *)(a2 + *v4))
            break;
          v21 = v20 + 1;
          v22 = *(char *)(*(_QWORD *)(a2 + *v7) + v20);
          *(_QWORD *)(a2 + v19) = v21;
          if (v22 < 0 && v18++ <= 8)
            continue;
          goto LABEL_35;
        }
        *(_BYTE *)(a2 + *v5) = 1;
      }
LABEL_35:
      ;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL SharedChannelPublishRequestReadFrom(uint64_t a1, uint64_t a2)
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
  AuthCredential *v17;

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
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(AuthCredential);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (AuthCredentialReadFrom((uint64_t)v17, a2) & 1) == 0)
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
    v17 = objc_alloc_init(ChannelPublishPayload);
    objc_storeStrong((id *)(a1 + 16), v17);
    if (!PBReaderPlaceMark() || (ChannelPublishPayloadReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ChannelPublishPayloadReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  unint64_t v26;
  unint64_t v27;
  ChannelIdentity *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
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
  void *v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = 0x254FFF000uLL;
  v8 = (int *)MEMORY[0x24BE7AF30];
  v9 = 0x254FFF000uLL;
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
        *(_BYTE *)(a1 + *(int *)(v7 + 3340)) |= 1u;
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
            goto LABEL_70;
          v19 += 7;
          v16 = v20++ >= 9;
          if (v16)
          {
            v21 = 0;
            goto LABEL_72;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_70:
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_72:
        v60 = *(int *)(v9 + 3344);
        goto LABEL_77;
      case 2u:
        v26 = v7;
        v27 = v9;
        v28 = objc_alloc_init(ChannelIdentity);
        objc_storeStrong((id *)(a1 + 32), v28);
        if (PBReaderPlaceMark() && (ChannelIdentityReadFrom((uint64_t)v28, a2) & 1) != 0)
        {
          PBReaderRecallMark();

          v9 = v27;
          v7 = v26;
LABEL_96:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 3u:
        PBReaderReadData();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = 40;
        goto LABEL_68;
      case 4u:
        v31 = 0;
        v32 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + *(int *)(v7 + 3340)) |= 2u;
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
            v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v34);
            *(_QWORD *)(a2 + v33) = v34 + 1;
            v21 |= (unint64_t)(v35 & 0x7F) << v31;
            if (v35 < 0)
            {
              v31 += 7;
              v16 = v32++ >= 9;
              if (v16)
              {
                v21 = 0;
                goto LABEL_76;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_76:
        v60 = 16;
LABEL_77:
        *(_QWORD *)(a1 + v60) = v21;
        goto LABEL_96;
      case 5u:
        v36 = 0;
        v37 = 0;
        v38 = 0;
        *(_BYTE *)(a1 + *(int *)(v7 + 3340)) |= 4u;
        while (2)
        {
          v39 = *v3;
          v40 = *(_QWORD *)(a2 + v39);
          if (v40 == -1 || v40 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v40);
            *(_QWORD *)(a2 + v39) = v40 + 1;
            v38 |= (unint64_t)(v41 & 0x7F) << v36;
            if (v41 < 0)
            {
              v36 += 7;
              v16 = v37++ >= 9;
              if (v16)
              {
                LODWORD(v38) = 0;
                goto LABEL_81;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v38) = 0;
LABEL_81:
        v61 = 48;
        goto LABEL_95;
      case 6u:
        v42 = 0;
        v43 = 0;
        v44 = 0;
        *(_BYTE *)(a1 + *(int *)(v7 + 3340)) |= 0x10u;
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
            v47 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v46);
            *(_QWORD *)(a2 + v45) = v46 + 1;
            v44 |= (unint64_t)(v47 & 0x7F) << v42;
            if (v47 < 0)
            {
              v42 += 7;
              v16 = v43++ >= 9;
              if (v16)
              {
                v44 = 0;
                goto LABEL_85;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v44 = 0;
LABEL_85:
        v62 = v44 != 0;
        v63 = 56;
        goto LABEL_90;
      case 7u:
        v48 = 0;
        v49 = 0;
        v50 = 0;
        *(_BYTE *)(a1 + *(int *)(v7 + 3340)) |= 0x20u;
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
            v53 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v52);
            *(_QWORD *)(a2 + v51) = v52 + 1;
            v50 |= (unint64_t)(v53 & 0x7F) << v48;
            if (v53 < 0)
            {
              v48 += 7;
              v16 = v49++ >= 9;
              if (v16)
              {
                v50 = 0;
                goto LABEL_89;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v50 = 0;
LABEL_89:
        v62 = v50 != 0;
        v63 = 57;
LABEL_90:
        *(_BYTE *)(a1 + v63) = v62;
        goto LABEL_96;
      case 8u:
        v54 = 0;
        v55 = 0;
        v38 = 0;
        *(_BYTE *)(a1 + *(int *)(v7 + 3340)) |= 8u;
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
            v58 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v57);
            *(_QWORD *)(a2 + v56) = v57 + 1;
            v38 |= (unint64_t)(v58 & 0x7F) << v54;
            if (v58 < 0)
            {
              v54 += 7;
              v16 = v55++ >= 9;
              if (v16)
              {
                LODWORD(v38) = 0;
                goto LABEL_94;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v38) = 0;
LABEL_94:
        v61 = 52;
LABEL_95:
        *(_DWORD *)(a1 + v61) = v38;
        goto LABEL_96;
      case 9u:
        PBReaderReadString();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = 24;
LABEL_68:
        v59 = *(void **)(a1 + v30);
        *(_QWORD *)(a1 + v30) = v29;

        goto LABEL_96;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_96;
    }
  }
}

void sub_218927798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218928630(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 80));
  _Unwind_Resume(a1);
}

void sub_218928A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218929004(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_5_2(void *a1, const char *a2)
{
  return objc_msgSend(a1, "processIdentifier");
}

void sub_2189298F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_218929D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21892A018(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL SharedChannelProvisionOffGridPayloadResponseReadFrom(uint64_t a1, uint64_t a2)
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
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  BOOL v23;
  int *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;

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
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 16) |= 2u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
          {
            v24 = &OBJC_IVAR___SharedChannelProvisionOffGridPayloadResponse__status;
            goto LABEL_38;
          }
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            break;
          v17 += 7;
          v23 = v18++ > 8;
          if (v23)
          {
            LODWORD(v19) = 0;
            v24 = &OBJC_IVAR___SharedChannelProvisionOffGridPayloadResponse__status;
            goto LABEL_41;
          }
        }
        v24 = &OBJC_IVAR___SharedChannelProvisionOffGridPayloadResponse__status;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_41:
        *(_DWORD *)(a1 + *v24) = v19;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_42:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v25 = 0;
    v26 = 0;
    v19 = 0;
    *(_BYTE *)(a1 + 16) |= 1u;
    while (1)
    {
      v27 = *v3;
      v28 = *(_QWORD *)(a2 + v27);
      if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
        break;
      v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
      *(_QWORD *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        v24 = &OBJC_IVAR___SharedChannelProvisionOffGridPayloadResponse__retryIntervalSeconds;
        goto LABEL_39;
      }
      v25 += 7;
      v23 = v26++ > 8;
      if (v23)
      {
        LODWORD(v19) = 0;
        v24 = &OBJC_IVAR___SharedChannelProvisionOffGridPayloadResponse__retryIntervalSeconds;
        goto LABEL_41;
      }
    }
    v24 = &OBJC_IVAR___SharedChannelProvisionOffGridPayloadResponse__retryIntervalSeconds;
LABEL_38:
    *(_BYTE *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL SharedChannelProvisionOffGridPacketReadFrom(uint64_t a1, uint64_t a2)
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
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_25;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_25;
        case 3u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_25;
        case 4u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
LABEL_25:
          v19 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          goto LABEL_26;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_26:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_21892DD74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  id *v22;
  id *v23;
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

uint64_t ChannelActivityUpdateReadFrom(uint64_t a1, uint64_t a2)
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
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t result;
  uint64_t v32;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
        PBReaderReadData();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v24;

      }
      else
      {
        if ((_DWORD)v17 == 2)
        {
          v26 = 0;
          v27 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 32) |= 2u;
          while (1)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
              break;
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v29 + 1;
            v20 |= (unint64_t)(v30 & 0x7F) << v26;
            if ((v30 & 0x80) == 0)
              goto LABEL_43;
            v26 += 7;
            v14 = v27++ >= 9;
            if (v14)
            {
              v20 = 0;
              goto LABEL_45;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_45:
          v32 = 16;
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
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 32) |= 1u;
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
              goto LABEL_39;
            v18 += 7;
            v14 = v19++ >= 9;
            if (v14)
            {
              v20 = 0;
              goto LABEL_41;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_41:
          v32 = 8;
        }
        *(_QWORD *)(a1 + v32) = v20;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL SignedParticipantPayloadReadFrom(uint64_t a1, uint64_t a2)
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
  DecryptedParticipantPayload *v17;
  uint64_t v18;

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
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(DecryptedParticipantPayload);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (DecryptedParticipantPayloadReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v18 = objc_claimAutoreleasedReturnValue();
    v17 = *(DecryptedParticipantPayload **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ChannelActivityUpdatePayloadReadFrom(uint64_t a1, uint64_t a2)
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
  ChannelActivityParticipantPayload *v26;
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
      if ((v10 >> 3) == 3)
      {
        PBReaderReadData();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v24;

      }
      else if ((_DWORD)v17 == 2)
      {
        v26 = objc_alloc_init(ChannelActivityParticipantPayload);
        objc_msgSend((id)a1, "addParticipantPayload:", v26);
        if (!PBReaderPlaceMark()
          || (ChannelActivityParticipantPayloadReadFrom((uint64_t)v26, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((_DWORD)v17 == 1)
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

uint64_t ChannelDeferredPublishInfoReadFrom(uint64_t a1, uint64_t a2)
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
  ChannelIdentity *v17;
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
  unint64_t v28;
  char v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;

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
        v17 = objc_alloc_init(ChannelIdentity);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (PBReaderPlaceMark() && (ChannelIdentityReadFrom((uint64_t)v17, a2) & 1) != 0)
          goto LABEL_26;
        goto LABEL_53;
      case 2u:
        v17 = objc_alloc_init(SharedChannelProvisionOffGridPacketInfo);
        objc_msgSend((id)a1, "addChannelProvisionOffGridPacketInfo:", v17);
        if (PBReaderPlaceMark()
          && (SharedChannelProvisionOffGridPacketInfoReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_26:
          PBReaderRecallMark();

LABEL_51:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_53:

        return 0;
      case 3u:
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 40) |= 1u;
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
                goto LABEL_45;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_45:
        v32 = 32;
        goto LABEL_50;
      case 4u:
        v25 = 0;
        v26 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 40) |= 2u;
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
            v21 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              v14 = v26++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_49;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_49:
        v32 = 36;
LABEL_50:
        *(_DWORD *)(a1 + v32) = v21;
        goto LABEL_51;
      case 5u:
        PBReaderReadString();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v30;

        goto LABEL_51;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_51;
    }
  }
}

BOOL SharedChannelPublishOffGridPayloadResponseReadFrom(uint64_t a1, uint64_t a2)
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
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  BOOL v23;
  int *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;

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
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 16) |= 2u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
          {
            v24 = &OBJC_IVAR___SharedChannelPublishOffGridPayloadResponse__status;
            goto LABEL_38;
          }
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            break;
          v17 += 7;
          v23 = v18++ > 8;
          if (v23)
          {
            LODWORD(v19) = 0;
            v24 = &OBJC_IVAR___SharedChannelPublishOffGridPayloadResponse__status;
            goto LABEL_41;
          }
        }
        v24 = &OBJC_IVAR___SharedChannelPublishOffGridPayloadResponse__status;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_41:
        *(_DWORD *)(a1 + *v24) = v19;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_42:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v25 = 0;
    v26 = 0;
    v19 = 0;
    *(_BYTE *)(a1 + 16) |= 1u;
    while (1)
    {
      v27 = *v3;
      v28 = *(_QWORD *)(a2 + v27);
      if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
        break;
      v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
      *(_QWORD *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        v24 = &OBJC_IVAR___SharedChannelPublishOffGridPayloadResponse__retryIntervalSeconds;
        goto LABEL_39;
      }
      v25 += 7;
      v23 = v26++ > 8;
      if (v23)
      {
        LODWORD(v19) = 0;
        v24 = &OBJC_IVAR___SharedChannelPublishOffGridPayloadResponse__retryIntervalSeconds;
        goto LABEL_41;
      }
    }
    v24 = &OBJC_IVAR___SharedChannelPublishOffGridPayloadResponse__retryIntervalSeconds;
LABEL_38:
    *(_BYTE *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ChannelActivityActivationRequestReadFrom(uint64_t a1, uint64_t a2)
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
  AuthCredential *v17;
  uint64_t result;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  void *v33;

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
        v17 = objc_alloc_init(AuthCredential);
        objc_storeStrong((id *)(a1 + 24), v17);
        if (PBReaderPlaceMark() && (AuthCredentialReadFrom((uint64_t)v17, a2) & 1) != 0)
          goto LABEL_26;
        goto LABEL_55;
      case 2u:
        v17 = objc_alloc_init(ChannelIdentity);
        objc_storeStrong((id *)(a1 + 32), v17);
        if (PBReaderPlaceMark() && (ChannelIdentityReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_26:
          PBReaderRecallMark();

LABEL_53:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_55:

        return 0;
      case 3u:
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 64) |= 2u;
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
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_48:
        *(_DWORD *)(a1 + 48) = v21;
        goto LABEL_53;
      case 4u:
        PBReaderReadData();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = 56;
        goto LABEL_44;
      case 5u:
        v27 = 0;
        v28 = 0;
        v29 = 0;
        *(_BYTE *)(a1 + 64) |= 1u;
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
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v29 = 0;
LABEL_52:
        *(_QWORD *)(a1 + 8) = v29;
        goto LABEL_53;
      case 6u:
        PBReaderReadData();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = 40;
        goto LABEL_44;
      case 7u:
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = 16;
LABEL_44:
        v33 = *(void **)(a1 + v26);
        *(_QWORD *)(a1 + v26) = v25;

        goto LABEL_53;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_53;
    }
  }
}

void sub_218933634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_218934010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218934210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2189343A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218934DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218935224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218935690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218935CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2189360E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_218936408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2189366AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2189368D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218936B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218936DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2189377A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893794C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218937DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218937FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2189384C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2189387B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218938AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218938D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893913C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2189394D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218939788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218939EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893A29C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893A670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893AB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893AD30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893B0E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893B41C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893B69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893C414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893C630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893C7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893C9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893CC34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893CEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893D1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893D3DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893D574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893DA88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893DCC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893DE5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21893E7C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_21893F7F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_21893FBB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2189402A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_218940648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_218941294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2189416D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_218941CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t ChannelActivityPollingRequestReadFrom(uint64_t a1, uint64_t a2)
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
  AuthCredential *v17;
  uint64_t result;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;

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
        v17 = objc_alloc_init(AuthCredential);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (PBReaderPlaceMark() && (AuthCredentialReadFrom((uint64_t)v17, a2) & 1) != 0)
          goto LABEL_26;
        goto LABEL_43;
      case 2u:
        v17 = objc_alloc_init(ChannelIdentity);
        objc_storeStrong((id *)(a1 + 24), v17);
        if (PBReaderPlaceMark() && (ChannelIdentityReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_26:
          PBReaderRecallMark();

LABEL_41:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_43:

        return 0;
      case 3u:
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 48) |= 1u;
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
                goto LABEL_40;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_40:
        *(_DWORD *)(a1 + 32) = v21;
        goto LABEL_41;
      case 4u:
        PBReaderReadData();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = 40;
        goto LABEL_36;
      case 5u:
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = 8;
LABEL_36:
        v27 = *(void **)(a1 + v26);
        *(_QWORD *)(a1 + v26) = v25;

        goto LABEL_41;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_41;
    }
  }
}

void sub_218946164(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_218947668(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ChannelActivityDeactivationResponseReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v24;
  void *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;

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
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 40) |= 8u;
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
              goto LABEL_51;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_53;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_51:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_53:
          v42 = 28;
          goto LABEL_67;
        case 2u:
          PBReaderReadData();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = *(void **)(a1 + 32);
          *(_QWORD *)(a1 + 32) = v24;

          continue;
        case 3u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 40) |= 1u;
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
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_57:
          v43 = 8;
          goto LABEL_62;
        case 4u:
          v32 = 0;
          v33 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 40) |= 2u;
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
              v28 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_61:
          v43 = 16;
LABEL_62:
          *(_QWORD *)(a1 + v43) = v28;
          continue;
        case 5u:
          v37 = 0;
          v38 = 0;
          v19 = 0;
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
        v39 = *v3;
        v40 = *(_QWORD *)(a2 + v39);
        if (v40 == -1 || v40 >= *(_QWORD *)(a2 + *v4))
          break;
        v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v40);
        *(_QWORD *)(a2 + v39) = v40 + 1;
        v19 |= (unint64_t)(v41 & 0x7F) << v37;
        if ((v41 & 0x80) == 0)
          goto LABEL_64;
        v37 += 7;
        v14 = v38++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_66;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_64:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_66:
      v42 = 24;
LABEL_67:
      *(_DWORD *)(a1 + v42) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SharedChannelActivityResponseReadFrom(uint64_t a1, uint64_t a2)
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
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  uint64_t result;
  ChannelActivityActivationResponse *v24;

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
      case 0u:
        v17 = 0;
        do
        {
          v18 = *v3;
          v19 = *(_QWORD *)(a2 + v18);
          if (v19 == -1 || v19 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
            goto LABEL_37;
          }
          v20 = v19 + 1;
          v21 = *(char *)(*(_QWORD *)(a2 + *v7) + v19);
          *(_QWORD *)(a2 + v18) = v20;
          if ((v21 & 0x80000000) == 0)
            break;
        }
        while (v17++ <= 8);
        goto LABEL_37;
      case 1u:
        objc_msgSend((id)a1, "clearOneofValuesForResponse");
        *(_BYTE *)(a1 + 36) |= 1u;
        *(_DWORD *)(a1 + 32) = 1;
        v24 = objc_alloc_init(ChannelActivityActivationResponse);
        objc_storeStrong((id *)(a1 + 8), v24);
        if (!PBReaderPlaceMark() || (ChannelActivityActivationResponseReadFrom(v24, a2) & 1) == 0)
          goto LABEL_41;
        goto LABEL_36;
      case 2u:
        objc_msgSend((id)a1, "clearOneofValuesForResponse");
        *(_BYTE *)(a1 + 36) |= 1u;
        *(_DWORD *)(a1 + 32) = 2;
        v24 = objc_alloc_init(ChannelActivityDeactivationResponse);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark()
          || (ChannelActivityDeactivationResponseReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_41;
        }
        goto LABEL_36;
      case 3u:
        objc_msgSend((id)a1, "clearOneofValuesForResponse");
        *(_BYTE *)(a1 + 36) |= 1u;
        *(_DWORD *)(a1 + 32) = 3;
        v24 = objc_alloc_init(ChannelActivityPollingResponse);
        objc_storeStrong((id *)(a1 + 24), v24);
        if (PBReaderPlaceMark() && (ChannelActivityPollingResponseReadFrom(v24, a2) & 1) != 0)
        {
LABEL_36:
          PBReaderRecallMark();

LABEL_37:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_41:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_37;
    }
  }
}

BOOL SharedOwnershipAuthReadFrom(uint64_t a1, uint64_t a2)
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
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_24;
        case 2u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_24;
        case 3u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_24;
        case 4u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_24;
        case 5u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
LABEL_24:
          v19 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          goto LABEL_25;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_25:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_21894B844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  id *v22;
  id *v23;
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

uint64_t ChannelActivityActivationResponseReadFrom(_QWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  unint64_t v8;
  int *v9;
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
  uint64_t result;
  uint64_t v26;
  void *v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  unint64_t v40;
  ChannelActivityParticipantPayload *v41;
  char v42;
  unsigned int v43;
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
  uint64_t v62;
  uint64_t v63;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = 0x254FFF000uLL;
  v8 = 0x254FFF000uLL;
  v9 = (int *)MEMORY[0x24BE7AF30];
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
      v15 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v14);
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
        *((_BYTE *)a1 + *(int *)(v7 + 3936)) |= 0x20u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_75;
          v19 += 7;
          v16 = v20++ >= 9;
          if (v16)
          {
            LODWORD(v21) = 0;
            goto LABEL_77;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_75:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_77:
        v62 = *(int *)(v8 + 3940);
        goto LABEL_103;
      case 2u:
        PBReaderReadData();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)a1[7];
        a1[7] = v26;

        goto LABEL_104;
      case 3u:
        v28 = 0;
        v29 = 0;
        v30 = 0;
        *((_BYTE *)a1 + *(int *)(v7 + 3936)) |= 2u;
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
            v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v32);
            *(_QWORD *)(a2 + v31) = v32 + 1;
            v30 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              v16 = v29++ >= 9;
              if (v16)
              {
                v30 = 0;
                goto LABEL_81;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v30 = 0;
LABEL_81:
        v63 = 2;
        goto LABEL_98;
      case 4u:
        v34 = 0;
        v35 = 0;
        v30 = 0;
        *((_BYTE *)a1 + *(int *)(v7 + 3936)) |= 4u;
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
            v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v37);
            *(_QWORD *)(a2 + v36) = v37 + 1;
            v30 |= (unint64_t)(v38 & 0x7F) << v34;
            if (v38 < 0)
            {
              v34 += 7;
              v16 = v35++ >= 9;
              if (v16)
              {
                v30 = 0;
                goto LABEL_85;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v30 = 0;
LABEL_85:
        v63 = 3;
        goto LABEL_98;
      case 5u:
        v39 = v7;
        v40 = v8;
        v41 = objc_alloc_init(ChannelActivityParticipantPayload);
        objc_msgSend(a1, "addParticipantPayload:", v41);
        if (PBReaderPlaceMark() && (ChannelActivityParticipantPayloadReadFrom((uint64_t)v41, a2) & 1) != 0)
        {
          PBReaderRecallMark();

          v8 = v40;
          v7 = v39;
LABEL_104:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 6u:
        v42 = 0;
        v43 = 0;
        v21 = 0;
        *((_BYTE *)a1 + *(int *)(v7 + 3936)) |= 8u;
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
            v46 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v45);
            *(_QWORD *)(a2 + v44) = v45 + 1;
            v21 |= (unint64_t)(v46 & 0x7F) << v42;
            if (v46 < 0)
            {
              v42 += 7;
              v16 = v43++ >= 9;
              if (v16)
              {
                LODWORD(v21) = 0;
                goto LABEL_89;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_89:
        v62 = 40;
        goto LABEL_103;
      case 7u:
        v47 = 0;
        v48 = 0;
        v21 = 0;
        *((_BYTE *)a1 + *(int *)(v7 + 3936)) |= 0x40u;
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
            v51 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v50);
            *(_QWORD *)(a2 + v49) = v50 + 1;
            v21 |= (unint64_t)(v51 & 0x7F) << v47;
            if (v51 < 0)
            {
              v47 += 7;
              v16 = v48++ >= 9;
              if (v16)
              {
                LODWORD(v21) = 0;
                goto LABEL_93;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_93:
        v62 = 52;
        goto LABEL_103;
      case 8u:
        v52 = 0;
        v53 = 0;
        v30 = 0;
        *((_BYTE *)a1 + *(int *)(v7 + 3936)) |= 1u;
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
            v56 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v55);
            *(_QWORD *)(a2 + v54) = v55 + 1;
            v30 |= (unint64_t)(v56 & 0x7F) << v52;
            if (v56 < 0)
            {
              v52 += 7;
              v16 = v53++ >= 9;
              if (v16)
              {
                v30 = 0;
                goto LABEL_97;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v30 = 0;
LABEL_97:
        v63 = 1;
LABEL_98:
        a1[v63] = v30;
        goto LABEL_104;
      case 9u:
        v57 = 0;
        v58 = 0;
        v21 = 0;
        *((_BYTE *)a1 + *(int *)(v7 + 3936)) |= 0x10u;
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
            v61 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v60);
            *(_QWORD *)(a2 + v59) = v60 + 1;
            v21 |= (unint64_t)(v61 & 0x7F) << v57;
            if (v61 < 0)
            {
              v57 += 7;
              v16 = v58++ >= 9;
              if (v16)
              {
                LODWORD(v21) = 0;
                goto LABEL_102;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_102:
        v62 = 44;
LABEL_103:
        *(_DWORD *)((char *)a1 + v62) = v21;
        goto LABEL_104;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_104;
    }
  }
}

uint64_t SharedChannelActivityRequestReadFrom(uint64_t a1, uint64_t a2)
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
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  uint64_t result;
  ChannelActivityActivationRequest *v24;

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
      case 0u:
        v17 = 0;
        do
        {
          v18 = *v3;
          v19 = *(_QWORD *)(a2 + v18);
          if (v19 == -1 || v19 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
            goto LABEL_37;
          }
          v20 = v19 + 1;
          v21 = *(char *)(*(_QWORD *)(a2 + *v7) + v19);
          *(_QWORD *)(a2 + v18) = v20;
          if ((v21 & 0x80000000) == 0)
            break;
        }
        while (v17++ <= 8);
        goto LABEL_37;
      case 1u:
        objc_msgSend((id)a1, "clearOneofValuesForRequest");
        *(_BYTE *)(a1 + 36) |= 1u;
        *(_DWORD *)(a1 + 32) = 1;
        v24 = objc_alloc_init(ChannelActivityActivationRequest);
        objc_storeStrong((id *)(a1 + 8), v24);
        if (!PBReaderPlaceMark() || (ChannelActivityActivationRequestReadFrom((uint64_t)v24, a2) & 1) == 0)
          goto LABEL_41;
        goto LABEL_36;
      case 2u:
        objc_msgSend((id)a1, "clearOneofValuesForRequest");
        *(_BYTE *)(a1 + 36) |= 1u;
        *(_DWORD *)(a1 + 32) = 2;
        v24 = objc_alloc_init(ChannelActivityDeactivationRequest);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark()
          || (ChannelActivityDeactivationRequestReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_41;
        }
        goto LABEL_36;
      case 3u:
        objc_msgSend((id)a1, "clearOneofValuesForRequest");
        *(_BYTE *)(a1 + 36) |= 1u;
        *(_DWORD *)(a1 + 32) = 3;
        v24 = objc_alloc_init(ChannelActivityPollingRequest);
        objc_storeStrong((id *)(a1 + 24), v24);
        if (PBReaderPlaceMark() && (ChannelActivityPollingRequestReadFrom((uint64_t)v24, a2) & 1) != 0)
        {
LABEL_36:
          PBReaderRecallMark();

LABEL_37:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_41:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_37;
    }
  }
}

uint64_t sub_21894F178()
{
  uint64_t v0;

  v0 = sub_218988E20();
  __swift_allocate_value_buffer(v0, qword_253E6EE68);
  __swift_project_value_buffer(v0, (uint64_t)qword_253E6EE68);
  return sub_218988E08();
}

Swift::Void __swiftcall SKALocalStatusServer.objcShutdown()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E840);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21898900C();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v1;
  v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  swift_retain();
  if (v7 == 1)
  {
    sub_21897FCD4((uint64_t)v3, &qword_253E6E840);
    v8 = 0;
    v9 = 0;
  }
  else
  {
    sub_218989000();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v8 = sub_218988FDC();
      v9 = v10;
      swift_unknownObjectRelease();
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = &unk_255001520;
  *(_QWORD *)(v11 + 24) = v6;
  if (v9 | v8)
  {
    v12[0] = 0;
    v12[1] = 0;
    v12[2] = v8;
    v12[3] = v9;
  }
  swift_task_create();
  swift_release();
}

uint64_t sub_21894F394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_21894F3AC()
{
  uint64_t v0;

  sub_21894F3DC();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21894F3DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t result;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  int64_t v29;
  int64_t v30;
  uint64_t v31;
  int64_t v32;
  _BYTE v33[32];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E6C8);
  MEMORY[0x24BDAC7A8]();
  v3 = &v33[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_218988C1C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = &v33[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_218988E68();
  v8 = v0 + OBJC_IVAR___SKALocalStatusServer_idsDeviceProviderToken;
  swift_beginAccess();
  sub_218980220(v8, (uint64_t)v3, &qword_253E6E6C8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_21897FCD4((uint64_t)v3, &qword_253E6E6C8);
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 32))(v7, v3, v4);
    v9 = *(void **)(v1 + 184);
    v10 = (void *)sub_218988C04();
    objc_msgSend(v9, sel_unregisterIDSDeviceChangedObserver_, v10);

    (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  }
  objc_msgSend(*(id *)(v1 + 192), sel_invalidate);
  v11 = v1 + OBJC_IVAR___SKALocalStatusServer_subscriptionSubjects;
  swift_beginAccess();
  v12 = *(_QWORD *)v11 + 64;
  v13 = 1 << *(_BYTE *)(*(_QWORD *)v11 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(*(_QWORD *)v11 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v18 = 0;
  while (1)
  {
    if (v15)
    {
      v15 &= v15 - 1;
      goto LABEL_8;
    }
    v19 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
LABEL_50:
      __break(1u);
      goto LABEL_51;
    }
    if (v19 >= v16)
      goto LABEL_26;
    v20 = *(_QWORD *)(v12 + 8 * v19);
    ++v18;
    if (!v20)
    {
      v18 = v19 + 1;
      if (v19 + 1 >= v16)
        goto LABEL_26;
      v20 = *(_QWORD *)(v12 + 8 * v18);
      if (!v20)
      {
        v18 = v19 + 2;
        if (v19 + 2 >= v16)
          goto LABEL_26;
        v20 = *(_QWORD *)(v12 + 8 * v18);
        if (!v20)
        {
          v18 = v19 + 3;
          if (v19 + 3 >= v16)
            goto LABEL_26;
          v20 = *(_QWORD *)(v12 + 8 * v18);
          if (!v20)
            break;
        }
      }
    }
LABEL_25:
    v15 = (v20 - 1) & v20;
LABEL_8:
    v33[8] = 1;
    swift_retain();
    sub_218988E2C();
    result = swift_release();
  }
  v21 = v19 + 4;
  if (v21 >= v16)
  {
LABEL_26:
    swift_release();
    v22 = (uint64_t *)(v1 + OBJC_IVAR___SKALocalStatusServer_deliverySubjects);
    swift_beginAccess();
    v23 = *v22;
    v24 = v23 + 64;
    v25 = 1 << *(_BYTE *)(v23 + 32);
    v26 = -1;
    if (v25 < 64)
      v26 = ~(-1 << v25);
    v27 = v26 & *(_QWORD *)(v23 + 64);
    v28 = (unint64_t)(v25 + 63) >> 6;
    result = swift_bridgeObjectRetain();
    v29 = 0;
    while (1)
    {
      if (v27)
      {
        v27 &= v27 - 1;
      }
      else
      {
        v30 = v29 + 1;
        if (__OFADD__(v29, 1))
          goto LABEL_50;
        if (v30 >= v28)
          return swift_release();
        v31 = *(_QWORD *)(v24 + 8 * v30);
        ++v29;
        if (!v31)
        {
          v29 = v30 + 1;
          if (v30 + 1 >= v28)
            return swift_release();
          v31 = *(_QWORD *)(v24 + 8 * v29);
          if (!v31)
          {
            v29 = v30 + 2;
            if (v30 + 2 >= v28)
              return swift_release();
            v31 = *(_QWORD *)(v24 + 8 * v29);
            if (!v31)
            {
              v29 = v30 + 3;
              if (v30 + 3 >= v28)
                return swift_release();
              v31 = *(_QWORD *)(v24 + 8 * v29);
              if (!v31)
              {
                v32 = v30 + 4;
                if (v32 >= v28)
                  return swift_release();
                v31 = *(_QWORD *)(v24 + 8 * v32);
                if (!v31)
                {
                  while (1)
                  {
                    v29 = v32 + 1;
                    if (__OFADD__(v32, 1))
                      goto LABEL_52;
                    if (v29 >= v28)
                      return swift_release();
                    v31 = *(_QWORD *)(v24 + 8 * v29);
                    ++v32;
                    if (v31)
                      goto LABEL_47;
                  }
                }
                v29 = v32;
              }
            }
          }
        }
LABEL_47:
        v27 = (v31 - 1) & v31;
      }
      v33[7] = 1;
      swift_retain();
      sub_218988E2C();
      result = swift_release();
    }
  }
  v20 = *(_QWORD *)(v12 + 8 * v21);
  if (v20)
  {
    v18 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v18 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v18 >= v16)
      goto LABEL_26;
    v20 = *(_QWORD *)(v12 + 8 * v18);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
  return result;
}

uint64_t sub_21894F800(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_21898900C();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_218989000();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_21897FCD4(a1, &qword_253E6E840);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_218988FDC();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A1D8B8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21894F990()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21894F9F0;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_21894F9F0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_21894FA60()
{
  return 0xD000000000000018;
}

uint64_t sub_21894FA7C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_21894FAA8()
{
  return 0xD00000000000001DLL;
}

uint64_t sub_21894FAC4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 128);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_21894FAF0()
{
  uint64_t v0;

  return *(id *)(v0 + 144);
}

id sub_21894FAF8()
{
  uint64_t v0;

  return *(id *)(v0 + 152);
}

id sub_21894FB00()
{
  uint64_t v0;

  return *(id *)(v0 + 160);
}

uint64_t sub_21894FB08()
{
  return swift_unknownObjectRetain();
}

id sub_21894FB10()
{
  uint64_t v0;

  return *(id *)(v0 + 176);
}

uint64_t sub_21894FB18()
{
  return swift_unknownObjectRetain();
}

id sub_21894FB20()
{
  uint64_t v0;

  return *(id *)(v0 + 192);
}

uint64_t sub_21894FB28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_218988C1C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

uint64_t sub_21894FB64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR___SKALocalStatusServer_idsDeviceProviderToken;
  swift_beginAccess();
  return sub_218980220(v3, a1, &qword_253E6E6C8);
}

uint64_t sub_21894FBBC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR___SKALocalStatusServer_idsDeviceProviderToken;
  swift_beginAccess();
  sub_218973814(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_21894FC14())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21894FC58()
{
  return sub_21894FE74();
}

uint64_t sub_21894FC64(uint64_t a1)
{
  return sub_21894FEC4(a1, &OBJC_IVAR___SKALocalStatusServer_idsDeviceRecipientIDs);
}

uint64_t (*sub_21894FC70())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21894FCB4()
{
  return sub_21894FE74();
}

uint64_t sub_21894FCC0(uint64_t a1)
{
  return sub_21894FEC4(a1, &OBJC_IVAR___SKALocalStatusServer_observationTimestamps);
}

uint64_t (*sub_21894FCCC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21894FD10()
{
  return 0;
}

uint64_t sub_21894FD18()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_21894FD60(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___SKALocalStatusServer_failedDeliveryRetryTask);
  swift_beginAccess();
  *v3 = a1;
  return swift_release();
}

uint64_t (*sub_21894FDB0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21894FDF4()
{
  return 1;
}

uint64_t sub_21894FDFC()
{
  return 259200;
}

uint64_t sub_21894FE08()
{
  return sub_21894FE74();
}

uint64_t sub_21894FE14(uint64_t a1)
{
  return sub_21894FEC4(a1, &OBJC_IVAR___SKALocalStatusServer_deliverySubjects);
}

uint64_t (*sub_21894FE20())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_21894FE68()
{
  return sub_21894FE74();
}

uint64_t sub_21894FE74()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_21894FEB8(uint64_t a1)
{
  return sub_21894FEC4(a1, &OBJC_IVAR___SKALocalStatusServer_subscriptionSubjects);
}

uint64_t sub_21894FEC4(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)(v2 + *a2);
  swift_beginAccess();
  *v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_21894FF10())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21894FF54()
{
  return 0;
}

id *SKALocalStatusServer.__allocating_init(idsDeviceProvider:)(void *a1)
{
  swift_allocObject();
  return SKALocalStatusServer.init(idsDeviceProvider:)(a1);
}

id *SKALocalStatusServer.init(idsDeviceProvider:)(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id *v35;
  id v36;
  id *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  id *v42;
  id v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  id *v48;
  id v49;
  void *v50;
  id *v51;
  id v52;
  id v53;
  void *v54;
  id *v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  id *v63;
  uint8_t *v65;
  char *v66;
  void *v67;
  char *v68;
  uint64_t v69;
  objc_class *ObjectType;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  void (*v74)(char *, uint64_t, uint64_t);
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t aBlock;
  uint64_t v79;
  uint64_t (*v80)();
  void *v81;
  void *v82;
  id *v83;
  objc_super v84;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E840);
  MEMORY[0x24BDAC7A8]();
  v76 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E6C8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_218989090();
  v71 = *(_QWORD *)(v7 - 8);
  v72 = v7;
  MEMORY[0x24BDAC7A8]();
  v73 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = sub_218989084();
  MEMORY[0x24BDAC7A8]();
  v68 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218988EBC();
  MEMORY[0x24BDAC7A8]();
  swift_defaultActor_initialize();
  v1[14] = 0xD000000000000018;
  v1[15] = 0x8000000218992C40;
  v1[16] = 0xD00000000000001DLL;
  v1[17] = 0x8000000218992C60;
  v10 = (char *)v1 + OBJC_IVAR___SKALocalStatusServer_idsDeviceProviderToken;
  v11 = sub_218988C1C();
  v74 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56);
  v75 = v11;
  v74(v10, 1, 1);
  *(_QWORD *)((char *)v1 + OBJC_IVAR___SKALocalStatusServer_failedDeliveryRetryTask) = 0;
  *((_BYTE *)v1 + OBJC_IVAR___SKALocalStatusServer_recentPendingStatus) = 1;
  *(_QWORD *)((char *)v1 + OBJC_IVAR___SKALocalStatusServer_screenOffStatusTimeoutSeconds) = 259200;
  v12 = (char *)v1 + OBJC_IVAR___SKALocalStatusServer_browseTask;
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;
  v12[16] = 0;
  sub_218973B00();
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_2189901A0;
  *(_QWORD *)(v13 + 32) = sub_218988C7C();
  *(_QWORD *)(v13 + 40) = sub_218988CC4();
  *(_QWORD *)(v13 + 48) = sub_218988CAC();
  v14 = qword_253E6EE80;
  swift_retain();
  if (v14 != -1)
    swift_once();
  v15 = sub_218988E20();
  __swift_project_value_buffer(v15, (uint64_t)qword_253E6EE68);
  swift_bridgeObjectRetain();
  v16 = sub_218988E14();
  v17 = sub_218989078();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc();
    v66 = v6;
    v19 = (uint8_t *)v18;
    v20 = swift_slowAlloc();
    v67 = a1;
    v21 = v20;
    aBlock = v20;
    *(_DWORD *)v19 = 136315138;
    v65 = v19 + 4;
    swift_bridgeObjectRetain();
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E808);
    v23 = MEMORY[0x219A1CD18](v13, v22);
    v25 = v24;
    swift_bridgeObjectRelease();
    v77 = sub_218974338(v23, v25, &aBlock);
    sub_2189890C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2188DF000, v16, v17, "Loaded XPC invocation classes: [%s]", v19, 0xCu);
    swift_arrayDestroy();
    v26 = v21;
    a1 = v67;
    MEMORY[0x219A1D978](v26, -1, -1);
    v27 = v19;
    v6 = v66;
    MEMORY[0x219A1D978](v27, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_21897FBC8(0, &qword_253E6E850);
  sub_218988EB0();
  v28 = MEMORY[0x24BEE4AF8];
  aBlock = MEMORY[0x24BEE4AF8];
  sub_218974B58(&qword_253E6E848, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E830);
  sub_21897FAFC(&qword_253E6E838, &qword_253E6E830, MEMORY[0x24BEE12C8]);
  sub_2189890F0();
  (*(void (**)(char *, _QWORD, uint64_t))(v71 + 104))(v73, *MEMORY[0x24BEE5750], v72);
  v29 = (void *)sub_2189890A8();
  v2[18] = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E800);
  sub_218988CA0();
  sub_218988C94();
  v30 = v29;
  v2[19] = sub_218988E80();
  v2[20] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SKALocalStatusServer.DatabaseDelegate()), sel_init);
  v31 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v32 = objc_msgSend(v31, sel_databaseProvider);

  v2[21] = v32;
  v2[22] = objc_msgSend(objc_allocWithZone((Class)SKADatabaseManager), sel_initWithDatabaseProvider_delegate_, v32, v2[20]);
  v2[23] = a1;
  *(_QWORD *)((char *)v2 + OBJC_IVAR___SKALocalStatusServer_idsDeviceRecipientIDs) = v28;
  v33 = objc_allocWithZone(MEMORY[0x24BE7CBF0]);
  swift_unknownObjectRetain();
  v34 = objc_msgSend(v33, sel_init);
  v2[24] = v34;
  objc_msgSend(v34, sel_setDispatchQueue_, v2[18]);
  objc_msgSend(v34, sel_setControlFlags_, 6);
  *(_QWORD *)((char *)v2 + OBJC_IVAR___SKALocalStatusServer_subscriptionSubjects) = sub_218950A18(v28, (uint64_t *)&unk_253E6E598, (uint64_t *)&unk_253E6E610);
  *(_QWORD *)((char *)v2 + OBJC_IVAR___SKALocalStatusServer_deliverySubjects) = sub_218950A18(v28, &qword_253E6E590, (uint64_t *)&unk_253E6E888);
  *(_QWORD *)((char *)v2 + OBJC_IVAR___SKALocalStatusServer_observationTimestamps) = sub_218950BA8(v28);
  *(_QWORD *)((char *)v2 + OBJC_IVAR___SKALocalStatusServer_failedDeliveries) = sub_218950D48(v28);
  swift_release();
  v84.receiver = v2;
  v84.super_class = ObjectType;
  v35 = (id *)objc_msgSendSuper2(&v84, sel_init);
  v36 = v35[19];
  v37 = v35;
  v38 = v36;
  sub_218988E74();

  v39 = v35[19];
  sub_218988E8C();

  v82 = sub_218973BE4;
  v83 = v37;
  v40 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v79 = 1107296256;
  v80 = sub_218951B34;
  v81 = &block_descriptor;
  v41 = _Block_copy(&aBlock);
  v42 = v37;
  swift_release();
  v43 = objc_msgSend(a1, sel_registerIDSDeviceChangedObserver_, v41);
  _Block_release(v41);
  sub_218988C10();

  ((void (*)(char *, _QWORD, uint64_t, uint64_t))v74)(v6, 0, 1, v75);
  v44 = (uint64_t)v42 + OBJC_IVAR___SKALocalStatusServer_idsDeviceProviderToken;
  swift_beginAccess();
  sub_218973814((uint64_t)v6, v44);
  swift_endAccess();
  v45 = v42[24];
  v46 = (void *)sub_218988F1C();
  v82 = sub_218973C04;
  v83 = v42;
  aBlock = v40;
  v79 = 1107296256;
  v80 = (uint64_t (*)())sub_218951E6C;
  v81 = &block_descriptor_8;
  v47 = _Block_copy(&aBlock);
  v48 = v42;
  swift_release();
  objc_msgSend(v45, sel_registerRequestID_options_handler_, v46, 0, v47);
  _Block_release(v47);

  v49 = v42[24];
  v82 = sub_218973C0C;
  v83 = v48;
  aBlock = v40;
  v79 = 1107296256;
  v80 = (uint64_t (*)())sub_218953F1C;
  v81 = &block_descriptor_11;
  v50 = _Block_copy(&aBlock);
  v51 = v48;
  v52 = v49;
  swift_release();
  objc_msgSend(v52, sel_setDeviceFoundHandler_, v50);
  _Block_release(v50);

  v53 = v42[24];
  v82 = sub_218973C3C;
  v83 = v51;
  aBlock = v40;
  v79 = 1107296256;
  v80 = (uint64_t (*)())sub_218953F1C;
  v81 = &block_descriptor_14;
  v54 = _Block_copy(&aBlock);
  v55 = v51;
  v56 = v53;
  swift_release();
  objc_msgSend(v56, sel_setDeviceLostHandler_, v54);
  _Block_release(v54);

  v57 = v42[24];
  v82 = sub_2189545EC;
  v83 = 0;
  aBlock = v40;
  v79 = 1107296256;
  v80 = (uint64_t (*)())sub_218954870;
  v81 = &block_descriptor_17;
  v58 = _Block_copy(&aBlock);
  v59 = v57;
  objc_msgSend(v59, sel_activateWithCompletion_, v58);
  _Block_release(v58);

  v60 = sub_21898900C();
  v61 = (uint64_t)v76;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 56))(v76, 1, 1, v60);
  v62 = (_QWORD *)swift_allocObject();
  v62[2] = 0;
  v62[3] = 0;
  v62[4] = v55;
  v63 = v55;
  sub_21894F800(v61, (uint64_t)&unk_255001540, (uint64_t)v62);
  swift_unknownObjectRelease();

  swift_release();
  return v63;
}

id sub_2189509F8()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

unint64_t sub_218950A18(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t result;
  char v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  _QWORD v26[2];

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v11 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v10 = sub_21898921C();
  v11 = (_QWORD *)v10;
  v12 = *(_QWORD *)(a1 + 16);
  if (!v12)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v11;
  }
  v13 = *(int *)(v6 + 48);
  v14 = v10 + 64;
  v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v26[1] = a1;
  v16 = a1 + v15;
  v17 = *(_QWORD *)(v7 + 72);
  swift_retain();
  while (1)
  {
    sub_218980220(v16, (uint64_t)v9, a2);
    result = sub_218974A9C((uint64_t)v9);
    if ((v19 & 1) != 0)
      break;
    v20 = result;
    *(_QWORD *)(v14 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v21 = v11[6];
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v20, v9, v22);
    *(_QWORD *)(v11[7] + 8 * v20) = *(_QWORD *)&v9[v13];
    v23 = v11[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
      goto LABEL_11;
    v11[2] = v25;
    v16 += v17;
    if (!--v12)
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

unint64_t sub_218950BA8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t result;
  char v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  _QWORD v25[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E828);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (_QWORD *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001878);
  v6 = sub_21898921C();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = (char *)v5 + *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_218980220(v12, (uint64_t)v5, &qword_253E6E828);
    v14 = *v5;
    v15 = v5[1];
    result = sub_218974A38(*v5, v15);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v19 = (uint64_t *)(v7[6] + 16 * result);
    *v19 = v14;
    v19[1] = v15;
    v20 = v7[7];
    v21 = sub_218988BF8();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v20 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * v18, v9, v21);
    v22 = v7[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_11;
    v7[2] = v24;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_218950D48(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  _QWORD v24[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_253E6E720);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550017C0);
  v6 = sub_21898921C();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_9;
  v9 = (uint64_t)&v5[*(int *)(v2 + 48)];
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_218980220(v12, (uint64_t)v5, qword_253E6E720);
    result = sub_218974978((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(0);
    sub_21897F960((uint64_t)v5, v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
    v19 = v7[7];
    v20 = type metadata accessor for SKALocalStatusServer.FailedDelivery(0);
    result = sub_21897F960(v9, v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v16, type metadata accessor for SKALocalStatusServer.FailedDelivery);
    v21 = v7[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_12;
    v7[2] = v23;
    v12 += v13;
    if (!--v8)
    {
      swift_bridgeObjectRelease();
      swift_release();
      return (unint64_t)v7;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_218950F04(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550017A0);
  v2 = sub_21898921C();
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
    sub_218980220(v6, (uint64_t)v15, &qword_255001920);
    result = sub_218974B98((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_21897F4B8(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
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

unint64_t sub_218951044(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550018F0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550018C8);
  v6 = sub_21898921C();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_218980220(v12, (uint64_t)v5, &qword_2550018F0);
    result = sub_218974A9C((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    *(_QWORD *)(v7[7] + 8 * v16) = *(_QWORD *)&v5[v9];
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_2189511E0(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_21898921C();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (void **)(a1 + 48);
  while (1)
  {
    v6 = (uint64_t)*(v5 - 2);
    v7 = (uint64_t)*(v5 - 1);
    v8 = *v5;
    swift_bridgeObjectRetain();
    v9 = v8;
    result = sub_218974A38(v6, v7);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v3[6] + 16 * result);
    *v12 = v6;
    v12[1] = v7;
    *(_QWORD *)(v3[7] + 8 * result) = v9;
    v13 = v3[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v3[2] = v15;
    v5 += 3;
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

unint64_t sub_2189512F4(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550017A8);
  v2 = sub_21898921C();
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
    sub_218980220(v6, (uint64_t)&v15, &qword_2550017B0);
    v7 = v15;
    v8 = v16;
    result = sub_218974A38(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_21897F4B8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_218951428(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];

  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E840);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21898900C();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = a1;
  v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  swift_retain();
  if (v7 == 1)
  {
    sub_21897FCD4((uint64_t)v3, &qword_253E6E840);
    v8 = 0;
    v9 = 0;
  }
  else
  {
    sub_218989000();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v8 = sub_218988FDC();
      v9 = v10;
      swift_unknownObjectRelease();
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = &unk_255001940;
  *(_QWORD *)(v11 + 24) = v6;
  if (v9 | v8)
  {
    v13[0] = 0;
    v13[1] = 0;
    v13[2] = v8;
    v13[3] = v9;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_2189515FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_218951614()
{
  uint64_t v0;

  sub_218951644();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_218951644()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
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
  uint64_t v18;
  uint64_t *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  id v36;
  uint64_t v37;
  size_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  _QWORD *v46;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E840);
  MEMORY[0x24BDAC7A8](v2);
  v45 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21895BC24((_BYTE *)0xD000000000000019, 0x80000002189935C0);
  if (v4 >> 62)
  {
    v5 = sub_2189891F8();
    if (v5)
    {
LABEL_3:
      v46 = (_QWORD *)MEMORY[0x24BEE4AF8];
      sub_218978FEC(0, v5 & ~(v5 >> 63), 0);
      if (v5 < 0)
      {
        __break(1u);
LABEL_34:
        swift_once();
        goto LABEL_30;
      }
      v44 = v0;
      v6 = 0;
      v7 = v46;
      do
      {
        if ((v4 & 0xC000000000000001) != 0)
          v8 = (id)MEMORY[0x219A1CED4](v6, v4);
        else
          v8 = *(id *)(v4 + 8 * v6 + 32);
        v9 = v8;
        v10 = objc_msgSend(v8, sel_uniqueID);
        if (v10)
        {
          v11 = v10;
          v12 = sub_218988F28();
          v14 = v13;

        }
        else
        {

          v12 = 0;
          v14 = 0;
        }
        v46 = v7;
        v16 = v7[2];
        v15 = v7[3];
        if (v16 >= v15 >> 1)
        {
          sub_218978FEC(v15 > 1, v16 + 1, 1);
          v7 = v46;
        }
        ++v6;
        v7[2] = v16 + 1;
        v17 = &v7[2 * v16];
        v17[4] = v12;
        v17[5] = v14;
      }
      while (v5 != v6);
      swift_bridgeObjectRelease();
      v1 = v44;
      v18 = v7[2];
      if (v18)
        goto LABEL_15;
LABEL_26:
      v20 = (_QWORD *)MEMORY[0x24BEE4AF8];
      goto LABEL_27;
    }
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_3;
  }
  swift_bridgeObjectRelease();
  v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v18 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
  if (!v18)
    goto LABEL_26;
LABEL_15:
  swift_bridgeObjectRetain();
  v19 = v7 + 5;
  v20 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    v22 = *v19;
    if (*v19)
    {
      v23 = *(v19 - 1);
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v20 = sub_218973CF0(0, v20[2] + 1, 1, v20);
      v25 = v20[2];
      v24 = v20[3];
      if (v25 >= v24 >> 1)
        v20 = sub_218973CF0((_QWORD *)(v24 > 1), v25 + 1, 1, v20);
      v20[2] = v25 + 1;
      v21 = &v20[2 * v25];
      v21[4] = v23;
      v21[5] = v22;
    }
    v19 += 2;
    --v18;
  }
  while (v18);
  swift_bridgeObjectRelease();
LABEL_27:
  v26 = sub_21897BD40((uint64_t)v20);
  swift_bridgeObjectRelease();
  v27 = (_QWORD *)(v1 + OBJC_IVAR___SKALocalStatusServer_idsDeviceRecipientIDs);
  swift_beginAccess();
  v28 = swift_bridgeObjectRetain();
  v29 = sub_21897BDD4(v28);
  swift_bridgeObjectRelease();
  v30 = sub_218970090(v26);
  swift_bridgeObjectRelease();
  LOBYTE(v26) = sub_2189703C0(v30, v29);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v26 & 1) != 0)
    return swift_bridgeObjectRelease();
  *v27 = v7;
  swift_bridgeObjectRelease();
  if (qword_253E6EE80 != -1)
    goto LABEL_34;
LABEL_30:
  v32 = sub_218988E20();
  __swift_project_value_buffer(v32, (uint64_t)qword_253E6EE68);
  v33 = sub_218988E14();
  v34 = sub_218989078();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v35 = 0;
    _os_log_impl(&dword_2188DF000, v33, v34, "IDSDevices changed", v35, 2u);
    MEMORY[0x219A1D978](v35, -1, -1);
  }

  v36 = objc_msgSend(*(id *)(v1 + 168), sel_newBackgroundContext);
  swift_beginAccess();
  v37 = swift_bridgeObjectRetain();
  v38 = sub_218978EB4(v37);
  swift_bridgeObjectRelease();
  sub_218957C18(v38, (uint64_t)v36);
  swift_release();
  sub_21895AA8C();
  v39 = sub_21898900C();
  v40 = (uint64_t)v45;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v45, 1, 1, v39);
  v41 = sub_218974B58(&qword_255001728, type metadata accessor for SKALocalStatusServer, (uint64_t)&protocol conformance descriptor for SKALocalStatusServer);
  v42 = (_QWORD *)swift_allocObject();
  v42[2] = v1;
  v42[3] = v41;
  v42[4] = v1;
  v42[5] = v36;
  swift_retain_n();
  sub_21894F800(v40, (uint64_t)&unk_255001958, (uint64_t)v42);
  return swift_release();
}

uint64_t sub_218951B38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E840);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21898900C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = a5;
  v13[5] = a1;
  v13[6] = a2;
  v13[7] = a3;
  v13[8] = a4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_21894F800((uint64_t)v11, (uint64_t)&unk_255001910, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_218951C40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[35] = a7;
  v8[36] = a8;
  v8[33] = a5;
  v8[34] = a6;
  v8[32] = a4;
  return swift_task_switch();
}

uint64_t sub_218951C60()
{
  uint64_t *v0;

  sub_21897BFEC(v0[33], v0[34]);
  v0[37] = 0;
  return swift_task_switch();
}

uint64_t sub_218951CC0()
{
  uint64_t v0;
  void (*v1)(void);
  uint64_t inited;

  v1 = *(void (**)(void))(v0 + 280);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255001918);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2189901B0;
  *(_QWORD *)(v0 + 240) = 0x73736563637573;
  *(_QWORD *)(v0 + 248) = 0xE700000000000000;
  sub_218989120();
  *(_QWORD *)(inited + 96) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 72) = 1;
  sub_218950F04(inited);
  v1();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_218951D88()
{
  uint64_t v0;
  void *v1;
  void (*v2)(unint64_t, _QWORD, void *);
  uint64_t inited;
  unint64_t v4;
  id v5;

  v1 = *(void **)(v0 + 296);
  v2 = *(void (**)(unint64_t, _QWORD, void *))(v0 + 280);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255001918);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2189901B0;
  *(_QWORD *)(v0 + 224) = 0x73736563637573;
  *(_QWORD *)(v0 + 232) = 0xE700000000000000;
  sub_218989120();
  *(_QWORD *)(inited + 96) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 72) = 0;
  v4 = sub_218950F04(inited);
  v5 = v1;
  v2(v4, 0, v1);

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_218951E6C(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  void (*v6)(uint64_t, uint64_t, void (*)(uint64_t, void *, uint64_t), uint64_t);
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v6 = *(void (**)(uint64_t, uint64_t, void (*)(uint64_t, void *, uint64_t), uint64_t))(a1 + 32);
  v7 = sub_218988ED4();
  if (a3)
    a3 = sub_218988ED4();
  v8 = _Block_copy(a4);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  swift_retain();
  v6(v7, a3, sub_21897FDD8, v9);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_218951F58(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v6 = a2;
  if (a1)
  {
    v7 = (void *)sub_218988EC8();
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = 0;
  if (a2)
LABEL_3:
    v6 = (void *)sub_218988EC8();
LABEL_4:
  if (a3)
    v8 = sub_218988B68();
  else
    v8 = 0;
  v9 = (id)v8;
  (*(void (**)(uint64_t, void *, void *))(a4 + 16))(a4, v7, v6);

}

uint64_t sub_218952028(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[8] = a6;
  v7[9] = a7;
  v7[6] = a4;
  v7[7] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255001550);
  v7[10] = swift_task_alloc();
  v7[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_218952098()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  uint8_t *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v13;

  if (qword_253E6EE80 != -1)
    swift_once();
  v1 = (void *)v0[6];
  v2 = sub_218988E20();
  __swift_project_value_buffer(v2, (uint64_t)qword_253E6EE68);
  v3 = v1;
  v4 = sub_218988E14();
  v5 = sub_218989078();
  v6 = os_log_type_enabled(v4, v5);
  v7 = (void *)v0[6];
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v0[5] = v7;
    v9 = v7;
    sub_2189890C0();
    *v13 = v7;

    _os_log_impl(&dword_2188DF000, v4, v5, "receiveStatusCompanionLink deviceFound {device: %@}", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
    swift_arrayDestroy();
    MEMORY[0x219A1D978](v13, -1, -1);
    MEMORY[0x219A1D978](v8, -1, -1);
  }
  else
  {

  }
  v10 = v0[11];
  sub_218988BE0();
  v11 = sub_218988BF8();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  return swift_task_switch();
}

uint64_t sub_218952270()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[10];
  v2 = v0[11];
  v4 = v0[8];
  v3 = v0[9];
  sub_218980220(v2, v1, &qword_255001550);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_21895CD08(v1, v4, v3);
  swift_endAccess();
  sub_21897FCD4(v2, &qword_255001550);
  return swift_task_switch();
}

uint64_t sub_218952334()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  strcpy((char *)v10, "deviceFound[");
  BYTE5(v10[1]) = 0;
  HIWORD(v10[1]) = -5120;
  swift_bridgeObjectRetain();
  v1 = sub_21897BF64(8);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  swift_bridgeObjectRelease();
  MEMORY[0x219A1CCAC](v1, v3, v5, v7);
  sub_218988F64();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_218988F64();
  v8 = v10[1];
  *(_QWORD *)(v0 + 96) = v10[0];
  *(_QWORD *)(v0 + 104) = v8;
  return swift_task_switch();
}

uint64_t sub_218952420()
{
  uint64_t v0;

  sub_218952544(*(_QWORD *)(v0 + 96), *(id *)(v0 + 104));
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21895247C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255001550);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218980220(a1, (uint64_t)v8, &qword_255001550);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_21895CD08((uint64_t)v8, a2, a3);
  return swift_endAccess();
}

uint64_t sub_218952544(uint64_t a1, id a2)
{
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  uint8_t *v26;
  void *v27;
  int64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  unint64_t v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  unint64_t v41;
  id v42;
  void (*v43)(_QWORD *@<X8>);
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  unint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t);
  uint64_t v50;
  _QWORD *v51;
  int isUniquelyReferenced_nonNull_native;
  char v53;
  unint64_t v54;
  uint64_t v55;
  _BOOL8 v56;
  uint64_t v57;
  char v58;
  _QWORD *v59;
  unint64_t v60;
  char v61;
  _QWORD *v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  BOOL v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t);
  BOOL v73;
  uint64_t v74;
  void *v75;
  _QWORD *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  NSObject *v81;
  os_log_type_t v82;
  uint8_t *v83;
  _QWORD *v84;
  id v85;
  void *v86;
  uint64_t v87;
  uint64_t result;
  uint64_t v89;
  uint64_t v90;
  id v91;
  void *v92;
  id v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  char v98;
  _QWORD *v99;
  char v100;
  unint64_t v101;
  uint64_t v102;
  _BOOL8 v103;
  uint64_t v104;
  char v105;
  unint64_t v106;
  char v107;
  _QWORD *v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  int64_t v117;
  __int128 v118;
  char **v119;
  void (*v120)(char *, uint64_t);
  uint64_t v121;
  unint64_t v122;
  unint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  int64_t v127;
  unint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  id v137;
  char *v138;
  id v139;
  NSObject *v140;
  os_log_type_t v141;
  uint64_t v142;
  _QWORD *v143;
  void *v144;
  id v145;
  uint64_t v146;
  unint64_t v147;
  unint64_t v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  id v153;
  char v154;
  _QWORD *v155;
  char v156;
  unint64_t v157;
  uint64_t v158;
  _BOOL8 v159;
  uint64_t v160;
  char v161;
  unint64_t v162;
  char v163;
  _QWORD *v164;
  uint64_t *v165;
  uint64_t v166;
  uint64_t v167;
  int64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  void *v172;
  void *v173;
  NSObject *v174;
  os_log_type_t v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  uint64_t v179;
  unint64_t v180;
  unint64_t v181;
  uint64_t *v182;
  char v183;
  char v184;
  uint64_t v185;
  char *v186;
  NSObject *v187;
  os_log_type_t v188;
  uint64_t v189;
  uint64_t v190;
  unint64_t v191;
  uint64_t v192;
  NSObject *v193;
  os_log_type_t v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  void (*v199)(char *, uint64_t, uint64_t);
  uint64_t v200;
  uint64_t *v201;
  char v202;
  uint64_t v203;
  os_log_type_t v204;
  uint64_t v205;
  unint64_t v206;
  uint64_t v207;
  char *v208;
  NSObject *v209;
  os_log_type_t v210;
  uint8_t *v211;
  int64_t v212;
  void (*v213)(_QWORD *@<X8>);
  id v214;
  unint64_t v215;
  char *v216;
  void **v217;
  int64_t v218;
  uint64_t v219;
  __int128 v220;
  char *v221;
  uint64_t v222;
  uint64_t v223;
  char *v224;
  int64_t v225;
  uint64_t *v226;
  int64_t v227;
  unint64_t v228;
  unint64_t v229;
  void *v230;
  char *v231;
  uint64_t v232;
  uint64_t v233;
  __int128 v234;
  unint64_t v235;
  unint64_t v236;
  unint64_t v237;
  char *v238;
  uint64_t v239;
  char *v240;
  uint64_t v241;
  _QWORD *v242;
  _QWORD *v243;
  id v244[5];

  v244[3] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550018B0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v224 = (char *)&v212 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v223 = (uint64_t)&v212 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v232 = *(_QWORD *)(v8 - 8);
  v233 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (uint64_t)&v212 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v221 = (char *)&v212 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v216 = (char *)&v212 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v231 = (char *)&v212 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v240 = (char *)&v212 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v238 = (char *)&v212 - v20;
  if (qword_253E6EE80 != -1)
    goto LABEL_69;
  while (1)
  {
    v21 = sub_218988E20();
    v22 = __swift_project_value_buffer(v21, (uint64_t)qword_253E6EE68);
    swift_bridgeObjectRetain_n();
    v239 = v22;
    v23 = sub_218988E14();
    v24 = sub_218989078();
    v25 = os_log_type_enabled(v23, v24);
    v222 = v11;
    if (v25)
    {
      v26 = (uint8_t *)swift_slowAlloc();
      v27 = (void *)swift_slowAlloc();
      v244[0] = v27;
      *(_DWORD *)v26 = 136315138;
      swift_bridgeObjectRetain();
      v243 = (_QWORD *)sub_218974338(a1, (unint64_t)a2, (uint64_t *)v244);
      sub_2189890C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2188DF000, v23, v24, "reconcileObservations START {reason: %s}", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v27, -1, -1);
      MEMORY[0x219A1D978](v26, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v28 = v225;
    v29 = objc_msgSend(*(id *)(v225 + 184), sel_idsDevices);
    v30 = (uint64_t)v238;
    if (!v29)
    {
      v74 = sub_218988DD8();
      sub_218974B58(&qword_255001570, (uint64_t (*)(uint64_t))MEMORY[0x24BE60B58], MEMORY[0x24BE60B60]);
      v75 = (void *)swift_allocError();
      *v76 = 0x6369766544736469;
      v76[1] = 0xEA00000000007365;
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v74 - 8) + 104))(v76, *MEMORY[0x24BE60B50], v74);
      swift_willThrow();
LABEL_33:
      v43 = 0;
LABEL_34:
      v79 = v75;
      v80 = v75;
      v81 = sub_218988E14();
      v82 = sub_218989078();
      if (os_log_type_enabled(v81, v82))
      {
        v83 = (uint8_t *)swift_slowAlloc();
        v84 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v83 = 138412290;
        v85 = v75;
        v86 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v244[0] = v86;
        sub_2189890C0();
        *v84 = v86;

        _os_log_impl(&dword_2188DF000, v81, v82, "reconcileObservations FAILED {error: %@}", v83, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
        swift_arrayDestroy();
        MEMORY[0x219A1D978](v84, -1, -1);
        MEMORY[0x219A1D978](v83, -1, -1);

      }
      else
      {

      }
      v87 = (uint64_t)v43;
      return sub_21897FBB8(v87);
    }
    v31 = v29;
    sub_21897FBC8(0, (unint64_t *)&unk_253E6E878);
    v32 = sub_218988FA0();

    v33 = objc_msgSend(*(id *)(v28 + 192), sel_activeDevices);
    sub_21897FBC8(0, &qword_255001748);
    v34 = sub_218988FA0();

    v35 = objc_msgSend(*(id *)(v28 + 168), sel_newBackgroundContext);
    v36 = *(void **)(v28 + 176);
    v37 = v35;
    v244[0] = 0;
    v38 = objc_msgSend(v36, sel_allSubscribedLocalStatusesInDatabaseContext_error_, v35, v244);
    v39 = v244[0];
    if (!v38)
    {
      v77 = v37;
      v78 = v244[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v75 = (void *)sub_218988B74();

      swift_willThrow();
      goto LABEL_33;
    }
    v40 = v38;
    v236 = v32;
    sub_21897FBC8(0, &qword_2550018B8);
    v41 = sub_218988FA0();
    v42 = v39;

    v229 = sub_218951044(MEMORY[0x24BEE4AF8]);
    if (v41 >> 62)
    {
      swift_bridgeObjectRetain();
      a1 = sub_2189891F8();
      swift_bridgeObjectRelease();
    }
    else
    {
      a1 = *(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v214 = v37;
    v235 = v34;
    if (!a1)
      break;
    v43 = 0;
    v230 = 0;
    v237 = v41 & 0xC000000000000001;
    v11 = 4;
    v213 = sub_21896F18C;
    while (1)
    {
      a2 = (id)(v11 - 4);
      v44 = v237 ? (id)MEMORY[0x219A1CED4](v11 - 4, v41) : *(id *)(v41 + 8 * v11);
      v45 = v44;
      v46 = v11 - 3;
      if (__OFADD__(a2, 1))
        break;
      v47 = v230;
      sub_21896EEBC(v30);
      v230 = v47;
      if (v47)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v75 = v230;
        goto LABEL_34;
      }
      v48 = v41;
      v49 = *(void (**)(char *, uint64_t, uint64_t))(v232 + 16);
      v50 = (uint64_t)v240;
      v49(v240, v30, v233);
      a2 = v45;
      sub_21897FBB8((uint64_t)v43);
      v51 = (_QWORD *)v229;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v244[0] = v51;
      v54 = sub_218974A9C(v50);
      v55 = v51[2];
      v56 = (v53 & 1) == 0;
      v57 = v55 + v56;
      if (__OFADD__(v55, v56))
        goto LABEL_65;
      v58 = v53;
      if (v51[3] >= v57)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_218977BC4();
          v51 = v244[0];
        }
      }
      else
      {
        sub_2189758AC(v57, isUniquelyReferenced_nonNull_native);
        v59 = v244[0];
        v60 = sub_218974A9C((uint64_t)v240);
        if ((v58 & 1) != (v61 & 1))
        {
LABEL_149:
          result = sub_218989264();
          __break(1u);
          return result;
        }
        v54 = v60;
        v51 = v59;
      }
      swift_bridgeObjectRelease();
      v30 = (uint64_t)v238;
      if ((v58 & 1) != 0)
      {
        swift_bridgeObjectRetain();
      }
      else
      {
        v51[(v54 >> 6) + 8] |= 1 << v54;
        v62 = v51;
        v63 = v51[6] + *(_QWORD *)(v232 + 72) * v54;
        swift_bridgeObjectRetain();
        v64 = v63;
        v51 = v62;
        v49((char *)v64, (uint64_t)v240, v233);
        *(_QWORD *)(v62[7] + 8 * v54) = MEMORY[0x24BEE4AF8];
        v65 = v62[2];
        v66 = __OFADD__(v65, 1);
        v67 = v65 + 1;
        if (v66)
          goto LABEL_67;
        v62[2] = v67;
      }
      v68 = v51;
      v69 = v51[7];
      v229 = (unint64_t)v68;
      v70 = swift_bridgeObjectRelease();
      MEMORY[0x219A1CCF4](v70);
      v41 = v48;
      if (*(_QWORD *)((*(_QWORD *)(v69 + 8 * v54) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v69 + 8 * v54) & 0xFFFFFFFFFFFFFF8)
                                                                                               + 0x18) >> 1)
        sub_218988FC4();
      sub_218988FD0();
      sub_218988FB8();

      v71 = v233;
      v72 = *(void (**)(char *, uint64_t))(v232 + 8);
      v72(v240, v233);
      v72((char *)v30, v71);
      ++v11;
      v43 = sub_21896F18C;
      v73 = v46 == a1;
      v34 = v235;
      if (v73)
        goto LABEL_40;
    }
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    swift_once();
  }
  v213 = 0;
  v230 = 0;
LABEL_40:
  swift_bridgeObjectRelease();
  v243 = (_QWORD *)sub_2189511E0(MEMORY[0x24BEE4AF8], &qword_255001858);
  a1 = v236;
  if (v236 >> 62)
  {
    swift_bridgeObjectRetain();
    a2 = (id)sub_2189891F8();
    swift_bridgeObjectRelease();
    v89 = v233;
    if (!a2)
      goto LABEL_72;
LABEL_42:
    v240 = (char *)(a1 & 0xC000000000000001);
    v90 = 4;
    while (1)
    {
      if (v240)
        v91 = (id)MEMORY[0x219A1CED4](v90 - 4, a1);
      else
        v91 = *(id *)(a1 + 8 * v90);
      v92 = v91;
      v11 = v90 - 3;
      if (__OFADD__(v90 - 4, 1))
      {
        __break(1u);
        goto LABEL_64;
      }
      v93 = objc_msgSend(v91, sel_uniqueID);
      if (v93)
        break;

LABEL_44:
      ++v90;
      v89 = v233;
      if ((id)v11 == a2)
        goto LABEL_72;
    }
    v94 = v93;
    v95 = sub_218988F28();
    a1 = v96;

    v97 = v92;
    v98 = swift_isUniquelyReferenced_nonNull_native();
    v99 = v243;
    v244[0] = v243;
    v243 = (_QWORD *)0x8000000000000000;
    v101 = sub_218974A38(v95, a1);
    v102 = v99[2];
    v103 = (v100 & 1) == 0;
    v104 = v102 + v103;
    if (__OFADD__(v102, v103))
      goto LABEL_66;
    v105 = v100;
    if (v99[3] < v104)
    {
      sub_2189755A4(v104, v98, &qword_255001858);
      v106 = sub_218974A38(v95, a1);
      if ((v105 & 1) != (v107 & 1))
      {
LABEL_148:
        sub_218989264();
        __break(1u);
        goto LABEL_149;
      }
      v101 = v106;
      v108 = v244[0];
      if ((v105 & 1) == 0)
        goto LABEL_54;
LABEL_58:
      v112 = v108[7];
      v113 = 8 * v101;

      *(_QWORD *)(v112 + v113) = v97;
LABEL_59:
      v243 = v108;

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v34 = v235;
      a1 = v236;
      goto LABEL_44;
    }
    if ((v98 & 1) != 0)
    {
      v108 = v244[0];
      if ((v100 & 1) != 0)
        goto LABEL_58;
    }
    else
    {
      sub_218977A1C(&qword_255001858);
      v108 = v244[0];
      if ((v105 & 1) != 0)
        goto LABEL_58;
    }
LABEL_54:
    v108[(v101 >> 6) + 8] |= 1 << v101;
    v109 = (uint64_t *)(v108[6] + 16 * v101);
    *v109 = v95;
    v109[1] = a1;
    *(_QWORD *)(v108[7] + 8 * v101) = v97;
    v110 = v108[2];
    v66 = __OFADD__(v110, 1);
    v111 = v110 + 1;
    if (v66)
      goto LABEL_68;
    v108[2] = v111;
    swift_bridgeObjectRetain();
    goto LABEL_59;
  }
  a2 = *(id *)((v236 & 0xFFFFFFFFFFFFF8) + 0x10);
  v89 = v233;
  if (a2)
    goto LABEL_42;
LABEL_72:
  swift_bridgeObjectRelease();
  v114 = *(_QWORD *)(v229 + 64);
  v215 = v229 + 64;
  v115 = 1 << *(_BYTE *)(v229 + 32);
  v116 = -1;
  if (v115 < 64)
    v116 = ~(-1 << v115);
  v228 = v116 & v114;
  v226 = (uint64_t *)(v225 + OBJC_IVAR___SKALocalStatusServer_subscriptionSubjects);
  v217 = (void **)&v242;
  v218 = (unint64_t)(v115 + 63) >> 6;
  v212 = v218 - 1;
  swift_bridgeObjectRetain();
  v117 = 0;
  *(_QWORD *)&v118 = 136315138;
  v220 = v118;
  v219 = MEMORY[0x24BEE4AD8] + 8;
  *(_QWORD *)&v118 = 136315394;
  v234 = v118;
  v119 = &selRef__invalidSenderHandleError;
  while (2)
  {
    v121 = (uint64_t)v224;
    if (v228)
    {
      v122 = __clz(__rbit64(v228));
      v228 &= v228 - 1;
      v227 = v117;
      v123 = v122 | (v117 << 6);
      goto LABEL_79;
    }
    v127 = v117 + 1;
    if (__OFADD__(v117, 1))
      goto LABEL_146;
    if (v127 >= v218)
    {
      v227 = v117;
      goto LABEL_85;
    }
    v128 = *(_QWORD *)(v215 + 8 * v127);
    if (!v128)
    {
      v168 = v117 + 2;
      if (v117 + 2 >= v218)
      {
LABEL_139:
        v227 = v127;
        goto LABEL_85;
      }
      v128 = *(_QWORD *)(v215 + 8 * v168);
      if (v128)
      {
LABEL_111:
        v127 = v168;
        goto LABEL_83;
      }
      if (v117 + 3 >= v218)
      {
        v227 = v117 + 2;
      }
      else
      {
        v128 = *(_QWORD *)(v215 + 8 * (v117 + 3));
        if (v128)
        {
          v127 = v117 + 3;
          goto LABEL_83;
        }
        v168 = v117 + 4;
        if (v117 + 4 < v218)
        {
          v128 = *(_QWORD *)(v215 + 8 * v168);
          if (v128)
            goto LABEL_111;
          while (1)
          {
            v127 = v168 + 1;
            if (__OFADD__(v168, 1))
              goto LABEL_147;
            if (v127 >= v218)
              break;
            v128 = *(_QWORD *)(v215 + 8 * v127);
            ++v168;
            if (v128)
              goto LABEL_83;
          }
          v127 = v212;
          goto LABEL_139;
        }
        v227 = v117 + 3;
      }
LABEL_85:
      v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550018C0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v129 - 8) + 56))(v121, 1, 1, v129);
      v228 = 0;
      goto LABEL_86;
    }
LABEL_83:
    v228 = (v128 - 1) & v128;
    v123 = __clz(__rbit64(v128)) + (v127 << 6);
    v227 = v127;
LABEL_79:
    v124 = v229;
    (*(void (**)(char *, unint64_t, uint64_t))(v232 + 16))(v224, *(_QWORD *)(v229 + 48) + *(_QWORD *)(v232 + 72) * v123, v89);
    v125 = *(_QWORD *)(v124 + 56);
    v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550018C0);
    *(_QWORD *)(v121 + *(int *)(v126 + 48)) = *(_QWORD *)(v125 + 8 * v123);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v126 - 8) + 56))(v121, 0, 1, v126);
    swift_bridgeObjectRetain();
LABEL_86:
    v130 = v223;
    sub_21897FC00(v121, v223, &qword_2550018B0);
    v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550018C0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v131 - 8) + 48))(v130, 1, v131) != 1)
    {
      v132 = *(_QWORD *)(v130 + *(int *)(v131 + 48));
      (*(void (**)(char *, uint64_t, uint64_t))(v232 + 32))(v231, v130, v233);
      v242 = (_QWORD *)sub_2189511E0(MEMORY[0x24BEE4AF8], &qword_2550018D0);
      if (v132 >> 62)
      {
        swift_bridgeObjectRetain();
        v133 = sub_2189891F8();
        swift_bridgeObjectRelease();
        if (v133)
        {
LABEL_89:
          v237 = v132;
          v238 = (char *)(v132 & 0xC000000000000001);
          v134 = 4;
          v236 = v133;
          do
          {
            v136 = v134 - 4;
            if (v238)
            {
              v137 = (id)MEMORY[0x219A1CED4](v134 - 4, v132);
              v138 = (char *)(v134 - 3);
              if (__OFADD__(v136, 1))
                goto LABEL_143;
            }
            else
            {
              v137 = *(id *)(v132 + 8 * v134);
              v138 = (char *)(v134 - 3);
              if (__OFADD__(v136, 1))
              {
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
              }
            }
            v240 = v138;
            v139 = v137;
            v140 = sub_218988E14();
            v141 = sub_218989078();
            if (os_log_type_enabled(v140, v141))
            {
              v142 = swift_slowAlloc();
              v143 = (_QWORD *)swift_slowAlloc();
              v144 = (void *)swift_slowAlloc();
              v244[0] = v144;
              *(_DWORD *)v142 = v234;
              v145 = objc_msgSend(v139, v119[419]);
              v146 = sub_218988F28();
              v148 = v147;

              v119 = &selRef__invalidSenderHandleError;
              *(_QWORD *)(v142 + 4) = sub_218974338(v146, v148, (uint64_t *)v244);

              v34 = v235;
              swift_bridgeObjectRelease();
              *(_WORD *)(v142 + 12) = 2112;
              *(_QWORD *)(v142 + 14) = v139;
              *v143 = v139;

              _os_log_impl(&dword_2188DF000, v140, v141, "status.idsIdentifier %s, status %@", (uint8_t *)v142, 0x16u);
              __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
              swift_arrayDestroy();
              MEMORY[0x219A1D978](v143, -1, -1);
              swift_arrayDestroy();
              MEMORY[0x219A1D978](v144, -1, -1);
              MEMORY[0x219A1D978](v142, -1, -1);

            }
            else
            {

            }
            v149 = objc_msgSend(v139, v119[419]);
            v150 = sub_218988F28();
            v152 = v151;

            v153 = v139;
            v154 = swift_isUniquelyReferenced_nonNull_native();
            v155 = v242;
            v244[0] = v242;
            v242 = (_QWORD *)0x8000000000000000;
            v157 = sub_218974A38(v150, v152);
            v158 = v155[2];
            v159 = (v156 & 1) == 0;
            v160 = v158 + v159;
            if (__OFADD__(v158, v159))
              goto LABEL_144;
            v161 = v156;
            if (v155[3] >= v160)
            {
              if ((v154 & 1) == 0)
                sub_218977A1C(&qword_2550018D0);
            }
            else
            {
              sub_2189755A4(v160, v154, &qword_2550018D0);
              v162 = sub_218974A38(v150, v152);
              if ((v161 & 1) != (v163 & 1))
                goto LABEL_148;
              v157 = v162;
            }
            v119 = &selRef__invalidSenderHandleError;
            v164 = v244[0];
            if ((v161 & 1) != 0)
            {
              v135 = *((_QWORD *)v244[0] + 7);

              *(_QWORD *)(v135 + 8 * v157) = v153;
            }
            else
            {
              *((_QWORD *)v244[0] + (v157 >> 6) + 8) |= 1 << v157;
              v165 = (uint64_t *)(v164[6] + 16 * v157);
              *v165 = v150;
              v165[1] = v152;
              *(_QWORD *)(v164[7] + 8 * v157) = v153;
              v166 = v164[2];
              v66 = __OFADD__(v166, 1);
              v167 = v166 + 1;
              if (v66)
                goto LABEL_145;
              v164[2] = v167;
              swift_bridgeObjectRetain();
            }
            v242 = v164;

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            ++v134;
            v132 = v237;
          }
          while (v240 != (char *)v236);
        }
      }
      else
      {
        v133 = *(_QWORD *)((v132 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v133)
          goto LABEL_89;
      }
      v169 = swift_bridgeObjectRelease();
      MEMORY[0x24BDAC7A8](v169);
      *(&v212 - 4) = (int64_t)&v242;
      *(&v212 - 3) = (int64_t)&v243;
      v171 = v230;
      v170 = (uint64_t)v231;
      *(&v212 - 2) = v225;
      *(&v212 - 1) = v170;
      sub_21895EFCC((void (*)(id *))sub_21897FC44, (uint64_t)(&v212 - 6), v34);
      v173 = v172;
      v230 = v171;
      swift_bridgeObjectRetain_n();
      v174 = sub_218988E14();
      v175 = sub_218989078();
      if (os_log_type_enabled(v174, v175))
      {
        v176 = swift_slowAlloc();
        v177 = (void *)swift_slowAlloc();
        v244[0] = v177;
        *(_DWORD *)v176 = v220;
        swift_bridgeObjectRetain();
        v178 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E540);
        v179 = MEMORY[0x219A1CD18](v173, v178);
        v181 = v180;
        swift_bridgeObjectRelease();
        *(_QWORD *)(v176 + 4) = sub_218974338(v179, v181, (uint64_t *)v244);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2188DF000, v174, v175, "reconcileObservations - Observations %s", (uint8_t *)v176, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A1D978](v177, -1, -1);
        MEMORY[0x219A1D978](v176, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v182 = v226;
      swift_beginAccess();
      if (*(_QWORD *)(*v182 + 16) && (sub_218974A9C((uint64_t)v231), (v183 & 1) != 0))
      {
        swift_endAccess();
        swift_retain();
        sub_218988E44();
        v184 = sub_21897331C((uint64_t)v244[0], (uint64_t)v173);
        swift_bridgeObjectRelease();
        if ((v184 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          swift_release();
          v89 = v233;
          v120 = *(void (**)(char *, uint64_t))(v232 + 8);
        }
        else
        {
          v244[0] = v173;
          sub_218988E38();
          swift_bridgeObjectRelease();
          v185 = v232;
          v186 = v216;
          v89 = v233;
          (*(void (**)(char *, char *, uint64_t))(v232 + 16))(v216, v231, v233);
          swift_retain_n();
          v187 = sub_218988E14();
          v188 = sub_218989078();
          if (os_log_type_enabled(v187, v188))
          {
            v189 = swift_slowAlloc();
            v240 = (char *)swift_slowAlloc();
            v244[0] = v240;
            *(_DWORD *)v189 = v234;
            sub_21897FAFC(&qword_253E6E578, &qword_253E6E718, MEMORY[0x24BE60B40]);
            v190 = sub_218989234();
            v241 = sub_218974338(v190, v191, (uint64_t *)v244);
            sub_2189890C0();
            swift_bridgeObjectRelease();
            v120 = *(void (**)(char *, uint64_t))(v185 + 8);
            v120(v186, v89);
            *(_WORD *)(v189 + 12) = 2048;
            sub_218988E44();
            v192 = *(_QWORD *)(v241 + 16);
            swift_release();
            swift_bridgeObjectRelease();
            v241 = v192;
            sub_2189890C0();
            swift_release();
            v193 = v187;
            v194 = v188;
            v195 = "reconcileObservations publishing observations to exisitng subject {identifier: %s, observations.count: %ld}";
            goto LABEL_134;
          }
          swift_release_n();
          v120 = *(void (**)(char *, uint64_t))(v185 + 8);
          v120(v186, v89);
LABEL_136:

          swift_release();
        }
      }
      else
      {
        swift_endAccess();
        v244[0] = (id)MEMORY[0x24BEE4AF8];
        __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E5D0);
        swift_allocObject();
        v196 = sub_218988E50();
        v198 = (uint64_t)v231;
        v197 = v232;
        v199 = *(void (**)(char *, uint64_t, uint64_t))(v232 + 16);
        v200 = (uint64_t)v221;
        v89 = v233;
        v199(v221, (uint64_t)v231, v233);
        v201 = v226;
        swift_beginAccess();
        swift_retain();
        v202 = swift_isUniquelyReferenced_nonNull_native();
        v241 = *v201;
        *v201 = 0x8000000000000000;
        sub_218977150(v196, v200, v202, (uint64_t *)&unk_253E6E610);
        *v201 = v241;
        swift_bridgeObjectRelease();
        v120 = *(void (**)(char *, uint64_t))(v197 + 8);
        v120((char *)v200, v89);
        swift_endAccess();
        v244[0] = v173;
        sub_218988E38();
        swift_bridgeObjectRelease();
        v203 = v222;
        v199((char *)v222, v198, v89);
        swift_retain_n();
        v187 = sub_218988E14();
        v204 = sub_218989078();
        if (!os_log_type_enabled(v187, v204))
        {
          swift_release_n();
          v120((char *)v203, v89);
          goto LABEL_136;
        }
        v189 = swift_slowAlloc();
        v240 = (char *)swift_slowAlloc();
        v244[0] = v240;
        *(_DWORD *)v189 = v234;
        sub_21897FAFC(&qword_253E6E578, &qword_253E6E718, MEMORY[0x24BE60B40]);
        v205 = sub_218989234();
        v241 = sub_218974338(v205, v206, (uint64_t *)v244);
        sub_2189890C0();
        swift_bridgeObjectRelease();
        v120((char *)v203, v89);
        *(_WORD *)(v189 + 12) = 2048;
        sub_218988E44();
        v207 = *(_QWORD *)(v241 + 16);
        swift_release();
        swift_bridgeObjectRelease();
        v241 = v207;
        sub_2189890C0();
        swift_release();
        v193 = v187;
        v194 = v204;
        v195 = "reconcileObservations published observations to new subject {identifier: %s, observations.count: %ld}";
LABEL_134:
        _os_log_impl(&dword_2188DF000, v193, v194, v195, (uint8_t *)v189, 0x16u);
        v208 = v240;
        swift_arrayDestroy();
        MEMORY[0x219A1D978](v208, -1, -1);
        MEMORY[0x219A1D978](v189, -1, -1);
        swift_release();

      }
      v34 = v235;
      v119 = &selRef__invalidSenderHandleError;
      v117 = v227;
      v120(v231, v89);
      swift_bridgeObjectRelease();
      continue;
    }
    break;
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v209 = sub_218988E14();
  v210 = sub_218989078();
  if (os_log_type_enabled(v209, v210))
  {
    v211 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v211 = 0;
    _os_log_impl(&dword_2188DF000, v209, v210, "reconcileObservations END", v211, 2u);
    MEMORY[0x219A1D978](v211, -1, -1);
  }

  swift_bridgeObjectRelease();
  v87 = (uint64_t)v213;
  return sub_21897FBB8(v87);
}

void sub_218953F1C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_218953F6C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5)
{
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;
  id v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD *v23;
  id v24;
  id v25[2];

  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E840);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(a1, sel_idsDeviceIdentifier);
  if (v11)
  {
    v12 = v11;
    v13 = sub_218988F28();
    v15 = v14;

    v16 = sub_21898900C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v10, 1, 1, v16);
    v17 = (_QWORD *)swift_allocObject();
    v17[2] = 0;
    v17[3] = 0;
    v17[4] = a1;
    v17[5] = a2;
    v17[6] = v13;
    v17[7] = v15;
    v18 = a1;
    swift_retain();
    sub_21894F800((uint64_t)v10, a4, (uint64_t)v17);
    swift_release();
  }
  else
  {
    if (qword_253E6EE80 != -1)
      swift_once();
    v19 = sub_218988E20();
    __swift_project_value_buffer(v19, (uint64_t)qword_253E6EE68);
    v20 = a1;
    v25[0] = (id)sub_218988E14();
    v21 = sub_21898906C();
    if (os_log_type_enabled((os_log_t)v25[0], v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v22 = 138412290;
      v25[1] = v20;
      v24 = v20;
      sub_2189890C0();
      *v23 = v20;

      _os_log_impl(&dword_2188DF000, (os_log_t)v25[0], v21, a5, v22, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v23, -1, -1);
      MEMORY[0x219A1D978](v22, -1, -1);
    }
    else
    {

    }
  }
}

uint64_t sub_2189541FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[8] = a6;
  v7[9] = a7;
  v7[6] = a4;
  v7[7] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255001550);
  v7[10] = swift_task_alloc();
  v7[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21895426C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  uint8_t *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v13;

  if (qword_253E6EE80 != -1)
    swift_once();
  v1 = (void *)v0[6];
  v2 = sub_218988E20();
  __swift_project_value_buffer(v2, (uint64_t)qword_253E6EE68);
  v3 = v1;
  v4 = sub_218988E14();
  v5 = sub_218989078();
  v6 = os_log_type_enabled(v4, v5);
  v7 = (void *)v0[6];
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v0[5] = v7;
    v9 = v7;
    sub_2189890C0();
    *v13 = v7;

    _os_log_impl(&dword_2188DF000, v4, v5, "receiveStatusCompanionLink deviceLost {device: %@}", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
    swift_arrayDestroy();
    MEMORY[0x219A1D978](v13, -1, -1);
    MEMORY[0x219A1D978](v8, -1, -1);
  }
  else
  {

  }
  v10 = v0[11];
  v11 = sub_218988BF8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  return swift_task_switch();
}

uint64_t sub_21895443C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[10];
  v2 = v0[11];
  v4 = v0[8];
  v3 = v0[9];
  sub_218980220(v2, v1, &qword_255001550);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_21895CD08(v1, v4, v3);
  swift_endAccess();
  sub_21897FCD4(v2, &qword_255001550);
  return swift_task_switch();
}

uint64_t sub_218954500()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRetain();
  v1 = sub_21897BF64(8);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  swift_bridgeObjectRelease();
  MEMORY[0x219A1CCAC](v1, v3, v5, v7);
  sub_218988F64();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_218988F64();
  *(_QWORD *)(v0 + 96) = 0x6F4C656369766564;
  *(_QWORD *)(v0 + 104) = 0xEB000000005B7473;
  return swift_task_switch();
}

void sub_2189545EC(void *a1)
{
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  NSObject *oslog;
  uint64_t v14;

  if (a1)
  {
    v2 = a1;
    if (qword_253E6EE80 != -1)
      swift_once();
    v3 = sub_218988E20();
    __swift_project_value_buffer(v3, (uint64_t)qword_253E6EE68);
    v4 = a1;
    v5 = a1;
    oslog = sub_218988E14();
    v6 = sub_218989060();
    if (os_log_type_enabled(oslog, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v7 = 138412290;
      v9 = a1;
      v14 = _swift_stdlib_bridgeErrorToNSError();
      sub_2189890C0();
      *v8 = v14;

      _os_log_impl(&dword_2188DF000, oslog, v6, "receiveStatusCompanionLink activate FAILED {error: %@}", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v8, -1, -1);
      MEMORY[0x219A1D978](v7, -1, -1);

      return;
    }

  }
  else
  {
    if (qword_253E6EE80 != -1)
      swift_once();
    v10 = sub_218988E20();
    __swift_project_value_buffer(v10, (uint64_t)qword_253E6EE68);
    oslog = sub_218988E14();
    v11 = sub_218989078();
    if (os_log_type_enabled(oslog, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2188DF000, oslog, v11, "receiveStatusCompanionLink activate SUCCESS", v12, 2u);
      MEMORY[0x219A1D978](v12, -1, -1);
    }
  }

}

void sub_218954870(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_2189548C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v6;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v6;
  *v6 = v4;
  v6[1] = sub_2189802D0;
  v6[9] = a4;
  return swift_task_switch();
}

uint64_t sub_218954924()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 72) = v0;
  return swift_task_switch();
}

uint64_t sub_21895493C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  __CFString *v7;
  __CFString *v8;
  CFPropertyListRef v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  size_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  _QWORD *v37;
  void *v38;
  _QWORD *v39;
  uint64_t v40;

  v1 = v0;
  if (qword_253E6EE80 != -1)
    swift_once();
  v2 = sub_218988E20();
  __swift_project_value_buffer(v2, (uint64_t)qword_253E6EE68);
  v3 = sub_218988E14();
  v4 = sub_218989078();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2188DF000, v3, v4, "runStartOperations START", v5, 2u);
    MEMORY[0x219A1D978](v5, -1, -1);
  }
  v6 = v0 + 9;

  v7 = (__CFString *)sub_218988F1C();
  v8 = (__CFString *)sub_218988F1C();
  v9 = CFPreferencesCopyAppValue(v7, v8);

  if (v9)
  {
    v0[2] = v9;
    if ((swift_dynamicCast() & 1) != 0)
    {
      v10 = *v6;
      v11 = OBJC_IVAR___SKALocalStatusServer_screenOffStatusTimeoutSeconds;
      *(_QWORD *)(*v6 + OBJC_IVAR___SKALocalStatusServer_screenOffStatusTimeoutSeconds) = v0[5];
      swift_retain();
      v12 = sub_218988E14();
      v13 = sub_218989078();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v14 = 134217984;
        v0[2] = *(_QWORD *)(v10 + v11);
        sub_2189890C0();
        swift_release();
        _os_log_impl(&dword_2188DF000, v12, v13, "Set custom screen off status timeout: %ld seconds", v14, 0xCu);
        MEMORY[0x219A1D978](v14, -1, -1);

      }
      else
      {

        swift_release();
      }
    }
  }
  v39 = v0 + 9;
  v15 = objc_msgSend(*(id *)(*v6 + 168), sel_newBackgroundContext);
  v16 = sub_21895BC24((_BYTE *)0xD000000000000014, 0x80000002189934D0);
  if (v16 >> 62)
  {
    v17 = sub_2189891F8();
    v38 = v15;
    if (v17)
      goto LABEL_12;
LABEL_25:
    swift_bridgeObjectRelease();
    v20 = MEMORY[0x24BEE4AF8];
    goto LABEL_26;
  }
  v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
  v38 = v15;
  if (!v17)
    goto LABEL_25;
LABEL_12:
  v40 = MEMORY[0x24BEE4AF8];
  result = sub_218978FEC(0, v17 & ~(v17 >> 63), 0);
  if (v17 < 0)
  {
    __break(1u);
    return result;
  }
  v37 = v1;
  v19 = 0;
  v20 = v40;
  do
  {
    if ((v16 & 0xC000000000000001) != 0)
      v21 = (id)MEMORY[0x219A1CED4](v19, v16);
    else
      v21 = *(id *)(v16 + 8 * v19 + 32);
    v22 = v21;
    v23 = objc_msgSend(v21, sel_uniqueID);
    if (v23)
    {
      v24 = v23;
      v25 = sub_218988F28();
      v27 = v26;

    }
    else
    {

      v25 = 0;
      v27 = 0;
    }
    v29 = *(_QWORD *)(v40 + 16);
    v28 = *(_QWORD *)(v40 + 24);
    if (v29 >= v28 >> 1)
      sub_218978FEC(v28 > 1, v29 + 1, 1);
    ++v19;
    *(_QWORD *)(v40 + 16) = v29 + 1;
    v30 = v40 + 16 * v29;
    *(_QWORD *)(v30 + 32) = v25;
    *(_QWORD *)(v30 + 40) = v27;
  }
  while (v17 != v19);
  swift_bridgeObjectRelease();
  v1 = v37;
LABEL_26:
  v31 = (_QWORD *)(*v39 + OBJC_IVAR___SKALocalStatusServer_idsDeviceRecipientIDs);
  swift_beginAccess();
  *v31 = v20;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v32 = swift_bridgeObjectRetain();
  v33 = sub_218978EB4(v32);
  swift_bridgeObjectRelease();
  sub_218957C18(v33, (uint64_t)v38);
  swift_release();
  sub_21895AD14(v38, 0x68636E75614CLL, 0xE600000000000000);
  swift_release();
  v34 = sub_218988E14();
  v35 = sub_218989078();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v36 = 0;
    _os_log_impl(&dword_2188DF000, v34, v35, "runStartOperations END", v36, 2u);
    MEMORY[0x219A1D978](v36, -1, -1);
  }

  return ((uint64_t (*)(void))v1[1])();
}

uint64_t sub_218954FB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7[20] = a6;
  v7[21] = v6;
  v7[18] = a4;
  v7[19] = a5;
  v7[16] = a2;
  v7[17] = a3;
  v7[15] = a1;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E7E0);
  v7[22] = v8;
  v7[23] = *(_QWORD *)(v8 - 8);
  v7[24] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E818);
  v7[25] = swift_task_alloc();
  v7[26] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E6F0);
  v7[27] = v9;
  v7[28] = *(_QWORD *)(v9 - 8);
  v7[29] = swift_task_alloc();
  v7[30] = swift_task_alloc();
  v7[31] = swift_task_alloc();
  v10 = sub_218988D84();
  v7[32] = v10;
  v7[33] = *(_QWORD *)(v10 - 8);
  v7[34] = swift_task_alloc();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v7[35] = v11;
  v7[36] = *(_QWORD *)(v11 - 8);
  v7[37] = swift_task_alloc();
  v7[38] = swift_task_alloc();
  v7[39] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21895510C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(unint64_t, uint64_t, uint64_t);
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  char v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
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
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  _BOOL4 v58;
  void (*v59)(uint64_t, uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint8_t *v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t (*v69)(void);
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  _BOOL4 v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  unint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void (*type)(unint64_t, uint64_t, uint64_t);
  os_log_type_t typea[8];
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;

  if (qword_253E6EE80 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 312);
  v2 = *(_QWORD *)(v0 + 280);
  v3 = *(_QWORD *)(v0 + 288);
  v4 = *(_QWORD *)(v0 + 152);
  v5 = sub_218988E20();
  *(_QWORD *)(v0 + 320) = __swift_project_value_buffer(v5, (uint64_t)qword_253E6EE68);
  v6 = *(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 16);
  *(_QWORD *)(v0 + 328) = v6;
  type = v6;
  v6(v1, v4, v2);
  v7 = sub_218988E14();
  v8 = sub_218989078();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(_QWORD *)(v0 + 312);
  v12 = *(_QWORD *)(v0 + 280);
  v11 = *(_QWORD *)(v0 + 288);
  if (v9)
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    *(_DWORD *)v13 = 136315138;
    v115 = v14;
    sub_21897FAFC(&qword_253E6E578, &qword_253E6E718, MEMORY[0x24BE60B40]);
    v15 = sub_218989234();
    *(_QWORD *)(v0 + 112) = sub_218974338(v15, v16, &v115);
    sub_2189890C0();
    swift_bridgeObjectRelease();
    v17 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v17(v10, v12);
    _os_log_impl(&dword_2188DF000, v7, v8, "Publish START {key: %s}", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A1D978](v14, -1, -1);
    MEMORY[0x219A1D978](v13, -1, -1);
  }
  else
  {
    v17 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v17(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 280));
  }

  *(_QWORD *)(v0 + 336) = v17;
  v18 = *(_QWORD *)(v0 + 272);
  v20 = *(_QWORD *)(v0 + 144);
  v19 = *(_QWORD *)(v0 + 152);
  v21 = *(_QWORD *)(v0 + 136);
  v22 = objc_msgSend(*(id *)(*(_QWORD *)(v0 + 168) + 168), sel_newBackgroundContext);
  *(_QWORD *)(v0 + 344) = v22;
  LSKStatusOptions.targetDeviceFlags.getter(v18);
  v23 = sub_218956F0C(v21, v20, v19, (uint64_t)v22, v18);
  if ((v23 & 1) == 0)
  {
    v30 = (uint64_t *)(*(_QWORD *)(v0 + 168) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects);
    swift_beginAccess();
    v31 = *v30;
    if (!*(_QWORD *)(v31 + 16) || (v32 = sub_218974A9C(*(_QWORD *)(v0 + 152)), (v33 & 1) == 0))
    {
      v47 = *(_QWORD *)(v0 + 232);
      v48 = *(_QWORD *)(v0 + 152);
      swift_endAccess();
      sub_21895C0AC(v48, (uint64_t)v22, v47);
      v49 = *(_QWORD *)(v0 + 128);
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 224) + 32))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 216));
      v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E810);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v49, 1, 1, v50);
LABEL_20:
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 328))(*(_QWORD *)(v0 + 296), *(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 280));
      v56 = sub_218988E14();
      v57 = sub_218989078();
      v58 = os_log_type_enabled(v56, v57);
      v59 = *(void (**)(uint64_t, uint64_t))(v0 + 336);
      v60 = *(_QWORD *)(v0 + 296);
      v61 = *(_QWORD *)(v0 + 272);
      v62 = *(_QWORD *)(v0 + 280);
      v63 = *(_QWORD *)(v0 + 256);
      v64 = *(_QWORD *)(v0 + 264);
      if (v58)
      {
        v114 = *(_QWORD *)(v0 + 264);
        v110 = *(void **)(v0 + 344);
        *(_QWORD *)typea = *(_QWORD *)(v0 + 256);
        v65 = (uint8_t *)swift_slowAlloc();
        v66 = swift_slowAlloc();
        v115 = v66;
        *(_DWORD *)v65 = 136315138;
        sub_21897FAFC(&qword_253E6E578, &qword_253E6E718, MEMORY[0x24BE60B40]);
        v67 = sub_218989234();
        *(_QWORD *)(v0 + 72) = sub_218974338(v67, v68, &v115);
        sub_2189890C0();
        swift_bridgeObjectRelease();
        v59(v60, v62);
        _os_log_impl(&dword_2188DF000, v56, v57, "Publish END {key: %s}", v65, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A1D978](v66, -1, -1);
        MEMORY[0x219A1D978](v65, -1, -1);

        (*(void (**)(uint64_t, os_log_type_t *))(v114 + 8))(v61, *(os_log_type_t **)typea);
      }
      else
      {

        v59(v60, v62);
        (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v61, v63);
      }
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 224) + 32))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 216));
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v69 = *(uint64_t (**)(void))(v0 + 8);
      return v69();
    }
    v34 = *(_QWORD *)(v0 + 240);
    v35 = *(_QWORD *)(v0 + 216);
    v36 = *(_QWORD *)(v0 + 224);
    v37 = *(_QWORD *)(*(_QWORD *)(v31 + 56) + 8 * v32);
    swift_endAccess();
    swift_retain();
    sub_218988E44();
    sub_218988E44();
    v38 = sub_218988C40();
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v34, v35);
    v39 = *(_QWORD *)(v38 + 16);
    swift_bridgeObjectRelease();
    v40 = *(_QWORD *)(v0 + 200);
    if (v39)
    {
      v42 = *(_QWORD *)(v0 + 184);
      v41 = *(_QWORD *)(v0 + 192);
      v43 = *(_QWORD *)(v0 + 176);
      *(_QWORD *)(v0 + 64) = v37;
      v44 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E7F0);
      v45 = sub_21897FAFC(&qword_253E6E7E8, (uint64_t *)&unk_253E6E7F0, MEMORY[0x24BDB9D10]);
      MEMORY[0x219A1CBC8](v44, v45);
      sub_21897FAFC((unint64_t *)&unk_253E6E7D0, &qword_253E6E7E0, MEMORY[0x24BDB9BE0]);
      sub_21897FAFC(&qword_253E6E6E8, &qword_253E6E6F0, MEMORY[0x24BE608D8]);
      sub_21897FAFC(&qword_253E6E6E0, &qword_253E6E6F0, MEMORY[0x24BE608D0]);
      sub_218989030();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v43);
      v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E810);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v40, 0, 1, v46);
    }
    else
    {
      swift_release();
      v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E810);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 56))(v40, 1, 1, v54);
    }
    v55 = *(_QWORD *)(v0 + 200);
LABEL_19:
    sub_21897FC00(v55, *(_QWORD *)(v0 + 128), (uint64_t *)&unk_253E6E818);
    goto LABEL_20;
  }
  v26 = *(_QWORD *)(v0 + 280);
  v25 = *(_QWORD *)(v0 + 288);
  v27 = *(_QWORD *)(v0 + 152);
  sub_218957914(v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E898);
  v28 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_2189901B0;
  type(v29 + v28, v27, v26);
  sub_218957C18(v29, (uint64_t)v22);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_21895AA8C();
  v115 = 0x5B6873696C627550;
  v116 = 0xE800000000000000;
  *(_QWORD *)(v0 + 352) = sub_21897FAFC(&qword_253E6E578, &qword_253E6E718, MEMORY[0x24BE60B40]);
  sub_218989234();
  sub_218988F64();
  swift_bridgeObjectRelease();
  sub_218988F64();
  v51 = sub_21895AD14(v22, v115, v116);
  *(_QWORD *)(v0 + 360) = v51;
  v52 = v51;
  swift_bridgeObjectRelease();
  if (!v52)
  {
    v70 = sub_21895BC24((_BYTE *)0xD000000000000017, 0x8000000218992D70);
    if (v70 >> 62)
      v71 = sub_2189891F8();
    else
      v71 = *(_QWORD *)((v70 & 0xFFFFFFFFFFFFF8) + 0x10);
    v72 = *(_QWORD *)(v0 + 304);
    v73 = *(_QWORD *)(v0 + 280);
    v74 = *(_QWORD *)(v0 + 152);
    swift_bridgeObjectRelease();
    type(v72, v74, v73);
    v75 = sub_218988E14();
    v76 = sub_218989078();
    v77 = os_log_type_enabled(v75, v76);
    v78 = *(_QWORD *)(v0 + 304);
    v79 = *(_QWORD *)(v0 + 280);
    if (v77)
    {
      v80 = swift_slowAlloc();
      v111 = swift_slowAlloc();
      v115 = v111;
      *(_DWORD *)v80 = 136315394;
      v81 = sub_218989234();
      *(_QWORD *)(v0 + 88) = sub_218974338(v81, v82, &v115);
      sub_2189890C0();
      swift_bridgeObjectRelease();
      v17(v78, v79);
      *(_WORD *)(v80 + 12) = 2080;
      *(_QWORD *)(v0 + 96) = v71;
      v83 = sub_218989234();
      *(_QWORD *)(v0 + 104) = sub_218974338(v83, v84, &v115);
      sub_2189890C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2188DF000, v75, v76, "No delivery task for publish. No IDS devices? {key: %s, idsDevices.count: %s}", (uint8_t *)v80, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v111, -1, -1);
      MEMORY[0x219A1D978](v80, -1, -1);
    }
    else
    {
      v17(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 280));
    }

    v85 = (uint64_t *)(*(_QWORD *)(v0 + 168) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects);
    swift_beginAccess();
    v86 = *v85;
    if (!*(_QWORD *)(v86 + 16) || (v87 = sub_218974A9C(*(_QWORD *)(v0 + 152)), (v88 & 1) == 0))
    {
      v102 = *(void **)(v0 + 344);
      v103 = *(_QWORD *)(v0 + 272);
      v104 = *(_QWORD *)(v0 + 256);
      v105 = *(_QWORD *)(v0 + 264);
      swift_endAccess();
      v115 = 0;
      v116 = 0xE000000000000000;
      sub_218989150();
      swift_bridgeObjectRelease();
      v115 = 0xD000000000000014;
      v116 = 0x8000000218992D90;
      sub_218989234();
      sub_218988F64();
      swift_bridgeObjectRelease();
      v106 = v115;
      v107 = v116;
      sub_218974B14();
      swift_allocError();
      *(_QWORD *)v108 = v106;
      *(_QWORD *)(v108 + 8) = v107;
      *(_BYTE *)(v108 + 16) = 1;
      swift_willThrow();

      (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v103, v104);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v69 = *(uint64_t (**)(void))(v0 + 8);
      return v69();
    }
    v89 = *(_QWORD *)(v0 + 240);
    v90 = *(_QWORD *)(v0 + 216);
    v91 = *(_QWORD *)(v0 + 224);
    v92 = *(_QWORD *)(*(_QWORD *)(v86 + 56) + 8 * v87);
    swift_endAccess();
    swift_retain();
    sub_218988E44();
    sub_218988E44();
    v93 = sub_218988C40();
    (*(void (**)(uint64_t, uint64_t))(v91 + 8))(v89, v90);
    v94 = *(_QWORD *)(v93 + 16);
    swift_bridgeObjectRelease();
    v95 = *(_QWORD *)(v0 + 208);
    if (v94)
    {
      v97 = *(_QWORD *)(v0 + 184);
      v96 = *(_QWORD *)(v0 + 192);
      v98 = *(_QWORD *)(v0 + 176);
      *(_QWORD *)(v0 + 80) = v92;
      v99 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E7F0);
      v100 = sub_21897FAFC(&qword_253E6E7E8, (uint64_t *)&unk_253E6E7F0, MEMORY[0x24BDB9D10]);
      MEMORY[0x219A1CBC8](v99, v100);
      sub_21897FAFC((unint64_t *)&unk_253E6E7D0, &qword_253E6E7E0, MEMORY[0x24BDB9BE0]);
      sub_21897FAFC(&qword_253E6E6E8, &qword_253E6E6F0, MEMORY[0x24BE608D8]);
      sub_21897FAFC(&qword_253E6E6E0, &qword_253E6E6F0, MEMORY[0x24BE608D0]);
      sub_218989030();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v96, v98);
      v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E810);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v101 - 8) + 56))(v95, 0, 1, v101);
    }
    else
    {
      swift_release();
      v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E810);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v109 - 8) + 56))(v95, 1, 1, v109);
    }
    v55 = *(_QWORD *)(v0 + 208);
    goto LABEL_19;
  }
  v53 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 368) = v53;
  *v53 = v0;
  v53[1] = sub_218955F2C;
  return sub_218989024();
}

uint64_t sub_218955F2C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_218955F84()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
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
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(void);
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  BOOL v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42[3];

  swift_release();
  v1 = (uint64_t *)(*(_QWORD *)(v0 + 168) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects);
  swift_beginAccess();
  v2 = *v1;
  if (*(_QWORD *)(v2 + 16) && (v3 = sub_218974A9C(*(_QWORD *)(v0 + 152)), (v4 & 1) != 0))
  {
    v5 = *(_QWORD *)(v0 + 240);
    v7 = *(_QWORD *)(v0 + 216);
    v6 = *(_QWORD *)(v0 + 224);
    v8 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v3);
    swift_endAccess();
    swift_retain();
    sub_218988E44();
    sub_218988E44();
    v9 = sub_218988C40();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    v10 = *(_QWORD *)(v9 + 16);
    swift_bridgeObjectRelease();
    v11 = *(_QWORD *)(v0 + 208);
    if (v10)
    {
      v12 = *(_QWORD *)(v0 + 184);
      v13 = *(_QWORD *)(v0 + 192);
      v14 = *(_QWORD *)(v0 + 176);
      *(_QWORD *)(v0 + 80) = v8;
      v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E7F0);
      v16 = sub_21897FAFC(&qword_253E6E7E8, (uint64_t *)&unk_253E6E7F0, MEMORY[0x24BDB9D10]);
      MEMORY[0x219A1CBC8](v15, v16);
      sub_21897FAFC((unint64_t *)&unk_253E6E7D0, &qword_253E6E7E0, MEMORY[0x24BDB9BE0]);
      sub_21897FAFC(&qword_253E6E6E8, &qword_253E6E6F0, MEMORY[0x24BE608D8]);
      sub_21897FAFC(&qword_253E6E6E0, &qword_253E6E6F0, MEMORY[0x24BE608D0]);
      sub_218989030();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v14);
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E810);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v11, 0, 1, v17);
    }
    else
    {
      swift_release();
      v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E810);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v11, 1, 1, v24);
    }
    sub_21897FC00(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 128), (uint64_t *)&unk_253E6E818);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 328))(*(_QWORD *)(v0 + 296), *(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 280));
    v25 = sub_218988E14();
    v26 = sub_218989078();
    v27 = os_log_type_enabled(v25, v26);
    v28 = *(void (**)(uint64_t, uint64_t))(v0 + 336);
    v29 = *(_QWORD *)(v0 + 296);
    v30 = *(_QWORD *)(v0 + 272);
    v31 = *(_QWORD *)(v0 + 280);
    v32 = *(_QWORD *)(v0 + 256);
    v33 = *(_QWORD *)(v0 + 264);
    if (v27)
    {
      v41 = *(_QWORD *)(v0 + 264);
      v39 = *(void **)(v0 + 344);
      v40 = *(_QWORD *)(v0 + 256);
      v34 = (uint8_t *)swift_slowAlloc();
      v35 = swift_slowAlloc();
      v42[0] = v35;
      *(_DWORD *)v34 = 136315138;
      sub_21897FAFC(&qword_253E6E578, &qword_253E6E718, MEMORY[0x24BE60B40]);
      v36 = sub_218989234();
      *(_QWORD *)(v0 + 72) = sub_218974338(v36, v37, v42);
      sub_2189890C0();
      swift_bridgeObjectRelease();
      v28(v29, v31);
      _os_log_impl(&dword_2188DF000, v25, v26, "Publish END {key: %s}", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v35, -1, -1);
      MEMORY[0x219A1D978](v34, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v30, v40);
    }
    else
    {

      v28(v29, v31);
      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v30, v32);
    }
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 224) + 32))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 216));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v23 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    v18 = *(void **)(v0 + 344);
    v19 = *(_QWORD *)(v0 + 272);
    v20 = *(_QWORD *)(v0 + 256);
    v21 = *(_QWORD *)(v0 + 264);
    swift_endAccess();
    sub_218989150();
    swift_bridgeObjectRelease();
    v42[0] = 0xD000000000000014;
    v42[1] = 0x8000000218992D90;
    sub_218989234();
    sub_218988F64();
    swift_bridgeObjectRelease();
    sub_218974B14();
    swift_allocError();
    *(_QWORD *)v22 = 0xD000000000000014;
    *(_QWORD *)(v22 + 8) = 0x8000000218992D90;
    *(_BYTE *)(v22 + 16) = 1;
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v19, v20);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v23 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v23();
}

uint64_t LSKStatusOptions.targetDeviceFlags.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  BOOL *v42;
  char *v43;
  unint64_t v44;
  uint64_t v45;
  void (*v46)(BOOL *, char *, uint64_t);
  uint64_t v47;
  BOOL *v48;
  BOOL *v49;
  void (*v50)(BOOL *, uint64_t);
  uint64_t v51;
  char *v52;
  int v53;
  BOOL *v54;
  void (*v55)(char *, uint64_t, uint64_t);
  char *v56;
  char v57;
  BOOL *v58;
  BOOL v59;
  uint64_t v60;
  BOOL *v61;
  void (*v62)(char *, uint64_t, uint64_t);
  char *v63;
  char v64;
  BOOL v65;
  void (*v66)(BOOL *, char *, uint64_t);
  BOOL *v67;
  void (*v68)(char *, uint64_t, uint64_t);
  char *v69;
  char v70;
  BOOL *v71;
  BOOL v72;
  void (*v73)(BOOL *, char *, uint64_t);
  BOOL *v74;
  BOOL *v75;
  BOOL *v76;
  uint64_t v77;
  BOOL *v78;
  BOOL *v79;
  void (*v80)(BOOL *, uint64_t);
  void (*v81)(char *, uint64_t, uint64_t);
  char v82;
  char *v83;
  BOOL *v84;
  BOOL v85;
  void (*v86)(BOOL *, char *, uint64_t);
  uint64_t v87;
  char *v88;
  BOOL *v89;
  BOOL *v90;
  uint64_t v91;
  BOOL *v92;
  BOOL *v93;
  void (*v94)(BOOL *, uint64_t);
  uint64_t v95;
  uint64_t v96;
  BOOL *v97;
  BOOL *v98;
  void (*v99)(BOOL *, uint64_t);
  _QWORD v101[2];
  char *v102;
  BOOL *v103;
  BOOL *v104;
  BOOL *v105;
  int v106;
  char *v107;
  BOOL *v108;
  char *v109;
  BOOL *v110;
  int v111;
  BOOL *v112;
  char *v113;
  BOOL *v114;
  uint64_t v115;
  uint64_t v116;
  BOOL *v117;
  uint64_t v118;
  int v119;
  void (*v120)(char *, unint64_t, uint64_t);
  uint64_t v121;
  BOOL *v122;
  char *v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  BOOL *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;

  v128 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E648);
  v2 = MEMORY[0x24BDAC7A8](v128);
  v105 = (BOOL *)v101 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v104 = (BOOL *)v101 - v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v110 = (BOOL *)v101 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v122 = (BOOL *)v101 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v114 = (BOOL *)v101 - v10;
  v11 = sub_218988D84();
  v12 = (uint64_t (*)(uint64_t))MEMORY[0x24BE60AB8];
  v13 = *(_QWORD *)(v11 - 8);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v123 = (char *)v101 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v117 = (BOOL *)v101 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v101 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v103 = (char *)v101 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v109 = (char *)v101 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v108 = (BOOL *)v101 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)v101 - v28;
  v30 = MEMORY[0x24BDAC7A8](v27);
  v113 = (char *)v101 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v112 = (BOOL *)v101 - v32;
  v126 = sub_218988CD0();
  v33 = *(_QWORD *)(v126 - 8);
  MEMORY[0x24BDAC7A8](v126);
  v125 = (char *)v101 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E680);
  v129 = v13;
  v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_2189901B0;
  sub_218988D60();
  v130 = v35;
  v36 = sub_218974B58(&qword_253E6E628, v12, MEMORY[0x24BE60AD0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E630);
  sub_21897FAFC((unint64_t *)&unk_253E6E638, &qword_253E6E630, MEMORY[0x24BEE12C8]);
  sub_2189890F0();
  v37 = sub_218988CDC();
  v38 = *(_QWORD *)(v37 + 16);
  if (v38)
  {
    v124 = v36;
    v102 = v20;
    v39 = (*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
    v101[1] = v37;
    v40 = *(_QWORD *)(v33 + 72);
    v120 = *(void (**)(char *, unint64_t, uint64_t))(v33 + 16);
    v121 = v40;
    v119 = *MEMORY[0x24BE609D8];
    v111 = *MEMORY[0x24BE609D0];
    v106 = *MEMORY[0x24BE609C8];
    v118 = a1;
    v41 = v123;
    v42 = v117;
    v107 = v29;
    v116 = v33;
    v43 = v29;
    v44 = v37 + v39;
    do
    {
      v52 = v125;
      v51 = v126;
      v120(v125, v44, v126);
      v53 = (*(uint64_t (**)(char *, uint64_t))(v33 + 88))(v52, v51);
      if (v53 == v119)
      {
        v127 = (BOOL *)v44;
        v54 = v112;
        sub_218988D3C();
        v55 = *(void (**)(char *, uint64_t, uint64_t))(v129 + 16);
        v55(v43, a1, v11);
        v56 = v113;
        sub_2189890D8();
        sub_218974B58(&qword_253E6E620, (uint64_t (*)(uint64_t))MEMORY[0x24BE60AB8], MEMORY[0x24BE60AC8]);
        v57 = sub_218988F10();
        v58 = &v114[*(int *)(v128 + 48)];
        v59 = (v57 & 1) == 0;
        *v114 = v59;
        if ((v57 & 1) != 0)
        {
          v46 = *(void (**)(BOOL *, char *, uint64_t))(v129 + 32);
          v46(v58, v56, v11);
        }
        else
        {
          v115 = v38;
          v45 = v129;
          (*(void (**)(char *, uint64_t))(v129 + 8))(v56, v11);
          v55((char *)v58, (uint64_t)v54, v11);
          v55(v43, (uint64_t)v54, v11);
          sub_2189890E4();
          v46 = *(void (**)(BOOL *, char *, uint64_t))(v45 + 32);
          v38 = v115;
        }
        v44 = (unint64_t)v127;
        v47 = *(int *)(v128 + 48);
        v48 = v122;
        v49 = &v122[v47];
        *v122 = v59;
        v46(&v48[v47], (char *)v58, v11);
        v50 = *(void (**)(BOOL *, uint64_t))(v129 + 8);
        v50(v49, v11);
        v50(v54, v11);
        v42 = v117;
        a1 = v118;
        v41 = v123;
      }
      else
      {
        if (v53 != v111)
        {
          v127 = (BOOL *)v44;
          if (v53 == v106)
          {
            v67 = (BOOL *)v103;
            sub_218988D48();
            v68 = *(void (**)(char *, uint64_t, uint64_t))(v129 + 16);
            v68(v43, a1, v11);
            v69 = v102;
            sub_2189890D8();
            sub_218974B58(&qword_253E6E620, (uint64_t (*)(uint64_t))MEMORY[0x24BE60AB8], MEMORY[0x24BE60AC8]);
            v70 = sub_218988F10();
            v71 = &v104[*(int *)(v128 + 48)];
            v72 = (v70 & 1) == 0;
            *v104 = v72;
            if ((v70 & 1) != 0)
            {
              v73 = *(void (**)(BOOL *, char *, uint64_t))(v129 + 32);
              v74 = v71;
              v73(v71, v69, v11);
              v75 = v74;
            }
            else
            {
              v115 = v38;
              v87 = v129;
              v88 = v69;
              v89 = v71;
              (*(void (**)(char *, uint64_t))(v129 + 8))(v88, v11);
              v68((char *)v89, (uint64_t)v67, v11);
              v68(v43, (uint64_t)v67, v11);
              sub_2189890E4();
              v75 = v89;
              v73 = *(void (**)(BOOL *, char *, uint64_t))(v87 + 32);
              v38 = v115;
            }
            v90 = v67;
            v44 = (unint64_t)v127;
            v91 = *(int *)(v128 + 48);
            v92 = v122;
            v93 = &v122[v91];
            *v122 = v72;
            v73(&v92[v91], (char *)v75, v11);
            v94 = *(void (**)(BOOL *, uint64_t))(v129 + 8);
            v94(v93, v11);
            v94(v90, v11);
            v42 = v117;
            a1 = v118;
            v41 = v123;
          }
          else
          {
            sub_218988D60();
            v81 = *(void (**)(char *, uint64_t, uint64_t))(v129 + 16);
            v81(v43, a1, v11);
            sub_2189890D8();
            sub_218974B58(&qword_253E6E620, (uint64_t (*)(uint64_t))MEMORY[0x24BE60AB8], MEMORY[0x24BE60AC8]);
            v82 = sub_218988F10();
            v83 = v41;
            v84 = &v105[*(int *)(v128 + 48)];
            v85 = (v82 & 1) == 0;
            *v105 = v85;
            if ((v82 & 1) != 0)
            {
              v86 = *(void (**)(BOOL *, char *, uint64_t))(v129 + 32);
              v86(v84, v83, v11);
            }
            else
            {
              v115 = v38;
              v95 = v129;
              (*(void (**)(char *, uint64_t))(v129 + 8))(v83, v11);
              v81((char *)v84, (uint64_t)v42, v11);
              v81(v43, (uint64_t)v42, v11);
              sub_2189890E4();
              v86 = *(void (**)(BOOL *, char *, uint64_t))(v95 + 32);
              v38 = v115;
            }
            v44 = (unint64_t)v127;
            v96 = *(int *)(v128 + 48);
            v97 = v122;
            v98 = &v122[v96];
            *v122 = v85;
            v86(&v97[v96], (char *)v84, v11);
            v99 = *(void (**)(BOOL *, uint64_t))(v129 + 8);
            v99(v98, v11);
            v99(v42, v11);
            (*(void (**)(char *, uint64_t))(v33 + 8))(v125, v126);
            a1 = v118;
            v41 = v123;
          }
          goto LABEL_6;
        }
        v60 = v129;
        v61 = v108;
        sub_218988D54();
        v62 = *(void (**)(char *, uint64_t, uint64_t))(v60 + 16);
        v62(v43, a1, v11);
        v63 = v109;
        sub_2189890D8();
        sub_218974B58(&qword_253E6E620, (uint64_t (*)(uint64_t))MEMORY[0x24BE60AB8], MEMORY[0x24BE60AC8]);
        v64 = sub_218988F10();
        v127 = &v110[*(int *)(v128 + 48)];
        v65 = (v64 & 1) == 0;
        *v110 = v65;
        if ((v64 & 1) != 0)
        {
          v66 = *(void (**)(BOOL *, char *, uint64_t))(v60 + 32);
          v66(v127, v63, v11);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v60 + 8))(v63, v11);
          v62((char *)v127, (uint64_t)v61, v11);
          v62(v43, (uint64_t)v61, v11);
          sub_2189890E4();
          v66 = *(void (**)(BOOL *, char *, uint64_t))(v60 + 32);
        }
        v76 = v127;
        v77 = *(int *)(v128 + 48);
        v78 = v122;
        v79 = &v122[v77];
        *v122 = v65;
        v66(&v78[v77], (char *)v76, v11);
        v80 = *(void (**)(BOOL *, uint64_t))(v129 + 8);
        v80(v79, v11);
        v80(v61, v11);
        v42 = v117;
        a1 = v118;
        v41 = v123;
        v43 = v107;
      }
      v33 = v116;
LABEL_6:
      v44 += v121;
      --v38;
    }
    while (v38);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_218956F0C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  uint8_t *v42;
  void *v43;
  unint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  BOOL v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  unint64_t v83;
  id v84;
  uint64_t v85;
  NSObject *v86;
  os_log_type_t v87;
  _BOOL4 v88;
  uint64_t v89;
  uint8_t *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  unsigned int v94;
  id v95;
  id v96;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  id v117[2];

  v7 = v6;
  v114 = a5;
  v115 = a2;
  v113 = a1;
  v117[1] = *(id *)MEMORY[0x24BDAC8D0];
  v10 = sub_218988DFC();
  v109 = *(_QWORD *)(v10 - 8);
  v110 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v108 = (char *)&v99 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_218988BF8();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v112 = (char *)&v99 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v111 = (char *)&v99 - v15;
  v16 = sub_218988D84();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v99 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *(void **)(v5 + 176);
  v117[0] = 0;
  v21 = objc_msgSend(v20, sel_allPublishedLocalStatusesInDatabaseContext_error_, a4, v117);
  v22 = v117[0];
  if (v21)
  {
    v23 = v21;
    v105 = v20;
    v106 = a4;
    v104 = sub_21897FBC8(0, (unint64_t *)&unk_253E6E858);
    v24 = sub_218988FA0();
    v25 = v22;

    v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
    v26 = sub_218988D9C();
    v28 = v27;
    swift_bridgeObjectRetain();
    v107 = v26;
    v29 = v26;
    v30 = v7;
    v31 = sub_21897D6D0(v24, v29, v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v31)
    {
      if (qword_253E6EE80 != -1)
        swift_once();
      v100 = v30;
      v38 = sub_218988E20();
      __swift_project_value_buffer(v38, (uint64_t)qword_253E6EE68);
      swift_bridgeObjectRetain_n();
      v39 = sub_218988E14();
      v40 = sub_218989078();
      v41 = os_log_type_enabled(v39, v40);
      v101 = v28;
      if (v41)
      {
        v42 = (uint8_t *)swift_slowAlloc();
        v43 = (void *)swift_slowAlloc();
        v117[0] = v43;
        *(_DWORD *)v42 = 136315138;
        swift_bridgeObjectRetain();
        v116 = sub_218974338(v107, v28, (uint64_t *)v117);
        sub_2189890C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2188DF000, v39, v40, "Creating local status {identifier: %s}", v42, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A1D978](v43, -1, -1);
        MEMORY[0x219A1D978](v42, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v51 = v115;
      v52 = (uint64_t)v111;
      sub_218988BE0();
      v53 = (uint64_t)v112;
      sub_218988BE0();
      v54 = v108;
      sub_218988DC0();
      v55 = sub_218988DF0();
      v57 = v56;
      (*(void (**)(char *, uint64_t))(v109 + 8))(v54, v110);
      v58 = sub_218988DA8();
      v60 = v59;
      v61 = v113;
      sub_21897FB3C(v113, v51);
      v62 = sub_218988D78();
      v63 = objc_allocWithZone((Class)SKADatabasePublishedLocalStatus);
      v64 = sub_218972F3C(v107, v101, v52, v53, v55, v57, v58, v60, v61, v51, v62);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E8B8);
      v65 = swift_allocObject();
      *(_OWORD *)(v65 + 16) = xmmword_2189901C0;
      *(_QWORD *)(v65 + 32) = v64;
      v117[0] = (id)v65;
      sub_218988FB8();
      v66 = v64;
      v37 = sub_218988F94();
      swift_bridgeObjectRelease();
      v117[0] = 0;
      LODWORD(v62) = objc_msgSend(v105, sel_createOrUpdatePublishedLocalStatuses_databaseContext_error_, v37, v106, v117);

      LOBYTE(v37) = v117[0];
      if ((_DWORD)v62)
      {
        v67 = v117[0];
LABEL_31:
        LOBYTE(v37) = 1;

        return v37 & 1;
      }
      v68 = v117[0];
      sub_218988B74();

      swift_willThrow();
LABEL_33:

      return v37 & 1;
    }
    v32 = objc_msgSend(v31, sel_payload);
    v102 = v31;
    if (v32)
    {
      v33 = v32;
      v34 = sub_218988B8C();
      v36 = v35;

      if (v115 >> 60 == 15)
      {
        v100 = a3;
LABEL_22:
        v69 = v113;
        v44 = v115;
        sub_21897FB3C(v113, v115);
        sub_21897E088(v34, v36);
        sub_21897E088(v69, v44);
        (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v114, v16);
        v31 = v102;
        goto LABEL_23;
      }
      v45 = v113;
      sub_21897FB3C(v113, v115);
      sub_21897F884(v34, v36);
      sub_21897BAC8(v34, v36);
      LODWORD(v100) = v46;
      v47 = v45;
      v44 = v115;
      sub_21897E088(v47, v115);
      sub_21897E09C(v34, v36);
      sub_21897E09C(v34, v36);
      (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v114, v16);
      v31 = v102;
      if ((v100 & 1) == 0)
      {
LABEL_23:
        (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
LABEL_24:
        v100 = v30;
        swift_bridgeObjectRetain();
        v70 = objc_msgSend(v31, sel_creationDate);
        v71 = (uint64_t)v111;
        sub_218988BD4();

        v101 = v28;
        v72 = (uint64_t)v112;
        sub_218988BE0();
        v73 = v108;
        sub_218988DC0();
        v74 = sub_218988DF0();
        v76 = v75;
        (*(void (**)(char *, uint64_t))(v109 + 8))(v73, v110);
        v77 = sub_218988DA8();
        v79 = v78;
        v80 = v113;
        sub_21897FB3C(v113, v44);
        v81 = sub_218988D78();
        v82 = objc_allocWithZone((Class)SKADatabasePublishedLocalStatus);
        v98 = v44;
        v83 = v101;
        v84 = sub_218972F3C(v107, v101, v71, v72, v74, v76, v77, v79, v80, v98, v81);
        if (qword_253E6EE80 != -1)
          swift_once();
        v85 = sub_218988E20();
        __swift_project_value_buffer(v85, (uint64_t)qword_253E6EE68);
        swift_bridgeObjectRetain();
        v86 = sub_218988E14();
        v87 = sub_218989078();
        v88 = os_log_type_enabled(v86, v87);
        v89 = v106;
        if (v88)
        {
          v90 = (uint8_t *)swift_slowAlloc();
          v91 = (void *)swift_slowAlloc();
          v117[0] = v91;
          *(_DWORD *)v90 = 136315138;
          swift_bridgeObjectRetain();
          v116 = sub_218974338(v107, v83, (uint64_t *)v117);
          sub_2189890C0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2188DF000, v86, v87, "Updating local status {identifier: %s}", v90, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x219A1D978](v91, -1, -1);
          MEMORY[0x219A1D978](v90, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        v66 = v102;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E8B8);
        v92 = swift_allocObject();
        *(_OWORD *)(v92 + 16) = xmmword_2189901C0;
        *(_QWORD *)(v92 + 32) = v84;
        v117[0] = (id)v92;
        sub_218988FB8();
        v37 = (uint64_t)v84;
        v93 = (void *)sub_218988F94();
        swift_bridgeObjectRelease();
        v117[0] = 0;
        v94 = objc_msgSend(v105, sel_createOrUpdatePublishedLocalStatuses_databaseContext_error_, v93, v89, v117);

        if (v94)
        {
          v95 = v117[0];

          goto LABEL_31;
        }
        v96 = v117[0];
        sub_218988B74();

        swift_willThrow();
        goto LABEL_33;
      }
    }
    else
    {
      v44 = v115;
      if (v115 >> 60 != 15)
      {
        v100 = a3;
        v34 = 0;
        v36 = 0xF000000000000000;
        goto LABEL_22;
      }
      (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v114, v16);
    }
    v48 = objc_msgSend(v31, sel_targetDevicesFlags);
    v49 = sub_218988D78();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    v50 = v48 == (id)v49;
    v31 = v102;
    if (!v50)
      goto LABEL_24;
    swift_bridgeObjectRelease();
    LOBYTE(v37) = 0;

  }
  else
  {
    v37 = (uint64_t)v117[0];
    sub_218988B74();

    swift_willThrow();
  }
  return v37 & 1;
}

uint64_t sub_218957914(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t result;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22[3];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v1 + OBJC_IVAR___SKALocalStatusServer_deliverySubjects;
  swift_beginAccess();
  if (!*(_QWORD *)(*(_QWORD *)v7 + 16))
    return swift_endAccess();
  sub_218974A9C(a1);
  v9 = v8;
  result = swift_endAccess();
  if ((v9 & 1) != 0)
  {
    if (qword_253E6EE80 != -1)
      swift_once();
    v11 = sub_218988E20();
    __swift_project_value_buffer(v11, (uint64_t)qword_253E6EE68);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
    v12 = sub_218988E14();
    v13 = sub_218989078();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      v22[0] = v20;
      *(_DWORD *)v14 = 136315138;
      v19 = v14 + 4;
      sub_21897FAFC(&qword_253E6E578, &qword_253E6E718, MEMORY[0x24BE60B40]);
      v15 = sub_218989234();
      v21 = sub_218974338(v15, v16, v22);
      sub_2189890C0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      _os_log_impl(&dword_2188DF000, v12, v13, "Resetting subject for %s", v14, 0xCu);
      v17 = v20;
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v17, -1, -1);
      MEMORY[0x219A1D978](v14, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    }

    swift_beginAccess();
    if (*(_QWORD *)(*(_QWORD *)v7 + 16) && (sub_218974A9C(a1), (v18 & 1) != 0))
    {
      swift_endAccess();
      LOBYTE(v22[0]) = 1;
      swift_retain();
      sub_218988E2C();
      swift_release();
    }
    else
    {
      swift_endAccess();
    }
    swift_beginAccess();
    sub_218975158(a1);
    swift_endAccess();
    return swift_release();
  }
  return result;
}

void sub_218957C18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t isUniquelyReferenced_nonNull_native;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  unint64_t v25;
  id v26;
  unint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  NSObject *v33;
  id v34;
  char *v35;
  id v36;
  _QWORD *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  _QWORD *v45;
  uint64_t *v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  unint64_t v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  id v70;
  char *v71;
  char *v72;
  id v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  unint64_t v84;
  char v85;
  id v86;
  unint64_t v87;
  void *v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  void *v100;
  id v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  _QWORD *v109;
  BOOL v110;
  uint64_t v111;
  uint64_t v112;
  _QWORD *v113;
  BOOL v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  unint64_t v121;
  id v122;
  NSObject *v123;
  void *v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  os_log_t v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  Class isa;
  _QWORD *v134;
  BOOL v135;
  uint64_t v136;
  _QWORD *v137;
  BOOL v138;
  char *v139;
  NSObject *v140;
  char *v141;
  NSObject *v142;
  int v143;
  uint64_t v144;
  id v145;
  uint64_t v146;
  unint64_t v147;
  unint64_t v148;
  id v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  unint64_t v160;
  NSObject *v161;
  void *v162;
  id v163;
  NSObject *v164;
  id v165;
  uint64_t v166;
  unint64_t v167;
  uint64_t v168;
  uint64_t v169;
  unint64_t v170;
  uint64_t v171;
  _QWORD *v172;
  BOOL v173;
  char *v174;
  NSObject *v175;
  char *v176;
  NSObject *v177;
  NSObject *v178;
  int v179;
  _BOOL4 v180;
  uint64_t v181;
  void *v182;
  id v183;
  uint64_t v184;
  NSObject *v185;
  unint64_t v186;
  unint64_t v187;
  id v188;
  void *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  unint64_t v198;
  unint64_t v199;
  NSObject *v200;
  uint64_t v201;
  uint64_t v202;
  _QWORD *v203;
  BOOL v204;
  char *v205;
  NSObject *v206;
  os_log_type_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  unint64_t v217;
  unint64_t v218;
  NSObject *v219;
  id v220;
  void *v221;
  void *v222;
  id v223;
  id v224;
  uint64_t v225;
  NSObject *v226;
  uint64_t v227;
  char *v228;
  id v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  char *v234;
  unint64_t v235;
  char *v236;
  char *v237;
  char *v238;
  id v239;
  NSObject *v240;
  int v241;
  void *v242;
  id v243;
  uint64_t v244;
  unint64_t v245;
  unint64_t v246;
  id v247;
  void *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  unint64_t v257;
  unint64_t v258;
  os_log_t v259;
  char *v260;
  id v261;
  id v262;
  unint64_t v263;
  NSObject *v264;
  os_log_type_t v265;
  uint8_t *v266;
  void *v267;
  unsigned int v268;
  id v269;
  NSObject *v270;
  os_log_type_t v271;
  uint8_t *v272;
  void *v273;
  uint64_t v274;
  unint64_t v275;
  unint64_t v276;
  uint64_t v277;
  void *v278;
  unsigned int v279;
  id v280;
  uint64_t v281;
  id v282;
  id v283;
  void *v284;
  unint64_t v285;
  id v286;
  void *v287;
  unint64_t v288;
  uint64_t v289;
  uint64_t i;
  id v291;
  void *v292;
  id v293;
  unint64_t v294;
  uint64_t v295;
  id v296;
  id v297;
  unint64_t v298;
  id v299;
  void *v300;
  id v301;
  id v302;
  NSObject *v303;
  os_log_type_t v304;
  uint8_t *v305;
  _QWORD *v306;
  id v307;
  unint64_t v308;
  uint64_t v309;
  uint64_t v310;
  unint64_t v311;
  char *v312;
  uint64_t v313;
  objc_class *v314;
  uint64_t v315;
  id v316;
  unint64_t v317;
  uint64_t v318;
  uint64_t v319;
  unint64_t v320;
  id v321;
  void *v322;
  id v323;
  char *v324;
  void (*v325)(char *, uint64_t);
  char v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  void *v330;
  id v331;
  NSObject *v332;
  os_log_type_t v333;
  uint8_t *v334;
  unint64_t v335;
  NSObject *v336;
  os_log_type_t v337;
  uint64_t v338;
  unint64_t v339;
  uint64_t v340;
  uint64_t v341;
  __int128 v342;
  char *v343;
  uint64_t v344;
  char *v345;
  void *v346;
  id v347;
  uint64_t v348;
  unint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  unint64_t v353;
  char *v354;
  unint64_t v355;
  uint64_t v356;
  uint64_t v357;
  unint64_t v358;
  __int128 v359;
  char *v360;
  uint64_t v361;
  char *v362;
  unint64_t v363;
  char *v364;
  uint64_t v365;
  void *v366;
  int v367;
  unint64_t v368;
  unint64_t v369;
  uint64_t v370;
  id v371;
  unint64_t v372;
  char *v373;
  char *v374;
  uint64_t v375;
  NSObject *v376;
  char *v377;
  os_log_t v378;
  uint64_t v379;
  id v380;
  _QWORD *v381;
  os_log_t v382;
  uint64_t v383;
  NSObject *v384;
  unint64_t v385;
  char *v386;
  char *v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  NSObject *v391;
  uint64_t v392;
  uint64_t v393;
  char *v394;
  char v395[8];
  char v396[8];
  char v397[8];
  uint64_t v398;
  char v399[8];
  uint64_t v400;
  unint64_t v401;
  id v402;
  uint64_t v403;
  unint64_t v404;
  id v405[4];

  v351 = a2;
  v348 = a1;
  v405[3] = *(id *)MEMORY[0x24BDAC8D0];
  v389 = sub_218988BF8();
  v388 = *(_QWORD *)(v389 - 8);
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v387 = (char *)&v340 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v386 = (char *)&v340 - v4;
  isUniquelyReferenced_nonNull_native = sub_218988E20();
  v6 = *(_QWORD *)(isUniquelyReferenced_nonNull_native - 8);
  v7 = MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native);
  v9 = (char *)&v340 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v362 = (char *)&v340 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v373 = (char *)&v340 - v12;
  v13 = sub_218988D84();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v394 = (char *)&v340 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_253E6EE80 != -1)
    goto LABEL_192;
  while (1)
  {
    v375 = __swift_project_value_buffer(isUniquelyReferenced_nonNull_native, (uint64_t)qword_253E6EE68);
    v16 = sub_218988E14();
    v17 = sub_218989078();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_2188DF000, v16, v17, "reconcilePendingStatusesOnDevices START", v18, 2u);
      MEMORY[0x219A1D978](v18, -1, -1);
    }

    v19 = v390;
    v20 = sub_21895BC24((_BYTE *)0xD000000000000030, 0x8000000218993290);
    v21 = *(void **)(v19 + 176);
    v402 = 0;
    v347 = v21;
    v22 = objc_msgSend(v21, sel_allPublishedLocalStatusDevicesInDatabaseContext_error_, v351, &v402);
    v23 = v402;
    if (!v22)
    {
      v261 = v402;
      swift_bridgeObjectRelease();
      sub_218988B74();

      swift_willThrow();
      return;
    }
    v24 = v22;
    v358 = v20;
    v344 = sub_21897FBC8(0, (unint64_t *)&unk_253E6E868);
    v25 = sub_218988FA0();
    v26 = v23;

    v27 = sub_2189511E0(MEMORY[0x24BEE4AF8], (uint64_t *)&unk_255001868);
    if (v25 >> 62)
    {
      swift_bridgeObjectRetain_n();
      v28 = sub_2189891F8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v28 = *(NSObject **)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    v381 = (_QWORD *)v27;
    v364 = (char *)isUniquelyReferenced_nonNull_native;
    v363 = v6;
    v343 = v9;
    v393 = v13;
    v384 = v14;
    if (!v28)
      break;
    v392 = v25 & 0xC000000000000001;
    v6 = 4;
    v391 = v28;
    v385 = v25;
    while (1)
    {
      if (v392)
        v31 = (id)MEMORY[0x219A1CED4](v6 - 4, v25);
      else
        v31 = *(id *)(v25 + 8 * v6);
      v32 = v31;
      v33 = (v6 - 3);
      if (__OFADD__(v6 - 4, 1))
        goto LABEL_187;
      v34 = objc_msgSend(v31, sel_idsIdentifier);
      v14 = sub_218988F28();
      v9 = v35;

      v36 = v32;
      v37 = v381;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v402 = v37;
      v39 = sub_218974A38(v14, (uint64_t)v9);
      v40 = v37[2];
      v41 = (v38 & 1) == 0;
      v42 = v40 + v41;
      if (__OFADD__(v40, v41))
        break;
      v13 = v38;
      if (v37[3] >= v42)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_218977A1C((uint64_t *)&unk_255001868);
      }
      else
      {
        sub_2189755A4(v42, isUniquelyReferenced_nonNull_native, (uint64_t *)&unk_255001868);
        v43 = sub_218974A38(v14, (uint64_t)v9);
        if ((v13 & 1) != (v44 & 1))
        {
          sub_218989264();
          __break(1u);
LABEL_287:

          __break(1u);
          return;
        }
        v39 = v43;
      }
      v45 = v402;
      v381 = v402;
      if ((v13 & 1) != 0)
      {
        v29 = *((_QWORD *)v402 + 7);
        v30 = 8 * v39;

        *(_QWORD *)(v29 + v30) = v36;
      }
      else
      {
        *((_QWORD *)v402 + (v39 >> 6) + 8) |= 1 << v39;
        v46 = (uint64_t *)(v45[6] + 16 * v39);
        *v46 = v14;
        v46[1] = (uint64_t)v9;
        *(_QWORD *)(v45[7] + 8 * v39) = v36;
        v47 = v45[2];
        v48 = __OFADD__(v47, 1);
        v49 = v47 + 1;
        if (v48)
          goto LABEL_189;
        v45[2] = v49;
        swift_bridgeObjectRetain();
      }

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      ++v6;
      v14 = (uint64_t)v384;
      v25 = v385;
      if (v33 == v391)
        goto LABEL_24;
    }
LABEL_188:
    __break(1u);
LABEL_189:
    __break(1u);
LABEL_190:
    __break(1u);
LABEL_191:
    __break(1u);
LABEL_192:
    swift_once();
  }
LABEL_24:
  swift_bridgeObjectRelease();
  v402 = 0;
  v50 = objc_msgSend(v347, sel_allPublishedLocalStatusesInDatabaseContext_error_, v351, &v402);
  v51 = v402;
  if (!v50)
  {
    v262 = v402;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_218988B74();

    swift_willThrow();
LABEL_228:
    swift_bridgeObjectRelease();
    return;
  }
  v52 = v50;
  v357 = sub_21897FBC8(0, (unint64_t *)&unk_253E6E858);
  v392 = sub_218988FA0();
  v53 = v51;

  v401 = MEMORY[0x24BEE4AF8];
  v54 = v383;
  v55 = sub_21895CE7C(v25, (uint64_t)v399, (SEL *)&selRef_idsIdentifier);
  v346 = (void *)v54;
  swift_bridgeObjectRelease();
  v56 = sub_21897BD40(v55);
  swift_bridgeObjectRelease();
  v400 = v56;
  v58 = v358;
  if (v358 >> 62)
    goto LABEL_195;
  v59 = *(_QWORD *)((v358 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v59)
  {
    v60 = 0;
    v355 = v58 & 0xC000000000000001;
    v350 = v58 & 0xFFFFFFFFFFFFFF8;
    v349 = v58 + 32;
    v61 = v392 & 0xFFFFFFFFFFFFFF8;
    v383 = v392 & 0xFFFFFFFFFFFFFF8;
    if (v392 < 0)
      v61 = v392;
    v341 = v61;
    v62 = v392 & 0xC000000000000001;
    v379 = v392 + 32;
    v360 = v399;
    v353 = (unint64_t)v392 >> 62;
    *(_QWORD *)&v57 = 136315394;
    v359 = v57;
    v340 = MEMORY[0x24BEE4AD8] + 8;
    *(_QWORD *)&v57 = 136315138;
    v342 = v57;
    v352 = v59;
    v385 = v392 & 0xC000000000000001;
    while (1)
    {
      if (v355)
      {
        v63 = (char *)MEMORY[0x219A1CED4](v60, v58);
      }
      else
      {
        if (v60 >= *(_QWORD *)(v350 + 16))
          goto LABEL_191;
        v63 = (char *)*(id *)(v349 + 8 * v60);
      }
      v9 = v63;
      v48 = __OFADD__(v60, 1);
      v64 = v60 + 1;
      if (v48)
        goto LABEL_190;
      v369 = v64;
      v65 = objc_msgSend(v63, sel_uniqueID, v340, v341);
      if (v65)
        break;

LABEL_31:
      v60 = v369;
      v58 = v358;
      if (v369 == v59)
        goto LABEL_196;
    }
    v66 = v65;
    v356 = sub_218988F28();
    v361 = v67;

    v405[0] = (id)MEMORY[0x24BEE4AF8];
    if (!v353)
    {
      v68 = *(_QWORD *)(v383 + 16);
      swift_bridgeObjectRetain();
      if (v68)
        goto LABEL_40;
LABEL_164:
      swift_bridgeObjectRelease();
      v80 = MEMORY[0x24BEE4AF8];
      if (MEMORY[0x24BEE4AF8] >> 62)
        goto LABEL_165;
LABEL_58:
      if (*(_QWORD *)((v80 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_59;
LABEL_166:
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      goto LABEL_31;
    }
    swift_bridgeObjectRetain();
    v68 = sub_2189891F8();
    if (!v68)
      goto LABEL_164;
LABEL_40:
    v69 = 0;
    do
    {
      if (v62)
      {
        v70 = (id)MEMORY[0x219A1CED4](v69, v392);
      }
      else
      {
        if (v69 >= *(_QWORD *)(v383 + 16))
          goto LABEL_185;
        v70 = *(id *)(v379 + 8 * v69);
      }
      isUniquelyReferenced_nonNull_native = (unint64_t)v70;
      v48 = __OFADD__(v69++, 1);
      if (v48)
      {
        __break(1u);
LABEL_185:
        __break(1u);
LABEL_186:
        __break(1u);
LABEL_187:
        __break(1u);
        goto LABEL_188;
      }
      objc_msgSend(v70, sel_targetDevicesFlags);
      v71 = v394;
      sub_218988D6C();
      v6 = sub_218988D30();
      v13 = v14;
      (*(void (**)(char *, uint64_t))(v14 + 8))(v71, v393);
      v72 = v9;
      v73 = objc_msgSend(v9, sel_deviceType);
      if (!*(_QWORD *)(v6 + 16))
        goto LABEL_41;
      v74 = v73;
      sub_2189892C4();
      sub_2189892D0();
      v75 = sub_2189892E8();
      v76 = -1 << *(_BYTE *)(v6 + 32);
      v77 = v75 & ~v76;
      if (((*(_QWORD *)(v6 + 56 + ((v77 >> 3) & 0xFFFFFFFFFFFFF8)) >> v77) & 1) == 0)
        goto LABEL_41;
      v78 = *(_QWORD *)(v6 + 48);
      if (*(id *)(v78 + 8 * v77) != v74)
      {
        v79 = ~v76;
        while (1)
        {
          v77 = (v77 + 1) & v79;
          if (((*(_QWORD *)(v6 + 56 + ((v77 >> 3) & 0xFFFFFFFFFFFFF8)) >> v77) & 1) == 0)
            break;
          if (*(id *)(v78 + 8 * v77) == v74)
            goto LABEL_54;
        }
LABEL_41:

        swift_bridgeObjectRelease();
        v9 = v72;
        goto LABEL_42;
      }
LABEL_54:
      swift_bridgeObjectRelease();
      isUniquelyReferenced_nonNull_native = (unint64_t)(id)isUniquelyReferenced_nonNull_native;
      MEMORY[0x219A1CCF4]();
      v6 = *(_QWORD *)(((unint64_t)v405[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
      v9 = v72;
      if (v6 >= *(_QWORD *)(((unint64_t)v405[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_218988FC4();
      sub_218988FD0();
      sub_218988FB8();

LABEL_42:
      v14 = v13;
    }
    while (v69 != v68);
    swift_bridgeObjectRelease();
    v80 = (unint64_t)v405[0];
    v59 = v352;
    if (!((unint64_t)v405[0] >> 62))
      goto LABEL_58;
LABEL_165:
    swift_bridgeObjectRetain();
    v225 = sub_2189891F8();
    swift_bridgeObjectRelease();
    if (!v225)
      goto LABEL_166;
LABEL_59:
    v81 = v356;
    v82 = v361;
    sub_21897893C(v356, v361);
    swift_bridgeObjectRelease();
    v83 = v381;
    if (!v381[2])
      goto LABEL_92;
    swift_bridgeObjectRetain();
    v84 = sub_218974A38(v81, v82);
    if ((v85 & 1) == 0)
    {
      swift_bridgeObjectRelease();
LABEL_92:
      v115 = objc_allocWithZone((Class)SKADatabasePublishedLocalStatusDevice);
      v116 = (void *)sub_218988F1C();
      swift_bridgeObjectRelease();
      v6 = v357;
      v117 = (void *)sub_218988F94();
      swift_bridgeObjectRelease();
      v118 = (void *)sub_218988F94();
      v119 = objc_msgSend(v115, sel_initWithIDSIdentifier_pendingStatuses_deliveredStatuses_, v116, v117, v118);

      v120 = v119;
      MEMORY[0x219A1CCF4]();
      isUniquelyReferenced_nonNull_native = *(_QWORD *)((v401 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (isUniquelyReferenced_nonNull_native >= *(_QWORD *)((v401 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_218988FC4();
      sub_218988FD0();
      sub_218988FB8();

LABEL_162:
      v62 = v385;
      goto LABEL_31;
    }
    v374 = v9;
    v9 = (char *)*(id *)(v83[7] + 8 * v84);
    swift_bridgeObjectRelease();
    v86 = objc_msgSend(v9, sel_pendingStatuses);
    v13 = v357;
    v87 = sub_218988FA0();

    v88 = v346;
    v89 = (void *)sub_21895CE7C(v87, (uint64_t)v397, (SEL *)&selRef_identifier);
    swift_bridgeObjectRelease();
    v90 = objc_msgSend(v9, sel_deliveredStatuses);
    isUniquelyReferenced_nonNull_native = sub_218988FA0();

    v91 = sub_21895CE7C(isUniquelyReferenced_nonNull_native, (uint64_t)v396, (SEL *)&selRef_identifier);
    swift_bridgeObjectRelease();
    v402 = v89;
    sub_218978AC8(v91);
    v382 = (os_log_t)sub_21897BD40((uint64_t)v402);
    swift_bridgeObjectRelease();
    v92 = sub_21895CFF4(v348);
    v370 = sub_21897BD40(v92);
    swift_bridgeObjectRelease();
    v93 = swift_bridgeObjectRetain();
    v94 = sub_21895CE7C(v93, (uint64_t)v395, (SEL *)&selRef_identifier);
    v346 = v88;
    swift_bridgeObjectRelease();
    v95 = sub_21897BD40(v94);
    swift_bridgeObjectRelease();
    v404 = MEMORY[0x24BEE4AF8];
    v345 = v9;
    v96 = objc_msgSend(v9, sel_pendingStatuses);
    v6 = sub_218988FA0();

    if (v6 >> 62)
    {
      swift_bridgeObjectRetain();
      v97 = sub_2189891F8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v97 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v62 = v385;
    if (!v97)
    {
LABEL_95:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v403 = MEMORY[0x24BEE4AF8];
      v368 = (unint64_t)v405[0];
      if ((unint64_t)v405[0] >> 62)
      {
        swift_bridgeObjectRetain();
        v6 = sub_2189891F8();
        swift_bridgeObjectRelease();
      }
      else
      {
        v6 = *(_QWORD *)(((unint64_t)v405[0] & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      v9 = v364;
      v121 = v363;
      v13 = v370;
      if (v6)
      {
        v122 = 0;
        v372 = v368 & 0xC000000000000001;
        v354 = (char *)(v368 + 32);
        v378 = v382 + 7;
        v377 = (char *)(v370 + 56);
        v371 = (id)v6;
        while (1)
        {
          if (v372)
          {
            v123 = MEMORY[0x219A1CED4](v122, v368);
            v48 = __OFADD__(v122, 1);
            v124 = (char *)v122 + 1;
            if (v48)
              goto LABEL_186;
          }
          else
          {
            v123 = *(id *)&v354[8 * (_QWORD)v122];
            v48 = __OFADD__(v122, 1);
            v124 = (char *)v122 + 1;
            if (v48)
              goto LABEL_186;
          }
          v380 = v124;
          v391 = v123;
          v125 = -[NSObject identifier](v123, sel_identifier);
          v126 = sub_218988F28();
          v128 = v127;

          if (!v382[2].isa)
            goto LABEL_122;
          v129 = v382;
          sub_2189892C4();
          sub_218988F4C();
          v130 = sub_2189892E8();
          v131 = -1 << LOBYTE(v129[4].isa);
          v132 = v130 & ~v131;
          if (((*(unint64_t *)((char *)&v378->isa + ((v132 >> 3) & 0xFFFFFFFFFFFFF8)) >> v132) & 1) == 0)
            goto LABEL_122;
          isa = v382[6].isa;
          v134 = (_QWORD *)((char *)isa + 16 * v132);
          v135 = *v134 == v126 && v134[1] == v128;
          if (!v135 && (sub_218989240() & 1) == 0)
            break;
LABEL_113:
          swift_bridgeObjectRelease();
          v62 = v385;
LABEL_129:
          v164 = v391;
          v165 = -[NSObject identifier](v391, sel_identifier);
          v166 = sub_218988F28();
          isUniquelyReferenced_nonNull_native = v167;

          if (*(_QWORD *)(v13 + 16))
          {
            sub_2189892C4();
            sub_218988F4C();
            v168 = sub_2189892E8();
            v169 = -1 << *(_BYTE *)(v13 + 32);
            v170 = v168 & ~v169;
            if (((*(_QWORD *)&v377[(v170 >> 3) & 0xFFFFFFFFFFFFF8] >> v170) & 1) == 0)
              goto LABEL_152;
            v171 = *(_QWORD *)(v13 + 48);
            v172 = (_QWORD *)(v171 + 16 * v170);
            v173 = *v172 == v166 && v172[1] == isUniquelyReferenced_nonNull_native;
            if (!v173 && (sub_218989240() & 1) == 0)
            {
              v202 = ~v169;
              while (1)
              {
                v170 = (v170 + 1) & v202;
                if (((*(_QWORD *)&v377[(v170 >> 3) & 0xFFFFFFFFFFFFF8] >> v170) & 1) == 0)
                  break;
                v203 = (_QWORD *)(v171 + 16 * v170);
                v204 = *v203 == v166 && v203[1] == isUniquelyReferenced_nonNull_native;
                if (v204 || (sub_218989240() & 1) != 0)
                  goto LABEL_136;
              }
LABEL_152:

              swift_bridgeObjectRelease();
              v62 = v385;
              goto LABEL_100;
            }
LABEL_136:
            swift_bridgeObjectRelease();
            v174 = v362;
            (*(void (**)(char *, uint64_t, char *))(v121 + 16))(v362, v375, v9);
            v175 = v391;
            v176 = v374;
            v177 = v175;
            v6 = v176;
            v178 = sub_218988E14();
            v179 = sub_218989078();
            v391 = v178;
            v180 = os_log_type_enabled(v178, (os_log_type_t)v179);
            v376 = v177;
            if (v180)
            {
              v367 = v179;
              v181 = swift_slowAlloc();
              v182 = (void *)swift_slowAlloc();
              v402 = v182;
              *(_DWORD *)v181 = v359;
              v183 = -[NSObject identifier](v177, sel_identifier);
              v184 = sub_218988F28();
              v185 = v177;
              v187 = v186;

              v398 = sub_218974338(v184, v187, (uint64_t *)&v402);
              sub_2189890C0();

              swift_bridgeObjectRelease();
              *(_WORD *)(v181 + 12) = 2080;
              v188 = objc_msgSend((id)v6, sel_uniqueID);
              if (!v188)
                goto LABEL_285;
              v189 = v188;
              v366 = (void *)(v181 + 14);
              sub_218988F28();

              v190 = sub_21897BF64(8);
              v192 = v191;
              v194 = v193;
              v196 = v195;
              swift_bridgeObjectRelease();
              v197 = MEMORY[0x219A1CCAC](v190, v192, v194, v196);
              v199 = v198;
              swift_bridgeObjectRelease();
              v398 = sub_218974338(v197, v199, (uint64_t *)&v402);
              sub_2189890C0();

              swift_bridgeObjectRelease();
              v200 = v391;
              _os_log_impl(&dword_2188DF000, v391, (os_log_type_t)v367, "Adding reset status to pending statuses {status: %s, device: %s", (uint8_t *)v181, 0x16u);
              swift_arrayDestroy();
              MEMORY[0x219A1D978](v182, -1, -1);
              MEMORY[0x219A1D978](v181, -1, -1);

              v121 = v363;
              v9 = v364;
              v201 = (*(uint64_t (**)(char *, char *))(v363 + 8))(v362, v364);
              v14 = (uint64_t)v384;
              v13 = v370;
            }
            else
            {

              v201 = (*(uint64_t (**)(char *, char *))(v121 + 8))(v174, v9);
            }
            MEMORY[0x219A1CCF4](v201);
            isUniquelyReferenced_nonNull_native = *(_QWORD *)((v404 & 0xFFFFFFFFFFFFFF8) + 0x10);
            v62 = v385;
            v6 = (unint64_t)v371;
            v122 = v380;
            if (isUniquelyReferenced_nonNull_native >= *(_QWORD *)((v404 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_218988FC4();
            sub_218988FD0();
            sub_218988FB8();
            if (v122 == (id)v6)
              goto LABEL_153;
          }
          else
          {

            swift_bridgeObjectRelease();
LABEL_100:
            v6 = (unint64_t)v371;
            v122 = v380;
            if (v380 == v371)
              goto LABEL_153;
          }
        }
        v136 = ~v131;
        while (1)
        {
          v132 = (v132 + 1) & v136;
          if (((*(unint64_t *)((char *)&v378->isa + ((v132 >> 3) & 0xFFFFFFFFFFFFF8)) >> v132) & 1) == 0)
            break;
          v137 = (_QWORD *)((char *)isa + 16 * v132);
          v138 = *v137 == v126 && v137[1] == v128;
          if (v138 || (sub_218989240() & 1) != 0)
            goto LABEL_113;
        }
LABEL_122:
        swift_bridgeObjectRelease();
        v139 = v373;
        (*(void (**)(char *, uint64_t, char *))(v121 + 16))(v373, v375, v9);
        v140 = v391;
        v141 = v374;
        v6 = v140;
        v13 = v141;
        v142 = sub_218988E14();
        v143 = sub_218989078();
        v376 = v142;
        if (os_log_type_enabled(v142, (os_log_type_t)v143))
        {
          v367 = v143;
          v144 = swift_slowAlloc();
          v366 = (void *)swift_slowAlloc();
          v402 = v366;
          *(_DWORD *)v144 = v359;
          v145 = objc_msgSend((id)v6, sel_identifier);
          v146 = sub_218988F28();
          v148 = v147;

          v398 = sub_218974338(v146, v148, (uint64_t *)&v402);
          sub_2189890C0();

          swift_bridgeObjectRelease();
          *(_WORD *)(v144 + 12) = 2080;
          v149 = objc_msgSend((id)v13, sel_uniqueID);
          if (!v149)
            goto LABEL_283;
          v150 = v149;
          v365 = v144 + 14;
          sub_218988F28();

          v151 = sub_21897BF64(8);
          v153 = v152;
          v155 = v154;
          v157 = v156;
          swift_bridgeObjectRelease();
          v158 = MEMORY[0x219A1CCAC](v151, v153, v155, v157);
          v160 = v159;
          swift_bridgeObjectRelease();
          v398 = sub_218974338(v158, v160, (uint64_t *)&v402);
          sub_2189890C0();

          swift_bridgeObjectRelease();
          v161 = v376;
          _os_log_impl(&dword_2188DF000, v376, (os_log_type_t)v367, "Adding new pending status to database device {status: %s, device: %s}", (uint8_t *)v144, 0x16u);
          v162 = v366;
          swift_arrayDestroy();
          MEMORY[0x219A1D978](v162, -1, -1);
          MEMORY[0x219A1D978](v144, -1, -1);

          v121 = v363;
          v9 = v364;
          (*(void (**)(char *, char *))(v363 + 8))(v373, v364);
          v14 = (uint64_t)v384;
        }
        else
        {

          (*(void (**)(char *, char *))(v121 + 8))(v139, v9);
        }
        v163 = (id)v6;
        MEMORY[0x219A1CCF4]();
        v62 = v385;
        v13 = v370;
        if (*(_QWORD *)((v404 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v404 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_218988FC4();
        sub_218988FD0();
        sub_218988FB8();
        goto LABEL_129;
      }
LABEL_153:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v205 = v374;
      if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) == 0
        || (v226 = sub_2189891F8(), v227 = MEMORY[0x24BEE4AF8], !v226))
      {
LABEL_154:
        swift_bridgeObjectRelease();
        if (!*(_QWORD *)(v348 + 16))
        {
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v59 = v352;
          goto LABEL_31;
        }
        swift_bridgeObjectRetain_n();
        v206 = sub_218988E14();
        v207 = sub_218989078();
        if (os_log_type_enabled(v206, v207))
        {
          v208 = swift_slowAlloc();
          v391 = swift_slowAlloc();
          v402 = v391;
          *(_DWORD *)v208 = v342;
          v382 = (os_log_t)(v208 + 4);
          swift_bridgeObjectRetain();
          v209 = sub_21897BF64(8);
          v211 = v210;
          v213 = v212;
          v215 = v214;
          swift_bridgeObjectRelease();
          v216 = v213;
          v14 = (uint64_t)v384;
          v13 = MEMORY[0x219A1CCAC](v209, v211, v216, v215);
          v218 = v217;
          swift_bridgeObjectRelease();
          v398 = sub_218974338(v13, v218, (uint64_t *)&v402);
          sub_2189890C0();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2188DF000, v206, v207, "Saving modified status to database {device: %s}", (uint8_t *)v208, 0xCu);
          v219 = v391;
          swift_arrayDestroy();
          MEMORY[0x219A1D978](v219, -1, -1);
          MEMORY[0x219A1D978](v208, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        v59 = v352;
        v220 = objc_allocWithZone((Class)SKADatabasePublishedLocalStatusDevice);
        v221 = (void *)sub_218988F1C();
        swift_bridgeObjectRelease();
        v9 = (char *)v357;
        v6 = sub_218988F94();
        swift_bridgeObjectRelease();
        v222 = (void *)sub_218988F94();
        swift_bridgeObjectRelease();
        v223 = objc_msgSend(v220, sel_initWithIDSIdentifier_pendingStatuses_deliveredStatuses_, v221, v6, v222);

        v224 = v223;
        MEMORY[0x219A1CCF4]();
        isUniquelyReferenced_nonNull_native = *(_QWORD *)((v401 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (isUniquelyReferenced_nonNull_native >= *(_QWORD *)((v401 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_218988FC4();
        sub_218988FD0();
        sub_218988FB8();

        goto LABEL_162;
      }
      v9 = (char *)v226;
      v13 = 0;
      v391 = v226;
      while (1)
      {
        v228 = (char *)(v13 + 1);
        if (__OFADD__(v13, 1))
          break;
        isUniquelyReferenced_nonNull_native = (unint64_t)*(id *)(v227 + 8 * v13 + 32);
        v229 = objc_msgSend((id)isUniquelyReferenced_nonNull_native, sel_identifier);
        v230 = sub_218988F28();
        v232 = v231;

        LOBYTE(v229) = sub_21895E7C8(v230, v232, v370);
        v233 = swift_bridgeObjectRelease();
        if ((v229 & 1) != 0)
        {
          v234 = v205;
          v235 = v363;
          v236 = v343;
          v237 = v364;
          (*(void (**)(char *, uint64_t, char *))(v363 + 16))(v343, v375, v364);
          v238 = v234;
          v239 = (id)isUniquelyReferenced_nonNull_native;
          isUniquelyReferenced_nonNull_native = v238;
          v6 = (unint64_t)v239;
          v240 = sub_218988E14();
          v241 = sub_218989078();
          if (os_log_type_enabled(v240, (os_log_type_t)v241))
          {
            LODWORD(v378) = v241;
            v382 = v240;
            v242 = (void *)isUniquelyReferenced_nonNull_native;
            isUniquelyReferenced_nonNull_native = swift_slowAlloc();
            v377 = (char *)swift_slowAlloc();
            v402 = v377;
            *(_DWORD *)isUniquelyReferenced_nonNull_native = v359;
            v243 = objc_msgSend((id)v6, sel_identifier);
            v244 = sub_218988F28();
            v246 = v245;

            *(_QWORD *)(isUniquelyReferenced_nonNull_native + 4) = sub_218974338(v244, v246, (uint64_t *)&v402);
            v380 = (id)v6;

            swift_bridgeObjectRelease();
            *(_WORD *)(isUniquelyReferenced_nonNull_native + 12) = 2080;
            v6 = (unint64_t)v242;
            v247 = objc_msgSend(v242, sel_uniqueID);
            if (!v247)
              goto LABEL_287;
            v248 = v247;
            sub_218988F28();

            v249 = sub_21897BF64(8);
            v251 = v250;
            v253 = v252;
            v255 = v254;
            swift_bridgeObjectRelease();
            v256 = MEMORY[0x219A1CCAC](v249, v251, v253, v255);
            v258 = v257;
            swift_bridgeObjectRelease();
            *(_QWORD *)(isUniquelyReferenced_nonNull_native + 14) = sub_218974338(v256, v258, (uint64_t *)&v402);

            swift_bridgeObjectRelease();
            v259 = v382;
            _os_log_impl(&dword_2188DF000, v382, (os_log_type_t)v378, "Removing reset status from delivered statuses {status: %s, device: %s}", (uint8_t *)isUniquelyReferenced_nonNull_native, 0x16u);
            v260 = v377;
            swift_arrayDestroy();
            MEMORY[0x219A1D978](v260, -1, -1);
            MEMORY[0x219A1D978](isUniquelyReferenced_nonNull_native, -1, -1);

            (*(void (**)(char *, char *))(v363 + 8))(v343, v364);
          }
          else
          {

            (*(void (**)(char *, char *))(v235 + 8))(v236, v237);
          }
          v14 = (uint64_t)v384;
          v62 = v385;
          v205 = v374;
          v9 = (char *)v391;
        }
        else
        {
          MEMORY[0x219A1CCF4](v233);
          v6 = *(_QWORD *)((v403 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v6 >= *(_QWORD *)((v403 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_218988FC4();
          sub_218988FD0();
          sub_218988FB8();
          v62 = v385;
        }
        ++v13;
        v227 = MEMORY[0x24BEE4AF8];
        if (v228 == v9)
          goto LABEL_154;
      }
LABEL_284:
      __break(1u);
LABEL_285:

      __break(1u);
    }
    if (v97 >= 1)
    {
      v98 = 0;
      v380 = (id)(v6 & 0xC000000000000001);
      v377 = (char *)(v6 + 32);
      v391 = (v95 + 56);
      v378 = (os_log_t)v97;
      while (1)
      {
        v99 = v380 ? (id)MEMORY[0x219A1CED4](v98, v6) : *(id *)&v377[8 * v98];
        v100 = v99;
        v101 = objc_msgSend(v99, sel_identifier);
        v102 = sub_218988F28();
        isUniquelyReferenced_nonNull_native = v103;

        if (*(_QWORD *)(v95 + 16))
          break;

        swift_bridgeObjectRelease();
LABEL_67:
        ++v98;
        v14 = (uint64_t)v384;
        if (v98 == v97)
          goto LABEL_95;
      }
      v104 = v6;
      sub_2189892C4();
      sub_218988F4C();
      v105 = sub_2189892E8();
      v106 = -1 << *(_BYTE *)(v95 + 32);
      v107 = v105 & ~v106;
      if (((*(unint64_t *)((char *)&v391->isa + ((v107 >> 3) & 0xFFFFFFFFFFFFF8)) >> v107) & 1) != 0)
      {
        v108 = *(_QWORD *)(v95 + 48);
        v109 = (_QWORD *)(v108 + 16 * v107);
        v110 = *v109 == v102 && v109[1] == isUniquelyReferenced_nonNull_native;
        if (v110 || (sub_218989240() & 1) != 0)
        {
LABEL_78:
          v111 = swift_bridgeObjectRelease();
          MEMORY[0x219A1CCF4](v111);
          isUniquelyReferenced_nonNull_native = *(_QWORD *)((v404 & 0xFFFFFFFFFFFFFF8) + 0x10);
          v62 = v385;
          v6 = v104;
          if (isUniquelyReferenced_nonNull_native >= *(_QWORD *)((v404 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_218988FC4();
          sub_218988FD0();
          sub_218988FB8();
          goto LABEL_90;
        }
        v112 = ~v106;
        while (1)
        {
          v107 = (v107 + 1) & v112;
          if (((*(unint64_t *)((char *)&v391->isa + ((v107 >> 3) & 0xFFFFFFFFFFFFF8)) >> v107) & 1) == 0)
            break;
          v113 = (_QWORD *)(v108 + 16 * v107);
          v114 = *v113 == v102 && v113[1] == isUniquelyReferenced_nonNull_native;
          if (v114 || (sub_218989240() & 1) != 0)
            goto LABEL_78;
        }
      }

      swift_bridgeObjectRelease();
      v62 = v385;
      v6 = v104;
LABEL_90:
      v97 = (uint64_t)v378;
      goto LABEL_67;
    }
    __break(1u);
LABEL_195:
    swift_bridgeObjectRetain();
    v59 = sub_2189891F8();
    swift_bridgeObjectRelease();
    v58 = v358;
  }
LABEL_196:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v401 >> 62)
  {
    swift_bridgeObjectRetain();
    v309 = sub_2189891F8();
    swift_bridgeObjectRelease();
    if (!v309)
      goto LABEL_205;
  }
  else if (!*(_QWORD *)((v401 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_205;
  }
  v263 = v401;
  swift_bridgeObjectRetain_n();
  v264 = sub_218988E14();
  v265 = sub_218989078();
  if (os_log_type_enabled(v264, v265))
  {
    v266 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v266 = 134217984;
    if (v263 >> 62)
    {
      swift_bridgeObjectRetain();
      v6 = sub_2189891F8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v6 = *(_QWORD *)((v263 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    v402 = (id)v6;
    sub_2189890C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2188DF000, v264, v265, "reconcilePendingStatusesOnDevices inserting new devices {devicesToSave.count: %ld}", v266, 0xCu);
    MEMORY[0x219A1D978](v266, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v267 = (void *)sub_218988F94();
  swift_bridgeObjectRelease();
  v405[0] = 0;
  v268 = objc_msgSend(v347, sel_createOrUpdatePublishedLocalStatusDevices_databaseContext_error_, v267, v351, v405);

  if (!v268)
  {
    v296 = v405[0];
    swift_bridgeObjectRelease();
    sub_218988B74();

    swift_willThrow();
LABEL_227:
    swift_bridgeObjectRelease();
    goto LABEL_228;
  }
  v269 = v405[0];
LABEL_205:
  if (!*(_QWORD *)(v400 + 16))
    goto LABEL_210;
  v270 = sub_218988E14();
  v271 = sub_218989078();
  if (os_log_type_enabled(v270, v271))
  {
    v272 = (uint8_t *)swift_slowAlloc();
    v273 = (void *)swift_slowAlloc();
    v405[0] = v273;
    *(_DWORD *)v272 = 136315138;
    v6 = (unint64_t)(v272 + 12);
    swift_beginAccess();
    v13 = v400;
    swift_bridgeObjectRetain();
    v274 = sub_21898903C();
    v276 = v275;
    swift_bridgeObjectRelease();
    v404 = sub_218974338(v274, v276, (uint64_t *)v405);
    sub_2189890C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2188DF000, v270, v271, "reconcilePendingStatusesOnDevices removing ids lost devices {deviceIDsToRemove: %s}", v272, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A1D978](v273, -1, -1);
    MEMORY[0x219A1D978](v272, -1, -1);
  }

  swift_beginAccess();
  v277 = swift_bridgeObjectRetain();
  sub_218978DD0(v277);
  swift_bridgeObjectRelease();
  v278 = (void *)sub_218988F94();
  swift_release();
  v404 = 0;
  v279 = objc_msgSend(v347, sel_deletePublishedLocalStatusDevices_databaseContext_error_, v278, v351, &v404);

  if (!v279)
  {
    v297 = (id)v404;
    swift_bridgeObjectRelease();
    sub_218988B74();

    swift_willThrow();
    goto LABEL_227;
  }
  v280 = (id)v404;
LABEL_210:
  v281 = MEMORY[0x24BEE4AF8];
  v404 = MEMORY[0x24BEE4AF8];
  v398 = 0;
  v282 = objc_msgSend(v347, sel_allPublishedLocalStatusDevicesInDatabaseContext_error_, v351, &v398, v340, v341);
  v283 = (id)v398;
  if (!v282)
  {
    v299 = (id)v398;
    swift_bridgeObjectRelease();
    v300 = (void *)sub_218988B74();

    swift_willThrow();
    v380 = 0;
    v301 = v300;
    v302 = v300;
    v303 = sub_218988E14();
    v304 = sub_218989060();
    if (os_log_type_enabled(v303, v304))
    {
      v305 = (uint8_t *)swift_slowAlloc();
      v306 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v305 = 138412290;
      v307 = v300;
      v308 = _swift_stdlib_bridgeErrorToNSError();
      v404 = v308;
      sub_2189890C0();
      *v306 = v308;

      _os_log_impl(&dword_2188DF000, v303, v304, "Failed to fetch all published local status devices while evaluating recent statuses: %@", v305, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v306, -1, -1);
      MEMORY[0x219A1D978](v305, -1, -1);

    }
    else
    {

    }
    goto LABEL_274;
  }
  v284 = v282;
  v285 = sub_218988FA0();
  v286 = v283;

  swift_retain();
  v287 = v346;
  v288 = sub_21897D874(v285);
  v380 = v287;
  swift_bridgeObjectRelease();
  swift_release();
  v398 = v281;
  if (v288 >> 62)
  {
    v289 = sub_2189891F8();
    if (v289)
      goto LABEL_213;
  }
  else
  {
    v289 = *(_QWORD *)((v288 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v289)
    {
LABEL_213:
      if (v289 < 1)
      {
        __break(1u);
LABEL_283:

        __break(1u);
        goto LABEL_284;
      }
      for (i = 0; i != v289; ++i)
      {
        if ((v288 & 0xC000000000000001) != 0)
          v291 = (id)MEMORY[0x219A1CED4](i, v288);
        else
          v291 = *(id *)(v288 + 8 * i + 32);
        v292 = v291;
        v293 = objc_msgSend(v291, sel_pendingStatuses);
        v294 = sub_218988FA0();

        if (v294 >> 62)
        {
          swift_bridgeObjectRetain();
          v295 = sub_2189891F8();
          swift_bridgeObjectRelease();
        }
        else
        {
          v295 = *(_QWORD *)((v294 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
        if (v295)
        {
          sub_21898918C();
          sub_2189891A4();
          sub_2189891B0();
          sub_218989198();
        }
        else
        {

        }
      }
      swift_bridgeObjectRelease();
      v298 = v398;
      if (v398 < 0)
        goto LABEL_266;
      goto LABEL_239;
    }
  }
  swift_bridgeObjectRelease();
  v298 = MEMORY[0x24BEE4AF8];
  if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
    goto LABEL_266;
LABEL_239:
  if ((v298 & 0x4000000000000000) != 0)
    goto LABEL_266;
  v310 = *(_QWORD *)(v298 + 16);
  if (!v310)
    goto LABEL_267;
  do
  {
    v311 = 0;
    v393 = OBJC_IVAR___SKALocalStatusServer_screenOffStatusTimeoutSeconds;
    v385 = v298 & 0xC000000000000001;
    v382 = (os_log_t)(v298 + 32);
    v384 = v298;
    v383 = v310;
    v312 = v386;
    v313 = v389;
    while (1)
    {
      if (v385)
      {
        v314 = (objc_class *)MEMORY[0x219A1CED4](v311, v298);
      }
      else
      {
        if (v311 >= *(_QWORD *)(v298 + 16))
          goto LABEL_265;
        v314 = v382[v311].isa;
      }
      v298 = (unint64_t)v314;
      v48 = __OFADD__(v311, 1);
      v315 = v311 + 1;
      if (v48)
        break;
      v316 = -[objc_class pendingStatuses](v314, sel_pendingStatuses);
      v317 = sub_218988FA0();

      v392 = v315;
      v391 = v298;
      if (v317 >> 62)
      {
        swift_bridgeObjectRetain();
        v318 = sub_2189891F8();
        swift_bridgeObjectRelease();
        if (!v318)
          goto LABEL_242;
      }
      else
      {
        v318 = *(_QWORD *)((v317 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (!v318)
          goto LABEL_242;
      }
      if (v318 < 1)
        goto LABEL_264;
      v319 = 0;
      v394 = (char *)(v317 & 0xC000000000000001);
      v320 = v317;
      do
      {
        if (v394)
          v321 = (id)MEMORY[0x219A1CED4](v319, v317);
        else
          v321 = *(id *)(v317 + 8 * v319 + 32);
        v322 = v321;
        v323 = objc_msgSend(v321, sel_modificationDate);
        v324 = v387;
        sub_218988BD4();

        sub_218988BA4();
        v325 = *(void (**)(char *, uint64_t))(v388 + 8);
        v325(v324, v313);
        sub_218988BE0();
        v326 = sub_218988BBC();
        v325(v324, v313);
        v327 = ((uint64_t (*)(char *, uint64_t))v325)(v312, v313);
        if ((v326 & 1) != 0)
        {
          MEMORY[0x219A1CCF4](v327);
          if (*(_QWORD *)((v404 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v404 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_218988FC4();
          sub_218988FD0();
          sub_218988FB8();
        }
        else
        {

        }
        ++v319;
        v317 = v320;
      }
      while (v318 != v319);
LABEL_242:

      swift_bridgeObjectRelease();
      v311 = v392;
      v298 = (unint64_t)v384;
      if (v392 == v383)
        goto LABEL_267;
    }
    __break(1u);
LABEL_264:
    __break(1u);
LABEL_265:
    __break(1u);
LABEL_266:
    swift_bridgeObjectRetain();
    v310 = sub_2189891F8();
    swift_release();
  }
  while (v310);
LABEL_267:
  swift_release();
  if (v404 >> 62)
  {
    swift_bridgeObjectRetain();
    v328 = sub_2189891F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v328 = *(_QWORD *)((v404 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v328)
  {
    v329 = v390;
    *(_BYTE *)(v390 + OBJC_IVAR___SKALocalStatusServer_recentPendingStatus) = 0;
    v330 = *(void **)(v329 + OBJC_IVAR___SKALocalStatusServer_browseTask);
    if (v330)
    {
      v331 = v330;
      objc_msgSend(v331, sel_setControlFlags_, 6);
      v332 = sub_218988E14();
      v333 = sub_218989078();
      if (os_log_type_enabled(v332, v333))
      {
        v334 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v334 = 0;
        _os_log_impl(&dword_2188DF000, v332, v333, "Removed bleScreenOff control flag from browseCompanionLink since all pending statuses are at least 3 days old", v334, 2u);
        MEMORY[0x219A1D978](v334, -1, -1);
      }

    }
  }
LABEL_274:
  v335 = v401;
  swift_bridgeObjectRetain();
  v336 = sub_218988E14();
  v337 = sub_218989078();
  if (os_log_type_enabled(v336, v337))
  {
    v338 = swift_slowAlloc();
    *(_DWORD *)v338 = 134218240;
    if (v335 >> 62)
    {
      swift_bridgeObjectRetain();
      v339 = sub_2189891F8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v339 = *(_QWORD *)((v335 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    v404 = v339;
    sub_2189890C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v338 + 12) = 2048;
    swift_beginAccess();
    v398 = *(_QWORD *)(v400 + 16);
    sub_2189890C0();
    _os_log_impl(&dword_2188DF000, v336, v337, "reconcilePendingStatusesOnDevices END {devicesToSave.count: %ld, deviceIDsToRemove.count: %ld}", (uint8_t *)v338, 0x16u);
    MEMORY[0x219A1D978](v338, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

void sub_21895AA8C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  v1 = v0 + OBJC_IVAR___SKALocalStatusServer_browseTask;
  v2 = *(void **)(v0 + OBJC_IVAR___SKALocalStatusServer_browseTask);
  if (v2)
  {
    v3 = qword_253E6EE80;
    v4 = v2;
    swift_bridgeObjectRetain();
    if (v3 != -1)
      swift_once();
    v5 = sub_218988E20();
    __swift_project_value_buffer(v5, (uint64_t)qword_253E6EE68);
    v6 = v4;
    swift_bridgeObjectRetain_n();
    v7 = v6;
    v8 = sub_218988E14();
    v9 = sub_218989078();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v19 = v18;
      *(_DWORD *)v10 = 136315138;
      v11 = objc_msgSend(v7, sel_activeDevices);
      v12 = sub_21897FBC8(0, &qword_255001748);
      v13 = sub_218988FA0();

      v14 = MEMORY[0x219A1CD18](v13, v12);
      v16 = v15;
      swift_bridgeObjectRelease();
      sub_218974338(v14, v16, &v19);
      sub_2189890C0();
      swift_bridgeObjectRelease_n();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2188DF000, v8, v9, "Stopping existing browser task {activeDevices.count: %s}", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v18, -1, -1);
      MEMORY[0x219A1D978](v10, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    objc_msgSend(v7, sel_invalidate);
    swift_bridgeObjectRelease();

    v17 = *(void **)v1;
    *(_QWORD *)v1 = 0;
    *(_QWORD *)(v1 + 8) = 0;
    *(_BYTE *)(v1 + 16) = 0;
    sub_21897E05C(v17);
  }
}

uint64_t sub_21895AD14(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  uint8_t *v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  unint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  unint64_t v43;
  id v44;
  unint64_t v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  char isUniquelyReferenced_nonNull_native;
  id v58;
  id v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t *v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  NSObject *v71;
  os_log_type_t v72;
  _BOOL4 v73;
  uint8_t *v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  id v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  unint64_t v86;
  id v87;
  void *v88;
  id v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v93;
  uint64_t v94;
  unint64_t *v95;
  unint64_t *v96;
  id v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  id v103;
  uint64_t v104;
  NSObject *v105;
  os_log_type_t v106;
  uint8_t *v107;
  void *v108;
  unint64_t v109;
  char *v110;
  uint64_t v111;
  __int128 v112;
  unint64_t *v113;
  uint64_t v114;
  char *v115;
  char *v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  unint64_t v123;
  unint64_t v124;
  uint64_t v125;
  void (*v126)(char *, uint64_t, uint64_t);
  uint64_t v127;
  char *v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t *v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  char *v142;
  uint64_t v143;
  unint64_t v144;
  unint64_t v145;
  uint64_t v146;

  v5 = v4;
  v6 = v3;
  v114 = a2;
  v146 = *MEMORY[0x24BDAC8D0];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E840);
  MEMORY[0x24BDAC7A8](v9);
  v110 = (char *)&v108 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E6F0);
  v118 = *(_QWORD *)(v119 - 8);
  v11 = MEMORY[0x24BDAC7A8](v119);
  v117 = (char *)&v108 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v133 = (uint64_t)&v108 - v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E5A8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v108 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v125 = sub_218988DFC();
  v130 = *(_QWORD *)(v125 - 8);
  v17 = MEMORY[0x24BDAC7A8](v125);
  v129 = (char *)&v108 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v128 = (char *)&v108 - v19;
  v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v132 = *(_QWORD *)(v139 - 8);
  v20 = MEMORY[0x24BDAC7A8](v139);
  v116 = (char *)&v108 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v115 = (char *)&v108 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v142 = (char *)&v108 - v24;
  if (qword_253E6EE80 != -1)
    goto LABEL_53;
  while (1)
  {
    v25 = sub_218988E20();
    v26 = __swift_project_value_buffer(v25, (uint64_t)qword_253E6EE68);
    swift_bridgeObjectRetain_n();
    v120 = v26;
    v27 = sub_218988E14();
    v28 = sub_218989078();
    v29 = os_log_type_enabled(v27, v28);
    v140 = v6;
    v122 = v16;
    if (v29)
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v144 = v31;
      *(_DWORD *)v30 = 136315138;
      swift_bridgeObjectRetain();
      v143 = sub_218974338(v114, a3, (uint64_t *)&v144);
      v6 = v140;
      sub_2189890C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2188DF000, v27, v28, "deliverAllPendingStatuses START {reason: %s}", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v31, -1, -1);
      MEMORY[0x219A1D978](v30, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v32 = sub_21895BC24((_BYTE *)0xD000000000000025, 0x8000000218993080);
    v33 = *(void **)(v6 + 176);
    v144 = 0;
    v34 = objc_msgSend(v33, sel_allPublishedLocalStatusDevicesInDatabaseContext_error_, a1, &v144);
    v35 = (id)v144;
    if (!v34)
    {
      v80 = (id)v144;
      swift_bridgeObjectRelease();
LABEL_42:
      sub_218988B74();

      return swift_willThrow();
    }
    v36 = v34;
    v123 = v32;
    sub_21897FBC8(0, (unint64_t *)&unk_253E6E868);
    v37 = sub_218988FA0();
    v38 = v35;

    swift_retain();
    v39 = sub_21897D874(v37);
    swift_release();
    swift_bridgeObjectRelease();
    v144 = 0;
    v40 = objc_msgSend(v33, sel_allPublishedLocalStatusesInDatabaseContext_error_, a1, &v144);
    v41 = (id)v144;
    if (!v40)
    {
      v80 = (id)v144;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_42;
    }
    v42 = v40;
    v135 = sub_21897FBC8(0, (unint64_t *)&unk_253E6E858);
    v43 = sub_218988FA0();
    v44 = v41;

    v45 = v43;
    if (v43 >> 62)
    {
      swift_bridgeObjectRetain();
      v46 = sub_2189891F8();
    }
    else
    {
      v46 = *(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    v48 = v125;
    v141 = v39;
    v109 = a3;
    v108 = a1;
    v131 = v5;
    if (!v46)
      break;
    v134 = (uint64_t *)(v6 + OBJC_IVAR___SKALocalStatusServer_deliverySubjects);
    v124 = v45 & 0xC000000000000001;
    v113 = &v144;
    v5 = 4;
    *(_QWORD *)&v47 = 136315138;
    v112 = v47;
    v111 = MEMORY[0x24BEE4AD8] + 8;
    v16 = v122;
    v136 = v45;
    v121 = v46;
    while (1)
    {
      v58 = v124 ? (id)MEMORY[0x219A1CED4](v5 - 4, v45) : *(id *)(v45 + 8 * v5);
      a1 = v58;
      a3 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      v59 = objc_msgSend(v58, sel_keyDomain);
      sub_218988F28();

      sub_218988DE4();
      v60 = v130;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v130 + 48))(v16, 1, v48) == 1)
      {
        sub_21897FCD4((uint64_t)v16, &qword_253E6E5A8);
        v94 = sub_218988DD8();
        sub_218974B58(&qword_255001570, (uint64_t (*)(uint64_t))MEMORY[0x24BE60B58], MEMORY[0x24BE60B60]);
        swift_allocError();
        v96 = v95;
        v144 = 0;
        v145 = 0xE000000000000000;
        sub_218989150();
        swift_bridgeObjectRelease();
        v144 = 0xD00000000000001FLL;
        v145 = 0x8000000218992DB0;
        v97 = objc_msgSend(a1, sel_keyDomain);
        sub_218988F28();

        sub_218988F64();
        swift_bridgeObjectRelease();
        v98 = v145;
        *v96 = v144;
        v96[1] = v98;
        (*(void (**)(unint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v94 - 8) + 104))(v96, *MEMORY[0x24BE60B48], v94);
        swift_willThrow();
        swift_bridgeObjectRelease_n();

        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      v137 = v5 - 3;
      v61 = v128;
      (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v128, v16, v48);
      (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v129, v61, v48);
      v138 = a1;
      v62 = v60;
      v63 = objc_msgSend(a1, sel_keyName);
      sub_218988F28();

      sub_2189770C8();
      sub_21897710C();
      sub_218988DB4();
      v64 = (uint64_t)v142;
      (*(void (**)(char *, uint64_t))(v62 + 8))(v61, v48);
      v65 = v134;
      swift_beginAccess();
      if (*(_QWORD *)(*v65 + 16) && (sub_218974A9C(v64), (v66 & 1) != 0))
      {
        swift_endAccess();
        (*(void (**)(uint64_t, uint64_t))(v132 + 8))(v64, v139);

        v6 = v140;
        v45 = v136;
      }
      else
      {
        swift_endAccess();
        v67 = v131;
        sub_21895D4C8(v64, v136, v141, v123, v133);
        v68 = v132;
        if (v67)
        {

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v64, v139);
          return swift_bridgeObjectRelease();
        }
        v131 = 0;
        v69 = v115;
        v70 = v139;
        v126 = *(void (**)(char *, uint64_t, uint64_t))(v132 + 16);
        v126(v115, v64, v139);
        v71 = sub_218988E14();
        v72 = sub_218989078();
        v73 = os_log_type_enabled(v71, v72);
        v127 = v5;
        if (v73)
        {
          v74 = (uint8_t *)swift_slowAlloc();
          v75 = v64;
          v76 = swift_slowAlloc();
          v144 = v76;
          *(_DWORD *)v74 = v112;
          sub_21897FAFC(&qword_253E6E578, &qword_253E6E718, MEMORY[0x24BE60B40]);
          v77 = sub_218989234();
          v143 = sub_218974338(v77, v78, (uint64_t *)&v144);
          v70 = v139;
          sub_2189890C0();
          swift_bridgeObjectRelease();
          v49 = *(void (**)(char *, uint64_t))(v132 + 8);
          v49(v69, v70);
          _os_log_impl(&dword_2188DF000, v71, v72, "Adding new delivery subject {key: %s}", v74, 0xCu);
          swift_arrayDestroy();
          v79 = v76;
          v64 = v75;
          MEMORY[0x219A1D978](v79, -1, -1);
          MEMORY[0x219A1D978](v74, -1, -1);
        }
        else
        {
          v49 = *(void (**)(char *, uint64_t))(v68 + 8);
          v49(v69, v70);
        }

        v50 = (uint64_t)v116;
        v126(v116, v64, v70);
        v51 = v118;
        v52 = v70;
        v53 = v133;
        v54 = v119;
        (*(void (**)(char *, uint64_t, uint64_t))(v118 + 16))(v117, v133, v119);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E7F0);
        swift_allocObject();
        v55 = sub_218988E50();
        v56 = v134;
        swift_beginAccess();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v143 = *v56;
        *v56 = 0x8000000000000000;
        sub_218977150(v55, v50, isUniquelyReferenced_nonNull_native, (uint64_t *)&unk_253E6E888);
        *v56 = v143;
        swift_bridgeObjectRelease();
        v49((char *)v50, v52);
        swift_endAccess();

        (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v53, v54);
        v49(v142, v52);
        v6 = v140;
        v16 = v122;
        v48 = v125;
        v45 = v136;
        v5 = v127;
      }
      ++v5;
      if (v137 == v121)
        goto LABEL_26;
    }
    __break(1u);
LABEL_53:
    swift_once();
  }
LABEL_26:
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  v144 = MEMORY[0x24BEE4AF8];
  v81 = v141;
  v82 = v109;
  if (v141 >> 62)
  {
    swift_bridgeObjectRetain();
    v83 = sub_2189891F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v83 = *(_QWORD *)((v141 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v84 = v108;
  if (v83)
  {
    if (v83 < 1)
      __break(1u);
    v85 = 0;
    v86 = v81 & 0xC000000000000001;
    do
    {
      if (v86)
        v87 = (id)MEMORY[0x219A1CED4](v85, v141);
      else
        v87 = *(id *)(v141 + 8 * v85 + 32);
      v88 = v87;
      v89 = objc_msgSend(v87, sel_pendingStatuses, v108);
      v90 = sub_218988FA0();

      if (v90 >> 62)
      {
        swift_bridgeObjectRetain();
        v91 = sub_2189891F8();
        swift_bridgeObjectRelease();
      }
      else
      {
        v91 = *(_QWORD *)((v90 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v91)
      {
        sub_21898918C();
        sub_2189891A4();
        sub_2189891B0();
        sub_218989198();
      }
      else
      {

      }
      ++v85;
    }
    while (v83 != v85);
    swift_bridgeObjectRelease();
    v93 = v144;
    v6 = v140;
    if ((v144 & 0x8000000000000000) != 0)
    {
LABEL_56:
      swift_retain();
      v104 = sub_2189891F8();
      swift_release();
      if (!v104)
        goto LABEL_57;
LABEL_49:
      v99 = sub_21898900C();
      v100 = (uint64_t)v110;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v99 - 8) + 56))(v110, 1, 1, v99);
      v101 = sub_218974B58(&qword_255001728, type metadata accessor for SKALocalStatusServer, (uint64_t)&protocol conformance descriptor for SKALocalStatusServer);
      v102 = (_QWORD *)swift_allocObject();
      v102[2] = v6;
      v102[3] = v101;
      v102[4] = v93;
      v102[5] = v6;
      v102[6] = v114;
      v102[7] = v82;
      v102[8] = v84;
      swift_retain_n();
      swift_bridgeObjectRetain();
      v103 = v84;
      return sub_21894F800(v100, (uint64_t)&unk_255001730, (uint64_t)v102);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    v93 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_56;
  }
  if ((v93 & 0x4000000000000000) != 0)
    goto LABEL_56;
  if (*(_QWORD *)(v93 + 16))
    goto LABEL_49;
LABEL_57:
  swift_release();
  v105 = sub_218988E14();
  v106 = sub_218989078();
  if (os_log_type_enabled(v105, v106))
  {
    v107 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v107 = 0;
    _os_log_impl(&dword_2188DF000, v105, v106, "deliverAllPendingStatuses SKIP. No devices with pending statuses", v107, 2u);
    MEMORY[0x219A1D978](v107, -1, -1);
  }

  return 0;
}

uint64_t sub_21895BC24(_BYTE *a1, unint64_t a2)
{
  uint64_t v2;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29[9];
  uint64_t v30;

  v5 = objc_msgSend(*(id *)(v2 + 184), sel_idsDevices);
  if (!v5)
  {
    if (qword_253E6EE80 == -1)
      goto LABEL_27;
    goto LABEL_34;
  }
  v6 = v5;
  sub_21897FBC8(0, (unint64_t *)&unk_253E6E878);
  a2 = sub_218988FA0();

  a1 = sub_21895E8FC();
  v30 = MEMORY[0x24BEE4AF8];
  if (!(a2 >> 62))
  {
    v7 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v7)
      goto LABEL_4;
LABEL_31:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v7 = sub_2189891F8();
  swift_bridgeObjectRelease();
  if (!v7)
    goto LABEL_31;
LABEL_4:
  if (v7 < 1)
  {
    __break(1u);
LABEL_34:
    swift_once();
LABEL_27:
    v23 = sub_218988E20();
    __swift_project_value_buffer(v23, (uint64_t)qword_253E6EE68);
    swift_bridgeObjectRetain_n();
    v24 = sub_218988E14();
    v25 = sub_218989060();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      v27 = swift_slowAlloc();
      v29[0] = v27;
      *(_DWORD *)v26 = 136315138;
      swift_bridgeObjectRetain();
      v30 = sub_218974338((uint64_t)a1, a2, v29);
      sub_2189890C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2188DF000, v24, v25, "%s FAILED - idsDeviceProviding.idsDevices is nil", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v27, -1, -1);
      MEMORY[0x219A1D978](v26, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return MEMORY[0x24BEE4AF8];
  }
  v8 = 0;
  v9 = a2 & 0xC000000000000001;
  v10 = a2 + 32;
  v11 = a1 + 56;
  v28 = a2;
  do
  {
    if (v9)
      v13 = (id)MEMORY[0x219A1CED4](v8, a2);
    else
      v13 = *(id *)(v10 + 8 * v8);
    v14 = v13;
    v15 = objc_msgSend(v13, sel_deviceType);
    if (*((_QWORD *)a1 + 2))
    {
      v16 = v15;
      sub_2189892C4();
      sub_2189892D0();
      v17 = sub_2189892E8();
      v18 = -1 << a1[32];
      v19 = v17 & ~v18;
      if (((*(_QWORD *)&v11[(v19 >> 3) & 0xFFFFFFFFFFFFF8] >> v19) & 1) != 0)
      {
        v20 = *((_QWORD *)a1 + 6);
        if (*(id *)(v20 + 8 * v19) == v16)
        {
LABEL_20:
          switch((unint64_t)objc_msgSend(v14, sel_deviceType))
          {
            case 1uLL:
              objc_msgSend(v14, sel_operatingSystemVersion);
              if (v29[0] >= 14)
                goto LABEL_7;
              break;
            case 2uLL:
            case 3uLL:
            case 4uLL:
              objc_msgSend(v14, sel_operatingSystemVersion);
              if (v29[0] > 16)
                goto LABEL_7;
              break;
            case 9uLL:
              objc_msgSend(v14, sel_operatingSystemVersion);
              if (v29[0] > 0)
              {
LABEL_7:
                v12 = v14;
                MEMORY[0x219A1CCF4]();
                if (*(_QWORD *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                  sub_218988FC4();
                sub_218988FD0();
                sub_218988FB8();
                a2 = v28;
              }
              break;
            default:
              break;
          }
        }
        else
        {
          v21 = ~v18;
          while (1)
          {
            v19 = (v19 + 1) & v21;
            if (((*(_QWORD *)&v11[(v19 >> 3) & 0xFFFFFFFFFFFFF8] >> v19) & 1) == 0)
              break;
            if (*(id *)(v20 + 8 * v19) == v16)
              goto LABEL_20;
          }
        }
      }
    }
    ++v8;

  }
  while (v8 != v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v30;
}

uint64_t sub_21895C0AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  unint64_t v19;
  id v20;
  uint64_t v22;
  _QWORD *v23;
  id v24;
  id v25[2];

  v25[1] = *(id *)MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend(*(id *)(v3 + 184), sel_idsDevices);
  if (v7)
  {
    v8 = v7;
    sub_21897FBC8(0, (unint64_t *)&unk_253E6E878);
    v9 = sub_218988FA0();

    v10 = *(void **)(v3 + 176);
    v25[0] = 0;
    v11 = objc_msgSend(v10, sel_allPublishedLocalStatusesInDatabaseContext_error_, a2, v25);
    v12 = v25[0];
    if (v11)
    {
      v13 = v11;
      sub_21897FBC8(0, (unint64_t *)&unk_253E6E858);
      v14 = sub_218988FA0();
      v15 = v12;

      v25[0] = 0;
      v16 = objc_msgSend(v10, sel_allPublishedLocalStatusDevicesInDatabaseContext_error_, a2, v25);
      v17 = v25[0];
      if (v16)
      {
        v18 = v16;
        sub_21897FBC8(0, (unint64_t *)&unk_253E6E868);
        v19 = sub_218988FA0();
        v20 = v17;

        sub_21895D4C8(a1, v14, v19, v9, a3);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      v24 = v25[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v24 = v25[0];
      swift_bridgeObjectRelease();
    }
    sub_218988B74();

  }
  else
  {
    v22 = sub_218988DD8();
    sub_218974B58(&qword_255001570, (uint64_t (*)(uint64_t))MEMORY[0x24BE60B58], MEMORY[0x24BE60B60]);
    swift_allocError();
    *v23 = 0xD00000000000001DLL;
    v23[1] = 0x80000002189932D0;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v23, *MEMORY[0x24BE60B50], v22);
  }
  return swift_willThrow();
}

void sub_21895C340(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v5 = v3;
  v29 = a2;
  v27 = a1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E6F0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E7E0);
  v26 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (uint64_t *)(v3 + OBJC_IVAR___SKALocalStatusServer_deliverySubjects);
  swift_beginAccess();
  v15 = *v14;
  if (*(_QWORD *)(v15 + 16) && (v16 = sub_218974A9C(a3), (v17 & 1) != 0))
  {
    v18 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v16);
    swift_endAccess();
    swift_retain();
    sub_218988E44();
    v28 = v18;
    v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E7F0);
    v20 = sub_21897FAFC(&qword_253E6E7E8, (uint64_t *)&unk_253E6E7F0, MEMORY[0x24BDB9D10]);
    MEMORY[0x219A1CBC8](v19, v20);
    sub_21897FAFC((unint64_t *)&unk_253E6E7D0, &qword_253E6E7E0, MEMORY[0x24BDB9BE0]);
    sub_21897FAFC(&qword_253E6E6E8, &qword_253E6E6F0, MEMORY[0x24BE608D8]);
    sub_21897FAFC(&qword_253E6E6E0, &qword_253E6E6F0, MEMORY[0x24BE608D0]);
    v21 = v29;
    sub_218989030();
    swift_release();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v11);
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E810);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 0, 1, v22);
  }
  else
  {
    swift_endAccess();
    v23 = objc_msgSend(*(id *)(v5 + 168), sel_newBackgroundContext);
    sub_21895C0AC(a3, (uint64_t)v23, (uint64_t)v10);

    if (!v4)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v27, v10, v7);
      v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E810);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v29, 1, 1, v24);
    }
  }
}

uint64_t sub_21895C5EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void (*v44)(char *, uint64_t);
  uint8_t *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v54[2];
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, uint64_t, uint64_t);
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65[3];
  uint64_t v66;

  v64 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E5B8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v63 = (char *)v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v60 = (char *)v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v54 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v54 - v14;
  v16 = (uint64_t *)(v2 + OBJC_IVAR___SKALocalStatusServer_subscriptionSubjects);
  swift_beginAccess();
  v17 = *v16;
  if (*(_QWORD *)(*v16 + 16) && (v18 = sub_218974A9C(a1), (v19 & 1) != 0))
  {
    v20 = a1;
    v21 = v8;
    v22 = *(_QWORD *)(*(_QWORD *)(v17 + 56) + 8 * v18);
    swift_endAccess();
    v23 = qword_253E6EE80;
    swift_retain();
    if (v23 != -1)
      swift_once();
    v24 = sub_218988E20();
    __swift_project_value_buffer(v24, (uint64_t)qword_253E6EE68);
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v15, v20, v7);
    swift_retain_n();
    v25 = sub_218988E14();
    v26 = sub_218989078();
    v27 = v26;
    if (os_log_type_enabled(v25, v26))
    {
      v28 = swift_slowAlloc();
      v29 = swift_slowAlloc();
      v61 = v5;
      v30 = v29;
      v65[0] = v29;
      *(_DWORD *)v28 = 136315394;
      v62 = v4;
      sub_21897FAFC(&qword_253E6E578, &qword_253E6E718, MEMORY[0x24BE60B40]);
      LODWORD(v60) = v27;
      v31 = sub_218989234();
      v66 = sub_218974338(v31, v32, v65);
      sub_2189890C0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v15, v7);
      *(_WORD *)(v28 + 12) = 2048;
      sub_218988E44();
      v33 = *(_QWORD *)(v66 + 16);
      swift_release();
      swift_bridgeObjectRelease();
      v66 = v33;
      v4 = v62;
      sub_2189890C0();
      swift_release();
      _os_log_impl(&dword_2188DF000, v25, (os_log_type_t)v60, "Subribing to existing subject {key: %s, observations.count: %ld}", (uint8_t *)v28, 0x16u);
      swift_arrayDestroy();
      v34 = v30;
      v5 = v61;
      MEMORY[0x219A1D978](v34, -1, -1);
      MEMORY[0x219A1D978](v28, -1, -1);

    }
    else
    {
      swift_release();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v15, v7);

      swift_release();
    }
    v65[0] = v22;
    v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E5D0);
    v52 = sub_21897FAFC(&qword_253E6E5C8, &qword_253E6E5D0, MEMORY[0x24BDB9D10]);
    v46 = v63;
    MEMORY[0x219A1CBC8](v51, v52);
  }
  else
  {
    v62 = v4;
    swift_endAccess();
    v65[0] = MEMORY[0x24BEE4AF8];
    v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E5D0);
    swift_allocObject();
    v59 = sub_218988E50();
    if (qword_253E6EE80 != -1)
      swift_once();
    v61 = v5;
    v35 = sub_218988E20();
    __swift_project_value_buffer(v35, (uint64_t)qword_253E6EE68);
    v57 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    v57(v13, a1, v7);
    v36 = v8;
    v37 = sub_218988E14();
    v38 = sub_218989078();
    if (os_log_type_enabled(v37, v38))
    {
      v55 = v36;
      v39 = swift_slowAlloc();
      v56 = a1;
      v40 = (uint8_t *)v39;
      v41 = swift_slowAlloc();
      v65[0] = v41;
      *(_DWORD *)v40 = 136315138;
      v54[1] = v40 + 4;
      sub_21897FAFC(&qword_253E6E578, &qword_253E6E718, MEMORY[0x24BE60B40]);
      v42 = sub_218989234();
      v66 = sub_218974338(v42, v43, v65);
      sub_2189890C0();
      swift_bridgeObjectRelease();
      v44 = *(void (**)(char *, uint64_t))(v55 + 8);
      v44(v13, v7);
      _os_log_impl(&dword_2188DF000, v37, v38, "Subscribing to new subject {key: %s}", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v41, -1, -1);
      v45 = v40;
      a1 = v56;
      MEMORY[0x219A1D978](v45, -1, -1);
    }
    else
    {
      v44 = *(void (**)(char *, uint64_t))(v36 + 8);
      v44(v13, v7);
    }

    v46 = v63;
    v47 = (uint64_t)v60;
    v57(v60, a1, v7);
    swift_beginAccess();
    v48 = v59;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v66 = *v16;
    *v16 = 0x8000000000000000;
    sub_218977150(v48, v47, isUniquelyReferenced_nonNull_native, (uint64_t *)&unk_253E6E610);
    *v16 = v66;
    swift_bridgeObjectRelease();
    v44((char *)v47, v7);
    swift_endAccess();
    v65[0] = v48;
    v50 = sub_21897FAFC(&qword_253E6E5C8, &qword_253E6E5D0, MEMORY[0x24BDB9D10]);
    MEMORY[0x219A1CBC8](v58, v50);
    v5 = v61;
    v4 = v62;
  }
  sub_21897FAFC(&qword_253E6E5B0, (uint64_t *)&unk_253E6E5B8, MEMORY[0x24BDB9BE0]);
  sub_218977044(&qword_253E6E608, &qword_253E6E538, MEMORY[0x24BE60948], MEMORY[0x24BEE12D0]);
  sub_218977044((unint64_t *)&unk_253E6E5F8, &qword_253E6E530, MEMORY[0x24BE60938], MEMORY[0x24BEE12A0]);
  sub_218989030();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v46, v4);
}

uint64_t sub_21895CD08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255001550);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_218988BF8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) == 1)
  {
    sub_21897FCD4(a1, &qword_255001550);
    sub_218975028(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_21897FCD4((uint64_t)v10, &qword_255001550);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v4;
    *v4 = 0x8000000000000000;
    sub_218976F08((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    *v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_21895CE7C(unint64_t a1, uint64_t a2, SEL *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v20;

  v4 = v3;
  if (a1 >> 62)
    goto LABEL_15;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v7 = MEMORY[0x24BEE4AF8];
    if (!v6)
      return v7;
    v20 = MEMORY[0x24BEE4AF8];
    result = sub_218979008(0, v6 & ~(v6 >> 63), 0);
    if (v6 < 0)
      break;
    v18 = v4;
    v9 = 0;
    v7 = v20;
    while (v6 != v9)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v10 = (id)MEMORY[0x219A1CED4](v9, a1);
      else
        v10 = *(id *)(a1 + 8 * v9 + 32);
      v11 = v10;
      v12 = objc_msgSend(v10, *a3, v18);
      v13 = sub_218988F28();
      v15 = v14;

      v4 = *(_QWORD *)(v20 + 16);
      v16 = *(_QWORD *)(v20 + 24);
      if (v4 >= v16 >> 1)
        sub_218979008(v16 > 1, v4 + 1, 1);
      ++v9;
      *(_QWORD *)(v20 + 16) = v4 + 1;
      v17 = v20 + 16 * v4;
      *(_QWORD *)(v17 + 32) = v13;
      *(_QWORD *)(v17 + 40) = v15;
      if (v6 == v9)
        return v7;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    v6 = sub_2189891F8();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_21895CFF4(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v13 = MEMORY[0x24BEE4AF8];
    sub_218979008(0, v1, 0);
    v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718) - 8);
    v5 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v6 = *(_QWORD *)(v4 + 72);
    do
    {
      swift_getKeyPath();
      swift_getAtKeyPath();
      swift_release();
      v2 = v13;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_218979008(0, *(_QWORD *)(v13 + 16) + 1, 1);
        v2 = v13;
      }
      v8 = *(_QWORD *)(v2 + 16);
      v7 = *(_QWORD *)(v2 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_218979008(v7 > 1, v8 + 1, 1);
        v2 = v13;
      }
      *(_QWORD *)(v2 + 16) = v8 + 1;
      v9 = v2 + 16 * v8;
      *(_QWORD *)(v9 + 32) = v11;
      *(_QWORD *)(v9 + 40) = v12;
      v5 += v6;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_21895D138(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  _QWORD v32[2];
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v3 = type metadata accessor for SKALocalStatusServer.FailedDelivery(0);
  v41 = *(_QWORD *)(v3 - 8);
  v42 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v37 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v40 = (uint64_t)v32 - v6;
  v7 = sub_218988BF8();
  v38 = *(_QWORD *)(v7 - 8);
  v39 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = MEMORY[0x24BEE4AF8];
  if (!v11)
    return v12;
  v32[1] = v1;
  v43 = v8;
  v44 = MEMORY[0x24BEE4AF8];
  sub_218979024(0, v11, 0);
  result = sub_21897B8B8(v43);
  v15 = result;
  v16 = v43;
  v17 = 0;
  v18 = v43 + 64;
  v19 = *(_BYTE *)(v43 + 32);
  v32[0] = v43 + 88;
  v35 = v43 + 64;
  v36 = v10;
  v33 = v11;
  v34 = v14;
  v20 = (uint64_t)v37;
  while ((v15 & 0x8000000000000000) == 0 && v15 < 1 << v19)
  {
    v23 = (unint64_t)v15 >> 6;
    if ((*(_QWORD *)(v18 + 8 * ((unint64_t)v15 >> 6)) & (1 << v15)) == 0)
      goto LABEL_27;
    if (*(_DWORD *)(v16 + 36) != (_DWORD)v14)
      goto LABEL_28;
    v24 = v40;
    sub_21897F33C(*(_QWORD *)(v16 + 56) + *(_QWORD *)(v41 + 72) * v15, v40, type metadata accessor for SKALocalStatusServer.FailedDelivery);
    sub_21897F960(v24, v20, type metadata accessor for SKALocalStatusServer.FailedDelivery);
    sub_218988B98();
    sub_218988BA4();
    sub_21897F380(v20, type metadata accessor for SKALocalStatusServer.FailedDelivery);
    v12 = v44;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_218979024(0, *(_QWORD *)(v12 + 16) + 1, 1);
      v12 = v44;
    }
    v26 = *(_QWORD *)(v12 + 16);
    v25 = *(_QWORD *)(v12 + 24);
    if (v26 >= v25 >> 1)
    {
      sub_218979024(v25 > 1, v26 + 1, 1);
      v12 = v44;
    }
    *(_QWORD *)(v12 + 16) = v26 + 1;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v38 + 32))(v12+ ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80))+ *(_QWORD *)(v38 + 72) * v26, v36, v39);
    v44 = v12;
    v16 = v43;
    v19 = *(_BYTE *)(v43 + 32);
    v21 = 1 << v19;
    if (v15 >= 1 << v19)
      goto LABEL_29;
    v18 = v35;
    v27 = *(_QWORD *)(v35 + 8 * v23);
    if ((v27 & (1 << v15)) == 0)
      goto LABEL_30;
    LODWORD(v14) = v34;
    if (*(_DWORD *)(v43 + 36) != (_DWORD)v34)
      goto LABEL_31;
    v28 = v27 & (-2 << (v15 & 0x3F));
    if (v28)
    {
      v21 = __clz(__rbit64(v28)) | v15 & 0xFFFFFFFFFFFFFFC0;
      v22 = v33;
    }
    else
    {
      v29 = v23 + 1;
      v30 = (v21 + 63) >> 6;
      v22 = v33;
      if (v23 + 1 < v30)
      {
        v31 = *(_QWORD *)(v35 + 8 * v29);
        if (!v31)
        {
          v29 = v23 + 2;
          if (v23 + 2 >= v30)
            goto LABEL_4;
          v31 = *(_QWORD *)(v35 + 8 * v29);
          if (!v31)
          {
            while (v30 - 3 != v23)
            {
              v31 = *(_QWORD *)(v32[0] + 8 * v23++);
              if (v31)
              {
                v29 = v23 + 2;
                goto LABEL_19;
              }
            }
            goto LABEL_4;
          }
        }
LABEL_19:
        v21 = __clz(__rbit64(v31)) + (v29 << 6);
      }
    }
LABEL_4:
    ++v17;
    v15 = v21;
    if (v17 == v22)
      return v12;
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_21895D4C8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v5;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  char isUniquelyReferenced_nonNull_native;
  char v42;
  uint64_t v43;
  _BOOL8 v44;
  uint64_t v45;
  char v46;
  _QWORD *v47;
  unint64_t v48;
  char v49;
  uint64_t *v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  id v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v77;
  id v78;
  unint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t *v86;
  uint64_t v87;
  unint64_t v88;
  char v89;
  _BYTE *v90;
  id v91;
  id v92;
  id v93;
  void *v94;
  id v95;
  void *v96;
  uint64_t v97;
  _BYTE *v98;
  _QWORD *v99;
  _QWORD *v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  id v105;
  id v106;
  id v107;
  void *v108;
  id v109;
  void *v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char v123;
  id v124;
  id v125;
  id v126;
  void *v127;
  id v128;
  void *v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t *v133;
  unint64_t v134;
  uint64_t result;
  id v136;
  void *v137;
  uint64_t v138;
  unint64_t v139;
  unint64_t v140;
  _BYTE v141[4];
  unsigned int v142;
  uint64_t v143;
  unint64_t v144;
  unsigned int v145;
  _BYTE *v146;
  uint64_t v147;
  _BYTE *v148;
  uint64_t v149;
  unsigned int v150;
  uint64_t *v151;
  uint64_t v152;
  uint64_t v153;
  _BYTE *v154;
  uint64_t v155;
  id v156;
  _BYTE *v157;
  _BYTE *v158;
  _BYTE *v159;
  uint64_t v160;
  _BYTE *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  unint64_t v165;
  uint64_t v166;
  _BYTE *v167;
  uint64_t v168;
  unint64_t v169;
  uint64_t v170;
  unint64_t v171;
  uint64_t v172;
  unint64_t v173;
  uint64_t v174;
  uint64_t v175;
  _BYTE *v176;
  uint64_t v177;
  uint64_t v178;
  id v179;
  unint64_t v180;
  _BYTE *v181;
  id v182;
  unint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  unint64_t v187;

  v173 = a3;
  v149 = a5;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v162 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v148 = &v141[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = sub_218988D18();
  v177 = *(_QWORD *)(v11 - 8);
  v178 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v176 = &v141[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = sub_218988D24();
  v174 = *(_QWORD *)(v13 - 8);
  v175 = v13;
  v14 = MEMORY[0x24BDAC7A8](v13);
  v181 = &v141[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = MEMORY[0x24BDAC7A8](v14);
  v167 = &v141[-v17];
  v18 = MEMORY[0x24BDAC7A8](v16);
  v161 = &v141[-v19];
  MEMORY[0x24BDAC7A8](v18);
  v154 = &v141[-v20];
  v153 = sub_218988BF8();
  v152 = *(_QWORD *)(v153 - 8);
  MEMORY[0x24BDAC7A8](v153);
  v158 = &v141[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v155 = type metadata accessor for SKALocalStatusServer.FailedDelivery(0);
  v147 = *(_QWORD *)(v155 - 8);
  v22 = MEMORY[0x24BDAC7A8](v155);
  v146 = &v141[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v22);
  v157 = &v141[-v24];
  v160 = type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(0);
  MEMORY[0x24BDAC7A8](v160);
  v159 = &v141[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v163 = v9;
  v164 = a1;
  v26 = sub_218988D9C();
  v28 = v27;
  swift_bridgeObjectRetain();
  v29 = sub_21897D6D0(a2, v26, v28);
  v30 = v5;
  swift_bridgeObjectRelease();
  v156 = v29;
  if (!v29)
  {
    v131 = sub_218988DD8();
    sub_218974B58(&qword_255001570, (uint64_t (*)(uint64_t))MEMORY[0x24BE60B58], MEMORY[0x24BE60B60]);
    swift_allocError();
    v133 = v132;
    v186 = 0x6620737574617473;
    v187 = 0xEB0000000020726FLL;
    sub_218988F64();
    swift_bridgeObjectRelease();
    v134 = v187;
    *v133 = v186;
    v133[1] = v134;
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v131 - 8) + 104))(v133, *MEMORY[0x24BE60B50], v131);
    return swift_willThrow();
  }
  v184 = v26;
  v185 = v28;
  v183 = sub_2189511E0(MEMORY[0x24BEE4AF8], &qword_255001858);
  if (a4 >> 62)
    goto LABEL_108;
  v31 = *(id *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    v144 = v30;
    if (v31)
      break;
LABEL_24:
    swift_bridgeObjectRelease();
    if (v173 >> 62)
    {
      swift_bridgeObjectRetain();
      v54 = sub_2189891F8();
      if (!v54)
      {
LABEL_110:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v136 = objc_msgSend(v156, sel_payload);
        if (v136)
        {
          v137 = v136;
          v138 = sub_218988B8C();
          v140 = v139;

        }
        else
        {
          v138 = 0;
          v140 = 0xF000000000000000;
        }
        (*(void (**)(_BYTE *, uint64_t, uint64_t))(v162 + 16))(v148, v164, v163);
        v186 = v138;
        v187 = v140;
        sub_2189770C8();
        sub_21897710C();
        sub_21897FAB0();
        sub_218988C34();

        return swift_bridgeObjectRelease();
      }
    }
    else
    {
      v54 = *(_QWORD *)((v173 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v54)
        goto LABEL_110;
    }
    v55 = 0;
    v151 = (uint64_t *)(v172 + OBJC_IVAR___SKALocalStatusServer_failedDeliveries);
    v56 = v173 & 0xC000000000000001;
    v169 = v173 + 32;
    v170 = v173 & 0xFFFFFFFFFFFFFF8;
    v57 = MEMORY[0x24BEE4AF8];
    v142 = *MEMORY[0x24BE60A50];
    v145 = *MEMORY[0x24BE60A58];
    v150 = *MEMORY[0x24BE60A60];
    LODWORD(v172) = *MEMORY[0x24BE60A48];
    v166 = v54;
    v165 = v173 & 0xC000000000000001;
    while (1)
    {
      if (v56)
      {
        v59 = (id)MEMORY[0x219A1CED4](v55, v173);
      }
      else
      {
        if (v55 >= *(_QWORD *)(v170 + 16))
          goto LABEL_107;
        v59 = *(id *)(v169 + 8 * v55);
      }
      v60 = v59;
      v52 = __OFADD__(v55++, 1);
      if (v52)
        break;
      v61 = objc_msgSend(v59, sel_idsIdentifier);
      v30 = sub_218988F28();
      v63 = v62;

      if (*(_QWORD *)(v183 + 16) && (v64 = sub_218974A38(v30, v63), (v65 & 1) != 0))
      {
        v171 = v55;
        v180 = v57;
        v179 = *(id *)(*(_QWORD *)(v183 + 56) + 8 * v64);
        swift_bridgeObjectRelease();
        v66 = objc_msgSend(v60, sel_pendingStatuses);
        v67 = sub_21897FBC8(0, (unint64_t *)&unk_253E6E858);
        v68 = sub_218988FA0();

        if (v68 >> 62)
        {
          swift_bridgeObjectRetain();
          v69 = sub_2189891F8();
          v182 = v60;
          if (v69)
          {
LABEL_38:
            v168 = v67;
            v70 = 4;
            while (1)
            {
              if ((v68 & 0xC000000000000001) != 0)
                v71 = (id)MEMORY[0x219A1CED4](v70 - 4, v68);
              else
                v71 = *(id *)(v68 + 8 * v70);
              a4 = (unint64_t)v71;
              v30 = v70 - 3;
              if (__OFADD__(v70 - 4, 1))
              {
                __break(1u);
                goto LABEL_102;
              }
              v72 = objc_msgSend(v71, sel_identifier);
              v73 = sub_218988F28();
              v75 = v74;

              if (v73 == v184 && v75 == v185)
                break;
              v77 = sub_218989240();
              swift_bridgeObjectRelease();

              if ((v77 & 1) != 0)
                goto LABEL_56;
              ++v70;
              if (v30 == v69)
              {
                swift_bridgeObjectRelease_n();
                v60 = v182;
                goto LABEL_75;
              }
            }

            swift_bridgeObjectRelease();
LABEL_56:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v80 = (uint64_t)v159;
            (*(void (**)(_BYTE *, uint64_t, uint64_t))(v162 + 16))(v159, v164, v163);
            v81 = objc_msgSend(v182, sel_idsIdentifier);
            v82 = sub_218988F28();
            v84 = v83;

            v85 = (uint64_t *)(v80 + *(int *)(v160 + 20));
            *v85 = v82;
            v85[1] = v84;
            v86 = v151;
            swift_beginAccess();
            v87 = *v86;
            if (*(_QWORD *)(*v86 + 16))
            {
              v88 = sub_218974978(v80);
              if ((v89 & 1) != 0)
              {
                v90 = v146;
                sub_21897F33C(*(_QWORD *)(v87 + 56) + *(_QWORD *)(v147 + 72) * v88, (uint64_t)v146, type metadata accessor for SKALocalStatusServer.FailedDelivery);
                sub_21897F960((uint64_t)v90, (uint64_t)v157, type metadata accessor for SKALocalStatusServer.FailedDelivery);
                swift_endAccess();
                sub_218988B98();
                sub_218988BA4();
                v91 = objc_msgSend(v182, sel_idsIdentifier);
                sub_218988F28();

                v92 = v179;
                v93 = objc_msgSend(v179, sel_name);
                if (!v93)
                  goto LABEL_119;
                v94 = v93;
                sub_218988F28();

                v95 = objc_msgSend(v92, sel_modelIdentifier);
                if (v95)
                {
                  v96 = v95;
                  v143 = sub_218988F28();

                  v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_255001850);
                  v98 = v176;
                  v99 = &v176[*(int *)(v97 + 48)];
                  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v152 + 16))(v176, v158, v153);
                  v100 = &v157[*(int *)(v155 + 24)];
                  v101 = v100[1];
                  *v99 = *v100;
                  v99[1] = v101;
                  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v177 + 104))(v98, v142, v178);
                  swift_bridgeObjectRetain();
                  sub_218988D0C();
                  v102 = v180;
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                    v102 = sub_21897400C(0, *(_QWORD *)(v102 + 16) + 1, 1, v102);
                  v30 = *(_QWORD *)(v102 + 16);
                  v103 = *(_QWORD *)(v102 + 24);
                  if (v30 >= v103 >> 1)
                    v102 = sub_21897400C(v103 > 1, v30 + 1, 1, v102);
                  *(_QWORD *)(v102 + 16) = v30 + 1;
                  v104 = (*(unsigned __int8 *)(v174 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v174 + 80);
                  v180 = v102;
                  (*(void (**)(unint64_t, _BYTE *, uint64_t))(v174 + 32))(v102 + v104 + *(_QWORD *)(v174 + 72) * v30, v154, v175);
                  (*(void (**)(_BYTE *, uint64_t))(v152 + 8))(v158, v153);
                  sub_21897F380((uint64_t)v157, type metadata accessor for SKALocalStatusServer.FailedDelivery);
LABEL_72:
                  sub_21897F380(v80, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
                  v60 = v182;
                  goto LABEL_75;
                }
                goto LABEL_120;
              }
            }
            swift_endAccess();
            v105 = objc_msgSend(v182, sel_idsIdentifier);
            sub_218988F28();

            v106 = v179;
            v107 = objc_msgSend(v179, sel_name);
            if (!v107)
              goto LABEL_117;
            v108 = v107;
            sub_218988F28();

            v109 = objc_msgSend(v106, sel_modelIdentifier);
            if (v109)
            {
              v110 = v109;
              sub_218988F28();

              (*(void (**)(_BYTE *, _QWORD, uint64_t))(v177 + 104))(v176, v145, v178);
              sub_218988D0C();
              v111 = v180;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v111 = sub_21897400C(0, *(_QWORD *)(v111 + 16) + 1, 1, v111);
              v30 = *(_QWORD *)(v111 + 16);
              v112 = *(_QWORD *)(v111 + 24);
              if (v30 >= v112 >> 1)
                v111 = sub_21897400C(v112 > 1, v30 + 1, 1, v111);
              *(_QWORD *)(v111 + 16) = v30 + 1;
              v113 = (*(unsigned __int8 *)(v174 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v174 + 80);
              v180 = v111;
              (*(void (**)(unint64_t, _BYTE *, uint64_t))(v174 + 32))(v111 + v113 + *(_QWORD *)(v174 + 72) * v30, v161, v175);
              goto LABEL_72;
            }
            goto LABEL_118;
          }
        }
        else
        {
          v69 = *(_QWORD *)((v68 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          v182 = v60;
          if (v69)
            goto LABEL_38;
        }
        swift_bridgeObjectRelease_n();
LABEL_75:
        a4 = (unint64_t)objc_msgSend(v60, sel_deliveredStatuses);
        v114 = sub_218988FA0();

        if (v114 >> 62)
        {
          swift_bridgeObjectRetain();
          v115 = sub_2189891F8();
          if (v115)
          {
LABEL_77:
            v116 = 4;
            while (1)
            {
              v117 = (v114 & 0xC000000000000001) != 0
                   ? (id)MEMORY[0x219A1CED4](v116 - 4, v114)
                   : *(id *)(v114 + 8 * v116);
              a4 = (unint64_t)v117;
              v30 = v116 - 3;
              if (__OFADD__(v116 - 4, 1))
                break;
              v118 = objc_msgSend(v117, sel_identifier);
              v119 = sub_218988F28();
              v121 = v120;

              if (v119 == v184 && v121 == v185)
              {

                swift_bridgeObjectRelease();
LABEL_90:
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v124 = objc_msgSend(v182, sel_idsIdentifier);
                sub_218988F28();

                v125 = v179;
                v126 = objc_msgSend(v179, sel_name);
                if (!v126)
                  goto LABEL_115;
                v127 = v126;
                sub_218988F28();

                v128 = objc_msgSend(v125, sel_modelIdentifier);
                if (v128)
                {
                  v129 = v128;
                  sub_218988F28();

                  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v177 + 104))(v176, v150, v178);
                  sub_218988D0C();
                  v57 = v180;
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                    v57 = sub_21897400C(0, *(_QWORD *)(v57 + 16) + 1, 1, v57);
                  v54 = v166;
                  v55 = v171;
                  v56 = v165;
                  v30 = *(_QWORD *)(v57 + 16);
                  v130 = *(_QWORD *)(v57 + 24);
                  a4 = (unint64_t)v182;
                  v58 = v179;
                  if (v30 >= v130 >> 1)
                    v57 = sub_21897400C(v130 > 1, v30 + 1, 1, v57);
                  *(_QWORD *)(v57 + 16) = v30 + 1;
                  (*(void (**)(unint64_t, _BYTE *, uint64_t))(v174 + 32))(v57+ ((*(unsigned __int8 *)(v174 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v174 + 80))+ *(_QWORD *)(v174 + 72) * v30, v167, v175);

                  goto LABEL_28;
                }
                goto LABEL_116;
              }
              v123 = sub_218989240();
              swift_bridgeObjectRelease();

              if ((v123 & 1) != 0)
                goto LABEL_90;
              ++v116;
              if (v30 == v115)
                goto LABEL_27;
            }
LABEL_102:
            __break(1u);
            goto LABEL_103;
          }
        }
        else
        {
          v115 = *(_QWORD *)((v114 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v115)
            goto LABEL_77;
        }
LABEL_27:

        swift_bridgeObjectRelease_n();
        v58 = v179;
        v57 = v180;
        v54 = v166;
        v55 = v171;
        v56 = v165;
      }
      else
      {
        swift_bridgeObjectRelease();
        v58 = v60;
        v78 = objc_msgSend(v60, sel_idsIdentifier);
        a4 = sub_218988F28();

        (*(void (**)(_BYTE *, _QWORD, uint64_t))(v177 + 104))(v176, v172, v178);
        sub_218988D0C();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v57 = sub_21897400C(0, *(_QWORD *)(v57 + 16) + 1, 1, v57);
        v30 = *(_QWORD *)(v57 + 16);
        v79 = *(_QWORD *)(v57 + 24);
        if (v30 >= v79 >> 1)
          v57 = sub_21897400C(v79 > 1, v30 + 1, 1, v57);
        *(_QWORD *)(v57 + 16) = v30 + 1;
        (*(void (**)(unint64_t, _BYTE *, uint64_t))(v174 + 32))(v57+ ((*(unsigned __int8 *)(v174 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v174 + 80))+ *(_QWORD *)(v174 + 72) * v30, v181, v175);
      }
LABEL_28:

      if (v55 == v54)
        goto LABEL_110;
    }
LABEL_105:
    __break(1u);
LABEL_106:
    __break(1u);
LABEL_107:
    __break(1u);
LABEL_108:
    swift_bridgeObjectRetain();
    v31 = (id)sub_2189891F8();
  }
  v179 = (id)a4;
  v180 = a4 & 0xC000000000000001;
  v32 = 4;
  while (1)
  {
    if (v180)
      v34 = (id)MEMORY[0x219A1CED4](v32 - 4, a4);
    else
      v34 = *(id *)(a4 + 8 * v32);
    v30 = (unint64_t)v34;
    if (__OFADD__(v32 - 4, 1))
    {
LABEL_103:
      __break(1u);
LABEL_104:
      __break(1u);
      goto LABEL_105;
    }
    v182 = (id)(v32 - 3);
    v35 = objc_msgSend(v34, sel_uniqueID);
    if (!v35)
      break;
    v36 = v35;
    v37 = sub_218988F28();
    v39 = v38;

    a4 = (unint64_t)(id)v30;
    v40 = (_QWORD *)v183;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v186 = (uint64_t)v40;
    v30 = sub_218974A38(v37, v39);
    v43 = v40[2];
    v44 = (v42 & 1) == 0;
    v45 = v43 + v44;
    if (__OFADD__(v43, v44))
      goto LABEL_104;
    v46 = v42;
    if (v40[3] >= v45)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v183 = (unint64_t)v40;
        if ((v42 & 1) != 0)
          goto LABEL_6;
      }
      else
      {
        sub_218977A1C(&qword_255001858);
        v40 = (_QWORD *)v186;
        v183 = v186;
        if ((v46 & 1) != 0)
          goto LABEL_6;
      }
    }
    else
    {
      sub_2189755A4(v45, isUniquelyReferenced_nonNull_native, &qword_255001858);
      v47 = (_QWORD *)v186;
      v48 = sub_218974A38(v37, v39);
      if ((v46 & 1) != (v49 & 1))
        goto LABEL_121;
      v30 = v48;
      v40 = v47;
      v183 = (unint64_t)v47;
      if ((v46 & 1) != 0)
      {
LABEL_6:
        v33 = v40[7];
        v30 *= 8;

        *(_QWORD *)(v33 + v30) = a4;
        goto LABEL_7;
      }
    }
    v40[(v30 >> 6) + 8] |= 1 << v30;
    v50 = (uint64_t *)(v40[6] + 16 * v30);
    *v50 = v37;
    v50[1] = v39;
    *(_QWORD *)(v40[7] + 8 * v30) = a4;
    v51 = v40[2];
    v52 = __OFADD__(v51, 1);
    v53 = v51 + 1;
    if (v52)
      goto LABEL_106;
    v40[2] = v53;
    swift_bridgeObjectRetain();
LABEL_7:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    ++v32;
    a4 = (unint64_t)v179;
    if (v182 == v31)
      goto LABEL_24;
  }
  __break(1u);
LABEL_115:
  __break(1u);
LABEL_116:
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
  result = sub_218989264();
  __break(1u);
  return result;
}

uint64_t sub_21895E7C8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_2189892C4();
    sub_218988F4C();
    v6 = sub_2189892E8();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_218989240() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_218989240() & 1) != 0)
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

id sub_21895E8FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v17;
  uint64_t v18;
  char *v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  _QWORD *v24;
  char *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30[2];

  v30[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = sub_218988D84();
  v29 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend(*(id *)(v0 + 168), sel_newBackgroundContext);
  v5 = *(void **)(v0 + 176);
  v30[0] = 0;
  v6 = objc_msgSend(v5, sel_allPublishedLocalStatusesInDatabaseContext_error_, v4, v30);
  v7 = v30[0];
  if (!v6)
  {
    v17 = v30[0];
    v3 = (char *)sub_218988B74();

    swift_willThrow();
    if (qword_253E6EE80 == -1)
    {
LABEL_12:
      v18 = sub_218988E20();
      __swift_project_value_buffer(v18, (uint64_t)qword_253E6EE68);
      v19 = v3;
      v20 = v3;
      v21 = sub_218988E14();
      v22 = sub_218989060();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc();
        v24 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v23 = 138412290;
        v25 = v3;
        v26 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v30[0] = v26;
        sub_2189890C0();
        *v24 = v26;

        _os_log_impl(&dword_2188DF000, v21, v22, "Filtered Device Types FAILED - error reading allPublishedLocalStatuses: %@", v23, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
        swift_arrayDestroy();
        MEMORY[0x219A1D978](v24, -1, -1);
        MEMORY[0x219A1D978](v23, -1, -1);
      }
      else
      {

      }
      return (id)MEMORY[0x24BEE4B08];
    }
LABEL_20:
    swift_once();
    goto LABEL_12;
  }
  v8 = v6;
  sub_21897FBC8(0, (unint64_t *)&unk_253E6E858);
  v9 = sub_218988FA0();
  v10 = v7;

  v30[0] = (id)MEMORY[0x24BEE4B08];
  if (!(v9 >> 62))
  {
    v11 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v11)
      goto LABEL_4;
LABEL_17:

    swift_bridgeObjectRelease();
    return (id)MEMORY[0x24BEE4B08];
  }
  swift_bridgeObjectRetain();
  v11 = sub_2189891F8();
  swift_bridgeObjectRelease();
  if (!v11)
    goto LABEL_17;
LABEL_4:
  if (v11 < 1)
  {
    __break(1u);
    goto LABEL_20;
  }
  v28 = v4;
  v12 = 0;
  do
  {
    if ((v9 & 0xC000000000000001) != 0)
      v13 = (id)MEMORY[0x219A1CED4](v12, v9);
    else
      v13 = *(id *)(v9 + 8 * v12 + 32);
    v14 = v13;
    ++v12;
    objc_msgSend(v13, sel_targetDevicesFlags);
    sub_218988D6C();
    v15 = sub_218988D30();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v3, v1);
    sub_21895ECB4(v15);

  }
  while (v11 != v12);

  swift_bridgeObjectRelease();
  return v30[0];
}

uint64_t sub_21895ECB4(uint64_t result)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;

  v1 = result;
  v2 = 0;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v10 >= v7)
      return swift_release();
    v11 = *(_QWORD *)(v3 + 8 * v10);
    ++v2;
    if (!v11)
    {
      v2 = v10 + 1;
      if (v10 + 1 >= v7)
        return swift_release();
      v11 = *(_QWORD *)(v3 + 8 * v2);
      if (!v11)
      {
        v2 = v10 + 2;
        if (v10 + 2 >= v7)
          return swift_release();
        v11 = *(_QWORD *)(v3 + 8 * v2);
        if (!v11)
        {
          v2 = v10 + 3;
          if (v10 + 3 >= v7)
            return swift_release();
          v11 = *(_QWORD *)(v3 + 8 * v2);
          if (!v11)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v2 << 6);
LABEL_5:
    result = sub_2189784AC(&v13, *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8 * v9));
  }
  v12 = v10 + 4;
  if (v12 >= v7)
    return swift_release();
  v11 = *(_QWORD *)(v3 + 8 * v12);
  if (v11)
  {
    v2 = v12;
    goto LABEL_22;
  }
  while (1)
  {
    v2 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v2 >= v7)
      return swift_release();
    v11 = *(_QWORD *)(v3 + 8 * v2);
    ++v12;
    if (v11)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_21895EDFC(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;

  v4 = sub_21895BC24((_BYTE *)0xD000000000000025, 0x80000002189931C0);
  v5 = v4;
  if (!(v4 >> 62))
  {
    v6 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    v21 = a1;
    v22 = a2;
    if (v6)
      goto LABEL_3;
LABEL_17:
    v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_18:
    swift_bridgeObjectRelease_n();
    v20 = sub_21895F2C0(v21, v22, v9);
    swift_bridgeObjectRelease();
    return v20 & 1;
  }
  swift_bridgeObjectRetain();
  result = sub_2189891F8();
  v6 = result;
  v21 = a1;
  v22 = a2;
  if (!result)
    goto LABEL_17;
LABEL_3:
  if (v6 >= 1)
  {
    v8 = 0;
    v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v5 & 0xC000000000000001) != 0)
        v10 = (id)MEMORY[0x219A1CED4](v8, v5);
      else
        v10 = *(id *)(v5 + 8 * v8 + 32);
      v11 = v10;
      v12 = objc_msgSend(v10, sel_uniqueID, v21, v22);
      if (v12)
      {
        v13 = v12;
        v14 = sub_218988F28();
        v16 = v15;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v9 = sub_218973CF0(0, v9[2] + 1, 1, v9);
        v18 = v9[2];
        v17 = v9[3];
        if (v18 >= v17 >> 1)
          v9 = sub_218973CF0((_QWORD *)(v17 > 1), v18 + 1, 1, v9);
        v9[2] = v18 + 1;
        v19 = &v9[2 * v18];
        v19[4] = v14;
        v19[5] = v16;
      }
      else
      {

      }
      ++v8;
    }
    while (v6 != v8);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

void sub_21895EFCC(void (*a1)(id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, char *, _QWORD *);
  char *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  void (*v31)(id *);
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  id v35;

  v31 = a1;
  v32 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550018E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (_QWORD *)__swift_instantiateConcreteTypeFromMangledName(&qword_253E6E540);
  v9 = *(v8 - 1);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v30 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v27 = (char *)&v25 - v12;
  if (a3 >> 62)
    goto LABEL_20;
  v13 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v13; v13 = sub_2189891F8())
  {
    v33 = v9;
    v29 = a3 & 0xC000000000000001;
    v34 = MEMORY[0x24BEE4AF8];
    v9 = 4;
    v26 = a3;
    v28 = v13;
    while (1)
    {
      v14 = v8;
      v15 = v29 ? (_QWORD *)MEMORY[0x219A1CED4](v9 - 4, a3) : *(id *)(a3 + 8 * v9);
      v8 = v15;
      v16 = v9 - 3;
      if (__OFADD__(v9 - 4, 1))
        break;
      v35 = v15;
      v31(&v35);
      if (v3)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return;
      }

      v17 = v33;
      v8 = v14;
      if ((*(unsigned int (**)(char *, uint64_t, _QWORD *))(v33 + 48))(v7, 1, v14) == 1)
      {
        sub_21897FCD4((uint64_t)v7, &qword_2550018E0);
      }
      else
      {
        v18 = *(void (**)(char *, char *, _QWORD *))(v17 + 32);
        v19 = v27;
        v18(v27, v7, v14);
        v18(v30, v19, v14);
        v20 = v34;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v20 = sub_218973DFC(0, *(_QWORD *)(v20 + 16) + 1, 1, v20);
        v22 = *(_QWORD *)(v20 + 16);
        v21 = *(_QWORD *)(v20 + 24);
        v34 = v20;
        if (v22 >= v21 >> 1)
          v34 = sub_218973DFC(v21 > 1, v22 + 1, 1, v34);
        v23 = v33;
        v24 = v34;
        *(_QWORD *)(v34 + 16) = v22 + 1;
        v8 = v14;
        v18((char *)(v24+ ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80))+ *(_QWORD *)(v23 + 72) * v22), v30, v14);
        a3 = v26;
      }
      ++v9;
      if (v16 == v28)
        goto LABEL_21;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
}

uint64_t sub_21895F2C0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_218989240();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_218989240() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_21895F384@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  result = sub_218988D9C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21895F3B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5[87] = v4;
  v5[86] = a4;
  v5[85] = a3;
  v5[84] = a2;
  v5[83] = a1;
  __swift_instantiateConcreteTypeFromMangledName(qword_253E6E760);
  v5[88] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E6F0);
  v5[89] = v6;
  v5[90] = *(_QWORD *)(v6 - 8);
  v5[91] = swift_task_alloc();
  v5[92] = swift_task_alloc();
  v7 = sub_218988EA4();
  v5[93] = v7;
  v5[94] = *(_QWORD *)(v7 - 8);
  v5[95] = swift_task_alloc();
  v8 = sub_218988EBC();
  v5[96] = v8;
  v5[97] = *(_QWORD *)(v8 - 8);
  v5[98] = swift_task_alloc();
  v9 = sub_218988BF8();
  v5[99] = v9;
  v5[100] = *(_QWORD *)(v9 - 8);
  v5[101] = swift_task_alloc();
  v5[102] = swift_task_alloc();
  v5[103] = swift_task_alloc();
  v10 = type metadata accessor for SKALocalStatusServer.FailedDelivery(0);
  v5[104] = v10;
  v5[105] = *(_QWORD *)(v10 - 8);
  v5[106] = swift_task_alloc();
  v5[107] = swift_task_alloc();
  v5[108] = swift_task_alloc();
  v5[109] = swift_task_alloc();
  v5[110] = swift_task_alloc();
  v5[111] = swift_task_alloc();
  v5[112] = __swift_instantiateConcreteTypeFromMangledName(&qword_255001550);
  v5[113] = swift_task_alloc();
  v5[114] = swift_task_alloc();
  v5[115] = swift_task_alloc();
  v5[116] = swift_task_alloc();
  v5[117] = swift_task_alloc();
  v11 = type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(0);
  v5[118] = v11;
  v5[119] = *(_QWORD *)(v11 - 8);
  v5[120] = swift_task_alloc();
  v5[121] = swift_task_alloc();
  v5[122] = swift_task_alloc();
  v5[123] = swift_task_alloc();
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v5[124] = v12;
  v5[125] = *(_QWORD *)(v12 - 8);
  v5[126] = swift_task_alloc();
  v5[127] = swift_task_alloc();
  v5[128] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21895F684()
{
  uint64_t v0;
  id *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  unint64_t v28;
  id v29;
  void **v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  unint64_t v37;
  void **v38;
  id v39;
  NSObject *v40;
  os_log_type_t v41;
  _BOOL4 v42;
  void *v43;
  uint8_t *v44;
  _QWORD *v45;
  id v46;
  _QWORD *v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  NSObject *v55;
  int v56;
  id v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  NSObject *v67;
  os_log_type_t v68;
  _BOOL4 v69;
  void *v70;
  uint64_t v71;
  _QWORD *v72;
  id v73;
  id v74;
  uint64_t v75;
  id v76;
  id v77;
  os_log_type_t v78;
  _BOOL4 v79;
  id v80;
  uint8_t *v81;
  _QWORD *v82;
  id v83;
  id v84;
  id v85;
  os_log_type_t v86;
  _BOOL4 v87;
  _QWORD *v88;
  id v89;
  id v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  NSObject *v110;
  os_log_type_t v111;
  _BOOL4 v112;
  void *v113;
  void *v114;
  uint64_t v115;
  _QWORD *v116;
  id v117;
  uint64_t v118;
  unint64_t v119;
  unint64_t v120;
  id v121;
  uint64_t v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t *v128;
  _QWORD *v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  char v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  id v139;
  uint64_t v140;
  unint64_t v141;
  char v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  char v154;
  void (*v155)(uint64_t, uint64_t);
  id v156;
  NSObject *v157;
  os_log_type_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  unint64_t v163;
  id v164;
  uint64_t v165;
  void *v166;
  unint64_t v167;
  unint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  unint64_t v177;
  unint64_t v178;
  uint64_t v179;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v181;
  unint64_t v182;
  uint64_t v183;
  _QWORD *v184;
  void *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  id v190;
  id v191;
  void *v192;
  void *v193;
  uint64_t v194;
  id v195;
  unint64_t v196;
  uint64_t v197;
  unint64_t v198;
  unint64_t v199;
  id v200;
  BOOL v201;
  _QWORD *v202;
  void *v203;
  id v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  id v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  char v212;
  id v213;
  unint64_t v214;
  id v215;
  unint64_t v216;
  uint64_t v217;
  unint64_t v218;
  objc_class *v219;
  objc_class *v220;
  id v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  unint64_t v227;
  uint64_t v228;
  _QWORD *v229;
  BOOL v230;
  unint64_t v231;
  _QWORD *v232;
  BOOL v233;
  unint64_t i;
  unint64_t v235;
  _QWORD *v236;
  BOOL v237;
  uint64_t v238;
  id v239;
  id v240;
  void *v241;
  void *v242;
  id v243;
  uint64_t v244;
  id v245;
  void *v246;
  unsigned int v247;
  void *v248;
  id v249;
  void *v250;
  id v251;
  void *v252;
  id v253;
  id v254;
  id v255;
  id v256;
  NSObject *v257;
  os_log_type_t v258;
  _BOOL4 v259;
  uint64_t v260;
  void *v261;
  uint64_t v262;
  _QWORD *v263;
  id v264;
  id v265;
  uint64_t v266;
  unint64_t v267;
  id v268;
  void *v269;
  uint64_t v270;
  _QWORD *v271;
  void *v272;
  id v273;
  uint64_t v274;
  _QWORD *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  id v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t *v290;
  _QWORD *v291;
  uint64_t v292;
  uint64_t v293;
  unint64_t v294;
  char v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t *v299;
  _QWORD *v300;
  char v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t *v305;
  _QWORD *v306;
  char v307;
  char v308;
  void *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  id v318;
  uint64_t v319;
  uint64_t *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  _QWORD *v324;
  unint64_t v325;
  char v326;
  char v327;
  uint64_t v328;
  uint64_t v329;
  char v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  char v341;
  uint64_t v342;
  uint64_t v343;
  unint64_t v344;
  char v345;
  char v346;
  char v347;
  uint64_t v348;
  void *v349;
  unint64_t v350;
  NSObject *v351;
  os_log_type_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  void *v356;
  uint64_t *v357;
  _QWORD *v358;
  _BYTE *v359;
  uint64_t *v360;
  uint64_t v361;
  void *aBlock;
  uint64_t v363;
  uint64_t v364;
  _QWORD *v365;
  uint64_t v366;
  os_log_type_t type;
  uint64_t v368;
  uint64_t v369;
  unint64_t v370;
  uint64_t v371;
  unint64_t v372;
  uint64_t v373;
  uint64_t v374;
  _QWORD *v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  _QWORD *v379;
  uint64_t v380;
  uint64_t v381;
  _QWORD *v382;
  id v383;
  _QWORD *v384;
  uint64_t v385;
  uint64_t v386;
  _QWORD *v387;
  uint64_t v388;
  uint64_t v389;
  id v390;
  NSObject *v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  os_log_type_t v395;
  uint64_t v396;
  NSObject *v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  id *v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  unint64_t v408;
  uint64_t v409;
  uint64_t v410;
  unint64_t v411;
  void *v412;
  _QWORD *v413;
  uint64_t v414;
  uint64_t v415;
  unint64_t v416;
  NSObject *v417;
  void *v418;
  void *v419;
  _OWORD *v420;
  _BOOL4 v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424[11];

  v424[9] = *MEMORY[0x24BDAC8D0];
  v420 = (_OWORD *)(v0 + 656);
  if (qword_253E6EE80 != -1)
    goto LABEL_136;
  while (1)
  {
    v1 = (id *)(v0 + 664);
    v2 = *(void **)(v0 + 664);
    v3 = sub_218988E20();
    v4 = __swift_project_value_buffer(v3, (uint64_t)qword_253E6EE68);
    *(_QWORD *)(v0 + 1032) = v4;
    swift_bridgeObjectRetain_n();
    v5 = v2;
    v6 = sub_218988E14();
    v7 = sub_218989078();
    v8 = os_log_type_enabled(v6, v7);
    v9 = *(_QWORD *)(v0 + 680);
    v404 = (id *)(v0 + 664);
    if (v8)
    {
      v10 = *(_QWORD *)(v0 + 672);
      v11 = *(void **)(v0 + 664);
      v12 = swift_slowAlloc();
      v13 = (_QWORD *)swift_slowAlloc();
      v409 = swift_slowAlloc();
      v424[0] = v409;
      *(_DWORD *)v12 = 136315394;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 656) = sub_218974338(v10, v9, v424);
      sub_2189890C0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v12 + 12) = 2112;
      *(_QWORD *)(v0 + 472) = v11;
      v14 = v11;
      sub_2189890C0();
      *v13 = v11;

      _os_log_impl(&dword_2188DF000, v6, v7, "Send pending status START {reason: %s, clDevice: %@}", (uint8_t *)v12, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v13, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v409, -1, -1);
      v15 = v12;
      v1 = (id *)(v0 + 664);
      MEMORY[0x219A1D978](v15, -1, -1);

    }
    else
    {
      v16 = *v1;

      swift_bridgeObjectRelease_n();
    }
    v17 = objc_msgSend(*v1, sel_idsDeviceIdentifier);
    if (!v17)
    {
      v38 = v1;
      v39 = *v1;
      v40 = sub_218988E14();
      v41 = sub_21898906C();
      v42 = os_log_type_enabled(v40, v41);
      v43 = *v38;
      if (!v42)
      {

        goto LABEL_36;
      }
      v44 = (uint8_t *)swift_slowAlloc();
      v45 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v44 = 138412290;
      *(_QWORD *)(v0 + 552) = v43;
      v46 = v43;
      sub_2189890C0();
      *v45 = v43;

      _os_log_impl(&dword_2188DF000, v40, v41, "Send pending status FAILED. idsIdentifier is nil {clDevice: %@}", v44, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
      swift_arrayDestroy();
      v47 = v45;
      goto LABEL_18;
    }
    v18 = v17;
    v19 = *(_QWORD *)(v0 + 696);
    v20 = *(_QWORD *)(v0 + 688);
    v21 = sub_218988F28();
    v23 = v22;

    *(_QWORD *)(v0 + 1040) = v21;
    *(_QWORD *)(v0 + 1048) = v23;
    v24 = *(void **)(v19 + 176);
    *(_QWORD *)(v0 + 1056) = v24;
    *(_QWORD *)(v0 + 544) = 0;
    v25 = objc_msgSend(v24, sel_allPublishedLocalStatusDevicesInDatabaseContext_error_, v20, v0 + 544);
    v26 = *(void **)(v0 + 544);
    if (!v25)
    {
      v61 = v26;
      swift_bridgeObjectRelease();
      v62 = (void *)sub_218988B74();

      swift_willThrow();
LABEL_26:
      v63 = *(id *)(v0 + 664);
      v64 = v62;
      v65 = v63;
      v66 = v62;
      v67 = sub_218988E14();
      v68 = sub_21898906C();
      v69 = os_log_type_enabled(v67, v68);
      v70 = *(void **)(v0 + 664);
      if (v69)
      {
        v71 = swift_slowAlloc();
        v72 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v71 = 138412546;
        *(_QWORD *)(v0 + 536) = v70;
        v73 = v70;
        sub_2189890C0();
        *v72 = v70;

        *(_WORD *)(v71 + 12) = 2112;
        v74 = v62;
        v75 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)(v0 + 504) = v75;
        sub_2189890C0();
        v72[1] = v75;

        _os_log_impl(&dword_2188DF000, v67, v68, "Send pending status FAILED. Error fetching status devices {clDevice: %@, error: %@}", (uint8_t *)v71, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
        swift_arrayDestroy();
        MEMORY[0x219A1D978](v72, -1, -1);
        MEMORY[0x219A1D978](v71, -1, -1);

      }
      else
      {

      }
      goto LABEL_36;
    }
    v27 = v25;
    *(_QWORD *)(v0 + 1064) = sub_21897FBC8(0, (unint64_t *)&unk_253E6E868);
    v28 = sub_218988FA0();
    v29 = v26;

    swift_bridgeObjectRetain();
    v30 = 0;
    v31 = sub_21897D9F8(v28, v21, (uint64_t)v23);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v31 >> 62)
    {
LABEL_138:
      swift_bridgeObjectRetain();
      v32 = sub_2189891F8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v32 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v33 = v0 + 648;
    if (!v32)
    {
      v76 = *v404;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v77 = v76;
      v40 = sub_218988E14();
      v78 = sub_218989078();
      v79 = os_log_type_enabled(v40, v78);
      v80 = *v404;
      if (v79)
      {
        v81 = (uint8_t *)swift_slowAlloc();
        v82 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v81 = 138412290;
        *(_QWORD *)v33 = v80;
        v83 = v80;
        sub_2189890C0();
        *v82 = v80;

        _os_log_impl(&dword_2188DF000, v40, v78, "Send pending status SKIPPED. No status devices. {clDevice: %@}", v81, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
        swift_arrayDestroy();
        MEMORY[0x219A1D978](v82, -1, -1);
        v48 = v81;
LABEL_32:
        MEMORY[0x219A1D978](v48, -1, -1);

LABEL_36:
        v421 = 0;
        goto LABEL_37;
      }
LABEL_35:

      goto LABEL_36;
    }
    v424[0] = MEMORY[0x24BEE4AF8];
    if (v32 < 1)
    {
LABEL_140:
      __break(1u);
    }
    else
    {
      v390 = v23;
      v394 = (uint64_t)v30;
      v400 = v4;
      aBlock = (void *)(v0 + 80);
      v361 = v0 + 432;
      v363 = v0 + 440;
      v364 = v0 + 496;
      v420 = (_OWORD *)(v0 + 168);
      v357 = (uint64_t *)(v0 + 456);
      v358 = (_QWORD *)(v0 + 464);
      v360 = (uint64_t *)(v0 + 488);
      v379 = (_QWORD *)(v0 + 528);
      v382 = (_QWORD *)(v0 + 520);
      v365 = (_QWORD *)(v0 + 624);
      v375 = (_QWORD *)(v0 + 632);
      v391 = (v0 + 640);
      v359 = (_BYTE *)(v0 + 1176);
      swift_bridgeObjectRetain();
      v34 = 0;
      do
      {
        if ((v31 & 0xC000000000000001) != 0)
          v35 = (id)MEMORY[0x219A1CED4](v34, v31);
        else
          v35 = *(id *)(v31 + 8 * v34 + 32);
        v36 = v35;
        ++v34;
        v23 = objc_msgSend(v35, sel_pendingStatuses, v357, v358);
        *(_QWORD *)(v0 + 1088) = sub_21897FBC8(0, (unint64_t *)&unk_253E6E858);
        v37 = sub_218988FA0();

        sub_218978C18(v37);
      }
      while (v32 != v34);
      swift_bridgeObjectRelease_n();
      v33 = v424[0];
      *(_QWORD *)(v0 + 1072) = v424[0];
      v31 = v33 >> 62;
      if (!(v33 >> 62))
      {
        v49 = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10);
        goto LABEL_21;
      }
    }
    swift_bridgeObjectRetain();
    v49 = sub_2189891F8();
    swift_bridgeObjectRelease();
LABEL_21:
    *(_QWORD *)(v0 + 1080) = v49;
    if (!v49)
    {
      v84 = *v404;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v85 = v84;
      v40 = sub_218988E14();
      v86 = sub_218989078();
      v87 = os_log_type_enabled(v40, v86);
      v80 = *v404;
      if (!v87)
        goto LABEL_35;
      v44 = (uint8_t *)swift_slowAlloc();
      v88 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v44 = 138412290;
      v391->isa = (Class)v80;
      v89 = v80;
      sub_2189890C0();
      *v88 = v80;

      _os_log_impl(&dword_2188DF000, v40, v86, "Send pending status SKIPPED. No pending statuses. {clDevice: %@}", v44, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
      swift_arrayDestroy();
      v47 = v88;
LABEL_18:
      MEMORY[0x219A1D978](v47, -1, -1);
      v48 = v44;
      goto LABEL_32;
    }
    v50 = *(_QWORD *)(v0 + 696);
    v51 = *(void **)(v0 + 664);
    v52 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE7CBF0]), sel_init);
    *(_QWORD *)(v0 + 1096) = v52;
    objc_msgSend(v52, sel_setDestinationDevice_, v51);
    objc_msgSend(v52, sel_setControlFlags_, 4194560);
    *(_QWORD *)(v0 + 1104) = *(_QWORD *)(v50 + 144);
    objc_msgSend(v52, sel_setDispatchQueue_);
    v53 = v51;
    swift_bridgeObjectRetain_n();
    v54 = v53;
    v55 = sub_218988E14();
    v56 = sub_218989078();
    if (os_log_type_enabled(v55, (os_log_type_t)v56))
    {
      LODWORD(v390) = v56;
      v400 = (uint64_t)v55;
      v57 = *v404;
      v370 = (unint64_t)v54;
      v58 = swift_slowAlloc();
      v372 = v31;
      v31 = swift_slowAlloc();
      *(_DWORD *)v58 = 138412546;
      v23 = (id)(v58 + 4);
      *v365 = v57;
      v59 = v57;
      sub_2189890C0();
      *(_QWORD *)v31 = v370;

      *(_WORD *)(v58 + 12) = 2048;
      if (v372)
      {
        swift_bridgeObjectRetain();
        v60 = sub_2189891F8();
        swift_bridgeObjectRelease();
      }
      else
      {
        v60 = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      v92 = (void *)v394;
      swift_bridgeObjectRelease();
      *v375 = v60;
      sub_2189890C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2188DF000, v55, (os_log_type_t)v56, "Send pending status CONTINUE {clDevice: %@, pendingStatuses.count: %ld}", (uint8_t *)v58, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v31, -1, -1);
      MEMORY[0x219A1D978](v58, -1, -1);
    }
    else
    {
      v91 = *v404;

      swift_bridgeObjectRelease_n();
      v92 = (void *)v394;
    }

    *(_QWORD *)(v0 + 488) = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v0 + 1112) = OBJC_IVAR___SKALocalStatusServer_failedDeliveries;
    if (v49 < 1)
      break;
    v93 = 0;
    v49 = MEMORY[0x24BEE4AF8];
    do
    {
      *(_QWORD *)(v0 + 1128) = v49;
      *(_QWORD *)(v0 + 1120) = v93;
      v100 = *(_QWORD *)(v0 + 1024);
      v101 = *(void **)(*(_QWORD *)(v0 + 1072) + 8 * v93 + 32);
      *(_QWORD *)(v0 + 1136) = v101;
      v102 = v101;
      sub_21896EEBC(v100);
      if (v92)
      {
        v103 = *(void **)(v0 + 1136);
        v104 = *(id *)(v0 + 664);
        v105 = v103;
        v106 = v92;
        v107 = v104;
        v108 = v105;
        v109 = v92;
        v110 = sub_218988E14();
        v111 = sub_218989060();
        v112 = os_log_type_enabled(v110, v111);
        v113 = *(void **)(v0 + 1136);
        v114 = *(void **)(v0 + 664);
        if (v112)
        {
          v395 = v111;
          v115 = swift_slowAlloc();
          v116 = (_QWORD *)swift_slowAlloc();
          v401 = swift_slowAlloc();
          v424[0] = v401;
          *(_DWORD *)v115 = 136315650;
          v117 = objc_msgSend(v113, sel_identifier);
          v118 = sub_218988F28();
          v391 = v110;
          v120 = v119;

          *(_QWORD *)(v0 + 512) = sub_218974338(v118, v120, v424);
          sub_2189890C0();

          swift_bridgeObjectRelease();
          *(_WORD *)(v115 + 12) = 2112;
          v121 = v92;
          v122 = _swift_stdlib_bridgeErrorToNSError();
          *v382 = v122;
          sub_2189890C0();
          *v116 = v122;

          *(_WORD *)(v115 + 22) = 2112;
          *v379 = v114;
          v123 = v114;
          sub_2189890C0();
          v116[1] = v114;

          _os_log_impl(&dword_2188DF000, v391, v395, "Status send FAILED {status: %s, error: %@, device: %@}", (uint8_t *)v115, 0x20u);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
          swift_arrayDestroy();
          MEMORY[0x219A1D978](v116, -1, -1);
          swift_arrayDestroy();
          MEMORY[0x219A1D978](v401, -1, -1);
          MEMORY[0x219A1D978](v115, -1, -1);

        }
        else
        {

        }
        v138 = (void *)sub_218988B68();
        v139 = objc_msgSend(v138, sel_userInfo);
        v140 = sub_218988ED4();

        if (*(_QWORD *)(v140 + 16)
          && (v141 = sub_218974A38(0x4D726F7272457563, 0xEA00000000006773), (v142 & 1) != 0))
        {
          sub_21897F3BC(*(_QWORD *)(v140 + 56) + 32 * v141, (uint64_t)v420);
        }
        else
        {
          *v420 = 0u;
          v420[1] = 0u;
        }
        swift_bridgeObjectRelease();
        if (*(_QWORD *)(v0 + 192))
        {
          if (swift_dynamicCast())
          {
            v143 = *(_QWORD *)(v0 + 416);
            v144 = *(_QWORD *)(v0 + 424);
LABEL_67:
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v49 = *(_QWORD *)(v0 + 1128);
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              v49 = (uint64_t)sub_218974214(0, *(_QWORD *)(v49 + 16) + 1, 1, *(_QWORD **)(v0 + 1128));
            v182 = *(_QWORD *)(v49 + 16);
            v181 = *(_QWORD *)(v49 + 24);
            if (v182 >= v181 >> 1)
              v49 = (uint64_t)sub_218974214((_QWORD *)(v181 > 1), v182 + 1, 1, (_QWORD *)v49);
            v183 = *(_QWORD *)(v0 + 1136);
            *(_QWORD *)(v49 + 16) = v182 + 1;
            v184 = (_QWORD *)(v49 + 24 * v182);
            v184[4] = v183;
            v184[5] = v143;
            v184[6] = v144;

            goto LABEL_45;
          }
        }
        else
        {
          sub_21897FCD4((uint64_t)v420, &qword_255001768);
        }
        swift_getErrorValue();
        v143 = sub_218989288();
        v144 = v179;
        goto LABEL_67;
      }
      v124 = *(_QWORD *)(v0 + 1048);
      v125 = *(_QWORD *)(v0 + 1040);
      v126 = *(_QWORD *)(v0 + 984);
      v127 = *(_QWORD *)(v0 + 944);
      v128 = (uint64_t *)(*(_QWORD *)(v0 + 696) + *(_QWORD *)(v0 + 1112));
      (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 1000) + 16))(v126, *(_QWORD *)(v0 + 1024), *(_QWORD *)(v0 + 992));
      v129 = (_QWORD *)(v126 + *(int *)(v127 + 20));
      *v129 = v125;
      v129[1] = v124;
      swift_beginAccess();
      v130 = *v128;
      v131 = *(_QWORD *)(*v128 + 16);
      swift_bridgeObjectRetain();
      if (v131 && (v132 = sub_218974978(*(_QWORD *)(v0 + 984)), (v133 & 1) != 0))
      {
        v134 = *(_QWORD *)(v0 + 928);
        v135 = *(_QWORD *)(v0 + 888);
        v136 = *(_QWORD *)(v0 + 880);
        v137 = *(_QWORD *)(v0 + 800);
        v396 = *(_QWORD *)(v0 + 792);
        v402 = *(_QWORD *)(v0 + 936);
        sub_21897F33C(*(_QWORD *)(v130 + 56) + *(_QWORD *)(*(_QWORD *)(v0 + 840) + 72) * v132, v136, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        sub_21897F960(v136, v135, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        swift_endAccess();
        sub_218988B98();
        sub_218988BA4();
        sub_21897F380(v135, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v137 + 56))(v134, 0, 1, v396);
        sub_21897FC00(v134, v402, &qword_255001550);
      }
      else
      {
        v145 = *(_QWORD *)(v0 + 936);
        v146 = *(_QWORD *)(v0 + 800);
        v147 = *(_QWORD *)(v0 + 792);
        swift_endAccess();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v146 + 56))(v145, 1, 1, v147);
      }
      v148 = *(_QWORD *)(v0 + 920);
      v149 = *(_QWORD *)(v0 + 800);
      v150 = *(_QWORD *)(v0 + 792);
      sub_218980220(*(_QWORD *)(v0 + 936), v148, &qword_255001550);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v149 + 48))(v148, 1, v150) == 1)
      {
        sub_21897FCD4(*(_QWORD *)(v0 + 920), &qword_255001550);
LABEL_129:
        v252 = *(void **)(v0 + 664);
        sub_218980220(*(_QWORD *)(v0 + 936), *(_QWORD *)(v0 + 912), &qword_255001550);
        v253 = v252;
        v254 = v102;
        v255 = v253;
        v256 = v254;
        v257 = sub_218988E14();
        v258 = sub_218989078();
        v259 = os_log_type_enabled(v257, v258);
        v260 = *(_QWORD *)(v0 + 912);
        if (v259)
        {
          v405 = *(_QWORD *)(v0 + 904);
          v261 = *(void **)(v0 + 664);
          v417 = v257;
          v262 = swift_slowAlloc();
          v263 = (_QWORD *)swift_slowAlloc();
          v422 = swift_slowAlloc();
          v424[0] = v422;
          *(_DWORD *)v262 = 138412802;
          *(_QWORD *)(v0 + 576) = v256;
          v264 = v256;
          sub_2189890C0();
          *v263 = v256;

          *(_WORD *)(v262 + 12) = 2112;
          *(_QWORD *)(v0 + 584) = v261;
          v265 = v261;
          sub_2189890C0();
          v263[1] = v261;

          *(_WORD *)(v262 + 22) = 2080;
          sub_218980220(v260, v405, &qword_255001550);
          v266 = sub_218988F34();
          *(_QWORD *)(v0 + 592) = sub_218974338(v266, v267, v424);
          sub_2189890C0();
          swift_bridgeObjectRelease();
          sub_21897FCD4(v260, &qword_255001550);
          _os_log_impl(&dword_2188DF000, v417, v258, "Status send START {status: %@, device: %@, nextAttemptDate: %s}", (uint8_t *)v262, 0x20u);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
          swift_arrayDestroy();
          MEMORY[0x219A1D978](v263, -1, -1);
          swift_arrayDestroy();
          MEMORY[0x219A1D978](v422, -1, -1);
          MEMORY[0x219A1D978](v262, -1, -1);

        }
        else
        {
          v268 = *v404;

          sub_21897FCD4(v260, &qword_255001550);
        }
        v269 = *(void **)(v0 + 1096);
        *(_QWORD *)(v0 + 16) = v0;
        *(_QWORD *)(v0 + 24) = sub_2189625F8;
        v270 = swift_continuation_init();
        *(_QWORD *)(v0 + 128) = MEMORY[0x24BDAC760];
        v271 = (_QWORD *)(v0 + 128);
        v271[1] = 0x40000000;
        v271[2] = sub_218969EA8;
        v271[3] = &block_descriptor_58;
        v271[4] = v270;
        objc_msgSend(v269, sel_activateWithCompletion_, v271);
        return swift_continuation_await();
      }
      v151 = *(_QWORD *)(v0 + 816);
      v152 = *(_QWORD *)(v0 + 800);
      v153 = *(_QWORD *)(v0 + 792);
      (*(void (**)(_QWORD, _QWORD, uint64_t))(v152 + 32))(*(_QWORD *)(v0 + 824), *(_QWORD *)(v0 + 920), v153);
      sub_218988BE0();
      v154 = sub_218988BBC();
      v155 = *(void (**)(uint64_t, uint64_t))(v152 + 8);
      v155(v151, v153);
      if ((v154 & 1) == 0)
      {
        v155(*(_QWORD *)(v0 + 824), *(_QWORD *)(v0 + 792));
        goto LABEL_129;
      }
      v403 = v49;
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 800) + 16))(*(_QWORD *)(v0 + 808), *(_QWORD *)(v0 + 824), *(_QWORD *)(v0 + 792));
      swift_bridgeObjectRetain_n();
      v156 = v102;
      v157 = sub_218988E14();
      v158 = sub_218989078();
      v397 = v157;
      if (os_log_type_enabled(v157, v158))
      {
        v391 = *(NSObject **)(v0 + 1024);
        v373 = *(_QWORD *)(v0 + 1000);
        v377 = *(_QWORD *)(v0 + 992);
        v371 = *(_QWORD *)(v0 + 984);
        v368 = *(_QWORD *)(v0 + 824);
        v369 = *(_QWORD *)(v0 + 936);
        v159 = *(_QWORD *)(v0 + 808);
        v160 = *(_QWORD *)(v0 + 792);
        type = v158;
        v161 = swift_slowAlloc();
        v366 = swift_slowAlloc();
        v424[0] = v366;
        *(_DWORD *)v161 = 136315650;
        sub_218974B58(&qword_255001790, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
        v162 = sub_218989234();
        *(_QWORD *)(v0 + 600) = sub_218974338(v162, v163, v424);
        sub_2189890C0();
        swift_bridgeObjectRelease();
        v155(v159, v160);
        *(_WORD *)(v161 + 12) = 2080;
        v164 = objc_msgSend(v156, sel_identifier);
        v165 = sub_218988F28();
        v166 = v156;
        v168 = v167;

        *(_QWORD *)(v0 + 608) = sub_218974338(v165, v168, v424);
        sub_2189890C0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v161 + 22) = 2080;
        swift_bridgeObjectRetain();
        v169 = sub_21897BF64(8);
        v171 = v170;
        v173 = v172;
        v175 = v174;
        swift_bridgeObjectRelease();
        v176 = MEMORY[0x219A1CCAC](v169, v171, v173, v175);
        v178 = v177;
        swift_bridgeObjectRelease();
        *(_QWORD *)(v0 + 616) = sub_218974338(v176, v178, v424);
        sub_2189890C0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2188DF000, v397, type, "Status send SKIP. Not enough time since latest failed attempt. {nextAttemptDate: %s, status.identifier: %s, idsIdentifier: %s}", (uint8_t *)v161, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x219A1D978](v366, -1, -1);
        MEMORY[0x219A1D978](v161, -1, -1);

        v155(v368, v160);
        sub_21897FCD4(v369, &qword_255001550);
        sub_21897F380(v371, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(NSObject *, uint64_t))(v373 + 8))(v391, v377);
      }
      else
      {
        v391 = *(NSObject **)(v0 + 1024);
        v94 = *(_QWORD *)(v0 + 1000);
        v376 = *(_QWORD *)(v0 + 992);
        v95 = *(_QWORD *)(v0 + 984);
        v96 = *(_QWORD *)(v0 + 936);
        v97 = *(_QWORD *)(v0 + 824);
        v98 = *(_QWORD *)(v0 + 808);
        v99 = *(_QWORD *)(v0 + 792);

        swift_bridgeObjectRelease_n();
        v155(v98, v99);

        v155(v97, v99);
        sub_21897FCD4(v96, &qword_255001550);
        sub_21897F380(v95, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(NSObject *, uint64_t))(v94 + 8))(v391, v376);
      }
      v49 = v403;
LABEL_45:
      v92 = 0;
      v93 = *(_QWORD *)(v0 + 1120) + 1;
    }
    while (v93 != *(_QWORD *)(v0 + 1080));
    v400 = v49;
    v185 = *(void **)(v0 + 1096);
    v186 = *(_QWORD *)(v0 + 784);
    v394 = *(_QWORD *)(v0 + 776);
    v410 = *(_QWORD *)(v0 + 768);
    v187 = *(_QWORD *)(v0 + 760);
    v188 = *(_QWORD *)(v0 + 752);
    v23 = *(id *)(v0 + 744);
    v415 = *(_QWORD *)(v0 + 688);
    v420 = *(_OWORD **)(v0 + 1056);
    swift_bridgeObjectRelease();
    v189 = swift_allocObject();
    *(_QWORD *)(v189 + 16) = v185;
    *(_QWORD *)(v0 + 112) = sub_21897F32C;
    *(_QWORD *)(v0 + 120) = v189;
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    *(_QWORD *)(v0 + 88) = 1107296256;
    *(_QWORD *)(v0 + 96) = sub_218951B34;
    *(_QWORD *)(v0 + 104) = &block_descriptor_57;
    v33 = (unint64_t)_Block_copy(aBlock);
    v190 = v185;
    sub_218988EB0();
    *(_QWORD *)(v0 + 448) = MEMORY[0x24BEE4AF8];
    sub_218974B58(&qword_255001770, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255001778);
    sub_21897FAFC((unint64_t *)&unk_255001780, &qword_255001778, MEMORY[0x24BEE12C8]);
    sub_2189890F0();
    MEMORY[0x219A1CE08](0, v186, v187, v33);
    _Block_release((const void *)v33);
    (*(void (**)(uint64_t, id))(v188 + 8))(v187, v23);
    (*(void (**)(uint64_t, uint64_t))(v394 + 8))(v186, v410);
    swift_release();
    *(_QWORD *)(v0 + 440) = 0;
    v191 = objc_msgSend(v420, sel_allPublishedLocalStatusDevicesInDatabaseContext_error_, v415, v363);
    v192 = *(void **)(v0 + 440);
    if (!v191)
    {
      v250 = *(void **)(v0 + 1096);
      v251 = v192;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v62 = (void *)sub_218988B74();

      swift_willThrow();
      goto LABEL_26;
    }
    v193 = v191;
    v194 = sub_218988FA0();
    v195 = v192;

    v196 = swift_bridgeObjectRetain();
    v197 = sub_21895CE7C(v196, v361, (SEL *)&selRef_identifier);
    v390 = 0;
    v198 = v194;
    swift_bridgeObjectRelease();
    v31 = sub_21897BD40(v197);
    swift_bridgeObjectRelease();
    v370 = v198;
    if (v198 >> 62)
      goto LABEL_143;
    v4 = *(_QWORD *)((v198 & 0xFFFFFFFFFFFFF8) + 0x10);
    v30 = (void **)(v0 + 664);
    if (!v4)
      goto LABEL_144;
LABEL_75:
    v199 = 0;
    v379 = (_QWORD *)(v370 & 0xC000000000000001);
    v416 = v31 + 56;
    v375 = (_QWORD *)v4;
    while (2)
    {
      if (v379)
      {
        v200 = (id)MEMORY[0x219A1CED4](v199, v370);
      }
      else
      {
        if (v199 >= *(_QWORD *)((v370 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_140;
        }
        v200 = *(id *)(v370 + 32 + 8 * v199);
      }
      v201 = __OFADD__(v199, 1);
      v202 = (_QWORD *)(v199 + 1);
      if (v201)
      {
        __break(1u);
        goto LABEL_138;
      }
      v387 = v202;
      v203 = *v30;
      v33 = (unint64_t)v200;
      v204 = objc_msgSend(v200, sel_idsIdentifier);
      v205 = sub_218988F28();
      v207 = v206;

      v208 = objc_msgSend(v203, sel_idsDeviceIdentifier);
      if (!v208)
      {

        swift_bridgeObjectRelease();
        goto LABEL_77;
      }
      v23 = v208;
      v382 = (_QWORD *)v33;
      v209 = sub_218988F28();
      v211 = v210;

      if (v205 == v209 && v207 == v211)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_88;
      }
      v212 = sub_218989240();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v212 & 1) == 0)
      {

        goto LABEL_77;
      }
LABEL_88:
      v213 = objc_msgSend((id)v33, sel_pendingStatuses);
      v214 = sub_218988FA0();

      swift_bridgeObjectRetain();
      sub_21897DBB0(v214, v31);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v423 = *(_QWORD *)(v0 + 488);
      swift_bridgeObjectRetain();
      v215 = objc_msgSend((id)v33, sel_deliveredStatuses);
      v216 = sub_218988FA0();

      if (!(v216 >> 62))
      {
        v217 = *(_QWORD *)((v216 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v217)
          goto LABEL_90;
LABEL_121:
        v23 = *(id *)(v0 + 1064);
        v412 = *(void **)(v0 + 1056);
        v420 = *(_OWORD **)(v0 + 688);
        swift_bridgeObjectRelease();
        v239 = objc_msgSend(v382, sel_idsIdentifier);
        sub_218988F28();

        v240 = objc_allocWithZone((Class)SKADatabasePublishedLocalStatusDevice);
        v33 = sub_218988F1C();
        swift_bridgeObjectRelease();
        v241 = (void *)sub_218988F94();
        swift_bridgeObjectRelease();
        v242 = (void *)sub_218988F94();
        swift_bridgeObjectRelease();
        v243 = objc_msgSend(v240, sel_initWithIDSIdentifier_pendingStatuses_deliveredStatuses_, v33, v241, v242);

        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E8B8);
        v244 = swift_allocObject();
        *(_OWORD *)(v244 + 16) = xmmword_2189901C0;
        *(_QWORD *)(v244 + 32) = v243;
        v424[0] = v244;
        sub_218988FB8();
        v245 = v243;
        v246 = (void *)sub_218988F94();
        swift_bridgeObjectRelease();
        *(_QWORD *)(v0 + 496) = 0;
        v247 = objc_msgSend(v412, sel_createOrUpdatePublishedLocalStatusDevices_databaseContext_error_, v246, v420, v364);

        v248 = *(void **)(v0 + 496);
        if (!v247)
        {
          v272 = *(void **)(v0 + 1096);
          v273 = v248;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v62 = (void *)sub_218988B74();

          swift_willThrow();
          goto LABEL_26;
        }
        v249 = v248;

        v49 = v400;
        v30 = (void **)(v0 + 664);
LABEL_77:
        v4 = (uint64_t)v375;
        v199 = (unint64_t)v387;
        if (v387 == v375)
          goto LABEL_144;
        continue;
      }
      break;
    }
    swift_bridgeObjectRetain();
    v217 = sub_2189891F8();
    swift_bridgeObjectRelease();
    if (!v217)
      goto LABEL_121;
LABEL_90:
    v218 = 0;
    v420 = (_OWORD *)(v216 & 0xC000000000000001);
    v411 = v216;
    v391 = (v216 + 32);
    v394 = v216 & 0xFFFFFFFFFFFFFF8;
    while (1)
    {
      if (v420)
      {
        v219 = (objc_class *)MEMORY[0x219A1CED4](v218, v411);
      }
      else
      {
        if (v218 >= *(_QWORD *)(v394 + 16))
          goto LABEL_135;
        v219 = v391[v218].isa;
      }
      v220 = v219;
      v201 = __OFADD__(v218++, 1);
      if (v201)
        break;
      v221 = -[objc_class identifier](v219, sel_identifier);
      v222 = sub_218988F28();
      v224 = v223;

      if (*(_QWORD *)(v31 + 16))
      {
        sub_2189892C4();
        sub_218988F4C();
        v225 = sub_2189892E8();
        v226 = -1 << *(_BYTE *)(v31 + 32);
        v227 = v225 & ~v226;
        if (((*(_QWORD *)(v416 + ((v227 >> 3) & 0xFFFFFFFFFFFFF8)) >> v227) & 1) != 0)
        {
          v228 = *(_QWORD *)(v31 + 48);
          v229 = (_QWORD *)(v228 + 16 * v227);
          v230 = *v229 == v222 && v229[1] == v224;
          if (v230 || (sub_218989240() & 1) != 0)
          {
LABEL_91:

            swift_bridgeObjectRelease();
            if (v218 == v217)
              goto LABEL_121;
            continue;
          }
          v385 = ~v226;
          v231 = (v227 + 1) & ~v226;
          if (((*(_QWORD *)(v416 + ((v231 >> 3) & 0xFFFFFFFFFFFFF8)) >> v231) & 1) != 0)
          {
            v232 = (_QWORD *)(v228 + 16 * v231);
            v233 = *v232 == v222 && v232[1] == v224;
            if (v233 || (sub_218989240() & 1) != 0)
              goto LABEL_91;
            for (i = v231 + 1; ; i = v235 + 1)
            {
              v235 = i & v385;
              if (((*(_QWORD *)(v416 + (((i & v385) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v385)) & 1) == 0)
                break;
              v236 = (_QWORD *)(v228 + 16 * v235);
              v237 = *v236 == v222 && v236[1] == v224;
              if (v237 || (sub_218989240() & 1) != 0)
                goto LABEL_91;
            }
          }
        }
      }
      v238 = swift_bridgeObjectRelease();
      MEMORY[0x219A1CCF4](v238);
      if (*(_QWORD *)((v423 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v423 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_218988FC4();
      sub_218988FD0();
      sub_218988FB8();
      if (v218 == v217)
        goto LABEL_121;
    }
    __break(1u);
LABEL_135:
    __break(1u);
LABEL_136:
    swift_once();
  }
  __break(1u);
LABEL_143:
  swift_bridgeObjectRetain();
  v4 = sub_2189891F8();
  swift_bridgeObjectRelease();
  v30 = (void **)(v0 + 664);
  if (v4)
    goto LABEL_75;
LABEL_144:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v274 = *(_QWORD *)(v49 + 16);
  v421 = v274 == 0;
  if (v274)
  {
    v392 = *(_QWORD *)(v0 + 720);
    v398 = *(_QWORD *)(v0 + 832);
    v388 = *(_QWORD *)(v0 + 696) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects;
    swift_bridgeObjectRetain();
    v275 = (_QWORD *)(v49 + 48);
    while (1)
    {
      v282 = *(_QWORD *)(v0 + 1016);
      v283 = *(v275 - 1);
      v284 = *v275;
      v285 = (id)*(v275 - 2);
      swift_bridgeObjectRetain();
      sub_21896EEBC(v282);
      v62 = v390;
      v286 = *(_QWORD *)(v0 + 1048);
      if (v390)
        break;
      v413 = v275;
      v418 = v285;
      v287 = *(_QWORD *)(v0 + 1040);
      v288 = *(_QWORD *)(v0 + 976);
      v289 = *(_QWORD *)(v0 + 944);
      v290 = (uint64_t *)(*(_QWORD *)(v0 + 696) + *(_QWORD *)(v0 + 1112));
      (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 1000) + 16))(v288, *(_QWORD *)(v0 + 1016), *(_QWORD *)(v0 + 992));
      v291 = (_QWORD *)(v288 + *(int *)(v289 + 20));
      *v291 = v287;
      v291[1] = v286;
      swift_beginAccess();
      v292 = *v290;
      v293 = *(_QWORD *)(*v290 + 16);
      swift_bridgeObjectRetain();
      if (v293 && (v294 = sub_218974978(*(_QWORD *)(v0 + 976)), (v295 & 1) != 0))
      {
        v383 = *(id *)(v0 + 976);
        v296 = *(_QWORD *)(v0 + 968);
        v374 = *(_QWORD *)(v0 + 872);
        v297 = *(_QWORD *)(v0 + 864);
        v298 = *(_QWORD *)(v0 + 856);
        v406 = *(_QWORD *)(v0 + 848);
        v378 = *(_QWORD *)(v0 + 800);
        v380 = *(_QWORD *)(v0 + 792);
        v299 = (uint64_t *)(*(_QWORD *)(v0 + 696) + *(_QWORD *)(v0 + 1112));
        sub_21897F33C(*(_QWORD *)(v292 + 56) + *(_QWORD *)(*(_QWORD *)(v0 + 840) + 72) * v294, v297, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        sub_21897F960(v297, v374, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        swift_endAccess();
        sub_21897F33C((uint64_t)v383, v296, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v378 + 16))(v298, v374, v380);
        sub_218988BE0();
        v300 = (_QWORD *)(v298 + *(int *)(v398 + 24));
        *v300 = v283;
        v300[1] = v284;
        swift_beginAccess();
        sub_21897F960(v298, v406, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        v301 = swift_isUniquelyReferenced_nonNull_native();
        v424[0] = *v299;
        *v299 = 0x8000000000000000;
        sub_2189772C4(v406, v296, v301);
        *v299 = v424[0];
        swift_bridgeObjectRelease();
        sub_21897F380(v296, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        swift_endAccess();
        sub_21897F380(v374, type metadata accessor for SKALocalStatusServer.FailedDelivery);
      }
      else
      {
        v302 = *(_QWORD *)(v0 + 976);
        v303 = *(_QWORD *)(v0 + 968);
        v304 = *(_QWORD *)(v0 + 856);
        v407 = *(_QWORD *)(v0 + 848);
        v305 = (uint64_t *)(*(_QWORD *)(v0 + 696) + *(_QWORD *)(v0 + 1112));
        swift_endAccess();
        sub_21897F33C(v302, v303, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        sub_218988BE0();
        sub_218988BE0();
        v306 = (_QWORD *)(v304 + *(int *)(v398 + 24));
        *v306 = v283;
        v306[1] = v284;
        swift_beginAccess();
        sub_21897F960(v304, v407, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        v307 = swift_isUniquelyReferenced_nonNull_native();
        v424[0] = *v305;
        *v305 = 0x8000000000000000;
        sub_2189772C4(v407, v303, v307);
        *v305 = v424[0];
        swift_bridgeObjectRelease();
        sub_21897F380(v303, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        swift_endAccess();
      }
      sub_21895C0AC(*(_QWORD *)(v0 + 1016), *(_QWORD *)(v0 + 688), *(_QWORD *)(v0 + 736));
      swift_beginAccess();
      if (*(_QWORD *)(*(_QWORD *)v388 + 16) && (sub_218974A9C(*(_QWORD *)(v0 + 1016)), (v308 & 1) != 0))
      {
        swift_endAccess();
        swift_retain();
        sub_218988E38();
        swift_release();
      }
      else
      {
        swift_endAccess();
      }
      v276 = *(_QWORD *)(v0 + 1016);
      v277 = *(_QWORD *)(v0 + 1000);
      v278 = *(_QWORD *)(v0 + 992);
      v279 = *(_QWORD *)(v0 + 976);
      v280 = *(_QWORD *)(v0 + 736);
      v281 = *(_QWORD *)(v0 + 712);

      (*(void (**)(uint64_t, uint64_t))(v392 + 8))(v280, v281);
      sub_21897F380(v279, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
      (*(void (**)(uint64_t, uint64_t))(v277 + 8))(v276, v278);
      v390 = 0;
      v275 = v413 + 3;
      if (!--v274)
      {
        swift_bridgeObjectRelease();
        v390 = 0;
        goto LABEL_158;
      }
    }
    v309 = *(void **)(v0 + 1096);
    swift_bridgeObjectRelease_n();

    swift_bridgeObjectRelease();
LABEL_183:
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
LABEL_158:
  v310 = *v360;
  if ((unint64_t)*v360 >> 62)
    goto LABEL_185;
  v311 = *(_QWORD *)((v310 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v311; v311 = sub_2189891F8())
  {
    v312 = 0;
    v381 = *(_QWORD *)(v0 + 1000);
    v384 = *(_QWORD **)(v0 + 952);
    v393 = *(_QWORD *)(v0 + 840);
    v313 = *(_QWORD *)(v0 + 696) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects;
    v408 = v310 & 0xC000000000000001;
    v386 = *(_QWORD *)(v0 + 720);
    v399 = v310;
    v389 = v311;
    while (1)
    {
      v318 = v408 ? (id)MEMORY[0x219A1CED4](v312, v310) : *(id *)(v310 + 8 * v312 + 32);
      v285 = v318;
      if (__OFADD__(v312, 1))
        break;
      sub_21896EEBC(*(_QWORD *)(v0 + 1008));
      v62 = v390;
      v319 = *(_QWORD *)(v0 + 1048);
      if (v390)
      {
        v349 = *(void **)(v0 + 1096);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        goto LABEL_183;
      }
      v414 = v312 + 1;
      v419 = v285;
      v320 = (uint64_t *)v313;
      v321 = *(_QWORD *)(v0 + 1040);
      v322 = *(_QWORD *)(v0 + 960);
      v323 = *(_QWORD *)(v0 + 944);
      (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 1000) + 16))(v322, *(_QWORD *)(v0 + 1008), *(_QWORD *)(v0 + 992));
      v324 = (_QWORD *)(v322 + *(int *)(v323 + 20));
      *v324 = v321;
      v324[1] = v319;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v325 = sub_218974978(v322);
      v327 = v326;
      swift_bridgeObjectRelease();
      if ((v327 & 1) != 0)
      {
        v328 = *(_QWORD *)(v0 + 1112);
        v329 = *(_QWORD *)(v0 + 696);
        v330 = swift_isUniquelyReferenced_nonNull_native();
        v331 = *(_QWORD *)(v329 + v328);
        v424[0] = v331;
        *(_QWORD *)(v329 + v328) = 0x8000000000000000;
        if ((v330 & 1) == 0)
        {
          sub_218978030();
          v331 = v424[0];
        }
        v332 = *(_QWORD *)(v0 + 1112);
        v333 = *(_QWORD *)(v0 + 840);
        v334 = *(_QWORD *)(v0 + 704);
        v335 = *(_QWORD *)(v0 + 696);
        sub_21897F380(*(_QWORD *)(v331 + 48) + v384[9] * v325, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        sub_21897F960(*(_QWORD *)(v331 + 56) + *(_QWORD *)(v333 + 72) * v325, v334, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        sub_218976BDC(v325, v331);
        *(_QWORD *)(v335 + v332) = v331;
        swift_bridgeObjectRelease();
        v336 = 0;
      }
      else
      {
        v336 = 1;
      }
      v337 = *(_QWORD *)(v0 + 1008);
      v338 = *(_QWORD *)(v0 + 728);
      v339 = *(_QWORD *)(v0 + 704);
      v340 = *(_QWORD *)(v0 + 688);
      (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v393 + 56))(v339, v336, 1, *(_QWORD *)(v0 + 832));
      sub_21897FCD4(v339, qword_253E6E760);
      swift_endAccess();
      sub_21895C0AC(v337, v340, v338);
      v313 = (uint64_t)v320;
      swift_beginAccess();
      if (*(_QWORD *)(*v320 + 16) && (sub_218974A9C(*(_QWORD *)(v0 + 1008)), (v341 & 1) != 0))
      {
        swift_endAccess();
        swift_retain();
        sub_218988E38();
        v342 = *(_QWORD *)(sub_218988C28() + 16);
        swift_bridgeObjectRelease();
        v310 = v399;
        if (v342)
        {
          swift_release();

        }
        else
        {
          v343 = *(_QWORD *)(v0 + 1008);
          *v359 = 1;
          sub_218988E2C();
          swift_beginAccess();
          swift_bridgeObjectRetain();
          v344 = sub_218974A9C(v343);
          v346 = v345;
          swift_bridgeObjectRelease();
          if ((v346 & 1) != 0)
          {
            v347 = swift_isUniquelyReferenced_nonNull_native();
            v348 = *v320;
            v424[0] = *v320;
            *v320 = 0x8000000000000000;
            if ((v347 & 1) == 0)
            {
              sub_218977DFC((uint64_t *)&unk_253E6E888);
              v348 = v424[0];
            }
            (*(void (**)(unint64_t, _QWORD))(*(_QWORD *)(v0 + 1000) + 8))(*(_QWORD *)(v348 + 48) + *(_QWORD *)(v381 + 72) * v344, *(_QWORD *)(v0 + 992));
            sub_218976938(v344, v348);
            *v320 = v348;
            swift_bridgeObjectRelease();
          }
          swift_endAccess();
          swift_release();

          swift_release();
        }
      }
      else
      {
        swift_endAccess();

        v310 = v399;
      }
      v314 = *(_QWORD *)(v0 + 1008);
      v315 = *(_QWORD *)(v0 + 1000);
      v316 = *(_QWORD *)(v0 + 992);
      v317 = *(_QWORD *)(v0 + 960);
      (*(void (**)(_QWORD, _QWORD))(v386 + 8))(*(_QWORD *)(v0 + 728), *(_QWORD *)(v0 + 712));
      sub_21897F380(v317, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
      (*(void (**)(uint64_t, uint64_t))(v315 + 8))(v314, v316);
      v390 = 0;
      ++v312;
      if (v414 == v389)
        goto LABEL_186;
    }
    __break(1u);
LABEL_185:
    swift_bridgeObjectRetain();
  }
LABEL_186:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v350 = *(_QWORD *)(v0 + 488);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v351 = sub_218988E14();
  v352 = sub_218989078();
  if (os_log_type_enabled(v351, v352))
  {
    v353 = swift_slowAlloc();
    *(_DWORD *)v353 = 134218240;
    if (v350 >> 62)
    {
      swift_bridgeObjectRetain();
      v354 = sub_2189891F8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v354 = *(_QWORD *)((v350 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *v357 = v354;
    sub_2189890C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v353 + 12) = 2048;
    v355 = *(_QWORD *)(v400 + 16);
    swift_bridgeObjectRelease();
    *v358 = v355;
    sub_2189890C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2188DF000, v351, v352, "Send pending status END {deliveredStatuses.count: %ld, failedStatuses.count: %ld}", (uint8_t *)v353, 0x16u);
    MEMORY[0x219A1D978](v353, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  v356 = *(void **)(v0 + 1096);
  sub_218969F48(*(_QWORD *)(v0 + 688));

LABEL_37:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_BOOL4))(v0 + 8))(v421);
}

uint64_t sub_2189625F8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 1144) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_21896269C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = v0[142];
  v2 = v0[137];
  v3 = v0[87];
  sub_218974B58(&qword_255001728, type metadata accessor for SKALocalStatusServer, (uint64_t)&protocol conformance descriptor for SKALocalStatusServer);
  v4 = (_QWORD *)swift_task_alloc();
  v0[144] = v4;
  v4[2] = v3;
  v4[3] = v1;
  v4[4] = v2;
  v5 = (_QWORD *)swift_task_alloc();
  v0[145] = v5;
  *v5 = v0;
  v5[1] = sub_2189627A0;
  return sub_21898924C();
}

uint64_t sub_2189627A0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 1168) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_218962860()
{
  unint64_t i;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  const void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  id v49;
  id v50;
  BOOL v51;
  unint64_t v52;
  void *v53;
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
  id v65;
  unint64_t v66;
  id v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  id v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  BOOL v83;
  unint64_t v84;
  unint64_t v85;
  _QWORD *v86;
  BOOL v87;
  uint64_t v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  uint64_t v96;
  id v97;
  void *v98;
  unsigned int v99;
  void *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  id v107;
  uint64_t v108;
  void *v109;
  unint64_t v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  unint64_t v122;
  uint64_t v123;
  void *v124;
  id v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t *v131;
  _QWORD *v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  char v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  char v151;
  void (*v152)(uint64_t, uint64_t);
  id v153;
  NSObject *v154;
  os_log_type_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  NSObject *v171;
  os_log_type_t v172;
  _BOOL4 v173;
  void *v174;
  void *v175;
  uint64_t v176;
  _QWORD *v177;
  id v178;
  uint64_t v179;
  unint64_t v180;
  unint64_t v181;
  id v182;
  uint64_t v183;
  id v184;
  _QWORD *v185;
  void *v186;
  id v187;
  uint64_t v188;
  unint64_t v189;
  char v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v195;
  unint64_t v196;
  unint64_t v197;
  uint64_t v198;
  _QWORD *v199;
  _QWORD *v200;
  void *v201;
  id v202;
  void *v203;
  void *v204;
  id v205;
  id v206;
  id v207;
  id v208;
  NSObject *v209;
  os_log_type_t v210;
  _BOOL4 v211;
  uint64_t v212;
  void *v213;
  uint64_t v214;
  _QWORD *v215;
  id v216;
  id v217;
  uint64_t v218;
  unint64_t v219;
  _QWORD *v220;
  void *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  _QWORD *v225;
  _QWORD *v226;
  void *v228;
  id v229;
  uint64_t v230;
  uint64_t *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  id v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t *v250;
  _QWORD *v251;
  uint64_t v252;
  uint64_t v253;
  unint64_t v254;
  char v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t *v260;
  _QWORD *v261;
  char v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t *v267;
  _QWORD *v268;
  char v269;
  char v270;
  void *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  id v279;
  void *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  _QWORD *v285;
  unint64_t v286;
  char v287;
  char v288;
  uint64_t v289;
  uint64_t v290;
  char v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  char v302;
  uint64_t v303;
  uint64_t v304;
  unint64_t v305;
  char v306;
  char v307;
  char v308;
  uint64_t v309;
  void *v310;
  id v311;
  id v312;
  id v313;
  id v314;
  NSObject *v315;
  os_log_type_t v316;
  _BOOL4 v317;
  void *v318;
  uint64_t v319;
  _QWORD *v320;
  void *v321;
  id v322;
  id v323;
  uint64_t v324;
  unint64_t v325;
  unint64_t v326;
  NSObject *v327;
  os_log_type_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  void *v332;
  _QWORD *v333;
  _OWORD *v334;
  uint64_t *v335;
  uint64_t *v336;
  unint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  _BOOL4 v346;
  unint64_t v347;
  uint64_t v348;
  uint64_t v349;
  os_log_type_t type[8];
  os_log_type_t typea[8];
  unint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  _QWORD *v356;
  _QWORD *v357;
  id v358;
  id v359;
  id v360;
  int *v361;
  void (**v362)(uint64_t, uint64_t, uint64_t, _QWORD);
  uint64_t v363;
  unint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  id v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  unint64_t v372;
  uint64_t v373;
  uint64_t v374;
  unint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  NSObject *v380;
  uint64_t v381;
  void *v382;
  uint64_t v383;
  _QWORD *v384;
  void *v385;
  unint64_t v386;
  uint64_t v387;
  uint64_t v388;
  unint64_t v389;
  uint64_t v390;
  uint64_t v391;
  NSObject *v392;
  uint64_t v393;
  uint64_t v394;
  unint64_t v395;
  uint64_t v396;
  uint64_t v397[11];

  v397[9] = *MEMORY[0x24BDAC8D0];
  v1 = i + 488;
  v2 = *(void **)(i + 1136);
  v3 = *(id *)(i + 664);
  v4 = v2;
  v5 = v3;
  v6 = v4;
  v7 = sub_218988E14();
  v8 = sub_218989078();
  v395 = i;
  if (os_log_type_enabled(v7, v8))
  {
    v9 = *(void **)(i + 1136);
    v10 = *(void **)(i + 664);
    v11 = swift_slowAlloc();
    v384 = (_QWORD *)swift_slowAlloc();
    v388 = swift_slowAlloc();
    v397[0] = v388;
    *(_DWORD *)v11 = 136315394;
    v12 = objc_msgSend(v9, sel_identifier);
    v13 = sub_218988F28();
    v15 = v14;

    *(_QWORD *)(i + 560) = sub_218974338(v13, v15, v397);
    sub_2189890C0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2112;
    *(_QWORD *)(i + 568) = v10;
    v16 = v10;
    v1 = i + 488;
    sub_2189890C0();
    *v384 = v10;

    _os_log_impl(&dword_2188DF000, v7, v8, "Status send END {status: %s, device: %@}", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
    swift_arrayDestroy();
    MEMORY[0x219A1D978](v384, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x219A1D978](v388, -1, -1);
    MEMORY[0x219A1D978](v11, -1, -1);

  }
  else
  {
    v17 = *(void **)(i + 1136);
    v18 = *(void **)(i + 664);

  }
  MEMORY[0x219A1CCF4]();
  if (*(_QWORD *)((*(_QWORD *)v1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)v1 & 0xFFFFFFFFFFFFFF8)
                                                                              + 0x18) >> 1)
    goto LABEL_99;
  while (1)
  {
    v336 = (uint64_t *)(i + 512);
    v19 = *(_QWORD *)(i + 1024);
    v20 = *(_QWORD *)(i + 1000);
    v21 = (uint64_t *)v1;
    v22 = *(_QWORD *)(i + 992);
    v23 = *(_QWORD *)(i + 984);
    v24 = *(_QWORD *)(v395 + 936);
    sub_218988FD0();
    v335 = v21;
    sub_218988FB8();
    v25 = v24;
    v26 = v395;
    sub_21897FCD4(v25, &qword_255001550);
    sub_21897F380(v23, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v22);
    v27 = *(void **)(v395 + 1168);
    v28 = *(_QWORD **)(v395 + 1128);
    v29 = *(_QWORD *)(v395 + 1120) + 1;
    if (v29 != *(_QWORD *)(v395 + 1080))
    {
      v334 = (_OWORD *)(v395 + 168);
      v333 = (_QWORD *)(v395 + 528);
      while (1)
      {
        v357 = v28;
        while (1)
        {
          *(_QWORD *)(v26 + 1128) = v28;
          *(_QWORD *)(v26 + 1120) = v29;
          v123 = *(_QWORD *)(v26 + 1024);
          v124 = *(void **)(*(_QWORD *)(v26 + 1072) + 8 * v29 + 32);
          *(_QWORD *)(v26 + 1136) = v124;
          v125 = v124;
          v126 = v27;
          sub_21896EEBC(v123);
          if (v27)
            break;
          v127 = *(_QWORD *)(v26 + 1048);
          v128 = *(_QWORD *)(v26 + 1040);
          v129 = *(_QWORD *)(v26 + 984);
          v130 = *(_QWORD *)(v26 + 944);
          v131 = (uint64_t *)(*(_QWORD *)(v26 + 696) + *(_QWORD *)(v26 + 1112));
          (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v26 + 1000) + 16))(v129, *(_QWORD *)(v26 + 1024), *(_QWORD *)(v26 + 992));
          v132 = (_QWORD *)(v129 + *(int *)(v130 + 20));
          *v132 = v128;
          v132[1] = v127;
          swift_beginAccess();
          v133 = *v131;
          v134 = *(_QWORD *)(*v131 + 16);
          swift_bridgeObjectRetain();
          if (v134 && (v135 = sub_218974978(*(_QWORD *)(v26 + 984)), (v136 & 1) != 0))
          {
            v391 = *(_QWORD *)(v26 + 936);
            v137 = *(_QWORD *)(v26 + 928);
            v138 = *(_QWORD *)(v26 + 888);
            v139 = *(_QWORD *)(v395 + 880);
            v140 = *(_QWORD *)(v395 + 800);
            v141 = *(_QWORD *)(v395 + 792);
            sub_21897F33C(*(_QWORD *)(v133 + 56) + *(_QWORD *)(*(_QWORD *)(v395 + 840) + 72) * v135, v139, type metadata accessor for SKALocalStatusServer.FailedDelivery);
            sub_21897F960(v139, v138, type metadata accessor for SKALocalStatusServer.FailedDelivery);
            swift_endAccess();
            sub_218988B98();
            v26 = v395;
            sub_218988BA4();
            sub_21897F380(v138, type metadata accessor for SKALocalStatusServer.FailedDelivery);
            (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v140 + 56))(v137, 0, 1, v141);
            sub_21897FC00(v137, v391, &qword_255001550);
          }
          else
          {
            v142 = *(_QWORD *)(v26 + 936);
            v143 = *(_QWORD *)(v26 + 800);
            v144 = *(_QWORD *)(v26 + 792);
            swift_endAccess();
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v143 + 56))(v142, 1, 1, v144);
          }
          v145 = *(_QWORD *)(v26 + 920);
          v146 = *(_QWORD *)(v26 + 800);
          v147 = *(_QWORD *)(v26 + 792);
          sub_218980220(*(_QWORD *)(v26 + 936), v145, &qword_255001550);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v146 + 48))(v145, 1, v147) == 1)
          {
            sub_21897FCD4(*(_QWORD *)(v26 + 920), &qword_255001550);
LABEL_90:
            v204 = *(void **)(v26 + 664);
            sub_218980220(*(_QWORD *)(v26 + 936), *(_QWORD *)(v26 + 912), &qword_255001550);
            v205 = v204;
            v206 = v125;
            v207 = v205;
            v208 = v206;
            v209 = sub_218988E14();
            v210 = sub_218989078();
            v211 = os_log_type_enabled(v209, v210);
            v212 = *(_QWORD *)(v26 + 912);
            if (v211)
            {
              v381 = *(_QWORD *)(v26 + 904);
              v213 = *(void **)(v26 + 664);
              v214 = swift_slowAlloc();
              v215 = (_QWORD *)swift_slowAlloc();
              v394 = swift_slowAlloc();
              v397[0] = v394;
              *(_DWORD *)v214 = 138412802;
              *(_QWORD *)(v395 + 576) = v208;
              v216 = v208;
              sub_2189890C0();
              *v215 = v208;

              *(_WORD *)(v214 + 12) = 2112;
              *(_QWORD *)(v395 + 584) = v213;
              v217 = v213;
              sub_2189890C0();
              v215[1] = v213;

              *(_WORD *)(v214 + 22) = 2080;
              sub_218980220(v212, v381, &qword_255001550);
              v218 = sub_218988F34();
              *(_QWORD *)(v395 + 592) = sub_218974338(v218, v219, v397);
              sub_2189890C0();
              swift_bridgeObjectRelease();
              sub_21897FCD4(v212, &qword_255001550);
              _os_log_impl(&dword_2188DF000, v209, v210, "Status send START {status: %@, device: %@, nextAttemptDate: %s}", (uint8_t *)v214, 0x20u);
              __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
              swift_arrayDestroy();
              v220 = v215;
              v26 = v395;
              MEMORY[0x219A1D978](v220, -1, -1);
              swift_arrayDestroy();
              MEMORY[0x219A1D978](v394, -1, -1);
              MEMORY[0x219A1D978](v214, -1, -1);
            }
            else
            {
              v221 = *(void **)(v26 + 664);

              sub_21897FCD4(v212, &qword_255001550);
            }

            v222 = *(_QWORD *)(v26 + 1136);
            v223 = *(_QWORD *)(v26 + 1096);
            v224 = *(_QWORD *)(v26 + 696);
            sub_218974B58(&qword_255001728, type metadata accessor for SKALocalStatusServer, (uint64_t)&protocol conformance descriptor for SKALocalStatusServer);
            v225 = (_QWORD *)swift_task_alloc();
            *(_QWORD *)(v26 + 1152) = v225;
            v225[2] = v224;
            v225[3] = v222;
            v225[4] = v223;
            v226 = (_QWORD *)swift_task_alloc();
            *(_QWORD *)(v26 + 1160) = v226;
            *v226 = v26;
            v226[1] = sub_2189627A0;
            return sub_21898924C();
          }
          v148 = *(_QWORD *)(v26 + 816);
          v149 = *(_QWORD *)(v26 + 800);
          v150 = *(_QWORD *)(v26 + 792);
          (*(void (**)(_QWORD, _QWORD, uint64_t))(v149 + 32))(*(_QWORD *)(v26 + 824), *(_QWORD *)(v26 + 920), v150);
          sub_218988BE0();
          v151 = sub_218988BBC();
          v152 = *(void (**)(uint64_t, uint64_t))(v149 + 8);
          v152(v148, v150);
          if ((v151 & 1) == 0)
          {
            v152(*(_QWORD *)(v26 + 824), *(_QWORD *)(v26 + 792));
            goto LABEL_90;
          }
          (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v26 + 800) + 16))(*(_QWORD *)(v26 + 808), *(_QWORD *)(v26 + 824), *(_QWORD *)(v26 + 792));
          swift_bridgeObjectRetain_n();
          v153 = v125;
          v154 = sub_218988E14();
          v155 = sub_218989078();
          v392 = v154;
          if (os_log_type_enabled(v154, v155))
          {
            v378 = *(_QWORD *)(v26 + 1024);
            v369 = *(_QWORD *)(v26 + 1000);
            v373 = *(_QWORD *)(v26 + 992);
            v360 = *(id *)(v26 + 936);
            v365 = *(_QWORD *)(v26 + 984);
            v353 = *(_QWORD *)(v26 + 824);
            v102 = *(_QWORD *)(v26 + 808);
            v103 = *(_QWORD *)(v26 + 792);
            v104 = swift_slowAlloc();
            v348 = swift_slowAlloc();
            v397[0] = v348;
            *(_DWORD *)v104 = 136315650;
            sub_218974B58(&qword_255001790, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
            v345 = v103;
            v105 = sub_218989234();
            *(_QWORD *)(v395 + 600) = sub_218974338(v105, v106, v397);
            sub_2189890C0();
            swift_bridgeObjectRelease();
            v152(v102, v103);
            *(_WORD *)(v104 + 12) = 2080;
            v107 = objc_msgSend(v153, sel_identifier);
            v108 = sub_218988F28();
            v109 = v153;
            v111 = v110;

            *(_QWORD *)(v395 + 608) = sub_218974338(v108, v111, v397);
            sub_2189890C0();

            swift_bridgeObjectRelease();
            *(_WORD *)(v104 + 22) = 2080;
            swift_bridgeObjectRetain();
            v112 = sub_21897BF64(8);
            v114 = v113;
            v116 = v115;
            v118 = v117;
            swift_bridgeObjectRelease();
            v119 = v116;
            v26 = v395;
            v120 = MEMORY[0x219A1CCAC](v112, v114, v119, v118);
            v122 = v121;
            swift_bridgeObjectRelease();
            *(_QWORD *)(v395 + 616) = sub_218974338(v120, v122, v397);
            sub_2189890C0();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2188DF000, v392, v155, "Status send SKIP. Not enough time since latest failed attempt. {nextAttemptDate: %s, status.identifier: %s, idsIdentifier: %s}", (uint8_t *)v104, 0x20u);
            swift_arrayDestroy();
            MEMORY[0x219A1D978](v348, -1, -1);
            MEMORY[0x219A1D978](v104, -1, -1);

            v152(v353, v345);
            sub_21897FCD4((uint64_t)v360, &qword_255001550);
            sub_21897F380(v365, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
            (*(void (**)(uint64_t, uint64_t))(v369 + 8))(v378, v373);
          }
          else
          {
            v379 = *(_QWORD *)(v26 + 1024);
            v156 = *(_QWORD *)(v26 + 1000);
            v157 = *(_QWORD *)(v26 + 992);
            v158 = *(_QWORD *)(v26 + 984);
            v159 = *(_QWORD *)(v395 + 936);
            v160 = *(_QWORD *)(v395 + 824);
            v161 = *(_QWORD *)(v395 + 808);
            v162 = *(_QWORD *)(v395 + 792);

            swift_bridgeObjectRelease_n();
            v152(v161, v162);

            v152(v160, v162);
            v163 = v159;
            v26 = v395;
            sub_21897FCD4(v163, &qword_255001550);
            sub_21897F380(v158, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
            (*(void (**)(uint64_t, uint64_t))(v156 + 8))(v379, v157);
          }
          v27 = 0;
          v29 = *(_QWORD *)(v26 + 1120) + 1;
          v28 = v357;
          if (v29 == *(_QWORD *)(v26 + 1080))
            goto LABEL_6;
        }
        v164 = *(void **)(v26 + 1136);
        v165 = *(id *)(v26 + 664);
        v166 = v164;
        v167 = v126;
        v168 = v165;
        v169 = v166;
        v170 = v126;
        v171 = sub_218988E14();
        v172 = sub_218989060();
        v173 = os_log_type_enabled(v171, v172);
        v174 = *(void **)(v26 + 1136);
        v175 = *(void **)(v26 + 664);
        if (v173)
        {
          v176 = swift_slowAlloc();
          v177 = (_QWORD *)swift_slowAlloc();
          v393 = swift_slowAlloc();
          v397[0] = v393;
          *(_DWORD *)v176 = 136315650;
          v178 = objc_msgSend(v174, sel_identifier);
          v179 = sub_218988F28();
          v380 = v171;
          v181 = v180;

          *v336 = sub_218974338(v179, v181, v397);
          sub_2189890C0();

          swift_bridgeObjectRelease();
          *(_WORD *)(v176 + 12) = 2112;
          v182 = v126;
          v183 = _swift_stdlib_bridgeErrorToNSError();
          *(_QWORD *)(v395 + 520) = v183;
          sub_2189890C0();
          *v177 = v183;

          *(_WORD *)(v176 + 22) = 2112;
          *v333 = v175;
          v184 = v175;
          sub_2189890C0();
          v177[1] = v175;

          _os_log_impl(&dword_2188DF000, v380, v172, "Status send FAILED {status: %s, error: %@, device: %@}", (uint8_t *)v176, 0x20u);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
          swift_arrayDestroy();
          v185 = v177;
          v26 = v395;
          MEMORY[0x219A1D978](v185, -1, -1);
          swift_arrayDestroy();
          MEMORY[0x219A1D978](v393, -1, -1);
          MEMORY[0x219A1D978](v176, -1, -1);

        }
        else
        {

        }
        v186 = (void *)sub_218988B68();
        v187 = objc_msgSend(v186, sel_userInfo);
        v188 = sub_218988ED4();

        if (*(_QWORD *)(v188 + 16)
          && (v189 = sub_218974A38(0x4D726F7272457563, 0xEA00000000006773), (v190 & 1) != 0))
        {
          sub_21897F3BC(*(_QWORD *)(v188 + 56) + 32 * v189, (uint64_t)v334);
        }
        else
        {
          *v334 = 0u;
          *(_OWORD *)(v395 + 184) = 0u;
        }
        swift_bridgeObjectRelease();
        if (!*(_QWORD *)(v26 + 192))
          break;
        if (!swift_dynamicCast())
          goto LABEL_80;
        v191 = *(_QWORD *)(v26 + 416);
        v192 = *(_QWORD *)(v26 + 424);
LABEL_81:
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v195 = *(_QWORD **)(v26 + 1128);
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          v195 = sub_218974214(0, v195[2] + 1, 1, v195);
        v197 = v195[2];
        v196 = v195[3];
        if (v197 >= v196 >> 1)
          v195 = sub_218974214((_QWORD *)(v196 > 1), v197 + 1, 1, v195);
        v198 = *(_QWORD *)(v26 + 1136);
        v195[2] = v197 + 1;
        v199 = &v195[3 * v197];
        v199[4] = v198;
        v199[5] = v191;
        v199[6] = v192;
        v200 = v195;

        v28 = v200;
        v27 = 0;
        v30 = 0;
        v29 = *(_QWORD *)(v26 + 1120) + 1;
        if (v29 == *(_QWORD *)(v26 + 1080))
          goto LABEL_7;
      }
      sub_21897FCD4((uint64_t)v334, &qword_255001768);
LABEL_80:
      swift_getErrorValue();
      v191 = sub_218989288();
      v192 = v193;
      goto LABEL_81;
    }
LABEL_6:
    v30 = v27;
LABEL_7:
    v356 = v28;
    v358 = v30;
    v31 = (const void *)(v26 + 80);
    v32 = *(void **)(v26 + 1096);
    v385 = *(void **)(v26 + 1056);
    v389 = v26 + 440;
    v33 = *(_QWORD *)(v395 + 784);
    v367 = *(_QWORD *)(v395 + 776);
    v371 = *(_QWORD *)(v395 + 768);
    v34 = *(_QWORD *)(v395 + 760);
    v363 = *(_QWORD *)(v395 + 752);
    v35 = *(_QWORD *)(v395 + 744);
    v376 = *(_QWORD *)(v395 + 688);
    swift_bridgeObjectRelease();
    v36 = swift_allocObject();
    *(_QWORD *)(v36 + 16) = v32;
    *(_QWORD *)(v395 + 112) = sub_21897F32C;
    *(_QWORD *)(v395 + 120) = v36;
    *(_QWORD *)(v395 + 80) = MEMORY[0x24BDAC760];
    *(_QWORD *)(v395 + 88) = 1107296256;
    *(_QWORD *)(v395 + 96) = sub_218951B34;
    *(_QWORD *)(v395 + 104) = &block_descriptor_57;
    v37 = _Block_copy(v31);
    v38 = v32;
    sub_218988EB0();
    *(_QWORD *)(v395 + 448) = MEMORY[0x24BEE4AF8];
    sub_218974B58(&qword_255001770, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255001778);
    sub_21897FAFC((unint64_t *)&unk_255001780, &qword_255001778, MEMORY[0x24BEE12C8]);
    sub_2189890F0();
    MEMORY[0x219A1CE08](0, v33, v34, v37);
    _Block_release(v37);
    (*(void (**)(uint64_t, uint64_t))(v363 + 8))(v34, v35);
    v39 = v33;
    v40 = v395;
    (*(void (**)(uint64_t, uint64_t))(v367 + 8))(v39, v371);
    swift_release();
    *(_QWORD *)(v395 + 440) = 0;
    v41 = objc_msgSend(v385, sel_allPublishedLocalStatusDevicesInDatabaseContext_error_, v376, v389);
    v42 = *(void **)(v395 + 440);
    if (!v41)
    {
      v201 = *(void **)(v395 + 1096);
      v202 = v42;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v203 = (void *)sub_218988B74();

      swift_willThrow();
LABEL_140:
      v311 = *(id *)(v40 + 664);
      v312 = v203;
      v313 = v311;
      v314 = v203;
      v315 = sub_218988E14();
      v316 = sub_21898906C();
      v317 = os_log_type_enabled(v315, v316);
      v318 = *(void **)(v40 + 664);
      if (v317)
      {
        v319 = swift_slowAlloc();
        v320 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v319 = 138412546;
        v321 = v203;
        *(_QWORD *)(v40 + 536) = v318;
        v322 = v318;
        sub_2189890C0();
        *v320 = v318;

        *(_WORD *)(v319 + 12) = 2112;
        v323 = v203;
        v324 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)(v395 + 504) = v324;
        sub_2189890C0();
        v320[1] = v324;

        _os_log_impl(&dword_2188DF000, v315, v316, "Send pending status FAILED. Error fetching status devices {clDevice: %@, error: %@}", (uint8_t *)v319, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
        swift_arrayDestroy();
        MEMORY[0x219A1D978](v320, -1, -1);
        MEMORY[0x219A1D978](v319, -1, -1);

      }
      else
      {

      }
      v346 = 0;
      goto LABEL_152;
    }
    v43 = v41;
    i = sub_218988FA0();
    v44 = v42;

    v45 = swift_bridgeObjectRetain();
    v46 = sub_21895CE7C(v45, v395 + 432, (SEL *)&selRef_identifier);
    v368 = v358;
    swift_bridgeObjectRelease();
    v1 = sub_21897BD40(v46);
    swift_bridgeObjectRelease();
    if (i >> 62)
      break;
    v47 = *(_QWORD *)((i & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v47)
      goto LABEL_101;
LABEL_10:
    v48 = 0;
    v352 = i & 0xC000000000000001;
    v337 = i + 32;
    v340 = i & 0xFFFFFFFFFFFFFF8;
    v390 = v1 + 56;
    v347 = i;
    v342 = v47;
    while (1)
    {
      if (v352)
      {
        v49 = (id)MEMORY[0x219A1CED4](v48, i);
      }
      else
      {
        if (v48 >= *(_QWORD *)(v340 + 16))
          goto LABEL_98;
        v49 = *(id *)(v337 + 8 * v48);
      }
      v50 = v49;
      v51 = __OFADD__(v48, 1);
      v52 = v48 + 1;
      if (v51)
        goto LABEL_97;
      v364 = v52;
      v53 = *(void **)(v40 + 664);
      v54 = objc_msgSend(v49, sel_idsIdentifier);
      v55 = v50;
      v56 = sub_218988F28();
      v58 = v57;

      v59 = objc_msgSend(v53, sel_idsDeviceIdentifier);
      if (!v59)
      {

        swift_bridgeObjectRelease();
LABEL_12:
        v40 = v395;
        goto LABEL_13;
      }
      v60 = v59;
      v359 = v55;
      v61 = sub_218988F28();
      v63 = v62;

      if (v56 == v61 && v58 == v63)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v64 = sub_218989240();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v64 & 1) == 0)
        {

          goto LABEL_12;
        }
      }
      i = v395;
      v65 = objc_msgSend(v55, sel_pendingStatuses, v333);
      v66 = sub_218988FA0();

      swift_bridgeObjectRetain();
      sub_21897DBB0(v66, v1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v396 = *(_QWORD *)(v395 + 488);
      swift_bridgeObjectRetain();
      v67 = objc_msgSend(v55, sel_deliveredStatuses);
      v68 = sub_218988FA0();

      if (!(v68 >> 62))
      {
        v69 = *(_QWORD *)((v68 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v69)
          break;
        goto LABEL_51;
      }
      swift_bridgeObjectRetain();
      v69 = sub_2189891F8();
      swift_bridgeObjectRelease();
      if (v69)
        break;
LABEL_51:
      v89 = *(void **)(v395 + 1056);
      v387 = *(_QWORD *)(v395 + 688);
      swift_bridgeObjectRelease();
      v90 = objc_msgSend(v359, sel_idsIdentifier);
      sub_218988F28();

      v91 = objc_allocWithZone((Class)SKADatabasePublishedLocalStatusDevice);
      v92 = (void *)sub_218988F1C();
      swift_bridgeObjectRelease();
      v93 = (void *)sub_218988F94();
      swift_bridgeObjectRelease();
      v94 = (void *)sub_218988F94();
      swift_bridgeObjectRelease();
      v95 = objc_msgSend(v91, sel_initWithIDSIdentifier_pendingStatuses_deliveredStatuses_, v92, v93, v94);

      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E8B8);
      v96 = swift_allocObject();
      *(_OWORD *)(v96 + 16) = xmmword_2189901C0;
      *(_QWORD *)(v96 + 32) = v95;
      v397[0] = v96;
      sub_218988FB8();
      v97 = v95;
      v98 = (void *)sub_218988F94();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v395 + 496) = 0;
      v99 = objc_msgSend(v89, sel_createOrUpdatePublishedLocalStatusDevices_databaseContext_error_, v98, v387, v395 + 496);

      v40 = v395;
      v100 = *(void **)(v395 + 496);
      if (!v99)
      {
        v228 = *(void **)(v395 + 1096);
        v229 = v100;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v203 = (void *)sub_218988B74();

        swift_willThrow();
        goto LABEL_140;
      }
      v101 = v100;

      i = v347;
      v47 = v342;
LABEL_13:
      v48 = v364;
      if (v364 == v47)
        goto LABEL_101;
    }
    v70 = 0;
    v71 = v68;
    v72 = v68 & 0xC000000000000001;
    v377 = v71 & 0xFFFFFFFFFFFFFF8;
    v386 = v71;
    v372 = v71 + 32;
    while (1)
    {
      if (v72)
      {
        v73 = (id)MEMORY[0x219A1CED4](v70, v386);
      }
      else
      {
        if (v70 >= *(_QWORD *)(v377 + 16))
          goto LABEL_96;
        v73 = *(id *)(v372 + 8 * v70);
      }
      v74 = v73;
      v51 = __OFADD__(v70++, 1);
      if (v51)
        break;
      v75 = objc_msgSend(v73, sel_identifier);
      v76 = sub_218988F28();
      v78 = v77;

      if (*(_QWORD *)(v1 + 16)
        && (sub_2189892C4(),
            sub_218988F4C(),
            v79 = sub_2189892E8(),
            i = -1 << *(_BYTE *)(v1 + 32),
            v80 = v79 & ~i,
            ((*(_QWORD *)(v390 + ((v80 >> 3) & 0xFFFFFFFFFFFFF8)) >> v80) & 1) != 0))
      {
        v81 = *(_QWORD *)(v1 + 48);
        v82 = (_QWORD *)(v81 + 16 * v80);
        v83 = *v82 == v76 && v82[1] == v78;
        if (!v83 && (sub_218989240() & 1) == 0)
        {
          v84 = v80 + 1;
          v85 = ~i;
          for (i = v84 & ~i; ((*(_QWORD *)(v390 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v85)
          {
            v86 = (_QWORD *)(v81 + 16 * i);
            v87 = *v86 == v76 && v86[1] == v78;
            if (v87 || (sub_218989240() & 1) != 0)
              goto LABEL_27;
          }
          goto LABEL_48;
        }
LABEL_27:

        swift_bridgeObjectRelease();
        if (v70 == v69)
          goto LABEL_51;
      }
      else
      {
LABEL_48:
        v88 = swift_bridgeObjectRelease();
        MEMORY[0x219A1CCF4](v88);
        if (*(_QWORD *)((v396 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v396 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_218988FC4();
        sub_218988FD0();
        sub_218988FB8();
        if (v70 == v69)
          goto LABEL_51;
      }
    }
    __break(1u);
LABEL_96:
    __break(1u);
LABEL_97:
    __break(1u);
LABEL_98:
    __break(1u);
LABEL_99:
    sub_218988FC4();
  }
  swift_bridgeObjectRetain();
  v47 = sub_2189891F8();
  swift_bridgeObjectRelease();
  if (v47)
    goto LABEL_10;
LABEL_101:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v230 = v356[2];
  v346 = v230 == 0;
  if (v230)
  {
    v361 = *(int **)(v40 + 832);
    *(_QWORD *)type = *(_QWORD *)(v40 + 696) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects;
    v354 = *(_QWORD *)(v40 + 720);
    v231 = (uint64_t *)(swift_bridgeObjectRetain() + 48);
    do
    {
      v239 = *(_QWORD *)(v40 + 1016);
      v240 = *(v231 - 1);
      v241 = *v231;
      v242 = (id)*(v231 - 2);
      swift_bridgeObjectRetain();
      sub_21896EEBC(v239);
      v203 = v368;
      v243 = *(_QWORD *)(v40 + 1048);
      if (v368)
      {
        v271 = *(void **)(v40 + 1096);
        swift_bridgeObjectRelease_n();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        goto LABEL_140;
      }
      v374 = v230;
      v382 = v242;
      v244 = *(_QWORD *)(v40 + 1040);
      v245 = *(_QWORD *)(v40 + 1016);
      v246 = *(_QWORD *)(v40 + 1000);
      v247 = *(_QWORD *)(v40 + 992);
      v248 = *(_QWORD *)(v40 + 976);
      v249 = *(_QWORD *)(v40 + 944);
      v250 = (uint64_t *)(*(_QWORD *)(v40 + 696) + *(_QWORD *)(v40 + 1112));
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v246 + 16))(v248, v245, v247);
      v251 = (_QWORD *)(v248 + *(int *)(v249 + 20));
      *v251 = v244;
      v251[1] = v243;
      swift_beginAccess();
      v252 = *v250;
      v253 = *(_QWORD *)(*v250 + 16);
      swift_bridgeObjectRetain();
      if (v253 && (v254 = sub_218974978(*(_QWORD *)(v395 + 976)), (v255 & 1) != 0))
      {
        v338 = *(_QWORD *)(v395 + 968);
        v256 = *(_QWORD *)(v395 + 872);
        v257 = *(_QWORD *)(v395 + 864);
        v258 = *(_QWORD *)(v395 + 856);
        v370 = *(_QWORD *)(v395 + 848);
        v343 = *(_QWORD *)(v395 + 976);
        v259 = *(_QWORD *)(v395 + 800);
        v341 = *(_QWORD *)(v395 + 792);
        v260 = (uint64_t *)(*(_QWORD *)(v395 + 696) + *(_QWORD *)(v395 + 1112));
        sub_21897F33C(*(_QWORD *)(v252 + 56) + *(_QWORD *)(*(_QWORD *)(v395 + 840) + 72) * v254, v257, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        sub_21897F960(v257, v256, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        swift_endAccess();
        sub_21897F33C(v343, v338, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v259 + 16))(v258, v256, v341);
        sub_218988BE0();
        v261 = (_QWORD *)(v258 + v361[6]);
        *v261 = v240;
        v261[1] = v241;
        swift_beginAccess();
        sub_21897F960(v258, v370, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        v262 = swift_isUniquelyReferenced_nonNull_native();
        v397[0] = *v260;
        *v260 = 0x8000000000000000;
        sub_2189772C4(v370, v338, v262);
        *v260 = v397[0];
        swift_bridgeObjectRelease();
        sub_21897F380(v338, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        swift_endAccess();
        sub_21897F380(v256, type metadata accessor for SKALocalStatusServer.FailedDelivery);
      }
      else
      {
        v263 = *(_QWORD *)(v395 + 976);
        v264 = *(_QWORD *)(v395 + 968);
        v265 = *(_QWORD *)(v395 + 856);
        v266 = *(_QWORD *)(v395 + 848);
        v267 = (uint64_t *)(*(_QWORD *)(v395 + 696) + *(_QWORD *)(v395 + 1112));
        swift_endAccess();
        sub_21897F33C(v263, v264, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        sub_218988BE0();
        sub_218988BE0();
        v268 = (_QWORD *)(v265 + v361[6]);
        *v268 = v240;
        v268[1] = v241;
        swift_beginAccess();
        sub_21897F960(v265, v266, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        v269 = swift_isUniquelyReferenced_nonNull_native();
        v397[0] = *v267;
        *v267 = 0x8000000000000000;
        sub_2189772C4(v266, v264, v269);
        *v267 = v397[0];
        swift_bridgeObjectRelease();
        sub_21897F380(v264, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        swift_endAccess();
      }
      sub_21895C0AC(*(_QWORD *)(v395 + 1016), *(_QWORD *)(v395 + 688), *(_QWORD *)(v395 + 736));
      swift_beginAccess();
      if (*(_QWORD *)(**(_QWORD **)type + 16) && (sub_218974A9C(*(_QWORD *)(v395 + 1016)), (v270 & 1) != 0))
      {
        swift_endAccess();
        swift_retain();
        sub_218988E38();
        swift_release();
      }
      else
      {
        swift_endAccess();
      }
      v232 = *(_QWORD *)(v395 + 1016);
      v233 = *(_QWORD *)(v395 + 1000);
      v234 = *(_QWORD *)(v395 + 992);
      v235 = *(_QWORD *)(v395 + 976);
      v236 = *(_QWORD *)(v395 + 736);
      v237 = *(_QWORD *)(v395 + 712);

      v238 = v237;
      v40 = v395;
      (*(void (**)(uint64_t, uint64_t))(v354 + 8))(v236, v238);
      sub_21897F380(v235, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
      (*(void (**)(uint64_t, uint64_t))(v233 + 8))(v232, v234);
      v368 = 0;
      v231 += 3;
      v230 = v374 - 1;
    }
    while (v374 != 1);
    swift_bridgeObjectRelease();
    v368 = 0;
  }
  v272 = *v335;
  if ((unint64_t)*v335 >> 62)
    goto LABEL_145;
  v273 = *(_QWORD *)((v272 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v273; v273 = sub_2189891F8())
  {
    v274 = 0;
    v339 = *(_QWORD *)(v395 + 1000);
    v344 = *(_QWORD *)(v395 + 952);
    v362 = *(void (***)(uint64_t, uint64_t, uint64_t, _QWORD))(v395 + 840);
    *(_QWORD *)typea = *(_QWORD *)(v395 + 696) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects;
    v375 = v272 & 0xC000000000000001;
    v349 = *(_QWORD *)(v395 + 720);
    v366 = v272;
    v355 = v273;
    while (1)
    {
      v279 = v375 ? (id)MEMORY[0x219A1CED4](v274, v272) : *(id *)(v272 + 8 * v274 + 32);
      v280 = v279;
      if (__OFADD__(v274, 1))
        break;
      sub_21896EEBC(*(_QWORD *)(v395 + 1008));
      v203 = v368;
      v281 = *(_QWORD *)(v395 + 1048);
      if (v368)
      {
        v310 = *(void **)(v395 + 1096);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v40 = v395;
        goto LABEL_140;
      }
      v282 = *(_QWORD *)(v395 + 1040);
      v283 = *(_QWORD *)(v395 + 960);
      v284 = *(_QWORD *)(v395 + 944);
      (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v395 + 1000) + 16))(v283, *(_QWORD *)(v395 + 1008), *(_QWORD *)(v395 + 992));
      v285 = (_QWORD *)(v283 + *(int *)(v284 + 20));
      *v285 = v282;
      v285[1] = v281;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v286 = sub_218974978(v283);
      v288 = v287;
      swift_bridgeObjectRelease();
      v383 = v274 + 1;
      if ((v288 & 1) != 0)
      {
        v289 = *(_QWORD *)(v395 + 1112);
        v290 = *(_QWORD *)(v395 + 696);
        v291 = swift_isUniquelyReferenced_nonNull_native();
        v292 = *(_QWORD *)(v290 + v289);
        v397[0] = v292;
        *(_QWORD *)(v290 + v289) = 0x8000000000000000;
        if ((v291 & 1) == 0)
        {
          sub_218978030();
          v292 = v397[0];
        }
        v293 = *(_QWORD *)(v395 + 1112);
        v294 = *(_QWORD *)(v395 + 840);
        v295 = *(_QWORD *)(v395 + 704);
        v296 = *(_QWORD *)(v395 + 696);
        sub_21897F380(*(_QWORD *)(v292 + 48) + *(_QWORD *)(v344 + 72) * v286, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        sub_21897F960(*(_QWORD *)(v292 + 56) + *(_QWORD *)(v294 + 72) * v286, v295, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        sub_218976BDC(v286, v292);
        *(_QWORD *)(v296 + v293) = v292;
        swift_bridgeObjectRelease();
        v297 = 0;
      }
      else
      {
        v297 = 1;
      }
      v298 = *(_QWORD *)(v395 + 1008);
      v299 = *(_QWORD *)(v395 + 728);
      v300 = *(_QWORD *)(v395 + 704);
      v301 = *(_QWORD *)(v395 + 688);
      v362[7](v300, v297, 1, *(_QWORD *)(v395 + 832));
      sub_21897FCD4(v300, qword_253E6E760);
      swift_endAccess();
      sub_21895C0AC(v298, v301, v299);
      swift_beginAccess();
      if (*(_QWORD *)(**(_QWORD **)typea + 16) && (sub_218974A9C(*(_QWORD *)(v395 + 1008)), (v302 & 1) != 0))
      {
        swift_endAccess();
        swift_retain();
        sub_218988E38();
        v303 = *(_QWORD *)(sub_218988C28() + 16);
        swift_bridgeObjectRelease();
        if (v303)
        {
          swift_release();

        }
        else
        {
          v304 = *(_QWORD *)(v395 + 1008);
          *(_BYTE *)(v395 + 1176) = 1;
          sub_218988E2C();
          swift_beginAccess();
          swift_bridgeObjectRetain();
          v305 = sub_218974A9C(v304);
          v307 = v306;
          swift_bridgeObjectRelease();
          if ((v307 & 1) != 0)
          {
            v308 = swift_isUniquelyReferenced_nonNull_native();
            v309 = **(_QWORD **)typea;
            v397[0] = **(_QWORD **)typea;
            **(_QWORD **)typea = 0x8000000000000000;
            if ((v308 & 1) == 0)
            {
              sub_218977DFC((uint64_t *)&unk_253E6E888);
              v309 = v397[0];
            }
            (*(void (**)(unint64_t, _QWORD))(*(_QWORD *)(v395 + 1000) + 8))(*(_QWORD *)(v309 + 48) + *(_QWORD *)(v339 + 72) * v305, *(_QWORD *)(v395 + 992));
            sub_218976938(v305, v309);
            **(_QWORD **)typea = v309;
            swift_bridgeObjectRelease();
          }
          swift_endAccess();
          swift_release();

          swift_release();
        }
      }
      else
      {
        swift_endAccess();

      }
      v275 = *(_QWORD *)(v395 + 1008);
      v276 = *(_QWORD *)(v395 + 1000);
      v277 = *(_QWORD *)(v395 + 992);
      v278 = *(_QWORD *)(v395 + 960);
      (*(void (**)(_QWORD, _QWORD))(v349 + 8))(*(_QWORD *)(v395 + 728), *(_QWORD *)(v395 + 712));
      sub_21897F380(v278, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
      (*(void (**)(uint64_t, uint64_t))(v276 + 8))(v275, v277);
      v368 = 0;
      ++v274;
      v272 = v366;
      if (v383 == v355)
        goto LABEL_146;
    }
    __break(1u);
LABEL_145:
    swift_bridgeObjectRetain();
  }
LABEL_146:
  v325 = v395;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v326 = *(_QWORD *)(v395 + 488);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v327 = sub_218988E14();
  v328 = sub_218989078();
  if (os_log_type_enabled(v327, v328))
  {
    v329 = swift_slowAlloc();
    *(_DWORD *)v329 = 134218240;
    if (v326 >> 62)
    {
      swift_bridgeObjectRetain();
      v330 = sub_2189891F8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v330 = *(_QWORD *)((v326 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(_QWORD *)(v395 + 456) = v330;
    v325 = v395;
    sub_2189890C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v329 + 12) = 2048;
    v331 = v356[2];
    swift_bridgeObjectRelease();
    *(_QWORD *)(v395 + 464) = v331;
    sub_2189890C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2188DF000, v327, v328, "Send pending status END {deliveredStatuses.count: %ld, failedStatuses.count: %ld}", (uint8_t *)v329, 0x16u);
    MEMORY[0x219A1D978](v329, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  v332 = *(void **)(v325 + 1096);
  sub_218969F48(*(_QWORD *)(v325 + 688));

LABEL_152:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_BOOL4))(v395 + 8))(v346);
}

uint64_t sub_2189651C8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD *v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  _QWORD *v29;
  void *v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  id v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  void (*v93)(uint64_t, uint64_t);
  id v94;
  NSObject *v95;
  os_log_type_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  void *v116;
  void *v117;
  unint64_t v118;
  id v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  id v125;
  id v126;
  BOOL v127;
  unint64_t v128;
  void *v129;
  id v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  id v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char v140;
  id v141;
  unint64_t v142;
  id v143;
  unint64_t v144;
  unint64_t v145;
  unint64_t v146;
  id v147;
  void *v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  unint64_t v155;
  uint64_t v156;
  _QWORD *v157;
  BOOL v158;
  uint64_t v159;
  _QWORD *v160;
  BOOL v161;
  uint64_t v162;
  id v163;
  id v164;
  void *v165;
  void *v166;
  void *v167;
  id v168;
  uint64_t v169;
  id v170;
  void *v171;
  unsigned int v172;
  void *v173;
  id v174;
  void *v175;
  id v176;
  id v177;
  id v178;
  id v179;
  NSObject *v180;
  os_log_type_t v181;
  _BOOL4 v182;
  uint64_t v183;
  void *v184;
  uint64_t v185;
  _QWORD *v186;
  id v187;
  id v188;
  uint64_t v189;
  unint64_t v190;
  _QWORD *v191;
  void *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  _QWORD *v196;
  _QWORD *v197;
  void *v199;
  id v200;
  void *v201;
  id v202;
  uint64_t v203;
  uint64_t *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  id v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t *v220;
  _QWORD *v221;
  uint64_t v222;
  uint64_t v223;
  unint64_t v224;
  char v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t *v229;
  _QWORD *v230;
  char v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t *v236;
  _QWORD *v237;
  char v238;
  char v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  id v248;
  id v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  _QWORD *v257;
  uint64_t v258;
  _QWORD *v259;
  unint64_t v260;
  char v261;
  uint64_t v262;
  uint64_t v263;
  char v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  char v275;
  uint64_t v276;
  uint64_t v277;
  unint64_t v278;
  char v279;
  char v280;
  char v281;
  uint64_t v282;
  id v283;
  id v284;
  id v285;
  id v286;
  NSObject *v287;
  os_log_type_t v288;
  _BOOL4 v289;
  void *v290;
  uint64_t v291;
  _QWORD *v292;
  id v293;
  id v294;
  uint64_t v295;
  unint64_t v296;
  NSObject *v297;
  os_log_type_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  void *v302;
  _BYTE *v303;
  uint64_t *v304;
  uint64_t v305;
  void *aBlock;
  uint64_t v307;
  NSObject **v308;
  uint64_t *v309;
  uint64_t *v310;
  uint64_t v311;
  _OWORD *v312;
  unint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  unint64_t v321;
  uint64_t v322;
  uint64_t v323;
  os_log_type_t typea;
  uint64_t typeb;
  os_log_type_t type[8];
  uint64_t v327;
  unint64_t v328;
  _BOOL4 v329;
  uint64_t v330;
  void *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  unint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  unint64_t v341;
  uint64_t v342;
  uint64_t v343;
  NSObject *v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  void *v349;
  uint64_t v350;
  unint64_t v351;
  os_log_type_t v352;
  _QWORD *v353;
  uint64_t v354;
  uint64_t v355;
  unint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  NSObject *v362;
  void *v363;
  uint64_t v364;
  uint64_t v365;
  void *v366;
  void *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370[11];

  v1 = (_QWORD *)v0;
  aBlock = (void *)(v0 + 80);
  v312 = (_OWORD *)(v0 + 168);
  v370[9] = *MEMORY[0x24BDAC8D0];
  v305 = v0 + 432;
  v307 = v0 + 440;
  v311 = v0 + 496;
  v304 = (uint64_t *)(v0 + 488);
  v2 = *(_QWORD *)(v0 + 1024);
  v308 = (NSObject **)(v0 + 528);
  v309 = (uint64_t *)(v0 + 520);
  v310 = (uint64_t *)(v0 + 512);
  v3 = *(_QWORD *)(v0 + 1000);
  v4 = v1[124];
  v5 = v1[123];
  v6 = v1[117];
  v303 = v1 + 147;
  swift_task_dealloc();
  sub_21897FCD4(v6, &qword_255001550);
  sub_21897F380(v5, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v7 = (void *)v1[146];
  v368 = (uint64_t)v1;
  v8 = (void *)v1[142];
  v9 = (id)v1[83];
  v10 = v8;
  v11 = v7;
  v12 = v9;
  v13 = v10;
  v14 = v7;
  v15 = sub_218988E14();
  v16 = sub_218989060();
  v17 = os_log_type_enabled(v15, v16);
  v18 = (void *)v1[142];
  v19 = v1[83];
  if (v17)
  {
    v352 = v16;
    v20 = swift_slowAlloc();
    v21 = (_QWORD *)swift_slowAlloc();
    v360 = swift_slowAlloc();
    v370[0] = v360;
    *(_DWORD *)v20 = 136315650;
    v22 = objc_msgSend(v18, sel_identifier);
    v23 = sub_218988F28();
    v344 = v15;
    v25 = v24;

    *v310 = sub_218974338(v23, v25, v370);
    sub_2189890C0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2112;
    v26 = v7;
    v27 = _swift_stdlib_bridgeErrorToNSError();
    *v309 = v27;
    sub_2189890C0();
    *v21 = v27;

    *(_WORD *)(v20 + 22) = 2112;
    *v308 = v19;
    v28 = v19;
    sub_2189890C0();
    v21[1] = v19;

    v19 = v344;
    _os_log_impl(&dword_2188DF000, v344, v352, "Status send FAILED {status: %s, error: %@, device: %@}", (uint8_t *)v20, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
    swift_arrayDestroy();
    v29 = v21;
    v1 = (_QWORD *)v368;
    MEMORY[0x219A1D978](v29, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x219A1D978](v360, -1, -1);
    MEMORY[0x219A1D978](v20, -1, -1);
  }
  else
  {

  }
  v30 = (void *)sub_218988B68();
  v31 = objc_msgSend(v30, sel_userInfo);
  v32 = sub_218988ED4();

  if (*(_QWORD *)(v32 + 16) && (v33 = sub_218974A38(0x4D726F7272457563, 0xEA00000000006773), (v34 & 1) != 0))
  {
    sub_21897F3BC(*(_QWORD *)(v32 + 56) + 32 * v33, (uint64_t)v312);
  }
  else
  {
    *v312 = 0u;
    v312[1] = 0u;
  }
  swift_bridgeObjectRelease();
  if (!v1[24])
  {
    sub_21897FCD4((uint64_t)v312, &qword_255001768);
    goto LABEL_12;
  }
  if (!swift_dynamicCast())
  {
LABEL_12:
    swift_getErrorValue();
    v35 = sub_218989288();
    v36 = v37;
    goto LABEL_13;
  }
  v35 = v1[52];
  v36 = v1[53];
LABEL_13:
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v39 = (_QWORD *)v1[141];
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    v39 = sub_218974214(0, v39[2] + 1, 1, v39);
  v41 = v39[2];
  v40 = v39[3];
  if (v41 >= v40 >> 1)
    v39 = sub_218974214((_QWORD *)(v40 > 1), v41 + 1, 1, v39);
  v42 = v1[142];
  v39[2] = v41 + 1;
  v353 = v39;
  v43 = &v39[3 * v41];
  v43[4] = v42;
  v43[5] = v35;
  v43[6] = v36;

  v44 = v1[140] + 1;
  if (v44 != v1[135])
  {
    while (1)
    {
      v1[141] = v353;
      v1[140] = v44;
      v65 = v1[128];
      v66 = *(void **)(v1[134] + 8 * v44 + 32);
      v1[142] = v66;
      v67 = v66;
      sub_21896EEBC(v65);
      v68 = v1[131];
      v69 = v1[130];
      v70 = v1[123];
      v71 = v1[118];
      v72 = (uint64_t *)(v1[87] + v1[139]);
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v1[125] + 16))(v70, v1[128], v1[124]);
      v73 = (_QWORD *)(v70 + *(int *)(v71 + 20));
      *v73 = v69;
      v73[1] = v68;
      swift_beginAccess();
      v74 = *v72;
      v75 = *(_QWORD *)(*v72 + 16);
      swift_bridgeObjectRetain();
      if (v75 && (v76 = sub_218974978(v1[123]), (v77 & 1) != 0))
      {
        v361 = v1[117];
        v78 = v1[116];
        v79 = v1[111];
        v80 = *(_QWORD *)(v368 + 880);
        v81 = *(_QWORD *)(v368 + 800);
        v82 = *(_QWORD *)(v368 + 792);
        sub_21897F33C(*(_QWORD *)(v74 + 56) + *(_QWORD *)(*(_QWORD *)(v368 + 840) + 72) * v76, v80, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        sub_21897F960(v80, v79, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        swift_endAccess();
        sub_218988B98();
        v1 = (_QWORD *)v368;
        sub_218988BA4();
        sub_21897F380(v79, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v81 + 56))(v78, 0, 1, v82);
        sub_21897FC00(v78, v361, &qword_255001550);
      }
      else
      {
        v83 = v1[117];
        v84 = v1[100];
        v85 = v1[99];
        swift_endAccess();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v84 + 56))(v83, 1, 1, v85);
      }
      v86 = v1[115];
      v87 = v1[100];
      v88 = v1[99];
      sub_218980220(v1[117], v86, &qword_255001550);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v87 + 48))(v86, 1, v88) == 1)
      {
        sub_21897FCD4(v1[115], &qword_255001550);
        goto LABEL_80;
      }
      v89 = v1[102];
      v90 = v1[100];
      v91 = v1[99];
      (*(void (**)(_QWORD, _QWORD, uint64_t))(v90 + 32))(v1[103], v1[115], v91);
      sub_218988BE0();
      v92 = sub_218988BBC();
      v93 = *(void (**)(uint64_t, uint64_t))(v90 + 8);
      v93(v89, v91);
      if ((v92 & 1) == 0)
        break;
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v1[100] + 16))(v1[101], v1[103], v1[99]);
      swift_bridgeObjectRetain_n();
      v94 = v67;
      v95 = sub_218988E14();
      v96 = sub_218989078();
      v362 = v95;
      if (os_log_type_enabled(v95, v96))
      {
        v339 = v1[124];
        v345 = v1[128];
        v334 = v1[123];
        v338 = v1[125];
        v330 = v1[117];
        v327 = v1[103];
        v45 = v1[101];
        v46 = v1[99];
        typea = v96;
        v47 = v1;
        v48 = swift_slowAlloc();
        v320 = swift_slowAlloc();
        v370[0] = v320;
        *(_DWORD *)v48 = 136315650;
        sub_218974B58(&qword_255001790, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
        v317 = v46;
        v49 = sub_218989234();
        v47[75] = sub_218974338(v49, v50, v370);
        sub_2189890C0();
        swift_bridgeObjectRelease();
        v93(v45, v46);
        *(_WORD *)(v48 + 12) = 2080;
        v51 = objc_msgSend(v94, sel_identifier);
        v52 = sub_218988F28();
        v54 = v53;

        v47[76] = sub_218974338(v52, v54, v370);
        sub_2189890C0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v48 + 22) = 2080;
        swift_bridgeObjectRetain();
        v55 = sub_21897BF64(8);
        v57 = v56;
        v59 = v58;
        v61 = v60;
        swift_bridgeObjectRelease();
        v62 = MEMORY[0x219A1CCAC](v55, v57, v59, v61);
        v64 = v63;
        swift_bridgeObjectRelease();
        v47[77] = sub_218974338(v62, v64, v370);
        sub_2189890C0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2188DF000, v362, typea, "Status send SKIP. Not enough time since latest failed attempt. {nextAttemptDate: %s, status.identifier: %s, idsIdentifier: %s}", (uint8_t *)v48, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x219A1D978](v320, -1, -1);
        MEMORY[0x219A1D978](v48, -1, -1);

        v93(v327, v317);
        sub_21897FCD4(v330, &qword_255001550);
        sub_21897F380(v334, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t))(v338 + 8))(v345, v339);
      }
      else
      {
        v97 = v1[125];
        v340 = v1[124];
        v346 = v1[128];
        v98 = v1[123];
        v47 = v1;
        v99 = v1[117];
        v100 = v47[103];
        v101 = v47[101];
        v102 = v47[99];

        swift_bridgeObjectRelease_n();
        v93(v101, v102);

        v93(v100, v102);
        sub_21897FCD4(v99, &qword_255001550);
        sub_21897F380(v98, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v346, v340);
      }
      v44 = v47[140] + 1;
      v1 = v47;
      if (v44 == v47[135])
        goto LABEL_29;
    }
    v93(v1[103], v1[99]);
LABEL_80:
    v175 = (void *)v1[83];
    sub_218980220(v1[117], v1[114], &qword_255001550);
    v176 = v175;
    v177 = v67;
    v178 = v176;
    v179 = v177;
    v180 = sub_218988E14();
    v181 = sub_218989078();
    v182 = os_log_type_enabled(v180, v181);
    v183 = v1[114];
    if (v182)
    {
      v354 = v1[113];
      v184 = (void *)v1[83];
      v185 = swift_slowAlloc();
      v186 = (_QWORD *)swift_slowAlloc();
      v365 = swift_slowAlloc();
      v370[0] = v365;
      *(_DWORD *)v185 = 138412802;
      *(_QWORD *)(v368 + 576) = v179;
      v187 = v179;
      sub_2189890C0();
      *v186 = v179;

      *(_WORD *)(v185 + 12) = 2112;
      *(_QWORD *)(v368 + 584) = v184;
      v188 = v184;
      sub_2189890C0();
      v186[1] = v184;

      *(_WORD *)(v185 + 22) = 2080;
      sub_218980220(v183, v354, &qword_255001550);
      v189 = sub_218988F34();
      *(_QWORD *)(v368 + 592) = sub_218974338(v189, v190, v370);
      sub_2189890C0();
      swift_bridgeObjectRelease();
      sub_21897FCD4(v183, &qword_255001550);
      _os_log_impl(&dword_2188DF000, v180, v181, "Status send START {status: %@, device: %@, nextAttemptDate: %s}", (uint8_t *)v185, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
      swift_arrayDestroy();
      v191 = v186;
      v1 = (_QWORD *)v368;
      MEMORY[0x219A1D978](v191, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v365, -1, -1);
      MEMORY[0x219A1D978](v185, -1, -1);
    }
    else
    {
      v192 = (void *)v1[83];

      sub_21897FCD4(v183, &qword_255001550);
    }

    v193 = v1[142];
    v194 = v1[137];
    v195 = v1[87];
    sub_218974B58(&qword_255001728, type metadata accessor for SKALocalStatusServer, (uint64_t)&protocol conformance descriptor for SKALocalStatusServer);
    v196 = (_QWORD *)swift_task_alloc();
    v1[144] = v196;
    v196[2] = v195;
    v196[3] = v193;
    v196[4] = v194;
    v197 = (_QWORD *)swift_task_alloc();
    v1[145] = v197;
    *v197 = v1;
    v197[1] = sub_2189627A0;
    return sub_21898924C();
  }
LABEL_29:
  v103 = (void *)v1[137];
  v104 = (void *)v1[132];
  v105 = v1[98];
  v106 = v1[97];
  v347 = v1[96];
  v107 = *(_QWORD *)(v368 + 760);
  v108 = *(_QWORD *)(v368 + 752);
  v109 = *(_QWORD *)(v368 + 744);
  v355 = *(_QWORD *)(v368 + 688);
  v363 = v104;
  swift_bridgeObjectRelease();
  v110 = swift_allocObject();
  *(_QWORD *)(v110 + 16) = v103;
  *(_QWORD *)(v368 + 112) = sub_21897F32C;
  *(_QWORD *)(v368 + 120) = v110;
  *(_QWORD *)(v368 + 80) = MEMORY[0x24BDAC760];
  *(_QWORD *)(v368 + 88) = 1107296256;
  *(_QWORD *)(v368 + 96) = sub_218951B34;
  *(_QWORD *)(v368 + 104) = &block_descriptor_57;
  v111 = _Block_copy(aBlock);
  v112 = v103;
  sub_218988EB0();
  *(_QWORD *)(v368 + 448) = MEMORY[0x24BEE4AF8];
  sub_218974B58(&qword_255001770, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255001778);
  sub_21897FAFC((unint64_t *)&unk_255001780, &qword_255001778, MEMORY[0x24BEE12C8]);
  sub_2189890F0();
  MEMORY[0x219A1CE08](0, v105, v107, v111);
  _Block_release(v111);
  v113 = v107;
  v114 = v368;
  (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v113, v109);
  (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v105, v347);
  swift_release();
  *(_QWORD *)(v368 + 440) = 0;
  v115 = objc_msgSend(v363, sel_allPublishedLocalStatusDevicesInDatabaseContext_error_, v355, v307);
  v116 = *(void **)(v368 + 440);
  if (!v115)
  {
    v199 = *(void **)(v368 + 1096);
    v200 = v116;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v201 = (void *)sub_218988B74();

    swift_willThrow();
    goto LABEL_86;
  }
  v117 = v115;
  v118 = sub_218988FA0();
  v119 = v116;

  v120 = swift_bridgeObjectRetain();
  v121 = sub_21895CE7C(v120, v305, (SEL *)&selRef_identifier);
  swift_bridgeObjectRelease();
  v122 = sub_21897BD40(v121);
  swift_bridgeObjectRelease();
  if (v118 >> 62)
    goto LABEL_91;
  v123 = *(_QWORD *)((v118 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v123)
  {
LABEL_92:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v203 = v353[2];
    v329 = v203 == 0;
    if (v203)
    {
      v342 = *(_QWORD *)(v114 + 832);
      v332 = *(_QWORD *)(v114 + 696) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects;
      v336 = *(_QWORD *)(v114 + 720);
      v204 = (uint64_t *)(swift_bridgeObjectRetain() + 48);
      do
      {
        v211 = *(_QWORD *)(v114 + 1016);
        v212 = *(v204 - 1);
        v213 = *v204;
        v214 = (id)*(v204 - 2);
        swift_bridgeObjectRetain();
        sub_21896EEBC(v211);
        v215 = *(_QWORD *)(v114 + 1048);
        v358 = v203;
        v366 = v214;
        v216 = *(_QWORD *)(v114 + 1112);
        v217 = *(_QWORD *)(v368 + 1040);
        v218 = *(_QWORD *)(v368 + 976);
        v219 = *(_QWORD *)(v368 + 944);
        v220 = (uint64_t *)(*(_QWORD *)(v368 + 696) + v216);
        (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v368 + 1000) + 16))(v218, *(_QWORD *)(v368 + 1016), *(_QWORD *)(v368 + 992));
        v221 = (_QWORD *)(v218 + *(int *)(v219 + 20));
        *v221 = v217;
        v221[1] = v215;
        v114 = v368;
        swift_beginAccess();
        v222 = *v220;
        v223 = *(_QWORD *)(v222 + 16);
        swift_bridgeObjectRetain();
        if (v223 && (v224 = sub_218974978(*(_QWORD *)(v368 + 976)), (v225 & 1) != 0))
        {
          typeb = *(_QWORD *)(v368 + 976);
          v318 = *(_QWORD *)(v368 + 968);
          v226 = *(_QWORD *)(v368 + 872);
          v227 = *(_QWORD *)(v368 + 864);
          v228 = *(_QWORD *)(v368 + 856);
          v350 = *(_QWORD *)(v368 + 848);
          v316 = *(_QWORD *)(v368 + 800);
          v322 = *(_QWORD *)(v368 + 792);
          v229 = (uint64_t *)(*(_QWORD *)(v368 + 696) + *(_QWORD *)(v368 + 1112));
          sub_21897F33C(*(_QWORD *)(v222 + 56) + *(_QWORD *)(*(_QWORD *)(v368 + 840) + 72) * v224, v227, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          sub_21897F960(v227, v226, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          swift_endAccess();
          sub_21897F33C(typeb, v318, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v316 + 16))(v228, v226, v322);
          sub_218988BE0();
          v230 = (_QWORD *)(v228 + *(int *)(v342 + 24));
          *v230 = v212;
          v230[1] = v213;
          swift_beginAccess();
          sub_21897F960(v228, v350, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          v231 = swift_isUniquelyReferenced_nonNull_native();
          v370[0] = *v229;
          *v229 = 0x8000000000000000;
          sub_2189772C4(v350, v318, v231);
          *v229 = v370[0];
          swift_bridgeObjectRelease();
          sub_21897F380(v318, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          swift_endAccess();
          sub_21897F380(v226, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        }
        else
        {
          v232 = *(_QWORD *)(v368 + 976);
          v233 = *(_QWORD *)(v368 + 968);
          v234 = *(_QWORD *)(v368 + 856);
          v235 = *(_QWORD *)(v368 + 848);
          v236 = (uint64_t *)(*(_QWORD *)(v368 + 696) + *(_QWORD *)(v368 + 1112));
          swift_endAccess();
          sub_21897F33C(v232, v233, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          sub_218988BE0();
          sub_218988BE0();
          v237 = (_QWORD *)(v234 + *(int *)(v342 + 24));
          *v237 = v212;
          v237[1] = v213;
          swift_beginAccess();
          sub_21897F960(v234, v235, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          v238 = swift_isUniquelyReferenced_nonNull_native();
          v370[0] = *v236;
          *v236 = 0x8000000000000000;
          sub_2189772C4(v235, v233, v238);
          *v236 = v370[0];
          swift_bridgeObjectRelease();
          sub_21897F380(v233, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          swift_endAccess();
        }
        sub_21895C0AC(*(_QWORD *)(v368 + 1016), *(_QWORD *)(v368 + 688), *(_QWORD *)(v368 + 736));
        swift_beginAccess();
        if (*(_QWORD *)(*(_QWORD *)v332 + 16) && (sub_218974A9C(*(_QWORD *)(v368 + 1016)), (v239 & 1) != 0))
        {
          swift_endAccess();
          swift_retain();
          sub_218988E38();
          swift_release();
        }
        else
        {
          swift_endAccess();
        }
        v205 = *(_QWORD *)(v368 + 1016);
        v206 = *(_QWORD *)(v368 + 1000);
        v207 = *(_QWORD *)(v368 + 992);
        v208 = *(_QWORD *)(v368 + 976);
        v209 = *(_QWORD *)(v368 + 736);
        v210 = *(_QWORD *)(v368 + 712);

        (*(void (**)(uint64_t, uint64_t))(v336 + 8))(v209, v210);
        sub_21897F380(v208, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t))(v206 + 8))(v205, v207);
        v204 += 3;
        v203 = v358 - 1;
      }
      while (v358 != 1);
      swift_bridgeObjectRelease();
    }
    v240 = *v304;
    if ((unint64_t)*v304 >> 62)
      goto LABEL_132;
    v241 = *(_QWORD *)((v240 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v241; v241 = sub_2189891F8())
    {
      v242 = 0;
      v319 = *(_QWORD *)(v114 + 1000);
      v323 = *(_QWORD *)(v114 + 952);
      v359 = *(_QWORD *)(v114 + 696) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects;
      v343 = *(_QWORD *)(v114 + 840);
      v351 = v240 & 0xC000000000000001;
      *(_QWORD *)type = *(_QWORD *)(v114 + 720);
      v333 = v241;
      v337 = v240;
      while (1)
      {
        v248 = v351 ? (id)MEMORY[0x219A1CED4](v242, v240) : *(id *)(v240 + 8 * v242 + 32);
        v249 = v248;
        v250 = v242 + 1;
        if (__OFADD__(v242, 1))
          break;
        sub_21896EEBC(*(_QWORD *)(v114 + 1008));
        v251 = *(_QWORD *)(v114 + 1048);
        v367 = v249;
        v252 = *(_QWORD *)(v114 + 1040);
        v253 = *(_QWORD *)(v114 + 1008);
        v254 = *(_QWORD *)(v114 + 1000);
        v255 = *(_QWORD *)(v114 + 992);
        v256 = *(_QWORD *)(v114 + 960);
        v257 = (_QWORD *)v114;
        v258 = *(_QWORD *)(v114 + 944);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v254 + 16))(v256, v253, v255);
        v259 = (_QWORD *)(v256 + *(int *)(v258 + 20));
        *v259 = v252;
        v259[1] = v251;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v260 = sub_218974978(v256);
        LOBYTE(v251) = v261;
        swift_bridgeObjectRelease();
        if ((v251 & 1) != 0)
        {
          v262 = v257[139];
          v263 = v257[87];
          v264 = swift_isUniquelyReferenced_nonNull_native();
          v265 = *(_QWORD *)(v263 + v262);
          v370[0] = v265;
          *(_QWORD *)(v263 + v262) = 0x8000000000000000;
          if ((v264 & 1) == 0)
          {
            sub_218978030();
            v265 = v370[0];
          }
          v266 = v257[139];
          v267 = v257[105];
          v268 = v257[88];
          v269 = v257[87];
          sub_21897F380(*(_QWORD *)(v265 + 48) + *(_QWORD *)(v323 + 72) * v260, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          sub_21897F960(*(_QWORD *)(v265 + 56) + *(_QWORD *)(v267 + 72) * v260, v268, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          sub_218976BDC(v260, v265);
          *(_QWORD *)(v269 + v266) = v265;
          swift_bridgeObjectRelease();
          v270 = 0;
        }
        else
        {
          v270 = 1;
        }
        v271 = v257[126];
        v272 = v257[91];
        v273 = v257[88];
        v274 = v257[86];
        (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v343 + 56))(v273, v270, 1, v257[104]);
        sub_21897FCD4(v273, qword_253E6E760);
        swift_endAccess();
        sub_21895C0AC(v271, v274, v272);
        swift_beginAccess();
        v114 = v368;
        v240 = v337;
        if (*(_QWORD *)(*(_QWORD *)v359 + 16) && (sub_218974A9C(*(_QWORD *)(v368 + 1008)), (v275 & 1) != 0))
        {
          swift_endAccess();
          swift_retain();
          sub_218988E38();
          v276 = *(_QWORD *)(sub_218988C28() + 16);
          swift_bridgeObjectRelease();
          v243 = v333;
          if (v276)
          {
            swift_release();

          }
          else
          {
            v277 = *(_QWORD *)(v368 + 1008);
            *v303 = 1;
            sub_218988E2C();
            swift_beginAccess();
            swift_bridgeObjectRetain();
            v278 = sub_218974A9C(v277);
            v280 = v279;
            swift_bridgeObjectRelease();
            if ((v280 & 1) != 0)
            {
              v281 = swift_isUniquelyReferenced_nonNull_native();
              v282 = *(_QWORD *)v359;
              v370[0] = *(_QWORD *)v359;
              *(_QWORD *)v359 = 0x8000000000000000;
              if ((v281 & 1) == 0)
              {
                sub_218977DFC((uint64_t *)&unk_253E6E888);
                v282 = v370[0];
              }
              (*(void (**)(unint64_t, _QWORD))(*(_QWORD *)(v368 + 1000) + 8))(*(_QWORD *)(v282 + 48) + *(_QWORD *)(v319 + 72) * v278, *(_QWORD *)(v368 + 992));
              sub_218976938(v278, v282);
              *(_QWORD *)v359 = v282;
              swift_bridgeObjectRelease();
            }
            swift_endAccess();
            swift_release();

            swift_release();
            v114 = v368;
          }
        }
        else
        {
          swift_endAccess();

          v243 = v333;
        }
        v244 = *(_QWORD *)(v114 + 1008);
        v245 = *(_QWORD *)(v114 + 1000);
        v246 = *(_QWORD *)(v114 + 992);
        v247 = *(_QWORD *)(v114 + 960);
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)type + 8))(*(_QWORD *)(v114 + 728), *(_QWORD *)(v114 + 712));
        sub_21897F380(v247, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t))(v245 + 8))(v244, v246);
        ++v242;
        if (v250 == v243)
          goto LABEL_133;
      }
      __break(1u);
LABEL_132:
      swift_bridgeObjectRetain();
    }
LABEL_133:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v296 = *(_QWORD *)(v114 + 488);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v297 = sub_218988E14();
    v298 = sub_218989078();
    if (os_log_type_enabled(v297, v298))
    {
      v299 = swift_slowAlloc();
      *(_DWORD *)v299 = 134218240;
      if (v296 >> 62)
      {
        swift_bridgeObjectRetain();
        v300 = sub_2189891F8();
        swift_bridgeObjectRelease();
      }
      else
      {
        v300 = *(_QWORD *)((v296 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      *(_QWORD *)(v114 + 456) = v300;
      sub_2189890C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v299 + 12) = 2048;
      v301 = v353[2];
      swift_bridgeObjectRelease();
      *(_QWORD *)(v114 + 464) = v301;
      sub_2189890C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2188DF000, v297, v298, "Send pending status END {deliveredStatuses.count: %ld, failedStatuses.count: %ld}", (uint8_t *)v299, 0x16u);
      MEMORY[0x219A1D978](v299, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    v302 = *(void **)(v114 + 1096);
    sub_218969F48(*(_QWORD *)(v114 + 688));

    goto LABEL_139;
  }
LABEL_32:
  v124 = 0;
  v328 = v118 & 0xC000000000000001;
  v314 = v118 & 0xFFFFFFFFFFFFFF8;
  v313 = v118 + 32;
  v364 = v122 + 56;
  v321 = v118;
  v315 = v123;
  while (1)
  {
    if (v328)
    {
      v125 = (id)MEMORY[0x219A1CED4](v124, v118);
    }
    else
    {
      if (v124 >= *(_QWORD *)(v314 + 16))
        goto LABEL_90;
      v125 = *(id *)(v313 + 8 * v124);
    }
    v126 = v125;
    v127 = __OFADD__(v124, 1);
    v128 = v124 + 1;
    if (v127)
      goto LABEL_89;
    v335 = v128;
    v129 = *(void **)(v114 + 664);
    v130 = objc_msgSend(v125, sel_idsIdentifier);
    v131 = v126;
    v132 = sub_218988F28();
    v134 = v133;

    v135 = objc_msgSend(v129, sel_idsDeviceIdentifier);
    if (!v135)
    {

      swift_bridgeObjectRelease();
      goto LABEL_34;
    }
    v136 = v135;
    v331 = v131;
    v137 = sub_218988F28();
    v139 = v138;

    if (v132 == v137 && v134 == v139)
      break;
    v140 = sub_218989240();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v140 & 1) != 0)
      goto LABEL_46;

LABEL_34:
    v114 = v368;
LABEL_35:
    v124 = v335;
    if (v335 == v123)
      goto LABEL_92;
  }
  swift_bridgeObjectRelease_n();
LABEL_46:
  v141 = objc_msgSend(v131, sel_pendingStatuses);
  v142 = sub_218988FA0();

  swift_bridgeObjectRetain();
  sub_21897DBB0(v142, v122);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v369 = *(_QWORD *)(v368 + 488);
  swift_bridgeObjectRetain();
  v143 = objc_msgSend(v131, sel_deliveredStatuses);
  v144 = sub_218988FA0();

  if (v144 >> 62)
  {
    swift_bridgeObjectRetain();
    v114 = sub_2189891F8();
    swift_bridgeObjectRelease();
    if (!v114)
      goto LABEL_73;
LABEL_48:
    v145 = v144;
    v146 = 0;
    v118 = v145 & 0xC000000000000001;
    v356 = v145;
    v341 = v145 + 32;
    v348 = v145 & 0xFFFFFFFFFFFFFF8;
    while (1)
    {
      while (1)
      {
        if (v118)
        {
          v147 = (id)MEMORY[0x219A1CED4](v146, v356);
        }
        else
        {
          if (v146 >= *(_QWORD *)(v348 + 16))
            goto LABEL_88;
          v147 = *(id *)(v341 + 8 * v146);
        }
        v148 = v147;
        v127 = __OFADD__(v146++, 1);
        if (v127)
        {
          __break(1u);
LABEL_88:
          __break(1u);
LABEL_89:
          __break(1u);
LABEL_90:
          __break(1u);
LABEL_91:
          swift_bridgeObjectRetain();
          v123 = sub_2189891F8();
          swift_bridgeObjectRelease();
          if (!v123)
            goto LABEL_92;
          goto LABEL_32;
        }
        v149 = objc_msgSend(v147, sel_identifier);
        v150 = sub_218988F28();
        v152 = v151;

        if (*(_QWORD *)(v122 + 16))
        {
          sub_2189892C4();
          sub_218988F4C();
          v153 = sub_2189892E8();
          v154 = -1 << *(_BYTE *)(v122 + 32);
          v155 = v153 & ~v154;
          if (((*(_QWORD *)(v364 + ((v155 >> 3) & 0xFFFFFFFFFFFFF8)) >> v155) & 1) != 0)
            break;
        }
LABEL_70:
        v162 = swift_bridgeObjectRelease();
        MEMORY[0x219A1CCF4](v162);
        if (*(_QWORD *)((v369 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v369 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_218988FC4();
        sub_218988FD0();
        sub_218988FB8();
        if (v146 == v114)
          goto LABEL_73;
      }
      v156 = *(_QWORD *)(v122 + 48);
      v157 = (_QWORD *)(v156 + 16 * v155);
      v158 = *v157 == v150 && v157[1] == v152;
      if (!v158 && (sub_218989240() & 1) == 0)
      {
        v159 = ~v154;
        do
        {
          v155 = (v155 + 1) & v159;
          if (((*(_QWORD *)(v364 + ((v155 >> 3) & 0xFFFFFFFFFFFFF8)) >> v155) & 1) == 0)
            goto LABEL_70;
          v160 = (_QWORD *)(v156 + 16 * v155);
          v161 = *v160 == v150 && v160[1] == v152;
        }
        while (!v161 && (sub_218989240() & 1) == 0);
      }

      swift_bridgeObjectRelease();
      if (v146 == v114)
        goto LABEL_73;
    }
  }
  v114 = *(_QWORD *)((v144 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v114)
    goto LABEL_48;
LABEL_73:
  v349 = *(void **)(v368 + 1056);
  v357 = *(_QWORD *)(v368 + 688);
  swift_bridgeObjectRelease();
  v163 = objc_msgSend(v331, sel_idsIdentifier);
  sub_218988F28();

  v164 = objc_allocWithZone((Class)SKADatabasePublishedLocalStatusDevice);
  v165 = (void *)sub_218988F1C();
  swift_bridgeObjectRelease();
  v166 = (void *)sub_218988F94();
  swift_bridgeObjectRelease();
  v167 = (void *)sub_218988F94();
  swift_bridgeObjectRelease();
  v168 = objc_msgSend(v164, sel_initWithIDSIdentifier_pendingStatuses_deliveredStatuses_, v165, v166, v167);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E8B8);
  v169 = swift_allocObject();
  *(_OWORD *)(v169 + 16) = xmmword_2189901C0;
  *(_QWORD *)(v169 + 32) = v168;
  v370[0] = v169;
  sub_218988FB8();
  v170 = v168;
  v171 = (void *)sub_218988F94();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v368 + 496) = 0;
  v114 = v368;
  v172 = objc_msgSend(v349, sel_createOrUpdatePublishedLocalStatusDevices_databaseContext_error_, v171, v357, v311);

  v173 = *(void **)(v368 + 496);
  if (v172)
  {
    v174 = v173;

    v118 = v321;
    v123 = v315;
    goto LABEL_35;
  }
  v199 = *(void **)(v368 + 1096);
  v202 = v173;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v201 = (void *)sub_218988B74();

  swift_willThrow();
LABEL_86:

  v283 = *(id *)(v114 + 664);
  v284 = v201;
  v285 = v283;
  v286 = v201;
  v287 = sub_218988E14();
  v288 = sub_21898906C();
  v289 = os_log_type_enabled(v287, v288);
  v290 = *(void **)(v114 + 664);
  if (v289)
  {
    v291 = swift_slowAlloc();
    v292 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v291 = 138412546;
    *(_QWORD *)(v368 + 536) = v290;
    v293 = v290;
    sub_2189890C0();
    *v292 = v290;

    *(_WORD *)(v291 + 12) = 2112;
    v294 = v201;
    v295 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v368 + 504) = v295;
    sub_2189890C0();
    v292[1] = v295;

    _os_log_impl(&dword_2188DF000, v287, v288, "Send pending status FAILED. Error fetching status devices {clDevice: %@, error: %@}", (uint8_t *)v291, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
    swift_arrayDestroy();
    MEMORY[0x219A1D978](v292, -1, -1);
    MEMORY[0x219A1D978](v291, -1, -1);

  }
  else
  {

  }
  v329 = 0;
LABEL_139:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_BOOL4))(v368 + 8))(v329);
}

uint64_t sub_21896784C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD *v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  _QWORD *v29;
  void *v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  id v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  void (*v93)(uint64_t, uint64_t);
  id v94;
  NSObject *v95;
  os_log_type_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  void *v116;
  void *v117;
  unint64_t v118;
  id v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  id v125;
  id v126;
  BOOL v127;
  unint64_t v128;
  void *v129;
  id v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  id v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char v140;
  id v141;
  unint64_t v142;
  id v143;
  unint64_t v144;
  unint64_t v145;
  unint64_t v146;
  id v147;
  void *v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  unint64_t v155;
  uint64_t v156;
  _QWORD *v157;
  BOOL v158;
  uint64_t v159;
  _QWORD *v160;
  BOOL v161;
  uint64_t v162;
  id v163;
  id v164;
  void *v165;
  void *v166;
  void *v167;
  id v168;
  uint64_t v169;
  id v170;
  void *v171;
  unsigned int v172;
  void *v173;
  id v174;
  void *v175;
  id v176;
  id v177;
  id v178;
  id v179;
  NSObject *v180;
  os_log_type_t v181;
  _BOOL4 v182;
  uint64_t v183;
  void *v184;
  uint64_t v185;
  _QWORD *v186;
  id v187;
  id v188;
  uint64_t v189;
  unint64_t v190;
  _QWORD *v191;
  void *v192;
  void *v193;
  uint64_t v194;
  _QWORD *v195;
  void *v197;
  id v198;
  void *v199;
  id v200;
  uint64_t v201;
  uint64_t *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  id v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t *v218;
  _QWORD *v219;
  uint64_t v220;
  uint64_t v221;
  unint64_t v222;
  char v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t *v227;
  _QWORD *v228;
  char v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t *v234;
  _QWORD *v235;
  char v236;
  char v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  id v246;
  id v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  _QWORD *v255;
  uint64_t v256;
  _QWORD *v257;
  unint64_t v258;
  char v259;
  uint64_t v260;
  uint64_t v261;
  char v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  char v273;
  uint64_t v274;
  uint64_t v275;
  unint64_t v276;
  char v277;
  char v278;
  char v279;
  uint64_t v280;
  id v281;
  id v282;
  id v283;
  id v284;
  NSObject *v285;
  os_log_type_t v286;
  _BOOL4 v287;
  void *v288;
  uint64_t v289;
  _QWORD *v290;
  id v291;
  id v292;
  uint64_t v293;
  unint64_t v294;
  NSObject *v295;
  os_log_type_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  void *v300;
  _BYTE *v301;
  uint64_t *v302;
  uint64_t v303;
  void *aBlock;
  uint64_t v305;
  NSObject **v306;
  uint64_t *v307;
  uint64_t *v308;
  uint64_t v309;
  _OWORD *v310;
  unint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  unint64_t v319;
  uint64_t v320;
  uint64_t v321;
  os_log_type_t typea;
  uint64_t typeb;
  os_log_type_t type[8];
  uint64_t v325;
  unint64_t v326;
  _BOOL4 v327;
  uint64_t v328;
  void *v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  unint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  unint64_t v339;
  uint64_t v340;
  uint64_t v341;
  NSObject *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  void *v347;
  uint64_t v348;
  unint64_t v349;
  os_log_type_t v350;
  _QWORD *v351;
  uint64_t v352;
  uint64_t v353;
  unint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  NSObject *v360;
  void *v361;
  uint64_t v362;
  uint64_t v363;
  void *v364;
  void *v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368[11];

  v1 = (_QWORD *)v0;
  aBlock = (void *)(v0 + 80);
  v310 = (_OWORD *)(v0 + 168);
  v368[9] = *MEMORY[0x24BDAC8D0];
  v303 = v0 + 432;
  v305 = v0 + 440;
  v309 = v0 + 496;
  v302 = (uint64_t *)(v0 + 488);
  v2 = *(_QWORD *)(v0 + 1024);
  v306 = (NSObject **)(v0 + 528);
  v307 = (uint64_t *)(v0 + 520);
  v308 = (uint64_t *)(v0 + 512);
  v3 = *(_QWORD *)(v0 + 1000);
  v4 = v1[124];
  v5 = v1[123];
  v6 = v1[117];
  v301 = v1 + 147;
  swift_willThrow();
  sub_21897FCD4(v6, &qword_255001550);
  sub_21897F380(v5, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v7 = (void *)v1[143];
  v366 = (uint64_t)v1;
  v8 = (void *)v1[142];
  v9 = (id)v1[83];
  v10 = v8;
  v11 = v7;
  v12 = v9;
  v13 = v10;
  v14 = v7;
  v15 = sub_218988E14();
  v16 = sub_218989060();
  v17 = os_log_type_enabled(v15, v16);
  v18 = (void *)v1[142];
  v19 = v1[83];
  if (v17)
  {
    v350 = v16;
    v20 = swift_slowAlloc();
    v21 = (_QWORD *)swift_slowAlloc();
    v358 = swift_slowAlloc();
    v368[0] = v358;
    *(_DWORD *)v20 = 136315650;
    v22 = objc_msgSend(v18, sel_identifier);
    v23 = sub_218988F28();
    v342 = v15;
    v25 = v24;

    *v308 = sub_218974338(v23, v25, v368);
    sub_2189890C0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2112;
    v26 = v7;
    v27 = _swift_stdlib_bridgeErrorToNSError();
    *v307 = v27;
    sub_2189890C0();
    *v21 = v27;

    *(_WORD *)(v20 + 22) = 2112;
    *v306 = v19;
    v28 = v19;
    sub_2189890C0();
    v21[1] = v19;

    v19 = v342;
    _os_log_impl(&dword_2188DF000, v342, v350, "Status send FAILED {status: %s, error: %@, device: %@}", (uint8_t *)v20, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
    swift_arrayDestroy();
    v29 = v21;
    v1 = (_QWORD *)v366;
    MEMORY[0x219A1D978](v29, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x219A1D978](v358, -1, -1);
    MEMORY[0x219A1D978](v20, -1, -1);
  }
  else
  {

  }
  v30 = (void *)sub_218988B68();
  v31 = objc_msgSend(v30, sel_userInfo);
  v32 = sub_218988ED4();

  if (*(_QWORD *)(v32 + 16) && (v33 = sub_218974A38(0x4D726F7272457563, 0xEA00000000006773), (v34 & 1) != 0))
  {
    sub_21897F3BC(*(_QWORD *)(v32 + 56) + 32 * v33, (uint64_t)v310);
  }
  else
  {
    *v310 = 0u;
    v310[1] = 0u;
  }
  swift_bridgeObjectRelease();
  if (!v1[24])
  {
    sub_21897FCD4((uint64_t)v310, &qword_255001768);
    goto LABEL_12;
  }
  if (!swift_dynamicCast())
  {
LABEL_12:
    swift_getErrorValue();
    v35 = sub_218989288();
    v36 = v37;
    goto LABEL_13;
  }
  v35 = v1[52];
  v36 = v1[53];
LABEL_13:
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v39 = (_QWORD *)v1[141];
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    v39 = sub_218974214(0, v39[2] + 1, 1, v39);
  v41 = v39[2];
  v40 = v39[3];
  if (v41 >= v40 >> 1)
    v39 = sub_218974214((_QWORD *)(v40 > 1), v41 + 1, 1, v39);
  v42 = v1[142];
  v39[2] = v41 + 1;
  v351 = v39;
  v43 = &v39[3 * v41];
  v43[4] = v42;
  v43[5] = v35;
  v43[6] = v36;

  v44 = v1[140] + 1;
  if (v44 != v1[135])
  {
    while (1)
    {
      v1[141] = v351;
      v1[140] = v44;
      v65 = v1[128];
      v66 = *(void **)(v1[134] + 8 * v44 + 32);
      v1[142] = v66;
      v67 = v66;
      sub_21896EEBC(v65);
      v68 = v1[131];
      v69 = v1[130];
      v70 = v1[123];
      v71 = v1[118];
      v72 = (uint64_t *)(v1[87] + v1[139]);
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v1[125] + 16))(v70, v1[128], v1[124]);
      v73 = (_QWORD *)(v70 + *(int *)(v71 + 20));
      *v73 = v69;
      v73[1] = v68;
      swift_beginAccess();
      v74 = *v72;
      v75 = *(_QWORD *)(*v72 + 16);
      swift_bridgeObjectRetain();
      if (v75 && (v76 = sub_218974978(v1[123]), (v77 & 1) != 0))
      {
        v359 = v1[117];
        v78 = v1[116];
        v79 = v1[111];
        v80 = *(_QWORD *)(v366 + 880);
        v81 = *(_QWORD *)(v366 + 800);
        v82 = *(_QWORD *)(v366 + 792);
        sub_21897F33C(*(_QWORD *)(v74 + 56) + *(_QWORD *)(*(_QWORD *)(v366 + 840) + 72) * v76, v80, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        sub_21897F960(v80, v79, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        swift_endAccess();
        sub_218988B98();
        v1 = (_QWORD *)v366;
        sub_218988BA4();
        sub_21897F380(v79, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v81 + 56))(v78, 0, 1, v82);
        sub_21897FC00(v78, v359, &qword_255001550);
      }
      else
      {
        v83 = v1[117];
        v84 = v1[100];
        v85 = v1[99];
        swift_endAccess();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v84 + 56))(v83, 1, 1, v85);
      }
      v86 = v1[115];
      v87 = v1[100];
      v88 = v1[99];
      sub_218980220(v1[117], v86, &qword_255001550);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v87 + 48))(v86, 1, v88) == 1)
      {
        sub_21897FCD4(v1[115], &qword_255001550);
        goto LABEL_80;
      }
      v89 = v1[102];
      v90 = v1[100];
      v91 = v1[99];
      (*(void (**)(_QWORD, _QWORD, uint64_t))(v90 + 32))(v1[103], v1[115], v91);
      sub_218988BE0();
      v92 = sub_218988BBC();
      v93 = *(void (**)(uint64_t, uint64_t))(v90 + 8);
      v93(v89, v91);
      if ((v92 & 1) == 0)
        break;
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v1[100] + 16))(v1[101], v1[103], v1[99]);
      swift_bridgeObjectRetain_n();
      v94 = v67;
      v95 = sub_218988E14();
      v96 = sub_218989078();
      v360 = v95;
      if (os_log_type_enabled(v95, v96))
      {
        v337 = v1[124];
        v343 = v1[128];
        v332 = v1[123];
        v336 = v1[125];
        v328 = v1[117];
        v325 = v1[103];
        v45 = v1[101];
        v46 = v1[99];
        typea = v96;
        v47 = v1;
        v48 = swift_slowAlloc();
        v318 = swift_slowAlloc();
        v368[0] = v318;
        *(_DWORD *)v48 = 136315650;
        sub_218974B58(&qword_255001790, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
        v315 = v46;
        v49 = sub_218989234();
        v47[75] = sub_218974338(v49, v50, v368);
        sub_2189890C0();
        swift_bridgeObjectRelease();
        v93(v45, v46);
        *(_WORD *)(v48 + 12) = 2080;
        v51 = objc_msgSend(v94, sel_identifier);
        v52 = sub_218988F28();
        v54 = v53;

        v47[76] = sub_218974338(v52, v54, v368);
        sub_2189890C0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v48 + 22) = 2080;
        swift_bridgeObjectRetain();
        v55 = sub_21897BF64(8);
        v57 = v56;
        v59 = v58;
        v61 = v60;
        swift_bridgeObjectRelease();
        v62 = MEMORY[0x219A1CCAC](v55, v57, v59, v61);
        v64 = v63;
        swift_bridgeObjectRelease();
        v47[77] = sub_218974338(v62, v64, v368);
        sub_2189890C0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2188DF000, v360, typea, "Status send SKIP. Not enough time since latest failed attempt. {nextAttemptDate: %s, status.identifier: %s, idsIdentifier: %s}", (uint8_t *)v48, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x219A1D978](v318, -1, -1);
        MEMORY[0x219A1D978](v48, -1, -1);

        v93(v325, v315);
        sub_21897FCD4(v328, &qword_255001550);
        sub_21897F380(v332, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t))(v336 + 8))(v343, v337);
      }
      else
      {
        v97 = v1[125];
        v338 = v1[124];
        v344 = v1[128];
        v98 = v1[123];
        v47 = v1;
        v99 = v1[117];
        v100 = v47[103];
        v101 = v47[101];
        v102 = v47[99];

        swift_bridgeObjectRelease_n();
        v93(v101, v102);

        v93(v100, v102);
        sub_21897FCD4(v99, &qword_255001550);
        sub_21897F380(v98, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v344, v338);
      }
      v44 = v47[140] + 1;
      v1 = v47;
      if (v44 == v47[135])
        goto LABEL_29;
    }
    v93(v1[103], v1[99]);
LABEL_80:
    v175 = (void *)v1[83];
    sub_218980220(v1[117], v1[114], &qword_255001550);
    v176 = v175;
    v177 = v67;
    v178 = v176;
    v179 = v177;
    v180 = sub_218988E14();
    v181 = sub_218989078();
    v182 = os_log_type_enabled(v180, v181);
    v183 = v1[114];
    if (v182)
    {
      v352 = v1[113];
      v184 = (void *)v1[83];
      v185 = swift_slowAlloc();
      v186 = (_QWORD *)swift_slowAlloc();
      v363 = swift_slowAlloc();
      v368[0] = v363;
      *(_DWORD *)v185 = 138412802;
      *(_QWORD *)(v366 + 576) = v179;
      v187 = v179;
      sub_2189890C0();
      *v186 = v179;

      *(_WORD *)(v185 + 12) = 2112;
      *(_QWORD *)(v366 + 584) = v184;
      v188 = v184;
      sub_2189890C0();
      v186[1] = v184;

      *(_WORD *)(v185 + 22) = 2080;
      sub_218980220(v183, v352, &qword_255001550);
      v189 = sub_218988F34();
      *(_QWORD *)(v366 + 592) = sub_218974338(v189, v190, v368);
      sub_2189890C0();
      swift_bridgeObjectRelease();
      sub_21897FCD4(v183, &qword_255001550);
      _os_log_impl(&dword_2188DF000, v180, v181, "Status send START {status: %@, device: %@, nextAttemptDate: %s}", (uint8_t *)v185, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
      swift_arrayDestroy();
      v191 = v186;
      v1 = (_QWORD *)v366;
      MEMORY[0x219A1D978](v191, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v363, -1, -1);
      MEMORY[0x219A1D978](v185, -1, -1);
    }
    else
    {
      v192 = (void *)v1[83];

      sub_21897FCD4(v183, &qword_255001550);
    }

    v193 = (void *)v1[137];
    v1[2] = v1;
    v1[3] = sub_2189625F8;
    v194 = swift_continuation_init();
    v1[16] = MEMORY[0x24BDAC760];
    v195 = v1 + 16;
    v195[1] = 0x40000000;
    v195[2] = sub_218969EA8;
    v195[3] = &block_descriptor_58;
    v195[4] = v194;
    objc_msgSend(v193, sel_activateWithCompletion_, v195);
    return swift_continuation_await();
  }
LABEL_29:
  v103 = (void *)v1[137];
  v104 = (void *)v1[132];
  v105 = v1[98];
  v106 = v1[97];
  v345 = v1[96];
  v107 = *(_QWORD *)(v366 + 760);
  v108 = *(_QWORD *)(v366 + 752);
  v109 = *(_QWORD *)(v366 + 744);
  v353 = *(_QWORD *)(v366 + 688);
  v361 = v104;
  swift_bridgeObjectRelease();
  v110 = swift_allocObject();
  *(_QWORD *)(v110 + 16) = v103;
  *(_QWORD *)(v366 + 112) = sub_21897F32C;
  *(_QWORD *)(v366 + 120) = v110;
  *(_QWORD *)(v366 + 80) = MEMORY[0x24BDAC760];
  *(_QWORD *)(v366 + 88) = 1107296256;
  *(_QWORD *)(v366 + 96) = sub_218951B34;
  *(_QWORD *)(v366 + 104) = &block_descriptor_57;
  v111 = _Block_copy(aBlock);
  v112 = v103;
  sub_218988EB0();
  *(_QWORD *)(v366 + 448) = MEMORY[0x24BEE4AF8];
  sub_218974B58(&qword_255001770, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255001778);
  sub_21897FAFC((unint64_t *)&unk_255001780, &qword_255001778, MEMORY[0x24BEE12C8]);
  sub_2189890F0();
  MEMORY[0x219A1CE08](0, v105, v107, v111);
  _Block_release(v111);
  v113 = v107;
  v114 = v366;
  (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v113, v109);
  (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v105, v345);
  swift_release();
  *(_QWORD *)(v366 + 440) = 0;
  v115 = objc_msgSend(v361, sel_allPublishedLocalStatusDevicesInDatabaseContext_error_, v353, v305);
  v116 = *(void **)(v366 + 440);
  if (!v115)
  {
    v197 = *(void **)(v366 + 1096);
    v198 = v116;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v199 = (void *)sub_218988B74();

    swift_willThrow();
    goto LABEL_86;
  }
  v117 = v115;
  v118 = sub_218988FA0();
  v119 = v116;

  v120 = swift_bridgeObjectRetain();
  v121 = sub_21895CE7C(v120, v303, (SEL *)&selRef_identifier);
  swift_bridgeObjectRelease();
  v122 = sub_21897BD40(v121);
  swift_bridgeObjectRelease();
  if (v118 >> 62)
    goto LABEL_91;
  v123 = *(_QWORD *)((v118 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v123)
  {
LABEL_92:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v201 = v351[2];
    v327 = v201 == 0;
    if (v201)
    {
      v340 = *(_QWORD *)(v114 + 832);
      v330 = *(_QWORD *)(v114 + 696) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects;
      v334 = *(_QWORD *)(v114 + 720);
      v202 = (uint64_t *)(swift_bridgeObjectRetain() + 48);
      do
      {
        v209 = *(_QWORD *)(v114 + 1016);
        v210 = *(v202 - 1);
        v211 = *v202;
        v212 = (id)*(v202 - 2);
        swift_bridgeObjectRetain();
        sub_21896EEBC(v209);
        v213 = *(_QWORD *)(v114 + 1048);
        v356 = v201;
        v364 = v212;
        v214 = *(_QWORD *)(v114 + 1112);
        v215 = *(_QWORD *)(v366 + 1040);
        v216 = *(_QWORD *)(v366 + 976);
        v217 = *(_QWORD *)(v366 + 944);
        v218 = (uint64_t *)(*(_QWORD *)(v366 + 696) + v214);
        (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v366 + 1000) + 16))(v216, *(_QWORD *)(v366 + 1016), *(_QWORD *)(v366 + 992));
        v219 = (_QWORD *)(v216 + *(int *)(v217 + 20));
        *v219 = v215;
        v219[1] = v213;
        v114 = v366;
        swift_beginAccess();
        v220 = *v218;
        v221 = *(_QWORD *)(v220 + 16);
        swift_bridgeObjectRetain();
        if (v221 && (v222 = sub_218974978(*(_QWORD *)(v366 + 976)), (v223 & 1) != 0))
        {
          typeb = *(_QWORD *)(v366 + 976);
          v316 = *(_QWORD *)(v366 + 968);
          v224 = *(_QWORD *)(v366 + 872);
          v225 = *(_QWORD *)(v366 + 864);
          v226 = *(_QWORD *)(v366 + 856);
          v348 = *(_QWORD *)(v366 + 848);
          v314 = *(_QWORD *)(v366 + 800);
          v320 = *(_QWORD *)(v366 + 792);
          v227 = (uint64_t *)(*(_QWORD *)(v366 + 696) + *(_QWORD *)(v366 + 1112));
          sub_21897F33C(*(_QWORD *)(v220 + 56) + *(_QWORD *)(*(_QWORD *)(v366 + 840) + 72) * v222, v225, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          sub_21897F960(v225, v224, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          swift_endAccess();
          sub_21897F33C(typeb, v316, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v314 + 16))(v226, v224, v320);
          sub_218988BE0();
          v228 = (_QWORD *)(v226 + *(int *)(v340 + 24));
          *v228 = v210;
          v228[1] = v211;
          swift_beginAccess();
          sub_21897F960(v226, v348, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          v229 = swift_isUniquelyReferenced_nonNull_native();
          v368[0] = *v227;
          *v227 = 0x8000000000000000;
          sub_2189772C4(v348, v316, v229);
          *v227 = v368[0];
          swift_bridgeObjectRelease();
          sub_21897F380(v316, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          swift_endAccess();
          sub_21897F380(v224, type metadata accessor for SKALocalStatusServer.FailedDelivery);
        }
        else
        {
          v230 = *(_QWORD *)(v366 + 976);
          v231 = *(_QWORD *)(v366 + 968);
          v232 = *(_QWORD *)(v366 + 856);
          v233 = *(_QWORD *)(v366 + 848);
          v234 = (uint64_t *)(*(_QWORD *)(v366 + 696) + *(_QWORD *)(v366 + 1112));
          swift_endAccess();
          sub_21897F33C(v230, v231, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          sub_218988BE0();
          sub_218988BE0();
          v235 = (_QWORD *)(v232 + *(int *)(v340 + 24));
          *v235 = v210;
          v235[1] = v211;
          swift_beginAccess();
          sub_21897F960(v232, v233, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          v236 = swift_isUniquelyReferenced_nonNull_native();
          v368[0] = *v234;
          *v234 = 0x8000000000000000;
          sub_2189772C4(v233, v231, v236);
          *v234 = v368[0];
          swift_bridgeObjectRelease();
          sub_21897F380(v231, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          swift_endAccess();
        }
        sub_21895C0AC(*(_QWORD *)(v366 + 1016), *(_QWORD *)(v366 + 688), *(_QWORD *)(v366 + 736));
        swift_beginAccess();
        if (*(_QWORD *)(*(_QWORD *)v330 + 16) && (sub_218974A9C(*(_QWORD *)(v366 + 1016)), (v237 & 1) != 0))
        {
          swift_endAccess();
          swift_retain();
          sub_218988E38();
          swift_release();
        }
        else
        {
          swift_endAccess();
        }
        v203 = *(_QWORD *)(v366 + 1016);
        v204 = *(_QWORD *)(v366 + 1000);
        v205 = *(_QWORD *)(v366 + 992);
        v206 = *(_QWORD *)(v366 + 976);
        v207 = *(_QWORD *)(v366 + 736);
        v208 = *(_QWORD *)(v366 + 712);

        (*(void (**)(uint64_t, uint64_t))(v334 + 8))(v207, v208);
        sub_21897F380(v206, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t))(v204 + 8))(v203, v205);
        v202 += 3;
        v201 = v356 - 1;
      }
      while (v356 != 1);
      swift_bridgeObjectRelease();
    }
    v238 = *v302;
    if ((unint64_t)*v302 >> 62)
      goto LABEL_132;
    v239 = *(_QWORD *)((v238 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v239; v239 = sub_2189891F8())
    {
      v240 = 0;
      v317 = *(_QWORD *)(v114 + 1000);
      v321 = *(_QWORD *)(v114 + 952);
      v357 = *(_QWORD *)(v114 + 696) + OBJC_IVAR___SKALocalStatusServer_deliverySubjects;
      v341 = *(_QWORD *)(v114 + 840);
      v349 = v238 & 0xC000000000000001;
      *(_QWORD *)type = *(_QWORD *)(v114 + 720);
      v331 = v239;
      v335 = v238;
      while (1)
      {
        v246 = v349 ? (id)MEMORY[0x219A1CED4](v240, v238) : *(id *)(v238 + 8 * v240 + 32);
        v247 = v246;
        v248 = v240 + 1;
        if (__OFADD__(v240, 1))
          break;
        sub_21896EEBC(*(_QWORD *)(v114 + 1008));
        v249 = *(_QWORD *)(v114 + 1048);
        v365 = v247;
        v250 = *(_QWORD *)(v114 + 1040);
        v251 = *(_QWORD *)(v114 + 1008);
        v252 = *(_QWORD *)(v114 + 1000);
        v253 = *(_QWORD *)(v114 + 992);
        v254 = *(_QWORD *)(v114 + 960);
        v255 = (_QWORD *)v114;
        v256 = *(_QWORD *)(v114 + 944);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v252 + 16))(v254, v251, v253);
        v257 = (_QWORD *)(v254 + *(int *)(v256 + 20));
        *v257 = v250;
        v257[1] = v249;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v258 = sub_218974978(v254);
        LOBYTE(v249) = v259;
        swift_bridgeObjectRelease();
        if ((v249 & 1) != 0)
        {
          v260 = v255[139];
          v261 = v255[87];
          v262 = swift_isUniquelyReferenced_nonNull_native();
          v263 = *(_QWORD *)(v261 + v260);
          v368[0] = v263;
          *(_QWORD *)(v261 + v260) = 0x8000000000000000;
          if ((v262 & 1) == 0)
          {
            sub_218978030();
            v263 = v368[0];
          }
          v264 = v255[139];
          v265 = v255[105];
          v266 = v255[88];
          v267 = v255[87];
          sub_21897F380(*(_QWORD *)(v263 + 48) + *(_QWORD *)(v321 + 72) * v258, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
          sub_21897F960(*(_QWORD *)(v263 + 56) + *(_QWORD *)(v265 + 72) * v258, v266, type metadata accessor for SKALocalStatusServer.FailedDelivery);
          sub_218976BDC(v258, v263);
          *(_QWORD *)(v267 + v264) = v263;
          swift_bridgeObjectRelease();
          v268 = 0;
        }
        else
        {
          v268 = 1;
        }
        v269 = v255[126];
        v270 = v255[91];
        v271 = v255[88];
        v272 = v255[86];
        (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v341 + 56))(v271, v268, 1, v255[104]);
        sub_21897FCD4(v271, qword_253E6E760);
        swift_endAccess();
        sub_21895C0AC(v269, v272, v270);
        swift_beginAccess();
        v114 = v366;
        v238 = v335;
        if (*(_QWORD *)(*(_QWORD *)v357 + 16) && (sub_218974A9C(*(_QWORD *)(v366 + 1008)), (v273 & 1) != 0))
        {
          swift_endAccess();
          swift_retain();
          sub_218988E38();
          v274 = *(_QWORD *)(sub_218988C28() + 16);
          swift_bridgeObjectRelease();
          v241 = v331;
          if (v274)
          {
            swift_release();

          }
          else
          {
            v275 = *(_QWORD *)(v366 + 1008);
            *v301 = 1;
            sub_218988E2C();
            swift_beginAccess();
            swift_bridgeObjectRetain();
            v276 = sub_218974A9C(v275);
            v278 = v277;
            swift_bridgeObjectRelease();
            if ((v278 & 1) != 0)
            {
              v279 = swift_isUniquelyReferenced_nonNull_native();
              v280 = *(_QWORD *)v357;
              v368[0] = *(_QWORD *)v357;
              *(_QWORD *)v357 = 0x8000000000000000;
              if ((v279 & 1) == 0)
              {
                sub_218977DFC((uint64_t *)&unk_253E6E888);
                v280 = v368[0];
              }
              (*(void (**)(unint64_t, _QWORD))(*(_QWORD *)(v366 + 1000) + 8))(*(_QWORD *)(v280 + 48) + *(_QWORD *)(v317 + 72) * v276, *(_QWORD *)(v366 + 992));
              sub_218976938(v276, v280);
              *(_QWORD *)v357 = v280;
              swift_bridgeObjectRelease();
            }
            swift_endAccess();
            swift_release();

            swift_release();
            v114 = v366;
          }
        }
        else
        {
          swift_endAccess();

          v241 = v331;
        }
        v242 = *(_QWORD *)(v114 + 1008);
        v243 = *(_QWORD *)(v114 + 1000);
        v244 = *(_QWORD *)(v114 + 992);
        v245 = *(_QWORD *)(v114 + 960);
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)type + 8))(*(_QWORD *)(v114 + 728), *(_QWORD *)(v114 + 712));
        sub_21897F380(v245, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        (*(void (**)(uint64_t, uint64_t))(v243 + 8))(v242, v244);
        ++v240;
        if (v248 == v241)
          goto LABEL_133;
      }
      __break(1u);
LABEL_132:
      swift_bridgeObjectRetain();
    }
LABEL_133:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v294 = *(_QWORD *)(v114 + 488);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v295 = sub_218988E14();
    v296 = sub_218989078();
    if (os_log_type_enabled(v295, v296))
    {
      v297 = swift_slowAlloc();
      *(_DWORD *)v297 = 134218240;
      if (v294 >> 62)
      {
        swift_bridgeObjectRetain();
        v298 = sub_2189891F8();
        swift_bridgeObjectRelease();
      }
      else
      {
        v298 = *(_QWORD *)((v294 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      *(_QWORD *)(v114 + 456) = v298;
      sub_2189890C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v297 + 12) = 2048;
      v299 = v351[2];
      swift_bridgeObjectRelease();
      *(_QWORD *)(v114 + 464) = v299;
      sub_2189890C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2188DF000, v295, v296, "Send pending status END {deliveredStatuses.count: %ld, failedStatuses.count: %ld}", (uint8_t *)v297, 0x16u);
      MEMORY[0x219A1D978](v297, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    v300 = *(void **)(v114 + 1096);
    sub_218969F48(*(_QWORD *)(v114 + 688));

    goto LABEL_139;
  }
LABEL_32:
  v124 = 0;
  v326 = v118 & 0xC000000000000001;
  v312 = v118 & 0xFFFFFFFFFFFFFF8;
  v311 = v118 + 32;
  v362 = v122 + 56;
  v319 = v118;
  v313 = v123;
  while (1)
  {
    if (v326)
    {
      v125 = (id)MEMORY[0x219A1CED4](v124, v118);
    }
    else
    {
      if (v124 >= *(_QWORD *)(v312 + 16))
        goto LABEL_90;
      v125 = *(id *)(v311 + 8 * v124);
    }
    v126 = v125;
    v127 = __OFADD__(v124, 1);
    v128 = v124 + 1;
    if (v127)
      goto LABEL_89;
    v333 = v128;
    v129 = *(void **)(v114 + 664);
    v130 = objc_msgSend(v125, sel_idsIdentifier);
    v131 = v126;
    v132 = sub_218988F28();
    v134 = v133;

    v135 = objc_msgSend(v129, sel_idsDeviceIdentifier);
    if (!v135)
    {

      swift_bridgeObjectRelease();
      goto LABEL_34;
    }
    v136 = v135;
    v329 = v131;
    v137 = sub_218988F28();
    v139 = v138;

    if (v132 == v137 && v134 == v139)
      break;
    v140 = sub_218989240();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v140 & 1) != 0)
      goto LABEL_46;

LABEL_34:
    v114 = v366;
LABEL_35:
    v124 = v333;
    if (v333 == v123)
      goto LABEL_92;
  }
  swift_bridgeObjectRelease_n();
LABEL_46:
  v141 = objc_msgSend(v131, sel_pendingStatuses);
  v142 = sub_218988FA0();

  swift_bridgeObjectRetain();
  sub_21897DBB0(v142, v122);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v367 = *(_QWORD *)(v366 + 488);
  swift_bridgeObjectRetain();
  v143 = objc_msgSend(v131, sel_deliveredStatuses);
  v144 = sub_218988FA0();

  if (v144 >> 62)
  {
    swift_bridgeObjectRetain();
    v114 = sub_2189891F8();
    swift_bridgeObjectRelease();
    if (!v114)
      goto LABEL_73;
LABEL_48:
    v145 = v144;
    v146 = 0;
    v118 = v145 & 0xC000000000000001;
    v354 = v145;
    v339 = v145 + 32;
    v346 = v145 & 0xFFFFFFFFFFFFFF8;
    while (1)
    {
      while (1)
      {
        if (v118)
        {
          v147 = (id)MEMORY[0x219A1CED4](v146, v354);
        }
        else
        {
          if (v146 >= *(_QWORD *)(v346 + 16))
            goto LABEL_88;
          v147 = *(id *)(v339 + 8 * v146);
        }
        v148 = v147;
        v127 = __OFADD__(v146++, 1);
        if (v127)
        {
          __break(1u);
LABEL_88:
          __break(1u);
LABEL_89:
          __break(1u);
LABEL_90:
          __break(1u);
LABEL_91:
          swift_bridgeObjectRetain();
          v123 = sub_2189891F8();
          swift_bridgeObjectRelease();
          if (!v123)
            goto LABEL_92;
          goto LABEL_32;
        }
        v149 = objc_msgSend(v147, sel_identifier);
        v150 = sub_218988F28();
        v152 = v151;

        if (*(_QWORD *)(v122 + 16))
        {
          sub_2189892C4();
          sub_218988F4C();
          v153 = sub_2189892E8();
          v154 = -1 << *(_BYTE *)(v122 + 32);
          v155 = v153 & ~v154;
          if (((*(_QWORD *)(v362 + ((v155 >> 3) & 0xFFFFFFFFFFFFF8)) >> v155) & 1) != 0)
            break;
        }
LABEL_70:
        v162 = swift_bridgeObjectRelease();
        MEMORY[0x219A1CCF4](v162);
        if (*(_QWORD *)((v367 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v367 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_218988FC4();
        sub_218988FD0();
        sub_218988FB8();
        if (v146 == v114)
          goto LABEL_73;
      }
      v156 = *(_QWORD *)(v122 + 48);
      v157 = (_QWORD *)(v156 + 16 * v155);
      v158 = *v157 == v150 && v157[1] == v152;
      if (!v158 && (sub_218989240() & 1) == 0)
      {
        v159 = ~v154;
        do
        {
          v155 = (v155 + 1) & v159;
          if (((*(_QWORD *)(v362 + ((v155 >> 3) & 0xFFFFFFFFFFFFF8)) >> v155) & 1) == 0)
            goto LABEL_70;
          v160 = (_QWORD *)(v156 + 16 * v155);
          v161 = *v160 == v150 && v160[1] == v152;
        }
        while (!v161 && (sub_218989240() & 1) == 0);
      }

      swift_bridgeObjectRelease();
      if (v146 == v114)
        goto LABEL_73;
    }
  }
  v114 = *(_QWORD *)((v144 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v114)
    goto LABEL_48;
LABEL_73:
  v347 = *(void **)(v366 + 1056);
  v355 = *(_QWORD *)(v366 + 688);
  swift_bridgeObjectRelease();
  v163 = objc_msgSend(v329, sel_idsIdentifier);
  sub_218988F28();

  v164 = objc_allocWithZone((Class)SKADatabasePublishedLocalStatusDevice);
  v165 = (void *)sub_218988F1C();
  swift_bridgeObjectRelease();
  v166 = (void *)sub_218988F94();
  swift_bridgeObjectRelease();
  v167 = (void *)sub_218988F94();
  swift_bridgeObjectRelease();
  v168 = objc_msgSend(v164, sel_initWithIDSIdentifier_pendingStatuses_deliveredStatuses_, v165, v166, v167);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E8B8);
  v169 = swift_allocObject();
  *(_OWORD *)(v169 + 16) = xmmword_2189901C0;
  *(_QWORD *)(v169 + 32) = v168;
  v368[0] = v169;
  sub_218988FB8();
  v170 = v168;
  v171 = (void *)sub_218988F94();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v366 + 496) = 0;
  v114 = v366;
  v172 = objc_msgSend(v347, sel_createOrUpdatePublishedLocalStatusDevices_databaseContext_error_, v171, v355, v309);

  v173 = *(void **)(v366 + 496);
  if (v172)
  {
    v174 = v173;

    v118 = v319;
    v123 = v313;
    goto LABEL_35;
  }
  v197 = *(void **)(v366 + 1096);
  v200 = v173;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v199 = (void *)sub_218988B74();

  swift_willThrow();
LABEL_86:

  v281 = *(id *)(v114 + 664);
  v282 = v199;
  v283 = v281;
  v284 = v199;
  v285 = sub_218988E14();
  v286 = sub_21898906C();
  v287 = os_log_type_enabled(v285, v286);
  v288 = *(void **)(v114 + 664);
  if (v287)
  {
    v289 = swift_slowAlloc();
    v290 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v289 = 138412546;
    *(_QWORD *)(v366 + 536) = v288;
    v291 = v288;
    sub_2189890C0();
    *v290 = v288;

    *(_WORD *)(v289 + 12) = 2112;
    v292 = v199;
    v293 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v366 + 504) = v293;
    sub_2189890C0();
    v290[1] = v293;

    _os_log_impl(&dword_2188DF000, v285, v286, "Send pending status FAILED. Error fetching status devices {clDevice: %@, error: %@}", (uint8_t *)v289, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
    swift_arrayDestroy();
    MEMORY[0x219A1D978](v290, -1, -1);
    MEMORY[0x219A1D978](v289, -1, -1);

  }
  else
  {

  }
  v327 = 0;
LABEL_139:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_BOOL4))(v366 + 8))(v327);
}

uint64_t sub_218969E94@<X0>(uint64_t a1@<X8>)
{
  return sub_21896EEBC(a1);
}

uint64_t sub_218969EA8(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550017B8);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_218969F1C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_218969F48(uint64_t a1)
{
  char *v1;
  char *v2;
  void *v4;
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  _QWORD *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  _BYTE v42[16];
  id v43[2];

  v2 = v1;
  v43[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = (void *)*((_QWORD *)v1 + 22);
  v43[0] = 0;
  v5 = objc_msgSend(v4, sel_allPublishedLocalStatusDevicesInDatabaseContext_error_, a1, v43);
  v6 = v43[0];
  if (v5)
  {
    v7 = v5;
    sub_21897FBC8(0, (unint64_t *)&unk_253E6E868);
    v8 = sub_218988FA0();
    v9 = v6;

    swift_retain();
    v10 = sub_21897D874(v8);
    swift_bridgeObjectRelease();
    swift_release();
    v43[0] = (id)MEMORY[0x24BEE4AF8];
    if (v10 >> 62)
    {
      v11 = sub_2189891F8();
      if (v11)
        goto LABEL_4;
    }
    else
    {
      v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v11)
      {
LABEL_4:
        if (v11 < 1)
        {
          __break(1u);
LABEL_31:
          swift_once();
LABEL_26:
          v32 = sub_218988E20();
          __swift_project_value_buffer(v32, (uint64_t)qword_253E6EE68);
          swift_bridgeObjectRetain();
          v33 = sub_218988E14();
          v34 = sub_218989078();
          if (os_log_type_enabled(v33, v34))
          {
            v41 = v2;
            v35 = (uint8_t *)swift_slowAlloc();
            v36 = (void *)swift_slowAlloc();
            v43[0] = v36;
            *(_DWORD *)v35 = 136315138;
            v37 = swift_bridgeObjectRetain();
            v38 = MEMORY[0x219A1CD18](v37, MEMORY[0x24BEE0D00]);
            v40 = v39;
            swift_bridgeObjectRelease();
            sub_218974338(v38, v40, (uint64_t *)v43);
            sub_2189890C0();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2188DF000, v33, v34, "Updated browseCompanionLink device filter: %s", v35, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x219A1D978](v36, -1, -1);
            MEMORY[0x219A1D978](v35, -1, -1);
            swift_bridgeObjectRelease();

          }
          else
          {

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
          }
          return;
        }
        for (i = 0; i != v11; ++i)
        {
          if ((v10 & 0xC000000000000001) != 0)
            v13 = (id)MEMORY[0x219A1CED4](i, v10);
          else
            v13 = *(id *)(v10 + 8 * i + 32);
          v14 = v13;
          v15 = objc_msgSend(v13, sel_pendingStatuses);
          sub_21897FBC8(0, (unint64_t *)&unk_253E6E858);
          v16 = sub_218988FA0();

          if (v16 >> 62)
          {
            swift_bridgeObjectRetain();
            v17 = sub_2189891F8();
            swift_bridgeObjectRelease();
          }
          else
          {
            v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
          }
          swift_bridgeObjectRelease();
          if (v17)
          {
            sub_21898918C();
            sub_2189891A4();
            sub_2189891B0();
            sub_218989198();
          }
          else
          {

          }
        }
        swift_bridgeObjectRelease();
        v18 = v43[0];
LABEL_24:
        v30 = *(void **)&v2[OBJC_IVAR___SKALocalStatusServer_browseTask];
        if (!v30)
        {
          swift_release();
          return;
        }
        v2 = v30;
        swift_bridgeObjectRetain();
        sub_21895CE7C((unint64_t)v18, (uint64_t)v42, (SEL *)&selRef_idsIdentifier);
        swift_release();
        v31 = (void *)sub_218988F94();
        objc_msgSend(v2, sel_setDeviceFilter_, v31);

        if (qword_253E6EE80 == -1)
          goto LABEL_26;
        goto LABEL_31;
      }
    }
    swift_bridgeObjectRelease();
    v18 = (id)MEMORY[0x24BEE4AF8];
    goto LABEL_24;
  }
  v19 = v43[0];
  v20 = (void *)sub_218988B74();

  swift_willThrow();
  if (qword_253E6EE80 != -1)
    swift_once();
  v21 = sub_218988E20();
  __swift_project_value_buffer(v21, (uint64_t)qword_253E6EE68);
  v22 = v20;
  v23 = v20;
  v24 = sub_218988E14();
  v25 = sub_218989060();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    v27 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v26 = 138412290;
    v28 = v20;
    v29 = (void *)_swift_stdlib_bridgeErrorToNSError();
    v43[0] = v29;
    sub_2189890C0();
    *v27 = v29;

    _os_log_impl(&dword_2188DF000, v24, v25, "Failed to fetch all published local status devices while updating browser device filter: %@", v26, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
    swift_arrayDestroy();
    MEMORY[0x219A1D978](v27, -1, -1);
    MEMORY[0x219A1D978](v26, -1, -1);

  }
  else
  {

  }
}

void sub_21896A574(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t aBlock;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  void *v26;
  uint64_t v27;

  v2 = v1;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE7CBF0]), sel_init);
  objc_msgSend(v4, sel_setDispatchQueue_, *(_QWORD *)(v1 + 144));
  objc_msgSend(v4, sel_setControlFlags_, 6);
  if (*(_BYTE *)(v1 + OBJC_IVAR___SKALocalStatusServer_recentPendingStatus) == 1)
    objc_msgSend(v4, sel_setControlFlags_, 65542);
  objc_msgSend(v4, sel_setBleScreenOffScanRate_, 10);
  objc_msgSend(v4, sel_setBleScreenOffRescanInterval_, 900);
  v5 = swift_bridgeObjectRetain();
  sub_218978DD0(v5);
  swift_bridgeObjectRelease();
  v6 = (void *)sub_218988F94();
  swift_release();
  objc_msgSend(v4, sel_setDeviceFilter_, v6);

  v26 = sub_21897F9EC;
  v27 = v1;
  v7 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v23 = 1107296256;
  v24 = sub_218953F1C;
  v25 = &block_descriptor_78;
  v8 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_setDeviceFoundHandler_, v8);
  _Block_release(v8);
  if (qword_253E6EE80 != -1)
    swift_once();
  v9 = sub_218988E20();
  __swift_project_value_buffer(v9, (uint64_t)qword_253E6EE68);
  swift_bridgeObjectRetain_n();
  v10 = sub_218988E14();
  v11 = sub_218989078();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    aBlock = v13;
    *(_DWORD *)v12 = 136315138;
    swift_bridgeObjectRetain();
    v14 = sub_21898903C();
    v16 = v15;
    swift_bridgeObjectRelease();
    sub_218974338(v14, v16, &aBlock);
    sub_2189890C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2188DF000, v10, v11, "Deliver Statuses START {idsIdentifier: %s}", v12, 0xCu);
    swift_arrayDestroy();
    v17 = v13;
    v7 = MEMORY[0x24BDAC760];
    MEMORY[0x219A1D978](v17, -1, -1);
    MEMORY[0x219A1D978](v12, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v18 = v2 + OBJC_IVAR___SKALocalStatusServer_browseTask;
  v19 = *(void **)(v2 + OBJC_IVAR___SKALocalStatusServer_browseTask);
  *(_QWORD *)v18 = v4;
  *(_QWORD *)(v18 + 8) = a1;
  *(_BYTE *)(v18 + 16) = 0;
  swift_bridgeObjectRetain();
  v20 = v4;
  sub_21897E05C(v19);
  v26 = sub_21897F9F4;
  v27 = v2;
  aBlock = v7;
  v23 = 1107296256;
  v24 = sub_218954870;
  v25 = &block_descriptor_81;
  v21 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v20, sel_activateWithCompletion_, v21);
  _Block_release(v21);

}

uint64_t sub_21896A948(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E840);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21898900C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = sub_218974B58(&qword_255001728, type metadata accessor for SKALocalStatusServer, (uint64_t)&protocol conformance descriptor for SKALocalStatusServer);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a2;
  v9[3] = v8;
  v9[4] = a2;
  v9[5] = a1;
  swift_retain_n();
  v10 = a1;
  sub_21896AF3C((uint64_t)v6, (uint64_t)&unk_255001830, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_21896AA40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 24) = a4;
  *(_QWORD *)(v5 + 32) = a5;
  return swift_task_switch();
}

uint64_t sub_21896AA58()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  void *v30;
  uint8_t *v31;
  id v32;
  _QWORD *v34;
  NSObject *log;
  void *v36;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(void **)(v1 + OBJC_IVAR___SKALocalStatusServer_browseTask);
  if (v2)
  {
    if ((*(_BYTE *)(v1 + OBJC_IVAR___SKALocalStatusServer_browseTask + 16) & 1) != 0)
    {
      v13 = *(void **)(v0 + 32);
      v14 = *(void **)(v1 + 168);
      v15 = v2;
      swift_bridgeObjectRetain();
      v16 = objc_msgSend(v14, sel_newBackgroundContext);
      v17 = objc_msgSend(v13, sel_idsDeviceIdentifier);
      if (v17)
      {
        v18 = v17;
        v19 = sub_218988F28();
        v21 = v20;

      }
      else
      {
        v19 = 0;
        v21 = 0xE000000000000000;
      }
      v22 = sub_21895EDFC(v19, v21);
      swift_bridgeObjectRelease();
      if ((v22 & 1) != 0)
      {
        v23 = objc_msgSend(*(id *)(v0 + 32), sel_description);
        sub_218988F28();

        sub_218988F64();
        swift_bridgeObjectRelease();
        sub_218988F64();
        sub_21895AD14(v16, 0x5B646E756F46, 0xE600000000000000);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_release();
      }
      else
      {
        if (qword_253E6EE80 != -1)
          swift_once();
        v24 = *(void **)(v0 + 32);
        v25 = sub_218988E20();
        __swift_project_value_buffer(v25, (uint64_t)qword_253E6EE68);
        v26 = v24;
        v27 = sub_218988E14();
        v28 = sub_218989078();
        v29 = os_log_type_enabled(v27, v28);
        v30 = *(void **)(v0 + 32);
        if (v29)
        {
          log = v27;
          v31 = (uint8_t *)swift_slowAlloc();
          v34 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v31 = 138412290;
          *(_QWORD *)(v0 + 16) = v30;
          v36 = v15;
          v32 = v30;
          sub_2189890C0();
          *v34 = v30;

          _os_log_impl(&dword_2188DF000, log, v28, "Skip delivery to found device %@", v31, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
          swift_arrayDestroy();
          MEMORY[0x219A1D978](v34, -1, -1);
          MEMORY[0x219A1D978](v31, -1, -1);
          swift_bridgeObjectRelease();

        }
        else
        {

          swift_bridgeObjectRelease();
        }
      }
    }
    else
    {
      v3 = qword_253E6EE80;
      v4 = v2;
      swift_bridgeObjectRetain();
      if (v3 != -1)
        swift_once();
      v5 = sub_218988E20();
      __swift_project_value_buffer(v5, (uint64_t)qword_253E6EE68);
      v6 = sub_218988E14();
      v7 = sub_218989054();
      if (os_log_type_enabled(v6, v7))
      {
        v8 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_2188DF000, v6, v7, "Ignoring device found while companionLink is activating", v8, 2u);
        MEMORY[0x219A1D978](v8, -1, -1);
        swift_bridgeObjectRelease();

      }
      else
      {

        swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    if (qword_253E6EE80 != -1)
      swift_once();
    v9 = sub_218988E20();
    __swift_project_value_buffer(v9, (uint64_t)qword_253E6EE68);
    v10 = sub_218988E14();
    v11 = sub_21898906C();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2188DF000, v10, v11, "Received publish device found without a browserTask. Ignorning", v12, 2u);
      MEMORY[0x219A1D978](v12, -1, -1);
    }

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21896AF3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_21898900C();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_218989000();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_21897FCD4(a1, &qword_253E6E840);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_218988FDC();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

void sub_21896B070(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  os_log_type_t v11;
  uint8_t *v12;
  _QWORD *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  id v23[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E840);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v7 = a1;
    if (qword_253E6EE80 != -1)
      swift_once();
    v8 = sub_218988E20();
    __swift_project_value_buffer(v8, (uint64_t)qword_253E6EE68);
    v9 = a1;
    v10 = a1;
    v23[0] = (id)sub_218988E14();
    v11 = sub_218989060();
    if (os_log_type_enabled((os_log_t)v23[0], v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v12 = 138412290;
      v14 = a1;
      v15 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v23[1] = v15;
      sub_2189890C0();
      *v13 = v15;

      _os_log_impl(&dword_2188DF000, (os_log_t)v23[0], v11, "Failed to activate browseCompanionLink {error: %@}", v12, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v13, -1, -1);
      MEMORY[0x219A1D978](v12, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    if (qword_253E6EE80 != -1)
      swift_once();
    v16 = sub_218988E20();
    __swift_project_value_buffer(v16, (uint64_t)qword_253E6EE68);
    v17 = sub_218988E14();
    v18 = sub_218989078();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_2188DF000, v17, v18, "CompanionLink activate delivery START", v19, 2u);
      MEMORY[0x219A1D978](v19, -1, -1);
    }

    v20 = sub_21898900C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v6, 1, 1, v20);
    v21 = sub_218974B58(&qword_255001728, type metadata accessor for SKALocalStatusServer, (uint64_t)&protocol conformance descriptor for SKALocalStatusServer);
    v22 = (_QWORD *)swift_allocObject();
    v22[2] = a2;
    v22[3] = v21;
    v22[4] = a2;
    swift_retain_n();
    sub_21896AF3C((uint64_t)v6, (uint64_t)&unk_255001820, (uint64_t)v22);
    swift_release();
  }
}

uint64_t sub_21896B3C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[3] = a4;
  v5 = sub_2189891D4();
  v4[4] = v5;
  v4[5] = *(_QWORD *)(v5 - 8);
  v4[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21896B424()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  os_log_t log[2];
  uint64_t (*loga)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  v1 = v0[3];
  v2 = OBJC_IVAR___SKALocalStatusServer_browseTask;
  v0[7] = OBJC_IVAR___SKALocalStatusServer_browseTask;
  v3 = v1 + v2;
  v4 = *(void **)(v1 + v2);
  v0[8] = v4;
  v0[9] = *(_QWORD *)(v3 + 8);
  if (v4)
  {
    v5 = *(void **)(v1 + 168);
    v6 = v4;
    swift_bridgeObjectRetain();
    v7 = objc_msgSend(v5, sel_newBackgroundContext);
    v0[10] = v7;
    v8 = sub_21895AD14(v7, 0xD000000000000015, 0x8000000218993210);
    v0[11] = v8;
    if (v8)
    {
      v9 = (_QWORD *)swift_task_alloc();
      v0[12] = v9;
      *v9 = v0;
      v9[1] = sub_21896B8E8;
      return sub_218989024();
    }
    if (qword_253E6EE80 != -1)
      swift_once();
    v22 = sub_218988E20();
    __swift_project_value_buffer(v22, (uint64_t)qword_253E6EE68);
    v23 = sub_218988E14();
    v24 = sub_21898906C();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_2188DF000, v23, v24, "No delivery task in startNewBrowserActivate. We expected pending deliveries at this point.", v25, 2u);
      MEMORY[0x219A1D978](v25, -1, -1);
    }

    if (qword_253E6EE80 != -1)
      swift_once();
    v11 = sub_218988E20();
    __swift_project_value_buffer(v11, (uint64_t)qword_253E6EE68);
    v12 = sub_218988E14();
    v13 = sub_218989078();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2188DF000, v12, v13, "CompanionLink activate delivery END", v14, 2u);
      MEMORY[0x219A1D978](v14, -1, -1);
    }
    v15 = (void *)v0[10];
    v16 = v0[3] + v0[7];
    *(_OWORD *)log = *((_OWORD *)v0 + 4);

    v17 = *(void **)v16;
    *(_OWORD *)v16 = *(_OWORD *)log;
    *(_BYTE *)(v16 + 16) = 1;
    sub_21897E05C(v17);
    v1 = v0[3];
  }
  v18 = *(_QWORD *)(v1 + OBJC_IVAR___SKALocalStatusServer_screenOffStatusTimeoutSeconds);
  if (v18 == 259200)
    v18 = 302400;
  v19 = 1000000000000000000 * v18;
  v20 = ((v18 >> 63) & 0xF21F494C589C0000) + (((unint64_t)v18 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
  sub_2189891C8();
  loga = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_2550017F8 + dword_2550017F8);
  v21 = (_QWORD *)swift_task_alloc();
  v0[13] = v21;
  *v21 = v0;
  v21[1] = sub_21896BAF8;
  return loga(v19, v20, 0, 0, 1);
}

uint64_t sub_21896B8E8()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21896B940()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  __int128 v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  swift_release();
  if (qword_253E6EE80 != -1)
    swift_once();
  v1 = sub_218988E20();
  __swift_project_value_buffer(v1, (uint64_t)qword_253E6EE68);
  v2 = sub_218988E14();
  v3 = sub_218989078();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2188DF000, v2, v3, "CompanionLink activate delivery END", v4, 2u);
    MEMORY[0x219A1D978](v4, -1, -1);
  }
  v5 = *(_QWORD *)(v0 + 24) + *(_QWORD *)(v0 + 56);
  v12 = *(_OWORD *)(v0 + 64);

  v6 = *(void **)v5;
  *(_OWORD *)v5 = v12;
  *(_BYTE *)(v5 + 16) = 1;
  sub_21897E05C(v6);
  v7 = *(_QWORD *)(*(_QWORD *)(v0 + 24) + OBJC_IVAR___SKALocalStatusServer_screenOffStatusTimeoutSeconds);
  if (v7 == 259200)
    v7 = 302400;
  v8 = 1000000000000000000 * v7;
  v9 = ((v7 >> 63) & 0xF21F494C589C0000) + (((unint64_t)v7 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
  sub_2189891C8();
  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_2550017F8 + dword_2550017F8);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v10;
  *v10 = v0;
  v10[1] = sub_21896BAF8;
  return v13(v8, v9, 0, 0, 1);
}

uint64_t sub_21896BAF8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2[5] + 8))(v2[6], v2[4]);
  return swift_task_switch();
}

uint64_t sub_21896BB6C()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  v1 = *(void **)(*(_QWORD *)(v0 + 24) + *(_QWORD *)(v0 + 56));
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v2, sel_setControlFlags_, 6);
    if (qword_253E6EE80 != -1)
      swift_once();
    v3 = sub_218988E20();
    __swift_project_value_buffer(v3, (uint64_t)qword_253E6EE68);
    v4 = sub_218988E14();
    v5 = sub_218989078();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2188DF000, v4, v5, "Removing bleScreenOff control flag from browseCompanionLink after 3.5 day timeout", v6, 2u);
      MEMORY[0x219A1D978](v6, -1, -1);
    }

  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21896BC80()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21896BCB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v8[41] = a7;
  v8[42] = a8;
  v8[39] = a5;
  v8[40] = a6;
  v8[38] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E840);
  v8[43] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255001550);
  v8[44] = swift_task_alloc();
  v9 = sub_218988BF8();
  v8[45] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v8[46] = v10;
  v8[47] = *(_QWORD *)(v10 + 64);
  v8[48] = swift_task_alloc();
  v8[49] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21896BD7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  _BOOL4 v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  void (*v51)(unint64_t, uint64_t, uint64_t);
  double v52;
  double v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  os_log_type_t v77;
  uint8_t *v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  NSObject *v82;
  os_log_type_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  os_log_type_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void (*v96)(unint64_t, uint64_t, uint64_t);
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101[2];

  v1 = *(_QWORD *)(v0 + 312);
  v2 = sub_21895CE7C(*(_QWORD *)(v0 + 304), v0 + 240, (SEL *)&selRef_idsIdentifier);
  *(_QWORD *)(v0 + 400) = 0;
  v3 = sub_21897BD40(v2);
  *(_QWORD *)(v0 + 408) = v3;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 288) = v3;
  v4 = OBJC_IVAR___SKALocalStatusServer_browseTask;
  *(_QWORD *)(v0 + 416) = OBJC_IVAR___SKALocalStatusServer_browseTask;
  v5 = v1 + v4;
  v6 = *(void **)v5;
  *(_QWORD *)(v0 + 424) = *(_QWORD *)v5;
  if (v6)
  {
    *(_QWORD *)(v0 + 432) = *(_QWORD *)(v5 + 8);
    swift_bridgeObjectRetain();
    sub_21897F2DC(v6);
    if (qword_253E6EE80 != -1)
      swift_once();
    v7 = sub_218988E20();
    *(_QWORD *)(v0 + 440) = __swift_project_value_buffer(v7, (uint64_t)qword_253E6EE68);
    swift_bridgeObjectRetain_n();
    v8 = v6;
    swift_bridgeObjectRetain_n();
    v9 = v8;
    v10 = sub_218988E14();
    v11 = sub_218989078();
    v12 = os_log_type_enabled(v10, v11);
    v13 = *(_QWORD *)(v0 + 328);
    if (v12)
    {
      v92 = v11;
      v14 = *(_QWORD *)(v0 + 320);
      v15 = swift_slowAlloc();
      v100 = swift_slowAlloc();
      v101[0] = v100;
      *(_DWORD *)v15 = 136315650;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 280) = sub_218974338(v14, v13, v101);
      sub_2189890C0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v15 + 12) = 2048;
      swift_beginAccess();
      *(_QWORD *)(v0 + 296) = *(_QWORD *)(*(_QWORD *)(v0 + 288) + 16);
      sub_2189890C0();
      *(_WORD *)(v15 + 22) = 2048;
      v16 = objc_msgSend(v9, byte_24D98DDF4);
      sub_21897FBC8(0, &qword_255001748);
      v17 = sub_218988FA0();

      if (v17 >> 62)
      {
        swift_bridgeObjectRetain();
        v18 = sub_2189891F8();
        swift_bridgeObjectRelease();
      }
      else
      {
        v18 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      *(_QWORD *)(v0 + 272) = v18;
      sub_2189890C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2188DF000, v10, v92, "deliverAllPendingStatuses CONTINUE. Resuming task {reason: %s, pendingIDSIdentifiers.count: %ld, activeDevices.count: %ld}", (uint8_t *)v15, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v100, -1, -1);
      MEMORY[0x219A1D978](v15, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

    }
    v19 = objc_msgSend(v9, sel_activeDevices);
    sub_21897FBC8(0, &qword_255001748);
    v20 = sub_218988FA0();
    *(_QWORD *)(v0 + 448) = v20;

    if (v20 >> 62)
    {
      swift_bridgeObjectRetain();
      v21 = sub_2189891F8();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 456) = v21;
      if (v21)
        goto LABEL_12;
    }
    else
    {
      v21 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
      *(_QWORD *)(v0 + 456) = v21;
      if (v21)
      {
LABEL_12:
        if (v21 >= 1)
        {
          swift_beginAccess();
          v22 = 0;
          while (1)
          {
            *(_QWORD *)(v0 + 464) = v22;
            v23 = *(_QWORD *)(v0 + 448);
            if ((v23 & 0xC000000000000001) != 0)
              v24 = MEMORY[0x219A1CED4]();
            else
              v24 = *(id *)(v23 + 8 * v22 + 32);
            v25 = v24;
            *(_QWORD *)(v0 + 472) = v24;
            v26 = -[NSObject idsDeviceIdentifier](v24, sel_idsDeviceIdentifier);
            if (v26)
            {
              v27 = v26;
              v28 = sub_218988F28();
              v30 = v29;

              *(_QWORD *)(v0 + 480) = v28;
              *(_QWORD *)(v0 + 488) = v30;
              v31 = *(_QWORD *)(v0 + 288);
              swift_bridgeObjectRetain();
              v32 = sub_21895E7C8(v28, v30, v31);
              swift_bridgeObjectRelease();
              if ((v32 & 1) != 0)
              {
                if ((sub_21895EDFC(v28, v30) & 1) != 0)
                {
                  v37 = (_QWORD *)swift_task_alloc();
                  *(_QWORD *)(v0 + 496) = v37;
                  *v37 = v0;
                  v37[1] = sub_21896CC84;
                  return sub_21895F3B8((uint64_t)v25, *(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 336));
                }
                swift_bridgeObjectRelease();
                v25 = v25;
                v33 = sub_218988E14();
                v34 = sub_218989078();
                if (os_log_type_enabled(v33, v34))
                {
                  v35 = swift_slowAlloc();
                  v36 = (_QWORD *)swift_slowAlloc();
                  *(_DWORD *)v35 = 138412290;
                  *(_QWORD *)(v35 + 4) = v25;
                  *v36 = v25;
                  _os_log_impl(&dword_2188DF000, v33, v34, "Skip delivery to active device %@", (uint8_t *)v35, 0xCu);
                  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
                  swift_arrayDestroy();
                  MEMORY[0x219A1D978](v36, -1, -1);
                  MEMORY[0x219A1D978](v35, -1, -1);

                }
                else
                {

                  v25 = v33;
                }
              }
              else
              {
                swift_bridgeObjectRelease();
              }
            }

            v22 = *(_QWORD *)(v0 + 464) + 1;
            if (v22 == *(_QWORD *)(v0 + 456))
              goto LABEL_27;
          }
        }
        __break(1u);
LABEL_62:
        swift_once();
        goto LABEL_55;
      }
    }
LABEL_27:
    v39 = *(void **)(v0 + 424);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRetain();
  }
  v40 = *(_QWORD *)(v0 + 360);
  v41 = *(_QWORD *)(v0 + 368);
  v42 = *(char **)(v0 + 352);
  swift_beginAccess();
  v43 = swift_bridgeObjectRetain();
  v44 = sub_21895D138(v43);
  swift_bridgeObjectRelease();
  sub_21896D874(v44, v42);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v42, 1, v40) == 1)
  {
    v45 = *(_QWORD *)(v0 + 312);
    sub_21897FCD4(*(_QWORD *)(v0 + 352), &qword_255001550);
    v46 = (_QWORD *)(v45 + OBJC_IVAR___SKALocalStatusServer_failedDeliveryRetryTask);
    swift_beginAccess();
    if (*v46)
    {
      if (qword_253E6EE80 != -1)
        swift_once();
      v47 = sub_218988E20();
      __swift_project_value_buffer(v47, (uint64_t)qword_253E6EE68);
      v48 = sub_218988E14();
      v49 = sub_218989078();
      if (os_log_type_enabled(v48, v49))
      {
        v50 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v50 = 0;
        _os_log_impl(&dword_2188DF000, v48, v49, "failedDeliveryRetryTask CANCELLED {reason: no failed deliveries}", v50, 2u);
        MEMORY[0x219A1D978](v50, -1, -1);
      }

      if (*v46)
      {
        swift_retain();
        sub_218989018();
        swift_release();
      }
      *v46 = 0;
      swift_release();
    }
  }
  else
  {
    v51 = *(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 368) + 32);
    v51(*(_QWORD *)(v0 + 392), *(_QWORD *)(v0 + 352), *(_QWORD *)(v0 + 360));
    sub_218988BC8();
    v53 = v52;
    if (v52 <= 0.0)
    {
      if (qword_253E6EE80 != -1)
        swift_once();
      v68 = sub_218988E20();
      __swift_project_value_buffer(v68, (uint64_t)qword_253E6EE68);
      v69 = sub_218988E14();
      v70 = sub_21898906C();
      if (os_log_type_enabled(v69, v70))
      {
        v71 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v71 = 134217984;
        *(double *)(v0 + 248) = v53;
        sub_2189890C0();
        _os_log_impl(&dword_2188DF000, v69, v70, "failedDeliveryRetryTask FAILED. Invalid sleepSeconds {sleepSeconds: %f}", v71, 0xCu);
        MEMORY[0x219A1D978](v71, -1, -1);
      }
      v72 = *(_QWORD *)(v0 + 392);
      v73 = *(_QWORD *)(v0 + 360);
      v74 = *(_QWORD *)(v0 + 368);

      (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v72, v73);
    }
    else
    {
      v96 = v51;
      v54 = (uint64_t *)(*(_QWORD *)(v0 + 312) + OBJC_IVAR___SKALocalStatusServer_failedDeliveryRetryTask);
      swift_beginAccess();
      v98 = v54;
      if (*v54)
      {
        swift_retain();
        sub_218989018();
        swift_release();
      }
      v56 = *(_QWORD *)(v0 + 384);
      v55 = *(_QWORD *)(v0 + 392);
      v57 = *(_QWORD *)(v0 + 368);
      v58 = *(_QWORD *)(v0 + 376);
      v59 = *(_QWORD *)(v0 + 360);
      v60 = *(_QWORD *)(v0 + 344);
      v93 = v55;
      v94 = v60;
      v61 = *(_QWORD *)(v0 + 312);
      v62 = sub_21898900C();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v62 - 8) + 56))(v60, 1, 1, v62);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 16))(v56, v55, v59);
      v63 = sub_218974B58(&qword_255001728, type metadata accessor for SKALocalStatusServer, (uint64_t)&protocol conformance descriptor for SKALocalStatusServer);
      v64 = (*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
      v65 = (v58 + v64 + 7) & 0xFFFFFFFFFFFFFFF8;
      v66 = swift_allocObject();
      *(_QWORD *)(v66 + 16) = v61;
      *(_QWORD *)(v66 + 24) = v63;
      v96(v66 + v64, v56, v59);
      *(double *)(v66 + v65) = v53;
      *(_QWORD *)(v66 + ((v65 + 15) & 0xFFFFFFFFFFFFFFF8)) = v61;
      swift_retain_n();
      v67 = sub_21894F800(v94, (uint64_t)&unk_255001740, v66);
      (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v93, v59);
      *v98 = v67;
      swift_release();
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(v0 + 312) + *(_QWORD *)(v0 + 416)))
  {
    swift_bridgeObjectRelease();
    swift_beginAccess();
    if (!*(_QWORD *)(*(_QWORD *)(v0 + 288) + 16))
    {
      if (qword_253E6EE80 != -1)
        swift_once();
      v75 = sub_218988E20();
      __swift_project_value_buffer(v75, (uint64_t)qword_253E6EE68);
      v76 = sub_218988E14();
      v77 = sub_218989078();
      if (os_log_type_enabled(v76, v77))
      {
        v78 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v78 = 0;
        _os_log_impl(&dword_2188DF000, v76, v77, "failedDeliveryRetryTask CANCELLED {reason: no pending IDS Identifiers}", v78, 2u);
        MEMORY[0x219A1D978](v78, -1, -1);
      }
      v79 = *(_QWORD *)(v0 + 312);

      v80 = (_QWORD *)(v79 + OBJC_IVAR___SKALocalStatusServer_failedDeliveryRetryTask);
      swift_beginAccess();
      if (*v80)
      {
        swift_retain();
        sub_218989018();
        swift_release();
      }
      *v80 = 0;
      swift_release();
      sub_21895AA8C();
    }
    goto LABEL_60;
  }
  if (qword_253E6EE80 != -1)
    goto LABEL_62;
LABEL_55:
  v81 = sub_218988E20();
  __swift_project_value_buffer(v81, (uint64_t)qword_253E6EE68);
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  v82 = sub_218988E14();
  v83 = sub_218989078();
  if (os_log_type_enabled(v82, v83))
  {
    v97 = *(_QWORD *)(v0 + 416);
    v95 = *(_QWORD *)(v0 + 312);
    v84 = swift_slowAlloc();
    v99 = swift_slowAlloc();
    v101[0] = v99;
    *(_DWORD *)v84 = 136315650;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v85 = sub_21898903C();
    v87 = v86;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 256) = sub_218974338(v85, v87, v101);
    sub_2189890C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v84 + 12) = 2080;
    swift_bridgeObjectRetain();
    v88 = sub_21898903C();
    v90 = v89;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 232) = sub_218974338(v88, v90, v101);
    sub_2189890C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v84 + 22) = 1024;
    v91 = *(_QWORD *)(v95 + v97);
    swift_release();
    *(_DWORD *)(v0 + 504) = v91 == 0;
    sub_2189890C0();
    swift_release();
    _os_log_impl(&dword_2188DF000, v82, v83, "Starting new browser task: {pendingIDSIdentifiers: %s, originalPendingIDSIdentifiers: %s, browserTask.isNill: %{BOOL}d}", (uint8_t *)v84, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x219A1D978](v99, -1, -1);
    MEMORY[0x219A1D978](v84, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  sub_21896A574(*(_QWORD *)(v0 + 408));
  swift_bridgeObjectRelease();
LABEL_60:
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21896CC84(char a1)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)v1 + 508) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21896CCE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t i;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  _QWORD *v30;
  void (*v31)(unint64_t, uint64_t, uint64_t);
  double v32;
  double v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(unint64_t, uint64_t, uint64_t);
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81[2];

  if ((*(_BYTE *)(v0 + 508) & 1) != 0)
  {
    v1 = *(_QWORD *)(v0 + 480);
    v2 = *(_QWORD *)(v0 + 488);
    v3 = *(void **)(v0 + 472);
    swift_beginAccess();
    sub_21897893C(v1, v2);
    swift_endAccess();
    swift_bridgeObjectRelease();

  }
  else
  {

  }
  swift_bridgeObjectRelease();
  for (i = *(_QWORD *)(v0 + 464) + 1; i != *(_QWORD *)(v0 + 456); i = *(_QWORD *)(v0 + 464) + 1)
  {
    *(_QWORD *)(v0 + 464) = i;
    v17 = *(_QWORD *)(v0 + 448);
    if ((v17 & 0xC000000000000001) != 0)
      v18 = MEMORY[0x219A1CED4]();
    else
      v18 = *(id *)(v17 + 8 * i + 32);
    v19 = v18;
    *(_QWORD *)(v0 + 472) = v18;
    v20 = -[NSObject idsDeviceIdentifier](v18, sel_idsDeviceIdentifier);
    if (v20)
    {
      v21 = v20;
      v22 = sub_218988F28();
      v24 = v23;

      *(_QWORD *)(v0 + 480) = v22;
      *(_QWORD *)(v0 + 488) = v24;
      v25 = *(_QWORD *)(v0 + 288);
      swift_bridgeObjectRetain();
      v26 = sub_21895E7C8(v22, v24, v25);
      swift_bridgeObjectRelease();
      if ((v26 & 1) != 0)
      {
        if ((sub_21895EDFC(v22, v24) & 1) != 0)
        {
          v55 = (_QWORD *)swift_task_alloc();
          *(_QWORD *)(v0 + 496) = v55;
          *v55 = v0;
          v55[1] = sub_21896CC84;
          return sub_21895F3B8((uint64_t)v19, *(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 336));
        }
        swift_bridgeObjectRelease();
        v19 = v19;
        v27 = sub_218988E14();
        v28 = sub_218989078();
        if (os_log_type_enabled(v27, v28))
        {
          v29 = swift_slowAlloc();
          v30 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v29 = 138412290;
          *(_QWORD *)(v29 + 4) = v19;
          *v30 = v19;
          _os_log_impl(&dword_2188DF000, v27, v28, "Skip delivery to active device %@", (uint8_t *)v29, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
          swift_arrayDestroy();
          MEMORY[0x219A1D978](v30, -1, -1);
          MEMORY[0x219A1D978](v29, -1, -1);

        }
        else
        {

          v19 = v27;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }

  }
  v5 = *(void **)(v0 + 424);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v7 = *(_QWORD *)(v0 + 360);
  v6 = *(_QWORD *)(v0 + 368);
  v8 = *(char **)(v0 + 352);
  swift_beginAccess();
  v9 = swift_bridgeObjectRetain();
  v10 = sub_21895D138(v9);
  swift_bridgeObjectRelease();
  sub_21896D874(v10, v8);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v8, 1, v7) == 1)
  {
    v11 = *(_QWORD *)(v0 + 312);
    sub_21897FCD4(*(_QWORD *)(v0 + 352), &qword_255001550);
    v12 = (_QWORD *)(v11 + OBJC_IVAR___SKALocalStatusServer_failedDeliveryRetryTask);
    swift_beginAccess();
    if (*v12)
    {
      if (qword_253E6EE80 != -1)
        swift_once();
      v13 = sub_218988E20();
      __swift_project_value_buffer(v13, (uint64_t)qword_253E6EE68);
      v14 = sub_218988E14();
      v15 = sub_218989078();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_2188DF000, v14, v15, "failedDeliveryRetryTask CANCELLED {reason: no failed deliveries}", v16, 2u);
        MEMORY[0x219A1D978](v16, -1, -1);
      }

      if (*v12)
      {
        swift_retain();
        sub_218989018();
        swift_release();
      }
      *v12 = 0;
      swift_release();
    }
  }
  else
  {
    v31 = *(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 368) + 32);
    v31(*(_QWORD *)(v0 + 392), *(_QWORD *)(v0 + 352), *(_QWORD *)(v0 + 360));
    sub_218988BC8();
    v33 = v32;
    if (v32 <= 0.0)
    {
      if (qword_253E6EE80 != -1)
        swift_once();
      v48 = sub_218988E20();
      __swift_project_value_buffer(v48, (uint64_t)qword_253E6EE68);
      v49 = sub_218988E14();
      v50 = sub_21898906C();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v51 = 134217984;
        *(double *)(v0 + 248) = v33;
        sub_2189890C0();
        _os_log_impl(&dword_2188DF000, v49, v50, "failedDeliveryRetryTask FAILED. Invalid sleepSeconds {sleepSeconds: %f}", v51, 0xCu);
        MEMORY[0x219A1D978](v51, -1, -1);
      }
      v52 = *(_QWORD *)(v0 + 392);
      v53 = *(_QWORD *)(v0 + 360);
      v54 = *(_QWORD *)(v0 + 368);

      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v52, v53);
    }
    else
    {
      v78 = v31;
      v34 = (uint64_t *)(*(_QWORD *)(v0 + 312) + OBJC_IVAR___SKALocalStatusServer_failedDeliveryRetryTask);
      swift_beginAccess();
      v80 = v34;
      if (*v34)
      {
        swift_retain();
        sub_218989018();
        swift_release();
      }
      v36 = *(_QWORD *)(v0 + 384);
      v35 = *(_QWORD *)(v0 + 392);
      v37 = *(_QWORD *)(v0 + 368);
      v38 = *(_QWORD *)(v0 + 376);
      v39 = *(_QWORD *)(v0 + 360);
      v40 = *(_QWORD *)(v0 + 344);
      v74 = v35;
      v76 = v40;
      v41 = *(_QWORD *)(v0 + 312);
      v42 = sub_21898900C();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v40, 1, 1, v42);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v36, v35, v39);
      v43 = sub_218974B58(&qword_255001728, type metadata accessor for SKALocalStatusServer, (uint64_t)&protocol conformance descriptor for SKALocalStatusServer);
      v44 = (*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
      v45 = (v38 + v44 + 7) & 0xFFFFFFFFFFFFFFF8;
      v46 = swift_allocObject();
      *(_QWORD *)(v46 + 16) = v41;
      *(_QWORD *)(v46 + 24) = v43;
      v78(v46 + v44, v36, v39);
      *(double *)(v46 + v45) = v33;
      *(_QWORD *)(v46 + ((v45 + 15) & 0xFFFFFFFFFFFFFFF8)) = v41;
      swift_retain_n();
      v47 = sub_21894F800(v76, (uint64_t)&unk_255001740, v46);
      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v74, v39);
      *v80 = v47;
      swift_release();
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(v0 + 312) + *(_QWORD *)(v0 + 416)))
  {
    swift_bridgeObjectRelease();
    swift_beginAccess();
    if (!*(_QWORD *)(*(_QWORD *)(v0 + 288) + 16))
    {
      if (qword_253E6EE80 != -1)
        swift_once();
      v57 = sub_218988E20();
      __swift_project_value_buffer(v57, (uint64_t)qword_253E6EE68);
      v58 = sub_218988E14();
      v59 = sub_218989078();
      if (os_log_type_enabled(v58, v59))
      {
        v60 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v60 = 0;
        _os_log_impl(&dword_2188DF000, v58, v59, "failedDeliveryRetryTask CANCELLED {reason: no pending IDS Identifiers}", v60, 2u);
        MEMORY[0x219A1D978](v60, -1, -1);
      }
      v61 = *(_QWORD *)(v0 + 312);

      v62 = (_QWORD *)(v61 + OBJC_IVAR___SKALocalStatusServer_failedDeliveryRetryTask);
      swift_beginAccess();
      if (*v62)
      {
        swift_retain();
        sub_218989018();
        swift_release();
      }
      *v62 = 0;
      swift_release();
      sub_21895AA8C();
    }
  }
  else
  {
    if (qword_253E6EE80 != -1)
      swift_once();
    v63 = sub_218988E20();
    __swift_project_value_buffer(v63, (uint64_t)qword_253E6EE68);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    v64 = sub_218988E14();
    v65 = sub_218989078();
    if (os_log_type_enabled(v64, v65))
    {
      v77 = *(_QWORD *)(v0 + 416);
      v75 = *(_QWORD *)(v0 + 312);
      v66 = swift_slowAlloc();
      v79 = swift_slowAlloc();
      v81[0] = v79;
      *(_DWORD *)v66 = 136315650;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      v67 = sub_21898903C();
      v69 = v68;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 256) = sub_218974338(v67, v69, v81);
      sub_2189890C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v66 + 12) = 2080;
      swift_bridgeObjectRetain();
      v70 = sub_21898903C();
      v72 = v71;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 232) = sub_218974338(v70, v72, v81);
      sub_2189890C0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v66 + 22) = 1024;
      v73 = *(_QWORD *)(v75 + v77);
      swift_release();
      *(_DWORD *)(v0 + 504) = v73 == 0;
      sub_2189890C0();
      swift_release();
      _os_log_impl(&dword_2188DF000, v64, v65, "Starting new browser task: {pendingIDSIdentifiers: %s, originalPendingIDSIdentifiers: %s, browserTask.isNill: %{BOOL}d}", (uint8_t *)v66, 0x1Cu);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v79, -1, -1);
      MEMORY[0x219A1D978](v66, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
    sub_21896A574(*(_QWORD *)(v0 + 408));
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21896D874@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v19)(char *, uint64_t, uint64_t);
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unint64_t v26;
  char v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  char *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, unint64_t, uint64_t);

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255001550);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v29 - v8;
  v10 = sub_218988BF8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v29 - v15;
  v17 = *(_QWORD *)(a1 + 16);
  if (!v17)
  {
    v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v18(v9, 1, 1, v10);
    goto LABEL_7;
  }
  v31 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v34 = *(void (**)(char *, unint64_t, uint64_t))(v11 + 16);
  v34(v9, a1 + v31, v10);
  v32 = a1;
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v18(v9, 0, 1, v10);
  v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v19(v9, 1, v10) == 1)
  {
LABEL_7:
    sub_21897FCD4((uint64_t)v9, &qword_255001550);
    v23 = a2;
    v24 = 1;
    return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v18)(v23, v24, 1, v10);
  }
  v30 = a2;
  v20 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v20(v16, v9, v10);
  swift_bridgeObjectRetain();
  v21 = v17 - 1;
  if (v21)
  {
    v33 = *(_QWORD *)(v11 + 72);
    v26 = v32 + v33 + v31;
    while (1)
    {
      v34(v7, v26, v10);
      v18(v7, 0, 1, v10);
      if (v19(v7, 1, v10) == 1)
        break;
      v20(v14, v7, v10);
      sub_218974B58(&qword_255001838, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
      v27 = sub_218988F04();
      v28 = *(void (**)(char *, uint64_t))(v11 + 8);
      if ((v27 & 1) != 0)
      {
        v28(v16, v10);
        v20(v16, v14, v10);
      }
      else
      {
        v28(v14, v10);
      }
      v26 += v33;
      if (!--v21)
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    v18(v7, 1, 1, v10);
  }
  swift_bridgeObjectRelease();
  sub_21897FCD4((uint64_t)v7, &qword_255001550);
  v22 = v30;
  v20(v30, v16, v10);
  v23 = v22;
  v24 = 0;
  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v18)(v23, v24, 1, v10);
}

uint64_t sub_21896DB5C(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v6 + 200) = a6;
  *(double *)(v6 + 192) = a1;
  *(_QWORD *)(v6 + 184) = a5;
  v7 = sub_2189891D4();
  *(_QWORD *)(v6 + 208) = v7;
  *(_QWORD *)(v6 + 216) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v6 + 224) = swift_task_alloc();
  v8 = sub_218988CF4();
  *(_QWORD *)(v6 + 232) = v8;
  *(_QWORD *)(v6 + 240) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v6 + 248) = swift_task_alloc();
  v9 = sub_218988D00();
  *(_QWORD *)(v6 + 256) = v9;
  *(_QWORD *)(v6 + 264) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v6 + 272) = swift_task_alloc();
  v10 = sub_218988BF8();
  *(_QWORD *)(v6 + 280) = v10;
  *(_QWORD *)(v6 + 288) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v6 + 296) = swift_task_alloc();
  *(_QWORD *)(v6 + 304) = swift_task_alloc();
  *(_QWORD *)(v6 + 312) = swift_task_alloc();
  *(_QWORD *)(v6 + 320) = swift_task_alloc();
  return swift_task_switch();
}

void sub_21896DC68()
{
  double *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  double v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  os_log_type_t type;
  void (*typea)(uint64_t, uint64_t, uint64_t, uint64_t, char);
  uint64_t v29;

  if (qword_253E6EE80 != -1)
    swift_once();
  v1 = *((_QWORD *)v0 + 23);
  v2 = *((_QWORD *)v0 + 40);
  v3 = *((_QWORD *)v0 + 35);
  v4 = *((_QWORD *)v0 + 36);
  v5 = sub_218988E20();
  *((_QWORD *)v0 + 41) = __swift_project_value_buffer(v5, (uint64_t)qword_253E6EE68);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  *((_QWORD *)v0 + 42) = v6;
  v6(v2, v1, v3);
  v7 = sub_218988E14();
  v8 = sub_218989078();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *((_QWORD *)v0 + 40);
  if (v9)
  {
    v11 = *((_QWORD *)v0 + 34);
    v23 = *((_QWORD *)v0 + 33);
    v12 = *((_QWORD *)v0 + 31);
    v13 = *((_QWORD *)v0 + 32);
    type = v8;
    v15 = *((_QWORD *)v0 + 29);
    v14 = *((_QWORD *)v0 + 30);
    v16 = *((_QWORD *)v0 + 24);
    v24 = *((_QWORD *)v0 + 36);
    v25 = *((_QWORD *)v0 + 35);
    v17 = swift_slowAlloc();
    v26 = swift_slowAlloc();
    v29 = v26;
    *(_DWORD *)v17 = 136315394;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v14 + 104))(v12, *MEMORY[0x24BE60A28], v15);
    sub_218988B14();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v15);
    sub_218974B58(&qword_255001800, (uint64_t (*)(uint64_t))MEMORY[0x24BE60A38], MEMORY[0x24BE60A20]);
    sub_218988BEC();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v11, v13);
    *((_QWORD *)v0 + 21) = sub_218974338(*((_QWORD *)v0 + 7), *((_QWORD *)v0 + 8), &v29);
    sub_2189890C0();
    swift_bridgeObjectRelease();
    v18 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    v18(v10, v25);
    *(_WORD *)(v17 + 12) = 2048;
    *((_QWORD *)v0 + 22) = v16;
    sub_2189890C0();
    _os_log_impl(&dword_2188DF000, v7, type, "failedDeliveryRetryTask SCHEDULED {nextAttemptDate: %s, sleepSeconds: %f}", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x219A1D978](v26, -1, -1);
    MEMORY[0x219A1D978](v17, -1, -1);
  }
  else
  {
    v18 = *(void (**)(uint64_t, uint64_t))(*((_QWORD *)v0 + 36) + 8);
    v18(*((_QWORD *)v0 + 40), *((_QWORD *)v0 + 35));
  }

  *((_QWORD *)v0 + 43) = v18;
  v19 = v0[24] + 5.0;
  if ((~*(_QWORD *)&v19 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v19 <= -9.22337204e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v19 < 9.22337204e18)
  {
    v20 = 1000000000000000000 * (uint64_t)v19;
    v21 = (((uint64_t)v19 >> 63) & 0xF21F494C589C0000)
        + (((unint64_t)(uint64_t)v19 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
    sub_2189891C8();
    typea = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_2550017F8 + dword_2550017F8);
    v22 = (_QWORD *)swift_task_alloc();
    *((_QWORD *)v0 + 44) = v22;
    *v22 = v0;
    v22[1] = sub_21896DFD0;
    typea(v20, v21, 0, 0, 1);
    return;
  }
LABEL_12:
  __break(1u);
}

uint64_t sub_21896DFD0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 360) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2[27] + 8))(v2[28], v2[26]);
  return swift_task_switch();
}

uint64_t sub_21896E044()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  uint64_t v19;

  v1 = *(void **)(v0 + 360);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 336))(*(_QWORD *)(v0 + 296), *(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 280));
  v2 = sub_218988E14();
  v3 = sub_218989078();
  if (os_log_type_enabled(v2, v3))
  {
    v14 = *(_QWORD *)(v0 + 296);
    v4 = *(_QWORD *)(v0 + 272);
    v16 = *(_QWORD *)(v0 + 280);
    v17 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
    v5 = *(_QWORD *)(v0 + 256);
    v15 = *(_QWORD *)(v0 + 264);
    v6 = *(_QWORD *)(v0 + 240);
    v7 = *(_QWORD *)(v0 + 248);
    v18 = v1;
    v8 = *(_QWORD *)(v0 + 232);
    v9 = *(_QWORD *)(v0 + 192);
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v19 = v11;
    *(_DWORD *)v10 = 136315394;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v7, *MEMORY[0x24BE60A28], v8);
    sub_218988B14();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
    sub_218974B58(&qword_255001800, (uint64_t (*)(uint64_t))MEMORY[0x24BE60A38], MEMORY[0x24BE60A20]);
    sub_218988BEC();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v4, v5);
    *(_QWORD *)(v0 + 160) = sub_218974338(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), &v19);
    sub_2189890C0();
    swift_bridgeObjectRelease();
    v17(v14, v16);
    *(_WORD *)(v10 + 12) = 2048;
    *(_QWORD *)(v0 + 136) = v9;
    sub_2189890C0();
    _os_log_impl(&dword_2188DF000, v2, v3, "failedDeliveryRetryTask CANCELLED {nextAttemptDate: %s, sleepSeconds: %f}", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x219A1D978](v11, -1, -1);
    MEMORY[0x219A1D978](v10, -1, -1);
    v12 = v18;
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0 + 344))(*(_QWORD *)(v0 + 296), *(_QWORD *)(v0 + 280));
    v12 = v1;
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21896E2D8()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
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
  id v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t, uint64_t);
  void *v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  void (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  NSObject *v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void (*v53)(uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(uint64_t, uint64_t);
  void (*typea)(uint64_t, uint64_t);
  void *type;
  os_log_type_t typeb;
  os_log_type_t typec;
  NSObject *log;
  unsigned int v74;
  unsigned int v75;
  void *v76;
  uint64_t v77;
  unint64_t v78;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 336))(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 280));
  v1 = sub_218988E14();
  v2 = sub_218989078();
  if (os_log_type_enabled(v1, v2))
  {
    v60 = *(_QWORD *)(v0 + 312);
    v3 = *(_QWORD *)(v0 + 272);
    v65 = *(_QWORD *)(v0 + 280);
    typea = *(void (**)(uint64_t, uint64_t))(v0 + 344);
    v4 = *(_QWORD *)(v0 + 256);
    v62 = *(_QWORD *)(v0 + 264);
    v5 = *(_QWORD *)(v0 + 240);
    v6 = *(_QWORD *)(v0 + 248);
    v7 = *(_QWORD *)(v0 + 232);
    v8 = *(_QWORD *)(v0 + 192);
    v9 = swift_slowAlloc();
    v10 = swift_slowAlloc();
    v77 = v10;
    *(_DWORD *)v9 = 136315394;
    v74 = *MEMORY[0x24BE60A28];
    (*(void (**)(uint64_t))(v5 + 104))(v6);
    sub_218988B14();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
    sub_218974B58(&qword_255001800, (uint64_t (*)(uint64_t))MEMORY[0x24BE60A38], MEMORY[0x24BE60A20]);
    sub_218988BEC();
    (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v3, v4);
    *(_QWORD *)(v0 + 144) = sub_218974338(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), &v77);
    sub_2189890C0();
    swift_bridgeObjectRelease();
    typea(v60, v65);
    *(_WORD *)(v9 + 12) = 2048;
    *(_QWORD *)(v0 + 152) = v8;
    sub_2189890C0();
    _os_log_impl(&dword_2188DF000, v1, v2, "failedDeliveryRetryTask FIRED {nextAttemptDate: %s, sleepSeconds: %f}", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x219A1D978](v10, -1, -1);
    MEMORY[0x219A1D978](v9, -1, -1);

    v11 = v74;
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0 + 344))(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 280));

    v11 = *MEMORY[0x24BE60A28];
  }
  *(_DWORD *)(v0 + 424) = v11;
  v12 = *(_QWORD *)(v0 + 272);
  v66 = *(_QWORD *)(v0 + 264);
  type = *(void **)(v0 + 360);
  v14 = *(_QWORD *)(v0 + 248);
  v13 = *(_QWORD *)(v0 + 256);
  v16 = *(_QWORD *)(v0 + 232);
  v15 = *(_QWORD *)(v0 + 240);
  v17 = objc_msgSend(*(id *)(*(_QWORD *)(v0 + 200) + 168), sel_newBackgroundContext);
  *(_QWORD *)(v0 + 368) = v17;
  v77 = 0;
  v78 = 0xE000000000000000;
  sub_218989150();
  swift_bridgeObjectRelease();
  v77 = 0xD000000000000018;
  v78 = 0x80000002189931F0;
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 104);
  *(_QWORD *)(v0 + 376) = v18;
  v75 = v11;
  v18(v14, v11, v16);
  sub_218988B14();
  v19 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  *(_QWORD *)(v0 + 384) = v19;
  v19(v14, v16);
  *(_QWORD *)(v0 + 392) = sub_218974B58(&qword_255001800, (uint64_t (*)(uint64_t))MEMORY[0x24BE60A38], MEMORY[0x24BE60A20]);
  sub_218988BEC();
  v20 = *(void (**)(uint64_t, uint64_t))(v66 + 8);
  *(_QWORD *)(v0 + 400) = v20;
  v20(v12, v13);
  sub_218988F64();
  swift_bridgeObjectRelease();
  sub_218988F64();
  v21 = type;
  v22 = sub_21895AD14(v17, v77, v78);
  *(_QWORD *)(v0 + 408) = v22;
  swift_bridgeObjectRelease();
  if (type)
  {

    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 336))(*(_QWORD *)(v0 + 296), *(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 280));
    v23 = sub_218988E14();
    v24 = sub_218989078();
    v25 = os_log_type_enabled(v23, v24);
    v26 = *(_QWORD *)(v0 + 296);
    if (v25)
    {
      log = v23;
      v27 = *(_QWORD *)(v0 + 272);
      v58 = *(_QWORD *)(v0 + 264);
      typeb = v24;
      v28 = *(_QWORD *)(v0 + 248);
      v29 = *(_QWORD *)(v0 + 256);
      v31 = *(_QWORD *)(v0 + 232);
      v30 = *(_QWORD *)(v0 + 240);
      v32 = *(_QWORD *)(v0 + 192);
      v61 = *(_QWORD *)(v0 + 280);
      v63 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
      v33 = swift_slowAlloc();
      v67 = swift_slowAlloc();
      v77 = v67;
      *(_DWORD *)v33 = 136315394;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v30 + 104))(v28, v75, v31);
      sub_218988B14();
      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v31);
      sub_218988BEC();
      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v27, v29);
      *(_QWORD *)(v0 + 160) = sub_218974338(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), &v77);
      sub_2189890C0();
      swift_bridgeObjectRelease();
      v63(v26, v61);
      *(_WORD *)(v33 + 12) = 2048;
      *(_QWORD *)(v0 + 136) = v32;
      sub_2189890C0();
      _os_log_impl(&dword_2188DF000, log, typeb, "failedDeliveryRetryTask CANCELLED {nextAttemptDate: %s, sleepSeconds: %f}", (uint8_t *)v33, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v67, -1, -1);
      MEMORY[0x219A1D978](v33, -1, -1);

    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(v0 + 344))(*(_QWORD *)(v0 + 296), *(_QWORD *)(v0 + 280));

    }
  }
  else
  {
    if (v22)
    {
      swift_retain();
      v34 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 416) = v34;
      *v34 = v0;
      v34[1] = sub_21896EB7C;
      return sub_218989024();
    }
    v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 336);
    v37 = *(_QWORD *)(v0 + 304);
    v38 = *(_QWORD *)(v0 + 280);
    v39 = *(_QWORD *)(v0 + 184);
    v40 = (_QWORD *)(*(_QWORD *)(v0 + 200) + OBJC_IVAR___SKALocalStatusServer_failedDeliveryRetryTask);
    swift_beginAccess();
    *v40 = 0;
    swift_release();
    v36(v37, v39, v38);
    v41 = sub_218988E14();
    v42 = sub_218989078();
    if (os_log_type_enabled(v41, (os_log_type_t)v42))
    {
      v59 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
      v43 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 376);
      v56 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
      v76 = *(void **)(v0 + 368);
      v44 = *(unsigned int *)(v0 + 424);
      v68 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
      v57 = *(_QWORD *)(v0 + 304);
      v45 = *(_QWORD *)(v0 + 272);
      v64 = *(_QWORD *)(v0 + 280);
      v47 = *(_QWORD *)(v0 + 248);
      v46 = *(_QWORD *)(v0 + 256);
      typec = v42;
      v48 = *(_QWORD *)(v0 + 232);
      v49 = *(_QWORD *)(v0 + 192);
      v50 = swift_slowAlloc();
      v51 = swift_slowAlloc();
      v77 = v51;
      *(_DWORD *)v50 = 136315394;
      v43(v47, v44, v48);
      sub_218988B14();
      v56(v47, v48);
      sub_218988BEC();
      v59(v45, v46);
      *(_QWORD *)(v0 + 120) = sub_218974338(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 112), &v77);
      sub_2189890C0();
      swift_bridgeObjectRelease();
      v68(v57, v64);
      *(_WORD *)(v50 + 12) = 2048;
      *(_QWORD *)(v0 + 128) = v49;
      sub_2189890C0();
      _os_log_impl(&dword_2188DF000, v41, typec, "failedDeliveryRetryTask END {nextAttemptDate: %s, sleepSeconds: %f}", (uint8_t *)v50, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v51, -1, -1);
      MEMORY[0x219A1D978](v50, -1, -1);

      swift_release();
    }
    else
    {
      v52 = *(void **)(v0 + 368);
      v53 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
      v54 = *(_QWORD *)(v0 + 304);
      v55 = *(_QWORD *)(v0 + 280);
      swift_release();
      v53(v54, v55);

    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21896EB7C()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_21896EBDC()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void *v27;
  uint64_t v28;

  v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 336);
  v2 = *(_QWORD *)(v0 + 304);
  v3 = *(_QWORD *)(v0 + 280);
  v4 = *(_QWORD *)(v0 + 184);
  v5 = (_QWORD *)(*(_QWORD *)(v0 + 200) + OBJC_IVAR___SKALocalStatusServer_failedDeliveryRetryTask);
  swift_beginAccess();
  *v5 = 0;
  swift_release();
  v1(v2, v4, v3);
  v6 = sub_218988E14();
  v7 = sub_218989078();
  if (os_log_type_enabled(v6, v7))
  {
    v24 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
    v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 376);
    v22 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
    v27 = *(void **)(v0 + 368);
    v8 = *(unsigned int *)(v0 + 424);
    v23 = *(_QWORD *)(v0 + 304);
    v9 = *(_QWORD *)(v0 + 272);
    v25 = *(_QWORD *)(v0 + 280);
    v26 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
    v11 = *(_QWORD *)(v0 + 248);
    v10 = *(_QWORD *)(v0 + 256);
    v12 = *(_QWORD *)(v0 + 232);
    v13 = *(_QWORD *)(v0 + 192);
    v14 = swift_slowAlloc();
    v15 = swift_slowAlloc();
    v28 = v15;
    *(_DWORD *)v14 = 136315394;
    v21(v11, v8, v12);
    sub_218988B14();
    v22(v11, v12);
    sub_218988BEC();
    v24(v9, v10);
    *(_QWORD *)(v0 + 120) = sub_218974338(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 112), &v28);
    sub_2189890C0();
    swift_bridgeObjectRelease();
    v26(v23, v25);
    *(_WORD *)(v14 + 12) = 2048;
    *(_QWORD *)(v0 + 128) = v13;
    sub_2189890C0();
    _os_log_impl(&dword_2188DF000, v6, v7, "failedDeliveryRetryTask END {nextAttemptDate: %s, sleepSeconds: %f}", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x219A1D978](v15, -1, -1);
    MEMORY[0x219A1D978](v14, -1, -1);

    swift_release();
  }
  else
  {
    v16 = *(void **)(v0 + 368);
    v17 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
    v18 = *(_QWORD *)(v0 + 304);
    v19 = *(_QWORD *)(v0 + 280);
    swift_release();
    v17(v18, v19);

  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21896EEBC@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t *v15;
  id v16;
  unint64_t v17;
  id v19;
  _QWORD v20[2];
  unint64_t v21;
  unint64_t v22;

  v20[1] = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E5A8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_218988DFC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v20 - v10;
  v12 = objc_msgSend(v1, sel_keyDomain);
  sub_218988F28();

  sub_218988DE4();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_21897FCD4((uint64_t)v4, &qword_253E6E5A8);
    v13 = sub_218988DD8();
    sub_218974B58(&qword_255001570, (uint64_t (*)(uint64_t))MEMORY[0x24BE60B58], MEMORY[0x24BE60B60]);
    swift_allocError();
    v15 = v14;
    v21 = 0;
    v22 = 0xE000000000000000;
    sub_218989150();
    swift_bridgeObjectRelease();
    v21 = 0xD00000000000001FLL;
    v22 = 0x8000000218992DB0;
    v16 = objc_msgSend(v1, sel_keyDomain);
    sub_218988F28();

    sub_218988F64();
    swift_bridgeObjectRelease();
    v17 = v22;
    *v15 = v21;
    v15[1] = v17;
    (*(void (**)(unint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v15, *MEMORY[0x24BE60B48], v13);
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    v19 = objc_msgSend(v1, sel_keyName);
    sub_218988F28();

    sub_2189770C8();
    sub_21897710C();
    sub_218988DB4();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }
}

void sub_21896F18C(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x24BEE4AF8];
}

id sub_21896F19C@<X0>(id *a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  const char *v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  os_log_type_t v48;
  uint64_t v49;
  _QWORD *v50;
  id v51;
  _QWORD *v52;
  uint64_t v53;
  id v54;
  os_log_type_t v55;
  _QWORD *v56;
  unint64_t v57;
  id v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v63;
  id result;
  unint64_t v65;
  id v66;
  void *v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  uint8_t *v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  NSObject *v94;
  os_log_type_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  id v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  _QWORD *v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120[3];
  uint64_t v121;

  v112 = a5;
  v116 = a4;
  v117 = a3;
  v119 = a6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v113 = (char *)&v110 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255001550);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v110 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_218988BF8();
  v114 = *(_QWORD *)(v14 - 8);
  v115 = v14;
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v110 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v110 - v18;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E5A8);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v110 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = *a1;
  v24 = objc_msgSend(*a1, sel_idsDeviceIdentifier);
  if (!v24)
  {
    if (qword_253E6EE80 != -1)
      swift_once();
    v45 = sub_218988E20();
    __swift_project_value_buffer(v45, (uint64_t)qword_253E6EE68);
    v46 = v23;
    v47 = sub_218988E14();
    v48 = sub_218989078();
    if (!os_log_type_enabled(v47, v48))
    {

      goto LABEL_21;
    }
    v49 = swift_slowAlloc();
    v50 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v49 = 138412290;
    v120[0] = (uint64_t)v46;
    v51 = v46;
    sub_2189890C0();
    *v50 = v46;

    _os_log_impl(&dword_2188DF000, v47, v48, "reconcileObservations skipping device with nil idsIdentifier {device: %@}", (uint8_t *)v49, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
    swift_arrayDestroy();
    v52 = v50;
LABEL_18:
    MEMORY[0x219A1D978](v52, -1, -1);
    MEMORY[0x219A1D978](v49, -1, -1);

    goto LABEL_21;
  }
  v25 = v24;
  v118 = sub_218988F28();
  v27 = v26;

  v28 = *a2;
  if (!*(_QWORD *)(v28 + 16))
  {
LABEL_14:
    if (qword_253E6EE80 != -1)
      swift_once();
    v53 = sub_218988E20();
    __swift_project_value_buffer(v53, (uint64_t)qword_253E6EE68);
    v54 = v23;
    swift_bridgeObjectRetain();
    v47 = sub_218988E14();
    v55 = sub_218989078();
    if (!os_log_type_enabled(v47, v55))
    {

      swift_bridgeObjectRelease_n();
      goto LABEL_21;
    }
    v49 = swift_slowAlloc();
    v56 = (_QWORD *)swift_slowAlloc();
    v117 = (_QWORD *)swift_slowAlloc();
    v120[0] = (uint64_t)v117;
    *(_DWORD *)v49 = 138412546;
    v121 = (uint64_t)v54;
    v57 = v27;
    v58 = v54;
    sub_2189890C0();
    *v56 = v54;

    *(_WORD *)(v49 + 12) = 2080;
    swift_bridgeObjectRetain();
    v121 = sub_218974338(v118, v57, v120);
    sub_2189890C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2188DF000, v47, v55, "reconcileObservations skipping device with no statuses {device: %@, deviceID: %s}", (uint8_t *)v49, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
    swift_arrayDestroy();
    MEMORY[0x219A1D978](v56, -1, -1);
    v59 = v117;
    swift_arrayDestroy();
    v52 = v59;
    goto LABEL_18;
  }
  swift_bridgeObjectRetain();
  v29 = sub_218974A38(v118, v27);
  if ((v30 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  v31 = *(id *)(*(_QWORD *)(v28 + 56) + 8 * v29);
  swift_bridgeObjectRelease();
  v111 = v31;
  v32 = objc_msgSend(v31, sel_keyDomain);
  sub_218988F28();

  sub_218988DE4();
  v33 = sub_218988DFC();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 48))(v22, 1, v33) == 1)
  {
    swift_bridgeObjectRelease();
    sub_21897FCD4((uint64_t)v22, &qword_253E6E5A8);
    if (qword_253E6EE80 != -1)
      swift_once();
    v34 = sub_218988E20();
    __swift_project_value_buffer(v34, (uint64_t)qword_253E6EE68);
    v35 = v111;
    v36 = sub_218988E14();
    v37 = sub_21898906C();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      v39 = swift_slowAlloc();
      v120[0] = v39;
      *(_DWORD *)v38 = 136315138;
      v40 = objc_msgSend(v35, sel_keyDomain);
      v41 = sub_218988F28();
      v43 = v42;

      v121 = sub_218974338(v41, v43, v120);
      sub_2189890C0();

      swift_bridgeObjectRelease();
      v44 = "Loaded unknown domain from database {keyDomain: %s}";
LABEL_33:
      _os_log_impl(&dword_2188DF000, v36, v37, v44, v38, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v39, -1, -1);
      MEMORY[0x219A1D978](v38, -1, -1);

LABEL_35:
      v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E540);
      v62 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 56);
      v63 = v119;
      return (id)v62(v63, 1, 1, v61);
    }
    goto LABEL_34;
  }
  v65 = v27;
  sub_21897FCD4((uint64_t)v22, &qword_253E6E5A8);
  v66 = objc_msgSend(v111, sel_payload);
  if (!v66)
  {
    swift_bridgeObjectRelease();
    if (qword_253E6EE80 != -1)
      swift_once();
    v81 = sub_218988E20();
    __swift_project_value_buffer(v81, (uint64_t)qword_253E6EE68);
    v35 = v111;
    v36 = sub_218988E14();
    v37 = sub_218989078();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      v39 = swift_slowAlloc();
      v120[0] = v39;
      *(_DWORD *)v38 = 136315138;
      v82 = objc_msgSend(v35, sel_identifier);
      v83 = sub_218988F28();
      v85 = v84;

      v121 = sub_218974338(v83, v85, v120);
      sub_2189890C0();

      swift_bridgeObjectRelease();
      v44 = "Skipping status with nil payload {status.identifier: %s}";
      goto LABEL_33;
    }
LABEL_34:

    goto LABEL_35;
  }
  v67 = v66;
  v110 = sub_218988B8C();
  v69 = v68;

  v70 = *v117;
  if (!*(_QWORD *)(*v117 + 16))
    goto LABEL_37;
  swift_bridgeObjectRetain();
  v71 = sub_218974A38(v118, v65);
  if ((v72 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_37:
    if (qword_253E6EE80 != -1)
      swift_once();
    v86 = sub_218988E20();
    __swift_project_value_buffer(v86, (uint64_t)qword_253E6EE68);
    swift_bridgeObjectRetain();
    v87 = sub_218988E14();
    v88 = sub_218989060();
    if (os_log_type_enabled(v87, v88))
    {
      v89 = (uint8_t *)swift_slowAlloc();
      v90 = swift_slowAlloc();
      v120[0] = v90;
      *(_DWORD *)v89 = 136315138;
      swift_bridgeObjectRetain();
      v121 = sub_218974338(v118, v65, v120);
      sub_2189890C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2188DF000, v87, v88, "Skipping status with missing IDS Device {idsIdentifier: %s}", v89, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v90, -1, -1);
      MEMORY[0x219A1D978](v89, -1, -1);

      v91 = v110;
      v92 = v69;
LABEL_49:
      sub_21897E09C(v91, v92);

      goto LABEL_21;
    }
    swift_bridgeObjectRelease_n();

    sub_21897E09C(v110, v69);
LABEL_21:
    v60 = v119;
    v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E540);
    v62 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 56);
    v63 = v60;
    return (id)v62(v63, 1, 1, v61);
  }
  v117 = *(id *)(*(_QWORD *)(v70 + 56) + 8 * v71);
  swift_bridgeObjectRelease();
  v73 = v116 + OBJC_IVAR___SKALocalStatusServer_observationTimestamps;
  swift_beginAccess();
  v74 = *(_QWORD *)v73;
  if (!*(_QWORD *)(*(_QWORD *)v73 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v114 + 56))(v13, 1, 1, v115);
LABEL_45:
    sub_21897FCD4((uint64_t)v13, &qword_255001550);
    swift_endAccess();
    if (qword_253E6EE80 != -1)
      swift_once();
    v93 = sub_218988E20();
    __swift_project_value_buffer(v93, (uint64_t)qword_253E6EE68);
    swift_retain_n();
    swift_bridgeObjectRetain();
    v94 = sub_218988E14();
    v95 = sub_218989060();
    if (!os_log_type_enabled(v94, v95))
    {
      swift_release_n();
      swift_bridgeObjectRelease_n();

      sub_21897E09C(v110, v69);
      goto LABEL_21;
    }
    v96 = swift_slowAlloc();
    v97 = swift_slowAlloc();
    v120[0] = v97;
    *(_DWORD *)v96 = 136315394;
    swift_bridgeObjectRetain();
    v121 = sub_218974338(v118, v65, v120);
    sub_2189890C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v96 + 12) = 2080;
    v118 = v69;
    swift_bridgeObjectRetain();
    v98 = sub_218988EE0();
    v100 = v99;
    swift_bridgeObjectRelease();
    v121 = sub_218974338(v98, v100, v120);
    sub_2189890C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2188DF000, v94, v95, "Skipping status with missing timestamp {idsIdentifier: %s, timestamps: %s}", (uint8_t *)v96, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x219A1D978](v97, -1, -1);
    MEMORY[0x219A1D978](v96, -1, -1);

    v91 = v110;
    v92 = v118;
    goto LABEL_49;
  }
  swift_bridgeObjectRetain();
  v75 = sub_218974A38(v118, v65);
  if ((v76 & 1) != 0)
  {
    v77 = *(_QWORD *)(v74 + 56);
    v79 = v114;
    v78 = v115;
    (*(void (**)(char *, unint64_t, uint64_t))(v114 + 16))(v13, v77 + *(_QWORD *)(v114 + 72) * v75, v115);
    v80 = 0;
  }
  else
  {
    v80 = 1;
    v79 = v114;
    v78 = v115;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v79 + 56))(v13, v80, 1, v78);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v79 + 48))(v13, 1, v78) == 1)
    goto LABEL_45;
  (*(void (**)(char *, char *, uint64_t))(v79 + 32))(v19, v13, v78);
  swift_endAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v113, v112, v8);
  v101 = v117;
  result = objc_msgSend(v117, sel_name);
  if (result)
  {
    v102 = result;
    v116 = sub_218988F28();
    v112 = v103;

    result = objc_msgSend(v101, sel_modelIdentifier);
    if (result)
    {
      v104 = result;
      sub_218988F28();

      v106 = v114;
      v105 = v115;
      (*(void (**)(char *, char *, uint64_t))(v114 + 16))(v17, v19, v115);
      v107 = v110;
      v120[0] = v110;
      v120[1] = v69;
      sub_21897F884(v110, v69);
      sub_2189770C8();
      sub_21897710C();
      v108 = v119;
      sub_218988C88();

      sub_21897E09C(v107, v69);
      (*(void (**)(char *, uint64_t))(v106 + 8))(v19, v105);
      v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E540);
      return (id)(*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v109 - 8) + 56))(v108, 0, 1, v109);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_218970090(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  unint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255001960);
    v2 = sub_218989144();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B08];
  }
  v23 = a1 + 56;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 56);
  v6 = (unint64_t)(63 - v3) >> 6;
  v7 = v2 + 56;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v9 = 0;
  while (1)
  {
    if (v5)
    {
      v5 &= v5 - 1;
      goto LABEL_28;
    }
    v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    if (v12 >= v6)
      goto LABEL_39;
    v13 = *(_QWORD *)(v23 + 8 * v12);
    v14 = v9 + 1;
    if (!v13)
    {
      v14 = v9 + 2;
      if (v9 + 2 >= v6)
        goto LABEL_39;
      v13 = *(_QWORD *)(v23 + 8 * v14);
      if (!v13)
      {
        v14 = v9 + 3;
        if (v9 + 3 >= v6)
          goto LABEL_39;
        v13 = *(_QWORD *)(v23 + 8 * v14);
        if (!v13)
        {
          v14 = v9 + 4;
          if (v9 + 4 >= v6)
            goto LABEL_39;
          v13 = *(_QWORD *)(v23 + 8 * v14);
          if (!v13)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v13 - 1) & v13;
    v9 = v14;
LABEL_28:
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E5D8);
    swift_dynamicCast();
    sub_2189892C4();
    sub_2189892DC();
    if (v25)
    {
      swift_bridgeObjectRetain();
      sub_218988F4C();
      swift_bridgeObjectRelease();
    }
    result = sub_2189892E8();
    v16 = -1 << *(_BYTE *)(v2 + 32);
    v17 = result & ~v16;
    v18 = v17 >> 6;
    if (((-1 << v17) & ~*(_QWORD *)(v7 + 8 * (v17 >> 6))) != 0)
    {
      v10 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v7 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v19 = 0;
      v20 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v20 && (v19 & 1) != 0)
        {
          __break(1u);
          goto LABEL_40;
        }
        v21 = v18 == v20;
        if (v18 == v20)
          v18 = 0;
        v19 |= v21;
        v22 = *(_QWORD *)(v7 + 8 * v18);
      }
      while (v22 == -1);
      v10 = __clz(__rbit64(~v22)) + (v18 << 6);
    }
    *(_QWORD *)(v7 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
    v11 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v10);
    *v11 = v24;
    v11[1] = v25;
    ++*(_QWORD *)(v2 + 16);
  }
  v15 = v9 + 5;
  if (v9 + 5 >= v6)
  {
LABEL_39:
    swift_release();
    sub_21897F958();
    return v2;
  }
  v13 = *(_QWORD *)(v23 + 8 * v15);
  if (v13)
  {
    v14 = v9 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v14 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v14 >= v6)
      goto LABEL_39;
    v13 = *(_QWORD *)(v23 + 8 * v14);
    ++v15;
    if (v13)
      goto LABEL_27;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2189703C0(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  int64_t v25;

  if (result == a2)
    return 1;
  v3 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v4 = 0;
  v24 = result + 56;
  v5 = 1 << *(_BYTE *)(result + 32);
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(result + 56);
  v25 = (unint64_t)(v5 + 63) >> 6;
  v8 = a2 + 56;
LABEL_7:
  if (v7)
  {
    v9 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v10 = v9 | (v4 << 6);
LABEL_25:
    v14 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    v16 = *v14;
    v15 = v14[1];
    sub_2189892C4();
    sub_2189892DC();
    if (v15)
    {
      swift_bridgeObjectRetain_n();
      sub_218988F4C();
      swift_bridgeObjectRelease();
    }
    result = sub_2189892E8();
    v17 = -1 << *(_BYTE *)(a2 + 32);
    v18 = result & ~v17;
    if (((*(_QWORD *)(v8 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) != 0)
    {
      v19 = ~v17;
      v20 = *(_QWORD *)(a2 + 48);
      do
      {
        v21 = (_QWORD *)(v20 + 16 * v18);
        v22 = v21[1];
        if (v22)
        {
          if (v15)
          {
            v23 = *v21 == v16 && v22 == v15;
            if (v23 || (result = sub_218989240(), (result & 1) != 0))
            {
              result = swift_bridgeObjectRelease();
              goto LABEL_7;
            }
          }
        }
        else if (!v15)
        {
          goto LABEL_7;
        }
        v18 = (v18 + 1) & v19;
      }
      while (((*(_QWORD *)(v8 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) != 0);
    }
    swift_bridgeObjectRelease();
    return 0;
  }
  v11 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_43;
  }
  if (v11 >= v25)
    return 1;
  v12 = *(_QWORD *)(v24 + 8 * v11);
  ++v4;
  if (v12)
  {
LABEL_24:
    v7 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v4 << 6);
    goto LABEL_25;
  }
  v4 = v11 + 1;
  if (v11 + 1 >= v25)
    return 1;
  v12 = *(_QWORD *)(v24 + 8 * v4);
  if (v12)
    goto LABEL_24;
  v4 = v11 + 2;
  if (v11 + 2 >= v25)
    return 1;
  v12 = *(_QWORD *)(v24 + 8 * v4);
  if (v12)
    goto LABEL_24;
  v4 = v11 + 3;
  if (v11 + 3 >= v25)
    return 1;
  v12 = *(_QWORD *)(v24 + 8 * v4);
  if (v12)
    goto LABEL_24;
  v13 = v11 + 4;
  if (v13 >= v25)
    return 1;
  v12 = *(_QWORD *)(v24 + 8 * v13);
  if (v12)
  {
    v4 = v13;
    goto LABEL_24;
  }
  while (1)
  {
    v4 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v4 >= v25)
      return 1;
    v12 = *(_QWORD *)(v24 + 8 * v4);
    ++v13;
    if (v12)
      goto LABEL_24;
  }
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_21897065C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 32) = a4;
  *(_QWORD *)(v5 + 40) = a5;
  return swift_task_switch();
}

uint64_t sub_218970674()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v12;
  uint64_t v13;

  v1 = sub_21895AD14(*(void **)(v0 + 40), 0x20746E756F636341, 0xEF6465676E616863);
  *(_QWORD *)(v0 + 48) = v1;
  if (v1)
  {
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v12;
    *v12 = v0;
    v12[1] = sub_2189708FC;
    return sub_218989024();
  }
  else
  {
    v2 = sub_21895BC24((_BYTE *)0xD000000000000019, 0x80000002189935A0);
    if (v2 >> 62)
      v3 = sub_2189891F8();
    else
      v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRelease();
    if (qword_253E6EE80 != -1)
      swift_once();
    v4 = sub_218988E20();
    __swift_project_value_buffer(v4, (uint64_t)qword_253E6EE68);
    v5 = sub_218988E14();
    v6 = sub_218989078();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      v13 = v8;
      *(_DWORD *)v7 = 136315138;
      *(_QWORD *)(v0 + 16) = v3;
      v9 = sub_218989234();
      *(_QWORD *)(v0 + 24) = sub_218974338(v9, v10, &v13);
      sub_2189890C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2188DF000, v5, v6, "Could not deliver pending statuses for account change. idsDevices.count: %s}", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v8, -1, -1);
      MEMORY[0x219A1D978](v7, -1, -1);
    }

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2189708FC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_218970954()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_218970984(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD aBlock[6];

  v24[0] = a4;
  v7 = sub_218988EA4();
  v27 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_218988EBC();
  v25 = *(_QWORD *)(v10 - 8);
  v26 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255001798);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[1] = *(_QWORD *)(a2 + 144);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
  v17 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v18 = swift_allocObject();
  v19 = (void *)v24[0];
  *(_QWORD *)(v18 + 16) = a3;
  *(_QWORD *)(v18 + 24) = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v18 + v17, v16, v13);
  aBlock[4] = sub_21897F484;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_218951B34;
  aBlock[3] = &block_descriptor_65;
  v20 = _Block_copy(aBlock);
  v21 = a3;
  v22 = v19;
  sub_218988EB0();
  v28 = MEMORY[0x24BEE4AF8];
  sub_218974B58(&qword_255001770, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255001778);
  sub_21897FAFC((unint64_t *)&unk_255001780, &qword_255001778, MEMORY[0x24BEE12C8]);
  sub_2189890F0();
  MEMORY[0x219A1CE08](0, v12, v9, v20);
  _Block_release(v20);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v26);
  return swift_release();
}

void sub_218970BF8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  void *v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  __int128 aBlock;
  uint64_t (*v36)(uint64_t, uint64_t, uint64_t, void *);
  void *v37;
  uint64_t (*v38)(uint64_t, uint64_t, void *);
  uint64_t v39;
  uint64_t v40;
  _OWORD v41[2];

  v33 = a3;
  v34 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255001798);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = sub_2189512F4(MEMORY[0x24BEE4AF8]);
  v8 = objc_msgSend(a1, sel_keyName);
  v9 = sub_218988F28();
  v11 = v10;

  v12 = (void *)MEMORY[0x24BEE0D00];
  v37 = (void *)MEMORY[0x24BEE0D00];
  *(_QWORD *)&aBlock = v9;
  *((_QWORD *)&aBlock + 1) = v11;
  sub_21897F4B8(&aBlock, v41);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v40 = v7;
  sub_218977444(v41, 0x656D614E79656BLL, 0xE700000000000000, isUniquelyReferenced_nonNull_native);
  v14 = v40;
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(a1, sel_keyDomain);
  v16 = sub_218988F28();
  v18 = v17;

  v37 = v12;
  *(_QWORD *)&aBlock = v16;
  *((_QWORD *)&aBlock + 1) = v18;
  sub_21897F4B8(&aBlock, v41);
  v19 = swift_isUniquelyReferenced_nonNull_native();
  v40 = v14;
  sub_218977444(v41, 0x69616D6F4479656BLL, 0xE90000000000006ELL, v19);
  v20 = v40;
  swift_bridgeObjectRelease();
  v21 = objc_msgSend(a1, sel_payload);
  if (v21)
  {
    v22 = v21;
    v23 = sub_218988B8C();
    v25 = v24;

    v37 = (void *)MEMORY[0x24BDCDDE8];
    *(_QWORD *)&aBlock = v23;
    *((_QWORD *)&aBlock + 1) = v25;
    sub_21897F4B8(&aBlock, v41);
    sub_21897F884(v23, v25);
    v26 = swift_isUniquelyReferenced_nonNull_native();
    v40 = v20;
    sub_218977444(v41, 0x64616F6C796170, 0xE700000000000000, v26);
    v20 = v40;
    swift_bridgeObjectRelease();
    sub_21897E09C(v23, v25);
  }
  v27 = (void *)sub_218988F1C();
  sub_218970F5C(v20);
  swift_bridgeObjectRelease();
  v28 = (void *)sub_218988EC8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v33, v4);
  v29 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v30 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v30 + v29, (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  v38 = sub_21897F52C;
  v39 = v30;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v36 = sub_218971320;
  v37 = &block_descriptor_71;
  v31 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v34, sel_sendRequestID_request_options_responseHandler_, v27, v28, 0, v31);
  _Block_release(v31);

}

uint64_t sub_218970F5C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[3];
  _OWORD v38[2];
  __int128 v39;
  _OWORD v40[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550017A0);
    v2 = sub_21898921C();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_37;
      v14 = *(_QWORD *)(v28 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_37;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_37;
          v14 = *(_QWORD *)(v28 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    sub_21897F3BC(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_21897F4B8(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_21897F4B8(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_21897F4B8(v36, v37);
    sub_21897F4B8(v37, &v33);
    result = sub_218989108();
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(_QWORD *)(v10 + 32) = v31;
    result = (uint64_t)sub_21897F4B8(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_21897F958();
    return v2;
  }
  v14 = *(_QWORD *)(v28 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_218971320(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, void *);
  uint64_t v7;
  id v8;

  v5 = a3;
  v6 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  if (!a2)
  {
    v7 = 0;
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = sub_218988ED4();
  if (v5)
LABEL_3:
    v5 = sub_218988ED4();
LABEL_4:
  swift_retain();
  v8 = a4;
  v6(v7, v5, a4);
  swift_release();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2189713EC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;

  v21 = a3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E840);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_21898900C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a5, v9);
  v16 = (*(unsigned __int8 *)(v10 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v17 = (char *)swift_allocObject();
  *((_QWORD *)v17 + 2) = 0;
  *((_QWORD *)v17 + 3) = 0;
  *((_QWORD *)v17 + 4) = a1;
  *((_QWORD *)v17 + 5) = a2;
  *((_QWORD *)v17 + 6) = v21;
  *((_QWORD *)v17 + 7) = a4;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v17[v16], (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  v18 = a1;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_21896AF3C((uint64_t)v14, (uint64_t)&unk_255001930, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_218971560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[11] = a7;
  v8[12] = a8;
  v8[9] = a5;
  v8[10] = a6;
  v8[8] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255001550);
  v8[13] = swift_task_alloc();
  v8[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_218971600()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  uint8_t *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if (qword_253E6EE80 != -1)
    swift_once();
  v1 = (void *)v0[8];
  v2 = sub_218988E20();
  v0[15] = __swift_project_value_buffer(v2, (uint64_t)qword_253E6EE68);
  v3 = v1;
  v4 = sub_218988E14();
  v5 = sub_218989078();
  v6 = os_log_type_enabled(v4, v5);
  v7 = (void *)v0[8];
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v15[0] = v14;
    *(_DWORD *)v8 = 136315138;
    v9 = objc_msgSend(v7, sel_identifier);
    v10 = sub_218988F28();
    v12 = v11;

    v0[7] = sub_218974338(v10, v12, v15);
    sub_2189890C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2188DF000, v4, v5, "Receive local status CONTINUE. Write status to database. {status: %s}}", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A1D978](v14, -1, -1);
    MEMORY[0x219A1D978](v8, -1, -1);
  }
  else
  {

  }
  return swift_task_switch();
}

uint64_t sub_218971810()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 128) = *(_QWORD *)(*(_QWORD *)(v0 + 72) + 176);
  return swift_task_switch();
}

uint64_t sub_21897187C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 136) = objc_msgSend(*(id *)(v0 + 128), sel_newBackgroundContext);
  return swift_task_switch();
}

uint64_t sub_2189718F0()
{
  uint64_t v0;
  unsigned int v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;

  *(_QWORD *)(v0 + 40) = 0;
  v1 = objc_msgSend(*(id *)(v0 + 128), sel_createOrUpdateOrDeleteSubscribedLocalStatus_databaseContext_error_, *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 136), v0 + 40);
  v2 = *(id *)(v0 + 40);
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 112);
    sub_218988BE0();
    v4 = sub_218988BF8();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 0, 1, v4);
    return swift_task_switch();
  }
  else
  {
    v6 = v2;
    v7 = *(void **)(v0 + 136);
    v8 = (void *)sub_218988B74();

    swift_willThrow();
    v9 = v8;
    v10 = v8;
    v11 = sub_218988E14();
    v12 = sub_21898906C();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v13 = 138412290;
      v15 = v8;
      v16 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v0 + 48) = v16;
      sub_2189890C0();
      *v14 = v16;

      _os_log_impl(&dword_2188DF000, v11, v12, "Receive local status FAILED. Database error {error: %@}", v13, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001710);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v14, -1, -1);
      MEMORY[0x219A1D978](v13, -1, -1);
    }
    else
    {

    }
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_218971B78()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[13];
  v2 = v0[14];
  v4 = v0[10];
  v3 = v0[11];
  sub_218980220(v2, v1, &qword_255001550);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_21895CD08(v1, v4, v3);
  swift_endAccess();
  sub_21897FCD4(v2, &qword_255001550);
  return swift_task_switch();
}

uint64_t sub_218971C68()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  v1 = sub_218988E14();
  v2 = sub_218989078();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2188DF000, v1, v2, "Receive local status SUCCESS", v3, 2u);
    MEMORY[0x219A1D978](v3, -1, -1);
  }

  sub_218989150();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  sub_21897FAFC(&qword_253E6E578, &qword_253E6E718, MEMORY[0x24BE60B40]);
  sub_218989234();
  sub_218988F64();
  swift_bridgeObjectRelease();
  sub_218988F64();
  *(_QWORD *)(v0 + 144) = 0x6465766965636572;
  *(_QWORD *)(v0 + 152) = 0xEF5B737574617453;
  return swift_task_switch();
}

uint64_t sub_218971E00()
{
  uint64_t v0;

  sub_218952544(*(_QWORD *)(v0 + 144), *(id *)(v0 + 152));
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_218971E94()
{
  sub_2189892C4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  sub_21897FAFC((unint64_t *)&unk_253E6E560, &qword_253E6E718, MEMORY[0x24BE60B30]);
  sub_218988EF8();
  swift_bridgeObjectRetain();
  sub_218988F4C();
  swift_bridgeObjectRelease();
  return sub_2189892E8();
}

uint64_t sub_218971F3C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  sub_21897FAFC((unint64_t *)&unk_253E6E560, &qword_253E6E718, MEMORY[0x24BE60B30]);
  sub_218988EF8();
  swift_bridgeObjectRetain();
  sub_218988F4C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_218971FD0()
{
  sub_2189892C4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  sub_21897FAFC((unint64_t *)&unk_253E6E560, &qword_253E6E718, MEMORY[0x24BE60B30]);
  sub_218988EF8();
  swift_bridgeObjectRetain();
  sub_218988F4C();
  swift_bridgeObjectRelease();
  return sub_2189892E8();
}

uint64_t sub_218972074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  sub_2189770C8();
  sub_21897710C();
  if ((sub_218988D90() & 1) == 0)
    return 0;
  v6 = *(int *)(a3 + 20);
  v7 = *(_QWORD *)(a1 + v6);
  v8 = *(_QWORD *)(a1 + v6 + 8);
  v9 = (_QWORD *)(a2 + v6);
  if (v7 == *v9 && v8 == v9[1])
    return 1;
  else
    return sub_218989240();
}

uint64_t sub_218972110()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_218972118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_retain();
  return a3;
}

uint64_t SKALocalStatusServer.service(_:devicesChanged:)(uint64_t a1, uint64_t a2)
{
  return sub_21897DE40(a2);
}

void SKALocalStatusServer.__allocating_init()()
{
  swift_allocObject();
  swift_defaultActor_initialize();
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void SKALocalStatusServer.init()()
{
  swift_defaultActor_initialize();
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id *SKALocalStatusServer.deinit()
{
  id *v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  sub_21897FCD4((uint64_t)v0 + OBJC_IVAR___SKALocalStatusServer_idsDeviceProviderToken, &qword_253E6E6C8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21897E05C(*(id *)((char *)v0 + OBJC_IVAR___SKALocalStatusServer_browseTask));
  swift_defaultActor_destroy();
  return v0;
}

uint64_t SKALocalStatusServer.__deallocating_deinit()
{
  SKALocalStatusServer.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t SKALocalStatusServer.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_218972380()
{
  uint64_t v0;

  return v0;
}

id sub_218972398()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_218972408()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t PublishStatusInvocation.invoke(with:context:client:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = sub_218988CE8();
  v3[5] = v4;
  v3[6] = *(_QWORD *)(v4 - 8);
  v3[7] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v3[8] = v5;
  v3[9] = *(_QWORD *)(v5 - 8);
  v3[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E818);
  v3[11] = swift_task_alloc();
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E6F0);
  v3[14] = v6;
  v3[15] = *(_QWORD *)(v6 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_218972554()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = sub_218988C64();
  v3 = v2;
  v0[19] = v1;
  v0[20] = v2;
  sub_218988C4C();
  sub_218988C58();
  v4 = (_QWORD *)swift_task_alloc();
  v0[21] = (uint64_t)v4;
  *v4 = v0;
  v4[1] = sub_2189725F4;
  return sub_218954FB0(v0[17], v0[12], v1, v3, v0[10], v0[7]);
}

uint64_t sub_2189725F4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 160);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 152);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v7 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  v9 = *(_QWORD *)(*(_QWORD *)v1 + 48);
  *(_QWORD *)(*(_QWORD *)v1 + 176) = v0;
  swift_task_dealloc();
  sub_21897E088(v3, v2);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  return swift_task_switch();
}

uint64_t sub_2189726B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 112);
  v6 = *(_QWORD *)(v0 + 88);
  v7 = *(_QWORD *)(v0 + 96);
  (*(void (**)(uint64_t))(v2 + 32))(v1);
  sub_21897FC00(v7, v4, (uint64_t *)&unk_253E6E818);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v1, v5);
  sub_218980220(v4, v6, (uint64_t *)&unk_253E6E818);
  sub_218988C70();
  sub_21897FCD4(v4, (uint64_t *)&unk_253E6E818);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2189727DC()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_218972870()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = v0;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  sub_218974B58((unint64_t *)&unk_253E6E708, (uint64_t (*)(uint64_t))MEMORY[0x24BE60910], (uint64_t)&protocol conformance descriptor for PublishStatusInvocation);
  *v2 = v1;
  v2[1] = sub_218972940;
  return sub_218988E98();
}

uint64_t sub_218972940(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *v3;
  v7 = swift_task_dealloc();
  if (!v2)
  {
    v7 = a1;
    v8 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
}

uint64_t sub_2189729A4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = *a3;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_21894F9F0;
  return PublishStatusInvocation.invoke(with:context:client:)(a1, a2, v6);
}

uint64_t LocalStatusInvocation.invoke(with:context:client:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E818);
  v3[5] = swift_task_alloc();
  v3[6] = swift_task_alloc();
  v3[7] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E6F0);
  v3[8] = v4;
  v3[9] = *(_QWORD *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = swift_task_alloc();
  v3[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_218972AD4()
{
  uint64_t *v0;

  sub_21895C340(v0[11], v0[6], v0[3]);
  v0[13] = 0;
  return swift_task_switch();
}

uint64_t sub_218972B38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 56);
  v5 = *(_QWORD *)(v0 + 64);
  v6 = *(_QWORD *)(v0 + 40);
  v7 = *(_QWORD *)(v0 + 48);
  (*(void (**)(uint64_t))(v2 + 32))(v1);
  sub_21897FC00(v7, v4, (uint64_t *)&unk_253E6E818);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v1, v5);
  sub_218980220(v4, v6, (uint64_t *)&unk_253E6E818);
  sub_218988CB8();
  sub_21897FCD4(v4, (uint64_t *)&unk_253E6E818);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_218972C44()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_218972CBC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = v0;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  sub_218974B58((unint64_t *)&unk_255001700, (uint64_t (*)(uint64_t))MEMORY[0x24BE609B8], (uint64_t)&protocol conformance descriptor for LocalStatusInvocation);
  *v2 = v1;
  v2[1] = sub_218980330;
  return sub_218988E98();
}

uint64_t sub_218972D8C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = *a3;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_2189802D0;
  return LocalStatusInvocation.invoke(with:context:client:)(a1, a2, v6);
}

uint64_t SubscribeStatusInvocation.invoke(with:context:client:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_218972E10()
{
  uint64_t v0;

  sub_21895C5EC(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_218972E50()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = v0;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  sub_218974B58(&qword_253E6E558, (uint64_t (*)(uint64_t))MEMORY[0x24BE60998], (uint64_t)&protocol conformance descriptor for SubscribeStatusInvocation);
  *v2 = v1;
  v2[1] = sub_218980330;
  return sub_218988E98();
}

uint64_t sub_218972F20(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;

  v3[2] = a1;
  v3[3] = a2;
  v3[4] = *a3;
  return swift_task_switch();
}

id sub_218972F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void *v23;

  v13 = (void *)sub_218988F1C();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_218988BB0();
  v15 = (void *)sub_218988BB0();
  v16 = (void *)sub_218988F1C();
  swift_bridgeObjectRelease();
  v17 = (void *)sub_218988F1C();
  swift_bridgeObjectRelease();
  if (a10 >> 60 == 15)
  {
    v18 = 0;
  }
  else
  {
    v18 = (void *)sub_218988B80();
    sub_21897E088(a9, a10);
  }
  v19 = objc_msgSend(v23, sel_initWithIdentifier_creationDate_modificationDate_keyDomain_keyName_payload_targetDevicesFlags_, v13, v14, v15, v16, v17, v18, a11);

  v20 = sub_218988BF8();
  v21 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8);
  v21(a4, v20);
  v21(a3, v20);
  return v19;
}

id sub_2189730AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  id v23;
  uint64_t v24;

  v12 = (void *)sub_218988F1C();
  swift_bridgeObjectRelease();
  v24 = a3;
  v13 = (void *)sub_218988BB0();
  v14 = (void *)sub_218988BB0();
  v15 = (void *)sub_218988F1C();
  swift_bridgeObjectRelease();
  v16 = (void *)sub_218988F1C();
  swift_bridgeObjectRelease();
  if (a10 >> 60 == 15)
  {
    v17 = 0;
  }
  else
  {
    v17 = (void *)sub_218988B80();
    sub_21897E088(a9, a10);
  }
  v18 = (void *)sub_218988F1C();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v23, sel_initWithIdentifier_creationDate_modificationDate_keyName_keyDomain_payload_idsIdentifier_, v12, v13, v14, v15, v16, v17, v18);

  v20 = sub_218988BF8();
  v21 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8);
  v21(a4, v20);
  v21(v24, v20);
  return v19;
}

uint64_t sub_218973240()
{
  sub_2189892C4();
  sub_2189892D0();
  return sub_2189892E8();
}

uint64_t sub_218973284()
{
  return sub_2189892D0();
}

uint64_t sub_2189732AC()
{
  sub_2189892C4();
  sub_2189892D0();
  return sub_2189892E8();
}

BOOL sub_2189732EC(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_218973300@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_218973310(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_21897331C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, uint64_t);
  BOOL v20;
  uint64_t v22;
  uint64_t v23;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E540);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v22 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v17 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v22 = *(_QWORD *)(v8 + 72);
      v23 = v8;
      v13 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
      v14 = v11 - 1;
      do
      {
        v15 = a1;
        v13(v10, a1 + v12, v4);
        v16 = a2;
        v13(v7, a2 + v12, v4);
        sub_21897FC70();
        v17 = sub_218988F10();
        v18 = *(void (**)(char *, uint64_t))(v23 + 8);
        v18(v7, v4);
        v18(v10, v4);
        v20 = v14-- != 0;
        if ((v17 & 1) == 0)
          break;
        v12 += v22;
        a2 = v16;
        a1 = v15;
      }
      while (v20);
    }
  }
  else
  {
    v17 = 0;
  }
  return v17 & 1;
}

void sub_21897348C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_2189734EC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x2189736D0);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

uint64_t sub_2189736F4(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_218973758;
  return v6(a1);
}

uint64_t sub_218973758()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2189737A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2189802D0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255001528 + dword_255001528))(a1, v4);
}

uint64_t sub_218973814(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E6C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21897385C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;

  *(_QWORD *)(v6 + 56) = v5;
  v12 = sub_2189891BC();
  *(_QWORD *)(v6 + 64) = v12;
  *(_QWORD *)(v6 + 72) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v6 + 80) = swift_task_alloc();
  *(_QWORD *)(v6 + 88) = swift_task_alloc();
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = a2;
  *(_QWORD *)(v6 + 16) = a3;
  *(_QWORD *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 32) = a5 & 1;
  return swift_task_switch();
}

uint64_t sub_218973900()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  _QWORD *v5;

  v1 = v0[10];
  v2 = v0[8];
  v3 = v0[9];
  sub_2189891D4();
  sub_218974B58(&qword_255001808, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  sub_218989270();
  sub_218974B58(&qword_255001810, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_2189891E0();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v4;
  v4(v1, v2);
  v5 = (_QWORD *)swift_task_alloc();
  v0[13] = v5;
  *v5 = v0;
  v5[1] = sub_218973A18;
  return sub_21898927C();
}

uint64_t sub_218973A18()
{
  uint64_t v0;
  uint64_t *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  v3 = *(_QWORD *)(*v1 + 88);
  v4 = *(_QWORD *)(*v1 + 64);
  v5 = *v1;
  *(_QWORD *)(v5 + 112) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_218973AC4()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_218973B00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E808);
  if (swift_isClassType())
    v1 = v0;
  else
    v1 = 0;
  if (v1)
    v2 = (uint64_t *)&unk_253E6E8B8;
  else
    v2 = (uint64_t *)&unk_253E6E8A0;
  return __swift_instantiateConcreteTypeFromMangledName(v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A1D8C4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for SKALocalStatusServer.DatabaseDelegate()
{
  return objc_opt_self();
}

uint64_t sub_218973BC8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
  return swift_retain();
}

uint64_t sub_218973BE4()
{
  uint64_t v0;

  return sub_218951428(v0);
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

uint64_t sub_218973C04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_218951B38(a1, a2, a3, a4, v4);
}

void sub_218973C0C(void *a1)
{
  uint64_t v1;

  sub_218953F6C(a1, v1, (uint64_t)&unk_24D9787A0, (uint64_t)&unk_255001900, "Found device without an IDS identifier {device: %@}");
}

void sub_218973C3C(void *a1)
{
  uint64_t v1;

  sub_218953F6C(a1, v1, (uint64_t)&unk_24D978778, (uint64_t)&unk_2550018A8, "Lost device without an IDS identifier {device: %@}");
}

uint64_t sub_218973C70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2189802D0;
  v4 = (_QWORD *)swift_task_alloc();
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_2189802D0;
  v4[9] = v2;
  return swift_task_switch();
}

_QWORD *sub_218973CF0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2550017D0);
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
    sub_21897BE74(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_218973DFC(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550018E8);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253E6E540) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_2189891EC();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253E6E540) - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_21897D49C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_21897400C(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255001860);
  v10 = *(_QWORD *)(sub_218988D24() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_2189891EC();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_218988D24() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_21897D5B8(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

_QWORD *sub_218974214(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2550017D8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4])
          memmove(v12, a4 + 4, 24 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_21897DD34(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_218974338(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_218974408(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21897F3BC((uint64_t)v12, *a3);
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
      sub_21897F3BC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_218974408(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2189890CC();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2189745C0(a5, a6);
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
  v8 = sub_218989180();
  if (!v8)
  {
    sub_2189891EC();
    __break(1u);
LABEL_17:
    result = sub_218989228();
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

uint64_t sub_2189745C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_218974654(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21897482C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21897482C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_218974654(uint64_t a1, unint64_t a2)
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
      v3 = sub_2189747C8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21898915C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2189891EC();
      __break(1u);
LABEL_10:
      v2 = sub_218988F70();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_218989228();
    __break(1u);
LABEL_14:
    result = sub_2189891EC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2189747C8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E8B0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21897482C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E8B0);
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
  result = sub_218989228();
  __break(1u);
  return result;
}

unint64_t sub_218974978(uint64_t a1)
{
  uint64_t v2;

  sub_2189892C4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  sub_21897FAFC((unint64_t *)&unk_253E6E560, &qword_253E6E718, MEMORY[0x24BE60B30]);
  sub_218988EF8();
  type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(0);
  swift_bridgeObjectRetain();
  sub_218988F4C();
  swift_bridgeObjectRelease();
  v2 = sub_2189892E8();
  return sub_218974BC8(a1, v2);
}

unint64_t sub_218974A38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2189892C4();
  sub_218988F4C();
  v4 = sub_2189892E8();
  return sub_218974D40(a1, a2, v4);
}

unint64_t sub_218974A9C(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  sub_21897FAFC((unint64_t *)&unk_253E6E560, &qword_253E6E718, MEMORY[0x24BE60B30]);
  v2 = sub_218988EEC();
  return sub_218974E20(a1, v2);
}

unint64_t sub_218974B14()
{
  unint64_t result;

  result = qword_255001560;
  if (!qword_255001560)
  {
    result = MEMORY[0x219A1D8D0](&protocol conformance descriptor for SKAError, &type metadata for SKAError);
    atomic_store(result, (unint64_t *)&qword_255001560);
  }
  return result;
}

uint64_t sub_218974B58(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x219A1D8D0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_218974B98(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_218989108();
  return sub_218974F64(a1, v2);
}

unint64_t sub_218974BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v18;
  uint64_t v19;

  v19 = type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(0);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = -1 << *(_BYTE *)(v2 + 32);
  v9 = a2 & ~v8;
  if (((*(_QWORD *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0)
  {
    v10 = ~v8;
    v11 = *(_QWORD *)(v5 + 72);
    while (1)
    {
      sub_21897F33C(*(_QWORD *)(v2 + 48) + v9 * v11, (uint64_t)v7, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
      sub_2189770C8();
      sub_21897710C();
      if ((sub_218988D90() & 1) != 0)
      {
        v12 = *(int *)(v19 + 20);
        v13 = *(_QWORD *)&v7[v12];
        v14 = *(_QWORD *)&v7[v12 + 8];
        v15 = (_QWORD *)(a1 + v12);
        v16 = v13 == *v15 && v14 == v15[1];
        if (v16 || (sub_218989240() & 1) != 0)
          break;
      }
      sub_21897F380((uint64_t)v7, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
      v9 = (v9 + 1) & v10;
      if (((*(_QWORD *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        return v9;
    }
    sub_21897F380((uint64_t)v7, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
  }
  return v9;
}

unint64_t sub_218974D40(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_218989240() & 1) == 0)
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
      while (!v14 && (sub_218989240() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_218974E20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_21897FAFC(&qword_253E6E570, &qword_253E6E718, MEMORY[0x24BE60B38]);
      v14 = sub_218988F10();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_218974F64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_21897F91C(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x219A1CE80](v9, a1);
      sub_21897F8C8((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_218975028@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_218974A38(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v17 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_2189777C0();
      v11 = v17;
    }
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 56);
    v13 = sub_218988BF8();
    v14 = *(_QWORD *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v14 + 32))(a3, v12 + *(_QWORD *)(v14 + 72) * v8, v13);
    sub_21897673C(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a3, 0, 1, v13);
  }
  else
  {
    v16 = sub_218988BF8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a3, 1, 1, v16);
  }
}

uint64_t sub_218975158(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_218974A9C(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v2;
  v12 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_218977DFC((uint64_t *)&unk_253E6E888);
    v7 = v12;
  }
  v8 = *(_QWORD *)(v7 + 48);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * v4, v9);
  v10 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v4);
  sub_218976938(v4, v7);
  *v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_21897523C(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  int v43;
  char *v44;
  uint64_t v45;

  v3 = v2;
  v45 = sub_218988BF8();
  v5 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v44 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001878);
  v43 = a2;
  v8 = sub_218989210();
  v9 = v8;
  if (*(_QWORD *)(v7 + 16))
  {
    v40 = v2;
    v10 = 1 << *(_BYTE *)(v7 + 32);
    v11 = *(_QWORD *)(v7 + 64);
    v42 = (_QWORD *)(v7 + 64);
    if (v10 < 64)
      v12 = ~(-1 << v10);
    else
      v12 = -1;
    v13 = v12 & v11;
    v41 = (unint64_t)(v10 + 63) >> 6;
    v14 = v8 + 64;
    result = swift_retain();
    v16 = 0;
    while (1)
    {
      if (v13)
      {
        v19 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v20 = v19 | (v16 << 6);
      }
      else
      {
        v21 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v41)
          goto LABEL_34;
        v22 = v42[v21];
        ++v16;
        if (!v22)
        {
          v16 = v21 + 1;
          if (v21 + 1 >= v41)
            goto LABEL_34;
          v22 = v42[v16];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v41)
            {
LABEL_34:
              swift_release();
              v3 = v40;
              if ((v43 & 1) != 0)
              {
                v38 = 1 << *(_BYTE *)(v7 + 32);
                if (v38 >= 64)
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v42 = -1 << v38;
                *(_QWORD *)(v7 + 16) = 0;
              }
              break;
            }
            v22 = v42[v23];
            if (!v22)
            {
              while (1)
              {
                v16 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v16 >= v41)
                  goto LABEL_34;
                v22 = v42[v16];
                ++v23;
                if (v22)
                  goto LABEL_21;
              }
            }
            v16 = v23;
          }
        }
LABEL_21:
        v13 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v16 << 6);
      }
      v24 = *(_QWORD *)(v7 + 56);
      v25 = v7;
      v26 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * v20);
      v28 = *v26;
      v27 = v26[1];
      v29 = *(_QWORD *)(v5 + 72);
      v30 = v24 + v29 * v20;
      if ((v43 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v44, v30, v45);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v44, v30, v45);
        swift_bridgeObjectRetain();
      }
      sub_2189892C4();
      sub_218988F4C();
      result = sub_2189892E8();
      v31 = -1 << *(_BYTE *)(v9 + 32);
      v32 = result & ~v31;
      v33 = v32 >> 6;
      if (((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v34 = 0;
        v35 = (unint64_t)(63 - v31) >> 6;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v36 = v33 == v35;
          if (v33 == v35)
            v33 = 0;
          v34 |= v36;
          v37 = *(_QWORD *)(v14 + 8 * v33);
        }
        while (v37 == -1);
        v17 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v17);
      *v18 = v28;
      v18[1] = v27;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v9 + 56) + v29 * v17, v44, v45);
      ++*(_QWORD *)(v9 + 16);
      v7 = v25;
    }
  }
  result = swift_release();
  *v3 = v9;
  return result;
}

uint64_t sub_2189755A4(uint64_t a1, char a2, uint64_t *a3)
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
  v7 = sub_218989210();
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
    sub_2189892C4();
    sub_218988F4C();
    result = sub_2189892E8();
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

uint64_t sub_2189758AC(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  int v42;

  v3 = v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550018C8);
  v42 = a2;
  v10 = sub_218989210();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v40 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v38 = v2;
  v39 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  for (i = v9; ; v9 = i)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v39)
      break;
    v23 = v40;
    v24 = v40[v22];
    ++v18;
    if (!v24)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_34;
      v24 = v40[v18];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_34:
          swift_release();
          v3 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            v18 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v18 >= v39)
              goto LABEL_34;
            v24 = v40[v18];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v18 = v25;
      }
    }
LABEL_21:
    v15 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v6 + 72);
    v27 = *(_QWORD *)(v9 + 48) + v26 * v21;
    if ((v42 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
      swift_bridgeObjectRetain();
    }
    sub_21897FAFC((unint64_t *)&unk_253E6E560, &qword_253E6E718, MEMORY[0x24BE60B30]);
    result = sub_218988EEC();
    v29 = -1 << *(_BYTE *)(v11 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v16 + 8 * v31);
      }
      while (v35 == -1);
      v19 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v19) = v28;
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v36 = 1 << *(_BYTE *)(v9 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_218975C44(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t result;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  _QWORD *v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  uint64_t i;
  int v44;

  v5 = v3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v44 = a2;
  v12 = sub_218989210();
  v13 = v12;
  if (!*(_QWORD *)(v11 + 16))
    goto LABEL_41;
  v14 = 1 << *(_BYTE *)(v11 + 32);
  v15 = *(_QWORD *)(v11 + 64);
  v42 = (_QWORD *)(v11 + 64);
  if (v14 < 64)
    v16 = ~(-1 << v14);
  else
    v16 = -1;
  v17 = v16 & v15;
  v40 = v3;
  v41 = (unint64_t)(v14 + 63) >> 6;
  v18 = v12 + 64;
  result = swift_retain();
  v20 = 0;
  for (i = v11; ; v11 = i)
  {
    if (v17)
    {
      v22 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41)
      break;
    v25 = v42;
    v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      v20 = v24 + 1;
      if (v24 + 1 >= v41)
        goto LABEL_34;
      v26 = v42[v20];
      if (!v26)
      {
        v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          v5 = v40;
          if ((v44 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            v20 = v27 + 1;
            if (__OFADD__(v27, 1))
              goto LABEL_43;
            if (v20 >= v41)
              goto LABEL_34;
            v26 = v42[v20];
            ++v27;
            if (v26)
              goto LABEL_21;
          }
        }
        v20 = v27;
      }
    }
LABEL_21:
    v17 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    v28 = *(_QWORD *)(v8 + 72);
    v29 = *(_QWORD *)(v11 + 48) + v28 * v23;
    if ((v44 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 32))(v10, v29, v7);
      v30 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v10, v29, v7);
      v30 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v23);
      swift_retain();
    }
    sub_21897FAFC((unint64_t *)&unk_253E6E560, &qword_253E6E718, MEMORY[0x24BE60B30]);
    result = sub_218988EEC();
    v31 = -1 << *(_BYTE *)(v13 + 32);
    v32 = result & ~v31;
    v33 = v32 >> 6;
    if (((-1 << v32) & ~*(_QWORD *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      v21 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v36 = v33 == v35;
        if (v33 == v35)
          v33 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(_QWORD *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v8 + 32))(*(_QWORD *)(v13 + 48) + v28 * v21, v10, v7);
    *(_QWORD *)(*(_QWORD *)(v13 + 56) + 8 * v21) = v30;
    ++*(_QWORD *)(v13 + 16);
  }
  swift_release();
  v5 = v40;
  v25 = v42;
  if ((v44 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v38 = 1 << *(_BYTE *)(v11 + 32);
  if (v38 >= 64)
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v25 = -1 << v38;
  *(_QWORD *)(v11 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v5 = v13;
  return result;
}

uint64_t sub_218975FE0(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;

  v3 = v2;
  v5 = type metadata accessor for SKALocalStatusServer.FailedDelivery(0);
  v42 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v46 = (uint64_t)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(0);
  v43 = *(_QWORD *)(v7 - 8);
  v44 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550017C0);
  v45 = a2;
  v11 = sub_218989210();
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_41;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = *(_QWORD *)(v10 + 64);
  v41 = (_QWORD *)(v10 + 64);
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v39 = v2;
  v40 = (unint64_t)(v13 + 63) >> 6;
  v17 = v11 + 64;
  result = swift_retain();
  v19 = 0;
  while (1)
  {
    if (v16)
    {
      v21 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v22 = v21 | (v19 << 6);
      goto LABEL_22;
    }
    v23 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = v41;
    v25 = v41[v23];
    ++v19;
    if (!v25)
    {
      v19 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_34;
      v25 = v41[v19];
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_34:
          swift_release();
          v3 = v39;
          if ((v45 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v25 = v41[v26];
        if (!v25)
        {
          while (1)
          {
            v19 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_43;
            if (v19 >= v40)
              goto LABEL_34;
            v25 = v41[v19];
            ++v26;
            if (v25)
              goto LABEL_21;
          }
        }
        v19 = v26;
      }
    }
LABEL_21:
    v16 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v19 << 6);
LABEL_22:
    v27 = *(_QWORD *)(v43 + 72);
    v28 = *(_QWORD *)(v10 + 48) + v27 * v22;
    if ((v45 & 1) != 0)
    {
      sub_21897F960(v28, (uint64_t)v9, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
      v29 = *(_QWORD *)(v42 + 72);
      sub_21897F960(*(_QWORD *)(v10 + 56) + v29 * v22, v46, type metadata accessor for SKALocalStatusServer.FailedDelivery);
    }
    else
    {
      sub_21897F33C(v28, (uint64_t)v9, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
      v29 = *(_QWORD *)(v42 + 72);
      sub_21897F33C(*(_QWORD *)(v10 + 56) + v29 * v22, v46, type metadata accessor for SKALocalStatusServer.FailedDelivery);
    }
    sub_2189892C4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
    sub_21897FAFC((unint64_t *)&unk_253E6E560, &qword_253E6E718, MEMORY[0x24BE60B30]);
    sub_218988EF8();
    swift_bridgeObjectRetain();
    sub_218988F4C();
    swift_bridgeObjectRelease();
    result = sub_2189892E8();
    v30 = -1 << *(_BYTE *)(v12 + 32);
    v31 = result & ~v30;
    v32 = v31 >> 6;
    if (((-1 << v31) & ~*(_QWORD *)(v17 + 8 * (v31 >> 6))) != 0)
    {
      v20 = __clz(__rbit64((-1 << v31) & ~*(_QWORD *)(v17 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v33 = 0;
      v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v35 = v32 == v34;
        if (v32 == v34)
          v32 = 0;
        v33 |= v35;
        v36 = *(_QWORD *)(v17 + 8 * v32);
      }
      while (v36 == -1);
      v20 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(_QWORD *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    sub_21897F960((uint64_t)v9, *(_QWORD *)(v12 + 48) + v20 * v27, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
    result = sub_21897F960(v46, *(_QWORD *)(v12 + 56) + v20 * v29, type metadata accessor for SKALocalStatusServer.FailedDelivery);
    ++*(_QWORD *)(v12 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = v41;
  if ((v45 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v37 = 1 << *(_BYTE *)(v10 + 32);
  if (v37 >= 64)
    bzero(v24, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v37;
  *(_QWORD *)(v10 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v12;
  return result;
}

uint64_t sub_218976440(uint64_t a1, char a2)
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
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550017A8);
  v6 = sub_218989210();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
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
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_21897F4B8(v24, v35);
      }
      else
      {
        sub_21897F3BC((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_2189892C4();
      sub_218988F4C();
      result = sub_2189892E8();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_21897F4B8(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_21897673C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_2189890FC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        sub_2189892C4();
        swift_bridgeObjectRetain();
        sub_218988F4C();
        v9 = sub_2189892E8();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v10 < v8)
          goto LABEL_11;
LABEL_12:
        v11 = *(_QWORD *)(a2 + 48);
        v12 = (_OWORD *)(v11 + 16 * v3);
        v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1)
          *v12 = *v13;
        v14 = *(_QWORD *)(a2 + 56);
        v15 = *(_QWORD *)(*(_QWORD *)(sub_218988BF8() - 8) + 72);
        v16 = v15 * v3;
        result = v14 + v15 * v3;
        v17 = v15 * v6;
        v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v16 == v17)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v10 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v10)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_218976938(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, unint64_t, uint64_t);
  unint64_t v34;
  uint64_t v35;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v35 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_2189890FC();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v34 = (result + 1) & v11;
      v12 = *(_QWORD *)(v35 + 72);
      v33 = *(void (**)(char *, unint64_t, uint64_t))(v35 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v33(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_21897FAFC((unint64_t *)&unk_253E6E560, &qword_253E6E718, MEMORY[0x24BE60B30]);
        v18 = sub_218988EEC();
        result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v34)
        {
          if (v19 >= v34 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v22 = *(_QWORD *)(a2 + 48);
            result = v22 + v15 * a1;
            v8 = v14;
            if (v15 * a1 < v16 || (v12 = v15, result >= v22 + v16 + v15))
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              v13 = v17;
              v12 = v15;
            }
            else if (v15 * a1 != v16)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            v23 = *(_QWORD *)(a2 + 56);
            v24 = (_QWORD *)(v23 + 8 * a1);
            v25 = (_QWORD *)(v23 + 8 * v10);
            if (a1 != v10 || (a1 = v10, v24 >= v25 + 1))
            {
              *v24 = *v25;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v34 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        v8 = v14;
        v12 = v15;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v27 = *v26;
    v28 = (-1 << a1) - 1;
  }
  else
  {
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v28 = *v26;
    v27 = (-1 << a1) - 1;
  }
  *v26 = v28 & v27;
  v29 = *(_QWORD *)(a2 + 16);
  v30 = __OFSUB__(v29, 1);
  v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_218976BDC(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v29 = type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(0);
  v4 = *(_QWORD *)(v29 - 8);
  result = MEMORY[0x24BDAC7A8](v29);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_2189890FC();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v28 = (result + 1) & v11;
      v12 = *(_QWORD *)(v4 + 72);
      v30 = v12;
      do
      {
        v13 = v10 * v12;
        sub_21897F33C(*(_QWORD *)(a2 + 48) + v10 * v12, (uint64_t)v7, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        sub_2189892C4();
        __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
        sub_21897FAFC((unint64_t *)&unk_253E6E560, &qword_253E6E718, MEMORY[0x24BE60B30]);
        sub_218988EF8();
        swift_bridgeObjectRetain();
        sub_218988F4C();
        swift_bridgeObjectRelease();
        v14 = sub_2189892E8();
        result = sub_21897F380((uint64_t)v7, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
        v15 = v14 & v11;
        if (a1 >= (uint64_t)v28)
        {
          if (v15 < v28)
          {
            v12 = v30;
          }
          else
          {
            v12 = v30;
            if (a1 >= (uint64_t)v15)
              goto LABEL_12;
          }
        }
        else
        {
          v12 = v30;
          if (v15 >= v28 || a1 >= (uint64_t)v15)
          {
LABEL_12:
            if (a1 * v12 < v13
              || *(_QWORD *)(a2 + 48) + a1 * v12 >= (unint64_t)(*(_QWORD *)(a2 + 48) + v13 + v12))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a1 * v12 != v13)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v16 = *(_QWORD *)(a2 + 56);
            v17 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for SKALocalStatusServer.FailedDelivery(0) - 8) + 72);
            v18 = v17 * a1;
            result = v16 + v17 * a1;
            v19 = v17 * v10;
            v20 = v16 + v17 * v10 + v17;
            if (v18 < v19 || result >= v20)
            {
              result = swift_arrayInitWithTakeFrontToBack();
              a1 = v10;
              v12 = v30;
            }
            else
            {
              a1 = v10;
              v12 = v30;
              if (v18 != v19)
              {
                result = swift_arrayInitWithTakeBackToFront();
                a1 = v10;
              }
            }
          }
        }
        v10 = (v10 + 1) & v11;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v22 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v23 = *v22;
    v24 = (-1 << a1) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v24 = *v22;
    v23 = (-1 << a1) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_218976F08(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  char v23;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_218974A38(a2, a3);
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
        v19 = v18[7];
        v20 = sub_218988BF8();
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v12, a1, v20);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_2189777C0();
      goto LABEL_7;
    }
    sub_21897523C(v15, a4 & 1);
    v22 = sub_218974A38(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_218977574(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_218989264();
  __break(1u);
  return result;
}

uint64_t sub_218977044(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253E6E5F0);
    v10 = sub_21897FAFC(a2, &qword_253E6E540, a3);
    result = MEMORY[0x219A1D8D0](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2189770C8()
{
  unint64_t result;

  result = qword_253E6E6B8;
  if (!qword_253E6E6B8)
  {
    result = MEMORY[0x219A1D8D0](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_253E6E6B8);
  }
  return result;
}

unint64_t sub_21897710C()
{
  unint64_t result;

  result = qword_253E6E6B0;
  if (!qword_253E6E6B0)
  {
    result = MEMORY[0x219A1D8D0](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_253E6E6B0);
  }
  return result;
}

uint64_t sub_218977150(uint64_t a1, uint64_t a2, char a3, uint64_t *a4)
{
  _QWORD *v4;
  _QWORD **v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t result;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;

  v6 = (_QWORD **)v4;
  v27 = a1;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (_QWORD *)*v4;
  v15 = sub_218974A9C(a2);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  v19 = v14;
  v20 = v13[3];
  if (v20 >= v18 && (a3 & 1) != 0)
  {
LABEL_7:
    v21 = *v6;
    if ((v19 & 1) != 0)
    {
LABEL_8:
      v22 = v21[7];
      result = swift_release();
      *(_QWORD *)(v22 + 8 * v15) = v27;
      return result;
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a3 & 1) == 0)
  {
    sub_218977DFC(a4);
    goto LABEL_7;
  }
  sub_218975C44(v18, a3 & 1, a4);
  v24 = sub_218974A9C(a2);
  if ((v19 & 1) != (v25 & 1))
  {
LABEL_14:
    result = sub_218989264();
    __break(1u);
    return result;
  }
  v15 = v24;
  v21 = *v6;
  if ((v19 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a2, v9);
  return sub_218977604(v15, (uint64_t)v12, v27, v21);
}

uint64_t sub_2189772C4(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  v8 = type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (_QWORD *)*v3;
  v13 = sub_218974978(a2);
  v14 = v11[2];
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    v17 = v12;
    v18 = v11[3];
    if (v18 >= v16 && (a3 & 1) != 0)
    {
LABEL_7:
      v19 = *v4;
      if ((v17 & 1) != 0)
      {
LABEL_8:
        v20 = v19[7];
        v21 = type metadata accessor for SKALocalStatusServer.FailedDelivery(0);
        return sub_21897F9A8(a1, v20 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * v13);
      }
      goto LABEL_11;
    }
    if (v18 >= v16 && (a3 & 1) == 0)
    {
      sub_218978030();
      goto LABEL_7;
    }
    sub_218975FE0(v16, a3 & 1);
    v23 = sub_218974978(a2);
    if ((v17 & 1) == (v24 & 1))
    {
      v13 = v23;
      v19 = *v4;
      if ((v17 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_21897F33C(a2, (uint64_t)v10, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
      return sub_2189776A0(v13, (uint64_t)v10, a1, v19);
    }
  }
  result = sub_218989264();
  __break(1u);
  return result;
}

_OWORD *sub_218977444(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
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
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_218974A38(a2, a3);
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
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
        return sub_21897F4B8(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_2189782C8();
      goto LABEL_7;
    }
    sub_218976440(v15, a4 & 1);
    v21 = sub_218974A38(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_218977758(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_218989264();
  __break(1u);
  return result;
}

uint64_t sub_218977574(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = sub_218988BF8();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1, a4, v10);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

uint64_t sub_218977604(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

uint64_t sub_2189776A0(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(0);
  sub_21897F960(a2, v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
  v10 = a4[7];
  v11 = type metadata accessor for SKALocalStatusServer.FailedDelivery(0);
  result = sub_21897F960(a3, v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, type metadata accessor for SKALocalStatusServer.FailedDelivery);
  v13 = a4[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a4[2] = v15;
  return result;
}

_OWORD *sub_218977758(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_21897F4B8(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

void *sub_2189777C0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = sub_218988BF8();
  v1 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001878);
  v31 = v0;
  v4 = *v0;
  v5 = sub_218989204();
  v6 = *(_QWORD *)(v4 + 16);
  v35 = v5;
  if (!v6)
  {
    result = (void *)swift_release();
    v29 = v35;
    v28 = v31;
LABEL_28:
    *v28 = v29;
    return result;
  }
  v7 = v5;
  result = (void *)(v5 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    v7 = v35;
  }
  v32 = v4 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v4 + 16);
  v12 = 1 << *(_BYTE *)(v4 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v4 + 64);
  v33 = (unint64_t)(v12 + 63) >> 6;
  v15 = v34;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      v11 = v25 + 1;
      if (v25 + 1 >= v33)
        goto LABEL_26;
      v26 = *(_QWORD *)(v32 + 8 * v11);
      if (!v26)
        break;
    }
LABEL_25:
    v14 = (v26 - 1) & v26;
    v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(_QWORD *)(v4 + 56) + v22, v15);
    v23 = v35;
    v24 = (_QWORD *)(*(_QWORD *)(v35 + 48) + v18);
    *v24 = v21;
    v24[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(_QWORD *)(v23 + 56) + v22, v3, v15);
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    result = (void *)swift_release();
    v28 = v31;
    v29 = v35;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v32 + 8 * v27);
  if (v26)
  {
    v11 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v11 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v11);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_218977A1C(uint64_t *a1)
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
  v4 = sub_218989204();
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

void *sub_218977BC4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int64_t v25;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550018C8);
  v23 = v0;
  v5 = *v0;
  v6 = sub_218989204();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_23:
    result = (void *)swift_release();
    *v23 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v24 = v5 + 64;
  v10 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v11 = 1 << *(_BYTE *)(v5 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v5 + 64);
  v25 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25)
      goto LABEL_23;
    v20 = *(_QWORD *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v25)
        goto LABEL_23;
      v20 = *(_QWORD *)(v24 + 8 * v10);
      if (!v20)
        break;
    }
LABEL_22:
    v13 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    v16 = *(_QWORD *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v16, v1);
    v17 = 8 * v15;
    v18 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v15);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v16, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v17) = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v21 = v19 + 2;
  if (v21 >= v25)
    goto LABEL_23;
  v20 = *(_QWORD *)(v24 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v25)
      goto LABEL_23;
    v20 = *(_QWORD *)(v24 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_218977DFC(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *result;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int64_t v28;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v26 = v1;
  v7 = *v1;
  v8 = sub_218989204();
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v26 = v9;
    return result;
  }
  result = (void *)(v8 + 64);
  v11 = (unint64_t)((1 << *(_BYTE *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11)
    result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  v27 = v7 + 64;
  v13 = 0;
  *(_QWORD *)(v9 + 16) = *(_QWORD *)(v7 + 16);
  v14 = 1 << *(_BYTE *)(v7 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v7 + 64);
  v28 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v18 = v17 | (v13 << 6);
      goto LABEL_12;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v28)
      goto LABEL_26;
    v23 = *(_QWORD *)(v27 + 8 * v22);
    ++v13;
    if (!v23)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v28)
        goto LABEL_26;
      v23 = *(_QWORD *)(v27 + 8 * v13);
      if (!v23)
        break;
    }
LABEL_25:
    v16 = (v23 - 1) & v23;
    v18 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_12:
    v19 = *(_QWORD *)(v4 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(_QWORD *)(v7 + 48) + v19, v3);
    v20 = 8 * v18;
    v21 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(_QWORD *)(v9 + 48) + v19, v6, v3);
    *(_QWORD *)(*(_QWORD *)(v9 + 56) + v20) = v21;
    result = (void *)swift_retain();
  }
  v24 = v22 + 2;
  if (v24 >= v28)
    goto LABEL_26;
  v23 = *(_QWORD *)(v27 + 8 * v24);
  if (v23)
  {
    v13 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v13 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v13 >= v28)
      goto LABEL_26;
    v23 = *(_QWORD *)(v27 + 8 * v13);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_218978030()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *result;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;

  v1 = v0;
  v2 = type metadata accessor for SKALocalStatusServer.FailedDelivery(0);
  v30 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(0);
  v29 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550017C0);
  v8 = *v0;
  v9 = sub_218989204();
  v10 = v9;
  v11 = *(_QWORD *)(v8 + 16);
  if (!v11)
  {
    result = (void *)swift_release();
LABEL_25:
    *v1 = v10;
    return result;
  }
  v26 = v1;
  result = (void *)(v9 + 64);
  v13 = (unint64_t)((1 << *(_BYTE *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v13)
  {
    result = memmove(result, (const void *)(v8 + 64), 8 * v13);
    v11 = *(_QWORD *)(v8 + 16);
  }
  v14 = 0;
  *(_QWORD *)(v10 + 16) = v11;
  v15 = 1 << *(_BYTE *)(v8 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & *(_QWORD *)(v8 + 64);
  v27 = v8 + 64;
  v28 = (unint64_t)(v15 + 63) >> 6;
  while (1)
  {
    if (v17)
    {
      v18 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v19 = v18 | (v14 << 6);
      goto LABEL_9;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v22 >= v28)
      goto LABEL_23;
    v23 = *(_QWORD *)(v27 + 8 * v22);
    ++v14;
    if (!v23)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v28)
        goto LABEL_23;
      v23 = *(_QWORD *)(v27 + 8 * v14);
      if (!v23)
        break;
    }
LABEL_22:
    v17 = (v23 - 1) & v23;
    v19 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_9:
    v20 = *(_QWORD *)(v29 + 72) * v19;
    sub_21897F33C(*(_QWORD *)(v8 + 48) + v20, (uint64_t)v7, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
    v21 = *(_QWORD *)(v30 + 72) * v19;
    sub_21897F33C(*(_QWORD *)(v8 + 56) + v21, (uint64_t)v4, type metadata accessor for SKALocalStatusServer.FailedDelivery);
    sub_21897F960((uint64_t)v7, *(_QWORD *)(v10 + 48) + v20, type metadata accessor for SKALocalStatusServer.FailedDelivery.ID);
    result = (void *)sub_21897F960((uint64_t)v4, *(_QWORD *)(v10 + 56) + v21, type metadata accessor for SKALocalStatusServer.FailedDelivery);
  }
  v24 = v22 + 2;
  if (v24 >= v28)
  {
LABEL_23:
    result = (void *)swift_release();
    v1 = v26;
    goto LABEL_25;
  }
  v23 = *(_QWORD *)(v27 + 8 * v24);
  if (v23)
  {
    v14 = v24;
    goto LABEL_22;
  }
  while (1)
  {
    v14 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v14 >= v28)
      goto LABEL_23;
    v23 = *(_QWORD *)(v27 + 8 * v14);
    ++v24;
    if (v23)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_2189782C8()
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
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550017A8);
  v2 = *v0;
  v3 = sub_218989204();
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
    v20 = 32 * v15;
    sub_21897F3BC(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_21897F4B8(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
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

uint64_t sub_2189784AC(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;

  v5 = *v2;
  sub_2189892C4();
  sub_2189892D0();
  v6 = sub_2189892E8();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = *v2;
    *v2 = 0x8000000000000000;
    sub_21897AC48(a2, v8, isUniquelyReferenced_nonNull_native);
    *v2 = v13;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v9 = *(_QWORD *)(v5 + 48);
  if (*(_QWORD *)(v9 + 8 * v8) != a2)
  {
    v10 = ~v7;
    do
    {
      v8 = (v8 + 1) & v10;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_QWORD *)(v9 + 8 * v8) != a2);
  }
  result = 0;
  a2 = *(_QWORD *)(*(_QWORD *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_2189785C8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t *v16;
  uint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v20;

  v7 = *v3;
  sub_2189892C4();
  sub_2189892DC();
  swift_bridgeObjectRetain();
  if (a3)
  {
    swift_bridgeObjectRetain();
    sub_218988F4C();
    swift_bridgeObjectRelease();
  }
  v8 = sub_2189892E8();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v20 = *v3;
    *v3 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    sub_21897AD94(a2, a3, v10, isUniquelyReferenced_nonNull_native);
    *v3 = v20;
    swift_bridgeObjectRelease();
    *a1 = a2;
    a1[1] = a3;
    return 1;
  }
  v11 = ~v9;
  v12 = *(_QWORD *)(v7 + 48);
  while (1)
  {
    v13 = (_QWORD *)(v12 + 16 * v10);
    v14 = v13[1];
    if (v14)
      break;
    if (!a3)
      goto LABEL_15;
LABEL_6:
    v10 = (v10 + 1) & v11;
    if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
      goto LABEL_16;
  }
  if (!a3)
    goto LABEL_6;
  v15 = *v13 == a2 && v14 == a3;
  if (!v15 && (sub_218989240() & 1) == 0)
    goto LABEL_6;
  swift_bridgeObjectRelease();
LABEL_15:
  swift_bridgeObjectRelease();
  v16 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
  v17 = v16[1];
  *a1 = *v16;
  a1[1] = v17;
  swift_bridgeObjectRetain();
  return 0;
}

uint64_t sub_218978790(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_2189892C4();
  swift_bridgeObjectRetain();
  sub_218988F4C();
  v8 = sub_2189892E8();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_218989240() & 1) != 0)
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
      if (v19 || (sub_218989240() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_21897AF48(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_21897893C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v19;

  v5 = *v2;
  sub_2189892C4();
  swift_bridgeObjectRetain();
  sub_218988F4C();
  v6 = sub_2189892E8();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = *(_QWORD *)(v5 + 48);
  v10 = (_QWORD *)(v9 + 16 * v8);
  v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_218989240() & 1) == 0)
  {
    v15 = ~v7;
    do
    {
      v8 = (v8 + 1) & v15;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_18;
      v16 = (_QWORD *)(v9 + 16 * v8);
      v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_218989240() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v2;
  v19 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_218979850();
    v13 = v19;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v8);
  sub_21897AA84(v8);
  *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_218978AC8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_218973CF0(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_218989228();
  __break(1u);
  return result;
}

uint64_t sub_218978C18(unint64_t a1)
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
    v3 = sub_2189891F8();
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
    v5 = sub_2189891F8();
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
    v4 = MEMORY[0x219A1CEE0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_21897B0E0(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_2189891F8();
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
    return sub_218988FB8();
  }
  __break(1u);
  return result;
}

_QWORD *sub_218978DD0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550017D0);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_21897B3F0((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_21897F958();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

size_t sub_218978EB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  size_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E898);
  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718) - 8);
  v4 = *(_QWORD *)(v3 + 72);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      v9 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718) - 8) + 80);
      v10 = sub_21897B5EC(&v11, (uint64_t)v6 + ((v9 + 32) & ~v9), v1, a1);
      swift_bridgeObjectRetain();
      sub_21897F958();
      if (v10 == v1)
        return (size_t)v6;
      __break(1u);
      return MEMORY[0x24BEE4AF8];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_218978FEC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_218979040(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_218979008(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2189791C8(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_218979024(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_218979330(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_218979040(char a1, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001890);
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E5D8);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_218989228();
  __break(1u);
  return result;
}

uint64_t sub_2189791C8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550017D0);
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
  result = sub_218989228();
  __break(1u);
  return result;
}

uint64_t sub_218979330(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001840);
  v10 = *(_QWORD *)(sub_218988BF8() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_218988BF8() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_218989228();
  __break(1u);
  return result;
}

void *sub_218979510()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E670);
  v2 = *v0;
  v3 = sub_21898912C();
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2189796A4()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255001960);
  v2 = *v0;
  v3 = sub_21898912C();
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_OWORD *)(*(_QWORD *)(v4 + 48) + 16 * v15) = *(_OWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    result = (void *)swift_bridgeObjectRetain();
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_218979850()
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001758);
  v2 = *v0;
  v3 = sub_21898912C();
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

uint64_t sub_218979A00()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E670);
  result = sub_218989138();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v10)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v10)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
    sub_2189892C4();
    sub_2189892D0();
    result = sub_2189892E8();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v0;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_218979C78()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255001960);
  v3 = sub_218989138();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_37:
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
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v16 >= v29)
      goto LABEL_35;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_35;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_35;
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
    v21 = *v19;
    v20 = v19[1];
    sub_2189892C4();
    sub_2189892DC();
    if (v20)
    {
      swift_bridgeObjectRetain_n();
      sub_218988F4C();
      swift_bridgeObjectRelease();
    }
    result = sub_2189892E8();
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
    *v13 = v21;
    v13[1] = v20;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_35:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_37;
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
      goto LABEL_35;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_218979F4C()
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001758);
  v3 = sub_218989138();
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
    sub_2189892C4();
    swift_bridgeObjectRetain();
    sub_218988F4C();
    result = sub_2189892E8();
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

uint64_t sub_21897A1F8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E670);
  result = sub_218989138();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (_QWORD *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10)
          goto LABEL_33;
        v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_33;
          v16 = v6[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v10)
              goto LABEL_33;
            v16 = v6[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                v26 = 1 << *(_BYTE *)(v2 + 32);
                if (v26 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v26;
                v1 = v0;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v10)
                    goto LABEL_33;
                  v16 = v6[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
      sub_2189892C4();
      sub_2189892D0();
      result = sub_2189892E8();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_21897A4A0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255001960);
  v3 = sub_218989138();
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
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_35;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_35;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_35;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_35:
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
                    goto LABEL_41;
                  if (v11 >= v8)
                    goto LABEL_35;
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
      v21 = *v19;
      v20 = v19[1];
      sub_2189892C4();
      sub_2189892DC();
      if (v20)
      {
        swift_bridgeObjectRetain();
        sub_218988F4C();
        swift_bridgeObjectRelease();
      }
      result = sub_2189892E8();
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
            goto LABEL_40;
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
      *v13 = v21;
      v13[1] = v20;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_21897A7A8()
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255001758);
  v3 = sub_218989138();
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
      sub_2189892C4();
      sub_218988F4C();
      result = sub_2189892E8();
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

unint64_t sub_21897AA84(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_2189890FC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_2189892C4();
        swift_bridgeObjectRetain();
        sub_218988F4C();
        v10 = sub_2189892E8();
        swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9)
            goto LABEL_5;
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(v3 + 48);
          v13 = (_OWORD *)(v12 + 16 * v2);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (v2 = v6, v13 >= v14 + 1))
          {
            *v13 = *v14;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v15 = *(_QWORD *)(v3 + 16);
  v16 = __OFSUB__(v15, 1);
  v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_21897AC48(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_21897A1F8();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_218979510();
      goto LABEL_14;
    }
    sub_218979A00();
  }
  v8 = *v3;
  sub_2189892C4();
  sub_2189892D0();
  result = sub_2189892E8();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      type metadata accessor for IDSDeviceType();
      result = sub_218989258();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_QWORD *)(v10 + 8 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

uint64_t sub_21897AD94(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_21897A4A0();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_2189796A4();
      goto LABEL_22;
    }
    sub_218979C78();
  }
  v11 = *v4;
  sub_2189892C4();
  sub_2189892DC();
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_218988F4C();
    swift_bridgeObjectRelease();
  }
  result = sub_2189892E8();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = ~v12;
    v15 = *(_QWORD *)(v11 + 48);
    do
    {
      v16 = (_QWORD *)(v15 + 16 * a3);
      v17 = v16[1];
      if (v17)
      {
        if (a2)
        {
          v18 = *v16 == v8 && v17 == a2;
          if (v18 || (result = sub_218989240(), (result & 1) != 0))
          {
LABEL_21:
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E5D8);
            result = sub_218989258();
            __break(1u);
            break;
          }
        }
      }
      else if (!a2)
      {
        goto LABEL_21;
      }
      a3 = (a3 + 1) & v14;
    }
    while (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0);
  }
LABEL_22:
  v19 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v20 = (uint64_t *)(*(_QWORD *)(v19 + 48) + 16 * a3);
  *v20 = v8;
  v20[1] = a2;
  v21 = *(_QWORD *)(v19 + 16);
  v22 = __OFADD__(v21, 1);
  v23 = v21 + 1;
  if (v22)
    __break(1u);
  else
    *(_QWORD *)(v19 + 16) = v23;
  return result;
}

uint64_t sub_21897AF48(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_21897A7A8();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_218979850();
      goto LABEL_22;
    }
    sub_218979F4C();
  }
  v11 = *v4;
  sub_2189892C4();
  sub_218988F4C();
  result = sub_2189892E8();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_218989240(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_218989258();
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
          result = sub_218989240();
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

uint64_t sub_21897B0E0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_2189891F8();
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
    v10 = sub_2189891F8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_21897FAFC(&qword_2550017F0, &qword_2550017E8, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2550017E8);
          v12 = sub_21897B2FC(v16, i, a3);
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
    sub_21897FBC8(0, (unint64_t *)&unk_253E6E858);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_218989228();
  __break(1u);
  return result;
}

void (*sub_21897B2FC(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_21897B37C(v6, a2, a3);
  return sub_21897B350;
}

void sub_21897B350(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_21897B37C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x219A1CED4](a2, a3);
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
    return sub_21897B3E8;
  }
  __break(1u);
  return result;
}

void sub_21897B3E8(id *a1)
{

}

uint64_t sub_21897B3F0(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_21897B5EC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  _QWORD *v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v32 - v14;
  v39 = a4;
  v18 = *(_QWORD *)(a4 + 64);
  v17 = a4 + 64;
  v16 = v18;
  v37 = v17;
  v19 = -1 << *(_BYTE *)(v17 - 32);
  if (-v19 < 64)
    v20 = ~(-1 << -(char)v19);
  else
    v20 = -1;
  v21 = v20 & v16;
  if (!a2)
  {
    v22 = 0;
    a3 = 0;
LABEL_38:
    v31 = v37;
    *a1 = v39;
    a1[1] = v31;
    a1[2] = ~v19;
    a1[3] = v22;
    a1[4] = v21;
    return a3;
  }
  if (!a3)
  {
    v22 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v34 = -1 << *(_BYTE *)(v17 - 32);
  v35 = a1;
  v22 = 0;
  v23 = 0;
  v36 = (unint64_t)(63 - v19) >> 6;
  v33 = v36 - 1;
  v38 = a3;
  if (!v21)
    goto LABEL_9;
LABEL_8:
  v24 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  v25 = v24 | (v22 << 6);
  while (1)
  {
    ++v23;
    v29 = *(_QWORD *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v12, *(_QWORD *)(v39 + 48) + v29 * v25, v8);
    v30 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v30(v15, v12, v8);
    result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(a2, v15, v8);
    a3 = v38;
    if (v23 == v38)
      goto LABEL_37;
    a2 += v29;
    if (v21)
      goto LABEL_8;
LABEL_9:
    v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v26 >= v36)
      goto LABEL_32;
    v27 = *(_QWORD *)(v37 + 8 * v26);
    if (!v27)
      break;
LABEL_18:
    v21 = (v27 - 1) & v27;
    v25 = __clz(__rbit64(v27)) + (v26 << 6);
    v22 = v26;
  }
  v22 += 2;
  if (v26 + 1 >= v36)
  {
    v21 = 0;
    v22 = v26;
    goto LABEL_36;
  }
  v27 = *(_QWORD *)(v37 + 8 * v22);
  if (v27)
    goto LABEL_14;
  v28 = v26 + 2;
  if (v26 + 2 >= v36)
    goto LABEL_32;
  v27 = *(_QWORD *)(v37 + 8 * v28);
  if (v27)
    goto LABEL_17;
  v22 = v26 + 3;
  if (v26 + 3 >= v36)
  {
    v21 = 0;
    v22 = v26 + 2;
    goto LABEL_36;
  }
  v27 = *(_QWORD *)(v37 + 8 * v22);
  if (v27)
  {
LABEL_14:
    v26 = v22;
    goto LABEL_18;
  }
  v28 = v26 + 4;
  if (v26 + 4 >= v36)
  {
LABEL_32:
    v21 = 0;
LABEL_36:
    a3 = v23;
LABEL_37:
    v19 = v34;
    a1 = v35;
    goto LABEL_38;
  }
  v27 = *(_QWORD *)(v37 + 8 * v28);
  if (v27)
  {
LABEL_17:
    v26 = v28;
    goto LABEL_18;
  }
  while (1)
  {
    v26 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v26 >= v36)
    {
      v21 = 0;
      v22 = v33;
      goto LABEL_36;
    }
    v27 = *(_QWORD *)(v37 + 8 * v26);
    ++v28;
    if (v27)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_21897B8B8(uint64_t a1)
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

uint64_t sub_21897B940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v8 = a1;
  v9 = a2;
  v10 = BYTE2(a2);
  v11 = BYTE3(a2);
  v12 = BYTE4(a2);
  v13 = BYTE5(a2);
  sub_21897348C((uint64_t)&v8, (uint64_t)&v8 + BYTE6(a2), a3, a4);
  if (!v4)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_21897BA14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_218988B20();
  v11 = result;
  if (result)
  {
    result = sub_218988B38();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_218988B2C();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_21897348C(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_21897BAC8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_21897BB14()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_21897BB48 + *((int *)qword_21897BD20 + (v0 >> 62))))();
}

uint64_t sub_21897BB58@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (v1 == BYTE6(v2))
  {
    if (v1 >= 1)
      __asm { BR              X10 }
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

uint64_t sub_21897BD40(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_218989048();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_218978790(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_21897BDD4(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253E6E5D8);
  sub_2189801C4();
  result = sub_218989048();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2189785C8(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_21897BE74(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_218989228();
  __break(1u);
  return result;
}

uint64_t sub_21897BF64(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_218988F58();
    return sub_218988F7C();
  }
  return result;
}

uint64_t sub_21897BFEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  char *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t *v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  unint64_t v37;
  char v38;
  NSObject *v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  unint64_t *v43;
  unint64_t *v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  char v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  _QWORD *v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  uint64_t v69;
  _QWORD *v70;
  NSObject *v71;
  os_log_type_t v72;
  uint8_t *v73;
  uint64_t v74;
  unint64_t *v75;
  unint64_t *v76;
  unint64_t v77;
  const char *v78;
  unint64_t v79;
  NSObject *v80;
  os_log_type_t v81;
  uint8_t *v82;
  NSObject *v83;
  os_log_type_t v84;
  uint8_t *v85;
  unint64_t v86;
  char v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  id v102;
  void *v103;
  id v104;
  char *v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  NSObject *v109;
  os_log_type_t v110;
  uint8_t *v111;
  uint64_t v112;
  _QWORD *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  char *v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  unint64_t v134;
  uint64_t aBlock[6];
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  uint64_t v145;

  v145 = a2;
  v129 = sub_218988EA4();
  v128 = *(_QWORD *)(v129 - 8);
  MEMORY[0x24BDAC7A8](v129);
  v127 = (char *)&v114 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v126 = sub_218988EBC();
  v125 = *(_QWORD *)(v126 - 8);
  MEMORY[0x24BDAC7A8](v126);
  v124 = (char *)&v114 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_218988BF8();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v114 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v114 - v9;
  v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v130 = *(_QWORD *)(v131 - 8);
  v11 = *(_QWORD *)(v130 + 64);
  v12 = MEMORY[0x24BDAC7A8](v131);
  v122 = (char *)&v114 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v133 = (char *)&v114 - v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E5A8);
  MEMORY[0x24BDAC7A8](v14);
  v132 = (uint64_t)&v114 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_218988DFC();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v121 = (char *)&v114 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v114 - v20;
  if (qword_253E6EE80 != -1)
    swift_once();
  v22 = sub_218988E20();
  v134 = __swift_project_value_buffer(v22, (uint64_t)qword_253E6EE68);
  v23 = sub_218988E14();
  v24 = sub_218989078();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    v120 = a1;
    v26 = v10;
    v27 = v8;
    v28 = v21;
    v29 = v17;
    v30 = v16;
    v31 = v25;
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_2188DF000, v23, v24, "Receive local status START", v25, 2u);
    v32 = v31;
    v16 = v30;
    v17 = v29;
    v21 = v28;
    v8 = v27;
    v10 = v26;
    a1 = v120;
    MEMORY[0x219A1D978](v32, -1, -1);
  }

  v33 = v145;
  if (!v145)
  {
    v39 = sub_218988E14();
    v40 = sub_21898906C();
    if (os_log_type_enabled(v39, (os_log_type_t)v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_2188DF000, v39, (os_log_type_t)v40, "Receive local status FAILED. Missing options", v41, 2u);
      MEMORY[0x219A1D978](v41, -1, -1);
    }

    v42 = sub_218988DD8();
    sub_218974B58(&qword_255001570, (uint64_t (*)(uint64_t))MEMORY[0x24BE60B58], MEMORY[0x24BE60B60]);
    swift_allocError();
    v44 = v43;
    v45 = 0x736E6F6974706FLL;
    v46 = 0xE700000000000000;
    goto LABEL_25;
  }
  *(_QWORD *)&v142 = sub_218988F28();
  *((_QWORD *)&v142 + 1) = v34;
  sub_218989120();
  if (*(_QWORD *)(v33 + 16) && (v35 = sub_218974B98((uint64_t)aBlock), (v36 & 1) != 0))
  {
    sub_21897F3BC(*(_QWORD *)(v33 + 56) + 32 * v35, (uint64_t)&v142);
  }
  else
  {
    v142 = 0u;
    v143 = 0u;
  }
  sub_21897F8C8((uint64_t)aBlock);
  if (!*((_QWORD *)&v143 + 1))
  {
    sub_21897FCD4((uint64_t)&v142, &qword_255001768);
    v49 = sub_218988E14();
    v50 = sub_21898906C();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_2188DF000, v49, v50, "Receive local status FAILED. Missing idsID", v51, 2u);
      MEMORY[0x219A1D978](v51, -1, -1);
    }

    v42 = sub_218988DD8();
    sub_218974B58(&qword_255001570, (uint64_t (*)(uint64_t))MEMORY[0x24BE60B58], MEMORY[0x24BE60B60]);
    swift_allocError();
    v44 = v43;
    v45 = 0xD000000000000022;
    v46 = 0x80000002189934F0;
LABEL_25:
    *v43 = v45;
    v43[1] = v46;
    (*(void (**)(unint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v42 - 8) + 104))(v44, *MEMORY[0x24BE60B50], v42);
    return swift_willThrow();
  }
  sub_21897F4B8(&v142, &v144);
  *(_QWORD *)&v140 = 0x656D614E79656BLL;
  *((_QWORD *)&v140 + 1) = 0xE700000000000000;
  sub_218989120();
  if (*(_QWORD *)(a1 + 16) && (v37 = sub_218974B98((uint64_t)aBlock), (v38 & 1) != 0))
  {
    sub_21897F3BC(*(_QWORD *)(a1 + 56) + 32 * v37, (uint64_t)&v140);
  }
  else
  {
    v140 = 0u;
    v141 = 0u;
  }
  sub_21897F8C8((uint64_t)aBlock);
  if (!*((_QWORD *)&v141 + 1))
  {
    sub_21897FCD4((uint64_t)&v140, &qword_255001768);
    v61 = sub_218988E14();
    v62 = sub_21898906C();
    if (os_log_type_enabled(v61, v62))
    {
      v63 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v63 = 0;
      _os_log_impl(&dword_2188DF000, v61, v62, "Receive local status FAILED. Missing keyName", v63, 2u);
      MEMORY[0x219A1D978](v63, -1, -1);
    }

    v64 = sub_218988DD8();
    sub_218974B58(&qword_255001570, (uint64_t (*)(uint64_t))MEMORY[0x24BE60B58], MEMORY[0x24BE60B60]);
    swift_allocError();
    *v65 = 0xD000000000000010;
    v65[1] = 0x8000000218993520;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v64 - 8) + 104))(v65, *MEMORY[0x24BE60B50], v64);
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)&v144);
  }
  sub_21897F4B8(&v140, &v142);
  *(_QWORD *)&v138 = 0x69616D6F4479656BLL;
  *((_QWORD *)&v138 + 1) = 0xE90000000000006ELL;
  sub_218989120();
  if (*(_QWORD *)(a1 + 16) && (v47 = sub_218974B98((uint64_t)aBlock), (v48 & 1) != 0))
  {
    sub_21897F3BC(*(_QWORD *)(a1 + 56) + 32 * v47, (uint64_t)&v138);
  }
  else
  {
    v138 = 0u;
    v139 = 0u;
  }
  sub_21897F8C8((uint64_t)aBlock);
  if (!*((_QWORD *)&v139 + 1))
  {
    sub_21897FCD4((uint64_t)&v138, &qword_255001768);
    v66 = sub_218988E14();
    v67 = sub_21898906C();
    if (os_log_type_enabled(v66, v67))
    {
      v68 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v68 = 0;
      _os_log_impl(&dword_2188DF000, v66, v67, "Receive local status FAILED. Missing keyDomain", v68, 2u);
      MEMORY[0x219A1D978](v68, -1, -1);
    }

    v69 = sub_218988DD8();
    sub_218974B58(&qword_255001570, (uint64_t (*)(uint64_t))MEMORY[0x24BE60B58], MEMORY[0x24BE60B60]);
    swift_allocError();
    *v70 = 0xD000000000000012;
    v70[1] = 0x8000000218993540;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v69 - 8) + 104))(v70, *MEMORY[0x24BE60B50], v69);
    swift_willThrow();
    goto LABEL_49;
  }
  sub_21897F4B8(&v138, &v140);
  sub_21897F3BC((uint64_t)&v144, (uint64_t)aBlock);
  if (!swift_dynamicCast())
  {
    v71 = sub_218988E14();
    v72 = sub_21898906C();
    if (os_log_type_enabled(v71, v72))
    {
      v73 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v73 = 0;
      _os_log_impl(&dword_2188DF000, v71, v72, "Receive local status FAILEd. Could not cast anyIDSIdentifier", v73, 2u);
      MEMORY[0x219A1D978](v73, -1, -1);
    }

    v74 = sub_218988DD8();
    sub_218974B58(&qword_255001570, (uint64_t (*)(uint64_t))MEMORY[0x24BE60B58], MEMORY[0x24BE60B60]);
    swift_allocError();
    v76 = v75;
    v77 = 0xD000000000000015;
    v78 = "cast anyIDSIdentifier";
    goto LABEL_43;
  }
  v53 = *((_QWORD *)&v138 + 1);
  v145 = v138;
  sub_21897F3BC((uint64_t)&v142, (uint64_t)aBlock);
  if (!swift_dynamicCast())
  {
    swift_bridgeObjectRelease();
    v80 = sub_218988E14();
    v81 = sub_21898906C();
    if (os_log_type_enabled(v80, v81))
    {
      v82 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v82 = 0;
      _os_log_impl(&dword_2188DF000, v80, v81, "Receive local status FAILED. Could not cast anyKeyName", v82, 2u);
      MEMORY[0x219A1D978](v82, -1, -1);
    }

    v74 = sub_218988DD8();
    sub_218974B58(&qword_255001570, (uint64_t (*)(uint64_t))MEMORY[0x24BE60B58], MEMORY[0x24BE60B60]);
    swift_allocError();
    v76 = v75;
    v77 = 0x796E612074736163;
    v79 = 0xEF656D614E79654BLL;
    goto LABEL_47;
  }
  v54 = *((_QWORD *)&v138 + 1);
  v120 = v138;
  sub_21897F3BC((uint64_t)&v140, (uint64_t)aBlock);
  if (!swift_dynamicCast())
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v83 = sub_218988E14();
    v84 = sub_21898906C();
    if (os_log_type_enabled(v83, v84))
    {
      v85 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v85 = 0;
      _os_log_impl(&dword_2188DF000, v83, v84, "Receive local status FAILED. Could not cast anyKeyDomain", v85, 2u);
      MEMORY[0x219A1D978](v85, -1, -1);
    }

    v74 = sub_218988DD8();
    sub_218974B58(&qword_255001570, (uint64_t (*)(uint64_t))MEMORY[0x24BE60B58], MEMORY[0x24BE60B60]);
    swift_allocError();
    v76 = v75;
    v77 = 0xD000000000000011;
    v78 = "cast anyKeyDomain";
LABEL_43:
    v79 = (unint64_t)(v78 - 32) | 0x8000000000000000;
LABEL_47:
    *v75 = v77;
    v75[1] = v79;
    (*(void (**)(unint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v74 - 8) + 104))(v76, *MEMORY[0x24BE60B48], v74);
    swift_willThrow();
LABEL_48:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v140);
LABEL_49:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v142);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)&v144);
  }
  v118 = v54;
  v119 = v53;
  v55 = v138;
  swift_bridgeObjectRetain();
  v56 = v132;
  v117 = (id)v55;
  sub_218988DE4();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v56, 1, v16) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_21897FCD4(v56, &qword_253E6E5A8);
    swift_bridgeObjectRetain();
    v57 = sub_218988E14();
    v58 = sub_218989060();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = (uint8_t *)swift_slowAlloc();
      v60 = swift_slowAlloc();
      aBlock[0] = v60;
      *(_DWORD *)v59 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v138 = sub_218974338((uint64_t)v117, *((unint64_t *)&v55 + 1), aBlock);
      sub_2189890C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2188DF000, v57, v58, "Receive local status FAILED. Unknown domain %s.", v59, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A1D978](v60, -1, -1);
      MEMORY[0x219A1D978](v59, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v74 = sub_218988DD8();
    sub_218974B58(&qword_255001570, (uint64_t (*)(uint64_t))MEMORY[0x24BE60B58], MEMORY[0x24BE60B60]);
    swift_allocError();
    v76 = v75;
    v77 = 0x206E776F6E6B6E75;
    v79 = 0xEE006E69616D6F64;
    goto LABEL_47;
  }
  v116 = *((_QWORD *)&v55 + 1);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))(v21, v56, v16);
  *(_QWORD *)&v136 = 0x64616F6C796170;
  *((_QWORD *)&v136 + 1) = 0xE700000000000000;
  sub_218989120();
  if (*(_QWORD *)(a1 + 16))
  {
    v86 = sub_218974B98((uint64_t)aBlock);
    if ((v87 & 1) != 0)
    {
      sub_21897F3BC(*(_QWORD *)(a1 + 56) + 32 * v86, (uint64_t)&v136);
    }
    else
    {
      v136 = 0u;
      v137 = 0u;
    }
  }
  else
  {
    v136 = 0u;
    v137 = 0u;
  }
  sub_21897F8C8((uint64_t)aBlock);
  if (*((_QWORD *)&v137 + 1))
  {
    sub_21897F4B8(&v136, &v138);
    sub_21897F3BC((uint64_t)&v138, (uint64_t)aBlock);
    if (!swift_dynamicCast())
    {
      v108 = v16;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v109 = sub_218988E14();
      v110 = sub_21898906C();
      if (os_log_type_enabled(v109, v110))
      {
        v111 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v111 = 0;
        _os_log_impl(&dword_2188DF000, v109, v110, "Receive local status FAILED. Could not cast anyPayload", v111, 2u);
        MEMORY[0x219A1D978](v111, -1, -1);
      }

      v112 = sub_218988DD8();
      sub_218974B58(&qword_255001570, (uint64_t (*)(uint64_t))MEMORY[0x24BE60B58], MEMORY[0x24BE60B60]);
      swift_allocError();
      *v113 = 0x796E612074736163;
      v113[1] = 0xEF64616F6C796150;
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v112 - 8) + 104))(v113, *MEMORY[0x24BE60B48], v112);
      swift_willThrow();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v138);
      (*(void (**)(char *, uint64_t))(v17 + 8))(v21, v108);
      goto LABEL_48;
    }
    v134 = *((_QWORD *)&v136 + 1);
    v132 = v136;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v138);
  }
  else
  {
    sub_21897FCD4((uint64_t)&v136, &qword_255001768);
    v132 = 0;
    v134 = 0xF000000000000000;
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v121, v21, v16);
  sub_2189770C8();
  v115 = v16;
  sub_21897710C();
  v88 = v118;
  swift_bridgeObjectRetain();
  sub_218988DB4();
  v121 = (char *)sub_218988D9C();
  v114 = v89;
  sub_218988BE0();
  sub_218988BE0();
  v90 = objc_allocWithZone((Class)SKADatabaseSubscribedLocalStatus);
  v91 = v132;
  v92 = v134;
  sub_21897FB3C(v132, v134);
  v93 = v91;
  v132 = v91;
  v94 = v119;
  swift_bridgeObjectRetain();
  v117 = sub_2189730AC((uint64_t)v121, v114, (uint64_t)v10, (uint64_t)v8, v120, v88, (uint64_t)v117, v116, v93, v92);
  v95 = v123;
  v118 = *(_QWORD *)(v123 + 144);
  v96 = v130;
  v97 = v122;
  v98 = v131;
  (*(void (**)(char *, char *, uint64_t))(v130 + 16))(v122, v133, v131);
  v99 = *(unsigned __int8 *)(v96 + 80);
  v121 = v21;
  v120 = v17;
  v100 = (v99 + 48) & ~v99;
  v101 = (char *)swift_allocObject();
  v102 = v117;
  *((_QWORD *)v101 + 2) = v117;
  *((_QWORD *)v101 + 3) = v95;
  *((_QWORD *)v101 + 4) = v145;
  *((_QWORD *)v101 + 5) = v94;
  (*(void (**)(char *, char *, uint64_t))(v96 + 32))(&v101[v100], v97, v98);
  aBlock[4] = (uint64_t)sub_21897FF20;
  aBlock[5] = (uint64_t)v101;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_218951B34;
  aBlock[3] = (uint64_t)&block_descriptor_117;
  v103 = _Block_copy(aBlock);
  v104 = v102;
  swift_retain();
  v105 = v124;
  sub_218988EB0();
  *(_QWORD *)&v138 = MEMORY[0x24BEE4AF8];
  sub_218974B58(&qword_255001770, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255001778);
  sub_21897FAFC((unint64_t *)&unk_255001780, &qword_255001778, MEMORY[0x24BEE12C8]);
  v106 = v127;
  v107 = v129;
  sub_2189890F0();
  MEMORY[0x219A1CE08](0, v105, v106, v103);
  _Block_release(v103);

  sub_21897E088(v132, v134);
  (*(void (**)(char *, uint64_t))(v128 + 8))(v106, v107);
  (*(void (**)(char *, uint64_t))(v125 + 8))(v105, v126);
  (*(void (**)(char *, uint64_t))(v130 + 8))(v133, v98);
  (*(void (**)(char *, uint64_t))(v120 + 8))(v121, v115);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v140);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v142);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v144);
  return swift_release();
}

uint64_t sub_21897D49C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253E6E540) - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_218989228();
  __break(1u);
  return result;
}

uint64_t sub_21897D5B8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_218988D24() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_218989228();
  __break(1u);
  return result;
}

void *sub_21897D6D0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  char v20;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;

  v4 = v3;
  v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    v8 = sub_2189891F8();
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      v22 = v4;
      v23 = v7;
      v24 = v7 & 0xC000000000000001;
      v4 = 4;
      do
      {
        v9 = v4 - 4;
        if (v24)
        {
          v10 = (id)MEMORY[0x219A1CED4](v4 - 4, v7);
          v11 = v4 - 3;
          if (__OFADD__(v9, 1))
            goto LABEL_19;
        }
        else
        {
          v10 = *(id *)(v7 + 8 * v4);
          v11 = v4 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        v12 = v8;
        v13 = v10;
        v14 = a3;
        v15 = objc_msgSend(v10, sel_identifier, v22);
        v16 = sub_218988F28();
        v18 = v17;

        a3 = v14;
        v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v13;
        }
        v20 = sub_218989240();
        swift_bridgeObjectRelease();
        if ((v20 & 1) != 0)
          goto LABEL_18;

        ++v4;
        v8 = v12;
        v19 = v11 == v12;
        v7 = v23;
      }
      while (!v19);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_21897D874(unint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v12 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_16;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      v3 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v4 = (id)MEMORY[0x219A1CED4](v3, a1);
LABEL_9:
        v5 = v4;
        v6 = v3 + 1;
        if (__OFADD__(v3, 1))
          goto LABEL_15;
        v7 = objc_msgSend(v4, sel_idsIdentifier);
        v8 = sub_218988F28();
        v10 = v9;

        LOBYTE(v7) = sub_21895EDFC(v8, v10);
        swift_bridgeObjectRelease();
        if ((v7 & 1) != 0)
        {
          sub_21898918C();
          sub_2189891A4();
          sub_2189891B0();
          sub_218989198();
        }
        else
        {

        }
        ++v3;
        if (v6 == v2)
          return v12;
      }
      if (v3 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      v2 = sub_2189891F8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    v4 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_21897D9F8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  uint64_t v19;

  v19 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_22;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
    while (1)
    {
      v6 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v7 = (id)MEMORY[0x219A1CED4](v6, a1);
LABEL_9:
        v8 = v7;
        v9 = v6 + 1;
        if (__OFADD__(v6, 1))
          goto LABEL_21;
        v10 = v5;
        v11 = objc_msgSend(v7, sel_idsIdentifier);
        v12 = sub_218988F28();
        v14 = v13;

        if (v12 == a2 && v14 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_17:
          sub_21898918C();
          sub_2189891A4();
          sub_2189891B0();
          sub_218989198();
          goto LABEL_5;
        }
        v16 = sub_218989240();
        swift_bridgeObjectRelease();
        if ((v16 & 1) != 0)
          goto LABEL_17;

LABEL_5:
        ++v6;
        v5 = v10;
        if (v9 == v10)
          return v19;
      }
      if (v6 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      v5 = sub_2189891F8();
      if (!v5)
        return MEMORY[0x24BEE4AF8];
    }
    v7 = *(id *)(a1 + 8 * v6 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_21897DBB0(unint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v14;

  v14 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_16;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      v4 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v5 = (id)MEMORY[0x219A1CED4](v4, a1);
LABEL_9:
        v6 = v5;
        v7 = v4 + 1;
        if (__OFADD__(v4, 1))
          goto LABEL_15;
        v8 = objc_msgSend(v5, sel_identifier);
        v9 = sub_218988F28();
        v11 = v10;

        LOBYTE(v8) = sub_21895E7C8(v9, v11, a2);
        swift_bridgeObjectRelease();
        if ((v8 & 1) != 0)
        {

        }
        else
        {
          sub_21898918C();
          sub_2189891A4();
          sub_2189891B0();
          sub_218989198();
        }
        ++v4;
        if (v7 == v3)
          return v14;
      }
      if (v4 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      v3 = sub_2189891F8();
      if (!v3)
        return MEMORY[0x24BEE4AF8];
    }
    v5 = *(id *)(a1 + 8 * v4 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_21897DD34(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 24 * a1 + 32;
    v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2550017E0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_218989228();
  __break(1u);
  return result;
}

uint64_t sub_21897DE40(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD v16[3];
  uint64_t v17;

  v2 = sub_218988E20();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_253E6EE80 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_253E6EE68);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_bridgeObjectRetain_n();
  v7 = sub_218988E14();
  v8 = sub_218989078();
  if (!os_log_type_enabled(v7, v8))
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  v9 = (uint8_t *)swift_slowAlloc();
  result = swift_slowAlloc();
  v17 = result;
  *(_DWORD *)v9 = 136315138;
  if (a1)
  {
    v11 = result;
    v16[0] = v9 + 4;
    v12 = swift_bridgeObjectRetain();
    v16[1] = MEMORY[0x24BEE4AD8] + 8;
    v13 = MEMORY[0x219A1CD18](v12);
    v15 = v14;
    swift_bridgeObjectRelease();
    v16[2] = sub_218974338(v13, v15, &v17);
    sub_2189890C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2188DF000, v7, v8, "IDS devices changes: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A1D978](v11, -1, -1);
    MEMORY[0x219A1D978](v9, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  __break(1u);
  return result;
}

void *sub_21897E05C(void *result)
{
  if (result)
  {

    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_21897E088(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21897E09C(a1, a2);
  return a1;
}

uint64_t sub_21897E09C(uint64_t a1, unint64_t a2)
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

uint64_t sub_21897E0E0()
{
  return sub_218974B58((unint64_t *)&unk_253E6E6F8, (uint64_t (*)(uint64_t))MEMORY[0x24BE60910], MEMORY[0x24BE60900]);
}

uint64_t sub_21897E10C()
{
  return sub_218974B58(qword_2550015B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE609B8], MEMORY[0x24BE609A8]);
}

uint64_t sub_21897E138()
{
  return sub_218974B58((unint64_t *)&unk_253E6E548, (uint64_t (*)(uint64_t))MEMORY[0x24BE60998], MEMORY[0x24BE60990]);
}

uint64_t sub_21897E164()
{
  return type metadata accessor for SKALocalStatusServer(0);
}

uint64_t type metadata accessor for SKALocalStatusServer(uint64_t a1)
{
  return sub_21897EF50(a1, qword_253E6EE50);
}

void sub_21897E180()
{
  unint64_t v0;

  sub_21897E274();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for SKALocalStatusServer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SKALocalStatusServer.__allocating_init(idsDeviceProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

void sub_21897E274()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E6E6D0)
  {
    sub_218988C1C();
    v0 = sub_2189890B4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253E6E6D0);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for SKALocalStatusServer.IncomingLocalStatusRequest(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SKALocalStatusServer.IncomingLocalStatusRequest()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for SKALocalStatusServer.IncomingLocalStatusRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for SKALocalStatusServer.IncomingLocalStatusRequest(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
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

_OWORD *assignWithTake for SKALocalStatusServer.IncomingLocalStatusRequest(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SKALocalStatusServer.IncomingLocalStatusRequest(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SKALocalStatusServer.IncomingLocalStatusRequest(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SKALocalStatusServer.IncomingLocalStatusRequest()
{
  return &type metadata for SKALocalStatusServer.IncomingLocalStatusRequest;
}

uint64_t destroy for SKALocalStatusServer.BrowseTask(id *a1)
{

  return swift_bridgeObjectRelease();
}

uint64_t _s18StatusKitAgentCore20SKALocalStatusServerC10BrowseTaskVwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SKALocalStatusServer.BrowseTask(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
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

uint64_t assignWithTake for SKALocalStatusServer.BrowseTask(uint64_t a1, uint64_t a2)
{

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SKALocalStatusServer.BrowseTask(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SKALocalStatusServer.BrowseTask(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
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
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SKALocalStatusServer.BrowseTask()
{
  return &type metadata for SKALocalStatusServer.BrowseTask;
}

uint64_t *sub_21897E6A0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_218988BF8();
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
    v9 = *(int *)(a3 + 24);
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_21897E754(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v4 = sub_218988BF8();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21897E7B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;

  v6 = sub_218988BF8();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21897E840(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;

  v6 = sub_218988BF8();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  *v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21897E8DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_218988BF8();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_21897E958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_218988BF8();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  v12 = *v10;
  v11 = v10[1];
  *v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21897E9E4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21897E9F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_218988BF8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_21897EA70()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21897EA7C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_218988BF8();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for SKALocalStatusServer.FailedDelivery(uint64_t a1)
{
  return sub_21897EF50(a1, qword_253E6EE30);
}

uint64_t sub_21897EB0C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_218988BF8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_21897EB80(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_21897EC18(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21897EC64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21897ECD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21897ED50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_21897EDB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21897EE20()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21897EE2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_21897EEB0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21897EEBC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(uint64_t a1)
{
  return sub_21897EF50(a1, (uint64_t *)&unk_253E6EA00);
}

uint64_t sub_21897EF50(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21897EF84()
{
  unint64_t v0;

  sub_21897EFF4();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_21897EFF4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253E6E580)
  {
    sub_2189770C8();
    sub_21897710C();
    v0 = sub_218988DCC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253E6E580);
  }
}

unint64_t sub_21897F05C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255001BF0[0];
  if (!qword_255001BF0[0])
  {
    v1 = type metadata accessor for SKALocalStatusServer.FailedDelivery.ID(255);
    result = MEMORY[0x219A1D8D0](&unk_2189904F0, v1);
    atomic_store(result, qword_255001BF0);
  }
  return result;
}

void type metadata accessor for IDSDeviceType()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_253E6E660)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_253E6E660);
  }
}

uint64_t sub_21897F0F8()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_21897F13C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = v0[4];
  v3 = v0[5];
  v4 = v0[6];
  v5 = v0[7];
  v6 = v0[8];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_2189802D0;
  return sub_21896BCB4((uint64_t)v7, v8, v9, v2, v3, v4, v5, v6);
}

uint64_t sub_21897F1B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_218988BF8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21897F248()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(sub_218988BF8() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = v0 + v3;
  v6 = *(double *)(v0 + v4);
  v7 = *(_QWORD *)(v0 + ((v4 + 15) & 0xFFFFFFFFFFFFF8));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v8;
  *v8 = v1;
  v8[1] = sub_2189802D0;
  return sub_21896DB5C(v6, (uint64_t)v8, v9, v10, v5, v7);
}

void *sub_21897F2DC(void *result)
{
  id v1;

  if (result)
  {
    v1 = result;
    return (void *)swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_21897F308()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_21897F32C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_invalidate);
}

uint64_t sub_21897F33C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21897F380(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21897F3BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21897F3F8(uint64_t a1)
{
  uint64_t v1;

  return sub_218970984(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_21897F404()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255001798);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_21897F484()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255001798) - 8) + 80);
  sub_218970BF8(*(void **)(v0 + 16), *(void **)(v0 + 24), v0 + ((v1 + 32) & ~v1));
}

_OWORD *sub_21897F4B8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_21897F4C8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255001798);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_21897F52C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t v6;
  char v7;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  _OWORD v21[2];

  __swift_instantiateConcreteTypeFromMangledName(&qword_255001798);
  if (a3)
  {
    v5 = a3;
LABEL_15:
    swift_willThrow();
    goto LABEL_16;
  }
  if (!a1)
  {
    v9 = sub_218988DD8();
    sub_218974B58(&qword_255001570, (uint64_t (*)(uint64_t))MEMORY[0x24BE60B58], MEMORY[0x24BE60B60]);
    a3 = (void *)swift_allocError();
    v11 = v10;
    v12 = 0xE800000000000000;
LABEL_14:
    *v10 = 0x65736E6F70736572;
    v10[1] = v12;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v11, *MEMORY[0x24BE60B50], v9);
    goto LABEL_15;
  }
  *(_QWORD *)&v18 = 0x73736563637573;
  *((_QWORD *)&v18 + 1) = 0xE700000000000000;
  sub_218989120();
  if (*(_QWORD *)(a1 + 16) && (v6 = sub_218974B98((uint64_t)v20), (v7 & 1) != 0))
  {
    sub_21897F3BC(*(_QWORD *)(a1 + 56) + 32 * v6, (uint64_t)&v18);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  sub_21897F8C8((uint64_t)v20);
  if (!*((_QWORD *)&v19 + 1))
  {
    sub_21897FCD4((uint64_t)&v18, &qword_255001768);
    v9 = sub_218988DD8();
    sub_218974B58(&qword_255001570, (uint64_t (*)(uint64_t))MEMORY[0x24BE60B58], MEMORY[0x24BE60B60]);
    a3 = (void *)swift_allocError();
    v11 = v10;
    v12 = 0xEF73736563637553;
    goto LABEL_14;
  }
  sub_21897F4B8(&v18, v21);
  sub_21897F3BC((uint64_t)v21, (uint64_t)v20);
  if ((swift_dynamicCast() & 1) != 0)
  {
    if ((v18 & 1) != 0)
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255001798);
      return sub_218988FF4();
    }
    v13 = sub_218988DD8();
    sub_218974B58(&qword_255001570, (uint64_t (*)(uint64_t))MEMORY[0x24BE60B58], MEMORY[0x24BE60B60]);
    a3 = (void *)swift_allocError();
    v15 = v14;
    v16 = 0xD000000000000022;
    v17 = 0x80000002189930F0;
  }
  else
  {
    v13 = sub_218988DD8();
    sub_218974B58(&qword_255001570, (uint64_t (*)(uint64_t))MEMORY[0x24BE60B58], MEMORY[0x24BE60B60]);
    a3 = (void *)swift_allocError();
    v15 = v14;
    v16 = 0x796E612074736143;
    v17 = 0xEF73736563637553;
  }
  *v14 = v16;
  v14[1] = v17;
  (*(void (**)(unint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v15, *MEMORY[0x24BE60B48], v13);
  swift_willThrow();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
LABEL_16:
  v20[0] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255001798);
  return sub_218988FE8();
}

uint64_t sub_21897F884(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_21897F8C8(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_21897F91C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_21897F958()
{
  return swift_release();
}

uint64_t sub_21897F960(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_21897F9A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SKALocalStatusServer.FailedDelivery(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21897F9EC(void *a1)
{
  uint64_t v1;

  return sub_21896A948(a1, v1);
}

void sub_21897F9F4(void *a1)
{
  uint64_t v1;

  sub_21896B070(a1, v1);
}

uint64_t sub_21897FA00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2189802D0;
  return sub_21896B3C0((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_21897FA50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = swift_task_alloc();
  v3 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_2189802D0;
  *(_OWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

unint64_t sub_21897FAB0()
{
  unint64_t result;

  result = qword_253E6E528;
  if (!qword_253E6E528)
  {
    result = MEMORY[0x219A1D8D0](MEMORY[0x24BDCDE20], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_253E6E528);
  }
  return result;
}

uint64_t sub_21897FAFC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x219A1D8D0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21897FB3C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21897F884(a1, a2);
  return a1;
}

uint64_t sub_21897FB54()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = v0[4];
  v3 = v0[5];
  v5 = v0[6];
  v4 = v0[7];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_2189802D0;
  return sub_2189541FC((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

uint64_t sub_21897FBB8(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_21897FBC8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21897FC00(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id sub_21897FC44@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_21896F19C(a1, *(uint64_t **)(v2 + 16), *(_QWORD **)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), a2);
}

unint64_t sub_21897FC70()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2550018D8;
  if (!qword_2550018D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253E6E540);
    v2 = sub_21897FAB0();
    result = MEMORY[0x219A1D8D0](MEMORY[0x24BE60940], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2550018D8);
  }
  return result;
}

uint64_t sub_21897FCD4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t objectdestroy_98Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21897FD50()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = v0[4];
  v3 = v0[5];
  v5 = v0[6];
  v4 = v0[7];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_2189802D0;
  return sub_218952028((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

uint64_t sub_21897FDB4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_21897FDD8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;

  sub_218951F58(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t sub_21897FDE0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21897FE24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;

  v2 = *(_QWORD *)(v0 + 48);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 32);
  v5 = *(_OWORD *)(v0 + 56);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_2189802D0;
  *(_OWORD *)(v3 + 280) = v5;
  *(_QWORD *)(v3 + 272) = v2;
  *(_OWORD *)(v3 + 256) = v4;
  return swift_task_switch();
}

uint64_t sub_21897FE98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_21897FF20()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718) - 8) + 80);
  return sub_2189713EC(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), v0 + ((v1 + 48) & ~v1));
}

uint64_t sub_21897FF58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_21897FFE8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253E6E718) - 8) + 80);
  v3 = v0[4];
  v4 = v0[5];
  v5 = v0[6];
  v6 = v0[7];
  v7 = (uint64_t)v0 + ((v2 + 64) & ~v2);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v8;
  *v8 = v1;
  v8[1] = sub_21894F9F0;
  return sub_218971560((uint64_t)v8, v9, v10, v3, v4, v5, v6, v7);
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2189800A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2189802D0;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_218980108()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t objectdestroy_90Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_218980164()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = swift_task_alloc();
  v3 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_2189802D0;
  *(_OWORD *)(v2 + 32) = v3;
  return swift_task_switch();
}

unint64_t sub_2189801C4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_253E6E5E8;
  if (!qword_253E6E5E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_253E6E5D8);
    v2 = MEMORY[0x24BEE0D10];
    result = MEMORY[0x219A1D8D0](MEMORY[0x24BEE4AB0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_253E6E5E8);
  }
  return result;
}

uint64_t sub_218980220(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
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

uint64_t sub_2189802A4()
{
  return sub_218974B58(&qword_253E6E658, (uint64_t (*)(uint64_t))type metadata accessor for IDSDeviceType, (uint64_t)&unk_2189905E4);
}

uint64_t SKAError.errorDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  if ((*(_BYTE *)(v0 + 16) & 1) != 0)
    v1 = 0x7463657078656E75;
  else
    v1 = 543975790;
  v3 = v1;
  sub_218988F64();
  return v3;
}

uint64_t sub_2189803B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  if ((*(_BYTE *)(v0 + 16) & 1) != 0)
    v1 = 0x7463657078656E75;
  else
    v1 = 543975790;
  v3 = v1;
  sub_218988F64();
  return v3;
}

uint64_t destroy for SKAError()
{
  return sub_218980440();
}

uint64_t sub_218980440()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s18StatusKitAgentCore8SKAErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_218972110();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SKAError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_218972110();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_218980440();
  return a1;
}

uint64_t assignWithTake for SKAError(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_218980440();
  return a1;
}

uint64_t getEnumTagSinglePayload for SKAError(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SKAError(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_2189805B4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_2189805BC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SKAError()
{
  return &type metadata for SKAError;
}

uint64_t sub_218988B14()
{
  return MEMORY[0x24BE608A8]();
}

uint64_t sub_218988B20()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_218988B2C()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_218988B38()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_218988B44()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_218988B50()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_218988B5C()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_218988B68()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_218988B74()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_218988B80()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_218988B8C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_218988B98()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_218988BA4()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_218988BB0()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_218988BBC()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_218988BC8()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_218988BD4()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_218988BE0()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_218988BEC()
{
  return MEMORY[0x24BDCE8D8]();
}

uint64_t sub_218988BF8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_218988C04()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_218988C10()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_218988C1C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_218988C28()
{
  return MEMORY[0x24BE608B0]();
}

uint64_t sub_218988C34()
{
  return MEMORY[0x24BE608B8]();
}

uint64_t sub_218988C40()
{
  return MEMORY[0x24BE608C0]();
}

uint64_t sub_218988C4C()
{
  return MEMORY[0x24BE608E8]();
}

uint64_t sub_218988C58()
{
  return MEMORY[0x24BE608F0]();
}

uint64_t sub_218988C64()
{
  return MEMORY[0x24BE608F8]();
}

uint64_t sub_218988C70()
{
  return MEMORY[0x24BE60908]();
}

uint64_t sub_218988C7C()
{
  return MEMORY[0x24BE60910]();
}

uint64_t sub_218988C88()
{
  return MEMORY[0x24BE60920]();
}

uint64_t sub_218988C94()
{
  return MEMORY[0x24BE60950]();
}

uint64_t sub_218988CA0()
{
  return MEMORY[0x24BE60980]();
}

uint64_t sub_218988CAC()
{
  return MEMORY[0x24BE60998]();
}

uint64_t sub_218988CB8()
{
  return MEMORY[0x24BE609B0]();
}

uint64_t sub_218988CC4()
{
  return MEMORY[0x24BE609B8]();
}

uint64_t sub_218988CD0()
{
  return MEMORY[0x24BE609E0]();
}

uint64_t sub_218988CDC()
{
  return MEMORY[0x24BE609F0]();
}

uint64_t sub_218988CE8()
{
  return MEMORY[0x24BE60A10]();
}

uint64_t sub_218988CF4()
{
  return MEMORY[0x24BE60A30]();
}

uint64_t sub_218988D00()
{
  return MEMORY[0x24BE60A38]();
}

uint64_t sub_218988D0C()
{
  return MEMORY[0x24BE60A40]();
}

uint64_t sub_218988D18()
{
  return MEMORY[0x24BE60A68]();
}

uint64_t sub_218988D24()
{
  return MEMORY[0x24BE60A70]();
}

uint64_t sub_218988D30()
{
  return MEMORY[0x24BE60A80]();
}

uint64_t sub_218988D3C()
{
  return MEMORY[0x24BE60A88]();
}

uint64_t sub_218988D48()
{
  return MEMORY[0x24BE60A90]();
}

uint64_t sub_218988D54()
{
  return MEMORY[0x24BE60A98]();
}

uint64_t sub_218988D60()
{
  return MEMORY[0x24BE60AA0]();
}

uint64_t sub_218988D6C()
{
  return MEMORY[0x24BE60AA8]();
}

uint64_t sub_218988D78()
{
  return MEMORY[0x24BE60AB0]();
}

uint64_t sub_218988D84()
{
  return MEMORY[0x24BE60AB8]();
}

uint64_t sub_218988D90()
{
  return MEMORY[0x24BE60AF8]();
}

uint64_t sub_218988D9C()
{
  return MEMORY[0x24BE60B00]();
}

uint64_t sub_218988DA8()
{
  return MEMORY[0x24BE60B08]();
}

uint64_t sub_218988DB4()
{
  return MEMORY[0x24BE60B10]();
}

uint64_t sub_218988DC0()
{
  return MEMORY[0x24BE60B18]();
}

uint64_t sub_218988DCC()
{
  return MEMORY[0x24BE60B20]();
}

uint64_t sub_218988DD8()
{
  return MEMORY[0x24BE60B58]();
}

uint64_t sub_218988DE4()
{
  return MEMORY[0x24BE60B70]();
}

uint64_t sub_218988DF0()
{
  return MEMORY[0x24BE60B78]();
}

uint64_t sub_218988DFC()
{
  return MEMORY[0x24BE60B80]();
}

uint64_t sub_218988E08()
{
  return MEMORY[0x24BE60B90]();
}

uint64_t sub_218988E14()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_218988E20()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_218988E2C()
{
  return MEMORY[0x24BDB9CB8]();
}

uint64_t sub_218988E38()
{
  return MEMORY[0x24BDB9CC0]();
}

uint64_t sub_218988E44()
{
  return MEMORY[0x24BDB9CD0]();
}

uint64_t sub_218988E50()
{
  return MEMORY[0x24BDB9D00]();
}

uint64_t sub_218988E5C()
{
  return MEMORY[0x24BDBA128]();
}

uint64_t sub_218988E68()
{
  return MEMORY[0x24BE8F9C0]();
}

uint64_t sub_218988E74()
{
  return MEMORY[0x24BE8F9C8]();
}

uint64_t sub_218988E80()
{
  return MEMORY[0x24BE8F9D0]();
}

uint64_t sub_218988E8C()
{
  return MEMORY[0x24BE8F9D8]();
}

uint64_t sub_218988E98()
{
  return MEMORY[0x24BE8FDD0]();
}

uint64_t sub_218988EA4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_218988EB0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_218988EBC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_218988EC8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_218988ED4()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_218988EE0()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_218988EEC()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_218988EF8()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_218988F04()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_218988F10()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_218988F1C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_218988F28()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_218988F34()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_218988F40()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_218988F4C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_218988F58()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_218988F64()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_218988F70()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_218988F7C()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_218988F88()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_218988F94()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_218988FA0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_218988FAC()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_218988FB8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_218988FC4()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_218988FD0()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_218988FDC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_218988FE8()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_218988FF4()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_218989000()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21898900C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_218989018()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_218989024()
{
  return MEMORY[0x24BEE6B00]();
}

uint64_t sub_218989030()
{
  return MEMORY[0x24BE90088]();
}

uint64_t sub_21898903C()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_218989048()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_218989054()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_218989060()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21898906C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_218989078()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_218989084()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_218989090()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_21898909C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2189890A8()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2189890B4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2189890C0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2189890CC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2189890D8()
{
  return MEMORY[0x24BEE2210]();
}

uint64_t sub_2189890E4()
{
  return MEMORY[0x24BEE2270]();
}

uint64_t sub_2189890F0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2189890FC()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_218989108()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_218989114()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_218989120()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_21898912C()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_218989138()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_218989144()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_218989150()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21898915C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_218989168()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_218989174()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_218989180()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21898918C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_218989198()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2189891A4()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2189891B0()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2189891BC()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_2189891C8()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_2189891D4()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_2189891E0()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_2189891EC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2189891F8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_218989204()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_218989210()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21898921C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_218989228()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_218989234()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_218989240()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21898924C()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_218989258()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_218989264()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_218989270()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_21898927C()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_218989288()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_218989294()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2189892A0()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2189892AC()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2189892B8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2189892C4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2189892D0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2189892DC()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2189892E8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x24BDAC158]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x24BDAC160]();
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x24BDAC2D0](bytes, count);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x24BE4F978]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x24BE4F980]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x24BE4F988]();
}

uint64_t IDSCopyIDForPseudonymID()
{
  return MEMORY[0x24BE4F998]();
}

uint64_t IDSCopyIDForTokenWithID()
{
  return MEMORY[0x24BE4F9A0]();
}

uint64_t IDSCopyRawAddressForDestination()
{
  return MEMORY[0x24BE4F9B0]();
}

uint64_t IDSCopyTokenAndIDForTokenWithID()
{
  return MEMORY[0x24BE4F9B8]();
}

uint64_t IMStringIsPseudonymID()
{
  return MEMORY[0x24BE50810]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x24BE50840]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67140]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x24BE7AF80]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x24BE7AF88]();
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

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x24BE7B008]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x24BE7B018]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x24BE7B028]();
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

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8AA8](key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x24BDE8AC8](key);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B30](parameters, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8B38](key, algorithm, dataToSign, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B40](keyData, attributes, error);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _IDSCopyCallerID()
{
  return MEMORY[0x24BE4FE80]();
}

uint64_t _IDSCopyOrderedAliases()
{
  return MEMORY[0x24BE4FEA8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
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

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x24BDAF150](*(_QWORD *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x24BDB05D0](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x24BDB05E0](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x24BDB05E8](identifier, criteria, handler);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x24BDB0608](activity, criteria);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x24BDB0A08](object1, object2);
}

