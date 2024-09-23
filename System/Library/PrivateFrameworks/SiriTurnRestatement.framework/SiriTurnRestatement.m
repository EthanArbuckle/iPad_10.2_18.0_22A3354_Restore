uint64_t ODBATCHSiriSchemaProvisionalODBATCHClientEventReadFrom(void *a1, uint64_t a2)
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
  ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReported *v17;
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
      if ((v10 >> 3) == 26)
      {
        v17 = objc_alloc_init(ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReported);
        if (!PBReaderPlaceMark()
          || (ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReportedReadFrom(v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setTurnRestatementScoresReported:", v17, 0, 0);

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

uint64_t ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReportedReadFrom(void *a1, uint64_t a2)
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
  ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore *v17;
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
        v17 = objc_alloc_init(ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore);
        if (!PBReaderPlaceMark()
          || !ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoreReadFrom(v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
        if (v17)
          objc_msgSend(a1, "addTurnRestatementScores:", v17, 0, 0);

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

uint64_t ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoreReadFrom(void *a1, uint64_t a2)
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
  id v19;
  uint64_t result;
  uint64_t v21;
  unint64_t v22;
  double v23;
  uint64_t v24;
  unint64_t v25;
  double v26;

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
    if (v17 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v19 = objc_alloc_init(MEMORY[0x24BE95C78]);
        if (!PBReaderPlaceMark() || (SISchemaUUIDReadFrom() & 1) == 0)
          goto LABEL_40;
        PBReaderRecallMark();
        objc_msgSend(a1, "setCurrentTurnId:", v19, 0, 0);
        goto LABEL_25;
      case 2u:
        v19 = objc_alloc_init(MEMORY[0x24BE95C78]);
        if (PBReaderPlaceMark() && (SISchemaUUIDReadFrom() & 1) != 0)
        {
          PBReaderRecallMark();
          objc_msgSend(a1, "setNextTurnId:", v19, 0, 0);
LABEL_25:

LABEL_38:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_40:

        return 0;
      case 4u:
        v21 = *v3;
        v22 = *(_QWORD *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v23 = *(double *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + v16) = 1;
          v23 = 0.0;
        }
        objc_msgSend(a1, "setUtteranceRestatementScore:", v23);
        goto LABEL_38;
      case 5u:
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v26 = *(double *)(*(_QWORD *)(a2 + *v7) + v25);
          *(_QWORD *)(a2 + v24) = v25 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + v16) = 1;
          v26 = 0.0;
        }
        objc_msgSend(a1, "setSemanticSimilarityScore:", v26);
        goto LABEL_38;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_38;
    }
  }
}

uint64_t SiriTurnRestatementCalculator.__allocating_init(logger:bookmarkService:maxSeconds:maxConsecutiveTurns:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = swift_allocObject();
  sub_24741E810();
  v9 = v8 + OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_logger;
  v10 = sub_24741E99C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9, a1, v10);
  *(_QWORD *)(v8 + OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_bookmarkService) = a2;
  *(double *)(v8 + 16) = a4;
  *(_QWORD *)(v8 + 24) = a3;
  return v8;
}

uint64_t SiriTurnRestatementCalculator.init(logger:bookmarkService:maxSeconds:maxConsecutiveTurns:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;

  sub_24741E810();
  v9 = v4 + OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_logger;
  v10 = sub_24741E99C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9, a1, v10);
  *(_QWORD *)(v4 + OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_bookmarkService) = a2;
  *(double *)(v4 + 16) = a4;
  *(_QWORD *)(v4 + 24) = a3;
  return v4;
}

uint64_t SiriTurnRestatementCalculator.doWork(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  v4 = sub_24741E7E0();
  v3[6] = v4;
  v3[7] = *(_QWORD *)(v4 - 8);
  v3[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_247417B4C()
{
  NSObject *v0;
  os_log_type_t v1;
  uint8_t *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char isUniquelyReferenced_nonNull_native;
  char v21;
  unint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  char v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  _QWORD *v42;
  char v43;
  char v44;
  unint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  _QWORD *v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  _QWORD *v72;

  v0 = sub_24741E984();
  v1 = sub_24741EA20();
  if (os_log_type_enabled(v0, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_247414000, v0, v1, "Running SiriTurnRestatementCalculator", v2, 2u);
    MEMORY[0x24957A1BC](v2, -1, -1);
  }

  v3 = sub_24741E894();
  v4 = MEMORY[0x24BEE4AF8];
  v70 = sub_24741837C(MEMORY[0x24BEE4AF8]);
  result = sub_24741837C(v4);
  v6 = (_QWORD *)result;
  v63[2] = v4;
  if (v3 >> 62)
    goto LABEL_63;
  v7 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
LABEL_5:
    v8 = 0;
    v69 = 0;
    v9 = v63 + 2;
    v64 = v3 & 0xC000000000000001;
    v60 = v3 & 0xFFFFFFFFFFFFFF8;
    v61 = v7;
    v62 = v3;
    while (1)
    {
      if (v64)
      {
        MEMORY[0x249579D18](v8, v3);
        v10 = v8 + 1;
        if (__OFADD__(v8, 1))
          goto LABEL_62;
      }
      else
      {
        if (v8 >= *(_QWORD *)(v60 + 16))
        {
          __break(1u);
          return result;
        }
        swift_retain();
        v10 = v8 + 1;
        if (__OFADD__(v8, 1))
          goto LABEL_62;
      }
      v65 = v10;
      v11 = sub_24741E900();
      if (v11 >> 62)
      {
        swift_bridgeObjectRetain();
        v12 = sub_24741EABC();
        swift_bridgeObjectRelease();
        if (!v12)
          goto LABEL_6;
LABEL_15:
        v13 = v12;
        v66 = v8;
        v14 = 0;
        v71 = v11 & 0xC000000000000001;
        v68 = v11;
        v67 = v12;
LABEL_19:
        if (v71)
        {
          MEMORY[0x249579D18](v14, v11);
          v15 = v14 + 1;
          if (__OFADD__(v14, 1))
            goto LABEL_56;
        }
        else
        {
          swift_retain();
          v15 = v14 + 1;
          if (__OFADD__(v14, 1))
          {
LABEL_56:
            __break(1u);
LABEL_57:
            __break(1u);
LABEL_58:
            __break(1u);
LABEL_59:
            __break(1u);
LABEL_60:
            __break(1u);
LABEL_61:
            __break(1u);
LABEL_62:
            __break(1u);
LABEL_63:
            swift_bridgeObjectRetain();
            v7 = sub_24741EABC();
            result = swift_bridgeObjectRelease();
            if (!v7)
              break;
            goto LABEL_5;
          }
        }
        v16 = sub_24741E948();
        v17 = swift_retain();
        if ((v16 & 1) != 0)
        {
          MEMORY[0x249579C94](v17);
          if (*(_QWORD *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_24741E9FC();
          sub_24741EA08();
          sub_24741E9F0();
          v18 = sub_24741E954();
          v3 = v19;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v72 = v6;
          v22 = sub_24741AE10(v18, v3);
          v23 = v6[2];
          v24 = (v21 & 1) == 0;
          v25 = v23 + v24;
          if (__OFADD__(v23, v24))
            goto LABEL_57;
          v26 = v21;
          if (v6[3] >= v25)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) != 0)
            {
              if ((v21 & 1) == 0)
                goto LABEL_38;
            }
            else
            {
              sub_24741B25C();
              v6 = v72;
              if ((v26 & 1) == 0)
                goto LABEL_38;
            }
          }
          else
          {
            sub_24741AE74(v25, isUniquelyReferenced_nonNull_native);
            v6 = v72;
            v27 = sub_24741AE10(v18, v3);
            if ((v26 & 1) != (v28 & 1))
              return sub_24741EB10();
            v22 = v27;
            if ((v26 & 1) == 0)
            {
LABEL_38:
              v6[(v22 >> 6) + 8] |= 1 << v22;
              v36 = (uint64_t *)(v6[6] + 16 * v22);
              *v36 = v18;
              v36[1] = v3;
              *(_QWORD *)(v6[7] + 8 * v22) = v66;
              v37 = v6[2];
              v38 = __OFADD__(v37, 1);
              v39 = v37 + 1;
              if (v38)
                goto LABEL_60;
              v6[2] = v39;
              swift_bridgeObjectRetain();
LABEL_40:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v40 = sub_24741E954();
              v3 = v41;
              v42 = (_QWORD *)v70;
              v43 = swift_isUniquelyReferenced_nonNull_native();
              v72 = (_QWORD *)v70;
              v45 = sub_24741AE10(v40, v3);
              v46 = *(_QWORD *)(v70 + 16);
              v47 = (v44 & 1) == 0;
              v48 = v46 + v47;
              if (__OFADD__(v46, v47))
                goto LABEL_58;
              v49 = v44;
              if (*(_QWORD *)(v70 + 24) >= v48)
              {
                if ((v43 & 1) == 0)
                {
                  sub_24741B25C();
                  v42 = v72;
                }
              }
              else
              {
                sub_24741AE74(v48, v43);
                v50 = (uint64_t)v72;
                v51 = sub_24741AE10(v40, v3);
                if ((v49 & 1) != (v52 & 1))
                  return sub_24741EB10();
                v45 = v51;
                v42 = (_QWORD *)v50;
              }
              v11 = v68;
              v70 = (unint64_t)v42;
              if ((v49 & 1) != 0)
              {
                v53 = v69;
                *(_QWORD *)(v42[7] + 8 * v45) = v69;
              }
              else
              {
                v42[(v45 >> 6) + 8] |= 1 << v45;
                v54 = (uint64_t *)(v42[6] + 16 * v45);
                *v54 = v40;
                v54[1] = v3;
                v53 = v69;
                *(_QWORD *)(v42[7] + 8 * v45) = v69;
                v55 = v42[2];
                v38 = __OFADD__(v55, 1);
                v56 = v55 + 1;
                if (v38)
                  goto LABEL_61;
                v42[2] = v56;
                swift_bridgeObjectRetain();
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_release();
              v69 = v53 + 1;
              v9 = v63 + 2;
              if (__OFADD__(v53, 1))
                goto LABEL_59;
              v13 = v67;
LABEL_18:
              ++v14;
              if (v15 == v13)
                goto LABEL_6;
              goto LABEL_19;
            }
          }
          *(_QWORD *)(v6[7] + 8 * v22) = v66;
          goto LABEL_40;
        }
        swift_retain();
        v3 = sub_24741E984();
        v29 = sub_24741EA2C();
        if (os_log_type_enabled((os_log_t)v3, v29))
        {
          v30 = swift_slowAlloc();
          v31 = swift_slowAlloc();
          v72 = (_QWORD *)v31;
          *(_DWORD *)v30 = 136315138;
          v32 = sub_24741E954();
          *(_QWORD *)(v30 + 4) = sub_24741A7C0(v32, v33, (uint64_t *)&v72);
          swift_bridgeObjectRelease();
          swift_release_n();
          _os_log_impl(&dword_247414000, (os_log_t)v3, v29, "Turn: %s has an invalid timestamp", (uint8_t *)v30, 0xCu);
          swift_arrayDestroy();
          v34 = v31;
          v11 = v68;
          MEMORY[0x24957A1BC](v34, -1, -1);
          v35 = v30;
          v13 = v67;
          MEMORY[0x24957A1BC](v35, -1, -1);
          swift_release();
        }
        else
        {
          swift_release_n();
        }

        goto LABEL_18;
      }
      v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v12)
        goto LABEL_15;
LABEL_6:
      swift_bridgeObjectRelease();
      result = swift_release();
      v8 = v65;
      v3 = v62;
      if (v65 == v61)
      {
        swift_bridgeObjectRelease();
        v57 = *v9;
        goto LABEL_65;
      }
    }
  }
  swift_bridgeObjectRelease();
  v57 = MEMORY[0x24BEE4AF8];
LABEL_65:
  v63[9] = v57;
  v63[10] = v70;
  swift_bridgeObjectRelease();
  v58 = (_QWORD *)swift_task_alloc();
  v63[11] = v58;
  *v58 = v63;
  v58[1] = sub_24741827C;
  v59 = v63[5];
  v58[5] = v57;
  v58[6] = v59;
  v58[4] = v70;
  return swift_task_switch();
}

uint64_t sub_24741827C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_2474182EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 48);
  v5 = *(_QWORD **)(v0 + 24);
  sub_24741E828();
  v6 = sub_24741E834();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v7 = MEMORY[0x24BEE4AF8];
  *v5 = v1;
  v5[1] = v7;
  v5[2] = v6;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_24741837C(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3228);
  v2 = (_QWORD *)sub_24741EAEC();
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
    result = sub_24741AE10(v5, v6);
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

