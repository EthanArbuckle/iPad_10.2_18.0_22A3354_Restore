id SCLInterruptBehaviorResolutionXPCServerInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2553E8300);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_resolveBehaviorForEvent_clientIdentifier_completion_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_resolveBehaviorForEvent_clientIdentifier_completion_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_resolveBehaviorForEvent_clientIdentifier_completion_, 1, 1);

  return v0;
}

uint64_t SCLPBUnlockHistoryItemReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
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
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;

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
          *(_BYTE *)(a1 + 56) |= 2u;
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
          v53 = 16;
          goto LABEL_79;
        case 2u:
          *(_BYTE *)(a1 + 56) |= 1u;
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v53 = 8;
LABEL_79:
          *(_QWORD *)(a1 + v53) = v20;
          continue;
        case 3u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 24;
          goto LABEL_29;
        case 4u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 48;
LABEL_29:
          v26 = *(void **)(a1 + v25);
          *(_QWORD *)(a1 + v25) = v24;

          continue;
        case 5u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          *(_BYTE *)(a1 + 56) |= 0x10u;
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
              v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
              *(_QWORD *)(a2 + v30) = v32;
              v29 |= (unint64_t)(v33 & 0x7F) << v27;
              if (v33 < 0)
              {
                v27 += 7;
                v15 = v28++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v29) = 0;
LABEL_61:
          v52 = 40;
          goto LABEL_74;
        case 6u:
          v34 = 0;
          v35 = 0;
          v29 = 0;
          *(_BYTE *)(a1 + 56) |= 0x20u;
          while (2)
          {
            v36 = *v3;
            v37 = *(_QWORD *)(a2 + v36);
            v38 = v37 + 1;
            if (v37 == -1 || v38 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v37);
              *(_QWORD *)(a2 + v36) = v38;
              v29 |= (unint64_t)(v39 & 0x7F) << v34;
              if (v39 < 0)
              {
                v34 += 7;
                v15 = v35++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v29) = 0;
LABEL_65:
          v52 = 44;
          goto LABEL_74;
        case 7u:
          v40 = 0;
          v41 = 0;
          v29 = 0;
          *(_BYTE *)(a1 + 56) |= 4u;
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
              v29 |= (unint64_t)(v45 & 0x7F) << v40;
              if (v45 < 0)
              {
                v40 += 7;
                v15 = v41++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v29) = 0;
LABEL_69:
          v52 = 32;
          goto LABEL_74;
        case 8u:
          v46 = 0;
          v47 = 0;
          v29 = 0;
          *(_BYTE *)(a1 + 56) |= 8u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v48 = *v3;
        v49 = *(_QWORD *)(a2 + v48);
        v50 = v49 + 1;
        if (v49 == -1 || v50 > *(_QWORD *)(a2 + *v4))
          break;
        v51 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v49);
        *(_QWORD *)(a2 + v48) = v50;
        v29 |= (unint64_t)(v51 & 0x7F) << v46;
        if ((v51 & 0x80) == 0)
          goto LABEL_71;
        v46 += 7;
        v15 = v47++ >= 9;
        if (v15)
        {
          LODWORD(v29) = 0;
          goto LABEL_73;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_71:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v29) = 0;
LABEL_73:
      v52 = 36;
