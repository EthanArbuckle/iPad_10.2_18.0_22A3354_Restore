BOOL SetupSchemaProvisionalSiriSetupContextReadFrom(void *a1, uint64_t a2)
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
  SetupSchemaProvisionalSiriSetupStep *v18;

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
      {
        v18 = objc_alloc_init(SetupSchemaProvisionalSiriSetupStep);
        if (!PBReaderPlaceMark() || (SetupSchemaProvisionalSiriSetupStepReadFrom(v18, a2) & 1) == 0)
        {
LABEL_35:

          return 0;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setStep:", v18, 0, 0);
        goto LABEL_30;
      }
      if ((_DWORD)v17 == 2)
        break;
      if ((_DWORD)v17 == 1)
      {
        v18 = objc_alloc_init(SetupSchemaProvisionalSiriSetupStarted);
        if (!PBReaderPlaceMark() || (SetupSchemaProvisionalSiriSetupStartedReadFrom(v18, a2) & 1) == 0)
          goto LABEL_35;
        PBReaderRecallMark();
        objc_msgSend(a1, "setStarted:", v18, 0, 0);
LABEL_30:

        goto LABEL_32;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_32:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(SetupSchemaProvisionalSiriSetupEnded);
    if (!PBReaderPlaceMark() || (SetupSchemaProvisionalSiriSetupEndedReadFrom(v18, a2) & 1) == 0)
      goto LABEL_35;
    PBReaderRecallMark();
    objc_msgSend(a1, "setEnded:", v18, 0, 0);
    goto LABEL_30;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SetupSchemaProvisionalSiriSetupStartedReadFrom(void *a1, uint64_t a2)
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
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
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
        objc_msgSend(a1, "setExists:", v19 != 0);
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

uint64_t SetupSchemaProvisionalSiriSetupEndedReadFrom(void *a1, uint64_t a2)
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
      if ((v10 >> 3) == 1)
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
        while (1)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            break;
          v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0)
            goto LABEL_41;
          v23 += 7;
          v14 = v24++ >= 9;
          if (v14)
          {
            v25 = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_43:
        objc_msgSend(a1, "setSiriEnabled:", v25 != 0);
      }
      else if ((v10 >> 3) == 2)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
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
            goto LABEL_37;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_39:
        objc_msgSend(a1, "setDismissed:", v19 != 0);
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

uint64_t SetupSchemaProvisionalSiriSetupStepReadFrom(void *a1, uint64_t a2)
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
  uint64_t v23;
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
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
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
            v23 = 0;
            goto LABEL_32;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        v23 = *(_BYTE *)(a2 + *v5) ? 0 : v19;
LABEL_32:
        objc_msgSend(a1, "setPage:", v23);
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

BOOL SetupSchemaProvisionalSiriSetupEventReadFrom(void *a1, uint64_t a2)
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
  SetupSchemaProvisionalSiriSetupEventMetadata *v17;

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
      if ((v10 >> 3) == 100)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(SetupSchemaProvisionalSiriSetupEventMetadata);
        if (!PBReaderPlaceMark()
          || (SetupSchemaProvisionalSiriSetupEventMetadataReadFrom(v17, a2) & 1) == 0)
        {
          goto LABEL_31;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setEventMetadata:", v17, 0, 0);
LABEL_26:

        goto LABEL_28;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_28:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(SetupSchemaProvisionalSiriSetupContext);
    if (!PBReaderPlaceMark() || !SetupSchemaProvisionalSiriSetupContextReadFrom(v17, a2))
    {
LABEL_31:

      return 0;
    }
    PBReaderRecallMark();
    objc_msgSend(a1, "setSiriSetupContext:", v17, 0, 0);
    goto LABEL_26;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SetupSchemaProvisionalSiriSetupEventMetadataReadFrom(void *a1, uint64_t a2)
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
  id v17;
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
        v17 = objc_alloc_init(MEMORY[0x24BE95C78]);
        if (!PBReaderPlaceMark() || (SISchemaUUIDReadFrom() & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setSetupId:", v17, 0, 0);

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

char *sub_227748094(_BYTE *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  _BYTE *v5;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  _BYTE *v37;
  __int128 *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  char **v49;
  void *v50;
  uint64_t v52;
  uint64_t v53;
  id v54;
  _BYTE *v55;
  objc_super v57;
  _OWORD v58[6];
  _OWORD v59[3];

  *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v10 = &v5[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_presentingViewController];
  *v10 = 0;
  v10[1] = 0;
  v11 = &v5[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_dataSource];
  *v11 = a1;
  v11[1] = a2;
  v12 = &v5[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_dataSourceWriter];
  *v12 = a3;
  v12[1] = a4;
  v5[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_viewStyle] = 0x20100u >> (8
                                                                            * a1[OBJC_IVAR____TtC9SiriSetup8Defaults_enrollmentMode]);
  v13 = v5;
  v55 = a1;
  v54 = a3;
  v14 = (void *)sub_227767744();
  v15 = (void *)objc_opt_self();
  v16 = objc_msgSend(v15, sel_bundleWithIdentifier_, v14);

  v17 = v16;
  if (!v16)
    v17 = objc_msgSend(v15, sel_mainBundle);
  v18 = v16;
  v19 = sub_2277675C4();
  v52 = v20;
  v53 = v19;

  v21 = (void *)sub_227767744();
  v22 = objc_msgSend(v15, sel_bundleWithIdentifier_, v21, 0xE000000000000000);

  v23 = v22;
  if (!v22)
    v23 = objc_msgSend(v15, sel_mainBundle);
  v24 = v22;
  v25 = sub_2277675C4();
  v27 = v26;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F7F18);
  v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_227768C10;
  v29 = (void *)sub_227767744();
  v30 = objc_msgSend(v15, sel_bundleWithIdentifier_, v29, 0xE000000000000000);

  v31 = v30;
  if (!v30)
    v31 = objc_msgSend(v15, sel_mainBundle);
  v32 = v30;
  v33 = sub_2277675C4();
  v35 = v34;

  *(_QWORD *)(v28 + 32) = v33;
  *(_QWORD *)(v28 + 40) = v35;
  v36 = &v13[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_viewModel];
  *(_QWORD *)v36 = v53;
  *((_QWORD *)v36 + 1) = v52;
  *((_QWORD *)v36 + 2) = v25;
  *((_QWORD *)v36 + 3) = v27;
  *((_QWORD *)v36 + 4) = v28;
  *(_OWORD *)(v36 + 40) = 0u;
  *(_OWORD *)(v36 + 56) = 0u;
  *(_OWORD *)(v36 + 72) = 0u;
  *(_OWORD *)(v36 + 88) = 0u;
  *(_OWORD *)(v36 + 104) = 0u;
  v36[120] = 2;
  *(_QWORD *)&v13[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_page] = a5;
  swift_retain();

  v57.receiver = v13;
  v57.super_class = (Class)type metadata accessor for EducationPresenter();
  v37 = objc_msgSendSuper2(&v57, sel_init, 0xE000000000000000);
  v38 = (__int128 *)&v37[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_viewModel];
  LOBYTE(v32) = v37[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_viewStyle];
  swift_beginAccess();
  v39 = *v38;
  v40 = v38[1];
  v41 = v38[3];
  v58[2] = v38[2];
  v58[3] = v41;
  v58[0] = v39;
  v58[1] = v40;
  v42 = v38[4];
  v43 = v38[5];
  v44 = v38[6];
  *(_OWORD *)((char *)v59 + 9) = *(__int128 *)((char *)v38 + 105);
  v59[0] = v44;
  v58[4] = v42;
  v58[5] = v43;
  v45 = v37;
  sub_227748948((uint64_t)v58);
  v46 = sub_2277484F4((char)v32, (uint64_t)v58);
  v48 = v47;

  swift_release();
  sub_227748A14((uint64_t)v58);
  v49 = (char **)&v45[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_presentingViewController];
  v50 = *(void **)&v45[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_presentingViewController];
  *v49 = v46;
  v49[1] = v48;

  return v45;
}

char *sub_2277484F4(char a1, uint64_t a2)
{
  uint64_t v2;
  os_log_type_t v3;
  char *v4;

  if (a1)
  {
    sub_2277678D0();
    sub_227767774();
    sub_227767900();
    sub_227767774();
    if (qword_2558F7DD0 != -1)
      swift_once();
    v2 = sub_227767678();
    __swift_project_value_buffer(v2, (uint64_t)qword_2558F8E48);
    v3 = sub_2277677E0();
    sub_227764D70(v3, 0xD000000000000030, 0x8000000227769D20, 0, 0xE000000000000000);
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    objc_allocWithZone((Class)type metadata accessor for EducationWelcomeController());
    sub_227748948(a2);
    v4 = (char *)sub_227755DE0(a2);
    *(_QWORD *)&v4[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_delegate + 8] = &off_24EFD0020;
    swift_unknownObjectWeakAssign();
  }
  return v4;
}

id sub_2277486B8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EducationPresenter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for EducationPresenter()
{
  return objc_opt_self();
}

void type metadata accessor for CGColor(uint64_t a1)
{
  sub_227748B0C(a1, &qword_2558F7F00);
}

void type metadata accessor for AFBoolean(uint64_t a1)
{
  sub_227748B0C(a1, &qword_2558F7F08);
}

void type metadata accessor for AFSiriDataSharingOptInStatus(uint64_t a1)
{
  sub_227748B0C(a1, &qword_2558F7F10);
}

double sub_2277487F4@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  __int128 *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[2];

  v3 = (__int128 *)(v1 + OBJC_IVAR____TtC9SiriSetup18EducationPresenter_viewModel);
  swift_beginAccess();
  v4 = v3[5];
  v15 = v3[4];
  v16 = v4;
  v17[0] = v3[6];
  *(_OWORD *)((char *)v17 + 9) = *(__int128 *)((char *)v3 + 105);
  v5 = v3[1];
  v11 = *v3;
  v12 = v5;
  v6 = v3[3];
  v13 = v3[2];
  v14 = v6;
  sub_227748948((uint64_t)&v11);
  v7 = v16;
  a1[4] = v15;
  a1[5] = v7;
  a1[6] = v17[0];
  *(_OWORD *)((char *)a1 + 105) = *(_OWORD *)((char *)v17 + 9);
  v8 = v12;
  *a1 = v11;
  a1[1] = v8;
  result = *(double *)&v13;
  v10 = v14;
  a1[2] = v13;
  a1[3] = v10;
  return result;
}

uint64_t (*sub_22774889C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void *sub_2277488E4()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup18EducationPresenter_presentingViewController);
  v2 = v1;
  return v1;
}

BOOL sub_227748918(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void sub_22774892C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_227748938@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_227748948(uint64_t a1)
{
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2277489F0(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_227748A14(uint64_t a1)
{
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E29CC1C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void type metadata accessor for SRSTrainingManagerSessionStatus(uint64_t a1)
{
  sub_227748B0C(a1, &qword_2558F7F20);
}

void type metadata accessor for CGImage(uint64_t a1)
{
  sub_227748B0C(a1, &qword_2558F7F28);
}

void sub_227748B0C(uint64_t a1, unint64_t *a2)
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

id SiriSetupCoordinator.__allocating_init(enrollmentMode:navigationController:delegate:)(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return SiriSetupCoordinator.init(enrollmentMode:navigationController:delegate:)(a1, a2, a3, a4);
}

id SiriSetupCoordinator.init(enrollmentMode:navigationController:delegate:)(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  char v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  os_log_type_t v13;
  id v14;
  id v15;
  char *v16;
  char **v17;
  objc_class *v18;
  _BYTE *v19;
  char **v20;
  char *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  char *v28;
  objc_class *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(id, _UNKNOWN **, uint64_t, uint64_t);
  id v35;
  _QWORD v37[3];
  objc_super v38;
  objc_super v39;
  uint64_t v40;
  uint64_t v41;

  v8 = *a1;
  v9 = &v4[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_delegate];
  *(_QWORD *)&v4[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v10 = &v4[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  v37[0] = 0;
  v37[1] = 0xE000000000000000;
  v11 = v4;
  sub_2277678D0();
  sub_227767774();
  sub_227767900();
  sub_227767774();
  v40 = a3;
  v41 = a4;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F7FA0);
  sub_22776775C();
  sub_227767774();
  swift_bridgeObjectRelease();
  if (qword_2558F7DD0 != -1)
    swift_once();
  v12 = sub_227767678();
  __swift_project_value_buffer(v12, (uint64_t)qword_2558F8E48);
  v13 = sub_2277677EC();
  sub_227764D70(v13, 0xD000000000000033, 0x8000000227769E00, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  *((_QWORD *)v9 + 1) = a4;
  swift_unknownObjectWeakAssign();
  *(_QWORD *)&v11[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_navigationController] = a2;
  LOBYTE(v37[0]) = v8;
  v14 = objc_allocWithZone((Class)type metadata accessor for Defaults());
  v15 = a2;
  v16 = sub_227763290((char *)v37);
  v17 = (char **)&v11[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource];
  *v17 = v16;
  v17[1] = (char *)&off_24EFD1080;
  v18 = (objc_class *)type metadata accessor for Configurator();
  v19 = objc_allocWithZone(v18);
  v19[OBJC_IVAR____TtC9SiriSetup12Configurator_enrollmentMode] = v8;
  v20 = (char **)&v19[OBJC_IVAR____TtC9SiriSetup12Configurator_dataSource];
  *v20 = v16;
  v20[1] = (char *)&off_24EFD1080;
  v39.receiver = v19;
  v39.super_class = v18;
  v21 = v16;
  v22 = objc_msgSendSuper2(&v39, sel_init);
  *(_QWORD *)&v11[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_configurator] = v22;
  LOBYTE(v37[0]) = v8;
  v23 = v22;
  v24 = sub_22774B9C4();

  *(_QWORD *)&v11[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_pages] = v24;
  v11[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_navigationStyle] = 0x10200u >> (8
                                                                                     * v21[OBJC_IVAR____TtC9SiriSetup8Defaults_enrollmentMode]);
  v25 = type metadata accessor for SetupPageListHandler();
  swift_allocObject();
  v26 = swift_bridgeObjectRetain();
  v27 = sub_22775EB34(v26);
  v28 = &v11[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_pageListHandler];
  *((_QWORD *)v28 + 3) = v25;
  *((_QWORD *)v28 + 4) = &off_24EFD0E90;
  *(_QWORD *)v28 = v27;

  v29 = (objc_class *)type metadata accessor for SiriSetupCoordinator();
  v38.receiver = v11;
  v38.super_class = v29;
  v30 = objc_msgSendSuper2(&v38, sel_init);
  v31 = (uint64_t)v30 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_pageListHandler;
  swift_beginAccess();
  v32 = *(_QWORD *)(v31 + 24);
  v33 = *(_QWORD *)(v31 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v31, v32);
  v34 = *(void (**)(id, _UNKNOWN **, uint64_t, uint64_t))(v33 + 16);
  v35 = v30;
  v34(v30, &off_24EFD0140, v32, v33);
  swift_endAccess();

  swift_unknownObjectRelease();
  return v35;
}

uint64_t sub_227748F54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  _QWORD v5[5];

  sub_227754390();
  v1 = v0 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_pageListHandler;
  swift_beginAccess();
  sub_22774A764(v1, (uint64_t)v5);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource + 8);
  v3 = (char *)*(id *)(v0 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource);
  sub_22775ED24(0, 0, 0, v3, v2);

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

void sub_227748FF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  unsigned __int8 v10;
  uint64_t v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t ObjectType;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[2];

  v1 = v0;
  v2 = OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource;
  v3 = *(char **)(v0 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource);
  v4 = *(_QWORD *)&v3[OBJC_IVAR____TtC9SiriSetup8Defaults_localDataSource];
  v5 = v3;
  sub_22774A14C((uint64_t)v5, v4);

  v6 = *(void **)(v1 + v2);
  v7 = (void *)objc_opt_self();
  v8 = v6;
  v9 = objc_msgSend(v7, sel_sharedPreferences);
  v10 = objc_msgSend(v9, sel_assistantIsEnabled);

  v24[0] = 0;
  v24[1] = 0xE000000000000000;
  sub_2277678D0();
  sub_227767774();
  sub_227767900();
  if (qword_2558F7DD0 != -1)
    swift_once();
  v11 = sub_227767678();
  __swift_project_value_buffer(v11, (uint64_t)qword_2558F8E48);
  v12 = sub_2277677EC();
  sub_227764D70(v12, 0xD000000000000012, 0x800000022776A040, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  v13 = v1 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_delegate;
  if (MEMORY[0x22E29CD18](v1 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_delegate))
  {
    v14 = *(_QWORD *)(v13 + 8);
    ObjectType = swift_getObjectType();
    LOBYTE(v24[0]) = v10;
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(v14 + 8))(v24, ObjectType, v14);
    swift_unknownObjectRelease();
  }
  v16 = *(id *)(v1 + v2);
  v17 = objc_msgSend(v7, sel_sharedPreferences);
  v18 = objc_msgSend(v17, sel_assistantIsEnabled);

  v19 = *(unsigned __int8 *)(*(_QWORD *)(v1 + v2) + OBJC_IVAR____TtC9SiriSetup8Defaults_setupDismissed);
  v20 = objc_msgSend(objc_allocWithZone((Class)SetupSchemaProvisionalSiriSetupContext), sel_init);
  if (v20)
  {
    v21 = v20;
    v22 = objc_msgSend(objc_allocWithZone((Class)SetupSchemaProvisionalSiriSetupEnded), sel_init);
    if (v22)
    {
      v23 = v22;
      objc_msgSend(v22, sel_setSiriEnabled_, v18);
      objc_msgSend(v23, sel_setDismissed_, v19);
      objc_msgSend(v21, sel_setEnded_, v23);
      sub_227754260((uint64_t)v21);

      v21 = v23;
    }

  }
}

id SiriSetupCoordinator.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SiriSetupCoordinator.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SiriSetupCoordinator.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriSetupCoordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2277493E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  os_log_type_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[5];

  v2 = v1;
  sub_2277678D0();
  swift_bridgeObjectRelease();
  v11[0] = 0xD00000000000001FLL;
  v11[1] = 0x8000000227769F50;
  sub_22774B150();
  sub_227767774();
  swift_bridgeObjectRelease();
  if (qword_2558F7DD0 != -1)
    swift_once();
  v4 = sub_227767678();
  __swift_project_value_buffer(v4, (uint64_t)qword_2558F8E48);
  v5 = sub_2277677EC();
  sub_227764D70(v5, 0xD000000000000010, 0x8000000227769F30, 0xD00000000000001FLL, 0x8000000227769F50);
  swift_bridgeObjectRelease();
  v6 = v1 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_pageListHandler;
  swift_beginAccess();
  sub_22774A764(v6, (uint64_t)v11);
  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  v7 = *(void **)(v2 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource);
  v8 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource + 8);
  v9 = v7;
  sub_22775ED24(a1, 2, 1, v9, v8);

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
}

uint64_t sub_227749560(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  os_log_type_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[5];

  v2 = v1;
  sub_2277678D0();
  swift_bridgeObjectRelease();
  v11[0] = 0xD00000000000001BLL;
  v11[1] = 0x8000000227769F10;
  sub_22774B150();
  sub_227767774();
  swift_bridgeObjectRelease();
  if (qword_2558F7DD0 != -1)
    swift_once();
  v4 = sub_227767678();
  __swift_project_value_buffer(v4, (uint64_t)qword_2558F8E48);
  v5 = sub_2277677EC();
  sub_227764D70(v5, 0x2864657070696B73, 0xEE00293A6D6F7266, 0xD00000000000001BLL, 0x8000000227769F10);
  swift_bridgeObjectRelease();
  v6 = v1 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_pageListHandler;
  swift_beginAccess();
  sub_22774A764(v6, (uint64_t)v11);
  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  v7 = *(void **)(v2 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource);
  v8 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource + 8);
  v9 = v7;
  sub_22775ED24(a1, 2, 2, v9, v8);

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
}

void sub_2277496E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  os_log_type_t v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  os_log_type_t v9;

  sub_2277678D0();
  swift_bridgeObjectRelease();
  sub_22774B150();
  sub_227767774();
  swift_bridgeObjectRelease();
  if (qword_2558F7DD0 != -1)
    swift_once();
  v3 = sub_227767678();
  __swift_project_value_buffer(v3, (uint64_t)qword_2558F8E48);
  v4 = sub_2277677EC();
  sub_227764D70(v4, 0xD000000000000010, 0x8000000227769F70, 0xD00000000000001ELL, 0x8000000227769F90);
  swift_bridgeObjectRelease();
  v5 = *(id *)(v1 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource);
  swift_retain();
  v6 = sub_22774B150();
  v8 = v7;
  swift_release();
  v9 = sub_2277677EC();
  sub_227764D70(v9, 0xD00000000000001DLL, 0x8000000227769FB0, v6, v8);
  swift_bridgeObjectRelease();
  sub_227761B4C(a1, (uint64_t)v5);

  sub_227748FF8();
}

void sub_227749870(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t ObjectType;
  uint64_t (*v11)(uint64_t, uint64_t);
  void *v12;
  void *v13;
  id v14;
  os_log_type_t v15;
  id v16;
  uint64_t v17;

  v2 = v1;
  swift_retain();
  v4 = sub_22774B150();
  v6 = v5;
  swift_release();
  if (qword_2558F7DD0 != -1)
    swift_once();
  v7 = sub_227767678();
  __swift_project_value_buffer(v7, (uint64_t)qword_2558F8E48);
  v8 = sub_2277677EC();
  sub_227764D70(v8, 0xD000000000000023, 0x800000022776A1B0, v4, v6);
  swift_bridgeObjectRelease();
  v17 = OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_navigationStyle;
  if (*(_BYTE *)(v2 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_navigationStyle) != 2
    || !*(_QWORD *)(v2 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter)
    || (v9 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter + 8),
        ObjectType = swift_getObjectType(),
        v11 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 80),
        swift_unknownObjectRetain(),
        v12 = (void *)v11(ObjectType, v9),
        swift_unknownObjectRelease(),
        !v12))
  {
LABEL_12:
    swift_beginAccess();
    __asm { BR              X10 }
  }
  v13 = *(void **)(v2 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_navigationController);
  if (*(_BYTE *)(v2 + v17))
  {
    if (*(_BYTE *)(v2 + v17) != 1)
    {
LABEL_11:

      goto LABEL_12;
    }
    v14 = v13;
    v15 = sub_2277677E0();
    sub_227764D70(v15, 0xD000000000000032, 0x800000022776A200, 0xD000000000000031, 0x800000022776A240);
  }
  else
  {
    v16 = v13;
    v14 = objc_msgSend(v16, sel_popViewControllerAnimated_, 1);

  }
  goto LABEL_11;
}

uint64_t type metadata accessor for SiriSetupCoordinator()
{
  return objc_opt_self();
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

_QWORD *sub_22774A040(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558F7F18);
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
    sub_22774A82C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_22774A14C(uint64_t a1, uint64_t a2)
{
  char v4;
  void *v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  unint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  unint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  unint64_t v45;
  unint64_t v46;
  _QWORD *v47;
  unint64_t v48;
  unint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  os_log_type_t v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v4 = *(_BYTE *)(a2 + 16);
  v5 = (void *)objc_opt_self();
  v6 = objc_msgSend(v5, sel_sharedPreferences);
  v7 = objc_msgSend(v6, sel_assistantIsEnabled);

  v8 = sub_22774A91C(v4, v7);
  v10 = v9;
  v54 = v8;
  v11 = sub_22774A91C(*(_BYTE *)(a2 + 17), (int)objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC9SiriSetup8Defaults_voiceTriggerPrefs), sel_voiceTriggerEnabled));
  v13 = v12;
  v55 = v11;
  v14 = sub_22774A91C(*(_BYTE *)(a2 + 18), 0);
  v16 = v15;
  v56 = v14;
  v57 = v14;
  v58 = v15;
  v17 = *(void **)(a2 + 24);
  v18 = v17;
  v19 = objc_msgSend(v5, (SEL)&stru_24EFD5468.size + 1);
  v20 = objc_msgSend(v19, sel_outputVoice);

  v21 = sub_22774AA9C(v17, v20);
  v23 = v22;

  v59 = v21;
  v60 = v23;
  v25 = *(_QWORD *)(a2 + 32);
  v24 = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  v26 = objc_msgSend(v5, (SEL)&stru_24EFD5468.size + 1);
  v27 = objc_msgSend(v26, sel_languageCode);

  if (v27)
  {
    v28 = sub_227767750();
    v30 = v29;

  }
  else
  {
    v28 = 0;
    v30 = 0;
  }
  v31 = sub_22774AC7C(v25, v24, v28, v30);
  v33 = v32;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v61 = v31;
  v34 = v56;
  if (!v10)
  {
    v35 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (!v13)
      goto LABEL_15;
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  v35 = sub_22774A040(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v37 = v35[2];
  v36 = v35[3];
  if (v37 >= v36 >> 1)
    v35 = sub_22774A040((_QWORD *)(v36 > 1), v37 + 1, 1, v35);
  v35[2] = v37 + 1;
  v38 = &v35[2 * v37];
  v38[4] = v54;
  v38[5] = v10;
  if (v13)
  {
LABEL_10:
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v35 = sub_22774A040(0, v35[2] + 1, 1, v35);
    v40 = v35[2];
    v39 = v35[3];
    if (v40 >= v39 >> 1)
      v35 = sub_22774A040((_QWORD *)(v39 > 1), v40 + 1, 1, v35);
    v35[2] = v40 + 1;
    v41 = &v35[2 * v40];
    v41[4] = v55;
    v41[5] = v13;
    v34 = v57;
    v16 = v58;
  }
LABEL_15:
  if (v16)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v35 = sub_22774A040(0, v35[2] + 1, 1, v35);
    v43 = v35[2];
    v42 = v35[3];
    if (v43 >= v42 >> 1)
      v35 = sub_22774A040((_QWORD *)(v42 > 1), v43 + 1, 1, v35);
    v35[2] = v43 + 1;
    v44 = &v35[2 * v43];
    v44[4] = v34;
    v44[5] = v16;
  }
  if (v60)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v35 = sub_22774A040(0, v35[2] + 1, 1, v35);
    v46 = v35[2];
    v45 = v35[3];
    if (v46 >= v45 >> 1)
      v35 = sub_22774A040((_QWORD *)(v45 > 1), v46 + 1, 1, v35);
    v35[2] = v46 + 1;
    v47 = &v35[2 * v46];
    v47[4] = v59;
    v47[5] = v60;
  }
  if (v33)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v35 = sub_22774A040(0, v35[2] + 1, 1, v35);
    v49 = v35[2];
    v48 = v35[3];
    if (v49 >= v48 >> 1)
      v35 = sub_22774A040((_QWORD *)(v48 > 1), v49 + 1, 1, v35);
    v35[2] = v49 + 1;
    v50 = &v35[2 * v49];
    v50[4] = v61;
    v50[5] = v33;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8000);
  swift_arrayDestroy();
  if (v35[2])
  {
    sub_2277678D0();
    sub_227767774();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8008);
    sub_22774AF94();
    sub_227767738();
    swift_bridgeObjectRelease();
    sub_227767774();
    swift_bridgeObjectRelease();
    if (qword_2558F7DD0 != -1)
      swift_once();
    v51 = sub_227767678();
    __swift_project_value_buffer(v51, (uint64_t)qword_2558F8E48);
    v52 = sub_2277677E0();
    sub_227764D70(v52, 0x6F28796669726576, 0xEE00293A72656874, 0, 0xE000000000000000);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_22774A764(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t dispatch thunk of SiriSetupCoordinatorDelegate.trainingFinished(enrollmentResult:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of SiriSetupCoordinatorDelegate.enrollmentContinued(nextPageType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t method lookup function for SiriSetupCoordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriSetupCoordinator.__allocating_init(enrollmentMode:navigationController:delegate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 336))();
}

uint64_t dispatch thunk of SiriSetupCoordinator.startEnrollment()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t sub_22774A82C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_227767954();
  __break(1u);
  return result;
}

uint64_t sub_22774A91C(char a1, int a2)
{
  uint64_t result;
  _BOOL4 v4;
  uint64_t v5;
  __int128 v6;

  if (a1 == 2)
    return 0;
  v4 = (a1 & 1) == 0;
  sub_22776799C();
  objc_opt_self();
  v5 = swift_dynamicCastObjCClass();
  swift_unknownObjectRelease();
  result = 0;
  if (!v5 && ((v4 ^ a2) & 1) == 0)
  {
    BYTE8(v6) = 0;
    sub_2277678D0();
    sub_227767774();
    sub_227767774();
    sub_227767900();
    sub_227767774();
    *(_QWORD *)&v6 = a2 & 1;
    sub_227767900();
    return *(_QWORD *)((char *)&v6 + 1);
  }
  return result;
}

uint64_t sub_22774AA9C(void *a1, void *a2)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  char v9;

  if (a1 == (void *)1)
    return 0;
  v5 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8018);
  sub_22776799C();
  objc_opt_self();
  v6 = swift_dynamicCastObjCClass();
  swift_unknownObjectRelease();
  if (v6)
    goto LABEL_4;
  if (a1)
  {
    if (a2)
    {
      sub_22774B04C();
      sub_22774B088(a1);
      v8 = a2;
      v9 = sub_227767864();

      sub_22774B03C(a1);
      if ((v9 & 1) != 0)
      {
LABEL_4:
        v7 = a1;
LABEL_5:
        sub_22774B03C(v7);
        return 0;
      }
    }
  }
  else if (!a2)
  {
    v7 = 0;
    goto LABEL_5;
  }
  sub_2277678D0();
  sub_227767774();
  sub_227767774();
  sub_227767900();
  sub_227767774();
  sub_227767900();
  sub_22774B03C(a1);
  return 0;
}

uint64_t sub_22774AC7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a2 == 1)
    return 0;
  swift_bridgeObjectRetain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8000);
  sub_22776799C();
  objc_opt_self();
  v9 = swift_dynamicCastObjCClass();
  swift_unknownObjectRelease();
  if (v9)
    goto LABEL_4;
  if (a2)
  {
    if (a4 && (a1 == a3 && a2 == a4 || (sub_227767990() & 1) != 0))
    {
LABEL_4:
      v10 = a1;
      v11 = a2;
LABEL_5:
      sub_22774B028(v10, v11);
      return 0;
    }
  }
  else if (!a4)
  {
    v10 = a1;
    v11 = 0;
    goto LABEL_5;
  }
  sub_2277678D0();
  sub_227767774();
  sub_227767774();
  sub_227767900();
  sub_227767774();
  sub_227767900();
  sub_22774B028(a1, a2);
  return 0;
}

void sub_22774AE64()
{
  uint64_t v0;
  os_log_type_t v1;
  os_log_type_t v2;

  sub_2277678D0();
  swift_bridgeObjectRelease();
  sub_22774B150();
  sub_227767774();
  swift_bridgeObjectRelease();
  if (qword_2558F7DD0 != -1)
    swift_once();
  v0 = sub_227767678();
  __swift_project_value_buffer(v0, (uint64_t)qword_2558F8E48);
  v1 = sub_2277677EC();
  sub_227764D70(v1, 0x6F7266286B636162, 0xEB00000000293A6DLL, 0xD000000000000013, 0x8000000227769FD0);
  swift_bridgeObjectRelease();
  v2 = sub_2277677E0();
  sub_227764D70(v2, 0xD000000000000010, 0x8000000227769FF0, 0xD000000000000023, 0x800000022776A010);
}

unint64_t sub_22774AF94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2558F8010;
  if (!qword_2558F8010)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558F8008);
    result = MEMORY[0x22E29CC34](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_2558F8010);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E29CC28](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_22774B028(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
    return swift_bridgeObjectRelease();
  return result;
}

void sub_22774B03C(id a1)
{
  if (a1 != (id)1)

}

unint64_t sub_22774B04C()
{
  unint64_t result;

  result = qword_2558F8020;
  if (!qword_2558F8020)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2558F8020);
  }
  return result;
}

id sub_22774B088(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

uint64_t sub_22774B098@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *a1 = *(_BYTE *)(v1 + 16);
  return result;
}

uint64_t sub_22774B0D8(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = swift_beginAccess();
  *(_BYTE *)(v1 + 16) = v2;
  return result;
}

uint64_t (*sub_22774B114())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_22774B150()
{
  sub_2277678D0();
  sub_227767774();
  swift_beginAccess();
  sub_227767900();
  sub_227767774();
  sub_227767774();
  swift_bridgeObjectRelease();
  sub_227767774();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8028);
  sub_22776775C();
  sub_227767774();
  swift_bridgeObjectRelease();
  sub_227767774();
  return 0;
}

uint64_t static SetupPage.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24) && *(_QWORD *)(a1 + 32) == *(_QWORD *)(a2 + 32))
    return 1;
  else
    return sub_227767990();
}

uint64_t sub_22774B300()
{
  swift_bridgeObjectRetain();
  sub_227767768();
  return swift_bridgeObjectRelease();
}

uint64_t SetupPage.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_weakDestroy();
  v1 = *(_QWORD *)(v0 + 48);
  *(_QWORD *)(v0 + 48) = 0;
  if (v1)
  {
    do
    {
      if (!swift_isUniquelyReferenced_native())
        break;
      v2 = *(_QWORD *)(v1 + 48);
      swift_retain();
      swift_release();
      v1 = v2;
    }
    while (v2);
  }
  swift_release();
  return v0;
}

uint64_t SetupPage.__deallocating_deinit()
{
  SetupPage.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_22774B3D4()
{
  sub_2277679B4();
  swift_bridgeObjectRetain();
  sub_227767768();
  swift_bridgeObjectRelease();
  return sub_2277679CC();
}

uint64_t sub_22774B42C()
{
  return sub_22774B150();
}

uint64_t sub_22774B44C()
{
  sub_2277679B4();
  swift_bridgeObjectRetain();
  sub_227767768();
  swift_bridgeObjectRelease();
  return sub_2277679CC();
}

uint64_t sub_22774B4A8()
{
  swift_bridgeObjectRetain();
  sub_227767768();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22774B4F0()
{
  sub_2277679B4();
  swift_bridgeObjectRetain();
  sub_227767768();
  swift_bridgeObjectRelease();
  return sub_2277679CC();
}

uint64_t sub_22774B548(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(*(_QWORD *)a1 + 24) == *(_QWORD *)(*(_QWORD *)a2 + 24)
    && *(_QWORD *)(*(_QWORD *)a1 + 32) == *(_QWORD *)(*(_QWORD *)a2 + 32))
  {
    return 1;
  }
  else
  {
    return sub_227767990();
  }
}

BOOL static PageType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PageType.hash(into:)()
{
  return sub_2277679C0();
}

uint64_t PageType.hashValue.getter()
{
  sub_2277679B4();
  sub_2277679C0();
  return sub_2277679CC();
}

BOOL sub_22774B5F4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22774B60C()
{
  return sub_2277679C0();
}

unint64_t sub_22774B63C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2558F8030;
  if (!qword_2558F8030)
  {
    v1 = type metadata accessor for SetupPage();
    result = MEMORY[0x22E29CC34](&protocol conformance descriptor for SetupPage, v1);
    atomic_store(result, (unint64_t *)&qword_2558F8030);
  }
  return result;
}

uint64_t type metadata accessor for SetupPage()
{
  return objc_opt_self();
}

unint64_t sub_22774B6A4()
{
  unint64_t result;

  result = qword_2558F8038;
  if (!qword_2558F8038)
  {
    result = MEMORY[0x22E29CC34](&protocol conformance descriptor for PageType, &type metadata for PageType);
    atomic_store(result, (unint64_t *)&qword_2558F8038);
  }
  return result;
}

uint64_t sub_22774B6E8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 16);
  return result;
}

uint64_t sub_22774B72C(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_BYTE *)(v3 + 16) = v2;
  return result;
}

uint64_t method lookup function for SetupPage()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SetupPage.pageType.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of SetupPage.pageType.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of SetupPage.pageType.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of SetupPage.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of SetupPage.hash(into:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of SetupPage.hashValue.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PageType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PageType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22774B8AC + 4 * byte_227768E2D[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_22774B8E0 + 4 * byte_227768E28[v4]))();
}

uint64_t sub_22774B8E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22774B8E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22774B8F0);
  return result;
}