uint64_t sub_24741848C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  return swift_task_switch();
}

uint64_t sub_2474184A8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v1 = *(_QWORD *)(v0 + 40);
  if (v1 >> 62)
    goto LABEL_53;
  v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  *(_QWORD *)(v0 + 56) = v2;
  if (v2)
  {
    do
    {
      v3 = 0;
      v48 = v0 + 24;
      v4 = *(_QWORD *)(v0 + 48);
      *(_QWORD *)(v0 + 64) = OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_logger;
      *(_QWORD *)(v0 + 72) = *(_QWORD *)(v4 + 24);
      v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
      while (1)
      {
        v6 = *(_QWORD *)(v0 + 40);
        if ((v6 & 0xC000000000000001) != 0)
        {
          v7 = MEMORY[0x249579D18](v3);
        }
        else
        {
          if (v3 >= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_52;
          v7 = *(_QWORD *)(v6 + 8 * v3 + 32);
          swift_retain();
        }
        *(_QWORD *)(v0 + 80) = v7;
        *(_QWORD *)(v0 + 88) = v3 + 1;
        if (__OFADD__(v3, 1))
        {
          __break(1u);
          goto LABEL_51;
        }
        v8 = *(_QWORD *)(v0 + 72);
        v10 = *(_QWORD *)(v0 + 40);
        v9 = *(_QWORD *)(v0 + 48);
        v11 = *(_QWORD *)(v0 + 32);
        v12 = sub_24741E954();
        v14 = sub_2474198A8(v12, v13, v11, v10, v8, v9);
        *(_QWORD *)(v0 + 96) = v14;
        swift_bridgeObjectRelease();
        if (!v14)
        {
          swift_retain_n();
          v37 = sub_24741E984();
          v38 = sub_24741EA20();
          if (os_log_type_enabled(v37, v38))
          {
            v39 = swift_slowAlloc();
            v40 = swift_slowAlloc();
            v49 = v40;
            *(_DWORD *)v39 = 136315138;
            v41 = sub_24741E954();
            *(_QWORD *)(v39 + 4) = sub_24741A7C0(v41, v42, &v49);
            swift_bridgeObjectRelease();
            swift_release_n();
            _os_log_impl(&dword_247414000, v37, v38, "No consecutive turns after turn %s.", (uint8_t *)v39, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24957A1BC](v40, -1, -1);
            MEMORY[0x24957A1BC](v39, -1, -1);
            swift_release();
          }
          else
          {
            swift_release_n();
          }

          goto LABEL_5;
        }
        if (!(v14 >> 62))
        {
          v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
          *(_QWORD *)(v0 + 104) = v15;
          if (v15)
            break;
          goto LABEL_48;
        }
        swift_bridgeObjectRetain();
        v15 = sub_24741EABC();
        swift_bridgeObjectRelease();
        *(_QWORD *)(v0 + 104) = v15;
        if (v15)
          break;
LABEL_48:
        swift_bridgeObjectRelease();
        swift_release();
LABEL_5:
        v3 = *(_QWORD *)(v0 + 88);
        if (v3 == *(_QWORD *)(v0 + 56))
          goto LABEL_55;
      }
      if (v15 >= 1)
      {
        for (i = 0; ; i = *(_QWORD *)(v0 + 112) + 1)
        {
          *(_QWORD *)(v0 + 112) = i;
          *(_QWORD *)(v0 + 120) = v5;
          v17 = *(_QWORD *)(v0 + 96);
          if ((v17 & 0xC000000000000001) != 0)
          {
            v18 = MEMORY[0x249579D18]();
          }
          else
          {
            v18 = *(_QWORD *)(v17 + 8 * i + 32);
            swift_retain();
          }
          *(_QWORD *)(v0 + 128) = v18;
          swift_retain_n();
          if ((sub_24741E930() & 1) == 0)
            goto LABEL_26;
          if ((sub_24741E930() & 1) == 0)
            goto LABEL_26;
          sub_24741E8F4();
          swift_retain_n();
          sub_24741E8E8();
          __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3248);
          sub_24741E93C();
          swift_bridgeObjectRelease();
          v19 = *(_QWORD *)(v0 + 16);
          if (!v19)
            goto LABEL_26;
          if (!*(_QWORD *)(v19 + 16))
            break;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          sub_24741E8E8();
          sub_24741E93C();
          swift_bridgeObjectRelease();
          if (!*(_QWORD *)v48)
            goto LABEL_42;
          if (!*(_QWORD *)(*(_QWORD *)v48 + 16))
          {
            swift_bridgeObjectRelease();
LABEL_42:
            swift_release_n();
            swift_bridgeObjectRelease();
            goto LABEL_27;
          }
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          sub_24741E9C0();
          v21 = v20;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release_n();
          v22 = 0;
LABEL_28:
          *(_BYTE *)(v0 + 168) = v22;
          *(_QWORD *)(v0 + 136) = v21;
          swift_retain_n();
          if ((sub_24741E930() & 1) != 0 && (sub_24741E930() & 1) != 0)
          {
            v43 = (_QWORD *)swift_task_alloc();
            *(_QWORD *)(v0 + 144) = v43;
            *v43 = v0;
            v43[1] = sub_247418AF8;
            v44 = *(_QWORD *)(v0 + 80);
            v45 = *(_QWORD *)(v0 + 48);
            v43[5] = v18;
            v43[6] = v45;
            v43[4] = v44;
            return swift_task_switch();
          }
          swift_release_n();
          if (*(_BYTE *)(v0 + 168) == 1)
          {
            v5 = *(_QWORD **)(v0 + 120);
          }
          else
          {
            v23 = sub_24741E954();
            v25 = v24;
            v26 = sub_24741E954();
            v28 = v27;
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v5 = *(_QWORD **)(v0 + 120);
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              v5 = sub_24741A6B4(0, v5[2] + 1, 1, *(_QWORD **)(v0 + 120));
            v31 = v5[2];
            v30 = v5[3];
            if (v31 >= v30 >> 1)
              v5 = sub_24741A6B4((_QWORD *)(v30 > 1), v31 + 1, 1, v5);
            v32 = *(_BYTE *)(v0 + 168);
            v33 = *(_QWORD *)(v0 + 136);
            v5[2] = v31 + 1;
            v34 = &v5[8 * v31];
            v34[4] = v23;
            v34[5] = v25;
            v34[6] = v26;
            v34[7] = v28;
            v34[8] = v33;
            *((_BYTE *)v34 + 72) = v32;
            v34[10] = 0;
            *((_BYTE *)v34 + 88) = 1;
          }
          v36 = *(_QWORD *)(v0 + 104);
          v35 = *(_QWORD *)(v0 + 112);
          swift_release();
          if (v35 + 1 == v36)
          {
            swift_release();
            swift_bridgeObjectRelease();
            goto LABEL_5;
          }
        }
        swift_bridgeObjectRelease();
LABEL_26:
        swift_release_n();
LABEL_27:
        v22 = 1;
        v21 = 0;
        goto LABEL_28;
      }
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      swift_bridgeObjectRetain();
      v47 = sub_24741EABC();
      *(_QWORD *)(v0 + 56) = v47;
    }
    while (v47);
  }
  v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_55:
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v5);
}

