uint64_t PNROnDeviceProvisionalPNRIntervalDurationMetricReadFrom(void *a1, uint64_t a2)
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
  uint64_t v16;
  int v17;
  uint64_t v19;
  unint64_t v20;
  double v21;
  uint64_t result;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  void *v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
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
      if (v17 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v19 = *v3;
          v20 = *(_QWORD *)(a2 + v19);
          if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v21 = *(double *)(*(_QWORD *)(a2 + *v7) + v20);
            *(_QWORD *)(a2 + v19) = v20 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + v16) = 1;
            v21 = 0.0;
          }
          objc_msgSend(a1, "setMetricValue:", v21);
          continue;
        case 2u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          while (2)
          {
            v26 = *v3;
            v27 = *(_QWORD *)(a2 + v26);
            v28 = v27 + 1;
            if (v27 == -1 || v28 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
              *(_QWORD *)(a2 + v26) = v28;
              v25 |= (unint64_t)(v29 & 0x7F) << v23;
              if (v29 < 0)
              {
                v23 += 7;
                v15 = v24++ >= 9;
                if (v15)
                {
                  v30 = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v30 = 0;
          else
            v30 = v25;
LABEL_45:
          objc_msgSend(a1, "setStartTimestamp:", v30);
          continue;
        case 3u:
          PBReaderReadString();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "setStartTimestampEventName:", v31);
          goto LABEL_40;
        case 4u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          break;
        case 5u:
          PBReaderReadString();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "setEndTimestampEventName:", v31);
LABEL_40:

          continue;
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
        v37 = v36 + 1;
        if (v36 == -1 || v37 > *(_QWORD *)(a2 + *v4))
          break;
        v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
        *(_QWORD *)(a2 + v35) = v37;
        v34 |= (unint64_t)(v38 & 0x7F) << v32;
        if ((v38 & 0x80) == 0)
          goto LABEL_47;
        v32 += 7;
        v15 = v33++ >= 9;
        if (v15)
        {
          v39 = 0;
          goto LABEL_50;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_47:
      v39 = *(_BYTE *)(a2 + *v5) ? 0 : v34;
LABEL_50:
      objc_msgSend(a1, "setEndTimestamp:", v39);
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL PNROnDeviceProvisionalPnROnDeviceFrameworkWrapperReadFrom(void *a1, uint64_t a2)
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
  PNROnDeviceProvisionalPnRSiriRequestGrainSummary *v17;

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
      if ((v10 >> 3) == 102)
        break;
      if ((v10 >> 3) == 101)
      {
        v17 = objc_alloc_init(PNROnDeviceProvisionalPnRSiriRequestGrainSummary);
        if (!PBReaderPlaceMark() || !PNROnDeviceProvisionalPnRSiriRequestGrainSummaryReadFrom(v17, a2))
          goto LABEL_31;
        PBReaderRecallMark();
        objc_msgSend(a1, "setSiriRequestGrainMetrics:", v17, 0, 0);
LABEL_26:

        goto LABEL_28;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_28:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary);
    if (!PBReaderPlaceMark() || !PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummaryReadFrom(v17, a2))
    {
LABEL_31:

      return 0;
    }
    PBReaderRecallMark();
    objc_msgSend(a1, "setSiriRequestGrainDebugSummary:", v17, 0, 0);
    goto LABEL_26;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummaryReadFrom(void *a1, uint64_t a2)
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
  void *v17;

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
      if ((v10 >> 3) == 102)
        break;
      if ((v10 >> 3) == 100)
      {
        PBReaderReadString();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setTurnId:", v17);
LABEL_22:

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setErrorMessage:", v17);
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL PNROnDeviceProvisionalPnRSiriRequestGrainSummaryReadFrom(void *a1, uint64_t a2)
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
  PNROnDeviceProvisionalPNRIntervalDurationMetric *v18;

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
      v17 = v10 >> 3;
      if ((int)(v10 >> 3) > 199)
      {
        if ((_DWORD)v17 == 200)
        {
          v18 = objc_alloc_init(PNROnDeviceProvisionalPNRIntervalDurationMetric);
          if (!PBReaderPlaceMark()
            || (PNROnDeviceProvisionalPNRIntervalDurationMetricReadFrom(v18, a2) & 1) == 0)
          {

            return 0;
          }
          PBReaderRecallMark();
          objc_msgSend(a1, "setSrt:", v18, 0, 0);
          goto LABEL_29;
        }
        if ((_DWORD)v17 == 300)
        {
          PBReaderReadString();
          v18 = (PNROnDeviceProvisionalPNRIntervalDurationMetric *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "setError:", v18);
          goto LABEL_29;
        }
      }
      else
      {
        if ((_DWORD)v17 == 100)
        {
          PBReaderReadString();
          v18 = (PNROnDeviceProvisionalPNRIntervalDurationMetric *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "setTurnId:", v18);
          goto LABEL_29;
        }
        if ((_DWORD)v17 == 101)
        {
          PBReaderReadString();
          v18 = (PNROnDeviceProvisionalPNRIntervalDurationMetric *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "setRequestStatus:", v18);
LABEL_29:

          continue;
        }
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_2444CF6C8()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (qword_257366BE0 != -1)
    swift_once();
  v0 = sub_2444DBBE4();
  __swift_project_value_buffer(v0, (uint64_t)qword_257367688);
  oslog = sub_2444DBBD8();
  v1 = sub_2444DBCD4();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v2 = 67109120;
    sub_2444DBD04();
    _os_log_impl(&dword_2444CA000, oslog, v1, "#FileRadarUtils autoBugCapture: result: %{BOOL}d", v2, 8u);
    MEMORY[0x24951043C](v2, -1, -1);
  }

}

void sub_2444CF7E8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_2444CF7F4(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void sub_2444CF808(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

void _s20PnROnDeviceFramework14FileRadarUtilsO14autoBugCapture9errorType0k3SubL003subL7ContextySS_S2StFZ_0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (AFIsInternalInstall())
  {
    sub_2444DBB24();
    swift_allocObject();
    sub_2444DBB18();
    sub_2444DBB0C();
    swift_release();
  }
  else
  {
    if (qword_257366BE0 != -1)
      swift_once();
    v8 = sub_2444DBBE4();
    __swift_project_value_buffer(v8, (uint64_t)qword_257367688);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v9 = sub_2444DBBD8();
    v10 = sub_2444DBCD4();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = swift_slowAlloc();
      v12 = swift_slowAlloc();
      v13 = v12;
      *(_DWORD *)v11 = 136315394;
      swift_bridgeObjectRetain();
      sub_2444D1180(a1, a2, &v13);
      sub_2444DBD04();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v11 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_2444D1180(a3, a4, &v13);
      sub_2444DBD04();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2444CA000, v9, v10, "#FileRadarUtils autoBugCapture: not an internal build. Skipping filing radar for \"%s\"/\"%s\"", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24951043C](v12, -1, -1);
      MEMORY[0x24951043C](v11, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
}

ValueMetadata *type metadata accessor for FileRadarUtils()
{
  return &type metadata for FileRadarUtils;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2444CFAE0()
{
  uint64_t v0;

  v0 = sub_2444DBAB8();
  __swift_allocate_value_buffer(v0, qword_257366C08);
  __swift_project_value_buffer(v0, (uint64_t)qword_257366C08);
  return sub_2444DBAA0();
}

uint64_t static PnRIntervalConstants.timeSinceSevenDaysAgo.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_257366BA8 != -1)
    swift_once();
  v2 = sub_2444DBAB8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257366C08);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

unint64_t static PnRConstants.dataWorkerBundleID.getter()
{
  return 0xD000000000000039;
}

unint64_t static PnRConstants.FBFBundleId.getter()
{
  return 0xD000000000000026;
}

unint64_t static StreamIdentifier.SELFProcessedStreamIdentifier.getter()
{
  return 0xD000000000000024;
}

ValueMetadata *type metadata accessor for PnRIntervalConstants()
{
  return &type metadata for PnRIntervalConstants;
}

ValueMetadata *type metadata accessor for PnRConstants()
{
  return &type metadata for PnRConstants;
}

ValueMetadata *type metadata accessor for StreamIdentifier()
{
  return &type metadata for StreamIdentifier;
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

uint64_t dispatch thunk of BiomeReader.bookmark.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SELFProcessedTurnReader.read()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 16) + *(_QWORD *)(a2 + 16));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2444CFCDC;
  return v7(a1, a2);
}

uint64_t sub_2444CFCDC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t Bookmark.userDefaultsKey.getter()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2444CFD74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint8_t *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t *v36;
  char *v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint8_t *v42;
  _OWORD v43[2];
  uint64_t v44;
  __int128 v45;
  __int128 v46;

  v2 = v1;
  v4 = sub_2444DBAB8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v39 - v9;
  if (qword_257366BA8 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v4, (uint64_t)qword_257366C08);
  v12 = *(uint8_t **)(v5 + 16);
  ((void (*)(char *, uint64_t, uint64_t))v12)(v10, v11, v4);
  v13 = *(void **)(v1 + 16);
  if (v13)
  {
    v42 = v12;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v14 = (void *)sub_2444DBC20();
    swift_bridgeObjectRelease();
    v15 = objc_msgSend(v13, sel_valueForKey_, v14);

    if (v15)
    {
      sub_2444DBD1C();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v43, 0, sizeof(v43));
    }
    sub_2444D08B0((uint64_t)v43, (uint64_t)&v45);
    if (*((_QWORD *)&v46 + 1))
    {
      sub_2444D0830((uint64_t)&v45);
      swift_bridgeObjectRetain();
      v16 = (void *)sub_2444DBC20();
      swift_bridgeObjectRelease();
      objc_msgSend(v13, sel_doubleForKey_, v16);
      v18 = v17;

      if (qword_257366BE0 != -1)
        swift_once();
      v19 = sub_2444DBBE4();
      __swift_project_value_buffer(v19, (uint64_t)qword_257367688);
      swift_retain();
      v20 = sub_2444DBBD8();
      v21 = sub_2444DBCD4();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = swift_slowAlloc();
        v39 = swift_slowAlloc();
        *(_QWORD *)&v45 = v39;
        *(_DWORD *)v22 = 136315394;
        v40 = v10;
        v41 = a1;
        v23 = *(_QWORD *)(v2 + 40);
        v24 = *(_QWORD *)(v2 + 48);
        swift_bridgeObjectRetain();
        *(_QWORD *)&v43[0] = sub_2444D1180(v23, v24, (uint64_t *)&v45);
        v10 = v40;
        sub_2444DBD04();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v22 + 12) = 2048;
        *(_QWORD *)&v43[0] = v18;
        a1 = v41;
        sub_2444DBD04();
        _os_log_impl(&dword_2444CA000, v20, v21, "The userdefault has key %s with the value %f", (uint8_t *)v22, 0x16u);
        v25 = v39;
        swift_arrayDestroy();
        MEMORY[0x24951043C](v25, -1, -1);
        MEMORY[0x24951043C](v22, -1, -1);

      }
      else
      {

        swift_release();
      }
      v36 = v42;
      sub_2444DBA88();
      sub_2444D08F8();
      if ((sub_2444DBC08() & 1) != 0)
        v37 = v8;
      else
        v37 = v10;
      ((void (*)(uint64_t, char *, uint64_t))v36)(a1, v37, v4);
      v38 = *(void (**)(char *, uint64_t))(v5 + 8);
      v38(v8, v4);
      return ((uint64_t (*)(char *, uint64_t))v38)(v10, v4);
    }
  }
  else
  {
    v45 = 0u;
    v46 = 0u;
  }
  sub_2444D0830((uint64_t)&v45);
  if (qword_257366BE0 != -1)
    swift_once();
  v26 = sub_2444DBBE4();
  __swift_project_value_buffer(v26, (uint64_t)qword_257367688);
  swift_retain();
  v27 = sub_2444DBBD8();
  v28 = sub_2444DBCD4();
  if (os_log_type_enabled(v27, v28))
  {
    v40 = v10;
    v29 = (uint8_t *)swift_slowAlloc();
    v30 = swift_slowAlloc();
    v41 = a1;
    *(_DWORD *)v29 = 136315138;
    v42 = v29 + 4;
    *(_QWORD *)&v43[0] = v30;
    swift_beginAccess();
    v31 = v5;
    v33 = *(_QWORD *)(v2 + 40);
    v32 = *(_QWORD *)(v2 + 48);
    swift_bridgeObjectRetain();
    v34 = v33;
    v5 = v31;
    v44 = sub_2444D1180(v34, v32, (uint64_t *)v43);
    a1 = v41;
    sub_2444DBD04();
    swift_release();
    v10 = v40;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2444CA000, v27, v28, "The userdefault contained no value for %s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951043C](v30, -1, -1);
    MEMORY[0x24951043C](v29, -1, -1);

  }
  else
  {

    swift_release();
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a1, v10, v4);
}

uint64_t sub_2444D02E8(uint64_t a1)
{
  _QWORD *v1;
  unint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32[3];
  uint64_t v33;

  v3 = v1[4];
  v4 = v1[3] & 0xFFFFFFFFFFFFLL;
  if ((v3 & 0x2000000000000000) != 0)
    v4 = HIBYTE(v3) & 0xF;
  if (v4)
  {
    v5 = v1;
    sub_2444DBA94();
    v7 = v6;
    if (qword_257366BE0 != -1)
      swift_once();
    v8 = sub_2444DBBE4();
    __swift_project_value_buffer(v8, (uint64_t)qword_257367688);
    swift_retain();
    v9 = sub_2444DBBD8();
    v10 = sub_2444DBCD4();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = swift_slowAlloc();
      v12 = swift_slowAlloc();
      v32[0] = v12;
      *(_DWORD *)v11 = 136315394;
      swift_beginAccess();
      v13 = v1[5];
      v14 = v1[6];
      swift_bridgeObjectRetain();
      v33 = sub_2444D1180(v13, v14, v32);
      sub_2444DBD04();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2048;
      v33 = v7;
      sub_2444DBD04();
      _os_log_impl(&dword_2444CA000, v9, v10, "Set key %s to %f", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24951043C](v12, -1, -1);
      MEMORY[0x24951043C](v11, -1, -1);

      v15 = (void *)v1[2];
      if (v15)
      {
LABEL_8:
        v16 = v15;
        v17 = (void *)sub_2444DBCB0();
        swift_beginAccess();
        swift_bridgeObjectRetain();
        v18 = (void *)sub_2444DBC20();
        swift_bridgeObjectRelease();
        objc_msgSend(v16, sel_setValue_forKey_, v17, v18);

LABEL_19:
        v31 = sub_2444DBAB8();
        return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 8))(a1, v31);
      }
    }
    else
    {

      swift_release();
      v15 = (void *)v1[2];
      if (v15)
        goto LABEL_8;
    }
    swift_retain_n();
    v25 = sub_2444DBBD8();
    v26 = sub_2444DBCD4();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = swift_slowAlloc();
      v33 = v28;
      *(_DWORD *)v27 = 136315138;
      swift_beginAccess();
      v29 = v5[5];
      v30 = v5[6];
      swift_bridgeObjectRetain();
      sub_2444D1180(v29, v30, &v33);
      sub_2444DBD04();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2444CA000, v25, v26, "Fail to set key %s due to empty userdefaults", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24951043C](v28, -1, -1);
      MEMORY[0x24951043C](v27, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    goto LABEL_19;
  }
  if (qword_257366BE0 != -1)
    swift_once();
  v19 = sub_2444DBBE4();
  __swift_project_value_buffer(v19, (uint64_t)qword_257367688);
  v20 = sub_2444DBBD8();
  v21 = sub_2444DBCD4();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_2444CA000, v20, v21, "Skip userDefault set due to empty identifier", v22, 2u);
    MEMORY[0x24951043C](v22, -1, -1);
  }

  v23 = sub_2444DBAB8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(a1, v23);
}

uint64_t Bookmark.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Bookmark.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Bookmark()
{
  return objc_opt_self();
}

uint64_t method lookup function for Bookmark()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_2444D0830(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257366CB0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249510394]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2444D08B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257366CB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2444D08F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257366CB8;
  if (!qword_257366CB8)
  {
    v1 = sub_2444DBAB8();
    result = MEMORY[0x2495103AC](MEMORY[0x24BDCE948], v1);
    atomic_store(result, (unint64_t *)&qword_257366CB8);
  }
  return result;
}

uint64_t SiriTurnGrainCalculator.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SiriTurnGrainCalculator.init()()
{
  uint64_t v0;

  return v0;
}