uint64_t sub_22774B8FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22774B904);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_22774B908(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22774B910(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22774B91C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22774B928(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PageType()
{
  return &type metadata for PageType;
}

uint64_t sub_22774B940()
{
  sub_2277679B4();
  sub_2277679C0();
  return sub_2277679CC();
}

uint64_t sub_22774B984()
{
  sub_2277679B4();
  sub_2277679C0();
  return sub_2277679CC();
}

uint64_t sub_22774B9C4()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  os_log_type_t v95;
  uint64_t v97;

  v97 = MEMORY[0x24BEE4AF8];
  if (*(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SiriSetup12Configurator_enrollmentMode) - 1 >= 2)
  {
    if (*(_BYTE *)(v0 + OBJC_IVAR____TtC9SiriSetup12Configurator_enrollmentMode))
    {
      type metadata accessor for SetupPage();
      v78 = swift_allocObject();
      v79 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
      v80 = objc_msgSend(v79, sel_UUIDString);

      v81 = sub_227767750();
      v83 = v82;

      *(_QWORD *)(v78 + 24) = v81;
      *(_QWORD *)(v78 + 32) = v83;
      *(_QWORD *)(v78 + 48) = 0;
      swift_weakInit();
      *(_BYTE *)(v78 + 16) = 5;
      *(_BYTE *)(v78 + 40) = 0;
      *(_QWORD *)(v78 + 48) = 0;
      swift_release();
      swift_weakAssign();
      v84 = swift_retain();
      MEMORY[0x22E29C538](v84);
      if (*(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2277677C8();
      sub_2277677D4();
      sub_2277677BC();
      v85 = swift_allocObject();
      v86 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
      v87 = objc_msgSend(v86, sel_UUIDString);

      v88 = sub_227767750();
      v90 = v89;

      *(_QWORD *)(v85 + 24) = v88;
      *(_QWORD *)(v85 + 32) = v90;
      *(_QWORD *)(v85 + 48) = 0;
      swift_weakInit();
      *(_BYTE *)(v85 + 16) = 6;
      *(_BYTE *)(v85 + 40) = 1;
      *(_QWORD *)(v85 + 48) = 0;
      swift_release();
      swift_weakAssign();
      v91 = swift_retain();
      MEMORY[0x22E29C538](v91);
      if (*(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2277677C8();
      sub_2277677D4();
      sub_2277677BC();
      swift_release();
      swift_release();
    }
    else
    {
      type metadata accessor for SetupPage();
      v28 = swift_allocObject();
      v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
      v30 = objc_msgSend(v29, sel_UUIDString);

      v31 = sub_227767750();
      v33 = v32;

      *(_QWORD *)(v28 + 24) = v31;
      *(_QWORD *)(v28 + 32) = v33;
      *(_QWORD *)(v28 + 48) = 0;
      swift_weakInit();
      *(_BYTE *)(v28 + 16) = 4;
      *(_BYTE *)(v28 + 40) = 1;
      *(_QWORD *)(v28 + 48) = 0;
      swift_release();
      swift_weakAssign();
      v34 = swift_allocObject();
      v35 = objc_allocWithZone(MEMORY[0x24BDD1880]);
      swift_retain();
      v36 = objc_msgSend(v35, sel_init);
      v37 = objc_msgSend(v36, sel_UUIDString);

      v38 = sub_227767750();
      v40 = v39;

      *(_QWORD *)(v34 + 24) = v38;
      *(_QWORD *)(v34 + 32) = v40;
      *(_QWORD *)(v34 + 48) = 0;
      swift_weakInit();
      *(_BYTE *)(v34 + 16) = 1;
      *(_BYTE *)(v34 + 40) = 1;
      *(_QWORD *)(v34 + 48) = 0;
      swift_release();
      swift_weakAssign();
      swift_release();
      v41 = swift_allocObject();
      v42 = objc_allocWithZone(MEMORY[0x24BDD1880]);
      swift_retain();
      v43 = objc_msgSend(v42, sel_init);
      v44 = objc_msgSend(v43, sel_UUIDString);

      v45 = sub_227767750();
      v47 = v46;

      *(_QWORD *)(v41 + 24) = v45;
      *(_QWORD *)(v41 + 32) = v47;
      *(_QWORD *)(v41 + 48) = 0;
      swift_weakInit();
      *(_BYTE *)(v41 + 16) = 0;
      *(_BYTE *)(v41 + 40) = 0;
      *(_QWORD *)(v41 + 48) = 0;
      swift_release();
      swift_weakAssign();
      swift_release();
      v48 = swift_retain();
      MEMORY[0x22E29C538](v48);
      if (*(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2277677C8();
      sub_2277677D4();
      sub_2277677BC();
      v49 = swift_retain();
      MEMORY[0x22E29C538](v49);
      if (*(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2277677C8();
      sub_2277677D4();
      sub_2277677BC();
      v50 = swift_retain();
      MEMORY[0x22E29C538](v50);
      if (*(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2277677C8();
      sub_2277677D4();
      sub_2277677BC();
      v51 = swift_allocObject();
      v52 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
      v53 = objc_msgSend(v52, sel_UUIDString);

      v54 = sub_227767750();
      v56 = v55;

      *(_QWORD *)(v51 + 24) = v54;
      *(_QWORD *)(v51 + 32) = v56;
      *(_QWORD *)(v51 + 48) = 0;
      swift_weakInit();
      *(_BYTE *)(v51 + 16) = 3;
      *(_BYTE *)(v51 + 40) = 0;
      *(_QWORD *)(v51 + 48) = 0;
      swift_release();
      swift_weakAssign();
      v57 = swift_allocObject();
      v58 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
      v59 = objc_msgSend(v58, (SEL)&stru_24EFD51D0.name + 7);

      v60 = sub_227767750();
      v62 = v61;

      *(_QWORD *)(v57 + 24) = v60;
      *(_QWORD *)(v57 + 32) = v62;
      *(_QWORD *)(v57 + 48) = 0;
      swift_weakInit();
      *(_BYTE *)(v57 + 16) = 2;
      *(_BYTE *)(v57 + 40) = 1;
      *(_QWORD *)(v57 + 48) = v51;
      swift_release();
      swift_weakAssign();
      v63 = swift_retain();
      MEMORY[0x22E29C538](v63);
      if (*(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2277677C8();
      sub_2277677D4();
      sub_2277677BC();
      v64 = swift_allocObject();
      v65 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
      v66 = objc_msgSend(v65, sel_UUIDString);

      v67 = sub_227767750();
      v69 = v68;

      *(_QWORD *)(v64 + 24) = v67;
      *(_QWORD *)(v64 + 32) = v69;
      *(_QWORD *)(v64 + 48) = 0;
      swift_weakInit();
      *(_BYTE *)(v64 + 16) = 5;
      *(_BYTE *)(v64 + 40) = 0;
      *(_QWORD *)(v64 + 48) = 0;
      swift_release();
      swift_weakAssign();
      v70 = swift_retain();
      MEMORY[0x22E29C538](v70);
      if (*(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2277677C8();
      sub_2277677D4();
      sub_2277677BC();
      v71 = swift_allocObject();
      v72 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
      v73 = objc_msgSend(v72, sel_UUIDString);

      v74 = sub_227767750();
      v76 = v75;

      *(_QWORD *)(v71 + 24) = v74;
      *(_QWORD *)(v71 + 32) = v76;
      *(_QWORD *)(v71 + 48) = 0;
      swift_weakInit();
      *(_BYTE *)(v71 + 16) = 6;
      *(_BYTE *)(v71 + 40) = 1;
      *(_QWORD *)(v71 + 48) = 0;
      swift_release();
      swift_weakAssign();
      v77 = swift_retain();
      MEMORY[0x22E29C538](v77);
      if (*(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2277677C8();
      sub_2277677D4();
      sub_2277677BC();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
  }
  else
  {
    type metadata accessor for SetupPage();
    v1 = swift_allocObject();
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
    v3 = objc_msgSend(v2, sel_UUIDString);

    v4 = sub_227767750();
    v6 = v5;

    *(_QWORD *)(v1 + 24) = v4;
    *(_QWORD *)(v1 + 32) = v6;
    *(_QWORD *)(v1 + 48) = 0;
    swift_weakInit();
    *(_BYTE *)(v1 + 16) = 0;
    *(_BYTE *)(v1 + 40) = 0;
    *(_QWORD *)(v1 + 48) = 0;
    swift_release();
    v7 = swift_weakAssign();
    MEMORY[0x22E29C538](v7);
    if (*(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_2277677C8();
    sub_2277677D4();
    sub_2277677BC();
    v8 = swift_allocObject();
    v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
    v10 = objc_msgSend(v9, sel_UUIDString);

    v11 = sub_227767750();
    v13 = v12;

    *(_QWORD *)(v8 + 24) = v11;
    *(_QWORD *)(v8 + 32) = v13;
    *(_QWORD *)(v8 + 48) = 0;
    swift_weakInit();
    *(_BYTE *)(v8 + 16) = 3;
    *(_BYTE *)(v8 + 40) = 0;
    *(_QWORD *)(v8 + 48) = 0;
    swift_release();
    swift_weakAssign();
    v14 = swift_allocObject();
    v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
    v16 = objc_msgSend(v15, sel_UUIDString);

    v17 = sub_227767750();
    v19 = v18;

    *(_QWORD *)(v14 + 24) = v17;
    *(_QWORD *)(v14 + 32) = v19;
    *(_QWORD *)(v14 + 48) = 0;
    swift_weakInit();
    *(_BYTE *)(v14 + 16) = 2;
    *(_BYTE *)(v14 + 40) = 1;
    *(_QWORD *)(v14 + 48) = v8;
    swift_release();
    v20 = swift_weakAssign();
    MEMORY[0x22E29C538](v20);
    if (*(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_2277677C8();
    sub_2277677D4();
    sub_2277677BC();
    v21 = swift_allocObject();
    v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
    v23 = objc_msgSend(v22, sel_UUIDString);

    v24 = sub_227767750();
    v26 = v25;

    *(_QWORD *)(v21 + 24) = v24;
    *(_QWORD *)(v21 + 32) = v26;
    *(_QWORD *)(v21 + 48) = 0;
    swift_weakInit();
    *(_BYTE *)(v21 + 16) = 6;
    *(_BYTE *)(v21 + 40) = 1;
    *(_QWORD *)(v21 + 48) = 0;
    swift_release();
    v27 = swift_weakAssign();
    MEMORY[0x22E29C538](v27);
    if (*(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_2277677C8();
    sub_2277677D4();
    sub_2277677BC();
  }
  sub_2277678D0();
  sub_227767774();
  sub_227767900();
  sub_227767774();
  v92 = type metadata accessor for SetupPage();
  v93 = swift_bridgeObjectRetain();
  MEMORY[0x22E29C55C](v93, v92);
  sub_227767774();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_2558F7DD0 != -1)
    swift_once();
  v94 = sub_227767678();
  __swift_project_value_buffer(v94, (uint64_t)qword_2558F8E48);
  v95 = sub_2277677EC();
  sub_227764D70(v95, 0xD000000000000013, 0x800000022776A390, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  return v97;
}

id sub_22774C780()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Configurator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for Configurator()
{
  return objc_opt_self();
}

uint64_t getEnumTagSinglePayload for ViewStyle(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ViewStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22774C8BC + 4 * byte_227768E37[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22774C8F0 + 4 * byte_227768E32[v4]))();
}

uint64_t sub_22774C8F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22774C8F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22774C900);
  return result;
}

uint64_t sub_22774C90C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22774C914);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22774C918(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22774C920(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ViewStyle()
{
  return &type metadata for ViewStyle;
}

unint64_t sub_22774C940()
{
  unint64_t result;

  result = qword_2558F81C8;
  if (!qword_2558F81C8)
  {
    result = MEMORY[0x22E29CC34](&unk_227769000, &type metadata for ViewStyle);
    atomic_store(result, (unint64_t *)&qword_2558F81C8);
  }
  return result;
}

char *sub_22774C98C(char a1)
{
  void *v1;
  id v3;
  _BYTE *v4;
  id v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v3 = objc_allocWithZone(MEMORY[0x24BEA85D8]);
  v4 = v1;
  v5 = objc_msgSend(v3, sel_initWithFrame_, 0.0, 0.0, 198.0, 198.0);
  *(_QWORD *)&v4[OBJC_IVAR____TtC9SiriSetup16OrbContainerView_orbView] = v5;
  type metadata accessor for CheckMarkView();
  *(_QWORD *)&v4[OBJC_IVAR____TtC9SiriSetup16OrbContainerView_checkMark] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v4[OBJC_IVAR____TtC9SiriSetup16OrbContainerView_fitsToSuperView] = a1;

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for OrbContainerView();
  v6 = (char *)objc_msgSendSuper2(&v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v7 = OBJC_IVAR____TtC9SiriSetup16OrbContainerView_checkMark;
  objc_msgSend(*(id *)&v6[OBJC_IVAR____TtC9SiriSetup16OrbContainerView_checkMark], sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v8 = OBJC_IVAR____TtC9SiriSetup16OrbContainerView_orbView;
  objc_msgSend(*(id *)&v6[OBJC_IVAR____TtC9SiriSetup16OrbContainerView_orbView], sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(*(id *)&v6[v8], sel_setMode_, 3);
  objc_msgSend(v6, sel_addSubview_, *(_QWORD *)&v6[v8]);
  objc_msgSend(v6, sel_addSubview_, *(_QWORD *)&v6[v7]);

  return v6;
}

void sub_22774CB40()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v27.receiver = v0;
  v27.super_class = (Class)type metadata accessor for OrbContainerView();
  objc_msgSendSuper2(&v27, sel_updateConstraints);
  if (v0[OBJC_IVAR____TtC9SiriSetup16OrbContainerView_fitsToSuperView] == 1)
  {
    v1 = objc_msgSend(v0, sel_superview);
    if (v1)
    {
      v2 = v1;
      v3 = objc_msgSend(v0, sel_heightAnchor);
      v4 = objc_msgSend(v2, sel_heightAnchor);
      v5 = objc_msgSend(v3, sel_constraintEqualToAnchor_, v4);

      objc_msgSend(v5, sel_setActive_, 1);
      v6 = objc_msgSend(v0, sel_widthAnchor);
      v7 = objc_msgSend(v2, sel_widthAnchor);
      v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

      objc_msgSend(v8, sel_setActive_, 1);
    }
  }
  v9 = OBJC_IVAR____TtC9SiriSetup16OrbContainerView_orbView;
  v10 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC9SiriSetup16OrbContainerView_orbView], sel_heightAnchor);
  v11 = objc_msgSend(v10, sel_constraintEqualToConstant_, 198.0);

  objc_msgSend(v11, sel_setActive_, 1);
  v12 = objc_msgSend(*(id *)&v0[v9], sel_widthAnchor);
  v13 = objc_msgSend(v12, sel_constraintEqualToConstant_, 198.0);

  objc_msgSend(v13, sel_setActive_, 1);
  v14 = objc_msgSend(*(id *)&v0[v9], sel_centerXAnchor);
  v15 = objc_msgSend(v0, sel_centerXAnchor);
  v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v15);

  objc_msgSend(v16, sel_setActive_, 1);
  v17 = objc_msgSend(*(id *)&v0[v9], sel_centerYAnchor);
  v18 = objc_msgSend(v0, sel_centerYAnchor);
  v19 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v18);

  objc_msgSend(v19, sel_setActive_, 1);
  v20 = OBJC_IVAR____TtC9SiriSetup16OrbContainerView_checkMark;
  v21 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC9SiriSetup16OrbContainerView_checkMark], sel_centerXAnchor);
  v22 = objc_msgSend(*(id *)&v0[v9], sel_centerXAnchor);
  v23 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v22);

  objc_msgSend(v23, sel_setActive_, 1);
  v24 = objc_msgSend(*(id *)&v0[v20], sel_centerYAnchor);
  v25 = objc_msgSend(*(id *)&v0[v9], sel_centerYAnchor);
  v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v25);

  objc_msgSend(v26, sel_setActive_, 1);
}

id sub_22774CF84()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OrbContainerView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for OrbContainerView()
{
  return objc_opt_self();
}

char *sub_22774D00C(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_class *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  char *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  char *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  char *result;
  char *v40;
  char *v41;
  id v42;
  char *v43;
  double v44;
  double v45;
  id v46;
  _QWORD v47[4];
  objc_super v48;

  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_orbView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_currentVoiceSelection] = 0;
  v3 = OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceOptionsView;
  v4 = objc_allocWithZone((Class)type metadata accessor for VoiceOptionsView());
  v5 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v4, sel_init);
  *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceSelectionPresenter] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_continueButton] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_primaryButton] = 0;

  v6 = (void *)sub_227767744();
  v7 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v6);

  v8 = (void *)sub_227767744();
  v9 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_withConfiguration_, v8, v7, 0);

  v10 = (void *)sub_227767744();
  if (a1[3])
  {
    swift_bridgeObjectRetain();
    v11 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  v12 = (objc_class *)type metadata accessor for VoiceSelectionWelcomeController();
  v48.receiver = v5;
  v48.super_class = v12;
  v13 = (char *)objc_msgSendSuper2(&v48, sel_initWithTitle_detailText_icon_, v10, v11, v9);

  v14 = a1[12];
  if (v14)
  {
    v15 = a1[11];
    v47[3] = v12;
    v47[0] = v13;
    objc_allocWithZone(MEMORY[0x24BEBD410]);
    swift_bridgeObjectRetain();
    v16 = v13;
    v17 = sub_22774E5D8(v15, v14, 0, v47, (uint64_t)sel_continueTapped);
    v18 = OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_continueButton;
    v19 = *(void **)&v16[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_continueButton];
    *(_QWORD *)&v16[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_continueButton] = v17;

    v20 = objc_msgSend(v16, sel_navigationItem);
    v21 = *(id *)&v16[v18];
    objc_msgSend(v20, sel_setRightBarButtonItem_, v21);

    v22 = *(void **)&v16[v18];
    if (v22)
      objc_msgSend(v22, sel_setEnabled_, 0);
    if (a1[6])
      goto LABEL_8;
  }
  else
  {
    v26 = v13;
    if (a1[6])
    {
LABEL_8:
      swift_bridgeObjectRetain();
      sub_227748A14((uint64_t)a1);
      v23 = objc_msgSend((id)objc_opt_self(), sel_linkButton);
      v24 = (void *)sub_227767744();
      swift_bridgeObjectRelease();
      objc_msgSend(v23, sel_setTitle_forState_, v24, 0);

      objc_msgSend(v23, sel_addTarget_action_forControlEvents_, v13, sel_chooseForMeTapped, 64);
      v25 = objc_msgSend(v13, sel_buttonTray);
      objc_msgSend(v25, sel_addButton_, v23);

      goto LABEL_11;
    }
  }
  sub_227748A14((uint64_t)a1);
LABEL_11:
  v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEA85B8]), sel_init);
  v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEA85F0]), sel_init);
  v29 = OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceOptionsView;
  v30 = *(void **)&v13[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceOptionsView];
  v31 = objc_allocWithZone(MEMORY[0x24BEA85F8]);
  v32 = v13;
  v33 = v28;
  v34 = v30;
  v35 = v27;
  v36 = (void *)sub_227767744();
  swift_bridgeObjectRelease();
  v37 = objc_msgSend(v31, sel_initWithDataManaging_view_delegate_voicePreviewing_recognitionLanguage_, v33, v34, v32, v35, v36);

  v38 = *(void **)&v32[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceSelectionPresenter];
  *(_QWORD *)&v32[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceSelectionPresenter] = v37;

  objc_msgSend(v32, sel_setTableView_, *(_QWORD *)(*(_QWORD *)&v13[v29] + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_tableView));
  result = (char *)objc_msgSend(v32, sel_tableView);
  if (!result)
  {
    __break(1u);
    goto LABEL_16;
  }
  v40 = result;
  objc_msgSend(result, sel_setAlwaysBounceVertical_, 0);

  result = (char *)objc_msgSend(v32, sel_tableView);
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v41 = result;
  v42 = objc_msgSend(result, sel_heightAnchor);

  result = (char *)objc_msgSend(v32, sel_tableView);
  if (result)
  {
    v43 = result;
    objc_msgSend(result, sel_sizeThatFits_, 1.79769313e308, 1.79769313e308);
    v45 = v44;

    v46 = objc_msgSend(v42, sel_constraintEqualToConstant_, v45);
    objc_msgSend(v46, sel_setActive_, 1);

    return v32;
  }
LABEL_17:
  __break(1u);
  return result;
}

void sub_22774D5A0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;

  v1 = OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_currentVoiceSelection;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_currentVoiceSelection))
  {
    objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceSelectionPresenter), sel_stopVoicePreview);
    if (MEMORY[0x22E29CD18](v0 + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_delegate))
    {
      v2 = *(void **)(v0 + v1);
      v3 = v2;
      sub_2277585D4(v2);

      swift_unknownObjectRelease();
    }
  }
}

void sub_22774D664(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

id sub_22774D840()
{
  return sub_22774E4F8(type metadata accessor for VoiceSelectionWelcomeController);
}

uint64_t type metadata accessor for VoiceSelectionWelcomeController()
{
  return objc_opt_self();
}

void *sub_22774D8F4()
{
  _QWORD *v0;
  void *v1;
  id v2;

  v1 = *(void **)(*v0 + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_orbView);
  v2 = v1;
  return v1;
}

uint64_t sub_22774D9E0(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  *(_QWORD *)(a1 + *a4) = a3;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

id sub_22774DA10()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  char *v4;
  void *v5;
  id v6;
  char *v7;
  void *v8;
  void *v9;
  id v10;

  v1 = OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView____lazy_storage___tableViewDataSource;
  v2 = *(void **)&v0[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView____lazy_storage___tableViewDataSource];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView____lazy_storage___tableViewDataSource];
  }
  else
  {
    v4 = v0;
    v5 = *(void **)&v0[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_tableView];
    *(_QWORD *)(swift_allocObject() + 16) = v0;
    objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2558F8408));
    v6 = v5;
    v7 = v0;
    v8 = (void *)sub_2277676E4();
    v9 = *(void **)&v0[v1];
    *(_QWORD *)&v4[v1] = v8;
    v3 = v8;

    v2 = 0;
  }
  v10 = v2;
  return v3;
}

unint64_t sub_22774DAD4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  unint64_t result;
  id v19;
  void *v20;
  id v21;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v29[5];

  v6 = sub_2277676A8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v29[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (void *)sub_227767744();
  v12 = objc_msgSend(a1, sel_dequeueReusableCellWithIdentifier_, v11);

  if (!v12)
  {
    v13 = objc_allocWithZone(MEMORY[0x24BEBD9F8]);
    swift_bridgeObjectRetain();
    v14 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v13, sel_initWithStyle_reuseIdentifier_, 0, v14);

  }
  sub_227767690();
  v15 = *(void **)(a4 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_viewModel);
  if (!v15)
    goto LABEL_12;
  v16 = objc_msgSend(v15, sel_voices);
  sub_22774E908(0, &qword_2558F8400);
  v17 = sub_2277677A4();

  result = sub_227767648();
  if ((v17 & 0xC000000000000001) != 0)
  {
    v19 = (id)MEMORY[0x22E29C694](result, v17);
    goto LABEL_8;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v19 = *(id *)(v17 + 8 * result + 32);
LABEL_8:
    v20 = v19;
    swift_bridgeObjectRelease();
    v21 = objc_msgSend(v20, sel_localizedDisplayName);
    sub_227767750();

    sub_22776769C();
    v29[3] = v6;
    v29[4] = MEMORY[0x24BEBC5F0];
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v29);
    (*(void (**)(uint64_t *, char *, uint64_t))(v7 + 16))(boxed_opaque_existential_1, v10, v6);
    MEMORY[0x22E29C5A4](v29);
    if (objc_msgSend(v20, sel_isCurrentSiriVoice))
      v23 = 3;
    else
      v23 = 0;
    objc_msgSend(v12, sel_setAccessoryType_, v23);
    v24 = v12;
    objc_msgSend(v24, sel_setSemanticContentAttribute_, objc_msgSend(a1, sel_semanticContentAttribute));

LABEL_12:
    v25 = (void *)objc_opt_self();
    v26 = v12;
    v27 = objc_msgSend(v25, sel_secondarySystemBackgroundColor);
    objc_msgSend(v26, sel_setBackgroundColor_, v27);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    return (unint64_t)v26;
  }
  __break(1u);
  return result;
}

char *sub_22774DDC8()
{
  char *v0;
  uint64_t v1;
  id v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t ObjCClassFromMetadata;
  id v19;
  void *v20;
  objc_super v22;

  v1 = OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_tableView;
  v2 = objc_allocWithZone(MEMORY[0x24BEBD9F0]);
  v3 = v0;
  *(_QWORD *)&v0[v1] = objc_msgSend(v2, sel_initWithFrame_style_, 2, 0.0, 0.0, 0.0, 0.0);
  *(_QWORD *)&v3[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_viewModel] = 0;
  v4 = &v3[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_sectionReuseIdentifier];
  strcpy(&v3[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_sectionReuseIdentifier], "voiceSection");
  v4[13] = 0;
  *((_WORD *)v4 + 7) = -5120;
  v5 = &v3[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_cellReuseIdentifier];
  *(_QWORD *)v5 = 0xD000000000000010;
  *((_QWORD *)v5 + 1) = 0x800000022776A7C0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_voiceSelectionViewModelProvider] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_voiceSelectionEventHandler] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView____lazy_storage___tableViewDataSource] = 0;

  v22.receiver = v3;
  v22.super_class = (Class)type metadata accessor for VoiceOptionsView();
  v6 = (char *)objc_msgSendSuper2(&v22, sel_init);
  v7 = OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_tableView;
  v8 = *(void **)&v6[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_tableView];
  v9 = v6;
  objc_msgSend(v8, sel_setDelegate_, v9);
  v10 = v8;
  v11 = sub_22774DA10();
  objc_msgSend(v10, sel_setDataSource_, v11);

  v12 = objc_msgSend(*(id *)&v6[v7], sel_layer);
  objc_msgSend(v12, sel_setCornerRadius_, 8.0);

  v13 = *(void **)&v6[v7];
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v13, sel_setRowHeight_, *MEMORY[0x24BEBE770]);
  v14 = (void *)objc_opt_self();
  v15 = v13;
  v16 = objc_msgSend(v14, sel_systemBackgroundColor);
  objc_msgSend(v15, sel_setBackgroundColor_, v16);

  v17 = *(void **)&v6[v7];
  sub_22774E908(0, (unint64_t *)&unk_2558F8410);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v19 = v17;
  swift_bridgeObjectRetain();
  v20 = (void *)sub_227767744();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_registerClass_forCellReuseIdentifier_, ObjCClassFromMetadata, v20);

  return v9;
}

void sub_22774E134()
{
  uint64_t v0;
  id v1;
  void *v2;

  v1 = *(id *)(v0 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_voiceSelectionViewModelProvider);
  if (v1)
    v1 = objc_msgSend(v1, sel_voiceSelectionViewModel);
  v2 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_viewModel);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_viewModel) = v1;

  sub_22774E1B0();
}

void sub_22774E1B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  char *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558F83F0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2277676D8();
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558F7F18);
  v7 = swift_allocObject();
  v40 = xmmword_227768C10;
  *(_OWORD *)(v7 + 16) = xmmword_227768C10;
  v8 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_sectionReuseIdentifier + 8);
  v37 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_sectionReuseIdentifier);
  *(_QWORD *)(v7 + 32) = v37;
  *(_QWORD *)(v7 + 40) = v8;
  v35 = v8;
  swift_bridgeObjectRetain();
  v38 = v6;
  v39 = v2;
  sub_2277676CC();
  swift_bridgeObjectRelease();
  v9 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_viewModel);
  if (!v9)
    goto LABEL_12;
  v29 = v9;
  v10 = objc_msgSend(v29, sel_voices);
  sub_22774E908(0, &qword_2558F8400);
  v11 = sub_2277677A4();

  v30 = v1;
  v31 = v3;
  if (!(v11 >> 62))
  {
    v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v12)
      goto LABEL_4;
LABEL_11:

    swift_bridgeObjectRelease();
    v3 = v31;
LABEL_12:
    v26 = sub_22774DA10();
    v27 = v38;
    sub_2277676F0();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v27, v39);
    return;
  }
  swift_bridgeObjectRetain();
  v12 = sub_227767924();
  swift_bridgeObjectRelease();
  if (!v12)
    goto LABEL_11;
LABEL_4:
  if (v12 >= 1)
  {
    v13 = 0;
    v32 = v11 & 0xC000000000000001;
    v33 = v12;
    v34 = v11;
    do
    {
      if (v32)
        v14 = (id)MEMORY[0x22E29C694](v13, v11);
      else
        v14 = *(id *)(v11 + 8 * v13 + 32);
      v15 = v14;
      ++v13;
      v16 = swift_allocObject();
      *(_OWORD *)(v16 + 16) = v40;
      v17 = objc_msgSend(v15, sel_localizedDisplayName);
      v18 = sub_227767750();
      v20 = v19;

      *(_QWORD *)(v16 + 32) = v18;
      *(_QWORD *)(v16 + 40) = v20;
      v41 = v37;
      v42 = v35;
      swift_bridgeObjectRetain();
      sub_2277676B4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = v40;
      v22 = objc_msgSend(v15, sel_localizedDisplayName);
      v23 = sub_227767750();
      v25 = v24;

      *(_QWORD *)(v21 + 32) = v23;
      *(_QWORD *)(v21 + 40) = v25;
      sub_2277676C0();

      swift_bridgeObjectRelease();
      v11 = v34;
    }
    while (v33 != v13);
    goto LABEL_11;
  }
  __break(1u);
}

id sub_22774E4EC()
{
  return sub_22774E4F8(type metadata accessor for VoiceOptionsView);
}

id sub_22774E4F8(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for VoiceOptionsView()
{
  return objc_opt_self();
}

id sub_22774E5D8(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  void *v5;
  void *v6;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  uint64_t v19;

  v6 = v5;
  if (!a2)
  {
    v10 = 0;
    v11 = a4[3];
    if (v11)
      goto LABEL_3;
LABEL_5:
    v16 = 0;
    goto LABEL_6;
  }
  v10 = (void *)sub_227767744();
  swift_bridgeObjectRelease();
  v11 = a4[3];
  if (!v11)
    goto LABEL_5;
LABEL_3:
  v12 = __swift_project_boxed_opaque_existential_1(a4, v11);
  v13 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v12, v12);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v13 + 16))(v15);
  v16 = sub_227767984();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a4);
LABEL_6:
  v17 = objc_msgSend(v6, sel_initWithTitle_style_target_action_, v10, a3, v16, a5);

  swift_unknownObjectRelease();
  return v17;
}

uint64_t sub_22774E708()
{
  uint64_t v0;

  return swift_deallocObject();
}

unint64_t sub_22774E72C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_22774DAD4(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void sub_22774E770(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_currentVoiceSelection;
  v3 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_currentVoiceSelection);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_currentVoiceSelection) = a1;
  v4 = a1;

  if (*(_QWORD *)(v1 + v2))
  {
    v5 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_continueButton);
    if (v5)
      objc_msgSend(v5, sel_setEnabled_, 1);
    v6 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_primaryButton);
    if (v6)
      objc_msgSend(v6, sel_setEnabled_, 1);
  }
}

void sub_22774E7F8()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_viewModel);
  if (!v1)
    return;
  v2 = objc_msgSend(v1, sel_voices);
  sub_22774E908(0, &qword_2558F8400);
  v3 = sub_2277677A4();

  v4 = sub_227767648();
  if ((v3 & 0xC000000000000001) != 0)
  {
    v5 = (id)MEMORY[0x22E29C694](v4, v3);
    goto LABEL_6;
  }
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (v4 >= *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_12:
    __break(1u);
    return;
  }
  v5 = *(id *)(v3 + 8 * v4 + 32);
LABEL_6:
  v8 = v5;
  swift_bridgeObjectRelease();
  v6 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_voiceSelectionEventHandler);
  v7 = v8;
  if (v6)
  {
    objc_msgSend(v6, sel_voiceSelectionView_receivedRequestToSelectVoice_, v0);
    v7 = v8;
  }

}

uint64_t sub_22774E908(uint64_t a1, unint64_t *a2)
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

uint64_t sub_22774E9AC()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[2];

  v1 = v0;
  strcpy((char *)v14, "Data Writer ");
  BYTE5(v14[1]) = 0;
  HIWORD(v14[1]) = -5120;
  swift_bridgeObjectRetain();
  sub_227767774();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriEnabled))
  {
    sub_2277678D0();
    swift_bridgeObjectRelease();
    v2 = (id)AFBooleanGetName();
    if (v2)
    {
      v3 = v2;
      sub_227767750();

    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8000);
    sub_22776775C();
    sub_227767774();
    swift_bridgeObjectRelease();
    sub_227767774();
    swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriLanguage + 8))
  {
    swift_bridgeObjectRetain();
    sub_2277678D0();
    swift_bridgeObjectRelease();
    sub_227767774();
    swift_bridgeObjectRelease();
    sub_227767774();
    swift_bridgeObjectRelease();
  }
  v4 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriVoice);
  if (v4)
  {
    v5 = v4;
    sub_2277678D0();
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v5, sel_description);
    sub_227767750();

    sub_227767774();
    swift_bridgeObjectRelease();
    sub_227767774();

    swift_bridgeObjectRelease();
  }
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriDataSharingStatus + 8) & 1) == 0)
  {
    sub_2277678D0();
    sub_227767774();
    type metadata accessor for AFSiriDataSharingOptInStatus(0);
    sub_227767900();
    sub_227767774();
    swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_voiceTriggerEnabled))
  {
    sub_2277678D0();
    swift_bridgeObjectRelease();
    v7 = (id)AFBooleanGetName();
    if (v7)
    {
      v8 = v7;
      sub_227767750();

    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8000);
    sub_22776775C();
    sub_227767774();
    swift_bridgeObjectRelease();
    sub_227767774();
    swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriInCallEnabled))
  {
    sub_2277678D0();
    swift_bridgeObjectRelease();
    v9 = (id)AFBooleanGetName();
    if (v9)
    {
      v10 = v9;
      sub_227767750();

    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8000);
    sub_22776775C();
    sub_227767774();
    swift_bridgeObjectRelease();
    sub_227767774();
    swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_setupDismissed))
  {
    sub_2277678D0();
    swift_bridgeObjectRelease();
    v11 = (id)AFBooleanGetName();
    if (v11)
    {
      v12 = v11;
      sub_227767750();

    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8000);
    sub_22776775C();
    sub_227767774();
    swift_bridgeObjectRelease();
    sub_227767774();
    swift_bridgeObjectRelease();
  }
  return v14[0];
}

id LocalDataSourceWriter.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id LocalDataSourceWriter.init()()
{
  char *v0;
  char *v1;
  char *v2;
  uint64_t *v3;
  id v4;
  char *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  *(_QWORD *)&v0[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriEnabled] = 0;
  v1 = &v0[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriLanguage];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriVoice] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_voiceTriggerEnabled] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriInCallEnabled] = 0;
  v2 = &v0[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriDataSharingStatus];
  *(_QWORD *)v2 = 0;
  v2[8] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_setupDismissed] = 0;
  v3 = (uint64_t *)&v0[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_id];
  v4 = objc_allocWithZone(MEMORY[0x24BDD1880]);
  v5 = v0;
  v6 = objc_msgSend(v4, sel_init);
  v7 = objc_msgSend(v6, sel_UUIDString);

  v8 = sub_227767750();
  v10 = v9;

  *v3 = v8;
  v3[1] = v10;

  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for LocalDataSourceWriter();
  return objc_msgSendSuper2(&v12, sel_init);
}

id LocalDataSourceWriter.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LocalDataSourceWriter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LocalDataSourceWriter()
{
  return objc_opt_self();
}

uint64_t method lookup function for LocalDataSourceWriter()
{
  return swift_lookUpClassMethod();
}

_BYTE *sub_22774F118(_BYTE *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  _BYTE *v5;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  char *v15;
  _BYTE *v16;
  id v17;
  id v18;
  _BYTE *v19;
  __int128 *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char *v36;
  char *v37;
  char *v38;
  char **v39;
  void *v40;
  objc_super v42;
  _OWORD v43[6];
  _OWORD v44[2];
  _OWORD v45[6];
  _OWORD v46[2];
  _OWORD v47[6];
  _OWORD v48[3];

  *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_optInRadioButtonSelection] = 0;
  v11 = &v5[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_presentingViewController];
  *v11 = 0;
  v11[1] = 0;
  v12 = &v5[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_dataSource];
  *v12 = a1;
  v12[1] = a2;
  v13 = &v5[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_dataSourceWriter];
  *v13 = a3;
  v13[1] = a4;
  v14 = OBJC_IVAR____TtC9SiriSetup8Defaults_enrollmentMode;
  v5[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewStyle] = 0x20100u >> (8
                                                                              * a1[OBJC_IVAR____TtC9SiriSetup8Defaults_enrollmentMode]);
  v15 = &v5[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewModel];
  *(_QWORD *)v15 = 0xD00000000000001ALL;
  *((_QWORD *)v15 + 1) = 0x800000022776ABB0;
  *((_OWORD *)v15 + 1) = 0u;
  *((_OWORD *)v15 + 2) = 0u;
  *((_OWORD *)v15 + 3) = 0u;
  *((_OWORD *)v15 + 4) = 0u;
  *((_OWORD *)v15 + 5) = 0u;
  *((_OWORD *)v15 + 6) = 0u;
  *((_QWORD *)v15 + 14) = 0;
  v15[120] = 2;
  *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_page] = a5;
  v42.receiver = v5;
  v42.super_class = (Class)type metadata accessor for DataSharingPresenter();
  v16 = a1;
  v17 = a3;
  swift_retain();
  v18 = objc_msgSendSuper2(&v42, sel_init);
  LOBYTE(v47[0]) = a1[v14];
  v19 = v18;
  sub_22774FB48((unsigned __int8 *)v47, (uint64_t)v45);
  v20 = (__int128 *)&v19[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewModel];
  swift_beginAccess();
  v21 = *v20;
  v22 = v20[1];
  v23 = v20[3];
  v43[2] = v20[2];
  v43[3] = v23;
  v43[0] = v21;
  v43[1] = v22;
  v24 = v20[4];
  v25 = v20[5];
  v26 = v20[6];
  *(_OWORD *)((char *)v44 + 9) = *(__int128 *)((char *)v20 + 105);
  v44[0] = v26;
  v43[4] = v24;
  v43[5] = v25;
  v27 = v45[5];
  v20[4] = v45[4];
  v20[5] = v27;
  v20[6] = v46[0];
  *(__int128 *)((char *)v20 + 105) = *(_OWORD *)((char *)v46 + 9);
  v28 = v45[1];
  *v20 = v45[0];
  v20[1] = v28;
  v29 = v45[3];
  v20[2] = v45[2];
  v20[3] = v29;
  sub_227748A14((uint64_t)v43);
  v30 = v20[3];
  v32 = *v20;
  v31 = v20[1];
  LOBYTE(a2) = v19[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewStyle];
  v47[2] = v20[2];
  v47[3] = v30;
  v47[0] = v32;
  v47[1] = v31;
  v34 = v20[5];
  v33 = v20[6];
  v35 = *(__int128 *)((char *)v20 + 105);
  v47[4] = v20[4];
  *(_OWORD *)((char *)v48 + 9) = v35;
  v47[5] = v34;
  v48[0] = v33;
  sub_227748948((uint64_t)v47);
  v36 = sub_22774F38C(a2, v47);
  v38 = v37;

  swift_release();
  sub_227748A14((uint64_t)v47);
  v39 = (char **)&v19[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_presentingViewController];
  v40 = *(void **)&v19[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_presentingViewController];
  *v39 = v36;
  v39[1] = v38;

  return v19;
}

char *sub_22774F38C(char a1, _QWORD *a2)
{
  uint64_t v3;
  os_log_type_t v4;
  char *v5;

  if (a1)
  {
    if (a1 == 1)
    {
      sub_2277678D0();
      sub_227767774();
      sub_227767900();
      sub_227767774();
      if (qword_2558F7DD0 != -1)
        swift_once();
      v3 = sub_227767678();
      __swift_project_value_buffer(v3, (uint64_t)qword_2558F8E48);
      v4 = sub_2277677E0();
      sub_227764D70(v4, 0xD000000000000030, 0x8000000227769D20, 0, 0xE000000000000000);
      swift_bridgeObjectRelease();
      return 0;
    }
    else
    {
      objc_allocWithZone((Class)type metadata accessor for DataSharingProxCardController());
      sub_227748948((uint64_t)a2);
      v5 = (char *)sub_227764648((uint64_t)a2);
      *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup29DataSharingProxCardController_delegate + 8] = &off_24EFD0410;
      swift_unknownObjectWeakAssign();
    }
  }
  else
  {
    objc_allocWithZone((Class)type metadata accessor for DataSharingWelcomeController());
    sub_227748948((uint64_t)a2);
    v5 = (char *)sub_227754694(a2);
    *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup28DataSharingWelcomeController_delegate + 8] = &off_24EFD0410;
    swift_unknownObjectWeakAssign();
  }
  return v5;
}

id sub_22774F5B0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DataSharingPresenter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DataSharingPresenter()
{
  return objc_opt_self();
}

double sub_22774F6B0@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  __int128 *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[2];

  v3 = (__int128 *)(v1 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewModel);
  swift_beginAccess();
  v4 = v3[5];
  v15 = v3[4];
  v16 = v4;
  v17[0] = v3[6];
  *(_OWORD *)((char *)v17 + 9) = *(__int128 *)((char *)v3 + 105);
  v5 = v3[1];
  v11 = *v3;
  v12 = v5;
  v6 = v3[3];
  v13 = v3[2];
  v14 = v6;
  sub_227748948((uint64_t)&v11);
  v7 = v16;
  a1[4] = v15;
  a1[5] = v7;
  a1[6] = v17[0];
  *(_OWORD *)((char *)a1 + 105) = *(_OWORD *)((char *)v17 + 9);
  v8 = v12;
  *a1 = v11;
  a1[1] = v8;
  result = *(double *)&v13;
  v10 = v14;
  a1[2] = v13;
  a1[3] = v10;
  return result;
}

uint64_t (*sub_22774F758())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void *sub_22774F79C()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_presentingViewController);
  v2 = v1;
  return v1;
}