LABEL_74:
      *(_DWORD *)(a1 + v52) = v29;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_21E4B1144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E4B157C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E4B1950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_21E4B1D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t SCLPBScheduleSettingsReadFrom(uint64_t a1, uint64_t a2)
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
  SCLPBScheduleRecurrence *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
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
      if ((v10 >> 3) == 5)
      {
        v24 = objc_alloc_init(SCLPBScheduleRecurrence);
        objc_msgSend((id)a1, "addRecurrences:", v24);
        if (!PBReaderPlaceMark() || (SCLPBScheduleRecurrenceReadFrom((uint64_t)v24, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((_DWORD)v17 == 2)
      {
        v25 = 0;
        v26 = 0;
        v27 = 0;
        *(_BYTE *)(a1 + 24) |= 2u;
        while (1)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            break;
          v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 1;
          v27 |= (unint64_t)(v30 & 0x7F) << v25;
          if ((v30 & 0x80) == 0)
            goto LABEL_45;
          v25 += 7;
          v14 = v26++ >= 9;
          if (v14)
          {
            v27 = 0;
            goto LABEL_47;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
        if (*(_BYTE *)(a2 + *v5))
          v27 = 0;
LABEL_47:
        *(_BYTE *)(a1 + 20) = v27 != 0;
      }
      else if ((_DWORD)v17 == 1)
      {
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

void sub_21E4B5EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
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

void sub_21E4B747C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

SCLMutableScheduleSettings *SCLScheduleSettingsFromSCLPBScheduleSettings(void *a1)
{
  id v1;
  SCLMutableScheduleSettings *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  SCLRecurrenceSchedule *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(SCLMutableScheduleSettings);
  -[SCLMutableScheduleSettings setEnabled:](v2, "setEnabled:", objc_msgSend(v1, "isEnabled"));
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v1, "recurrences", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        SCLScheduleRecurrenceForSCLPBScheduleRecurrence(*(void **)(*((_QWORD *)&v12 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = -[SCLRecurrenceSchedule initWithRecurrences:]([SCLRecurrenceSchedule alloc], "initWithRecurrences:", v3);
  -[SCLMutableScheduleSettings setSchedule:](v2, "setSchedule:", v10);

  return v2;
}

SCLScheduleRecurrence *SCLScheduleRecurrenceForSCLPBScheduleRecurrence(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SCLTimeInterval *v8;
  SCLScheduleRecurrence *v9;

  v1 = a1;
  objc_msgSend(v1, "timeInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SCLScheduleTimeForSCLPBScheduleTime(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "timeInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SCLScheduleTimeForSCLPBScheduleTime(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SCLTimeInterval initWithStartTime:endTime:]([SCLTimeInterval alloc], "initWithStartTime:endTime:", v4, v7);
  LODWORD(v6) = objc_msgSend(v1, "day");

  v9 = -[SCLScheduleRecurrence initWithTimeInterval:day:]([SCLScheduleRecurrence alloc], "initWithTimeInterval:day:", v8, (int)v6);
  return v9;
}

SCLPBScheduleSettings *SCLPBScheduleSettingsFromSCLScheduleSettings(void *a1)
{
  id v1;
  SCLPBScheduleSettings *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(SCLPBScheduleSettings);
  -[SCLPBScheduleSettings setIsEnabled:](v2, "setIsEnabled:", objc_msgSend(v1, "isEnabled"));
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v1, "schedule", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recurrences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        SCLPBScheduleRecurrenceForSCLScheduleRecurrence(*(void **)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[SCLPBScheduleSettings setRecurrences:](v2, "setRecurrences:", v3);
  return v2;
}

SCLPBScheduleRecurrence *SCLPBScheduleRecurrenceForSCLScheduleRecurrence(void *a1)
{
  id v1;
  SCLPBScheduleRecurrence *v2;
  SCLPBTimeInterval *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = a1;
  v2 = objc_alloc_init(SCLPBScheduleRecurrence);
  -[SCLPBScheduleRecurrence setDay:](v2, "setDay:", objc_msgSend(v1, "day"));
  v3 = objc_alloc_init(SCLPBTimeInterval);
  objc_msgSend(v1, "timeInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SCLPBScheduleTimeForSCLScheduleTime(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLPBTimeInterval setStartTime:](v3, "setStartTime:", v6);

  objc_msgSend(v1, "timeInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "endTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SCLPBScheduleTimeForSCLScheduleTime(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLPBTimeInterval setEndTime:](v3, "setEndTime:", v9);

  -[SCLPBScheduleRecurrence setTimeInterval:](v2, "setTimeInterval:", v3);
  return v2;
}

uint64_t SCLDayForSCLPBDay(uint64_t result)
{
  return (int)result;
}

SCLPBScheduleTime *SCLPBScheduleTimeForSCLScheduleTime(void *a1)
{
  id v1;
  SCLPBScheduleTime *v2;
  uint64_t v3;

  v1 = a1;
  v2 = objc_alloc_init(SCLPBScheduleTime);
  -[SCLPBScheduleTime setHour:](v2, "setHour:", objc_msgSend(v1, "hour"));
  v3 = objc_msgSend(v1, "minute");

  -[SCLPBScheduleTime setMinute:](v2, "setMinute:", v3);
  return v2;
}

SCLScheduleTime *SCLScheduleTimeForSCLPBScheduleTime(void *a1)
{
  id v1;
  SCLScheduleTime *v2;

  v1 = a1;
  if ((SCLPBScheduleTimeIsEmpty(v1) & 1) != 0)
    v2 = 0;
  else
    v2 = -[SCLScheduleTime initWithHour:minute:]([SCLScheduleTime alloc], "initWithHour:minute:", objc_msgSend(v1, "hour"), objc_msgSend(v1, "minute"));

  return v2;
}

SCLPBScheduleTime *SCLPBEmptyScheduleTime()
{
  return objc_alloc_init(SCLPBScheduleTime);
}

uint64_t SCLPBScheduleTimeIsEmpty(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "hasHour") & 1) != 0)
    v2 = 0;
  else
    v2 = objc_msgSend(v1, "hasMinute") ^ 1;

  return v2;
}

SCLPBUnlockHistoryItem *SCLPBUnlockHistoryItemFromSCLUnlockHistoryItem(void *a1)
{
  id v1;
  SCLPBUnlockHistoryItem *v2;
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

  v1 = a1;
  v2 = objc_alloc_init(SCLPBUnlockHistoryItem);
  objc_msgSend(v1, "unlockedInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  -[SCLPBUnlockHistoryItem setStartTimeIntervalSinceReferenceDate:](v2, "setStartTimeIntervalSinceReferenceDate:");

  objc_msgSend(v1, "unlockedInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "duration");
  -[SCLPBUnlockHistoryItem setDuration:](v2, "setDuration:");

  objc_msgSend(v1, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calendarIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLPBUnlockHistoryItem setCalendarIdentifier:](v2, "setCalendarIdentifier:", v7);

  objc_msgSend(v1, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLPBUnlockHistoryItem setTimeZoneName:](v2, "setTimeZoneName:", v9);

  objc_msgSend(v1, "scheduleStartTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLPBUnlockHistoryItem setScheduleStartHour:](v2, "setScheduleStartHour:", objc_msgSend(v10, "hour"));

  objc_msgSend(v1, "scheduleStartTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLPBUnlockHistoryItem setScheduleStartMinute:](v2, "setScheduleStartMinute:", objc_msgSend(v11, "minute"));

  objc_msgSend(v1, "scheduleEndTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLPBUnlockHistoryItem setScheduleEndHour:](v2, "setScheduleEndHour:", objc_msgSend(v12, "hour"));

  objc_msgSend(v1, "scheduleEndTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCLPBUnlockHistoryItem setScheduleEndMinute:](v2, "setScheduleEndMinute:", objc_msgSend(v13, "minute"));
  return v2;
}

SCLUnlockHistoryItem *SCLUnlockHistoryItemFromSCLPBUnlockHistoryItem(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SCLScheduleTime *v13;
  SCLScheduleTime *v14;
  uint64_t v15;
  unsigned int v16;
  SCLScheduleTime *v17;
  SCLUnlockHistoryItem *v18;

  v1 = (void *)MEMORY[0x24BDBCE60];
  v2 = a1;
  objc_msgSend(v2, "startTimeIntervalSinceReferenceDate");
  objc_msgSend(v1, "dateWithTimeIntervalSinceReferenceDate:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  if (v4 >= 0.0)
    v5 = v4;
  else
    v5 = 0.0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v3, v5);
  v7 = (void *)MEMORY[0x24BDBCE48];
  objc_msgSend(v2, "calendarIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendarWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDBCF38];
  objc_msgSend(v2, "timeZoneName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeZoneWithName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SCLScheduleTime initWithHour:minute:]([SCLScheduleTime alloc], "initWithHour:minute:", objc_msgSend(v2, "scheduleStartHour"), objc_msgSend(v2, "scheduleStartMinute"));
  v14 = [SCLScheduleTime alloc];
  v15 = objc_msgSend(v2, "scheduleEndHour");
  v16 = objc_msgSend(v2, "scheduleEndMinute");

  v17 = -[SCLScheduleTime initWithHour:minute:](v14, "initWithHour:minute:", v15, v16);
  v18 = -[SCLUnlockHistoryItem initWithInterval:calendar:timeZone:startTime:endTime:]([SCLUnlockHistoryItem alloc], "initWithInterval:calendar:timeZone:startTime:endTime:", v6, v9, v12, v13, v17);

  return v18;
}

void sub_21E4B941C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E4B97C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_21E4B98D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_21E4B9B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state,char a26)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a26, 8);
  os_activity_scope_leave(&state);
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

void sub_21E4BA1C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_21E4BA634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

id scl_persistence_log()
{
  if (scl_persistence_log_onceToken != -1)
    dispatch_once(&scl_persistence_log_onceToken, &__block_literal_global_3);
  return (id)scl_persistence_log___logger;
}

void __scl_persistence_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SchoolTime", "persistence");
  v1 = (void *)scl_persistence_log___logger;
  scl_persistence_log___logger = (uint64_t)v0;

}

id scl_pairing_log()
{
  if (scl_pairing_log_onceToken != -1)
    dispatch_once(&scl_pairing_log_onceToken, &__block_literal_global_3);
  return (id)scl_pairing_log___logger;
}

void __scl_pairing_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SchoolTime", "pairing");
  v1 = (void *)scl_pairing_log___logger;
  scl_pairing_log___logger = (uint64_t)v0;

}

id scl_transport_log()
{
  if (scl_transport_log_onceToken != -1)
    dispatch_once(&scl_transport_log_onceToken, &__block_literal_global_5);
  return (id)scl_transport_log___logger;
}

void __scl_transport_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SchoolTime", "transport");
  v1 = (void *)scl_transport_log___logger;
  scl_transport_log___logger = (uint64_t)v0;

}

id scl_framework_log()
{
  if (scl_framework_log_onceToken != -1)
    dispatch_once(&scl_framework_log_onceToken, &__block_literal_global_7);
  return (id)scl_framework_log___logger;
}

void __scl_framework_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SchoolTime", "framework");
  v1 = (void *)scl_framework_log___logger;
  scl_framework_log___logger = (uint64_t)v0;

}

id scl_interrupt_log()
{
  if (scl_interrupt_log_onceToken != -1)
    dispatch_once(&scl_interrupt_log_onceToken, &__block_literal_global_9);
  return (id)scl_interrupt_log___logger;
}

void __scl_interrupt_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SchoolTime", "interrupt");
  v1 = (void *)scl_interrupt_log___logger;
  scl_interrupt_log___logger = (uint64_t)v0;

}

_DWORD *SCLSStateDataWithTitleDescriptionAndHints(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  size_t v6;
  _DWORD *v7;
  uint64_t v9;

  v3 = a1;
  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a2, 200, 0, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "length");
    v7 = malloc_type_calloc(1uLL, v6 + 200, 0xF9CF26B8uLL);
    *v7 = 1;
    v7[1] = v6;
    objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    __strlcpy_chk();
    memcpy(v7 + 50, (const void *)objc_msgSend(objc_retainAutorelease(v5), "bytes"), v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_21E4BC5C4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_21E4BC904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
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

void sub_21E4BDC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_21E4BDF90(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_21E4BEDC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t SCLIsStateTransitionStartOfUnlockPeriod(void *a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  unsigned int v6;
  uint64_t v7;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "activeState") == 2 || objc_msgSend(v3, "activeState") == 1)
    v5 = objc_msgSend(v3, "isInSchedule");
  else
    v5 = 0;
  if (objc_msgSend(v4, "activeState"))
    v6 = 0;
  else
    v6 = objc_msgSend(v4, "isInSchedule");
  v7 = v5 & v6;

  return v7;
}

uint64_t SCLIsStateTransitionEndOfUnlockPeriod(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL4 v5;
  _BOOL4 v6;
  unsigned int v7;
  uint64_t v8;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "isInSchedule"))
    v5 = objc_msgSend(v3, "activeState") == 0;
  else
    v5 = 0;
  v6 = objc_msgSend(v4, "activeState") == 2 || objc_msgSend(v4, "activeState") == 1;
  v7 = v6 | objc_msgSend(v4, "isInSchedule") ^ 1;
  if (v5)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

uint64_t SCLPBScheduleRequestResponseReadFrom(uint64_t a1, uint64_t a2)
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
  SCLPBScheduleSettings *v17;
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
        v17 = objc_alloc_init(SCLPBScheduleSettings);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (SCLPBScheduleSettingsReadFrom((uint64_t)v17, a2) & 1) == 0)
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

uint64_t SCLPBScheduleRecurrenceReadFrom(uint64_t a1, uint64_t a2)
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
  SCLPBTimeInterval *v17;
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
        *(_DWORD *)(a1 + 8) = v20;
      }
      else if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(SCLPBTimeInterval);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || !SCLPBTimeIntervalReadFrom((uint64_t)v17, a2))
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

BOOL SCLPBScheduleRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  v6 = (int *)MEMORY[0x24BE7AF30];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

void sub_21E4C21AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E4C303C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

BOOL SCLPBTimeIntervalReadFrom(uint64_t a1, uint64_t a2)
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
  SCLPBScheduleTime *v17;
  uint64_t v18;

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
      {
        v17 = objc_alloc_init(SCLPBScheduleTime);
        v18 = 8;
      }
      else
      {
        if ((v10 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
          continue;
        }
        v17 = objc_alloc_init(SCLPBScheduleTime);
        v18 = 16;
      }
      objc_storeStrong((id *)(a1 + v18), v17);
      if (!PBReaderPlaceMark() || !SCLPBScheduleTimeReadFrom((uint64_t)v17, a2))
      {

        return 0;
      }
      PBReaderRecallMark();

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id SCLSuppressSchoolModeAssertionXPCServerInterface()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2553EA3C8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_acquireWithExplanation_UUID_completion_, 1, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_acquireWithExplanation_UUID_completion_, 1, 1);

  return v0;
}

void sub_21E4C6CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 200), 8);
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

void sub_21E4C71CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void SCLWatchServerRun()
{
  id v0;

  +[SCLWatchServer sharedWatchServer](SCLWatchServer, "sharedWatchServer");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "run");

}

void sub_21E4C8510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
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

BOOL SCLRepeatScheduleContainsDay(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if ((unint64_t)(a2 - 1) >= 7)
    v2 = 0;
  else
    v2 = (1 << (a2 - 1));
  return (v2 & a1) != 0;
}

uint64_t SCLRepeatScheduleForDay(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 7)
    return 0;
  else
    return (1 << (a1 - 1));
}

uint64_t SCLEnumerateDaysInRepeatSchedule(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t i;

  v3 = result;
  for (i = 1; i != 8; ++i)
  {
    if (((1 << (i - 1)) & v3) != 0)
      result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, i);
  }
  return result;
}

uint64_t SCLGetNextDay(uint64_t a1)
{
  if (a1 == 7)
    return 1;
  else
    return a1 + 1;
}

uint64_t SCLGetPreviousDay(uint64_t a1)
{
  if (a1 == 1)
    return 7;
  else
    return a1 - 1;
}

id NSStringForSCLDay(uint64_t a1)
{
  void *v2;
  void *v3;

  if (NSStringForSCLDay_onceToken != -1)
    dispatch_once(&NSStringForSCLDay_onceToken, &__block_literal_global_10);
  objc_msgSend((id)NSStringForSCLDay_formatter, "weekdaySymbols");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", a1 - 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_21E4C95D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E4C98D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E4C9FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *StringFromSCLInterruptEventType(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("<unknown>");
  else
    return off_24E29C168[a1];
}

const __CFString *StringFromSCLInterruptEventUrgency(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("<unknown>");
  if (a1 == 1)
    v1 = CFSTR("critical");
  if (a1)
    return v1;
  else
    return CFSTR("default");
}

uint64_t SCLIsNRDeviceEligibleForSchoolTime(void *a1, char a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v11;

  v3 = a1;
  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BE6B348]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) != 0)
    goto LABEL_11;
  objc_msgSend(v3, "pairingID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    scl_pairing_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      SCLIsNRDeviceEligibleForSchoolTime_cold_1((uint64_t)v3, v9);
    goto LABEL_10;
  }
  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BE6B378]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    scl_pairing_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      SCLIsNRDeviceEligibleForSchoolTime_cold_2(v3, v9);