void sub_2444D0958(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  _BOOL4 v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint8_t *v57;
  _QWORD v58[2];
  uint64_t v59;
  uint64_t v60;
  uint8_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint8_t *v70;
  uint64_t v71;

  v5 = sub_2444DBAF4();
  v6 = *(char **)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v9 = (void *)qword_257367270;
  qword_257367270 = (uint64_t)a1;

  type metadata accessor for SELFComponent.UEI();
  swift_initStackObject();
  v10 = a1;
  sub_2444D41D4(&v67);
  if (!v2)
  {
    v66 = v6;
    v12 = v67;
    v11 = (uint8_t *)v68;
    type metadata accessor for SELFComponent.MH();
    swift_initStackObject();
    sub_2444D2528(&v67);
    v63 = 0;
    v64 = a2;
    v65 = v67;
    v62 = v68;
    if (qword_257366BE0 != -1)
      swift_once();
    v32 = sub_2444DBBE4();
    __swift_project_value_buffer(v32, (uint64_t)qword_257367688);
    v33 = sub_2444DBBD8();
    v34 = sub_2444DBCD4();
    v35 = os_log_type_enabled(v33, v34);
    v60 = v5;
    v61 = v11;
    if (v35)
    {
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = swift_slowAlloc();
      v59 = v37;
      *(_DWORD *)v36 = 136315138;
      v71 = v37;
      v58[1] = v36 + 4;
      v67 = v65;
      v68 = v62;
      v69 = v12;
      v70 = v11;
      v38 = PnRLatencyContextMetrics.description.getter();
      v67 = sub_2444D1180(v38, v39, &v71);
      sub_2444DBD04();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2444CA000, v33, v34, "Compute Metrics srt: %s", v36, 0xCu);
      v40 = v59;
      swift_arrayDestroy();
      MEMORY[0x24951043C](v40, -1, -1);
      MEMORY[0x24951043C](v36, -1, -1);
    }

    if (!qword_257367270)
    {
      v44 = 0;
      v45 = 0;
      goto LABEL_28;
    }
    v41 = (id)qword_257367270;
    v42 = sub_2444DBB84();

    if (v42)
    {
      v67 = v42;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257366CC0);
      sub_2444D1860(0, &qword_257366CD8);
      sub_2444D17D0();
      v43 = (_QWORD *)sub_2444DBC74();
      swift_release();
      if (v43[2])
      {
        v45 = v43[4];
        v44 = v43[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v46 = (void *)qword_257367270;
        if (!qword_257367270)
          goto LABEL_28;
LABEL_23:
        v47 = v46;
        v48 = sub_2444DBB84();

        if (!v48)
        {
          v50 = 0;
          goto LABEL_29;
        }
        v67 = v48;
        __swift_instantiateConcreteTypeFromMangledName(&qword_257366CC0);
        sub_2444D1860(0, &qword_257366CC8);
        sub_2444D17D0();
        v49 = (_QWORD *)sub_2444DBC74();
        swift_release();
        if (v49[2])
        {
          v50 = v49[4];
          v48 = v49[5];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
LABEL_29:
          sub_2444DBBCC();
          v51 = sub_2444DBAD0();
          v53 = v52;
          (*((void (**)(char *, uint64_t))v66 + 1))(v8, v60);
          v54 = v64;
          v55 = v65;
          *v64 = v51;
          v54[1] = v53;
          v56 = v62;
          v54[2] = v55;
          v54[3] = v56;
          v57 = v61;
          v54[4] = v12;
          v54[5] = (uint64_t)v57;
          v54[6] = v45;
          v54[7] = v44;
          v54[8] = v50;
          v54[9] = v48;
          return;
        }
        swift_bridgeObjectRelease();
LABEL_28:
        v50 = 0;
        v48 = 0;
        goto LABEL_29;
      }
      swift_bridgeObjectRelease();
    }
    v45 = 0;
    v44 = 0;
    v46 = (void *)qword_257367270;
    if (!qword_257367270)
      goto LABEL_28;
    goto LABEL_23;
  }
  v65 = v2;
  if (qword_257366BE0 != -1)
    swift_once();
  v13 = sub_2444DBBE4();
  __swift_project_value_buffer(v13, (uint64_t)qword_257367688);
  v14 = v10;
  v15 = sub_2444DBBD8();
  v16 = sub_2444DBCD4();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v66 = v8;
    v18 = (uint8_t *)v17;
    v62 = swift_slowAlloc();
    v63 = 0;
    v67 = v62;
    *(_DWORD *)v18 = 136315138;
    v61 = v18 + 4;
    sub_2444DBBCC();
    v19 = sub_2444DBAD0();
    v64 = a2;
    v21 = v20;
    (*((void (**)(char *, uint64_t))v6 + 1))(v66, v5);
    v71 = sub_2444D1180(v19, v21, &v67);
    sub_2444DBD04();

    a2 = v64;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2444CA000, v15, v16, "Encountered Error to extractLatencies for turn %s", v18, 0xCu);
    v22 = v62;
    swift_arrayDestroy();
    MEMORY[0x24951043C](v22, -1, -1);
    v23 = v18;
    v8 = v66;
    MEMORY[0x24951043C](v23, -1, -1);

  }
  else
  {

  }
  sub_2444DBBCC();
  v24 = sub_2444DBAD0();
  v25 = v8;
  v26 = v24;
  v28 = v27;
  (*((void (**)(char *, uint64_t))v6 + 1))(v25, v5);
  v29 = (void *)v65;
  swift_getErrorValue();
  v30 = sub_2444DBDC4();
  _s20PnROnDeviceFramework14SELFPnREmitterC42uploadProvisionalSiriTurnGrainDebugSummary3for12errorMessageySSSg_AGtF_0(v26, v28, v30, v31);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_257366BB0 != -1)
    swift_once();
  _s20PnROnDeviceFramework14FileRadarUtilsO14autoBugCapture9errorType0k3SubL003subL7ContextySS_S2StFZ_0(qword_257366D88, unk_257366D90, 0xD000000000000014, 0x80000002444DC930);

  *(_OWORD *)a2 = xmmword_2444DC940;
  *((_OWORD *)a2 + 1) = 0u;
  *((_OWORD *)a2 + 2) = 0u;
  *((_OWORD *)a2 + 3) = 0u;
  *((_OWORD *)a2 + 4) = 0u;
}