uint64_t sub_22774F7D0()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  if (qword_2558F7DD0 != -1)
    swift_once();
  v1 = sub_227767678();
  __swift_project_value_buffer(v1, (uint64_t)qword_2558F8E48);
  v2 = sub_2277677EC();
  sub_227764D70(v2, 0xD000000000000015, 0x800000022776AB10, 0xD000000000000015, 0x800000022776AB30);
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewStyle) == 1)
    v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_optInRadioButtonSelection);
  else
    v3 = 1;
  v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_dataSourceWriter)
     + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriDataSharingStatus;
  *(_QWORD *)v4 = v3;
  *(_BYTE *)(v4 + 8) = 0;
  result = MEMORY[0x22E29CD18](v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_delegate);
  if (result)
  {
    v6 = swift_retain();
    sub_2277493E0(v6);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_22774F8F8()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  if (qword_2558F7DD0 != -1)
    swift_once();
  v1 = sub_227767678();
  __swift_project_value_buffer(v1, (uint64_t)qword_2558F8E48);
  v2 = sub_2277677EC();
  sub_227764D70(v2, 0xD000000000000017, 0x800000022776AAD0, 0xD000000000000017, 0x800000022776AAF0);
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewStyle) == 1)
  {
    result = MEMORY[0x22E29CD18](v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_delegate);
    if (!result)
      return result;
    swift_retain();
    sub_22774AE64();
  }
  else
  {
    v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_dataSourceWriter)
       + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriDataSharingStatus;
    *(_QWORD *)v4 = 2;
    *(_BYTE *)(v4 + 8) = 0;
    result = MEMORY[0x22E29CD18](v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_delegate);
    if (!result)
      return result;
    v5 = swift_retain();
    sub_2277493E0(v5);
  }
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_22774FA44()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  if (qword_2558F7DD0 != -1)
    swift_once();
  v1 = sub_227767678();
  __swift_project_value_buffer(v1, (uint64_t)qword_2558F8E48);
  v2 = sub_2277677EC();
  sub_227764D70(v2, 0xD000000000000015, 0x800000022776AB50, 0xD000000000000015, 0x800000022776AB70);
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_dataSourceWriter)
     + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriDataSharingStatus;
  *(_QWORD *)v3 = 3;
  *(_BYTE *)(v3 + 8) = 0;
  result = MEMORY[0x22E29CD18](v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_delegate);
  if (result)
  {
    v5 = swift_retain();
    sub_2277496E4(v5);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_22774FB48@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  os_log_type_t v48;
  uint64_t result;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v56 = *a1;
  v2 = (void *)sub_227767744();
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel_bundleWithIdentifier_, v2);

  v5 = v4;
  if (!v4)
    v5 = objc_msgSend(v3, sel_mainBundle);
  v6 = v4;
  v7 = sub_2277675C4();
  v59 = v8;
  v60 = v7;

  v9 = (void *)sub_227767744();
  v10 = objc_msgSend(v3, sel_bundleWithIdentifier_, v9, 0xE000000000000000);

  v11 = v10;
  if (!v10)
    v11 = objc_msgSend(v3, sel_mainBundle);
  v12 = v10;
  v13 = sub_2277675C4();
  v53 = v14;
  v54 = v13;

  v15 = (void *)sub_227767744();
  v16 = objc_msgSend(v3, sel_bundleWithIdentifier_, v15, 0xE000000000000000);

  v17 = v16;
  if (!v16)
    v17 = objc_msgSend(v3, sel_mainBundle);
  v18 = v16;
  v19 = sub_2277675C4();
  v55 = v20;

  v21 = (void *)sub_227767744();
  v22 = objc_msgSend(v3, sel_bundleWithIdentifier_, v21, 0xE000000000000000);

  v23 = v22;
  if (!v22)
    v23 = objc_msgSend(v3, sel_mainBundle);
  v24 = v22;
  v25 = sub_2277675C4();
  v52 = v26;

  v27 = (void *)sub_227767744();
  v28 = objc_msgSend(v3, sel_bundleWithIdentifier_, v27, 0xE000000000000000);

  v29 = v28;
  if (!v28)
    v29 = objc_msgSend(v3, sel_mainBundle);
  v30 = v28;
  v31 = sub_2277675C4();
  v50 = v32;

  v33 = (void *)sub_227767744();
  v34 = objc_msgSend(v3, sel_bundleWithIdentifier_, v33, 0xE000000000000000);

  v35 = v34;
  if (!v34)
    v35 = objc_msgSend(v3, sel_mainBundle);
  v36 = v34;
  v37 = sub_2277675C4();
  v58 = v38;

  v39 = (void *)sub_227767744();
  v40 = objc_msgSend(v3, sel_bundleWithIdentifier_, v39, 0xE000000000000000);

  v41 = v40;
  if (v56 == 1)
  {
    v42 = v19;
    if (!v40)
      v41 = objc_msgSend(v3, sel_mainBundle);
  }
  else
  {
    v42 = v19;
    if (!v40)
      v41 = objc_msgSend(v3, sel_mainBundle);
  }
  v43 = v40;
  v44 = sub_2277675C4();
  v57 = v45;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F7F18);
  v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_227768C10;
  *(_QWORD *)(v46 + 32) = v54;
  *(_QWORD *)(v46 + 40) = v53;
  sub_2277678D0();
  sub_227767774();
  sub_227767900();
  if (qword_2558F7DD0 != -1)
    swift_once();
  v47 = sub_227767678();
  __swift_project_value_buffer(v47, (uint64_t)qword_2558F8E48);
  v48 = sub_2277677EC();
  sub_227764D70(v48, 0xD00000000000002BLL, 0x800000022776ACE0, 0, 0xE000000000000000);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v60;
  *(_QWORD *)(a2 + 8) = v59;
  *(_QWORD *)(a2 + 16) = v44;
  *(_QWORD *)(a2 + 24) = v57;
  *(_QWORD *)(a2 + 32) = v46;
  *(_QWORD *)(a2 + 40) = v42;
  *(_QWORD *)(a2 + 48) = v55;
  *(_QWORD *)(a2 + 56) = v37;
  *(_QWORD *)(a2 + 64) = v58;
  *(_QWORD *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 80) = 0;
  *(_QWORD *)(a2 + 88) = v25;
  *(_QWORD *)(a2 + 96) = v52;
  *(_QWORD *)(a2 + 104) = v31;
  *(_QWORD *)(a2 + 112) = v50;
  *(_BYTE *)(a2 + 120) = 2;
  return result;
}

char *sub_227750264(char a1)
{
  _BYTE *v1;
  id v3;
  _BYTE *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  char *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v16;

  v1[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_constraintsSpecified] = 0;
  v3 = objc_allocWithZone((Class)type metadata accessor for OrbContainerView());
  v4 = v1;
  *(_QWORD *)&v4[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbView] = sub_22774C98C(0);
  v4[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbOverTitle] = a1;

  v16.receiver = v4;
  v16.super_class = (Class)type metadata accessor for SiriSetupProxCardView();
  v5 = (char *)objc_msgSendSuper2(&v16, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v6 = OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbView;
  v7 = *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbView];
  v8 = v5;
  objc_msgSend(v8, sel_addSubview_, v7);
  v9 = *(void **)&v5[v6];
  v10 = v8;
  objc_msgSend(v9, sel_intrinsicContentSize);
  v12 = v11;
  objc_msgSend(v10, sel_layoutMargins);
  if ((a1 & 1) != 0)
    v14 = v12;
  else
    v14 = -0.0;
  objc_msgSend(v10, sel_setLayoutMargins_, v13 + v14);

  return v10;
}

void sub_227750414()
{
  char *v0;
  char *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  double v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  double v28;
  id v29;
  objc_super v30;

  v1 = v0;
  v30.receiver = v0;
  v30.super_class = (Class)type metadata accessor for SiriSetupProxCardView();
  objc_msgSendSuper2(&v30, sel_updateConstraints);
  v2 = OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_constraintsSpecified;
  if ((v0[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_constraintsSpecified] & 1) == 0)
  {
    if (v0[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbOverTitle] == 1)
    {
      v3 = (void *)objc_opt_self();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8590);
      v4 = swift_allocObject();
      *(_OWORD *)(v4 + 16) = xmmword_227769170;
      v5 = OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbView;
      v6 = objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbView], sel_topAnchor);
      v7 = objc_msgSend(v1, sel_topAnchor);
      v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

      *(_QWORD *)(v4 + 32) = v8;
      v9 = objc_msgSend(*(id *)&v1[v5], sel_centerXAnchor);
      v10 = objc_msgSend(v1, sel_centerXAnchor);
      v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

      *(_QWORD *)(v4 + 40) = v11;
      v12 = objc_msgSend(*(id *)&v1[v5], sel_heightAnchor);
      objc_msgSend(*(id *)&v1[v5], sel_intrinsicContentSize);
      v14 = objc_msgSend(v12, sel_constraintEqualToConstant_, v13);

      *(_QWORD *)(v4 + 48) = v14;
      sub_2277677BC();
      sub_2277508E0();
      v15 = (void *)sub_227767798();
      swift_bridgeObjectRelease();
      objc_msgSend(v3, sel_activateConstraints_, v15);
    }
    else
    {
      v16 = objc_msgSend(v0, sel_titleView);
      if (!v16)
      {
LABEL_7:
        v1[v2] = 1;
        return;
      }
      v17 = v16;
      v18 = (void *)objc_opt_self();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8590);
      v19 = swift_allocObject();
      *(_OWORD *)(v19 + 16) = xmmword_227769170;
      v20 = OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbView;
      v21 = objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbView], sel_topAnchor);
      v22 = objc_msgSend(v17, sel_bottomAnchor);
      v23 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v22);

      *(_QWORD *)(v19 + 32) = v23;
      v24 = objc_msgSend(*(id *)&v1[v20], sel_centerXAnchor);
      v25 = objc_msgSend(v1, sel_centerXAnchor);
      v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v25);

      *(_QWORD *)(v19 + 40) = v26;
      v27 = objc_msgSend(*(id *)&v1[v20], sel_heightAnchor);
      objc_msgSend(*(id *)&v1[v20], sel_intrinsicContentSize);
      v29 = objc_msgSend(v27, sel_constraintEqualToConstant_, v28);

      *(_QWORD *)(v19 + 48) = v29;
      sub_2277677BC();
      sub_2277508E0();
      v15 = (void *)sub_227767798();
      swift_bridgeObjectRelease();
      objc_msgSend(v18, sel_activateConstraints_, v15);

    }
    goto LABEL_7;
  }
}

id sub_227750880()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriSetupProxCardView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SiriSetupProxCardView()
{
  return objc_opt_self();
}

unint64_t sub_2277508E0()
{
  unint64_t result;

  result = qword_2558F8598;
  if (!qword_2558F8598)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2558F8598);
  }
  return result;
}

void sub_22775091C()
{
  qword_2558F85A0 = 0x404F000000000000;
}

void sub_22775092C()
{
  qword_2558F85A8 = 0x72616D6B63656863;
  unk_2558F85B0 = 0xE90000000000006BLL;
}

void sub_227750954()
{
  qword_2558F85B8 = 0x4045000000000000;
}

void sub_227750964()
{
  qword_2558F85C0 = 0x4040800000000000;
}

void sub_2277509CC(char a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  id v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  id v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  _QWORD *v29;
  void *v30;
  id v31;
  id v32;
  CGAffineTransform v33;

  if ((a1 & 1) != 0)
    v6 = sub_227750F7C();
  else
    v6 = sub_22775123C();
  v7 = v6;
  objc_msgSend(v3, sel_bounds);
  v9 = v8;
  objc_msgSend(v7, sel_bounds);
  v11 = v9 / v10;
  objc_msgSend(v3, sel_bounds);
  v13 = v12;
  objc_msgSend(v7, sel_bounds);
  CGAffineTransformMakeScale(&v33, v11, v13 / v14);
  objc_msgSend(v7, sel_setAffineTransform_, &v33);
  v15 = sub_227750E70();
  objc_msgSend(v3, sel_bounds);
  v17 = v16;
  v18 = sub_227750E70();
  objc_msgSend(v18, sel_bounds);
  v20 = v19;

  v21 = v17 / v20;
  objc_msgSend(v3, sel_bounds);
  v23 = v22;
  v24 = sub_227750E70();
  objc_msgSend(v24, sel_bounds);
  v26 = v25;

  CGAffineTransformMakeScale(&v33, v21, v23 / v26);
  objc_msgSend(v15, sel_setAffineTransform_, &v33);

  v27 = objc_msgSend(v3, sel_layer);
  objc_msgSend(v27, sel_setMask_, v7);

  objc_msgSend(v3, sel_setAlpha_, 1.0);
  objc_msgSend(v3, sel_setHidden_, 0);
  v28 = (void *)objc_opt_self();
  objc_msgSend(v28, sel_begin);
  objc_msgSend(v28, sel_setAnimationDuration_, 0.666666667);
  objc_msgSend(v28, sel_disableActions);
  v29 = (_QWORD *)swift_allocObject();
  v29[2] = v3;
  v29[3] = a2;
  v29[4] = a3;
  *(_QWORD *)&v33.tx = sub_227751574;
  *(_QWORD *)&v33.ty = v29;
  *(_QWORD *)&v33.a = MEMORY[0x24BDAC760];
  *(_QWORD *)&v33.b = 1107296256;
  *(_QWORD *)&v33.c = sub_22775FF30;
  *(_QWORD *)&v33.d = &block_descriptor_0;
  v30 = _Block_copy(&v33);
  v31 = v3;
  swift_retain();
  swift_release();
  objc_msgSend(v28, sel_setCompletionBlock_, v30);
  _Block_release(v30);
  v32 = sub_227750E70();
  objc_msgSend(v32, sel_setPhase_, 1.0);

  objc_msgSend(v28, sel_commit);
}

void sub_227750C9C(void *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v19;

  v6 = (void *)objc_opt_self();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  v18 = sub_2277515BC;
  v19 = (_QWORD *)v7;
  v8 = MEMORY[0x24BDAC760];
  v14 = MEMORY[0x24BDAC760];
  v15 = 1107296256;
  v16 = sub_22775FF30;
  v17 = &block_descriptor_6;
  v9 = _Block_copy(&v14);
  v10 = a1;
  swift_release();
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v10;
  v11[3] = a2;
  v11[4] = a3;
  v18 = sub_227751600;
  v19 = v11;
  v14 = v8;
  v15 = 1107296256;
  v16 = sub_227755DA4;
  v17 = &block_descriptor_12;
  v12 = _Block_copy(&v14);
  v13 = v10;
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_animateWithDuration_animations_completion_, v9, v12, 0.333333333);
  _Block_release(v12);
  _Block_release(v9);
}

void sub_227750E04(int a1, id a2, void (*a3)(id))
{
  id v3;

  a3(objc_msgSend(a2, sel_setHidden_, 1));
  v3 = sub_227750E70();
  objc_msgSend(v3, sel_setPhase_, 0.0);

}

id sub_227750E70()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  double MidX;
  id v6;
  void *v7;
  id v8;
  CGRect v10;
  CGRect v11;

  v1 = OBJC_IVAR____TtC9SiriSetup13CheckMarkView_colorLayer;
  v2 = *(void **)&v0[OBJC_IVAR____TtC9SiriSetup13CheckMarkView_colorLayer];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC9SiriSetup13CheckMarkView_colorLayer];
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ColorLayer()), sel_init);
    objc_msgSend(v4, sel_setBounds_, 0.0, 0.0, 400.0, 400.0);
    objc_msgSend(v0, sel_bounds);
    MidX = CGRectGetMidX(v10);
    objc_msgSend(v0, sel_bounds);
    objc_msgSend(v4, sel_setPosition_, MidX, CGRectGetMidY(v11));
    v6 = objc_msgSend(v0, sel_layer);
    objc_msgSend(v6, sel_addSublayer_, v4);

    v7 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v4;
    v3 = v4;

    v2 = 0;
  }
  v8 = v2;
  return v3;
}

id sub_227750F7C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  id v16;
  double MidX;
  double MidY;
  void *v19;
  id v20;
  CGRect v22;
  CGRect v23;

  v1 = OBJC_IVAR____TtC9SiriSetup13CheckMarkView_checkMaskLayer;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_checkMaskLayer);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_checkMaskLayer);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE56D0]), sel_init);
    if (qword_2558F7DA0 != -1)
      swift_once();
    v5 = *(double *)&qword_2558F85B8;
    if (qword_2558F7DA8 != -1)
      swift_once();
    v6 = *(double *)&qword_2558F85C0;
    if (qword_2558F7D98 != -1)
      swift_once();
    swift_bridgeObjectRetain();
    v7 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
    v8 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_, v7);

    if (v8)
    {
      v9 = qword_2558F7D90;
      v10 = v8;
      if (v9 != -1)
        swift_once();
      v11 = objc_msgSend((id)objc_opt_self(), sel_configurationWithPointSize_weight_, 7, *(double *)&qword_2558F85A0);
      v12 = objc_msgSend(v10, sel_imageWithConfiguration_, v11);

      v13 = v12;
      objc_msgSend(v13, sel_size);
      v5 = v14;
      v6 = v15;
      v16 = objc_msgSend(v13, sel_CGImage);

      objc_msgSend(v4, sel_setContents_, v16);
    }
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.width = v5;
    v22.size.height = v6;
    MidX = CGRectGetMidX(v22);
    v23.origin.x = 0.0;
    v23.origin.y = 0.0;
    v23.size.width = v5;
    v23.size.height = v6;
    MidY = CGRectGetMidY(v23);
    objc_msgSend(v4, sel_setBounds_, 0.0, 0.0, v5, v6);
    objc_msgSend(v4, sel_setPosition_, MidX, MidY);
    v19 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v20 = v2;
  return v3;
}

id sub_22775123C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  CGMutablePathRef Mutable;
  CGColorRef GenericRGB;
  void *v8;
  id v9;

  v1 = OBJC_IVAR____TtC9SiriSetup13CheckMarkView_xMaskLayer;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_xMaskLayer);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_xMaskLayer);
  }
  else
  {
    v4 = v0;
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE5758]), sel_init);
    objc_msgSend(v5, sel_setBounds_, 0.0, 0.0, 400.0, 400.0);
    objc_msgSend(v5, sel_setAnchorPoint_, 0.0, 0.0);
    Mutable = CGPathCreateMutable();
    sub_227767804();
    sub_227767810();
    sub_227767804();
    sub_227767810();
    objc_msgSend(v5, sel_setPath_, Mutable, 0x3FF0000000000000, 0, 0, 0x3FF0000000000000, 0, 0);
    objc_msgSend(v5, sel_setFillColor_, 0);
    GenericRGB = CGColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
    objc_msgSend(v5, sel_setStrokeColor_, GenericRGB);

    objc_msgSend(v5, sel_setLineWidth_, 36.0);
    v8 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v9 = v2;
  return v3;
}

id sub_2277514D8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CheckMarkView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CheckMarkView()
{
  return objc_opt_self();
}

void sub_227751574()
{
  uint64_t v0;

  sub_227750C9C(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
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

uint64_t sub_227751598()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_2277515BC()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_setAlpha_, 0.0);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_227751600(int a1)
{
  uint64_t v1;

  sub_227750E04(a1, *(id *)(v1 + 16), *(void (**)(id))(v1 + 24));
}

void sub_2277516A4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  _BYTE v20[16];
  _QWORD v21[2];

  sub_227752120(a1 + 40, (uint64_t)v20);
  sub_227752120((uint64_t)v20, (uint64_t)v21);
  v2 = MEMORY[0x24BDAC760];
  if (v21[1])
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    sub_2277521B4((uint64_t)v20);
    v4 = v1;
    v5 = (void *)sub_227767744();
    sub_2277521DC((uint64_t)v20);
    v18 = sub_2277521AC;
    v19 = v3;
    v14 = v2;
    v15 = 1107296256;
    v16 = sub_227763240;
    v17 = &block_descriptor_6_0;
    v6 = _Block_copy(&v14);
    v7 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v5, 1, v6);

    _Block_release(v6);
    swift_release();
    v8 = objc_msgSend(v4, sel_addAction_, v7);

  }
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v1;
  v10 = v1;
  v11 = (void *)sub_227767744();
  v18 = sub_22775218C;
  v19 = v9;
  v14 = v2;
  v15 = 1107296256;
  v16 = sub_227763240;
  v17 = &block_descriptor_1;
  v12 = _Block_copy(&v14);
  v13 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v11, 0, v12);

  _Block_release(v12);
  swift_release();
  objc_msgSend(v10, sel_setDismissButtonAction_, v13);

}

uint64_t sub_2277518B4(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  uint64_t v6;

  result = MEMORY[0x22E29CD18](a2 + OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_delegate);
  if (result)
  {
    v3 = result;
    if (qword_2558F7DD0 != -1)
      swift_once();
    v4 = sub_227767678();
    __swift_project_value_buffer(v4, (uint64_t)qword_2558F8E48);
    v5 = sub_2277677EC();
    sub_227764D70(v5, 0xD000000000000017, 0x800000022776AAD0, 0xD00000000000001ALL, 0x800000022776AF70);
    if (MEMORY[0x22E29CD18](v3 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_delegate))
    {
      v6 = swift_retain();
      sub_227749560(v6);
      swift_unknownObjectRelease();
      swift_release();
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_2277519C8(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;

  result = MEMORY[0x22E29CD18](a2 + OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_delegate);
  if (result)
  {
    if (MEMORY[0x22E29CD18](result + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_delegate))
    {
      v3 = swift_retain();
      sub_2277496E4(v3);
      swift_unknownObjectRelease();
      swift_release();
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_227751A60(uint64_t a1, char a2)
{
  char *v2;
  void *v3;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  os_log_type_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _OWORD v28[6];
  _OWORD v29[2];

  v3 = v2;
  v6 = &v2[OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_viewModel];
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)&v2[OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_viewModel] == *(_QWORD *)a1
    && *(_QWORD *)&v2[OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_viewModel + 8] == v8;
  if (!v9 && (sub_227767990() & 1) == 0)
  {
    sub_2277678D0();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v28[0] = 0xD000000000000013;
    *((_QWORD *)&v28[0] + 1) = 0x800000022776AF10;
    swift_bridgeObjectRetain();
    sub_227767774();
    swift_bridgeObjectRelease();
    if (qword_2558F7DD0 != -1)
      swift_once();
    v10 = sub_227767678();
    __swift_project_value_buffer(v10, (uint64_t)qword_2558F8E48);
    v11 = sub_2277677EC();
    sub_227764D70(v11, 0xD000000000000013, 0x800000022776AEF0, *(uint64_t *)&v28[0], *((unint64_t *)&v28[0] + 1));
    swift_bridgeObjectRelease();
    sub_227751D74(v7, v8, a2 & 1);
  }
  v12 = *((_QWORD *)v6 + 10);
  v13 = *(_QWORD *)(a1 + 80);
  if (v12)
  {
    if (v13)
    {
      v14 = *((_QWORD *)v6 + 9) == *(_QWORD *)(a1 + 72) && v12 == v13;
      if (v14 || (sub_227767990() & 1) != 0)
        goto LABEL_24;
    }
  }
  else if (!v13)
  {
    goto LABEL_24;
  }
  sub_2277678D0();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v28[0] = 0xD00000000000001ELL;
  *((_QWORD *)&v28[0] + 1) = 0x800000022776AF30;
  swift_bridgeObjectRetain();
  sub_227767774();
  swift_bridgeObjectRelease();
  if (qword_2558F7DD0 != -1)
    swift_once();
  v15 = sub_227767678();
  __swift_project_value_buffer(v15, (uint64_t)qword_2558F8E48);
  v16 = sub_2277677EC();
  sub_227764D70(v16, 0xD000000000000013, 0x800000022776AEF0, *(uint64_t *)&v28[0], *((unint64_t *)&v28[0] + 1));
  swift_bridgeObjectRelease();
  if (v13)
    v17 = (void *)sub_227767744();
  else
    v17 = 0;
  objc_msgSend(v3, sel_setBottomTrayTitle_, v17, v28[0]);

LABEL_24:
  v18 = *((_OWORD *)v6 + 5);
  v28[4] = *((_OWORD *)v6 + 4);
  v28[5] = v18;
  v29[0] = *((_OWORD *)v6 + 6);
  *(_OWORD *)((char *)v29 + 9) = *(_OWORD *)(v6 + 105);
  v19 = *((_OWORD *)v6 + 1);
  v28[0] = *(_OWORD *)v6;
  v28[1] = v19;
  v20 = *((_OWORD *)v6 + 3);
  v28[2] = *((_OWORD *)v6 + 2);
  v28[3] = v20;
  v21 = *(_OWORD *)a1;
  v22 = *(_OWORD *)(a1 + 16);
  v23 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v6 + 2) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v6 + 3) = v23;
  *(_OWORD *)v6 = v21;
  *((_OWORD *)v6 + 1) = v22;
  v24 = *(_OWORD *)(a1 + 64);
  v25 = *(_OWORD *)(a1 + 80);
  v26 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v6 + 105) = *(_OWORD *)(a1 + 105);
  *((_OWORD *)v6 + 5) = v25;
  *((_OWORD *)v6 + 6) = v26;
  *((_OWORD *)v6 + 4) = v24;
  sub_227748948(a1);
  return sub_227748A14((uint64_t)v28);
}

void sub_227751D74(uint64_t a1, uint64_t a2, char a3)
{
  char *v3;
  char *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  double v12;
  id v13;
  void *v14;
  id v15;
  id *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v5 = &v3[OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_viewModel];
  *(_QWORD *)v5 = a1;
  *((_QWORD *)v5 + 1) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_227767744();
  objc_msgSend(v3, sel_setTitle_, v6);

  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE57E8]), sel_init);
  v8 = *MEMORY[0x24BDE5D20];
  v9 = (void *)objc_opt_self();
  v10 = v7;
  v11 = objc_msgSend(v9, sel_functionWithName_, v8);
  objc_msgSend(v10, sel_setTimingFunction_, v11);

  v12 = 0.2;
  if ((a3 & 1) == 0)
    v12 = 0.0;
  objc_msgSend(v10, sel_setDuration_, v12);
  objc_msgSend(v10, sel_setType_, *MEMORY[0x24BDE5E30]);
  v13 = objc_msgSend(v3, sel_view);
  if (v13)
  {
    v14 = v13;
    v15 = objc_msgSend(v13, sel_semanticContentAttribute);

    v16 = (id *)MEMORY[0x24BDE5E10];
    if (v15 != (id)4)
      v16 = (id *)MEMORY[0x24BDE5E18];
    v17 = *v16;
    objc_msgSend(v10, sel_setSubtype_, v17);

    v18 = objc_msgSend(v3, sel_contentView);
    v19 = objc_msgSend(v18, sel_layer);

    objc_msgSend(v19, sel_removeAllAnimations);
    v20 = objc_msgSend(v3, sel_contentView);
    v21 = objc_msgSend(v20, sel_layer);

    objc_msgSend(v21, sel_addAnimation_forKey_, v10, *MEMORY[0x24BDE5DF8]);
  }
  else
  {
    __break(1u);
  }
}

id sub_227752000()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VoiceTrainingProxController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for VoiceTrainingProxController()
{
  return objc_opt_self();
}

void *sub_2277520D0()
{
  _QWORD *v0;
  void *v1;
  id v2;

  v1 = *(void **)(*v0 + OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_orbView);
  v2 = v1;
  return v1;
}

uint64_t sub_227752100(uint64_t a1, char a2)
{
  return sub_227751A60(a1, a2);
}

uint64_t sub_227752120(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8000);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_227752168()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_22775218C(uint64_t a1)
{
  uint64_t v1;

  return sub_2277519C8(a1, *(_QWORD *)(v1 + 16));
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

uint64_t sub_2277521AC(uint64_t a1)
{
  uint64_t v1;

  return sub_2277518B4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2277521B4(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2277521DC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

id sub_227752204(__int128 *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  id v5;
  char *v6;
  char *v7;
  void *v8;
  void *v9;
  id v10;
  char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  objc_super v27;
  _BYTE v28[16];
  _BYTE v29[16];
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;

  v2 = v1;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v4 = OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_orbView;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_orbView] = 0;
  v5 = objc_allocWithZone((Class)type metadata accessor for SiriSetupProxCardView());
  v6 = v1;
  v7 = sub_227750264(1);
  v8 = *(void **)&v7[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbView];
  v9 = *(void **)&v1[v4];
  *(_QWORD *)&v2[v4] = v8;
  v10 = v8;

  v11 = &v6[OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_viewModel];
  v12 = a1[3];
  v14 = *a1;
  v13 = a1[1];
  *((_OWORD *)v11 + 2) = a1[2];
  *((_OWORD *)v11 + 3) = v12;
  *(_OWORD *)v11 = v14;
  *((_OWORD *)v11 + 1) = v13;
  v16 = a1[5];
  v15 = a1[6];
  v17 = a1[4];
  *(_OWORD *)(v11 + 105) = *(__int128 *)((char *)a1 + 105);
  *((_OWORD *)v11 + 5) = v16;
  *((_OWORD *)v11 + 6) = v15;
  *((_OWORD *)v11 + 4) = v17;
  sub_227748948((uint64_t)a1);

  v27.receiver = v6;
  v27.super_class = (Class)type metadata accessor for VoiceTrainingProxController();
  v18 = objc_msgSendSuper2(&v27, sel_initWithContentView_, v7);
  v19 = (void *)sub_227767744();
  objc_msgSend(v18, sel_setTitle_, v19);

  sub_227752120((uint64_t)a1 + 72, (uint64_t)v29);
  sub_227752120((uint64_t)v29, (uint64_t)&v30);
  v20 = v31;
  if (v31)
  {
    v21 = v18;
    sub_2277521B4((uint64_t)v29);
    v20 = (void *)sub_227767744();
    sub_2277521DC((uint64_t)v29);
  }
  else
  {
    v22 = v18;
  }
  objc_msgSend(v18, sel_setBottomTrayTitle_, v20);

  sub_227752120((uint64_t)(a1 + 1), (uint64_t)v28);
  sub_227752120((uint64_t)v28, (uint64_t)&v32);
  v23 = v33;
  if (v33)
  {
    v24 = v18;
    sub_2277521B4((uint64_t)v28);
    v23 = (void *)sub_227767744();
    sub_2277521DC((uint64_t)v28);
  }
  else
  {
    v25 = v18;
  }
  objc_msgSend(v18, sel_setSubtitle_, v23);

  objc_msgSend(v18, sel_setDismissalType_, 1);
  sub_2277516A4((uint64_t)a1);

  return v18;
}

uint64_t initializeBufferWithCopyOfBuffer for ViewModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ViewModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  v8 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v8;
  v9 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v9;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
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

uint64_t assignWithCopy for ViewModel(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  return a1;
}

__n128 __swift_memcpy121_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[6];
  *(_OWORD *)(a1 + 105) = *(__int128 *)((char *)a2 + 105);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for ViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v9;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  return a1;
}

uint64_t getEnumTagSinglePayload for ViewModel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 121))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ViewModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 120) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 121) = 1;
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
    *(_BYTE *)(result + 121) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ViewModel()
{
  return &type metadata for ViewModel;
}

char *sub_227752848(_BYTE *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  _BYTE *v5;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  char *v15;
  _BYTE *v16;
  id v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char *v22;
  char *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  char **v34;
  void *v35;
  objc_super v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _OWORD v44[2];
  _OWORD v45[6];
  _OWORD v46[3];

  *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v11 = &v5[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_presentingViewController];
  *v11 = 0;
  v11[1] = 0;
  v5[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_checkboxCheckedMac] = 1;
  v12 = &v5[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_dataSource];
  *v12 = a1;
  v12[1] = a2;
  v13 = &v5[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_dataSourceWriter];
  *v13 = a3;
  v13[1] = a4;
  v14 = OBJC_IVAR____TtC9SiriSetup8Defaults_enrollmentMode;
  v5[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_viewStyle] = 0x20100u >> (8
                                                                        * a1[OBJC_IVAR____TtC9SiriSetup8Defaults_enrollmentMode]);
  *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_page] = a5;
  v15 = v5;
  v16 = a1;
  v17 = a3;
  swift_retain();
  sub_2277530F4((uint64_t)v16);
  v18 = &v15[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_viewModel];
  v19 = v43;
  *((_OWORD *)v18 + 4) = v42;
  *((_OWORD *)v18 + 5) = v19;
  *((_OWORD *)v18 + 6) = v44[0];
  *(_OWORD *)(v18 + 105) = *(_OWORD *)((char *)v44 + 9);
  v20 = v39;
  *(_OWORD *)v18 = v38;
  *((_OWORD *)v18 + 1) = v20;
  v21 = v41;
  *((_OWORD *)v18 + 2) = v40;
  *((_OWORD *)v18 + 3) = v21;

  v37.receiver = v15;
  v37.super_class = (Class)type metadata accessor for IntroPresenter();
  v22 = (char *)objc_msgSendSuper2(&v37, sel_init);
  LODWORD(a2) = 0x20100u >> (8 * a1[v14]);
  v23 = &v22[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_viewModel];
  swift_beginAccess();
  v24 = *(_OWORD *)v23;
  v25 = *((_OWORD *)v23 + 1);
  v26 = *((_OWORD *)v23 + 3);
  v45[2] = *((_OWORD *)v23 + 2);
  v45[3] = v26;
  v45[0] = v24;
  v45[1] = v25;
  v27 = *((_OWORD *)v23 + 4);
  v28 = *((_OWORD *)v23 + 5);
  v29 = *((_OWORD *)v23 + 6);
  *(_OWORD *)((char *)v46 + 9) = *(_OWORD *)(v23 + 105);
  v45[5] = v28;
  v46[0] = v29;
  v45[4] = v27;
  v30 = v22;
  sub_227748948((uint64_t)v45);
  v31 = sub_227752A60(a2, (uint64_t)v45);
  v33 = v32;

  swift_release();
  sub_227748A14((uint64_t)v45);
  v34 = (char **)&v30[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_presentingViewController];
  v35 = *(void **)&v30[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_presentingViewController];
  *v34 = v31;
  v34[1] = v33;

  return v30;
}

char *sub_227752A60(char a1, uint64_t a2)
{
  uint64_t v3;
  os_log_type_t v4;
  char *v5;
  id v6;
  id v7;

  if (a1)
  {
    if (a1 == 1)
    {
      if (qword_2558F7DD0 != -1)
        swift_once();
      v3 = sub_227767678();
      __swift_project_value_buffer(v3, (uint64_t)qword_2558F8E48);
      v4 = sub_2277677E0();
      sub_227764D70(v4, 0xD000000000000028, 0x800000022776B0C0, 0xD000000000000016, 0x800000022776B0F0);
      return 0;
    }
    else
    {
      v7 = objc_allocWithZone((Class)type metadata accessor for IntroProxCardController());
      sub_227748948(a2);
      v5 = sub_227764498(a2);
      sub_227748A14(a2);
      *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup23IntroProxCardController_delegate + 8] = &off_24EFD06F8;
      swift_unknownObjectWeakAssign();
    }
  }
  else
  {
    v6 = objc_allocWithZone((Class)type metadata accessor for IntroWelcomeController());
    sub_227748948(a2);
    v5 = (char *)sub_227756EB4(a2);
    *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_delegate + 8] = &off_24EFD06F8;
    swift_unknownObjectWeakAssign();
  }
  return v5;
}

id sub_227752BFC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntroPresenter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IntroPresenter()
{
  return objc_opt_self();
}

double sub_227752CFC@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  __int128 *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[2];

  v3 = (__int128 *)(v1 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_viewModel);
  swift_beginAccess();
  v4 = v3[5];
  v15 = v3[4];
  v16 = v4;
  v17[0] = v3[6];
  *(_OWORD *)((char *)v17 + 9) = *(__int128 *)((char *)v3 + 105);
  v5 = v3[1];
  v11 = *v3;
  v12 = v5;
  v6 = v3[3];
  v13 = v3[2];
  v14 = v6;
  sub_227748948((uint64_t)&v11);
  v7 = v16;
  a1[4] = v15;
  a1[5] = v7;
  a1[6] = v17[0];
  *(_OWORD *)((char *)a1 + 105) = *(_OWORD *)((char *)v17 + 9);
  v8 = v12;
  *a1 = v11;
  a1[1] = v8;
  result = *(double *)&v13;
  v10 = v14;
  a1[2] = v13;
  a1[3] = v10;
  return result;
}

uint64_t (*sub_227752DA4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void *sub_227752DE8()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_presentingViewController);
  v2 = v1;
  return v1;
}

uint64_t sub_227752E1C()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint64_t v7;

  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_viewStyle) == 1
    && (*(_BYTE *)(v0 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_checkboxCheckedMac) & 1) == 0)
  {
    if (qword_2558F7DD0 != -1)
      swift_once();
    v5 = sub_227767678();
    __swift_project_value_buffer(v5, (uint64_t)qword_2558F8E48);
    v6 = sub_2277677EC();
    sub_227764D70(v6, 0xD000000000000015, 0x800000022776AB10, 0xD00000000000003DLL, 0x800000022776B060);
    result = MEMORY[0x22E29CD18](v0 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_delegate);
    if (result)
    {
      v7 = swift_retain();
      sub_227749560(v7);
      goto LABEL_11;
    }
  }
  else
  {
    if (qword_2558F7DD0 != -1)
      swift_once();
    v1 = sub_227767678();
    __swift_project_value_buffer(v1, (uint64_t)qword_2558F8E48);
    v2 = sub_2277677EC();
    sub_227764D70(v2, 0xD000000000000015, 0x800000022776AB10, 0xD000000000000036, 0x800000022776B020);
    *(_QWORD *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_dataSourceWriter)
              + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriEnabled) = 2;
    result = MEMORY[0x22E29CD18](v0 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_delegate);
    if (result)
    {
      v4 = swift_retain();
      sub_2277493E0(v4);
LABEL_11:
      swift_release();
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t sub_227752FF4()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint64_t result;
  uint64_t v4;

  if (qword_2558F7DD0 != -1)
    swift_once();
  v1 = sub_227767678();
  __swift_project_value_buffer(v1, (uint64_t)qword_2558F8E48);
  v2 = sub_2277677EC();
  sub_227764D70(v2, 0xD000000000000017, 0x800000022776AAD0, 0xD000000000000014, 0x800000022776B0A0);
  *(_QWORD *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_dataSourceWriter)
            + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_setupDismissed) = 2;
  result = MEMORY[0x22E29CD18](v0 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_delegate);
  if (result)
  {
    v4 = swift_retain();
    sub_2277496E4(v4);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_2277530F4(uint64_t a1)
{
  sub_227762054();
  __asm { BR              X10 }
}

double sub_227753174(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,__int128 a29,__int128 a30,__int128 a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  os_log_type_t v80;
  double result;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;

  v51 = (void *)sub_227767744();
  v52 = (void *)objc_opt_self();
  v53 = objc_msgSend(v52, sel_bundleWithIdentifier_, v51);

  v54 = v53;
  if (!v53)
    v54 = objc_msgSend(v52, sel_mainBundle);
  v55 = v53;
  v83 = sub_2277675C4();
  v57 = v56;

  v58 = (void *)sub_227767744();
  v59 = objc_msgSend(v52, sel_bundleWithIdentifier_, v58, 0xE000000000000000);

  v60 = v59;
  if (!v59)
    v60 = objc_msgSend(v52, sel_mainBundle);
  v61 = v59;
  v84 = sub_2277675C4();
  v82 = v62;

  v63 = (void *)sub_227767744();
  v64 = objc_msgSend(v52, sel_bundleWithIdentifier_, v63, 0xE000000000000000);

  v65 = v64;
  if (!v64)
    v65 = objc_msgSend(v52, sel_mainBundle);
  v66 = v64;
  v67 = sub_2277675C4();
  v69 = v68;

  v70 = (void *)sub_227767744();
  v71 = objc_msgSend(v52, sel_bundleWithIdentifier_, v70, v49);

  v72 = v71;
  if (!v71)
    v72 = objc_msgSend(v52, sel_mainBundle);
  v73 = v71;
  v74 = sub_2277675C4();
  v86 = v75;
  v87 = v74;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F7F18);
  v76 = swift_allocObject();
  *(_OWORD *)(v76 + 16) = xmmword_227768C10;
  *(_QWORD *)(v76 + 32) = v67;
  *(_QWORD *)(v76 + 40) = v69;
  sub_2277678D0();
  *(_QWORD *)(v50 - 104) = 0;
  *(_QWORD *)(v50 - 96) = 0xE000000000000000;
  sub_227767774();
  sub_227767900();
  v77 = *(_QWORD *)(v50 - 104);
  v78 = *(_QWORD *)(v50 - 96);
  if (qword_2558F7DD0 != -1)
    swift_once();
  v79 = sub_227767678();
  __swift_project_value_buffer(v79, (uint64_t)qword_2558F8E48);
  v80 = sub_2277677EC();
  sub_227764D70(v80, 0xD00000000000001CLL, 0x800000022776B130, v77, v78);
  swift_bridgeObjectRelease();
  *(_QWORD *)v85 = v83;
  *(_QWORD *)(v85 + 8) = v57;
  *(_QWORD *)(v85 + 16) = v84;
  *(_QWORD *)(v85 + 24) = v82;
  *(_QWORD *)(v85 + 32) = v76;
  *(_QWORD *)(v85 + 40) = v87;
  *(_QWORD *)(v85 + 48) = v86;
  result = 0.0;
  *(_OWORD *)(v85 + 56) = 0u;
  *(_OWORD *)(v85 + 72) = 0u;
  *(_OWORD *)(v85 + 88) = 0u;
  *(_QWORD *)(v85 + 104) = 0;
  *(_QWORD *)(v85 + 112) = 0;
  *(_BYTE *)(v85 + 120) = 2;
  return result;
}