LABEL_10:

LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  if ((a2 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BE6B340]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "BOOLValue");

  }
LABEL_12:

  return v8;
}

id SCLAutoUpdatingPairingID()
{
  _QWORD v1[3];

  v1[2] = *MEMORY[0x24BDAC8D0];
  v1[0] = 0;
  v1[1] = 0;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v1);
}

void sub_21E4CBC50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_21E4CC088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E4CC3AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_21E4CC660(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_21E4CCCF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

BOOL SCLPBScheduleTimeReadFrom(uint64_t a1, uint64_t a2)
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
        *(_BYTE *)(a1 + 16) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
          {
            v24 = &OBJC_IVAR___SCLPBScheduleTime__hour;
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
            v24 = &OBJC_IVAR___SCLPBScheduleTime__hour;
            goto LABEL_41;
          }
        }
        v24 = &OBJC_IVAR___SCLPBScheduleTime__hour;
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
    *(_BYTE *)(a1 + 16) |= 2u;
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
        v24 = &OBJC_IVAR___SCLPBScheduleTime__minute;
        goto LABEL_39;
      }
      v25 += 7;
      v23 = v26++ > 8;
      if (v23)
      {
        LODWORD(v19) = 0;
        v24 = &OBJC_IVAR___SCLPBScheduleTime__minute;
        goto LABEL_41;
      }
    }
    v24 = &OBJC_IVAR___SCLPBScheduleTime__minute;