uint64_t SiriTurnGrainCalculator.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SiriTurnGrainCalculator.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2444D10AC(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2444D10BC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2444D10F0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2444D1110(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_2444D1180(v6, v7, a3);
  v8 = *a1 + 8;
  sub_2444DBD04();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2444D1180(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2444D1250(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2444D1908((uint64_t)v12, *a3);
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
      sub_2444D1908((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2444D1250(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2444DBD10();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2444D1408(a5, a6);
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
  v8 = sub_2444DBD4C();
  if (!v8)
  {
    sub_2444DBD58();
    __break(1u);
LABEL_17:
    result = sub_2444DBD7C();
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

uint64_t sub_2444D1408(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2444D149C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2444D1674(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2444D1674(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2444D149C(uint64_t a1, unint64_t a2)
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
      v3 = sub_2444D1610(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2444DBD34();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2444DBD58();
      __break(1u);
LABEL_10:
      v2 = sub_2444DBC5C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2444DBD7C();
    __break(1u);
LABEL_14:
    result = sub_2444DBD58();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2444D1610(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257366D80);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2444D1674(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257366D80);
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
  result = sub_2444DBD7C();
  __break(1u);
  return result;
}

_BYTE **sub_2444D17C0(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

unint64_t sub_2444D17D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257366CD0;
  if (!qword_257366CD0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257366CC0);
    result = MEMORY[0x2495103AC](MEMORY[0x24BDFCBB8], v1);
    atomic_store(result, (unint64_t *)&qword_257366CD0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495103A0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2444D1860(uint64_t a1, unint64_t *a2)
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

uint64_t type metadata accessor for SiriTurnGrainCalculator()
{
  return objc_opt_self();
}

uint64_t method lookup function for SiriTurnGrainCalculator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriTurnGrainCalculator.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of SiriTurnGrainCalculator.extractLatencies(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
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

uint64_t sub_2444D1908(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_2444D1948()
{
  qword_257366D88 = 0x6C61746146;
  unk_257366D90 = 0xE500000000000000;
}

uint64_t static ErrorType.fatal.getter()
{
  return sub_2444D1B34(&qword_257366BB0, &qword_257366D88);
}

unint64_t static ErrorSubType.PnROnDeviceWorker.getter()
{
  return 0xD000000000000011;
}

unint64_t static ErrorSubType.PnROnDeviceFramework.getter()
{
  return 0xD000000000000014;
}

void sub_2444D19C0()
{
  qword_257366D98 = 0x656D6F6942;
  unk_257366DA0 = 0xE500000000000000;
}

uint64_t static ErrorSubType.Biome.getter()
{
  return sub_2444D1B34(&qword_257366BB8, &qword_257366D98);
}

void sub_2444D1A00()
{
  qword_257366DA8 = 0x53494C4D4941;
  unk_257366DB0 = 0xE600000000000000;
}

uint64_t static ErrorSubType.AIMLIS.getter()
{
  return sub_2444D1B34(&qword_257366BC0, &qword_257366DA8);
}

unint64_t static ErrorSubTypeContext.PnROnDeviceUploadException.getter()
{
  return 0xD00000000000001ALL;
}

unint64_t static ErrorSubTypeContext.PnRMetricsComputeException.getter()
{
  return 0xD00000000000001ALL;
}

unint64_t static ErrorSubTypeContext.PnROnDeviceWorkerException.getter()
{
  return 0xD00000000000001ALL;
}

void sub_2444D1A94()
{
  strcpy((char *)&qword_257366DB8, "BPSReadFailed");
  unk_257366DC6 = -4864;
}

uint64_t static ErrorSubTypeContext.BPSReadFailed.getter()
{
  return sub_2444D1B34(&qword_257366BC8, &qword_257366DB8);
}

void sub_2444D1AE4()
{
  strcpy((char *)&qword_257366DC8, "BPSReadUnknown");
  unk_257366DD7 = -18;
}

uint64_t static ErrorSubTypeContext.BPSReadUnknown.getter()
{
  return sub_2444D1B34(&qword_257366BD0, &qword_257366DC8);
}

uint64_t sub_2444D1B34(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

unint64_t static ErrorSubTypeContext.SiriTurnFailedToGenerate.getter()
{
  return 0xD000000000000018;
}

BOOL static PnRError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PnRError.hash(into:)()
{
  return sub_2444DBDF4();
}

uint64_t PnRError.hashValue.getter()
{
  sub_2444DBDE8();
  sub_2444DBDF4();
  return sub_2444DBE00();
}

BOOL sub_2444D1C24(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2444D1C3C()
{
  sub_2444DBDE8();
  sub_2444DBDF4();
  return sub_2444DBE00();
}

uint64_t sub_2444D1C80()
{
  return sub_2444DBDF4();
}

uint64_t sub_2444D1CA8()
{
  sub_2444DBDE8();
  sub_2444DBDF4();
  return sub_2444DBE00();
}

uint64_t sub_2444D1CE8()
{
  sub_2444D219C();
  return sub_2444DBDB8();
}

uint64_t sub_2444D1D10()
{
  sub_2444D219C();
  return sub_2444DBDAC();
}

void sub_2444D1D40()
{
  qword_257366DD8 = 0x726F727245526E50;
  qword_257366DE0 = 0xE800000000000000;
}

uint64_t static PnRError.errorDomain.getter()
{
  uint64_t v0;

  if (qword_257366BD8 != -1)
    swift_once();
  swift_beginAccess();
  v0 = qword_257366DD8;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static PnRError.errorDomain.setter(uint64_t a1, uint64_t a2)
{
  if (qword_257366BD8 != -1)
    swift_once();
  swift_beginAccess();
  qword_257366DD8 = a1;
  qword_257366DE0 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static PnRError.errorDomain.modify())()
{
  if (qword_257366BD8 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t PnRError.errorCode.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

unint64_t sub_2444D1ED8()
{
  unint64_t result;

  result = qword_257366DE8;
  if (!qword_257366DE8)
  {
    result = MEMORY[0x2495103AC](&protocol conformance descriptor for PnRError, &type metadata for PnRError);
    atomic_store(result, (unint64_t *)&qword_257366DE8);
  }
  return result;
}

unint64_t sub_2444D1F20()
{
  unint64_t result;

  result = qword_257366DF0;
  if (!qword_257366DF0)
  {
    result = MEMORY[0x2495103AC](&protocol conformance descriptor for PnRError, &type metadata for PnRError);
    atomic_store(result, (unint64_t *)&qword_257366DF0);
  }
  return result;
}

uint64_t sub_2444D1F64()
{
  uint64_t v0;

  if (qword_257366BD8 != -1)
    swift_once();
  swift_beginAccess();
  v0 = qword_257366DD8;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_2444D1FDC()
{
  unsigned __int8 *v0;

  return *v0;
}

ValueMetadata *type metadata accessor for ErrorType()
{
  return &type metadata for ErrorType;
}

ValueMetadata *type metadata accessor for ErrorSubType()
{
  return &type metadata for ErrorSubType;
}

ValueMetadata *type metadata accessor for ErrorSubTypeContext()
{
  return &type metadata for ErrorSubTypeContext;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PnRError(unsigned __int8 *a1, unsigned int a2)
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
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PnRError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2444D2104 + 4 * byte_2444DC9A5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2444D2138 + 4 * byte_2444DC9A0[v4]))();
}

uint64_t sub_2444D2138(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2444D2140(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2444D2148);
  return result;
}

uint64_t sub_2444D2154(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2444D215CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2444D2160(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2444D2168(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2444D2174(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2444D2180(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PnRError()
{
  return &type metadata for PnRError;
}

unint64_t sub_2444D219C()
{
  unint64_t result;

  result = qword_257366DF8;
  if (!qword_257366DF8)
  {
    result = MEMORY[0x2495103AC](&protocol conformance descriptor for PnRError, &type metadata for PnRError);
    atomic_store(result, (unint64_t *)&qword_257366DF8);
  }
  return result;
}

uint64_t SELFComponent.MH.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SELFComponent.MH.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_2444D21F8()
{
  id v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t result;

  swift_beginAccess();
  if (!qword_257367270)
    return 0;
  v0 = (id)qword_257367270;
  v1 = sub_2444DBBB4();

  if (!v1)
    return 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257366E00);
  sub_2444D1860(0, &qword_257366E08);
  sub_2444D2D18(&qword_257366E10, &qword_257366E00, MEMORY[0x24BDFCBB8]);
  v2 = sub_2444DBC68();
  swift_release();
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2444DBD64();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = v3 != 0;
  if (!v3)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return v4;
  }
  if ((v2 & 0xC000000000000001) != 0)
  {
    MEMORY[0x24950FF74](0, v2);
    swift_unknownObjectRelease();
    goto LABEL_13;
  }
  v5 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRelease();
  if (v5)
    return 1;
  __break(1u);
  return result;
}

uint64_t sub_2444D2370()
{
  return 1;
}

uint64_t sub_2444D2378()
{
  id v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t result;
  uint64_t v4;
  id v5;

  swift_beginAccess();
  if (!qword_257367270)
    return 0;
  v0 = (id)qword_257367270;
  v1 = sub_2444DBB84();

  if (!v1)
    return 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257366CC0);
  sub_2444D1860(0, &qword_257366E18);
  sub_2444D2D18((unint64_t *)&qword_257366CD0, &qword_257366CC0, MEMORY[0x24BDFCBB8]);
  v2 = sub_2444DBC68();
  result = swift_release();
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_2444DBD64();
    result = swift_bridgeObjectRelease();
    if (!v4)
      goto LABEL_9;
  }
  else
  {
    v4 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
    {
LABEL_9:
      swift_bridgeObjectRelease();
      return v4;
    }
  }
  if ((v2 & 0xC000000000000001) != 0)
  {
    v5 = (id)MEMORY[0x24950FF74](0, v2);
    goto LABEL_8;
  }
  if (*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v5 = *(id *)(v2 + 32);
LABEL_8:
    v4 = (uint64_t)v5;
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

BOOL sub_2444D24E8(void *a1)
{
  id v1;
  id v2;

  v1 = objc_msgSend(a1, sel_ended);
  v2 = v1;
  if (v1)

  return v2 != 0;
}

void sub_2444D2528(uint64_t *a1@<X8>)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  swift_beginAccess();
  if (!qword_257367270)
    goto LABEL_33;
  v2 = (id)qword_257367270;
  v3 = sub_2444DBBB4();

  if (!v3)
  {
LABEL_18:
    if (!qword_257367270)
      goto LABEL_33;
    v15 = (id)qword_257367270;
    v16 = sub_2444DBB84();

    if (!v16)
      goto LABEL_33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257366CC0);
    sub_2444D1860(0, &qword_257366E18);
    sub_2444D2D18((unint64_t *)&qword_257366CD0, &qword_257366CC0, MEMORY[0x24BDFCBB8]);
    v4 = sub_2444DBC68();
    swift_release();
    if (!(v4 >> 62))
    {
      if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_32;
LABEL_22:
      if ((v4 & 0xC000000000000001) != 0)
      {
        v17 = (id)MEMORY[0x24950FF74](0, v4);
      }
      else
      {
        if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_37;
        }
        v17 = *(id *)(v4 + 32);
      }
      v18 = v17;
      swift_bridgeObjectRelease();
      v19 = sub_2444DBB30();
      if (v19)
      {
        v20 = (void *)v19;
        v12 = sub_2444DBB3C();

        v13 = 4;
        goto LABEL_34;
      }
      goto LABEL_39;
    }
LABEL_29:
    swift_bridgeObjectRetain();
    v21 = sub_2444DBD64();
    swift_bridgeObjectRelease();
    if (!v21)
      goto LABEL_32;
    goto LABEL_22;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257366E00);
  sub_2444D1860(0, &qword_257366E08);
  sub_2444D2D18(&qword_257366E10, &qword_257366E00, MEMORY[0x24BDFCBB8]);
  v4 = sub_2444DBC68();
  swift_release();
  if (!(v4 >> 62))
  {
    if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_5;
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  v14 = sub_2444DBD64();
  swift_bridgeObjectRelease();
  if (!v14)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
LABEL_5:
  if ((v4 & 0xC000000000000001) != 0)
  {
    MEMORY[0x24950FF74](0, v4);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRelease();
  if (!v5)
  {
    __break(1u);
    goto LABEL_29;
  }
LABEL_7:
  if (!qword_257367270)
    goto LABEL_33;
  v6 = (id)qword_257367270;
  v7 = sub_2444DBBB4();

  if (!v7)
    goto LABEL_33;
  sub_2444D1860(0, &qword_257366E20);
  v4 = sub_2444DBC68();
  swift_release();
  if (!(v4 >> 62))
  {
    if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_11;
    goto LABEL_32;
  }
  swift_bridgeObjectRetain();
  v22 = sub_2444DBD64();
  swift_bridgeObjectRelease();
  if (!v22)
  {
LABEL_32:
    swift_bridgeObjectRelease();
LABEL_33:
    v12 = 0;
    v13 = 11;
    goto LABEL_34;
  }
LABEL_11:
  if ((v4 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v8 = *(id *)(v4 + 32);
      goto LABEL_14;
    }
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
LABEL_37:
  v8 = (id)MEMORY[0x24950FF74](0, v4);
LABEL_14:
  v9 = v8;
  swift_bridgeObjectRelease();
  v10 = sub_2444DBB30();
  if (v10)
  {
    v11 = (void *)v10;
    v12 = sub_2444DBB3C();

    v13 = 8;
LABEL_34:
    *a1 = v13;
    a1[1] = v12;
    return;
  }
LABEL_40:
  __break(1u);
}

BOOL sub_2444D2920(void *a1)
{
  uint64_t v2;
  char *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  _BOOL8 result;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257366ED8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend(a1, sel_ended);

  if (!v4)
    return 0;
  v5 = objc_msgSend(a1, sel_trpId);
  if (!v5)
    goto LABEL_5;
  v6 = v5;
  sub_2444DBCC8();

  v7 = sub_2444DBAF4();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v3, 1, v7) == 1)
  {
    sub_2444D2CD8((uint64_t)v3);
LABEL_5:
    v9 = 0;
    v10 = 0;
    goto LABEL_7;
  }
  v9 = sub_2444DBAD0();
  v10 = v11;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v3, v7);
LABEL_7:
  swift_beginAccess();
  if (qword_257367270)
  {
    v12 = (id)qword_257367270;
    v13 = sub_2444DBB90();

    v23 = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257366EE0);
    sub_2444D1860(0, (unint64_t *)&qword_257366EE8);
    sub_2444D2D18((unint64_t *)&qword_257366EF0, &qword_257366EE0, MEMORY[0x24BEE12C8]);
    v14 = (_QWORD *)sub_2444DBC74();
    swift_bridgeObjectRelease();
    if (v14[2])
    {
      v16 = v14[4];
      v15 = v14[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (!v10)
        goto LABEL_10;
      goto LABEL_14;
    }
    swift_bridgeObjectRelease();
  }
  v16 = 0;
  v15 = 0;
  if (!v10)
  {
LABEL_10:
    if (v15)
      goto LABEL_18;
    goto LABEL_20;
  }
LABEL_14:
  if (!v15)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (v9 == v16 && v10 == v15)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = sub_2444DBDA0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v17 & 1) == 0)
      return result;
  }
LABEL_20:
  if (qword_257367270)
  {
    v19 = (id)qword_257367270;
    v20 = sub_2444DBB90();

    v23 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257366EE0);
    sub_2444D1860(0, (unint64_t *)&qword_257366EE8);
    sub_2444D2D18((unint64_t *)&qword_257366EF0, &qword_257366EE0, MEMORY[0x24BEE12C8]);
    v21 = sub_2444DBC74();
    swift_bridgeObjectRelease();
    v22 = *(_QWORD *)(v21 + 16);
    swift_bridgeObjectRelease();
    return v22 != 0;
  }
  return 0;
}

uint64_t SELFComponent.MH.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SELFComponent.MH.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SELFComponent.MH()
{
  return objc_opt_self();
}

uint64_t method lookup function for SELFComponent.MH()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SELFComponent.MH.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of SELFComponent.MH.isMedoc.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t dispatch thunk of SELFComponent.MH.userStopSpeaking.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of SELFComponent.MH.userSpeakingEnded.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t sub_2444D2CD8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257366ED8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2444D2D18(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2495103AC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t SELFPnREmitter.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t static SELFPnREmitter.instance.getter()
{
  return swift_initStaticObject();
}

uint64_t SELFPnREmitter.init()()
{
  uint64_t v0;

  return v0;
}

void SELFPnREmitter.uploadSiriTurnGrainLatency(for:)(_OWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  __int128 v5;
  __int128 v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint8_t *v34;
  _QWORD *v35;
  NSObject *v36;
  uint8_t *v37;
  id v38;
  void *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  _QWORD *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  _OWORD v48[5];
  uint64_t v49;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257366ED8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = a1[1];
  v48[0] = *a1;
  v48[1] = v5;
  v6 = a1[3];
  v48[2] = a1[2];
  v48[3] = v6;
  v48[4] = a1[4];
  v7 = PnRSiriTurnGrainSummary.createSiriTurnGrainSummarySELFEvent()();
  if (!v7)
  {
    if (qword_257366BE0 != -1)
      swift_once();
    v15 = sub_2444DBBE4();
    __swift_project_value_buffer(v15, (uint64_t)qword_257367688);
    v16 = sub_2444DBBD8();
    v17 = sub_2444DBCD4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_2444CA000, v16, v17, "uploadSiriTurnGrainLatency failed due to createSELFEvent is nil.", v18, 2u);
      MEMORY[0x24951043C](v18, -1, -1);
    }
    goto LABEL_31;
  }
  v8 = v7;
  v9 = -[NSObject pnrodSiriTurnGrainSummary](v7, sel_pnrodSiriTurnGrainSummary);
  if (!v9)
    goto LABEL_6;
  v10 = v9;
  v11 = objc_msgSend(v9, sel_turnid);

  if (v11)
  {
    sub_2444DBCC8();

    v12 = sub_2444DBAF4();
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v4, 1, v12) == 1)
    {
      sub_2444D2CD8((uint64_t)v4);
LABEL_6:
      v14 = 0;
      v11 = 0;
      goto LABEL_13;
    }
    v14 = sub_2444DBAD0();
    v11 = v19;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v12);
  }
  else
  {
    v14 = 0;
  }
LABEL_13:
  if (qword_257366BE0 != -1)
    swift_once();
  v20 = sub_2444DBBE4();
  v21 = __swift_project_value_buffer(v20, (uint64_t)qword_257367688);
  swift_bridgeObjectRetain();
  v22 = sub_2444DBBD8();
  v23 = sub_2444DBCD4();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    v25 = swift_slowAlloc();
    v47 = v21;
    *(_DWORD *)v24 = 136315138;
    *(_QWORD *)&v48[0] = v25;
    if (v11)
      v26 = v14;
    else
      v26 = 0;
    if (v11)
      v27 = (unint64_t)v11;
    else
      v27 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v49 = sub_2444D1180(v26, v27, (uint64_t *)v48);
    v21 = v47;
    sub_2444DBD04();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2444CA000, v22, v23, "Created now %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951043C](v25, -1, -1);
    MEMORY[0x24951043C](v24, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v28 = -[NSObject wrapAsAnyEvent](v8, sel_wrapAsAnyEvent);
  if (v28)
  {
    v29 = v28;
    v30 = v28;
    v31 = sub_2444DBBD8();
    v32 = sub_2444DBCD4();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = swift_slowAlloc();
      v46 = v30;
      v47 = v21;
      v34 = (uint8_t *)v33;
      v35 = (_QWORD *)swift_slowAlloc();
      v45 = v8;
      *(_DWORD *)v34 = 138412290;
      *(_QWORD *)&v48[0] = v46;
      v36 = v46;
      v8 = v45;
      sub_2444DBD04();
      *v35 = v29;

      _os_log_impl(&dword_2444CA000, v31, v32, "FBF reporter: store the SiriSELFEvent event %@ and send to server", v34, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257366EF8);
      swift_arrayDestroy();
      MEMORY[0x24951043C](v35, -1, -1);
      v37 = v34;
      v30 = v46;
      MEMORY[0x24951043C](v37, -1, -1);
    }
    else
    {

      v31 = v30;
    }

    v38 = objc_msgSend((id)objc_opt_self(), sel_sharedLogger);
    v39 = (void *)sub_2444DBC20();
    objc_msgSend(v38, sel_reportSiriInstrumentationEvent_forBundleID_completion_, v30, v39, 0);

  }
  v40 = v8;
  v16 = sub_2444DBBD8();
  v41 = sub_2444DBCD4();
  if (os_log_type_enabled(v16, v41))
  {
    v42 = (uint8_t *)swift_slowAlloc();
    v43 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v42 = 138412290;
    *(_QWORD *)&v48[0] = v40;
    v44 = v40;
    sub_2444DBD04();
    *v43 = v8;

    _os_log_impl(&dword_2444CA000, v16, v41, "Emitted now %@", v42, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257366EF8);
    swift_arrayDestroy();
    MEMORY[0x24951043C](v43, -1, -1);
    MEMORY[0x24951043C](v42, -1, -1);

LABEL_31:
    return;
  }

}

void SELFPnREmitter.uploadProvisionalSiriTurnGrainLatency(for:)(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper_optional *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper_optional *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  void *v18;
  _QWORD *v19;
  PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper_optional *v20;
  PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper_optional *v21;

  v20 = *(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper_optional **)(a1 + 72);
  if (!AFIsInternalInstall())
  {
    if (qword_257366BE0 != -1)
      swift_once();
    v11 = sub_2444DBBE4();
    __swift_project_value_buffer(v11, (uint64_t)qword_257367688);
    v12 = sub_2444DBBD8();
    v13 = sub_2444DBCD4();
    if (!os_log_type_enabled(v12, v13))
      goto LABEL_17;
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    v15 = "#SELF Uploader: not an internal build. Skipping";
    goto LABEL_16;
  }
  PnRSiriTurnGrainSummary.createProvisionalSELFEvent()(v20);
  if (!v1)
  {
    if (qword_257366BE0 != -1)
      swift_once();
    v16 = sub_2444DBBE4();
    __swift_project_value_buffer(v16, (uint64_t)qword_257367688);
    v12 = sub_2444DBBD8();
    v13 = sub_2444DBCD4();
    if (!os_log_type_enabled(v12, v13))
      goto LABEL_17;
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    v15 = "uploadProvisionalSiriTurnGrainLatency failed due to createProvisionalSELFEvent is nil.";
LABEL_16:
    _os_log_impl(&dword_2444CA000, v12, v13, v15, v14, 2u);
    MEMORY[0x24951043C](v14, -1, -1);
LABEL_17:

    return;
  }
  v2 = v1;
  v3 = objc_msgSend(v1, sel_wrapAsAnyEvent);
  if (v3)
  {
    v4 = v3;
    if (qword_257366BE0 != -1)
      swift_once();
    v5 = sub_2444DBBE4();
    __swift_project_value_buffer(v5, (uint64_t)qword_257367688);
    v6 = v4;
    v7 = sub_2444DBBD8();
    v8 = sub_2444DBCD4();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v19 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v9 = 138412290;
      v21 = v6;
      v10 = v6;
      sub_2444DBD04();
      *v19 = v4;

      v6 = v21;
      _os_log_impl(&dword_2444CA000, v7, v8, "FBF reporter: store the ProvisionalSELFEvent event %@ and send to server", v9, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257366EF8);
      swift_arrayDestroy();
      MEMORY[0x24951043C](v19, -1, -1);
      MEMORY[0x24951043C](v9, -1, -1);

    }
    else
    {

    }
    v17 = objc_msgSend((id)objc_opt_self(), sel_sharedLogger);
    v18 = (void *)sub_2444DBC20();
    objc_msgSend(v17, sel_reportSiriInstrumentationEvent_forBundleID_completion_, v6, v18, 0);

  }
}

void SELFPnREmitter.uploadIESELFRequest(for:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;

  if (!AFIsInternalInstall())
  {
    if (qword_257366BE0 != -1)
      swift_once();
    v22 = sub_2444DBBE4();
    __swift_project_value_buffer(v22, (uint64_t)qword_257367688);
    v23 = sub_2444DBBD8();
    v24 = sub_2444DBCD4();
    if (!os_log_type_enabled(v23, v24))
      goto LABEL_24;
    v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v25 = 0;
    v26 = "#SELF Uploader: not an internal build. Skipping";
    goto LABEL_23;
  }
  v2 = a1[3];
  v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v2);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v2, v3);
  v5 = v4;
  v6 = *(_QWORD *)(v4 + 16);
  if (!v6)
  {
    swift_bridgeObjectRelease();
    if (qword_257366BE0 != -1)
      swift_once();
    v27 = sub_2444DBBE4();
    __swift_project_value_buffer(v27, (uint64_t)qword_257367688);
    v23 = sub_2444DBBD8();
    v24 = sub_2444DBCD4();
    if (!os_log_type_enabled(v23, v24))
      goto LABEL_24;
    v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v25 = 0;
    v26 = "uploadIESELFRequest failed due to createIESELFEvent returned empty array.";
LABEL_23:
    _os_log_impl(&dword_2444CA000, v23, v24, v26, v25, 2u);
    MEMORY[0x24951043C](v25, -1, -1);
LABEL_24:

    return;
  }
  v7 = 0;
  v28 = v4;
  do
  {
    v11 = *(void **)(v5 + 8 * v7 + 32);
    if (v11)
    {
      v12 = v11;
      v13 = objc_msgSend(v12, sel_wrapAsAnyEvent);
      if (v13)
      {
        v14 = v13;
        if (qword_257366BE0 != -1)
          swift_once();
        v15 = sub_2444DBBE4();
        __swift_project_value_buffer(v15, (uint64_t)qword_257367688);
        v16 = v14;
        v8 = sub_2444DBBD8();
        v17 = sub_2444DBCD4();
        if (os_log_type_enabled(v8, v17))
        {
          v18 = v6;
          v19 = swift_slowAlloc();
          v20 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v19 = 138412290;
          *(_QWORD *)(v19 + 4) = v16;
          *v20 = v14;
          _os_log_impl(&dword_2444CA000, v8, v17, "FBF reporter: store the event %@ and send to server", (uint8_t *)v19, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_257366EF8);
          swift_arrayDestroy();
          MEMORY[0x24951043C](v20, -1, -1);
          v21 = v19;
          v6 = v18;
          v5 = v28;
          MEMORY[0x24951043C](v21, -1, -1);
        }
        else
        {

          v8 = v16;
        }

        v9 = objc_msgSend((id)objc_opt_self(), sel_sharedLogger);
        v10 = (void *)sub_2444DBC20();
        objc_msgSend(v9, sel_reportSiriInstrumentationEvent_forBundleID_completion_, v16, v10, 0);

      }
    }
    ++v7;
  }
  while (v6 != v7);
  swift_bridgeObjectRelease();
}

uint64_t SELFPnREmitter.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SELFPnREmitter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void sub_2444D3B54(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_2444DBD04();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

void _s20PnROnDeviceFramework14SELFPnREmitterC42uploadProvisionalSiriTurnGrainDebugSummary3for12errorMessageySSSg_AGtF_0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  const char *v13;
  uint64_t v14;
  NSObject *oslog;

  if (!AFIsInternalInstall())
  {
    if (qword_257366BE0 != -1)
      swift_once();
    v10 = sub_2444DBBE4();
    __swift_project_value_buffer(v10, (uint64_t)qword_257367688);
    oslog = sub_2444DBBD8();
    v11 = sub_2444DBCD4();
    if (!os_log_type_enabled(oslog, v11))
      goto LABEL_19;
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    v13 = "#SELF Uploader: not an internal build. Skipping";
    goto LABEL_18;
  }
  v6 = objc_msgSend(objc_allocWithZone((Class)PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper), sel_init);
  if (!v6)
  {
LABEL_14:
    if (qword_257366BE0 != -1)
      swift_once();
    v14 = sub_2444DBBE4();
    __swift_project_value_buffer(v14, (uint64_t)qword_257367688);
    oslog = sub_2444DBBD8();
    v11 = sub_2444DBCD4();
    if (!os_log_type_enabled(oslog, v11))
      goto LABEL_19;
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    v13 = "PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary init failed!";
LABEL_18:
    _os_log_impl(&dword_2444CA000, oslog, v11, v13, v12, 2u);
    MEMORY[0x24951043C](v12, -1, -1);
LABEL_19:

    return;
  }
  v7 = v6;
  v8 = objc_msgSend(objc_allocWithZone((Class)PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary), sel_init);
  if (!v8)
  {

    goto LABEL_14;
  }
  v9 = v8;
  if (a2)
    a2 = (void *)sub_2444DBC20();
  objc_msgSend(v9, sel_setTurnId_, a2);

  if (a4)
    a4 = (void *)sub_2444DBC20();
  objc_msgSend(v9, sel_setErrorMessage_, a4);

  objc_msgSend(v7, sel_setSiriRequestGrainDebugSummary_, v9);
  objc_msgSend(objc_msgSend((id)objc_opt_self(), sel_sharedStream), sel_emitMessage_, v7);

  swift_unknownObjectRelease();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t type metadata accessor for SELFPnREmitter()
{
  return objc_opt_self();
}

uint64_t method lookup function for SELFPnREmitter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SELFPnREmitter.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t SELFComponent.Orch.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SELFComponent.Orch.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_2444D3EF4()
{
  id v0;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  if (!qword_257367270)
    return 0;
  v0 = (id)qword_257367270;
  sub_2444DBB90();

  __swift_instantiateConcreteTypeFromMangledName(&qword_257366EE0);
  sub_2444D40DC();
  sub_2444D4118();
  v1 = sub_2444DBC74();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v1 + 16))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v2 = *(_QWORD *)(v1 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v2;
}

id sub_2444D3FE4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  char *v5;
  id result;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257366ED8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(a1, sel_trpId);
  if (!result)
    goto LABEL_4;
  v7 = result;
  sub_2444DBCC8();

  v8 = sub_2444DBAF4();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) == 1)
  {
    result = (id)sub_2444D2CD8((uint64_t)v5);
LABEL_4:
    *a2 = 0;
    a2[1] = 0;
    return result;
  }
  v10 = sub_2444DBAD0();
  v12 = v11;
  result = (id)(*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  *a2 = v10;
  a2[1] = v12;
  return result;
}

unint64_t sub_2444D40DC()
{
  unint64_t result;

  result = qword_257366EE8;
  if (!qword_257366EE8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257366EE8);
  }
  return result;
}

unint64_t sub_2444D4118()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257366EF0;
  if (!qword_257366EF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257366EE0);
    result = MEMORY[0x2495103AC](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_257366EF0);
  }
  return result;
}

uint64_t SELFComponent.Orch.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SELFComponent.Orch.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SELFComponent.Orch()
{
  return objc_opt_self();
}

uint64_t method lookup function for SELFComponent.Orch()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SELFComponent.Orch.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of SELFComponent.Orch.selectedTRPID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t SELFComponent.UEI.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SELFComponent.UEI.init()()
{
  uint64_t v0;

  return v0;
}

void sub_2444D41D4(uint64_t *a1@<X8>)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  swift_beginAccess();
  if (!qword_257367270)
    goto LABEL_25;
  v2 = (id)qword_257367270;
  v3 = sub_2444DBB84();

  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257366CC0);
    sub_2444D1860(0, &qword_257367038);
    sub_2444D17D0();
    v4 = sub_2444DBC68();
    swift_release();
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      v10 = sub_2444DBD64();
      swift_bridgeObjectRelease();
      if (v10)
        goto LABEL_5;
    }
    else if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_5:
      if ((v4 & 0xC000000000000001) != 0)
      {
        v5 = (id)MEMORY[0x24950FF74](0, v4);
LABEL_8:
        v6 = v5;
        swift_bridgeObjectRelease();
        v7 = sub_2444DBB30();
        if (v7)
        {
          v8 = (void *)v7;
          v9 = 1;
LABEL_28:
          v18 = sub_2444DBB3C();

LABEL_30:
          *a1 = v9;
          a1[1] = v18;
          return;
        }
        goto LABEL_34;
      }
      if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        v5 = *(id *)(v4 + 32);
        goto LABEL_8;
      }
      __break(1u);
LABEL_23:
      swift_bridgeObjectRetain();
      v15 = sub_2444DBD64();
      swift_bridgeObjectRelease();
      if (!v15)
        goto LABEL_24;
      goto LABEL_16;
    }
    swift_bridgeObjectRelease();
  }
  if (!qword_257367270 || (v11 = (id)qword_257367270, v12 = sub_2444DBB84(), v11, !v12))
  {
LABEL_25:
    sub_2444D65D8();
    if (!v16)
    {
      v18 = 0;
      v9 = 11;
      goto LABEL_30;
    }
    v6 = v16;
    v17 = sub_2444DBB30();
    if (v17)
    {
      v8 = (void *)v17;
      v9 = 7;
      goto LABEL_28;
    }
    goto LABEL_33;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257366CC0);
  sub_2444D1860(0, &qword_257367038);
  sub_2444D17D0();
  v4 = sub_2444DBC68();
  swift_release();
  if (v4 >> 62)
    goto LABEL_23;
  if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_24:
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
LABEL_16:
  if ((v4 & 0xC000000000000001) != 0)
  {
    v13 = (id)MEMORY[0x24950FF74](0, v4);
  }
  else
  {
    if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    v13 = *(id *)(v4 + 32);
  }
  v6 = v13;
  swift_bridgeObjectRelease();
  v14 = sub_2444DBB30();
  if (v14)
  {
    v8 = (void *)v14;
    v9 = 2;
    goto LABEL_28;
  }