unint64_t sub_22775412C()
{
  unint64_t result;

  result = qword_2558F86B0;
  if (!qword_2558F86B0)
  {
    result = MEMORY[0x22E29CC34](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2558F86B0);
  }
  return result;
}

id sub_227754170()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedAnalytics);
  qword_2558F86B8 = (uint64_t)result;
  return result;
}

uint64_t sub_2277541A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t result;
  uint64_t v8;

  v0 = sub_22776760C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_227767600();
  v4 = objc_allocWithZone(MEMORY[0x24BE95C78]);
  v5 = (void *)sub_2277675F4();
  v6 = objc_msgSend(v4, sel_initWithNSUUID_, v5);

  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_2558F86C0 = (uint64_t)v6;
  return result;
}

void sub_227754260(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(objc_allocWithZone((Class)SetupSchemaProvisionalSiriSetupEvent), sel_init);
  if (v2)
  {
    v5 = v2;
    v3 = objc_msgSend(objc_allocWithZone((Class)SetupSchemaProvisionalSiriSetupEventMetadata), sel_init);
    if (v3)
    {
      v4 = v3;
      if (qword_2558F7DB8 != -1)
        swift_once();
      objc_msgSend(v4, sel_setSetupId_, qword_2558F86C0);
      objc_msgSend(v5, sel_setEventMetadata_, v4);
      objc_msgSend(v5, sel_setSiriSetupContext_, a1);
      objc_msgSend(objc_msgSend((id)objc_opt_self(), sel_sharedStream), sel_emitMessage_, v5);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

void sub_227754390()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  v0 = sub_22776760C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend(objc_allocWithZone((Class)SetupSchemaProvisionalSiriSetupContext), sel_init);
  if (v4)
  {
    v12 = v4;
    v5 = objc_msgSend(objc_allocWithZone((Class)SetupSchemaProvisionalSiriSetupStarted), sel_init);
    if (v5)
    {
      v6 = v5;
      if (qword_2558F7DB8 != -1)
        swift_once();
      sub_227767600();
      v7 = objc_allocWithZone(MEMORY[0x24BE95C78]);
      v8 = (void *)sub_2277675F4();
      v9 = objc_msgSend(v7, sel_initWithNSUUID_, v8);

      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      v10 = (void *)qword_2558F86C0;
      qword_2558F86C0 = (uint64_t)v9;

      objc_msgSend(v6, sel_setExists_, 1);
      objc_msgSend(v12, sel_setStarted_, v6);
      sub_227754260((uint64_t)v12);

    }
    else
    {

    }
  }
}

void sub_227754510(char *a1)
{
  uint64_t v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = *a1;
  v2 = objc_msgSend(objc_allocWithZone((Class)SetupSchemaProvisionalSiriSetupContext), sel_init);
  if (v2)
  {
    v6 = v2;
    v3 = objc_msgSend(objc_allocWithZone((Class)SetupSchemaProvisionalSiriSetupStep), sel_init);
    if (v3)
    {
      v4 = v3;
      objc_msgSend(v3, sel_setPage_, dword_22776923C[v1]);
      objc_msgSend(v6, sel_setStep_, v4);
      sub_227754260((uint64_t)v6);

      v5 = v4;
    }
    else
    {
      v5 = v6;
    }

  }
}

void sub_2277545C8(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  if (qword_2558F7DB0 != -1)
    swift_once();
  if (qword_2558F86B8)
    v2 = objc_msgSend((id)qword_2558F86B8, sel_newTurnBasedInstrumentationContext);
  else
    v2 = 0;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B28]), sel_init);
  objc_msgSend(v4, sel_setInvocationSource_, a1);
  v3 = v4;
  if (v4)
  {
    if (v2)
    {
      objc_msgSend(v2, sel_emitInstrumentation_, v4);

      v3 = v4;
    }
  }
  else
  {
    v3 = v2;
  }

}

id sub_227754694(_QWORD *a1)
{
  char *v1;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  objc_super v21;
  _BYTE v22[8];
  uint64_t v23;

  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup28DataSharingWelcomeController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup28DataSharingWelcomeController_orbView] = 0;
  v3 = (void *)sub_227767744();
  if (a1[3])
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  v21.receiver = v1;
  v21.super_class = (Class)type metadata accessor for DataSharingWelcomeController();
  v5 = objc_msgSendSuper2(&v21, sel_initWithTitle_detailText_icon_contentLayout_, v3, v4, 0, 2);

  v6 = (void *)objc_opt_self();
  v7 = v5;
  v8 = objc_msgSend(v6, sel_buttonWithType_, 1);
  v9 = objc_msgSend(v8, sel_titleLabel);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, sel_setAdjustsFontSizeToFitWidth_, 1);

  }
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  if (a1[8])
  {
    swift_bridgeObjectRetain();
    v11 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v8, sel_setTitle_forState_, v11, 0);

  objc_msgSend(v8, sel_addTarget_action_forControlEvents_, v7, sel_aboutDataSharingTapped, 64);
  v12 = objc_msgSend(v7, sel_headerView);
  objc_msgSend(v12, sel_addAccessoryButton_, v8);

  sub_227754C7C((uint64_t)(a1 + 4), (uint64_t)v22);
  sub_227754C7C((uint64_t)v22, (uint64_t)&v23);
  if (v23 && *(_QWORD *)(v23 + 16))
  {
    v13 = (void *)objc_opt_self();
    swift_bridgeObjectRetain();
    v14 = objc_msgSend(v13, sel_boldButton);
    v15 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_setTitle_forState_, v15, 0);

    objc_msgSend(v14, sel_addTarget_action_forControlEvents_, v7, sel_shareTapped, 64);
    v16 = objc_msgSend(v7, sel_buttonTray);
    objc_msgSend(v16, sel_addButton_, v14);

  }
  if (a1[6])
  {
    swift_bridgeObjectRetain();
    sub_227748A14((uint64_t)a1);
    v17 = objc_msgSend((id)objc_opt_self(), sel_linkButton);
    v18 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
    objc_msgSend(v17, sel_setTitle_forState_, v18, 0);

    objc_msgSend(v17, sel_addTarget_action_forControlEvents_, v7, sel_notNowTapped, 64);
    v19 = objc_msgSend(v7, sel_buttonTray);
    objc_msgSend(v19, sel_addButton_, v17);

  }
  else
  {

    sub_227748A14((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_227754B04(char *a1, uint64_t a2, void (*a3)(void))
{
  uint64_t result;
  char *v6;

  result = MEMORY[0x22E29CD18](&a1[OBJC_IVAR____TtC9SiriSetup28DataSharingWelcomeController_delegate]);
  if (result)
  {
    v6 = a1;
    a3();

    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_227754BC4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DataSharingWelcomeController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DataSharingWelcomeController()
{
  return objc_opt_self();
}

void *sub_227754C4C()
{
  _QWORD *v0;
  void *v1;
  id v2;

  v1 = *(void **)(*v0 + OBJC_IVAR____TtC9SiriSetup28DataSharingWelcomeController_orbView);
  v2 = v1;
  return v1;
}

uint64_t sub_227754C7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8700);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

char *sub_227754CC4(uint64_t a1)
{
  char *v1;
  void *v3;
  void *v4;
  id v5;
  id v6;
  char *v7;
  char *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  char *v22;
  objc_super v23;

  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup24SuccessWelcomeController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup24SuccessWelcomeController_orbView] = 0;
  v3 = (void *)sub_227767744();
  if (*(_QWORD *)(a1 + 24))
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  v23.receiver = v1;
  v23.super_class = (Class)type metadata accessor for SuccessWelcomeController();
  v5 = objc_msgSendSuper2(&v23, sel_initWithTitle_detailText_icon_contentLayout_, v3, v4, 0, 2);

  v6 = objc_allocWithZone((Class)type metadata accessor for OrbContainerView());
  v7 = (char *)v5;
  v8 = sub_22774C98C(1);
  v9 = objc_msgSend(v7, sel_headerView);
  v10 = objc_msgSend(v9, sel_customIconContainerView);

  if (v10)
  {
    objc_msgSend(v10, sel_addSubview_, v8);

  }
  v11 = objc_msgSend(v7, sel_headerView);
  v12 = objc_msgSend(v11, sel_customIconContainerView);

  if (v12)
  {
    objc_msgSend(v12, sel_setClipsToBounds_, 0);

  }
  v13 = *(void **)&v7[OBJC_IVAR____TtC9SiriSetup24SuccessWelcomeController_orbView];
  *(_QWORD *)&v7[OBJC_IVAR____TtC9SiriSetup24SuccessWelcomeController_orbView] = v8;
  v22 = v8;

  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    swift_bridgeObjectRetain();
  else
    v14 = MEMORY[0x24BEE4AF8];
  sub_227748A14(a1);
  v15 = *(_QWORD *)(v14 + 16);
  if (v15)
  {
    v16 = (void *)objc_opt_self();
    v17 = v14 + 40;
    do
    {
      swift_bridgeObjectRetain();
      v18 = objc_msgSend(v16, sel_boldButton, v22);
      v19 = (void *)sub_227767744();
      swift_bridgeObjectRelease();
      objc_msgSend(v18, sel_setTitle_forState_, v19, 0);

      objc_msgSend(v18, sel_addTarget_action_forControlEvents_, v7, sel_doneTapped, 64);
      v20 = objc_msgSend(v7, sel_buttonTray);
      objc_msgSend(v20, sel_addButton_, v18);

      v17 += 16;
      --v15;
    }
    while (v15);
  }

  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_227754FA0()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint64_t v5;

  result = MEMORY[0x22E29CD18](v0 + OBJC_IVAR____TtC9SiriSetup24SuccessWelcomeController_delegate);
  if (result)
  {
    v2 = result;
    if (qword_2558F7DD0 != -1)
      swift_once();
    v3 = sub_227767678();
    __swift_project_value_buffer(v3, (uint64_t)qword_2558F8E48);
    v4 = sub_2277677EC();
    sub_227764D70(v4, 0xD000000000000015, 0x800000022776AB10, 0xD000000000000015, 0x800000022776B3E0);
    if (MEMORY[0x22E29CD18](v2 + OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_delegate))
    {
      v5 = swift_retain();
      sub_2277493E0(v5);
      swift_unknownObjectRelease();
      swift_release();
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_227755140()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuccessWelcomeController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SuccessWelcomeController()
{
  return objc_opt_self();
}

void *sub_2277551C8()
{
  _QWORD *v0;
  void *v1;
  id v2;

  v1 = *(void **)(*v0 + OBJC_IVAR____TtC9SiriSetup24SuccessWelcomeController_orbView);
  v2 = v1;
  return v1;
}

char *sub_2277551F8(uint64_t a1)
{
  char *v1;
  char *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  char *v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  char *v20;
  id v21;
  void *v22;
  id v23;
  objc_super v25;

  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_orbView] = 0;
  v3 = &v1[OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_viewModel];
  v4 = *(_OWORD *)(a1 + 80);
  v5 = *(_OWORD *)(a1 + 96);
  v6 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v3 + 4) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v3 + 5) = v4;
  *((_OWORD *)v3 + 6) = v5;
  *(_OWORD *)(v3 + 105) = *(_OWORD *)(a1 + 105);
  v7 = *(_OWORD *)(a1 + 16);
  v8 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)v3 = *(_OWORD *)a1;
  *((_OWORD *)v3 + 1) = v7;
  *((_OWORD *)v3 + 2) = v8;
  *((_OWORD *)v3 + 3) = v6;
  sub_227748948(a1);
  v9 = (void *)sub_227767744();
  if (*(_QWORD *)(a1 + 24))
  {
    swift_bridgeObjectRetain();
    v10 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v25.receiver = v1;
  v25.super_class = (Class)type metadata accessor for VoiceTrainingWelcomeController();
  v11 = objc_msgSendSuper2(&v25, sel_initWithTitle_detailText_icon_contentLayout_, v9, v10, 0, 2);

  v12 = objc_allocWithZone((Class)type metadata accessor for OrbContainerView());
  v13 = (char *)v11;
  v14 = sub_22774C98C(1);
  v15 = objc_msgSend(v13, sel_headerView);
  v16 = objc_msgSend(v15, sel_customIconContainerView);

  if (v16)
  {
    objc_msgSend(v16, sel_addSubview_, v14);

  }
  v17 = objc_msgSend(v13, sel_headerView);
  v18 = objc_msgSend(v17, sel_customIconContainerView);

  if (v18)
  {
    objc_msgSend(v18, sel_setClipsToBounds_, 0);

  }
  v19 = *(void **)&v13[OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_orbView];
  *(_QWORD *)&v13[OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_orbView] = v14;
  v20 = v14;

  v21 = objc_msgSend((id)objc_opt_self(), sel_linkButton);
  if (*(_QWORD *)(a1 + 48))
  {
    swift_bridgeObjectRetain();
    v22 = (void *)sub_227767744();
    sub_227748A14(a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_227748A14(a1);
    v22 = 0;
  }
  objc_msgSend(v21, sel_setTitle_forState_, v22, 0);

  objc_msgSend(v21, sel_addTarget_action_forControlEvents_, v13, sel_secondaryButtonTapped, 64);
  v23 = objc_msgSend(v13, sel_buttonTray);
  objc_msgSend(v23, sel_addButton_, v21);

  return v13;
}

void sub_2277554D4(uint64_t *a1, char a2)
{
  char *v2;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  os_log_type_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  os_log_type_t v18;
  id v19;
  id v20;

  v5 = &v2[OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_viewModel];
  v6 = *a1;
  v7 = a1[1];
  v8 = *(_QWORD *)&v2[OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_viewModel] == *a1
    && *(_QWORD *)&v2[OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_viewModel + 8] == v7;
  if (!v8 && (sub_227767990() & 1) == 0)
  {
    sub_2277678D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_227767774();
    swift_bridgeObjectRelease();
    if (qword_2558F7DD0 != -1)
      swift_once();
    v9 = sub_227767678();
    __swift_project_value_buffer(v9, (uint64_t)qword_2558F8E48);
    v10 = sub_2277677EC();
    sub_227764D70(v10, 0xD000000000000013, 0x800000022776AEF0, 0xD000000000000013, 0x800000022776AF10);
    swift_bridgeObjectRelease();
    sub_2277559B0(v6, v7, a2 & 1);
  }
  v11 = *((_QWORD *)v5 + 10);
  v13 = a1[9];
  v12 = a1[10];
  if (!v11)
  {
    if (!v12)
      return;
    goto LABEL_18;
  }
  if (!v12 || (*((_QWORD *)v5 + 9) == v13 ? (v14 = v11 == v12) : (v14 = 0), !v14 && (sub_227767990() & 1) == 0))
  {
LABEL_18:
    sub_2277678D0();
    swift_bridgeObjectRelease();
    if (v12)
      v15 = v13;
    else
      v15 = 0;
    if (v12)
      v16 = v12;
    else
      v16 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_227767774();
    swift_bridgeObjectRelease();
    if (qword_2558F7DD0 != -1)
      swift_once();
    v17 = sub_227767678();
    __swift_project_value_buffer(v17, (uint64_t)qword_2558F8E48);
    v18 = sub_2277677EC();
    sub_227764D70(v18, 0xD000000000000013, 0x800000022776AEF0, 0xD00000000000001ELL, 0x800000022776AF30);
    swift_bridgeObjectRelease();
    *((_QWORD *)v5 + 9) = v15;
    *((_QWORD *)v5 + 10) = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v19 = objc_msgSend(v2, sel_navigationItem);
    v20 = (id)sub_227767744();
    objc_msgSend(v19, sel_setTitle_, v20);
    swift_bridgeObjectRelease();

  }
}

uint64_t sub_227755868()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint64_t v5;

  result = MEMORY[0x22E29CD18](v0 + OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_delegate);
  if (result)
  {
    v2 = result;
    if (qword_2558F7DD0 != -1)
      swift_once();
    v3 = sub_227767678();
    __swift_project_value_buffer(v3, (uint64_t)qword_2558F8E48);
    v4 = sub_2277677EC();
    sub_227764D70(v4, 0xD000000000000017, 0x800000022776AAD0, 0xD00000000000001ALL, 0x800000022776AF70);
    if (MEMORY[0x22E29CD18](v2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_delegate))
    {
      v5 = swift_retain();
      sub_227749560(v5);
      swift_unknownObjectRelease();
      swift_release();
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_2277559B0(uint64_t a1, uint64_t a2, char a3)
{
  char *v3;
  char *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  double v13;
  id v14;
  void *v15;
  id v16;
  id *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v5 = &v3[OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_viewModel];
  *(_QWORD *)v5 = a1;
  *((_QWORD *)v5 + 1) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v3, sel_headerView);
  v7 = (void *)sub_227767744();
  objc_msgSend(v6, sel_setTitle_, v7);

  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE57E8]), sel_init);
  v9 = *MEMORY[0x24BDE5D20];
  v10 = (void *)objc_opt_self();
  v11 = v8;
  v12 = objc_msgSend(v10, sel_functionWithName_, v9);
  objc_msgSend(v11, sel_setTimingFunction_, v12);

  v13 = 0.2;
  if ((a3 & 1) == 0)
    v13 = 0.0;
  objc_msgSend(v11, sel_setDuration_, v13);
  objc_msgSend(v11, sel_setType_, *MEMORY[0x24BDE5E30]);
  v14 = objc_msgSend(v3, sel_view);
  if (v14)
  {
    v15 = v14;
    v16 = objc_msgSend(v14, sel_semanticContentAttribute);

    v17 = (id *)MEMORY[0x24BDE5E10];
    if (v16 != (id)4)
      v17 = (id *)MEMORY[0x24BDE5E18];
    v18 = *v17;
    objc_msgSend(v11, sel_setSubtype_, v18);

    v19 = objc_msgSend(v3, sel_headerView);
    v20 = objc_msgSend(v19, sel_layer);

    objc_msgSend(v20, sel_removeAllAnimations);
    v21 = objc_msgSend(v3, sel_headerView);
    v22 = objc_msgSend(v21, sel_layer);

    objc_msgSend(v22, sel_addAnimation_forKey_, v11, *MEMORY[0x24BDE5DF8]);
  }
  else
  {
    __break(1u);
  }
}

id sub_227755C84()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VoiceTrainingWelcomeController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for VoiceTrainingWelcomeController()
{
  return objc_opt_self();
}

void *sub_227755D54()
{
  _QWORD *v0;
  void *v1;
  id v2;

  v1 = *(void **)(*v0 + OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_orbView);
  v2 = v1;
  return v1;
}

void sub_227755D84(uint64_t *a1, char a2)
{
  sub_2277554D4(a1, a2);
}

uint64_t sub_227755DA4(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

id sub_227755DE0(uint64_t a1)
{
  char *v1;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  objc_super v17;

  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_orbView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_player] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_playerLooper] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_playerViewController] = 0;
  v3 = (void *)sub_227767744();
  if (*(_QWORD *)(a1 + 24))
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  v17.receiver = v1;
  v17.super_class = (Class)type metadata accessor for EducationWelcomeController();
  v5 = objc_msgSendSuper2(&v17, sel_initWithTitle_detailText_icon_contentLayout_, v3, v4, 0, 2);

  v6 = v5;
  v7 = objc_msgSend(v6, sel_headerView);
  objc_msgSend(v7, sel_setAlpha_, 0.0);

  v8 = objc_msgSend(v6, sel_contentView);
  objc_msgSend(v8, sel_setAlpha_, 0.0);

  sub_227756424();
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    swift_bridgeObjectRetain();
  else
    v9 = MEMORY[0x24BEE4AF8];
  sub_227748A14(a1);
  v10 = *(_QWORD *)(v9 + 16);
  if (v10)
  {
    v11 = (void *)objc_opt_self();
    v12 = v9 + 40;
    do
    {
      swift_bridgeObjectRetain();
      v13 = objc_msgSend(v11, sel_boldButton);
      v14 = (void *)sub_227767744();
      swift_bridgeObjectRelease();
      objc_msgSend(v13, sel_setTitle_forState_, v14, 0);

      objc_msgSend(v13, sel_addTarget_action_forControlEvents_, v6, sel_continueTapped, 64);
      v15 = objc_msgSend(v6, sel_buttonTray);
      objc_msgSend(v15, sel_addButton_, v13);

      v12 += 16;
      --v10;
    }
    while (v10);
  }

  swift_bridgeObjectRelease();
  return v6;
}

void sub_22775605C(char a1)
{
  void *v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  objc_super v20;

  v20.receiver = v1;
  v20.super_class = (Class)type metadata accessor for EducationWelcomeController();
  objc_msgSendSuper2(&v20, sel_viewDidAppear_, a1 & 1);
  v3 = (void *)objc_opt_self();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v1;
  v18 = sub_227756E1C;
  v19 = v4;
  v5 = MEMORY[0x24BDAC760];
  v14 = MEMORY[0x24BDAC760];
  v15 = 1107296256;
  v16 = sub_22775FF30;
  v17 = &block_descriptor_2;
  v6 = _Block_copy(&v14);
  v7 = v1;
  swift_release();
  objc_msgSend(v3, sel_animateWithDuration_delay_options_animations_completion_, 0, v6, 0, 0.4, 0.0);
  _Block_release(v6);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  v18 = sub_227756E54;
  v19 = v8;
  v14 = v5;
  v15 = 1107296256;
  v16 = sub_22775FF30;
  v17 = &block_descriptor_6_1;
  v9 = _Block_copy(&v14);
  v10 = v7;
  swift_release();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v18 = sub_227756E74;
  v19 = v11;
  v14 = v5;
  v15 = 1107296256;
  v16 = sub_227755DA4;
  v17 = &block_descriptor_12_0;
  v12 = _Block_copy(&v14);
  v13 = v10;
  swift_release();
  objc_msgSend(v3, sel_animateWithDuration_delay_options_animations_completion_, 0, v9, v12, 0.4, 0.3);
  _Block_release(v12);
  _Block_release(v9);
}

uint64_t sub_22775629C()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint64_t v5;

  result = MEMORY[0x22E29CD18](v0 + OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_delegate);
  if (result)
  {
    v2 = result;
    if (qword_2558F7DD0 != -1)
      swift_once();
    v3 = sub_227767678();
    __swift_project_value_buffer(v3, (uint64_t)qword_2558F8E48);
    v4 = sub_2277677EC();
    sub_227764D70(v4, 0xD000000000000015, 0x800000022776AB10, 0xD000000000000017, 0x800000022776B5C0);
    if (MEMORY[0x22E29CD18](v2 + OBJC_IVAR____TtC9SiriSetup18EducationPresenter_delegate))
    {
      v5 = swift_retain();
      sub_2277493E0(v5);
      swift_unknownObjectRelease();
      swift_release();
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_2277563E4(void *a1, SEL *a2)
{
  id v2;

  v2 = objc_msgSend(a1, *a2);
  objc_msgSend(v2, sel_setAlpha_, 1.0);

}

void sub_227756424()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t ObjCClassFromMetadata;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  void *v64;
  uint64_t v65;
  os_log_type_t v66;
  uint64_t v67;
  os_log_type_t v68;
  uint64_t v69;
  os_log_type_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;

  v1 = v0;
  v2 = sub_2277675E8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend((id)objc_opt_self(), sel_currentTraitCollection);
  objc_msgSend(v6, sel_userInterfaceStyle);

  v75 = 0xD00000000000001BLL;
  v76 = 0x800000022776B500;
  sub_227767774();
  swift_bridgeObjectRelease();
  swift_getObjectType();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v74 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v8 = (void *)sub_227767744();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_227767744();
  v10 = objc_msgSend(v74, sel_pathForResource_ofType_, v8, v9);

  if (v10)
  {
    sub_227767750();

    sub_2277675D0();
    swift_bridgeObjectRelease();
    v11 = objc_allocWithZone(MEMORY[0x24BDB2618]);
    v12 = (void *)sub_2277675DC();
    v13 = objc_msgSend(v11, sel_initWithURL_, v12);

    v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB2670]), sel_initWithPlayerItem_, v13);
    v15 = OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_player;
    v16 = *(void **)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_player];
    *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_player] = v14;

    v17 = *(void **)&v1[v15];
    if (v17)
    {
      v18 = objc_allocWithZone(MEMORY[0x24BDB27C0]);
      v19 = v17;
      v20 = objc_msgSend(v18, sel_init);
      v21 = OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_playerViewController;
      v22 = *(void **)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_playerViewController];
      *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_playerViewController] = v20;

      v23 = *(void **)&v1[v21];
      if (v23)
      {
        v24 = v23;
        objc_msgSend(v24, sel_setShowsPlaybackControls_, 0);
        objc_msgSend(v24, sel_setAllowsPictureInPicturePlayback_, 0);
        v25 = objc_msgSend(v24, sel_view);
        if (v25)
        {
          v26 = v25;
          objc_msgSend(v25, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

          v27 = objc_msgSend(v24, sel_view);
          if (v27)
          {
            v28 = v27;
            v29 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
            objc_msgSend(v28, sel_setBackgroundColor_, v29);

            v30 = objc_msgSend(v1, sel_contentView);
            v31 = objc_msgSend(v24, sel_view);
            if (v31)
            {
              v32 = v31;
              v71 = v19;
              v72 = v3;
              v73 = v2;
              objc_msgSend(v30, sel_addSubview_, v31);

              __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8590);
              v33 = swift_allocObject();
              *(_OWORD *)(v33 + 16) = xmmword_227769320;
              v34 = objc_msgSend(v24, sel_view);
              if (v34)
              {
                v35 = v34;
                v36 = objc_msgSend(v34, sel_topAnchor);

                v37 = objc_msgSend(v1, sel_contentView);
                v38 = objc_msgSend(v37, sel_topAnchor);

                v39 = objc_msgSend(v36, sel_constraintEqualToAnchor_constant_, v38, 60.0);
                *(_QWORD *)(v33 + 32) = v39;
                v40 = objc_msgSend(v24, sel_view);
                if (v40)
                {
                  v41 = v40;
                  v42 = objc_msgSend(v40, sel_centerXAnchor);

                  v43 = objc_msgSend(v1, sel_contentView);
                  v44 = objc_msgSend(v43, sel_centerXAnchor);

                  v45 = objc_msgSend(v42, sel_constraintEqualToAnchor_, v44);
                  *(_QWORD *)(v33 + 40) = v45;
                  v46 = objc_msgSend(v24, sel_view);
                  if (v46)
                  {
                    v47 = v46;
                    v48 = objc_msgSend(v46, sel_heightAnchor);

                    v49 = objc_msgSend(v48, sel_constraintEqualToConstant_, 332.67);
                    *(_QWORD *)(v33 + 48) = v49;
                    v50 = objc_msgSend(v24, sel_view);
                    if (v50)
                    {
                      v51 = v50;
                      v52 = (void *)objc_opt_self();
                      v53 = objc_msgSend(v51, sel_widthAnchor);

                      v54 = objc_msgSend(v53, sel_constraintEqualToConstant_, 263.3);
                      *(_QWORD *)(v33 + 56) = v54;
                      v75 = v33;
                      sub_2277677BC();
                      sub_2277508E0();
                      v55 = (void *)sub_227767798();
                      swift_bridgeObjectRelease();
                      objc_msgSend(v52, sel_activateConstraints_, v55);

                      v56 = v71;
                      objc_msgSend(v24, sel_setPlayer_, v71);
                      v57 = MEMORY[0x24BDC0D68];
                      v58 = *MEMORY[0x24BDC0D68];
                      v59 = *(_QWORD *)(MEMORY[0x24BDC0D68] + 16);
                      v60 = *(_QWORD *)(MEMORY[0x24BDC0D68] + 24);
                      v61 = *(_QWORD *)(MEMORY[0x24BDC0D68] + 40);
                      v62 = objc_allocWithZone(MEMORY[0x24BDB2650]);
                      v75 = v58;
                      v76 = *(_QWORD *)(v57 + 8);
                      v77 = v59;
                      v78 = v60;
                      v79 = *(_QWORD *)(v57 + 32);
                      v80 = v61;
                      v63 = objc_msgSend(v62, sel_initWithPlayer_templateItem_timeRange_, v56, v13, &v75);
                      v64 = *(void **)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_playerLooper];
                      *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_playerLooper] = v63;

                      (*(void (**)(char *, uint64_t))(v72 + 8))(v5, v73);
                      return;
                    }
                    goto LABEL_28;
                  }
LABEL_27:
                  __break(1u);
LABEL_28:
                  __break(1u);
                  return;
                }
LABEL_26:
                __break(1u);
                goto LABEL_27;
              }
LABEL_25:
              __break(1u);
              goto LABEL_26;
            }
LABEL_24:
            __break(1u);
            goto LABEL_25;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
        goto LABEL_24;
      }
      if (qword_2558F7DD0 != -1)
        swift_once();
      v69 = sub_227767678();
      __swift_project_value_buffer(v69, (uint64_t)qword_2558F8E48);
      v70 = sub_2277677E0();
      sub_227764D70(v70, 0xD000000000000012, 0x800000022776B520, 0xD000000000000026, 0x800000022776B590);

    }
    else
    {
      if (qword_2558F7DD0 != -1)
        swift_once();
      v67 = sub_227767678();
      __swift_project_value_buffer(v67, (uint64_t)qword_2558F8E48);
      v68 = sub_2277677E0();
      sub_227764D70(v68, 0xD000000000000012, 0x800000022776B520, 0xD00000000000001DLL, 0x800000022776B570);

    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return;
  }
  if (qword_2558F7DD0 != -1)
    swift_once();
  v65 = sub_227767678();
  __swift_project_value_buffer(v65, (uint64_t)qword_2558F8E48);
  v66 = sub_2277677E0();
  sub_227764D70(v66, 0xD000000000000012, 0x800000022776B520, 0xD000000000000023, 0x800000022776B540);

}

id sub_227756D10()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EducationWelcomeController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for EducationWelcomeController()
{
  return objc_opt_self();
}

void *sub_227756DC8()
{
  _QWORD *v0;
  void *v1;
  id v2;

  v1 = *(void **)(*v0 + OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_orbView);
  v2 = v1;
  return v1;
}

uint64_t sub_227756DF8()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_227756E1C()
{
  uint64_t v0;

  sub_2277563E4(*(void **)(v0 + 16), (SEL *)&selRef_headerView);
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

void sub_227756E54()
{
  uint64_t v0;

  sub_2277563E4(*(void **)(v0 + 16), (SEL *)&selRef_contentView);
}

id sub_227756E74(double a1)
{
  uint64_t v1;
  id result;

  result = *(id *)(*(_QWORD *)(v1 + 16) + OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_player);
  if (result)
  {
    LODWORD(a1) = 1.0;
    return objc_msgSend(result, sel_playImmediatelyAtRate_, a1);
  }
  return result;
}

id sub_227756EB4(uint64_t a1)
{
  _BYTE *v1;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  id v59;
  objc_super v60;

  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_orbView] = 0;
  v1[OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_isLoading] = 0;
  v3 = &v1[OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_viewModel];
  v4 = *(_OWORD *)(a1 + 80);
  v3[4] = *(_OWORD *)(a1 + 64);
  v3[5] = v4;
  v3[6] = *(_OWORD *)(a1 + 96);
  *(_OWORD *)((char *)v3 + 105) = *(_OWORD *)(a1 + 105);
  v5 = *(_OWORD *)(a1 + 16);
  *v3 = *(_OWORD *)a1;
  v3[1] = v5;
  v6 = *(_OWORD *)(a1 + 48);
  v3[2] = *(_OWORD *)(a1 + 32);
  v3[3] = v6;
  sub_227748948(a1);
  v7 = (void *)sub_227767744();
  v8 = (void *)objc_opt_self();
  v9 = objc_msgSend(v8, sel_bundleWithIdentifier_, v7);

  v10 = (void *)sub_227767744();
  v11 = (void *)objc_opt_self();
  v12 = objc_msgSend(v11, sel_imageNamed_inBundle_withConfiguration_, v10, v9, 0);

  v13 = (void *)sub_227767744();
  if (*(_QWORD *)(a1 + 24))
  {
    swift_bridgeObjectRetain();
    v14 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  v60.receiver = v1;
  v60.super_class = (Class)type metadata accessor for IntroWelcomeController();
  v55 = v12;
  v15 = objc_msgSendSuper2(&v60, sel_initWithTitle_detailText_icon_contentLayout_, v13, v14, v12, 2);

  v16 = v15;
  v17 = (void *)sub_227767744();
  v18 = objc_msgSend(v11, sel__systemImageNamed_, v17);

  v58 = a1;
  if (v18)
  {
    v56 = v16;
    v19 = (void *)sub_227767744();
    v20 = objc_msgSend(v8, sel_bundleWithIdentifier_, v19);

    v21 = v20;
    if (!v20)
      v21 = objc_msgSend(v8, sel_mainBundle);
    v22 = v20;
    sub_2277675C4();

    v23 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
    v24 = (void *)sub_227767744();
    v25 = objc_msgSend(v8, sel_bundleWithIdentifier_, v24, 0xE000000000000000);

    v26 = v25;
    if (!v25)
      v26 = objc_msgSend(v8, sel_mainBundle);
    v27 = v25;
    sub_2277675C4();

    v28 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
    objc_msgSend(v56, sel_addBulletedListItemWithTitle_description_image_, v23, v28, v18, 0xE000000000000000);

    a1 = v58;
  }
  v29 = (void *)sub_227767744();
  v30 = objc_msgSend(v11, sel__systemImageNamed_, v29);

  if (v30)
  {
    v57 = v16;
    v31 = (void *)sub_227767744();
    v32 = objc_msgSend(v8, sel_bundleWithIdentifier_, v31);

    v33 = v32;
    if (!v32)
      v33 = objc_msgSend(v8, sel_mainBundle);
    v34 = v32;
    sub_2277675C4();

    v35 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
    v36 = (void *)sub_227767744();
    v37 = objc_msgSend(v8, (SEL)&selRef_registerClass_forCellReuseIdentifier_ + 7, v36, 0xE000000000000000);

    v38 = v37;
    if (!v37)
      v38 = objc_msgSend(v8, sel_mainBundle);
    v39 = v37;
    sub_2277675C4();

    v40 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
    objc_msgSend(v57, sel_addBulletedListItemWithTitle_description_image_, v35, v40, v30, 0xE000000000000000);

    a1 = v58;
  }
  if (*(_QWORD *)(a1 + 32))
    v41 = *(_QWORD *)(a1 + 32);
  else
    v41 = MEMORY[0x24BEE4AF8];
  v42 = *(_QWORD *)(v41 + 16);
  if (v42)
  {
    v59 = (id)objc_opt_self();
    swift_bridgeObjectRetain();
    v43 = v41 + 40;
    do
    {
      swift_bridgeObjectRetain();
      v44 = objc_msgSend(v59, sel_boldButton);
      v45 = (void *)sub_227767744();
      swift_bridgeObjectRelease();
      objc_msgSend(v44, sel_setTitle_forState_, v45, 0);

      objc_msgSend(v44, sel_addTarget_action_forControlEvents_, v16, sel_continueTapped, 64);
      v46 = objc_msgSend(v16, sel_buttonTray);
      objc_msgSend(v46, sel_addButton_, v44);

      v43 += 16;
      --v42;
    }
    while (v42);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  v47 = objc_msgSend((id)objc_opt_self(), sel_linkButton);
  if (*(_QWORD *)(v58 + 48))
  {
    swift_bridgeObjectRetain();
    v48 = (void *)sub_227767744();
    sub_227748A14(v58);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_227748A14(v58);
    v48 = 0;
  }
  objc_msgSend(v47, sel_setTitle_forState_, v48, 0);

  objc_msgSend(v47, (SEL)&stru_24EFD50F0.type + 2, v16, sel_skipTapped, 64);
  v49 = objc_msgSend(v16, sel_buttonTray);
  objc_msgSend(v49, sel_addButton_, v47);

  v50 = (void *)objc_opt_self();
  v51 = (void *)sub_227767744();
  v52 = objc_msgSend(v50, sel_linkWithBundleIdentifier_, v51);

  v53 = objc_msgSend(v16, sel_buttonTray);
  objc_msgSend(v53, sel_setPrivacyLinkController_, v52);

  *((_BYTE *)v16 + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_isLoading) = 0;
  return v16;
}

void sub_227757764()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;

  v1 = OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_isLoading;
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_isLoading) & 1) != 0)
  {
    if (qword_2558F7DD0 != -1)
      swift_once();
    v2 = sub_227767678();
    __swift_project_value_buffer(v2, (uint64_t)qword_2558F8E48);
    v3 = sub_2277677EC();
    sub_227764D70(v3, 0xD000000000000010, 0x800000022776B680, 0xD000000000000028, 0x800000022776B650);
  }
  else if (MEMORY[0x22E29CD18](v0 + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_delegate))
  {
    sub_227752E1C();
    swift_unknownObjectRelease();
  }
  *(_BYTE *)(v0 + v1) = 1;
}

void sub_227757878()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;

  v1 = OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_isLoading;
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_isLoading) & 1) != 0)
  {
    if (qword_2558F7DD0 != -1)
      swift_once();
    v2 = sub_227767678();
    __swift_project_value_buffer(v2, (uint64_t)qword_2558F8E48);
    v3 = sub_2277677EC();
    sub_227764D70(v3, 0x7070615470696B73, 0xEC00000029286465, 0xD000000000000028, 0x800000022776B650);
  }
  else if (MEMORY[0x22E29CD18](v0 + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_delegate))
  {
    sub_227752FF4();
    swift_unknownObjectRelease();
  }
  *(_BYTE *)(v0 + v1) = 1;
}

void sub_22775798C()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD398]), sel_initWithActivityIndicatorStyle_, 100);
  objc_msgSend(v1, sel_startAnimating);
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD410]), sel_initWithCustomView_, v1);
  v3 = objc_msgSend(v0, sel_navigationItem);
  objc_msgSend(v3, sel_setRightBarButtonItem_animated_, v2, 1);

  v4 = objc_msgSend(v0, sel_buttonTray);
  objc_msgSend(v4, sel_showButtonsBusy);

}

id sub_227757AC4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntroWelcomeController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IntroWelcomeController()
{
  return objc_opt_self();
}

void *sub_227757B94()
{
  _QWORD *v0;
  void *v1;
  id v2;

  v1 = *(void **)(*v0 + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_orbView);
  v2 = v1;
  return v1;
}

uint64_t sub_227757BC4(uint64_t a1)
{
  return sub_227757BE4(a1);
}