uint64_t sub_247418AF8(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  *(_QWORD *)(*v3 + 152) = v2;
  swift_task_dealloc();
  if (!v2)
  {
    *(_BYTE *)(v6 + 169) = a2;
    *(_QWORD *)(v6 + 160) = a1;
  }
  return swift_task_switch();
}

void sub_247418B74()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  char i;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v47 = v0 + 24;
  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_BYTE *)(v0 + 169);
  swift_release_n();
  if ((v2 & 1) != 0)
    v3 = 0;
  else
    v3 = v1;
  for (i = *(_BYTE *)(v0 + 169) & 1; ; i = 1)
  {
    if (*(_BYTE *)(v0 + 168) == 1 && (i & 1) != 0)
    {
      v5 = *(_QWORD **)(v0 + 120);
    }
    else
    {
      v6 = sub_24741E954();
      v8 = v7;
      v9 = sub_24741E954();
      v11 = v10;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v5 = *(_QWORD **)(v0 + 120);
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        v5 = sub_24741A6B4(0, v5[2] + 1, 1, *(_QWORD **)(v0 + 120));
      v14 = v5[2];
      v13 = v5[3];
      if (v14 >= v13 >> 1)
        v5 = sub_24741A6B4((_QWORD *)(v13 > 1), v14 + 1, 1, v5);
      v15 = *(_BYTE *)(v0 + 168);
      v16 = *(_QWORD *)(v0 + 136);
      v5[2] = v14 + 1;
      v17 = &v5[8 * v14];
      v17[4] = v6;
      v17[5] = v8;
      v17[6] = v9;
      v17[7] = v11;
      v17[8] = v16;
      *((_BYTE *)v17 + 72) = v15;
      v17[10] = v3;
      *((_BYTE *)v17 + 88) = i & 1;
    }
    v18 = *(_QWORD *)(v0 + 104);
    v19 = *(_QWORD *)(v0 + 112);
    swift_release();
    if (v19 + 1 == v18)
      break;
    v37 = *(_QWORD *)(v0 + 112) + 1;
LABEL_34:
    *(_QWORD *)(v0 + 112) = v37;
    *(_QWORD *)(v0 + 120) = v5;
    v38 = *(_QWORD *)(v0 + 96);
    if ((v38 & 0xC000000000000001) != 0)
    {
      v39 = MEMORY[0x249579D18]();
    }
    else
    {
      v39 = *(_QWORD *)(v38 + 8 * v37 + 32);
      swift_retain();
    }
    *(_QWORD *)(v0 + 128) = v39;
    swift_retain_n();
    if ((sub_24741E930() & 1) == 0)
      goto LABEL_44;
    if ((sub_24741E930() & 1) == 0)
      goto LABEL_44;
    sub_24741E8F4();
    swift_retain_n();
    sub_24741E8E8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3248);
    sub_24741E93C();
    swift_bridgeObjectRelease();
    v40 = *(_QWORD *)(v0 + 16);
    if (!v40)
      goto LABEL_44;
    if (!*(_QWORD *)(v40 + 16))
    {
      swift_bridgeObjectRelease();
LABEL_44:
      swift_release_n();
LABEL_45:
      v43 = 1;
      v42 = 0;
      goto LABEL_46;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_24741E8E8();
    sub_24741E93C();
    swift_bridgeObjectRelease();
    if (!*(_QWORD *)v47)
      goto LABEL_52;
    if (!*(_QWORD *)(*(_QWORD *)v47 + 16))
    {
      swift_bridgeObjectRelease();
LABEL_52:
      swift_release_n();
      swift_bridgeObjectRelease();
      goto LABEL_45;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_24741E9C0();
    v42 = v41;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release_n();
    v43 = 0;
LABEL_46:
    *(_BYTE *)(v0 + 168) = v43;
    *(_QWORD *)(v0 + 136) = v42;
    swift_retain_n();
    if ((sub_24741E930() & 1) != 0 && (sub_24741E930() & 1) != 0)
    {
      v44 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 144) = v44;
      *v44 = v0;
      v44[1] = sub_247418AF8;
      v45 = *(_QWORD *)(v0 + 80);
      v46 = *(_QWORD *)(v0 + 48);
      v44[5] = v39;
      v44[6] = v46;
      v44[4] = v45;
      swift_task_switch();
      return;
    }
    swift_release_n();
    v3 = 0;
  }
  swift_release();
  swift_bridgeObjectRelease();
  while (1)
  {
    while (1)
    {
      v20 = *(_QWORD *)(v0 + 88);
      if (v20 == *(_QWORD *)(v0 + 56))
      {
        swift_bridgeObjectRelease();
        (*(void (**)(_QWORD *))(v0 + 8))(v5);
        return;
      }
      v21 = *(_QWORD *)(v0 + 40);
      if ((v21 & 0xC000000000000001) != 0)
      {
        v22 = MEMORY[0x249579D18](*(_QWORD *)(v0 + 88));
      }
      else
      {
        if (v20 >= *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_55;
        v22 = *(_QWORD *)(v21 + 8 * v20 + 32);
        swift_retain();
      }
      *(_QWORD *)(v0 + 80) = v22;
      *(_QWORD *)(v0 + 88) = v20 + 1;
      if (__OFADD__(v20, 1))
      {
        __break(1u);
LABEL_55:
        __break(1u);
        goto LABEL_56;
      }
      v23 = *(_QWORD *)(v0 + 72);
      v25 = *(_QWORD *)(v0 + 40);
      v24 = *(_QWORD *)(v0 + 48);
      v26 = *(_QWORD *)(v0 + 32);
      v27 = sub_24741E954();
      v29 = sub_2474198A8(v27, v28, v26, v25, v23, v24);
      *(_QWORD *)(v0 + 96) = v29;
      swift_bridgeObjectRelease();
      if (v29)
        break;
      swift_retain_n();
      v31 = sub_24741E984();
      v32 = sub_24741EA20();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = swift_slowAlloc();
        v34 = swift_slowAlloc();
        v48 = v34;
        *(_DWORD *)v33 = 136315138;
        v35 = sub_24741E954();
        *(_QWORD *)(v33 + 4) = sub_24741A7C0(v35, v36, &v48);
        swift_bridgeObjectRelease();
        swift_release_n();
        _os_log_impl(&dword_247414000, v31, v32, "No consecutive turns after turn %s.", (uint8_t *)v33, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24957A1BC](v34, -1, -1);
        MEMORY[0x24957A1BC](v33, -1, -1);
        swift_release();
      }
      else
      {
        swift_release_n();
      }

    }
    if (v29 >> 62)
      break;
    v30 = *(_QWORD *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
    *(_QWORD *)(v0 + 104) = v30;
    if (v30)
      goto LABEL_31;
LABEL_26:
    swift_bridgeObjectRelease();
    swift_release();
  }
  swift_bridgeObjectRetain();
  v30 = sub_24741EABC();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 104) = v30;
  if (!v30)
    goto LABEL_26;
LABEL_31:
  if (v30 >= 1)
  {
    v37 = 0;
    goto LABEL_34;
  }
LABEL_56:
  __break(1u);
}