LABEL_35:
  __break(1u);
}

uint64_t sub_2444D44C0(void *a1)
{
  unsigned int v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v2 = objc_msgSend(a1, sel_dialogPhase);
  if ((v2 >= 9 || ((0x107u >> v2) & 1) == 0)
    && (v3 = objc_msgSend(a1, sel_aceCommandClass)) != 0
    && (v4 = v3, v5 = sub_2444DBC2C(), v7 = v6, v4, v7))
  {
    if (v5 == 0x5664644149554153 && v7 == 0xEC00000073776569)
      v9 = 1;
    else
      v9 = sub_2444DBDA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9 & 1;
}

uint64_t sub_2444D45AC(void *a1)
{
  unsigned int v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  char v10;

  v2 = objc_msgSend(a1, sel_dialogPhase);
  if (v2 < 9 && ((0x107u >> v2) & 1) != 0)
    goto LABEL_12;
  v3 = objc_msgSend(a1, sel_aceCommandClass);
  if (!v3 || (v4 = v3, v5 = sub_2444DBC2C(), v7 = v6, v4, !v7))
  {
    v10 = 1;
    return v10 & 1;
  }
  if (v5 == 0x5664644149554153 && v7 == 0xEC00000073776569)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    v10 = 0;
    return v10 & 1;
  }
  v9 = sub_2444DBDA0();
  swift_bridgeObjectRelease();
  v10 = v9 ^ 1;
  return v10 & 1;
}

uint64_t sub_2444D46A4()
{
  return sub_2444D470C(&qword_257366CC8);
}

uint64_t sub_2444D46C0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  objc_msgSend(a1, sel_requestStatus);
  result = sub_2444DBCEC();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_2444D46F0()
{
  return sub_2444D470C(&qword_257366CD8);
}

uint64_t sub_2444D470C(unint64_t *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_beginAccess();
  if (!qword_257367270)
    return 0;
  v2 = (id)qword_257367270;
  v3 = sub_2444DBB84();

  if (!v3)
    return 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257366CC0);
  sub_2444D1860(0, a1);
  sub_2444D17D0();
  v4 = sub_2444DBC74();
  swift_release();
  if (!*(_QWORD *)(v4 + 16))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v5 = *(_QWORD *)(v4 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v5;
}

void sub_2444D4818(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  v4 = objc_msgSend(a1, sel_error);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, sel_errorDomain);

    if (v6)
    {
      v7 = sub_2444DBC2C();
      v9 = v8;

      v10 = objc_msgSend(a1, sel_error);
      if (v10)
      {
        v11 = v10;
        v12 = objc_msgSend(v10, sel_errorCode);

        if (v12)
        {
          sub_2444DBC2C();

          swift_bridgeObjectRetain();
          sub_2444DBC50();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_2444DBC50();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          *a2 = v7;
          a2[1] = v9;
          return;
        }
      }
      swift_bridgeObjectRelease();
    }
  }
  *a2 = 0;
  a2[1] = 0;
}

uint64_t SELFComponent.UEI.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SELFComponent.UEI.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2444D4974(void *a1)
{
  return sub_2444D45AC(a1);
}

uint64_t sub_2444D497C(void *a1)
{
  return sub_2444D44C0(a1);
}

uint64_t type metadata accessor for SELFComponent.UEI()
{
  return objc_opt_self();
}

uint64_t method lookup function for SELFComponent.UEI()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SELFComponent.UEI.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of SELFComponent.UEI.uufrReady.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of SELFComponent.UEI.requestStatus.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of SELFComponent.UEI.error.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t SELFProcessedStreamTurnReader.bookmark.getter()
{
  return swift_retain();
}

uint64_t SELFProcessedStreamTurnReader.bookmark.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_release();
  *v1 = a1;
  return result;
}

uint64_t (*SELFProcessedStreamTurnReader.bookmark.modify())()
{
  return nullsub_1;
}

uint64_t SELFProcessedStreamTurnReader.init(streamIdentifier:domain:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t result;

  type metadata accessor for Bookmark();
  v6 = (_QWORD *)swift_allocObject();
  v7 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v8 = (void *)sub_2444DBC20();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v7, sel_initWithSuiteName_, v8);

  v6[2] = v9;
  v6[3] = a1;
  v6[4] = a2;
  swift_bridgeObjectRetain();
  result = sub_2444DBC50();
  v6[5] = a1;
  v6[6] = a2;
  *a3 = v6;
  return result;
}

uint64_t SELFProcessedStreamTurnReader.read()()
{
  uint64_t *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543F6740);
  v1[29] = v2;
  v1[30] = *(_QWORD *)(v2 - 8);
  v1[31] = swift_task_alloc();
  v3 = sub_2444DBAB8();
  v1[32] = v3;
  v1[33] = *(_QWORD *)(v3 - 8);
  v1[34] = swift_task_alloc();
  v4 = swift_task_alloc();
  v5 = *v0;
  v1[35] = v4;
  v1[36] = v5;
  return swift_task_switch();
}

uint64_t sub_2444D4BB0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  _QWORD *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23[14];
  char v24;

  v1 = swift_allocObject();
  v0[37] = v1;
  *(_QWORD *)(v1 + 16) = MEMORY[0x24BEE4AF8];
  if (qword_257366BE0 != -1)
    swift_once();
  v2 = sub_2444DBBE4();
  v0[38] = __swift_project_value_buffer(v2, (uint64_t)qword_257367688);
  swift_retain_n();
  v3 = sub_2444DBBD8();
  v4 = sub_2444DBCD4();
  v5 = os_log_type_enabled(v3, v4);
  v6 = v0[36];
  if (v5)
  {
    v7 = v0[35];
    v20 = v0[32];
    v21 = v0[33];
    v8 = swift_slowAlloc();
    v22 = swift_slowAlloc();
    v23[0] = v22;
    *(_DWORD *)v8 = 136315394;
    swift_beginAccess();
    v9 = *(_QWORD *)(v6 + 40);
    v10 = *(_QWORD *)(v6 + 48);
    swift_bridgeObjectRetain();
    v0[27] = sub_2444D1180(v9, v10, v23);
    sub_2444DBD04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    sub_2444CFD74(v7);
    sub_2444D5C9C();
    v11 = sub_2444DBD94();
    v13 = v12;
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v7, v20);
    v0[28] = sub_2444D1180(v11, v13, v23);
    sub_2444DBD04();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_2444CA000, v3, v4, "Bookmark: %s,  Last Bookmark Time is %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24951043C](v22, -1, -1);
    MEMORY[0x24951043C](v8, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  v15 = v0[33];
  v14 = v0[34];
  v16 = v0[32];
  sub_2444DBB78();
  sub_2444DBBA8();
  v0[39] = sub_2444DBB9C();
  sub_2444CFD74(v14);
  sub_2444DBA94();
  v17 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v0[40] = v17;
  v17(v14, v16);
  v18 = (_QWORD *)swift_task_alloc();
  v0[41] = v18;
  *v18 = v0;
  v18[1] = sub_2444D4EF4;
  v24 = 1;
  v23[13] = 0;
  return sub_2444DBB6C();
}

uint64_t sub_2444D4EF4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = *(void **)(*(_QWORD *)v1 + 312);
  *(_QWORD *)(*(_QWORD *)v1 + 336) = v0;
  swift_task_dealloc();

  return swift_task_switch();
}

uint64_t sub_2444D4F60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint8_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;

  v1 = v0 + 16;
  v3 = *(_QWORD *)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 248);
  v4 = *(_QWORD *)(v0 + 232);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  swift_retain();
  sub_2444DBB60();
  sub_2444D5C50();
  swift_retain();
  v5 = (void *)sub_2444DBB00();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_retain();
  v6 = sub_2444DBBD8();
  v7 = sub_2444DBCD4();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(_QWORD *)(v0 + 296);
    v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v9 = 134217984;
    swift_beginAccess();
    v10 = *(_QWORD *)(v8 + 16);
    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      v11 = sub_2444DBD64();
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    *(_QWORD *)(v0 + 200) = v11;
    sub_2444DBD04();
    swift_release();
    _os_log_impl(&dword_2444CA000, v6, v7, "Received total of %ld turns", v9, 0xCu);
    MEMORY[0x24951043C](v9, -1, -1);
  }
  else
  {
    swift_release();
  }

  v12 = *(_QWORD *)(v0 + 280);
  sub_2444DBAAC();
  sub_2444D02E8(v12);
  swift_retain_n();
  v13 = sub_2444DBBD8();
  v14 = sub_2444DBCD4();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = *(_QWORD *)(v0 + 288);
    v16 = *(_QWORD *)(v0 + 280);
    v26 = *(_QWORD *)(v0 + 256);
    v27 = *(void (**)(uint64_t, uint64_t))(v0 + 320);
    v17 = swift_slowAlloc();
    v28 = swift_slowAlloc();
    v29 = v28;
    *(_DWORD *)v17 = 136315394;
    swift_beginAccess();
    v19 = *(_QWORD *)(v15 + 40);
    v18 = *(_QWORD *)(v15 + 48);
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 176) = sub_2444D1180(v19, v18, &v29);
    sub_2444DBD04();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v17 + 12) = 2080;
    sub_2444CFD74(v16);
    sub_2444D5C9C();
    v20 = sub_2444DBD94();
    v22 = v21;
    v27(v16, v26);
    *(_QWORD *)(v0 + 184) = sub_2444D1180(v20, v22, &v29);
    sub_2444DBD04();
    v1 = v0 + 16;
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_2444CA000, v13, v14, "Task Completed, Bookmark updated: %s,  Last Bookmark Time is %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24951043C](v28, -1, -1);
    MEMORY[0x24951043C](v17, -1, -1);

    swift_release();
  }
  else
  {
    swift_release();
    swift_release_n();

  }
  v23 = *(_QWORD *)(v0 + 296);
  swift_beginAccess();
  v24 = *(_QWORD *)(v23 + 16);
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_0(v1);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v24);
}

uint64_t sub_2444D53B8()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;

  v1 = *(void **)(v0 + 336);
  v2 = v1;
  v3 = v1;
  v4 = sub_2444DBBD8();
  v5 = sub_2444DBCD4();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 336);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v6;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 192) = v10;
    sub_2444DBD04();
    *v8 = v10;

    _os_log_impl(&dword_2444CA000, v4, v5, "Failed to read and parse Siri turns, no Siri metrics: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257366EF8);
    swift_arrayDestroy();
    MEMORY[0x24951043C](v8, -1, -1);
    MEMORY[0x24951043C](v7, -1, -1);
  }
  else
  {
    v11 = *(void **)(v0 + 336);

  }
  swift_getErrorValue();
  v12 = sub_2444DBDC4();
  _s20PnROnDeviceFramework14SELFPnREmitterC42uploadProvisionalSiriTurnGrainDebugSummary3for12errorMessageySSSg_AGtF_0(0, 0, v12, v13);
  swift_bridgeObjectRelease();
  if (qword_257366BB0 != -1)
    swift_once();
  v15 = qword_257366D88;
  v14 = unk_257366D90;
  if (qword_257366BC0 != -1)
    swift_once();
  v16 = *(void **)(v0 + 336);
  _s20PnROnDeviceFramework14FileRadarUtilsO14autoBugCapture9errorType0k3SubL003subL7ContextySS_S2StFZ_0(v15, v14, qword_257366DA8, unk_257366DB0);

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

void sub_2444D5644(void *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  NSObject *oslog;

  if (objc_msgSend(a1, sel_state))
  {
    if (objc_msgSend(a1, sel_state) == (id)1)
    {
      if (qword_257366BE0 != -1)
        swift_once();
      v2 = sub_2444DBBE4();
      __swift_project_value_buffer(v2, (uint64_t)qword_257367688);
      v3 = sub_2444DBBD8();
      v4 = sub_2444DBCE0();
      if (os_log_type_enabled(v3, v4))
      {
        v5 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_2444CA000, v3, v4, "Received the failure state", v5, 2u);
        MEMORY[0x24951043C](v5, -1, -1);
      }

      if (qword_257366BB0 != -1)
        swift_once();
      v6 = qword_257366D88;
      v7 = unk_257366D90;
      if (qword_257366BB8 != -1)
        swift_once();
      v8 = qword_257366D98;
      v9 = unk_257366DA0;
      if (qword_257366BC8 == -1)
        goto LABEL_27;
    }
    else
    {
      if (qword_257366BE0 != -1)
        swift_once();
      v13 = sub_2444DBBE4();
      __swift_project_value_buffer(v13, (uint64_t)qword_257367688);
      v14 = sub_2444DBBD8();
      v15 = sub_2444DBCE0();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_2444CA000, v14, v15, "Received the unknown state", v16, 2u);
        MEMORY[0x24951043C](v16, -1, -1);
      }

      if (qword_257366BB0 != -1)
        swift_once();
      v6 = qword_257366D88;
      v7 = unk_257366D90;
      if (qword_257366BB8 != -1)
        swift_once();
      v8 = qword_257366D98;
      v9 = unk_257366DA0;
      if (qword_257366BD0 == -1)
        goto LABEL_27;
    }
    swift_once();
LABEL_27:
    _s20PnROnDeviceFramework14FileRadarUtilsO14autoBugCapture9errorType0k3SubL003subL7ContextySS_S2StFZ_0(v6, v7, v8, v9);
    return;
  }
  if (qword_257366BE0 != -1)
    swift_once();
  v10 = sub_2444DBBE4();
  __swift_project_value_buffer(v10, (uint64_t)qword_257367688);
  oslog = sub_2444DBBD8();
  v11 = sub_2444DBCD4();
  if (os_log_type_enabled(oslog, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2444CA000, oslog, v11, "Received the completion state", v12, 2u);
    MEMORY[0x24951043C](v12, -1, -1);
  }

}

void sub_2444D59EC(void *a1, uint64_t a2)
{
  _QWORD *v3;
  id v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  NSObject *oslog;

  if (a1)
  {
    v3 = (_QWORD *)(a2 + 16);
    swift_beginAccess();
    v4 = a1;
    MEMORY[0x24950FEB4]();
    if (*(_QWORD *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_2444DBC98();
    sub_2444DBCA4();
    sub_2444DBC8C();
    swift_endAccess();
  }
  else
  {
    if (qword_257366BE0 != -1)
      swift_once();
    v5 = sub_2444DBBE4();
    __swift_project_value_buffer(v5, (uint64_t)qword_257367688);
    oslog = sub_2444DBBD8();
    v6 = sub_2444DBCD4();
    if (os_log_type_enabled(oslog, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2444CA000, oslog, v6, "receiving SELFProcessedEvent", v7, 2u);
      MEMORY[0x24951043C](v7, -1, -1);
    }

  }
}

uint64_t sub_2444D5B44()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2444CFCDC;
  return SELFProcessedStreamTurnReader.read()();
}

uint64_t sub_2444D5B88()
{
  return swift_retain();
}

void *sub_2444D5B90(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_2444DBD7C();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_2444D5C24()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_2444D5C48(void *a1)
{
  uint64_t v1;

  sub_2444D59EC(a1, v1);
}

unint64_t sub_2444D5C50()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257367100;
  if (!qword_257367100)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543F6740);
    result = MEMORY[0x2495103AC](MEMORY[0x24BE0C940], v1);
    atomic_store(result, (unint64_t *)&qword_257367100);
  }
  return result;
}

unint64_t sub_2444D5C9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257367108;
  if (!qword_257367108)
  {
    v1 = sub_2444DBAB8();
    result = MEMORY[0x2495103AC](MEMORY[0x24BDCE988], v1);
    atomic_store(result, (unint64_t *)&qword_257367108);
  }
  return result;
}

ValueMetadata *type metadata accessor for SELFProcessedStreamTurnReader()
{
  return &type metadata for SELFProcessedStreamTurnReader;
}

void sub_2444D5CF4(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_2444D5D40(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2444D5E1C + 4 * byte_2444DCC1B[a2]))(0x4E574F4E4B4E55);
}

uint64_t sub_2444D5E1C(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x4E574F4E4B4E55 && v1 == 0xE700000000000000)
    v2 = 1;
  else
    v2 = sub_2444DBDA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

PnROnDeviceFramework::SelectedEvent_optional __swiftcall SelectedEvent.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  PnROnDeviceFramework::SelectedEvent_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2444DBD88();
  result.value = swift_bridgeObjectRelease();
  v5 = 11;
  if (v3 < 0xB)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t SelectedEvent.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2444D5FB8 + 4 * byte_2444DCC26[*v0]))(0xD000000000000015, 0x80000002444DD6C0);
}

uint64_t sub_2444D5FB8()
{
  return 0x4E574F4E4B4E55;
}

uint64_t sub_2444D5FD0(uint64_t a1)
{
  return a1 + 3;
}

void sub_2444D6078(char *a1)
{
  sub_2444D5CF4(*a1);
}

uint64_t sub_2444D6084()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_2444DBDE8();
  sub_2444D60D0((uint64_t)v3, v1);
  return sub_2444DBE00();
}

void sub_2444D60C8(uint64_t a1)
{
  char *v1;

  sub_2444D60D0(a1, *v1);
}

void sub_2444D60D0(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2444D6114()
{
  sub_2444DBC44();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2444D61E8()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_2444DBDE8();
  sub_2444D60D0((uint64_t)v3, v1);
  return sub_2444DBE00();
}

PnROnDeviceFramework::SelectedEvent_optional sub_2444D6228(Swift::String *a1)
{
  return SelectedEvent.init(rawValue:)(*a1);
}

uint64_t sub_2444D6234@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = SelectedEvent.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void PnREvent.eventName.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t PnREvent.eventTimestamp.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

unint64_t sub_2444D6270()
{
  unint64_t result;

  result = qword_257367118;
  if (!qword_257367118)
  {
    result = MEMORY[0x2495103AC](&protocol conformance descriptor for SelectedEvent, &type metadata for SelectedEvent);
    atomic_store(result, (unint64_t *)&qword_257367118);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SelectedEvent(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF6)
    goto LABEL_17;
  if (a2 + 10 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 10) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 10;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 10;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 10;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v8 = v6 - 11;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SelectedEvent(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_2444D6390 + 4 * byte_2444DCC41[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_2444D63C4 + 4 * byte_2444DCC3C[v4]))();
}

uint64_t sub_2444D63C4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2444D63CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2444D63D4);
  return result;
}

uint64_t sub_2444D63E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2444D63E8);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_2444D63EC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2444D63F4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2444D6400(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SelectedEvent()
{
  return &type metadata for SelectedEvent;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PnREvent(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xF6 && a1[16])
    return (*(_DWORD *)a1 + 246);
  v3 = *a1;
  v4 = v3 >= 0xB;
  v5 = v3 - 11;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PnREvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF5)
  {
    *(_QWORD *)result = a2 - 246;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xF6)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xF6)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 10;
  }
  return result;
}