uint64_t sub_227757BE4(uint64_t a1)
{
  uint64_t v1;
  _OWORD *v3;
  int v4;
  int v5;
  int v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v17[6];
  _OWORD v18[2];

  v3 = (_OWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_viewModel);
  v4 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_viewModel + 120);
  v5 = *(unsigned __int8 *)(a1 + 120);
  if (v4 == 2)
  {
    if (v5 == 2)
      goto LABEL_8;
    v6 = v5 & 1;
  }
  else
  {
    if (v5 == 2)
      goto LABEL_8;
    v6 = v5 & 1;
    if ((((v6 == 0) ^ v4) & 1) != 0)
      goto LABEL_8;
  }
  if (v6)
    sub_22775798C();
LABEL_8:
  v7 = v3[5];
  v17[4] = v3[4];
  v17[5] = v7;
  v18[0] = v3[6];
  *(_OWORD *)((char *)v18 + 9) = *(_OWORD *)((char *)v3 + 105);
  v8 = v3[1];
  v17[0] = *v3;
  v17[1] = v8;
  v9 = v3[3];
  v17[2] = v3[2];
  v17[3] = v9;
  v10 = *(_OWORD *)a1;
  v11 = *(_OWORD *)(a1 + 16);
  v12 = *(_OWORD *)(a1 + 48);
  v3[2] = *(_OWORD *)(a1 + 32);
  v3[3] = v12;
  *v3 = v10;
  v3[1] = v11;
  v13 = *(_OWORD *)(a1 + 64);
  v14 = *(_OWORD *)(a1 + 80);
  v15 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)((char *)v3 + 105) = *(_OWORD *)(a1 + 105);
  v3[5] = v14;
  v3[6] = v15;
  v3[4] = v13;
  sub_227748948(a1);
  return sub_227748A14((uint64_t)v17);
}

char *sub_227757CBC(_BYTE *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  _BYTE *v5;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  _BYTE *v46;
  __int128 *v47;
  char v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  char *v55;
  char *v56;
  char *v57;
  char *v58;
  char **v59;
  void *v60;
  uint64_t v62;
  char *v63;
  _BYTE *v64;
  objc_super v66;
  _OWORD v67[6];
  _OWORD v68[3];

  *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v10 = &v5[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_presentingViewController];
  *v10 = 0;
  v10[1] = 0;
  v11 = &v5[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_dataSource];
  *v11 = a1;
  v11[1] = a2;
  v12 = &v5[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_dataSourceWriter];
  *v12 = a3;
  v12[1] = a4;
  v5[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewStyle] = 0x20100u >> (8
                                                                                 * a1[OBJC_IVAR____TtC9SiriSetup8Defaults_enrollmentMode]);
  v13 = v5;
  v64 = a1;
  v63 = a3;
  v14 = (void *)sub_227767744();
  v15 = (void *)objc_opt_self();
  v16 = objc_msgSend(v15, sel_bundleWithIdentifier_, v14);

  v17 = v16;
  if (!v16)
    v17 = objc_msgSend(v15, sel_mainBundle);
  v18 = v16;
  v62 = sub_2277675C4();
  v20 = v19;

  v21 = (void *)sub_227767744();
  v22 = objc_msgSend(v15, sel_bundleWithIdentifier_, v21, 0xE000000000000000);

  v23 = v22;
  if (!v22)
    v23 = objc_msgSend(v15, sel_mainBundle);
  v24 = v22;
  v25 = sub_2277675C4();
  v27 = v26;

  v28 = (void *)sub_227767744();
  v29 = objc_msgSend(v15, sel_bundleWithIdentifier_, v28, 0xE000000000000000);

  v30 = v29;
  if (!v29)
    v30 = objc_msgSend(v15, sel_mainBundle);
  v31 = v29;
  v32 = sub_2277675C4();
  v34 = v33;

  v35 = &v13[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewModel];
  *(_QWORD *)v35 = v62;
  *((_QWORD *)v35 + 1) = v20;
  *((_QWORD *)v35 + 2) = 0;
  *((_QWORD *)v35 + 3) = 0;
  *((_QWORD *)v35 + 4) = 0;
  *((_QWORD *)v35 + 5) = v32;
  *((_QWORD *)v35 + 6) = v34;
  *(_OWORD *)(v35 + 56) = 0u;
  *(_OWORD *)(v35 + 72) = 0u;
  *((_QWORD *)v35 + 11) = v25;
  *((_QWORD *)v35 + 12) = v27;
  *((_QWORD *)v35 + 13) = 0;
  *((_QWORD *)v35 + 14) = 0;
  v35[120] = 2;
  *(_QWORD *)&v13[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_page] = a5;
  v36 = *(_QWORD *)&v63[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriLanguage + 8];
  if (v36)
  {
    v37 = &v13[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_languageOption];
    *(_QWORD *)v37 = *(_QWORD *)&v63[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriLanguage];
    *((_QWORD *)v37 + 1) = v36;
    swift_retain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v38 = (void *)objc_opt_self();
    swift_retain();
    v39 = objc_msgSend(v38, sel_sharedPreferences, 0xE000000000000000);
    v40 = objc_msgSend(v39, sel_languageCode);

    if (v40)
    {
      v41 = sub_227767750();
      v43 = v42;

    }
    else
    {
      v41 = sub_227763734();
      v43 = v44;
    }
    v45 = (uint64_t *)&v13[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_languageOption];
    *v45 = v41;
    v45[1] = v43;
  }

  v66.receiver = v13;
  v66.super_class = (Class)type metadata accessor for VoiceSelectionPresenter();
  v46 = objc_msgSendSuper2(&v66, sel_init);
  v47 = (__int128 *)&v46[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewModel];
  v48 = v46[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewStyle];
  swift_beginAccess();
  v49 = *v47;
  v50 = v47[1];
  v51 = v47[3];
  v67[2] = v47[2];
  v67[3] = v51;
  v67[0] = v49;
  v67[1] = v50;
  v52 = v47[4];
  v53 = v47[5];
  v54 = v47[6];
  *(_OWORD *)((char *)v68 + 9) = *(__int128 *)((char *)v47 + 105);
  v68[0] = v54;
  v67[4] = v52;
  v67[5] = v53;
  v55 = v46;
  sub_227748948((uint64_t)v67);
  v56 = sub_2277581B4(v48, v67);
  v58 = v57;

  swift_release();
  sub_227748A14((uint64_t)v67);
  v59 = (char **)&v55[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_presentingViewController];
  v60 = *(void **)&v55[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_presentingViewController];
  *v59 = v56;
  v59[1] = v58;

  return v55;
}

char *sub_2277581B4(char a1, _QWORD *a2)
{
  uint64_t v2;
  os_log_type_t v3;
  char *v4;

  if (a1)
  {
    sub_2277678D0();
    sub_227767774();
    sub_227767900();
    sub_227767774();
    if (qword_2558F7DD0 != -1)
      swift_once();
    v2 = sub_227767678();
    __swift_project_value_buffer(v2, (uint64_t)qword_2558F8E48);
    v3 = sub_2277677E0();
    sub_227764D70(v3, 0xD000000000000030, 0x8000000227769D20, 0, 0xE000000000000000);
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    objc_allocWithZone((Class)type metadata accessor for VoiceSelectionWelcomeController());
    sub_227748948((uint64_t)a2);
    swift_bridgeObjectRetain();
    v4 = sub_22774D00C(a2);
    *(_QWORD *)&v4[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_delegate + 8] = &off_24EFD0920;
    swift_unknownObjectWeakAssign();
  }
  return v4;
}

id sub_2277583A0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VoiceSelectionPresenter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for VoiceSelectionPresenter()
{
  return objc_opt_self();
}

double sub_2277584B4@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  __int128 *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[2];

  v3 = (__int128 *)(v1 + OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewModel);
  swift_beginAccess();
  v4 = v3[5];
  v15 = v3[4];
  v16 = v4;
  v17[0] = v3[6];
  *(_OWORD *)((char *)v17 + 9) = *(__int128 *)((char *)v3 + 105);
  v5 = v3[1];
  v11 = *v3;
  v12 = v5;
  v6 = v3[3];
  v13 = v3[2];
  v14 = v6;
  sub_227748948((uint64_t)&v11);
  v7 = v16;
  a1[4] = v15;
  a1[5] = v7;
  a1[6] = v17[0];
  *(_OWORD *)((char *)a1 + 105) = *(_OWORD *)((char *)v17 + 9);
  v8 = v12;
  *a1 = v11;
  a1[1] = v8;
  result = *(double *)&v13;
  v10 = v14;
  a1[2] = v13;
  a1[3] = v10;
  return result;
}

uint64_t (*sub_22775855C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void *sub_2277585A0()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_presentingViewController);
  v2 = v1;
  return v1;
}

uint64_t sub_2277585D4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  uint64_t v5;
  os_log_type_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t result;
  uint64_t v11;

  v2 = v1;
  sub_2277678D0();
  swift_bridgeObjectRelease();
  v4 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8018);
  sub_22776775C();
  sub_227767774();
  swift_bridgeObjectRelease();
  if (qword_2558F7DD0 != -1)
    swift_once();
  v5 = sub_227767678();
  __swift_project_value_buffer(v5, (uint64_t)qword_2558F8E48);
  v6 = sub_2277677EC();
  sub_227764D70(v6, 0xD00000000000001BLL, 0x800000022776B830, 0xD000000000000016, 0x800000022776B850);
  swift_bridgeObjectRelease();
  if (a1)
  {
    v7 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_dataSourceWriter);
    v8 = *(void **)(v7 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriVoice);
    *(_QWORD *)(v7 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriVoice) = a1;
    v9 = v4;

  }
  result = MEMORY[0x22E29CD18](v2 + OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_delegate);
  if (result)
  {
    v11 = swift_retain();
    sub_2277493E0(v11);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t SiriSetupEnrollmentResult.siriEnabled.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t SiriSetupEnrollmentResult.siriEnabled.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*SiriSetupEnrollmentResult.siriEnabled.modify())()
{
  return nullsub_1;
}

uint64_t getEnumTagSinglePayload for SiriSetupEnrollmentResult(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriSetupEnrollmentResult(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_227758870 + 4 * byte_227769405[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2277588A4 + 4 * byte_227769400[v4]))();
}

uint64_t sub_2277588A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2277588AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2277588B4);
  return result;
}

uint64_t sub_2277588C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2277588C8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2277588CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2277588D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriSetupEnrollmentResult()
{
  return &type metadata for SiriSetupEnrollmentResult;
}

SiriSetup::SiriSetupEnrollmentMode_optional __swiftcall SiriSetupEnrollmentMode.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriSetup::SiriSetupEnrollmentMode_optional result;
  char v5;

  v2 = v1;
  v3 = sub_227767960();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t SiriSetupEnrollmentMode.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22775897C + 4 * byte_227769430[*v0]))(0xD00000000000001ALL, 0x8000000227769C50);
}

uint64_t sub_22775897C()
{
  return 0x6464754220534F69;
}

uint64_t sub_227758998()
{
  return 0x7453206B63697551;
}

uint64_t sub_2277589B8()
{
  return 0x754220534F63616DLL;
}

void sub_2277589D8(char *a1)
{
  sub_227765650(*a1);
}

unint64_t sub_2277589E8()
{
  unint64_t result;

  result = qword_2558F8880;
  if (!qword_2558F8880)
  {
    result = MEMORY[0x22E29CC34](&protocol conformance descriptor for SiriSetupEnrollmentMode, &type metadata for SiriSetupEnrollmentMode);
    atomic_store(result, (unint64_t *)&qword_2558F8880);
  }
  return result;
}

void sub_227758A2C()
{
  char *v0;

  sub_227758A34(*v0);
}

void sub_227758A34(char a1)
{
  sub_2277679B4();
  __asm { BR              X10 }
}

uint64_t sub_227758A88()
{
  sub_227767768();
  swift_bridgeObjectRelease();
  return sub_2277679CC();
}

void sub_227758B0C(uint64_t a1)
{
  char *v1;

  sub_227758B14(a1, *v1);
}

void sub_227758B14(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_227758B58()
{
  sub_227767768();
  return swift_bridgeObjectRelease();
}

void sub_227758BC8(uint64_t a1)
{
  char *v1;

  sub_227758BD0(a1, *v1);
}

void sub_227758BD0(uint64_t a1, char a2)
{
  sub_2277679B4();
  __asm { BR              X10 }
}

uint64_t sub_227758C20()
{
  sub_227767768();
  swift_bridgeObjectRelease();
  return sub_2277679CC();
}

SiriSetup::SiriSetupEnrollmentMode_optional sub_227758CA4(Swift::String *a1)
{
  return SiriSetupEnrollmentMode.init(rawValue:)(*a1);
}

uint64_t sub_227758CB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = SiriSetupEnrollmentMode.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriSetupEnrollmentMode(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SiriSetupEnrollmentMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_227758DB0 + 4 * byte_227769445[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_227758DE4 + 4 * byte_227769440[v4]))();
}

uint64_t sub_227758DE4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_227758DEC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x227758DF4);
  return result;
}

uint64_t sub_227758E00(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x227758E08);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_227758E0C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_227758E14(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriSetupEnrollmentMode()
{
  return &type metadata for SiriSetupEnrollmentMode;
}

void sub_227758E30(void *a1)
{
  char *v1;
  char *v2;
  id v4;
  unint64_t v5;
  id v6;
  void *v7;
  id v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = v1;
  v4 = objc_msgSend(v2, sel_actions);
  sub_2277596B8();
  v5 = sub_2277677A4();

  if (!(v5 >> 62))
  {
    if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_14:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v14 = sub_227767924();
  swift_bridgeObjectRelease();
  if (!v14)
    goto LABEL_14;
LABEL_3:
  if ((v5 & 0xC000000000000001) != 0)
  {
    v6 = (id)MEMORY[0x22E29C694](0, v5);
  }
  else
  {
    if (!*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_17:
      swift_once();
      goto LABEL_9;
    }
    v6 = *(id *)(v5 + 32);
  }
  v7 = v6;
  swift_bridgeObjectRelease();
  v8 = a1;
  v9 = sub_227767864();

  if ((v9 & 1) == 0)
    return;
  v10 = MEMORY[0x22E29CD18](&v2[OBJC_IVAR____TtC9SiriSetup25SuccessProxCardController_delegate]);
  if (!v10)
    return;
  v2 = (char *)v10;
  if (qword_2558F7DD0 != -1)
    goto LABEL_17;
LABEL_9:
  v11 = sub_227767678();
  __swift_project_value_buffer(v11, (uint64_t)qword_2558F8E48);
  v12 = sub_2277677EC();
  sub_227764D70(v12, 0xD000000000000015, 0x800000022776AB10, 0xD000000000000015, 0x800000022776B3E0);
  if (MEMORY[0x22E29CD18](&v2[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_delegate]))
  {
    v13 = swift_retain();
    sub_2277493E0(v13);
    swift_unknownObjectRelease();
    swift_release();
  }
  swift_unknownObjectRelease();
}

void sub_227759054(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  void *v18;
  uint64_t v19;
  _BYTE v20[8];
  uint64_t v21;

  sub_227759610(a1 + 32, (uint64_t)v20, &qword_2558F8700);
  sub_227759610((uint64_t)v20, (uint64_t)&v21, &qword_2558F8700);
  v2 = MEMORY[0x24BDAC760];
  if (v21 && *(_QWORD *)(v21 + 16))
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    swift_bridgeObjectRetain();
    v4 = v1;
    v5 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
    v18 = sub_227759698;
    v19 = v3;
    v14 = v2;
    v15 = 1107296256;
    v16 = sub_227763240;
    v17 = &block_descriptor_6_2;
    v6 = _Block_copy(&v14);
    v7 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v5, 0, v6);

    _Block_release(v6);
    swift_release();
    v8 = objc_msgSend(v4, sel_addAction_, v7);

  }
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v1;
  v10 = v1;
  v11 = (void *)sub_227767744();
  v18 = sub_227759678;
  v19 = v9;
  v14 = v2;
  v15 = 1107296256;
  v16 = sub_227763240;
  v17 = &block_descriptor_3;
  v12 = _Block_copy(&v14);
  v13 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v11, 0, v12);

  _Block_release(v12);
  swift_release();
  objc_msgSend(v10, sel_setDismissButtonAction_, v13);

}

uint64_t sub_22775927C(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  uint64_t v6;

  result = MEMORY[0x22E29CD18](a2 + OBJC_IVAR____TtC9SiriSetup25SuccessProxCardController_delegate);
  if (result)
  {
    v3 = result;
    if (qword_2558F7DD0 != -1)
      swift_once();
    v4 = sub_227767678();
    __swift_project_value_buffer(v4, (uint64_t)qword_2558F8E48);
    v5 = sub_2277677EC();
    sub_227764D70(v5, 0xD000000000000015, 0x800000022776AB50, 0xD000000000000014, 0x800000022776B900);
    if (MEMORY[0x22E29CD18](v3 + OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_delegate))
    {
      v6 = swift_retain();
      sub_2277496E4(v6);
      swift_unknownObjectRelease();
      swift_release();
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_2277593C0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuccessProxCardController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SuccessProxCardController()
{
  return objc_opt_self();
}

void *sub_227759448()
{
  _QWORD *v0;
  void *v1;
  id v2;

  v1 = *(void **)(*v0 + OBJC_IVAR____TtC9SiriSetup25SuccessProxCardController_orbView);
  v2 = v1;
  return v1;
}

char *sub_227759478(uint64_t a1)
{
  char *v1;
  id v3;
  char *v4;
  char *v5;
  void *v6;
  void *v7;
  char *v8;
  char *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;
  _BYTE v15[16];
  uint64_t v16;
  void *v17;

  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup25SuccessProxCardController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup25SuccessProxCardController_orbView] = 0;
  v3 = objc_allocWithZone((Class)type metadata accessor for SiriSetupProxCardView());
  v4 = sub_227750264(1);
  v14.receiver = v1;
  v14.super_class = (Class)type metadata accessor for SuccessProxCardController();
  v5 = (char *)objc_msgSendSuper2(&v14, sel_initWithContentView_, v4);
  v6 = (void *)sub_227767744();
  objc_msgSend(v5, sel_setTitle_, v6);

  sub_227759610(a1 + 16, (uint64_t)v15, &qword_2558F8000);
  sub_227759610((uint64_t)v15, (uint64_t)&v16, &qword_2558F8000);
  v7 = v17;
  if (v17)
  {
    v8 = v5;
    sub_2277521B4((uint64_t)v15);
    v7 = (void *)sub_227767744();
    sub_2277521DC((uint64_t)v15);
  }
  else
  {
    v9 = v5;
  }
  objc_msgSend(v5, sel_setSubtitle_, v7);

  objc_msgSend(v5, sel_setDismissalType_, 1);
  v10 = *(void **)&v4[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbView];
  v11 = *(void **)&v5[OBJC_IVAR____TtC9SiriSetup25SuccessProxCardController_orbView];
  *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup25SuccessProxCardController_orbView] = v10;
  v12 = v10;

  sub_227759054(a1);
  return v5;
}

uint64_t sub_227759610(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_227759654()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_227759678(uint64_t a1)
{
  uint64_t v1;

  return sub_22775927C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

void sub_227759698(void *a1)
{
  sub_227758E30(a1);
}

unint64_t sub_2277596B8()
{
  unint64_t result;

  result = qword_2558F88C0;
  if (!qword_2558F88C0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2558F88C0);
  }
  return result;
}

uint64_t sub_227759700(uint64_t a1)
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8AD0);
    v2 = sub_227767948();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v27 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v3) >> 6;
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
    if (v13 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v26)
        goto LABEL_37;
      v14 = *(_QWORD *)(v27 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v26)
          goto LABEL_37;
        v14 = *(_QWORD *)(v27 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v26)
            goto LABEL_37;
          v14 = *(_QWORD *)(v27 + 8 * v15);
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
    v17 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v18 = v17[1];
    *(_QWORD *)&v36[0] = *v17;
    *((_QWORD *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_22775D5A0(&v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_22775D5A0(v35, v36);
    sub_22775D5A0(v36, &v32);
    result = sub_2277678C4();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
        v25 = *(_QWORD *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(_QWORD *)(v10 + 32) = v30;
    result = (uint64_t)sub_22775D5A0(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_22775D5B0();
    return v2;
  }
  v14 = *(_QWORD *)(v27 + 8 * v16);
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
    if (v15 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

unint64_t sub_227759ABC@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_22775CD94(*a1);
  *a2 = result;
  return result;
}

void sub_227759AE4(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

unsigned __int8 *sub_227759AF0(_BYTE *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, uint64_t a7)
{
  _BYTE *v7;
  _BYTE *v8;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  id v21;
  _BYTE *v22;
  _BYTE *v23;
  id v24;
  id v25;
  id v26;
  _BYTE *v27;
  _BYTE *v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  id v95;
  id v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  id v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  void *v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  id v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  id v127;
  id v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  void *v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  id v139;
  id v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  char *v146;
  unsigned __int8 *v147;
  void *v148;
  char *v149;
  int v150;
  __int128 *v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  char *v158;
  _UNKNOWN **v159;
  id v160;
  id v161;
  unsigned __int8 *v162;
  void *v163;
  unint64_t v165;
  unint64_t v166;
  unint64_t v167;
  unint64_t v168;
  unint64_t v169;
  unint64_t v170;
  unint64_t v171;
  unint64_t v172;
  unint64_t v173;
  unint64_t v174;
  unint64_t v175;
  unint64_t v176;
  unint64_t v177;
  unint64_t v178;
  unint64_t v179;
  unint64_t v180;
  uint64_t v181;
  void *v182;
  void *v183;
  void *v184;
  id v186;
  id v187;
  objc_super v188;
  __int128 v189[6];
  _OWORD v190[3];

  v8 = v7;
  *(_QWORD *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v15 = &v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_presentingViewController];
  *v15 = 0;
  v15[1] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_AVVCRetryCount] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_badMicRetryCount] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_scdaCoordinator] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_myriadCoordinator] = 0;
  v16 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_voiceProfileManager;
  *(_QWORD *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_voiceProfileManager] = 0;
  v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState] = 0;
  v17 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager;
  *(_QWORD *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingSessionId] = 0;
  v18 = &v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource];
  *v18 = a1;
  v18[1] = a2;
  v19 = &v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSourceWriter];
  *v19 = a3;
  v19[1] = a4;
  v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewStyle] = 0x20100u >> (8
                                                                                * a1[OBJC_IVAR____TtC9SiriSetup8Defaults_enrollmentMode]);
  v183 = a1;
  v184 = a3;
  if (a6 && (objc_opt_self(), (v20 = swift_dynamicCastObjCClass()) != 0))
  {
    v21 = (id)v20;
    v22 = v8;
    v23 = a1;
    v24 = a3;
    v25 = a6;
  }
  else
  {
    v26 = objc_allocWithZone((Class)SRSVoiceProfileManager);
    v27 = v8;
    v28 = a1;
    v29 = a3;
    v21 = objc_msgSend(v26, sel_init);
  }
  v30 = *(void **)&v8[v16];
  *(_QWORD *)&v8[v16] = v21;

  if (a5 && (objc_opt_self(), (v31 = swift_dynamicCastObjCClass()) != 0))
  {
    v32 = (id)v31;
    v33 = a5;
  }
  else
  {
    v34 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
    v35 = objc_msgSend(v34, sel_languageCode);

    if (v35)
    {
      sub_227767750();

    }
    v36 = objc_allocWithZone((Class)SRSVoiceTrainingManager);
    v37 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
    v32 = objc_msgSend(v36, sel_initWithLanguageCode_, v37);

  }
  v38 = *(void **)&v8[v17];
  *(_QWORD *)&v8[v17] = v32;

  *(_QWORD *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_page] = a7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8AE0);
  v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = xmmword_227769550;
  v40 = (void *)objc_opt_self();
  swift_retain();
  v186 = v40;
  v41 = objc_msgSend(v40, sel_sharedPreferences);
  v42 = objc_msgSend(v41, sel_languageCode);

  v182 = a6;
  if (v42)
  {
    sub_227767750();
    v44 = v43;

  }
  else
  {
    v44 = 0;
  }
  v45 = (void *)sub_227767744();
  v46 = (void *)objc_opt_self();
  v47 = objc_msgSend(v46, sel_bundleWithIdentifier_, v45);

  v48 = v47;
  if (!v47)
    v48 = objc_msgSend(v46, sel_mainBundle);
  v187 = v46;
  v49 = v47;
  v165 = 0xE000000000000000;
  v50 = sub_2277675C4();
  v52 = v51;

  if (!v44)
  {

    goto LABEL_20;
  }
  if (qword_2558F7DC0 != -1)
    goto LABEL_83;
  while (1)
  {
    v53 = (void *)qword_2558F9A10;
    v54 = (void *)sub_227767744();
    v55 = objc_msgSend(v53, sel_localizedTriggerPhraseForLanguageCode_, v54, v165);

    sub_227767750();
    *(_QWORD *)&v189[0] = v50;
    *((_QWORD *)&v189[0] + 1) = v52;
    v173 = sub_22775412C();
    v177 = v173;
    v169 = v173;
    v165 = MEMORY[0x24BEE0D00];
    v50 = sub_227767894();
    v57 = v56;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    v52 = v57;
LABEL_20:
    *(_QWORD *)(v39 + 32) = v50;
    *(_QWORD *)(v39 + 40) = v52;
    *(_BYTE *)(v39 + 48) = 0;
    v58 = objc_msgSend(v186, sel_sharedPreferences, v165, v169, v173, v177);
    v59 = objc_msgSend(v58, sel_languageCode);

    if (v59)
    {
      sub_227767750();
      v61 = v60;

    }
    else
    {
      v61 = 0;
    }
    v62 = (void *)sub_227767744();
    v63 = objc_msgSend(v187, sel_bundleWithIdentifier_, v62);

    v64 = v63;
    if (!v63)
      v64 = objc_msgSend(v187, sel_mainBundle);
    v65 = v63;
    v166 = 0xE000000000000000;
    v66 = sub_2277675C4();
    v68 = v67;

    if (v61)
    {
      if (qword_2558F7DC0 != -1)
        swift_once();
      v69 = (void *)qword_2558F9A10;
      v70 = (void *)sub_227767744();
      v71 = objc_msgSend(v69, sel_localizedTriggerPhraseForLanguageCode_, v70, 0xE000000000000000);

      sub_227767750();
      *(_QWORD *)&v189[0] = v66;
      *((_QWORD *)&v189[0] + 1) = v68;
      v174 = sub_22775412C();
      v178 = v174;
      v170 = v174;
      v166 = MEMORY[0x24BEE0D00];
      v66 = sub_227767894();
      v73 = v72;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      v68 = v73;
    }
    else
    {

    }
    *(_QWORD *)(v39 + 56) = v66;
    *(_QWORD *)(v39 + 64) = v68;
    *(_BYTE *)(v39 + 72) = 1;
    v74 = objc_msgSend(v186, sel_sharedPreferences, v166, v170, v174, v178);
    v75 = objc_msgSend(v74, sel_languageCode);

    if (v75)
    {
      sub_227767750();
      v77 = v76;

    }
    else
    {
      v77 = 0;
    }
    v78 = (void *)sub_227767744();
    v79 = objc_msgSend(v187, sel_bundleWithIdentifier_, v78);

    v80 = v79;
    if (!v79)
      v80 = objc_msgSend(v187, sel_mainBundle);
    v81 = v79;
    v167 = 0xE000000000000000;
    v82 = sub_2277675C4();
    v84 = v83;

    if (v77)
    {
      if (qword_2558F7DC0 != -1)
        swift_once();
      v85 = (void *)qword_2558F9A10;
      v86 = (void *)sub_227767744();
      v87 = objc_msgSend(v85, sel_localizedTriggerPhraseForLanguageCode_, v86, 0xE000000000000000);

      sub_227767750();
      *(_QWORD *)&v189[0] = v82;
      *((_QWORD *)&v189[0] + 1) = v84;
      v175 = sub_22775412C();
      v179 = v175;
      v171 = v175;
      v167 = MEMORY[0x24BEE0D00];
      v82 = sub_227767894();
      v89 = v88;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      v84 = v89;
    }
    else
    {

    }
    *(_QWORD *)(v39 + 80) = v82;
    *(_QWORD *)(v39 + 88) = v84;
    *(_BYTE *)(v39 + 96) = 1;
    v90 = objc_msgSend(v186, sel_sharedPreferences, v167, v171, v175, v179);
    v91 = objc_msgSend(v90, sel_languageCode);

    if (v91)
    {
      sub_227767750();
      v93 = v92;

    }
    else
    {
      v93 = 0;
    }
    v94 = (void *)sub_227767744();
    v95 = objc_msgSend(v187, sel_bundleWithIdentifier_, v94);

    v96 = v95;
    if (!v95)
      v96 = objc_msgSend(v187, sel_mainBundle);
    v97 = v95;
    v168 = 0xE000000000000000;
    v98 = sub_2277675C4();
    v100 = v99;

    if (v93)
    {
      if (qword_2558F7DC0 != -1)
        swift_once();
      v101 = (void *)qword_2558F9A10;
      v102 = (void *)sub_227767744();
      v103 = objc_msgSend(v101, sel_localizedTriggerPhraseForLanguageCode_, v102, 0xE000000000000000);

      sub_227767750();
      *(_QWORD *)&v189[0] = v98;
      *((_QWORD *)&v189[0] + 1) = v100;
      v176 = sub_22775412C();
      v180 = v176;
      v172 = v176;
      v168 = MEMORY[0x24BEE0D00];
      v98 = sub_227767894();
      v105 = v104;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      v100 = v105;
    }
    else
    {

    }
    *(_QWORD *)(v39 + 104) = v98;
    *(_QWORD *)(v39 + 112) = v100;
    *(_BYTE *)(v39 + 120) = 1;
    v106 = objc_msgSend(v186, sel_sharedPreferences, v168, v172, v176, v180);
    v107 = objc_msgSend(v106, sel_languageCode);

    if (v107)
    {
      sub_227767750();
      v109 = v108;

    }
    else
    {
      v109 = 0;
    }
    v110 = (void *)sub_227767744();
    v111 = objc_msgSend(v187, sel_bundleWithIdentifier_, v110);

    v112 = v111;
    if (!v111)
      v112 = objc_msgSend(v187, sel_mainBundle);
    v52 = v111;
    v165 = 0xE000000000000000;
    v50 = sub_2277675C4();
    v114 = v113;

    if (v109)
    {
      if (qword_2558F7DC0 != -1)
        swift_once();
      v115 = (void *)qword_2558F9A10;
      v116 = (void *)sub_227767744();
      v117 = objc_msgSend(v115, sel_localizedTriggerPhraseForLanguageCode_, v116, 0xE000000000000000);

      sub_227767750();
      *(_QWORD *)&v189[0] = v50;
      *((_QWORD *)&v189[0] + 1) = v114;
      sub_22775412C();
      v165 = MEMORY[0x24BEE0D00];
      v50 = sub_227767894();
      v119 = v118;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      v114 = v119;
    }
    else
    {

    }
    *(_QWORD *)(v39 + 128) = v50;
    *(_QWORD *)(v39 + 136) = v114;
    *(_BYTE *)(v39 + 144) = 1;
    *(_QWORD *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingInstructions] = v39;
    v49 = v187;
    if (*(_QWORD *)(v39 + 16))
      break;
    __break(1u);
LABEL_83:
    swift_once();
  }
  v120 = *(_QWORD *)(v39 + 32);
  v121 = *(_QWORD *)(v39 + 40);
  v181 = v120;
  swift_bridgeObjectRetain();
  v122 = objc_msgSend(v186, sel_sharedPreferences);
  v123 = objc_msgSend(v122, sel_languageCode);

  if (v123)
  {
    sub_227767750();
    v125 = v124;

  }
  else
  {
    v125 = 0;
  }
  v126 = (void *)sub_227767744();
  v127 = objc_msgSend(v187, sel_bundleWithIdentifier_, v126);

  v128 = v127;
  if (!v127)
    v128 = objc_msgSend(v187, sel_mainBundle);
  v129 = v127;
  v130 = sub_2277675C4();
  v132 = v131;

  if (v125)
  {
    if (qword_2558F7DC0 != -1)
      swift_once();
    v133 = (void *)qword_2558F9A10;
    v134 = (void *)sub_227767744();
    v135 = objc_msgSend(v133, sel_localizedTriggerPhraseForLanguageCode_, v134, 0xE000000000000000);

    sub_227767750();
    *(_QWORD *)&v189[0] = v130;
    *((_QWORD *)&v189[0] + 1) = v132;
    sub_22775412C();
    v130 = sub_227767894();
    v137 = v136;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    v132 = v137;
  }
  else
  {

  }
  v138 = (void *)sub_227767744();
  v139 = objc_msgSend(v187, sel_bundleWithIdentifier_, v138);

  v140 = v139;
  if (!v139)
    v140 = objc_msgSend(v187, sel_mainBundle);
  v141 = v139;
  v142 = sub_2277675C4();
  v144 = v143;

  v145 = &v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel];
  *(_QWORD *)v145 = v181;
  *((_QWORD *)v145 + 1) = v121;
  *((_QWORD *)v145 + 2) = 0;
  *((_QWORD *)v145 + 3) = 0;
  *((_QWORD *)v145 + 4) = 0;
  *((_QWORD *)v145 + 5) = v130;
  *((_QWORD *)v145 + 6) = v132;
  *((_QWORD *)v145 + 7) = 0;
  *((_QWORD *)v145 + 8) = 0;
  *((_QWORD *)v145 + 9) = v142;
  *((_QWORD *)v145 + 10) = v144;
  *(_OWORD *)(v145 + 88) = 0u;
  *(_OWORD *)(v145 + 104) = 0u;
  v145[120] = 2;

  v188.receiver = v8;
  v188.super_class = (Class)type metadata accessor for VoiceTrainingPresenter();
  v146 = (char *)objc_msgSendSuper2(&v188, sel_init, 0xE000000000000000);
  v147 = (unsigned __int8 *)v146;
  v148 = *(void **)&v146[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager];
  if (v148)
    objc_msgSend(v148, sel_setDelegate_, v146);
  else
    v149 = v146;
  v150 = v147[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewStyle];
  v151 = (__int128 *)&v147[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel];
  swift_beginAccess();
  v152 = *v151;
  v153 = v151[1];
  v154 = v151[3];
  v189[2] = v151[2];
  v189[3] = v154;
  v189[0] = v152;
  v189[1] = v153;
  v155 = v151[4];
  v156 = v151[5];
  v157 = v151[6];
  *(_OWORD *)((char *)v190 + 9) = *(__int128 *)((char *)v151 + 105);
  v189[5] = v156;
  v190[0] = v157;
  v189[4] = v155;
  if (v150)
  {
    if (v150 == 1)
    {
      sub_227748948((uint64_t)v189);
      swift_release();

      v158 = 0;
      v159 = 0;
    }
    else
    {
      v161 = objc_allocWithZone((Class)type metadata accessor for VoiceTrainingProxController());
      sub_227748948((uint64_t)v189);
      v158 = (char *)sub_227752204(v189);
      *(_QWORD *)&v158[OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_delegate + 8] = &off_24EFD0C50;
      swift_unknownObjectWeakAssign();
      swift_release();

      v159 = &off_24EFD0598;
    }
  }
  else
  {
    v160 = objc_allocWithZone((Class)type metadata accessor for VoiceTrainingWelcomeController());
    sub_227748948((uint64_t)v189);
    sub_227748948((uint64_t)v189);
    v158 = sub_2277551F8((uint64_t)v189);
    *(_QWORD *)&v158[OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_delegate + 8] = &off_24EFD0C50;
    swift_unknownObjectWeakAssign();
    swift_release();

    v159 = &off_24EFD07D0;
  }

  sub_227748A14((uint64_t)v189);
  v162 = &v147[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_presentingViewController];
  v163 = *(void **)&v147[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_presentingViewController];
  *(_QWORD *)v162 = v158;
  *((_QWORD *)v162 + 1) = v159;

  return v147;
}

void sub_22775ADB8()
{
  void *v0;
  id v1;
  id v2;

  if (qword_2558F7DB0 != -1)
    swift_once();
  if (qword_2558F86B8)
    objc_msgSend((id)qword_2558F86B8, sel_logEventWithType_context_, 3302, 0);
  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_sharedApplication);
  objc_msgSend(v1, sel_setIdleTimerDisabled_, 1);

  v2 = objc_msgSend(v0, sel_sharedApplication);
  objc_msgSend(v2, sel_setIdleTimerDisabled_, 0);

  sub_22775C3EC();
  sub_22775AE94(0);
}

void sub_22775AE94(char a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  os_log_type_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  void *v16;
  uint64_t v17;
  uint64_t ObjectType;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void (*v22)(_OWORD *, uint64_t, uint64_t, uint64_t);
  id v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  char v40;
  _QWORD aBlock[6];
  _OWORD v42[6];
  _OWORD v43[3];

  v2 = v1;
  if ((a1 & 1) == 0)
  {
    v3 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState);
    if (v3 < 6)
      v4 = v3 + 1;
    else
      v4 = 6;
    *(_BYTE *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState) = v4;
  }
  *(_QWORD *)&v42[0] = 0;
  *((_QWORD *)&v42[0] + 1) = 0xE000000000000000;
  v5 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState;
  LOBYTE(aBlock[0]) = *(_BYTE *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState);
  sub_227767900();
  sub_227767774();
  sub_227767774();
  swift_bridgeObjectRelease();
  if (qword_2558F7DD0 != -1)
    swift_once();
  v6 = sub_227767678();
  __swift_project_value_buffer(v6, (uint64_t)qword_2558F8E48);
  v7 = sub_2277677EC();
  sub_227764D70(v7, 0xD000000000000025, 0x800000022776BBB0, *(uint64_t *)&v42[0], *((unint64_t *)&v42[0] + 1));
  swift_bridgeObjectRelease();
  v8 = *(unsigned __int8 *)(v1 + v5);
  if (v8 == 6)
  {
    sub_22775BCF4();
    return;
  }
  sub_22775B6C4(v8);
  if (!v10)
  {
    *(_QWORD *)&v42[0] = 0;
    *((_QWORD *)&v42[0] + 1) = 0xE000000000000000;
    sub_2277678D0();
    sub_227767774();
    LOBYTE(aBlock[0]) = *(_BYTE *)(v1 + v5);
    sub_227767900();
    v24 = sub_2277677E0();
    sub_227764D70(v24, 0xD000000000000025, 0x800000022776BBB0, 0, 0xE000000000000000);
    goto LABEL_25;
  }
  v12 = v9;
  v13 = v10;
  v40 = v11;
  v14 = v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel;
  swift_beginAccess();
  *(_QWORD *)v14 = v12;
  *(_QWORD *)(v14 + 8) = v13;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRelease();
  v15 = (uint64_t *)(v2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_presentingViewController);
  v16 = *(void **)(v2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_presentingViewController);
  if (v16)
  {
    v17 = v15[1];
    ObjectType = swift_getObjectType();
    aBlock[0] = v16;
    v19 = *(_OWORD *)(v14 + 80);
    v42[4] = *(_OWORD *)(v14 + 64);
    v42[5] = v19;
    v43[0] = *(_OWORD *)(v14 + 96);
    *(_OWORD *)((char *)v43 + 9) = *(_OWORD *)(v14 + 105);
    v20 = *(_OWORD *)(v14 + 16);
    v42[0] = *(_OWORD *)v14;
    v42[1] = v20;
    v21 = *(_OWORD *)(v14 + 48);
    v42[2] = *(_OWORD *)(v14 + 32);
    v42[3] = v21;
    v22 = *(void (**)(_OWORD *, uint64_t, uint64_t, uint64_t))(v17 + 16);
    v23 = v16;
    sub_227748948((uint64_t)v42);
    v22(v42, 1, ObjectType, v17);
    sub_227748A14((uint64_t)v42);
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_22775B870(*(_BYTE *)(v2 + v5));
  sub_22775CF18(*(_BYTE *)(v2 + v5));
  v25 = *v15;
  if (*v15)
  {
    v26 = v15[1];
    v27 = swift_getObjectType();
    aBlock[0] = v25;
    v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8))(v27, v26);
    if (v28)
    {
      v29 = (void *)v28;
      objc_msgSend(*(id *)(v28 + OBJC_IVAR____TtC9SiriSetup16OrbContainerView_orbView), sel_setMode_, 1);

    }
  }
  if (!objc_msgSend((id)objc_opt_self(), sel_isSCDAFrameworkEnabled))
  {
    v32 = *(void **)(v2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_myriadCoordinator);
    if (!v32)
      goto LABEL_23;
    goto LABEL_22;
  }
  v32 = *(void **)(v2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_scdaCoordinator);
  if (v32)
  {
LABEL_22:
    LODWORD(v30) = 0;
    LODWORD(v31) = 20.0;
    objc_msgSend(v32, sel_startAdvertisingForPHSSetupAfterDelay_maxInterval_, v30, v31);
  }
