uint64_t _s9SportsKit22SportingEventPlayLevelOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_23034C168 + 4 * byte_230382F67[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_145_0_4 + 4 * byte_230382F62[v4]))();
}

uint64_t sub_23034C1A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23034C1A8);
  return result;
}

uint64_t sub_23034C1B0(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x23034C1B8);
  return OUTLINED_FUNCTION_144_0();
}

ValueMetadata *type metadata accessor for SportingEventCompetitorContainer.CodingKeys()
{
  return &type metadata for SportingEventCompetitorContainer.CodingKeys;
}

ValueMetadata *type metadata accessor for SportingEventCoverageIngestionUpdate.CodingKeys()
{
  return &type metadata for SportingEventCoverageIngestionUpdate.CodingKeys;
}

void type metadata accessor for SportingEventCoverageIngestion.CodingKeys()
{
  OUTLINED_FUNCTION_82();
}

ValueMetadata *type metadata accessor for SportingEventCoverage.CodingKeys()
{
  return &type metadata for SportingEventCoverage.CodingKeys;
}

uint64_t _s9SportsKit32SportingEventCompetitorQualifierOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return OUTLINED_FUNCTION_147_1(-1);
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
      return OUTLINED_FUNCTION_147_1((*a1 | (v4 << 8)) - 2);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return OUTLINED_FUNCTION_147_1((*a1 | (v4 << 8)) - 2);
    }
    v4 = a1[1];
    if (a1[1])
      return OUTLINED_FUNCTION_147_1((*a1 | (v4 << 8)) - 2);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return OUTLINED_FUNCTION_147_1(v8);
}

uint64_t _s9SportsKit32SportingEventCompetitorQualifierOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23034C2D4 + 4 * byte_230382F71[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_145_0_5 + 4 * byte_230382F6C[v4]))();
}

uint64_t sub_23034C30C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23034C314);
  return result;
}

uint64_t sub_23034C31C(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x23034C324);
  return OUTLINED_FUNCTION_144_0();
}

ValueMetadata *type metadata accessor for SportingEventCoverageLastUpdate.CodingKeys()
{
  return &type metadata for SportingEventCoverageLastUpdate.CodingKeys;
}

ValueMetadata *type metadata accessor for SportingEventVersion.CodingKeys()
{
  return &type metadata for SportingEventVersion.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SportingEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF6)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 11;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v5 = v6 - 11;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SportingEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23034C428 + 4 * byte_230382F7B[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_23034C45C + 4 * byte_230382F76[v4]))();
}

uint64_t sub_23034C45C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23034C464(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23034C46CLL);
  return result;
}

uint64_t sub_23034C478(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23034C480);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_23034C484(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23034C48C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SportingEvent.CodingKeys()
{
  return &type metadata for SportingEvent.CodingKeys;
}

uint64_t _s9SportsKit25SportingEventMetadataTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return OUTLINED_FUNCTION_147_1(-1);
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
      return OUTLINED_FUNCTION_147_1((*a1 | (v4 << 8)) - 3);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return OUTLINED_FUNCTION_147_1((*a1 | (v4 << 8)) - 3);
    }
    v4 = a1[1];
    if (a1[1])
      return OUTLINED_FUNCTION_147_1((*a1 | (v4 << 8)) - 3);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return OUTLINED_FUNCTION_147_1(v8);
}

uint64_t _s9SportsKit25SportingEventMetadataTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23034C578 + 4 * byte_230382F85[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_145_0_6 + 4 * byte_230382F80[v4]))();
}

uint64_t sub_23034C5B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23034C5B8);
  return result;
}

uint64_t sub_23034C5C0(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x23034C5C8);
  return OUTLINED_FUNCTION_144_0();
}

ValueMetadata *type metadata accessor for SportingEventLeague.CodingKeys()
{
  return &type metadata for SportingEventLeague.CodingKeys;
}

ValueMetadata *type metadata accessor for SportingEventSport.CodingKeys()
{
  return &type metadata for SportingEventSport.CodingKeys;
}

ValueMetadata *type metadata accessor for SportingEventSchedule.CodingKeys()
{
  return &type metadata for SportingEventSchedule.CodingKeys;
}

ValueMetadata *type metadata accessor for SportingEventDuration.CodingKeys()
{
  return &type metadata for SportingEventDuration.CodingKeys;
}

uint64_t _s9SportsKit23SportingTournamentRoundC10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23034C658 + 4 * byte_230382F8A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23034C678 + 4 * byte_230382F8F[v4]))();
}

_BYTE *sub_23034C658(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23034C678(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23034C680(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23034C688(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23034C690(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23034C698(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SportingEventLocalizedDisplayName.CodingKeys()
{
  return &type metadata for SportingEventLocalizedDisplayName.CodingKeys;
}

unint64_t sub_23034C6B8()
{
  unint64_t result;

  result = qword_255E59B88;
  if (!qword_255E59B88)
  {
    result = MEMORY[0x2348B7C44](&unk_230385024, &type metadata for SportingEventLocalizedDisplayName.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59B88);
  }
  return result;
}

unint64_t sub_23034C6F8()
{
  unint64_t result;

  result = qword_255E59B90;
  if (!qword_255E59B90)
  {
    result = MEMORY[0x2348B7C44](&unk_2303850DC, &type metadata for SportingEventDuration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59B90);
  }
  return result;
}

unint64_t sub_23034C738()
{
  unint64_t result;

  result = qword_255E59B98;
  if (!qword_255E59B98)
  {
    result = MEMORY[0x2348B7C44](&unk_230385194, &type metadata for SportingEventSchedule.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59B98);
  }
  return result;
}

unint64_t sub_23034C778()
{
  unint64_t result;

  result = qword_255E59BA0;
  if (!qword_255E59BA0)
  {
    result = MEMORY[0x2348B7C44](&unk_23038524C, &type metadata for SportingEventSport.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59BA0);
  }
  return result;
}

unint64_t sub_23034C7B8()
{
  unint64_t result;

  result = qword_255E59BA8;
  if (!qword_255E59BA8)
  {
    result = MEMORY[0x2348B7C44](&unk_230385304, &type metadata for SportingEventLeague.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59BA8);
  }
  return result;
}

unint64_t sub_23034C7F8()
{
  unint64_t result;

  result = qword_255E59BB0;
  if (!qword_255E59BB0)
  {
    result = MEMORY[0x2348B7C44](&unk_2303853BC, &type metadata for SportingEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59BB0);
  }
  return result;
}

unint64_t sub_23034C838()
{
  unint64_t result;

  result = qword_255E59BB8;
  if (!qword_255E59BB8)
  {
    result = MEMORY[0x2348B7C44](&unk_230385474, &type metadata for SportingEventVersion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59BB8);
  }
  return result;
}

unint64_t sub_23034C878()
{
  unint64_t result;

  result = qword_255E59BC0;
  if (!qword_255E59BC0)
  {
    result = MEMORY[0x2348B7C44](&unk_23038552C, &type metadata for SportingEventCoverageLastUpdate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59BC0);
  }
  return result;
}

unint64_t sub_23034C8B8()
{
  unint64_t result;

  result = qword_255E59BC8;
  if (!qword_255E59BC8)
  {
    result = MEMORY[0x2348B7C44](&unk_2303855E4, &type metadata for SportingEventCoverage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59BC8);
  }
  return result;
}

unint64_t sub_23034C8F8()
{
  unint64_t result;

  result = qword_255E59BD0;
  if (!qword_255E59BD0)
  {
    result = MEMORY[0x2348B7C44](&unk_2303856D4, &unk_24FE0DCC8);
    atomic_store(result, (unint64_t *)&qword_255E59BD0);
  }
  return result;
}

unint64_t sub_23034C938()
{
  unint64_t result;

  result = qword_255E59BD8;
  if (!qword_255E59BD8)
  {
    result = MEMORY[0x2348B7C44](&unk_23038578C, &type metadata for SportingEventCoverageIngestionUpdate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59BD8);
  }
  return result;
}

unint64_t sub_23034C978()
{
  unint64_t result;

  result = qword_255E59BE0;
  if (!qword_255E59BE0)
  {
    result = MEMORY[0x2348B7C44](&unk_230385844, &type metadata for SportingEventCompetitorContainer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59BE0);
  }
  return result;
}

unint64_t sub_23034C9B8()
{
  unint64_t result;

  result = qword_255E59BE8;
  if (!qword_255E59BE8)
  {
    result = MEMORY[0x2348B7C44](&unk_2303858FC, &type metadata for SportingEventCompetitor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59BE8);
  }
  return result;
}

unint64_t sub_23034C9F8()
{
  unint64_t result;

  result = qword_255E59BF0;
  if (!qword_255E59BF0)
  {
    result = MEMORY[0x2348B7C44](&unk_2303859B4, &type metadata for SportingEventMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59BF0);
  }
  return result;
}

unint64_t sub_23034CA38()
{
  unint64_t result;

  result = qword_255E59BF8;
  if (!qword_255E59BF8)
  {
    result = MEMORY[0x2348B7C44](&unk_230385A6C, &unk_24FE0D9F8);
    atomic_store(result, (unint64_t *)&qword_255E59BF8);
  }
  return result;
}

unint64_t sub_23034CA78()
{
  unint64_t result;

  result = qword_255E59C00;
  if (!qword_255E59C00)
  {
    result = MEMORY[0x2348B7C44](&unk_230385B24, &type metadata for SportingEventParticipant.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59C00);
  }
  return result;
}

unint64_t sub_23034CAB8()
{
  unint64_t result;

  result = qword_255E59C08;
  if (!qword_255E59C08)
  {
    result = MEMORY[0x2348B7C44](&unk_230385BDC, &type metadata for SportingEventParticipantMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59C08);
  }
  return result;
}

unint64_t sub_23034CAF8()
{
  unint64_t result;

  result = qword_255E59C10;
  if (!qword_255E59C10)
  {
    result = MEMORY[0x2348B7C44](&unk_230385C94, &type metadata for SportingEventParticipantMetadataType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59C10);
  }
  return result;
}

unint64_t sub_23034CB38()
{
  unint64_t result;

  result = qword_255E59C18;
  if (!qword_255E59C18)
  {
    result = MEMORY[0x2348B7C44](&unk_230385D4C, &type metadata for SportingEventCompetitorScore.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59C18);
  }
  return result;
}

unint64_t sub_23034CB78()
{
  unint64_t result;

  result = qword_255E59C20;
  if (!qword_255E59C20)
  {
    result = MEMORY[0x2348B7C44](&unk_230385E04, &unk_24FE0D728);
    atomic_store(result, (unint64_t *)&qword_255E59C20);
  }
  return result;
}

unint64_t sub_23034CBB8()
{
  unint64_t result;

  result = qword_255E59C28;
  if (!qword_255E59C28)
  {
    result = MEMORY[0x2348B7C44](&unk_230385EBC, &type metadata for SportingEventCurrentClock.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59C28);
  }
  return result;
}

unint64_t sub_23034CBF8()
{
  unint64_t result;

  result = qword_255E59C30;
  if (!qword_255E59C30)
  {
    result = MEMORY[0x2348B7C44](&unk_230385F74, &type metadata for SportingEventClockTimeContainer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59C30);
  }
  return result;
}

unint64_t sub_23034CC38()
{
  unint64_t result;

  result = qword_255E59C38;
  if (!qword_255E59C38)
  {
    result = MEMORY[0x2348B7C44](&unk_23038602C, &type metadata for SportingEventClockTime.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59C38);
  }
  return result;
}

unint64_t sub_23034CC78()
{
  unint64_t result;

  result = qword_255E59C40;
  if (!qword_255E59C40)
  {
    result = MEMORY[0x2348B7C44](&unk_23038611C, &unk_24FE0D4E8);
    atomic_store(result, (unint64_t *)&qword_255E59C40);
  }
  return result;
}

unint64_t sub_23034CCB8()
{
  unint64_t result;

  result = qword_255E59C48;
  if (!qword_255E59C48)
  {
    result = MEMORY[0x2348B7C44](&unk_2303861D4, &type metadata for SportingEventClockActivityStatus.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59C48);
  }
  return result;
}

unint64_t sub_23034CCF8()
{
  unint64_t result;

  result = qword_255E59C50;
  if (!qword_255E59C50)
  {
    result = MEMORY[0x2348B7C44](&unk_23038628C, &type metadata for SportingEventClockPeriod.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59C50);
  }
  return result;
}

unint64_t sub_23034CD38()
{
  unint64_t result;

  result = qword_255E59C58;
  if (!qword_255E59C58)
  {
    result = MEMORY[0x2348B7C44](&unk_230386344, &type metadata for SportingEventClockRunningState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59C58);
  }
  return result;
}

unint64_t sub_23034CD78()
{
  unint64_t result;

  result = qword_255E59C60;
  if (!qword_255E59C60)
  {
    result = MEMORY[0x2348B7C44](&unk_230386434, &unk_24FE0D2A8);
    atomic_store(result, (unint64_t *)&qword_255E59C60);
  }
  return result;
}

unint64_t sub_23034CDB8()
{
  unint64_t result;

  result = qword_255E59C68;
  if (!qword_255E59C68)
  {
    result = MEMORY[0x2348B7C44](&unk_2303864EC, &type metadata for SportingEventPlayDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59C68);
  }
  return result;
}

unint64_t sub_23034CDF8()
{
  unint64_t result;

  result = qword_255E59C70;
  if (!qword_255E59C70)
  {
    result = MEMORY[0x2348B7C44](&unk_2303865A4, &type metadata for SportingTournament.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59C70);
  }
  return result;
}

unint64_t sub_23034CE38()
{
  unint64_t result;

  result = qword_255E59C78;
  if (!qword_255E59C78)
  {
    result = MEMORY[0x2348B7C44](&unk_23038665C, &type metadata for SportingTournamentRound.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59C78);
  }
  return result;
}

unint64_t sub_23034CE78()
{
  unint64_t result;

  result = qword_255E59C80;
  if (!qword_255E59C80)
  {
    result = MEMORY[0x2348B7C44](&unk_230386714, &type metadata for SportingRound.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59C80);
  }
  return result;
}

unint64_t sub_23034CEB8()
{
  unint64_t result;

  result = qword_255E59C88;
  if (!qword_255E59C88)
  {
    result = MEMORY[0x2348B7C44](&unk_2303867CC, &type metadata for SportingEventImage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59C88);
  }
  return result;
}

unint64_t sub_23034CEF8()
{
  unint64_t result;

  result = qword_255E59C90;
  if (!qword_255E59C90)
  {
    result = MEMORY[0x2348B7C44](&unk_23038673C, &type metadata for SportingEventImage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59C90);
  }
  return result;
}

unint64_t sub_23034CF38()
{
  unint64_t result;

  result = qword_255E59C98;
  if (!qword_255E59C98)
  {
    result = MEMORY[0x2348B7C44](&unk_230386764, &type metadata for SportingEventImage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59C98);
  }
  return result;
}

unint64_t sub_23034CF78()
{
  unint64_t result;

  result = qword_255E59CA0;
  if (!qword_255E59CA0)
  {
    result = MEMORY[0x2348B7C44](&unk_230386684, &type metadata for SportingRound.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59CA0);
  }
  return result;
}

unint64_t sub_23034CFB8()
{
  unint64_t result;

  result = qword_255E59CA8;
  if (!qword_255E59CA8)
  {
    result = MEMORY[0x2348B7C44](&unk_2303866AC, &type metadata for SportingRound.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59CA8);
  }
  return result;
}

unint64_t sub_23034CFF8()
{
  unint64_t result;

  result = qword_255E59CB0;
  if (!qword_255E59CB0)
  {
    result = MEMORY[0x2348B7C44](&unk_2303865CC, &type metadata for SportingTournamentRound.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59CB0);
  }
  return result;
}

unint64_t sub_23034D038()
{
  unint64_t result;

  result = qword_255E59CB8;
  if (!qword_255E59CB8)
  {
    result = MEMORY[0x2348B7C44](&unk_2303865F4, &type metadata for SportingTournamentRound.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59CB8);
  }
  return result;
}

unint64_t sub_23034D078()
{
  unint64_t result;

  result = qword_25405B660;
  if (!qword_25405B660)
  {
    result = MEMORY[0x2348B7C44](&unk_230386514, &type metadata for SportingTournament.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405B660);
  }
  return result;
}

unint64_t sub_23034D0B8()
{
  unint64_t result;

  result = qword_25405B658;
  if (!qword_25405B658)
  {
    result = MEMORY[0x2348B7C44](&unk_23038653C, &type metadata for SportingTournament.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405B658);
  }
  return result;
}

unint64_t sub_23034D0F8()
{
  unint64_t result;

  result = qword_255E59CC0;
  if (!qword_255E59CC0)
  {
    result = MEMORY[0x2348B7C44](&unk_23038645C, &type metadata for SportingEventPlayDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59CC0);
  }
  return result;
}

unint64_t sub_23034D138()
{
  unint64_t result;

  result = qword_255E59CC8;
  if (!qword_255E59CC8)
  {
    result = MEMORY[0x2348B7C44](&unk_230386484, &type metadata for SportingEventPlayDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59CC8);
  }
  return result;
}

unint64_t sub_23034D178()
{
  unint64_t result;

  result = qword_255E59CD0;
  if (!qword_255E59CD0)
  {
    result = MEMORY[0x2348B7C44](&unk_23038636C, &unk_24FE0D2A8);
    atomic_store(result, (unint64_t *)&qword_255E59CD0);
  }
  return result;
}

unint64_t sub_23034D1B8()
{
  unint64_t result;

  result = qword_255E59CD8;
  if (!qword_255E59CD8)
  {
    result = MEMORY[0x2348B7C44](&unk_230386394, &unk_24FE0D2A8);
    atomic_store(result, (unint64_t *)&qword_255E59CD8);
  }
  return result;
}

unint64_t sub_23034D1F8()
{
  unint64_t result;

  result = qword_255E59CE0;
  if (!qword_255E59CE0)
  {
    result = MEMORY[0x2348B7C44](&unk_2303862B4, &type metadata for SportingEventClockRunningState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59CE0);
  }
  return result;
}

unint64_t sub_23034D238()
{
  unint64_t result;

  result = qword_255E59CE8;
  if (!qword_255E59CE8)
  {
    result = MEMORY[0x2348B7C44](&unk_2303862DC, &type metadata for SportingEventClockRunningState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59CE8);
  }
  return result;
}

unint64_t sub_23034D278()
{
  unint64_t result;

  result = qword_25405B848;
  if (!qword_25405B848)
  {
    result = MEMORY[0x2348B7C44](&unk_2303861FC, &type metadata for SportingEventClockPeriod.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405B848);
  }
  return result;
}

unint64_t sub_23034D2B8()
{
  unint64_t result;

  result = qword_25405B840;
  if (!qword_25405B840)
  {
    result = MEMORY[0x2348B7C44](&unk_230386224, &type metadata for SportingEventClockPeriod.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405B840);
  }
  return result;
}

unint64_t sub_23034D2F8()
{
  unint64_t result;

  result = qword_25405BAC8;
  if (!qword_25405BAC8)
  {
    result = MEMORY[0x2348B7C44](&unk_230386144, &type metadata for SportingEventClockActivityStatus.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405BAC8);
  }
  return result;
}

unint64_t sub_23034D338()
{
  unint64_t result;

  result = qword_25405BAC0;
  if (!qword_25405BAC0)
  {
    result = MEMORY[0x2348B7C44](&unk_23038616C, &type metadata for SportingEventClockActivityStatus.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405BAC0);
  }
  return result;
}

unint64_t sub_23034D378()
{
  unint64_t result;

  result = qword_25405B640;
  if (!qword_25405B640)
  {
    result = MEMORY[0x2348B7C44](&unk_230386054, &unk_24FE0D4E8);
    atomic_store(result, (unint64_t *)&qword_25405B640);
  }
  return result;
}

unint64_t sub_23034D3B8()
{
  unint64_t result;

  result = qword_25405B638;
  if (!qword_25405B638)
  {
    result = MEMORY[0x2348B7C44](&unk_23038607C, &unk_24FE0D4E8);
    atomic_store(result, (unint64_t *)&qword_25405B638);
  }
  return result;
}

unint64_t sub_23034D3F8()
{
  unint64_t result;

  result = qword_25405C828;
  if (!qword_25405C828)
  {
    result = MEMORY[0x2348B7C44](&unk_230385F9C, &type metadata for SportingEventClockTime.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405C828);
  }
  return result;
}

unint64_t sub_23034D438()
{
  unint64_t result;

  result = qword_25405C820;
  if (!qword_25405C820)
  {
    result = MEMORY[0x2348B7C44](&unk_230385FC4, &type metadata for SportingEventClockTime.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405C820);
  }
  return result;
}

unint64_t sub_23034D478()
{
  unint64_t result;

  result = qword_25405BA88;
  if (!qword_25405BA88)
  {
    result = MEMORY[0x2348B7C44](&unk_230385EE4, &type metadata for SportingEventClockTimeContainer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405BA88);
  }
  return result;
}

unint64_t sub_23034D4B8()
{
  unint64_t result;

  result = qword_25405BA80;
  if (!qword_25405BA80)
  {
    result = MEMORY[0x2348B7C44](&unk_230385F0C, &type metadata for SportingEventClockTimeContainer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405BA80);
  }
  return result;
}

unint64_t sub_23034D4F8()
{
  unint64_t result;

  result = qword_25405B868;
  if (!qword_25405B868)
  {
    result = MEMORY[0x2348B7C44](&unk_230385E2C, &type metadata for SportingEventCurrentClock.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405B868);
  }
  return result;
}

unint64_t sub_23034D538()
{
  unint64_t result;

  result = qword_25405B860;
  if (!qword_25405B860)
  {
    result = MEMORY[0x2348B7C44](&unk_230385E54, &type metadata for SportingEventCurrentClock.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405B860);
  }
  return result;
}

unint64_t sub_23034D578()
{
  unint64_t result;

  result = qword_25405BB08;
  if (!qword_25405BB08)
  {
    result = MEMORY[0x2348B7C44](&unk_230385D74, &unk_24FE0D728);
    atomic_store(result, (unint64_t *)&qword_25405BB08);
  }
  return result;
}

unint64_t sub_23034D5B8()
{
  unint64_t result;

  result = qword_25405BB00;
  if (!qword_25405BB00)
  {
    result = MEMORY[0x2348B7C44](&unk_230385D9C, &unk_24FE0D728);
    atomic_store(result, (unint64_t *)&qword_25405BB00);
  }
  return result;
}

unint64_t sub_23034D5F8()
{
  unint64_t result;

  result = qword_25405B958;
  if (!qword_25405B958)
  {
    result = MEMORY[0x2348B7C44](&unk_230385CBC, &type metadata for SportingEventCompetitorScore.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405B958);
  }
  return result;
}

unint64_t sub_23034D638()
{
  unint64_t result;

  result = qword_25405B950;
  if (!qword_25405B950)
  {
    result = MEMORY[0x2348B7C44](&unk_230385CE4, &type metadata for SportingEventCompetitorScore.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405B950);
  }
  return result;
}

unint64_t sub_23034D678()
{
  unint64_t result;

  result = qword_255E59CF0;
  if (!qword_255E59CF0)
  {
    result = MEMORY[0x2348B7C44](&unk_230385C04, &type metadata for SportingEventParticipantMetadataType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59CF0);
  }
  return result;
}

unint64_t sub_23034D6B8()
{
  unint64_t result;

  result = qword_255E59CF8;
  if (!qword_255E59CF8)
  {
    result = MEMORY[0x2348B7C44](&unk_230385C2C, &type metadata for SportingEventParticipantMetadataType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59CF8);
  }
  return result;
}

unint64_t sub_23034D6F8()
{
  unint64_t result;

  result = qword_255E59D00;
  if (!qword_255E59D00)
  {
    result = MEMORY[0x2348B7C44](&unk_230385B4C, &type metadata for SportingEventParticipantMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59D00);
  }
  return result;
}

unint64_t sub_23034D738()
{
  unint64_t result;

  result = qword_255E59D08;
  if (!qword_255E59D08)
  {
    result = MEMORY[0x2348B7C44](&unk_230385B74, &type metadata for SportingEventParticipantMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59D08);
  }
  return result;
}

unint64_t sub_23034D778()
{
  unint64_t result;

  result = qword_255E59D10;
  if (!qword_255E59D10)
  {
    result = MEMORY[0x2348B7C44](&unk_230385A94, &type metadata for SportingEventParticipant.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59D10);
  }
  return result;
}

unint64_t sub_23034D7B8()
{
  unint64_t result;

  result = qword_255E59D18;
  if (!qword_255E59D18)
  {
    result = MEMORY[0x2348B7C44](&unk_230385ABC, &type metadata for SportingEventParticipant.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59D18);
  }
  return result;
}

unint64_t sub_23034D7F8()
{
  unint64_t result;

  result = qword_255E59D20;
  if (!qword_255E59D20)
  {
    result = MEMORY[0x2348B7C44](&unk_2303859DC, &unk_24FE0D9F8);
    atomic_store(result, (unint64_t *)&qword_255E59D20);
  }
  return result;
}

unint64_t sub_23034D838()
{
  unint64_t result;

  result = qword_255E59D28;
  if (!qword_255E59D28)
  {
    result = MEMORY[0x2348B7C44](&unk_230385A04, &unk_24FE0D9F8);
    atomic_store(result, (unint64_t *)&qword_255E59D28);
  }
  return result;
}

unint64_t sub_23034D878()
{
  unint64_t result;

  result = qword_255E59D30;
  if (!qword_255E59D30)
  {
    result = MEMORY[0x2348B7C44](&unk_230385924, &type metadata for SportingEventMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59D30);
  }
  return result;
}

unint64_t sub_23034D8B8()
{
  unint64_t result;

  result = qword_255E59D38;
  if (!qword_255E59D38)
  {
    result = MEMORY[0x2348B7C44](&unk_23038594C, &type metadata for SportingEventMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59D38);
  }
  return result;
}

unint64_t sub_23034D8F8()
{
  unint64_t result;

  result = qword_25405B828;
  if (!qword_25405B828)
  {
    result = MEMORY[0x2348B7C44](&unk_23038586C, &type metadata for SportingEventCompetitor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405B828);
  }
  return result;
}

unint64_t sub_23034D938()
{
  unint64_t result;

  result = qword_25405B820;
  if (!qword_25405B820)
  {
    result = MEMORY[0x2348B7C44](&unk_230385894, &type metadata for SportingEventCompetitor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405B820);
  }
  return result;
}

unint64_t sub_23034D978()
{
  unint64_t result;

  result = qword_25405BAE8;
  if (!qword_25405BAE8)
  {
    result = MEMORY[0x2348B7C44](&unk_2303857B4, &type metadata for SportingEventCompetitorContainer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405BAE8);
  }
  return result;
}

unint64_t sub_23034D9B8()
{
  unint64_t result;

  result = qword_25405BAE0;
  if (!qword_25405BAE0)
  {
    result = MEMORY[0x2348B7C44](&unk_2303857DC, &type metadata for SportingEventCompetitorContainer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405BAE0);
  }
  return result;
}

unint64_t sub_23034D9F8()
{
  unint64_t result;

  result = qword_255E59D40;
  if (!qword_255E59D40)
  {
    result = MEMORY[0x2348B7C44](&unk_2303856FC, &type metadata for SportingEventCoverageIngestionUpdate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59D40);
  }
  return result;
}

unint64_t sub_23034DA38()
{
  unint64_t result;

  result = qword_255E59D48;
  if (!qword_255E59D48)
  {
    result = MEMORY[0x2348B7C44](&unk_230385724, &type metadata for SportingEventCoverageIngestionUpdate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59D48);
  }
  return result;
}

unint64_t sub_23034DA78()
{
  unint64_t result;

  result = qword_25405BA68;
  if (!qword_25405BA68)
  {
    result = MEMORY[0x2348B7C44](&unk_23038560C, &unk_24FE0DCC8);
    atomic_store(result, (unint64_t *)&qword_25405BA68);
  }
  return result;
}

unint64_t sub_23034DAB8()
{
  unint64_t result;

  result = qword_25405BA60;
  if (!qword_25405BA60)
  {
    result = MEMORY[0x2348B7C44](&unk_230385634, &unk_24FE0DCC8);
    atomic_store(result, (unint64_t *)&qword_25405BA60);
  }
  return result;
}

unint64_t sub_23034DAF8()
{
  unint64_t result;

  result = qword_25405B730;
  if (!qword_25405B730)
  {
    result = MEMORY[0x2348B7C44](&unk_230385554, &type metadata for SportingEventCoverage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405B730);
  }
  return result;
}

unint64_t sub_23034DB38()
{
  unint64_t result;

  result = qword_25405B728;
  if (!qword_25405B728)
  {
    result = MEMORY[0x2348B7C44](&unk_23038557C, &type metadata for SportingEventCoverage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405B728);
  }
  return result;
}

unint64_t sub_23034DB78()
{
  unint64_t result;

  result = qword_25405BAA8;
  if (!qword_25405BAA8)
  {
    result = MEMORY[0x2348B7C44](&unk_23038549C, &type metadata for SportingEventCoverageLastUpdate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405BAA8);
  }
  return result;
}

unint64_t sub_23034DBB8()
{
  unint64_t result;

  result = qword_25405BAA0;
  if (!qword_25405BAA0)
  {
    result = MEMORY[0x2348B7C44](&unk_2303854C4, &type metadata for SportingEventCoverageLastUpdate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405BAA0);
  }
  return result;
}

unint64_t sub_23034DBF8()
{
  unint64_t result;

  result = qword_255E59D50;
  if (!qword_255E59D50)
  {
    result = MEMORY[0x2348B7C44](&unk_2303853E4, &type metadata for SportingEventVersion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59D50);
  }
  return result;
}

unint64_t sub_23034DC38()
{
  unint64_t result;

  result = qword_255E59D58;
  if (!qword_255E59D58)
  {
    result = MEMORY[0x2348B7C44](&unk_23038540C, &type metadata for SportingEventVersion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59D58);
  }
  return result;
}

unint64_t sub_23034DC78()
{
  unint64_t result;

  result = qword_25405B5A0;
  if (!qword_25405B5A0)
  {
    result = MEMORY[0x2348B7C44](&unk_23038532C, &type metadata for SportingEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405B5A0);
  }
  return result;
}

unint64_t sub_23034DCB8()
{
  unint64_t result;

  result = qword_25405B598;
  if (!qword_25405B598)
  {
    result = MEMORY[0x2348B7C44](&unk_230385354, &type metadata for SportingEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405B598);
  }
  return result;
}

unint64_t sub_23034DCF8()
{
  unint64_t result;

  result = qword_25405C980;
  if (!qword_25405C980)
  {
    result = MEMORY[0x2348B7C44](&unk_230385274, &type metadata for SportingEventLeague.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405C980);
  }
  return result;
}

unint64_t sub_23034DD38()
{
  unint64_t result;

  result = qword_25405C978;
  if (!qword_25405C978)
  {
    result = MEMORY[0x2348B7C44](&unk_23038529C, &type metadata for SportingEventLeague.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405C978);
  }
  return result;
}

unint64_t sub_23034DD78()
{
  unint64_t result;

  result = qword_255E59D60;
  if (!qword_255E59D60)
  {
    result = MEMORY[0x2348B7C44](&unk_2303851BC, &type metadata for SportingEventSport.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59D60);
  }
  return result;
}

unint64_t sub_23034DDB8()
{
  unint64_t result;

  result = qword_255E59D68;
  if (!qword_255E59D68)
  {
    result = MEMORY[0x2348B7C44](&unk_2303851E4, &type metadata for SportingEventSport.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59D68);
  }
  return result;
}

unint64_t sub_23034DDF8()
{
  unint64_t result;

  result = qword_25405C8C0;
  if (!qword_25405C8C0)
  {
    result = MEMORY[0x2348B7C44](&unk_230385104, &type metadata for SportingEventSchedule.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405C8C0);
  }
  return result;
}

unint64_t sub_23034DE38()
{
  unint64_t result;

  result = qword_25405C9B0;
  if (!qword_25405C9B0)
  {
    result = MEMORY[0x2348B7C44](&unk_23038512C, &type metadata for SportingEventSchedule.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405C9B0);
  }
  return result;
}

unint64_t sub_23034DE78()
{
  unint64_t result;

  result = qword_255E59D70;
  if (!qword_255E59D70)
  {
    result = MEMORY[0x2348B7C44](&unk_23038504C, &type metadata for SportingEventDuration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59D70);
  }
  return result;
}

unint64_t sub_23034DEB8()
{
  unint64_t result;

  result = qword_255E59D78;
  if (!qword_255E59D78)
  {
    result = MEMORY[0x2348B7C44](&unk_230385074, &type metadata for SportingEventDuration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59D78);
  }
  return result;
}

unint64_t sub_23034DEF8()
{
  unint64_t result;

  result = qword_255E59D80;
  if (!qword_255E59D80)
  {
    result = MEMORY[0x2348B7C44](&unk_230384F94, &type metadata for SportingEventLocalizedDisplayName.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59D80);
  }
  return result;
}

unint64_t sub_23034DF38()
{
  unint64_t result;

  result = qword_255E59D88;
  if (!qword_255E59D88)
  {
    result = MEMORY[0x2348B7C44](&unk_230384FBC, &type metadata for SportingEventLocalizedDisplayName.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59D88);
  }
  return result;
}

unint64_t sub_23034DF74()
{
  unint64_t result;

  result = qword_255E59D90;
  if (!qword_255E59D90)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportingEventPlayAnnotation, &type metadata for SportingEventPlayAnnotation);
    atomic_store(result, (unint64_t *)&qword_255E59D90);
  }
  return result;
}

unint64_t sub_23034DFB0()
{
  unint64_t result;

  result = qword_255E59D98;
  if (!qword_255E59D98)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportingEventPlayDescriptor.DescriptorType, &type metadata for SportingEventPlayDescriptor.DescriptorType);
    atomic_store(result, (unint64_t *)&qword_255E59D98);
  }
  return result;
}

unint64_t sub_23034DFEC()
{
  unint64_t result;

  result = qword_255E59DA0;
  if (!qword_255E59DA0)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportingEventPlayLevel, &type metadata for SportingEventPlayLevel);
    atomic_store(result, (unint64_t *)&qword_255E59DA0);
  }
  return result;
}

unint64_t sub_23034E028()
{
  unint64_t result;

  result = qword_25405C5D0;
  if (!qword_25405C5D0)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportingEventClockPeriodSubdivision, &type metadata for SportingEventClockPeriodSubdivision);
    atomic_store(result, (unint64_t *)&qword_25405C5D0);
  }
  return result;
}

unint64_t sub_23034E064()
{
  unint64_t result;

  result = qword_25405C520;
  if (!qword_25405C520)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportingEventClockPeriodType, &type metadata for SportingEventClockPeriodType);
    atomic_store(result, (unint64_t *)&qword_25405C520);
  }
  return result;
}

unint64_t sub_23034E0A0()
{
  unint64_t result;

  result = qword_25405C500;
  if (!qword_25405C500)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportingEventClockBreakType, &type metadata for SportingEventClockBreakType);
    atomic_store(result, (unint64_t *)&qword_25405C500);
  }
  return result;
}

unint64_t sub_23034E0DC()
{
  unint64_t result;

  result = qword_25405B380;
  if (!qword_25405B380)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportingEventClockTimeType, &type metadata for SportingEventClockTimeType);
    atomic_store(result, (unint64_t *)&qword_25405B380);
  }
  return result;
}

unint64_t sub_23034E118()
{
  unint64_t result;

  result = qword_255E59DA8;
  if (!qword_255E59DA8)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportingEventCompetitorWinOutcome, &type metadata for SportingEventCompetitorWinOutcome);
    atomic_store(result, (unint64_t *)&qword_255E59DA8);
  }
  return result;
}

unint64_t sub_23034E154()
{
  unint64_t result;

  result = qword_255E59DB0;
  if (!qword_255E59DB0)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportingEventCompetitorQualifier, &type metadata for SportingEventCompetitorQualifier);
    atomic_store(result, (unint64_t *)&qword_255E59DB0);
  }
  return result;
}

unint64_t sub_23034E190()
{
  unint64_t result;

  result = qword_25405C510;
  if (!qword_25405C510)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportingEventProgressStatus, &type metadata for SportingEventProgressStatus);
    atomic_store(result, (unint64_t *)&qword_25405C510);
  }
  return result;
}

unint64_t sub_23034E1CC()
{
  unint64_t result;

  result = qword_255E59DB8;
  if (!qword_255E59DB8)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for IngestionError, &type metadata for IngestionError);
    atomic_store(result, (unint64_t *)&qword_255E59DB8);
  }
  return result;
}

unint64_t sub_23034E208()
{
  unint64_t result;

  result = qword_25405BB20;
  if (!qword_25405BB20)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportingEventCoverageLastUpdateScope, &type metadata for SportingEventCoverageLastUpdateScope);
    atomic_store(result, (unint64_t *)&qword_25405BB20);
  }
  return result;
}

uint64_t dispatch thunk of SportingEventSchedule.__allocating_init(from:)()
{
  return dispatch thunk of SportingEventSport.__allocating_init(from:)();
}

uint64_t dispatch thunk of SportingEventDuration.__allocating_init(from:)()
{
  return dispatch thunk of SportingEventSport.__allocating_init(from:)();
}

uint64_t dispatch thunk of SportingEventMetadata.__allocating_init(from:)()
{
  return dispatch thunk of SportingEventLeague.__allocating_init(from:)();
}

uint64_t dispatch thunk of SportingEventParticipantMetadata.__allocating_init(from:)()
{
  return dispatch thunk of SportingEventLeague.__allocating_init(from:)();
}

uint64_t dispatch thunk of SportingEventParticipantMetadataType.__allocating_init(from:)()
{
  return dispatch thunk of SportingEventCompetitorScore.__allocating_init(from:)();
}

uint64_t dispatch thunk of SportingEventLocalizedDisplayName.__allocating_init(from:)()
{
  return dispatch thunk of SportingEventCompetitorScore.__allocating_init(from:)();
}

uint64_t dispatch thunk of SportingEventCompetitorScoreEntry.__allocating_init(from:)()
{
  return dispatch thunk of SportingEventLeague.__allocating_init(from:)();
}

uint64_t dispatch thunk of SportingEventClockActivityStatus.__allocating_init(from:)()
{
  return dispatch thunk of SportingEventLeague.__allocating_init(from:)();
}

uint64_t dispatch thunk of SportingEventClockTimeContainer.__allocating_init(from:)()
{
  return dispatch thunk of SportingEventClockRunningState.__allocating_init(from:)();
}

uint64_t dispatch thunk of SportingEventCoverageLastUpdate.__allocating_init(from:)()
{
  return dispatch thunk of SportingEventPlayDescriptor.__allocating_init(from:)();
}

uint64_t dispatch thunk of SportingTournament.__allocating_init(from:)()
{
  return dispatch thunk of SportingEventSport.__allocating_init(from:)();
}

uint64_t dispatch thunk of SportingTournamentRound.__allocating_init(from:)()
{
  return dispatch thunk of SportingEventSport.__allocating_init(from:)();
}

uint64_t dispatch thunk of SportingEventSchedule.encode(to:)()
{
  return dispatch thunk of SportingEventSport.encode(to:)();
}

uint64_t dispatch thunk of SportingEventDuration.encode(to:)()
{
  return dispatch thunk of SportingEventSport.encode(to:)();
}

uint64_t dispatch thunk of SportingEventMetadata.encode(to:)()
{
  return dispatch thunk of SportingEventLeague.encode(to:)();
}

uint64_t dispatch thunk of SportingEventParticipantMetadata.encode(to:)()
{
  return dispatch thunk of SportingEventLeague.encode(to:)();
}

uint64_t dispatch thunk of SportingEventParticipantMetadataType.encode(to:)()
{
  return dispatch thunk of SportingEventCompetitorScore.encode(to:)();
}

uint64_t dispatch thunk of SportingEventLocalizedDisplayName.encode(to:)()
{
  return dispatch thunk of SportingEventCompetitorScore.encode(to:)();
}

uint64_t dispatch thunk of SportingEventCompetitorScoreEntry.encode(to:)()
{
  return dispatch thunk of SportingEventCoverage.encode(to:)();
}

uint64_t dispatch thunk of SportingEventCoverageLastUpdate.encode(to:)()
{
  return dispatch thunk of SportingEventCurrentClock.encode(to:)();
}

uint64_t dispatch thunk of SportingEventCoverageIngestionUpdate.encode(to:)()
{
  return dispatch thunk of SportingEventClockTimeContainer.encode(to:)();
}

uint64_t dispatch thunk of SportingEventCompetitor.encode(to:)()
{
  return dispatch thunk of SportingEventClock.encode(to:)();
}

uint64_t dispatch thunk of SportingEventClockActivityStatus.encode(to:)()
{
  return dispatch thunk of SportingEventLeague.encode(to:)();
}

uint64_t dispatch thunk of SportingTournament.encode(to:)()
{
  return dispatch thunk of SportingEventSport.encode(to:)();
}

uint64_t dispatch thunk of SportingTournamentRound.encode(to:)()
{
  return dispatch thunk of SportingEventSport.encode(to:)();
}

uint64_t OUTLINED_FUNCTION_1_10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + v1) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_8_8()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_17_10@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v4 = v3 + a3;
  *(_QWORD *)v4 = result;
  *(_BYTE *)(v4 + 8) = a2 & 1;
  return result;
}

void OUTLINED_FUNCTION_18_7(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void *v3;

  v3 = *(void **)(v2 + a2);
  *(_QWORD *)(v2 + a2) = a1;

}

uint64_t OUTLINED_FUNCTION_21_5(_QWORD *a1)
{
  uint64_t v1;

  __swift_project_boxed_opaque_existential_1(a1, v1);
  return sub_23037AE98();
}

uint64_t OUTLINED_FUNCTION_22_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_25_11@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_27_6()
{
  return sub_23037AFB8();
}

void OUTLINED_FUNCTION_28_9(unint64_t *a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t *v4;

  sub_230349928(a1, v4, a3, a4);
}

uint64_t OUTLINED_FUNCTION_37_6()
{
  return sub_23037AD78();
}

uint64_t OUTLINED_FUNCTION_41_7()
{
  return swift_deallocPartialClassInstance();
}

uint64_t OUTLINED_FUNCTION_42_4()
{
  return sub_23037A9E8();
}

uint64_t OUTLINED_FUNCTION_43_7()
{
  return sub_23037A9E8();
}

uint64_t OUTLINED_FUNCTION_45_4(uint64_t a1)
{
  uint64_t v1;
  _BYTE *v2;
  char v3;

  __swift_destroy_boxed_opaque_existential_1(a1);
  *v2 = v3;
  return __swift_destroy_boxed_opaque_existential_1(v1);
}

uint64_t OUTLINED_FUNCTION_50_5()
{
  return sub_23037AFD0();
}

uint64_t OUTLINED_FUNCTION_54_4()
{
  return sub_23037AD78();
}

void OUTLINED_FUNCTION_57_5()
{
  JUMPOUT(0x2348B72B4);
}

void OUTLINED_FUNCTION_58_4()
{
  JUMPOUT(0x2348B72B4);
}

uint64_t OUTLINED_FUNCTION_59_4()
{
  return sub_23037AD78();
}

uint64_t OUTLINED_FUNCTION_62_5()
{
  return sub_23037AC94();
}

uint64_t OUTLINED_FUNCTION_63_6()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_64_4(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = *(_BYTE *)(v2 + v1);
}

uint64_t OUTLINED_FUNCTION_68_2()
{
  return sub_23037ACDC();
}

uint64_t OUTLINED_FUNCTION_69_4@<X0>(uint64_t a1@<X8>)
{
  return *(_QWORD *)a1;
}

_QWORD *OUTLINED_FUNCTION_70_3(_QWORD *a1)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

uint64_t OUTLINED_FUNCTION_71_3()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_72_5()
{
  return sub_23037AE14();
}

uint64_t OUTLINED_FUNCTION_75_2@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_80_2()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_81_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_83_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_86_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_92_2()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_93_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_98_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_99_2@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 120))();
}

void OUTLINED_FUNCTION_101_2(id a1)
{

}

unint64_t OUTLINED_FUNCTION_105()
{
  return 0xD000000000000013;
}

uint64_t OUTLINED_FUNCTION_110_2()
{
  return 0;
}

id OUTLINED_FUNCTION_111_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(id *)(v1 + a1);
}

id OUTLINED_FUNCTION_112_0(uint64_t a1, const char *a2)
{
  uint64_t v2;

  return objc_msgSendSuper2((objc_super *)(v2 - 104), a2);
}

void OUTLINED_FUNCTION_115_1()
{
  void *v0;

}

void OUTLINED_FUNCTION_116_1()
{
  void *v0;

}

void OUTLINED_FUNCTION_117_1()
{
  void *v0;

}

id OUTLINED_FUNCTION_118_1()
{
  uint64_t v0;

  return *(id *)(v0 + 32);
}

uint64_t OUTLINED_FUNCTION_119_1()
{
  return swift_bridgeObjectRetain_n();
}

id OUTLINED_FUNCTION_120_1()
{
  uint64_t v0;

  return *(id *)(v0 + 32);
}

uint64_t OUTLINED_FUNCTION_123_0()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 192) + 8))(*(_QWORD *)(v0 - 184), *(_QWORD *)(v0 - 200));
}

void OUTLINED_FUNCTION_127_1(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 8);
  *(_QWORD *)(v1 - 80) = v2;
  *(_BYTE *)(v1 - 72) = v3;
  *(_BYTE *)(v1 - 81) = 1;
}

uint64_t OUTLINED_FUNCTION_128_1()
{
  uint64_t v0;

  return sub_2302E00E4(v0 - 144, v0 - 184);
}

uint64_t OUTLINED_FUNCTION_129_1()
{
  return 0x69746E756F437369;
}

uint64_t OUTLINED_FUNCTION_131_1@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 96))();
}

uint64_t OUTLINED_FUNCTION_134_0()
{
  return sub_23037A9E8();
}

uint64_t OUTLINED_FUNCTION_136_0()
{
  return 0x6567617265766F63;
}

uint64_t OUTLINED_FUNCTION_140_0()
{
  return 0x7470697263736564;
}

void OUTLINED_FUNCTION_141_1(char a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v2 + v1) = a1;
}

uint64_t OUTLINED_FUNCTION_142_0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_143_1(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

_BYTE *OUTLINED_FUNCTION_144_0@<X0>(_BYTE *result@<X0>, char a2@<W8>)
{
  *result = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_145_0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_146_0()
{
  return 0x53676E696E6E7572;
}

uint64_t OUTLINED_FUNCTION_147_1@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_148_1()
{
  return 0x636573696C6C696DLL;
}

void OUTLINED_FUNCTION_150_0(uint64_t a1@<X8>)
{
  uint64_t v1;

}

void OUTLINED_FUNCTION_151_0(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)(v1 + a1);
  v4 = *v3;
  LOBYTE(v3) = *((_BYTE *)v3 + 8);
  *(_QWORD *)(v2 - 96) = v4;
  *(_BYTE *)(v2 - 88) = (_BYTE)v3;
}

uint64_t OUTLINED_FUNCTION_152_1()
{
  return 0x7069636974726170;
}

uint64_t OUTLINED_FUNCTION_153_1()
{
  return sub_23037AD78();
}

uint64_t OUTLINED_FUNCTION_154_0()
{
  return sub_23037AD3C();
}

uint64_t OUTLINED_FUNCTION_161_1()
{
  return sub_23037AF88();
}

uint64_t OUTLINED_FUNCTION_162_0()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v0 - 104));
}

uint64_t OUTLINED_FUNCTION_166_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 8))(v0, *(_QWORD *)(v2 - 128));
}

uint64_t OUTLINED_FUNCTION_167_0()
{
  return sub_23037AD6C();
}

uint64_t OUTLINED_FUNCTION_168_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  return sub_2303292B4(a1, (uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_169_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_171_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_174_0()
{
  return sub_23037A9E8();
}

uint64_t OUTLINED_FUNCTION_175_0()
{
  return sub_23037A9E8();
}

void OUTLINED_FUNCTION_181_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_182_0()
{
  return sub_23037AE08();
}

uint64_t OUTLINED_FUNCTION_184_0()
{
  return sub_23037AE38();
}

uint64_t OUTLINED_FUNCTION_185_0()
{
  return sub_23037A64C();
}

uint64_t OUTLINED_FUNCTION_188_0()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0 - 144);
}

void OUTLINED_FUNCTION_190_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 2;
}

void OUTLINED_FUNCTION_191_0(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 80) = *(_QWORD *)(v1 + a1);
  *(_BYTE *)(v2 - 81) = 7;
}

void OUTLINED_FUNCTION_192_0(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 80) = *(_QWORD *)(v1 + a1);
  *(_BYTE *)(v2 - 81) = 6;
}

void OUTLINED_FUNCTION_193_0(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)(v1 + a1);
  *v2 = 0;
  v2[1] = 0;
}

void OUTLINED_FUNCTION_195_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 4;
}

uint64_t OUTLINED_FUNCTION_196_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0xD8))();
}

uint64_t OUTLINED_FUNCTION_197_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0xB0))();
}

uint64_t OUTLINED_FUNCTION_198_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0xF8))();
}

uint64_t OUTLINED_FUNCTION_199_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0x68))();
}

uint64_t OUTLINED_FUNCTION_200_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0xF0))();
}

uint64_t OUTLINED_FUNCTION_201_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0xC8))();
}

uint64_t OUTLINED_FUNCTION_202_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0xC0))();
}

uint64_t OUTLINED_FUNCTION_203_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0x110))();
}

uint64_t OUTLINED_FUNCTION_204_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0xE0))();
}

unint64_t OUTLINED_FUNCTION_205_0()
{
  return sub_230323C58();
}

uint64_t OUTLINED_FUNCTION_209_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_211_0()
{
  return sub_23037A64C();
}

uint64_t OUTLINED_FUNCTION_212_0()
{
  return sub_23037AC94();
}

uint64_t OUTLINED_FUNCTION_216_0()
{
  return sub_23037AD00();
}

uint64_t OUTLINED_FUNCTION_217_0(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)v2 = a1;
  *(_BYTE *)(v2 + 8) = a2 & 1;
  *(_BYTE *)(v3 - 72) = 2;
  return v3 - 72;
}

uint64_t OUTLINED_FUNCTION_218_0()
{
  return 0x706D617473;
}

uint64_t OUTLINED_FUNCTION_219()
{
  return 0x6B636F6C63;
}

id OUTLINED_FUNCTION_220_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(id *)(v1 + a1);
}

unint64_t OUTLINED_FUNCTION_222_0(uint64_t a1)
{
  return a1 & 0xFFFF00000000FFFFLL | 0x646F69720000;
}

uint64_t OUTLINED_FUNCTION_223()
{
  return 0x736C6576656CLL;
}

void OUTLINED_FUNCTION_224(uint64_t a1)
{
  sub_230320C58(a1);
}

uint64_t OUTLINED_FUNCTION_225()
{
  return 0x73646E6F636573;
}

void OUTLINED_FUNCTION_227(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v3 = *(void **)(v2 + v1);
  *(_QWORD *)(v2 + v1) = a1;

}

uint64_t OUTLINED_FUNCTION_228()
{
  return sub_23037AD78();
}

uint64_t OUTLINED_FUNCTION_229@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 65) = a1;
  return sub_23037AD48();
}

uint64_t OUTLINED_FUNCTION_230()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 168) + 8))(v0, *(_QWORD *)(v1 - 176));
}

uint64_t OUTLINED_FUNCTION_233()
{
  return sub_23037AD30();
}

uint64_t OUTLINED_FUNCTION_234()
{
  return sub_23037AD48();
}

uint64_t OUTLINED_FUNCTION_237()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_239()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_240()
{
  sub_230332150();
}

id OUTLINED_FUNCTION_241()
{
  uint64_t v0;
  uint64_t v1;

  return *(id *)(v0 + 8 * v1);
}

id OUTLINED_FUNCTION_242()
{
  uint64_t v0;
  uint64_t v1;

  return *(id *)(v0 + 8 * v1);
}

uint64_t OUTLINED_FUNCTION_243()
{
  uint64_t v0;

  return sub_230330184(0, (v0 & 0xC000000000000001) == 0, v0);
}

uint64_t OUTLINED_FUNCTION_244(uint64_t a1)
{
  return sub_230320E28(a1);
}

uint64_t OUTLINED_FUNCTION_245()
{
  return sub_23037A64C();
}

uint64_t OUTLINED_FUNCTION_246(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  return sub_2303292FC((uint64_t)va);
}

unint64_t OUTLINED_FUNCTION_247()
{
  return sub_23032933C();
}

void OUTLINED_FUNCTION_248()
{
  sub_230331F58();
}

uint64_t OUTLINED_FUNCTION_249@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_250(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_251()
{
  uint64_t v0;

  return v0 - 184;
}

uint64_t OUTLINED_FUNCTION_253()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 216));
}

void OUTLINED_FUNCTION_255(uint64_t a1@<X0>, uint64_t a2@<X8>)
{

}

void OUTLINED_FUNCTION_256(char a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = v2 + v1;
  *(_QWORD *)v3 = 0;
  *(_BYTE *)(v3 + 8) = a1;
}

uint64_t OUTLINED_FUNCTION_257()
{
  return sub_23037A670();
}

void OUTLINED_FUNCTION_258(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 80) = a1;
  *(_BYTE *)(v1 - 81) = 3;
}

void OUTLINED_FUNCTION_260(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 96) = *(_QWORD *)(v1 + a1);
}

void OUTLINED_FUNCTION_261(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)(v1 + a1);
  v4 = *v3;
  LOBYTE(v3) = *((_BYTE *)v3 + 8);
  *(_QWORD *)(v2 - 80) = v4;
  *(_BYTE *)(v2 - 72) = (_BYTE)v3;
}

uint64_t OUTLINED_FUNCTION_264@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

void OUTLINED_FUNCTION_265(uint64_t a1@<X8>)
{
  uint64_t v1;
  char *v2;

  *(_QWORD *)&v2[v1] = a1;

}

void OUTLINED_FUNCTION_266()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 81) = 4;
}

void OUTLINED_FUNCTION_267(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 72) = a1;
  *(_BYTE *)(v1 - 73) = 1;
}

void OUTLINED_FUNCTION_268(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 72) = *(_QWORD *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_269@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

void OUTLINED_FUNCTION_270()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 3;
}

uint64_t OUTLINED_FUNCTION_272@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 65) = a1;
  return sub_23037AD90();
}

uint64_t OUTLINED_FUNCTION_273()
{
  uint64_t v0;

  return v0;
}

unint64_t OUTLINED_FUNCTION_278()
{
  return sub_2303486C8();
}

__n128 OUTLINED_FUNCTION_279@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  __n128 result;

  result = *(__n128 *)(v1 + a1);
  *(__n128 *)(v2 - 80) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_280()
{
  uint64_t v0;

  return v0;
}

unint64_t OUTLINED_FUNCTION_281(uint64_t a1)
{
  char v1;

  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

void OUTLINED_FUNCTION_282()
{
  void *v0;

}

id OUTLINED_FUNCTION_285()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_286()
{
  char v0;
  uint64_t v1;
  uint64_t v2;

  if (v0)
    v2 = 1;
  else
    v2 = 0;
  return sub_230330184(0, v2, v1);
}

uint64_t OUTLINED_FUNCTION_287()
{
  char v0;
  uint64_t v1;
  uint64_t v2;

  if (v0)
    v2 = 1;
  else
    v2 = 0;
  return sub_230330184(0, v2, v1);
}

void OUTLINED_FUNCTION_290(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)(v1 + a1);
  v4 = *v3;
  LOBYTE(v3) = *((_BYTE *)v3 + 8);
  *(_QWORD *)(v2 - 96) = v4;
  *(_BYTE *)(v2 - 88) = (_BYTE)v3;
}

void OUTLINED_FUNCTION_291(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)(v1 + a1);
  v4 = *v3;
  LOBYTE(v3) = *((_BYTE *)v3 + 8);
  *(_QWORD *)(v2 - 80) = v4;
  *(_BYTE *)(v2 - 72) = (_BYTE)v3;
}

uint64_t OUTLINED_FUNCTION_292(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t OUTLINED_FUNCTION_293()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v0 - 208));
}

unsigned __int8 *OUTLINED_FUNCTION_295(unsigned __int8 *a1, uint64_t a2)
{
  return sub_23034741C(a1, a2, 10);
}

uint64_t OUTLINED_FUNCTION_296()
{
  uint64_t v0;

  return v0 - 65;
}

void OUTLINED_FUNCTION_297(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + a1;
  *(_QWORD *)v2 = 0;
  *(_BYTE *)(v2 + 8) = 1;
}

uint64_t OUTLINED_FUNCTION_298()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_299()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 0;
  return v0 - 65;
}

uint64_t OUTLINED_FUNCTION_302()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 176);
}

void OUTLINED_FUNCTION_303(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 80) = *(_QWORD *)(v1 + a1);
  *(_BYTE *)(v2 - 81) = 8;
}

id OUTLINED_FUNCTION_304()
{
  uint64_t v0;
  uint64_t v1;

  return *(id *)(v0 + 8 * v1);
}

uint64_t OUTLINED_FUNCTION_305()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 72) = 0;
  return v0 - 72;
}

uint64_t OUTLINED_FUNCTION_306()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 72) = 0;
  return v0 - 72;
}

uint64_t OUTLINED_FUNCTION_307()
{
  return 0x697461746F6E6E61;
}

void OUTLINED_FUNCTION_308()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 7;
}

void OUTLINED_FUNCTION_309()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = v0;
}

id OUTLINED_FUNCTION_310@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(id *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_311()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_312()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_313()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_314()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_315()
{
  uint64_t v0;
  uint64_t v1;

  return *(id *)(v1 + 8 * v0);
}

id OUTLINED_FUNCTION_316()
{
  uint64_t v0;
  uint64_t v1;

  return *(id *)(v1 + 8 * v0);
}

uint64_t OUTLINED_FUNCTION_317@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + a1);
}

void OUTLINED_FUNCTION_318(uint64_t a1)
{
  sub_230320ED0(a1);
}

_QWORD *OUTLINED_FUNCTION_320(_QWORD *a1)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

void OUTLINED_FUNCTION_324()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 72) = v0;
}

uint64_t OUTLINED_FUNCTION_325()
{
  return sub_23037A9E8();
}

unint64_t OUTLINED_FUNCTION_326()
{
  return sub_2303486C8();
}

id OUTLINED_FUNCTION_327()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_328()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_329()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + v0;
  *(_QWORD *)v2 = 0;
  *(_BYTE *)(v2 + 8) = 1;
}

id OUTLINED_FUNCTION_330()
{
  void *v0;

  return v0;
}

id OUTLINED_FUNCTION_332()
{
  void *v0;

  return v0;
}

void OUTLINED_FUNCTION_333(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + a1;
  *(_QWORD *)v2 = 0;
  *(_BYTE *)(v2 + 8) = 1;
}

id OUTLINED_FUNCTION_334()
{
  uint64_t v0;
  uint64_t v1;

  return *(id *)(v0 + 8 * v1);
}

void OUTLINED_FUNCTION_335()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_336()
{
  unint64_t v0;
  uint64_t v1;

  return sub_2302E33C8(v1, v0);
}

void OUTLINED_FUNCTION_337()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_341@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

uint64_t SportsSessionType.rawValue.getter()
{
  return 0;
}

uint64_t SportsActivityType.rawValue.getter()
{
  return 0;
}

uint64_t SportsSessionType.init(rawValue:)@<X0>(uint64_t result@<X0>, BOOL *a2@<X8>)
{
  *a2 = result != 0;
  return result;
}

unint64_t sub_23034F31C()
{
  unint64_t result;

  result = qword_255E59DC0;
  if (!qword_255E59DC0)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportsSessionType, &type metadata for SportsSessionType);
    atomic_store(result, (unint64_t *)&qword_255E59DC0);
  }
  return result;
}

uint64_t sub_23034F364@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  return SportsSessionType.init(rawValue:)(*a1, a2);
}

void sub_23034F36C(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

unint64_t sub_23034F378()
{
  unint64_t result;

  result = qword_255E59DC8;
  if (!qword_255E59DC8)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportsActivityType, &type metadata for SportsActivityType);
    atomic_store(result, (unint64_t *)&qword_255E59DC8);
  }
  return result;
}

ValueMetadata *type metadata accessor for SportsSessionType()
{
  return &type metadata for SportsSessionType;
}

uint64_t _s9SportsKit17SportsSessionTypeOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23034F408 + 4 * byte_2303872A0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23034F428 + 4 * byte_2303872A5[v4]))();
}

_BYTE *sub_23034F408(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23034F428(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23034F430(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23034F438(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23034F440(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23034F448(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SportsActivityType()
{
  return &type metadata for SportsActivityType;
}

void RunningClockViewModel.sport.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

void RunningClockViewModel.progressStatus.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 17);
}

id RunningClockViewModel.clock.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 24);
}

uint64_t sub_23034F48C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = a2;
  return OUTLINED_FUNCTION_63_6();
}

void sub_23034F498(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  sub_23034F518(v1, v2);
}

uint64_t sub_23034F4D4()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_27();
  v1 = *(_QWORD *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

void sub_23034F518(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  OUTLINED_FUNCTION_27();
  *(_QWORD *)(v2 + 80) = a1;
  *(_QWORD *)(v2 + 88) = a2;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_101();
}

void sub_23034F558()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_3();
}

uint64_t sub_23034F58C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = type metadata accessor for RunningClockComponentsFormatter.DataSource(0);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_12();
  SportingEventSubscription.createRunningClockDataSource(preferStaticClock:)();
  RunningClockComponentsFormatter.formattedComponents(dataSource:)();
  return sub_230350BC8(v0, type metadata accessor for RunningClockComponentsFormatter.DataSource);
}

void sub_23034F614(uint64_t a1)
{
  uint64_t v1[5];

  sub_2302E00E4(a1, (uint64_t)v1);
  sub_23034F720(v1);
}

uint64_t sub_23034F64C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v4[2];

  v1 = *(_QWORD *)(v0 + 40);
  swift_beginAccess();
  sub_2302E00E4(v0 + 104, (uint64_t)v4);
  v2 = v1 + OBJC_IVAR____TtC9SportsKit31RunningClockComponentsFormatter_localizationProvider;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v2);
  sub_2302E18FC(v4, v2);
  return swift_endAccess();
}

uint64_t sub_23034F6DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  OUTLINED_FUNCTION_27();
  return sub_2302E00E4(v1 + 104, a1);
}

void sub_23034F720(uint64_t *a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_27();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(v1 + 104), a1);
  swift_endAccess();
  sub_23034F64C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_101();
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

void sub_23034F8DC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_3();
}

void sub_23034F914(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_23034F64C();
  OUTLINED_FUNCTION_3();
}

void sub_23034F940()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;

  if ((v0[56] & 1) == 0)
  {
    v1 = (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
    sub_23034F48C(v1, v2);
  }
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_3();
}

uint64_t sub_23034F980()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD *v10;
  uint64_t result;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 *i;
  char v19;
  unsigned __int8 v20;
  uint64_t v21;
  char v22;
  char v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned __int8 v26;
  uint64_t v27;
  unsigned __int8 v28;
  uint64_t v29;
  unsigned __int8 v30;
  uint64_t v31;
  unsigned __int8 v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unsigned __int8 v36;
  uint64_t v37;
  uint64_t v38;
  char v39;

  v1 = *(_QWORD *)(v0 + 32);
  OUTLINED_FUNCTION_27();
  SportingEventClock.totalSeconds.getter();
  v2 = 0;
  if ((v3 & 1) != 0)
    return v2;
  v4 = *(void **)(v0 + 40);
  v5 = *(id *)(v1 + OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_runningClock);
  sub_230351B70();
  v7 = v6;

  v8 = objc_msgSend(v4, sel_stringFromTimeInterval_, (double)v7);
  if (v8)
  {
    v9 = v8;
    sub_23037A5C8();

  }
  sub_2302DF64C();
  v10 = (_QWORD *)sub_23037AA54();
  result = OUTLINED_FUNCTION_41();
  v12 = v10[2];
  if (!v12)
  {
    __break(1u);
LABEL_64:
    v2 = 0;
    goto LABEL_53;
  }
  v13 = v10[4];
  v14 = v10[5];
  v15 = HIBYTE(v14) & 0xF;
  v16 = v13 & 0xFFFFFFFFFFFFLL;
  if ((v14 & 0x2000000000000000) != 0)
    v17 = HIBYTE(v14) & 0xF;
  else
    v17 = v13 & 0xFFFFFFFFFFFFLL;
  if (!v17)
    goto LABEL_64;
  if ((v14 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    sub_23034734C(v13, v14, 10);
    v2 = v38;
    LOBYTE(v13) = v39;
    swift_bridgeObjectRelease();
    goto LABEL_50;
  }
  if ((v14 & 0x2000000000000000) == 0)
  {
    if ((v13 & 0x1000000000000000) == 0)
      goto LABEL_67;
    for (i = (unsigned __int8 *)((v14 & 0xFFFFFFFFFFFFFFFLL) + 32); ; i = (unsigned __int8 *)sub_23037AB98())
    {
      v2 = (uint64_t)sub_230347338(i, v16, 10);
      LOBYTE(v13) = v19 & 1;
LABEL_50:
      if ((v13 & 1) != 0)
        v2 = 0;
      v12 = v10[2];
LABEL_53:
      if (v12 >= 2)
        break;
      __break(1u);
LABEL_67:
      ;
    }
    v34 = v10[6];
    v35 = v10[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_23033413C(v34, v35);
    return v2;
  }
  if (v10[4] == 43)
  {
    if (!v15)
      goto LABEL_69;
    if (v15 == 1)
      goto LABEL_36;
    OUTLINED_FUNCTION_1_11();
    if (!v23 & v22)
      goto LABEL_36;
    v2 = v24;
    if (v25 != 2)
    {
      OUTLINED_FUNCTION_1_11();
      if (!v23 & v22)
        goto LABEL_36;
      v2 = 10 * v2 + v26;
      if (v27 != 3)
      {
        while (1)
        {
          OUTLINED_FUNCTION_121_1();
          if (!v23 & v22)
            goto LABEL_36;
          OUTLINED_FUNCTION_2_9();
          if (!v23)
            goto LABEL_36;
          v2 = v29 + v28;
          if (__OFADD__(v29, v28))
            goto LABEL_36;
          OUTLINED_FUNCTION_6_9();
          if (v23)
            goto LABEL_50;
        }
      }
    }
LABEL_49:
    LOBYTE(v13) = 0;
    goto LABEL_50;
  }
  if (v10[4] != 45)
  {
    if (!v15 || (v13 - 48) > 9u)
      goto LABEL_36;
    v2 = (v13 - 48);
    if (v15 != 1)
    {
      OUTLINED_FUNCTION_1_11();
      if (!v23 & v22)
        goto LABEL_36;
      v2 = 10 * (v13 - 48) + v30;
      if (v31 != 2)
      {
        while (1)
        {
          OUTLINED_FUNCTION_121_1();
          if (!v23 & v22)
            goto LABEL_36;
          OUTLINED_FUNCTION_2_9();
          if (!v23)
            goto LABEL_36;
          v2 = v33 + v32;
          if (__OFADD__(v33, v32))
            goto LABEL_36;
          OUTLINED_FUNCTION_6_9();
          if (v23)
            goto LABEL_50;
        }
      }
    }
    goto LABEL_49;
  }
  if (v15)
  {
    if (v15 != 1)
    {
      OUTLINED_FUNCTION_1_11();
      if (!(!v23 & v22))
      {
        if (v21 == 2)
        {
          LOBYTE(v13) = 0;
          v2 = -(uint64_t)v20;
          goto LABEL_50;
        }
        if ((BYTE2(v13) - 48) <= 9u)
        {
          v2 = -10 * v20 - (BYTE2(v13) - 48);
          if (v21 == 3)
            goto LABEL_49;
          while (1)
          {
            OUTLINED_FUNCTION_121_1();
            if (!v23 & v22)
              break;
            OUTLINED_FUNCTION_2_9();
            if (!v23)
              break;
            v2 = v37 - v36;
            if (__OFSUB__(v37, v36))
              break;
            OUTLINED_FUNCTION_6_9();
            if (v23)
              goto LABEL_50;
          }
        }
      }
    }
LABEL_36:
    v2 = 0;
    LOBYTE(v13) = 1;
    goto LABEL_50;
  }
  __break(1u);
LABEL_69:
  __break(1u);
  return result;
}

uint64_t sub_23034FD38()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return sub_23034FF64(v0);
}

uint64_t sub_23034FD60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (*(_QWORD *)(v0 + 144))
  {
    v1 = *(_QWORD *)(v0 + 144);
  }
  else
  {
    sub_23034FDB8(v0);
    v1 = v2;
    *(_QWORD *)(v0 + 144) = v2;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_41();
  }
  swift_bridgeObjectRetain();
  return v1;
}

void sub_23034FDB8(uint64_t a1)
{
  _QWORD *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t i;
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v1 = (_QWORD *)(*(_QWORD *)(a1 + 32) + OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_sportingEventDetails);
  swift_beginAccess();
  v2 = *(_QWORD *)(*v1 + OBJC_IVAR____TtC9SportsKit13SportingEvent__competitors);
  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_3;
LABEL_14:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v3 = sub_23037AC94();
  if (!v3)
    goto LABEL_14;
LABEL_3:
  v10 = MEMORY[0x24BEE4AF8];
  sub_2302DA57C();
  if ((v3 & 0x8000000000000000) == 0)
  {
    for (i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x2348B72B4](i, v2);
      else
        v5 = *(id *)(v2 + 8 * i + 32);
      v6 = v5;
      v7 = (unint64_t)SportingEventCompetitor.contextualShootouts()();

      if (v7)
        v8 = v7;
      else
        v8 = MEMORY[0x24BEE4AF8];
      v9 = *(_QWORD *)(v10 + 16);
      if (v9 >= *(_QWORD *)(v10 + 24) >> 1)
        sub_2302DA57C();
      *(_QWORD *)(v10 + 16) = v9 + 1;
      *(_QWORD *)(v10 + 8 * v9 + 32) = v8;
    }
    goto LABEL_14;
  }
  __break(1u);
}

uint64_t sub_23034FF64(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 144) = a1;
  return OUTLINED_FUNCTION_63_6();
}

void sub_23034FF70(uint64_t *a1)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_23034FD60();
  OUTLINED_FUNCTION_3();
}

void sub_23034FFA0(uint64_t *a1, char a2)
{
  uint64_t v2;

  if ((a2 & 1) != 0)
  {
    v2 = swift_bridgeObjectRetain();
    sub_23034FF64(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23034FF64(*a1);
    OUTLINED_FUNCTION_3();
  }
}

uint64_t sub_23034FFE0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_230350050(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_230350018(uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  swift_bridgeObjectRetain();
  return sub_230350258(&v2);
}

uint64_t sub_230350050@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v3 = *(_QWORD *)(v1 + 152);
  v4 = v3;
  if (v3 == 1)
  {
    sub_2303500C0(v1);
    v4 = v7;
    v5 = *(_QWORD *)(v1 + 152);
    *(_QWORD *)(v1 + 152) = v7;
    OUTLINED_FUNCTION_67();
    sub_2302E5A80(v5);
  }
  *a1 = v4;
  return sub_2302E5964(v3);
}

void sub_2303500C0(uint64_t a1)
{
  __asm { BR              X10 }
}

void sub_23035010C()
{
  _QWORD *v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 24) + OBJC_IVAR____TtC9SportsKit18SportingEventClock_period)
                + OBJC_IVAR____TtC9SportsKit24SportingEventClockPeriod__type) == 10
    || (sub_2302E4DB8(), (v2 & 1) == 0))
  {
    *v0 = 0;
  }
  else
  {
    v3 = sub_23034FD60();
    PenaltyShootoutsViewModel.init(contextualShootouts:)((Swift::OpaquePointer)v3);
    *v0 = v4;
  }
}

uint64_t sub_230350258(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *(_QWORD *)(v1 + 152);
  *(_QWORD *)(v1 + 152) = v2;
  return sub_2302E5A80(v3);
}

void sub_230350268(uint64_t *a1)
{
  uint64_t v1;

  a1[1] = v1;
  sub_230350050(a1);
  OUTLINED_FUNCTION_3();
}

uint64_t sub_230350298(uint64_t *a1, char a2)
{
  uint64_t v3;

  v3 = *a1;
  if ((a2 & 1) == 0)
    return sub_230350258(&v3);
  swift_bridgeObjectRetain();
  sub_230350258(&v3);
  return swift_bridgeObjectRelease();
}

uint64_t RunningClockViewModel.__allocating_init(subscription:)(char *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  RunningClockViewModel.init(subscription:)(a1);
  return v2;
}

uint64_t RunningClockViewModel.init(subscription:)(char *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  void *v9;
  char *v10;
  Swift::String v11;
  char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  char v17;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A2F0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_12();
  v7 = objc_allocWithZone((Class)type metadata accessor for RunningClockComponentsFormatter());
  *(_QWORD *)(v3 + 40) = sub_23035092C(v7);
  *(_QWORD *)(v3 + 48) = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AppState()), sel_init);
  *(_BYTE *)(v3 + 56) = 0;
  *(_QWORD *)(v3 + 64) = 0;
  *(_QWORD *)(v3 + 72) = 0xE000000000000000;
  *(_QWORD *)(v3 + 80) = 0;
  *(_QWORD *)(v3 + 88) = 0;
  *(_QWORD *)(v3 + 96) = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v3 + 128) = &type metadata for RunningClockDefaultLocalization;
  *(_QWORD *)(v3 + 136) = &protocol witness table for RunningClockDefaultLocalization;
  *(_OWORD *)(v3 + 144) = xmmword_23037DE10;
  *(_QWORD *)(v3 + 32) = a1;
  v8 = *(_QWORD *)&a1[OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_sport];
  v9 = *(void **)&a1[OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_sport + 8];
  v10 = a1;
  swift_bridgeObjectRetain();
  v11._countAndFlagsBits = v8;
  v11._object = v9;
  Sport.init(rawValue:)(v11);
  *(_BYTE *)(v3 + 16) = v17;
  v12 = &v10[OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_sportingEventDetails];
  OUTLINED_FUNCTION_27();
  v13 = *(_QWORD *)v12;
  *(_BYTE *)(v3 + 17) = *(_BYTE *)(*(_QWORD *)v12 + OBJC_IVAR____TtC9SportsKit13SportingEvent_progressStatus);
  v14 = *(void **)(*(_QWORD *)(v13 + OBJC_IVAR____TtC9SportsKit13SportingEvent_clock)
                 + OBJC_IVAR____TtC9SportsKit25SportingEventCurrentClock_current);
  *(_QWORD *)(v3 + 24) = v14;
  OUTLINED_FUNCTION_27();
  v15 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405A2F8);
  sub_23037A2D4();
  swift_endAccess();
  swift_allocObject();
  swift_weakInit();
  sub_2303509F0();
  sub_23037A358();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v2, v5);
  OUTLINED_FUNCTION_27();
  sub_23037A28C();
  swift_endAccess();
  swift_release();

  return v3;
}

_BYTE *sub_230350580(_BYTE *result)
{
  if (*result == 1)
  {
    swift_beginAccess();
    result = (_BYTE *)swift_weakLoadStrong();
    if (result)
    {
      result[56] = 1;
      return (_BYTE *)swift_release();
    }
  }
  return result;
}

void sub_2303505DC()
{
  sub_2302F3310();
}

uint64_t sub_230350614()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v7[24];
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v1 = type metadata accessor for RunningClockComponentsFormatter.FormattedComponents(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = &v7[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23034F58C();
  v11 = 0;
  v12 = 0xE000000000000000;
  if (*((_QWORD *)v3 + 1))
  {
    OUTLINED_FUNCTION_67();
    sub_23037A670();
    OUTLINED_FUNCTION_32_0();
    OUTLINED_FUNCTION_27();
    sub_2302E00E4(v0 + 104, (uint64_t)v8);
    v4 = v9;
    v5 = v10;
    __swift_project_boxed_opaque_existential_1(v8, v9);
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
    sub_23037A670();
  }
  OUTLINED_FUNCTION_67();
  sub_23037A670();
  OUTLINED_FUNCTION_32_0();
  if (*((_QWORD *)v3 + 3))
  {
    v8[0] = 32;
    v8[1] = 0xE100000000000000;
    sub_23037A670();
    sub_23037A670();
    OUTLINED_FUNCTION_41();
  }
  sub_230350BC8((uint64_t)v3, type metadata accessor for RunningClockComponentsFormatter.FormattedComponents);
  return v11;
}

uint64_t sub_230350788()
{
  return 6;
}

uint64_t RunningClockViewModel.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  swift_bridgeObjectRelease();
  sub_2302E5A80(*(_QWORD *)(v0 + 152));
  return v0;
}

uint64_t RunningClockViewModel.__deallocating_deinit()
{
  RunningClockViewModel.deinit();
  return swift_deallocClassInstance();
}

uint64_t static RunningClockViewModel.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return RunningClockViewModel.isEqual(to:)(a2) & 1;
}

uint64_t RunningClockViewModel.isEqual(to:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  if (*(_QWORD *)v1 != *(_QWORD *)a1)
    return 0;
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 400))();
  v6 = v5;
  if (v4 == (*(uint64_t (**)(void))(*(_QWORD *)a1 + 400))() && v6 == v7)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v9 = sub_23037AE8C();
    OUTLINED_FUNCTION_32_0();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
      return 0;
  }
  sub_23032933C();
  return sub_23037A9E8() & 1;
}

uint64_t sub_23035090C(uint64_t *a1, uint64_t *a2)
{
  return static RunningClockViewModel.== infix(_:_:)(*a1, *a2) & 1;
}

id sub_23035092C(_BYTE *a1)
{
  objc_class *ObjectType;
  id v3;
  objc_super v5;
  _BYTE v6[24];
  ValueMetadata *v7;
  _UNKNOWN **v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v7 = &type metadata for RunningClockDefaultLocalization;
  v8 = &protocol witness table for RunningClockDefaultLocalization;
  a1[OBJC_IVAR____TtC9SportsKit31RunningClockComponentsFormatter_styleOptions] = 0;
  sub_2302E00E4((uint64_t)v6, (uint64_t)&a1[OBJC_IVAR____TtC9SportsKit31RunningClockComponentsFormatter_localizationProvider]);
  v5.receiver = a1;
  v5.super_class = ObjectType;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  sub_23036A478();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v3;
}

uint64_t sub_2303509C4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

_BYTE *sub_2303509E8(_BYTE *result)
{
  return sub_230350580(result);
}

unint64_t sub_2303509F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25405A2E8;
  if (!qword_25405A2E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25405A2F0);
    result = MEMORY[0x2348B7C44](MEMORY[0x24BDB9EE8], v1);
    atomic_store(result, (unint64_t *)&qword_25405A2E8);
  }
  return result;
}

void sub_230350A34(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = sub_23034F4D4();
  a1[1] = v2;
  OUTLINED_FUNCTION_3();
}

void sub_230350A5C(uint64_t a1@<X8>)
{
  sub_23034F6DC(a1);
  OUTLINED_FUNCTION_3();
}

void sub_230350A7C(uint64_t *a1@<X8>)
{
  *a1 = sub_23034FD60();
  OUTLINED_FUNCTION_3();
}

uint64_t type metadata accessor for RunningClockViewModel()
{
  return objc_opt_self();
}

uint64_t method lookup function for RunningClockViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RunningClockViewModel.decorationTitle.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of RunningClockViewModel.decorationTitle.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of RunningClockViewModel.decorationTitle.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of RunningClockViewModel.localizationProvider.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of RunningClockViewModel.localizationProvider.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of RunningClockViewModel.localizationProvider.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of RunningClockViewModel.formattedClockDisplayValue()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of RunningClockViewModel.currentTimeValue.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of RunningClockViewModel.contextualShootouts.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of RunningClockViewModel.contextualShootouts.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of RunningClockViewModel.contextualShootouts.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of RunningClockViewModel.penaltyShootoutsViewModel.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of RunningClockViewModel.penaltyShootoutsViewModel.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of RunningClockViewModel.penaltyShootoutsViewModel.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of RunningClockViewModel.__allocating_init(subscription:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 384))();
}

uint64_t dispatch thunk of RunningClockViewModel.localizedClockString(key:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of RunningClockViewModel.localizedFormattedClockValue()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of RunningClockViewModel.localizedOrdinalStyle.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t sub_230350BC8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_230350C38(uint64_t a1, double a2)
{
  char *v2;
  double *v3;
  void *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  char v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  int v36;
  char v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  char v44;
  uint64_t v45;
  double v46;
  int v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  os_log_type_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  os_log_type_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double *v60;
  double v61;
  int v62;
  int v63;
  char v64;
  uint64_t v65;
  os_log_type_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  NSObject *v73;
  char *v74;
  os_log_type_t v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  uint64_t v92[3];
  uint64_t v93;
  uint64_t v94;

  v4 = v2;
  sub_23037A238();
  OUTLINED_FUNCTION_21_6();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_2_0();
  v10 = (void *)(v9 - v8);
  sub_230333EE8();
  if (*(_QWORD *)&v2[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_version] >= v11)
  {
    if (qword_25405B480 != -1)
LABEL_106:
      swift_once();
    v17 = OUTLINED_FUNCTION_24_0();
    __swift_project_value_buffer(v17, (uint64_t)qword_2540621F0);
    v91 = v4;
    v18 = (id)a1;
    v19 = sub_23037A268();
    v20 = sub_23037A8F8();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = OUTLINED_FUNCTION_5_2();
      *(_DWORD *)v21 = 134218240;
      sub_23037AA30();

      *(_WORD *)(v21 + 12) = 2048;
      sub_230333EE8();
      v92[0] = v22;
      sub_23037AA30();

      _os_log_impl(&dword_2302D3000, v19, v20, "SportingEventRunningClockV2: out of order version, current=%ld, received=%ld. Ignore.", (uint8_t *)v21, 0x16u);
      OUTLINED_FUNCTION_28_0();
    }

    OUTLINED_FUNCTION_31_6();
    return;
  }
  v90 = OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_version;
  v88 = v2;
  v89 = a1;
  v12 = *(_QWORD *)&v2[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_features];
  v13 = *(_QWORD *)(v12 + 16);
  if (v13)
  {
    OUTLINED_FUNCTION_31_1();
    v86 = v12;
    v14 = v12 + 48;
    while (1)
    {
      v15 = *(unsigned __int8 *)(v14 - 16);
      if (v15 != 1 && v15 != 2)
        break;
      v16 = OUTLINED_FUNCTION_40();
      OUTLINED_FUNCTION_11();
      if ((v16 & 1) != 0)
      {
        v12 = v86;
        goto LABEL_15;
      }
      v14 += 24;
      if (!--v13)
      {
        v12 = v86;
        OUTLINED_FUNCTION_41();
        goto LABEL_16;
      }
    }
    v12 = v86;
    OUTLINED_FUNCTION_41();
LABEL_15:
    swift_bridgeObjectRelease();
  }
LABEL_16:
  v24 = OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_isCountingDown;
  v25 = v2;
  v2[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_isCountingDown] = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + OBJC_IVAR____TtC9SportsKit13SportingEvent_clock)
                                                                                                  + OBJC_IVAR____TtC9SportsKit25SportingEventCurrentClock_current)
                                                                                      + OBJC_IVAR____TtC9SportsKit18SportingEventClock__isCountingDown) & 1;
  v26 = SportingEventClock.totalSeconds.getter();
  if ((v27 & 1) != 0)
    v28 = 0;
  else
    v28 = v26;
  v94 = v28;
  v29 = *(_QWORD *)(a1 + OBJC_IVAR____TtC9SportsKit13SportingEvent__coverage);
  if (!v29
    || (v30 = *(_QWORD *)(v29 + OBJC_IVAR____TtC9SportsKit21SportingEventCoverage__ingestion)) == 0
    || (v31 = *(_QWORD *)(v30 + OBJC_IVAR____TtC9SportsKit30SportingEventCoverageIngestion__lastUpdates)) == 0)
  {
LABEL_34:
    sub_23037A22C();
    sub_23037A1FC();
    v39 = v38;
    OUTLINED_FUNCTION_22_10();
    goto LABEL_35;
  }
  v85 = v24;
  v87 = v12;
  if (v31 >> 62)
  {
    OUTLINED_FUNCTION_145();
    v32 = sub_23037AC94();
    if (v32)
      goto LABEL_24;
    goto LABEL_33;
  }
  v32 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_145();
  if (!v32)
  {
LABEL_33:
    swift_bridgeObjectRelease_n();
    v25 = v88;
    a1 = v89;
    v24 = v85;
    v12 = v87;
    goto LABEL_34;
  }
LABEL_24:
  a1 = 4;
  v4 = &unk_255E59000;
  while (1)
  {
    if ((v31 & 0xC000000000000001) != 0)
      v33 = (char *)MEMORY[0x2348B72B4](a1 - 4, v31);
    else
      v33 = (char *)*(id *)(v31 + 8 * a1);
    v34 = v33;
    v35 = a1 - 3;
    if (__OFADD__(a1 - 4, 1))
    {
      __break(1u);
      goto LABEL_106;
    }
    v36 = v33[OBJC_IVAR____TtC9SportsKit31SportingEventCoverageLastUpdate__scope];
    if (v36 == 2)
      goto LABEL_32;
    if ((v36 & 1) == 0)
      break;
    v37 = OUTLINED_FUNCTION_40();
    swift_bridgeObjectRelease();
    if ((v37 & 1) != 0)
      goto LABEL_78;
LABEL_32:

    ++a1;
    if (v35 == v32)
      goto LABEL_33;
  }
  OUTLINED_FUNCTION_11();
LABEL_78:
  OUTLINED_FUNCTION_11();
  swift_bridgeObjectRelease();
  v39 = *(double *)&v34[OBJC_IVAR____TtC9SportsKit31SportingEventCoverageLastUpdate__timestamp];
  v64 = v34[OBJC_IVAR____TtC9SportsKit31SportingEventCoverageLastUpdate__timestamp + 8];

  v25 = v88;
  a1 = v89;
  v24 = v85;
  v12 = v87;
  if ((v64 & 1) != 0)
    goto LABEL_34;
LABEL_35:
  sub_23037A22C();
  v40 = v10;
  sub_23037A1FC();
  v42 = v41;
  OUTLINED_FUNCTION_22_10();
  v43 = v42 - v39;
  OUTLINED_FUNCTION_11_10();
  if (v44)
  {
    __break(1u);
    goto LABEL_108;
  }
  if (v43 <= -9.22337204e18)
  {
LABEL_108:
    __break(1u);
    goto LABEL_109;
  }
  if (v43 >= 9.22337204e18)
  {
LABEL_109:
    __break(1u);
LABEL_110:
    __break(1u);
    goto LABEL_111;
  }
  v45 = *(_QWORD *)(v12 + 16);
  if (v45)
  {
    OUTLINED_FUNCTION_31_1();
    v3 = (double *)(v12 + 48);
    v40 = (void *)0x8000000230389480;
    while (1)
    {
      v46 = *(v3 - 1);
      v47 = *(unsigned __int8 *)v3;
      OUTLINED_FUNCTION_10_10();
      if (v48 > 1)
        break;
      OUTLINED_FUNCTION_40();
      OUTLINED_FUNCTION_32_6();
      if ((v10 & 1) != 0)
        goto LABEL_47;
      v3 += 3;
      if (!--v45)
      {
        OUTLINED_FUNCTION_103_0();
        v46 = 120.0;
        goto LABEL_49;
      }
    }
    OUTLINED_FUNCTION_103_0();
LABEL_47:
    swift_bridgeObjectRelease();
    if (v47)
      v46 = 120.0;
LABEL_49:
    a1 = v89;
  }
  else
  {
    v46 = 120.0;
  }
  OUTLINED_FUNCTION_11_10();
  if (v44)
    goto LABEL_110;
  if (v46 <= -9.22337204e18)
  {
LABEL_111:
    __break(1u);
LABEL_112:
    __break(1u);
LABEL_113:
    swift_once();
LABEL_98:
    v72 = OUTLINED_FUNCTION_24_0();
    v73 = __swift_project_value_buffer(v72, (uint64_t)qword_2540621F0);
    v74 = v25;
    sub_23037A268();
    v75 = OUTLINED_FUNCTION_23_2();
    if (os_log_type_enabled(v73, v75))
    {
      v76 = OUTLINED_FUNCTION_5_2();
      v92[0] = OUTLINED_FUNCTION_5_2();
      v77 = *((unsigned __int8 *)v3 + (_QWORD)v25);
      *(_DWORD *)v76 = 67109634;
      LODWORD(v93) = v77;
      sub_23037AA30();
      *(_WORD *)(v76 + 8) = 2080;
      v78 = OUTLINED_FUNCTION_31_1();
      v79 = MEMORY[0x2348B6ED0](v78, &type metadata for SportingEventRunningClockFeature);
      v81 = v80;
      OUTLINED_FUNCTION_41();
      v93 = sub_23036514C(v79, v81, v92);
      sub_23037AA30();

      swift_bridgeObjectRelease();
      *(_WORD *)(v76 + 18) = 2048;
      v93 = *(_QWORD *)&a2;
      sub_23037AA30();
      _os_log_impl(&dword_2302D3000, v73, v75, "SportingEventRunningClockV2: initialize clock.isSupported=%{BOOL}d, features: %s, ttl=%f", (uint8_t *)v76, 0x1Cu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_28_0();
    }

    OUTLINED_FUNCTION_7_8();
    v84 = OUTLINED_FUNCTION_24_9();
    goto LABEL_104;
  }
  if (v46 >= 9.22337204e18)
    goto LABEL_112;
  if ((v25[v24] & 1) == 0)
  {
    v49 = (uint64_t)v43;
    if ((OUTLINED_FUNCTION_7_8() & 1) == 0 || v49 < 0 || (uint64_t)v46 < v49)
    {
      if (qword_25405B480 != -1)
        goto LABEL_115;
    }
    else
    {
      if (qword_25405B480 != -1)
        swift_once();
      v50 = OUTLINED_FUNCTION_24_0();
      OUTLINED_FUNCTION_13_8(v50, (uint64_t)qword_2540621F0);
      v51 = OUTLINED_FUNCTION_23_2();
      if (OUTLINED_FUNCTION_8_9(v51))
      {
        *(_DWORD *)OUTLINED_FUNCTION_5_2() = 134217984;
        v92[0] = (uint64_t)v43;
        OUTLINED_FUNCTION_2_10();
        OUTLINED_FUNCTION_4_11(&dword_2302D3000, v52, v53, "SportingEventRunningClockV2: time diff=%ld for the clock");
        OUTLINED_FUNCTION_28_0();
      }

      if (!__OFADD__(v94, v49))
      {
        v94 += v49;
        goto LABEL_67;
      }
      __break(1u);
LABEL_115:
      swift_once();
    }
    v54 = OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_13_8(v54, (uint64_t)qword_2540621F0);
    v55 = OUTLINED_FUNCTION_23_2();
    if (OUTLINED_FUNCTION_8_9(v55))
    {
      *(_DWORD *)OUTLINED_FUNCTION_5_2() = 134217984;
      v92[0] = (uint64_t)v43;
      OUTLINED_FUNCTION_2_10();
      OUTLINED_FUNCTION_4_11(&dword_2302D3000, v56, v57, "SportingEventRunningClockV2: skip inadequate time diff=%ldsec");
      OUTLINED_FUNCTION_28_0();
    }

  }
LABEL_67:
  if (*(_QWORD *)&v25[v90] != -1 || (v25[v24] & 1) != 0 || (OUTLINED_FUNCTION_7_8() & 1) == 0)
    goto LABEL_94;
  v58 = *(_QWORD *)(v12 + 16);
  v59 = 0.0;
  if (v58)
  {
    OUTLINED_FUNCTION_31_1();
    v60 = (double *)(v12 + 48);
    v40 = (void *)0x8000000230389460;
    while (1)
    {
      v61 = *(v60 - 1);
      v62 = *(unsigned __int8 *)v60;
      OUTLINED_FUNCTION_10_10();
      if (v63)
      {
        if (v63 != 2)
          break;
      }
      OUTLINED_FUNCTION_40();
      OUTLINED_FUNCTION_32_6();
      if ((v10 & 1) != 0)
        goto LABEL_82;
      v60 += 3;
      if (!--v58)
      {
        OUTLINED_FUNCTION_103_0();
        goto LABEL_85;
      }
    }
    v58 = v12;
    OUTLINED_FUNCTION_103_0();
LABEL_82:
    swift_bridgeObjectRelease();
    if (v62)
      v59 = 0.0;
    else
      v59 = v61;
LABEL_85:
    v25 = v88;
  }
  OUTLINED_FUNCTION_11_10();
  if (v44)
  {
    __break(1u);
    goto LABEL_119;
  }
  if (v59 <= -9.22337204e18)
  {
LABEL_119:
    __break(1u);
    goto LABEL_120;
  }
  if (v59 >= 9.22337204e18)
  {
LABEL_120:
    __break(1u);
    goto LABEL_121;
  }
  v58 = (uint64_t)v59;
  if (!__OFADD__(v94, (uint64_t)v59))
  {
    v94 += (uint64_t)v59;
    if (qword_25405B480 == -1)
      goto LABEL_91;
    goto LABEL_122;
  }
LABEL_121:
  __break(1u);
LABEL_122:
  swift_once();
LABEL_91:
  v65 = OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_13_8(v65, (uint64_t)qword_2540621F0);
  v66 = OUTLINED_FUNCTION_23_2();
  if (OUTLINED_FUNCTION_8_9(v66))
  {
    *(_DWORD *)OUTLINED_FUNCTION_5_2() = 134217984;
    v92[0] = v58;
    OUTLINED_FUNCTION_2_10();
    OUTLINED_FUNCTION_4_11(&dword_2302D3000, v67, v68, "SportingEventRunningClockV2: initialize clock with safety start=%ldsec");
    OUTLINED_FUNCTION_28_0();
  }

LABEL_94:
  v69 = OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_isEventClockRunning;
  if ((v25[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_isEventClockRunning] & 1) == 0)
    OUTLINED_FUNCTION_7_8();
  sub_230333EE8();
  *(_QWORD *)&v25[v90] = v70;
  *(_QWORD *)&v25[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_staticClockValue] = v94;
  v25[v69] = SportingEvent.isEventClockRunning.getter() & 1;
  v3 = (double *)OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_isSupported;
  v71 = v25[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_isSupported];
  if (v71 != (SportingEvent.isRunningClockSupported.getter() & 1))
  {
    *((_BYTE *)v3 + (_QWORD)v25) = SportingEvent.isRunningClockSupported.getter() & 1;
    if (qword_25405B480 == -1)
      goto LABEL_98;
    goto LABEL_113;
  }
  if (v71)
    __asm { BR              X10 }
  OUTLINED_FUNCTION_7_8();
  v84 = OUTLINED_FUNCTION_24_9();
LABEL_104:
  sub_230351E00(v82, v83, v84);
  OUTLINED_FUNCTION_31_6();
}

void sub_230351B70()
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
  double v9;
  double v10;
  void (*v11)(char *, uint64_t);
  double v12;
  double v13;
  double v14;
  double v15;
  char v16;
  uint64_t v17;

  v1 = v0;
  v2 = sub_23037A238();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - v7;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_isSupported) == 1)
  {
    sub_23037A22C();
    sub_23037A1FC();
    v10 = v9;
    v11 = *(void (**)(char *, uint64_t))(v3 + 8);
    v11(v8, v2);
    OUTLINED_FUNCTION_14_6();
    sub_230379F50();
    swift_endAccess();
    sub_23037A1FC();
    v13 = v12;
    v11(v6, v2);
    v14 = v10 - v13;
    if (*(_BYTE *)(v1 + OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_isCountingDown) == 1)
    {
      OUTLINED_FUNCTION_14_6();
      sub_230379F5C();
      swift_endAccess();
      OUTLINED_FUNCTION_11_10();
      if (v16)
      {
        __break(1u);
      }
      else if (v15 > -9.22337204e18)
      {
        if (v15 < 9.22337204e18)
          return;
        goto LABEL_14;
      }
      __break(1u);
LABEL_14:
      __break(1u);
      goto LABEL_15;
    }
    OUTLINED_FUNCTION_11_10();
    if (v16)
    {
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
    if (v14 <= -9.22337204e18)
    {
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    if (v14 >= 9.22337204e18)
LABEL_17:
      __break(1u);
  }
}

void sub_230351D4C(uint64_t a1)
{
  void *v1;
  objc_class *v3;
  _BYTE *v4;
  objc_super v5;

  v3 = (objc_class *)OUTLINED_FUNCTION_107();
  v4 = v1;
  sub_230379F68();
  *(_QWORD *)&v4[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_version] = -1;
  v4[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_isSupported] = 0;
  v4[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_isCountingDown] = 0;
  v4[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_isEventClockRunning] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_staticClockValue] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_currentStopValue] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_features] = a1;

  v5.receiver = v4;
  v5.super_class = v3;
  objc_msgSendSuper2(&v5, sel_init);
  OUTLINED_FUNCTION_104();
}

uint64_t sub_230351E00(uint64_t result, char a2, double a3)
{
  uint64_t v3;
  int v4;
  char v5;

  if ((*(_QWORD *)(v3 + OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_staticClockValue) & 0x8000000000000000) == 0)
  {
    v4 = result & 1;
    v5 = a2 & 1;
    if (*(_BYTE *)(v3 + OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_isCountingDown) == 1)
      return sub_230351E38(v4, v5, a3);
    else
      return sub_230351FBC(v4, v5);
  }
  return result;
}

uint64_t sub_230351E38(char a1, char a2, double a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_23037A238();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_230379F74();
  v9 = *(_QWORD *)(v8 - 8);
  result = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    sub_23037A22C();
    sub_230379F44();
    v13 = v3 + OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_runningClockInterval;
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v13, v12, v8);
    result = swift_endAccess();
  }
  v14 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_staticClockValue);
  if ((a1 & 1) == 0)
    goto LABEL_9;
  if ((~*(_QWORD *)&a3 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (a3 <= -9.22337204e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (a3 >= 9.22337204e18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v15 = __OFSUB__(v14, (uint64_t)a3);
  v16 = v14 - (uint64_t)a3;
  if (!v15)
  {
    v14 = v16 & ~(v16 >> 63);
LABEL_9:
    *(_QWORD *)(v3 + OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_currentStopValue) = v14;
    return result;
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_230351FBC(int a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  _QWORD *v15;
  uint64_t v16;
  double v17;
  double v18;
  _DWORD v19[2];

  v3 = v2;
  v19[1] = a1;
  v5 = sub_23037A238();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = sub_230379F74();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) == 0)
  {
    v15 = &unk_255E6F000;
    swift_beginAccess();
    sub_230379F50();
    swift_endAccess();
LABEL_5:
    sub_230379F44();
    v16 = v3 + v15[293];
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 40))(v16, v13, v10);
    swift_endAccess();
    swift_beginAccess();
    sub_230379F5C();
    v18 = v17;
    result = swift_endAccess();
    if ((~*(_QWORD *)&v18 & 0x7FF0000000000000) != 0)
    {
      if (v18 > -9.22337204e18)
      {
        if (v18 < 9.22337204e18)
        {
          *(_QWORD *)(v3 + OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_currentStopValue) = (uint64_t)v18;
          return result;
        }
        goto LABEL_11;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  result = sub_23037A22C();
  if (*(_QWORD *)(v3 + OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_staticClockValue) != 0x8000000000000000)
  {
    sub_23037A1C0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    v15 = (_QWORD *)&unk_255E6F000;
    goto LABEL_5;
  }
LABEL_12:
  __break(1u);
  return result;
}

void sub_2303521FC()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_230352234(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  char v9;

  v2 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v2 || (sub_23037AE8C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x726F707075537369 && a2 == 0xEB00000000646574;
    if (v6 || (sub_23037AE8C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x69746E756F437369 && a2 == 0xEE006E776F44676ELL;
      if (v7 || (sub_23037AE8C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000013 && a2 == 0x800000023038C000 || (sub_23037AE8C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x800000023038C020 || (sub_23037AE8C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x800000023038C040 || (sub_23037AE8C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 5;
      }
      else if (a1 == 0xD000000000000014 && a2 == 0x800000023038C060 || (sub_23037AE8C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 6;
      }
      else if (a1 == 0x7365727574616566 && a2 == 0xE800000000000000)
      {
        swift_bridgeObjectRelease();
        return 7;
      }
      else
      {
        v9 = sub_23037AE8C();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 7;
        else
          return 8;
      }
    }
  }
}

uint64_t sub_230352580(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2303525B4 + 4 * byte_230387530[a1]))(0x6E6F6973726576, 0xE700000000000000);
}

uint64_t sub_2303525B4()
{
  return 0x726F707075537369;
}

uint64_t sub_2303525D4()
{
  return 0x69746E756F437369;
}

unint64_t sub_2303525F8()
{
  return 0xD000000000000013;
}

uint64_t sub_230352658()
{
  return 0x7365727574616566;
}

uint64_t sub_230352670()
{
  unsigned __int8 *v0;

  return sub_230352580(*v0);
}

uint64_t sub_230352678@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_230352234(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23035269C()
{
  sub_2303530B0();
  return sub_23037B00C();
}

uint64_t sub_2303526C4()
{
  sub_2303530B0();
  return sub_23037B018();
}

id sub_2303526EC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_107();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23035276C()
{
  return type metadata accessor for SportingEventRunningClock();
}

uint64_t type metadata accessor for SportingEventRunningClock()
{
  uint64_t result;

  result = qword_255E59E30;
  if (!qword_255E59E30)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2303527AC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_230379F74();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_230352844(_QWORD *a1)
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
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = sub_230379F74();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_2_0();
  v7 = v6 - v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E59E40);
  OUTLINED_FUNCTION_21_6();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_2_0();
  v12 = v11 - v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2303530B0();
  sub_23037B000();
  v20 = v12;
  sub_23037AE08();
  if (v19)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v12, v8);
  v14 = v7;
  v15 = v3;
  sub_23037ADF0();
  OUTLINED_FUNCTION_16_5(2);
  OUTLINED_FUNCTION_16_5(3);
  v16 = v1;
  OUTLINED_FUNCTION_17_11(4);
  OUTLINED_FUNCTION_17_11(5);
  v17 = v18 + OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_runningClockInterval;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v14, v17, v15);
  sub_230353128(&qword_255E59E50, MEMORY[0x24BDCB888]);
  sub_23037AE14();
  OUTLINED_FUNCTION_20_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E59E58);
  sub_230353168(&qword_255E59E60, (uint64_t (*)(void))sub_2303530EC, MEMORY[0x24BEE12A0]);
  sub_23037AE14();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v20, v8);
}

id sub_230352B1C(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return sub_230352B5C(a1);
}

id sub_230352B5C(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v16;
  objc_class *ObjectType;
  char *v18;
  uint64_t v19;
  char *v20;
  objc_super v21;
  uint64_t v22;
  char v23;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = sub_230379F74();
  v19 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_2_0();
  v8 = v7 - v6;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E59E70);
  OUTLINED_FUNCTION_21_6();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_2_0();
  v12 = v11 - v10;
  v13 = &v1[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_runningClockInterval];
  v20 = v1;
  v18 = v13;
  sub_230379F68();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2303530B0();
  sub_23037AFD0();
  if (v2)
  {
    v14 = ObjectType;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v5);

    swift_deallocPartialClassInstance();
  }
  else
  {
    *(_QWORD *)&v20[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_version] = OUTLINED_FUNCTION_3_11();
    v20[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_isSupported] = OUTLINED_FUNCTION_1_12(1) & 1;
    v20[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_isCountingDown] = OUTLINED_FUNCTION_1_12(2) & 1;
    v20[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_isEventClockRunning] = OUTLINED_FUNCTION_1_12(3) & 1;
    *(_QWORD *)&v20[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_staticClockValue] = OUTLINED_FUNCTION_3_11();
    *(_QWORD *)&v20[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_currentStopValue] = OUTLINED_FUNCTION_3_11();
    LOBYTE(v22) = 6;
    sub_230353128(&qword_255E59E78, MEMORY[0x24BDCB8A8]);
    OUTLINED_FUNCTION_28_10();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 40))(v13, v8, v5);
    swift_endAccess();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E59E58);
    v23 = 7;
    sub_230353168(&qword_255E59E80, (uint64_t (*)(void))sub_2303531C4, MEMORY[0x24BEE12D0]);
    OUTLINED_FUNCTION_28_10();
    *(_QWORD *)&v20[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_features] = v22;

    v21.receiver = v20;
    v21.super_class = ObjectType;
    v14 = objc_msgSendSuper2(&v21, sel_init);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v12, v16);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v14;
}

id sub_230352F08@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  id result;

  result = sub_230352B1C(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_230352F30(_QWORD *a1)
{
  return sub_230352844(a1);
}

BOOL sub_230352F50(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v6;
  _BYTE v7[24];
  uint64_t v8;

  OUTLINED_FUNCTION_107();
  sub_2303292B4(a1, (uint64_t)v7);
  if (v8)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*(unsigned __int8 *)(v1 + OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_isSupported) == v6[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_isSupported]
        && *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_isCountingDown) == v6[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_isCountingDown]
        && *(_QWORD *)(v1 + OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_staticClockValue) == *(_QWORD *)&v6[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_staticClockValue])
      {
        v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_version);
        v4 = *(_QWORD *)&v6[OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_version];

        return v3 == v4;
      }

    }
  }
  else
  {
    sub_2303292FC((uint64_t)v7);
  }
  return 0;
}

unint64_t sub_2303530B0()
{
  unint64_t result;

  result = qword_255E59E48;
  if (!qword_255E59E48)
  {
    result = MEMORY[0x2348B7C44](&unk_23038769C, &type metadata for SportingEventRunningClock.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59E48);
  }
  return result;
}

unint64_t sub_2303530EC()
{
  unint64_t result;

  result = qword_255E59E68;
  if (!qword_255E59E68)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportingEventRunningClockFeature, &type metadata for SportingEventRunningClockFeature);
    atomic_store(result, (unint64_t *)&qword_255E59E68);
  }
  return result;
}

uint64_t sub_230353128(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_230379F74();
    result = MEMORY[0x2348B7C44](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_230353168(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (!*a1)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E59E58);
    v7 = a2();
    atomic_store(MEMORY[0x2348B7C44](a3, v6, &v7), a1);
  }
  OUTLINED_FUNCTION_104();
}

unint64_t sub_2303531C4()
{
  unint64_t result;

  result = qword_255E59E88;
  if (!qword_255E59E88)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportingEventRunningClockFeature, &type metadata for SportingEventRunningClockFeature);
    atomic_store(result, (unint64_t *)&qword_255E59E88);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SportingEventRunningClock.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_23035324C + 4 * byte_23038753D[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_230353280 + 4 * byte_230387538[v4]))();
}

uint64_t sub_230353280(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_230353288(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x230353290);
  return result;
}

uint64_t sub_23035329C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2303532A4);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_2303532A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2303532B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SportingEventRunningClock.CodingKeys()
{
  return &type metadata for SportingEventRunningClock.CodingKeys;
}

unint64_t sub_2303532D0()
{
  unint64_t result;

  result = qword_255E59E90;
  if (!qword_255E59E90)
  {
    result = MEMORY[0x2348B7C44](&unk_230387674, &type metadata for SportingEventRunningClock.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59E90);
  }
  return result;
}

unint64_t sub_230353310()
{
  unint64_t result;

  result = qword_255E59E98;
  if (!qword_255E59E98)
  {
    result = MEMORY[0x2348B7C44](&unk_2303875E4, &type metadata for SportingEventRunningClock.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59E98);
  }
  return result;
}

unint64_t sub_230353350()
{
  unint64_t result;

  result = qword_255E59EA0;
  if (!qword_255E59EA0)
  {
    result = MEMORY[0x2348B7C44](&unk_23038760C, &type metadata for SportingEventRunningClock.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59EA0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_12@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 104) = a1;
  return sub_23037AD54();
}

uint64_t OUTLINED_FUNCTION_2_10()
{
  return sub_23037AA30();
}

uint64_t OUTLINED_FUNCTION_3_11()
{
  return sub_23037AD6C();
}

void OUTLINED_FUNCTION_4_11(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 0xCu);
}

uint64_t OUTLINED_FUNCTION_7_8()
{
  return SportingEvent.isEventClockRunning.getter();
}

BOOL OUTLINED_FUNCTION_8_9(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_13_8(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_23037A268();
}

uint64_t OUTLINED_FUNCTION_14_6()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_16_5@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 104) = a1;
  return sub_23037ADF0();
}

uint64_t OUTLINED_FUNCTION_17_11@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 104) = a1;
  return sub_23037AE08();
}

uint64_t OUTLINED_FUNCTION_18_8@<X0>(uint64_t (*a1)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, *(_QWORD *)(v2 - 168));
}

uint64_t OUTLINED_FUNCTION_20_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_22_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 184));
}

double OUTLINED_FUNCTION_24_9()
{
  double v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_28_10()
{
  return sub_23037AD78();
}

uint64_t OUTLINED_FUNCTION_32_6()
{
  return swift_bridgeObjectRelease();
}

Swift::OpaquePointer_optional __swiftcall SportingEventCompetitor.contextualShootouts()()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  Swift::Bool v8;
  void *v9;
  uint64_t v10;
  Swift::OpaquePointer_optional result;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit23SportingEventCompetitor__metadata);
  if (v1)
  {
    if (v1 >> 62)
      goto LABEL_19;
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_7_2();
    for (; v2; v2 = sub_23037AC94())
    {
      v3 = 4;
      while (1)
      {
        v4 = (v1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2348B72B4](v3 - 4, v1) : *(id *)(v1 + 8 * v3);
        v5 = v4;
        v6 = v3 - 3;
        if (__OFADD__(v3 - 4, 1))
          break;
        if (*((_BYTE *)v4 + OBJC_IVAR____TtC9SportsKit21SportingEventMetadata_metadataType)
          && *((_BYTE *)v4 + OBJC_IVAR____TtC9SportsKit21SportingEventMetadata_metadataType) != 2)
        {
          OUTLINED_FUNCTION_7();
LABEL_17:
          OUTLINED_FUNCTION_7();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();

          v10 = sub_230353A28();
          swift_bridgeObjectRelease();
          v9 = (void *)v10;
          goto LABEL_21;
        }
        v7 = sub_23037AE8C();
        swift_bridgeObjectRelease();
        if ((v7 & 1) != 0)
          goto LABEL_17;

        ++v3;
        if (v6 == v2)
          goto LABEL_13;
      }
      __break(1u);
LABEL_19:
      OUTLINED_FUNCTION_7_2();
    }
LABEL_13:
    OUTLINED_FUNCTION_56();
  }
  v9 = 0;
LABEL_21:
  result.value._rawValue = v9;
  result.is_nil = v8;
  return result;
}

uint64_t sub_2303536B4(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_23037AC94();
    v2 = result;
    if (result)
      goto LABEL_3;
LABEL_18:
    v5 = MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v2)
    goto LABEL_18;
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  v4 = 0;
  v5 = MEMORY[0x24BEE4AF8];
  do
  {
    if ((a1 & 0xC000000000000001) != 0)
      v6 = (id)MEMORY[0x2348B72B4](v4, a1);
    else
      v6 = *(id *)(a1 + 8 * v4 + 32);
    v7 = v6;
    LOBYTE(v33) = 7;
    v8 = sub_23033859C((unsigned __int8 *)&v33);
    if (v8)
    {
      v9 = (void *)v8;
      v10 = *(_QWORD *)(v8 + OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_value);

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_3_12();
        sub_2302D8668();
        v5 = v12;
      }
      v11 = *(_QWORD *)(v5 + 16);
      if (v11 >= *(_QWORD *)(v5 + 24) >> 1)
      {
        sub_2302D8668();
        v5 = v13;
      }
      *(_QWORD *)(v5 + 16) = v11 + 1;
      *(_QWORD *)(v5 + 8 * v11 + 32) = v10;
    }
    else
    {

    }
    ++v4;
  }
  while (v2 != v4);
LABEL_19:
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v5 + 16) == 2)
  {
    swift_bridgeObjectRetain();
    v14 = 0;
    v15 = 0;
    v16 = MEMORY[0x24BEE4AF8];
    do
    {
      v17 = v14;
      v33 = *(_QWORD *)(v5 + 32 + 8 * v15);
      v18 = sub_23037AE38();
      v20 = v19;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        v24 = OUTLINED_FUNCTION_3_12();
        sub_2302D864C(v24, v25, v26, v16);
        v16 = v27;
      }
      v22 = *(_QWORD *)(v16 + 16);
      v21 = *(_QWORD *)(v16 + 24);
      if (v22 >= v21 >> 1)
      {
        v28 = OUTLINED_FUNCTION_8_10(v21);
        sub_2302D864C(v28, v29, v30, v16);
        v16 = v31;
      }
      *(_QWORD *)(v16 + 16) = v22 + 1;
      v23 = v16 + 16 * v22;
      *(_QWORD *)(v23 + 32) = v18;
      *(_QWORD *)(v23 + 40) = v20;
      v14 = 1;
      v15 = 1;
    }
    while ((v17 & 1) == 0);
    OUTLINED_FUNCTION_56();
    v33 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25405B260);
    sub_230354094();
    v32 = sub_23037A55C();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_7();
    return 0;
  }
  return v32;
}

uint64_t SportingEventCompetitor.ShootoutResult.index.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void SportingEventCompetitor.ShootoutResult.type.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 8);
}

uint64_t SportingEventCompetitor.ShootoutResult.ShootoutResultType.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_23037ACDC();
  result = OUTLINED_FUNCTION_7();
  v4 = 3;
  if (v2 < 3)
    v4 = v2;
  *a1 = v4;
  return result;
}

uint64_t SportingEventCompetitor.ShootoutResult.ShootoutResultType.rawValue.getter()
{
  char *v0;

  return qword_230387808[*v0];
}

void sub_2303539D0(char *a1, char *a2)
{
  sub_2302E4C18(*a1, *a2);
}

void sub_2303539DC()
{
  sub_230332034();
}

uint64_t sub_2303539E4()
{
  return sub_2302D6FA8();
}

void sub_2303539EC()
{
  sub_230332304();
}

uint64_t sub_2303539F4@<X0>(char *a1@<X8>)
{
  return SportingEventCompetitor.ShootoutResult.ShootoutResultType.init(rawValue:)(a1);
}

uint64_t sub_230353A00@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = SportingEventCompetitor.ShootoutResult.ShootoutResultType.rawValue.getter();
  *a1 = result;
  a1[1] = 0xE100000000000000;
  return result;
}

uint64_t sub_230353A28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  uint64_t v17;
  char v18;
  unint64_t v19;
  unint64_t v20;
  unsigned __int8 v21;
  char v22;
  char v23;
  unsigned __int8 v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unsigned __int8 v31;
  uint64_t v32;
  unsigned __int8 v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t result;
  uint64_t v48;

  sub_2302DF64C();
  v1 = *(_QWORD *)(sub_23037AA54() + 16);
  if (!v1)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v2 = 0;
  v48 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    OUTLINED_FUNCTION_7_2();
    v3 = sub_23037A658();
    if (v3)
      break;
    v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_13:
    OUTLINED_FUNCTION_74_0();
    if (v4[2] != 2
      || ((v11 = v4[4],
           v12 = v4[5],
           v13 = HIBYTE(v12) & 0xF,
           v14 = v11 & 0xFFFFFFFFFFFFLL,
           (v12 & 0x2000000000000000) != 0)
        ? (v15 = HIBYTE(v12) & 0xF)
        : (v15 = v11 & 0xFFFFFFFFFFFFLL),
          !v15))
    {
LABEL_56:
      OUTLINED_FUNCTION_74_0();
      swift_release();
      goto LABEL_57;
    }
    if ((v12 & 0x1000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      sub_23034734C(v11, v12, 10);
      v17 = v35;
      LOBYTE(v0) = v36;
      swift_bridgeObjectRelease();
    }
    else if ((v12 & 0x2000000000000000) != 0)
    {
      v19 = v11 >> 8;
      v20 = v11 >> 16;
      if (v4[4] == 43)
      {
        if (!v13)
          goto LABEL_84;
        if (v13 == 1 || (BYTE1(v11) - 48) > 9u)
          goto LABEL_45;
        v17 = (BYTE1(v11) - 48);
        if (v13 != 2)
        {
          v21 = v20 - 48;
          if (v21 > 9u)
            goto LABEL_45;
          v17 = 10 * v17 + v21;
          if (v13 != 3)
          {
            while (1)
            {
              OUTLINED_FUNCTION_4_12();
              if (!v23 & v22)
                goto LABEL_45;
              OUTLINED_FUNCTION_0_11();
              if (!v23)
                goto LABEL_45;
              v17 = v25 + v24;
              if (__OFADD__(v25, v24))
                goto LABEL_45;
              OUTLINED_FUNCTION_2_11();
              if (v23)
                goto LABEL_48;
            }
          }
        }
      }
      else if (v4[4] == 45)
      {
        if (!v13)
          goto LABEL_83;
        if (v13 == 1 || (BYTE1(v11) - 48) > 9u)
          goto LABEL_45;
        if (v13 == 2)
        {
          LOBYTE(v0) = 0;
          v17 = -(uint64_t)(BYTE1(v11) - 48);
          goto LABEL_48;
        }
        if ((BYTE2(v11) - 48) > 9u)
          goto LABEL_45;
        v17 = -10 * (BYTE1(v11) - 48) - (BYTE2(v11) - 48);
        if (v13 != 3)
        {
          while (1)
          {
            OUTLINED_FUNCTION_4_12();
            if (!v23 & v22)
              break;
            OUTLINED_FUNCTION_0_11();
            if (!v23)
              break;
            v17 = v34 - v33;
            if (__OFSUB__(v34, v33))
              break;
            OUTLINED_FUNCTION_2_11();
            if (v23)
              goto LABEL_48;
          }
LABEL_45:
          v17 = 0;
          LOBYTE(v0) = 1;
          goto LABEL_48;
        }
      }
      else
      {
        if (!v13 || (v11 - 48) > 9u)
          goto LABEL_45;
        v17 = (v11 - 48);
        if (v13 != 1)
        {
          if ((v19 - 48) > 9u)
            goto LABEL_45;
          v17 = 10 * v17 + (v19 - 48);
          if (v13 != 2)
          {
            while (1)
            {
              OUTLINED_FUNCTION_4_12();
              if (!v23 & v22)
                goto LABEL_45;
              OUTLINED_FUNCTION_0_11();
              if (!v23)
                goto LABEL_45;
              v17 = v32 + v31;
              if (__OFADD__(v32, v31))
                goto LABEL_45;
              OUTLINED_FUNCTION_2_11();
              if (v23)
                goto LABEL_48;
            }
          }
        }
      }
      LOBYTE(v0) = 0;
    }
    else
    {
      if ((v11 & 0x1000000000000000) != 0)
        v16 = (unsigned __int8 *)((v12 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v16 = (unsigned __int8 *)sub_23037AB98();
      v17 = (uint64_t)sub_230347338(v16, v14, 10);
      LOBYTE(v0) = v18 & 1;
    }
LABEL_48:
    if ((v0 & 1) != 0)
      goto LABEL_56;
    if (v4[2] < 2uLL)
      goto LABEL_82;
    v0 = v4[6];
    swift_bridgeObjectRetain();
    swift_release();
    v26 = sub_23037ACDC();
    OUTLINED_FUNCTION_74_0();
    swift_bridgeObjectRelease();
    if (v26 <= 2)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      {
        v27 = v48;
      }
      else
      {
        v37 = OUTLINED_FUNCTION_3_12();
        sub_2302D8858(v37, v38, v39, v40);
        v27 = v41;
      }
      v29 = *(_QWORD *)(v27 + 16);
      v28 = *(_QWORD *)(v27 + 24);
      if (v29 >= v28 >> 1)
      {
        v42 = OUTLINED_FUNCTION_8_10(v28);
        sub_2302D8858(v42, v43, v44, v45);
        v27 = v46;
      }
      *(_QWORD *)(v27 + 16) = v29 + 1;
      v48 = v27;
      v30 = v27 + 16 * v29;
      *(_QWORD *)(v30 + 32) = v17;
      *(_BYTE *)(v30 + 40) = v26;
    }
LABEL_57:
    if (++v2 == v1)
    {
      OUTLINED_FUNCTION_56();
      return v48;
    }
  }
  v0 = v3;
  if (v3 < 1)
  {
    v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E59EB0);
    v4 = (_QWORD *)swift_allocObject();
    v5 = _swift_stdlib_malloc_size(v4);
    v4[2] = v0;
    v4[3] = 2 * ((uint64_t)(v5 - 32) / 16);
  }
  v6 = v0 & ~(v0 >> 63);
  swift_bridgeObjectRetain();
  v7 = 4;
  while (v6)
  {
    v8 = sub_23037A67C();
    if (!v9)
      goto LABEL_85;
    v10 = &v4[v7];
    *v10 = v8;
    v10[1] = v9;
    --v6;
    v7 += 2;
    if (!--v0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
  }
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_83:
  __break(1u);
LABEL_84:
  __break(1u);
LABEL_85:
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

void static SportingEventCompetitor.ShootoutResult.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)a1 == *(_QWORD *)a2)
    sub_2302E4C18(*(_BYTE *)(a1 + 8), *(_BYTE *)(a2 + 8));
}

unint64_t sub_230353EF8()
{
  unint64_t result;

  result = qword_255E59EA8;
  if (!qword_255E59EA8)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportingEventCompetitor.ShootoutResult.ShootoutResultType, &type metadata for SportingEventCompetitor.ShootoutResult.ShootoutResultType);
    atomic_store(result, (unint64_t *)&qword_255E59EA8);
  }
  return result;
}

uint64_t _s14ShootoutResultVwet(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 8);
      v4 = v3 >= 3;
      v2 = v3 - 3;
      if (!v4)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s14ShootoutResultVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SportingEventCompetitor.ShootoutResult()
{
  return &type metadata for SportingEventCompetitor.ShootoutResult;
}

uint64_t _s14ShootoutResultV18ShootoutResultTypeOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_230354014 + 4 * byte_2303876F5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_230354048 + 4 * byte_2303876F0[v4]))();
}

uint64_t sub_230354048(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_230354050(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x230354058);
  return result;
}

uint64_t sub_230354064(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23035406CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_230354070(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230354078(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SportingEventCompetitor.ShootoutResult.ShootoutResultType()
{
  return &type metadata for SportingEventCompetitor.ShootoutResult.ShootoutResultType;
}

unint64_t sub_230354094()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25405B268;
  if (!qword_25405B268)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25405B260);
    result = MEMORY[0x2348B7C44](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_25405B268);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_12()
{
  return 0;
}

BOOL OUTLINED_FUNCTION_8_10@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_230354134(unint64_t a1, char a2)
{
  uint64_t v4;
  id v5;

  *(_BYTE *)(swift_allocObject() + 16) = a2;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_23037AC94())
    {
LABEL_3:
      if ((a1 & 0xC000000000000001) != 0)
        MEMORY[0x2348B72B4](0, a1);
      else
        v5 = *(id *)(a1 + 32);
      __asm { BR              X8 }
    }
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
  }
  swift_bridgeObjectRelease();
  swift_release();
  return 0;
}

uint64_t SportingEventCompetitorContainer.BaseballScores.strikes.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t SportingEventCompetitorContainer.BaseballScores.outs.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t SportingEventCompetitorContainer.BaseballScores.hits.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 80);
}

uint64_t SportingEventCompetitorContainer.BaseballScores.errors.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 96);
}

uint64_t SportingEventCompetitorContainer.BaseballScores.description.getter()
{
  sub_23037AB14();
  sub_23037A670();
  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_34_8();
  sub_23037A670();
  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_34_8();
  sub_23037A670();
  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_34_8();
  OUTLINED_FUNCTION_53_5();
  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_34_8();
  OUTLINED_FUNCTION_16_6();
  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_34_8();
  OUTLINED_FUNCTION_16_6();
  OUTLINED_FUNCTION_6_10();
  sub_23037A670();
  OUTLINED_FUNCTION_7();
  return 0;
}

void SportingEventCompetitorContainer.baseballScores.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  BOOL v8;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  BOOL v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  _QWORD *v54;
  BOOL v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  BOOL v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  char v67;
  char v68;
  uint64_t v69;
  char v70;
  uint64_t v71;

  OUTLINED_FUNCTION_25_12();
  if (v4)
  {
    OUTLINED_FUNCTION_2_12();
    v5 = OUTLINED_FUNCTION_67_4();
  }
  else
  {
    v5 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_145();
  }
  if (!v5)
  {
LABEL_11:
    OUTLINED_FUNCTION_0_12();
    v71 = 0;
    v70 = 1;
    goto LABEL_25;
  }
  if ((v1 & 0xC000000000000001) != 0)
    goto LABEL_185;
  v6 = (char *)OUTLINED_FUNCTION_18_9();
  OUTLINED_FUNCTION_8_11(*(_QWORD *)&v6[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_statisticType]);
  v8 = v8 && v7 == 0xE500000000000000;
  if (!v8 && (OUTLINED_FUNCTION_40() & 1) == 0)
  {

    if (v5 != 1)
    {
      v2 = 5;
      while (1)
      {
        if ((v1 & 0xC000000000000001) != 0)
          OUTLINED_FUNCTION_7_9();
        OUTLINED_FUNCTION_37_7();
        OUTLINED_FUNCTION_23_8();
        if (v9)
          break;
        OUTLINED_FUNCTION_8_11(*(_QWORD *)&v6[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_statisticType]);
        v11 = v8 && v10 == 0xE500000000000000;
        if (v11 || (OUTLINED_FUNCTION_40() & 1) != 0)
          goto LABEL_24;

        OUTLINED_FUNCTION_49_6();
        if (v8)
          goto LABEL_11;
      }
      __break(1u);
      goto LABEL_179;
    }
    goto LABEL_11;
  }
LABEL_24:
  OUTLINED_FUNCTION_0_12();
  v71 = *(_QWORD *)&v6[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_value];

  v70 = 0;
LABEL_25:
  OUTLINED_FUNCTION_25_12();
  if (v12)
  {
    OUTLINED_FUNCTION_2_12();
    v13 = OUTLINED_FUNCTION_67_4();
    if (!v13)
      goto LABEL_34;
  }
  else
  {
    v13 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_145();
    if (!v13)
    {
LABEL_34:
      OUTLINED_FUNCTION_0_12();
      v69 = 0;
      v68 = 1;
      goto LABEL_48;
    }
  }
  if ((v1 & 0xC000000000000001) != 0)
    OUTLINED_FUNCTION_7_9();
  v14 = (char *)OUTLINED_FUNCTION_18_9();
  OUTLINED_FUNCTION_8_11(*(_QWORD *)&v14[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_statisticType]);
  v16 = v8 && v15 == 0xE400000000000000;
  if (!v16 && (OUTLINED_FUNCTION_40() & 1) == 0)
  {

    if (v13 == 1)
      goto LABEL_34;
    v2 = 5;
    while (1)
    {
      if ((v1 & 0xC000000000000001) != 0)
        OUTLINED_FUNCTION_7_9();
      OUTLINED_FUNCTION_37_7();
      OUTLINED_FUNCTION_23_8();
      if (v9)
        break;
      OUTLINED_FUNCTION_8_11(*(_QWORD *)&v14[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_statisticType]);
      v18 = v8 && v17 == 0xE400000000000000;
      if (v18 || (OUTLINED_FUNCTION_40() & 1) != 0)
        goto LABEL_47;

      OUTLINED_FUNCTION_49_6();
      if (v8)
        goto LABEL_34;
    }
LABEL_179:
    __break(1u);
    goto LABEL_180;
  }
LABEL_47:
  OUTLINED_FUNCTION_0_12();
  v69 = *(_QWORD *)&v14[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_value];

  v68 = 0;
LABEL_48:
  OUTLINED_FUNCTION_25_12();
  if (v19)
  {
    OUTLINED_FUNCTION_2_12();
    v20 = OUTLINED_FUNCTION_67_4();
    if (!v20)
      goto LABEL_57;
  }
  else
  {
    v20 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_145();
    if (!v20)
    {
LABEL_57:
      OUTLINED_FUNCTION_0_12();
      v24 = 0;
      v67 = 1;
      goto LABEL_71;
    }
  }
  if ((v1 & 0xC000000000000001) != 0)
    OUTLINED_FUNCTION_7_9();
  v21 = (char *)OUTLINED_FUNCTION_18_9();
  OUTLINED_FUNCTION_8_11(*(_QWORD *)&v21[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_statisticType]);
  v23 = v8 && v22 == 0xE500000000000000;
  if (!v23 && (OUTLINED_FUNCTION_40() & 1) == 0)
  {

    if (v20 == 1)
      goto LABEL_57;
    v2 = 5;
    while (1)
    {
      if ((v1 & 0xC000000000000001) != 0)
        OUTLINED_FUNCTION_7_9();
      OUTLINED_FUNCTION_37_7();
      OUTLINED_FUNCTION_23_8();
      if (v9)
        break;
      OUTLINED_FUNCTION_8_11(*(_QWORD *)&v21[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_statisticType]);
      v26 = v8 && v25 == 0xE500000000000000;
      if (v26 || (OUTLINED_FUNCTION_40() & 1) != 0)
        goto LABEL_70;

      OUTLINED_FUNCTION_49_6();
      if (v8)
        goto LABEL_57;
    }
LABEL_180:
    __break(1u);
LABEL_181:
    __break(1u);
LABEL_182:
    __break(1u);
LABEL_183:
    __break(1u);
LABEL_184:
    __break(1u);
LABEL_185:
    OUTLINED_FUNCTION_7_9();
  }
LABEL_70:
  OUTLINED_FUNCTION_0_12();
  v24 = *(_QWORD *)&v21[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_value];

  v67 = 0;
LABEL_71:
  OUTLINED_FUNCTION_25_12();
  if (v27)
  {
    OUTLINED_FUNCTION_2_12();
    v28 = OUTLINED_FUNCTION_67_4();
    if (v28)
      goto LABEL_73;
  }
  else
  {
    v28 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_145();
    if (v28)
    {
LABEL_73:
      if ((v1 & 0xC000000000000001) != 0)
        OUTLINED_FUNCTION_7_9();
      v29 = (char *)OUTLINED_FUNCTION_18_9();
      v24 = 0x73656B69727453;
      OUTLINED_FUNCTION_8_11(*(_QWORD *)&v29[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_statisticType]);
      v31 = v8 && v30 == 0xE700000000000000;
      if (v31 || (OUTLINED_FUNCTION_40() & 1) != 0)
      {
LABEL_93:
        OUTLINED_FUNCTION_0_12();
        v66 = *(_QWORD *)&v29[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_value];

        v65 = 0;
        goto LABEL_94;
      }

      if (v28 == 1)
      {
LABEL_80:
        OUTLINED_FUNCTION_0_12();
        OUTLINED_FUNCTION_41_8();
LABEL_94:
        OUTLINED_FUNCTION_14_7();
        goto LABEL_102;
      }
      v2 = 5;
      while (1)
      {
        if ((v1 & 0xC000000000000001) != 0)
          OUTLINED_FUNCTION_7_9();
        OUTLINED_FUNCTION_37_7();
        OUTLINED_FUNCTION_23_8();
        if (v9)
          goto LABEL_181;
        OUTLINED_FUNCTION_8_11(*(_QWORD *)&v29[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_statisticType]);
        v33 = v8 && v32 == 0xE700000000000000;
        if (v33 || (OUTLINED_FUNCTION_40() & 1) != 0)
          goto LABEL_93;

        OUTLINED_FUNCTION_49_6();
        if (v8)
          goto LABEL_80;
      }
    }
  }
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_41_8();
LABEL_102:
  OUTLINED_FUNCTION_25_12();
  if (v34)
  {
    OUTLINED_FUNCTION_2_12();
    v35 = OUTLINED_FUNCTION_67_4();
    if (!v35)
      goto LABEL_111;
  }
  else
  {
    v35 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_145();
    if (!v35)
    {
LABEL_111:
      OUTLINED_FUNCTION_0_12();
      v2 = 0;
      v63 = 1;
      goto LABEL_125;
    }
  }
  if ((v1 & 0xC000000000000001) != 0)
    OUTLINED_FUNCTION_7_9();
  v36 = (char *)OUTLINED_FUNCTION_18_9();
  OUTLINED_FUNCTION_29_6(*(_QWORD *)&v36[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_statisticType]);
  v38 = v8 && v37 == 0xE400000000000000;
  if (!v38 && (OUTLINED_FUNCTION_40() & 1) == 0)
  {

    if (v35 == 1)
      goto LABEL_111;
    OUTLINED_FUNCTION_45_5();
    while (1)
    {
      v39 = v24 - 4;
      if ((v1 & 0xC000000000000001) != 0)
        OUTLINED_FUNCTION_7_9();
      OUTLINED_FUNCTION_48_2();
      OUTLINED_FUNCTION_23_8();
      if (v9)
        goto LABEL_182;
      OUTLINED_FUNCTION_29_6(*(_QWORD *)&v36[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_statisticType]);
      v41 = v8 && v40 == v2;
      if (v41 || (OUTLINED_FUNCTION_40() & 1) != 0)
        break;

      ++v24;
      if (v39 == v35)
      {
        OUTLINED_FUNCTION_0_12();
        v2 = 0;
        v63 = 1;
        OUTLINED_FUNCTION_14_7();
        goto LABEL_125;
      }
    }
    OUTLINED_FUNCTION_14_7();
  }
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_47_7();
  v63 = 0;
LABEL_125:
  OUTLINED_FUNCTION_25_12();
  if (v42)
  {
    OUTLINED_FUNCTION_2_12();
    v43 = OUTLINED_FUNCTION_67_4();
  }
  else
  {
    v43 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_145();
  }
  v64 = v2;
  if (!v43)
    goto LABEL_135;
  if ((v1 & 0xC000000000000001) != 0)
    OUTLINED_FUNCTION_7_9();
  v44 = (char *)OUTLINED_FUNCTION_18_9();
  OUTLINED_FUNCTION_42_5(*(_QWORD *)&v44[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_statisticType]);
  v46 = v8 && v45 == 0xE400000000000000;
  if (!v46 && (OUTLINED_FUNCTION_40() & 1) == 0)
  {

    if (v43 == 1)
    {
LABEL_135:
      OUTLINED_FUNCTION_0_12();
      v2 = 0;
      v47 = 1;
      goto LABEL_149;
    }
    OUTLINED_FUNCTION_45_5();
    while (1)
    {
      v48 = v24 - 4;
      if ((v1 & 0xC000000000000001) != 0)
        OUTLINED_FUNCTION_7_9();
      OUTLINED_FUNCTION_48_2();
      OUTLINED_FUNCTION_23_8();
      if (v9)
        goto LABEL_183;
      OUTLINED_FUNCTION_42_5(*(_QWORD *)&v44[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_statisticType]);
      v50 = v8 && v49 == v2;
      if (v50 || (OUTLINED_FUNCTION_40() & 1) != 0)
        break;

      ++v24;
      if (v48 == v43)
      {
        OUTLINED_FUNCTION_0_12();
        v2 = 0;
        v47 = 1;
        OUTLINED_FUNCTION_14_7();
        goto LABEL_149;
      }
    }
    OUTLINED_FUNCTION_14_7();
  }
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_47_7();
  v47 = 0;
LABEL_149:
  OUTLINED_FUNCTION_25_12();
  if (v51)
  {
    OUTLINED_FUNCTION_2_12();
    v52 = OUTLINED_FUNCTION_67_4();
    if (!v52)
      goto LABEL_158;
LABEL_151:
    if ((v1 & 0xC000000000000001) != 0)
      OUTLINED_FUNCTION_7_9();
    v53 = (char *)OUTLINED_FUNCTION_18_9();
    v54 = (_QWORD *)(*(_QWORD *)&v53[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_statisticType]
                   + OBJC_IVAR____TtC9SportsKit41SportingEventCompetitorScoreStatisticType_name);
    v55 = *v54 == 0x73726F727245 && v54[1] == 0xE600000000000000;
    if (!v55 && (OUTLINED_FUNCTION_40() & 1) == 0)
    {

      if (v52 == 1)
        goto LABEL_158;
      v62 = v24;
      v58 = 5;
      while (1)
      {
        v59 = v58 - 4;
        if ((v1 & 0xC000000000000001) != 0)
          OUTLINED_FUNCTION_7_9();
        OUTLINED_FUNCTION_48_2();
        OUTLINED_FUNCTION_23_8();
        if (v9)
          goto LABEL_184;
        v60 = (_QWORD *)(*(_QWORD *)&v53[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_statisticType]
                       + OBJC_IVAR____TtC9SportsKit41SportingEventCompetitorScoreStatisticType_name);
        v61 = *v60 == 0x73726F727245 && v60[1] == 0xE600000000000000;
        if (v61 || (OUTLINED_FUNCTION_40() & 1) != 0)
          break;

        ++v58;
        if (v59 == v52)
        {
          OUTLINED_FUNCTION_0_12();
          v56 = 0;
          v57 = 1;
          v24 = v62;
          goto LABEL_172;
        }
      }
      v24 = v62;
    }
    OUTLINED_FUNCTION_0_12();
    v56 = *(_QWORD *)&v53[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_value];

    v57 = 0;
    goto LABEL_172;
  }
  v52 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_145();
  if (v52)
    goto LABEL_151;
LABEL_158:
  OUTLINED_FUNCTION_0_12();
  v56 = 0;
  v57 = 1;
LABEL_172:
  *(_QWORD *)a1 = v71;
  *(_BYTE *)(a1 + 8) = v70;
  *(_QWORD *)(a1 + 16) = v69;
  *(_BYTE *)(a1 + 24) = v68;
  *(_QWORD *)(a1 + 32) = v24;
  *(_BYTE *)(a1 + 40) = v67;
  *(_QWORD *)(a1 + 48) = v66;
  *(_BYTE *)(a1 + 56) = v65;
  *(_QWORD *)(a1 + 64) = v64;
  *(_BYTE *)(a1 + 72) = v63;
  *(_QWORD *)(a1 + 80) = v2;
  *(_BYTE *)(a1 + 88) = v47;
  *(_QWORD *)(a1 + 96) = v56;
  *(_BYTE *)(a1 + 104) = v57;
}

uint64_t SportingEventCompetitorContainer.BaseballScoreEntry.isUpdated.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 9);
}

void SportingEventCompetitorContainer.BaseballScoreEntries.totalScore.getter(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_9_9(a1);
}

void SportingEventCompetitorContainer.BaseballScoreEntries.runs.getter(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_9_9(a1);
}

void SportingEventCompetitorContainer.BaseballScoreEntries.balls.getter(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_9_9(a1);
}

void SportingEventCompetitorContainer.BaseballScoreEntries.strikes.getter(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_9_9(a1);
}

void SportingEventCompetitorContainer.BaseballScoreEntries.outs.getter(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_9_9(a1);
}

void SportingEventCompetitorContainer.BaseballScoreEntries.hits.getter(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_9_9(a1);
}

void SportingEventCompetitorContainer.BaseballScoreEntries.errors.getter(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_9_9(a1);
}

void SportingEventCompetitorContainer.baseballScoreEntries.getter(uint64_t a1@<X8>)
{
  uint64_t v2;
  __int16 v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;

  LOBYTE(v27) = 0;
  sub_230355208((char *)&v27, (uint64_t)&v29);
  v15 = v29;
  v14 = v30;
  LOBYTE(v25) = 1;
  sub_230355208((char *)&v25, (uint64_t)&v27);
  v13 = v27;
  v12 = v28;
  LOBYTE(v23) = 5;
  sub_230355208((char *)&v23, (uint64_t)&v25);
  v2 = v25;
  v3 = v26;
  LOBYTE(v21) = 4;
  sub_230355208((char *)&v21, (uint64_t)&v23);
  v4 = v23;
  v5 = v24;
  LOBYTE(v19) = 6;
  sub_230355208((char *)&v19, (uint64_t)&v21);
  v6 = v21;
  v7 = v22;
  LOBYTE(v17) = 2;
  sub_230355208((char *)&v17, (uint64_t)&v19);
  v8 = v19;
  v9 = v20;
  v16 = 3;
  sub_230355208(&v16, (uint64_t)&v17);
  v10 = v17;
  v11 = v18;
  *(_QWORD *)a1 = v15;
  *(_WORD *)(a1 + 8) = v14;
  *(_QWORD *)(a1 + 16) = v13;
  *(_WORD *)(a1 + 24) = v12;
  *(_QWORD *)(a1 + 32) = v2;
  *(_WORD *)(a1 + 40) = v3;
  *(_QWORD *)(a1 + 48) = v4;
  *(_WORD *)(a1 + 56) = v5;
  *(_QWORD *)(a1 + 64) = v6;
  *(_WORD *)(a1 + 72) = v7;
  *(_QWORD *)(a1 + 80) = v8;
  *(_WORD *)(a1 + 88) = v9;
  *(_QWORD *)(a1 + 96) = v10;
  *(_WORD *)(a1 + 104) = v11;
}

void sub_230355208(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v3;
  unint64_t v4;
  char *v5;
  uint64_t v6;
  __int16 v7;
  __int16 v8;

  v3 = *a1;
  v4 = swift_bridgeObjectRetain();
  v5 = (char *)sub_230354134(v4, v3);
  swift_bridgeObjectRelease();
  if (v5)
  {
    v6 = *(_QWORD *)&v5[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_value];
    v7 = *(unsigned __int8 *)(*(_QWORD *)&v5[OBJC_IVAR____TtC9SportsKit33SportingEventCompetitorScoreEntry_statisticType]
                            + OBJC_IVAR____TtC9SportsKit41SportingEventCompetitorScoreStatisticType__isUpdated);

    v8 = v7 << 8;
  }
  else
  {
    v6 = 0;
    v8 = 768;
  }
  *(_QWORD *)a2 = v6;
  *(_WORD *)(a2 + 8) = v8;
}

void SportingEventPlay.BaseballPlay.Runner.displayName.getter()
{
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_3();
}

uint64_t SportingEventPlay.BaseballPlay.Runner.startingBase.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t SportingEventPlay.BaseballPlay.Runner.endingBase.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

void SportingEventPlay.BaseballPlay.Runner.description.getter()
{
  OUTLINED_FUNCTION_35_4();
  sub_23037AB14();
  OUTLINED_FUNCTION_27_7();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_36_6();
  sub_23037A670();
  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_57_6();
  OUTLINED_FUNCTION_32_0();
  sub_23037A670();
  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_28_11();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_32_7();
}

void SportingEventPlay.BaseballPlay.Hitter.displayName.getter()
{
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_3();
}

uint64_t SportingEventPlay.BaseballPlay.Hitter.description.getter()
{
  uint64_t v1;

  OUTLINED_FUNCTION_35_4();
  sub_23037AB14();
  OUTLINED_FUNCTION_27_7();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_36_6();
  OUTLINED_FUNCTION_16_6();
  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_57_6();
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_56_3();
  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_28_11();
  OUTLINED_FUNCTION_7();
  return v1;
}

void SportingEventPlay.BaseballPlay.Pitcher.displayName.getter()
{
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_3();
}

void SportingEventPlay.BaseballPlay.Pitcher.description.getter()
{
  OUTLINED_FUNCTION_35_4();
  sub_23037AB14();
  OUTLINED_FUNCTION_27_7();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_36_6();
  sub_23037A670();
  sub_23037AE38();
  OUTLINED_FUNCTION_28_11();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_32_7();
}

uint64_t SportingEventPlay.BaseballPlay.PitchIndexIndicatorType.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_23037ACDC();
  result = OUTLINED_FUNCTION_7();
  v4 = 3;
  if (v2 < 3)
    v4 = v2;
  *a1 = v4;
  return result;
}

uint64_t SportingEventPlay.BaseballPlay.PitchIndexIndicatorType.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x65757161704FLL;
  if (*v0 != 1)
    v1 = 0x656E696C74754FLL;
  if (*v0)
    return v1;
  else
    return 0x6574696857;
}

void sub_23035561C(unsigned __int8 *a1, char *a2)
{
  sub_2302E5374(*a1, *a2);
}

void sub_230355628()
{
  sub_230332040();
}

uint64_t sub_230355630()
{
  return sub_2302D7274();
}

void sub_230355638()
{
  sub_230332254();
}

uint64_t sub_230355640@<X0>(char *a1@<X8>)
{
  return SportingEventPlay.BaseballPlay.PitchIndexIndicatorType.init(rawValue:)(a1);
}

uint64_t sub_23035564C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = SportingEventPlay.BaseballPlay.PitchIndexIndicatorType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t SportingEventPlay.BaseballPlay.runners.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SportingEventPlay.BaseballPlay.pitcher.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 32);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 16);
  *(_BYTE *)(a1 + 24) = v2;
  return OUTLINED_FUNCTION_30_5();
}

uint64_t SportingEventPlay.BaseballPlay.hitter.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  __int128 v3;

  v2 = *(_BYTE *)(v1 + 80);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 40);
  v3 = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(a1 + 24) = v3;
  *(_BYTE *)(a1 + 40) = v2;
  return OUTLINED_FUNCTION_30_5();
}

void SportingEventPlay.BaseballPlay.title.getter()
{
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_3();
}

void SportingEventPlay.BaseballPlay.subtitle.getter()
{
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_3();
}

void SportingEventPlay.BaseballPlay.pitchIndex.getter()
{
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_3();
}

void SportingEventPlay.BaseballPlay.pitchIndexIndicator.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 136);
}

uint64_t SportingEventPlay.BaseballPlay.description.getter()
{
  uint64_t v0;

  sub_23037AB14();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_31_1();
  sub_23037A670();
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_56_3();
  swift_bridgeObjectRetain();
  sub_23037A670();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_53_5();
  v0 = swift_bridgeObjectRetain();
  MEMORY[0x2348B6ED0](v0, &type metadata for SportingEventPlay.BaseballPlay.Runner);
  sub_23037A670();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_41();
  return 0x3D72656863746950;
}

void SportingEventPlay.baseballPlay.getter(uint64_t a1@<X8>)
{
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id *v9;
  unint64_t v10;
  BOOL v11;
  char v12;
  BOOL v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  unint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  id *v25;
  uint64_t v26;
  BOOL v27;
  _QWORD *v28;
  uint64_t v29;
  unint64_t v30;
  id *v31;
  uint64_t v32;
  BOOL v33;
  unint64_t *v34;
  uint64_t v35;
  id v36;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v43;
  id v44;
  uint64_t v46;
  id v47;
  unint64_t v49;
  void *v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  _QWORD *v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  unint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  __int128 v65;
  uint64_t v66;
  char v67;
  unint64_t v68;

  v59 = OBJC_IVAR____TtC9SportsKit17SportingEventPlay__participants;
  v6 = *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC9SportsKit17SportingEventPlay__participants);
  if (!v6)
  {
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    v5 = 0;
    OUTLINED_FUNCTION_15_7();
    goto LABEL_92;
  }
  v63 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if ((unint64_t)v6 >> 62)
    goto LABEL_31;
  v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_31_1();
  if (v7)
  {
    while (1)
    {
      v8 = 0;
      v5 = v6 & 0xC000000000000001;
      v2 = 0xE600000000000000;
      while (v5)
      {
        v9 = (id *)MEMORY[0x2348B72B4](v8, v6);
LABEL_8:
        v3 = (unint64_t)v9;
        v10 = v8 + 1;
        if (__OFADD__(v8, 1))
          goto LABEL_30;
        v1 = *(id *)((char *)v9 + OBJC_IVAR____TtC9SportsKit24SportingEventParticipant__position + 8);
        if (v1
          && ((v4 = *(id *)((char *)v9 + OBJC_IVAR____TtC9SportsKit24SportingEventParticipant__position),
               v4 == (void *)0x72656E6E7552)
            ? (v11 = v1 == (_QWORD *)0xE600000000000000)
            : (v11 = 0),
              v11
           || ((v12 = OUTLINED_FUNCTION_40(), v4 == (void *)0x726574746948)
             ? (v13 = v1 == (_QWORD *)0xE600000000000000)
             : (v13 = 0),
               !v13 ? (v14 = 0) : (v14 = 1),
               (v12 & 1) != 0 || (v14 & 1) != 0 || (OUTLINED_FUNCTION_40() & 1) != 0)))
        {
          v1 = &v63;
          sub_23037ABA4();
          v4 = (void *)v63[2];
          sub_23037ABC8();
          sub_23037ABD4();
          sub_23037ABB0();
        }
        else
        {

        }
        ++v8;
        if (v10 == v7)
        {
          v15 = (unint64_t)v63;
          goto LABEL_36;
        }
      }
      if (v8 < *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_30:
      __break(1u);
LABEL_31:
      if (v6 >= 0)
        v1 = (_QWORD *)(v6 & 0xFFFFFFFFFFFFFF8);
      else
        v1 = (_QWORD *)v6;
      OUTLINED_FUNCTION_31_1();
      v7 = sub_23037AC94();
      if (!v7)
        goto LABEL_35;
    }
    v9 = (id *)*(id *)(v6 + 8 * v8 + 32);
    goto LABEL_8;
  }
LABEL_35:
  v15 = MEMORY[0x24BEE4AF8];
LABEL_36:
  OUTLINED_FUNCTION_41();
  if ((v15 & 0x8000000000000000) != 0 || (v15 & 0x4000000000000000) != 0)
  {
    swift_retain();
    v16 = sub_23037AC94();
    if (v16)
      goto LABEL_39;
LABEL_53:
    v5 = MEMORY[0x24BEE4AF8];
    goto LABEL_54;
  }
  v16 = *(_QWORD *)(v15 + 16);
  swift_retain();
  if (!v16)
    goto LABEL_53;
LABEL_39:
  if (v16 < 1)
  {
    __break(1u);
    goto LABEL_137;
  }
  v3 = 0;
  v5 = MEMORY[0x24BEE4AF8];
  do
  {
    if ((v15 & 0xC000000000000001) != 0)
      v17 = (id)MEMORY[0x2348B72B4](v3, v15);
    else
      v17 = *(id *)(v15 + 8 * v3 + 32);
    v4 = v17;
    v68 = (unint64_t)v17;
    v18 = (unint64_t *)OUTLINED_FUNCTION_43_8();
    sub_230356564(v18, v19);

    v1 = v64;
    if (v64)
    {
      v6 = (uint64_t)v63;
      v61 = v65;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_50_6();
        v5 = v21;
      }
      v2 = *(_QWORD *)(v5 + 16);
      v4 = (void *)(v2 + 1);
      if (v2 >= *(_QWORD *)(v5 + 24) >> 1)
      {
        OUTLINED_FUNCTION_50_6();
        v5 = v22;
      }
      *(_QWORD *)(v5 + 16) = v4;
      v20 = v5 + 32 * v2;
      *(_QWORD *)(v20 + 32) = v6;
      *(_QWORD *)(v20 + 40) = v1;
      *(_OWORD *)(v20 + 48) = v61;
    }
    ++v3;
  }
  while (v16 != v3);
LABEL_54:
  swift_release_n();
  v15 = *(_QWORD *)(v60 + v59);
  if (!v15)
  {
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
LABEL_89:
    OUTLINED_FUNCTION_15_7();
    goto LABEL_92;
  }
  if (!(v15 >> 62))
  {
    v23 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_7_2();
    goto LABEL_57;
  }
LABEL_137:
  OUTLINED_FUNCTION_7_2();
  v23 = sub_23037AC94();
LABEL_57:
  v62 = v5;
  if (v23)
  {
    v24 = 0x72656863746950;
    v1 = (_QWORD *)(v15 & 0xC000000000000001);
    v2 = 4;
    v5 = 0xE700000000000000;
    while (1)
    {
      v4 = (void *)(v2 - 4);
      if (v1)
        OUTLINED_FUNCTION_51_4();
      v25 = (id *)*(id *)(v15 + 8 * v2);
      v3 = (unint64_t)v25;
      v6 = v2 - 3;
      if (__OFADD__(v4, 1))
        break;
      v26 = *(uint64_t *)((char *)v25 + OBJC_IVAR____TtC9SportsKit24SportingEventParticipant__position + 8);
      if (v26)
      {
        v27 = *(id *)((char *)v25 + OBJC_IVAR____TtC9SportsKit24SportingEventParticipant__position) == (id)0x72656863746950
           && v26 == 0xE700000000000000;
        if (v27 || (OUTLINED_FUNCTION_40() & 1) != 0)
        {
          OUTLINED_FUNCTION_56();
          v68 = v3;
          v28 = (_QWORD *)OUTLINED_FUNCTION_43_8();
          sub_230356D04(v28, v29);

          v55 = v64;
          v56 = v65;
          v57 = v63;
          v54 = BYTE8(v65);
          goto LABEL_73;
        }
      }

      ++v2;
      if (v6 == v23)
      {
        OUTLINED_FUNCTION_56();
        v56 = 0;
        v57 = 0;
        v55 = 0;
        v54 = 0;
LABEL_73:
        v5 = v62;
        goto LABEL_74;
      }
    }
    __break(1u);
    __break(1u);
    goto LABEL_134;
  }
  OUTLINED_FUNCTION_56();
  v56 = 0;
  v57 = 0;
  v55 = 0;
  v54 = 0;
LABEL_74:
  v30 = *(_QWORD *)(v60 + v59);
  if (!v30)
    goto LABEL_89;
  if (v30 >> 62)
  {
    OUTLINED_FUNCTION_7_2();
    v23 = sub_23037AC94();
    if (v23)
    {
LABEL_77:
      v24 = 0x726574746948;
      v1 = (_QWORD *)(v30 & 0xC000000000000001);
      v2 = 4;
      v5 = 0xE600000000000000;
      while (1)
      {
        v4 = (void *)(v2 - 4);
        if (v1)
          OUTLINED_FUNCTION_51_4();
        v31 = (id *)*(id *)(v30 + 8 * v2);
        v3 = (unint64_t)v31;
        v6 = v2 - 3;
        if (__OFADD__(v4, 1))
          break;
        v32 = *(uint64_t *)((char *)v31 + OBJC_IVAR____TtC9SportsKit24SportingEventParticipant__position + 8);
        if (v32)
        {
          v33 = *(id *)((char *)v31 + OBJC_IVAR____TtC9SportsKit24SportingEventParticipant__position) == (id)0x726574746948
             && v32 == 0xE600000000000000;
          if (v33 || (OUTLINED_FUNCTION_40() & 1) != 0)
          {
            OUTLINED_FUNCTION_56();
            v68 = v3;
            v34 = (unint64_t *)OUTLINED_FUNCTION_43_8();
            sub_230356FDC(v34, v35);

            v1 = v63;
            v4 = v64;
            v59 = v65;
            v53 = BYTE8(v65);
            v52 = v66;
            v51 = v67;
            goto LABEL_91;
          }
        }

        ++v2;
        if (v6 == v23)
          goto LABEL_88;
      }
LABEL_134:
      __break(1u);
      __break(1u);
      goto LABEL_135;
    }
  }
  else
  {
    v23 = *(_QWORD *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_7_2();
    if (v23)
      goto LABEL_77;
  }
LABEL_88:
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_15_7();
LABEL_91:
  v5 = v62;
LABEL_92:
  v24 = OBJC_IVAR____TtC9SportsKit17SportingEventPlay__playDescriptors;
  v23 = *(_QWORD *)(v60 + OBJC_IVAR____TtC9SportsKit17SportingEventPlay__playDescriptors);
  if (!v23)
  {
LABEL_100:
    OUTLINED_FUNCTION_39_6();
    goto LABEL_129;
  }
  if (!(v23 >> 62))
  {
    v3 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_7_2();
    goto LABEL_95;
  }
LABEL_135:
  OUTLINED_FUNCTION_7_2();
  v3 = OUTLINED_FUNCTION_38_7();
LABEL_95:
  v50 = v4;
  if (v3)
  {
    if ((v23 & 0xC000000000000001) != 0)
      MEMORY[0x2348B72B4](0, v23);
    else
      v36 = *(id *)(v23 + 32);
    OUTLINED_FUNCTION_46_5();
    __asm { BR              X9 }
  }
  OUTLINED_FUNCTION_56();
  v39 = *(_QWORD *)(v60 + v24);
  if (!v39)
    goto LABEL_100;
  if (v39 >> 62)
  {
    OUTLINED_FUNCTION_7_2();
    v40 = OUTLINED_FUNCTION_38_7();
  }
  else
  {
    v40 = *(_QWORD *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_7_2();
  }
  if (v40)
  {
    if ((v39 & 0xC000000000000001) != 0)
      MEMORY[0x2348B72B4](0, v39);
    else
      v41 = *(id *)(v39 + 32);
    OUTLINED_FUNCTION_24_10();
    __asm { BR              X9 }
  }
  OUTLINED_FUNCTION_56();
  v38 = 0;
  v3 = *(_QWORD *)(v60 + v24);
  if (v3)
  {
    if (v3 >> 62)
    {
      OUTLINED_FUNCTION_7_2();
      v43 = OUTLINED_FUNCTION_38_7();
    }
    else
    {
      v43 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      OUTLINED_FUNCTION_7_2();
    }
    if (v43)
    {
      if ((v3 & 0xC000000000000001) != 0)
        MEMORY[0x2348B72B4](0, v3);
      else
        v44 = *(id *)(v3 + 32);
      OUTLINED_FUNCTION_46_5();
      __asm { BR              X9 }
    }
    OUTLINED_FUNCTION_56();
    v3 = 0;
    v6 = 0;
    v4 = v50;
    v2 = *(_QWORD *)(v60 + v24);
    v38 = 0;
    if (v2)
    {
      if (v2 >> 62)
      {
        OUTLINED_FUNCTION_7_2();
        v46 = OUTLINED_FUNCTION_38_7();
      }
      else
      {
        v46 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
        OUTLINED_FUNCTION_7_2();
      }
      if (v46)
      {
        if ((v2 & 0xC000000000000001) != 0)
          MEMORY[0x2348B72B4](0, v2);
        else
          v47 = *(id *)(v2 + 32);
        OUTLINED_FUNCTION_46_5();
        __asm { BR              X9 }
      }
      OUTLINED_FUNCTION_56();
      v24 = 0;
      v2 = 0;
      v38 = 0;
      v3 = 0;
    }
    else
    {
      v24 = 0;
    }
  }
  else
  {
    v6 = 0;
    v24 = 0;
    v2 = 0;
  }
LABEL_129:
  if (v5)
    v49 = v5;
  else
    v49 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)a1 = v49;
  *(_QWORD *)(a1 + 8) = v57;
  *(_QWORD *)(a1 + 16) = v55;
  *(_QWORD *)(a1 + 24) = v56;
  *(_BYTE *)(a1 + 32) = v54;
  *(_QWORD *)(a1 + 40) = v1;
  *(_QWORD *)(a1 + 48) = v4;
  *(_QWORD *)(a1 + 56) = v59;
  *(_QWORD *)(a1 + 64) = v53;
  *(_QWORD *)(a1 + 72) = v52;
  *(_BYTE *)(a1 + 80) = v51;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = v38;
  *(_QWORD *)(a1 + 104) = v3;
  *(_QWORD *)(a1 + 112) = v6;
  *(_QWORD *)(a1 + 120) = v24;
  *(_QWORD *)(a1 + 128) = v2;
  *(_BYTE *)(a1 + 136) = 3;
}

void sub_230356564(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *i;
  char *v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 *v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  unsigned __int8 *v27;
  unsigned int v28;
  uint64_t v29;
  char *v30;
  _QWORD *v31;
  BOOL v32;
  uint64_t v33;
  unsigned __int8 *v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int8 *v38;
  unsigned int v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  _QWORD *v43;
  BOOL v44;
  uint64_t v45;
  char *v46;
  _QWORD *v47;
  BOOL v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  char v54;
  unint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  _QWORD v63[2];

  v3 = v2;
  v5 = *a1;
  v6 = (uint64_t *)(*a1 + OBJC_IVAR____TtC9SportsKit24SportingEventParticipant__displayName);
  if (v6[1])
  {
    v7 = *v6;
    v8 = v6[1];
  }
  else
  {
    v7 = 0;
    v8 = 0xE000000000000000;
  }
  v9 = (char *)OBJC_IVAR____TtC9SportsKit24SportingEventParticipant__metadata;
  v10 = *(_QWORD *)(v5 + OBJC_IVAR____TtC9SportsKit24SportingEventParticipant__metadata);
  v61 = v8;
  if (!v10)
  {
    swift_bridgeObjectRetain();
    goto LABEL_86;
  }
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    v11 = sub_23037AC94();
    if (v11)
      goto LABEL_7;
LABEL_85:
    swift_bridgeObjectRelease_n();
    goto LABEL_86;
  }
  v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  if (!v11)
    goto LABEL_85;
LABEL_7:
  v60 = v7;
  v12 = v10 & 0xC000000000000001;
  v62 = v2;
  if ((v10 & 0xC000000000000001) != 0)
    goto LABEL_122;
  for (i = (char *)*(id *)(v10 + 32); ; i = (char *)MEMORY[0x2348B72B4](0, v10))
  {
    v14 = i;
    v15 = (_QWORD *)(*(_QWORD *)&i[OBJC_IVAR____TtC9SportsKit32SportingEventParticipantMetadata_metadataType]
                   + OBJC_IVAR____TtC9SportsKit36SportingEventParticipantMetadataType_name);
    v16 = *v15 == 0x676E697472617453 && v15[1] == 0xEC00000065736142;
    if (!v16 && (sub_23037AE8C() & 1) == 0)
    {

      if (v11 != 1)
      {
        v58 = a2;
        v59 = v9;
        a2 = 5;
        while (1)
        {
          v30 = v12 ? (char *)MEMORY[0x2348B72B4](a2 - 4, v10) : (char *)*(id *)(v10 + 8 * a2);
          v14 = v30;
          v9 = (char *)(a2 - 3);
          if (__OFADD__(a2 - 4, 1))
            break;
          v31 = (_QWORD *)(*(_QWORD *)&v30[OBJC_IVAR____TtC9SportsKit32SportingEventParticipantMetadata_metadataType]
                         + OBJC_IVAR____TtC9SportsKit36SportingEventParticipantMetadataType_name);
          v32 = *v31 == 0x676E697472617453 && v31[1] == 0xEC00000065736142;
          if (v32 || (sub_23037AE8C() & 1) != 0)
          {
            a2 = v58;
            goto LABEL_15;
          }

          ++a2;
          if (v9 == (char *)v11)
          {
            swift_bridgeObjectRelease_n();
            a2 = v58;
            v9 = v59;
            goto LABEL_61;
          }
        }
        __break(1u);
        goto LABEL_121;
      }
      swift_bridgeObjectRelease_n();
LABEL_61:
      v3 = v62;
      v7 = v60;
      goto LABEL_86;
    }
    v59 = v9;
LABEL_15:
    swift_bridgeObjectRelease_n();
    v17 = *(_QWORD *)&v14[OBJC_IVAR____TtC9SportsKit32SportingEventParticipantMetadata_value];
    v18 = *(_QWORD *)&v14[OBJC_IVAR____TtC9SportsKit32SportingEventParticipantMetadata_value + 8];
    v19 = HIBYTE(v18) & 0xF;
    v20 = v17 & 0xFFFFFFFFFFFFLL;
    v21 = (v18 & 0x2000000000000000) != 0 ? HIBYTE(v18) & 0xF : v17 & 0xFFFFFFFFFFFFLL;
    v3 = v62;
    v7 = v60;
    if (v21)
      break;

    v9 = v59;
LABEL_86:
    v23 = -1;
LABEL_87:
    v41 = *(_QWORD *)&v9[v5];
    if (!v41)
      goto LABEL_114;
    v62 = v3;
    if (v41 >> 62)
    {
      swift_bridgeObjectRetain_n();
      v11 = sub_23037AC94();
      if (!v11)
      {
LABEL_116:
        v60 = v23;
LABEL_117:
        swift_bridgeObjectRelease_n();
        v55 = v61;
        v23 = v60;
        goto LABEL_118;
      }
    }
    else
    {
      v11 = *(_QWORD *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      if (!v11)
        goto LABEL_116;
    }
    if ((v41 & 0xC000000000000001) != 0)
      v42 = (char *)MEMORY[0x2348B72B4](0, v41);
    else
      v42 = (char *)*(id *)(v41 + 32);
    v9 = v42;
    v43 = (_QWORD *)(*(_QWORD *)&v42[OBJC_IVAR____TtC9SportsKit32SportingEventParticipantMetadata_metadataType]
                   + OBJC_IVAR____TtC9SportsKit36SportingEventParticipantMetadataType_name);
    v44 = *v43 == 0x6142676E69646E45 && v43[1] == 0xEA00000000006573;
    if (v44 || (sub_23037AE8C() & 1) != 0)
    {
LABEL_112:
      swift_bridgeObjectRelease_n();
      v49 = *(_QWORD *)&v9[OBJC_IVAR____TtC9SportsKit32SportingEventParticipantMetadata_value];
      v50 = *(_QWORD *)&v9[OBJC_IVAR____TtC9SportsKit32SportingEventParticipantMetadata_value + 8];
      swift_bridgeObjectRetain();
      sub_23033413C(v49, v50);
      v52 = v51;
      v54 = v53;

      if ((v54 & 1) == 0)
      {
        v55 = v61;
LABEL_119:
        *(_QWORD *)a2 = v7;
        *(_QWORD *)(a2 + 8) = v55;
        *(_QWORD *)(a2 + 16) = v23;
        *(_QWORD *)(a2 + 24) = v52;
        return;
      }
LABEL_114:
      v55 = v61;
LABEL_118:
      v52 = -1;
      goto LABEL_119;
    }
    v60 = v23;

    if (v11 == 1)
      goto LABEL_117;
    v10 = 5;
    while (1)
    {
      v45 = v7;
      v5 = v10 - 4;
      v12 = a2;
      v46 = (v41 & 0xC000000000000001) != 0
          ? (char *)MEMORY[0x2348B72B4](v10 - 4, v41)
          : (char *)*(id *)(v41 + 8 * v10);
      v9 = v46;
      a2 = v10 - 3;
      if (__OFADD__(v5, 1))
        break;
      v47 = (_QWORD *)(*(_QWORD *)&v46[OBJC_IVAR____TtC9SportsKit32SportingEventParticipantMetadata_metadataType]
                     + OBJC_IVAR____TtC9SportsKit36SportingEventParticipantMetadataType_name);
      v48 = *v47 == 0x6142676E69646E45 && v47[1] == 0xEA00000000006573;
      if (v48 || (sub_23037AE8C() & 1) != 0)
      {
        a2 = v12;
        v7 = v45;
        v23 = v60;
        goto LABEL_112;
      }

      ++v10;
      v16 = a2 == v11;
      a2 = v12;
      v7 = v45;
      if (v16)
        goto LABEL_117;
    }
LABEL_121:
    __break(1u);
LABEL_122:
    ;
  }
  if ((v18 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    sub_23034734C(v17, v18, 10);
    v23 = v56;
    v25 = v57;

    swift_bridgeObjectRelease();
    v9 = v59;
    goto LABEL_76;
  }
  if ((v18 & 0x2000000000000000) == 0)
  {
    if ((v17 & 0x1000000000000000) != 0)
      v22 = (unsigned __int8 *)((v18 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v22 = (unsigned __int8 *)sub_23037AB98();
    v23 = (uint64_t)sub_230347338(v22, v20, 10);
    v25 = v24 & 1;
    v9 = v59;
LABEL_75:

LABEL_76:
    if ((v25 & 1) == 0)
      goto LABEL_87;
    goto LABEL_86;
  }
  v63[0] = *(_QWORD *)&v14[OBJC_IVAR____TtC9SportsKit32SportingEventParticipantMetadata_value];
  v63[1] = v18 & 0xFFFFFFFFFFFFFFLL;
  if (v17 == 43)
  {
    v9 = v59;
    if (!v19)
      goto LABEL_128;
    if (v19 == 1 || (BYTE1(v17) - 48) > 9u)
      goto LABEL_48;
    v23 = (BYTE1(v17) - 48);
    if (v19 != 2)
    {
      if ((BYTE2(v17) - 48) > 9u)
        goto LABEL_48;
      v23 = 10 * (BYTE1(v17) - 48) + (BYTE2(v17) - 48);
      v26 = v19 - 3;
      if (v26)
      {
        v27 = (unsigned __int8 *)v63 + 3;
        while (1)
        {
          v28 = *v27 - 48;
          if (v28 > 9)
            goto LABEL_48;
          v29 = 10 * v23;
          if ((unsigned __int128)(v23 * (__int128)10) >> 64 != (10 * v23) >> 63)
            goto LABEL_48;
          v23 = v29 + v28;
          if (__OFADD__(v29, v28))
            goto LABEL_48;
          v25 = 0;
          ++v27;
          if (!--v26)
            goto LABEL_75;
        }
      }
    }
LABEL_74:
    v25 = 0;
    goto LABEL_75;
  }
  v9 = v59;
  if (v17 != 45)
  {
    if (!v19 || (v17 - 48) > 9u)
      goto LABEL_48;
    v23 = (v17 - 48);
    if (v19 != 1)
    {
      if ((BYTE1(v17) - 48) > 9u)
        goto LABEL_48;
      v23 = 10 * (v17 - 48) + (BYTE1(v17) - 48);
      v33 = v19 - 2;
      if (v33)
      {
        v34 = (unsigned __int8 *)v63 + 2;
        while (1)
        {
          v35 = *v34 - 48;
          if (v35 > 9)
            goto LABEL_48;
          v36 = 10 * v23;
          if ((unsigned __int128)(v23 * (__int128)10) >> 64 != (10 * v23) >> 63)
            goto LABEL_48;
          v23 = v36 + v35;
          if (__OFADD__(v36, v35))
            goto LABEL_48;
          v25 = 0;
          ++v34;
          if (!--v33)
            goto LABEL_75;
        }
      }
    }
    goto LABEL_74;
  }
  if (v19)
  {
    if (v19 != 1 && (BYTE1(v17) - 48) <= 9u)
    {
      if (v19 == 2)
      {
        v25 = 0;
        v23 = -(uint64_t)(BYTE1(v17) - 48);
        goto LABEL_75;
      }
      if ((BYTE2(v17) - 48) <= 9u)
      {
        v23 = -10 * (BYTE1(v17) - 48) - (BYTE2(v17) - 48);
        v37 = v19 - 3;
        if (!v37)
          goto LABEL_74;
        v38 = (unsigned __int8 *)v63 + 3;
        while (1)
        {
          v39 = *v38 - 48;
          if (v39 > 9)
            break;
          v40 = 10 * v23;
          if ((unsigned __int128)(v23 * (__int128)10) >> 64 != (10 * v23) >> 63)
            break;
          v23 = v40 - v39;
          if (__OFSUB__(v40, v39))
            break;
          v25 = 0;
          ++v38;
          if (!--v37)
            goto LABEL_75;
        }
      }
    }
LABEL_48:
    v23 = 0;
    v25 = 1;
    goto LABEL_75;
  }
  __break(1u);
LABEL_128:
  __break(1u);
}

void sub_230356D04(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char *i;
  char *v9;
  _QWORD *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  double v17;

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC9SportsKit24SportingEventParticipant__displayName);
  if (v3[1])
  {
    v4 = *v3;
    v5 = v3[1];
  }
  else
  {
    v4 = 0;
    v5 = 0xE000000000000000;
  }
  v6 = *(_QWORD *)(*a1 + OBJC_IVAR____TtC9SportsKit24SportingEventParticipant__statistics);
  if (!v6)
  {
    swift_bridgeObjectRetain();
    goto LABEL_15;
  }
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    v7 = sub_23037AC94();
    if (v7)
      goto LABEL_7;
    goto LABEL_13;
  }
  v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  if (!v7)
  {
LABEL_13:
    swift_bridgeObjectRelease_n();
LABEL_15:
    v11 = 0;
    v12 = 1;
LABEL_30:
    *(_QWORD *)a2 = v4;
    *(_QWORD *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v11;
    *(_BYTE *)(a2 + 24) = v12;
    return;
  }
LABEL_7:
  if ((v6 & 0xC000000000000001) != 0)
    goto LABEL_34;
  for (i = (char *)*(id *)(v6 + 32); ; i = (char *)MEMORY[0x2348B72B4](0, v6))
  {
    v9 = i;
    v10 = (_QWORD *)(*(_QWORD *)&i[OBJC_IVAR____TtC9SportsKit33SportingEventParticipantStatistic_statisticType]
                   + OBJC_IVAR____TtC9SportsKit37SportingEventParticipantStatisticType_name);
    if (*v10 == 0xD000000000000014 && v10[1] == 0x8000000230389580)
      break;
    if ((sub_23037AE8C() & 1) != 0)
      break;

    if (v7 == 1)
      goto LABEL_13;
    v13 = 5;
    while (1)
    {
      v14 = (v6 & 0xC000000000000001) != 0
          ? (char *)MEMORY[0x2348B72B4](v13 - 4, v6)
          : (char *)*(id *)(v6 + 8 * v13);
      v9 = v14;
      v15 = v13 - 3;
      if (__OFADD__(v13 - 4, 1))
        break;
      v16 = (_QWORD *)(*(_QWORD *)&v14[OBJC_IVAR____TtC9SportsKit33SportingEventParticipantStatistic_statisticType]
                     + OBJC_IVAR____TtC9SportsKit37SportingEventParticipantStatisticType_name);
      if (*v16 == 0xD000000000000014 && v16[1] == 0x8000000230389580 || (sub_23037AE8C() & 1) != 0)
        goto LABEL_26;

      ++v13;
      if (v15 == v7)
      {
        swift_bridgeObjectRelease_n();
        v11 = 0;
        v12 = 1;
        goto LABEL_30;
      }
    }
    __break(1u);
LABEL_34:
    ;
  }
LABEL_26:
  swift_bridgeObjectRelease_n();
  v17 = *(double *)&v9[OBJC_IVAR____TtC9SportsKit33SportingEventParticipantStatistic_value];

  if ((~*(_QWORD *)&v17 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_36;
  }
  if (v17 <= -9.22337204e18)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  if (v17 < 9.22337204e18)
  {
    v12 = 0;
    v11 = (uint64_t)v17;
    goto LABEL_30;
  }
LABEL_37:
  __break(1u);
}

void sub_230356FDC(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *i;
  char *v12;
  _QWORD *v13;
  BOOL v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  double v20;
  char *j;
  char *v22;
  _QWORD *v23;
  BOOL v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  char v30;
  double v31;
  uint64_t v32;
  unint64_t v33;

  v3 = *a1;
  v4 = (uint64_t *)(*a1 + OBJC_IVAR____TtC9SportsKit24SportingEventParticipant__displayName);
  if (v4[1])
  {
    v5 = *v4;
    v33 = v4[1];
  }
  else
  {
    v5 = 0;
    v33 = 0xE000000000000000;
  }
  v6 = OBJC_IVAR____TtC9SportsKit24SportingEventParticipant__statistics;
  v7 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9SportsKit24SportingEventParticipant__statistics);
  if (!v7)
  {
    swift_bridgeObjectRetain();
    v9 = 0;
    v15 = 0;
    LOBYTE(v10) = 1;
LABEL_70:
    v30 = 1;
    goto LABEL_71;
  }
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    v8 = sub_23037AC94();
  }
  else
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
  }
  v9 = 0x230387000;
  v32 = v5;
  if (v8)
  {
    v10 = v7 & 0xC000000000000001;
    if ((v7 & 0xC000000000000001) != 0)
      goto LABEL_66;
    for (i = (char *)*(id *)(v7 + 32); ; i = (char *)MEMORY[0x2348B72B4](0, v7))
    {
      v12 = i;
      v13 = (_QWORD *)(*(_QWORD *)&i[OBJC_IVAR____TtC9SportsKit33SportingEventParticipantStatistic_statisticType]
                     + OBJC_IVAR____TtC9SportsKit37SportingEventParticipantStatisticType_name);
      v14 = *v13 == 0x423A737461427441 && v13[1] == 0xEE00676E69747461;
      if (v14 || (sub_23037AE8C() & 1) != 0)
        break;

      if (v8 == 1)
      {
LABEL_16:
        swift_bridgeObjectRelease_n();
        v9 = 0;
        LOBYTE(v10) = 1;
        goto LABEL_36;
      }
      v9 = 5;
      while (1)
      {
        v16 = v10 ? (char *)MEMORY[0x2348B72B4](v9 - 4, v7) : (char *)*(id *)(v7 + 8 * v9);
        v12 = v16;
        v17 = v9 - 3;
        if (__OFADD__(v9 - 4, 1))
          break;
        v18 = (_QWORD *)(*(_QWORD *)&v16[OBJC_IVAR____TtC9SportsKit33SportingEventParticipantStatistic_statisticType]
                       + OBJC_IVAR____TtC9SportsKit37SportingEventParticipantStatisticType_name);
        v19 = *v18 == 0x423A737461427441 && v18[1] == 0xEE00676E69747461;
        if (v19 || (sub_23037AE8C() & 1) != 0)
        {
          v9 = (uint64_t)&unk_230387000;
          goto LABEL_32;
        }

        ++v9;
        if (v17 == v8)
          goto LABEL_16;
      }
      __break(1u);
LABEL_66:
      ;
    }
LABEL_32:
    swift_bridgeObjectRelease_n();
    v20 = *(double *)&v12[OBJC_IVAR____TtC9SportsKit33SportingEventParticipantStatistic_value];

    if ((~*(_QWORD *)&v20 & 0x7FF0000000000000) == 0)
      goto LABEL_73;
    if (v20 <= *(double *)(v9 + 664))
      goto LABEL_74;
    if (v20 >= 9.22337204e18)
      goto LABEL_75;
    LOBYTE(v10) = 0;
    v9 = (uint64_t)v20;
LABEL_36:
    v5 = v32;
  }
  else
  {
    swift_bridgeObjectRelease_n();
    v9 = 0;
    LOBYTE(v10) = 1;
  }
  v7 = *(_QWORD *)(v3 + v6);
  if (!v7)
  {
LABEL_69:
    v15 = 0;
    goto LABEL_70;
  }
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain_n();
    v8 = sub_23037AC94();
    if (v8)
      goto LABEL_40;
    goto LABEL_68;
  }
  v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  if (!v8)
  {
LABEL_68:
    swift_bridgeObjectRelease_n();
    goto LABEL_69;
  }
LABEL_40:
  v3 = v7 & 0xC000000000000001;
  if ((v7 & 0xC000000000000001) != 0)
    goto LABEL_76;
  for (j = (char *)*(id *)(v7 + 32); ; j = (char *)MEMORY[0x2348B72B4](0, v7))
  {
    v22 = j;
    v23 = (_QWORD *)(*(_QWORD *)&j[OBJC_IVAR____TtC9SportsKit33SportingEventParticipantStatistic_statisticType]
                   + OBJC_IVAR____TtC9SportsKit37SportingEventParticipantStatisticType_name);
    v24 = *v23 == 0x7461423A73746948 && v23[1] == 0xEC000000676E6974;
    if (v24 || (sub_23037AE8C() & 1) != 0)
      break;

    if (v8 == 1)
    {
LABEL_59:
      swift_bridgeObjectRelease_n();
      v15 = 0;
      v30 = 1;
      v5 = v32;
      goto LABEL_71;
    }
    v25 = 5;
    while (1)
    {
      v26 = v3 ? (char *)MEMORY[0x2348B72B4](v25 - 4, v7) : (char *)*(id *)(v7 + 8 * v25);
      v22 = v26;
      v27 = v25 - 3;
      if (__OFADD__(v25 - 4, 1))
        break;
      v28 = (_QWORD *)(*(_QWORD *)&v26[OBJC_IVAR____TtC9SportsKit33SportingEventParticipantStatistic_statisticType]
                     + OBJC_IVAR____TtC9SportsKit37SportingEventParticipantStatisticType_name);
      v29 = *v28 == 0x7461423A73746948 && v28[1] == 0xEC000000676E6974;
      if (v29 || (sub_23037AE8C() & 1) != 0)
        goto LABEL_60;

      ++v25;
      if (v27 == v8)
        goto LABEL_59;
    }
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    ;
  }
LABEL_60:
  swift_bridgeObjectRelease_n();
  v31 = *(double *)&v22[OBJC_IVAR____TtC9SportsKit33SportingEventParticipantStatistic_value];

  if ((~*(_QWORD *)&v31 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_78;
  }
  v5 = v32;
  if (v31 <= -9.22337204e18)
  {
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  if (v31 < 9.22337204e18)
  {
    v30 = 0;
    v15 = (uint64_t)v31;
LABEL_71:
    *(_QWORD *)a2 = v5;
    *(_QWORD *)(a2 + 8) = v33;
    *(_QWORD *)(a2 + 16) = v9;
    *(_BYTE *)(a2 + 24) = v10;
    *(_QWORD *)(a2 + 32) = v15;
    *(_BYTE *)(a2 + 40) = v30;
    return;
  }
LABEL_79:
  __break(1u);
}

unint64_t sub_230357584()
{
  unint64_t result;

  result = qword_255E59EB8;
  if (!qword_255E59EB8)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportingEventPlay.BaseballPlay.PitchIndexIndicatorType, &type metadata for SportingEventPlay.BaseballPlay.PitchIndexIndicatorType);
    atomic_store(result, (unint64_t *)&qword_255E59EB8);
  }
  return result;
}

void *__swift_memcpy105_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x69uLL);
}

uint64_t _s14BaseballScoresVwet(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 105))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t _s14BaseballScoresVwst(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 104) = 0;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 105) = v3;
  return result;
}

void type metadata accessor for SportingEventCompetitorContainer.BaseballScores()
{
  OUTLINED_FUNCTION_82();
}

uint64_t __swift_memcpy10_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t _s18BaseballScoreEntryVwet(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 10))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 9);
      if (v3 >= 2)
        v2 = ((v3 + 2147483646) & 0x7FFFFFFF) - 1;
      else
        v2 = -2;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s18BaseballScoreEntryVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_WORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 10) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 10) = 0;
    if (a2)
      *(_BYTE *)(result + 9) = a2 + 2;
  }
  return result;
}

void type metadata accessor for SportingEventCompetitorContainer.BaseballScoreEntry()
{
  OUTLINED_FUNCTION_82();
}

void *__swift_memcpy106_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x6AuLL);
}

uint64_t _s20BaseballScoreEntriesVwet(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  int v4;
  BOOL v5;

  if (a2)
  {
    if (a2 >= 0xFD && *(_BYTE *)(a1 + 106))
    {
      v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 9);
      if (v3 >= 2)
        v4 = ((v3 + 2147483646) & 0x7FFFFFFF) - 1;
      else
        v4 = -2;
      if (v4 < 0)
        v4 = -1;
      v5 = __OFSUB__(v4, 1);
      v2 = v4 - 1;
      if (v2 < 0 != v5)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s20BaseballScoreEntriesVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 104) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 106) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 106) = 0;
    if (a2)
      *(_BYTE *)(result + 9) = a2 + 3;
  }
  return result;
}

void type metadata accessor for SportingEventCompetitorContainer.BaseballScoreEntries()
{
  OUTLINED_FUNCTION_82();
}

uint64_t _s12BaseballPlayVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s12BaseballPlayVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v6 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v6;
  v7 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v7;
  v8 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v8;
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s12BaseballPlayVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v5;
  v6 = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = v6;
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  return a1;
}

void *__swift_memcpy137_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x89uLL);
}

uint64_t _s12BaseballPlayVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v6 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v8;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  return a1;
}

uint64_t _s12BaseballPlayVwet(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 137))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s12BaseballPlayVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 136) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 137) = 1;
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
    *(_BYTE *)(result + 137) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for SportingEventPlay.BaseballPlay()
{
  OUTLINED_FUNCTION_82();
}

uint64_t _s12BaseballPlayV6RunnerVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s12BaseballPlayV6RunnerVwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t _s12BaseballPlayV6RunnerVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

void type metadata accessor for SportingEventPlay.BaseballPlay.Runner()
{
  OUTLINED_FUNCTION_82();
}

uint64_t _s12BaseballPlayV6HitterVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s12BaseballPlayV6HitterVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v5;
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t _s12BaseballPlayV6HitterVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t _s12BaseballPlayV6HitterVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 41))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s12BaseballPlayV6HitterVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 41) = 1;
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
    *(_BYTE *)(result + 41) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for SportingEventPlay.BaseballPlay.Hitter()
{
  OUTLINED_FUNCTION_82();
}

uint64_t _s12BaseballPlayV7PitcherVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s12BaseballPlayV7PitcherVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  return a1;
}

uint64_t _s12BaseballPlayV7PitcherVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t _s12BaseballPlayV7PitcherVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 25))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s12BaseballPlayV7PitcherVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 25) = 1;
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
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for SportingEventPlay.BaseballPlay.Pitcher()
{
  OUTLINED_FUNCTION_82();
}

uint64_t _s12BaseballPlayV23PitchIndexIndicatorTypeOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_230357FA8 + 4 * byte_230387825[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_230357FDC + 4 * byte_230387820[v4]))();
}

uint64_t sub_230357FDC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_230357FE4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x230357FECLL);
  return result;
}

uint64_t sub_230357FF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x230358000);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_230358004(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23035800C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for SportingEventPlay.BaseballPlay.PitchIndexIndicatorType()
{
  OUTLINED_FUNCTION_82();
}

uint64_t sub_230358024()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_0_12()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_2_12()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_6_10()
{
  return sub_23037AE38();
}

void OUTLINED_FUNCTION_7_9()
{
  JUMPOUT(0x2348B72B4);
}

uint64_t OUTLINED_FUNCTION_8_11@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(a1 + v1);
}

void OUTLINED_FUNCTION_9_9(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int16 v2;

  *(_QWORD *)a1 = v1;
  *(_WORD *)(a1 + 8) = v2;
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  return sub_23037A670();
}

uint64_t OUTLINED_FUNCTION_16_6()
{
  return sub_23037A670();
}

id OUTLINED_FUNCTION_18_9()
{
  uint64_t v0;

  return *(id *)(v0 + 32);
}

uint64_t OUTLINED_FUNCTION_22_11()
{
  return 0x646E496863746950;
}

uint64_t OUTLINED_FUNCTION_24_10()
{
  return 0x656C746954627553;
}

uint64_t OUTLINED_FUNCTION_27_7()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_28_11()
{
  return sub_23037A670();
}

uint64_t OUTLINED_FUNCTION_29_6@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(a1 + v1);
}

uint64_t OUTLINED_FUNCTION_30_5()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_33_7()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_34_8()
{
  return 8236;
}

uint64_t OUTLINED_FUNCTION_36_6()
{
  return 8236;
}

id OUTLINED_FUNCTION_37_7()
{
  uint64_t v0;
  uint64_t v1;

  return *(id *)(v0 + 8 * v1);
}

uint64_t OUTLINED_FUNCTION_38_7()
{
  return sub_23037AC94();
}

uint64_t OUTLINED_FUNCTION_42_5@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(a1 + v1);
}

uint64_t OUTLINED_FUNCTION_43_8()
{
  uint64_t v0;

  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_46_5()
{
  return 0x656C746954;
}

void OUTLINED_FUNCTION_47_7()
{
  void *v0;

}

id OUTLINED_FUNCTION_48_2()
{
  uint64_t v0;
  uint64_t v1;

  return *(id *)(v0 + 8 * v1);
}

void OUTLINED_FUNCTION_50_6()
{
  sub_2302D8920();
}

void OUTLINED_FUNCTION_51_4()
{
  JUMPOUT(0x2348B72B4);
}

uint64_t OUTLINED_FUNCTION_53_5()
{
  return sub_23037A670();
}

uint64_t OUTLINED_FUNCTION_54_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_55_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_56_3()
{
  return sub_23037A670();
}

uint64_t OUTLINED_FUNCTION_57_6()
{
  return sub_23037A670();
}

uint64_t OUTLINED_FUNCTION_59_5()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t OUTLINED_FUNCTION_60_6()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

_QWORD *sub_2303582B4()
{
  _QWORD *result;

  type metadata accessor for ScoreboardSubscriptionManager();
  swift_allocObject();
  result = sub_23035832C();
  qword_25405B040 = (uint64_t)result;
  return result;
}

uint64_t static ScoreboardSubscriptionManager.shared.getter()
{
  if (qword_25405B050 != -1)
    swift_once();
  return swift_retain();
}

_QWORD *sub_23035832C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0;
  swift_defaultActor_initialize();
  v2 = type metadata accessor for PersistentStore(0);
  v3 = PersistentStore.__allocating_init()();
  v1[17] = v2;
  v1[18] = &protocol witness table for PersistentStore;
  v1[14] = v3;
  return v1;
}

void sub_230358374(Swift::OpaquePointer a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  id *rawValue;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  os_log_type_t v27;
  uint8_t *v28;
  NSObject *log;
  uint64_t v30;
  uint64_t v31;

  v3 = v1;
  v5 = *(_QWORD *)(v1 + 136);
  v6 = *(_QWORD *)(v1 + 144);
  OUTLINED_FUNCTION_2_13();
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 144))(v5, v6);
  if (!v2)
  {
    v8 = v7;
    if (qword_25405B548 != -1)
      swift_once();
    v9 = sub_23037A280();
    __swift_project_value_buffer(v9, (uint64_t)qword_2540621D0);
    swift_bridgeObjectRetain_n();
    v10 = sub_23037A268();
    v11 = sub_23037A8F8();
    if (os_log_type_enabled(v10, v11))
    {
      v27 = v11;
      v12 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v28 = v12;
      *(_DWORD *)v12 = 136315138;
      if ((unint64_t)a1._rawValue >> 62)
      {
        swift_bridgeObjectRetain();
        v13 = sub_23037AC94();
        swift_bridgeObjectRelease();
      }
      else
      {
        v13 = *(_QWORD *)(((unint64_t)a1._rawValue & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      log = v10;
      if (!v13)
        goto LABEL_18;
      v30 = MEMORY[0x24BEE4AF8];
      sub_2302DA548();
      if ((v13 & 0x8000000000000000) == 0)
      {
        v14 = 0;
        rawValue = (id *)a1._rawValue;
        do
        {
          if (((unint64_t)a1._rawValue & 0xC000000000000001) != 0)
            v16 = (char *)MEMORY[0x2348B72B4](v14, rawValue);
          else
            v16 = (char *)rawValue[v14 + 4];
          v17 = v16;
          v19 = *(_QWORD *)&v16[OBJC_IVAR____TtC9SportsKit13SportingEvent_canonicalId];
          v18 = *(_QWORD *)&v16[OBJC_IVAR____TtC9SportsKit13SportingEvent_canonicalId + 8];
          swift_bridgeObjectRetain();

          v20 = *(_QWORD *)(v30 + 16);
          if (v20 >= *(_QWORD *)(v30 + 24) >> 1)
          {
            sub_2302DA548();
            rawValue = (id *)a1._rawValue;
          }
          ++v14;
          *(_QWORD *)(v30 + 16) = v20 + 1;
          v21 = v30 + 16 * v20;
          *(_QWORD *)(v21 + 32) = v19;
          *(_QWORD *)(v21 + 40) = v18;
        }
        while (v13 != v14);
LABEL_18:
        __swift_instantiateConcreteTypeFromMangledName(&qword_25405B260);
        sub_230354094();
        v22 = sub_23037A55C();
        v24 = v23;
        swift_bridgeObjectRelease();
        sub_23036514C(v22, v24, &v31);
        sub_23037AA30();
        OUTLINED_FUNCTION_80_2();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2302D3000, log, v27, "writing updates for events %s", v28, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_28_0();
      }
      __break(1u);
    }
    else
    {

      OUTLINED_FUNCTION_80_2();
      ScoreboardSubscription.insert(_:)(a1);
      v25 = *(_QWORD *)(v3 + 136);
      v26 = *(_QWORD *)(v3 + 144);
      OUTLINED_FUNCTION_2_13();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 152))(v8, v25, v26);
      swift_release();
    }
  }
}

uint64_t ScoreboardSubscriptionManager.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t ScoreboardSubscriptionManager.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t ScoreboardSubscriptionManager.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_230358738()
{
  return ScoreboardSubscriptionManager.unownedExecutor.getter();
}

uint64_t type metadata accessor for ScoreboardSubscriptionManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for ScoreboardSubscriptionManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ScoreboardSubscriptionManager.insert(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

_QWORD *OUTLINED_FUNCTION_2_13()
{
  uint64_t v0;
  _QWORD *v1;

  return __swift_project_boxed_opaque_existential_1(v1, v0);
}

uint64_t (*static PlayFilterUtils.playsForfilters(_:)(uint64_t a1))(uint64_t a1)
{
  *(_QWORD *)(swift_allocObject() + 16) = a1;
  swift_bridgeObjectRetain();
  return sub_230358A7C;
}

uint64_t sub_2303587FC(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + OBJC_IVAR____TtC9SportsKit17SportingEventPlay_playDescription + 8);
  if ((v2 & 0x2000000000000000) != 0)
    v3 = HIBYTE(v2) & 0xF;
  else
    v3 = *(_QWORD *)(a1 + OBJC_IVAR____TtC9SportsKit17SportingEventPlay_playDescription) & 0xFFFFFFFFFFFFLL;
  if (v3)
  {
    if (!*(_QWORD *)(a2 + 16))
      return 1;
    v4 = *(_QWORD *)(a1 + OBJC_IVAR____TtC9SportsKit17SportingEventPlay__levels);
    v5 = *(_QWORD *)(v4 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v5)
    {
      swift_bridgeObjectRetain();
      __asm { BR              X9 }
    }
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_0_13();
  }
  return 0;
}

uint64_t sub_230358A58()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_230358A7C(uint64_t a1)
{
  uint64_t v1;

  return sub_2303587FC(a1, *(_QWORD *)(v1 + 16));
}

uint64_t PlayFilterUtils.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PlayFilterUtils.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PlayFilterUtils()
{
  return objc_opt_self();
}

uint64_t method lookup function for PlayFilterUtils()
{
  return swift_lookUpClassMethod();
}

uint64_t OUTLINED_FUNCTION_0_13()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_230358AD0(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = OUTLINED_FUNCTION_117_2();
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
    if (v12 || (OUTLINED_FUNCTION_117_2() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_230358B7C(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 16) > *(_QWORD *)(a2 + 16) >> 3)
    return sub_23035F0C4(a1, a2);
  sub_23035EF2C(a1);
  return a2;
}

uint64_t PersistentStore.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v1 = OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_21_6();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  if (qword_25405B4E8 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v1, (uint64_t)qword_25405B5B8);
  (*(void (**)(char *, uint64_t, uint64_t))(v0 + 16))(v4, v6, v1);
  type metadata accessor for PersistentStoreWriter();
  v7 = swift_allocObject();
  type metadata accessor for PersistentStore(0);
  v8 = OUTLINED_FUNCTION_7_4();
  return sub_2303620AC((uint64_t)v5, (uint64_t)v4, v7, v8);
}

uint64_t sub_230358CC4(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t i;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  _QWORD *v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  _QWORD *v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  char v35;
  char v36;
  unint64_t v37;
  char v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  uint64_t result;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  int64_t v48;
  _QWORD *v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int64_t v55;
  _QWORD *v56;

  v4 = sub_23037A238();
  v53 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v51 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v45 - v10;
  v12 = *(_QWORD *)(a1 + 56);
  v47 = a1 + 56;
  v13 = 1 << *(_BYTE *)(a1 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & v12;
  v48 = (unint64_t)(v13 + 63) >> 6;
  swift_bridgeObjectRetain();
  v16 = 0;
  v49 = a2;
  v50 = v11;
  v52 = v4;
  v46 = v9;
  if (!v15)
    goto LABEL_5;
LABEL_4:
  v54 = (v15 - 1) & v15;
  v55 = v16;
  for (i = __clz(__rbit64(v15)) | (v16 << 6); ; i = __clz(__rbit64(v19)) + (v20 << 6))
  {
    v22 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v24 = *v22;
    v23 = v22[1];
    swift_bridgeObjectRetain();
    sub_23037A22C();
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v4);
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v4) == 1)
    {
      sub_2302FD540((uint64_t)v11, &qword_25405B4C8);
      swift_bridgeObjectRetain();
      v25 = sub_230317298();
      v27 = v26;
      swift_bridgeObjectRelease();
      if ((v27 & 1) != 0)
      {
        swift_isUniquelyReferenced_nonNull_native();
        v56 = (_QWORD *)*a2;
        *a2 = 0x8000000000000000;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25405B278);
        a2 = v49;
        sub_23037AC58();
        v28 = v56;
        swift_bridgeObjectRelease();
        v4 = v52;
        (*(void (**)(char *, unint64_t, uint64_t))(v53 + 32))(v9, v28[7] + *(_QWORD *)(v53 + 72) * v25, v52);
        sub_23037AC70();
        *a2 = v28;
        swift_bridgeObjectRelease();
        v29 = 0;
      }
      else
      {
        v29 = 1;
        v4 = v52;
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v9, v29, 1, v4);
      sub_2302FD540((uint64_t)v9, &qword_25405B4C8);
      swift_bridgeObjectRelease();
    }
    else
    {
      v30 = *(void (**)(char *, char *, uint64_t))(v53 + 32);
      v30(v51, v11, v4);
      swift_isUniquelyReferenced_nonNull_native();
      v56 = (_QWORD *)*a2;
      v31 = v56;
      *a2 = 0x8000000000000000;
      v32 = sub_230317298();
      if (__OFADD__(v31[2], (v33 & 1) == 0))
      {
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        goto LABEL_41;
      }
      v34 = v32;
      v35 = v33;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25405B278);
      v36 = sub_23037AC58();
      v4 = v52;
      if ((v36 & 1) != 0)
      {
        v37 = sub_230317298();
        if ((v35 & 1) != (v38 & 1))
          goto LABEL_42;
        v34 = v37;
      }
      v39 = v56;
      if ((v35 & 1) != 0)
      {
        (*(void (**)(unint64_t, char *, uint64_t))(v53 + 40))(v56[7] + *(_QWORD *)(v53 + 72) * v34, v51, v4);
      }
      else
      {
        v56[(v34 >> 6) + 8] |= 1 << v34;
        v40 = (_QWORD *)(v39[6] + 16 * v34);
        *v40 = v24;
        v40[1] = v23;
        v30((char *)(v39[7] + *(_QWORD *)(v53 + 72) * v34), v51, v4);
        v41 = v39[2];
        v42 = __OFADD__(v41, 1);
        v43 = v41 + 1;
        if (v42)
          goto LABEL_40;
        v39[2] = v43;
        swift_bridgeObjectRetain();
      }
      a2 = v49;
      *v49 = v56;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v9 = v46;
    }
    v11 = v50;
    v15 = v54;
    v16 = v55;
    if (v54)
      goto LABEL_4;
LABEL_5:
    v18 = v16 + 1;
    if (__OFADD__(v16, 1))
      goto LABEL_39;
    if (v18 >= v48)
      return swift_release();
    v19 = *(_QWORD *)(v47 + 8 * v18);
    v20 = v16 + 1;
    if (!v19)
    {
      v20 = v16 + 2;
      if (v16 + 2 >= v48)
        return swift_release();
      v19 = *(_QWORD *)(v47 + 8 * v20);
      if (!v19)
      {
        v20 = v16 + 3;
        if (v16 + 3 >= v48)
          return swift_release();
        v19 = *(_QWORD *)(v47 + 8 * v20);
        if (!v19)
        {
          v20 = v16 + 4;
          if (v16 + 4 >= v48)
            return swift_release();
          v19 = *(_QWORD *)(v47 + 8 * v20);
          if (!v19)
            break;
        }
      }
    }
LABEL_20:
    v54 = (v19 - 1) & v19;
    v55 = v20;
  }
  v21 = v16 + 5;
  if (v16 + 5 >= v48)
    return swift_release();
  v19 = *(_QWORD *)(v47 + 8 * v21);
  if (v19)
  {
    v20 = v16 + 5;
    goto LABEL_20;
  }
  while (1)
  {
    v20 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v20 >= v48)
      return swift_release();
    v19 = *(_QWORD *)(v47 + 8 * v20);
    ++v21;
    if (v19)
      goto LABEL_20;
  }
LABEL_41:
  __break(1u);
LABEL_42:
  result = sub_23037AF04();
  __break(1u);
  return result;
}

void sub_2303591EC()
{
  uint64_t v0;
  char *v1;
  id v2;

  v0 = sub_23037A118();
  __swift_allocate_value_buffer(v0, qword_25405B5B8);
  v1 = (char *)__swift_project_value_buffer(v0, (uint64_t)qword_25405B5B8);
  v2 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  NSFileManager.currentContainerURL.getter(v1);

}

uint64_t type metadata accessor for PersistentStore(uint64_t a1)
{
  return sub_2302EFB2C(a1, (uint64_t *)&unk_25405B4F0);
}

uint64_t sub_230359280()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_140();
  v0 = OUTLINED_FUNCTION_100_2();
  return OUTLINED_FUNCTION_21_7(v0, v1, v2, v3);
}

void sub_2303592AC()
{
  OUTLINED_FUNCTION_67_6();
}

void sub_2303592CC()
{
  sub_230359320();
}

void sub_2303592F4()
{
  sub_230359320();
}

void sub_230359320()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
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

  OUTLINED_FUNCTION_9_0();
  v5 = v4;
  v7 = v6;
  v8 = OUTLINED_FUNCTION_140();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_156_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B530);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_76_3();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_95_1();
  v12 = v0 + *v5;
  OUTLINED_FUNCTION_27();
  sub_230363130(v12, v3, &qword_25405B530);
  if (__swift_getEnumTagSinglePayload(v3, 1, v8) == 1)
  {
    sub_2302FD540(v3, &qword_25405B530);
    sub_23037A0C4();
    sub_23037A0D0();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v2, v8);
    OUTLINED_FUNCTION_139_1(v1, v7, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16));
    OUTLINED_FUNCTION_61_5();
    __swift_storeEnumTagSinglePayload(v13, v14, v15, v8);
    OUTLINED_FUNCTION_27();
    sub_230362D1C(v1, v12);
    swift_endAccess();
  }
  else
  {
    OUTLINED_FUNCTION_139_1(v7, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 32));
  }
  OUTLINED_FUNCTION_0_2();
}

void sub_23035949C()
{
  OUTLINED_FUNCTION_67_6();
}

void sub_2303594BC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(void);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_107_1();
  v3 = v2;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B530);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_77_1();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - v8;
  v10 = v1 + *v3;
  OUTLINED_FUNCTION_27();
  sub_230363130(v10, (uint64_t)v9, &qword_25405B530);
  v11 = OUTLINED_FUNCTION_140();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11) == 1)
  {
    sub_2302FD540((uint64_t)v9, &qword_25405B530);
    sub_230359600();
    OUTLINED_FUNCTION_60_7();
    v12();
    OUTLINED_FUNCTION_61_5();
    __swift_storeEnumTagSinglePayload(v13, v14, v15, v11);
    OUTLINED_FUNCTION_27();
    sub_230362D1C(v0, v10);
    swift_endAccess();
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v5, v9, v11);
  }
  OUTLINED_FUNCTION_57_1();
}

void sub_230359600()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_107_1();
  v2 = sub_23037A070();
  OUTLINED_FUNCTION_289();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 104))(v0, *MEMORY[0x24BDCD7A0], v2);
  sub_2302DF64C();
  sub_23037A10C();
  OUTLINED_FUNCTION_3_9(v0, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_57_1();
}

void sub_2303596B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_230379ED8();
  OUTLINED_FUNCTION_100();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_12();
  if (!*(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit15PersistentStore____lazy_storage___encoder))
  {
    sub_230379F08();
    OUTLINED_FUNCTION_7_4();
    v2 = sub_230379EFC();
    OUTLINED_FUNCTION_112_1(v2, *MEMORY[0x24BDCB358]);
    sub_230379EE4();
    OUTLINED_FUNCTION_110_3();
    OUTLINED_FUNCTION_87_1();
  }
  swift_retain();
  OUTLINED_FUNCTION_23();
}

void sub_230359750()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_230379E6C();
  OUTLINED_FUNCTION_100();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_12();
  if (!*(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit15PersistentStore____lazy_storage___decoder))
  {
    sub_230379EA8();
    OUTLINED_FUNCTION_7_4();
    v2 = OUTLINED_FUNCTION_119_2();
    OUTLINED_FUNCTION_112_1(v2, *MEMORY[0x24BDCB1D8]);
    sub_230379E78();
    OUTLINED_FUNCTION_110_3();
    OUTLINED_FUNCTION_87_1();
  }
  swift_retain();
  OUTLINED_FUNCTION_23();
}

void sub_2303597E8()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  OUTLINED_FUNCTION_50();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405AD30);
  OUTLINED_FUNCTION_21_6();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_75_3();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_94_1();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25405AD38);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_36_7();
  sub_23035D0C0();
  if (!v0)
  {
    v10 = *(_QWORD *)(v9 + 16);
    if (v10)
    {
      v11 = v9 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
      v46 = *(_QWORD *)(v1 + 72);
      v50 = MEMORY[0x24BEE4B00];
      v45 = v5;
      v47 = v2;
      v48 = v3;
      v49 = v4;
      while (1)
      {
        sub_230363130(v11, v4, &qword_25405AD30);
        OUTLINED_FUNCTION_61_5();
        __swift_storeEnumTagSinglePayload(v12, v13, v14, v5);
        OUTLINED_FUNCTION_121_0(v4, 1, v5);
        if (v15)
          break;
        v51 = v11;
        v52 = v10;
        v16 = *(int *)(v5 + 48);
        v17 = v2 + v16;
        v18 = v4 + v16;
        v19 = OUTLINED_FUNCTION_140();
        v20 = *(_QWORD *)(v19 - 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v2, v4, v19);
        v21 = OUTLINED_FUNCTION_43_0();
        v22 = *(_QWORD *)(v21 - 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v17, v18, v21);
        v23 = v3 + *(int *)(v5 + 48);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v3, v2, v19);
        v24 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v23, v17, v21);
        v25 = (void *)MEMORY[0x2348B77DC](v24);
        v26 = sub_23035DB20(v3);
        if (v26)
        {
          v27 = (void *)v26;
          v29 = *(_QWORD *)(v26 + OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_canonicalId);
          v28 = *(_QWORD *)(v26 + OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_canonicalId + 8);
          v30 = *(_QWORD *)(v26 + OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_consumers);
          OUTLINED_FUNCTION_67();
          OUTLINED_FUNCTION_39_2();
          swift_isUniquelyReferenced_nonNull_native();
          v31 = OUTLINED_FUNCTION_141_2();
          if (__OFADD__(*(_QWORD *)(v50 + 16), (v32 & 1) == 0))
          {
            __break(1u);
LABEL_21:
            __break(1u);
LABEL_22:
            sub_23037AF04();
            __break(1u);
            return;
          }
          v33 = v31;
          v34 = v32;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25405ACE8);
          v4 = v49;
          if ((sub_23037AC58() & 1) != 0)
          {
            v35 = OUTLINED_FUNCTION_141_2();
            if ((v34 & 1) != (v36 & 1))
              goto LABEL_22;
            v33 = v35;
          }
          if ((v34 & 1) != 0)
          {
            v37 = *(_QWORD *)(v50 + 56);
            swift_bridgeObjectRelease();
            *(_QWORD *)(v37 + 8 * v33) = v30;
          }
          else
          {
            OUTLINED_FUNCTION_96_1(v50 + 8 * (v33 >> 6));
            v41 = (_QWORD *)(v40[6] + 16 * v33);
            *v41 = v29;
            v41[1] = v28;
            *(_QWORD *)(v40[7] + 8 * v33) = v30;
            v42 = v40[2];
            v43 = __OFADD__(v42, 1);
            v44 = v42 + 1;
            if (v43)
              goto LABEL_21;
            v40[2] = v44;
            OUTLINED_FUNCTION_67();
          }

          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_92_3();
          v5 = v45;
          v2 = v47;
          v39 = v51;
          v38 = v52;
        }
        else
        {
          v2 = v47;
          v4 = v49;
          v39 = v51;
          v38 = v52;
        }
        objc_autoreleasePoolPop(v25);
        sub_2302FD540(v2, &qword_25405AD30);
        v3 = v48;
        sub_2302FD540(v48, &qword_25405AD30);
        v11 = v39 + v46;
        v10 = v38 - 1;
        if (!v10)
          goto LABEL_17;
      }
    }
    else
    {
LABEL_17:
      __swift_storeEnumTagSinglePayload(v4, 1, 1, v5);
    }
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_4();
}

void sub_230359B5C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  os_log_type_t v21;
  os_log_type_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;

  OUTLINED_FUNCTION_9_0();
  v28 = OUTLINED_FUNCTION_140();
  v2 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_73_3();
  OUTLINED_FUNCTION_135_1();
  v3 = (void *)sub_23037A5A4();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v1, sel_fileExistsAtPath_, v3);

  if ((v4 & 1) == 0)
  {
    v5 = sub_23037A0AC();
    OUTLINED_FUNCTION_48_3(v5, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_);
    OUTLINED_FUNCTION_129_2();
    if ((_DWORD)v3)
    {
      v6 = 0;
    }
    else
    {
      v7 = 0;
      v8 = (void *)sub_23037A064();

      swift_willThrow();
      sub_23037AB14();
      sub_23037A670();
      OUTLINED_FUNCTION_135_1();
      OUTLINED_FUNCTION_59_6();
      OUTLINED_FUNCTION_41();
      OUTLINED_FUNCTION_29_7();
      swift_getErrorValue();
      sub_23037AF34();
      OUTLINED_FUNCTION_59_6();
      OUTLINED_FUNCTION_41();
      if (qword_25405B480 != -1)
        swift_once();
      v9 = OUTLINED_FUNCTION_24_0();
      __swift_project_value_buffer(v9, (uint64_t)qword_2540621F0);
      OUTLINED_FUNCTION_120_2();
      v10 = sub_23037A268();
      v11 = sub_23037A904();
      if (os_log_type_enabled(v10, v11))
      {
        v12 = (uint8_t *)OUTLINED_FUNCTION_5_2();
        OUTLINED_FUNCTION_5_2();
        *(_DWORD *)v12 = 136315138;
        swift_bridgeObjectRetain();
        v13 = OUTLINED_FUNCTION_114_2();
        OUTLINED_FUNCTION_169_1(v13);
        sub_23037AA30();
        OUTLINED_FUNCTION_44_7();
        OUTLINED_FUNCTION_41_3(&dword_2302D3000, v10, v11, "%s", v12);
        OUTLINED_FUNCTION_25_5();
        OUTLINED_FUNCTION_28_0();
      }

      OUTLINED_FUNCTION_44_7();
    }
  }
  OUTLINED_FUNCTION_25_13();
  OUTLINED_FUNCTION_165_1();
  v15 = v14;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v28);
  v16 = sub_23037A5A4();
  OUTLINED_FUNCTION_41();
  objc_msgSend(v1, sel_fileExistsAtPath_, v16);
  OUTLINED_FUNCTION_129_2();
  if ((v15 & 1) == 0)
  {
    OUTLINED_FUNCTION_25_13();
    sub_23037A0AC();
    v17 = OUTLINED_FUNCTION_144_1();
    OUTLINED_FUNCTION_48_3(v17, (const char *)0x24FE146D9);
    OUTLINED_FUNCTION_129_2();
    v18 = 0;
    if (!v15)
    {
      v19 = v18;
      v20 = (void *)sub_23037A064();

      swift_willThrow();
      sub_23037AB14();
      sub_23037A670();
      OUTLINED_FUNCTION_25_13();
      OUTLINED_FUNCTION_165_1();
      v22 = v21;
      OUTLINED_FUNCTION_144_1();
      sub_23037A670();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_29_7();
      swift_getErrorValue();
      sub_23037AF34();
      OUTLINED_FUNCTION_59_6();
      OUTLINED_FUNCTION_41();
      if (qword_25405B480 != -1)
        swift_once();
      v23 = OUTLINED_FUNCTION_24_0();
      __swift_project_value_buffer(v23, (uint64_t)qword_2540621F0);
      OUTLINED_FUNCTION_120_2();
      v24 = sub_23037A268();
      v25 = sub_23037A904();
      if (OUTLINED_FUNCTION_104_2(v25))
      {
        v26 = (uint8_t *)OUTLINED_FUNCTION_5_2();
        OUTLINED_FUNCTION_5_2();
        *(_DWORD *)v26 = 136315138;
        swift_bridgeObjectRetain();
        v27 = OUTLINED_FUNCTION_114_2();
        OUTLINED_FUNCTION_169_1(v27);
        sub_23037AA30();
        OUTLINED_FUNCTION_44_7();
        OUTLINED_FUNCTION_41_3(&dword_2302D3000, v24, v22, "%s", v26);
        OUTLINED_FUNCTION_25_5();
        OUTLINED_FUNCTION_28_0();
      }

      OUTLINED_FUNCTION_44_7();
    }
  }
  sub_23035C6B0();
  OUTLINED_FUNCTION_0_2();
}

uint64_t sub_23035A054()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_107_1();
  v3 = v0;
  OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_100();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_19_7();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_31_7();
  OUTLINED_FUNCTION_41_9();
  sub_23037A0C4();
  OUTLINED_FUNCTION_136_1();
  v6 = *(void (**)(uint64_t))(v2 + 8);
  v7 = OUTLINED_FUNCTION_91_1();
  v6(v7);
  v8 = *(void **)(v0 + 16);
  sub_23037A0F4();
  v9 = (void *)sub_23037A5A4();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_fileExistsAtPath_, v9);

  if (v10)
  {
    v11 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter + 24);
    v12 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter + 32);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter), v11);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v1, v11, v12);
    OUTLINED_FUNCTION_166_2();
    OUTLINED_FUNCTION_7_4();
    OUTLINED_FUNCTION_119_2();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E59F58);
    sub_2303621EC();
    sub_230379E84();
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_23_4();
    v15 = v16;
  }
  else
  {
    v15 = MEMORY[0x24BEE4B00];
  }
  v13 = OUTLINED_FUNCTION_62_6();
  v6(v13);
  return v15;
}

void sub_23035A1E8()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_50();
  v5 = OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_36_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_75_3();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_31_7();
  OUTLINED_FUNCTION_41_9();
  sub_23037A0C4();
  sub_23037A0D0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  v8 = OUTLINED_FUNCTION_26_2();
  sub_230360C98(v8);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_78_3();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_79_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E59F58);
  sub_230362284();
  v9 = OUTLINED_FUNCTION_147_2();
  if (v1)
  {
    OUTLINED_FUNCTION_132_1();
    OUTLINED_FUNCTION_40_2();
    OUTLINED_FUNCTION_23_4();
  }
  else
  {
    v11 = v9;
    v12 = v10;
    OUTLINED_FUNCTION_40_2();
    OUTLINED_FUNCTION_23_4();
    v13 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter + 24);
    v14 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter + 32);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter), v13);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 8))(v11, v12, v2, 0x10000000, v13, v14);
    OUTLINED_FUNCTION_132_1();
    OUTLINED_FUNCTION_58_5(v11);
  }
  OUTLINED_FUNCTION_152_0();
  OUTLINED_FUNCTION_4();
}

uint64_t sub_23035A354(double a1)
{
  NSObject *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  os_log_type_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405AD30);
  v39 = *(_QWORD *)(v6 - 8);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_29_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25405AD38);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = OUTLINED_FUNCTION_43_0();
  OUTLINED_FUNCTION_44_1();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_42_0();
  v42 = v13;
  if (qword_25405B480 != -1)
    swift_once();
  v14 = OUTLINED_FUNCTION_24_0();
  v40 = __swift_project_value_buffer(v14, (uint64_t)qword_2540621F0);
  OUTLINED_FUNCTION_172_1();
  v15 = OUTLINED_FUNCTION_23_2();
  if (os_log_type_enabled(v1, v15))
  {
    v16 = (uint8_t *)OUTLINED_FUNCTION_5_2();
    v41 = v6;
    *(_WORD *)v16 = 0;
    OUTLINED_FUNCTION_85_3(&dword_2302D3000, v1, v15, "PersistentStore:: Clean up file system - BEGIN", v16);
    OUTLINED_FUNCTION_28_0();
  }

  sub_23037A22C();
  sub_23035D0C0();
  if (v2)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v42, v11);
  v41 = v17;
  v43 = v17;
  sub_23035D0C0();
  v19 = (void (*)(char *, uint64_t))v1;
  sub_230330074(v20);
  v37 = v4;
  v38 = v11;
  v21 = *(_QWORD *)(v43 + 16);
  v41 = v43;
  if (v21)
  {
    v22 = v43 + ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80));
    v23 = *(_QWORD *)(v39 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_230363130(v22, (uint64_t)v10, &qword_25405AD30);
      OUTLINED_FUNCTION_61_5();
      __swift_storeEnumTagSinglePayload(v24, v25, v26, v6);
      OUTLINED_FUNCTION_121_0((uint64_t)v10, 1, v6);
      if (v27)
        break;
      v28 = OUTLINED_FUNCTION_134_1();
      sub_230363160(v28, v29, &qword_25405AD30);
      sub_23035A6B0(v3, a1, v42, v19);
      sub_2302FD540((uint64_t)v3, &qword_25405AD30);
      v22 += v23;
      if (!--v21)
        goto LABEL_13;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
LABEL_13:
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v6);
  }
  v31 = v37;
  v30 = v38;
  OUTLINED_FUNCTION_56();
  v32 = v40;
  v33 = sub_23037A268();
  v34 = sub_23037A8F8();
  if (OUTLINED_FUNCTION_44_6(v34))
  {
    v35 = (uint8_t *)OUTLINED_FUNCTION_5_2();
    *(_WORD *)v35 = 0;
    OUTLINED_FUNCTION_85_3(&dword_2302D3000, v33, v32, "PersistentStore:: Clean up file system - END", v35);
    OUTLINED_FUNCTION_28_0();
  }

  return (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 8))(v42, v30);
}

void sub_23035A6B0(void *a1, double a2, uint64_t a3, void (*a4)(char *, uint64_t))
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  double v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  void *v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t);
  NSObject *v37;
  os_log_type_t v38;
  int v39;
  uint64_t v40;
  uint8_t *v41;
  void *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t);
  uint8_t *v55;
  uint8_t *v56;
  os_log_t v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t);
  void *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  void (*v64)(char *, void *, uint64_t);
  char *v65;
  char *v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  id v69[2];

  v67 = a4;
  v69[1] = *(id *)MEMORY[0x24BDAC8D0];
  v7 = sub_23037A118();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v65 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405AD30);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v66 = (char *)&v53 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v53 - v17;
  v19 = (uint64_t)a1 + *(int *)(v16 + 48);
  sub_23037A1B4();
  if (v20 >= a2)
  {
    v62 = v13;
    v63 = v4;
    v67 = (void (*)(char *, uint64_t))*((_QWORD *)v67 + 2);
    v60 = a1;
    v61 = v10;
    v21 = &v18[*(int *)(v10 + 48)];
    v64 = *(void (**)(char *, void *, uint64_t))(v8 + 16);
    v64(v18, a1, v7);
    v22 = sub_23037A238();
    v23 = *(_QWORD *)(v22 - 8);
    v24 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 16);
    v24(v21, v19, v22);
    v25 = (void *)sub_23037A0AC();
    v26 = v21;
    v27 = v22;
    v59 = *(void (**)(char *, uint64_t))(v23 + 8);
    v59(v26, v22);
    v28 = *(void (**)(char *, uint64_t))(v8 + 8);
    v28(v18, v7);
    v69[0] = 0;
    LODWORD(v22) = objc_msgSend(v67, sel_removeItemAtURL_error_, v25, v69);

    v29 = v69[0];
    if ((_DWORD)v22)
    {
      v67 = v28;
      v58 = v8;
      if (qword_25405B480 != -1)
        swift_once();
      v30 = sub_23037A280();
      __swift_project_value_buffer(v30, (uint64_t)qword_2540621F0);
      v31 = v61;
      v32 = (uint64_t)v66;
      v33 = &v66[*(int *)(v61 + 48)];
      v64(v66, v60, v7);
      v24(v33, v19, v27);
      v34 = v7;
      v35 = (uint64_t)v62;
      sub_230363160(v32, (uint64_t)v62, &qword_25405AD30);
      v36 = v24;
      v37 = sub_23037A268();
      v38 = sub_23037A8F8();
      v39 = v38;
      if (os_log_type_enabled(v37, v38))
      {
        LODWORD(v66) = v39;
        v40 = swift_slowAlloc();
        v54 = v36;
        v41 = (uint8_t *)v40;
        v42 = (void *)swift_slowAlloc();
        v60 = v42;
        v56 = v41;
        v57 = v37;
        *(_DWORD *)v41 = 136315138;
        v69[0] = v42;
        v55 = v41 + 4;
        v43 = *(int *)(v31 + 48);
        v44 = &v18[v43];
        v45 = v35 + v43;
        v64(v18, (void *)v35, v34);
        v54(v44, v45, v27);
        v46 = v65;
        (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v65, v18, v34);
        v59(v44, v27);
        sub_2302ED798(&qword_255E5A070, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
        v47 = sub_23037AE38();
        v49 = v48;
        v67(v46, v34);
        v68 = sub_23036514C(v47, v49, (uint64_t *)v69);
        sub_23037AA30();
        swift_bridgeObjectRelease();
        sub_2302FD540(v35, &qword_25405AD30);
        v50 = v56;
        v37 = v57;
        _os_log_impl(&dword_2302D3000, v57, (os_log_type_t)v66, "PersistentStore:: Removing file at URL: %s", v56, 0xCu);
        v51 = v60;
        swift_arrayDestroy();
        MEMORY[0x2348B7D1C](v51, -1, -1);
        MEMORY[0x2348B7D1C](v50, -1, -1);
      }
      else
      {
        sub_2302FD540(v35, &qword_25405AD30);
      }

    }
    else
    {
      v52 = v29;
      sub_23037A064();

      swift_willThrow();
    }
  }
}

void sub_23035AB4C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  unint64_t v12;
  void (*v13)(void);
  uint64_t v14;
  char v15;

  OUTLINED_FUNCTION_50();
  v15 = v5;
  OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_44_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_26_10();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_164_1();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_31_7();
  OUTLINED_FUNCTION_78_3();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_79_2();
  type metadata accessor for SportingEventSubscription(0);
  sub_2302ED798(&qword_255E59F80, type metadata accessor for SportingEventSubscription, (uint64_t)&protocol conformance descriptor for SportingEventSubscription);
  v14 = OUTLINED_FUNCTION_147_2();
  if (v1)
  {

    OUTLINED_FUNCTION_23_4();
    sub_230362308();
    v10 = OUTLINED_FUNCTION_176();
    OUTLINED_FUNCTION_28_12(v10, v11);
  }
  else
  {
    v12 = v9;
    OUTLINED_FUNCTION_23_4();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter), *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter + 24));
    sub_23035B6A4(v15 & 1, v4);
    sub_23037A0C4();
    OUTLINED_FUNCTION_51_5(v4);
    OUTLINED_FUNCTION_170();
    sub_23037A0D0();
    OUTLINED_FUNCTION_51_5(v3);
    OUTLINED_FUNCTION_57_7();
    v13();
    OUTLINED_FUNCTION_51_5(v2);
    sub_2302E340C(v14, v12);
  }
  OUTLINED_FUNCTION_156_1();
  OUTLINED_FUNCTION_4();
}

void sub_23035ACF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  char v41;
  uint64_t v42;
  void *v43;
  void *v44;
  unsigned int v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  id v52[3];

  OUTLINED_FUNCTION_50();
  a19 = v24;
  a20 = v25;
  v48 = v21;
  v49 = v22;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v52[2] = *(id *)MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_100();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_77_1();
  v34 = MEMORY[0x24BDAC7A8](v33);
  v36 = (char *)&v47 - v35;
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_93_2();
  v52[0] = v31;
  v52[1] = v29;
  v50 = 11822;
  v51 = 0xE200000000000000;
  sub_2302DF64C();
  if ((sub_23037AA90() & 1) != 0)
  {
    if (qword_25405B480 != -1)
      swift_once();
    v37 = OUTLINED_FUNCTION_24_0();
    __swift_project_value_buffer(v37, (uint64_t)qword_2540621F0);
    v38 = OUTLINED_FUNCTION_172_1();
    v39 = sub_23037A904();
    if (OUTLINED_FUNCTION_44_6(v39))
    {
      v40 = (uint8_t *)OUTLINED_FUNCTION_5_2();
      *(_WORD *)v40 = 0;
      OUTLINED_FUNCTION_85_3(&dword_2302D3000, v38, (os_log_type_t)(&a19 - 104), "canonicalId cannot contain parental traversal string patterns", v40);
      OUTLINED_FUNCTION_28_0();
    }

  }
  else
  {
    v41 = v27 & 1;
    v42 = v48;
    sub_23035B6A4(v41, v20);
    OUTLINED_FUNCTION_134_1();
    sub_23037A0C4();
    OUTLINED_FUNCTION_98_2(v20);
    sub_23037A0D0();
    OUTLINED_FUNCTION_98_2((uint64_t)v36);
    v43 = *(void **)(v42 + 16);
    v44 = (void *)sub_23037A0AC();
    v52[0] = 0;
    v45 = objc_msgSend(v43, sel_removeItemAtURL_error_, v44, v52);

    if (v45)
    {
      v46 = v52[0];
    }
    else
    {
      v52[0];
      sub_23037A064();
      OUTLINED_FUNCTION_97_1();
      OUTLINED_FUNCTION_71_4();
    }
    OUTLINED_FUNCTION_98_2(v23);
  }
  OUTLINED_FUNCTION_72_6();
  OUTLINED_FUNCTION_4();
}

void sub_23035AF20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  SEL v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _BYTE *v27;
  _QWORD v28[2];
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;

  OUTLINED_FUNCTION_50();
  v31 = v3;
  v33 = v4;
  v34 = v5;
  v36 = *MEMORY[0x24BDAC8D0];
  v32 = *(_QWORD *)(OUTLINED_FUNCTION_140() - 8);
  OUTLINED_FUNCTION_18_1();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)v28 - v11;
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_93_2();
  objc_opt_self();
  v13 = (void *)sub_23037A4FC();
  v35 = 0;
  OUTLINED_FUNCTION_57_7();
  v16 = objc_msgSend(v14, v15);

  v17 = v35;
  if (v16)
  {
    v18 = sub_23037A19C();
    v29 = v19;

    v30 = v1;
    v20 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter + 24);
    v21 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter + 32);
    v28[1] = OUTLINED_FUNCTION_148_2((_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter));
    sub_23035B6A4(v31 & 1, (uint64_t)v9);
    sub_23037A0C4();
    OUTLINED_FUNCTION_51_5((uint64_t)v9);
    sub_23037A0D0();
    v22 = (uint64_t)v12;
    v23 = v29;
    OUTLINED_FUNCTION_51_5(v22);
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v21 + 8))(v18, v23, v2, 0, v20, v21);
    OUTLINED_FUNCTION_51_5(v2);
    OUTLINED_FUNCTION_58_5(v18);
  }
  else
  {
    v24 = v17;
    v25 = (void *)sub_23037A064();

    OUTLINED_FUNCTION_71_4();
    sub_230362308();
    v26 = OUTLINED_FUNCTION_176();
    OUTLINED_FUNCTION_28_12(v26, v27);
  }
  OUTLINED_FUNCTION_156_1();
  OUTLINED_FUNCTION_4();
}

void sub_23035B150()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_50();
  v16 = v4;
  v17 = v5;
  v18 = v6;
  v7 = OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_289();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_76_3();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_164_1();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_94_1();
  v11 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter + 24);
  v12 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter + 32);
  OUTLINED_FUNCTION_130_1((_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter));
  sub_23035B6A4(v16, v1);
  sub_23037A0C4();
  v13 = *(void (**)(uint64_t))(v3 + 8);
  v14 = OUTLINED_FUNCTION_62_6();
  v13(v14);
  sub_23037A0D0();
  v15 = OUTLINED_FUNCTION_91_1();
  v13(v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 8))(v17, v18, v2, 0, v11, v12);
  ((void (*)(uint64_t, uint64_t))v13)(v2, v7);
  OUTLINED_FUNCTION_156_1();
  OUTLINED_FUNCTION_4();
}

uint64_t sub_23035B254(os_log_type_t a1)
{
  uint64_t v1;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_23035E048();
  if ((sub_23035B42C() & 1) != 0)
    return swift_bridgeObjectRelease();
  v4 = *(void **)(v1 + 16);
  v5 = (void *)OUTLINED_FUNCTION_30_1();
  objc_msgSend(v4, sel_createFileAtPath_contents_attributes_, v5, 0, 0);

  if (qword_25405B480 != -1)
    swift_once();
  v6 = OUTLINED_FUNCTION_24_0();
  __swift_project_value_buffer(v6, (uint64_t)qword_2540621F0);
  OUTLINED_FUNCTION_39_2();
  v7 = sub_23037A268();
  v8 = sub_23037A8F8();
  if (OUTLINED_FUNCTION_104_2(v8))
  {
    v9 = OUTLINED_FUNCTION_5_2();
    v12 = OUTLINED_FUNCTION_5_2();
    *(_DWORD *)v9 = 136315394;
    v10 = OUTLINED_FUNCTION_39_2();
    OUTLINED_FUNCTION_162_1(v10, v11, &v12);
    sub_23037AA30();
    OUTLINED_FUNCTION_158_1();
    *(_WORD *)(v9 + 12) = 1024;
    sub_23037AA30();
    _os_log_impl(&dword_2302D3000, v7, a1, "create file at path %s result: %{BOOL}d", (uint8_t *)v9, 0x12u);
    OUTLINED_FUNCTION_25_5();
    OUTLINED_FUNCTION_28_0();
  }

  return OUTLINED_FUNCTION_80_2();
}

id sub_23035B42C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  sub_23035E048();
  v1 = *(void **)(v0 + 16);
  v2 = (void *)sub_23037A5A4();
  OUTLINED_FUNCTION_7();
  v3 = objc_msgSend(v1, sel_fileExistsAtPath_, v2);

  return v3;
}

void sub_23035B484()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  id v10;
  id v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  char *v20;
  void *v21;
  void (*v22)(uint64_t, char *, uint64_t);
  uint64_t v23;
  void (*v24)(uint64_t);
  id v25[2];

  OUTLINED_FUNCTION_50();
  v4 = v3;
  v25[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_36_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_73_3();
  sub_23035B6A4(v4, v0);
  v7 = (_QWORD *)sub_23037A0AC();
  v8 = OUTLINED_FUNCTION_131();
  v24 = v9;
  v9(v8);
  v25[0] = 0;
  v10 = objc_msgSend(v1, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v7, 0, 16, v25);

  v11 = v25[0];
  if (v10)
  {
    sub_23037A748();
    OUTLINED_FUNCTION_97_1();
    v12 = v7[2];
    if (v12)
    {
      v25[0] = (id)MEMORY[0x24BEE4AF8];
      sub_2302DA548();
      v13 = (char *)v7 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
      v22 = *(void (**)(uint64_t, char *, uint64_t))(v2 + 16);
      v23 = *(_QWORD *)(v2 + 72);
      do
      {
        v22(v0, v13, v5);
        v14 = sub_23037A0A0();
        v16 = v15;
        v17 = OUTLINED_FUNCTION_131();
        v24(v17);
        v18 = v25[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2302DA548();
          v18 = v25[0];
        }
        v19 = v18[2];
        if (v19 >= v18[3] >> 1)
        {
          sub_2302DA548();
          v18 = v25[0];
        }
        v18[2] = v19 + 1;
        v20 = (char *)&v18[2 * v19];
        *((_QWORD *)v20 + 4) = v14;
        *((_QWORD *)v20 + 5) = v16;
        v13 += v23;
        --v12;
      }
      while (v12);
      swift_bridgeObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_7();
    }
  }
  else
  {
    v21 = v11;
    sub_23037A064();

    swift_willThrow();
  }
  OUTLINED_FUNCTION_152_0();
  OUTLINED_FUNCTION_4();
}

void sub_23035B6A4(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + OBJC_IVAR____TtC9SportsKit15PersistentStore_storeURL;
  if ((a1 & 1) != 0)
  {
    v5 = OUTLINED_FUNCTION_140();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
  }
  else
  {
    sub_23037A0C4();
    OUTLINED_FUNCTION_13_0();
  }
}

void sub_23035B714(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  unint64_t v48;
  char v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  unint64_t v57;
  char v58;
  char v59;
  unint64_t v60;
  char v61;
  _QWORD *v62;
  char **v63;
  uint64_t v64;
  BOOL v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  _BYTE *v80;
  uint64_t v81;
  NSObject *v82;
  os_log_type_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD v96[2];
  _QWORD *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  char *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t, uint64_t);
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;

  OUTLINED_FUNCTION_50();
  a19 = v24;
  a20 = v25;
  v101 = v21;
  v27 = v26;
  v29 = v28;
  v30 = OUTLINED_FUNCTION_140();
  v98 = *(_QWORD *)(v30 - 8);
  v99 = v30;
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v31);
  v33 = (char *)v96 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = OUTLINED_FUNCTION_43_0();
  v108 = *(_QWORD *)(v34 - 8);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_42_0();
  v107 = v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_18_10();
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_31_7();
  v39 = *(_QWORD *)(v27 + 16);
  v102 = v33;
  v103 = v34;
  v100 = v20;
  if (v39)
  {
    v97 = v29;
    OUTLINED_FUNCTION_39_2();
    v96[1] = v27;
    v40 = (uint64_t *)(v27 + 40);
    v41 = MEMORY[0x24BEE4B00];
    v105 = v23;
    v106 = v22;
    while (1)
    {
      v109 = v39;
      v42 = (char *)*(v40 - 1);
      v43 = *v40;
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_200();
      sub_23037A22C();
      OUTLINED_FUNCTION_61_5();
      __swift_storeEnumTagSinglePayload(v44, v45, v46, v34);
      OUTLINED_FUNCTION_121_0(v22, 1, v34);
      if (v47)
      {
        sub_2302FD540(v22, &qword_25405B4C8);
        OUTLINED_FUNCTION_200();
        v48 = OUTLINED_FUNCTION_152_2();
        v50 = v49;
        OUTLINED_FUNCTION_22_1();
        if ((v50 & 1) != 0)
        {
          swift_isUniquelyReferenced_nonNull_native();
          v111 = v41;
          __swift_instantiateConcreteTypeFromMangledName(&qword_25405B278);
          OUTLINED_FUNCTION_154_1();
          v23 = v105;
          sub_23037AC58();
          v51 = v111;
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_88_3(v23, *(_QWORD *)(v51 + 56) + *(_QWORD *)(v108 + 72) * v48, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v108 + 32));
          sub_23037AC70();
          OUTLINED_FUNCTION_92_3();
          v52 = 0;
        }
        else
        {
          v52 = 1;
          v51 = v41;
        }
        __swift_storeEnumTagSinglePayload(v23, v52, 1, v34);
        sub_2302FD540(v23, &qword_25405B4C8);
        OUTLINED_FUNCTION_22_1();
        OUTLINED_FUNCTION_67_2();
        v41 = v51;
      }
      else
      {
        v104 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v108 + 32);
        v104(v107, v22, v34);
        swift_isUniquelyReferenced_nonNull_native();
        v111 = v41;
        v53 = v42;
        v54 = v43;
        v55 = OUTLINED_FUNCTION_152_2();
        if (__OFADD__(*(_QWORD *)(v41 + 16), (v56 & 1) == 0))
        {
          __break(1u);
LABEL_29:
          __break(1u);
          goto LABEL_30;
        }
        v57 = v55;
        v58 = v56;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25405B278);
        OUTLINED_FUNCTION_154_1();
        v59 = sub_23037AC58();
        v23 = v105;
        if ((v59 & 1) != 0)
        {
          v60 = OUTLINED_FUNCTION_124_0();
          if ((v58 & 1) != (v61 & 1))
          {
            sub_23037AF04();
            __break(1u);
            return;
          }
          v57 = v60;
        }
        v62 = (_QWORD *)v111;
        if ((v58 & 1) != 0)
        {
          v34 = v103;
          OUTLINED_FUNCTION_88_3(*(_QWORD *)(v111 + 56) + *(_QWORD *)(v108 + 72) * v57, v107, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v108 + 40));
        }
        else
        {
          OUTLINED_FUNCTION_96_1(v111 + 8 * (v57 >> 6));
          v63 = (char **)(v62[6] + 16 * v57);
          *v63 = v53;
          v63[1] = (char *)v43;
          v34 = v103;
          OUTLINED_FUNCTION_88_3(v62[7] + *(_QWORD *)(v108 + 72) * v57, v107, v104);
          v64 = v62[2];
          v65 = __OFADD__(v64, 1);
          v66 = v64 + 1;
          if (v65)
            goto LABEL_29;
          v62[2] = v66;
          swift_bridgeObjectRetain();
        }
        v67 = v111;
        OUTLINED_FUNCTION_22_1();
        OUTLINED_FUNCTION_2_4();
        OUTLINED_FUNCTION_92_3();
        v41 = v67;
        v33 = v102;
      }
      v22 = v106;
      v40 += 2;
      v39 = v109 - 1;
      if (v109 == 1)
      {
        v53 = v33;
        swift_bridgeObjectRelease();
        v29 = v97;
        goto LABEL_21;
      }
    }
  }
  v53 = v33;
  v41 = MEMORY[0x24BEE4B00];
LABEL_21:
  a10 = v41;
  sub_23035C5A4();
  OUTLINED_FUNCTION_75_0();
  v68 = OUTLINED_FUNCTION_26_2();
  v69 = v101;
  v70 = sub_230361BF0(v68, v29);
  sub_230358CC4(v70, &a10);
  swift_release();
  v71 = OUTLINED_FUNCTION_75_0();
  v72 = sub_23035BE04(v71);
  v73 = OUTLINED_FUNCTION_39_2();
  v74 = sub_230360C98(v73);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_56();
  v75 = swift_bridgeObjectRetain();
  v76 = sub_23035BEB4(v75, v74);
  OUTLINED_FUNCTION_78_3();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_79_2();
  v111 = v72;
  v112 = v76;
  sub_230362344();
  v77 = sub_230379EF0();
  if (v69)
  {

    OUTLINED_FUNCTION_22_1();
    OUTLINED_FUNCTION_74_0();
    OUTLINED_FUNCTION_23_4();
    sub_230362308();
    v79 = OUTLINED_FUNCTION_176();
    OUTLINED_FUNCTION_28_12(v79, v80);
  }
  else
  {
    v54 = v77;
    v109 = v78;
    OUTLINED_FUNCTION_22_1();
    OUTLINED_FUNCTION_74_0();
    OUTLINED_FUNCTION_23_4();
    if (qword_25405B480 != -1)
LABEL_30:
      swift_once();
    v81 = OUTLINED_FUNCTION_24_0();
    v82 = __swift_project_value_buffer(v81, (uint64_t)qword_2540621F0);
    OUTLINED_FUNCTION_7_2();
    sub_23037A268();
    v83 = OUTLINED_FUNCTION_23_2();
    if (os_log_type_enabled(v82, v83))
    {
      v84 = OUTLINED_FUNCTION_5_2();
      v108 = OUTLINED_FUNCTION_5_2();
      v113 = v108;
      *(_DWORD *)v84 = 136315394;
      v85 = swift_bridgeObjectRetain();
      v86 = MEMORY[0x2348B6ED0](v85, MEMORY[0x24BEE0D00]);
      v88 = v87;
      OUTLINED_FUNCTION_7();
      v111 = sub_23036514C(v86, v88, &v113);
      sub_23037AA30();
      OUTLINED_FUNCTION_56();
      OUTLINED_FUNCTION_67_2();
      *(_WORD *)(v84 + 12) = 2080;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      v89 = sub_23037A52C();
      v91 = v90;
      swift_bridgeObjectRelease();
      v110 = sub_23036514C(v89, v91, &v113);
      sub_23037AA30();
      OUTLINED_FUNCTION_7();
      _os_log_impl(&dword_2302D3000, v82, v83, "PersistentStore: replaceActivities: new active ids: %s, dismissed diff: %s", (uint8_t *)v84, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_28_0();
    }

    OUTLINED_FUNCTION_56();
    v92 = v99;
    v93 = v109;
    v94 = *(_QWORD *)(v100 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter + 24);
    v95 = *(_QWORD *)(v100 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter + 32);
    OUTLINED_FUNCTION_157_1((_QWORD *)(v100 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter));
    sub_2303592AC();
    (*(void (**)(uint64_t, unint64_t, char *, _QWORD, uint64_t, uint64_t))(v95 + 8))(v54, v93, v53, 0, v94, v95);
    (*(void (**)(char *, uint64_t))(v98 + 8))(v53, v92);
    sub_2302E340C(v54, v93);
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_156_1();
  OUTLINED_FUNCTION_4();
}

uint64_t sub_23035BE04(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v2 = sub_23037A8D4();
  v10 = v2;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2302EF24C(&v9, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    v7 = v2;
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_23035BEB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_isUniquelyReferenced_nonNull_native();
  sub_2303609C8();
  OUTLINED_FUNCTION_92_3();
  if (v2)
    swift_bridgeObjectRelease();
  return a2;
}

void sub_23035BF2C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t inited;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  void (*v25)(void);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29[2];

  OUTLINED_FUNCTION_50();
  v4 = v1;
  v6 = v5;
  v8 = v7;
  v9 = OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_36_1();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_15_0();
  v28 = v0;
  sub_23035C5A4();
  v11 = v29[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B2E0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23037BDD0;
  v27 = v8;
  *(_QWORD *)(inited + 32) = v8;
  *(_QWORD *)(inited + 40) = v6;
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_67();
  v13 = sub_2302EA9B4(inited, v11);
  v14 = OUTLINED_FUNCTION_200();
  v15 = v4;
  v16 = sub_230360C98(v14);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_78_3();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_79_2();
  v29[0] = v13;
  v29[1] = v16;
  sub_230362344();
  v17 = sub_230379EF0();
  if (v15)
  {

    OUTLINED_FUNCTION_74_0();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_23_4();
    sub_230362308();
    v18 = OUTLINED_FUNCTION_176();
    OUTLINED_FUNCTION_28_12(v18, v19);
  }
  else
  {
    v26 = v17;
    OUTLINED_FUNCTION_74_0();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_23_4();
    if (qword_25405B480 != -1)
      swift_once();
    v20 = OUTLINED_FUNCTION_24_0();
    v21 = __swift_project_value_buffer(v20, (uint64_t)qword_2540621F0);
    OUTLINED_FUNCTION_7_2();
    sub_23037A268();
    v22 = OUTLINED_FUNCTION_23_2();
    if (OUTLINED_FUNCTION_101_3(v22))
    {
      v23 = (uint8_t *)OUTLINED_FUNCTION_5_2();
      v29[0] = OUTLINED_FUNCTION_5_2();
      *(_DWORD *)v23 = 136315138;
      OUTLINED_FUNCTION_67();
      v24 = sub_23036514C(v27, v6, v29);
      OUTLINED_FUNCTION_150_1(v24);
      sub_23037AA30();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2302D3000, v21, (os_log_type_t)v16, "PersistentStore: writeActivity: %s", v23, 0xCu);
      OUTLINED_FUNCTION_16_1();
      OUTLINED_FUNCTION_28_0();
    }

    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_157_1((_QWORD *)(v28 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter));
    sub_2303592AC();
    OUTLINED_FUNCTION_57_7();
    v25();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v9);
    OUTLINED_FUNCTION_58_5(v26);
  }
  OUTLINED_FUNCTION_72_6();
  OUTLINED_FUNCTION_4();
}

void sub_23035C204()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t inited;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[2];

  OUTLINED_FUNCTION_50();
  v4 = v3;
  v6 = v5;
  v33 = OUTLINED_FUNCTION_140();
  v34 = *(_QWORD *)(v33 - 8);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_29_0();
  v32 = v0;
  sub_23035C5A4();
  v8 = v35[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B2E0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23037BDD0;
  *(_QWORD *)(inited + 32) = v6;
  *(_QWORD *)(inited + 40) = v4;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_26_2();
  v10 = sub_23035F534(inited, v8);
  swift_setDeallocating();
  sub_23035EEFC();
  v11 = swift_bridgeObjectRetain();
  v12 = sub_230360C98(v11);
  OUTLINED_FUNCTION_67_2();
  OUTLINED_FUNCTION_56();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E59F90);
  v13 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25405B238) - 8) + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_23037BDD0;
  v16 = (uint64_t *)(v15 + v14);
  *v16 = v6;
  v16[1] = v4;
  OUTLINED_FUNCTION_26_2();
  sub_23037A22C();
  OUTLINED_FUNCTION_43_0();
  v17 = sub_23037A520();
  v18 = sub_23035BEB4(v17, v12);
  OUTLINED_FUNCTION_78_3();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_79_2();
  v35[0] = v10;
  v35[1] = v18;
  sub_230362344();
  v19 = OUTLINED_FUNCTION_147_2();
  if (v1)
  {

    OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_23_4();
    sub_230362308();
    v21 = OUTLINED_FUNCTION_176();
    OUTLINED_FUNCTION_28_12(v21, v22);
  }
  else
  {
    v23 = v19;
    v24 = v20;
    OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_23_4();
    if (qword_25405B480 != -1)
      swift_once();
    v25 = OUTLINED_FUNCTION_24_0();
    __swift_project_value_buffer(v25, (uint64_t)qword_2540621F0);
    OUTLINED_FUNCTION_7_2();
    v26 = sub_23037A268();
    v27 = sub_23037A8F8();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)OUTLINED_FUNCTION_5_2();
      v35[0] = OUTLINED_FUNCTION_5_2();
      *(_DWORD *)v28 = 136315138;
      OUTLINED_FUNCTION_26_2();
      v29 = sub_23036514C(v6, v4, v35);
      OUTLINED_FUNCTION_150_1(v29);
      sub_23037AA30();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2302D3000, v26, v27, "PersistentStore: removeActivity: %s", v28, 0xCu);
      OUTLINED_FUNCTION_16_1();
      OUTLINED_FUNCTION_28_0();
    }

    OUTLINED_FUNCTION_56();
    v30 = *(_QWORD *)(v32 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter + 24);
    v31 = *(_QWORD *)(v32 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter + 32);
    OUTLINED_FUNCTION_157_1((_QWORD *)(v32 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter));
    sub_2303592AC();
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v31 + 8))(v23, v24, v2, 0, v30, v31);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v2, v33);
    OUTLINED_FUNCTION_58_5(v23);
  }
  OUTLINED_FUNCTION_72_6();
  OUTLINED_FUNCTION_4();
}

void sub_23035C5A4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_107_1();
  v3 = v2;
  OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_289();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_29_0();
  v5 = OUTLINED_FUNCTION_123_1(OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter);
  sub_2303592AC();
  OUTLINED_FUNCTION_99_3(v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16));
  if (v5)
  {
    OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_113_2();
    OUTLINED_FUNCTION_43_0();
    v6 = sub_23037A520();
    v7 = MEMORY[0x24BEE4B08];
  }
  else
  {
    OUTLINED_FUNCTION_113_2();
    OUTLINED_FUNCTION_166_2();
    OUTLINED_FUNCTION_7_4();
    OUTLINED_FUNCTION_119_2();
    sub_230362380();
    sub_230379E84();
    OUTLINED_FUNCTION_7_6();
    OUTLINED_FUNCTION_23_4();
    v7 = v8;
    v6 = v9;
  }
  *v3 = v7;
  v3[1] = v6;
  OUTLINED_FUNCTION_57_1();
}

void sub_23035C6B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;
  SEL v9;
  unsigned __int8 v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  OUTLINED_FUNCTION_107_1();
  v2 = OUTLINED_FUNCTION_140();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_1_2();
  sub_2303592AC();
  OUTLINED_FUNCTION_135_1();
  OUTLINED_FUNCTION_3_9(v1, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  v4 = *(void **)(v0 + 16);
  v5 = (void *)OUTLINED_FUNCTION_30_1();
  v6 = objc_msgSend(v4, sel_fileExistsAtPath_, v5);

  if ((v6 & 1) != 0
    || (v7 = (void *)OUTLINED_FUNCTION_30_1(),
        OUTLINED_FUNCTION_57_7(),
        v10 = objc_msgSend(v8, v9),
        v7,
        (v10 & 1) != 0))
  {
    OUTLINED_FUNCTION_7();
  }
  else
  {
    if (qword_25405B480 != -1)
      swift_once();
    v11 = OUTLINED_FUNCTION_24_0();
    __swift_project_value_buffer(v11, (uint64_t)qword_2540621F0);
    OUTLINED_FUNCTION_39_2();
    v12 = sub_23037A268();
    v13 = sub_23037A8F8();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)OUTLINED_FUNCTION_5_2();
      v17 = OUTLINED_FUNCTION_5_2();
      *(_DWORD *)v14 = 136315138;
      v15 = OUTLINED_FUNCTION_39_2();
      OUTLINED_FUNCTION_162_1(v15, v16, &v17);
      sub_23037AA30();
      OUTLINED_FUNCTION_158_1();
      OUTLINED_FUNCTION_41_3(&dword_2302D3000, v12, v13, "PersistentStore: Unable to create file: %s", v14);
      OUTLINED_FUNCTION_25_5();
      OUTLINED_FUNCTION_28_0();
    }

    OUTLINED_FUNCTION_80_2();
  }
  OUTLINED_FUNCTION_57_1();
}

void sub_23035C890()
{
  sub_23035C8C0();
}

void sub_23035C8C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char v19;
  uint64_t v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, void *);
  uint64_t v25;
  _QWORD v26[4];
  uint64_t v27;
  unint64_t v28;

  OUTLINED_FUNCTION_9_0();
  v2 = v0;
  v26[0] = v3;
  v26[1] = v4;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_21_6();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_19_7();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v26 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v26 - v17;
  v19 = *v6;
  v27 = v10;
  v28 = v8;
  OUTLINED_FUNCTION_5_12();
  if ((OUTLINED_FUNCTION_6_8() & 1) != 0)
  {
    if (qword_25405B480 != -1)
      swift_once();
    v20 = OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_13_8(v20, (uint64_t)qword_2540621F0);
    v21 = OUTLINED_FUNCTION_146_1();
    if (OUTLINED_FUNCTION_44_6(v21))
    {
      *(_WORD *)OUTLINED_FUNCTION_5_2() = 0;
      OUTLINED_FUNCTION_23_7(&dword_2302D3000, v22, v23, "competitorId cannot contain parental traversal string patterns");
      OUTLINED_FUNCTION_28_0();
    }

  }
  else
  {
    OUTLINED_FUNCTION_139_1((uint64_t)v16, v2 + OBJC_IVAR____TtC9SportsKit15PersistentStore_storeURL, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
    if ((v19 & 1) == 0)
    {
      v27 = 0x2D657A69732DLL;
      v28 = 0xE600000000000000;
      v26[2] = 56;
      sub_23037AE38();
      sub_23037A670();
      OUTLINED_FUNCTION_41();
    }
    v27 = v10;
    v28 = v8;
    OUTLINED_FUNCTION_200();
    sub_23037A670();
    swift_bridgeObjectRelease();
    sub_23037A0C4();
    OUTLINED_FUNCTION_41();
    v24 = *(void (**)(char *, void *))(v1 + 8);
    v24(v16, v11);
    sub_23037A0D0();
    OUTLINED_FUNCTION_165_1();
    v25 = OUTLINED_FUNCTION_91_1();
    ((void (*)(uint64_t))v24)(v25);
    v24(v18, v11);
  }
  OUTLINED_FUNCTION_0_2();
}

void sub_23035CAD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_50();
  v4 = v0;
  OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_44_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_18_10();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_94_1();
  v7 = *(void **)(v0 + 16);
  sub_2303592F4();
  sub_23037A0F4();
  OUTLINED_FUNCTION_125_1(v3);
  v8 = sub_23037A5A4();
  OUTLINED_FUNCTION_67_2();
  v9 = objc_msgSend(v7, sel_fileExistsAtPath_, v8);

  if ((v9 & 1) != 0)
    goto LABEL_7;
  if (qword_25405B480 != -1)
    swift_once();
  v10 = OUTLINED_FUNCTION_24_0();
  __swift_project_value_buffer(v10, (uint64_t)qword_2540621F0);
  OUTLINED_FUNCTION_172_1();
  v11 = OUTLINED_FUNCTION_23_2();
  if (OUTLINED_FUNCTION_101_3(v11))
  {
    v12 = (uint8_t *)OUTLINED_FUNCTION_5_2();
    *(_WORD *)v12 = 0;
    OUTLINED_FUNCTION_85_3(&dword_2302D3000, v8, v9, "PersistentStore.readCloudChannelSubscription - file does not exist, creating file.", v12);
    OUTLINED_FUNCTION_28_0();
  }

  OUTLINED_FUNCTION_43_0();
  sub_23037A520();
  OUTLINED_FUNCTION_171_1();
  swift_allocObject();
  CloudChannelSubscription.init(demand:)((uint64_t)v8);
  sub_23035CD2C();
  OUTLINED_FUNCTION_40_2();
  if (!v1)
  {
LABEL_7:
    v13 = *(_QWORD *)(v4 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter + 24);
    v14 = *(_QWORD *)(v4 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter + 32);
    OUTLINED_FUNCTION_148_2((_QWORD *)(v4 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter));
    sub_2303592F4();
    v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v2, v13, v14);
    if (v1)
    {
      OUTLINED_FUNCTION_125_1(v2);
    }
    else
    {
      v16 = v15;
      OUTLINED_FUNCTION_125_1(v2);
      sub_230359750();
      OUTLINED_FUNCTION_171_1();
      sub_2302ED798(&qword_25405AF60, (uint64_t (*)(uint64_t))type metadata accessor for CloudChannelSubscription, (uint64_t)&protocol conformance descriptor for CloudChannelSubscription);
      OUTLINED_FUNCTION_126_2();
      OUTLINED_FUNCTION_58_5(v16);
      OUTLINED_FUNCTION_23_4();
    }
  }
  OUTLINED_FUNCTION_72_6();
  OUTLINED_FUNCTION_4();
}

void sub_23035CD2C()
{
  sub_23035CE94();
}

void sub_23035CD60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_44_1();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_156_0();
  OUTLINED_FUNCTION_130_1((_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter));
  sub_2303592CC();
  OUTLINED_FUNCTION_60_7();
  v4 = v3();
  if (v1)
  {
    OUTLINED_FUNCTION_83_3();
  }
  else
  {
    v6 = v4;
    v7 = v5;
    OUTLINED_FUNCTION_83_3();
    sub_230359750();
    type metadata accessor for ScoreboardSubscription();
    sub_2302ED798(&qword_25405B760, (uint64_t (*)(uint64_t))type metadata accessor for ScoreboardSubscription, (uint64_t)&protocol conformance descriptor for ScoreboardSubscription);
    OUTLINED_FUNCTION_60_7();
    OUTLINED_FUNCTION_126_2();
    sub_2302E340C(v6, v7);
    OUTLINED_FUNCTION_23_4();
  }
  OUTLINED_FUNCTION_72_6();
  OUTLINED_FUNCTION_4();
}

void sub_23035CE60()
{
  sub_23035CE94();
}

void sub_23035CE94()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(void);
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t *v6;
  uint64_t (*v7)(uint64_t);
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void (*v14)(void);
  void (*v15)(void);

  OUTLINED_FUNCTION_50();
  v15 = v2;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = OUTLINED_FUNCTION_140();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_12();
  sub_2303596B4();
  v8(0);
  sub_2302ED798(v6, v8, v4);
  v11 = sub_230379EF0();
  v13 = v12;
  OUTLINED_FUNCTION_23_4();
  if (!v1)
  {
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter), *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter + 24));
    v15();
    OUTLINED_FUNCTION_57_7();
    v14();
    OUTLINED_FUNCTION_14_5(v10);
    sub_2302E340C(v11, v13);
  }
  OUTLINED_FUNCTION_152_0();
  OUTLINED_FUNCTION_4();
}

id sub_23035CFBC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  void *v5;
  unsigned __int8 v6;
  id result;
  id v8[2];

  v8[1] = *(id *)MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_289();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_15_0();
  v2 = *(void **)(v0 + 16);
  sub_2303592CC();
  sub_23037A0F4();
  v3 = OUTLINED_FUNCTION_131();
  v4(v3);
  v5 = (void *)sub_23037A5A4();
  OUTLINED_FUNCTION_74_0();
  v8[0] = 0;
  v6 = objc_msgSend(v2, sel_removeItemAtPath_error_, v5, v8);

  result = v8[0];
  if ((v6 & 1) == 0)
  {
    sub_23037A064();
    OUTLINED_FUNCTION_97_1();
    return (id)OUTLINED_FUNCTION_71_4();
  }
  return result;
}

void sub_23035D0C0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  uint64_t v32;
  id v33;
  uint64_t v34[2];

  OUTLINED_FUNCTION_50();
  v6 = v5;
  v34[1] = *MEMORY[0x24BDAC8D0];
  v32 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B530);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_21_6();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_26_10();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_95_1();
  v34[0] = MEMORY[0x24BEE4AF8];
  v13 = (void *)v0[2];
  sub_23035B6A4(v6, v4);
  v14 = (void *)sub_23037A0AC();
  v31 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v31(v4, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B2E8);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_23037BDD0;
  v16 = (void *)*MEMORY[0x24BDBCBE0];
  *(_QWORD *)(v15 + 32) = *MEMORY[0x24BDBCBE0];
  v33 = 0;
  v17 = v16;
  v18 = sub_23036201C((uint64_t)v14, v15, 0, (uint64_t)&v33, v13);

  v19 = v33;
  if (v18)
  {
    v20 = sub_23037A748();

    v21 = *(_QWORD *)(v20 + 16);
    v30 = v20;
    if (v21)
    {
      v22 = v20 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
      v23 = *(_QWORD *)(v2 + 72);
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v2 + 16);
      swift_bridgeObjectRetain();
      while (1)
      {
        v24(v9, v22, v10);
        OUTLINED_FUNCTION_61_5();
        __swift_storeEnumTagSinglePayload(v25, v26, v27, v10);
        OUTLINED_FUNCTION_121_0((uint64_t)v9, 1, v10);
        if (v28)
          break;
        (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v3, v9, v10);
        sub_23035D348(v3, v34);
        if (v1)
        {
          OUTLINED_FUNCTION_87_2();
          OUTLINED_FUNCTION_56();
          goto LABEL_13;
        }
        OUTLINED_FUNCTION_87_2();
        v22 += v23;
        if (!--v21)
          goto LABEL_10;
      }
    }
    else
    {
      OUTLINED_FUNCTION_36();
LABEL_10:
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v10);
    }
    OUTLINED_FUNCTION_56();
    v29 = OUTLINED_FUNCTION_67();
    sub_23035D960(v29);
    OUTLINED_FUNCTION_56();
  }
  else
  {
    sub_23037A064();
    OUTLINED_FUNCTION_97_1();
    OUTLINED_FUNCTION_71_4();
LABEL_13:
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_72_6();
  OUTLINED_FUNCTION_4();
}

void sub_23035D348(uint64_t a1, uint64_t *a2)
{
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char v23;
  void (*v24)(char *, uint64_t, uint64_t);
  char v25;
  void (*v26)(char *, uint64_t);
  char *v27;
  char v28;
  char *v29;
  uint64_t v30;
  uint64_t inited;
  void *v32;
  id v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  uint64_t v39;
  char v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;

  v57 = a2;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405AD48);
  v56 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v55 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
  MEMORY[0x24BDAC7A8](v4);
  v60 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = sub_23037A238();
  v54 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v53 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23037A004();
  v58 = *(_QWORD *)(v7 - 8);
  v59 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v69 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23037A118();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v63 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v62 = (char *)&v51 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v51 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v51 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v51 - v21;
  sub_23037A0A0();
  v23 = sub_23037A6DC();
  swift_bridgeObjectRelease();
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v24(v22, a1, v9);
  if ((v23 & 1) != 0)
  {
    v25 = 1;
  }
  else
  {
    sub_23037A0A0();
    v25 = sub_23037A6DC();
    swift_bridgeObjectRelease();
  }
  v26 = *(void (**)(char *, uint64_t))(v10 + 8);
  v26(v22, v9);
  v24(v20, a1, v9);
  if ((v25 & 1) != 0)
  {
    v26(v20, v9);
    v24(v17, a1, v9);
    v27 = v63;
LABEL_7:
    v26(v17, v9);
    v29 = v62;
    v24(v62, a1, v9);
LABEL_8:
    v26(v29, v9);
    v24(v27, a1, v9);
    v30 = v64;
    goto LABEL_9;
  }
  sub_23037A0A0();
  v28 = sub_23037A6DC();
  swift_bridgeObjectRelease();
  v26(v20, v9);
  v24(v17, a1, v9);
  v27 = v63;
  if ((v28 & 1) != 0)
    goto LABEL_7;
  sub_23037A0A0();
  v37 = sub_23037A6DC();
  swift_bridgeObjectRelease();
  v26(v17, v9);
  v29 = v62;
  v24(v62, a1, v9);
  if ((v37 & 1) != 0)
    goto LABEL_8;
  sub_23037A0A0();
  v38 = sub_23037A6DC();
  swift_bridgeObjectRelease();
  v26(v29, v9);
  v24(v27, a1, v9);
  v30 = v64;
  if ((v38 & 1) == 0)
  {
    v67 = sub_23037A07C();
    v68 = v39;
    v65 = 0xD000000000000010;
    v66 = 0x800000023038C360;
    sub_2302DF64C();
    v40 = sub_23037AA90();
    swift_bridgeObjectRelease();
    v26(v27, v9);
    if ((v40 & 1) == 0)
      return;
    goto LABEL_10;
  }
LABEL_9:
  v26(v27, v9);
LABEL_10:
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B2E8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23037BDD0;
  v32 = (void *)*MEMORY[0x24BDBCBE0];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDBCBE0];
  v33 = v32;
  sub_230360770(inited);
  v34 = v69;
  sub_23037A088();
  swift_bridgeObjectRelease();
  if (!v30)
  {
    v35 = (uint64_t)v60;
    sub_230379FF8();
    v36 = v61;
    if (__swift_getEnumTagSinglePayload(v35, 1, v61) == 1)
    {
      (*(void (**)(char *, uint64_t))(v58 + 8))(v34, v59);
      sub_2302FD540(v35, &qword_25405B4C8);
    }
    else
    {
      v41 = v53;
      v42 = v54;
      (*(void (**)(char *, uint64_t, uint64_t))(v54 + 32))(v53, v35, v36);
      v43 = (uint64_t)v55;
      v44 = v36;
      v45 = &v55[*(int *)(v52 + 48)];
      v24(v55, a1, v9);
      v46 = v41;
      v47 = v44;
      (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v45, v41, v44);
      v48 = v57;
      sub_23035EE38(sub_2302D89E4);
      v49 = *(_QWORD *)(*v48 + 16);
      sub_23035EEBC(v49, (uint64_t (*)(BOOL))sub_2302D89E4);
      v50 = *v48;
      *(_QWORD *)(v50 + 16) = v49 + 1;
      sub_230363160(v43, v50+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(_QWORD *)(v56 + 72) * v49, &qword_25405AD48);
      (*(void (**)(char *, uint64_t))(v42 + 8))(v46, v47);
      (*(void (**)(char *, uint64_t))(v58 + 8))(v69, v59);
    }
  }
}

uint64_t sub_23035D960(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405AD48);
  v2 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405AD30);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = MEMORY[0x24BEE4AF8];
  if (v9)
  {
    v17 = MEMORY[0x24BEE4AF8];
    sub_2302DA5B0(0, v9, 0);
    v11 = a1 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    v12 = *(_QWORD *)(v2 + 72);
    v10 = v17;
    do
    {
      sub_230363130(v11, (uint64_t)v4, &qword_25405AD48);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2302DA5B0(0, *(_QWORD *)(v10 + 16) + 1, 1);
        v10 = v17;
      }
      v14 = *(_QWORD *)(v10 + 16);
      v13 = *(_QWORD *)(v10 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_2302DA5B0(v13 > 1, v14 + 1, 1);
        v10 = v17;
      }
      *(_QWORD *)(v10 + 16) = v14 + 1;
      sub_230363160((uint64_t)v8, v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v14, &qword_25405AD30);
      v11 += v12;
      --v9;
    }
    while (v9);
  }
  return v10;
}

uint64_t sub_23035DB20(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v5;

  OUTLINED_FUNCTION_123_1(OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter);
  OUTLINED_FUNCTION_99_3(a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
  if (v1)
  {
    OUTLINED_FUNCTION_2_1();
    return 0;
  }
  else
  {
    OUTLINED_FUNCTION_166_2();
    OUTLINED_FUNCTION_7_4();
    OUTLINED_FUNCTION_119_2();
    type metadata accessor for SportingEventSubscription(0);
    sub_2302ED798((unint64_t *)&qword_25405B038, type metadata accessor for SportingEventSubscription, (uint64_t)&protocol conformance descriptor for SportingEventSubscription);
    OUTLINED_FUNCTION_131();
    sub_230379E84();
    OUTLINED_FUNCTION_131_2();
    OUTLINED_FUNCTION_23_4();
    return v5;
  }
}

void sub_23035DBF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  void (*v6)(void);
  uint64_t v7;

  OUTLINED_FUNCTION_9_0();
  v4 = v3;
  OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_36_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_156_0();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter), *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter + 24));
  sub_23035949C();
  OUTLINED_FUNCTION_60_7();
  v6();
  OUTLINED_FUNCTION_3_9(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_230359750();
  sub_2303623BC();
  sub_230379E84();
  OUTLINED_FUNCTION_137_2();
  OUTLINED_FUNCTION_23_4();
  *v4 = v7;
  OUTLINED_FUNCTION_0_2();
}

void sub_23035DD34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t inited;
  uint64_t v22;
  void (*v23)(void);
  uint64_t v24;
  unint64_t v25;

  OUTLINED_FUNCTION_50();
  v13 = v11;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_44_1();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_12();
  sub_23035DBF8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B2E0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23037BDD0;
  *(_QWORD *)(inited + 32) = v17;
  *(_QWORD *)(inited + 40) = v15;
  OUTLINED_FUNCTION_75_0();
  v22 = sub_23035BE04(inited);
  if ((v19 & 1) != 0)
  {
    sub_230358B7C(v22, a10);
    OUTLINED_FUNCTION_74_0();
  }
  else
  {
    sub_2302EA848(v22, a10);
  }
  sub_2303596B4();
  sub_2303623F8();
  sub_230379EF0();
  OUTLINED_FUNCTION_67_2();
  OUTLINED_FUNCTION_23_4();
  if (!v13)
  {
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v10 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter), *(_QWORD *)(v10 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter + 24));
    sub_23035949C();
    OUTLINED_FUNCTION_57_7();
    v23();
    OUTLINED_FUNCTION_14_5(v12);
    v24 = OUTLINED_FUNCTION_134_1();
    sub_2302E340C(v24, v25);
  }
  OUTLINED_FUNCTION_152_0();
  OUTLINED_FUNCTION_4();
}

uint64_t sub_23035DEC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[14];
  uint64_t v27;
  uint64_t v28;

  OUTLINED_FUNCTION_9_0();
  v27 = v3;
  v28 = v4;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_44_1();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_18_10();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v26 - v15;
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_93_2();
  v26[2] = v10;
  v26[3] = v8;
  OUTLINED_FUNCTION_5_12();
  if ((OUTLINED_FUNCTION_6_8() & 1) != 0)
  {
    if (qword_25405B480 != -1)
      swift_once();
    v17 = OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_13_8(v17, (uint64_t)qword_2540621F0);
    v18 = OUTLINED_FUNCTION_146_1();
    if (OUTLINED_FUNCTION_44_6(v18))
    {
      *(_WORD *)OUTLINED_FUNCTION_5_2() = 0;
      OUTLINED_FUNCTION_23_7(&dword_2302D3000, v19, v20, "canonicalId cannot contain parental traversal string patterns");
      OUTLINED_FUNCTION_28_0();
    }

    return 0;
  }
  else
  {
    sub_23035B6A4(v6 & 1, v0);
    OUTLINED_FUNCTION_134_1();
    sub_23037A0C4();
    OUTLINED_FUNCTION_170();
    sub_23037A0D0();
    v22 = *(void (**)(uint64_t, void *))(v2 + 8);
    v22(v1, v11);
    v21 = sub_23035DB20((uint64_t)v16);
    v23 = OUTLINED_FUNCTION_62_6();
    ((void (*)(uint64_t))v22)(v23);
    v24 = OUTLINED_FUNCTION_91_1();
    ((void (*)(uint64_t))v22)(v24);
  }
  return v21;
}

void sub_23035E048()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];

  OUTLINED_FUNCTION_9_0();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = (void *)OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_44_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_19_7();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v21 - v12;
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_31_7();
  v21[2] = v7;
  v21[3] = v5;
  OUTLINED_FUNCTION_5_12();
  if ((OUTLINED_FUNCTION_6_8() & 1) != 0)
  {
    if (qword_25405B480 != -1)
      swift_once();
    v14 = OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_13_8(v14, (uint64_t)qword_2540621F0);
    v15 = OUTLINED_FUNCTION_146_1();
    if (OUTLINED_FUNCTION_44_6(v15))
    {
      *(_WORD *)OUTLINED_FUNCTION_5_2() = 0;
      OUTLINED_FUNCTION_23_7(&dword_2302D3000, v16, v17, "eventId cannot contain parental traversal string patterns");
      OUTLINED_FUNCTION_28_0();
    }

  }
  else
  {
    sub_23035B6A4(v3 & 1, v0);
    sub_23037A0C4();
    OUTLINED_FUNCTION_136_1();
    v18 = *(void (**)(uint64_t))(v1 + 8);
    v19 = OUTLINED_FUNCTION_91_1();
    v18(v19);
    sub_23037A0F4();
    ((void (*)(char *, void *))v18)(v13, v8);
    v20 = OUTLINED_FUNCTION_62_6();
    v18(v20);
  }
  OUTLINED_FUNCTION_0_2();
}

void PersistentStore.deinit()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_114_0(v1);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter);
  swift_bridgeObjectRelease();
  sub_2302FD540(v0 + OBJC_IVAR____TtC9SportsKit15PersistentStore____lazy_storage___activityDataURL, &qword_25405B530);
  OUTLINED_FUNCTION_80_3(OBJC_IVAR____TtC9SportsKit15PersistentStore____lazy_storage___scoreboardsDataURL);
  OUTLINED_FUNCTION_80_3(OBJC_IVAR____TtC9SportsKit15PersistentStore____lazy_storage___cloudChannelSubscriptionURL);
  OUTLINED_FUNCTION_80_3(OBJC_IVAR____TtC9SportsKit15PersistentStore____lazy_storage___autostartSuppressionsURL);
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_3();
}

uint64_t PersistentStore.__deallocating_deinit()
{
  PersistentStore.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_23035E2A8()
{
  return sub_230359280();
}

void sub_23035E2C8()
{
  sub_23035AB4C();
}

#error "23035E2F8: call analysis failed (funcsize=8)"

void sub_23035E308()
{
  sub_23035AF20();
}

void sub_23035E328()
{
  sub_23035B150();
}

uint64_t sub_23035E348()
{
  return sub_23035DEC0();
}

unint64_t sub_23035E368()
{
  return (unint64_t)sub_23035B42C() & 1;
}

void sub_23035E38C()
{
  sub_23035C890();
}

void sub_23035E3AC()
{
  sub_23035C8C0();
}

uint64_t sub_23035E3CC(double a1)
{
  return sub_23035A354(a1);
}

void sub_23035E3EC()
{
  sub_230359B5C();
}

uint64_t sub_23035E40C(os_log_type_t a1)
{
  return sub_23035B254(a1);
}

uint64_t sub_23035E42C()
{
  return sub_23035A054();
}

void sub_23035E44C()
{
  sub_2303597E8();
}

void sub_23035E46C()
{
  sub_23035CAD4();
}

void sub_23035E48C()
{
  sub_23035CD2C();
}

void sub_23035E4AC()
{
  sub_23035CD60();
}

void sub_23035E4CC()
{
  sub_23035CE60();
}

void sub_23035E4EC()
{
  sub_23035BF2C();
}

void sub_23035E50C()
{
  sub_23035C5A4();
}

void sub_23035E52C()
{
  sub_23035C204();
}

#error "23035E55C: call analysis failed (funcsize=8)"

void sub_23035E56C()
{
  sub_23035DBF8();
}

void sub_23035E58C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;

  sub_23035DD34(a1, a2, a3, a4, a5, a6, a7, a8, v8, v9);
}

void sub_23035E5AC(char a1@<W0>, uint64_t a2@<X8>)
{
  sub_23035B6A4(a1, a2);
}

uint64_t DatedSubscribers.subscriberCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t DatedSubscribers.lastSubscription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  type metadata accessor for DatedSubscribers(0);
  OUTLINED_FUNCTION_43_0();
  v0 = OUTLINED_FUNCTION_100_2();
  return OUTLINED_FUNCTION_21_7(v0, v1, v2, v3);
}

uint64_t DatedSubscribers.init(subscriberCount:lastSubscription:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  *a3 = a1;
  v4 = (uint64_t)a3 + *(int *)(type metadata accessor for DatedSubscribers(0) + 20);
  v5 = OUTLINED_FUNCTION_43_0();
  return OUTLINED_FUNCTION_21_7(v4, a2, v5, *(uint64_t (**)(void))(*(_QWORD *)(v5 - 8) + 32));
}

_QWORD *static DatedSubscribers.+ infix(_:_:)@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;

  v4 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for DatedSubscribers(0);
    result = (_QWORD *)sub_23037A22C();
    *a3 = v4;
  }
  return result;
}

void static DatedSubscribers.- infix(_:_:)(_QWORD *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a1 - a2;
  if (__OFSUB__(*a1, a2))
  {
    __break(1u);
  }
  else
  {
    v5 = (uint64_t)a3 + *(int *)(type metadata accessor for DatedSubscribers(0) + 20);
    v6 = OUTLINED_FUNCTION_43_0();
    OUTLINED_FUNCTION_151_1(v5, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16));
    *a3 = v4;
    OUTLINED_FUNCTION_13_0();
  }
}

void DatedSubscribers.hash(into:)()
{
  sub_23037AF88();
  type metadata accessor for DatedSubscribers(0);
  OUTLINED_FUNCTION_43_0();
  sub_2302ED798(&qword_255E582A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_23037A550();
  OUTLINED_FUNCTION_13_0();
}

void static DatedSubscribers.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2)
  {
    type metadata accessor for DatedSubscribers(0);
    sub_23037A208();
  }
  else
  {
    OUTLINED_FUNCTION_3();
  }
}

uint64_t sub_23035E7B0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6269726373627573 && a2 == 0xEF746E756F437265;
  if (v2 || (sub_23037AE8C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023038C300)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23037AE8C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23035E8C0(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000010;
  else
    return 0x6269726373627573;
}

uint64_t sub_23035E908()
{
  char *v0;

  return sub_23035E8C0(*v0);
}

uint64_t sub_23035E910@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23035E7B0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23035E934()
{
  sub_230362434();
  return sub_23037B00C();
}

uint64_t sub_23035E95C()
{
  sub_230362434();
  return sub_23037B018();
}

uint64_t DatedSubscribers.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(&qword_255E59FA8);
  OUTLINED_FUNCTION_36_1();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_148_2(a1);
  sub_230362434();
  sub_23037B000();
  sub_23037AE08();
  if (!v1)
  {
    type metadata accessor for DatedSubscribers(0);
    OUTLINED_FUNCTION_43_0();
    sub_2302ED798(&qword_25405AD50, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_23037AE14();
  }
  v4 = OUTLINED_FUNCTION_62_6();
  return v5(v4);
}

uint64_t DatedSubscribers.hashValue.getter()
{
  sub_23037AF7C();
  sub_23037AF88();
  type metadata accessor for DatedSubscribers(0);
  OUTLINED_FUNCTION_43_0();
  sub_2302ED798(&qword_255E582A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_23037A550();
  return sub_23037AFA0();
}

void DatedSubscribers.init(from:)()
{
  uint64_t v0;
  uint64_t *v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_50();
  v3 = v2;
  v10 = v4;
  v11 = *(_QWORD *)(OUTLINED_FUNCTION_43_0() - 8);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_42_0();
  v12 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E59FB8);
  OUTLINED_FUNCTION_36_1();
  MEMORY[0x24BDAC7A8](v7);
  v8 = type metadata accessor for DatedSubscribers(0);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_36_7();
  OUTLINED_FUNCTION_130_1(v3);
  sub_230362434();
  sub_23037AFD0();
  if (!v0)
  {
    *v1 = sub_23037AD6C();
    sub_2302ED798(&qword_25405B540, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    sub_23037AD78();
    OUTLINED_FUNCTION_102_2();
    OUTLINED_FUNCTION_88_3((uint64_t)v1 + *(int *)(v8 + 20), v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 32));
    sub_230362470((uint64_t)v1, v10);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  OUTLINED_FUNCTION_4();
}

uint64_t sub_23035ED04()
{
  sub_23037AF7C();
  sub_23037AF88();
  sub_23037A238();
  sub_2302ED798(&qword_255E582A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_23037A550();
  return sub_23037AFA0();
}

void sub_23035ED90()
{
  DatedSubscribers.init(from:)();
}

uint64_t sub_23035EDA4(_QWORD *a1)
{
  return DatedSubscribers.encode(to:)(a1);
}

uint64_t sub_23035EDBC()
{
  uint64_t v0;

  sub_23037A5C8();
  sub_23037AF7C();
  sub_23037A64C();
  v0 = sub_23037AFA0();
  OUTLINED_FUNCTION_41();
  return v0;
}

void sub_23035EE2C()
{
  sub_23035EE38(sub_2302D8B64);
}

void sub_23035EE38(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t isUniquelyReferenced_nonNull_native;

  v3 = *v1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v1 = v3;
  if (!(_DWORD)isUniquelyReferenced_nonNull_native)
    *v1 = a1(isUniquelyReferenced_nonNull_native, *(_QWORD *)(v3 + 16) + 1, 1, v3);
  OUTLINED_FUNCTION_13_0();
}

uint64_t sub_23035EE84(uint64_t result)
{
  _QWORD *v1;

  if (result + 1 > *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
    return sub_23037A790();
  return result;
}

uint64_t sub_23035EEB0(uint64_t a1)
{
  return sub_23035EEBC(a1, (uint64_t (*)(BOOL))sub_2302D8B64);
}

uint64_t sub_23035EEBC(uint64_t result, uint64_t (*a2)(BOOL))
{
  uint64_t v2;
  unint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    result = a2(v3 > 1);
    *(_QWORD *)v2 = result;
  }
  return result;
}

uint64_t sub_23035EEFC()
{
  swift_arrayDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_23035EF2C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t i;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v2 = result;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  if (!v6)
    goto LABEL_6;
LABEL_5:
  v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (i = v9 | (v8 << 6); ; i = __clz(__rbit64(v12)) + (v8 << 6))
  {
    v14 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v15 = *v14;
    v16 = v14[1];
    swift_bridgeObjectRetain();
    sub_23035F840(v15, v16);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if (v6)
      goto LABEL_5;
LABEL_6:
    v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v11 >= v7)
      return swift_release();
    v12 = *(_QWORD *)(v3 + 8 * v11);
    ++v8;
    if (!v12)
    {
      v8 = v11 + 1;
      if (v11 + 1 >= v7)
        return swift_release();
      v12 = *(_QWORD *)(v3 + 8 * v8);
      if (!v12)
      {
        v8 = v11 + 2;
        if (v11 + 2 >= v7)
          return swift_release();
        v12 = *(_QWORD *)(v3 + 8 * v8);
        if (!v12)
        {
          v8 = v11 + 3;
          if (v11 + 3 >= v7)
            return swift_release();
          v12 = *(_QWORD *)(v3 + 8 * v8);
          if (!v12)
            break;
        }
      }
    }
LABEL_21:
    v6 = (v12 - 1) & v12;
  }
  v13 = v11 + 4;
  if (v13 >= v7)
    return swift_release();
  v12 = *(_QWORD *)(v3 + 8 * v13);
  if (v12)
  {
    v8 = v13;
    goto LABEL_21;
  }
  while (1)
  {
    v8 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v8 >= v7)
      return swift_release();
    v12 = *(_QWORD *)(v3 + 8 * v8);
    ++v13;
    if (v12)
      goto LABEL_21;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_23035F0C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  BOOL v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t isStackAllocationSafe;
  char v29;
  unint64_t v30;
  size_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  unint64_t v42;
  uint64_t v43;

  v2 = a2;
  v43 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a2 + 16))
  {
    v4 = *(_QWORD *)(a1 + 56);
    v37 = a1 + 56;
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v35 = ~v5;
    if (-v5 < 64)
      v6 = ~(-1 << -(char)v5);
    else
      v6 = -1;
    v7 = v6 & v4;
    v36 = (unint64_t)(63 - v5) >> 6;
    v8 = a2 + 56;
    swift_bridgeObjectRetain();
    v9 = 0;
    if (!v7)
      goto LABEL_7;
LABEL_6:
    v10 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v11 = v10 | (v9 << 6);
    while (1)
    {
      v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
      v18 = *v16;
      v17 = v16[1];
      sub_23037AF7C();
      swift_bridgeObjectRetain();
      sub_23037A64C();
      v19 = sub_23037AFA0();
      v20 = -1 << *(_BYTE *)(v2 + 32);
      v21 = v19 & ~v20;
      if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) != 0)
        break;
LABEL_37:
      swift_bridgeObjectRelease();
      if (v7)
        goto LABEL_6;
LABEL_7:
      v12 = v9 + 1;
      if (__OFADD__(v9, 1))
      {
        __break(1u);
        goto LABEL_50;
      }
      if (v12 >= v36)
        goto LABEL_48;
      v13 = *(_QWORD *)(v37 + 8 * v12);
      v14 = v9 + 1;
      if (!v13)
      {
        v14 = v9 + 2;
        if (v9 + 2 >= v36)
          goto LABEL_48;
        v13 = *(_QWORD *)(v37 + 8 * v14);
        if (!v13)
        {
          v14 = v9 + 3;
          if (v9 + 3 >= v36)
            goto LABEL_48;
          v13 = *(_QWORD *)(v37 + 8 * v14);
          if (!v13)
          {
            v14 = v9 + 4;
            if (v9 + 4 >= v36)
              goto LABEL_48;
            v13 = *(_QWORD *)(v37 + 8 * v14);
            if (!v13)
            {
              v15 = v9 + 5;
              if (v9 + 5 >= v36)
              {
LABEL_48:
                sub_23031FB44();
                return v2;
              }
              v13 = *(_QWORD *)(v37 + 8 * v15);
              if (!v13)
              {
                while (1)
                {
                  v14 = v15 + 1;
                  if (__OFADD__(v15, 1))
                    break;
                  if (v14 >= v36)
                    goto LABEL_48;
                  v13 = *(_QWORD *)(v37 + 8 * v14);
                  ++v15;
                  if (v13)
                    goto LABEL_22;
                }
LABEL_50:
                __break(1u);
              }
              v14 = v9 + 5;
            }
          }
        }
      }
LABEL_22:
      v7 = (v13 - 1) & v13;
      v11 = __clz(__rbit64(v13)) + (v14 << 6);
      v9 = v14;
    }
    v22 = *(_QWORD *)(v2 + 48);
    v23 = (_QWORD *)(v22 + 16 * v21);
    v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_23037AE8C() & 1) != 0)
    {
      isStackAllocationSafe = swift_bridgeObjectRelease();
      v38 = a1;
      v39 = v37;
      v40 = v35;
      v41 = v9;
      v42 = v7;
    }
    else
    {
      v25 = ~v20;
      do
      {
        v21 = (v21 + 1) & v25;
        if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
          goto LABEL_37;
        v26 = (_QWORD *)(v22 + 16 * v21);
        v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_23037AE8C() & 1) == 0);
      v38 = a1;
      v39 = v37;
      v40 = v35;
      v41 = v9;
      v42 = v7;
      isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    v29 = *(_BYTE *)(v2 + 32);
    v30 = (unint64_t)((1 << v29) + 63) >> 6;
    v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
    {
      MEMORY[0x24BDAC7A8](isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      v32 = sub_23035F9CC((uint64_t)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), v30, v2, v21, &v38);
      swift_release();
      sub_23031FB44();
    }
    else
    {
      v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      v32 = sub_23035F9CC((uint64_t)v33, v30, v2, v21, &v38);
      swift_release();
      sub_23031FB44();
      MEMORY[0x2348B7D1C](v33, -1, -1);
    }
    return v32;
  }
  else
  {
    swift_release();
    return MEMORY[0x24BEE4B08];
  }
}

uint64_t sub_23035F534(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t isStackAllocationSafe;
  char v19;
  unint64_t v20;
  size_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = a2;
  v28 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x24BEE4B08];
  }
  v26 = a1;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = a2 + 56;
    v25[0] = a1 + 32;
    swift_bridgeObjectRetain();
    v5 = 0;
    while (1)
    {
      v6 = (uint64_t *)(v25[0] + 16 * v5);
      v8 = *v6;
      v7 = v6[1];
      ++v5;
      sub_23037AF7C();
      swift_bridgeObjectRetain();
      sub_23037A64C();
      v9 = sub_23037AFA0();
      v10 = -1 << *(_BYTE *)(v2 + 32);
      v11 = v9 & ~v10;
      if (((*(_QWORD *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
      {
        v12 = *(_QWORD *)(v2 + 48);
        v13 = (_QWORD *)(v12 + 16 * v11);
        v14 = *v13 == v8 && v13[1] == v7;
        if (v14 || (sub_23037AE8C() & 1) != 0)
        {
          isStackAllocationSafe = swift_bridgeObjectRelease();
          v27 = v5;
LABEL_22:
          v19 = *(_BYTE *)(v2 + 32);
          v20 = (unint64_t)((1 << v19) + 63) >> 6;
          v21 = 8 * v20;
          if ((v19 & 0x3Fu) < 0xE
            || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
          {
            MEMORY[0x24BDAC7A8](isStackAllocationSafe);
            memcpy((char *)v25 - ((v21 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v21);
            v22 = sub_23035FCA4((uint64_t)v25 - ((v21 + 15) & 0x3FFFFFFFFFFFFFF0), v20, v2, v11, &v26);
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            v23 = (void *)swift_slowAlloc();
            memcpy(v23, (const void *)(v2 + 56), v21);
            v22 = sub_23035FCA4((uint64_t)v23, v20, v2, v11, &v26);
            swift_release();
            swift_bridgeObjectRelease();
            MEMORY[0x2348B7D1C](v23, -1, -1);
          }
          return v22;
        }
        v15 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v15;
          if (((*(_QWORD *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
            break;
          v16 = (_QWORD *)(v12 + 16 * v11);
          v17 = *v16 == v8 && v16[1] == v7;
          if (v17 || (sub_23037AE8C() & 1) != 0)
          {
            v27 = v5;
            isStackAllocationSafe = swift_bridgeObjectRelease();
            goto LABEL_22;
          }
        }
      }
      swift_bridgeObjectRelease();
      if (v5 == v3)
      {
        swift_bridgeObjectRelease();
        return v2;
      }
    }
  }
  return v2;
}

uint64_t sub_23035F840(uint64_t a1, uint64_t a2)
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
  sub_23037AF7C();
  swift_bridgeObjectRetain();
  sub_23037A64C();
  v6 = sub_23037AFA0();
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
  if (!v11 && (sub_23037AE8C() & 1) == 0)
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
    while (!v17 && (sub_23037AE8C() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v2;
  v19 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_230360154();
    v13 = v19;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v8);
  sub_23036040C(v8);
  *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_23035F9CC(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t i;
  unint64_t v33;
  _QWORD *v34;
  BOOL v35;
  uint64_t v37;
  unint64_t *v38;
  uint64_t v39;

  v7 = *(_QWORD *)(a3 + 16);
  v38 = (unint64_t *)result;
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v8 = v7 - 1;
  v39 = a3 + 56;
  while (2)
  {
    v37 = v8;
    do
    {
      while (1)
      {
        v9 = a5[3];
        v10 = a5[4];
        if (v10)
        {
          v11 = (v10 - 1) & v10;
          v12 = __clz(__rbit64(v10)) | (v9 << 6);
        }
        else
        {
          v13 = v9 + 1;
          if (__OFADD__(v9, 1))
          {
            __break(1u);
            goto LABEL_46;
          }
          v14 = (unint64_t)(a5[2] + 64) >> 6;
          v15 = a5[3];
          if (v13 >= v14)
            goto LABEL_44;
          v16 = a5[1];
          v17 = *(_QWORD *)(v16 + 8 * v13);
          if (!v17)
          {
            v15 = v9 + 1;
            if (v9 + 2 >= v14)
              goto LABEL_44;
            v17 = *(_QWORD *)(v16 + 8 * (v9 + 2));
            if (v17)
            {
              v13 = v9 + 2;
            }
            else
            {
              v15 = v9 + 2;
              if (v9 + 3 >= v14)
                goto LABEL_44;
              v17 = *(_QWORD *)(v16 + 8 * (v9 + 3));
              if (v17)
              {
                v13 = v9 + 3;
              }
              else
              {
                v13 = v9 + 4;
                v15 = v9 + 3;
                if (v9 + 4 >= v14)
                  goto LABEL_44;
                v17 = *(_QWORD *)(v16 + 8 * v13);
                if (!v17)
                {
                  v18 = v9 + 5;
                  while (v18 < v14)
                  {
                    v17 = *(_QWORD *)(v16 + 8 * v18++);
                    if (v17)
                    {
                      v13 = v18 - 1;
                      goto LABEL_20;
                    }
                  }
                  v15 = v14 - 1;
LABEL_44:
                  a5[3] = v15;
                  a5[4] = 0;
                  swift_retain();
                  return sub_23035FEC8(v38, a2, v37, a3);
                }
              }
            }
          }
LABEL_20:
          v11 = (v17 - 1) & v17;
          v12 = __clz(__rbit64(v17)) + (v13 << 6);
          v9 = v13;
        }
        v19 = (uint64_t *)(*(_QWORD *)(*a5 + 48) + 16 * v12);
        v21 = *v19;
        v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_23037AF7C();
        swift_bridgeObjectRetain();
        sub_23037A64C();
        v22 = sub_23037AFA0();
        v23 = -1 << *(_BYTE *)(a3 + 32);
        v24 = v22 & ~v23;
        v25 = v24 >> 6;
        v26 = 1 << v24;
        if (((1 << v24) & *(_QWORD *)(v39 + 8 * (v24 >> 6))) != 0)
          break;
LABEL_38:
        result = swift_bridgeObjectRelease();
      }
      v27 = *(_QWORD *)(a3 + 48);
      v28 = (_QWORD *)(v27 + 16 * v24);
      v29 = *v28 == v21 && v28[1] == v20;
      if (!v29 && (sub_23037AE8C() & 1) == 0)
      {
        v31 = ~v23;
        for (i = v24 + 1; ; i = v33 + 1)
        {
          v33 = i & v31;
          if (((*(_QWORD *)(v39 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0)
            break;
          v34 = (_QWORD *)(v27 + 16 * v33);
          v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_23037AE8C() & 1) != 0)
          {
            result = swift_bridgeObjectRelease();
            v25 = v33 >> 6;
            v26 = 1 << v33;
            goto LABEL_28;
          }
        }
        goto LABEL_38;
      }
      result = swift_bridgeObjectRelease();
LABEL_28:
      v30 = v38[v25];
      v38[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    v8 = v37 - 1;
    if (__OFSUB__(v37, 1))
    {
LABEL_46:
      __break(1u);
      return result;
    }
    if (v37 != 1)
      continue;
    return MEMORY[0x24BEE4B08];
  }
}

uint64_t sub_23035FCA4(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  BOOL v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t i;
  unint64_t v26;
  _QWORD *v27;
  BOOL v28;
  unint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v30 = (unint64_t *)result;
  v31 = v6 - 1;
  v8 = *a5;
  v7 = a5[1];
  v9 = *(_QWORD *)(*a5 + 16);
  if (v7 == v9)
  {
LABEL_2:
    swift_retain();
    return sub_23035FEC8(v30, a2, v31, a3);
  }
  v32 = a3 + 56;
  while ((v7 & 0x8000000000000000) == 0)
  {
    if (v7 >= v9)
      goto LABEL_30;
    v11 = v8 + 16 * v7;
    v13 = *(_QWORD *)(v11 + 32);
    v12 = *(_QWORD *)(v11 + 40);
    a5[1] = v7 + 1;
    sub_23037AF7C();
    swift_bridgeObjectRetain();
    sub_23037A64C();
    v14 = sub_23037AFA0();
    v15 = -1 << *(_BYTE *)(a3 + 32);
    v16 = v14 & ~v15;
    v17 = v16 >> 6;
    v18 = 1 << v16;
    if (((1 << v16) & *(_QWORD *)(v32 + 8 * (v16 >> 6))) == 0)
      goto LABEL_25;
    v19 = *(_QWORD *)(a3 + 48);
    v20 = (_QWORD *)(v19 + 16 * v16);
    v21 = *v20 == v13 && v20[1] == v12;
    if (!v21 && (sub_23037AE8C() & 1) == 0)
    {
      v24 = ~v15;
      for (i = v16 + 1; ; i = v26 + 1)
      {
        v26 = i & v24;
        if (((*(_QWORD *)(v32 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0)
          break;
        v27 = (_QWORD *)(v19 + 16 * v26);
        v28 = *v27 == v13 && v27[1] == v12;
        if (v28 || (sub_23037AE8C() & 1) != 0)
        {
          result = swift_bridgeObjectRelease();
          v17 = v26 >> 6;
          v18 = 1 << v26;
          goto LABEL_13;
        }
      }
LABEL_25:
      result = swift_bridgeObjectRelease();
      goto LABEL_26;
    }
    result = swift_bridgeObjectRelease();
LABEL_13:
    v22 = v30[v17];
    v30[v17] = v22 & ~v18;
    if ((v18 & v22) != 0)
    {
      v23 = v31 - 1;
      if (__OFSUB__(v31, 1))
        goto LABEL_31;
      --v31;
      if (!v23)
        return MEMORY[0x24BEE4B08];
    }
LABEL_26:
    v8 = *a5;
    v7 = a5[1];
    v9 = *(_QWORD *)(*a5 + 16);
    if (v7 == v9)
      goto LABEL_2;
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_23035FEC8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;

  v4 = a4;
  if (!a3)
  {
    v8 = MEMORY[0x24BEE4B08];
LABEL_35:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405BBE8);
  result = sub_23037AAFC();
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_35;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_35;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_35;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v18 = *v17;
    v19 = v17[1];
    sub_23037AF7C();
    swift_bridgeObjectRetain();
    sub_23037A64C();
    result = sub_23037AFA0();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) == 0)
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
        if (v27 != -1)
        {
          v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_33;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
      goto LABEL_38;
    if (!v5)
      goto LABEL_35;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_35;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_35;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

void sub_230360154()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t i;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;

  OUTLINED_FUNCTION_107_1();
  v3 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405BBE8);
  v4 = OUTLINED_FUNCTION_118_2();
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_28:
    OUTLINED_FUNCTION_87_1();
    *v3 = v4;
    OUTLINED_FUNCTION_57_1();
    return;
  }
  v5 = (void *)OUTLINED_FUNCTION_30_6();
  if (v8)
    v9 = (unint64_t)v5 >= v7;
  else
    v9 = 1;
  if (v9)
    OUTLINED_FUNCTION_128_2(v5, v6);
  v10 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v1 + 16);
  v11 = 1 << *(_BYTE *)(v1 + 32);
  v12 = *(_QWORD *)(v1 + 56);
  v13 = -1;
  if (v11 < 64)
    v13 = ~(-1 << v11);
  v14 = v13 & v12;
  v15 = (unint64_t)(v11 + 63) >> 6;
  if ((v13 & v12) == 0)
    goto LABEL_12;
LABEL_11:
  v16 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  for (i = v16 | (v10 << 6); ; i = __clz(__rbit64(v19)) + (v10 << 6))
  {
    v21 = (_QWORD *)(*(_QWORD *)(v1 + 48) + 16 * i);
    v22 = v21[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * i);
    *v23 = *v21;
    v23[1] = v22;
    swift_bridgeObjectRetain();
    if (v14)
      goto LABEL_11;
LABEL_12:
    v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v15)
      goto LABEL_28;
    v19 = *(_QWORD *)(v2 + 8 * v18);
    ++v10;
    if (!v19)
    {
      v10 = v18 + 1;
      if (v18 + 1 >= v15)
        goto LABEL_28;
      v19 = *(_QWORD *)(v2 + 8 * v10);
      if (!v19)
      {
        v10 = v18 + 2;
        if (v18 + 2 >= v15)
          goto LABEL_28;
        v19 = *(_QWORD *)(v2 + 8 * v10);
        if (!v19)
          break;
      }
    }
LABEL_25:
    v14 = (v19 - 1) & v19;
  }
  v20 = v18 + 3;
  if (v20 >= v15)
    goto LABEL_28;
  v19 = *(_QWORD *)(v2 + 8 * v20);
  if (v19)
  {
    v10 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v10 >= v15)
      goto LABEL_28;
    v19 = *(_QWORD *)(v2 + 8 * v10);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
}

void sub_2303602B8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v3 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E581B0);
  v4 = OUTLINED_FUNCTION_118_2();
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_28:
    OUTLINED_FUNCTION_87_1();
    *v3 = v4;
    OUTLINED_FUNCTION_13_0();
    return;
  }
  v5 = (void *)OUTLINED_FUNCTION_30_6();
  if (v8)
    v9 = (unint64_t)v5 >= v7;
  else
    v9 = 1;
  if (v9)
    OUTLINED_FUNCTION_128_2(v5, v6);
  v10 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v1 + 16);
  v11 = 1 << *(_BYTE *)(v1 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v1 + 56);
  v14 = (unint64_t)(v11 + 63) >> 6;
  if (!v13)
    goto LABEL_12;
LABEL_11:
  v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v15 | (v10 << 6); ; i = __clz(__rbit64(v18)) + (v10 << 6))
  {
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + i) = *(_BYTE *)(*(_QWORD *)(v1 + 48) + i);
    if (v13)
      goto LABEL_11;
LABEL_12:
    v17 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v2 + 8 * v17);
    ++v10;
    if (!v18)
    {
      v10 = v17 + 1;
      if (v17 + 1 >= v14)
        goto LABEL_28;
      v18 = *(_QWORD *)(v2 + 8 * v10);
      if (!v18)
      {
        v10 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_28;
        v18 = *(_QWORD *)(v2 + 8 * v10);
        if (!v18)
          break;
      }
    }
LABEL_25:
    v13 = (v18 - 1) & v18;
  }
  v19 = v17 + 3;
  if (v19 >= v14)
    goto LABEL_28;
  v18 = *(_QWORD *)(v2 + 8 * v19);
  if (v18)
  {
    v10 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v10 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v2 + 8 * v10);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
}

unint64_t sub_23036040C(unint64_t result)
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
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  BOOL v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_23037AACC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_23037AF7C();
        swift_bridgeObjectRetain();
        sub_23037A64C();
        v10 = sub_23037AFA0();
        swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 >= v9 && v2 >= (uint64_t)v11)
          {
LABEL_15:
            v14 = *(_QWORD *)(v3 + 48);
            v15 = (_OWORD *)(v14 + 16 * v2);
            v16 = (_OWORD *)(v14 + 16 * v6);
            v17 = v2 != v6 || v15 >= v16 + 1;
            v2 = v6;
            if (v17)
            {
              *v15 = *v16;
              v2 = v6;
            }
          }
        }
        else if (v11 >= v9 || v2 >= (uint64_t)v11)
        {
          goto LABEL_15;
        }
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
  v18 = *(_QWORD *)(v3 + 16);
  v19 = __OFSUB__(v18, 1);
  v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_2303605C4(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = MEMORY[0x24BEE4B08];
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405BBE8);
  result = sub_23037AAFC();
  v3 = result;
  v24 = *(_QWORD *)(a1 + 16);
  if (!v24)
  {
LABEL_25:
    OUTLINED_FUNCTION_7();
    return v3;
  }
  v4 = 0;
  v5 = result + 56;
  while (v4 < *(_QWORD *)(a1 + 16))
  {
    v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    v8 = *v6;
    v7 = v6[1];
    sub_23037AF7C();
    OUTLINED_FUNCTION_67();
    sub_23037A64C();
    result = sub_23037AFA0();
    v9 = -1 << *(_BYTE *)(v3 + 32);
    v10 = result & ~v9;
    v11 = v10 >> 6;
    v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
    v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      v14 = *(_QWORD *)(v3 + 48);
      v15 = (_QWORD *)(v14 + 16 * v10);
      v16 = *v15 == v8 && v15[1] == v7;
      if (v16 || (result = OUTLINED_FUNCTION_116_2(), (result & 1) != 0))
      {
LABEL_11:
        result = swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      v17 = ~v9;
      while (1)
      {
        v10 = (v10 + 1) & v17;
        v11 = v10 >> 6;
        v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
        v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * v10);
        if (*v18 != v8 || v18[1] != v7)
        {
          result = OUTLINED_FUNCTION_116_2();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_11;
      }
    }
    *(_QWORD *)(v5 + 8 * v11) = v13 | v12;
    v20 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    *v20 = v8;
    v20[1] = v7;
    v21 = *(_QWORD *)(v3 + 16);
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_27;
    *(_QWORD *)(v3 + 16) = v23;
LABEL_22:
    if (++v4 == v24)
      goto LABEL_25;
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

void sub_230360770(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = a1;
  if (!*(_QWORD *)(a1 + 16)
    || (__swift_instantiateConcreteTypeFromMangledName(&qword_25405A1A8),
        v2 = sub_23037AAFC(),
        v3 = v2,
        (v32 = *(_QWORD *)(v1 + 16)) == 0))
  {
LABEL_24:
    swift_bridgeObjectRelease();
    return;
  }
  v4 = 0;
  v5 = v2 + 56;
  v30 = v1;
  v31 = v1 + 32;
  while (v4 < *(_QWORD *)(v1 + 16))
  {
    v6 = *(void **)(v31 + 8 * v4);
    sub_23037A5C8();
    sub_23037AF7C();
    v7 = v6;
    sub_23037A64C();
    v8 = sub_23037AFA0();
    swift_bridgeObjectRelease();
    v9 = -1 << *(_BYTE *)(v3 + 32);
    v10 = v8 & ~v9;
    v11 = v10 >> 6;
    v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
    v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      v14 = sub_23037A5C8();
      v16 = v15;
      if (v14 == sub_23037A5C8() && v16 == v17)
      {
LABEL_21:
        swift_bridgeObjectRelease_n();
LABEL_22:

        goto LABEL_23;
      }
      v19 = sub_23037AE8C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v19 & 1) != 0)
        goto LABEL_22;
      v20 = ~v9;
      while (1)
      {
        v10 = (v10 + 1) & v20;
        v11 = v10 >> 6;
        v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
        v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0)
          break;
        v21 = sub_23037A5C8();
        v23 = v22;
        if (v21 == sub_23037A5C8() && v23 == v24)
          goto LABEL_21;
        v26 = sub_23037AE8C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v26 & 1) != 0)
          goto LABEL_22;
      }
    }
    *(_QWORD *)(v5 + 8 * v11) = v13 | v12;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v10) = v7;
    v27 = *(_QWORD *)(v3 + 16);
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (v28)
      goto LABEL_26;
    *(_QWORD *)(v3 + 16) = v29;
LABEL_23:
    ++v4;
    v1 = v30;
    if (v4 == v32)
      goto LABEL_24;
  }
  __break(1u);
LABEL_26:
  __break(1u);
}

void sub_2303609C8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  char v3;
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
  char v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  unint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  char v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  char *v31;
  void (*v32)(void);
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  _QWORD v38[4];
  char *v39;
  uint64_t v40;
  void (*v41)(void);
  uint64_t v42;
  uint64_t *v43;

  OUTLINED_FUNCTION_50();
  v43 = v2;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = OUTLINED_FUNCTION_43_0();
  v40 = *(_QWORD *)(v11 - 8);
  OUTLINED_FUNCTION_18_1();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v39 = (char *)v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_95_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B240);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_36_7();
  sub_230362D64(v10, v8, v6, &v42);
  v38[2] = v10;
  OUTLINED_FUNCTION_36();
  v38[1] = v6;
  swift_retain();
  OUTLINED_FUNCTION_153_2();
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B238);
  OUTLINED_FUNCTION_121_0((uint64_t)v1, 1, v16);
  if (v17)
  {
LABEL_16:
    swift_release();
    swift_bridgeObjectRelease();
    sub_23031FB44();
    swift_release();
    OUTLINED_FUNCTION_4();
    return;
  }
  v41 = *(void (**)(void))(v40 + 32);
  while (1)
  {
    v18 = (char *)v1 + *(int *)(v16 + 48);
    v19 = *v1;
    v20 = v1[1];
    v21 = v0;
    ((void (*)(uint64_t, char *, uint64_t))v41)(v0, v18, v11);
    v22 = *v43;
    v24 = OUTLINED_FUNCTION_124_0();
    v25 = *(_QWORD *)(v22 + 16);
    v26 = (v23 & 1) == 0;
    if (__OFADD__(v25, v26))
      break;
    v27 = v23;
    if (*(_QWORD *)(v22 + 24) >= v25 + v26)
    {
      if ((v4 & 1) != 0)
      {
        if ((v23 & 1) != 0)
          goto LABEL_10;
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_25405B278);
        sub_23037AC64();
        if ((v27 & 1) != 0)
          goto LABEL_10;
      }
    }
    else
    {
      sub_23031868C();
      v28 = OUTLINED_FUNCTION_124_0();
      if ((v27 & 1) != (v29 & 1))
        goto LABEL_19;
      v24 = v28;
      if ((v27 & 1) != 0)
      {
LABEL_10:
        v31 = v39;
        v30 = v40;
        v0 = v21;
        OUTLINED_FUNCTION_60_7();
        v32();
        (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v21, v11);
        OUTLINED_FUNCTION_2_4();
        (*(void (**)(unint64_t, char *, uint64_t))(v30 + 40))(*(_QWORD *)(*v43 + 56) + *(_QWORD *)(v30 + 72) * v24, v31, v11);
        goto LABEL_14;
      }
    }
    v33 = *v43;
    OUTLINED_FUNCTION_96_1(*v43 + 8 * (v24 >> 6));
    v34 = (_QWORD *)(*(_QWORD *)(v33 + 48) + 16 * v24);
    *v34 = v19;
    v34[1] = v20;
    v0 = v21;
    OUTLINED_FUNCTION_60_7();
    v41();
    v35 = *(_QWORD *)(v33 + 16);
    v36 = __OFADD__(v35, 1);
    v37 = v35 + 1;
    if (v36)
      goto LABEL_18;
    *(_QWORD *)(v33 + 16) = v37;
LABEL_14:
    OUTLINED_FUNCTION_153_2();
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B238);
    v4 = 1;
    OUTLINED_FUNCTION_121_0((uint64_t)v1, 1, v16);
    if (v17)
      goto LABEL_16;
  }
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  sub_23037AF04();
  __break(1u);
}

uint64_t sub_230360C98(uint64_t isStackAllocationSafe)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1;
  if ((*(_BYTE *)(isStackAllocationSafe + 32) & 0x3Fu) > 0xD)
  {
    isStackAllocationSafe = swift_stdlib_isStackAllocationSafe();
    if ((isStackAllocationSafe & 1) == 0)
    {
      OUTLINED_FUNCTION_5_2();
      OUTLINED_FUNCTION_108_1();
      OUTLINED_FUNCTION_66_3();
      OUTLINED_FUNCTION_28_0();
    }
  }
  MEMORY[0x24BDAC7A8](isStackAllocationSafe);
  OUTLINED_FUNCTION_108_1();
  v3 = OUTLINED_FUNCTION_66_3();
  if (!v1)
    return v3;
  OUTLINED_FUNCTION_71_4();
  return v2;
}

uint64_t sub_230360DB0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  double v36;
  double v37;
  uint64_t v39;
  unint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  int64_t v54;

  v39 = a2;
  v40 = a1;
  v4 = sub_23037A238();
  v51 = *(_QWORD *)(v4 - 8);
  v52 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v50 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A078);
  v6 = MEMORY[0x24BDAC7A8](v49);
  v48 = (uint64_t *)((char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v6);
  v44 = (char *)&v39 - v8;
  v9 = type metadata accessor for DatedSubscribers(0);
  v46 = *(_QWORD *)(v9 - 8);
  v47 = v9;
  result = MEMORY[0x24BDAC7A8](v9);
  v45 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = 0;
  v53 = (_QWORD *)a3;
  v13 = *(_QWORD *)(a3 + 64);
  v41 = 0;
  v42 = a3 + 64;
  v14 = 1 << *(_BYTE *)(a3 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & v13;
  v43 = (unint64_t)(v14 + 63) >> 6;
  v18 = v44;
  v17 = (uint64_t)v45;
  v19 = v51;
  while (1)
  {
    if (v16)
    {
      v20 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v54 = v12;
      v21 = v20 | (v12 << 6);
      goto LABEL_20;
    }
    v22 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v22 >= v43)
      return sub_2303614B4(v40, v39, v41, v53);
    v23 = *(_QWORD *)(v42 + 8 * v22);
    v24 = v12 + 1;
    if (!v23)
    {
      v24 = v12 + 2;
      if (v12 + 2 >= v43)
        return sub_2303614B4(v40, v39, v41, v53);
      v23 = *(_QWORD *)(v42 + 8 * v24);
      if (!v23)
      {
        v24 = v12 + 3;
        if (v12 + 3 >= v43)
          return sub_2303614B4(v40, v39, v41, v53);
        v23 = *(_QWORD *)(v42 + 8 * v24);
        if (!v23)
          break;
      }
    }
LABEL_19:
    v16 = (v23 - 1) & v23;
    v54 = v24;
    v21 = __clz(__rbit64(v23)) + (v24 << 6);
LABEL_20:
    v26 = (uint64_t *)(v53[6] + 16 * v21);
    v27 = *v26;
    v28 = v26[1];
    sub_2303630B0(v53[7] + *(_QWORD *)(v46 + 72) * v21, v17);
    v29 = v49;
    v30 = (uint64_t)v18 + *(int *)(v49 + 48);
    *v18 = v27;
    v18[1] = v28;
    sub_2303630B0(v17, v30);
    v31 = *(int *)(v29 + 48);
    v32 = v48;
    v33 = (uint64_t)v48 + v31;
    *v48 = v27;
    v32[1] = v28;
    sub_2303630B0(v30, (uint64_t)v32 + v31);
    v34 = v50;
    v35 = v52;
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v50, v33 + *(int *)(v47 + 20), v52);
    swift_bridgeObjectRetain_n();
    sub_2303630F4(v33);
    sub_23037A1F0();
    v37 = v36;
    (*(void (**)(char *, uint64_t))(v19 + 8))(v34, v35);
    sub_2302FD540((uint64_t)v18, &qword_255E5A078);
    sub_2303630F4(v17);
    result = swift_bridgeObjectRelease();
    v12 = v54;
    if (fabs(v37) < 172800.0)
    {
      *(unint64_t *)((char *)v40 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
      if (__OFADD__(v41++, 1))
      {
        __break(1u);
        return sub_2303614B4(v40, v39, v41, v53);
      }
    }
  }
  v25 = v12 + 4;
  if (v12 + 4 >= v43)
    return sub_2303614B4(v40, v39, v41, v53);
  v23 = *(_QWORD *)(v42 + 8 * v25);
  if (v23)
  {
    v24 = v12 + 4;
    goto LABEL_19;
  }
  while (1)
  {
    v24 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v24 >= v43)
      return sub_2303614B4(v40, v39, v41, v53);
    v23 = *(_QWORD *)(v42 + 8 * v24);
    ++v25;
    if (v23)
      goto LABEL_19;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_230361130(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, unint64_t, uint64_t);
  char *v33;
  char *v34;
  double v35;
  double v36;
  void (*v37)(char *, uint64_t);
  _QWORD *v38;
  char *v39;
  double v40;
  double v41;
  uint64_t v43;
  unint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  _QWORD *v53;
  uint64_t v54;
  unint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  int64_t v59;

  v43 = a2;
  v44 = a1;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B218);
  v4 = MEMORY[0x24BDAC7A8](v54);
  v53 = (uint64_t *)((char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v4);
  v52 = (char *)&v43 - v6;
  v7 = sub_23037A238();
  v50 = *(_QWORD *)(v7 - 8);
  v51 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v49 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v8);
  v48 = (char *)&v43 - v11;
  v12 = 0;
  v56 = (_QWORD *)a3;
  v13 = *(_QWORD *)(a3 + 64);
  v45 = 0;
  v46 = a3 + 64;
  v14 = 1 << *(_BYTE *)(a3 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & v13;
  v47 = (unint64_t)(v14 + 63) >> 6;
  v17 = v48;
  v18 = v51;
  v19 = v52;
  v20 = v54;
  while (1)
  {
    if (v16)
    {
      v58 = (v16 - 1) & v16;
      v59 = v12;
      v21 = __clz(__rbit64(v16)) | (v12 << 6);
      goto LABEL_20;
    }
    v22 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v22 >= v47)
      return sub_2303617F0(v44, v43, v45, v56);
    v23 = *(_QWORD *)(v46 + 8 * v22);
    v24 = v12 + 1;
    if (!v23)
    {
      v24 = v12 + 2;
      if (v12 + 2 >= v47)
        return sub_2303617F0(v44, v43, v45, v56);
      v23 = *(_QWORD *)(v46 + 8 * v24);
      if (!v23)
      {
        v24 = v12 + 3;
        if (v12 + 3 >= v47)
          return sub_2303617F0(v44, v43, v45, v56);
        v23 = *(_QWORD *)(v46 + 8 * v24);
        if (!v23)
          break;
      }
    }
LABEL_19:
    v58 = (v23 - 1) & v23;
    v59 = v24;
    v21 = __clz(__rbit64(v23)) + (v24 << 6);
LABEL_20:
    v26 = v56[7];
    v27 = (uint64_t *)(v56[6] + 16 * v21);
    v29 = v27[1];
    v57 = *v27;
    v28 = v57;
    v30 = v50;
    v31 = *(_QWORD *)(v50 + 72);
    v55 = v21;
    v32 = *(void (**)(char *, unint64_t, uint64_t))(v50 + 16);
    v32(v17, v26 + v31 * v21, v18);
    v33 = (char *)v19 + *(int *)(v20 + 48);
    *v19 = v28;
    v19[1] = v29;
    v32(v33, (unint64_t)v17, v18);
    swift_bridgeObjectRetain_n();
    v34 = v49;
    sub_23037A22C();
    sub_23037A1FC();
    v36 = v35;
    v37 = *(void (**)(char *, uint64_t))(v30 + 8);
    v37(v34, v18);
    v38 = v53;
    v39 = (char *)v53 + *(int *)(v20 + 48);
    *v53 = v57;
    v38[1] = v29;
    v32(v39, (unint64_t)v33, v18);
    sub_23037A1FC();
    v41 = v40;
    sub_2302FD540((uint64_t)v19, &qword_25405B218);
    v37(v39, v18);
    v37(v17, v18);
    result = swift_bridgeObjectRelease();
    v16 = v58;
    v12 = v59;
    if (v36 - v41 < 259200.0)
    {
      *(unint64_t *)((char *)v44 + ((v55 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v55;
      if (__OFADD__(v45++, 1))
      {
        __break(1u);
        return sub_2303617F0(v44, v43, v45, v56);
      }
    }
  }
  v25 = v12 + 4;
  if (v12 + 4 >= v47)
    return sub_2303617F0(v44, v43, v45, v56);
  v23 = *(_QWORD *)(v46 + 8 * v25);
  if (v23)
  {
    v24 = v12 + 4;
    goto LABEL_19;
  }
  while (1)
  {
    v24 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v24 >= v47)
      return sub_2303617F0(v44, v43, v45, v56);
    v23 = *(_QWORD *)(v46 + 8 * v24);
    ++v25;
    if (v23)
      goto LABEL_19;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_2303614B4(unint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v40;
  uint64_t v41;
  unint64_t *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;

  v42 = a1;
  v7 = type metadata accessor for DatedSubscribers(0);
  v45 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  MEMORY[0x24BDAC7A8](v8);
  v44 = (char *)&v40 - v10;
  if (!a3)
    return MEMORY[0x24BEE4B00];
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  v43 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A080);
  result = sub_23037ACB8();
  v12 = result;
  v41 = a2;
  if (a2 < 1)
    v13 = 0;
  else
    v13 = *v42;
  v14 = 0;
  v15 = result + 64;
  v16 = v43;
  v17 = (uint64_t)v44;
  while (1)
  {
    if (v13)
    {
      v18 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v46 = v14;
      v19 = v18 | (v14 << 6);
    }
    else
    {
      v20 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_40;
      if (v20 >= v41)
        return v12;
      v21 = v42[v20];
      v22 = v14 + 1;
      if (!v21)
      {
        v22 = v14 + 2;
        if (v14 + 2 >= v41)
          return v12;
        v21 = v42[v22];
        if (!v21)
        {
          v22 = v14 + 3;
          if (v14 + 3 >= v41)
            return v12;
          v21 = v42[v22];
          if (!v21)
          {
            v23 = v14 + 4;
            if (v14 + 4 >= v41)
              return v12;
            v21 = v42[v23];
            if (!v21)
            {
              while (1)
              {
                v22 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v22 >= v41)
                  return v12;
                v21 = v42[v22];
                ++v23;
                if (v21)
                  goto LABEL_24;
              }
            }
            v22 = v14 + 4;
          }
        }
      }
LABEL_24:
      v13 = (v21 - 1) & v21;
      v46 = v22;
      v19 = __clz(__rbit64(v21)) + (v22 << 6);
    }
    v24 = a4[7];
    v25 = a4;
    v26 = (uint64_t *)(a4[6] + 16 * v19);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_QWORD *)(v45 + 72);
    sub_2303630B0(v24 + v29 * v19, v17);
    sub_230362470(v17, v16);
    sub_23037AF7C();
    swift_bridgeObjectRetain();
    sub_23037A64C();
    result = sub_23037AFA0();
    v30 = -1 << *(_BYTE *)(v12 + 32);
    v31 = result & ~v30;
    v32 = v31 >> 6;
    if (((-1 << v31) & ~*(_QWORD *)(v15 + 8 * (v31 >> 6))) == 0)
      break;
    v33 = __clz(__rbit64((-1 << v31) & ~*(_QWORD *)(v15 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    v16 = v43;
LABEL_34:
    *(_QWORD *)(v15 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
    v38 = (_QWORD *)(*(_QWORD *)(v12 + 48) + 16 * v33);
    *v38 = v28;
    v38[1] = v27;
    result = sub_230362470(v16, *(_QWORD *)(v12 + 56) + v33 * v29);
    ++*(_QWORD *)(v12 + 16);
    if (__OFSUB__(a3--, 1))
      goto LABEL_39;
    a4 = v25;
    v14 = v46;
    if (!a3)
      return v12;
  }
  v34 = 0;
  v35 = (unint64_t)(63 - v30) >> 6;
  v16 = v43;
  while (++v32 != v35 || (v34 & 1) == 0)
  {
    v36 = v32 == v35;
    if (v32 == v35)
      v32 = 0;
    v34 |= v36;
    v37 = *(_QWORD *)(v15 + 8 * v32);
    if (v37 != -1)
    {
      v33 = __clz(__rbit64(~v37)) + (v32 << 6);
      goto LABEL_34;
    }
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2303617F0(unint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v43;
  unint64_t *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;

  v8 = sub_23037A238();
  v49 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v51 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v48 = (char *)&v43 - v12;
  if (!a3)
    return MEMORY[0x24BEE4B00];
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  v47 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E58D10);
  result = sub_23037ACB8();
  v14 = result;
  v44 = a1;
  v45 = a2;
  if (a2 < 1)
    v15 = 0;
  else
    v15 = *a1;
  v16 = 0;
  v17 = result + 64;
  v18 = v47;
  v19 = v48;
  v46 = a4;
  while (1)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v50 = v16;
      v21 = v20 | (v16 << 6);
    }
    else
    {
      v22 = v16 + 1;
      if (__OFADD__(v16, 1))
        goto LABEL_40;
      if (v22 >= v45)
        return v14;
      v23 = v44[v22];
      v24 = v16 + 1;
      if (!v23)
      {
        v24 = v16 + 2;
        if (v16 + 2 >= v45)
          return v14;
        v23 = v44[v24];
        if (!v23)
        {
          v24 = v16 + 3;
          if (v16 + 3 >= v45)
            return v14;
          v23 = v44[v24];
          if (!v23)
          {
            v25 = v16 + 4;
            if (v16 + 4 >= v45)
              return v14;
            v23 = v44[v25];
            if (!v23)
            {
              while (1)
              {
                v24 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_41;
                if (v24 >= v45)
                  return v14;
                v23 = v44[v24];
                ++v25;
                if (v23)
                  goto LABEL_24;
              }
            }
            v24 = v16 + 4;
          }
        }
      }
LABEL_24:
      v15 = (v23 - 1) & v23;
      v50 = v24;
      v21 = __clz(__rbit64(v23)) + (v24 << 6);
    }
    v26 = a4[7];
    v27 = (uint64_t *)(a4[6] + 16 * v21);
    v28 = *v27;
    v29 = v27[1];
    v30 = v49;
    v31 = *(_QWORD *)(v49 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v49 + 16))(v19, v26 + v31 * v21, v18);
    v32 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
    v32(v51, v19, v18);
    sub_23037AF7C();
    swift_bridgeObjectRetain();
    sub_23037A64C();
    result = sub_23037AFA0();
    v33 = -1 << *(_BYTE *)(v14 + 32);
    v34 = result & ~v33;
    v35 = v34 >> 6;
    if (((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6))) == 0)
      break;
    v36 = __clz(__rbit64((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    v18 = v47;
LABEL_34:
    *(_QWORD *)(v17 + ((v36 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v36;
    v41 = (_QWORD *)(*(_QWORD *)(v14 + 48) + 16 * v36);
    *v41 = v28;
    v41[1] = v29;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v32)(*(_QWORD *)(v14 + 56) + v36 * v31, v51, v18);
    ++*(_QWORD *)(v14 + 16);
    if (__OFSUB__(a3--, 1))
      goto LABEL_39;
    a4 = v46;
    v16 = v50;
    if (!a3)
      return v14;
  }
  v37 = 0;
  v38 = (unint64_t)(63 - v33) >> 6;
  v18 = v47;
  while (++v35 != v38 || (v37 & 1) == 0)
  {
    v39 = v35 == v38;
    if (v35 == v38)
      v35 = 0;
    v37 |= v39;
    v40 = *(_QWORD *)(v17 + 8 * v35);
    if (v40 != -1)
    {
      v36 = __clz(__rbit64(~v40)) + (v35 << 6);
      goto LABEL_34;
    }
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_230361B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = sub_23037A238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a4, v7);
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_230361B90@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v4 = (uint64_t)a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25405B218) + 48);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B238);
  result = sub_230361B30((uint64_t)a2 + *(int *)(v5 + 48), *a1, a1[1], v4);
  *a2 = result;
  a2[1] = v7;
  return result;
}

uint64_t sub_230361BF0(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  char v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t isStackAllocationSafe;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v7 = (unint64_t)((1 << v5) + 63) >> 6;
  isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    v9 = (_QWORD *)((char *)v13 - ((8 * v7 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_2303189BC(0, v7, v9);
    swift_bridgeObjectRetain();
    v10 = sub_230361DBC((uint64_t)v9, v7, a1, a2);
    swift_release();
    if (v2)
      swift_willThrow();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v11 = (_QWORD *)swift_slowAlloc();
    sub_2303189BC(0, v7, v11);
    swift_bridgeObjectRetain();
    v10 = sub_230361DBC((uint64_t)v11, v7, a1, a2);
    swift_release();
    MEMORY[0x2348B7D1C](v11, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_230361DBC(uint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v24;
  unint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;

  v4 = 0;
  v28 = 0;
  v29 = a3 + 56;
  v5 = 1 << *(_BYTE *)(a3 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a3 + 56);
  v30 = (unint64_t)(v5 + 63) >> 6;
  v26 = (unint64_t *)result;
  v27 = a4 + 7;
  while (1)
  {
    while (1)
    {
LABEL_4:
      if (v7)
      {
        v8 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v9 = v8 | (v4 << 6);
      }
      else
      {
        v10 = v4 + 1;
        if (__OFADD__(v4, 1))
          goto LABEL_40;
        if (v10 >= v30)
          goto LABEL_38;
        v11 = *(_QWORD *)(v29 + 8 * v10);
        ++v4;
        if (!v11)
        {
          v4 = v10 + 1;
          if (v10 + 1 >= v30)
            goto LABEL_38;
          v11 = *(_QWORD *)(v29 + 8 * v4);
          if (!v11)
          {
            v4 = v10 + 2;
            if (v10 + 2 >= v30)
              goto LABEL_38;
            v11 = *(_QWORD *)(v29 + 8 * v4);
            if (!v11)
            {
              v12 = v10 + 3;
              if (v12 >= v30)
                goto LABEL_38;
              v11 = *(_QWORD *)(v29 + 8 * v12);
              if (!v11)
              {
                while (1)
                {
                  v4 = v12 + 1;
                  if (__OFADD__(v12, 1))
                    goto LABEL_41;
                  if (v4 >= v30)
                    goto LABEL_38;
                  v11 = *(_QWORD *)(v29 + 8 * v4);
                  ++v12;
                  if (v11)
                    goto LABEL_19;
                }
              }
              v4 = v12;
            }
          }
        }
LABEL_19:
        v7 = (v11 - 1) & v11;
        v9 = __clz(__rbit64(v11)) + (v4 << 6);
      }
      v13 = a4[2];
      if (v13)
        break;
LABEL_35:
      *(unint64_t *)((char *)v26 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
      if (__OFADD__(v28++, 1))
      {
        __break(1u);
LABEL_38:
        swift_retain();
        v24 = sub_23035FEC8(v26, a2, v28, a3);
        swift_bridgeObjectRelease();
        return v24;
      }
    }
    v14 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v9);
    v15 = *v14;
    v16 = v14[1];
    result = a4[4];
    if (result != *v14 || a4[5] != v16)
    {
      result = sub_23037AE8C();
      if ((result & 1) == 0)
        break;
    }
  }
  if (v13 == 1)
    goto LABEL_35;
  v18 = v27;
  v19 = 1;
  while (1)
  {
    v20 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    result = *(v18 - 1);
    v21 = *v18;
    v18 += 2;
    if (result == v15 && v21 == v16)
      goto LABEL_4;
    result = sub_23037AE8C();
    if ((result & 1) != 0)
      goto LABEL_4;
    ++v19;
    if (v20 == v13)
      goto LABEL_35;
  }
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

id sub_23036201C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v9;
  id v10;

  type metadata accessor for URLResourceKey(0);
  v9 = (void *)sub_23037A73C();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(a5, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, a1, v9, a3, a4);

  return v10;
}

uint64_t sub_2303620AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = (_QWORD *)(a4 + OBJC_IVAR____TtC9SportsKit15PersistentStore_dataWriter);
  v8[3] = type metadata accessor for PersistentStoreWriter();
  v8[4] = &off_24FE0F0C0;
  *v8 = a3;
  v9 = (_QWORD *)(a4 + OBJC_IVAR____TtC9SportsKit15PersistentStore_sessionsDirectoryPath);
  *v9 = 0x736E6F6973736573;
  v9[1] = 0xE800000000000000;
  v10 = a4 + OBJC_IVAR____TtC9SportsKit15PersistentStore____lazy_storage___activityDataURL;
  v11 = sub_23037A118();
  __swift_storeEnumTagSinglePayload(v10, 1, 1, v11);
  __swift_storeEnumTagSinglePayload(a4 + OBJC_IVAR____TtC9SportsKit15PersistentStore____lazy_storage___scoreboardsDataURL, 1, 1, v11);
  __swift_storeEnumTagSinglePayload(a4 + OBJC_IVAR____TtC9SportsKit15PersistentStore____lazy_storage___cloudChannelSubscriptionURL, 1, 1, v11);
  __swift_storeEnumTagSinglePayload(a4 + OBJC_IVAR____TtC9SportsKit15PersistentStore____lazy_storage___autostartSuppressionsURL, 1, 1, v11);
  *(_QWORD *)(a4 + OBJC_IVAR____TtC9SportsKit15PersistentStore____lazy_storage___encoder) = 0;
  *(_QWORD *)(a4 + OBJC_IVAR____TtC9SportsKit15PersistentStore____lazy_storage___decoder) = 0;
  *(_QWORD *)(a4 + 16) = a1;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a4 + OBJC_IVAR____TtC9SportsKit15PersistentStore_storeURL, a2, v11);
  return a4;
}

unint64_t sub_2303621EC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255E59F60;
  if (!qword_255E59F60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E59F58);
    sub_2302ED798(&qword_255E59F68, type metadata accessor for DatedSubscribers, (uint64_t)&protocol conformance descriptor for DatedSubscribers);
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x2348B7C44](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255E59F60);
  }
  return result;
}

uint64_t type metadata accessor for DatedSubscribers(uint64_t a1)
{
  return sub_2302EFB2C(a1, qword_255E5A020);
}

unint64_t sub_230362284()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255E59F70;
  if (!qword_255E59F70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E59F58);
    sub_2302ED798(&qword_255E59F78, type metadata accessor for DatedSubscribers, (uint64_t)&protocol conformance descriptor for DatedSubscribers);
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x2348B7C44](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255E59F70);
  }
  return result;
}

unint64_t sub_230362308()
{
  unint64_t result;

  result = qword_255E59F88;
  if (!qword_255E59F88)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for PersistentStoreError, &type metadata for PersistentStoreError);
    atomic_store(result, (unint64_t *)&qword_255E59F88);
  }
  return result;
}

unint64_t sub_230362344()
{
  unint64_t result;

  result = qword_25405AE78;
  if (!qword_25405AE78)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for PersistentActivities, &type metadata for PersistentActivities);
    atomic_store(result, (unint64_t *)&qword_25405AE78);
  }
  return result;
}

unint64_t sub_230362380()
{
  unint64_t result;

  result = qword_25405B500;
  if (!qword_25405B500)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for PersistentActivities, &type metadata for PersistentActivities);
    atomic_store(result, (unint64_t *)&qword_25405B500);
  }
  return result;
}

unint64_t sub_2303623BC()
{
  unint64_t result;

  result = qword_255E59F98;
  if (!qword_255E59F98)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportsActivityAutostartSuppressions, &type metadata for SportsActivityAutostartSuppressions);
    atomic_store(result, (unint64_t *)&qword_255E59F98);
  }
  return result;
}

unint64_t sub_2303623F8()
{
  unint64_t result;

  result = qword_255E59FA0;
  if (!qword_255E59FA0)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportsActivityAutostartSuppressions, &type metadata for SportsActivityAutostartSuppressions);
    atomic_store(result, (unint64_t *)&qword_255E59FA0);
  }
  return result;
}

unint64_t sub_230362434()
{
  unint64_t result;

  result = qword_255E59FB0;
  if (!qword_255E59FB0)
  {
    result = MEMORY[0x2348B7C44](&unk_230387DB4, &type metadata for DatedSubscribers.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E59FB0);
  }
  return result;
}

uint64_t sub_230362470(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DatedSubscribers(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_2303624B4()
{
  sub_2302ED798(&qword_255E59FC0, type metadata accessor for DatedSubscribers, (uint64_t)&protocol conformance descriptor for DatedSubscribers);
}

uint64_t sub_2303624E0()
{
  return type metadata accessor for PersistentStore(0);
}

void sub_2303624E8()
{
  unint64_t v0;
  unint64_t v1;

  sub_23037A118();
  if (v0 <= 0x3F)
  {
    sub_230362810();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for PersistentStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PersistentStore.filePath.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of PersistentStore.allEventSubscriptionsToConsumers(isConventionalOrUnified:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of PersistentStore.initializeStoreIfNeeded()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of PersistentStore.retrieveSuppressionTally()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of PersistentStore.persistSuppressionTally(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of PersistentStore.cleanUpFileSystem(olderThan:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of PersistentStore.writeEventSubscription(_:isConventionalOrUnified:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of PersistentStore.deleteSportingEventSubscription(canonicalId:isConventionalOrUnified:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of PersistentStore.writeAPSMessage(_:canonicalId:isConventionalOrUnified:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of PersistentStore.writeRegistrationResponse(_:canonicalId:isConventionalOrUnified:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of PersistentStore.createFile(_:isConventionalOrUnified:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of PersistentStore.fileExists(_:isConventionalOrUnified:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of PersistentStore.directoryContents(isConventionalOrUnified:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of PersistentStore.subscriptionsStoreURL(isConventionalOrUnified:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of PersistentStore.replaceActivities(activeIds:dismissedIds:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of PersistentStore.writeActivity(activityId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

uint64_t dispatch thunk of PersistentStore.removeActivity(activityId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t dispatch thunk of PersistentStore.readActivities()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 448))();
}

uint64_t dispatch thunk of PersistentStore.pathForLogo(_:fileExtension:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 464))();
}

uint64_t dispatch thunk of PersistentStore.pathForLogo(_:size:fileExtension:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 472))();
}

uint64_t dispatch thunk of PersistentStore.readCloudChannelSubscription()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 480))();
}

uint64_t dispatch thunk of PersistentStore.writeCloudChannelSubscription(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 488))();
}

uint64_t dispatch thunk of PersistentStore.readScoreboardSubscription()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 496))();
}

uint64_t dispatch thunk of PersistentStore.writeScoreboardSubscription(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 504))();
}

uint64_t dispatch thunk of PersistentStore.deleteScoreboardSubscription()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 512))();
}

uint64_t dispatch thunk of PersistentStore.readAutostartLiveActivitySuppressions()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 536))();
}

uint64_t dispatch thunk of PersistentStore.setAutostartLiveActivityStatus(_:forId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 544))();
}

uint64_t dispatch thunk of PersistentStore.retrieveEventSubscription(canonicalId:isConventionalOrUnified:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 552))();
}

void sub_230362810()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25405B538)
  {
    sub_23037A118();
    v0 = sub_23037AA24();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25405B538);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for DatedSubscribers(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_23037A238();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t destroy for DatedSubscribers(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_23037A238();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_QWORD *initializeWithCopy for DatedSubscribers(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_23037A238();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithCopy for DatedSubscribers(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_23037A238();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_QWORD *initializeWithTake for DatedSubscribers(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_23037A238();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithTake for DatedSubscribers(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_23037A238();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for DatedSubscribers()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_230362AA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 20);
  v5 = OUTLINED_FUNCTION_43_0();
  return __swift_getEnumTagSinglePayload(v4, a2, v5);
}

uint64_t storeEnumTagSinglePayload for DatedSubscribers()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_230362AE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 20);
  v6 = OUTLINED_FUNCTION_43_0();
  return __swift_storeEnumTagSinglePayload(v5, a2, a2, v6);
}

uint64_t sub_230362B18()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23037A238();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DatedSubscribers.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_230362BDC + 4 * byte_230387B75[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_230362C10 + 4 * byte_230387B70[v4]))();
}

uint64_t sub_230362C10(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_230362C18(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x230362C20);
  return result;
}

uint64_t sub_230362C2C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x230362C34);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_230362C38(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230362C40(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DatedSubscribers.CodingKeys()
{
  return &type metadata for DatedSubscribers.CodingKeys;
}

unint64_t sub_230362C60()
{
  unint64_t result;

  result = qword_255E5A058;
  if (!qword_255E5A058)
  {
    result = MEMORY[0x2348B7C44](&unk_230387D8C, &type metadata for DatedSubscribers.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E5A058);
  }
  return result;
}

unint64_t sub_230362CA0()
{
  unint64_t result;

  result = qword_255E5A060;
  if (!qword_255E5A060)
  {
    result = MEMORY[0x2348B7C44](&unk_230387CFC, &type metadata for DatedSubscribers.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E5A060);
  }
  return result;
}

unint64_t sub_230362CE0()
{
  unint64_t result;

  result = qword_255E5A068;
  if (!qword_255E5A068)
  {
    result = MEMORY[0x2348B7C44](&unk_230387D24, &type metadata for DatedSubscribers.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E5A068);
  }
  return result;
}

uint64_t sub_230362D1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B530);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_230362D64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = -1 << *(_BYTE *)(a1 + 32);
  *a4 = a1;
  v7 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64)
    v8 = ~(-1 << -(char)v4);
  else
    v8 = -1;
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

uint64_t sub_230362DA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  int64_t v31;
  int64_t v32;
  void (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  int64_t v44;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B218);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B220);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v39 - v10;
  v12 = *v1;
  v13 = v1[1];
  v15 = v1[2];
  v14 = v1[3];
  v16 = v14;
  v17 = v1[4];
  v40 = v5;
  if (v17)
  {
    v43 = v9;
    v44 = v14;
    v41 = v15;
    v42 = v13;
    v18 = a1;
    v19 = (v17 - 1) & v17;
    v20 = __clz(__rbit64(v17)) | (v14 << 6);
LABEL_3:
    v21 = *(_QWORD *)(v12 + 56);
    v22 = (uint64_t *)(*(_QWORD *)(v12 + 48) + 16 * v20);
    v23 = v12;
    v24 = *v22;
    v25 = v22[1];
    v26 = sub_23037A238();
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(&v11[*(int *)(v3 + 48)], v21 + *(_QWORD *)(*(_QWORD *)(v26 - 8) + 72) * v20, v26);
    *(_QWORD *)v11 = v24;
    *((_QWORD *)v11 + 1) = v25;
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v3);
    v12 = v23;
    swift_bridgeObjectRetain();
    a1 = v18;
    v13 = v42;
    v9 = v43;
    v15 = v41;
    goto LABEL_25;
  }
  v27 = v14 + 1;
  if (__OFADD__(v14, 1))
  {
    __break(1u);
LABEL_23:
    v16 = v10;
    goto LABEL_24;
  }
  v28 = (unint64_t)(v15 + 64) >> 6;
  if (v27 < v28)
  {
    v29 = *(_QWORD *)(v13 + 8 * v27);
    if (v29)
    {
LABEL_7:
      v41 = v15;
      v42 = v13;
      v43 = v9;
      v44 = v27;
      v18 = a1;
      v19 = (v29 - 1) & v29;
      v20 = __clz(__rbit64(v29)) + (v27 << 6);
      goto LABEL_3;
    }
    v30 = v14 + 2;
    v16 = v14 + 1;
    if (v14 + 2 < v28)
    {
      v29 = *(_QWORD *)(v13 + 8 * v30);
      if (v29)
      {
LABEL_10:
        v27 = v30;
        goto LABEL_7;
      }
      v16 = v14 + 2;
      if (v14 + 3 < v28)
      {
        v29 = *(_QWORD *)(v13 + 8 * (v14 + 3));
        if (v29)
        {
          v27 = v14 + 3;
          goto LABEL_7;
        }
        v30 = v14 + 4;
        v16 = v14 + 3;
        if (v14 + 4 < v28)
        {
          v29 = *(_QWORD *)(v13 + 8 * v30);
          if (v29)
            goto LABEL_10;
          v27 = v14 + 5;
          v16 = v14 + 4;
          if (v14 + 5 < v28)
          {
            v29 = *(_QWORD *)(v13 + 8 * v27);
            if (v29)
              goto LABEL_7;
            v10 = v28 - 1;
            v31 = v14 + 6;
            while (v31 < v28)
            {
              v29 = *(_QWORD *)(v13 + 8 * v31++);
              if (v29)
              {
                v27 = v31 - 1;
                goto LABEL_7;
              }
            }
            goto LABEL_23;
          }
        }
      }
    }
  }
LABEL_24:
  v44 = v16;
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v3);
  v19 = 0;
LABEL_25:
  *v1 = v12;
  v1[1] = v13;
  v32 = v44;
  v1[2] = v15;
  v1[3] = v32;
  v1[4] = v19;
  v33 = (void (*)(uint64_t))v1[5];
  sub_230363160((uint64_t)v11, (uint64_t)v9, &qword_25405B220);
  v34 = 1;
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v3) != 1)
  {
    v35 = (uint64_t)v9;
    v36 = (uint64_t)v40;
    sub_230363160(v35, (uint64_t)v40, &qword_25405B218);
    v33(v36);
    sub_2302FD540(v36, &qword_25405B218);
    v34 = 0;
  }
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B238);
  return __swift_storeEnumTagSinglePayload(a1, v34, 1, v37);
}

uint64_t sub_2303630B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DatedSubscribers(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2303630F4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DatedSubscribers(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_230363130(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_103(a1, a2, a3);
  OUTLINED_FUNCTION_151_1(v3, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
  OUTLINED_FUNCTION_3();
}

void sub_230363160(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_103(a1, a2, a3);
  OUTLINED_FUNCTION_151_1(v3, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32));
  OUTLINED_FUNCTION_3();
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

uint64_t OUTLINED_FUNCTION_21_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_25_13()
{
  return sub_23037A0C4();
}

uint64_t OUTLINED_FUNCTION_28_12(uint64_t a1, _BYTE *a2)
{
  *a2 = 0;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_29_7()
{
  return sub_23037A670();
}

uint64_t OUTLINED_FUNCTION_30_6()
{
  uint64_t v0;

  return v0 + 56;
}

uint64_t OUTLINED_FUNCTION_41_9()
{
  return 0x7373657270707553;
}

uint64_t OUTLINED_FUNCTION_44_7()
{
  return swift_bridgeObjectRelease_n();
}

id OUTLINED_FUNCTION_48_3(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  return objc_msgSend(v3, a2, v2, 1, 0, v4 - 104);
}

uint64_t OUTLINED_FUNCTION_51_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_58_5(uint64_t a1)
{
  unint64_t v1;

  return sub_2302E340C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_59_6()
{
  return sub_23037A670();
}

uint64_t OUTLINED_FUNCTION_62_6()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_66_3()
{
  uint64_t (*v0)(uint64_t, uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return v0(v3, v2, v1);
}

void OUTLINED_FUNCTION_67_6()
{
  sub_2303594BC();
}

uint64_t OUTLINED_FUNCTION_71_4()
{
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_78_3()
{
  return sub_230379F08();
}

uint64_t OUTLINED_FUNCTION_79_2()
{
  return sub_230379EFC();
}

void OUTLINED_FUNCTION_80_3(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;

  sub_2302FD540(v2 + a1, v1);
}

uint64_t OUTLINED_FUNCTION_83_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

void OUTLINED_FUNCTION_85_3(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_87_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 - 120))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_88_3@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_91_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_92_3()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_96_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 64) |= v1;
}

void OUTLINED_FUNCTION_97_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_98_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_99_3@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_100_2()
{
  uint64_t v0;

  return v0;
}

BOOL OUTLINED_FUNCTION_101_3(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_102_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

BOOL OUTLINED_FUNCTION_104_2(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_108_1()
{
  uint64_t v0;
  _QWORD *v1;

  return sub_2303189BC(0, v0, v1);
}

uint64_t OUTLINED_FUNCTION_110_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v0 + v2) = v1;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_112_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 104))(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_113_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_114_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_23036514C(v1, v0, (uint64_t *)(v2 - 104));
}

uint64_t OUTLINED_FUNCTION_116_2()
{
  return sub_23037AE8C();
}

uint64_t OUTLINED_FUNCTION_117_2()
{
  return sub_23037AE8C();
}

uint64_t OUTLINED_FUNCTION_118_2()
{
  return sub_23037AAE4();
}

uint64_t OUTLINED_FUNCTION_119_2()
{
  return sub_230379E9C();
}

uint64_t OUTLINED_FUNCTION_120_2()
{
  return swift_bridgeObjectRetain_n();
}

_QWORD *OUTLINED_FUNCTION_123_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + a1), *(_QWORD *)(v1 + a1 + 24));
}

unint64_t OUTLINED_FUNCTION_124_0()
{
  return sub_230317298();
}

uint64_t OUTLINED_FUNCTION_125_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_126_2()
{
  return sub_230379E84();
}

void *OUTLINED_FUNCTION_128_2@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  const void *v2;

  return memmove(a1, v2, 8 * a2);
}

void OUTLINED_FUNCTION_129_2()
{
  void *v0;

}

_QWORD *OUTLINED_FUNCTION_130_1(_QWORD *a1)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

uint64_t OUTLINED_FUNCTION_131_2()
{
  unint64_t v0;
  uint64_t v1;

  return sub_2302E340C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_132_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_134_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_135_1()
{
  return sub_23037A0F4();
}

uint64_t OUTLINED_FUNCTION_136_1()
{
  return sub_23037A0D0();
}

uint64_t OUTLINED_FUNCTION_137_2()
{
  unint64_t v0;
  uint64_t v1;

  return sub_2302E340C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_139_1@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

unint64_t OUTLINED_FUNCTION_141_2()
{
  return sub_230317298();
}

uint64_t OUTLINED_FUNCTION_144_1()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t OUTLINED_FUNCTION_146_1()
{
  return sub_23037A904();
}

uint64_t OUTLINED_FUNCTION_147_2()
{
  return sub_230379EF0();
}

_QWORD *OUTLINED_FUNCTION_148_2(_QWORD *a1)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

uint64_t OUTLINED_FUNCTION_150_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 72) = a1;
  return v1 - 72;
}

uint64_t OUTLINED_FUNCTION_151_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

unint64_t OUTLINED_FUNCTION_152_2()
{
  return sub_230317298();
}

uint64_t OUTLINED_FUNCTION_153_2()
{
  uint64_t v0;

  return sub_230362DA0(v0);
}

uint64_t OUTLINED_FUNCTION_154_1()
{
  uint64_t v0;

  return v0;
}

_QWORD *OUTLINED_FUNCTION_157_1(_QWORD *a1)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

uint64_t OUTLINED_FUNCTION_158_1()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_162_1(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  return sub_23036514C(v4, v3, a3);
}

uint64_t OUTLINED_FUNCTION_165_1()
{
  return sub_23037A0F4();
}

uint64_t OUTLINED_FUNCTION_166_2()
{
  return sub_230379EA8();
}

uint64_t OUTLINED_FUNCTION_169_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 184) = a1;
  return v1 - 184;
}

uint64_t OUTLINED_FUNCTION_170()
{
  return 1920103779;
}

uint64_t OUTLINED_FUNCTION_171_1()
{
  return type metadata accessor for CloudChannelSubscription();
}

uint64_t OUTLINED_FUNCTION_172_1()
{
  return sub_23037A268();
}

void Dictionary<>.subscript.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];

  OUTLINED_FUNCTION_9_0();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = sub_23037AA24();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v26 - v11;
  v13 = OUTLINED_FUNCTION_8_12();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_36_7();
  v15 = v6[1];
  v27 = *v6;
  v28 = v15;
  *(_QWORD *)&v30 = v27;
  *((_QWORD *)&v30 + 1) = v15;
  type metadata accessor for SportsJSONContext.Property(0, v2, v16, v17);
  OUTLINED_FUNCTION_25_14();
  v18 = sub_2303639C4(v4, &v30);
  (*(void (**)(uint64_t, uint64_t, double))(v14 + 8))(v0, v13, v18);
  if (!v31)
  {
    sub_2302DF610((uint64_t)&v30, &qword_25405BC80);
LABEL_10:
    v19 = v8;
    v20 = 1;
    goto LABEL_11;
  }
  sub_2302E18B0(&v30, v32);
  sub_2302E18C0((uint64_t)v32, (uint64_t)&v30);
  if (!swift_dynamicCast())
  {
    OUTLINED_FUNCTION_9_10((uint64_t)v12, 1);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    if (qword_255E576F0 != -1)
      swift_once();
    v21 = OUTLINED_FUNCTION_24_0();
    v22 = __swift_project_value_buffer(v21, (uint64_t)qword_255E6F960);
    v23 = v28;
    swift_bridgeObjectRetain_n();
    sub_23037A268();
    v24 = OUTLINED_FUNCTION_31_8();
    if (os_log_type_enabled(v22, v24))
    {
      v25 = (uint8_t *)OUTLINED_FUNCTION_5_2();
      *(_QWORD *)&v30 = OUTLINED_FUNCTION_5_2();
      *(_DWORD *)v25 = 136315138;
      swift_bridgeObjectRetain();
      v29 = sub_23036514C(v27, v23, (uint64_t *)&v30);
      OUTLINED_FUNCTION_35_5();
      OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_41_3(&dword_2302D3000, v22, v24, "Value found for property %s is not of the same type. Returning nil.", v25);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_28_0();
    }
    OUTLINED_FUNCTION_56();

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_9_10((uint64_t)v12, 0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v2 - 8) + 32))(v8, v12, v2);
  v19 = v8;
  v20 = 0;
LABEL_11:
  OUTLINED_FUNCTION_9_10(v19, v20);
  OUTLINED_FUNCTION_0_2();
}

double sub_2303639C4@<D0>(uint64_t a1@<X1>, _OWORD *a2@<X8>)
{
  unint64_t v4;
  char v5;
  double result;

  if (*(_QWORD *)(a1 + 16) && (v4 = sub_230317304(), (v5 & 1) != 0))
  {
    sub_2302E18C0(*(_QWORD *)(a1 + 56) + 32 * v4, (uint64_t)a2);
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_230363A14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_230317298();
    if ((v3 & 1) != 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
    }
  }
  return OUTLINED_FUNCTION_20_1();
}

SportsKit::SportsJSONContext __swiftcall SportsJSONContext.init()()
{
  SportsKit::SportsJSONContext *v0;
  SportsKit::SportsJSONContext *v1;
  SportsKit::SportsJSONContext result;

  v1 = v0;
  result.storage._rawValue = (void *)sub_23037A520();
  v1->storage._rawValue = result.storage._rawValue;
  return result;
}

SportsKit::SportsJSONContext __swiftcall SportsJSONContext.init(userInfo:)(Swift::OpaquePointer userInfo)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  char v39;
  unint64_t v40;
  char v41;
  _QWORD *v42;
  _OWORD *v43;
  uint64_t *v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  SportsKit::SportsJSONContext result;
  int64_t v49;
  uint64_t *v50;
  uint64_t v51;
  int64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  int64_t v56;
  unint64_t v57;
  _QWORD *v58;
  _OWORD v59[2];
  _OWORD v60[2];
  uint64_t v61;

  OUTLINED_FUNCTION_9_0();
  v2 = v1;
  v50 = v3;
  v4 = OUTLINED_FUNCTION_8_12();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_0();
  v8 = v7 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A088);
  OUTLINED_FUNCTION_18_1();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v49 - v13;
  v61 = sub_23037A520();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A090);
  OUTLINED_FUNCTION_17_12();
  v55 = v12;
  v56 = 0;
  v53 = v2;
  v54 = v14;
  OUTLINED_FUNCTION_15_8();
  v17 = v16 & v15;
  v51 = v2 + 64;
  v52 = (unint64_t)(v18 + 63) >> 6;
  v49 = v52 - 1;
  if ((v16 & v15) == 0)
    goto LABEL_4;
LABEL_2:
  v19 = __clz(__rbit64(v17));
  v20 = (v17 - 1) & v17;
  v21 = v19 | (v56 << 6);
LABEL_3:
  v22 = v53;
  OUTLINED_FUNCTION_10_11((uint64_t)v12, *(_QWORD *)(v53 + 48) + *(_QWORD *)(v5 + 72) * v21, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
  v23 = *(_QWORD *)(v22 + 56) + 32 * v21;
  v24 = OUTLINED_FUNCTION_24_11();
  sub_2302E18C0(v23, (uint64_t)&v12[*(int *)(v24 + 48)]);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v24);
  while (1)
  {
    sub_2303657CC((uint64_t)v12, (uint64_t)v14, &qword_255E5A088);
    v29 = OUTLINED_FUNCTION_24_11();
    if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v29) == 1)
    {
      swift_release();
      *v50 = v61;
      OUTLINED_FUNCTION_0_2();
      return result;
    }
    v57 = v20;
    v30 = &v14[*(int *)(v29 + 48)];
    v31 = v5;
    OUTLINED_FUNCTION_10_11(v8, (uint64_t)v14, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32));
    sub_2302E18B0(v30, v60);
    v32 = v8;
    v33 = sub_23037AC40();
    v35 = v34;
    sub_2302E18C0((uint64_t)v60, (uint64_t)v59);
    OUTLINED_FUNCTION_36_8();
    v58 = (_QWORD *)v8;
    v61 = 0x8000000000000000;
    v36 = OUTLINED_FUNCTION_33_8();
    if (__OFADD__(*(_QWORD *)(v8 + 16), (v37 & 1) == 0))
      break;
    v38 = v36;
    v39 = v37;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A0A0);
    if ((sub_23037AC58() & 1) != 0)
    {
      v40 = OUTLINED_FUNCTION_33_8();
      if ((v39 & 1) != (v41 & 1))
        goto LABEL_38;
      v38 = v40;
    }
    v42 = v58;
    if ((v39 & 1) != 0)
    {
      v43 = (_OWORD *)(v58[7] + 32 * v38);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
      sub_2302E18B0(v59, v43);
    }
    else
    {
      v58[(v38 >> 6) + 8] |= 1 << v38;
      v44 = (uint64_t *)(v42[6] + 16 * v38);
      *v44 = v33;
      v44[1] = v35;
      sub_2302E18B0(v59, (_OWORD *)(v42[7] + 32 * v38));
      v45 = v42[2];
      v46 = __OFADD__(v45, 1);
      v47 = v45 + 1;
      if (v46)
        goto LABEL_35;
      v42[2] = v47;
      OUTLINED_FUNCTION_39_2();
    }
    v61 = (uint64_t)v42;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_11();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
    v5 = v31;
    v8 = v32;
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v32, v4);
    v14 = v54;
    v12 = v55;
    v17 = v57;
    if (v57)
      goto LABEL_2;
LABEL_4:
    v25 = v56 + 1;
    if (__OFADD__(v56, 1))
      goto LABEL_36;
    if (v25 < v52)
    {
      v26 = *(_QWORD *)(v51 + 8 * v25);
      if (v26)
        goto LABEL_7;
      v27 = v56 + 2;
      ++v56;
      if (v25 + 1 < v52)
      {
        v26 = *(_QWORD *)(v51 + 8 * v27);
        if (v26)
          goto LABEL_10;
        v56 = v25 + 1;
        if (v25 + 2 < v52)
        {
          v26 = *(_QWORD *)(v51 + 8 * (v25 + 2));
          if (v26)
          {
            v25 += 2;
            goto LABEL_7;
          }
          v27 = v25 + 3;
          v56 = v25 + 2;
          if (v25 + 3 < v52)
          {
            v26 = *(_QWORD *)(v51 + 8 * v27);
            if (!v26)
            {
              while (1)
              {
                v25 = v27 + 1;
                if (__OFADD__(v27, 1))
                  goto LABEL_37;
                if (v25 >= v52)
                {
                  v56 = v49;
                  goto LABEL_21;
                }
                v26 = *(_QWORD *)(v51 + 8 * v25);
                ++v27;
                if (v26)
                  goto LABEL_7;
              }
            }
LABEL_10:
            v25 = v27;
LABEL_7:
            v20 = (v26 - 1) & v26;
            v21 = __clz(__rbit64(v26)) + (v25 << 6);
            v56 = v25;
            goto LABEL_3;
          }
        }
      }
    }
LABEL_21:
    v28 = OUTLINED_FUNCTION_24_11();
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v28);
    v20 = 0;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  result.storage._rawValue = (void *)sub_23037AF04();
  __break(1u);
  return result;
}

uint64_t SportsJSONContext.Property.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t SportsJSONContext.Property.key.getter()
{
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_20_1();
}

uint64_t SportsJSONContext.Property.key.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*SportsJSONContext.Property.key.modify())()
{
  return nullsub_1;
}

uint64_t SportsJSONContext.Property.codingUserInfoKey.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25405C708);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_2_0();
  v5 = v4 - v3;
  swift_bridgeObjectRetain();
  sub_23037AC34();
  v6 = OUTLINED_FUNCTION_8_12();
  if (__swift_getEnumTagSinglePayload(v5, 1, v6) != 1)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, v5, v6);
  sub_2302DF610(v5, &qword_25405C708);
  swift_bridgeObjectRetain();
  sub_23037AB14();
  sub_23037A670();
  sub_23037AE80();
  sub_23037A670();
  result = sub_23037AC88();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for SportsJSONContext.Property(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SportsJSONContext.Property);
}

uint64_t static SportsJSONContext.Property.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_23037AE8C();
}

void static SportsJSONContext.Property<A>.initFailureObserver.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000027;
  a1[1] = 0x8000000230389F20;
}

uint64_t Dictionary<>.init(jsonContext:)()
{
  os_log_type_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
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
  unint64_t v18;
  uint64_t v19;
  __int128 v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  BOOL v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t);
  uint64_t v40;
  unint64_t v41;
  char v42;
  unint64_t v43;
  char v44;
  unint64_t v45;
  char v46;
  _QWORD *v47;
  _OWORD *v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t);
  uint64_t v52;
  uint64_t result;
  uint64_t v54[2];
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  int64_t v58;
  _BYTE *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  _OWORD v66[2];
  __int128 v67;
  _BYTE v68[32];
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;

  OUTLINED_FUNCTION_9_0();
  v73 = v1;
  v74 = v2;
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405C708);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_2_0();
  v8 = v7 - v6;
  v9 = OUTLINED_FUNCTION_8_12();
  v63 = *(_QWORD *)(v9 - 8);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_6_11(v11, v54[0]);
  MEMORY[0x24BDAC7A8](v12);
  v61 = (uint64_t)v54 - v13;
  v14 = *v4;
  v72 = MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A0A8);
  OUTLINED_FUNCTION_17_12();
  v15 = 0;
  v55 = v14 + 64;
  OUTLINED_FUNCTION_15_8();
  v18 = v17 & v16;
  v59 = v68;
  v62 = &v71;
  v58 = (unint64_t)(v19 + 63) >> 6;
  v54[0] = v58 - 1;
  v60 = v14;
  v54[1] = v14 + 104;
  *(_QWORD *)&v20 = 136315138;
  v57 = v20;
  v56 = MEMORY[0x24BEE4AD8] + 8;
  if ((v17 & v16) == 0)
    goto LABEL_4;
LABEL_2:
  v21 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  v22 = v21 | (v15 << 6);
LABEL_3:
  v23 = *(_QWORD *)(v60 + 56);
  v24 = (_QWORD *)(*(_QWORD *)(v60 + 48) + 16 * v22);
  v25 = v24[1];
  *(_QWORD *)&v67 = *v24;
  *((_QWORD *)&v67 + 1) = v25;
  sub_2302E18C0(v23 + 32 * v22, (uint64_t)v59);
  OUTLINED_FUNCTION_39_2();
  while (1)
  {
    sub_2303657CC((uint64_t)&v67, (uint64_t)&v69, &qword_255E5A0B0);
    v31 = v70;
    if (!v70)
    {
      swift_release();
      return v72;
    }
    v32 = v69;
    sub_2302E18B0(v62, &v67);
    OUTLINED_FUNCTION_39_2();
    sub_23037AC34();
    if (__swift_getEnumTagSinglePayload(v8, 1, v9) == 1)
    {
      sub_2302DF610(v8, &qword_25405C708);
      if (qword_255E576F0 != -1)
        swift_once();
      v33 = OUTLINED_FUNCTION_24_0();
      v34 = __swift_project_value_buffer(v33, (uint64_t)qword_255E6F960);
      OUTLINED_FUNCTION_39_2();
      sub_23037A268();
      v35 = OUTLINED_FUNCTION_31_8();
      if (OUTLINED_FUNCTION_18_11(v35))
      {
        v36 = OUTLINED_FUNCTION_5_2();
        *(_QWORD *)&v66[0] = OUTLINED_FUNCTION_5_2();
        *(_DWORD *)v36 = v57;
        OUTLINED_FUNCTION_39_2();
        *(_QWORD *)(v36 + 4) = sub_23036514C(v32, v31, (uint64_t *)v66);
        OUTLINED_FUNCTION_11_2();
        OUTLINED_FUNCTION_41_3(&dword_2302D3000, v34, v0, "Could not coerce %s into CodingUserInfoKey", (uint8_t *)v36);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_28_0();
      }
      OUTLINED_FUNCTION_56();

      goto LABEL_26;
    }
    swift_bridgeObjectRelease();
    v37 = v63;
    v38 = v61;
    OUTLINED_FUNCTION_10_11(v61, v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v63 + 32));
    v39 = *(void (**)(uint64_t))(v37 + 16);
    v40 = OUTLINED_FUNCTION_20_1();
    v39(v40);
    sub_2302E18C0((uint64_t)&v67, (uint64_t)v66);
    v0 = OUTLINED_FUNCTION_36_8();
    v65 = (_QWORD *)v38;
    v72 = 0x8000000000000000;
    v41 = sub_230317304();
    if (__OFADD__(*(_QWORD *)(v38 + 16), (v42 & 1) == 0))
      break;
    v43 = v41;
    v44 = v42;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25405B288);
    if ((sub_23037AC58() & 1) != 0)
    {
      v45 = sub_230317304();
      if ((v44 & 1) != (v46 & 1))
        goto LABEL_45;
      v43 = v45;
    }
    v47 = v65;
    if ((v44 & 1) != 0)
    {
      v48 = (_OWORD *)(v65[7] + 32 * v43);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
      sub_2302E18B0(v66, v48);
    }
    else
    {
      v65[(v43 >> 6) + 8] |= 1 << v43;
      ((void (*)(unint64_t, uint64_t, uint64_t))v39)(v47[6] + *(_QWORD *)(v63 + 72) * v43, v64, v9);
      sub_2302E18B0(v66, (_OWORD *)(v47[7] + 32 * v43));
      v49 = v47[2];
      v28 = __OFADD__(v49, 1);
      v50 = v49 + 1;
      if (v28)
        goto LABEL_44;
      v47[2] = v50;
      v47 = v65;
    }
    v72 = (unint64_t)v47;
    swift_bridgeObjectRelease();
    v51 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
    v51(v64, v9);
    v51(v61, v9);
LABEL_26:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v67);
    if (v18)
      goto LABEL_2;
LABEL_4:
    if (__OFADD__(v15, 1))
      goto LABEL_43;
    OUTLINED_FUNCTION_21_8();
    if (v27 != v28)
    {
      v29 = *(_QWORD *)(v55 + 8 * v26);
      if (v29)
        goto LABEL_8;
      v30 = v26;
      if (v26 + 1 < v58)
      {
        v29 = *(_QWORD *)(v55 + 8 * (v26 + 1));
        if (v29)
        {
          ++v26;
LABEL_8:
          v18 = (v29 - 1) & v29;
          v22 = __clz(__rbit64(v29)) + (v26 << 6);
          v15 = v26;
          goto LABEL_3;
        }
        v30 = v26 + 1;
        if (v26 + 2 < v58)
        {
          v29 = *(_QWORD *)(v55 + 8 * (v26 + 2));
          if (v29)
          {
            v26 += 2;
            goto LABEL_8;
          }
          OUTLINED_FUNCTION_21_8();
          if (v27 != v28)
          {
            v29 = *(_QWORD *)(v55 + 8 * v26);
            if (!v29)
            {
              do
              {
                OUTLINED_FUNCTION_21_8();
                if (v27 == v28)
                {
                  v30 = v54[0];
                  goto LABEL_9;
                }
                v29 = *(_QWORD *)(v52 + 8 * v15++);
              }
              while (!v29);
              v26 = v15 + 4;
            }
            goto LABEL_8;
          }
        }
      }
    }
    else
    {
      v30 = v15;
    }
LABEL_9:
    v18 = 0;
    memset(v68, 0, sizeof(v68));
    v15 = v30;
    v67 = 0u;
  }
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  result = sub_23037AF04();
  __break(1u);
  return result;
}

uint64_t sub_230364758()
{
  swift_bridgeObjectRetain();
  Dictionary<>.subscript.getter();
  return swift_bridgeObjectRelease();
}

void sub_2303647B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v5 = sub_23037AA24();
  MEMORY[0x24BDAC7A8](v5);
  v7 = *a3;
  v6 = a3[1];
  (*(void (**)(char *, uint64_t))(v8 + 16))((char *)v10 - v9, a1);
  v10[0] = v7;
  v10[1] = v6;
  swift_bridgeObjectRetain();
  Dictionary<>.subscript.setter();
}

void Dictionary<>.subscript.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 *v28;
  uint64_t v29;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51[4];
  __int128 v52;
  uint64_t v53;
  _OWORD v54[2];

  OUTLINED_FUNCTION_9_0();
  v46 = v0;
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v7 = OUTLINED_FUNCTION_8_12();
  v47 = *(_QWORD *)(v7 - 8);
  v48 = v7;
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_36_7();
  v9 = sub_23037AA24();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v42 - v11;
  v13 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_6_11(v14, v42);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v42 - v16;
  v18 = *v4;
  v19 = v4[1];
  v21 = v20;
  v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
  v45 = v6;
  OUTLINED_FUNCTION_39_4((uint64_t)v12, v6, v22);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v2) == 1)
  {
    v23 = *(uint64_t (**)(char *, uint64_t))(v21 + 8);
    v24 = v23(v12, v9);
    *(_QWORD *)&v54[0] = v18;
    *((_QWORD *)&v54[0] + 1) = v19;
    OUTLINED_FUNCTION_30_7(v24, v25, v26, v27);
    OUTLINED_FUNCTION_25_14();
    OUTLINED_FUNCTION_67_2();
    sub_230317E90(v54);
    v23((char *)v45, v9);
    OUTLINED_FUNCTION_13_9();
    v28 = v54;
LABEL_7:
    sub_2302DF610((uint64_t)v28, &qword_25405BC80);
    goto LABEL_8;
  }
  v42 = v21;
  v43 = v9;
  v29 = v45;
  OUTLINED_FUNCTION_10_11((uint64_t)v17, (uint64_t)v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 32));
  v51[3] = v2;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v51);
  v31 = OUTLINED_FUNCTION_10_11((uint64_t)boxed_opaque_existential_0, (uint64_t)v17, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16));
  v49 = v18;
  v50 = v19;
  OUTLINED_FUNCTION_30_7(v31, v32, v33, v34);
  OUTLINED_FUNCTION_25_14();
  sub_2303659F4();
  OUTLINED_FUNCTION_13_9();
  if (!v53)
  {
    OUTLINED_FUNCTION_67_2();
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v29, v43);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v17, v2);
    v28 = &v52;
    goto LABEL_7;
  }
  v48 = v18;
  sub_2302E18B0(&v52, v54);
  sub_2302E18C0((uint64_t)v54, (uint64_t)&v52);
  v35 = v44;
  if ((swift_dynamicCast() & 1) != 0)
  {
    OUTLINED_FUNCTION_67_2();
    v36 = *(void (**)(char *, uint64_t))(v13 + 8);
    v36(v35, v2);
    OUTLINED_FUNCTION_2_14();
    OUTLINED_FUNCTION_25_0();
    v36(v17, v2);
  }
  else
  {
    v47 = v2;
    if (qword_255E576F0 != -1)
      swift_once();
    v37 = OUTLINED_FUNCTION_24_0();
    v38 = __swift_project_value_buffer(v37, (uint64_t)qword_255E6F960);
    swift_bridgeObjectRetain();
    sub_23037A268();
    v39 = OUTLINED_FUNCTION_31_8();
    if (OUTLINED_FUNCTION_18_11(v39))
    {
      v46 = v13;
      v40 = (uint8_t *)OUTLINED_FUNCTION_5_2();
      v41 = OUTLINED_FUNCTION_5_2();
      v44 = v17;
      *(_QWORD *)&v52 = v41;
      *(_DWORD *)v40 = 136315138;
      swift_bridgeObjectRetain();
      v51[0] = sub_23036514C(v48, v19, (uint64_t *)&v52);
      OUTLINED_FUNCTION_35_5();
      OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_41_3(&dword_2302D3000, v38, (os_log_type_t)v13, "New value stored for property %s does not match old type. This may indicate a bug.", v40);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_28_0();
    }
    OUTLINED_FUNCTION_56();

    OUTLINED_FUNCTION_2_14();
    OUTLINED_FUNCTION_25_0();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v17, v47);
  }
LABEL_8:
  OUTLINED_FUNCTION_0_2();
}

void (*Dictionary<>.subscript.modify(uint64_t a1, uint64_t a2, uint64_t a3))(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t *v4;
  _QWORD *v5;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_96_0();
  v7 = malloc(0x50uLL);
  *v5 = v7;
  v7[2] = a3;
  v7[3] = v3;
  v8 = sub_23037AA24();
  v7[4] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[5] = v9;
  v10 = *(_QWORD *)(v9 + 64);
  v7[6] = malloc(v10);
  v11 = malloc(v10);
  v13 = *v4;
  v12 = v4[1];
  v7[7] = v11;
  v7[8] = v13;
  v7[9] = v12;
  *v7 = v13;
  v7[1] = v12;
  swift_bridgeObjectRetain();
  Dictionary<>.subscript.getter();
  return sub_230364CD4;
}

void sub_230364CD4(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD **)a1;
  v4 = *(void **)(*(_QWORD *)a1 + 48);
  v3 = *(void **)(*(_QWORD *)a1 + 56);
  if ((a2 & 1) != 0)
  {
    v5 = v2[4];
    v6 = v2[5];
    OUTLINED_FUNCTION_39_4(v2[6], v2[7], *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16));
    Dictionary<>.subscript.setter();
    (*(void (**)(void *, uint64_t))(v6 + 8))(v3, v5);
  }
  else
  {
    Dictionary<>.subscript.setter();
  }
  free(v3);
  free(v4);
  free(v2);
}

void SportsJSONInitFailureObserver.tryingToEncode(_:didFailWith:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  OUTLINED_FUNCTION_9_0();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = sub_23037AB80();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_2_0();
  v12 = v11 - v10;
  swift_getErrorValue();
  sub_23037AF34();
  v13 = v5;
  sub_23037AB5C();
  v14 = sub_23037AB8C();
  v15 = (void *)swift_allocError();
  v17 = v16;
  v18 = (uint64_t)v16 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255E5A0B8) + 48);
  v17[3] = swift_getMetatypeMetadata();
  *v17 = v7;
  OUTLINED_FUNCTION_39_4(v18, v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16));
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v17, *MEMORY[0x24BEE2728], v14);
  (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v1 + 8))(v7, v15, v3, v1);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v8);

  OUTLINED_FUNCTION_0_2();
}

void DefaultSportsJSONInitFailureObserver.tryingToInitialize(_:didFailWith:)(uint64_t a1, void *a2)
{
  sub_230364F08(a1, a2, "Decoding Error! Failed to decode %s with error: %s");
}

void DefaultSportsJSONInitFailureObserver.tryingToEncode(_:didFailWith:)(uint64_t a1, void *a2)
{
  sub_230364F08(a1, a2, "Encoding Error! Failed to encode %s with error: %s");
}

void sub_230364F08(uint64_t a1, void *a2, const char *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *oslog;
  uint64_t v15;

  if (qword_255E576F0 != -1)
    swift_once();
  v5 = OUTLINED_FUNCTION_24_0();
  __swift_project_value_buffer(v5, (uint64_t)qword_255E6F960);
  v6 = a2;
  v7 = a2;
  oslog = sub_23037A268();
  v8 = sub_23037A904();
  if (os_log_type_enabled(oslog, v8))
  {
    v9 = OUTLINED_FUNCTION_5_2();
    v15 = OUTLINED_FUNCTION_5_2();
    *(_DWORD *)v9 = 136315394;
    v10 = sub_23037B024();
    sub_23036514C(v10, v11, &v15);
    sub_23037AA30();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    swift_getErrorValue();
    v12 = sub_23037AF34();
    sub_23036514C(v12, v13, &v15);
    sub_23037AA30();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_2_1();
    _os_log_impl(&dword_2302D3000, oslog, v8, a3, (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_28_0();
  }
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_1();

}

uint64_t DefaultSportsJSONInitFailureObserver.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t DefaultSportsJSONInitFailureObserver.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t DefaultSportsJSONInitFailureObserver.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t DefaultSportsJSONInitFailureObserver.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void sub_230365124(uint64_t a1, void *a2)
{
  DefaultSportsJSONInitFailureObserver.tryingToInitialize(_:didFailWith:)(a1, a2);
}

void sub_230365138(uint64_t a1, void *a2)
{
  DefaultSportsJSONInitFailureObserver.tryingToEncode(_:didFailWith:)(a1, a2);
}

uint64_t sub_23036514C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  OUTLINED_FUNCTION_96_0();
  v6 = sub_230365218(v12, 0, 0, 1, v4, v3);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2302E18C0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = v4;
    v12[1] = v3;
    v10 = *a3;
    if (*a3)
    {
      sub_2302E18C0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_230365218(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_23036536C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_23037AA3C();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_230365430(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_23037AB98();
    if (!v8)
    {
      result = sub_23037AC7C();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_23036536C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_23037ACC4();
  __break(1u);
  return result;
}

uint64_t sub_230365430(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2303654C4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_230365634(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_230365634((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2303654C4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_23037A688();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  sub_230347284(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_23037AB20();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return v4;
  }
  sub_23037ACC4();
  __break(1u);
LABEL_14:
  result = sub_23037AC7C();
  __break(1u);
  return result;
}

char *sub_230365634(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25405BC78);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_2302D9340(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_230365708(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_230365708(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_23037ACC4();
  __break(1u);
  return result;
}

uint64_t sub_2303657CC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a3);
  v4 = OUTLINED_FUNCTION_20_1();
  v5(v4);
  return a2;
}

unint64_t sub_23036580C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t result;
  _QWORD *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  result = OUTLINED_FUNCTION_14_8(a1, a2, a3, a4);
  *(_BYTE *)(v5[6] + result) = v6;
  *(_QWORD *)(v5[7] + 8 * result) = v7;
  v8 = v5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    v5[2] = v10;
  return result;
}

unint64_t sub_230365840(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t result;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  result = OUTLINED_FUNCTION_4_13(a1, a2, a3, a4, a5, a6, a7, a8);
  *(_BYTE *)v11 = v10;
  *(_QWORD *)(v11 + 8) = v12;
  *(_QWORD *)(v11 + 16) = v13;
  *(_QWORD *)(v11 + 24) = v14;
  v15 = *(_QWORD *)(v9 + 16);
  v16 = __OFADD__(v15, 1);
  v17 = v15 + 1;
  if (v16)
    __break(1u);
  else
    *(_QWORD *)(v9 + 16) = v17;
  return result;
}

unint64_t sub_230365870(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  result = OUTLINED_FUNCTION_4_13(a1, a2, a3, a4, a5, a6, a7, a8);
  *v12 = v10;
  v12[1] = v11;
  v12[2] = v13;
  v12[3] = v14;
  v15 = *(_QWORD *)(v9 + 16);
  v16 = __OFADD__(v15, 1);
  v17 = v15 + 1;
  if (v16)
    __break(1u);
  else
    *(_QWORD *)(v9 + 16) = v17;
  return result;
}

_OWORD *sub_23036589C(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  _OWORD *result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_23037AC4C();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  result = sub_2302E18B0(a3, (_OWORD *)(a4[7] + 32 * a1));
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
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

uint64_t sub_230365978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  OUTLINED_FUNCTION_96_0();
  OUTLINED_FUNCTION_14_8(v8, v9, v10, v11);
  v13 = *(_QWORD *)(v12 + 48);
  v14 = sub_23037A25C();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v13 + *(_QWORD *)(*(_QWORD *)(v14 - 8) + 72) * v5, v4, v14);
  *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v5) = a3;
  v16 = *(_QWORD *)(a4 + 16);
  v17 = __OFADD__(v16, 1);
  v18 = v16 + 1;
  if (v17)
    __break(1u);
  else
    *(_QWORD *)(a4 + 16) = v18;
  return result;
}

uint64_t sub_2303659F4()
{
  uint64_t *v0;
  uint64_t v1;
  _OWORD *v2;
  _OWORD *v3;
  _OWORD *v4;
  uint64_t v6;

  OUTLINED_FUNCTION_96_0();
  v4 = v3;
  swift_isUniquelyReferenced_nonNull_native();
  v6 = *v0;
  *v0 = 0x8000000000000000;
  sub_230365AE0(v2, v1, v4);
  *v0 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_230365A74()
{
  return 8;
}

_QWORD *sub_230365A80(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

ValueMetadata *type metadata accessor for SportsJSONContext()
{
  return &type metadata for SportsJSONContext;
}

uint64_t dispatch thunk of SportsJSONInitFailureObserver.tryingToInitialize(_:didFailWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of SportsJSONInitFailureObserver.tryingToEncode(_:didFailWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t type metadata accessor for DefaultSportsJSONInitFailureObserver()
{
  return objc_opt_self();
}

uint64_t method lookup function for DefaultSportsJSONInitFailureObserver()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DefaultSportsJSONInitFailureObserver.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

_OWORD *sub_230365AE0@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  _QWORD *v18;
  _OWORD *result;
  uint64_t v20;
  _OWORD *v21;

  v4 = (_QWORD **)v3;
  v21 = a1;
  v7 = sub_23037AC4C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (_QWORD *)*v3;
  v12 = sub_230317304();
  if (__OFADD__(v11[2], (v13 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v14 = v12;
  v15 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B288);
  if ((sub_23037AC58() & 1) == 0)
    goto LABEL_5;
  v16 = sub_230317304();
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_9:
    result = (_OWORD *)sub_23037AF04();
    __break(1u);
    return result;
  }
  v14 = v16;
LABEL_5:
  v18 = *v4;
  if ((v15 & 1) != 0)
  {
    sub_2302E18B0((_OWORD *)(v18[7] + 32 * v14), a3);
    return sub_2302E18B0(v21, (_OWORD *)(v18[7] + 32 * v14));
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a2, v7);
    result = sub_23036589C(v14, (uint64_t)v10, v21, v18);
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 256) + 8))(v0, v1);
}

unint64_t OUTLINED_FUNCTION_4_13(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  *(_QWORD *)(a8 + 8 * (result >> 6) + 64) |= 1 << result;
  v8 = (_QWORD *)(*(_QWORD *)(a8 + 48) + 16 * result);
  *v8 = a2;
  v8[1] = a3;
  return result;
}

void OUTLINED_FUNCTION_6_11(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 240) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_8_12()
{
  return sub_23037AC4C();
}

uint64_t OUTLINED_FUNCTION_9_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_13_9()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 216) + 8))(v0, *(_QWORD *)(v1 - 208));
}

unint64_t OUTLINED_FUNCTION_14_8(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_QWORD *)(a4 + 8 * (result >> 6) + 64) |= 1 << result;
  return result;
}

uint64_t OUTLINED_FUNCTION_17_12()
{
  return sub_23037A514();
}

BOOL OUTLINED_FUNCTION_18_11(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_24_11()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_25_14()
{
  uint64_t v0;

  return SportsJSONContext.Property.codingUserInfoKey.getter(v0);
}

uint64_t OUTLINED_FUNCTION_30_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for SportsJSONContext.Property(0, v4, a3, a4);
}

uint64_t OUTLINED_FUNCTION_31_8()
{
  return sub_23037A904();
}

unint64_t OUTLINED_FUNCTION_33_8()
{
  return sub_230317298();
}

uint64_t OUTLINED_FUNCTION_35_5()
{
  return sub_23037AA30();
}

uint64_t OUTLINED_FUNCTION_36_8()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t BaseballClockFormatter.FormattedComponents.pitchCount.getter()
{
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_3_13();
  sub_23037A670();
  OUTLINED_FUNCTION_3_13();
  sub_23037A670();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t BaseballClockFormatter.FormattedComponents.activeBases.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t BaseballClockFormatter.FormattedComponents.balls.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t BaseballClockFormatter.FormattedComponents.strikes.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t BaseballClockFormatter.FormattedComponents.outs.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

void sub_230365E30()
{
  qword_25405B338 = MEMORY[0x24BEE4AF8];
  unk_25405B340 = 0;
  qword_25405B348 = 0;
  qword_25405B350 = 0;
}

uint64_t static BaseballClockFormatter.FormattedComponents.defaultComponents.getter()
{
  if (qword_25405B360 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_14((uint64_t)&qword_25405B338);
  return swift_bridgeObjectRetain();
}

BOOL static BaseballClockFormatter.FormattedComponents.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _BOOL4 v9;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = sub_2302D5574(*(_QWORD **)a1, *(_QWORD **)a2);
  v9 = v4 == v7;
  if (v2 != v5 || v3 != v6)
    v9 = 0;
  return (v8 & 1) != 0 && v9;
}

uint64_t static BaseballClockFormatter.formattedComponents(subscription:)(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  uint64_t v7;

  v2 = (uint64_t *)(a1 + OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_mostRecentPlay);
  OUTLINED_FUNCTION_15_1();
  v3 = *v2;
  if (*(_QWORD *)(v3 + 16))
  {
    swift_bridgeObjectRetain();
    v4 = sub_230317348(1);
    if ((v5 & 1) != 0)
    {
      v6 = *(id *)(*(_QWORD *)(v3 + 56) + 8 * v4);
      OUTLINED_FUNCTION_11();
      v7 = a1 + OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_sportingEventDetails;
      OUTLINED_FUNCTION_15_1();
      __asm { BR              X10 }
    }
    OUTLINED_FUNCTION_11();
  }
  if (qword_25405B360 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_14((uint64_t)&qword_25405B338);
  return swift_bridgeObjectRetain();
}

BOOL sub_230366540(uint64_t a1)
{
  uint64_t v1;
  char v3;
  char v4;
  uint64_t v5;
  _BOOL8 result;
  int v7;
  int64_t v8;
  unsigned __int8 v9;
  int64_t v10;

  if (*(_BYTE *)(a1 + OBJC_IVAR____TtC9SportsKit24SportingEventClockPeriod__type) == 10)
    return 0;
  sub_2302E4DB8();
  if ((v3 & 1) == 0)
    return 0;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC9SportsKit24SportingEventClockPeriod__type) == 10)
    return 0;
  sub_2302E4DB8();
  if ((v4 & 1) == 0)
    return 0;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC9SportsKit24SportingEventClockPeriod__index + 8))
    v5 = -1;
  else
    v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9SportsKit24SportingEventClockPeriod__index);
  if ((*(_BYTE *)(a1 + OBJC_IVAR____TtC9SportsKit24SportingEventClockPeriod__index + 8) & 1) != 0)
  {
    if ((v5 & 0x8000000000000000) == 0)
      return 0;
  }
  else if (*(_QWORD *)(a1 + OBJC_IVAR____TtC9SportsKit24SportingEventClockPeriod__index) < v5)
  {
    return 0;
  }
  v7 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC9SportsKit24SportingEventClockPeriod__subdivision);
  if (v7 == 6)
    LOBYTE(v7) = 0;
  v8 = 0;
  switch(*(_BYTE *)(a1 + OBJC_IVAR____TtC9SportsKit24SportingEventClockPeriod__subdivision))
  {
    case 1:
      goto LABEL_20;
    case 2:
      v8 = 3;
      goto LABEL_20;
    case 3:
      v8 = 2;
      goto LABEL_20;
    case 4:
      v8 = 1;
      goto LABEL_20;
    case 6:
      return (v7 - 5) < 0xFCu;
    default:
      v8 = 0x8000000000000000;
LABEL_20:
      v9 = v7 - 1;
      if (v9 > 3u)
        v10 = 0x8000000000000000;
      else
        v10 = qword_230387F98[(char)v9];
      result = v8 >= v10;
      break;
  }
  return result;
}

uint64_t BaseballClockFormatter.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t BaseballClockFormatter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_230366698(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t type metadata accessor for BaseballClockFormatter()
{
  return objc_opt_self();
}

uint64_t method lookup function for BaseballClockFormatter()
{
  return swift_lookUpClassMethod();
}

uint64_t initializeWithCopy for BaseballClockFormatter.FormattedComponents(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for BaseballClockFormatter.FormattedComponents(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for BaseballClockFormatter.FormattedComponents(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for BaseballClockFormatter.FormattedComponents(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BaseballClockFormatter.FormattedComponents(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for BaseballClockFormatter.FormattedComponents()
{
  return &type metadata for BaseballClockFormatter.FormattedComponents;
}

__n128 OUTLINED_FUNCTION_0_14@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  __n128 result;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)v1 = *(_QWORD *)a1;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v1 + 8) = result;
  *(_QWORD *)(v1 + 24) = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_3_13()
{
  return sub_23037AE38();
}

uint64_t OUTLINED_FUNCTION_5_13()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_6_12()
{
  return swift_bridgeObjectRetain_n();
}

void OUTLINED_FUNCTION_7_10()
{
  sub_2302D8668();
}

void OUTLINED_FUNCTION_8_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  SportingEventCompetitorContainer.baseballScores.getter((uint64_t)va);
}

uint64_t sub_2303668FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405AC48);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  swift_weakInit();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405BB60);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE6A10], v0);
  sub_23037A850();
  return swift_release();
}

uint64_t sub_2303669E0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v31[2];
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;

  v3 = v1;
  v32 = *v3;
  v5 = sub_23037A118();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v33 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v31 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v31 - v12;
  v14 = OBJC_IVAR____TtC9SportsKit24ScoreboardsUpdateMonitor_continuations;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405ACD8);
  v15 = swift_allocObject();
  *(_DWORD *)(v15 + 24) = 0;
  *(_QWORD *)(v15 + 16) = MEMORY[0x24BEE4AF8];
  v31[1] = v14;
  *(uint64_t *)((char *)v3 + v14) = v15;
  v35 = a1;
  sub_23037A0C4();
  sub_23037A0D0();
  v34 = v6;
  OUTLINED_FUNCTION_0_15((uint64_t)v11);
  v16 = (void *)objc_opt_self();
  v17 = objc_msgSend(v16, sel_defaultManager);
  OUTLINED_FUNCTION_2_15();
  v18 = (void *)sub_23037A5A4();
  swift_bridgeObjectRelease();
  LOBYTE(a1) = objc_msgSend(v11, sel_fileExistsAtPath_, v18);

  if ((a1 & 1) == 0)
  {
    sub_230379F08();
    swift_allocObject();
    v19 = sub_230379EFC();
    type metadata accessor for ScoreboardSubscription();
    v20 = (_QWORD *)swift_allocObject();
    v20[2] = MEMORY[0x24BEE4AF8];
    v36 = v20;
    sub_2303674BC(&qword_25405B758, (uint64_t)&protocol conformance descriptor for ScoreboardSubscription);
    v21 = sub_230379EF0();
    if (v2)
    {
      swift_release();
      OUTLINED_FUNCTION_0_15(v35);
      swift_release();
      OUTLINED_FUNCTION_0_15((uint64_t)v13);
      swift_release();
      swift_deallocPartialClassInstance();
      return v19;
    }
    v23 = v21;
    v32 = v22;
    swift_release();
    swift_release();
    v24 = objc_msgSend(v16, sel_defaultManager);
    OUTLINED_FUNCTION_2_15();
    v25 = (void *)sub_23037A5A4();
    swift_bridgeObjectRelease();
    v26 = v32;
    sub_2303674FC((uint64_t)v25, v23, v32, 0, v20);

    sub_2302E340C(v23, v26);
  }
  v27 = v33;
  (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v33, v13, v5);
  v28 = (uint64_t)v27;
  v19 = (uint64_t)v3;
  v29 = sub_23031A850(v28);
  if (v2)
  {
    OUTLINED_FUNCTION_0_15(v35);
    OUTLINED_FUNCTION_0_15((uint64_t)v13);
  }
  else
  {
    v19 = v29;
    OUTLINED_FUNCTION_0_15(v35);
    OUTLINED_FUNCTION_0_15((uint64_t)v13);
    *(_QWORD *)(v19 + OBJC_IVAR____TtC9SportsKit17FileSystemMonitor_delegate + 8) = &off_24FE0F070;
    swift_unknownObjectWeakAssign();
  }
  return v19;
}

uint64_t sub_230366D50()
{
  return swift_release();
}

uint64_t sub_230366D60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit24ScoreboardsUpdateMonitor_continuations);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  sub_230366DF4((uint64_t *)(v1 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
  swift_release();
  v2 = sub_23031AF84();
  swift_release();
  return v2;
}

uint64_t sub_230366DF4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t result;
  _QWORD v13[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405AC50);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *a1;
  v8 = *(_QWORD *)(*a1 + 16);
  if (v8)
  {
    v13[1] = v1;
    v9 = v7 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v10 = *(_QWORD *)(v4 + 72);
    v11 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    swift_bridgeObjectRetain();
    do
    {
      v11(v6, v9, v3);
      sub_23037A838();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      v9 += v10;
      --v8;
    }
    while (v8);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a1 = MEMORY[0x24BEE4AF8];
  return result;
}

uint64_t sub_230366F10()
{
  sub_230366D60();
  return swift_deallocClassInstance();
}

uint64_t sub_230366F30()
{
  return type metadata accessor for ScoreboardsUpdateMonitor();
}

uint64_t type metadata accessor for ScoreboardsUpdateMonitor()
{
  uint64_t result;

  result = qword_25405AAE8;
  if (!qword_25405AAE8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_230366F70()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_230366FB4(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v3 = *(_QWORD *)(result + OBJC_IVAR____TtC9SportsKit24ScoreboardsUpdateMonitor_continuations);
    swift_retain();
    swift_release();
    os_unfair_lock_lock((os_unfair_lock_t)(v3 + 24));
    sub_230367064((uint64_t *)(v3 + 16), a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 24));
    return swift_release();
  }
  return result;
}

uint64_t sub_230367064(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  sub_23035EE2C();
  v4 = *(_QWORD *)(*a1 + 16);
  sub_23035EEB0(v4);
  v5 = *a1;
  *(_QWORD *)(*a1 + 16) = v4 + 1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405AC50);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v5+ ((*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v6 - 8) + 72) * v4, a2, v6);
  *a1 = v5;
  return result;
}

uint64_t sub_2303670F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  sub_230379EA8();
  swift_allocObject();
  sub_230379E9C();
  type metadata accessor for ScoreboardSubscription();
  sub_2303674BC(&qword_25405B760, (uint64_t)&protocol conformance descriptor for ScoreboardSubscription);
  sub_230379E84();
  swift_release();
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit24ScoreboardsUpdateMonitor_continuations);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  sub_230367364((uint64_t *)(v1 + 16), v3);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
  swift_release();
  return swift_release();
}

uint64_t sub_230367364(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD v16[6];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405AC40);
  v6 = *(_QWORD *)(v5 - 8);
  result = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  v11 = *(_QWORD *)(*a1 + 16);
  if (v11)
  {
    v16[0] = v2;
    v12 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25405AC50) - 8);
    v13 = v10 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    v14 = (_QWORD *)(a2 + 16);
    swift_bridgeObjectRetain();
    swift_beginAccess();
    v15 = *(_QWORD *)(v12 + 72);
    do
    {
      v16[5] = *v14;
      swift_bridgeObjectRetain();
      sub_23037A82C();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      v13 += v15;
      --v11;
    }
    while (v11);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_230367490()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2303674B4(uint64_t a1)
{
  return sub_230366FB4(a1);
}

uint64_t sub_2303674BC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for ScoreboardSubscription();
    result = MEMORY[0x2348B7C44](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

id sub_2303674FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;
  id v9;

  v8 = (void *)sub_23037A190();
  v9 = objc_msgSend(a5, sel_createFileAtPath_contents_attributes_, a1, v8, a4);

  return v9;
}

uint64_t OUTLINED_FUNCTION_0_15(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_2_15()
{
  return sub_23037A0F4();
}

uint64_t dispatch thunk of DataReadWritable.write(_:to:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of DataReadWritable.read(contentsOf:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_2303675A4()
{
  return sub_23037A1A8();
}

uint64_t sub_2303675D0()
{
  return sub_23037A148();
}

uint64_t sub_2303675E8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PersistentStoreWriter()
{
  return objc_opt_self();
}

uint64_t sub_230367618()
{
  return sub_2303675A4();
}

uint64_t sub_23036762C()
{
  return sub_2303675D0();
}

void static RunningClockComponentsFormatter.DataSource.== infix(_:_:)()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  BOOL v16;
  char v17;
  int v18;
  char v19;
  int v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;
  uint64_t v28;
  _QWORD *v29;
  char v30;
  _QWORD *v31;
  int v32;
  uint64_t v33;
  char v34;
  char v35;

  OUTLINED_FUNCTION_9_0();
  v5 = v4;
  v7 = v6;
  OUTLINED_FUNCTION_78_4();
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_15_0();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A160);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_67_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_18_10();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v33 - v14;
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_94_1();
  v16 = *(_QWORD *)v7 == *(_QWORD *)v5 && *(_QWORD *)(v7 + 8) == *(_QWORD *)(v5 + 8);
  if (!v16 && (OUTLINED_FUNCTION_40() & 1) == 0
    || *(unsigned __int8 *)(v7 + 16) != *(unsigned __int8 *)(v5 + 16)
    || *(unsigned __int8 *)(v7 + 17) != *(unsigned __int8 *)(v5 + 17)
    || *(unsigned __int8 *)(v7 + 18) != *(unsigned __int8 *)(v5 + 18))
  {
    goto LABEL_9;
  }
  v17 = *(_BYTE *)(v5 + 32);
  if ((*(_BYTE *)(v7 + 32) & 1) != 0)
  {
    if (!*(_BYTE *)(v5 + 32))
      goto LABEL_9;
  }
  else
  {
    if (*(_QWORD *)(v7 + 24) != *(_QWORD *)(v5 + 24))
      v17 = 1;
    if ((v17 & 1) != 0)
      goto LABEL_9;
  }
  v18 = *(unsigned __int8 *)(v5 + 33);
  if (*(_BYTE *)(v7 + 33) == 10)
  {
    if (v18 != 10)
      goto LABEL_9;
  }
  else
  {
    if (v18 == 10)
      goto LABEL_9;
    sub_2302E4DB8();
    if ((v19 & 1) == 0)
      goto LABEL_9;
  }
  v20 = *(unsigned __int8 *)(v5 + 34);
  if (*(_BYTE *)(v7 + 34) == 6)
  {
    if (v20 != 6)
      goto LABEL_9;
  }
  else
  {
    v35 = *(_BYTE *)(v7 + 34);
    if (v20 == 6)
      goto LABEL_9;
    v34 = v20;
    static SportingEventClockPeriodSubdivision.== infix(_:_:)((uint64_t)&v35);
    if ((v21 & 1) == 0)
      goto LABEL_9;
  }
  sub_2302E4570();
  if ((v22 & 1) == 0)
    goto LABEL_9;
  v23 = OUTLINED_FUNCTION_80_0();
  sub_2302FD2B4(v7 + *(int *)(v23 + 48), v3, &qword_25405A280);
  v33 = v23;
  OUTLINED_FUNCTION_74_1(v5 + *(int *)(v23 + 48), (uint64_t)v15);
  v24 = v0 + *(int *)(v9 + 48);
  OUTLINED_FUNCTION_74_1(v3, v0);
  OUTLINED_FUNCTION_74_1((uint64_t)v15, v24);
  OUTLINED_FUNCTION_27_8(v0);
  if (!v16)
  {
    sub_2302FD2B4(v0, v2, &qword_25405A280);
    OUTLINED_FUNCTION_27_8(v24);
    if (!v25)
    {
      sub_2302FD334(v24, v1, type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents);
      static RunningClockComponentsFormatter.LiveClockComponents.== infix(_:_:)();
      v27 = v26;
      OUTLINED_FUNCTION_182(v1);
      OUTLINED_FUNCTION_124((uint64_t)v15);
      OUTLINED_FUNCTION_124(v3);
      OUTLINED_FUNCTION_182(v2);
      OUTLINED_FUNCTION_124(v0);
      if ((v27 & 1) == 0)
        goto LABEL_9;
      goto LABEL_37;
    }
    sub_2302FD540((uint64_t)v15, &qword_25405A280);
    sub_2302FD540(v3, &qword_25405A280);
    sub_2302F6DC8(v2, type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents);
LABEL_35:
    sub_2302FD540(v0, &qword_255E5A160);
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_124((uint64_t)v15);
  OUTLINED_FUNCTION_124(v3);
  OUTLINED_FUNCTION_27_8(v24);
  if (!v16)
    goto LABEL_35;
  sub_2302FD540(v0, &qword_25405A280);
LABEL_37:
  if (*(_QWORD *)(v7 + *(int *)(v33 + 52)) != *(_QWORD *)(v5 + *(int *)(v33 + 52)))
    goto LABEL_9;
  v28 = *(int *)(v33 + 56);
  v29 = (_QWORD *)(v7 + v28);
  v30 = *(_BYTE *)(v7 + v28 + 8);
  v31 = (_QWORD *)(v5 + v28);
  v32 = *(unsigned __int8 *)(v5 + v28 + 8);
  if ((v30 & 1) != 0)
  {
    if (!v32)
      goto LABEL_9;
LABEL_44:
    sub_2302D58A8();
    goto LABEL_9;
  }
  if (*v29 != *v31)
    LOBYTE(v32) = 1;
  if ((v32 & 1) == 0)
    goto LABEL_44;
LABEL_9:
  OUTLINED_FUNCTION_0_2();
}

uint64_t type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(uint64_t a1)
{
  return sub_2302EFB2C(a1, qword_25405CAA8);
}

uint64_t type metadata accessor for RunningClockComponentsFormatter.DataSource(uint64_t a1)
{
  return sub_2302EFB2C(a1, qword_25405CB48);
}

BOOL sub_2303679DC(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & a2;
  if (v3 != a2)
    *v2 |= a2;
  *a1 = a2;
  return v3 != a2;
}

void RunningClockComponentsFormatter.__allocating_init(localizationProvider:)(uint64_t a1)
{
  objc_class *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_allocWithZone(v1);
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
  OUTLINED_FUNCTION_90_3();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_21_9(v5, v6, v7);
  OUTLINED_FUNCTION_64_5();
  __swift_destroy_boxed_opaque_existential_1(a1);
  OUTLINED_FUNCTION_23();
}

void RunningClockComponentsFormatter.formattedComponents(subscription:)()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_80_0();
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_15_0();
  SportingEventSubscription.createRunningClockDataSource(preferStaticClock:)();
  RunningClockComponentsFormatter.formattedComponents(dataSource:)();
  OUTLINED_FUNCTION_182(v0);
}

void RunningClockComponentsFormatter.LiveClockComponents.dateInterval.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_2302FD2B4(v1, a1, &qword_25405A298);
}

void RunningClockComponentsFormatter.LiveClockComponents.pauseAt.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_78_4();
  OUTLINED_FUNCTION_99_4(v0 + *(int *)(v1 + 20), v2, &qword_25405B4C8);
  OUTLINED_FUNCTION_3();
}

uint64_t RunningClockComponentsFormatter.LiveClockComponents.countdown.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_78_4() + 24));
}

void sub_230367B60()
{
  int v0;
  uint64_t v1;
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
  char *v12;
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
  char *v23;
  uint64_t (*v24)(uint64_t);
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, char *, uint64_t);
  uint64_t v30;
  void (*v31)(uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;

  OUTLINED_FUNCTION_9_0();
  v41 = v0;
  v40 = v1;
  v3 = v2;
  v5 = v4;
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A260);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_98();
  v9 = v7 - v8;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v36 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_78_0(v15, v36);
  v16 = OUTLINED_FUNCTION_43_0();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_98();
  v20 = v18 - v19;
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v36 - v22;
  v38 = v13;
  sub_2302ED798(&qword_25405CA98, v24, MEMORY[0x24BDCE948]);
  if ((sub_23037A568() & 1) == 0)
  {
    v34 = v3;
    goto LABEL_5;
  }
  v36 = v5;
  sub_23037A22C();
  sub_23037A22C();
  v25 = sub_23037A574();
  sub_2302FD540(v3, &qword_25405A298);
  if ((v25 & 1) != 0)
  {
    v26 = v39;
    v27 = (uint64_t)&v12[*(int *)(v39 + 48)];
    OUTLINED_FUNCTION_39_7((uint64_t)v12, (uint64_t)v23);
    OUTLINED_FUNCTION_39_7(v27, v20);
    v28 = v9 + *(int *)(v26 + 48);
    v29 = *(void (**)(uint64_t, char *, uint64_t))(v17 + 16);
    v29(v9, v12, v16);
    v29(v28, (char *)v27, v16);
    v30 = v37;
    OUTLINED_FUNCTION_39_7(v37, v9);
    v31 = *(void (**)(uint64_t))(v17 + 8);
    v32 = OUTLINED_FUNCTION_20_1();
    v31(v32);
    v33 = v9 + *(int *)(v26 + 48);
    OUTLINED_FUNCTION_39_7(v9, (uint64_t)v12);
    OUTLINED_FUNCTION_39_7(v33, v27);
    OUTLINED_FUNCTION_39_7(v30 + *(int *)(v38 + 36), v33);
    ((void (*)(uint64_t, uint64_t))v31)(v9, v16);
    v34 = v30;
    v5 = v36;
LABEL_5:
    sub_2302FD2F4(v34, v5, &qword_25405A298);
    v35 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
    sub_2302FD2F4(v40, v5 + *(int *)(v35 + 20), &qword_25405B4C8);
    *(_BYTE *)(v5 + *(int *)(v35 + 24)) = v41 & 1;
    OUTLINED_FUNCTION_0_2();
    return;
  }
  __break(1u);
}

void RunningClockComponentsFormatter.LiveClockComponents.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  OUTLINED_FUNCTION_9_0();
  v4 = v0;
  v5 = OUTLINED_FUNCTION_43_0();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900];
  OUTLINED_FUNCTION_44_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_15_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_29_0();
  sub_2302ED798(&qword_255E582A8, v6, MEMORY[0x24BDCE930]);
  OUTLINED_FUNCTION_63_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
  OUTLINED_FUNCTION_63_7();
  v9 = OUTLINED_FUNCTION_78_4();
  sub_2302FD2B4(v4 + *(int *)(v9 + 20), v2, &qword_25405B4C8);
  OUTLINED_FUNCTION_27_8(v2);
  if (v10)
  {
    OUTLINED_FUNCTION_29_1();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1, v2, v5);
    OUTLINED_FUNCTION_29_1();
    OUTLINED_FUNCTION_63_7();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v5);
  }
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_0_2();
}

void static RunningClockComponentsFormatter.LiveClockComponents.== infix(_:_:)()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  _QWORD v25[3];
  uint64_t v26;

  OUTLINED_FUNCTION_9_0();
  v4 = v3;
  v6 = v5;
  v7 = OUTLINED_FUNCTION_43_0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_15_0();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E582B0);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_18_10();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v25 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v25 - v16;
  if ((sub_23036819C(v6, v4) & 1) != 0)
  {
    v26 = v8;
    v18 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
    v19 = *(int *)(v18 + 20);
    v25[1] = v6;
    OUTLINED_FUNCTION_52_7(v6 + v19, (uint64_t)v17);
    v25[0] = v18;
    v20 = *(int *)(v18 + 20);
    v25[2] = v4;
    OUTLINED_FUNCTION_52_7(v4 + v20, (uint64_t)v15);
    v21 = v0 + *(int *)(v9 + 48);
    OUTLINED_FUNCTION_52_7((uint64_t)v17, v0);
    OUTLINED_FUNCTION_52_7((uint64_t)v15, v21);
    OUTLINED_FUNCTION_65_5(v0);
    if (!v22)
    {
      sub_2302FD2B4(v0, v2, &qword_25405B4C8);
      OUTLINED_FUNCTION_65_5(v21);
      if (!v22)
      {
        v23 = v26;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 32))(v1, v21, v7);
        sub_2302ED798(&qword_255E582B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
        sub_23037A58C();
        v24 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
        v24(v1, v7);
        OUTLINED_FUNCTION_124((uint64_t)v15);
        OUTLINED_FUNCTION_124((uint64_t)v17);
        v24(v2, v7);
        OUTLINED_FUNCTION_124(v0);
        goto LABEL_11;
      }
      OUTLINED_FUNCTION_87_0((uint64_t)v15);
      OUTLINED_FUNCTION_87_0((uint64_t)v17);
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v2, v7);
LABEL_10:
      sub_2302FD540(v0, &qword_255E582B0);
      goto LABEL_11;
    }
    OUTLINED_FUNCTION_124((uint64_t)v15);
    OUTLINED_FUNCTION_124((uint64_t)v17);
    OUTLINED_FUNCTION_65_5(v21);
    if (!v22)
      goto LABEL_10;
    sub_2302FD540(v0, &qword_25405B4C8);
  }
LABEL_11:
  OUTLINED_FUNCTION_0_2();
}

uint64_t sub_23036819C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char v10;
  char v11;
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v13 - v8;
  sub_23037A238();
  sub_2302ED798(&qword_255E582B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
  v10 = sub_23037A58C();
  sub_2302FD2B4(a1, (uint64_t)v9, &qword_25405A298);
  sub_2302FD2B4(a2, (uint64_t)v7, &qword_25405A298);
  if ((v10 & 1) != 0)
    v11 = sub_23037A58C();
  else
    v11 = 0;
  sub_2302FD540((uint64_t)v7, &qword_25405A298);
  sub_2302FD540((uint64_t)v9, &qword_25405A298);
  return v11 & 1;
}

uint64_t sub_2303682EC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v8;

  v2 = a1 == 0x65746E4965746164 && a2 == 0xEC0000006C617672;
  if (v2 || (sub_23037AE8C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x74416573756170 && a2 == 0xE700000000000000;
    if (v6 || (sub_23037AE8C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x776F64746E756F63 && a2 == 0xE90000000000006ELL)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = sub_23037AE8C();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_23036845C(char a1)
{
  if (!a1)
    return 0x65746E4965746164;
  if (a1 == 1)
    return 0x74416573756170;
  return 0x776F64746E756F63;
}

uint64_t sub_2303684C4()
{
  char *v0;

  return sub_23036845C(*v0);
}

uint64_t sub_2303684CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2303682EC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2303684F0()
{
  sub_23036CCA8();
  return sub_23037B00C();
}

uint64_t sub_230368518()
{
  sub_23036CCA8();
  return sub_23037B018();
}

void RunningClockComponentsFormatter.LiveClockComponents.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A168);
  OUTLINED_FUNCTION_36_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_12();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23036CCA8();
  OUTLINED_FUNCTION_17_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
  sub_23036CCE4(&qword_255E5A178);
  sub_23037AE14();
  if (!v1)
  {
    OUTLINED_FUNCTION_78_4();
    sub_23037A238();
    sub_2302ED798(&qword_25405AD50, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_23037ADD8();
    sub_23037ADF0();
  }
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v5);
  OUTLINED_FUNCTION_22_2();
}

void RunningClockComponentsFormatter.LiveClockComponents.hashValue.getter()
{
  sub_2302FB728((void (*)(_BYTE *))RunningClockComponentsFormatter.LiveClockComponents.hash(into:));
}

void RunningClockComponentsFormatter.LiveClockComponents.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
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
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18[2];
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;

  OUTLINED_FUNCTION_50();
  v22 = v0;
  v4 = v3;
  v18[0] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_78_0(v10, v18[0]);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A180);
  MEMORY[0x24BDAC7A8](v19);
  v11 = OUTLINED_FUNCTION_120_0();
  v12 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(v11);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_29_0();
  v14 = v4[3];
  v21 = v4;
  __swift_project_boxed_opaque_existential_1(v4, v14);
  sub_23036CCA8();
  v20 = v2;
  v15 = v22;
  sub_23037AFD0();
  if (v15)
  {
    OUTLINED_FUNCTION_96_2();
  }
  else
  {
    sub_23036CCE4(&qword_255E5A188);
    v16 = v18[1];
    sub_23037AD78();
    sub_2302FD2F4(v16, v1, &qword_25405A298);
    sub_23037A238();
    sub_2302ED798(&qword_25405B540, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    sub_23037AD3C();
    sub_2302FD2F4((uint64_t)v8, v1 + *(int *)(v12 + 20), &qword_25405B4C8);
    v17 = sub_23037AD54();
    OUTLINED_FUNCTION_31_9();
    *(_BYTE *)(v1 + *(int *)(v12 + 24)) = v17 & 1;
    OUTLINED_FUNCTION_89_3(v1);
    OUTLINED_FUNCTION_96_2();
    sub_2302F6DC8(v1, type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents);
  }
  OUTLINED_FUNCTION_4();
}

void sub_230368984()
{
  RunningClockComponentsFormatter.LiveClockComponents.init(from:)();
}

void sub_230368998(_QWORD *a1)
{
  RunningClockComponentsFormatter.LiveClockComponents.encode(to:)(a1);
}

void sub_2303689B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_230369B98(a1, a2, a3, (void (*)(_BYTE *))RunningClockComponentsFormatter.LiveClockComponents.hash(into:));
}

void RunningClockComponentsFormatter.FormattedComponents.prefix.getter()
{
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_3();
}

void RunningClockComponentsFormatter.FormattedComponents.suffix.getter()
{
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_3();
}

void RunningClockComponentsFormatter.FormattedComponents.clock.getter()
{
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_3();
}

void RunningClockComponentsFormatter.FormattedComponents.headerTitle.getter()
{
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_3();
}

void RunningClockComponentsFormatter.FormattedComponents.liveClock.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = type metadata accessor for RunningClockComponentsFormatter.FormattedComponents(0);
  OUTLINED_FUNCTION_99_4(v0 + *(int *)(v1 + 32), v2, &qword_25405A280);
  OUTLINED_FUNCTION_3();
}

void RunningClockComponentsFormatter.FormattedComponents.init(prefix:suffix:clock:liveClock:headerTitle:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10)
{
  uint64_t v13;

  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  v13 = type metadata accessor for RunningClockComponentsFormatter.FormattedComponents(0);
  sub_2302FD2F4(a7, (uint64_t)a9 + *(int *)(v13 + 32), &qword_25405A280);
  a9[6] = a8;
  a9[7] = a10;
  OUTLINED_FUNCTION_13_0();
}

double sub_230368AD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double result;

  v0 = type metadata accessor for RunningClockComponentsFormatter.FormattedComponents(0);
  __swift_allocate_value_buffer(v0, qword_255E6F930);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255E6F930);
  v2 = v1 + *(int *)(v0 + 32);
  v3 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v3);
  result = 0.0;
  *(_OWORD *)v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_QWORD *)(v1 + 32) = 0;
  *(_QWORD *)(v1 + 40) = 0xE000000000000000;
  *(_QWORD *)(v1 + 48) = 0;
  *(_QWORD *)(v1 + 56) = 0;
  return result;
}

void RunningClockComponentsFormatter.DataSource.sport.getter()
{
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_3();
}

uint64_t RunningClockComponentsFormatter.DataSource.isFinal.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t RunningClockComponentsFormatter.DataSource.isHalftime.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t RunningClockComponentsFormatter.DataSource.isPeriodEnd.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 18);
}

uint64_t RunningClockComponentsFormatter.DataSource.periodIndex.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

void RunningClockComponentsFormatter.DataSource.periodType.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_66_4(a1);
}

void RunningClockComponentsFormatter.DataSource.periodSubdivision.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_66_4(a1);
}

void RunningClockComponentsFormatter.DataSource.progressStatus.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_66_4(a1);
}

void RunningClockComponentsFormatter.DataSource.liveClockComponents.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_80_0();
  OUTLINED_FUNCTION_99_4(v0 + *(int *)(v1 + 48), v2, &qword_25405A280);
  OUTLINED_FUNCTION_3();
}

uint64_t RunningClockComponentsFormatter.DataSource.projectedClockValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(OUTLINED_FUNCTION_80_0() + 52));
}

uint64_t RunningClockComponentsFormatter.DataSource.additionalMinutes.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(OUTLINED_FUNCTION_80_0() + 56));
}

uint64_t RunningClockComponentsFormatter.DataSource.competitors.getter()
{
  OUTLINED_FUNCTION_80_0();
  return swift_bridgeObjectRetain();
}

uint64_t RunningClockComponentsFormatter.DataSource.hash(into:)()
{
  _BYTE *v0;
  uint64_t v1;

  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_20_1();
  sub_23037A64C();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_29_1();
  sub_23037AF94();
  sub_23037AF94();
  if (v0[32] == 1)
  {
    OUTLINED_FUNCTION_29_1();
  }
  else
  {
    OUTLINED_FUNCTION_29_1();
    sub_23037AF88();
  }
  if (v0[33] == 10)
  {
    OUTLINED_FUNCTION_29_1();
  }
  else
  {
    OUTLINED_FUNCTION_29_1();
    sub_2302D6AE8();
  }
  if (v0[34] == 6)
  {
    OUTLINED_FUNCTION_29_1();
  }
  else
  {
    OUTLINED_FUNCTION_29_1();
    sub_2302D6724();
  }
  sub_2302D69E8();
  v1 = type metadata accessor for RunningClockComponentsFormatter.DataSource(0);
  sub_23036C974();
  sub_23037AF88();
  if (v0[*(int *)(v1 + 56) + 8] == 1)
  {
    OUTLINED_FUNCTION_29_1();
  }
  else
  {
    OUTLINED_FUNCTION_29_1();
    sub_23037AF88();
  }
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_20_1();
  sub_2302DA9F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_230368DA8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  char v13;

  v2 = a1 == 0x74726F7073 && a2 == 0xE500000000000000;
  if (v2 || (sub_23037AE8C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6C616E69467369 && a2 == 0xE700000000000000;
    if (v6 || (sub_23037AE8C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6974666C61487369 && a2 == 0xEA0000000000656DLL;
      if (v7 || (sub_23037AE8C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x646F697265507369 && a2 == 0xEB00000000646E45;
        if (v8 || (sub_23037AE8C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x6E49646F69726570 && a2 == 0xEB00000000786564;
          if (v9 || (sub_23037AE8C() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            v10 = a1 == 0x7954646F69726570 && a2 == 0xEA00000000006570;
            if (v10 || (sub_23037AE8C() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else if (a1 == 0xD000000000000011 && a2 == 0x800000023038C780 || (sub_23037AE8C() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              v11 = a1 == 0x73736572676F7270 && a2 == 0xEE00737574617453;
              if (v11 || (sub_23037AE8C() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 7;
              }
              else if (a1 == 0xD000000000000013 && a2 == 0x800000023038C7A0 || (sub_23037AE8C() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 8;
              }
              else if (a1 == 0xD000000000000013 && a2 == 0x800000023038C7C0 || (sub_23037AE8C() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 9;
              }
              else if (a1 == 0xD000000000000011 && a2 == 0x800000023038C7E0 || (sub_23037AE8C() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 10;
              }
              else if (a1 == 0x74697465706D6F63 && a2 == 0xEB0000000073726FLL)
              {
                swift_bridgeObjectRelease();
                return 11;
              }
              else
              {
                v13 = sub_23037AE8C();
                swift_bridgeObjectRelease();
                if ((v13 & 1) != 0)
                  return 11;
                else
                  return 12;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_2303692B4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2303692E4 + 4 * byte_230388040[a1]))(0x74726F7073, 0xE500000000000000);
}

uint64_t sub_2303692E4()
{
  return 0x6C616E69467369;
}

uint64_t sub_2303692FC()
{
  return 0x6974666C61487369;
}

uint64_t sub_230369318()
{
  return 0x646F697265507369;
}

uint64_t sub_230369338()
{
  return 0x6E49646F69726570;
}

uint64_t sub_230369358()
{
  return 0x7954646F69726570;
}

unint64_t sub_230369378()
{
  return 0xD000000000000011;
}

uint64_t sub_2303693FC()
{
  return 0x74697465706D6F63;
}

uint64_t sub_23036941C()
{
  unsigned __int8 *v0;

  return sub_2303692B4(*v0);
}

uint64_t sub_230369424@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_230368DA8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_230369448()
{
  sub_23036CD54();
  return sub_23037B00C();
}

uint64_t sub_230369470()
{
  sub_23036CD54();
  return sub_23037B018();
}

void RunningClockComponentsFormatter.DataSource.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A190);
  OUTLINED_FUNCTION_36_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_15_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23036CD54();
  OUTLINED_FUNCTION_17_3();
  sub_23037ADE4();
  if (!v1)
  {
    OUTLINED_FUNCTION_12_5(1);
    OUTLINED_FUNCTION_12_5(2);
    OUTLINED_FUNCTION_12_5(3);
    OUTLINED_FUNCTION_44_8(4);
    sub_2303495D0();
    OUTLINED_FUNCTION_41_10();
    sub_230349630();
    OUTLINED_FUNCTION_41_10();
    sub_230347D88();
    OUTLINED_FUNCTION_88_0();
    type metadata accessor for RunningClockComponentsFormatter.DataSource(0);
    OUTLINED_FUNCTION_78_4();
    sub_2302ED798(&qword_255E5A1A0, type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents, (uint64_t)&protocol conformance descriptor for RunningClockComponentsFormatter.LiveClockComponents);
    sub_23037ADD8();
    sub_23037AE08();
    OUTLINED_FUNCTION_44_8(10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25405BBB8);
    sub_23036CD90(&qword_25405B478);
    OUTLINED_FUNCTION_88_0();
  }
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v5);
  OUTLINED_FUNCTION_22_2();
}

void RunningClockComponentsFormatter.DataSource.hashValue.getter()
{
  sub_2302FB728((void (*)(_BYTE *))RunningClockComponentsFormatter.DataSource.hash(into:));
}

void RunningClockComponentsFormatter.DataSource.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  OUTLINED_FUNCTION_50();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_29_0();
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A1A8);
  OUTLINED_FUNCTION_44_1();
  MEMORY[0x24BDAC7A8](v7);
  v8 = OUTLINED_FUNCTION_120_0();
  v16 = (int *)type metadata accessor for RunningClockComponentsFormatter.DataSource(v8);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_42_0();
  v18 = v10;
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_23036CD54();
  sub_23037AFD0();
  if (v0)
  {
    OUTLINED_FUNCTION_23_0();
  }
  else
  {
    OUTLINED_FUNCTION_67_7();
    *(_QWORD *)v18 = sub_23037AD48();
    *(_QWORD *)(v18 + 8) = v11;
    *(_BYTE *)(v18 + 16) = OUTLINED_FUNCTION_14_9(1) & 1;
    *(_BYTE *)(v18 + 17) = OUTLINED_FUNCTION_14_9(2) & 1;
    *(_BYTE *)(v18 + 18) = OUTLINED_FUNCTION_14_9(3) & 1;
    OUTLINED_FUNCTION_67_7();
    *(_QWORD *)(v18 + 24) = sub_23037AD30();
    *(_BYTE *)(v18 + 32) = v12 & 1;
    sub_230324F04();
    OUTLINED_FUNCTION_37_8();
    *(_BYTE *)(v18 + 33) = 4;
    sub_230324F40();
    OUTLINED_FUNCTION_37_8();
    *(_BYTE *)(v18 + 34) = 4;
    sub_230347BB4();
    OUTLINED_FUNCTION_86_3();
    *(_BYTE *)(v18 + 35) = 4;
    OUTLINED_FUNCTION_78_4();
    sub_2302ED798(&qword_255E5A1B0, type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents, (uint64_t)&protocol conformance descriptor for RunningClockComponentsFormatter.LiveClockComponents);
    sub_23037AD3C();
    sub_2302FD2F4(v1, v18 + v16[12], &qword_25405A280);
    OUTLINED_FUNCTION_67_7();
    *(_QWORD *)(v18 + v16[13]) = sub_23037AD6C();
    LOBYTE(v19) = 10;
    v13 = sub_23037AD30();
    v14 = v18 + v16[14];
    *(_QWORD *)v14 = v13;
    *(_BYTE *)(v14 + 8) = v15 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25405BBB8);
    sub_23036CD90(&qword_25405BBC0);
    OUTLINED_FUNCTION_86_3();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v17);
    *(_QWORD *)(v18 + v16[15]) = v19;
    OUTLINED_FUNCTION_89_3(v18);
    OUTLINED_FUNCTION_23_0();
    sub_2302F6DC8(v18, type metadata accessor for RunningClockComponentsFormatter.DataSource);
  }
  OUTLINED_FUNCTION_4();
}

void sub_230369B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_230369B98(a1, a2, a3, (void (*)(_BYTE *))RunningClockComponentsFormatter.DataSource.hash(into:));
}

void sub_230369B98(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_BYTE *))
{
  _BYTE v5[72];

  sub_23037AF7C();
  a4(v5);
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_20();
}

void sub_230369BC8()
{
  RunningClockComponentsFormatter.DataSource.init(from:)();
}

void sub_230369BDC(_QWORD *a1)
{
  RunningClockComponentsFormatter.DataSource.encode(to:)(a1);
}

SportsKit::RunningClockComponentsFormatter::StyleOptions::ShootoutStyle_optional __swiftcall RunningClockComponentsFormatter.StyleOptions.ShootoutStyle.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 4;
  if ((unint64_t)rawValue < 4)
    v2 = rawValue;
  *v1 = v2;
  return (SportsKit::RunningClockComponentsFormatter::StyleOptions::ShootoutStyle_optional)rawValue;
}

uint64_t RunningClockComponentsFormatter.StyleOptions.ShootoutStyle.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

void sub_230369C10()
{
  sub_23033204C();
}

void sub_230369C18()
{
  sub_2302D69C8();
}

void sub_230369C20()
{
  sub_2303325B0();
}

SportsKit::RunningClockComponentsFormatter::StyleOptions::ShootoutStyle_optional sub_230369C28(Swift::Int *a1)
{
  return RunningClockComponentsFormatter.StyleOptions.ShootoutStyle.init(rawValue:)(*a1);
}

void sub_230369C30(uint64_t *a1@<X8>)
{
  *a1 = RunningClockComponentsFormatter.StyleOptions.ShootoutStyle.rawValue.getter();
  OUTLINED_FUNCTION_3();
}

uint64_t sub_230369C50()
{
  sub_23036F928();
  return sub_23037A724();
}

uint64_t sub_230369CAC()
{
  sub_23036F928();
  return sub_23037A70C();
}

void static RunningClockComponentsFormatter.StyleOptions.default.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void static RunningClockComponentsFormatter.StyleOptions.defaultShootoutStyle.getter()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_70_4();
  OUTLINED_FUNCTION_72();
}

void static RunningClockComponentsFormatter.StyleOptions.defaultShootoutStyle.setter(char *a1)
{
  char v1;

  v1 = *a1;
  OUTLINED_FUNCTION_27();
  byte_255E5A158 = v1;
  OUTLINED_FUNCTION_72();
}

void static RunningClockComponentsFormatter.StyleOptions.defaultShootoutStyle.modify()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_3();
}

void static RunningClockComponentsFormatter.StyleOptions.abbreviatedShootoutStyle.getter()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_70_4();
  OUTLINED_FUNCTION_72();
}

void static RunningClockComponentsFormatter.StyleOptions.abbreviatedShootoutStyle.setter(char *a1)
{
  char v1;

  v1 = *a1;
  OUTLINED_FUNCTION_27();
  byte_255E5A159 = v1;
  OUTLINED_FUNCTION_72();
}

void static RunningClockComponentsFormatter.StyleOptions.abbreviatedShootoutStyle.modify()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_3();
}

void static RunningClockComponentsFormatter.StyleOptions.shortShootoutStyle.getter()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_70_4();
  OUTLINED_FUNCTION_72();
}

void static RunningClockComponentsFormatter.StyleOptions.shortShootoutStyle.setter(char *a1)
{
  char v1;

  v1 = *a1;
  OUTLINED_FUNCTION_27();
  byte_255E5A15A = v1;
  OUTLINED_FUNCTION_72();
}

void static RunningClockComponentsFormatter.StyleOptions.shortShootoutStyle.modify()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_3();
}

void static RunningClockComponentsFormatter.StyleOptions.fullShootoutStyle.getter()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_70_4();
  OUTLINED_FUNCTION_72();
}

void static RunningClockComponentsFormatter.StyleOptions.fullShootoutStyle.setter(char *a1)
{
  char v1;

  v1 = *a1;
  OUTLINED_FUNCTION_27();
  byte_255E5A15B = v1;
  OUTLINED_FUNCTION_72();
}

void static RunningClockComponentsFormatter.StyleOptions.fullShootoutStyle.modify()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_3();
}

void RunningClockComponentsFormatter.StyleOptions.shootoutStyle.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_66_4(a1);
}

_BYTE *RunningClockComponentsFormatter.StyleOptions.shootoutStyle.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*RunningClockComponentsFormatter.StyleOptions.shootoutStyle.modify())()
{
  return nullsub_1;
}

void RunningClockComponentsFormatter.StyleOptions.hash(into:)()
{
  sub_23037AF88();
  OUTLINED_FUNCTION_3();
}

BOOL static RunningClockComponentsFormatter.StyleOptions.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_230369FFC(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x74756F746F6F6873 && a2 == 0xED0000656C797453)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23037AE8C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23036A0A4()
{
  return 0x74756F746F6F6873;
}

uint64_t sub_23036A0CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_230369FFC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23036A0F4()
{
  sub_23036CDEC();
  return sub_23037B00C();
}

uint64_t sub_23036A11C()
{
  sub_23036CDEC();
  return sub_23037B018();
}

void RunningClockComponentsFormatter.StyleOptions.encode(to:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_50();
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A1B8);
  OUTLINED_FUNCTION_36_1();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_1_2();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_23036CDEC();
  OUTLINED_FUNCTION_17_3();
  sub_23036CE28();
  sub_23037AE14();
  OUTLINED_FUNCTION_98_3(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  OUTLINED_FUNCTION_4();
}

void RunningClockComponentsFormatter.StyleOptions.hashValue.getter()
{
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_120();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_20();
}

void RunningClockComponentsFormatter.StyleOptions.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _BYTE *v17;
  _BYTE *v18;
  uint64_t v19;

  OUTLINED_FUNCTION_50();
  v16 = v15;
  v18 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A1D0);
  OUTLINED_FUNCTION_44_1();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_1_2();
  __swift_project_boxed_opaque_existential_1(v16, v16[3]);
  sub_23036CDEC();
  sub_23037AFD0();
  if (!v13)
  {
    sub_23036CE64();
    sub_23037AD78();
    OUTLINED_FUNCTION_98_3(*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8));
    *v18 = a13;
  }
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_4();
}

void sub_23036A304()
{
  sub_23037AF7C();
  OUTLINED_FUNCTION_120();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_20();
}

void sub_23036A330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;
  uint64_t vars8;

  RunningClockComponentsFormatter.StyleOptions.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8, SWORD2(vars8), SBYTE6(vars8), SHIBYTE(vars8));
}

void sub_23036A344()
{
  RunningClockComponentsFormatter.StyleOptions.encode(to:)();
}

void RunningClockComponentsFormatter.styleOptions.getter()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_70_4();
  OUTLINED_FUNCTION_72();
}

uint64_t RunningClockComponentsFormatter.styleOptions.setter(char *a1)
{
  uint64_t v1;
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC9SportsKit31RunningClockComponentsFormatter_styleOptions);
  result = OUTLINED_FUNCTION_27();
  *v3 = v2;
  return result;
}

void RunningClockComponentsFormatter.styleOptions.modify()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_3();
}

void RunningClockComponentsFormatter.init(localizationProvider:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
  OUTLINED_FUNCTION_90_3();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_21_9(v3, v4, v5);
  OUTLINED_FUNCTION_64_5();
  __swift_destroy_boxed_opaque_existential_1(a1);
  OUTLINED_FUNCTION_23();
}

id sub_23036A478()
{
  void *v0;

  objc_msgSend(v0, sel_setUnitsStyle_, 0);
  objc_msgSend(v0, sel_setAllowedUnits_, 192);
  return objc_msgSend(v0, sel_setZeroFormattingBehavior_, 0x10000);
}

id sub_23036A4C0(void *a1)
{
  _BYTE *v1;
  objc_class *ObjectType;
  char *v4;
  id v5;
  id v6;
  id v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v1[OBJC_IVAR____TtC9SportsKit31RunningClockComponentsFormatter_styleOptions] = 0;
  v4 = &v1[OBJC_IVAR____TtC9SportsKit31RunningClockComponentsFormatter_localizationProvider];
  *((_QWORD *)v4 + 3) = &type metadata for RunningClockDefaultLocalization;
  *((_QWORD *)v4 + 4) = &protocol witness table for RunningClockDefaultLocalization;
  v9.receiver = v1;
  v9.super_class = ObjectType;
  v5 = objc_msgSendSuper2(&v9, sel_initWithCoder_, a1);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_23036A478();

  }
  return v6;
}

void RunningClockComponentsFormatter.formattedComponents(dataSource:)()
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
  void *v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_9_0();
  v2 = v1;
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(qword_25405B3A8);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_1_2();
  type metadata accessor for RunningClockComponentsFormatter.DataSource(0);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_98();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_94_1();
  v8 = *(_QWORD *)v2;
  v9 = *(void **)(v2 + 8);
  swift_bridgeObjectRetain();
  v10._countAndFlagsBits = v8;
  v10._object = v9;
  Sport.init(rawValue:)(v10);
  LODWORD(v8) = *(unsigned __int8 *)(v2 + 16);
  sub_2302F6D9C(v2, v0, type metadata accessor for RunningClockComponentsFormatter.DataSource);
  if ((_DWORD)v8 != 1)
  {
    OUTLINED_FUNCTION_87_3(v11, type metadata accessor for RunningClockComponentsFormatter.DataSource);
    goto LABEL_5;
  }
  v12 = *(unsigned __int8 *)(v0 + 33);
  if ((_DWORD)v12 != 10)
  {
    sub_2302E4DB8();
    v15 = v14;
    OUTLINED_FUNCTION_87_3(v14, type metadata accessor for RunningClockComponentsFormatter.DataSource);
    if ((v15 & 1) == 0)
      goto LABEL_7;
LABEL_5:
    OUTLINED_FUNCTION_132();
    __asm { BR              X9 }
  }
  OUTLINED_FUNCTION_87_3(v12, type metadata accessor for RunningClockComponentsFormatter.DataSource);
LABEL_7:
  v16 = OUTLINED_FUNCTION_48_4(3);
  v18 = v17;
  type metadata accessor for RunningClockComponentsFormatter.FormattedComponents(0);
  OUTLINED_FUNCTION_13_10();
  *(_OWORD *)v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  *(_QWORD *)(v4 + 32) = v16;
  *(_QWORD *)(v4 + 40) = v18;
  *(_QWORD *)(v4 + 48) = 0;
  *(_QWORD *)(v4 + 56) = 0;
  OUTLINED_FUNCTION_0_2();
}

void sub_23036AB68()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v4 = OUTLINED_FUNCTION_40();
  v5 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_83_4(v5, v6, type metadata accessor for RunningClockComponentsFormatter.DataSource);
  if ((v4 & 1) != 0)
  {
    v7 = *(_QWORD *)(v1 + 24);
    v8 = *(_BYTE *)(v1 + 32);
    sub_2302F6DC8(v1, type metadata accessor for RunningClockComponentsFormatter.DataSource);
    if ((v8 & 1) == 0 && v7 == 2)
    {
      v9 = 2;
LABEL_7:
      OUTLINED_FUNCTION_48_4(v9);
      type metadata accessor for RunningClockComponentsFormatter.FormattedComponents(0);
      OUTLINED_FUNCTION_13_10();
      *v0 = v3;
      v0[1] = v2;
      v0[2] = 0;
      v0[3] = 0;
      JUMPOUT(0x23036AA80);
    }
  }
  else
  {
    sub_2302F6DC8(v1, type metadata accessor for RunningClockComponentsFormatter.DataSource);
  }
  v9 = 4;
  goto LABEL_7;
}

void sub_23036ABFC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_40(0x616274656B736162, 0xEA00000000006C6CLL, 0x726563636F73, 0xE600000000000000);
  v4 = swift_bridgeObjectRelease(0xEA00000000006C6CLL);
  OUTLINED_FUNCTION_83_4(v4);
  v5 = sub_2302F6DC8(v1, type metadata accessor for RunningClockComponentsFormatter.DataSource);
  OUTLINED_FUNCTION_48_4(v5);
  type metadata accessor for RunningClockComponentsFormatter.FormattedComponents(0);
  OUTLINED_FUNCTION_13_10();
  *v0 = v3;
  v0[1] = v2;
  v0[2] = 0;
  v0[3] = 0;
  JUMPOUT(0x23036AA80);
}

void sub_23036AC1C()
{
  JUMPOUT(0x23036AC8CLL);
}

void sub_23036AC28()
{
  JUMPOUT(0x23036AC8CLL);
}

void sub_23036AC38()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_40(0x7962677572, 0xE500000000000000, 0x726563636F73, 0xE600000000000000);
  v4 = swift_bridgeObjectRelease(0xE500000000000000);
  OUTLINED_FUNCTION_83_4(v4);
  v5 = sub_2302F6DC8(v1, type metadata accessor for RunningClockComponentsFormatter.DataSource);
  OUTLINED_FUNCTION_48_4(v5);
  type metadata accessor for RunningClockComponentsFormatter.FormattedComponents(0);
  OUTLINED_FUNCTION_13_10();
  *v0 = v3;
  v0[1] = v2;
  v0[2] = 0;
  v0[3] = 0;
  JUMPOUT(0x23036AA80);
}

void sub_23036AC4C()
{
  uint64_t v0;
  uint64_t v1;

  v0 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_83_4(v0, v1, type metadata accessor for RunningClockComponentsFormatter.DataSource);
  JUMPOUT(0x23036ACC0);
}

uint64_t sub_23036AD2C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  v6 = *((_BYTE *)a1 + 32);
  v7 = v1 + OBJC_IVAR____TtC9SportsKit31RunningClockComponentsFormatter_localizationProvider;
  swift_beginAccess();
  sub_2302E00E4(v7, (uint64_t)v19);
  v8 = v20;
  v9 = v21;
  __swift_project_boxed_opaque_existential_1(v19, v20);
  v14 = v2;
  v15 = v3;
  v16 = v4;
  v17 = v5;
  v18 = v6;
  v10 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v9 + 8))(&v14, v8, v9);
  if (!v11)
  {
    v14 = v2;
    v15 = v3;
    v16 = v4;
    v17 = v5;
    v18 = v6;
    sub_2302F3310();
  }
  v12 = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  return v12;
}

double sub_23036AE00@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  double result;
  int v6;
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
  char v19;

  if ((*(_BYTE *)(a1 + 32) & 1) == 0)
  {
    v6 = *(unsigned __int8 *)(a1 + 34);
    if ((v6 - 2) < 2)
    {
      v15 = *(_QWORD *)(a1 + 24);
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 5;
      v15 = sub_23036AD2C(&v15);
      v16 = v9;
      v17 = 0;
      v18 = 0;
      v19 = 1;
    }
    else
    {
      if (v6 != 1 && v6 != 4)
        goto LABEL_2;
      v15 = *(_QWORD *)(a1 + 24);
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 5;
      v15 = sub_23036AD2C(&v15);
      v16 = v8;
      v17 = 0;
      v18 = 0;
      v19 = 0;
    }
    v10 = sub_23036AD2C(&v15);
    v12 = v11;
    swift_bridgeObjectRelease();
    v13 = a2 + *(int *)(type metadata accessor for RunningClockComponentsFormatter.FormattedComponents(0) + 32);
    v14 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
    __swift_storeEnumTagSinglePayload(v13, 1, 1, v14);
    result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_QWORD *)(a2 + 32) = v10;
    *(_QWORD *)(a2 + 40) = v12;
    *(_QWORD *)(a2 + 48) = 0;
    *(_QWORD *)(a2 + 56) = 0;
    return result;
  }
LABEL_2:
  if (qword_255E576D8 != -1)
    swift_once();
  v3 = type metadata accessor for RunningClockComponentsFormatter.FormattedComponents(0);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_255E6F930);
  sub_2302F6D9C(v4, a2, type metadata accessor for RunningClockComponentsFormatter.FormattedComponents);
  return result;
}

uint64_t sub_23036AF54@<X0>(unsigned __int8 *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  int v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[24];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;

  v5 = type metadata accessor for RunningClockComponentsFormatter.DataSource(0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = &v36[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v10 = &v36[-v9];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
  MEMORY[0x24BDAC7A8](v11);
  if (a1[33] != 10)
  {
    sub_2302E4DB8();
    if ((v15 & 1) != 0)
    {
      sub_2303536B4(*(_QWORD *)&a1[*(int *)(v5 + 60)]);
      v37 = 8;
      v38 = 0;
      v39 = 0;
      v40 = 0;
      v41 = 7;
      sub_23036AD2C(&v37);
      swift_bridgeObjectRelease();
      v16 = v2 + OBJC_IVAR____TtC9SportsKit31RunningClockComponentsFormatter_styleOptions;
      swift_beginAccess();
      __asm { BR              X10 }
    }
    sub_2302E4DB8();
    if ((v17 & 1) != 0)
    {
      v18 = a1[17];
      sub_2302F6D9C((uint64_t)a1, (uint64_t)v10, type metadata accessor for RunningClockComponentsFormatter.DataSource);
      if (v18 == 1)
      {
        v19 = *((_QWORD *)v10 + 3);
        v20 = v10[32];
        sub_2302F6DC8((uint64_t)v10, type metadata accessor for RunningClockComponentsFormatter.DataSource);
        if ((v20 & 1) == 0 && v19 == 1)
        {
          v37 = 7;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 7;
          v21 = sub_23036AD2C(&v37);
          v23 = v22;
          v24 = 1;
LABEL_16:
          v37 = v24;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 7;
          v30 = sub_23036AD2C(&v37);
          v32 = v31;
          v33 = type metadata accessor for RunningClockComponentsFormatter.FormattedComponents(0);
          v34 = (uint64_t)a2 + *(int *)(v33 + 32);
          v35 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
          __swift_storeEnumTagSinglePayload(v34, 1, 1, v35);
          *a2 = v21;
          a2[1] = v23;
          a2[2] = 0;
          a2[3] = 0;
          a2[4] = v30;
          a2[5] = v32;
          a2[6] = 0;
          a2[7] = 0;
          v13 = (uint64_t)a2;
          v14 = 0;
          v12 = v33;
          return __swift_storeEnumTagSinglePayload(v13, v14, 1, v12);
        }
      }
      else
      {
        sub_2302F6DC8((uint64_t)v10, type metadata accessor for RunningClockComponentsFormatter.DataSource);
      }
      v26 = a1[18];
      sub_2302F6D9C((uint64_t)a1, (uint64_t)v8, type metadata accessor for RunningClockComponentsFormatter.DataSource);
      if (v26 == 1)
      {
        v27 = *((_QWORD *)v8 + 3);
        v28 = v8[32];
        sub_2302F6DC8((uint64_t)v8, type metadata accessor for RunningClockComponentsFormatter.DataSource);
        if ((v28 & 1) == 0 && v27 >= 2)
        {
          v37 = 7;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 7;
          v21 = sub_23036AD2C(&v37);
          v23 = v29;
          v24 = 2;
          goto LABEL_16;
        }
      }
      else
      {
        sub_2302F6DC8((uint64_t)v8, type metadata accessor for RunningClockComponentsFormatter.DataSource);
      }
    }
  }
  v12 = type metadata accessor for RunningClockComponentsFormatter.FormattedComponents(0);
  v13 = (uint64_t)a2;
  v14 = 1;
  return __swift_storeEnumTagSinglePayload(v13, v14, 1, v12);
}

void sub_23036B350(_BYTE *a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  uint64_t v4;
  char v5;

  v4 = *a4;
  if (*a1 != 10)
  {
    sub_2302E4DB8();
    if ((v5 & 1) != 0)
      __asm { BR              X9 }
  }
  __asm { BR              X9 }
}

void sub_23036B3F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  uint64_t v10;
  char v11;
  char v12;
  char v13;

  v13 = sub_23037AE8C();
  swift_bridgeObjectRelease();
  if ((v13 & 1) == 0)
  {
    a10 = v12;
    sub_23036B9D0(v10, v11, (uint64_t)&a10);
    JUMPOUT(0x23036B634);
  }
  JUMPOUT(0x23036B63CLL);
}

uint64_t sub_23036B4DC()
{
  uint64_t v0;
  int v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v2 = sub_23037AE8C();
  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
  {
    v10 = 7;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 7;
    return sub_23036AD2C(&v10);
  }
  if (v1 || v0 < 2)
  {
    v10 = 6;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 7;
    return sub_23036AD2C(&v10);
  }
  v10 = v0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 4;
  v3 = sub_23036AD2C(&v10);
  v5 = v4;
  v10 = 6;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 7;
  v6 = sub_23036AD2C(&v10);
  v10 = v3;
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v14 = 6;
  v8 = sub_23036AD2C(&v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_23036B530()
{
  uint64_t v0;
  int v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v2 = sub_23037AE8C(0x73696E6E6574, 0xE600000000000000, 0x726563636F73, 0xE600000000000000, 0);
  swift_bridgeObjectRelease(0xE600000000000000);
  if ((v2 & 1) != 0)
  {
    v11 = 7;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 7;
    return sub_23036AD2C(&v11);
  }
  if (v1 || v0 < 2)
  {
    v11 = 6;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 7;
    return sub_23036AD2C(&v11);
  }
  v11 = v0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 4;
  v3 = sub_23036AD2C(&v11);
  v5 = v4;
  v11 = 6;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 7;
  v6 = sub_23036AD2C(&v11);
  v8 = v7;
  v11 = v3;
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v15 = 6;
  v9 = sub_23036AD2C(&v11);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v5);
  return v9;
}

void sub_23036B544()
{
  JUMPOUT(0x23036B558);
}

void sub_23036B65C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BR              X10 }
}

uint64_t sub_23036B6A8()
{
  uint64_t v0;
  char v1;
  char v2;
  uint64_t result;

  v2 = sub_23037AE8C();
  swift_bridgeObjectRelease();
  result = 0;
  if ((v2 & 1) != 0 && (v1 & 1) == 0 && v0 >= 1)
  {
    sub_23037AE38();
    sub_23037A670();
    swift_bridgeObjectRelease();
    sub_23037A670();
    return 11048;
  }
  return result;
}

uint64_t sub_23036B7FC(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v10;

  v2 = v1;
  v3 = 808466992;
  v4 = objc_msgSend(v2, sel_stringFromTimeInterval_, (double)a1);
  if (v4)
  {
    v5 = v4;
    v6 = sub_23037A5C8();
    v8 = v7;

  }
  else
  {
    v8 = 0xE400000000000000;
    v6 = 808466992;
  }
  if (v6 != 808466992 || v8 != 0xE400000000000000)
  {
    if ((sub_23037AE8C() & 1) != 0 || (sub_23037A6D0() & 1) == 0)
    {
      return v6;
    }
    else
    {
      swift_bridgeObjectRetain();
      v10 = sub_23036B900(1uLL, v6, v8);
      v3 = MEMORY[0x2348B6D98](v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  return v3;
}

unint64_t sub_23036B900(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = sub_23037A664();
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
    {
      v7 = sub_23037A6F4();
      swift_bridgeObjectRelease();
      return v7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_23036B9D0(uint64_t a1, char a2, uint64_t a3)
{
  if ((a2 & 1) == 0)
    __asm { BR              X10 }
  return 0;
}

id RunningClockComponentsFormatter.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void RunningClockComponentsFormatter.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id RunningClockComponentsFormatter.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void SportingEventSubscription.createRunningClockDataSource(preferStaticClock:)()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id *v9;
  id v10;
  id v11;
  char v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void *v20;
  char *v21;
  id v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  char v28;
  uint64_t v29;
  int *v30;
  uint64_t v31;
  char v32;
  char v33;
  char v34;
  char v35;
  uint64_t v36;
  char v37;
  char v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  char v42;

  OUTLINED_FUNCTION_9_0();
  v3 = v2;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_67_1();
  v7 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_sport);
  v8 = *(void **)(v0 + OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_sport + 8);
  v9 = (id *)(v0 + OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_sportingEventDetails);
  OUTLINED_FUNCTION_27();
  v10 = *v9;
  swift_bridgeObjectRetain();
  v11 = v10;
  sub_23036C16C();
  v39 = v12;

  v13 = *v9;
  v40 = v7;
  v38 = sub_23036C420(v7, v8);

  v14 = *v9;
  v37 = sub_23036C2A4();

  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)((char *)*v9 + OBJC_IVAR____TtC9SportsKit13SportingEvent_clock)
                              + OBJC_IVAR____TtC9SportsKit25SportingEventCurrentClock_current)
                  + OBJC_IVAR____TtC9SportsKit18SportingEventClock_period);
  v36 = *(_QWORD *)(v15 + OBJC_IVAR____TtC9SportsKit24SportingEventClockPeriod__index);
  v35 = *(_BYTE *)(v15 + OBJC_IVAR____TtC9SportsKit24SportingEventClockPeriod__type);
  v34 = *(_BYTE *)(v15 + OBJC_IVAR____TtC9SportsKit24SportingEventClockPeriod__subdivision);
  v32 = *(_BYTE *)(v15 + OBJC_IVAR____TtC9SportsKit24SportingEventClockPeriod__index + 8);
  v33 = *((_BYTE *)*v9 + OBJC_IVAR____TtC9SportsKit13SportingEvent_progressStatus);
  if ((v3 & 1) != 0)
  {
    v16 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
    __swift_storeEnumTagSinglePayload(v1, 1, 1, v16);
  }
  else
  {
    sub_23036C554();
  }
  sub_230351B70();
  v18 = v17;
  v19 = *(char **)((char *)*v9 + OBJC_IVAR____TtC9SportsKit13SportingEvent_clock);
  v20 = *(void **)(*(_QWORD *)&v19[OBJC_IVAR____TtC9SportsKit25SportingEventCurrentClock_current]
                 + OBJC_IVAR____TtC9SportsKit18SportingEventClock_period);
  v21 = v19;
  v22 = v20;
  SportingEventCurrentClock.announcedAdditionalMinutesAndSeconds(for:)();
  v23 = v41;

  v24 = (char *)*v9;
  if (v42 == 1)
  {
    v25 = *(_QWORD *)(*(_QWORD *)&v24[OBJC_IVAR____TtC9SportsKit13SportingEvent_clock]
                    + OBJC_IVAR____TtC9SportsKit25SportingEventCurrentClock__total);
    if (v25 && (v26 = *(_QWORD *)(v25 + OBJC_IVAR____TtC9SportsKit18SportingEventClock__additional)) != 0)
    {
      v27 = (uint64_t *)(v26 + OBJC_IVAR____TtC9SportsKit18SportingEventClock__minutes);
      v23 = *v27;
      v28 = *((_BYTE *)v27 + 8);
    }
    else
    {
      v23 = 0;
      v28 = 1;
    }
  }
  else
  {
    v28 = 0;
  }
  v29 = *(_QWORD *)&v24[OBJC_IVAR____TtC9SportsKit13SportingEvent__competitors];
  *(_QWORD *)v5 = v40;
  *(_QWORD *)(v5 + 8) = v8;
  *(_BYTE *)(v5 + 16) = v39 & 1;
  *(_BYTE *)(v5 + 17) = v38 & 1;
  *(_BYTE *)(v5 + 18) = v37 & 1;
  *(_QWORD *)(v5 + 24) = v36;
  *(_BYTE *)(v5 + 32) = v32;
  *(_BYTE *)(v5 + 33) = v35;
  *(_BYTE *)(v5 + 34) = v34;
  *(_BYTE *)(v5 + 35) = v33;
  v30 = (int *)type metadata accessor for RunningClockComponentsFormatter.DataSource(0);
  sub_2302FD2F4(v1, v5 + v30[12], &qword_25405A280);
  *(_QWORD *)(v5 + v30[13]) = v18;
  v31 = v5 + v30[14];
  *(_QWORD *)v31 = v23;
  *(_BYTE *)(v31 + 8) = v28;
  *(_QWORD *)(v5 + v30[15]) = v29;
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_0_2();
}

void RunningClockComponentsFormatter.formattedComponents(sportingEvent:sport:)()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_80_0();
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_29_0();
  SportingEvent.dataSource(for:)();
  RunningClockComponentsFormatter.formattedComponents(dataSource:)();
  sub_2302F6DC8(v0, type metadata accessor for RunningClockComponentsFormatter.DataSource);
}

void SportingEvent.dataSource(for:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  char v13;
  char v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  char v28;
  char v29;
  uint64_t v30;
  char v31;
  char v32;
  char v33;
  uint64_t v34;
  char v35;

  OUTLINED_FUNCTION_9_0();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_12();
  sub_23036C16C();
  v33 = v9;
  v25 = v5;
  v32 = sub_23036C420(v5, v3);
  v31 = sub_23036C2A4();
  v10 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit13SportingEvent_clock);
  v11 = *(_BYTE **)(*(_QWORD *)(v10 + OBJC_IVAR____TtC9SportsKit25SportingEventCurrentClock_current)
                  + OBJC_IVAR____TtC9SportsKit18SportingEventClock_period);
  v30 = *(_QWORD *)&v11[OBJC_IVAR____TtC9SportsKit24SportingEventClockPeriod__index];
  v28 = v11[OBJC_IVAR____TtC9SportsKit24SportingEventClockPeriod__subdivision];
  v29 = v11[OBJC_IVAR____TtC9SportsKit24SportingEventClockPeriod__type];
  v26 = v11[OBJC_IVAR____TtC9SportsKit24SportingEventClockPeriod__index + 8];
  v27 = *(_BYTE *)(v0 + OBJC_IVAR____TtC9SportsKit13SportingEvent_progressStatus);
  OUTLINED_FUNCTION_13_10();
  v12 = SportingEventClock.totalSeconds.getter();
  v14 = v13;
  v15 = v11;
  SportingEventCurrentClock.announcedAdditionalMinutesAndSeconds(for:)();
  v16 = v34;

  if (v35 == 1)
  {
    v17 = *(_QWORD *)(v10 + OBJC_IVAR____TtC9SportsKit25SportingEventCurrentClock__total);
    if (v17 && (v18 = *(_QWORD *)(v17 + OBJC_IVAR____TtC9SportsKit18SportingEventClock__additional)) != 0)
    {
      v19 = (uint64_t *)(v18 + OBJC_IVAR____TtC9SportsKit18SportingEventClock__minutes);
      v16 = *v19;
      v20 = *((_BYTE *)v19 + 8);
    }
    else
    {
      v16 = 0;
      v20 = 1;
    }
  }
  else
  {
    v20 = 0;
  }
  v21 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit13SportingEvent__competitors);
  if ((v14 & 1) != 0)
    v22 = 0;
  else
    v22 = v12;
  *(_QWORD *)v7 = v25;
  *(_QWORD *)(v7 + 8) = v3;
  *(_BYTE *)(v7 + 16) = v33 & 1;
  *(_BYTE *)(v7 + 17) = v32 & 1;
  *(_BYTE *)(v7 + 18) = v31 & 1;
  *(_QWORD *)(v7 + 24) = v30;
  *(_BYTE *)(v7 + 32) = v26;
  *(_BYTE *)(v7 + 33) = v29;
  *(_BYTE *)(v7 + 34) = v28;
  *(_BYTE *)(v7 + 35) = v27;
  v23 = (int *)type metadata accessor for RunningClockComponentsFormatter.DataSource(0);
  sub_2302FD2F4(v1, v7 + v23[12], &qword_25405A280);
  *(_QWORD *)(v7 + v23[13]) = v22;
  v24 = v7 + v23[14];
  *(_QWORD *)v24 = v16;
  *(_BYTE *)(v24 + 8) = v20;
  *(_QWORD *)(v7 + v23[15]) = v21;
  OUTLINED_FUNCTION_36();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_0_2();
}

void sub_23036C16C()
{
  __asm { BR              X11 }
}

uint64_t sub_23036C1BC()
{
  char v0;

  v0 = sub_23037AE8C();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t sub_23036C2A4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit13SportingEvent_clock)
                             + OBJC_IVAR____TtC9SportsKit25SportingEventCurrentClock_current)
                 + OBJC_IVAR____TtC9SportsKit18SportingEventClock__activityStatus);
  if (v1 && *(_BYTE *)(v1 + OBJC_IVAR____TtC9SportsKit32SportingEventClockActivityStatus_isBreak) == 1)
    __asm { BR              X11 }
  return 0;
}

uint64_t sub_23036C420(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char v7;
  int v8;
  Swift::String v9;
  BOOL v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char v16;
  unsigned __int8 v17;

  if ((sub_23036C2A4() & 1) == 0)
    goto LABEL_17;
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + OBJC_IVAR____TtC9SportsKit13SportingEvent_clock)
                             + OBJC_IVAR____TtC9SportsKit25SportingEventCurrentClock_current)
                 + OBJC_IVAR____TtC9SportsKit18SportingEventClock_period);
  v6 = *(_QWORD *)(v5 + OBJC_IVAR____TtC9SportsKit24SportingEventClockPeriod__index);
  v7 = *(_BYTE *)(v5 + OBJC_IVAR____TtC9SportsKit24SportingEventClockPeriod__index + 8);
  v8 = *(unsigned __int8 *)(v5 + OBJC_IVAR____TtC9SportsKit24SportingEventClockPeriod__type);
  swift_bridgeObjectRetain();
  v9._countAndFlagsBits = a1;
  v9._object = a2;
  Sport.init(rawValue:)(v9);
  if (v17 - 3 < 2)
  {
    if (v8 != 10)
    {
      sub_2302E4DB8();
      v11 = 0;
      if ((v12 & 1) == 0)
        return v11 & 1;
      v10 = v6 == 2;
      goto LABEL_9;
    }
LABEL_17:
    v11 = 0;
    return v11 & 1;
  }
  if (v17 == 1)
  {
    if (v6 == 2)
      v14 = v7;
    else
      v14 = 1;
    if ((v14 & 1) == 0)
    {
      if (v8 == 10)
      {
        v11 = 1;
      }
      else
      {
        sub_2302E4DB8();
        v11 = v16 ^ 1;
      }
      return v11 & 1;
    }
    goto LABEL_17;
  }
  if (v17 != 5)
    goto LABEL_17;
  v10 = v6 == 1;
LABEL_9:
  v13 = v10;
  v11 = v13 & ~v7;
  return v11 & 1;
}

void sub_23036C554()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
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
  void (*v27)(uint64_t, uint64_t, uint64_t);
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t, uint64_t);
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
  void (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t, uint64_t, uint64_t);
  char *v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  OUTLINED_FUNCTION_9_0();
  v62 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_42_0();
  v50 = v4;
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A260);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_9_5();
  v61 = v6;
  MEMORY[0x24BDAC7A8](v7);
  v52 = (uint64_t)&v45 - v8;
  v9 = OUTLINED_FUNCTION_43_0();
  v55 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_98();
  v12 = v10 - v11;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v45 - v14;
  v16 = sub_230379F74();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_98();
  v20 = v18 - v19;
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_94_1();
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_9_5();
  v59 = v23;
  MEMORY[0x24BDAC7A8](v24);
  v60 = (uint64_t)&v45 - v25;
  v57 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_runningClock);
  v26 = v57 + OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_runningClockInterval;
  OUTLINED_FUNCTION_27();
  v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  v27(v1, v26, v16);
  sub_230379F50();
  v28 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
  v56 = v1;
  v28(v1, v16);
  v53 = v26;
  v51 = v27;
  v27(v20, v26, v16);
  sub_230379F38();
  v28(v20, v16);
  sub_2302ED798(&qword_25405CA98, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
  if ((sub_23037A574() & 1) != 0)
  {
    v46 = v16;
    v47 = v28;
    v29 = v58;
    v30 = v52;
    v31 = v52 + *(int *)(v58 + 48);
    v32 = v55;
    v49 = v15;
    OUTLINED_FUNCTION_38_8(v52, (uint64_t)v15);
    OUTLINED_FUNCTION_38_8(v31, v12);
    v33 = v61;
    v34 = v61 + *(int *)(v29 + 48);
    v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16);
    v48 = v35;
    v35(v61, v30, v9);
    v35(v34, v31, v9);
    v36 = v59;
    OUTLINED_FUNCTION_38_8(v59, v33);
    OUTLINED_FUNCTION_82_3(v34);
    v37 = v33 + *(int *)(v29 + 48);
    OUTLINED_FUNCTION_38_8(v33, v30);
    OUTLINED_FUNCTION_38_8(v37, v31);
    OUTLINED_FUNCTION_38_8(v36 + *(int *)(v54 + 36), v37);
    OUTLINED_FUNCTION_82_3(v33);
    v38 = v60;
    sub_2302FD2F4(v36, v60, &qword_25405A298);
    v39 = v56;
    v40 = v46;
    v51(v56, v53, v46);
    sub_230379F50();
    v47(v39, v40);
    v41 = (uint64_t)v49;
    sub_23037A1E4();
    OUTLINED_FUNCTION_82_3(v12);
    OUTLINED_FUNCTION_52_7(v38, v36);
    v42 = v50;
    v48(v50, v41, v9);
    __swift_storeEnumTagSinglePayload(v42, 0, 1, v9);
    v43 = v62;
    sub_230367B60();
    OUTLINED_FUNCTION_82_3(v41);
    OUTLINED_FUNCTION_87_0(v38);
    v44 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
    __swift_storeEnumTagSinglePayload(v43, 0, 1, v44);
    OUTLINED_FUNCTION_0_2();
  }
  else
  {
    __break(1u);
  }
}

void sub_23036C974()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;

  v1 = sub_23037A238();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v14 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2302FD2B4(v0, (uint64_t)v13, &qword_25405A280);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v8) == 1)
  {
    sub_23037AF94();
  }
  else
  {
    sub_2302FD334((uint64_t)v13, (uint64_t)v10, type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents);
    sub_23037AF94();
    sub_2302ED798(&qword_255E582A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    sub_23037A550();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
    sub_23037A550();
    sub_2302FD2B4((uint64_t)&v10[*(int *)(v8 + 20)], (uint64_t)v7, &qword_25405B4C8);
    if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v1) == 1)
    {
      sub_23037AF94();
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
      sub_23037AF94();
      sub_23037A550();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    }
    sub_23037AF94();
    sub_2302F6DC8((uint64_t)v10, type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents);
  }
}

id sub_23036CBEC(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  objc_class *ObjectType;
  uint64_t *boxed_opaque_existential_0;
  id v10;
  objc_super v12;
  uint64_t v13[5];

  ObjectType = (objc_class *)swift_getObjectType();
  v13[3] = a3;
  v13[4] = a4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v13);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_0, a1, a3);
  a2[OBJC_IVAR____TtC9SportsKit31RunningClockComponentsFormatter_styleOptions] = 0;
  sub_2302E00E4((uint64_t)v13, (uint64_t)&a2[OBJC_IVAR____TtC9SportsKit31RunningClockComponentsFormatter_localizationProvider]);
  v12.receiver = a2;
  v12.super_class = ObjectType;
  v10 = objc_msgSendSuper2(&v12, sel_init);
  sub_23036A478();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  return v10;
}

unint64_t sub_23036CCA8()
{
  unint64_t result;

  result = qword_255E5A170;
  if (!qword_255E5A170)
  {
    result = MEMORY[0x2348B7C44](&unk_230388898, &type metadata for RunningClockComponentsFormatter.LiveClockComponents.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E5A170);
  }
  return result;
}

void sub_23036CCE4(_QWORD *a1)
{
  uint64_t v1;

  if (!*a1)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25405A298);
    OUTLINED_FUNCTION_101_4(v1, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
    OUTLINED_FUNCTION_49_7();
  }
  OUTLINED_FUNCTION_53_2();
}

uint64_t type metadata accessor for RunningClockComponentsFormatter.FormattedComponents(uint64_t a1)
{
  return sub_2302EFB2C(a1, (uint64_t *)&unk_25405A288);
}

unint64_t sub_23036CD54()
{
  unint64_t result;

  result = qword_255E5A198;
  if (!qword_255E5A198)
  {
    result = MEMORY[0x2348B7C44](&unk_230388848, &type metadata for RunningClockComponentsFormatter.DataSource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E5A198);
  }
  return result;
}

void sub_23036CD90(_QWORD *a1)
{
  uint64_t v1;

  if (!*a1)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25405BBB8);
    OUTLINED_FUNCTION_101_4(v1, (uint64_t (*)(uint64_t))type metadata accessor for SportingEventCompetitorContainer);
    OUTLINED_FUNCTION_49_7();
  }
  OUTLINED_FUNCTION_53_2();
}

unint64_t sub_23036CDEC()
{
  unint64_t result;

  result = qword_255E5A1C0;
  if (!qword_255E5A1C0)
  {
    result = MEMORY[0x2348B7C44](&unk_2303887F8, &type metadata for RunningClockComponentsFormatter.StyleOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E5A1C0);
  }
  return result;
}

unint64_t sub_23036CE28()
{
  unint64_t result;

  result = qword_255E5A1C8;
  if (!qword_255E5A1C8)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for RunningClockComponentsFormatter.StyleOptions.ShootoutStyle, &type metadata for RunningClockComponentsFormatter.StyleOptions.ShootoutStyle);
    atomic_store(result, (unint64_t *)&qword_255E5A1C8);
  }
  return result;
}

unint64_t sub_23036CE64()
{
  unint64_t result;

  result = qword_255E5A1D8;
  if (!qword_255E5A1D8)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for RunningClockComponentsFormatter.StyleOptions.ShootoutStyle, &type metadata for RunningClockComponentsFormatter.StyleOptions.ShootoutStyle);
    atomic_store(result, (unint64_t *)&qword_255E5A1D8);
  }
  return result;
}

void sub_23036CEA0()
{
  sub_2302ED798(&qword_255E5A1E8, type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents, (uint64_t)&protocol conformance descriptor for RunningClockComponentsFormatter.LiveClockComponents);
}

void sub_23036CECC()
{
  sub_2302ED798(&qword_255E5A1F0, type metadata accessor for RunningClockComponentsFormatter.DataSource, (uint64_t)&protocol conformance descriptor for RunningClockComponentsFormatter.DataSource);
}

unint64_t sub_23036CEFC()
{
  unint64_t result;

  result = qword_255E5A1F8;
  if (!qword_255E5A1F8)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for RunningClockComponentsFormatter.StyleOptions.ShootoutStyle, &type metadata for RunningClockComponentsFormatter.StyleOptions.ShootoutStyle);
    atomic_store(result, (unint64_t *)&qword_255E5A1F8);
  }
  return result;
}

unint64_t sub_23036CF3C()
{
  unint64_t result;

  result = qword_255E5A200;
  if (!qword_255E5A200)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for RunningClockComponentsFormatter.StyleOptions, &type metadata for RunningClockComponentsFormatter.StyleOptions);
    atomic_store(result, (unint64_t *)&qword_255E5A200);
  }
  return result;
}

uint64_t type metadata accessor for RunningClockComponentsFormatter()
{
  return objc_opt_self();
}

uint64_t method lookup function for RunningClockComponentsFormatter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RunningClockComponentsFormatter.__allocating_init(localizationProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

char *initializeBufferWithCopyOfBuffer for RunningClockComponentsFormatter.LiveClockComponents(char *a1, char *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23037A238();
    v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
    v8(&a1[*(int *)(v9 + 36)], &a2[*(int *)(v9 + 36)], v7);
    v10 = *(int *)(a3 + 20);
    v11 = &a1[v10];
    v12 = &a2[v10];
    if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v10], 1, v7))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      v8(v11, v12, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v7);
    }
    a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  }
  return a1;
}

uint64_t destroy for RunningClockComponentsFormatter.LiveClockComponents(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t (*v8)(uint64_t, uint64_t);

  v4 = sub_23037A238();
  v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v8(a1, v4);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
  v8(a1 + *(int *)(v5 + 36), v4);
  v6 = a1 + *(int *)(a2 + 20);
  result = __swift_getEnumTagSinglePayload(v6, 1, v4);
  if (!(_DWORD)result)
    return v8(v6, v4);
  return result;
}

char *initializeWithCopy for RunningClockComponentsFormatter.LiveClockComponents(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(void *, const void *, uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = sub_23037A238();
  v7 = *(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
  v7(&a1[*(int *)(v8 + 36)], &a2[*(int *)(v8 + 36)], v6);
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v9], 1, v6))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v7(v10, v11, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v6);
  }
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

char *assignWithCopy for RunningClockComponentsFormatter.LiveClockComponents(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  int EnumTagSinglePayload;
  int v14;
  uint64_t v15;

  v6 = sub_23037A238();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
  v8(&a1[*(int *)(v9 + 36)], &a2[*(int *)(v9 + 36)], v6);
  v10 = *(int *)(a3 + 20);
  v11 = &a1[v10];
  v12 = &a2[v10];
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)&a1[v10], 1, v6);
  v14 = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v6);
  if (!EnumTagSinglePayload)
  {
    if (!v14)
    {
      v8(v11, v12, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v12, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v6);
LABEL_7:
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

char *initializeWithTake for RunningClockComponentsFormatter.LiveClockComponents(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(void *, const void *, uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = sub_23037A238();
  v7 = *(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
  v7(&a1[*(int *)(v8 + 36)], &a2[*(int *)(v8 + 36)], v6);
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v9], 1, v6))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v7(v10, v11, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v6);
  }
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

char *assignWithTake for RunningClockComponentsFormatter.LiveClockComponents(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  int EnumTagSinglePayload;
  int v14;
  uint64_t v15;

  v6 = sub_23037A238();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
  v8(&a1[*(int *)(v9 + 36)], &a2[*(int *)(v9 + 36)], v6);
  v10 = *(int *)(a3 + 20);
  v11 = &a1[v10];
  v12 = &a2[v10];
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)&a1[v10], 1, v6);
  v14 = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v6);
  if (!EnumTagSinglePayload)
  {
    if (!v14)
    {
      v8(v11, v12, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v12, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v6);
LABEL_7:
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t getEnumTagSinglePayload for RunningClockComponentsFormatter.LiveClockComponents()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23036D608(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
LABEL_5:
    OUTLINED_FUNCTION_27_3(v8, a2, v7);
    return;
  }
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
  if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v9;
    v8 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  OUTLINED_FUNCTION_13_0();
}

uint64_t storeEnumTagSinglePayload for RunningClockComponentsFormatter.LiveClockComponents()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23036D6BC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
LABEL_5:
    OUTLINED_FUNCTION_26(v10, a2, a2, v9);
    return;
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
  if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == a3)
  {
    v9 = v11;
    v10 = a1 + *(int *)(a4 + 20);
    goto LABEL_5;
  }
  *(_BYTE *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
  OUTLINED_FUNCTION_13_0();
}

void sub_23036D750()
{
  unint64_t v0;
  unint64_t v1;

  sub_23036D7EC();
  if (v0 <= 0x3F)
  {
    sub_2302EFD68(319, &qword_25405CAA0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_23036D7EC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25405CC00)
  {
    sub_23037A238();
    sub_2302ED798(&qword_25405CA98, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
    v0 = sub_23037A580();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25405CC00);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for RunningClockComponentsFormatter.FormattedComponents(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v14 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = a2[5];
    a1[4] = a2[4];
    a1[5] = v7;
    v8 = a2[7];
    v9 = *(int *)(a3 + 32);
    v10 = (char *)a2 + v9;
    v11 = (char *)a1 + v9;
    a1[6] = a2[6];
    a1[7] = v8;
    v12 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
      memcpy(v11, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      v15 = sub_23037A238();
      v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
      v16(v11, v10, v15);
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
      v16(&v11[*(int *)(v17 + 36)], &v10[*(int *)(v17 + 36)], v15);
      v18 = *(int *)(v12 + 20);
      v19 = &v11[v18];
      v20 = &v10[v18];
      if (__swift_getEnumTagSinglePayload((uint64_t)&v10[v18], 1, v15))
      {
        v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
        memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
      }
      else
      {
        v16(v19, v20, v15);
        __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v15);
      }
      v11[*(int *)(v12 + 24)] = v10[*(int *)(v12 + 24)];
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v12);
    }
  }
  return v3;
}

uint64_t destroy for RunningClockComponentsFormatter.FormattedComponents(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
  result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!(_DWORD)result)
  {
    v7 = sub_23037A238();
    v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
    v10(v4, v7);
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
    v10(v4 + *(int *)(v8 + 36), v7);
    v9 = v4 + *(int *)(v5 + 20);
    result = __swift_getEnumTagSinglePayload(v9, 1, v7);
    if (!(_DWORD)result)
      return ((uint64_t (*)(uint64_t, uint64_t))v10)(v9, v7);
  }
  return result;
}

_QWORD *initializeWithCopy for RunningClockComponentsFormatter.FormattedComponents(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  v7 = a2[7];
  v8 = *(int *)(a3 + 32);
  v9 = (char *)a2 + v8;
  v10 = (char *)a1 + v8;
  a1[6] = a2[6];
  a1[7] = v7;
  v11 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
    memcpy(v10, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v13 = sub_23037A238();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    v14(v10, v9, v13);
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
    v14(&v10[*(int *)(v15 + 36)], &v9[*(int *)(v15 + 36)], v13);
    v16 = *(int *)(v11 + 20);
    v17 = &v10[v16];
    v18 = &v9[v16];
    if (__swift_getEnumTagSinglePayload((uint64_t)&v9[v16], 1, v13))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
      memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      v14(v17, v18, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v13);
    }
    v10[*(int *)(v11 + 24)] = v9[*(int *)(v11 + 24)];
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v11);
  }
  return a1;
}

_QWORD *assignWithCopy for RunningClockComponentsFormatter.FormattedComponents(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int EnumTagSinglePayload;
  int v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  int v27;
  int v28;
  uint64_t v29;

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
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 32);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    if (v11)
    {
      sub_2302F6DC8((uint64_t)v7, type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents);
      goto LABEL_7;
    }
    v20 = sub_23037A238();
    v21 = *(_QWORD *)(v20 - 8);
    v22 = *(void (**)(char *, char *, uint64_t))(v21 + 24);
    v22(v7, v8, v20);
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
    v22(&v7[*(int *)(v23 + 36)], &v8[*(int *)(v23 + 36)], v20);
    v24 = *(int *)(v9 + 20);
    v25 = &v7[v24];
    v26 = &v8[v24];
    v27 = __swift_getEnumTagSinglePayload((uint64_t)&v7[v24], 1, v20);
    v28 = __swift_getEnumTagSinglePayload((uint64_t)v26, 1, v20);
    if (v27)
    {
      if (!v28)
      {
        (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v25, v26, v20);
        __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v20);
LABEL_16:
        v7[*(int *)(v9 + 24)] = v8[*(int *)(v9 + 24)];
        return a1;
      }
    }
    else
    {
      if (!v28)
      {
        v22(v25, v26, v20);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v21 + 8))(v25, v20);
    }
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    goto LABEL_16;
  }
  if (v11)
  {
LABEL_7:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    return a1;
  }
  v12 = sub_23037A238();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  v13(v7, v8, v12);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
  v13(&v7[*(int *)(v14 + 36)], &v8[*(int *)(v14 + 36)], v12);
  v15 = *(int *)(v9 + 20);
  v16 = &v7[v15];
  v17 = &v8[v15];
  if (__swift_getEnumTagSinglePayload((uint64_t)&v8[v15], 1, v12))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    v13(v16, v17, v12);
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v12);
  }
  v7[*(int *)(v9 + 24)] = v8[*(int *)(v9 + 24)];
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  return a1;
}

_OWORD *initializeWithTake for RunningClockComponentsFormatter.FormattedComponents(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = *(int *)(a3 + 32);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    v11 = sub_23037A238();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32);
    v12(v7, v8, v11);
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
    v12(&v7[*(int *)(v13 + 36)], &v8[*(int *)(v13 + 36)], v11);
    v14 = *(int *)(v9 + 20);
    v15 = &v7[v14];
    v16 = &v8[v14];
    if (__swift_getEnumTagSinglePayload((uint64_t)&v8[v14], 1, v11))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      v12(v15, v16, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v11);
    }
    v7[*(int *)(v9 + 24)] = v8[*(int *)(v9 + 24)];
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  return a1;
}

_QWORD *assignWithTake for RunningClockComponentsFormatter.FormattedComponents(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  int EnumTagSinglePayload;
  int v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  int v31;
  int v32;
  uint64_t v33;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 32);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v13);
  v15 = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13);
  if (!EnumTagSinglePayload)
  {
    if (v15)
    {
      sub_2302F6DC8((uint64_t)v11, type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents);
      goto LABEL_7;
    }
    v24 = sub_23037A238();
    v25 = *(_QWORD *)(v24 - 8);
    v26 = *(void (**)(char *, char *, uint64_t))(v25 + 40);
    v26(v11, v12, v24);
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
    v26(&v11[*(int *)(v27 + 36)], &v12[*(int *)(v27 + 36)], v24);
    v28 = *(int *)(v13 + 20);
    v29 = &v11[v28];
    v30 = &v12[v28];
    v31 = __swift_getEnumTagSinglePayload((uint64_t)&v11[v28], 1, v24);
    v32 = __swift_getEnumTagSinglePayload((uint64_t)v30, 1, v24);
    if (v31)
    {
      if (!v32)
      {
        (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v29, v30, v24);
        __swift_storeEnumTagSinglePayload((uint64_t)v29, 0, 1, v24);
LABEL_16:
        v11[*(int *)(v13 + 24)] = v12[*(int *)(v13 + 24)];
        return a1;
      }
    }
    else
    {
      if (!v32)
      {
        v26(v29, v30, v24);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v25 + 8))(v29, v24);
    }
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    goto LABEL_16;
  }
  if (v15)
  {
LABEL_7:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    return a1;
  }
  v16 = sub_23037A238();
  v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32);
  v17(v11, v12, v16);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
  v17(&v11[*(int *)(v18 + 36)], &v12[*(int *)(v18 + 36)], v16);
  v19 = *(int *)(v13 + 20);
  v20 = &v11[v19];
  v21 = &v12[v19];
  if (__swift_getEnumTagSinglePayload((uint64_t)&v12[v19], 1, v16))
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    v17(v20, v21, v16);
    __swift_storeEnumTagSinglePayload((uint64_t)v20, 0, 1, v16);
  }
  v11[*(int *)(v13 + 24)] = v12[*(int *)(v13 + 24)];
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for RunningClockComponentsFormatter.FormattedComponents()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23036E404(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_100_0(*(_QWORD *)(a1 + 40));
    OUTLINED_FUNCTION_13_0();
  }
  else
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
    OUTLINED_FUNCTION_27_3(a1 + *(int *)(a3 + 32), a2, v6);
  }
}

uint64_t storeEnumTagSinglePayload for RunningClockComponentsFormatter.FormattedComponents()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23036E46C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_100_3();
  if (v3)
  {
    *(_QWORD *)(v1 + 40) = (v0 - 1);
    OUTLINED_FUNCTION_13_0();
  }
  else
  {
    v4 = v2;
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
    OUTLINED_FUNCTION_26(v1 + *(int *)(v4 + 32), v0, v0, v5);
  }
}

void sub_23036E4C0()
{
  unint64_t v0;

  sub_2302EFD68(319, &qword_25405CAE8, (void (*)(uint64_t))type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

_QWORD *initializeBufferWithCopyOfBuffer for RunningClockComponentsFormatter.DataSource(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    *(_WORD *)(a1 + 17) = *(_WORD *)((char *)a2 + 17);
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_DWORD *)(a1 + 32) = *((_DWORD *)a2 + 8);
    v9 = a3[12];
    v10 = (char *)(a1 + v9);
    v11 = (char *)a2 + v9;
    *(_QWORD *)a1 = v7;
    *(_QWORD *)(a1 + 8) = v8;
    v12 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      v15 = sub_23037A238();
      v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
      v16(v10, v11, v15);
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
      v16(&v10[*(int *)(v17 + 36)], &v11[*(int *)(v17 + 36)], v15);
      v18 = *(int *)(v12 + 20);
      v19 = &v10[v18];
      v20 = &v11[v18];
      if (__swift_getEnumTagSinglePayload((uint64_t)&v11[v18], 1, v15))
      {
        v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
        memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
      }
      else
      {
        v16(v19, v20, v15);
        __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v15);
      }
      v10[*(int *)(v12 + 24)] = v11[*(int *)(v12 + 24)];
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
    }
    v22 = a3[14];
    *(_QWORD *)((char *)v4 + a3[13]) = *(uint64_t *)((char *)a2 + a3[13]);
    v23 = (char *)v4 + v22;
    v24 = (uint64_t)a2 + v22;
    *(_QWORD *)v23 = *(_QWORD *)v24;
    v23[8] = *(_BYTE *)(v24 + 8);
    *(_QWORD *)((char *)v4 + a3[15]) = *(uint64_t *)((char *)a2 + a3[15]);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for RunningClockComponentsFormatter.DataSource(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 48);
  v5 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5))
  {
    v6 = sub_23037A238();
    v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
    v7(v4, v6);
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
    v7(v4 + *(int *)(v8 + 36), v6);
    v9 = v4 + *(int *)(v5 + 20);
    if (!__swift_getEnumTagSinglePayload(v9, 1, v6))
      v7(v9, v6);
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RunningClockComponentsFormatter.DataSource(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = *a2;
  v7 = a2[1];
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  *(_WORD *)(a1 + 17) = *(_WORD *)((char *)a2 + 17);
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_DWORD *)(a1 + 32) = *((_DWORD *)a2 + 8);
  v8 = a3[12];
  v9 = (char *)(a1 + v8);
  v10 = (char *)a2 + v8;
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  v11 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v13 = sub_23037A238();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    v14(v9, v10, v13);
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
    v14(&v9[*(int *)(v15 + 36)], &v10[*(int *)(v15 + 36)], v13);
    v16 = *(int *)(v11 + 20);
    v17 = &v9[v16];
    v18 = &v10[v16];
    if (__swift_getEnumTagSinglePayload((uint64_t)&v10[v16], 1, v13))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
      memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      v14(v17, v18, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v13);
    }
    v9[*(int *)(v11 + 24)] = v10[*(int *)(v11 + 24)];
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  v20 = a3[14];
  *(_QWORD *)(a1 + a3[13]) = *(uint64_t *)((char *)a2 + a3[13]);
  v21 = a1 + v20;
  v22 = (uint64_t)a2 + v20;
  *(_QWORD *)v21 = *(_QWORD *)v22;
  *(_BYTE *)(v21 + 8) = *(_BYTE *)(v22 + 8);
  *(_QWORD *)(a1 + a3[15]) = *(uint64_t *)((char *)a2 + a3[15]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RunningClockComponentsFormatter.DataSource(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  uint64_t v10;
  int EnumTagSinglePayload;
  int v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_BYTE *, char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  char *v25;
  int v26;
  int v27;
  size_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  v6 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_BYTE *)(a1 + 34) = *(_BYTE *)(a2 + 34);
  *(_BYTE *)(a1 + 35) = *(_BYTE *)(a2 + 35);
  v7 = a3[12];
  v8 = (_BYTE *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    if (v12)
    {
      sub_2302F6DC8((uint64_t)v8, type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents);
      goto LABEL_7;
    }
    v21 = sub_23037A238();
    v35 = *(_QWORD *)(v21 - 8);
    v22 = *(void (**)(_BYTE *, char *, uint64_t))(v35 + 24);
    v22(v8, v9, v21);
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
    v22(&v8[*(int *)(v23 + 36)], &v9[*(int *)(v23 + 36)], v21);
    v24 = *(int *)(v10 + 20);
    v25 = &v9[v24];
    v36 = (uint64_t)&v8[v24];
    v26 = __swift_getEnumTagSinglePayload((uint64_t)&v8[v24], 1, v21);
    v27 = __swift_getEnumTagSinglePayload((uint64_t)v25, 1, v21);
    if (v26)
    {
      if (!v27)
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v35 + 16))(v36, v25, v21);
        __swift_storeEnumTagSinglePayload(v36, 0, 1, v21);
        goto LABEL_18;
      }
      v28 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8) - 8) + 64);
      v29 = (void *)v36;
    }
    else
    {
      if (!v27)
      {
        v22((_BYTE *)v36, v25, v21);
        goto LABEL_18;
      }
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v36, v21);
      v28 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8) - 8) + 64);
      v29 = (void *)v36;
    }
    memcpy(v29, v25, v28);
LABEL_18:
    v8[*(int *)(v10 + 24)] = v9[*(int *)(v10 + 24)];
    goto LABEL_19;
  }
  if (v12)
  {
LABEL_7:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_19;
  }
  v13 = sub_23037A238();
  v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  v14(v8, v9, v13);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
  v14(&v8[*(int *)(v15 + 36)], &v9[*(int *)(v15 + 36)], v13);
  v16 = *(int *)(v10 + 20);
  v17 = &v8[v16];
  v18 = &v9[v16];
  if (__swift_getEnumTagSinglePayload((uint64_t)&v9[v16], 1, v13))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    v14(v17, v18, v13);
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v13);
  }
  v8[*(int *)(v10 + 24)] = v9[*(int *)(v10 + 24)];
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_19:
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  v30 = a3[14];
  v31 = a1 + v30;
  v32 = (uint64_t *)(a2 + v30);
  v33 = *v32;
  *(_BYTE *)(v31 + 8) = *((_BYTE *)v32 + 8);
  *(_QWORD *)v31 = v33;
  *(_QWORD *)(a1 + a3[15]) = *(_QWORD *)(a2 + a3[15]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for RunningClockComponentsFormatter.DataSource(uint64_t a1, __int128 *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = *a2;
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  *(_WORD *)(a1 + 17) = *(_WORD *)((char *)a2 + 17);
  *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
  *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  *(_WORD *)(a1 + 33) = *(_WORD *)((char *)a2 + 33);
  *(_BYTE *)(a1 + 35) = *((_BYTE *)a2 + 35);
  v7 = a3[12];
  v8 = (char *)(a1 + v7);
  v9 = (char *)a2 + v7;
  *(_OWORD *)a1 = v6;
  v10 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    v12 = sub_23037A238();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32);
    v13(v8, v9, v12);
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
    v13(&v8[*(int *)(v14 + 36)], &v9[*(int *)(v14 + 36)], v12);
    v15 = *(int *)(v10 + 20);
    v16 = &v8[v15];
    v17 = &v9[v15];
    if (__swift_getEnumTagSinglePayload((uint64_t)&v9[v15], 1, v12))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      v13(v16, v17, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v12);
    }
    v8[*(int *)(v10 + 24)] = v9[*(int *)(v10 + 24)];
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  v19 = a3[14];
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)((char *)a2 + a3[13]);
  v20 = a1 + v19;
  v21 = (uint64_t)a2 + v19;
  *(_QWORD *)v20 = *(_QWORD *)v21;
  *(_BYTE *)(v20 + 8) = *(_BYTE *)(v21 + 8);
  *(_QWORD *)(a1 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
  return a1;
}

uint64_t assignWithTake for RunningClockComponentsFormatter.DataSource(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  uint64_t v10;
  int EnumTagSinglePayload;
  int v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_BYTE *, char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  char *v25;
  int v26;
  int v27;
  size_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v7 = a3[12];
  v8 = (_BYTE *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  v10 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    if (v12)
    {
      sub_2302F6DC8((uint64_t)v8, type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents);
      goto LABEL_7;
    }
    v21 = sub_23037A238();
    v34 = *(_QWORD *)(v21 - 8);
    v22 = *(void (**)(_BYTE *, char *, uint64_t))(v34 + 40);
    v22(v8, v9, v21);
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
    v22(&v8[*(int *)(v23 + 36)], &v9[*(int *)(v23 + 36)], v21);
    v24 = *(int *)(v10 + 20);
    v25 = &v9[v24];
    v35 = (uint64_t)&v8[v24];
    v26 = __swift_getEnumTagSinglePayload((uint64_t)&v8[v24], 1, v21);
    v27 = __swift_getEnumTagSinglePayload((uint64_t)v25, 1, v21);
    if (v26)
    {
      if (!v27)
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v35, v25, v21);
        __swift_storeEnumTagSinglePayload(v35, 0, 1, v21);
        goto LABEL_18;
      }
      v28 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8) - 8) + 64);
      v29 = (void *)v35;
    }
    else
    {
      if (!v27)
      {
        v22((_BYTE *)v35, v25, v21);
        goto LABEL_18;
      }
      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v21);
      v28 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8) - 8) + 64);
      v29 = (void *)v35;
    }
    memcpy(v29, v25, v28);
LABEL_18:
    v8[*(int *)(v10 + 24)] = v9[*(int *)(v10 + 24)];
    goto LABEL_19;
  }
  if (v12)
  {
LABEL_7:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_19;
  }
  v13 = sub_23037A238();
  v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32);
  v14(v8, v9, v13);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
  v14(&v8[*(int *)(v15 + 36)], &v9[*(int *)(v15 + 36)], v13);
  v16 = *(int *)(v10 + 20);
  v17 = &v8[v16];
  v18 = &v9[v16];
  if (__swift_getEnumTagSinglePayload((uint64_t)&v9[v16], 1, v13))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    v14(v17, v18, v13);
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v13);
  }
  v8[*(int *)(v10 + 24)] = v9[*(int *)(v10 + 24)];
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_19:
  v30 = a3[14];
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  v31 = a1 + v30;
  v32 = a2 + v30;
  *(_QWORD *)v31 = *(_QWORD *)v32;
  *(_BYTE *)(v31 + 8) = *(_BYTE *)(v32 + 8);
  *(_QWORD *)(a1 + a3[15]) = *(_QWORD *)(a2 + a3[15]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RunningClockComponentsFormatter.DataSource()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23036F244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_100_0(*(_QWORD *)(a1 + 8));
    OUTLINED_FUNCTION_13_0();
  }
  else
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
    OUTLINED_FUNCTION_27_3(a1 + *(int *)(a3 + 48), a2, v6);
  }
}

uint64_t storeEnumTagSinglePayload for RunningClockComponentsFormatter.DataSource()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23036F2AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_100_3();
  if (v3)
  {
    *(_QWORD *)(v1 + 8) = (v0 - 1);
    OUTLINED_FUNCTION_13_0();
  }
  else
  {
    v4 = v2;
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
    OUTLINED_FUNCTION_26(v1 + *(int *)(v4 + 48), v0, v0, v5);
  }
}

void sub_23036F300()
{
  unint64_t v0;

  sub_2302EFD68(319, &qword_25405CAE8, (void (*)(uint64_t))type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

ValueMetadata *type metadata accessor for RunningClockComponentsFormatter.StyleOptions()
{
  return &type metadata for RunningClockComponentsFormatter.StyleOptions;
}

uint64_t _s9SportsKit31RunningClockComponentsFormatterC12StyleOptionsV13ShootoutStyleOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23036F434 + 4 * byte_2303880C5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23036F468 + 4 * byte_2303880C0[v4]))();
}

uint64_t sub_23036F468(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23036F470(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23036F478);
  return result;
}

uint64_t sub_23036F484(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23036F48CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23036F490(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23036F498(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RunningClockComponentsFormatter.StyleOptions.ShootoutStyle()
{
  return &type metadata for RunningClockComponentsFormatter.StyleOptions.ShootoutStyle;
}

uint64_t storeEnumTagSinglePayload for RunningClockComponentsFormatter.StyleOptions.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23036F4F4 + 4 * byte_2303880CA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23036F514 + 4 * byte_2303880CF[v4]))();
}

_BYTE *sub_23036F4F4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23036F514(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23036F51C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23036F524(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23036F52C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23036F534(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for RunningClockComponentsFormatter.StyleOptions.CodingKeys()
{
  return &type metadata for RunningClockComponentsFormatter.StyleOptions.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for RunningClockComponentsFormatter.DataSource.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 11 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 11) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF4)
    return ((uint64_t (*)(void))((char *)&loc_23036F59C + 4 * byte_2303880D9[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_23036F5D0 + 4 * byte_2303880D4[v4]))();
}

uint64_t sub_23036F5D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23036F5D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23036F5E0);
  return result;
}

uint64_t sub_23036F5EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23036F5F4);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_23036F5F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23036F600(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RunningClockComponentsFormatter.DataSource.CodingKeys()
{
  return &type metadata for RunningClockComponentsFormatter.DataSource.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for RunningClockComponentsFormatter.LiveClockComponents.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23036F668 + 4 * byte_2303880E3[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23036F69C + 4 * byte_2303880DE[v4]))();
}

uint64_t sub_23036F69C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23036F6A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23036F6ACLL);
  return result;
}

uint64_t sub_23036F6B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23036F6C0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23036F6C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23036F6CC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents.CodingKeys()
{
  return &type metadata for RunningClockComponentsFormatter.LiveClockComponents.CodingKeys;
}

unint64_t sub_23036F6EC()
{
  unint64_t result;

  result = qword_255E5A210;
  if (!qword_255E5A210)
  {
    result = MEMORY[0x2348B7C44](&unk_230388660, &type metadata for RunningClockComponentsFormatter.LiveClockComponents.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E5A210);
  }
  return result;
}

unint64_t sub_23036F72C()
{
  unint64_t result;

  result = qword_255E5A218;
  if (!qword_255E5A218)
  {
    result = MEMORY[0x2348B7C44](&unk_230388718, &type metadata for RunningClockComponentsFormatter.DataSource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E5A218);
  }
  return result;
}

unint64_t sub_23036F76C()
{
  unint64_t result;

  result = qword_255E5A220;
  if (!qword_255E5A220)
  {
    result = MEMORY[0x2348B7C44](&unk_2303887D0, &type metadata for RunningClockComponentsFormatter.StyleOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E5A220);
  }
  return result;
}

unint64_t sub_23036F7AC()
{
  unint64_t result;

  result = qword_255E5A228;
  if (!qword_255E5A228)
  {
    result = MEMORY[0x2348B7C44](&unk_230388740, &type metadata for RunningClockComponentsFormatter.StyleOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E5A228);
  }
  return result;
}

unint64_t sub_23036F7EC()
{
  unint64_t result;

  result = qword_255E5A230;
  if (!qword_255E5A230)
  {
    result = MEMORY[0x2348B7C44](&unk_230388768, &type metadata for RunningClockComponentsFormatter.StyleOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E5A230);
  }
  return result;
}

unint64_t sub_23036F82C()
{
  unint64_t result;

  result = qword_255E5A238;
  if (!qword_255E5A238)
  {
    result = MEMORY[0x2348B7C44](&unk_230388688, &type metadata for RunningClockComponentsFormatter.DataSource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E5A238);
  }
  return result;
}

unint64_t sub_23036F86C()
{
  unint64_t result;

  result = qword_255E5A240;
  if (!qword_255E5A240)
  {
    result = MEMORY[0x2348B7C44](&unk_2303886B0, &type metadata for RunningClockComponentsFormatter.DataSource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E5A240);
  }
  return result;
}

unint64_t sub_23036F8AC()
{
  unint64_t result;

  result = qword_255E5A248;
  if (!qword_255E5A248)
  {
    result = MEMORY[0x2348B7C44](&unk_2303885D0, &type metadata for RunningClockComponentsFormatter.LiveClockComponents.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E5A248);
  }
  return result;
}

unint64_t sub_23036F8EC()
{
  unint64_t result;

  result = qword_255E5A250;
  if (!qword_255E5A250)
  {
    result = MEMORY[0x2348B7C44](&unk_2303885F8, &type metadata for RunningClockComponentsFormatter.LiveClockComponents.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E5A250);
  }
  return result;
}

unint64_t sub_23036F928()
{
  unint64_t result;

  result = qword_255E5A258;
  if (!qword_255E5A258)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for RunningClockComponentsFormatter.StyleOptions.ShootoutStyle, &type metadata for RunningClockComponentsFormatter.StyleOptions.ShootoutStyle);
    atomic_store(result, (unint64_t *)&qword_255E5A258);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_12_5@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 80) = a1;
  return sub_23037ADF0();
}

uint64_t OUTLINED_FUNCTION_13_10()
{
  uint64_t v0;
  uint64_t v1;

  v1 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
  return __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_14_9@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 88) = a1;
  return sub_23037AD54();
}

uint64_t OUTLINED_FUNCTION_15_9()
{
  return 0x6572676F72506E49;
}

uint64_t OUTLINED_FUNCTION_16_7()
{
  return 0x656E6F7074736F50;
}

uint64_t OUTLINED_FUNCTION_21_9@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&a3 - ((a2 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
}

uint64_t OUTLINED_FUNCTION_27_8(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_30_8()
{
  return sub_23037AE8C();
}

uint64_t OUTLINED_FUNCTION_31_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v0 + 8))(*(_QWORD *)(v2 - 104), v1);
}

uint64_t OUTLINED_FUNCTION_37_8()
{
  return sub_23037AD3C();
}

uint64_t OUTLINED_FUNCTION_38_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_39_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_40_5@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_41_10()
{
  return sub_23037ADD8();
}

uint64_t OUTLINED_FUNCTION_44_8@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 80) = a1;
  return sub_23037ADCC();
}

uint64_t OUTLINED_FUNCTION_46_6()
{
  return 0x6C616E6946;
}

uint64_t OUTLINED_FUNCTION_47_8()
{
  return 0x6B61657242;
}

uint64_t OUTLINED_FUNCTION_48_4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 120) = a1;
  *(_QWORD *)(v1 - 112) = 0;
  *(_QWORD *)(v1 - 104) = 0;
  *(_QWORD *)(v1 - 96) = 0;
  *(_BYTE *)(v1 - 88) = 7;
  return sub_23036AD2C((uint64_t *)(v1 - 120));
}

void OUTLINED_FUNCTION_49_7()
{
  JUMPOUT(0x2348B7C44);
}

void OUTLINED_FUNCTION_52_7(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_2302FD2B4(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_55_5()
{
  return 0x65646E6570737553;
}

uint64_t OUTLINED_FUNCTION_57_8()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_63_7()
{
  return sub_23037A550();
}

id OUTLINED_FUNCTION_64_5()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return sub_23036CBEC(v3, v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_65_5(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

void OUTLINED_FUNCTION_66_4(_BYTE *a1@<X8>)
{
  char v1;

  *a1 = v1;
}

void OUTLINED_FUNCTION_70_4()
{
  _BYTE *v0;
  _BYTE *v1;

  *v0 = *v1;
}

uint64_t OUTLINED_FUNCTION_73_4(uint64_t result)
{
  _QWORD *v1;

  *v1 |= result;
  return result;
}

uint64_t OUTLINED_FUNCTION_78_4()
{
  return type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
}

uint64_t OUTLINED_FUNCTION_82_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

void OUTLINED_FUNCTION_83_4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;

  sub_2302F6D9C(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_86_3()
{
  return sub_23037AD78();
}

void OUTLINED_FUNCTION_87_3(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_2302F6DC8(v2, a2);
}

void OUTLINED_FUNCTION_89_3(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  sub_2302F6D9C(a1, *(_QWORD *)(v2 - 128), v1);
}

uint64_t OUTLINED_FUNCTION_96_2()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v0 - 96));
}

uint64_t OUTLINED_FUNCTION_98_3@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

void OUTLINED_FUNCTION_99_4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_2302FD2B4(a1, v3, a3);
}

void OUTLINED_FUNCTION_101_4(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  unint64_t *v3;

  sub_2302ED798(v3, a2, v2);
}

uint64_t SportsLogoSize.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 200;
  else
    return 56;
}

SportsKit::SportsLogoSize_optional __swiftcall SportsLogoSize.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  if (rawValue == 200)
    v2 = 1;
  else
    v2 = 2;
  if (rawValue == 56)
    v2 = 0;
  *v1 = v2;
  return (SportsKit::SportsLogoSize_optional)rawValue;
}

uint64_t sub_23036FC60(unsigned __int8 *a1, char *a2)
{
  return sub_2302E54D0(*a1, *a2);
}

unint64_t sub_23036FC70()
{
  unint64_t result;

  result = qword_255E5A268;
  if (!qword_255E5A268)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportsLogoSize, &type metadata for SportsLogoSize);
    atomic_store(result, (unint64_t *)&qword_255E5A268);
  }
  return result;
}

void sub_23036FCAC()
{
  sub_230332078();
}

void sub_23036FCB4()
{
  sub_2302D7340();
}

void sub_23036FCBC()
{
  sub_230332178();
}

SportsKit::SportsLogoSize_optional sub_23036FCC4(Swift::Int *a1)
{
  return SportsLogoSize.init(rawValue:)(*a1);
}

uint64_t sub_23036FCCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = SportsLogoSize.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_23036FCF0()
{
  sub_23036FE64();
  return sub_23037A724();
}

uint64_t sub_23036FD4C()
{
  sub_23036FE64();
  return sub_23037A70C();
}

uint64_t storeEnumTagSinglePayload for SportsLogoSize(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23036FDE4 + 4 * byte_2303888ED[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23036FE18 + 4 * byte_2303888E8[v4]))();
}

uint64_t sub_23036FE18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23036FE20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23036FE28);
  return result;
}

uint64_t sub_23036FE34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23036FE3CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23036FE40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23036FE48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SportsLogoSize()
{
  return &type metadata for SportsLogoSize;
}

unint64_t sub_23036FE64()
{
  unint64_t result;

  result = qword_255E5A270;
  if (!qword_255E5A270)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportsLogoSize, &type metadata for SportsLogoSize);
    atomic_store(result, (unint64_t *)&qword_255E5A270);
  }
  return result;
}

void NSFileManager.currentContainerURL.getter(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void (*v13)(char *, char *, uint64_t);
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v2 = sub_23037A118();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B530);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (void *)objc_opt_self();
  v10 = objc_msgSend(v9, sel_defaultManager);
  v11 = (void *)sub_23037A5A4();
  v12 = objc_msgSend(v10, sel_containerURLForSecurityApplicationGroupIdentifier_, v11);

  if (v12)
  {
    sub_23037A0E8();

    v13 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v13(v8, v5, v2);
    OUTLINED_FUNCTION_9_10((uint64_t)v8, 0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v2) != 1)
    {
      v13(a1, v8, v2);
      return;
    }
  }
  else
  {
    OUTLINED_FUNCTION_9_10((uint64_t)v8, 1);
  }
  v14 = objc_msgSend(v9, sel_defaultManager);
  v15 = objc_msgSend(v14, sel_URLsForDirectory_inDomains_, 9, 1);

  v16 = sub_23037A748();
  if (*(_QWORD *)(v16 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, v16 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), v2);
    swift_bridgeObjectRelease();
    sub_23037A0C4();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_230309E68((uint64_t)v8);
  }
  else
  {
    __break(1u);
  }
}

unint64_t static ContainerConstants.defaultSuiteName.getter()
{
  return 0xD000000000000016;
}

unint64_t static ContainerConstants.followAllLiveActivitiesUserDefaultKey.getter()
{
  return OUTLINED_FUNCTION_0_16();
}

unint64_t static ContainerConstants.liveActivitiesTargetAppKey.getter()
{
  return OUTLINED_FUNCTION_0_16();
}

uint64_t static ContainerConstants.tempoUrlUserDefaultKey.getter()
{
  return 0x72557374726F7073;
}

uint64_t ContainerConstants.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ContainerConstants.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ContainerConstants()
{
  return objc_opt_self();
}

uint64_t method lookup function for ContainerConstants()
{
  return swift_lookUpClassMethod();
}

unint64_t OUTLINED_FUNCTION_0_16()
{
  return 0xD000000000000017;
}

double sub_230370190@<D0>(uint64_t a1@<X8>)
{
  return PersistentStorable.getTierConfig(leagueId:client:)(a1);
}

double PersistentStorable.getTierConfig(leagueId:client:)@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 0.0;
  *(_OWORD *)a1 = xmmword_230381280;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  return result;
}

uint64_t sub_2303701B8()
{
  return PersistentStorable.subscriptionsStoreURL(isConventionalOrUnified:)();
}

uint64_t PersistentStorable.subscriptionsStoreURL(isConventionalOrUnified:)()
{
  return sub_23037A094();
}

BOOL static PersistentStoreError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PersistentStoreError.hash(into:)()
{
  return sub_23037AF88();
}

uint64_t PersistentStoreError.hashValue.getter()
{
  sub_23037AF7C();
  sub_23037AF88();
  return sub_23037AFA0();
}

unint64_t sub_23037026C()
{
  unint64_t result;

  result = qword_255E5A278;
  if (!qword_255E5A278)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for PersistentStoreError, &type metadata for PersistentStoreError);
    atomic_store(result, (unint64_t *)&qword_255E5A278);
  }
  return result;
}

uint64_t dispatch thunk of PersistentStorable.filePath.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PersistentStorable.writeEventSubscription(_:isConventionalOrUnified:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of PersistentStorable.deleteSportingEventSubscription(canonicalId:isConventionalOrUnified:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of PersistentStorable.writeAPSMessage(_:canonicalId:isConventionalOrUnified:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 32))();
}

uint64_t dispatch thunk of PersistentStorable.writeRegistrationResponse(_:canonicalId:isConventionalOrUnified:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 40))();
}

uint64_t dispatch thunk of PersistentStorable.retrieveEventSubscription(canonicalId:isConventionalOrUnified:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

uint64_t dispatch thunk of PersistentStorable.fileExists(_:isConventionalOrUnified:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 56))();
}

uint64_t dispatch thunk of PersistentStorable.pathForLogo(_:fileExtension:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 64))();
}

uint64_t dispatch thunk of PersistentStorable.pathForLogo(_:size:fileExtension:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 72))();
}

uint64_t dispatch thunk of PersistentStorable.cleanUpFileSystem(olderThan:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of PersistentStorable.initializeStoreIfNeeded()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of PersistentStorable.createFile(_:isConventionalOrUnified:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 96))();
}

uint64_t dispatch thunk of PersistentStorable.retrieveSuppressionTally()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of PersistentStorable.persistSuppressionTally(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of PersistentStorable.allEventSubscriptionsToConsumers(isConventionalOrUnified:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 120))();
}

uint64_t dispatch thunk of PersistentStorable.readCloudChannelSubscription()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t dispatch thunk of PersistentStorable.writeCloudChannelSubscription(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 136))();
}

uint64_t dispatch thunk of PersistentStorable.readScoreboardSubscription()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 144))();
}

uint64_t dispatch thunk of PersistentStorable.writeScoreboardSubscription(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 152))();
}

uint64_t dispatch thunk of PersistentStorable.writeActivity(activityId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 160))();
}

uint64_t dispatch thunk of PersistentStorable.readActivities()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 168))();
}

uint64_t dispatch thunk of PersistentStorable.removeActivity(activityId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 176))();
}

uint64_t dispatch thunk of PersistentStorable.replaceActivities(activeIds:dismissedIds:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 184))();
}

uint64_t dispatch thunk of PersistentStorable.getTierConfig(leagueId:client:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 192))();
}

uint64_t dispatch thunk of PersistentStorable.readAutostartLiveActivitySuppressions()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 200))();
}

uint64_t dispatch thunk of PersistentStorable.setAutostartLiveActivityStatus(_:forId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 208))();
}

uint64_t dispatch thunk of PersistentStorable.subscriptionsStoreURL(isConventionalOrUnified:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 216))();
}

uint64_t storeEnumTagSinglePayload for PersistentStoreError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2303704AC + 4 * byte_230388A55[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2303704E0 + 4 * byte_230388A50[v4]))();
}

uint64_t sub_2303704E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2303704E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2303704F0);
  return result;
}

uint64_t sub_2303704FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x230370504);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_230370508(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230370510(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PersistentStoreError()
{
  return &type metadata for PersistentStoreError;
}

uint64_t sub_23037052C(uint64_t a1)
{
  return sub_2303705EC(a1, qword_2540621F0);
}

uint64_t sub_230370548(uint64_t a1)
{
  return sub_2303705EC(a1, qword_254062190);
}

uint64_t sub_230370560(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_17(a1, qword_255E6F948);
}

uint64_t sub_230370584(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_17(a1, qword_2540621D0);
}

uint64_t sub_2303705A8(uint64_t a1)
{
  return sub_2303705EC(a1, qword_255E6F960);
}

uint64_t sub_2303705C8(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_17(a1, qword_255E6F978);
}

uint64_t sub_2303705EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_23037A280();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_23037A274();
}

uint64_t OUTLINED_FUNCTION_0_17(uint64_t a1, uint64_t *a2)
{
  return sub_2303705EC(a1, a2);
}

double sub_230370668@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return PersistentStore.getTierConfig(leagueId:client:)(a1, a2, a3);
}

double PersistentStore.getTierConfig(leagueId:client:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  double result;
  __int128 v13;
  uint64_t v14;

  v4 = v3;
  *(_QWORD *)&v13 = a2;
  swift_bridgeObjectRetain();
  sub_23037A670();
  swift_bridgeObjectRetain();
  sub_23037A670();
  swift_bridgeObjectRelease();
  sub_23037099C(a1, v13);
  v7 = v6;
  swift_bridgeObjectRelease();
  if (v7
    && (v8 = *(void **)(v4 + 16),
        v9 = (void *)sub_23037A5A4(),
        swift_bridgeObjectRelease(),
        v10 = objc_msgSend(v8, sel_contentsAtPath_, v9),
        v9,
        v10))
  {
    sub_23037A19C();

    sub_230379EA8();
    swift_allocObject();
    sub_230379E9C();
    sub_230370A48();
    sub_230379E84();
    swift_release();
    OUTLINED_FUNCTION_137_2();
    result = *(double *)&v13;
    *(_QWORD *)a3 = a1;
    *(_OWORD *)(a3 + 8) = v13;
    *(_QWORD *)(a3 + 24) = v14;
  }
  else
  {
    result = 0.0;
    *(_OWORD *)a3 = xmmword_230381280;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 24) = 0;
  }
  return result;
}

uint64_t sub_23037099C(uint64_t a1, uint64_t a2)
{
  uint64_t ObjCClassFromMetadata;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v6 = sub_230370A84(a1, a2, 1852797802, 0xE400000000000000, v5);
  if (v6)
  {
    v7 = v6;
    v8 = sub_23037A5C8();

  }
  else
  {

    return 0;
  }
  return v8;
}

unint64_t sub_230370A48()
{
  unint64_t result;

  result = qword_255E5A280;
  if (!qword_255E5A280)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportsTierConfig, &type metadata for SportsTierConfig);
    atomic_store(result, (unint64_t *)&qword_255E5A280);
  }
  return result;
}

id sub_230370A84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)sub_23037A5A4();
  v7 = (void *)sub_23037A5A4();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(a5, sel_pathForResource_ofType_, v6, v7);

  return v8;
}

uint64_t sub_230370B04()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23037A25C();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_230370B80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + qword_25405A478;
  v2 = sub_23037A25C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  OUTLINED_FUNCTION_12_6();
  OUTLINED_FUNCTION_12_6();
  return v0;
}

uint64_t sub_230370BDC()
{
  sub_230370B80();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AnySafeProxy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AnySafeProxy);
}

BOOL sub_230370C0C()
{
  uint64_t v0;

  v0 = sub_230370C4C();
  return v0 == sub_230370C4C();
}

uint64_t sub_230370C4C()
{
  sub_23037AF7C();
  sub_230370C88();
  return sub_23037AFA0();
}

uint64_t sub_230370C88()
{
  sub_23037A25C();
  sub_23031B484((unint64_t *)&qword_25405A2C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  return sub_23037A550();
}

BOOL sub_230370CF0()
{
  return sub_230370C0C();
}

uint64_t sub_230370D10()
{
  return sub_230370C4C();
}

uint64_t sub_230370D30()
{
  return sub_230370C88();
}

uint64_t sub_230370D50()
{
  sub_23037AF7C();
  sub_230370C88();
  return sub_23037AFA0();
}

uint64_t sub_230370D8C(void (*a1)(void), uint64_t a2, uint64_t a3, void (*a4)(_QWORD *))
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t result;
  void *v13;
  _BYTE *v14;
  uint64_t v15;
  _QWORD aBlock[6];

  v7 = sub_2303717D8();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = a1;
    *(_QWORD *)(v9 + 24) = a2;
    aBlock[4] = sub_2302E348C;
    aBlock[5] = v9;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_230370F2C;
    aBlock[3] = &block_descriptor_19;
    v10 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    v11 = objc_msgSend(v8, sel_remoteObjectProxyWithErrorHandler_, v10);
    _Block_release(v10);

    sub_23037AA9C();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25405ABE8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      aBlock[0] = v15;
      a4(aBlock);
      OUTLINED_FUNCTION_81();
      return swift_unknownObjectRelease();
    }
    else
    {
      sub_23030EFE0();
      v13 = (void *)swift_allocError();
      *v14 = -96;
      a1();

      return OUTLINED_FUNCTION_81();
    }
  }
  else
  {
    result = OUTLINED_FUNCTION_81();
    __break(1u);
  }
  return result;
}

void sub_230370F2C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_230370F7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405AC78);
  v3[9] = v4;
  v3[10] = *(_QWORD *)(v4 - 8);
  v3[11] = OUTLINED_FUNCTION_1_13();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405AC88);
  v3[12] = v5;
  v3[13] = *(_QWORD *)(v5 - 8);
  v3[14] = OUTLINED_FUNCTION_1_13();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405AC70);
  v3[15] = v6;
  v3[16] = *(_QWORD *)(v6 - 8);
  v3[17] = OUTLINED_FUNCTION_1_13();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405AC90);
  v3[18] = v7;
  v3[19] = *(_QWORD *)(v7 - 8);
  v3[20] = OUTLINED_FUNCTION_1_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405AC80);
  v3[21] = OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_30_2();
  return OUTLINED_FUNCTION_2_7();
}

uint64_t sub_230371044()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = v0[21];
  v2 = v0[17];
  v4 = v0[15];
  v3 = v0[16];
  v5 = v0[6];
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v0[9]);
  v6 = swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v1;
  *(_QWORD *)(v6 + 24) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405ABE8);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v2, *MEMORY[0x24BEE6CA0], v4);
  sub_23037A8B0();
  swift_task_dealloc();
  sub_23037A898();
  v7 = (_QWORD *)swift_task_alloc();
  v0[22] = v7;
  *v7 = v0;
  v7[1] = sub_230371168;
  OUTLINED_FUNCTION_30_2();
  return sub_23037A8A4();
}

uint64_t sub_230371168()
{
  OUTLINED_FUNCTION_5_14();
  OUTLINED_FUNCTION_69_1();
  OUTLINED_FUNCTION_30_2();
  return OUTLINED_FUNCTION_2_7();
}

uint64_t sub_2303711AC()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);

  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 184) = v1;
  if (v1)
  {
    v2 = *(int **)(v0 + 56);
    *(_QWORD *)(v0 + 32) = v1;
    v9 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v3;
    *v3 = v0;
    v3[1] = sub_2303712B8;
    return v9(v0 + 32);
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 160);
    v6 = *(_QWORD *)(v0 + 168);
    v7 = *(_QWORD *)(v0 + 144);
    v8 = *(_QWORD *)(v0 + 152);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 96));
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v7);
    sub_230371F44(v6);
    OUTLINED_FUNCTION_10_12();
    swift_task_dealloc();
    OUTLINED_FUNCTION_13_11();
    OUTLINED_FUNCTION_8_14();
    OUTLINED_FUNCTION_15_10();
    OUTLINED_FUNCTION_9_11();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2303712B8()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_5_14();
  *v2 = *v1;
  *(_QWORD *)(v3 + 200) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_30_2();
  return OUTLINED_FUNCTION_2_7();
}

uint64_t sub_230371308()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 152);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 96));
  OUTLINED_FUNCTION_11_11(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_4_14();
  OUTLINED_FUNCTION_10_12();
  OUTLINED_FUNCTION_13_11();
  swift_task_dealloc();
  OUTLINED_FUNCTION_8_14();
  OUTLINED_FUNCTION_15_10();
  OUTLINED_FUNCTION_9_11();
  return OUTLINED_FUNCTION_2_16(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_230371378()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[21];
  v2 = v0[9];
  if (__swift_getEnumTagSinglePayload(v1, 1, v2))
  {
    swift_unknownObjectRelease();
  }
  else
  {
    v4 = v0[10];
    v3 = v0[11];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v1, v2);
    v0[5] = 0;
    sub_23037A88C();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v2);
  }
  v5 = (_QWORD *)swift_task_alloc();
  v0[26] = v5;
  *v5 = v0;
  v5[1] = sub_2303714E0;
  OUTLINED_FUNCTION_30_2();
  return sub_23037A8A4();
}

uint64_t sub_230371460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 96);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  OUTLINED_FUNCTION_11_11(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_4_14();
  OUTLINED_FUNCTION_10_12();
  OUTLINED_FUNCTION_13_11();
  swift_task_dealloc();
  OUTLINED_FUNCTION_8_14();
  OUTLINED_FUNCTION_15_10();
  OUTLINED_FUNCTION_9_11();
  return OUTLINED_FUNCTION_2_16(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2303714E0()
{
  OUTLINED_FUNCTION_5_14();
  OUTLINED_FUNCTION_69_1();
  OUTLINED_FUNCTION_30_2();
  return OUTLINED_FUNCTION_2_7();
}

uint64_t sub_230371524(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  _BYTE *v19;
  _QWORD v20[2];
  _QWORD aBlock[6];

  v20[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_25405AC68);
  v4 = *(_QWORD *)(v20[0] - 8);
  MEMORY[0x24BDAC7A8](v20[0]);
  v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405AC78);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230371F44(a2);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  v11(a2, a1, v7);
  __swift_storeEnumTagSinglePayload(a2, 0, 1, v7);
  result = sub_2303717D8();
  if (result)
  {
    v13 = (void *)result;
    v11((uint64_t)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
    v14 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v15 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v15 + v14, v10, v7);
    aBlock[4] = sub_230371FE8;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_230370F2C;
    aBlock[3] = &block_descriptor_13;
    v16 = _Block_copy(aBlock);
    swift_release();
    v17 = objc_msgSend(v13, sel_remoteObjectProxyWithErrorHandler_, v16);
    _Block_release(v16);

    sub_23037AA9C();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25405ABE8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      aBlock[0] = v20[1];
      sub_23037A880();
      return (*(uint64_t (**)(char *, _QWORD))(v4 + 8))(v6, v20[0]);
    }
    else
    {
      sub_23030EFE0();
      v18 = swift_allocError();
      *v19 = -96;
      aBlock[0] = v18;
      return sub_23037A88C();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_230371794(void *a1)
{
  id v1;

  v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405AC78);
  return sub_23037A88C();
}

uint64_t sub_2303717D8()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25405ACA8);
  sub_23037A940();
  return v1;
}

id sub_230371834@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  void (*v19)();
  uint64_t v20;

  v3 = *(void **)(a1 + 24);
  v4 = v3;
  if (!v3)
  {
    sub_230319BA4(0, &qword_25405ACA0);
    v6 = sub_230371A18(0xD000000000000015, 0x800000023038C930, 4096);
    v7 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_255E73208);
    objc_msgSend(v6, sel_setRemoteObjectInterface_, v7);

    v8 = swift_allocObject();
    swift_weakInit();
    v19 = sub_230371F1C;
    v20 = v8;
    v9 = MEMORY[0x24BDAC760];
    v15 = MEMORY[0x24BDAC760];
    v16 = 1107296256;
    v17 = sub_23030FAA8;
    v18 = &block_descriptor_5;
    v10 = _Block_copy(&v15);
    swift_release();
    objc_msgSend(v6, sel_setInvalidationHandler_, v10);
    _Block_release(v10);
    v19 = sub_230371BA0;
    v20 = 0;
    v15 = v9;
    v16 = 1107296256;
    v17 = sub_23030FAA8;
    v18 = &block_descriptor_4_0;
    v11 = _Block_copy(&v15);
    objc_msgSend(v6, sel_setInterruptionHandler_, v11);
    _Block_release(v11);
    objc_msgSend(v6, sel_resume);
    v12 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v6;

    v4 = *(void **)(a1 + 24);
    v13 = v4;
  }
  *a2 = v4;
  return v3;
}

id sub_230371A18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_23037A5A4();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithMachServiceName_options_, v5, a3);

  return v6;
}

void sub_230371A90()
{
  uint64_t Strong;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void *v6;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v1 = Strong;
    if (qword_254059E78 != -1)
      swift_once();
    v2 = sub_23037A280();
    __swift_project_value_buffer(v2, (uint64_t)qword_254062190);
    v3 = sub_23037A268();
    v4 = sub_23037A904();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2302D3000, v3, v4, "Connection to daemon invalidated", v5, 2u);
      MEMORY[0x2348B7D1C](v5, -1, -1);
    }

    v6 = *(void **)(v1 + 24);
    *(_QWORD *)(v1 + 24) = 0;
    swift_release();

  }
}

void sub_230371BA0()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (qword_254059E78 != -1)
    swift_once();
  v0 = sub_23037A280();
  __swift_project_value_buffer(v0, (uint64_t)qword_254062190);
  oslog = sub_23037A268();
  v1 = sub_23037A904();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_2302D3000, oslog, v1, "Connection to daemon interrupted", v2, 2u);
    MEMORY[0x2348B7D1C](v2, -1, -1);
  }

}

uint64_t sub_230371C6C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 24);
  if (v1)
    objc_msgSend(v1, sel_invalidate);

  return v0;
}

uint64_t sub_230371CA4()
{
  sub_230371C6C();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for GuaranteedProxy()
{
  return objc_opt_self();
}

uint64_t sub_230371CE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;

  v1 = sub_23037A928();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_2_0();
  v5 = v4 - v3;
  v6 = sub_23037A910();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_2_0();
  v8 = sub_23037A4CC();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_2_0();
  sub_230319BA4(0, (unint64_t *)&qword_25405B488);
  sub_23037A4B4();
  sub_23031B484(&qword_25405BBE0, v7, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B510);
  sub_23037204C();
  sub_23037AAC0();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v5, *MEMORY[0x24BEE5750], v1);
  *(_QWORD *)(v0 + 16) = sub_23037A958();
  *(_QWORD *)(v0 + 24) = 0;
  return v0;
}

uint64_t sub_230371E8C()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for XPCConnectionProvider()
{
  return objc_opt_self();
}

void sub_230371ED0()
{
  JUMPOUT(0x2348B7C44);
}

id sub_230371EE0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_230371834(v1, a1);
}

uint64_t sub_230371EF8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_230371F1C()
{
  sub_230371A90();
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

uint64_t sub_230371F3C(uint64_t a1)
{
  uint64_t v1;

  return sub_230371524(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_230371F44(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405AC80);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_230371F84()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405AC78);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_230371FE8(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405AC78);
  return sub_230371794(a1);
}

uint64_t sub_230372028()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_23037204C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25405BBD8;
  if (!qword_25405BBD8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25405B510);
    result = MEMORY[0x2348B7C44](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_25405BBD8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_13()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_2_16(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_4_14()
{
  uint64_t v0;

  return sub_230371F44(*(_QWORD *)(v0 + 168));
}

void OUTLINED_FUNCTION_5_14()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_8_14()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_9_11()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_11_11@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_12_6()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_13_11()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_15_10()
{
  return swift_task_dealloc();
}

uint64_t sub_230372134()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_23037A2E0();
  swift_release();
  swift_release();
  return v1;
}

void sub_2303721A4()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  sub_23037A2EC();
  OUTLINED_FUNCTION_104();
}

id sub_230372200()
{
  char *v0;
  objc_class *ObjectType;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  objc_super v21;
  char v22;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A2F8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = &v0[OBJC_IVAR____TtC9SportsKit8AppState__state];
  v22 = 2;
  v7 = v0;
  sub_23037A2C8();
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v5, v2);

  v21.receiver = v7;
  v21.super_class = ObjectType;
  v8 = objc_msgSendSuper2(&v21, sel_init);
  objc_opt_self();
  v9 = v8;
  v10 = OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_0_18(v10, v11, v12, (uint64_t)sel_applicationWillTerminate, *MEMORY[0x24BEBE018]);

  v13 = OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_0_18(v13, v14, v15, (uint64_t)sel_applicationDidEnterBackgroundNotification, *MEMORY[0x24BEBDF98]);

  v16 = OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_0_18(v16, v17, v18, (uint64_t)sel_applicationWillEnterForegroundNotification, *MEMORY[0x24BEBE008]);

  return v9;
}

void sub_2303723A4()
{
  void *v0;
  objc_class *ObjectType;
  id v2;
  objc_super v3;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v2, sel_removeObserver_, v0);

  v3.receiver = v0;
  v3.super_class = ObjectType;
  objc_msgSendSuper2(&v3, sel_dealloc);
  OUTLINED_FUNCTION_104();
}

uint64_t sub_23037247C()
{
  return type metadata accessor for AppState();
}

uint64_t type metadata accessor for AppState()
{
  uint64_t result;

  result = qword_25405ABF8;
  if (!qword_25405ABF8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_230372544(const char *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  if (qword_25405B480 != -1)
    swift_once();
  v2 = sub_23037A280();
  __swift_project_value_buffer(v2, (uint64_t)qword_2540621F0);
  v3 = sub_23037A268();
  v4 = sub_23037A8F8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2302D3000, v3, v4, a1, v5, 2u);
    MEMORY[0x2348B7D1C](v5, -1, -1);
  }

  sub_2303721A4();
}

void sub_230372668()
{
  unint64_t v0;

  sub_2303726D4();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_2303726D4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25405A300)
  {
    v0 = sub_23037A2F8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25405A300);
  }
}

uint64_t storeEnumTagSinglePayload for AppState.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_230372768 + 4 * byte_230388CAD[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23037279C + 4 * byte_230388CA8[v4]))();
}

uint64_t sub_23037279C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2303727A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2303727ACLL);
  return result;
}

uint64_t sub_2303727B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2303727C0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2303727C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2303727CC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppState.State()
{
  return &type metadata for AppState.State;
}

unint64_t sub_2303727EC()
{
  unint64_t result;

  result = qword_255E5A2D0;
  if (!qword_255E5A2D0)
  {
    result = MEMORY[0x2348B7C44](&unk_230388D04, &type metadata for AppState.State);
    atomic_store(result, (unint64_t *)&qword_255E5A2D0);
  }
  return result;
}

void sub_230372828(_BYTE *a1@<X8>)
{
  *a1 = sub_230372134();
  OUTLINED_FUNCTION_3();
}

void sub_23037284C()
{
  sub_2303721A4();
  OUTLINED_FUNCTION_3();
}

id OUTLINED_FUNCTION_0_18(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;

  return objc_msgSend(a1, (SEL)(v6 + 3912), v5, a4, a5, 0);
}

id OUTLINED_FUNCTION_1_14()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 3455));
}

_QWORD *sub_230372888()
{
  _QWORD *result;

  type metadata accessor for CloudChannelSubscriptionManager();
  swift_allocObject();
  result = sub_23035832C();
  qword_25405B108 = (uint64_t)result;
  return result;
}

uint64_t static CloudChannelSubscriptionManager.shared.getter()
{
  if (qword_25405B110 != -1)
    swift_once();
  return swift_retain();
}

unint64_t static CloudChannelSubscriptionManager.topic.getter()
{
  return 0xD000000000000011;
}

void CloudChannelSubscriptionManager.__allocating_init(store:)(void (*a1)(__int128 *__return_ptr, uint64_t))
{
  swift_allocObject();
  CloudChannelSubscriptionManager.init(store:)(a1);
  OUTLINED_FUNCTION_13_0();
}

uint64_t CloudChannelSubscriptionManager.init(store:)(void (*a1)(__int128 *__return_ptr, uint64_t))
{
  uint64_t v1;
  uint64_t v3;
  __int128 v5[2];

  v3 = swift_defaultActor_initialize();
  a1(v5, v3);
  sub_2302E18FC(v5, v1 + 112);
  return v1;
}

void sub_2303729B4(char a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = OUTLINED_FUNCTION_43_0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_96();
  v6 = v1[17];
  v7 = v1[18];
  OUTLINED_FUNCTION_10_13(v1 + 14);
  (*(void (**)(uint64_t, uint64_t))(v7 + 128))(v6, v7);
  if (!v2)
  {
    sub_23037A214();
    CloudChannelSubscription.audit(clearExpiredEntries:deadline:limit:)(a1 & 1, v3, 10);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_0_19();
    swift_release();
  }
  OUTLINED_FUNCTION_4();
}

uint64_t sub_230372AA8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
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
  uint64_t v16;
  uint64_t v18;

  v4 = OUTLINED_FUNCTION_43_0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_96();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_25_3();
  v7 = v2[17];
  v8 = v2[18];
  __swift_project_boxed_opaque_existential_1(v2 + 14, v7);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 128))(v7, v8);
  if (!v18)
  {
    v10 = v9;
    v16 = v3;
    sub_230372FD8(a1);
    v12 = v11;
    __swift_storeEnumTagSinglePayload(v1, 1, 1, v4);
    CloudChannelSubscription.updateDemand(for:deadline:)(v12, v1);
    swift_bridgeObjectRelease();
    sub_2303734FC(v1);
    sub_23037A214();
    v3 = CloudChannelSubscription.audit(clearExpiredEntries:deadline:limit:)(1, v16, 10);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v16, v4);
    v14 = v2[17];
    v13 = v2[18];
    OUTLINED_FUNCTION_10_13(v2 + 14);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 136))(v10, v14, v13);
    swift_release();
  }
  return v3;
}

unint64_t sub_230372C6C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v0[17];
  v3 = v0[18];
  __swift_project_boxed_opaque_existential_1(v0 + 14, v2);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 128))(v2, v3);
  if (v1)
  {
    sub_23037AB14();
    swift_bridgeObjectRelease();
    swift_getErrorValue();
    sub_23037AF34();
    sub_23037A670();
    swift_bridgeObjectRelease();
    v5 = 0xD000000000000026;
    sub_23037353C();
    OUTLINED_FUNCTION_176();
    *(_QWORD *)v6 = 0xD000000000000026;
    *(_QWORD *)(v6 + 8) = 0x800000023038C9B0;
    *(_BYTE *)(v6 + 16) = 0;
    swift_willThrow();

  }
  else
  {
    v7 = v4;
    OUTLINED_FUNCTION_3_3();
    v5 = *(_QWORD *)(v7 + 24);
    swift_bridgeObjectRetain();
    swift_release();
  }
  return v5;
}

void sub_230372D98(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v1[17];
  v8 = v1[18];
  OUTLINED_FUNCTION_10_13(v1 + 14);
  (*(void (**)(uint64_t, uint64_t))(v8 + 128))(v7, v8);
  if (v2)
  {
    v16 = 0;
    v17 = 0xE000000000000000;
    sub_23037AB14();
    swift_bridgeObjectRelease();
    v16 = 0xD00000000000001DLL;
    v17 = 0x800000023038C9E0;
    swift_getErrorValue();
    sub_23037AF34();
    sub_23037A670();
    swift_bridgeObjectRelease();
    v12 = v16;
    v13 = v17;
    sub_23037353C();
    OUTLINED_FUNCTION_176();
    *(_QWORD *)v14 = v12;
    *(_QWORD *)(v14 + 8) = v13;
    *(_BYTE *)(v14 + 16) = 1;
    swift_willThrow();

  }
  else
  {
    v9 = OUTLINED_FUNCTION_43_0();
    OUTLINED_FUNCTION_57_4((uint64_t)v6, v10, v11, v9);
    CloudChannelSubscription.updateChannelMap(_:deadline:)(a1, (uint64_t)v6);
    sub_2303734FC((uint64_t)v6);
    OUTLINED_FUNCTION_0_19();
    swift_release();
  }
}

uint64_t sub_230372F2C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v0[17];
  v3 = v0[18];
  __swift_project_boxed_opaque_existential_1(v0 + 14, v2);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 128))(v2, v3);
  if (!v1)
  {
    v5 = result;
    CloudChannelSubscription.clearChannelMap()();
    v7 = v0[17];
    v6 = v0[18];
    __swift_project_boxed_opaque_existential_1(v0 + 14, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 136))(v5, v7, v6);
    return swift_release();
  }
  return result;
}

void sub_230372FD8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  int64_t v3;
  int64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
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
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  unint64_t v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  _QWORD *v49;
  BOOL v50;
  uint64_t v51;
  char v52;
  _QWORD *v53;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  uint64_t v58;
  _QWORD *v59;
  BOOL v60;
  _QWORD v61[2];
  uint64_t v62;
  uint64_t v63;
  int64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int64_t v69;
  _QWORD v70[14];
  uint64_t v71;

  v4 = v3;
  v6 = type metadata accessor for CloudChannelSubscription.CacheValue();
  v68 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_25_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B230);
  OUTLINED_FUNCTION_13();
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (_QWORD *)((char *)v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v8);
  v12 = (_QWORD *)((char *)v61 - v11);
  v13 = MEMORY[0x24BEE4B08];
  v71 = MEMORY[0x24BEE4B08];
  v14 = *(_QWORD *)(a1 + 16);
  if (v14)
  {
    v69 = v3;
    swift_bridgeObjectRetain();
    v15 = (_BYTE *)(a1 + 40);
    do
    {
      if (*v15 && *v15 != 1)
      {
        sub_2302EF24C(v70, 5000257, 0xE300000000000000);
        swift_bridgeObjectRelease();
      }
      else
      {
        v16 = v71;
        v17 = swift_bridgeObjectRetain();
        v71 = sub_2302EA848(v17, v16);
      }
      v15 += 16;
      --v14;
    }
    while (v14);
    OUTLINED_FUNCTION_22_1();
    v4 = v69;
  }
  v70[12] = v13;
  v19 = v2[17];
  v18 = v2[18];
  __swift_project_boxed_opaque_existential_1(v2 + 14, v19);
  v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 128))(v19, v18);
  if (v4)
  {
    swift_bridgeObjectRelease();
LABEL_63:
    OUTLINED_FUNCTION_4();
    return;
  }
  v21 = v20;
  v61[1] = 0;
  OUTLINED_FUNCTION_3_3();
  v22 = *(_QWORD *)(v21 + 24);
  swift_bridgeObjectRetain();
  swift_release();
  v69 = 0;
  v23 = *(_QWORD *)(v22 + 64);
  v63 = v22 + 64;
  v24 = 1 << *(_BYTE *)(v22 + 32);
  if (v24 < 64)
    v25 = ~(-1 << v24);
  else
    v25 = -1;
  v26 = v25 & v23;
  v27 = v71;
  v66 = v22;
  v67 = v71 + 56;
  v64 = (unint64_t)(v24 + 63) >> 6;
  v61[0] = v64 - 1;
  v65 = (uint64_t *)v1;
  while (v26)
  {
    v28 = __clz(__rbit64(v26));
    v26 &= v26 - 1;
    v29 = v28 | (v69 << 6);
LABEL_17:
    v30 = *(_QWORD *)(v66 + 56);
    v31 = (_QWORD *)(*(_QWORD *)(v66 + 48) + 16 * v29);
    v32 = v31[1];
    *v10 = *v31;
    v10[1] = v32;
    v33 = v30 + *(_QWORD *)(v68 + 72) * v29;
    v34 = OUTLINED_FUNCTION_11_12();
    sub_23031BCA4(v33, (uint64_t)v10 + *(int *)(v34 + 48));
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v34);
    swift_bridgeObjectRetain();
LABEL_36:
    sub_2303739F0((uint64_t)v10, (uint64_t)v12);
    v41 = OUTLINED_FUNCTION_11_12();
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v41) == 1)
    {
      OUTLINED_FUNCTION_22_1();
      swift_release();
      goto LABEL_63;
    }
    v42 = *v12;
    v43 = v12[1];
    sub_23031EA40((uint64_t)v12 + *(int *)(v41 + 48), v1);
    if (!*(_QWORD *)(v27 + 16))
    {
      OUTLINED_FUNCTION_103_0();
      goto LABEL_61;
    }
    sub_23037AF7C();
    swift_bridgeObjectRetain();
    sub_23037A64C();
    v44 = sub_23037AFA0();
    v45 = -1 << *(_BYTE *)(v27 + 32);
    v46 = v44 & ~v45;
    OUTLINED_FUNCTION_4_15();
    if ((v47 & 1) != 0)
    {
      v48 = *(_QWORD *)(v27 + 48);
      v49 = (_QWORD *)(v48 + 16 * v46);
      v50 = *v49 == v42 && v49[1] == v43;
      if (!v50 && (OUTLINED_FUNCTION_1_15() & 1) == 0)
      {
        v62 = ~v45;
        v51 = (v46 + 1) & ~v45;
        OUTLINED_FUNCTION_4_15();
        if ((v52 & 1) != 0)
        {
          v53 = (_QWORD *)(v48 + 16 * v51);
          v54 = *v53 == v42 && v53[1] == v43;
          if (v54 || (OUTLINED_FUNCTION_1_15() & 1) != 0)
            goto LABEL_50;
          for (i = v51 + 1; ; i = v58 + 1)
          {
            v58 = i & v62;
            if (((*(_QWORD *)(v67 + (((i & (unint64_t)v62) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v62)) & 1) == 0)
              break;
            v59 = (_QWORD *)(v48 + 16 * v58);
            v60 = *v59 == v42 && v59[1] == v43;
            if (v60 || (OUTLINED_FUNCTION_1_15() & 1) != 0)
              goto LABEL_50;
          }
        }
        goto LABEL_60;
      }
LABEL_50:
      OUTLINED_FUNCTION_103_0();
      OUTLINED_FUNCTION_22_1();
      v1 = (uint64_t)v65;
      v55 = *v65;
      v56 = v65[1];
      swift_bridgeObjectRetain();
      sub_2302EF24C(v70, v55, v56);
      swift_bridgeObjectRelease();
      sub_23031BCE8(v1);
    }
    else
    {
LABEL_60:
      OUTLINED_FUNCTION_103_0();
      OUTLINED_FUNCTION_22_1();
      v1 = (uint64_t)v65;
LABEL_61:
      sub_23031BCE8(v1);
    }
  }
  v35 = v69 + 1;
  if (__OFADD__(v69, 1))
  {
    __break(1u);
    goto LABEL_65;
  }
  if (v35 >= v64)
  {
LABEL_35:
    v38 = OUTLINED_FUNCTION_11_12();
    OUTLINED_FUNCTION_57_4((uint64_t)v10, v39, v40, v38);
    v26 = 0;
    goto LABEL_36;
  }
  v36 = *(_QWORD *)(v63 + 8 * v35);
  if (v36)
  {
LABEL_21:
    v26 = (v36 - 1) & v36;
    v29 = __clz(__rbit64(v36)) + (v35 << 6);
    v69 = v35;
    goto LABEL_17;
  }
  v37 = v69 + 2;
  ++v69;
  if (v35 + 1 >= v64)
    goto LABEL_35;
  v36 = *(_QWORD *)(v63 + 8 * v37);
  if (v36)
    goto LABEL_24;
  v69 = v35 + 1;
  if (v35 + 2 >= v64)
    goto LABEL_35;
  v36 = *(_QWORD *)(v63 + 8 * (v35 + 2));
  if (v36)
  {
    v35 += 2;
    goto LABEL_21;
  }
  v37 = v35 + 3;
  v69 = v35 + 2;
  if (v35 + 3 >= v64)
    goto LABEL_35;
  v36 = *(_QWORD *)(v63 + 8 * v37);
  if (v36)
  {
LABEL_24:
    v35 = v37;
    goto LABEL_21;
  }
  while (1)
  {
    v35 = v37 + 1;
    if (__OFADD__(v37, 1))
      break;
    if (v35 >= v64)
    {
      v69 = v61[0];
      goto LABEL_35;
    }
    v36 = *(_QWORD *)(v63 + 8 * v35);
    ++v37;
    if (v36)
      goto LABEL_21;
  }
LABEL_65:
  __break(1u);
}

uint64_t sub_2303734FC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23037353C()
{
  unint64_t result;

  result = qword_255E5A2D8;
  if (!qword_255E5A2D8)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for CloudChannelError, &type metadata for CloudChannelError);
    atomic_store(result, (unint64_t *)&qword_255E5A2D8);
  }
  return result;
}

uint64_t CloudChannelSubscriptionManager.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t CloudChannelSubscriptionManager.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t CloudChannelSubscriptionManager.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_2303735CC()
{
  return CloudChannelSubscriptionManager.unownedExecutor.getter();
}

unint64_t static CloudChannelError.errorDomain.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t CloudChannelError.errorCode.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16) + 1;
}

uint64_t CloudChannelError.errorUserInfo.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unsigned __int8 v3;
  uint64_t inited;
  uint64_t v5;

  v1 = *(_QWORD *)v0;
  v2 = *(_QWORD *)(v0 + 8);
  v3 = *(_BYTE *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E58B20);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23037BDD0;
  *(_QWORD *)(inited + 32) = sub_23037A5C8();
  *(_QWORD *)(inited + 40) = v5;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v1;
  *(_QWORD *)(inited + 56) = v2;
  sub_2303736BC(v1, v2, v3);
  return sub_23037A520();
}

uint64_t sub_2303736BC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 3u)
    return swift_bridgeObjectRetain();
  return result;
}

unint64_t sub_2303736D8()
{
  static CloudChannelError.errorDomain.getter();
  return 0xD00000000000001CLL;
}

uint64_t sub_2303736FC()
{
  sub_2303739B4();
  return sub_23037AF28();
}

uint64_t sub_230373724()
{
  sub_2303739B4();
  return sub_23037AF1C();
}

uint64_t type metadata accessor for CloudChannelSubscriptionManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for CloudChannelSubscriptionManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CloudChannelSubscriptionManager.__allocating_init(store:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of CloudChannelSubscriptionManager.audit(clearExpiredEntries:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of CloudChannelSubscriptionManager.signal(demand:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of CloudChannelSubscriptionManager.readChannelMap()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of CloudChannelSubscriptionManager.updateChannelMap(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of CloudChannelSubscriptionManager.clearChannelMap()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t destroy for CloudChannelError(uint64_t a1)
{
  return sub_230373820(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_230373820(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 3u)
    return swift_bridgeObjectRelease();
  return result;
}

void _s9SportsKit17CloudChannelErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2303736BC(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  OUTLINED_FUNCTION_13_0();
}

uint64_t assignWithCopy for CloudChannelError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2303736BC(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_230373820(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for CloudChannelError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_230373820(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CloudChannelError(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 3)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CloudChannelError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_230373994(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_23037399C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CloudChannelError()
{
  return &type metadata for CloudChannelError;
}

unint64_t sub_2303739B4()
{
  unint64_t result;

  result = qword_255E5A2E0;
  if (!qword_255E5A2E0)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for CloudChannelError, &type metadata for CloudChannelError);
    atomic_store(result, (unint64_t *)&qword_255E5A2E0);
  }
  return result;
}

uint64_t sub_2303739F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B230);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_19()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 144);
  __swift_project_boxed_opaque_existential_1(v2, v4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 136))(v1, v4, v3);
}

uint64_t OUTLINED_FUNCTION_1_15()
{
  return sub_23037AE8C();
}

uint64_t OUTLINED_FUNCTION_11_12()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t sub_230373A9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  _QWORD v11[4];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405C708);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_23037AC34();
  v9 = sub_23037AC4C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a3, v8, v9);
  sub_2302DF610((uint64_t)v8, &qword_25405C708);
  v11[2] = 0;
  v11[3] = 0xE000000000000000;
  swift_bridgeObjectRetain();
  sub_23037AB14();
  sub_23037A670();
  v11[0] = a1;
  v11[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A3A0);
  sub_23037ABE0();
  sub_23037A670();
  result = sub_23037AC88();
  __break(1u);
  return result;
}

uint64_t sub_230373C44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  __int128 *v10;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  _QWORD v17[4];
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  _OWORD v22[2];

  v6 = sub_23037AC4C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2302E0808(a1, (uint64_t)&v20);
  if (!v21)
  {
    sub_2302DF610((uint64_t)&v20, qword_25405C288);
    sub_230373A9C(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    sub_230317E90(v22);
    sub_2302DF610(a1, qword_25405C288);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v10 = v22;
    return sub_2302DF610((uint64_t)v10, &qword_25405BC80);
  }
  sub_2302E18FC(&v20, (uint64_t)v22);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E57DB8);
  *(_QWORD *)&v18 = swift_allocObject();
  sub_2302E00E4((uint64_t)v22, v18 + 16);
  sub_230373A9C(a2, a3, (uint64_t)v9);
  sub_2303659F4();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (!v21)
  {
    swift_bridgeObjectRelease();
    sub_2302DF610(a1, qword_25405C288);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    v10 = &v20;
    return sub_2302DF610((uint64_t)v10, &qword_25405BC80);
  }
  sub_2302E18B0(&v20, &v18);
  sub_2302E18C0((uint64_t)&v18, (uint64_t)v17);
  if ((swift_dynamicCast() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
  }
  else
  {
    if (qword_255E576F0 != -1)
      swift_once();
    v12 = sub_23037A280();
    __swift_project_value_buffer(v12, (uint64_t)qword_255E6F960);
    swift_bridgeObjectRetain();
    v13 = sub_23037A268();
    v14 = sub_23037A904();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      *(_QWORD *)&v20 = v16;
      *(_DWORD *)v15 = 136315138;
      swift_bridgeObjectRetain();
      v17[0] = sub_23036514C(a2, a3, (uint64_t *)&v20);
      sub_23037AA30();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2302D3000, v13, v14, "New value stored for property %s does not match old type. This may indicate a bug.", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348B7D1C](v16, -1, -1);
      MEMORY[0x2348B7D1C](v15, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

  }
  sub_2302DF610(a1, qword_25405C288);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v18);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
}

uint64_t sub_230373FAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[2];

  v5 = v3;
  v15[1] = *(_QWORD *)v5;
  v9 = sub_23037A118();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v5 + 48) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v5 + 56) = 0;
  *(_QWORD *)(v5 + 24) = a1;
  *(_QWORD *)(v5 + 32) = a2;
  swift_bridgeObjectRetain();
  sub_230374118(a1, a2, a3);
  swift_bridgeObjectRelease();
  type metadata accessor for FileSystemMonitor();
  swift_allocObject();
  v12 = sub_23031A850((uint64_t)v11);
  if (v4)
  {
    OUTLINED_FUNCTION_3_14();
    swift_bridgeObjectRelease();
    sub_230319F60(v5 + 40);

    swift_deallocPartialClassInstance();
  }
  else
  {
    v13 = v12;
    OUTLINED_FUNCTION_3_14();
    *(_QWORD *)(v5 + 16) = v13;
    *(_QWORD *)(v13 + OBJC_IVAR____TtC9SportsKit17FileSystemMonitor_delegate + 8) = &off_24FE0FA40;
    swift_unknownObjectWeakAssign();
  }
  return v5;
}

uint64_t sub_230374118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  void (*v18)(char *, uint64_t);
  _QWORD v19[4];

  v6 = sub_23037A118();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v19 - v11;
  v19[2] = a1;
  v19[3] = a2;
  v19[0] = 11822;
  v19[1] = 0xE200000000000000;
  sub_2302DF64C();
  if ((sub_23037AA90() & 1) != 0)
  {
    if (qword_25405B480 != -1)
      swift_once();
    v13 = OUTLINED_FUNCTION_24_0();
    __swift_project_value_buffer(v13, (uint64_t)qword_2540621F0);
    v14 = sub_23037A268();
    v15 = sub_23037A904();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)OUTLINED_FUNCTION_5_2();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_2302D3000, v14, v15, "canonicalId cannot contain parental traversal string patterns", v16, 2u);
      OUTLINED_FUNCTION_28_0();
    }

    return sub_23037A094();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, a3, v6);
    sub_23037A0C4();
    sub_23037A0D0();
    swift_bridgeObjectRelease();
    v18 = *(void (**)(char *, uint64_t))(v7 + 8);
    v18(v10, v6);
    return ((uint64_t (*)(char *, uint64_t))v18)(v12, v6);
  }
}

void sub_23037431C(double a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = *(void **)(v1 + 56);
  if (v3)
    objc_msgSend(v3, sel_invalidate);
  sub_230374C4C();
  v4 = swift_allocObject();
  swift_weakInit();
  v5 = sub_23037449C(0, (uint64_t)sub_230374CAC, v4, a1);
  v6 = *(void **)(v1 + 56);
  *(_QWORD *)(v1 + 56) = v5;

  v7 = *(_QWORD *)(v1 + 56);
  if (v7)
  {
    v8 = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
    objc_msgSend(v8, sel_addTimer_forMode_, v7, *MEMORY[0x24BDBCB80]);

  }
}

uint64_t sub_230374420()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    if (MEMORY[0x2348B7DD0](result + 40))
    {
      sub_230316104();
      swift_release();
      return swift_unknownObjectRelease();
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

id sub_23037449C(char a1, uint64_t a2, uint64_t a3, double a4)
{
  void *v6;
  id v7;
  _QWORD v9[6];

  v9[4] = a2;
  v9[5] = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_230370F2C;
  v9[3] = &block_descriptor_6;
  v6 = _Block_copy(v9);
  v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_timerWithTimeInterval_repeats_block_, a1 & 1, v6, a4);
  _Block_release(v6);
  swift_release();
  return v7;
}

uint64_t sub_230374550()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 56);
  if (v1)
    objc_msgSend(v1, sel_invalidate);
  swift_release();
  swift_bridgeObjectRelease();
  sub_230319F60(v0 + 40);

  return v0;
}

uint64_t sub_230374598()
{
  sub_230374550();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SportingEventMonitor()
{
  return objc_opt_self();
}

void sub_2303745D8()
{
  uint64_t v0;
  void (*v1)(_QWORD *, _QWORD);
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  _QWORD v5[5];

  sub_230379EA8();
  swift_allocObject();
  sub_230379E9C();
  v5[3] = type metadata accessor for DefaultSportsJSONInitFailureObserver();
  v5[4] = &protocol witness table for DefaultSportsJSONInitFailureObserver;
  v5[0] = swift_allocObject();
  v1 = (void (*)(_QWORD *, _QWORD))sub_230379E90();
  sub_230373C44((uint64_t)v5, 0xD000000000000027, 0x8000000230389F20);
  v1(v4, 0);
  type metadata accessor for SportingEventSubscription(0);
  sub_230374C0C();
  sub_230379E84();
  v2 = v5[0];
  if (MEMORY[0x2348B7DD0](v0 + 40))
  {
    sub_2303167A4();
    swift_unknownObjectRelease();
  }
  v3 = v2 + OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_sportingEventDetails;
  OUTLINED_FUNCTION_15_1();
  __asm { BR              X10 }
}

unint64_t sub_230374C0C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25405B038;
  if (!qword_25405B038)
  {
    v1 = type metadata accessor for SportingEventSubscription(255);
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportingEventSubscription, v1);
    atomic_store(result, (unint64_t *)&qword_25405B038);
  }
  return result;
}

unint64_t sub_230374C4C()
{
  unint64_t result;

  result = qword_25405B470;
  if (!qword_25405B470)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25405B470);
  }
  return result;
}

uint64_t sub_230374C88()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_230374CAC()
{
  return sub_230374420();
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

uint64_t sub_230374CCC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_3_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_230374D00(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6974697669746361 && a2 == 0xEA00000000007365;
  if (v2 || (sub_23037AE8C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023038CB10)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23037AE8C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_230374DF8(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000013;
  else
    return 0x6974697669746361;
}

uint64_t sub_230374E38()
{
  char *v0;

  return sub_230374DF8(*v0);
}

uint64_t sub_230374E40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_230374D00(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_230374E64()
{
  sub_230374FC8();
  return sub_23037B00C();
}

uint64_t sub_230374E8C()
{
  sub_230374FC8();
  return sub_23037B018();
}

void PersistentActivities.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25405A1B8);
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_12();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_230374FC8();
  sub_23037B000();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B518);
  sub_2302DFC9C(&qword_25405B270, MEMORY[0x24BEE0D08], MEMORY[0x24BEE1700]);
  OUTLINED_FUNCTION_0_20();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25405B508);
    sub_23031EB04();
    OUTLINED_FUNCTION_0_20();
  }
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v1);
  OUTLINED_FUNCTION_4();
}

unint64_t sub_230374FC8()
{
  unint64_t result;

  result = qword_25405B670;
  if (!qword_25405B670)
  {
    result = MEMORY[0x2348B7C44](&unk_2303890B8, &type metadata for PersistentActivities.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405B670);
  }
  return result;
}

void PersistentActivities.init(from:)(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B528);
  MEMORY[0x24BDAC7A8](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_230374FC8();
  sub_23037AFD0();
  if (v2)
  {
    OUTLINED_FUNCTION_23_0();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25405B518);
    sub_2302DFC9C(&qword_25405B520, MEMORY[0x24BEE0D38], MEMORY[0x24BEE1720]);
    OUTLINED_FUNCTION_5_15();
    OUTLINED_FUNCTION_8_15();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25405B508);
    v6 = sub_23031EC0C();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_5_15();
    OUTLINED_FUNCTION_8_15();
    OUTLINED_FUNCTION_5_5();
    if (v6)
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_23_0();
    }
    else
    {
      *a2 = v7;
      a2[1] = v7;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_23_0();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_4();
}

void sub_230375188(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  PersistentActivities.init(from:)(a1, a2);
}

void sub_23037519C(_QWORD *a1)
{
  PersistentActivities.encode(to:)(a1);
}

uint64_t destroy for PersistentActivities()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s9SportsKit20PersistentActivitiesVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for PersistentActivities(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for PersistentActivities(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PersistentActivities(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PersistentActivities(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PersistentActivities()
{
  return &type metadata for PersistentActivities;
}

uint64_t *sub_230375334(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v27;
  int v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;

  v8 = v5;
  v28 = a4;
  v27 = a2;
  v35 = a1;
  v29 = *v8;
  sub_23037A070();
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_12();
  v11 = sub_23037A118();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v27 - v16;
  v8[4] = 0;
  v30 = v8 + 3;
  swift_unknownObjectWeakInit();
  v33 = 0xD000000000000011;
  v34 = 0x800000023038C340;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 104))(v6, *MEMORY[0x24BDCD7A0], v4);
  sub_2302DF64C();
  v32 = a3;
  sub_23037A10C();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v4);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  type metadata accessor for FileSystemMonitor();
  swift_allocObject();
  v18 = v31;
  v19 = sub_23031A850((uint64_t)v15);
  if (v18)
  {
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_3_15(v32);
    OUTLINED_FUNCTION_3_15((uint64_t)v17);
    sub_230319F60((uint64_t)v30);
    swift_deallocPartialClassInstance();
  }
  else
  {
    v20 = v32;
    v8[2] = v19;
    *(_QWORD *)(v19 + OBJC_IVAR____TtC9SportsKit17FileSystemMonitor_delegate + 8) = &off_24FE0FBE0;
    swift_unknownObjectWeakAssign();
    v8[4] = v27;
    swift_unknownObjectWeakAssign();
    if ((v28 & 1) != 0)
    {
      v21 = v17;
      v22 = sub_23037A148();
      v24 = v23;
      sub_23037A0A0();
      v31 = v25;
      sub_230375600(v22, v24);
      swift_bridgeObjectRelease();
      sub_2302E340C(v22, v24);
      swift_unknownObjectRelease();
      v17 = v21;
    }
    else
    {
      swift_unknownObjectRelease();
    }
    OUTLINED_FUNCTION_3_15(v20);
    OUTLINED_FUNCTION_3_15((uint64_t)v17);
  }
  return v8;
}

#error "23037574C: call analysis failed (funcsize=96)"

uint64_t sub_230375798()
{
  uint64_t v0;

  swift_release();
  sub_230319F60(v0 + 24);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ActivitiesMonitor()
{
  return objc_opt_self();
}

uint64_t storeEnumTagSinglePayload for PersistentActivities.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_230375830 + 4 * byte_230388F25[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_230375864 + 4 * byte_230388F20[v4]))();
}

uint64_t sub_230375864(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23037586C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x230375874);
  return result;
}

uint64_t sub_230375880(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x230375888);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23037588C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230375894(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PersistentActivities.CodingKeys()
{
  return &type metadata for PersistentActivities.CodingKeys;
}

unint64_t sub_2303758B4()
{
  unint64_t result;

  result = qword_255E5A3A8;
  if (!qword_255E5A3A8)
  {
    result = MEMORY[0x2348B7C44](&unk_230389080, &type metadata for PersistentActivities.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E5A3A8);
  }
  return result;
}

unint64_t sub_2303758F8()
{
  unint64_t result;

  result = qword_25405B680;
  if (!qword_25405B680)
  {
    result = MEMORY[0x2348B7C44](&unk_230388FF0, &type metadata for PersistentActivities.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405B680);
  }
  return result;
}

unint64_t sub_230375938()
{
  unint64_t result;

  result = qword_25405B678;
  if (!qword_25405B678)
  {
    result = MEMORY[0x2348B7C44](&unk_230389018, &type metadata for PersistentActivities.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25405B678);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_20()
{
  return sub_23037AE14();
}

uint64_t OUTLINED_FUNCTION_3_15(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_5_15()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_8_15()
{
  return sub_23037AD78();
}

ValueMetadata *type metadata accessor for DateProvider()
{
  return &type metadata for DateProvider;
}

uint64_t sub_2303759D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B530);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v16 - v6;
  v8 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v9 = (void *)sub_23037A5A4();
  v10 = objc_msgSend(v8, sel_containerURLForSecurityApplicationGroupIdentifier_, v9);

  if (v10)
  {
    sub_23037A0E8();

    v11 = sub_23037A118();
    v12 = (uint64_t)v5;
    v13 = 0;
  }
  else
  {
    v11 = sub_23037A118();
    v12 = (uint64_t)v5;
    v13 = 1;
  }
  __swift_storeEnumTagSinglePayload(v12, v13, 1, v11);
  sub_23030AE30((uint64_t)v5, (uint64_t)v7);
  sub_23037A118();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v11) == 1)
  {
    sub_230309E68((uint64_t)v7);
    v14 = 1;
  }
  else
  {
    sub_23037A0B8();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v7, v11);
    v14 = 0;
  }
  return __swift_storeEnumTagSinglePayload(a1, v14, 1, v11);
}

uint64_t SportsImageStorage.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  SportsImageStorage.init()();
  return v0;
}

void SportsImageStorage.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  void *v14;
  unsigned int v15;
  void (*v16)(char *, uint64_t);
  id v17;
  id v18;
  void *v19;
  id v21[2];

  v2 = v0;
  v21[1] = *(id *)MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B530);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v3);
  v4 = OUTLINED_FUNCTION_0_5();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v2 + OBJC_IVAR____TtC9SportsKit18SportsImageStorage_logosCacheDir;
  sub_2303759D0(v2 + OBJC_IVAR____TtC9SportsKit18SportsImageStorage_logosCacheDir);
  sub_230375DD4(v8, v1);
  if (__swift_getEnumTagSinglePayload(v1, 1, v4) != 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v1, v4);
    v9 = (void *)objc_opt_self();
    v10 = objc_msgSend(v9, sel_defaultManager);
    sub_23037A0F4();
    v11 = (void *)sub_23037A5A4();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v10, sel_fileExistsAtPath_, v11);

    if ((v12 & 1) == 0)
    {
      v13 = objc_msgSend(v9, sel_defaultManager);
      v14 = (void *)sub_23037A0AC();
      v21[0] = 0;
      v15 = objc_msgSend(v13, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v14, 1, 0, v21);

      if (v15)
      {
        v16 = *(void (**)(char *, uint64_t))(v5 + 8);
        v17 = v21[0];
        v16(v7, v4);
        goto LABEL_8;
      }
      v18 = v21[0];
      v19 = (void *)sub_23037A064();

      swift_willThrow();
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    goto LABEL_8;
  }
  sub_230309E68(v1);
LABEL_8:
  OUTLINED_FUNCTION_0_2();
}

uint64_t sub_230375DD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B530);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void SportsImageStorage.setImage(imageData:forKey:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void (*v26)(char *, _QWORD *);
  uint64_t v27;
  os_log_type_t v28;
  id v29;
  void *v30;
  double v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  _QWORD v36[10];
  uint64_t v37;
  uint64_t v38;

  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B530);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (_QWORD *)sub_23037A118();
  v14 = *(v13 - 1);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v36 - v18;
  v36[2] = a3;
  v37 = a3;
  v38 = a4;
  OUTLINED_FUNCTION_9_12();
  if ((OUTLINED_FUNCTION_6_8() & 1) != 0)
  {
    if (qword_25405B480 != -1)
      swift_once();
    v20 = OUTLINED_FUNCTION_24_0();
    __swift_project_value_buffer(v20, (uint64_t)qword_2540621F0);
    OUTLINED_FUNCTION_172_1();
    v21 = OUTLINED_FUNCTION_146_1();
    if (OUTLINED_FUNCTION_44_6(v21))
    {
      *(_WORD *)OUTLINED_FUNCTION_5_2() = 0;
      v24 = "key cannot contain parental traversal string patterns";
      goto LABEL_13;
    }
LABEL_14:

    return;
  }
  v25 = v5 + OBJC_IVAR____TtC9SportsKit18SportsImageStorage_logosCacheDir;
  if (OUTLINED_FUNCTION_15_11())
  {
    OUTLINED_FUNCTION_9_10((uint64_t)v12, 1);
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_139_1((uint64_t)v17, v25, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 16));
  sub_23037A0C4();
  v26 = *(void (**)(char *, _QWORD *))(v14 + 8);
  v26(v17, v13);
  OUTLINED_FUNCTION_9_10((uint64_t)v12, 0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, (uint64_t)v13) == 1)
  {
LABEL_9:
    sub_230309E68((uint64_t)v12);
    if (qword_25405B480 != -1)
      swift_once();
    v27 = OUTLINED_FUNCTION_24_0();
    __swift_project_value_buffer(v27, (uint64_t)qword_2540621F0);
    OUTLINED_FUNCTION_172_1();
    v28 = OUTLINED_FUNCTION_146_1();
    if (OUTLINED_FUNCTION_44_6(v28))
    {
      *(_WORD *)OUTLINED_FUNCTION_5_2() = 0;
      v24 = "error resolving logos cache directory";
LABEL_13:
      OUTLINED_FUNCTION_23_7(&dword_2302D3000, v22, v23, v24);
      OUTLINED_FUNCTION_28_0();
    }
    goto LABEL_14;
  }
  OUTLINED_FUNCTION_139_1((uint64_t)v19, (uint64_t)v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 32));
  sub_2303766E8();
  sub_2302E33C8(a1, a2);
  v29 = sub_2303763D8(a1, a2);
  if (v29)
  {
    v30 = v29;
    objc_msgSend(v29, sel_size);
    if (v31 > 250.0)
    {
      if (qword_25405B480 != -1)
        swift_once();
      v32 = OUTLINED_FUNCTION_24_0();
      __swift_project_value_buffer(v32, (uint64_t)qword_2540621F0);
      swift_bridgeObjectRetain_n();
      v33 = sub_23037A268();
      v34 = sub_23037A8F8();
      if (os_log_type_enabled(v33, v34))
      {
        v36[1] = v19;
        v35 = (uint8_t *)OUTLINED_FUNCTION_5_2();
        v37 = OUTLINED_FUNCTION_5_2();
        *(_DWORD *)v35 = 136315138;
        OUTLINED_FUNCTION_72_0();
        v36[8] = OUTLINED_FUNCTION_14_10();
        sub_23037AA30();
        OUTLINED_FUNCTION_17_13();
        _os_log_impl(&dword_2302D3000, v33, v34, "image for key %s is too large, ignoring..", v35, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_28_0();
      }
      OUTLINED_FUNCTION_18_12();

      goto LABEL_24;
    }

  }
  sub_23037A1A8();
LABEL_24:
  v26(v19, v13);
}

id sub_2303763D8(uint64_t a1, unint64_t a2)
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_23037A190();
  v6 = objc_msgSend(v4, sel_initWithData_, v5);
  sub_2302E340C(a1, a2);

  return v6;
}

void SportsImageStorage.getImage(forKey:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD v22[6];

  __swift_instantiateConcreteTypeFromMangledName(&qword_25405B530);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v6);
  v7 = (_QWORD *)OUTLINED_FUNCTION_0_5();
  v8 = *(v7 - 1);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v22 - v12;
  v22[4] = a1;
  v22[5] = a2;
  OUTLINED_FUNCTION_9_12();
  if ((OUTLINED_FUNCTION_6_8() & 1) == 0)
  {
    v18 = v2 + OBJC_IVAR____TtC9SportsKit18SportsImageStorage_logosCacheDir;
    if (OUTLINED_FUNCTION_15_11())
    {
      OUTLINED_FUNCTION_9_10(v3, 1);
    }
    else
    {
      OUTLINED_FUNCTION_139_1((uint64_t)v11, v18, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16));
      sub_23037A0C4();
      (*(void (**)(char *, _QWORD *))(v8 + 8))(v11, v7);
      OUTLINED_FUNCTION_9_10(v3, 0);
      if (__swift_getEnumTagSinglePayload(v3, 1, (uint64_t)v7) != 1)
      {
        OUTLINED_FUNCTION_139_1((uint64_t)v13, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 32));
        v19 = sub_23037A148();
        v21 = v20;
        sub_2303766E8();
        sub_2302E33C8(v19, v21);
        if (sub_2303763D8(v19, v21))
        {
          sub_23037A478();
          OUTLINED_FUNCTION_1_4();
          OUTLINED_FUNCTION_7_11();
        }
        else
        {
          OUTLINED_FUNCTION_7_11();
          OUTLINED_FUNCTION_1_4();
        }
        goto LABEL_11;
      }
    }
    sub_230309E68(v3);
    goto LABEL_11;
  }
  if (qword_25405B480 != -1)
    swift_once();
  v14 = OUTLINED_FUNCTION_24_0();
  __swift_project_value_buffer(v14, (uint64_t)qword_2540621F0);
  OUTLINED_FUNCTION_172_1();
  v15 = OUTLINED_FUNCTION_146_1();
  if (OUTLINED_FUNCTION_44_6(v15))
  {
    *(_WORD *)OUTLINED_FUNCTION_5_2() = 0;
    OUTLINED_FUNCTION_23_7(&dword_2302D3000, v16, v17, "key cannot contain parental traversal string patterns");
    OUTLINED_FUNCTION_28_0();
  }

LABEL_11:
  OUTLINED_FUNCTION_0_2();
}

uint64_t SportsImageStorage.deinit()
{
  uint64_t v0;

  sub_230309E68(v0 + OBJC_IVAR____TtC9SportsKit18SportsImageStorage_logosCacheDir);
  return v0;
}

uint64_t SportsImageStorage.__deallocating_deinit()
{
  uint64_t v0;

  sub_230309E68(v0 + OBJC_IVAR____TtC9SportsKit18SportsImageStorage_logosCacheDir);
  return swift_deallocClassInstance();
}

unint64_t sub_2303766E8()
{
  unint64_t result;

  result = qword_255E5A3B8;
  if (!qword_255E5A3B8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255E5A3B8);
  }
  return result;
}

uint64_t sub_230376724()
{
  return type metadata accessor for SportsImageStorage();
}

uint64_t type metadata accessor for SportsImageStorage()
{
  uint64_t result;

  result = qword_255E5A3E8;
  if (!qword_255E5A3E8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_230376764()
{
  unint64_t v0;

  sub_230362810();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for SportsImageStorage()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SportsImageStorage.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t OUTLINED_FUNCTION_7_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

unint64_t OUTLINED_FUNCTION_9_12()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 112) = 3092014;
  *(_QWORD *)(v0 - 104) = 0xE300000000000000;
  return sub_2302DF64C();
}

uint64_t OUTLINED_FUNCTION_14_10()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23036514C(*(_QWORD *)(v1 - 160), v0, (uint64_t *)(v1 - 96));
}

uint64_t OUTLINED_FUNCTION_15_11()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_17_13()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_18_12()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t RunningClockView.init(viewModel:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  if (qword_255E576A0 != -1)
    swift_once();
  v4 = qword_255E576A8;
  type metadata accessor for RunningClockLayout();
  v5 = OUTLINED_FUNCTION_10_5();
  *(_QWORD *)(v5 + 16) = v4;
  *a2 = a1;
  a2[1] = v5;
  return swift_retain();
}

void RunningClockLayout.__allocating_init(shootoutsLayout:)(uint64_t a1)
{
  *(_QWORD *)(OUTLINED_FUNCTION_10_5() + 16) = a1;
  OUTLINED_FUNCTION_3();
}

uint64_t type metadata accessor for RunningClockLayout()
{
  return objc_opt_self();
}

uint64_t RunningClockView.init(viewModel:layout:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

void RunningClockView.body.getter(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  type metadata accessor for RunningClockComponentsFormatter.FormattedComponents(0);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_2_0();
  v6 = (_QWORD *)(v5 - v4);
  v7 = *v1;
  v8 = v1[1];
  sub_23034F58C();
  *(_QWORD *)a1 = sub_23037A3D0();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 0;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A470);
  sub_23037699C(v7, v8, v6, a1 + *(int *)(v9 + 44));
  sub_2302F6DC8((uint64_t)v6, type metadata accessor for RunningClockComponentsFormatter.FormattedComponents);
}

void sub_23037699C(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char v26;
  uint64_t *v27;
  char *v28;
  char *v29;
  int v30;
  uint64_t v31;
  _QWORD v32[20];
  uint64_t v33;
  uint64_t v34;
  char v35;
  _BYTE v36[143];
  _BYTE v37[136];
  _BYTE __src[160];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A4C8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v28 - v12;
  v33 = a1;
  v34 = a2;
  RunningClockView.headerTitle.getter((uint64_t)&v28 - v12);
  v31 = sub_23037A3B8();
  sub_230376FE0(a3, a1, (uint64_t)v37);
  __src[144] = 0;
  memcpy(&__src[7], v37, 0x88uLL);
  v30 = 0;
  v14 = (uint64_t *)(a1 + 80);
  swift_beginAccess();
  v15 = *(_QWORD *)(a1 + 88);
  if (v15)
  {
    v33 = *v14;
    v34 = v15;
    sub_2302DF64C();
    swift_bridgeObjectRetain();
    v16 = sub_23037A430();
    v18 = v17;
    v20 = v19;
    v22 = v21 & 1;
  }
  else
  {
    v16 = 0;
    v18 = 0;
    v22 = 0;
    v20 = 0;
  }
  sub_230377F54((uint64_t)v13, (uint64_t)v11, &qword_255E5A4C8);
  sub_230377F54((uint64_t)v11, a4, &qword_255E5A4C8);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A4E0);
  v24 = (void *)(a4 + *(int *)(v23 + 48));
  v28 = v13;
  v29 = v11;
  v25 = v31;
  v32[0] = v31;
  v32[1] = 0x4008000000000000;
  v26 = v30;
  LOBYTE(v32[2]) = v30;
  memcpy((char *)&v32[2] + 1, __src, 0x8FuLL);
  memcpy(v24, v32, 0xA0uLL);
  v27 = (uint64_t *)(a4 + *(int *)(v23 + 64));
  *v27 = v16;
  v27[1] = v18;
  v27[2] = v22;
  v27[3] = v20;
  sub_230377E34((uint64_t)v32, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_230377DAC, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))sub_230377DDC);
  sub_230377DAC(v16, v18, v22, v20);
  sub_2302FD540((uint64_t)v28, &qword_255E5A4C8);
  sub_230377E04(v16, v18, v22, v20);
  v33 = v25;
  v34 = 0x4008000000000000;
  v35 = v26;
  memcpy(v36, __src, sizeof(v36));
  sub_230377E34((uint64_t)&v33, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_230377E04, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))sub_230377F00);
  sub_2302FD540((uint64_t)v29, &qword_255E5A4C8);
}

uint64_t RunningClockView.headerTitle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
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
  uint64_t v12;
  char *v13;
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
  uint64_t v29;
  unsigned __int8 v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56[3];

  v55 = a1;
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A478);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_2_0();
  v5 = v4 - v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A480);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_2_0();
  v9 = v8 - v7;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A488);
  OUTLINED_FUNCTION_13();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v50 = (uint64_t)&v49 - v14;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A490);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_2_0();
  v51 = v17 - v16;
  type metadata accessor for RunningClockComponentsFormatter.FormattedComponents(0);
  OUTLINED_FUNCTION_13();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_2_0();
  v21 = v20 - v19;
  v22 = *(_QWORD *)(v1 + 8);
  sub_23034F58C();
  v24 = *(_QWORD *)(v21 + 48);
  v23 = *(_QWORD *)(v21 + 56);
  swift_bridgeObjectRetain();
  sub_2302F6DC8(v21, type metadata accessor for RunningClockComponentsFormatter.FormattedComponents);
  if (v23)
  {
    sub_230350050(v56);
    v25 = v56[0];
    if (v56[0])
    {
      v26 = sub_23037A3B8();
      OUTLINED_FUNCTION_27();
      swift_retain();
      sub_2302D825C();
      v28 = v27;
      swift_release();
      *(_QWORD *)v9 = v26;
      *(_QWORD *)(v9 + 8) = v28;
      *(_BYTE *)(v9 + 16) = 0;
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A498);
      sub_230377618(v25, v22, v24, v23, v9 + *(int *)(v29 + 44));
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v30 = sub_23037A400();
      v31 = sub_23037A40C();
      sub_23037A40C();
      if (sub_23037A40C() != v30)
        v31 = sub_23037A40C();
      sub_23037A364();
      v33 = v32;
      v35 = v34;
      v37 = v36;
      v39 = v38;
      sub_230377F54(v9, (uint64_t)v13, &qword_255E5A480);
      v40 = &v13[*(int *)(v52 + 36)];
      *v40 = v31;
      *((_QWORD *)v40 + 1) = v33;
      *((_QWORD *)v40 + 2) = v35;
      *((_QWORD *)v40 + 3) = v37;
      *((_QWORD *)v40 + 4) = v39;
      v40[40] = 0;
      sub_2302FD540(v9, &qword_255E5A480);
      v41 = v50;
      sub_230377A70((uint64_t)v13, v50, &qword_255E5A488);
      sub_230377F54(v41, v5, &qword_255E5A488);
      swift_storeEnumTagMultiPayload();
      sub_2303779EC();
      v42 = v51;
      sub_23037A3DC();
      sub_2302FD540(v41, &qword_255E5A488);
    }
    else
    {
      v56[0] = v24;
      v56[1] = v23;
      sub_2302DF64C();
      *(_QWORD *)v5 = sub_23037A430();
      *(_QWORD *)(v5 + 8) = v45;
      *(_BYTE *)(v5 + 16) = v46 & 1;
      *(_QWORD *)(v5 + 24) = v47;
      swift_storeEnumTagMultiPayload();
      sub_2303779EC();
      v42 = v51;
      sub_23037A3DC();
    }
    v44 = v55;
    sub_230377A70(v42, v55, &qword_255E5A490);
    v43 = 0;
  }
  else
  {
    v43 = 1;
    v44 = v55;
  }
  return __swift_storeEnumTagSinglePayload(v44, v43, 1, v54);
}

uint64_t sub_230376FE0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  char v32;
  uint64_t *v33;
  char v34;
  uint64_t *v35;
  char v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t *v74;
  __int128 *v75;
  uint64_t *v76;
  char v77;

  v54 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405B4C8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A298);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25405A280);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents(0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = a1[1];
  if (v17)
  {
    *(_QWORD *)&v58 = *a1;
    *((_QWORD *)&v58 + 1) = v17;
    sub_2302DF64C();
    swift_bridgeObjectRetain();
    v53 = sub_23037A430();
    v52 = v18;
    v51 = v19;
    v57 = v20 & 1;
    swift_beginAccess();
    sub_2302E00E4(a2 + 104, (uint64_t)&v58);
    v21 = *((_QWORD *)&v59 + 1);
    v22 = v60;
    __swift_project_boxed_opaque_existential_1(&v58, *((uint64_t *)&v59 + 1));
    v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 16))(v21, v22);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v58);
    if ((v23 & 1) != 0)
    {
      sub_23037A3C4();
      v56 = sub_23037A424();
      v55 = v24;
      v26 = v25;
      v28 = v27 & 1;
    }
    else
    {
      v56 = 0;
      v55 = 0;
      v28 = 0;
      v26 = 0;
    }
  }
  else
  {
    v56 = 0;
    v55 = 0;
    v28 = 0;
    v26 = 0;
    v53 = 0;
    v52 = 0;
    v57 = 0;
    v51 = 0;
  }
  v29 = type metadata accessor for RunningClockComponentsFormatter.FormattedComponents(0);
  sub_230377F54((uint64_t)a1 + *(int *)(v29 + 32), (uint64_t)v13, &qword_25405A280);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14) == 1)
  {
    sub_2302FD540((uint64_t)v13, &qword_25405A280);
    v30 = a1[5];
    *(_QWORD *)&v58 = a1[4];
    *((_QWORD *)&v58 + 1) = v30;
    sub_2302DF64C();
    swift_bridgeObjectRetain();
    v73 = (uint64_t *)sub_23037A430();
    v74 = v31;
    v75 = (__int128 *)(v32 & 1);
    v76 = v33;
    v77 = 1;
    sub_23037A3DC();
    v50 = v58;
    v49 = v59;
    v34 = v60;
  }
  else
  {
    sub_230377F28((uint64_t)v13, (uint64_t)v16, type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents);
    sub_230377F54((uint64_t)v16, (uint64_t)v10, &qword_25405A298);
    sub_230377F54((uint64_t)&v16[*(int *)(v14 + 20)], (uint64_t)v7, &qword_25405B4C8);
    v73 = (uint64_t *)sub_23037A418();
    v74 = v35;
    v75 = (__int128 *)(v36 & 1);
    v76 = v37;
    v77 = 0;
    sub_23037A3DC();
    v50 = v58;
    v49 = v59;
    v34 = v60;
    sub_2302F6DC8((uint64_t)v16, type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents);
  }
  v38 = v54;
  v39 = v53;
  v40 = v52;
  v41 = v51;
  v42 = a1[3];
  if (v42)
  {
    *(_QWORD *)&v58 = a1[2];
    *((_QWORD *)&v58 + 1) = v42;
    sub_2302DF64C();
    swift_bridgeObjectRetain();
    v43 = sub_23037A430();
    v47 = v46 & 1;
  }
  else
  {
    v43 = 0;
    v44 = 0;
    v47 = 0;
    v45 = 0;
  }
  v69 = v39;
  v70 = v40;
  v71 = v57;
  v72 = v41;
  v65 = v56;
  v66 = v55;
  v67 = v28;
  v68 = v26;
  v73 = &v69;
  v74 = &v65;
  v58 = v50;
  v59 = v49;
  LOBYTE(v60) = v34;
  v61 = v43;
  v62 = v44;
  v63 = v47;
  v64 = v45;
  v75 = &v58;
  v76 = &v61;
  sub_23037753C((uint64_t)&v73, v38);
  sub_230377E04(v61, v62, v63, v64);
  sub_230377F00(v58, *((uint64_t *)&v58 + 1), v59);
  sub_230377E04(v65, v66, v67, v68);
  return sub_230377E04(v69, v70, v71, v72);
}

uint64_t sub_23037753C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  v2 = *(uint64_t **)(a1 + 8);
  v4 = **(_QWORD **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 8);
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v7 = *v2;
  v8 = v2[1];
  v9 = v2[2];
  v10 = v2[3];
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(uint64_t **)(a1 + 24);
  v13 = *(_QWORD *)v11;
  v14 = *(_QWORD *)(v11 + 8);
  v15 = *(_QWORD *)(v11 + 16);
  v16 = *(_QWORD *)(v11 + 24);
  v17 = *v12;
  v19 = v12[1];
  v20 = v12[2];
  v21 = v12[3];
  v22 = *(_BYTE *)(v11 + 32);
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v3;
  *(_QWORD *)(a2 + 16) = v5;
  *(_QWORD *)(a2 + 24) = v6;
  *(_QWORD *)(a2 + 32) = v7;
  *(_QWORD *)(a2 + 40) = v8;
  *(_QWORD *)(a2 + 48) = v9;
  *(_QWORD *)(a2 + 56) = v10;
  *(_QWORD *)(a2 + 64) = v13;
  *(_QWORD *)(a2 + 72) = v14;
  *(_QWORD *)(a2 + 80) = v15;
  *(_QWORD *)(a2 + 88) = v16;
  *(_BYTE *)(a2 + 96) = v22;
  *(_QWORD *)(a2 + 104) = v17;
  *(_QWORD *)(a2 + 112) = v19;
  *(_QWORD *)(a2 + 120) = v20;
  *(_QWORD *)(a2 + 128) = v21;
  sub_230377DAC(v4, v3, v5, v6);
  sub_230377DAC(v7, v8, v9, v10);
  sub_230377DDC(v13, v14, v15);
  return sub_230377DAC(v17, v19, v20, v21);
}

void sub_230377618(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
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

  v10 = type metadata accessor for CompetitorShootoutsView();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (uint64_t *)((char *)&v38 - v13);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (uint64_t *)((char *)&v38 - v16);
  MEMORY[0x24BDAC7A8](v15);
  v42 = (uint64_t)&v38 - v19;
  v20 = *(_QWORD *)(a1 + 16);
  if (v20)
  {
    v40 = a5;
    v41 = v18;
    v39 = a1;
    v21 = *(_QWORD *)(a1 + 32);
    swift_beginAccess();
    v22 = *(_QWORD *)(a2 + 16);
    *v17 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E57790);
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)v17 + *(int *)(v10 + 20)) = v21;
    *(uint64_t *)((char *)v17 + *(int *)(v10 + 24)) = v22;
    sub_230377F28((uint64_t)v17, v42, (uint64_t (*)(_QWORD))type metadata accessor for CompetitorShootoutsView);
    v43 = a3;
    v44 = a4;
    sub_2302DF64C();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    v23 = sub_23037A430();
    if (v20 != 1)
    {
      v27 = v25 & 1;
      v28 = *(_QWORD *)(v39 + 40);
      v39 = *(_QWORD *)(a2 + 16);
      v29 = v39;
      v30 = v26;
      v31 = v23;
      v32 = v24;
      *v14 = swift_getKeyPath();
      swift_storeEnumTagMultiPayload();
      *(uint64_t *)((char *)v14 + *(int *)(v10 + 20)) = v28;
      *(uint64_t *)((char *)v14 + *(int *)(v10 + 24)) = v29;
      sub_230377F28((uint64_t)v14, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for CompetitorShootoutsView);
      v33 = v42;
      sub_2302DAF0C(v42, (uint64_t)v14);
      v34 = v41;
      sub_2302DAF0C((uint64_t)v17, v41);
      v35 = v40;
      sub_2302DAF0C((uint64_t)v14, v40);
      v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E5A4D8);
      v37 = v35 + *(int *)(v36 + 48);
      *(_QWORD *)v37 = v31;
      *(_QWORD *)(v37 + 8) = v32;
      *(_BYTE *)(v37 + 16) = v27;
      *(_QWORD *)(v37 + 24) = v30;
      sub_2302DAF0C(v34, v35 + *(int *)(v36 + 64));
      swift_bridgeObjectRetain();
      sub_230377D8C(v31, v32, v27);
      swift_bridgeObjectRetain();
      swift_retain();
      sub_2302F6DC8((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for CompetitorShootoutsView);
      sub_2302F6DC8(v33, (uint64_t (*)(_QWORD))type metadata accessor for CompetitorShootoutsView);
      sub_2302F6DC8(v34, (uint64_t (*)(_QWORD))type metadata accessor for CompetitorShootoutsView);
      sub_230377D9C(v31, v32, v27);
      swift_bridgeObjectRelease();
      sub_2302F6DC8((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for CompetitorShootoutsView);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_230377910()
{
  uint64_t v0;

  v0 = swift_retain();
  return sub_230377968(v0);
}

uint64_t sub_230377938()
{
  OUTLINED_FUNCTION_27();
  return swift_retain();
}

uint64_t sub_230377968(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_27();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_release();
}

uint64_t (*sub_2303779A8())()
{
  OUTLINED_FUNCTION_27();
  return j__swift_endAccess;
}

uint64_t RunningClockLayout.init(shootoutsLayout:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

unint64_t sub_2303779EC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255E5A4A0;
  if (!qword_255E5A4A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E5A488);
    sub_230377C74(&qword_255E5A4A8, &qword_255E5A480, MEMORY[0x24BDF4498]);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2348B7C44](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255E5A4A0);
  }
  return result;
}

void sub_230377A70(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_103(a1, a2, a3);
  OUTLINED_FUNCTION_3_16(v3);
  OUTLINED_FUNCTION_3();
}

uint64_t RunningClockLayout.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t RunningClockLayout.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_230377AD0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_230377AE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_230377938();
  *a1 = result;
  return result;
}

uint64_t destroy for RunningClockView()
{
  swift_release();
  return swift_release();
}

void _s9SportsKit16RunningClockViewVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = a2[1];
  *a1 = *a2;
  a1[1] = v2;
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_3();
}

_QWORD *assignWithCopy for RunningClockView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for RunningClockView(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for RunningClockView()
{
  return &type metadata for RunningClockView;
}

uint64_t method lookup function for RunningClockLayout()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RunningClockLayout.shootoutsLayout.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t dispatch thunk of RunningClockLayout.shootoutsLayout.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of RunningClockLayout.shootoutsLayout.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of RunningClockLayout.__allocating_init(shootoutsLayout:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

void sub_230377C48()
{
  sub_230377C74(&qword_255E5A4B0, &qword_255E5A4B8, MEMORY[0x24BDF4700]);
}

void sub_230377C74(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x2348B7C44](a3, v5), a1);
  }
  OUTLINED_FUNCTION_3();
}

unint64_t sub_230377CB4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_255E5A4C0;
  if (!qword_255E5A4C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E5A4C8);
    v2 = sub_230377D18();
    result = MEMORY[0x2348B7C44](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255E5A4C0);
  }
  return result;
}

unint64_t sub_230377D18()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255E5A4D0;
  if (!qword_255E5A4D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E5A490);
    v2[0] = sub_2303779EC();
    v2[1] = MEMORY[0x24BDF1F80];
    result = MEMORY[0x2348B7C44](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255E5A4D0);
  }
  return result;
}

uint64_t sub_230377D8C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_230377D9C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_230377DAC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_230377D8C(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_230377DDC(uint64_t a1, uint64_t a2, char a3)
{
  sub_230377D8C(a1, a2, a3 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_230377E04(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_230377D9C(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_230377E34(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t), void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 80);
  v9 = *(_QWORD *)(a1 + 88);
  v10 = *(_QWORD *)(a1 + 96);
  v11 = *(_QWORD *)(a1 + 104);
  v12 = *(_QWORD *)(a1 + 112);
  v14 = *(unsigned __int8 *)(a1 + 120);
  v17 = *(_QWORD *)(a1 + 136);
  v18 = *(_QWORD *)(a1 + 128);
  v15 = *(_QWORD *)(a1 + 152);
  v16 = *(_QWORD *)(a1 + 144);
  a2(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  a2(v5, v6, v7, v8);
  a3(v9, v10, v11, v12, v14);
  a2(v18, v17, v16, v15);
  return a1;
}

uint64_t sub_230377F00(uint64_t a1, uint64_t a2, char a3)
{
  sub_230377D9C(a1, a2, a3 & 1);
  return swift_bridgeObjectRelease();
}

void sub_230377F28(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  OUTLINED_FUNCTION_3_16(v3);
  OUTLINED_FUNCTION_3();
}

void sub_230377F54(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_103(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

uint64_t OUTLINED_FUNCTION_3_16(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v1, v2, a1);
}

uint64_t sub_230377FA0(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v3 = a1;
    v5 = a2 >> 62;
    if (!(a2 >> 62))
    {
      v6 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  OUTLINED_FUNCTION_39_2();
  v6 = sub_23037AC94();
  swift_bridgeObjectRelease();
LABEL_4:
  result = sub_230378A90(v6, -v3, 0);
  if ((v8 & 1) != 0)
  {
    if (v6 < 0)
    {
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    v9 = 0;
    if (!v5)
    {
LABEL_7:
      v4 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_11;
    }
  }
  else
  {
    v9 = result;
    if (v6 < result)
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    if (!v5)
      goto LABEL_7;
  }
  OUTLINED_FUNCTION_0_21();
  sub_23037AC94();
  result = OUTLINED_FUNCTION_10_14();
LABEL_11:
  if (v4 < v9)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v9 < 0)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (v5)
  {
    OUTLINED_FUNCTION_0_21();
    sub_23037AC94();
    result = OUTLINED_FUNCTION_10_14();
  }
  else
  {
    v4 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v4 < v6)
    goto LABEL_31;
  if (v6 < 0)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if ((v2 & 0xC000000000000001) != 0 && v9 != v6)
  {
    if (v9 < (unint64_t)v6)
    {
      type metadata accessor for SportingEventPlay();
      v10 = v9;
      do
      {
        v11 = v10 + 1;
        sub_23037AB2C();
        v10 = v11;
      }
      while (v6 != v11);
      goto LABEL_23;
    }
LABEL_35:
    __break(1u);
    return result;
  }
LABEL_23:
  if (!v5)
    return v2 & 0xFFFFFFFFFFFFFF8;
  OUTLINED_FUNCTION_0_21();
  v12 = sub_23037ACA0();
  OUTLINED_FUNCTION_56();
  return v12;
}

uint64_t sub_230378148(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((a4 & 1) == 0)
    goto LABEL_2;
  sub_23037AEEC();
  swift_unknownObjectRetain_n();
  v10 = swift_dynamicCastClass();
  if (!v10)
  {
    OUTLINED_FUNCTION_147();
    v10 = MEMORY[0x24BEE4AF8];
  }
  v11 = *(_QWORD *)(v10 + 16);
  swift_release();
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v11 != (a4 >> 1) - a3)
  {
LABEL_11:
    swift_unknownObjectRelease();
LABEL_2:
    sub_23031D7F8(a1, a2, a3, a4);
    v9 = v8;
    goto LABEL_9;
  }
  v9 = swift_dynamicCastClass();
  if (!v9)
  {
    OUTLINED_FUNCTION_147();
    v9 = MEMORY[0x24BEE4AF8];
  }
LABEL_9:
  OUTLINED_FUNCTION_147();
  return v9;
}

uint64_t sub_230378220(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (!*(_QWORD *)(a1 + 16))
    return 1;
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9SportsKit17SportingEventPlay__levels);
  v3 = *(_QWORD *)(v2 + 16);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_39_2();
  if (v3)
  {
    OUTLINED_FUNCTION_36();
    __asm { BR              X9 }
  }
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_13();
  return 0;
}

uint64_t SportingEventClock.totalSeconds.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC9SportsKit18SportingEventClock__minutes);
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC9SportsKit18SportingEventClock__minutes + 8) & 1) != 0
    || (*(_BYTE *)(v0 + OBJC_IVAR____TtC9SportsKit18SportingEventClock__seconds + 8) & 1) != 0)
  {
    return 0;
  }
  v3 = *v1;
  v4 = 60 * *v1;
  if ((unsigned __int128)(v3 * (__int128)60) >> 64 != v4 >> 63)
  {
    __break(1u);
    goto LABEL_8;
  }
  v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit18SportingEventClock__seconds);
  result = v4 + v5;
  if (__OFADD__(v4, v5))
LABEL_8:
    __break(1u);
  return result;
}

uint64_t SportingEvent.isEventClockRunning.getter()
{
  uint64_t v0;
  uint64_t v1;

  if ((SportingEvent.isRunningClockSupported.getter() & 1) != 0
    && (v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit13SportingEvent_clock)
                                   + OBJC_IVAR____TtC9SportsKit25SportingEventCurrentClock_current)
                       + OBJC_IVAR____TtC9SportsKit18SportingEventClock__runningState)) != 0)
  {
    return *(_BYTE *)(v1 + 17) & 1;
  }
  else
  {
    return 0;
  }
}

uint64_t SportingEvent.isRunningClockSupported.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit13SportingEvent_clock)
                             + OBJC_IVAR____TtC9SportsKit25SportingEventCurrentClock_current)
                 + OBJC_IVAR____TtC9SportsKit18SportingEventClock__runningState);
  if (v1)
    return *(_BYTE *)(v1 + 16) & 1;
  else
    return 0;
}

void SportingEvent.partialSportingEvent.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  char *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit13SportingEvent_canonicalId);
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit13SportingEvent_canonicalId + 8);
  v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit13SportingEvent_version);
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit13SportingEvent_version + 8);
  v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit13SportingEvent__competitors);
  v6 = *(void **)(v0 + OBJC_IVAR____TtC9SportsKit13SportingEvent_clock);
  v7 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit13SportingEvent__plays);
  OUTLINED_FUNCTION_39_2();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = v6;
  swift_bridgeObjectRetain();
  v9 = sub_230377FA0(2, v7);
  v13 = sub_230378148(v9, v10, v11, v12);
  v14 = *(void **)(v0 + OBJC_IVAR____TtC9SportsKit13SportingEvent__tournament);
  v15 = *(void **)(v0 + OBJC_IVAR____TtC9SportsKit13SportingEvent__coverage);
  v16 = objc_allocWithZone((Class)OUTLINED_FUNCTION_9_13());
  v17 = v15;
  v18 = v14;
  OUTLINED_FUNCTION_11_13();
  SportingEvent.init(canonicalId:version:progressStatus:competitors:clock:plays:tournament:coverage:schedule:league:localizedShortName:)(v2, v1, v4, v3, v19, v5, v8, v13, v20, v21, v22, v23, v24);
  OUTLINED_FUNCTION_5_9();
}

uint64_t SportingEventSubscription.ingestionErrors.getter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = (_QWORD *)(v0 + OBJC_IVAR____TtC9SportsKit25SportingEventSubscription_sportingEventDetails);
  swift_beginAccess();
  v2 = *(_QWORD *)(*v1 + OBJC_IVAR____TtC9SportsKit13SportingEvent__coverage);
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9SportsKit21SportingEventCoverage__ingestion);
  if (!v3)
    return 0;
  v4 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9SportsKit30SportingEventCoverageIngestion__coverageUpdates);
  if (!v4)
    return 0;
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    result = OUTLINED_FUNCTION_119_1();
    if (v5)
      goto LABEL_6;
LABEL_21:
    v8 = MEMORY[0x24BEE4AF8];
LABEL_22:
    OUTLINED_FUNCTION_56();
    return v8;
  }
  OUTLINED_FUNCTION_119_1();
  result = sub_23037AC94();
  v5 = result;
  if (!result)
    goto LABEL_21;
LABEL_6:
  if (v5 >= 1)
  {
    v7 = 0;
    v8 = MEMORY[0x24BEE4AF8];
    do
    {
      if ((v4 & 0xC000000000000001) != 0)
        v9 = (unsigned __int8 *)MEMORY[0x2348B72B4](v7, v4);
      else
        v9 = (unsigned __int8 *)*(id *)(v4 + 8 * v7 + 32);
      v10 = v9[OBJC_IVAR____TtC9SportsKit36SportingEventCoverageIngestionUpdate__statusCode];

      if (v10 != 2)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_5_16();
          v8 = v12;
        }
        v11 = *(_QWORD *)(v8 + 16);
        if (v11 >= *(_QWORD *)(v8 + 24) >> 1)
        {
          OUTLINED_FUNCTION_5_16();
          v8 = v13;
        }
        *(_QWORD *)(v8 + 16) = v11 + 1;
        *(_BYTE *)(v8 + v11 + 32) = v10 & 1;
      }
      ++v7;
    }
    while (v5 != v7);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

void static SportingEventFactory.unknown(canonicalId:)(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  char v14;

  v14 = 9;
  v4 = objc_allocWithZone((Class)type metadata accessor for SportingEventClockPeriod());
  OUTLINED_FUNCTION_39_2();
  SportingEventClockPeriod.init(index:type:subdivision:subPeriod:)();
  v6 = v5;
  type metadata accessor for SportingEventClockRunningState();
  swift_allocObject();
  v7 = SportingEventClockRunningState.init(isReliable:isActive:)(0, 0);
  v8 = objc_allocWithZone((Class)type metadata accessor for SportingEventClock());
  SportingEventClock.init(minutes:seconds:milliseconds:period:runningState:isCountingDown:activityStatus:additional:)(0, 1, 0, 1, 0, 1, v6, v7, 2, 0, 0);
  v10 = v9;
  v11 = objc_allocWithZone((Class)type metadata accessor for SportingEventCurrentClock());
  v12 = SportingEventCurrentClock.init(current:total:periods:)(v10, 0, 0);
  v13 = objc_allocWithZone((Class)OUTLINED_FUNCTION_9_13());
  SportingEvent.init(canonicalId:version:progressStatus:competitors:clock:plays:tournament:coverage:schedule:league:localizedShortName:)(a1, a2, 12589, 0xE200000000000000, &v14, MEMORY[0x24BEE4AF8], v12, MEMORY[0x24BEE4AF8], 0, 0, 0, 0, 0);
}

void static SportingEventFactory.eventWithProgressStatus(event:progressStatus:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v1 = *(_QWORD *)(a1 + OBJC_IVAR____TtC9SportsKit13SportingEvent_canonicalId);
  v2 = *(_QWORD *)(a1 + OBJC_IVAR____TtC9SportsKit13SportingEvent_canonicalId + 8);
  v3 = *(_QWORD *)(a1 + OBJC_IVAR____TtC9SportsKit13SportingEvent_version);
  v4 = *(_QWORD *)(a1 + OBJC_IVAR____TtC9SportsKit13SportingEvent_version + 8);
  v5 = *(_QWORD *)(a1 + OBJC_IVAR____TtC9SportsKit13SportingEvent__competitors);
  v6 = *(void **)(a1 + OBJC_IVAR____TtC9SportsKit13SportingEvent_clock);
  v7 = *(_QWORD *)(a1 + OBJC_IVAR____TtC9SportsKit13SportingEvent__plays);
  v8 = *(void **)(a1 + OBJC_IVAR____TtC9SportsKit13SportingEvent__tournament);
  v9 = *(void **)(a1 + OBJC_IVAR____TtC9SportsKit13SportingEvent__coverage);
  objc_allocWithZone((Class)OUTLINED_FUNCTION_9_13());
  v10 = v9;
  OUTLINED_FUNCTION_36();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = v6;
  swift_bridgeObjectRetain();
  v12 = v8;
  OUTLINED_FUNCTION_11_13();
  SportingEvent.init(canonicalId:version:progressStatus:competitors:clock:plays:tournament:coverage:schedule:league:localizedShortName:)(v1, v2, v3, v4, v13, v5, v11, v7, v14, v15, v16, v17, v18);
  OUTLINED_FUNCTION_5_9();
}

uint64_t SportingEventFactory.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SportingEventFactory.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SportingEventFactory()
{
  return objc_opt_self();
}

uint64_t method lookup function for SportingEventFactory()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_230378A90(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  BOOL v5;

  v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2)
      return 0;
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  v5 = __OFADD__(result, a2);
  result += a2;
  if (v5)
    goto LABEL_14;
  return result;
}

uint64_t OUTLINED_FUNCTION_0_21()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_5_16()
{
  sub_2302D87B4();
}

uint64_t OUTLINED_FUNCTION_9_13()
{
  return type metadata accessor for SportingEvent();
}

uint64_t sub_230378B18(uint64_t a1)
{
  int64_t v1;
  uint64_t v3;
  int v4;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_2302DA510(0, v1, 0);
    v3 = sub_230379A64(a1);
    if ((v3 & 0x8000000000000000) == 0 && v3 < 1 << *(_BYTE *)(a1 + 32))
    {
      if ((*(_QWORD *)(a1 + 64 + 8 * ((unint64_t)v3 >> 6)) & (1 << v3)) != 0)
      {
        if (v4 == *(_DWORD *)(a1 + 36))
          __asm { BR              X9 }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      JUMPOUT(0x230378D48);
    }
    __break(1u);
    JUMPOUT(0x230378D58);
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t SportingEventSubscriptionRequest.SubscriptionType.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6C50794279616C70;
  if (*v0 != 1)
    v1 = 0x536B636F6C437674;
  if (*v0)
    return v1;
  else
    return 0x746174536576696CLL;
}

uint64_t static SportingEventSubscriptionRequest.activitySource.getter()
{
  return 0x7974697669746361;
}

SportsKit::SportingEventSubscriptionRequest::SubscriptionType_optional __swiftcall SportingEventSubscriptionRequest.SubscriptionType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  char v4;
  SportsKit::SportingEventSubscriptionRequest::SubscriptionType_optional result;

  v2 = v1;
  v3 = sub_23037ACDC();
  OUTLINED_FUNCTION_7();
  v4 = 3;
  if (v3 < 3)
    v4 = v3;
  *v2 = v4;
  OUTLINED_FUNCTION_13_0();
  return result;
}

void sub_230378E40(unsigned __int8 *a1, char *a2)
{
  sub_2302E4148(*a1, *a2);
}

void sub_230378E4C()
{
  sub_2303320B0();
}

uint64_t sub_230378E54()
{
  return sub_2302D68A0();
}

void sub_230378E5C()
{
  sub_2303326C4();
}

SportsKit::SportingEventSubscriptionRequest::SubscriptionType_optional sub_230378E64(Swift::String *a1)
{
  return SportingEventSubscriptionRequest.SubscriptionType.init(rawValue:)(*a1);
}

void sub_230378E70(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = SportingEventSubscriptionRequest.SubscriptionType.rawValue.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_3();
}

SportsKit::SportingEventSubscriptionRequest::ContextKey_optional __swiftcall SportingEventSubscriptionRequest.ContextKey.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  char v4;
  SportsKit::SportingEventSubscriptionRequest::ContextKey_optional result;

  v2 = v1;
  v3 = sub_23037ACDC();
  OUTLINED_FUNCTION_7();
  v4 = 4;
  if (v3 < 4)
    v4 = v3;
  *v2 = v4;
  OUTLINED_FUNCTION_13_0();
  return result;
}

uint64_t SportingEventSubscriptionRequest.ContextKey.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_230378F0C + 4 * byte_230389270[*v0]))(0x644974726F7073, 0xE700000000000000);
}

unint64_t sub_230378F0C()
{
  return 0xD000000000000012;
}

uint64_t sub_230378F28()
{
  return 0x644965756761656CLL;
}

uint64_t sub_230378F40()
{
  return 0x656372756F73;
}

void sub_230378F54()
{
  sub_2302E4044();
}

void sub_230378F60()
{
  sub_2303320BC();
}

void sub_230378F68()
{
  sub_2302D681C();
}

void sub_230378F70()
{
  sub_23033275C();
}

SportsKit::SportingEventSubscriptionRequest::ContextKey_optional sub_230378F78(Swift::String *a1)
{
  return SportingEventSubscriptionRequest.ContextKey.init(rawValue:)(*a1);
}

void sub_230378F84(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = SportingEventSubscriptionRequest.ContextKey.rawValue.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_3();
}

void SportingEventSubscriptionRequest.canonicalId.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_3();
}

uint64_t SportingEventSubscriptionRequest.playByPlay.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SportsKit32SportingEventSubscriptionRequest_playByPlay);
}

uint64_t sub_230378FE8(char *a1)
{
  char v2;

  v2 = *a1;
  return sub_23037905C(&v2);
}

void sub_23037901C(_BYTE *a1@<X8>)
{
  uint64_t v1;
  _BYTE *v3;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC9SportsKit32SportingEventSubscriptionRequest_subscriptionType);
  OUTLINED_FUNCTION_27();
  *a1 = *v3;
  OUTLINED_FUNCTION_72();
}

uint64_t sub_23037905C(char *a1)
{
  uint64_t v1;
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC9SportsKit32SportingEventSubscriptionRequest_subscriptionType);
  result = OUTLINED_FUNCTION_27();
  *v3 = v2;
  return result;
}

void sub_2303790A8()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_3();
}

void sub_2303790E4()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  sub_230379150(v0);
}

uint64_t sub_23037910C()
{
  OUTLINED_FUNCTION_27();
  return swift_bridgeObjectRetain();
}

void sub_230379150(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC9SportsKit32SportingEventSubscriptionRequest_context);
  OUTLINED_FUNCTION_27();
  *v3 = a1;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_72();
}

void sub_230379194()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_3();
}

double sub_2303791D0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC9SportsKit32SportingEventSubscriptionRequest_requestTimeout;
  OUTLINED_FUNCTION_27();
  return *(double *)v1;
}

uint64_t sub_230379210(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC9SportsKit32SportingEventSubscriptionRequest_requestTimeout);
  result = OUTLINED_FUNCTION_27();
  *v3 = a1;
  return result;
}

void sub_23037925C()
{
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_3();
}

void sub_230379298()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_27();
  v0 = swift_bridgeObjectRetain();
  v1 = sub_230378B18(v0);
  OUTLINED_FUNCTION_7();
  sub_230314C24(v1);
}

void SportingEventSubscriptionRequest.__allocating_init(canonicalId:playByPlay:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_16();
  SportingEventSubscriptionRequest.init(canonicalId:playByPlay:)(v4, v3, a3);
  OUTLINED_FUNCTION_13_0();
}

void SportingEventSubscriptionRequest.init(canonicalId:playByPlay:)(uint64_t a1, uint64_t a2, char a3)
{
  char *v3;
  uint64_t v7;
  char *v8;
  char *v9;
  char v10;
  objc_super v11;

  v7 = OBJC_IVAR____TtC9SportsKit32SportingEventSubscriptionRequest_context;
  sub_230379404();
  v8 = v3;
  *(_QWORD *)&v3[v7] = sub_23037A520();
  *(_QWORD *)&v8[OBJC_IVAR____TtC9SportsKit32SportingEventSubscriptionRequest_requestTimeout] = 0x403E000000000000;
  v9 = &v8[OBJC_IVAR____TtC9SportsKit32SportingEventSubscriptionRequest_canonicalId];
  *(_QWORD *)v9 = a1;
  *((_QWORD *)v9 + 1) = a2;
  v8[OBJC_IVAR____TtC9SportsKit32SportingEventSubscriptionRequest_playByPlay] = a3;
  if ((a3 & 1) != 0)
    v10 = 1;
  else
    v10 = 2;
  v8[OBJC_IVAR____TtC9SportsKit32SportingEventSubscriptionRequest_subscriptionType] = v10;

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for SportingEventSubscriptionRequest();
  objc_msgSendSuper2(&v11, sel_init);
  OUTLINED_FUNCTION_2_17();
}

unint64_t sub_230379404()
{
  unint64_t result;

  result = qword_255E5A5A8;
  if (!qword_255E5A5A8)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportingEventSubscriptionRequest.ContextKey, &type metadata for SportingEventSubscriptionRequest.ContextKey);
    atomic_store(result, (unint64_t *)&qword_255E5A5A8);
  }
  return result;
}

uint64_t type metadata accessor for SportingEventSubscriptionRequest()
{
  return objc_opt_self();
}

void SportingEventSubscriptionRequest.__allocating_init(canonicalId:subscriptionType:)(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_16();
  SportingEventSubscriptionRequest.init(canonicalId:subscriptionType:)(v4, v3, a3);
  OUTLINED_FUNCTION_13_0();
}

void SportingEventSubscriptionRequest.init(canonicalId:subscriptionType:)(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  char *v3;
  int v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char v10;
  objc_super v11;

  v6 = *a3;
  v7 = OBJC_IVAR____TtC9SportsKit32SportingEventSubscriptionRequest_context;
  sub_230379404();
  v8 = v3;
  *(_QWORD *)&v3[v7] = sub_23037A520();
  *(_QWORD *)&v8[OBJC_IVAR____TtC9SportsKit32SportingEventSubscriptionRequest_requestTimeout] = 0x403E000000000000;
  v9 = &v8[OBJC_IVAR____TtC9SportsKit32SportingEventSubscriptionRequest_canonicalId];
  *(_QWORD *)v9 = a1;
  *((_QWORD *)v9 + 1) = a2;
  if (v6 == 1)
    v10 = 1;
  else
    v10 = sub_23037AE8C();
  swift_bridgeObjectRelease();
  v8[OBJC_IVAR____TtC9SportsKit32SportingEventSubscriptionRequest_playByPlay] = v10 & 1;
  v8[OBJC_IVAR____TtC9SportsKit32SportingEventSubscriptionRequest_subscriptionType] = v6;

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for SportingEventSubscriptionRequest();
  objc_msgSendSuper2(&v11, sel_init);
  OUTLINED_FUNCTION_2_17();
}

id SportingEventSubscriptionRequest.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SportingEventSubscriptionRequest.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SportingEventSubscriptionRequest.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SportingEventSubscriptionRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_230379670()
{
  unint64_t result;

  result = qword_255E5A5B0;
  if (!qword_255E5A5B0)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportingEventSubscriptionRequest.SubscriptionType, &type metadata for SportingEventSubscriptionRequest.SubscriptionType);
    atomic_store(result, (unint64_t *)&qword_255E5A5B0);
  }
  return result;
}

unint64_t sub_2303796B0()
{
  unint64_t result;

  result = qword_255E5A5B8;
  if (!qword_255E5A5B8)
  {
    result = MEMORY[0x2348B7C44](&protocol conformance descriptor for SportingEventSubscriptionRequest.ContextKey, &type metadata for SportingEventSubscriptionRequest.ContextKey);
    atomic_store(result, (unint64_t *)&qword_255E5A5B8);
  }
  return result;
}

void sub_2303796EC(_BYTE *a1@<X8>)
{
  sub_23037901C(a1);
  OUTLINED_FUNCTION_3();
}

void sub_23037970C(uint64_t *a1@<X8>)
{
  *a1 = sub_23037910C();
  OUTLINED_FUNCTION_3();
}

void sub_230379734(double *a1@<X8>)
{
  *a1 = sub_2303791D0();
  OUTLINED_FUNCTION_3();
}

void sub_230379758(double *a1)
{
  sub_230379210(*a1);
  OUTLINED_FUNCTION_3();
}

uint64_t method lookup function for SportingEventSubscriptionRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SportingEventSubscriptionRequest.subscriptionType.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SportingEventSubscriptionRequest.subscriptionType.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SportingEventSubscriptionRequest.subscriptionType.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SportingEventSubscriptionRequest.context.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of SportingEventSubscriptionRequest.context.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SportingEventSubscriptionRequest.context.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of SportingEventSubscriptionRequest.requestTimeout.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of SportingEventSubscriptionRequest.requestTimeout.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of SportingEventSubscriptionRequest.requestTimeout.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of SportingEventSubscriptionRequest.__allocating_init(canonicalId:playByPlay:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of SportingEventSubscriptionRequest.__allocating_init(canonicalId:subscriptionType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t storeEnumTagSinglePayload for SportingEventSubscriptionRequest.SubscriptionType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_230379918 + 4 * byte_230389279[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23037994C + 4 * byte_230389274[v4]))();
}

uint64_t sub_23037994C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_230379954(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23037995CLL);
  return result;
}

uint64_t sub_230379968(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x230379970);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_230379974(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23037997C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SportingEventSubscriptionRequest.SubscriptionType()
{
  return &type metadata for SportingEventSubscriptionRequest.SubscriptionType;
}

uint64_t storeEnumTagSinglePayload for SportingEventSubscriptionRequest.ContextKey(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2303799E4 + 4 * byte_230389283[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_230379A18 + 4 * byte_23038927E[v4]))();
}

uint64_t sub_230379A18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_230379A20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x230379A28);
  return result;
}

uint64_t sub_230379A34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x230379A3CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_230379A40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230379A48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SportingEventSubscriptionRequest.ContextKey()
{
  return &type metadata for SportingEventSubscriptionRequest.ContextKey;
}

uint64_t sub_230379A64(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

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
  v2 = 64;
  for (i = 10; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    v1 = *(_QWORD *)(a1 + 8 * i);
    v2 += 64;
    if (v1)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

id OUTLINED_FUNCTION_4_16()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

uint64_t Color.init(hex:)(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t result;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[5];
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v24[0] = sub_23037A460();
  v4 = *(_QWORD *)(v24[0] - 8);
  MEMORY[0x24BDAC7A8](v24[0]);
  v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_230379F2C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = a1;
  v26 = a2;
  sub_230379F14();
  sub_2302DF64C();
  v11 = sub_23037AA60();
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();
  v25 = v11;
  v26 = v13;
  v24[3] = 35;
  v24[4] = 0xE100000000000000;
  v24[1] = 0;
  v24[2] = 0xE000000000000000;
  sub_23037AA6C();
  swift_bridgeObjectRelease();
  v25 = 0;
  v14 = sub_23037A658();
  sub_230379DB4();
  v15 = sub_230379DF0();
  LODWORD(v7) = objc_msgSend(v15, sel_scanHexLongLong_, &v25);

  result = 0;
  if ((_DWORD)v7)
  {
    if (v14 == 8)
    {
      v18 = v25 >> 24;
      v19 = v25 >> 16;
      v17 = v25 >> 8;
      v20 = (double)v25 / 255.0;
      goto LABEL_6;
    }
    if (v14 == 6)
    {
      LOBYTE(v17) = v25;
      v18 = v25 >> 16;
      v19 = v25 >> 8;
      v20 = 1.0;
LABEL_6:
      v21 = (double)v18 / 255.0;
      v22 = (double)v19 / 255.0;
      v23 = (double)v17 / 255.0;
      (*(void (**)(char *, _QWORD, _QWORD))(v4 + 104))(v6, *MEMORY[0x24BDF3C28], v24[0]);
      return MEMORY[0x2348B6BDC](v6, v21, v22, v23, v20);
    }
    return 0;
  }
  return result;
}

unint64_t sub_230379DB4()
{
  unint64_t result;

  result = qword_255E5A5E8;
  if (!qword_255E5A5E8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255E5A5E8);
  }
  return result;
}

id sub_230379DF0()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_23037A5A4();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithString_, v1);

  return v2;
}

uint64_t sub_230379E60()
{
  return MEMORY[0x24BDCAF28]();
}

uint64_t sub_230379E6C()
{
  return MEMORY[0x24BDCB1E0]();
}

uint64_t sub_230379E78()
{
  return MEMORY[0x24BDCB1F0]();
}

uint64_t sub_230379E84()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_230379E90()
{
  return MEMORY[0x24BDCB238]();
}

uint64_t sub_230379E9C()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_230379EA8()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_230379EB4()
{
  return MEMORY[0x24BDCB290]();
}

uint64_t sub_230379EC0()
{
  return MEMORY[0x24BDCB2A8]();
}

uint64_t sub_230379ECC()
{
  return MEMORY[0x24BDCB2E0]();
}

uint64_t sub_230379ED8()
{
  return MEMORY[0x24BDCB360]();
}

uint64_t sub_230379EE4()
{
  return MEMORY[0x24BDCB378]();
}

uint64_t sub_230379EF0()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_230379EFC()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_230379F08()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_230379F14()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_230379F20()
{
  return MEMORY[0x24BDCB728]();
}

uint64_t sub_230379F2C()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_230379F38()
{
  return MEMORY[0x24BDCB830]();
}

uint64_t sub_230379F44()
{
  return MEMORY[0x24BDCB840]();
}

uint64_t sub_230379F50()
{
  return MEMORY[0x24BDCB848]();
}

uint64_t sub_230379F5C()
{
  return MEMORY[0x24BDCB868]();
}

uint64_t sub_230379F68()
{
  return MEMORY[0x24BDCB870]();
}

uint64_t sub_230379F74()
{
  return MEMORY[0x24BDCB878]();
}

uint64_t sub_230379F80()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_230379F8C()
{
  return MEMORY[0x24BDCBAE8]();
}

uint64_t sub_230379F98()
{
  return MEMORY[0x24BDCBB30]();
}

uint64_t sub_230379FA4()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_230379FB0()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_230379FBC()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_230379FC8()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_230379FD4()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_230379FE0()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_230379FEC()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_230379FF8()
{
  return MEMORY[0x24BDCC7C0]();
}

uint64_t sub_23037A004()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_23037A010()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_23037A01C()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_23037A028()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_23037A034()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_23037A040()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_23037A04C()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_23037A058()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23037A064()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23037A070()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_23037A07C()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_23037A088()
{
  return MEMORY[0x24BDCD848]();
}

uint64_t sub_23037A094()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_23037A0A0()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_23037A0AC()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23037A0B8()
{
  return MEMORY[0x24BDCD918]();
}

uint64_t sub_23037A0C4()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_23037A0D0()
{
  return MEMORY[0x24BDCD938]();
}

uint64_t sub_23037A0DC()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_23037A0E8()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23037A0F4()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_23037A100()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_23037A10C()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_23037A118()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23037A124()
{
  return MEMORY[0x24BDCDB58]();
}

uint64_t sub_23037A130()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_23037A13C()
{
  return MEMORY[0x24BDCDB68]();
}

uint64_t sub_23037A148()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_23037A154()
{
  return MEMORY[0x24BDCDBD0]();
}

uint64_t sub_23037A160()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_23037A16C()
{
  return MEMORY[0x24BDCDC30]();
}

uint64_t sub_23037A178()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_23037A184()
{
  return MEMORY[0x24BDCDC60]();
}

uint64_t sub_23037A190()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23037A19C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23037A1A8()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_23037A1B4()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_23037A1C0()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_23037A1CC()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_23037A1D8()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_23037A1E4()
{
  return MEMORY[0x24BDCE600]();
}

uint64_t sub_23037A1F0()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_23037A1FC()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_23037A208()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_23037A214()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_23037A220()
{
  return MEMORY[0x24BDCE8A8]();
}

uint64_t sub_23037A22C()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_23037A238()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23037A244()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23037A250()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23037A25C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23037A268()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23037A274()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23037A280()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23037A28C()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_23037A298()
{
  return MEMORY[0x24BDB9C70]();
}

uint64_t sub_23037A2A4()
{
  return MEMORY[0x24BDB9C78]();
}

uint64_t sub_23037A2B0()
{
  return MEMORY[0x24BDB9C90]();
}

uint64_t sub_23037A2BC()
{
  return MEMORY[0x24BDB9E50]();
}

uint64_t sub_23037A2C8()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_23037A2D4()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_23037A2E0()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_23037A2EC()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_23037A2F8()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_23037A304()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_23037A310()
{
  return MEMORY[0x24BDB9F30]();
}

uint64_t sub_23037A31C()
{
  return MEMORY[0x24BDB9F90]();
}

uint64_t sub_23037A328()
{
  return MEMORY[0x24BDB9FB0]();
}

uint64_t sub_23037A334()
{
  return MEMORY[0x24BDBA030]();
}

uint64_t sub_23037A340()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_23037A34C()
{
  return MEMORY[0x24BDBA098]();
}

uint64_t sub_23037A358()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_23037A364()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_23037A370()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_23037A37C()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_23037A388()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_23037A394()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_23037A3A0()
{
  return MEMORY[0x24BDEE020]();
}

uint64_t sub_23037A3AC()
{
  return MEMORY[0x24BDEE028]();
}

uint64_t sub_23037A3B8()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_23037A3C4()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_23037A3D0()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_23037A3DC()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_23037A3E8()
{
  return MEMORY[0x24BDEFCA8]();
}

uint64_t sub_23037A3F4()
{
  return MEMORY[0x24BDEFCB8]();
}

uint64_t sub_23037A400()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_23037A40C()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_23037A418()
{
  return MEMORY[0x24BDF1CC0]();
}

uint64_t sub_23037A424()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_23037A430()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_23037A43C()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23037A448()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_23037A454()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_23037A460()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_23037A46C()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_23037A478()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_23037A484()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_23037A490()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_23037A49C()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_23037A4A8()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_23037A4B4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23037A4C0()
{
  return MEMORY[0x24BEE54E8]();
}

uint64_t sub_23037A4CC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23037A4D8()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_23037A4E4()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_23037A4F0()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_23037A4FC()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23037A508()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23037A514()
{
  return MEMORY[0x24BEE0298]();
}

uint64_t sub_23037A520()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_23037A52C()
{
  return MEMORY[0x24BEE02C0]();
}

uint64_t sub_23037A538()
{
  return MEMORY[0x24BEE0418]();
}

uint64_t sub_23037A544()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23037A550()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23037A55C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23037A568()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_23037A574()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_23037A580()
{
  return MEMORY[0x24BEE08B8]();
}

uint64_t sub_23037A58C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23037A598()
{
  return MEMORY[0x24BDCF890]();
}

uint64_t sub_23037A5A4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23037A5B0()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_23037A5BC()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_23037A5C8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23037A5D4()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_23037A5E0()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_23037A5EC()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_23037A5F8()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_23037A604()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23037A610()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_23037A61C()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_23037A628()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_23037A634()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_23037A640()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_23037A64C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23037A658()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_23037A664()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_23037A670()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23037A67C()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_23037A688()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23037A694()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_23037A6A0()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_23037A6AC()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_23037A6B8()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_23037A6C4()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_23037A6D0()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_23037A6DC()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_23037A6E8()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_23037A6F4()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23037A700()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_23037A70C()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_23037A718()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_23037A724()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_23037A730()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23037A73C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23037A748()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23037A754()
{
  return MEMORY[0x24BEE1118]();
}

uint64_t sub_23037A760()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23037A76C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23037A778()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_23037A784()
{
  return MEMORY[0x24BEE1150]();
}

uint64_t sub_23037A790()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23037A79C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23037A7A8()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_23037A7B4()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23037A7C0()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_23037A7CC()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_23037A7D8()
{
  return MEMORY[0x24BEE1230]();
}

uint64_t sub_23037A7E4()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23037A7F0()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_23037A7FC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23037A808()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_23037A814()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23037A820()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23037A82C()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_23037A838()
{
  return MEMORY[0x24BEE6A38]();
}

uint64_t sub_23037A844()
{
  return MEMORY[0x24BEE6A90]();
}

uint64_t sub_23037A850()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t sub_23037A85C()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_23037A868()
{
  return MEMORY[0x24BEE6B28]();
}

uint64_t sub_23037A874()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_23037A880()
{
  return MEMORY[0x24BEE6CC0]();
}

uint64_t sub_23037A88C()
{
  return MEMORY[0x24BEE6CC8]();
}

uint64_t sub_23037A898()
{
  return MEMORY[0x24BEE6CE0]();
}

uint64_t sub_23037A8A4()
{
  return MEMORY[0x24BEE6CE8]();
}

uint64_t sub_23037A8B0()
{
  return MEMORY[0x24BEE6D30]();
}

uint64_t sub_23037A8BC()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_23037A8C8()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_23037A8D4()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23037A8E0()
{
  return MEMORY[0x24BDCFE60]();
}

uint64_t sub_23037A8EC()
{
  return MEMORY[0x24BDCFE78]();
}

uint64_t sub_23037A8F8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23037A904()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23037A910()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_23037A91C()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_23037A928()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23037A934()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_23037A940()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_23037A94C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_23037A958()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_23037A964()
{
  return MEMORY[0x24BEE57C0]();
}

uint64_t sub_23037A970()
{
  return MEMORY[0x24BEE57F8]();
}

uint64_t sub_23037A97C()
{
  return MEMORY[0x24BEE5810]();
}

uint64_t sub_23037A988()
{
  return MEMORY[0x24BEE5828]();
}

uint64_t sub_23037A994()
{
  return MEMORY[0x24BEE58A8]();
}

uint64_t sub_23037A9A0()
{
  return MEMORY[0x24BEE58B8]();
}

uint64_t sub_23037A9AC()
{
  return MEMORY[0x24BEE58C0]();
}

uint64_t sub_23037A9B8()
{
  return MEMORY[0x24BEE58D0]();
}

uint64_t sub_23037A9C4()
{
  return MEMORY[0x24BEE58D8]();
}

uint64_t sub_23037A9D0()
{
  return MEMORY[0x24BEE5960]();
}

uint64_t sub_23037A9DC()
{
  return MEMORY[0x24BEE5968]();
}

uint64_t sub_23037A9E8()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23037A9F4()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_23037AA00()
{
  return MEMORY[0x24BDD03C0]();
}

uint64_t sub_23037AA0C()
{
  return MEMORY[0x24BDD03F0]();
}

uint64_t sub_23037AA18()
{
  return MEMORY[0x24BDD0400]();
}

uint64_t sub_23037AA24()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23037AA30()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23037AA3C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23037AA48()
{
  return MEMORY[0x24BDD04B8]();
}

uint64_t sub_23037AA54()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_23037AA60()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_23037AA6C()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_23037AA78()
{
  return MEMORY[0x24BDD0590]();
}

uint64_t sub_23037AA84()
{
  return MEMORY[0x24BDD0608]();
}

uint64_t sub_23037AA90()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_23037AA9C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23037AAA8()
{
  return MEMORY[0x24BEE2200]();
}

uint64_t sub_23037AAB4()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_23037AAC0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23037AACC()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23037AAD8()
{
  return MEMORY[0x24BEE22D8]();
}

uint64_t sub_23037AAE4()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23037AAF0()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23037AAFC()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23037AB08()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_23037AB14()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23037AB20()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23037AB2C()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_23037AB38()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_23037AB44()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23037AB50()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_23037AB5C()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23037AB68()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23037AB74()
{
  return MEMORY[0x24BEE2730]();
}

uint64_t sub_23037AB80()
{
  return MEMORY[0x24BEE2740]();
}

uint64_t sub_23037AB8C()
{
  return MEMORY[0x24BEE2750]();
}

uint64_t sub_23037AB98()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23037ABA4()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23037ABB0()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23037ABBC()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_23037ABC8()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23037ABD4()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23037ABE0()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23037ABEC()
{
  return MEMORY[0x24BEE6EB0]();
}

uint64_t sub_23037ABF8()
{
  return MEMORY[0x24BEE6EB8]();
}

uint64_t sub_23037AC04()
{
  return MEMORY[0x24BEE6EC0]();
}

uint64_t sub_23037AC10()
{
  return MEMORY[0x24BEE6ED8]();
}

uint64_t sub_23037AC1C()
{
  return MEMORY[0x24BEE6EE8]();
}

uint64_t sub_23037AC28()
{
  return MEMORY[0x24BEE6F00]();
}

uint64_t sub_23037AC34()
{
  return MEMORY[0x24BEE2CB8]();
}

uint64_t sub_23037AC40()
{
  return MEMORY[0x24BEE2CC0]();
}

uint64_t sub_23037AC4C()
{
  return MEMORY[0x24BEE2CC8]();
}

uint64_t sub_23037AC58()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_23037AC64()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_23037AC70()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_23037AC7C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23037AC88()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23037AC94()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23037ACA0()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_23037ACAC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23037ACB8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23037ACC4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23037ACD0()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_23037ACDC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23037ACE8()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23037ACF4()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23037AD00()
{
  return MEMORY[0x24BEE32C8]();
}

uint64_t sub_23037AD0C()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_23037AD18()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_23037AD24()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_23037AD30()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_23037AD3C()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23037AD48()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23037AD54()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23037AD60()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_23037AD6C()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23037AD78()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23037AD84()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23037AD90()
{
  return MEMORY[0x24BEE33D0]();
}

uint64_t sub_23037AD9C()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23037ADA8()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_23037ADB4()
{
  return MEMORY[0x24BEE3430]();
}

uint64_t sub_23037ADC0()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t sub_23037ADCC()
{
  return MEMORY[0x24BEE3448]();
}

uint64_t sub_23037ADD8()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23037ADE4()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23037ADF0()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23037ADFC()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_23037AE08()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23037AE14()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23037AE20()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_23037AE2C()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23037AE38()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23037AE44()
{
  return MEMORY[0x24BEE3580]();
}

uint64_t sub_23037AE50()
{
  return MEMORY[0x24BEE3610]();
}

uint64_t sub_23037AE5C()
{
  return MEMORY[0x24BEE3638]();
}

uint64_t sub_23037AE68()
{
  return MEMORY[0x24BEE3668]();
}

uint64_t sub_23037AE74()
{
  return MEMORY[0x24BEE3788]();
}

uint64_t sub_23037AE80()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_23037AE8C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23037AE98()
{
  return MEMORY[0x24BEE3A58]();
}

uint64_t sub_23037AEA4()
{
  return MEMORY[0x24BEE3A60]();
}

uint64_t sub_23037AEB0()
{
  return MEMORY[0x24BEE3A88]();
}

uint64_t sub_23037AEBC()
{
  return MEMORY[0x24BEE3AC8]();
}

uint64_t sub_23037AEC8()
{
  return MEMORY[0x24BEE3AF8]();
}

uint64_t sub_23037AED4()
{
  return MEMORY[0x24BEE3B20]();
}

uint64_t sub_23037AEE0()
{
  return MEMORY[0x24BEE3B68]();
}

uint64_t sub_23037AEEC()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_23037AEF8()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23037AF04()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23037AF10()
{
  return MEMORY[0x24BDD06D8]();
}

uint64_t sub_23037AF1C()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_23037AF28()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_23037AF34()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_23037AF40()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23037AF4C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23037AF58()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23037AF64()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23037AF70()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_23037AF7C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23037AF88()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23037AF94()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23037AFA0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23037AFAC()
{
  return MEMORY[0x24BEE45F0]();
}

uint64_t sub_23037AFB8()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_23037AFC4()
{
  return MEMORY[0x24BEE4600]();
}

uint64_t sub_23037AFD0()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23037AFDC()
{
  return MEMORY[0x24BEE4620]();
}

uint64_t sub_23037AFE8()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t sub_23037AFF4()
{
  return MEMORY[0x24BEE4630]();
}

uint64_t sub_23037B000()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23037B00C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23037B018()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_23037B024()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x24BEE4B48]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