ValueMetadata *type metadata accessor for PnREvent()
{
  return &type metadata for PnREvent;
}

uint64_t SELFComponent.Flow.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SELFComponent.Flow.init()()
{
  uint64_t v0;

  return v0;
}

BOOL sub_2444D64D0(void *a1)
{
  id v1;
  id v2;

  v1 = objc_msgSend(a1, sel_flowState);
  v2 = v1;
  if (v1)

  return v2 != 0;
}

id sub_2444D6510(void *a1)
{
  id result;
  void *v2;
  id v3;
  unsigned int v4;

  result = objc_msgSend(a1, sel_flowStep);
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(result, sel_flowState);

    if (v3)
    {
      v4 = objc_msgSend(v3, sel_flowStateType);

      return (id)(v4 == 142);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t SELFComponent.Flow.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SELFComponent.Flow.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SELFComponent.Flow()
{
  return objc_opt_self();
}

uint64_t method lookup function for SELFComponent.Flow()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SELFComponent.Flow.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

void sub_2444D65D8()
{
  id v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  id v4;

  swift_beginAccess();
  if (qword_257367270 && (v0 = (id)qword_257367270, v1 = sub_2444DBBC0(), v0, v1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573671C8);
    sub_2444D1860(0, &qword_2573671D0);
    sub_2444D2D18(&qword_2573671D8, &qword_2573671C8, MEMORY[0x24BDFCBB8]);
    sub_2444DBC68();
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257366EE0);
    sub_2444D1860(0, &qword_2573671E0);
    sub_2444D2D18((unint64_t *)&qword_257366EF0, &qword_257366EE0, MEMORY[0x24BEE12C8]);
    v2 = sub_2444DBC68();
    swift_bridgeObjectRelease();
    if (v2 >> 62)
      goto LABEL_4;
  }
  else
  {
    v2 = MEMORY[0x24BEE4AF8];
    if (MEMORY[0x24BEE4AF8] >> 62)
    {
LABEL_4:
      swift_bridgeObjectRetain();
      v3 = sub_2444DBD64();
      swift_bridgeObjectRelease();
      if (!v3)
        goto LABEL_11;
      goto LABEL_8;
    }
  }
  if (!*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_11:
    swift_bridgeObjectRelease();
    return;
  }
LABEL_8:
  if ((v2 & 0xC000000000000001) != 0)
  {
    MEMORY[0x24950FF74](0, v2);
    goto LABEL_11;
  }
  if (*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v4 = *(id *)(v2 + 32);
    goto LABEL_11;
  }
  __break(1u);
}

uint64_t dispatch thunk of PnRRecord.description.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PnRLatencyContextRecord.metricsValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PnRSummary.createProvisionalSELFEvent()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PnRSummary.createSiriTurnGrainSummarySELFEvent()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_2444D6808(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  Class isa;
  uint64_t v10;
  char *v11;
  id v12;
  int64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  id v26;
  uint64_t result;
  unint64_t v28;
  char v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  unint64_t v37;
  unint64_t v38;
  char v39;
  unint64_t v40;
  unint64_t v41;
  char v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  int64_t v52;
  unint64_t v53;
  unint64_t i;
  int64_t v55;
  unint64_t v56;
  int64_t v57;
  uint64_t v58;
  double v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  NSObject *v67;
  os_log_type_t v68;
  _BOOL4 v69;
  id v70;
  id v71;
  uint8_t *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  char *v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  id v86;
  NSObject *v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  id v95;
  void *v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  os_log_t v100;
  char *v101;
  unint64_t v102;
  id v103;
  char *v104;
  Class v105;
  os_log_t v106;
  id v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110[4];
  id v111;

  v4 = sub_2444DBBE4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v101 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2444DBAF4();
  isa = v8[-1].isa;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v101 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95878]), sel_init);
  if (!v12)
    goto LABEL_11;
  v13 = (int64_t)v12;
  v108 = v5;
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95898]), sel_init);
  if (!v14)
  {

LABEL_11:
    if (qword_257366BE0 != -1)
LABEL_112:
      swift_once();
    __swift_project_value_buffer(v4, (uint64_t)qword_257367688);
    v23 = sub_2444DBBD8();
    v24 = sub_2444DBCD4();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_2444CA000, v23, v24, "PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary init failed!", v25, 2u);
      MEMORY[0x24951043C](v25, -1, -1);
    }

    return 0;
  }
  v15 = v14;
  v104 = v11;
  v105 = isa;
  v106 = v8;
  v111 = v14;
  v16 = objc_allocWithZone(MEMORY[0x24BE95880]);
  v17 = v15;
  v18 = objc_msgSend(v16, sel_init);
  if (!v18)
  {

    if (qword_257366BE0 != -1)
      goto LABEL_114;
    goto LABEL_94;
  }
  v19 = v18;
  if (*(_QWORD *)(a1 + 16)
    && (v20 = sub_2444D9C04(0x436E616C506D756ELL, 0xEE00646574616572), (v21 & 1) != 0)
    && (sub_2444D1908(*(_QWORD *)(a1 + 56) + 32 * v20, (uint64_t)v110), (swift_dynamicCast() & 1) != 0))
  {
    v22 = v109;
    if ((v109 & 0x8000000000000000) != 0 || HIDWORD(v109))
    {
LABEL_115:
      result = sub_2444DBD58();
      __break(1u);
      return result;
    }
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(v17, sel_setNumPlansCreated_, v22);
  if (*(_QWORD *)(a1 + 16) && (v28 = sub_2444D9C04(0xD000000000000011, 0x80000002444DDDB0), (v29 & 1) != 0))
  {
    sub_2444D1908(*(_QWORD *)(a1 + 56) + 32 * v28, (uint64_t)v110);
    if (swift_dynamicCast())
      v30 = v109;
    else
      v30 = 0;
    if ((v30 & 0x8000000000000000) != 0 || HIDWORD(v30))
      goto LABEL_115;
  }
  else
  {
    v30 = 0;
  }
  objc_msgSend(v17, sel_setNumQueriesCreated_, v30);
  if (*(_QWORD *)(a1 + 16) && (v31 = sub_2444D9C04(0xD000000000000012, 0x80000002444DDFB0), (v32 & 1) != 0))
  {
    sub_2444D1908(*(_QWORD *)(a1 + 56) + 32 * v31, (uint64_t)v110);
    if (swift_dynamicCast())
      v33 = v109;
    else
      v33 = 0;
    if ((v33 & 0x8000000000000000) != 0 || HIDWORD(v33))
      goto LABEL_115;
  }
  else
  {
    v33 = 0;
  }
  objc_msgSend(v17, sel_setNumQueriesExecuted_, v33);
  v34 = *(_QWORD *)(a1 + 16);
  v103 = (id)v13;
  if (v34 && (v35 = sub_2444D9C04(0xD000000000000016, 0x80000002444DDFD0), (v36 & 1) != 0))
  {
    sub_2444D1908(*(_QWORD *)(a1 + 56) + 32 * v35, (uint64_t)v110);
    if (swift_dynamicCast())
      v37 = v109;
    else
      v37 = 0;
    if ((v37 & 0x8000000000000000) != 0 || HIDWORD(v37))
      goto LABEL_115;
  }
  else
  {
    v37 = 0;
  }
  objc_msgSend(v17, sel_setNumClientActionsCreated_, v37);
  if (*(_QWORD *)(a1 + 16) && (v38 = sub_2444D9C04(0xD000000000000018, 0x80000002444DDFF0), (v39 & 1) != 0))
  {
    sub_2444D1908(*(_QWORD *)(a1 + 56) + 32 * v38, (uint64_t)v110);
    if (swift_dynamicCast())
      v40 = v109;
    else
      v40 = 0;
    if ((v40 & 0x8000000000000000) != 0 || HIDWORD(v40))
      goto LABEL_115;
  }
  else
  {
    v40 = 0;
  }
  objc_msgSend(v17, sel_setNumActionResolverRequests_, v40);
  if (*(_QWORD *)(a1 + 16) && (v41 = sub_2444D9C04(0xD000000000000018, 0x80000002444DDFF0), (v42 & 1) != 0))
  {
    sub_2444D1908(*(_QWORD *)(a1 + 56) + 32 * v41, (uint64_t)v110);
    if (swift_dynamicCast())
      v43 = v109;
    else
      v43 = 0;
    if ((v43 & 0x8000000000000000) != 0 || HIDWORD(v43))
      goto LABEL_115;
  }
  else
  {
    v43 = 0;
  }
  objc_msgSend(v17, sel_setNumStatementsEvaluatedFromPlanner_, v43);
  v44 = *(_QWORD *)(a1 + 16);
  v101 = v7;
  v102 = v4;
  v107 = v19;
  if (v44 && (v45 = sub_2444D9C04(0xD000000000000017, 0x80000002444DE010), (v46 & 1) != 0))
  {
    sub_2444D1908(*(_QWORD *)(a1 + 56) + 32 * v45, (uint64_t)v110);
    if (swift_dynamicCast())
      v47 = v109;
    else
      v47 = 0;
    if ((v47 & 0x8000000000000000) != 0 || HIDWORD(v47))
      goto LABEL_115;
  }
  else
  {
    v47 = 0;
  }
  objc_msgSend(v17, sel_setNumSystemPromptsResolved_, v47, v101);

  v48 = a2 + 64;
  v49 = 1 << *(_BYTE *)(a2 + 32);
  v50 = -1;
  if (v49 < 64)
    v50 = ~(-1 << v49);
  v51 = v50 & *(_QWORD *)(a2 + 64);
  v52 = (unint64_t)(v49 + 63) >> 6;
  swift_bridgeObjectRetain();
  v13 = 0;
  v4 = 0x24BE95000uLL;
  if (!v51)
    goto LABEL_76;
LABEL_75:
  v53 = __clz(__rbit64(v51));
  v51 &= v51 - 1;
  for (i = v53 | (v13 << 6); ; i = __clz(__rbit64(v56)) + (v13 << 6))
  {
    v58 = 8 * i;
    v17 = *(id *)(*(_QWORD *)(a2 + 48) + v58);
    v59 = *(double *)(*(_QWORD *)(a2 + 56) + v58);
    v60 = objc_allocWithZone(MEMORY[0x24BE958A8]);
    swift_retain();
    v61 = objc_msgSend(v60, sel_init);
    if (!v61)
    {
      if (qword_257366BE0 != -1)
        swift_once();
      __swift_project_value_buffer(v102, (uint64_t)qword_257367688);
      v67 = sub_2444DBBD8();
      v68 = sub_2444DBCD4();
      v69 = os_log_type_enabled(v67, v68);
      v70 = v103;
      v71 = v107;
      if (v69)
      {
        v72 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v72 = 0;
        _os_log_impl(&dword_2444CA000, v67, v68, "PNRODSchemaPNRODMetricDurationMetric init failed!", v72, 2u);
        MEMORY[0x24951043C](v72, -1, -1);
      }
      swift_release();

      swift_release();
      return 0;
    }
    v62 = v61;
    objc_msgSend(v61, sel_setMetricValue_, v59);
    v110[0] = (uint64_t)v62;
    v63 = v62;
    swift_setAtWritableKeyPath();

    swift_release();
    if (v51)
      goto LABEL_75;
LABEL_76:
    v55 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_112;
    }
    if (v55 >= v52)
    {
LABEL_102:
      swift_release();
      v73 = v111;
      v74 = sub_2444D7508(0x6552746E65696C63, 0xEF64497473657571, a1);
      objc_msgSend(v73, sel_setClientRequestId_, v74);

      v75 = v73;
      v76 = sub_2444D7508(0x6E6576456E616C70, 0xEB00000000644974, a1);
      objc_msgSend(v75, sel_setPlanId_, v76);

      v77 = v104;
      sub_2444DBAE8();
      v78 = objc_allocWithZone(MEMORY[0x24BE95C78]);
      v79 = (void *)sub_2444DBADC();
      v80 = objc_msgSend(v78, sel_initWithNSUUID_, v79);

      (*((void (**)(char *, os_log_t))v105 + 1))(v77, v106);
      v81 = v107;
      objc_msgSend(v107, sel_setPnrodId_, v80);

      v26 = v103;
      objc_msgSend(v103, sel_setEventMetadata_, v81);
      objc_msgSend(v26, sel_setPnrodIntelligenceFlowPlannerGrainSummary_, v111);
      if (qword_257366BE0 != -1)
        swift_once();
      v82 = v102;
      v83 = __swift_project_value_buffer(v102, (uint64_t)qword_257367688);
      v84 = v108;
      v85 = v101;
      (*(void (**)(char *, uint64_t, uint64_t))(v108 + 16))(v101, v83, v82);
      v86 = v26;
      v87 = sub_2444DBBD8();
      v88 = sub_2444DBCD4();
      if (os_log_type_enabled(v87, (os_log_type_t)v88))
      {
        LODWORD(v105) = v88;
        v106 = v87;
        v89 = swift_slowAlloc();
        v90 = swift_slowAlloc();
        v110[0] = v90;
        *(_DWORD *)v89 = 136315394;
        v91 = objc_msgSend(v86, sel_qualifiedMessageName);
        v92 = sub_2444DBC2C();
        v94 = v93;

        v109 = sub_2444D1180(v92, v94, v110);
        sub_2444DBD04();

        swift_bridgeObjectRelease();
        *(_WORD *)(v89 + 12) = 2080;
        v95 = objc_msgSend(v86, sel_formattedJsonBody);
        if (v95)
        {
          v96 = v95;
          v97 = sub_2444DBC2C();
          v99 = v98;

        }
        else
        {
          v99 = 0xE500000000000000;
          v97 = 0x3E4C494E3CLL;
        }
        v109 = sub_2444D1180(v97, v99, v110);
        sub_2444DBD04();

        swift_bridgeObjectRelease();
        v100 = v106;
        _os_log_impl(&dword_2444CA000, v106, (os_log_type_t)v105, "Creating PnROD pnrodIntelligenceFlowPlannerGrainSummary at planner grain %s: %s", (uint8_t *)v89, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24951043C](v90, -1, -1);
        MEMORY[0x24951043C](v89, -1, -1);

        (*(void (**)(char *, uint64_t))(v108 + 8))(v101, v82);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v84 + 8))(v85, v82);
      }

      return (uint64_t)v26;
    }
    v56 = *(_QWORD *)(v48 + 8 * v55);
    ++v13;
    if (!v56)
    {
      v13 = v55 + 1;
      if (v55 + 1 >= v52)
        goto LABEL_102;
      v56 = *(_QWORD *)(v48 + 8 * v13);
      if (!v56)
      {
        v13 = v55 + 2;
        if (v55 + 2 >= v52)
          goto LABEL_102;
        v56 = *(_QWORD *)(v48 + 8 * v13);
        if (!v56)
          break;
      }
    }
LABEL_89:
    v51 = (v56 - 1) & v56;
  }
  v57 = v55 + 3;
  if (v57 >= v52)
    goto LABEL_102;
  v56 = *(_QWORD *)(v48 + 8 * v57);
  if (v56)
  {
    v13 = v57;
    goto LABEL_89;
  }
  while (1)
  {
    v13 = v57 + 1;
    if (__OFADD__(v57, 1))
      break;
    if (v13 >= v52)
      goto LABEL_102;
    v56 = *(_QWORD *)(v48 + 8 * v13);
    ++v57;
    if (v56)
      goto LABEL_89;
  }
  __break(1u);
LABEL_114:
  swift_once();
LABEL_94:
  __swift_project_value_buffer(v4, (uint64_t)qword_257367688);
  v64 = sub_2444DBBD8();
  v65 = sub_2444DBCD4();
  if (os_log_type_enabled(v64, v65))
  {
    v66 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v66 = 0;
    _os_log_impl(&dword_2444CA000, v64, v65, "PNRODSchemaPNRODClientEventMetadata init failed!", v66, 2u);
    MEMORY[0x24951043C](v66, -1, -1);
  }

  return 0;
}

id sub_2444D7508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  char v14;
  uint64_t *v15;
  char *v16;
  id v17;
  id v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257366ED8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2444DBAF4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a3 + 16))
  {
    v22 = 0u;
    v23 = 0u;
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  v13 = sub_2444D9C04(a1, a2);
  if ((v14 & 1) == 0)
  {
    v22 = 0u;
    v23 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_2444D1908(*(_QWORD *)(a3 + 56) + 32 * v13, (uint64_t)&v22);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v23 + 1))
  {
LABEL_9:
    v15 = &qword_257366CB0;
    v16 = (char *)&v22;
LABEL_10:
    sub_2444D9C90((uint64_t)v16, v15);
    return 0;
  }
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_2444DBAC4();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
      v19 = objc_allocWithZone(MEMORY[0x24BE95C78]);
      v20 = (void *)sub_2444DBADC();
      v17 = objc_msgSend(v19, sel_initWithNSUUID_, v20);

      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      return v17;
    }
    v15 = &qword_257366ED8;
    v16 = v8;
    goto LABEL_10;
  }
  return 0;
}

id sub_2444D76FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  int64_t v25;
  unint64_t v26;
  unint64_t i;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t v31;
  double v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  id v40;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  NSObject *v45;
  os_log_type_t v46;
  _BOOL4 v47;
  id v48;
  id v49;
  uint8_t *v50;
  char *v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  id v60;
  NSObject *v61;
  int v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  id v68;
  void *v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  NSObject *v73;
  uint64_t v74;
  NSObject *v75;
  uint64_t v76;
  char *v77;
  id v78;
  uint64_t v79;
  id v80;
  uint64_t *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  id v86;

  v4 = sub_2444DBBE4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2444DBAF4();
  v9 = *(uint64_t **)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95878]), sel_init);
  if (!v12)
    goto LABEL_26;
  v13 = v12;
  v83 = v11;
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95890]), sel_init);
  if (!v14)
  {

LABEL_26:
    if (qword_257366BE0 != -1)
LABEL_51:
      swift_once();
    __swift_project_value_buffer(v4, (uint64_t)qword_257367688);
    v37 = sub_2444DBBD8();
    v38 = sub_2444DBCD4();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v39 = 0;
      _os_log_impl(&dword_2444CA000, v37, v38, "PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary init failed!", v39, 2u);
      MEMORY[0x24951043C](v39, -1, -1);
    }

    return 0;
  }
  v15 = v14;
  v81 = v9;
  v82 = v8;
  v86 = v14;
  v16 = objc_allocWithZone(MEMORY[0x24BE95880]);
  v17 = v15;
  v18 = objc_msgSend(v16, sel_init);
  if (!v18)
  {

    if (qword_257366BE0 != -1)
      goto LABEL_53;
    goto LABEL_33;
  }
  v77 = v7;
  v78 = v18;
  v76 = v5;
  v79 = v4;
  v80 = v13;
  v19 = sub_2444D7508(0x6552746E65696C63, 0xEF64497473657571, a1);
  objc_msgSend(v17, sel_setClientRequestId_, v19);

  v20 = sub_2444D7508(0x6E6576456E616C70, 0xEB00000000644974, a1);
  objc_msgSend(v17, sel_setPlanId_, v20);

  v21 = a2 + 64;
  v22 = 1 << *(_BYTE *)(a2 + 32);
  v23 = -1;
  if (v22 < 64)
    v23 = ~(-1 << v22);
  v4 = v23 & *(_QWORD *)(a2 + 64);
  v24 = (unint64_t)(v22 + 63) >> 6;
  swift_bridgeObjectRetain();
  v25 = 0;
  v13 = (void *)0x24BE95000;
  if (!v4)
    goto LABEL_8;