LABEL_23:
  v33 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager;
  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager), sel_startRMS);
  v34 = *(void **)(v2 + v33);
  if (v34)
  {
    v35 = *(unsigned __int8 *)(v2 + v5);
    v36 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v37 = swift_allocObject();
    *(_QWORD *)(v37 + 16) = v36;
    *(_QWORD *)(v37 + 24) = v12;
    *(_QWORD *)(v37 + 32) = v13;
    *(_BYTE *)(v37 + 40) = v40 & 1;
    aBlock[4] = sub_22775D0B0;
    aBlock[5] = v37;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22775B66C;
    aBlock[3] = &block_descriptor_11;
    v38 = _Block_copy(aBlock);
    v39 = v34;
    swift_release();
    objc_msgSend(v39, sel_trainUtterance_shouldUseASR_completion_, v35, 1, v38);
    _Block_release(v38);

    return;
  }
LABEL_25:
  swift_bridgeObjectRelease();
}

void sub_22775B35C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  os_log_type_t v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t ObjectType;
  uint64_t v15;
  void *v16;

  v6 = a4 + 16;
  swift_beginAccess();
  v7 = MEMORY[0x22E29CD18](v6);
  if (!v7)
    return;
  v8 = (char *)v7;
  sub_2277678D0();
  sub_227767774();
  sub_227767774();
  swift_bridgeObjectRelease();
  sub_227767774();
  type metadata accessor for SRSTrainingManagerSessionStatus(0);
  sub_227767900();
  sub_227767774();
  sub_22776796C();
  sub_227767774();
  swift_bridgeObjectRelease();
  if (qword_2558F7DD0 != -1)
    swift_once();
  v9 = sub_227767678();
  __swift_project_value_buffer(v9, (uint64_t)qword_2558F8E48);
  v10 = sub_2277677EC();
  sub_227764D70(v10, 0xD000000000000025, 0x800000022776BBB0, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingSessionId] = a1;
  if (objc_msgSend((id)objc_opt_self(), sel_isSCDAFrameworkEnabled, a1))
  {
    v12 = *(void **)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_scdaCoordinator];
    if (!v12)
      goto LABEL_9;
    goto LABEL_8;
  }
  v12 = *(void **)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_myriadCoordinator];
  if (v12)
  {
LABEL_8:
    LODWORD(v11) = 0.5;
    objc_msgSend(v12, sel_endAdvertisingAfterDelay_, v11);
  }
LABEL_9:
  objc_msgSend(*(id *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager], sel_stopRMS);
  if (*(_QWORD *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_presentingViewController])
  {
    v13 = *(_QWORD *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_presentingViewController + 8];
    ObjectType = swift_getObjectType();
    v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(ObjectType, v13);
    if (v15)
    {
      v16 = (void *)v15;
      objc_msgSend(*(id *)(v15 + OBJC_IVAR____TtC9SiriSetup16OrbContainerView_orbView), sel_animateToOffWithCompletion_, 0);

    }
  }
  sub_22775D0C0(a2);

}

uint64_t sub_22775B66C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v7(a2, a3, a4);
  return swift_release();
}

void sub_22775B6C4(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_22775B6FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingInstructions);
  if (!*(_QWORD *)(v1 + 16))
  {
    __break(1u);
    JUMPOUT(0x22775B7F0);
  }
  v2 = *(_QWORD *)(v1 + 32);
  swift_bridgeObjectRetain();
  return v2;
}

void sub_22775B81C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x22E29CD18](v1);
  if (v2)
  {
    v3 = (void *)v2;
    sub_22775AE94(0);

  }
}

void sub_22775B870(char a1)
{
  __asm { BR              X10 }
}

void sub_22775B8AC()
{
  uint64_t v0;
  _OWORD *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t ObjectType;
  _OWORD *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void (*v19)(_OWORD *, _QWORD, uint64_t, uint64_t);
  id v20;
  _OWORD v21[13];

  v2 = (void *)sub_227767744();
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel_bundleWithIdentifier_, v2);

  v5 = v4;
  if (!v4)
    v5 = objc_msgSend(v3, sel_mainBundle);
  v6 = v4;
  v7 = sub_2277675C4();
  v9 = v8;

  v10 = v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel;
  swift_beginAccess();
  *(_QWORD *)(v10 + 72) = v7;
  *(_QWORD *)(v10 + 80) = v9;
  swift_bridgeObjectRelease();
  v11 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_presentingViewController);
  if (v11)
  {
    v12 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_presentingViewController + 8);
    ObjectType = swift_getObjectType();
    v14 = (_OWORD *)(v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel);
    swift_beginAccess();
    v15 = v14[4];
    v16 = v14[6];
    v1[5] = v14[5];
    v1[6] = v16;
    *(_OWORD *)((char *)v1 + 105) = *(_OWORD *)((char *)v14 + 105);
    v17 = v14[1];
    v21[0] = *v14;
    v21[1] = v17;
    v18 = v14[3];
    v21[2] = v14[2];
    v21[3] = v18;
    v21[4] = v15;
    v19 = *(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v12 + 16);
    v20 = v11;
    sub_227748948((uint64_t)v21);
    v19(v21, 0, ObjectType, v12);
    sub_227748A14((uint64_t)v21);

  }
}

void sub_22775BCF4()
{
  uint64_t v1;
  os_log_type_t v2;

  if (qword_2558F7DD0 != -1)
    swift_once();
  v1 = sub_227767678();
  __swift_project_value_buffer(v1, (uint64_t)qword_2558F8E48);
  v2 = sub_2277677EC();
  sub_227764D70(v2, 0xD000000000000013, 0x800000022776BAD0, 0xD000000000000018, 0x800000022776BAF0);
  if (qword_2558F7DB0 != -1)
    swift_once();
  if (qword_2558F86B8)
    objc_msgSend((id)qword_2558F86B8, sel_logEventWithType_context_, 3303, 0);
  __asm { BR              X12 }
}

uint64_t sub_22775BFDC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  _QWORD aBlock[6];

  v2 = sub_2277676FC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_227767720();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22775CE28();
  v12 = (void *)sub_227767834();
  aBlock[4] = sub_22775CE64;
  aBlock[5] = a1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22775FF30;
  aBlock[3] = &block_descriptor_4;
  v13 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_227767708();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_22775CE84();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8AB0);
  sub_22775CECC();
  sub_2277678AC();
  MEMORY[0x22E29C5F8](0, v11, v6, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

uint64_t sub_22775C190()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t ObjectType;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  void (*v11)(_OWORD *, _QWORD, uint64_t, uint64_t);
  id v12;
  uint64_t v13;
  _OWORD v15[6];
  _OWORD v16[2];

  v1 = v0;
  if (qword_2558F7DD0 != -1)
    swift_once();
  v2 = sub_227767678();
  __swift_project_value_buffer(v2, (uint64_t)qword_2558F8E48);
  v3 = sub_2277677EC();
  sub_227764D70(v3, 0xD000000000000010, 0x800000022776BA90, 0xD000000000000017, 0x800000022776BAB0);
  v4 = v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel;
  swift_beginAccess();
  *(_QWORD *)(v4 + 72) = 0;
  *(_QWORD *)(v4 + 80) = 0;
  swift_bridgeObjectRelease();
  v5 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_presentingViewController);
  if (v5)
  {
    v6 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_presentingViewController + 8);
    ObjectType = swift_getObjectType();
    v8 = *(_OWORD *)(v4 + 80);
    v15[4] = *(_OWORD *)(v4 + 64);
    v15[5] = v8;
    v16[0] = *(_OWORD *)(v4 + 96);
    *(_OWORD *)((char *)v16 + 9) = *(_OWORD *)(v4 + 105);
    v9 = *(_OWORD *)(v4 + 16);
    v15[0] = *(_OWORD *)v4;
    v15[1] = v9;
    v10 = *(_OWORD *)(v4 + 48);
    v15[2] = *(_OWORD *)(v4 + 32);
    v15[3] = v10;
    v11 = *(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v6 + 16);
    v12 = v5;
    sub_227748948((uint64_t)v15);
    v11(v15, 0, ObjectType, v6);
    sub_227748A14((uint64_t)v15);

  }
  sub_22775C4FC();
  sub_22775C6D0(0);
  v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_22775C59C((void (*)(uint64_t))sub_22775CE00, v13);
  return swift_release_n();
}

void sub_22775C34C(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x22E29CD18](v3);
  if (v4)
  {
    v5 = (void *)v4;
    if (MEMORY[0x22E29CD18](v4 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_delegate))
    {
      v6 = swift_retain();
      a2(v6);
      swift_release();

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

id sub_22775C3EC()
{
  uint64_t v0;
  id v1;
  void *v2;
  id result;
  id v4;
  void *v5;

  if (objc_msgSend((id)objc_opt_self(), sel_isSCDAFrameworkEnabled))
  {
    v1 = objc_msgSend((id)objc_opt_self(), sel_currentCoordinator);
    if (!v1)
      v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE92080]), sel_initWithDelegate_, v0);
    v2 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_scdaCoordinator);
    *(_QWORD *)(v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_scdaCoordinator) = v1;

    result = *(id *)(v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_scdaCoordinator);
    if (result)
      return objc_msgSend(result, sel_setupEnabled_, 1);
  }
  else
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_currentCoordinator);
    if (!v4)
      v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE09238]), sel_initWithDelegate_, v0);
    v5 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_myriadCoordinator);
    *(_QWORD *)(v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_myriadCoordinator) = v4;

    result = *(id *)(v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_myriadCoordinator);
    if (result)
      return objc_msgSend(result, sel_setupEnabled_, 1);
  }
  return result;
}

id sub_22775C4FC()
{
  uint64_t v0;
  double v1;
  uint64_t v2;
  id result;

  if (objc_msgSend((id)objc_opt_self(), sel_isSCDAFrameworkEnabled))
  {
    v2 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_scdaCoordinator;
    result = *(id *)(v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_scdaCoordinator);
    if (!result)
      return result;
  }
  else
  {
    v2 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_myriadCoordinator;
    result = *(id *)(v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_myriadCoordinator);
    if (!result)
      return result;
  }
  LODWORD(v1) = 0;
  objc_msgSend(result, sel_endAdvertisingAfterDelay_, v1);
  result = *(id *)(v0 + v2);
  if (result)
  {
    objc_msgSend(result, sel_stopListening_, 0);
    result = *(id *)(v0 + v2);
    if (result)
      return objc_msgSend(result, sel_setupEnabled_, 0);
  }
  return result;
}

void sub_22775C59C(void (*a1)(uint64_t), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[6];

  v5 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager;
  v6 = *(void **)(v2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager);
  if (v6)
  {
    objc_msgSend(v6, sel_cancelTrainingForSessionId_, *(_QWORD *)(v2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingSessionId));
    objc_msgSend(*(id *)(v2 + v5), sel_stopRMS);
    v7 = *(void **)(v2 + v5);
    if (v7)
    {
      if (a1)
      {
        v12[4] = a1;
        v12[5] = a2;
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 1107296256;
        v12[2] = sub_22775FF30;
        v12[3] = &block_descriptor_4;
        v8 = _Block_copy(v12);
        v9 = v7;
        sub_22775CDCC((uint64_t)a1);
        swift_release();
      }
      else
      {
        v11 = v7;
        v8 = 0;
      }
      objc_msgSend(v7, sel_cleanupWithCompletion_, v8);
      _Block_release(v8);

    }
  }
  else if (a1)
  {
    v10 = swift_retain();
    a1(v10);
    sub_22775CDA4((uint64_t)a1);
  }
}

void sub_22775C6D0(char a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_voiceProfileManager);
  if ((a1 & 1) != 0)
  {
    if (!v3)
      goto LABEL_11;
    v4 = *(id *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager);
    v5 = v3;
    if (v4)
      v4 = objc_msgSend(v4, sel_voiceProfile);
    objc_msgSend(v3, sel_markSATEnrollmentSuccessForVoiceProfile_, v4);
  }
  else
  {
    if (!v3)
      goto LABEL_11;
    v4 = *(id *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager);
    v6 = v3;
    if (v4)
      v4 = objc_msgSend(v4, sel_voiceProfile);
    objc_msgSend(v3, sel_deleteUserVoiceProfile_, v4);
  }

LABEL_11:
  if (*(_BYTE *)(*(_QWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource)
                + OBJC_IVAR____TtC9SiriSetup8Defaults_enrollmentMode) != 3)
  {
    v7 = 1;
    if ((a1 & 1) != 0)
      v7 = 2;
    *(_QWORD *)(*(_QWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSourceWriter)
              + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_voiceTriggerEnabled) = v7;
  }
}

unint64_t sub_22775C7F0(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8AD8);
  v2 = (_QWORD *)sub_227767948();
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
    result = sub_227760838(v5, v6);
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

id sub_22775C93C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VoiceTrainingPresenter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for VoiceTrainingPresenter()
{
  return objc_opt_self();
}

double sub_22775CA8C@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  __int128 *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[2];

  v3 = (__int128 *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel);
  swift_beginAccess();
  v4 = v3[5];
  v15 = v3[4];
  v16 = v4;
  v17[0] = v3[6];
  *(_OWORD *)((char *)v17 + 9) = *(__int128 *)((char *)v3 + 105);
  v5 = v3[1];
  v11 = *v3;
  v12 = v5;
  v6 = v3[3];
  v13 = v3[2];
  v14 = v6;
  sub_227748948((uint64_t)&v11);
  v7 = v16;
  a1[4] = v15;
  a1[5] = v7;
  a1[6] = v17[0];
  *(_OWORD *)((char *)a1 + 105) = *(_OWORD *)((char *)v17 + 9);
  v8 = v12;
  *a1 = v11;
  a1[1] = v8;
  result = *(double *)&v13;
  v10 = v14;
  a1[2] = v13;
  a1[3] = v10;
  return result;
}

uint64_t (*sub_22775CB34())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void *sub_22775CB78()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_presentingViewController);
  v2 = v1;
  return v1;
}

void sub_22775CBAC(float a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t ObjectType;
  uint64_t v5;
  double v6;
  void *v7;

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_presentingViewController))
  {
    v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_presentingViewController + 8);
    ObjectType = swift_getObjectType();
    v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(ObjectType, v3);
    if (v5)
    {
      v7 = (void *)v5;
      *(float *)&v6 = a1;
      objc_msgSend(*(id *)(v5 + OBJC_IVAR____TtC9SiriSetup16OrbContainerView_orbView), sel_setPowerLevel_, v6);

    }
  }
}

uint64_t storeEnumTagSinglePayload for TrainingState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22775CCCC + 4 * byte_227769569[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_22775CD00 + 4 * byte_227769564[v4]))();
}

uint64_t sub_22775CD00(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22775CD08(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22775CD10);
  return result;
}

uint64_t sub_22775CD1C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22775CD24);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_22775CD28(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22775CD30(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TrainingState()
{
  return &type metadata for TrainingState;
}

unint64_t sub_22775CD50()
{
  unint64_t result;

  result = qword_2558F8A98;
  if (!qword_2558F8A98)
  {
    result = MEMORY[0x22E29CC34](&unk_227769650, &type metadata for TrainingState);
    atomic_store(result, (unint64_t *)&qword_2558F8A98);
  }
  return result;
}

unint64_t sub_22775CD94(unint64_t result)
{
  if (result >= 7)
    return 7;
  return result;
}

uint64_t sub_22775CDA4(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_22775CDCC(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_22775CDDC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_22775CE00()
{
  uint64_t v0;

  sub_22775C34C(v0, (void (*)(uint64_t))sub_227749560);
}

uint64_t sub_22775CE20()
{
  uint64_t v0;

  return sub_22775BFDC(v0);
}

unint64_t sub_22775CE28()
{
  unint64_t result;

  result = qword_2558F8AA0;
  if (!qword_2558F8AA0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2558F8AA0);
  }
  return result;
}

void sub_22775CE64()
{
  uint64_t v0;

  sub_22775C34C(v0, (void (*)(uint64_t))sub_2277493E0);
}

unint64_t sub_22775CE84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2558F8AA8;
  if (!qword_2558F8AA8)
  {
    v1 = sub_2277676FC();
    result = MEMORY[0x22E29CC34](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_2558F8AA8);
  }
  return result;
}

unint64_t sub_22775CECC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2558F8AB8;
  if (!qword_2558F8AB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558F8AB0);
    result = MEMORY[0x22E29CC34](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2558F8AB8);
  }
  return result;
}

void sub_22775CF18(char a1)
{
  __asm { BR              X10 }
}

void sub_22775CF58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t inited;
  unint64_t v3;
  void *v4;
  void *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8AC8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_227768C10;
  *(_QWORD *)(inited + 32) = 0x7463757274736E69;
  *(_QWORD *)(inited + 40) = 0xEB000000006E6F69;
  *(_QWORD *)(inited + 48) = v1;
  *(_QWORD *)(inited + 56) = v0;
  swift_bridgeObjectRetain();
  v3 = sub_22775C7F0(inited);
  if (qword_2558F7DB0 != -1)
    swift_once();
  v4 = (void *)qword_2558F86B8;
  if (qword_2558F86B8)
  {
    sub_227759700(v3);
    v5 = (void *)sub_22776772C();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_logEventWithType_context_, 3306, v5);
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_22775D084()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_22775D0B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_22775B35C(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

void sub_22775D0C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  os_log_type_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  sub_2277678D0();
  sub_227767774();
  sub_22775E8E0(a1);
  sub_227767774();
  swift_bridgeObjectRelease();
  sub_227767774();
  sub_227767900();
  sub_227767774();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8AC0);
  sub_227767900();
  if (qword_2558F7DD0 != -1)
    swift_once();
  v3 = sub_227767678();
  __swift_project_value_buffer(v3, (uint64_t)qword_2558F8E48);
  v4 = sub_2277677EC();
  sub_227764D70(v4, 0xD00000000000003FLL, 0x800000022776BC50, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  switch(a1)
  {
    case 0:
      v5 = swift_allocObject();
      swift_unknownObjectWeakInit();
      if (!*(_QWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_presentingViewController))
        goto LABEL_18;
      v6 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_presentingViewController + 8);
      ObjectType = swift_getObjectType();
      v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
      swift_retain();
      v9 = v8(ObjectType, v6);
      if (v9)
        goto LABEL_10;
      goto LABEL_22;
    case 1:
      v5 = swift_allocObject();
      swift_unknownObjectWeakInit();
      if (*(_QWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_presentingViewController))
      {
        v11 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_presentingViewController + 8);
        v12 = swift_getObjectType();
        v13 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
        swift_retain();
        v9 = v13(v12, v11);
        if (v9)
        {
LABEL_10:
          v14 = (void *)v9;
          v15 = *(id *)(v9 + OBJC_IVAR____TtC9SiriSetup16OrbContainerView_checkMark);
          sub_2277509CC(1, (uint64_t)sub_22775D588, v5);
          swift_release_n();

        }
        else
        {
LABEL_22:
          swift_release_n();
        }
      }
      else
      {
LABEL_18:
        swift_release();
      }
      return;
    case 2:
    case 6:
    case 7:
      return;
    case 3:
      v16 = sub_2277677E0();
      v17 = 0xD000000000000057;
      v18 = "Unrecoverable recording error while training. Disabling VoiceTrigger and Skipping setup";
      goto LABEL_20;
    case 4:
      v19 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_badMicRetryCount);
      v20 = __OFADD__(v19, 1);
      v21 = v19 + 1;
      if (v20)
        goto LABEL_24;
      *(_QWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_badMicRetryCount) = v21;
      if (v21 < 2)
        goto LABEL_17;
      v16 = sub_2277677EC();
      v17 = 0xD00000000000001CLL;
      v18 = "Exceeded Bad mic retry count";
      goto LABEL_20;
    case 5:
      v22 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_AVVCRetryCount);
      v20 = __OFADD__(v22, 1);
      v23 = v22 + 1;
      if (v20)
      {
        __break(1u);
LABEL_24:
        __break(1u);
        JUMPOUT(0x22775D568);
      }
      *(_QWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_AVVCRetryCount) = v23;
      if (v23 > 4)
      {
        v16 = sub_2277677EC();
        v17 = 0xD00000000000003ALL;
        v18 = "Unrecoverable AVVC not ready errors. Cancelling enrollment";
LABEL_20:
        sub_227764D70(v16, 0xD00000000000003FLL, 0x800000022776BC50, v17, (unint64_t)(v18 - 32) | 0x8000000000000000);
        sub_22775C190();
      }
      else
      {
LABEL_17:
        sub_22775AE94(1);
      }
      return;
    default:
      sub_2277678D0();
      sub_227767774();
      type metadata accessor for SRSTrainingManagerSessionStatus(0);
      sub_227767900();
      v10 = sub_2277677E0();
      sub_227764D70(v10, 0xD00000000000003FLL, 0x800000022776BC50, 0, 0xE000000000000000);
      swift_bridgeObjectRelease();
      return;
  }
}

void sub_22775D588()
{
  uint64_t v0;

  sub_22775B81C(v0);
}

_OWORD *sub_22775D5A0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_22775D5B0()
{
  return swift_release();
}

id sub_22775D5C8(uint64_t a1)
{
  char *v1;
  char *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v27;
  objc_super v28;

  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_orbView] = 0;
  v3 = &v1[OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel];
  v4 = *(_OWORD *)(a1 + 80);
  *((_OWORD *)v3 + 4) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v3 + 5) = v4;
  *((_OWORD *)v3 + 6) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v3 + 105) = *(_OWORD *)(a1 + 105);
  v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v3 = *(_OWORD *)a1;
  *((_OWORD *)v3 + 1) = v5;
  v6 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v3 + 2) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v3 + 3) = v6;
  sub_227748948(a1);
  v7 = (void *)sub_227767744();
  v8 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v7);

  v9 = (void *)sub_227767744();
  v10 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_withConfiguration_, v9, v8, 0);

  v11 = (void *)sub_227767744();
  if (*(_QWORD *)(a1 + 24))
  {
    swift_bridgeObjectRetain();
    v12 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v28.receiver = v1;
  v28.super_class = (Class)type metadata accessor for LanguageSelectionWelcomeController();
  v27 = v10;
  v13 = objc_msgSendSuper2(&v28, sel_initWithTitle_detailText_icon_contentLayout_, v11, v12, v10, 2);

  if (*(_QWORD *)(a1 + 32))
    v14 = *(_QWORD *)(a1 + 32);
  else
    v14 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRetain();
  v15 = v13;
  sub_227748A14(a1);
  v16 = *(_QWORD *)(v14 + 16);
  if (v16)
  {
    v17 = (void *)objc_opt_self();
    v18 = v14 + 40;
    do
    {
      swift_bridgeObjectRetain();
      v19 = objc_msgSend(v17, sel_boldButton);
      v20 = (void *)sub_227767744();
      swift_bridgeObjectRelease();
      objc_msgSend(v19, sel_setTitle_forState_, v20, 0);

      objc_msgSend(v19, sel_addTarget_action_forControlEvents_, v15, sel_continueTappedWithSender_, 64);
      v21 = objc_msgSend(v15, (SEL)&selRef_dequeueReusableCellWithIdentifier_);
      objc_msgSend(v21, sel_addButton_, v19);

      v18 += 16;
      --v16;
    }
    while (v16);
  }
  swift_bridgeObjectRelease();
  v22 = (void *)objc_opt_self();
  v23 = (void *)sub_227767744();
  v24 = objc_msgSend(v22, sel_linkWithBundleIdentifier_, v23);

  v25 = objc_msgSend(v15, sel_buttonTray);
  objc_msgSend(v25, sel_setPrivacyLinkController_, v24);

  return v15;
}

uint64_t sub_22775D938(void *a1)
{
  uint64_t v1;
  uint64_t result;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = MEMORY[0x22E29CD18](v1 + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_delegate);
  if (result)
  {
    v4 = objc_msgSend(a1, sel_currentTitle);
    if (v4)
    {
      v5 = v4;
      v6 = sub_227767750();
      v8 = v7;

    }
    else
    {
      v6 = 0;
      v8 = 0xE000000000000000;
    }
    sub_22775E778(v6, v8);
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_22775DA88()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LanguageSelectionWelcomeController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LanguageSelectionWelcomeController()
{
  return objc_opt_self();
}

void *sub_22775DB58()
{
  _QWORD *v0;
  void *v1;
  id v2;

  v1 = *(void **)(*v0 + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_orbView);
  v2 = v1;
  return v1;
}

uint64_t sub_22775DB88(_BYTE *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  _BYTE *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD *v53;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v55;
  uint64_t v56;
  char v57;
  unint64_t v58;
  uint64_t v59;
  _BOOL8 v60;
  uint64_t v61;
  char v62;
  unint64_t v63;
  char v64;
  _QWORD *v65;
  _QWORD *v66;
  uint64_t *v67;
  _QWORD *v68;
  uint64_t v69;
  BOOL v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  objc_class *v76;
  _BYTE *v77;
  __int128 *v78;
  char v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  char *v86;
  char *v87;
  char *v88;
  char *v89;
  char **v90;
  void *v91;
  uint64_t result;
  _QWORD v93[2];
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  id v99;
  _BYTE *v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  _QWORD *v106;
  _QWORD *v107;
  objc_super v108;
  _OWORD v109[6];
  _BYTE v110[25];

  v101 = a5;
  v10 = sub_227767630();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)v93 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v15 = &v5[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_presentingViewController];
  *v15 = 0;
  v15[1] = 0;
  v106 = &v5[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_languages];
  *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_languages] = MEMORY[0x24BEE4B00];
  v16 = &v5[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_dataSource];
  *v16 = a1;
  v16[1] = a2;
  v17 = &v5[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_dataSourceWriter];
  *v17 = a3;
  v17[1] = a4;
  v5[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_viewStyle] = 0x20100u >> (8
                                                                                    * a1[OBJC_IVAR____TtC9SiriSetup8Defaults_enrollmentMode]);
  v98 = v5;
  v100 = a1;
  v99 = a3;
  v18 = (void *)sub_227767744();
  v19 = (void *)objc_opt_self();
  v20 = objc_msgSend(v19, sel_bundleWithIdentifier_, v18);

  v21 = v20;
  if (!v20)
    v21 = objc_msgSend(v19, sel_mainBundle);
  v22 = v20;
  v97 = sub_2277675C4();
  v96 = v23;

  v24 = (void *)sub_227767744();
  v25 = objc_msgSend(v19, sel_bundleWithIdentifier_, v24);

  v26 = v25;
  if (!v25)
    v26 = objc_msgSend(v19, sel_mainBundle);
  v27 = v25;
  v95 = sub_2277675C4();
  v94 = v28;

  v29 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
  v30 = objc_msgSend(v29, sel_languageCode);

  if (v30)
  {
    v103 = sub_227767750();
    v104 = v31;

  }
  else
  {
    v32 = objc_msgSend((id)objc_opt_self(), sel_currentLocale);
    sub_227767624();

    v103 = sub_227767618();
    v104 = v33;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  }
  v34 = sub_2277638C4();
  v35 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v34)
    v36 = v34;
  else
    v36 = MEMORY[0x24BEE4AF8];
  v37 = *(_QWORD *)(v36 + 16);
  v93[1] = v36;
  if (v37)
  {
    v102 = (id)objc_opt_self();
    v38 = (uint64_t *)(v36 + 40);
    while (1)
    {
      v39 = *(v38 - 1);
      v40 = *v38;
      swift_bridgeObjectRetain();
      v41 = objc_msgSend(v102, sel_sharedInstance);
      if (!v41)
        break;
      v42 = v41;
      v43 = (void *)sub_227767744();
      v44 = (void *)sub_227767744();
      v45 = objc_msgSend(v42, sel_localizedCompactNameForSiriLanguage_inDisplayLanguage_, v43, v44);

      if (v45)
      {
        v46 = sub_227767750();
        v48 = v47;

        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v35 = sub_22774A040(0, v35[2] + 1, 1, v35);
        v50 = v35[2];
        v49 = v35[3];
        v105 = v37;
        if (v50 >= v49 >> 1)
          v35 = sub_22774A040((_QWORD *)(v49 > 1), v50 + 1, 1, v35);
        v35[2] = v50 + 1;
        v51 = v35;
        v52 = &v35[2 * v50];
        v52[4] = v46;
        v52[5] = v48;
        v53 = v106;
        swift_beginAccess();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v107 = (_QWORD *)*v53;
        v55 = v107;
        *v53 = 0x8000000000000000;
        v56 = v46;
        v58 = sub_227760838(v46, v48);
        v59 = v55[2];
        v60 = (v57 & 1) == 0;
        v61 = v59 + v60;
        if (__OFADD__(v59, v60))
        {
          __break(1u);
LABEL_34:
          __break(1u);
          break;
        }
        v62 = v57;
        if (v55[3] >= v61)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            sub_2277614D4();
        }
        else
        {
          sub_227760E08(v61, isUniquelyReferenced_nonNull_native);
          v63 = sub_227760838(v56, v48);
          if ((v62 & 1) != (v64 & 1))
            goto LABEL_36;
          v58 = v63;
        }
        v35 = v51;
        v65 = v107;
        if ((v62 & 1) != 0)
        {
          v66 = (_QWORD *)(v107[7] + 16 * v58);
          swift_bridgeObjectRelease();
          *v66 = v39;
          v66[1] = v40;
        }
        else
        {
          v107[(v58 >> 6) + 8] |= 1 << v58;
          v67 = (uint64_t *)(v65[6] + 16 * v58);
          *v67 = v56;
          v67[1] = v48;
          v68 = (_QWORD *)(v65[7] + 16 * v58);
          *v68 = v39;
          v68[1] = v40;
          v69 = v65[2];
          v70 = __OFADD__(v69, 1);
          v71 = v69 + 1;
          if (v70)
            goto LABEL_34;
          v65[2] = v71;
          swift_bridgeObjectRetain();
        }
        *v106 = v65;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        v37 = v105;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v38 += 2;
      if (!--v37)
        goto LABEL_32;
    }
    __break(1u);
LABEL_36:
    result = sub_2277679A8();
    __break(1u);
  }
  else
  {
LABEL_32:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v72 = v98;
    v73 = &v98[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_viewModel];
    v74 = v96;
    *(_QWORD *)v73 = v97;
    *((_QWORD *)v73 + 1) = v74;
    v75 = v94;
    *((_QWORD *)v73 + 2) = v95;
    *((_QWORD *)v73 + 3) = v75;
    *((_QWORD *)v73 + 4) = v35;
    *(_OWORD *)(v73 + 40) = 0u;
    *(_OWORD *)(v73 + 56) = 0u;
    *(_OWORD *)(v73 + 72) = 0u;
    *(_OWORD *)(v73 + 88) = 0u;
    *(_OWORD *)(v73 + 104) = 0u;
    v73[120] = 2;
    *(_QWORD *)&v72[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_page] = v101;
    swift_retain();

    v76 = (objc_class *)type metadata accessor for LanguageSelectionPresenter();
    v108.receiver = v72;
    v108.super_class = v76;
    v77 = objc_msgSendSuper2(&v108, sel_init);
    v78 = (__int128 *)&v77[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_viewModel];
    v79 = v77[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_viewStyle];
    swift_beginAccess();
    v80 = *v78;
    v81 = v78[1];
    v82 = v78[3];
    v109[2] = v78[2];
    v109[3] = v82;
    v109[0] = v80;
    v109[1] = v81;
    v83 = v78[4];
    v84 = v78[5];
    v85 = v78[6];
    *(_OWORD *)&v110[9] = *(__int128 *)((char *)v78 + 105);
    *(_OWORD *)v110 = v85;
    v109[4] = v83;
    v109[5] = v84;
    v86 = v77;
    sub_227748948((uint64_t)v109);
    v87 = sub_22775E384(v79, (uint64_t)v109);
    v89 = v88;

    swift_release();
    sub_227748A14((uint64_t)v109);
    v90 = (char **)&v86[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_presentingViewController];
    v91 = *(void **)&v86[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_presentingViewController];
    *v90 = v87;
    v90[1] = v89;

    return (uint64_t)v86;
  }
  return result;
}

char *sub_22775E384(char a1, uint64_t a2)
{
  uint64_t v2;
  os_log_type_t v3;
  char *v4;

  if (a1)
  {
    sub_2277678D0();
    sub_227767774();
    sub_227767900();
    sub_227767774();
    if (qword_2558F7DD0 != -1)
      swift_once();
    v2 = sub_227767678();
    __swift_project_value_buffer(v2, (uint64_t)qword_2558F8E48);
    v3 = sub_2277677E0();
    sub_227764D70(v3, 0xD000000000000030, 0x8000000227769D20, 0, 0xE000000000000000);
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    objc_allocWithZone((Class)type metadata accessor for LanguageSelectionWelcomeController());
    sub_227748948(a2);
    v4 = (char *)sub_22775D5C8(a2);
    *(_QWORD *)&v4[OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_delegate + 8] = &off_24EFD0E18;
    swift_unknownObjectWeakAssign();
  }
  return v4;
}

id sub_22775E548()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LanguageSelectionPresenter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LanguageSelectionPresenter()
{
  return objc_opt_self();
}

double sub_22775E658@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  __int128 *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[2];

  v3 = (__int128 *)(v1 + OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_viewModel);
  swift_beginAccess();
  v4 = v3[5];
  v15 = v3[4];
  v16 = v4;
  v17[0] = v3[6];
  *(_OWORD *)((char *)v17 + 9) = *(__int128 *)((char *)v3 + 105);
  v5 = v3[1];
  v11 = *v3;
  v12 = v5;
  v6 = v3[3];
  v13 = v3[2];
  v14 = v6;
  sub_227748948((uint64_t)&v11);
  v7 = v16;
  a1[4] = v15;
  a1[5] = v7;
  a1[6] = v17[0];
  *(_OWORD *)((char *)a1 + 105) = *(_OWORD *)((char *)v17 + 9);
  v8 = v12;
  *a1 = v11;
  a1[1] = v8;
  result = *(double *)&v13;
  v10 = v14;
  a1[2] = v13;
  a1[3] = v10;
  return result;
}

uint64_t (*sub_22775E700())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void *sub_22775E744()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_presentingViewController);
  v2 = v1;
  return v1;
}

uint64_t sub_22775E778(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  char v13;
  uint64_t *v14;
  uint64_t v15;
  char *v16;
  uint64_t result;
  uint64_t v18;

  v3 = v2;
  v6 = (uint64_t *)(v2 + OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_languages);
  swift_beginAccess();
  if (*(_QWORD *)(*v6 + 16))
  {
    swift_bridgeObjectRetain();
    sub_227760838(a1, a2);
    v8 = v7;
    swift_bridgeObjectRelease();
    if ((v8 & 1) != 0)
    {
      v9 = *v6;
      v10 = *(_QWORD *)(*v6 + 16);
      v11 = (char *)*(id *)(v3 + OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_dataSourceWriter);
      if (v10)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v12 = sub_227760838(a1, a2);
        if ((v13 & 1) != 0)
        {
          v14 = (uint64_t *)(*(_QWORD *)(v9 + 56) + 16 * v12);
          v10 = *v14;
          v15 = v14[1];
          swift_bridgeObjectRetain();
        }
        else
        {
          v10 = 0;
          v15 = 0;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v15 = 0;
      }
      v16 = &v11[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriLanguage];
      *(_QWORD *)v16 = v10;
      *((_QWORD *)v16 + 1) = v15;

      swift_bridgeObjectRelease();
    }
  }
  result = MEMORY[0x22E29CD18](v3 + OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_delegate);
  if (result)
  {
    v18 = swift_retain();
    sub_2277493E0(v18);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

unint64_t sub_22775E8E0(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  os_log_type_t v3;

  v1 = 0xD000000000000012;
  switch(a1)
  {
    case 0:
      return v1;
    case 1:
      v1 = 0xD00000000000001BLL;
      break;
    case 2:
      v1 = 0x6E69616741797274;
      break;
    case 3:
      v1 = 0x6E6964726F636572;
      break;
    case 4:
      v1 = 0x63694D646162;
      break;
    case 5:
      v1 = 0x52746F4E43565641;
      break;
    case 6:
      v1 = 0x6C65636E6163;
      break;
    case 7:
      v1 = 0x74756F656D6974;
      break;
    default:
      if (qword_2558F7DD0 != -1)
        swift_once();
      v2 = sub_227767678();
      __swift_project_value_buffer(v2, (uint64_t)qword_2558F8E48);
      v3 = sub_2277677E0();
      sub_227764D70(v3, 0xD00000000000001ALL, 0x800000022776BF60, 0x206E776F6E6B6E75, 0xEE00737574617473);
      v1 = 0;
      break;
  }
  return v1;
}

id sub_22775EA6C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)SRSVTPreferences), sel_init);
  qword_2558F9A10 = (uint64_t)result;
  return result;
}

void sub_22775EAA0()
{
  uint64_t v0;
  os_log_type_t v1;

  if (qword_2558F7DD0 != -1)
    swift_once();
  v0 = sub_227767678();
  __swift_project_value_buffer(v0, (uint64_t)qword_2558F8E48);
  v1 = sub_2277677E0();
  sub_227764D70(v1, 0xD000000000000013, 0x800000022776AEF0, 0xD00000000000006DLL, 0x800000022776BFC0);
}

_QWORD *sub_22775EB34(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v9 = a1;
  v8 = sub_227767828();
  v2 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22776781C();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8]();
  sub_227767720();
  MEMORY[0x24BDAC7A8]();
  v1[3] = -1;
  v1[5] = 0;
  swift_unknownObjectWeakInit();
  v1[7] = MEMORY[0x24BEE4B00];
  sub_22775CE28();
  sub_227767714();
  v10 = MEMORY[0x24BEE4AF8];
  sub_227761EF8(&qword_2558F8D30, v5, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8D38);
  sub_227761F38(&qword_2558F8D40, &qword_2558F8D38);
  sub_2277678AC();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE5750], v8);
  v1[6] = sub_227767858();
  v1[2] = v9;
  return v1;
}

