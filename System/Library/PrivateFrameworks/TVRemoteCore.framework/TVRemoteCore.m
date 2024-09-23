void sub_21A51DD38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t TVRMSAddToWishlistMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t result;
  uint64_t v36;

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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = (unsigned __int16)(v10 >> 3);
      if (v17 == 3)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 28) |= 4u;
        while (1)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0)
            goto LABEL_49;
          v24 += 7;
          v14 = v25++ >= 9;
          if (v14)
          {
            LODWORD(v26) = 0;
            goto LABEL_51;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_49:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_51:
        *(_DWORD *)(a1 + 24) = v26;
      }
      else
      {
        if (v17 == 2)
        {
          v30 = 0;
          v31 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 28) |= 1u;
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
              goto LABEL_53;
            v30 += 7;
            v14 = v31++ >= 9;
            if (v14)
            {
              v20 = 0;
              goto LABEL_55;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_55:
          v36 = 8;
        }
        else
        {
          if (v17 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 28) |= 2u;
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
              goto LABEL_45;
            v18 += 7;
            v14 = v19++ >= 9;
            if (v14)
            {
              v20 = 0;
              goto LABEL_47;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_47:
          v36 = 16;
        }
        *(_QWORD *)(a1 + v36) = v20;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t TVRMSAudioRouteMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  void *v18;
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
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  BOOL v38;
  uint64_t v39;

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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((unsigned __int16)(v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(a1 + 16);
          *(_QWORD *)(a1 + 16) = v17;

          continue;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 28) |= 1u;
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
          *(_QWORD *)(a1 + 8) = v22;
          continue;
        case 3u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 28) |= 4u;
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
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_50:
          v38 = v28 != 0;
          v39 = 25;
          goto LABEL_55;
        case 4u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_BYTE *)(a1 + 28) |= 2u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v35 = *v3;
        v36 = *(_QWORD *)(a2 + v35);
        if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
          break;
        v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
        *(_QWORD *)(a2 + v35) = v36 + 1;
        v34 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0)
          goto LABEL_52;
        v32 += 7;
        v14 = v33++ >= 9;
        if (v14)
        {
          v34 = 0;
          goto LABEL_54;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_52:
      if (*(_BYTE *)(a2 + *v5))
        v34 = 0;
LABEL_54:
      v38 = v34 != 0;
      v39 = 24;
LABEL_55:
      *(_BYTE *)(a1 + v39) = v38;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t TVRMSAudioRoutesDidUpdateMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  TVRMSAudioRouteMessage *v24;
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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = (unsigned __int16)(v10 >> 3);
      if (v17 == 2)
      {
        v24 = objc_alloc_init(TVRMSAudioRouteMessage);
        objc_msgSend((id)a1, "addAudioRoutes:", v24);
        if (!PBReaderPlaceMark() || (TVRMSAudioRouteMessageReadFrom((uint64_t)v24, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if (v17 == 1)
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

uint64_t TVRMSAvailableServicesDidUpdateMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  TVRMSServiceMessage *v24;
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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = (unsigned __int16)(v10 >> 3);
      if (v17 == 2)
      {
        v24 = objc_alloc_init(TVRMSServiceMessage);
        objc_msgSend((id)a1, "addServices:", v24);
        if (!PBReaderPlaceMark() || (TVRMSServiceMessageReadFrom((uint64_t)v24, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if (v17 == 1)
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

uint64_t TVRMSBeginDiscoveryMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  void *v30;
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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = (unsigned __int16)(v10 >> 3);
      switch(v17)
      {
        case 3:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 28) |= 2u;
          while (1)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
              break;
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 1;
            v26 |= (unint64_t)(v29 & 0x7F) << v24;
            if ((v29 & 0x80) == 0)
              goto LABEL_45;
            v24 += 7;
            v14 = v25++ >= 9;
            if (v14)
            {
              v26 = 0;
              goto LABEL_47;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
          if (*(_BYTE *)(a2 + *v5))
            v26 = 0;
LABEL_47:
          *(_BYTE *)(a1 + 24) = v26 != 0;
          break;
        case 2:
          PBReaderReadString();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
            objc_msgSend((id)a1, "addPairedNetworkNames:", v30);

          break;
        case 1:
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
              goto LABEL_41;
            v18 += 7;
            v14 = v19++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_43;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_43:
          *(_DWORD *)(a1 + 8) = v20;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          break;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL TVRMSBeginPairingMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((unsigned __int16)(v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_25;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_25;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_25;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
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

BOOL TVRMSBeginPairingResponseMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  int v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  BOOL v24;
  int *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;

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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = (unsigned __int16)(v10 >> 3);
      if (v17 == 2)
        break;
      if (v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 16) |= 2u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
          {
            v25 = &OBJC_IVAR___TVRMSBeginPairingResponseMessage__sessionIdentifier;
            goto LABEL_38;
          }
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            break;
          v18 += 7;
          v24 = v19++ > 8;
          if (v24)
          {
            LODWORD(v20) = 0;
            v25 = &OBJC_IVAR___TVRMSBeginPairingResponseMessage__sessionIdentifier;
            goto LABEL_41;
          }
        }
        v25 = &OBJC_IVAR___TVRMSBeginPairingResponseMessage__sessionIdentifier;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_41:
        *(_DWORD *)(a1 + *v25) = v20;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_42:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v26 = 0;
    v27 = 0;
    v20 = 0;
    *(_BYTE *)(a1 + 16) |= 1u;
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
      {
        v25 = &OBJC_IVAR___TVRMSBeginPairingResponseMessage__responseCode;
        goto LABEL_39;
      }
      v26 += 7;
      v24 = v27++ > 8;
      if (v24)
      {
        LODWORD(v20) = 0;
        v25 = &OBJC_IVAR___TVRMSBeginPairingResponseMessage__responseCode;
        goto LABEL_41;
      }
    }
    v25 = &OBJC_IVAR___TVRMSBeginPairingResponseMessage__responseCode;
LABEL_38:
    *(_BYTE *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL TVRMSConnectToServiceMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  int v17;
  TVRMSServiceMessage *v18;
  uint64_t v19;

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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = (unsigned __int16)(v10 >> 3);
      if (v17 == 2)
        break;
      if (v17 == 1)
      {
        v18 = objc_alloc_init(TVRMSServiceMessage);
        objc_storeStrong((id *)(a1 + 16), v18);
        if (!PBReaderPlaceMark() || (TVRMSServiceMessageReadFrom((uint64_t)v18, a2) & 1) == 0)
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
    PBReaderReadString();
    v19 = objc_claimAutoreleasedReturnValue();
    v18 = *(TVRMSServiceMessage **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v19;
LABEL_24:

    goto LABEL_26;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t TVRMSConnectToServiceResponseMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  TVRMSControlInterfaceMessage *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t result;
  uint64_t v31;

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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = (unsigned __int16)(v10 >> 3);
      if (v17 == 3)
      {
        v24 = objc_alloc_init(TVRMSControlInterfaceMessage);
        objc_storeStrong((id *)(a1 + 8), v24);
        if (!PBReaderPlaceMark() || !TVRMSControlInterfaceMessageReadFrom((uint64_t)v24, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        if (v17 == 2)
        {
          v25 = 0;
          v26 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 24) |= 2u;
          while (1)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
              break;
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 1;
            v20 |= (unint64_t)(v29 & 0x7F) << v25;
            if ((v29 & 0x80) == 0)
              goto LABEL_45;
            v25 += 7;
            v14 = v26++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_47;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_47:
          v31 = 20;
        }
        else
        {
          if (v17 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 24) |= 1u;
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
              goto LABEL_41;
            v18 += 7;
            v14 = v19++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_43;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_43:
          v31 = 16;
        }
        *(_DWORD *)(a1 + v31) = v20;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_21A528538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A5289CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A528B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_21A528F2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_21A52980C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A52AB58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A52AF90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A52B6E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A52BCB0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21A52BDDC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21A52BF74(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21A52C910(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_21A52D504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A52D964(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21A52DD90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A52F278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_21A52F408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A52FC48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A52FE4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A530074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A5302C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A53045C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21A5323D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_21A5325B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A532798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21A533024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A533224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A53351C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A533778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A534CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
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

void sub_21A535668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _controlPromptMessageTypeForItems(void *a1)
{
  void *v1;
  uint64_t v2;

  _controlPromptKeyValueForItems(CFSTR("kKeybMsgKey_MessageType"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

id _controlPromptKeyValueForItems(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name"), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqualToString:", v3) & 1) != 0)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("value"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

void sub_21A537184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A538098(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x21A538080);
  }
  _Unwind_Resume(exception_object);
}

void sub_21A53DA0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A53E1F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A53E4F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void TVRMSLogEx(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  id v10;
  void *v11;

  v9 = _RMSLoggingInitialize_onceToken;
  v10 = a5;
  if (v9 != -1)
    dispatch_once(&_RMSLoggingInitialize_onceToken, &__block_literal_global_1);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v10, &a9);

  _CPLogLine();
}

uint64_t _RMSInitializeLogLevel()
{
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.TVRemoteMediaServices"));
  keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppIntegerValue(CFSTR("LogLevel"), CFSTR("com.apple.TVRemoteMediaServices"), &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
    MGGetBoolAnswer();
  return CPLoggingSetMaxLogFileLevel();
}

void _RMSLogLevelChangedHandler()
{
  NSObject *v0;
  unsigned int v1;
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  _RMSInitializeLogLevel();
  _TVRCRMSLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = CPLoggingMaxLogFileLevel() - 3;
    if (v1 > 4)
      v2 = CFSTR("Unknown");
    else
      v2 = off_24DCD7810[v1];
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_21A51B000, v0, OS_LOG_TYPE_DEFAULT, "New log level is %@", (uint8_t *)&v3, 0xCu);
  }

}

const __CFString *NSStringFromRMSMessageType(int a1)
{
  if ((a1 - 2) > 0x25)
    return CFSTR("TVRMSMessageTypeBeginDiscovery");
  else
    return off_24DCD7838[(__int16)(a1 - 2)];
}

BOOL TVRMSNavigationCommandMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  int v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  BOOL v24;
  int *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;

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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = (unsigned __int16)(v10 >> 3);
      if (v17 == 2)
        break;
      if (v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 16) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
          {
            v25 = &OBJC_IVAR___TVRMSNavigationCommandMessage__navigationCommand;
            goto LABEL_38;
          }
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            break;
          v18 += 7;
          v24 = v19++ > 8;
          if (v24)
          {
            LODWORD(v20) = 0;
            v25 = &OBJC_IVAR___TVRMSNavigationCommandMessage__navigationCommand;
            goto LABEL_41;
          }
        }
        v25 = &OBJC_IVAR___TVRMSNavigationCommandMessage__navigationCommand;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_41:
        *(_DWORD *)(a1 + *v25) = v20;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_42:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v26 = 0;
    v27 = 0;
    v20 = 0;
    *(_BYTE *)(a1 + 16) |= 2u;
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
      {
        v25 = &OBJC_IVAR___TVRMSNavigationCommandMessage__sessionIdentifier;
        goto LABEL_39;
      }
      v26 += 7;
      v24 = v27++ > 8;
      if (v24)
      {
        LODWORD(v20) = 0;
        v25 = &OBJC_IVAR___TVRMSNavigationCommandMessage__sessionIdentifier;
        goto LABEL_41;
      }
    }
    v25 = &OBJC_IVAR___TVRMSNavigationCommandMessage__sessionIdentifier;
LABEL_38:
    *(_BYTE *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t TVRMSNowPlayingArtworkAvailableMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  void *v25;
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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = (unsigned __int16)(v10 >> 3);
      if (v17 == 2)
      {
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v24;

      }
      else if (v17 == 1)
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
            goto LABEL_31;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 16) = v20;
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

uint64_t TVRMSNowPlayingArtworkRequestMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  void *v19;
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
  int v36;
  uint64_t v37;

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
          LODWORD(v10) = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((unsigned __int16)(v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v18;

          continue;
        case 2u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 28) |= 4u;
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
                  LODWORD(v23) = 0;
                  goto LABEL_42;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v23) = 0;
LABEL_42:
          v37 = 24;
          goto LABEL_47;
        case 3u:
          v28 = 0;
          v29 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 28) |= 2u;
          break;
        case 4u:
          *(_BYTE *)(a1 + 28) |= 1u;
          v34 = *v3;
          v35 = *(_QWORD *)(a2 + v34);
          if (v35 <= 0xFFFFFFFFFFFFFFFBLL && v35 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v36 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v35);
            *(_QWORD *)(a2 + v34) = v35 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v36 = 0;
          }
          *(_DWORD *)(a1 + 16) = v36;
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
          goto LABEL_44;
        v28 += 7;
        v15 = v29++ >= 9;
        if (v15)
        {
          LODWORD(v23) = 0;
          goto LABEL_46;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_44:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v23) = 0;
LABEL_46:
      v37 = 20;
LABEL_47:
      *(_DWORD *)(a1 + v37) = v23;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t TVRMSNowPlayingInfoDidUpdateMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  TVRMSNowPlayingInfoMessage *v24;
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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = (unsigned __int16)(v10 >> 3);
      if (v17 == 2)
      {
        v24 = objc_alloc_init(TVRMSNowPlayingInfoMessage);
        objc_storeStrong((id *)(a1 + 8), v24);
        if (!PBReaderPlaceMark() || (TVRMSNowPlayingInfoMessageReadFrom((uint64_t)v24, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if (v17 == 1)
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

uint64_t TVRMSNowPlayingInfoMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
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
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  char v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char v72;
  char v73;
  unsigned int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char v79;
  char v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  char v87;
  unsigned int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char v93;
  char v94;
  unsigned int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  char v100;
  char v101;
  unsigned int v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  char v107;
  uint64_t v108;
  uint64_t v109;
  BOOL v110;
  uint64_t v111;
  uint64_t v112;

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
          LODWORD(v10) = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((unsigned __int16)(v10 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_WORD *)(a1 + 104) |= 2u;
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
              goto LABEL_119;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_121;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_119:
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_121:
          v108 = 16;
          goto LABEL_126;
        case 2u:
          v26 = 0;
          v27 = 0;
          v20 = 0;
          *(_WORD *)(a1 + 104) |= 1u;
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
                  goto LABEL_125;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_125:
          v108 = 8;
LABEL_126:
          *(_QWORD *)(a1 + v108) = v20;
          continue;
        case 3u:
          PBReaderReadString();
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = 88;
          goto LABEL_38;
        case 4u:
          PBReaderReadString();
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = 56;
          goto LABEL_38;
        case 5u:
          PBReaderReadString();
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = 48;
LABEL_38:
          v34 = *(void **)(a1 + v33);
          *(_QWORD *)(a1 + v33) = v32;

          continue;
        case 6u:
          *(_WORD *)(a1 + 104) |= 8u;
          v35 = *v3;
          v36 = *(_QWORD *)(a2 + v35);
          if (v36 <= 0xFFFFFFFFFFFFFFF7 && v36 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v37 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v36);
            *(_QWORD *)(a2 + v35) = v36 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v37 = 0;
          }
          v112 = 32;
          goto LABEL_175;
        case 7u:
          *(_WORD *)(a1 + 104) |= 4u;
          v38 = *v3;
          v39 = *(_QWORD *)(a2 + v38);
          if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v37 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v39);
            *(_QWORD *)(a2 + v38) = v39 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v37 = 0;
          }
          v112 = 24;
          goto LABEL_175;
        case 8u:
          *(_WORD *)(a1 + 104) |= 0x10u;
          v40 = *v3;
          v41 = *(_QWORD *)(a2 + v40);
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v37 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v41);
            *(_QWORD *)(a2 + v40) = v41 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v37 = 0;
          }
          v112 = 40;
LABEL_175:
          *(_QWORD *)(a1 + v112) = v37;
          continue;
        case 9u:
          v42 = 0;
          v43 = 0;
          v44 = 0;
          *(_WORD *)(a1 + 104) |= 0x100u;
          while (2)
          {
            v45 = *v3;
            v46 = *(_QWORD *)(a2 + v45);
            v47 = v46 + 1;
            if (v46 == -1 || v47 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v46);
              *(_QWORD *)(a2 + v45) = v47;
              v44 |= (unint64_t)(v48 & 0x7F) << v42;
              if (v48 < 0)
              {
                v42 += 7;
                v15 = v43++ >= 9;
                if (v15)
                {
                  LODWORD(v44) = 0;
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v44) = 0;
LABEL_130:
          v109 = 76;
          goto LABEL_147;
        case 0xAu:
          v49 = 0;
          v50 = 0;
          v44 = 0;
          *(_WORD *)(a1 + 104) |= 0x40u;
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
              v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v52);
              *(_QWORD *)(a2 + v51) = v53;
              v44 |= (unint64_t)(v54 & 0x7F) << v49;
              if (v54 < 0)
              {
                v49 += 7;
                v15 = v50++ >= 9;
                if (v15)
                {
                  LODWORD(v44) = 0;
                  goto LABEL_134;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v44) = 0;
LABEL_134:
          v109 = 68;
          goto LABEL_147;
        case 0xBu:
          v55 = 0;
          v56 = 0;
          v44 = 0;
          *(_WORD *)(a1 + 104) |= 0x80u;
          while (2)
          {
            v57 = *v3;
            v58 = *(_QWORD *)(a2 + v57);
            v59 = v58 + 1;
            if (v58 == -1 || v59 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v60 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v58);
              *(_QWORD *)(a2 + v57) = v59;
              v44 |= (unint64_t)(v60 & 0x7F) << v55;
              if (v60 < 0)
              {
                v55 += 7;
                v15 = v56++ >= 9;
                if (v15)
                {
                  LODWORD(v44) = 0;
                  goto LABEL_138;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v44) = 0;
LABEL_138:
          v109 = 72;
          goto LABEL_147;
        case 0xCu:
          v61 = 0;
          v62 = 0;
          v44 = 0;
          *(_WORD *)(a1 + 104) |= 0x20u;
          while (2)
          {
            v63 = *v3;
            v64 = *(_QWORD *)(a2 + v63);
            v65 = v64 + 1;
            if (v64 == -1 || v65 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v66 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v64);
              *(_QWORD *)(a2 + v63) = v65;
              v44 |= (unint64_t)(v66 & 0x7F) << v61;
              if (v66 < 0)
              {
                v61 += 7;
                v15 = v62++ >= 9;
                if (v15)
                {
                  LODWORD(v44) = 0;
                  goto LABEL_142;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v44) = 0;
LABEL_142:
          v109 = 64;
          goto LABEL_147;
        case 0xDu:
          v67 = 0;
          v68 = 0;
          v44 = 0;
          *(_WORD *)(a1 + 104) |= 0x200u;
          while (2)
          {
            v69 = *v3;
            v70 = *(_QWORD *)(a2 + v69);
            v71 = v70 + 1;
            if (v70 == -1 || v71 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v72 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v70);
              *(_QWORD *)(a2 + v69) = v71;
              v44 |= (unint64_t)(v72 & 0x7F) << v67;
              if (v72 < 0)
              {
                v67 += 7;
                v15 = v68++ >= 9;
                if (v15)
                {
                  LODWORD(v44) = 0;
                  goto LABEL_146;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v44) = 0;
LABEL_146:
          v109 = 80;
LABEL_147:
          *(_DWORD *)(a1 + v109) = v44;
          continue;
        case 0xEu:
          v73 = 0;
          v74 = 0;
          v75 = 0;
          *(_WORD *)(a1 + 104) |= 0x400u;
          while (2)
          {
            v76 = *v3;
            v77 = *(_QWORD *)(a2 + v76);
            v78 = v77 + 1;
            if (v77 == -1 || v78 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v79 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v77);
              *(_QWORD *)(a2 + v76) = v78;
              v75 |= (unint64_t)(v79 & 0x7F) << v73;
              if (v79 < 0)
              {
                v73 += 7;
                v15 = v74++ >= 9;
                if (v15)
                {
                  v75 = 0;
                  goto LABEL_151;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v75 = 0;
LABEL_151:
          v110 = v75 != 0;
          v111 = 96;
          goto LABEL_168;
        case 0xFu:
          v80 = 0;
          v81 = 0;
          v82 = 0;
          *(_WORD *)(a1 + 104) |= 0x800u;
          while (2)
          {
            v83 = *v3;
            v84 = *(_QWORD *)(a2 + v83);
            v85 = v84 + 1;
            if (v84 == -1 || v85 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v86 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v84);
              *(_QWORD *)(a2 + v83) = v85;
              v82 |= (unint64_t)(v86 & 0x7F) << v80;
              if (v86 < 0)
              {
                v80 += 7;
                v15 = v81++ >= 9;
                if (v15)
                {
                  v82 = 0;
                  goto LABEL_155;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v82 = 0;
LABEL_155:
          v110 = v82 != 0;
          v111 = 97;
          goto LABEL_168;
        case 0x10u:
          v87 = 0;
          v88 = 0;
          v89 = 0;
          *(_WORD *)(a1 + 104) |= 0x4000u;
          while (2)
          {
            v90 = *v3;
            v91 = *(_QWORD *)(a2 + v90);
            v92 = v91 + 1;
            if (v91 == -1 || v92 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v93 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v91);
              *(_QWORD *)(a2 + v90) = v92;
              v89 |= (unint64_t)(v93 & 0x7F) << v87;
              if (v93 < 0)
              {
                v87 += 7;
                v15 = v88++ >= 9;
                if (v15)
                {
                  v89 = 0;
                  goto LABEL_159;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v89 = 0;
LABEL_159:
          v110 = v89 != 0;
          v111 = 100;
          goto LABEL_168;
        case 0x11u:
          v94 = 0;
          v95 = 0;
          v96 = 0;
          *(_WORD *)(a1 + 104) |= 0x1000u;
          while (2)
          {
            v97 = *v3;
            v98 = *(_QWORD *)(a2 + v97);
            v99 = v98 + 1;
            if (v98 == -1 || v99 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v100 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v98);
              *(_QWORD *)(a2 + v97) = v99;
              v96 |= (unint64_t)(v100 & 0x7F) << v94;
              if (v100 < 0)
              {
                v94 += 7;
                v15 = v95++ >= 9;
                if (v15)
                {
                  v96 = 0;
                  goto LABEL_163;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v96 = 0;
LABEL_163:
          v110 = v96 != 0;
          v111 = 98;
          goto LABEL_168;
        case 0x12u:
          v101 = 0;
          v102 = 0;
          v103 = 0;
          *(_WORD *)(a1 + 104) |= 0x2000u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v104 = *v3;
        v105 = *(_QWORD *)(a2 + v104);
        v106 = v105 + 1;
        if (v105 == -1 || v106 > *(_QWORD *)(a2 + *v4))
          break;
        v107 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v105);
        *(_QWORD *)(a2 + v104) = v106;
        v103 |= (unint64_t)(v107 & 0x7F) << v101;
        if ((v107 & 0x80) == 0)
          goto LABEL_165;
        v101 += 7;
        v15 = v102++ >= 9;
        if (v15)
        {
          v103 = 0;
          goto LABEL_167;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_165:
      if (*(_BYTE *)(a2 + *v5))
        v103 = 0;
LABEL_167:
      v110 = v103 != 0;
      v111 = 99;
LABEL_168:
      *(_BYTE *)(a1 + v111) = v110;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _HTTPServerCallback_didReceiveError(void *a1, const char *a2)
{
  return objc_msgSend(a1, "handleHTTPServerDidReceiveError:", a2);
}

uint64_t _HTTPServerCallback_didOpenConnection(void *a1, const char *a2)
{
  return objc_msgSend(a1, "handleHTTPServerDidOpenConnection:", a2);
}

uint64_t _HTTPServerCallback_didCloseConnection(void *a1, const char *a2)
{
  return objc_msgSend(a1, "handleHTTPServerDidCloseConnection:", a2);
}

uint64_t _HTTPServerConnectionCallback_didReceiveError(void *a1, const char *a2)
{
  return objc_msgSend(a1, "handleHTTPServerConnectionDidReceiveError:", a2);
}

uint64_t _HTTPServerConnectionCallback_didReceiveRequest(void *a1, const char *a2)
{
  return objc_msgSend(a1, "handleHTTPServerConnectionDidReceiveRequest:", a2);
}

uint64_t _HTTPServerConnectionCallback_didSendResponse(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend(a1, "handleHTTPServerConnectionDidReplyToRequest:withResponse:", a2, a3);
}

uint64_t _HTTPServerConnectionCallback_didFailToSendResponse(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend(a1, "handleHTTPServerConnectionDidFailToReplyToRequest:withResponse:", a2, a3);
}

uint64_t generateRandomPasscode()
{
  unsigned int v0;
  uint64_t v1;

  v0 = time(0);
  srandom(v0);
  v1 = random();
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.4hu"), (unsigned __int16)(v1- 10000* (((unint64_t)((unsigned __int128)(v1 * (__int128)0x346DC5D63886594BLL) >> 64) >> 63)+ (((unsigned __int128)(v1 * (__int128)0x346DC5D63886594BLL) >> 64) >> 11))));
}

uint64_t TVRMSPairingSessionDidPairMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v17;
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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = (unsigned __int16)(v10 >> 3);
      if (v17 == 3)
      {
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 8;
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
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

void sub_21A5481EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t TVRMSPickAudioRouteMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = (unsigned __int16)(v10 >> 3);
      if (v17 == 2)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 20) |= 2u;
        while (1)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0)
            goto LABEL_41;
          v24 += 7;
          v14 = v25++ >= 9;
          if (v14)
          {
            LODWORD(v26) = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_43:
        *(_DWORD *)(a1 + 16) = v26;
      }
      else if (v17 == 1)
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
            goto LABEL_37;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            v20 = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_39:
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

BOOL TVRMSPlaybackCommandMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  int v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  BOOL v24;
  int *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;

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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = (unsigned __int16)(v10 >> 3);
      if (v17 == 2)
        break;
      if (v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 16) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
          {
            v25 = &OBJC_IVAR___TVRMSPlaybackCommandMessage__playbackCommand;
            goto LABEL_38;
          }
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            break;
          v18 += 7;
          v24 = v19++ > 8;
          if (v24)
          {
            LODWORD(v20) = 0;
            v25 = &OBJC_IVAR___TVRMSPlaybackCommandMessage__playbackCommand;
            goto LABEL_41;
          }
        }
        v25 = &OBJC_IVAR___TVRMSPlaybackCommandMessage__playbackCommand;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_41:
        *(_DWORD *)(a1 + *v25) = v20;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_42:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v26 = 0;
    v27 = 0;
    v20 = 0;
    *(_BYTE *)(a1 + 16) |= 2u;
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
      {
        v25 = &OBJC_IVAR___TVRMSPlaybackCommandMessage__sessionIdentifier;
        goto LABEL_39;
      }
      v26 += 7;
      v24 = v27++ > 8;
      if (v24)
      {
        LODWORD(v20) = 0;
        v25 = &OBJC_IVAR___TVRMSPlaybackCommandMessage__sessionIdentifier;
        goto LABEL_41;
      }
    }
    v25 = &OBJC_IVAR___TVRMSPlaybackCommandMessage__sessionIdentifier;
LABEL_38:
    *(_BYTE *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

const __CFString *NSStringFromRMSResponseCode(uint64_t a1)
{
  if ((unint64_t)(a1 + 2) > 3)
    return CFSTR("TVRMSResponseCodeTimeoutError");
  else
    return off_24DCD7AB8[a1 + 2];
}

uint64_t TVRMSResponseCodeMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 & 0x7FFF8) == 8)
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

BOOL TVRMSSeekToPlaybackTimeMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  int v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  BOOL v24;
  int *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;

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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = (unsigned __int16)(v10 >> 3);
      if (v17 == 2)
        break;
      if (v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 16) |= 2u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
          {
            v25 = &OBJC_IVAR___TVRMSSeekToPlaybackTimeMessage__sessionIdentifier;
            goto LABEL_38;
          }
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            break;
          v18 += 7;
          v24 = v19++ > 8;
          if (v24)
          {
            LODWORD(v20) = 0;
            v25 = &OBJC_IVAR___TVRMSSeekToPlaybackTimeMessage__sessionIdentifier;
            goto LABEL_41;
          }
        }
        v25 = &OBJC_IVAR___TVRMSSeekToPlaybackTimeMessage__sessionIdentifier;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_41:
        *(_DWORD *)(a1 + *v25) = v20;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_42:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v26 = 0;
    v27 = 0;
    v20 = 0;
    *(_BYTE *)(a1 + 16) |= 1u;
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
      {
        v25 = &OBJC_IVAR___TVRMSSeekToPlaybackTimeMessage__playbackTime;
        goto LABEL_39;
      }
      v26 += 7;
      v24 = v27++ > 8;
      if (v24)
      {
        LODWORD(v20) = 0;
        v25 = &OBJC_IVAR___TVRMSSeekToPlaybackTimeMessage__playbackTime;
        goto LABEL_41;
      }
    }
    v25 = &OBJC_IVAR___TVRMSSeekToPlaybackTimeMessage__playbackTime;
LABEL_38:
    *(_BYTE *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_21A54B4FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t TVRMSSessionMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 & 0x7FFF8) == 8)
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

void sub_21A54CB7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t TVRMSSetLikeStateMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
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
  uint64_t v40;
  uint64_t v41;

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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((unsigned __int16)(v10 >> 3))
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
              goto LABEL_50;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_52;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_50:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_52:
          v40 = 24;
          goto LABEL_66;
        case 2u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
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
              v26 |= (unint64_t)(v29 & 0x7F) << v24;
              if (v29 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  v26 = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v26 = 0;
LABEL_56:
          v41 = 16;
          goto LABEL_61;
        case 3u:
          v30 = 0;
          v31 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 32) |= 1u;
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
              v26 |= (unint64_t)(v34 & 0x7F) << v30;
              if (v34 < 0)
              {
                v30 += 7;
                v14 = v31++ >= 9;
                if (v14)
                {
                  v26 = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v26 = 0;
LABEL_60:
          v41 = 8;
LABEL_61:
          *(_QWORD *)(a1 + v41) = v26;
          continue;
        case 4u:
          v35 = 0;
          v36 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 32) |= 8u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v37 = *v3;
        v38 = *(_QWORD *)(a2 + v37);
        if (v38 == -1 || v38 >= *(_QWORD *)(a2 + *v4))
          break;
        v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
        *(_QWORD *)(a2 + v37) = v38 + 1;
        v19 |= (unint64_t)(v39 & 0x7F) << v35;
        if ((v39 & 0x80) == 0)
          goto LABEL_63;
        v35 += 7;
        v14 = v36++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_65;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_63:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_65:
      v40 = 28;
LABEL_66:
      *(_DWORD *)(a1 + v40) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_21A54E220(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 128));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t TVRMSSetVolumeMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  int v18;
  uint64_t v19;
  unint64_t v20;
  int v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
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
          LODWORD(v10) = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      v18 = (unsigned __int16)(v10 >> 3);
      if (v18 == 2)
      {
        v22 = 0;
        v23 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 16) |= 1u;
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
            goto LABEL_33;
          v22 += 7;
          v15 = v23++ >= 9;
          if (v15)
          {
            LODWORD(v24) = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v24) = 0;
LABEL_35:
        *(_DWORD *)(a1 + 8) = v24;
      }
      else if (v18 == 1)
      {
        *(_BYTE *)(a1 + 16) |= 2u;
        v19 = *v3;
        v20 = *(_QWORD *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFFBLL && v20 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v21 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v20);
          *(_QWORD *)(a2 + v19) = v20 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v21 = 0;
        }
        *(_DWORD *)(a1 + 12) = v21;
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

void sub_21A550B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A551344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A551538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

BOOL TVRMSTouchMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  int v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  BOOL v24;
  int *v25;
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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = (unsigned __int16)(v10 >> 3);
      if (v17 == 3)
      {
        v26 = 0;
        v27 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 20) |= 4u;
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
          {
            v25 = &OBJC_IVAR___TVRMSTouchMessage__sessionIdentifier;
            goto LABEL_48;
          }
          v26 += 7;
          v24 = v27++ > 8;
          if (v24)
          {
            LODWORD(v20) = 0;
            v25 = &OBJC_IVAR___TVRMSTouchMessage__sessionIdentifier;
            goto LABEL_50;
          }
        }
        v25 = &OBJC_IVAR___TVRMSTouchMessage__sessionIdentifier;
LABEL_47:
        *(_BYTE *)(a2 + *v5) = 1;
        goto LABEL_48;
      }
      if (v17 == 2)
        break;
      if (v17 == 1)
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
          {
            v25 = &OBJC_IVAR___TVRMSTouchMessage__direction;
            goto LABEL_47;
          }
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            break;
          v18 += 7;
          v24 = v19++ > 8;
          if (v24)
          {
            LODWORD(v20) = 0;
            v25 = &OBJC_IVAR___TVRMSTouchMessage__direction;
            goto LABEL_50;
          }
        }
        v25 = &OBJC_IVAR___TVRMSTouchMessage__direction;
        goto LABEL_48;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_51:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v31 = 0;
    v32 = 0;
    v20 = 0;
    *(_BYTE *)(a1 + 20) |= 2u;
    while (1)
    {
      v33 = *v3;
      v34 = *(_QWORD *)(a2 + v33);
      if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
      {
        v25 = &OBJC_IVAR___TVRMSTouchMessage__repeatCount;
        goto LABEL_47;
      }
      v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
      *(_QWORD *)(a2 + v33) = v34 + 1;
      v20 |= (unint64_t)(v35 & 0x7F) << v31;
      if ((v35 & 0x80) == 0)
        break;
      v31 += 7;
      v24 = v32++ > 8;
      if (v24)
      {
        LODWORD(v20) = 0;
        v25 = &OBJC_IVAR___TVRMSTouchMessage__repeatCount;
        goto LABEL_50;
      }
    }
    v25 = &OBJC_IVAR___TVRMSTouchMessage__repeatCount;
LABEL_48:
    if (*(_BYTE *)(a2 + *v5))
      LODWORD(v20) = 0;
LABEL_50:
    *(_DWORD *)(a1 + *v25) = v20;
    goto LABEL_51;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t TVRMSUpdatePairedNetworNamesMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  void *v24;
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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = (unsigned __int16)(v10 >> 3);
      if (v17 == 2)
      {
        PBReaderReadString();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
          objc_msgSend((id)a1, "addPairedNetworkNames:", v24);

      }
      else if (v17 == 1)
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

uint64_t TVRMSVolumeDidUpdateMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  int v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  int v28;
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
          LODWORD(v10) = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      v18 = (unsigned __int16)(v10 >> 3);
      if (v18 == 2)
      {
        *(_BYTE *)(a1 + 16) |= 2u;
        v26 = *v3;
        v27 = *(_QWORD *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFFBLL && v27 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v28 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v28 = 0;
        }
        *(_DWORD *)(a1 + 12) = v28;
      }
      else if (v18 == 1)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 16) |= 1u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          v24 = v23 + 1;
          if (v23 == -1 || v24 > *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v24;
          v21 |= (unint64_t)(v25 & 0x7F) << v19;
          if ((v25 & 0x80) == 0)
            goto LABEL_33;
          v19 += 7;
          v15 = v20++ >= 9;
          if (v15)
          {
            LODWORD(v21) = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_35:
        *(_DWORD *)(a1 + 8) = v21;
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

uint64_t TVRMSWifiAvailabilityDidChangeMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = (unsigned __int16)(v10 >> 3);
      if (v17 == 2)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 16) |= 2u;
        while (1)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0)
            goto LABEL_41;
          v24 += 7;
          v14 = v25++ >= 9;
          if (v14)
          {
            v26 = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          v26 = 0;
LABEL_43:
        *(_BYTE *)(a1 + 12) = v26 != 0;
      }
      else if (v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 16) |= 1u;
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
            goto LABEL_37;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_39:
        *(_DWORD *)(a1 + 8) = v20;
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

__CFString *TVRCButtonTypeDescription(uint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  v1 = CFSTR("Select");
  switch(a1)
  {
    case 0:
      v1 = CFSTR("Undefined");
      break;
    case 1:
      return v1;
    case 2:
      v1 = CFSTR("Menu");
      break;
    case 3:
      v1 = CFSTR("Home");
      break;
    case 4:
      v1 = CFSTR("Siri");
      break;
    case 5:
      v1 = CFSTR("PlayPause");
      break;
    case 6:
      v1 = CFSTR("SkipForward");
      break;
    case 7:
      v1 = CFSTR("SkipBackward");
      break;
    case 8:
      v1 = CFSTR("NextTrack");
      break;
    case 9:
      v1 = CFSTR("PreviousTrack");
      break;
    case 10:
      v1 = CFSTR("VolumeUp");
      break;
    case 11:
      v1 = CFSTR("VolumeDown");
      break;
    case 12:
      v1 = CFSTR("ArrowUp");
      break;
    case 13:
      v1 = CFSTR("ArrowDown");
      break;
    case 14:
      v1 = CFSTR("ArrowLeft");
      break;
    case 15:
      v1 = CFSTR("ArrowRight");
      break;
    case 16:
      v1 = CFSTR("CaptionsToggle");
      break;
    case 17:
      v1 = CFSTR("CaptionsAlwaysOn");
      break;
    case 18:
      v1 = CFSTR("CaptionsForcedOnly");
      break;
    case 19:
      v1 = CFSTR("ActivateScreenSaver");
      break;
    case 20:
      v1 = CFSTR("launchApplication");
      break;
    case 21:
      v1 = CFSTR("Wake");
      break;
    case 22:
      v1 = CFSTR("Sleep");
      break;
    case 23:
      v1 = CFSTR("Back");
      break;
    case 24:
      v1 = CFSTR("Exit");
      break;
    case 25:
      v1 = CFSTR("Info");
      break;
    case 26:
      v1 = CFSTR("PageUp");
      break;
    case 27:
      v1 = CFSTR("PageDown");
      break;
    case 28:
      v1 = CFSTR("Guide");
      break;
    case 29:
      v1 = CFSTR("Mute");
      break;
    case 30:
      v1 = CFSTR("Power");
      break;
    case 31:
      v1 = CFSTR("SkipStart");
      break;
    default:
      if (a1 == 204)
      {
        v1 = CFSTR("MediaPlay");
      }
      else if (a1 == 205)
      {
        v1 = CFSTR("MediaPause");
      }
      else
      {
        v2 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "stringWithFormat:", CFSTR("Unknown %@"), v3);
        v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      break;
  }
  return v1;
}

__CFString *TVRCDeviceConnectionTypeDescription(uint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if ((unint64_t)(a1 - 1) >= 3)
  {
    v2 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("Unknown %@"), v3);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = off_24DCD7F90[a1 - 1];
  }
  return v1;
}

__CFString *TVRCDeviceClassificationDescription(unint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if (a1 >= 6)
  {
    v2 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("Unknown %@"), v3);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = off_24DCD7FA8[a1];
  }
  return v1;
}

void sub_21A557950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A557FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A558B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t TVRCMakeError(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.TVRemoteCore.Errors"), a1, a2);
}

void sub_21A55B868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A55CD8C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_21A55CFE8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_21A55D314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A55D7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

id _TVRCBLEDiscoveryLog()
{
  if (_TVRCBLEDiscoveryLog_onceToken != -1)
    dispatch_once(&_TVRCBLEDiscoveryLog_onceToken, &__block_literal_global_9);
  return (id)_TVRCBLEDiscoveryLog_log;
}

id _TVRCGeneralLog()
{
  if (_TVRCGeneralLog_onceToken != -1)
    dispatch_once(&_TVRCGeneralLog_onceToken, &__block_literal_global_3);
  return (id)_TVRCGeneralLog_log;
}

id _TVRCHomeKitLog()
{
  if (_TVRCHomeKitLog_onceToken != -1)
    dispatch_once(&_TVRCHomeKitLog_onceToken, &__block_literal_global_5_0);
  return (id)_TVRCHomeKitLog_log;
}

id _TVRCPreferredDeviceLog()
{
  if (_TVRCPreferredDeviceLog_onceToken != -1)
    dispatch_once(&_TVRCPreferredDeviceLog_onceToken, &__block_literal_global_7);
  return (id)_TVRCPreferredDeviceLog_log;
}

id _TVRCRapportLog()
{
  if (_TVRCRapportLog_onceToken != -1)
    dispatch_once(&_TVRCRapportLog_onceToken, &__block_literal_global_9);
  return (id)_TVRCRapportLog_log;
}

id _TVRCRemoteTextInputLog()
{
  if (_TVRCRemoteTextInputLog_onceToken != -1)
    dispatch_once(&_TVRCRemoteTextInputLog_onceToken, &__block_literal_global_11);
  return (id)_TVRCRemoteTextInputLog_log;
}

id _TVRCMDMLog()
{
  if (_TVRCMDMLog_onceToken != -1)
    dispatch_once(&_TVRCMDMLog_onceToken, &__block_literal_global_13);
  return (id)_TVRCMDMLog_log;
}

id _TVRCMediaEventsLog()
{
  if (_TVRCMediaEventsLog_onceToken != -1)
    dispatch_once(&_TVRCMediaEventsLog_onceToken, &__block_literal_global_15);
  return (id)_TVRCMediaEventsLog_log;
}

id _TVRCMediaRemoteLog()
{
  if (_TVRCMediaRemoteLog_onceToken != -1)
    dispatch_once(&_TVRCMediaRemoteLog_onceToken, &__block_literal_global_17);
  return (id)_TVRCMediaRemoteLog_log;
}

id _TVRCRMSLog()
{
  if (_TVRCRMSLog_onceToken != -1)
    dispatch_once(&_TVRCRMSLog_onceToken, &__block_literal_global_19);
  return (id)_TVRCRMSLog_log;
}

id _TVRCXPCLog()
{
  if (_TVRCXPCLog_onceToken != -1)
    dispatch_once(&_TVRCXPCLog_onceToken, &__block_literal_global_21);
  return (id)_TVRCXPCLog_log;
}

uint64_t _TVRCAddStateHandlerWithName(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v5;

  v5 = a2;
  v2 = v5;
  v3 = os_state_add_handler();

  return v3;
}

void sub_21A5609A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_21A567D20(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 112));
  _Unwind_Resume(a1);
}

void sub_21A568324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_21A569738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A569F34(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_21A56A830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A56AD0C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_21A56D768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_21A56F224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A56F620(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 128));
  _Unwind_Resume(a1);
}

void sub_21A57053C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A5707CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A570A8C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21A570CE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A570F3C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21A572E3C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

void sub_21A573544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A5736FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A573918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A573C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A573E28(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_21A574060(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_21A5745B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A574AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A574EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A575658(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21A575EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_21A576294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

const __CFString *TVRCTouchPhaseDescription(unint64_t a1)
{
  if (a1 > 5)
    return CFSTR("Undefined");
  else
    return off_24DCD8BB0[a1];
}

void sub_21A577598(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_21A578120(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

void sub_21A579D30(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

BOOL TVRMSControlInterfaceMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  int v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  BOOL v24;
  int *v25;
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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = (unsigned __int16)(v10 >> 3);
      if (v17 == 3)
      {
        v26 = 0;
        v27 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
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
          {
            v25 = &OBJC_IVAR___TVRMSControlInterfaceMessage__supportsDirectionalControl;
            goto LABEL_48;
          }
          v26 += 7;
          v24 = v27++ > 8;
          if (v24)
          {
            v20 = 0;
            v25 = &OBJC_IVAR___TVRMSControlInterfaceMessage__supportsDirectionalControl;
            goto LABEL_50;
          }
        }
        v25 = &OBJC_IVAR___TVRMSControlInterfaceMessage__supportsDirectionalControl;
LABEL_47:
        *(_BYTE *)(a2 + *v5) = 1;
        goto LABEL_48;
      }
      if (v17 == 2)
        break;
      if (v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 12) |= 2u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
          {
            v25 = &OBJC_IVAR___TVRMSControlInterfaceMessage__supportsSpeakerSelection;
            goto LABEL_47;
          }
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            break;
          v18 += 7;
          v24 = v19++ > 8;
          if (v24)
          {
            v20 = 0;
            v25 = &OBJC_IVAR___TVRMSControlInterfaceMessage__supportsSpeakerSelection;
            goto LABEL_50;
          }
        }
        v25 = &OBJC_IVAR___TVRMSControlInterfaceMessage__supportsSpeakerSelection;
        goto LABEL_48;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_51:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v31 = 0;
    v32 = 0;
    v20 = 0;
    *(_BYTE *)(a1 + 12) |= 4u;
    while (1)
    {
      v33 = *v3;
      v34 = *(_QWORD *)(a2 + v33);
      if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
      {
        v25 = &OBJC_IVAR___TVRMSControlInterfaceMessage__supportsVolumeControl;
        goto LABEL_47;
      }
      v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
      *(_QWORD *)(a2 + v33) = v34 + 1;
      v20 |= (unint64_t)(v35 & 0x7F) << v31;
      if ((v35 & 0x80) == 0)
        break;
      v31 += 7;
      v24 = v32++ > 8;
      if (v24)
      {
        v20 = 0;
        v25 = &OBJC_IVAR___TVRMSControlInterfaceMessage__supportsVolumeControl;
        goto LABEL_50;
      }
    }
    v25 = &OBJC_IVAR___TVRMSControlInterfaceMessage__supportsVolumeControl;
LABEL_48:
    if (*(_BYTE *)(a2 + *v5))
      v20 = 0;
LABEL_50:
    *(_BYTE *)(a1 + *v25) = v20 != 0;
    goto LABEL_51;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void ReachabilityCallback(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD16D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", kReachabilityChangedNotification, v4);

}

uint64_t TVRMSServiceMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
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
  void *v41;
  uint64_t v42;

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
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((unsigned __int16)(v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_53;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_53;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_53;
        case 4u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 56) |= 1u;
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
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_57:
          v42 = 40;
          goto LABEL_70;
        case 5u:
          v26 = 0;
          v27 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 56) |= 8u;
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
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_61:
          v42 = 52;
          goto LABEL_70;
        case 6u:
          v31 = 0;
          v32 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 56) |= 2u;
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
          v42 = 44;
          goto LABEL_70;
        case 7u:
          v36 = 0;
          v37 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 56) |= 4u;
          break;
        case 8u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
LABEL_53:
          v41 = *(void **)(a1 + v18);
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
        v38 = *v3;
        v39 = *(_QWORD *)(a2 + v38);
        if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
          break;
        v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
        *(_QWORD *)(a2 + v38) = v39 + 1;
        v22 |= (unint64_t)(v40 & 0x7F) << v36;
        if ((v40 & 0x80) == 0)
          goto LABEL_67;
        v36 += 7;
        v14 = v37++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_69;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_67:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_69:
      v42 = 48;
LABEL_70:
      *(_DWORD *)(a1 + v42) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_21A582FB0(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_21A582FF4(uint64_t a1)
{
  uint64_t v1;
  int v3;
  unsigned int v4;

  v3 = (*(uint64_t (**)(void))(v1 + 2352))();
  (*(void (**)(uint64_t))(v1 + 2192))(a1);
  if (v3 == 16)
    v4 = -42029;
  else
    v4 = -42030;
  if (v3)
    return v4;
  else
    return 0;
}

void sub_21A58303C(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) - 888531001 * ((((2 * a1) | 0xC288F8D0) - a1 - 1631878248) ^ 0x3595C50C);
  __asm { BR              X10 }
}

void sub_21A5830E0(uint64_t a1@<X8>)
{
  int v1;
  _DWORD *v2;
  unsigned int v3;
  uint64_t v4;

  v3 = v1 + 654962069 * (&v3 ^ 0xEF500067) - 586;
  v4 = a1;
  sub_21A5AC95C(&v3);
  *v2 = 1412947868;
}

void cp2g1b9ro()
{
  _DWORD v0[6];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[0] = -1128011312 - 369883897 * (((v0 | 0x4337BD5) - (v0 & 0x4337BD5)) ^ 0x181801E1);
  sub_21A5C9434(v0);
  __asm { BR              X9 }
}

uint64_t sub_21A583210()
{
  uint64_t v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (((v0 == 0) | (8 * (v0 == 0))) ^ 0x2A5u)) - 8))();
}

uint64_t sub_21A583240()
{
  uint64_t v0;
  uint64_t v1;
  _BOOL4 v2;

  v2 = (*(uint64_t (**)(uint64_t))(v0 + 1856))(24) != 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((509 * v2) ^ 0x2AC)) - 8))();
}

uint64_t sub_21A58327C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned int v13;

  v6 = a1 + 0x57D3F24FED7A9E94;
  *(_DWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0x1EE13A8875B3537ELL;
  *(_QWORD *)(a1 + 16) = 0;
  v13 = v5
      - 107940961 * ((-871393812 - (&v10 | 0xCC0F95EC) + (&v10 | 0x33F06A13)) ^ 0x7F6B275B)
      + 13;
  v10 = a1 + 0x404A582FA81B2FFALL;
  v11 = v2;
  ((void (*)(uint64_t *))(*(_QWORD *)(v4 + 8 * (v5 ^ 0x243u)) - 8))(&v10);
  v7 = v12;
  v8 = (((v5 + 390036210) & 0x16203779) + 0x57D3F24FD75A697CLL) ^ v6;
  if (v12 != v3)
    v8 = 0;
  *v1 = v8;
  return (v7 - 1412947868);
}

void U4HBs()
{
  _DWORD v0[14];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[0] = -1128011312 - 369883897 * (((v0 | 0x79808DB7) + (~v0 | 0x867F7248)) ^ 0x65ABF782);
  sub_21A5C9434(v0);
  __asm { BR              X8 }
}

uint64_t sub_21A583478()
{
  uint64_t v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((42 * (v0 != 0)) ^ 0x41Bu)) - 8))();
}

uint64_t sub_21A5834AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  char v6;

  if (v1)
    v4 = *(_QWORD *)((v2 ^ 0x57D3F24FED7A9E94) - 0x57D3F24FED7A9E8CLL) == 0x1EE13A8875B3537ELL;
  else
    v4 = 1;
  v6 = v4 || v0 == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((8 * ((v6 ^ 0x29) & 1)) | (((v6 ^ 0x29) & 1) << 9) | 0x156u))
                            - 12))();
}

uint64_t sub_21A583534()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  BOOL v7;
  int v8;

  v5 = v0 ^ 0x30C;
  v6 = 2 * (v0 ^ 0x1FD);
  if (v2)
    v7 = v3 == ((v5 + 2146144332) ^ (v1 - 991));
  else
    v7 = 1;
  v8 = v7;
  return (*(uint64_t (**)(void))(v4 + 8 * ((v8 * (v6 - 298)) ^ v5)))();
}

uint64_t sub_21A583584@<X0>(uint64_t a1@<X8>)
{
  unsigned int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((35
                                          * (*(unsigned __int8 *)(a1 - 0x1EE13A8875B3537DLL) == (((v1 - 88) & 0x77) - 20))) ^ v1))
                            - 12))();
}

uint64_t sub_21A5835D4()
{
  uint64_t v0;
  uint64_t *v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = (*(uint64_t (**)(void))(v0 + 8 * (v2 ^ 0x29E)))();
  *v1 = v4;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v3
                                                                                         + 8
                                                                                         * (((((v4 == 0) ^ (v2 + 107)) & 1)
                                                                                           * ((v2 + 1275557227) ^ 0x4C0776D1)) ^ v2)))(v4, v5, v6, v7, v8, v9);
}

uint64_t sub_21A583654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, char a12, int a13, int a14, int a15, unsigned int a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,int a21,uint64_t a22,__int16 a23)
{
  _BYTE *v23;
  uint64_t v24;
  _DWORD *v25;
  uint64_t *v26;
  int v27;
  uint64_t v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  *v25 = a13;
  v31 = *v26;
  *(_DWORD *)(v31 + 3) = 16908633;
  *(_BYTE *)(v31 + 2) = 76;
  *(_WORD *)v31 = 20550;
  *(_BYTE *)(v31 + 7) = 0;
  *(_DWORD *)(v31 + 8) = bswap32(v27 + 44);
  *(_BYTE *)(v31 + 12) = *v23;
  *(_BYTE *)(v31 + 13) = 0;
  *(_BYTE *)(v31 + 14) = a12;
  *(_BYTE *)(v31 + 15) = 0;
  v32 = (((&a20 | 0xE0FC9C13) - &a20 + (&a20 & 0x1F0363E8)) ^ 0xFCD7E627)
      * v29;
  a22 = v31 + 0x30E6C4976802A936;
  a21 = v32 + (v30 & 0x88FF) - 75;
  a23 = v32 ^ 0x4488;
  (*(void (**)(char *))(v24 + 8 * ((v30 & 0x88FFu) + 35)))(&a20);
  *(_DWORD *)(v31 + 32) = bswap32(a16);
  return ((uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v28 + 8 * (v30 & 0x88FF ^ (1017 * (((((v30 & 0x88FF) - 41) ^ 0xD3C7FF62) & (2 * (v27 - ((2 * v27) & 0x5320103C) + 697305118)) ^ ((((v30 & 0x88FF) - 1414427698) & 0x27773) + 1392511989)) + ((v27 - ((2 * v27) & 0x5320103C) + 697305118) ^ 0x4073F7F3) != 1776549869)))) - 12))((v30 & 0x88FFu) - 41, v33, v34, v35, v36, 2146145925, 2148822587, a16, a9, a10);
}

uint64_t sub_21A5837DC(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * (((((a1 ^ 0x1F) - a7 + 58) ^ (a6 - 1651))
                                          * ((v7 - 1776549869) > 7)) ^ a1))
                            - 12))();
}

uint64_t sub_21A583824(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  return ((uint64_t (*)(void))(*(_QWORD *)(v10
                                        + 8
                                        * ((31
                                          * (v8 - v9 - 56 < (unint64_t)((v7 ^ 0xB0u) - a7 + 202) - 2146144902)) ^ v7))
                            - ((10 * (v7 ^ 0xB0u)) ^ 0xEALL)))();
}

uint64_t sub_21A583880(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * ((21 * (v7 >= ((a7 + ((a1 + 782405946) | 0x51490086) + 806) ^ 0x427u))) ^ a1))
                            - 12))();
}

uint64_t sub_21A5838CC@<X0>(int a1@<W6>, int a2@<W8>)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v9 = v5 + v4 + a2;
  v10 = v7 + v9;
  v11 = *(_OWORD *)(v10 - 31);
  v12 = v2 + v9;
  *(_OWORD *)(v12 - 15) = *(_OWORD *)(v10 - 15);
  *(_OWORD *)(v12 - 31) = v11;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((38 * ((v3 & 0xFFFFFFE0) != 32)) ^ (v6 + a1 - 95)))
                            - ((v6 + a1) ^ 0xE9)))();
}

void sub_21A583928()
{
  JUMPOUT(0x21A5838F0);
}

uint64_t sub_21A583934()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v2 | (798 * (v0 != v1)))) - ((v2 - 217) | 0xB0u) + 172))();
}

uint64_t sub_21A583968(int a1)
{
  char v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((94 * ((((a1 + 1470730728) ^ ((v1 & 0x18) == 0)) & 1) == 0)) ^ a1))
                            - (((a1 + 840) | 7u) ^ 0x40BLL)))();
}

uint64_t sub_21A5839C0@<X0>(int a1@<W8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v1 - 7 + (v4 + v3 + a1 - v5)) = *(_QWORD *)(v7 - 7 + (v4 + v3 + a1 - v5));
  return (*(uint64_t (**)(void))(v8 + 8 * (((((v6 ^ 0xFFFFFBFF) & v2) - v5 != 8) * ((v6 ^ 0x79E) + 1029)) ^ v6 ^ 0x79E)))();
}

uint64_t sub_21A583A1C(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  *(_QWORD *)(a1 + (v2 + a2)) = *(_QWORD *)(v3 + (v2 + a2));
  return (*(uint64_t (**)(void))(v7 + 8 * (((v6 + a2 != 8) * v4) ^ v5)))();
}

uint64_t sub_21A583A48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  int v7;
  int v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * (((((a6 + v7 - 1175) ^ a6) - 970) * (v6 == v8)) ^ v7)) - 12))();
}

uint64_t sub_21A583A74@<X0>(char a1@<W5>, int a2@<W6>, int a3@<W8>)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  *(_BYTE *)(v3 + (a3 + v5 + 544)) = *(_BYTE *)(v6 + (a3 + v5 + 544));
  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * ((((v4 ^ a1) ^ (v5 - 1 == v8)) & 1 | (8
                                                                                               * (((v4 ^ a1) ^ (v5 - 1 == v8)) & 1))) ^ (v4 + a2)))
                            - 12))();
}

uint64_t sub_21A583AB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unsigned __int8 *a14, uint64_t a15, uint64_t a16, uint64_t a17, unsigned __int8 *a18, uint64_t a19, unsigned __int8 *a20,uint64_t a21,int a22,uint64_t a23)
{
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  unsigned int v27;
  unsigned __int8 *v28;
  unsigned int v29;
  uint64_t v30;

  v27 = 107940961 * ((2 * (&a17 & 0x821D928) - &a17 + 2011047634) ^ 0x3B456B9A);
  a23 = v23 + 56;
  LOBYTE(a22) = (97 * ((2 * (&a17 & 0x28) - &a17 - 46) ^ 0x9A)) ^ 0x28;
  LODWORD(a17) = (v25 ^ 0x9C7BFDEF) + ((2 * v25) & 0x38F7FBDE) + 2145207294 + v27;
  a20 = a14;
  a21 = v23;
  LODWORD(a19) = (v26 - 859) ^ v27;
  a18 = (unsigned __int8 *)(v23 + 0x7927933B7E0E5157);
  ((void (*)(uint64_t *))((char *)*(&off_24DCDB210 + (v26 ^ 0x45A)) - 8))(&a17);
  v28 = &a14[56 * *a14];
  v29 = 1613850677 * ((858915205 - (&a17 | 0x33320185) + (&a17 | 0xCCCDFE7A)) ^ 0xF196907D);
  a19 = v23 + 0x2916790907C2B265;
  a20 = (unsigned __int8 *)(v23 + 0x1277B03DBA8BFA76);
  a17 = v23 + 0x7B38945B24F3D3CBLL;
  a18 = v28 + 0x20E72904F2E02B4FLL;
  LODWORD(a21) = ((v25 & 0xFFFFFFF0 ^ 0xA1FEBFD9) + 2122153848 + ((v26 + 1140685252 + 3 * (v26 ^ 0x4B0)) & (2 * v25))) ^ v29;
  a22 = v29 + v26 - 172;
  v30 = ((uint64_t (*)(uint64_t *))((char *)*(&off_24DCDB210 + (v26 ^ 0x4D8)) - 12))(&a17);
  return (*(uint64_t (**)(uint64_t))(v24 + 8 * ((114 * (HIDWORD(a21) != 1412947868)) ^ v26)))(v30);
}

uint64_t sub_21A583CDC()
{
  _QWORD *v0;
  uint64_t v1;
  int v2;
  int v3;

  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v1
                                                     + 8
                                                     * ((626 * (v3 != ((v2 + 2146424270) & 0xFFFBBBE6) - 2146144934)) ^ v2))
                                         - ((4 * v2) ^ 0x328u)
                                         + 228))(*v0);
}

uint64_t sub_21A583D38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v19 = ((unint64_t)&a17 ^ 0xBCFEDBEFDBFBFEF7)
      + 0x4F13FF7DFDA6F009
      + ((2 * (_QWORD)&a17) & 0x79FDB7DFB7F7FDE0);
  a17 = ((a9 - 9733) & 0x7FEBB7BE ^ 0xFFFFFFFF80146D59) + v18;
  *(_BYTE *)(a1 + a17) = (v19 ^ 0xBA) * (v19 + 17);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 + 8 * ((23 * (a17 == 0)) ^ a9)) - 4))(a1, a2, a3, a4, a5, a6, a7, a8);
}

void sub_21A583DE4()
{
  JUMPOUT(0x21A583DACLL);
}

uint64_t sub_21A583DEC()
{
  unsigned int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((v0 >= ((v1 - 309) | 0x110u) - 402) * (((v1 - 196) | 0x108) ^ 0x21A)) ^ v1))
                            - 4))();
}

uint64_t sub_21A583E88@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  int v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v7 = v4 + a1 + v3;
  *(_BYTE *)(a2 + v5 - 1) = ((v7 - 89) ^ 0xBA) * (v7 - 72);
  *(_BYTE *)(a2 + v5 - 2) = (v7 + ((v2 - 66) & 0xFD)) * ((v7 - 88) ^ 0xBA);
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((691 * ((a2 & 0xFFFFFFFE) == 2)) ^ v2)) - 12))();
}

void sub_21A583F28()
{
  JUMPOUT(0x21A583EE0);
}

uint64_t sub_21A583F34()
{
  int v0;
  _DWORD *v1;
  _QWORD *v2;
  int v3;

  ((void (*)(void))*(&off_24DCDB210 + (v0 ^ 0x7FEB93B4)))();
  *v2 = 0;
  *v1 = 0;
  return (v3 - 1412947868);
}

void sub_21A58402C(uint64_t a1)
{
  int v1;
  _BOOL4 v3;

  v1 = 1613850677 * (((a1 | 0x788949E8) - (a1 & 0x788949E8)) ^ 0x45D227EF);
  v3 = *(_QWORD *)(a1 + 8) != 0x678513AAEE03A96CLL && (unsigned __int16)(*(_WORD *)a1 + v1) != 10669;
  __asm { BR              X13 }
}

uint64_t sub_21A584118()
{
  int v0;
  unsigned int v1;
  unsigned int v2;
  uint64_t v3;
  _BOOL4 v4;

  v4 = (v1 | ((v1 < v2) << 16)) != 10669;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((4 * v4) | (16 * v4)) ^ v0)) - 4))();
}

#error "21A584644: call analysis failed (funcsize=212)"

uint64_t sub_21A584648(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, int a6, unsigned int a7, char a8)
{
  int v8;
  char v9;
  int v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  _BYTE *v17;
  unsigned int v18;
  unint64_t v19;
  char v20;

  v17 = (_BYTE *)(a3 + (v15 + v16));
  v18 = -299340727
      * ((*(_DWORD *)(*(_QWORD *)STACK[0x230] + (*(int *)STACK[0x238] & ((v10 + a6) & a7 ^ 0xFFFFFFFFDD357A3FLL))) ^ v17) & 0x7FFFFFFF);
  v19 = -299340727 * (v18 ^ HIWORD(v18));
  v20 = *(_BYTE *)(*(_QWORD *)(v12 + 8 * (v10 - 584)) + (v19 >> 24)) ^ (((v8 ^ a4) >> (v9 + a8))
                                                                        - (v11 & (2 * ((v8 ^ a4) >> (v9 + a8))))
                                                                        + 21) ^ *(_BYTE *)(*(_QWORD *)(v12 + 8 * (v10 ^ 0x318))
                                                                                         + (v19 >> 24)
                                                                                         + 2) ^ *(_BYTE *)(*(_QWORD *)(v12 + 8 * (v10 - 821)) + (v19 >> 24) + 2 - 12) ^ v19 ^ (119 * BYTE3(v19)) ^ 0x15;
  *v17 = v20;
  return (*(uint64_t (**)(void))(v13 + 8 * ((49 * (v15 - (v20 != 0) != v14)) ^ v10)))();
}

void sub_21A5857AC()
{
  JUMPOUT(0x21A5845FCLL);
}

void sub_21A5857B4()
{
  int v0;
  uint64_t v1;

  *(_DWORD *)(v1 + 4) = v0;
}

void sub_21A5857FC(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 28) ^ (888531001 * ((a1 - 378698490 - 2 * (a1 & 0xE96D8506)) ^ 0xBDBC3C62));
  __asm { BR              X14 }
}

uint64_t sub_21A58594C(int a1)
{
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((116
                                          * (((v1 - 2134876775) ^ (2 * a1) & 0xF8EDEB7E) + (a1 ^ 0xBE1ECF13) - 272654368 == ((v1 - 907) ^ 0x6C3695AB))) ^ v1))
                            - 8))();
}

uint64_t sub_21A5859B8(int a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((63
                                          * ((((v1 - 3) ^ (a1 + v2 - 2088170943 < (((v1 - 959) | 0xA6) ^ 0xAEu))) & 1) == 0)) ^ (v1 - 306)))
                            - 8))();
}

uint64_t sub_21A585A18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  uint64_t v8;

  return (*(uint64_t (**)(void))(v8
                              + 8
                              * ((1184 * ((((a7 + 790) ^ 0xFFFFFCD8 ^ (2 * a7) ^ 0x1D8) & a8) == 2088170944)) ^ a7)))();
}

uint64_t sub_21A585A5C(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _BOOL4 v21;

  v10 = (a1 + v7 + a2);
  v11 = v10 + a3;
  v12 = v10 + *(_QWORD *)(v8 - 120);
  v13 = v11 - v12 + (((a4 + 296) | 0x200u) ^ 0xCE4E6273EC836DB1);
  v14 = ((a4 + 32) ^ 0xBB) & (a1 + v7);
  v15 = v6 - v12;
  v16 = (v14 | v5) - v12;
  v17 = (v14 | v4) - v12;
  v21 = v13 < 0x10 || (unint64_t)(v15 + v14) < 0x10 || (unint64_t)(v16 + 1) < 0x10 || v17 < 0x10;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((307 * v21) ^ a4)) - 12))();
}

uint64_t sub_21A585AF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v7;
  uint64_t v8;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v8
                                                             + 8
                                                             * ((((((a7 - 75701734) ^ (v7 < 0x10)) & 1) == 0)
                                                               * (((a7 + 355) | 0x60) ^ 0x1BF)) ^ a7)))(a1, a2, 0);
}

uint64_t sub_21A585B40(int a1, int a2, uint64_t a3, uint64_t a4, int a5, unsigned int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  int8x16_t v28;
  uint64_t v29;
  int8x16_t v30;
  int8x16_t v31;
  int8x16x4_t v33;
  int8x16x4_t v34;

  v33.val[1].i64[0] = ((_BYTE)v22 + 14) & 0xF;
  v33.val[1].i64[1] = ((_BYTE)v22 + 13) & 0xF;
  v33.val[2].i64[0] = ((_BYTE)v22 + 12) & 0xF;
  v33.val[2].i64[1] = ((_BYTE)v22 + 11) & 0xF;
  v33.val[3].i64[0] = ((_BYTE)v22 + 10) & 0xF;
  v33.val[3].i64[1] = ((_BYTE)v22 + 9) & 0xF;
  v26 = a1 + v23 + a2;
  v27 = (v24 & 0xFFFFFFF0) - 16;
  v28.i64[0] = 0x7B7B7B7B7B7B7B7BLL;
  v28.i64[1] = 0x7B7B7B7B7B7B7B7BLL;
  v29 = v26 & ((a5 & a6) - 26 - 161);
  v33.val[0].i64[0] = v29;
  v33.val[0].i64[1] = ((_BYTE)v22 - 1) & 0xF;
  v30.i64[0] = vqtbl4q_s8(v33, (int8x16_t)xmmword_21A5D5130).u64[0];
  v34.val[0].i64[1] = ((_BYTE)v22 + 7) & 0xF;
  v34.val[1].i64[1] = ((_BYTE)v22 + 5) & 0xF;
  v34.val[2].i64[1] = (v22 + 3) & 0xF;
  v34.val[3].i64[1] = ((_BYTE)v22 + 1) & 0xF;
  v34.val[0].i64[0] = ((_BYTE)v22 + 8) & 0xF;
  v34.val[1].i64[0] = ((_BYTE)v22 + 6) & 0xF;
  v34.val[2].i64[0] = (v22 + 4) & 0xF;
  v34.val[3].i64[0] = (v22 + 2) & 0xF;
  v30.i64[1] = vqtbl4q_s8(v34, (int8x16_t)xmmword_21A5D5130).u64[0];
  v31 = vrev64q_s8(vmulq_s8(v30, v28));
  *(int8x16_t *)(*(_QWORD *)(v25 - 120) - 15 + v26) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v21 + v29 - 15), *(int8x16_t *)(v18 - 15 + v26)), veorq_s8(*(int8x16_t *)(v29 + v20 - 14), *(int8x16_t *)(v19 + v29 - 15))), vextq_s8(v31, v31, 8uLL));
  return (*(uint64_t (**)(void))(a18 + 8 * ((777 * (v27 == 0)) ^ a5 & a6)))();
}

void sub_21A585CA0()
{
  JUMPOUT(0x21A585C28);
}

uint64_t sub_21A585CAC(int a1)
{
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((((2 * v1) ^ 0x8C) + 184) * (a1 == 0xC2683AAC)) ^ v1)) - 12))();
}

uint64_t sub_21A585CF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  unsigned int v12;
  int v13;
  _BOOL4 v14;

  v11 = v6 > 0x21EF624E;
  *(_BYTE *)(*(_QWORD *)(v9 - 120) + (v8 - 2049629668)) = *(_BYTE *)(v3 + (((_BYTE)v8 + 28) & 0xF)) ^ *(_BYTE *)(v0 + (v8 - 2049629668)) ^ *(_BYTE *)((((_BYTE)v8 + 28) & 0xF) + v2 + 1) ^ *(_BYTE *)(v1 + ((v8 - 2049629668) & 0xFLL)) ^ (123 * ((v8 + 28) & 0xF));
  v12 = ((v4 + 327713634) & 0xEC777C75 ^ 0x63E5BFFA) + v8;
  v13 = v11 ^ (v12 < v5);
  v14 = v12 < v7;
  if (!v13)
    v11 = v14;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((236 * !v11) ^ v4)) - 12))();
}

uint64_t sub_21A585DAC(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((((v4 ^ 0x16) - 114) ^ 0x407) * (v3 != a3)) ^ v4)) - 12))();
}

uint64_t sub_21A585DE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v7;
  uint64_t v8;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v8
                                                     + 8
                                                     * (int)(((a7 + 465 + (a7 ^ 0x31A) - 1569) * ((v7 >> 3) & 1)) ^ a7)))(a1, a2);
}

uint64_t sub_21A585E10@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  char v24;
  uint64_t v25;
  int8x16x4_t v27;

  *(_QWORD *)(v22 - 128) = v14 - 7;
  *(_QWORD *)(v22 - 136) = *(_QWORD *)(v22 - 120) - 7;
  *(_DWORD *)(v22 - 144) = v21 & 0xFFFFFFF8;
  *(_DWORD *)(v22 - 140) = v21;
  v23 = -a3;
  v24 = v19 + a1 + v20;
  v25 = (a1 + v20 + a2 + v23);
  v27.val[0].i64[0] = ((_BYTE)a1 + (_BYTE)v20 + (_BYTE)a2 + (_BYTE)v23) & 0xF;
  v27.val[0].i64[1] = (v24 + 15 + (_BYTE)v23) & 0xF;
  v27.val[1].i64[0] = (v24 + 14 + (_BYTE)v23) & 0xF;
  v27.val[1].i64[1] = (v24 + 13 + (_BYTE)v23) & 0xF;
  v27.val[2].i64[0] = (v18 + (_BYTE)v23 + ((a4 + 25) ^ 0xC)) & 0xF;
  v27.val[2].i64[1] = (v24 + 11 + (_BYTE)v23) & 0xF;
  v27.val[3].i64[0] = (v24 + 10 + (_BYTE)v23) & 0xF;
  v27.val[3].i64[1] = (v24 + 9 + (_BYTE)v23) & 0xF;
  *(int8x8_t *)(*(_QWORD *)(v22 - 136) + v25) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v17 + (v25 & 0xF) - 7), *(int8x8_t *)(*(_QWORD *)(v22 - 128) + v25)), veor_s8(*(int8x8_t *)((v25 & 0xF) + v16 - 6), *(int8x8_t *)(v15 + (v25 & 0xF) - 7))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v27, (int8x16_t)xmmword_21A5D5140), (int8x8_t)0x7B7B7B7B7B7B7B7BLL)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a14 + 8 * ((277 * (8 - (v21 & 0xFFFFFFF8) == v23)) ^ a4)) - 8))((__n128)xmmword_21A5D5140);
}

void sub_21A585F54()
{
  JUMPOUT(0x21A585E7CLL);
}

uint64_t sub_21A585F5C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8 * ((v0 | 0x20) ^ (279 * (*(_DWORD *)(v1 - 140) != *(_DWORD *)(v1 - 144)))))
                            - (((v0 | 0x20u) + 780) ^ 0xFFFFFFFFFFFFFC64)
                            - (((v0 | 0x20) - 140) | 0x10u)))();
}

uint64_t sub_21A585FA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  *(_BYTE *)(*(_QWORD *)(v11 - 120) + (a5 - 1815516576)) = *(_BYTE *)(v9 + ((a5 - 1815516576) & 0xFLL)) ^ *(_BYTE *)(v6 + (a5 - 1815516576)) ^ *(_BYTE *)((((_BYTE)a5 + 96) & 0xF) + v8 + 1) ^ *(_BYTE *)(v7 + (((_BYTE)a5 + 96) & 0xF)) ^ (123 * ((a5 + 96) & 0xF));
  return (*(uint64_t (**)(void))(v12 + 8 * (((a5 - 1 == v10) * ((26 * (a6 ^ 0x3BE)) ^ 0x3C7)) ^ (a6 - 809))))();
}

uint64_t sub_21A58601C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int8x16_t v14;

  v14.i64[0] = 0xF0F0F0F0F0F0F0F0;
  v14.i64[1] = 0xF0F0F0F0F0F0F0F0;
  *(int8x16_t *)(v12 - 112) = veorq_s8(vaddq_s8(*(int8x16_t *)*(_QWORD *)(v11 + 8), v14), (int8x16_t)xmmword_21A5D5150);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 + 8 * (int)(a4 ^ (916 * (*(_QWORD *)(v12 - 120) != 0)))) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

uint64_t sub_21A58607C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20)
{
  uint64_t v20;
  int v21;
  int v22;
  _BOOL4 v24;

  v21 = a12 - ((2 * a12 + 443476498) & 0x6683C802) + 7952650;
  v22 = ((a20 - 67144849) & (2 * v21) ^ 0x62834002) + (v21 ^ 0x4EBE5F76);
  v24 = (((((a4 + 55) | 0x14) ^ 6) + (_BYTE)v22) & 0xF) == (_DWORD)a4 - 52 && v22 != 2113911671;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 + 8 * (int)((467 * v24) ^ a4)) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

uint64_t sub_21A586128(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  int v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  int v23;
  char *v24;
  uint64_t v25;
  char *v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  char v30;
  unsigned int v31;
  int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned __int8 *v36;
  unsigned __int8 *v37;
  unsigned int v38;
  int v39;
  unsigned int v40;
  unsigned int v41;
  int v42;
  int v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  unsigned __int8 *v47;
  unsigned int v48;
  int v49;
  unsigned __int8 v50;
  uint64_t v51;
  int v52;
  char *v53;
  char *v54;
  int v55;
  uint64_t v56;
  char *v57;
  unsigned int v58;
  unsigned int v59;
  int v60;
  unsigned int v61;
  int v62;
  int v63;
  unint64_t v64;
  int v65;
  unsigned int v66;
  int v67;
  unsigned int v68;
  int v69;
  unsigned int v70;
  unsigned int v71;
  int v72;
  unsigned int v73;
  int v74;
  int v75;
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  int v79;
  unsigned int v80;
  unsigned int v81;
  int v82;
  unsigned int v83;
  int v84;
  int v85;
  int v86;
  unsigned int v87;
  unsigned int v88;
  int v89;
  int v90;
  unsigned int v91;
  int v92;
  unsigned int v93;
  int v94;
  unsigned int v95;
  int v96;
  unsigned int v97;
  int v98;
  char v99;
  unsigned __int8 v100;
  int v101;
  unsigned int v102;
  unsigned int v103;
  int v104;
  int v105;
  unsigned int v106;
  unsigned int v107;
  int v108;
  int v109;
  unsigned int v110;
  int v111;
  unsigned int v112;
  unsigned int v113;
  int v114;
  int v115;
  unsigned int v116;
  int v117;
  int v118;
  unsigned int v119;
  int v120;
  int v121;
  unsigned int v122;
  int v123;
  unsigned int v124;
  int v125;
  unsigned int v126;
  int v127;
  unsigned int v128;
  int v129;
  unsigned int v130;
  int v131;
  unsigned int v132;
  int v133;
  int v134;
  unsigned int v135;
  int v136;
  int v137;
  unsigned int v138;
  int v139;
  unsigned int v140;
  unsigned int v141;
  int v142;
  unsigned int v143;
  int v144;
  int v145;
  unsigned int v146;
  unsigned int v147;
  int v148;
  int v149;
  unsigned int v150;
  unsigned int v151;
  int v152;
  int v153;
  int v154;
  unsigned int v155;
  int v156;
  unsigned int v157;
  unsigned int v158;
  int v159;
  unsigned int v160;
  int v161;
  unsigned int v162;
  int v163;
  int v164;
  int v165;
  char v166;
  int v167;
  int v168;
  unsigned int v169;
  int v170;
  unint64_t v171;
  int v172;
  int v173;
  unsigned int v174;
  uint64_t v175;
  char *v176;
  int v177;
  _BYTE *v178;
  int v179;
  unsigned int v180;
  int v181;
  int v182;
  int v183;
  int v184;
  int v185;
  int v186;
  int v187;
  char *v188;
  int v189;
  int v190;
  int v191;
  int v192;
  int v193;
  char *v194;
  int v195;
  int v196;
  int v197;
  int v198;
  uint64_t v199;
  char *v200;
  int v201;
  unsigned int v202;
  int v203;
  unsigned int v204;
  unsigned int v205;
  unsigned int v206;
  unsigned int v207;
  unsigned int v208;
  char *v209;
  int v210;
  int v211;
  unsigned int v212;
  unsigned int v213;
  uint64_t v214;
  char *v215;
  int v216;
  unsigned int v217;
  uint64_t v218;
  uint64_t v220;
  char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  unint64_t v225;
  unint64_t v226;
  unint64_t v227;
  uint64_t v228;
  uint64_t v229;
  unsigned int v230;

  v21 = (uint64_t)*(&off_24DCDB210 + a4 + 93);
  v22 = *(unsigned __int8 *)(v21 + (*(unsigned __int8 *)(v20 - 104) ^ 0x32));
  v23 = (v22 >> (a4 - 48)) ^ (v22 >> 1) ^ 0x57;
  v24 = (char *)*(&off_24DCDB210 + a4 + 37) - 8;
  v25 = (uint64_t)*(&off_24DCDB210 + ((a4 + 392) ^ 0x108));
  v26 = (char *)*(&off_24DCDB210 + a4 + 175) - 8;
  v27 = *(unsigned __int8 *)(v21 + (*(unsigned __int8 *)(v20 - 108) ^ 0xD7));
  v28 = (((*(_BYTE *)(v20 - 105) ^ 0xFA) + (~(2 * (*(_BYTE *)(v20 - 105) ^ 0xFA) + 62) | 0x91) - 41) ^ v26[*(unsigned __int8 *)(v20 - 105) ^ 0xE3]) & 0xFF00FFFF | (((*(_BYTE *)(v25 + (*(unsigned __int8 *)(v20 - 107) ^ 0x5ALL)) - 12) ^ 0x79) << 16) | ((v27 ^ (((v27 >> 4) ^ (v27 >> 1) ^ 0x57) - 2 * (((v27 >> 4) ^ (v27 >> 1) ^ 0x57) & 3) + 3) ^ 0x3E) << 24);
  v220 = v25;
  v29 = *(unsigned __int8 *)(v20 - 97);
  v30 = ((2 * (v29 & 0x1F)) ^ 0x26) + (v29 ^ 0x6C);
  v31 = ((*(_BYTE *)(v20 - 101) ^ 0x43) - ((2 * (*(_BYTE *)(v20 - 101) ^ 0x43) + 62) & 0x6E) - 42) ^ v26[*(unsigned __int8 *)(v20 - 101) ^ 0x5ALL] | (((*(_BYTE *)(v20 - 102) - ((2 * *(_BYTE *)(v20 - 102)) & 0x58) + 44) ^ 0x56 ^ v24[*(unsigned __int8 *)(v20 - 102) ^ 0xC6]) << 8) & 0xFF00FFFF | ((v22 ^ (v23 - ((2 * v23) & 0x58) + 44) ^ 0x88888888) << 24) | (((*(_BYTE *)(v25 + (*(unsigned __int8 *)(v20 - 103) ^ 0x42)) - 12) ^ 0x22) << 16);
  v32 = v26[v29 ^ 0x6A];
  LODWORD(v29) = *(unsigned __int8 *)(v21 + (*(unsigned __int8 *)(v20 - 112) ^ 7));
  v33 = (((*(_BYTE *)(v20 - 109) ^ 0xB1) - ((2 * (*(_BYTE *)(v20 - 109) ^ 0xB1) + 62) & 0x6E) - 42) ^ v26[*(unsigned __int8 *)(v20 - 109) ^ 0xA8] | ((v24[*(unsigned __int8 *)(v20 - 110) ^ 0xAFLL] ^ (*(_BYTE *)(v20 - 110) + (~(2 * *(_BYTE *)(v20 - 110)) | 0xA7) + 45) ^ 0xC9) << 8)) & 0xFF00FFFF | (((*(_BYTE *)(v25 + (*(unsigned __int8 *)(v20 - 111) ^ 0x66)) - 12) ^ 0x50) << 16) | ((v29 ^ 0xF4 ^ (((v29 >> 4) ^ (v29 >> 1) ^ 0x57) - ((2 * ((v29 >> 4) ^ (v29 >> 1) ^ 0x57)) & 0xE0) - 16)) << 24);
  v221 = v24;
  v222 = v21;
  v34 = *(unsigned __int8 *)(v21 + (*(unsigned __int8 *)(v20 - 100) ^ 0x96));
  v35 = ((v30 - ((2 * v30) & 0x6E) - 73) ^ v32) & 0xFF00FFFF | (((*(_BYTE *)(v25 + (*(unsigned __int8 *)(v20 - 99) ^ 0x7FLL))
                                                                                                  - 12) ^ 0xC6) << 16) | ((v34 ^ 0xC6 ^ (((v34 >> 4) ^ (v34 >> 1) ^ 0x57) - ((2 * ((v34 >> 4) ^ (v34 >> 1) ^ 0x57)) & 0xFFFFFFC3) - 31)) << 24) | ((v24[*(unsigned __int8 *)(v20 - 98) ^ 0xF2] ^ (*(_BYTE *)(v20 - 98) - ((2 * *(_BYTE *)(v20 - 98)) & 0x58) + 44) ^ 2) << 8);
  *(_DWORD *)(v20 - 148) = (v28 | ((v24[*(unsigned __int8 *)(v20 - 106) ^ 0x4ELL] ^ (*(_BYTE *)(v20 - 106) - ((2 * *(_BYTE *)(v20 - 106)) & 0x58) + 44) ^ 0x99) << 8)) ^ 0xEFE8697B;
  *(_DWORD *)(v20 - 144) = v33 ^ 0x84582188;
  *(_DWORD *)(v20 - 136) = v35 ^ 0x1EF8EED0;
  HIDWORD(a12) = v19 - 2113911671;
  *(_DWORD *)(v20 - 140) = v31 ^ 0xAFFDA700;
  HIDWORD(a17) = 0;
  LODWORD(v228) = 2 * a4;
  *(_QWORD *)(v20 - 168) = 12;
  v36 = *(unsigned __int8 **)(v20 - 120);
  v37 = v36;
  v38 = *(unsigned __int8 *)(v21 + (v36[12] ^ 0xD1));
  *(_QWORD *)(v20 - 160) = 4;
  HIDWORD(a19) = (2 * a4) ^ 0x317;
  v39 = HIDWORD(a19) ^ (v38 >> 4) ^ (v38 >> 1) ^ 0x28;
  LODWORD(v229) = (~(2 * v39) + v39) ^ v38;
  v40 = *(unsigned __int8 *)(v21 + (v36[4] ^ 0x66));
  *(_QWORD *)(v20 - 176) = 13;
  v230 = (((v40 >> 4) ^ (v40 >> 1) ^ 0x57) - ((2 * ((v40 >> 4) ^ (v40 >> 1) ^ 0x57)) & 0xFFFFFF83) - 63) ^ v40;
  v41 = (((*(_BYTE *)(v25 + (v36[13] ^ 0xA2)) - 12) ^ 0x92) << 16) | ((v229 ^ 0x51) << 24);
  *(_QWORD *)(v20 - 208) = 6;
  HIDWORD(v228) = v24[v37[6] ^ 0x3DLL] ^ (v37[6] + (~(2 * v37[6]) | 0xA7) + 45);
  *(_QWORD *)(v20 - 200) = 15;
  v42 = ((v37[15] ^ 0x70) - ((2 * (v37[15] ^ 0x70) + 62) & 0x6E) - 42) ^ v26[v37[15] ^ 0x69];
  v43 = v24[v37[2]] ^ (v37[2] + (~(2 * v37[2]) | 0xA7) + 45);
  *(_QWORD *)(v20 - 192) = 3;
  v44 = v36[3];
  v45 = v26[v44 ^ 0x8C];
  *(_QWORD *)(v20 - 184) = 0;
  v46 = *v36;
  *(_DWORD *)(v20 - 128) = ((v44 ^ 0x95) + (~(2 * (v44 ^ 0x95) + 62) | 0x91) - 41) ^ v45;
  LODWORD(v44) = *(unsigned __int8 *)(v21 + (v46 ^ 0x9C));
  LODWORD(v37) = v44 ^ 0xDE ^ (((v44 >> 4) ^ (v44 >> 1) ^ 0x57)
                             - ((2 * ((v44 >> 4) ^ (v44 >> 1) ^ 0x57)) & 0x2C)
                             + 22);
  v47 = v36;
  v48 = *(unsigned __int8 *)(v21 + (v36[8] ^ 0xADLL));
  v49 = v48 ^ 0x85 ^ (((v48 >> 4) ^ (v48 >> 1) ^ 0x57) - ((2 * ((v48 >> 4) ^ (v48 >> 1) ^ 0x57)) & 0x72) - 71);
  v50 = (*(_BYTE *)(v25 + (v36[5] ^ 0x20)) - 12) ^ 0x78;
  LODWORD(v46) = ((v26[v47[7] ^ 0xC9] ^ 0xB7) & 0xFF00FFFF | ((HIDWORD(v228) ^ 0xB4) << 8) & 0xFF00FFFF | ((v230 ^ 0xD3) << 24) | (v50 << 16)) ^ ((v47[7] ^ 0xD0) + 31);
  v51 = v36[14];
  LOBYTE(v48) = (v51 ^ 0x9B) - ((2 * (v51 ^ 0x9B)) & 0x4C) - 90;
  LODWORD(v25) = v24[v51 ^ 0x4C] ^ (v48 - 2 * (v48 & 0x2D ^ (v51 ^ 0x9B) & 1) + 44);
  v52 = v24[v47[10] ^ 0xF1] ^ (v47[10] - ((2 * v47[10]) & 0x58) + 44);
  LODWORD(v21) = ((v47[11] ^ 0x70) - ((2 * (v47[11] ^ 0x70) + 62) & 0x6E) - 42) ^ v26[v47[11] ^ 0x69];
  v53 = (char *)*(&off_24DCDB210 + (a4 ^ 0x17D)) - 12;
  v54 = (char *)*(&off_24DCDB210 + (a4 ^ 0x10C)) - 8;
  v55 = *(_DWORD *)&v54[4 * (BYTE2(v41) ^ 0x8B)] ^ ((BYTE2(v41) ^ 0x2A)
                                                  - 709379826
                                                  - ((2 * (HIWORD(v41) ^ 0xA02A)) & 0x1C)) ^ (*(_DWORD *)&v53[4 * (v44 ^ 0xDE ^ (((v44 >> 4) ^ (v44 >> 1) ^ 0x57) - ((2 * ((v44 >> 4) ^ (v44 >> 1) ^ 0x57)) & 0x2C) + 22) ^ 0xC5)]
                                                                                            + 602030314);
  HIDWORD(v229) = a4;
  v56 = (uint64_t)*(&off_24DCDB210 + a4 + 146);
  HIDWORD(v224) = v52;
  LODWORD(v44) = *(_DWORD *)(v56 + 4 * (v52 ^ 0xA9u)) ^ 0x212EF727;
  v57 = (char *)*(&off_24DCDB210 + HIDWORD(v229) + 221) - 12;
  v58 = *(_DWORD *)&v57[4
                      * (v46 ^ 0x8C ^ -(v46 ^ 0x8C) ^ ((v46 ^ 0xFFFFFFEB)
                                                                                       + 153))
                      + 608] ^ v44 ^ (((16 * v44) & 0x7641B170 ^ v55)
                                    - 930847024
                                    - 2 * (((16 * v44) & 0x7641B170 ^ v55) & 0x488466DF ^ v55 & 0xF));
  HIDWORD(v223) = ((*(_BYTE *)(v220 + (v36[1] ^ 0xE8)) - 12) ^ 0x32) << 16;
  LODWORD(v224) = v21;
  v226 = __PAIR64__(v43, v37);
  v59 = HIDWORD(v223) & 0xFFFFFF | (v37 << 24);
  LODWORD(v44) = BYTE2(v59) ^ 0x4E;
  v60 = v44 - 709379826 - 2 * ((BYTE2(v59) ^ 0x4E) & 0xF ^ HIWORD(v59) & 1);
  v225 = __PAIR64__(v46, v25);
  v61 = *(_DWORD *)&v57[4 * (v21 ^ 0xC2)];
  LODWORD(v21) = ((v61 << 14) & 0xE7BC4000 ^ 0x1B40000) + ((v61 << 13) ^ 0x7F042CEF) + 203543313;
  v61 >>= 19;
  LODWORD(v37) = (v21 + ((v21 | v61) ^ 0xFFFFE6EF) + 1) ^ ((v61 ^ 0xFFFFE6EF) + 1);
  LODWORD(v46) = *(_DWORD *)(v56
                           + 4
                           * ((((v25 ^ 7) + (v25 ^ 0xFFFFFF81) + 1) ^ 0xFFFFFFFE)
                            + (v25 ^ 7)));
  LODWORD(v44) = (*(_DWORD *)&v53[4 * (v230 ^ 0x7A)] + 602030314) ^ v60 ^ *(_DWORD *)&v54[4 * (v44 ^ 0xA1)];
  v62 = v46 ^ (16 * v46) & 0x7641B170;
  LODWORD(v46) = *(_DWORD *)(v56 + 4 * (v43 ^ 0xEDu));
  v63 = v44 ^ v62;
  HIDWORD(v64) = v46 ^ 0xFEC5F;
  LODWORD(v64) = v46 ^ 0xA5C00000;
  v65 = v50 ^ 0x88 ^ (*(_DWORD *)&v53[4 * (v49 ^ 3)] + 602030314);
  LODWORD(v64) = __ROR4__((v64 >> 20) ^ 0xA923DEED, 12);
  LODWORD(v44) = *(_DWORD *)&v54[4 * (v50 ^ 0x29)] ^ 0x23AD7208 ^ v64 ^ 0x6A3B8945 ^ (16 * (v64 ^ 0x6A3B8945)) & 0x7641B170 ^ (v65 - 709379826 - ((2 * v65) & 0xAB6F721C));
  v227 = __PAIR64__(v41, v42);
  HIDWORD(v64) = *(_DWORD *)&v57[4 * (v42 ^ 0xE4)] ^ 0xFE9998DC;
  LODWORD(v64) = HIDWORD(v64);
  LODWORD(v64) = (v64 >> 17) ^ __ROR4__(v44, 17) ^ 0x6A4C547;
  HIDWORD(v64) = v64;
  LODWORD(v223) = (((*(_BYTE *)(v220 + (v36[9] ^ 0x19)) - 12) ^ 0x8E) << 16) | (v49 << 24);
  v66 = *(_DWORD *)&v54[4 * (BYTE2(v223) ^ 0xD8)] ^ ((BYTE2(v223) ^ 0x79)
                                                   - 709379826
                                                   - ((2 * (WORD1(v223) ^ 0x379)) & 0x1C)) ^ (*(_DWORD *)&v53[4 * (v229 ^ 0x96)]
                                                                                            + 602030314);
  v67 = *(_DWORD *)(v56 + 4 * (HIDWORD(v228) ^ 0x97u)) ^ 0x212EF727;
  v68 = v67 ^ *(_DWORD *)&v57[4 * (*(_DWORD *)(v20 - 128) ^ 0xE8)] ^ (((16 * v67) & 0x7641B170 ^ v66)
                                                                    - 930847024
                                                                    - 2
                                                                    * (((16 * v67) & 0x7641B170 ^ v66) & 0x488466DF ^ v66 & 0xF));
  LODWORD(v44) = (v64 >> 15) - ((2 * (v64 >> 15)) & 0xF7385EBC) + 2073833310;
  LODWORD(v46) = *(_DWORD *)(v56 + 4 * (BYTE1(v44) ^ 0x29u)) ^ 0x212EF727;
  v69 = *(_DWORD *)&v54[4 * (BYTE2(v68) ^ 0x60)] ^ 0x23AD7208 ^ (*(_DWORD *)&v53[4 * (HIBYTE(v58) ^ 0x15)] + 602030314) ^ ((BYTE2(v68) ^ 0xC1) - 709379826 - ((v68 >> 15) & 0x1C)) ^ (16 * v46) & 0x7641B170;
  v70 = ((v61 ^ 0x36A3212D ^ ((_DWORD)v37 - ((2 * (_DWORD)v37) & 0x6D46707A) + 916666429)) + v21) ^ 0x63FA1732;
  v71 = v63 ^ (v70 << 19);
  v72 = v71 ^ (v70 >> 13);
  v73 = v46 ^ *(_DWORD *)&v57[4 * (v72 ^ 0x66)] ^ (v69 - 930847024 - ((2 * v69) & 0x9108CDA0));
  LODWORD(v46) = *(_DWORD *)&v54[4 * (BYTE2(v58) ^ 0xF3)] ^ ((BYTE2(v58) ^ 0x52)
                                                           - 709379826
                                                           - ((2 * (HIWORD(v58) ^ 0x1552)) & 0x1C)) ^ (*(_DWORD *)&v53[4 * (HIBYTE(v71) ^ 0xD3)] + 602030314);
  v74 = *(_DWORD *)(v56
                  + 4 * ((((BYTE1(v68) ^ 0x14) + (BYTE1(v68) ^ 0xFFFFFF92) + 1) ^ 0xFFFFFFFE) + (BYTE1(v68) ^ 0x14)));
  LODWORD(v21) = v44 ^ 0x4F7650B3;
  v75 = *(_DWORD *)&v57[4 * (v44 ^ 0xB3)] ^ v74 ^ ((v46 ^ 0x12413070 ^ (16 * v74) & 0x7641B170)
                                                                  - 930847024
                                                                  - 2
                                                                  * ((v46 ^ 0x12413070 ^ (16 * v74) & 0x7641B170) & 0x488466DE ^ v46 & 0xE));
  v76 = (*(_DWORD *)&v53[4 * (BYTE3(v44) ^ 0x28)] + 602030314) ^ *(_DWORD *)&v54[4
                                                                               * (((v72 ^ 0xB41D1A66) >> 16) ^ 0xA1)] ^ (((v72 ^ 0xB41D1A66) >> 16) - 709379826 - (((v72 ^ 0xB41D1A66) >> 15) & 0x1C));
  LODWORD(v44) = *(_DWORD *)(v56 + 4 * (BYTE1(v58) ^ 0x42u)) ^ 0x212EF727;
  v77 = v44 ^ *(_DWORD *)&v57[4 * (v68 ^ 0x16)] ^ ((v76 ^ (16 * v44) & 0x7641B170)
                                                                  - 930847024
                                                                  - 2
                                                                  * ((v76 ^ (16 * v44) & 0x7641B170) & 0x488466D8 ^ v76 & 8));
  v78 = (*(_DWORD *)&v53[4 * (HIBYTE(v68) ^ 0x88)] + 602030314) ^ (BYTE2(v21)
                                                                 - 709379826
                                                                 - ((v21 >> 15) & 0x1C)) ^ *(_DWORD *)&v57[4 * (v58 ^ 0x69)];
  v79 = *(_DWORD *)(v56 + 4 * (BYTE1(v72) ^ 0x63u)) ^ 0x212EF727;
  v80 = v78 ^ v79 ^ *(_DWORD *)&v54[4 * (BYTE2(v21) ^ 0xA1)] ^ (16 * v79) & 0x7641B170;
  LODWORD(v21) = *(_DWORD *)(v56 + 4 * (BYTE1(v77) ^ 0x69u)) ^ 0x212EF727;
  LODWORD(v44) = (*(_DWORD *)&v53[4 * (HIBYTE(v73) ^ 0x61)] + 602030314) ^ *(_DWORD *)&v54[4
                                                                                         * (((v80 ^ 0x73C0A089) >> 16) ^ 0xA1)] ^ v21 ^ (16 * v21) & 0x7641B170 ^ (((v80 ^ 0x73C0A089) >> 16) - 709379826 - ((v80 >> 15) & 0x1C));
  v81 = (v44 - 930847024 - ((2 * v44) & 0x9108CDA0)) ^ *(_DWORD *)&v57[4 * (v75 ^ 0xD8)];
  LODWORD(v25) = *(_DWORD *)(v56 + 4 * (BYTE1(v80) ^ 0xD9u)) ^ 0x212EF727;
  v82 = *(_DWORD *)&v54[4 * (BYTE2(v73) ^ 0x18)] ^ (*(_DWORD *)&v53[4 * ((v75 ^ 0xF5CC2240) >> 24)] + 602030314) ^ v25 ^ *(_DWORD *)&v57[4 * (v77 ^ 0x36)] ^ (16 * v25) & 0x7641B170 ^ ((BYTE2(v73) ^ 0xB9) - 709379826 - ((2 * (HIWORD(v73) ^ 0x61B9)) & 0x1C));
  LODWORD(v44) = *(_DWORD *)&v54[4 * (((v75 ^ 0xF5CC2240) >> 16) ^ 0xA1)] ^ (((v75 ^ 0xF5CC2240) >> 16)
                                                                                            - 709379826
                                                                                            - (((v75 ^ 0xF5CC2240) >> 15) & 0x1C)) ^ (*(_DWORD *)&v53[4 * (HIBYTE(v77) ^ 0xD)] + 602030314);
  v83 = (((v80 ^ 0xFFFFFFEE) + (v80 ^ 0x89) + 1) ^ 0xFFFFFFF0)
      + (v80 ^ 0x89);
  v77 >>= 16;
  LODWORD(v46) = *(_DWORD *)(v56 + 4 * (BYTE1(v75) ^ 0x5Bu)) ^ 0x212EF727;
  v84 = (*(_DWORD *)&v53[4 * (HIBYTE(v80) ^ 0x14)] + 602030314) ^ ((v77 ^ 0x64)
                                                                 - 709379826
                                                                 - 2
                                                                 * ((v77 ^ 0x64) & 0x1F ^ v77 & 0x11)) ^ v46 ^ *(_DWORD *)&v54[4 * (v77 ^ 0xC5)] ^ (16 * v46) & 0x7641B170;
  v85 = *(_DWORD *)(v56 + 4 * (BYTE1(v73) ^ 0xFAu)) ^ 0x212EF727;
  v86 = *(_DWORD *)&v57[4 * v83] ^ v85 ^ (16 * v85) & 0x7641B170 ^ 0x15B08C04 ^ (v44
                                                                               - 930847024
                                                                               - ((2 * v44) & 0x9108CDA0));
  v87 = (v84 - 930847024 - ((2 * v84) & 0x9108CDA0)) ^ *(_DWORD *)&v57[4 * (v73 ^ 0x23)];
  v88 = v86 - ((2 * v86) & 0x66CECA44) - 745768838 + (~(2 * (v86 - ((2 * v86) & 0x66CECA44) + 862414114)) | 0xBFB5D951);
  v89 = *(_DWORD *)(v56
                  + 4
                  * (((unsigned __int16)(v86
                                                        - ((2 * v86) & 0xCA44)
                                                        + 30842
                                                        + (~(2 * (v86 - ((2 * v86) & 0xCA44) + 25890)) | 0xD951)) >> 8) ^ 0x6Au)) ^ 0x212EF727;
  v90 = (*(_DWORD *)&v53[4 * (HIBYTE(v81) ^ 0x87)] + 602030314) ^ *(_DWORD *)&v54[4 * (BYTE2(v87) ^ 0xD0)] ^ v89 ^ ((BYTE2(v87) ^ 0x71) - 709379826 - ((v87 >> 15) & 0x1C)) ^ (16 * v89) & 0x7641B170;
  v91 = (v90 - 930847024 - ((2 * v90) & 0x9108CDA0)) ^ *(_DWORD *)&v57[4 * (v82 ^ 0x73)];
  LODWORD(v46) = *(_DWORD *)(v56 + 4 * ((BYTE1(v87) ^ 0xFA) - ((2 * ((v87 >> 8) ^ 0x4971FA)) & 0xF2) + 121));
  v92 = *(_DWORD *)&v54[4 * (BYTE2(v81) ^ 0xFD)] ^ ((BYTE2(v81) ^ 0x5C)
                                                  - 709379826
                                                  - ((2 * (HIWORD(v81) ^ 0x875C)) & 0x1C)) ^ (*(_DWORD *)&v53[4 * ((v82 ^ 0xC6236EEB) >> 24)]
                                                                                            + 602030314);
  LODWORD(v21) = (((v82 ^ 0xC6236EEB) >> 16) - (((v82 ^ 0xC6236EEB) >> 15) & 0x7E) - 65);
  LODWORD(v44) = ((2 * (((v82 ^ 0xC6236EEB) >> 16) - (((v82 ^ 0xC6236EEB) >> 15) & 0x137E) - 55572033)) | 0xFFFFFFEF)
               + (v21 ^ 0xBF);
  v93 = *(_DWORD *)&v57[4 * (v88 ^ 0xCF)] ^ v46 ^ ((v92 ^ 0x12413070 ^ (16 * v46) & 0x7641B170)
                                                                  - 930847024
                                                                  - 2
                                                                  * ((v92 ^ 0x12413070 ^ (16 * v46) & 0x7641B170) & 0x488466D3 ^ v92 & 3));
  v94 = *(_DWORD *)(v56 + 4 * (BYTE1(v81) ^ 0xA0u));
  LODWORD(v44) = (*(_DWORD *)&v53[4 * (HIBYTE(v88) ^ 0xC7)] + 602030314) ^ *(_DWORD *)&v54[4
                                                                                         * (v21 ^ 0x1E)] ^ (v44 - 110810345 - ((2 * v44 + 1197138962) & 0xAB6F721C)) ^ (16 * v94) & 0x7641B170 ^ 0x54408170;
  LODWORD(v44) = *(_DWORD *)&v57[4 * (v87 ^ 0x80)] ^ v94 ^ (v44 - ((2 * v44) & 0x4B9FD8BE) - 1513100193);
  v95 = (v44 ^ 0x3C7932A4) + 49439151 - 2 * ((v44 ^ 0x3C7932A4) & 0x2F261BF ^ v44 & 0x10);
  LODWORD(v21) = *(_DWORD *)(v56 + 4 * (BYTE1(v82) ^ 0x17u));
  v96 = *(_DWORD *)&v54[4 * (BYTE2(v88) ^ 0x84)] ^ ((BYTE2(v88) ^ 0x25)
                                                  - 709379826
                                                  - ((2 * (HIWORD(v88) ^ 0xA025)) & 0x1C)) ^ (*(_DWORD *)&v53[4 * (HIBYTE(v87) ^ 0x49)]
                                                                                            + 602030314) ^ v21 ^ 0x212EF727 ^ (16 * (v21 ^ 0x212EF727)) & 0x7641B170;
  v97 = (v96 - 930847024 - ((2 * v96) & 0x9108CDA0)) ^ *(_DWORD *)&v57[4 * (v81 ^ 0x10)];
  v98 = (v93 ^ 0x57840A7B) - ((2 * (v93 ^ 0x57840A7B) + 889058730) & 0x24514E9A) + 749183522;
  if ((v93 ^ 0x57840A7B) >= 0xE581052B)
  {
    v99 = 102;
  }
  else
  {
    v98 = v93 ^ 0x45ACAD36;
    v99 = 77;
  }
  if (v98 == 304654157)
    v100 = v99;
  else
    v100 = v93 ^ 0x36;
  v101 = *(_DWORD *)(v56 + 4 * (BYTE1(v95) ^ 0x59u)) ^ 0x212EF727;
  v102 = (*(_DWORD *)&v53[4 * (HIBYTE(v91) ^ 0x62)] + 602030314) ^ *(_DWORD *)&v54[4 * (BYTE2(v97) ^ 0x56)] ^ v101 ^ ((BYTE2(v97) ^ 0x23AD72FF) - 709379826 + ((2 * (BYTE2(v97) ^ 0x23AD72FF)) & 0x1C ^ 0xFCB59FFF) + 1) ^ (16 * v101) & 0x7641B170;
  v103 = (v102 - 930847024 - ((2 * v102) & 0x9108CDA0)) ^ *(_DWORD *)&v57[4 * (v100 ^ 0xD5)];
  v104 = *(_DWORD *)&v53[4 * (HIBYTE(v93) ^ 0x30)];
  v105 = *(_DWORD *)(v56 + 4 * (BYTE1(v97) ^ 0x46u)) ^ 0x212EF727;
  v106 = *(_DWORD *)&v54[4 * (BYTE2(v91) ^ 0xF6)] ^ BYTE2(v91) ^ v105 ^ (16 * v105) & 0x7641B170 ^ (v104
                                                                                                  - 107349512
                                                                                                  - ((2 * v104 + 1204060628) & 0xAB6F721C)) ^ 0x57;
  v107 = v95 ^ 0xA76320C1;
  v108 = *(_DWORD *)&v57[4 * (v95 ^ 0xC1)];
  v109 = *(_DWORD *)&v53[4 * (HIBYTE(v95) ^ 0xC0)];
  v110 = (v106 - 930847024 - ((2 * v106) & 0x9108CDA0)) ^ v108;
  v111 = *(_DWORD *)(v56 + 4 * (BYTE1(v91) ^ 0x3Eu)) ^ 0x212EF727;
  v112 = *(_DWORD *)&v54[4 * (BYTE2(v93) ^ 0x25)] ^ ((BYTE2(v93) ^ 0x84)
                                                   - 709379826
                                                   - 2 * ((BYTE2(v93) ^ 0x84) & 0xF ^ HIWORD(v93) & 1)) ^ v111 ^ (16 * v111) & 0x7641B170 ^ (((2 * v109 + 568637916) & 0x25DFC7F8) + ((v109 - 1863164690) ^ 0x92EFE3FC));
  v113 = (v112 - 930847024 - ((2 * v112) & 0x9108CDA0)) ^ *(_DWORD *)&v57[4 * (v97 ^ 0x49)];
  v114 = *(_DWORD *)(v56 + 4 * (BYTE1(v93) ^ 0x73u)) ^ 0x212EF727;
  v115 = (BYTE2(v107) - 709379826 - ((v107 >> 15) & 0x1C)) ^ (*(_DWORD *)&v53[4 * (HIBYTE(v97) ^ 0x90)] + 602030314) ^ v114 ^ (16 * v114) & 0x7641B170 ^ *(_DWORD *)&v54[4 * (BYTE2(v107) ^ 0xA1)];
  v116 = (v115 - 930847024 - ((2 * v115) & 0x9108CDA0)) ^ *(_DWORD *)&v57[4 * (v91 ^ 0x8F)];
  v117 = *(_DWORD *)(v56 + 4 * (BYTE1(v113) ^ 0x65u));
  v118 = (*(_DWORD *)&v53[4 * (HIBYTE(v103) ^ 0x78)] + 602030314) ^ *(_DWORD *)&v54[4 * (BYTE2(v116) ^ 0x26)] ^ ((BYTE2(v116) ^ 0x87) - 709379826 - ((2 * (HIWORD(v116) ^ 0xB887)) & 0x1C));
  v119 = *(_DWORD *)&v57[4 * (v110 ^ 0x3C)] ^ v117 ^ (((16 * v117) & 0x7641B170 ^ v118 ^ 0x12413070)
                                                                     - 930847024
                                                                     - 2
                                                                     * (((16 * v117) & 0x7641B170 ^ v118 ^ 0x12413070) & 0x488466DF ^ v118 & 0xF));
  v120 = (*(_DWORD *)&v53[4 * (HIBYTE(v110) ^ 0xEB)] + 602030314) ^ 0x23AD7208 ^ ((BYTE2(v103) ^ 0x5E)
                                                                                - 709379826
                                                                                - ((2 * (HIWORD(v103) ^ 0x785E)) & 0x1C)) ^ *(_DWORD *)&v54[4 * (BYTE2(v103) ^ 0xFF)];
  v121 = *(_DWORD *)(v56 + 4 * (BYTE1(v116) ^ 0xA7u)) ^ 0x212EF727;
  v122 = v121 ^ *(_DWORD *)&v57[4 * (v113 ^ 0xD9)] ^ v120 & 0xA2E47831 ^ ((v120 & 0x5D1B87CE ^ (16 * v121) & 0x7641B170)
                                                                                         - 930847024
                                                                                         - ((2
                                                                                           * (v120 & 0x5D1B87CE ^ (16 * v121) & 0x7641B170)) & 0x90004DA0));
  v123 = *(_DWORD *)&v53[4 * (HIBYTE(v113) ^ 0x5E)];
  v124 = *(_DWORD *)&v54[4 * (BYTE2(v110) ^ 0xD)] ^ ((BYTE2(v110) ^ 0xAC)
                                                   - 709379826
                                                   - ((2 * (HIWORD(v110) ^ 0xEBAC)) & 0x1C)) ^ (((2 * v123 + 568637916) & 0x25DFC7F8)
                                                                                              + ((v123 - 1863164690) ^ 0x92EFE3FC));
  v125 = *(_DWORD *)(v56 + 4 * (BYTE1(v103) ^ 0x4Du)) ^ 0x212EF727;
  v126 = v125 ^ *(_DWORD *)&v57[4 * (v116 ^ 0x54)] ^ (16 * v125) & 0x7641B170 ^ (v124
                                                                                                - 930847024
                                                                                                - ((2 * v124) & 0x9108CDA0));
  v127 = *(_DWORD *)&v53[4 * (HIBYTE(v116) ^ 0xDF)];
  v128 = BYTE2(v113) ^ *(_DWORD *)&v54[4 * (BYTE2(v113) ^ 0x7B)] ^ (v127
                                                                  - 107349512
                                                                  - ((2 * v127 + 1204060628) & 0xAB6F721C));
  v129 = *(_DWORD *)(v56 + 4 * (BYTE1(v110) ^ 0xEFu));
  v130 = *(_DWORD *)&v57[4 * (v103 ^ 0x50)] ^ v129 ^ (((16 * v129) & 0x7641B170 ^ 0x12413070 ^ v128 ^ 0xDA)
                                                                     - 930847024
                                                                     - 2
                                                                     * (((16 * v129) & 0x7641B170 ^ 0x12413070 ^ v128 ^ 0xDA) & 0x488466D3 ^ (v128 ^ 0xDA) & 3));
  v131 = *(_DWORD *)(v56 + 4 * (BYTE1(v126) ^ 0xDFu)) ^ 0x212EF727;
  v132 = (*(_DWORD *)&v53[4 * (HIBYTE(v119) ^ 0x9D)] + 602030314) ^ *(_DWORD *)&v57[4 * (v122 ^ 0x1B)] ^ *(_DWORD *)&v54[4 * (((v130 ^ 0x5F226045) >> 16) ^ 0xA1)] ^ v131 ^ (16 * v131) & 0x7641B170 ^ (((v130 ^ 0x5F226045) >> 16) - 709379826 - (((v130 ^ 0x5F226045) >> 15) & 0x1C));
  v133 = *(_DWORD *)(v56 + 4 * ((unsigned __int16)(v130 ^ 0x6045) >> 8));
  v134 = (*(_DWORD *)&v53[4 * (HIBYTE(v122) ^ 0xB)] + 602030314) ^ ((BYTE2(v119) ^ 0x65)
                                                                  - 709379826
                                                                  - ((2 * (HIWORD(v119) ^ 0xFA65)) & 0x1C)) ^ *(_DWORD *)&v54[4 * (BYTE2(v119) ^ 0xC4)];
  v135 = *(_DWORD *)&v57[4 * (v126 ^ 0x92)] ^ v133 ^ (((16 * v133) & 0x7641B170 ^ 0x12413070 ^ v134)
                                                                     - 930847024
                                                                     - 2
                                                                     * (((16 * v133) & 0x7641B170 ^ 0x12413070 ^ v134) & 0x488466D1 ^ v134 & 1));
  v136 = *(_DWORD *)&v54[4 * (BYTE2(v122) ^ 2)] ^ ((BYTE2(v122) ^ 0xA3)
                                                 - 709379826
                                                 - ((2 * (HIWORD(v122) ^ 0xBA3)) & 0x1C)) ^ (*(_DWORD *)&v53[4 * (HIBYTE(v126) ^ 0x2D)]
                                                                                           + 602030314);
  v137 = *(_DWORD *)(v56 + 4 * (BYTE1(v119) ^ 0x5Eu)) ^ 0x212EF727;
  v138 = v137 ^ *(_DWORD *)&v57[4 * (v130 ^ 0xDD)] ^ (((16 * v137) & 0x7641B170 ^ v136)
                                                                     - 930847024
                                                                     - 2
                                                                     * (((16 * v137) & 0x7641B170 ^ v136) & 0x488466D9 ^ v136 & 9));
  v139 = *(_DWORD *)(v56 + 4 * (BYTE1(v122) ^ 0xF7u)) ^ 0x212EF727;
  v140 = *(_DWORD *)&v54[4 * (BYTE2(v126) ^ 0x86)] ^ ((BYTE2(v126) ^ 0x27)
                                                    - 709379826
                                                    - 2 * ((BYTE2(v126) ^ 0x27) & 0x1E ^ HIWORD(v126) & 0x10)) ^ (*(_DWORD *)&v53[4 * (HIBYTE(v130) ^ 0x38)] + 602030314) ^ *(_DWORD *)&v57[4 * (v119 ^ 0xF7)] ^ v139 ^ (16 * v139) & 0x7641B170;
  v141 = ((v140 >> 15) | 0xFFFFFFEF) + (BYTE2(v140) ^ 0xFE);
  v142 = *(_DWORD *)(v56 + 4 * (BYTE1(v138) ^ 0xFu)) ^ 0x212EF727;
  v143 = (*(_DWORD *)&v53[4 * (HIBYTE(v132) ^ 0x5C)] + 602030314) ^ *(_DWORD *)&v54[4 * (BYTE2(v140) ^ 0x5F)] ^ v142 ^ *(_DWORD *)&v57[4 * (v135 ^ 0xB) + 612 + 4 * ((2 * v135) & 0x130 ^ 0xFFFFFFEF)] ^ (16 * v142) & 0x7641B170 ^ (v141 - 110810345 - ((2 * v141 + 1197138962) & 0xAB6F721C));
  v144 = *(_DWORD *)&v53[4 * (HIBYTE(v135) ^ 0x2D)];
  v145 = *(_DWORD *)(v56 + 4 * (BYTE1(v140) ^ 0x7Bu)) ^ 0x212EF727;
  v146 = *(_DWORD *)&v54[4 * (((v132 ^ 0x3BF49286) >> 16) ^ 0xA1)] ^ ((v132 ^ 0x3BF49286) >> 16) ^ v145 ^ (16 * v145) & 0x7641B170 ^ (v144 - 107349512 - ((2 * v144 + 1204060628) & 0xAB6F721C));
  v147 = (v146 - 930847024 - ((2 * v146) & 0x9108CDA0)) ^ *(_DWORD *)&v57[4 * (v138 ^ 0x6E)
                                                                        + 612
                                                                        + 4 * ((2 * v138) & 0x130 ^ 0xFFFFFFEF)];
  v148 = *(_DWORD *)&v54[4 * (BYTE2(v135) ^ 0x9B)];
  v149 = *(_DWORD *)(v56 + 4 * ((unsigned __int16)(v132 ^ 0x9286) >> 8));
  v150 = ((v148 ^ 0xD5B7B90E) + (BYTE2(v135) ^ 0x23AD7232) - 2 * ((v148 ^ 0x1A5300E) & (BYTE2(v135) ^ 0x23AD7232))) ^ (*(_DWORD *)&v53[4 * (HIBYTE(v138) ^ 0x9D)] + 602030314);
  v151 = *(_DWORD *)&v57[4 * (v140 ^ 0xCF)] ^ v149 ^ (((16 * v149) & 0x7641B170 ^ 0x12413070 ^ v150)
                                                                     - 930847024
                                                                     - 2
                                                                     * (((16 * v149) & 0x7641B170 ^ 0x12413070 ^ v150) & 0x488466DD ^ v150 & 0xD));
  v152 = *(_DWORD *)&v54[4 * (BYTE2(v138) ^ 0xD9)] ^ ((BYTE2(v138) ^ 0x78)
                                                    - 709379826
                                                    - ((2 * (HIWORD(v138) ^ 0xFA78)) & 0x1C)) ^ (*(_DWORD *)&v53[4 * (HIBYTE(v140) ^ 0x64)]
                                                                                               + 602030314);
  v153 = *(_DWORD *)(v56 + 4 * (BYTE1(v135) ^ 0x8Eu)) ^ 0x212EF727;
  v154 = *(_DWORD *)&v57[4 * (v132 ^ 0x1E)] ^ 0x23AD7208 ^ v153 ^ (((16 * v153) & 0x7641B170 ^ v152)
                                                                                  - 930847024
                                                                                  - 2
                                                                                  * (((16 * v153) & 0x7641B170 ^ v152) & 0x488466DA ^ v152 & 0xA));
  v155 = v154
       - ((2 * v154) & 0xDBFC981C)
       - 302101490
       - ((2 * (v154 - ((2 * v154) & 0xDBFC981C) - 302101490)) & 0xEA6299D2)
       - 181318423;
  v156 = *(_DWORD *)(v56 + 4 * (BYTE1(v151) ^ 0xA6u));
  v157 = (*(_DWORD *)&v53[4 * ((v143 ^ 0x2C5C083F) >> 24)] + 602030314) ^ *(_DWORD *)&v57[4
                                                                                        * (v147 ^ 0xD)] ^ *(_DWORD *)&v54[4 * (BYTE2(v155) ^ 0x90)] ^ (((16 * v156) & 0x7641B170 ^ 0x12413070) + (v156 ^ 0x212EF727) - 2 * (((16 * v156) & 0x7641B170 ^ 0x12413070) & (v156 ^ 0x212EF727))) ^ ((BYTE2(v155) ^ 0x31) - 709379826 - ((v155 >> 15) & 0x1C));
  v158 = *(_DWORD *)&v54[4 * (((v143 ^ 0x2C5C083F) >> 16) ^ 0xA1)] ^ (((v143 ^ 0x2C5C083F) >> 16)
                                                                                     - 709379826
                                                                                     - (((v143 ^ 0x2C5C083F) >> 15) & 0x1C)) ^ (*(_DWORD *)&v53[4 * HIBYTE(v147)] + 602030314);
  v159 = *(_DWORD *)(v56 + 4 * (BYTE1(v155) ^ 0x35u));
  v160 = *(_DWORD *)&v57[4 * (v151 ^ 0x1A)] ^ v159 ^ (((16 * v159) & 0x7641B170 ^ v158 ^ 0x12413070)
                                                                     - 930847024
                                                                     - 2
                                                                     * (((16 * v159) & 0x7641B170 ^ v158 ^ 0x12413070) & 0x488466D4 ^ v158 & 4));
  v161 = HIWORD(v151) ^ 0xBBE;
  v162 = (BYTE2(v151) ^ 0xBEu) % 0x17;
  v163 = *(_DWORD *)(v56 + 4 * (BYTE1(v143) ^ 0x71u)) ^ 0x212EF727;
  v164 = *(_DWORD *)&v54[4 * (BYTE2(v147) ^ 0x94)] ^ ((BYTE2(v147) ^ 0x35)
                                                    - 709379826
                                                    - ((2 * (HIWORD(v147) ^ 0x35)) & 0x1C)) ^ (*(_DWORD *)&v53[4 * (HIBYTE(v151) ^ 0xB)]
                                                                                             + 602030314) ^ v163 ^ (16 * v163) & 0x7641B170;
  v165 = *(_DWORD *)&v53[4 * (HIBYTE(v155) ^ 0x92)];
  v166 = (v162 ^ 0xEF) + 2 * (v162 & 0xF) + 17;
  if (v162)
    v166 = 0;
  v167 = (v161 - v166);
  v168 = *(_DWORD *)&v54[4 * (v167 ^ 0xA1)];
  v169 = (v164 - 930847024 - ((2 * v164) & 0x9108CDA0)) ^ *(_DWORD *)&v57[4 * (v155 ^ 0x71)];
  LODWORD(v171) = __ROR4__(*(_DWORD *)(v56 + 4 * (BYTE1(v147) ^ 0xD8u)) ^ 0x461F9EE3, 4) ^ 0xA3049BED;
  HIDWORD(v171) = v171;
  v170 = v171 >> 28;
  v172 = v170 ^ 0x5778D71E;
  v173 = (v165 - 107349512 - 2 * ((v165 + 602030314) & 0x55B7B90F ^ v165 & 1)) ^ v167 ^ v168 ^ (16
                                                                                              * ((v170 ^ 0x5778D71E | 0x7641B17) ^ v170));
  v174 = v172 ^ *(_DWORD *)&v57[4 * (v143 ^ 0xA7)] ^ (v173 - 930847024 - ((2 * v173) & 0x9108CDA0));
  v175 = (uint64_t)*(&off_24DCDB210 + (HIDWORD(v229) ^ 0x107));
  v176 = (char *)*(&off_24DCDB210 + HIDWORD(v229) + 209) - 4;
  v177 = *(_DWORD *)&v176[4 * (BYTE2(v157) ^ 0xC5)] ^ 0x3E9EFF01;
  v178 = *(_BYTE **)(v20 - 120);
  v179 = (((4 * v177) | 0x31AD79BC) - 2104122624 - ((8 * v177) & 0x8840800)) ^ *(_DWORD *)(v175
                                                                                         + 4 * (HIBYTE(v160) ^ 5));
  v180 = v179 + 1223518882 - ((2 * v179) & 0x91DAD544);
  v181 = *(_DWORD *)(v175 + 4 * (HIBYTE(v157) ^ 0xD9));
  v182 = v169;
  v183 = *(_DWORD *)(v175 + 4 * (HIBYTE(v169) ^ 0xEA));
  v184 = (v182 ^ 0x7B) - 99781164 - ((2 * (v182 ^ 0x7B)) & 0x1A8);
  LODWORD(v229) = *(_DWORD *)(v175 + 4 * (HIBYTE(v174) ^ 0x42));
  v185 = *(_DWORD *)&v176[4 * (BYTE2(v174) ^ 0xBE)];
  v186 = *(_DWORD *)&v176[4 * (BYTE2(v160) ^ 0x72)];
  v187 = *(_DWORD *)&v176[4 * (BYTE2(v169) ^ 0x14)];
  v188 = (char *)*(&off_24DCDB210 + HIDWORD(v229) + 18) - 8;
  v189 = *(_DWORD *)&v188[4 * (BYTE1(v169) ^ 0x77)];
  v190 = *(_DWORD *)&v188[4 * (BYTE1(v174) ^ 0x28)];
  v191 = *(_DWORD *)&v188[4 * (BYTE1(v157) ^ 0x83)];
  v192 = *(_DWORD *)&v188[4 * (BYTE1(v160) ^ 0xC6)];
  if ((((v157 >> 23) & 0xDE ^ 0x8A) + (HIBYTE(v157) ^ 0x2A)) | HIBYTE(v157) ^ 0xC5)
    v193 = v160 ^ 0x48ED6AB4;
  else
    v193 = v189;
  v194 = (char *)*(&off_24DCDB210 + HIDWORD(v229) + 44) - 12;
  v195 = *(_DWORD *)&v194[4 * (v193 ^ 0x48ED6AEF)];
  v196 = *(_DWORD *)&v194[4 * (v182 ^ 0x36)];
  v197 = v174;
  v198 = *(_DWORD *)&v194[4 * (v174 ^ 0x35)];
  LODWORD(v194) = *(_DWORD *)&v194[4 * (v157 ^ 0x95)];
  v199 = v184 ^ *(_DWORD *)(v20 - 148) ^ v177 ^ v196 ^ v180 ^ v190;
  v200 = (char *)*(&off_24DCDB210 + (HIDWORD(v229) ^ 0x56)) - 4;
  v178[*(_QWORD *)(v20 - 208)] = v200[BYTE1(v199) ^ 0x62] ^ 0x9E;
  v201 = (((4 * (v185 ^ 0x3E9EFF01)) | 0x31AD79BC) - 2104122624 - ((8 * (v185 ^ 0x3E9EFF01)) & 0x8840800)) ^ v181;
  v202 = (v201 - 99781164 - ((2 * v201) & 0xF41AEBA8)) ^ v195;
  v203 = v185 ^ 0x3E9EFF01 ^ *(_DWORD *)(v20 - 144) ^ (v202 - 2074599085 - ((2 * v202) & 0x8B042A6));
  v204 = v193 ^ v189 ^ (v203 + 1223518882 - ((2 * v203) & 0x91DAD544));
  v178[2] = v200[BYTE1(v204) ^ 0x1FLL] ^ 0x32;
  v205 = (((4 * (v186 ^ 0x3E9EFF01)) | 0x31AD79BC) - 2047974143 + ((8 * (v186 ^ 0x3E9EFF01)) & 0x8840800 ^ 0xFCA73DFF)) ^ v183;
  v206 = (v205 + 1223518882 - ((2 * v205) & 0x91DAD544)) ^ v191;
  v207 = v197 ^ v198 ^ (v206 - 99781164 - ((2 * v206) & 0xF41AEBA8)) ^ 0x78;
  v208 = *(_DWORD *)(v20 - 140) ^ v186 ^ 0x3E9EFF01 ^ 0xD586406F ^ (v207 - 1342331136 - ((2 * v207) & 0x5FFB4F32) + 153);
  v209 = (char *)*(&off_24DCDB210 + (HIDWORD(v229) ^ 0xFB)) - 12;
  v178[11] = (36 - 117 * v209[v208 ^ 0x3CLL]) ^ 0x58;
  v210 = v187 ^ 0x3E9EFF01;
  v211 = (((4 * (v187 ^ 0x3E9EFF01)) | 0x31AD79BC) - 2104122624 - ((8 * (v187 ^ 0x3E9EFF01)) & 0x8840800)) ^ v229;
  v212 = v194 ^ ((v157 ^ 0xD8)
                             - 99781164
                             - 2 * ((v157 ^ 0xD8) & 0xF4 ^ v157 & 0x20));
  v213 = v192 ^ *(_DWORD *)(v20 - 136) ^ v210 ^ (v212 + 519630482 - ((2 * v212) & 0x3DF1DD24)) ^ (v211
                                                                                                + 1223518882
                                                                                                - ((2 * v211) & 0x91DAD544));
  v178[14] = v200[BYTE1(v213) ^ 0xFLL] ^ 0x5F;
  v214 = (uint64_t)*(&off_24DCDB210 + (HIDWORD(v229) ^ 0x16));
  v178[1] = (*(_BYTE *)(v214 + (BYTE2(v204) ^ 0xD6)) - 98) ^ 0x28;
  v178[*(_QWORD *)(v20 - 200)] = (36 - 117 * v209[v213 ^ 0xB6]) ^ 0x9B;
  v215 = (char *)*(&off_24DCDB210 + HIDWORD(v229) + 99) - 8;
  v178[*(_QWORD *)(v20 - 168)] = (HIBYTE(v213) + (~(v213 >> 23) | 0x5D) - 46) ^ v215[HIBYTE(v213) ^ 0xCBLL] ^ 0x66;
  v178[*(_QWORD *)(v20 - 176)] = (*(_BYTE *)(v214 + (BYTE2(v213) ^ 0x2DLL)) - 98) ^ 0xCD;
  v178[8] = v215[(((HIBYTE(v208) ^ 0xFFFFFF7C) + (HIBYTE(v208) ^ 0xE0) + 1) ^ 0xFFFFFFFE) + (HIBYTE(v208) ^ 0xE0)] ^ ((HIBYTE(v208) ^ 0xE0) + ~(2 * ((HIBYTE(v208) ^ 0xE0) & 0x57 ^ HIBYTE(v208) & 6)) - 46) ^ 0x5A;
  v216 = v209[v204 ^ 0x3FLL];
  v217 = (((22 * v216) | ((36 - 117 * v216) >> 7) & 1) + 72) ^ 0xFFFFFFCB;
  v178[*(_QWORD *)(v20 - 192)] = ((v217 >> 1) | ((_BYTE)v217 << 7)) ^ 0x73;
  v178[7] = (36 - 117 * v209[v199 ^ 0x97]) ^ 0x37;
  v178[10] = v200[BYTE1(v208) ^ 0x41] ^ 0xC7;
  v178[9] = (*(_BYTE *)(v214 + (BYTE2(v208) ^ 0xC1)) - 98) ^ 0xF2;
  v178[5] = (*(_BYTE *)(v214 + (BYTE2(v199) ^ 0xF0)) - 98) ^ 0xB9;
  v218 = *(_QWORD *)(v20 - 184);
  v178[v218] = ((HIBYTE(v204) ^ 0x48) + ~(2 * ((HIBYTE(v204) ^ 0x48) & 0x55 ^ HIBYTE(v204) & 4)) - 46) ^ v215[HIBYTE(v204) ^ 0xF6] ^ 0x18;
  v178[*(_QWORD *)(v20 - 160)] = ((BYTE3(v199) ^ 0xEF) - ((2 * (BYTE3(v199) ^ 0xEF)) & 0xA2) - 47) ^ 0x5F ^ v215[BYTE3(v199) ^ 0xCBLL];
  return ((uint64_t (*)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a18 + 8 * ((227 * ((((_DWORD)v218 + 1501899334 - 2 * (((_DWORD)v218 + 16) & 0x59852A3F)) ^ 0x59852A36u) < HIDWORD(a12))) ^ HIDWORD(v229))) - 8))(0xFFFFFFFFLL, v209, 36, v199, 4294967179, 203, 22, HIDWORD(v229), a9, a10, a11, a12, v26, v220, v221, v222, a17, a18, a19,
           v223,
           v224,
           v225,
           v226,
           v227,
           v228,
           v229,
           1,
           9);
}

void sub_21A588720(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21,unsigned __int8 a22,int a23,int a24,int a25,int a26,int a27,int a28,int a29,char a30)
{
  uint64_t v30;
  int v31;

  v31 = (a26 << 24) + (*(_DWORD *)(v30 - 128) | ((a27 ^ 0xD1) << 8)) + a21;
  *(_DWORD *)(v30 - 140) = ((a22 | ((a23 ^ 0xA0) << 8)) + a20) ^ 0x7AC88155;
  *(_DWORD *)(v30 - 136) = (a28 | a29 | ((a24 ^ 0x54) << (((a30 ^ 0xD4) + 120) ^ 0x3C))) ^ 0xA5F7F573;
  *(_DWORD *)(v30 - 148) = a25 ^ 0x99AE42D2;
  *(_DWORD *)(v30 - 144) = v31 ^ 0x40653FBC;
  JUMPOUT(0x21A5864CCLL);
}

uint64_t sub_21A5887DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21)
{
  uint64_t v21;
  int v22;

  v22 = a13 - ((a21 + 653260649) & (2 * a11)) + 1622110845;
  return ((uint64_t (*)(void))(*(_QWORD *)(v21
                                        + 8
                                        * ((1890
                                          * (((2 * v22) & 0xFE3F5BD6 ^ 0x262F5AC0) + (v22 ^ 0xEC68509F) - 2013822978 != 118959593)) ^ a21))
                            - 8))();
}

uint64_t sub_21A5888A0@<X0>(int a1@<W0>, int a2@<W8>)
{
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((a1 + v2 + ((a2 - 854941571) ^ 0xCD0AA3C1) - 2132782572 - 60 > 7)
                                          * (((a2 - 854941571) & 0x32F55FBF) - 842)) ^ (a2 - 583)))
                            - 12))();
}

uint64_t sub_21A588930(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  uint64_t v7;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v7
                                                      + 8
                                                      * (int)((((a6 ^ 0x474) + ((a6 + 1995686847) & 0x890C3FBF) - 1982)
                                                             * ((a2 + a7 - 16) > 0xFFFFFFEF)) ^ a6))
                                          - 4))(a1);
}

uint64_t sub_21A588980(int a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _BOOL4 v23;
  int v25;

  v9 = (a1 + v6 + a2);
  v10 = *(_QWORD *)(v7 - 120);
  v11 = v10 + (((a3 - 881) | 0x101) ^ (a3 - 894323852) & 0x354E4BFEu ^ 0x264) + v9;
  v12 = ((_BYTE)a1 + (_BYTE)v6 + (_BYTE)a2) & 0xF;
  v13 = v12 - v9;
  v14 = v3 + v12 - v9;
  v15 = v12 + 1;
  v16 = v3 + v12 + 1;
  v17 = v12 + v4;
  v18 = v17 - v9 + 2;
  v19 = v17 + 3;
  v20 = v5 + v13;
  v21 = v5 + v15;
  v23 = v16 > v10 && v14 < v11;
  v25 = v19 > v10 && v18 < v11 || v23;
  if (v21 > v10 && v20 < v11)
    v25 = 1;
  return (*(uint64_t (**)(void))(v8 + 8 * ((206 * (v25 ^ 1)) ^ a3)))();
}

uint64_t sub_21A588A30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v7;
  uint64_t v8;

  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v8 + 8 * (a7 ^ (53 * (v7 > 0xF))))
                                                           - ((a7 + 175) ^ 0x284)))(a1, a2, 0);
}

uint64_t sub_21A588A68(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16x4_t v20;
  int8x16x4_t v21;

  v20.val[1].i64[0] = ((_BYTE)v7 + 4) & 0xF;
  v20.val[1].i64[1] = ((_BYTE)v7 + 3) & 0xF;
  v20.val[2].i64[0] = ((_BYTE)v7 + 2) & 0xF;
  v20.val[2].i64[1] = ((_BYTE)v7 + 1) & 0xF;
  v20.val[3].i64[0] = v7 & 0xF;
  v20.val[3].i64[1] = ((_BYTE)v7 - 1) & 0xF;
  v21.val[0].i64[0] = ((_BYTE)v7 + 14) & 0xF;
  v21.val[0].i64[1] = ((_BYTE)v7 + 13) & 0xF;
  v12 = *(_QWORD *)(v10 - 120) - 15;
  v21.val[1].i64[0] = (v7 + 12) & 0xF;
  v21.val[1].i64[1] = (v7 + 11) & 0xF;
  v21.val[2].i64[0] = (v7 + 10) & 0xF;
  v21.val[2].i64[1] = ((_BYTE)v7 + 9) & 0xF;
  v21.val[3].i64[0] = ((_BYTE)v7 + 8) & 0xF;
  v21.val[3].i64[1] = ((_BYTE)v7 + 7) & 0xF;
  v13 = a1 + v9 + a2;
  v14.i64[0] = 0x6B6B6B6B6B6B6B6BLL;
  v14.i64[1] = 0x6B6B6B6B6B6B6B6BLL;
  v15.i64[0] = 0x4949494949494949;
  v15.i64[1] = 0x4949494949494949;
  v20.val[0].i64[0] = v13 & 0xF;
  v20.val[0].i64[1] = ((_BYTE)v7 + 5) & 0xF;
  v16.i64[0] = vqtbl4q_s8(v20, (int8x16_t)xmmword_21A5D5130).u64[0];
  v16.i64[1] = vqtbl4q_s8(v21, (int8x16_t)xmmword_21A5D5130).u64[0];
  v17 = vrev64q_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v12 + v13), *(int8x16_t *)(v4 + v20.val[0].i64[0] - 15)), veorq_s8(*(int8x16_t *)(v20.val[0].i64[0] + v5 - 13), *(int8x16_t *)(v6 + v20.val[0].i64[0] - 15))));
  v18 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v17, v17, 8uLL), v15), vmulq_s8(v16, v14)));
  *(int8x16_t *)(v12 + v13) = vextq_s8(v18, v18, 8uLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((((v8 & 0xFFFFFFF0) == 16) * ((a4 - 497) ^ 0x603)) ^ a4)) - 4))();
}

void sub_21A588BC8()
{
  JUMPOUT(0x21A588B40);
}

uint64_t sub_21A588BD4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * (((a8 - 68) * (v8 != a3)) ^ a8)) - (a8 ^ 0x32Bu) + 952))();
}

uint64_t sub_21A588C00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  char v8;
  uint64_t v9;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v9
                                                               + 8
                                                               * ((225 * ((((a8 + 161) ^ ((v8 & 8) == 0)) & 1) == 0)) ^ (a8 + 161)))
                                                   - ((a8 + 1142758248) & 0xBBE2E7BC ^ 0x3B0)))(a1, a2);
}

uint64_t sub_21A588C5C(int a1, int a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  int v22;
  char v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  int8x16x4_t v32;

  *(_DWORD *)(v26 - 128) = v25;
  v27 = *(_QWORD *)(v26 - 120) - 7;
  *(_DWORD *)(v26 - 140) = v22 & 0xFFFFFFF8;
  *(_DWORD *)(v26 - 136) = v22;
  v28 = -8 - a3;
  v29 = a1 + v24;
  v30 = (v29 + a2 + v28 + 8);
  v32.val[0].i64[0] = ((_BYTE)v29 + (_BYTE)a2 + (_BYTE)v28 + 8) & 0xF;
  v32.val[0].i64[1] = (v21 + (_BYTE)v28 + 8 + ((a6 - 127) ^ 8)) & 0xF;
  v32.val[1].i64[0] = (v23 + (_BYTE)v29 + 4 + (_BYTE)v28 + 8) & 0xF;
  v32.val[1].i64[1] = (v23 + (_BYTE)v29 + 3 + (_BYTE)v28 + 8) & 0xF;
  v32.val[2].i64[0] = (v23 + (_BYTE)v29 + 2 + (_BYTE)v28 + 8) & 0xF;
  v32.val[2].i64[1] = (v23 + (_BYTE)v29 + 1 + (_BYTE)v28 + 8) & 0xF;
  v32.val[3].i64[0] = (v21 + (_BYTE)v28 + 8) & 0xF;
  v32.val[3].i64[1] = (v23 + (_BYTE)v29 + 15 + (_BYTE)v28 + 8) & 0xF;
  *(int8x8_t *)(v27 + v30) = vrev64_s8(veor_s8(veor_s8(vrev64_s8(veor_s8(veor_s8(*(int8x8_t *)(v27 + v30), *(int8x8_t *)(v18 + (v30 & 0xF) - 7)), veor_s8(*(int8x8_t *)((v30 & 0xF) + v19 - 5), *(int8x8_t *)(v20 + (v30 & 0xF) - 7)))), (int8x8_t)0x4949494949494949), vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v32, (int8x16_t)xmmword_21A5D5140), (int8x8_t)0x6B6B6B6B6B6B6B6BLL)));
  return (*(uint64_t (**)(__n128))(a18 + 8 * ((11 * (-(v22 & 0xFFFFFFF8) != v28)) | (a6 + 20))))((__n128)xmmword_21A5D5140);
}

void sub_21A588DA8()
{
  JUMPOUT(0x21A588CB8);
}

uint64_t sub_21A588DB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v5
                                                                                + 8
                                                                                * (((((v3 + 451) | 0x1BC) - 786)
                                                                                  * (*(_DWORD *)(v4 - 136) == *(_DWORD *)(v4 - 140))) ^ v3))
                                                                    - 4))(a1, a2, a3, (v3 + 895));
}

uint64_t sub_21A588DE8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = (a5 - 118959594);
  *(_BYTE *)(*(_QWORD *)(v9 - 120) + v11) ^= *(_BYTE *)(v5 + (v11 & 0xF)) ^ *(_BYTE *)((v11 & 0xF) + v7 + 2) ^ *(_BYTE *)(v8 + (v11 & 0xF)) ^ (107 * (v11 & 0xF)) ^ 0x49;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((98 * (a5 - 1 == v6)) ^ (a4 - 159))) - 8))();
}

void sub_21A588E5C()
{
  int v0;
  int v1;
  uint64_t v2;

  if (v0 == 2046968480)
    v1 = 1412947868;
  else
    v1 = 1412905844;
  *(_DWORD *)(v2 + 32) = v1;
}

void sub_21A588EC0(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 4) ^ (389799931 * (((a1 | 0x4D71AF0C) - (a1 & 0x4D71AF0C)) ^ 0xAB00A1FB));
  __asm { BR              X17 }
}

uint64_t sub_21A58902C()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * (((((v0 + 21) | 0x102) + 381) * (v1 != 0xEF3E06A9)) ^ v0)))();
}

uint64_t sub_21A589074()
{
  uint64_t v0;
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;

  v11 = v6 > 0x431A6123;
  *(_BYTE *)(*(_QWORD *)(v10 - 120) + (v8 - 1363553771)) = *(_BYTE *)(v3 + ((v8 - 1363553771) & 0xFLL)) ^ *(_BYTE *)(v0 + (v8 - 1363553771)) ^ *(_BYTE *)(v1 + ((v8 - 1363553771) & 0xFLL)) ^ *(_BYTE *)(((v8 - 1363553771) & 0xFLL) + v4 + 1) ^ (((v8 + 21) & 0xF) * ((v5 + 35) & 0xF3 ^ 0xB5));
  if (v11 == v8 + 1805611250 < v2)
    v11 = v8 + 1805611250 < v7;
  return (*(uint64_t (**)(void))(v9 + 8 * ((847 * v11) ^ v5)))();
}

uint64_t sub_21A589124()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((229
                                * ((((v1 ^ 0x18C) - 595850386) ^ (2 * v0) & 0xFDFEDDE4)
                                 + (v0 ^ v1 ^ 0x11C16805)
                                 + 1802296698 == 1785482348)) ^ v1)))();
}

uint64_t sub_21A589198(int a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * (((a1 + a2 + (a5 ^ 0x2D2u) + 16814349 - 943 > 7) * (((a5 - 354) | 0x98) + 51)) ^ a5))
                            - 8))();
}

uint64_t sub_21A5891F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  int v9;
  uint64_t v10;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10
                                                                                + 8
                                                                                * (((((a8 + 202) ^ v8) - 937)
                                                                                  * ((a3 + v9 - 16) < 0xFFFFFFF0)) ^ a8)))(a1, a2, a3, a4, a4);
}

uint64_t sub_21A589220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL4 v23;

  v14 = (a6 + 803) ^ 0x735u;
  v15 = a9 + v14 - 0x19BE288A5340C267 + (a1 + a2 + a3);
  v16 = ((_BYTE)a1 + (_BYTE)a2 + (_BYTE)a3) & 0xF;
  v17 = v16 + v11 - v15;
  v18 = (v16 | v9) - v15;
  v19 = (v16 | v12) - v15;
  v23 = (unint64_t)(v10 - (a9 + v14 - 0x19BE288A5340C267) - 0x4A703F9B21FFC58ELL) > 0xF
     && v17 > 0xF
     && v18 > 0xF
     && (unint64_t)(v19 + 1) > 0xF;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13
                                                                                          + 8 * ((757 * v23) ^ a6))
                                                                              - 8))(a1, a2, a3, a4, a4);
}

uint64_t sub_21A5892C0@<X0>(int a1@<W7>, unsigned int a2@<W8>)
{
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((((a1 - 1008) | 0x248) - 717) * (a2 > 0xF)) | a1)) - 8))();
}

uint64_t sub_21A5892F4@<X0>(int a1@<W3>, int a2@<W4>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  int8x16_t v22;
  uint64_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int8x16x4_t v27;
  int8x16x4_t v28;

  v27.val[1].i64[0] = ((_BYTE)a1 + 11) & 0xF;
  v27.val[1].i64[1] = ((_BYTE)a1 + 10) & 0xF;
  v27.val[2].i64[0] = ((_BYTE)a1 + 9) & 0xF;
  v27.val[2].i64[1] = ((_BYTE)a1 + 8) & 0xF;
  v27.val[3].i64[0] = ((_BYTE)a1 + 7) & 0xF;
  v27.val[3].i64[1] = ((_BYTE)a1 + 6) & 0xF;
  v22.i64[0] = 0x6767676767676767;
  v22.i64[1] = 0x6767676767676767;
  v23 = a1 + ((a2 - 436) ^ v20);
  v27.val[0].i64[0] = ((_BYTE)a1 + ((a2 + 76) ^ v20)) & 0xF;
  v27.val[0].i64[1] = ((_BYTE)a1 + 12) & 0xF;
  v24.i64[0] = vqtbl4q_s8(v27, (int8x16_t)xmmword_21A5D5130).u64[0];
  v28.val[0].i64[1] = ((_BYTE)a1 + 4) & 0xF;
  v28.val[1].i64[1] = ((_BYTE)a1 + 2) & 0xF;
  v28.val[2].i64[1] = a1 & 0xF;
  v28.val[3].i64[1] = ((_BYTE)a1 + 14) & 0xF;
  v28.val[0].i64[0] = ((_BYTE)a1 + 5) & 0xF;
  v28.val[1].i64[0] = ((_BYTE)a1 + 3) & 0xF;
  v28.val[2].i64[0] = ((_BYTE)a1 + 1) & 0xF;
  v28.val[3].i64[0] = (a1 - 1) & 0xF;
  v24.i64[1] = vqtbl4q_s8(v28, (int8x16_t)xmmword_21A5D5130).u64[0];
  v25 = vrev64q_s8(vmulq_s8(v24, v22));
  *(int8x16_t *)(*(_QWORD *)(v21 - 120) - 15 + v23) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v18 + (v23 & 0xF) - 15), *(int8x16_t *)(v16 - 15 + v23)), veorq_s8(*(int8x16_t *)(v17 + (v23 & 0xF) - 15), *(int8x16_t *)((v23 & 0xF) + v19 - 14))), vextq_s8(v25, v25, 8uLL));
  return (*(uint64_t (**)(void))(a16 + 8 * ((507 * ((a3 & 0xFFFFFFF0) == 16)) ^ a2)))();
}

void sub_21A589448()
{
  JUMPOUT(0x21A5893D4);
}

uint64_t sub_21A589454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  int v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9
                                        + 8 * (int)(((((a7 + 169) ^ 0xFFFFFC74) + (a7 ^ 0x345)) * (v8 == v7)) | a7))
                            - 12))();
}

uint64_t sub_21A58948C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  char v9;
  uint64_t v10;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v10
                                                                                         + 8
                                                                                         * ((19
                                                                                           * ((((v9 & 8) == 0) ^ (a8 + 59)) & 1)) ^ a8))
                                                                             - (a8 + 324)
                                                                             + 940))(a1, a2, a3, a4, (a4 - v8));
}

uint64_t sub_21A5894C8@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  char v23;
  uint64_t v24;
  int v25;
  char v26;
  uint64_t v27;
  int8x16x4_t v29;

  *(_DWORD *)(v24 - 152) = a4;
  *(_QWORD *)(v24 - 128) = v17 - 7;
  *(_QWORD *)(v24 - 136) = *(_QWORD *)(v24 - 120) - 7;
  *(_DWORD *)(v24 - 160) = a4 & 0xFFFFFFF8;
  *(_DWORD *)(v24 - 144) = -(a4 & 0xFFFFFFF8);
  v25 = -8 - v19;
  v26 = a1 + a2 + v23;
  v27 = (a1 + a2 + a3 + v25 + 8);
  v29.val[0].i64[0] = ((_BYTE)a1 + (_BYTE)a2 + (_BYTE)a3 + (_BYTE)v25 + 8) & 0xF;
  v29.val[0].i64[1] = (v26 + 114 + (_BYTE)v25 + 8) & 0xF;
  v29.val[1].i64[0] = (v26 + 113 + (_BYTE)v25 + 8) & 0xF;
  v29.val[1].i64[1] = (v26 + 112 + (_BYTE)v25 + 8) & 0xF;
  v29.val[2].i64[0] = (v26 + 111 + (_BYTE)v25 + 8) & 0xF;
  v29.val[2].i64[1] = (v26 + 110 + (_BYTE)v25 + 8) & 0xF;
  v29.val[3].i64[0] = (v26 + 109 + (_BYTE)v25 + 8) & 0xF;
  v29.val[3].i64[1] = (v26 + (_BYTE)v25 + (((_BYTE)v22 - 58) & 0xFE) + 8) & 0xF;
  *(int8x8_t *)(*(_QWORD *)(v24 - 136) + v27) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v20 + (v27 & 0xF) - 7), *(int8x8_t *)(*(_QWORD *)(v24 - 128) + v27)), veor_s8(*(int8x8_t *)(v18 + (v27 & 0xF) - 7), *(int8x8_t *)((v27 & 0xF) + v21 - 6))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v29, (int8x16_t)xmmword_21A5D5140), (int8x8_t)0x6767676767676767)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a17 + 8 * ((115 * (*(_DWORD *)(v24 - 144) == v25)) ^ v22))
                                         - 12))((__n128)xmmword_21A5D5140);
}

void sub_21A589644()
{
  JUMPOUT(0x21A58954CLL);
}

uint64_t sub_21A58964C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (a3 ^ (266 * (*(_DWORD *)(v4 - 152) == *(_DWORD *)(v4 - 160)))))
                            - ((2 * ((a3 + 1080534412) & 0xBF985BB7 ^ 0x359)) ^ 0x1D6)))();
}

uint64_t sub_21A5896A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = (v12 + a5 + 297);
  *(_BYTE *)(*(_QWORD *)(v14 - 120) + v15) = *(_BYTE *)(v9 + (v15 & 0xF)) ^ *(_BYTE *)(v7 + v15) ^ *(_BYTE *)(v8 + (v15 & 0xF)) ^ *(_BYTE *)((a7 - 478) + (unint64_t)(v15 & 0xF) + v10 - 465) ^ (103 * (v15 & 0xF));
  return (*(uint64_t (**)(void))(v13 + 8 * ((366 * (a5 - 1 != v11)) ^ (a7 - 757))))();
}

uint64_t sub_21A589714(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;
  int8x16_t v20;

  v15 = vrev64q_s8(*(int8x16_t *)*(_QWORD *)(v12 + 32));
  v16 = vextq_s8(v15, v15, 8uLL);
  v17.i64[0] = 0x2323232323232323;
  v17.i64[1] = 0x2323232323232323;
  v18.i64[0] = 0xDCDCDCDCDCDCDCDCLL;
  v18.i64[1] = 0xDCDCDCDCDCDCDCDCLL;
  v19 = vaddq_s8(vorrq_s8(v16, v17), vorrq_s8(v16, v18));
  v17.i64[0] = 0xB0B0B0B0B0B0B0B0;
  v17.i64[1] = 0xB0B0B0B0B0B0B0B0;
  v20 = vrev64q_s8(veorq_s8(vaddq_s8(v19, v17), (int8x16_t)xmmword_21A5D5160));
  *(int8x16_t *)(v14 - 112) = vextq_s8(v20, v20, 8uLL);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 + 8 * (int)((755 * (((*(_QWORD *)(v14 - 120) == 0) ^ (a6 + 91)) & 1)) ^ a6)) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t sub_21A589794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  _BOOL4 v14;

  v14 = ((BYTE4(a11) + 12) & 0xF) == 0 && HIDWORD(a11) != 299893380;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 + 8 * (int)(((a6 + 511) * v14) ^ a6)) - ((a6 + 87) ^ 0x221)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t sub_21A5897DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  int v21;
  uint64_t v22;
  int v23;
  char v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  unsigned int v29;
  unsigned int v30;
  int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned __int8 *v36;
  uint64_t v37;
  int v38;
  int v39;
  uint64_t v40;
  unsigned __int8 v41;
  int v42;
  unsigned __int8 v43;
  uint64_t v44;
  unsigned int v45;
  int v46;
  int v47;
  unsigned int v48;
  unsigned int v49;
  int v50;
  unsigned int v51;
  uint64_t v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  __int16 v56;
  unint64_t v57;
  int v58;
  int v59;
  unsigned int v60;
  int v61;
  unsigned int v62;
  unsigned int v63;
  int v64;
  unsigned int v65;
  unsigned int v66;
  int v67;
  char *v68;
  int v69;
  char *v70;
  int v71;
  unint64_t v72;
  char *v73;
  int v74;
  uint64_t v75;
  int v76;
  unsigned int v77;
  unsigned int v78;
  int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  unsigned int v83;
  unsigned int v84;
  int v85;
  unsigned int v86;
  int v87;
  int v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  unsigned int v99;
  int v100;
  unsigned int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  int v105;
  unsigned int v106;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  int v110;
  int v111;
  unsigned int v112;
  int v113;
  unsigned int v114;
  int v115;
  unsigned int v116;
  int v117;
  int v118;
  int v119;
  unsigned int v120;
  unsigned int v121;
  unsigned int v122;
  int v123;
  unsigned int v124;
  unsigned int v125;
  unsigned int v126;
  int v127;
  unsigned int v128;
  unsigned int v129;
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  unsigned int v136;
  unsigned int v137;
  int v138;
  int v139;
  unsigned int v140;
  unsigned int v141;
  unsigned int v142;
  unsigned int v143;
  int v144;
  int v145;
  unsigned int v146;
  int v147;
  unsigned int v148;
  unsigned int v149;
  unsigned int v150;
  unsigned int v151;
  int v152;
  int v153;
  unsigned int v154;
  int v155;
  int v156;
  int v157;
  int v158;
  unsigned int v159;
  int v160;
  int v161;
  unsigned int v162;
  int v163;
  int v164;
  unsigned int v165;
  unsigned int v166;
  int v167;
  int v168;
  int v169;
  unsigned int v170;
  unsigned int v171;
  unsigned int v172;
  int v173;
  int v174;
  unsigned int v175;
  int v176;
  unsigned int v177;
  unsigned int v178;
  int v179;
  int v180;
  unsigned int v181;
  unsigned int v182;
  int v183;
  unsigned int v184;
  int v185;
  int v186;
  int v187;
  unsigned int v188;
  unsigned int v189;
  unsigned int v190;
  unsigned int v191;
  int v192;
  unsigned int v193;
  unsigned int v194;
  int v195;
  unsigned int v196;
  int v197;
  unsigned __int8 v198;
  unsigned int v199;
  unsigned int v200;
  int v201;
  unsigned int v202;
  unsigned int v203;
  int v204;
  int v205;
  int v206;
  int v207;
  int v208;
  unsigned int v209;
  int v210;
  int v211;
  int v212;
  int v213;
  unsigned int v214;
  int v215;
  int v216;
  unsigned int v217;
  int v218;
  unsigned int v219;
  int v220;
  unsigned int v221;
  int v222;
  int v223;
  int v224;
  unsigned int v225;
  int v226;
  unsigned int v227;
  unsigned int v228;
  int v229;
  unsigned int v230;
  unsigned int v231;
  int v232;
  int v233;
  unsigned int v234;
  unsigned int v235;
  int v236;
  int v237;
  unsigned int v238;
  int v239;
  unsigned int v240;
  int v241;
  unsigned int v242;
  int v243;
  unsigned int v244;
  unsigned int v245;
  unsigned int v246;
  __int16 v247;
  int v248;
  int v249;
  unsigned int v250;
  int v251;
  int v252;
  unsigned int v253;
  unsigned int v254;
  int v255;
  unint64_t v256;
  int v257;
  unsigned __int8 v258;
  uint64_t v259;
  unsigned int v260;
  unsigned int v261;
  unsigned int v262;
  int v263;
  uint64_t v264;
  int v265;
  int v266;
  BOOL v267;
  int v268;
  uint64_t v269;
  unsigned int v270;
  int v271;
  int v272;
  int v273;
  unsigned int v274;
  int v275;
  unint64_t v276;
  int v277;
  unsigned int v278;
  int v279;
  int v280;
  unsigned int v281;
  _BYTE *v282;
  unsigned int v283;
  int v284;
  unsigned int v285;
  unsigned int v286;
  char *v287;
  unsigned int v288;
  uint64_t v289;
  uint64_t v290;
  unsigned int v291;
  unsigned int v292;
  int v293;
  unsigned int v294;
  int v295;
  uint64_t v296;
  int v297;
  unsigned int v298;
  unsigned int v299;
  int v300;
  int v301;
  int v302;
  unsigned int v303;
  unsigned int v304;
  uint64_t v305;
  char *v306;
  unsigned int v307;
  char *v308;
  int v309;
  int v310;
  unsigned int v311;
  unsigned int v312;
  int v313;
  int v314;
  unsigned int v315;
  unsigned int v316;
  unsigned int v317;
  unsigned int v318;
  unsigned int v319;
  char *v320;
  unsigned int v321;
  unsigned int v322;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  char *v327;
  uint64_t v328;
  uint64_t v329;
  char *v330;
  uint64_t v331;
  unsigned int v332;
  uint64_t v333;
  char v334;
  __int16 v335;

  v23 = v21 ^ 0x199;
  v24 = *(_BYTE *)(v22 - 109);
  v25 = (char *)*(&off_24DCDB210 + v21 - 393) - 12;
  v26 = (uint64_t)*(&off_24DCDB210 + v21 - 325);
  v27 = (uint64_t)*(&off_24DCDB210 + v21 - 400);
  v28 = (char *)*(&off_24DCDB210 + v21 - 523) - 8;
  v29 = (*(unsigned __int8 *)(v26 + (((v21 ^ 0x99) - 113) ^ v24)) ^ 0x68) & 0xFF00FFFF | ((v25[*(unsigned __int8 *)(v22 - 112) ^ 0xBDLL] ^ 0xFFFFFFF7) << 24) | (((*(_BYTE *)(v27 + (*(unsigned __int8 *)(v22 - 111) ^ 0x85)) + 116) ^ 0x6D) << 16);
  v30 = v28[*(unsigned __int8 *)(v22 - 102) ^ 0x5ALL];
  v31 = ((v25[*(unsigned __int8 *)(v22 - 104) ^ 0x34] ^ 0x99) << (((v24 & 0x18 ^ 0x6D) - 1) ^ 0x6C) << (((v24 & 0x18 ^ 0x6D) - 1) ^ 0x74)) ^ (((*(_BYTE *)(v27 + (*(unsigned __int8 *)(v22 - 103) ^ 0xA4)) + 116) ^ 0xBB) << 16) ^ *(unsigned __int8 *)(v26 + (*(unsigned __int8 *)(v22 - 101) ^ 0x2FLL)) ^ ((v30 ^ 0x5C ^ ((v30 >> 2) & 0x28 | 0xC5)) << 8);
  v328 = v27;
  v329 = v26;
  v327 = v28;
  v32 = (*(unsigned __int8 *)(v26 + (*(unsigned __int8 *)(v22 - 97) ^ 0x97)) ^ 0x68) & 0xFF0000FF | (((*(_BYTE *)(v27 + (*(unsigned __int8 *)(v22 - 99) ^ 0x1DLL)) + 116) ^ 0x30) << 16) | ((v25[*(unsigned __int8 *)(v22 - 100) ^ 0xCELL] ^ 0x69) << 24) | ((v28[*(unsigned __int8 *)(v22 - 98) ^ 0x9ALL] ^ 0x28 ^ (((v28[*(unsigned __int8 *)(v22 - 98) ^ 0x9ALL] >> 2) & 0x28) - ((v28[*(unsigned __int8 *)(v22 - 98) ^ 0x9ALL] >> 1) & 0x10) - 38)) << 8);
  v330 = v25;
  v33 = ((*(unsigned __int8 *)(v26 + (*(unsigned __int8 *)(v22 - 105) ^ 0x81)) ^ 0x68) & 0xFF0000FF | (((v28[*(unsigned __int8 *)(v22 - 106) ^ 0xBALL] ^ ((v28[*(unsigned __int8 *)(v22 - 106) ^ 0xBALL] >> 2) & 0x28 | 5)) ^ 0xF0) << 8) | (((*(_BYTE *)(v27 + (*(unsigned __int8 *)(v22 - 107) ^ 0xF4)) + 116) ^ 0x63) << 16) | ((v25[*(unsigned __int8 *)(v22 - 108) ^ 0x33] ^ 0xA4) << 24)) ^ 0x167B6295;
  v34 = (v29 & 0xFFFF00FF | ((v28[*(unsigned __int8 *)(v22 - 110) ^ 0xDELL] ^ 0x21 ^ (((v28[*(unsigned __int8 *)(v22 - 110) ^ 0xDELL] >> 2) & 0x28) - ((v28[*(unsigned __int8 *)(v22 - 110) ^ 0xDELL] >> 1) & 0x40) + 32)) << 8)) ^ 0x38109A52;
  v35 = v31 ^ 0xD190296E;
  HIDWORD(v326) = v23 - 1354798323;
  LODWORD(v326) = v23 ^ 0x28B;
  HIDWORD(v325) = v23 ^ 0x29C;
  LODWORD(v325) = v23 ^ 0x3DA;
  HIDWORD(v324) = 1324672561;
  *(_DWORD *)(v22 - 136) = v23;
  LODWORD(v324) = v23 ^ 0x36B;
  v36 = *(unsigned __int8 **)(v22 - 120);
  HIDWORD(a20) = 0;
  *(_QWORD *)(v22 - 144) = 6;
  v37 = v36[6];
  v38 = v28[v37 ^ 0x10];
  *(_QWORD *)(v22 - 152) = 12;
  HIDWORD(a19) = (v23 - 1354798323) & 0x50C0936F;
  if (v37)
    v39 = v38 ^ (((v23 - 1354798323) & 0x50C0936F) - 37);
  else
    v39 = -96;
  v40 = v36[12];
  *(_QWORD *)(v22 - 168) = 9;
  v41 = v38 ^ 0x73 ^ (((v39 & (v38 ^ 0x54)) >> 2) - (((v39 & (v38 ^ 0x54u)) >> 1) & 0xC) - 58);
  v42 = v330[v40 ^ 0x41] ^ 0x59;
  v43 = *(_BYTE *)(v27 + (v36[9] ^ 0x9FLL)) + 116;
  v44 = v36[13];
  *(_QWORD *)(v22 - 160) = 14;
  v45 = v28[v36[14] ^ 0xC8];
  v46 = (v42 << 24) | (((*(_BYTE *)(v27 + (v44 ^ 0x46)) + 116) ^ 0x90) << 16);
  *(_QWORD *)(v22 - 184) = 11;
  LODWORD(v44) = v36[8] - 2 * (v36[8] & 0xC9) + 2005506077 - ((2 * (v36[8] - 2 * (v36[8] & 0xC9) + 201)) & 0xEF132E76);
  v47 = *v36;
  v48 = v46 & 0xFFFF00FF | ((v45 ^ 0x41 ^ (((v45 >> 2) & 0x28 ^ 0x89)
                                                                           + ((2 * ((v45 >> 2) & 0x28)) ^ 0xEF)
                                                                           - 5)) << 8) | *(unsigned __int8 *)(v26 + (v36[15] ^ 0x6ALL)) ^ 0x68;
  v49 = (*(unsigned __int8 *)(v26 + (v36[11] ^ 0x84)) ^ 0x68) & 0xFF00FFFF | ((v43 ^ 0x7E) << 16) | ((v330[((_DWORD)v44 - 25) ^ 0x77899796] ^ 0xB7) << 24);
  v50 = v330[v36[4] ^ 6];
  v51 = (*(unsigned __int8 *)(v26 + (v36[7] ^ 0x20)) ^ 0x68) & 0xFFFF00FF | (v41 << 8);
  v52 = v36[5];
  v53 = v330[((((v47 ^ 0xF340FCF4) + 213844748 + ((2 * v47) & 0x1E8) - (v47 ^ 0x20)) ^ 0xFFFFFFC0)
                             + (v47 ^ 0xF340FCF4)
                             + 213844748
                             + ((2 * v47) & 0x1E8)) ^ 0xADLL];
  *(_QWORD *)(v22 - 176) = 2;
  v54 = v51 & 0xFF00FFFF | ((v50 ^ 0xFFFFFFDF) << 24) | (((*(_BYTE *)(v328 + (v52 ^ 0x3C)) + 116) ^ 0xE6) << 16);
  HIDWORD(v333) = -635053982;
  LODWORD(v52) = v28[v36[10] ^ 0x4BLL];
  v55 = (v49 | ((v52 ^ (((v52 & 0xA0) >> (-(char)v44 & 2)) >> (-(char)v44 & 2 ^ 2)) ^ 0x7E) << 8)) ^ v35;
  v56 = v54 ^ v33;
  HIDWORD(v57) = ((((*(_BYTE *)(v328 + (v36[1] ^ 0x13)) + 116) ^ 0x53) << 23) | ((v28[(v36[2] - 2 * (v36[2] & 0x96u) + 150) ^ 0x72] ^ 0x3A ^ (123 - ((v28[(v36[2] - 2 * (v36[2] & 0x96u) + 150) ^ 0x72] >> 2) & 0x28 ^ 8))) << 15) | (~v53 << 31) | (v53 >> 1) ^ 0x49) ^ (__PAIR64__(v34 ^ 0x109A1C, v34 ^ 0x38000000) >> 25);
  LODWORD(v57) = HIDWORD(v57);
  v58 = v54 ^ v33 ^ 0x167B628F;
  v59 = (v57 >> 7) - ((2 * (v57 >> 7)) & 0x834797CA);
  v60 = v48 ^ v32 ^ 0x53121581;
  if ((v56 & 0x4000) != 0)
    v61 = 0x4000;
  else
    v61 = -16384;
  v62 = v61 + v58;
  v63 = (((2 * (BYTE2(v62) ^ 0x24)) | 0x6530F4) - (BYTE2(v62) ^ 0x24) + 2144167814) ^ 0xEF0C037E;
  v64 = v63 - ((2 * v63) & 0xA50E1A6) + 86536403;
  v65 = ((v64 ^ 0x95E91483) + 1) ^ ((BYTE2(v62) ^ 0xFFFFFF7B) + 12);
  v66 = (v64 ^ 0xA208179D ^ (v65 - ((2 * v65) & 0x903DF9C2) - 937493279)) + 11;
  v67 = *(_DWORD *)(v22 - 136);
  v68 = (char *)*(&off_24DCDB210 + v67 - 666) - 12;
  v69 = *(_DWORD *)&v68[4 * v66];
  v70 = (char *)*(&off_24DCDB210 + v67 - 757) - 4;
  v71 = *(_DWORD *)&v70[4 * (BYTE1(v55) ^ 0xF0)];
  HIDWORD(v72) = v69 ^ 0xB19B;
  LODWORD(v72) = v69 ^ 0xE9650000;
  *(_DWORD *)(v22 - 128) = -1785959984;
  v73 = (char *)*(&off_24DCDB210 + (int)v326) - 4;
  v74 = v59 + 1101253605;
  v75 = (uint64_t)*(&off_24DCDB210 + v67 - 723);
  v76 = *(_DWORD *)&v68[4 * (BYTE2(v55) ^ 0xFA)];
  v77 = v71 ^ (*(_DWORD *)&v73[4 * (v60 ^ 0x16)] + 942873067) ^ *(_DWORD *)(v75
                                                                                           + 4
                                                                                           * (((v59 + 1101253605) >> 24) ^ 0x95)) ^ ((BYTE1(v55) ^ 0x7D) - 1785959984 + ((2 * (BYTE1(v55) ^ 0x7D) + 386) & 0x21C ^ 0x6F7DDBFF)) ^ ((v72 >> 16) - 1013111763 - ((2 * (v72 >> 16)) & 0x873A485A));
  HIDWORD(v72) = v76 ^ 0xB19B;
  LODWORD(v72) = v76 ^ 0xE9650000;
  v78 = (BYTE1(v60) ^ 0xF4 | 0xBAC13ADC) - (BYTE1(v60) ^ 0xF4 | 0x453EC523) + 1161741603;
  v79 = ((v60 >> 15) & 0x1BE ^ 0x98) + (BYTE2(v60) ^ 0x3B7FFBB3);
  v80 = *(_DWORD *)(v75 + 4 * (HIBYTE(v62) ^ 0x52)) ^ ((v78 ^ 0xBAC13A35)
                                                       - 1785959985
                                                       - ((2 * (v78 ^ 0xBAC13A35) - 1870486142) & 0x9A962E1C)) ^ *(_DWORD *)&v70[4 * (BYTE1(v60) ^ 0x90)] ^ ((v72 >> 16) - 1013111763 - ((2 * (v72 >> 16)) & 0x873A485A)) ^ (*(_DWORD *)&v73[4 * (*(_BYTE *)(v329 + *(unsigned __int8 *)(*(_QWORD *)(v22 - 120) + 3)) ^ 0xC8 ^ ((v74 ^ 0xE5) - ((2 * (v74 ^ 0xE5)) & 0xD0) + 104))] + 942873067);
  v81 = *(_DWORD *)&v68[4 * v79 - 3992973180 + 4 * (((BYTE2(v60) ^ 0xFFFFFF98) - 998243295 + v79 + 1) ^ 0xFFFFFFFE)];
  v82 = ((BYTE1(v74) ^ 0xC5FE624A) - ((2 * (BYTE1(v74) ^ 0xC5FE624A)) & 0x1B804A8) + 14488404) & 0x5221FFF;
  v83 = *(_DWORD *)(v75 + 4 * (HIBYTE(v55) ^ 0xE3)) ^ HIWORD(v81) ^ 0xE965 ^ (((v81 << 16) ^ 0xB19B0000)
                                                                              - 1013111763
                                                                              - ((2 * ((v81 << 16) ^ 0xB19B0000)) & 0x873A0000));
  v84 = (*(_DWORD *)&v73[4 * (v56 ^ 0x9B)] + 942873067) ^ *(_DWORD *)&v70[4 * (BYTE1(v74) ^ 0x14)] ^ (v83 - 850716914 - ((2 * v83) & 0x9A962E1C)) ^ ((v82 ^ 0x5221187) - 935243071);
  v85 = *(_DWORD *)&v68[4 * (BYTE2(v74) ^ 0xEC)];
  HIDWORD(v72) = v85 ^ 0xB19B;
  LODWORD(v72) = v85 ^ 0xE9650000;
  v86 = (v84 - ((2 * v84) & 0x4D163338) + 646650268) ^ v82;
  v87 = BYTE1(v62);
  v88 = (((2 * (v87 ^ 0x3D)) & 0x116) - (v87 ^ 0x3D) + 6206836) & 0x5037FF;
  v89 = *(_DWORD *)&v70[4 * (v87 ^ 0xBD)] ^ ((v88 ^ 0x503579)
                                           - 1785959985
                                           - ((2 * (v88 ^ 0x503579) - 1870486142) & 0x90822E1C));
  v90 = (*(_DWORD *)&v73[4 * (v55 ^ 0x9D)] + 942873067) ^ *(_DWORD *)(v75 + 4 * (HIBYTE(v60) ^ 0x36)) ^ (v89 - ((2 * v89) & 0x5BA8E6FA) + 768897917) ^ ((v72 >> 16) - 1013111763 - ((2 * (v72 >> 16)) & 0x873A485A));
  v91 = ((BYTE1(v86) ^ 0x69) + ((v86 >> 8) & 0x3B ^ 0xAED3F312) - ((BYTE1(v86) ^ 0x69) & 0x3B)) ^ 0xBE5FF73B;
  LOWORD(v85) = v80 ^ v78;
  v92 = *(_DWORD *)&v68[4 * (((v80 ^ v78) >> 16) ^ 0xB7)];
  HIDWORD(v72) = v92 ^ 0xB19B;
  LODWORD(v72) = v92 ^ 0xE9650000;
  v93 = v91 - ((2 * v91) & 0x201820A0) + 975007824;
  v94 = *(_DWORD *)(v75 + 4 * (HIBYTE(v77) ^ 0xB6));
  v95 = (v72 >> 16) ^ *(_DWORD *)&v70[4 * (BYTE1(v86) ^ 0x49)] ^ (*(_DWORD *)&v73[4
                                                                                * ((v90 ^ v88) ^ 0x24)]
                                                                + 942873067) ^ ((v93 ^ 0x2A9174FD)
                                                                              - 1785959985
                                                                              - ((2 * (v93 ^ 0x2A9174FD) - 1870486142) & 0x9A962E1C)) ^ ((v94 ^ 0xC39D242D) + 1723418988 + ((2 * v94) & 0xCD7292D8 ^ 0x7ACDFFA7) + 1);
  v96 = *(_DWORD *)&v68[4 * (BYTE2(v86) ^ 0x66)];
  HIDWORD(v72) = v96 ^ 0xB19B;
  LODWORD(v72) = v96 ^ 0xE9650000;
  v97 = ((v72 >> 16) - 1013111763 - ((2 * (v72 >> 16)) & 0x873A485A)) ^ *(_DWORD *)(v75 + 4 * (HIBYTE(v80) ^ 0x79));
  v98 = ((unsigned __int16)(v90 ^ v88) >> 8);
  v99 = (v98 ^ 0xF8 | 0x8B0E3BE6) - (v98 ^ 0xF8 | 0x74F1C419) + 1962001433;
  v100 = ((v90 ^ v88) >> 16);
  v101 = (v100 ^ 0x1D) + (((v90 ^ v88) >> 16) & 0x5C ^ 0x95DA2240) - ((v100 ^ 0x1D) & 0x5C);
  v102 = (v101 & 0x1D02344 ^ 0x2A04D500) + (v101 ^ 0xC5F82AC4) - ((v101 ^ 0xC5F82AC4) & 0x40020B44);
  v103 = ((v102 ^ 0xC40B08BD) + 1) ^ ((v100 ^ 0xFFFFFF77) + 12);
  v104 = (*(_DWORD *)&v73[4 * ((v77 ^ BYTE1(v55)) ^ 0xFB)] + 942873067) ^ *(_DWORD *)&v70[4 * (v98 ^ 0xD7)] ^ v99 ^ (v97 - 850716914 - ((2 * v97) & 0x9A962E1C)) ^ ((v99 ^ 0x8B0E3B44) - ((2 * (v99 ^ 0x8B0E3B44) + 8562050) & 0xD30BE64) + 1322889715);
  v105 = *(_DWORD *)&v68[4 * (v102 ^ 0xCAC946CF ^ (v103 - ((2 * v103) & 0xE27B631A) - 247615091)) + 44];
  HIDWORD(v72) = v105 ^ 0xB19B;
  LODWORD(v72) = v105 ^ 0xE9650000;
  v106 = (((2 * (BYTE1(v77) ^ 0x8B)) | 0xB6DDD86E) - (BYTE1(v77) ^ 0x8B) + 613487561) ^ 0x9B42ED1C;
  v107 = (v106 | 0x75957AA6) - (v106 | 0x8A6A8559) - 1972730535;
  v108 = ((v107 ^ 0x35B97BA6) - 1785959985 - ((2 * (v107 ^ 0x35B97BA6) - 1870486142) & 0x9A962E1C)) ^ *(_DWORD *)&v70[4 * (BYTE1(v77) ^ 0x2D)];
  v109 = *(_DWORD *)(v75 + 4 * (HIBYTE(v86) ^ 0x74)) ^ (*(_DWORD *)&v73[4 * (v85 ^ 0x9B)] + 942873067) ^ v107 ^ ((v72 >> 16) - 1013111763 - ((2 * (v72 >> 16)) & 0x873A485A)) ^ (v108 - ((2 * v108) & 0x81DB6FF4) - 1058162694);
  v110 = *(_DWORD *)&v68[4 * (BYTE2(v77) ^ 0xB4)];
  HIDWORD(v72) = v110 ^ 0xB19B;
  LODWORD(v72) = v110 ^ 0xE9650000;
  v111 = *(_DWORD *)(v22 - 128);
  v112 = *(_DWORD *)(v75 + 4 * (HIBYTE(v90) ^ 0x1A)) ^ ((BYTE1(v85) ^ 0x2F)
                                                        + v111
                                                        + ((2 * (BYTE1(v85) ^ 0x2F) + 386) & 0x21C ^ 0x6F7DDBFF)) ^ *(_DWORD *)&v70[4 * (BYTE1(v85) ^ 0xA2)] ^ (*(_DWORD *)&v73[4 * (v86 ^ 0x72)] + 942873067) ^ ((v72 >> 16) - 1013111763 - ((2 * (v72 >> 16)) & 0x873A485A));
  v113 = (BYTE1(v109) ^ 0x5104C962) - ((2 * (BYTE1(v109) ^ 0x5104C962)) & 0x20000340) + 270152096;
  v114 = ((v113 ^ 0x411EF8A0) - 1785959985 - ((2 * (v113 ^ 0x411EF8A0) - 1870486142) & 0x9A962E1C)) ^ *(_DWORD *)&v70[4 * (BYTE1(v109) ^ 0xEF)];
  v115 = *(_DWORD *)&v68[4 * (BYTE2(v104) ^ 0x3E)];
  HIDWORD(v72) = v115 ^ 0xB19B;
  LODWORD(v72) = v115 ^ 0xE9650000;
  LOWORD(v77) = v95 ^ v93;
  v116 = (v72 >> 16) ^ *(_DWORD *)(v75 + 4 * (((v95 ^ v93) >> 24) ^ 0x5F)) ^ (*(_DWORD *)&v73[4 * ((v112 ^ BYTE1(v85)) ^ 0x45)]
                                                                                            + 942873067) ^ (v114 - 1013111762 + ~((2 * v114) & 0x873A485A));
  v117 = *(_DWORD *)&v68[4 * (BYTE2(v109) ^ 0x95)];
  HIDWORD(v72) = v117 ^ 0xB19B;
  LODWORD(v72) = v117 ^ 0xE9650000;
  v118 = BYTE1(v112) ^ 0x46;
  v119 = (v118 + 138498753) & 0x84040AE ^ (v112 >> 8) & 0xAE;
  v120 = (v118 - 935243071) & 0xC0011351 ^ (v112 >> 8) & 0x51;
  LOWORD(v77) = v77 ^ 0xB462;
  v121 = *(_DWORD *)&v70[4 * (BYTE1(v112) ^ 0xCB)] ^ *(_DWORD *)(v75 + 4 * (HIBYTE(v104) ^ 0x4C)) ^ (*(_DWORD *)&v73[4 * (v77 ^ 0xFE)] + 942873067) ^ (((v119 | v120) ^ 0x46) - 850716914 - 2 * (((v119 | v120) ^ 0x46) & 0x4841131F ^ v120 & 0x3F)) ^ ((v72 >> 16) - 1013111763 - ((2 * (v72 >> 16)) & 0x873A485A));
  v122 = (-540173043 - (BYTE1(v77) ^ 0xAA | 0xDFCD9D0D) + (BYTE1(v77) ^ 0xAA | 0x203262F2)) ^ 0x349148E6;
  v123 = *(_DWORD *)&v68[4 * (BYTE2(v112) ^ 0x6B)];
  HIDWORD(v72) = v123 ^ 0xB19B;
  LODWORD(v72) = v123 ^ 0xE9650000;
  v124 = ((2 * v122) | 0xC5265D70) - v122 - 1653812920;
  v125 = ((v124 ^ 0x763004F8) - 1785959985 - ((2 * (v124 ^ 0x763004F8) - 1870486142) & 0x9A962E1C)) ^ *(_DWORD *)&v70[4 * (BYTE1(v77) ^ 0x73)];
  v334 = v109;
  v126 = (*(_DWORD *)&v73[4 * (v104 ^ 0x55)] + 942873067) ^ ((v72 >> 16)
                                                                            - 1013111763
                                                                            - ((2 * (v72 >> 16)) & 0x873A485A)) ^ v124 ^ *(_DWORD *)(v75 + 4 * (HIBYTE(v109) ^ 0xC8)) ^ (v125 - ((2 * v125) & 0x3AE51FDE) - 1653436433);
  v127 = *(_DWORD *)&v68[4 * (BYTE2(v95) ^ 0xC1)];
  HIDWORD(v72) = v127 ^ 0xB19B;
  LODWORD(v72) = v127 ^ 0xE9650000;
  v128 = *(_DWORD *)(v75 + 4 * (HIBYTE(v112) ^ 0x21)) ^ ((BYTE1(v104) ^ 0xF2)
                                                         + v111
                                                         + ((2 * (BYTE1(v104) ^ 0xF2) + 386) & 0x21C ^ 0x6F7DDBFF)) ^ *(_DWORD *)&v70[4 * (BYTE1(v104) ^ 0x7F)] ^ ((v72 >> 16) - 1013111763 - ((2 * (v72 >> 16)) & 0x873A485A)) ^ (*(_DWORD *)&v73[4 * (v109 ^ 0x96)] + 942873067);
  v129 = (BYTE1(v126) ^ 0xEC) + ((v126 >> 8) & 0xE7 ^ 0x3DAB4903) - ((BYTE1(v126) ^ 0xEC) & 0xFFFFFFE7);
  v130 = *(_DWORD *)&v68[4 * (BYTE2(v121) ^ 0x2E)];
  HIDWORD(v72) = v130 ^ 0xB19B;
  LODWORD(v72) = v130 ^ 0xE9650000;
  v131 = (v129 & 0x22A ^ 0x30002209) + (v129 & 0xDD5) - 1;
  v132 = *(_DWORD *)&v68[4 * (BYTE2(v126) ^ 0xB)];
  v133 = *(_DWORD *)&v70[4 * (BYTE1(v126) ^ 0xB6)] ^ *(_DWORD *)(v75 + 4 * (HIBYTE(v116) ^ 0x55)) ^ (v72 >> 16) ^ (*(_DWORD *)&v73[4 * ((v128 ^ BYTE1(v104)) ^ 0xDB)] + 942873067) ^ ((v131 ^ 0x30002B38) - 1785959985 - ((2 * (v131 ^ 0x30002B38) - 1870486142) & 0x9A962E1C));
  HIDWORD(v72) = v132 ^ 0xB19B;
  LODWORD(v72) = v132 ^ 0xE9650000;
  v134 = (v72 >> 16) - 1013111763 - ((2 * (v72 >> 16)) & 0x873A485A);
  v135 = *(_DWORD *)&v68[4 * (BYTE2(v128) ^ 0x84)];
  HIDWORD(v72) = v135 ^ 0xB19B;
  LODWORD(v72) = v135 ^ 0xE9650000;
  v136 = v116 ^ v113;
  v137 = *(_DWORD *)&v70[4 * (BYTE1(v128) ^ 0x8F)] ^ *(_DWORD *)(v75 + 4 * (HIBYTE(v121) ^ 0x3F)) ^ (*(_DWORD *)&v73[4 * ((v116 ^ v113) ^ 0x8A)] + 942873067) ^ v134 ^ ((BYTE1(v128) ^ 2) + v111 + ((2 * (BYTE1(v128) ^ 2) + 386) & 0x21C ^ 0x6F7DDBFF));
  v138 = ((v72 >> 16) - 1013111763 - ((2 * (v72 >> 16)) & 0x873A485A)) ^ *(_DWORD *)(v75 + 4 * (HIBYTE(v126) ^ 0xC2));
  v139 = (((v136 >> 8) & 0xE) + (BYTE1(v136) ^ 0x6F) - ((BYTE1(v136) ^ 0x6F) & 0xE) + 216377600) ^ 0x66F810F;
  v140 = (((((2 * v139) | 0xF3D0898) - v139 + 2019654580) ^ 0x8D14AC52) - 935243071) ^ (((2 * v139) | 0xF3D0898)
                                                                                      - v139
                                                                                      + 2019654580);
  v141 = *(_DWORD *)&v70[4 * (BYTE1(v136) ^ 0xFD)] ^ 0x66B9496C ^ (v138 - 850716914 - ((2 * v138) & 0x9A962E1C));
  v142 = (v141 + (v140 ^ 0x8D14AC52) - 2 * (v141 & (v140 ^ 0xD14AC52))) ^ (*(_DWORD *)&v73[4
                                                                                         * (v121 ^ 0x89)]
                                                                         + 942873067);
  v143 = (((v121 >> 7) & 0x180) + (BYTE1(v121) ^ 0xFFFFFFD2) + 350423872) ^ 0x324D1E3A;
  v144 = *(_DWORD *)&v68[4 * (BYTE2(v116) ^ 0x20)];
  HIDWORD(v72) = v144 ^ 0xB19B;
  LODWORD(v72) = v144 ^ 0xE9650000;
  v145 = ((v72 >> 16) - 1013111762 + ~((2 * (v72 >> 16)) & 0x873A485A)) ^ *(_DWORD *)(v75 + 4 * (HIBYTE(v128) ^ 0x23));
  v146 = *(_DWORD *)&v70[4 * (BYTE1(v121) ^ 0x67)] ^ (v143 - ((2 * v143) & 0xC4C2092) - 1624788919) ^ (*(_DWORD *)&v73[4 * (v126 ^ 0xD4)] + 942873067) ^ (((v143 - ((2 * v143) & 0xC4C2092) - 1624788919) ^ 0xB989A58B) - ((2 * ((v143 - ((2 * v143) & 0xC4C2092) - 1624788919) ^ 0xB989A58B) - 1870486142) & 0xF0638D70) - 1066198663) ^ (v145 - 850716914 - ((2 * v145) & 0x9A962E1C));
  v147 = *(_DWORD *)&v68[4 * (BYTE2(v137) ^ 0xD3)];
  HIDWORD(v72) = v147 ^ 0xB19B;
  LODWORD(v72) = v147 ^ 0xE9650000;
  v148 = (BYTE1(v142) ^ 0x904084FE) - ((2 * (BYTE1(v142) ^ 0x904084FE)) & 0x20810134) + 2036722074;
  v149 = *(_DWORD *)&v70[4 * (BYTE1(v142) ^ 8)] ^ *(_DWORD *)(v75 + 4 * (((v133 ^ v131) >> 24) ^ 0xC6)) ^ (*(_DWORD *)&v73[4 * (v146 ^ 0x33)] + 942873067) ^ ((v72 >> 16) - 1013111763 - ((2 * (v72 >> 16)) & 0x873A485A)) ^ ((v148 ^ 0xE9256DE1) - 1785959985 - ((2 * (v148 ^ 0xE9256DE1) - 1870486142) & 0x9A962E1C));
  v150 = *(_DWORD *)&v68[4 * (BYTE2(v142) ^ 0x85)];
  v151 = (((v150 << 16) ^ 0xB19B0000) - 1013111763 - ((2 * ((v150 << 16) ^ 0xB19B0000)) & 0x873A0000)) ^ *(_DWORD *)(v75 + 4 * (HIBYTE(v137) ^ 0x21));
  v152 = (((v146 >> 8) & 0xC1) + 241551359 + ((v146 >> 8) & 0x3E ^ 0x1B)) ^ 0xFC5C0C3;
  v153 = ((2 * v152) & 0x1000D14) - v152 - 1419327115;
  v154 = ((v153 ^ 0xAAC6C1F5) - 935243071) ^ *(_DWORD *)&v70[4 * (BYTE1(v146) ^ 0xD4)];
  HIDWORD(v72) = v151 ^ HIWORD(v150) ^ v153 ^ v154 ^ 0x3476F2;
  LODWORD(v72) = v151 ^ v154 ^ 0xAB800000;
  v155 = v72 >> 23;
  HIDWORD(v72) = v155 ^ 0x11C;
  LODWORD(v72) = v155 ^ 0xAA73C600;
  v156 = *(_DWORD *)&v73[4 * ((v133 ^ v131) ^ 0xF6)];
  v157 = (v72 >> 9) ^ (((2 * v156 + 19239714) & 0x6F40A0B4) + ((v156 - 2137863791) ^ 0xB7A0505A));
  v158 = ((unsigned __int16)(v133 ^ v131 ^ 0xEFDC) >> 8);
  v159 = ((2 * (v158 ^ 0x7A)) | 0x96661962) - (v158 ^ 0x7A) + 885846863;
  v160 = *(_DWORD *)&v68[4 * (BYTE2(v146) ^ 0xA6)];
  HIDWORD(v72) = v160 ^ 0xB19B;
  LODWORD(v72) = v160 ^ 0xE9650000;
  v161 = *(_DWORD *)&v70[4 * (v158 ^ 0xFB)];
  v162 = (*(_DWORD *)&v73[4 * ((v137 ^ BYTE1(v128)) ^ 0xE8)] + 942873067) ^ *(_DWORD *)(v75 + 4 * (HIBYTE(v142) ^ 0x45)) ^ ((((v159 ^ 0xCB330CBD) - 935243071) ^ v159) & 0x400060 ^ v161 & 0x20400C60 | (((v159 ^ 0xCB330CBD) - 935243071) ^ v159) & 0xC8000399 ^ v161 & 0xCA900399 | (((v159 ^ 0xCB330CBD) - 935243071) ^ v159) & 0x15006 ^ v161 & 0x152FF006) ^ ((v72 >> 16) - 1013111763 - ((2 * (v72 >> 16)) & 0x873A485A));
  v163 = (((v137 >> 8) & 0xE4 ^ 0x5BE61185) + ((v137 >> 8) & 0x1B) - 1) ^ 0x1BE65116;
  v164 = *(_DWORD *)&v68[4 * (BYTE2(v133) ^ 0xC6)];
  HIDWORD(v72) = v164 ^ 0xB19B;
  LODWORD(v72) = v164 ^ 0xE9650000;
  v165 = (v163 | 0xA7B49807) - (v163 | 0x584B67F8) + 1481336824;
  v166 = *(_DWORD *)&v70[4 * (BYTE1(v137) ^ 5)] ^ ((v165 ^ 0xE7B4D81D)
                                                 - 1785959985
                                                 - ((2 * (v165 ^ 0xE7B4D81D) - 1870486142) & 0x9A962E1C));
  v167 = (v72 >> 16) - 1013111763 - ((2 * (v72 >> 16)) & 0x873A485A);
  HIDWORD(v72) = v157 ^ 3;
  LODWORD(v72) = v157 ^ 0x8E5539E0;
  v168 = (v72 >> 3) - ((2 * (v72 >> 3)) & 0x535F5510) - 1448105336;
  HIDWORD(v72) = v168 ^ 0x9AFAA88;
  LODWORD(v72) = v168 ^ 0xA0000000;
  v169 = *(_DWORD *)(v75 + 4 * (HIBYTE(v146) ^ 0x6A)) ^ v165 ^ (*(_DWORD *)&v73[4 * (v142 ^ 0xC5)]
                                                                + 942873067) ^ v167;
  v170 = v166 - ((2 * v166) & 0xFEDAFB6A) + 2137882037;
  v171 = (v72 >> 29) - ((2 * (v72 >> 29)) & 0x128D7352) - 1991853655;
  v172 = v169 ^ v170;
  v173 = *(_DWORD *)&v68[4 * (BYTE2(v171) ^ 0xCF)];
  HIDWORD(v72) = v173 ^ 0xB19B;
  LODWORD(v72) = v173 ^ 0xE9650000;
  v174 = ((v162 >> 8) & 0xD0 ^ 0x5C1) + ((v162 >> 8) & 0x2F) - 1;
  v175 = v149 ^ v148;
  v176 = *(_DWORD *)(v75 + 4 * (HIBYTE(v149) ^ 0xD3)) ^ v174 ^ ((v174 ^ 0x599)
                                                                - 1031918893
                                                                + ((2 * (v174 ^ 0x599) + 1410) & 0x1022 ^ 0x6FFF5FFF)) ^ 0xFA3CDD88 ^ ((v72 >> 16) - 1013111763 - ((2 * (v72 >> 16)) & 0x873A485A));
  v177 = (*(_DWORD *)&v73[4 * (v172 ^ 0xED)] + 942873067) ^ *(_DWORD *)&v70[4 * (BYTE1(v162) ^ 0xD4)] ^ (v176 - 850716914 - ((2 * v176) & 0x9A962E1C));
  v178 = *(_DWORD *)&v68[4 * (BYTE2(v162) ^ 0xE0)];
  v179 = (((v172 >> 8) & 0xA4 ^ 0x42958AA4) - ((v172 >> 8) & 0xA4) + (BYTE1(v172) ^ 0x1B)) & 0x400003FF;
  v180 = *(_DWORD *)&v68[4 * (BYTE2(v172) ^ 0xCB)];
  v181 = *(_DWORD *)(v75 + 4 * (HIBYTE(v171) ^ 0x36)) ^ HIWORD(v178) ^ *(_DWORD *)&v70[4 * (BYTE1(v172) ^ 0xA8)] ^ (*(_DWORD *)&v73[4 * (v175 ^ 0x67)] + 942873067) ^ (((v178 << 16) ^ 0xB19B0000) - 1013111763 - ((2 * ((v178 << 16) ^ 0xB19B0000)) & 0x873A0000)) ^ ((v179 ^ 0x4000029A) + v111 + ((2 * (v179 ^ 0x4000029A) + 1410) & 0xE1C ^ 0x6F7DDFFF));
  HIDWORD(v72) = v180 ^ 0xB19B;
  LODWORD(v72) = v180 ^ 0xE9650000;
  v182 = v175 >> 8;
  v183 = (BYTE1(v175) ^ 0x3050006B) + ((v175 >> 8) & 0x2C ^ 0x836704) - ((BYTE1(v175) ^ 0x3050006B) & 0x2010002C);
  v184 = *(_DWORD *)&v70[4 * (BYTE1(v175) ^ 0xEA)] ^ *(_DWORD *)(v75 + 4 * (HIBYTE(v162) ^ 0xD4)) ^ ((v72 >> 16) - 1013111763 - ((2 * (v72 >> 16)) & 0x873A485A)) ^ ((v183 ^ 0x10C36720) - 1785959985 - ((2 * (v183 ^ 0x10C36720) - 1870486142) & 0x9A962E1C)) ^ (*(_DWORD *)&v73[4 * (v171 ^ 0x29)] + 942873067);
  v185 = *(_DWORD *)&v68[4 * (BYTE2(v175) ^ 0x60)];
  HIDWORD(v72) = v185 ^ 0xB19B;
  LODWORD(v72) = v185 ^ 0xE9650000;
  v186 = BYTE1(v171);
  v187 = ((2 * (v186 ^ 0x1CAC87AA)) & 0x31590D5A) - (v186 ^ 0x1CAC87AA) - 464443054;
  v188 = ((v187 ^ 0xF8FDAE7E) - 1785959985 - ((2 * (v187 ^ 0xF8FDAE7E) - 1870486142) & 0x9A962E1C)) ^ *(_DWORD *)&v70[4 * (v186 ^ 0xB)];
  v189 = (v72 >> 16) ^ *(_DWORD *)(v75 + 4 * (HIBYTE(v172) ^ 0x49)) ^ (*(_DWORD *)&v73[4
                                                                                       * (v162 ^ 0x76)]
                                                                       + 942873067) ^ (v188
                                                                                     - 1013111763
                                                                                     - ((2 * v188) & 0x873A485A));
  v190 = (v177 ^ 0x32CA2F56) >> (v182 & 8) >> (v182 & 8 ^ 8);
  v191 = v190 - ((2 * v190) & 0x98CEAEEA);
  v192 = *(_DWORD *)&v68[4 * (BYTE2(v181) ^ 0x57)];
  v193 = (((v187 ^ 0xFFD26133 ^ v189) & 1) + ((v187 ^ 0xFFD26133 ^ v189) & 0xFE ^ 0x9493D833) - 1) ^ 0x6A06EF5;
  v194 = ((v192 ^ 0xE965B19B) >> (v334 & 0x10 ^ 0x10) >> (v334 & 0x10)) + ((v192 << 16) ^ 0xB19B0000);
  LOBYTE(v192) = v184 ^ v183;
  v195 = v184 ^ v183 ^ 0x12232340;
  v196 = ((BYTE1(v195) ^ 0x53) - 1785959985 - ((2 * (BYTE1(v195) ^ 0x53) - 1870486142) & 0x9082261C)) ^ *(_DWORD *)&v70[4 * (BYTE1(v195) ^ 0xDE)];
  v197 = ((2 * v193) & 0x20417BDE) - v193 - 358923760;
  v198 = (unsigned __int16)(v187 ^ 0x6133 ^ v189) >> 8;
  v335 = v187 ^ 0x6133 ^ v189;
  v199 = ((v197 ^ 0x87570BDF) + 1) ^ ((v187 ^ 0x33 ^ v189 ^ 0xFFFFFF4F) + 72);
  v200 = *(_DWORD *)(v75 + 4 * (HIBYTE(v177) ^ 0x95)) ^ v194 ^ (v196 - 1013111763 - ((2 * v196) & 0x873A485A));
  v201 = *(_DWORD *)&v68[4 * (BYTE2(v195) ^ 0xBB)];
  HIDWORD(v72) = v201 ^ 0xB19B;
  LODWORD(v72) = v201 ^ 0xE9650000;
  v202 = (*(_DWORD *)&v73[4 * (v197 ^ 0xA1CE3059 ^ (v199 - ((2 * v199) & 0xB2CD88F2) - 647576455)) + 284] + 942873067) ^ v200;
  LOWORD(v197) = v181 ^ v179;
  v203 = *(_DWORD *)&v70[4 * (v198 ^ 0x21)] ^ *(_DWORD *)(v75 + 4 * (HIBYTE(v181) ^ 0x67)) ^ ((v72 >> 16)
                                                                                              - 1013111763
                                                                                              - ((2 * (v72 >> 16)) & 0x873A485A)) ^ (*(_DWORD *)&v73[4 * (v177 ^ 0x11)] + 942873067) ^ ((v198 ^ 0xAC) + v111 + ((2 * (v198 ^ 0xAC) + 386) & 0x21C ^ 0x6F7DDBFF));
  LOBYTE(v181) = v191 + 117;
  v204 = (((v191 - 865642635) & 0x21 ^ 0xDAC720) + ((v191 - 865642635) & 0xDE ^ 0x4F) + 0xFFFFFF) & 0x9A4FFF;
  v205 = *(_DWORD *)&v68[4 * (BYTE2(v189) ^ 0xEF)];
  HIDWORD(v72) = v205 ^ 0xB19B;
  LODWORD(v72) = v205 ^ 0xE9650000;
  v206 = (v72 >> 16) - 1013111763 - ((2 * (v72 >> 16)) & 0x873A485A);
  v207 = *(_DWORD *)&v73[4 * (v197 ^ 0x82)] + 942873067;
  HIDWORD(v72) = v207 ^ 0x2FA0000;
  LODWORD(v72) = v207 ^ 0xE0000000;
  v208 = v72 >> 27;
  v209 = ((v204 ^ 0x9A471B) - 1785959985 - ((2 * (v204 ^ 0x9A471B) - 1870486142) & 0x90962E1C)) ^ *(_DWORD *)&v70[4 * (v181 ^ 0xF8)];
  HIDWORD(v72) = v208 ^ 0x1C;
  LODWORD(v72) = v208 ^ 0x5F400000;
  v210 = ((2 * (v72 >> 5)) & 0xBB2DFEFE) + ((v72 >> 5) ^ 0x5D96FF7F);
  v211 = *(_DWORD *)(v75 + 4 * (HIBYTE(v184) ^ 0x9D)) ^ v206 ^ v204 ^ 0x60F84BB6 ^ (v209
                                                                                    - ((2 * v209) & 0xDB68B82)
                                                                                    + 115033537);
  v212 = v210 + v211 - 2 * (v211 & (v210 + 577306753)) - 1570176895;
  v213 = BYTE1(v197);
  v214 = (((2 * (v213 ^ 0xC6)) | 0xBE7391E2) - (v213 ^ 0xC6) + 549861135) ^ 0xD138E8F1;
  v215 = *(_DWORD *)&v68[4 * (BYTE2(v177) ^ 0xC1)];
  HIDWORD(v72) = v215 ^ 0xB19B;
  LODWORD(v72) = v215 ^ 0xE9650000;
  v216 = ((2 * v214) | 0x6CB75510) - v214 + 1235506552;
  v217 = ((v216 ^ 0xB85A8A08) - 1785959985 - ((2 * (v216 ^ 0xB85A8A08) - 1870486142) & 0x9A962E1C)) ^ *(_DWORD *)&v70[4 * (v213 ^ 0xCB)];
  v218 = v216 ^ (*(_DWORD *)&v73[4 * (v192 ^ 0x18)] + 942873067) ^ *(_DWORD *)(v75
                                                                                              + 4
                                                                                              * (HIBYTE(v189) ^ 0x67)) ^ ((v72 >> 16) - 1013111763 - ((2 * (v72 >> 16)) & 0x873A485A));
  v219 = v217 - ((2 * v217) & 0x80C0319C) - 1067444018;
  v220 = *(_DWORD *)&v68[4 * (BYTE2(v203) ^ 0x52)];
  v221 = v218 ^ v219;
  HIDWORD(v72) = v220 ^ 0xB19B;
  LODWORD(v72) = v220 ^ 0xE9650000;
  v222 = v72 >> 16;
  v223 = *(_DWORD *)&v68[4 * (BYTE2(v221) ^ 0xDC)];
  HIDWORD(v72) = v223 ^ 0xB19B;
  LODWORD(v72) = v223 ^ 0xE9650000;
  v224 = ((v72 >> 16) ^ 0xF5B5B35E) + 172641442 + ((2 * (v72 >> 16)) & 0xEB6B66BC);
  v225 = v212 - ((2 * v212) & 0xD6285D2E) + 1796484759;
  v226 = *(_DWORD *)(v75 + 4 * (HIBYTE(v225) ^ 0x73));
  v227 = v224 + (v226 ^ 0xA5246D41) - 2 * (v224 & (v226 ^ 0x25246D41));
  v332 = ((2 * v227) & 0xDEF66E34) + (v227 ^ 0xEF7B371A);
  v228 = (BYTE1(v202) ^ 0xB2 | 0x679A8D1C) - (BYTE1(v202) ^ 0xB2 | 0x986572E3) - 1738181917;
  v229 = *(_DWORD *)&v70[4 * (BYTE1(v202) ^ 0x8D)] ^ ((v228 ^ 0x679A8DAE) - 935243071);
  v230 = ((v332 + 313574) & 0x100000 ^ 0xEF7B1FFC) + 2 * ((v332 + 313574) & 0x100000);
  v231 = *(_DWORD *)(v75 + 4 * (HIBYTE(v202) ^ 0x84)) ^ (v222 - ((2 * v222) & 0x800EA83C) + 1074222110);
  v232 = ((BYTE1(v225) ^ 0x3B) + ((v225 >> 8) & 0x17 ^ 0xA8AF304) - ((BYTE1(v225) ^ 0x3B) & 0x17)) ^ 0x57DA7F91;
  HIDWORD(v72) = v231 ^ 0x523395F;
  LODWORD(v72) = v231 ^ 0xE0000000;
  v233 = v72 >> 27;
  HIDWORD(v72) = v233 ^ 0x55555555;
  LODWORD(v72) = v233 ^ 0x5960F980;
  v234 = (v232 | 0x9F971EE1) - (v232 | 0x6068E11E) + 1617486110;
  v235 = (((2 * (BYTE1(v221) ^ 0x895DDDB3)) & 0x128A38E0) - (BYTE1(v221) ^ 0x895DDDB3) - 694500977) ^ 0x5CEA90A7;
  v236 = (*(_DWORD *)&v73[4 * (v221 ^ 0xB0)] + 942873067) ^ *(_DWORD *)&v70[4 * (BYTE1(v225) ^ 0x50)] ^ (v72 >> 5);
  v237 = *(_DWORD *)&v68[4 * (BYTE2(v225) ^ 2)];
  HIDWORD(v72) = v237 ^ 0xB19B;
  LODWORD(v72) = v237 ^ 0xE9650000;
  v238 = v236 ^ ((v234 ^ 0xC2C79281) - 1785959985 - ((2 * (v234 ^ 0xC2C79281) - 1870486142) & 0x9A962E1C));
  v239 = ((2 * v235) & 0x3CAA7B78) - v235 - 508902845;
  v240 = ((v239 ^ 0xE2874E67) - 1785959985 - ((2 * (v239 ^ 0xE2874E67) - 1870486142) & 0x9A962E1C)) ^ *(_DWORD *)&v70[4 * (BYTE1(v221) ^ 0x32)];
  v241 = (*(_DWORD *)&v73[4 * ((v202 ^ BYTE1(v195)) ^ 0x1D)] + 942873067) ^ *(_DWORD *)(v75 + 4 * (HIBYTE(v203) ^ 0xC8)) ^ v239 ^ (v240 - ((2 * v240) & 0x77466C2E) + 1000551959) ^ ((v72 >> 16) - 1013111763 - ((2 * (v72 >> 16)) & 0x873A485A));
  HIDWORD(v72) = (v221 >> 25) ^ 0x6C940763;
  LODWORD(v72) = v221 << 7;
  v242 = *(_DWORD *)&v68[4 * (BYTE2(v202) ^ 0xA3)];
  v243 = ((v203 >> 8) & 0x31) + 536871744 + ((v203 >> 8) & 0xCE ^ 0x50D48A07) + 191;
  v244 = ((2 * v241) & 0x68CAAD62 ^ 0x97F5DFDF) + (v241 ^ 0xBF9D311C);
  v245 = *(_DWORD *)(v75 + 4 * ((v72 >> 31) ^ 0xD9280E8C)) ^ (v242 << 16) ^ *(_DWORD *)&v70[4 * (BYTE1(v203) ^ 0xD4)] ^ ((HIWORD(v242) ^ 0xE965) - 1013111763 - 2 * ((HIWORD(v242) ^ 0xE965) & 0x242F ^ HIWORD(v242) & 2)) ^ v243 ^ (*(_DWORD *)&v73[4 * (v225 ^ 0xF0)] + 942873067) ^ ((v243 ^ 0x70D48E5F) - 1785959985 - ((2 * (v243 ^ 0x70D48E5F) - 1870486142) & 0x9A962E1C));
  v246 = v244 - ((2 * v244 + 147500388) & 0x15DFCE96) - 1084932611;
  v247 = v236 ^ ((v234 ^ 0x9281) + 27087 - ((2 * (v234 ^ 0x9281) - 23166) & 0x2E1C)) ^ v234;
  v248 = *(_DWORD *)&v68[4
                       * (((v238 ^ v234 ^ 0x3F9D6ECF) >> (BYTE2(v246) & 0x10) >> (BYTE2(v246) & 0x10 ^ 0x10)) ^ 0xB)];
  HIDWORD(v72) = v248 ^ 0xB19B;
  LODWORD(v72) = v248 ^ 0xE9650000;
  v249 = v72 >> 16;
  v250 = v230 + 1073606336;
  if (((v230 + 277143556) & (v229 ^ 0xCD4B170E)) != 0)
    v250 = 519319224 - v230;
  v251 = v249 ^ *(_DWORD *)(v75
                          + 4
                          * (((102 * ((v245 ^ 0x5E000000) / 0x66000000))
                            + ((HIBYTE(v245) ^ 0x5F)
                                              - 102 * ((161 * (HIBYTE(v245) ^ 0x5F)) >> 14))) ^ 0xA7u));
  v252 = *(_DWORD *)&v70[4 * (BYTE1(v246) ^ 0x6A)];
  v253 = (v252 & 0x40000 | ((((v252 & 0x40000u) >> 18) & 1) << 19)) ^ 0x2AE7F4EF;
  v254 = (v332 + 277137638) & 0xFFEFFFFF ^ (*(_DWORD *)&v73[4 * ((v203 ^ HIBYTE(v335)) ^ 0x1F)]
                                          + 942873067) ^ ((v228 ^ 0xAAD19AA0 ^ v229) - 796462780 + v250);
  v255 = *(_DWORD *)&v68[4 * (BYTE2(v254) ^ 0x67)];
  HIDWORD(v256) = v255 ^ 0xB19B;
  LODWORD(v256) = v255 ^ 0xE9650000;
  v257 = (v256 >> 16) ^ *(_DWORD *)&v70[4 * (BYTE1(v245) ^ 0x8B)] ^ ((BYTE1(v245) ^ 6)
                                                                   + *(_DWORD *)(v22 - 128)
                                                                   + ((2 * (BYTE1(v245) ^ 6) + 386) & 0x21C ^ 0x6F7DDBFF));
  v258 = HIBYTE(v247);
  v259 = (*(_DWORD *)&v73[4 * (v247 ^ 0x88)] + 942873067) ^ *(_DWORD *)(v75
                                                                                       + 4 * (HIBYTE(v246) ^ 0xAD)) ^ (v257 - 1013111763 - ((2 * v257) & 0x873A485A));
  v260 = v253 - 35786952;
  if (((v253 - 719844591) & (v251 ^ 0xC39D242D)) != 0)
    v260 = 1403902230 - v253;
  v261 = (v251 ^ 0xA5246D41) - 684057639 + v260;
  v262 = (*(_DWORD *)&v73[4 * (v254 ^ 0x7D)] + 942873067) ^ v252 & 0xFFFBFFFF ^ ((BYTE1(v246) ^ 0xE7)
                                                                                                - 935243071) ^ v261;
  v263 = *(_DWORD *)(v22 - 136);
  v264 = (uint64_t)*(&off_24DCDB210 + v263 - 753);
  v265 = *(_DWORD *)(v264
                   + 4
                   * (((unsigned __int16)((*(_WORD *)&v73[4 * (v254 ^ 0x7D)] + 6635) ^ v252 ^ ((BYTE1(v246) ^ 0xE7) + 21185) ^ v261) >> 8) ^ 0xEu));
  HIDWORD(v331) = ((2 * v265) ^ 0x288BCA6A) - ((2 * ((2 * v265) ^ 0x288BCA6A)) & 0x7DE9CC60);
  v266 = (6606 - (((unsigned __int16)(2 * v265) ^ 0xCA6A) - ((2 * ((unsigned __int16)(2 * v265) ^ 0xCA6A)) & 0xCC60))) & 0x200;
  v267 = (v266 & v265) == 0;
  v268 = v266 | 0x652D3C80;
  v269 = (uint64_t)*(&off_24DCDB210 + (int)v325);
  v270 = *(_DWORD *)(v269 + 4 * ((v259 ^ BYTE1(v245)) ^ 0xE1u));
  *(_DWORD *)(v22 - 128) = v270;
  v271 = 173701376 - v268;
  if (v267)
    v271 = v268;
  LODWORD(v331) = v271;
  v272 = (2 * (v270 & 0x200000)) ^ 0x400000 | v270 & 0x200000;
  LODWORD(v333) = v270 >> 1;
  v267 = ((v272 + 2145386496) & ((v270 >> 1) ^ 0x25200000)) == 0;
  v273 = 2 * (v254 >> 8);
  v274 = ((v273 & 0x2C) + (BYTE1(v254) ^ 0xFFFFFF3E) - 1269540118) ^ 0xAC344B28;
  v275 = *(_DWORD *)&v68[4 * (BYTE2(v246) ^ 0xE4)];
  HIDWORD(v276) = v275 ^ 0xB19B;
  LODWORD(v276) = v275 ^ 0xE9650000;
  v277 = ((2 * v274) & 0x10C007B0) - v274 - 267340761;
  v278 = ((v277 ^ 0xE870A53F) - 1785959985 - ((2 * (v277 ^ 0xE870A53F) - 1870486142) & 0x9A962E1C)) ^ *(_DWORD *)&v70[4 * (v273 & 0x11A ^ 0xFFFFFFEF) + 568 + 4 * (v277 ^ 0xE870A53F)];
  v279 = *(_DWORD *)&v68[4 * (BYTE2(v245) ^ 0xD1)];
  v280 = (*(_DWORD *)&v73[4 * (v245 ^ 0xB8)] + 942873067) ^ *(_DWORD *)(v75
                                                                                       + 4 * (HIBYTE(v238) ^ 0x5A)) ^ v277 ^ ((v276 >> 16) - 1013111763 - ((2 * (v276 >> 16)) & 0x873A485A));
  HIDWORD(v276) = v279 ^ 0xB19B;
  LODWORD(v276) = v279 ^ 0xE9650000;
  v281 = ((v258 ^ 0x6E) - 1785959985 - ((2 * (v258 ^ 0x6E) - 1870486142) & 0x9082261C)) ^ *(_DWORD *)&v70[4 * (v258 ^ 0xE3)];
  v282 = *(_BYTE **)(v22 - 120);
  v283 = (*(_DWORD *)&v73[4 * (v246 ^ 0xC)] + 942873067) ^ *(_DWORD *)(v75 + 4
                                                                                            * (HIBYTE(v254) ^ 0x46)) ^ ((v276 >> 16) - 1013111763 - ((2 * (v276 >> 16)) & 0x873A485A)) ^ (v281 + 809827574 + (~(2 * v281) | 0x9F760615));
  v284 = *(_DWORD *)(v264 + 4 * (BYTE1(v283) ^ 0xD0u));
  v285 = v280 ^ (v278 - ((2 * v278) & 0xE28AFD9A) + 1900379853);
  v286 = *(_DWORD *)(v269 + 4 * ((v262 ^ BYTE1(v246)) ^ 0x94u));
  v287 = (char *)*(&off_24DCDB210 + SHIDWORD(v325)) - 12;
  v288 = *(_DWORD *)&v287[4 * (BYTE2(v259) ^ 0x83)];
  v289 = (uint64_t)*(&off_24DCDB210 + (v263 ^ 0x300));
  v290 = v288 ^ (v288 >> 4) & 0x4115653 ^ v284 ^ v286 ^ (((32 * v284) ^ 0xCCE2F5F0 ^ (16 * v284))
                                                       - ((2 * ((32 * v284) ^ 0xCCE2F5F0 ^ (16 * v284))) & 0xED8CFB80)
                                                       - 154763829) ^ (-57460168
                                                                     - 1912079979
                                                                     * *(_DWORD *)(v289 + 4 * (HIBYTE(v285) ^ 0xEB))) ^ (((v286 >> 1) & 0x3568D5FB ^ 0x2528D431) - 2 * (((v286 >> 1) & 0x3568D5FB ^ 0x2528D431) & 0x3040C53B ^ (v286 >> 1) & 8) + 1925696819);
  v291 = *(_DWORD *)&v287[4 * (BYTE2(v283) ^ 0xBF)];
  v292 = *(_DWORD *)(v269 + 4 * (v285 ^ 0xFu));
  v293 = (-57460168
        - 1912079979
        * *(_DWORD *)(v289
                    + 4 * ((BYTE3(v259) ^ 0x2C09D7BB) + 738842520 + ((v259 >> 23) & 0x12E ^ 0xA7EC50D9)))) ^ (v291 >> 4) & 0x4115653 ^ (v292 >> 1) & 0x3568D5FB;
  v294 = v293 ^ (16 * (((v265 ^ 0x445E535) + 181584768 + v271) ^ (HIDWORD(v331) + 1324672561) & 0xFFFFDFE)) ^ 0xCA76C570;
  v295 = (v294 - 2 * (v294 & 0x76622C7D ^ v293 & 8) - 161338251) ^ v291;
  v296 = v292 ^ v265 ^ ((v295 ^ 0xD9251225) - 2 * ((v295 ^ 0xD9251225) & 0x4AF4461B ^ v295 & 0x1A) - 889960959);
  v297 = *(_DWORD *)(v289 + 4 * (HIBYTE(v283) ^ 0x17));
  v298 = *(_DWORD *)&v287[4 * (BYTE2(v262) ^ 0x31)];
  v299 = *(_DWORD *)&v287[4 * (BYTE2(v285) ^ 0xC7)];
  v300 = *(_DWORD *)(v264 + 4 * (BYTE1(v285) ^ 0xB9u));
  v301 = *(_DWORD *)(v264 + 4 * (BYTE1(v259) ^ 0x89u));
  v302 = -1912079979 * *(_DWORD *)(v289 + 4 * (HIBYTE(v262) ^ 0x9E));
  v303 = *(_DWORD *)(v269 + 4 * ((v283 ^ v258) ^ 0xEDu));
  v304 = v301 ^ (32 * v301) ^ (16 * v301) ^ v303 ^ (((v303 >> 1) & 0x3568D5FB ^ 0x2528D431)
                                                  - ((2 * ((v303 >> 1) & 0x3568D5FB ^ 0x2528D431)) & 0x50A8F4)
                                                  + 178879610) ^ (v302
                                                                - 57460168
                                                                + (v299 ^ 0x2F576C11 ^ (v299 >> 4) & 0x4115653)
                                                                - 2
                                                                * ((v299 ^ 0x2F576C11 ^ (v299 >> 4) & 0x4115653) & (v302 + 2090023480)));
  v305 = (uint64_t)*(&off_24DCDB210 + v263 - 861);
  *v282 = *(_BYTE *)(v305 + (BYTE3(v290) ^ 0x4CLL)) ^ 0x14;
  v306 = (char *)*(&off_24DCDB210 + v263 - 822) - 12;
  v307 = v306[v304 ^ 0xALL];
  v282[15] = v307 ^ 0x69 ^ (((v307 >> 3) ^ 0x1B ^ ((~v307 & 0x80) >> 7)) - ((2 * ((v307 >> 3) ^ 0x1B)) & 0x18) - 84);
  v308 = (char *)*(&off_24DCDB210 + v263 - 782) - 8;
  v282[5] = (-3 * v308[(BYTE2(v296) ^ 0xAF) + 234 + ((v296 >> 15) & 0x1D2 ^ 0xFFFFFEAD)] + 83) ^ 0xFC;
  v309 = (32 * v300) ^ (16 * v300);
  v310 = v300 ^ 0x2758EF3A ^ v309;
  v309 ^= 0xCCE2F5F0;
  v311 = (v310 + v309 + 1) ^ ((v300 ^ 0xEBBA1ACA) + 1);
  v312 = (-57460168 - 1912079979 * v297) ^ (v298 >> 4) & 0x4115653 ^ ((v300 ^ 0x5AE983DA ^ (v311
                                                                                          - ((2 * v311) & 0x9D58CDDE)
                                                                                          + 1319921391))
                                                                    + v309);
  v282[13] = (-3 * v308[BYTE2(v304) ^ 0x35] + 83) ^ 0xAB;
  v313 = (v312 ^ 0x105241) - 2 * ((v312 ^ 0x105241) & 0x3213CAFF ^ v312 & 4);
  v314 = v272 + 1992345271;
  if (!v267)
    v314 = 1996539575 - v272;
  v315 = *(_DWORD *)(v22 - 128) & 0xFFDFFFFF ^ v298 ^ ((v333 & 0x3568D5FB ^ 0x2528D431) - 1994442423 + v314) ^ (v313 - 1307325701);
  v282[8] = *(_BYTE *)(v305 + (HIBYTE(v315) ^ 0x23)) ^ 0x6B;
  v282[4] = *(_BYTE *)(v305 + (BYTE3(v296) ^ 0x82)) ^ 0x67;
  v316 = v306[v296 ^ 0x65];
  v317 = (v316 >> 3) ^ ((~v316 & 0x80) >> 7) ^ 0x1B;
  v282[7] = v316 ^ 0x27 ^ (v317 - ((2 * v317) & 0xEF) - 73);
  v282[*(_QWORD *)(v22 - 168)] = (-3 * v308[BYTE2(v315) ^ 0x69] + 83) ^ 0xC3;
  v282[*(_QWORD *)(v22 - 152)] = *(_BYTE *)(v305 + (HIBYTE(v304) ^ 0x69)) ^ 0x26;
  v318 = v306[v315 ^ 0xB6];
  v319 = (v318 >> 3) ^ ((~v318 & 0x80) >> 7) ^ 0x1B;
  v282[*(_QWORD *)(v22 - 184)] = v318 ^ 0xF5 ^ (v319 + (~(2 * v319) | 0xD1) - 72);
  v320 = (char *)*(&off_24DCDB210 + (int)v324) - 8;
  v282[*(_QWORD *)(v22 - 160)] = ((BYTE1(v304) ^ 0xC0) - ((v304 >> 7) & 0x14) - 118) ^ 0x6D ^ v320[BYTE1(v304) ^ 0x1DLL];
  v321 = v306[v290 ^ 0x67];
  v322 = (v321 >> 3) ^ ((~v321 & 0x80) >> 7) ^ 0x1B;
  v282[3] = v321 ^ (v322 - ((2 * v322) & 0x16) - 117) ^ 0xDF;
  v282[*(_QWORD *)(v22 - 144)] = ((BYTE1(v296) ^ 0xF) - ((2 * (BYTE1(v296) ^ 0xF)) & 0x14) - 118) ^ 0xF5 ^ v320[BYTE1(v296) ^ 0xF7];
  v282[1] = (-3 * v308[BYTE2(v290) ^ 0xDBLL] + 83) ^ 0xB8;
  v282[10] = ((BYTE1(v315) ^ 0x58) - 2 * ((BYTE1(v315) ^ 0x58) & 0xF ^ BYTE1(v315) & 5) - 118) ^ v320[BYTE1(v315) ^ 9] ^ 0xDF;
  v282[*(_QWORD *)(v22 - 176)] = ((BYTE1(v290) ^ 0x95) - ((v290 >> 7) & 0x14) - 118) ^ v320[BYTE1(v290) ^ 0x24] ^ 1;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a21 + 8 * ((681 * (a20 > 0x10)) ^ (v263 - 478))) - 8))(103, v290, 20, 27, v296, 1525253082, 128, v259, a9, a10, a11, v324, v325, v326, v327, v328, v329, v330, a19,
           a20,
           a21,
           v331,
           v333,
           3,
           5);
}

void sub_21A58CCC4()
{
  JUMPOUT(0x21A589AD4);
}

uint64_t sub_21A58CCF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21,int a22)
{
  uint64_t v22;

  return ((uint64_t (*)(void))(*(_QWORD *)(v22
                                        + 8
                                        * (a21 ^ (306
                                                * (((2 * (a12 - ((2 * a22) & 0x34FB4F60) - 2002934484)) & 0xB6FEF4F6 ^ 0x34FA4460)
                                                 + ((a12 - ((2 * a22) & 0x34FB4F60) - 2002934484) ^ 0xC102DDCB)
                                                 - 268840172 != 1266240911))))
                            - 4))();
}

uint64_t sub_21A58CDD0(uint64_t a1, int a2)
{
  int v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((471
                                          * (((((v2 ^ 0x27) + 188) ^ ((a2 + v3 - 1535081083) < 8)) & 1) == 0)) ^ v2))
                            - 8))();
}

uint64_t sub_21A58CE58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  uint64_t v9;
  uint64_t v10;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(v10 + 8 * ((445 * ((int)a1 + a8 - 16 >= (((v8 ^ 0x144) + 22) ^ 0xFFFFFC36))) ^ v8))
                                                                                              - 4))(a1, a2, a3, v9, v8 ^ 0x144u, a6, v8 ^ 0x144u);
}

uint64_t sub_21A58CE9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _BOOL4 v30;
  int v32;

  v17 = (a2 + v14 + a1);
  v18 = v17 + a9 - 0x19BE288A5340C267 + 945;
  v19 = ((v9 - 22) ^ 0x3BF) & v17;
  v20 = v19 - v17;
  v21 = v12 + v19 - v17;
  v22 = v19 + 1;
  v23 = v12 + v19 + 1;
  v24 = v10 + v19 + 1 - v17;
  v25 = v10 + ((v9 - 857) ^ 0x6FLL) + v19;
  v26 = v11 + v20;
  v27 = v11 + v22;
  v28 = *(_QWORD *)(v16 - 120);
  v30 = v28 < v23 && v21 < v18;
  v32 = v28 < v25 && v24 < v18 || v30;
  if (v28 < v27 && v26 < v18)
    v32 = 1;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 + 8 * (v32 | v9)) - 12))(a1, a2, a3, v13);
}

uint64_t sub_21A58CF44()
{
  int v0;
  unsigned int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * ((663 * (((v1 < 0x10) ^ (v0 - 110)) & 1)) ^ v0)))();
}

uint64_t sub_21A58CF84(int a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  unsigned int v29;
  int8x16_t v30;
  int8x16_t v31;
  int8x16_t v32;
  int8x16x4_t v34;
  int8x16x4_t v35;

  *(_DWORD *)(v28 - 128) = v25 - 1;
  *(_DWORD *)(v28 - 136) = v25 + 14;
  *(_DWORD *)(v28 - 144) = v25 + 13;
  v34.val[1].i64[0] = ((_BYTE)v25 + 5) & 0xF;
  v34.val[1].i64[1] = ((_BYTE)v25 + 4) & 0xF;
  v34.val[2].i64[0] = ((_BYTE)v25 + 3) & 0xF;
  v34.val[2].i64[1] = ((_BYTE)v25 + 2) & 0xF;
  v34.val[3].i64[0] = ((_BYTE)v25 + 1) & 0xF;
  v34.val[3].i64[1] = v25 & 0xF;
  v29 = a2 + v26 + a1;
  v30.i64[0] = 0xE7E7E7E7E7E7E7E7;
  v30.i64[1] = 0xE7E7E7E7E7E7E7E7;
  v34.val[0].i64[0] = ((_BYTE)a2 + (_BYTE)v26 + (_BYTE)a1) & 0xF;
  v34.val[0].i64[1] = ((_BYTE)v25 + 6) & 0xF;
  v31.i64[0] = vqtbl4q_s8(v34, (int8x16_t)xmmword_21A5D5130).u64[0];
  v35.val[0].i64[1] = *(_DWORD *)(v28 - 136) & 0xF;
  v35.val[1].i64[1] = ((_BYTE)v25 + 12) & 0xF;
  v35.val[2].i64[1] = ((_BYTE)v25 + 10) & 0xF;
  v35.val[3].i64[1] = ((_BYTE)v25 + 8) & 0xF;
  v35.val[0].i64[0] = *(_DWORD *)(v28 - 128) & 0xF;
  v35.val[1].i64[0] = *(_DWORD *)(v28 - 144) & 0xF;
  v35.val[2].i64[0] = (v25 + 11) & 0xF;
  v35.val[3].i64[0] = ((_BYTE)v25 + 9) & 0xF;
  v31.i64[1] = vqtbl4q_s8(v35, (int8x16_t)xmmword_21A5D5130).u64[0];
  v32 = vrev64q_s8(vmulq_s8(v31, v30));
  *(int8x16_t *)(*(_QWORD *)(v28 - 120) - 15 + v29) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v24 + (v29 & 0xF) - 15), *(int8x16_t *)(*(_QWORD *)(v28 - 120) - 15 + v29)), veorq_s8(*(int8x16_t *)((v29 & 0xF) + v22 - 14), *(int8x16_t *)(v23 + (v29 & 0xF) - 15))), vextq_s8(v32, v32, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a21
                                        + 8
                                        * (((a5 - (v27 & 0xFFFFFFF0) == 928) | (8 * (a5 - (v27 & 0xFFFFFFF0) == 928))) ^ (v21 + 503)))
                            - 12))();
}

void sub_21A58D0FC()
{
  JUMPOUT(0x21A58D088);
}

uint64_t sub_21A58D104()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((8 * ((v0 - 157554677) & 0x96415FD ^ 0x1B) - 889) * (v1 == v2)) ^ (v0 - 74)))
                            - 4))();
}

uint64_t sub_21A58D14C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  int v4;
  char v5;
  int v6;
  uint64_t v7;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v7
                                                                      + 8
                                                                      * ((234 * ((v5 & 8) == (v3 ^ 0x298) - 757)) ^ v3)))(a1, a2, a3, (v4 - v6));
}

uint64_t sub_21A58D184(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  int v30;
  unsigned int v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  int8x16x4_t v36;

  *(_DWORD *)(v29 - 128) = a6;
  v30 = (a8 - 233) | 0xC0;
  *(_DWORD *)(v29 - 136) = v27;
  v31 = (v30 ^ 0xFFFFFD34) & v27;
  v32 = *(_QWORD *)(v29 - 120) - 7;
  *(_DWORD *)(v29 - 144) = v31;
  v33 = v25 + a2 + v26;
  v34 = (a2 + v26 + a1 - v28);
  v36.val[0].i64[0] = ((_BYTE)a2 + (_BYTE)v26 + (_BYTE)a1 - (_BYTE)v28) & 0xF;
  v36.val[0].i64[1] = (v33 - 49 - (_BYTE)v28) & 0xF;
  v36.val[1].i64[0] = (v33 - 50 - (_BYTE)v28) & 0xF;
  v36.val[1].i64[1] = (v33 - 51 - (_BYTE)v28) & 0xF;
  v36.val[2].i64[0] = (v33 + ((a8 + 23) | 0xC0) - (_BYTE)v28) & 0xF;
  v36.val[2].i64[1] = (v33 - 53 - (_BYTE)v28) & 0xF;
  v36.val[3].i64[0] = (v33 - 54 - (_BYTE)v28) & 0xF;
  v36.val[3].i64[1] = (v24 - (_BYTE)v28) & 0xF;
  *(int8x8_t *)(v32 + v34) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v23 + (v34 & 0xF) - 7), *(int8x8_t *)(v32 + v34)), veor_s8(*(int8x8_t *)((v34 & 0xF) + v21 - 6), *(int8x8_t *)(v22 + (v34 & 0xF) - 7))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v36, (int8x16_t)xmmword_21A5D5140), (int8x8_t)0xE7E7E7E7E7E7E7E7)));
  return (*(uint64_t (**)(__n128))(a21 + 8 * ((57 * (-v28 != 8 - v31)) ^ v30)))((__n128)xmmword_21A5D5140);
}

void sub_21A58D2BC()
{
  JUMPOUT(0x21A58D1F8);
}

uint64_t sub_21A58D2E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W8>)
{
  uint64_t v6;
  uint64_t v7;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(v6
                                                                                                + 8
                                                                                                * (((16 * (a6 ^ 0xBC) - 863)
                                                                                                  * (*(_DWORD *)(v7 - 136) == *(_DWORD *)(v7 - 144))) ^ a6)))(a1, a2, a3, a4, a5, *(unsigned int *)(v7 - 128), a6 ^ 0x337u);
}

uint64_t sub_21A58D324(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = (a4 - 1266241625);
  *(_BYTE *)(*(_QWORD *)(v11 - 120) + v12) ^= *(_BYTE *)(v9 + (v12 & 0xF)) ^ *(_BYTE *)((v12 & 0xF) + v7 + 1) ^ *(_BYTE *)(v8 + (v12 & 0xF)) ^ (-25 * (v12 & 0xF));
  return (*(uint64_t (**)(void))(v10 + 8 * ((263 * (a4 - 1 != a3)) ^ (a7 - 730))))();
}

void sub_21A58D38C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  uint64_t v7;

  if (a6 == 254547524)
    v6 = 1412947868;
  else
    v6 = 1412905844;
  *(_DWORD *)(v7 + 24) = v6;
}

uint64_t sub_21A58D3F0(uint64_t result)
{
  int v1;
  int v2;

  v1 = 1243413139;
  switch(*(_BYTE *)result - -97 * ((-2 - ((result | 0x47) + (~(_BYTE)result | 0xB8))) ^ 0x5F))
  {
    case 'y':
      v2 = 335544320;
      goto LABEL_6;
    case '|':
      v2 = 0x4000000;
      goto LABEL_6;
    case '~':
      v2 = -1744830464;
      goto LABEL_6;
    case '\x7F':
      v2 = -2113929216;
LABEL_6:
      if (*(_DWORD *)(*(_QWORD *)(result + 16) + 8) == v2)
        v1 = 1243455220;
      else
        v1 = 1243413139;
      break;
    default:
      break;
  }
  *(_DWORD *)(result + 8) = v1;
  return result;
}

void sub_21A58D48C(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_21A58D4DC()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  v2 = (*(uint64_t (**)(uint64_t))(v0 + 1856))(200) != 0;
  return (*(uint64_t (**)(void))(v1 + 8 * (((4 * v2) | (v2 << 9)) ^ 0x15Du)))();
}

uint64_t sub_21A58D514(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int v3;
  int v5;
  unsigned int v6;

  v5 = (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 8))(a1, 0);
  v6 = ((2 * v5) & 0xCDFCFFE2) + (v5 ^ 0x66FE7FF1);
  if (v6 == 1727954945)
  {
    v3 = 1924891652;
    goto LABEL_7;
  }
  if (v6 == 1727954941)
  {
LABEL_7:
    (*(void (**)(uint64_t))(v2 + 2192))(a1);
    return (-187770277 * v3 + 2108950119);
  }
  if (v6 != 1727954929)
  {
    v3 = 455917105;
    goto LABEL_7;
  }
  *v1 = a1;
  v3 = 1301247515;
  return (-187770277 * v3 + 2108950119);
}

void sub_21A58D5EC(uint64_t a1)
{
  int v1;
  int v2;
  BOOL v3;
  int v6;

  v1 = 107940961
     * (((a1 ^ 0x9BBF794D | 0x5E6DECAF) - (a1 ^ 0x9BBF794D) + ((a1 ^ 0x9BBF794D) & 0xA1921350)) ^ 0x8949D8AA);
  v2 = *(_DWORD *)(a1 + 16) ^ v1;
  if (*(_QWORD *)(a1 + 32))
    v3 = *(_QWORD *)(a1 + 48) == 0;
  else
    v3 = 1;
  v6 = v3 || *(_QWORD *)(a1 + 8) == 0x7927933B7E0E5133 || *(_DWORD *)a1 - v1 == 475611629;
  __asm { BR              X8 }
}

uint64_t sub_21A58D6EC(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  int v10;
  int v11;
  unsigned int v12;
  void (*v13)(uint64_t);
  unsigned int v14;

  v8 = (_QWORD *)(v7 - 128);
  v9 = *(_QWORD *)(a1 + 24) + 56 * **(unsigned __int8 **)(a1 + 24) + 24;
  v10 = v7 - 128;
  v11 = 158994259 * ((((v7 - 128) | 0x6C955C78) - (v7 - 128) + ((v7 - 128) & 0x936AA380)) ^ 0x43C9FE3F);
  *(_DWORD *)(v7 - 112) = v2 - v11 - 267;
  v8[1] = &STACK[0x2B8323D6202E2FDB];
  *(_WORD *)(v7 - 124) = v11 + 31120;
  *(_DWORD *)(v7 - 128) = v11 + 272067323;
  v8[3] = v9;
  (*(void (**)(uint64_t))(v3 + 8 * (v2 - 242)))(v7 - 128);
  v12 = 654962069 * ((v10 & 0xE9149E4D | ~(v10 | 0xE9149E4D)) ^ 0xF9BB61D5);
  *(_QWORD *)(v7 - 120) = v6;
  *(_QWORD *)(v7 - 112) = &STACK[0x2B8323D6202E2FDB];
  *(_DWORD *)(v7 - 104) = v2 - 136 - v12;
  *(_DWORD *)(v7 - 128) = 1650272445 - v12;
  v13 = *(void (**)(uint64_t))(v3 + 8 * (v2 - 119));
  v13(v7 - 128);
  v14 = 654962069 * ((((v10 | 0xD7324498) ^ 0xFFFFFFFE) - (~v10 | 0x28CDBB67)) ^ 0xC79DBB00);
  *(_QWORD *)(v7 - 120) = v4;
  *(_QWORD *)(v7 - 112) = &STACK[0x2B8323D6202E2FDB];
  *(_DWORD *)(v7 - 104) = v2 - 136 - v14;
  *(_DWORD *)(v7 - 128) = v5 - v14 + ((v2 - 121) ^ 0x4603E664);
  v13(v7 - 128);
  *(_DWORD *)(v7 - 112) = v2 + 1613850677 * (((v7 - 128) & 0xCA8A6BE3 | ~((v7 - 128) | 0xCA8A6BE3)) ^ 0x82EFA1B) - 298;
  *v8 = v1;
  *(_QWORD *)(v7 - 120) = &STACK[0x2B8323D6202E2FDB];
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3 + 8 * (v2 - 311)) - 8))(v7 - 128);
}

void sub_21A58D8FC(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  _BOOL4 v5;

  v1 = 369883897 * ((((2 * a1) | 0x979B245A) - a1 + 875720147) ^ 0xD7E6E819);
  v2 = *(_DWORD *)(a1 + 4) - v1;
  v3 = (unsigned __int16)(*(_WORD *)(a1 + 16) ^ v1);
  v5 = *(_QWORD *)(a1 + 8) != 0x30E6C4976802A926 && v3 != 17528;
  __asm { BR              X8 }
}

uint64_t sub_21A58D9DC()
{
  __int16 v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(_QWORD, uint64_t))(*(_QWORD *)(v2
                                                              + 8
                                                              * ((808 * (((v1 + 244) ^ 0x1F4) == 139)) ^ (v1 + 244)))
                                                  - 12))((unsigned __int16)(v0 - 17528), 500);
}

uint64_t sub_21A58DBF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  int v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  *v19 = 0x9908B0DF00000000;
  v21 = **(unsigned int **)(v17 + 8 * ((v16 + 11) & 0x395F5CAE));
  *(_DWORD *)(v20 - 144) = ((v16 + 61913908) ^ 0x6B) + 107940961 * a16;
  *(_DWORD *)(v20 - 136) = v16 + 61913908 - 107940961 * a16;
  *(_DWORD *)(v20 - 132) = 107940961 * a16;
  *(_DWORD *)(v20 - 116) = (v16 + 61913907) ^ (107940961 * a16);
  *(_DWORD *)(v20 - 120) = v16 + 11 - 107940961 * a16 + 83660582;
  v19[5] = -107940961 * a16;
  v19[3] = v21 - 107940961 * a16;
  v22 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v17 + 8 * (v16 - 113)) - 8))(v20 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18 + 8 * *(int *)(v20 - 140)) - 8))(v22);
}

uint64_t sub_21A58DCEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  char v17;
  int v18;
  uint64_t v19;
  unsigned int *v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  (*(void (**)(uint64_t))(v19 + 8 * (v18 + 82)))(a12);
  v22 = (*(uint64_t (**)(void))(v19 + 8 * SHIDWORD(a10)))();
  *v20 = v22;
  v23 = 1812433253 * ((v22 >> (((v18 + 106) | v17) + 19)) ^ v22) + 1;
  v20[1] = v23;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 8 * (v18 + 339)))(v23, v24, v25, v26, v27, v28, v29, v30, a9, a10, a11, a12, a13, a14, a15, a16, a17);
}

uint64_t sub_21A58DD64@<X0>(int a1@<W0>, int a2@<W4>, int a3@<W5>, unint64_t a4@<X6>, int a5@<W7>, unsigned int a6@<W8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, _QWORD *a19, int *a20)
{
  char v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  _BYTE *v27;
  unsigned int v28;
  unint64_t v29;

  v27 = (_BYTE *)(v25 + (a1 - 1));
  v28 = -299340727 * ((*(_DWORD *)(*a19 + (*a20 & a4)) ^ v27) & 0x7FFFFFFF);
  v29 = (v28 ^ HIWORD(v28)) * (((v21 + a2) & a3) - 299340877);
  LOBYTE(v29) = *(_BYTE *)(*(_QWORD *)(v22 + 8 * (v21 ^ a5)) + (v29 >> 24) - 8) ^ (a6 >> v20) ^ *(_BYTE *)(*(_QWORD *)(v22 + 8 * (v21 + 152)) + (v29 >> 24) - 12) ^ *(_BYTE *)((v29 >> 24) + *(_QWORD *)(v22 + 8 * (v21 ^ v23)) + 1) ^ v29 ^ (91 * (((v28 ^ HIWORD(v28)) * (((v21 + a2) & a3) - 299340877)) >> 24));
  *v27 = v29;
  return (*(uint64_t (**)(void))(v24 + 8 * (((a1 == (v29 != 0)) * v26) ^ v21)))();
}

void sub_21A58E5C8()
{
  JUMPOUT(0x21A58DBB8);
}

void sub_21A58E5D4()
{
  int v0;
  _DWORD *v1;

  *v1 = v0;
}

void sub_21A58E618(uint64_t a1)
{
  int v1;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 16) - 158994259 * ((-2 - ((a1 | 0x3DD7EC36) + (~(_DWORD)a1 | 0xC22813C9))) ^ 0xED74B18E);
  __asm { BR              X9 }
}

uint64_t sub_21A58E9D0@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,_DWORD *a28)
{
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = ((((a1 - 295) ^ 0x228) - 524) ^ 0x17u) & *a28;
  *(_BYTE *)(v28 + (v30 ^ 0x27)) = -55;
  return ((uint64_t (*)(void))(*(_QWORD *)(v29 + 8 * ((1142 * ((v30 ^ 0x27) > 0x37)) ^ (a1 - 295))) - 4))();
}

uint64_t sub_21A58EA34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38,unsigned int a39)
{
  int v39;
  int v40;
  uint64_t v41;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v41
                                                                                         + 8
                                                                                         * (((((v40 == 63) ^ v39 ^ 0x8B) & 1)
                                                                                           * (((4 * v39) ^ 0x8CC) + 132)) ^ v39))
                                                                             - 12))(76, 157, a3, a4, a39);
}

uint64_t sub_21A58EA7C()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((((((v1 - 282550403) & 0x10D75DEB) + 931) ^ (v1 + 214)) * ((v0 ^ 0x18u) < 8)) ^ v1))
                            - 4))();
}

uint64_t sub_21A58EAC8@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(a7 + v7) = v10;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9
                                        + 8
                                        * ((27
                                          * (((10 * (v8 ^ 0xCE)) ^ 0x6F ^ ((((10 * (v8 ^ 0x3CE)) ^ 0x3B6) & a1) == 8)) & 1)) ^ (10 * (v8 ^ 0x3CE))))
                            - 4))();
}

uint64_t sub_21A58EB2C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v6 + v8) = v10;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((((v5 ^ (v7 == v8)) & 1) * a4) ^ v4)) - 4))();
}

uint64_t sub_21A58EB58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (int)(v2 ^ (313 * (v1 == a1))))
                            - (v2 ^ 0x2FD)
                            - (v2 ^ 0xFFFFFFFFFFFFFD09)))();
}

uint64_t sub_21A58EBA0(int a1, int a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  *(_BYTE *)(v3 + v4 + v5 - 1) = v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((((unint64_t)(v3 + v4) < 0x40) * a2) ^ (v2 + 524)))
                            - (a1 ^ (2 * v2))
                            + 16))();
}

uint64_t sub_21A58EBD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,unint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  int v55;
  int v56;
  uint64_t v57;
  int v58;
  uint64_t (*v59)(uint64_t, _DWORD *, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  char *v61;
  uint64_t v62;
  _DWORD *v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  _BOOL4 v71;
  _BOOL4 v74;
  uint64_t v75;

  v59 = (uint64_t (*)(uint64_t, _DWORD *, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 + 8 * v55) + (v55 + 724) - 756);
  HIDWORD(a38) = a5;
  v61 = &a55 + a50;
  v75 = a50 + 320;
  v62 = *(unsigned int *)(a48 - 0x77E232005DB2DB60);
  v63 = (_DWORD *)(a48 - 0x77E232005DB2DB5CLL);
  v64 = *(_DWORD *)(a48 - 0x77E232005DB2DB5CLL);
  v65 = *(_DWORD *)(a48 - 0x77E232005DB2DB58);
  v66 = *(unsigned __int8 *)(a48 - 0x77E232005DB2DB4CLL) ^ 0x73;
  if (v66 == 2)
  {
    v74 = a37 < a40 + a50 && (unint64_t)v61 < a37 + 64;
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v57
                                                        + 8
                                                        * (int)(((((a3 + 610) | 0x140) - 968) * v74) | (a3 + 1096)))
                                            - 12))(v62);
  }
  else if (v66 == 1)
  {
    v67 = a3 + 332;
    v68 = a3 + 895;
    v69 = a3 + 322;
    v71 = a37 < a40 + a50 && (unint64_t)v61 < a37 + 64;
    return (*(uint64_t (**)(uint64_t))(v57 + 8 * (int)((((v68 ^ 0xFFFFFD0D) + v67) * v71) ^ v69)))(v62);
  }
  else
  {
    *(_DWORD *)(a48 - 0x77E232005DB2DB64) = 2 * (*(_DWORD *)(a48 - 0x77E232005DB2DB64) ^ v58)
                                            + v58
                                            - (v56 & (4 * (*(_DWORD *)(a48 - 0x77E232005DB2DB64) ^ v58)));
    *(_DWORD *)(a48 - 0x77E232005DB2DB60) = (*(_DWORD *)(a48 - 0x77E232005DB2DB60) ^ v58)
                                            + (v62 ^ v58)
                                            + v58
                                            - (v56 & (2 * ((*(_DWORD *)(a48 - 0x77E232005DB2DB60) ^ v58) + (v62 ^ v58))));
    *v63 = (*v63 ^ v58) + (v64 ^ v58) + v58 - (v56 & (2 * ((*v63 ^ v58) + (v64 ^ v58))));
    *(_DWORD *)(a48 - 0x77E232005DB2DB58) = (*(_DWORD *)(a48 - 0x77E232005DB2DB58) ^ v58)
                                            + (v65 ^ v58)
                                            + v58
                                            - (v56 & (2 * ((*(_DWORD *)(a48 - 0x77E232005DB2DB58) ^ v58) + (v65 ^ v58))));
    return v59(v62, v63, a3, a37, v75 - 320, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30,
             a31,
             a32,
             a33,
             a34,
             a35,
             a36,
             a37,
             a38,
             a39,
             a40,
             a7,
             a42);
  }
}

uint64_t sub_21A59039C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44,unsigned int a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,int a50,int a51)
{
  uint64_t v51;
  BOOL v52;

  if (a45 < 0xD8B753AF != (a51 - 2057269332) < 0xD8B753AF)
    v52 = (a51 - 2057269332) < 0xD8B753AF;
  else
    v52 = a51 - 2057269332 > a45;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v51 + 8 * ((1479 * (((a3 - 40) ^ 0x57 ^ v52) & 1)) ^ ((int)a3 + 379))) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41);
}

void sub_21A590430()
{
  JUMPOUT(0x21A58F6F4);
}

uint64_t sub_21A590464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38,int a39)
{
  int v39;
  int v40;
  uint64_t v41;
  _BOOL4 v42;

  v42 = v39 + 903027127 < (a39 - 2101675353);
  if ((a39 - 2101675353) < 0x8929DDFA != (v39 + 903027127) < 0x8929DDFA)
    v42 = (a39 - 2101675353) < 0x8929DDFA;
  return ((uint64_t (*)(void))(*(_QWORD *)(v41 + 8 * ((v42 * (v40 - 796)) ^ v40)) - ((20 * (v40 ^ 0x355u)) ^ 0x20)))();
}

uint64_t sub_21A5904E8@<X0>(unsigned int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, int a5@<W5>, uint64_t a6@<X6>, unsigned int a7@<W8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47)
{
  int v47;
  int v48;
  int v49;
  int v50;
  uint64_t v51;
  int v52;
  _BOOL4 v53;
  unsigned int v54;
  int v55;
  _BOOL4 v56;

  v52 = v49 - 376;
  v53 = a7 < a1;
  *(_BYTE *)(a47 - 0x77E232005DB2DBACLL + (v47 + v50)) = *(_BYTE *)(a6
                                                                                + (a3 ^ (8 * v52))
                                                                                + a5
                                                                                + v48);
  v54 = v48 + 1 + a2;
  v55 = v53 ^ (v54 < a1);
  v56 = v54 < a7;
  if (!v55)
    v53 = v56;
  return ((uint64_t (*)(void))(*(_QWORD *)(v51 + 8 * ((!v53 * a4) ^ v52)) - 8))();
}

void sub_21A590560()
{
  JUMPOUT(0x21A590504);
}

uint64_t sub_21A590568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t (*a36)(uint64_t),uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48)
{
  int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;

  v50 = 1613850677 * ((344379451 - ((v49 - 136) | 0x1486D03B) + ((v49 - 136) | 0xEB792FC4)) ^ 0xD62241C3);
  *(_QWORD *)(v49 - 136) = a48;
  *(_DWORD *)(v49 - 128) = (v48 + 567) ^ v50;
  *(_DWORD *)(v49 - 124) = (a5 + 1586887057) ^ v50;
  v51 = sub_21A5A4A54(v49 - 136);
  return a36(v51);
}

uint64_t sub_21A5905E8@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X3>, int a4@<W4>, uint64_t a5@<X6>, int a6@<W8>)
{
  int v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(a1 + (v6 + a2)) = *(_BYTE *)(v8 + a5 + a3);
  return (*(uint64_t (**)(void))(v7 + 8 * ((((a2 + v6 + 1) < 0x40) * ((a6 - 779) ^ a4)) ^ (a6 - 335))))();
}

void sub_21A59062C()
{
  JUMPOUT(0x21A5905ECLL);
}

void IPaI1oem5iL()
{
  _DWORD v0[6];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[0] = -1128011312 - 369883897 * ((v0 - 1998917621 - 2 * (v0 & 0x88DAF00B)) ^ 0x94F18A3F);
  sub_21A5C9434(v0);
  __asm { BR              X9 }
}

uint64_t sub_21A590724@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))(a1 + 8 * ((1353 * (v1 != 0)) ^ 0x132u)))();
}

uint64_t sub_21A59074C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v6;
  uint64_t v7;
  unsigned int v8;

  v2 = v0 ^ 0x57D3F24FED7A9E94;
  v3 = *(_QWORD *)(v2 - 0x57D3F24FED7A9E8CLL);
  v8 = 888531001 * (&v6 ^ 0x54D1B964) + 931;
  v7 = v3;
  sub_21A58303C((uint64_t)&v6);
  v4 = v6;
  (*(void (**)(uint64_t))(v1 + 2192))(v2 - 0x57D3F24FED7A9E94);
  return (v4 - 1412947868);
}

void sub_21A590800(uint64_t a1)
{
  int v1;
  BOOL v2;
  int v3;

  if (*(_QWORD *)(a1 + 24))
    v2 = *(_QWORD *)(a1 + 8) == 0;
  else
    v2 = 1;
  v3 = !v2;
  v1 = *(_DWORD *)a1 + 1288161731 * (((a1 | 0x320E4177) - (a1 & 0x320E4177)) ^ 0xE8040081);
  __asm { BR              X8 }
}

uint64_t sub_21A5908AC(uint64_t result)
{
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  unint64_t *v6;
  int v7;
  uint64_t v8;

  v8 = *(_QWORD *)(result + 16);
  if (*(_BYTE *)(v8 + 131) == 1)
  {
    v4 = v2 - 328;
    v7 = 386855771
       * ((-247543785 - ((v3 - 136) ^ 0x4DED1A95 | 0xF13EC817) + ((v3 - 136) ^ 0x4DED1A95 | 0xEC137E8)) ^ 0x9AA625D9);
    *(_DWORD *)(v3 - 136) = v7 + v2 + 225840440;
    *(_DWORD *)(v3 - 132) = 1334452852 - v7;
    v6 = (unint64_t *)(v3 + 0x77E232005DB2DAC0);
    *(_QWORD *)(v3 - 120) = v3 + 0x77E232005DB2DAC0;
    sub_21A598234(v3 - 136);
LABEL_5:
    __asm { BR              X13 }
  }
  if (!*(_BYTE *)(v8 + 131))
  {
    v4 = v2 - 328;
    v5 = 386855771 * ((-1897065205 - ((v3 - 136) | 0x8EED150B) + ((v3 - 136) | 0x7112EAF4)) ^ 0xA898E250);
    v6 = &STACK[0x77E232005DB2D8A8];
    *(_QWORD *)(v3 - 120) = &STACK[0x77E232005DB2D8A8];
    *(_DWORD *)(v3 - 136) = v5 + v2 + 225840440;
    *(_DWORD *)(v3 - 132) = 1334452852 - v5;
    sub_21A598234(v3 - 136);
    goto LABEL_5;
  }
  return result;
}

void sub_21A593134(uint64_t a1)
{
  int v1;
  BOOL v2;
  int v3;

  if (*(_QWORD *)(a1 + 8))
    v2 = *(_QWORD *)(a1 + 16) == 0;
  else
    v2 = 1;
  v3 = !v2;
  v1 = *(_DWORD *)(a1 + 48) ^ (654962069 * ((a1 - 2 * (a1 & 0x2B94A4C6) + 731161798) ^ 0xC4C4A4A1));
  __asm { BR              X11 }
}

uint64_t sub_21A5931F4()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  int v5;

  if (*(_QWORD *)(v2 + 32))
    v4 = *(_DWORD *)v2 + v1 == 1421083762;
  else
    v4 = 1;
  v5 = !v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((8 * v5) | (v5 << 6)) ^ v0))
                            - ((v0 - 1384610206) & 0x528777BF)
                            + 439))();
}

uint64_t sub_21A593248()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  int v12;
  uint64_t v13;

  v8 = *(_QWORD *)(v1 + 40) + 56 * **(unsigned __int8 **)(v1 + 40) + 24;
  v9 = 158994259 * ((2 * ((v7 - 128) & 0x5DF17C98) - (v7 - 128) + 571376483) ^ 0xD522124);
  *(_QWORD *)(v7 - 120) = &STACK[0x2B8323D6202E3117];
  *(_QWORD *)(v7 - 104) = v8;
  *(_DWORD *)(v7 - 112) = v3 - v9 - 393;
  *(_DWORD *)(v7 - 128) = v9 + 272067323;
  *(_WORD *)(v7 - 124) = 3923 * ((2 * ((v7 - 128) & 0x7C98) - (v7 - 128) - 31901) ^ 0x2124) + 31120;
  (*(void (**)(uint64_t))(v0 + 8 * (int)(v3 - 368)))(v7 - 128);
  v10 = 654962069 * ((v7 + 318029280 - 2 * ((v7 - 128) & 0x12F4BE60)) ^ 0xFDA4BE07);
  *(_QWORD *)(v7 - 120) = v5;
  *(_QWORD *)(v7 - 112) = &STACK[0x2B8323D6202E3117];
  *(_DWORD *)(v7 - 128) = 1650272445 - v10;
  *(_DWORD *)(v7 - 104) = v3 - 262 - v10;
  v11 = (void (*)(uint64_t))*(&off_24DCDB210 + (int)(v3 - 245));
  v11(v7 - 128);
  v12 = 654962069 * ((2 * ((v7 - 128) & 0x49F51868) - (v7 - 128) - 1240799337) ^ 0x595AE7F0);
  *(_DWORD *)(v7 - 128) = v6 - v12 + 229188647;
  *(_QWORD *)(v7 - 120) = v4;
  *(_QWORD *)(v7 - 112) = &STACK[0x2B8323D6202E3117];
  *(_DWORD *)(v7 - 104) = v3 - 262 - v12;
  v11(v7 - 128);
  *(_QWORD *)(v7 - 128) = &STACK[0x2B8323D6202E3117];
  *(_QWORD *)(v7 - 120) = v7 - 148;
  *(_DWORD *)(v7 - 112) = v3 + 158994259 * ((v7 + 2046629783 - 2 * ((v7 - 128) & 0x79FD1817)) ^ 0x56A1BA50) - 407;
  v13 = ((uint64_t (*)(uint64_t))*(&off_24DCDB210 + (v3 ^ 0x1AB)))(v7 - 128);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * v3) - 12))(v13);
}

void sub_21A593484()
{
  JUMPOUT(0x21A593430);
}

void sub_21A59348C()
{
  int v0;
  uint64_t v1;
  int v2;

  v2 = (v0 >> 4) ^ 7 | v0 ^ 0x7C;
  *(_DWORD *)(v1 + 24) = -42084 * (v2 & 1 | ((v2 & 4) != 0) | (((v2 | ((v2 & 0xFC) >> 2)) & 2) != 0))
                       + 1412947868;
}

void Mib5yocT()
{
  _DWORD v0[18];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[0] = -1128011312
        - 369883897
        * (((v0 | 0x7BCA4414) - v0 + (v0 & 0x8435BBE8)) ^ 0x67E13E20);
  sub_21A5C9434(v0);
  __asm { BR              X9 }
}

uint64_t sub_21A5935D4()
{
  uint64_t v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((2 * (v0 != 0)) | (16 * (v0 != 0)) | 0x2E4u)) - 8))();
}

uint64_t sub_21A593608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  char v27;

  v23 = *(_QWORD *)((v21 ^ 0x57D3F24FED7A9E94) - 0x57D3F24FED7A9E8CLL);
  if (v20)
    v24 = v23 == 0x1EE13A8875B3537ELL;
  else
    v24 = 1;
  v27 = v24 || a19 == 0 || v19 == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v22 + 8 * ((74 * ((v27 ^ 0x3D) & 1)) ^ 0x43D)) - 4))();
}

uint64_t sub_21A59368C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * ((((227 * (v0 ^ 0x1D4) - 6) ^ (97 * (v0 ^ 0x1D3))) * (v1 != 0)) ^ v0)))();
}

uint64_t sub_21A5936DC@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((((a1 - 1698910216) & 0x65434FE5) + 442) * (*(_BYTE *)(v1 + 5) == 1)) ^ a1))
                            - 12))();
}

uint64_t sub_21A59371C()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((119 * ((((v0 - 70) ^ (*(_BYTE *)(v1 + 7) == 0)) & 1) == 0)) ^ v0))
                            - 8))();
}

uint64_t sub_21A593750()
{
  _BYTE *v0;
  int v1;
  uint64_t v2;

  *v0 = -1;
  return (*(unsigned __int8 *)(v2 + 7) ^ ((((v1 ^ 0x98) - 21091047) & 0xFFFBFF3F) + 2131079614))
       + ((2 * *(unsigned __int8 *)(v2 + 7)) & 0xBBBB)
       - 696778817
       - 1412947868;
}

void sub_21A594C40(uint64_t a1)
{
  int v1;
  _BOOL4 v4;

  v4 = *(_QWORD *)(a1 + 40) != 0x1EE13A8875B3537ELL && *(_QWORD *)(a1 + 24) != 0 && *(_QWORD *)(a1 + 8) != 0;
  v1 = *(_DWORD *)(a1 + 16) ^ (158994259 * (((a1 | 0xFF272D0B) - (a1 | 0xD8D2F4) + 14209780) ^ 0xD07B8F4C));
  __asm { BR              X12 }
}

uint64_t sub_21A594D34()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  int v5;

  if (*(_QWORD *)v2)
    v4 = (*(_DWORD *)(v2 + 48) ^ v1) == 34918805;
  else
    v4 = 1;
  v5 = !v4;
  return (*(uint64_t (**)(void))(v3 + 8 * ((585 * v5) ^ v0)))();
}

uint64_t sub_21A594D6C()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((*(unsigned __int8 *)(v0 - 0x1EE13A8875B3537DLL) != ((50 * (v1 ^ 0x99) + 55) ^ 0xF9))
                                * ((5 * ((50 * (v1 ^ 0x99)) ^ 0x7B)) ^ 0x64)) ^ (50 * (v1 ^ 0x99)))))();
}

uint64_t sub_21A594DD0()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v1 + 8 * (((*(_BYTE *)(v2 + 5) == 2) * (((v0 - 83) | 0x411) - 1106)) ^ v0)))();
}

uint64_t sub_21A594E04()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  _BOOL4 v3;

  v3 = *(unsigned __int8 *)(v2 + 12) <= ((5 * (v0 ^ 0x46)) ^ 0x9Au);
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (((8 * v3) | (32 * v3)) ^ v0)) - 31 * (v0 ^ 0x45Cu) + 143))();
}

uint64_t sub_21A594E5C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((1082 * (*(unsigned __int8 *)(v2 + 6) == ((15 * (v0 ^ 0x80)) ^ 0x94))) ^ v0)))();
}

uint64_t sub_21A594E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned int a13, uint64_t a14, uint64_t a15, int a16, int a17, uint64_t a18, uint64_t a19)
{
  unsigned __int8 *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int v27;

  v27 = bswap32(*(_DWORD *)(v21 + 32));
  v24 = 369883897 * ((2 * (&a13 & 0x12127968) - &a13 + 1844283026) ^ 0x71C6FCA6);
  a14 = (uint64_t)&v19[56 * *v19 + 0x7E951D330E1DA322];
  a15 = v21 + 56;
  a17 = v24 + v22 + 341;
  a13 = (((v27 << ((v22 + 6) ^ 0x9A)) & 0xEF3DF7A0) + (v27 & 0xFFFFFFF0 ^ 0xF79EFBDF) + 1600378110) ^ v24;
  a18 = v21 + 16;
  a19 = v21 + 56;
  v25 = ((uint64_t (*)(unsigned int *))(*(_QWORD *)(v23 + 8 * (v22 ^ 0x1EA)) - 12))(&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v20 + 8 * ((602 * (a16 == 1412947868)) ^ v22)) - 4))(v25);
}

uint64_t sub_21A594FB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11, int a12, int a13, uint64_t a14, unsigned int a15, uint64_t a16, uint64_t a17, int a18, char a19, uint64_t a20,uint64_t a21,int a22)
{
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;

  v27 = 654962069 * ((&a15 - 2 * ((unint64_t)&a15 & 0x8AF566E) + 145708654) ^ 0xE7FF5609);
  a22 = (v25 + 520) ^ v27;
  a19 = -107 * ((&a15 - 2 * ((unint64_t)&a15 & 0x8AF566E) + 110) ^ 9) - 106;
  a15 = (a13 ^ 0x77FF36FE) - v27 + ((v25 - 720943066) & 0x2AF8B6DF ^ 0xDCB4CDEF) + (a10 & 0xEFFE6DFC);
  a20 = v24 + 36;
  a21 = v22;
  a16 = v24;
  a17 = a11;
  v28 = ((uint64_t (*)(unsigned int *))(*(_QWORD *)(v26 + 8 * (v25 - 348)) - 4))(&a15);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v23 + 8 * ((985 * (a18 == 1412947868)) ^ v25)) - 4))(v28);
}

uint64_t sub_21A5950A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12)
{
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v17 = (*(uint64_t (**)(_QWORD))(v16 + 8 * (v14 - 173)))(a12 - *(unsigned __int8 *)(v13 + 14));
  *v15 = v17;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v12 + 8 * (((v17 != 0) * (((v14 - 386) | 0x88) ^ 0x93)) | v14))
                                          - 4))(v17);
}

uint64_t sub_21A5950FC()
{
  int v0;
  uint64_t v1;
  int v2;
  _DWORD *v3;

  *v3 = v0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((v2 + 69) ^ (43
                                                      * (((31 * ((v2 + 69) ^ 0x1DF)) ^ 0xA9322193 ^ ((v0 - ((2 * v0) & 0xA9F2E908) - 721849212) << ((v2 + 106) & 0x1C ^ 0x1D)) & 0xED36376E)
                                                       + ((v0 - ((2 * v0) & 0xA9F2E908) - 721849212) ^ 0xA2626F33)
                                                       - 1410470802 == 579405861))))
                            - 4))();
}

uint64_t sub_21A5951C8()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((44 * ((((v3 + v0) < 2) ^ (v1 + 20)) & 1)) ^ (v1 + 242)))
                            - 4))();
}

uint64_t sub_21A595524(char a1)
{
  uint64_t v1;
  int v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v7 = v4 + a1 + v3;
  *(_BYTE *)(v1 + v6 - 1) = ((v7 - 116) ^ 0xBA) * (v7 - 99);
  *(_BYTE *)(v1 + v6 - 2) = ((v7 + ((v2 - 15) | 1)) ^ 0xBA) * (v7 - 98);
  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * (((2 * ((v1 & 0xFFFFFFFE) == 2)) | (((v1 & 0xFFFFFFFE) == 2) << 7)) ^ (v2 + 120)))
                            - 12))();
}

void sub_21A5955B0()
{
  JUMPOUT(0x21A59555CLL);
}

uint64_t sub_21A5955BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * (int)(((23 * (a5 ^ 0x1A4) + ((a5 - 242) ^ 0xFFFFFCF2)) * (v6 == v5)) ^ a5))
                            - 4))();
}

uint64_t sub_21A5955FC()
{
  char v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = v1 - 1;
  *(_BYTE *)(v4 + v5) = ((v0 - 28) ^ 0xBA) * (v0 - 11);
  return (*(uint64_t (**)(void))(v3 + 8 * ((820 * (v5 != 0)) ^ ((v2 - 805) | 0x11))))();
}

uint64_t sub_21A595640()
{
  char v0;
  uint64_t v1;
  int v2;
  char v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = v1 - 1;
  *(_BYTE *)(v6 + v7) = ((v0 - 28) ^ v3) * (v0 - 11);
  return (*(uint64_t (**)(void))(v5 + 8 * (((v7 != 0) * v4) ^ v2)))();
}

void sub_21A595670(int a1@<W8>)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 32) = a1;
}

void sub_21A5956B0(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(a1 + 36) + 1613850677 * ((-2 - ((~(_DWORD)a1 | 0xB776DF11) + (a1 | 0x488920EE))) ^ 0x8A2DB116);
  v2 = *(_QWORD *)((char *)*(&off_24DCDB210 + v1 - 1069)
                 + 8 * ((29 * (((uint64_t (*)(uint64_t))*(&off_24DCDB210 + v1 - 897))(12) != 0)) ^ v1)
                 - 12)
     - 12;
  __asm { BR              X8 }
}

uint64_t sub_21A59576C(uint64_t result)
{
  uint64_t v1;
  char v2;
  int v3;
  int v4;
  char v5;
  char v6;
  _DWORD *v7;
  _QWORD *v8;

  v4 = *(_DWORD *)(v1 + 4);
  v5 = *(_BYTE *)(v1 + 32);
  v6 = *(_BYTE *)v1 ^ v2;
  v7 = *(_DWORD **)(v1 + 8);
  v8 = *(_QWORD **)(v1 + 24);
  *(_BYTE *)(result + 4) = v2 ^ *(_BYTE *)(v1 + 16) ^ 0x3E;
  *(_BYTE *)(result + 5) = v6 - 46;
  *(_BYTE *)(result + 6) = v2 + v5 - 43;
  *(_BYTE *)(result + 7) = v4 ^ 0x74 ^ v2;
  *(_DWORD *)(result + 8) = 0;
  *v8 = result;
  *v7 = v3;
  return result;
}

void sub_21A5957D8(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) + 158994259 * ((2 * (a1 & 0xEBCAFF6A) - a1 + 339017877) ^ 0x3B69A2D2);
  __asm { BR              X9 }
}

uint64_t sub_21A5958AC@<X0>(uint64_t a1@<X0>, __int16 a2@<W8>)
{
  int v2;
  uint64_t v3;
  int v4;

  v4 = (unsigned __int16)(*(_WORD *)(a1 + 4) - a2) == 31100;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((16 * v4) | (v4 << 6)) ^ v2)) - 12))();
}

uint64_t sub_21A5958F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X7>, int a3@<W8>, uint64_t a4)
{
  __int16 v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v7 = *(_QWORD *)(a1 + 8);
  v8 = (*(_DWORD *)a1 - a3);
  LODWORD(v10) = -552069206 - 2016613906 * v8;
  HIDWORD(v10) = v8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t *))(*(_QWORD *)(v6 + 8 * ((164 * ((unsigned __int16)(v4 - 31194 + (v5 ^ 0x23C)) < 0xFFBFu)) ^ v5)) - (v5 + 601) + 1138))(v8, 3286659936, 2668905706, 3117934593, 225841294, v7, v5 ^ 0x23Cu, a2, a4, v7, v10, &STACK[0x77E232005DB2DC68]);
}

uint64_t sub_21A5959F4(int a1, int a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,unsigned int a21)
{
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  int v32;
  uint64_t v34;
  int v35;
  int v36[4];

  v29 = (v21 | (v22 << 16)) + 1324253363;
  v30 = ((v28 - 120) ^ 0xD98A08A4) * v26;
  *(_QWORD *)(v28 - 104) = v25;
  *(_DWORD *)(v28 - 120) = a5 + v30 + a7 + 25;
  *(_DWORD *)(v28 - 116) = v24 - v30 - (v23 & a3) + (((a7 - 1794724486) & 0x6AF953FF) + a2) * a1;
  v36[0] = (a7 - 1794724486) & 0x6AF953FF;
  v34 = v25;
  v35 = v29;
  v31 = sub_21A598234(v28 - 120);
  v32 = *(_DWORD *)(v34 - 0x77E232005DB2DB68) & (((v36[0] + 369) | 0xC4) ^ 0x3F3);
  return ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v27
                                                              + 8
                                                              * ((41
                                                                * (v35
                                                                 + 1050750610
                                                                 + ((2 * v32) ^ 0x4E)
                                                                 + (v32 ^ 0x726FD6D8u) > 0xFFFFFFBF)) ^ v36[0]))
                                                  - 12))(v31, a21);
}

uint64_t sub_21A596DF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15)
{
  int v15;
  uint64_t v16;
  int v17;

  v17 = v15 - 302514577 < a5 + 411097595;
  if (a5 < ((a15 + 1558314763) & 0xA31E00FB) + 1324284244 != (v15 - 302514577) < 0x676FD42A)
    v17 = a5 < ((a15 + 1558314763) & 0xA31E00FB) + 1324284244;
  return ((uint64_t (*)(void))(*(_QWORD *)(v16 + 8 * ((2 * v17) | (v17 << 9) | a15)) - 8))();
}

uint64_t sub_21A596E88(int a1, int a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  _BOOL4 v17;

  v14 = (v10 + 502540034) & 0xE20BD8F6;
  *(_BYTE *)(v13 - 0x77E232005DB2DBACLL + v14 - 158 + a2 + v11) = *(_BYTE *)(a7 + (v9 - 2037896635));
  v15 = v9 + 1 + a1;
  v16 = (a5 < v8) ^ (v15 < a3);
  v17 = v15 < v7;
  if (v16)
    v17 = a5 < v8;
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * (int)((15 * v17) ^ v14)) - 8))();
}

void sub_21A596F18()
{
  JUMPOUT(0x21A596EB8);
}

uint64_t sub_21A596F24@<X0>(int a1@<W4>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(uint64_t, _QWORD), uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, unsigned int a15)
{
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v17 = 1613850677 * ((v15 - 120) ^ 0x3D5B6E07);
  *(_QWORD *)(v15 - 120) = v16;
  *(_DWORD *)(v15 - 112) = (a2 + 553) ^ v17;
  *(_DWORD *)(v15 - 108) = (a1 + 370533045) ^ v17;
  v18 = sub_21A5A4A54(v15 - 120);
  return a8(v18, a15);
}

uint64_t sub_21A596FB0()
{
  int v0;
  int v1;
  int v2;
  int v3;
  uint64_t v4;
  unsigned int v5;

  v5 = v1 - 1919932158;
  if (v5 <= 0x40)
    v5 = 64;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1919932158 - v2 - v3 + v0 - 869 + ((v0 - 754461933) & 0x2CF829FD) + v5 - 324 < 0xF) | v0))
                            - 12))();
}

uint64_t sub_21A597054(unsigned int a1)
{
  unsigned int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  unsigned int v8;

  v7 = v3 + v2;
  v8 = v3 + v2 + v1 - 1919932379;
  if (v8 <= 0x40)
    v8 = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((52 * (1919932158 - v7 < v4 + 1919932158 + v5 + v8)) ^ v1))
                            - (((v1 - 152) | 0x292) ^ 0x2DFLL)))();
}

uint64_t sub_21A5970C8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, _OWORD *a7)
{
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  *(_OWORD *)(a3 + v8 + ((v7 - 593) ^ (a4 + 134))) = *a7;
  return (*(uint64_t (**)(void))(v10 + 8 * ((1689 * (((v9 + 1) & 0x1FFFFFFF0) == 16)) ^ v7)))();
}

void sub_21A59711C()
{
  JUMPOUT(0x21A5970F0);
}

uint64_t sub_21A597128()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8 * ((111 * (((v0 == v1) ^ (v2 - 108) ^ 0x7D) & 1)) ^ v2))
                            - 8))();
}

void sub_21A597164()
{
  JUMPOUT(0x21A597190);
}

uint64_t sub_21A597310(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unsigned __int8 *v11;

  v11 = (unsigned __int8 *)(a3 + v6 + v9);
  LODWORD(v11) = *v11 ^ a4 | ((v11[1] ^ a4) << 8) | ((v11[2] ^ (((2 * v4) ^ 0x16) + 19)) << 16) | ((v11[3] ^ a4) << 24);
  *(_DWORD *)(v5 + ((v6 + v9) & 0xFFFFFFFFFFFFFFFCLL)) = (_DWORD)v11 + v7 - (v10 & (2 * (_DWORD)v11));
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((925 * ((unint64_t)(v6 + 4 + v9) > 0x3F)) ^ v4)) - 8))();
}

uint64_t sub_21A597400(int8x16_t a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47)
{
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint8x16_t v53;
  uint64_t v62;
  _DWORD *v63;
  int v64;
  uint64_t v65;
  int v66;
  int v67;
  unint64_t v68;
  uint64_t v69;
  int8x16x4_t v71;

  v71 = vld4q_s8(a4);
  v53 = (uint8x16_t)veorq_s8(v71.val[1], a1);
  _Q20 = vmovl_u8(*(uint8x8_t *)v53.i8);
  _Q19 = vmovl_high_u8(v53);
  __asm
  {
    SHLL2           V21.4S, V19.8H, #0x10
    SHLL2           V22.4S, V20.8H, #0x10
  }
  v62 = ((HIDWORD(a18) ^ 0x22D) + 26) | 8u;
  v63 = (_DWORD *)(v47 + 4 * (v52 + 16 + v50));
  v64 = *(_DWORD *)(v47 + 4 * ((v62 ^ (v50 + 48)) + v52 + 16)) ^ *(v63 - 3);
  v65 = *(v63 - 16);
  v66 = v65 ^ *(v63 - 14) ^ (v64 + v48 - (v51 & (2 * v64)));
  HIDWORD(v68) = v66 ^ v48;
  LODWORD(v68) = v66;
  v67 = v68 >> 31;
  v69 = v51 & (2 * v67);
  *v63 = v67 + v48 - v69;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 + 8 * ((2042 * (v52 + 17 != v52 + 80)) ^ ((HIDWORD(a18) ^ 0x22D) + 952))) - 4))(2042, v69, v62, a5, v65, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47);
}

uint64_t sub_21A597628(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((212 * (v3 + 1 != v5 + 20)) ^ a3)) - 8))();
}

uint64_t sub_21A5976E8(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (a3 | (32 * (a1 + 1 == v4 + 40)))) - 8))();
}

uint64_t sub_21A5977B4()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((623 * (v1 + 1 == v3 + 60)) ^ v0)) - 8))();
}

uint64_t sub_21A597884()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((447 * (v0 + 1 == v3 + 80)) ^ v1)) - 8))();
}

void sub_21A59793C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _DWORD *a18)
{
  int v18;
  char v19;
  int v20;
  int v21;

  *a18 = (*a18 ^ v21)
       + (v18 ^ v21)
       + v21
       - ((((*a18 ^ v21) + (v18 ^ v21)) << ((((v19 | 0x22) - 40) | 0x30) - 53)) & v20);
  JUMPOUT(0x21A597E40);
}

uint64_t sub_21A597ECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,unsigned int a24,unsigned int a25,unsigned int a26)
{
  uint64_t v26;
  _BOOL4 v27;

  if (a5 < a25 != (int)a16 - 704726606 < a24)
    v27 = (int)a16 - 704726606 < a24;
  else
    v27 = (int)a16 - 704726606 > a26;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 + 8 * ((1340 * (((((_DWORD)a2 - 16) ^ v27) & 1) == 0)) ^ ((int)a2 + 392))) - 12))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20);
}

void sub_21A597F50()
{
  JUMPOUT(0x21A597234);
}

uint64_t sub_21A597F80@<X0>(uint64_t a1@<X2>, int a2@<W3>, int a3@<W4>, uint64_t a4@<X6>, int a5@<W8>)
{
  uint64_t v5;
  int v6;
  uint64_t v7;

  *(_BYTE *)(a1 + (v6 + a2)) = *(_BYTE *)(v5 + a4 - 2037896635);
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((225 * ((a3 + v6 + 55) > 0x3F)) ^ a5)) - 8))();
}

void jEHf8Xzsv8K(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_21A598028@<X0>(uint64_t a1@<X8>)
{
  (*(void (**)(void))(a1 + 2192))();
  return 0;
}

uint64_t sub_21A59803C()
{
  return 4294925273;
}

void OowSGu()
{
  _DWORD v0[14];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[0] = -1128011312 - 369883897 * ((v0 & 0xA6A06335 | ~(v0 | 0xA6A06335)) ^ 0x4574E6FE);
  sub_21A5C9434(v0);
  __asm { BR              X12 }
}

uint64_t sub_21A598110()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((582 * (v2 != 0)) ^ v0)) - 8))();
}

uint64_t sub_21A598138@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unsigned int v15;

  v6 = *(_QWORD *)((v5 ^ 0x57D3F24FED7A9E94) - 0x57D3F24FED7A9E8CLL);
  v7 = 158994259 * ((2 * (&v9 & 0x15DE74D0) - &v9 + 1780583213) ^ 0x457D296A);
  v9 = v3;
  v10 = v2;
  v15 = (((2 * v4) & 0xE76FAF6E) + (v4 ^ 0x73B7D7B7) - 1906509346) ^ v7;
  v12 = v1;
  v14 = v6;
  v11 = v7 ^ 0x9B;
  (*(void (**)(uint64_t *))(a1 + 2000))(&v9);
  return (v13 - 1412947868);
}

uint64_t sub_21A598234(uint64_t result)
{
  uint64_t v1;
  __int16 v2;
  unsigned int v3;
  int v4;
  int v5;

  v1 = *(_QWORD *)(result + 16);
  v2 = *(_DWORD *)(result + 4) - 3237 * (((result | 0x12FA) - (result & 0x12FA)) ^ 0x1A5E);
  v3 = ((v2 & 0x1FF ^ 0x150 | 0x4A78D130) - (v2 & 0x1FF ^ 0x150 | 0xB5872ECF) - 1249431857) ^ 0x40F89030;
  *(_DWORD *)(v1 - 0x77E232005DB2DB4CLL) = (((2 * v3) | 0xA5220D3A) - v3 - 1385236125) ^ 0x2528F0CB;
  *(_QWORD *)(v1 - 0x77E232005DB2DB6CLL) = 0x80E48C67F81C24EFLL;
  *(_DWORD *)(v1 - 0x77E232005DB2DB50) = 107930451;
  v4 = v2 ^ 0x75;
  if (v4 == 1)
  {
    v5 = 107930467;
    goto LABEL_5;
  }
  if (v4 == 2)
  {
    *(_DWORD *)(v1 - 0x77E232005DB2DB54) = -1499619767;
    v5 = 107930471;
LABEL_5:
    *(_QWORD *)(v1 - 0x77E232005DB2DB64) = 0x8A82D430020A5CB8;
    *(_QWORD *)(v1 - 0x77E232005DB2DB5CLL) = 0x757D2BCFFDF5A347;
    *(_DWORD *)(v1 - 0x77E232005DB2DB50) = v5;
  }
  *(_DWORD *)(result + 8) = 1305158542;
  return result;
}

void sub_21A5983C8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = qword_2550EA2E0 - qword_2550EA328 - (_QWORD)&v2;
  qword_2550EA328 = 635641813 * v0 + 0x2A32B73EFB996FFFLL;
  qword_2550EA2E0 = 635641813 * (v0 ^ 0x2A32B73EFB996FFFLL);
  *(_DWORD *)*(&off_24DCDB210
             + ((-43 * ~(-43 * ~(_BYTE)v0 + -43 * v0 - 1)) ^ byte_21A5F0000[byte_21A5E7F10[(-43 * ~(-43 * ~(_BYTE)v0 + -43 * v0 - 1))] ^ 0x5D])
             + 20) = 1412947868;
  v1 = ((uint64_t (*)(uint64_t))*(&off_24DCDB210
                                         + ((-43 * ~(qword_2550EA2E0 + qword_2550EA328)) ^ byte_21A5DFC30[byte_21A5F8310[(-43 * ~(qword_2550EA2E0 + qword_2550EA328))] ^ 0x6F])
                                         + 155))(512);
  *(_QWORD *)((char *)*(&off_24DCDB210
                      + ((-43 * ~(qword_2550EA2E0 - qword_2550EA328)) ^ byte_21A5DFD30[byte_21A5F8410[(-43 * ~(qword_2550EA2E0 - qword_2550EA328))] ^ 0xD0])
                      - 27)
            - 4) = v1;
  __asm { BR              X8 }
}

uint64_t sub_21A59856C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  LODWORD(STACK[0x508]) = -2108263822;
  LODWORD(STACK[0x50C]) = 459195053;
  v2 = dword_2550EA480;
  STACK[0x610] = -107940961
               * ((v1 + 0x364F604EABF3D728 - 2 * ((v1 - 144) & 0x364F604EABF3D7B8)) ^ 0xEE385F4FE7689AF0);
  *(_DWORD *)(v1 - 144) = 107940961 * ((v1 - 1410083032 - 2 * ((v1 - 144) & 0xABF3D7B8)) ^ 0xE7689AF0) + 662959603;
  *(_DWORD *)(v1 - 136) = 662959525 - 107940961 * ((v1 - 1410083032 - 2 * ((v1 - 144) & 0xABF3D7B8)) ^ 0xE7689AF0);
  *(_DWORD *)(v1 - 132) = 107940961 * ((v1 - 1410083032 - 2 * ((v1 - 144) & 0xABF3D7B8)) ^ 0xE7689AF0);
  *(_DWORD *)(v1 - 116) = (107940961 * ((v1 - 1410083032 - 2 * ((v1 - 144) & 0xABF3D7B8)) ^ 0xE7689AF0)) ^ 0x2783F592;
  STACK[0x600] = v2
               - 107940961
               * ((v1 + 0x364F604EABF3D728 - 2 * ((v1 - 144) & 0x364F604EABF3D7B8)) ^ 0xEE385F4FE7689AF0);
  *(_DWORD *)(v1 - 120) = 83660732 - 107940961 * ((v1 - 1410083032 - 2 * ((v1 - 144) & 0xABF3D7B8)) ^ 0xE7689AF0);
  v3 = sub_21A5C9790(v1 - 144);
  return (*(uint64_t (**)(uint64_t))(v0 + 8 * *(int *)(v1 - 140)))(v3);
}

uint64_t sub_21A5987EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void (*a15)(uint64_t), uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  _DWORD *v24;
  uint64_t (*v25)(void);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  a15(a14);
  v27 = v25();
  *v24 = v27;
  v24[1] = (v27 ^ (v27 >> 30)) * (HIDWORD(a13) ^ 0x6C078888) + 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 3144))(v27, 2260850275, 736, v28, v29, v30, v31, v32, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24);
}

void sub_21A59886C()
{
  JUMPOUT(0x21A598838);
}

uint64_t sub_21A59887C(double a1, int8x16_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int32x4_t a19, int8x16_t a20,int8x16_t a21)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int8x16_t v26;
  int8x16_t v27;
  int32x4_t v28;

  v24 = (int8x16_t)vld1q_dup_f32((const float *)v21);
  v25.i64[0] = 0x8000000080000000;
  v25.i64[1] = 0x8000000080000000;
  a2.i64[0] = *(_QWORD *)(v21 + 4);
  a2.i32[2] = *(_DWORD *)(v21 + 12);
  v26 = vextq_s8(v24, a2, 0xCuLL);
  v27 = a2;
  v27.i32[3] = *(_DWORD *)(v21 + 16);
  v28 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)vorrq_s8(vandq_s8(v27, a21), vandq_s8(v26, v25)), 1uLL), *(int8x16_t *)(v21 + 1588));
  v26.i32[0] = *(_DWORD *)(v22 + 4 * (*(_DWORD *)(v21 + 4) & 1));
  v26.i32[1] = *(_DWORD *)(v22 + 4 * (*(_DWORD *)(v21 + 8) & 1));
  v26.i32[2] = *(_DWORD *)(v22 + 4 * (*(_DWORD *)(v21 + 12) & 1));
  v26.i32[3] = *(_DWORD *)(v22 + 4 * (v27.i8[12] & 1));
  *(int8x16_t *)v21 = veorq_s8((int8x16_t)vaddq_s32(vsubq_s32(v28, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v28, v28), a20)), a19), v26);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 + 3104) - 4))(1069515726, 2186703474, 66, 497, 1463);
}

void sub_21A598E28()
{
  JUMPOUT(0x21A598D60);
}

uint64_t sub_21A598E30(uint64_t a1, int a2, char a3, char a4)
{
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unsigned int *v11;
  uint64_t v12;
  int v13;
  unsigned int v14;

  v11 = (unsigned int *)(v7 + 4 * v5);
  v12 = v5 + 1;
  v13 = *(_DWORD *)(v7 + 4 * v12);
  v14 = v11[397] ^ ((v13 & 0x7FFFFFFE | v6 & 0x80000000) >> 1);
  *v11 = (v14 + a2 - ((v14 << ((8 * (v4 ^ a3)) ^ a4)) & v10)) ^ *(_DWORD *)(v8 + 4 * (v13 & 1));
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((v12 != 227) | (2 * (v12 != 227)) | v4)) - 4))();
}

uint64_t sub_21A598E9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W8>, int8x16_t a4@<Q1>, int8x16_t a5@<Q4>, int8x16_t a6@<Q5>, int8x16_t a7@<Q6>, int32x4_t a8@<Q7>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const float *v11;
  int8x16_t v12;
  uint64_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int32x4_t v16;

  v11 = (const float *)(v8 + 908);
  v12 = (int8x16_t)vld1q_dup_f32(v11);
  v13 = (a3 - 2014336498) & 0x7810573B;
  a4.i64[0] = *(_QWORD *)(v8 + 912);
  a4.i32[2] = *(_DWORD *)(v8 + 4 * (v13 - 596));
  v14 = vextq_s8(v12, a4, 0xCuLL);
  v15 = a4;
  v15.i32[3] = *(_DWORD *)(v8 + 924);
  v16 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)vorrq_s8(vandq_s8(v15, a5), vandq_s8(v14, a7)), 1uLL), *(int8x16_t *)v8);
  v14.i32[0] = *(_DWORD *)(v9 + 4 * (*(_DWORD *)(v8 + 912) & 1));
  v14.i32[1] = *(_DWORD *)(v9 + 4 * (*(_DWORD *)(v8 + 916) & 1));
  v14.i32[2] = *(_DWORD *)(v9 + 4 * (*(_DWORD *)(v8 + 4 * (v13 - 596)) & 1));
  v14.i32[3] = *(_DWORD *)(v9 + 4 * (v15.i8[12] & 1));
  *(int8x16_t *)(v8 + 908) = veorq_s8((int8x16_t)vaddq_s32(vsubq_s32(v16, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v16, v16), a6)), a8), v14);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 + 8 * a3) - 12))(a1, a2, 2280630798, 2014336827);
}

void sub_21A598F68()
{
  JUMPOUT(0x21A598EBCLL);
}

uint64_t sub_21A598F74(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38,unsigned int a39)
{
  unsigned int v39;
  _DWORD *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  unsigned int v45;
  _BOOL4 v46;

  v45 = v40[396] ^ ((*v40 & 0x7FFFFFFE | v40[623] & 0x80000000) >> 1);
  v40[623] = (v45 + a2 - (v43 & (2 * v45))) ^ *(_DWORD *)(v41 + 4 * (*v40 & 1));
  v46 = a39 <= a1 + (v39 ^ (v44 + 246)) + 383;
  return ((uint64_t (*)(void))(*(_QWORD *)(v42 + 8 * (((2 * v46) | (4 * v46)) ^ v39)) - 8))();
}

uint64_t sub_21A598FE0@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t (*a30)(uint64_t),int a31,int a32)
{
  uint64_t v32;
  _DWORD *v33;
  unsigned int *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;

  *v33 = a32 + 1;
  v37 = 1288161731 * ((v36 - 144) ^ 0xB10BF0EDDA0A41F6);
  *(_QWORD *)(v35 + 256) = *v34 - v37;
  *(_DWORD *)(v36 - 124) = ((a1 - 376500208) ^ 0x21) + v37;
  *(_DWORD *)(v36 - 120) = v37 + a1 + 1087819269;
  *(_DWORD *)(v36 - 136) = 1 - v37;
  *(_DWORD *)(v36 - 132) = ((a1 - 376500208) ^ 0x22) + v37;
  *(_DWORD *)(v36 - 128) = (a1 - 376500208) ^ v37;
  *(_QWORD *)(v35 + 224) = v37 ^ 0x13FF;
  v38 = a30(v36 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v32 + 8 * *(int *)(v36 - 116)) - 8))(v38);
}

uint64_t sub_21A5990A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,_QWORD *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,unint64_t a29,uint64_t a30,_DWORD *a31)
{
  unsigned int v31;
  uint64_t v32;
  int v33;
  int v34;

  *a31 = 0;
  v34 = a17 & ((v31 ^ (v31 >> 11)) << 7) ^ v31 ^ (v31 >> 11);
  *(_DWORD *)(*a24 + a29) ^= (v34 << 15) & 0xEFC60000 ^ v34 ^ (((v34 << 15) & 0xEFC60000 ^ v34) >> 18);
  return (*(uint64_t (**)(void))(v32 + 8 * ((v33 + 1069515667) ^ (562 * (a29 > 0x1FB)))))();
}

void sub_21A599118()
{
  JUMPOUT(0x21A5986B0);
}

void sub_21A599134()
{
  int v0;
  _DWORD *v1;

  *v1 = v0 + 21;
}

void sub_21A5A0598(uint64_t a1)
{
  int v1;

  v1 = 244061113 * ((a1 - 2 * (a1 & 0x525602C) + 86335532) ^ 0x8B471886);
  __asm { BR              X9 }
}

uint64_t sub_21A5A0668@<X0>(uint64_t result@<X0>, char a2@<W8>)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  unsigned int v11;
  void (*v12)(uint64_t);
  unsigned int v13;
  _BYTE v14[6];

  v6 = -a2;
  if (v6 == 219 || v6 == 61)
  {
    v7 = v5 - 128;
    v8 = *(_QWORD *)(result + 8) + 56 * **(unsigned __int8 **)(result + 8) + 24;
    v9 = v5 - 128;
    v10 = 158994259 * ((((v5 - 128) | 0x3F7C8921) - ((v5 - 128) | 0xC08376DE) - 1065126178) ^ 0x10202B66);
    *(_DWORD *)v7 = v10 + 272067323;
    *(_QWORD *)(v7 + 8) = &STACK[0x2B8323D6202E2FDB];
    *(_WORD *)(v5 - 124) = 3923 * ((((v5 - 128) | 0x8921) - ((v5 - 128) | 0x76DE) + 30430) ^ 0x2B66) + 31120;
    *(_DWORD *)(v7 + 16) = v2 - v10 - 100;
    *(_QWORD *)(v7 + 24) = v8;
    (*(void (**)(uint64_t))(v4 + 8 * (v2 ^ 0xD5)))(v5 - 128);
    v11 = 654962069 * (((v9 | 0x2CF8188A) - v9 + (v9 & 0xD307E770)) ^ 0xC3A818ED);
    *(_DWORD *)(v5 - 104) = v2 + 31 - v11;
    *(_QWORD *)(v5 - 120) = v14;
    *(_QWORD *)(v5 - 112) = &STACK[0x2B8323D6202E2FDB];
    *(_DWORD *)v7 = 1650272410 - v11;
    v12 = *(void (**)(uint64_t))(v4 + 8 * (v2 + 48));
    v12(v5 - 128);
    v13 = 654962069 * ((2 * (v9 & 0x2161410) - v9 + 2112482282) ^ 0x92B9EB8D);
    *(_DWORD *)(v5 - 104) = v2 + 31 - v13;
    *(_DWORD *)v7 = 1650272410 - v13;
    *(_QWORD *)(v5 - 120) = &v14[1];
    *(_QWORD *)(v5 - 112) = &STACK[0x2B8323D6202E2FDB];
    v12(v5 - 128);
    *(_DWORD *)(v5 - 112) = v2 + 1613850677 * ((v5 + 764351834 - 2 * ((v5 - 128) & 0x2D8F15DA)) ^ 0x10D47BDD) - 131;
    *(_QWORD *)v7 = v3;
    *(_QWORD *)(v5 - 120) = &STACK[0x2B8323D6202E2FDB];
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v4 + 8 * (v2 - 144)) - 8))(v5 - 128);
  }
  return result;
}

void sub_21A5A0884(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) + 107940961 * ((a1 & 0x10339911 | ~(a1 | 0x10339911)) ^ 0xA3572BA6);
  __asm { BR              X16 }
}

uint64_t sub_21A5A09D4()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((((v0 - 84) ^ 0x10A) * (v1 != 0x8FB220A0)) | v0)) - 8))();
}

uint64_t sub_21A5A0A1C()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;

  *(_BYTE *)(v9 + (v8 - 1976269304)) = *(_BYTE *)(v3 + ((v8 - 1976269304) & 0xFLL)) ^ *(_BYTE *)(v0 + (v8 - 1976269304)) ^ *(_BYTE *)(v2 + (((_BYTE)v8 + 8) & 0xF)) ^ *(_BYTE *)((((_BYTE)v8 + 8) & 0xF) + v4 + 2) ^ (((v8 + 8) & 0xF) * ((v1 + 13) & 0x9E ^ 0xDF));
  v11 = v6 > 0x5473EDAA;
  if (v11 == v8 + 901814366 < v5)
    v11 = v8 + 901814366 < v7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((8 * v11) | (16 * v11) | v1)) - 8))();
}

uint64_t sub_21A5A0AC8(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (a2 ^ (2
                                               * (((((a2 + 1375994005) & 0xADFBFD37) - 462584935) ^ v2)
                                                              - 9044994
                                                              + ((2 * v2) & 0xD7BF487E ^ 0x17244040) == 1800773693))))
                            - 4))();
}

uint64_t sub_21A5A0B3C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;

  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((((v5 + a1 + a5 - 1809818597 - 352) > 7) * (((a5 + 290) | 0x41) ^ 0x264)) ^ a5)))();
}

uint64_t sub_21A5A0B88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  uint64_t v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6
                                                                                          + 8
                                                                                          * (int)(a4 ^ (610 * (a6 >> 4 == 113113668))))
                                                                              - ((a4 + 264) ^ 0x261)))(a1, a2, a3, a4, a3);
}

uint64_t sub_21A5A0BC0(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL4 v19;

  v11 = (v8 + a1 + a2) + v9;
  v12 = (v8 + a1) & 0xF;
  v13 = v12 + v5 - v11;
  v14 = (v12 | v4) - v11;
  v15 = (v12 | v6) - v11;
  v19 = (unint64_t)(v7 - v9 - 0x28AB5093F891F729) > 0xF
     && v13 > 0xF
     && v14 >= ((9 * (a4 ^ 0x156u)) ^ 0x1FFuLL)
     && v15 + (((a4 + 199) | 0x41u) ^ 0x26BuLL) > 0xF;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((594 * v19) ^ a4)) - 8))();
}

uint64_t sub_21A5A0C5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  unsigned int v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * (a8 ^ (1006 * (v8 > 0xF)))) - ((a8 ^ 0x12Du) + 297) + 479))();
}

uint64_t sub_21A5A0C90(int a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  int8x16_t v28;
  int8x16_t v29;
  int8x16_t v30;
  int8x16x4_t v32;
  int8x16x4_t v33;

  *(_DWORD *)(v27 - 120) = a3 + 10;
  v32.val[1].i64[0] = a3 & 0xF;
  v32.val[1].i64[1] = ((_BYTE)a3 - 1) & 0xF;
  v32.val[2].i64[0] = ((_BYTE)a3 + 14) & 0xF;
  v32.val[2].i64[1] = ((_BYTE)a3 + 13) & 0xF;
  v32.val[3].i64[0] = ((_BYTE)a3 + 12) & 0xF;
  v32.val[3].i64[1] = ((_BYTE)a3 + 11) & 0xF;
  v28.i64[0] = 0xCDCDCDCDCDCDCDCDLL;
  v28.i64[1] = 0xCDCDCDCDCDCDCDCDLL;
  v32.val[0].i64[0] = ((_BYTE)a1 + (_BYTE)v24 + (_BYTE)a2) & 0xF;
  v32.val[0].i64[1] = ((_BYTE)a3 + 1) & 0xF;
  v29.i64[0] = vqtbl4q_s8(v32, (int8x16_t)xmmword_21A5D5130).u64[0];
  v33.val[0].i64[1] = ((_BYTE)a3 + 9) & 0xF;
  v33.val[1].i64[1] = ((_BYTE)a3 + 7) & 0xF;
  v33.val[2].i64[1] = ((_BYTE)a3 + 5) & 0xF;
  v33.val[3].i64[1] = ((_BYTE)a3 + 3) & 0xF;
  v33.val[0].i64[0] = *(_DWORD *)(v27 - 120) & 0xF;
  v33.val[1].i64[0] = ((_BYTE)a3 + 8) & 0xF;
  v33.val[2].i64[0] = ((_BYTE)a3 + 6) & 0xF;
  v33.val[3].i64[0] = (a3 + 4) & 0xF;
  v29.i64[1] = vqtbl4q_s8(v33, (int8x16_t)xmmword_21A5D5130).u64[0];
  v30 = vrev64q_s8(vmulq_s8(v29, v28));
  *(int8x16_t *)(v26 - 15 + (a1 + v24 + a2)) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v22 + v32.val[0].i64[0] - 15), *(int8x16_t *)(v20- 15+ (a1 + v24 + a2))), veorq_s8(*(int8x16_t *)(v21 + v32.val[0].i64[0] - 15), *(int8x16_t *)(v32.val[0].i64[0] + v23 - 13))), vextq_s8(v30, v30, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a20 + 8 * ((933 * ((v25 & 0xFFFFFFF0) == 16)) ^ a4)) - (a4 ^ 0x2D0u) + 819))();
}

void sub_21A5A0DF4()
{
  JUMPOUT(0x21A5A0D7CLL);
}

uint64_t sub_21A5A0E00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W6>, int a5@<W8>)
{
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v6
                                                                                + 8
                                                                                * ((((((a4 - 809) ^ (v5 == a5)) & 1) == 0)
                                                                                  * ((a4 - 483) ^ 0x61A)) ^ a4))
                                                                    - 4))(a1, a2, a3, (a4 - 809) | 0x100u);
}

uint64_t sub_21A5A0E40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  char v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((((a8 + 273) ^ 0x250) * ((v8 & 8) == 0)) ^ a8)) - 8))();
}

uint64_t sub_21A5A0E78@<X0>(int a1@<W0>, int a2@<W1>, char a3@<W2>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  int8x16x4_t v29;

  *(_QWORD *)(v25 - 120) = v16 - 7;
  *(_QWORD *)(v25 - 128) = v24 - 7;
  *(_DWORD *)(v25 - 140) = v23 & 0xFFFFFFF8;
  *(_DWORD *)(v25 - 136) = v23;
  *(_DWORD *)(v25 - 132) = 8 - (v23 & 0xFFFFFFF8);
  v26 = v21 + a1 + v22;
  v27 = a2 + a1 + v22 - 353 - a4 + (v20 ^ 0x1A3u);
  v29.val[0].i64[0] = ((_BYTE)a2 + (_BYTE)a1 + (_BYTE)v22 - 97 - (_BYTE)a4 + (v20 ^ 0xA3)) & 0xF;
  v29.val[0].i64[1] = (v26 + 1 - (_BYTE)a4) & 0xF;
  v29.val[1].i64[0] = (a3 - (_BYTE)a4) & 0xF;
  v29.val[1].i64[1] = (v26 + 15 - (_BYTE)a4) & 0xF;
  v29.val[2].i64[0] = (v26 + 14 - (_BYTE)a4) & 0xF;
  v29.val[2].i64[1] = (v26 + 13 - (_BYTE)a4) & 0xF;
  v29.val[3].i64[0] = (v26 + 12 - (_BYTE)a4) & 0xF;
  v29.val[3].i64[1] = (v26 + 11 - (_BYTE)a4) & 0xF;
  *(int8x8_t *)(*(_QWORD *)(v25 - 128) + v27) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v18 + (v27 & 0xF) - 7), *(int8x8_t *)(*(_QWORD *)(v25 - 120) + v27)), veor_s8(*(int8x8_t *)(v17 + (v27 & 0xF) - 7), *(int8x8_t *)((v27 & 0xF) + v19 - 5))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v29, (int8x16_t)xmmword_21A5D5140), (int8x8_t)0xCDCDCDCDCDCDCDCDLL)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a16
                                                     + 8
                                                     * (((*(_DWORD *)(v25 - 132) == -a4) | (8
                                                                                          * (*(_DWORD *)(v25 - 132) == -a4))) ^ v20))
                                         - 8))((__n128)xmmword_21A5D5140);
}

void sub_21A5A0FC4()
{
  JUMPOUT(0x21A5A0EE4);
}

uint64_t sub_21A5A0FD0(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (a2 ^ (7 * (*(_DWORD *)(v3 - 136) == *(_DWORD *)(v3 - 140)))))
                            - (a2 ^ 0x308 ^ (a2 - 79) ^ 0x373)))();
}

uint64_t sub_21A5A1010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = ((a7 + 40586602) & 0xFD94B13E ^ 0x94AA5ED0) + a5;
  *(_BYTE *)(v12 + v14) = *(_BYTE *)(v10 + (v14 & 0xF)) ^ *(_BYTE *)(v7 + v14) ^ *(_BYTE *)(v9 + (v14 & 0xF)) ^ *(_BYTE *)((v14 & 0xF) + v11 + 2) ^ (-51 * (v14 & 0xF));
  return (*(uint64_t (**)(void))(v13 + 8 * ((582 * (a5 - 1 == v8)) ^ (a7 - 496))))();
}

uint64_t sub_21A5A1090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  int8x16_t **v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int8x16_t v15;

  v15.i64[0] = 0xDADADADADADADADALL;
  v15.i64[1] = 0xDADADADADADADADALL;
  *(int8x16_t *)(v14 - 112) = veorq_s8(vaddq_s8(**v11, v15), (int8x16_t)xmmword_21A5D5170);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 + 8 * (int)(a4 ^ (114 * (v12 != 0)))) - 12))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

uint64_t sub_21A5A10E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  unsigned int v17;
  _BOOL4 v19;

  v15 = (a4 + 664060637) & 0xD86B3CFD;
  v16 = a13 - ((2 * a13 + 1963117678) & 0x43860462) + (v13 ^ 0x1C447948);
  v17 = ((v15 ^ 0xF797FFDF) & (2 * v16) ^ 0x43860422) + (v16 ^ 0xDA08FDA8);
  v19 = (((_BYTE)v17 + 7) & 0xF) != 0 || v17 == -70516839;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 + 8 * ((((((v15 + 355) | 0xB) - 443) ^ 0x15F) * v19) ^ v15)) - 12))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

uint64_t sub_21A5A11A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, int a13, int a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22)
{
  uint64_t v22;
  int v23;

  v23 = a14 - ((a11 << ((a22 - 36) ^ 0x7D)) & 0x248B4192) - 1933113600;
  return ((uint64_t (*)(void))(*(_QWORD *)(v22
                                        + 8
                                        * ((11
                                          * (((2 * v23) & 0x7C5DD5AA ^ 0x24094182) + (v23 ^ 0xAC6B4A1C) - 2359872 != 1040902293)) ^ a22))
                            - 12))();
}

uint64_t sub_21A5A127C(int a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((1635
                                          * (((v1 + 1) ^ (a1
                                                                         + v2
                                                                         + ((v1 + 4) | 0x29u)
                                                                         - 1043262166
                                                                         - 616 < 8)) & 1)) ^ v1))
                            - 4))();
}

uint64_t sub_21A5A1300(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * (v6 ^ 0x10 ^ (16
                                                      * (a2 + (((v6 ^ 0x10) + 61) ^ 0x6FBu) + a6 - 1186 < 0xFFFFFFF0))))
                            - 4))();
}

uint64_t sub_21A5A1338(int a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _BOOL4 v20;
  int v22;
  int v24;

  v9 = (a1 + v6 + a2);
  v10 = v9 + v7 + 1;
  v11 = (((v5 - 657) | 0x68) - 602) & v9;
  v12 = v2 + v11 - v9;
  v13 = v2 + v11 + 1;
  v14 = v4 + v11 - v9;
  v15 = v4 + v11 + 1;
  v16 = v11 + v3;
  v17 = v16 - v9 + 6;
  v18 = v16 + 7;
  v20 = v13 > v7 && v12 < v10;
  v22 = v15 > v7 && v14 < v10 || v20;
  if (v18 <= v7 || v17 >= v10)
    v24 = v22;
  else
    v24 = 1;
  return (*(uint64_t (**)(void))(v8 + 8 * (((v24 ^ 1) * (((v5 - 647) | 0x150) - 855)) | v5)))();
}

uint64_t sub_21A5A13D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v7;
  uint64_t v8;

  return (*(uint64_t (**)(void))(v8 + 8 * ((60 * (v7 < ((a7 - 242) ^ a7 ^ 0x13E ^ 0x1Cu))) ^ a7)))();
}

uint64_t sub_21A5A1408(int a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  unsigned int v26;
  int8x16_t v27;
  int8x16_t v28;
  int8x16_t v29;
  int8x16_t v30;
  int8x16_t v31;
  int8x16x4_t v33;
  int8x16x4_t v34;

  v33.val[1].i64[0] = ((_BYTE)a3 + 8) & 0xF;
  v33.val[1].i64[1] = ((_BYTE)a3 + 7) & 0xF;
  v33.val[2].i64[0] = ((_BYTE)a3 + 6) & 0xF;
  v33.val[2].i64[1] = ((_BYTE)a3 + 5) & 0xF;
  v33.val[3].i64[0] = ((_BYTE)a3 + 4) & 0xF;
  v33.val[3].i64[1] = ((_BYTE)a3 + 3) & 0xF;
  v34.val[0].i64[0] = ((_BYTE)a3 + 2) & 0xF;
  v34.val[0].i64[1] = ((_BYTE)a3 + 1) & 0xF;
  v26 = a1 + v24 + a2;
  v34.val[1].i64[0] = a3 & 0xF;
  v34.val[1].i64[1] = ((_BYTE)a3 - 1) & 0xF;
  v34.val[2].i64[0] = ((_BYTE)a3 + 14) & 0xF;
  v34.val[2].i64[1] = ((_BYTE)a3 + 13) & 0xF;
  v34.val[3].i64[0] = ((_BYTE)a3 + 12) & 0xF;
  v34.val[3].i64[1] = (a3 + 11) & 0xF;
  v27.i64[0] = 0x6969696969696969;
  v27.i64[1] = 0x6969696969696969;
  v28.i64[0] = 0x4949494949494949;
  v28.i64[1] = 0x4949494949494949;
  v33.val[0].i64[0] = v26 & 0xF;
  v33.val[0].i64[1] = ((_BYTE)a3 + 9) & 0xF;
  v29.i64[0] = vqtbl4q_s8(v33, (int8x16_t)xmmword_21A5D5130).u64[0];
  v29.i64[1] = vqtbl4q_s8(v34, (int8x16_t)xmmword_21A5D5130).u64[0];
  v30 = vrev64q_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v25 - 15 + v26), *(int8x16_t *)(v20 + v33.val[0].i64[0] - 15)), veorq_s8(*(int8x16_t *)(v22 + v33.val[0].i64[0] - 15), *(int8x16_t *)(v33.val[0].i64[0] + v21 - 9))));
  v31 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v30, v30, 8uLL), v28), vmulq_s8(v29, v27)));
  *(int8x16_t *)(v25 - 15 + v26) = vextq_s8(v31, v31, 8uLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(a20
                                        + 8
                                        * ((((v23 & 0xFFFFFFF0) == 16) * (((a4 - 537581176) & 0x200AD4B2) + 1431)) ^ a4))
                            - 4))();
}

void sub_21A5A1578()
{
  JUMPOUT(0x21A5A14F4);
}

uint64_t sub_21A5A1584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  int v20;
  int v21;
  unsigned __int8 *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unsigned int v28;
  char v29;
  char *v30;
  unsigned __int8 v31;
  uint64_t v32;
  char v33;
  unsigned int v34;
  int v35;
  unsigned int v36;
  unsigned __int8 *v37;
  unsigned __int8 v38;
  unsigned __int8 v39;
  uint64_t v40;
  int v41;
  unsigned int v42;
  int v43;
  int v44;
  int v45;
  uint64_t v46;
  int v47;
  unsigned int v48;
  char v49;
  unsigned int v50;
  int v51;
  unsigned __int8 v52;
  unsigned int v53;
  int v54;
  unsigned int v55;
  int v56;
  unsigned int v57;
  int v58;
  unsigned int v59;
  int v60;
  unsigned int v61;
  char *v62;
  int v63;
  unsigned int v64;
  unsigned int v65;
  int v66;
  char *v67;
  int v68;
  char *v69;
  unsigned int v70;
  int v71;
  unsigned int v72;
  uint64_t v73;
  unsigned int v74;
  int v75;
  unint64_t v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  int v80;
  unsigned int v81;
  int v82;
  int v83;
  unsigned int v84;
  unsigned int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  unsigned int v90;
  int v91;
  unsigned int v92;
  unsigned int v93;
  int v94;
  unsigned int v95;
  int v96;
  int v97;
  int v98;
  unsigned int v99;
  int v100;
  int v101;
  unsigned int v102;
  int v103;
  unsigned int v104;
  int v105;
  int v106;
  unsigned int v107;
  int v108;
  unsigned int v109;
  unsigned int v110;
  unsigned int v111;
  int v112;
  unsigned int v113;
  unsigned int v114;
  int v115;
  unsigned int v116;
  int v117;
  unsigned int v118;
  int v119;
  char *v120;
  unsigned int v121;
  unsigned int v122;
  unsigned int v123;
  int v124;
  unsigned int v125;
  int v126;
  unsigned int v127;
  int v128;
  unsigned int v129;
  int v130;
  unint64_t v131;
  unsigned int v132;
  unsigned int v133;
  int v134;
  unsigned int v135;
  int v136;
  unsigned int v137;
  int v138;
  unsigned int v139;
  int v140;
  int v141;
  int v142;
  unsigned int v143;
  int v144;
  unsigned int v145;
  unsigned int v146;
  int v147;
  int v148;
  int v149;
  unsigned int v150;
  int v151;
  int v152;
  int v153;
  int v154;
  unsigned int v155;
  unsigned int v156;
  unsigned int v157;
  unsigned int v158;
  int v159;
  int v160;
  unsigned int v161;
  unsigned int v162;
  int v163;
  int v164;
  unsigned int v165;
  int v166;
  int v167;
  unsigned int v168;
  int v169;
  int v170;
  int v171;
  int v172;
  int v173;
  int v174;
  int v175;
  int v176;
  unsigned int v177;
  int v178;
  unsigned int v179;
  int v180;
  unsigned int v181;
  unsigned int v182;
  int v183;
  unsigned int v184;
  unsigned int v185;
  int v186;
  int v187;
  unsigned int v188;
  int v189;
  unsigned int v190;
  int v191;
  unsigned int v192;
  unsigned int v193;
  int v194;
  unsigned int v195;
  int v196;
  int v197;
  int v198;
  int v199;
  unsigned int v200;
  int v201;
  unsigned int v202;
  unsigned int v203;
  int v204;
  unsigned int v205;
  int v206;
  int v207;
  unsigned int v208;
  unsigned int v209;
  unsigned int v210;
  unsigned int v211;
  int v212;
  unsigned int v213;
  int v214;
  unsigned int v215;
  int v216;
  unsigned int v217;
  unsigned int v218;
  unsigned int v219;
  int v220;
  int v221;
  unsigned int v222;
  unsigned int v223;
  int v224;
  int v225;
  int v226;
  int v227;
  unsigned int v228;
  int v229;
  unsigned int v230;
  int v231;
  int v232;
  int v233;
  unsigned int v234;
  int v235;
  int v236;
  unsigned int v237;
  int v238;
  unsigned int v239;
  int v240;
  int v241;
  int v242;
  unsigned int v243;
  int v244;
  int v245;
  unsigned int v246;
  int v247;
  unsigned int v248;
  int v249;
  int v250;
  unsigned int v251;
  int v252;
  int v253;
  unsigned int v254;
  int v255;
  unsigned int v256;
  unsigned int v257;
  int v258;
  unsigned int v259;
  unsigned int v260;
  unsigned __int8 v261;
  unsigned int v262;
  int v263;
  unsigned int v264;
  int v265;
  int v266;
  unsigned int v267;
  unsigned int v268;
  unsigned int v269;
  int v270;
  int v271;
  int v272;
  unsigned int v273;
  int v274;
  int v275;
  int v276;
  unsigned int v277;
  unsigned int v278;
  int v279;
  int v280;
  unsigned int v281;
  unint64_t v282;
  uint64_t v283;
  int v284;
  int v285;
  unsigned int v286;
  unsigned int v287;
  int v288;
  unsigned int v289;
  uint64_t v290;
  int v291;
  int v292;
  unsigned int v293;
  int v294;
  int v295;
  unsigned int v296;
  char *v297;
  uint64_t v298;
  unsigned int v299;
  int v300;
  int v301;
  int v302;
  unsigned int v303;
  int v304;
  int v305;
  int v306;
  int v307;
  unsigned int v308;
  unsigned int v309;
  unsigned int v310;
  int v311;
  char *v312;
  int v313;
  unsigned int v314;
  int v315;
  unsigned int v316;
  int v317;
  char *v318;
  char *v319;
  unsigned int v320;
  char *v321;
  int v322;
  uint64_t v323;
  uint64_t v324;
  unsigned int v325;
  int v326;
  int v327;
  unsigned __int8 *v329;
  char *v330;
  uint64_t v331;
  char *v332;
  uint64_t v333;
  uint64_t v334;
  unint64_t v335;
  unint64_t v336;
  unsigned int v337;
  uint64_t v338;
  __int128 v339;

  v24 = v21 - 329;
  v25 = (uint64_t)*(&off_24DCDB210 + v21 - 584);
  v26 = (char *)*(&off_24DCDB210 + (v21 ^ 0x233)) - 12;
  v27 = (uint64_t)*(&off_24DCDB210 + v21 - 280);
  v28 = (v26[*(unsigned __int8 *)(v23 - 105) ^ 0x1CLL] - 123) | ((*(unsigned __int8 *)(v25 + (*(unsigned __int8 *)(v23 - 108) ^ 0x5ELL)) ^ (*(unsigned __int8 *)(v23 - 108) - (((v21 - 329) ^ 0x1F0) & (2 * *(unsigned __int8 *)(v23 - 108))) + 113) ^ 0xFFFFFF87) << 24);
  v29 = v26[*(unsigned __int8 *)(v23 - 101) ^ 0x1BLL];
  v30 = (char *)*(&off_24DCDB210 + v21 - 419) - 8;
  v31 = ((2 * v29 + 78) & 0xBC) + ((v29 - 89) ^ 0xDE);
  v32 = *(unsigned __int8 *)(v23 - 102);
  if ((*(_BYTE *)(v27 + (v32 ^ 0x8F)) & 0x10) != 0)
    v33 = -16;
  else
    v33 = 16;
  v330 = v30;
  v331 = v27;
  v34 = v28 & 0xFF00FFFF | (((-37 * v30[*(unsigned __int8 *)(v23 - 107) ^ 0xC2] - 35) ^ 1) << 16) | ((*(unsigned __int8 *)(v27 + (*(unsigned __int8 *)(v23 - 106) ^ 0xBALL)) ^ (*(_BYTE *)(v23 - 106) - ((2 * *(_BYTE *)(v23 - 106)) & 0x4E) - 89) ^ 0xE0) << 8);
  HIDWORD(a14) = -35;
  v332 = v26;
  v35 = v31 | ((v32 ^ 0x8A ^ (v33 + (*(_BYTE *)(v27 + (v32 ^ 0x8F)) ^ 0xA7))) << 8) | (((-37 * v30[*(unsigned __int8 *)(v23 - 103) ^ 0x7FLL] - 35) ^ 0x88) << 16) | ((*(unsigned __int8 *)(v25 + (*(unsigned __int8 *)(v23 - 104) ^ 0xE4)) ^ (*(unsigned __int8 *)(v23 - 104) - ((2 * *(unsigned __int8 *)(v23 - 104)) & 0xFFE3) + 113) ^ 0x43) << 24);
  v333 = v25;
  v36 = ((*(unsigned __int8 *)(v27 + (*(unsigned __int8 *)(v23 - 110) ^ 0x64)) ^ (*(_BYTE *)(v23 - 110) - ((2 * *(_BYTE *)(v23 - 110)) & 0x4E) - 89) ^ 0x9C) << 8) & 0xFF00FF00 | (((-37 * v30[*(unsigned __int8 *)(v23 - 111) ^ 0xE6] - 35) ^ 0xE0) << 16) | (v26[*(unsigned __int8 *)(v23 - 109) ^ 0x41] - 123) | ((*(unsigned __int8 *)(v25 + (*(unsigned __int8 *)(v23 - 112) ^ 0x8DLL)) ^ (*(unsigned __int8 *)(v23 - 112) - ((2 * *(unsigned __int8 *)(v23 - 112)) & 0xFFE3) + 113) ^ 0xF) << 24);
  *(_DWORD *)(v23 - 136) = ((((*(_BYTE *)(v23 - 98) - ((2 * *(_BYTE *)(v23 - 98)) & 0x4E) - 89) ^ 0x94 ^ *(unsigned __int8 *)(v27 + (*(unsigned __int8 *)(v23 - 98) ^ 0xFCLL))) << 8) & 0xFF00FF00 | ((*(unsigned __int8 *)(v25 + (*(unsigned __int8 *)(v23 - 100) ^ 0x39)) ^ (*(unsigned __int8 *)(v23 - 100) - ((2 * *(unsigned __int8 *)(v23 - 100)) & 0xE2) + 113) ^ 0x22222222) << 24) | ((-37 * v30[*(unsigned __int8 *)(v23 - 99) ^ 0xCALL] + 93) << 16) | (v26[*(unsigned __int8 *)(v23 - 97) ^ 0x9ELL] - 123)) ^ 0x9E9269CE;
  *(_DWORD *)(v23 - 144) = v34 ^ 0xD65C7B3B;
  *(_DWORD *)(v23 - 140) = v36 ^ 0xBC1F2C57;
  *(_DWORD *)(v23 - 132) = v20 + 1973806496;
  *(_DWORD *)(v23 - 148) = v35 ^ 0x279B6C3F;
  v329 = v22;
  *(_DWORD *)(v23 - 128) = 361083653;
  *(_DWORD *)(v23 - 120) = v24;
  LODWORD(v334) = 0;
  *(_QWORD *)(v23 - 168) = 4;
  *(_QWORD *)(v23 - 160) = 11;
  v37 = v22;
  v38 = v26[v22[11] ^ 0xF1] - 123;
  HIDWORD(v334) = (v24 - 1985155433) & 0x765310F6;
  v39 = v330[v22[5] ^ 0xF5] * (BYTE4(v334) ^ 0x7B) - ((54 * v330[v22[5] ^ 0xF5] + 58) & 0x58) + 9;
  v40 = v22[4];
  *(_QWORD *)(v23 - 176) = 6;
  v41 = *(unsigned __int8 *)(v25 + (v40 ^ 9));
  *(_QWORD *)(v23 - 184) = 12;
  v42 = (v41 ^ ((_DWORD)v40 - ((2 * (_DWORD)v40) & 0xE2) + 113) ^ 0xFFFFFFF7) << 24;
  v43 = *(unsigned __int8 *)(v331 + (v37[6] ^ 0xE8)) ^ (v37[6] - ((2 * v37[6]) & 0x4E) - 89) ^ 0x7B;
  LODWORD(v40) = *(unsigned __int8 *)(v333 + (v37[12] ^ 0xC1)) ^ (v37[12] - ((2 * v37[12]) & 0xFFE3) + 113) ^ 0xC6;
  v44 = (v37[8] ^ 0xAE) - 879724286 - ((2 * (v37[8] ^ 0xAE)) & 4);
  v45 = v38 | ((*(unsigned __int8 *)(v333 + (v44 ^ 0xCB90790E)) ^ ((v44 ^ 2) + (~(2 * v44) | 0x1D) + 114) ^ 4) << 24);
  v46 = v22[15];
  *(_QWORD *)(v23 - 192) = 1;
  v47 = v26[v46 ^ 0xCF] - 123;
  LODWORD(v46) = ((-35 - 37 * v30[v22[1] ^ 0x42]) ^ 0x38) << (v47 & 0x10) << (v47 & 0x10 ^ 0x10);
  v48 = v46 - 372501579 - ((2 * v46) & 0x198016A);
  LOBYTE(v46) = v332[v22[7] ^ 0x5FLL];
  LOBYTE(v46) = v46 - ((2 * v46 + 10) & 0x66) + 56;
  v49 = v30[v22[13] ^ 0x9DLL];
  v50 = v46 ^ 0xB3 | (v43 << 8) | v42 & 0xFF00FFFF | ((v39 ^ 0xCA) << 16);
  v51 = (_DWORD)v40 << 24;
  v52 = -37 * v49 - ((-70 - 74 * v49) & 0xB6) + 56;
  LOBYTE(v40) = (((2 * (v37[14] + 20 - ((2 * v37[14]) & 0x32) + 5)) & 0xEC ^ 0x37)
               + ((v37[14] + 20 - ((2 * v37[14]) & 0x32) + 5) ^ 0xE4)
               + 119) ^ *(_BYTE *)(v331 + ((v37[14] - 1529801708 - ((2 * v37[14]) & 0x32) + 5) ^ 0xA4D11414));
  v53 = v51 & 0xFF0000FF | ((v52 ^ 0x19) << 16) | ((v40 ^ 0xC6) << 8) | (v47
                                                                                        + 1258334848
                                                                                        - ((2 * v47) & 0x100)) ^ 0x4B00AA80;
  v54 = (v51 & 0x1D00001B | ((v52 ^ 0x19) << 16) & 0x1D2DF21B | ((v40 ^ 0xC6) << 8) & 0xF21B | ((v47 + 1258334848 - ((2 * v47) & 0x100)) ^ 0x4B00AA80) & 0x1D2DF21B) ^ v47 & 1;
  v55 = ((*(unsigned __int8 *)(v333 + (*v37 ^ 0x85)) ^ (*v37 + (~(2 * *v37) | 0x1D) + 114) ^ 0xFFFFFF9F) << 24) | ((*(unsigned __int8 *)(v331 + (v37[2] ^ 0x2ELL)) ^ (v37[2] - ((2 * v37[2]) & 0x4E) - 89) ^ 0x2A) << 8);
  v56 = v48 ^ (v332[v22[3] ^ 1] - 123);
  v57 = (v55 | v56 ^ 0xE9CC13B5) + 1392515018 - 2 * ((v55 | v56 ^ 0xE9CC13B5) & 0x530017DF ^ (v56 ^ 0xE9CC13B5) & 0x15);
  HIDWORD(v339) = 0;
  v58 = (((-35 - 37 * v30[v37[9] ^ 0x8BLL]) ^ 0xFD) << 16) | ((*(unsigned __int8 *)(v331 + (v37[10] ^ 0x29)) ^ (v37[10] + (~(2 * v37[10]) | 0xB1) - 88) ^ 0x89) << 8) | v45;
  v59 = v58 + 1323362938 - 2 * (v58 & 0x4EE0EA7A ^ v38 & 8) - 8;
  v60 = ((v59 >> 8) ^ 0x7FCBD4D8) + ((v59 >> 7) & 0x1FB15DE ^ 0x68144E) + 17;
  v61 = ((2 * v60) & 0xCE)
      + (((BYTE1(v59) ^ 0xD8) + ((v59 >> 7) & 0xDE ^ 0x4E) + 17) ^ 0x67DD7F67)
      - 1742569319;
  v62 = (char *)*(&off_24DCDB210 + v24 - 207) - 12;
  v63 = *(_DWORD *)&v62[4 * (v52 ^ 0xCB)];
  v64 = ((v63 ^ 0xBEBCF0BB) + 867829752) ^ ((v63 ^ 0x8D06F74C) + 1);
  v65 = (v64 - ((2 * v64) & 0xE5F21166) + 1928923315) ^ v63;
  v66 = v65 - ((2 * v65 + 1735659502) & 0x7409469C) + 1841212229;
  v67 = (char *)*(&off_24DCDB210 + v24 - 33) - 4;
  v68 = (((32 * v66) ^ 0x409469C0) - 1844499505 - ((2 * ((32 * v66) ^ 0x409469C0)) & 0x241E5780)) ^ *(_DWORD *)&v67[4 * (HIBYTE(v57) ^ 0xD7)];
  v69 = (char *)*(&off_24DCDB210 + (*(_DWORD *)(v23 - 120) ^ 0x11A)) - 12;
  v70 = (v68 - 537746566 - ((2 * v68) & 0xBFE546F4)) ^ *(_DWORD *)&v69[4
                                                                     * ((v61 % 0x9D + (v60 - v61 % 0x9D)) ^ 0xF3)];
  v71 = (v70 - ((2 * v70) & 0x7409469C) + 973382478) ^ v66;
  v72 = v50 - ((2 * v50) & 0xC182EBF6) + 1623291387;
  v73 = (uint64_t)*(&off_24DCDB210 + *(_DWORD *)(v23 - 120) - 167);
  v74 = *(_DWORD *)(v73 + 4 * (v46 ^ 0x8Eu)) ^ ((v72 ^ 0x48)
                                                                 - 621451961
                                                                 - 2
                                                                 * ((v72 ^ 0x48) & 0x57 ^ v72 & 0x10)) ^ (v71 - ((2 * v71) & 0x8A568630) - 987020520) ^ HIBYTE(v57);
  HIDWORD(v76) = v74 ^ 0x20;
  LODWORD(v76) = v74 ^ 0xC615C1C0;
  v75 = v76 >> 6;
  v77 = v53 + 489550362 - 2 * v54;
  v78 = (((v53 + 26 - 2 * v54) ^ 0xFFFFFF66) + 228026368) ^ 0x6E1420BF;
  v79 = v78 - ((2 * v78) & 0xC50200B6);
  HIDWORD(v76) = v75 ^ 0x149A94F;
  LODWORD(v76) = v75 ^ 0x14000000;
  v80 = *(_DWORD *)&v67[4 * (HIBYTE(v72) ^ 0xB8)];
  v81 = HIBYTE(v72) ^ 0xD7A34BFF ^ v80;
  v80 ^= 0x920F2BCF;
  v82 = (v81 + v80 + 1) ^ ((HIBYTE(v72) ^ 0x45AC6030) + 1);
  v83 = *(_DWORD *)&v62[4 * (HIWORD(v48) ^ 0xE91B)];
  v84 = (32 * v83) ^ 0x2861E880 ^ ((HIBYTE(v72) ^ 0x712A721F ^ (v82 - ((2 * v82) & 0x96F3DBA0) - 881201712)) + v80);
  v85 = *(_DWORD *)&v69[4 * (v40 ^ 0x5E)] ^ v83 ^ *(_DWORD *)(v73 + 4
                                                                                   * (v59 ^ 0x1Bu)) ^ ((v59 ^ 0x95) - 621451960 + ~(2 * ((v59 ^ 0x95) & 0x4F ^ v59 & 8))) ^ (v84 - 537746566 - ((2 * v84) & 0xBFE546F4));
  v86 = *(_DWORD *)&v62[4 * (v39 ^ 0xB5)];
  LODWORD(v40) = (((32 * v86) ^ 0x2861E880)
                - 1844499505
                - 2 * (((32 * v86) ^ 0x2861E880) & 0x120F2BE0 ^ (32 * v86) & 0x20)) ^ *(_DWORD *)&v67[4 * (HIBYTE(v59) ^ 0x17)];
  v79 += 1795004507;
  v87 = *(_DWORD *)&v69[4 * (BYTE1(v57) ^ 0xD0)] ^ v86 ^ v79 ^ (v40 - 537746566 - ((2 * v40) & 0xBFE546F4));
  v335 = __PAIR64__(v72, v77);
  v336 = __PAIR64__(v57, v59);
  v88 = *(_DWORD *)&v62[4 * (BYTE2(v59) ^ 0xF8)];
  LODWORD(v40) = *(_DWORD *)&v67[4 * (HIBYTE(v77) ^ 0x8E)] ^ HIBYTE(v77) ^ 0x285CB436;
  v89 = v88 ^ 0x6922E7C4 ^ (32 * v88);
  v90 = *(_DWORD *)&v69[4 * (BYTE1(v72) ^ 0xC7)] ^ *(_DWORD *)(v73 + 4 * (v56 ^ 0xB3u)) ^ ((v57 ^ 0x42) - 621451961 - 2 * ((v57 ^ 0x42) & 0x67 ^ v57 & 0x20)) ^ (v89 + v40 - 2 * (v89 & v40) - 537746566 - 2 * ((v89 + v40 - 2 * (v89 & v40)) & 0x5FF2A37B ^ (v89 + v40) & 1));
  LODWORD(v40) = *(_DWORD *)(v73 + 4 * (v79 ^ 0x97EDFDF));
  v91 = *(_DWORD *)&v62[4 * (BYTE2(v90) ^ 0x8B)];
  v92 = v87 ^ v40;
  v93 = (v76 >> 26) - ((2 * (v76 >> 26)) & 0xD7F3E12) - 2034262263;
  v94 = (((32 * v91) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v91) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v67[4 * (HIBYTE(v93) ^ 0x39)];
  v95 = v91 ^ 0xE6C57BCF ^ (v94 - ((2 * v94) & 0x4F0CE916) - 1484360565);
  v96 = HIBYTE(v93) ^ (v95 - ((2 * v95) & 0x4EAF74B0) + 660060760);
  LODWORD(v40) = *(_DWORD *)&v69[4 * (BYTE1(v92) ^ 0xDA)];
  v97 = v40 ^ 0xC9A0DC3D ^ v96;
  v96 ^= 0x9D042516;
  v98 = (v97 + v96 + 1) ^ ((v40 ^ 0x54A4F92B) + 1);
  v99 = ((v85 ^ 0x9C) - 621451961 - ((2 * (v85 ^ 0x9C)) & 0x8E)) ^ *(_DWORD *)(v73 + 4 * (v85 ^ 0x12u)) ^ ((v40 ^ 0x9C321CAE ^ (v98 + 929634939 + (~(2 * v98) | 0x912DCB0B))) + v96);
  v100 = *(_DWORD *)&v62[4 * (BYTE2(v99) ^ 0x7C)];
  v101 = (v100 & 0x4000000 ^ 0x2DFFD17F) + 2 * (v100 & 0x4000000);
  v102 = ((v100 << 6) & 0x92BBDF40 ^ 0x1083D100) + ((32 * v100) ^ 0x613C072F);
  *(_QWORD *)((char *)&v339 + 4) = *(_DWORD *)(v23 - 132) < 0x7171E539u;
  v103 = *(_DWORD *)&v67[4 * (HIBYTE(v85) ^ 0xE2)];
  v104 = (HIBYTE(v85) ^ 0xBA539F95) + (v103 ^ 0x920F2BCF);
  LODWORD(v40) = *(_DWORD *)&v62[4
                               * (((v93 ^ 0x188F28BA) >> (v90 & 0x10 ^ 0x10) >> (v90 & 0x10)) ^ 0xA6)];
  v105 = (32 * v40) ^ 0x2861E880 ^ (v104 - 2 * ((HIBYTE(v85) ^ 0x3A539F95) & (v103 ^ 0x12030BCF)));
  v106 = (v105 - 537746566 - 2 * (v105 & 0x5FF2A37B ^ v104 & 1)) ^ *(_DWORD *)&v69[4 * (BYTE1(v90) ^ 0x5C)];
  v107 = *(_DWORD *)(v73 + 4 * ((v92 ^ HIBYTE(v59)) ^ 0x49u)) ^ (((v92 ^ HIBYTE(v59)) ^ 0xC7)
                                                                                  - 621451961
                                                                                  - 2
                                                                                  * (((v92 ^ HIBYTE(v59)) ^ 0xC7) & 0x4F ^ (v92 ^ HIBYTE(v59)) & 8)) ^ v40 ^ (v106 - ((2 * v106) & 0x15ABB560) + 181787312);
  LODWORD(v40) = *(_DWORD *)&v62[4 * (BYTE2(v85) ^ 0x84)];
  v108 = (((32 * v40) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v40) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v67[4 * (HIBYTE(v92) ^ 0xBC)];
  v109 = *(_DWORD *)(v73 + 4 * (v90 ^ 0x38u)) ^ ((v90 ^ 0xB6)
                                                                  - 621451961
                                                                  - ((2 * (v90 ^ 0xB6)) & 0x8E)) ^ (v108 - 537746566 - ((2 * v108) & 0xBFE546F4)) ^ *(_DWORD *)&v69[4 * (BYTE1(v93) ^ 0xDB)];
  v110 = v40 ^ HIBYTE(v92) ^ (v109 - ((2 * v109) & 0xA4174D8) - 2061452692);
  LODWORD(v40) = *(_DWORD *)&v62[4 * (BYTE2(v92) ^ 0x9B)];
  v111 = HIBYTE(v90);
  v112 = (((32 * v40) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v40) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v67[4 * (HIBYTE(v90) ^ 0x61)];
  v113 = *(_DWORD *)(v73 + 4 * (v93 ^ 0x34u)) ^ *(_DWORD *)&v69[4 * (BYTE1(v85) ^ 0x61)] ^ (v112 - 537746566 - ((2 * v112) & 0xBFE546F4)) ^ ((v93 ^ 0xBA) - 621451961 - ((2 * (v93 ^ 0xBA)) & 0x8E));
  v114 = (v113 - ((2 * v113) & 0xBB5EDE7A) + 1571778365) ^ v40;
  v115 = *(_DWORD *)&v62[4 * (BYTE2(v114) ^ 0x2F)];
  v116 = HIBYTE(v99);
  v117 = (((32 * v115) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v115) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v67[4 * (HIBYTE(v99) ^ 0xFE)];
  v118 = *(_DWORD *)&v69[4 * (BYTE1(v110) ^ 0xB1)] ^ v115 ^ ((v107 ^ 0x74)
                                                           - 621451961
                                                           - ((2 * (v107 ^ 0x74)) & 0x8E)) ^ *(_DWORD *)(v73 + 4 * (v107 ^ 0xFAu)) ^ (v117 - 537746566 - ((2 * v117) & 0xBFE546F4));
  v119 = v101 - 604442738;
  if (((v102 - 1230892975) & (v101 - 771740031)) != 0)
    v119 = 939037324 - v101;
  v120 = v67;
  v121 = *(_DWORD *)&v67[4 * (HIBYTE(v107) ^ 0xA8)] ^ HIBYTE(v107) ^ *(_DWORD *)(v73
                                                                               + 4 * (v110 ^ 0x36u)) ^ ((v110 ^ 0xB8) - 621451960 + (~(2 * v110) | 0xFFFFFF71)) ^ v100 & 0xFBFFFFFF ^ 0xD34C2402 ^ (v102 - 1398190268 + v119);
  v122 = (v121 - 537746566 - ((2 * v121) & 0xBFE546F4)) ^ *(_DWORD *)&v69[4 * (BYTE1(v114) ^ 0x56)];
  v123 = ((HIBYTE(v110) ^ 0x8000007C) - 1844499504 + (~(2 * (HIBYTE(v110) ^ 0x8000007C)) | 0xFFFFFE61)) ^ *(_DWORD *)&v67[4 * (HIBYTE(v110) ^ 0x5D)];
  v124 = *(_DWORD *)&v62[4 * (BYTE2(v107) ^ 0xDB)];
  v125 = *(_DWORD *)&v69[4 * (BYTE1(v99) ^ 0xC9)] ^ v124 ^ *(_DWORD *)(v73 + 4 * (v114 ^ v111 ^ 0xD4)) ^ ((v114 ^ v111 ^ 0x5A) - 621451961 - ((2 * (v114 ^ v111 ^ 0x5A)) & 0x8E)) ^ (((32 * v124) ^ 0x2861E880 ^ v123) - 537746566 - 2 * (((32 * v124) ^ 0x2861E880 ^ v123) & 0x5FF2A37F ^ v123 & 5));
  v126 = *(_DWORD *)&v62[4 * (BYTE2(v110) ^ 0xEC)];
  v127 = HIBYTE(v114);
  v128 = (((32 * v126) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v126) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v67[4 * (v127 ^ 0x47)];
  v129 = (v128 - 537746566 - ((2 * v128) & 0xBFE546F4)) ^ *(_DWORD *)&v69[4 * (BYTE1(v107) ^ 0xB4)];
  HIDWORD(v131) = v122 ^ 0x20E;
  LODWORD(v131) = v122 ^ 0x33E8000;
  v130 = v131 >> 11;
  HIDWORD(v131) = v130 ^ 0x163EA9;
  LODWORD(v131) = v130 ^ 0x39A00000;
  v132 = v99 ^ (v129 - 621451961 - ((2 * v129) & 0xB5EACA8E)) ^ *(_DWORD *)(v73
                                                                                           + 4
                                                                                           * (v99 ^ 0x2Fu));
  v133 = ((v132 ^ 0xA1) + 177977452 + ~(2 * ((v132 ^ 0xA1) & 0xA9BB86F ^ v132 & 4))) ^ v126;
  v134 = *(_DWORD *)&v62[4 * (BYTE2(v133) ^ 0xDC)];
  v135 = HIBYTE(v118);
  v136 = (((32 * v134) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v134) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v67[4 * (HIBYTE(v118) ^ 0x23)];
  v137 = (v131 >> 21) - ((2 * (v131 >> 21)) & 0xE65531F0) + 1932171512;
  v138 = ((v131 >> 21) - ((2 * (v131 >> 21)) & 0xF0) - 8);
  v139 = *(_DWORD *)(v73 + 4 * (v138 ^ 0x1Au)) ^ *(_DWORD *)&v69[4 * (BYTE1(v125) ^ 0x6F)] ^ (v136
                                                                                              - 537746566
                                                                                              - ((2 * v136) & 0xBFE546F4)) ^ ((v138 ^ 0x94) - 621451961 - ((2 * (v138 ^ 0x94)) & 0x8E));
  v140 = v134 ^ 0x501915A6 ^ (v139 - ((2 * v139) & 0x22B435C4) + 291117794);
  v141 = *(_DWORD *)&v62[4 * (BYTE2(v118) ^ 0xD8)];
  v142 = v140 - ((2 * v140) & 0x11FB2C38);
  v143 = HIBYTE(v137);
  v144 = (((32 * v141) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v141) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v67[4 * (HIBYTE(v137) ^ 6)];
  v145 = (v144 - 537746566 - ((2 * v144) & 0xBFE546F4)) ^ *(_DWORD *)&v69[4 * (BYTE1(v133) ^ 0x1F)];
  v146 = *(_DWORD *)(v73 + 4 * (v125 ^ 0x31u)) ^ v125 ^ v141 ^ (v145
                                                                                                  - 621451961
                                                                                                  - ((2 * v145) & 0xB5EACA8E));
  v147 = HIBYTE(v125) ^ 0x285CB417 ^ *(_DWORD *)&v67[4 * (HIBYTE(v125) ^ 0xAF)];
  v148 = *(_DWORD *)&v62[4 * (BYTE2(v137) ^ 0x31)];
  v149 = (v148 ^ 0x6922E7C4 ^ (32 * v148)) + v147 - 2 * ((v148 ^ 0x6922E7C4 ^ (32 * v148)) & v147);
  v150 = *(_DWORD *)(v73 + 4 * ((v133 ^ v127) ^ 0x89u)) ^ *(_DWORD *)&v69[4 * (BYTE1(v118) ^ 0xBA)] ^ (((v133 ^ v127) ^ 7) - 621451961 - 2 * (((v133 ^ v127) ^ 7) & 0x57 ^ (v133 ^ v127) & 0x10)) ^ (v149 - 537746566 - ((2 * v149) & 0xBFE546F4));
  v151 = v116 ^ v118;
  v133 >>= 24;
  v152 = *(_DWORD *)&v62[4 * (BYTE2(v125) ^ 0x9A)];
  v153 = (((32 * v152) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v152) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v67[4 * (v133 ^ 0x27)];
  v142 += 150836764;
  HIDWORD(v131) = v135 ^ 0x67 ^ v142;
  LODWORD(v131) = v142 ^ 0xD95C3800;
  v154 = v131 >> 9;
  HIDWORD(v131) = v154 ^ 0x526DC;
  LODWORD(v131) = v154 ^ 0xCB800000;
  v155 = *(_DWORD *)&v69[4 * (BYTE1(v137) ^ 0xC4)] ^ ((v151 ^ 0xF8) - 621451961 - ((2 * (v151 ^ 0xF8)) & 0x8E)) ^ *(_DWORD *)(v73 + 4 * (v151 ^ 0x76u)) ^ (v153 - 537746566 - ((2 * v153) & 0xBFE546F4));
  v156 = (v155 - ((2 * v155) & 0x5BC05BA) - 2099379491) ^ v152;
  v157 = (v131 >> 23) - ((2 * (v131 >> 23)) & 0xA84641F8) - 735895300;
  v337 = HIBYTE(v157);
  v158 = ((HIBYTE(v157) ^ 0xFFFFFF0A) + 34) ^ ((HIBYTE(v157) ^ 0xFFFFFF2B) + 1);
  v159 = *(_DWORD *)&v62[4 * (BYTE2(v156) ^ 8)];
  v160 = (((32 * v159) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v159) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v67[4 * (HIBYTE(v157) ^ 0x9BEAE0F2 ^ (v158 - 1679106010 - ((2 * v158) & 0x37D5C04C))) + 132];
  v161 = *(_DWORD *)(v73 + 4 * (v146 ^ v143 ^ 0xBE)) ^ *(_DWORD *)&v69[4
                                                                                        * (((BYTE1(v150) | 0xCF) + (BYTE1(v150) & 0xCF ^ 0x31) + 1) ^ 0xF3)] ^ ((v146 ^ v143 ^ 0x30) - 621451961 - ((2 * (v146 ^ v143)) & 0x8E)) ^ (v160 - 537746565 + ~((2 * v160) & 0xBFE546F4));
  v162 = (v161 - ((2 * v161) & 0x35E8302C) + 452204566) ^ v159;
  v163 = *(_DWORD *)&v62[4 * (BYTE2(v150) ^ 0x12)];
  v164 = (((32 * v163) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v163) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v67[4 * (HIBYTE(v156) ^ 0x6F)];
  v165 = (v164 - 537746566 - ((2 * v164) & 0xBFE546F4)) ^ *(_DWORD *)&v69[4 * (BYTE1(v146) ^ 0xB7)];
  v166 = HIBYTE(v156) ^ 0x8F71AE5 ^ (v165 + 150411947 - ((2 * v165) & 0x11EE3556));
  v167 = ((v131 >> 23) - ((2 * (v131 >> 23)) & 0xF8) - 4);
  v168 = *(_DWORD *)(v73 + 4 * (v167 ^ 0x72u)) ^ v163 ^ ((v167 ^ 0xFC) - 621451961 - ((2 * (v167 ^ 0xFC)) & 0x8E)) ^ (v166 - ((2 * v166) & 0xCBAA2040) + 1708462112);
  v169 = *(_DWORD *)&v62[4 * (BYTE2(v168) ^ 0xA)];
  v170 = ((32 * v169) ^ 0x2861E880) - 1949990368 - ((2 * ((32 * v169) ^ 0x2861E880)) & 0x178B0440);
  v171 = *(_DWORD *)&v67[4 * (HIBYTE(v162) ^ 0xFD)];
  HIDWORD(v131) = HIBYTE(v162) ^ v169 ^ v171 ^ 0xFFFFFF01;
  LODWORD(v131) = v169 ^ 0x691FBA00 ^ v171;
  v172 = v131 >> 9;
  HIDWORD(v131) = v172 ^ 0xEC8BA;
  LODWORD(v131) = v172 ^ 0x9000000;
  v173 = (v131 >> 23) + 974539327 - ((2 * (v131 >> 23)) & 0x742C947E);
  v174 = v170 + 30;
  v175 = (v174 & 0x80000 ^ 0x6BFBBA6E) + 2 * (v174 & 0x80000);
  v176 = *(_DWORD *)&v62[4 * (BYTE2(v157) ^ 0x85)];
  v177 = HIBYTE(v146);
  v178 = (((32 * v176) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v176) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v67[4 * (HIBYTE(v146) ^ 0x4A)];
  v179 = *(_DWORD *)(v73 + 4 * (v150 ^ 0xACu)) ^ *(_DWORD *)&v69[4 * (BYTE1(v156) ^ 0x5F)] ^ ((v150 ^ 0x22) - 621451961 - ((2 * (v150 ^ 0x22)) & 0x8E)) ^ (v178 - 537746566 - ((2 * v178) & 0xBFE546F4));
  v180 = *(_DWORD *)&v62[4 * (BYTE2(v146) ^ 0x40)];
  v181 = (v179 - ((2 * v179) & 0x970F1E1A) - 880308467) ^ v176;
  v182 = HIBYTE(v150);
  v183 = (((32 * v180) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v180) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v67[4 * (HIBYTE(v150) ^ 0xBD)];
  v184 = *(_DWORD *)(v73 + 4 * (v156 ^ v133 ^ 0x84)) ^ ((v156 ^ v133 ^ 0xA)
                                                                         - 621451961
                                                                         - ((2 * (v156 ^ v133 ^ 0xA)) & 0x8E)) ^ (v183 - 537746566 - ((2 * v183) & 0xBFE546F4)) ^ *(_DWORD *)&v69[4 * (BYTE1(v157) ^ 0xD3)];
  v185 = (v184 - ((2 * v184) & 0x99AC0A80) + 1289094464) ^ v180;
  v186 = v181 ^ v177;
  v187 = v175 - 679677952;
  if (((v175 - 1811659374) & (v173 ^ 0x3A164A3F)) != 0)
    v187 = -1351326500 - v175;
  v188 = *(_DWORD *)(v73 + 4 * (v186 ^ 0x8Eu)) ^ *(_DWORD *)&v69[4 * (BYTE1(v185) ^ 0x45)] ^ ((v174 & 0xFFF7FFE0 ^ 0x8BC58220 ^ ((v173 ^ 0x27873E2D) - 1131981422 + v187))
                                                                                              - 537746566
                                                                                              - 2
                                                                                              * ((v174 & 0xFFF7FFE0 ^ 0x8BC58220 ^ ((v173 ^ 0x27873E2D) - 1131981422 + v187)) & 0x5FF2A37E ^ ((v173 ^ 0x27873E2D) - 1131981422 + v187) & 4));
  v189 = *(_DWORD *)&v62[4 * (BYTE2(v162) ^ 0x29)];
  v190 = HIBYTE(v181);
  v191 = (((32 * v189) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v189) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v67[4 * (HIBYTE(v181) ^ 0xD5)];
  v192 = (v191 - 537746566 - ((2 * v191) & 0xBFE546F4)) ^ *(_DWORD *)&v69[4 * (BYTE1(v168) ^ 0xBA)];
  v193 = v189 ^ 0x7F725F88 ^ (v192 + 1043419341 + (~(2 * v192) | 0x839D5E67));
  v194 = *(_DWORD *)&v62[4 * (BYTE2(v181) ^ 0xC5)];
  v195 = (((v185 ^ v182) ^ 0x20) - 621451961 - ((2 * (v185 ^ v182)) & 0x8E)) ^ *(_DWORD *)(v73 + 4 * ((v185 ^ v182) ^ 0xAEu)) ^ (v193 - ((2 * v193) & 0x4BAAF6FE) - 1512735873);
  v196 = (((32 * v194) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v194) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v67[4 * (HIBYTE(v185) ^ 0xAF)];
  v197 = *(_DWORD *)&v69[4 * (BYTE1(v162) ^ 0x77)] ^ v194 ^ *(_DWORD *)(v73 + 4 * (v168 ^ 0x2Bu)) ^ ((v168 ^ 0xA5) - 621451961 - 2 * ((v168 ^ 0xA5) & 0x4F ^ v168 & 8));
  v198 = v337 ^ v162;
  v199 = *(_DWORD *)&v62[4 * (BYTE2(v185) ^ 0x9F)];
  v200 = HIBYTE(v168);
  v201 = (((32 * v199) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v199) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v67[4 * (HIBYTE(v168) ^ 0x21)];
  v202 = (v201 - 537746566 - ((2 * v201) & 0xBFE546F4)) ^ *(_DWORD *)&v69[4 * (BYTE1(v181) ^ 0x46)];
  v203 = v199 ^ v198 ^ *(_DWORD *)(v73 + 4 * (v198 ^ 0xFFu)) ^ (v202 - 621451961 - ((2 * v202) & 0xB5EACA8E));
  v204 = *(_DWORD *)&v62[4 * (BYTE2(v203) ^ 0x9D)];
  v205 = v197 ^ (v196 - 537746566 - ((2 * v196) & 0xBFE546F4));
  LODWORD(v338) = HIBYTE(v188);
  v206 = (((32 * v204) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v204) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v67[4 * (HIBYTE(v188) ^ 5)];
  v207 = v195 ^ v190;
  v208 = *(_DWORD *)&v69[4 * (BYTE1(v205) ^ 0x1C)] ^ v207 ^ (v206 - 537746566 - ((2 * v206) & 0xBFE546F4)) ^ 0x7E;
  v209 = (v208 - 621451961 - ((2 * v208) & 0xB5EACA8E)) ^ *(_DWORD *)(v73 + 4 * (v207 ^ 0xF0u));
  v210 = (v209 - ((2 * v209) & 0xE34B6B66) - 240798285) ^ v204;
  v211 = ((HIBYTE(v195) ^ 0xA5) - 1844499505 - ((2 * (HIBYTE(v195) ^ 0xA5)) & 0xFFFFFF9F)) ^ *(_DWORD *)&v67[4 * (HIBYTE(v195) ^ 0xF2)];
  v212 = *(_DWORD *)&v62[4 * (BYTE2(v188) ^ 0x16)];
  v213 = ((v188 >> 7) & 0x1F4 ^ 0x1B4) + (BYTE1(v188) ^ 0xBF7AD921);
  v214 = *(_DWORD *)&v62[4 * (BYTE2(v195) ^ 2)];
  v215 = HIBYTE(v205);
  v216 = (((32 * v214) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v214) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v120[4 * (HIBYTE(v205) ^ 0x12)];
  v217 = *(_DWORD *)(v73 + 4 * (v205 ^ HIBYTE(v185) ^ 0xFE)) ^ *(_DWORD *)&v69[4
                                                                                                * (BYTE1(v203) ^ 0x7F)] ^ ((v205 ^ HIBYTE(v185) ^ 0x70) - 621451961 - ((2 * (v205 ^ HIBYTE(v185) ^ 0x70)) & 0x8E)) ^ v212 ^ (((32 * v212) ^ 0x2861E880 ^ v211) - 537746566 - 2 * (((32 * v212) ^ 0x2861E880 ^ v211) & 0x5FF2A37E ^ v211 & 4));
  v218 = (v216 - 537746566 - ((2 * v216) & 0xBFE546F4)) ^ *(_DWORD *)&v69[4 * v213
                                                                        + 0x102149818
                                                                        + 4
                                                                        * (((BYTE1(v188) ^ 0xFFFFFFD7)
                                                                          + 1082467846
                                                                          + v213
                                                                          + 1) ^ 0xFFFFFFFE)];
  v219 = *(_DWORD *)(v73 + 4 * (v203 ^ v200 ^ 0xE2)) ^ v203 ^ v200 ^ v214 ^ (v218 - 621451961 - ((2 * v218) & 0xB5EACA8E));
  v220 = *(_DWORD *)&v62[4 * BYTE2(v205)];
  v203 >>= 24;
  v221 = (((32 * v220) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v220) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v120[4 * (v203 ^ 0x48)];
  v222 = v220 ^ ((v188 ^ v186 ^ 0x36) - 621451961 - ((2 * (v188 ^ v186 ^ 0x36)) & 0x8E)) ^ *(_DWORD *)&v69[4 * (BYTE1(v195) ^ 0x47)] ^ *(_DWORD *)(v73 + 4 * (v188 ^ v186 ^ 0xB8u)) ^ (v221 - 537746566 - ((2 * v221) & 0xBFE546F4));
  v223 = 29 * ((v210 ^ 0x8F000000) / 0x1D000000)
       + ((HIBYTE(v210) ^ 0x8F)
                         - 29
                         * ((((27 * (HIBYTE(v210) ^ 0x8Fu)) >> 8)
                           + ((((HIBYTE(v210) ^ 0x8F)
                                               - ((unsigned __int16)(27 * (HIBYTE(v210) ^ 0x8F)) >> 8)) & 0xFE) >> 1)) >> 4));
  v224 = v223 - 1854442057 - ((2 * v223) & 0x36E);
  v225 = *(_DWORD *)&v62[4 * (BYTE2(v222) ^ 0x96)];
  v226 = (((32 * v225) ^ 0x2861E880) - 1844499504 + ~((2 * ((32 * v225) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v120[4 * (v224 ^ 0x91777596)];
  v227 = v224 ^ (v226 - 1854442057 - ((2 * v226) & 0x22EEEB6E));
  v228 = v225 ^ 0x1FCFD9D8 ^ (v227 - ((2 * v227) & 0xC9BE9394) - 455128630);
  v229 = *(_DWORD *)&v69[4 * (BYTE1(v219) ^ 0xBA)];
  v230 = ((v217 ^ 0xC0) - 621451961 - 2 * ((v217 ^ 0xC0) & 0x5F ^ v217 & 0x18)) ^ *(_DWORD *)(v73 + 4 * (v217 ^ 0x4Eu)) ^ (v228 + (v229 ^ 0xAB5B06D4) - 2 * (v228 & (v229 ^ 0x2B5B06D4)));
  v231 = ((v219 ^ v215) & 0x67 ^ 0x6151A961)
       + (v219 ^ v215 ^ 6)
       - ((v219 ^ v215 ^ 6) & 0x67);
  v232 = *(_DWORD *)&v62[4 * (BYTE2(v210) ^ 0xCA)];
  v233 = (((32 * v232) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v232) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v120[4 * (HIBYTE(v217) ^ 0xDD)];
  v234 = *(_DWORD *)&v69[4 * (BYTE1(v222) ^ 0xF6)] ^ *(_DWORD *)(v73 + 4 * (v231 ^ 0x6151A99Bu)) ^ v231 ^ 0xBBA4CC52 ^ (v233 - 537746565 + ~((2 * v233) & 0xBFE546F4));
  v235 = v232 ^ HIBYTE(v217);
  v236 = *(_DWORD *)&v62[4 * (BYTE2(v217) ^ 0x6C)];
  v237 = v235 ^ (v234 - ((2 * v234) & 0x4FF2193E) - 1476850529);
  v238 = (((32 * v236) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v236) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v120[4 * (HIBYTE(v219) ^ 0xEB)];
  v239 = (v238 - 537746566 - ((2 * v238) & 0xBFE546F4)) ^ *(_DWORD *)&v69[4 * (BYTE1(v210) ^ 7)];
  v240 = HIBYTE(v219) ^ 0x6D37CECB ^ (v239 + 1832373762 + (~(2 * v239) | 0x259063FD));
  v241 = *(_DWORD *)(v73 + 4 * (v222 ^ v203 ^ 0x60)) ^ ((v222 ^ v203 ^ 0xEE)
                                                                         - 621451961
                                                                         - ((2 * (v222 ^ v203 ^ 0xEE)) & 0x8E)) ^ v236;
  v242 = *(_DWORD *)&v62[4 * (BYTE2(v219) ^ 0x9F)];
  v243 = v241 ^ (v240 - ((2 * v240) & 0xF243386A) - 115237835);
  v244 = *(_DWORD *)&v69[4 * (BYTE1(v217) ^ 0x7B)];
  v245 = ((v244 ^ 0x276118B8) + 124535870) ^ ((v244 ^ 0x200D5C85) + 1);
  v222 >>= 24;
  v246 = (((32 * v242) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v242) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v120[4 * (v222 ^ 0xB5)] ^ (((v245 - 537746566 - ((2 * v245) & 0xBFE546F4)) ^ v244) + 124535869);
  v247 = (v338 ^ 0x404183C0 ^ v210 | 0x5ABC11E8)
       - (v338 ^ 0x404183C0 ^ v210 | 0xA543EE17)
       - 1522274793;
  v248 = *(_DWORD *)(v73 + 4 * (v247 ^ 0x1AFD927Eu)) ^ v242 ^ (v246 - 621451961 - ((2 * v246) & 0xB5EACA8E));
  v249 = v247 ^ v222;
  v250 = ((2 * HIBYTE(v237)) ^ 0x1D6) + (HIBYTE(v237) ^ 0x2FCA6B14);
  v251 = v249 ^ v248;
  v252 = *(_DWORD *)&v62[4 * (BYTE2(v248) ^ 0x6E)];
  v253 = *(_DWORD *)&v69[4 * (BYTE1(v243) ^ 0xC8)];
  v254 = v253 & 0x80 ^ v252 ^ v253 & 0xFFFFFF7F ^ (((32 * v252) ^ 0x2861E880)
                                                 - ((2 * ((32 * v252) ^ 0x2861E880)) & 0x8167AB00)
                                                 - 1061956223) ^ 0x2AABDC11;
  LODWORD(v339) = HIBYTE(v230);
  v255 = (v254 - 1844499505 - ((2 * v254) & 0x241E579E)) ^ *(_DWORD *)&v120[4 * (HIBYTE(v230) ^ 0x35)];
  v256 = v255 - ((2 * v255) & 0xFCAC0D44);
  v257 = (v250 - 57) % 0x3Au - ((2 * ((v250 - 57) % 0x3Au)) & 0x4E);
  v258 = v250 + (~(2 * v250 + 2) | 0x31);
  v259 = 58 * ((v250 - 801795071) / 0x3Au) - ((116 * ((v250 - 801795071) / 0x3Au)) & 0xCC);
  v260 = v258 - 23;
  v261 = v257 - 25;
  if ((v237 ^ 0xEA000000) >> 25 <= 0x1C)
    v261 = v260;
  v262 = v259 - 25;
  if (v261 != 231)
    v262 = v260;
  v263 = (v262 ^ 0xE7) - 1025526098 - ((2 * (v262 ^ 0xE7)) & 0x15C);
  v264 = ((v237 ^ 0xFE) - 621451961 - ((2 * (v237 ^ 0xFE)) & 0x8E)) ^ *(_DWORD *)(v73 + 4 * (v237 ^ 0x70u)) ^ (v256 + 2119567010);
  v265 = *(_DWORD *)&v62[4 * (BYTE2(v230) ^ 0xCC)];
  v266 = (((32 * v265) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v265) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v120[4 * (v263 ^ 0xC2DFB68F)];
  v267 = (v266 - 537746566 - ((2 * v266) & 0xBFE546F4)) ^ *(_DWORD *)&v69[4 * (BYTE1(v251) ^ 0xF)];
  v268 = v263 ^ (v267 - 1025526098 - ((2 * v267) & 0x85BF6D5C));
  v269 = *(_DWORD *)(v73 + 4 * (v243 ^ 0x42u)) ^ ((v243 ^ 0xCC)
                                                                   - 621451961
                                                                   - ((2 * (v243 ^ 0xCC)) & 0x8E)) ^ v265 ^ (v268 - ((2 * v268) & 0x6D8EF4A4) - 1228441006);
  v270 = *(_DWORD *)&v62[4 * (BYTE2(v237) ^ 0xF1)];
  v271 = (((32 * v270) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v270) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v120[4 * (HIBYTE(v243) ^ 0x20)];
  v272 = *(_DWORD *)&v62[4 * (BYTE2(v243) ^ 0xD9)];
  v273 = *(_DWORD *)(v73 + 4 * (v251 ^ 0x1Fu)) ^ (v271 - 537746566 - ((2 * v271) & 0xBFE546F4)) ^ ((v251 ^ 0x91) - 621451961 - ((2 * (v251 ^ 0x91)) & 0x8E)) ^ *(_DWORD *)&v69[4 * (BYTE1(v230) ^ 0xA6)];
  v274 = v270 ^ 0x67666E57 ^ (v273 - ((2 * v273) & 0x4C4AC226) + 639983891);
  v275 = (((32 * v272) ^ 0x2861E880) - 1844499505 - ((2 * ((32 * v272) ^ 0x2861E880)) & 0x241E5780)) ^ *(_DWORD *)&v120[4 * (HIBYTE(v251) ^ 0xAC)];
  v276 = *(_DWORD *)(v23 - 120);
  v277 = (v275 - 537746566 - ((2 * v275) & 0xBFE546F4)) ^ *(_DWORD *)&v69[4 * (BYTE1(v237) ^ 0x50)];
  v278 = v272 ^ 0x37BAE5D8 ^ (v277 - ((2 * v277) & 0xEDF3D538) + 1996090012);
  v279 = *(_DWORD *)(v73 + 4 * (v230 ^ 0xD4u));
  v280 = v278 - ((2 * v278) & 0x45062982) - 1568467775;
  HIDWORD(v282) = HIBYTE(v251) ^ v280 ^ 0xBF3 ^ v279;
  LODWORD(v282) = v279 ^ v280 ^ 0xB68C4000;
  v281 = v282 >> 14;
  v283 = (uint64_t)*(&off_24DCDB210 + v276 - 4);
  v284 = HIBYTE(v264) ^ *(_DWORD *)(v283 + 4 * (HIBYTE(v264) ^ 0xE2));
  HIDWORD(v338) = v284 & 0x38EA0183 ^ 0x18220081 | v284 ^ 0xDB3340E9;
  v285 = (v281 >> 2);
  v286 = (v285 ^ 0x7F) - 155723239 + ((2 * (v285 ^ 0x7F) + 1776) & 0xD40 ^ 0xFFCFFFFF);
  v287 = v274 - ((2 * v274) & 0x8B732B2) - 2074371751;
  v288 = BYTE1(v287);
  v289 = (BYTE1(v287) ^ 0x50) + 1396389305 - 2 * ((BYTE1(v287) ^ 0x50) & 0xBBBBBBBB ^ (v287 >> 8) & 2);
  v290 = (uint64_t)*(&off_24DCDB210 + (v276 ^ 0x159));
  v291 = *(_DWORD *)(v290 + 4 * (BYTE2(v264) ^ 0x9Au));
  HIDWORD(v282) = v291 ^ (HIWORD(v264) + 8);
  LODWORD(v282) = v291 ^ ((HIWORD(v264) & 0xF8 ^ 0x60) + 1989809016) ^ 0x801DC6A0;
  v292 = v282 >> 4;
  HIDWORD(v282) = v292 ^ 0x1AB1F25;
  LODWORD(v282) = v292 ^ 0x60000000;
  v293 = HIBYTE(v269);
  v294 = ((v282 >> 28) + 1821723274 - ((2 * (v282 >> 28)) & 0xD92A9514)) ^ *(_DWORD *)(v283 + 4
                                                                                            * (HIBYTE(v269) ^ 0xCD));
  v295 = HIBYTE(v243) ^ v287;
  HIDWORD(v282) = v281;
  LODWORD(v282) = v281;
  v296 = ((BYTE2(v269) ^ 0x86) - 155723239 + ((2 * (BYTE2(v269) ^ 0x86) + 1776) & 0xD40 ^ 0xFFCFFFFF)) ^ *(_DWORD *)(v290 + 4 * (BYTE2(v269) ^ 0x7Cu));
  v297 = (char *)*(&off_24DCDB210 + (v276 & 0x1C5875EE)) - 8;
  v298 = (uint64_t)*(&off_24DCDB210 + v276 + 9);
  v299 = HIBYTE(v287);
  v300 = *(_DWORD *)(v283 + 4 * (HIBYTE(v287) ^ 0xDD)) ^ ((BYTE1(v264) ^ 0x3A)
                                                          + 1396389305
                                                          - ((2 * (BYTE1(v264) ^ 0x3A)) & 0x172)) ^ *(_DWORD *)&v297[4 * (BYTE1(v264) ^ 0x48)] ^ (*(_DWORD *)(v298 + 4 * ((v230 ^ (v281 >> 18)) ^ 0x90u)) - 842061253);
  v301 = *(_DWORD *)(v290 + 4 * (v285 ^ 0x85u));
  v302 = BYTE2(v287);
  LODWORD(v290) = *(_DWORD *)(v290 + 4 * (BYTE2(v287) ^ 0x2Eu));
  v303 = v300 ^ (v296 + 1821723274 - ((2 * v296) & 0xD92A9514));
  v304 = (v281 >> 10);
  v305 = *(_DWORD *)(v283 + 4 * (v304 ^ 0x4Bu));
  LODWORD(v283) = *(_DWORD *)&v297[4 * (v288 ^ 0x22)];
  v306 = ((v302 ^ 0xD4) + 1989809016) ^ v305 ^ 0xEC888C2A ^ v290;
  v307 = v306 - ((2 * v306) & 0xF87B2D70);
  v308 = *(_DWORD *)&v297[4 * (((unsigned __int16)(v282 >> 18) >> 8) ^ 4)] ^ *(_DWORD *)(v23 - 144) ^ (*(_DWORD *)(v298 + 4 * (v295 ^ 0x3Fu)) - 842061253) ^ ((((unsigned __int16)(v282 >> 18) >> 8) ^ 0x76) + 1396389305 - ((2 * (((unsigned __int16)(v282 >> 18) >> 8) ^ 0x76)) & 0x172)) ^ (v294 - ((2 * v294) & 0x1472D688) - 1975948476);
  v309 = v301 ^ *(_DWORD *)(v23 - 140) ^ v283 ^ HIDWORD(v338) ^ v289 ^ v286 ^ (*(_DWORD *)(v298
                                                                                         + 4
                                                                                         * (v269 ^ 0x6Eu))
                                                                             - 842061253);
  v310 = *(_DWORD *)&v297[4 * (BYTE1(v269) ^ 9)] ^ *(_DWORD *)(v23 - 136) ^ (*(_DWORD *)(v298
                                                                                       + 4
                                                                                       * (v339 ^ 0x31 ^ v264))
                                                                           - 842061253) ^ ((BYTE1(v269) ^ 0x7B)
                                                                                         + 1396389305
                                                                                         - ((2 * (BYTE1(v269) ^ 0x7B)) & 0x172)) ^ (v307 - 63072584);
  HIDWORD(v282) = v299 ^ *(_DWORD *)(v23 - 148) ^ (v303 + 664497215 - ((2 * v303) & 0x4F36D992) + 138);
  LODWORD(v282) = HIDWORD(v282) ^ 0xCA;
  v311 = (v282 >> 1) + 177569429 - ((2 * (v282 >> 1)) & 0x152AFD2A);
  HIDWORD(v282) = v311 ^ 0xA957E95;
  LODWORD(v282) = v311;
  v312 = (char *)*(&off_24DCDB210 + v276 - 65) - 4;
  LOBYTE(v264) = v312[BYTE2(v308) ^ 0xCCLL] - ((2 * v312[BYTE2(v308) ^ 0xCCLL] + 70) & 0x78) + 31;
  v313 = (v264 >> 4) ^ (v264 >> 7);
  v314 = (v282 >> 31) - ((2 * (v282 >> 31)) & 0x209D2188) - 1873899324;
  LOBYTE(v264) = v264 ^ 0x6F ^ ((v313 ^ 3) + 2 * ((v313 ^ 3 | 0x7C) ^ v313) + 62);
  v315 = 2 * *(_DWORD *)(v23 - 128) + 22;
  v329[5] = v264;
  v316 = (v315 & 0x12) + (DWORD2(v339) ^ 9);
  LOBYTE(v315) = v312[BYTE2(v314) ^ 0xDDLL] - ((2 * v312[BYTE2(v314) ^ 0xDDLL] + 6) & 0x30);
  LOBYTE(v303) = v315 + 123;
  v317 = ((v315 + 123) >> 4) ^ (((-124 - v315) & 0x80) >> 7);
  v329[v316] = v303 ^ ((v317 ^ 9) + ((2 * ((v317 ^ 9 | 0x78) ^ v317)) ^ 0x1D) - 103) ^ 0xE1;
  v318 = (char *)*(&off_24DCDB210 + (v276 ^ 0x105)) - 8;
  LOBYTE(v317) = v318[v293 ^ 0x1B ^ v308];
  v329[7] = v317 ^ 0x9A ^ (((4 * v317) ^ 0x38) - ((2 * ((4 * v317) ^ 0x38)) & 0x18) - 114);
  v319 = (char *)*(&off_24DCDB210 + (v276 ^ 0x13D)) - 4;
  v320 = v319[BYTE1(v310) ^ 0xD2];
  v329[14] = v320 ^ 0xBD ^ (((32 * (v320 >> 2)) ^ 0xA0) - ((2 * ((32 * (v320 >> 2)) ^ 0xA0)) & 0x40) - 65);
  LOBYTE(v320) = v318[v304 ^ 0xF9 ^ v310];
  LOBYTE(v303) = ((v320 ^ 0xA1) - 47) ^ ((v320 ^ 0x71) + 1);
  LOBYTE(v320) = (v303 - ((2 * v303) & 0x1C) - 114) ^ v320;
  LOBYTE(v320) = v320 + ~(2 * ((v320 + 16) & 0x27 ^ v320 & 1)) - 9;
  v329[15] = v320 ^ 0xD8 ^ (((4 * v320) ^ 0x98) - ((8 * v320) & 0x48) + 38);
  v321 = (char *)*(&off_24DCDB210 + v276 - 50) - 8;
  v329[8] = v321[HIBYTE(v314) ^ 0xDBLL] ^ 0xF;
  v329[2] = v319[BYTE1(v309) ^ 0x45] ^ 0x79 ^ (((8 * v319[BYTE1(v309) ^ 0x45]) & 0xE0 ^ 0xA0) - 111);
  v329[10] = v319[BYTE1(v314) ^ 0xB1] ^ 0xA6 ^ (8 * v319[BYTE1(v314) ^ 0xB1]) & 0xE0;
  LOBYTE(v320) = v312[BYTE2(v309) ^ 0x80] - ((2 * v312[BYTE2(v309) ^ 0x80] + 70) & 0x56) + 14;
  v329[*(_QWORD *)(v23 - 192)] = v320 ^ 0x97 ^ (((v320 >> 4) ^ (v320 >> 7) ^ 0x32)
                                              + ((2
                                                * ((v320 >> 4) ^ (v320 >> 7) ^ ((v320 >> 4) | 0x7B))) ^ 0xD)
                                              - 4);
  v329[*((_QWORD *)&v339 + 1)] = v321[HIBYTE(v309) ^ 0xBBLL] ^ 0x6B;
  LODWORD(v312) = v312[BYTE2(v310) ^ 0x3FLL];
  v322 = (_DWORD)v312 - 84;
  LODWORD(v312) = (2 * (_DWORD)v312 - 58) & 0xFFFFFF90;
  v323 = (~(_DWORD)v312 + v322);
  LODWORD(v312) = ((~(_BYTE)v312 + v322) >> 4) ^ ((((_BYTE)v312 - v322) & 0x80) >> 7);
  v324 = (v312 ^ 0xC) & 0xFFFFFFF9;
  v329[13] = v323 ^ 0x24 ^ ((v312 ^ 0xC)
                          - 2 * ((v312 ^ 0xC) & 0xF9 ^ v312 & 1)
                          - 56);
  LOBYTE(v309) = v318[v309 ^ 0xB9];
  LOBYTE(v312) = ((4 * v309) ^ 0x38) - ((2 * ((4 * v309) ^ 0x38)) & 0x18) - 114;
  v329[3] = ((v312 ^ v309) & 0xDF ^ 0x2B) & (v312 ^ ~(_BYTE)v309 | 0xDF);
  v329[*(_QWORD *)(v23 - 176)] = (((8 * v319[BYTE1(v308) ^ 0xBDLL]) & 0xE0 ^ 0x5F) + 103) ^ v319[BYTE1(v308) ^ 0xBDLL];
  v329[*(_QWORD *)(v23 - 184)] = v321[HIBYTE(v310) ^ 0x8CLL] ^ 0xFE;
  v329[*(_QWORD *)(v23 - 168)] = v321[HIBYTE(v308) ^ 0x6CLL] ^ 1;
  LOBYTE(v308) = v318[((v282 >> 31) - ((2 * (v282 >> 31)) & 0x88) - 60) ^ 0xA7];
  v329[*(_QWORD *)(v23 - 160)] = v308 ^ 0x9B ^ (((4 * v308) ^ 0x38) - ((2 * ((4 * v308) ^ 0x38)) & 0x18) - 114);
  v325 = *(_DWORD *)(v23 - 128) + 1542206020;
  v326 = DWORD1(v339) ^ (v325 < 0x7171E539);
  v327 = v325 < *(_DWORD *)(v23 - 132);
  if (v326)
    v327 = DWORD1(v339);
  return ((uint64_t (*)(uint64_t, uint64_t, char *, uint64_t, char *, _UNKNOWN **, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int8 *, uint64_t, char *, uint64_t, char *, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a20 + 8 * (v276 ^ (8 * v327))) - 12))(4294967184, v323, v319, v324, v321, &off_24DCDB210, *((_QWORD *)&v339 + 1), 189, a9, a10, a11, a12, v329, a14, v330, v331, v332, v333, v334,
           a20,
           v335,
           v336,
           v338,
           v339,
           *((_QWORD *)&v339 + 1),
           14);
}

void sub_21A5A4628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22,int a23,int a24)
{
  int v24;
  int v25;
  uint64_t v26;

  *(_DWORD *)(v26 - 140) = a24 ^ 0xAA1CA5C7;
  *(_DWORD *)(v26 - 136) = a21 ^ 0xED85E748;
  *(_DWORD *)(v26 - 144) = a22 ^ 0x97C515EA;
  *(_DWORD *)(v26 - 148) = a23 ^ ((v25 - 18) | v24) ^ 0x50ACF0BD;
  JUMPOUT(0x21A5A188CLL);
}

uint64_t sub_21A5A4690()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v2 | (795 * (v1 != v0))))
                            - ((v2 + 63) ^ 0xD3)))();
}

uint64_t sub_21A5A46C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  int v7;
  char v8;
  uint64_t v9;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v9
                                                                                        + 8
                                                                                        * ((703
                                                                                          * ((((v8 & 8) == 0) ^ (a7 - 98)) & 1)) ^ a7))
                                                                            - ((a7 - 1010564342) & 0x3C3BFE7F)
                                                                            + 605))(a1, a2, a3, (a7 + 1639087518) & 0x9E4D83EB, (a3 - v7));
}

uint64_t sub_21A5A4724(int a1, int a2, char a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  char v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  char v31;
  uint64_t v32;
  int8x16x4_t v34;

  *(_DWORD *)(v28 - 120) = v29;
  *(_DWORD *)(v28 - 132) = v24 & 0xFFFFFFF8;
  *(_DWORD *)(v28 - 128) = v24;
  v30 = -v23;
  v31 = v25 + a1 + v26;
  *(_DWORD *)(v28 - 136) = 32 * (a6 ^ 0x26C);
  v32 = (a1 + v26 + a2 + v30);
  v34.val[0].i64[0] = ((_BYTE)a1 + (_BYTE)v26 + (_BYTE)a2 + (_BYTE)v30) & 0xF;
  v34.val[0].i64[1] = (v31 + 9 + (_BYTE)v30) & 0xF;
  v34.val[1].i64[0] = (v31 + 8 + (_BYTE)v30) & 0xF;
  v34.val[1].i64[1] = (v31 + 7 + (_BYTE)v30) & 0xF;
  v34.val[2].i64[0] = (v31 + 6 + (_BYTE)v30) & 0xF;
  v34.val[2].i64[1] = (v31 + 5 + (_BYTE)v30) & 0xF;
  v34.val[3].i64[0] = (a3 + (_BYTE)v30 - 92) & 0xF;
  v34.val[3].i64[1] = (v31 + 3 + (_BYTE)v30) & 0xF;
  *(int8x8_t *)(v27 - 7 + v32) = vrev64_s8(veor_s8(veor_s8(vrev64_s8(veor_s8(veor_s8(*(int8x8_t *)(v27 - 7 + v32), *(int8x8_t *)(v20 + (v32 & 0xF) - 7)), veor_s8(*(int8x8_t *)(v22 + (v32 & 0xF) - 7), *(int8x8_t *)((v32 & 0xF) + v21 - 1)))), (int8x8_t)0x4949494949494949), vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v34, (int8x16_t)xmmword_21A5D5140), (int8x8_t)0x6969696969696969)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a20
                                                     + 8
                                                     * (((8 - (v24 & 0xFFFFFFF8) != v30) | (4
                                                                                          * (8 - (v24 & 0xFFFFFFF8) != v30))) ^ (a6 + 127)))
                                         - 8))((__n128)xmmword_21A5D5140);
}

void sub_21A5A4860()
{
  JUMPOUT(0x21A5A4788);
}

uint64_t sub_21A5A4868()
{
  uint64_t v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * (((((*(_DWORD *)(v1 - 128) == *(_DWORD *)(v1 - 132)) ^ (*(_DWORD *)(v1 - 136) + 1)) & 1)
                                          * ((*(_DWORD *)(v1 - 136) ^ 0x2C9) - 490)) ^ *(_DWORD *)(v1 - 136)))
                            - 12))();
}

uint64_t sub_21A5A48A8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = (a5 - 1040902294);
  *(_BYTE *)(v9 + v11) ^= *(_BYTE *)(v6 + (v11 & 0xF)) ^ *(_BYTE *)(v8 + (v11 & 0xF)) ^ *(_BYTE *)((v11 & 0xF) + v7 + 6) ^ (105 * (v11 & 0xF)) ^ 0x49;
  return (*(uint64_t (**)(void))(v10 + 8 * ((533 * (a5 - 1 == v5)) ^ (a4 - 347))))();
}

void sub_21A5A4918()
{
  int v0;
  int v1;
  uint64_t v2;

  if (v0 == 1616664337)
    v1 = 1412947868;
  else
    v1 = 1412905844;
  *(_DWORD *)(v2 + 12) = v1;
}

void tbttItCTp3MZ(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_21A5A49C8@<X0>(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  _BOOL4 v3;

  v3 = (*(uint64_t (**)(_QWORD))(a2 + 1856))(a1) == 0;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * ((10 * v3) ^ 0x3A1)) - 8))(4294925268);
}

uint64_t sub_21A5A4A38@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = 0;
  *v1 = a1;
  return result;
}

uint64_t sub_21A5A4A54(uint64_t a1)
{
  int v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  int v5;

  v1 = 1613850677 * ((-788082819 - (a1 | 0xD106CF7D) + (a1 | 0x2EF93082)) ^ 0x13A25E85);
  v2 = *(_DWORD *)(a1 + 8) ^ v1;
  v3 = (*(_DWORD *)(a1 + 12) ^ v1) - 1694817508;
  v4 = v3 + (*(_DWORD *)(*(_QWORD *)a1 - 0x77E232005DB2DB68) ^ 0x80E48C67);
  v5 = v4 - ((2 * v4) & 0x1C918CE) - 2132505497;
  *(_DWORD *)(*(_QWORD *)a1 - 0x77E232005DB2DB68) = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)((char *)*(&off_24DCDB210 + v2 - 547)
                                        + 8 * ((366 * ((v5 ^ 0x80E48C67) < v3)) ^ v2)
                                        - 12)
                            - 12))();
}

void sub_21A5A4B24(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0x77E232005DB2DB6CLL) = (*(_DWORD *)(a1 - 0x77E232005DB2DB6CLL) ^ 0xF81C24EF)
                                         - 132373265
                                         - ((2 * (*(_DWORD *)(a1 - 0x77E232005DB2DB6CLL) ^ 0xF81C24EF) + 2) & 0xF03849DE)
                                         + 1;
}

void sub_21A5A4B6C(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 24) - 654962069 * (a1 ^ 0xEF500067);
  __asm { BR              X16 }
}

uint64_t sub_21A5A4C98()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2
                                                      + 8
                                                      * ((295 * (((v0 + 1423420627) & 0xAB2853FF) + 1113739322 != v1)) ^ v0))
                                          - 8))(1425094987);
}

uint64_t sub_21A5A4CF4(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  _BOOL4 v16;

  v12 = (a1 - 1425094987);
  *(_BYTE *)(*(_QWORD *)(v11 - 120) + v12) = *(_BYTE *)(v2 + (v12 & 0xF)) ^ *(_BYTE *)(v1 + v12) ^ *(_BYTE *)((v12 & 0xF) + v3 + 4) ^ *(_BYTE *)(v4 + (v12 & 0xF)) ^ (-109 * ((a1 - 75) & 0xF));
  LODWORD(v12) = v5 + 211 + a1;
  v13 = a1 + 306885670;
  v14 = (v12 - 430);
  v15 = (v7 > 0x98C4128F) ^ (v13 < v6);
  v16 = v13 < v8;
  if (v15)
    v16 = v7 > 0x98C4128F;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v10 + 8 * ((v16 * v9) ^ v5)) - 8))(v14);
}

uint64_t sub_21A5A4D94()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (v0 ^ (16
                                               * (((2 * v1) & 0xF3FFEBCE ^ (334 * (v0 ^ 0x3E8)) ^ 0x80C4A028)
                                                + (v1 ^ 0x3B9DA40E)
                                                + (((v0 - 732) | 0xA0) ^ 0xD6F6BAAF) != 1358344423))))
                            - 4))();
}

uint64_t sub_21A5A4E0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (((a6 - 982) * ((v7 + v6 - 2046817767) > 7)) | a6))
                            - 4))();
}

uint64_t sub_21A5A4E50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, int a8)
{
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * ((1865 * (a8 + 3 * (a6 ^ 0x397u) >= ((3 * (a6 ^ 0x3BD)) ^ 0xFFFFFEF5))) ^ a6))
                            - 4))();
}

uint64_t sub_21A5A4E98(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _BOOL4 v21;

  v12 = *(_QWORD *)(v11 - 120);
  v13 = (v9 + v8 + v7 + 391) + v12;
  v14 = ((_BYTE)v9 + (_BYTE)v8 + (_BYTE)v7 - 121) & 0xF;
  v15 = v14 + v4 - v13;
  v16 = (v14 | v5) - v13;
  v17 = (v14 | v6) - v13;
  v21 = (unint64_t)(a3 - v12 - 0x2776B68A6AEF3190) < 0x10
     || v15 < 0x10
     || (unint64_t)(v16 + 4) < 0x10
     || v17 < ((a4 - 133) ^ 0x90uLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((2 * v21) | (8 * v21) | a4)) - 12))();
}

uint64_t sub_21A5A4F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  unsigned int v8;
  uint64_t v9;

  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v9 + 8 * (a8 | (550 * (v8 > 0xF))))
                                                           - ((238 * (a8 ^ 0x83) - 1935282892) & 0x735A12FE)
                                                           + 758))(a1, a2, 0);
}

uint64_t sub_21A5A4F7C(int a1, int a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  int8x16_t v27;
  uint64_t v28;
  int8x16_t v29;
  int8x16_t v30;
  int8x16x4_t v32;
  int8x16x4_t v33;

  v32.val[1].i64[0] = ((_BYTE)a2 + 6) & 0xF;
  v32.val[1].i64[1] = ((_BYTE)a2 + 5) & 0xF;
  v32.val[2].i64[0] = ((_BYTE)a2 + 4) & 0xF;
  v32.val[2].i64[1] = ((_BYTE)a2 + 3) & 0xF;
  v32.val[3].i64[0] = ((_BYTE)a2 + 2) & 0xF;
  v32.val[3].i64[1] = ((_BYTE)a2 + 1) & 0xF;
  v27.i64[0] = 0x9393939393939393;
  v27.i64[1] = 0x9393939393939393;
  v28 = v22 + v24 + v25 + a1 - 478 + ((a4 - 738) | 0x1C2);
  v32.val[0].i64[0] = ((_BYTE)v22 + (_BYTE)v24 + (_BYTE)v25 + (_BYTE)a1 + 34 + ((a4 + 30) | 0xC2)) & 0xF;
  v32.val[0].i64[1] = ((_BYTE)a2 + 7) & 0xF;
  v29.i64[0] = vqtbl4q_s8(v32, (int8x16_t)xmmword_21A5D5130).u64[0];
  v33.val[0].i64[1] = ((_BYTE)a2 - 1) & 0xF;
  v33.val[1].i64[1] = ((_BYTE)a2 + 13) & 0xF;
  v33.val[2].i64[1] = ((_BYTE)a2 + 11) & 0xF;
  v33.val[3].i64[1] = ((_BYTE)a2 + 9) & 0xF;
  v33.val[0].i64[0] = a2 & 0xF;
  v33.val[1].i64[0] = ((_BYTE)a2 + 14) & 0xF;
  v33.val[2].i64[0] = ((_BYTE)a2 + 12) & 0xF;
  v33.val[3].i64[0] = (a2 + 10) & 0xF;
  v29.i64[1] = vqtbl4q_s8(v33, (int8x16_t)xmmword_21A5D5130).u64[0];
  v30 = vrev64q_s8(vmulq_s8(v29, v27));
  *(int8x16_t *)(*(_QWORD *)(v26 - 120) - 15 + v28) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v19 + (v28 & 0xF) - 15), *(int8x16_t *)(v18 - 15 + v28)), veorq_s8(*(int8x16_t *)((v28 & 0xF) + v20 - 11), *(int8x16_t *)(v21 + (v28 & 0xF) - 15))), vextq_s8(v30, v30, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a18 + 8 * ((1682 * ((v23 & 0xFFFFFFF0) == 16)) ^ a4)) - 12))();
}

void sub_21A5A50E0()
{
  JUMPOUT(0x21A5A5064);
}

uint64_t sub_21A5A50EC(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return (*(uint64_t (**)(void))(v5 + 8 * (((((v4 ^ 0x15E) + 449) ^ (v4 - 47)) * (v3 == a3)) ^ v4)))();
}

uint64_t sub_21A5A511C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  char v7;
  uint64_t v8;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(v8 + 8 * (((a7 ^ 0x92) * ((v7 & 8) == 0)) | a7))
                                                                                            - ((a7 + 247) ^ 0x17FLL)))(a1, a2, a3, (a7 + 247), (a2 - a3), a7 ^ 0x24Au, (a7 + 247));
}

uint64_t sub_21A5A515C(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  unsigned int v27;
  int v28;
  char v29;
  char v30;
  unsigned int v31;
  int8x16x4_t v33;

  v27 = a3 - (v23 & 0xFFFFFFF8) + 8;
  v28 = v25 + a1 + v24;
  v29 = v28 - a3;
  v30 = v28 - a3 - 14;
  v31 = v28 + v22 - a3;
  v33.val[0].i64[0] = v31 & 0xF;
  v33.val[0].i64[1] = (v29 + 7) & 0xF;
  v33.val[1].i64[0] = (v29 + 6) & 0xF;
  v33.val[1].i64[1] = (v29 + 5) & 0xF;
  v33.val[2].i64[0] = (v29 + 4) & 0xF;
  v33.val[2].i64[1] = (v29 + 3) & 0xF;
  v33.val[3].i64[0] = (v29 + 2) & 0xF;
  v33.val[3].i64[1] = (v30 + ((a6 + 65) | 4)) & 0xF;
  *(int8x8_t *)(*(_QWORD *)(v26 - 120) - 7 + v31) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v19 + v33.val[0].i64[0] - 7), *(int8x8_t *)(v18 - 7 + v31)), veor_s8(*(int8x8_t *)(v33.val[0].i64[0] + v20 - 3), *(int8x8_t *)(v21 + v33.val[0].i64[0] - 7))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v33, (int8x16_t)xmmword_21A5D5140), (int8x8_t)0x9393939393939393)));
  return (*(uint64_t (**)(__n128))(a18 + 8 * ((1784 * (v27 == 0)) ^ a6)))((__n128)xmmword_21A5D5140);
}

void sub_21A5A5280()
{
  JUMPOUT(0x21A5A51B4);
}

uint64_t sub_21A5A5288@<X0>(int a1@<W8>)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v2 ^ ((2 * (v1 == a1)) | (32 * (v1 == a1)))))
                            - (((v2 - 222) | 0x146u) ^ 0x17BLL)))();
}

uint64_t sub_21A5A52C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = (a5 + v12);
  *(_BYTE *)(*(_QWORD *)(v14 - 120) + v15) = *(_BYTE *)(v8 + (v15 & 0xF)) ^ *(_BYTE *)(v7 + v15) ^ *(_BYTE *)(v10 + (v15 & 0xF)) ^ *(_BYTE *)((a7 + 56) + (unint64_t)(v15 & 0xF) + v9 - 427) ^ (-109 * (v15 & 0xF));
  return ((uint64_t (*)(void))(*(_QWORD *)(v13 + 8 * (((a5 - 1 == v11) | ((a5 - 1 == v11) << 6)) ^ (a7 - 218))) - 8))();
}

uint64_t sub_21A5A5330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;

  v12 = vrev64q_s8(*(int8x16_t *)*(_QWORD *)(v9 + 16));
  v13 = vextq_s8(v12, v12, 8uLL);
  v14.i64[0] = 0xFAFAFAFAFAFAFAFALL;
  v14.i64[1] = 0xFAFAFAFAFAFAFAFALL;
  v15 = vandq_s8(vaddq_s8(v13, v13), v14);
  v14.i64[0] = 0xFDFDFDFDFDFDFDFDLL;
  v14.i64[1] = 0xFDFDFDFDFDFDFDFDLL;
  v16 = veorq_s8(v13, v14);
  v14.i64[0] = 0xF7F7F7F7F7F7F7F7;
  v14.i64[1] = 0xF7F7F7F7F7F7F7F7;
  v17 = vrev64q_s8(veorq_s8(vaddq_s8(vaddq_s8(v16, v14), v15), (int8x16_t)xmmword_21A5D5180));
  *(int8x16_t *)(v11 - 112) = vextq_s8(v17, v17, 8uLL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 8 * (int)((((a4 + 362) ^ 0x307) * (*(_QWORD *)(v11 - 120) != 0)) ^ a4)))(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t sub_21A5A53A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11)
{
  uint64_t v11;
  _BOOL4 v13;

  v13 = (((_BYTE)a11 + (a4 ^ 0xB6) - 10) & 0xF) == 0 && a11 != 1977584865;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 8 * (int)((v13 * ((a4 + 801078608) & 0xD04083BB ^ 0xC7)) ^ a4)))(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t sub_21A5A540C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  int v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  int v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  unsigned __int8 *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  int v38;
  int v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  unsigned int v43;
  int v44;
  uint64_t v45;
  char *v46;
  char *v47;
  int v48;
  char *v49;
  uint64_t v50;
  char *v51;
  unsigned int v52;
  int v53;
  int v54;
  int v55;
  unsigned int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  uint64_t v61;
  int v62;
  unsigned __int8 v63;
  int v64;
  int v65;
  unsigned int v66;
  int v67;
  int v68;
  int v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  int v74;
  int v75;
  unsigned int v76;
  int v77;
  unsigned int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  unsigned int v83;
  unsigned int v84;
  int v85;
  unsigned int v86;
  unint64_t v87;
  int v88;
  int v89;
  int v90;
  unsigned int v91;
  unsigned int v92;
  int v93;
  int v94;
  unsigned int v95;
  unsigned int v96;
  int v97;
  int v98;
  unsigned int v99;
  unsigned int v100;
  int v101;
  int v102;
  unsigned int v103;
  int v104;
  int v105;
  unsigned int v106;
  int v107;
  unsigned int v108;
  int v109;
  unsigned int v110;
  int v111;
  int v112;
  int v113;
  unsigned int v114;
  unsigned int v115;
  int v116;
  int v117;
  unsigned int v118;
  int v119;
  unsigned int v120;
  int v121;
  unsigned int v122;
  unsigned int v123;
  int v124;
  int v125;
  unsigned int v126;
  int v127;
  unsigned int v128;
  int v129;
  unsigned int v130;
  unsigned int v131;
  int v132;
  unsigned int v133;
  int v134;
  unint64_t v135;
  int v136;
  int v137;
  unsigned int v138;
  unsigned int v139;
  int v140;
  int v141;
  unsigned int v142;
  int v143;
  unsigned int v144;
  unsigned int v145;
  unsigned int v146;
  int v147;
  unsigned int v148;
  int v149;
  int v150;
  unsigned int v151;
  int v152;
  unsigned int v153;
  unsigned int v154;
  unsigned int v155;
  unsigned int v156;
  unsigned int v157;
  unsigned int v158;
  int v159;
  unsigned int v160;
  unsigned int v161;
  unsigned int v162;
  unsigned int v163;
  char v164;
  int v165;
  unsigned int v166;
  int v167;
  unsigned int v168;
  int v169;
  int v170;
  int v171;
  unsigned int v172;
  unsigned int v173;
  unsigned int v174;
  int v175;
  int v176;
  unsigned int v177;
  unsigned int v178;
  int v179;
  int v180;
  unsigned __int8 v181;
  int v182;
  unsigned int v183;
  int v184;
  unsigned int v185;
  unsigned int v186;
  unsigned int v187;
  int v188;
  int v189;
  int v190;
  unsigned int v191;
  uint64_t v192;
  int v193;
  int v194;
  unsigned int v195;
  unsigned int v196;
  int v197;
  int v198;
  int v199;
  int v200;
  unsigned int v201;
  int v202;
  int v203;
  unsigned int v204;
  unsigned int v205;
  unsigned int v206;
  int v207;
  unsigned int v208;
  int v209;
  int v210;
  unsigned int v211;
  unsigned int v212;
  int v213;
  int v214;
  unsigned int v215;
  unsigned int v216;
  int v217;
  int v218;
  unsigned int v219;
  unsigned int v220;
  int v221;
  int v222;
  int v223;
  unsigned int v224;
  int v225;
  int v226;
  unsigned int v227;
  unsigned int v228;
  unsigned int v229;
  unsigned int v230;
  uint64_t v231;
  unsigned int v232;
  unsigned int v233;
  unsigned int v234;
  int v235;
  int v236;
  char *v237;
  int v238;
  int v239;
  int v240;
  int v241;
  char *v242;
  int v243;
  _BYTE *v244;
  int v245;
  int v246;
  unsigned int v247;
  unsigned int v248;
  unsigned int v249;
  unsigned int v250;
  char *v251;
  int v252;
  int v253;
  int v254;
  unsigned int v255;
  char *v256;
  unsigned int v257;
  unsigned int v258;
  unsigned int v259;
  unsigned int v260;
  char *v261;
  unsigned int v262;
  int v263;
  unsigned int v264;
  unsigned int v265;
  int v266;
  unsigned int v267;
  unsigned int v268;
  char *v269;
  char *v270;
  unsigned int v271;
  unsigned int v272;
  unsigned int v273;
  uint64_t v274;
  uint64_t v275;
  char v276;
  BOOL v277;
  char v278;
  char v279;
  int v280;
  unsigned int v281;
  int v282;
  unsigned int v283;
  unsigned int v284;
  int v285;
  unsigned int v286;
  char *v288;
  char *v289;
  char *v290;
  char *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  unint64_t v295;
  unint64_t v296;
  uint64_t v297;
  uint64_t v298;
  int v299;
  uint64_t v300;
  uint64_t v301;

  v21 = (char *)*(&off_24DCDB210 + v19 - 402) - 8;
  v22 = (char *)*(&off_24DCDB210 + v19 - 695) - 4;
  v23 = (char *)*(&off_24DCDB210 + v19 - 585) - 8;
  v291 = v21;
  v289 = v23;
  v24 = (char *)*(&off_24DCDB210 + (v19 ^ 0x269)) - 8;
  v25 = v21[*(unsigned __int8 *)(v20 - 101) ^ 0x2ELL] ^ 4 | (((*(unsigned __int8 *)(v20 - 104)
                                                                              - ((2 * *(unsigned __int8 *)(v20 - 104)) & 0xC0)
                                                                              + 96) ^ 0xA1 ^ v22[*(unsigned __int8 *)(v20 - 104) ^ 0x6BLL]) << 24) | ((v23[*(unsigned __int8 *)(v20 - 102) ^ 0x20] ^ 0xA0) << 8) | ((v24[*(unsigned __int8 *)(v20 - 103) ^ 0x1CLL] ^ (*(_BYTE *)(v20 - 103) + (~(2 * *(_BYTE *)(v20 - 103)) | 0x4D) - 38) ^ 0x2C) << 16);
  v288 = v24;
  v290 = v22;
  v26 = v21[*(unsigned __int8 *)(v20 - 109) ^ 0xFALL] ^ 5 | ((((v22[*(unsigned __int8 *)(v20 - 112) ^ 0xF1] ^ 0x60)
                                                                              + (*(unsigned __int8 *)(v20 - 112) ^ 0xFFFFFFE3)
                                                                              - 2
                                                                              * ((v22[*(unsigned __int8 *)(v20 - 112) ^ 0xF1] ^ 0x60) & (*(unsigned __int8 *)(v20 - 112) ^ 0xFFFFFFE3))) ^ 0xBBBBBBBB) << 24) | ((v23[*(unsigned __int8 *)(v20 - 110) ^ 0xF0] ^ 0x91) << 8) | ((v24[*(unsigned __int8 *)(v20 - 111) ^ 0x80] ^ (*(_BYTE *)(v20 - 111) - ((2 * *(_BYTE *)(v20 - 111)) & 0xB2) - 39) ^ 0xD0) << 16);
  v27 = v21[*(unsigned __int8 *)(v20 - 105) ^ 0x51] ^ 5 | ((v23[*(unsigned __int8 *)(v20 - 106) ^ 0x7ALL] ^ 0x23) << 8) | ((v24[*(unsigned __int8 *)(v20 - 107) ^ 0x86] ^ (*(_BYTE *)(v20 - 107) - ((2 * *(_BYTE *)(v20 - 107)) & 0xB2) - 39) ^ 0x53) << 16) | ((v22[*(unsigned __int8 *)(v20 - 108) ^ 0xALL] ^ (*(unsigned __int8 *)(v20 - 108) - ((2 * *(unsigned __int8 *)(v20 - 108)) & 0xC0) + 96) ^ 0xA5) << 24);
  *(_DWORD *)(v20 - 144) = (v21[((v19 + 41) ^ *(_BYTE *)(v20 - 97))] ^ 5 | ((v23[*(unsigned __int8 *)(v20 - 98) ^ 0x8BLL] ^ 0x96) << 8) | (((*(unsigned __int8 *)(v20 - 100) - ((2 * *(unsigned __int8 *)(v20 - 100)) & 0xC0) + 96) ^ 0xB2 ^ v22[*(unsigned __int8 *)(v20 - 100) ^ 0xC0]) << 24) | ((v24[*(unsigned __int8 *)(v20 - 99) ^ 0x6DLL] ^ (*(_BYTE *)(v20 - 99) - ((2 * *(_BYTE *)(v20 - 99)) & 0xB2) - 39) ^ 0x86) << 16)) ^ 0xAD4B0E40;
  *(_DWORD *)(v20 - 140) = v26 ^ 0x51C6375D;
  *(_DWORD *)(v20 - 136) = v25 ^ 0xE17D0FF3;
  v28 = v19 - 268;
  *(_DWORD *)(v20 - 132) = v27 ^ 0x5370F601;
  HIDWORD(a11) = -201331201;
  LODWORD(v292) = 0;
  v29 = *(unsigned __int8 **)(v20 - 120);
  v30 = v29[11];
  HIDWORD(v292) = ((v19 - 268) ^ 0x1AC) + 790;
  v31 = HIDWORD(v292) ^ 0x31Du;
  *(_QWORD *)(v20 - 192) = v31;
  v32 = v21[v30 ^ 0xE7];
  v298 = v21[v30 ^ 0xE7];
  v299 = v30 ^ 0xE7;
  v33 = (v29[v31] + (~(2 * v29[v31]) | 0x3F) + 97) ^ v22[v29[v31] ^ 0x6FLL];
  *(_QWORD *)(v20 - 152) = 12;
  v34 = v29[12];
  *(_QWORD *)(v20 - 176) = 0;
  LODWORD(v31) = v22[v34 ^ 0x36] ^ (v34 - ((2 * v34) & 0xC0) + 96) ^ 0xAC;
  v35 = (*v29 ^ -*v29 ^ (220 - (*v29 ^ 0xDCu))) + 220;
  v36 = v22[v35 ^ 0xFB];
  *(_QWORD *)(v20 - 160) = 9;
  v37 = v29[9];
  LODWORD(v35) = (v35 - (v35 >> 5 << 6) + 96) ^ v36;
  *(_DWORD *)(v20 - 124) = (v32 ^ 5) - 1437866805 - ((2 * (v32 ^ 5)) & 0x196);
  v38 = v29[14];
  *(_DWORD *)(v20 - 128) = v24[v37 ^ 0xDD] ^ v37;
  *(_QWORD *)(v20 - 200) = 8;
  v39 = v22[v29[8] ^ 0x8DLL] ^ v29[8];
  *(_QWORD *)(v20 - 184) = 7;
  v40 = v21[v29[7] ^ 0x15];
  LODWORD(v23) = (v40 ^ 5) + 1134969609 - ((2 * (v40 ^ 5)) & 0x12);
  v41 = v289[v29[2] ^ 0xE8];
  v42 = v21[v29[3] ^ 0xC5];
  LODWORD(v37) = ((v24[v29[1] ^ 0x62] ^ (v29[1] - ((2 * v29[1]) & 0xB2) - 39) ^ 0xA3) << 16) | ((v41 ^ 0x20) << 8) | v42 ^ 5 | ((v35 ^ 0x1D) << 24);
  v43 = v37 + 814247544 - 2 * (v37 & 0x30886E7C ^ (v42 ^ 5) & 4);
  *(_QWORD *)(v20 - 168) = 13;
  LODWORD(v37) = v24[v29[13] ^ 0x3DLL] ^ (v29[13] - ((2 * v29[13]) & 0xB2) - 39) ^ 0x94;
  HIDWORD(v294) = 233 * ((v19 - 268) ^ 0x1AC);
  v301 = (HIDWORD(v294) - 715) & 0x26E85B5E ^ 0x26E85B5Fu;
  v44 = v37 - 2138286585 - ((2 * v37) & 0x6A) + 46;
  v45 = v21[v29[v301] ^ 0x32];
  LODWORD(v31) = (v44 << 16) ^ 0x56350000 | ((_DWORD)v31 << 24) | v45 ^ 5 | ((v289[(((2 * v38) & 0xFFFFFFF7) + (v38 ^ 0x7EFBECFB) - ((2 * (((2 * v38) & 0xFFFFFFF7) + (v38 ^ 0x7EFBECFB)) + 10) & 0xA0) - 2130439339) ^ 0xA0] ^ 0x91) << 8);
  LODWORD(v37) = v31 - 2 * (v31 & 0x4E1AE65F ^ (v45 ^ 5) & 0x12);
  v46 = (char *)*(&off_24DCDB210 + (int)(v28 - 113)) - 8;
  LODWORD(v31) = *(_DWORD *)&v46[4 * (v44 ^ 0x808C5607)];
  v47 = (char *)*(&off_24DCDB210 + (int)(v28 ^ 0x1E6)) - 12;
  LODWORD(v294) = v289[v29[10] ^ 0xAELL];
  v48 = *(_DWORD *)&v47[4 * (v294 ^ 0xD7)];
  v300 = v28 | 0x26E85B5E00000000;
  v49 = (char *)*(&off_24DCDB210 + (v28 & 0x53FCEAC8)) - 8;
  LODWORD(v35) = v48 ^ *(_DWORD *)&v49[4 * (v35 ^ 0xE1)] ^ (237114840 * (v48 ^ 0xE18E6674)
                                                                           - ((474229680 * (v48 ^ 0xE18E6674)) & 0xE30843C0)
                                                                           + 1904484835) ^ (((32 * v31) ^ 0x3E2A180)
                                                                                          + 1700791148
                                                                                          - ((2
                                                                                            * ((32 * v31) ^ 0x3E2A180)) & 0xCAC006C0));
  v50 = v40 ^ 0xAF;
  v51 = (char *)*(&off_24DCDB210 + (v28 & 0x4EA1AC70)) - 4;
  LODWORD(v35) = ((v35 ^ 0x900A4797) + 2002239527 - 2 * ((v35 ^ 0x900A4797) & 0x7757C02F ^ v35 & 8)) ^ *(_DWORD *)&v51[4 * v50];
  v52 = v31 ^ v23 ^ (v35 + 1134969609 - ((2 * v35) & 0x874C8612));
  LODWORD(v35) = *(_DWORD *)&v46[4 * (BYTE2(v43) ^ 0xC4)];
  LODWORD(v37) = v37 - 837097907;
  v53 = *(_DWORD *)&v47[4 * (BYTE1(v37) ^ 0xC4)];
  LODWORD(v50) = *(_DWORD *)&v49[4 * (v33 ^ 0xB8)] ^ v53 ^ (((32 * v35) ^ 0x3E2A180)
                                                                           + 1700791148
                                                                           - ((2 * ((32 * v35) ^ 0x3E2A180)) & 0xCAC006C0)) ^ 0xEECA8313 ^ (237114840 * (v53 ^ 0xE18E6674) - ((474229680 * (v53 ^ 0xE18E6674)) & 0x1E89CAC0) + 256173415);
  LODWORD(v31) = *(_DWORD *)(v20 - 124);
  LODWORD(v35) = *(_DWORD *)&v51[4 * (v31 ^ 0xAA4BE41E)] ^ v35 ^ (v50
                                                                              + 2002239527
                                                                              - ((2 * v50) & 0xEEAF804E));
  v54 = *(_DWORD *)&v47[4 * (v41 ^ 0x73)];
  v296 = __PAIR64__(v33, v39);
  LODWORD(v50) = *(_DWORD *)&v49[4 * (v39 ^ 0xB7)] ^ (237114840 * (v54 ^ 0xE18E6674)
                                                                     + 1700791148
                                                                     - ((474229680 * (v54 ^ 0xE18E6674)) & 0xCAC006D0)) ^ v37;
  v55 = ((v50 ^ 0xC4) + 2002239527 - 2 * ((v50 ^ 0xC4) & 0x7757C03F ^ v50 & 0x18)) ^ *(_DWORD *)&v51[4 * (v45 ^ 0x1E)];
  HIDWORD(v293) = v24[v29[5] ^ 0x41] ^ v29[5];
  LODWORD(v50) = *(_DWORD *)&v46[4 * (BYTE4(v293) ^ 0x28)];
  v56 = v54 ^ v50 ^ (((32 * v50) ^ 0x3E2A180 ^ v55)
                   + 2016610329
                   - 2 * (((32 * v50) ^ 0x3E2A180 ^ v55) & 0x7833081B ^ v55 & 2));
  v57 = *(_DWORD *)&v46[4 * (*(_DWORD *)(v20 - 128) ^ 0x6D)];
  LODWORD(v50) = ((32 * v57) ^ 0x3E2A180) + 83700077 - ((2 * ((32 * v57) ^ 0x3E2A180)) & 0x9FA52C0);
  v57 ^= 0xB01F150C;
  LODWORD(v50) = v50 ^ 0x4FD296D;
  v58 = v50 & v57;
  v59 = v50 | v57;
  LODWORD(v50) = v58 + 1700791148 - ((2 * v58) & 0xCAC006D8);
  HIDWORD(a19) = v289[v29[6] ^ 0x6BLL];
  v60 = *(_DWORD *)&v47[4 * (HIDWORD(a19) ^ 0xF5)];
  v295 = __PAIR64__(v23, v43);
  LODWORD(v293) = v37;
  v61 = *(_DWORD *)&v49[4 * (BYTE3(v37) ^ 0x6A)] ^ ((v43 ^ 0x56)
                                                  + 2002239527
                                                  - ((2 * (v43 ^ 0x56)) & 0x4E)) ^ v60 ^ *(_DWORD *)&v51[4 * (v42 ^ 0xB9)] ^ (237114840 * (v60 ^ 0xE18E6674) - ((474229680 * (v60 ^ 0xE18E6674)) & 0xDA327A00) + 1830370563) ^ v59 ^ v50;
  v62 = *(_DWORD *)&v46[4 * (BYTE2(v61) ^ 0xBD)];
  v63 = BYTE1(v35) ^ BYTE1(v31);
  v64 = (v35 ^ v31);
  LODWORD(v22) = ((2 * (v64 ^ 0xC2)) | 0x6305C424) - (v64 ^ 0xC2) - 830661138;
  LODWORD(v22) = (v22 & 0x1751E315 ^ 0x418005)
               + (v22 ^ 0x37926352)
               - ((v22 ^ 0x37926352) & 0x1751E315);
  LODWORD(v45) = ((v22 ^ 0xE1497AC7) + 267904814) ^ ((v22 ^ 0xEEBE9DEA) + 1);
  v65 = *(_DWORD *)&v47[4 * (BYTE1(v56) ^ 0x24)];
  LODWORD(v50) = (237114840 * (v65 ^ 0xE18E6674)) ^ *(_DWORD *)&v49[4 * (HIBYTE(v52) ^ 0x49)] ^ (((32 * v62) ^ 0x3E2A180)
                                                                                               + 1700791148
                                                                                               - ((2
                                                                                                 * ((32 * v62) ^ 0x3E2A180)) & 0xCAC006C0));
  LODWORD(v50) = (v50 + 2002239527 - ((2 * v50) & 0xEEAF804E)) ^ *(_DWORD *)&v51[4 * (v64 ^ 0x10)] ^ ((v22 ^ 0x6AEC6B0E ^ (v45 - ((2 * v45) & 0xF75A1236) + 2074937627)) + 267904813);
  v66 = v65 ^ v62 ^ (v50 - ((2 * v50) & 0x77ECE516) + 1006006923);
  LODWORD(v50) = *(_DWORD *)&v46[4 * (BYTE2(v52) ^ 9)];
  v67 = *(_DWORD *)&v47[4 * (((v61 ^ 0xD7154F8CuLL) >> (v298 & 8) >> (v298 & 8 ^ 8)) ^ 0xD8)];
  v68 = v67 ^ (((32 * v50) ^ 0x3E2A180) + 1700791148 - ((2 * ((32 * v50) ^ 0x3E2A180)) & 0xCAC006C0)) ^ *(_DWORD *)&v49[4 * (((v35 ^ v31) >> 24) ^ 0xB5)] ^ (237114840 * (v67 ^ 0xE18E6674) - ((474229680 * (v67 ^ 0xE18E6674)) & 0x71FF1F20) + 956272533);
  v69 = *(_DWORD *)&v46[4 * (BYTE2(v35) ^ 0xCA)];
  v70 = *(_DWORD *)&v51[4 * (v56 ^ 0xBF)] ^ v50 ^ ((v56 ^ 0x2D)
                                                                  + 2002239527
                                                                  - ((2 * (v56 ^ 0x2D)) & 0x4E)) ^ ((v68 ^ 0xD971E9E1) - 2 * ((v68 ^ 0xD971E9E1) & 0x1688349A ^ v68 & 0x10) - 1769458550);
  LODWORD(v22) = *(_DWORD *)&v47[4 * (BYTE1(v52) ^ 0x48)];
  v71 = (237114840 * (v22 ^ 0xE18E6674)) ^ *(_DWORD *)&v49[4 * (HIBYTE(v56) ^ 0x98)] ^ (((32 * v69) ^ 0x3E2A180) + 1700791148 - ((2 * ((32 * v69) ^ 0x3E2A180)) & 0xCAC006C0));
  v72 = v69 ^ 0xCB249639 ^ (v71 - ((2 * v71) & 0xF677066A) + 2067497781);
  v73 = *(_DWORD *)&v51[4 * (v61 ^ 0x1E)] ^ ((v61 ^ 0x8C)
                                                            + 2002239527
                                                            - ((2 * (v61 ^ 0x8C)) & 0x4E)) ^ v22 ^ (v72 - ((2 * v72) & 0x5A80A5E0) + 759190256);
  v74 = *(_DWORD *)&v46[4 * (BYTE2(v56) ^ 0x2E)];
  LODWORD(v50) = *(_DWORD *)&v47[4 * (v63 ^ 0x10)];
  v75 = *(_DWORD *)&v49[4 * (BYTE3(v61) ^ 0x18)] ^ (((32 * v74) ^ 0x3E2A180)
                                                  + 1700791148
                                                  - ((2 * ((32 * v74) ^ 0x3E2A180)) & 0xCAC006C0)) ^ v50 ^ 0xF04F5C2A ^ (237114840 * (v50 ^ 0xE18E6674) - ((474229680 * (v50 ^ 0xE18E6674)) & 0x238274B0) + 297876062);
  v76 = v74 ^ v52 ^ *(_DWORD *)&v51[4 * (v52 ^ 0x7D)] ^ (v75
                                                                                         + 2002239527
                                                                                         - ((2 * v75) & 0xEEAF804E));
  v77 = *(_DWORD *)&v46[4 * (BYTE2(v76) ^ 0x70)];
  LODWORD(v22) = *(_DWORD *)&v47[4 * (BYTE1(v73) ^ 0x9F)];
  LODWORD(v31) = *(_DWORD *)&v51[4 * (v70 ^ 0xF)] ^ *(_DWORD *)&v49[4 * (HIBYTE(v66) ^ 0xF1)] ^ (237114840 * (v22 ^ 0xE18E6674)) ^ (((32 * v77) ^ 0x3E2A180) + 1700791148 - ((2 * ((32 * v77) ^ 0x3E2A180)) & 0xCAC006C0)) ^ ((v70 ^ 0x9D) + 2002239527 - ((2 * (v70 ^ 0x9D)) & 0x4E));
  LODWORD(v50) = *(_DWORD *)&v46[4 * (BYTE2(v66) ^ 0xAC)];
  v78 = v22 ^ v77 ^ (v31 - ((2 * v31) & 0xA5561180) + 1386940608);
  LODWORD(v22) = *(_DWORD *)&v47[4 * (BYTE1(v76) ^ 0x93)];
  v79 = (237114840 * (v22 ^ 0xE18E6674)) ^ *(_DWORD *)&v49[4 * (HIBYTE(v70) ^ 0xDC)] ^ (((32 * v50) ^ 0x3E2A180) + 1700791148 - ((2 * ((32 * v50) ^ 0x3E2A180)) & 0xCAC006C0));
  v80 = v50 ^ 0xF148877F ^ (v79 + 1096258164 + (~(2 * v79) | 0x7D50DB19));
  v81 = *(_DWORD *)&v49[4 * (HIBYTE(v73) ^ 0x7E)];
  v82 = (v81 & 0x4E195A25 ^ 0x46185804) - ((2 * (v81 & 0x4E195A25 ^ 0x46185804)) & 0x830844A);
  v83 = *(_DWORD *)&v51[4 * (v73 ^ 0x9A)] ^ v22 ^ ((v73 ^ 8)
                                                                                + 2002239527
                                                                                - ((2 * v73) & 0x4E)) ^ (v80 - ((2 * v80) & 0x7A500BE0) - 1121450512);
  v84 = ((v82 + 876110527) ^ 0xC5D78F65) + ((v82 + 876110527) ^ 0x3620389F) + 1;
  v85 = *(_DWORD *)&v47[4 * (BYTE1(v66) ^ 0xB6)];
  v86 = (v81 ^ 0x660B78E1 ^ (v84 - ((2 * v84) & 0x99EC49F6) - 856283909))
      + 2 * (((v84 - ((2 * v84) & 0x99EC49F6) - 856283909) ^ 0x3309DB05) & (v81 ^ 0x5502A3E4));
  HIDWORD(v87) = v85 ^ 0x255BE7BF;
  LODWORD(v87) = ~v85;
  LODWORD(v50) = v87 >> 31;
  HIDWORD(v87) = ~(_DWORD)v50;
  LODWORD(v87) = v50 ^ 0x9CF9B940;
  v88 = v87 >> 1;
  v89 = v76 ^ 0x4B;
  if (!v299)
    v89 = 34;
  v90 = *(_DWORD *)&v46[4 * (BYTE2(v70) ^ 0x9D)];
  v91 = v88 ^ (32 * v90) ^ v86 ^ (237114840 * (v88 ^ 0x8AA95D6B)
                                - ((4467632 * (v88 ^ 0x8AA95D6B)) & 0x3DB2B80)
                                - 2115136059) ^ 0x8A6692E;
  v92 = *(_DWORD *)&v51[4 * ((v89 & (v76 ^ 0x96) | v76 & 0xDD ^ 4) ^ 2)] ^ v90 ^ (v91
                                                                                                 + 2002239527
                                                                                                 - ((2 * v91) & 0xEEAF804E));
  v93 = *(_DWORD *)&v46[4 * (BYTE2(v73) ^ 0x5E)];
  v94 = *(_DWORD *)&v47[4 * (BYTE1(v70) ^ 0x88)];
  v95 = v94 ^ *(_DWORD *)&v49[4 * (HIBYTE(v76) ^ 0x39)] ^ (237114840 * (v94 ^ 0xE18E6674)
                                                         - ((474229680 * (v94 ^ 0xE18E6674)) & 0x8E0A94B0)
                                                         - 955954595) ^ (((32 * v93) ^ 0x3E2A180)
                                                                       + 1700791148
                                                                       - ((2 * ((32 * v93) ^ 0x3E2A180)) & 0xCAC006C0));
  v96 = *(_DWORD *)&v51[4 * (v66 ^ 0x36)] ^ v93 ^ ((v66 ^ 0xA4)
                                                                  + 2002239527
                                                                  - 2
                                                                  * ((v66 ^ 0xA4) & 0x37 ^ v66 & 0x10)) ^ ((v95 ^ 0x268B2C29) - 2 * ((v95 ^ 0x268B2C29) & 0x453EB977 ^ v95 & 4) - 985745037);
  v97 = *(_DWORD *)&v46[4 * (BYTE2(v96) ^ 0x17)];
  v98 = *(_DWORD *)&v47[4 * (BYTE1(v92) ^ 0xEA)];
  v99 = (237114840 * (v98 ^ 0xE18E6674)) ^ *(_DWORD *)&v49[4 * (HIBYTE(v78) ^ 0x55)] ^ (((32 * v97) ^ 0x3E2A180)
                                                                                      + 1700791148
                                                                                      - ((2 * ((32 * v97) ^ 0x3E2A180)) & 0xCAC006C0));
  v100 = v97 ^ 0xB65C084F ^ (v99 - ((2 * v99) & 0xC863A86) + 105061699);
  v101 = *(_DWORD *)&v51[4 * (v83 ^ 0xB5)] ^ ((v83 ^ 0x27)
                                                             + 2002239527
                                                             - 2 * ((v83 ^ 0x27) & 0x37 ^ v83 & 0x10)) ^ v98;
  v102 = *(_DWORD *)&v46[4 * (BYTE2(v78) ^ 0x8A)];
  v103 = v101 ^ (v100 - ((2 * v100) & 0x830A0AB8) + 1099236700);
  v104 = *(_DWORD *)&v47[4 * (BYTE1(v96) ^ 0x94)];
  v105 = (v92 ^ v76);
  v106 = *(_DWORD *)&v49[4 * (HIBYTE(v83) ^ 0x9E)] ^ v102 ^ v104 ^ (((32 * v102) ^ 0x3E2A180)
                                                                  + 1700791148
                                                                  - ((2 * ((32 * v102) ^ 0x3E2A180)) & 0xCAC006C0)) ^ (237114840 * (v104 ^ 0xE18E6674) - ((474229680 * (v104 ^ 0xE18E6674)) & 0x96F6ABA0) - 881109546) ^ ((v105 ^ 0x42) + 2002239527 - ((2 * (v105 ^ 0x42)) & 0x4E));
  v107 = *(_DWORD *)&v46[4 * (BYTE2(v83) ^ 0x59)];
  v108 = v106 ^ *(_DWORD *)&v51[4 * (v105 ^ 0xD0)];
  v109 = *(_DWORD *)&v47[4 * (BYTE1(v78) ^ 0x8A)];
  v110 = *(_DWORD *)&v51[4 * (v96 ^ 0xD6)] ^ (237114840 * (v109 ^ 0xE18E6674)) ^ *(_DWORD *)&v49[4 * (HIBYTE(v92) ^ 0x68)] ^ (((32 * v107) ^ 0x3E2A180) + 1700791148 - ((2 * ((32 * v107) ^ 0x3E2A180)) & 0xCAC006C0)) ^ ((v96 ^ 0x44) + 2002239527 - 2 * ((v96 ^ 0x44) & 0x2F ^ v96 & 8));
  v111 = *(_DWORD *)&v46[4 * (BYTE2(v92) ^ 0x26)];
  v112 = v109 ^ v107 ^ (v110 - ((2 * v110) & 0x19A78478) + 215204412);
  v113 = *(_DWORD *)&v47[4 * (BYTE1(v83) ^ 0x8F)];
  v114 = *(_DWORD *)&v49[4 * (HIBYTE(v96) ^ 0xE2)] ^ ((v78 ^ 0x23)
                                                    + 2002239527
                                                    - 2 * ((v78 ^ 0x23) & 0x2F ^ v78 & 8)) ^ v113 ^ *(_DWORD *)&v51[4 * (v78 ^ 0xB1)] ^ v111 ^ (237114840 * (v113 ^ 0xE18E6674) - ((474229680 * (v113 ^ 0xE18E6674)) & 0xFC8369B0) + 2118235359) ^ (((32 * v111) ^ 0x3E2A180) + 1700791148 - ((2 * ((32 * v111) ^ 0x3E2A180)) & 0xCAC006C0));
  v115 = ((v112 ^ 0xE770788F) + 1984969109) ^ ((v112 ^ 0x9120411B) + 1);
  v116 = v112 ^ 0x531F311A ^ (v115 - ((2 * v115) & 0x7B811FFC) + 1036029950);
  v117 = *(_DWORD *)&v46[4 * (BYTE2(v114) ^ 0x7C)];
  v118 = ((2 * v117) & 0xC83EA932 ^ 0x77FF7EDD) + (v117 ^ 0xD4004195);
  v119 = v118 - ((2 * v118 + 1212066100) & 0x6054CB38) - 1807107530;
  v120 = v116 - ((2 * v116 - 325029080) & 0x9BEF8D50) - 1001914308;
  v121 = *(_DWORD *)&v47[4
                       * (((unsigned __int16)(v116 - ((2 * v116 + 29480) & 0x8D50) + 60) >> 8) ^ 0x1E)];
  v122 = (237114841 * (v121 ^ 0xE18E6674) - 2 * ((237114840 * (v121 ^ 0x618E6674)) & (v121 ^ 0x618E6670))) ^ *(_DWORD *)&v49[4 * (HIBYTE(v103) ^ 0x99)] ^ (((32 * v119) ^ 0x54CB380) + 1700791148 - ((2 * ((32 * v119) ^ 0x54CB380)) & 0xCAC006C0));
  v123 = v119 ^ *(_DWORD *)&v51[4 * (v108 ^ 0xC6)] ^ ((v108 ^ 0x54)
                                                                     + 2002239527
                                                                     + (~(2 * (v108 ^ 0x54)) | 0xFFFFFFB1)
                                                                     + 1) ^ (v122 - ((2 * v122) & 0x6054CB38) + 808084892);
  v124 = *(_DWORD *)&v46[4 * (BYTE2(v103) ^ 0xA0)];
  v125 = *(_DWORD *)&v47[4 * (BYTE1(v114) ^ 0xFD)];
  v126 = *(_DWORD *)&v49[4 * (HIBYTE(v108) ^ 0xA2)] ^ v125 ^ (237114840 * (v125 ^ 0xE18E6674)
                                                            - ((474229680 * (v125 ^ 0xE18E6674)) & 0xE0538290)
                                                            + 1881784650) ^ 0x91A7A73E ^ (((32 * v124) ^ 0x3E2A180)
                                                                                        + 1700791148
                                                                                        - ((2 * ((32 * v124) ^ 0x3E2A180)) & 0xCAC006C0));
  v127 = *(_DWORD *)&v46[4 * (BYTE2(v108) ^ 0x6C)];
  v128 = *(_DWORD *)&v51[4 * (v120 ^ 0x3A)] ^ v124 ^ ((v120 ^ 0xA8)
                                                                     + 2002239527
                                                                     - ((2 * (v120 ^ 0xA8)) & 0x4E)) ^ (v126 - ((2 * v126) & 0x150CC88C) + 176579654);
  v129 = *(_DWORD *)&v47[4 * (BYTE1(v103) ^ 0xF4)];
  v130 = (237114840 * (v129 ^ 0xE18E6674)) ^ *(_DWORD *)&v49[4 * (HIBYTE(v120) ^ 0x82)] ^ (((32 * v127) ^ 0x3E2A180)
                                                                                         + 1700791148
                                                                                         - ((2
                                                                                           * ((32 * v127) ^ 0x3E2A180)) & 0xCAC006C0));
  v131 = *(_DWORD *)&v51[4 * (v114 ^ 0x99)] ^ v114 ^ (v130
                                                                                      + 2002239527
                                                                                      - ((2 * v130) & 0xEEAF804E));
  v132 = *(_DWORD *)&v46[4 * (BYTE2(v120) ^ 0x5F)];
  v133 = v129 ^ v127 ^ ((v131 ^ 0xA7) - 2 * ((v131 ^ 0xA7) & 0x65A3ADFA ^ v131 & 8) - 442257934);
  HIDWORD(v135) = v132 ^ 0x54004195;
  LODWORD(v135) = ~v132;
  v134 = v135 >> 31;
  HIDWORD(v135) = ~v134;
  LODWORD(v135) = v134 ^ 0x873EBD12;
  v136 = v135 >> 1;
  v137 = *(_DWORD *)&v47[4 * (BYTE1(v108) ^ 0x2E)];
  v138 = *(_DWORD *)&v49[4 * (HIBYTE(v114) ^ 0xF0)] ^ ((v103 ^ 0x1A)
                                                     + 2002239527
                                                     - ((2 * (v103 ^ 0x1A)) & 0x4E)) ^ (237114840 * (v137 ^ 0xE18E6674)) ^ *(_DWORD *)&v51[4 * (v103 ^ 0x88)] ^ (((32 * v136) ^ 0xF0014200) + 1700791148 - ((2 * ((32 * v136) ^ 0xF0014200)) & 0xCAC006C0));
  v139 = v136 ^ v137 ^ (v138 - ((2 * v138) & 0x18D67E2E) - 1939128553);
  v140 = *(_DWORD *)&v46[4 * (BYTE2(v139) ^ 0x65)];
  v141 = *(_DWORD *)&v47[4 * (BYTE1(v133) ^ 0x2D)];
  v142 = ((2 * v141) & 0x89AB0396 ^ 0xF75CFCE9) + (v141 ^ 0xA55BE7BF);
  v143 = v142 - ((2 * v142 + 162202520) & 0x5F27119E) + 1953041051;
  v144 = (((32 * v140) ^ 0x3E2A180) + 1700791148 - ((2 * ((32 * v140) ^ 0x3E2A180)) & 0xCAC006C0)) ^ *(_DWORD *)&v49[4 * (HIBYTE(v123) ^ 0xFB)] ^ (237114840 * (v143 ^ 0x2F9388CF));
  v145 = v140 ^ 0x8E9ACF05 ^ (v144
                            + 1048959497
                            - 2 * (v144 & 0x3E85DA0B ^ *(_DWORD *)&v49[4 * (HIBYTE(v123) ^ 0xFB)] & 2));
  v146 = v143 ^ *(_DWORD *)&v51[4 * (v128 ^ 0xD2)] ^ ((v128 ^ 0x40)
                                                                     + 2002239527
                                                                     - ((2 * v128) & 0x4E)) ^ (v145
                                                                                             + 798197967
                                                                                             - ((2 * v145) & 0x5F27119E));
  v147 = *(_DWORD *)&v46[4 * (BYTE2(v123) ^ 0x2A)];
  v148 = (((32 * v147) ^ 0x3E2A180) + 1700791148 - ((2 * ((32 * v147) ^ 0x3E2A180)) & 0xCAC006C0)) ^ *(_DWORD *)&v49[4 * (HIBYTE(v128) ^ 0x17)];
  v149 = *(_DWORD *)&v47[4 * (BYTE1(v139) ^ 0x92)];
  v150 = *(_DWORD *)&v46[4 * (BYTE2(v128) ^ 0x7D)];
  v151 = v149 ^ v147 ^ *(_DWORD *)&v51[4 * (v133 ^ 0xB8)] ^ (v148
                                                                            - ((2 * v148) & 0x6EBB3A70)
                                                                            + 928881976) ^ (237114840
                                                                                          * (v149 ^ 0xE18E6674)
                                                                                          - ((474229680
                                                                                            * (v149 ^ 0xE18E6674)) & 0x71CC4160)
                                                                                          - 1192877903) ^ ((v133 ^ 0x2A) + 2002239527 - 2 * ((v133 ^ 0x2A) & 0x37 ^ v133 & 0x10));
  v152 = *(_DWORD *)&v47[4 * (BYTE1(v123) ^ 0x56)];
  v154 = *(_DWORD *)&v46[4 * (BYTE2(v133) ^ 0x18)] ^ 0xD4004195;
  if ((*(_DWORD *)&v46[4 * (BYTE2(v133) ^ 0x18)] & 1) != 0)
    v155 = v154 + 1;
  else
    v155 = v154 - 1;
  v153 = (237114840 * (v152 ^ 0xE18E6674)) ^ *(_DWORD *)&v49[4 * (HIBYTE(v133) ^ 0xAA)] ^ (((32 * v150) ^ 0x3E2A180)
                                                                                         + 1700791148
                                                                                         - ((2
                                                                                           * ((32 * v150) ^ 0x3E2A180)) & 0xCAC006C0));
  v156 = v139 ^ *(_DWORD *)&v51[4 * (v139 ^ 0xBB)] ^ (v153
                                                                                      + 2002239527
                                                                                      - ((2 * v153) & 0xEEAF804E));
  v157 = v152 ^ v150 ^ ((v156 ^ 0x29) - ((2 * v156) & 0xD4D45F00) + 1785343872);
  v158 = ((8 * v128) ^ 0xC3E91A00) + 1737400779 - 2 * (((8 * v128) ^ 0xC3E91A00) & 0x678EA1D8 ^ (8 * v128) & 0x10);
  v159 = *(_DWORD *)&v47[4 * ((((v158 & 0x4000 | 0x46A0A800) ^ v158 & 0x7B800) >> 11) ^ 0x8D419)];
  v160 = ((2 * v159) & 0x89AB0396 ^ 0xF75CFCE9) + (v159 ^ 0xA55BE7BF);
  v161 = v160 - ((2 * v160 - 1985281128) & 0x93CD8ECE) - 1900263117;
  v162 = (((32 * v155) ^ 0x83EA9300) + 1700791148 - ((2 * ((32 * v155) ^ 0x83EA9300)) & 0xCAC006C0)) ^ *(_DWORD *)&v49[4 * (HIBYTE(v139) ^ 0x33)] ^ v161 ^ (237114840 * (v161 ^ 0x49E6C767) + 1239861095 - ((474229680 * (v161 ^ 0x49E6C767)) & 0x93CD8EC0));
  v163 = (v162 - ((2 * v162) & 0xC76292CE) - 474920601) ^ v155;
  v164 = v123;
  v165 = *(_DWORD *)&v51[4 * (v123 ^ 0x86)] ^ 0x7757C027;
  v166 = (v163 ^ 0xBBC4F572)
       + v165
       - 2 * ((v163 ^ 0x3BC4F572) & v165)
       - ((2 * ((v163 ^ 0xBBC4F572) + v165 - 2 * ((v163 ^ 0x3BC4F572) & v165))) & 0x2C0BA052);
  if ((v146 & 0x2000000) != 0)
    v167 = 2;
  else
    v167 = -2;
  v168 = v166 + 369479721;
  v169 = *(_DWORD *)&v46[4 * (((v166 + 369479721) >> 16) ^ 0x8C)];
  v170 = ((v151 ^ 0x79) + (v151 & 0xE5 ^ 0x7A75384) - ((v151 ^ 0x79) & 0xE5)) & 0x6051FFF;
  v171 = *(_DWORD *)&v47[4 * (BYTE1(v157) ^ 0x30)];
  v172 = (237114840 * (v171 ^ 0xE18E6674)) ^ *(_DWORD *)&v49[4 * ((v167 + (HIBYTE(v146) ^ 0xCB)) ^ 0xCD)] ^ (((32 * v169) ^ 0x3E2A180) + 1700791148 - ((2 * ((32 * v169) ^ 0x3E2A180)) & 0xCAC006C0));
  v173 = (v172 + 2002239527 - ((2 * v172) & 0xEEAF804E)) ^ *(_DWORD *)&v51[4 * (v170 ^ 0x6051323)];
  v174 = v171 ^ v169 ^ (v173 - ((2 * v173) & 0x2FBF9D9A) + 400543437);
  v175 = *(_DWORD *)&v46[4 * (BYTE2(v146) ^ 0x6C)];
  v176 = *(_DWORD *)&v47[4 * (BYTE1(v168) ^ 0x1F)];
  v177 = *(_DWORD *)&v49[4 * (HIBYTE(v151) ^ 0x24)] ^ v157 ^ (((32 * v175) ^ 0x3E2A180)
                                                                             + 1700791148
                                                                             - ((2 * ((32 * v175) ^ 0x3E2A180)) & 0xCAC006C0)) ^ v176 ^ 0x484842F9 ^ (237114840 * (v176 ^ 0xE18E6674) - ((474229680 * (v176 ^ 0xE18E6674)) & 0x538C48E0) - 1446632331);
  v178 = *(_DWORD *)&v51[4 * (v157 ^ 0xAE)] ^ v175 ^ (v177 + 2002239527 - ((2 * v177) & 0xEEAF804E));
  v179 = *(_DWORD *)&v47[4 * (BYTE1(v146) ^ 0x87)];
  v180 = *(_DWORD *)&v46[4 * (BYTE2(v151) ^ 0x2D)];
  v181 = v168 ^ v164;
  v182 = *(_DWORD *)&v46[4 * (BYTE2(v157) ^ 0xFC)];
  v183 = v179 ^ *(_DWORD *)&v49[4 * (HIBYTE(v157) ^ 0x24)] ^ v180 ^ (237114840 * (v179 ^ 0xE18E6674)
                                                                   - ((474229680 * (v179 ^ 0xE18E6674)) & 0xF1132370)
                                                                   - 125201986) ^ (((32 * v180) ^ 0x3E2A180)
                                                                                 + 1700791148
                                                                                 - ((2 * ((32 * v180) ^ 0x3E2A180)) & 0xCAC006C0)) ^ ((v181 ^ 0x24) + 2002239527 - 2 * ((v181 ^ 0x24) & 0x3F ^ v181 & 0x18)) ^ *(_DWORD *)&v51[4 * (v181 ^ 0xB6)];
  v184 = *(_DWORD *)&v47[4 * (BYTE1(v151) ^ 7)];
  v185 = (237114840 * (v184 ^ 0xE18E6674)) ^ (((32 * v182) ^ 0x3E2A180)
                                            + 1700791148
                                            - ((2 * ((32 * v182) ^ 0x3E2A180)) & 0xCAC006C0)) ^ *(_DWORD *)&v49[4 * (HIBYTE(v168) ^ 0x61)];
  v186 = v146 ^ *(_DWORD *)&v51[4 * (v146 ^ 0xE6)] ^ 0x74 ^ (v185
                                                                                             + 2002239527
                                                                                             - ((2 * v185) & 0xEEAF804E));
  v187 = v184 ^ v182 ^ (v186 - ((2 * v186) & 0x84272894) - 1038904246);
  v188 = *(_DWORD *)&v46[4 * (BYTE2(v187) ^ 0xAF)];
  v189 = *(_DWORD *)&v47[4 * (BYTE1(v183) ^ 0x52)];
  v190 = v174 ^ v170;
  v191 = *(_DWORD *)&v49[4 * (HIBYTE(v174) ^ 0x6B)] ^ v189 ^ (((32 * v188) ^ 0x3E2A180)
                                                            + 1700791148
                                                            - ((2 * ((32 * v188) ^ 0x3E2A180)) & 0xCAC006C0)) ^ (237114840 * (v189 ^ 0xE18E6674) - ((474229680 * (v189 ^ 0xE18E6674)) & 0x8F3A6E30) + 1201485594) ^ 0xA613516E;
  v192 = *(_DWORD *)&v51[4 * (v178 ^ 0x30)] ^ v188 ^ v178 ^ (v191
                                                                                             + 2002239527
                                                                                             - ((2 * v191) & 0xEEAF804E));
  v193 = *(_DWORD *)&v46[4 * (BYTE2(v190) ^ 0xC7)];
  v194 = *(_DWORD *)&v47[4 * (BYTE1(v187) ^ 0xB9)];
  v195 = *(_DWORD *)&v49[4 * (HIBYTE(v178) ^ 0xE2)] ^ v194 ^ (237114840 * (v194 ^ 0xE18E6674)
                                                            - ((474229680 * (v194 ^ 0xE18E6674)) & 0x7A410150)
                                                            + 1025540268) ^ 0xDCAEE6D8 ^ (((32 * v193) ^ 0x3E2A180)
                                                                                        + 1700791148
                                                                                        - ((2 * ((32 * v193) ^ 0x3E2A180)) & 0xCAC006C0));
  v196 = v195 - ((2 * v195) & 0x39636318);
  v197 = (v183 ^ 0xC6) + 2002239527 - 2 * ((v183 ^ 0xC6) & 0x2F ^ v183 & 8);
  v198 = *(_DWORD *)&v51[4 * (v183 ^ 0x8E)] ^ v193 ^ (v196 - 1666076276);
  v199 = *(_DWORD *)&v46[4 * (BYTE2(v178) ^ 0xBD)];
  v200 = *(_DWORD *)&v47[4 * (BYTE1(v190) ^ 0xEE)];
  v201 = *(_DWORD *)&v49[4 * (HIBYTE(v183) ^ 0xE0)] ^ *(_DWORD *)&v51[4 * (v187 ^ 0x32)] ^ v199 ^ v200 ^ (((32 * v199) ^ 0x3E2A180) + 1700791148 - ((2 * ((32 * v199) ^ 0x3E2A180)) & 0xCAC006C0)) ^ ((v187 ^ 0xA0) + 2002239527 - 2 * ((v187 ^ 0xA0) & 0x37 ^ v187 & 0x10)) ^ (237114840 * (v200 ^ 0xE18E6674) - ((474229680 * (v200 ^ 0xE18E6674)) & 0x6124DCB0) - 1332580770);
  v202 = *(_DWORD *)&v46[4 * (BYTE2(v183) ^ 0xD1)];
  v203 = *(_DWORD *)&v47[4 * (BYTE1(v178) ^ 0x4E)];
  v204 = (237114840 * (v203 ^ 0xE18E6674)) ^ *(_DWORD *)&v49[4 * (HIBYTE(v187) ^ 0x6B)] ^ (((32 * v202) ^ 0x3E2A180)
                                                                                         + 1700791148
                                                                                         - ((2
                                                                                           * ((32 * v202) ^ 0x3E2A180)) & 0xCAC006C0));
  v205 = v202 ^ 0x42559FE2 ^ (v204 - ((2 * v204) & 0xE49515DC) - 229995794);
  v206 = v203 ^ ((v190 ^ 4) + 2002239527 - 2 * ((v190 ^ 4) & 0x37 ^ v190 & 0x10)) ^ *(_DWORD *)&v51[4 * (v190 ^ 0x84)] ^ (v205 - ((2 * v205) & 0x6CE4FE48) - 1234010332);
  v207 = v198 ^ v197;
  v208 = v198 ^ ~v197;
  v209 = *(_DWORD *)&v46[4 * (BYTE2(v206) ^ 0xD1)];
  v210 = *(_DWORD *)&v47[4 * (BYTE1(v201) ^ 0xE3)];
  v211 = *(_DWORD *)&v51[4 * (v207 ^ 0x72)] ^ *(_DWORD *)&v49[4 * (BYTE3(v192) ^ 3)] ^ (237114840 * (v210 ^ 0xE18E6674)) ^ ((v207 ^ 0xE0) + 2002239527 - 2 * ((v207 ^ 0xE0) & 0x3F ^ v207 & 0x18)) ^ (((32 * v209) ^ 0x3E2A180) + 1700791148 - ((2 * ((32 * v209) ^ 0x3E2A180)) & 0xCAC006C0));
  v212 = v210 ^ v209 ^ (v211 - ((2 * v211) & 0x89E0D200) - 990877440);
  v213 = *(_DWORD *)&v46[4 * (BYTE2(v192) ^ 4)];
  v214 = *(_DWORD *)&v47[4 * (BYTE1(v206) ^ 0xE2)];
  v215 = *(_DWORD *)&v51[4 * (v201 ^ 0xC6)] ^ *(_DWORD *)&v49[4 * HIBYTE(v208)] ^ (((32 * v213) ^ 0x3E2A180)
                                                                                                  + 1700791148
                                                                                                  - ((2 * ((32 * v213) ^ 0x3E2A180)) & 0xCAC006C0)) ^ ((v201 ^ 0x54) + 2002239527 - ((2 * (v201 ^ 0x54)) & 0x4E)) ^ (237114840 * (v214 ^ 0xE18E6674));
  v216 = v214 ^ v213 ^ (v215 - ((2 * v215) & 0x9FA8E2B8) + 1339322716);
  v217 = *(_DWORD *)&v46[4 * (BYTE2(v207) ^ 0x49)];
  v218 = *(_DWORD *)&v47[4 * (BYTE1(v192) ^ 0x58)];
  v219 = (237114840 * (v218 ^ 0xE18E6674)) ^ *(_DWORD *)&v49[4 * (HIBYTE(v201) ^ 0x56)] ^ (((32 * v217) ^ 0x3E2A180)
                                                                                         + 1700791148
                                                                                         - ((2
                                                                                           * ((32 * v217) ^ 0x3E2A180)) & 0xCAC006C0));
  v220 = v219 + 2002239527 - ((2 * v219) & 0xEEAF804E);
  v221 = HIWORD(v146) ^ 0x34;
  if (((BYTE1(v178) ^ 0x96) + 96) | BYTE1(v178) ^ 0x96)
    LOBYTE(v221) = BYTE2(v201) ^ 0xF9;
  v222 = *(_DWORD *)&v51[4 * (v206 ^ 0x5A)] ^ v206 ^ 0xC8 ^ v220;
  v223 = *(_DWORD *)&v46[4 * (v221 ^ 0x58)];
  v224 = v218 ^ v217 ^ (v222 - ((2 * v222) & 0xECE0D0FC) - 160405378);
  v225 = *(_DWORD *)&v47[4 * (BYTE1(v207) ^ 0xAA)];
  v226 = ((2 * v192) & 0x5A ^ 0xFFFFFFF5) + (v192 ^ 0x45);
  v227 = (((v224 ^ 0x5C6296D3) + (v224 ^ 0x947C14A6) + 1) ^ 0xFFFFFFFC) + (v224 ^ 0x947C14A6);
  v228 = *(_DWORD *)&v49[4 * (HIBYTE(v206) ^ 0x4A)] ^ (v226 - ((2 * v226 + 535809628) & 0xEEAF804E) - 2024822955) ^ *(_DWORD *)&v51[4 * (v192 ^ 0xD7)] ^ (237114840 * (v225 ^ 0xE18E6674)) ^ (((32 * v223) ^ 0x3E2A180) + 1700791148 - ((2 * ((32 * v223) ^ 0x3E2A180)) & 0xCAC006C0));
  v229 = v225 ^ v223 ^ (v228 - ((2 * v228) & 0x89C9BEB2) + 1155850073);
  LOBYTE(v225) = (BYTE2(v229) ^ 0xCB) + ((v229 >> 15) & 0xFE ^ 0x68) + 1;
  v230 = (v225 ^ 0xF3FFEDFF) + 2 * v225 + 201331201;
  v231 = (uint64_t)*(&off_24DCDB210 + (int)(v300 ^ 0x192));
  v232 = HIBYTE(v212);
  LODWORD(v297) = *(_DWORD *)(v231 + 4 * (HIBYTE(v212) ^ 0x15));
  LODWORD(v298) = HIBYTE(v216);
  HIDWORD(v297) = *(_DWORD *)(v231 + 4 * (HIBYTE(v216) ^ 0x68));
  v233 = v227 - ((2 * v227) & 0x62607BB4) - 1322238502;
  v234 = HIBYTE(v233);
  v235 = *(_DWORD *)(v231 + 4 * (HIBYTE(v233) ^ 0xC7));
  v236 = *(_DWORD *)(v231 + 4 * (HIBYTE(v229) ^ 0xA6));
  v237 = (char *)*(&off_24DCDB210 + (int)v300 - 305) - 8;
  v238 = *(_DWORD *)&v237[4 * ((v230 % 0x94 + (v225 - v230 % 0x94)) ^ 0x50)];
  v239 = *(_DWORD *)&v237[4 * (BYTE2(v212) ^ 4)];
  v240 = *(_DWORD *)&v237[4 * (BYTE2(v216) ^ 0xD0)];
  v241 = *(_DWORD *)&v237[4 * (BYTE2(v233) ^ 0x60)];
  v242 = (char *)*(&off_24DCDB210 + (int)v300 - 231) - 4;
  v243 = *(_DWORD *)&v242[4 * (BYTE1(v233) ^ 0x63)];
  LODWORD(v237) = *(_DWORD *)&v242[4 * (BYTE1(v229) ^ 0x92)];
  v244 = *(_BYTE **)(v20 - 120);
  v245 = (HIBYTE(v229) ^ 0x5D5F4691)
       - 1814166515
       + v236
       - ((2 * ((HIBYTE(v229) ^ 0x5D5F4691) - 1814166515 + v236) + 2) & 0x34F1AA0A);
  v246 = *(_DWORD *)&v242[4 * (BYTE1(v212) ^ 0xBF)];
  LODWORD(v242) = *(_DWORD *)&v242[4 * (BYTE1(v216) ^ 0x9D)];
  LODWORD(v242) = (_DWORD)v242 - ((2 * (_DWORD)v242 + 1505400204) & 0xD3E6371C) - 1764727212;
  v247 = (v212 ^ 0xFFFD4FD0) + 176146 + ((2 * v212) & 0x1DC ^ 0x5C);
  v248 = v247 % 0x50 + ((v212 ^ 0x3E) - v247 % 0x50);
  v249 = (v245 - 1703357178) ^ (v242 >> 3) & 0x2093041;
  v250 = v216 ^ 0xE9;
  v251 = (char *)*(&off_24DCDB210 + (int)(v300 ^ 0x134)) - 8;
  v252 = *(_DWORD *)&v251[4 * v250];
  LODWORD(v242) = v249 ^ ((v242 >> 3) & 0x1040C10 ^ v242 & 0x8184CD18 | v242 & 0x7E7B32E7);
  v253 = *(_DWORD *)&v251[4 * (v233 ^ 0xA4)];
  LODWORD(v242) = v241 ^ v242 ^ 0x68FF3BDF;
  v254 = *(_DWORD *)&v251[4 * (v229 ^ 0x68)];
  v255 = *(_DWORD *)&v251[4 * (v248 ^ 0x7E)] ^ *(_DWORD *)(v20 - 144) ^ ((_DWORD)v242
                                                                       + 1631959483
                                                                       - ((2 * (_DWORD)v242) & 0xC28B7376));
  v256 = (char *)*(&off_24DCDB210 + (int)(v300 ^ 0x1ED)) - 8;
  v244[v301] = v256[v255 ^ 0xCBLL] ^ ((v255 ^ 0xEA) - ((2 * (v255 ^ 0xEA)) & 0xB8) + 92) ^ 0xE8;
  LODWORD(v242) = (v232 ^ 0x5D5F4622) + v297;
  v257 = v243 - ((2 * v243 + 1505400204) & 0xA5CE73AE) - 3898211;
  v258 = v238 ^ (((v257 ^ 0x357124A0) + (v257 & 0xE7961D77 ^ 0xDAEFFBDF) + 1) >> 3) ^ ((_DWORD)v242
                                                                                     + 777443603
                                                                                     - ((2 * (_DWORD)v242 + 666634268) & 0x34F1AA0A));
  v259 = (v258 + 1631959483 - ((2 * v258) & 0xC28B7376)) ^ v252;
  v260 = v257 ^ *(_DWORD *)(v20 - 140) ^ (v259 + 1371944730 - ((2 * v259) & 0xA38C6E34));
  v261 = (char *)*(&off_24DCDB210 + (int)v300 - 107) - 4;
  LOBYTE(v259) = v261[BYTE1(v260) ^ 0xEELL];
  v244[2] = v259 ^ 0x73 ^ (((2 * v259) ^ (32 * v259) ^ 0x50)
                         - 2 * (((2 * v259) ^ (32 * v259) ^ 0x50) & 0x64 ^ (2 * v259) & 4)
                         + 97);
  v262 = v246 - ((2 * v246 + 1505400204) & 0x79781E7A) + 1771657731;
  v263 = v262 ^ v240 ^ (((v262 >> 3) & 0x30D3C51 ^ 0x3050041)
                      - ((2 * ((v262 >> 3) & 0x30D3C51 ^ 0x3050041)) & 0x181822)
                      + 1018957629) ^ ((v234 ^ 0x5D5F46F0)
                                     + v235
                                     + 777443603
                                     - ((2 * ((v234 ^ 0x5D5F46F0) + v235) + 666634268) & 0x34F1AA0A));
  v264 = v254 ^ *(_DWORD *)(v20 - 136) ^ (v263 + 1631959483 - ((2 * v263) & 0xC28B7376));
  v244[11] = v256[v264 ^ 8] ^ ((v264 ^ 0xD5) - ((2 * (v264 ^ 0xD5)) & 0xB8) + 92) ^ 0x44;
  v265 = (_DWORD)v237 - ((2 * (_DWORD)v237 + 1505400204) & 0x8638DEE4) - 268846536;
  v266 = v239 ^ (HIDWORD(v297)
               + (v298 ^ 0x5D5F465F)
               + 777443603
               - ((2 * (HIDWORD(v297) + (v298 ^ 0x5D5F465F)) + 666634268) & 0x34F1AA0A)) ^ 0x10C40 ^ (v265 >> 3) & 0x30D3C51;
  v267 = (v266 + 1631959483 - ((2 * v266) & 0xC28B7376)) ^ v253;
  v268 = v265 ^ *(_DWORD *)(v20 - 132) ^ (v267 + 1399911937 - ((2 * v267) & 0xA6E1ED84) + 193);
  v269 = (char *)*(&off_24DCDB210 + (int)v300 - 283) - 12;
  LOBYTE(v267) = v269[HIBYTE(v268) ^ 0x29];
  v244[*(_QWORD *)(v20 - 192)] = (-111 * (v267 ^ 0x68)) ^ (32 * v267) ^ 0x77;
  v270 = (char *)*(&off_24DCDB210 + (int)v300 - 262) - 4;
  v244[1] = v270[BYTE2(v260) ^ 3] ^ 0x61 ^ (75 - ((v270[BYTE2(v260) ^ 3] >> 3) & 0xB ^ 8));
  v244[3] = ((v260 ^ 0xD7) - ((2 * (v260 ^ 0xD7)) & 0xB8) + 92) ^ 0x32 ^ v256[v260 ^ 0x71];
  LOBYTE(v267) = v261[BYTE1(v264) ^ 6];
  v244[10] = v267 ^ (((2 * v267) ^ (32 * v267) ^ 0x50)
                   - 2 * (((2 * v267) ^ (32 * v267) ^ 0x50) & 0x62 ^ (2 * v267) & 2)
                   + 97) ^ 0x10;
  LOBYTE(v262) = v261[BYTE1(v255) ^ 0x36];
  v244[14] = v262 ^ 0x73 ^ (((2 * v262) ^ (32 * v262) ^ 0x50) - ((2 * ((2 * v262) ^ (32 * v262) ^ 0x50)) & 0xEC) - 10);
  LOBYTE(v267) = v269[HIBYTE(v264) ^ 0x90];
  v244[*(_QWORD *)(v20 - 200)] = (-111 * (v267 ^ 0x68)) ^ (32 * v267) ^ 0x35;
  v271 = v270[BYTE2(v268) ^ 0xDALL];
  v244[5] = v271 ^ 0x9E ^ (((v271 >> 3) & 0xB ^ 8) - ((2 * ((v271 >> 3) & 0xB ^ 8)) & 0x10) - 100);
  LOWORD(v271) = ((2 * (v268 ^ 0xE5)) & 0xE6) - (v268 ^ 0xE5) - 27764;
  v272 = (v271 & 0x161C ^ 0xE055A401) + (v271 & 0x9E3) - 1;
  v273 = (((v272 ^ 0xB9C2FD4A) + (v272 ^ 0xE055B7FD) + 1) ^ 0xFFFFFFF0) + (v272 ^ 0xE055B7FD);
  v274 = v273 - ((2 * v273) & 0xEECACFAA) - 144349227;
  LOBYTE(v274) = v256[v274 ^ 0x510DD24E] ^ ((v274 ^ 0xD5) - ((2 * (v274 ^ 0xD5)) & 0xB8) + 92) ^ 0x2E;
  v275 = *(_QWORD *)(v20 - 176);
  v244[*(_QWORD *)(v20 - 184)] = v274;
  LODWORD(v274) = v269[HIBYTE(v260) ^ 0x3ELL] ^ 0x68;
  v244[v275] = (-111 * v274) ^ 0xF4 ^ ((34 * (_DWORD)v274) << (~(_BYTE)v192 & 4) << (v192 & 4));
  v276 = v261[BYTE1(v268) ^ 0x63];
  LOBYTE(v268) = (v276 & 2 ^ 0xBF) + 2 * (v276 & 2);
  v277 = ((v268 + 65) & (((2 * v276) ^ (32 * v276)) ^ 0x50) & 0xFE) == 0;
  v278 = v268 + 120;
  v279 = -10 - v268;
  if (v277)
    v279 = v278;
  v244[6] = v276 & 0xFD ^ 0xAD ^ (((2 * v276) ^ (32 * v276) ^ 0x50) + v279 - 55);
  v280 = (HIWORD(v255) & 0x53) + 641948159 + (HIWORD(v255) & 0xAC ^ 0x81);
  v281 = v270[(BYTE2(v264) ^ 0x5F) + 204 + ((v264 >> 15) & 0x196 ^ 0xFFFFFF69)];
  v282 = v280 ^ 0x22B7AC15;
  v244[*(_QWORD *)(v20 - 160)] = v281 ^ (((v281 >> 3) & 0xB ^ 8)
                                       - 2 * (((v281 >> 3) & 0xB ^ 8) & 0xF9 ^ ((v281 & 8) != 0))
                                       + 124) ^ 0xBB;
  v283 = ((BYTE2(v255) ^ 0xFFFFFFD6) + 83162757 - ((2 * (BYTE2(v255) ^ 0xFFFFFFD6) + 116) & 0x9E9ED0A) + 58) ^ v280 ^ 0x22B7AC15;
  v284 = (v280 ^ 0xD9BCA56F) - 1590877759 - ((2 * (v280 ^ 0xD9BCA56F) + 2) & 0x425A4382) + 1;
  v285 = (v283 - 1590877759 - ((2 * v283) & 0x425A4382)) ^ v284;
  v286 = v270[(((((83162757 - v285 - ((-2 * v285) & 0x9E9ED0A)) ^ v282)
                                - 1590877759
                                - ((2 * ((83162757 - v285 - ((-2 * v285) & 0x9E9ED0A)) ^ v282)) & 0x425A4382)) ^ v284)
                              + 57) ^ 0xCBLL];
  v244[*(_QWORD *)(v20 - 168)] = v286 ^ (((v286 >> 3) & 0xB ^ 8) + ((2 * ((v286 >> 3) & 0xB)) ^ 0xEF) + 60) ^ 0x1E;
  LOBYTE(v286) = v269[HIBYTE(v255) ^ 0xB7];
  v244[*(_QWORD *)(v20 - 152)] = ((-111 * (v286 ^ 0x68)) & 0xE1 ^ (32 * v286) | (-111 * (v286 ^ 0x68)) & 0x1E) ^ 0xE9;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, char *, char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a18 + 8 * (int)((767 * ((((_DWORD)v275 + 652761950 - ((2 * (_DWORD)v275 + 32) & 0x4DD0B6BC) + 16) ^ 0x26E85B5Eu) < HIDWORD(a16))) ^ v300)))(166325514, 83162757, v275, 1305523900, 4294967185, 104, 11, v300, a9, a10, a11, v288, v289, v290, v291, a16, v292, a18, a19,
           v293,
           v294,
           v295,
           v296,
           v297,
           v298,
           v192,
           v300);
}

void sub_21A5A85D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,int a21,unsigned __int8 a22,int a23,char a24,int a25,int a26,int a27,unsigned __int8 a28)
{
  int v28;
  uint64_t v29;

  *(_DWORD *)(v29 - 132) = (a26 ^ 0x43A64309 | ((a20 ^ 0x71) << 8) | ((a22 ^ 0xAB) << 16) | ((a28 ^ 0x98) << (((a24 + 4) & 0xEF) + 105))) ^ 0x3BD02A6A;
  *(_DWORD *)(v29 - 136) = (((a23 ^ v28) << 8) & 0xFF00FFFF | ((a27 ^ 0xE4) << 24) | ((*(_DWORD *)(v29 - 128) ^ 0x57) << 16) | *(_DWORD *)(v29 - 124) ^ 0xAA4BE4CB) ^ 0xEC63F339;
  *(_DWORD *)(v29 - 144) = a21 ^ 0xAAB8D1B7;
  *(_DWORD *)(v29 - 140) = a25 ^ 0xD5BBE24A;
  JUMPOUT(0x21A5A56ECLL);
}

uint64_t sub_21A5A86CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, int a18, int a19)
{
  uint64_t v19;
  unsigned int v20;

  v20 = a11 - ((2 * a17) & 0xF6C01582) + ((a19 - 418) ^ 0x5807C97);
  return ((uint64_t (*)(void))(*(_QWORD *)(v19
                                        + 8
                                        * ((50
                                          * (((2 * v20) & 0xF59F7BEA ^ 0xF4801182) + (v20 ^ 0x1AFB734) - 436340020 == 1624094913)) ^ a19))
                            - 12))();
}

uint64_t sub_21A5A879C(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * (((a2 + a1 - 2060434933 >= (a4 - 130))
                                          * (((a4 - 74) | 0x137) ^ 0x5E7)) ^ a4))
                            - 8))();
}

uint64_t sub_21A5A8824(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * ((1995 * (a3 + a7 - 16 >= ((a4 + 37354004) & 0xFDC605EB) - 154)) ^ (a4 + 851)))
                            - 4))();
}

uint64_t sub_21A5A8874(int a1, int a2, int a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _BOOL4 v21;
  int v24;

  v9 = (a2 + a1 + a3);
  v10 = *(_QWORD *)(v8 - 120);
  v11 = v10 + v9 + ((125 * (a4 ^ 0x89u)) ^ 0x176);
  v12 = ((_BYTE)a2 + (_BYTE)a1 + (_BYTE)a3) & 0xF;
  v13 = v12 - v9;
  v14 = v5 + v13;
  v15 = v5 + v12 + 1;
  v16 = v4 + v13;
  v17 = v4 + v12 + 1;
  v18 = v6 + v13 + ((44 * (a4 ^ 0x99u)) ^ 0x347);
  v19 = v12 + v6 + 4;
  v21 = v15 > v10 && v14 < v11;
  if (v17 > v10 && v16 < v11)
    v21 = 1;
  v24 = v19 > v10 && v18 < v11 || v21;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((1155 * (v24 ^ 1)) ^ a4)) - 8))();
}

uint64_t sub_21A5A8928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  unsigned int v8;
  uint64_t v9;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v9 + 8 * (a8 ^ (22 * (v8 < 0x10))))
                                                                    - ((a8 - 467) | 6u)
                                                                    + 363))(a1, a2, a3, 0);
}

uint64_t sub_21A5A8958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;
  int8x16_t v20;
  int8x16_t v21;
  int8x16x4_t v23;
  int8x16x4_t v24;

  v23.val[1].i64[0] = ((_BYTE)v12 + 12) & 0xF;
  v23.val[1].i64[1] = ((_BYTE)v12 + 11) & 0xF;
  v23.val[2].i64[0] = ((_BYTE)v12 + 10) & 0xF;
  v23.val[2].i64[1] = ((_BYTE)v12 + 9) & 0xF;
  v23.val[3].i64[0] = ((_BYTE)v12 + 8) & 0xF;
  v23.val[3].i64[1] = ((_BYTE)v12 + 7) & 0xF;
  v24.val[0].i64[0] = ((_BYTE)v12 + 6) & 0xF;
  v24.val[0].i64[1] = ((_BYTE)v12 + 5) & 0xF;
  v16 = *(_QWORD *)(v15 - 120) - 15;
  v24.val[1].i64[0] = (v12 + 4) & 0xF;
  v24.val[1].i64[1] = ((_BYTE)v12 + 3) & 0xF;
  v24.val[2].i64[0] = ((_BYTE)v12 + 2) & 0xF;
  v24.val[2].i64[1] = ((_BYTE)v12 + 1) & 0xF;
  v24.val[3].i64[0] = v12 & 0xF;
  v24.val[3].i64[1] = (v12 - 1) & 0xF;
  v17.i64[0] = 0x8181818181818181;
  v17.i64[1] = 0x8181818181818181;
  v18.i64[0] = 0x4949494949494949;
  v18.i64[1] = 0x4949494949494949;
  v23.val[0].i64[0] = ((_BYTE)v12 + (_BYTE)v8) & 0xF;
  v23.val[0].i64[1] = ((_BYTE)v12 + 13) & 0xF;
  v19.i64[0] = vqtbl4q_s8(v23, (int8x16_t)xmmword_21A5D5130).u64[0];
  v19.i64[1] = vqtbl4q_s8(v24, (int8x16_t)xmmword_21A5D5130).u64[0];
  v20 = vrev64q_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v16 + (v12 + v8)), *(int8x16_t *)(v10 + v23.val[0].i64[0] - 15)), veorq_s8(*(int8x16_t *)(v9 + v23.val[0].i64[0] - 15), *(int8x16_t *)(v23.val[0].i64[0] + v11 - 12))));
  v21 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v20, v20, 8uLL), v18), vmulq_s8(v19, v17)));
  *(int8x16_t *)(v16 + (v12 + v8)) = vextq_s8(v21, v21, 8uLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(v14
                                        + 8
                                        * ((1007 * (9 * ((a8 - 687) ^ 0xCF) - 794 == (v13 & 0xFFFFFFF0))) ^ (a8 - 687)))
                            - 12))();
}

uint64_t sub_21A5A8AC8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (v5 ^ (195 * (v4 != a4))))
                            - (v5 - 731)
                            - ((v5 - 435) ^ 0xFFFFFFFFFFFFFECELL)))();
}

uint64_t sub_21A5A8AFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v8
                                                                                                 + 8
                                                                                                 * ((((((a6 ^ 0x138) - 367) & v7) == 0) * (a6 ^ 0x8A)) ^ a6))
                                                                                     - 8))(a1, a2, a3, a4, (v6 - a4), a6 ^ 0x138u);
}

uint64_t sub_21A5A8B34(int a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int8x16x4_t v30;

  *(_DWORD *)(v25 - 132) = v22;
  *(_DWORD *)(v25 - 128) = v24;
  v26 = *(_QWORD *)(v25 - 120) - 7;
  *(_DWORD *)(v25 - 136) = v22 & 0xFFFFFFF8;
  v27 = -a4;
  *(_DWORD *)(v25 - 124) = v23 + a2 + a1 + 7;
  v28 = (a2 + a1 + a3 + v27);
  v30.val[0].i64[0] = ((_BYTE)a2 + (_BYTE)a1 + (_BYTE)a3 + (_BYTE)v27) & 0xF;
  v30.val[0].i64[1] = ((_BYTE)v23 + (_BYTE)a2 + (_BYTE)a1 + 13 + (_BYTE)v27) & 0xF;
  v30.val[1].i64[0] = ((_BYTE)v23 + (_BYTE)a2 + (_BYTE)a1 + 12 + (_BYTE)v27) & 0xF;
  v30.val[1].i64[1] = (v21 + (_BYTE)v27 + ((a7 + 102) ^ 6)) & 0xF;
  v30.val[2].i64[0] = ((_BYTE)v23 + (_BYTE)a2 + (_BYTE)a1 + 10 + (_BYTE)v27) & 0xF;
  v30.val[2].i64[1] = ((_BYTE)v23 + (_BYTE)a2 + (_BYTE)a1 + 9 + (_BYTE)v27) & 0xF;
  v30.val[3].i64[0] = ((_BYTE)v23 + (_BYTE)a2 + (_BYTE)a1 + 8 + (_BYTE)v27) & 0xF;
  v30.val[3].i64[1] = (*(_DWORD *)(v25 - 124) + (_BYTE)v27) & 0xF;
  *(int8x8_t *)(v26 + v28) = vrev64_s8(veor_s8(veor_s8(vrev64_s8(veor_s8(veor_s8(*(int8x8_t *)(v26 + v28), *(int8x8_t *)(v19 + (v28 & 0xF) - 7)), veor_s8(*(int8x8_t *)(v18 + (v28 & 0xF) - 7), *(int8x8_t *)((v28 & 0xF) + v20 - 4)))), (int8x8_t)0x4949494949494949), vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v30, (int8x16_t)xmmword_21A5D5140), (int8x8_t)0x8181818181818181)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a18 + 8 * ((60 * (8 - (v22 & 0xFFFFFFF8) == v27)) ^ (a7 + 741)))
                                         - 8))((__n128)xmmword_21A5D5140);
}

void sub_21A5A8C78()
{
  JUMPOUT(0x21A5A8B90);
}

uint64_t sub_21A5A8C80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v6
                                                                                                  + 8 * (((((v5 - 652) | 0x26) + 1497) * (*(_DWORD *)(v7 - 132) == *(_DWORD *)(v7 - 136))) ^ v5))
                                                                                      - 4))(a1, a2, a3, a4, a5, (v5 - 614));
}

uint64_t sub_21A5A8CB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = (a5 + v7);
  *(_BYTE *)(*(_QWORD *)(v12 - 120) + v13) ^= *(_BYTE *)(v9 + (v13 & 0xF)) ^ *(_BYTE *)(v8 + (v13 & 0xF)) ^ *(_BYTE *)((v13 & 0xF) + v10 + 3) ^ (-127 * (v13 & 0xF)) ^ 0x49;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((276 * (a5 - 1 == v6)) ^ (a6 + 199))) - 8))();
}

void sub_21A5A8D20()
{
  int v0;
  int v1;
  int *v2;

  if (v0 == 1317490751)
    v1 = 1412947868;
  else
    v1 = 1412905844;
  *v2 = v1;
}

void sub_21A5A8D84(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 28) + 386855771 * ((2 * (a1 & 0x61E74750) - a1 - 1642547025) ^ 0x4792B00B);
  __asm { BR              X17 }
}

uint64_t sub_21A5A8EE8()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (v2 ^ (874
                                               * ((((((v2 - 434) | 0xE1) + 888) ^ 0xFF9FFB62) & (2 * v1) ^ v0)
                                                + (v1 ^ 0x18848122)
                                                + 2143232764 != 2140086939))))
                            - 12))();
}

uint64_t sub_21A5A8F50(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4
                              + 8 * ((792 * (((v3 ^ 0x26B ^ ((a3 + a2 + 3145825) < 8)) & 1) == 0)) ^ v3)))();
}

uint64_t sub_21A5A8FA0()
{
  int v0;
  unsigned int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * (((((v0 - 571602498) & 0x2211F7FE) - 660) * (v1 >> 4 == 268238842)) ^ v0)))();
}

uint64_t sub_21A5A8FE4(uint64_t a1, int a2, int a3, int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _BOOL4 v23;

  v14 = a10 - 0x1749F021FF00FE37 + ((218 * (a6 ^ 0x2A1)) ^ (a4 + 654)) + a3 + a2;
  v15 = (a6 ^ 0xC0D4DBA1E6065FE6) + a5 - (a10 - 0x1749F021FF00FE37);
  v16 = (a3 + a2) & 0xF;
  v17 = v16 + v11 - v14;
  v18 = (v16 | v10) - v14;
  v19 = (v16 | v12) - v14;
  v23 = v17 < 0x10 || v15 < 0x10 || (unint64_t)(v18 + 1) < 0x10 || v19 < 0x10;
  return ((uint64_t (*)(void))(*(_QWORD *)(v13 + 8 * (((2 * v23) | (16 * v23)) ^ a6)) - 12))();
}

uint64_t sub_21A5A9098@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unsigned int a5@<W8>)
{
  unsigned int v5;
  uint64_t v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v6
                                                                                         + 8
                                                                                         * ((31
                                                                                           * (a5 < ((v5 - 237) ^ 0x2D)
                                                                                                 - 127)) ^ v5))
                                                                             - 8))(a1, a2, a3, a4, 0);
}

uint64_t sub_21A5A90CC@<X0>(int a1@<W7>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int8x16_t v23;
  uint64_t v24;
  int8x16_t v25;
  int8x16_t v26;
  int8x16x4_t v28;
  int8x16x4_t v29;

  v28.val[1].i64[0] = ((_BYTE)a1 + 2) & 0xF;
  v28.val[1].i64[1] = ((_BYTE)a1 + 1) & 0xF;
  v28.val[2].i64[0] = a1 & 0xF;
  v28.val[2].i64[1] = ((_BYTE)a1 - 1) & 0xF;
  v28.val[3].i64[0] = ((_BYTE)a1 + 14) & 0xF;
  v28.val[3].i64[1] = ((_BYTE)a1 + 13) & 0xF;
  v23.i64[0] = 0xF0F0F0F0F0F0F0FLL;
  v23.i64[1] = 0xF0F0F0F0F0F0F0FLL;
  v24 = (a1 + v21);
  v28.val[0].i64[0] = ((_BYTE)a1 + (_BYTE)v21) & 0xF;
  v28.val[0].i64[1] = ((_BYTE)a1 + 3) & 0xF;
  v25.i64[0] = vqtbl4q_s8(v28, (int8x16_t)xmmword_21A5D5130).u64[0];
  v29.val[0].i64[1] = ((_BYTE)a1 + 11) & 0xF;
  v29.val[1].i64[1] = ((_BYTE)a1 + 9) & 0xF;
  v29.val[2].i64[1] = (a1 + 7) & 0xF;
  v29.val[3].i64[1] = ((_BYTE)a1 + 5) & 0xF;
  v29.val[0].i64[0] = ((_BYTE)a1 + 12) & 0xF;
  v29.val[1].i64[0] = ((_BYTE)a1 + 10) & 0xF;
  v29.val[2].i64[0] = (a1 + 8) & 0xF;
  v29.val[3].i64[0] = ((_BYTE)a1 + 6) & 0xF;
  v25.i64[1] = vqtbl4q_s8(v29, (int8x16_t)xmmword_21A5D5130).u64[0];
  v26 = vrev64q_s8(vmulq_s8(v25, v23));
  *(int8x16_t *)(*(_QWORD *)(v22 - 120) - 15 + v24) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v19 + (v24 & 0xF) - 15), *(int8x16_t *)(v16 - 15 + v24)), veorq_s8(*(int8x16_t *)((v24 & 0xF) + v17 - 14), *(int8x16_t *)(v20 + (v24 & 0xF) - 15))), vextq_s8(v26, v26, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a16 + 8 * ((992 * ((v18 ^ 0xCB) - 52 == (a2 & 0xFFFFFFF0))) ^ v18)) - 8))();
}

uint64_t sub_21A5A9230()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8
                                            * ((251 * (((v1 == 0xE74B7EBD) ^ ((v0 ^ 0xCA) - 69)) & 1)) ^ v0 ^ 0x2CA)))(848375816);
}

uint64_t sub_21A5A92AC(int a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  _BOOL4 v16;

  *(_BYTE *)(*(_QWORD *)(v11 - 120) + (a1 - 848375816)) = *(_BYTE *)(v4 + (((_BYTE)a1 - 8) & 0xF)) ^ *(_BYTE *)(v1 + (a1 - 848375816)) ^ *(_BYTE *)((((_BYTE)a1 - 8) & 0xF) + v2 + 1) ^ *(_BYTE *)(v5 + ((a1 - 848375816) & 0xFLL)) ^ (((a1 - 8) & 0xF) * (((v6 + 99) | 0x44) ^ 0x52));
  v12 = v7 > v9;
  v13 = a1 + 1389024956;
  v14 = (a1 + 1);
  v15 = v12 ^ (v13 < v3);
  v16 = v13 < v8;
  if (!v15)
    v12 = v16;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v10 + 8 * ((1343 * v12) ^ v6)) - 12))(v14);
}

uint64_t sub_21A5A934C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  int v6;
  uint64_t v7;

  return (*(uint64_t (**)(void))(v7 + 8 * ((697 * (((v5 == a5) ^ ((v6 ^ 0xD4) - 51)) & 1)) | v6)))();
}

uint64_t sub_21A5A9380()
{
  char v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((710 * ((v0 & 8) == ((v1 + 254) ^ 0x22C) - 162)) ^ v1)) - 8))();
}

uint64_t sub_21A5A93BC@<X0>(char a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, int a5@<W4>, char a6@<W7>, int a7@<W8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  char v29;
  uint64_t v30;
  int8x16x4_t v32;

  *(_DWORD *)(v26 - 144) = a7;
  *(_QWORD *)(v26 - 128) = v21 - 7;
  v27 = *(_QWORD *)(v26 - 128);
  *(_QWORD *)(v26 - 136) = *(_QWORD *)(v26 - 120) - 7;
  *(_DWORD *)(v26 - 152) = a7 & 0xFFFFFFF8;
  v28 = -8 - a5;
  v29 = a1 + a3 + a2;
  v30 = (a3 + a2 + a4 + v28 + 8);
  v32.val[0].i64[0] = ((_BYTE)a3 + (_BYTE)a2 + (_BYTE)a4 + (_BYTE)v28 + 8) & 0xF;
  v32.val[0].i64[1] = (v29 + 3 + (_BYTE)v28 + 8) & 0xF;
  v32.val[1].i64[0] = (a6 + (_BYTE)v28 + 8 + ((v25 - 94) ^ 6)) & 0xF;
  v32.val[1].i64[1] = (v29 + 1 + (_BYTE)v28 + 8) & 0xF;
  v32.val[2].i64[0] = (a6 + (_BYTE)v28 + 8) & 0xF;
  v32.val[2].i64[1] = (v29 + 15 + (_BYTE)v28 + 8) & 0xF;
  v32.val[3].i64[0] = (v29 + 14 + (_BYTE)v28 + 8) & 0xF;
  v32.val[3].i64[1] = (v29 + 13 + (_BYTE)v28 + 8) & 0xF;
  *(int8x8_t *)(*(_QWORD *)(v26 - 136) + v30) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v23 + (v30 & 0xF) - 7), *(int8x8_t *)(v27 + v30)), veor_s8(*(int8x8_t *)((v30 & 0xF) + v22 - 6), *(int8x8_t *)(v24 + (v30 & 0xF) - 7))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v32, (int8x16_t)xmmword_21A5D5140), (int8x8_t)0xF0F0F0F0F0F0F0FLL)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a21 + 8 * ((99 * (-(a7 & 0xFFFFFFF8) == v28)) ^ v25)) - 4))((__n128)xmmword_21A5D5140);
}

void sub_21A5A9510()
{
  JUMPOUT(0x21A5A9420);
}

uint64_t sub_21A5A9518(int a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v1 + 8 * ((((2 * a1) ^ 0x29) * (*(_DWORD *)(v2 - 144) != *(_DWORD *)(v2 - 152))) ^ a1)))();
}

uint64_t sub_21A5A9558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = (v9 + v13);
  *(_BYTE *)(*(_QWORD *)(v15 - 120) + v16) = *(_BYTE *)(v10 + (v16 & 0xF)) ^ *(_BYTE *)(v7 + v16) ^ *(_BYTE *)(v11 + (v16 & 0xF)) ^ (15 * (v16 & 0xF)) ^ *(_BYTE *)(((a7 - 824611471) & 0x3126945D) + (unint64_t)(v16 & 0xF) + v8 - 1116);
  return ((uint64_t (*)(void))(*(_QWORD *)(v14 + 8 * ((22 * (v9 - 1 == v12)) ^ (a7 - 238))) - 12))();
}

uint64_t sub_21A5A95DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int8x16_t v18;

  v18.i64[0] = 0xDADADADADADADADALL;
  v18.i64[1] = 0xDADADADADADADADALL;
  *(int8x16_t *)(v17 - 112) = veorq_s8(vaddq_s8(*(int8x16_t *)*(_QWORD *)(v15 + 32), v18), (int8x16_t)xmmword_21A5D5190);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 + 8 * (int)(a6 ^ (37 * (*(_QWORD *)(v17 - 120) == 0)))) - 4))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t sub_21A5A963C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,int a24)
{
  uint64_t v24;
  int v25;
  int v26;
  _BOOL4 v28;

  v25 = a13 - ((2 * a13 + 1253111958) & 0x9DFC5D6E) + a24 - 195647607;
  v26 = (((a6 - 568) ^ 0xFF6AF1C1) & (2 * v25) ^ 0x9D685164) + (v25 ^ 0x314B5745);
  v28 = (((_BYTE)v26 + 14) & 0xF) == (((_DWORD)a6 - 484) | 0x100) - 889 && v26 != 2142599666;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 + 8 * ((110 * v28) ^ ((int)a6 - 568))) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t sub_21A5A96EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  unsigned int v27;
  char *v28;
  int v29;
  char *v30;
  unint64_t v31;
  int v32;
  char *v33;
  int v34;
  unsigned int v35;
  int v36;
  char *v37;
  int v38;
  int v39;
  unsigned int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  unsigned __int8 v47;
  int v48;
  int v49;
  unsigned __int8 v50;
  int v51;
  unsigned int v52;
  unsigned int v53;
  int v54;
  unsigned int v55;
  int v56;
  int v57;
  unint64_t v58;
  int v59;
  int v60;
  unsigned int v61;
  unsigned int v62;
  int v63;
  int v64;
  int v65;
  unsigned int v66;
  int v67;
  int v68;
  int v69;
  uint64_t v70;
  unsigned __int8 *v71;
  int v72;
  int v73;
  int v74;
  uint64_t v75;
  int v76;
  int v77;
  uint64_t v78;
  int v79;
  int v80;
  int v81;
  uint64_t v82;
  int v83;
  unsigned int v84;
  int v85;
  int v86;
  unsigned int v87;
  unsigned int v88;
  int v89;
  unsigned int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  unsigned __int8 v95;
  int v96;
  int v97;
  int v98;
  unsigned int v99;
  unsigned int v100;
  int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  char *v106;
  int v107;
  char *v108;
  int v109;
  char *v110;
  int v111;
  unsigned int v112;
  int v113;
  int v114;
  char *v115;
  unsigned int v116;
  unsigned int v117;
  int v118;
  unsigned int v119;
  int v120;
  int v121;
  unsigned int v122;
  unsigned int v123;
  int v124;
  int v125;
  unsigned int v126;
  int v127;
  int v128;
  unsigned int v129;
  int v130;
  int v131;
  int v132;
  int v133;
  unsigned int v134;
  int v135;
  int v136;
  int v137;
  unsigned int v138;
  unsigned int v139;
  unsigned int v140;
  int v141;
  int v142;
  unsigned int v143;
  int v144;
  int v145;
  int v146;
  unsigned int v147;
  int v148;
  int v149;
  unsigned int v150;
  unsigned int v151;
  unsigned int v152;
  int v153;
  int v154;
  unsigned int v155;
  unsigned int v156;
  int v157;
  int v158;
  unsigned int v159;
  int v160;
  int v161;
  unsigned int v162;
  int v163;
  unsigned int v164;
  int v165;
  int v166;
  unsigned int v167;
  int v168;
  int v169;
  int v170;
  int v171;
  unsigned int v172;
  int v173;
  unint64_t v174;
  unsigned int v175;
  unsigned int v176;
  unsigned int v177;
  unsigned int v178;
  int v179;
  int v180;
  int v181;
  int v182;
  unsigned int v183;
  unsigned int v184;
  unsigned int v185;
  int v186;
  int v187;
  unsigned int v188;
  int v189;
  int v190;
  int v191;
  int v192;
  unsigned int v193;
  int v194;
  unsigned int v195;
  unsigned int v196;
  int v197;
  unsigned int v198;
  unsigned int v199;
  int v200;
  int v201;
  unsigned int v202;
  int v203;
  int v204;
  unsigned int v205;
  unsigned int v206;
  unsigned int v207;
  int v208;
  unsigned int v209;
  int v210;
  int v211;
  int v212;
  unsigned int v213;
  unsigned int v214;
  unsigned int v215;
  unsigned int v216;
  int v217;
  int v218;
  int v219;
  unsigned int v220;
  int v221;
  int v222;
  int v223;
  int v224;
  int v225;
  unsigned int v226;
  unsigned int v227;
  int v228;
  int v229;
  int v230;
  int v231;
  int v232;
  int v233;
  int v234;
  unsigned int v235;
  unsigned int v236;
  int v237;
  int v238;
  unsigned int v239;
  int v240;
  int v241;
  unsigned int v242;
  int v243;
  int v244;
  unsigned int v245;
  int v246;
  int v247;
  unsigned int v248;
  unsigned int v249;
  unsigned int v250;
  unsigned int v251;
  BOOL v252;
  unsigned int v253;
  unsigned int v254;
  unsigned int v255;
  int v256;
  unsigned int v257;
  int v258;
  int v259;
  int v260;
  unsigned int v261;
  unsigned int v262;
  int v263;
  unsigned int v264;
  unsigned int v265;
  int v266;
  int v267;
  int v268;
  unsigned int v269;
  unsigned int v270;
  unsigned int v271;
  int v272;
  char *v273;
  int v274;
  unint64_t v275;
  int v276;
  char *v277;
  int v278;
  char *v279;
  int v280;
  char *v281;
  unsigned int v282;
  int v283;
  unsigned int v284;
  int v285;
  int v286;
  int v287;
  unsigned int v288;
  int v289;
  unsigned int v290;
  unsigned int v291;
  unsigned int v292;
  unsigned int v293;
  int v294;
  unint64_t v295;
  int v296;
  uint64_t v297;
  int v298;
  int v299;
  int v300;
  unsigned int v301;
  int v302;
  unsigned int v303;
  int v304;
  int v305;
  int v306;
  unint64_t v307;
  int v308;
  int v309;
  unsigned int v310;
  unsigned int v311;
  int v312;
  uint64_t v313;
  unsigned int v314;
  unsigned int v315;
  char *v316;
  unsigned int v317;
  uint64_t v318;
  unsigned int v319;
  int v320;
  char *v321;
  unsigned int v322;
  char *v323;
  unsigned int v324;
  unsigned int v325;
  unsigned int v326;
  unsigned int v327;
  unsigned int v328;
  unsigned int v329;
  unsigned int v330;
  int v331;
  unsigned int v332;
  unsigned int v333;
  unsigned int v334;
  int v335;
  unsigned int v336;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  char *v341;
  char *v342;
  char *v343;
  unsigned int v344;
  uint64_t v345;
  __int16 v346;

  v26 = v24 - 407;
  v27 = (v24 + 1364874393) & 0xAEA5ABCF;
  v28 = (char *)*(&off_24DCDB210 + v24 - 379) - 4;
  v29 = v28[*(unsigned __int8 *)(v25 - 99) ^ 0x1CLL];
  v30 = (char *)*(&off_24DCDB210 + v26 + 23) - 8;
  HIDWORD(v31) = v29 ^ 8;
  LODWORD(v31) = (v29 ^ 0x60) << 24;
  v32 = (((v31 >> 28) ^ (v27 - 75)) << 16) | ((v30[*(unsigned __int8 *)(v25 - 98) ^ 6] ^ 0xC4) << 8);
  v33 = (char *)*(&off_24DCDB210 + v26 + 150) - 4;
  v34 = v33[*(unsigned __int8 *)(v25 - 108) ^ 0x90];
  v35 = v34 - ((2 * v34 + 74) & 0x76) + 32;
  v36 = (v35 >> 2) & 0x37 ^ v35;
  v37 = (char *)*(&off_24DCDB210 + v26 + 179) - 8;
  v38 = v37[*(unsigned __int8 *)(v25 - 105) ^ 0xDDLL];
  HIDWORD(v31) = ~v38;
  LODWORD(v31) = (v38 ^ 0x30) << 24;
  v39 = (v31 >> 26) - ((2 * (v31 >> 26)) & 0xFFFFFFFB) - 3;
  v40 = ((2 * ((((v36 ^ 0x16) + (v36 ^ 0xFFFFFF9D) + 1) ^ 0xFFFFFFF8) + (v36 ^ 0xFFFFFF9D))) & 0xFFFFFFEC)
      + (((((v36 ^ 0x16) + (v36 ^ 0xFFFFFF9D) + 1) ^ 0xFFFFFFF8) + (v36 ^ 0xFFFFFF9D)) ^ 0x76);
  v41 = v40;
  v42 = v28[*(unsigned __int8 *)(v25 - 107) ^ 0x3CLL];
  HIDWORD(v31) = v42 ^ 8;
  LODWORD(v31) = (v42 ^ 0x60) << 24;
  v43 = ((-16 * (v39 ^ 0xD) * (v39 ^ 0xD) - 3) ^ v39) | (v40 << 24) | (((v31 >> 28) ^ 0xFD) << 16);
  v44 = v37[*(unsigned __int8 *)(v25 - 109) ^ 0xF9];
  HIDWORD(v31) = ~v44;
  LODWORD(v31) = (v44 ^ 0x30) << 24;
  v45 = (v31 >> 26) - ((2 * (v31 >> 26)) & 0x52) - 87;
  v46 = v37[*(unsigned __int8 *)(v25 - 101) ^ 0x5DLL];
  v47 = (16 * (v45 ^ 9) * (v45 ^ 9) - ((32 * (v45 ^ 9) * (v45 ^ 9)) & 0x40) - 87) ^ v45;
  HIDWORD(v31) = ~v46;
  LODWORD(v31) = (v46 ^ 0x30) << 24;
  v48 = (v31 >> 26) + (~(2 * (v31 >> 26)) | 0xFFFFFF9D) - 78;
  v49 = v37[*(unsigned __int8 *)(v25 - 97) ^ 0xA5];
  v50 = (16 * (v48 ^ 1) * (v48 ^ 1) - 32 * (((v48 ^ 1) * (v48 ^ 1)) & 3) - 79) ^ v48;
  HIDWORD(v31) = ~v49;
  LODWORD(v31) = (v49 ^ 0x30) << 24;
  v51 = (v31 >> 26) - ((2 * (v31 >> 26)) & 0x4C) - 90;
  v52 = v32 & 0xFFFFFF00 | ((16 * (v51 ^ 6) * (v51 ^ 6) - ((32 * (v51 ^ 6) * (v51 ^ 6)) & 0x40) - 90) ^ v51);
  v53 = v33[*(unsigned __int8 *)(v25 - 100) ^ 0x85]
      - ((2 * v33[*(unsigned __int8 *)(v25 - 100) ^ 0x85] - 54) & 0xFFFFFFDA)
      - 46;
  if (v41 == 118)
    v54 = -36;
  else
    v54 = v53 ^ 0x4C;
  v55 = v53 ^ 0x8A ^ (((v54 & (v53 ^ 0x6C)) >> 2) - (((v54 & (v53 ^ 0x6C)) >> 1) & 0x5A) + 109);
  v56 = v28[*(unsigned __int8 *)(v25 - 103) ^ 0x53];
  v57 = v52 | (v55 << 24);
  HIDWORD(v58) = v56 ^ 8;
  LODWORD(v58) = (v56 ^ 0x60) << 24;
  v59 = v33[*(unsigned __int8 *)(v25 - 104) ^ 0x18];
  v60 = v50 | (((v58 >> 28) ^ 0x3A) << 16) | ((v30[*(unsigned __int8 *)(v25 - 102) ^ 0xEDLL] ^ 0xFC) << 8);
  v61 = v59 + (~(2 * v59 - 54) | 0x3B) - 56;
  v341 = v33;
  v62 = v33[*(unsigned __int8 *)(v25 - 112) ^ 0xD6]
      + (~(2 * v33[*(unsigned __int8 *)(v25 - 112) ^ 0xD6] + 10) | 0xFFFFFFE5)
      - 13;
  v63 = v60 | ((v61 ^ 0xC5 ^ (((v61 >> 2) & 0x37 ^ 0x10) - ((v61 >> 1) & 0x44444444) + 98)) << 24);
  v64 = v62 ^ 0x85 ^ (((v62 >> 2) & 0x37 ^ 0x23) - ((2 * ((v62 >> 2) & 0x37 ^ 0x23)) & 0xA) - 115);
  v342 = v30;
  v343 = v28;
  v65 = v28[*(unsigned __int8 *)(v25 - 111) ^ 0xC9];
  HIDWORD(v58) = v65 ^ 8;
  LODWORD(v58) = (v65 ^ 0x60) << 24;
  v346 = v63 ^ 0xA368;
  v66 = ((v43 | ((v30[*(unsigned __int8 *)(v25 - 106) ^ 0x67] ^ 0xA1) << 8)) - 1979711488) ^ 0xCC38761E;
  v344 = (v47 | (v64 << 24) | (((v58 >> 28) ^ 0xC9) << 16) | ((v30[*(unsigned __int8 *)(v25 - 110) ^ 0xDDLL] ^ 0x1B) << 8)) ^ 0x824CC8C8;
  v67 = v57 ^ 0x60F9A32F;
  HIDWORD(v340) = v23 - 2142599666;
  LODWORD(v340) = v27 ^ 0x396;
  HIDWORD(v339) = v27 ^ 0x29F;
  LODWORD(v339) = v27 ^ 0x271;
  HIDWORD(v338) = v27 ^ 0x258;
  LODWORD(v338) = v27 ^ 0x2BC;
  *(_DWORD *)(v25 - 128) = v27;
  HIDWORD(a13) = v27 ^ 0x3C4;
  HIDWORD(a21) = 0;
  v68 = *(_DWORD *)(v25 - 128);
  v69 = v68;
  *(_QWORD *)(v25 - 152) = 6;
  HIDWORD(a23) = v68 + 235;
  v70 = (v68 + 235) ^ 0x37Bu;
  *(_QWORD *)(v25 - 136) = v70;
  v71 = *(unsigned __int8 **)(v25 - 120);
  v72 = v30[v71[v70] ^ 0xAALL];
  v73 = v37[v71[7] ^ 0x15];
  v74 = v30[v71[6] ^ 0x4ALL] ^ 0xAC;
  v75 = v71[14];
  *(_QWORD *)(v25 - 160) = 15;
  HIDWORD(v58) = ~v73;
  LODWORD(v58) = (v73 ^ 0x30) << 24;
  v76 = (v58 >> 26) - ((2 * (v58 >> 26)) & 0x1C) - 114;
  LODWORD(v75) = v30[v75 ^ 0x3D] ^ 0x71;
  v77 = v37[v71[15] ^ 0xE7];
  *(_QWORD *)(v25 - 184) = 3;
  v78 = v71[3];
  HIDWORD(v58) = ~v77;
  LODWORD(v58) = (v77 ^ 0x30) << 24;
  v79 = (((16 * v76) ^ 0xE0) * (v76 ^ 0xE)) & 0xF0 ^ (v76 ^ 0x8E | (v74 << 8));
  v80 = (v58 >> 26) - ((2 * (v58 >> 26)) & 0x38) - 100;
  *(_QWORD *)(v25 - 144) = 10;
  v81 = v37[v78 ^ 0xA6];
  LODWORD(v78) = ((16 * (v80 ^ 0xC) * (v80 ^ 0xC) - 32 * (((v80 ^ 0xC) * (v80 ^ 0xC)) & 1) - 100) ^ v80) | ((_DWORD)v75 << 8);
  v82 = v71[10];
  HIDWORD(v58) = ~v81;
  LODWORD(v58) = (v81 ^ 0x30) << 24;
  LODWORD(v75) = (v58 >> 26) - ((2 * (v58 >> 26)) & 0x34) + 26;
  *(_QWORD *)(v25 - 176) = 8;
  v83 = v341[v71[8] ^ 0xAALL];
  v84 = v83 - ((2 * v83 - 54) & 0xFFFFFF8A) - 86;
  LODWORD(v82) = ((v342[v82 ^ 0x7B] ^ 0x84) << 8) | ((v84 ^ 0x7A ^ (((v84 >> 2) & 0x37 ^ 0x11)
                                                                                   - ((2 * ((v84 >> 2) & 0x37 ^ 0x11)) & 0xA)
                                                                                   + 69)) << 24);
  v85 = (((16 * v75) ^ 0xA0) * (v75 ^ 0xA)) & 0xF0 ^ (v75 ^ 0x1A | ((v72 ^ 0xC6) << 8));
  LODWORD(v75) = v28[v71[1] ^ 0x40];
  HIDWORD(v58) = v75 ^ 8;
  LODWORD(v58) = (v75 ^ 0x60) << 24;
  v86 = v341[v71[4] ^ 0xDDLL];
  v87 = v85 & 0xFF00FFFF | (((v58 >> 28) ^ 0x29) << 16);
  LODWORD(v75) = v86 - ((2 * v86 - 54) & 0xFFFFFFC4) - 57;
  *(_QWORD *)(v25 - 168) = 12;
  v88 = v79 | ((v75 ^ 0x6E ^ (((v75 >> 2) & 0x37 ^ 0x10)
                                          - ((v75 >> 1) & 0x44444444)
                                          + 98)) << 24);
  v89 = v341[v71[12] ^ 1];
  v90 = v89 - ((2 * (_BYTE)v89 + 10) & 0x20) + 117;
  v91 = v28[v71[13] ^ 0x33];
  HIDWORD(v58) = v91 ^ 8;
  LODWORD(v58) = (v91 ^ 0x60) << 24;
  v92 = v78 & 0xFF00FFFF | ((v90 ^ 0x13 ^ (((v90 >> 2) & 0x37 ^ 4) - ((v90 >> 1) & 0x20) + 16)) << 24) | (((v58 >> 28) ^ 0xC) << 16);
  v93 = v28[v71[9] ^ 0xAFLL];
  HIDWORD(v58) = v93 ^ 8;
  LODWORD(v58) = (v93 ^ 0x60) << 24;
  LODWORD(v78) = (((v58 >> 28) ^ 0x4D) << 16)
               - ((((v58 >> 28) ^ 0x4D) << 17) & 0xD00000)
               + 6816580;
  v94 = v28[v71[5] ^ 0x7DLL];
  HIDWORD(v58) = v94 ^ 8;
  LODWORD(v58) = (v94 ^ 0x60) << 24;
  v95 = (v58 >> 28) ^ 0x2C;
  v96 = v37[v71[11] ^ 0xACLL];
  HIDWORD(v58) = ~v96;
  LODWORD(v58) = (v96 ^ 0x30) << 24;
  v97 = v341[*v71 ^ 4];
  v98 = (v58 >> 26) - ((2 * (v58 >> 26)) & 0xFFFFFFB4) - 38;
  v99 = (v88 & 0xFF00FFFF | (v95 << 16)) ^ v66;
  v100 = v97 - ((2 * v97 - 54) & 0xFFFFFFB8) - 63;
  LODWORD(v82) = v78 & 0xFF0000 | (v82 - ((2 * v82) & 0xA005400) + 90843830) & 0xFF00FF00 | ((16 * (v98 ^ 0xA) * (v98 ^ 0xA) - ((32 * (v98 ^ 0xA) * (v98 ^ 0xA)) & 0xBF) - 38) ^ v98);
  v101 = v87 | ((v100 ^ (((v100 >> 2) & 0x37 ^ 0x17) - ((2 * ((v100 >> 2) & 0x37 ^ 0x17)) & 0x38) + 92) ^ 0xFE) << 24);
  v102 = v92 ^ v67;
  v103 = v101 ^ v344;
  v104 = v82 ^ v63 ^ 0x9B56A368;
  v105 = HIBYTE(v99) ^ 0xAF;
  HIDWORD(v58) = ((v101 ^ v344) >> 28) ^ 0x212BBB8;
  LODWORD(v58) = (16 * (v101 ^ v344)) ^ 0x60000000;
  v106 = (char *)*(&off_24DCDB210 + (int)v340) - 12;
  v107 = *(_DWORD *)&v106[4 * (HIBYTE(v103) ^ 0x15)] + (HIBYTE(v103) ^ 0xE3) - 1680530951 + ((v58 >> 28) ^ 0x6FD3613C);
  v108 = (char *)*(&off_24DCDB210 + SHIDWORD(v339)) - 12;
  v109 = (v107 - 1709458118 - ((2 * v107) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v99) ^ 0x11)];
  v110 = (char *)*(&off_24DCDB210 + v69 - 379) - 4;
  v111 = *(_DWORD *)&v110[4 * (((unsigned __int16)(v82 ^ v346) >> 8) ^ 0xCB)];
  if (v105 >= 0xAB)
    v105 -= 171;
  v112 = v109 + 1094462400 - ((2 * v109) & 0x82785780);
  if ((v99 ^ 0xAF000000) >> 24 <= 0xAA)
    v113 = 0;
  else
    v113 = 171;
  v114 = v105 + v113 - 889667809 - ((2 * (v105 + v113)) & 0x23E);
  v115 = (char *)*(&off_24DCDB210 + v69 - 423) - 12;
  v116 = *(_DWORD *)&v115[4 * (v102 ^ 0x86)] ^ v111 ^ v112;
  v117 = *(_DWORD *)&v106[4 * (v114 ^ 0xCAF8BFE9)] + (v114 ^ 0x84006546) - 1680530951 + (v114 ^ 0xCAF8BF1F);
  v118 = (v117 - 1709458118 - ((2 * v117) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v104) ^ 0x35)];
  v119 = *(_DWORD *)&v115[4 * (v103 ^ 0x63)] ^ *(_DWORD *)&v110[4 * (BYTE1(v102) ^ 0xC1)] ^ (v118 + 1094462400 - ((2 * v118) & 0x82785780));
  v120 = *(_DWORD *)&v106[4 * HIBYTE(v104)] + (HIBYTE(v104) ^ 0x4EF8DAAF) - 1680530951 + (HIBYTE(v104) ^ 0xF6);
  v121 = (v120 - 1709458118 - ((2 * v120) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v102) ^ 0xB7)];
  v122 = HIBYTE(v102);
  v123 = *(_DWORD *)&v115[4 * (v99 ^ 8)] ^ *(_DWORD *)&v110[4 * (BYTE1(v103) ^ 0x2B)] ^ (v121 + 1094462400 - ((2 * v121) & 0x82785780));
  v124 = (v122 ^ 0x4EF8DA72) - 1680530951 + (v122 ^ 0x2B) + *(_DWORD *)&v106[4 * (v122 ^ 0xDD)];
  v125 = (v124 - 1709458118 - ((2 * v124) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v103) ^ 0x63)];
  v126 = *(_DWORD *)&v115[4 * (v104 ^ 0x2F)] ^ *(_DWORD *)&v110[4 * (BYTE1(v99) ^ 0xE8)] ^ (v125 + 1094462400 - ((2 * v125) & 0x82785780));
  v127 = *(_DWORD *)&v106[4 * (HIBYTE(v116) ^ 0xE)] + (HIBYTE(v116) ^ 0x4EF8DAA1) - 1680530951 + (HIBYTE(v116) ^ 0xF8);
  v128 = (v127 - 1709458118 - ((2 * v127) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v119) ^ 0x79)];
  v129 = *(_DWORD *)&v115[4 * (v126 ^ 0xF)] ^ *(_DWORD *)&v110[4 * (BYTE1(v123) ^ 0x5D)] ^ (v128 + 1094462400 - ((2 * v128) & 0x82785780));
  v130 = *(_DWORD *)&v110[4 * (BYTE1(v126) ^ 0xCA)] ^ *(_DWORD *)&v108[4 * (BYTE2(v123) ^ 0x2E)] ^ (*(_DWORD *)&v106[4 * (HIBYTE(v119) ^ 5)]
                                                                                                  + (HIBYTE(v119) ^ 0x4EF8DAAA)
                                                                                                  - 1680530951
                                                                                                  + (HIBYTE(v119) ^ 0xF3));
  v131 = *(_DWORD *)&v115[4 * (v116 ^ 0x54)];
  v132 = v131 ^ 0x73520B9D ^ v130;
  v130 ^= 0x164FDCFFu;
  v133 = (v132 + v130 + 1) ^ ((v131 ^ 0x651DD762) + 1);
  v134 = v131 ^ 0xE8C8E8E6 ^ (v133 - ((2 * v133) & 0xE45580F6) + 1915404411);
  v135 = v134 + v130 - ((2 * (v134 + v130)) & 0x441BDAFA);
  v136 = (HIBYTE(v123) ^ 0x42) - 1680530951 + (HIBYTE(v123) ^ 0x4EF8DA1B) + *(_DWORD *)&v106[4 * (HIBYTE(v123) ^ 0xB4)];
  v137 = (v136 - 1709458118 - ((2 * v136) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v126) ^ 0x3F)];
  v138 = HIBYTE(v126);
  v139 = *(_DWORD *)&v115[4 * (v119 ^ 0x40)] ^ *(_DWORD *)&v110[4 * (BYTE1(v116) ^ 0x62)] ^ (v137 + 1094462400 - ((2 * v137) & 0x82785780));
  v140 = v135 + 571338109;
  v141 = (v138 ^ 0x23) - 1680530951 + (v138 ^ 0x4EF8DA7A) + *(_DWORD *)&v106[4 * (v138 ^ 0xD5)];
  v142 = (v141 - 1709458118 - ((2 * v141) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v116) ^ 0x58)];
  v143 = *(_DWORD *)&v115[4 * (v123 ^ 0x8B)] ^ *(_DWORD *)&v110[4 * (BYTE1(v119) ^ 0xCB)] ^ (v142 + 1094462400 - ((2 * v142) & 0x82785780));
  v144 = *(_DWORD *)&v108[4 * (BYTE2(v140) ^ 0xEE)];
  HIDWORD(v345) = 1087401806;
  v145 = ((v144 ^ 0x25342D88) + 1087401806) ^ ((v144 ^ 0x65E442C5) + 1);
  v146 = (*(_DWORD *)&v106[4 * (HIBYTE(v129) ^ 0xA4)] + (HIBYTE(v129) ^ 0x4EF8DA0B) - 1680530951 + (HIBYTE(v129) ^ 0x52)) ^ (((v145 - 1709458118 - ((2 * v145) & 0x34377A74)) ^ v144) + 1087401805);
  v147 = *(_DWORD *)&v115[4 * (v143 ^ 0xA5)] ^ *(_DWORD *)&v110[4 * (BYTE1(v139) ^ 0xFB)] ^ (v146 + 1094462400 - ((2 * v146) & 0x82785780));
  v148 = *(_DWORD *)&v106[4 * (HIBYTE(v140) ^ 8)] + (HIBYTE(v140) ^ 0x4EF8DAA7) - 1680530951 + (HIBYTE(v140) ^ 0xFE);
  v149 = (v148 - 1709458118 - ((2 * v148) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v139) ^ 0xA8)];
  v150 = *(_DWORD *)&v115[4 * (v129 ^ 0xB9)] ^ *(_DWORD *)&v110[4 * (BYTE1(v143) ^ 0x29)] ^ (v149 + 1094462400 - ((2 * v149) & 0x82785780));
  v151 = ((v129 >> 8) ^ 0xEF2D307A) + ((v129 >> 7) & 0xFF9F6E ^ 0xA59F0A) + 73;
  v152 = ((2 * v151) & 0xC6)
       + (((BYTE1(v129) ^ 0x7A) + ((v129 >> 7) & 0x6E ^ 0xA) + 73) ^ 0x57EFF963)
       - 1475344739;
  v153 = v152 - 112 * ((613566757 * (unint64_t)(v152 >> 4)) >> 32);
  v154 = *(_DWORD *)&v108[4 * (BYTE2(v143) ^ 0x78)];
  v155 = ((((v154 ^ 0x25342D88) + (v154 ^ 0x9A1BBD3A) + 1) ^ 0xFFFFFFFE) + (v154 ^ 0x9A1BBD3A)) ^ ((HIBYTE(v139) ^ 0x4EF8DABA)
                                                                                                 - 1680530951
                                                                                                 + (HIBYTE(v139) ^ 0xE3)
                                                                                                 + *(_DWORD *)&v106[4 * (HIBYTE(v139) ^ 0x15)]);
  v156 = *(_DWORD *)&v110[4 * ((v153 + (v151 - v153)) ^ 0xA0)] ^ *(_DWORD *)&v115[4
                                                                                                 * (v140 ^ 0xC4)] ^ (v155 + 1094462400 - ((2 * v155) & 0x82785780)) ^ 0x3A3EB03C;
  v157 = (HIBYTE(v143) ^ 0xEA) - 1680530951 + (HIBYTE(v143) ^ 0x4EF8DAB3) + *(_DWORD *)&v106[4 * (HIBYTE(v143) ^ 0x1C)];
  v158 = (v157 - 1709458117 + ~((2 * v157) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * ~HIWORD(v129)];
  v159 = *(_DWORD *)&v115[4 * (v139 ^ 0x72)] ^ (v158 + 1094462400 - ((2 * v158) & 0x82785780)) ^ *(_DWORD *)&v110[4 * (BYTE1(v140) ^ 0x31)];
  v160 = *(_DWORD *)&v106[4 * (HIBYTE(v147) ^ 0x57)] + (HIBYTE(v147) ^ 0xA1) - 1680530951 + (HIBYTE(v147) ^ 0x4EF8DAF8);
  v161 = v160 - 1709458118 - ((2 * v160) & 0x34377A74);
  v162 = v156 - ((2 * v156) & 0x49131E0C) - 1534488826;
  v163 = v161 ^ *(_DWORD *)&v108[4 * (BYTE2(v150) ^ 0x7D)];
  v164 = *(_DWORD *)&v115[4 * (v159 ^ 0x62)] ^ *(_DWORD *)&v110[4 * (BYTE1(v162) ^ 0xD8)] ^ (v163 + 1094462400 - ((2 * v163) & 0x82785780));
  v165 = (HIBYTE(v150) ^ 0x40) - 1680530951 + (HIBYTE(v150) ^ 0x4EF8DA19) + *(_DWORD *)&v106[4 * (HIBYTE(v150) ^ 0xB6)];
  v166 = (v165 - 1709458118 - ((2 * v165) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v162) ^ 0x5D)];
  v167 = *(_DWORD *)&v110[4 * (BYTE1(v159) ^ 0xB9)] ^ *(_DWORD *)&v115[4 * (v147 ^ 1)] ^ (v166 + 1094462400 - ((2 * v166) & 0x82785780));
  v168 = *(_DWORD *)&v106[4 * (HIBYTE(v162) ^ 0xA1)] + (HIBYTE(v162) ^ 0x4EF8DA0E) - 1680530951 + (HIBYTE(v162) ^ 0x57);
  v169 = (v168 - 1709458118 - ((2 * v168) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v159) ^ 0xAD)];
  v170 = (HIBYTE(v159) ^ 0x49) - 1680530951 + (HIBYTE(v159) ^ 0x4EF8DA10) + *(_DWORD *)&v106[4 * (HIBYTE(v159) ^ 0xBF)];
  v171 = (v170 - 1709458118 - ((2 * v170) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v147) ^ 0x2B)];
  v172 = (v171 + 1094462400 - ((2 * v171) & 0x82785780)) ^ *(_DWORD *)&v110[4 * (BYTE1(v150) ^ 0x6B)];
  HIDWORD(v174) = v172 ^ 0x6F4D;
  LODWORD(v174) = v172 ^ 0x40D00000;
  v173 = v174 >> 16;
  HIDWORD(v174) = v173 ^ 0xFDAA;
  LODWORD(v174) = v173 ^ 0xCC3D0000;
  v175 = *(_DWORD *)&v110[4 * (BYTE1(v147) ^ 0xA2)] ^ *(_DWORD *)&v115[4 * (v150 ^ 0xB5)] ^ (v169 + 1094462400 - ((2 * v169) & 0x82785780));
  v176 = (v174 >> 16) ^ *(_DWORD *)&v115[4 * (v162 ^ 0x68)];
  v177 = ((v175 & 0xFFFFFF7E ^ 0x72B88566)
        + (v175 & 0x5635D51C ^ 0x4055099)
        - ((v175 & 0xFFFFFF7E ^ 0x72B88566) & 0x5635D51C)) ^ 0x542545AD;
  LODWORD(v345) = ((2 * v177) & 0x409D4D98) - v177;
  v178 = (v164 ^ 0x382BF8BF) >> 16;
  v179 = (HIBYTE(v164) ^ 0x4EF8DA61) - 1680530951 + (HIBYTE(v164) ^ 0x38) + *(_DWORD *)&v106[4 * (HIBYTE(v164) ^ 0xCE)];
  v180 = (v179 - 1709458118 - ((2 * v179) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v167) ^ 0x4C)];
  v181 = (HIBYTE(v167) ^ 0x4EF8DA0B) - 1680530951 + (HIBYTE(v167) ^ 0x52) + *(_DWORD *)&v106[4 * (HIBYTE(v167) ^ 0xA4)];
  v182 = (v181 - 1709458118 - ((2 * v181) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v175) ^ 0x99)];
  v183 = *(_DWORD *)&v115[4 * (v176 ^ 0xB0)] ^ *(_DWORD *)&v110[4 * (BYTE1(v175) ^ 0xBB)] ^ 0x578A6298 ^ (v180 + 1094462400 - ((2 * v180) & 0x82785780));
  v184 = v183 - ((2 * v183) & 0x3927002E);
  v185 = *(_DWORD *)&v115[4 * (v164 ^ 0xD0)] ^ *(_DWORD *)&v110[4 * (BYTE1(v176) ^ 0xB9)] ^ (v182 + 1094462400 - ((2 * v182) & 0x82785780));
  v186 = (HIBYTE(v175) ^ 0xF1) - 1680530951 + (HIBYTE(v175) ^ 0x4EF8DAA8) + *(_DWORD *)&v106[4 * (HIBYTE(v175) ^ 7)];
  v187 = (v186 - 1709458118 - ((2 * v186) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v176) ^ 0xA1)];
  v188 = *(_DWORD *)&v115[4 * (v167 ^ 0xBD)] ^ *(_DWORD *)&v110[4 * (BYTE1(v164) ^ 0x58)] ^ (v187 + 1094462401 + ~((2 * v187) & 0x82785780));
  v189 = (HIBYTE(v176) ^ 0x4EF8DA76) - 1680530951 + (HIBYTE(v176) ^ 0x2F) + *(_DWORD *)&v106[4 * (HIBYTE(v176) ^ 0xD9)];
  v190 = *(_DWORD *)&v110[4 * (BYTE1(v167) ^ 0x2B)];
  HIDWORD(v174) = v190 ^ 0x2BC0;
  LODWORD(v174) = v190 ^ 0x413C0000;
  v191 = v174 >> 17;
  HIDWORD(v174) = v191 ^ 0xA4F;
  LODWORD(v174) = v191 ^ 0x6C9B8000;
  v192 = (v189 - 1709458118 - ((2 * v189) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (v178 ^ 0xF5)] ^ (v174 >> 15);
  v193 = v184 + 479428631;
  v194 = (v192 - 1215916684 - ((2 * v192) & 0x6F0D2AE8)) ^ *(_DWORD *)&v115[4 * (v175 ^ 0x7A)];
  v195 = ((2 * v194) & 0x29BEB484 ^ 0xD6DBEB7B) + (v194 ^ 0xF4922EDB);
  v196 = *(_DWORD *)&v106[4 * (((v184 + 479428631) >> 24) ^ 0xE5)]
       + (((v184 + 479428631) >> 24) ^ 0x4EF8DA4A)
       - 1680530951
       + (((v184 + 479428631) >> 24) ^ 0x13);
  v197 = (v196 - 1709458118 - ((2 * v196) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v185) ^ 0xE2)];
  v198 = v195 - ((2 * v195 + 700363910) & 0x284AB946) - 1459308826;
  v199 = *(_DWORD *)&v110[4 * (BYTE1(v188) ^ 0x9A)] ^ (v197 + 1094462400 - ((2 * v197) & 0x82785780)) ^ *(_DWORD *)&v115[4 * ((v195 - ((2 * v195 - 122) & 0x46) - 26) ^ 0xCC)];
  v200 = (HIBYTE(v185) ^ 0x20) - 1680530951 + (HIBYTE(v185) ^ 0x4EF8DA79) + *(_DWORD *)&v106[4 * (HIBYTE(v185) ^ 0xD6)];
  v201 = (v200 - 1709458117 + ~((2 * v200) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v188) ^ 0x94)];
  v202 = *(_DWORD *)&v115[4 * (v193 ^ 0xE5)] ^ (v201 + 1094462400 - ((2 * v201) & 0x82785780)) ^ *(_DWORD *)&v110[4 * (BYTE1(v198) ^ 0xFC)];
  v203 = (HIBYTE(v188) ^ 0x4EF8DAA2) - 1680530951 + (HIBYTE(v188) ^ 0xFB) + *(_DWORD *)&v106[4 * (HIBYTE(v188) ^ 0xD)];
  v204 = (v203 - 1709458118 - ((2 * v203) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v198) ^ 0x25)
                                                                          + 984
                                                                          + 4 * ((v198 >> 15) & 0x1EA ^ 0xFFFFFFB5)];
  v205 = *(_DWORD *)&v115[4 * (v185 ^ 0xF)] ^ *(_DWORD *)&v110[4 * (BYTE1(v193) ^ 0xE8)] ^ (v204 + 1094462400 - ((2 * v204) & 0x82785780));
  v206 = (BYTE2(v193) ^ 0xAD) + ((v193 >> 15) & 0x1EA ^ 0xFFFFFEB5);
  v207 = HIBYTE(v198);
  v208 = (HIBYTE(v198) ^ 0x4EF8DACD) + (HIBYTE(v198) ^ 0x94);
  v209 = (v208 - 1888202044 + ((2 * v208) & 0x188 ^ 0xE31F5BFF) + 1) ^ 0x8F7452C4;
  v210 = *(_DWORD *)&v106[4 * (v207 ^ 0x62)] - 1680530951;
  v211 = ((v209 ^ v210) + 2 * (v209 & v210) - 1709458118 - ((2 * ((v209 ^ v210) + 2 * (v209 & v210))) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * v206 + 984];
  v212 = *(_DWORD *)&v115[4 * (v188 ^ 0xAD)];
  v213 = (v211 + 1094462400 - ((2 * v211) & 0x82785780)) ^ *(_DWORD *)&v110[4 * (BYTE1(v185) ^ 0x39)];
  v214 = (v213 ^ 0xCD684A05) + (v212 ^ 0xB7869574);
  v215 = v214 - 2 * ((v213 ^ 0x4D684A05) & (v212 ^ 0x37869574));
  v216 = v215 + 924060952 - 2 * (v215 & 0x37140D19 ^ v214 & 1);
  v217 = ((2 * (HIBYTE(v205) ^ 0x65)) ^ 0xFF) + (HIBYTE(v205) ^ 0x65);
  v218 = (HIBYTE(v199) ^ 0x4EF8DA18) - 1680530951 + (HIBYTE(v199) ^ 0x41) + *(_DWORD *)&v106[4 * (HIBYTE(v199) ^ 0xB7)];
  v219 = (v218 - 1709458118 - ((2 * v218) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v202) ^ 0x3C)];
  v220 = *(_DWORD *)&v115[4 * (v216 ^ 0x1A)] ^ *(_DWORD *)&v110[4 * (BYTE1(v205) ^ 0xE8)] ^ (v219 + 1094462400 - ((2 * v219) & 0x82785780));
  v221 = (HIBYTE(v202) ^ 0x4EF8DA12) - 1680530951 + (HIBYTE(v202) ^ 0x4B) + *(_DWORD *)&v106[4 * (HIBYTE(v202) ^ 0xBD)];
  v222 = (v221 - 1709458118 - ((2 * v221) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v205) ^ 0x47)];
  v223 = (v217 ^ 0x77FD7FFE) + ((2 * v217) & 0x7FC) + 2;
  v224 = v223;
  v225 = v223 - 678693333 - ((2 * v223) & 0x56);
  v226 = *(_DWORD *)&v115[4 * (v199 ^ 0xBC)] ^ (v222 + 1094462400 - ((2 * v222) & 0x82785780)) ^ *(_DWORD *)&v110[4 * (BYTE1(v216) ^ 0xBA)];
  v227 = *(_DWORD *)&v106[4 * (v224 ^ 0xF6)] + (v225 ^ 0xD78BF62B) - 1680530951 + (v225 ^ 0x99732C72);
  v228 = (v227 - 1709458118 - ((2 * v227) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v216) ^ 0xF2)];
  v229 = *(_DWORD *)&v106[4 * (HIBYTE(v216) ^ 0x48)] + (HIBYTE(v216) ^ 0xBE) + (HIBYTE(v216) ^ 0x4EF8DAE7);
  v230 = *(_DWORD *)&v108[4 * (BYTE2(v199) ^ 0x31)];
  HIDWORD(v174) = v230 ^ 0x13A ^ (v229 - 340463623);
  LODWORD(v174) = (v229 - 1680530951) ^ v230 ^ 0x9A1BBC00;
  v231 = v174 >> 9;
  HIDWORD(v174) = v231 ^ 0x30E233;
  LODWORD(v174) = v231 ^ 0x9FFFFFFF;
  v232 = *(_DWORD *)&v115[4 * (v202 ^ 0x6B)] ^ *(_DWORD *)&v110[4 * (BYTE1(v199) ^ 0x4B)];
  v233 = *(_DWORD *)&v110[4 * (BYTE1(v202) ^ 0x6A)] ^ (v174 >> 23);
  HIDWORD(v174) = v233 ^ 0x69B7;
  LODWORD(v174) = v233 ^ 0xAD400000;
  v234 = v174 >> 21;
  v235 = v232 ^ (v228 - 1215916684 - ((2 * v228) & 0x6F0D2AE8));
  HIDWORD(v174) = v234 ^ 0x19B;
  LODWORD(v174) = v234 ^ 0x2036D000;
  v236 = (v174 >> 11) ^ *(_DWORD *)&v115[4 * (v205 ^ 0x1E)];
  v237 = (HIBYTE(v220) ^ 0x4EF8DAB0) - 1680530951 + (HIBYTE(v220) ^ 0xE9) + *(_DWORD *)&v106[4 * (HIBYTE(v220) ^ 0x1F)];
  v238 = (v237 - 1709458118 - ((2 * v237) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v226) ^ 0xB9)];
  v239 = *(_DWORD *)&v115[4 * (((v174 >> 11) ^ v115[4 * (v205 ^ 0x1E)]) ^ 0x7D)
                        + 448
                        + 4 * ((2 * v236) & 0xDE ^ 0xFFFFFF25)] ^ *(_DWORD *)&v110[4 * (BYTE1(v235) ^ 4)] ^ (v238 + 1094462401 + ~((2 * v238) & 0x82785780));
  v240 = (HIBYTE(v226) ^ 0x4EF8DAD1) - 1680530951 + (HIBYTE(v226) ^ 0x88) + *(_DWORD *)&v106[4 * (HIBYTE(v226) ^ 0x7E)];
  v241 = (v240 - 1709458118 - ((2 * v240) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v235) ^ 0xAB)];
  v242 = *(_DWORD *)&v115[4 * (v220 ^ 0x5E)] ^ (v241 + 1094462400 - ((2 * v241) & 0x82785780)) ^ *(_DWORD *)&v110[4 * (BYTE1(v236) ^ 0xE9)];
  v243 = *(_DWORD *)&v106[4 * (HIBYTE(v235) ^ 0x38)] + (HIBYTE(v235) ^ 0xCE) - 1680530951 + (HIBYTE(v235) ^ 0x4EF8DA97);
  v244 = *(_DWORD *)&v110[4 * (BYTE1(v220) ^ 0x38)];
  v245 = v244 & 0xFFFFFFFD ^ *(_DWORD *)&v115[4 * (v226 ^ 0xED)] ^ (v244 & 2 | 0x8DB82548) ^ (v243 - 1709458118 - ((2 * v243) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v236) ^ 0x2A)];
  v246 = *(_DWORD *)&v106[4 * (HIBYTE(v236) ^ 0xA9)] + (HIBYTE(v236) ^ 0x5F) - 1680530951 + (HIBYTE(v236) ^ 0x4EF8DA06);
  v247 = (v246 - 1709458118 - ((2 * v246) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v220) ^ 0x6A)];
  v248 = *(_DWORD *)&v115[4 * (v235 ^ 0x9F)] ^ *(_DWORD *)&v110[4 * (BYTE1(v226) ^ 0x4A)] ^ (v247 + 1094462400 - ((2 * v247) & 0x82785780));
  v249 = ((HIBYTE(v239) ^ 0xF4) + (HIBYTE(v239) ^ 0xDAAD) + *(_WORD *)&v106[4 * (HIBYTE(v239) ^ 2)] + 27129) & 0x400;
  v250 = (v249 & 0xFFFFF7FF | (((v249 >> 10) & 1) << 11)) ^ 0xED7CD7EF;
  v251 = *(_DWORD *)&v108[4 * (BYTE2(v242) ^ 0x9B)] ^ 0xDACBD277;
  v252 = ((v250 + 310585361) & v251) == 0;
  v253 = v250 + 398950366;
  v254 = -222220356 - v250;
  if (v252)
    v254 = v253;
  v255 = (v251 - 88365005 + v254) ^ ((HIBYTE(v239) ^ 0xF4)
                                   + (HIBYTE(v239) ^ 0x4EF8DAAD)
                                   + *(_DWORD *)&v106[4 * (HIBYTE(v239) ^ 2)]
                                   - 1680530951) & 0xFFFFFBFF;
  v256 = (HIBYTE(v242) ^ 0x4EF8DA0F) + (HIBYTE(v242) ^ 0x56);
  v257 = *(_DWORD *)&v115[4 * (v248 ^ 0xCB)] ^ *(_DWORD *)&v110[4 * (BYTE1(v245) ^ 0xEF)] ^ (v255 + 1094462401 + ~((2 * v255) & 0x82785780));
  v258 = *(_DWORD *)&v106[4 * (HIBYTE(v242) ^ 0xA0)] - 1680530951;
  v259 = (v256 + 1669519259 + ((2 * v256) & 0x336 ^ 0x7AFE5BFF) + 1) ^ 0x6382D79B;
  v260 = ((v259 ^ v258)
        + 2 * (v258 & v259)
        - 1709458118
        - 2 * (((v259 ^ v258) + 2 * (v258 & v259)) & 0x1A1BBD3B ^ (v259 ^ v258) & 1)) ^ *(_DWORD *)&v108[4 * (BYTE2(v245) ^ 0xE1)];
  v261 = (v260 + 1094462400 - ((2 * v260) & 0x82785780)) ^ *(_DWORD *)&v110[4 * (BYTE1(v248) ^ 0x33)];
  v262 = ((v261 ^ 0x40D06F4D) - 1917311672 + ((2 * v261) & 0x1B704A90 ^ 0xFEDFB56F) + 1) ^ *(_DWORD *)&v115[4 * (v239 ^ 0x55)];
  v263 = *(_DWORD *)&v108[4 * (BYTE2(v248) ^ 0x7C)];
  v264 = (((-2 * (((v263 ^ 0x65E442C5) + 1) & (v263 ^ 0x9A1BBD3A))) ^ ((v263 ^ 0x25342D88) + 1087401806)) + 1087401805) ^ ((HIBYTE(v245) ^ 0x88) - 1680530951 + (HIBYTE(v245) ^ 0x4EF8DAD1) + *(_DWORD *)&v106[4 * (HIBYTE(v245) ^ 0x7E)]);
  v265 = *(_DWORD *)&v115[4 * (v242 ^ 0x60)] ^ *(_DWORD *)&v110[4 * (BYTE1(v239) ^ 0x11)] ^ (v264 + 1094462400 - ((2 * v264) & 0x82785780));
  v266 = *(_DWORD *)&v106[4 * (HIBYTE(v248) ^ 0x79)] + (HIBYTE(v248) ^ 0x8F) - 1680530951 + (HIBYTE(v248) ^ 0x4EF8DAD6);
  v267 = (v266 - 1709458118 - ((2 * v266) & 0x34377A74)) ^ *(_DWORD *)&v108[4 * (BYTE2(v239) ^ 0xCD)];
  v268 = *(_DWORD *)&v110[4 * (BYTE1(v242) ^ 0x43)];
  v269 = v268 ^ 0xFE13BB72 ^ v267;
  v268 ^= 0x413C2BC0u;
  v270 = (v268 + v269 + 1) ^ ((v267 ^ 0xBF2F90B2) + 1);
  v271 = ((v267 ^ 0x7BACBDDF ^ (v270 - ((2 * v270) & 0x76F9A524) + 998036114)) + v268) ^ *(_DWORD *)&v115[4 * (v245 ^ 0x1B)];
  v272 = *(_DWORD *)(v25 - 128);
  v273 = (char *)*(&off_24DCDB210 + v272 - 375) - 4;
  v274 = *(_DWORD *)&v273[4 * (BYTE2(v262) ^ 0xF4)];
  HIDWORD(v275) = v274 ^ 0x66BA;
  LODWORD(v275) = v274 ^ 0xBDA60000;
  v276 = (v275 >> 15) - 1475425299 - ((2 * (v275 >> 15)) & 0x501D97DA);
  v277 = (char *)*(&off_24DCDB210 + SHIDWORD(v338)) - 12;
  v278 = *(_DWORD *)&v277[4 * (BYTE1(v265) ^ 0xD9)];
  v279 = (char *)*(&off_24DCDB210 + (int)v339) - 12;
  v280 = (((4 * v278) ^ 0x294FA2C4) * (v278 ^ 0xA53E8B1)) ^ *(_DWORD *)&v279[4 * (HIBYTE(v257) ^ 0x75)] ^ (((16 * v276) ^ (4 * v276) ^ 0x20D79164) + 569865064 - ((2 * ((16 * v276) ^ (4 * v276) ^ 0x20D79164)) & 0x43EEE6D0));
  v281 = (char *)*(&off_24DCDB210 + v272 - 351) - 4;
  v282 = (v280 + 1969509175 - ((2 * v280) & 0xEAC8A66E)) ^ *(_DWORD *)&v281[4 * (v271 ^ 0x69)];
  v283 = *(_DWORD *)&v273[4 * (BYTE2(v265) ^ 0xC6)];
  v284 = v276 ^ v278 ^ (v282 - 1475425299 - ((2 * v282) & 0x501D97DA));
  HIDWORD(v275) = v283 ^ 0x66BA;
  LODWORD(v275) = v283 ^ 0xBDA60000;
  v285 = (v275 >> 15) - ((2 * (v275 >> 15)) & 0x2D1B2D12) - 1769105783;
  v286 = (4 * v285) ^ 0x5A365A24;
  v287 = v286 + 1543861365 - 2 * (v286 & 0x5C05747C ^ (4 * v285) & 8);
  v288 = (-v286 & 4 ^ 0xDB3DFDFF) + 2 * (-v286 & 4);
  v290 = *(_DWORD *)&v279[4 * (HIBYTE(v262) ^ 0x84)] ^ 0x94588464 ^ v285;
  v252 = ((v288 + 616694273) & v290) == 0;
  v291 = v288 + 1040177912;
  v292 = -193210634 - v288;
  if (v252)
    v292 = v291;
  v293 = v287 & 0xFFFFFFF8 ^ (16 * v285) ^ 0x34DC1CE0 ^ (v290 - 423483639 + v292);
  v294 = *(_DWORD *)&v273[4 * (BYTE2(v271) ^ 0x55)];
  HIDWORD(v295) = v294 ^ 0x66BA;
  LODWORD(v295) = v294 ^ 0xBDA60000;
  v296 = (v295 >> 15) + 572966208 - ((2 * (v295 >> 15)) & 0x444D8A80);
  v289 = *(_DWORD *)&v277[4 * (BYTE1(v271) ^ 0xF2)];
  v297 = *(_DWORD *)&v281[4 * (v257 ^ 0x89)] ^ v289 ^ (((4 * v289) ^ 0x294FA2C4) * (v289 ^ 0xA53E8B1)) ^ (v293 + 1969509175 - ((2 * v293) & 0xEAC8A66E));
  v298 = *(_DWORD *)&v277[4 * (BYTE1(v257) ^ 0x7B)];
  HIDWORD(v295) = v298 ^ 0x46EA;
  LODWORD(v295) = v298 ^ 0xB29A0000;
  v299 = v295 >> 16;
  HIDWORD(v295) = v299 ^ 0xC03E;
  LODWORD(v295) = v299 ^ 0xD6760000;
  v300 = v295 >> 16;
  v302 = (v345 - 542025422) ^ 0x2F588229;
  if (((BYTE2(v257) ^ 0xE5) + 104) | BYTE2(v257) ^ 0xE5)
    v302 = v262 ^ 0x712DD5FA;
  v301 = (((4 * v300) ^ 0xE3DDE0B4) * (v300 ^ 0x38F7782D)) ^ *(_DWORD *)&v279[4 * (HIBYTE(v265) ^ 0x67)] ^ (((16 * v296) ^ (4 * v296) ^ 0xAAF74100) + 569865064 - 2 * (((16 * v296) ^ (4 * v296) ^ 0xAAF74100) & 0x21F77378 ^ ((16 * v296) ^ (4 * v296)) & 0x10));
  v303 = (v301 + 1969509175 - ((2 * v301) & 0xEAC8A66E)) ^ *(_DWORD *)&v281[4 * (v302 ^ 0x712DD583)];
  v304 = (v303 + 572966208 - ((2 * v303) & 0x444D8A80)) ^ v296;
  v305 = (v304 - ((2 * v304) & 0x72FFBA82) + 964681025) ^ v300;
  v306 = *(_DWORD *)&v273[4 * (BYTE2(v257) ^ 0x38)];
  HIDWORD(v307) = v306 ^ 0x66BA;
  LODWORD(v307) = v306 ^ 0xBDA60000;
  v308 = (v307 >> 15) + 162522927 - ((2 * (v307 >> 15)) & 0x135FCE5E);
  v309 = *(_DWORD *)&v277[4 * (BYTE1(v262) ^ 5)];
  v310 = (((4 * v309) ^ 0x294FA2C4) * (v309 ^ 0xA53E8B1)) ^ *(_DWORD *)&v279[4 * (HIBYTE(v271) ^ 0xC2)] ^ (((16 * v308) ^ (4 * v308) ^ 0xBC41EE4C) + 569865064 - ((2 * ((16 * v308) ^ (4 * v308) ^ 0xBC41EE4C)) & 0x43EEE6D0));
  v311 = (v310 + 1969509175 - ((2 * v310) & 0xEAC8A66E)) ^ *(_DWORD *)&v281[4 * (v265 ^ 0x7A)];
  HIDWORD(v307) = v305 ^ 0xFFFFFF03;
  LODWORD(v307) = v305 ^ 0x8758B800;
  v312 = v307 >> 11;
  HIDWORD(v307) = v312 ^ 0x41B1;
  LODWORD(v307) = v312 ^ 0xB6E00000;
  v313 = v308 ^ v309 ^ (v311 + 162522927 - ((2 * v311) & 0x135FCE5E));
  v314 = (v307 >> 21) - ((2 * (v307 >> 21)) & 0x35A39CCA) - 1697526171;
  v315 = ((2 * (BYTE2(v297) ^ 0xC006845E)) | 0x554C4B08) - (BYTE2(v297) ^ 0xC006845E) + 1431951996;
  v316 = (char *)*(&off_24DCDB210 + v272 - 398) - 8;
  v71[13] = v316[BYTE2(v313) ^ 0xB9] ^ ((BYTE2(v313) ^ 0xD6) - ((2 * (BYTE2(v313) ^ 0xD6)) & 0x84) + 66) ^ 7;
  v317 = ((v315 ^ 0x955F5EBA) + (((WORD1(v297) ^ 0x1F08) + (v315 ^ 0x6AA0A145) + 1) ^ 0xFFFFFF0F) + 106) ^ ((v315 ^ 0x955F5EBA) + 1);
  LOBYTE(v309) = v316[v315 ^ 0x6AA0A1BA];
  LOBYTE(v315) = (v317 - ((2 * v317) & 0x62) + 49) ^ v315 ^ 0x74;
  v71[5] = v309 ^ (v315 - ((2 * v315 - 48) & 0x84) - 86) ^ 0x18;
  v318 = (uint64_t)*(&off_24DCDB210 + (int)v338);
  v319 = *(unsigned __int8 *)(v318 + (BYTE1(v313) ^ 0x40));
  v320 = (v319 >> 6) ^ (v319 >> 2);
  v71[14] = v319 ^ 0x28 ^ v320;
  v321 = (char *)*(&off_24DCDB210 + SHIDWORD(a13)) - 4;
  v322 = v321[HIBYTE(v284) ^ 0xDBLL];
  *v71 = v322 ^ (((v322 >> 3) ^ (v322 >> 2) ^ 0x31)
               - 2 * (((v322 >> 3) ^ (v322 >> 2) ^ 0x31) & 0x2D ^ ((v322 >> 3) ^ (v322 >> 2)) & 4)
               - 87) ^ 0xEF;
  v323 = (char *)*(&off_24DCDB210 + v272 - 567) - 4;
  v324 = v323[v297 ^ 0x8FLL];
  LOBYTE(v303) = (v324 >> 4) ^ (v324 >> 2);
  v71[7] = v324 ^ 0x2D ^ ((v303 ^ 0xE) - 2 * (v303 & 1) - 127);
  v325 = v323[((v307 >> 21) - ((2 * (v307 >> 21)) & 0xCA) + 101) ^ 0xCFLL];
  v71[11] = v325 ^ 9 ^ (((v325 >> 4) ^ (v325 >> 2) ^ 0xE)
                      - 2 * (((v325 >> 4) ^ (v325 >> 2) ^ 0xE) & 0x35 ^ ((v325 >> 4) ^ (v325 >> 2)) & 1)
                      + 52);
  v71[9] = v316[BYTE2(v314) ^ 0x43] ^ ((BYTE2(v314) ^ 0x27) + (~(2 * (BYTE2(v314) ^ 0x27)) | 0x7B) + 67) ^ 0x82;
  v326 = ((v284 >> 15) & 0x1BA ^ 0xFFFFFE47) + (BYTE2(v284) ^ 0xDC);
  v327 = v326 + 1333839299 - ((2 * v326 + 444) & 0x9F018A78) + 87;
  v71[1] = ((v327 ^ 0x3C) - ((2 * v327) & 0x84) + 66) ^ 0x2D ^ v316[v327 ^ 0x4F80C5C3];
  v328 = v323[v284 ^ 0x38];
  v71[*(_QWORD *)(v25 - 184)] = v328 ^ 0x76 ^ (((v328 >> 4) ^ (v328 >> 2) ^ 0xE)
                                             - ((2 * ((v328 >> 4) ^ (v328 >> 2))) & 0x22)
                                             - 47);
  v329 = v321[BYTE3(v297) ^ 0xC5];
  LOBYTE(v303) = (v329 >> 3) ^ (v329 >> 2);
  v71[4] = v329 ^ 0x3D ^ ((v303 ^ 0x31) - 2 * ((v303 ^ 0x31) & 0x1F ^ v303 & 4) + 27);
  v330 = v321[HIBYTE(v314) ^ 0xCELL];
  v331 = (v330 >> 3) ^ (v330 >> 2) ^ 0x31;
  v71[*(_QWORD *)(v25 - 176)] = v330 ^ 0xA9 ^ (v331 - ((2 * v331) & 0x36) + 27);
  v332 = v323[v313 ^ 0x69];
  v71[*(_QWORD *)(v25 - 160)] = v332 ^ 0xF2 ^ (((v332 >> 4) ^ (v332 >> 2) ^ 0xE)
                                             - ((2 * ((v332 >> 4) ^ (v332 >> 2) ^ 0xE)) & 0xDD)
                                             - 82);
  v333 = *(unsigned __int8 *)(v318 + (BYTE1(v297) ^ 0xF2));
  v71[*(_QWORD *)(v25 - 152)] = ((2 * v320) ^ 0xB3)
                              + 2 * (v320 ^ 0x26)
                              + (v333 ^ (((v333 >> 6) ^ (v333 >> 2) ^ 0x26)
                                       - ((2 * ((v333 >> 6) ^ (v333 >> 2) ^ 0x26)) & 0xA)
                                       + 69) ^ 0xC)
                              + 1;
  v334 = *(unsigned __int8 *)(v318 + (BYTE1(v284) ^ 0x89));
  v335 = (v334 >> 6) ^ (v334 >> 2);
  v71[*(_QWORD *)(v25 - 136)] = v334 ^ ((v335 ^ 0x26) + ~(2 * ((v335 ^ 0x26) & 0xF7 ^ v335 & 1)) - 9) ^ 0x88;
  v336 = v321[BYTE3(v313) ^ 0x85];
  v71[*(_QWORD *)(v25 - 168)] = v336 ^ 0x6E ^ (((v336 >> 3) ^ (v336 >> 2) ^ 0x31)
                                             - ((2 * ((v336 >> 3) ^ (v336 >> 2) ^ 0x31)) & 0x74)
                                             - 6);
  LODWORD(v318) = *(unsigned __int8 *)(v318 + (BYTE1(v314) ^ 7));
  v71[*(_QWORD *)(v25 - 144)] = v318 ^ (((v318 >> 6) ^ (v318 >> 2) ^ 0x26)
                                      + (~(2 * ((v318 >> 6) ^ (v318 >> 2) ^ 0x26)) | 0xC7)
                                      - 35) ^ 0x3F;
  return ((uint64_t (*)(uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a22 + 8 * ((44 * (HIDWORD(v340) <= 0x10)) ^ (v272 - 133))) - 8))(0xFFFFFFFFLL, 0, (v335 ^ 0x26) & 0xFFFFFFF7, v297, (2 * v331) & 0x36, 49, v313, 194, a9, a10, a11, a12, a13, v338, v339, v340, v37, v341, v342,
           v343,
           a21,
           a22,
           a23,
           v345,
           5);
}

void sub_21A5AC234()
{
  JUMPOUT(0x21A5A9BB0);
}

uint64_t sub_21A5AC270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, int a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,int a25)
{
  uint64_t v25;

  return ((uint64_t (*)(void))(*(_QWORD *)(v25
                                        + 8
                                        * (a25 ^ (251
                                                * (((2 * (a14 - ((2 * a12) & 0x89F74CB6) + 1783898790)) & 0xEFF7EFBE ^ 0x89F74CB6)
                                                 + ((a14 - ((2 * a12) & 0x89F74CB6) + 1783898790) ^ 0xB3005184)
                                                 - 876651429 != 1136350266))))
                            - 8))();
}

uint64_t sub_21A5AC340(int a1)
{
  unsigned int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((a1 + v2 - 2013001695) > 7) | v1))
                            - ((v1 - 596) ^ 0x38E)
                            + 646))();
}

uint64_t sub_21A5AC3BC()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((((v1 & 0xFFFFFFF0) == (v0 | 0xC7) + 2013001241)
                                          * (((2 * (v0 | 0xC7)) ^ 0x204) + 251)) ^ (v0 | 0xC7)))
                            - 12))();
}

uint64_t sub_21A5AC404(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _BOOL4 v29;
  int v31;

  v17 = ((48 * (v13 ^ 0x183) - 1957959089) & 0x74B4168E ^ (a2 + 654)) + a1 + v14;
  v18 = v17 + a10 - 0x1749F021FF00FE37 + 1;
  v19 = (a1 + v14) & 0xF;
  v20 = v10 + v19 - v17;
  v21 = v19 + 1;
  v22 = v10 + v19 + 1;
  v23 = v19 + 2;
  v24 = v11 + v19 + 2 - v17;
  v25 = v19 + v11 + 3;
  v26 = v12 + v21 - v17;
  v27 = *(_QWORD *)(v16 - 120);
  v29 = v27 < v22 && v20 < v18;
  v31 = v27 < v25 && v24 < v18 || v29;
  if (v27 < v12 + v23 && v26 < v18)
    v31 = 1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v15 + 8 * ((77 * v31) ^ v13)) - 12))();
}

uint64_t sub_21A5AC4D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v5 + 8 * (v4 ^ (120 * (v3 > 0xF))))
                                                                    - ((57 * ((v4 + 483) ^ 0x39Eu)) ^ 0x2E9)))(a1, a2, a3, 0);
}

uint64_t sub_21A5AC514(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int8x16_t v28;
  uint64_t v29;
  int8x16_t v30;
  int8x16_t v31;
  int8x16x4_t v33;
  int8x16x4_t v34;

  *(_DWORD *)(v27 - 136) = a3 + 9;
  v33.val[1].i64[0] = ((_BYTE)a3 + 8) & 0xF;
  v33.val[1].i64[1] = ((_BYTE)a3 + 7) & 0xF;
  v33.val[2].i64[0] = ((_BYTE)a3 + 6) & 0xF;
  v33.val[2].i64[1] = ((_BYTE)a3 + 5) & 0xF;
  v33.val[3].i64[0] = ((_BYTE)a3 + 4) & 0xF;
  v33.val[3].i64[1] = ((_BYTE)a3 + 3) & 0xF;
  v28.i64[0] = 0x8181818181818181;
  v28.i64[1] = 0x8181818181818181;
  v29 = (a3 + v23);
  v33.val[0].i64[0] = ((_BYTE)a3 + (_BYTE)v23) & 0xF;
  v33.val[0].i64[1] = *(_DWORD *)(v27 - 136) & 0xF;
  v30.i64[0] = vqtbl4q_s8(v33, (int8x16_t)xmmword_21A5D5130).u64[0];
  v34.val[0].i64[1] = ((_BYTE)a3 + 1) & 0xF;
  v34.val[1].i64[1] = ((_BYTE)a3 - 1) & 0xF;
  v34.val[2].i64[1] = (a3 + 13) & 0xF;
  v34.val[3].i64[1] = ((_BYTE)a3 + 11) & 0xF;
  v34.val[0].i64[0] = ((_BYTE)a3 + 2) & 0xF;
  v34.val[1].i64[0] = a3 & 0xF;
  v34.val[2].i64[0] = ((_BYTE)a3 + 14) & 0xF;
  v34.val[3].i64[0] = (a3 + 12) & 0xF;
  v30.i64[1] = vqtbl4q_s8(v34, (int8x16_t)xmmword_21A5D5130).u64[0];
  v31 = vrev64q_s8(vmulq_s8(v30, v28));
  *(int8x16_t *)(*(_QWORD *)(v27 - 120) - 15 + v29) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v22 + (v29 & 0xF) - 15), *(int8x16_t *)(*(_QWORD *)(v27 - 120) - 15 + v29)), veorq_s8(*(int8x16_t *)((v29 & 0xF) + v24 - 13), *(int8x16_t *)((v29 & 0xF) + v25 - 14))), vextq_s8(v31, v31, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a22 + 8
                                              * ((485 * ((((a5 - 96) | 0x10) ^ 0x285) == (v26 & 0xFFFFFFF0))) ^ a5))
                            - 12))();
}

uint64_t sub_21A5AC684(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((((v5 ^ 0x325) - 383) * (v4 == a4)) ^ v5))
                            - (((v5 - 19) | 0xCu) ^ 0x282)))();
}

uint64_t sub_21A5AC6BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v6
                                                                                         + 8
                                                                                         * (v5 ^ (119 * ((v4 & 8) == 0))))
                                                                             - ((((v5 + 473125415) & 0xE3CCAFBB) - 261) ^ 0x282)))(a1, a2, a3, a4, (a3 - a4));
}

uint64_t sub_21A5AC704(int a1, int a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  char v31;
  char v32;
  unsigned int v33;
  int8x16x4_t v35;

  *(_DWORD *)(v28 - 128) = v27;
  *(_DWORD *)(v28 - 136) = v25;
  v29 = *(_QWORD *)(v28 - 120) - 7;
  *(_DWORD *)(v28 - 144) = v25 & 0xFFFFFFF8;
  v30 = a4 - (v25 & 0xFFFFFFF8) + 8;
  v31 = a8 + a1 + v26 - a4;
  v32 = a1 + v26 + a6 + a8 - a4;
  v33 = a1 + v26 + a2 - a4;
  v35.val[0].i64[0] = v33 & 0xF;
  v35.val[0].i64[1] = (v31 - 108) & 0xF;
  v35.val[1].i64[0] = v32 & 0xF;
  v35.val[1].i64[1] = (v31 - 110) & 0xF;
  v35.val[2].i64[0] = (v31 - 111) & 0xF;
  v35.val[2].i64[1] = (v31 - 112) & 0xF;
  v35.val[3].i64[0] = (v31 - 113) & 0xF;
  v35.val[3].i64[1] = (v31 - 114) & 0xF;
  *(int8x8_t *)(v29 + v33) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v22 + v35.val[0].i64[0] - 7), *(int8x8_t *)(v29 + v33)), veor_s8(*(int8x8_t *)(v35.val[0].i64[0] + v23 - 5), *(int8x8_t *)(v35.val[0].i64[0] + v24 - 6))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v35, (int8x16_t)xmmword_21A5D5140), (int8x8_t)0x8181818181818181)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a22 + 8 * ((1975 * (v30 == 0)) ^ a6)) - 12))((__n128)xmmword_21A5D5140);
}

void sub_21A5AC840()
{
  JUMPOUT(0x21A5AC774);
}

uint64_t sub_21A5AC848@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((((((a1 + 69) | 0x82) - 161) ^ ((a1 + 61) | 0x8A))
                                          * (*(_DWORD *)(v2 - 136) == *(_DWORD *)(v2 - 144))) ^ a1))
                            - 12))();
}

uint64_t sub_21A5AC894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = (a5 + v9);
  *(_BYTE *)(*(_QWORD *)(v13 - 120) + v14) ^= *(_BYTE *)(v8 + (v14 & 0xF)) ^ *(_BYTE *)((v14 & 0xF) + v10 + 2) ^ *(_BYTE *)((v14 & 0xF) + v11 + 1) ^ (-127 * (v14 & 0xF));
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * ((421 * (a5 - 1 != v7)) ^ (a7 + 22))) - 12))();
}

void sub_21A5AC8F8()
{
  int v0;
  int v1;
  uint64_t v2;

  if (v0 == 1508409496)
    v1 = 1412947868;
  else
    v1 = 1412905844;
  *(_DWORD *)(v2 + 24) = v1;
}

void sub_21A5AC95C(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 - 654962069 * (a1 ^ 0xEF500067);
  __asm { BR              X10 }
}

uint64_t sub_21A5AC9F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  unint64_t v14;

  v13 = 109 * (v12 ^ 0x311);
  v14 = ((unint64_t)&a10 ^ 0x3F3ECDF68FE6FEFDLL)
      - 0x11108060034023FDLL
      + (((_QWORD)&a10 << ((109 * (v12 ^ 0x11)) ^ 0xFAu)) & 0x7E7D9BED1FCDFDF0);
  *(_BYTE *)(v10 - 82 + (v13 - 418)) = (v14 ^ 0xBA) * (v14 + 17);
  *(_BYTE *)(v10 + 262) = ((v14 | 1) ^ 0xBA) * (v14 + 18);
  return (*(uint64_t (**)(void))(v11 + 8 * (v13 ^ 0x1ED)))();
}

void sub_21A5ACAC8()
{
  JUMPOUT(0x21A5ACA88);
}

uint64_t sub_21A5ACAD4()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  return v1(v0);
}

void sub_21A5ACAF4(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20) + 107940961 * (((a1 | 0x978BB8EF) - (a1 & 0x978BB8EF)) ^ 0xDB10F5A7);
  __asm { BR              X10 }
}

uint64_t sub_21A5ACBA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  _BOOL4 v3;

  v3 = (*(uint64_t (**)(uint64_t))(a1 + 8 * (v2 - 434)))(264) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (int)((v3
                                               * (((v2 - 1792899115) & 0x6ADD7797 ^ 0xFFFFFF6D)
                                                + ((v2 - 947000027) & 0x387212F9))) ^ v2))
                            - 8))();
}

uint64_t sub_21A5ACC18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  uint64_t v10;
  int v11;
  uint64_t v12;
  unint64_t v13;

  *(_QWORD *)a1 = 24064;
  strcpy((char *)(a1 + 8), "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
  v12 = (v11 - 677632542) & 0x2863D9FE;
  *(_BYTE *)(a1 + 45) = 0;
  *(_WORD *)(a1 + 46) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  strcpy((char *)(a1 + 64), "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
  *(_BYTE *)(a1 + 101) = 0;
  *(_WORD *)(a1 + 102) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  v13 = ((unint64_t)&a10 ^ 0x7F6DFCE4BFD3775ALL)
      - 0x396044008840215ALL
      + ((v12 - 0x124063680591338) & (2 * (_QWORD)&a10));
  *(_WORD *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 131) = 0;
  *(_BYTE *)(a1 + 259) = (v13 ^ 0xBA)
                       * (((unint64_t)&a10 ^ 0x7F6DFCE4BFD3775ALL)
                        - 90
                        + ((((v11 - 30) & 0xFE) - 56) & (2 * (_QWORD)&a10))
                        + 17);
  *(_BYTE *)(a1 + 258) = ((17 * ((v11 - 30) & 0xFE ^ 0xC1) + 1) ^ (v13 | 1))
                       * (((unint64_t)&a10 ^ 0x7F6DFCE4BFD3775ALL)
                        - 90
                        + ((((v11 - 30) & 0xFE) - 56) & (2 * (_QWORD)&a10))
                        + 18);
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * (v12 ^ 0x3EF)) - 4))();
}

void sub_21A5ACD28()
{
  JUMPOUT(0x21A5ACCD8);
}

uint64_t sub_21A5ACD34(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 0x404A582FA81B2FF2) = result + 0x1EE13A8875B3537ELL;
  *(_DWORD *)(v1 + 16) = 1412947868;
  return result;
}

void sub_21A5ACD80(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 40) + 1288161731 * ((a1 & 0x15BE8C08 | ~(a1 | 0x15BE8C08)) ^ 0x304B3201);
  __asm { BR              X10 }
}

uint64_t sub_21A5ACE38()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  _BOOL4 v3;

  v3 = (*(uint64_t (**)(uint64_t))(v1 + 8 * (v0 ^ 0x2A7)))(16) != 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((1623 * v3) ^ v0)) - 12))();
}

uint64_t sub_21A5ACE78(uint64_t a1)
{
  uint64_t v1;
  _BYTE *v2;
  int v3;
  uint64_t v4;
  _QWORD *v6;
  uint64_t result;
  _BYTE *v8;
  unsigned __int8 v9;
  _DWORD v10[2];
  unint64_t *v11;
  __int16 v12;

  v6 = *(_QWORD **)(v1 + 32);
  v12 = (-1287 * ((((2 * (unsigned __int16)v10) | 0x552) - (unsigned __int16)v10 - 681) ^ 0x789D)) ^ 0x447C;
  v10[1] = 369883897 * ((((2 * v10) | 0xE9240552) - v10 + 191757655) ^ 0xE8B9789D)
         + v3
         - 441;
  v11 = &STACK[0x30E6C4976802A8B2];
  result = (*(uint64_t (**)(_DWORD *))(v4 + 8 * (v3 ^ 0x34B)))(v10);
  v2[130] = v9 % 0xAu - ((2 * (v9 % 0xAu)) & 0x1C) + 14;
  *(_DWORD *)(a1 + 3) = 16868441;
  *(_BYTE *)(a1 + 2) = 76;
  *(_WORD *)a1 = 20550;
  *(_BYTE *)(a1 + 7) = 0;
  *(_DWORD *)(a1 + 8) = 0x4000000;
  *(_WORD *)(a1 + 12) = 2;
  *(_BYTE *)(a1 + 14) = v2[130] & 3 ^ 2;
  *(_BYTE *)(a1 + 15) = -69;
  v2[1] = 95;
  v2[131] = 0;
  *v6 = a1;
  v8 = *(_BYTE **)(v1 + 24);
  **(_DWORD **)(v1 + 16) = 16;
  *v8 = 1;
  *(_DWORD *)(v1 + 64) = 1412947868;
  return result;
}

void sub_21A5ACFDC(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 + 493691017 * (((a1 | 0x45F892E) - (a1 & 0x45F892E)) ^ 0x1776EE58);
  __asm { BR              X17 }
}

uint64_t sub_21A5AD134()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (v0 ^ (162 * (v1 != 0x78C2D791)))))(41464084);
}

uint64_t sub_21A5AD178(int a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  _BOOL4 v15;

  v11 = v7 > 0xFACEB7C0;
  *(_BYTE *)(*(_QWORD *)(v9 - 120) + (a1 - 41464084)) = *(_BYTE *)(v4 + ((a1 - 41464084) & 0xFLL)) ^ *(_BYTE *)(v1 + (a1 - 41464084)) ^ *(_BYTE *)(v3 + ((a1 - 41464084) & 0xFLL)) ^ *(_BYTE *)(((a1 - 41464084) & 0xFLL) + v5 + 4) ^ (-11 * ((a1 - 20) & 0xF));
  v12 = a1 + 45651756;
  v13 = (a1 + 1);
  v14 = v11 ^ (v12 < v6 + 508);
  v15 = v12 < v8;
  if (!v14)
    v11 = v15;
  return (*(uint64_t (**)(uint64_t))(v10 + 8 * ((v11 * ((v2 ^ 0x3CE) - 346)) ^ v2)))(v13);
}

uint64_t sub_21A5AD218(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((82
                                          * ((v4 ^ 0xA51B24CE ^ (8 * (((v3 ^ 0x630) + 537462778) & a3 ^ 0x1FE)))
                                           + ((2 * v4) & 0xBBB3E69E ^ 0xB181A602) == -572918961)) ^ v3 ^ 0x630))
                            - 12))();
}

uint64_t sub_21A5AD29C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * (a6 | ((v6 + 572918961) < 8) | (((v6 + 572918961) < 8) << 6)))
                            - ((a6 + 743) ^ 0x2A6u)
                            + 77))();
}

uint64_t sub_21A5AD2DC(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * ((974 * (((((a5 - 1290180698) & 0x4CE69AFF) - 775) & (v5 + a1)) == -572918960)) ^ a5))
                            - 4))();
}

uint64_t sub_21A5AD32C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _BOOL4 v24;

  v15 = a10 - 0xD92FECD24D1EDFELL + (v13 + a2);
  v16 = a4 - (a10 - 0xD92FECD24D1EDFELL) - 0x18733A5BCEE749D2;
  v17 = v13 & 0xF;
  v18 = v17 + v11 - v15;
  v19 = v17 + v10 - v15;
  v20 = (v17 | v12) - v15;
  v24 = v18 > 0xF
     && v16 >= (unint64_t)(3 * (a5 ^ 0x75u)) - 92
     && v19 > 0xF
     && v20 + ((a5 + 540055470) & 0xDFCF6AF7 ^ 0x2F3uLL) > 0xF;
  return ((uint64_t (*)(void))(*(_QWORD *)(v14 + 8 * ((793 * v24) ^ a5)) - 4))();
}

uint64_t sub_21A5AD3E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W7>, unsigned int a5@<W8>)
{
  uint64_t v5;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v5
                                                                                + 8
                                                                                * ((225
                                                                                  * (a5 < ((a4 + 432992913) & 0xE6310DE2 ^ 0xF0))) ^ a4))
                                                                    - 4))(a1, a2, a3, 0);
}

uint64_t sub_21A5AD428@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W7>, int a5@<W8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int8x16_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int8x16x4_t v27;
  int8x16x4_t v28;

  v27.val[1].i64[0] = ((_BYTE)a3 + 14) & 0xF;
  v27.val[1].i64[1] = ((_BYTE)a3 + 13) & 0xF;
  v27.val[2].i64[0] = ((_BYTE)a3 + 12) & 0xF;
  v27.val[2].i64[1] = ((_BYTE)a3 + 11) & 0xF;
  v27.val[3].i64[0] = ((_BYTE)a3 + 10) & 0xF;
  v27.val[3].i64[1] = ((_BYTE)a3 + 9) & 0xF;
  v23.i64[0] = 0xF5F5F5F5F5F5F5F5;
  v23.i64[1] = 0xF5F5F5F5F5F5F5F5;
  v27.val[0].i64[0] = ((_BYTE)v21 + (_BYTE)a1 + (_BYTE)a2) & 0xF;
  v27.val[0].i64[1] = ((_BYTE)a3 - 1) & 0xF;
  v24.i64[0] = vqtbl4q_s8(v27, (int8x16_t)xmmword_21A5D5130).u64[0];
  v28.val[0].i64[1] = ((_BYTE)a3 + 7) & 0xF;
  v28.val[1].i64[1] = ((_BYTE)a3 + 5) & 0xF;
  v28.val[2].i64[1] = (a3 + 3) & 0xF;
  v28.val[3].i64[1] = ((_BYTE)a3 + 1) & 0xF;
  v28.val[0].i64[0] = ((_BYTE)a3 + 8) & 0xF;
  v28.val[1].i64[0] = ((_BYTE)a3 + 6) & 0xF;
  v28.val[2].i64[0] = (a3 + 4) & 0xF;
  v28.val[3].i64[0] = ((_BYTE)a3 + 2) & 0xF;
  v24.i64[1] = vqtbl4q_s8(v28, (int8x16_t)xmmword_21A5D5130).u64[0];
  v25 = vrev64q_s8(vmulq_s8(v24, v23));
  *(int8x16_t *)(*(_QWORD *)(v22 - 120) - 15 + (v21 + a1 + a2)) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v19 + v27.val[0].i64[0] - 15), *(int8x16_t *)(v17 - 15 + (v21 + a1 + a2))), veorq_s8(*(int8x16_t *)(v18 + v27.val[0].i64[0] - 15), *(int8x16_t *)(v27.val[0].i64[0] + v20 - 11))), vextq_s8(v25, v25, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a17 + 8 * ((55 * ((a5 & 0xFFFFFFF0) == 16)) ^ (a4 + 216)))
                            - ((a4 + 564) | 8u)
                            + 668))();
}

void sub_21A5AD590()
{
  JUMPOUT(0x21A5AD510);
}

uint64_t sub_21A5AD59C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * (int)((((9 * (v5 ^ 0x2A1)) ^ (v5 + 1225453908) & 0xB6F50DFF ^ 0x1AB)
                                               * (v4 == a4)) | v5))
                            - 4))();
}

uint64_t sub_21A5AD5EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  char v8;
  uint64_t v9;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v9 + 8 * ((220 * ((((v8 & 8) == a8 - 81) ^ (a8 + 20)) & 1)) ^ a8))
                                                                                              - 4))(a1, a2, a3, a4, a5, (a3 - a4), (a8 + 532) | 0x92u);
}

uint64_t sub_21A5AD634@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W3>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  unsigned int v24;
  char v25;
  char v26;
  unsigned int v27;
  int8x16x4_t v29;

  *(_DWORD *)(v23 - 144) = a4;
  *(_QWORD *)(v23 - 128) = v16 - 7;
  *(_QWORD *)(v23 - 136) = *(_QWORD *)(v23 - 120) - 7;
  *(_DWORD *)(v23 - 152) = a4 & 0xFFFFFFF8;
  v24 = a3 - (a4 & 0xFFFFFFF8) + 8;
  v25 = v17 + v22 + a1 - a3;
  v26 = v22 + a1 + v21 + v17 - a3;
  v27 = v22 + a1 + a2 - a3;
  *(_DWORD *)(v23 - 160) = v21 - 143;
  v29.val[0].i64[0] = v27 & 0xF;
  v29.val[0].i64[1] = (v25 - 29) & 0xF;
  v29.val[1].i64[0] = (v25 - 30) & 0xF;
  v29.val[1].i64[1] = (v25 - 31) & 0xF;
  v29.val[2].i64[0] = v26 & 0xF;
  v29.val[2].i64[1] = (v25 - 33) & 0xF;
  v29.val[3].i64[0] = (v25 - 34) & 0xF;
  v29.val[3].i64[1] = (v25 - 35) & 0xF;
  *(int8x8_t *)(*(_QWORD *)(v23 - 136) + v27) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v19 + v29.val[0].i64[0] - 7), *(int8x8_t *)(*(_QWORD *)(v23 - 128) + v27)), veor_s8(*(int8x8_t *)(v18 + v29.val[0].i64[0] - 7), *(int8x8_t *)(v29.val[0].i64[0] + v20 - 3))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v29, (int8x16_t)xmmword_21A5D5140), (int8x8_t)0xF5F5F5F5F5F5F5F5)));
  return (*(uint64_t (**)(__n128))(a16 + 8 * ((7 * (v24 == 0)) ^ v21)))((__n128)xmmword_21A5D5140);
}

void sub_21A5AD784()
{
  JUMPOUT(0x21A5AD6B8);
}

uint64_t sub_21A5AD78C()
{
  uint64_t v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (*(_DWORD *)(v0 - 160) ^ (767
                                                                  * (*(_DWORD *)(v0 - 144) == *(_DWORD *)(v0 - 152)))))
                            - (((*(_DWORD *)(v0 - 160) ^ 0x1ADu) + 251) ^ 0x2F3)))();
}

uint64_t sub_21A5AD7D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = (a6 - 1435009360);
  *(_BYTE *)(*(_QWORD *)(v12 - 120) + v14) = *(_BYTE *)(v9 + (v14 & 0xF)) ^ *(_BYTE *)(v7 + v14) ^ *(_BYTE *)(v8 + (v14 & 0xF)) ^ *(_BYTE *)((v14 & 0xF) + v10 + 4) ^ (-11 * (v14 & 0xF));
  return (*(uint64_t (**)(void))(v13 + 8 * (((a6 - 1 != v11) * (((a7 - 587) | 0x150) ^ 0x1F9)) | (a7 - 197))))();
}

uint64_t sub_21A5AD848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;

  v14 = vrev64q_s8(*(int8x16_t *)*(_QWORD *)(v11 + 24));
  v15 = vextq_s8(v14, v14, 8uLL);
  v16.i64[0] = 0x8787878787878787;
  v16.i64[1] = 0x8787878787878787;
  v17.i64[0] = 0x7878787878787878;
  v17.i64[1] = 0x7878787878787878;
  v18 = vaddq_s8(vorrq_s8(v15, v16), vorrq_s8(v15, v17));
  v16.i64[0] = 0xF5F5F5F5F5F5F5F5;
  v16.i64[1] = 0xF5F5F5F5F5F5F5F5;
  v19 = vrev64q_s8(veorq_s8(vaddq_s8(v18, v16), (int8x16_t)xmmword_21A5D51A0));
  *(int8x16_t *)(v12 - 112) = vextq_s8(v19, v19, 8uLL);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 + 8 * (int)(a5 ^ (1009 * (*(_QWORD *)(v12 - 120) != 0)))) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

uint64_t sub_21A5AD8CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13)
{
  int v13;
  uint64_t v14;
  int v15;
  _BOOL4 v17;

  v15 = (a13 & 0x4FF7FDA6) + (v13 ^ 0x27FBFED3);
  v17 = (((_BYTE)v15 + 13) & 0xF) == 0 && v15 != (((_DWORD)a5 - 1279568637) & 0x4C44A97D ^ 0x27FBFEAE);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 + 8 * (int)((911 * v17) ^ a5)) - (((_DWORD)a5 - 1279568637) ^ 0xB3BB56BE) + 57))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

uint64_t sub_21A5AD94C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  unsigned int v27;
  char *v28;
  char *v29;
  char *v30;
  int v31;
  int v32;
  int v33;
  int v34;
  unsigned int v35;
  int v36;
  unsigned __int8 v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  unsigned int v41;
  unint64_t v42;
  int v43;
  unsigned int v44;
  int v45;
  unsigned __int8 *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  int v52;
  int v53;
  int v54;
  unsigned int v55;
  int v56;
  unsigned int v57;
  char *v58;
  char *v59;
  int v60;
  char *v61;
  char *v62;
  int v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  int v67;
  unsigned int v68;
  unsigned int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  unsigned int v74;
  unsigned int v75;
  int v76;
  int v77;
  unsigned int v78;
  unsigned int v79;
  int v80;
  int v81;
  BOOL v82;
  int v83;
  unsigned int v84;
  int v85;
  int v86;
  int v87;
  unsigned int v88;
  int v89;
  unsigned int v90;
  int v91;
  unsigned int v92;
  unsigned int v93;
  int v94;
  int v95;
  int v96;
  unsigned int v97;
  unsigned int v98;
  int v99;
  int v100;
  unsigned int v101;
  int v102;
  int v103;
  unsigned int v104;
  unsigned int v105;
  unsigned int v106;
  unsigned int v107;
  unsigned int v108;
  int v109;
  unsigned int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  unsigned int v117;
  int v118;
  unsigned int v119;
  unsigned int v120;
  int v121;
  unsigned int v122;
  int v123;
  unint64_t v124;
  int v125;
  int v126;
  int v127;
  int v128;
  unsigned int v129;
  unsigned int v130;
  unsigned int v131;
  unsigned int v132;
  unsigned int v133;
  int v134;
  int v135;
  unsigned int v136;
  unsigned int v137;
  int v138;
  unsigned int v139;
  unsigned int v140;
  unsigned int v141;
  unsigned int v142;
  int v143;
  unsigned int v144;
  int v145;
  int v146;
  unsigned int v147;
  int v148;
  unsigned int v149;
  unsigned int v150;
  int v151;
  int v152;
  unsigned int v153;
  int v154;
  unsigned int v155;
  unsigned int v156;
  int v157;
  unsigned int v158;
  int v159;
  unsigned int v160;
  unsigned int v161;
  unsigned int v162;
  int v163;
  int v164;
  int v165;
  unsigned int v166;
  int v167;
  unsigned int v168;
  int v169;
  int v170;
  unsigned int v171;
  unsigned int v172;
  unsigned int v173;
  unsigned int v174;
  int v175;
  int v176;
  int v177;
  unsigned int v178;
  unsigned int v179;
  int v180;
  int v181;
  unsigned int v182;
  unsigned int v183;
  unsigned int v184;
  unsigned int v185;
  unsigned int v186;
  int v187;
  int v188;
  int v189;
  unsigned int v190;
  unsigned int v191;
  int v192;
  unsigned int v193;
  unsigned int v194;
  int v195;
  int v196;
  unsigned int v197;
  unsigned int v198;
  unsigned int v199;
  unsigned int v200;
  unsigned int v201;
  unsigned int v202;
  int v203;
  int v204;
  int v205;
  int v206;
  int v207;
  unsigned int v208;
  unsigned int v209;
  int v210;
  int v211;
  unsigned int v212;
  unsigned int v213;
  unsigned int v214;
  int v215;
  int v216;
  int v217;
  unint64_t v218;
  int v219;
  unsigned int v220;
  int v221;
  int v222;
  unsigned int v223;
  int v224;
  unsigned int v225;
  unsigned int v226;
  unsigned int v227;
  unsigned int v228;
  unsigned int v229;
  int v230;
  int v231;
  unsigned int v232;
  int v233;
  unsigned int v234;
  unsigned int v235;
  unsigned int v236;
  int v237;
  int v238;
  unsigned int v239;
  int v240;
  unsigned int v241;
  unsigned int v242;
  int v243;
  int v244;
  unsigned int v245;
  int v246;
  int v247;
  unsigned int v248;
  int v249;
  unsigned int v250;
  int v251;
  int v252;
  int v253;
  unsigned int v254;
  unsigned int v255;
  unsigned int v256;
  unsigned int v257;
  int v258;
  int v259;
  int v260;
  unsigned int v261;
  unsigned int v262;
  int v263;
  int v264;
  unsigned int v265;
  int v266;
  unsigned int v267;
  int v268;
  unsigned int v269;
  unsigned int v270;
  int v271;
  unsigned int v272;
  unsigned int v273;
  unsigned int v274;
  int v275;
  unsigned int v276;
  unsigned int v277;
  unsigned int v278;
  int v279;
  _BYTE *v280;
  unsigned int v281;
  unsigned int v282;
  unsigned int v283;
  unsigned int v284;
  unsigned int v285;
  char *v286;
  unsigned int v287;
  int v288;
  int v289;
  uint64_t v290;
  int v291;
  int v292;
  uint64_t v293;
  int v294;
  int v295;
  int v296;
  int v297;
  int v298;
  int v299;
  int v300;
  int v301;
  char *v302;
  int v303;
  int v304;
  int v305;
  int v306;
  char *v307;
  int v308;
  char *v309;
  int v310;
  int v311;
  int v312;
  unsigned int v313;
  char *v314;
  int v315;
  int v316;
  unsigned int v317;
  uint64_t v318;
  char *v319;
  uint64_t v321;
  char *v322;
  char *v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;

  v23 = 254 * (v21 ^ 0x7F);
  v24 = *(unsigned __int8 *)(v22 - 101);
  v25 = *(unsigned __int8 *)(v22 - 100);
  v26 = v25 ^ 0xFFFFFFA9 ^ v23;
  v27 = ((2 * (v26 - 29)) & 0xFFFFFFB8) + ((v26 - 29) ^ 0xFFFFFFDC);
  v28 = (char *)*(&off_24DCDB210 + (v21 ^ 0x3Au)) - 4;
  LODWORD(v25) = ((v28[v25 ^ 0xF8] + v26 + v27 - 2 * v27 - 47) ^ 0x89) << 24;
  v29 = (char *)*(&off_24DCDB210 + v21 + 206) - 8;
  v30 = (char *)*(&off_24DCDB210 + v21 + 109) - 4;
  v31 = v30[*(unsigned __int8 *)(v22 - 106) ^ 0xD7];
  LOBYTE(v26) = ((2 * v24) & 0x2A ^ 0xA) + (v24 ^ 0x30);
  v32 = (v26 - ((2 * v26) & 0x74) + 58) ^ v29[v24 ^ 0xD];
  LODWORD(v24) = (((*(_BYTE *)(v22 - 105) ^ 0xFA)
                                  - ((2 * (*(_BYTE *)(v22 - 105) ^ 0xFA) + 42) & 0x74)
                                  - 49) ^ v29[*(unsigned __int8 *)(v22 - 105) ^ 0x52]) & 0xFFFF00FF | ((v31 ^ 0x9C ^ (((~v31 >> 4) & 6) - ((~v31 >> 3) & 8) - 3)) << 8);
  v33 = ((*(_BYTE *)(v22 - 97) ^ 0xCC) - ((2 * (*(_BYTE *)(v22 - 97) ^ 0xCC) + 42) & 0x74) - 49) ^ v29[*(unsigned __int8 *)(v22 - 97) ^ 0x64];
  v34 = v28[*(unsigned __int8 *)(v22 - 112) ^ 0xE6];
  v35 = v34 - ((2 * v34 + 36) & 0xFFFFFFD4);
  v36 = v30[*(unsigned __int8 *)(v22 - 110) ^ 0xEBLL];
  v37 = v36 ^ 0x9E ^ (((~v36 >> 4) & 6) - ((~v36 >> 3) & 8) - 3);
  v38 = *(unsigned __int8 *)(v22 - 109);
  v39 = (uint64_t)*(&off_24DCDB210 + (v21 ^ 0xB6u));
  v40 = *(unsigned __int8 *)(v39 + (*(unsigned __int8 *)(v22 - 99) ^ 0x59)) ^ ((*(_BYTE *)(v22 - 99) ^ 0x75)
                                                                                                - ((2 * (*(_BYTE *)(v22 - 99) ^ 0x75)
                                                                                                  + 46) & 0x87)
                                                                                                - 38) ^ 0x6A;
  v322 = v29;
  v41 = (v25 | (v40 << 16) | v33) - 2 * ((v25 | (v40 << 16) | v33) & 0x5E48001D ^ v33 & 8) - 565655531;
  v323 = v28;
  LODWORD(v25) = v24 | (((v28[*(unsigned __int8 *)(v22 - 108) ^ 0x59] + 18) ^ 0x31) << 24) | ((*(unsigned __int8 *)(v39 + (*(unsigned __int8 *)(v22 - 107) ^ 0x66)) ^ ((*(_BYTE *)(v22 - 107) ^ 0x4A) - ((2 * (*(_BYTE *)(v22 - 107) ^ 0x4A) + 46) & 0x87) - 38) ^ 0xBD) << 16);
  v35 += 124;
  HIDWORD(v42) = (v35 >> 6) ^ 1;
  LODWORD(v42) = (v37 << 10) | (4
                              * (((v38 ^ 0xC6) + (~(2 * (v38 ^ 0xC6) + 42) | 0x8B) - 48) ^ v29[v38 ^ 0x6E])) | ((v35 ^ 0x34) << 26) | ((*(unsigned __int8 *)(v39 + (*(unsigned __int8 *)(v22 - 111) ^ 0x17)) ^ ((*(_BYTE *)(v22 - 111) ^ 0x3B) - ((2 * (*(_BYTE *)(v22 - 111) ^ 0x3B) + 46) & 0x87) - 38) ^ 0x18) << 18);
  LODWORD(v24) = v42 >> 2;
  v43 = v30[*(unsigned __int8 *)(v22 - 102) ^ 0xD4];
  HIDWORD(v42) = (v41 >> 18) ^ 0x379D;
  LODWORD(v42) = ((v41 << 14) ^ 0x32054000 | ((v30[*(unsigned __int8 *)(v22 - 98) ^ 0x1ALL] ^ 0x86 ^ (((~v30[*(unsigned __int8 *)(v22 - 98) ^ 0x1ALL] >> 4) & 6) - ((~v30[*(unsigned __int8 *)(v22 - 98) ^ 0x1ALL] >> 3) & 8) - 3)) << 22)) ^ 0x38720000;
  v321 = v39;
  v44 = (v32 & 0xFFFF00FF | (((v28[*(unsigned __int8 *)(v22 - 104) ^ 0xAFLL] + 18) ^ 0x68) << 24) | ((v43 ^ 0xB6 ^ (((~v43 >> 4) & 6) - ((~v43 >> 3) & 8) - 3)) << 8) | ((*(unsigned __int8 *)(v39 + (*(unsigned __int8 *)(v22 - 103) ^ 0x9BLL)) ^ ((*(_BYTE *)(v22 - 103) ^ 0xB7) - ((2 * (*(_BYTE *)(v22 - 103) ^ 0xB7) + 46) & 0x87) - 38) ^ 0x41) << 16)) ^ 0x4BD6E33F;
  v45 = v25 ^ 0xC90F14AA;
  LODWORD(v29) = v24 ^ 0x1B89D0C8;
  HIDWORD(a13) = v20 - 670826195;
  v46 = *(unsigned __int8 **)(v22 - 120);
  HIDWORD(a18) = 0;
  v324 = 5 * (v23 ^ 0x1F1u);
  LODWORD(v325) = (v324 - 44) | 0x68;
  v47 = ((_DWORD)v325 - 129) & 0x99420DAF ^ 0x99420DAF;
  *(_QWORD *)(v22 - 136) = 6;
  *(_QWORD *)(v22 - 128) = v47;
  v48 = v46[6];
  v49 = v46[v47];
  *(_QWORD *)(v22 - 184) = 4;
  v50 = v30[v48 ^ 0xD2];
  LODWORD(v48) = ((v49 ^ 0x3E) - ((2 * (v49 ^ 0x3E) + 42) & 0x74) - 49) ^ v322[v49 ^ 0x96];
  LODWORD(v24) = ((v28[v46[4] ^ 0xD6] + 18) ^ 0xB3) << 24;
  *(_QWORD *)(v22 - 160) = 15;
  *(_QWORD *)(v22 - 152) = 14;
  LODWORD(v47) = v30[v46[14] ^ 0x4CLL];
  LODWORD(v49) = ((v46[15] ^ 0x64) - ((2 * (v46[15] ^ 0x64) + 42) & 0x74) - 49) ^ v322[v46[15] ^ 0xCCLL];
  *(_QWORD *)(v22 - 144) = 1;
  LODWORD(v49) = v49 & 0xFFFF00FF | ((v47 ^ 0x43 ^ (((~(_DWORD)v47 >> 4) & 6)
                                                                                    - ((~(_DWORD)v47 >> 3) & 8)
                                                                                    - 3)) << 8) | (((v28[v46[12] ^ 0x53] + 18) ^ 0xC9) << 24);
  v51 = v46[13];
  LODWORD(v48) = v48 | ((*(unsigned __int8 *)(v39 + (v46[1] ^ 0xD0)) ^ 0xF2 ^ ((v46[1] ^ 0xFC)
                                                                                                - ((2 * (v46[1] ^ 0xFC)
                                                                                                  + 46) & 0x87)
                                                                                                - 38)) << 16);
  *(_QWORD *)(v22 - 176) = 10;
  LODWORD(v47) = v30[v46[10] ^ 0x88];
  v52 = v49 | ((*(unsigned __int8 *)(v39 + (v51 ^ 0xAA)) ^ 0x1B ^ ((v51 ^ 0x86)
                                                                                  - ((2 * (v51 ^ 0x86) + 46) & 0x87)
                                                                                  - 38)) << 16);
  *(_QWORD *)(v22 - 168) = 5;
  LODWORD(v49) = v24 & 0xFFFF00FF | (((v50 ^ (((~v50 >> 4) & 6)
                                                             - ((~v50 >> 3) & 8)
                                                             - 3)) ^ 0x78) << 8) | ((*(unsigned __int8 *)(v39 + (v46[5] ^ 0x49)) ^ 0xBB ^ ((v46[5] ^ 0x65) - ((2 * (v46[5] ^ 0x65) + 46) & 0x87) - 38)) << 16) | ((v46[7] ^ 0x97) - ((2 * (v46[7] ^ 0x97) + 42) & 0x74) - 49) ^ v322[v46[7] ^ 0x3FLL];
  v53 = (((v47 ^ 0x5F ^ (((~(_DWORD)v47 >> 4) & 6)
                                                         - ((~(_DWORD)v47 >> 3) & 8)
                                                         - 3)) << 8) | ((*(unsigned __int8 *)(v39 + (v46[9] ^ 0x28)) ^ 0xCF ^ ((v46[9] ^ 4) - ((2 * (v46[9] ^ 4) + 46) & 0x87) - 38)) << 16) | v322[v46[11] ^ 0xD3] ^ 0x3A) ^ ((v46[11] ^ 0x7B) - 107) | (((v28[v46[8] ^ 0xACLL] + 18) ^ 0xDE) << 24);
  LODWORD(v47) = v30[v46[2] ^ 0x76];
  v54 = v48 | (((v28[*v46 ^ 0x9DLL] + 18) ^ 0x7E) << 24);
  v55 = v52 ^ (v42 >> 14) ^ 0x224CC89;
  LODWORD(v51) = v47 ^ 0x8F ^ (((~(_DWORD)v47 >> 4) & 6) - ((~(_DWORD)v47 >> 3) & 8) - 3);
  v56 = (v47 ^ 0x8F ^ (((~(_DWORD)v47 >> 4) & 6)
                                                       - ((~(_DWORD)v47 >> 3) & 8)
                                                       - 3)) << 8;
  LODWORD(v48) = v49 ^ v45;
  LOBYTE(v47) = v54 ^ v29;
  LODWORD(v39) = (v56 - (((_DWORD)v51 << 9) & 0x11A00) - 572682807) ^ v54 ^ v29;
  v57 = v53 ^ v44;
  v58 = (char *)*(&off_24DCDB210 + v23 - 341) - 4;
  LODWORD(v49) = *(_DWORD *)&v58[4 * (BYTE3(v39) ^ 0xA1)];
  LODWORD(v49) = v49 - ((2 * v49 + 623977010) & 0x3DB38C92) + 292706146;
  v59 = (char *)*(&off_24DCDB210 + v23 - 303) - 12;
  LODWORD(v51) = *(_DWORD *)&v59[4 * (BYTE2(v48) ^ 0x97)];
  LODWORD(v51) = v51 - ((2 * v51 - 409066110) & 0x97E6933C) + 1069702239;
  v60 = *(_DWORD *)&v58[4 * (BYTE3(v48) ^ 0xA4)];
  HIDWORD(v329) = v23;
  v61 = (char *)*(&off_24DCDB210 + (v23 ^ 0xFD)) - 4;
  v62 = (char *)*(&off_24DCDB210 + (v23 ^ 0x1D8)) - 12;
  v63 = *(_DWORD *)&v62[4 * (BYTE1(v57) ^ 0xDD)] ^ ((v55 ^ 0xFEDA595D)
                                                  - 53188777
                                                  + *(_DWORD *)&v61[4 * (v55 ^ 0xEE)]) ^ (((2 * v49) & 0xF22F36EA ^ (1749167632 * (v51 ^ 0xCBF3499E)) ^ 0x30230482) - 2094002547 - 2 * (((2 * v49) & 0xF22F36EA ^ (1749167632 * (v51 ^ 0xCBF3499E)) ^ 0x30230482) & 0x3300E98 ^ (1749167632 * (v51 ^ 0xCBF3499E)) & 0x10));
  v64 = v51 ^ v49 ^ (v63 - 873248354 - ((2 * v63) & 0x97E6933C));
  LODWORD(v49) = *(_DWORD *)&v59[4 * (BYTE2(v57) ^ 0x9F)];
  v65 = v60 - ((2 * v60 - 449764814) & 0xE285977C) - 472163113;
  LODWORD(v49) = v49 - ((2 * v49 - 409066110) & 0xDFBD8948) - 475146395;
  LODWORD(v51) = (2 * v65) & 0xF22F36EA ^ 0xE2051668 ^ (1749167632 * (v49 ^ 0x6FDEC4A4));
  LODWORD(v47) = (*(_DWORD *)&v61[4 * (v47 ^ 0xFC)] + (v39 ^ 0xFEDA5986) - 53188777) ^ *(_DWORD *)&v62[4 * (BYTE1(v55) ^ 0xC2)] ^ (v51 - 2094002547 - 2 * (v51 & 0x3300E8A ^ (2 * v65) & 2));
  v66 = v49 ^ v65 ^ (v47 + 1876870308 - ((2 * v47) & 0xDFBD8948));
  LODWORD(v49) = *(_DWORD *)&v58[4 * (HIBYTE(v57) ^ 0x63)];
  LODWORD(v47) = *(_DWORD *)&v59[4 * (BYTE2(v55) ^ 0xB0)];
  LODWORD(v49) = v49 - ((2 * v49 - 449764814) & 0x94509040) + 1019271481;
  LODWORD(v47) = v47 - ((2 * v47 - 409066110) & 0xDD4B70B8) + 1651821341;
  v67 = (1749167632 * (v47 ^ 0xEEA5B85C)) ^ (2 * v49) & 0xF22F36EA;
  v68 = ((v48 ^ 0x125A6C2)
       - 53188777
       + ((2 * v48) ^ 0xFDB4B27B)
       + *(_DWORD *)&v61[4 * (v48 ^ 0x8E)]) ^ *(_DWORD *)&v62[4 * (BYTE1(v39) ^ 0x92)] ^ ((v67 ^ 0x90001040) - 2094002547 - ((2 * v67) & 0x6601D10));
  v69 = v47 ^ v49 ^ (v68 - ((2 * v68) & 0x94509040) - 903329760);
  LODWORD(v49) = *(_DWORD *)&v58[4 * (HIBYTE(v55) ^ 0xF7)];
  v70 = *(_DWORD *)&v59[4 * (BYTE2(v39) ^ 0xA6)];
  LODWORD(v49) = v49 - ((2 * v49 - 449764814) & 0x8C2AED06) - 1196554340;
  LODWORD(v47) = v70 - ((2 * v70 + 664675714) & 0x38568C86) + 268065028;
  LODWORD(v48) = ((v57 ^ 0xFEDA59B1) - 53188777 + *(_DWORD *)&v61[4 * (v57 ^ 2)]) ^ *(_DWORD *)&v62[4 * (BYTE1(v48) ^ 0x25)] ^ (((2 * v49) & 0xF22F36EA ^ 0x802A2402 ^ (1749167632 * (v47 ^ 0x9C2B4643))) - 2094002547 - 2 * (((2 * v49) & 0xF22F36EA ^ 0x802A2402 ^ (1749167632 * (v47 ^ 0x9C2B4643))) & 0x3300E98 ^ (1749167632 * (v47 ^ 0x9C2B4643)) & 0x10));
  LODWORD(v48) = (v48 - 1674885565 - ((2 * v48) & 0x38568C86)) ^ v47;
  LODWORD(v48) = (v48 - ((2 * v48) & 0x8C2AED06) + 1175811715) ^ v49;
  LODWORD(v48) = ((2 * v48) & 0xC46C77C ^ 0xF7BDBE9F) + (v48 ^ 0x15B13CB0);
  v71 = *(_DWORD *)&v58[4 * (HIBYTE(v64) ^ 0xB2)];
  LODWORD(v49) = v71 - ((2 * v71 + 1697718834) & 0x5970DFC4) + 525402363;
  LODWORD(v47) = *(_DWORD *)&v59[4 * (BYTE2(v66) ^ 0xEE)];
  LODWORD(v47) = v47 - ((2 * v47 - 409066110) & 0xB732A77E) + 1332242048;
  v72 = (2 * ((v49 ^ 0x2A500B68) + (v49 & 0x6E8648A ^ 0x7DBFFFF7)) + 2) ^ (1749167632 * (v47 ^ 0xDB9953BF));
  v73 = *(_DWORD *)&v58[4 * (HIBYTE(v66) ^ 0x2E)];
  v74 = v48 - ((2 * v48 + 205965182) & 0x3B73172A) + 601681748;
  LODWORD(v48) = (v48 - ((2 * v48 + 126) & 0x2A) + 84);
  LODWORD(v48) = (v72 - 2094002547 - ((2 * v72) & 0x6601D18)) ^ *(_DWORD *)&v62[4 * (BYTE1(v69) ^ 0xE8)] ^ (*(_DWORD *)&v61[4 * (v48 ^ 0x9D)] + (v48 ^ 0xFEDA592E) - 53188777);
  v75 = v47 ^ v49 ^ (v48 - 610708545 - ((2 * v48) & 0xB732A77E));
  LODWORD(v48) = *(_DWORD *)&v59[4 * (BYTE2(v69) ^ 0x60)];
  LODWORD(v39) = v73 - ((2 * v73 - 449764814) & 0xFC760B28) + 1892914861;
  v76 = v48 - ((2 * v48 - 409066110) & 0xF119BD1A) + 1817964878;
  LODWORD(v48) = (2 * v39) & 0xF22F36EA ^ (1749167632 * (v76 ^ 0xF88CDE8D)) ^ 0xF0260228;
  LODWORD(v48) = ((v64 ^ 0xFEDA5929) - 53188777 + *(_DWORD *)&v61[4 * (v64 ^ 0x9A)]) ^ (v48 - 2094002547 - 2 * (v48 & 0x3300E8A ^ (2 * v39) & 2)) ^ *(_DWORD *)&v62[4 * (BYTE1(v74) ^ 0x7E)];
  LODWORD(v49) = *(_DWORD *)&v58[4 * (HIBYTE(v74) ^ 0x60)];
  LODWORD(v47) = *(_DWORD *)&v59[4 * (BYTE2(v64) ^ 0x8C)];
  LODWORD(v49) = v49 - ((2 * v49 - 449764814) & 0x8D835B34) + 962215603;
  LODWORD(v47) = v47 - ((2 * v47 - 409066110) & 0xE1477C50) + 1685246185;
  v77 = ((v69 ^ 0xFEDA59B2) - 53188777 + *(_DWORD *)&v61[4 * (v69 ^ 1)]) ^ *(_DWORD *)&v62[4 * (BYTE1(v66) ^ 0x56)] ^ (1749167632 * (v47 ^ 0xF0A3BE28)) ^ (((2 * v49) & 0xF22F36EA ^ 0x80031220) - 2094002547 - 2 * (((2 * v49) & 0xF22F36EA ^ 0x80031220) & 0x220068A ^ (2 * v49) & 2));
  v78 = v47 ^ v49 ^ (v77 - ((2 * v77) & 0x8D835B34) - 960385638);
  LODWORD(v49) = *(_DWORD *)&v58[4 * (HIBYTE(v78) ^ 0x51)];
  LODWORD(v49) = v49 - ((2 * v49 + 1697718834) & 0x46426C9A) - 1782986906;
  LODWORD(v49) = (2 * v49) & 0xF22F36EA ^ v49;
  LODWORD(v47) = *(_DWORD *)&v59[4 * (BYTE2(v75) ^ 0xA4)];
  LODWORD(v47) = v47 - ((2 * v47 + 127804802) & 0x16BB95E8) - 13836875;
  LODWORD(v47) = (1749167632 * (v47 ^ 0x8B5DCAF4)) ^ v47;
  HIDWORD(v42) = v49 ^ v47 ^ 0xFFFFFFF3;
  LODWORD(v42) = v49 ^ v47 ^ 0xEA7ED820;
  LODWORD(v49) = v42 >> 5;
  HIDWORD(v42) = v49 ^ 0x15B4267;
  LODWORD(v42) = v49 ^ 0x55555555;
  v79 = v76 ^ v39 ^ (v48 - ((2 * v48) & 0xFC760B28) - 29686380);
  v80 = (v42 >> 27) - ((2 * (v42 >> 27)) & 0xCF5C0D3E) + 1739458207;
  LODWORD(v47) = (v80 & 0x100 | ((((unsigned __int16)(v80 & 0x100) >> 8) & 1) << 9)) ^ 0x774FF959;
  v81 = *(_DWORD *)&v62[4 * (BYTE1(v79) ^ 0x5B)];
  v82 = (((_DWORD)v47 - 2001729881) & (v81 ^ 0x83300E00)) == 0;
  LODWORD(v48) = *(_DWORD *)&v59[4 * (BYTE2(v74) ^ 0xDC)];
  LODWORD(v49) = *(_DWORD *)&v58[4 * (HIBYTE(v69) ^ 0x19)];
  LODWORD(v48) = v48 - ((2 * v48 - 409066110) & 0xB4D4F2C2) - 835089374;
  LODWORD(v51) = 1749167632 * (v48 ^ 0x5A6A7961) - 1257295381 - ((1350851616 * (v48 ^ 0x5A6A7961)) & 0x6A1E63C0);
  v83 = ((v51 ^ 0xB50F31EB) & (v48 ^ 0x5A6A7961)) - ((2 * ((v51 ^ 0xB50F31EB) & (v48 ^ 0x5A6A7961))) & 0x3343B368);
  LODWORD(v49) = v49 - ((2 * v49 + 1697718834) & 0x4D3D9F46) + 423059644;
  LODWORD(v48) = (v48 ^ 0xEF65488A ^ v51)
               + ((2 * v83 + 860074856) ^ 0xCCBC4C97)
               + ((2 * v83 + 860074856) ^ 0x3343B368)
               + 1;
  v84 = ((v66 ^ 0xFEDA595E) - 53188777 + *(_DWORD *)&v61[4 * (v66 ^ 0xED)]) ^ *(_DWORD *)&v62[4 * (BYTE1(v64) ^ 0x30)] ^ v49 ^ (((2 * v49) & 0xF22F36EA ^ 0x402D1642 ^ v48) - 2094002547 - 2 * (((2 * v49) & 0xF22F36EA ^ 0x402D1642 ^ v48) & 0x3300E9D ^ v48 & 0x10));
  LODWORD(v48) = *(_DWORD *)&v58[4 * (HIBYTE(v75) ^ 0x1F)];
  v85 = *(_DWORD *)&v59[4 * (BYTE2(v79) ^ 0xA6)];
  LODWORD(v48) = v48 - ((2 * v48 + 1697718834) & 0x7A714016) - 1345244892;
  v86 = (2 * v48) & 0xF22F36EA ^ 0x72210002 ^ (1749167633 * v85
                                             - 2 * ((1749167632 * v85 + 806476304) & (v85 + 1942950593))
                                             + 601943249);
  v87 = *(_DWORD *)&v58[4 * (HIBYTE(v79) ^ 0xC0)];
  v88 = v48 ^ (v86 - 2094002547 - ((2 * v86) & 0x6601D1A)) ^ (*(_DWORD *)&v61[4 * (v78 ^ 0x89)]
                                                            + (v78 ^ 0xFEDA593A)
                                                            - 53188777) ^ *(_DWORD *)&v62[4 * (BYTE1(v84) ^ 0x3F)];
  v89 = *(_DWORD *)&v59[4 * (BYTE2(v84) ^ 0xEB)];
  LODWORD(v51) = v87 - ((2 * v87 + 87106098) & 0x1C038656) + 10114116;
  v90 = v89 - ((2 * v89 - 409066110) & 0xEF432542) - 344939166;
  v91 = (2 * v51) & 0xF22F36EA ^ 0x10030642 ^ (1749167632 * (v90 ^ 0x77A192A1));
  v92 = (v91 - 2094002547 - ((2 * v91) & 0x6601D10)) ^ *(_DWORD *)&v62[4 * (BYTE1(v78) ^ 0xC1)] ^ (*(_DWORD *)&v61[4 * (v75 ^ 0x8C)]
                                                                                                 + (v75 ^ 0xFEDA593F)
                                                                                                 - 53188777);
  v93 = v90 ^ v51 ^ (v92 + 2007077537 - ((2 * v92) & 0xEF432542));
  v94 = *(_DWORD *)&v58[4 * (HIBYTE(v84) ^ 0xBD)];
  LODWORD(v51) = *(_DWORD *)&v59[4 * (BYTE2(v78) ^ 0xBB)];
  v95 = v94 - ((2 * v94 + 87106098) & 0x148FB70C) + 2095082655;
  LODWORD(v51) = v51 - ((2 * v51 + 127804802) & 0x119B22D2) - 56843222;
  v96 = (1749167632 * (v51 ^ 0x88CD9169)) ^ (2 * v95) & 0xF22F36EA;
  v97 = ((v79 ^ 0xFEDA59C4) - 53188777 + *(_DWORD *)&v61[4 * (v79 ^ 0x77)]) ^ *(_DWORD *)&v62[4 * (BYTE1(v75) ^ 0x52)] ^ ((v96 ^ 0x100F3608) - 2094002547 - 2 * ((v96 ^ 0x100F3608) & 0x3300E9A ^ v96 & 0x12));
  v98 = v51 ^ v95 ^ (v97 - ((2 * v97) & 0x148FB70C) + 172481414);
  v99 = v47 - 1627392025;
  v100 = -1918899559 - v47;
  if (!v82)
    v99 = v100;
  v101 = v80 & 0xFFFFFEFF ^ (*(_DWORD *)&v61[4 * (v84 ^ 0xC3)]
                           + (v84 ^ 0xFEDA5970)
                           - 53188777) ^ ((v81 ^ 0x83300E8D) - 374337856 + v99);
  v102 = *(_DWORD *)&v58[4 * (HIBYTE(v98) ^ 0xF6)];
  v103 = *(_DWORD *)&v59[4 * (BYTE2(v101) ^ 0x42)];
  v104 = v102 - ((2 * v102 - 449764814) & 0xAF3059E6) - 902775284;
  v105 = v103 - ((2 * v103 - 409066110) & 0xE46A3FDE) + 1711551152;
  v106 = (((2 * v104) & 0xF22F36EA ^ (1749167632 * (v105 ^ 0xF2351FEF)) ^ 0xA22010E2)
        - 2094002547
        - 2
        * (((2 * v104) & 0xF22F36EA ^ (1749167632 * (v105 ^ 0xF2351FEF)) ^ 0xA22010E2) & 0x3300E98 ^ (1749167632 * (v105 ^ 0xF2351FEF)) & 0x10)) ^ *(_DWORD *)&v62[4 * (BYTE1(v88) ^ 0x18)];
  v107 = (v106 - 231399441 - ((2 * v106) & 0xE46A3FDE)) ^ v105;
  v108 = (v107 + 1469590772 + ~((2 * v107) & 0xAF3059E6)) ^ v104;
  v109 = (2 * (v108 & 0x400)) ^ 0x800 | v108 & 0x400;
  v110 = *(_DWORD *)&v61[4 * (v93 ^ 0xB9)] + (v93 ^ 0xFEDA590A) + 759383567;
  v82 = ((v109 - 1024) & (v110 - 812572344)) == 0;
  v111 = v109 + 823978613;
  v112 = 823980661 - v109;
  if (v82)
    v114 = v111;
  else
    v114 = v112;
  v113 = *(_DWORD *)&v58[4 * (HIBYTE(v101) ^ 0x47)];
  v115 = v113 - ((2 * v113 + 87106098) & 0x1395C710);
  v116 = *(_DWORD *)&v59[4 * (BYTE2(v88) ^ 0x61)];
  v115 += 2086892705;
  v117 = v116 - ((2 * v116 - 409066110) & 0xE091DEA8) - 468188651;
  v118 = ((2 * (v98 ^ 0xA2)) & 0xAE) - (v98 ^ 0xA2) + 950897064;
  v119 = (v118 & 0x2084044C ^ 0xC0121404) + (v118 ^ 0x2885485A) - ((v118 ^ 0x2885485A) & 0xC44C);
  v120 = (((2 * v115) & 0xF22F36EA ^ (1749167632 * (v117 ^ 0x7048EF54)) ^ 0x12050600)
        - 2094002547
        - 2
        * (((2 * v115) & 0xF22F36EA ^ (1749167632 * (v117 ^ 0x7048EF54)) ^ 0x12050600) & 0x3300E98 ^ (1749167632 * (v117 ^ 0x7048EF54)) & 0x10)) ^ *(_DWORD *)&v62[4 * (BYTE1(v93) ^ 0xDB)];
  v121 = (v120 - ((2 * v120) & 0x1395C710) + 164291464) ^ v115;
  v122 = (v121 + 1883828052 - ((2 * v121) & 0xE091DEA8)) ^ v117;
  HIDWORD(v124) = v98;
  LODWORD(v124) = v119 ^ 0xF0BE1548;
  v123 = v124 >> 1;
  HIDWORD(v124) = v123 ^ 0x623AAF6C;
  LODWORD(v124) = ~v123;
  v125 = (2 * (v122 & 0x80)) ^ 0x100 | v122 & 0x80;
  v126 = *(_DWORD *)&v61[4 * ((v124 >> 31) ^ 0xC4755ED1)] + (v119 ^ 0xE644CF3);
  v82 = ((v125 - 128) & (v126 - 53188777)) == 0;
  v127 = *(_DWORD *)&v58[4 * (HIBYTE(v88) ^ 0x60)];
  v128 = *(_DWORD *)&v59[4 * (BYTE2(v93) ^ 0xE8)];
  v129 = v127 - ((2 * v127 - 449764814) & 0x9DB5ACE2) + 1098082186;
  v130 = v128 - ((2 * v128 - 409066110) & 0xCBBA2416) - 643029812;
  v131 = (2 * v129) & 0xF22F36EA ^ 0x902524E2 ^ (1749167632 * (v130 ^ 0x65DD120B));
  v132 = (v131 - 2094002547 - ((2 * v131) & 0x6601D10)) ^ *(_DWORD *)&v62[4 * (BYTE1(v98) ^ 0x5C)] ^ (*(_DWORD *)&v61[4 * (v101 ^ 0x26)] + (v101 ^ 0xFEDA5995) - 53188777);
  v133 = v130 ^ v129 ^ (v132 + 1708986891 - ((2 * v132) & 0xCBBA2416));
  v134 = *(_DWORD *)&v58[4 * (HIBYTE(v93) ^ 0x3F)];
  v135 = *(_DWORD *)&v59[4 * (BYTE2(v98) ^ 0xCB)];
  v136 = v134 - ((2 * v134 - 449764814) & 0x80C4819A) + 855298534;
  v137 = ((2 * v136) ^ 0x80C4819A) - ((2 * ((2 * v136) ^ 0x80C4819A)) & 0x65DAC458);
  v138 = v135 - ((2 * v135 + 1738417538) & 0x491B27CA) - 1738758490;
  v139 = ((v88 ^ 0xFEDA5917) - 53188777 + *(_DWORD *)&v61[4 * (v88 ^ 0xA4)]) ^ *(_DWORD *)&v62[4 * (BYTE1(v101) ^ 0xDD)] ^ (1749167632 * (v138 ^ 0x248D93E5) - 2094002547 - ((8674336 * (v138 ^ 0x248D93E5)) & 0x6601D00));
  v140 = v138 ^ v136 ^ ((v139 ^ (v137 - 1293065684) & 0xF22F36EA ^ 0xB22D2228)
                      + 613258213
                      - 2
                      * ((v139 ^ (v137 - 1293065684) & 0xF22F36EA ^ 0xB22D2228) & 0x248D93E7 ^ (v139 ^ (v137 - 1293065684) & 0xF22F36EA) & 2));
  v141 = (v108 & 0xFFFFFBFF ^ 0xEA4EC74F ^ (v110 - 1636551981 + v114)) + v110;
  v142 = (v141 + 261169481) & 0x3F95F570 ^ ((v108 ^ 0xEA4EC34F) + 1) ^ (v141 - 812572343) & 0xC06A0A8F;
  v143 = (v108 ^ 0x219072DE ^ (v142 - ((2 * v142) & 0x68429CDC) + 874597998)) + v110 - 812572344;
  v144 = v143 - ((2 * v143) & 0x9368A50C);
  v145 = v125 + 1808784584;
  v146 = v125 ^ 0x6BCFDDC8;
  if (v82)
    v146 = v145;
  v147 = (v126 - 1861973489 + v146) ^ v122 & 0xFFFFFF7F;
  v148 = *(_DWORD *)&v58[4 * (HIBYTE(v133) ^ 0xE1)];
  v149 = ((2 * v148 + 300889622) & 0xD341EC1C) + ((v148 - 1997038837) ^ 0xE9A0F60E);
  v150 = v149 + 2002889925 - ((2 * v149) & 0xEEC3598A);
  v151 = *(_DWORD *)&v59[4 * (BYTE2(v140) ^ 0x3E)];
  v152 = *(_DWORD *)&v58[4 * (HIBYTE(v140) ^ 0x8A)];
  v153 = v152 - ((2 * v152 - 449764814) & 0x8AB47AF4) + 938659475;
  v154 = v151 - ((2 * v151 + 1738417538) & 0x613E62E4) + 611206195;
  v155 = v144 + 1236554374;
  v156 = (1749167632 * (v154 ^ 0xB09F3172)) ^ (((2 * v150) & 0xF22F36EA ^ 0xE203108A)
                                             - 2094002547
                                             - ((2 * ((2 * v150) & 0xF22F36EA ^ 0xE203108A)) & 0x4400D10)) ^ (*(_DWORD *)&v61[4 * (v147 ^ 0x83)] + (v147 ^ 0xFEDA5930) - 53188777) ^ *(_DWORD *)&v62[4 * (((unsigned __int16)(v144 + 21126) >> 8) ^ 0x2D)];
  v157 = *(_DWORD *)&v59[4 * (BYTE2(v155) ^ 0xC5)];
  v158 = v150 ^ v154 ^ (v156 + 2002889925 - ((2 * v156) & 0xEEC3598A));
  v159 = 2 * ((v153 ^ 0x43B259F0) + (v153 & 0x6E8648A ^ 0x7D5FBF7F)) + 2;
  v160 = v157 - ((2 * v157 - 409066110) & 0x8FE55A44) + 1002553315;
  v161 = ((v159 ^ (1749167632 * (v160 ^ 0xC7F2AD22)))
        - 2094002547
        - 2 * ((v159 ^ (1749167632 * (v160 ^ 0xC7F2AD22))) & 0x3300E8E ^ v159 & 2)) ^ *(_DWORD *)&v62[4 * (BYTE1(v147) ^ 0xF1)] ^ (*(_DWORD *)&v61[4 * (v133 ^ 0x41)] + (v133 ^ 0xFEDA59F2) - 53188777);
  v162 = v160 ^ v153 ^ (v161 - ((2 * v161) & 0x8AB47AF4) - 983941766);
  v163 = *(_DWORD *)&v59[4 * (BYTE2(v147) ^ 0xDE)];
  v164 = v163 - ((2 * v163 + 1738417538) & 0x596667F2) - 1602074950;
  v165 = *(_DWORD *)&v58[4 * (HIBYTE(v155) ^ 0xBC)];
  v166 = (449764812 - 2 * v165) & 0xF22F36EA ^ (v165 + 1922601241) ^ v164 ^ (1749167632 * (v164 ^ 0x2CB333F9)
                                                                           + 749941753
                                                                           - ((1350851616 * (v164 ^ 0x2CB333F9)) & 0x596667E0));
  v167 = *(_DWORD *)&v58[4 * (HIBYTE(v147) ^ 0x3F)];
  v168 = ((v140 ^ 0xFEDA591B) - 53188777 + *(_DWORD *)&v61[4 * (v140 ^ 0xA8)]) ^ *(_DWORD *)&v62[4 * (BYTE1(v133) ^ 0x40)] ^ (v166 - 2094002547 - ((2 * v166) & 0x6601D1A));
  v169 = *(_DWORD *)&v59[4 * (BYTE2(v133) ^ 0xF5)];
  v170 = v167 - ((2 * v167 + 1697718834) & 0x765A873A) - 1379543882;
  v171 = v169 - ((2 * v169 - 409066110) & 0xBC10F8CC) - 774402265;
  v172 = (v158 ^ 0x540CC63A) >> ((-46 - v137) & 8) >> ((-46 - v137) & 8 ^ 8);
  v173 = (((1749167632 * (v171 ^ 0x5E087C66)) ^ 0x720A062A ^ (2 * v170) & 0xF22F36EA)
        - 2094002547
        - 2
        * (((1749167632 * (v171 ^ 0x5E087C66)) ^ 0x720A062A ^ (2 * v170) & 0xF22F36EA) & 0x3300E98 ^ (1749167632 * (v171 ^ 0x5E087C66)) & 0x10)) ^ *(_DWORD *)&v62[4 * (BYTE1(v140) ^ 0xEB)] ^ (*(_DWORD *)&v61[4 * (v155 ^ 0xA1)] + (v155 ^ 0xFEDA5912) - 53188777);
  v174 = v170 ^ v171 ^ (v173 - ((2 * v173) & 0x765A873A) + 992822173);
  v175 = *(_DWORD *)&v58[4 * (HIBYTE(v158) ^ 0xA9)];
  v176 = *(_DWORD *)&v59[4 * (BYTE2(v162) ^ 0xC2)];
  v177 = v175 - ((2 * v175 + 1697718834) & 0x731AC15C) - 1406799417;
  v178 = v176 - ((2 * v176 - 409066110) & 0x9DFC1654) + 1120738795;
  v179 = v177 ^ *(_DWORD *)&v62[4 * (BYTE1(v168) ^ 0xDC)] ^ v178 ^ (((2 * v177) & 0xF22F36EA ^ 0x720A0048)
                                                                  - ((2 * ((2 * v177) & 0xF22F36EA ^ 0x720A0048)) & 0x601A4154)
                                                                  + 965566638) ^ (*(_DWORD *)&v61[4
                                                                                                * (v174 ^ 0x10)]
                                                                                + (v174 ^ 0xFEDA59A3)
                                                                                - 53188777) ^ (1749167632
                                                                                             * (v178 ^ 0xCEFE0B2A)
                                                                                             - 2094002547
                                                                                             - ((8674336
                                                                                               * (v178 ^ 0xCEFE0B2A)) & 0x6601D00));
  v180 = *(_DWORD *)&v58[4 * (HIBYTE(v162) ^ 0x40)];
  v181 = *(_DWORD *)&v59[4 * (BYTE2(v168) ^ 0x45)];
  v182 = v180 - ((2 * v180 - 449764814) & 0x8DF13B9C) + 965816039;
  v183 = v181 - ((2 * v181 - 409066110) & 0xAAB9B558) + 1227615597;
  v184 = (2 * v182) & 0xF22F36EA ^ (1749167632 * (v183 ^ 0xD55CDAAC)) ^ 0x80213288;
  v185 = (v184 - 2094002547 - ((2 * v184) & 0x6601D10)) ^ *(_DWORD *)&v62[4 * (BYTE1(v174) ^ 0x42)] ^ (*(_DWORD *)&v61[4 * (v158 ^ 0x32)] + (v158 ^ 0xFEDA5981) - 53188777);
  v186 = v183 ^ v182 ^ (v185 - 715334996 - ((2 * v185) & 0xAAB9B558));
  v187 = *(_DWORD *)&v58[4 * (HIBYTE(v168) ^ 0x41)];
  v188 = *(_DWORD *)&v59[4 * (BYTE2(v174) ^ 0x26)];
  v189 = v187 - ((2 * v187 + 623977010) & 0x3EEFCB8A) + 303068894;
  v190 = v188 - ((2 * v188 - 409066110) & 0xD02585D6) - 605956692;
  v191 = v190 ^ v189 ^ (((2 * v189) & 0xF22F36EA ^ 0x322F028A ^ (1749167632 * (v190 ^ 0x6812C2EB)))
                      - 2
                      * (((2 * v189) & 0xF22F36EA ^ 0x322F028A ^ (1749167632 * (v190 ^ 0x6812C2EB))) & 0x1F77E5D0 ^ (1749167632 * (v190 ^ 0x6812C2EB)) & 0x10)
                      - 1619532347);
  v192 = v191 ^ 0x44A77BA4;
  if (((HIBYTE(v174) ^ 0xFB) + 108) | HIBYTE(v174) ^ 0xFB)
    v192 = HIBYTE(v174) ^ 0x2CB5B9B4;
  v193 = *(_DWORD *)&v61[4 * (v162 ^ 0xC0)] + (v162 ^ 0xFEDA5973);
  v194 = (v193 - ((2 * v193 + 27840174) & 0x6601D1A) - 2147191324) ^ *(_DWORD *)&v62[4 * (v172 ^ 0xF5)] ^ v191;
  v195 = *(_DWORD *)&v58[4 * (v192 ^ 0x2CB5B9B2)];
  v196 = *(_DWORD *)&v59[4 * (BYTE2(v158) ^ 0x69)];
  v197 = ((2 * v196 + 835187296) & 0xB5D63322) + ((v196 - 1729890000) ^ 0xDAEB1991);
  v198 = v197 + 1547461223 - ((2 * v197) & 0xB878C4CE);
  v199 = v195 - ((2 * v195 - 449764814) & 0xEBCF5B32) + 1753235122;
  v200 = (2 * v199) & 0xF22F36EA ^ (1749167632 * (v198 ^ 0x5C3C6267)) ^ 0xE20F1222;
  v201 = ((v168 ^ 0xFEDA59EB) - 53188777 + *(_DWORD *)&v61[4 * (v168 ^ 0x58)]) ^ *(_DWORD *)&v62[4 * (BYTE1(v162) ^ 0x21)] ^ (v200 - 2094002547 - ((2 * v200) & 0x6601D10));
  v202 = v198 ^ v199 ^ (v201 - ((2 * v201) & 0xEBCF5B32) - 169366119);
  v203 = *(_DWORD *)&v58[4 * (HIBYTE(v179) ^ 0x8B)];
  v204 = *(_DWORD *)&v59[4 * (BYTE2(v186) ^ 0xF8)];
  v205 = *(_DWORD *)&v58[4 * (HIBYTE(v186) ^ 0xD0)];
  v206 = v203 - ((2 * v203 + 1697718834) & 0x610D78E4) + 589254027;
  v207 = v204 - ((2 * v204 + 1738417538) & 0x4449B62E) + 368307672;
  v208 = (((2 * v206) & 0xF22F36EA ^ 0x600D30E0 ^ (1749167632 * (v207 ^ 0xA224DB17)))
        - 2094002547
        - 2
        * (((2 * v206) & 0xF22F36EA ^ 0x600D30E0 ^ (1749167632 * (v207 ^ 0xA224DB17))) & 0x3300E98 ^ (1749167632 * (v207 ^ 0xA224DB17)) & 0x10)) ^ *(_DWORD *)&v62[4 * (BYTE1(v194) ^ 3)] ^ (*(_DWORD *)&v61[4 * (v202 ^ 0x23)] + (v202 ^ 0x125A66F) - 53188777 + ((2 * v202) ^ 0xFDB4B321));
  v209 = v207 ^ v206 ^ (v208 - ((2 * v208) & 0x610D78E4) - 1333347214);
  v210 = *(_DWORD *)&v59[4 * (BYTE2(v194) ^ 0xE2)];
  v211 = v205 - ((2 * v205 + 623977010) & 0x3C24ECA0) + 279644009;
  v212 = v210 - ((2 * v210 - 409066110) & 0x8B2DFEF6) - 1184492996;
  v213 = (((2 * v211) & 0xF22F36EA ^ (1749167632 * (v212 ^ 0x4596FF7B)) ^ 0x302424A0)
        - 2094002547
        - 2
        * (((2 * v211) & 0xF22F36EA ^ (1749167632 * (v212 ^ 0x4596FF7B)) ^ 0x302424A0) & 0x3300E98 ^ (1749167632 * (v212 ^ 0x4596FF7B)) & 0x10)) ^ *(_DWORD *)&v62[4 * (BYTE1(v202) ^ 0xB8)] ^ (*(_DWORD *)&v61[4 * (v179 ^ 0x8F)] + (v179 ^ 0xFEDA593C) - 53188777);
  v214 = v212 ^ v211 ^ (v213 - 1642957231 + ~((2 * v213) & 0x3C24ECA0));
  v215 = *(_DWORD *)&v58[4 * (HIBYTE(v194) ^ 0x19)];
  v216 = *(_DWORD *)&v59[4 * (BYTE2(v202) ^ 0x78)];
  v217 = v216 - ((2 * v216 - 409066110) & 0xE142D9F6);
  HIDWORD(v218) = (v217 + 1685094332) ^ 0xFFFFFFFB;
  LODWORD(v218) = (v217 + 1685094332) ^ 0xF0A16CC0;
  v219 = (((1749167632 * ((v217 + 1685094332) ^ 0xF0A16CFB)) >> 6) - (v217 << 30) - 0x40000000) ^ (v218 >> 6);
  HIDWORD(v218) = v219 ^ 0x1CBDC5D;
  LODWORD(v218) = v219 ^ 0x78000000;
  v220 = v215 - ((2 * v215 - 449764814) & 0xFE9B89FE) + 1910920728;
  v221 = (2 * v220) & 0xF22F36EA ^ 0xF20B00EA ^ (v218 >> 26);
  v222 = *(_DWORD *)&v58[4 * (HIBYTE(v202) ^ 0xA1)];
  v223 = v220 ^ *(_DWORD *)&v62[4 * (BYTE1(v179) ^ 0xAC)] ^ (*(_DWORD *)&v61[4 * (v186 ^ 0x4E)]
                                                           + (v186 ^ 0xFEDA59FD)
                                                           - 53188777) ^ (v221 - 2094002547 - ((2 * v221) & 0x6601D1A));
  v224 = *(_DWORD *)&v59[4 * (BYTE2(v179) ^ 0x54)];
  v225 = v222 - ((2 * v222 - 449764814) & 0x986E2520) + 1053795241;
  v226 = v224 - ((2 * v224 - 409066110) & 0x97F0A23E) + 1070031840;
  v227 = (2 * v225) & 0xF22F36EA ^ (1749167632 * (v226 ^ 0xCBF8511F)) ^ 0x902E2420;
  v228 = ((v194 ^ 0xFEDA59AD) - 53188777 + *(_DWORD *)&v61[4 * (v194 ^ 0x1E)]) ^ *(_DWORD *)&v62[4 * (BYTE1(v186) ^ 0x93)] ^ (v227 - 2094002547 - 2 * (v227 & 0x3300E8A ^ (2 * v225) & 2));
  v229 = v226 ^ v225 ^ (v228 - 872918753 - ((2 * v228) & 0x97F0A23E));
  v230 = *(_DWORD *)&v58[4 * (HIBYTE(v209) ^ 0x5D)];
  v231 = *(_DWORD *)&v59[4 * (BYTE2(v214) ^ 0x7B)];
  v232 = v230 - ((2 * v230 - 449764814) & 0xE1A9B47A) + 1668115286;
  v233 = v231 - ((2 * v231 + 1738417538) & 0x6FA94C58) - 1415333651;
  v234 = (2 * v232) & 0xF22F36EA ^ 0xE029346A ^ (1749167632 * (v233 ^ 0x37D4A62C));
  v235 = (v234 - 2094002547 - ((2 * v234) & 0x6601D10)) ^ (*(_DWORD *)&v61[4 * (v229 ^ 0xC2)]
                                                         + (v229 ^ 0xFEDA5971)
                                                         - 53188777) ^ *(_DWORD *)&v62[4 * (BYTE1(v223) ^ 0xB0)];
  v236 = v233 ^ v232 ^ (v235 - ((2 * v235) & 0xE1A9B47A) - 254485955);
  v237 = *(_DWORD *)&v58[4 * (HIBYTE(v214) ^ 0x78)];
  v238 = *(_DWORD *)&v59[4 * (BYTE2(v223) ^ 0x3D)];
  v239 = v237 - ((2 * v237 - 449764814) & 0xC734C0FA) - 701304426;
  v240 = v238 - ((2 * v238 + 127804802) & 0x1CA028DA) - 2111887570;
  v241 = (*(_DWORD *)&v61[4 * (v209 ^ 0xB3)] + v209 - 72433577) ^ *(_DWORD *)&v62[4 * (BYTE1(v229) ^ 0x8E)] ^ (((2 * v239) & 0xF22F36EA ^ 0xC22400EA ^ (1749167632 * (v240 ^ 0xE50146D))) - 2094002547 - 2 * (((2 * v239) & 0xF22F36EA ^ 0xC22400EA ^ (1749167632 * (v240 ^ 0xE50146D))) & 0x3300E98 ^ (1749167632 * (v240 ^ 0xE50146D)) & 0x10));
  v242 = v240 ^ v239 ^ (v241 - ((2 * v241) & 0xC734C0FA) + 1671061629);
  v243 = *(_DWORD *)&v58[4 * (HIBYTE(v223) ^ 0x15)];
  v244 = *(_DWORD *)&v62[4 * (BYTE1(v209) ^ 0x77)];
  v245 = v243 + 785069101 + (~(2 * v243 + 1697718834) | 0x879AB9D9);
  HIDWORD(v218) = v244 ^ 0x3300E8D;
  LODWORD(v218) = v244 ^ 0x80000000;
  v246 = *(_DWORD *)&v59[4 * (BYTE2(v229) ^ 0x6E)];
  v247 = (v218 >> 30) - 248740096 - ((2 * (v218 >> 30)) & 0xE2590E02) + 1;
  HIDWORD(v218) = v247 ^ 1;
  LODWORD(v218) = v247 ^ 0xF12C8700;
  v248 = v246 - ((2 * v246 - 409066110) & 0x9F537C88) + 1131991301;
  v249 = (*(_DWORD *)&v61[4 * (v214 ^ 0x98)] + (v214 ^ 0xFEDA592B) - 53188777) ^ (1749167632 * (v248 ^ 0xCFA9BE44)) ^ (v218 >> 2) ^ (2 * v245) & 0xF22F36EA;
  v250 = v248 ^ v245 ^ ((v249 ^ 0x70250622) - 2 * ((v249 ^ 0x70250622) & 0x3C32A31F ^ v249 & 0xC) - 1137532141);
  v251 = *(_DWORD *)&v59[4 * (BYTE2(v209) ^ 0x53)];
  v252 = *(_DWORD *)&v58[4 * (HIBYTE(v229) ^ 0x7D)];
  v253 = v251 - ((2 * v251 + 1738417538) & 0x41A6F970) + 346197881;
  v254 = v252 - ((2 * v252 - 449764814) & 0x8FC50554) + 981144515;
  v255 = (1749167632 * (v253 ^ 0xA0D37CB8)) ^ 0x82050440 ^ (2 * v254) & 0xF22F36EA;
  v256 = ((v223 ^ 0xFEDA59C3) - 53188777 + *(_DWORD *)&v61[4 * (v223 ^ 0x70)]) ^ *(_DWORD *)&v62[4 * (BYTE1(v214) ^ 0x78)] ^ (v255 - 2094002547 - 2 * (v255 & 0x3300E8A ^ (2 * v254) & 2));
  v257 = v254 ^ v253 ^ (v256 - ((2 * v256) & 0x8FC50554) - 941456726);
  v258 = *(_DWORD *)&v58[4 * (HIBYTE(v236) ^ 0x4A)];
  v259 = *(_DWORD *)&v59[4 * (BYTE2(v242) ^ 0x5B)];
  v260 = v258 - ((2 * v258 + 19997234) & 0x1E505F0) + 1938494481;
  v261 = v259 - ((2 * v259 - 409066110) & 0xBD963F0C) - 761646521;
  v262 = v260 ^ *(_DWORD *)&v62[4 * (BYTE1(v250) ^ 0xCA)] ^ v261 ^ (((2 * v260) & 0xF22F36EA ^ 0x2504E0)
                                                                  - 2
                                                                  * (((2 * v260) & 0xF22F36EA ^ 0x2504E0) & 0x2202EA ^ (2 * v260) & 2)
                                                                  + 15893240) ^ ((v257 ^ 0xFFFFFFF8)
                                                                               - 72433577
                                                                               + ((2 * v257) & 0x88 ^ 8)
                                                                               + *(_DWORD *)&v61[4
                                                                                               * (v257 ^ 0xF)]
                                                                               + 188) ^ (1749167632
                                                                                       * (v261 ^ 0x5ECB1F86)
                                                                                       - 2094002547
                                                                                       - ((8674336 * (v261 ^ 0x5ECB1F86)) & 0x6601D00));
  v263 = *(_DWORD *)&v58[4 * (HIBYTE(v242) ^ 0x9A)];
  v264 = *(_DWORD *)&v59[4 * (BYTE2(v250) ^ 0xBF)];
  v265 = v263 - ((2 * v263 - 449764814) & 0xE3304642) - 466570182;
  v266 = v264 - ((2 * v264 + 1738417538) & 0x4000C858) - 1815120147;
  v267 = (2 * v265) & 0xF22F36EA ^ (1749167632 * (v266 ^ 0x2000642C)) ^ 0xE2200642;
  v268 = *(_DWORD *)&v58[4 * (HIBYTE(v250) ^ 0x17)];
  v269 = (*(_DWORD *)&v61[4 * (v236 ^ 0x3C)] + (v236 ^ 0xFEDA598F) - 53188777) ^ *(_DWORD *)&v62[4 * (BYTE1(v257) ^ 0xB1)] ^ (v267 - 2094002547 - ((2 * v267) & 0x6601D10));
  v270 = v266 ^ v265 ^ (v269 - ((2 * v269) & 0xE3304642) + 1905795873);
  v271 = *(_DWORD *)&v59[4 * (BYTE2(v257) ^ 6)];
  v272 = v268 - ((2 * v268 - 449764814) & 0xF9FE05AE) + 1872204784;
  v273 = v271 - ((2 * v271 - 409066110) & 0x8A110388) + 953652357;
  v274 = (2 * v272) & 0xF22F36EA ^ 0xF02E04AA ^ (1749167632 * (v273 ^ 0xC50881C4));
  v275 = *(_DWORD *)&v58[4 * (HIBYTE(v257) ^ 0x1D)];
  v276 = ((v242 ^ 0xFEDA59EA) - 53188777 + *(_DWORD *)&v61[4 * (v242 ^ 0x59)]) ^ *(_DWORD *)&v62[4 * (BYTE1(v236) ^ 0x36)] ^ (v274 - 2094002547 - ((2 * v274) & 0x6601D10));
  v277 = v275 - ((2 * v275 - 449764814) & 0x815E8166) + 860344780;
  v278 = v273 ^ v272 ^ (v276 - ((2 * v276) & 0xF9FE05AE) - 50396457);
  v279 = *(_DWORD *)&v59[4 * (BYTE2(v236) ^ 0xA8)];
  v280 = *(_BYTE **)(v22 - 120);
  v281 = v279 - ((2 * v279 - 409066110) & 0x8D4CDF96) - 1166703988;
  v282 = (1749167632 * (v281 ^ 0x46A66FCB)) ^ (2 * v277) & 0xF22F36EA;
  v283 = (((2 * (v250 ^ 0x6D)) & 0x1CA) - (v250 ^ 0x6D) - 142659046) ^ 0xF33D5118;
  v284 = ((v282 ^ 0x800E0062) - 2094002547 - ((2 * v282) & 0x6601D10)) ^ *(_DWORD *)&v62[4 * (BYTE1(v242) ^ 0x26)] ^ (*(_DWORD *)&v61[4 * (v250 ^ 0x66)] - 53188777 + ((((2 * v283) | 0x1B637D58) - v283 - 229752492) ^ 0xF60C2252) + ((((((2 * v283) | 0x1B637D58) - v283 - 229752492) ^ 0xF7298416) + ((((2 * v283) | 0x1B637D58) - v283 - 229752492) ^ 0x9F3DDAD) + 1) ^ 7) + 1);
  v285 = v284 + 1185312715 - ((2 * v284) & 0x8D4CDF96);
  LODWORD(v329) = BYTE2(v270);
  v286 = (char *)*(&off_24DCDB210 + (int)(HIDWORD(v329) & 0xCD40424B)) - 4;
  HIDWORD(v328) = *(_DWORD *)&v286[4 * (BYTE2(v270) ^ 0x1D)];
  LODWORD(v327) = *(_DWORD *)&v286[4 * (BYTE2(v278) ^ 0x99)];
  HIDWORD(v327) = BYTE2(v278);
  v287 = v281 ^ v277 ^ v285;
  v288 = *(_DWORD *)&v286[4 * (BYTE2(v287) ^ 0x71)];
  v289 = *(_DWORD *)&v286[4 * (BYTE2(v262) ^ 0x47)];
  v290 = (uint64_t)*(&off_24DCDB210 + (HIDWORD(v329) ^ 0x1E7));
  HIDWORD(v326) = *(_DWORD *)(v290 + 4 * (HIBYTE(v262) ^ 0x26));
  v291 = *(_DWORD *)(v290 + 4 * (HIBYTE(v270) ^ 0x18));
  LODWORD(v286) = *(_DWORD *)(v290 + 4 * (HIBYTE(v278) ^ 0xF1));
  LODWORD(v290) = *(_DWORD *)(v290 + 4 * (HIBYTE(v287) ^ 0x9D));
  v292 = (v270 ^ 0x28) - 1298890913 - ((2 * (v270 ^ 0x28)) & 0x160);
  v293 = (uint64_t)*(&off_24DCDB210 + HIDWORD(v329) - 446);
  LODWORD(v328) = BYTE1(v278);
  LODWORD(v326) = *(_DWORD *)(v293 + 4 * (BYTE1(v278) ^ 0xDCu));
  v294 = *(_DWORD *)(v293 + 4 * (BYTE1(v287) ^ 0xF5u));
  v295 = BYTE1(v262);
  v296 = *(_DWORD *)(v293 + 4 * (BYTE1(v262) ^ 4u));
  v297 = BYTE1(v270);
  v298 = v289 ^ ((BYTE2(v262) ^ 0xC8) - 1644721593 - ((2 * (BYTE2(v262) ^ 0xC8)) & 0x8E));
  v299 = v290 ^ 0x92791D93 ^ v298;
  v298 ^= 0x3B8D228u;
  v300 = (v298 + v299 + 1) ^ ((v290 ^ 0x91C1CFBB) + 1);
  v301 = ((v290 ^ 0x8279286 ^ (v300 - ((2 * v300) & 0xCC334584) + 1712956098)) + v298) ^ v297;
  v302 = (char *)*(&off_24DCDB210 + (HIDWORD(v329) ^ 0x1A3)) - 4;
  HIDWORD(v325) = *(_DWORD *)&v302[4 * (v287 ^ 0xCD)];
  v303 = v262;
  v304 = *(_DWORD *)&v302[4 * (v262 ^ 0x9E)];
  v305 = *(_DWORD *)&v302[4 * ((v292 + 81) ^ 0xB2947F5F)];
  v306 = ((v301 ^ 0x50) - 1114597329 - ((2 * v301) & 0x7B21305E)) ^ *(_DWORD *)(v293 + 4 * (v297 ^ 0x68u));
  HIDWORD(v218) = v306 ^ 0x4F170;
  LODWORD(v218) = v306 ^ 0x93800000;
  LODWORD(v293) = v218 >> 19;
  LODWORD(v302) = ((v278 ^ 0x5721543A)
                 - 1080560557
                 + *(_DWORD *)&v302[4 * (v278 ^ 0xCA)]) ^ ((_DWORD)v293 << 19);
  v307 = (char *)*(&off_24DCDB210 + (HIDWORD(v329) ^ 0x1F7)) - 8;
  LOBYTE(v278) = v307[(v302 >> 24) ^ 0x3FLL];
  v280[12] = v278 ^ ((8 * v278) | 0xF0) ^ 0x3C;
  v308 = ((BYTE2(v287) ^ 0xFE) - 1644721593 - ((2 * (BYTE2(v287) ^ 0xFE)) & 0x8E)) ^ v288;
  LODWORD(v286) = v286 ^ ((v295 ^ 0x3C) - 1114597329 - ((2 * (v295 ^ 0x3C)) & 0x5E)) ^ v296 ^ (v308 - 2119377496 - ((2 * v308) & 0x359BB50)) ^ (((v292 + 81) ^ 0xE5B52BAF) - 1080560557 + v305);
  v309 = (char *)*(&off_24DCDB210 + HIDWORD(v329) - 397) - 4;
  v310 = v309[BYTE2(v286) ^ 0x92];
  HIDWORD(v218) = v310 ^ 0x18;
  LODWORD(v218) = v310 << 24;
  v280[9] = (v218 >> 31) ^ 0x14;
  v311 = v327 ^ ((HIDWORD(v327) ^ 0x16) - 1644721593 - ((2 * (HIDWORD(v327) ^ 0x16)) & 0x8E)) ^ 0x3B8D228;
  v312 = ((v303 ^ 0x5721546E) - 1080560557 + v304) ^ v294 ^ (v311
                                                           + (v291 ^ 0x6E3E3044)
                                                           - 2 * (v311 & (v291 ^ 0x6E3E3044)));
  v313 = v312 & 0xFFFEFFFF ^ ((BYTE1(v287) ^ 0xCD) - 1114597329 - 2 * ((BYTE1(v287) ^ 0xCD) & 0x3F ^ (v287 >> 8) & 0x10)) ^ (v312 & 0x10000 | 0xAE0CF50B);
  v314 = (char *)*(&off_24DCDB210 + HIDWORD(v329) - 194) - 8;
  v280[7] = (((v313 ^ 9) - ((2 * (v313 ^ 9) + 50) & 0x24) + 11) ^ v313 ^ v314[v313 ^ 0xE6] ^ 9)
          - ((2 * (((v313 ^ 9) - ((2 * (v313 ^ 9) + 50) & 0x24) + 11) ^ v313 ^ v314[v313 ^ 0xE6])) & 0xA0)
          - 48;
  LOBYTE(v312) = v307[HIBYTE(v313) ^ 0x8ELL];
  v280[*(_QWORD *)(v22 - 184)] = v312 ^ 0xD0 ^ (((8 * v312) | 0xF0) - ((2 * ((8 * v312) | 0xF0)) & 0x90) - 55);
  LOBYTE(v312) = v307[(v286 >> 24) ^ 9];
  v280[8] = v312 ^ 0x13 ^ (-118 - ((8 * v312) | 0xF0));
  v315 = ((v329 ^ 0x92) - 1644721593 - ((2 * (v329 ^ 0x92)) & 0x8E)) ^ HIDWORD(v328);
  v316 = (v315 - 2119377496 - ((2 * v315) & 0x359BB50)) ^ HIDWORD(v326);
  v317 = (HIDWORD(v325) + (v287 ^ 0x5721543D) - 1080560557) ^ v326 ^ (v316
                                                                                     - 1114597329
                                                                                     - ((2 * v316) & 0x7B21305E));
  LOBYTE(v307) = v307[HIBYTE(v317) ^ 0x8FLL];
  *v280 = v307 ^ 0xB6 ^ (((8 * (_BYTE)v307) | 0xF0) + 71);
  v318 = v302 ^ (v293 >> 13);
  LODWORD(v307) = v309[BYTE2(v318) ^ 0x62];
  HIDWORD(v218) = v307 ^ 0x18;
  LODWORD(v218) = (_DWORD)v307 << 24;
  v280[13] = (v218 >> 31) ^ 0x15;
  v280[*(_QWORD *)(v22 - 160)] = ((v314[(v302 ^ (v293 >> 13)) ^ 0x11] ^ ((v302 ^ (v293 >> 13) ^ 0xFE) - 7) ^ 0x12)
                                - ((2
                                  * (v314[(v302 ^ (v293 >> 13)) ^ 0x11] ^ ((v302 ^ (v293 >> 13) ^ 0xFE) - 7) ^ 0x12)) & 4)
                                - 126) ^ v302 ^ (v293 >> 13) ^ 0x38;
  v319 = (char *)*(&off_24DCDB210 + (HIDWORD(v329) ^ 0x1D2)) - 12;
  LODWORD(v307) = v319[BYTE1(v318) ^ 0xD3];
  v280[*(_QWORD *)(v22 - 152)] = v307 ^ 0xE2 ^ (((v307 >> 4) ^ (v307 >> 3) ^ 4)
                                                               + ((2
                                                                 * (((v307 >> 4) ^ (v307 >> 3) ^ 4 | 0x7A) ^ (v307 >> 4) ^ (v307 >> 3))) ^ 3)
                                                               - 5);
  v280[11] = v286 ^ ((v286 ^ 0x56)
                                    - ((2 * (v286 ^ 0x56) + 50) & 0x24)
                                    + 11) ^ 0xA4 ^ v314[v286 ^ 0xB9];
  LODWORD(v307) = v319[BYTE1(v313) ^ 0xC6];
  v280[*(_QWORD *)(v22 - 136)] = v307 ^ (((v307 >> 4) ^ (v307 >> 3) ^ 4)
                                                        - 2
                                                        * (((v307 >> 4) ^ (v307 >> 3) ^ 4) & 0xF7 ^ ((v307 >> 4) ^ (v307 >> 3)) & 1)
                                                        + 86) ^ 0xBB;
  LODWORD(v307) = v319[BYTE1(v286) ^ 0x14];
  v280[*(_QWORD *)(v22 - 176)] = v307 ^ (((v307 >> 4) ^ (v307 >> 3) ^ 4)
                                                        - ((2 * ((v307 >> 4) ^ (v307 >> 3))) & 0x34)
                                                        + 90) ^ 0xCF;
  v280[*(_QWORD *)(v22 - 128)] = v317 ^ v328 ^ ((v317 ^ v328 ^ 0xB1) - ((2 * (v317 ^ v328 ^ 0xB1) + 50) & 0x24) + 11) ^ 0x21 ^ v314[(v317 ^ v328) ^ 0x5ELL];
  LODWORD(v307) = v309[BYTE2(v313) ^ 0x44];
  HIDWORD(v218) = v307 ^ 0x18;
  LODWORD(v218) = (_DWORD)v307 << 24;
  v280[*(_QWORD *)(v22 - 168)] = (v218 >> 31) ^ 0x5D;
  LODWORD(v307) = v319[BYTE1(v317) ^ 0xD7];
  v280[2] = v307 ^ 0x72 ^ (((v307 >> 4) ^ (v307 >> 3) ^ 4)
                                          - 2
                                          * (((v307 >> 4) ^ (v307 >> 3) ^ 4) & 0xF7 ^ ((v307 >> 4) ^ (v307 >> 3)) & 2)
                                          + 21);
  LODWORD(v307) = v309[BYTE2(v317) ^ 0x2FLL];
  HIDWORD(v218) = v307 ^ 0x18;
  LODWORD(v218) = (_DWORD)v307 << 24;
  v280[*(_QWORD *)(v22 - 144)] = (v218 >> 31) ^ 0x13;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, char *, _QWORD, uint64_t, _QWORD, _BYTE *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a20 + 8 * ((642 * (HIDWORD(a13) > 0x10)) ^ HIDWORD(v329))) - 8))(v318, 19, 3180369967, v314, 0, 146, HIDWORD(v329), v280, a9, a10, a11, a12, a13, v321, v30, v322, v323, a18, v324,
           a20,
           v325,
           v326,
           v327,
           v328,
           v329);
}

void sub_21A5B12C0()
{
  JUMPOUT(0x21A5ADDD4);
}

uint64_t sub_21A5B134C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, int a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20)
{
  uint64_t v20;

  return (*(uint64_t (**)(void))(v20
                              + 8
                              * (a20 ^ (342
                                      * (((2 * (a12 - (a14 & 0x1113FAA2) + 1740566325)) & 0xBADFBBFE ^ 0x1013BAA2)
                                       + ((a12 - (a14 & 0x1113FAA2) + 1740566325) ^ 0xD5E620AE)
                                       - 1493455336 != 74157079)))))();
}

uint64_t sub_21A5B1408(int a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((((((a1 + v2 - 1567612415) < 8) ^ (v1 + 16)) & 1)
                                * (((v1 - 423) | 4) + 1397)) ^ v1)))();
}

uint64_t sub_21A5B149C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, int a7)
{
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v7
                                                               + 8
                                                               * (int)((((a7 & 0xFFFFFFF0) == (a5 ^ 0x5D6FDF4C)) | (2 * ((a7 & 0xFFFFFFF0) == (a5 ^ 0x5D6FDF4C)))) ^ a5))
                                                   - (a5 ^ 0x144)))(a1, a2);
}

uint64_t sub_21A5B14E4(int a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _BOOL4 v27;
  int v29;
  int v31;

  v16 = a3 - 461 + a1 + v13 + (a3 ^ 0x18 ^ (a2 + 599));
  v17 = v16 + a10 - 0xD92FECD24D1EDFELL + 1;
  v18 = (a1 + v13) & 0xF;
  v19 = v10 + v18 - v16;
  v20 = v10 + v18 + 1;
  v21 = v12 + v18 - v16;
  v22 = v12 + v18 + 1;
  v23 = v11 + v18 + 1 - v16;
  v24 = v18 + v11 + 2;
  v25 = *(_QWORD *)(v14 - 120);
  v27 = v25 < v20 && v19 < v17;
  v29 = v25 < v22 && v21 < v17 || v27;
  if (v25 >= v24 || v23 >= v17)
    v31 = v29;
  else
    v31 = 1;
  return (*(uint64_t (**)(void))(v15 + 8 * ((507 * (v31 ^ 1)) ^ a3)))();
}

uint64_t sub_21A5B1590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v7;
  uint64_t v8;

  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v8
                                                                       + 8
                                                                       * ((114 * (v7 < ((186 * (a7 ^ 0x121)) ^ 0x23Eu))) ^ a7))
                                                           - ((253 * (a7 ^ 0x121u)) ^ 0x2F3)))(a1, a2, 0);
}

uint64_t sub_21A5B15DC(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16x4_t v17;
  int8x16x4_t v18;

  v17.val[1].i64[0] = ((_BYTE)v7 + 6) & 0xF;
  v17.val[1].i64[1] = ((_BYTE)v7 + 5) & 0xF;
  v17.val[2].i64[0] = ((_BYTE)v7 + 4) & 0xF;
  v17.val[2].i64[1] = ((_BYTE)v7 + 3) & 0xF;
  v17.val[3].i64[0] = ((_BYTE)v7 + 2) & 0xF;
  v17.val[3].i64[1] = ((_BYTE)v7 + 1) & 0xF;
  v12 = a1 + v9 + a2 + a4;
  v13.i64[0] = 0x7F7F7F7F7F7F7F7FLL;
  v13.i64[1] = 0x7F7F7F7F7F7F7F7FLL;
  v17.val[0].i64[0] = v12 & 0xF;
  v17.val[0].i64[1] = ((_BYTE)v7 + 7) & 0xF;
  v14.i64[0] = vqtbl4q_s8(v17, (int8x16_t)xmmword_21A5D5130).u64[0];
  v18.val[0].i64[1] = ((_BYTE)v7 - 1) & 0xF;
  v18.val[1].i64[1] = ((_BYTE)v7 + 13) & 0xF;
  v18.val[2].i64[1] = (v7 + 11) & 0xF;
  v18.val[3].i64[1] = (v7 + 9) & 0xF;
  v18.val[0].i64[0] = v7 & 0xF;
  v18.val[1].i64[0] = ((_BYTE)v7 + 14) & 0xF;
  v18.val[2].i64[0] = ((_BYTE)v7 + 12) & 0xF;
  v18.val[3].i64[0] = (v7 + 10) & 0xF;
  v14.i64[1] = vqtbl4q_s8(v18, (int8x16_t)xmmword_21A5D5130).u64[0];
  v15 = vrev64q_s8(vmulq_s8(v14, v13));
  *(int8x16_t *)(*(_QWORD *)(v10 - 120) - 15 + v12) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v4 + v17.val[0].i64[0] - 15), *(int8x16_t *)(*(_QWORD *)(v10 - 120) - 15 + v12)), veorq_s8(*(int8x16_t *)(v6 + v17.val[0].i64[0] - 15), *(int8x16_t *)(v17.val[0].i64[0] + v5 - 14))), vextq_s8(v15, v15, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((1545 * ((v8 & 0xFFFFFFF0) == 16)) ^ a4)) - 4))();
}

void sub_21A5B1730()
{
  JUMPOUT(0x21A5B16BCLL);
}

uint64_t sub_21A5B173C(uint64_t a1, uint64_t a2, int a3, int a4)
{
  int v4;
  uint64_t v5;

  return (*(uint64_t (**)(void))(v5
                              + 8 * ((53 * (((v4 == a3) ^ (a4 + 34 + a4 + 19)) & 1)) ^ (a4 - 493))))();
}

uint64_t sub_21A5B176C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  char v8;
  uint64_t v9;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v9
                                                                                + 8
                                                                                * ((911
                                                                                  * ((v8 & 8) == (((23 * (a7 ^ 0x171) - 1) | 1) ^ 0x2F7))) ^ a7))
                                                                    - 4))(a1, a2, a3, (v7 - a3));
}

uint64_t sub_21A5B17B4(int a1, int a2, int a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  int v24;
  char v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  char v31;
  uint64_t v32;
  int8x16x4_t v34;

  *(_DWORD *)(v28 - 128) = v27;
  *(_DWORD *)(v28 - 136) = v24;
  v29 = *(_QWORD *)(v28 - 120) - 7;
  *(_DWORD *)(v28 - 144) = v24 & 0xFFFFFFF8;
  v30 = -8 - a3;
  v31 = v25 + a1 + v26;
  v32 = (a2 + a1 + v26 + 558 + v30 + 8);
  v34.val[0].i64[0] = ((_BYTE)a2 + (_BYTE)a1 + (_BYTE)v26 + 46 + (_BYTE)v30 + 8) & 0xF;
  v34.val[0].i64[1] = (v23 + (_BYTE)v30 + (_BYTE)a5 + 8) & 0xF;
  v34.val[1].i64[0] = (v31 + 6 + (_BYTE)v30 + 8) & 0xF;
  v34.val[1].i64[1] = (v31 + 5 + (_BYTE)v30 + 8) & 0xF;
  v34.val[2].i64[0] = (v31 + 4 + (_BYTE)v30 + 8) & 0xF;
  v34.val[2].i64[1] = (v31 + 3 + (_BYTE)v30 + 8) & 0xF;
  v34.val[3].i64[0] = (v31 + 2 + (_BYTE)v30 + 8) & 0xF;
  v34.val[3].i64[1] = (v31 + 1 + (_BYTE)v30 + 8) & 0xF;
  *(int8x8_t *)(v29 + v32) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v20 + (v32 & 0xF) - 7), *(int8x8_t *)(v29 + v32)), veor_s8(*(int8x8_t *)(v22 + (v32 & 0xF) - 7), *(int8x8_t *)((v32 & 0xF) + v21 - 6))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v34, (int8x16_t)xmmword_21A5D5140), (int8x8_t)0x7F7F7F7F7F7F7F7FLL)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a20 + 8 * ((709 * (-(v24 & 0xFFFFFFF8) == v30)) ^ (a5 - 569)))
                                         - 4))((__n128)xmmword_21A5D5140);
}

void sub_21A5B190C()
{
  JUMPOUT(0x21A5B181CLL);
}

uint64_t sub_21A5B1914@<X0>(unsigned int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (int)(a1 ^ (43 * (*(_DWORD *)(v1 - 136) == *(_DWORD *)(v1 - 144)))))
                            - (a1 ^ 0xFFFFFFFFFFFFFC5DLL)
                            - ((a1 - 605380949) & 0x241562FF)))();
}

uint64_t sub_21A5B1970(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = (a4 - 74157080);
  *(_BYTE *)(*(_QWORD *)(v10 - 120) + v12) ^= *(_BYTE *)(v7 + (v12 & 0xF)) ^ *(_BYTE *)(v9 + (v12 & 0xF)) ^ *(_BYTE *)((v12 & 0xF) + v8 + 1) ^ (127 * (v12 & 0xF));
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((1674 * (a4 - 1 == v6)) ^ (a6 + 5))) - 4))();
}

void sub_21A5B19DC()
{
  int v0;
  int v1;
  uint64_t v2;

  if (v0 == 1514319483)
    v1 = 1412947868;
  else
    v1 = 1412905844;
  *(_DWORD *)(v2 + 8) = v1;
}

void sub_21A5B1A40(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 40) - 1613850677 * (((a1 | 0x1457FFDB) - (a1 & 0x1457FFDB)) ^ 0x290C91DC);
  __asm { BR              X16 }
}

uint64_t sub_21A5B1BA0()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((v0 & 0x1D6C33F7 ^ 0x14B ^ ((v0 & 0x1D6C33F7) + 85) ^ 0x4E1)
                                          * (((2 * v1) & 0xEF09BE78 ^ 0xAF082250) + (v1 ^ 0x2028EE15) + 754712312 != 612425268)) ^ v0 & 0x1D6C33F7u))
                            - 12))();
}

uint64_t sub_21A5B1C1C(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * (((((a6 + 101918309) & 0x39ECDB77) - 135)
                                          * ((a2 + a1 + 142287044) > 7)) ^ a6))
                            - 12))();
}

uint64_t sub_21A5B1C74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, int a8)
{
  uint64_t v8;
  uint64_t v9;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9
                                                                                          + 8
                                                                                          * (((a6 - 402)
                                                                                            * ((a4 + a8 - 16) < 0xFFFFFFF0)) ^ (a6 + 568)))
                                                                              - ((a6 + 477) ^ 0x37FLL)))(a1, a2, a3, a4, v8);
}

uint64_t sub_21A5B1CB0(int a1, int a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v25;

  v14 = a6 + 8;
  v15 = 62 * ((a6 + 8) ^ 0x3CAu);
  v16 = a10 - 0x7B38945B24F3D709 + (a2 + a1 + a4) + 886;
  v17 = a3 - (a10 - 0x7B38945B24F3D393) - 0x1277B03DBA8BFA3ELL;
  v18 = ((_BYTE)a2 + (_BYTE)a1 + (_BYTE)a4) & 0xF;
  v19 = v18 + v10 - v16;
  v20 = (v18 | v11) - v16;
  v21 = (v18 | v12) - v16;
  v25 = v19 > 0xF
     && v17 >= v15 + (v14 ^ 0xFFFFFFFFFFFFFFEALL)
     && (unint64_t)(v20 + 5) > 0xF
     && (unint64_t)(v21 + 2) > 0xF;
  return ((uint64_t (*)(void))(*(_QWORD *)(v13 + 8 * ((1920 * v25) ^ v14)) - 8))();
}

uint64_t sub_21A5B1D70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  unsigned int v8;
  uint64_t v9;

  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v9 + 8 * (a8 ^ (21 * (v8 > 0xF))))
                                                           - ((a8 - 400) ^ (a8 - 76) ^ 0x1C8)))(a1, a2, 0);
}

uint64_t sub_21A5B1DA8(int a1, int a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  int v54;
  uint64_t v55;
  unsigned int v56;
  int8x16_t v57;
  uint64_t v58;
  int8x16_t v59;
  int8x16_t v60;
  int8x16x4_t v62;
  int8x16x4_t v63;

  v62.val[1].i64[0] = ((_BYTE)v53 + 9) & 0xF;
  v62.val[1].i64[1] = ((_BYTE)v53 + 8) & 0xF;
  v62.val[2].i64[0] = ((_BYTE)v53 + 7) & 0xF;
  v62.val[2].i64[1] = ((_BYTE)v53 + 6) & 0xF;
  v62.val[3].i64[0] = ((_BYTE)v53 + 5) & 0xF;
  v62.val[3].i64[1] = ((_BYTE)v53 + 4) & 0xF;
  v56 = a2 + a1 + a4;
  v57.i64[0] = 0x5D5D5D5D5D5D5D5DLL;
  v57.i64[1] = 0x5D5D5D5D5D5D5D5DLL;
  v58 = v56 & ((a5 - 383) - 194);
  v62.val[0].i64[0] = v58;
  v62.val[0].i64[1] = ((_BYTE)v53 + 10) & 0xF;
  v59.i64[0] = vqtbl4q_s8(v62, (int8x16_t)xmmword_21A5D5130).u64[0];
  v63.val[0].i64[1] = ((_BYTE)v53 + 2) & 0xF;
  v63.val[1].i64[1] = v53 & 0xF;
  v63.val[2].i64[1] = (v53 + 14) & 0xF;
  v63.val[3].i64[1] = ((_BYTE)v53 + 12) & 0xF;
  v63.val[0].i64[0] = ((_BYTE)v53 + 3) & 0xF;
  v63.val[1].i64[0] = ((_BYTE)v53 + 1) & 0xF;
  v63.val[2].i64[0] = ((_BYTE)v53 - 1) & 0xF;
  v63.val[3].i64[0] = (v53 + 13) & 0xF;
  v59.i64[1] = vqtbl4q_s8(v63, (int8x16_t)xmmword_21A5D5130).u64[0];
  v60 = vrev64q_s8(vmulq_s8(v59, v57));
  *(int8x16_t *)(v55 - 15 + v56) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v50 + v58 - 15), *(int8x16_t *)(v49 - 15 + v56)), veorq_s8(*(int8x16_t *)(v58 + v51 - 10), *(int8x16_t *)(v58 + v52 - 13))), vextq_s8(v60, v60, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a49 + 8 * ((63 * ((v54 & 0xFFFFFFF0) == 16)) ^ a5)) - 12))();
}

void sub_21A5B1F00()
{
  JUMPOUT(0x21A5B1E80);
}

uint64_t sub_21A5B1F0C()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * (v0 ^ (466 * (v1 != 0xD7AC3129)))) - 12))(1599630943);
}

uint64_t sub_21A5B1F68(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  _BOOL4 v16;

  v12 = v7 > 0xE348FBA;
  *(_BYTE *)(v11 + (a1 - 1599630943)) = *(_BYTE *)(v2 + ((a1 - 1599630943) & 0xFLL)) ^ *(_BYTE *)(v1 + (a1 - 1599630943)) ^ *(_BYTE *)(((a1 - 1599630943) & 0xFLL) + v3 + 5) ^ *(_BYTE *)(((a1 - 1599630943) & 0xFLL) + v4 + 2) ^ (93 * ((a1 - 95) & 0xF));
  v13 = ((147 * (v5 ^ 0xD3)) ^ 0x927300C1) + a1;
  v14 = (a1 + 1);
  v15 = v12 ^ (v13 < v6 + 294);
  v16 = v13 < v8;
  if (!v15)
    v12 = v16;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v10 + 8 * ((v12 * v9) ^ v5)) - 12))(v14);
}

uint64_t sub_21A5B2014(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v5 + 8 * (v4 ^ (536 * (v3 != a3))))
                                                   - ((v4 - 850300154) & 0x32AE8EBA)
                                                   - ((v4 - 1678853930) & 0x6411477E ^ 0xFFFFFFFFFFFFFC5CLL)))(a1, a2);
}

uint64_t sub_21A5B2078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  int v8;
  uint64_t v9;

  return (*(uint64_t (**)(void))(v9 + 8 * ((13 * ((((a8 + 229) ^ 0x37F) & v8) == 0)) | a8)))();
}

uint64_t sub_21A5B20AC@<X0>(char a1@<W0>, char a2@<W1>, int a3@<W2>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45)
{
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int v49;
  int v50;
  int v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  unsigned int v55;
  int v56;
  char v57;
  uint64_t v58;
  int8x16x4_t v60;

  *(_DWORD *)(v53 - 152) = v51;
  v55 = v51 & 0xFFFFFFF8;
  *(_QWORD *)(v53 - 144) = v54 - 7;
  *(_QWORD *)(v53 - 136) = v45 - 7;
  *(_DWORD *)(v53 - 160) = v55;
  *(_DWORD *)(v53 - 148) = 8 - v55;
  v56 = -a3;
  v57 = v52 + a2 + a1;
  v58 = v50 + v56 + ((a4 - 707) ^ v49);
  v60.val[0].i64[0] = ((_BYTE)v50 + (_BYTE)v56 + ((a4 + 61) ^ v49)) & 0xF;
  v60.val[0].i64[1] = (v57 + 10 + (_BYTE)v56) & 0xF;
  v60.val[1].i64[0] = (v57 + 9 + (_BYTE)v56) & 0xF;
  v60.val[1].i64[1] = (v57 + 8 + (_BYTE)v56) & 0xF;
  v60.val[2].i64[0] = (v57 + 7 + (_BYTE)v56) & 0xF;
  v60.val[2].i64[1] = (v57 + 6 + (_BYTE)v56) & 0xF;
  v60.val[3].i64[0] = (v57 + 5 + (_BYTE)v56) & 0xF;
  v60.val[3].i64[1] = (v57 + 4 + (_BYTE)v56) & 0xF;
  *(int8x8_t *)(*(_QWORD *)(v53 - 144) + v58) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v46 + (v58 & 0xF) - 7), *(int8x8_t *)(*(_QWORD *)(v53 - 136) + v58)), veor_s8(*(int8x8_t *)((v58 & 0xF) + v47 - 2), *(int8x8_t *)((v58 & 0xF) + v48 - 5))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v60, (int8x16_t)xmmword_21A5D5140), (int8x8_t)0x5D5D5D5D5D5D5D5DLL)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a45 + 8 * ((42 * (*(_DWORD *)(v53 - 148) == v56)) | a4)) - 8))((__n128)xmmword_21A5D5140);
}

void sub_21A5B21F8()
{
  JUMPOUT(0x21A5B2114);
}

uint64_t sub_21A5B2204(int a1)
{
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((((a1 + 678) ^ 0x23C) * (*(_DWORD *)(v2 - 152) != *(_DWORD *)(v2 - 160))) ^ a1))
                            - 12))();
}

uint64_t sub_21A5B2240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = (v12 + a5 + 177);
  *(_BYTE *)(v14 + v15) = *(_BYTE *)(v8 + (v15 & 0xF)) ^ *(_BYTE *)(v7 + v15) ^ *(_BYTE *)((v15 & 0xF) + v9 + 5) ^ (93 * (v15 & 0xF)) ^ *(_BYTE *)(v10 + (v15 & 0xF) + ((3 * (a7 ^ 0x315u)) ^ 0x124));
  return (*(uint64_t (**)(void))(v13 + 8 * ((1429 * (a5 - 1 == v11)) ^ (a7 - 465))))();
}

uint64_t sub_21A5B22B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41)
{
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int8x16_t v45;

  v45 = veorq_s8(*(int8x16_t *)(*(_QWORD *)(v41 + 8) - 0x20E72904F2E02B47), (int8x16_t)xmmword_21A5D51C0);
  *(int8x16_t *)(v43 - 128) = veorq_s8(*(int8x16_t *)(*(_QWORD *)(v41 + 16) - 0x2916790907C2B255), (int8x16_t)xmmword_21A5D51B0);
  *(int8x16_t *)(v43 - 112) = v45;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 + 8 * (int)(a4 ^ (863 * (v44 != 0)))) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41);
}

uint64_t sub_21A5B2344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,int a50)
{
  uint64_t v50;
  int v51;
  _BOOL4 v53;

  v51 = HIDWORD(a13) - ((a50 ^ 0x1CBA903E) & (2 * HIDWORD(a13) + 520585566)) - 304018983;
  v53 = ((((2 * v51) ^ 0x54) + (v51 ^ 0xD5) + 1) & 0xF) == 0
     && ((2 * v51) & 0xFBBFDBFE ^ 0x18BA9254) + (v51 ^ 0x7382A4D5) != (((_DWORD)a4 + 1469090504) & 0xA86F77DF ^ 0x7DDFEE31);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 + 8 * (int)((122 * v53) ^ a4)) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41);
}

uint64_t sub_21A5B23FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,unsigned __int8 *a47,uint64_t a48,uint64_t a49)
{
  int v49;
  int v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  int v57;
  unsigned __int8 v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  char v62;
  char *v63;
  uint64_t v64;
  char v65;
  unsigned __int8 v66;
  int v67;
  char v68;
  unsigned __int8 v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  unint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  char *v86;
  unsigned __int8 v87;
  unsigned int v88;
  char *v89;
  int v90;
  int v91;
  char *v92;
  uint64_t v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  unint64_t v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  unsigned int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  unsigned int v120;
  unsigned int v121;
  unsigned int v122;
  int v123;
  int v124;
  unsigned int v125;
  int v126;
  int v127;
  unsigned int v128;
  unsigned int v129;
  unsigned int v130;
  int v131;
  unsigned int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  unsigned int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  unsigned int v144;
  unsigned int v145;
  unsigned int v146;
  int v147;
  int v148;
  int v149;
  int v150;
  int v151;
  unsigned int v152;
  unsigned int v153;
  unsigned int v154;
  int v155;
  int v156;
  int v157;
  unsigned int v158;
  int v159;
  unsigned int v160;
  int v161;
  int v162;
  int v163;
  int v164;
  int v165;
  unsigned int v166;
  int v167;
  unsigned int v168;
  int v169;
  int v170;
  int v171;
  int v172;
  int v173;
  int v174;
  unsigned int v175;
  int v176;
  int v177;
  int v178;
  int v179;
  int v180;
  int v181;
  unsigned int v182;
  int v183;
  int v184;
  int v185;
  int v186;
  unint64_t v187;
  int v188;
  int v189;
  unsigned int v190;
  int v191;
  int v192;
  char *v193;
  unsigned int v194;
  int v195;
  char *v196;
  int v197;
  int v198;
  uint64_t v199;
  char v200;
  unsigned int v201;
  unsigned int v202;
  uint64_t v203;
  unsigned int v204;
  char *v205;
  unsigned int v206;
  unsigned int v207;
  unsigned int v208;
  int v209;
  int v210;
  int v211;
  unint64_t v212;
  int v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  int v217;
  uint64_t v218;
  int v219;
  uint64_t v220;
  int v221;
  uint64_t v222;
  int v223;
  uint64_t v224;
  int v225;
  int v226;
  int v227;
  uint64_t v228;
  uint64_t v229;
  unsigned int v230;
  unsigned int v231;
  unsigned int v232;
  char *v233;
  int v234;
  unsigned int v235;
  int v236;
  char *v237;
  char *v238;
  char *v239;
  int v240;
  unsigned int v241;
  unsigned int v242;
  int v243;
  unsigned int v244;
  unsigned int v245;
  int v246;
  int v247;
  int v248;
  int v249;
  unsigned int v250;
  int v251;
  unsigned int v252;
  unsigned int v253;
  unsigned int v254;
  int v255;
  unsigned int v256;
  int v257;
  int v258;
  int v259;
  unsigned int v260;
  unsigned int v261;
  unsigned int v262;
  unsigned int v263;
  unsigned int v264;
  unsigned int v265;
  int v266;
  int v267;
  unsigned int v268;
  int v269;
  unsigned int v270;
  int v271;
  unsigned int v272;
  unsigned int v273;
  unsigned int v274;
  unsigned int v275;
  unsigned int v276;
  int v277;
  unsigned int v278;
  unsigned int v279;
  int v280;
  int v281;
  int v282;
  BOOL v283;
  int v284;
  int v285;
  unsigned int v286;
  unsigned int v287;
  unsigned int v288;
  int v289;
  unsigned int v290;
  int v291;
  unsigned int v292;
  int v293;
  unsigned int v294;
  unsigned int v295;
  int v296;
  int v297;
  unsigned int v298;
  int v299;
  int v300;
  unsigned int v301;
  int v302;
  int v303;
  unsigned int v304;
  int v305;
  int v306;
  unsigned int v307;
  int v308;
  unsigned int v309;
  unsigned int v310;
  unsigned int v311;
  int v312;
  unsigned int v313;
  int v314;
  int v315;
  unsigned int v316;
  unsigned int v317;
  int v318;
  unsigned int v319;
  unsigned int v320;
  int v321;
  int v322;
  int v323;
  unsigned int v324;
  int v325;
  int v326;
  int v327;
  int v328;
  unsigned int v329;
  int v330;
  int v331;
  unsigned int v332;
  unsigned int v333;
  unsigned int v334;
  unsigned int v335;
  unsigned int v336;
  unsigned int v337;
  int v338;
  unsigned int v339;
  int v340;
  unsigned int v341;
  unsigned int v342;
  int v343;
  unsigned int v344;
  int v345;
  unsigned int v346;
  int v347;
  unsigned int v348;
  int v349;
  unsigned int v350;
  unsigned int v351;
  int v352;
  int v353;
  int v354;
  int v355;
  unsigned int v356;
  int v357;
  int v358;
  int v359;
  int v360;
  int v361;
  unsigned int v362;
  unsigned int v363;
  unsigned int v364;
  unsigned int v365;
  char *v366;
  int v367;
  char *v368;
  uint64_t v369;
  unint64_t v370;
  int v371;
  unsigned int v372;
  unsigned int v373;
  int v374;
  uint64_t v375;
  int v376;
  int v377;
  int v378;
  char *v379;
  int v380;
  int v381;
  int v382;
  uint64_t v383;
  int v384;
  char *v385;
  int v386;
  uint64_t v387;
  char *v388;
  char *v389;
  int v390;
  int v391;
  char *v392;
  uint64_t v393;
  _BOOL4 v394;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  char *v405;
  uint64_t v406;
  char *v407;
  char *v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  unint64_t v415;
  uint64_t v416;
  unint64_t v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  unint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  unint64_t v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  _BOOL4 v429;

  v52 = (char *)*(&off_24DCDB210 + (v50 ^ 0x3A8)) - 12;
  v53 = v52[*(unsigned __int8 *)(v51 - 112) ^ 0x63];
  v54 = *(unsigned __int8 *)(v51 - 111);
  *(_DWORD *)(v51 - 136) = v49;
  v55 = v54 ^ 0x43;
  v56 = (char *)*(&off_24DCDB210 + (v50 & 0xAD3645A)) - 8;
  v57 = v50;
  v58 = v56[v55] - 2 * ((v56[v55] + 6) & 7 ^ v56[v55] & 1) + 76;
  v59 = *(unsigned __int8 *)(v51 - 110);
  v60 = (uint64_t)*(&off_24DCDB210 + v57 - 788);
  v61 = *(unsigned __int8 *)(v60 + (v59 ^ 0x86));
  v62 = v59 - ((2 * v59) & 0xF8);
  v63 = (char *)*(&off_24DCDB210 + (int)(v57 & 0xC5EE54CD)) - 8;
  v64 = v63[*(unsigned __int8 *)(v51 - 109) ^ 0xFBLL];
  *(_QWORD *)(v51 - 160) = v52[*(unsigned __int8 *)(v51 - 108) ^ 0x12];
  v65 = v56[*(unsigned __int8 *)(v51 - 107) ^ 0xB6];
  v66 = v65 - 2 * ((v65 + 70) & 0x43 ^ v65 & 1) + 8;
  v67 = (*(_BYTE *)(v51 - 106) - ((2 * *(_BYTE *)(v51 - 106)) & 0xF8) - 4) ^ *(unsigned __int8 *)(v60 + (*(unsigned __int8 *)(v51 - 106) ^ 0x8DLL));
  *(_QWORD *)(v51 - 168) = v63[*(unsigned __int8 *)(v51 - 105) ^ 0xC2];
  *(_QWORD *)(v51 - 144) = v52[*(unsigned __int8 *)(v51 - 104) ^ 0xDALL];
  v68 = v56[*(unsigned __int8 *)(v51 - 103) ^ 0x88];
  v69 = v68 - ((2 * v68 - 116) & 0xBC) - 92;
  v70 = (~v69 >> 5) ^ ((v69 & 0xF0) >> 4);
  *(_DWORD *)(v51 - 176) = v70 - ((2 * v70) & 0x1C);
  v71 = *(unsigned __int8 *)(v51 - 102);
  *(_DWORD *)(v51 - 184) = *(unsigned __int8 *)(v60 + (v71 ^ 0x8E));
  *(_DWORD *)(v51 - 192) = v71 + (~(2 * v71) | 7);
  v72 = v52[*(unsigned __int8 *)(v51 - 100) ^ 0x3CLL];
  LOBYTE(v56) = v56[*(unsigned __int8 *)(v51 - 99) ^ 0xD3];
  LOBYTE(v56) = (_BYTE)v56 - ((2 * (_BYTE)v56 + 12) & 0x6A) + 123;
  LODWORD(v71) = (v56 >> 5) ^ (v56 >> 4);
  v73 = *(unsigned __int8 *)(v51 - 98);
  LODWORD(v60) = *(unsigned __int8 *)(v60 + (v73 ^ 4));
  v74 = *(unsigned __int8 *)(v51 - 97) ^ 0x81;
  *(_QWORD *)(v51 - 200) = v63[*(unsigned __int8 *)(v51 - 101) ^ 0xB9];
  v75 = v63[v74];
  v76 = (char *)*(&off_24DCDB210 + (v57 & 0x3B1E38AA)) - 12;
  LODWORD(v72) = *(_DWORD *)&v76[4 * (v72 ^ 6)];
  LODWORD(v60) = v60 ^ (v73 - ((2 * v73) & 0xF8) - 4);
  HIDWORD(v77) = v72 ^ 0xAAAAAAAA;
  LODWORD(v77) = v72 ^ 0xAC85C310;
  LODWORD(v72) = v77 >> 4;
  v78 = (uint64_t)*(&off_24DCDB210 + v57 - 685);
  LODWORD(v56) = *(_DWORD *)(v78
                           + 4
                           * (v56 ^ 0x95u ^ ((v71 ^ 2) - ((2 * v71) & 0xAA) + 53)));
  HIDWORD(v77) = v56 ^ 0xFFFFFFFD;
  LODWORD(v77) = v56 ^ 0x1333C28;
  v79 = (char *)*(&off_24DCDB210 + v57 - 911) - 8;
  LODWORD(v73) = ((2 * v72) | 0x158F5F90) ^ v72 ^ *(_DWORD *)&v79[4 * (v60 ^ 0xFC)] ^ ((v60 ^ 0x50) - 2 * ((v60 ^ 0xB8A450) & 0xF7 ^ v60 & 1) - 1255564298) ^ (v77 >> 3) ^ (4 * (v77 >> 3) - 583066664);
  v80 = (char *)*(&off_24DCDB210 + (v57 ^ 0x342)) - 8;
  v81 = v80[v75 ^ 0xAD] ^ 0xC6;
  LODWORD(v53) = *(_DWORD *)&v76[4 * (v53 ^ 0xBC)];
  HIDWORD(v77) = v53 ^ 0xAAAAAAAA;
  LODWORD(v77) = v53 ^ 0xAC85C310;
  LODWORD(v53) = v77 >> 4;
  v82 = (v62 - 4) ^ 0xDF148C ^ v61;
  v83 = *(_DWORD *)(v78
                  + 4
                  * ((v58 ^ (((v58 >> (v57 + 55)) ^ (v58 >> 4))
                                            - ((2 * ((v58 >> (v57 + 55)) ^ (v58 >> 4))) & 0xC)
                                            + 6)) ^ 0x22u));
  HIDWORD(v77) = v83 ^ 0xFFFFFFFD;
  LODWORD(v77) = v83 ^ 0x1333C28;
  v84 = v77 >> 3;
  v85 = (4 * v84 - 583066664) ^ ((2 * v53) | 0x158F5F90);
  LODWORD(v72) = v80[v64 ^ 0xA9] ^ *(_DWORD *)&v79[4 * (v82 - ((2 * v82) & 0x1AA))
                                                                  + 852] ^ v82 ^ v53 ^ v84 ^ (v85 - ((2 * v85) & 0x6A5337EC) - 1255564298);
  *(_DWORD *)(v51 - 152) = v72;
  v86 = (char *)*(&off_24DCDB210 + v57 - 781) - 12;
  LODWORD(v64) = v86[BYTE3(v73) ^ 0xD7];
  HIDWORD(v77) = v64 ^ 0x3C;
  LODWORD(v77) = ~(_DWORD)v64 << 24;
  v87 = (2 * (v77 >> 31) - 110) ^ (v77 >> 31);
  v88 = (v81 - ((2 * v81) & 0x1CA) - 2132748827) ^ v73;
  v89 = (char *)*(&off_24DCDB210 + (v57 ^ 0x3EB)) - 4;
  v90 = BYTE1(v88) ^ 4;
  v91 = *(_DWORD *)&v89[4 * (BYTE1(v88) ^ 0x97)] ^ v90;
  *(_DWORD *)(v51 - 148) = v57;
  v92 = (char *)*(&off_24DCDB210 + (v57 ^ 0x2FC)) - 8;
  v93 = (uint64_t)*(&off_24DCDB210 + v57 - 734);
  v94 = *(_DWORD *)(v93 + 4 * (v88 ^ 0x65u)) + 951837053;
  LODWORD(v427) = v72 ^ 0xC6;
  v95 = *(_DWORD *)&v76[4 * (*(_QWORD *)(v51 - 160) ^ 0x62)];
  HIDWORD(v77) = v95 ^ 0xAAAAAAAA;
  LODWORD(v77) = v95 ^ 0xAC85C310;
  v96 = v77 >> 4;
  v97 = *(_DWORD *)(v78
                  + 4
                  * (v66 ^ 0x21u ^ (((v66 >> 5) ^ (v66 >> 4) ^ 0xA)
                                                   - 2
                                                   * (((v66 >> 5) ^ (v66 >> 4) ^ 0xA) & 3 ^ ((v66 >> 5) ^ (v66 >> 4)) & 1)
                                                   - 62)));
  v98 = v91 ^ v94 ^ (-1971387019 * *(_DWORD *)&v92[4 * (BYTE2(v73) ^ 0x3D)] - 103871229) ^ (8 * v94) ^ (v90 - ((2 * v90 + 1684359896) & 0x64404EFE) + 1897323755) ^ v72 ^ 0xC6 ^ v87;
  HIDWORD(v77) = v97 ^ 0xFFFFFFFD;
  LODWORD(v77) = v97 ^ 0x1333C28;
  v99 = v77 >> 3;
  HIDWORD(v77) = v67 ^ 0x342D25;
  LODWORD(v77) = (v67 ^ 0x342D25) & 0xC0;
  HIDWORD(v77) = (v77 >> 6) ^ 0x84D86FD6;
  LODWORD(v77) = HIDWORD(v77);
  v100 = v99 ^ v96 ^ ((2 * v96) | 0x158F5F90) ^ (4 * v99 - 583066664);
  v101 = ((v77 >> 26) - 1255564298 + ((2 * (v77 >> 26)) & 0x23EC ^ 0x97ECFFFF) + 1) ^ *(_DWORD *)&v79[4 * (v67 ^ 0xF0)] ^ 0x5C175A09;
  v102 = (v101 & 0x100000 ^ 0x6DFEFF6F) + 2 * (v101 & 0x100000);
  v103 = v102 - 748044802;
  v104 = v102 - 1845428079;
  v105 = -1352155940 - v102;
  if ((v100 & v104) == 0)
    v105 = v103;
  v106 = v100 - 1097383277 + v105;
  v107 = *(_DWORD *)&v76[4 * (*(_QWORD *)(v51 - 144) ^ 0x4DLL)];
  HIDWORD(v109) = v107 ^ 0xAAAAAAAA;
  LODWORD(v109) = v107 ^ 0xAC85C310;
  v108 = v109 >> 4;
  v110 = *(_DWORD *)(v78 + 4 * (v69 ^ 0xDBu ^ (*(_DWORD *)(v51 - 176) + 94)));
  v111 = *(_DWORD *)(v51 - 184) ^ (*(_DWORD *)(v51 - 192) - 3);
  HIDWORD(v109) = v110 ^ 0xFFFFFFFD;
  LODWORD(v109) = v110 ^ 0x1333C28;
  v112 = v109 >> 3;
  v113 = (4 * v112 - 583066664) ^ ((2 * v108) | 0x158F5F90);
  HIDWORD(v426) = v111 ^ *(_DWORD *)&v79[4 * (v111 ^ 0x49)] ^ v108 ^ v80[*(_QWORD *)(v51 - 200) ^ 0xA5] ^ v112 ^ 0xEA ^ (v113 - ((2 * v113) & 0x6A5337EC) - 1255564298);
  LODWORD(v426) = v80[*(_QWORD *)(v51 - 168) ^ 6] ^ v101 & 0xFFEFFFFF ^ v106 ^ 0xF;
  v114 = v426 ^ v98;
  v115 = v426 ^ v98 ^ HIDWORD(v426) ^ 0xA1F1E891;
  HIDWORD(v427) = v88;
  v116 = v86[((v115 ^ v88) >> 24) ^ 0x27];
  HIDWORD(v109) = v116 ^ 0x3C;
  LODWORD(v109) = ~v116 << 24;
  HIDWORD(v424) = v115 ^ v88;
  v117 = ((unsigned __int16)(v115 ^ v88 ^ 0xB4BA) >> 8);
  v118 = *(_DWORD *)(v93 + 4 * ((v115 ^ v88) ^ 0x83u)) + 951837053;
  v119 = (-1971387019 * *(_DWORD *)&v92[4 * (((v115 ^ v88 ^ 0x421D3F7E) >> 16) ^ 0x2F)] - 103871229) ^ *(_DWORD *)&v89[4 * (v117 ^ 0xD6)] ^ (8 * v118) ^ v117 ^ 0x45 ^ ((v117 ^ 0x45) - ((2 * (v117 ^ 0x45) + 1684359896) & 0x64404EFE) + 1897323755) ^ ((2 * (v109 >> 31) - 110) ^ (v109 >> 31));
  LODWORD(v424) = v98 ^ 0xFA92262E;
  v120 = v98 ^ 0xFA92262E ^ v118 ^ (v119 - ((2 * v119) & 0xF5244C5C) - 91085266);
  HIDWORD(v423) = v120 ^ v426 ^ v98;
  v425 = __PAIR64__(v426 ^ v98, v115);
  v121 = ((HIDWORD(v423) ^ 0x30571A7C) - ((2 * (HIDWORD(v423) ^ 0x30571A7C)) & 0xCFE2BC2A) + 1743871509) ^ v115;
  v122 = v121 ^ v115 ^ v88 ^ 0xB749B4BA;
  v123 = v86[HIBYTE(v122) ^ 0x87];
  HIDWORD(v109) = v123 ^ 0x3C;
  LODWORD(v109) = ~v123 << 24;
  v124 = BYTE1(v122) ^ 0xEE;
  v125 = v122 ^ 0xB92E3FEA;
  v126 = *(_DWORD *)(v93 + 4 * (v122 ^ 0xCAu)) + 951837053;
  v127 = (-1971387019 * *(_DWORD *)&v92[4 * (BYTE2(v122) ^ 0x65)] - 103871229) ^ *(_DWORD *)&v89[4
                                                                                               * (BYTE1(v122) ^ 0x7D)] ^ (8 * v126) ^ (v124 - ((2 * v124 + 1684359896) & 0x64404EFE) + 1897323755) ^ ((v109 >> 31) ^ (2 * (v109 >> 31) - 110)) ^ 0xFE;
  HIDWORD(v422) = v120 ^ 0x7932A17;
  LODWORD(v109) = __ROR4__(v121 ^ 0xDE7BBC0C, 9) ^ 0xFFF4328B;
  HIDWORD(v109) = v109;
  LODWORD(v422) = v120 ^ 0x7932A17 ^ v124 ^ v126 ^ (v127 - ((2 * v127) & 0xF26542E) + 127085079);
  v128 = v422 ^ 0x1AB67050 ^ HIDWORD(v423) ^ 0x30571A7C;
  v129 = (v109 >> 23) - ((2 * (v109 >> 23)) & 0x2EBDE1EC) + 392098038;
  HIDWORD(v420) = v129 ^ 0xE54C305E ^ v128;
  LODWORD(v423) = v125;
  v130 = (HIDWORD(v420) - ((2 * HIDWORD(v420)) & 0x3738A2AE) - 1684254377) ^ v125;
  v131 = v86[HIBYTE(v130) ^ 0xD4];
  HIDWORD(v109) = v131 ^ 0x3C;
  LODWORD(v109) = ~v131 << 24;
  v132 = v130 ^ 0xE734F189;
  v133 = -1971387019 * *(_DWORD *)&v92[4 * (BYTE2(v130) ^ 0x2B)] - 103871229;
  v134 = BYTE1(v130);
  v135 = *(_DWORD *)&v89[4 * (BYTE1(v130) ^ 0x45)];
  v136 = *(_DWORD *)(v93 + 4 * (v130 ^ 0x94u)) + 951837053;
  v137 = v133 ^ v135 ^ v136 ^ (8 * v136) ^ v422 ^ 0x1AB67050 ^ v134 ^ 0xD6 ^ ((v134 ^ 0xD6)
                                                                            - ((2 * (v134 ^ 0xD6) + 1684359896) & 0x64404EFE)
                                                                            + 1897323755) ^ ((v109 >> 31) ^ (2 * (v109 >> 31) - 110)) ^ 0xFE;
  v421 = __PAIR64__(v128, v129);
  v138 = v137 ^ v129;
  v139 = v137 ^ v129 ^ v132;
  v140 = *(_DWORD *)&v92[4 * (((v139 ^ 0x64C21DA) >> 16) ^ 0x5E)];
  v141 = v86[HIBYTE(v139) ^ 0xB4];
  HIDWORD(v109) = v141 ^ 0x3C;
  LODWORD(v109) = ~v141 << 24;
  LODWORD(v419) = v139 ^ 0x64C21DA;
  v142 = *(_DWORD *)(v93 + 4 * (v139 ^ 0x7Au)) + 951837053;
  v143 = v142 ^ *(_DWORD *)&v89[4 * (BYTE1(v139) ^ 0x40)] ^ (-1971387019 * v140
                                                           - ((352193258 * v140 + 1939741190) & 0x6FA5A210)
                                                           - 1314791925) ^ (8 * v142) ^ ((2 * (v109 >> 31) - 110) ^ (v109 >> 31)) ^ v137 ^ BYTE1(v139) ^ 0xD3 ^ ((BYTE1(v139) ^ 0xD3) - ((2 * (BYTE1(v139) ^ 0xD3) + 1684359896) & 0x64404EFE) + 1897323755);
  HIDWORD(v418) = v128 ^ 0xA9BD92DA ^ v137;
  v144 = v143 ^ 0xCA3C4743 ^ HIDWORD(v418);
  LODWORD(v420) = v132;
  v145 = v144 ^ v132;
  v146 = v144 ^ v132 ^ 0x1227C823;
  v147 = (BYTE1(v146) ^ 0xAA) - ((v146 >> 7) & 0x8A) + 69;
  v148 = v147 - ((2 * v147) & 0x79FD61AA) + 1023324373;
  v149 = v86[HIBYTE(v145) ^ 0x89];
  HIDWORD(v109) = v149 ^ 0x3C;
  LODWORD(v109) = ~v149 << 24;
  v150 = *(_DWORD *)(v93 + 4 * (v146 ^ 0xC0u)) + 951837053;
  v151 = (-1971387019 * *(_DWORD *)&v92[4 * (BYTE2(v146) ^ 0x38)] - 103871229) ^ *(_DWORD *)&v89[4 * (v148 ^ 0x3CFEB046)] ^ (8 * v150) ^ ((2 * (v109 >> 31) - 110) ^ (v109 >> 31)) ^ ((v148 ^ 0x3CFEB0D5) - ((2 * (v148 ^ 0x3CFEB0D5) + 1684359896) & 0x7DC86EFE) + 1897323755);
  v152 = v143 ^ 0xCA3C4743 ^ v150 ^ v148 ^ (v151 - ((2 * v151) & 0x79FD61AA) + 1023324373);
  v153 = v152 ^ v138 ^ v145;
  v154 = v152 ^ v138 ^ 0x94B066BD;
  v155 = *(_DWORD *)&v92[4 * (BYTE2(v153) ^ 0xAF)];
  *(_DWORD *)(v51 - 144) = v152 ^ 0xBD0B8B1E;
  v156 = v86[HIBYTE(v153) ^ 0x53];
  HIDWORD(v109) = v156 ^ 0x3C;
  LODWORD(v109) = ~v156 << 24;
  v157 = *(_DWORD *)(v93 + 4 * ((v152 ^ v138 ^ v145) ^ 0x5Eu)) + 951837053;
  v158 = *(_DWORD *)&v89[4 * (BYTE1(v153) ^ 0xD2)] ^ v157 ^ (8 * v157) ^ ((v152 ^ 0xBD0B8B1E ^ (-1971387019 * v155
                                                                                              - ((352193258 * v155
                                                                                                - 207742458) & 0x9E32976C)
                                                                                              + 1223186617)) & 0xC114DF77 | (v152 ^ 0xBD0B8B1E ^ (-1971387019 * v155 - ((352193258 * v155 - 207742458) & 0x1E32976C) + 149444793)) & 0x3EEB2088) ^ ((v109 >> 31) ^ (2 * (v109 >> 31) - 110)) ^ 0xFE ^ BYTE1(v153) ^ 0x41 ^ ((BYTE1(v153) ^ 0x41) - ((2 * (BYTE1(v153) ^ 0x41) + 1684359896) & 0x64404EFE) + 1897323755) ^ 0x7AD2C397;
  HIDWORD(v416) = v144 ^ 0x3AEE96B5 ^ v152;
  LODWORD(v109) = __ROR4__((HIDWORD(v416) - ((2 * HIDWORD(v416)) & 0x1180067E) - 2000682177) ^ 0x97E6B0E7 ^ v158, 3) ^ 0xC956B68E;
  HIDWORD(v109) = v109;
  v159 = (v109 >> 29) - ((2 * (v109 >> 29)) & 0xDE10DFD6) + 1862823915;
  v160 = v159 ^ v154 ^ v153;
  HIDWORD(v428) = v159 ^ v154;
  v161 = *(_DWORD *)&v92[4 * (BYTE2(v160) ^ 0xA7)];
  v162 = -1971387019 * v161 - ((352193258 * v161 + 329128454) & 0x1180067E) - 2104553406;
  v163 = v86[HIBYTE(v160) ^ 0x57];
  HIDWORD(v109) = v163 ^ 0x3C;
  LODWORD(v109) = ~v163 << 24;
  v164 = *(_DWORD *)(v93 + 4 * ((v159 ^ v154 ^ v153) ^ 0xB5u)) + 951837053;
  v417 = __PAIR64__(v146, v158);
  v165 = v164 ^ *(_DWORD *)&v89[4 * (BYTE1(v160) ^ 0xBD)] ^ v162 ^ (8 * v164) ^ v158 ^ ((2 * (v109 >> 31) - 110) ^ (v109 >> 31)) ^ 0xFE ^ BYTE1(v160) ^ 0x2E ^ ((BYTE1(v160) ^ 0x2E) - ((2 * (BYTE1(v160) ^ 0x2E) + 1684359896) & 0x64404EFE) + 1897323755);
  LODWORD(v416) = v159;
  v166 = (v165 ^ 0x80EE964B) + (v159 ^ 0x6F086FEB) - 2 * ((v165 ^ 0xEE964B) & (v159 ^ 0x6F086FEB));
  v167 = v166 - ((2 * v166) & 0x7124DFE) - 2088163585;
  v168 = v167 ^ v153 ^ 0xF70E2609;
  v169 = v86[((v167 ^ v153) >> 24) ^ 0x67];
  HIDWORD(v109) = v169 ^ 0x3C;
  LODWORD(v109) = ~v169 << 24;
  v170 = *(_DWORD *)(v93
                   + 4
                   * (((2 * ((v165 ^ 0x4B) & (v159 ^ 0xEB)) - ((v165 ^ 0x4B) + (v159 ^ 0xEB)) - 1) ^ v153) ^ 0x30u))
       + 951837053;
  v171 = (-1971387019 * *(_DWORD *)&v92[4 * (((v167 ^ v153) >> 16) ^ 0x75)] - 103871229) ^ *(_DWORD *)&v89[4 * (BYTE1(v168) ^ 0xD6)] ^ (8 * v170) ^ BYTE1(v168) ^ 0x45 ^ ((BYTE1(v168) ^ 0x45) - ((2 * (BYTE1(v168) ^ 0x45) + 1684359896) & 0x64404EFE) + 1897323755) ^ ((2 * (v109 >> 31) - 110) ^ (v109 >> 31));
  v415 = __PAIR64__(v160, v165);
  v172 = v165 ^ v170 ^ (v171 - ((2 * v171) & 0x2E37688) - 2123252924);
  v173 = v172 ^ v159 ^ v154;
  v174 = v173 ^ 0x1ED686DD;
  v175 = v173 ^ 0x1ED686DD ^ v168;
  v176 = -1971387019 * *(_DWORD *)&v92[4 * (BYTE2(v175) ^ 0xD4)] - 103871229;
  HIDWORD(v419) = v138;
  LODWORD(v418) = v144;
  LODWORD(v414) = v138 ^ 0x6D2A5B44 ^ v144;
  v177 = (*(_DWORD *)(v51 - 152) ^ 0x50AAF4C2) + (v114 ^ 0x562CA233) - v414;
  v178 = v177 + 511722990 - ((2 * (v177 + 511722990) + 250502668) & 0x36A16C06) + 1657267465;
  *(_DWORD *)(v51 - 208) = v178;
  v179 = v167 ^ v153 ^ 0x6E5157F2;
  HIDWORD(v413) = v137 ^ 0xD3C5208F;
  *(_DWORD *)(v51 - 152) = v173 ^ 0x690B74;
  LODWORD(v428) = v179
                + (v178 ^ 0x1B50B603)
                - HIDWORD(v413)
                - ((2 * (v179 + (v178 ^ 0x1B50B603) - HIDWORD(v413))) & 0x2EAD4F2A)
                + 391554965;
  v180 = v428 ^ 0x1756A795;
  LODWORD(v413) = v143 ^ 0x9AF758D6;
  v181 = (v143 ^ 0x9AF758D6) + (v428 ^ 0x1756A795) + (v173 ^ 0x690B74);
  v182 = v181 - 576877266;
  v183 = v181 + 1650239361;
  if ((v181 - 576877266) < 0xACA7BC04)
    v183 = v181 + 251945861;
  if (v182 >= 0xACA7BC04)
    v184 = -569470373;
  else
    v184 = 828823127;
  v185 = *(_DWORD *)(v93 + 4 * (v175 ^ 0xB5u)) + 951837053;
  v186 = v86[HIBYTE(v175) ^ 0x6FLL];
  HIDWORD(v187) = v186 ^ 0x3C;
  LODWORD(v187) = ~v186 << 24;
  v188 = v176 ^ *(_DWORD *)&v89[4 * (BYTE1(v175) ^ 0x84)] ^ (8 * v185) ^ BYTE1(v175) ^ 0x17 ^ ((BYTE1(v175) ^ 0x17)
                                                                                             - ((2
                                                                                               * (BYTE1(v175) ^ 0x17)
                                                                                               + 1684359896) & 0x64404EFE)
                                                                                             + 1897323755) ^ ((v187 >> 31) ^ (2 * (v187 >> 31) - 110)) ^ 0xFE;
  LODWORD(v187) = __ROR4__(v167 ^ 0xC757CF37 ^ v172, 16) ^ 0xD61061B8;
  HIDWORD(v187) = v187;
  LODWORD(v412) = v172 ^ 0xFB8E7B58 ^ v185 ^ (v188 - ((2 * v188) & 0x10072DFE) + 134452991);
  HIDWORD(v412) = v172 ^ 0xFB8E7B58;
  LODWORD(v411) = v412 ^ (v187 >> 16);
  HIDWORD(v411) = v187 >> 16;
  HIDWORD(v410) = v411 ^ v174;
  *(_DWORD *)(v51 - 160) = (v411 ^ v174) - ((2 * (v411 ^ v174)) & 0xDEB61BF8) + 1868238332;
  LODWORD(v410) = v177 - 1578612474;
  *(_DWORD *)(v51 - 192) = v177
                         + 511722990
                         - 2 * ((v177 - 1578612474) & 0x4F194BB7 ^ ((_BYTE)v177 - 18) & 1)
                         - 763277618;
  *(_DWORD *)(v51 - 200) = v154 - ((2 * v154) & 0x36A16C06) + 458274307;
  *(_DWORD *)(v51 - 168) = v179 - ((2 * v179) & 0x2EAD4F2A) + 391554965;
  v189 = v180 + 1293052129;
  LODWORD(v409) = v180 + 316783271;
  v190 = v153 ^ 0xD520629D;
  if (v183 == 828823127)
    v191 = v184;
  else
    v191 = v181 + 251945861;
  *(_DWORD *)(v51 - 176) = v181 + v190 + 1230637564 - ((2 * (v181 + v190 + 1230637564)) & 0x50A35186);
  *(_DWORD *)(v51 - 184) = v190 - ((2 * v190) & 0x50A35186);
  v192 = *(_DWORD *)(v51 - 148);
  v193 = (char *)*(&off_24DCDB210 + (v192 ^ 0x35C)) - 4;
  v194 = *(_DWORD *)&v193[4 * (*(unsigned __int8 *)(v51 - 120) ^ 0x41)]
       + (*(unsigned __int8 *)(v51 - 120) ^ 0xEE7687E7);
  v195 = v194 - ((2 * v194 + 2080111356) & 0x45208C2C) + 1619936148;
  v196 = (char *)*(&off_24DCDB210 + (v192 ^ 0x3E7)) - 4;
  v197 = (*(unsigned __int8 *)(v51 - 115) ^ 0x55CDCF81)
       - (*(unsigned __int8 *)(v51 - 115) ^ 0xDF)
       - 1875479602
       + *(_DWORD *)&v196[4 * (*(unsigned __int8 *)(v51 - 115) ^ 0x9CLL)];
  v198 = v197 - ((2 * v197) & 0x45208C2C);
  v199 = (uint64_t)*(&off_24DCDB210 + v192 - 679);
  v200 = (*(_BYTE *)(v51 - 113) ^ 0x28) + *(_BYTE *)(v199 + (*(unsigned __int8 *)(v51 - 113) ^ 0xD2));
  v201 = ((*(_BYTE *)(v51 - 121) ^ 0xE9)
                         + *(_BYTE *)(v199 + (*(unsigned __int8 *)(v51 - 121) ^ 0x13))
                         - 106) ^ 0xF5 ^ ((*(unsigned __int8 *)(v51 - 124) ^ 0xEE768735)
                                        - 1107427970
                                        + *(_DWORD *)&v193[4 * (*(unsigned __int8 *)(v51 - 124) ^ 0x93)]);
  v202 = v201 - ((2 * v201) & 0x45208C2C);
  v203 = *(unsigned __int8 *)(v51 - 125);
  LODWORD(v203) = ((*(unsigned __int8 *)(v51 - 127) ^ 0x55CDCFAB)
                 - (*(unsigned __int8 *)(v51 - 127) ^ 0xF5)
                 - 1875479602
                 + *(_DWORD *)&v196[4 * (*(unsigned __int8 *)(v51 - 127) ^ 0xB6)]) ^ ((*(unsigned __int8 *)(v51 - 128) ^ 0xEE7687A3)
                                                                                      - 1107427970
                                                                                      + *(_DWORD *)&v193[4 * (*(unsigned __int8 *)(v51 - 128) ^ 5)]) ^ (*(_BYTE *)(v199 + (v203 ^ 0x13)) + (v203 & 0xB1 ^ ((((v203 & 0x4E ^ 0xF9) + (v203 & 0x4E ^ 0x48) + 1) ^ 0xFC) + (v203 & 0x4E ^ 0x48)) ^ 0xEF) - 106) ^ 0xF5;
  v407 = v196;
  v408 = v193;
  v204 = *(_DWORD *)&v193[4 * (*(unsigned __int8 *)(v51 - 116) ^ 0x33)]
       + (*(unsigned __int8 *)(v51 - 116) ^ 0xEE768795)
       - 1107427970;
  v406 = v199;
  LOBYTE(v193) = (*(_BYTE *)(v51 - 117) ^ 0x30) + *(_BYTE *)(v199 + (*(unsigned __int8 *)(v51 - 117) ^ 0xCALL));
  v205 = (char *)*(&off_24DCDB210 + v192 - 726) - 4;
  v206 = *(_DWORD *)&v205[4 * (*(unsigned __int8 *)(v51 - 122) ^ 0x21)] ^ ((*(unsigned __int8 *)(v51 - 123) ^ 0x55CDCF45)
                                                                           - (*(unsigned __int8 *)(v51 - 123) ^ 0x1B)
                                                                           - 1875479602
                                                                           + *(_DWORD *)&v196[4
                                                                                            * (*(unsigned __int8 *)(v51 - 123) ^ 0x58)]) ^ 0xEC535AED ^ (v202 - 1567603178);
  v207 = *(_DWORD *)&v205[4 * (*(unsigned __int8 *)(v51 - 114) ^ 0x47)] ^ (v200 - 106) ^ 0xF5 ^ v204 ^ (v198 - 1567603178) ^ 0xBE0490FB;
  v405 = v205;
  v208 = v195 ^ *(_DWORD *)&v205[4 * (*(unsigned __int8 *)(v51 - 118) ^ 0x2BLL)] ^ ((*(unsigned __int8 *)(v51 - 119) ^ 0x55CDCFA2)
                                                                                  - (*(unsigned __int8 *)(v51 - 119) ^ 0xFC)
                                                                                  - 1875479602
                                                                                  + *(_DWORD *)&v196[4 * (*(unsigned __int8 *)(v51 - 119) ^ 0xBFLL)]) ^ ((_BYTE)v193 - 106) ^ 0xF5 ^ 0xD8810187;
  HIDWORD(v404) = (v167 & 0x10000 | 0x583CA77B) ^ v167 & 0xFFFEFFFF;
  LODWORD(v196) = v191 - 828823127;
  v209 = *(_DWORD *)&v205[4 * (*(unsigned __int8 *)(v51 - 126) ^ 0x32)] ^ 0x397A4E01 ^ (v203
                                                                                        - ((2 * v203) & 0x45208C2C)
                                                                                        - 1567603178);
  v210 = *(_DWORD *)(v51 - 208);
  HIDWORD(v403) = *(_DWORD *)(v51 - 200) ^ v210;
  LODWORD(v403) = *(_DWORD *)(v51 - 192) ^ *(_DWORD *)(v51 - 144);
  HIDWORD(v402) = v182 ^ *(_DWORD *)(v51 - 152) ^ v196;
  v211 = *(_DWORD *)(v51 - 176) + 676440259;
  LODWORD(v196) = *(_DWORD *)(v51 - 184) + 676440259;
  HIDWORD(v409) = v189;
  HIDWORD(v212) = v189 ^ 0x7ABCDF6B;
  LODWORD(v212) = v189 ^ 0x7ABCDF6B;
  HIDWORD(v401) = v212 >> 20;
  LODWORD(v404) = v210 ^ 0x70BDB73D;
  LODWORD(v401) = (v210 ^ 0x70BDB73D) - 426510904;
  *(_DWORD *)(v51 - 148) = *(_DWORD *)(v51 - 136) + 9684065;
  HIDWORD(v400) = (v192 - 680) & 0x7D74864B;
  LODWORD(v402) = v211;
  LODWORD(v400) = v196 ^ v211;
  HIDWORD(v399) = *(_DWORD *)(v51 - 168) ^ v428;
  LODWORD(v399) = v167 ^ HIDWORD(v428);
  HIDWORD(v398) = (v192 - 680) ^ 0x115;
  LODWORD(v398) = (v192 - 680) ^ 0x121;
  HIDWORD(v414) = v175;
  HIDWORD(v397) = *(_DWORD *)(v51 - 160) ^ v175;
  LODWORD(v397) = (v192 - 680) & 0x8E7B1A27;
  HIDWORD(v396) = (v192 - 680) ^ 0x157;
  *(_DWORD *)(v51 - 144) = v192 - 680;
  LODWORD(v396) = (v192 - 680) ^ 0x148;
  *(_DWORD *)(v51 - 152) = 1921774492;
  v213 = *(_DWORD *)(v51 - 144);
  v214 = (v213 ^ 0x34Cu) - 614;
  *(_QWORD *)(v51 - 160) = v214;
  v215 = a47[v214];
  *(_QWORD *)(v51 - 208) = 2;
  v216 = a47[2];
  v217 = *(_DWORD *)&v408[4 * (v215 ^ 0xAB)];
  *(_QWORD *)(v51 - 224) = 8;
  v218 = a47[8];
  *(_QWORD *)(v51 - 248) = 14;
  v219 = *(_DWORD *)&v405[4 * (v216 ^ 0x36)];
  v220 = a47[14];
  LODWORD(v216) = v217 + (v215 ^ 0xEE76870D) - 1107427970;
  *(_QWORD *)(v51 - 256) = 7;
  LODWORD(v215) = (v218 ^ 0xEE76872C) - 1107427970 + *(_DWORD *)&v408[4 * (v218 ^ 0x8A)];
  v221 = *(_DWORD *)&v405[4 * (v220 ^ 0x9A)];
  LODWORD(v218) = ((a47[7] ^ 0xE3) + *(_BYTE *)(v406 + (a47[7] ^ 0x19)) - 106);
  *(_QWORD *)(v51 - 176) = 11;
  v222 = a47[11];
  *(_QWORD *)(v51 - 232) = 3;
  v223 = *(unsigned __int8 *)(v406 + (((a47[3] ^ 0x12) - (a47[3] ^ 0x68)) ^ 0xFFFFFFFC) + (a47[3] ^ 0x12))
       + (a47[3] ^ 0x92)
       - 106;
  LODWORD(v215) = (*(_BYTE *)(v406 + (v222 ^ 0xF7)) + (v222 ^ 0xD) - 106) ^ v215;
  LODWORD(v222) = v223 - 1567603178 - ((2 * v223) & 0x2C);
  *(_QWORD *)(v51 - 240) = 15;
  v224 = a47[15];
  v225 = *(unsigned __int8 *)(v406 + (v224 ^ 0xBC));
  *(_QWORD *)(v51 - 216) = 1;
  v226 = v219 ^ 0x13F001BB ^ v222;
  LODWORD(v222) = ((v225 + (v224 ^ 0x46) - 106) ^ 0xF5)
                - 1567603178
                - ((2 * ((v225 + (v224 ^ 0x46) - 106) ^ 0xF5)) & 0x2C);
  LODWORD(v224) = *(_DWORD *)&v407[4 * (a47[1] ^ 0x4BLL)] - 1875479602 - (a47[1] ^ 8) + (a47[1] ^ 0x55CDCF56);
  HIDWORD(v212) = v226;
  LODWORD(v212) = v226;
  v227 = v212 >> 21;
  *(_QWORD *)(v51 - 192) = 12;
  LODWORD(v212) = __ROR4__(v224, 21);
  v228 = a47[12];
  *(_QWORD *)(v51 - 168) = 9;
  LODWORD(v228) = *(_DWORD *)&v408[4 * (v228 ^ 0x7A)] + (v228 ^ 0xEE7687DC) - 1107427970;
  v229 = a47[9];
  *(_QWORD *)(v51 - 184) = 0;
  LODWORD(v229) = v215 ^ ((v229 ^ 0x55CDCF8C) - 1875479602 + *(_DWORD *)&v407[4 * (v229 ^ 0x91)] - (v229 ^ 0xD2));
  v230 = (*(_DWORD *)&v408[4 * (*a47 ^ 0xA1)] + (*a47 ^ 0xEE768707) - 1107427970) ^ __ROR4__(v227 ^ v212 ^ 0x64566687, 11);
  LODWORD(v229) = (v229 - 1567603178 - ((2 * v229) & 0x45208C2C)) ^ *(_DWORD *)&v405[4 * (a47[10] ^ 0x29)];
  *(_QWORD *)(v51 - 200) = 5;
  LODWORD(v216) = v216 ^ v218 ^ *(_DWORD *)&v405[4 * (a47[6] ^ 0x1ALL)] ^ (*(_DWORD *)&v407[4 * (a47[5] ^ 0xF4)]
                                                                         - 1875479602
                                                                         - (a47[5] ^ 0xB7)
                                                                         + (a47[5] ^ 0x55CDCFE9)) ^ 0xB1604758;
  LODWORD(v222) = v228 ^ v221 ^ (*(_DWORD *)&v407[4 * (a47[13] ^ 0x61)]
                               - 1875479602
                               - (a47[13] ^ 0x22)
                               + (a47[13] ^ 0x55CDCF7C)) ^ v222;
  LODWORD(v218) = v209 ^ v427 ^ (v230 - ((2 * v230) & 0x61A1EDE0) - 1328482576);
  LODWORD(v203) = v206 ^ v426 ^ (v216 - ((2 * v216) & 0x3BDE9838) - 1645261796);
  v231 = v208 ^ HIDWORD(v426) ^ (v229 - ((2 * v229) & 0x45D9DE60) - 1561530576);
  v232 = v207 ^ HIDWORD(v427) ^ (v222 - ((2 * v222) & 0x4BF6961C) - 1510257906);
  v233 = (char *)*(&off_24DCDB210 + v213 - 209) - 4;
  v234 = *(_DWORD *)&v233[4 * (BYTE3(v218) ^ 0x79)];
  v235 = v234 - ((2 * v234 + 2117795516) & 0x77B970DC) + 989476812;
  v236 = BYTE1(v231) ^ 0xC3;
  LODWORD(v229) = (v235 >> 5) ^ (v235 >> 2) ^ BYTE2(v203) ^ 0x2B29CBD9;
  v237 = (char *)*(&off_24DCDB210 + v213 - 49) - 12;
  LODWORD(v229) = (v229 + 2147358972 - ((2 * v229) & 0x7FFC31F8)) ^ *(_DWORD *)&v237[4 * (BYTE2(v203) ^ 0x5D)];
  v238 = (char *)*(&off_24DCDB210 + v213 - 259) - 4;
  v239 = (char *)*(&off_24DCDB210 + HIDWORD(v400)) - 8;
  LODWORD(v216) = (-190269312
                 - 411947069
                 * *(_DWORD *)&v239[4
                                  * ((v207 ^ BYTE4(v427) ^ (v222 - ((2 * v222) & 0x1C) + 14)) ^ 0x4B)]) ^ *(_DWORD *)&v238[4 * (v236 - ((2 * ((v231 >> 8) ^ 0xEDFEC3)) & 0xEA)) + 468] ^ (v229 + 446607840 - ((2 * v229) & 0x353D63C0));
  LODWORD(v216) = v236 ^ v235 ^ (v216 - ((2 * v216) & 0x77B970DC) - 1143162770);
  v240 = *(_DWORD *)&v233[4 * (BYTE3(v203) ^ 0xB5)];
  LODWORD(v229) = v240 - ((2 * v240 + 2117795516) & 0x5AA73780) + 745610014;
  v241 = ((v229 >> 5) ^ (v229 >> 2) ^ 0x2E3E7A2E)
       - ((2 * ((v229 >> 5) ^ (v229 >> 2) ^ 0x2E3E7A2E)) & 0x5AA73780);
  LOBYTE(v240) = v231 ^ 0x84;
  LODWORD(v228) = *(_DWORD *)&v237[4 * (((v231 ^ 0xC600B684) >> 16) ^ 0xA2)] ^ HIDWORD(v425) ^ *(_DWORD *)&v238[4 * (((unsigned __int16)(v232 ^ 0x3281) >> 8) ^ 0x75)] ^ ((((v231 ^ 0xC600B684) >> 16) ^ 0xFE) + 2147358972 - 2 * ((((v231 ^ 0xC600B684) >> 16) ^ 0x2BFE) & 0xFD ^ ((v231 ^ 0xC600B684) >> 16) & 1)) ^ v229 ^ (((unsigned __int16)(v232 ^ 0x3281) >> 8) + 446607840 - (((v232 ^ 0xFEED3281) >> 7) & 0x1C0)) ^ (-190269312 - 411947069 * *(_DWORD *)&v239[4 * (v218 ^ 0x13)]);
  LODWORD(v229) = HIBYTE(v231) ^ 0xED;
  v242 = v228 ^ (v241 - 1387029568);
  LODWORD(v228) = *(_DWORD *)&v233[4 * v229]
                + 1393295841
                + ~((2 * *(_DWORD *)&v233[4 * v229] - 29688132) & 0xA7DD0504);
  LODWORD(v218) = v218 ^ 0x98AD73D9;
  LODWORD(v222) = ((v232 ^ 0xFEED3281) >> (v222 & 0x10 ^ 0x10) >> (v222 & 0x10));
  LODWORD(v222) = v222 ^ *(_DWORD *)&v237[4 * (v222 ^ 0x5C)] ^ (BYTE1(v218)
                                                                            + 446607840
                                                                            - ((v218 >> 7) & 0x1C0)) ^ (-190269312 - 411947069 * *(_DWORD *)&v239[4 * (v203 ^ 0x86)]) ^ *(_DWORD *)&v238[4 * (BYTE1(v218) ^ 0x75)] ^ (((v228 >> 5) ^ (v228 >> 2) ^ 0x3264D4B4) + 2147358972 - ((2 * ((v228 >> 5) ^ (v228 >> 2) ^ 0x3264D4B4)) & 0x7FFC31F8));
  LODWORD(v228) = (v222 - ((2 * v222) & 0xA7DD0504) - 739343742) ^ v228;
  v243 = *(_DWORD *)&v233[4 * (HIBYTE(v232) ^ 0x1F)];
  v244 = v243 - ((2 * v243 - 29688132) & 0xD06BF8DE) - 413959219;
  LODWORD(v203) = (v203 >> 8) ^ 0xB50187;
  LODWORD(v222) = (BYTE2(v218) + 2147358972 - ((v218 >> 15) & 0x1F8)) ^ HIDWORD(v424) ^ (v203 + 446607840 - ((2 * v203) & 0x1C0)) ^ *(_DWORD *)&v238[4 * (v203 ^ 0x75)] ^ (-190269312 - 411947069 * *(_DWORD *)&v239[4 * (v240 ^ 0x56)]) ^ v244 ^ *(_DWORD *)&v237[4 * (BYTE2(v218) ^ 0x5C)] ^ (((v244 >> 5) ^ (v244 >> 2) ^ 0x194CD0F8) - ((2 * ((v244 >> 5) ^ (v244 >> 2) ^ 0x194CD0F8)) & 0x506BF8DE) + 1748368495);
  v245 = (v216 - 91085266 - ((2 * v216) & 0xF5244C5C)) ^ v424;
  BYTE1(v203) = BYTE1(v242) ^ 0xED;
  LODWORD(v218) = *(_DWORD *)&v233[4 * (HIBYTE(v245) ^ 7)];
  LODWORD(v218) = v218 - ((2 * v218 + 2117795516) & 0x7C585312) + 1028237543;
  LODWORD(v228) = (v228 + 1743871509 - ((2 * v228) & 0xCFE2BC2A)) ^ v425;
  LODWORD(v229) = *(_DWORD *)&v238[4 * (BYTE1(v228) ^ 0x5D)] ^ *(_DWORD *)&v237[4
                                                                              * (((v242 ^ 0x5ECFED0E) >> 16) ^ 0x5C)] ^ (-190269312 - 411947069 * *(_DWORD *)&v239[4 * (v222 ^ 0xC3)]) ^ (((v242 ^ 0x5ECFED0E) >> 16) + 2147358972 - (((v242 ^ 0x5ECFED0E) >> 15) & 0x1F8)) ^ v218 ^ ((BYTE1(v228) ^ 0x28) + 446607840 - 2 * ((BYTE1(v228) ^ 0x28) & 0xF0 ^ (v228 >> 8) & 0x10)) ^ (((v218 >> 5) ^ (v218 >> 2) ^ 0x2A7A6B2E) - ((2 * ((v218 >> 5) ^ (v218 >> 2) ^ 0x2A7A6B2E)) & 0x7C585312) - 1104402039);
  LODWORD(v216) = *(_DWORD *)&v233[4 * (HIBYTE(v242) ^ 0xBF)];
  LODWORD(v216) = v216 - ((2 * v216 + 2117795516) & 0x651BC52C) - 1314168332;
  LODWORD(v216) = v216 ^ *(_DWORD *)&v237[4 * (BYTE2(v228) ^ 0x3F)] ^ ((BYTE2(v228) ^ 0x63)
                                                                     + 2147358972
                                                                     - ((2 * (WORD1(v228) ^ 0xAB63)) & 0x1F8)) ^ (((v216 >> 5) ^ (v216 >> 2) ^ 0xD3717B1) - ((2 * ((v216 >> 5) ^ (v216 >> 2) ^ 0xD3717B1)) & 0x651BC52C) + 848159382);
  v246 = v216 + 446607840 - ((2 * v216) & 0x353D63C0);
  LODWORD(v216) = *(_DWORD *)&v233[4 * (BYTE3(v228) ^ 0xAB)];
  LODWORD(v216) = v216 - ((2 * v216 + 1044053692) & 0x28568F7A) + 323536667;
  v247 = *(_DWORD *)&v238[4 * (BYTE1(v245) ^ 0x10)] ^ *(_DWORD *)&v237[4 * (BYTE2(v222) ^ 0x68)] ^ ((BYTE1(v245) ^ 0x65)
                                                                                                  + 446607840
                                                                                                  - ((2 * ((v245 >> 8) ^ 0x72565)) & 0x1C0)) ^ v216 ^ (-190269312 - 411947069 * *(_DWORD *)&v239[4 * (v242 ^ 0xC4)]) ^ ((BYTE2(v222) ^ 0x34) + 2147358972 - ((2 * (WORD1(v222) ^ 0xB34)) & 0x1F8)) ^ (((v216 >> 5) ^ (v216 >> 2) ^ 0x21AB8BD2) - ((2 * ((v216 >> 5) ^ (v216 >> 2) ^ 0x21AB8BD2)) & 0x28568F7A) - 1809102915);
  LODWORD(v216) = *(_DWORD *)&v233[4 * (BYTE3(v222) ^ 0xB)];
  LODWORD(v216) = v216 - ((2 * v216 - 29688132) & 0xC0B150D8) - 545904694;
  LODWORD(v218) = *(_DWORD *)&v237[4 * (BYTE2(v245) ^ 0x79)] ^ ((BYTE2(v245) ^ 0x25)
                                                              + 2147358972
                                                              - ((2 * (HIWORD(v245) ^ 0x725)) & 0x1F8)) ^ (v216 >> 2) ^ (v216 >> 5);
  v248 = BYTE1(v222);
  LODWORD(v203) = *(_DWORD *)&v238[4 * (BYTE1(v203) ^ 0x75)] ^ BYTE1(v203) ^ (-190269312
                                                                            - 411947069
                                                                            * *(_DWORD *)&v239[4
                                                                                             * (v228 ^ 0x8A)]);
  LODWORD(v228) = *(_DWORD *)&v238[4 * (BYTE1(v222) ^ 0x42)];
  v249 = -190269312 - 411947069 * *(_DWORD *)&v239[4 * (v245 ^ 0x9C)];
  LODWORD(v203) = v203 ^ ((v218 ^ 0x1B14EF58) + 446607840 - 2 * ((v218 ^ 0x1B14EF58) & 0x1A9EB1E3 ^ v218 & 3));
  LODWORD(v203) = (v203 - ((2 * v203) & 0xC0B150D8) + 1616423020) ^ v216;
  v250 = (v247 + 392098038 - ((2 * v247) & 0x2EBDE1EC)) ^ v421;
  LODWORD(v222) = (v229 + 127085079 - ((2 * v229) & 0xF26542E)) ^ HIDWORD(v422);
  LODWORD(v203) = (v203 - 1684254377 - ((2 * v203) & 0x3738A2AE)) ^ v423;
  LODWORD(v229) = v228 ^ HIDWORD(v423) ^ v248 ^ v246 ^ v249;
  v251 = *(_DWORD *)&v233[4 * (BYTE3(v222) ^ 0x8F)];
  v252 = v251 - ((2 * v251 - 29688132) & 0xFE2A39F6) - 30237607;
  v253 = v252 ^ *(_DWORD *)&v237[4 * (BYTE2(v229) ^ 0x76)] ^ ((BYTE2(v229) ^ 0x2A)
                                                            + 2147358972
                                                            - 2 * ((WORD1(v229) ^ 0x6D2A) & 0xFD ^ WORD1(v229) & 1)) ^ (((v252 >> 5) ^ (v252 >> 2) ^ 0x1C3DEFD9) - 2 * (((v252 >> 5) ^ (v252 >> 2) ^ 0x1C3DEFD9) & 0x3F151CFF ^ ((v252 >> 5) ^ (v252 >> 2)) & 4) + 2132090107);
  LODWORD(v218) = *(_DWORD *)&v233[4 * (BYTE3(v229) ^ 0x8C)];
  v254 = *(_DWORD *)&v238[4 * (BYTE1(v250) ^ 0xF6)] ^ v422 ^ BYTE1(v250) ^ (-411947069
                                                                          * *(_DWORD *)&v239[4
                                                                                           * (v203 ^ 0x37)]
                                                                          - 190269312) ^ (v253
                                                                                        + 446607840
                                                                                        - ((2 * v253) & 0x353D63C0));
  LODWORD(v216) = v218 - ((2 * v218 - 29688132) & 0x93588282) + 1221181599;
  *(_DWORD *)(v51 - 136) = 2147358973;
  v255 = *(_DWORD *)&v233[4 * (HIBYTE(v250) ^ 0x9D)];
  LODWORD(v218) = *(_DWORD *)&v238[4 * (BYTE1(v203) ^ 0x33)] ^ *(_DWORD *)&v237[4 * (BYTE2(v250) ^ 0x21)] ^ v216 ^ (-411947069 * *(_DWORD *)&v239[4 * (v222 ^ 0xB8)] - 190269312) ^ ((BYTE2(v250) ^ 0x7D) + 2147358973 + ~(2 * ((BYTE2(v250) ^ 0x7D) & 0xFE ^ HIWORD(v250) & 2))) ^ (((v216 >> 5) ^ (v216 >> 2) ^ 0x3426725A) - 2 * (((v216 >> 5) ^ (v216 >> 2) ^ 0x3426725A) & 0x9AC4145 ^ ((v216 >> 5) ^ (v216 >> 2)) & 4) - 911457983) ^ ((BYTE1(v203) ^ 0x46) + 446607840 - 2 * (((v203 >> 8) ^ 0x89D146) & 0xF1 ^ (v203 >> 8) & 0x11));
  LODWORD(v216) = v255 - ((2 * v255 - 29688132) & 0xC506F954) + 1637940232;
  LODWORD(v216) = v216 ^ (((v216 >> 5) ^ (v216 >> 2) ^ 0x3FB4C4CF)
                        - ((2 * ((v216 >> 5) ^ (v216 >> 2) ^ 0x3FB4C4CF)) & 0x4506F954)
                        - 494699350) ^ ((BYTE2(v203) ^ 0xD1) + 2147358973 + (~(2 * (WORD1(v203) ^ 0x89D1)) | 0xFFFFFE07)) ^ *(_DWORD *)&v237[4 * (BYTE2(v203) ^ 0x8D)];
  LODWORD(v203) = *(_DWORD *)&v233[4 * (BYTE3(v203) ^ 0x89)];
  v256 = v203 - ((2 * v203 + 507182780) & 0x166776E8) - 1974388014;
  LODWORD(v203) = (v218 - ((2 * v218) & 0xFBA3A436) - 36580837) ^ HIDWORD(v421);
  LODWORD(v218) = *(_DWORD *)&v238[4 * (BYTE1(v229) ^ 0xEC)] ^ ((BYTE1(v229) ^ 0x99)
                                                              + 446607840
                                                              - ((2 * ((v229 >> 8) ^ 0x6D2A99)) & 0x1C0)) ^ ((BYTE2(v222) ^ 0x98) + 2147358972 - 2 * ((WORD1(v222) ^ 0x8F98) & 0xFD ^ WORD1(v222) & 1)) ^ *(_DWORD *)&v237[4 * (BYTE2(v222) ^ 0xC4)] ^ (-411947069 * *(_DWORD *)&v239[4 * (v250 ^ 0x79)] - 190269312) ^ v256 ^ (((v256 >> 5) ^ (v256 >> 2) ^ 0x2957306) + 187939700 - 2 * (((v256 >> 5) ^ (v256 >> 2) ^ 0x2957306) & 0xB33BB75 ^ ((v256 >> 5) ^ (v256 >> 2)) & 1));
  v257 = *(_DWORD *)&v233[4 * (HIBYTE(v254) ^ 4)];
  LODWORD(v212) = __ROR4__(HIDWORD(v401) ^ __ROR4__(HIDWORD(v409) ^ BYTE1(v222) ^ (-411947069* *(_DWORD *)&v239[4 * (v229 ^ 0x32)]- 190269312) ^ *(_DWORD *)&v238[4* (BYTE1(v222) ^ 0x82)] ^ 0x239E448E ^ (v216 + 446607840 - ((2 * v216) & 0x353D63C0)), 20) ^ 0xD45ECD96, 12);
  LODWORD(v222) = v257 - ((2 * v257 + 238747324) & 0xEE36D90) + 110048806;
  LODWORD(v216) = *(_DWORD *)&v237[4 * (BYTE2(v203) ^ 0x1E)] ^ (v222 >> 2) ^ (v222 >> 5) ^ ((BYTE2(v203) ^ 0x42) + 2147358972 - ((2 * (WORD1(v203) ^ 0xE342)) & 0x1F8)) ^ 0x25E7E004;
  v258 = v216 - ((2 * v216) & 0xEE36D90);
  LODWORD(v216) = (v218 - ((2 * v218) & 0x46C8C448) - 1553702364) ^ v420;
  LODWORD(v218) = *(_DWORD *)&v238[4 * (((unsigned __int16)(WORD2(v420) ^ v212) >> 8) ^ 0x7E)] ^ HIDWORD(v413) ^ v222 ^ (-411947069 * *(_DWORD *)&v239[4 * (((v218 - ((2 * v218) & 0x48) + 36) ^ v420) ^ 0x79)] - 190269312) ^ ((((unsigned __int16)(WORD2(v420) ^ v212) >> 8) ^ 0xB) + 446607840 - (((HIDWORD(v420) ^ v212) >> 7) & 0x1C0));
  LOBYTE(v228) = (v229 ^ 0x37) & 3;
  LODWORD(v222) = *(_DWORD *)&v233[4 * (BYTE3(v203) ^ 0xE3)];
  LODWORD(v229) = v218 ^ (v258 - 2022590776);
  LODWORD(v222) = v222 - ((2 * v222 + 2117795516) & 0x7F3C5156) - 1094998007;
  LODWORD(v218) = ((((v222 ^ 0x3F9E28AB) >> (v228 ^ 3) >> v228)
                  + 1067329707
                  - ((2 * ((v222 ^ 0x3F9E28AB) >> (v228 ^ 3) >> v228)) & 0x7F3C5156)) ^ v222) >> 2;
  LODWORD(v228) = v218 + 1067329707 - ((2 * v218) & 0x7F3C5156);
  v259 = ((HIDWORD(v420) ^ v212) >> 16) ^ 0xCE;
  v260 = v259 + 2147358972 - ((2 * (((HIDWORD(v420) ^ v212) >> 16) ^ 0x4DCE)) & 0x1F8);
  LODWORD(v193) = BYTE1(v216) ^ 0x83;
  v261 = (_DWORD)v193 + 446607840 - ((2 * ((v216 >> 8) ^ 0x5D7D83)) & 0x1C0);
  LODWORD(v218) = *(_DWORD *)&v233[4 * (((HIDWORD(v420) ^ v212) >> 24) ^ 0x4D)];
  v262 = v218 - ((2 * v218 - 29688132) & 0xE4947258) + 1902622858;
  LODWORD(v218) = *(_DWORD *)&v237[4 * (BYTE2(v216) ^ 0x21)] ^ *(_DWORD *)&v238[4 * (BYTE1(v254) ^ 0x10)] ^ ((BYTE1(v254) ^ 0x65) + 446607840 - ((2 * ((v254 >> 8) ^ 0x42565)) & 0x1C0)) ^ (-411947069 * *(_DWORD *)&v239[4 * (v203 ^ 0x29)] - 190269312) ^ BYTE2(v216) ^ 0x7D ^ (((v262 >> 5) ^ (v262 >> 2) ^ 0x3B00DF82) + 2147358972 - ((2 * ((v262 >> 5) ^ (v262 >> 2) ^ 0x3B00DF82)) & 0x7FFC31F8));
  LODWORD(v216) = *(_DWORD *)&v233[4 * (BYTE3(v216) ^ 0xBC)];
  v254 ^= 0x4301F8D7u;
  LODWORD(v216) = v216 - ((2 * v216 - 29688132) & 0x854FB178) - 1044031462;
  LODWORD(v203) = v409 ^ *(_DWORD *)&v238[4 * (BYTE1(v203) ^ 0xB2)] ^ ((BYTE2(v254) ^ 0x24)
                                                                     + 2147358972
                                                                     - 2
                                                                     * ((HIWORD(v254) ^ 0x4724) & 0xFD ^ HIWORD(v254) & 1)) ^ *(_DWORD *)&v237[4 * (BYTE2(v254) ^ 0x78)] ^ ((BYTE1(v203) ^ 0xC7) + 446607840 - ((2 * ((v203 >> 8) ^ 0xE342C7)) & 0x1C0)) ^ v216 ^ 0x3F7249C1 ^ (((v216 >> 5) ^ (v216 >> 2) ^ 0x12BCC8EA) - 2 * (((v216 >> 5) ^ (v216 >> 2) ^ 0x12BCC8EA) & 0x2A7D8BD ^ ((v216 >> 5) ^ (v216 >> 2)) & 1) + 1118296252);
  LODWORD(v216) = *(_DWORD *)&v239[4 * ((BYTE4(v420) ^ v212) ^ 0x64)];
  LODWORD(v212) = __ROR4__((((586952704 * v216) | ((-190269312 - 411947069 * v216) >> 20)) - 1954021376) ^ __ROR4__(v203, 20) ^ 0xF7B00F8A, 12);
  v263 = *(_DWORD *)&v237[4 * (v259 ^ 0x5C)] ^ HIDWORD(v418) ^ v222 ^ (-190269312
                                                                     - 411947069
                                                                     * *(_DWORD *)&v239[4
                                                                                      * (v254 ^ 0x36)]) ^ *(_DWORD *)&v238[4 * (v193 ^ 0x75)] ^ v261 ^ v260 ^ v228;
  LODWORD(v222) = v262 ^ HIDWORD(v419) ^ (v218 - ((2 * v218) & 0xE4947258) - 230016724);
  v264 = ((v409 ^ v212) - 55307538 + (~(2 * (v409 ^ v212)) | 0x697DA25)) ^ v419;
  LODWORD(v216) = *(_DWORD *)&v233[4 * (BYTE3(v222) ^ 0x3B)];
  LODWORD(v216) = v216 + 765517813 + ~((2 * v216 + 2117795516) & 0x5D06C12C);
  LODWORD(v203) = v216 ^ (((v216 >> 5) ^ (v216 >> 2) ^ 0x2ED4C321)
                        - ((2 * ((v216 >> 5) ^ (v216 >> 2) ^ 0x2ED4C321)) & 0x5D06C12C)
                        - 1367121770) ^ ((BYTE2(v264) ^ 0x31)
                                       + *(_DWORD *)(v51 - 136)
                                       + (~(2 * (HIWORD(v264) ^ 0xA531)) | 0xFFFFFE07)) ^ *(_DWORD *)&v237[4 * (BYTE2(v264) ^ 0x6D)];
  LODWORD(v218) = *(_DWORD *)&v233[4 * (HIBYTE(v264) ^ 0xA5)];
  v265 = *(_DWORD *)&v238[4 * (BYTE1(v229) ^ 0xD2)] ^ v414 ^ (-190269312
                                                            - 411947069
                                                            * *(_DWORD *)&v239[4 * (v263 ^ 0x79)]) ^ BYTE1(v229) ^ (v203 + 446607840 - ((2 * v203) & 0x353D63C0));
  LODWORD(v203) = v218 - ((2 * v218 + 2117795516) & 0x708F62DA) + 929378507;
  v266 = BYTE1(v263) ^ 0x83;
  LODWORD(v203) = *(_DWORD *)&v238[4 * (BYTE1(v263) ^ 0xF6)
                                 + 4
                                 + 4 * ((v263 >> 7) & 0xEA ^ 0xFFFFFFFD)
                                 + 4 * ((v263 >> 7) & 0xEA ^ 2)] ^ *(_DWORD *)&v237[4 * (BYTE2(v229) ^ 0xB7)] ^ (-190269312 - 411947069 * *(_DWORD *)&v239[4 * (v222 ^ 0x1E)]) ^ ((BYTE2(v229) ^ 0xEB) + 2147358972 - ((2 * (WORD1(v229) ^ 0xDEEB)) & 0x1F8)) ^ (v266 + 446607840 + ((2 * ((v266 | 0x7FFFFFE0) ^ BYTE1(v263))) ^ 0x139) + 1) ^ v203 ^ (((v203 >> 5) ^ (v203 >> 2) ^ 0x2BD3D1D0) - ((2 * ((v203 >> 5) ^ (v203 >> 2) ^ 0x2BD3D1D0)) & 0x708F62DA) - 1203261075);
  LODWORD(v216) = *(_DWORD *)&v233[4 * (HIBYTE(v265) ^ 0xEC)];
  LODWORD(v216) = v216 - ((2 * v216 - 29688132) & 0x933E8E6A) + 1220331155;
  v267 = (((v216 >> 5) ^ (v216 >> 2) ^ 0x342B2BF4)
        - 2
        * (((v216 >> 5) ^ (v216 >> 2) ^ 0x342B2BF4) & 0x99F4737 ^ ((v216 >> 5) ^ (v216 >> 2)) & 2)
        - 912308427) ^ v216;
  v268 = (v203 - ((2 * v203) & 0x997FF834) + 1287650330) ^ HIDWORD(v417);
  v269 = *(_DWORD *)&v237[4 * (BYTE2(v268) ^ 0xDD)];
  v270 = (v267 & 0x20000000 | ((((v267 & 0x20000000u) >> 29) & 1) << 30)) ^ 0x3E7CFD14;
  v429 = *(_DWORD *)(v51 - 148) < 0x7E73B260u;
  LODWORD(v216) = *(_DWORD *)&v233[4 * (BYTE3(v229) ^ 0xDE)];
  LODWORD(v218) = v216 - 2 * ((v216 + 522026846) & 0x116FA623 ^ v216 & 1) + 277685632;
  LODWORD(v216) = (unint64_t)(((v218 >> 3) ^ 0x122DF4C4) & 0xDE70BC ^ v218 & 0x80DE70BC | ((v218 >> 3) ^ 0x122DF4C4) & 0x1F218F40 ^ (14844065 - (_DWORD)v216) & 0x7F218F40) >> 2;
  LODWORD(v216) = v218 ^ *(_DWORD *)&v237[4 * (BYTE2(v263) ^ 0x21)] ^ ((BYTE2(v263) ^ 0x7D)
                                                                     + 2147358972
                                                                     - 2
                                                                     * ((BYTE2(v263) ^ 0x7D) & 0xFE ^ HIWORD(v263) & 2)) ^ ((v216 ^ 0x20138808) - 2 * ((v216 ^ 0x20138808) & 0x116FA627 ^ v216 & 5) - 1854953950);
  v271 = *(_DWORD *)&v233[4 * (HIBYTE(v263) ^ 6)];
  v272 = v271 - ((2 * v271 + 2117795516) & 0x5B89BA72) - 1394451305;
  v273 = WORD1(v222) ^ 0x3B70;
  v274 = *(_DWORD *)&v238[4 * (BYTE1(v222) ^ 2)] ^ v413 ^ BYTE1(v222) ^ (-190269312
                                                                       - 411947069
                                                                       * *(_DWORD *)&v239[4
                                                                                        * ((((v409 ^ v212) - 18 + (~(2 * (v409 ^ v212)) | 0x25)) ^ v419) ^ 0xCC)]) ^ (v216 + 446607840 - ((2 * v216) & 0x353D63C0));
  v275 = *(_DWORD *)&v237[4 * (v273 ^ 0x5C)] ^ v418 ^ v272 ^ (-190269312
                                                                             - 411947069
                                                                             * *(_DWORD *)&v239[4
                                                                                              * (v229 ^ 0x67)]) ^ (((v272 >> 5) ^ (v272 >> 2) ^ 0xA1F11A7) - ((2 * ((v272 >> 5) ^ (v272 >> 2) ^ 0xA1F11A7)) & 0x5B89BA72) + 767876409) ^ (v273 + 2147358972 - 2 * (v273 & 0xFD ^ WORD1(v222) & 1)) ^ ((BYTE1(v264) ^ 0x14) + 446607840 - ((v264 >> 7) & 0x1C0)) ^ *(_DWORD *)&v238[4 * (BYTE1(v264) ^ 0x61)];
  LODWORD(v214) = *(_DWORD *)&v233[4 * (HIBYTE(v274) ^ 0xF3)];
  v276 = v214 - ((2 * v214 + 238747324) & 0xC245836) - 2060473479;
  LODWORD(v214) = *(_DWORD *)&v233[4 * (HIBYTE(v275) ^ 6)];
  LODWORD(v214) = v214 - ((2 * v214 - 29688132) & 0x820D0B1E) + 1076102381;
  LODWORD(v214) = v214 ^ *(_DWORD *)&v237[4 * (BYTE2(v265) ^ 6)] ^ ((BYTE2(v265) ^ 0x5A)
                                                                  + 2147358972
                                                                  - ((2 * (HIWORD(v265) ^ 0xEC5A)) & 0x1F8)) ^ (((v214 >> 5) ^ (v214 >> 2) ^ 0x3649954F) - 2 * (((v214 >> 5) ^ (v214 >> 2) ^ 0x3649954F) & 0x106859F ^ ((v214 >> 5) ^ (v214 >> 2)) & 0x10) - 1056537201);
  v277 = v214 + 446607840 - ((2 * v214) & 0x353D63C0);
  v278 = v270 - 604039168;
  if (((v270 - 1048378644) & (v269 ^ 0x7FFE18FC)) != 0)
    v278 = 1492718120 - v270;
  v279 = (-190269312 - 411947069 * *(_DWORD *)&v239[4 * (v275 ^ 0x87)]) ^ (~BYTE1(v274)
                                                                                          + 446607840
                                                                                          - ((2
                                                                                            * ((v274 >> 8) ^ 0xF37EFF)) & 0x1C0)) ^ *(_DWORD *)&v238[4 * (~BYTE1(v274) ^ 0x75)] ^ v267 & 0xDFFFFFFF ^ ((v269 ^ ((BYTE2(v268) ^ 0x81) + 2147358972 - 2 * ((BYTE2(v268) ^ 0x81) & 0xFE ^ HIWORD(v268) & 2)) ^ 0x8761423A) - 444339476 + v278);
  v280 = *(_DWORD *)&v233[4 * (HIBYTE(v268) ^ 0xFB)];
  v281 = v280 - ((2 * v280 - 29688132) & 0x95BD6896);
  v282 = (v279 & 2 | (4 * (((v279 & 2) >> 1) & 1))) ^ 0x1B6D2EBA;
  v283 = ((v282 - 460140218) & v404) == 0;
  v284 = v282 - 33629314;
  v285 = 886651122 - v282;
  if (v283)
    v285 = v284;
  v286 = v281 + 1241265065;
  v287 = HIDWORD(v403) ^ v279 & 0xFFFFFFFD ^ (v401 + v285);
  v288 = *(_DWORD *)&v238[4 * (BYTE1(v268) ^ 0xA0)] ^ HIDWORD(v416) ^ (-411947069
                                                                     * *(_DWORD *)&v239[4
                                                                                      * (v274 ^ 0xB5)]
                                                                     - 190269312) ^ BYTE1(v268) ^ v277;
  v289 = v400 ^ BYTE2(v274) ^ *(_DWORD *)&v238[4 * (BYTE1(v275) ^ 0xF6)] ^ ((BYTE1(v275) ^ 0x83)
                                                                          + 446607840
                                                                          - ((2 * ((v275 >> 8) ^ 0x67D83)) & 0x1C0)) ^ *(_DWORD *)&v237[4 * (BYTE2(v274) ^ 0x22)] ^ (-190269312 - 411947069 * *(_DWORD *)&v239[4 * (v265 ^ 3)]) ^ (((v286 >> 5) ^ (v286 >> 2) ^ 0x34E158B0) + *(_DWORD *)(v51 - 136) + ~(2 * (((v286 >> 5) ^ (v286 >> 2) ^ 0x34E158B0) & 0x3FFE18FF ^ ((v286 >> 5) ^ (v286 >> 2)) & 3))) ^ 0x7E;
  v290 = (v289 - ((2 * v289) & 0x95BD6896) - 891374517) ^ v286;
  v291 = v403 ^ *(_DWORD *)&v237[4 * (BYTE2(v275) ^ 0x21)] ^ *(_DWORD *)&v238[4 * (BYTE1(v265) ^ 0x59)] ^ (-190269312 - 411947069 * *(_DWORD *)&v239[4 * (v268 ^ 0x9A)]) ^ (((v276 >> 5) ^ (v276 >> 2) ^ 0x1B41A66) + 2147358972 - 2 * (((v276 >> 5) ^ (v276 >> 2) ^ 0x1B41A66) & 0x3FFE18FD ^ ((v276 >> 5) ^ (v276 >> 2)) & 1)) ^ BYTE2(v275) ^ ((BYTE1(v265) ^ 0x2C) + 446607840 - ((2 * ((v265 >> 8) ^ 0xEC5A2C)) & 0x1C0)) ^ 0x7D;
  v292 = v276 ^ v410 ^ (v291 - ((2 * v291) & 0xC245836) + 101854235);
  v293 = *(_DWORD *)&v233[4 * (HIBYTE(v292) ^ 0x13)];
  v294 = v293 - ((2 * v293 - 29688132) & 0xF1F0A3BC) - 132787908;
  v295 = (v290 + 676440259 - ((2 * v290) & 0x50A35186)) ^ v402;
  v296 = *(_DWORD *)&v238[4 * (BYTE1(v287) ^ 0xB5)] ^ *(_DWORD *)&v237[4 * (BYTE2(v288) ^ 0x72)] ^ v294 ^ (((v294 >> 5) ^ (v294 >> 2) ^ 0x1DF9D6F9) - ((2 * ((v294 >> 5) ^ (v294 >> 2) ^ 0x1DF9D6F9)) & 0x71F0A3BC) + 2029539806) ^ ((BYTE2(v288) ^ 0x2E) + 2147358972 - 2 * ((HIWORD(v288) ^ 0x612E) & 0xFD ^ HIWORD(v288) & 1)) ^ ((BYTE1(v287) ^ 0xC0) + 446607840 - 2 * (((v287 >> 8) ^ 0x1EF1C0) & 0xE9 ^ (v287 >> 8) & 9)) ^ (-411947069 * *(_DWORD *)&v239[4 * (v295 ^ 0x83)] - 190269312);
  v297 = *(_DWORD *)&v233[4 * (HIBYTE(v288) ^ 0x61)];
  v298 = v297 - ((2 * v297 + 2117795516) & 0x75D01764) + 973441808;
  v299 = (v298 >> 3) ^ 0x175D0176;
  v300 = ((v298 ^ 0x524AF53B ^ (v298 >> 3)) + v299 + 1) ^ (-2132639582 - v297);
  v301 = *(_DWORD *)&v237[4 * (BYTE2(v287) ^ 0xAD)] ^ ((((v300 - 1159197774 - ((2 * v300) & 0x75D01764)) ^ v298) + v299) >> 2) ^ ((BYTE2(v287) ^ 0xF1) + 2147358972 - ((2 * (HIWORD(v287) ^ 0x1EF1)) & 0x1F8));
  v302 = v298 ^ (-411947069 * *(_DWORD *)&v239[4 * (v292 ^ 0xB)] - 190269312) ^ ((BYTE1(v295) ^ 0xE5)
                                                                                                + 446607840
                                                                                                - ((2
                                                                                                  * ((v295 >> 8) ^ 0xAA89E5)) & 0x1C0)) ^ *(_DWORD *)&v238[4 * (BYTE1(v295) ^ 0x90)] ^ (v301 - 1159197774 - ((2 * v301) & 0x75D01764));
  v303 = *(_DWORD *)&v233[4 * (HIBYTE(v287) ^ 0x1E)];
  v304 = v303 - ((2 * v303 - 29688132) & 0xAA1827D0) + 1412010822;
  v305 = *(_DWORD *)&v238[4 * (BYTE1(v292) ^ 0xA4)] ^ v304 ^ *(_DWORD *)&v237[4 * (BYTE2(v295) ^ 0xD5)] ^ (-411947069 * *(_DWORD *)&v239[4 * (v288 ^ 0x3D)] - 190269312) ^ ((BYTE1(v292) ^ 0xD1) + 446607840 - ((2 * ((v292 >> 8) ^ 0x13D2D1)) & 0x1C0)) ^ ((BYTE2(v295) ^ 0x89) + 2147358972 - ((2 * (HIWORD(v295) ^ 0xAA89)) & 0x1F8)) ^ (((v304 >> 5) ^ (v304 >> 2) ^ 0x33EB6465) - ((2 * ((v304 >> 5) ^ (v304 >> 2) ^ 0x33EB6465)) & 0x2A1827D0) - 720628760);
  v306 = *(_DWORD *)&v233[4 * (HIBYTE(v295) ^ 0xAA)];
  v307 = v306 - ((2 * v306 - 29688132) & 0xBA77F628) + 1549367922;
  v308 = *(_DWORD *)&v237[4 * (BYTE2(v292) ^ 0x8E)] ^ *(_DWORD *)&v238[4 * (BYTE1(v288) ^ 0xF2)] ^ BYTE2(v292) ^ ((BYTE1(v288) ^ 0x87) + 446607840 - ((2 * ((v288 >> 8) ^ 0x612E87)) & 0x1C0)) ^ (-411947069 * *(_DWORD *)&v239[4 * (v287 ^ 0x7D)] - 190269312) ^ 0xD2 ^ (((v307 >> 5) ^ (v307 >> 2) ^ 0x31A7211D) + 2147358972 - ((2 * ((v307 >> 5) ^ (v307 >> 2) ^ 0x31A7211D)) & 0x7FFC31F8));
  v309 = (v296 - 2000682177 - ((2 * v296) & 0x1180067E)) ^ v417;
  v310 = (v302 + 1862823915 - ((2 * v302) & 0xDE10DFD6)) ^ v416;
  v311 = v307 ^ HIDWORD(v415) ^ (v308 - ((2 * v308) & 0xBA77F628) - 583271660);
  v312 = *(_DWORD *)&v233[4 * (HIBYTE(v309) ^ 0x99)];
  v313 = v312 - ((2 * v312 - 29688132) & 0xDD35CACC) - 306682684;
  v314 = *(_DWORD *)&v237[4 * (BYTE2(v310) ^ 0x21)] ^ (v313 >> 2) ^ (v313 >> 5) ^ ((BYTE2(v310) ^ 0x7D)
                                                                                 + 2147358972
                                                                                 - 2
                                                                                 * ((BYTE2(v310) ^ 0x7D) & 0xFE ^ HIWORD(v310) & 2));
  v315 = *(_DWORD *)&v233[4 * (HIBYTE(v310) ^ 0x99)];
  v316 = v315 - ((2 * v315 + 507182780) & 0x1DB1F1CA) + 234256451;
  v317 = (v305 - 498032340 + (~(2 * v305) | 0x3B5EBDA9)) ^ HIDWORD(v428);
  v318 = *(_DWORD *)&v238[4 * (BYTE1(v317) ^ 0x38)] ^ BYTE1(v317) ^ (-411947069
                                                                   * *(_DWORD *)&v239[4 * (v311 ^ 0xF5)]
                                                                   - 190269312) ^ 0x4D ^ ((v314 ^ 0x18D26E72)
                                                                                        + 446607840
                                                                                        - 2
                                                                                        * ((v314 ^ 0x18D26E72) & 0x1A9EB1EC ^ v314 & 0xC));
  v319 = v318 - ((2 * v318) & 0xDD35CACC);
  v320 = v311 ^ 0x9AA1E83F;
  v321 = ((unsigned __int16)(v311 ^ 0xE83F) >> 8);
  v322 = BYTE1(v320) + 446607840 - ((v320 >> 7) & 0x1C0);
  v323 = *(_DWORD *)&v233[4 * (HIBYTE(v317) ^ 0x5A)];
  v324 = v323 - ((2 * v323 - 29688132) & 0x9F027442) - 828458625;
  v325 = v324 ^ (v324 >> 5) ^ (v324 >> 2);
  v326 = *(_DWORD *)&v237[4 * (((v311 ^ 0x9AA1E83F) >> 16) ^ 0x5C)];
  v327 = (v325 ^ 0x5E1D7D78)
       - (v326 & 0x2000)
       + 1422376405
       - 2 * (((v325 ^ 0x5E1D7D78) - (v326 & 0x2000)) & 0x54C7BDDD ^ (v325 ^ 0x5E1D7D78) & 8);
  v283 = (v326 & 0x2000 & ~v325) == 0;
  v328 = v325 ^ (v326 & 0x2000 | 0xADAC0AD);
  if (!v283)
    v328 = v327;
  v329 = v326 & 0xFFFFDFFF ^ (((v311 ^ 0x9AA1E83F) >> 16) + 1422376405 - ((v320 >> 15) & 0x1AA)) ^ 0x7FFE18FC ^ v328;
  v330 = *(_DWORD *)&v233[4 * (HIBYTE(v311) ^ 0x7B)];
  v331 = *(_DWORD *)&v238[4 * (BYTE1(v310) ^ 0xF6)];
  v332 = v330 - ((2 * v330 + 2117795516) & 0x4B576410) + 617165158;
  v333 = HIDWORD(v399) ^ *(_DWORD *)&v237[4 * (BYTE2(v309) ^ 0x21)] ^ (v332 >> 2) ^ (v332 >> 5) ^ (-190269312
                                                                                                 - 411947069
                                                                                                 * *(_DWORD *)&v239[4 * (v317 ^ 0xB9)]) ^ ((BYTE2(v309) ^ 0x7D) + 2147358972 - ((2 * (HIWORD(v309) ^ 0x997D)) & 0x1F8)) ^ ((((BYTE1(v310) ^ 0x40542AFA) & 0x40100ADD) + (v331 & 0xE8315FDD ^ 0x81011C0) - 2 * ((BYTE1(v310) ^ 0x40542AFA) & 0x40100ADD & (v331 ^ 0x1000C0))) | v331 & 0x17CEA022 ^ (BYTE1(v310) ^ 0x40542AFA) & 0x442022 ^ 0x128EA020) ^ 0x2C47B112;
  v334 = v313 ^ v415 ^ (v319 + 1855645030);
  v335 = v399 ^ *(_DWORD *)&v238[4 * (BYTE1(v309) ^ 0xF6)] ^ BYTE1(v309) ^ (-190269312
                                                                          - 411947069
                                                                          * *(_DWORD *)&v239[4
                                                                                           * (v310 ^ 0x79)]) ^ (v329 + 446607840 - ((2 * v329) & 0x353D63C0));
  v336 = HIDWORD(v404) ^ *(_DWORD *)&v237[4 * (BYTE2(v317) ^ 0x79)] ^ v316 ^ (-190269312
                                                                            - 411947069
                                                                            * *(_DWORD *)&v239[4
                                                                                             * (v309 ^ 0x79)]) ^ *(_DWORD *)&v238[4 * (v321 ^ 0x75)] ^ ((BYTE2(v317) ^ 0x25) + 2147358972 - ((2 * (HIWORD(v317) ^ 0x5A25)) & 0x1F8)) ^ v322 ^ (((v316 >> 5) ^ (v316 >> 2) ^ 0x27C0F9FE) - ((2 * ((v316 >> 5) ^ (v316 >> 2) ^ 0x27C0F9FE)) & 0x1DB1F1CA) - 1898383131);
  v337 = v332 ^ v428 ^ (v333 - ((2 * v333) & 0x4B576410) - 1515474424);
  v338 = *(_DWORD *)&v233[4 * (HIBYTE(v334) ^ 0xAE)];
  v339 = v338 - ((2 * v338 + 2117795516) & 0x481B1228) + 590022770;
  v340 = *(_DWORD *)&v237[4 * (BYTE2(v336) ^ 0xC7)] ^ *(_DWORD *)&v238[4 * (BYTE1(v335) ^ 0xBB)] ^ (-190269312
                                                                                                  - 411947069 * *(_DWORD *)&v239[4 * ((v332 ^ v428 ^ (v333 - ((2 * v333) & 0x10) + 8)) ^ 0x6E)]) ^ BYTE2(v336) ^ ((BYTE1(v335) ^ 0xCE) + 446607840 - ((2 * ((v335 >> 8) ^ 0x8CAFCE)) & 0x1C0)) ^ 0x9B ^ (((v339 >> 5) ^ (v339 >> 2) ^ 0x2C230E0D) + 2147358972 - 2 * (((v339 >> 5) ^ (v339 >> 2) ^ 0x2C230E0D) & 0x3FFE18FE ^ ((v339 >> 5) ^ (v339 >> 2)) & 2));
  v341 = v339 ^ 0xC7356843 ^ (v340 - ((2 * v340) & 0x481B1228) - 1542616812);
  v342 = v341 - ((2 * v341) & 0xE24651AA);
  v343 = *(_DWORD *)&v233[4 * (HIBYTE(v336) ^ 0xD0)];
  v344 = v343 - ((2 * v343 - 29688132) & 0x9AFD526A) + 1285302419;
  v345 = (v344 >> 5) ^ (v344 >> 2) ^ BYTE2(v335);
  v346 = ((v345 ^ 0x35345FAB)
        + *(_DWORD *)(v51 - 136)
        + ((2 * ((v345 ^ 0x35345FAB) & 0x3FFE18FF ^ v345 & 3)) ^ 0xFFFFFFF9)) ^ *(_DWORD *)&v237[4
                                                                                               * (BYTE2(v335) ^ 0xF3)];
  v347 = (-190269312 - 411947069 * *(_DWORD *)&v239[4 * (v334 ^ 0xA3)]) ^ *(_DWORD *)&v238[4 * (((unsigned __int16)(v337 ^ 0x7FA4) >> 8) ^ 0x75)] ^ ((unsigned __int16)(v337 ^ 0x7FA4) >> 8) ^ (v346 + 446607840 - ((2 * v346) & 0x353D63C0));
  v348 = v347 - ((2 * v347) & 0x9AFD526A);
  v349 = *(_DWORD *)&v233[4 * (HIBYTE(v335) ^ 0x8C)];
  v350 = v349 - ((2 * v349 - 29688132) & 0xA15E4D4E) - 808671739;
  v351 = *(_DWORD *)&v237[4 * (((v337 ^ 0x93207FA4) >> 16) ^ 0x5C)] ^ (v350 >> 2) ^ (v350 >> 5) ^ (((v337 ^ 0x93207FA4) >> 16) + 2147358972 - (((v337 ^ 0x93207FA4) >> 15) & 0x1F8)) ^ 0x16AEB09C;
  v352 = ((unsigned __int16)(v334 ^ 0x1169) >> 8);
  v353 = v352 + 446607840 - ((v334 >> 7) & 0x1C0);
  v354 = *(_DWORD *)&v233[4 * (HIBYTE(v337) ^ 0x72)];
  v355 = ((v334 ^ 0x4FC01169) >> 16);
  v356 = v354 - ((2 * v354 - 29688132) & 0xA9EAD4FE) - 736957987;
  v357 = *(_DWORD *)&v238[4 * (v352 ^ 0x75)];
  v358 = *(_DWORD *)&v238[4 * (BYTE1(v336) ^ 0x73)];
  v359 = (-411947069 * *(_DWORD *)&v239[4 * (v335 ^ 0x7F)] - 190269312) ^ *(_DWORD *)&v237[4 * (v355 ^ 0x5C)] ^ ((v358 ^ 0x1A9EB1E0) + (BYTE1(v336) ^ 0x40542A7F) - 2 * ((v358 ^ 0x1420E0) & (BYTE1(v336) ^ 0x40542A7F)));
  v360 = -411947069 * *(_DWORD *)&v239[4 * (v336 ^ 0x6C)] - 190269312;
  v361 = v359 ^ v355 ^ (((v356 >> 5) ^ (v356 >> 2) ^ 0x179AF1CC)
                      + 2147358972
                      - 2 * (((v356 >> 5) ^ (v356 >> 2) ^ 0x179AF1CC) & 0x3FFE18FE ^ ((v356 >> 5) ^ (v356 >> 2)) & 2));
  v362 = (v342 - 114901036 - ((2 * (v342 - 249354027)) & 0x10072DFE)) ^ HIDWORD(v412);
  v363 = v344 ^ HIDWORD(v411) ^ (v348 - 847337163);
  v364 = v356 ^ v175 ^ (v361 - ((2 * v361) & 0xA9EAD4FE) + 1425369727);
  v365 = HIDWORD(v402) ^ v357 ^ v360 ^ v350 ^ v353 ^ (v351 - ((2 * v351) & 0xA15E4D4E) + 1353655975);
  LOBYTE(v357) = v364 ^ 0xE;
  v366 = (char *)*(&off_24DCDB210 + SHIDWORD(v398)) - 12;
  v367 = *(_DWORD *)(v51 - 144);
  v368 = (char *)*(&off_24DCDB210 + (v367 ^ 0x3C)) - 4;
  v369 = (uint64_t)*(&off_24DCDB210 + v367 - 6);
  HIDWORD(v370) = *(_DWORD *)(v369 + 4 * (BYTE1(v364) ^ 0x4Fu));
  LODWORD(v370) = HIDWORD(v370) ^ 0x73C72D20;
  v371 = (v370 >> 1) ^ (*(_DWORD *)&v366[4 * (HIBYTE(v363) ^ 0xAE)] - 902450773) ^ (*(_DWORD *)&v368[4 * (BYTE2(v365) ^ 0xC0)]
                                                                                  + (BYTE2(v365) ^ 0xDF44080B)
                                                                                  - 1878548260) ^ ((v370 >> 1) >> 4) & 0x55EBAB1;
  HIDWORD(v370) = *(_DWORD *)(v369
                            + 4
                            * (((unsigned __int16)((v342 - 16428 - ((2 * (v342 + 10453)) & 0x2DFE)) ^ WORD2(v412)) >> 8) ^ 0x21u));
  LODWORD(v370) = HIDWORD(v370) ^ 0x73C72D20;
  v372 = v370 >> 1;
  v373 = (v372 >> 4) & 0x55EBAB1 ^ (*(_DWORD *)&v366[4 * (HIBYTE(v365) ^ 0x38)] - 902450773) ^ (*(_DWORD *)&v368[4 * (((v364 ^ 0x822730E) >> 16) ^ 9)]
                                                                                              + (((v364 ^ 0x822730E) >> 16) ^ 0xDF4408C2)
                                                                                              - 1878548260);
  v374 = BYTE2(v363);
  v375 = *(unsigned int *)&v368[4 * (BYTE2(v363) ^ 0x94)];
  v376 = *(_DWORD *)&v366[4 * (HIBYTE(v362) ^ 0xF9)];
  v377 = *(_DWORD *)&v366[4 * (HIBYTE(v364) ^ 0x66)];
  v378 = *(_DWORD *)(v369 + 4 * (BYTE1(v365) ^ 0xE8u));
  HIDWORD(v370) = *(_DWORD *)(v369 + 4 * (BYTE1(v363) ^ 0xB7u));
  LODWORD(v370) = HIDWORD(v370) ^ 0x73C72D20;
  v379 = (char *)*(&off_24DCDB210 + (int)v398) - 4;
  v380 = *(_DWORD *)&v379[4 * v357];
  LODWORD(v368) = (*(_DWORD *)&v368[4 * (BYTE2(v362) ^ 0x3A)] + (BYTE2(v362) ^ 0xDF4408F1) - 1878548260) ^ (v377 - 902450773);
  v381 = *(_DWORD *)&v379[4 * (v365 ^ 0xDE)];
  v382 = *(_DWORD *)&v379[4 * (v362 ^ 0x70)] ^ v411 ^ (v371 + 2057937260 - ((2 * v371) & 0xF55342D8));
  v383 = *(_DWORD *)&v379[4 * (v363 ^ 8)] ^ HIDWORD(v410) ^ v372 ^ (v373
                                                                                   + 2057937260
                                                                                   - ((2 * v373) & 0xF55342D8));
  v384 = HIDWORD(v397) ^ v381 ^ (v370 >> 1) ^ ((v370 >> 1) >> 4) & 0x55EBAB1;
  v385 = (char *)*(&off_24DCDB210 + (int)v397) - 4;
  v386 = v385[v382 ^ 0x95];
  HIDWORD(v370) = v386 ^ 0xE;
  LODWORD(v370) = -2130706432 * (v386 ^ 0x5E);
  v387 = v384 ^ ((_DWORD)v368 + 2057937260 - ((2 * (_DWORD)v368) & 0xF55342D8));
  a47[*(_QWORD *)(v51 - 256)] = (((-127 * (v386 ^ 0x5E)) & 8) != 0) ^ ((((v370 >> 28) ^ 0xB8) >> 4) | (16 * ((v370 >> 28) ^ 0xB8))) ^ 0x83;
  v388 = (char *)*(&off_24DCDB210 + SHIDWORD(v396)) - 12;
  a47[10] = (v388[BYTE1(v383) ^ 0xC9] - 120) ^ 0xA4;
  a47[*(_QWORD *)(v51 - 248)] = (v388[((unsigned __int16)(v384 ^ ((_WORD)v368
                                                                                 - 24212
                                                                                 - ((2 * (_WORD)v368) & 0x42D8))) >> 8) ^ 0x25]
                               - 120) ^ 0xCC;
  a47[6] = (v388[BYTE1(v382) ^ 0x6ELL] - 120) ^ 0xCF;
  v389 = (char *)*(&off_24DCDB210 + (v367 ^ 0x38)) - 8;
  LOBYTE(v371) = ((((v383 ^ 0xCBEE05F5) >> 24) ^ 0x2E)
                + (~(2 * (((v383 ^ 0xCBEE05F5) >> 24) ^ 0x2E) - 76) | 0x67)
                + 39) ^ v389[((v383 ^ 0xCBEE05F5) >> 24) ^ 0x55];
  a47[*(_QWORD *)(v51 - 224)] = (~(_BYTE)v371 | 0x39) & (v371 | 0xC6);
  HIDWORD(v370) = v378;
  LODWORD(v370) = v378 ^ 0x73C72D20;
  v390 = (v370 >> 1) ^ ((v370 >> 1) >> 4) & 0x55EBAB1 ^ (v375 + (v374 ^ 0xDF44085F) - 1878548260) ^ (v376 - 902450773);
  v391 = v380 ^ v412 ^ (v390 + 2057937260 - ((2 * v390) & 0xF55342D8));
  a47[*(_QWORD *)(v51 - 208)] = (v388[((unsigned __int16)(v380 ^ v412 ^ (v390
                                                                                        - 24212
                                                                                        - ((2 * v390) & 0x42D8))) >> 8) ^ 0xF6]
                               - 120) ^ 0x99;
  LOBYTE(v390) = -127 * (v385[(v380 ^ v412 ^ (v390 + 108 - ((2 * v390) & 0xD8))) ^ 0x48] ^ 0x5E);
  a47[*(_QWORD *)(v51 - 232)] = v390 ^ 0x92 ^ ((v390 & 8) != 0);
  LOBYTE(v390) = -127 * (v385[v387 ^ 0xB6] ^ 0x5E);
  a47[*(_QWORD *)(v51 - 240)] = v390 ^ ((v390 & 8) != 0) ^ 0xF0;
  v392 = (char *)*(&off_24DCDB210 + (int)v396) - 4;
  a47[*(_QWORD *)(v51 - 216)] = ((((v391 ^ 0x9E3BE04A) >> 16) ^ 0xE8)
                               + v392[((v391 ^ 0x9E3BE04A) >> 16) ^ 0x51]
                               - 16) ^ 0x7D;
  a47[13] = ((BYTE2(v387) ^ 0xD1) + v392[BYTE2(v387) ^ 0x68] - 16) ^ 0x3E;
  a47[*(_QWORD *)(v51 - 160)] = ((((v382 ^ 0x3028CA69u) >> 24) ^ 0x13)
                               - ((2 * (((v382 ^ 0x3028CA69u) >> 24) ^ 0x13) - 76) & 0x99)
                               + 38) ^ 0x34 ^ v389[((v382 ^ 0x3028CA69u) >> 24) ^ 0x68];
  LOBYTE(v390) = -127 * (v385[v383 ^ 0xF8] ^ 0x5E);
  v393 = BYTE3(v387);
  a47[*(_QWORD *)(v51 - 176)] = v390 ^ 0x93 ^ ((v390 & 8) != 0);
  a47[*(_QWORD *)(v51 - 192)] = ((BYTE3(v387) ^ 0x7C) - ((2 * (BYTE3(v387) ^ 0x7C) - 76) & 0x99) + 38) ^ 0x8E ^ v389[v393 ^ 7];
  a47[*(_QWORD *)(v51 - 200)] = ((((v382 ^ 0x3028CA69u) >> 16) ^ 0x35)
                               + v392[((v382 ^ 0x3028CA69u) >> 16) ^ 0x8CLL]
                               - 16) ^ 0xD1;
  a47[*(_QWORD *)(v51 - 184)] = ((((v391 ^ 0x9E3BE04A) >> 24) ^ 0xC5)
                               - ((2 * (((v391 ^ 0x9E3BE04A) >> 24) ^ 0xC5) - 76) & 0x99)
                               + 38) ^ v389[((v391 ^ 0x9E3BE04A) >> 24) ^ 0xBELL] ^ 0x3E;
  LOBYTE(v390) = v392[(((v383 ^ 0xCBEE05F5) >> 16)
                                      - (((v383 ^ 0xCBEE05F5) >> 15) & 0xC2)
                                      - 31) ^ 0x22];
  LODWORD(v388) = *(_DWORD *)(v51 - 152);
  LODWORD(v368) = *(_DWORD *)(v51 - 148);
  a47[*(_QWORD *)(v51 - 168)] = (((((v383 ^ 0xCBEE05F5) >> 16)
                                 - (((v383 ^ 0xCBEE05F5) >> 15) & 0xC2)
                                 - 31) ^ 0x9B ^ (v390 - 16))
                               + 2
                               * ((v390 + 112) & ((((v383 ^ 0xCBEE05F5) >> 16)
                                                 - (((v383 ^ 0xCBEE05F5) >> 15) & 0xC2)
                                                 - 31) ^ 0x1B))) ^ 0x5E;
  v394 = (int)v388 + 199737044 < v368;
  if (v429 != ((_DWORD)v388 + 199737044) < 0x7E73B260)
    v394 = v429;
  return ((uint64_t (*)(_UNKNOWN **, uint64_t, _QWORD, uint64_t, char *, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a49 + 8 * ((744 * v394) ^ v367)) - 8))(&off_24DCDB210, v383, (2 * (v393 ^ 0x7C) - 76) & 0x99999999, v387, v385, 94, v375, v389, a9, a10, a11, a12, a13, v396, v397, v398, v399, v400, v401,
           v402,
           v403,
           v404,
           v405,
           v406,
           v407,
           v408,
           v409,
           v410,
           v411,
           v412,
           v413,
           v414,
           v415,
           v416,
           v417,
           v418,
           v419,
           v420,
           v421,
           v422,
           v423,
           v424,
           v425,
           v426,
           v427,
           v428);
}

void sub_21A5B6C6C()
{
  JUMPOUT(0x21A5B3BD0);
}

uint64_t sub_21A5B6CA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, int a14, int a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,int a52)
{
  uint64_t v52;
  int v53;

  v53 = a15 - (((((a52 - 109358827) & 0x684AFF7) - 773) ^ 0x4A5D6CE6) & (2 * a12)) - 2068678919;
  return ((uint64_t (*)(void))(*(_QWORD *)(v52
                                        + 8
                                        * ((229
                                          * (((2 * v53) & 0xB6EB77FE ^ 0x2496494) + (v53 ^ 0xFE5B0DB5) - 1073742340 == 460700155)) ^ a52))
                            - 4))();
}

uint64_t sub_21A5B6D74(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * ((235
                                          * ((((a1 + v6 - 1534442495) < 8) ^ (a6 - 115)) & 1)) ^ a6))
                            - 4))();
}

uint64_t sub_21A5B6DF8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((382 * ((a3 & 0xFFFFFFF0) == a6 + 1534442382)) ^ a6)) - 4))();
}

uint64_t sub_21A5B6E30(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _BOOL4 v28;
  int v30;

  v16 = (a1 + v13 + a2);
  v17 = v16 + ((a6 + 750) | 0x17u) + a10 - 0x7B38945B24F3D709;
  v18 = (a1 + v13) & 0xF;
  v19 = v18 - v16;
  v20 = v12 + v18 - v16;
  v21 = v18 + v12 + 1;
  v22 = v18 + 4;
  v23 = v11 + v18 + 4 - v16;
  v24 = v18 + v11 + 5;
  v25 = v19 + v10 + 3;
  v26 = v10 + v22;
  v28 = v15 < v21 && v20 < v17;
  v30 = v15 < v24 && v23 < v17 || v28;
  if (v15 < v26 && v25 < v17)
    v30 = 1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v14 + 8 * (((16 * (v30 ^ 1)) | ((v30 ^ 1) << 10)) ^ a6)) - 4))();
}

uint64_t sub_21A5B6EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  unsigned int v6;
  uint64_t v7;
  _BOOL4 v8;

  v8 = v6 < ((a6 + 1784535821) & 0x95A227F7 ^ 0x367);
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v7
                                                             + 8
                                                             * (((8 * ((((a6 - 98) ^ v8) & 1) == 0)) & 0xEF | (16 * (((a6 - 98) ^ ~v8) & 1))) ^ (a6 + 532))))(a1, a2, 0);
}

uint64_t sub_21A5B6F34(int a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  int v53;
  int v54;
  uint64_t v55;
  int v56;
  unsigned int v57;
  int8x16_t v58;
  uint64_t v59;
  int8x16_t v60;
  int8x16_t v61;
  int8x16x4_t v63;
  int8x16x4_t v64;

  v56 = a4 | 0x366;
  v63.val[1].i64[0] = ((_BYTE)v52 + 2) & 0xF;
  v63.val[1].i64[1] = ((_BYTE)v52 + 1) & 0xF;
  v63.val[2].i64[0] = v52 & 0xF;
  v63.val[2].i64[1] = ((_BYTE)v52 - 1) & 0xF;
  v63.val[3].i64[0] = ((_BYTE)v52 + 14) & 0xF;
  v63.val[3].i64[1] = ((_BYTE)v52 + 13) & 0xF;
  v57 = a1 + v54 + a2;
  v58.i64[0] = 0xF9F9F9F9F9F9F9F9;
  v58.i64[1] = 0xF9F9F9F9F9F9F9F9;
  v59 = v57 & ((v56 - 203) ^ 0x2A4);
  v63.val[0].i64[0] = v59;
  v63.val[0].i64[1] = ((_BYTE)v52 + 3) & 0xF;
  v60.i64[0] = vqtbl4q_s8(v63, (int8x16_t)xmmword_21A5D5130).u64[0];
  v64.val[0].i64[1] = ((_BYTE)v52 + 11) & 0xF;
  v64.val[1].i64[1] = ((_BYTE)v52 + 9) & 0xF;
  v64.val[2].i64[1] = (v52 + 7) & 0xF;
  v64.val[3].i64[1] = (v52 + 5) & 0xF;
  v64.val[0].i64[0] = ((_BYTE)v52 + 12) & 0xF;
  v64.val[1].i64[0] = ((_BYTE)v52 + 10) & 0xF;
  v64.val[2].i64[0] = ((_BYTE)v52 + 8) & 0xF;
  v64.val[3].i64[0] = ((_BYTE)v52 + 6) & 0xF;
  v60.i64[1] = vqtbl4q_s8(v64, (int8x16_t)xmmword_21A5D5130).u64[0];
  v61 = vrev64q_s8(vmulq_s8(v60, v58));
  *(int8x16_t *)(v55 - 15 + v57) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v51 + v59 - 15), *(int8x16_t *)(v55 - 15 + v57)), veorq_s8(*(int8x16_t *)(v59 + v50 - 11), *(int8x16_t *)(v59 + v49 - 12))), vextq_s8(v61, v61, 8uLL));
  return (*(uint64_t (**)(void))(a49 + 8 * ((1870 * ((v53 & 0xFFFFFFF0) == 16)) ^ v56)))();
}

void sub_21A5B708C()
{
  JUMPOUT(0x21A5B7014);
}

uint64_t sub_21A5B7098(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * (int)(((((v4 - 169) | 0x84) + ((v4 + 204) ^ 0xFFFFFDA0)) * (v3 != a3)) ^ v4))
                            - 12))();
}

uint64_t sub_21A5B70D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  int v7;
  uint64_t v8;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(v8
                                                                              + 8
                                                                              * ((87
                                                                                * (((((a6 + 347982065) & 0xEB4237FF)
                                                                                   - 879) & v7) == 0)) ^ a6)))(a1, a2, a3, (a6 + 241), (v6 - a3));
}

uint64_t sub_21A5B7110(int a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  int v53;
  char v54;
  int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  char v60;
  uint64_t v61;
  int8x16x4_t v63;

  *(_DWORD *)(v57 - 136) = v53 & 0xFFFFFFF8;
  v59 = -8 - a3;
  v60 = v54 + a1 + v55;
  *(_DWORD *)(v57 - 144) = (v56 - 853) | 0x50;
  v61 = (a1 + v55 + a2 + v59 + 8);
  v63.val[0].i64[0] = ((_BYTE)a1 + (_BYTE)v55 + (_BYTE)a2 + (_BYTE)v59 + 8) & 0xF;
  v63.val[0].i64[1] = (v60 + 3 + (_BYTE)v59 + 8) & 0xF;
  v63.val[1].i64[0] = (v60 + 2 + (_BYTE)v59 + 8) & 0xF;
  v63.val[1].i64[1] = (v60 + 1 + (_BYTE)v59 + 8) & 0xF;
  v63.val[2].i64[0] = (v52 + (_BYTE)v59 + 8) & 0xF;
  v63.val[2].i64[1] = (v52 + (_BYTE)v59 + 8 + ((v56 - 85) ^ 0xFD)) & 0xF;
  v63.val[3].i64[0] = (v60 + 14 + (_BYTE)v59 + 8) & 0xF;
  v63.val[3].i64[1] = (v60 + 13 + (_BYTE)v59 + 8) & 0xF;
  *(int8x8_t *)(v58 - 7 + v61) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v51 + (v61 & 0xF) - 7), *(int8x8_t *)(v58 - 7 + v61)), veor_s8(*(int8x8_t *)((v61 & 0xF) + v50 - 3), *(int8x8_t *)((v61 & 0xF) + v49 - 4))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v63, (int8x16_t)xmmword_21A5D5140), (int8x8_t)0xF9F9F9F9F9F9F9F9)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a49 + 8 * ((-(v53 & 0xFFFFFFF8) == v59) ^ (v56 - 405))) - 4))((__n128)xmmword_21A5D5140);
}

void sub_21A5B7250()
{
  JUMPOUT(0x21A5B716CLL);
}

uint64_t sub_21A5B7258()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (((((*(_DWORD *)(v2 - 144) + 261) | 0x200) ^ 0x18A)
                                          * (v0 == *(_DWORD *)(v2 - 136))) ^ *(_DWORD *)(v2 - 144)))
                            - ((*(_DWORD *)(v2 - 144) + 1450006413) & 0xA992AB77)
                            + 883))();
}

uint64_t sub_21A5B72AC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = (a5 - 460700156);
  *(_BYTE *)(v10 + v11) ^= *(_BYTE *)(v8 + (v11 & 0xF)) ^ *(_BYTE *)((v11 & 0xF) + v7 + 4) ^ *(_BYTE *)((v11 & 0xF) + v6 + 3) ^ (-7 * (v11 & 0xF));
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((58 * (a5 - 1 == v5)) ^ (a4 - 230))) - 12))();
}

void sub_21A5B7314()
{
  int v0;
  int v1;
  uint64_t v2;

  if (v0 == 1547997762)
    v1 = 1412947868;
  else
    v1 = 1412905844;
  *(_DWORD *)(v2 + 36) = v1;
}

void sub_21A5B7378(uint64_t a1)
{
  int v1;
  BOOL v2;
  int v3;

  v1 = 654962069 * (((a1 | 0x43542A0C) - (a1 & 0x43542A0C)) ^ 0xAC042A6B);
  if (*(_QWORD *)(a1 + 8))
    v2 = *(_DWORD *)a1 + v1 == 1650272409;
  else
    v2 = 1;
  v3 = !v2;
  __asm { BR              X11 }
}

uint64_t sub_21A5B7450@<X0>(uint64_t a1@<X0>, int a2@<W1>, unsigned int a3@<W8>)
{
  uint64_t v3;
  unsigned int v4;

  v4 = ((2 * *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x2B8323D6202E30CBLL)) & 0x58 ^ 0x48)
     + (*(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x2B8323D6202E30CBLL) & 0x3F ^ 0xFE78F9CB);
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v3
                                                     + 8
                                                     * ((1010
                                                       * (a2 - 1624646341 + v4 < ((a3 + 1571385051) & 0xA25693EF) - 908)) ^ a3))
                                         - 8))(((a3 - 417763508) & 0x18E693F6) + v4 + 1065870328);
}

uint64_t sub_21A5B751C()
{
  uint64_t v0;
  unsigned int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  _BOOL4 v7;

  v6 = v4 + 25625416 + ((v1 + 2138871561) & 0x808367FF);
  if (v6 <= 0x40)
    v6 = 64;
  v7 = v2 - v3 - v5 + v6 < 0xF;
  return (*(uint64_t (**)(void))(v0 + 8 * (((8 * v7) | (32 * v7)) ^ v1)))();
}

uint64_t sub_21A5B75A8(uint64_t a1, uint64_t a2, int a3, unsigned int a4, int a5)
{
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  unsigned __int8 v11;
  int v12;
  unsigned int v13;

  v10 = (v6 - 708) | 0xC0;
  v11 = ((v6 + 60) | 0xC0) ^ 0xD;
  v12 = v9 + v8;
  v13 = a3 + v9 + v8 + 717;
  if (v13 <= 0x40)
    v13 = a4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((860 * (((v7 - v12 < a5 + v13) ^ v11) & 1)) ^ v10)) - 12))();
}

uint64_t sub_21A5B75FC(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((((a2 + 32) | 0x202) ^ 0x71)
                                          * (v5 - 0x2B8323D6202E310FLL - v2 + (unint64_t)(v4 + 716) > 0xF)) ^ a2))
                            - ((a2 + 269) ^ 0x2C1)))();
}

uint64_t sub_21A5B7658@<X0>(int a1@<W0>, uint64_t a2@<X1>, int a3@<W8>)
{
  int8x16_t *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int8x16_t v8;
  int8x16_t v9;

  v8.i64[0] = 0x9292929292929292;
  v8.i64[1] = 0x9292929292929292;
  v9.i64[0] = 0x4949494949494949;
  v9.i64[1] = 0x4949494949494949;
  *(int8x16_t *)(v7 + (a1 + a3)) = vaddq_s8(vsubq_s8(*v3, vandq_s8(vaddq_s8(*v3, *v3), v8)), v9);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v4
                                                      + 8 * ((1958 * (((a2 + v6 - 447) & 0x1FFFFFFF0) == 16)) ^ v5))
                                          - (((v5 - 610) | 0x40u) ^ 0x1CCLL)))(((a2 + v6 - 447) & 0x1FFFFFFF0) - 16);
}

void sub_21A5B76C8()
{
  JUMPOUT(0x21A5B7694);
}

uint64_t sub_21A5B76D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v0
                                                      + 8
                                                      * ((((((v4 - 448) | 0x2A) + 675) ^ 0x2D6) * (v2 == v3)) ^ v4))
                                          - 12))(v1);
}

uint64_t sub_21A5B770C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int32x4_t a25,int32x4_t a26,int32x4_t a27,int32x4_t a28,int a29)
{
  uint64_t v29;
  int v30;
  const char *v31;
  uint64_t v32;
  uint64_t (*v33)(__n128, __n128, __n128, __n128);
  unsigned int *v34;
  unsigned int *v35;
  __n128 v36;
  __n128 v37;
  __n128 v38;
  uint64_t v39;
  int v40;
  __n128 v41;
  int *v42;
  _DWORD *v43;
  int v44;
  int v45;
  unsigned int v46;
  uint64_t v47;
  unsigned int v48;
  unsigned int v49;
  int v50;
  uint8x16_t v51;
  uint16x8_t v52;
  int8x16_t v53;
  uint16x8_t v54;
  int8x16_t v55;
  uint8x16_t v56;
  uint16x8_t v57;
  uint16x8_t v58;
  int8x16_t v59;
  int8x16_t v60;
  int8x16_t v61;
  int8x16_t v62;
  uint8x16_t v63;
  int8x16_t v66;
  int8x16_t v71;
  _BYTE *v72;
  uint64_t v74;
  uint8x16_t v75;
  uint16x8_t v76;
  uint16x8_t v77;
  uint8x16_t v78;
  uint8x16_t v83;
  uint16x8_t v84;
  uint16x8_t v85;
  unsigned __int32 v86;
  unint64_t v87;
  _DWORD *v88;
  unsigned int *v89;
  uint64_t v90;
  unsigned __int8 *v91;
  _DWORD *v92;
  int8x16x4_t v93;
  int8x16x4_t v94;

  v33 = (uint64_t (*)(__n128, __n128, __n128, __n128))(((v30 + 143) ^ 0xFFFFFFFFFFFFFF45)
                                                               + *(_QWORD *)(v29 + 8 * v30));
  v92 = (_DWORD *)(v32 - 0x2B8323D6202E30C7);
  v34 = (unsigned int *)(v32 - 0x2B8323D6202E30BFLL);
  v35 = (unsigned int *)(v32 - 0x2B8323D6202E30BBLL);
  v91 = (unsigned __int8 *)(v32 - 0x2B8323D6202E30AFLL);
  v88 = (_DWORD *)(v32 - 0x2B8323D6202E30B7);
  HIDWORD(v90) = HIDWORD(a9) - 1272489618;
  v36.n128_u64[0] = 0x4949494949494949;
  v36.n128_u64[1] = 0x4949494949494949;
  v37 = (__n128)vdupq_n_s32(0xBB285E36);
  v38 = (__n128)vdupq_n_s32(0x5D942F1Bu);
  HIDWORD(a24) = 2 * (a19 ^ 0x18E);
  v39 = HIDWORD(a24) ^ 0x44u;
  v40 = (a19 - 1121774331) & 0x42DCEBDF;
  LODWORD(v90) = a19 ^ 0xA8;
  v41.n128_u64[0] = 0x9292929292929292;
  v41.n128_u64[1] = 0x9292929292929292;
  v42 = (int *)(v32 - 0x2B8323D6202E30C3);
  v89 = v34;
  v43 = v34;
  HIDWORD(a22) = *v92;
  v44 = *v42;
  v45 = *v42;
  v46 = *v34;
  v47 = *v34;
  v48 = *v35;
  v49 = *v35;
  v50 = *v91 ^ 0x73;
  if (v50 == 2)
  {
    HIDWORD(a19) = *v42;
    v74 = *v88;
    v94 = vld4q_s8(v31);
    HIDWORD(a12) = *v88;
    v75 = (uint8x16_t)veorq_s8(v94.val[0], (int8x16_t)v36);
    v76 = vmovl_u8(*(uint8x8_t *)v75.i8);
    v77 = vmovl_high_u8(v75);
    v78 = (uint8x16_t)veorq_s8(v94.val[1], (int8x16_t)v36);
    _Q21 = vmovl_u8(*(uint8x8_t *)v78.i8);
    _Q20 = vmovl_high_u8(v78);
    __asm
    {
      SHLL2           V22.4S, V20.8H, #0x10
      SHLL2           V23.4S, V21.8H, #0x10
    }
    v83 = (uint8x16_t)veorq_s8(v94.val[2], (int8x16_t)v36);
    v84 = vmovl_high_u8(v83);
    v85 = vmovl_u8(*(uint8x8_t *)v83.i8);
    v94.val[0] = veorq_s8(v94.val[3], (int8x16_t)v36);
    v94.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v94.val[0]);
    v94.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v94.val[1]);
    v94.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v94.val[0].i8);
    v94.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v94.val[0]);
    v94.val[0] = vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v85.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v76.i8), 0x18uLL)), (int8x16_t)vmovl_u16(*(uint16x4_t *)v94.val[0].i8));
    v94.val[3] = vorrq_s8(vorrq_s8(vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v85, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v76), 0x18uLL)), v94.val[3]);
    v94.val[1] = vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q20.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v84.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v77.i8), 0x18uLL)), (int8x16_t)vmovl_u16(*(uint16x4_t *)v94.val[1].i8));
    v94.val[2] = vorrq_s8(vorrq_s8(vorrq_s8(_Q22, (int8x16_t)vshll_high_n_u16(v84, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v77), 0x18uLL)), v94.val[2]);
    a27 = vaddq_s32(vsubq_s32((int32x4_t)v94.val[1], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v94.val[1], (int32x4_t)v94.val[1]), (int8x16_t)v37)), (int32x4_t)v38);
    a28 = vaddq_s32(vsubq_s32((int32x4_t)v94.val[2], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v94.val[2], (int32x4_t)v94.val[2]), (int8x16_t)v37)), (int32x4_t)v38);
    a25 = vaddq_s32(vsubq_s32((int32x4_t)v94.val[0], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v94.val[0], (int32x4_t)v94.val[0]), (int8x16_t)v37)), (int32x4_t)v38);
    a26 = vaddq_s32(vsubq_s32((int32x4_t)v94.val[3], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v94.val[3], (int32x4_t)v94.val[3]), (int8x16_t)v37)), (int32x4_t)v38);
    v86 = (2 * (a27.i32[0] ^ a28.i32[1])) & 0xBB285E36;
    HIDWORD(v87) = *((_DWORD *)&a25 + v39 - 554) ^ a25.i32[2] ^ ((a27.i32[0] ^ a28.i32[1]) + 1569992475 - v86) ^ 0x5D942F1B;
    LODWORD(v87) = *((_DWORD *)&a25 + v39 - 554) ^ a25.i32[2] ^ ((a27.i32[0] ^ a28.i32[1]) + 1569992475 - v86);
    a29 = (v87 >> 31) + 1569992475 - ((2 * (v87 >> 31)) & 0xBB285E36);
    return ((uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *, unsigned int *, int *, uint64_t, unsigned __int8 *, unsigned int *, uint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128), uint64_t, _DWORD *, uint64_t))(*(_QWORD *)(v29 + 8 * SHIDWORD(a24)) - 8))(a25.u32[2], -1704758748, 1704758764, 3399417714, v47, v74, 3139984950, 1699708857, a9, a7, a11, a12, v88, v89, v42, v90, v91, v35, a19,
             __PAIR64__(v48, v46),
             v33,
             a22,
             v92,
             a24);
  }
  else if (v50 == 1)
  {
    HIDWORD(a19) = *v42;
    v93 = vld4q_s8(v31);
    v51 = (uint8x16_t)veorq_s8(v93.val[0], (int8x16_t)v36);
    v52 = vmovl_high_u8(v51);
    v53 = (int8x16_t)vmovl_high_u16(v52);
    v54 = vmovl_u8(*(uint8x8_t *)v51.i8);
    v55 = (int8x16_t)vmovl_high_u16(v54);
    v56 = (uint8x16_t)veorq_s8(v93.val[1], (int8x16_t)v36);
    v57 = vmovl_u8(*(uint8x8_t *)v56.i8);
    v58 = vmovl_high_u8(v56);
    v59 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v57.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v54.i8));
    v60 = vorrq_s8((int8x16_t)vshll_high_n_u16(v57, 8uLL), v55);
    v61 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v58.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v52.i8));
    v62 = vorrq_s8((int8x16_t)vshll_high_n_u16(v58, 8uLL), v53);
    v63 = (uint8x16_t)veorq_s8(v93.val[2], (int8x16_t)v36);
    _Q21 = (int8x16_t)vmovl_high_u8(v63);
    _Q20 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v63.i8);
    v66 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q20.i8, 0x10uLL);
    __asm { SHLL2           V20.4S, V20.8H, #0x10 }
    v71 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL);
    __asm { SHLL2           V21.4S, V21.8H, #0x10 }
    v93.val[0] = veorq_s8(v93.val[3], (int8x16_t)v36);
    v93.val[1] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v93.val[0].i8);
    v93.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v93.val[0]);
    v93.val[2] = vorrq_s8(vorrq_s8(v59, v66), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v93.val[1].i8), 0x18uLL));
    v93.val[1] = vorrq_s8(vorrq_s8(v60, _Q20), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16((uint16x8_t)v93.val[1]), 0x18uLL));
    v93.val[3] = vorrq_s8(vorrq_s8(v61, v71), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v93.val[0].i8), 0x18uLL));
    v93.val[0] = vorrq_s8(vorrq_s8(v62, _Q21), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16((uint16x8_t)v93.val[0]), 0x18uLL));
    a27 = vaddq_s32(vsubq_s32((int32x4_t)v93.val[3], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v93.val[3], (int32x4_t)v93.val[3]), (int8x16_t)v37)), (int32x4_t)v38);
    a28 = vaddq_s32(vsubq_s32((int32x4_t)v93.val[0], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v93.val[0], (int32x4_t)v93.val[0]), (int8x16_t)v37)), (int32x4_t)v38);
    a25 = vaddq_s32(vsubq_s32((int32x4_t)v93.val[2], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v93.val[2], (int32x4_t)v93.val[2]), (int8x16_t)v37)), (int32x4_t)v38);
    a26 = vaddq_s32(vsubq_s32((int32x4_t)v93.val[1], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v93.val[1], (int32x4_t)v93.val[1]), (int8x16_t)v37)), (int32x4_t)v38);
    v72 = (char *)*(&off_24DCDB210 + v40 - 138) - 12;
    return ((uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *, unsigned int *, int *, uint64_t, unsigned __int8 *, unsigned int *, uint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128), uint64_t, _DWORD *, uint64_t))(*(_QWORD *)(v29 + 8 * (v40 ^ 0x380u)) - 12))(-(*v72 - 49), -1704758748, 1704758764, 3399417714, v47, v72, 3173854332, 1699708857, a9, a7, a11, a12, v88, v89, v42, v90, v91, v35, a19,
             __PAIR64__(v48, v46),
             v33,
             a22,
             v92,
             a24);
  }
  else
  {
    *v92 = 2 * (*v92 ^ 0x654F7FB9) + 1699708857 - ((4 * (*v92 ^ 0x654F7FB9)) & 0xCA9EFF72);
    *v42 = (v45 ^ 0x654F7FB9)
         + (v44 ^ 0x654F7FB9)
         + 1699708857
         - ((2 * ((v45 ^ 0x654F7FB9) + (v44 ^ 0x654F7FB9))) & 0xCA9EFF72);
    *v43 = (v47 ^ 0x654F7FB9)
         + (v46 ^ 0x654F7FB9)
         + 1699708857
         - ((2 * ((v47 ^ 0x654F7FB9) + (v46 ^ 0x654F7FB9))) & 0xCA9EFF72);
    *v35 = (v49 ^ 0x654F7FB9)
         + (v48 ^ 0x654F7FB9)
         + 1699708857
         - ((2 * ((v49 ^ 0x654F7FB9) + (v48 ^ 0x654F7FB9))) & 0xCA9EFF72);
    return v33(v36, v37, v38, v41);
  }
}

uint64_t sub_21A5B8334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, unsigned int a17, uint64_t a18, uint64_t a19, int a20)
{
  uint64_t v20;
  _BOOL4 v21;

  if (a17 < 0x16848207 != (a10 - 252696257) < 0x16848207)
    v21 = (a10 - 252696257) < 0x16848207;
  else
    v21 = a10 - 252696257 > a17;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v20 + 8 * ((v21 * ((7 * a16) ^ 0x9E)) ^ (a20 - 81)))
                                          - (a20 + 659)
                                          + 836))(1040245160);
}

uint64_t sub_21A5B83C0()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((445
                                          * (v2 + v3 + 63 >= 17 * (v1 ^ 0x72)
                                                           + v3
                                                           + ((37 * (v1 ^ 0x72)) ^ (v2 - 222)))) ^ v1))
                            - 12))();
}

uint64_t sub_21A5B8414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  _BOOL4 v16;

  v16 = a11 - 0x2B8323D6202E310FLL - v11 - (unint64_t)(v15 + v14) < 0x10;
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * (v13 ^ ((2 * v16) | (32 * v16))))
                            - ((v13 + 196032168) & 0xF450C9BB)
                            + 173))();
}

uint64_t sub_21A5B8478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  char v12;
  char v13;
  int v14;

  *(_BYTE *)(v10 + v8) = (v9 ^ v12)
                       + *(_BYTE *)(v6 + (v14 + v11))
                       - (v13 & (2 * *(_BYTE *)(v6 + (v14 + v11))))
                       + 69;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (((v8 != 63) * a6) ^ (v9 + 31))) - 12))();
}

uint64_t sub_21A5B84C4(int8x16_t a1, double a2, double a3, int8x16_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int8x16_t *v7;
  int v8;
  int v9;

  *v7 = vaddq_s8(vsubq_s8(*(int8x16_t *)(v4 + (v9 + v8)), vandq_s8(vaddq_s8(*(int8x16_t *)(v4 + (v9 + v8)), *(int8x16_t *)(v4 + (v9 + v8))), a4)), a1);
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((((v6 - 185) | 4) + 46) ^ (v6 + 31))) - 12))();
}

uint64_t sub_21A5B8520(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10)
{
  uint64_t v10;
  int v11;
  int v12;
  unsigned int v13;
  int v14;
  _BOOL4 v15;

  v13 = v12 - 683447285 + ((v11 - 708) | 0x31);
  v14 = ((a10 - 1703240397) < 0xFCD7C5CC) ^ (v13 < 0xFCD7C5CC);
  v15 = v13 < a10 - 1703240397;
  if (v14)
    v15 = (a10 - 1703240397) < 0xFCD7C5CC;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((1796 * v15) ^ v11)) - 12))();
}

uint64_t sub_21A5B85A8(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  int v10;
  int v11;
  _BOOL4 v12;
  unsigned int v13;
  int v14;
  _BOOL4 v15;

  v11 = v7 - 318;
  v12 = v8 < v5;
  *(_BYTE *)(a3 - 0x2B8323D6202E310FLL + (a1 - 1040245160)) = *(_BYTE *)(v3 + (v10 + v9))
                                                                          + ~((5 * (v11 ^ 0x2B) - 39) & (2 * *(_BYTE *)(v3 + (v10 + v9))))
                                                                          + 74;
  v13 = v6 + v10 + 186;
  v14 = v12 ^ (v13 < v5);
  v15 = v13 < v8;
  if (!v14)
    v12 = v15;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((322 * !v12) ^ v11)) - 12))();
}

void sub_21A5B8640()
{
  JUMPOUT(0x21A5B85D4);
}

uint64_t sub_21A5B864C@<X0>(int a1@<W7>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  int v4;

  v4 = 1613850677 * (((((v3 - 112) | 0x823B411A) ^ 0xFFFFFFFE) - (~(v3 - 112) | 0x7DC4BEE5)) ^ 0x409FD0E2);
  *(_QWORD *)(v3 - 112) = a2;
  *(_DWORD *)(v3 - 104) = (v2 + 422) ^ v4;
  *(_DWORD *)(v3 - 100) = v4 ^ (a1 + 44545099);
  return sub_21A5A4A54(v3 - 112);
}

void sub_21A5B8774(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _QWORD v6[2];
  int v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  int32x4_t v28;
  int32x4_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  unint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  char v38;
  char v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 16) - 1613850677 * ((a1 & 0x7C50AF42 | ~(a1 | 0x7C50AF42)) ^ 0xBEF43EBA);
  v3 = *(_QWORD *)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v30 = v2 - 0x2B8323D6202E30CBLL;
  v24 = v2 - 0x2B8323D6202E30AFLL;
  v27 = v2 - 0x2B8323D6202E30B3;
  v31 = v2 - 0x2B8323D6202E30C7;
  v33 = ((unint64_t)&v38 ^ 0xDBFD56EF99BEEFF1)
      + 0x6DBAAF9DEF59F970
      + ((2 * (_QWORD)&v38) & 0xB7FAADDF337DDFE0);
  v37 = v2 + 0x4C5F0E2A3D84AA9DLL;
  v22 = v2 - 0x2B8323D6202E30ABLL;
  v6[0] = v3;
  v6[1] = v3 + 0x45A37EAF9013F543;
  v20 = v2 - 0x2B8323D6202E30D7;
  v19 = v2 - 0x2B8323D6202E30D6;
  v18 = v2 - 0x2B8323D6202E30D5;
  v17 = v2 - 0x2B8323D6202E30D4;
  v16 = v2 - 0x2B8323D6202E30CFLL;
  v15 = v2 - 0x2B8323D6202E30D3;
  v14 = v2 - 0x2B8323D6202E30D2;
  v13 = v2 - 0x2B8323D6202E30D1;
  v12 = v2 - 0x2B8323D6202E30D0;
  v25 = (char *)&v6[0xF8838B6BCD968C54] + 6;
  v8 = v2 - 0x2B8323D66CE1EEFFLL;
  v9 = (v1 + 1530603490) & 0xA4C4D86F;
  v7 = v1 ^ 0x2B;
  v21 = v1 + 225841325;
  v11 = (v1 + 1068785111) & 0xC04BA3FF;
  v10 = v1 - 1385711968;
  v32 = &v39;
  v26 = 0x3BE3A4A1934B9F2ALL;
  v34 = v1 ^ 0x92;
  v36 = v1;
  v35 = v2 - 0x2B8323D6202E310FLL;
  v28 = vdupq_n_s32(0x5D942F1Bu);
  v29 = vdupq_n_s32(0xBB285E36);
  v4 = (char *)*(&off_24DCDB210 + (v1 ^ 0x2B)) - 12;
  v23 = *(_QWORD *)&v4[8 * v1] - 12;
  v5 = *(_DWORD *)(v2 - 0x2B8323D6202E30CBLL) & 0x3F;
  *(_BYTE *)(v2 - 0x2B8323D6202E310FLL + (v5 ^ 0x27)) = -55;
  __asm { BR              X8 }
}

uint64_t sub_21A5B8B78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  int v14;
  uint64_t v15;

  return ((uint64_t (*)(void))(*(_QWORD *)(v15 + 8 * (((v14 != (a14 ^ 0x56)) * ((2 * a14) ^ 0x3F)) ^ a14)) - 12))();
}

uint64_t sub_21A5B8BB4()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((44 * ((v0 ^ 0x251 ^ ((v1 ^ 0x3C0) + 749000635) & 0xD35B277B) > 7)) | v1 ^ 0x3C0))
                            - 12))();
}

uint64_t sub_21A5B8C04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(a3 + v5 - 1286847984) = v7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * (int)((107
                                               * (((v4 + 807785562) & 0xCFDA2B7E ^ 0x22ALL) != (((v4 + 807785562) & 0xCFDA2B7E ^ 0x21A) & v3))) ^ (v4 + 807785562) & 0xCFDA2B7E))
                            - 4))();
}

uint64_t sub_21A5B8C7C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((891 * (((v1 == v0) ^ ((v2 ^ 0x1F) + v2 - 82)) & 1)) ^ v2))
                            - 12))();
}

uint64_t sub_21A5B8CC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  char v7;
  uint64_t v8;

  *(_BYTE *)(a3 + v4 + v5) = v7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * (((((((v3 ^ v6) - 86) | 4u) ^ (unint64_t)(v5 - 10)) + v4 < 0x40) * v6) ^ v3 ^ v6))
                            - 12))();
}

void sub_21A5B8CFC()
{
  JUMPOUT(0x21A5B8CC4);
}

uint64_t sub_21A5B8D04@<X0>(uint64_t a1@<X1>, unint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X7>, int a7@<W8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
  int v52;
  int v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  int v57;
  int v58;
  int v59;
  uint64_t v60;
  int v61;
  _BOOL4 v63;
  _BOOL4 v66;
  uint64_t (*v67)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t);
  unint64_t v68;

  v67 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 + 8 * (a7 - 3)) - 4);
  v55 = &a52 + a28 + ((3 * (a7 ^ 0x13A) - 78608944) & 0x4AF76BF ^ 0xC41C5B5E6CB46111);
  v68 = a27 + a28;
  v56 = *(unsigned int *)(a48 - 0x77E232005DB2DB60);
  v57 = *(_DWORD *)(a48 - 0x77E232005DB2DB5CLL);
  v58 = *(_DWORD *)(a48 - 0x77E232005DB2DB58);
  v59 = *(unsigned __int8 *)(a48 - 0x77E232005DB2DB4CLL) ^ 0x73;
  if (v59 == 2)
  {
    v66 = a2 >= v68 || (unint64_t)v55 >= a2 + 64;
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v54 + 8 * (((HIDWORD(a39) - 51) * v66) ^ ((int)a1 + 145)))
                                            - 7 * (a1 ^ 4)
                                            + 125))(v56);
  }
  else if (v59 == 1)
  {
    v60 = ((_DWORD)a1 + 817) | 0x20u;
    v61 = a1 + 642;
    v63 = a2 < v68 && (unint64_t)v55 < a2 + 64;
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v54 + 8 * (v61 ^ (52 * v63))) - (v60 ^ 0x360)))(v56);
  }
  else
  {
    *(_DWORD *)(a48 - 0x77E232005DB2DB64) = 2 * (*(_DWORD *)(a48 - 0x77E232005DB2DB64) ^ v52)
                                            + v52
                                            - (v53 & (4 * (*(_DWORD *)(a48 - 0x77E232005DB2DB64) ^ v52)));
    *(_DWORD *)(a48 - 0x77E232005DB2DB60) = (*(_DWORD *)(a48 - 0x77E232005DB2DB60) ^ v52)
                                            + (v56 ^ v52)
                                            + v52
                                            - (v53 & (2 * ((*(_DWORD *)(a48 - 0x77E232005DB2DB60) ^ v52) + (v56 ^ v52))));
    *(_DWORD *)(a48 - 0x77E232005DB2DB5CLL) = (*(_DWORD *)(a48 - 0x77E232005DB2DB5CLL) ^ v52)
                                            + (v57 ^ v52)
                                            + v52
                                            - (v53 & (2 * ((*(_DWORD *)(a48 - 0x77E232005DB2DB5CLL) ^ v52) + (v57 ^ v52))));
    *(_DWORD *)(a48 - 0x77E232005DB2DB58) = (*(_DWORD *)(a48 - 0x77E232005DB2DB58) ^ v52)
                                            + (v58 ^ v52)
                                            + v52
                                            - (v53 & (2 * ((*(_DWORD *)(a48 - 0x77E232005DB2DB58) ^ v52) + (v58 ^ v52))));
    return v67(v56, a1, a2, a3, a4, a5, a2, a6, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18,
             a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30,
             a31,
             a32,
             a33,
             a34,
             a35,
             a36,
             a37,
             a38,
             a39,
             v68,
             a41,
             a42);
  }
}

uint64_t sub_21A5BA778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,int a43,int a44)
{
  uint64_t v44;

  return (*(uint64_t (**)(void))(v44 + 8 * ((a44 + 883) ^ (62 * (a10 != 0xBECB11EB0E224676)))))();
}

void sub_21A5BA7C0()
{
  JUMPOUT(0x21A5B8B04);
}

uint64_t sub_21A5BA810(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,_DWORD *a30)
{
  uint64_t v30;
  int v31;

  v31 = *a30 - ((2 * *a30 + 1931622746) & 0x7F7CDD5A) + 961514330;
  return ((uint64_t (*)(void))(*(_QWORD *)(v30
                                        + 8
                                        * ((109
                                          * (((a2 - 1212227609) & (2 * v31) ^ 0x373CDD5A)
                                           + (v31 ^ 0xE4610152)
                                           + 1031790414 == 425676621)) ^ (a2 + 930)))
                            - 8))();
}

void sub_21A5BABA4(uint64_t a1)
{
  int v1;
  int v2;

  v1 = 888531001 * ((2136978301 - (a1 | 0x7F5FB37D) + (a1 | 0x80A04C82)) ^ 0xD471F5E6);
  v2 = *(_DWORD *)(a1 + 16) ^ v1;
  __asm { BR              X12 }
}

uint64_t sub_21A5BAC84()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((*(_QWORD *)(v1 + 8) == 0) * ((((v0 & 0x466D0677) - 706) ^ 0x2E) - 255)) ^ v0 & 0x466D0677)))();
}

uint64_t sub_21A5BACC0()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _DWORD *v4;

  v4 = *(_DWORD **)(v1 + 64);
  **(_QWORD **)(v1 + 56) = 0;
  *v4 = 0;
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((*(unsigned __int8 *)(v3 + 5) != (((v0 - 63) | 0x11) ^ 0x10))
                                * (((v0 - 546174934) & 0x208DF7DF) - 211)) ^ v0)))();
}

uint64_t sub_21A5BAD24()
{
  uint64_t v0;
  uint64_t v1;
  unsigned int v2;

  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((1345
                                * (*(unsigned __int8 *)(*(_QWORD *)(v0 + 40) + 1) == (91 * (v2 ^ 0x4A) + 80))) ^ v2)))();
}

uint64_t sub_21A5BAD60@<X0>(uint64_t a1@<X8>, uint64_t a2, char a3, char a4, int a5, unsigned int a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;

  a6 = v11 - 369883897 * ((((2 * &a3) | 0xB2A4508E) - &a3 - 1498556487) ^ 0x45795273) - 101;
  a4 = (((2 * v8) ^ 0x86) + ((((v11 + 50) & 0xBF) + 1) ^ v8) + 111) ^ (-7
                                                                     * ((((2 * &a3) | 0x8E)
                                                                       - &a3
                                                                       - 71) ^ 0x73));
  a3 = (-7 * ((((2 * &a3) | 0x8E) - &a3 - 71) ^ 0x73)) ^ 0xD3;
  a7 = v10 + 0x4676462BE8F68086;
  a8 = v12;
  v13 = (*(uint64_t (**)(char *))(a1 + 8 * (v11 ^ 0x5C)))(&a3);
  return (*(uint64_t (**)(uint64_t))(v9
                                            + 8
                                            * ((225 * (a5 == ((v11 + 423866384) & 0x66BC4FB7 ^ 0x5437DE8D))) ^ v11)))(v13);
}

uint64_t sub_21A5BAE5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  *(_BYTE *)(v13 + 1) = 98;
  *v12 = 0;
  v14 = bswap32(*(_DWORD *)(v10 + 8));
  v15 = ((unint64_t)&a9 ^ 0x77DEFD9CFFFDEE6ALL)
      - 0x40C1C846064E008
      + ((2 * (_QWORD)&a9) & 0xEFBDFB39FFFBDCD0);
  *(_BYTE *)(v14 + v10 + 11) = ((v15 - 98) ^ 0xBA) * (v15 + ((v11 - 42) ^ 0xBE));
  *(_BYTE *)(v14 + v10 + 10) = ((v15 - 97) ^ 0xBA) * (v15 - 80);
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((99 * (((v14 + 12) & 0x1FFFFFFFELL) == 2)) ^ v11)) - 12))();
}

void sub_21A5BAF3C()
{
  JUMPOUT(0x21A5BAEF4);
}

void sub_21A5BAF48()
{
  int v0;
  uint64_t v1;
  _BYTE *v2;

  *v2 = -1;
  *(_DWORD *)(v1 + 48) = v0;
}

void sub_21A5BAFEC(uint64_t a1)
{
  int v1;
  _BOOL4 v3;

  v1 = 369883897 * (((a1 | 0xB94DE065) - (a1 & 0xB94DE065)) ^ 0xA5669A51);
  v3 = (*(_BYTE *)(a1 + 1) ^ v1) != 0x6E && *(_QWORD *)(a1 + 16) != 0x4676462BE8F6807ALL;
  __asm { BR              X10 }
}

void sub_21A5BB3C8(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 8) + 1398264479 * ((2 * (a1 & 0x5B8A35B0) - a1 - 1535784369) ^ 0xD58D06A8);
  __asm { BR              X15 }
}

uint64_t sub_21A5BB514()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((v0 ^ 0x51) - 220) ^ 0x139)
                                * (((2 * v1) & 0xA6EFD77E ^ 0x264D024E) + (v1 ^ 0x4C517AD8) - 35711868 != 1364656195)) ^ v0)))();
}

uint64_t sub_21A5BB584(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * (((a3 + a2 - 1400368063 < ((a8 - 629949115) & 0x258C43FF ^ 0x260u))
                                          * (((a8 - 291) | 0x1E4) - 453)) ^ a8))
                            - 8))();
}

uint64_t sub_21A5BB5E8()
{
  unsigned int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((1558
                                * ((v1 & 0xFFFFFFF0) == ((155 * (v0 ^ 0x26D) - 364683546) & 0x15BC9FF6 ^ 0x5377EA24))) ^ v0)))();
}

uint64_t sub_21A5BB640(uint64_t a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  BOOL v22;
  unint64_t v23;
  int v25;

  v14 = (a3 + a2 + a4);
  v15 = v14 + a5;
  v16 = a10 - 0xD7B175E7A17DF29 + v14;
  v17 = (a3 + a2) & 0xF;
  v18 = v17 + v10 - v16;
  v19 = (v17 | v11) - v16;
  v20 = (v17 | v12) - v16;
  v22 = v15 - v16 + (((a7 - 737) | 0x410u) ^ 0x95C9D0E835E652CELL) > 0xF
     && v18 >= (unint64_t)((a7 - 327) | 0x24u) - 468
     && v19 > 0xF;
  v23 = v20 + 2;
  v25 = v22 && v23 > 0xF;
  return ((uint64_t (*)(void))(*(_QWORD *)(v13 + 8 * (a7 | (16 * v25))) - 12))();
}

uint64_t sub_21A5BB6E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  unsigned int v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((119 * (v8 < ((a8 - 1750658616) & 0x6858EAEF ^ 0xFEu))) ^ a8))
                            - 8))();
}

uint64_t sub_21A5BB728@<X0>(int a1@<W1>, int a2@<W2>, int a3@<W3>, int a4@<W7>, int a5@<W8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int8x16_t v26;
  uint64_t v27;
  int8x16_t v28;
  int8x16_t v29;
  int8x16x4_t v31;
  int8x16x4_t v32;

  *(_DWORD *)(v25 - 128) = a5 + 7;
  v31.val[1].i64[0] = a5 & 0xF;
  v31.val[1].i64[1] = ((_BYTE)a5 - 1) & 0xF;
  v31.val[2].i64[0] = ((_BYTE)a5 + 14) & 0xF;
  v31.val[2].i64[1] = ((_BYTE)a5 + 13) & 0xF;
  v31.val[3].i64[0] = ((_BYTE)a5 + 12) & 0xF;
  v31.val[3].i64[1] = ((_BYTE)a5 + 11) & 0xF;
  v26.i64[0] = 0x4B4B4B4B4B4B4B4BLL;
  v26.i64[1] = 0x4B4B4B4B4B4B4B4BLL;
  v27 = ((_BYTE)a2 + (_BYTE)a1 + (_BYTE)a3) & 0xF;
  v31.val[0].i64[0] = v27;
  v31.val[0].i64[1] = ((_BYTE)a5 + 1) & 0xF;
  v28.i64[0] = vqtbl4q_s8(v31, (int8x16_t)xmmword_21A5D5130).u64[0];
  v32.val[0].i64[1] = ((_BYTE)a5 + 9) & 0xF;
  v32.val[1].i64[1] = *(_DWORD *)(v25 - 128) & 0xF;
  v32.val[2].i64[1] = ((_BYTE)a5 + 5) & 0xF;
  v32.val[3].i64[1] = ((_BYTE)a5 + 3) & 0xF;
  v32.val[0].i64[0] = ((_BYTE)a5 + 10) & 0xF;
  v32.val[1].i64[0] = ((_BYTE)a5 + 8) & 0xF;
  v32.val[2].i64[0] = ((_BYTE)a5 + 6) & 0xF;
  v32.val[3].i64[0] = ((_BYTE)a5 + 4) & 0xF;
  v28.i64[1] = vqtbl4q_s8(v32, (int8x16_t)xmmword_21A5D5130).u64[0];
  v29 = vrev64q_s8(vmulq_s8(v28, v26));
  *(int8x16_t *)(*(_QWORD *)(v25 - 120) - 15 + (a2 + a1 + a3)) = veorq_s8(veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v21 + v27 - 15), *(int8x16_t *)(v20 - 15 + (a2 + a1 + a3))), *(int8x16_t *)(v22 + v27 - 15)), *(int8x16_t *)(v23+ v27+ ((a4 - 963) ^ 0x71)- 15)), vextq_s8(v29, v29, 8uLL));
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a20 + 8 * ((618 * ((v24 & 0xFFFFFFF0) == 16)) ^ (a4 - 963)))
                                          - 8))(v24);
}

void sub_21A5BB8A4()
{
  JUMPOUT(0x21A5BB82CLL);
}

uint64_t sub_21A5BB8B0(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v3
                                                     + 8
                                                     * ((904
                                                       * ((v2 ^ 0x1F269167) != ((v1 - 1646992815) & 0x622B1DFF) - 511)) ^ v1)))(a1, 562319695);
}

uint64_t sub_21A5BB908(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  _BOOL4 v17;

  v13 = v8 > 0xA42633EB;
  *(_BYTE *)(*(_QWORD *)(v12 - 120) + (a2 - 562319695)) = *(_BYTE *)(v4 + ((a2 - 562319695) & 0xFLL)) ^ *(_BYTE *)(v2 + (a2 - 562319695)) ^ *(_BYTE *)(v5 + ((a2 - 562319695) & 0xFLL)) ^ *(_BYTE *)(((v3 - 1202072495) & 0x47A62BFF) + ((a2 - 562319695) & 0xFLL) + v6 - 509) ^ (75 * ((a2 - 79) & 0xF));
  v14 = a2 + 978680518;
  v15 = (a2 + 1);
  v16 = v13 ^ (v14 < v7);
  v17 = v14 < v9;
  if (!v16)
    v13 = v17;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8 * ((v13 * v10) ^ v3)))(a1, v15);
}

uint64_t sub_21A5BB9B8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v12;
  uint64_t v13;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v13 + 8 * (a8 ^ (2000 * (a1 == v12))))
                                          - (a8 - 454)
                                          - ((a8 + 1276692488) & 0xB3E7367A)
                                          + 1083))(a12);
}

uint64_t sub_21A5BBA04()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (v1 | (32
                                     * (((((v1 + 259129783) & 0xF08DFCEE) - 230) & v0) == (((v1 - 324) | 0xE0) ^ 0x1E4))))))();
}

uint64_t sub_21A5BBA4C@<X0>(int a1@<W1>, int a2@<W2>, int a3@<W3>, int a4@<W6>, char a5@<W8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  int8x16x4_t v32;

  *(_DWORD *)(v28 - 160) = v20;
  *(_DWORD *)(v28 - 144) = v26;
  *(_QWORD *)(v28 - 136) = *(_QWORD *)(v28 - 120) - 7;
  *(_QWORD *)(v28 - 128) = v21 - 7;
  *(_DWORD *)(v28 - 152) = v26 & 0xFFFFFFF8;
  v29 = a2 + a1 + v27;
  v30 = (a2 + a1 + a3 - v25);
  v32.val[0].i64[0] = ((_BYTE)a2 + (_BYTE)a1 + (_BYTE)a3 - (_BYTE)v25) & 0xF;
  v32.val[0].i64[1] = (v29 - 5 - (_BYTE)v25) & 0xF;
  v32.val[1].i64[0] = (a5 - (_BYTE)v25) & 0xF;
  v32.val[1].i64[1] = (v29 + 9 - (_BYTE)v25) & 0xF;
  v32.val[2].i64[0] = (v29 + 8 - (_BYTE)v25) & 0xF;
  v32.val[2].i64[1] = (v29 - (_BYTE)v25 + ((a4 + 23) | 2)) & 0xF;
  v32.val[3].i64[0] = (v29 + 6 - (_BYTE)v25) & 0xF;
  v32.val[3].i64[1] = (v29 + 5 - (_BYTE)v25) & 0xF;
  *(int8x8_t *)(*(_QWORD *)(v28 - 136) + v30) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v22 + (v30 & 0xF) - 7), *(int8x8_t *)(*(_QWORD *)(v28 - 128) + v30)), veor_s8(*(int8x8_t *)(v23 + (v30 & 0xF) - 7), *(int8x8_t *)((v30 & 0xF) + v24 - 5))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v32, (int8x16_t)xmmword_21A5D5140), (int8x8_t)0x4B4B4B4B4B4B4B4BLL)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a20 + 8 * ((478 * (8 - (v26 & 0xFFFFFFF8) == -v25)) ^ a4)) - 8))((__n128)xmmword_21A5D5140);
}

void sub_21A5BBB94()
{
  JUMPOUT(0x21A5BBAB0);
}

uint64_t sub_21A5BBB9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v12;
  uint64_t v13;
  uint64_t v14;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v13
                                                                                                  + 8 * (v12 ^ (1810 * (*(_DWORD *)(v14 - 144) == *(_DWORD *)(v14 - 152)))))
                                                                                      - 7 * (v12 ^ 0x34Eu)
                                                                                      + 499))(a12, a2, a3, a4, a5, v12 ^ 0x2E3u);
}

uint64_t sub_21A5BBBE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = (v7 - 1364656958);
  *(_BYTE *)(*(_QWORD *)(v13 - 120) + v14) = *(_BYTE *)(v8 + (v14 & 0xF)) ^ *(_BYTE *)(v6 + v14) ^ *(_BYTE *)(v9 + (v14 & 0xF)) ^ *(_BYTE *)((v14 & 0xF) + v10 + 2) ^ (75 * (v14 & 0xF));
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * ((31 * (v7 - 1 != ((73 * (a6 ^ 0x1E3)) ^ v11))) ^ (a6 - 280)))
                            - 8))();
}

uint64_t sub_21A5BBC68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v14;
  uint64_t v15;
  uint64_t v16;
  int8x16_t v17;

  v17.i64[0] = 0xF0F0F0F0F0F0F0F0;
  v17.i64[1] = 0xF0F0F0F0F0F0F0F0;
  *(int8x16_t *)(v16 - 112) = veorq_s8(vaddq_s8(*(int8x16_t *)*(_QWORD *)(a1 + 32), v17), (int8x16_t)xmmword_21A5D51D0);
  LODWORD(a13) = v14 << (((a7 - 111) ^ 0x6A) + 7);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 + 8 * (int)(a7 ^ (589 * (*(_QWORD *)(v16 - 120) != 0)))) - 4))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_21A5BBCCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  _BOOL4 v19;

  v17 = (a13 & 0xFDBFFDCE) + (v14 ^ 0x7EDFFEE7);
  v19 = ((((v15 - 185) | 0xC) - 318) & (v17 + 9)) != 0 || v17 == 2128608999;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 + 8 * ((v19 * ((v15 + 406) ^ 0x395)) ^ v15)) - 4))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_21A5BBD30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, int a14)
{
  int v14;
  uint64_t v15;
  unsigned int v16;
  _BOOL4 v17;

  v16 = a12 - (a14 & 0x85AA4BD0) + 242 * (v14 ^ 0x392) + 1084393052;
  v17 = ((v16 << (((v14 ^ 0x92) + 112) ^ 0x73)) & 0x45CDFFE2 ^ 0x5884BC0) + (v16 ^ 0xE033DA19) + 2101343872 != 539424369;
  return ((uint64_t (*)(void))(*(_QWORD *)(v15 + 8 * ((2 * v17) | (4 * v17) | v14)) - 8))();
}

uint64_t sub_21A5BBE00(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * (int)((249 * (v4 + v3 + 1561919503 < ((a3 + 86983300) & 0xFAD0BDED ^ 0x1EC))) ^ a3))
                            - (a3 ^ 0x176)))();
}

uint64_t sub_21A5BBE94(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((683 * (a1 + a6 - 16 >= ((4 * a7) ^ 0xFFFFF9DC))) ^ a7)) - 4))();
}

uint64_t sub_21A5BBED4(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _BOOL4 v29;
  int v32;

  v17 = a3 ^ 0x269;
  v18 = (v14 + v13 + a1);
  v19 = v18 + a10 - 0xD7B175E7A17DF29 + 1;
  v20 = ((_BYTE)v14 + (_BYTE)v13 + (_BYTE)a1) & 0xF;
  v21 = v11 + v20 - v18;
  v22 = v11 + v20 + 1;
  v23 = v20 + v10 - v18 + 2;
  v24 = v20 + v10 + 3;
  v25 = v12 + v20 + 1 - v18;
  v26 = v20 + ((v17 - 609) ^ 0x2CDu) + v12 - 807;
  v27 = *(_QWORD *)(v16 - 120);
  v29 = v27 < v22 && v21 < v19;
  if (v27 < v24 && v23 < v19)
    v29 = 1;
  v32 = v25 < v19 && v27 < v26 || v29;
  return ((uint64_t (*)(void))(*(_QWORD *)(v15 + 8 * (v17 ^ (8 * v32))) - 8))();
}

uint64_t sub_21A5BBF84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v7;
  uint64_t v8;

  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v8
                                                                       + 8
                                                                       * ((105
                                                                         * (v7 < 5 * (a7 ^ 0x3BE)
                                                                               + ((a7 - 35) | 0x21u)
                                                                               - 1546)) ^ a7))
                                                           - 4))(a1, a2, 0);
}

uint64_t sub_21A5BBFC8(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16x4_t v17;
  int8x16x4_t v18;

  v17.val[1].i64[0] = ((_BYTE)a2 + 12) & 0xF;
  v17.val[1].i64[1] = ((_BYTE)a2 + 11) & 0xF;
  v17.val[2].i64[0] = ((_BYTE)a2 + 10) & 0xF;
  v17.val[2].i64[1] = ((_BYTE)a2 + 9) & 0xF;
  v17.val[3].i64[0] = ((_BYTE)a2 + 8) & 0xF;
  v17.val[3].i64[1] = ((_BYTE)a2 + 7) & 0xF;
  v12 = v9 + v8 + a1;
  v13.i64[0] = 0x5353535353535353;
  v13.i64[1] = 0x5353535353535353;
  v17.val[0].i64[0] = v12 & 0xF;
  v17.val[0].i64[1] = ((_BYTE)a2 + 13) & 0xF;
  v14.i64[0] = vqtbl4q_s8(v17, (int8x16_t)xmmword_21A5D5130).u64[0];
  v18.val[0].i64[1] = ((_BYTE)a2 + 5) & 0xF;
  v18.val[1].i64[1] = ((_BYTE)a2 + 3) & 0xF;
  v18.val[2].i64[1] = (a2 + 1) & 0xF;
  v18.val[3].i64[1] = ((_BYTE)a2 - 1) & 0xF;
  v18.val[0].i64[0] = ((_BYTE)a2 + 6) & 0xF;
  v18.val[1].i64[0] = ((_BYTE)a2 + 4) & 0xF;
  v18.val[2].i64[0] = (a2 + 2) & 0xF;
  v18.val[3].i64[0] = a2 & 0xF;
  v14.i64[1] = vqtbl4q_s8(v18, (int8x16_t)xmmword_21A5D5130).u64[0];
  v15 = vrev64q_s8(vmulq_s8(v14, v13));
  *(int8x16_t *)(*(_QWORD *)(v11 - 120) - 15 + v12) = veorq_s8(veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v5 + v17.val[0].i64[0] - 15), *(int8x16_t *)(*(_QWORD *)(v11 - 120) - 15 + v12)), *(int8x16_t *)(v17.val[0].i64[0] + v4 - 13)), *(int8x16_t *)((a4 + 231)+ v17.val[0].i64[0]+ v6- 1052)), vextq_s8(v15, v15, 8uLL));
  return (*(uint64_t (**)(void))(v10 + 8 * ((1980 * ((v7 & 0xFFFFFFF0) == 16)) ^ a4)))();
}

void sub_21A5BC118()
{
  JUMPOUT(0x21A5BC09CLL);
}

uint64_t sub_21A5BC124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,unsigned int a22,uint64_t a23)
{
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  char *v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  int v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;
  unsigned int v39;
  int v40;
  int v41;
  unsigned int v42;
  uint64_t v43;
  unsigned int v44;
  int v45;
  char *v46;
  char v47;
  unsigned int v48;
  int v49;
  unint64_t v50;
  unsigned int v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  unsigned __int8 *v55;
  uint64_t v56;
  int v57;
  int v58;
  unsigned int v59;
  int v60;
  uint64_t v61;
  int v62;
  unsigned int v63;
  int v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  unsigned int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  unsigned int v74;
  unsigned int v75;
  int v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  unsigned int v80;
  char *v81;
  char *v82;
  char *v83;
  int v84;
  unsigned int v85;
  uint64_t v86;
  unsigned int v87;
  unsigned int v88;
  int v89;
  unsigned int v90;
  int v91;
  int v92;
  unsigned int v93;
  unsigned int v94;
  int v95;
  int v96;
  unsigned int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  int v106;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  unsigned int v110;
  int v111;
  unsigned int v112;
  int v113;
  unsigned int v114;
  int v115;
  unsigned int v116;
  int v117;
  int v118;
  int v119;
  unsigned int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  int v129;
  unsigned int v130;
  unsigned int v131;
  unsigned int v132;
  int v133;
  int v134;
  unsigned int v135;
  int v136;
  unsigned int v137;
  unsigned int v138;
  int v139;
  unsigned int v140;
  int v141;
  unsigned int v142;
  unsigned int v143;
  int v144;
  unsigned int v145;
  unsigned int v146;
  unsigned int v147;
  unsigned int v148;
  unsigned int v149;
  _BYTE *v150;
  unsigned int v151;
  char *v152;
  char *v153;
  char *v154;
  uint64_t v155;
  char *v156;
  int v157;
  uint64_t v158;
  unsigned int v159;
  int v160;
  uint64_t v161;
  char *v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;

  v26 = (uint64_t)*(&off_24DCDB210 + v24 - 202);
  v27 = *(unsigned __int8 *)(v26 + (*(unsigned __int8 *)(v25 - 105) ^ 0xB7));
  v28 = (char *)*(&off_24DCDB210 + v24 - 304) - 4;
  v29 = v24 + 151;
  v30 = *(unsigned __int8 *)(v25 - 100);
  v31 = (uint64_t)*(&off_24DCDB210 + v24 - 100);
  v32 = *(unsigned __int8 *)(v25 - 112);
  v33 = ((v30 ^ 0xFFFFFFD6) - 2 * (((v30 ^ 0xFFFFFFD6) + 24) & 0x45 ^ (v30 ^ 0xFFFFFFD6) & 4) - 39) ^ *(unsigned __int8 *)(v31 + ~(_BYTE)v30);
  v34 = v30 ^ 0x51 ^ (v33 - ((2 * v33) & 0x94) + 74);
  v35 = ((v32 ^ 0x42) + ~(2 * (((v32 ^ 0x42) + 24) & 0x47 ^ (v32 ^ 0x42) & 6)) - 38) ^ *(unsigned __int8 *)(v31 + (v32 ^ 0x6B));
  v36 = *(unsigned __int8 *)(v26 + (*(unsigned __int8 *)(v25 - 109) ^ 0x6BLL));
  v37 = (((((v24 - 105) ^ 0x8F) + *(_BYTE *)(v25 - 110) - ((2 * *(_BYTE *)(v25 - 110)) & 0xD6)) ^ 0x9D ^ v28[*(unsigned __int8 *)(v25 - 110) ^ 0x87]) << 8) | ((v32 ^ 0x54 ^ (v35 - ((2 * v35) & 0x33333333) + 25)) << 24);
  v38 = *(unsigned __int8 *)(v25 - 108);
  v39 = v37 & 0xFFFFFF00 | (v36 ^ (((v36 >> 1) ^ (v36 >> 5) ^ 0x72)
                                                  - ((2 * ((v36 >> 1) ^ (v36 >> 5) ^ 0x72)) & 0xC7)
                                                  - 29)) ^ 8;
  v40 = *(unsigned __int8 *)(v25 - 104) + 1891273864 - ((2 * *(unsigned __int8 *)(v25 - 104)) & 0xFF87) + 59;
  v41 = ((v38 ^ 0x6A) - 2 * (((v38 ^ 0x6A) + 24) & 0x47 ^ (v38 ^ 0x6A) & 6) - 39) ^ *(unsigned __int8 *)(v31 + (v38 ^ 0x43));
  v171 = v31;
  v42 = v27 ^ 0xA ^ (((v27 >> 1) ^ (v27 >> 5) ^ 0x72)
                                                     - 2 * (((v27 >> 1) ^ (v27 >> 5) ^ 0x72) & 0x69 ^ (v27 >> 1) & 8)
                                                     - 31) | ((v38 ^ 0x13 ^ (v41 - ((2 * v41) & 0x1A) + 13)) << 24);
  LODWORD(v38) = *(unsigned __int8 *)(v31 + (v40 ^ 0x70BA8C88u)) ^ v40 ^ ((v40 ^ 0xFFFFFFA1)
                                                                        - 2
                                                                        * (((v40 ^ 0xFFFFFFA1) + 24) & 0x43 ^ v40 & 2)
                                                                        - 39) ^ 0xE;
  v43 = *(unsigned __int8 *)(v25 - 103);
  v44 = *(unsigned __int8 *)(v26 + (*(unsigned __int8 *)(v25 - 97) ^ 0x89));
  v45 = ((v28[*(unsigned __int8 *)(v25 - 102) ^ 0x19] ^ (*(_BYTE *)(v25 - 102)
                                                                                           - ((2 * *(_BYTE *)(v25 - 102)) & 0xD6)
                                                                                           + 107) ^ 0x6A) << 8) | ((_DWORD)v38 << 24);
  v46 = (char *)*(&off_24DCDB210 + v24 - 113) - 12;
  v47 = ((v43 ^ 0xF8) - ((2 * (v43 ^ 0xF8) + 58) & 0x26) - 80) ^ v46[v43 ^ 8];
  LODWORD(v38) = v46[*(unsigned __int8 *)(v25 - 111) ^ 0x26] ^ *(unsigned __int8 *)(v25 - 111) ^ ((*(unsigned __int8 *)(v25 - 111) ^ 0xFFFFFFD6) - ((2 * (*(unsigned __int8 *)(v25 - 111) ^ 0xFFFFFFD6) + 58) & 0x26) - 80);
  v48 = v45 & 0xFF00FFFF | ((v43 ^ 0x61 ^ (v47 - ((2 * v47) & 0x99) + 76)) << 16);
  HIDWORD(v50) = v38 ^ 0x16;
  LODWORD(v50) = (v38 ^ 0xC0) << 24;
  v49 = v50 >> 29;
  HIDWORD(v50) = v49 ^ 3;
  LODWORD(v50) = (v49 ^ 0x28) << 24;
  LODWORD(v38) = *(unsigned __int8 *)(v26 + (*(unsigned __int8 *)(v25 - 101) ^ 0xELL));
  v51 = v48 & 0xFFFFFF00 | (v38 ^ (((v38 >> 1) ^ (v38 >> 5) ^ 0x72)
                                                  - ((2 * ((v38 >> 1) ^ (v38 >> 5) ^ 0x72)) & 0xE7)
                                                  - 13)) ^ 0x18;
  v52 = *(unsigned __int8 *)(v25 - 98);
  v53 = v44 ^ 0xC5 ^ (((v44 >> 1) ^ (v44 >> 5) ^ 0x72)
                                                      - ((2 * ((v44 >> 1) ^ (v44 >> 5) ^ 0x72)) & 0x5C)
                                                      + 46) | (v34 << 24) | (((*(_BYTE *)(v25 - 99) ^ ((*(_BYTE *)(v25 - 99) ^ 0xDE) + 29)) ^ 0xCB ^ v46[*(unsigned __int8 *)(v25 - 99) ^ 0x2ELL]) << 16) | (((v52 - ((2 * v52) & 0xD6) + 107) ^ 0x14 ^ v28[v52 ^ 0xBB]) << 8);
  v54 = *(unsigned __int8 *)(v25 - 107);
  LOBYTE(v52) = ((2 * v54) & 0x3A ^ 0x32) + (v54 ^ 0x86);
  LOBYTE(v52) = (v52 - ((2 * v52) & 0x26) - 109) ^ v46[v54 ^ 0x6B];
  HIDWORD(v172) = v53 ^ 0x48F02037;
  LODWORD(v52) = ((v42 | ((v28[*(unsigned __int8 *)(v25 - 106) ^ 0x39] ^ (*(_BYTE *)(v25 - 106) - ((2 * *(_BYTE *)(v25 - 106)) & 0xD6) + 107) ^ 0x37) << 8)) & 0xFF00FFFF | ((v54 ^ 0xA3 ^ (v52 + (~(2 * v52) | 0x7F) - 63)) << 16)) ^ 0x9D0017B1;
  LODWORD(v172) = v51 ^ 0x8CF103DE;
  HIDWORD(v170) = v23 - 2128608999;
  LODWORD(v170) = v29 ^ 0x19F;
  HIDWORD(v169) = v29 ^ 0x177;
  LODWORD(v169) = v29 ^ 0x13A;
  HIDWORD(v168) = v29 ^ 0x13E;
  LODWORD(v168) = v29 ^ 0x165;
  HIDWORD(v167) = v29 ^ 0x117;
  LODWORD(v167) = v29 ^ 0x1D2;
  *(_DWORD *)(v25 - 128) = v29;
  HIDWORD(a13) = v29 ^ 0x1DE;
  v55 = *(unsigned __int8 **)(v25 - 120);
  *(_QWORD *)(v25 - 136) = 15;
  *(_DWORD *)(v25 - 164) = 1575300527;
  v56 = v55[5];
  v57 = *(_DWORD *)(v25 - 128);
  v58 = ((v56 ^ 0x43) - ((((v56 ^ 0x43) << (v57 ^ 0xE5)) + 58) & 0x26) - 80) ^ v46[v56 ^ 0xB3];
  v59 = *(unsigned __int8 *)(v26 + (v55[15] ^ 0x16));
  LOBYTE(v58) = v56 ^ 0x2E ^ (v58 + (~(2 * v58) | 0x9D) - 78);
  *(_QWORD *)(v25 - 144) = 1;
  LODWORD(v56) = v55[1] - ((2 * v55[1]) & 0x16) + 11;
  *(_QWORD *)(v25 - 192) = 6;
  v60 = (v46[((2 * (_DWORD)v56) & 0xF8B3BE44)
                            + (v56 ^ 0xFC59DF22)
                            + 61219038
                            - ((2 * (((2 * (_WORD)v56) & 0xBE44) + ((unsigned __int16)v56 ^ 0xDF22)) + 444) & 0x1E0)
                            + 240] ^ (((2 * v56) & 0x44) + (v56 ^ 0x22) - 5) ^ (((2 * v56) & 0x44) + (v56 ^ 0x22) - 34) ^ 0x93) << 16;
  v61 = v55[4];
  v62 = v28[v55[6] ^ 0x24] ^ (v55[6] - ((2 * v55[6]) & 0xD6) + 107) ^ 0xE9;
  *(_QWORD *)(v25 - 160) = 12;
  LODWORD(v32) = *(unsigned __int8 *)(v31 + (v61 ^ 0x4C));
  v63 = (v62 << 8) & 0xFF00FFFF | (v58 << 16);
  *(_QWORD *)(v25 - 184) = 9;
  v64 = ((v61 ^ 0x65) - 2 * (((v61 ^ 0x65) + 24) & 0x45 ^ (v61 ^ 0x65) & 4) - 39) ^ v32;
  v65 = v55[12];
  v66 = v61 ^ (v64 + (~(2 * v64) | 0x3D) - 30);
  v67 = v55[9];
  LODWORD(v61) = ((v65 ^ 0x44) - 2 * (((v65 ^ 0x44) + 24) & 0x43 ^ v65 & 2) - 39) ^ *(unsigned __int8 *)(v31 + (v65 ^ 0x6D));
  *(_QWORD *)(v25 - 152) = 0;
  v68 = *v55;
  v69 = v59 ^ 0x1D ^ (((v59 >> 1) ^ (v59 >> 5) ^ 0x72)
                                                      - ((2 * ((v59 >> 1) ^ (v59 >> 5) ^ 0x72)) & 0xEC)
                                                      - 10) | ((v65 ^ 0x14 ^ ((_DWORD)v61
                                                                                          - ((2 * (_DWORD)v61) & 0x6A)
                                                                                          + 53)) << 24);
  v70 = v63 | ((v66 ^ 0x18) << 24);
  LOBYTE(v59) = ((v67 ^ 0x99) - ((2 * (v67 ^ 0x99) + 58) & 0x26) - 80) ^ v46[v67 ^ 0x69];
  LOBYTE(v31) = v67 ^ 0xA6 ^ (v59 - ((2 * v59) & 0x22) + 17);
  v71 = ((v68 ^ 0x15) - 2 * (((v68 ^ 0x15) + 24) & 0x43 ^ v68 & 2) - 39) ^ *(unsigned __int8 *)(v171 + (v68 ^ 0x3C));
  v72 = v68 ^ (v71 + (~(2 * v71) | 0x53) + 87) ^ 0x20;
  LODWORD(v68) = *(unsigned __int8 *)(v26 + (v55[7] ^ 0x2ALL));
  v73 = v68 ^ v52;
  v74 = v70 | (v68 >> 1) ^ (v68 >> 5) ^ 0x72;
  LODWORD(v56) = v69 | ((v28[v55[14] ^ 0x33] ^ (v55[14]
                                                                                  - ((2 * v55[14]) & 0xD6)
                                                                                  + 107) ^ 0x17) << 8);
  v75 = *(unsigned __int8 *)(v26 + (v55[11] ^ 0xD5));
  LODWORD(v68) = v28[v55[2] ^ 0x6DLL] ^ (v55[2] - ((2 * v55[2]) & 0xD6) + 107) ^ 0xD;
  *(_QWORD *)(v25 - 176) = 10;
  v76 = v60 | (v72 << 24) | ((_DWORD)v68 << 8);
  LODWORD(v67) = (v75 ^ (((v75 >> 1) ^ (v75 >> 5) ^ 0x72)
                                        - ((2 * ((v75 >> 1) ^ (v75 >> 5) ^ 0x72)) & 0x4E)
                                        + 39)) ^ 0xCC | (v31 << 16);
  v77 = v55[8];
  LODWORD(v31) = ((v77 ^ 0x5F) - 2 * (((v77 ^ 0x5F) + 24) & 0x45 ^ (v77 ^ 0x5F) & 4) - 39) ^ *(unsigned __int8 *)(v171 + (v77 ^ 0x76));
  v78 = v67 | (((((2 * v55[10]) & 0xD6) - v55[10] - 108) ^ v28[v55[10] ^ 0x1ALL]) << 8) | ((v77 ^ 0x35 ^ ((_DWORD)v31 - ((2 * (_DWORD)v31) & 0x2E) + 23)) << 24);
  LODWORD(v65) = *(unsigned __int8 *)(v26 + (v55[3] ^ 0xAELL));
  LODWORD(v77) = v65 ^ (v39 & 0xFF00FFFF | (((v50 >> 27) ^ 7) << 16)) ^ 0xF806365F;
  LODWORD(v65) = (v65 >> 1) ^ (v65 >> 5) ^ 0x72 | v76;
  v79 = v55[13];
  LOBYTE(v76) = ((v79 ^ 0x93) - ((2 * (v79 ^ 0x93) + 58) & 0x26) - 80) ^ v46[v79 ^ 0x63];
  LODWORD(v56) = v56 & 0xFF00FFFF | (((v79 ^ (v76 - ((2 * v76) & 0xA0) + 80)) ^ 0xDF) << 16);
  v80 = v77 ^ v65;
  LODWORD(v56) = v56 ^ HIDWORD(v172);
  LODWORD(v77) = v78 ^ v172;
  LODWORD(v65) = v73 ^ v74;
  LODWORD(v79) = HIBYTE(v80);
  v81 = (char *)*(&off_24DCDB210 + (int)v170) - 4;
  v82 = (char *)*(&off_24DCDB210 + v57 - 287) - 4;
  v83 = (char *)*(&off_24DCDB210 + SHIDWORD(v169)) - 12;
  v84 = *(_DWORD *)&v81[4 * (HIBYTE(v80) ^ 0x89)] ^ *(_DWORD *)&v83[4
                                                                  * (((unsigned __int16)(v78 ^ v172) >> 8) ^ 0x2E)] ^ 0x2D3DC967;
  v85 = v84 + 1163586329 - ((2 * v84) & 0x8AB5D632);
  v86 = (uint64_t)*(&off_24DCDB210 + v57 - 316);
  v87 = BYTE3(v65);
  v88 = (*(_DWORD *)(v86 + 4 * (v56 ^ 0x60u)) + 751252473) ^ *(_DWORD *)&v82[4 * (BYTE2(v65) ^ 0xF)] ^ v85;
  v89 = *(_DWORD *)&v82[4 * (BYTE2(v77) ^ 0x98)] ^ *(_DWORD *)&v81[4 * (BYTE3(v65) ^ 0x6E)] ^ 0x7C258A5D;
  LODWORD(v31) = *(_DWORD *)&v82[4 * (BYTE2(v56) ^ 0x5B)] ^ ((BYTE3(v77) ^ 0xB720E538)
                                                           + ((v77 >> 23) & 0xBE ^ 0xFFFFFF71)
                                                           + ((v77 >> 23) & 0xBE ^ 0x8E)
                                                           + 1) ^ *(_DWORD *)&v81[4 * (BYTE3(v77) ^ 0xDE)];
  HIDWORD(v50) = v31 ^ 0x18B3B9A;
  LODWORD(v50) = v31 ^ 0x16000000;
  LODWORD(v31) = v50 >> 25;
  v90 = (*(_DWORD *)(v86 + 4 * (v80 ^ 0x14u)) + 751252473) ^ *(_DWORD *)&v83[4 * (BYTE1(v56) ^ 0x6A)] ^ (v89 + 339912739 - ((2 * v89) & 0x28855046));
  HIDWORD(v50) = v31 ^ 0x60;
  LODWORD(v50) = v31 ^ 0xAB4D6D80;
  LODWORD(v31) = (*(_DWORD *)(v86 + 4 * (v65 ^ 0xE1u)) + 751252473) ^ *(_DWORD *)&v83[4 * (BYTE1(v80) ^ 0x74)] ^ ((v50 >> 7) + 339912739 - ((2 * (v50 >> 7)) & 0x28855046));
  LODWORD(v77) = *(_DWORD *)(v86 + 4 * (v77 ^ 0x64u));
  v91 = (v77 - ((2 * v77 + 1502504946) & 0x8AB5D632) + 1914838802) ^ *(_DWORD *)&v82[4 * (BYTE2(v80) ^ 0x1F)];
  LODWORD(v77) = BYTE3(v56);
  LODWORD(v56) = *(_DWORD *)&v83[4 * (BYTE1(v65) ^ 0x8E)] ^ *(_DWORD *)&v81[4 * (BYTE3(v56) ^ 0x4A)] ^ (v91 + 339912739 - ((2 * v91) & 0x28855046));
  v92 = (((2 * (BYTE2(v90) ^ 0x16)) & 0x1A) - (BYTE2(v90) ^ 0x16) + 1174126834) ^ 0x6CBE2DA;
  LODWORD(v65) = ((v92 | 0x2FA55A6F) - (v92 | 0xD05AA590) - 799365744) ^ ((BYTE2(v90) ^ 0xFFFFFF66) + 163) ^ ((((v92 | 0x2FA55A6F) - (v92 | 0xD05AA590) - 799365744) ^ 0x936A8795) + 1);
  v93 = HIBYTE(v88);
  LODWORD(v65) = *(_DWORD *)&v81[4 * (HIBYTE(v88) ^ 5)] ^ 0x7C258A5D ^ *(_DWORD *)&v82[4
                                                                                     * ((2 * (_DWORD)v65) & 0x144 ^ 0x44)
                                                                                     + 4
                                                                                     * (v65 ^ 0x6C9578C8)];
  LODWORD(v65) = (*(_DWORD *)(v86 + 4 * (v77 ^ 0x50 ^ v56)) + 751252473) ^ *(_DWORD *)&v83[4 * (BYTE1(v31) ^ 0x16)] ^ (v65 + 339912739 - ((2 * v65) & 0x28855046));
  v94 = HIBYTE(v90);
  v95 = *(_DWORD *)&v81[4 * (HIBYTE(v90) ^ 0xB7)] ^ 0x7C258A5D ^ *(_DWORD *)&v82[4 * (BYTE2(v31) ^ 0x46)];
  LODWORD(v77) = (*(_DWORD *)(v86 + 4 * (v79 ^ 0xD4 ^ v88)) + 751252473) ^ *(_DWORD *)&v83[4 * (BYTE1(v56) ^ 0xAB)] ^ (v95 + 339912739 - ((2 * v95) & 0x28855046));
  LODWORD(v79) = BYTE3(v31);
  v96 = *(_DWORD *)&v82[4 * (BYTE2(v56) ^ 0x31)] ^ 0x7C258A5D ^ *(_DWORD *)&v81[4 * (BYTE3(v31) ^ 0xB0)];
  v97 = (*(_DWORD *)(v86 + 4 * (v87 ^ v90 ^ 8)) + 751252473) ^ *(_DWORD *)&v83[4
                                                                                                * (BYTE1(v88) ^ 0xF2)] ^ (v96 + 339912739 - ((2 * v96) & 0x28855046));
  HIDWORD(v50) = (v56 >> 31) ^ 0x1453479;
  LODWORD(v50) = (2 * v56) ^ 0x18000000;
  v98 = (v50 >> 25) - 1692098393 + ((2 * (v50 >> 25)) & 0x14C ^ 0xFBFFBFFF);
  LODWORD(v56) = *(_DWORD *)&v81[4 * (BYTE3(v56) ^ 0xE5)];
  v99 = v56 ^ 0x481EE792 ^ v98;
  LODWORD(v56) = v56 ^ 0x397F6144;
  LODWORD(v52) = (v56 + v99 + 1) ^ ((v98 ^ 0x716186D6) + 1);
  LODWORD(v56) = ((v98 ^ 0xDDE3E43B ^ (v52 - ((2 * v52) & 0xA6FB3A24) + 1400741138)) + v56) ^ *(_DWORD *)&v82[4 * (BYTE2(v88) ^ 0xF0)];
  v100 = *(_DWORD *)&v83[4 * (BYTE1(v90) ^ 0xED)];
  v101 = v100 ^ 0xFD31691 ^ v56;
  LODWORD(v56) = v56 ^ 0x2EF45ADE;
  LODWORD(v52) = (v101 + v56 + 1) ^ ((v100 ^ 0x21274C4F) + 1);
  LODWORD(v56) = ((v100 ^ 0xDEAFBE5D ^ (v52 - ((2 * v52) & 0xEE1BDA) + 7802349)) + v56) ^ (*(_DWORD *)(v86 + 4 * (v31 ^ 0x6Bu))
                                                                                         + 751252473);
  v102 = ((v77 >> 15) & 0xFE ^ 0x16) + (BYTE2(v77) ^ 0x3DC7DEF4);
  LODWORD(v52) = v102 - 1036508799 + (((BYTE2(v77) ^ 0xFFFFFFD6) - 1036508799 + v102 + 1) ^ 0xFFFFFFFC);
  v103 = v65 - ((2 * v65) & 0x6D511714) + 917015434;
  v104 = HIBYTE(v103);
  LODWORD(v52) = *(_DWORD *)&v81[4 * (HIBYTE(v103) ^ 0x79)] ^ *(_DWORD *)&v82[4 * v52] ^ 0x7C258A5D;
  v105 = (*(_DWORD *)(v86 + 4 * (v56 ^ 0x84u)) + 751252473) ^ *(_DWORD *)&v83[4 * (BYTE1(v97) ^ 0x72)] ^ (v52 + 339912739 - ((2 * v52) & 0x28855046));
  LODWORD(v52) = *(_DWORD *)&v81[4 * (BYTE3(v77) ^ 0x83)] ^ 0x7C258A5D ^ *(_DWORD *)&v82[4 * (BYTE2(v97) ^ 0xC6)];
  LODWORD(v52) = v52 - ((2 * v52) & 0x85DA094C) + 1122829478;
  HIDWORD(v50) = BYTE3(v77) ^ v52 ^ 0xFFFFFFC3;
  LODWORD(v50) = v52 ^ 0xF5CDE000;
  LODWORD(v52) = v50 >> 9;
  HIDWORD(v50) = *(_DWORD *)&v83[4 * (BYTE1(v56) ^ 0x5F)] ^ 0x1442A823;
  LODWORD(v50) = *(_DWORD *)&v83[4 * (BYTE1(v56) ^ 0x5F)];
  v106 = v50 >> 30;
  HIDWORD(v50) = v52 ^ 0x592372;
  LODWORD(v50) = v52 ^ 0xEFFFFFFF;
  LODWORD(v52) = v50 >> 23;
  HIDWORD(v50) = ~v106;
  LODWORD(v50) = v106 ^ 0x2A686E4C;
  LODWORD(v31) = HIBYTE(v97);
  v107 = (v50 >> 2) ^ (*(_DWORD *)(v86 + 4 * (v93 ^ 0x88 ^ (v65 - ((2 * v65) & 0x14) - 118)))
                     + 751252473) ^ v52;
  LODWORD(v52) = *(_DWORD *)&v81[4 * (HIBYTE(v97) ^ 0x55)] ^ 0x7C258A5D ^ *(_DWORD *)&v82[4 * (BYTE2(v56) ^ 0xED)];
  v108 = (*(_DWORD *)(v86 + 4 * (v94 ^ 0x4E ^ v77)) + 751252473) ^ *(_DWORD *)&v83[4 * (BYTE1(v103) ^ 0xCC)] ^ (v52 + 339912739 - ((2 * v52) & 0x28855046));
  LODWORD(v52) = BYTE3(v56);
  LODWORD(v56) = *(_DWORD *)&v81[4 * (BYTE3(v56) ^ 0xE4)] ^ *(_DWORD *)&v82[4 * (BYTE2(v103) ^ 0x69)] ^ 0x7C258A5D;
  LODWORD(v56) = (*(_DWORD *)(v86 + 4 * (v79 ^ v97 ^ 0x40)) + 751252473) ^ *(_DWORD *)&v83[4 * (BYTE1(v77) ^ 2)] ^ (v56 + 339912739 - ((2 * v56) & 0x28855046));
  LODWORD(v79) = *(_DWORD *)&v82[4
                               * (((v107 ^ 0x61AF212F) >> (BYTE3(v77) & 0x10 ^ 0x10) >> (BYTE3(v77) & 0x10)) ^ 0xA2)] ^ *(_DWORD *)&v81[4 * (HIBYTE(v105) ^ 0xEF)];
  v109 = v52 ^ 0x76 ^ v56;
  LODWORD(v52) = HIBYTE(v105) ^ 0x5F54216C ^ v79;
  LODWORD(v79) = v79 ^ 0x178B3B9A;
  LODWORD(v52) = (v52 + v79 + 1) ^ ((HIBYTE(v105) ^ 0x48DF1AF6) + 1);
  LODWORD(v79) = (HIBYTE(v105) ^ 0x631F7AD4 ^ (v52 - ((2 * v52) & 0xA87F3FBA) - 734027811)) + v79;
  LODWORD(v65) = (*(_DWORD *)(v86 + 4 * v109) + 751252473) ^ *(_DWORD *)&v83[4 * (BYTE1(v108) ^ 0xA0)] ^ (v79 + 339912739 - ((2 * v79) & 0x28855046));
  LODWORD(v79) = *(_DWORD *)&v81[4 * (HIBYTE(v107) ^ 0xD8)] ^ *(_DWORD *)&v82[4 * (BYTE2(v108) ^ 0x46)] ^ 0x7C258A5D;
  LODWORD(v52) = v79 + 339912739 - ((2 * v79) & 0x28855046);
  LODWORD(v79) = HIBYTE(v108);
  v110 = (*(_DWORD *)(v86 + 4 * (v104 ^ 0x4C ^ v105)) + 751252473) ^ *(_DWORD *)&v83[4 * (BYTE1(v56) ^ 0x18)] ^ v52;
  LODWORD(v52) = *(_DWORD *)&v81[4 * (HIBYTE(v108) ^ 0x39)] ^ 0x7C258A5D ^ *(_DWORD *)&v82[4 * (BYTE2(v56) ^ 0x6C)
                                                                                         + 652
                                                                                         + 4
                                                                                         * ((v56 >> 15) & 0x144 ^ 0xFFFFFFBF)];
  LODWORD(v56) = BYTE3(v56);
  LODWORD(v43) = *(_DWORD *)&v81[4 * (v56 ^ 0xB0)];
  v111 = (v43 ^ 0x397F6144) + (v56 ^ 0xB720E556);
  LODWORD(v56) = (v43 ^ 0x31206144) & (v56 ^ 0x3720E556);
  LODWORD(v43) = *(_DWORD *)(v86 + 4 * (v107 ^ 0xFEu));
  v112 = (v52 + 339912739 - ((2 * v52) & 0x28855046)) ^ *(_DWORD *)&v83[4 * (BYTE1(v105) ^ 0xD0)] ^ (((2 * v43 - 1101298702) & 0x9B32E400) + ((v43 - 550649351) ^ 0x4D997200));
  LODWORD(v56) = (v111 - 2 * v56 + 1163586329 - ((2 * (v111 - 2 * v56)) & 0x8AB5D632)) ^ *(_DWORD *)&v82[4 * (BYTE2(v105) ^ 0xA9)];
  HIDWORD(v50) = v65;
  LODWORD(v50) = v65;
  v113 = v50 >> 31;
  HIDWORD(v50) = ~v113;
  LODWORD(v50) = v113 ^ 0x2387ECB6;
  LODWORD(v65) = (*(_DWORD *)(v86
                            + 4
                            * (v31 ^ 0x7353CDAF ^ (v108
                                                               + 1934871983
                                                               - ((2 * v108) & 0x18C)
                                                               + 23)))
                + 751252473) ^ *(_DWORD *)&v83[4 * (BYTE1(v107) ^ 0x61)] ^ (v56 + 339912739 - ((2 * v56) & 0x28855046));
  LODWORD(v52) = *(_DWORD *)&v82[4 * (BYTE2(v110) ^ 0x6F)];
  LODWORD(v56) = (v50 >> 1) - ((2 * (v50 >> 1)) & 0x858C0ADE) + 1120273775;
  v114 = BYTE3(v56);
  LODWORD(v52) = v52 & 4 ^ ((v52 & 0xFFFFFFFB ^ 0x455AEB19)
                          + 964649284
                          - ((2 * (v52 & 0xFFFFFFFB ^ 0x455AEB19)) & 0x72FEC280)) ^ 0x6BAEB1C7 ^ *(_DWORD *)&v81[4 * (BYTE3(v56) ^ 0xFB)];
  LODWORD(v77) = (*(_DWORD *)(v86 + 4 * (v65 ^ 0x2Fu)) + 751252473) ^ *(_DWORD *)&v83[4 * (BYTE1(v112) ^ 0x38)] ^ (v52 + 339912739 - ((2 * v52) & 0x28855046));
  LODWORD(v52) = *(_DWORD *)&v82[4 * (BYTE2(v112) ^ 0x58)] ^ *(_DWORD *)&v81[4 * (HIBYTE(v110) ^ 0x98)] ^ 0x7C258A5D;
  v115 = *(_DWORD *)&v83[4 * (BYTE1(v65) ^ 0x6D)] ^ HIBYTE(v110) ^ (v52 + 339912739 - ((2 * v52) & 0x28855046)) ^ (*(_DWORD *)(v86 + 4 * (((v50 >> 1) - ((2 * (v50 >> 1)) & 0xDE) + 111) ^ 0xBEu)) + 751252473);
  HIDWORD(v50) = HIBYTE(v112) ^ 0x1C;
  LODWORD(v50) = HIBYTE(v112) ^ 0xB720E520;
  LODWORD(v43) = v50 >> 5;
  LODWORD(v52) = *(_DWORD *)&v81[4 * (HIBYTE(v112) ^ 0xDA)];
  HIDWORD(v50) = v43 ^ (v52 >> 5) ^ 0x2CD6D4D;
  LODWORD(v50) = v43 ^ ((_DWORD)v52 << 27) ^ 0xC0000000;
  LODWORD(v52) = ((v50 >> 27) + 1163586329 - ((2 * (v50 >> 27)) & 0x8AB5D632)) ^ *(_DWORD *)&v82[4 * (BYTE2(v65) ^ 0xC7)];
  v116 = (*(_DWORD *)(v86 + 4 * (HIBYTE(v107) ^ 0xBF ^ v110)) + 751252473) ^ (v52
                                                                                               + 339912739
                                                                                               - ((2 * v52) & 0x28855046)) ^ *(_DWORD *)&v83[4 * (BYTE1(v56) ^ 0x45)];
  v117 = *(_DWORD *)&v81[4 * (BYTE3(v65) ^ 0xA6)];
  HIDWORD(v50) = v117 ^ 0x144;
  LODWORD(v50) = v117 ^ 0x397F6000;
  v118 = v50 >> 13;
  HIDWORD(v50) = v118 ^ 0xFE74;
  LODWORD(v50) = v118 ^ ((v65 >> 5) | 0x88000000);
  v119 = ((v50 >> 19) + 339912739 - ((2 * (v50 >> 19)) & 0x28855046)) ^ *(_DWORD *)&v83[4 * (BYTE1(v110) ^ 0x30)];
  v120 = (*(_DWORD *)(v86
                    + 4
                    * (v79 ^ 0xFF1CFD53 ^ (v112 - 14877357 - ((2 * v112) & 0x152) + 86)))
        + 751252473) ^ (v119 + 1163586329 - ((2 * v119) & 0x8AB5D632)) ^ *(_DWORD *)&v82[4 * (BYTE2(v56) ^ 0x64)];
  LODWORD(v65) = ((v115 ^ 0xA48E18D5) + 1298507777) ^ v115 ^ ((v115 ^ 0xE9EBB0D5) + 1);
  LODWORD(v56) = (v65 ^ 0x16144F2A) - 2 * (((v65 ^ 0x16144F2A) + 6662144) & 0x50121F ^ v65 & 1) + 1303755294;
  LODWORD(v79) = (WORD1(v56) & 0x33 ^ 0xBA2A8CCE) - (WORD1(v56) & 0xCC);
  LODWORD(v79) = (v79 & 0x8028841F ^ 0x800111) + (v79 ^ 0xD8789CCE) - ((v79 ^ 0xD8789CCE) & 0x10101F);
  v121 = ((v79 ^ 0x89443488) - 1806610887) ^ ((v79 ^ 0x1D157AB0) + 1);
  LODWORD(v79) = (v79 ^ 0xD10550B7 ^ (v121 - ((2 * v121) & 0x67DFABF0) + 871355896)) + (v79 ^ 0x89443488);
  LODWORD(v79) = v79 - 571700898 - ((2 * v79) & 0xBBD912BC);
  v122 = *(_DWORD *)&v82[4 * (BYTE2(v56) ^ 0xF2)];
  LODWORD(v52) = v122 ^ 0x67499DB8 ^ v79;
  v122 ^= 0x455AEB19u;
  LODWORD(v52) = (v122 + v52 + 1) ^ ((v79 ^ 0x221376A1) + 1);
  LODWORD(v79) = *(_DWORD *)&v83[4 * (BYTE1(v116) ^ 0x1A)] ^ (*(_DWORD *)(v86 + 4 * (v120 ^ 0xCFu))
                                                            + 751252473) ^ *(_DWORD *)&v81[4 * (BYTE3(v77) ^ 0x6A)] ^ (((v52 - 571700898 - ((2 * v52) & 0xBBD912BC)) ^ v79) + v122);
  v123 = *(_DWORD *)&v81[4 * (BYTE3(v56) ^ 0xB9)] ^ *(_DWORD *)&v82[4 * (BYTE2(v116) ^ 8)] ^ 0x7C258A5D;
  v124 = (v123 + 339912739 - ((2 * v123) & 0x28855046)) ^ *(_DWORD *)&v83[4 * (BYTE1(v120) ^ 0x86)];
  v125 = *(_DWORD *)(v86
                   + 4
                   * (((v77 ^ v114) ^ 0x71)
                    + ((2 * (v77 ^ v114)) & 0x1A2 ^ 0xFFFFFF5D)
                    + 210));
  v126 = *(_DWORD *)&v81[4 * (HIBYTE(v116) ^ 0x94)] ^ 0x7C258A5D ^ *(_DWORD *)&v82[4 * (BYTE2(v120) ^ 0xA2)];
  LODWORD(v52) = BYTE3(v56) ^ (v125 - ((2 * v125 + 1502504946) & 0xB269062E) + 100382480) ^ 0x1261E42D ^ (v124 - ((2 * v124) & 0xBA825062) - 582932431);
  v127 = *(_DWORD *)&v83[4 * (BYTE1(v77) ^ 0x8E)] ^ (v126 + 339912739 - ((2 * v126) & 0x28855046));
  v128 = *(_DWORD *)&v83[4 * (((BYTE1(v56) ^ 0x6D) + ((2 * BYTE1(v56)) ^ 0x24) - 127) ^ 0x40)];
  LODWORD(v56) = (*(_DWORD *)(v86 + 4 * (v65 ^ 0xFBu)) + 751252473) ^ v127;
  v129 = *(_DWORD *)&v82[4 * (BYTE2(v77) ^ 0x63)] ^ 0x5118433A ^ v128;
  v120 >>= 24;
  v130 = (*(_DWORD *)(v86 + 4 * (v116 ^ 0x22u)) + 751252473) ^ *(_DWORD *)&v81[4 * (v120 ^ 0x36)] ^ (v129 + 964649284 - ((2 * v129) & 0x72FEC288));
  v131 = v120 ^ 0x28 ^ ((*(_BYTE *)(v86 + 4 * (v116 ^ 0x22u)) - 7) ^ v81[4 * (v120 ^ 0x36)] ^ (v129 + 68 - ((2 * v129) & 0x88)));
  LODWORD(v65) = BYTE3(v79);
  v132 = v52 - ((2 * v52) & 0x25614BC6) + 313566691;
  LODWORD(v52) = *(_DWORD *)&v81[4 * (BYTE3(v79) ^ 0xEF)] ^ *(_DWORD *)&v82[4 * (BYTE2(v132) ^ 0x1C)] ^ 0x7C258A5D;
  v133 = (*(_DWORD *)(v86 + 4 * v131) + 751252473) ^ *(_DWORD *)&v83[4 * (BYTE1(v56) ^ 0x2A)] ^ (v52
                                                                                                 + 339912739
                                                                                                 - ((2 * v52) & 0x28855046));
  v134 = v133 - ((2 * v133) & 0x9989627E);
  v135 = (BYTE1(v130) ^ 0xD3390EF) + ((v130 >> 8) & 0x70 ^ 0x90C40D10) - ((BYTE1(v130) ^ 0xD3390EF) & 0xC329070);
  LODWORD(v43) = ((v135 ^ 0x5B5F16D9) + 895870061) ^ ((v135 ^ 0x6E3AF2B5) + 1);
  v136 = (v135 ^ 0xD7C75B85 ^ (v43 + 1174558416 + (~(2 * v43) | 0x73FB5261))) + (v135 ^ 0x5B5F16D9);
  LODWORD(v43) = v136 + 339912739 - ((2 * v136) & 0x28855046);
  v137 = HIBYTE(v132);
  LODWORD(v77) = *(_DWORD *)&v82[4 * (BYTE2(v56) ^ 0x33)] ^ *(_DWORD *)&v83[4 * (BYTE1(v130) ^ 0x95)] ^ *(_DWORD *)&v81[4 * (HIBYTE(v132) ^ 0x34)] ^ v43 ^ (*(_DWORD *)(v86 + 4 * (BYTE3(v77) ^ v79 ^ 0x7E)) + 751252473);
  LODWORD(v52) = *(_DWORD *)&v82[4 * (BYTE2(v130) ^ 0x2E)] ^ 0x5118433A ^ *(_DWORD *)&v83[4 * (BYTE1(v79) ^ 0xC2)];
  v138 = BYTE3(v56);
  LODWORD(v31) = (*(_DWORD *)(v86 + 4 * (v132 ^ 0x1Eu)) + 751252473) ^ *(_DWORD *)&v81[4 * (BYTE3(v56) ^ 8)] ^ (v52 + 964649284 - ((2 * v52) & 0x72FEC288));
  LODWORD(v52) = HIBYTE(v130);
  LODWORD(v79) = *(_DWORD *)&v82[4 * (BYTE2(v79) ^ 0x89)] ^ *(_DWORD *)&v81[4 * (HIBYTE(v130) ^ 0x5A)] ^ 0x7C258A5D;
  HIDWORD(v50) = (v134 - 859524801) ^ v65 ^ 0xAD0FE62;
  LODWORD(v50) = (v134 - 859524801) ^ 0xDFFFFFFF;
  v139 = v50 >> 28;
  HIDWORD(v50) = v139 ^ 2;
  LODWORD(v50) = v139 ^ 0xBE9FDB00;
  v140 = (v50 >> 4) - ((2 * (v50 >> 4)) & 0x6B80AF2A) - 1245685867;
  LODWORD(v56) = (*(_DWORD *)(v86 + 4 * (HIBYTE(v116) ^ 0x7B ^ v56)) + 751252473) ^ *(_DWORD *)&v83[4 * (BYTE1(v132) ^ 0x5F)] ^ (v79 + 339912739 - ((2 * v79) & 0x28855046));
  LODWORD(v79) = HIBYTE(v140);
  v141 = *(_DWORD *)&v81[4 * (HIBYTE(v140) ^ 0xC2)] ^ *(_DWORD *)&v82[4 * (BYTE2(v77) ^ 0x90)] ^ 0x7C258A5D;
  v142 = (*(_DWORD *)(v86 + 4 * (v52 ^ 0x72 ^ v56)) + 751252473) ^ *(_DWORD *)&v83[4 * (BYTE1(v31) ^ 0x40)] ^ (v141 + 339912739 - ((2 * v141) & 0x28855046));
  v143 = BYTE3(v77);
  LODWORD(v52) = ((v56 >> 8) ^ 0xD69BC148) & 0x3CCF30 ^ 0x8951F08E ^ (((2
                                                                                    * (((v56 >> 8) ^ 0xD69BC148) & 0x503CCFCF)) | 0x12C36396)
                                                                                  - (((v56 >> 8) ^ 0xD69BC148) & 0x503CCFCF)
                                                                                  + 1990086197);
  LODWORD(v52) = v52 - ((2 * v52) & 0xCE59A40C) + 1730990598;
  LODWORD(v43) = v52 ^ 0xC8E36C89;
  LODWORD(v52) = v52 ^ 0x371C9336;
  LODWORD(v43) = ((2 * (v43 + v52 + 1)) & 0xDDEFF37E) + ((v43 + v52 + 1) ^ 0xEEF7F9BF);
  v144 = *(_DWORD *)&v81[4 * (BYTE3(v77) ^ 0xE) + 744 + 4 * ((v77 >> 23) & 0x172 ^ 0xFFFFFFEF)] ^ *(_DWORD *)&v82[4 * (BYTE2(v31) ^ 0x6D)] ^ 0x7C258A5D;
  LODWORD(v52) = (((v43 + 285738561) & 0xFFBFFFFF | ((((v43 + 525889) >> 22) & 1) << 22)) ^ 0xFFFFFF80)
               + v52;
  LODWORD(v43) = (*(_DWORD *)(v86 + 4 * (((v50 >> 4) - ((2 * (v50 >> 4)) & 0x2A) - 107) ^ 0x99u))
                + 751252473) ^ (v144 + 339912739 - ((2 * v144) & 0x28855046));
  v145 = BYTE3(v31);
  v146 = v43 ^ *(_DWORD *)&v83[4 * v52];
  LODWORD(v52) = *(_DWORD *)&v81[4 * (BYTE3(v31) ^ 0x72)] ^ 0x7C258A5D ^ *(_DWORD *)&v82[4 * (BYTE2(v56) ^ 0x32)];
  LODWORD(v65) = (*(_DWORD *)(v86
                            + 4
                            * (v137 ^ 0x2E67A763 ^ ((v77 ^ 0x5D)
                                                  + 778544925
                                                  - ((2 * (v77 ^ 0x5D)) & 0x3A))))
                + 751252473) ^ (v52 + 339912739 - ((2 * v52) & 0x28855046)) ^ *(_DWORD *)&v83[4 * (BYTE1(v140) ^ 0x3A)];
  LODWORD(v52) = ((BYTE2(v140) ^ 0xFFFFFF24) + 163) ^ ((BYTE2(v140) ^ 0xFFFFFF86) + 1);
  LODWORD(v43) = BYTE3(v56);
  LODWORD(v56) = *(_DWORD *)&v81[4 * (BYTE3(v56) ^ 0x53)] ^ 0x7C258A5D ^ *(_DWORD *)&v82[4
                                                                                       * (BYTE2(v140) ^ 0x305EB250 ^ ((_DWORD)v52 + 811512361 - ((2 * (_DWORD)v52) & 0x60BD6452)))
                                                                                       + 648];
  LODWORD(v56) = (*(_DWORD *)(v86 + 4 * (v138 ^ 0xA6 ^ v31)) + 751252473) ^ *(_DWORD *)&v83[4 * (BYTE1(v77) ^ 0x53)] ^ (v56 + 339912739 - ((2 * v56) & 0x28855046));
  LODWORD(v52) = v43 ^ 0x31 ^ v56;
  v147 = HIBYTE(v142);
  LODWORD(v43) = *(_DWORD *)&v81[4 * (HIBYTE(v142) ^ 0x7C)] ^ 0x7C258A5D ^ *(_DWORD *)&v82[4 * (BYTE2(v146) ^ 0x87)];
  v148 = *(_DWORD *)&v81[4 * (HIBYTE(v146) ^ 6)] ^ ((HIBYTE(v146) ^ 0x800000BF)
                                                  + 964649284
                                                  - ((2 * (HIBYTE(v146) ^ 0x800000BF)) & 0x88));
  LODWORD(v77) = (*(_DWORD *)(v86 + 4 * v52) + 751252473) ^ *(_DWORD *)&v83[4 * (BYTE1(v65) ^ 3)] ^ (v43 + 339912739 - ((2 * v43) & 0x28855046));
  LODWORD(v52) = (v148 + 1163586329 - ((2 * v148) & 0x8AB5D632)) ^ *(_DWORD *)&v82[4 * (BYTE2(v65) ^ 0x9B)];
  LODWORD(v79) = (*(_DWORD *)(v86
                            + 4
                            * ((v142 - 1966057420 - ((2 * v142) & 0xA6) + 31) ^ v79 ^ 0x8AD05834))
                + 751252473) ^ *(_DWORD *)&v83[4 * (BYTE1(v56) ^ 0xD6)] ^ (v52 + 339912739 - ((2 * v52) & 0x28855046));
  LODWORD(v52) = *(_DWORD *)&v83[4 * (BYTE1(v142) ^ 0x81)];
  LODWORD(v43) = ((v52 ^ 0x21274C4F) - 895870060) ^ ((v52 ^ 0xEBBD57DC) + 1);
  LODWORD(v52) = (v43 + 339912739 - ((2 * v43) & 0x28855046)) ^ v52;
  LODWORD(v31) = BYTE3(v65);
  LODWORD(v43) = *(_DWORD *)&v81[4 * (BYTE3(v65) ^ 0xF)];
  v149 = BYTE3(v56);
  LODWORD(v81) = *(_DWORD *)&v81[4 * (BYTE3(v56) ^ 0x27)];
  LODWORD(v56) = *(_DWORD *)&v82[4 * (BYTE2(v56) ^ 0xD8)] ^ v43 ^ (*(_DWORD *)(v86
                                                                             + 4
                                                                             * (v143 ^ 0x53 ^ v146))
                                                                 + 751252473) ^ (v52 - 895870061);
  LODWORD(v52) = v81 ^ *(_DWORD *)&v82[4 * (BYTE2(v142) ^ 0xD9)] ^ 0x7C258A5D;
  v150 = *(_BYTE **)(v25 - 120);
  v151 = (*(_DWORD *)(v86 + 4 * (v145 ^ 0xA0 ^ v65)) + 751252473) ^ *(_DWORD *)&v83[4 * (BYTE1(v146) ^ 0xEB)] ^ (v52 + 339912739 - ((2 * v52) & 0x28855046));
  v152 = (char *)*(&off_24DCDB210 + (int)v169) - 8;
  LODWORD(v52) = (BYTE3(v77) ^ 0xF7) + (BYTE3(v77) ^ 0x7133838B);
  LODWORD(v83) = *(_DWORD *)&v152[4 * (BYTE3(v77) ^ 0xA2)] ^ (v52 - 92000609 - ((2 * v52) & 0xE0000D3E));
  LODWORD(v52) = v151 ^ v149;
  v153 = (char *)*(&off_24DCDB210 + SHIDWORD(v168)) - 8;
  v154 = (char *)*(&off_24DCDB210 + (int)v168) - 12;
  v155 = *(unsigned int *)(v25 - 128);
  v156 = (char *)*(&off_24DCDB210 + (int)v155 - 307) - 12;
  LODWORD(v83) = ((_DWORD)v83 - ((2 * (_DWORD)v83) & 0x1C48602E) - 1910231017) ^ *(_DWORD *)&v153[4
                                                                                                * (BYTE2(v79) ^ 0x49)] ^ (*(_DWORD *)&v154[4 * (BYTE1(v56) ^ 0xA0)] + 246799583) ^ *(_DWORD *)&v156[4 * (v52 ^ 0xAC)] ^ ((v52 ^ 0xDE) - 699759053 + ((2 * (((v52 ^ 0xDE) + 96) & 0x56 ^ (v52 ^ 0xDE | 0x7FFFFFFB))) ^ 0x2E411009));
  v157 = v77 ^ v147;
  LODWORD(v43) = v56 ^ v31;
  v158 = ((BYTE3(v79) ^ 0x71338376) + (BYTE3(v79) ^ 0xA)) ^ ((v157 ^ 0x49)
                                                           - 699759053
                                                           + ((2 * (v157 & 1 ^ ~(((v157 ^ 0x49) + 96) & 0x53))) ^ 0x2E411003)) ^ *(_DWORD *)&v152[4 * (BYTE3(v79) ^ 0x5F)] ^ *(_DWORD *)&v153[4 * (BYTE2(v56) ^ 0x1C)] ^ (*(_DWORD *)&v154[4 * (BYTE1(v151) ^ 0x4F)] + 246799583) ^ *(_DWORD *)&v156[4 * (v157 ^ 0x3B)];
  v159 = HIBYTE(v151);
  LODWORD(v56) = *(_DWORD *)&v153[4 * (BYTE2(v151) ^ 0xA)] ^ ((BYTE3(v56) ^ 0x71338334) + (BYTE3(v56) ^ 0x48)) ^ *(_DWORD *)&v152[4 * (BYTE3(v56) ^ 0x1D)] ^ (*(_DWORD *)&v154[4 * (BYTE1(v77) ^ 0xD9)] + 246799583);
  LODWORD(v52) = (HIBYTE(v151) ^ 0x713383DE) + (HIBYTE(v151) ^ 0xA2);
  v160 = *(_DWORD *)&v153[4 * (BYTE2(v77) ^ 0xBF)];
  LODWORD(v152) = *(_DWORD *)&v152[4 * (v159 ^ 0xF7)];
  LODWORD(v81) = *(_DWORD *)&v156[4 * (v79 ^ 0x82)] ^ ((v79 ^ 0xF0) + 388079072) ^ ((v56 ^ 0x74A01E88) - 2 * ((v56 ^ 0x74A01E88) & 0x3F28E856 ^ v56 & 4) - 1087838126);
  LODWORD(v77) = *(_DWORD *)&v156[4 * (v43 ^ 0xB0)] ^ ((v43 ^ 0xC2)
                                                                      - 699759053
                                                                      + ((2
                                                                        * (((v43 ^ 0xC2) + 96) & 0x56 ^ (v43 | 0x7FFFFFFB))) ^ 0x2E411009)) ^ (*(_DWORD *)&v154[4 * (BYTE1(v79) ^ 0x9A)] + 246799583) ^ ((v152 ^ v52 ^ 0xFA842E9F) + (v160 ^ 0xA8F2B4AD) - 2 * ((v152 ^ v52 ^ 0x7A842E9F) & (v160 ^ 0x28F2B4AD)));
  v161 = (uint64_t)*(&off_24DCDB210 + (int)v155 - 368);
  v150[5] = ((BYTE2(v158) ^ 0x65) - ((2 * (BYTE2(v158) ^ 0x65)) & 0x52) + 41) ^ 0x34 ^ *(_BYTE *)(v161
                                                                                                + (BYTE2(v158) ^ 0xB8));
  v162 = (char *)*(&off_24DCDB210 + SHIDWORD(v167)) - 12;
  v150[2] = ((BYTE1(v83) ^ 0xC8) - 2 * ((BYTE1(v83) ^ 0xC8) & 0x39 ^ BYTE1(v83) & 1) + 56) ^ 0x92 ^ v162[BYTE1(v83) ^ 0xFCLL];
  v163 = (char *)*(&off_24DCDB210 + (int)v167) - 12;
  v150[4] = v163[BYTE3(v158) ^ 0x8DLL] ^ 0x6C;
  v150[13] = ((BYTE2(v77) ^ 0x38) - ((2 * (BYTE2(v77) ^ 0x38)) & 0x52) + 41) ^ 0xB9 ^ *(_BYTE *)(v161
                                                                                               + (((BYTE2(v77) ^ 0xFFFFFF9F)
                                                                                                 + (BYTE2(v77) ^ 0x38)
                                                                                                 + 1) ^ 0xFFFFFFF0)
                                                                                               + (BYTE2(v77) ^ 0x38));
  v150[*(_QWORD *)(v25 - 192)] = ((BYTE1(v158) ^ 0xDA) - ((2 * (BYTE1(v158) ^ 0xDA)) & 0x70) + 56) ^ v162[BYTE1(v158) ^ 0xE2] ^ 0x55;
  v164 = (uint64_t)*(&off_24DCDB210 + SHIDWORD(a13));
  v150[11] = *(_BYTE *)(v164 + (v81 ^ 0x53)) ^ 0xED ^ (((16
                                                                          * *(_BYTE *)(v164
                                                                                     + (v81 ^ 0x53))) | 0x10)
                                                                        - 7);
  v150[7] = *(_BYTE *)(v164 + (v158 ^ 0xCFLL)) ^ 0x71 ^ (((16
                                                                          * *(_BYTE *)(v164
                                                                                     + (v158 ^ 0xCFLL))) | 0x10)
                                                                        - ((32
                                                                          * *(_BYTE *)(v164
                                                                                     + (v158 ^ 0xCFLL))) & 0x40)
                                                                        + 46);
  v150[*(_QWORD *)(v25 - 184)] = ((BYTE2(v81) ^ 0x22) + (~(2 * (BYTE2(v81) ^ 0x22)) | 0xAD) + 42) ^ 0x69 ^ *(_BYTE *)(v161 + (BYTE2(v81) ^ 0xF1));
  v150[14] = (BYTE1(v77) - ((v77 >> 7) & 0x70) + 56) ^ 0x9A ^ v162[BYTE1(v77) ^ 0xB4];
  v150[8] = v163[(v81 >> 24) ^ 0xCBLL] ^ 3;
  LOBYTE(v52) = *(_BYTE *)(v164
                         + (((v83 ^ 0xCB) + ((2 * (_DWORD)v83) & 0x1DA ^ 0xFFFFFE6D) + 238) ^ 0x46));
  v150[3] = v52 ^ 0x72 ^ (((16 * v52) | 0x10) - ((32 * v52) & 0x40) - 94);
  v150[*(_QWORD *)(v25 - 160)] = v163[BYTE3(v77) ^ 0x97] ^ 0x35;
  v150[*(_QWORD *)(v25 - 144)] = ((BYTE2(v83) ^ 0x58) - ((2 * (BYTE2(v83) ^ 0x58)) & 0x52) + 41) ^ *(_BYTE *)(v161 + (BYTE2(v83) ^ 0x3FLL)) ^ 0x22;
  v150[*(_QWORD *)(v25 - 136)] = *(_BYTE *)(v164 + (v77 ^ 0x24)) ^ 0xAC ^ (118
                                                                                            - ((16
                                                                                              * *(_BYTE *)(v164 + (v77 ^ 0x24))) | 0x10));
  LODWORD(v164) = ((v83 >> 23) & 0xEA ^ 0xC2) + ((v83 >> 24) ^ 0xEFDF3F1E);
  v165 = *(_QWORD *)(v25 - 152);
  v150[v165] = v163[(v164 - ((2 * (_DWORD)v164 + 278) & 0x1AE) + 270582114) ^ 0x3FLL] ^ 0xD2;
  v150[*(_QWORD *)(v25 - 176)] = ((BYTE1(v81) ^ 0xFA) - ((2 * (BYTE1(v81) ^ 0xFA)) & 0x70) + 56) ^ 0x26 ^ v162[BYTE1(v81) ^ 0xB4];
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char *, _UNKNOWN **, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, char *, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a23 + 8 * ((613 * ((((_DWORD)v165 + 1575300532 - 2 * (((_DWORD)v165 + 16) & *(_DWORD *)(v25 - 164))) ^ 0x5DE52DA4u) < HIDWORD(v170))) ^ ((int)v155 + 27))) - 4))(82, 180, v155, v158, v154, &off_24DCDB210, 154, 194, a9, a10, a11, a12, a13, v167, v168, v169, v170, v46, v171,
           v28,
           v26,
           a22,
           a23,
           v172,
           13,
           2);
}

void sub_21A5BEAB0()
{
  JUMPOUT(0x21A5BC664);
}

uint64_t sub_21A5BEAF0(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return (*(uint64_t (**)(void))(v5 + 8 * (((((44 * (v4 ^ 0x405) - 356) | 0x74) - 197) * (v3 != a3)) ^ v4)))();
}

uint64_t sub_21A5BEB28(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v7;
  uint64_t v8;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v8
                                                                                        + 8
                                                                                        * (int)((501 * ((v7 >> 3) & 1)) ^ a7))
                                                                            - (a7 + 511)
                                                                            + 743))(a1, a2, a3, (a7 ^ 0xFFu) * a4, (a2 - a3));
}

uint64_t sub_21A5BEB58(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  char v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  char v34;
  uint64_t v35;
  int8x16x4_t v37;

  *(_DWORD *)(v30 - 128) = v31;
  *(_DWORD *)(v30 - 136) = v26;
  v32 = *(_QWORD *)(v30 - 120) - 7;
  *(_DWORD *)(v30 - 144) = v26 & 0xFFFFFFF8;
  v33 = -8 - a3;
  v34 = v29 + v28 + v27;
  v35 = (v29 + v28 + a1 + v33 + 8);
  v37.val[0].i64[0] = ((_BYTE)v29 + (_BYTE)v28 + (_BYTE)a1 + (_BYTE)v33 + 8) & 0xF;
  v37.val[0].i64[1] = (v34 - 115 + (_BYTE)v33 + 8) & 0xF;
  v37.val[1].i64[0] = (v34 - 116 + (_BYTE)v33 + 8) & 0xF;
  v37.val[1].i64[1] = (v34 + (_BYTE)v33 + ((a6 - 113) | 9) + 8) & 0xF;
  v37.val[2].i64[0] = (v34 - 118 + (_BYTE)v33 + 8) & 0xF;
  v37.val[2].i64[1] = (v34 - 119 + (_BYTE)v33 + 8) & 0xF;
  v37.val[3].i64[0] = (v34 - 120 + (_BYTE)v33 + 8) & 0xF;
  v37.val[3].i64[1] = (v34 - 121 + (_BYTE)v33 + 8) & 0xF;
  *(int8x8_t *)(v32 + v35) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v24 + (v35 & 0xF) - 7), *(int8x8_t *)(v32 + v35)), veor_s8(*(int8x8_t *)((v35 & 0xF) + v23 - 5), *(int8x8_t *)((v35 & 0xF) + v25 - 6))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v37, (int8x16_t)xmmword_21A5D5140), (int8x8_t)0x5353535353535353)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a23 + 8 * ((1703 * (-(v26 & 0xFFFFFFF8) == v33)) ^ a6)) - 8))((__n128)xmmword_21A5D5140);
}

void sub_21A5BECAC()
{
  JUMPOUT(0x21A5BEBC0);
}

uint64_t sub_21A5BECB4(int a1)
{
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((((a1 + 89) ^ 0x1AA) * (*(_DWORD *)(v2 - 136) == *(_DWORD *)(v2 - 144))) ^ a1))
                            - (a1 ^ 0x6Fu)
                            + 480))();
}

uint64_t sub_21A5BECF4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = (a5 - 539424754);
  *(_BYTE *)(*(_QWORD *)(v10 - 120) + v11) ^= *(_BYTE *)(v7 + (v11 & 0xF)) ^ *(_BYTE *)((v11 & 0xF) + v6 + 2) ^ *(_BYTE *)((v11 & 0xF) + v8 + 1) ^ (83 * (v11 & 0xF));
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((2 * (a5 - 1 != v5)) | (4 * (a5 - 1 != v5)) | (a4 - 283))) - 12))();
}

void sub_21A5BED64()
{
  int v0;
  int v1;
  uint64_t v2;

  if (v0 == 1135063088)
    v1 = 1412947868;
  else
    v1 = 1412905844;
  *(_DWORD *)(v2 + 16) = v1;
}

void sub_21A5BEDC8(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 - 244061113 * (((a1 | 0x8914F8E5) - (a1 & 0x8914F8E5)) ^ 0x776804F);
  __asm { BR              X15 }
}

uint64_t sub_21A5BEF0C()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((157 * (v0 ^ 0xC0) - 465)
                                          * (((2 * v1) & 0xFDFFBD8E ^ 0xFCE8980E) + (v1 ^ 0x818B92E0) - 142868481 != 1987829446)) ^ v0))
                            - 12))();
}

uint64_t sub_21A5BEF78(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * ((983
                                          * (v5 + v4 - 2130697927 < ((((a4 - 1902392792) & 0x716437D7) + 35) ^ 0x3F2u))) ^ a4))
                            - 12))();
}

uint64_t sub_21A5BEFD4(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7)
{
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (((a1 + a7 - 16 < (a5 ^ 0xFFFFFC0A)) * ((a6 - 415) ^ 0x5EF)) ^ a6))
                            - 4))();
}

uint64_t sub_21A5BF010(int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v19;

  v11 = a1 + v7 + v6 + ((a3 + 450) ^ 0x94u) - 878 + v10;
  v12 = ((_BYTE)a1 + (_BYTE)v7 + (_BYTE)v6 + ((a3 - 62) ^ 0x94) - 110) & 0xF;
  v13 = v12 + v5 - v11;
  v14 = (v12 | v4) - v11;
  v15 = (v12 | v3) - v11;
  v19 = (unint64_t)(v8 - v10 - 0x68E5D3FF1D6C014) > 0xF
     && v13 > 0xF
     && (unint64_t)(v14 + 1) > 0xF
     && (unint64_t)(v15 + 2) > 0xF;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * (v19 | (4 * v19) | a3)) - 8))();
}

uint64_t sub_21A5BF09C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (((v7 < (a7 ^ 0x26Au) - 244) * (((a7 - 878) | 0x136) - 80)) ^ a7))
                            - 4))();
}

uint64_t sub_21A5BF0D8(int a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  unsigned int v28;
  int8x16_t v29;
  int8x16_t v30;
  int8x16_t v31;
  int8x16x4_t v33;
  int8x16x4_t v34;

  v33.val[1].i64[0] = ((_BYTE)a2 + 7) & 0xF;
  v33.val[1].i64[1] = ((_BYTE)a2 + 6) & 0xF;
  v33.val[2].i64[0] = ((_BYTE)a2 + 5) & 0xF;
  v33.val[2].i64[1] = ((_BYTE)a2 + 4) & 0xF;
  v33.val[3].i64[0] = ((_BYTE)a2 + 3) & 0xF;
  v33.val[3].i64[1] = ((_BYTE)a2 + 2) & 0xF;
  v28 = v26 + v25 + a1;
  v29.i64[0] = 0xA3A3A3A3A3A3A3A3;
  v29.i64[1] = 0xA3A3A3A3A3A3A3A3;
  v33.val[0].i64[0] = v28 & 0xF;
  v33.val[0].i64[1] = ((_BYTE)a2 + 8) & 0xF;
  v30.i64[0] = vqtbl4q_s8(v33, (int8x16_t)xmmword_21A5D5130).u64[0];
  v34.val[0].i64[1] = a2 & 0xF;
  v34.val[1].i64[1] = ((_BYTE)a2 + 14) & 0xF;
  v34.val[2].i64[1] = ((_BYTE)a2 + 12) & 0xF;
  v34.val[3].i64[1] = ((_BYTE)a2 + 10) & 0xF;
  v34.val[0].i64[0] = ((_BYTE)a2 + 1) & 0xF;
  v34.val[1].i64[0] = ((_BYTE)a2 - 1) & 0xF;
  v34.val[2].i64[0] = ((_BYTE)a2 + 13) & 0xF;
  v34.val[3].i64[0] = (a2 + 11) & 0xF;
  v30.i64[1] = vqtbl4q_s8(v34, (int8x16_t)xmmword_21A5D5130).u64[0];
  v31 = vrev64q_s8(vmulq_s8(v30, v29));
  *(int8x16_t *)(v27 - 15 + v28) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v23 + v33.val[0].i64[0] - 15), *(int8x16_t *)(v20 - 15 + v28)), veorq_s8(*(int8x16_t *)(v33.val[0].i64[0] + v22 - 14), *(int8x16_t *)(v33.val[0].i64[0] + v21 - 13))), vextq_s8(v31, v31, 8uLL));
  return (*(uint64_t (**)(void))(a20
                              + 8
                              * (int)((((v24 & 0xFFFFFFF0) == 16) * ((a3 + 2056457929) & 0x856CF2FF ^ 0x7FE)) ^ a3)))();
}

void sub_21A5BF23C()
{
  JUMPOUT(0x21A5BF1C8);
}

uint64_t sub_21A5BF248()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * (v0 ^ (11 * (v1 != 0xFF744C27)))))(11, 745503066);
}

uint64_t sub_21A5BF298(int a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;

  v13 = v8 > v10;
  *(_BYTE *)(v12 + (a2 - 745503066)) = *(_BYTE *)(v5 + (((_BYTE)a2 - 90) & 0xF)) ^ *(_BYTE *)(v2 + (a2 - 745503066)) ^ *(_BYTE *)((((_BYTE)a2 - 90) & 0xF) + v4 + 1) ^ *(_BYTE *)(((a2 - 745503066) & 0xFLL) + v3 + 2) ^ (-93 * ((a2 - 90) & 0xF));
  if (v13 == a2 - 141285507 < v7)
    v13 = a2 - 141285507 < v9;
  return (*(uint64_t (**)(void))(v11 + 8 * ((v13 * a1) ^ v6)))();
}

uint64_t sub_21A5BF334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (a6 ^ (419 * (v6 == v7))))
                            - ((((a6 + 1113658344) & 0xBD9EEB3C) - 105) ^ 0x1B3)))();
}

uint64_t sub_21A5BF37C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  uint64_t v8;

  return (*(uint64_t (**)(void))(v8 + 8 * ((((((65 * (a7 ^ 0x1BF)) ^ 0x10C) & v7) == 0) * ((a7 ^ 0x241) - 897)) ^ a7)))();
}

uint64_t sub_21A5BF3B8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  char v32;
  uint64_t v33;
  int8x16x4_t v35;

  *(_DWORD *)(v28 - 132) = v24;
  *(_QWORD *)(v28 - 120) = v20 - 7;
  *(_QWORD *)(v28 - 128) = v29 - 7;
  *(_DWORD *)(v28 - 136) = v24 & 0xFFFFFFF8;
  v30 = -v27;
  v31 = v26 + v25;
  v32 = v26 + v25 + 7;
  v33 = (v31 + a1 + v30);
  v35.val[0].i64[0] = ((_BYTE)v31 + (_BYTE)a1 + (_BYTE)v30) & 0xF;
  v35.val[0].i64[1] = (v32 + (_BYTE)v30 + (((_BYTE)a6 + 37) & 0xD6)) & 0xF;
  v35.val[1].i64[0] = (v32 - 1 + (_BYTE)v30) & 0xF;
  v35.val[1].i64[1] = (v32 - 2 + (_BYTE)v30) & 0xF;
  v35.val[2].i64[0] = (v32 - 3 + (_BYTE)v30) & 0xF;
  v35.val[2].i64[1] = (v32 - 4 + (_BYTE)v30) & 0xF;
  v35.val[3].i64[0] = (v32 - 5 + (_BYTE)v30) & 0xF;
  v35.val[3].i64[1] = (v32 - 6 + (_BYTE)v30) & 0xF;
  *(int8x8_t *)(*(_QWORD *)(v28 - 128) + v33) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v23 + (v33 & 0xF) - 7), *(int8x8_t *)(*(_QWORD *)(v28 - 120) + v33)), veor_s8(*(int8x8_t *)((v33 & 0xF) + v22 - 6), *(int8x8_t *)((v33 & 0xF) + v21 - 5))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v35, (int8x16_t)xmmword_21A5D5140), (int8x8_t)0xA3A3A3A3A3A3A3A3)));
  return (*(uint64_t (**)(__n128))(a20 + 8 * ((43 * (8 - (v24 & 0xFFFFFFF8) == v30)) ^ a6)))((__n128)xmmword_21A5D5140);
}

void sub_21A5BF510()
{
  JUMPOUT(0x21A5BF43CLL);
}

uint64_t sub_21A5BF518(int a1)
{
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((((a1 - 476) ^ 0x2BA) * (*(_DWORD *)(v2 - 132) == *(_DWORD *)(v2 - 136))) ^ a1))
                            - 4))();
}

uint64_t sub_21A5BF554(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = a4 - 1987829995 + ((a5 + 673811331) & 0xD7D672A6);
  *(_BYTE *)(v11 + v12) = *(_BYTE *)(v8 + (v12 & 0xF)) ^ *(_BYTE *)(v5 + v12) ^ *(_BYTE *)((v12 & 0xF) + v7 + 1) ^ *(_BYTE *)((v12 & 0xF) + v6 + 2) ^ (-93 * (v12 & 0xF));
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((13 * (a4 - 1 != v9)) ^ (a5 - 823))) - 12))();
}

uint64_t sub_21A5BF5DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;
  int8x16_t v20;

  v15 = vrev64q_s8(*(int8x16_t *)*(_QWORD *)(v11 + 32));
  v16 = vextq_s8(v15, v15, 8uLL);
  v17.i64[0] = 0x2E2E2E2E2E2E2E2ELL;
  v17.i64[1] = 0x2E2E2E2E2E2E2E2ELL;
  v18 = vorrq_s8(v16, v17);
  v19 = vaddq_s8(v16, vornq_s8(v17, v16));
  v17.i64[0] = 0x8282828282828282;
  v17.i64[1] = 0x8282828282828282;
  v20 = vrev64q_s8(veorq_s8(vaddq_s8(v19, vaddq_s8(v18, v17)), (int8x16_t)xmmword_21A5D51E0));
  *(int8x16_t *)(v13 - 112) = vextq_s8(v20, v20, 8uLL);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 + 8 * (int)(a3 ^ (1607 * (v14 != 0)))) - 12))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

uint64_t sub_21A5BF650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12)
{
  uint64_t v12;
  int v13;
  unsigned int v14;
  _BOOL4 v16;

  v13 = a12 - ((2 * a12 + 1340987164) & 0x69DB71DE) - 1662737283;
  v14 = ((v13 << ((a3 - 2) ^ (a3 - 1))) & 0xDFBDB5CE ^ 0x499931CE) + (v13 ^ 0x5B336208);
  v16 = (((_BYTE)v14 + 9) & 0xF) != 0 || v14 == -270607641;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 + 8 * (int)((a3 - 1) ^ (7 * v16))) - (((_DWORD)a3 + 1347852689) & 0xAFA967CF ^ 0x389)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

uint64_t sub_21A5BF710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20)
{
  uint64_t v20;
  unsigned int v21;
  _BOOL4 v22;

  v21 = a13 - ((a11 << (((a20 - 84) | 0x86) + 74)) & 0x8F3CE1F2) - 1349165945;
  v22 = ((2 * v21) & 0xBFFFF7FE ^ 0x8F3CE1F2) + (v21 ^ 0x18618B06) + 587055097 != 50183160;
  return ((uint64_t (*)(void))(*(_QWORD *)(v20 + 8 * (((2 * v22) | (8 * v22)) ^ a20)) - 4))();
}

uint64_t sub_21A5BF7CC(uint64_t a1, int a2)
{
  int v2;
  int v3;
  uint64_t v4;
  _BOOL4 v5;

  v5 = a2 + v3 + 536871937 >= ((v2 + 539) | 0x28) + ((v2 - 338242496) & 0x14292B0Fu) - 1273;
  return (*(uint64_t (**)(void))(v4 + 8 * (((2 * v5) | (8 * v5)) ^ v2)))();
}

uint64_t sub_21A5BF85C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  unsigned int v6;
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7
                                                                                 + 8
                                                                                 * ((85
                                                                                   * ((a6 & 0xFFFFFFF0) == ((v6 + 755) ^ 0xDFFFFFFA))) ^ v6))
                                                                     - 12))(a1, a2, a3, a3);
}

uint64_t sub_21A5BF894(int a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _BOOL4 v21;
  int v23;

  v9 = (a1 + a2 + v5 + 1018);
  v10 = v8 + ((v6 + 619) ^ 0x373) + v9;
  v11 = (a2 + v5) & 0xF;
  v12 = v11 - v9;
  v13 = v3 + v12;
  v14 = v11 + 1;
  v15 = v3 + v11 + 1;
  v16 = v12 + v4 + 2;
  v17 = v11 + v4 + 3;
  v18 = v2 + v12;
  v19 = v2 + v14;
  v21 = v15 > v8 && v13 < v10;
  v23 = v17 > v8 && v16 < v10 || v21;
  if (v19 > v8 && v18 < v10)
    v23 = 1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (v6 | ((v23 ^ 1u) << 6))) - 12))();
}

uint64_t sub_21A5BF924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  unsigned int v6;
  uint64_t v7;

  return (*(uint64_t (**)(void))(v7 + 8 * ((((a6 - 1831901044) & 0x6D3097FB ^ 0x301) * (v6 < 0x10)) ^ a6)))();
}

uint64_t sub_21A5BF960(int a1, int a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  int8x16_t v15;
  int8x16_t v16;
  uint64_t v17;
  int8x16_t v18;
  int8x16_t v19;
  int8x16_t v20;
  int8x16x4_t v22;
  int8x16x4_t v23;

  v13 = (a6 - 1070508788) & 0x3FCEA7EF;
  v22.val[1].i64[0] = ((_BYTE)a3 + 5) & 0xF;
  v22.val[1].i64[1] = ((_BYTE)a3 + 4) & 0xF;
  v22.val[2].i64[0] = (((a6 + 12) ^ 0xFD) + (_BYTE)a3) & 0xF;
  v22.val[2].i64[1] = ((_BYTE)a3 + 2) & 0xF;
  v22.val[3].i64[0] = ((_BYTE)a3 + 1) & 0xF;
  v22.val[3].i64[1] = a3 & 0xF;
  v23.val[0].i64[0] = ((_BYTE)a3 - 1) & 0xF;
  v23.val[0].i64[1] = ((_BYTE)a3 + 14) & 0xF;
  v23.val[1].i64[0] = ((_BYTE)a3 + 13) & 0xF;
  v23.val[1].i64[1] = ((_BYTE)a3 + 12) & 0xF;
  v23.val[2].i64[0] = (a3 + 11) & 0xF;
  v23.val[2].i64[1] = (a3 + 10) & 0xF;
  v23.val[3].i64[0] = (a3 + 9) & 0xF;
  v23.val[3].i64[1] = ((_BYTE)a3 + 8) & 0xF;
  v14 = a1 + v13 + a2 + v9 + 908;
  v15.i64[0] = 0x3535353535353535;
  v15.i64[1] = 0x3535353535353535;
  v16.i64[0] = 0x4949494949494949;
  v16.i64[1] = 0x4949494949494949;
  v17 = ((_BYTE)a1 + (((_BYTE)a6 + 12) & 0xEF) + (_BYTE)a2 + (_BYTE)v9 - 116) & 0xF;
  v22.val[0].i64[0] = v17;
  v22.val[0].i64[1] = ((_BYTE)a3 + 6) & 0xF;
  v18.i64[0] = vqtbl4q_s8(v22, (int8x16_t)xmmword_21A5D5130).u64[0];
  v18.i64[1] = vqtbl4q_s8(v23, (int8x16_t)xmmword_21A5D5130).u64[0];
  v19 = vrev64q_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v12 - 15 + v14), *(int8x16_t *)(v7 + v17 - 15)), veorq_s8(*(int8x16_t *)(v17 + v8 - 13), *(int8x16_t *)(v6 + v17 - 15))));
  v20 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v19, v19, 8uLL), v16), vmulq_s8(v18, v15)));
  *(int8x16_t *)(v12 - 15 + v14) = vextq_s8(v20, v20, 8uLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((230 * ((v10 & 0xFFFFFFF0) != 16)) ^ v13)) - 4))();
}

void sub_21A5BFAE0()
{
  JUMPOUT(0x21A5BFA60);
}

uint64_t sub_21A5BFAEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, _BYTE *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  int v25;
  int v26;
  uint64_t v27;
  unsigned __int8 *v28;
  int v29;
  char *v30;
  uint64_t v31;
  char *v32;
  int v33;
  unint64_t v34;
  int v35;
  char *v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  uint64_t v44;
  int v45;
  int v46;
  uint64_t v47;
  int v48;
  char v49;
  int v50;
  int v51;
  char v52;
  char v53;
  int v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  int v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  int v63;
  int v64;
  int v65;
  uint64_t v66;
  int v67;
  unsigned int v68;
  char *v69;
  int v70;
  unint64_t v71;
  char *v72;
  unsigned int v73;
  char *v74;
  uint64_t v75;
  unsigned int v76;
  uint64_t v77;
  char v78;
  int v79;
  unsigned int v80;
  unsigned int v81;
  int v82;
  int v83;
  int v84;
  unsigned int v85;
  int v86;
  int v87;
  int v88;
  unsigned int v89;
  int v90;
  int v91;
  unsigned int v92;
  int v93;
  unsigned int v94;
  unsigned int v95;
  int v96;
  unsigned int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  BOOL v103;
  int v104;
  int v105;
  unsigned int v106;
  int v107;
  unint64_t v108;
  unsigned int v109;
  unsigned int v110;
  int v111;
  int v112;
  unsigned int v113;
  int v114;
  unsigned int v115;
  int v116;
  unsigned int v117;
  int v118;
  unsigned int v119;
  int v120;
  unsigned int v121;
  int v122;
  unsigned int v123;
  int v124;
  unsigned int v125;
  int v126;
  int v127;
  int v128;
  unsigned int v129;
  unsigned int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  unsigned int v135;
  unsigned int v136;
  int v137;
  unsigned int v138;
  unsigned int v139;
  int v140;
  unsigned int v141;
  unsigned int v142;
  int v143;
  unsigned int v144;
  int v145;
  int v146;
  int v147;
  unsigned int v148;
  unsigned int v149;
  int v150;
  unsigned int v151;
  int v152;
  unsigned int v153;
  int v154;
  int v155;
  unsigned int v156;
  unsigned int v157;
  int v158;
  unsigned int v159;
  int v160;
  unsigned int v161;
  unsigned int v162;
  int v163;
  int v164;
  int v165;
  unsigned int v166;
  int v167;
  unsigned int v168;
  int v169;
  int v170;
  unsigned int v171;
  unsigned int v172;
  int v173;
  int v174;
  unsigned int v175;
  int v176;
  unsigned int v177;
  unsigned int v178;
  int v179;
  unsigned int v180;
  int v181;
  unsigned int v182;
  unsigned int v183;
  int v184;
  unsigned int v185;
  unsigned int v186;
  int v187;
  unint64_t v188;
  int v189;
  unsigned int v190;
  int v191;
  unsigned int v192;
  int v193;
  unsigned int v194;
  int v195;
  unsigned int v196;
  int v197;
  int v198;
  int v199;
  int v200;
  unsigned int v201;
  int v202;
  unsigned int v203;
  unsigned int v204;
  int v205;
  unsigned int v206;
  int v207;
  unsigned int v208;
  int v209;
  unsigned int v210;
  unsigned int v211;
  unsigned int v212;
  int v213;
  unint64_t v214;
  unsigned int v215;
  unsigned int v216;
  unsigned int v217;
  int v218;
  int v219;
  unsigned int v220;
  int v221;
  unsigned int v222;
  unsigned int v223;
  unsigned int v224;
  int v225;
  int v226;
  int v227;
  int v228;
  int v229;
  unsigned int v230;
  unsigned int v231;
  unsigned int v232;
  unsigned int v233;
  int v234;
  unsigned int v235;
  int v236;
  int v237;
  unsigned int v238;
  unsigned int v239;
  int v240;
  int v241;
  int v242;
  int v243;
  int v244;
  uint64_t v245;
  unsigned int v246;
  int v247;
  uint64_t v248;
  unsigned int v249;
  unsigned int v250;
  unsigned int v251;
  unsigned int v252;
  int v253;
  char *v254;
  int v255;
  int v256;
  int v257;
  int v258;
  uint64_t v259;
  int v260;
  int v261;
  int v262;
  uint64_t v263;
  unsigned int v264;
  uint64_t v265;
  unsigned int v266;
  unsigned int v267;
  uint64_t v268;
  int v269;
  int v270;
  unsigned int v271;
  unsigned int v272;
  int v273;
  unsigned int v274;
  char *v275;
  char *v276;
  char *v277;
  int v278;
  int v279;
  uint64_t v280;
  uint64_t v281;
  char *v283;
  char *v284;
  uint64_t v285;
  char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  int v296;
  int v297;
  unsigned int v298;

  v29 = (v26 - 1191090812) & 0x46FE9A7C;
  v30 = (char *)*(&off_24DCDB210 + v26 - 403) - 8;
  v31 = (uint64_t)*(&off_24DCDB210 + v26 - 439);
  v32 = (char *)*(&off_24DCDB210 + v26 - 456) - 4;
  v33 = v32[(v29 ^ *(_BYTE *)(v27 - 97) ^ 0x1B)];
  HIDWORD(v34) = ~v33;
  LODWORD(v34) = (v33 ^ 0x62) << 24;
  v35 = (((v34 >> 25) >> 7) & 1 | (2 * (v34 >> 25))) ^ 8;
  v36 = (char *)*(&off_24DCDB210 + ((v26 - 182) ^ 0x1DF)) - 12;
  v37 = v32[*(unsigned __int8 *)(v27 - 105) ^ 0x6DLL] ^ 0x63 | ((*(unsigned __int8 *)(v31 + ~*(_BYTE *)(v27 - 108)) ^ 0xED) << 24) | ((v36[*(unsigned __int8 *)(v27 - 107) ^ 0xAELL] ^ 0xC3) << 16);
  v38 = *(unsigned __int8 *)(v31 + (*(unsigned __int8 *)(v27 - 112) ^ 0xA9));
  v39 = v38 ^ 0xA3;
  if ((v38 & 0x10) != 0)
    v40 = -16;
  else
    v40 = 16;
  v41 = ((v30[*(unsigned __int8 *)(v27 - 110) ^ 0x29] ^ 0x90) << 8) | (((v40 + v39) ^ 0x62) << 24);
  v42 = ((v30[*(unsigned __int8 *)(v27 - 102) ^ 0xA5] ^ 0xB1) << 8) | ((v36[*(unsigned __int8 *)(v27 - 103) ^ 0xD8] ^ 0xA4) << 16) | ((*(unsigned __int8 *)(v31 + (*(unsigned __int8 *)(v27 - 104) ^ 0x12)) ^ 0xD) << 24);
  v43 = v35 | ((v36[*(unsigned __int8 *)(v27 - 99) ^ 0x36] ^ 0x17) << 16);
  v44 = *(unsigned __int8 *)(v27 - 106);
  v45 = v32[*(unsigned __int8 *)(v27 - 101) ^ 0xF2] ^ 0x63;
  *(_DWORD *)(v27 - 132) = (v45 | v42) - 2 * ((v45 | v42) & 0x5405935F ^ v45 & 0xC) - 737832109;
  v46 = v30[v44 ^ 0x87];
  v285 = v31;
  v47 = *(unsigned __int8 *)(v27 - 111);
  v48 = v37 | ((v46 ^ 0x51) << 8);
  v49 = v47 ^ 0x31;
  v283 = v36;
  v50 = v36[v47 ^ 0x69];
  v51 = v43 | ((*(unsigned __int8 *)(v31 + (*(unsigned __int8 *)(v27 - 100) ^ 0xDBLL)) ^ 0xF6) << 24);
  v52 = (v47 ^ 0x31) - ((2 * v47) & 0xC) + 6;
  if ((v47 & 8) != 0)
    v53 = -8;
  else
    v53 = 8;
  v286 = v30;
  v54 = v51 | ((v30[*(unsigned __int8 *)(v27 - 98) ^ 0xB5] ^ 0xBD) << 8);
  v284 = v32;
  v55 = v41 | ((v50 ^ (((v53 + v49) ^ v52) + (~(2 * ((v53 + v49) ^ v52)) | 0xB3) + 39) ^ 0x23) << 16) | v32[(*(unsigned __int8 *)(v27 - 109) - ((2 * *(unsigned __int8 *)(v27 - 109)) & 0xB4u) + 90) ^ 0x90] ^ 0x63;
  *(_DWORD *)(v27 - 140) = v48 ^ 0x531C5E2;
  *(_DWORD *)(v27 - 136) = v55 ^ 0xA8DA1C7D;
  *(_DWORD *)(v27 - 144) = v54 ^ 0x77B086C5;
  HIDWORD(a12) = v25 + 270607641;
  HIDWORD(a18) = 0;
  HIDWORD(v291) = (v29 - 480) | 0x129;
  v56 = (HIDWORD(v291) ^ 0xFFFFFE99) & 0xE2188B39 ^ 0xE2188B3B;
  *(_QWORD *)(v27 - 160) = v56;
  v57 = v28[v56];
  v58 = v29;
  *(_QWORD *)(v27 - 168) = 14;
  LOBYTE(v55) = v28[14];
  v59 = v32[v57 ^ 0x36];
  *(_QWORD *)(v27 - 152) = 0;
  v60 = *v28;
  v287 = (v29 + 1515747699) & 0xA5A787ED;
  *(_QWORD *)(v27 - 120) = 5;
  LOBYTE(v60) = *(_BYTE *)(v31 + (v60 ^ 6));
  *(_QWORD *)(v27 - 200) = 1;
  v61 = ((unint64_t)(v60 ^ 0x71u) << 24) | ((v283[v28[1] ^ 0x30] ^ 0x5ELL) << 16);
  *(_QWORD *)(v27 - 128) = 6;
  *(_QWORD *)(v27 - 176) = 2;
  v62 = v30[v28[2] ^ 0xEELL];
  *(_QWORD *)(v27 - 192) = 8;
  v63 = *(unsigned __int8 *)(v31 + (v28[8] ^ 0x49));
  v295 = v61 | ((v62 ^ 0xCB) << 8);
  *(_QWORD *)(v27 - 216) = 15;
  *(_QWORD *)(v27 - 208) = 10;
  *(_DWORD *)(v27 - 180) = -501707975;
  v59 ^= 0x63u;
  LODWORD(v61) = ((v63 ^ 0x79) << 24) | ((v30[v28[10] ^ 0xEDLL] ^ 0xD0) << 8) | v59 | ((v283[v28[9] ^ 4] ^ 0xFC) << 16);
  v64 = v61 - 2 * (v61 & 0x58C46443 ^ v59 & 3);
  v65 = *(unsigned __int8 *)(v31 + (v28[12] ^ 0x63));
  v66 = v32[v28[15] ^ 0xEDLL];
  v67 = ((v65 ^ 0xE0) << 24) | ((v283[v28[13] ^ 0xBLL] ^ 0x73) << 16) | v66 ^ 0x63 | ((v30[(v55 ^ (((v29 + 115) & 0xED) + 76))] ^ 0x15) << 8);
  v68 = v64 - 658217920;
  v69 = (char *)*(&off_24DCDB210 + v29 - 231) - 12;
  v70 = *(_DWORD *)&v69[4 * (((unsigned __int16)(v64 + 25664) >> 8) ^ 0xEE)];
  HIDWORD(v71) = v70 ^ 0x30D78;
  LODWORD(v71) = v70 ^ 0xDDE00000;
  HIDWORD(a25) = v67 - 1562689902 - 2 * (v67 & 0x22DB3EFC ^ (v66 ^ 0x63) & 4) + 102;
  v298 = v29;
  v72 = (char *)*(&off_24DCDB210 + (v29 ^ 0x361)) - 8;
  v73 = *(_DWORD *)&v72[4 * (v60 ^ 7)] ^ 0xAC53722F;
  v74 = (char *)*(&off_24DCDB210 + (v58 ^ 0x2BC)) - 12;
  v75 = (uint64_t)*(&off_24DCDB210 + v58 - 299);
  v290 = v284[v28[7] ^ 0x42];
  v76 = v73 ^ (4 * v73) ^ *(_DWORD *)&v74[4 * (((HIDWORD(a25) ^ 0x425C5469u) >> 16) ^ 0xA7)] ^ *(_DWORD *)(v75 + 4 * (v290 ^ 0x6B)) ^ (((HIDWORD(a25) ^ 0x425C5469u) >> 16) - 2020888975 - (((HIDWORD(a25) ^ 0x425C5469u) >> 15) & 0xE2)) ^ (v71 >> 19);
  v77 = v284[v28[3] ^ 4];
  v78 = v77 ^ 0x63;
  v289 = v295 | v77 ^ 0x63;
  v79 = *(_DWORD *)&v69[4
                      * ((unsigned __int16)((v67 + 16018 - 2 * (v67 & 0x3EFC ^ (v66 ^ 0x63) & 4) + 102) ^ 0x5469) >> 8)];
  HIDWORD(v71) = v79 ^ 0x30D78;
  LODWORD(v71) = v79 ^ 0xDDE00000;
  HIDWORD(a23) = *(unsigned __int8 *)(v31 + (v28[4] ^ 0xCLL));
  v80 = *(_DWORD *)&v72[4 * (HIDWORD(a23) ^ 0x40)] ^ 0xAC53722F;
  v81 = v80 ^ (((v289 ^ 0x1F2CD76C) >> 16)
             - 2020888975
             - ((2 * ((v289 ^ 0x1F2CD76CuLL) >> 16)) & 0xE2)) ^ (4 * v80) ^ *(_DWORD *)&v74[4
                                                                                          * (((v289 ^ 0x1F2CD76C) >> 16) ^ 0xA7)] ^ (v71 >> 19) ^ *(_DWORD *)(v75 + 4 * (v68 ^ 0x3Eu));
  LODWORD(v62) = *(_DWORD *)&v72[4 * (v63 ^ 8)] ^ 0xAC53722F;
  v82 = *(_DWORD *)&v69[4 * ((unsigned __int16)(v289 ^ 0xD76C) >> 8)];
  HIDWORD(v71) = v82 ^ 0x30D78;
  LODWORD(v71) = v82 ^ 0xDDE00000;
  v83 = v283[v28[*(_QWORD *)(v27 - 120)] ^ 0x7BLL];
  HIDWORD(v288) = v83;
  v84 = v83 ^ *(_DWORD *)&v74[4 * (v83 ^ 0x2E)] ^ (4 * v62 - 2020888975 - ((8 * v62) & 0xF175CE0)) ^ 0x26 ^ (v71 >> 19);
  v85 = *(_DWORD *)(v75 + 4 * (v66 ^ 0x1D)) ^ v62 ^ (v84 + 1836555855 - ((2 * v84) & 0xDAEF3C9E));
  LODWORD(v291) = v68;
  LODWORD(v66) = (HIWORD(v68) ^ 0xC073) & 0x7D ^ HIWORD(v68) & 0xC;
  LODWORD(v62) = BYTE2(v68) ^ 0x73;
  LODWORD(v288) = v30[v28[*(_QWORD *)(v27 - 128)] ^ 9];
  v86 = *(_DWORD *)&v69[4 * (v288 ^ 0x28)];
  HIDWORD(v71) = v86 ^ 0x30D78;
  LODWORD(v71) = v86 ^ 0xDDE00000;
  v87 = *(_DWORD *)&v72[4 * (v65 ^ 0x69)];
  LODWORD(v66) = (v62 - 2020888975 - 2 * v66) ^ 0xB14DC8BC ^ *(_DWORD *)&v74[4 * (v62 ^ 0xA7)] ^ (4 * v87) ^ (v71 >> 19);
  LODWORD(v66) = *(_DWORD *)(v75 + 4 * (v77 ^ 0xE0)) ^ v87 ^ (v66 + 1836555855 - ((2 * v66) & 0xDAEF3C9E));
  LODWORD(v77) = *(_DWORD *)&v72[4 * (HIBYTE(v76) ^ 0xCB)] ^ 0xAC53722F;
  v88 = *(_DWORD *)&v74[4 * (((v66 ^ 0x54694136) >> 16) ^ 0xA7)] ^ (4 * v77) ^ (((v66 ^ 0x54694136) >> 16) - 2020888975 - (((v66 ^ 0x54694136) >> 15) & 0xE2));
  LODWORD(v62) = *(_DWORD *)&v69[4 * (BYTE1(v85) ^ 7)];
  HIDWORD(v71) = v62 ^ 0x30D78;
  LODWORD(v71) = v62 ^ 0xDDE00000;
  v296 = v71 >> 19;
  v89 = *(_DWORD *)(v75 + 4 * (v81 ^ 0x1Au)) ^ v296 ^ v77 ^ (v88
                                                                              + 1836555855
                                                                              - ((2 * v88) & 0xDAEF3C9E));
  LODWORD(v77) = *(_DWORD *)&v72[4 * (HIBYTE(v81) ^ 0xD8)] ^ 0xAC53722F;
  v90 = *(_DWORD *)&v69[4 * ((unsigned __int16)(v66 ^ 0x4136) >> 8)];
  HIDWORD(v71) = v90 ^ 0x30D78;
  LODWORD(v71) = v90 ^ 0xDDE00000;
  v91 = *(_DWORD *)&v74[4 * (((v76 ^ 0xA2E785BE) >> 16) ^ 0xA7)] ^ ((v76 ^ 0xA2E785BE) >> 16) ^ (4 * v77 - 2020888975 - ((8 * v77) & 0xF175CE0)) ^ (v71 >> 19);
  v92 = *(_DWORD *)(v75 + 4 * (v85 ^ 0x66u)) ^ v77 ^ (v91 + 1836555855 - ((2 * v91) & 0xDAEF3C9E));
  LODWORD(v77) = *(_DWORD *)&v69[4 * ((unsigned __int16)(v76 ^ 0x85BE) >> 8)];
  HIDWORD(v71) = v77 ^ 0x30D78;
  LODWORD(v71) = v77 ^ 0xDDE00000;
  BYTE1(v91) = BYTE1(v81) ^ 0xE7;
  v93 = *(_DWORD *)&v74[4 * (((v81 ^ 0xB1DEE7F5) >> 16) ^ 0xA7)] ^ ((v81 ^ 0xB1DEE7F5) >> 16);
  v94 = *(_DWORD *)&v72[4 * (HIBYTE(v85) ^ 0xA6)] ^ 0xAC53722F;
  v95 = v93 ^ v94 ^ (4 * v94) ^ (v71 >> 19) ^ *(_DWORD *)(v75 + 4 * (v66 ^ 0xD9u));
  LODWORD(v77) = *(_DWORD *)&v74[4 * (BYTE2(v85) ^ 0xD1)];
  HIDWORD(v71) = v77 ^ 0xBAE71;
  LODWORD(v71) = v77 ^ 0x87878787;
  LODWORD(v77) = v71 >> 20;
  v96 = *(_DWORD *)&v69[4 * BYTE1(v91)];
  HIDWORD(v71) = v96 ^ 0x30D78;
  LODWORD(v71) = v96 ^ 0xDDE00000;
  LODWORD(v77) = (((((v85 >> 15) & 0x3A ^ 0xFFFD7) + (BYTE2(v85) ^ 0x76)) << 12) + 381808070) ^ 0xE42DAEEC ^ v77;
  LODWORD(v66) = *(_DWORD *)&v72[4 * (BYTE3(v66) ^ 0x3D)] ^ 0xAC53722F;
  LODWORD(v77) = (v71 >> 19) ^ (4 * v66) ^ ((_DWORD)v77 << 20) ^ (v77 >> 12);
  v97 = *(_DWORD *)(v75 + 4 * (v76 ^ 0x51u)) ^ v66 ^ (v77 + 1836555855 - ((2 * v77) & 0xDAEF3C9E));
  v98 = *(_DWORD *)&v72[4 * (HIBYTE(v89) ^ 0xF)];
  LODWORD(v77) = ((2 * v98) ^ 0x58A6E45E) << (v78 & 1) << !(v78 & 1);
  LODWORD(v77) = v77 - 803326923 - ((2 * v77) & 0xA03C6868);
  v99 = (v98 & 0x8000 ^ 0x27FBFEF7) + 2 * (v98 & 0x8000);
  v100 = v98 ^ 0x83B2B9E5 ^ v77;
  v101 = v77 ^ 0xD01E3435;
  v102 = (v100 + v101 + 1) ^ ((v98 ^ 0x53AC8DD0) + 1);
  v103 = (v102 & (v99 - 670826231)) == 0;
  v104 = v99 - 601890887;
  v105 = 739761575 - v99;
  if (v103)
    v105 = v104;
  v106 = v98 & 0xFFFF7FFF ^ 0xAC53722F ^ (v102 - 68935344 + v105);
  v107 = *(_DWORD *)&v69[4 * (((unsigned __int16)(v95 ^ 0x6C1D) >> 8) ^ 0xEB)];
  HIDWORD(v108) = v107 ^ 0x30D78;
  LODWORD(v108) = v107 ^ 0xDDE00000;
  v109 = *(_DWORD *)(v75 + 4 * (v92 ^ 0xF4u)) ^ (v108 >> 19) ^ ((BYTE2(v97) ^ 0x67)
                                                                                 - 2020888975
                                                                                 - ((2 * (HIWORD(v97) ^ 0x1B67)) & 0xE2)) ^ *(_DWORD *)&v74[4 * (BYTE2(v97) ^ 0xC0)] ^ (v106 + v101);
  v110 = *(_DWORD *)&v72[4 * (HIBYTE(v92) ^ 0x64)] ^ 0xAC53722F;
  v111 = *(_DWORD *)&v69[4 * (BYTE1(v97) ^ 0xD3)];
  HIDWORD(v108) = v111 ^ 0x30D78;
  LODWORD(v108) = v111 ^ 0xDDE00000;
  v112 = (4 * v110 - 2020888975 - ((8 * v110) & 0xF175CE0)) ^ *(_DWORD *)&v74[4 * (BYTE2(v89) ^ 0xD4)] ^ (v108 >> 19);
  v113 = *(_DWORD *)(v75 + 4 * (v95 ^ 0x1Du)) ^ v110 ^ (v112 + 1836555855 - ((2 * v112) & 0xDAEF3C9E));
  v114 = *(_DWORD *)&v69[4 * (BYTE1(v89) ^ 0x16)];
  HIDWORD(v108) = v114 ^ 0x30D78;
  LODWORD(v108) = v114 ^ 0xDDE00000;
  v115 = *(_DWORD *)&v72[4
                       * (((((v95 ^ 0xDC616C1D) >> 24) ^ 0xCC)
                                          + (((v95 ^ 0xDC616C1D) >> 23) & 0xEE ^ 0x66)
                                          + 9) ^ 0x69)] ^ 0xAC53722F;
  v116 = *(_DWORD *)&v74[4 * (BYTE2(v92) ^ 0x1A)] ^ ((BYTE2(v92) ^ 0xBD)
                                                   - 2020888975
                                                   - ((2 * (HIWORD(v92) ^ 0xDBD)) & 0xE2)) ^ v115 ^ (4 * v115) ^ (v108 >> 19);
  v117 = (v116 + 1836555855 - ((2 * v116) & 0xDAEF3C9E)) ^ *(_DWORD *)(v75 + 4 * (v97 ^ 0x47u));
  v118 = *(_DWORD *)&v69[4 * (BYTE1(v92) ^ 0xAB)];
  HIDWORD(v108) = v118 ^ 0x30D78;
  LODWORD(v108) = v118 ^ 0xDDE00000;
  v119 = *(_DWORD *)&v72[4 * (HIBYTE(v97) ^ 0x72)] ^ 0xAC53722F;
  v120 = *(_DWORD *)&v74[4 * BYTE2(v95)] ^ ((BYTE2(v95) ^ 0xA7) - 2020888975 - ((2 * (HIWORD(v95) ^ 0xE7A7)) & 0xE2)) ^ (4 * v119) ^ (v108 >> 19);
  v121 = *(_DWORD *)(v75
                   + 4
                   * ((v89 ^ 0xFA ^ -(v89 ^ 0xFA) ^ ((v89 ^ 0xFFFFFFEA)
                                                                                     + 240))
                    + 239)) ^ v119 ^ (v120 + 1836555855 - ((2 * v120) & 0xDAEF3C9E));
  v122 = *(_DWORD *)&v69[4 * (BYTE1(v117) ^ 0xD5)];
  HIDWORD(v108) = v122 ^ 0x30D78;
  LODWORD(v108) = v122 ^ 0xDDE00000;
  v123 = *(_DWORD *)&v72[4 * (HIBYTE(v109) ^ 0x7A)] ^ 0xAC53722F;
  v124 = *(_DWORD *)&v74[4 * (BYTE2(v121) ^ 0xB0)] ^ (4 * v123) ^ (v108 >> 19) ^ ((BYTE2(v121) ^ 0x17)
                                                                                - 2020888975
                                                                                - ((2 * (HIWORD(v121) ^ 0x5317)) & 0xE2));
  v125 = *(_DWORD *)(v75 + 4 * ((v113 ^ BYTE2(v89)) ^ 0x2Du)) ^ v123 ^ (v124
                                                                                         + 1836555855
                                                                                         - ((2 * v124) & 0xDAEF3C9E));
  v126 = *(_DWORD *)&v72[4 * (HIBYTE(v113) ^ 0x1C)];
  v127 = *(_DWORD *)&v69[4 * (BYTE1(v121) ^ 0x83)];
  v128 = ((v109 ^ 0x13F2A181) >> 16);
  v129 = (((4 * v126) ^ 0xB14DC8BC) & (v126 ^ 0xAC53722C) & 0x66D343C4 ^ ((4 * v126) ^ 0xB14DC8BC | v126 ^ 0xAC53722F) & 0x66D343C5 | ((4 * v126) ^ 0xB14DC8BC) & (v126 ^ 0xAC53722C) & 0x992CBC38 ^ ((4 * v126) ^ 0xB14DC8BC | v126 ^ 0xAC53722F) & 0x992CBC3A) ^ v128;
  HIDWORD(v108) = v127 ^ 0x30D78;
  LODWORD(v108) = v127 ^ 0xDDE00000;
  v130 = *(_DWORD *)(v75 + 4 * (v117 ^ 0x68u)) ^ (v108 >> 19) ^ *(_DWORD *)&v74[4 * (v128 ^ 0xA7)] ^ (v129 - 2020888975 - ((2 * v129) & 0xF175CE2));
  v131 = *(_DWORD *)&v72[4 * (HIBYTE(v117) ^ 0x77)];
  HIDWORD(v108) = v131 ^ 0x29E06BD;
  LODWORD(v108) = v131 ^ 0x20000000;
  v132 = v108 >> 27;
  v133 = *(_DWORD *)&v69[4 * ((unsigned __int16)(v109 ^ 0xA181) >> 8)];
  HIDWORD(v108) = v133 ^ 0x30D78;
  LODWORD(v108) = v133 ^ 0xDDE00000;
  v134 = v108 >> 19;
  LODWORD(v108) = __ROR4__(v132 ^ 0x3300E61B, 5);
  v135 = *(_DWORD *)&v74[4 * (BYTE2(v113) ^ 0xED)] ^ ((BYTE2(v113) ^ 0x4A)
                                                    - 2020888975
                                                    - ((2 * (HIWORD(v113) ^ 0x1C4A)) & 0xE2)) ^ *(_DWORD *)(v75 + 4 * (v121 ^ 0x1Cu)) ^ v108 ^ 0x575573A2 ^ v134 ^ (4 * (v108 ^ 0x575573A2));
  v136 = (HIWORD(v117) ^ 0xFBC68354) & 0x7D0D ^ 0x75052DFD ^ (-2
                                                            - ((~((HIWORD(v117) ^ 0xFBC68354) & 0x8407DF2) | 0x750530CF)
                                                             + ((HIWORD(v117) ^ 0xFBC68354) & 0x30C2 | 0x8AFACF30)));
  v137 = ((2 * v136) & 0x4F96DD88) - v136 - 1741385413;
  v138 = *(_DWORD *)&v72[4 * (HIBYTE(v121) ^ 0x53)] ^ 0xAC53722F;
  v139 = *(_DWORD *)&v69[4 * (BYTE1(v113) ^ 0x74)];
  v140 = *(_DWORD *)&v74[4 * (((BYTE2(v117) ^ 0xFFFFFF3A) + (v137 ^ 0x90748C3F) + 1) ^ 0xFFFFFFFE)
                       + 4 * (v137 ^ 0x90748C3F)] ^ (v139 >> 19) ^ (4 * v138 - 2020888975 - ((8 * v138) & 0xF175CE0)) ^ 0x1BBC;
  v141 = v138 ^ (v139 << 13) ^ *(_DWORD *)(v75 + 4 * (v109 ^ 0x6Eu)) ^ (v140
                                                                                         + 1836555855
                                                                                         - ((2 * v140) & 0xDAEF3C9E));
  v142 = ((v141 ^ 0x61AF0000) + 807380504 - 2 * ((v141 ^ 0x61AF0000) & 0x301FA61A ^ v141 & 2)) ^ v137;
  v143 = *(_DWORD *)&v69[4 * (BYTE1(v135) ^ 0xF6)];
  HIDWORD(v108) = v143 ^ 0x30D78;
  LODWORD(v108) = v143 ^ 0xDDE00000;
  v144 = *(_DWORD *)&v72[4 * (HIBYTE(v125) ^ 0x4C)] ^ 0xAC53722F;
  v145 = *(_DWORD *)&v74[4 * (BYTE2(v142) ^ 0x3D)] ^ v144 ^ (4 * v144) ^ ((BYTE2(v142) ^ 0x9A)
                                                                        - 2020888975
                                                                        - ((2 * (HIWORD(v142) ^ 0xF39A)) & 0xE2));
  v146 = (v108 >> 19) ^ *(_DWORD *)(v75 + 4 * (v130 ^ 0x8Fu));
  v147 = *(_DWORD *)&v69[4 * (BYTE1(v142) ^ 0xB5)];
  HIDWORD(v108) = v147 ^ 0x30D78;
  LODWORD(v108) = v147 ^ 0xDDE00000;
  v148 = v146 ^ (v145 + 1836555855 - ((2 * v145) & 0xDAEF3C9E));
  v149 = *(_DWORD *)&v72[4 * (HIBYTE(v130) ^ 0x11)] ^ 0xAC53722F;
  v150 = v149 ^ *(_DWORD *)&v74[4 * (BYTE2(v125) ^ 0xB3)] ^ (4 * v149) ^ ((BYTE2(v125) ^ 0x14)
                                                                        - 2020888975
                                                                        - 2
                                                                        * ((HIWORD(v125) ^ 0x4C14) & 0x79 ^ HIWORD(v125) & 8)) ^ (v108 >> 19);
  v151 = (v150 + 1836555855 - ((2 * v150) & 0xDAEF3C9E)) ^ *(_DWORD *)(v75
                                                                     + 4
                                                                     * ((v135 ^ 0x29 ^ -(v135 ^ 0x29) ^ ((v135 ^ 0xFFFFFF39) + 240))
                                                                      + 239));
  v152 = *(_DWORD *)&v69[4 * (BYTE1(v125) ^ 0x88)];
  HIDWORD(v108) = v152 ^ 0x30D78;
  LODWORD(v108) = v152 ^ 0xDDE00000;
  v153 = *(_DWORD *)&v72[4 * (HIBYTE(v135) ^ 0x71)] ^ 0xAC53722F;
  v154 = *(_DWORD *)&v74[4 * (((v130 ^ 0x783C1C60) >> 16) ^ 0xA7)] ^ (((v130 ^ 0x783C1C60) >> 16)
                                                                                     - 2020888975
                                                                                     - (((v130 ^ 0x783C1C60) >> 15) & 0xE2)) ^ v153 ^ (4 * v153) ^ (v108 >> 19);
  v155 = *(_DWORD *)&v69[4 * ((unsigned __int16)(v130 ^ 0x1C60) >> 8)];
  v156 = (v154 + 1836555855 - ((2 * v154) & 0xDAEF3C9E)) ^ *(_DWORD *)(v75 + 4 * (v142 ^ 0xECu));
  HIDWORD(v108) = v155 ^ 0x30D78;
  LODWORD(v108) = v155 ^ 0xDDE00000;
  v157 = *(_DWORD *)&v72[4 * (HIBYTE(v142) ^ 0xF3)] ^ 0xAC53722F;
  v158 = *(_DWORD *)&v74[4 * (BYTE2(v135) ^ 0x7C)] ^ ((BYTE2(v135) ^ 0xDB)
                                                    - 2020888975
                                                    - ((2 * (HIWORD(v135) ^ 0x18DB)) & 0xE2)) ^ v157 ^ (4 * v157) ^ (v108 >> 19);
  v159 = (v158 + 1836555855 - ((2 * v158) & 0xDAEF3C9E)) ^ *(_DWORD *)(v75 + 4 * (v125 ^ 0xA4u));
  v160 = *(_DWORD *)&v69[4 * (BYTE1(v156) ^ 0x23)];
  HIDWORD(v108) = v160 ^ 0x30D78;
  LODWORD(v108) = v160 ^ 0xDDE00000;
  v161 = *(_DWORD *)&v72[4 * (HIBYTE(v148) ^ 0xB8)] ^ 0xAC53722F;
  v162 = v161 ^ *(_DWORD *)&v74[4 * (BYTE2(v159) ^ 0x7E)] ^ (4 * v161) ^ *(_DWORD *)(v75
                                                                                   + 4
                                                                                   * (v151 ^ 0xDBu)) ^ (v108 >> 19) ^ ((BYTE2(v159) ^ 0xD9) - 2020888975 - 2 * ((HIWORD(v159) ^ 0x38D9) & 0x73 ^ HIWORD(v159) & 2));
  v163 = *(_DWORD *)&v72[4 * (HIBYTE(v151) ^ 0x47)];
  v164 = *(_DWORD *)&v69[4 * (BYTE1(v159) ^ 0x3E)];
  HIDWORD(v108) = v164 ^ 0x30D78;
  LODWORD(v108) = v164 ^ 0xDDE00000;
  v165 = *(_DWORD *)&v74[4 * (BYTE2(v148) ^ 0xEA)] ^ (4 * (v163 ^ 0xAC53722F)
                                                    - 2020888975
                                                    - ((8 * (v163 ^ 0xAC53722F)) & 0xF175CE0)) ^ (v108 >> 19) ^ BYTE2(v148) ^ 0x4D;
  v166 = *(_DWORD *)(v75 + 4 * (v156 ^ 0xF6u)) ^ v163 ^ (v165 + 1836555855 - ((2 * v165) & 0xDAEF3C9E));
  v167 = *(_DWORD *)&v72[4 * (HIBYTE(v156) ^ 0x17)];
  v168 = (((v167 ^ 0x53AC8DD0) + (v167 ^ 0x229E06BD) + 1) ^ 0xFFFFFFFC) + (v167 ^ 0x229E06BD);
  v169 = *(_DWORD *)&v69[4 * (BYTE1(v148) ^ 0xE2)];
  HIDWORD(v108) = v169 ^ 0x30D78;
  LODWORD(v108) = v169 ^ 0xDDE00000;
  v170 = BYTE2(v151) ^ *(_DWORD *)&v74[4 * (BYTE2(v151) ^ 0x7C)] ^ (4 * v168 - 2020888975 - ((8 * v168) & 0xF175CE0)) ^ 0xDB ^ (v108 >> 19);
  v171 = v168 ^ *(_DWORD *)(v75 + 4 * (v159 ^ 0xFDu)) ^ (v170 + 1836555855 - ((2 * v170) & 0xDAEF3C9E));
  v172 = BYTE2(v156) ^ 0xDC616C7E;
  v173 = *(_DWORD *)&v74[4 * (BYTE2(v156) ^ 0xC4)];
  v174 = (v173 ^ 0x4012C71) & v172;
  v175 = (v173 ^ 0x878BAE71) + v172;
  v176 = *(_DWORD *)&v69[4 * (BYTE1(v151) ^ 0xC3)];
  v177 = v175 - 2 * v174;
  HIDWORD(v108) = v176 ^ 0x30D78;
  LODWORD(v108) = v176 ^ 0xDDE00000;
  v178 = *(_DWORD *)&v72[4 * (HIBYTE(v159) ^ 0x38)] ^ 0xAC53722F;
  v179 = (v108 >> 19) ^ (4 * v178) ^ v177;
  v180 = *(_DWORD *)(v75 + 4 * (v148 ^ 8u)) ^ v178 ^ (v179 + 1836555855 - ((2 * v179) & 0xDAEF3C9E));
  v181 = ((BYTE2(v180) ^ 0x5F) - 2020888975 - ((2 * (HIWORD(v180) ^ 0x845F)) & 0xE2)) ^ *(_DWORD *)&v74[4 * (BYTE2(v180) ^ 0xF8)];
  v182 = (v181 & 2 ^ 0xE69EB2B7) + 2 * (v181 & 2);
  v183 = *(_DWORD *)&v72[4 * (HIBYTE(v162) ^ 0x14)] ^ 0xAC53722F;
  v184 = v183 ^ (4 * v183);
  v103 = ((v182 + 425807177) & v184) == 0;
  v185 = v182 + 1073470975;
  v186 = 221856621 - v182;
  if (v103)
    v186 = v185;
  v187 = *(_DWORD *)&v69[4 * (BYTE1(v171) ^ 0x29)];
  HIDWORD(v188) = v187 ^ 0x30D78;
  LODWORD(v188) = v187 ^ 0xDDE00000;
  v189 = v181 & 0xFFFFFFFD ^ (v188 >> 19) ^ (v184 - 647663798 + v186);
  v190 = (v189 + 1836555855 - ((2 * v189) & 0xDAEF3C9E)) ^ *(_DWORD *)(v75 + 4 * (v166 ^ 0x43u));
  v191 = *(_DWORD *)&v69[4 * (BYTE1(v180) ^ 0xB8)];
  HIDWORD(v188) = v191 ^ 0x30D78;
  LODWORD(v188) = v191 ^ 0xDDE00000;
  v192 = *(_DWORD *)&v72[4 * (HIBYTE(v166) ^ 0x24)] ^ 0xAC53722F;
  v193 = *(_DWORD *)&v74[4 * (((v162 ^ 0x7DB70DB5) >> 16) ^ 0xA7)] ^ (((v162 ^ 0x7DB70DB5) >> 16)
                                                                                     - 2020888975
                                                                                     - (((v162 ^ 0x7DB70DB5) >> 15) & 0xE2)) ^ (4 * v192) ^ (v188 >> 19);
  v194 = *(_DWORD *)(v75 + 4 * (v171 ^ 0x92u)) ^ v192 ^ (v193 + 1836555855 - ((2 * v193) & 0xDAEF3C9E));
  v195 = *(_DWORD *)&v72[4 * (HIBYTE(v171) ^ 0x27)];
  v196 = v166 ^ 0x4D419AAC;
  v197 = *(_DWORD *)&v69[4 * ((unsigned __int16)(v162 ^ 0xDB5) >> 8)];
  HIDWORD(v188) = v197 ^ 0x30D78;
  LODWORD(v188) = v197 ^ 0xDDE00000;
  v198 = *(_DWORD *)(v75 + 4 * (v180 ^ 0xA9u));
  v199 = (__PAIR64__(v198 ^ 0xD779E4Fu, v198 ^ 0x60000000u) >> 29) ^ __ROR4__((BYTE2(v196) - 2020888975 - ((v196 >> 15) & 0xE2)) ^ 0xDC616C1D ^ *(_DWORD *)&v74[4 * (BYTE2(v196) ^ 0xA7)] ^ (v188 >> 19) ^ (5 * (v195 ^ 0xAC53722F) - (((8 * v195) ^ 0x629B9178) & ((2 * v195) ^ 0x58A6E45E))), 29);
  v200 = *(_DWORD *)&v69[4 * BYTE1(v196)];
  HIDWORD(v188) = v200 ^ 0x30D78;
  LODWORD(v188) = v200 ^ 0xDDE00000;
  v201 = *(_DWORD *)&v72[4 * (HIBYTE(v180) ^ 0x84)] ^ 0xAC53722F;
  v202 = *(_DWORD *)&v74[4 * (BYTE2(v171) ^ 0x9B)] ^ ((BYTE2(v171) ^ 0x3C)
                                                    - 2020888975
                                                    - ((2 * (HIWORD(v171) ^ 0x4E3C)) & 0xE2)) ^ (4 * v201) ^ (v188 >> 19);
  v203 = *(_DWORD *)(v75 + 4 * (v162 ^ 0x5Au)) ^ v201 ^ (v202 + 1836555855 - ((2 * v202) & 0xDAEF3C9E));
  HIDWORD(v188) = v199 ^ 0xA5BAC629;
  LODWORD(v188) = v199 ^ 0xA5BAC629;
  v204 = v188 >> 3;
  v205 = *(_DWORD *)&v69[4 * (BYTE1(v204) ^ 0x3C)];
  HIDWORD(v188) = v205 ^ 0x30D78;
  LODWORD(v188) = v205 ^ 0xDDE00000;
  v206 = *(_DWORD *)&v72[4 * (((v190 ^ 0xB831E3C8) >> (v296 & 0x18) >> (v296 & 0x18 ^ 0x18)) ^ 0x69)] ^ 0xAC53722F;
  v207 = *(_DWORD *)&v74[4 * (BYTE2(v203) ^ 0x21)] ^ v206 ^ (4 * v206) ^ (v188 >> 19) ^ ((BYTE2(v203) ^ 0x86)
                                                                                       - 2020888975
                                                                                       - ((v203 >> 15) & 0xE2));
  v208 = (v207 & 0x100 ^ 0x9FBFEFFB) + 2 * (v207 & 0x100);
  v209 = *(_DWORD *)(v75 + 4 * (v194 ^ 0xC6u)) ^ 0x4C7BCB18;
  v103 = ((v208 + 1614811141) & v209) == 0;
  v210 = v208 + 2078261232;
  v211 = -1151361050 - v208;
  if (v103)
    v211 = v210;
  v212 = (v209 - 463450091 + v211) ^ v207 & 0xFFFFFEFF;
  v213 = *(_DWORD *)&v69[4 * (BYTE1(v203) ^ 0x34)];
  HIDWORD(v214) = v213 ^ 0x30D78;
  LODWORD(v214) = v213 ^ 0xDDE00000;
  v215 = *(_DWORD *)&v72[4 * (HIBYTE(v194) ^ 0x86)] ^ 0xAC53722F;
  v216 = v215 ^ *(_DWORD *)&v74[4 * (BYTE2(v190) ^ 0x96)] ^ (4 * v215) ^ *(_DWORD *)(v75
                                                                                   + 4
                                                                                   * (v204 ^ 0x99u)) ^ (v214 >> 19) ^ ((BYTE2(v190) ^ 0x31) - 2020888975 - 2 * ((HIWORD(v190) ^ 0xB831) & 0x7D ^ HIWORD(v190) & 0xC));
  v217 = *(_DWORD *)&v72[4 * (HIBYTE(v204) ^ 0x30)] ^ 0xAC53722F;
  v218 = *(_DWORD *)&v69[4 * (BYTE1(v190) ^ 0xE3)];
  HIDWORD(v214) = v218 ^ 0x30D78;
  LODWORD(v214) = v218 ^ 0xDDE00000;
  v219 = BYTE2(v194) ^ *(_DWORD *)&v74[4 * (BYTE2(v194) ^ 0xF1)] ^ 0x56 ^ (4 * v217
                                                                         - 2020888975
                                                                         - ((8 * v217) & 0xF175CE0));
  v220 = *(_DWORD *)(v75 + 4 * (v203 ^ 0x99u)) ^ v217 ^ (v219 + 1836555855 - ((2 * v219) & 0xDAEF3C9E));
  v221 = *(_DWORD *)&v72[4 * (HIBYTE(v203) ^ 8)];
  v222 = v220 ^ (v214 >> 19);
  v223 = v221 ^ 0xAC53722F;
  v224 = (2 * (v221 ^ 0xAC53722F)) << ((v214 & 0x80000) != 0) << ((v214 & 0x80000) == 0);
  v225 = *(_DWORD *)&v69[4 * (BYTE1(v194) ^ 0xB2)];
  HIDWORD(v214) = v225 ^ 0x30D78;
  LODWORD(v214) = v225 ^ 0xDDE00000;
  v226 = ((BYTE2(v204) ^ 0x7C) - 2020888975 - ((2 * (HIWORD(v204) ^ 0x597C)) & 0xE2)) ^ 0xDC616C1D ^ v223 ^ *(_DWORD *)&v74[4 * (BYTE2(v204) ^ 0xDB)] ^ (v214 >> 19) ^ v224;
  HIDWORD(v214) = *(_DWORD *)(v75 + 4 * (v190 ^ 0x27u)) ^ 0x4C7BCB18;
  LODWORD(v214) = HIDWORD(v214);
  v227 = (v214 >> 18) ^ __ROR4__(v226, 18);
  v228 = *(_DWORD *)&v69[4 * (BYTE1(v222) ^ 0x73)];
  HIDWORD(v214) = v228 ^ 0x30D78;
  LODWORD(v214) = v228 ^ 0xDDE00000;
  v229 = v214 >> 19;
  HIDWORD(v214) = v227 ^ 0xF86574A7;
  LODWORD(v214) = v227 ^ 0xF86574A7;
  v230 = (v214 >> 14) - ((2 * (v214 >> 14)) & 0x6708F7A8) - 1283163180;
  v231 = *(_DWORD *)&v72[4 * (HIBYTE(v212) ^ 0xC1)] ^ 0xAC53722F;
  v232 = v231 ^ *(_DWORD *)&v74[4 * (((v230 ^ 0x52DE5683) >> 16) ^ 0xA7)] ^ (4 * v231) ^ v229 ^ (((v230 ^ 0x52DE5683) >> 16) - 2020888975 - (((v230 ^ 0x52DE5683) >> 15) & 0xE2));
  v233 = (v232 + 1836555855 - ((2 * v232) & 0xDAEF3C9E)) ^ *(_DWORD *)(v75 + 4 * (v216 ^ 0x11u));
  v234 = *(_DWORD *)&v69[4
                       * ((unsigned __int16)(((v214 >> 14) - ((2 * (v214 >> 14)) & 0xF7A8) + 31700) ^ 0x5683) >> 8)];
  HIDWORD(v214) = v234 ^ 0x30D78;
  LODWORD(v214) = v234 ^ 0xDDE00000;
  v235 = *(_DWORD *)&v72[4 * (HIBYTE(v216) ^ 0x4D)] ^ 0xAC53722F;
  v236 = v235 ^ (4 * v235) ^ *(_DWORD *)&v74[4 * (((v212 ^ 0xA82C29F3) >> 16) ^ 0xA7)] ^ (v214 >> 19) ^ (((v212 ^ 0xA82C29F3) >> 16) - 2020888975 - (((v212 ^ 0xA82C29F3) >> 15) & 0xE2));
  v237 = *(_DWORD *)&v69[4 * ((unsigned __int16)(v212 ^ 0x29F3) >> 8)];
  HIDWORD(v214) = v237 ^ 0x30D78;
  LODWORD(v214) = v237 ^ 0xDDE00000;
  v238 = (v236 + 1836555855 - ((2 * v236) & 0xDAEF3C9E)) ^ *(_DWORD *)(v75 + 4 * (v222 ^ 0x38u));
  v239 = *(_DWORD *)&v72[4 * (HIBYTE(v222) ^ 0x29)] ^ 0xAC53722F;
  BYTE1(v231) = BYTE1(v216) ^ 6;
  v240 = *(_DWORD *)&v74[4 * (((v216 ^ 0x249406FE) >> 16) ^ 0xA7)] ^ ((v216 ^ 0x249406FE) >> 16) ^ (4 * v239 - 2020888975 - ((8 * v239) & 0xF175CE0)) ^ (v214 >> 19);
  v241 = *(_DWORD *)&v72[4 * (HIBYTE(v230) ^ 0x3B)];
  v242 = *(_DWORD *)(v75 + 4 * (v230 ^ 0x6Cu)) ^ v239;
  v243 = *(_DWORD *)&v69[4 * BYTE1(v231)];
  HIDWORD(v214) = v243 ^ 0x30D78;
  LODWORD(v214) = v243 ^ 0xDDE00000;
  v244 = *(_DWORD *)&v74[4 * (BYTE2(v222) ^ 0xDF)] ^ ((BYTE2(v222) ^ 0x78)
                                                    - 2020888975
                                                    - ((2 * (HIWORD(v222) ^ 0x2978)) & 0xE2)) ^ v241 ^ 0xAC53722F ^ (4 * (v241 ^ 0xAC53722F)) ^ *(_DWORD *)(v75 + 4 * (v212 ^ 0x1Cu)) ^ (v214 >> 19);
  v245 = (uint64_t)*(&off_24DCDB210 + (int)(v298 ^ 0x318));
  LODWORD(v293) = *(_DWORD *)(v245 + 4 * (BYTE2(v244) ^ 0x78u));
  LODWORD(v294) = *(_DWORD *)(v245 + 4 * (BYTE2(v233) ^ 0x60u));
  v246 = v242 ^ (v240 + 1836555855 - ((2 * v240) & 0xDAEF3C9E));
  v297 = *(_DWORD *)(v245 + 4 * (BYTE2(v238) ^ 0x1Cu));
  v247 = *(_DWORD *)(v245 + 4 * (BYTE2(v246) ^ 0x44u));
  v248 = (uint64_t)*(&off_24DCDB210 + (int)(v298 - 470));
  v249 = HIBYTE(v233);
  HIDWORD(v292) = *(_DWORD *)(v248 + 4 * (HIBYTE(v233) ^ 0xFA));
  v250 = HIBYTE(v238);
  LODWORD(v245) = *(_DWORD *)(v248 + 4 * (HIBYTE(v238) ^ 0x81));
  v251 = HIBYTE(v246);
  HIDWORD(v294) = *(_DWORD *)(v248 + 4 * (HIBYTE(v246) ^ 0x48));
  v252 = (v244 ^ 0x2D4CA06Fu) >> 24;
  v253 = *(_DWORD *)(v248 + 4 * (v252 ^ 0x8F));
  v254 = (char *)*(&off_24DCDB210 + (int)(v298 ^ 0x272)) - 12;
  v255 = (v246 >> 8) ^ 0xC77053;
  v256 = BYTE1(v246) ^ 0x53;
  LODWORD(v292) = *(_DWORD *)&v254[4 * (BYTE1(v246) ^ 0xA4)];
  v257 = ((unsigned __int16)(v244 ^ 0xA06F) >> 8);
  LODWORD(v248) = *(_DWORD *)&v254[4 * (v257 ^ 0xF7)];
  v258 = (v233 >> 8) ^ 0x756079;
  v259 = BYTE1(v233) ^ 0x79u;
  HIDWORD(v293) = *(_DWORD *)&v254[4 * (BYTE1(v233) ^ 0x8E)];
  v260 = (v238 >> 8) ^ 0xE285C;
  v261 = BYTE1(v238) ^ 0x5C;
  v262 = *(_DWORD *)&v254[4 * (BYTE1(v238) ^ 0xAB)];
  v263 = (uint64_t)*(&off_24DCDB210 + (int)(v298 ^ 0x240));
  LODWORD(v254) = *(_DWORD *)(v263 + 4 * (v238 ^ 0xBBu));
  v264 = *(_DWORD *)(v263 + 4 * (v246 ^ 0xC8u));
  v265 = *(unsigned int *)(v263 + 4 * (v244 ^ 0xBEu));
  v266 = *(_DWORD *)(v263 + 4 * (v233 ^ 0x84u));
  v267 = (v261 - 2016658736 - ((2 * v260) & 0x1A0)) ^ *(_DWORD *)(v27 - 144) ^ (2 * v252
                                                                              - ((4 * v252 + 3440) & 0x150C)
                                                                              - 1658760898) ^ v253 ^ (v247 + 1021977871) ^ v262 ^ v266 ^ (((v266 >> 4) ^ (v266 >> 3) ^ 0x8169992) + 39443438 - 2 * (((v266 >> 4) ^ (v266 >> 3) ^ 0x8169992) & 0x259DBEF ^ ((v266 >> 4) ^ (v266 >> 3)) & 1));
  v268 = (uint64_t)*(&off_24DCDB210 + (int)(v298 ^ 0x21F));
  a17[12] = *(_BYTE *)(v268 + (HIBYTE(v267) ^ 0x5ELL)) ^ HIBYTE(v267) ^ 0x97 ^ ((HIBYTE(v267) ^ 0x97)
                                                                              - 2
                                                                              * (((HIBYTE(v267) ^ 0x97) + 60) & 0x61 ^ (HIBYTE(v267) ^ 0x97) & 1)
                                                                              - 100) ^ 0xF0;
  v269 = (v257 - 2016658736 - (((v244 ^ 0x2D4CA06Fu) >> 7) & 0x1A0)) ^ v245 ^ (((2 * v250) ^ 0x1C)
                                                                             - 1566396097
                                                                             + ((2 * ((2 * v250) ^ 0x1C) + 3440) & 0x150C ^ 0xFA7E9FFF)) ^ v248 ^ (v294 + 1021977871) ^ v264 ^ 0xDF2BD321 ^ (((v264 >> 4) ^ 0x8169992 ^ (v264 >> 3)) - ((2 * ((v264 >> 4) ^ 0x8169992 ^ (v264 >> 3))) & 0x19487C) - 1609784258);
  v270 = (v269 + 87147786 - ((2 * v269) & 0xA638A14)) ^ *(_DWORD *)(v27 - 140);
  v271 = (v270 ^ 0x1F67EB9C ^ ((((v270 ^ 0x3B77F36) + (v270 ^ 0x652874E9) + 1) ^ 0xFFFFFFC0)
                             + 2052038517
                             - 2
                             * ((((v270 ^ 0x3B77F36) + (v270 ^ 0x652874E9) + 1) ^ 0xFFFFFFC0) & 0x7A4F9F7D ^ ((v270 ^ 0x3B77F36) + (v270 ^ 0x652874E9) + 1) & 8)))
       + 2 * ((((v270 ^ 0x3B77F36) + (v270 ^ 0x652874E9) + 1) ^ 0xFFFFFFC0) & (v270 ^ 0x652874E9));
  v272 = v271 - ((2 * v271) & 0x5B688A6A) + 766788917;
  a17[4] = *(_BYTE *)(v268 + (HIBYTE(v272) ^ 0x8DLL)) ^ HIBYTE(v272) ^ 0x44 ^ ((HIBYTE(v272) ^ 0x44) + 60) ^ 0xA9;
  HIDWORD(v214) = HIDWORD(v292) ^ 0x652874E9 ^ v292 ^ (v293 - ((2 * v293 + 30689822) & 0x7C3F50C) + 1087119253) ^ (v256 - 2016658736 - ((2 * v255) & 0x1A0)) ^ (((2 * v249) ^ 0xEA) - 1631537480);
  LODWORD(v214) = HIDWORD(v214);
  LODWORD(v214) = (v214 >> 24) ^ __ROR4__(v254 ^ 0xBEC48AB6 ^ (((v254 >> 4) ^ 0x8169992 ^ (v254 >> 3))- ((2* ((v254 >> 4) ^ 0x8169992 ^ (v254 >> 3))) & 0x3C7FB52)- 1042022999), 24) ^ 0xC2D4BD0F;
  HIDWORD(v214) = v214;
  v273 = *(_DWORD *)(v27 - 136) ^ 0xFC2D4BD ^ ((v214 >> 8) - 1462100984 - ((2 * (v214 >> 8)) & 0x51B43810));
  v274 = v273
       - ((2 * v273) & 0xCC40DF04)
       - 434081918
       - ((2 * (v273 - ((2 * v273) & 0xCC40DF04) - 434081918)) & 0x6E9B0388)
       - 1219657276;
  v275 = (char *)*(&off_24DCDB210 + (int)(v298 ^ 0x2A3)) - 8;
  a17[*(_QWORD *)(v27 - 200)] = v275[BYTE2(v274) ^ 0x66] ^ ((BYTE2(v274) ^ 0x4D)
                                                            - ((2 * (BYTE2(v274) ^ 0x4D)) & 0x22)
                                                            - 111) ^ 0x8D;
  a17[*(_QWORD *)(v27 - 120)] = v275[BYTE2(v272) ^ 0x4CLL] ^ ((BYTE2(v272) ^ 0xB4)
                                                            - ((2 * (BYTE2(v272) ^ 0xB4)) & 0x22)
                                                            - 111) ^ 0x92;
  v276 = (char *)*(&off_24DCDB210 + (int)(v298 - 418)) - 12;
  a17[7] = v276[v272 ^ 0xB3] ^ ((v272 ^ 0x35) - ((2 * (v272 ^ 0x35)) & 0xAC) - 42) ^ 0x24;
  v277 = (char *)*(&off_24DCDB210 + (int)(v298 - 319)) - 8;
  a17[*(_QWORD *)(v27 - 168)] = v277[BYTE1(v267) ^ 0x2ALL] ^ 0x13;
  v278 = (v259 - 2016658736 - ((2 * v258) & 0x1A0)) ^ *(_DWORD *)(v27 - 132) ^ HIDWORD(v294) ^ (((2 * v251) ^ 0x18E)
                                                                                              - 1566396097
                                                                                              + ((2
                                                                                                * ((2 * v251) ^ 0x18E)
                                                                                                + 3440) & 0x150C ^ 0xFA7E9FFF)) ^ (v297 + 1021977871) ^ HIDWORD(v293) ^ v265 ^ (((v265 >> 4) ^ 0x8169992 ^ (v265 >> 3)) - ((2 * ((v265 >> 4) ^ 0x8169992 ^ (v265 >> 3))) & 0x2523518E) + 848406727);
  LODWORD(v214) = __ROR4__(v278 ^ 0xBF6B2F2A, 23) ^ 0x44FBF238;
  HIDWORD(v214) = v214;
  LODWORD(v248) = v214 >> 9;
  a17[9] = (BYTE2(v248) - ((v248 >> 15) & 0x22) - 111) ^ 0x43 ^ v275[BYTE2(v248) ^ 0x91];
  v279 = (v272 >> 8) ^ 0x2DB445;
  a17[13] = ((BYTE2(v267) ^ 0x59) - ((2 * (BYTE2(v267) ^ 0x59)) & 0x22) - 111) ^ 0xCD ^ v275[BYTE2(v267) ^ 0xF3];
  LOBYTE(v275) = v277[v279 ^ 0xCBLL] ^ ((v279 ^ 0x61) + ((2 * v279) & 0x1A ^ 0xFD) - 114) ^ 0x72;
  a17[*(_QWORD *)(v27 - 128)] = ((_BYTE)v275 - ((2 * (_BYTE)v275) & 0xF0) - 8) ^ v279 ^ 0x99;
  a17[*(_QWORD *)(v27 - 208)] = v277[BYTE1(v278) ^ 0xB1] ^ 0x34;
  a17[*(_QWORD *)(v27 - 192)] = BYTE3(v248) ^ 0x4F ^ ((BYTE3(v248) ^ 0x4F)
                                                    - ((2 * (BYTE3(v248) ^ 0x4F) + 120) & 0xC0)
                                                    - 100) ^ 0x23 ^ *(_BYTE *)(v268 + (BYTE3(v248) ^ 0x86));
  a17[*(_QWORD *)(v27 - 216)] = ((v267 ^ 0x6B) - ((2 * (v267 ^ 0x6B)) & 0xAC) - 42) ^ 0x85 ^ v276[v267 ^ 0xD5];
  a17[*(_QWORD *)(v27 - 160)] = ((v278 ^ 0x8B) - ((2 * (v278 ^ 0x8B)) & 0xAC) - 42) ^ 0xA8 ^ v276[v278 ^ 0x38];
  a17[*(_QWORD *)(v27 - 176)] = v277[BYTE1(v274) ^ 0xEDLL] ^ 0xFA;
  LOBYTE(v275) = v276[v274 ^ 0x9ALL] ^ 0x8B;
  LOBYTE(v275) = ((v274 ^ v275 ^ 0xFD) + (v275 | v274 ^ 2) + 1) ^ (v275 | v274 ^ 2);
  v280 = HIBYTE(v274);
  a17[3] = (_BYTE)v275;
  LOBYTE(v275) = v280 ^ 0xCF ^ ((v280 ^ 0xCF) + ~(2 * (((v280 ^ 0xCF) + 60) & 0x62 ^ (v280 ^ 0xCF) & 2)) - 99) ^ *(_BYTE *)(v268 + (v280 ^ 6)) ^ 0x26;
  v281 = *(_QWORD *)(v27 - 152);
  a17[v281] = (_BYTE)v275;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, char *, uint64_t, char *, _BYTE *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a20 + 8 * (int)((1658 * ((((_DWORD)v281 - 501707959 - 2 * (((_DWORD)v281 + 16) & 0x62188B3F ^ *(_DWORD *)(v27 - 180) & 6)) ^ 0xE2188B39) < HIDWORD(a12))) ^ v298)) - 12))(170, 172, v298, 1697150185, 1021977871, 135698834, v265, v259, a9, a10, a11, a12, v283, v284, v285, v286, a17, a18, v287,
           a20,
           v288,
           v289,
           a23,
           v290,
           a25,
           v291,
           v292,
           v293,
           v294);
}

void sub_21A5C2030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22,int a23,int a24,int a25,int a26,int a27,int a28,int a29,int a30,int a31,int a32)
{
  uint64_t v32;
  unsigned int v33;
  int v34;
  int v35;
  unsigned int v36;
  unsigned int v37;

  *(_DWORD *)(v32 - 136) = (a32 - 192528045) ^ a23;
  v33 = ((2 * a31) & 0xFF763DFC ^ 0xB1000854) + (a31 ^ 0xA77F7AD4);
  if (v33 - 2142969598 >= 0xBE5A4144)
    v34 = -510481366;
  else
    v34 = -1611862674;
  if (v33 - 2142969598 >= 0xBE5A4144)
    v35 = -1101381308;
  else
    v35 = 0;
  *(_DWORD *)(v32 - 132) = (v33 + v34 + v35 - 531106924) ^ 0xE5E02F7D;
  *(_DWORD *)(v32 - 140) = (a27 ^ 0x63 | ((a22 ^ 0x5D) << 16) | ((a21 ^ 0x2A) << 8) | (~a26 << 24)) ^ 0x47BB9170;
  v36 = (a30 ^ 0xA2DB3E92) + 1345530211;
  v37 = v36 - 2 * ((a30 ^ 0xD17E80E) + (a30 ^ 0xA2DB3E92 | 0x50332963)) - 2;
  *(_DWORD *)(v32 - 144) = v37 + 2008057498 - 2 * (v37 & 0x77B0869B ^ v36 & 1);
  JUMPOUT(0x21A5BFE10);
}

uint64_t sub_21A5C2178(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * ((1979 * (((v4 == v5) ^ (((a4 + 23) ^ 0x7F) - 67)) & 1)) ^ (a4 + 791)))
                            - 4))();
}

uint64_t sub_21A5C21AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  int v7;
  uint64_t v8;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v8
                                                                      + 8
                                                                      * ((574
                                                                        * (((((a6 - 285) | 0x360) ^ 0x3F2) & v6) != 509 * (a6 ^ 0x1B5) - 1018)) ^ a6)))(a1, a2, a3, (a3 - v7));
}

uint64_t sub_21A5C21FC(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  char v31;
  unsigned int v32;
  int8x16x4_t v34;

  *(_DWORD *)(v28 - 120) = v26;
  *(_DWORD *)(v28 - 128) = v26 & 0xFFFFFFF8;
  v30 = v25 - (v26 & 0xFFFFFFF8) + 8;
  v31 = a2 + v24 + v23 - v25;
  v32 = a2 + v24 + v27 + a1 - v25;
  *(_DWORD *)(v28 - 132) = v27 - 579;
  v34.val[0].i64[0] = v32 & 0xF;
  v34.val[0].i64[1] = (v31 + 6) & 0xF;
  v34.val[1].i64[0] = (v31 + 5) & 0xF;
  v34.val[1].i64[1] = (v31 + 4) & 0xF;
  v34.val[2].i64[0] = (v31 + 3) & 0xF;
  v34.val[2].i64[1] = (v31 + 2) & 0xF;
  v34.val[3].i64[0] = (v31 + 1) & 0xF;
  v34.val[3].i64[1] = v31 & 0xF;
  *(int8x8_t *)(v29 - 7 + v32) = vrev64_s8(veor_s8(veor_s8(vrev64_s8(veor_s8(veor_s8(*(int8x8_t *)(v29 - 7 + v32), *(int8x8_t *)(v21 + v34.val[0].i64[0] - 7)), veor_s8(*(int8x8_t *)(v34.val[0].i64[0] + v22 - 5), *(int8x8_t *)(v20 + v34.val[0].i64[0] - 7)))), (int8x8_t)0x4949494949494949), vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v34, (int8x16_t)xmmword_21A5D5140), (int8x8_t)0x3535353535353535)));
  return (*(uint64_t (**)(__n128))(a20 + 8 * ((242 * (v30 == 0)) ^ (v27 - 657))))((__n128)xmmword_21A5D5140);
}

void sub_21A5C2338()
{
  JUMPOUT(0x21A5C226CLL);
}

uint64_t sub_21A5C2340()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(void))(v0
                              + 8
                              * (int)(((((*(_DWORD *)(v1 - 132) + 1972306504) & 0x8A70FFFA ^ 0xFFFFFC43)
                                      + ((*(_DWORD *)(v1 - 132) - 1195674041) & 0x47448BFB))
                                     * (*(_DWORD *)(v1 - 120) == *(_DWORD *)(v1 - 128))) ^ *(_DWORD *)(v1 - 132))))();
}

uint64_t sub_21A5C23A4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = (a4 - 50183161);
  *(_BYTE *)(v10 + v11) ^= *(_BYTE *)(v7 + (v11 & 0xF)) ^ *(_BYTE *)((v11 & 0xF) + v8 + 2) ^ *(_BYTE *)(v6 + (v11 & 0xF)) ^ (53 * (v11 & 0xF)) ^ 0x49;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((19 * (a4 - 1 == v5)) ^ (a5 - 844))) - 12))();
}

void sub_21A5C2414()
{
  int v0;
  int v1;
  uint64_t v2;

  if (v0 == 642595231)
    v1 = 1412947868;
  else
    v1 = 1412905844;
  *(_DWORD *)(v2 + 40) = v1;
}

void sub_21A5C2478(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 28) - 369883897 * ((-2 - ((a1 | 0x15502860) + (~(_DWORD)a1 | 0xEAAFD79F))) ^ 0xF684ADAB);
  __asm { BR              X13 }
}

uint64_t sub_21A5C25AC()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (v1 ^ ((v0 == 0xC98AFB5C) | (2 * (v0 == 0xC98AFB5C))))) - 12))();
}

uint64_t sub_21A5C260C@<X0>(unsigned int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;

  v12 = v6 > v8;
  v13 = (v9 - 1704253909);
  v14 = (((v5 - 730) | 0x180) - 381) & v13;
  *(_BYTE *)(v11 + v13) = *(_BYTE *)(v2 + v14) ^ *(_BYTE *)(v1 + v13) ^ *(_BYTE *)(v14 + v4 + 1) ^ *(_BYTE *)(v3 + v14) ^ (21 * v14);
  if (v12 == v9 - 976060596 < a1)
    v12 = v9 - 976060596 < v7;
  return (*(uint64_t (**)(void))(v10 + 8 * ((1708 * v12) ^ v5)))();
}

uint64_t sub_21A5C26A0@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  int v3;

  v3 = ((36 * ((a1 + 513) ^ 0x20D) - 1829495630) ^ v1) + ((2 * v1) & 0xB6FDCAC4 ^ 0x9215C280) - 1343922274 == ((4 * (a1 + 513)) ^ 0x828) + 191120592;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((v3 | (v3 << 6)) ^ (a1 + 513))) - 4))();
}

uint64_t sub_21A5C2720@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (a1 | ((v1 + ((a1 - 40) | 0x1A2u) - 1535042915 - 425 < 373 * (a1 ^ 0x32u)
                                                                                               - 738) << 6)))
                            - 4))();
}

uint64_t sub_21A5C2770(int a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (((((a3 + 222) | 0x62) ^ 0x2F5) * ((a1 + v3 + v4 - 16) > 0xFFFFFFEF)) ^ a3)))();
}

uint64_t sub_21A5C27AC(int a1, uint64_t a2, int a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _BOOL4 v20;

  v10 = a3 - 69;
  v11 = (a4 + a1);
  v12 = v11 + v9;
  v13 = v11 & 0xF;
  v14 = v13 + v5 - v12;
  v15 = (v13 | v7) - v12;
  v16 = v13 + v6 - v12;
  v20 = (unint64_t)(v4 - v9) < 0x10
     || v14 < 0x10
     || v15 + 1 < ((v10 + 1857360378) & 0x914AEDBD ^ 0x10DuLL)
     || v16 < ((v10 - 339840634) & 0x14418FFE ^ 0x2FAuLL);
  return (*(uint64_t (**)(void))(v8 + 8 * ((207 * v20) ^ v10)))();
}

uint64_t sub_21A5C284C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W8>)
{
  unsigned int v3;
  uint64_t v4;

  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v4
                                                                       + 8
                                                                       * (((v3 < (((a3 ^ 0x11E) + 820) ^ 0x327u))
                                                                         * ((127 * (a3 ^ 0x11E)) ^ 0x148)) ^ a3))
                                                           - 4))(a1, a2, 0);
}

uint64_t sub_21A5C2890(int a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a70;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  int v75;
  int v76;
  uint64_t v77;
  unsigned int v78;
  int8x16_t v79;
  int8x16_t v80;
  int8x16_t v81;
  int8x16x4_t v83;
  int8x16x4_t v84;

  v83.val[1].i64[0] = ((_BYTE)a2 + 13) & 0xF;
  v83.val[1].i64[1] = ((_BYTE)a2 + 12) & 0xF;
  v83.val[2].i64[0] = ((_BYTE)a2 + 11) & 0xF;
  v83.val[2].i64[1] = ((_BYTE)a2 + 10) & 0xF;
  v83.val[3].i64[0] = ((_BYTE)a2 + 9) & 0xF;
  v83.val[3].i64[1] = ((_BYTE)a2 + 8) & 0xF;
  v78 = v75 + v74 + a1;
  v79.i64[0] = 0x1515151515151515;
  v79.i64[1] = 0x1515151515151515;
  v83.val[0].i64[0] = v78 & 0xF;
  v83.val[0].i64[1] = ((_BYTE)a2 + 14) & 0xF;
  v80.i64[0] = vqtbl4q_s8(v83, (int8x16_t)xmmword_21A5D5130).u64[0];
  v84.val[0].i64[1] = ((_BYTE)a2 + 6) & 0xF;
  v84.val[1].i64[1] = ((_BYTE)a2 + 4) & 0xF;
  v84.val[2].i64[1] = (a2 + 2) & 0xF;
  v84.val[3].i64[1] = a2 & 0xF;
  v84.val[0].i64[0] = ((_BYTE)a2 + 7) & 0xF;
  v84.val[1].i64[0] = ((_BYTE)a2 + 5) & 0xF;
  v84.val[2].i64[0] = (a2 + 3) & 0xF;
  v84.val[3].i64[0] = (a2 + 1) & 0xF;
  v80.i64[1] = vqtbl4q_s8(v84, (int8x16_t)xmmword_21A5D5130).u64[0];
  v81 = vrev64q_s8(vmulq_s8(v80, v79));
  *(int8x16_t *)(*(_QWORD *)(v77 - 136) - 15 + v78) = veorq_s8(veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v71 + v83.val[0].i64[0] - 15), *(int8x16_t *)(v70 - 15 + v78)), *(int8x16_t *)(v72 + v83.val[0].i64[0] - 15)), *(int8x16_t *)((a4 ^ 0x3Bu) + v83.val[0].i64[0] + v73 - 340)), vextq_s8(v81, v81, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a70 + 8 * ((839 * ((v76 & 0xFFFFFFF0) == 16)) ^ a4)) - 4))();
}

void sub_21A5C29F4()
{
  JUMPOUT(0x21A5C2978);
}

uint64_t sub_21A5C2A00@<X0>(int a1@<W2>, int a2@<W8>)
{
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((a2 ^ 0x108 ^ ((a2 - 294) | 0x50)) * (v2 != a1)) ^ a2)) - 12))();
}

uint64_t sub_21A5C2A40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  char v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((344 * ((((v8 & 8) == 0) ^ (a8 - 1)) & 1)) ^ a8))
                            - 4))();
}

uint64_t sub_21A5C2A90(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a70;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  int v75;
  int v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  unsigned int v81;
  int8x16x4_t v83;

  *(_DWORD *)(v79 - 140) = v77;
  *(_DWORD *)(v79 - 152) = v77 & 0xFFFFFFF8;
  v80 = v74 + v76 + v75 - a3;
  v81 = v76 + v75 + a1 - a3;
  *(_DWORD *)(v79 - 156) = a6 - 711;
  v83.val[0].i64[0] = v81 & 0xF;
  v83.val[0].i64[1] = ((_BYTE)v76 + (_BYTE)v75 + (_BYTE)a6 + v74 - (_BYTE)a3) & 0xF;
  v83.val[1].i64[0] = (v80 + 54) & 0xF;
  v83.val[1].i64[1] = (v80 + 53) & 0xF;
  v83.val[2].i64[0] = (v80 + 52) & 0xF;
  v83.val[2].i64[1] = (v80 + 51) & 0xF;
  v83.val[3].i64[0] = (v80 + 50) & 0xF;
  v83.val[3].i64[1] = (v80 + 49) & 0xF;
  *(int8x8_t *)(v78 - 7 + v81) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v71 + v83.val[0].i64[0] - 7), *(int8x8_t *)(v70 - 7 + v81)), veor_s8(*(int8x8_t *)(v83.val[0].i64[0] + v73 - 6), *(int8x8_t *)(v72 + v83.val[0].i64[0] - 7))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v83, (int8x16_t)xmmword_21A5D5140), (int8x8_t)0x1515151515151515)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a70 + 8 * ((125 * (a3 - (v77 & 0xFFFFFFF8) == -8)) ^ a6)) - 12))((__n128)xmmword_21A5D5140);
}

void sub_21A5C2BCC()
{
  JUMPOUT(0x21A5C2B00);
}

uint64_t sub_21A5C2BD4()
{
  uint64_t v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * (((*(_DWORD *)(v1 - 156) + 634 + (*(_DWORD *)(v1 - 156) ^ 0x1FC) - 575)
                                          * (*(_DWORD *)(v1 - 140) == *(_DWORD *)(v1 - 152))) ^ *(_DWORD *)(v1 - 156)))
                            - 4))();
}

uint64_t sub_21A5C2C10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = (a5 - 191120641);
  *(_BYTE *)(v13 + v14) = *(_BYTE *)(v8 + (v14 & 0xF)) ^ *(_BYTE *)(v7 + v14) ^ *(_BYTE *)((v14 & 0xF) + v10 + 1) ^ *(_BYTE *)(v9 + (v14 & 0xF)) ^ ((v14 & 0xF) * ((36 * (a7 ^ 0xE1)) ^ 0x99));
  return (*(uint64_t (**)(void))(v12 + 8 * ((810 * (a5 - 1 == v11 + 48)) ^ (a7 - 286))))();
}

uint64_t sub_21A5C2C88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61)
{
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int8x16_t v65;

  v65 = veorq_s8(*(int8x16_t *)(*(_QWORD *)(v61 + 8) - 0x7E951D330E1DA31ALL), (int8x16_t)xmmword_21A5D5200);
  *(int8x16_t *)(v64 - 128) = veorq_s8(*(int8x16_t *)*(_QWORD *)(v61 + 32), (int8x16_t)xmmword_21A5D51F0);
  *(int8x16_t *)(v64 - 112) = v65;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v62 + 8 * (int)(a4 ^ (52 * (v63 != 0)))) - 12))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61);
}

uint64_t sub_21A5C2CF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61)
{
  uint64_t v61;
  int v62;
  int v63;
  _BOOL4 v65;

  v62 = HIDWORD(a25) - ((a4 ^ 0x2CB6B59A) & (2 * HIDWORD(a25) + 301620806)) - 1084716754;
  v63 = ((2 * v62) & 0x5AFEEEDA ^ 0x8B6A412) + (v62 ^ 0x3B242D66);
  v65 = ((((_DWORD)a4 + 1119883330) & 0xBD3FEE77 ^ 0x49) & (v63 + 3)) == 0 && v63 != 763328365;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v61 + 8 * (int)((1462 * v65) ^ a4)) - (((_DWORD)a4 + 629409371) & 0xDA7BF8FB) + 215))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61);
}

#error "21A5C8CD0: call analysis failed (funcsize=5658)"

void sub_21A5C8CD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int a71;
  int a72;
  int a73;
  int a74;
  uint64_t v74;

  *(_DWORD *)(v74 - 160) = a74 ^ 0xD687EED0;
  *(_DWORD *)(v74 - 156) = a72 ^ 0x36B87F6;
  *(_DWORD *)(v74 - 164) = a73 ^ 0xD40B1D35;
  *(_DWORD *)(v74 - 168) = a71 ^ 0x73B536;
  JUMPOUT(0x21A5C65C0);
}

uint64_t sub_21A5C8D28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,int a24,uint64_t a25,int a26,int a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int a71;
  uint64_t v71;

  return ((uint64_t (*)(void))(*(_QWORD *)(v71
                                        + 8
                                        * (a71 ^ (452
                                                * (((2 * (a27 - ((2 * a24) & 0x10255CE2) - 1324360300)) & 0xFEBF9EEA ^ 0x10251CE2)
                                                 + ((a27 - ((2 * a24) & 0x10255CE2) - 1324360300) ^ 0x774D6104)
                                                 - 856229530 == 1280755931))))
                            - 8))();
}

uint64_t sub_21A5C8DF0()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((2011
                                          * (v2 + v1 + ((v0 + 1613622214) & 0x9FD211EF ^ 0x80A03126) < ((v0 - 1222053881) & 0x48D70EEBu) - 738)) ^ v0))
                            - 12))();
}

uint64_t sub_21A5C8E94@<X0>(int a1@<W0>, int a2@<W2>, int a3@<W8>)
{
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((623 * (a1 + a2 - 16 >= ((a3 + 317) ^ 0xFFFFFD1A))) ^ a3)) - 8))();
}

uint64_t sub_21A5C8ECC@<X0>(int a1@<W0>, int a2@<W8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _BOOL4 v21;
  int v23;
  int v25;

  v9 = v6 + v5 + ((a2 + 209) ^ (a1 + 618));
  v10 = v9 + v8 + 1;
  v11 = ((_BYTE)v6 + (_BYTE)v5 + ((a2 - 47) ^ (a1 + 106))) & 0xF;
  v12 = v11 - v9;
  v13 = v4 + v12;
  v14 = v11 + 1;
  v15 = v4 + v11 + 1;
  v16 = v12 + v3 + 2;
  v17 = v3 + ((a2 - 1084862143) & 0x40A9AFFB ^ 0x2E9) + v11;
  v18 = v2 + v12;
  v19 = v2 + v14;
  v21 = v15 > v8 && v13 < v10;
  v23 = v17 > v8 && v16 < v10 || v21;
  if (v19 <= v8 || v18 >= v10)
    v25 = v23;
  else
    v25 = 1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((605 * (v25 ^ 1)) ^ a2)) - 8))();
}

uint64_t sub_21A5C8F78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, _QWORD);

  v10 = (uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v8
                                                                     + 8
                                                                     * (((((a7 - 554) | 0x281) - 473) * (v7 > 0xF)) ^ a7))
                                                         - (((a7 - 62) | 0x21u) ^ 0x265));
  *(_DWORD *)(v9 - 140) = v7;
  return v10(a1, a2, 0);
}

uint64_t sub_21A5C8FC0(int a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a70;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  int v74;
  int v75;
  uint64_t v76;
  unsigned int v77;
  int8x16_t v78;
  int8x16_t v79;
  int8x16_t v80;
  int8x16x4_t v82;
  int8x16x4_t v83;

  v82.val[1].i64[0] = ((_BYTE)a2 + 8) & 0xF;
  v82.val[1].i64[1] = ((_BYTE)a2 + 7) & 0xF;
  v82.val[2].i64[0] = ((_BYTE)a2 + 6) & 0xF;
  v82.val[2].i64[1] = ((_BYTE)a2 + 5) & 0xF;
  v82.val[3].i64[0] = ((_BYTE)a2 + 4) & 0xF;
  v82.val[3].i64[1] = ((_BYTE)a2 + 3) & 0xF;
  v77 = v74 + v73 + a1;
  v78.i64[0] = 0x1919191919191919;
  v78.i64[1] = 0x1919191919191919;
  v82.val[0].i64[0] = v77 & 0xF;
  v82.val[0].i64[1] = ((_BYTE)a2 + 9) & 0xF;
  v79.i64[0] = vqtbl4q_s8(v82, (int8x16_t)xmmword_21A5D5130).u64[0];
  v83.val[0].i64[1] = ((_BYTE)a2 + 1) & 0xF;
  v83.val[1].i64[1] = ((_BYTE)a2 - 1) & 0xF;
  v83.val[2].i64[1] = ((_BYTE)a2 + 13) & 0xF;
  v83.val[3].i64[1] = ((_BYTE)a2 + 11) & 0xF;
  v83.val[0].i64[0] = ((_BYTE)a2 + 2) & 0xF;
  v83.val[1].i64[0] = a2 & 0xF;
  v83.val[2].i64[0] = ((_BYTE)a2 + 14) & 0xF;
  v83.val[3].i64[0] = (a2 + 12) & 0xF;
  v79.i64[1] = vqtbl4q_s8(v83, (int8x16_t)xmmword_21A5D5130).u64[0];
  v80 = vrev64q_s8(vmulq_s8(v79, v78));
  *(int8x16_t *)(*(_QWORD *)(v76 - 136) - 15 + v77) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v72 + v82.val[0].i64[0] - 15), *(int8x16_t *)(*(_QWORD *)(v76 - 136) - 15 + v77)), veorq_s8(*(int8x16_t *)(v82.val[0].i64[0] + v71 - 13), *(int8x16_t *)(v70 + v82.val[0].i64[0] - 15))), vextq_s8(v80, v80, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a70 + 8 * ((54 * ((v75 & 0xFFFFFFF0) == 16)) ^ a4))
                            - ((a4 - 1222677334) & 0x48E091A7 ^ 0x123)))();
}

void sub_21A5C9130()
{
  JUMPOUT(0x21A5C90BCLL);
}

uint64_t sub_21A5C913C@<X0>(int a1@<W2>, int a2@<W8>)
{
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (a2 ^ (890 * (*(_DWORD *)(v3 - 140) != a1))))
                            - ((((a2 - 133) | 0x248u) - 116) ^ (a2 - 1668332968) & 0x6370BEFE)))();
}

uint64_t sub_21A5C9190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  char v7;
  uint64_t v8;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v8
                                                      + 8
                                                      * ((((v7 & 8) == ((a7 + 1545256291) & 0xA3E5427F ^ 0x261))
                                                        * ((a7 + 108) ^ 0x220)) ^ a7))
                                          - 4))(a1);
}

uint64_t sub_21A5C91E0(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a70;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  int v74;
  int v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  unsigned int v80;
  int8x16x4_t v82;

  *(_DWORD *)(v78 - 152) = v76 & 0xFFFFFFF8;
  v79 = v73 + v75 + v74 - a3;
  v80 = v75 + v74 + a1 - a3;
  *(_DWORD *)(v78 - 156) = a6 - 314;
  v82.val[0].i64[0] = v80 & 0xF;
  v82.val[0].i64[1] = (v79 + 99) & 0xF;
  v82.val[1].i64[0] = (v79 + 98) & 0xF;
  v82.val[1].i64[1] = ((_BYTE)v75 + (_BYTE)v74 + (_BYTE)a6 + v73 - (_BYTE)a3) & 0xF;
  v82.val[2].i64[0] = (v79 + 96) & 0xF;
  v82.val[2].i64[1] = (v79 + 95) & 0xF;
  v82.val[3].i64[0] = (v79 + 94) & 0xF;
  v82.val[3].i64[1] = (v79 + 93) & 0xF;
  *(int8x8_t *)(v77 - 7 + v80) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v72 + v82.val[0].i64[0] - 7), *(int8x8_t *)(v77 - 7 + v80)), veor_s8(*(int8x8_t *)(v82.val[0].i64[0] + v71 - 5), *(int8x8_t *)(v70 + v82.val[0].i64[0] - 7))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v82, (int8x16_t)xmmword_21A5D5140), (int8x8_t)0x1919191919191919)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a70 + 8 * ((1603 * (a3 - (v76 & 0xFFFFFFF8) == -8)) ^ a6)) - 4))((__n128)xmmword_21A5D5140);
}

void sub_21A5C9314()
{
  JUMPOUT(0x21A5C924CLL);
}

uint64_t sub_21A5C931C()
{
  uint64_t v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((138
                                          * (((*(_DWORD *)(v1 - 140) == *(_DWORD *)(v1 - 152)) ^ (118 * (*(_DWORD *)(v1 - 156) ^ 0x25) + 1)) & 1)) ^ *(_DWORD *)(v1 - 156)))
                            - 8))();
}

uint64_t sub_21A5C9368(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = (a5 - 1280756534);
  *(_BYTE *)(v10 + v11) ^= *(_BYTE *)(v8 + (v11 & 0xF)) ^ *(_BYTE *)((v11 & 0xF) + v7 + 2) ^ *(_BYTE *)(v6 + (v11 & 0xF)) ^ (25 * (v11 & 0xF));
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((607 * (a5 - 1 != v5)) ^ (a4 - 451))) - 8))();
}

void sub_21A5C93D0()
{
  int v0;
  int v1;
  uint64_t v2;

  if (v0 == 29454866)
    v1 = 1412947868;
  else
    v1 = 1412905844;
  *(_DWORD *)(v2 + 24) = v1;
}

uint64_t sub_21A5C9434(_DWORD *a1)
{
  unsigned int v2;
  uint64_t result;
  int v4;

  v2 = *a1 + 369883897 * ((((2 * (_DWORD)a1) | 0x155655C8) - (_DWORD)a1 + 1968493852) ^ 0x968050D0);
  result = ((uint64_t (*)(_QWORD, char *))*(&off_24DCDB210 + (int)(v2 + 1128011535)))(*(&off_24DCDB210 + (int)(v2 ^ 0xBCC3E904)), (char *)*(&off_24DCDB210 + (int)(v2 + 1128011356)) - 12);
  v4 = *(_DWORD *)*(&off_24DCDB210 + (int)(v2 ^ 0xBCC3E9B7));
  if ((_DWORD)result)
    v4 = 1412905562;
  a1[1] = v4;
  return result;
}

uint64_t sub_21A5C94F0(uint64_t result)
{
  unint64_t v1;
  int v2;
  int v3;
  unint64_t v4;
  unint64_t v5;
  int v6;
  int v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  int v11;

  v1 = 1288161731 * ((2 * (result & 0x1DF02C18BF69AB34) - result + 0x620FD3E7409654CBLL) ^ 0xD304230A9A9C153DLL);
  v2 = *(_DWORD *)(result + 8) + v1;
  v3 = *(_DWORD *)(result + 16) ^ v1;
  v4 = *(_QWORD *)result ^ v1;
  v5 = *(_QWORD *)(result + 32) + v1;
  v6 = *(_DWORD *)(result + 20) - v1;
  v7 = *(_DWORD *)(result + 12) - v1;
  v8 = v5 == v4;
  v9 = v5 > v4;
  if ((v2 & 1) != 0)
    v10 = v9;
  else
    v10 = v8;
  if (v10)
    v11 = v3;
  else
    v11 = v6;
  *(_DWORD *)(result + 28) = v11 ^ v7;
  return result;
}

uint64_t sub_21A5C9590(uint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  unint64_t v7;
  BOOL v8;
  _BOOL4 v9;
  int v10;
  int v11;

  v1 = 1398264479 * (((result | 0xDC3EC16E332894BFLL) - result + (result & 0x23C13E91CCD76B40)) ^ 0xE9EFA4E42D05858);
  v2 = *(_QWORD *)(result + 32) - v1;
  v3 = *(_DWORD *)(result + 16) ^ v1;
  v4 = *(_DWORD *)(result + 24) + v1;
  v5 = *(_DWORD *)result - v1;
  v6 = *(_DWORD *)(result + 28) ^ v1;
  v7 = *(_QWORD *)(result + 8) + v1;
  v8 = v2 >= v7;
  v9 = (uint64_t)v2 < (uint64_t)v7;
  v10 = !v8;
  if ((v5 & 1) == 0)
    v9 = v10;
  if (v9)
    v11 = v4;
  else
    v11 = v6;
  *(_DWORD *)(result + 20) = v3 ^ v11;
  return result;
}

_BYTE *sub_21A5C9634(_BYTE *result, char a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -(int)result & 7;
  if (v3 > a3)
    LODWORD(v3) = a3;
  switch((int)v3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_7;
    case 5:
      goto LABEL_6;
    case 6:
      goto LABEL_5;
    case 7:
      *result++ = a2;
LABEL_5:
      *result++ = a2;
LABEL_6:
      *result++ = a2;
LABEL_7:
      *result++ = a2;
LABEL_8:
      *result++ = a2;
LABEL_9:
      *result++ = a2;
LABEL_10:
      *result++ = a2;
      break;
    default:
      break;
  }
  v4 = a3 - v3;
  v6 = v4;
  v5 = v4 & 7;
  switch(v6)
  {
    case 0uLL:
      return result;
    case 1uLL:
      goto LABEL_20;
    case 2uLL:
      goto LABEL_19;
    case 3uLL:
      goto LABEL_18;
    case 4uLL:
      goto LABEL_17;
    case 5uLL:
      goto LABEL_16;
    case 6uLL:
      goto LABEL_15;
    case 7uLL:
      *result++ = a2;
LABEL_15:
      *result++ = a2;
LABEL_16:
      *result++ = a2;
LABEL_17:
      *result++ = a2;
LABEL_18:
      *result++ = a2;
LABEL_19:
      *result++ = a2;
LABEL_20:
      *result = a2;
      break;
    default:
      result = (_BYTE *)((uint64_t (*)(void))((char *)&loc_21A5C96C4 + 4 * byte_21A5E8017[(v5 >> 3) & 7]))();
      break;
  }
  return result;
}

uint64_t sub_21A5C9728(uint64_t result)
{
  char v1;
  int v3;

  v1 = 83 * ((result + 7 - 2 * (result & 7)) ^ 0x40);
  if ((*(_BYTE *)(result + 4) - v1) == 109 && (*(_BYTE *)(result + 5) - v1) == 169)
    v3 = 1412947868;
  else
    v3 = 1412905781;
  *(_DWORD *)(result + 8) = v3;
  return result;
}

uint64_t sub_21A5C9790(uint64_t result)
{
  unint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  int v10;

  v1 = 107940961 * ((2 * (result & 0x482E2A929B53ABB6) - result + 0x37D1D56D64AC5449) ^ 0xEFA6EA6C28371901);
  v2 = *(_DWORD *)(result + 12) - v1;
  v3 = *(_DWORD *)result - v1;
  v4 = *(_DWORD *)(result + 8) + v1;
  v5 = *(_DWORD *)(result + 28) ^ v1;
  v6 = *(_QWORD *)(result + 16);
  v7 = *(_QWORD *)(result + 32);
  v8 = v7 + v1 > v6 + v1;
  v9 = v7 == v6;
  if ((v2 & 1) == 0)
    v8 = v9;
  if (v8)
    v10 = v4;
  else
    v10 = v5;
  *(_DWORD *)(result + 4) = v10 ^ v3;
  return result;
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x24BDAC2D0](bytes, count);
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC300](data, *(_QWORD *)&len, md);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC308](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC310](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC318](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x24BDBBD40](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x24BDBBD68](allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x24BDBBD88](formatter, formatString);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFIndex CFHTTPMessageGetResponseStatusCode(CFHTTPMessageRef response)
{
  return MEMORY[0x24BDB72E8](response);
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
  MEMORY[0x24BDB7310](message, headerField, value);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF28]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFStreamCreatePairWithSocketToHost(CFAllocatorRef alloc, CFStringRef host, UInt32 port, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream)
{
  MEMORY[0x24BDBC4A0](alloc, host, *(_QWORD *)&port, readStream, writeStream);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

uint64_t CPLoggingCopyLogDirectory()
{
  return MEMORY[0x24BE046A0]();
}

uint64_t CPLoggingMaxLogFileLevel()
{
  return MEMORY[0x24BE046A8]();
}

uint64_t CPLoggingSetCreateLogFormatBlock()
{
  return MEMORY[0x24BE046B0]();
}

uint64_t CPLoggingSetLogDirectory()
{
  return MEMORY[0x24BE046B8]();
}

uint64_t CPLoggingSetLogName()
{
  return MEMORY[0x24BE046C0]();
}

uint64_t CPLoggingSetMaxConsoleLevel()
{
  return MEMORY[0x24BE046C8]();
}

uint64_t CPLoggingSetMaxLogFileLevel()
{
  return MEMORY[0x24BE046D0]();
}

uint64_t CUPrintNSDataAddress()
{
  return MEMORY[0x24BE291C8]();
}

uint64_t CUPrintNSDataHex()
{
  return MEMORY[0x24BE291D0]();
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x24BDD8720](AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x24BDD8740](*(_QWORD *)&AssertionID);
}

IOReturn IOPMAssertionSetProperty(IOPMAssertionID theAssertion, CFStringRef theProperty, CFTypeRef theValue)
{
  return MEMORY[0x24BDD8750](*(_QWORD *)&theAssertion, theProperty, theValue);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MRAVEndpointGetActiveSystemEndpointUID()
{
  return MEMORY[0x24BE64DA8]();
}

uint64_t MRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReason()
{
  return MEMORY[0x24BE64E30]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackState()
{
  return MEMORY[0x24BE65168]();
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

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x24BE7AF90]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x24BE7AFA0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x24BE7AFA8]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x24BE7AFB0]();
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

uint64_t SBSGetScreenLockStatus()
{
  return MEMORY[0x24BEB0C80]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x24BDF5760](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x24BDF5770](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x24BDF5790](target, flags);
}

Boolean SCNetworkReachabilityScheduleWithRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x24BDF5798](target, runLoop, runLoopMode);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x24BDF57A0](target, callout, context);
}

Boolean SCNetworkReachabilityUnscheduleFromRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x24BDF57B0](target, runLoop, runLoopMode);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

OSStatus SecKeyEncrypt(SecKeyRef key, SecPadding padding, const uint8_t *plainText, size_t plainTextLen, uint8_t *cipherText, size_t *cipherTextLen)
{
  return MEMORY[0x24BDE8B50](key, *(_QWORD *)&padding, plainText, plainTextLen, cipherText, cipherTextLen);
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x24BDE8C28]();
}

SecKeyRef SecTrustCopyPublicKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x24BDE8DC8](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x24BDE8DD8](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x24BDE8DE0](trust, result);
}

uint64_t TextToHardwareAddress()
{
  return MEMORY[0x24BE29A98]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x24BDF7920](image, compressionQuality);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFHTTPServerConnectionInvalidate()
{
  return MEMORY[0x24BDB74D8]();
}

uint64_t _CFHTTPServerConnectionSetClient()
{
  return MEMORY[0x24BDB74E8]();
}

uint64_t _CFHTTPServerConnectionSetDispatchQueue()
{
  return MEMORY[0x24BDB74F0]();
}

uint64_t _CFHTTPServerCopyProperty()
{
  return MEMORY[0x24BDB74F8]();
}

uint64_t _CFHTTPServerCreateService()
{
  return MEMORY[0x24BDB7508]();
}

uint64_t _CFHTTPServerInvalidate()
{
  return MEMORY[0x24BDB7510]();
}

uint64_t _CFHTTPServerRequestCopyProperty()
{
  return MEMORY[0x24BDB7528]();
}

uint64_t _CFHTTPServerRequestCreateResponseMessage()
{
  return MEMORY[0x24BDB7530]();
}

uint64_t _CFHTTPServerResponseCopyProperty()
{
  return MEMORY[0x24BDB7538]();
}

uint64_t _CFHTTPServerResponseCreateWithData()
{
  return MEMORY[0x24BDB7540]();
}

uint64_t _CFHTTPServerResponseEnqueue()
{
  return MEMORY[0x24BDB7548]();
}

uint64_t _CFHTTPServerSetDispatchQueue()
{
  return MEMORY[0x24BDB7558]();
}

uint64_t _CPLogLine()
{
  return MEMORY[0x24BE047B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x24BDACB10](dso, description, *(_QWORD *)&flags, activity_block);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
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

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
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

uint64_t os_state_add_handler()
{
  return MEMORY[0x24BDAF420]();
}

uint64_t random(void)
{
  return MEMORY[0x24BDAFA48]();
}

void srandom(unsigned int a1)
{
  MEMORY[0x24BDAFE98](*(_QWORD *)&a1);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