LABEL_7:
  v26 = __clz(__rbit64(v4));
  v4 &= v4 - 1;
  for (i = v26 | (v25 << 6); ; i = __clz(__rbit64(v29)) + (v25 << 6))
  {
    v31 = 8 * i;
    v17 = *(id *)(*(_QWORD *)(a2 + 48) + v31);
    v32 = *(double *)(*(_QWORD *)(a2 + 56) + v31);
    v33 = objc_allocWithZone(MEMORY[0x24BE958A8]);
    swift_retain();
    v34 = objc_msgSend(v33, sel_init);
    if (!v34)
    {
      if (qword_257366BE0 != -1)
        swift_once();
      __swift_project_value_buffer(v79, (uint64_t)qword_257367688);
      v45 = sub_2444DBBD8();
      v46 = sub_2444DBCD4();
      v47 = os_log_type_enabled(v45, v46);
      v48 = v80;
      v49 = v78;
      if (v47)
      {
        v50 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v50 = 0;
        _os_log_impl(&dword_2444CA000, v45, v46, "IEPlannerComponentEventDictionary PNRODSchemaPNRODMetricDuration init failed!", v50, 2u);
        MEMORY[0x24951043C](v50, -1, -1);
      }
      swift_release();

      swift_release();
      return 0;
    }
    v35 = v34;
    objc_msgSend(v34, sel_setMetricValue_, v32);
    v85 = (uint64_t)v35;
    v36 = v35;
    swift_setAtWritableKeyPath();

    swift_release();
    if (v4)
      goto LABEL_7;
LABEL_8:
    v28 = v25 + 1;
    if (__OFADD__(v25, 1))
    {
      __break(1u);
      goto LABEL_51;
    }
    if (v28 >= v24)
    {
LABEL_41:
      swift_release();
      v51 = v83;
      sub_2444DBAE8();
      v52 = objc_allocWithZone(MEMORY[0x24BE95C78]);
      v53 = (void *)sub_2444DBADC();
      v54 = objc_msgSend(v52, sel_initWithNSUUID_, v53);

      ((void (*)(char *, uint64_t))v81[1])(v51, v82);
      v55 = v78;
      objc_msgSend(v78, sel_setPnrodId_, v54);

      v40 = v80;
      objc_msgSend(v80, sel_setEventMetadata_, v55);
      objc_msgSend(v40, sel_setPnrodPNRODIntelligenceFlowPlannerComponentSummary_, v86);
      if (qword_257366BE0 != -1)
        swift_once();
      v56 = v79;
      v57 = __swift_project_value_buffer(v79, (uint64_t)qword_257367688);
      v59 = v76;
      v58 = v77;
      (*(void (**)(char *, uint64_t, uint64_t))(v76 + 16))(v77, v57, v56);
      v60 = v40;
      v61 = sub_2444DBBD8();
      v62 = sub_2444DBCD4();
      if (os_log_type_enabled(v61, (os_log_type_t)v62))
      {
        LODWORD(v83) = v62;
        v75 = v61;
        v63 = swift_slowAlloc();
        v82 = swift_slowAlloc();
        v85 = v82;
        *(_DWORD *)v63 = 136315394;
        v64 = objc_msgSend(v60, sel_qualifiedMessageName);
        v65 = sub_2444DBC2C();
        v67 = v66;

        v84 = sub_2444D1180(v65, v67, &v85);
        v81 = &v85;
        sub_2444DBD04();

        swift_bridgeObjectRelease();
        *(_WORD *)(v63 + 12) = 2080;
        v68 = objc_msgSend(v60, sel_formattedJsonBody);
        if (v68)
        {
          v69 = v68;
          v70 = sub_2444DBC2C();
          v72 = v71;

        }
        else
        {
          v72 = 0xE500000000000000;
          v70 = 0x3E4C494E3CLL;
        }
        v73 = v75;
        v84 = sub_2444D1180(v70, v72, &v85);
        sub_2444DBD04();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2444CA000, v73, (os_log_type_t)v83, "Creating PnROD pnrodPNRODIntelligenceFlowPlannerComponentSummary at planner grain %s: %s", (uint8_t *)v63, 0x16u);
        v74 = v82;
        swift_arrayDestroy();
        MEMORY[0x24951043C](v74, -1, -1);
        MEMORY[0x24951043C](v63, -1, -1);

        (*(void (**)(char *, uint64_t))(v59 + 8))(v77, v56);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v59 + 8))(v58, v56);
      }

      return v40;
    }
    v29 = *(_QWORD *)(v21 + 8 * v28);
    ++v25;
    if (!v29)
    {
      v25 = v28 + 1;
      if (v28 + 1 >= v24)
        goto LABEL_41;
      v29 = *(_QWORD *)(v21 + 8 * v25);
      if (!v29)
      {
        v25 = v28 + 2;
        if (v28 + 2 >= v24)
          goto LABEL_41;
        v29 = *(_QWORD *)(v21 + 8 * v25);
        if (!v29)
          break;
      }
    }
LABEL_21:
    v4 = (v29 - 1) & v29;
  }
  v30 = v28 + 3;
  if (v30 >= v24)
    goto LABEL_41;
  v29 = *(_QWORD *)(v21 + 8 * v30);
  if (v29)
  {
    v25 = v30;
    goto LABEL_21;
  }
  while (1)
  {
    v25 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v25 >= v24)
      goto LABEL_41;
    v29 = *(_QWORD *)(v21 + 8 * v25);
    ++v30;
    if (v29)
      goto LABEL_21;
  }
  __break(1u);
LABEL_53:
  swift_once();
LABEL_33:
  __swift_project_value_buffer(v4, (uint64_t)qword_257367688);
  v42 = sub_2444DBBD8();
  v43 = sub_2444DBCD4();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v44 = 0;
    _os_log_impl(&dword_2444CA000, v42, v43, "PNRODSchemaPNRODClientEventMetadata init failed!", v44, 2u);
    MEMORY[0x24951043C](v44, -1, -1);
  }

  return 0;
}

uint64_t sub_2444D7F74()
{
  uint64_t v0;
  uint64_t inited;
  unint64_t v2;
  char v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  __int128 v27;
  __int128 v28;

  v0 = sub_2444DBB48();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257367240);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2444DCDE0;
  *(_QWORD *)(inited + 32) = swift_getKeyPath();
  if (*(_QWORD *)(v0 + 16)
    && (v2 = sub_2444D9C04(0xD000000000000013, 0x80000002444DD180), (v3 & 1) != 0)
    && (sub_2444D1908(*(_QWORD *)(v0 + 56) + 32 * v2, (uint64_t)&v27), swift_dynamicCast()))
  {
    v4 = v26;
  }
  else
  {
    v4 = 0;
  }
  *(_QWORD *)(inited + 40) = v4;
  *(_QWORD *)(inited + 48) = swift_getKeyPath();
  if (*(_QWORD *)(v0 + 16)
    && (v5 = sub_2444D9C04(0xD000000000000016, 0x80000002444DD1C0), (v6 & 1) != 0)
    && (sub_2444D1908(*(_QWORD *)(v0 + 56) + 32 * v5, (uint64_t)&v27), swift_dynamicCast()))
  {
    v7 = v26;
  }
  else
  {
    v7 = 0;
  }
  *(_QWORD *)(inited + 56) = v7;
  *(_QWORD *)(inited + 64) = swift_getKeyPath();
  if (*(_QWORD *)(v0 + 16)
    && (v8 = sub_2444D9C04(0xD000000000000023, 0x80000002444DD200), (v9 & 1) != 0)
    && (sub_2444D1908(*(_QWORD *)(v0 + 56) + 32 * v8, (uint64_t)&v27), swift_dynamicCast()))
  {
    v10 = v26;
  }
  else
  {
    v10 = 0;
  }
  *(_QWORD *)(inited + 72) = v10;
  *(_QWORD *)(inited + 80) = swift_getKeyPath();
  if (*(_QWORD *)(v0 + 16)
    && (v11 = sub_2444D9C04(0xD000000000000029, 0x80000002444DD250), (v12 & 1) != 0)
    && (sub_2444D1908(*(_QWORD *)(v0 + 56) + 32 * v11, (uint64_t)&v27), swift_dynamicCast()))
  {
    v13 = v26;
  }
  else
  {
    v13 = 0;
  }
  *(_QWORD *)(inited + 88) = v13;
  *(_QWORD *)(inited + 96) = swift_getKeyPath();
  if (*(_QWORD *)(v0 + 16)
    && (v14 = sub_2444D9C04(0xD00000000000001BLL, 0x80000002444DD2B0), (v15 & 1) != 0)
    && (sub_2444D1908(*(_QWORD *)(v0 + 56) + 32 * v14, (uint64_t)&v27), swift_dynamicCast()))
  {
    v16 = v26;
  }
  else
  {
    v16 = 0;
  }
  *(_QWORD *)(inited + 104) = v16;
  *(_QWORD *)(inited + 112) = swift_getKeyPath();
  if (*(_QWORD *)(v0 + 16)
    && (v17 = sub_2444D9C04(0xD00000000000001CLL, 0x80000002444DD300), (v18 & 1) != 0)
    && (sub_2444D1908(*(_QWORD *)(v0 + 56) + 32 * v17, (uint64_t)&v27), swift_dynamicCast()))
  {
    v19 = v26;
  }
  else
  {
    v19 = 0;
  }
  *(_QWORD *)(inited + 120) = v19;
  *(_QWORD *)(inited + 128) = swift_getKeyPath();
  if (*(_QWORD *)(v0 + 16) && (v20 = sub_2444D9C04(0xD000000000000019, 0x80000002444DD350), (v21 & 1) != 0))
  {
    sub_2444D1908(*(_QWORD *)(v0 + 56) + 32 * v20, (uint64_t)&v27);
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v28 + 1))
  {
    sub_2444D9C90((uint64_t)&v27, &qword_257366CB0);
    goto LABEL_39;
  }
  if (!swift_dynamicCast())
  {
LABEL_39:
    v22 = 0;
    goto LABEL_40;
  }
  v22 = v26;
LABEL_40:
  *(_QWORD *)(inited + 136) = v22;
  v23 = sub_2444D83A4(inited, &qword_257367258, &qword_257367260);
  v24 = sub_2444D84B0(v23, &qword_257367248, &qword_257367250);
  swift_bridgeObjectRelease();
  return v24;
}

unint64_t sub_2444D83A4(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t result;
  char v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  if (!*(_QWORD *)(a1 + 16))
  {
    v5 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = (_QWORD *)sub_2444DBD70();
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v5;
  }
  swift_retain();
  v7 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v8 = *(v7 - 1);
    v9 = *v7;
    v10 = swift_retain();
    result = sub_2444D9E34(v10, a3);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = 8 * result;
    *(_QWORD *)(v5[6] + v13) = v8;
    *(_QWORD *)(v5[7] + v13) = v9;
    v14 = v5[2];
    v15 = __OFADD__(v14, 1);
    v16 = v14 + 1;
    if (v15)
      goto LABEL_11;
    v5[2] = v16;
    v7 += 2;
    if (!--v6)
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

uint64_t sub_2444D84B0(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  int64_t v19;
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
  uint64_t v30;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(a2);
    v5 = sub_2444DBD70();
  }
  else
  {
    v5 = MEMORY[0x24BEE4B00];
  }
  v30 = a1 + 64;
  v6 = -1 << *(_BYTE *)(a1 + 32);
  if (-v6 < 64)
    v7 = ~(-1 << -(char)v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(a1 + 64);
  v29 = (unint64_t)(63 - v6) >> 6;
  v9 = v5 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_28;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v16 >= v29)
      goto LABEL_37;
    v17 = *(_QWORD *)(v30 + 8 * v16);
    v18 = v11 + 1;
    if (!v17)
    {
      v18 = v11 + 2;
      if (v11 + 2 >= v29)
        goto LABEL_37;
      v17 = *(_QWORD *)(v30 + 8 * v18);
      if (!v17)
      {
        v18 = v11 + 3;
        if (v11 + 3 >= v29)
          goto LABEL_37;
        v17 = *(_QWORD *)(v30 + 8 * v18);
        if (!v17)
        {
          v18 = v11 + 4;
          if (v11 + 4 >= v29)
            goto LABEL_37;
          v17 = *(_QWORD *)(v30 + 8 * v18);
          if (!v17)
            break;
        }
      }
    }
LABEL_27:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v18 << 6);
    v11 = v18;
LABEL_28:
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v15);
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v15);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(a3);
    result = sub_2444DBBFC();
    v22 = -1 << *(_BYTE *)(v5 + 32);
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
    v13 = 8 * v12;
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v13) = v20;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v13) = v21;
    ++*(_QWORD *)(v5 + 16);
  }
  v19 = v11 + 5;
  if (v11 + 5 >= v29)
  {
LABEL_37:
    swift_release();
    sub_2444D9E2C();
    return v5;
  }
  v17 = *(_QWORD *)(v30 + 8 * v19);
  if (v17)
  {
    v18 = v11 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v18 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v18 >= v29)
      goto LABEL_37;
    v17 = *(_QWORD *)(v30 + 8 * v18);
    ++v19;
    if (v17)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_2444D87B8()
{
  uint64_t v0;
  uint64_t inited;
  unint64_t v2;
  char v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;

  v0 = sub_2444DBB48();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257367218);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2444DCDF0;
  *(_QWORD *)(inited + 32) = swift_getKeyPath();
  if (*(_QWORD *)(v0 + 16)
    && (v2 = sub_2444D9C04(0xD000000000000020, 0x80000002444DDE90), (v3 & 1) != 0)
    && (sub_2444D1908(*(_QWORD *)(v0 + 56) + 32 * v2, (uint64_t)&v24), swift_dynamicCast()))
  {
    v4 = v23;
  }
  else
  {
    v4 = 0;
  }
  *(_QWORD *)(inited + 40) = v4;
  *(_QWORD *)(inited + 48) = swift_getKeyPath();
  if (*(_QWORD *)(v0 + 16)
    && (v5 = sub_2444D9C04(0xD000000000000025, 0x80000002444DDEC0), (v6 & 1) != 0)
    && (sub_2444D1908(*(_QWORD *)(v0 + 56) + 32 * v5, (uint64_t)&v24), swift_dynamicCast()))
  {
    v7 = v23;
  }
  else
  {
    v7 = 0;
  }
  *(_QWORD *)(inited + 56) = v7;
  *(_QWORD *)(inited + 64) = swift_getKeyPath();
  if (*(_QWORD *)(v0 + 16)
    && (v8 = sub_2444D9C04(0xD000000000000022, 0x80000002444DDEF0), (v9 & 1) != 0)
    && (sub_2444D1908(*(_QWORD *)(v0 + 56) + 32 * v8, (uint64_t)&v24), swift_dynamicCast()))
  {
    v10 = v23;
  }
  else
  {
    v10 = 0;
  }
  *(_QWORD *)(inited + 72) = v10;
  *(_QWORD *)(inited + 80) = swift_getKeyPath();
  if (*(_QWORD *)(v0 + 16)
    && (v11 = sub_2444D9C04(0xD000000000000028, 0x80000002444DDF20), (v12 & 1) != 0)
    && (sub_2444D1908(*(_QWORD *)(v0 + 56) + 32 * v11, (uint64_t)&v24), swift_dynamicCast()))
  {
    v13 = v23;
  }
  else
  {
    v13 = 0;
  }
  *(_QWORD *)(inited + 88) = v13;
  *(_QWORD *)(inited + 96) = swift_getKeyPath();
  if (*(_QWORD *)(v0 + 16)
    && (v14 = sub_2444D9C04(0xD000000000000023, 0x80000002444DDF50), (v15 & 1) != 0)
    && (sub_2444D1908(*(_QWORD *)(v0 + 56) + 32 * v14, (uint64_t)&v24), swift_dynamicCast()))
  {
    v16 = v23;
  }
  else
  {
    v16 = 0;
  }
  *(_QWORD *)(inited + 104) = v16;
  *(_QWORD *)(inited + 112) = swift_getKeyPath();
  if (*(_QWORD *)(v0 + 16) && (v17 = sub_2444D9C04(0xD000000000000021, 0x80000002444DDF80), (v18 & 1) != 0))
  {
    sub_2444D1908(*(_QWORD *)(v0 + 56) + 32 * v17, (uint64_t)&v24);
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v25 + 1))
  {
    sub_2444D9C90((uint64_t)&v24, &qword_257366CB0);
    goto LABEL_34;
  }
  if (!swift_dynamicCast())
  {
LABEL_34:
    v19 = 0;
    goto LABEL_35;
  }
  v19 = v23;
LABEL_35:
  *(_QWORD *)(inited + 120) = v19;
  v20 = sub_2444D83A4(inited, &qword_257367230, &qword_257367238);
  v21 = sub_2444D84B0(v20, &qword_257367220, &qword_257367228);
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t PlannerGrainLatency.createIESELFEvents()()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v11;

  if (qword_257366BE0 != -1)
    swift_once();
  v0 = sub_2444DBBE4();
  __swift_project_value_buffer(v0, (uint64_t)qword_257367688);
  v1 = sub_2444DBBD8();
  v2 = sub_2444DBCD4();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2444CA000, v1, v2, "Creating createIESELFEvents for PlannerGrainLatency", v3, 2u);
    MEMORY[0x24951043C](v3, -1, -1);
  }

  v4 = sub_2444DBB48();
  v5 = sub_2444D7F74();
  v6 = sub_2444D6808(v4, v5);
  swift_bridgeObjectRelease();
  v7 = sub_2444D87B8();
  v8 = sub_2444D76FC(v4, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573671E8);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_2444DCE00;
  *(_QWORD *)(v9 + 32) = v6;
  *(_QWORD *)(v9 + 40) = v8;
  v11 = v9;
  sub_2444DBC8C();
  return v11;
}