void sub_22775ED24(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  os_log_type_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  os_log_type_t v26;
  uint64_t v27;
  unint64_t v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t ObjectType;
  uint64_t v36;
  void *v37;
  os_log_type_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  _QWORD *v42;
  char *v43;
  char *v44;
  char v45;
  char *v46;
  void *v47;
  void *v48;
  char *v49;
  char *v50;
  id v51;
  id v52;
  id v53;
  char *v54;
  char *v55;
  char *v56;
  void *v57;
  unsigned int v58;
  os_log_type_t v59;
  void *v60;
  _QWORD *v61;
  uint64_t v62;
  char *v63;
  id v64;
  char *v65;
  char *v66;
  uint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t aBlock;
  unint64_t v80;
  uint64_t (*v81)(uint64_t);
  void *v82;
  uint64_t (*v83)();
  _QWORD *v84;
  uint64_t v85;

  v6 = v5;
  v75 = a5;
  v77 = a4;
  v10 = sub_2277676FC();
  v73 = *(_QWORD *)(v10 - 8);
  v74 = v10;
  MEMORY[0x24BDAC7A8](v10, v11);
  v72 = (char *)&v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_227767720();
  v70 = *(_QWORD *)(v13 - 8);
  v71 = v13;
  MEMORY[0x24BDAC7A8](v13, v14);
  v69 = (char *)&v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock = 0;
  v80 = 0xE000000000000000;
  sub_2277678D0();
  v85 = a1;
  swift_retain();
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8028);
  sub_22776775C();
  sub_227767774();
  swift_bridgeObjectRelease();
  sub_227767774();
  v85 = a2;
  type metadata accessor for AFBoolean(0);
  sub_227767900();
  sub_227767774();
  v85 = a3;
  sub_227767900();
  v16 = aBlock;
  v17 = v80;
  if (qword_2558F7DD0 != -1)
    swift_once();
  v18 = sub_227767678();
  __swift_project_value_buffer(v18, (uint64_t)qword_2558F8E48);
  v19 = sub_2277677EC();
  sub_227764D70(v19, 0xD000000000000044, 0x800000022776C220, v16, v17);
  swift_bridgeObjectRelease();
  v20 = v77;
  sub_227760160(a1, (uint64_t)v77);
  v21 = sub_22775FB00(a1, a2, a3);
  if (v21)
  {
    v22 = v21;
    aBlock = a1;
    swift_retain();
    aBlock = sub_22776775C();
    v80 = v23;
    sub_227767774();
    swift_retain();
    sub_22774B150();
    swift_release();
    sub_227767774();
    swift_bridgeObjectRelease();
    v24 = aBlock;
    v25 = v80;
    v26 = sub_2277677EC();
    sub_227764D70(v26, 0xD000000000000044, 0x800000022776C220, v24, v25);
    swift_bridgeObjectRelease();
    if ((*(_BYTE *)(v22 + 40) & 1) != 0)
    {
      aBlock = 0;
      v80 = 0xE000000000000000;
      sub_2277678D0();
      swift_bridgeObjectRelease();
      aBlock = 0xD000000000000018;
      v80 = 0x800000022776C2B0;
      swift_retain();
      sub_22774B150();
      swift_release();
      sub_227767774();
      swift_bridgeObjectRelease();
      sub_227767774();
      v27 = aBlock;
      v28 = v80;
      v29 = sub_2277677EC();
      sub_227764D70(v29, 0xD000000000000044, 0x800000022776C220, v27, v28);
      swift_bridgeObjectRelease();
      v30 = MEMORY[0x22E29CD18](v6 + 32);
      v31 = v75;
      if (v30)
      {
        v32 = (char *)v30;
        v33 = sub_2277677EC();
        sub_227764D70(v33, 0xD000000000000026, 0x800000022776C2D0, 0, 0xE000000000000000);
        if (*(_QWORD *)&v32[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter])
        {
          v34 = *(_QWORD *)&v32[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter + 8];
          ObjectType = swift_getObjectType();
          swift_unknownObjectRetain();
          sub_2277673C0(1, ObjectType, v34);

          swift_unknownObjectRelease();
        }
        else
        {

        }
      }
      v42 = (_QWORD *)swift_allocObject();
      v42[2] = v6;
      v42[3] = v22;
      v42[4] = v20;
      v42[5] = v31;
      if (*(_BYTE *)(v22 + 40) == 1)
      {
        swift_beginAccess();
        switch(*(_BYTE *)(v22 + 16))
        {
          case 1:
            swift_retain_n();
            v43 = v20;
            swift_retain_n();
            v44 = v43;
            v45 = sub_227763AD4() & 1;
            goto LABEL_18;
          case 2:
            v47 = *(void **)&v20[OBJC_IVAR____TtC9SiriSetup8Defaults_voiceProfileManager];
            v48 = (void *)objc_opt_self();
            swift_retain_n();
            v49 = v20;
            swift_retain_n();
            v50 = v49;
            v51 = v47;
            v52 = objc_msgSend(v48, sel_sharedPreferences);
            v53 = objc_msgSend(v52, sel_languageCode);

            if (v53)
            {
              sub_227767750();

            }
            v57 = (void *)sub_227767744();
            swift_bridgeObjectRelease();
            v58 = objc_msgSend(v51, sel_isSATEnrolledForSiriProfileId_languageCode_, 0, v57);

            if (v58)
            {
              v59 = sub_2277677EC();
              sub_227764D70(v59, 0xD00000000000002FLL, 0x800000022776C300, 0xD000000000000034, 0x800000022776C330);
              sub_22775F6C4(0, v6, v22, v50, v75);

              goto LABEL_20;
            }
            v60 = *(void **)(v6 + 48);
            v61 = (_QWORD *)swift_allocObject();
            v62 = v75;
            v61[2] = v50;
            v61[3] = v62;
            v61[4] = sub_227761E4C;
            v61[5] = v42;
            v83 = sub_227761E84;
            v84 = v61;
            aBlock = MEMORY[0x24BDAC760];
            v80 = 1107296256;
            v81 = sub_22775FF30;
            v82 = &block_descriptor_18;
            v77 = (char *)_Block_copy(&aBlock);
            v63 = v50;
            v64 = v60;
            swift_retain();
            v65 = v69;
            sub_227767708();
            v78 = MEMORY[0x24BEE4AF8];
            sub_227761EF8((unint64_t *)&qword_2558F8AA8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
            __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8AB0);
            sub_227761F38((unint64_t *)&qword_2558F8AB8, &qword_2558F8AB0);
            v66 = v72;
            v67 = v74;
            sub_2277678AC();
            v68 = v77;
            MEMORY[0x22E29C5F8](0, v65, v66, v77);
            _Block_release(v68);

            (*(void (**)(char *, uint64_t))(v73 + 8))(v66, v67);
            (*(void (**)(char *, uint64_t))(v70 + 8))(v65, v71);

            swift_release_n();
            swift_release_n();
            swift_release();
            break;
          case 4:
            LOBYTE(aBlock) = v20[OBJC_IVAR____TtC9SiriSetup8Defaults_enrollmentMode];
            swift_retain_n();
            v54 = v20;
            swift_retain_n();
            v44 = v54;
            sub_227762AD0((uint64_t)&aBlock);
            goto LABEL_19;
          case 6:
            swift_retain_n();
            v55 = v20;
            swift_retain_n();
            v56 = v55;
            sub_22775FF5C(v56, v31, (uint64_t)sub_227761E4C, (uint64_t)v42);

            goto LABEL_20;
          default:
            goto LABEL_17;
        }
      }
      else
      {
LABEL_17:
        swift_retain_n();
        v46 = v20;
        swift_retain_n();
        v44 = v46;
        v45 = 1;
LABEL_18:
        sub_22775F6C4(v45, v6, v22, v44, v31);
LABEL_19:

LABEL_20:
        swift_release_n();
        swift_release_n();
      }
    }
    else
    {
      v39 = MEMORY[0x22E29CD18](v6 + 32);
      if (v39)
      {
        v40 = (void *)v39;
        v41 = sub_2277603A4(v22);
        sub_227749870(v22);

        swift_release();
        return;
      }
    }
    swift_release();
  }
  else
  {
    v36 = MEMORY[0x22E29CD18](v6 + 32);
    if (v36)
    {
      v37 = (void *)v36;
      v38 = sub_2277677EC();
      sub_227764D70(v38, 0xD000000000000013, 0x800000022776C290, 0, 0xE000000000000000);
      sub_227748FF8();

    }
  }
}

uint64_t sub_22775F6C4(char a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD aBlock[6];

  v9 = sub_2277676FC();
  v26 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_227767720();
  v24 = *(_QWORD *)(v13 - 8);
  v25 = v13;
  MEMORY[0x24BDAC7A8](v13, v14);
  v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22775CE28();
  v17 = (void *)sub_227767834();
  v18 = swift_allocObject();
  swift_weakInit();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v18;
  *(_QWORD *)(v19 + 24) = a3;
  *(_BYTE *)(v19 + 32) = a1;
  *(_QWORD *)(v19 + 40) = a4;
  *(_QWORD *)(v19 + 48) = a5;
  aBlock[4] = sub_227761EE8;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22775FF30;
  aBlock[3] = &block_descriptor_27;
  v20 = _Block_copy(aBlock);
  swift_retain();
  v21 = a4;
  swift_release();
  sub_227767708();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_227761EF8((unint64_t *)&qword_2558F8AA8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8AB0);
  sub_227761F38((unint64_t *)&qword_2558F8AB8, &qword_2558F8AB0);
  sub_2277678AC();
  MEMORY[0x22E29C5F8](0, v16, v12, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v9);
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v16, v25);
}

void sub_22775F900(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t Strong;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  os_log_type_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v10 = Strong;
    sub_2277678D0();
    swift_retain();
    v11 = sub_22774B150();
    v13 = v12;
    swift_bridgeObjectRelease();
    swift_release();
    sub_227767774();
    sub_227767774();
    swift_bridgeObjectRelease();
    if (qword_2558F7DD0 != -1)
      swift_once();
    v14 = sub_227767678();
    __swift_project_value_buffer(v14, (uint64_t)qword_2558F8E48);
    v15 = sub_2277677EC();
    sub_227764D70(v15, 0xD000000000000044, 0x800000022776C220, v11, v13);
    swift_bridgeObjectRelease();
    if ((a3 & 1) != 0)
    {
      v16 = MEMORY[0x22E29CD18](v10 + 32);
      if (v16)
      {
        v17 = (void *)v16;
        v18 = sub_2277603A4(a2);
        sub_227749870(a2);

        swift_release();
        return;
      }
    }
    else
    {
      sub_22775ED24(a2, 1, 0, a4, a5);
    }
    swift_release();
  }
}

uint64_t sub_22775FB00(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  if (result)
  {
    v4 = *(_QWORD *)(result + 48);
    v5 = v4 && a2 == 2;
    if (v5 && a3 == 1)
    {
      swift_retain();
      sub_2277678D0();
      swift_bridgeObjectRelease();
      v12 = 0xD000000000000023;
      v13 = "Moving to required successor Page: ";
      goto LABEL_19;
    }
  }
  v7 = *(_QWORD *)(v3 + 24);
  v8 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
  }
  else
  {
    v9 = *(_QWORD *)(v3 + 16);
    if (!(v9 >> 62))
    {
      if (v8 < *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_12;
      return 0;
    }
  }
  swift_bridgeObjectRetain();
  v16 = sub_227767924();
  result = swift_bridgeObjectRelease();
  if (v8 >= v16)
    return 0;
LABEL_12:
  v10 = *(_QWORD *)(v3 + 24);
  v11 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
    goto LABEL_27;
  }
  *(_QWORD *)(v3 + 24) = v11;
  v3 = *(_QWORD *)(v3 + 16);
  if ((v3 & 0xC000000000000001) != 0)
  {
LABEL_27:
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x22E29C694](v11, v3);
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  if ((v11 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v11 < *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v4 = *(_QWORD *)(v3 + 8 * v11 + 32);
    swift_retain();
LABEL_17:
    sub_2277678D0();
    swift_bridgeObjectRelease();
    v12 = 0xD000000000000015;
    v13 = "Moving to next page: ";
LABEL_19:
    v17 = v12;
    v18 = (unint64_t)(v13 - 32) | 0x8000000000000000;
    swift_retain();
    sub_22774B150();
    swift_release();
    sub_227767774();
    swift_bridgeObjectRelease();
    if (qword_2558F7DD0 != -1)
      swift_once();
    v14 = sub_227767678();
    __swift_project_value_buffer(v14, (uint64_t)qword_2558F8E48);
    v15 = sub_2277677EC();
    sub_227764D70(v15, 0xD00000000000004CLL, 0x800000022776C180, v17, v18);
    swift_bridgeObjectRelease();
    return v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_22775FD40(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  os_log_type_t v12;

  v4 = *(void **)(a1 + OBJC_IVAR____TtC9SiriSetup8Defaults_voiceProfileManager);
  v5 = (void *)objc_opt_self();
  v6 = v4;
  v7 = objc_msgSend(v5, sel_sharedPreferences);
  v8 = objc_msgSend(v7, sel_languageCode);

  if (v8)
  {
    sub_227767750();

  }
  v9 = (void *)sub_227767744();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v6, sel_hasVoiceProfileIniCloudForLanguageCode_, v9);

  sub_2277678D0();
  swift_bridgeObjectRelease();
  sub_227767774();
  swift_bridgeObjectRelease();
  if (qword_2558F7DD0 != -1)
    swift_once();
  v11 = sub_227767678();
  __swift_project_value_buffer(v11, (uint64_t)qword_2558F8E48);
  v12 = sub_2277677EC();
  sub_227764D70(v12, 0xD00000000000002FLL, 0x800000022776C300, 0xD000000000000012, 0x800000022776C370);
  swift_bridgeObjectRelease();
  return a3(v10 ^ 1);
}

uint64_t sub_22775FF30(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_22775FF5C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[2];
  _QWORD aBlock[6];

  v9 = sub_2277676FC();
  v24[0] = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_227767720();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13, v15);
  v17 = (char *)v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *(void **)(v4 + 48);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = a1;
  v19[5] = a2;
  aBlock[4] = sub_227761DD8;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22775FF30;
  aBlock[3] = &block_descriptor_9;
  v20 = _Block_copy(aBlock);
  v21 = v18;
  swift_retain();
  v22 = a1;
  sub_227767708();
  v24[1] = MEMORY[0x24BEE4AF8];
  sub_227761EF8((unint64_t *)&qword_2558F8AA8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8AB0);
  sub_227761F38((unint64_t *)&qword_2558F8AB8, &qword_2558F8AB0);
  sub_2277678AC();
  MEMORY[0x22E29C5F8](0, v17, v12, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v24[0] + 8))(v12, v9);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  return swift_release();
}

void sub_227760160(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  char v7;
  id v8;
  uint64_t ObjectType;
  uint64_t v10;
  os_log_type_t v11;
  void *v12;

  if (a1)
  {
    swift_beginAccess();
    v5 = *(_QWORD *)(v2 + 56);
    if (*(_QWORD *)(v5 + 16))
    {
      swift_retain();
      swift_bridgeObjectRetain();
      v6 = sub_2277607C8(a1);
      if ((v7 & 1) != 0)
      {
        v8 = *(id *)(*(_QWORD *)(v5 + 56) + 16 * v6);
        swift_bridgeObjectRelease();
        sub_2277678D0();
        sub_227767774();
        ObjectType = swift_getObjectType();
        MEMORY[0x22E29CC34](MEMORY[0x24BDD0240], ObjectType);
        sub_227767978();
        sub_227767774();
        swift_retain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8028);
        sub_22776775C();
        sub_227767774();
        swift_bridgeObjectRelease();
        if (qword_2558F7DD0 != -1)
          swift_once();
        v10 = sub_227767678();
        __swift_project_value_buffer(v10, (uint64_t)qword_2558F8E48);
        v11 = sub_2277677EC();
        sub_227764D70(v11, 0xD000000000000031, 0x800000022776C120, 0, 0xE000000000000000);
        swift_bridgeObjectRelease();
        sub_22776168C((uint64_t)v8, a2);
        swift_beginAccess();
        v12 = (void *)sub_227760A28(a1);
        swift_endAccess();
        swift_release();

      }
      else
      {
        swift_release();
        swift_bridgeObjectRelease();
      }
    }
  }
}

id sub_2277603A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  id v13;
  char isUniquelyReferenced_nonNull_native;
  id v15;
  char v16;
  uint64_t ObjectType;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  os_log_type_t v21;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  Strong = swift_weakLoadStrong();
  v4 = (uint64_t *)(v1 + 56);
  if (Strong)
  {
    v5 = Strong;
    swift_beginAccess();
    v6 = *v4;
    if (*(_QWORD *)(*v4 + 16))
    {
      swift_retain();
      swift_bridgeObjectRetain();
      v7 = sub_2277607C8(v5);
      if ((v8 & 1) != 0)
      {
        v9 = *(id *)(*(_QWORD *)(v6 + 56) + 16 * v7);
        swift_release_n();
LABEL_8:
        swift_bridgeObjectRelease();
        goto LABEL_13;
      }
      swift_release();
      swift_bridgeObjectRelease();
    }
    v13 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LocalDataSourceWriter()), sel_init);
    swift_beginAccess();
    swift_retain();
    v9 = v13;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v23 = *v4;
    *v4 = 0x8000000000000000;
    sub_2277619D8((uint64_t)v9, v5, isUniquelyReferenced_nonNull_native, &v23);
    *v4 = v23;
    swift_release();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();
  }
  else
  {
    swift_beginAccess();
    v10 = *v4;
    if (*(_QWORD *)(*v4 + 16))
    {
      swift_retain();
      swift_bridgeObjectRetain();
      v11 = sub_2277607C8(a1);
      if ((v12 & 1) != 0)
      {
        v9 = *(id *)(*(_QWORD *)(v10 + 56) + 16 * v11);
        swift_release();
        goto LABEL_8;
      }
      swift_release();
      swift_bridgeObjectRelease();
    }
    v15 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LocalDataSourceWriter()), sel_init);
    swift_beginAccess();
    swift_retain();
    v9 = v15;
    v16 = swift_isUniquelyReferenced_nonNull_native();
    v23 = *v4;
    *v4 = 0x8000000000000000;
    sub_2277619D8((uint64_t)v9, a1, v16, &v23);
    *v4 = v23;
    swift_release();
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
LABEL_13:
  v24 = 0;
  v25 = 0xE000000000000000;
  sub_2277678D0();
  ObjectType = swift_getObjectType();
  v23 = (uint64_t)v9;
  MEMORY[0x22E29CC34](MEMORY[0x24BDD0240], ObjectType);
  sub_227767978();
  sub_227767774();
  sub_22774B150();
  sub_227767774();
  swift_bridgeObjectRelease();
  v19 = v24;
  v18 = v25;
  if (qword_2558F7DD0 != -1)
    swift_once();
  v20 = sub_227767678();
  __swift_project_value_buffer(v20, (uint64_t)qword_2558F8E48);
  v21 = sub_2277677EC();
  sub_227764D70(v21, 0xD000000000000015, 0x800000022776C100, v19, v18);
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_227760714()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_2277489F0(v0 + 32);

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SetupPageListHandler()
{
  return objc_opt_self();
}

void sub_227760770(void *a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 40) = a2;
  swift_unknownObjectWeakAssign();

}

uint64_t sub_2277607A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

unint64_t sub_2277607C8(uint64_t a1)
{
  uint64_t v2;

  sub_2277679B4();
  swift_bridgeObjectRetain();
  sub_227767768();
  swift_bridgeObjectRelease();
  v2 = sub_2277679CC();
  return sub_22776089C(a1, v2);
}

unint64_t sub_227760838(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2277679B4();
  sub_227767768();
  v4 = sub_2277679CC();
  return sub_227760948(a1, a2, v4);
}

unint64_t sub_22776089C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v7 = ~v4;
    v8 = *(_QWORD *)(v2 + 48);
    do
    {
      v9 = *(_QWORD *)(v8 + 8 * v5);
      if (*(_QWORD *)(v9 + 24) == *(_QWORD *)(a1 + 24) && *(_QWORD *)(v9 + 32) == *(_QWORD *)(a1 + 32))
        break;
      if ((sub_227767990() & 1) != 0)
        break;
      v5 = (v5 + 1) & v7;
    }
    while (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

unint64_t sub_227760948(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_227767990() & 1) == 0)
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
      while (!v14 && (sub_227767990() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_227760A28(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_2277607C8(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v2;
  v10 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_227761318();
    v7 = v10;
  }
  swift_release();
  v8 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 16 * v4);
  sub_22776112C(v4, v7);
  *v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_227760AFC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  char v6;
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
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  int64_t v31;
  _QWORD *v32;
  __int128 v33;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8D28);
  v6 = a2;
  v7 = sub_22776793C();
  v8 = v7;
  if (*(_QWORD *)(v5 + 16))
  {
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v32 = (_QWORD *)(v5 + 64);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v31 = (unint64_t)(v9 + 63) >> 6;
    v12 = v7 + 64;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v19 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v20 = v19 | (v14 << 6);
      }
      else
      {
        v21 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v21 >= v31)
          goto LABEL_33;
        v22 = v32[v21];
        ++v14;
        if (!v22)
        {
          v14 = v21 + 1;
          if (v21 + 1 >= v31)
            goto LABEL_33;
          v22 = v32[v14];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v31)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v6 & 1) != 0)
              {
                v30 = 1 << *(_BYTE *)(v5 + 32);
                if (v30 >= 64)
                  bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v32 = -1 << v30;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v22 = v32[v23];
            if (!v22)
            {
              while (1)
              {
                v14 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_40;
                if (v14 >= v31)
                  goto LABEL_33;
                v22 = v32[v14];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v14 = v23;
          }
        }
LABEL_30:
        v11 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v14 << 6);
      }
      v28 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v20);
      v33 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + 16 * v20);
      if ((v6 & 1) == 0)
      {
        swift_retain();
        v29 = (id)v33;
      }
      sub_2277679B4();
      swift_bridgeObjectRetain();
      sub_227767768();
      swift_bridgeObjectRelease();
      result = sub_2277679CC();
      v15 = -1 << *(_BYTE *)(v8 + 32);
      v16 = result & ~v15;
      v17 = v16 >> 6;
      if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v26 = v17 == v25;
          if (v17 == v25)
            v17 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v12 + 8 * v17);
        }
        while (v27 == -1);
        v18 = __clz(__rbit64(~v27)) + (v17 << 6);
      }
      *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v18) = v28;
      *(_OWORD *)(*(_QWORD *)(v8 + 56) + 16 * v18) = v33;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release();
  *v3 = v8;
  return result;
}

uint64_t sub_227760E08(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8AD8);
  v42 = a2;
  v6 = sub_22776793C();
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
    sub_2277679B4();
    sub_227767768();
    result = sub_2277679CC();
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

unint64_t sub_22776112C(unint64_t result, uint64_t a2)
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
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_2277678B8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_2277679B4();
        swift_retain();
        swift_bridgeObjectRetain();
        sub_227767768();
        swift_bridgeObjectRelease();
        v9 = sub_2277679CC();
        result = swift_release();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_QWORD *)(v11 + 8 * v3);
          v13 = (_QWORD *)(v11 + 8 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

id sub_227761318()
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  __int128 v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8D28);
  v2 = *v0;
  v3 = sub_227767930();
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
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v13)
        goto LABEL_26;
      v20 = *(_QWORD *)(v6 + 8 * v9);
      if (!v20)
        break;
    }
LABEL_25:
    v12 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 16 * v15;
    v22 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v18);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v18) = v22;
    swift_retain();
    result = (id)v22;
  }
  v21 = v19 + 2;
  if (v21 >= v13)
    goto LABEL_26;
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2277614D4()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8AD8);
  v2 = *v0;
  v3 = sub_227767930();
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

void sub_22776168C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  _BOOL8 v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[6];

  v4 = *(_QWORD *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriLanguage + 8);
  if (v4)
  {
    v5 = *(_QWORD *)(a2 + OBJC_IVAR____TtC9SiriSetup8Defaults_localDataSource);
    *(_QWORD *)(v5 + 32) = *(_QWORD *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriLanguage);
    *(_QWORD *)(v5 + 40) = v4;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRelease();
    v6 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
    v7 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setLanguageCode_, v7);

  }
  v8 = *(void **)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriVoice);
  if (v8)
  {
    v9 = *(_QWORD *)(a2 + OBJC_IVAR____TtC9SiriSetup8Defaults_localDataSource);
    v10 = *(void **)(v9 + 24);
    *(_QWORD *)(v9 + 24) = v8;
    v11 = v8;

    v12 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
    objc_msgSend(v12, sel_setOutputVoice_, v11);

  }
  v13 = *(_QWORD *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriEnabled);
  if (v13)
  {
    v14 = v13 == 2;
    *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR____TtC9SiriSetup8Defaults_localDataSource) + 16) = v14;
    v15 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
    objc_msgSend(v15, sel_setAssistantIsEnabled_, v14);

  }
  if ((*(_BYTE *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriDataSharingStatus + 8) & 1) != 0)
    goto LABEL_9;
  *(_QWORD *)(a2 + OBJC_IVAR____TtC9SiriSetup8Defaults_internalSiriDataSharingStatus) = *(_QWORD *)(a1
                                                                                                  + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriDataSharingStatus);
  v16 = *(void **)(a2 + OBJC_IVAR____TtC9SiriSetup8Defaults_settingsQueue);
  v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = sub_227761D5C;
  *(_QWORD *)(v18 + 24) = v17;
  v23[4] = sub_227761D74;
  v23[5] = v18;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 1107296256;
  v23[2] = sub_2277607A8;
  v23[3] = &block_descriptor_5;
  v19 = _Block_copy(v23);
  v20 = v16;
  swift_retain();
  swift_release();
  dispatch_sync(v20, v19);

  _Block_release(v19);
  LOBYTE(v19) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if ((v19 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
LABEL_9:
    v21 = *(_QWORD *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_voiceTriggerEnabled);
    if (v21)
    {
      *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR____TtC9SiriSetup8Defaults_localDataSource) + 17) = v21 == 2;
      objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC9SiriSetup8Defaults_voiceTriggerPrefs), sel_setVoiceTriggerEnabled_);
    }
    v22 = *(_QWORD *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_setupDismissed);
    if (v22)
      *(_BYTE *)(a2 + OBJC_IVAR____TtC9SiriSetup8Defaults_setupDismissed) = v22 == 2;
  }
}

void sub_2277619D8(uint64_t a1, uint64_t a2, char a3, _QWORD *a4)
{
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  char v19;

  v8 = (_QWORD *)*a4;
  v10 = sub_2277607C8(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = (_QWORD *)*a4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = v16[7] + 16 * v10;

        *(_QWORD *)v17 = a1;
        *(_QWORD *)(v17 + 8) = &off_24EFD0358;
        return;
      }
      goto LABEL_11;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_227761318();
      goto LABEL_7;
    }
    sub_227760AFC(v13, a3 & 1);
    v18 = sub_2277607C8(a2);
    if ((v14 & 1) == (v19 & 1))
    {
      v10 = v18;
      v16 = (_QWORD *)*a4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_227761AFC(v10, a2, a1, v16);
      swift_retain();
      return;
    }
  }
  type metadata accessor for SetupPage();
  sub_2277679A8();
  __break(1u);
}

unint64_t sub_227761AFC(unint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_QWORD *)(a4[6] + 8 * result) = a2;
  v4 = (_QWORD *)(a4[7] + 16 * result);
  *v4 = a3;
  v4[1] = &off_24EFD0358;
  v5 = a4[2];
  v6 = __OFADD__(v5, 1);
  v7 = v5 + 1;
  if (v6)
    __break(1u);
  else
    a4[2] = v7;
  return result;
}

void sub_227761B4C(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType;
  uint64_t v4;
  os_log_type_t v5;
  char *v6;

  sub_2277678D0();
  sub_227767774();
  ObjectType = swift_getObjectType();
  MEMORY[0x22E29CC34](MEMORY[0x24BDD0240], ObjectType);
  sub_227767978();
  sub_227767774();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8028);
  sub_22776775C();
  sub_227767774();
  swift_bridgeObjectRelease();
  if (qword_2558F7DD0 != -1)
    swift_once();
  v4 = sub_227767678();
  __swift_project_value_buffer(v4, (uint64_t)qword_2558F8E48);
  v5 = sub_2277677EC();
  sub_227764D70(v5, 0xD000000000000029, 0x800000022776C0B0, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  v6 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LocalDataSourceWriter()), sel_init);
  *(_QWORD *)&v6[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriEnabled] = 1;
  *(_QWORD *)&v6[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_voiceTriggerEnabled] = 1;
  *(_QWORD *)&v6[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriInCallEnabled] = 1;
  *(_QWORD *)&v6[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_setupDismissed] = 2;
  sub_22776168C((uint64_t)v6, a2);

}

uint64_t sub_227761D38()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_227761D5C()
{
  uint64_t v0;

  sub_22776237C(v0);
}

uint64_t sub_227761D64()
{
  return swift_deallocObject();
}

uint64_t sub_227761D74()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t sub_227761DAC()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_227761DD8()
{
  uint64_t v0;

  return (*(uint64_t (**)(BOOL))(v0 + 16))(*(_QWORD *)(*(_QWORD *)(v0 + 32)
                                                               + OBJC_IVAR____TtC9SiriSetup8Defaults_internalSiriDataSharingStatus) == 0);
}

uint64_t sub_227761E18()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_227761E4C(char a1)
{
  uint64_t v1;

  return sub_22775F6C4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_227761E58()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_227761E84()
{
  uint64_t v0;

  return sub_22775FD40(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t (**)(_QWORD))(v0 + 32));
}

uint64_t sub_227761E90()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_227761EB4()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

void sub_227761EE8()
{
  uint64_t v0;

  sub_22775F900(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t sub_227761EF8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E29CC34](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_227761F38(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E29CC34](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_227761F90(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = sub_227767990();
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
    if (v12 || (sub_227767990() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

void sub_227762054()
{
  __asm { BR              X10 }
}

id sub_2277620B4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  swift_bridgeObjectRelease();
  v1 = OBJC_IVAR____TtC9SiriSetup8Defaults_voiceProfileManager;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup8Defaults_voiceProfileManager);
  v3 = (void *)objc_opt_self();
  v4 = v2;
  v5 = objc_msgSend(v3, sel_sharedPreferences);
  v6 = objc_msgSend(v5, sel_languageCode);

  if (v6)
  {
    sub_227767750();

  }
  v7 = (void *)sub_227767744();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v4, sel_isSATEnrolledForSiriProfileId_languageCode_, 0, v7);

  if ((v8 & 1) == 0)
  {
    v9 = *(id *)(v0 + v1);
    v10 = objc_msgSend(v3, sel_sharedPreferences);
    v11 = objc_msgSend(v10, sel_languageCode);

    if (v11)
    {
      sub_227767750();

    }
    v12 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
    v8 = objc_msgSend(v9, sel_hasVoiceProfileIniCloudForLanguageCode_, v12);

  }
  return v8;
}

void sub_22776237C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD aBlock[6];

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x22E29CD18](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9SiriSetup8Defaults_internalSiriDataSharingStatus);
    v5 = *(id *)(v2 + OBJC_IVAR____TtC9SiriSetup8Defaults_settings);
    v6 = (void *)sub_227767744();
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v3;
    aBlock[4] = sub_227763714;
    aBlock[5] = v7;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2277626DC;
    aBlock[3] = &block_descriptor_6;
    v8 = _Block_copy(aBlock);
    v9 = v3;
    swift_release();
    objc_msgSend(v5, sel_setSiriDataSharingOptInStatus_propagateToHomeAccessories_source_reason_completion_, v4, 0, 1, v6, v8);
    _Block_release(v8);

  }
}

void sub_2277624C4(void *a1)
{
  id v2;
  uint64_t v3;
  os_log_type_t v4;
  uint64_t v5;
  os_log_type_t v6;

  if (a1)
  {
    v2 = a1;
    sub_2277678D0();
    sub_227767774();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8DC0);
    sub_227767900();
    if (qword_2558F7DD0 != -1)
      swift_once();
    v3 = sub_227767678();
    __swift_project_value_buffer(v3, (uint64_t)qword_2558F8E48);
    v4 = sub_2277677E0();
    sub_227764D70(v4, 0xD000000000000015, 0x800000022776AA10, 0, 0xE000000000000000);
    swift_bridgeObjectRelease();

  }
  else
  {
    sub_2277678D0();
    sub_227767774();
    type metadata accessor for AFSiriDataSharingOptInStatus(0);
    sub_227767900();
    if (qword_2558F7DD0 != -1)
      swift_once();
    v5 = sub_227767678();
    __swift_project_value_buffer(v5, (uint64_t)qword_2558F8E48);
    v6 = sub_2277677EC();
    sub_227764D70(v6, 0xD000000000000015, 0x800000022776AA10, 0, 0xE000000000000000);
    swift_bridgeObjectRelease();
  }
}

void sub_2277626DC(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

void sub_227762730(uint64_t a1@<X0>, BOOL *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD aBlock[6];

  v4 = a1 + 16;
  swift_beginAccess();
  v5 = MEMORY[0x22E29CD18](v4);
  v6 = (void *)v5;
  if (v5)
  {
    v7 = *(id *)(v5 + OBJC_IVAR____TtC9SiriSetup8Defaults_settings);

    aBlock[4] = sub_227763C0C;
    aBlock[5] = a1;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_227762A70;
    aBlock[3] = &block_descriptor_19;
    v8 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_getSiriDataSharingOptInStatusWithCompletion_, v8);
    _Block_release(v8);

  }
  *a2 = v6 == 0;
}

void sub_227762834(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  os_log_type_t v6;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  os_log_type_t v11;

  if (a1)
  {
    v4 = a1;
    sub_2277678D0();
    sub_227767774();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8DC0);
    sub_227767900();
    if (qword_2558F7DD0 != -1)
      swift_once();
    v5 = sub_227767678();
    __swift_project_value_buffer(v5, (uint64_t)qword_2558F8E48);
    v6 = sub_2277677E0();
    sub_227764D70(v6, 0xD00000000000001CLL, 0x800000022776C6D0, 0, 0xE000000000000000);
    swift_bridgeObjectRelease();

  }
  else
  {
    v8 = a3 + 16;
    swift_beginAccess();
    v9 = (char *)MEMORY[0x22E29CD18](v8);
    if (v9)
    {
      *(_QWORD *)&v9[OBJC_IVAR____TtC9SiriSetup8Defaults_internalSiriDataSharingStatus] = a2;

    }
    sub_2277678D0();
    sub_227767774();
    type metadata accessor for AFSiriDataSharingOptInStatus(0);
    sub_227767900();
    if (qword_2558F7DD0 != -1)
      swift_once();
    v10 = sub_227767678();
    __swift_project_value_buffer(v10, (uint64_t)qword_2558F8E48);
    v11 = sub_2277677EC();
    sub_227764D70(v11, 0xD00000000000001CLL, 0x800000022776C6D0, 0, 0xE000000000000000);
    swift_bridgeObjectRelease();
  }
}

void sub_227762A70(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v5)(void *, uint64_t);
  id v6;

  v5 = *(void (**)(void *, uint64_t))(a1 + 32);
  swift_retain();
  v6 = a2;
  v5(a2, a3);
  swift_release();

}

void sub_227762AD0(uint64_t a1)
{
  __asm { BR              X12 }
}

void sub_227762B54()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  os_log_type_t v7;
  id v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  uint64_t (*v17)(void *);
  _QWORD *v18;

  swift_bridgeObjectRelease();
  v4 = sub_2277638C4();
  if (v4)
    v5 = v4;
  else
    v5 = MEMORY[0x24BEE4AF8];
  v13 = 0;
  v14 = 0xE000000000000000;
  sub_2277678D0();
  sub_227767774();
  MEMORY[0x22E29C55C](v5, MEMORY[0x24BEE0D00]);
  sub_227767774();
  swift_bridgeObjectRelease();
  if (qword_2558F7DD0 != -1)
    swift_once();
  v6 = sub_227767678();
  __swift_project_value_buffer(v6, (uint64_t)qword_2558F8E48);
  v7 = sub_2277677EC();
  sub_227764D70(v7, v3 + 14, 0x800000022776C530, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  v8 = *(id *)&v1[OBJC_IVAR____TtC9SiriSetup8Defaults_enablementFlowConfigurationProvider];
  v9 = (void *)sub_227767798();
  swift_bridgeObjectRelease();
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = v1;
  v10[3] = v2;
  v10[4] = v0;
  v17 = sub_227763A64;
  v18 = v10;
  v13 = MEMORY[0x24BDAC760];
  v14 = 1107296256;
  v15 = sub_227763240;
  v16 = &block_descriptor_6_3;
  v11 = _Block_copy(&v13);
  v12 = v1;
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_configurationForEnablementFlow_recognitionLanguageCodes_completion_, 2, v9, v11);
  _Block_release(v11);

}

uint64_t sub_227762DA8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[6];

  v7 = sub_2277676FC();
  v22 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_227767720();
  v11 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21, v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22775CE28();
  v15 = (void *)sub_227767834();
  v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = v16;
  v17[3] = a1;
  v17[4] = a3;
  v17[5] = a4;
  aBlock[4] = sub_227763AC8;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22775FF30;
  aBlock[3] = &block_descriptor_15;
  v18 = _Block_copy(aBlock);
  v19 = a1;
  swift_retain();
  swift_release();
  sub_227767708();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_227761EF8((unint64_t *)&qword_2558F8AA8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8AB0);
  sub_227761F38((unint64_t *)&qword_2558F8AB8, &qword_2558F8AB0);
  sub_2277678AC();
  MEMORY[0x22E29C5F8](0, v14, v10, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v21);
}

void sub_227762FDC(uint64_t a1, void *a2, void (*a3)(id))
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  os_log_type_t v14;
  void *v15;
  id v16;

  v5 = a1 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x22E29CD18](v5);
  if (v6)
  {
    v7 = (char *)v6;
    v8 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
    v9 = objc_msgSend(v8, sel_languageCode);

    if (v9)
    {
      sub_227767750();

    }
    else
    {
      sub_227763734();
    }
    v10 = *(void **)&v7[OBJC_IVAR____TtC9SiriSetup8Defaults_enablementConfiguration];
    *(_QWORD *)&v7[OBJC_IVAR____TtC9SiriSetup8Defaults_enablementConfiguration] = a2;
    v11 = a2;

    sub_2277678D0();
    sub_227767774();
    v12 = objc_msgSend(v11, sel_description);
    sub_227767750();

    sub_227767774();
    swift_bridgeObjectRelease();
    sub_227767774();
    sub_227767774();
    if (qword_2558F7DD0 != -1)
      swift_once();
    v13 = sub_227767678();
    __swift_project_value_buffer(v13, (uint64_t)qword_2558F8E48);
    v14 = sub_2277677EC();
    sub_227764D70(v14, 0xD000000000000028, 0x800000022776C530, 0, 0xE000000000000000);
    swift_bridgeObjectRelease();
    v15 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
    v16 = objc_msgSend(v11, sel_requiresVoiceSelectionForRecognitionLanguage_, v15);

    a3(v16);
  }
}