LABEL_38:
    *(_BYTE *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id SCLEntitlementError(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot set schedule because client is missing the %@ entitlement"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BDD0FC8];
  v7[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.schooltime"), 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id SCLPairingUnavailableError(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No pairing for pairingID %@"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BDD0FC8];
  v7[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.schooltime"), 2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_21E4CE4D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *StringFromSCLContactType(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("unknown");
  if (a1 == 2)
    v1 = CFSTR("phone");
  if (a1 == 1)
    return CFSTR("email");
  else
    return v1;
}

void sub_21E4CF394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E4D0868(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_21E4D1554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_21E4D1AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_21E4D2384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E4D26AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

const __CFString *StringFromSCLInterruptEligibility(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("<unknown>");
  if (a1 == 1)
    v1 = CFSTR("eligible");
  if (a1)
    return v1;
  else
    return CFSTR("none");
}

id SCLSchoolModeClientXPCInterface()
{
  void *WeakRetained;

  os_unfair_lock_lock((os_unfair_lock_t)&SCLSchoolModeClientXPCInterface___lock);
  WeakRetained = objc_loadWeakRetained(&SCLSchoolModeClientXPCInterface___interface);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2553E5080);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_applyServerSettings_, 0, 0);
    objc_storeWeak(&SCLSchoolModeClientXPCInterface___interface, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&SCLSchoolModeClientXPCInterface___lock);
  return WeakRetained;
}

id SCLSchoolModeServerXPCInterface()
{
  void *WeakRetained;
  void *v1;
  uint64_t v2;
  void *v3;

  os_unfair_lock_lock(&SCLSchoolModeServerXPCInterface___lock);
  WeakRetained = objc_loadWeakRetained(&SCLSchoolModeServerXPCInterface___interface);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2553EA628);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_connectWithPairingID_identifier_completion_, 0, 1);
    objc_msgSend(WeakRetained, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_connectWithPairingID_identifier_completion_, 1, 1);
    objc_msgSend(WeakRetained, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_applySchedule_completion_, 0, 0);
    objc_msgSend(WeakRetained, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_applySchedule_completion_, 1, 1);
    objc_msgSend(WeakRetained, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setActive_options_completion_, 1, 1);
    objc_msgSend(WeakRetained, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_addUnlockHistoryItem_completion_, 0, 0);
    objc_msgSend(WeakRetained, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_addUnlockHistoryItem_completion_, 1, 1);
    v1 = (void *)MEMORY[0x24BDBCF20];
    v2 = objc_opt_class();
    objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_fetchRecentUnlockHistoryItemsWithCompletion_, 0, 1);

    objc_msgSend(WeakRetained, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_fetchRecentUnlockHistoryItemsWithCompletion_, 1, 1);
    objc_msgSend(WeakRetained, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_deleteHistoryWithCompletion_, 1, 1);
    objc_storeWeak(&SCLSchoolModeServerXPCInterface___interface, WeakRetained);
  }
  os_unfair_lock_unlock(&SCLSchoolModeServerXPCInterface___lock);
  return WeakRetained;
}

void SCLIsNRDeviceEligibleForSchoolTime_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21E4AD000, a2, OS_LOG_TYPE_ERROR, "Device %@ is missing pairingID", (uint8_t *)&v2, 0xCu);
}

void SCLIsNRDeviceEligibleForSchoolTime_cold_2(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "pairingID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v4;
  v7 = 2112;
  v8 = a1;
  _os_log_error_impl(&dword_21E4AD000, a2, OS_LOG_TYPE_ERROR, "Have pairing id %@ but nil pairing store path. Perhaps device hasn't completed pairing yet? %@", (uint8_t *)&v5, 0x16u);

}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x24BE0BBA0]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x24BE0BBB0]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x24BE4F978]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67140]();
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

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return MEMORY[0x24BDBD028]();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return MEMORY[0x24BDBD070]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD20](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB0](attr);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
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

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x24BDAE008](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x24BDAE010](label);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

uint64_t mach_continuous_approximate_time(void)
{
  return MEMORY[0x24BDAEB40]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x24BDAF420]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x24BDAF428]();
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x24BDAFA10]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x24BEB39E8]();
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

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x24BDB0610](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x24BDB0618](activity);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x24BDB0620](identifier);
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