void sub_24741918C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v54 = v0 + 24;
  v1 = *(void **)(v0 + 152);
  swift_release_n();
  v2 = v1;
  v3 = v1;
  v4 = sub_24741E984();
  v5 = sub_24741EA2C();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(void **)(v0 + 152);
  if (v6)
  {
    v8 = swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v10 = v7;
    v11 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v8 + 4) = v11;
    *v9 = v11;

    _os_log_impl(&dword_247414000, v4, v5, "Could not get semantic similarity score: %@", (uint8_t *)v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3240);
    swift_arrayDestroy();
    MEMORY[0x24957A1BC](v9, -1, -1);
    MEMORY[0x24957A1BC](v8, -1, -1);

  }
  else
  {

  }
  while (1)
  {
    if (*(_BYTE *)(v0 + 168) == 1)
    {
      v12 = *(_QWORD **)(v0 + 120);
    }
    else
    {
      v13 = sub_24741E954();
      v15 = v14;
      v16 = sub_24741E954();
      v18 = v17;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v12 = *(_QWORD **)(v0 + 120);
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        v12 = sub_24741A6B4(0, v12[2] + 1, 1, *(_QWORD **)(v0 + 120));
      v21 = v12[2];
      v20 = v12[3];
      if (v21 >= v20 >> 1)
        v12 = sub_24741A6B4((_QWORD *)(v20 > 1), v21 + 1, 1, v12);
      v22 = *(_BYTE *)(v0 + 168);
      v23 = *(_QWORD *)(v0 + 136);
      v12[2] = v21 + 1;
      v24 = &v12[8 * v21];
      v24[4] = v13;
      v24[5] = v15;
      v24[6] = v16;
      v24[7] = v18;
      v24[8] = v23;
      *((_BYTE *)v24 + 72) = v22;
      v24[10] = 0;
      *((_BYTE *)v24 + 88) = 1;
    }
    v25 = *(_QWORD *)(v0 + 104);
    v26 = *(_QWORD *)(v0 + 112);
    swift_release();
    if (v26 + 1 == v25)
      break;
    v44 = *(_QWORD *)(v0 + 112) + 1;
LABEL_33:
    *(_QWORD *)(v0 + 112) = v44;
    *(_QWORD *)(v0 + 120) = v12;
    v45 = *(_QWORD *)(v0 + 96);
    if ((v45 & 0xC000000000000001) != 0)
    {
      v46 = MEMORY[0x249579D18]();
    }
    else
    {
      v46 = *(_QWORD *)(v45 + 8 * v44 + 32);
      swift_retain();
    }
    *(_QWORD *)(v0 + 128) = v46;
    swift_retain_n();
    if ((sub_24741E930() & 1) == 0)
      goto LABEL_43;
    if ((sub_24741E930() & 1) == 0)
      goto LABEL_43;
    sub_24741E8F4();
    swift_retain_n();
    sub_24741E8E8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3248);
    sub_24741E93C();
    swift_bridgeObjectRelease();
    v47 = *(_QWORD *)(v0 + 16);
    if (!v47)
      goto LABEL_43;
    if (!*(_QWORD *)(v47 + 16))
    {
      swift_bridgeObjectRelease();
LABEL_43:
      swift_release_n();
LABEL_44:
      v50 = 1;
      v49 = 0;
      goto LABEL_45;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_24741E8E8();
    sub_24741E93C();
    swift_bridgeObjectRelease();
    if (!*(_QWORD *)v54)
      goto LABEL_51;
    if (!*(_QWORD *)(*(_QWORD *)v54 + 16))
    {
      swift_bridgeObjectRelease();
LABEL_51:
      swift_release_n();
      swift_bridgeObjectRelease();
      goto LABEL_44;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_24741E9C0();
    v49 = v48;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release_n();
    v50 = 0;
LABEL_45:
    *(_BYTE *)(v0 + 168) = v50;
    *(_QWORD *)(v0 + 136) = v49;
    swift_retain_n();
    if ((sub_24741E930() & 1) != 0 && (sub_24741E930() & 1) != 0)
    {
      v51 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 144) = v51;
      *v51 = v0;
      v51[1] = sub_247418AF8;
      v52 = *(_QWORD *)(v0 + 80);
      v53 = *(_QWORD *)(v0 + 48);
      v51[5] = v46;
      v51[6] = v53;
      v51[4] = v52;
      swift_task_switch();
      return;
    }
    swift_release_n();
  }
  swift_release();
  swift_bridgeObjectRelease();
  v27 = *(_QWORD *)(v0 + 88);
  if (v27 == *(_QWORD *)(v0 + 56))
  {
LABEL_52:
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD *))(v0 + 8))(v12);
    return;
  }
  while (2)
  {
    v28 = *(_QWORD *)(v0 + 40);
    if ((v28 & 0xC000000000000001) != 0)
    {
      v29 = MEMORY[0x249579D18](v27);
    }
    else
    {
      if (v27 >= *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_54;
      v29 = *(_QWORD *)(v28 + 8 * v27 + 32);
      swift_retain();
    }
    *(_QWORD *)(v0 + 80) = v29;
    *(_QWORD *)(v0 + 88) = v27 + 1;
    if (__OFADD__(v27, 1))
    {
      __break(1u);
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    v30 = *(_QWORD *)(v0 + 72);
    v31 = *(_QWORD *)(v0 + 40);
    v32 = *(_QWORD *)(v0 + 48);
    v33 = *(_QWORD *)(v0 + 32);
    v34 = sub_24741E954();
    v36 = sub_2474198A8(v34, v35, v33, v31, v30, v32);
    *(_QWORD *)(v0 + 96) = v36;
    swift_bridgeObjectRelease();
    if (!v36)
    {
      swift_retain_n();
      v38 = sub_24741E984();
      v39 = sub_24741EA20();
      if (os_log_type_enabled(v38, v39))
      {
        v40 = swift_slowAlloc();
        v41 = swift_slowAlloc();
        v55 = v41;
        *(_DWORD *)v40 = 136315138;
        v42 = sub_24741E954();
        *(_QWORD *)(v40 + 4) = sub_24741A7C0(v42, v43, &v55);
        swift_bridgeObjectRelease();
        swift_release_n();
        _os_log_impl(&dword_247414000, v38, v39, "No consecutive turns after turn %s.", (uint8_t *)v40, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24957A1BC](v41, -1, -1);
        MEMORY[0x24957A1BC](v40, -1, -1);
        swift_release();
      }
      else
      {
        swift_release_n();
      }

      goto LABEL_17;
    }
    if (!(v36 >> 62))
    {
      v37 = *(_QWORD *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
      *(_QWORD *)(v0 + 104) = v37;
      if (v37)
        goto LABEL_30;
LABEL_26:
      swift_bridgeObjectRelease();
      swift_release();
LABEL_17:
      v27 = *(_QWORD *)(v0 + 88);
      if (v27 == *(_QWORD *)(v0 + 56))
        goto LABEL_52;
      continue;
    }
    break;
  }
  swift_bridgeObjectRetain();
  v37 = sub_24741EABC();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 104) = v37;
  if (!v37)
    goto LABEL_26;
LABEL_30:
  if (v37 >= 1)
  {
    v44 = 0;
    goto LABEL_33;
  }
LABEL_55:
  __break(1u);
}

uint64_t sub_2474198A8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t result;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  unint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t (*v48)(char *, uint64_t, uint64_t);
  int v49;
  uint64_t v50;
  uint64_t (*v51)(char *, char *, uint64_t);
  uint64_t v52;
  uint64_t v54;
  char v55;
  void (*v56)(uint64_t, uint64_t);
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;

  v62 = a6;
  v64 = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3260);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v63 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v57 - v12;
  v14 = sub_24741E804();
  v15 = *(_QWORD **)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v57 - v18;
  v20 = a4 >> 62;
  if (a4 >> 62)
  {
    v61 = v17;
    swift_bridgeObjectRetain();
    v21 = sub_24741EABC();
    swift_bridgeObjectRelease();
    v17 = v61;
    if (!v21)
      return v21;
  }
  else
  {
    v21 = *(_QWORD *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v21)
      return v21;
  }
  if (!*(_QWORD *)(a3 + 16))
    return 0;
  v61 = v17;
  swift_bridgeObjectRetain();
  v22 = sub_24741AE10(a1, a2);
  if ((v23 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v24 = *(_QWORD *)(*(_QWORD *)(a3 + 56) + 8 * v22);
  swift_bridgeObjectRelease();
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((v24 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v24 < *(_QWORD *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v25 = *(_QWORD *)(a4 + 8 * v24 + 32);
      swift_retain();
      if ((sub_24741E930() & 1) != 0)
        goto LABEL_9;
      goto LABEL_74;
    }
    __break(1u);
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  v25 = MEMORY[0x249579D18](v24, a4);
  if ((sub_24741E930() & 1) == 0)
  {
LABEL_74:
    swift_release();
    return 0;
  }
LABEL_9:
  v59 = v25;
  v26 = v24 + 1;
  if (__OFADD__(v24, 1))
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  if (v21 < v26)
  {
LABEL_81:
    __break(1u);
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  if (v20)
  {
    swift_bridgeObjectRetain();
    v27 = sub_24741EABC();
  }
  else
  {
    v27 = *(_QWORD *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  if (v27 < v26)
    goto LABEL_82;
  if (v26 < 0)
  {
LABEL_83:
    __break(1u);
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  if (v20)
  {
    swift_bridgeObjectRetain();
    v28 = sub_24741EABC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v28 = *(_QWORD *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v28 < v21)
    goto LABEL_84;
  if ((a4 & 0xC000000000000001) != 0 && v26 != v21)
  {
    if (v26 >= (unint64_t)v21)
      goto LABEL_92;
    sub_24741E978();
    v29 = v24 + 1;
    do
    {
      v30 = v29 + 1;
      sub_24741EA5C();
      v29 = v30;
    }
    while (v21 != v30);
  }
  if (v20)
  {
    swift_bridgeObjectRetain();
    sub_24741EAC8();
    v31 = v33;
    v26 = v34;
    v32 = v35;
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v31 = (a4 & 0xFFFFFFFFFFFFFF8) + 32;
    v32 = (2 * v21) | 1;
  }
  a4 = sub_24741B5A4(v31, v26, v32);
  result = swift_unknownObjectRelease();
  v21 = MEMORY[0x24BEE4AF8];
  v65 = MEMORY[0x24BEE4AF8];
  if (!(a4 >> 62))
  {
    v28 = *(_QWORD *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v28 >= 1)
      goto LABEL_31;
LABEL_86:
    swift_bridgeObjectRelease();
    swift_release();
    return v21;
  }
LABEL_85:
  result = sub_24741EABC();
  v28 = result;
  if (result < 1)
    goto LABEL_86;
LABEL_31:
  if ((unint64_t)v21 >> 62)
  {
    swift_bridgeObjectRetain();
    v37 = sub_24741EABC();
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v37 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v37 >= v64)
    goto LABEL_86;
  v60 = a4 & 0xC000000000000001;
  if ((a4 & 0xC000000000000001) != 0)
    goto LABEL_93;
  if (*(_QWORD *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain();
    while (1)
    {
      sub_24741E96C();
      v39 = v38;
      sub_24741E96C();
      v41 = v40;
      swift_release();
      v42 = *(double *)(v62 + 16);
      if (v42 < vabdd_f64(v39, v41))
      {
        swift_bridgeObjectRelease();
        swift_release();
        return MEMORY[0x24BEE4AF8];
      }
      v62 = v28;
      v43 = 0;
      v57 = a4 + 32;
      v58 = a4 & 0xFFFFFFFFFFFFFF8;
      while (1)
      {
        sub_24741E960();
        v48 = (uint64_t (*)(char *, uint64_t, uint64_t))v15[6];
        v49 = v48(v13, 1, v14);
        v50 = (uint64_t)v13;
        if (v49 != 1)
        {
          v51 = (uint64_t (*)(char *, char *, uint64_t))v15[4];
          result = v51(v19, v13, v14);
          if (v60)
          {
            MEMORY[0x249579D18](v43, a4);
          }
          else
          {
            if ((v43 & 0x8000000000000000) != 0)
              goto LABEL_95;
            if (v43 >= *(_QWORD *)(v58 + 16))
              goto LABEL_96;
            swift_retain();
          }
          v28 = (uint64_t)v63;
          sub_24741E960();
          v52 = v28;
          swift_release();
          if (v48((char *)v28, 1, v14) != 1)
          {
            v28 = v61;
            v51((char *)v61, (char *)v52, v14);
            sub_24741B7A4();
            v55 = sub_24741E9A8();
            v56 = (void (*)(uint64_t, uint64_t))v15[1];
            v56(v28, v14);
            v56((uint64_t)v19, v14);
            if ((v55 & 1) == 0)
              goto LABEL_59;
            goto LABEL_51;
          }
          ((void (*)(char *, uint64_t))v15[1])(v19, v14);
          v50 = v28;
        }
        sub_24741B764(v50);
LABEL_51:
        if (v60)
        {
          v21 = MEMORY[0x249579D18](v43, a4);
        }
        else
        {
          if ((v43 & 0x8000000000000000) != 0)
            goto LABEL_90;
          if (v43 >= *(_QWORD *)(v58 + 16))
            goto LABEL_91;
          v21 = *(_QWORD *)(v57 + 8 * v43);
          swift_retain();
        }
        MEMORY[0x249579C94]();
        v28 = *(_QWORD *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if ((unint64_t)v28 >= *(_QWORD *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_24741E9FC();
        sub_24741EA08();
        sub_24741E9F0();
        if (__OFADD__(v43++, 1))
          goto LABEL_79;
LABEL_59:
        if ((uint64_t)v43 >= v62)
        {
          swift_bridgeObjectRelease();
          swift_release();
          return v65;
        }
        v21 = v65;
        if (v65 >> 62)
        {
          swift_bridgeObjectRetain();
          v54 = sub_24741EABC();
          swift_bridgeObjectRelease();
        }
        else
        {
          v54 = *(_QWORD *)((v65 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        if (v54 >= v64)
          goto LABEL_86;
        if (v60)
        {
          v28 = MEMORY[0x249579D18](v43, a4);
          goto LABEL_41;
        }
        if ((v43 & 0x8000000000000000) != 0)
          break;
        if (v43 >= *(_QWORD *)(v58 + 16))
          goto LABEL_89;
        v28 = *(_QWORD *)(v57 + 8 * v43);
        swift_retain();
LABEL_41:
        sub_24741E96C();
        v45 = v44;
        sub_24741E96C();
        v47 = v46;
        swift_release();
        if (v42 < vabdd_f64(v45, v47))
          goto LABEL_86;
      }
      __break(1u);
LABEL_89:
      __break(1u);
LABEL_90:
      __break(1u);
LABEL_91:
      __break(1u);
LABEL_92:
      __break(1u);
LABEL_93:
      MEMORY[0x249579D18](0, a4);
    }
  }
  __break(1u);
LABEL_95:
  __break(1u);
LABEL_96:
  __break(1u);
  return result;
}

uint64_t sub_24741A008(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  return swift_task_switch();
}

uint64_t sub_24741A024()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;

  sub_24741E8F4();
  sub_24741E8E8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3248);
  sub_24741E93C();
  swift_bridgeObjectRelease();
  v1 = *(_QWORD **)(v0 + 16);
  if (v1)
  {
    if (v1[2])
    {
      *(_QWORD *)(v0 + 56) = v1[4];
      *(_QWORD *)(v0 + 64) = v1[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_24741E8E8();
      sub_24741E93C();
      swift_bridgeObjectRelease();
      v2 = *(_QWORD **)(v0 + 24);
      if (v2)
      {
        if (v2[2])
        {
          *(_QWORD *)(v0 + 72) = v2[4];
          *(_QWORD *)(v0 + 80) = v2[5];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v3 = sub_24741E8C4();
          *(_QWORD *)(v0 + 88) = v3;
          *(_QWORD *)(v0 + 96) = *(_QWORD *)(v3 - 8);
          *(_QWORD *)(v0 + 104) = swift_task_alloc();
          v4 = (_QWORD *)swift_task_alloc();
          *(_QWORD *)(v0 + 112) = v4;
          *v4 = v0;
          v4[1] = sub_24741A1D4;
          return sub_24741E8B8();
        }
        swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
  }
  return (*(uint64_t (**)(_QWORD, uint64_t))(v0 + 8))(0, 1);
}

uint64_t sub_24741A1D4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24741A228()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  __int128 v6;

  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v6 = *(_OWORD *)(v0 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3250);
  v3 = swift_allocObject();
  *(_QWORD *)(v0 + 120) = v3;
  *(_OWORD *)(v3 + 16) = xmmword_24741F300;
  *(_OWORD *)(v3 + 32) = v6;
  *(_QWORD *)(v3 + 48) = v2;
  *(_QWORD *)(v3 + 56) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v4;
  *v4 = v0;
  v4[1] = sub_24741A2C0;
  return sub_24741E8AC();
}

uint64_t sub_24741A2C0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

void sub_24741A324()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  double v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 136);
  if (!v1)
  {
    v6 = sub_24741E984();
    v7 = sub_24741EA2C();
    if (os_log_type_enabled(v6, (os_log_type_t)v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_247414000, v6, (os_log_type_t)v7, "Failed to embed turn utterances", v8, 2u);
      MEMORY[0x24957A1BC](v8, -1, -1);
    }
    v10 = *(_QWORD *)(v0 + 96);
    v9 = *(_QWORD *)(v0 + 104);
    v11 = *(_QWORD *)(v0 + 88);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    goto LABEL_12;
  }
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    if (v2 != 1)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v3 = sub_24741E8D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v3 & 1) != 0)
      {
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 88));
        swift_bridgeObjectRelease();
        v4 = 0;
        v5 = 1.0;
LABEL_13:
        swift_task_dealloc();
        (*(void (**)(double, uint64_t))(v0 + 8))(COERCE_DOUBLE(*(_QWORD *)&v5), v4);
        return;
      }
      v12 = sub_24741E984();
      v13 = sub_24741EA2C();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_247414000, v12, v13, "Failed to compute pairwise consine similarity between the utterances.", v14, 2u);
        MEMORY[0x24957A1BC](v14, -1, -1);
      }
      v16 = *(_QWORD *)(v0 + 96);
      v15 = *(_QWORD *)(v0 + 104);
      v17 = *(_QWORD *)(v0 + 88);

      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
      swift_bridgeObjectRelease();
LABEL_12:
      v5 = 0.0;
      v4 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  __break(1u);
}

uint64_t SiriTurnRestatementCalculator.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_logger;
  v2 = sub_24741E99C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_calendar;
  v4 = sub_24741E81C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  return v0;
}

uint64_t SiriTurnRestatementCalculator.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_logger;
  v2 = sub_24741E99C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_calendar;
  v4 = sub_24741E81C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_24741A670(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_24741A680(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_QWORD *sub_24741A6B4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3258);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 + 31;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 6);
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
        if (v10 != a4 || v13 >= &a4[8 * v8 + 4])
          memmove(v13, a4 + 4, v8 << 6);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24741B674(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24741A7C0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_24741A890(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24741B564((uint64_t)v12, *a3);
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
      sub_24741B564((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24741A890(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24741EA44();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_24741AA48(a5, a6);
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
  v8 = sub_24741EA74();
  if (!v8)
  {
    sub_24741EAB0();
    __break(1u);
LABEL_17:
    result = sub_24741EAF8();
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

uint64_t sub_24741AA48(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_24741AADC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_24741ACB4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_24741ACB4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24741AADC(uint64_t a1, unint64_t a2)
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
      v3 = sub_24741AC50(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_24741EA50();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_24741EAB0();
      __break(1u);
LABEL_10:
      v2 = sub_24741E9D8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_24741EAF8();
    __break(1u);
LABEL_14:
    result = sub_24741EAB0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_24741AC50(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3230);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24741ACB4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3230);
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
  result = sub_24741EAF8();
  __break(1u);
  return result;
}

_BYTE **sub_24741AE00(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

unint64_t sub_24741AE10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_24741EB4C();
  sub_24741E9CC();
  v4 = sub_24741EB64();
  return sub_24741B17C(a1, a2, v4);
}

uint64_t sub_24741AE74(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3228);
  v37 = a2;
  v6 = sub_24741EAE0();
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
    sub_24741EB4C();
    sub_24741E9CC();
    result = sub_24741EB64();
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

unint64_t sub_24741B17C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_24741EB04() & 1) == 0)
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
      while (!v14 && (sub_24741EB04() & 1) == 0);
    }
  }
  return v6;
}

void *sub_24741B25C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3228);
  v2 = *v0;
  v3 = sub_24741EAD4();
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

uint64_t sub_24741B408()
{
  return type metadata accessor for SiriTurnRestatementCalculator();
}

uint64_t type metadata accessor for SiriTurnRestatementCalculator()
{
  uint64_t result;

  result = qword_2576A3180;
  if (!qword_2576A3180)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24741B44C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_24741E99C();
  if (v1 <= 0x3F)
  {
    result = sub_24741E81C();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SiriTurnRestatementCalculator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriTurnRestatementCalculator.__allocating_init(logger:bookmarkService:maxSeconds:maxConsecutiveTurns:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24957A144]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
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

uint64_t sub_24741B564(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24741B5A4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = MEMORY[0x24BEE4AF8];
  v6 = MEMORY[0x24BEE4AF8];
  v4 = a3 >> 1;
  if (a3 >> 1 != a2)
  {
    v5 = a2;
    while (v5 < v4)
    {
      swift_retain();
      if ((sub_24741E930() & 1) != 0)
      {
        sub_24741EA80();
        sub_24741EA98();
        sub_24741EAA4();
        result = sub_24741EA8C();
      }
      else
      {
        result = swift_release();
      }
      if (v4 == ++v5)
        return v6;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_24741B674(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + (a1 << 6) + 32;
    v6 = a3 + (v4 << 6);
    if (v5 >= v6 || v5 + (v4 << 6) <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_24741EAF8();
  __break(1u);
  return result;
}

uint64_t sub_24741B764(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3260);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24741B7A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576A3268;
  if (!qword_2576A3268)
  {
    v1 = sub_24741E804();
    result = MEMORY[0x24957A150](MEMORY[0x24BDCEA98], v1);
    atomic_store(result, (unint64_t *)&qword_2576A3268);
  }
  return result;
}

uint64_t SiriTurnRestatementDataRecord.featurizedConversationData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_24741E8A0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t SiriTurnRestatementDataProvider.__allocating_init(bookmarkService:logger:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = swift_allocObject();
  v5 = v4 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementDataProvider_logger;
  v6 = sub_24741E99C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a2, v6);
  *(_QWORD *)(v4 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementDataProvider_bookmarkService) = a1;
  return v4;
}

uint64_t SiriTurnRestatementDataProvider.init(bookmarkService:logger:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  v5 = v2 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementDataProvider_logger;
  v6 = sub_24741E99C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a2, v6);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementDataProvider_bookmarkService) = a1;
  return v2;
}

uint64_t sub_24741B900(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[3] = a1;
  v2[4] = v1;
  v3 = sub_24741E8A0();
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = swift_task_alloc();
  v4 = sub_24741E81C();
  v2[8] = v4;
  v2[9] = *(_QWORD *)(v4 - 8);
  v2[10] = swift_task_alloc();
  v5 = sub_24741E7E0();
  v2[11] = v5;
  v2[12] = *(_QWORD *)(v5 - 8);
  v2[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24741B9B0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v2 = v0[9];
  v1 = v0[10];
  v3 = v0[8];
  sub_24741E8DC();
  sub_24741E810();
  sub_24741E870();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v0[14] = objc_msgSend(objc_allocWithZone((Class)sub_24741E90C()), sel_init);
  v4 = sub_24741E858();
  v0[15] = v4;
  v5 = v4;
  v8 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x24BE2BB58] + MEMORY[0x24BE2BB58]);
  v6 = (_QWORD *)swift_task_alloc();
  v0[16] = v6;
  *v6 = v0;
  v6[1] = sub_24741BAFC;
  return v8(v5);
}

uint64_t sub_24741BAFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  void *v4;

  v3 = *v2;
  v4 = *(void **)(*v2 + 120);
  *(_QWORD *)(v3 + 136) = a1;
  *(_QWORD *)(v3 + 144) = v1;
  swift_task_dealloc();

  return swift_task_switch();
}

uint64_t sub_24741BB6C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  _BOOL4 v3;
  unint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  swift_bridgeObjectRetain_n();
  v1 = sub_24741E984();
  v2 = sub_24741EA20();
  v3 = os_log_type_enabled(v1, v2);
  v4 = *(_QWORD *)(v0 + 136);
  if (v3)
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v5 = 134217984;
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      v6 = sub_24741EABC();
      swift_bridgeObjectRelease();
    }
    else
    {
      v6 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 16) = v6;
    sub_24741EA38();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247414000, v1, v2, "marker: fetched SELF conversations, count=%ld", v5, 0xCu);
    MEMORY[0x24957A1BC](v5, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v7 = *(_QWORD *)(v0 + 104);
  v8 = *(void **)(v0 + 112);
  v9 = *(_QWORD *)(v0 + 88);
  v10 = *(_QWORD *)(v0 + 96);
  v12 = *(_QWORD *)(v0 + 48);
  v11 = *(_QWORD *)(v0 + 56);
  v13 = *(_QWORD *)(v0 + 40);
  v14 = *(_QWORD *)(v0 + 24);
  sub_24741E888();

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v14, v11, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24741BD34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 96);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SiriTurnRestatementDataProvider.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementDataProvider_logger;
  v2 = sub_24741E99C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return v0;
}

uint64_t SiriTurnRestatementDataProvider.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementDataProvider_logger;
  v2 = sub_24741E99C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_24741BE58(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24741BEAC;
  return sub_24741B900(a1);
}

uint64_t sub_24741BEAC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_24741BEF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576A3288;
  if (!qword_2576A3288)
  {
    v1 = type metadata accessor for SiriTurnRestatementDataRecord(255);
    result = MEMORY[0x24957A150](&protocol conformance descriptor for SiriTurnRestatementDataRecord, v1);
    atomic_store(result, (unint64_t *)&qword_2576A3288);
  }
  return result;
}

uint64_t type metadata accessor for SiriTurnRestatementDataRecord(uint64_t a1)
{
  return sub_24741C1EC(a1, qword_2576A32F0);
}

uint64_t initializeBufferWithCopyOfBuffer for SiriTurnRestatementDataRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24741E8A0();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for SiriTurnRestatementDataRecord(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_24741E8A0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for SiriTurnRestatementDataRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24741E8A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for SiriTurnRestatementDataRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24741E8A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for SiriTurnRestatementDataRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24741E8A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for SiriTurnRestatementDataRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24741E8A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTurnRestatementDataRecord()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24741C0E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24741E8A0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SiriTurnRestatementDataRecord()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24741C128(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24741E8A0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_24741C168()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24741E8A0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24741C1D0()
{
  return type metadata accessor for SiriTurnRestatementDataProvider(0);
}

uint64_t type metadata accessor for SiriTurnRestatementDataProvider(uint64_t a1)
{
  return sub_24741C1EC(a1, (uint64_t *)&unk_2576A3350);
}

uint64_t sub_24741C1EC(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24741C220()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24741E99C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SiriTurnRestatementDataProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriTurnRestatementDataProvider.__allocating_init(bookmarkService:logger:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of SiriTurnRestatementDataProvider.loadData()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 104) + *(_QWORD *)(*(_QWORD *)v1 + 104));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_24741BEAC;
  return v6(a1);
}

uint64_t SiriTurnRestatementSELFReporter.__allocating_init(logger:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = objc_msgSend((id)objc_opt_self(), sel_sharedLoggerWithPersistenceConfiguration_, 1);
  v3 = v2 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementSELFReporter_logger;
  v4 = sub_24741E99C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(v3, a1, v4);
  return v2;
}

uint64_t SiriTurnRestatementSELFReporter.init(logger:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v1 + 16) = objc_msgSend((id)objc_opt_self(), sel_sharedLoggerWithPersistenceConfiguration_, 1);
  v3 = v1 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementSELFReporter_logger;
  v4 = sub_24741E99C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(v3, a1, v4);
  return v1;
}

uint64_t SiriTurnRestatementSELFReporter.report(_:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *a1;
  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

uint64_t sub_24741C43C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;

  *(_QWORD *)(v0 + 32) = OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementSELFReporter_logger;
  v1 = sub_24741E984();
  v2 = sub_24741EA20();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_247414000, v1, v2, "Running SiriTurnRestatementSELFReporter", v3, 2u);
    MEMORY[0x24957A1BC](v3, -1, -1);
  }
  v4 = *(_QWORD *)(v0 + 24);

  if (*(_QWORD *)(v4 + 16))
  {
    v5 = sub_24741C7CC(*(_QWORD *)(v0 + 24));
    *(_QWORD *)(v0 + 40) = v5;
    v9 = v5;
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 48) = v10;
    *v10 = v0;
    v10[1] = sub_24741C66C;
    v11 = *(_QWORD *)(v0 + 16);
    v10[15] = v9;
    v10[16] = v11;
    return swift_task_switch();
  }
  else
  {
    v6 = sub_24741E984();
    v7 = sub_24741EA14();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_247414000, v6, v7, "No restatement scores to be reported", v8, 2u);
      MEMORY[0x24957A1BC](v8, -1, -1);
    }

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_24741C66C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24741C6D0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24741C704()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  v1 = sub_24741E984();
  v2 = sub_24741EA2C();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_247414000, v1, v2, "Unable to report event", v3, 2u);
    MEMORY[0x24957A1BC](v3, -1, -1);
  }

  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_24741C7CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  __objc2_prop_list **p_base_props;
  id v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  int v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  int v29;
  char *v30;
  id v31;
  void *v32;
  id v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  id v38;
  void *v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  _BYTE *v44;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  int v59;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3260);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v51 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v52 = (char *)&v46 - v6;
  v7 = sub_24741E804();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v48 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v47 = (char *)&v46 - v11;
  v53 = objc_msgSend(objc_allocWithZone((Class)ODBATCHSiriSchemaProvisionalODBATCHClientEvent), sel_init);
  if (v53)
  {
    v12 = objc_msgSend(objc_allocWithZone((Class)ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReported), sel_init);
    objc_msgSend(v53, sel_setTurnRestatementScoresReported_, v12);

    v13 = *(_QWORD *)(a1 + 16);
    if (v13)
    {
      v54 = v8;
      v50 = v7;
      v46 = v1;
      swift_bridgeObjectRetain();
      v14 = 0;
      p_base_props = (__objc2_prop_list **)(&ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReported__metaData
                                          + 64);
      v49 = a1;
      do
      {
        v17 = *(_QWORD *)(a1 + v14 + 40);
        v18 = *(_QWORD *)(a1 + v14 + 56);
        v57 = *(_QWORD *)(a1 + v14 + 48);
        v19 = *(double *)(a1 + v14 + 64);
        v59 = *(unsigned __int8 *)(a1 + v14 + 72);
        v20 = *(double *)(a1 + v14 + 80);
        v21 = *(unsigned __int8 *)(a1 + v14 + 88);
        v22 = objc_allocWithZone((Class)ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v23 = objc_msgSend(v22, (SEL)p_base_props[242]);
        if (v23)
        {
          v24 = v23;
          v56 = v18;
          v58 = v21;
          v25 = (uint64_t)v52;
          sub_24741E7EC();
          v26 = v54;
          v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v54 + 48);
          v28 = v50;
          v29 = v27(v25, 1, v50);
          v55 = v17;
          if (v29 == 1)
          {
            sub_24741B764(v25);
          }
          else
          {
            v30 = v47;
            (*(void (**)(char *, uint64_t, uint64_t))(v26 + 32))(v47, v25, v28);
            v31 = objc_allocWithZone(MEMORY[0x24BE95C78]);
            v32 = (void *)sub_24741E7F8();
            v33 = objc_msgSend(v31, sel_initWithNSUUID_, v32);

            objc_msgSend(v24, sel_setCurrentTurnId_, v33);
            v34 = v30;
            p_base_props = &ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReported__metaData.base_props;
            (*(void (**)(char *, uint64_t))(v26 + 8))(v34, v28);
          }
          v35 = (uint64_t)v51;
          sub_24741E7EC();
          if (v27(v35, 1, v28) == 1)
          {
            sub_24741B764(v35);
          }
          else
          {
            v36 = v54;
            v37 = v48;
            (*(void (**)(char *, uint64_t, uint64_t))(v54 + 32))(v48, v35, v28);
            v38 = objc_allocWithZone(MEMORY[0x24BE95C78]);
            v39 = (void *)sub_24741E7F8();
            v40 = objc_msgSend(v38, sel_initWithNSUUID_, v39);

            objc_msgSend(v24, sel_setNextTurnId_, v40);
            (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v28);
          }
          a1 = v49;
          if ((v59 & 1) == 0)
            objc_msgSend(v24, sel_setUtteranceRestatementScore_, v19);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v58 & 1) == 0)
            objc_msgSend(v24, sel_setSemanticSimilarityScore_, v20);
          v16 = objc_msgSend(v53, sel_turnRestatementScoresReported);
          objc_msgSend(v16, sel_addTurnRestatementScores_, v24);

        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        v14 += 64;
        --v13;
      }
      while (v13);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v41 = sub_24741E984();
    v42 = sub_24741EA2C();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_247414000, v41, v42, "Error initiating SELF wrapper", v43, 2u);
      MEMORY[0x24957A1BC](v43, -1, -1);
    }

    sub_24741D324();
    swift_allocError();
    *v44 = 1;
    swift_willThrow();
  }
  return v53;
}