uint64_t sub_2444D8CD8()
{
  uint64_t v0;
  uint64_t inited;
  unint64_t v2;
  char v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;
  __int128 v18;
  __int128 v19;

  v0 = sub_2444DBB54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573671F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2444DCE10;
  *(_QWORD *)(inited + 32) = swift_getKeyPath();
  if (*(_QWORD *)(v0 + 16)
    && (v2 = sub_2444D9C04(0x676E696E6E616C70, 0xEC000000656D6954), (v3 & 1) != 0)
    && (sub_2444D1908(*(_QWORD *)(v0 + 56) + 32 * v2, (uint64_t)&v18), swift_dynamicCast()))
  {
    v4 = v17;
  }
  else
  {
    v4 = 0;
  }
  *(_QWORD *)(inited + 40) = v4;
  *(_QWORD *)(inited + 48) = swift_getKeyPath();
  if (*(_QWORD *)(v0 + 16)
    && (v5 = sub_2444D9C04(0x6F69747563657865, 0xED0000656D69546ELL), (v6 & 1) != 0)
    && (sub_2444D1908(*(_QWORD *)(v0 + 56) + 32 * v5, (uint64_t)&v18), swift_dynamicCast()))
  {
    v7 = v17;
  }
  else
  {
    v7 = 0;
  }
  *(_QWORD *)(inited + 56) = v7;
  *(_QWORD *)(inited + 64) = swift_getKeyPath();
  if (*(_QWORD *)(v0 + 16)
    && (v8 = sub_2444D9C04(0xD000000000000013, 0x80000002444DCF20), (v9 & 1) != 0)
    && (sub_2444D1908(*(_QWORD *)(v0 + 56) + 32 * v8, (uint64_t)&v18), swift_dynamicCast()))
  {
    v10 = v17;
  }
  else
  {
    v10 = 0;
  }
  *(_QWORD *)(inited + 72) = v10;
  *(_QWORD *)(inited + 80) = swift_getKeyPath();
  if (*(_QWORD *)(v0 + 16) && (v11 = sub_2444D9C04(0xD000000000000017, 0x80000002444DCF60), (v12 & 1) != 0))
  {
    sub_2444D1908(*(_QWORD *)(v0 + 56) + 32 * v11, (uint64_t)&v18);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v19 + 1))
  {
    sub_2444D9C90((uint64_t)&v18, &qword_257366CB0);
    goto LABEL_24;
  }
  if (!swift_dynamicCast())
  {
LABEL_24:
    v13 = 0;
    goto LABEL_25;
  }
  v13 = v17;
LABEL_25:
  *(_QWORD *)(inited + 88) = v13;
  v14 = sub_2444D83A4(inited, &qword_257367208, &qword_257367210);
  v15 = sub_2444D84B0(v14, &qword_2573671F8, &qword_257367200);
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t RequestGrainLatency.createIESELFEvents()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t result;
  unint64_t v24;
  char v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t i;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  NSObject *v55;
  os_log_type_t v56;
  _BOOL4 v57;
  id v58;
  id v59;
  uint8_t *v60;
  id v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  char *v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  id v78;
  NSObject *v79;
  int v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  id v86;
  void *v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  os_log_type_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  id v99;
  char *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105[4];
  id v106;

  v0 = sub_2444DBBE4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v94 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2444DBAF4();
  v102 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v101 = (char *)&v94 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2444DBB54();
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95878]), sel_init);
  if (!v7)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    if (qword_257366BE0 != -1)
LABEL_86:
      swift_once();
    __swift_project_value_buffer(v0, (uint64_t)qword_257367688);
    v19 = sub_2444DBBD8();
    v20 = sub_2444DBCD4();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_2444CA000, v19, v20, "PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary init failed!", v21, 2u);
      MEMORY[0x24951043C](v21, -1, -1);
    }

    return MEMORY[0x24BEE4AF8];
  }
  v8 = v7;
  v103 = v6;
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE958A0]), sel_init);
  if (!v9)
  {
    swift_bridgeObjectRelease();

    goto LABEL_12;
  }
  v10 = v9;
  v98 = v4;
  v100 = v3;
  v106 = v9;
  v11 = objc_allocWithZone(MEMORY[0x24BE95880]);
  v12 = v10;
  v13 = objc_msgSend(v11, sel_init);
  if (!v13)
  {

    swift_bridgeObjectRelease();
    if (qword_257366BE0 != -1)
      goto LABEL_88;
    goto LABEL_68;
  }
  v14 = v13;
  v15 = v103;
  if (*(_QWORD *)(v103 + 16)
    && (v16 = sub_2444D9C04(0xD000000000000011, 0x80000002444DDDB0), v15 = v103, (v17 & 1) != 0)
    && (sub_2444D1908(*(_QWORD *)(v103 + 56) + 32 * v16, (uint64_t)v105), (swift_dynamicCast() & 1) != 0))
  {
    v18 = v104;
    if ((v104 & 0x8000000000000000) != 0 || HIDWORD(v104))
    {
LABEL_89:
      result = sub_2444DBD58();
      __break(1u);
      return result;
    }
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v12, sel_setNumQueriesCreated_, v18);
  if (*(_QWORD *)(v15 + 16)
    && (v24 = sub_2444D9C04(0x436E616C506D756ELL, 0xEE00646574616572), v15 = v103, (v25 & 1) != 0))
  {
    sub_2444D1908(*(_QWORD *)(v103 + 56) + 32 * v24, (uint64_t)v105);
    if (swift_dynamicCast())
      v26 = v104;
    else
      v26 = 0;
    if ((v26 & 0x8000000000000000) != 0 || HIDWORD(v26))
      goto LABEL_89;
  }
  else
  {
    v26 = 0;
  }
  objc_msgSend(v12, sel_setNumPlansCreated_, v26);
  if (*(_QWORD *)(v15 + 16)
    && (v27 = sub_2444D9C04(0xD000000000000010, 0x80000002444DDE50), v15 = v103, (v28 & 1) != 0))
  {
    sub_2444D1908(*(_QWORD *)(v103 + 56) + 32 * v27, (uint64_t)v105);
    if (swift_dynamicCast())
      v29 = v104;
    else
      v29 = 0;
    if ((v29 & 0x8000000000000000) != 0 || HIDWORD(v29))
      goto LABEL_89;
  }
  else
  {
    v29 = 0;
  }
  objc_msgSend(v12, sel_setNumActionsCreated_, v29);
  v30 = *(_QWORD *)(v15 + 16);
  v96 = v0;
  v97 = v8;
  v99 = v14;
  v95 = v1;
  if (v30 && (v31 = sub_2444D9C04(0xD000000000000019, 0x80000002444DDE70), (v32 & 1) != 0))
  {
    sub_2444D1908(*(_QWORD *)(v103 + 56) + 32 * v31, (uint64_t)v105);
    if (swift_dynamicCast())
      v33 = v104;
    else
      v33 = 0;
    if ((v33 & 0x8000000000000000) != 0 || HIDWORD(v33))
      goto LABEL_89;
  }
  else
  {
    v33 = 0;
  }
  objc_msgSend(v12, sel_setNumPlansCreatedForResponse_, v33);

  v34 = sub_2444D8CD8();
  v35 = v34;
  v36 = 0;
  v37 = v34 + 64;
  v38 = 1 << *(_BYTE *)(v34 + 32);
  v39 = -1;
  if (v38 < 64)
    v39 = ~(-1 << v38);
  v40 = v39 & *(_QWORD *)(v34 + 64);
  v0 = (unint64_t)(v38 + 63) >> 6;
  v8 = (void *)0x24BE95000;
  if (!v40)
    goto LABEL_50;
LABEL_49:
  v41 = __clz(__rbit64(v40));
  v40 &= v40 - 1;
  for (i = v41 | (v36 << 6); ; i = __clz(__rbit64(v44)) + (v36 << 6))
  {
    v46 = 8 * i;
    v12 = *(id *)(*(_QWORD *)(v35 + 48) + v46);
    v47 = *(double *)(*(_QWORD *)(v35 + 56) + v46);
    v48 = objc_allocWithZone(MEMORY[0x24BE958A8]);
    swift_retain();
    v49 = objc_msgSend(v48, sel_init);
    if (!v49)
    {
      swift_bridgeObjectRelease();
      if (qword_257366BE0 != -1)
        swift_once();
      __swift_project_value_buffer(v96, (uint64_t)qword_257367688);
      v55 = sub_2444DBBD8();
      v56 = sub_2444DBCD4();
      v57 = os_log_type_enabled(v55, v56);
      v58 = v97;
      v59 = v99;
      if (v57)
      {
        v60 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v60 = 0;
        _os_log_impl(&dword_2444CA000, v55, v56, "PNROnDeviceProvisionalPNRIntervalDurationMetric init failed!", v60, 2u);
        MEMORY[0x24951043C](v60, -1, -1);
      }

      swift_release();
      swift_release();

      return MEMORY[0x24BEE4AF8];
    }
    v50 = v49;
    objc_msgSend(v49, sel_setMetricValue_, v47);
    v105[0] = (uint64_t)v50;
    v51 = v50;
    swift_setAtWritableKeyPath();

    swift_release();
    if (v40)
      goto LABEL_49;
LABEL_50:
    v43 = v36 + 1;
    if (__OFADD__(v36, 1))
    {
      __break(1u);
      goto LABEL_86;
    }
    if (v43 >= v0)
    {
LABEL_76:
      swift_release();
      v61 = v106;
      v62 = v103;
      v63 = sub_2444D7508(0x6552746E65696C63, 0xEF64497473657571, v103);
      objc_msgSend(v61, sel_setClientRequestId_, v63);

      v64 = v61;
      v65 = sub_2444D7508(0x6973736553776172, 0xEC00000064496E6FLL, v62);
      objc_msgSend(v64, sel_setRawSessionId_, v65);

      v66 = v64;
      v67 = sub_2444D7508(0x496E6F6973736573, 0xE900000000000064, v62);
      swift_bridgeObjectRelease();
      objc_msgSend(v66, sel_setClientSessionId_, v67);

      v68 = v101;
      sub_2444DBAE8();
      v69 = objc_allocWithZone(MEMORY[0x24BE95C78]);
      v70 = (void *)sub_2444DBADC();
      v71 = objc_msgSend(v69, sel_initWithNSUUID_, v70);

      (*(void (**)(char *, uint64_t))(v102 + 8))(v68, v98);
      v72 = v99;
      objc_msgSend(v99, sel_setPnrodId_, v71);

      v73 = v97;
      objc_msgSend(v97, sel_setEventMetadata_, v72);
      objc_msgSend(v73, sel_setPnrodIntelligenceFlowRequestGrainSummary_, v106);
      if (qword_257366BE0 != -1)
        swift_once();
      v74 = v96;
      v75 = __swift_project_value_buffer(v96, (uint64_t)qword_257367688);
      v76 = v95;
      v77 = v100;
      (*(void (**)(char *, uint64_t, uint64_t))(v95 + 16))(v100, v75, v74);
      v78 = v73;
      v79 = sub_2444DBBD8();
      v80 = sub_2444DBCD4();
      if (os_log_type_enabled(v79, (os_log_type_t)v80))
      {
        LODWORD(v103) = v80;
        v81 = swift_slowAlloc();
        v102 = swift_slowAlloc();
        v105[0] = v102;
        *(_DWORD *)v81 = 136315394;
        v82 = objc_msgSend(v78, sel_qualifiedMessageName);
        v83 = sub_2444DBC2C();
        v85 = v84;

        v104 = sub_2444D1180(v83, v85, v105);
        sub_2444DBD04();

        swift_bridgeObjectRelease();
        *(_WORD *)(v81 + 12) = 2080;
        v86 = objc_msgSend(v78, sel_formattedJsonBody);
        if (v86)
        {
          v87 = v86;
          v88 = sub_2444DBC2C();
          v90 = v89;

        }
        else
        {
          v90 = 0xE500000000000000;
          v88 = 0x3E4C494E3CLL;
        }
        v91 = v103;
        v104 = sub_2444D1180(v88, v90, v105);
        sub_2444DBD04();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2444CA000, v79, v91, "Creating PnROD transcript events at request grain %s: %s", (uint8_t *)v81, 0x16u);
        v92 = v102;
        swift_arrayDestroy();
        MEMORY[0x24951043C](v92, -1, -1);
        MEMORY[0x24951043C](v81, -1, -1);

        (*(void (**)(char *, uint64_t))(v95 + 8))(v100, v74);
        v72 = v99;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v76 + 8))(v77, v74);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573671E8);
      v93 = swift_allocObject();
      *(_OWORD *)(v93 + 16) = xmmword_2444DCE20;
      *(_QWORD *)(v93 + 32) = v73;
      v105[0] = v93;
      sub_2444DBC8C();
      v22 = v105[0];

      return v22;
    }
    v44 = *(_QWORD *)(v37 + 8 * v43);
    ++v36;
    if (!v44)
    {
      v36 = v43 + 1;
      if (v43 + 1 >= v0)
        goto LABEL_76;
      v44 = *(_QWORD *)(v37 + 8 * v36);
      if (!v44)
      {
        v36 = v43 + 2;
        if (v43 + 2 >= v0)
          goto LABEL_76;
        v44 = *(_QWORD *)(v37 + 8 * v36);
        if (!v44)
          break;
      }
    }
LABEL_63:
    v40 = (v44 - 1) & v44;
  }
  v45 = v43 + 3;
  if (v45 >= v0)
    goto LABEL_76;
  v44 = *(_QWORD *)(v37 + 8 * v45);
  if (v44)
  {
    v36 = v45;
    goto LABEL_63;
  }
  while (1)
  {
    v36 = v45 + 1;
    if (__OFADD__(v45, 1))
      break;
    if (v36 >= v0)
      goto LABEL_76;
    v44 = *(_QWORD *)(v37 + 8 * v36);
    ++v45;
    if (v44)
      goto LABEL_63;
  }
  __break(1u);
LABEL_88:
  swift_once();
LABEL_68:
  __swift_project_value_buffer(v0, (uint64_t)qword_257367688);
  v52 = sub_2444DBBD8();
  v53 = sub_2444DBCD4();
  if (os_log_type_enabled(v52, v53))
  {
    v54 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v54 = 0;
    _os_log_impl(&dword_2444CA000, v52, v53, "PNRODSchemaPNRODClientEventMetadata init failed!", v54, 2u);
    MEMORY[0x24951043C](v54, -1, -1);
  }

  return MEMORY[0x24BEE4AF8];
}

unint64_t sub_2444D9C04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2444DBDE8();
  sub_2444DBC44();
  v4 = sub_2444DBE00();
  return sub_2444D9EB0(a1, a2, v4);
}

ValueMetadata *type metadata accessor for IELatencyConstantValue()
{
  return &type metadata for IELatencyConstantValue;
}

ValueMetadata *type metadata accessor for IEIntDimensionConstantValue()
{
  return &type metadata for IEIntDimensionConstantValue;
}

uint64_t dispatch thunk of IELatencySELFEventPnROnDevice.createIESELFEvents()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_2444D9C90(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *keypath_get_selector_planningTime()
{
  return sel_planningTime;
}

id sub_2444D9CD8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_planningTime);
  *a2 = result;
  return result;
}

id sub_2444D9D10(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPlanningTime_, *a1);
}

char *keypath_get_selector_executionTime()
{
  return sel_executionTime;
}

id sub_2444D9D30@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_executionTime);
  *a2 = result;
  return result;
}

id sub_2444D9D68(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setExecutionTime_, *a1);
}

char *keypath_get_selector_requestResponseTime()
{
  return sel_requestResponseTime;
}

id sub_2444D9D88@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_requestResponseTime);
  *a2 = result;
  return result;
}

id sub_2444D9DC0(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRequestResponseTime_, *a1);
}

char *keypath_get_selector_responsePreparationTime()
{
  return sel_responsePreparationTime;
}

id sub_2444D9DE0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_responsePreparationTime);
  *a2 = result;
  return result;
}

id sub_2444D9E18(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setResponsePreparationTime_, *a1);
}

uint64_t sub_2444D9E2C()
{
  return swift_release();
}

unint64_t sub_2444D9E34(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(a2);
  v4 = sub_2444DBBFC();
  return sub_2444D9F90(a1, v4, a2);
}

unint64_t sub_2444D9EB0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2444DBDA0() & 1) == 0)
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
      while (!v14 && (sub_2444DBDA0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2444D9F90(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v4 = -1 << *(_BYTE *)(v3 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v3 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = ~v4;
    __swift_instantiateConcreteTypeFromMangledName(a3);
    do
    {
      if ((sub_2444DBC14() & 1) != 0)
        break;
      v5 = (v5 + 1) & v6;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

char *keypath_get_selector_standardPlannerMakePlanTime()
{
  return sel_standardPlannerMakePlanTime;
}

id sub_2444DA064@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_standardPlannerMakePlanTime);
  *a2 = result;
  return result;
}

id sub_2444DA09C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStandardPlannerMakePlanTime_, *a1);
}

char *keypath_get_selector_standardPlannerQueryDecorationTime()
{
  return sel_standardPlannerQueryDecorationTime;
}

id sub_2444DA0BC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_standardPlannerQueryDecorationTime);
  *a2 = result;
  return result;
}

id sub_2444DA0F4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStandardPlannerQueryDecorationTime_, *a1);
}

char *keypath_get_selector_planResolverServiceHandleTime()
{
  return sel_planResolverServiceHandleTime;
}

id sub_2444DA114@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_planResolverServiceHandleTime);
  *a2 = result;
  return result;
}

id sub_2444DA14C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPlanResolverServiceHandleTime_, *a1);
}

char *keypath_get_selector_responseGenerationServiceHandleTime()
{
  return sel_responseGenerationServiceHandleTime;
}

id sub_2444DA16C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_responseGenerationServiceHandleTime);
  *a2 = result;
  return result;
}

id sub_2444DA1A4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setResponseGenerationServiceHandleTime_, *a1);
}

char *keypath_get_selector_planOverridesServiceHandleTime()
{
  return sel_planOverridesServiceHandleTime;
}

id sub_2444DA1C4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_planOverridesServiceHandleTime);
  *a2 = result;
  return result;
}

id sub_2444DA1FC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPlanOverridesServiceHandleTime_, *a1);
}

char *keypath_get_selector_fullPlannerServiceHandleTime()
{
  return sel_fullPlannerServiceHandleTime;
}

id sub_2444DA21C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_fullPlannerServiceHandleTime);
  *a2 = result;
  return result;
}

id sub_2444DA254(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFullPlannerServiceHandleTime_, *a1);
}

char *keypath_get_selector_plannerResponseTime()
{
  return sel_plannerResponseTime;
}

id sub_2444DA274@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_plannerResponseTime);
  *a2 = result;
  return result;
}

id sub_2444DA2AC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPlannerResponseTime_, *a1);
}

char *keypath_get_selector_startToPlanCreatedTime()
{
  return sel_startToPlanCreatedTime;
}