void sub_227763240(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

char *sub_227763290(char *a1)
{
  _BYTE *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(uint64_t);
  char v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  objc_class *v16;
  char *v17;
  void *v18;
  char *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;
  uint64_t v25;

  v3 = sub_227767828();
  v22 = *(_QWORD *)(v3 - 8);
  v23 = v3;
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22776781C();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8]();
  sub_227767720();
  MEMORY[0x24BDAC7A8]();
  v7 = *a1;
  v8 = OBJC_IVAR____TtC9SiriSetup8Defaults_localDataSource;
  type metadata accessor for LocalDataSource();
  v9 = swift_allocObject();
  *(_WORD *)(v9 + 16) = 514;
  *(_BYTE *)(v9 + 18) = 2;
  *(_QWORD *)(v9 + 32) = 0;
  *(_QWORD *)(v9 + 40) = 0;
  *(_QWORD *)(v9 + 24) = 0;
  *(_QWORD *)&v1[v8] = v9;
  v1[OBJC_IVAR____TtC9SiriSetup8Defaults_setupDismissed] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup8Defaults_enablementConfiguration] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup8Defaults_internalSiriDataSharingStatus] = 0;
  v1[OBJC_IVAR____TtC9SiriSetup8Defaults_enrollmentMode] = v7;
  v10 = objc_allocWithZone(MEMORY[0x24BE092B8]);
  v11 = v1;
  v12 = objc_msgSend(v10, sel_init);
  *(_QWORD *)&v11[OBJC_IVAR____TtC9SiriSetup8Defaults_settings] = v12;
  sub_22775CE28();
  sub_227767708();
  v25 = MEMORY[0x24BEE4AF8];
  sub_227761EF8(&qword_2558F8D30, v6, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8D38);
  sub_227761F38(&qword_2558F8D40, &qword_2558F8D38);
  sub_2277678AC();
  (*(void (**)(char *, _QWORD, uint64_t))(v22 + 104))(v5, *MEMORY[0x24BEE5750], v23);
  *(_QWORD *)&v11[OBJC_IVAR____TtC9SiriSetup8Defaults_settingsQueue] = sub_227767858();
  v13 = objc_msgSend(objc_allocWithZone((Class)SRSVoiceProfileManager), sel_init);
  *(_QWORD *)&v11[OBJC_IVAR____TtC9SiriSetup8Defaults_voiceProfileManager] = v13;
  v14 = objc_msgSend(objc_allocWithZone((Class)SRSVTPreferences), sel_init);
  *(_QWORD *)&v11[OBJC_IVAR____TtC9SiriSetup8Defaults_voiceTriggerPrefs] = v14;
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE091D0]), sel_init);
  *(_QWORD *)&v11[OBJC_IVAR____TtC9SiriSetup8Defaults_enablementFlowConfigurationProvider] = v15;

  v16 = (objc_class *)type metadata accessor for Defaults();
  v24.receiver = v11;
  v24.super_class = v16;
  v17 = (char *)objc_msgSendSuper2(&v24, sel_init);
  v18 = *(void **)&v17[OBJC_IVAR____TtC9SiriSetup8Defaults_settingsQueue];
  swift_allocObject();
  swift_unknownObjectWeakInit();
  v19 = v17;
  v20 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8DC8);
  sub_227767840();

  swift_release();
  return v19;
}

id sub_227763618()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Defaults();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for Defaults()
{
  return objc_opt_self();
}

uint64_t sub_2277636F0()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_227763714(void *a1)
{
  sub_2277624C4(a1);
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t sub_227763734()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
  v1 = objc_msgSend(v0, sel_bestSupportedLanguageCodeForLanguageCode_, 0);

  if (v1)
  {
    v2 = sub_227767750();
    v4 = v3;

  }
  else
  {
    v2 = 0;
    v4 = 0;
  }
  sub_2277678D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8000);
  sub_22776775C();
  sub_227767774();
  swift_bridgeObjectRelease();
  if (qword_2558F7DD0 != -1)
    swift_once();
  v5 = sub_227767678();
  __swift_project_value_buffer(v5, (uint64_t)qword_2558F8E48);
  v6 = sub_2277677EC();
  sub_227764D70(v6, 0xD000000000000019, 0x800000022776C620, 0xD00000000000002ELL, 0x800000022776C640);
  swift_bridgeObjectRelease();
  if (v4)
    return v2;
  else
    return 0;
}

uint64_t sub_2277638C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v0 = sub_227767630();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  HIBYTE(v11) = 0;
  v5 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
  v6 = objc_msgSend((id)objc_opt_self(), sel_currentLocale);
  sub_227767624();

  sub_227767618();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  v7 = (void *)sub_227767744();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v5, sel_allSiriLanguageCodesForSystemLanguageCode_isGoodFit_, v7, (char *)&v11 + 7);

  if (!v8)
    return 0;
  v9 = sub_2277677A4();

  return v9;
}

uint64_t sub_227763A38()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_227763A64(void *a1)
{
  uint64_t *v1;

  return sub_227762DA8(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_227763A70()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_227763A94()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

void sub_227763AC8()
{
  uint64_t v0;

  sub_227762FDC(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(id))(v0 + 32));
}

uint64_t sub_227763AD4()
{
  uint64_t result;
  _QWORD *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  result = sub_2277638C4();
  if (result)
  {
    v1 = (_QWORD *)result;
    if (*(_QWORD *)(result + 16) <= 1uLL)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    else
    {
      v2 = (void *)objc_opt_self();
      v3 = objc_msgSend(v2, sel_sharedPreferences);
      v4 = objc_msgSend(v3, sel_languageCode);

      if (v4
        && (v4,
            v5 = objc_msgSend(v2, sel_sharedPreferences),
            v6 = objc_msgSend(v5, sel_languageCode),
            v5,
            v6))
      {
        v7 = sub_227767750();
        v9 = v8;

        v10 = sub_227761F90(v7, v9, v1);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v10 & 1) == 0)
          return 0;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      return 1;
    }
  }
  return result;
}

void sub_227763BF4(BOOL *a1@<X8>)
{
  uint64_t v1;

  sub_227762730(v1, a1);
}

void sub_227763C0C(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_227762834(a1, a2, v2);
}

void sub_227763C2C(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  void *v25;
  uint64_t v26;
  _BYTE v27[16];
  _BYTE v28[8];
  uint64_t v29;
  _QWORD v30[2];

  sub_227759610(a1 + 32, (uint64_t)v28, &qword_2558F8700);
  sub_227759610((uint64_t)v28, (uint64_t)&v29, &qword_2558F8700);
  v3 = MEMORY[0x24BDAC760];
  if (v29 && *(_QWORD *)(v29 + 16))
  {
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v1;
    swift_bridgeObjectRetain();
    v5 = v1;
    v6 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
    v25 = sub_227764490;
    v26 = v4;
    v21 = v3;
    v22 = 1107296256;
    v23 = sub_227763240;
    v24 = &block_descriptor_12_1;
    v7 = _Block_copy(&v21);
    v8 = objc_msgSend((id)objc_opt_self(), (SEL)&selRef_initWithDelegate_ + 4, v6, 0, v7);

    _Block_release(v7);
    swift_release();
    v9 = objc_msgSend(v5, sel_addAction_, v8);

  }
  sub_227759610(a1 + 40, (uint64_t)v27, &qword_2558F8000);
  sub_227759610((uint64_t)v27, (uint64_t)v30, &qword_2558F8000);
  if (v30[1])
  {
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v1;
    v11 = v1;
    sub_2277521B4((uint64_t)v27);
    v12 = (void *)sub_227767744();
    sub_2277521DC((uint64_t)v27);
    v25 = sub_227764488;
    v26 = v10;
    v21 = v3;
    v22 = 1107296256;
    v23 = sub_227763240;
    v24 = &block_descriptor_6_4;
    v13 = _Block_copy(&v21);
    v14 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v12, 1, v13);

    _Block_release(v13);
    swift_release();
    v15 = objc_msgSend(v11, sel_addAction_, v14);

  }
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v1;
  v17 = v1;
  v18 = (void *)sub_227767744();
  v25 = sub_227764468;
  v26 = v16;
  v21 = v3;
  v22 = 1107296256;
  v23 = sub_227763240;
  v24 = &block_descriptor_7;
  v19 = _Block_copy(&v21);
  v20 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v18, 0, v19);

  _Block_release(v19);
  swift_release();
  objc_msgSend(v17, sel_setDismissButtonAction_, v20);

}

void sub_227763F94(void *a1, char *a2)
{
  id v4;
  unint64_t v5;
  id v6;
  void *v7;
  id v8;
  char v9;
  uint64_t v10;

  v4 = objc_msgSend(a2, sel_actions);
  sub_2277596B8();
  v5 = sub_2277677A4();

  if (!(v5 >> 62))
  {
    if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_11:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v10 = sub_227767924();
  swift_bridgeObjectRelease();
  if (!v10)
    goto LABEL_11;
LABEL_3:
  if ((v5 & 0xC000000000000001) != 0)
  {
    v6 = (id)MEMORY[0x22E29C694](0, v5);
  }
  else
  {
    if (!*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    v6 = *(id *)(v5 + 32);
  }
  v7 = v6;
  swift_bridgeObjectRelease();
  v8 = a1;
  v9 = sub_227767864();

  if ((v9 & 1) != 0)
  {
    if (MEMORY[0x22E29CD18](&a2[OBJC_IVAR____TtC9SiriSetup23IntroProxCardController_delegate]))
    {
      sub_227752E1C();
      swift_unknownObjectRelease();
    }
  }
}

void sub_2277640F4(void *a1, char *a2)
{
  id v4;
  unint64_t v5;
  id v6;
  void *v7;
  id v8;
  char v9;
  uint64_t v10;

  v4 = objc_msgSend(a2, sel_actions);
  sub_2277596B8();
  v5 = sub_2277677A4();

  if (!(v5 >> 62))
  {
    if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_9:
    swift_bridgeObjectRelease();
LABEL_10:
    if (MEMORY[0x22E29CD18](&a2[OBJC_IVAR____TtC9SiriSetup23IntroProxCardController_delegate]))
    {
      sub_227752FF4();
      swift_unknownObjectRelease();
    }
    return;
  }
  swift_bridgeObjectRetain();
  v10 = sub_227767924();
  swift_bridgeObjectRelease();
  if (!v10)
    goto LABEL_9;
LABEL_3:
  if ((v5 & 0xC000000000000001) != 0)
  {
    v6 = (id)MEMORY[0x22E29C694](0, v5);
  }
  else
  {
    if (!*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    v6 = *(id *)(v5 + 32);
  }
  v7 = v6;
  swift_bridgeObjectRelease();
  v8 = a1;
  v9 = sub_227767864();

  if ((v9 & 1) == 0)
    goto LABEL_10;
}

uint64_t sub_227764248(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  uint64_t v6;

  result = MEMORY[0x22E29CD18](a2 + OBJC_IVAR____TtC9SiriSetup23IntroProxCardController_delegate);
  if (result)
  {
    v3 = result;
    if (qword_2558F7DD0 != -1)
      swift_once();
    v4 = sub_227767678();
    __swift_project_value_buffer(v4, (uint64_t)qword_2558F8E48);
    v5 = sub_2277677EC();
    sub_227764D70(v5, 0xD000000000000015, 0x800000022776AB50, 0xD000000000000012, 0x800000022776C7B0);
    if (MEMORY[0x22E29CD18](v3 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_delegate))
    {
      v6 = swift_retain();
      sub_2277496E4(v6);
      swift_unknownObjectRelease();
      swift_release();
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_22776438C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntroProxCardController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IntroProxCardController()
{
  return objc_opt_self();
}

void *sub_227764414()
{
  _QWORD *v0;
  void *v1;
  id v2;

  v1 = *(void **)(*v0 + OBJC_IVAR____TtC9SiriSetup23IntroProxCardController_orbView);
  v2 = v1;
  return v1;
}

uint64_t sub_227764444()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_227764468(uint64_t a1)
{
  uint64_t v1;

  return sub_227764248(a1, *(_QWORD *)(v1 + 16));
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

void sub_227764488(void *a1)
{
  uint64_t v1;

  sub_2277640F4(a1, *(char **)(v1 + 16));
}

void sub_227764490(void *a1)
{
  uint64_t v1;

  sub_227763F94(a1, *(char **)(v1 + 16));
}

char *sub_227764498(uint64_t a1)
{
  char *v1;
  id v3;
  char *v4;
  char *v5;
  void *v6;
  void *v7;
  char *v8;
  char *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;
  _BYTE v15[16];
  uint64_t v16;
  void *v17;

  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup23IntroProxCardController_orbView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup23IntroProxCardController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v3 = objc_allocWithZone((Class)type metadata accessor for SiriSetupProxCardView());
  v4 = sub_227750264(1);
  v14.receiver = v1;
  v14.super_class = (Class)type metadata accessor for IntroProxCardController();
  v5 = (char *)objc_msgSendSuper2(&v14, sel_initWithContentView_, v4);
  v6 = (void *)sub_227767744();
  objc_msgSend(v5, sel_setTitle_, v6);

  sub_227759610(a1 + 16, (uint64_t)v15, &qword_2558F8000);
  sub_227759610((uint64_t)v15, (uint64_t)&v16, &qword_2558F8000);
  v7 = v17;
  if (v17)
  {
    v8 = v5;
    sub_2277521B4((uint64_t)v15);
    v7 = (void *)sub_227767744();
    sub_2277521DC((uint64_t)v15);
  }
  else
  {
    v9 = v5;
  }
  objc_msgSend(v5, sel_setSubtitle_, v7);

  objc_msgSend(v5, sel_setDismissalType_, 1);
  v10 = *(void **)&v4[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbView];
  v11 = *(void **)&v5[OBJC_IVAR____TtC9SiriSetup23IntroProxCardController_orbView];
  *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup23IntroProxCardController_orbView] = v10;
  v12 = v10;

  sub_227763C2C(a1);
  return v5;
}

id sub_227764648(uint64_t a1)
{
  char *v1;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t aBlock;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  uint64_t (*v31)(uint64_t);
  uint64_t v32;
  objc_super v33;
  _BYTE v34[8];
  _BYTE v35[16];
  uint64_t v36;
  void *v37;
  uint64_t v38;

  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup29DataSharingProxCardController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR____TtC9SiriSetup29DataSharingProxCardController_orbView] = 0;
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE7B3D8]), sel_init);
  v33.receiver = v1;
  v33.super_class = (Class)type metadata accessor for DataSharingProxCardController();
  v4 = objc_msgSendSuper2(&v33, sel_initWithContentView_, v3);
  v5 = (void *)sub_227767744();
  objc_msgSend(v4, sel_setTitle_, v5);

  sub_227759610(a1 + 16, (uint64_t)v35, &qword_2558F8000);
  sub_227759610((uint64_t)v35, (uint64_t)&v36, &qword_2558F8000);
  v6 = v37;
  if (v37)
  {
    v7 = v4;
    sub_2277521B4((uint64_t)v35);
    v6 = (void *)sub_227767744();
    sub_2277521DC((uint64_t)v35);
  }
  else
  {
    v8 = v4;
  }
  objc_msgSend(v4, sel_setSubtitle_, v6);

  objc_msgSend(v4, sel_setDismissalType_, 1);
  sub_227759610(a1 + 32, (uint64_t)v34, &qword_2558F8700);
  sub_227759610((uint64_t)v34, (uint64_t)&v38, &qword_2558F8700);
  if (v38 && *(_QWORD *)(v38 + 16))
    swift_bridgeObjectRetain();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v4;
  v10 = v4;
  v11 = (void *)sub_227767744();
  swift_bridgeObjectRelease();
  v31 = sub_227764C00;
  v32 = v9;
  v12 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v28 = 1107296256;
  v29 = sub_227763240;
  v30 = &block_descriptor_8;
  v13 = _Block_copy(&aBlock);
  v14 = (void *)objc_opt_self();
  v15 = objc_msgSend(v14, sel_actionWithTitle_style_handler_, v11, 0, v13);

  _Block_release(v13);
  swift_release();
  if (*(_QWORD *)(a1 + 48))
    swift_bridgeObjectRetain();
  sub_227748A14(a1);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v10;
  v17 = v10;
  v18 = (void *)sub_227767744();
  swift_bridgeObjectRelease();
  v31 = sub_227764C38;
  v32 = v16;
  aBlock = v12;
  v28 = 1107296256;
  v29 = sub_227763240;
  v30 = &block_descriptor_6_5;
  v19 = _Block_copy(&aBlock);
  v20 = objc_msgSend(v14, sel_actionWithTitle_style_handler_, v18, 1, v19);

  _Block_release(v19);
  swift_release();

  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v17;
  v22 = v17;
  v23 = (void *)sub_227767744();
  v31 = sub_227764C58;
  v32 = v21;
  aBlock = v12;
  v28 = 1107296256;
  v29 = sub_227763240;
  v30 = &block_descriptor_12_2;
  v24 = _Block_copy(&aBlock);
  v25 = objc_msgSend(v14, sel_actionWithTitle_style_handler_, v23, 0, v24);

  _Block_release(v24);
  swift_release();
  objc_msgSend(v22, sel_setDismissButtonAction_, v25);

  return v22;
}

uint64_t sub_227764AAC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t result;

  result = MEMORY[0x22E29CD18](a2 + OBJC_IVAR____TtC9SiriSetup29DataSharingProxCardController_delegate);
  if (result)
  {
    a3();
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_227764B24()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DataSharingProxCardController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DataSharingProxCardController()
{
  return objc_opt_self();
}

void *sub_227764BAC()
{
  _QWORD *v0;
  void *v1;
  id v2;

  v1 = *(void **)(*v0 + OBJC_IVAR____TtC9SiriSetup29DataSharingProxCardController_orbView);
  v2 = v1;
  return v1;
}

uint64_t sub_227764BDC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_227764C00(uint64_t a1)
{
  uint64_t v1;

  return sub_227764AAC(a1, *(_QWORD *)(v1 + 16), (void (*)(void))sub_22774F7D0);
}

uint64_t block_copy_helper_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_8()
{
  return swift_release();
}

uint64_t sub_227764C38(uint64_t a1)
{
  uint64_t v1;

  return sub_227764AAC(a1, *(_QWORD *)(v1 + 16), (void (*)(void))sub_22774F8F8);
}

uint64_t sub_227764C58(uint64_t a1)
{
  uint64_t v1;

  return sub_227764AAC(a1, *(_QWORD *)(v1 + 16), (void (*)(void))sub_22774FA44);
}

uint64_t sub_227764C90()
{
  uint64_t result;

  sub_227765614();
  result = sub_227767870();
  qword_2558F8E40 = result;
  return result;
}

uint64_t sub_227764CF0()
{
  uint64_t v0;
  id v1;

  v0 = sub_227767678();
  __swift_allocate_value_buffer(v0, qword_2558F8E48);
  __swift_project_value_buffer(v0, (uint64_t)qword_2558F8E48);
  if (qword_2558F7DC8 != -1)
    swift_once();
  v1 = (id)qword_2558F8E40;
  return sub_227767684();
}

void sub_227764D70(os_log_type_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  NSObject *log;
  uint64_t v12[3];
  uint64_t v13;
  unint64_t v14;

  v5 = a3;
  v6 = a2;
  v13 = a2;
  v14 = a3;
  if (!a5)
    goto LABEL_6;
  v8 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0)
    v8 = a4 & 0xFFFFFFFFFFFFLL;
  if (v8)
  {
    v12[0] = 32;
    v12[1] = 0xE100000000000000;
    swift_bridgeObjectRetain();
    sub_227767774();
    sub_227767774();
    swift_bridgeObjectRelease();
    v6 = v13;
    v5 = v14;
  }
  else
  {
LABEL_6:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  log = sub_22776766C();
  if (os_log_type_enabled(log, a1))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v12[0] = v10;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain();
    v12[2] = sub_227764F58(v6, v5, v12);
    sub_22776787C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_227742000, log, a1, "%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E29CCD0](v10, -1, -1);
    MEMORY[0x22E29CCD0](v9, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease_n();

  }
}

uint64_t sub_227764F58(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_227765028(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_227765598((uint64_t)v12, *a3);
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
      sub_227765598((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_227765028(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_227767888();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2277651E0(a5, a6);
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
  v8 = sub_2277678F4();
  if (!v8)
  {
    sub_22776790C();
    __break(1u);
LABEL_17:
    result = sub_227767954();
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

uint64_t sub_2277651E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_227765274(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_22776544C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_22776544C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_227765274(uint64_t a1, unint64_t a2)
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
      v3 = sub_2277653E8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2277678DC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_22776790C();
      __break(1u);
LABEL_10:
      v2 = sub_227767780();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_227767954();
    __break(1u);
LABEL_14:
    result = sub_22776790C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2277653E8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8E60);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22776544C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558F8E60);
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
  result = sub_227767954();
  __break(1u);
  return result;
}

uint64_t sub_227765598(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

unint64_t sub_227765614()
{
  unint64_t result;

  result = qword_2558F8E68;
  if (!qword_2558F8E68)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2558F8E68);
  }
  return result;
}

void sub_227765650(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_22776569C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_227765714 + 4 * byte_2277698BC[a2]))(0x6464754220534F69);
}

uint64_t sub_227765714(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x6464754220534F69 && v1 == 0xE900000000000079)
    v2 = 1;
  else
    v2 = sub_227767990();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_2277657CC()
{
  qword_2558F8E70 = 0x6573616870;
  *(_QWORD *)algn_2558F8E78 = 0xE500000000000000;
}

id sub_2277659E4(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v3 = OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerRedColor;
  v4 = v1;
  *(_QWORD *)&v1[v3] = CGColorCreateGenericRGB(0.96875, 0.25390625, 0.36328125, 1.0);
  v5 = OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerBlueColor;
  *(_QWORD *)&v4[v5] = CGColorCreateGenericRGB(0.15625, 0.52734375, 0.9921875, 1.0);
  v6 = OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerBackgroundColor;
  *(_QWORD *)&v4[v6] = CGColorCreateGenericRGB(1.0, 1.0, 1.0, 1.0);

  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for ColorLayer();
  v7 = objc_msgSendSuper2(&v9, sel_initWithCoder_, a1);

  return v7;
}

void sub_227765BE4()
{
  char *v0;
  double v1;
  CGFloat v2;
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  size_t v12;
  CGColorSpace *DeviceRGB;
  CGContext *v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  id v30;
  char v31;
  CGColor *GenericRGB;
  CGColorRef CopyWithAlpha;
  CGColorRef v34;
  CGContext *v35;
  CGImageRef Image;
  uint64_t v37;
  CGFloat rect;
  CGFloat v39;
  CGImageRef v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  objc_msgSend(v0, sel_bounds);
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  objc_msgSend(v0, sel_bounds);
  v10 = v9;
  if ((~*(_QWORD *)&v9 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_44;
  }
  if (v9 <= -9.22337204e18)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (v9 >= 9.22337204e18)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  objc_msgSend(v0, sel_bounds);
  if ((~*(_QWORD *)&v11 & 0x7FF0000000000000) == 0)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  if (v11 <= -9.22337204e18)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if (v11 < 9.22337204e18)
  {
    v12 = (uint64_t)v11;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v14 = CGBitmapContextCreate(0, (uint64_t)v10, v12, 8uLL, 0, DeviceRGB, 2u);

    if (v14)
    {
      v41.origin.x = v2;
      v41.origin.y = v4;
      v41.size.width = v6;
      v41.size.height = v8;
      CGContextClearRect(v14, v41);
    }
    v39 = v4;
    v15 = objc_msgSend(v0, sel_presentationLayer);
    v16 = 0.0;
    v17 = 0.0;
    if (v15)
    {
      v18 = v15;
      objc_msgSend(v15, sel_phase);
      v17 = v19;

    }
    rect = v8;
    v20 = (v17 + -0.57) / 0.4 * 12.0;
    if (v20 > -10.0)
    {
      v16 = 1.0;
      if (v20 < 10.0)
        v16 = 1.0 / (exp(-v20) + 1.0);
    }
    v21 = (v17 + -0.4) / 0.8 * 12.0;
    v22 = 0.0;
    v23 = 0.0;
    if (v21 > -10.0)
    {
      v23 = 1.0;
      if (v21 < 10.0)
        v23 = 1.0 / (exp(-v21) + 1.0);
    }
    v24 = (v17 + -0.6) / 0.3 * 12.0;
    if (v24 > -10.0)
    {
      v22 = 1.0;
      if (v24 < 10.0)
        v22 = 1.0 / (exp(-v24) + 1.0);
    }
    v25 = (v17 + -0.35) / 0.6 * 12.0;
    v26 = 0.0;
    v27 = 0.0;
    if (v25 > -10.0)
    {
      v27 = 1.0;
      if (v25 < 10.0)
        v27 = 1.0 / (exp(-v25) + 1.0);
    }
    v28 = (v17 + -0.3) / 0.4 * 12.0;
    if (v28 > -10.0)
    {
      v26 = 1.0;
      if (v28 < 10.0)
        v26 = 1.0 / (exp(-v28) + 1.0);
    }
    v29 = objc_msgSend((id)objc_opt_self(), sel_currentTraitCollection);
    v30 = objc_msgSend(v29, sel_userInterfaceStyle);

    if (v30 == (id)1)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v31 = sub_227767990();
      swift_bridgeObjectRelease();
      if ((v31 & 1) == 0)
        goto LABEL_30;
    }
    v16 = 0.0;
LABEL_30:
    if (v14)
    {
      CGContextSetFillColorWithColor(v14, *(CGColorRef *)&v0[OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerRedColor]);
      v42.origin.x = v2;
      v42.origin.y = v39;
      v42.size.width = v6 * v26;
      v42.size.height = rect;
      CGContextFillRect(v14, v42);
      CGContextSetFillColorWithColor(v14, *(CGColorRef *)&v0[OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerBlueColor]);
      v43.origin.x = v2;
      v43.origin.y = v39;
      v43.size.width = v6 * v27;
      v43.size.height = rect;
      CGContextFillRect(v14, v43);
    }
    GenericRGB = CGColorCreateGenericRGB((1.0 - v22) * 0.37890625, (1.0 - v22) * 0.98828125, (1.0 - v22) * 0.67578125, 1.0);
    if (v14)
    {
      CGContextSetFillColorWithColor(v14, GenericRGB);
      v44.origin.y = v39;
      v44.origin.x = v2;
      v44.size.width = v6 * v23;
      v44.size.height = rect;
      CGContextFillRect(v14, v44);
    }
    CopyWithAlpha = CGColorCreateCopyWithAlpha(*(CGColorRef *)&v0[OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerBackgroundColor], v16);
    if (CopyWithAlpha)
    {
      v34 = CopyWithAlpha;
      if (!v14)
      {

        goto LABEL_41;
      }
      CGContextSetFillColorWithColor(v14, CopyWithAlpha);
      v35 = v14;
      objc_msgSend(v0, sel_bounds);
      CGContextFillRect(v35, v45);

    }
    else if (!v14)
    {
      goto LABEL_41;
    }
    Image = CGBitmapContextCreateImage(v14);
    if (Image)
    {
      v40 = Image;
      type metadata accessor for CGImage(0);
      v37 = sub_227767984();

LABEL_42:
      objc_msgSend(v0, sel_setContents_, v37, *(_QWORD *)&rect);

      swift_unknownObjectRelease();
      return;
    }
LABEL_41:
    v37 = 0;
    goto LABEL_42;
  }
LABEL_48:
  __break(1u);
}

id sub_227766164(uint64_t a1, uint64_t a2)
{
  void *v2;
  BOOL v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v15;

  if (qword_2558F7DD8 != -1)
    swift_once();
  v5 = qword_2558F8E70 == a1 && *(_QWORD *)algn_2558F8E78 == a2;
  if (v5 || (sub_227767990() & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v6 = (void *)sub_227767744();
    swift_bridgeObjectRelease();
    v7 = objc_msgSend((id)objc_opt_self(), sel_animationWithKeyPath_, v6);

    v8 = *MEMORY[0x24BDE5D30];
    v9 = (void *)objc_opt_self();
    v10 = v7;
    v11 = objc_msgSend(v9, sel_functionWithName_, v8);
    objc_msgSend(v10, sel_setTimingFunction_, v11);

    objc_msgSend(v2, sel_phase);
    v12 = (void *)sub_227767660();
    objc_msgSend(v10, sel_setFromValue_, v12);

  }
  else
  {
    v13 = (void *)sub_227767744();
    v15.receiver = v2;
    v15.super_class = (Class)type metadata accessor for ColorLayer();
    v10 = objc_msgSendSuper2(&v15, sel_actionForKey_, v13);

  }
  return v10;
}

id sub_227766368()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ColorLayer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ColorLayer()
{
  return objc_opt_self();
}

char *sub_227766400(_BYTE *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  _BYTE *v5;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  char *v15;
  _BYTE *v16;
  id v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char *v22;
  char *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  char **v34;
  void *v35;
  objc_super v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _OWORD v44[2];
  _OWORD v45[6];
  _OWORD v46[3];

  *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v11 = &v5[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_presentingViewController];
  *v11 = 0;
  v11[1] = 0;
  v12 = &v5[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_dataSource];
  *v12 = a1;
  v12[1] = a2;
  v13 = &v5[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_dataSourceWriter];
  *v13 = a3;
  v13[1] = a4;
  v14 = OBJC_IVAR____TtC9SiriSetup8Defaults_enrollmentMode;
  v5[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_viewStyle] = 0x20100u >> (8
                                                                          * a1[OBJC_IVAR____TtC9SiriSetup8Defaults_enrollmentMode]);
  *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_page] = a5;
  v15 = v5;
  v16 = a1;
  v17 = a3;
  swift_retain();
  sub_227766A50((uint64_t)v16);
  v18 = &v15[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_viewModel];
  v19 = v43;
  *((_OWORD *)v18 + 4) = v42;
  *((_OWORD *)v18 + 5) = v19;
  *((_OWORD *)v18 + 6) = v44[0];
  *(_OWORD *)(v18 + 105) = *(_OWORD *)((char *)v44 + 9);
  v20 = v39;
  *(_OWORD *)v18 = v38;
  *((_OWORD *)v18 + 1) = v20;
  v21 = v41;
  *((_OWORD *)v18 + 2) = v40;
  *((_OWORD *)v18 + 3) = v21;

  v37.receiver = v15;
  v37.super_class = (Class)type metadata accessor for SuccessPresenter();
  v22 = (char *)objc_msgSendSuper2(&v37, sel_init);
  LODWORD(a2) = 0x20100u >> (8 * a1[v14]);
  v23 = &v22[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_viewModel];
  swift_beginAccess();
  v24 = *(_OWORD *)v23;
  v25 = *((_OWORD *)v23 + 1);
  v26 = *((_OWORD *)v23 + 3);
  v45[2] = *((_OWORD *)v23 + 2);
  v45[3] = v26;
  v45[0] = v24;
  v45[1] = v25;
  v27 = *((_OWORD *)v23 + 4);
  v28 = *((_OWORD *)v23 + 5);
  v29 = *((_OWORD *)v23 + 6);
  *(_OWORD *)((char *)v46 + 9) = *(_OWORD *)(v23 + 105);
  v45[5] = v28;
  v46[0] = v29;
  v45[4] = v27;
  v30 = v22;
  sub_227748948((uint64_t)v45);
  v31 = sub_227766608(a2, (uint64_t)v45);
  v33 = v32;

  swift_release();
  sub_227748A14((uint64_t)v45);
  v34 = (char **)&v30[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_presentingViewController];
  v35 = *(void **)&v30[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_presentingViewController];
  *v34 = v31;
  v34[1] = v33;

  return v30;
}

char *sub_227766608(char a1, uint64_t a2)
{
  uint64_t v3;
  os_log_type_t v4;
  char *v5;
  id v6;
  id v7;

  if (a1)
  {
    if (a1 == 1)
    {
      sub_2277678D0();
      sub_227767774();
      sub_227767900();
      sub_227767774();
      if (qword_2558F7DD0 != -1)
        swift_once();
      v3 = sub_227767678();
      __swift_project_value_buffer(v3, (uint64_t)qword_2558F8E48);
      v4 = sub_2277677E0();
      sub_227764D70(v4, 0xD000000000000028, 0x800000022776B0C0, 0, 0xE000000000000000);
      swift_bridgeObjectRelease();
      return 0;
    }
    else
    {
      v7 = objc_allocWithZone((Class)type metadata accessor for SuccessProxCardController());
      sub_227748948(a2);
      v5 = sub_227759478(a2);
      sub_227748A14(a2);
      *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup25SuccessProxCardController_delegate + 8] = &off_24EFD1480;
      swift_unknownObjectWeakAssign();
    }
  }
  else
  {
    v6 = objc_allocWithZone((Class)type metadata accessor for SuccessWelcomeController());
    sub_227748948(a2);
    v5 = sub_227754CC4(a2);
    *(_QWORD *)&v5[OBJC_IVAR____TtC9SiriSetup24SuccessWelcomeController_delegate + 8] = &off_24EFD1480;
    swift_unknownObjectWeakAssign();
  }
  return v5;
}

id sub_227766830()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuccessPresenter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SuccessPresenter()
{
  return objc_opt_self();
}

double sub_227766930@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  __int128 *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[2];

  v3 = (__int128 *)(v1 + OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_viewModel);
  swift_beginAccess();
  v4 = v3[5];
  v15 = v3[4];
  v16 = v4;
  v17[0] = v3[6];
  *(_OWORD *)((char *)v17 + 9) = *(__int128 *)((char *)v3 + 105);
  v5 = v3[1];
  v11 = *v3;
  v12 = v5;
  v6 = v3[3];
  v13 = v3[2];
  v14 = v6;
  sub_227748948((uint64_t)&v11);
  v7 = v16;
  a1[4] = v15;
  a1[5] = v7;
  a1[6] = v17[0];
  *(_OWORD *)((char *)a1 + 105) = *(_OWORD *)((char *)v17 + 9);
  v8 = v12;
  *a1 = v11;
  a1[1] = v8;
  result = *(double *)&v13;
  v10 = v14;
  a1[2] = v13;
  a1[3] = v10;
  return result;
}

uint64_t (*sub_2277669D8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void *sub_227766A1C()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_presentingViewController);
  v2 = v1;
  return v1;
}

void sub_227766A50(uint64_t a1)
{
  void *v1;
  char **p_name;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v1 = (void *)objc_opt_self();
  p_name = &stru_24EFD4FF8.name;
  v3 = objc_msgSend(v1, sel_sharedPreferences);
  v4 = objc_msgSend(v3, sel_languageCode);

  if (v4)
  {
    sub_227767750();
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)sub_227767744();
  v8 = (void *)objc_opt_self();
  v9 = objc_msgSend(v8, sel_bundleWithIdentifier_, v7);

  v10 = v9;
  if (!v9)
    v10 = objc_msgSend(v8, sel_mainBundle);
  v11 = v9;
  v26 = 0xE000000000000000;
  sub_2277675C4();

  if (v6)
  {
    if (qword_2558F7DC0 != -1)
      swift_once();
    v12 = (void *)qword_2558F9A10;
    v13 = (void *)sub_227767744();
    v14 = objc_msgSend(v12, sel_localizedTriggerPhraseForLanguageCode_, v13, 0xE000000000000000);

    sub_227767750();
    v28 = sub_22775412C();
    v29 = v28;
    v27 = v28;
    v26 = MEMORY[0x24BEE0D00];
    sub_227767894();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    p_name = (char **)(&stru_24EFD4FF8 + 8);
  }
  else
  {

  }
  v15 = objc_msgSend(v1, p_name[262], v26, v27, v28, v29);
  v16 = objc_msgSend(v15, sel_languageCode);

  if (v16)
  {
    sub_227767750();
    v18 = v17;

  }
  else
  {
    v18 = 0;
  }
  v19 = (void *)sub_227767744();
  v20 = objc_msgSend(v8, sel_bundleWithIdentifier_, v19);

  v21 = v20;
  if (!v20)
    v21 = objc_msgSend(v8, sel_mainBundle);
  v22 = v20;
  sub_2277675C4();

  if (v18)
  {
    if (qword_2558F7DC0 != -1)
      swift_once();
    v23 = (void *)qword_2558F9A10;
    v24 = (void *)sub_227767744();
    v25 = objc_msgSend(v23, sel_localizedTriggerPhraseForLanguageCode_, v24, 0xE000000000000000);

    sub_227767750();
    sub_22775412C();
    sub_227767894();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  else
  {

  }
  __asm { BR              X10 }
}

uint64_t sub_227767374()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LocalDataSource()
{
  return objc_opt_self();
}

void sub_2277673C0(char a1, uint64_t a2, uint64_t a3)
{
  void (*v6)(_QWORD *, _QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t ObjectType;
  _QWORD v13[16];

  v6 = (void (*)(_QWORD *, _QWORD))(*(uint64_t (**)(_QWORD *))(a3 + 56))(v13);
  *(_BYTE *)(v7 + 120) = a1;
  v6(v13, 0);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 80))(a2, a3);
  if (v8)
  {
    v10 = (void *)v8;
    v11 = v9;
    ObjectType = swift_getObjectType();
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(a3 + 40))(v13, a2, a3);
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(v11 + 16))(v13, 1, ObjectType, v11);
    sub_227748A14((uint64_t)v13);

  }
}

uint64_t storeEnumTagSinglePayload for SRSNavigationStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2277674CC + 4 * byte_2277699B5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_227767500 + 4 * asc_2277699B0[v4]))();
}

uint64_t sub_227767500(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_227767508(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x227767510);
  return result;
}

uint64_t sub_22776751C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x227767524);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_227767528(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_227767530(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SRSNavigationStyle()
{
  return &type metadata for SRSNavigationStyle;
}

unint64_t sub_227767550()
{
  unint64_t result;

  result = qword_2558F9068;
  if (!qword_2558F9068)
  {
    result = MEMORY[0x22E29CC34](&unk_227769A14, &type metadata for SRSNavigationStyle);
    atomic_store(result, (unint64_t *)&qword_2558F9068);
  }
  return result;
}

uint64_t sub_227767594()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_2277675C4()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_2277675D0()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_2277675DC()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2277675E8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2277675F4()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_227767600()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_22776760C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_227767618()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_227767624()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t sub_227767630()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_22776763C()
{
  return MEMORY[0x24BDCF650]();
}

uint64_t sub_227767648()
{
  return MEMORY[0x24BEBBE88]();
}

uint64_t sub_227767654()
{
  return MEMORY[0x24BDCF678]();
}

uint64_t sub_227767660()
{
  return MEMORY[0x24BDCF760]();
}

uint64_t sub_22776766C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_227767678()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_227767684()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_227767690()
{
  return MEMORY[0x24BEBC5B0]();
}

uint64_t sub_22776769C()
{
  return MEMORY[0x24BEBC5C0]();
}

uint64_t sub_2277676A8()
{
  return MEMORY[0x24BEBC5F8]();
}

uint64_t sub_2277676B4()
{
  return MEMORY[0x24BEBC690]();
}

uint64_t sub_2277676C0()
{
  return MEMORY[0x24BEBC6B8]();
}

uint64_t sub_2277676CC()
{
  return MEMORY[0x24BEBC6D0]();
}

uint64_t sub_2277676D8()
{
  return MEMORY[0x24BEBC740]();
}

uint64_t sub_2277676E4()
{
  return MEMORY[0x24BEBC828]();
}

uint64_t sub_2277676F0()
{
  return MEMORY[0x24BEBC848]();
}

uint64_t sub_2277676FC()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_227767708()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_227767714()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_227767720()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_22776772C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_227767738()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_227767744()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_227767750()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22776775C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_227767768()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_227767774()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_227767780()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22776778C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_227767798()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2277677A4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2277677B0()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2277677BC()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2277677C8()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2277677D4()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2277677E0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2277677EC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2277677F8()
{
  return MEMORY[0x24BEBCBF0]();
}

uint64_t sub_227767804()
{
  return MEMORY[0x24BDBD7D0]();
}

uint64_t sub_227767810()
{
  return MEMORY[0x24BDBD7E8]();
}

uint64_t sub_22776781C()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_227767828()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_227767834()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_227767840()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_22776784C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_227767858()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_227767864()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_227767870()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_22776787C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_227767888()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_227767894()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_2277678A0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2277678AC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2277678B8()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2277678C4()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2277678D0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2277678DC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2277678E8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2277678F4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_227767900()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_22776790C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_227767918()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_227767924()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_227767930()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_22776793C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_227767948()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_227767954()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_227767960()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_22776796C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_227767978()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_227767984()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_227767990()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22776799C()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_2277679A8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2277679B4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2277679C0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2277679CC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AFBooleanGetName()
{
  return MEMORY[0x24BE08BC8]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDA90](color, alpha);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDAA8](red, green, blue, alpha);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD20](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x24BE7AF80]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x24BE7AFA8]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x24BE7AFE8]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x24BE7B018]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x24BE7B038]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

uint64_t SISchemaUUIDReadFrom()
{
  return MEMORY[0x24BE95F00]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
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

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
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

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x24BEE4E80]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