uint64_t sub_24741CC94(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 128) = v1;
  return swift_task_switch();
}

uint64_t sub_24741CCAC()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  NSObject *v9;
  uint8_t *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  void *v15;
  uint64_t v16;
  NSObject *v17;

  v1 = objc_msgSend(*(id *)(v0 + 120), sel_wrapAsAnyEvent);
  *(_QWORD *)(v0 + 136) = v1;
  if (v1)
  {
    v2 = v1;
    v3 = v0 + 80;
    v4 = v1;
    v5 = sub_24741E984();
    v6 = sub_24741EA20();
    v17 = v4;
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v7 = 138412290;
      *(_QWORD *)(v0 + 80) = v4;
      v9 = v4;
      sub_24741EA38();
      *v8 = v2;

      _os_log_impl(&dword_247414000, v5, v6, "FBF Shared reporter: store the event %@ and send to server", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3240);
      swift_arrayDestroy();
      MEMORY[0x24957A1BC](v8, -1, -1);
      v10 = v7;
      v3 = v0 + 80;
      MEMORY[0x24957A1BC](v10, -1, -1);
    }
    else
    {

      v5 = v4;
    }

    v15 = *(void **)(*(_QWORD *)(v0 + 128) + 16);
    v16 = sub_24741E9B4();
    *(_QWORD *)(v0 + 144) = v16;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_24741CF64;
    *(_QWORD *)(v0 + 112) = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    *(_QWORD *)(v0 + 88) = 0x40000000;
    *(_QWORD *)(v0 + 96) = sub_24741D088;
    *(_QWORD *)(v0 + 104) = &block_descriptor;
    objc_msgSend(v15, sel_reportSiriInstrumentationEvent_forBundleID_completion_, v17, v16, v3);
    return swift_continuation_await();
  }
  else
  {
    v11 = sub_24741E984();
    v12 = sub_24741EA2C();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_247414000, v11, v12, "Couldn't package event in AnyEvent wrapper.", v13, 2u);
      MEMORY[0x24957A1BC](v13, -1, -1);
    }

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_24741CF64()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 152) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_24741CFC4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 144);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24741CFFC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  _BYTE *v4;

  v1 = *(void **)(v0 + 144);
  v2 = *(void **)(v0 + 152);
  v3 = *(void **)(v0 + 136);
  swift_willThrow();

  sub_24741D324();
  swift_allocError();
  *v4 = 1;
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24741D088(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A34D8);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t SiriTurnRestatementSELFReporter.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementSELFReporter_logger;
  v2 = sub_24741E99C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SiriTurnRestatementSELFReporter.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementSELFReporter_logger;
  v2 = sub_24741E99C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_24741D1A0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24741BEAC;
  v6 = *a1;
  v5[2] = v4;
  v5[3] = v6;
  return swift_task_switch();
}