id sub_2444DA2CC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_startToPlanCreatedTime);
  *a2 = result;
  return result;
}

id sub_2444DA304(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStartToPlanCreatedTime_, *a1);
}

char *keypath_get_selector_startToLastQueryDecorationEventTime()
{
  return sel_startToLastQueryDecorationEventTime;
}

id sub_2444DA324@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_startToLastQueryDecorationEventTime);
  *a2 = result;
  return result;
}

id sub_2444DA35C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStartToLastQueryDecorationEventTime_, *a1);
}

char *keypath_get_selector_lastQueryDecorationEventToPlanCreatedTime()
{
  return sel_lastQueryDecorationEventToPlanCreatedTime;
}

id sub_2444DA37C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_lastQueryDecorationEventToPlanCreatedTime);
  *a2 = result;
  return result;
}

id sub_2444DA3B4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLastQueryDecorationEventToPlanCreatedTime_, *a1);
}

char *keypath_get_selector_startToContextRetrievedTime()
{
  return sel_startToContextRetrievedTime;
}

id sub_2444DA3D4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_startToContextRetrievedTime);
  *a2 = result;
  return result;
}

id sub_2444DA40C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStartToContextRetrievedTime_, *a1);
}

char *keypath_get_selector_startToEntitySpanMatchedTime()
{
  return sel_startToEntitySpanMatchedTime;
}

id sub_2444DA42C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_startToEntitySpanMatchedTime);
  *a2 = result;
  return result;
}

id sub_2444DA464(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStartToEntitySpanMatchedTime_, *a1);
}

char *keypath_get_selector_startToToolsRetrievedTime()
{
  return sel_startToToolsRetrievedTime;
}

id sub_2444DA484@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_startToToolsRetrievedTime);
  *a2 = result;
  return result;
}

id sub_2444DA4BC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStartToToolsRetrievedTime_, *a1);
}

uint64_t sub_2444DA4D0()
{
  uint64_t v0;
  id v1;

  v0 = sub_2444DBBE4();
  __swift_allocate_value_buffer(v0, qword_257367688);
  __swift_project_value_buffer(v0, (uint64_t)qword_257367688);
  if (qword_257366BE8 != -1)
    swift_once();
  v1 = (id)qword_2573676A0;
  return sub_2444DBBF0();
}

uint64_t sub_2444DA550()
{
  uint64_t result;

  sub_2444DA5B4();
  result = sub_2444DBCF8();
  qword_2573676A0 = result;
  return result;
}

unint64_t sub_2444DA5B4()
{
  unint64_t result;

  result = qword_257367268;
  if (!qword_257367268)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257367268);
  }
  return result;
}

uint64_t static SELFComponent.turn.getter()
{
  uint64_t v0;
  id v1;

  swift_beginAccess();
  v0 = qword_257367270;
  v1 = (id)qword_257367270;
  return v0;
}

void static SELFComponent.turn.setter(uint64_t a1)
{
  void *v2;

  swift_beginAccess();
  v2 = (void *)qword_257367270;
  qword_257367270 = a1;

}

uint64_t (*static SELFComponent.turn.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

ValueMetadata *type metadata accessor for SELFComponent()
{
  return &type metadata for SELFComponent;
}

uint64_t PnRLatencyContextMetrics.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = v0[2];
  sub_2444DBD28();
  sub_2444DBC50();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257367278);
  sub_2444DBC38();
  sub_2444DBC50();
  swift_bridgeObjectRelease();
  sub_2444DBC50();
  sub_2444DBC38();
  sub_2444DBC50();
  swift_bridgeObjectRelease();
  sub_2444DBC50();
  if (v1 != 11 && v2 != 11)
    sub_2444DBCBC();
  sub_2444DBC50();
  swift_bridgeObjectRelease();
  sub_2444DBC50();
  return 0;
}

NSObject *PnRSiriTurnGrainSummary.createSiriTurnGrainSummarySELFEvent()()
{
  uint64_t *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  id v28;
  uint8_t *v29;
  uint64_t v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint8_t *v33;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  char *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257366ED8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v2 = (char *)&v46 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2444DBAF4();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v51 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v46 - v7;
  v9 = v0[1];
  v49 = *v0;
  v50 = v9;
  v10 = *((unsigned __int8 *)v0 + 16);
  v11 = v0[3];
  v12 = *((unsigned __int8 *)v0 + 32);
  v13 = v0[5];
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95878]), sel_init);
  if (!v14)
    goto LABEL_8;
  v15 = v14;
  v48 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE958B0]), sel_init);
  if (!v48)
  {

LABEL_8:
    if (qword_257366BE0 != -1)
      swift_once();
    v21 = sub_2444DBBE4();
    __swift_project_value_buffer(v21, (uint64_t)qword_257367688);
    v15 = sub_2444DBBD8();
    v22 = sub_2444DBCD4();
    if (os_log_type_enabled(v15, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_2444CA000, v15, v22, "PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper init failed!", v23, 2u);
      MEMORY[0x24951043C](v23, -1, -1);
    }
    goto LABEL_26;
  }
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95880]), sel_init);
  if (v16)
  {
    v47 = v16;
    v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE958A8]), sel_init);
    if (v17)
    {
      v18 = 0.0;
      if (v10 == 12)
      {
        v19 = v3;
        v20 = v4;
      }
      else
      {
        v20 = v4;
        if (v10 == 11)
        {
          v19 = v3;
        }
        else
        {
          v19 = v3;
          if (v12 != 11)
            v18 = ((double)v13 - (double)v11) / 1000000000.0;
        }
      }
      v35 = v17;
      objc_msgSend(v17, sel_setMetricValue_, v18);
      if (v50)
      {
        sub_2444DBAC4();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v2, 1, v19) != 1)
        {
          (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v8, v2, v19);
          v37 = objc_allocWithZone(MEMORY[0x24BE95C78]);
          v38 = (void *)sub_2444DBADC();
          v39 = objc_msgSend(v37, sel_initWithNSUUID_, v38);

          v36 = v48;
          objc_msgSend(v48, sel_setTurnid_, v39);

          (*(void (**)(char *, uint64_t))(v20 + 8))(v8, v19);
          goto LABEL_34;
        }
        sub_2444D2CD8((uint64_t)v2);
      }
      v36 = v48;
      objc_msgSend(v48, sel_setTurnid_, 0);
LABEL_34:
      v40 = v35;
      objc_msgSend(v36, sel_setSrt_, v35);
      v41 = v51;
      sub_2444DBAE8();
      v42 = objc_allocWithZone(MEMORY[0x24BE95C78]);
      v43 = (void *)sub_2444DBADC();
      v44 = objc_msgSend(v42, sel_initWithNSUUID_, v43);

      (*(void (**)(char *, uint64_t))(v20 + 8))(v41, v19);
      v45 = v47;
      objc_msgSend(v47, sel_setPnrodId_, v44);

      -[NSObject setEventMetadata:](v15, sel_setEventMetadata_, v45);
      -[NSObject setPnrodSiriTurnGrainSummary:](v15, sel_setPnrodSiriTurnGrainSummary_, v36);

      return v15;
    }
    if (qword_257366BE0 != -1)
      swift_once();
    v30 = sub_2444DBBE4();
    __swift_project_value_buffer(v30, (uint64_t)qword_257367688);
    v25 = sub_2444DBBD8();
    v31 = sub_2444DBCD4();
    v32 = os_log_type_enabled(v25, v31);
    v28 = v48;
    if (!v32)
    {

      goto LABEL_26;
    }
    v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_2444CA000, v25, v31, "PNROnDeviceProvisionalPNRIntervalDurationMetric init failed!", v33, 2u);
    MEMORY[0x24951043C](v33, -1, -1);

  }
  else
  {
    if (qword_257366BE0 != -1)
      swift_once();
    v24 = sub_2444DBBE4();
    __swift_project_value_buffer(v24, (uint64_t)qword_257367688);
    v25 = sub_2444DBBD8();
    v26 = sub_2444DBCD4();
    v27 = os_log_type_enabled(v25, v26);
    v28 = v48;
    if (!v27)
    {

      goto LABEL_26;
    }
    v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v29 = 0;
    _os_log_impl(&dword_2444CA000, v25, v26, "PNRODSchemaPNRODClientEventMetadata init failed!", v29, 2u);
    MEMORY[0x24951043C](v29, -1, -1);
  }

LABEL_26:
  return 0;
}

void __swiftcall PnRSiriTurnGrainSummary.createProvisionalSELFEvent()(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper_optional *__return_ptr retstr)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  double v22;
  BOOL v23;
  char v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;

  v2 = *v1;
  v3 = v1[1];
  v4 = *((unsigned __int8 *)v1 + 16);
  v5 = v1[3];
  v6 = *((unsigned __int8 *)v1 + 32);
  v7 = v1[5];
  v8 = v1[7];
  v30 = v1[9];
  v9 = objc_msgSend(objc_allocWithZone((Class)PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper), sel_init);
  if (v9)
  {
    v10 = v9;
    v11 = objc_msgSend(objc_allocWithZone((Class)PNROnDeviceProvisionalPnRSiriRequestGrainSummary), sel_init);
    if (v11)
    {
      v12 = v11;
      v13 = objc_msgSend(objc_allocWithZone((Class)PNROnDeviceProvisionalPNRIntervalDurationMetric), sel_init);
      if (!v13)
      {
        if (qword_257366BE0 == -1)
        {
LABEL_13:
          v18 = sub_2444DBBE4();
          __swift_project_value_buffer(v18, (uint64_t)qword_257367688);
          v19 = sub_2444DBBD8();
          v20 = sub_2444DBCD4();
          if (os_log_type_enabled(v19, v20))
          {
            v21 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v21 = 0;
            _os_log_impl(&dword_2444CA000, v19, v20, "PNROnDeviceProvisionalPNRIntervalDurationMetric init failed!", v21, 2u);
            MEMORY[0x24951043C](v21, -1, -1);

          }
          else
          {

          }
          v14 = v10;
          goto LABEL_49;
        }
LABEL_52:
        swift_once();
        goto LABEL_13;
      }
      v14 = v13;
      if (v4 == 12)
      {
        -[NSObject setMetricValue:](v13, sel_setMetricValue_, 0.0);
        v5 = 0;
      }
      else
      {
        v22 = 0.0;
        if (v4 != 11 && v6 != 11)
          v22 = ((double)v7 - (double)v5) / 1000000000.0;
        -[NSObject setMetricValue:](v13, sel_setMetricValue_, v22);
        if (v4 == 11)
        {
          v5 = 0;
        }
        else if ((v5 & 0x8000000000000000) != 0)
        {
          __break(1u);
LABEL_51:
          __break(1u);
          goto LABEL_52;
        }
      }
      -[NSObject setStartTimestamp:](v14, sel_setStartTimestamp_, v5);
      v29 = v2;
      if ((unint64_t)(v4 - 11) >= 2)
        __asm { BR              X9 }
      -[NSObject setStartTimestampEventName:](v14, sel_setStartTimestampEventName_, 0);

      v23 = v4 == 12 || v6 == 11;
      v24 = v23;
      if (v23)
        v25 = 0;
      else
        v25 = v7;
      if ((v25 & 0x8000000000000000) == 0)
      {
        -[NSObject setEndTimestamp:](v14, sel_setEndTimestamp_);
        if ((v24 & 1) == 0)
          __asm { BR              X9 }
        -[NSObject setEndTimestampEventName:](v14, sel_setEndTimestampEventName_, 0);

        objc_msgSend(v12, sel_setSrt_, v14);
        if (v8)
          v26 = (void *)sub_2444DBC20();
        else
          v26 = 0;
        objc_msgSend(v12, sel_setError_, v26, v29);

        if (v30)
          v27 = (void *)sub_2444DBC20();
        else
          v27 = 0;
        objc_msgSend(v12, sel_setRequestStatus_, v27);

        if (v3)
          v28 = (void *)sub_2444DBC20();
        else
          v28 = 0;
        objc_msgSend(v12, sel_setTurnId_, v28);

        -[NSObject setSiriRequestGrainMetrics:](v10, sel_setSiriRequestGrainMetrics_, v12);
        goto LABEL_49;
      }
      goto LABEL_51;
    }

  }
  if (qword_257366BE0 != -1)
    swift_once();
  v15 = sub_2444DBBE4();
  __swift_project_value_buffer(v15, (uint64_t)qword_257367688);
  v14 = sub_2444DBBD8();
  v16 = sub_2444DBCD4();
  if (os_log_type_enabled(v14, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_2444CA000, v14, v16, "PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper init failed!", v17, 2u);
    MEMORY[0x24951043C](v17, -1, -1);
  }
LABEL_49:

}

double PnRLatencyContextMetrics.metricsValue.getter()
{
  uint64_t v0;
  double result;

  if (*(_BYTE *)v0 != 11 && *(_BYTE *)(v0 + 16) != 11)
    return ((double)*(unint64_t *)(v0 + 24) - (double)*(unint64_t *)(v0 + 8)) / 1000000000.0;
  return result;
}

double sub_2444DB4BC()
{
  uint64_t v0;
  double result;

  if (*(_BYTE *)v0 != 11 && *(_BYTE *)(v0 + 16) != 11)
    return ((double)*(unint64_t *)(v0 + 24) - (double)*(unint64_t *)(v0 + 8)) / 1000000000.0;
  return result;
}

uint64_t PnRSiriTurnGrainSummary.description.getter()
{
  sub_2444DBD28();
  sub_2444DBC50();
  swift_bridgeObjectRetain();
  sub_2444DBC50();
  swift_bridgeObjectRelease();
  sub_2444DBC50();
  sub_2444DBCBC();
  sub_2444DBC50();
  swift_bridgeObjectRetain();
  sub_2444DBC50();
  swift_bridgeObjectRelease();
  sub_2444DBC50();
  swift_bridgeObjectRetain();
  sub_2444DBC50();
  swift_bridgeObjectRelease();
  sub_2444DBC50();
  return 0;
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

uint64_t getEnumTagSinglePayload for PnRLatencyContextMetrics(unsigned __int8 *a1, unsigned int a2)
{
  int v3;
  int v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xF5 && a1[32])
    return (*(_DWORD *)a1 + 245);
  if (*a1 <= 0xBu)
    v3 = 11;
  else
    v3 = *a1;
  v4 = v3 - 12;
  if (*a1 < 0xBu)
    v5 = -1;
  else
    v5 = v4;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PnRLatencyContextMetrics(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF4)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 245;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xF5)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0xF5)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 11;
  }
  return result;
}

ValueMetadata *type metadata accessor for PnRLatencyContextMetrics()
{
  return &type metadata for PnRLatencyContextMetrics;
}

ValueMetadata *type metadata accessor for PnRDimension()
{
  return &type metadata for PnRDimension;
}

uint64_t initializeBufferWithCopyOfBuffer for PnRSiriTurnGrainSummary(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PnRSiriTurnGrainSummary()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PnRSiriTurnGrainSummary(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PnRSiriTurnGrainSummary(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for PnRSiriTurnGrainSummary(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PnRSiriTurnGrainSummary(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 80))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PnRSiriTurnGrainSummary(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 80) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for PnRSiriTurnGrainSummary()
{
  return &type metadata for PnRSiriTurnGrainSummary;
}

uint64_t sub_2444DBA7C()
{
  return MEMORY[0x24BDCB9E0]();
}

uint64_t sub_2444DBA88()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_2444DBA94()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_2444DBAA0()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t sub_2444DBAAC()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_2444DBAB8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2444DBAC4()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_2444DBAD0()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2444DBADC()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_2444DBAE8()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2444DBAF4()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2444DBB00()
{
  return MEMORY[0x24BE0C8F0]();
}

uint64_t sub_2444DBB0C()
{
  return MEMORY[0x24BEA8DD8]();
}

uint64_t sub_2444DBB18()
{
  return MEMORY[0x24BEA8DE0]();
}

uint64_t sub_2444DBB24()
{
  return MEMORY[0x24BEA8DE8]();
}

uint64_t sub_2444DBB30()
{
  return MEMORY[0x24BE947A8]();
}

uint64_t sub_2444DBB3C()
{
  return MEMORY[0x24BE94820]();
}

uint64_t sub_2444DBB48()
{
  return MEMORY[0x24BE5F790]();
}

uint64_t sub_2444DBB54()
{
  return MEMORY[0x24BE5F7A0]();
}

uint64_t sub_2444DBB60()
{
  return MEMORY[0x24BDFCAF0]();
}

uint64_t sub_2444DBB6C()
{
  return MEMORY[0x24BDFCB08]();
}

uint64_t sub_2444DBB78()
{
  return MEMORY[0x24BDFCB30]();
}

uint64_t sub_2444DBB84()
{
  return MEMORY[0x24BDFCB40]();
}

uint64_t sub_2444DBB90()
{
  return MEMORY[0x24BDFCB60]();
}

uint64_t sub_2444DBB9C()
{
  return MEMORY[0x24BDFCB78]();
}

uint64_t sub_2444DBBA8()
{
  return MEMORY[0x24BDFCBA0]();
}

uint64_t sub_2444DBBB4()
{
  return MEMORY[0x24BDFCBF8]();
}

uint64_t sub_2444DBBC0()
{
  return MEMORY[0x24BDFCC00]();
}

uint64_t sub_2444DBBCC()
{
  return MEMORY[0x24BDFCC08]();
}

uint64_t sub_2444DBBD8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2444DBBE4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2444DBBF0()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_2444DBBFC()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2444DBC08()
{
  return MEMORY[0x24BEE07E8]();
}

uint64_t sub_2444DBC14()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2444DBC20()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2444DBC2C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2444DBC38()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2444DBC44()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2444DBC50()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2444DBC5C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2444DBC68()
{
  return MEMORY[0x24BDFCC20]();
}

uint64_t sub_2444DBC74()
{
  return MEMORY[0x24BDFCC28]();
}

uint64_t sub_2444DBC80()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2444DBC8C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2444DBC98()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2444DBCA4()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2444DBCB0()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_2444DBCBC()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_2444DBCC8()
{
  return MEMORY[0x24BE948A0]();
}

uint64_t sub_2444DBCD4()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2444DBCE0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2444DBCEC()
{
  return MEMORY[0x24BE94910]();
}

uint64_t sub_2444DBCF8()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_2444DBD04()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2444DBD10()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2444DBD1C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2444DBD28()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2444DBD34()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2444DBD40()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2444DBD4C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2444DBD58()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2444DBD64()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2444DBD70()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2444DBD7C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2444DBD88()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2444DBD94()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2444DBDA0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2444DBDAC()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_2444DBDB8()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_2444DBDC4()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2444DBDD0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2444DBDDC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2444DBDE8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2444DBDF4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2444DBE00()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x24BE08DA8]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x24BE7AF90]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x24BEE4E50]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x24BEE4F28]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
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