unint64_t sub_24741D20C()
{
  unint64_t result;

  result = qword_2576A3408;
  if (!qword_2576A3408)
  {
    result = MEMORY[0x24957A150](&protocol conformance descriptor for SiriTurnRestatementResult, &type metadata for SiriTurnRestatementResult);
    atomic_store(result, (unint64_t *)&qword_2576A3408);
  }
  return result;
}

uint64_t sub_24741D250()
{
  return type metadata accessor for SiriTurnRestatementSELFReporter();
}

uint64_t type metadata accessor for SiriTurnRestatementSELFReporter()
{
  uint64_t result;

  result = qword_2576A3440;
  if (!qword_2576A3440)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24741D294()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24741E99C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SiriTurnRestatementSELFReporter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriTurnRestatementSELFReporter.__allocating_init(logger:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

unint64_t sub_24741D324()
{
  unint64_t result;

  result = qword_2576A34D0;
  if (!qword_2576A34D0)
  {
    result = MEMORY[0x24957A150](&protocol conformance descriptor for SiriTurnRestatementError, &type metadata for SiriTurnRestatementError);
    atomic_store(result, (unint64_t *)&qword_2576A34D0);
  }
  return result;
}

void sub_24741D368(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_24741EA38();
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

uint64_t SiriTurnRestatementResult.restatementScores.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriTurnRestatementResult.restatementScores.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*SiriTurnRestatementResult.restatementScores.modify())()
{
  return nullsub_1;
}

uint64_t SiriTurnRestatementResult.eventStreamMetadata.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriTurnRestatementResult.conversationStreamMetadata.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24741D46C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24741D474()
{
  return swift_bridgeObjectRetain();
}

uint64_t initializeBufferWithCopyOfBuffer for TurnRestatementScores(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TurnRestatementScores()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TurnRestatementScores(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TurnRestatementScores(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v5;
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TurnRestatementScores(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for TurnRestatementScores(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 57))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TurnRestatementScores(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 57) = 1;
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
    *(_BYTE *)(result + 57) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TurnRestatementScores()
{
  return &type metadata for TurnRestatementScores;
}

uint64_t destroy for SiriTurnRestatementResult()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s19SiriTurnRestatement25SiriTurnRestatementResultVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SiriTurnRestatementResult(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for SiriTurnRestatementResult(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTurnRestatementResult(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriTurnRestatementResult(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriTurnRestatementResult()
{
  return &type metadata for SiriTurnRestatementResult;
}

BOOL static SiriTurnRestatementError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SiriTurnRestatementError.hash(into:)()
{
  return sub_24741EB58();
}

uint64_t SiriTurnRestatementError.hashValue.getter()
{
  sub_24741EB4C();
  sub_24741EB58();
  return sub_24741EB64();
}

BOOL sub_24741D954(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24741D96C()
{
  sub_24741EB4C();
  sub_24741EB58();
  return sub_24741EB64();
}

uint64_t sub_24741D9B0()
{
  return sub_24741EB58();
}

uint64_t sub_24741D9D8()
{
  sub_24741EB4C();
  sub_24741EB58();
  return sub_24741EB64();
}

uint64_t SiriTurnRestatementPlugin.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  SiriTurnRestatementPlugin.init()();
  return v0;
}

uint64_t SiriTurnRestatementPlugin.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v2 = sub_24741E99C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v30 - v7;
  v34 = v0;
  v9 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement25SiriTurnRestatementPlugin_logger;
  sub_24741E990();
  v10 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v11 = (void *)sub_24741E9B4();
  v12 = objc_msgSend(v10, sel_initWithSuiteName_, v11);

  if (v12)
  {
    v13 = sub_24741E924();
    swift_allocObject();
    v30 = v12;
    v14 = sub_24741E918();
    v32 = v13;
    v33 = MEMORY[0x24BE2BB98];
    v31 = v14;
    v15 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v15(v8, v9, v2);
    sub_24741E87C();
    swift_allocObject();
    v16 = sub_24741E864();
    if (!v1)
    {
      v22 = v16;
      v15(v6, v9, v2);
      type metadata accessor for SiriTurnRestatementDataProvider(0);
      v23 = swift_allocObject();
      v24 = *(void (**)(uint64_t, char *, uint64_t))(v3 + 32);
      v24(v23 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementDataProvider_logger, v6, v2);
      *(_QWORD *)(v23 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementDataProvider_bookmarkService) = v22;
      v21 = v34;
      *(_QWORD *)(v34 + OBJC_IVAR____TtC19SiriTurnRestatement25SiriTurnRestatementPlugin_dataProvider) = v23;
      v15(v6, v9, v2);
      type metadata accessor for SiriTurnRestatementCalculator();
      v25 = swift_allocObject();
      swift_retain_n();
      sub_24741E810();
      v24(v25 + OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_logger, v6, v2);
      *(_QWORD *)(v25 + OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_bookmarkService) = v22;
      *(_QWORD *)(v25 + 16) = 0x404E000000000000;
      *(_QWORD *)(v25 + 24) = 10;
      *(_QWORD *)(v21 + OBJC_IVAR____TtC19SiriTurnRestatement25SiriTurnRestatementPlugin_calculator) = v25;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576A34F8);
      v26 = swift_allocObject();
      *(_OWORD *)(v26 + 16) = xmmword_24741F5B0;
      v15(v6, v9, v2);
      type metadata accessor for SiriTurnRestatementSELFReporter();
      v27 = swift_allocObject();
      *(_QWORD *)(v27 + 16) = objc_msgSend((id)objc_opt_self(), sel_sharedLoggerWithPersistenceConfiguration_, 1);
      v24(v27 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementSELFReporter_logger, v6, v2);
      *(_QWORD *)(v26 + 32) = v27;
      v31 = v26;
      sub_24741E9F0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3500);
      swift_allocObject();
      v31 = sub_24741E840();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3508);
      swift_allocObject();
      v28 = sub_24741E84C();

      *(_QWORD *)(v21 + OBJC_IVAR____TtC19SiriTurnRestatement25SiriTurnRestatementPlugin_reporter) = v28;
      return v21;
    }

  }
  else
  {
    v17 = sub_24741E984();
    v18 = sub_24741EA2C();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_247414000, v17, v18, "Can't get user defaults initialized", v19, 2u);
      MEMORY[0x24957A1BC](v19, -1, -1);
    }

    sub_24741D324();
    swift_allocError();
    *v20 = 0;
    swift_willThrow();
  }
  v21 = v34;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v9, v2);
  type metadata accessor for SiriTurnRestatementPlugin();
  swift_deallocPartialClassInstance();
  return v21;
}

uint64_t type metadata accessor for SiriTurnRestatementPlugin()
{
  uint64_t result;

  result = qword_2576A3590;
  if (!qword_2576A3590)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24741DF3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_24741DF54()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_24741DFB0;
  return sub_24741B900(*(_QWORD *)(v0 + 16));
}

uint64_t sub_24741DFB0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_24741DFF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_24741E014()
{
  uint64_t *v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  v0[5] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_24741E074;
  return SiriTurnRestatementCalculator.doWork(_:)(v0[2], v0[3]);
}

uint64_t sub_24741E074()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_24741E0BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = v1;
  *(_OWORD *)(v2 + 48) = *(_OWORD *)a1;
  *(_QWORD *)(v2 + 64) = *(_QWORD *)(a1 + 16);
  return swift_task_switch();
}

uint64_t sub_24741E0E4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(uint64_t);

  v1 = *(_QWORD *)(v0 + 64);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v0 + 32) = v1;
  v4 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x24BE2B750] + MEMORY[0x24BE2B750]);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v2;
  *v2 = v0;
  v2[1] = sub_24741E168;
  return v4(v0 + 16);
}

uint64_t sub_24741E168()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_24741E1D4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SiriTurnRestatementPlugin.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement25SiriTurnRestatementPlugin_logger;
  v2 = sub_24741E99C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t SiriTurnRestatementPlugin.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement25SiriTurnRestatementPlugin_logger;
  v2 = sub_24741E99C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_24741E2D4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

uint64_t sub_24741E2F0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3[2] = a1;
  v3[3] = a2;
  v3[4] = *v2;
  return swift_task_switch();
}

uint64_t sub_24741E310(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = *v1;
  *(_OWORD *)(v2 + 48) = *(_OWORD *)a1;
  *(_QWORD *)(v2 + 64) = *(_QWORD *)(a1 + 16);
  return swift_task_switch();
}

unint64_t sub_24741E340()
{
  unint64_t result;

  result = qword_2576A3530;
  if (!qword_2576A3530)
  {
    result = MEMORY[0x24957A150](&protocol conformance descriptor for SiriTurnRestatementError, &type metadata for SiriTurnRestatementError);
    atomic_store(result, (unint64_t *)&qword_2576A3530);
  }
  return result;
}

uint64_t sub_24741E384()
{
  return sub_24741E434(&qword_2576A3538, (uint64_t (*)(uint64_t))type metadata accessor for SiriTurnRestatementPlugin, (uint64_t)&protocol conformance descriptor for SiriTurnRestatementPlugin);
}

uint64_t sub_24741E3B0()
{
  return sub_24741E434(&qword_2576A3540, (uint64_t (*)(uint64_t))type metadata accessor for SiriTurnRestatementPlugin, (uint64_t)&protocol conformance descriptor for SiriTurnRestatementPlugin);
}

uint64_t sub_24741E3DC()
{
  return sub_24741E434(qword_2576A3548, (uint64_t (*)(uint64_t))type metadata accessor for SiriTurnRestatementPlugin, (uint64_t)&protocol conformance descriptor for SiriTurnRestatementPlugin);
}

uint64_t sub_24741E408()
{
  return sub_24741E434((unint64_t *)&qword_2576A3288, type metadata accessor for SiriTurnRestatementDataRecord, (uint64_t)&protocol conformance descriptor for SiriTurnRestatementDataRecord);
}

uint64_t sub_24741E434(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24957A150](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriTurnRestatementError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SiriTurnRestatementError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24741E560 + 4 * byte_24741F5C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24741E594 + 4 * byte_24741F5C0[v4]))();
}

uint64_t sub_24741E594(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24741E59C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24741E5A4);
  return result;
}

uint64_t sub_24741E5B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24741E5B8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24741E5BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24741E5C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24741E5D0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24741E5D8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SiriTurnRestatementError()
{
  return &type metadata for SiriTurnRestatementError;
}

uint64_t sub_24741E5F4()
{
  return type metadata accessor for SiriTurnRestatementPlugin();
}

uint64_t sub_24741E5FC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24741E99C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SiriTurnRestatementPlugin()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriTurnRestatementPlugin.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of SiriTurnRestatementPlugin.loadData()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 120) + *(_QWORD *)(*(_QWORD *)v1 + 120));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_24741E7DC;
  return v6(a1);
}

uint64_t dispatch thunk of SiriTurnRestatementPlugin.doWork(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 128) + *(_QWORD *)(*(_QWORD *)v2 + 128));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_24741BEAC;
  return v8(a1, a2);
}

uint64_t dispatch thunk of SiriTurnRestatementPlugin.report(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 136) + *(_QWORD *)(*(_QWORD *)v1 + 136));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_24741E7DC;
  return v6(a1);
}

uint64_t sub_24741E7E0()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_24741E7EC()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_24741E7F8()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_24741E804()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_24741E810()
{
  return MEMORY[0x24BE2B660]();
}

uint64_t sub_24741E81C()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_24741E828()
{
  return MEMORY[0x24BE2B698]();
}

uint64_t sub_24741E834()
{
  return MEMORY[0x24BE2B6B8]();
}

uint64_t sub_24741E840()
{
  return MEMORY[0x24BE2B718]();
}

uint64_t sub_24741E84C()
{
  return MEMORY[0x24BE2B770]();
}

uint64_t sub_24741E858()
{
  return MEMORY[0x24BE2B7E0]();
}

uint64_t sub_24741E864()
{
  return MEMORY[0x24BE2B7F8]();
}

uint64_t sub_24741E870()
{
  return MEMORY[0x24BE2B810]();
}

uint64_t sub_24741E87C()
{
  return MEMORY[0x24BE2B830]();
}

uint64_t sub_24741E888()
{
  return MEMORY[0x24BE2B850]();
}

uint64_t sub_24741E894()
{
  return MEMORY[0x24BE2B858]();
}

uint64_t sub_24741E8A0()
{
  return MEMORY[0x24BE2B860]();
}

uint64_t sub_24741E8AC()
{
  return MEMORY[0x24BEC64B8]();
}

uint64_t sub_24741E8B8()
{
  return MEMORY[0x24BEC64C8]();
}

uint64_t sub_24741E8C4()
{
  return MEMORY[0x24BEC64D8]();
}

uint64_t sub_24741E8D0()
{
  return MEMORY[0x24BEC64E0]();
}

uint64_t sub_24741E8DC()
{
  return MEMORY[0x24BE2B938]();
}

uint64_t sub_24741E8E8()
{
  return MEMORY[0x24BE2B9A8]();
}

uint64_t sub_24741E8F4()
{
  return MEMORY[0x24BE2B9B0]();
}

uint64_t sub_24741E900()
{
  return MEMORY[0x24BE2BB48]();
}

uint64_t sub_24741E90C()
{
  return MEMORY[0x24BE2BB60]();
}

uint64_t sub_24741E918()
{
  return MEMORY[0x24BE2BB88]();
}

uint64_t sub_24741E924()
{
  return MEMORY[0x24BE2BBA8]();
}

uint64_t sub_24741E930()
{
  return MEMORY[0x24BE2BBE0]();
}

uint64_t sub_24741E93C()
{
  return MEMORY[0x24BE2BBE8]();
}

uint64_t sub_24741E948()
{
  return MEMORY[0x24BE2BBF0]();
}

uint64_t sub_24741E954()
{
  return MEMORY[0x24BE2BBF8]();
}

uint64_t sub_24741E960()
{
  return MEMORY[0x24BE2BC00]();
}

uint64_t sub_24741E96C()
{
  return MEMORY[0x24BE2BC08]();
}

uint64_t sub_24741E978()
{
  return MEMORY[0x24BE2BC10]();
}

uint64_t sub_24741E984()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24741E990()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24741E99C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24741E9A8()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_24741E9B4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24741E9C0()
{
  return MEMORY[0x24BE2BD00]();
}

uint64_t sub_24741E9CC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24741E9D8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24741E9E4()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_24741E9F0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_24741E9FC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_24741EA08()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_24741EA14()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_24741EA20()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_24741EA2C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_24741EA38()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24741EA44()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24741EA50()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24741EA5C()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_24741EA68()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_24741EA74()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24741EA80()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_24741EA8C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_24741EA98()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_24741EAA4()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_24741EAB0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_24741EABC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_24741EAC8()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_24741EAD4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_24741EAE0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_24741EAEC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_24741EAF8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24741EB04()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24741EB10()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_24741EB1C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24741EB28()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_24741EB34()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_24741EB40()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_24741EB4C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24741EB58()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24741EB64()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x24BE7AF90]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

