uint64_t sub_246519858()
{
  sub_246529FA8();
  sub_246529FB4();
  return sub_246529FC0();
}

uint64_t sub_2465198A4()
{
  return sub_246529FB4();
}

uint64_t sub_2465198D8()
{
  sub_246529FA8();
  sub_246529FB4();
  return sub_246529FC0();
}

_QWORD *sub_246519920@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 10002)
    v2 = 1;
  else
    v2 = 2;
  if (*result == 10001)
    v3 = 0;
  else
    v3 = v2;
  *a2 = v3;
  return result;
}

void sub_246519948(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;

  v2 = 10001;
  if (*v1)
    v2 = 10002;
  *a1 = v2;
}

uint64_t sub_246519964(uint64_t a1, uint64_t a2)
{
  return sub_246519DC4(a1, a2, (void (*)(void))sub_24651A528);
}

uint64_t sub_246519978()
{
  sub_246529FA8();
  sub_246529FB4();
  return sub_246529FC0();
}

uint64_t sub_2465199C0()
{
  return sub_246529FB4();
}

uint64_t sub_2465199F0()
{
  sub_246529FA8();
  sub_246529FB4();
  return sub_246529FC0();
}

uint64_t sub_246519A34@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_24651A6C0(*a1);
  *a2 = result;
  return result;
}

void sub_246519A5C(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1 + 10101;
}

uint64_t sub_246519A70(uint64_t a1, uint64_t a2)
{
  return sub_246519DC4(a1, a2, (void (*)(void))sub_24651A5B0);
}

uint64_t sub_246519A7C()
{
  sub_246529FA8();
  sub_246529FB4();
  return sub_246529FC0();
}

uint64_t sub_246519AC4()
{
  return sub_246529FB4();
}

uint64_t sub_246519AF4()
{
  sub_246529FA8();
  sub_246529FB4();
  return sub_246529FC0();
}

uint64_t sub_246519B38@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_24651A6D8(*a1);
  *a2 = result;
  return result;
}

void sub_246519B60(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1 + 10201;
}

uint64_t sub_246519B74(uint64_t a1, uint64_t a2)
{
  return sub_246519DC4(a1, a2, (void (*)(void))sub_24651A638);
}

BOOL sub_246519B80(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_246519B98()
{
  sub_246529FA8();
  sub_246529FB4();
  return sub_246529FC0();
}

uint64_t sub_246519BE4()
{
  return sub_246529FB4();
}

uint64_t sub_246519C18()
{
  sub_246529FA8();
  sub_246529FB4();
  return sub_246529FC0();
}

_QWORD *sub_246519C60@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 10302)
    v2 = 1;
  else
    v2 = 2;
  if (*result == 10301)
    v3 = 0;
  else
    v3 = v2;
  *a2 = v3;
  return result;
}

void sub_246519C88(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;

  v2 = 10301;
  if (*v1)
    v2 = 10302;
  *a1 = v2;
}

uint64_t sub_246519CA0(uint64_t a1, uint64_t a2)
{
  return sub_246519DC4(a1, a2, (void (*)(void))sub_24651A67C);
}

BOOL sub_246519CAC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_246519CC0()
{
  sub_246529FA8();
  sub_246529FB4();
  return sub_246529FC0();
}

uint64_t sub_246519D08()
{
  return sub_246529FB4();
}

uint64_t sub_246519D38()
{
  sub_246529FA8();
  sub_246529FB4();
  return sub_246529FC0();
}

uint64_t sub_246519D7C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_24651A6F0(*a1);
  *a2 = result;
  return result;
}

void sub_246519DA4(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1 + 10401;
}

uint64_t sub_246519DB8(uint64_t a1, uint64_t a2)
{
  return sub_246519DC4(a1, a2, (void (*)(void))sub_24651A5F4);
}

uint64_t sub_246519DC4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  sub_24651A56C();
  return sub_246529F90();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_246519E20(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_246519E2C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SiriMASPFLPluginArgsError()
{
  return &type metadata for SiriMASPFLPluginArgsError;
}

uint64_t getEnumTagSinglePayload for ModelTrainerError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ModelTrainerError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246519F24 + 4 * byte_24652A3D5[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_246519F58 + 4 * byte_24652A3D0[v4]))();
}

uint64_t sub_246519F58(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246519F60(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246519F68);
  return result;
}

uint64_t sub_246519F74(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246519F7CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_246519F80(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246519F88(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ModelTrainerError()
{
  return &type metadata for ModelTrainerError;
}

uint64_t getEnumTagSinglePayload for SiriMASPFLPluginRunnerError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriMASPFLPluginRunnerError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_24651A080 + 4 * byte_24652A3DF[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_24651A0B4 + 4 * byte_24652A3DA[v4]))();
}

uint64_t sub_24651A0B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24651A0BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24651A0C4);
  return result;
}

uint64_t sub_24651A0D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24651A0D8);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_24651A0DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24651A0E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_24651A0F0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriMASPFLPluginRunnerError()
{
  return &type metadata for SiriMASPFLPluginRunnerError;
}

uint64_t getEnumTagSinglePayload for BiomeSQLRowAggregatorError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for BiomeSQLRowAggregatorError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24651A1E4 + 4 * byte_24652A3E9[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_24651A218 + 4 * byte_24652A3E4[v4]))();
}

uint64_t sub_24651A218(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24651A220(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24651A228);
  return result;
}

uint64_t sub_24651A234(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24651A23CLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_24651A240(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24651A248(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BiomeSQLRowAggregatorError()
{
  return &type metadata for BiomeSQLRowAggregatorError;
}

uint64_t getEnumTagSinglePayload for ModelEvaluationMetricType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s18SiriMASPFLTraining25SiriMASPFLPluginArgsErrorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24651A340 + 4 * byte_24652A3F3[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24651A374 + 4 * byte_24652A3EE[v4]))();
}

uint64_t sub_24651A374(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24651A37C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24651A384);
  return result;
}

uint64_t sub_24651A390(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24651A398);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24651A39C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24651A3A4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BiomeSQLClientError()
{
  return &type metadata for BiomeSQLClientError;
}

unint64_t sub_24651A3C4()
{
  unint64_t result;

  result = qword_257589F08;
  if (!qword_257589F08)
  {
    result = MEMORY[0x24955D710](&unk_24652A52C, &type metadata for BiomeSQLClientError);
    atomic_store(result, (unint64_t *)&qword_257589F08);
  }
  return result;
}

unint64_t sub_24651A40C()
{
  unint64_t result;

  result = qword_257589F10;
  if (!qword_257589F10)
  {
    result = MEMORY[0x24955D710](&unk_24652A5CC, &type metadata for BiomeSQLRowAggregatorError);
    atomic_store(result, (unint64_t *)&qword_257589F10);
  }
  return result;
}

unint64_t sub_24651A454()
{
  unint64_t result;

  result = qword_257589F18;
  if (!qword_257589F18)
  {
    result = MEMORY[0x24955D710](&unk_24652A66C, &type metadata for SiriMASPFLPluginRunnerError);
    atomic_store(result, (unint64_t *)&qword_257589F18);
  }
  return result;
}

unint64_t sub_24651A49C()
{
  unint64_t result;

  result = qword_257589F20;
  if (!qword_257589F20)
  {
    result = MEMORY[0x24955D710](&unk_24652A70C, &type metadata for ModelTrainerError);
    atomic_store(result, (unint64_t *)&qword_257589F20);
  }
  return result;
}

unint64_t sub_24651A4E4()
{
  unint64_t result;

  result = qword_257589F28;
  if (!qword_257589F28)
  {
    result = MEMORY[0x24955D710](&unk_24652A7AC, &type metadata for SiriMASPFLPluginArgsError);
    atomic_store(result, (unint64_t *)&qword_257589F28);
  }
  return result;
}

unint64_t sub_24651A528()
{
  unint64_t result;

  result = qword_257589F30;
  if (!qword_257589F30)
  {
    result = MEMORY[0x24955D710](&unk_24652A4B4, &type metadata for BiomeSQLClientError);
    atomic_store(result, (unint64_t *)&qword_257589F30);
  }
  return result;
}

unint64_t sub_24651A56C()
{
  unint64_t result;

  result = qword_257589F38;
  if (!qword_257589F38)
  {
    result = MEMORY[0x24955D710](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_257589F38);
  }
  return result;
}

unint64_t sub_24651A5B0()
{
  unint64_t result;

  result = qword_257589F40;
  if (!qword_257589F40)
  {
    result = MEMORY[0x24955D710](&unk_24652A554, &type metadata for BiomeSQLRowAggregatorError);
    atomic_store(result, (unint64_t *)&qword_257589F40);
  }
  return result;
}

unint64_t sub_24651A5F4()
{
  unint64_t result;

  result = qword_257589F48;
  if (!qword_257589F48)
  {
    result = MEMORY[0x24955D710](&unk_24652A5F4, &type metadata for SiriMASPFLPluginRunnerError);
    atomic_store(result, (unint64_t *)&qword_257589F48);
  }
  return result;
}

unint64_t sub_24651A638()
{
  unint64_t result;

  result = qword_257589F50;
  if (!qword_257589F50)
  {
    result = MEMORY[0x24955D710](&unk_24652A694, &type metadata for ModelTrainerError);
    atomic_store(result, (unint64_t *)&qword_257589F50);
  }
  return result;
}

unint64_t sub_24651A67C()
{
  unint64_t result;

  result = qword_257589F58;
  if (!qword_257589F58)
  {
    result = MEMORY[0x24955D710](&unk_24652A734, &type metadata for SiriMASPFLPluginArgsError);
    atomic_store(result, (unint64_t *)&qword_257589F58);
  }
  return result;
}

uint64_t sub_24651A6C0(uint64_t a1)
{
  if ((unint64_t)(a1 - 10101) >= 8)
    return 8;
  else
    return a1 - 10101;
}

uint64_t sub_24651A6D8(uint64_t a1)
{
  if ((unint64_t)(a1 - 10201) >= 5)
    return 5;
  else
    return a1 - 10201;
}

uint64_t sub_24651A6F0(uint64_t a1)
{
  if ((unint64_t)(a1 - 10401) >= 6)
    return 6;
  else
    return a1 - 10401;
}

unint64_t sub_24651A71C(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758A190);
  v2 = sub_246529E94();
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
    sub_24651E000(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_2465299CC(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_24651E048(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_24651A844(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758A200);
  v2 = (_QWORD *)sub_246529E94();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_DWORD *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_2465299CC(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_DWORD *)(v2[7] + 4 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 6;
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

unint64_t sub_24651A954(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t result;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _BYTE *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  char v31;
  char **v32;
  char *v33;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  char v38;
  char *v39;
  unint64_t v40;
  char *v41;
  unint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  if (!*(_QWORD *)(a1 + 16))
  {
    v44 = 0u;
    v45 = 0u;
    goto LABEL_11;
  }
  v3 = v2;
  v4 = v1;
  v6 = v4[7];
  v7 = v4[8];
  swift_bridgeObjectRetain();
  v8 = sub_2465299CC(v6, v7);
  if ((v9 & 1) == 0)
  {
    v44 = 0u;
    v45 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  sub_24651E76C(*(_QWORD *)(a1 + 56) + 32 * v8, (uint64_t)&v44);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v45 + 1))
  {
LABEL_11:
    sub_24651E72C((uint64_t)&v44);
    goto LABEL_12;
  }
  if (swift_dynamicCast())
  {
    result = sub_24651AE78(a1);
    if (!v3)
    {
      v12 = result;
      v13 = v11;
      v14 = v4 + 2;
      swift_beginAccess();
      v15 = v4[2];
      if (*(_QWORD *)(v15 + 16) && (v16 = sub_24652999C(v43), (v17 & 1) != 0))
      {
        v18 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v16);
        swift_retain();
        swift_retain();
        sub_24651C310(v12);
        swift_release();
        v32 = (char **)(v18 + 24);
        swift_beginAccess();
        v33 = *(char **)(v18 + 24);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)(v18 + 24) = v33;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v33 = sub_24651C634(0, *((_QWORD *)v33 + 2) + 1, 1, v33);
          *v32 = v33;
        }
        v35 = *((_QWORD *)v33 + 2);
        v36 = *((_QWORD *)v33 + 3);
        v37 = v35 + 1;
        if (v35 >= v36 >> 1)
        {
          v42 = v35 + 1;
          v39 = v33;
          v40 = *((_QWORD *)v33 + 2);
          v41 = sub_24651C634((char *)(v36 > 1), v35 + 1, 1, v39);
          v35 = v40;
          v37 = v42;
          v33 = v41;
          *v32 = v41;
        }
        *((_QWORD *)v33 + 2) = v37;
        *(_DWORD *)&v33[4 * v35 + 32] = v13;
        swift_endAccess();
        swift_bridgeObjectRelease();
        swift_beginAccess();
        swift_retain();
        v38 = swift_isUniquelyReferenced_nonNull_native();
        v46 = *v14;
        *v14 = 0x8000000000000000;
        sub_24651CCF8(v18, v43, v38);
        *v14 = v46;
        swift_bridgeObjectRelease();
        swift_endAccess();
        return swift_release();
      }
      else
      {
        if (qword_257589EA0 != -1)
          swift_once();
        v24 = sub_246529CB4();
        __swift_project_value_buffer(v24, (uint64_t)qword_25758BF70);
        v25 = sub_246529C9C();
        v26 = sub_246529DE0();
        if (os_log_type_enabled(v25, v26))
        {
          v27 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v27 = 134217984;
          sub_246529E04();
          _os_log_impl(&dword_246518000, v25, v26, "Initializing training data for aggregating value %ld", v27, 0xCu);
          MEMORY[0x24955D794](v27, -1, -1);
        }

        __swift_instantiateConcreteTypeFromMangledName(&qword_25758A1E8);
        v28 = swift_allocObject();
        __swift_instantiateConcreteTypeFromMangledName(&qword_25758A1F0);
        v29 = (_QWORD *)swift_allocObject();
        v29[3] = 1;
        v29[4] = *(_QWORD *)(v12 + 16);
        v29[2] = v12;
        *(_QWORD *)(v28 + 16) = v29;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25758A1A0);
        v30 = swift_allocObject();
        *(_OWORD *)(v30 + 16) = xmmword_24652A940;
        *(_DWORD *)(v30 + 32) = v13;
        *(_QWORD *)(v28 + 24) = v30;
        swift_beginAccess();
        v31 = swift_isUniquelyReferenced_nonNull_native();
        v46 = *v14;
        *v14 = 0x8000000000000000;
        sub_24651CCF8(v28, v43, v31);
        *v14 = v46;
        swift_bridgeObjectRelease();
        return swift_endAccess();
      }
    }
    return result;
  }
LABEL_12:
  if (qword_257589EA0 != -1)
    swift_once();
  v19 = sub_246529CB4();
  __swift_project_value_buffer(v19, (uint64_t)qword_25758BF70);
  v20 = sub_246529C9C();
  v21 = sub_246529DEC();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_246518000, v20, v21, "aggregatingValue not found.", v22, 2u);
    MEMORY[0x24955D794](v22, -1, -1);
  }

  sub_24651D434();
  swift_allocError();
  *v23 = 2;
  return swift_willThrow();
}

unint64_t sub_24651AE78(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  _BYTE *v36;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  _BYTE *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  _OWORD v49[2];
  uint64_t v50;

  v2 = v1;
  v4 = *(_QWORD *)(v1[9] + 16);
  if (!v4)
  {
    v8 = MEMORY[0x24BEE4AF8];
LABEL_22:
    v19 = v2[10];
    v18 = v2[11];
    if (*(_QWORD *)(a1 + 16))
    {
      swift_bridgeObjectRetain();
      v20 = sub_2465299CC(v19, v18);
      if ((v21 & 1) != 0)
      {
        sub_24651E76C(*(_QWORD *)(a1 + 56) + 32 * v20, (uint64_t)&v47);
      }
      else
      {
        v47 = 0u;
        v48 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v48 + 1))
      {
        sub_24651E048(&v47, v49);
        v22 = sub_24651E368((uint64_t)v49);
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v49);
        if ((v22 & 0x100000000) == 0)
          return v8;
        swift_bridgeObjectRelease();
LABEL_32:
        if (qword_257589EA0 != -1)
          swift_once();
        v23 = sub_246529CB4();
        __swift_project_value_buffer(v23, (uint64_t)qword_25758BF70);
        swift_bridgeObjectRetain_n();
        swift_retain();
        v24 = sub_246529C9C();
        v25 = sub_246529DEC();
        v8 = v25;
        if (os_log_type_enabled(v24, v25))
        {
          v26 = swift_slowAlloc();
          v45 = swift_slowAlloc();
          *(_QWORD *)&v49[0] = v45;
          *(_DWORD *)v26 = 136315394;
          swift_bridgeObjectRetain();
          *(_QWORD *)&v47 = sub_2465292E0(v19, v18, (uint64_t *)v49);
          sub_246529E04();
          swift_release();
          swift_bridgeObjectRelease();
          *(_WORD *)(v26 + 12) = 2080;
          swift_bridgeObjectRetain();
          v27 = sub_246529CF0();
          v29 = v28;
          swift_bridgeObjectRelease();
          *(_QWORD *)&v47 = sub_2465292E0(v27, v29, (uint64_t *)v49);
          sub_246529E04();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_246518000, v24, (os_log_type_t)v8, "Couldn't find %s value in %s", (uint8_t *)v26, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x24955D794](v45, -1, -1);
          v30 = v26;
LABEL_42:
          MEMORY[0x24955D794](v30, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_release();
        }
        goto LABEL_43;
      }
    }
    else
    {
      v47 = 0u;
      v48 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_24651E72C((uint64_t)&v47);
    goto LABEL_32;
  }
  v44 = v1;
  v6 = v1[10];
  v5 = v1[11];
  v7 = (unint64_t *)(swift_bridgeObjectRetain() + 40);
  v8 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v10 = *(v7 - 1);
    v9 = *v7;
    v11 = v10 == v6 && v9 == v5;
    if (v11 || (sub_246529F48() & 1) != 0)
      goto LABEL_4;
    if (!*(_QWORD *)(a1 + 16))
      break;
    swift_bridgeObjectRetain_n();
    v12 = sub_2465299CC(v10, v9);
    if ((v13 & 1) != 0)
    {
      sub_24651E76C(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)&v47);
    }
    else
    {
      v47 = 0u;
      v48 = 0u;
    }
    swift_bridgeObjectRelease();
    if (!*((_QWORD *)&v48 + 1))
      goto LABEL_38;
    sub_24651E048(&v47, v49);
    v14 = sub_24651E368((uint64_t)v49);
    if ((v14 & 0x100000000) != 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_257589EA0 != -1)
        swift_once();
      v38 = sub_246529CB4();
      __swift_project_value_buffer(v38, (uint64_t)qword_25758BF70);
      swift_bridgeObjectRetain();
      v39 = sub_246529C9C();
      v40 = sub_246529DEC();
      if (os_log_type_enabled(v39, v40))
      {
        v41 = (uint8_t *)swift_slowAlloc();
        v42 = swift_slowAlloc();
        *(_QWORD *)&v47 = v42;
        *(_DWORD *)v41 = 136315138;
        v8 = (unint64_t)(v41 + 12);
        swift_bridgeObjectRetain();
        v50 = sub_2465292E0(v10, v9, (uint64_t *)&v47);
        sub_246529E04();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_246518000, v39, v40, "Unable to convert value for %s to float", v41, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24955D794](v42, -1, -1);
        MEMORY[0x24955D794](v41, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_24651D434();
      swift_allocError();
      *v43 = 4;
      swift_willThrow();
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v49);
      return v8;
    }
    v15 = v14;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v8 = (unint64_t)sub_24651C634(0, *(_QWORD *)(v8 + 16) + 1, 1, (char *)v8);
    v17 = *(_QWORD *)(v8 + 16);
    v16 = *(_QWORD *)(v8 + 24);
    if (v17 >= v16 >> 1)
      v8 = (unint64_t)sub_24651C634((char *)(v16 > 1), v17 + 1, 1, (char *)v8);
    *(_QWORD *)(v8 + 16) = v17 + 1;
    *(_DWORD *)(v8 + 4 * v17 + 32) = v15;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v49);
LABEL_4:
    v7 += 2;
    if (!--v4)
    {
      swift_bridgeObjectRelease();
      v2 = v44;
      goto LABEL_22;
    }
  }
  v47 = 0u;
  v48 = 0u;
  swift_bridgeObjectRetain();
LABEL_38:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24651E72C((uint64_t)&v47);
  if (qword_257589EA0 != -1)
    swift_once();
  v31 = sub_246529CB4();
  __swift_project_value_buffer(v31, (uint64_t)qword_25758BF70);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v24 = sub_246529C9C();
  v32 = sub_246529DEC();
  if (os_log_type_enabled(v24, v32))
  {
    v33 = swift_slowAlloc();
    v46 = swift_slowAlloc();
    *(_QWORD *)&v49[0] = v46;
    *(_DWORD *)v33 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v47 = sub_2465292E0(v10, v9, (uint64_t *)v49);
    sub_246529E04();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v33 + 12) = 2080;
    swift_bridgeObjectRetain();
    v34 = sub_246529CF0();
    v8 = v35;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v47 = sub_2465292E0(v34, v8, (uint64_t *)v49);
    sub_246529E04();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246518000, v24, v32, "Couldn't find %s value in %s", (uint8_t *)v33, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24955D794](v46, -1, -1);
    v30 = v33;
    goto LABEL_42;
  }

  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
LABEL_43:
  sub_24651D434();
  swift_allocError();
  *v36 = 4;
  swift_willThrow();
  return v8;
}

uint64_t sub_24651B6A4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char *v10;
  char isUniquelyReferenced_nonNull_native;
  char *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD *v28;
  uint64_t inited;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  _BYTE *v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  _QWORD *v48;
  id v49;
  _QWORD *v50;
  _BYTE *v51;
  id v52;
  void *v53;
  uint64_t result;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  _QWORD *v60;
  uint64_t v61;
  _QWORD *v62[8];

  v62[6] = *(_QWORD **)MEMORY[0x24BDAC8D0];
  v60 = *(_QWORD **)(v0[9] + 16);
  v61 = MEMORY[0x24BEE4AF8];
  swift_beginAccess();
  v56 = v0;
  v2 = swift_bridgeObjectRetain();
  v3 = sub_24651D338(v2);
  swift_bridgeObjectRelease();
  v62[0] = v3;
  swift_bridgeObjectRetain();
  sub_24651D2D0(v62);
  if (v1)
  {
    result = swift_release();
    __break(1u);
  }
  else
  {
    swift_release();
    v4 = v62[0];
    v5 = v62[0][2];
    if (v5)
    {
      v6 = 40;
      v55 = v62[0];
      while (1)
      {
        v7 = *(_QWORD *)((char *)v4 + v6);
        v8 = *(_QWORD *)(v7 + 16);
        v9 = *(_QWORD **)(v8 + 32);
        if (v9 != v60)
          break;
        v57 = v6;
        v58 = v5;
        swift_beginAccess();
        v10 = *(char **)(v8 + 16);
        swift_retain();
        swift_retain();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)(v8 + 16) = v10;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          v10 = sub_24651DF74((uint64_t)v10);
        *(_QWORD *)(v8 + 16) = v10;
        swift_endAccess();
        swift_release();
        swift_beginAccess();
        v12 = *(char **)(v7 + 24);
        v13 = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)(v7 + 24) = v12;
        if ((v13 & 1) == 0)
          v12 = sub_24651DF74((uint64_t)v12);
        v59 = v10 + 32;
        *(_QWORD *)(v7 + 24) = v12;
        swift_endAccess();
        __swift_instantiateConcreteTypeFromMangledName(&qword_25758A160);
        v14 = swift_allocObject();
        *(_OWORD *)(v14 + 16) = xmmword_24652A950;
        *(_QWORD *)(v14 + 32) = sub_246529DBC();
        *(_QWORD *)(v14 + 40) = sub_246529DBC();
        v62[0] = (_QWORD *)v14;
        sub_246529D50();
        v15 = swift_allocObject();
        *(_OWORD *)(v15 + 16) = xmmword_24652A950;
        *(_QWORD *)(v15 + 32) = sub_246529DBC();
        *(_QWORD *)(v15 + 40) = sub_246529DBC();
        v62[0] = (_QWORD *)v15;
        sub_246529D50();
        v16 = objc_allocWithZone(MEMORY[0x24BDBFFF0]);
        sub_24651DFC8(0, &qword_25758A168);
        v17 = (void *)sub_246529D44();
        swift_bridgeObjectRelease();
        v18 = (void *)sub_246529D44();
        swift_bridgeObjectRelease();
        v62[0] = 0;
        v19 = objc_msgSend(v16, sel_initWithDataPointer_shape_dataType_strides_deallocator_error_, v59, v17, 65568, v18, 0, v62);

        v20 = v62[0];
        if (!v19)
        {
          v4 = v62[0];
          v41 = (void *)sub_246529BD0();

          swift_willThrow();
          swift_release();
LABEL_23:
          swift_bridgeObjectRelease();
          if (qword_257589EA0 != -1)
            swift_once();
          v42 = sub_246529CB4();
          __swift_project_value_buffer(v42, (uint64_t)qword_25758BF70);
          v43 = v41;
          v44 = v41;
          v45 = sub_246529C9C();
          v46 = sub_246529DEC();
          if (os_log_type_enabled(v45, v46))
          {
            v47 = (uint8_t *)swift_slowAlloc();
            v48 = (_QWORD *)swift_slowAlloc();
            *(_DWORD *)v47 = 138412290;
            v4 = v47 + 12;
            v49 = v41;
            v50 = (_QWORD *)_swift_stdlib_bridgeErrorToNSError();
            v62[0] = v50;
            sub_246529E04();
            *v48 = v50;

            _os_log_impl(&dword_246518000, v45, v46, "Error forming MLBatchProvider: %@", v47, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName(&qword_25758A170);
            swift_arrayDestroy();
            MEMORY[0x24955D794](v48, -1, -1);
            MEMORY[0x24955D794](v47, -1, -1);
          }
          else
          {

          }
          sub_24651D434();
          swift_allocError();
          *v51 = 6;
          swift_willThrow();

          goto LABEL_29;
        }
        v21 = swift_allocObject();
        *(_OWORD *)(v21 + 16) = xmmword_24652A960;
        v22 = v20;
        *(_QWORD *)(v21 + 32) = sub_246529DBC();
        v62[0] = (_QWORD *)v21;
        sub_246529D50();
        v23 = swift_allocObject();
        *(_OWORD *)(v23 + 16) = xmmword_24652A960;
        *(_QWORD *)(v23 + 32) = sub_246529DF8();
        v62[0] = (_QWORD *)v23;
        sub_246529D50();
        v24 = objc_allocWithZone(MEMORY[0x24BDBFFF0]);
        v25 = (void *)sub_246529D44();
        swift_bridgeObjectRelease();
        v26 = (void *)sub_246529D44();
        swift_bridgeObjectRelease();
        v62[0] = 0;
        v27 = objc_msgSend(v24, sel_initWithDataPointer_shape_dataType_strides_deallocator_error_, v12 + 32, v25, 65568, v26, 0, v62);

        v28 = v62[0];
        if (!v27)
        {
          v4 = v62[0];
          v41 = (void *)sub_246529BD0();

          swift_willThrow();
          swift_release();

          goto LABEL_23;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_25758A178);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_24652A970;
        v30 = v56[4];
        *(_QWORD *)(inited + 32) = v56[3];
        *(_QWORD *)(inited + 40) = v30;
        v31 = sub_24651DFC8(0, &qword_25758A180);
        *(_QWORD *)(inited + 72) = v31;
        *(_QWORD *)(inited + 48) = v19;
        v32 = v56[6];
        *(_QWORD *)(inited + 80) = v56[5];
        *(_QWORD *)(inited + 88) = v32;
        *(_QWORD *)(inited + 120) = v31;
        *(_QWORD *)(inited + 96) = v27;
        v33 = v28;
        swift_bridgeObjectRetain();
        v34 = v19;
        swift_bridgeObjectRetain();
        v35 = v27;
        sub_24651A71C(inited);
        v36 = objc_allocWithZone(MEMORY[0x24BDBFF80]);
        sub_24651C550();
        v4 = v55;
        MEMORY[0x24955D1AC]();
        if (*(_QWORD *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_246529D5C();
        sub_246529D74();
        sub_246529D50();
        swift_release();

        v6 = v57 + 16;
        v5 = v58 - 1;
        if (v58 == 1)
          goto LABEL_14;
      }
      swift_retain();
      swift_release();
      swift_bridgeObjectRelease();
      if (qword_257589EA0 != -1)
        swift_once();
      v37 = sub_246529CB4();
      __swift_project_value_buffer(v37, (uint64_t)qword_25758BF70);
      v38 = sub_246529C9C();
      v39 = sub_246529DEC();
      if (os_log_type_enabled(v38, v39))
      {
        v4 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v4 = 134218240;
        v62[0] = v9;
        sub_246529E04();
        *((_WORD *)v4 + 6) = 2048;
        v62[0] = v60;
        sub_246529E04();
        _os_log_impl(&dword_246518000, v38, v39, "Mismatch in number of columns in trainingData %ld and number of features in arg %ld", (uint8_t *)v4, 0x16u);
        MEMORY[0x24955D794](v4, -1, -1);
      }

      sub_24651D434();
      swift_allocError();
      *v40 = 5;
      swift_willThrow();
LABEL_29:
      swift_release();
    }
    else
    {
LABEL_14:
      swift_release();
      v52 = objc_allocWithZone(MEMORY[0x24BDBFF60]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25758A188);
      v53 = (void *)sub_246529D44();
      swift_bridgeObjectRelease();
      v4 = objc_msgSend(v52, sel_initWithFeatureProviderArray_, v53);

    }
    return (uint64_t)v4;
  }
  return result;
}

uint64_t sub_24651BFE0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BiomeSQLRowAggregator()
{
  return objc_opt_self();
}

uint64_t sub_24651C050()
{
  return swift_initClassMetadata2();
}

uint64_t sub_24651C0A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;

  type metadata accessor for InputMatrix(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), a4);
  v7 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_retain();
  v9 = sub_24651C1A8(v7, v8);
  swift_release();
  swift_release();
  if (v9)
  {
    swift_beginAccess();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10 = sub_246529D80();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10 & 1;
}

BOOL sub_24651C1A8(uint64_t a1, uint64_t a2)
{
  char v4;

  swift_beginAccess();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v4 = sub_246529D80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v4 & 1) != 0 && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24) && *(_QWORD *)(a1 + 32) == *(_QWORD *)(a2 + 32);
}

uint64_t sub_24651C278()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TrainingData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TrainingData);
}

uint64_t sub_24651C2B0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_24651C304(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_24651C0A0(*a1, *a2, a3, a4);
}

uint64_t sub_24651C310(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  _BYTE *v7;

  if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(v1 + 32))
  {
    swift_beginAccess();
    v2 = swift_bridgeObjectRetain();
    sub_24651C3D0(v2);
    result = swift_endAccess();
    v4 = *(_QWORD *)(v1 + 24);
    v5 = __OFADD__(v4, 1);
    v6 = v4 + 1;
    if (v5)
      __break(1u);
    else
      *(_QWORD *)(v1 + 24) = v6;
  }
  else
  {
    sub_24651D434();
    swift_allocError();
    *v7 = 3;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24651C3D0(uint64_t a1)
{
  char **v1;
  uint64_t v2;
  char *v3;
  int64_t v4;
  int64_t v5;
  char *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  char *v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *((_QWORD *)*v1 + 2);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= *((_QWORD *)v3 + 3) >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_24651C634(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = *((_QWORD *)v3 + 2);
  if ((*((_QWORD *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = &v3[4 * v8 + 32];
  if (a1 + 32 < (unint64_t)&v9[4 * v2] && (unint64_t)v9 < a1 + 32 + 4 * v2)
    goto LABEL_24;
  memcpy(v9, (const void *)(a1 + 32), 4 * v2);
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v11 = *((_QWORD *)v3 + 2);
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    *((_QWORD *)v3 + 2) = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_246529EA0();
  __break(1u);
  return result;
}

uint64_t sub_24651C514()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for InputMatrix(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for InputMatrix);
}

BOOL sub_24651C544(uint64_t *a1, uint64_t *a2)
{
  return sub_24651C1A8(*a1, *a2);
}

id sub_24651C550()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = (void *)sub_246529CD8();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initWithDictionary_error_, v1, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_246529BD0();

    swift_willThrow();
  }
  return v2;
}

char *sub_24651C634(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25758A1A0);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 29;
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
      v13 = v10 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v13 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32])
          memmove(v13, a4 + 32, 4 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_24651E638(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24651C740(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758A1F8);
  result = sub_246529E88();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v31 = -1 << v10;
    v32 = v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v20 = v19 | (v8 << 6);
      }
      else
      {
        v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33)
          goto LABEL_33;
        v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          v8 = v21 + 1;
          if (v21 + 1 >= v33)
            goto LABEL_33;
          v22 = v9[v8];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if ((a2 & 1) != 0)
              {
                if (v32 >= 64)
                  bzero((void *)(v5 + 64), 8 * v33);
                else
                  *v9 = v31;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                v8 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v8 >= v33)
                  goto LABEL_33;
                v22 = v9[v8];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v8 = v23;
          }
        }
LABEL_30:
        v12 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      v28 = 8 * v20;
      v29 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v28);
      v30 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v28);
      if ((a2 & 1) == 0)
        swift_retain();
      result = sub_246529F9C();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v26 = v16 == v25;
          if (v16 == v25)
            v16 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = 8 * v17;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v18) = v29;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_24651C9F4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
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
  int v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758A200);
  v37 = a2;
  v6 = sub_246529E88();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v2;
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
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
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_DWORD *)(*(_QWORD *)(v5 + 56) + 4 * v21);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_246529FA8();
    sub_246529D08();
    result = sub_246529FC0();
    v15 = -1 << *(_BYTE *)(v7 + 32);
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
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_DWORD *)(*(_QWORD *)(v7 + 56) + 4 * v18) = v33;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_24651CCF8(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v8 = *v3;
  v10 = sub_24652999C(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_24651CF84();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      result = swift_release();
      *(_QWORD *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v19 = 8 * v10;
    *(_QWORD *)(v16[6] + v19) = a2;
    *(_QWORD *)(v16[7] + v19) = a1;
    v20 = v16[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_24651C740(result, a3 & 1);
  result = sub_24652999C(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_246529F60();
  __break(1u);
  return result;
}

uint64_t sub_24651CE30(uint64_t a1, uint64_t a2, char a3, float a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v10 = *v4;
  v12 = sub_2465299CC(a1, a2);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_24651D124();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(float *)(v18[7] + 4 * v12) = a4;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v20 = (uint64_t *)(v18[6] + 16 * v12);
    *v20 = a1;
    v20[1] = a2;
    *(float *)(v18[7] + 4 * v12) = a4;
    v21 = v18[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_24651C9F4(result, a3 & 1);
  result = sub_2465299CC(a1, a2);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_246529F60();
  __break(1u);
  return result;
}

void *sub_24651CF84()
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
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758A1F8);
  v2 = *v0;
  v3 = sub_246529E7C();
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = (void *)swift_retain();
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24651D124()
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
  uint64_t v19;
  int v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758A200);
  v2 = *v0;
  v3 = sub_246529E7C();
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
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
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 4 * v15;
    v20 = *(_DWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_DWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24651D2D0(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (_QWORD *)sub_24651E058(v2);
  v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  result = sub_24651D478(v5);
  *a1 = v2;
  return result;
}

_QWORD *sub_24651D338(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758A1B8);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_24651E06C((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_24651E724();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_24651D434()
{
  unint64_t result;

  result = qword_25758A158;
  if (!qword_25758A158)
  {
    result = MEMORY[0x24955D710](&unk_24652A894, &type metadata for BiomeSQLRowAggregatorError);
    atomic_store(result, (unint64_t *)&qword_25758A158);
  }
  return result;
}

uint64_t sub_24651D478(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  char v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  BOOL v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  unint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t i;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  unint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *__dst;

  v3 = a1[1];
  result = sub_246529F30();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_136;
    if ((unint64_t)v3 >= 2)
    {
      v85 = 0;
      v86 = *a1;
      for (i = 1; i != v3; ++i)
      {
        v88 = *(_QWORD *)(v86 + 16 * i);
        v89 = v85;
        do
        {
          if (v88 >= *(_QWORD *)(v86 + v89))
            break;
          if (!v86)
            goto LABEL_140;
          v90 = (_QWORD *)(v86 + v89);
          v91 = *(_QWORD *)(v86 + v89 + 24);
          *(_OWORD *)(v86 + v89 + 16) = *(_OWORD *)(v86 + v89);
          *v90 = v88;
          v90[1] = v91;
          v89 -= 16;
        }
        while (v89 != -16);
        v85 += 16;
      }
    }
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_145;
  v6 = result;
  v101 = a1;
  if (v3 < 2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v12 = (char *)MEMORY[0x24BEE4AF8];
LABEL_102:
      v92 = v12;
      v103 = v9;
      if (v13 >= 2)
      {
        v93 = *v101;
        do
        {
          v94 = v13 - 2;
          if (v13 < 2)
            goto LABEL_131;
          if (!v93)
            goto LABEL_144;
          v95 = v92;
          v96 = *(_QWORD *)&v92[16 * v94 + 32];
          v97 = *(_QWORD *)&v92[16 * v13 + 24];
          sub_24651DB48((char *)(v93 + 16 * v96), (char *)(v93 + 16 * *(_QWORD *)&v92[16 * v13 + 16]), v93 + 16 * v97, __dst);
          if (v1)
            break;
          if (v97 < v96)
            goto LABEL_132;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v95 = sub_24651DF60((uint64_t)v95);
          if (v94 >= *((_QWORD *)v95 + 2))
            goto LABEL_133;
          v98 = &v95[16 * v94 + 32];
          *(_QWORD *)v98 = v96;
          *((_QWORD *)v98 + 1) = v97;
          v99 = *((_QWORD *)v95 + 2);
          if (v13 > v99)
            goto LABEL_134;
          memmove(&v95[16 * v13 + 16], &v95[16 * v13 + 32], 16 * (v99 - v13));
          v92 = v95;
          *((_QWORD *)v95 + 2) = v99 - 1;
          v13 = v99 - 1;
        }
        while (v99 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v103 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v103 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25758A1A8);
    v8 = sub_246529D68();
    *(_QWORD *)(v8 + 16) = v7;
    v103 = v8;
    __dst = (char *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v102 = *a1 + 32;
  v100 = *a1 - 16;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v104 = v6;
  v105 = v3;
  v106 = v11;
  while (1)
  {
    v14 = v10++;
    if (v10 < v3)
    {
      v15 = *(_QWORD *)(v11 + 16 * v10);
      v16 = 16 * v14;
      v17 = *(_QWORD *)(v11 + 16 * v14);
      v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        v18 = (uint64_t *)(v102 + 16 * v14);
        v19 = v15;
        while (1)
        {
          v21 = *v18;
          v18 += 2;
          v20 = v21;
          if (v15 < v17 == v21 >= v19)
            break;
          ++v10;
          v19 = v20;
          if (v3 == v10)
          {
            v10 = v3;
            break;
          }
        }
      }
      if (v15 < v17)
      {
        if (v10 < v14)
          goto LABEL_137;
        if (v14 < v10)
        {
          v22 = 16 * v10;
          v23 = v10;
          v24 = v14;
          do
          {
            if (v24 != --v23)
            {
              if (!v11)
                goto LABEL_143;
              v25 = v11 + v22;
              v26 = *(_QWORD *)(v11 + v16);
              v27 = *(_QWORD *)(v11 + v16 + 8);
              *(_OWORD *)(v11 + v16) = *(_OWORD *)(v11 + v22 - 16);
              *(_QWORD *)(v25 - 16) = v26;
              *(_QWORD *)(v25 - 8) = v27;
            }
            ++v24;
            v22 -= 16;
            v16 += 16;
          }
          while (v24 < v23);
        }
      }
    }
    if (v10 >= v3)
      goto LABEL_46;
    if (__OFSUB__(v10, v14))
      goto LABEL_135;
    if (v10 - v14 >= v6)
      goto LABEL_46;
    v28 = v14 + v6;
    if (__OFADD__(v14, v6))
      goto LABEL_138;
    if (v28 >= v3)
      v28 = v3;
    if (v28 < v14)
      break;
    if (v10 != v28)
    {
      v29 = v100 + 16 * v10;
      do
      {
        v30 = *(_QWORD *)(v11 + 16 * v10);
        v31 = v14;
        v32 = v29;
        do
        {
          if (v30 >= *(_QWORD *)v32)
            break;
          if (!v11)
            goto LABEL_141;
          v33 = *(_QWORD *)(v32 + 24);
          *(_OWORD *)(v32 + 16) = *(_OWORD *)v32;
          *(_QWORD *)v32 = v30;
          *(_QWORD *)(v32 + 8) = v33;
          v32 -= 16;
          ++v31;
        }
        while (v10 != v31);
        ++v10;
        v29 += 16;
      }
      while (v10 != v28);
      v10 = v28;
    }
LABEL_46:
    if (v10 < v14)
      goto LABEL_130;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_24651DDC0(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v35 = *((_QWORD *)v12 + 2);
    v34 = *((_QWORD *)v12 + 3);
    v13 = v35 + 1;
    v11 = v106;
    if (v35 >= v34 >> 1)
    {
      v84 = sub_24651DDC0((char *)(v34 > 1), v35 + 1, 1, v12);
      v11 = v106;
      v12 = v84;
    }
    *((_QWORD *)v12 + 2) = v13;
    v36 = v12 + 32;
    v37 = &v12[16 * v35 + 32];
    *(_QWORD *)v37 = v14;
    *((_QWORD *)v37 + 1) = v10;
    if (v35)
    {
      while (1)
      {
        v38 = v13 - 1;
        if (v13 >= 4)
        {
          v43 = &v36[16 * v13];
          v44 = *((_QWORD *)v43 - 8);
          v45 = *((_QWORD *)v43 - 7);
          v49 = __OFSUB__(v45, v44);
          v46 = v45 - v44;
          if (v49)
            goto LABEL_119;
          v48 = *((_QWORD *)v43 - 6);
          v47 = *((_QWORD *)v43 - 5);
          v49 = __OFSUB__(v47, v48);
          v41 = v47 - v48;
          v42 = v49;
          if (v49)
            goto LABEL_120;
          v50 = v13 - 2;
          v51 = &v36[16 * v13 - 32];
          v53 = *(_QWORD *)v51;
          v52 = *((_QWORD *)v51 + 1);
          v49 = __OFSUB__(v52, v53);
          v54 = v52 - v53;
          if (v49)
            goto LABEL_122;
          v49 = __OFADD__(v41, v54);
          v55 = v41 + v54;
          if (v49)
            goto LABEL_125;
          if (v55 >= v46)
          {
            v73 = &v36[16 * v38];
            v75 = *(_QWORD *)v73;
            v74 = *((_QWORD *)v73 + 1);
            v49 = __OFSUB__(v74, v75);
            v76 = v74 - v75;
            if (v49)
              goto LABEL_129;
            v66 = v41 < v76;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v67 = *((_QWORD *)v12 + 4);
            v68 = *((_QWORD *)v12 + 5);
            v49 = __OFSUB__(v68, v67);
            v60 = v68 - v67;
            v61 = v49;
            goto LABEL_77;
          }
          v40 = *((_QWORD *)v12 + 4);
          v39 = *((_QWORD *)v12 + 5);
          v49 = __OFSUB__(v39, v40);
          v41 = v39 - v40;
          v42 = v49;
        }
        if ((v42 & 1) != 0)
          goto LABEL_121;
        v50 = v13 - 2;
        v56 = &v36[16 * v13 - 32];
        v58 = *(_QWORD *)v56;
        v57 = *((_QWORD *)v56 + 1);
        v59 = __OFSUB__(v57, v58);
        v60 = v57 - v58;
        v61 = v59;
        if (v59)
          goto LABEL_124;
        v62 = &v36[16 * v38];
        v64 = *(_QWORD *)v62;
        v63 = *((_QWORD *)v62 + 1);
        v49 = __OFSUB__(v63, v64);
        v65 = v63 - v64;
        if (v49)
          goto LABEL_127;
        if (__OFADD__(v60, v65))
          goto LABEL_128;
        if (v60 + v65 >= v41)
        {
          v66 = v41 < v65;
LABEL_83:
          if (v66)
            v38 = v50;
          goto LABEL_85;
        }
LABEL_77:
        if ((v61 & 1) != 0)
          goto LABEL_123;
        v69 = &v36[16 * v38];
        v71 = *(_QWORD *)v69;
        v70 = *((_QWORD *)v69 + 1);
        v49 = __OFSUB__(v70, v71);
        v72 = v70 - v71;
        if (v49)
          goto LABEL_126;
        if (v72 < v60)
          goto LABEL_15;
LABEL_85:
        v77 = v38 - 1;
        if (v38 - 1 >= v13)
        {
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
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v11)
          goto LABEL_142;
        v78 = v12;
        v79 = &v36[16 * v77];
        v80 = *(_QWORD *)v79;
        v81 = &v36[16 * v38];
        v82 = *((_QWORD *)v81 + 1);
        sub_24651DB48((char *)(v11 + 16 * *(_QWORD *)v79), (char *)(v11 + 16 * *(_QWORD *)v81), v11 + 16 * v82, __dst);
        if (v1)
          goto LABEL_93;
        if (v82 < v80)
          goto LABEL_116;
        if (v38 > *((_QWORD *)v78 + 2))
          goto LABEL_117;
        *(_QWORD *)v79 = v80;
        *(_QWORD *)&v36[16 * v77 + 8] = v82;
        v83 = *((_QWORD *)v78 + 2);
        if (v38 >= v83)
          goto LABEL_118;
        v12 = v78;
        v13 = v83 - 1;
        memmove(&v36[16 * v38], v81 + 16, 16 * (v83 - 1 - v38));
        *((_QWORD *)v78 + 2) = v83 - 1;
        v11 = v106;
        if (v83 <= 2)
          goto LABEL_15;
      }
    }
    v13 = 1;
LABEL_15:
    v6 = v104;
    v3 = v105;
    if (v10 >= v105)
    {
      v9 = v103;
      goto LABEL_102;
    }
  }
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  result = sub_246529E70();
  __break(1u);
  return result;
}

uint64_t sub_24651DB48(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t result;
  char *v22;
  char *v23;
  char *v24;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 15;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 15;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 4;
  v24 = __src;
  v23 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst)
        memmove(__dst, a2, 16 * v13);
      v16 = &v4[16 * v13];
      v22 = v16;
      v24 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        v17 = (char *)(a3 - 16);
        v18 = v6;
        while (1)
        {
          v19 = v17 + 16;
          v20 = *((_QWORD *)v18 - 2);
          v18 -= 16;
          if (*((_QWORD *)v16 - 2) >= v20)
          {
            v22 = v16 - 16;
            if (v19 < v16 || v17 >= v16 || v19 != v16)
              *(_OWORD *)v17 = *((_OWORD *)v16 - 1);
            v18 = v6;
            v16 -= 16;
            if (v6 <= v7)
              goto LABEL_42;
          }
          else
          {
            if (v19 != v6 || v17 >= v6)
              *(_OWORD *)v17 = *(_OWORD *)v18;
            v24 = v18;
            if (v18 <= v7)
              goto LABEL_42;
          }
          v17 -= 16;
          v6 = v18;
          if (v16 <= v4)
            goto LABEL_42;
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst)
      memmove(__dst, __src, 16 * v10);
    v14 = &v4[16 * v10];
    v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        if (*(_QWORD *)v6 >= *(_QWORD *)v4)
        {
          if (v7 != v4)
            *(_OWORD *)v7 = *(_OWORD *)v4;
          v4 += 16;
          v23 = v4;
          v15 = v6;
        }
        else
        {
          v15 = v6 + 16;
          if (v7 < v6 || v7 >= v15 || v7 != v6)
            *(_OWORD *)v7 = *(_OWORD *)v6;
        }
        v7 += 16;
        if (v4 >= v14)
          break;
        v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      v24 = v7;
    }
LABEL_42:
    sub_24651DEB8((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  result = sub_246529EA0();
  __break(1u);
  return result;
}

char *sub_24651DDC0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25758A1B0);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_24651DEB8(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 15;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -16)
  {
    result = (char *)sub_246529EA0();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
      return (char *)memmove(result, v3, 16 * v7);
  }
  return result;
}

char *sub_24651DF60(uint64_t a1)
{
  return sub_24651DDC0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_24651DF74(uint64_t a1)
{
  return sub_24651C634(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24955D6F8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24651DFC8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24651E000(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758A198);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_24651E048(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24651E058(_QWORD *a1)
{
  return sub_246526A70(0, a1[2], 0, a1);
}

uint64_t sub_24651E06C(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  uint64_t v20;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
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
    v20 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v16);
    *v11 = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * v16);
    v11[1] = v20;
    if (v13 == v10)
    {
      swift_retain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_retain();
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

unint64_t sub_24651E26C(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  char v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v1 = a1[2];
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758A1F8);
  v3 = (_QWORD *)sub_246529E94();
  v5 = a1[4];
  v4 = a1[5];
  result = sub_24652999C(v5);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
    return (unint64_t)v3;
  }
  v8 = a1 + 7;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v3[6] + v9) = v5;
    *(_QWORD *)(v3[7] + v9) = v4;
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      break;
    v3[2] = v12;
    if (!--v1)
      goto LABEL_8;
    v13 = v8 + 2;
    v5 = *(v8 - 1);
    v14 = *v8;
    swift_retain();
    result = sub_24652999C(v5);
    v8 = v13;
    v4 = v14;
    if ((v15 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

unint64_t sub_24651E368(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  float v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  char v11;
  uint64_t v12;
  float v13;
  float v14;
  unsigned __int8 v15;
  _BYTE v17[12];
  float v18;
  _QWORD v19[3];
  uint64_t v20;
  __int128 v21[2];
  _BYTE v22[32];

  sub_24651E76C(a1, (uint64_t)v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758A1C8);
  if (swift_dynamicCast())
  {
    sub_24651E7A8(v21, (uint64_t)v19);
    v1 = v20;
    v2 = __swift_project_boxed_opaque_existential_1(v19, v20);
    v3 = *(_QWORD *)(v1 - 8);
    MEMORY[0x24BDAC7A8](v2);
    v5 = &v17[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(_BYTE *))(v3 + 16))(v5);
    if (sub_246529E28() < 65)
    {
      v11 = sub_246529E34();
      v12 = sub_246529E1C();
      (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v1);
      if ((v11 & 1) != 0)
        v6 = (float)v12;
      else
        v6 = (float)(unint64_t)v12;
    }
    else
    {
      sub_24651E7E4();
      sub_24651E848();
      sub_246529CCC();
      (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v1);
      v6 = v18;
    }
    v10 = v6;
    goto LABEL_12;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758A1D0);
  if (swift_dynamicCast())
  {
    sub_24651E7A8(v21, (uint64_t)v19);
    v7 = __swift_project_boxed_opaque_existential_1(v19, v20);
    MEMORY[0x24BDAC7A8](v7);
    (*(void (**)(_BYTE *))(v9 + 16))(&v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)]);
    sub_24651E7E4();
    sub_246529CC0();
    v10 = v18;
LABEL_12:
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v19);
    v15 = 0;
    goto LABEL_13;
  }
  sub_24651DFC8(0, &qword_25758A168);
  if (swift_dynamicCast())
  {
    sub_246529D8C();
    v14 = v13;

    v15 = 0;
    v10 = v14;
  }
  else
  {
    v10 = 0.0;
    v15 = 1;
  }
LABEL_13:
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v22);
  LOBYTE(v21[0]) = v15;
  return LODWORD(v10) | ((unint64_t)v15 << 32);
}

char *sub_24651E638(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 4 * a1 + 32);
    v6 = 4 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_246529EA0();
  __break(1u);
  return result;
}

uint64_t sub_24651E724()
{
  return swift_release();
}

uint64_t sub_24651E72C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758A1C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24651E76C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24651E7A8(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24651E7E4()
{
  unint64_t result;

  result = qword_25758A1D8;
  if (!qword_25758A1D8)
  {
    result = MEMORY[0x24955D710](MEMORY[0x24BEE14F0], MEMORY[0x24BEE14E8]);
    atomic_store(result, (unint64_t *)&qword_25758A1D8);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_24651E848()
{
  unint64_t result;

  result = qword_25758A1E0;
  if (!qword_25758A1E0)
  {
    result = MEMORY[0x24955D710](MEMORY[0x24BEE4540], MEMORY[0x24BEE44F0]);
    atomic_store(result, (unint64_t *)&qword_25758A1E0);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24955D6C8](a1, v6, a5);
}

uint64_t sub_24651E8B8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_24651E8F4 + 4 * byte_24652AAC0[a1]))(0x676E696E7261654CLL, 0xEC00000065746152);
}

unint64_t sub_24651E8F4()
{
  return 0xD000000000000012;
}

uint64_t sub_24651EA54(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_24651EA90 + 4 * byte_24652AACD[a1]))(0x676E696E7261654CLL, 0xEC00000065746152);
}

unint64_t sub_24651EA90()
{
  return 0xD000000000000012;
}

uint64_t sub_24651EBF0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_24651E8B8(*a1);
  v5 = v4;
  if (v3 == sub_24651E8B8(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_246529F48();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24651EC78()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_246529FA8();
  sub_24651E8B8(v1);
  sub_246529D08();
  swift_bridgeObjectRelease();
  return sub_246529FC0();
}

uint64_t sub_24651ECD8()
{
  unsigned __int8 *v0;

  sub_24651E8B8(*v0);
  sub_246529D08();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24651ED18()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_246529FA8();
  sub_24651E8B8(v1);
  sub_246529D08();
  swift_bridgeObjectRelease();
  return sub_246529FC0();
}

uint64_t sub_24651ED74@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24651F20C();
  *a1 = result;
  return result;
}

uint64_t sub_24651EDA0@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_24651E8B8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_24651EDC8()
{
  unsigned __int8 *v0;

  return sub_24651EA54(*v0);
}

uint64_t sub_24651EDD0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24651F20C();
  *a1 = result;
  return result;
}

uint64_t sub_24651EDF4()
{
  return 0;
}

void sub_24651EE00(_BYTE *a1@<X8>)
{
  *a1 = 13;
}

uint64_t sub_24651EE0C()
{
  sub_246520508();
  return sub_246529FE4();
}

uint64_t sub_24651EE34()
{
  sub_246520508();
  return sub_246529FF0();
}

uint64_t sub_24651EE5C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  uint64_t v11;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758A250);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246520508();
  sub_246529FD8();
  LOBYTE(v11) = 0;
  sub_246529F00();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    sub_246529F24();
    LOBYTE(v11) = 2;
    sub_246529EF4();
    LOBYTE(v11) = 3;
    sub_246529EF4();
    v11 = *(_QWORD *)(v3 + 40);
    HIBYTE(v10) = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25758A228);
    sub_2465206EC(&qword_25758A258, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_246529F18();
    LOBYTE(v11) = 5;
    sub_246529F24();
    LOBYTE(v11) = 6;
    sub_246529EF4();
    LOBYTE(v11) = 7;
    sub_246529EF4();
    LOBYTE(v11) = 8;
    sub_246529F0C();
    LOBYTE(v11) = 9;
    sub_246529F0C();
    LOBYTE(v11) = 10;
    sub_246529EF4();
    v11 = *(_QWORD *)(v3 + 120);
    HIBYTE(v10) = 11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25758A238);
    sub_24652074C(&qword_25758A260, (uint64_t (*)(void))sub_2465207B4, MEMORY[0x24BEE12A0]);
    sub_246529F18();
    LOBYTE(v11) = 12;
    sub_246529EF4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

__n128 sub_24651F1A0@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[9];

  sub_24651FCF4(a1, v8);
  if (!v2)
  {
    v5 = v8[7];
    *(_OWORD *)(a2 + 96) = v8[6];
    *(_OWORD *)(a2 + 112) = v5;
    *(_OWORD *)(a2 + 128) = v8[8];
    v6 = v8[3];
    *(_OWORD *)(a2 + 32) = v8[2];
    *(_OWORD *)(a2 + 48) = v6;
    v7 = v8[5];
    *(_OWORD *)(a2 + 64) = v8[4];
    *(_OWORD *)(a2 + 80) = v7;
    result = (__n128)v8[1];
    *(_OWORD *)a2 = v8[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_24651F1F8(_QWORD *a1)
{
  return sub_24651EE5C(a1);
}

uint64_t sub_24651F20C()
{
  unint64_t v0;

  v0 = sub_246529EAC();
  swift_bridgeObjectRelease();
  if (v0 >= 0xD)
    return 13;
  else
    return v0;
}

void sub_24651F254(uint64_t a1@<X8>)
{
  void *v1;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD *v18;
  id v19;
  void *v20;
  _BYTE *v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  id v44[5];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_self();
  sub_246529C84();
  v4 = (void *)sub_246529CD8();
  swift_bridgeObjectRelease();
  v44[0] = 0;
  v5 = objc_msgSend(v3, sel_dataWithJSONObject_options_error_, v4, 0, v44);

  v6 = v44[0];
  if (!v5)
  {
    v11 = v6;
    v10 = (void *)sub_246529BD0();

    swift_willThrow();
    goto LABEL_5;
  }
  v7 = sub_246529C18();
  v9 = v8;

  sub_246529BC4();
  swift_allocObject();
  sub_246529BB8();
  sub_24651F828();
  sub_246529BAC();
  if (v1)
  {
    sub_24651F86C(v7, v9);
    swift_release();
    v10 = v1;
LABEL_5:
    if (qword_257589EA0 != -1)
      swift_once();
    v12 = sub_246529CB4();
    __swift_project_value_buffer(v12, (uint64_t)qword_25758BF70);
    v13 = v10;
    v14 = v10;
    v15 = sub_246529C9C();
    v16 = sub_246529DEC();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v17 = 138412290;
      v19 = v10;
      v20 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v44[0] = v20;
      sub_246529E04();
      *v18 = v20;

      _os_log_impl(&dword_246518000, v15, v16, "Couldn't form SiriMASPFLPluginArgs: %@", v17, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25758A170);
      swift_arrayDestroy();
      MEMORY[0x24955D794](v18, -1, -1);
      MEMORY[0x24955D794](v17, -1, -1);
    }
    else
    {

    }
    sub_24651F7E4();
    swift_allocError();
    *v21 = 0;
    swift_willThrow();
    swift_release();

    return;
  }
  sub_24651F86C(v7, v9);
  swift_release();
  v22 = v44[0];
  v23 = v47;
  v43 = v51;
  v41 = v54;
  v42 = v50;
  if (*(_QWORD *)(v45 + 16) == v46)
  {
    v39 = v52;
    v40 = v55;
    v24 = v44[4];
    v36 = v48;
    v37 = v53;
    v25 = v45;
    v38 = v56;
    v35 = v49;
    v26 = v44[2];
    v27 = v44[1];
    v28 = v44[3];
    v34 = v46;
    swift_release();
    *(_QWORD *)a1 = v22;
    *(_QWORD *)(a1 + 8) = v27;
    *(_QWORD *)(a1 + 16) = v26;
    *(_QWORD *)(a1 + 24) = v28;
    *(_QWORD *)(a1 + 32) = v24;
    *(_QWORD *)(a1 + 40) = v25;
    *(_QWORD *)(a1 + 48) = v34;
    *(_QWORD *)(a1 + 56) = v23;
    *(_QWORD *)(a1 + 64) = v36;
    *(_QWORD *)(a1 + 72) = v35;
    *(_QWORD *)(a1 + 80) = v42;
    *(_OWORD *)(a1 + 88) = v43;
    *(_QWORD *)(a1 + 104) = v39;
    *(_QWORD *)(a1 + 112) = v37;
    *(_QWORD *)(a1 + 120) = v41;
    *(_QWORD *)(a1 + 128) = v40;
    *(_QWORD *)(a1 + 136) = v38;
  }
  else
  {
    if (qword_257589EA0 != -1)
      swift_once();
    v29 = sub_246529CB4();
    __swift_project_value_buffer(v29, (uint64_t)qword_25758BF70);
    v30 = sub_246529C9C();
    v31 = sub_246529DEC();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = swift_slowAlloc();
      *(_DWORD *)v32 = 134218240;
      sub_246529E04();
      *(_WORD *)(v32 + 12) = 1024;
      sub_246529E04();
      _os_log_impl(&dword_246518000, v30, v31, "Size of featureNames (%ld is not equal to featureCount (%u", (uint8_t *)v32, 0x12u);
      MEMORY[0x24955D794](v32, -1, -1);
    }

    sub_24651F7E4();
    swift_allocError();
    *v33 = 1;
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
}

unint64_t sub_24651F7E4()
{
  unint64_t result;

  result = qword_25758A208;
  if (!qword_25758A208)
  {
    result = MEMORY[0x24955D710](&unk_24652A7D4, &type metadata for SiriMASPFLPluginArgsError);
    atomic_store(result, (unint64_t *)&qword_25758A208);
  }
  return result;
}

unint64_t sub_24651F828()
{
  unint64_t result;

  result = qword_25758A210;
  if (!qword_25758A210)
  {
    result = MEMORY[0x24955D710](&unk_24652AB30, &type metadata for SiriMASPFLPluginArgs);
    atomic_store(result, (unint64_t *)&qword_25758A210);
  }
  return result;
}

uint64_t sub_24651F86C(uint64_t a1, unint64_t a2)
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

uint64_t initializeBufferWithCopyOfBuffer for ModelEvaluationMetricSpecs(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SiriMASPFLPluginArgs()
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

uint64_t initializeWithCopy for SiriMASPFLPluginArgs(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  v5 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v5;
  v6 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  v7 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v7;
  v8 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v8;
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
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

uint64_t assignWithCopy for SiriMASPFLPluginArgs(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
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
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy144_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  result = *(__n128 *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(__n128 *)(a1 + 80) = result;
  *(_OWORD *)(a1 + 96) = v6;
  return result;
}

uint64_t assignWithTake for SiriMASPFLPluginArgs(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  v5 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriMASPFLPluginArgs(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 144))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriMASPFLPluginArgs(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 144) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 144) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriMASPFLPluginArgs()
{
  return &type metadata for SiriMASPFLPluginArgs;
}

uint64_t sub_24651FCF4@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[6];
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758A218);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v57 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_246520508();
  sub_246529FCC();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v57);
  LOBYTE(v67[0]) = 0;
  sub_246529EC4();
  v11 = v10;
  LOBYTE(v67[0]) = 1;
  v12 = sub_246529EE8();
  LOBYTE(v67[0]) = 2;
  v53 = sub_246529EB8();
  LOBYTE(v67[0]) = 3;
  v14 = v13;
  swift_bridgeObjectRetain();
  v15 = sub_246529EB8();
  v56 = v14;
  v52 = v15;
  v17 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758A228);
  LOBYTE(v58) = 4;
  sub_2465206EC(&qword_25758A230, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
  swift_bridgeObjectRetain();
  sub_246529EDC();
  v55 = v17;
  v18 = v67[0];
  LOBYTE(v67[0]) = 5;
  v19 = v18;
  swift_bridgeObjectRetain();
  v50 = sub_246529EE8();
  v51 = v19;
  LOBYTE(v67[0]) = 6;
  v49 = sub_246529EB8();
  LOBYTE(v67[0]) = 7;
  v21 = v20;
  swift_bridgeObjectRetain();
  v22 = sub_246529EB8();
  v54 = v21;
  v47 = v22;
  v48 = v12;
  LOBYTE(v67[0]) = 8;
  v24 = v23;
  swift_bridgeObjectRetain();
  v46 = sub_246529ED0();
  v25 = v24;
  LOBYTE(v67[0]) = 9;
  v45 = sub_246529ED0();
  LOBYTE(v67[0]) = 10;
  v44 = sub_246529EB8();
  v27 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758A238);
  LOBYTE(v58) = 11;
  sub_24652074C(&qword_25758A240, (uint64_t (*)(void))sub_246520590, MEMORY[0x24BEE12D0]);
  swift_bridgeObjectRetain();
  sub_246529EDC();
  v80 = 12;
  v43 = v67[0];
  swift_bridgeObjectRetain();
  v28 = sub_246529EB8();
  v42 = v29;
  v30 = v28;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *(_QWORD *)&v58 = __PAIR64__(v48, v11);
  *((_QWORD *)&v58 + 1) = v53;
  *(_QWORD *)&v59 = v56;
  *((_QWORD *)&v59 + 1) = v52;
  *(_QWORD *)&v60 = v55;
  *((_QWORD *)&v60 + 1) = v51;
  LODWORD(v61) = v50;
  *((_QWORD *)&v61 + 1) = v49;
  *(_QWORD *)&v62 = v54;
  *((_QWORD *)&v62 + 1) = v47;
  *(_QWORD *)&v63 = v25;
  v41 = v25;
  *((_QWORD *)&v63 + 1) = v46;
  *(_QWORD *)&v64 = v45;
  v31 = v43;
  *((_QWORD *)&v64 + 1) = v44;
  *(_QWORD *)&v65 = v27;
  *((_QWORD *)&v65 + 1) = v43;
  *(_QWORD *)&v66 = v30;
  *((_QWORD *)&v66 + 1) = v42;
  sub_2465205D4((uint64_t)&v58);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v32 = v51;
  swift_bridgeObjectRelease();
  v33 = v54;
  swift_bridgeObjectRelease();
  v34 = v41;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v57);
  v67[0] = __PAIR64__(v48, v11);
  v67[1] = v53;
  v67[2] = v56;
  v67[3] = v52;
  v67[4] = v55;
  v67[5] = v32;
  v68 = v50;
  v69 = v49;
  v70 = v33;
  v71 = v47;
  v72 = v34;
  v73 = v46;
  v74 = v45;
  v75 = v44;
  v76 = v27;
  v77 = v31;
  v78 = v30;
  v79 = v42;
  result = sub_246520660((uint64_t)v67);
  v36 = v65;
  a2[6] = v64;
  a2[7] = v36;
  a2[8] = v66;
  v37 = v61;
  a2[2] = v60;
  a2[3] = v37;
  v38 = v63;
  a2[4] = v62;
  a2[5] = v38;
  v39 = v59;
  *a2 = v58;
  a2[1] = v39;
  return result;
}

unint64_t sub_246520508()
{
  unint64_t result;

  result = qword_25758A220;
  if (!qword_25758A220)
  {
    result = MEMORY[0x24955D710](&unk_24652AC54, &type metadata for SiriMASPFLPluginArgs.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25758A220);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24955D704](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_246520590()
{
  unint64_t result;

  result = qword_25758A248;
  if (!qword_25758A248)
  {
    result = MEMORY[0x24955D710](&unk_24652ADE4, &type metadata for ModelEvaluationMetricSpecs);
    atomic_store(result, (unint64_t *)&qword_25758A248);
  }
  return result;
}

uint64_t sub_2465205D4(uint64_t a1)
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

uint64_t sub_246520660(uint64_t a1)
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

uint64_t sub_2465206EC(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25758A228);
    v8 = a2;
    result = MEMORY[0x24955D710](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24652074C(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25758A238);
    v8 = a2();
    result = MEMORY[0x24955D710](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2465207B4()
{
  unint64_t result;

  result = qword_25758A268;
  if (!qword_25758A268)
  {
    result = MEMORY[0x24955D710](&unk_24652ADBC, &type metadata for ModelEvaluationMetricSpecs);
    atomic_store(result, (unint64_t *)&qword_25758A268);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SiriMASPFLPluginArgs.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF4)
    goto LABEL_17;
  if (a2 + 12 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 12) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 12;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 12;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 12;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xD;
  v8 = v6 - 13;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriMASPFLPluginArgs.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 12 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 12) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF3)
    return ((uint64_t (*)(void))((char *)&loc_2465208D4 + 4 * byte_24652AADF[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_246520908 + 4 * byte_24652AADA[v4]))();
}

uint64_t sub_246520908(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246520910(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246520918);
  return result;
}

uint64_t sub_246520924(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24652092CLL);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_246520930(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246520938(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriMASPFLPluginArgs.CodingKeys()
{
  return &type metadata for SiriMASPFLPluginArgs.CodingKeys;
}

unint64_t sub_246520958()
{
  unint64_t result;

  result = qword_25758A270;
  if (!qword_25758A270)
  {
    result = MEMORY[0x24955D710](&unk_24652AC2C, &type metadata for SiriMASPFLPluginArgs.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25758A270);
  }
  return result;
}

unint64_t sub_2465209A0()
{
  unint64_t result;

  result = qword_25758A278;
  if (!qword_25758A278)
  {
    result = MEMORY[0x24955D710](&unk_24652AB64, &type metadata for SiriMASPFLPluginArgs.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25758A278);
  }
  return result;
}

unint64_t sub_2465209E8()
{
  unint64_t result;

  result = qword_25758A280[0];
  if (!qword_25758A280[0])
  {
    result = MEMORY[0x24955D710](&unk_24652AB8C, &type metadata for SiriMASPFLPluginArgs.CodingKeys);
    atomic_store(result, qword_25758A280);
  }
  return result;
}

uint64_t SiriMASPFLPluginRunner.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SiriMASPFLPluginRunner.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_246520A44(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 328) = a1;
  return swift_task_switch();
}

unint64_t sub_246520A5C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t result;
  int64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  _OWORD *v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  uint64_t *v24;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  _OWORD v40[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25758A190);
    v2 = (_QWORD *)sub_246529E94();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v32 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v31 = (unint64_t)(63 - v3) >> 6;
  v6 = &v37;
  v7 = &v39;
  result = swift_bridgeObjectRetain();
  i = 0;
  v10 = MEMORY[0x24BEE4AD8] + 8;
  v11 = MEMORY[0x24BEE14E8];
  if (v5)
    goto LABEL_10;
LABEL_11:
  v20 = i + 1;
  if (__OFADD__(i, 1))
    goto LABEL_35;
  if (v20 >= v31)
    goto LABEL_32;
  v21 = *(_QWORD *)(v32 + 8 * v20);
  v22 = i + 1;
  if (!v21)
  {
    v22 = i + 2;
    if (i + 2 >= v31)
      goto LABEL_32;
    v21 = *(_QWORD *)(v32 + 8 * v22);
    if (!v21)
    {
      v22 = i + 3;
      if (i + 3 >= v31)
        goto LABEL_32;
      v21 = *(_QWORD *)(v32 + 8 * v22);
      if (!v21)
      {
        v22 = i + 4;
        if (i + 4 >= v31)
          goto LABEL_32;
        v21 = *(_QWORD *)(v32 + 8 * v22);
        if (!v21)
        {
          v23 = i + 5;
          if (i + 5 < v31)
          {
            v21 = *(_QWORD *)(v32 + 8 * v23);
            if (v21)
            {
              v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v22 = v23 + 1;
              if (__OFADD__(v23, 1))
                goto LABEL_36;
              if (v22 >= v31)
                break;
              v21 = *(_QWORD *)(v32 + 8 * v22);
              ++v23;
              if (v21)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_24651E724();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  v34 = (v21 - 1) & v21;
  v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    v24 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v19);
    v35 = *v24;
    v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_24651E048(v6, v7);
    sub_24651E048(v7, v40);
    sub_24651E048(v40, &v38);
    result = sub_2465299CC(v35, v36);
    v25 = result;
    if ((v26 & 1) != 0)
    {
      v33 = i;
      v12 = v7;
      v13 = v6;
      v14 = v1;
      v15 = v11;
      v16 = v10;
      v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v17 = v35;
      v17[1] = v36;
      v10 = v16;
      v11 = v15;
      v1 = v14;
      v6 = v13;
      v7 = v12;
      i = v33;
      v18 = (_OWORD *)(v2[7] + 32 * v25);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v18);
      result = (unint64_t)sub_24651E048(&v38, v18);
      v5 = v34;
      if (!v34)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v27 = (uint64_t *)(v2[6] + 16 * result);
    *v27 = v35;
    v27[1] = v36;
    result = (unint64_t)sub_24651E048(&v38, (_OWORD *)(v2[7] + 32 * result));
    v28 = v2[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
      goto LABEL_34;
    v2[2] = v30;
    v5 = v34;
    if (!v34)
      goto LABEL_11;
LABEL_10:
    v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_246520DB4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_25758A298 + dword_25758A298);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_246520E0C;
  return v3();
}

uint64_t sub_246520E0C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

id sub_246520E5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  void *v14;
  id v15;

  v10 = sub_246529C30();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  v13 = 0;
  if (v12(a1, 1, v10) != 1)
  {
    v13 = (void *)sub_246529C24();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  }
  if (v12(a2, 1, v10) == 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = (void *)sub_246529C24();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a2, v10);
  }
  v15 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithStartDate_endDate_maxEvents_lastN_reversed_, v13, v14, a3, a4, a5 & 1);

  return v15;
}

void sub_246520F70(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t SiriMASPFLPluginRunner.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SiriMASPFLPluginRunner.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_246520FD8()
{
  return sub_246529C54();
}

uint64_t sub_246520FEC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_25758A298 + dword_25758A298);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_246522804;
  return v3();
}

uint64_t sub_246521044(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 328) = a1;
  return swift_task_switch();
}

uint64_t sub_24652105C()
{
  uint64_t v0;
  float v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  float v26[2];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;

  sub_2465211CC(v26);
  v1 = v26[1];
  v2 = v27;
  v3 = v28;
  v4 = v29;
  v5 = v30;
  v6 = v31;
  v7 = v32;
  v8 = v33;
  v9 = v34;
  v10 = v35;
  v11 = v36;
  v12 = v37;
  v13 = v38;
  v14 = v39;
  v15 = v40;
  v16 = v41;
  v17 = v42;
  v18 = v43;
  *(float *)(v0 + 16) = v26[0];
  *(float *)(v0 + 20) = v1;
  *(_QWORD *)(v0 + 24) = v2;
  *(_QWORD *)(v0 + 32) = v3;
  *(_QWORD *)(v0 + 40) = v4;
  *(_OWORD *)(v0 + 48) = v5;
  *(_DWORD *)(v0 + 64) = v6;
  *(_QWORD *)(v0 + 72) = v7;
  *(_QWORD *)(v0 + 80) = v8;
  *(_QWORD *)(v0 + 88) = v9;
  *(_QWORD *)(v0 + 96) = v10;
  *(_OWORD *)(v0 + 104) = v11;
  *(_QWORD *)(v0 + 120) = v12;
  *(_OWORD *)(v0 + 128) = v13;
  *(_QWORD *)(v0 + 144) = v14;
  *(_QWORD *)(v0 + 152) = v15;
  *(_QWORD *)(v0 + 160) = v16;
  *(_QWORD *)(v0 + 168) = v17;
  *(_QWORD *)(v0 + 176) = v18;
  v19 = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v0 + 216) = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v0 + 232) = v19;
  v20 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v0 + 184) = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v0 + 200) = v20;
  v21 = *(_OWORD *)(v0 + 144);
  v22 = *(_OWORD *)(v0 + 112);
  *(_OWORD *)(v0 + 296) = *(_OWORD *)(v0 + 128);
  *(_OWORD *)(v0 + 312) = v21;
  v23 = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v0 + 264) = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v0 + 280) = v22;
  *(_OWORD *)(v0 + 248) = v23;
  v24 = sub_246521A2C(v0 + 184, v16, v17, v18);
  swift_release();
  swift_release();
  swift_release();
  sub_246520660(v0 + 16);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v24);
}

uint64_t sub_2465211B4()
{
  return sub_246529C60();
}

void sub_2465211CC(float *a1@<X8>)
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  float v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  char *v30;
  double v31;
  id v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  _BYTE *v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  BOOL v40;
  uint64_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint8_t *v44;
  uint8_t *v45;
  float *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
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
  int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  float v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  float *v73;
  char *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  float v83[2];
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  int v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  __int128 v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;

  v73 = a1;
  v79 = sub_246529BDC();
  v77 = *(_QWORD *)(v79 - 8);
  MEMORY[0x24BDAC7A8](v79);
  v78 = (char *)&v53 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758A388);
  MEMORY[0x24BDAC7A8](v3);
  v76 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_246529C0C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v80 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v53 - v9;
  if (qword_257589EA0 != -1)
    swift_once();
  v11 = sub_246529CB4();
  v12 = __swift_project_value_buffer(v11, (uint64_t)qword_25758BF70);
  swift_retain_n();
  v75 = v12;
  v13 = sub_246529C9C();
  v14 = sub_246529DD4();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v72 = v6;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc();
    *(_QWORD *)&v71 = v5;
    v18 = v17;
    v82 = v17;
    v74 = v10;
    *(_DWORD *)v16 = 136315138;
    v19 = sub_246529C90();
    v81 = sub_2465292E0(v19, v20, &v82);
    v10 = v74;
    sub_246529E04();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246518000, v13, v14, "Initialising SiriMASPFLPluginRunner for recipe %s.", v16, 0xCu);
    swift_arrayDestroy();
    v21 = v18;
    v5 = v71;
    MEMORY[0x24955D794](v21, -1, -1);
    v22 = v16;
    v6 = v72;
    MEMORY[0x24955D794](v22, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  swift_retain();
  sub_24651F254((uint64_t)v83);
  if (!v1)
  {
    v23 = v83[0];
    v68 = v83[1];
    v66 = *((_QWORD *)&v84 + 1);
    v67 = v84;
    v64 = *((_QWORD *)&v85 + 1);
    v65 = v85;
    v24 = v86;
    v63 = v87;
    v61 = *((_QWORD *)&v88 + 1);
    v62 = v88;
    v59 = *((_QWORD *)&v89 + 1);
    v60 = v89;
    v58 = v90;
    v25 = v92;
    v57 = v91;
    v71 = v93;
    v56 = v94;
    v55 = v95;
    type metadata accessor for BiomeSQLClient();
    v26 = swift_allocObject();
    *(_QWORD *)(v26 + 16) = 0;
    *(_QWORD *)(v26 + 24) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0CCD0]), sel_init);
    v98 = v85;
    v99 = v84;
    v100 = v24;
    v96 = v88;
    v97 = v89;
    type metadata accessor for BiomeSQLRowAggregator();
    v27 = swift_allocObject();
    *(_QWORD *)(v27 + 16) = sub_24651E26C(MEMORY[0x24BEE4AF8]);
    *(_OWORD *)(v27 + 24) = v99;
    *(_OWORD *)(v27 + 40) = v98;
    *(_OWORD *)(v27 + 56) = v97;
    *(_QWORD *)(v27 + 72) = v24;
    *(_OWORD *)(v27 + 80) = v96;
    sub_2465227B4((uint64_t)&v99);
    sub_2465227B4((uint64_t)&v98);
    sub_2465227B4((uint64_t)&v97);
    sub_2465227DC((uint64_t)&v100);
    sub_2465227B4((uint64_t)&v96);
    v69 = v25;
    sub_246529C78();
    if (v28)
    {
      v54 = v24;
      v70 = v26;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v76, 1, 1, v5);
      (*(void (**)(char *, _QWORD, uint64_t))(v77 + 104))(v78, *MEMORY[0x24BDCD7A0], v79);
      sub_246529C00();
      v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFFD8]), sel_init);
      objc_msgSend(v29, sel_setComputeUnits_, 0);
      v30 = v80;
      sub_246529BF4();
      v31 = v83[0];
      type metadata accessor for ModelTrainer();
      swift_allocObject();
      v32 = v29;
      v37 = sub_246523608(v30, v32, v31);
      v74 = v10;
      v38 = sub_246529C9C();
      v39 = sub_246529DD4();
      v40 = os_log_type_enabled(v38, v39);
      v41 = v70;
      if (v40)
      {
        v42 = (uint8_t *)swift_slowAlloc();
        v72 = v6;
        v43 = v5;
        v44 = v42;
        *(_WORD *)v42 = 0;
        _os_log_impl(&dword_246518000, v38, v39, "Finished initialising SiriMASPFLPluginRunner.", v42, 2u);
        v45 = v44;
        v5 = v43;
        v6 = v72;
        MEMORY[0x24955D794](v45, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v6 + 8))(v74, v5);
      v46 = v73;
      *v73 = v23;
      v46[1] = v68;
      v47 = v66;
      *((_QWORD *)v46 + 1) = v67;
      *((_QWORD *)v46 + 2) = v47;
      v48 = v64;
      *((_QWORD *)v46 + 3) = v65;
      *((_QWORD *)v46 + 4) = v48;
      *((_QWORD *)v46 + 5) = v54;
      *((_DWORD *)v46 + 12) = v63;
      v49 = v61;
      *((_QWORD *)v46 + 7) = v62;
      *((_QWORD *)v46 + 8) = v49;
      v50 = v59;
      *((_QWORD *)v46 + 9) = v60;
      *((_QWORD *)v46 + 10) = v50;
      v51 = v57;
      *((_QWORD *)v46 + 11) = v58;
      *((_QWORD *)v46 + 12) = v51;
      *((_QWORD *)v46 + 13) = v69;
      *((_OWORD *)v46 + 7) = v71;
      v52 = v55;
      *((_QWORD *)v46 + 16) = v56;
      *((_QWORD *)v46 + 17) = v52;
      *((_QWORD *)v46 + 18) = v41;
      *((_QWORD *)v46 + 19) = v27;
      *((_QWORD *)v46 + 20) = v37;
    }
    else
    {
      sub_246520660((uint64_t)v83);
      v33 = sub_246529C9C();
      v34 = sub_246529DEC();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_246518000, v33, v34, "Model attachment not found", v35, 2u);
        MEMORY[0x24955D794](v35, -1, -1);
      }

      sub_246522770();
      swift_allocError();
      *v36 = 0;
      swift_willThrow();
      swift_release();
      swift_release();
    }
  }
}

uint64_t sub_246521A2C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  NSObject *v13;
  uint64_t result;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  Class i;
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  os_log_type_t v22;
  uint8_t *v23;
  int64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  os_log_type_t v31;
  uint8_t *v32;
  _BYTE *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  unsigned int v44;
  uint64_t v45;
  int64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  int64_t v53;
  float j;
  unint64_t v55;
  unint64_t v56;
  int64_t v57;
  unint64_t v58;
  int64_t v59;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v61;
  id v62;
  id v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  uint64_t v67;
  int64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71[3];
  uint64_t v72;

  if (qword_257589EA0 != -1)
    swift_once();
  v70 = a4;
  v9 = sub_246529CB4();
  __swift_project_value_buffer(v9, (uint64_t)qword_25758BF70);
  v10 = sub_246529C9C();
  v11 = sub_246529DD4();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_246518000, v10, v11, "Executing SQL query.", v12, 2u);
    MEMORY[0x24955D794](v12, -1, -1);
  }

  v13 = a2;
  sub_24652882C(*(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136));
  if (v4)
    return (uint64_t)v13;
  v15 = sub_246529C9C();
  v16 = sub_246529DD4();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_246518000, v15, v16, "Aggregating SQL rows.", v17, 2u);
    MEMORY[0x24955D794](v17, -1, -1);
  }

  for (i = a2[2].isa; i; i = a2[2].isa)
  {
    if (!-[objc_class next](i, sel_next))
      break;
    v19 = sub_246528B64();
    sub_24651A954((uint64_t)v19);
    swift_bridgeObjectRelease();
  }
  v20 = (uint64_t *)(a3 + 16);
  swift_beginAccess();
  v21 = *(_QWORD *)(*(_QWORD *)(a3 + 16) + 16);
  v13 = sub_246529C9C();
  if (!v21)
  {
    v31 = sub_246529DEC();
    if (os_log_type_enabled(v13, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_246518000, v13, v31, "No Biome datapoints found, returning empty MLRTaskResult", v32, 2u);
      MEMORY[0x24955D794](v32, -1, -1);
    }

    sub_246522770();
    swift_allocError();
    *v33 = 5;
    swift_willThrow();
    return (uint64_t)v13;
  }
  v22 = sub_246529DD4();
  if (os_log_type_enabled(v13, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_246518000, v13, v22, "Producing MLBatchProvider for training.", v23, 2u);
    MEMORY[0x24955D794](v23, -1, -1);
  }

  v24 = sub_24651B6A4();
  sub_2465205D4(a1);
  v25 = sub_246529C9C();
  v26 = sub_246529DD4();
  v69 = v20;
  if (os_log_type_enabled(v25, v26))
  {
    v68 = v24;
    v27 = swift_slowAlloc();
    v67 = swift_slowAlloc();
    v71[0] = v67;
    *(_DWORD *)v27 = 136315650;
    v28 = *(_QWORD *)(a1 + 104);
    v29 = *(_QWORD *)(a1 + 112);
    swift_bridgeObjectRetain();
    v72 = sub_2465292E0(v28, v29, v71);
    sub_246529E04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 2048;
    v72 = v21;
    sub_246529E04();
    *(_WORD *)(v27 + 22) = 1024;
    LODWORD(v72) = *(_DWORD *)(a1 + 4);
    sub_246529E04();
    sub_246520660(a1);
    _os_log_impl(&dword_246518000, v25, v26, "Training model %s with %ld datapoints for %u epochs.", (uint8_t *)v27, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x24955D794](v67, -1, -1);
    v30 = v27;
    v24 = v68;
    MEMORY[0x24955D794](v30, -1, -1);

  }
  else
  {
    sub_246520660(a1);

  }
  v34 = *(_DWORD *)(a1 + 4);
  v35 = swift_bridgeObjectRetain();
  v36 = sub_246527124(v35);
  swift_bridgeObjectRelease();
  sub_246523F7C(v34, v24, v36);
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;
  swift_bridgeObjectRelease();
  v45 = sub_246522D84(v38, v40, v42, v44);

  result = swift_bridgeObjectRelease();
  v46 = 0;
  v47 = *v69;
  v48 = 1 << *(_BYTE *)(*v69 + 32);
  v49 = -1;
  if (v48 < 64)
    v49 = ~(-1 << v48);
  v51 = *(_QWORD *)(v47 + 64);
  v50 = v47 + 64;
  v52 = v49 & v51;
  v53 = (unint64_t)(v48 + 63) >> 6;
  for (j = 0.0; ; j = j + (float)*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*v69 + 56) + 8 * v56) + 16) + 24))
  {
    if (v52)
    {
      v55 = __clz(__rbit64(v52));
      v52 &= v52 - 1;
      v56 = v55 | (v46 << 6);
      continue;
    }
    v57 = v46 + 1;
    if (__OFADD__(v46, 1))
    {
      __break(1u);
LABEL_52:
      __break(1u);
      return result;
    }
    if (v57 >= v53)
      goto LABEL_45;
    v58 = *(_QWORD *)(v50 + 8 * v57);
    ++v46;
    if (!v58)
    {
      v46 = v57 + 1;
      if (v57 + 1 >= v53)
        goto LABEL_45;
      v58 = *(_QWORD *)(v50 + 8 * v46);
      if (!v58)
      {
        v46 = v57 + 2;
        if (v57 + 2 >= v53)
          goto LABEL_45;
        v58 = *(_QWORD *)(v50 + 8 * v46);
        if (!v58)
        {
          v46 = v57 + 3;
          if (v57 + 3 >= v53)
            goto LABEL_45;
          v58 = *(_QWORD *)(v50 + 8 * v46);
          if (!v58)
          {
            v46 = v57 + 4;
            if (v57 + 4 >= v53)
              goto LABEL_45;
            v58 = *(_QWORD *)(v50 + 8 * v46);
            if (!v58)
              break;
          }
        }
      }
    }
LABEL_44:
    v52 = (v58 - 1) & v58;
    v56 = __clz(__rbit64(v58)) + (v46 << 6);
  }
  v59 = v57 + 5;
  if (v59 < v53)
  {
    v58 = *(_QWORD *)(v50 + 8 * v59);
    if (!v58)
    {
      while (1)
      {
        v46 = v59 + 1;
        if (__OFADD__(v59, 1))
          goto LABEL_52;
        if (v46 >= v53)
          goto LABEL_45;
        v58 = *(_QWORD *)(v50 + 8 * v46);
        ++v59;
        if (v58)
          goto LABEL_44;
      }
    }
    v46 = v59;
    goto LABEL_44;
  }
LABEL_45:
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v71[0] = v45;
  sub_24651CE30(0x43656C706D617845, 0xEC000000746E756FLL, isUniquelyReferenced_nonNull_native, j);
  v61 = v71[0];
  v72 = v71[0];
  swift_bridgeObjectRelease();
  v62 = objc_msgSend(*(id *)(v70 + 16), sel_copyCurrentTrainingDelta);
  v63 = objc_msgSend(v62, sel_flattenedModelUpdate);

  if (v63)
  {
    sub_246529C18();

  }
  swift_bridgeObjectRetain();
  v64 = sub_246529C9C();
  v65 = sub_246529DD4();
  if (os_log_type_enabled(v64, v65))
  {
    v66 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v66 = 134217984;
    v71[0] = *(_QWORD *)(v61 + 16);
    sub_246529E04();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246518000, v64, v65, "Finishing plugin by returning %ld metrics and weight delta.", v66, 0xCu);
    MEMORY[0x24955D794](v66, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  sub_246520A5C(v72);
  swift_bridgeObjectRelease();
  sub_246529C48();
  swift_allocObject();
  v13 = sub_246529C3C();
  swift_unknownObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_246522294()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25758A370);
  *(_QWORD *)(v0 + 136) = swift_task_alloc();
  *(_QWORD *)(v0 + 144) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2465222FC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;

  v1 = v0[17];
  v2 = v0[18];
  v3 = swift_allocObject();
  *(_BYTE *)(v3 + 16) = 0;
  v4 = objc_msgSend((id)BiomeLibrary(), sel_Siri);
  swift_unknownObjectRelease();
  v5 = objc_msgSend(v4, sel_AppSelection);
  swift_unknownObjectRelease();
  v6 = objc_msgSend(v5, sel_Music);
  swift_unknownObjectRelease();
  sub_2465226E0();
  v7 = sub_246529C30();
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
  v8(v2, 1, 1, v7);
  v8(v1, 1, 1, v7);
  v9 = sub_246520E5C(v2, v1, 1, 1, 1);
  v10 = objc_msgSend(v6, sel_publisherWithOptions_, v9);

  v0[6] = nullsub_1;
  v0[7] = 0;
  v11 = MEMORY[0x24BDAC760];
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  v0[4] = sub_246520F6C;
  v0[5] = &block_descriptor;
  v12 = _Block_copy(v0 + 2);
  v0[12] = sub_246522734;
  v0[13] = v3;
  v0[8] = v11;
  v0[9] = 1107296256;
  v0[10] = sub_246520F6C;
  v0[11] = &block_descriptor_9;
  v13 = _Block_copy(v0 + 8);
  swift_retain();
  swift_release();
  v14 = objc_msgSend(v10, sel_sinkWithCompletion_receiveInput_, v12, v13);
  _Block_release(v13);
  _Block_release(v12);

  swift_beginAccess();
  v15 = *(unsigned __int8 *)(v3 + 16);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(uint64_t))v0[1])(v15);
}

uint64_t type metadata accessor for SiriMASPFLPluginRunner()
{
  return objc_opt_self();
}

uint64_t method lookup function for SiriMASPFLPluginRunner()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriMASPFLPluginRunner.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of SiriMASPFLPluginRunner.run(task:useCase:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v4 + 88)
                                                                   + *(_QWORD *)(*(_QWORD *)v4 + 88));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_246522628;
  return v12(a1, a2, a3, a4);
}

uint64_t sub_246522628(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of SiriMASPFLPluginRunner.isDataAvailable()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 104) + *(_QWORD *)(*(_QWORD *)v0 + 104));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_246522804;
  return v4();
}

uint64_t sub_2465226D0()
{
  return swift_deallocObject();
}

unint64_t sub_2465226E0()
{
  unint64_t result;

  result = qword_25758A378;
  if (!qword_25758A378)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25758A378);
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

uint64_t sub_246522734()
{
  uint64_t v0;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v0 + 16) = 1;
  return result;
}

unint64_t sub_246522770()
{
  unint64_t result;

  result = qword_25758A380;
  if (!qword_25758A380)
  {
    result = MEMORY[0x24955D710](&unk_24652A854, &type metadata for SiriMASPFLPluginRunnerError);
    atomic_store(result, (unint64_t *)&qword_25758A380);
  }
  return result;
}

uint64_t sub_2465227B4(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2465227DC(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_246522814()
{
  uint64_t v0;

  v0 = sub_246529CB4();
  __swift_allocate_value_buffer(v0, qword_25758BF70);
  __swift_project_value_buffer(v0, (uint64_t)qword_25758BF70);
  return sub_246529CA8();
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

uint64_t sub_2465228D4(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x64656E69617254;
  else
    v3 = 0x656E696C65736142;
  if (v2)
    v4 = 0xE800000000000000;
  else
    v4 = 0xE700000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x64656E69617254;
  else
    v5 = 0x656E696C65736142;
  if ((a2 & 1) != 0)
    v6 = 0xE700000000000000;
  else
    v6 = 0xE800000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_246529F48();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_246522978(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_2465229C4(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_246522A40 + 4 * byte_24652AD44[a2]))(0x74654D6C65646F4DLL);
}

uint64_t sub_246522A40(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x74654D6C65646F4DLL && v1 == 0xEF656D614E636972)
    v2 = 1;
  else
    v2 = sub_246529F48();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_246522B00(char a1)
{
  sub_246529FA8();
  __asm { BR              X10 }
}

uint64_t sub_246522B58()
{
  sub_246529D08();
  swift_bridgeObjectRelease();
  return sub_246529FC0();
}

void sub_246522BE8(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_246522C2C()
{
  sub_246529D08();
  return swift_bridgeObjectRelease();
}

void sub_246522CA0(uint64_t a1, char a2)
{
  sub_246529FA8();
  __asm { BR              X10 }
}

uint64_t sub_246522CF4()
{
  sub_246529D08();
  swift_bridgeObjectRelease();
  return sub_246529FC0();
}

uint64_t sub_246522D84(uint64_t a1, void *a2, void *a3, unsigned int a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  int v38;
  unint64_t v39;
  char v40;
  int v41;
  char v42;
  unint64_t v43;
  uint64_t v44;
  _BOOL8 v45;
  uint64_t v46;
  char v47;
  unint64_t v48;
  char v49;
  uint64_t *v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  char v54;
  unint64_t v55;
  uint64_t v56;
  _BOOL8 v57;
  uint64_t v58;
  char v59;
  unint64_t v60;
  char v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  uint8_t *v67;
  _BYTE *v68;
  uint64_t v69;
  int64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int64_t v75;
  uint64_t v76;
  _QWORD *v77;

  v10 = sub_24651A844(MEMORY[0x24BEE4AF8]);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v77 = (_QWORD *)v10;
  sub_24651CE30(0x756F436863746142, 0xEA0000000000746ELL, isUniquelyReferenced_nonNull_native, (float)a4);
  v12 = (_QWORD *)v10;
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(a2, sel_evaluationMetrics);
  if (!v13)
    goto LABEL_6;
  v14 = v13;
  v15 = objc_msgSend(a3, sel_evaluationMetrics);
  if (!v15)
  {
    swift_unknownObjectRelease();
LABEL_6:
    if (qword_257589EA0 != -1)
      swift_once();
    v18 = sub_246529CB4();
    __swift_project_value_buffer(v18, (uint64_t)qword_25758BF70);
    v19 = sub_246529C9C();
    v20 = sub_246529DE0();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_246518000, v19, v20, "Evaluation metrics are nil.", v21, 2u);
      MEMORY[0x24955D794](v21, -1, -1);
    }

    return (uint64_t)v12;
  }
  v16 = v15;
  v17 = sub_2465275EC(v14);
  if (v4)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    return (uint64_t)v12;
  }
  v73 = v17;
  v72 = sub_2465275EC(v16);
  v69 = a1 + 56;
  v23 = 1 << *(_BYTE *)(a1 + 32);
  v24 = -1;
  if (v23 < 64)
    v24 = ~(-1 << v23);
  v25 = v24 & *(_QWORD *)(a1 + 56);
  v70 = (unint64_t)(v23 + 63) >> 6;
  swift_bridgeObjectRetain();
  v26 = 0;
  v71 = a1;
  while (1)
  {
    if (v25)
    {
      v74 = (v25 - 1) & v25;
      v75 = v26;
      v27 = __clz(__rbit64(v25)) | (v26 << 6);
    }
    else
    {
      v28 = v26 + 1;
      if (__OFADD__(v26, 1))
        goto LABEL_72;
      if (v28 >= v70)
      {
LABEL_69:
        swift_unknownObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return (uint64_t)v12;
      }
      v29 = *(_QWORD *)(v69 + 8 * v28);
      v30 = v26 + 1;
      if (!v29)
      {
        v30 = v26 + 2;
        if (v26 + 2 >= v70)
          goto LABEL_69;
        v29 = *(_QWORD *)(v69 + 8 * v30);
        if (!v29)
        {
          v30 = v26 + 3;
          if (v26 + 3 >= v70)
            goto LABEL_69;
          v29 = *(_QWORD *)(v69 + 8 * v30);
          if (!v29)
          {
            v31 = v26 + 4;
            if (v26 + 4 >= v70)
              goto LABEL_69;
            v29 = *(_QWORD *)(v69 + 8 * v31);
            if (!v29)
            {
              while (1)
              {
                v30 = v31 + 1;
                if (__OFADD__(v31, 1))
                  break;
                if (v30 >= v70)
                  goto LABEL_69;
                v29 = *(_QWORD *)(v69 + 8 * v30);
                ++v31;
                if (v29)
                  goto LABEL_33;
              }
              __break(1u);
LABEL_77:
              result = sub_246529F60();
              __break(1u);
              return result;
            }
            v30 = v26 + 4;
          }
        }
      }
LABEL_33:
      v74 = (v29 - 1) & v29;
      v75 = v30;
      v27 = __clz(__rbit64(v29)) + (v30 << 6);
    }
    v32 = *(_QWORD *)(a1 + 48) + 40 * v27;
    v33 = *(_QWORD *)(v32 + 8);
    v76 = *(_QWORD *)v32;
    v5 = *(_QWORD *)(v32 + 16);
    a3 = *(void **)(v32 + 24);
    v34 = *(_BYTE *)(v32 + 32);
    v35 = *(_QWORD *)(v73 + 16);
    swift_bridgeObjectRetain();
    if (!v35)
    {
      swift_bridgeObjectRetain();
      goto LABEL_64;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v36 = sub_2465299CC(v5, (uint64_t)a3);
    if ((v37 & 1) == 0)
      break;
    v38 = *(_DWORD *)(*(_QWORD *)(v73 + 56) + 4 * v36);
    swift_bridgeObjectRelease();
    if (!*(_QWORD *)(v72 + 16))
      goto LABEL_64;
    swift_bridgeObjectRetain();
    v39 = sub_2465299CC(v5, (uint64_t)a3);
    if ((v40 & 1) == 0)
      break;
    v41 = *(_DWORD *)(*(_QWORD *)(v72 + 56) + 4 * v39);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v5 = swift_isUniquelyReferenced_nonNull_native();
    if ((v34 & 1) != 0)
    {
      v77 = v12;
      v43 = sub_2465299CC(v76, v33);
      v44 = v12[2];
      v45 = (v42 & 1) == 0;
      v46 = v44 + v45;
      if (__OFADD__(v44, v45))
      {
        __break(1u);
LABEL_71:
        __break(1u);
LABEL_72:
        __break(1u);
LABEL_73:
        __break(1u);
LABEL_74:
        __break(1u);
        goto LABEL_75;
      }
      v47 = v42;
      if (v12[3] >= v46)
      {
        if ((v5 & 1) != 0)
        {
          v12 = v77;
          if ((v42 & 1) != 0)
            goto LABEL_53;
        }
        else
        {
          sub_24651D124();
          v12 = v77;
          if ((v47 & 1) != 0)
            goto LABEL_53;
        }
      }
      else
      {
        sub_24651C9F4(v46, v5);
        v48 = sub_2465299CC(v76, v33);
        if ((v47 & 1) != (v49 & 1))
          goto LABEL_77;
        v43 = v48;
        v12 = v77;
        if ((v47 & 1) != 0)
        {
LABEL_53:
          *(_DWORD *)(v12[7] + 4 * v43) = v41;
          goto LABEL_17;
        }
      }
      v12[(v43 >> 6) + 8] |= 1 << v43;
      v50 = (uint64_t *)(v12[6] + 16 * v43);
      *v50 = v76;
      v50[1] = v33;
      *(_DWORD *)(v12[7] + 4 * v43) = v41;
      v51 = v12[2];
      v52 = __OFADD__(v51, 1);
      v53 = v51 + 1;
      if (v52)
        goto LABEL_74;
    }
    else
    {
      v77 = v12;
      v55 = sub_2465299CC(v76, v33);
      v56 = v12[2];
      v57 = (v54 & 1) == 0;
      v58 = v56 + v57;
      if (__OFADD__(v56, v57))
        goto LABEL_71;
      v59 = v54;
      if (v12[3] >= v58)
      {
        if ((v5 & 1) != 0)
        {
          v12 = v77;
          if ((v54 & 1) != 0)
            goto LABEL_16;
        }
        else
        {
          sub_24651D124();
          v12 = v77;
          if ((v59 & 1) != 0)
            goto LABEL_16;
        }
      }
      else
      {
        sub_24651C9F4(v58, v5);
        v60 = sub_2465299CC(v76, v33);
        if ((v59 & 1) != (v61 & 1))
          goto LABEL_77;
        v55 = v60;
        v12 = v77;
        if ((v59 & 1) != 0)
        {
LABEL_16:
          *(_DWORD *)(v12[7] + 4 * v55) = v38;
          goto LABEL_17;
        }
      }
      v12[(v55 >> 6) + 8] |= 1 << v55;
      v62 = (uint64_t *)(v12[6] + 16 * v55);
      *v62 = v76;
      v62[1] = v33;
      *(_DWORD *)(v12[7] + 4 * v55) = v38;
      v63 = v12[2];
      v52 = __OFADD__(v63, 1);
      v53 = v63 + 1;
      if (v52)
        goto LABEL_73;
    }
    v12[2] = v53;
    swift_bridgeObjectRetain();
LABEL_17:
    a1 = v71;
    v26 = v75;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v25 = v74;
  }
  swift_bridgeObjectRelease();
LABEL_64:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_257589EA0 == -1)
    goto LABEL_65;
LABEL_75:
  swift_once();
LABEL_65:
  v64 = sub_246529CB4();
  __swift_project_value_buffer(v64, (uint64_t)qword_25758BF70);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v65 = sub_246529C9C();
  v66 = sub_246529DEC();
  if (os_log_type_enabled(v65, v66))
  {
    v67 = (uint8_t *)swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    v77 = v12;
    *(_DWORD *)v67 = 136315138;
    swift_bridgeObjectRetain();
    sub_2465292E0(v5, (unint64_t)a3, (uint64_t *)&v77);
    sub_246529E04();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_246518000, v65, v66, "Baseline/Trained metric value not found for %s", v67, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24955D794](v12, -1, -1);
    MEMORY[0x24955D794](v67, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  sub_246527BD8();
  swift_allocError();
  *v68 = 4;
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return (uint64_t)v12;
}

uint64_t sub_246523608(char *a1, void *a2, double a3)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, uint64_t, uint64_t);
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  id v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  unint64_t v31;
  void (*v32)(char *, uint64_t);
  id v33;
  uint64_t v34;
  void *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _BYTE *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  uint8_t *v52;
  void *v53;
  uint64_t v54;
  unint64_t v55;
  void (*v56)(char *, uint64_t);
  uint8_t *v57;
  _BYTE *v58;
  id v60;
  void *v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  id v66;
  id v67;
  NSObject *v68;
  os_log_type_t v69;
  int v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  void (*v76)(char *, uint64_t);
  void *v77;
  id v78;
  uint64_t v79;
  _QWORD *v80;
  void (*v81)(char *, uint64_t);
  os_log_t v82;
  void *v83;
  _BYTE *v84;
  void *v85;
  _QWORD *v86;
  os_log_t v87;
  int v88;
  void *v89;
  char *v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  id v97[2];

  v97[1] = *(id *)MEMORY[0x24BDAC8D0];
  v7 = sub_246529C0C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)&v85 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v85 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v90 = (char *)&v85 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v85 - v17;
  sub_246527C60();
  v91 = v8;
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v94 = v7;
  v95 = a1;
  v19(v18, (uint64_t)a1, v7);
  v92 = a2;
  v20 = (char *)sub_246527008((uint64_t)v18, (uint64_t)a2);
  if (v3)
  {
    if (qword_257589EA0 != -1)
      swift_once();
    v21 = sub_246529CB4();
    __swift_project_value_buffer(v21, (uint64_t)qword_25758BF70);
    v22 = v90;
    v23 = v94;
    v19(v90, (uint64_t)v95, v94);
    v24 = v3;
    v25 = v3;
    v26 = sub_246529C9C();
    v27 = sub_246529DEC();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = swift_slowAlloc();
      v29 = (_QWORD *)swift_slowAlloc();
      v89 = (void *)swift_slowAlloc();
      v97[0] = v89;
      *(_DWORD *)v28 = 136315394;
      sub_246527C9C();
      v30 = sub_246529F3C();
      v96 = sub_2465292E0(v30, v31, (uint64_t *)v97);
      sub_246529E04();
      swift_bridgeObjectRelease();
      v32 = *(void (**)(char *, uint64_t))(v91 + 8);
      v32(v22, v94);
      *(_WORD *)(v28 + 12) = 2112;
      v33 = v3;
      v34 = _swift_stdlib_bridgeErrorToNSError();
      v96 = v34;
      v23 = v94;
      sub_246529E04();
      *v29 = v34;

      _os_log_impl(&dword_246518000, v26, v27, "Model init failed for %s with error: %@", (uint8_t *)v28, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25758A170);
      swift_arrayDestroy();
      MEMORY[0x24955D794](v29, -1, -1);
      v35 = v89;
      swift_arrayDestroy();
      MEMORY[0x24955D794](v35, -1, -1);
      MEMORY[0x24955D794](v28, -1, -1);
    }
    else
    {
      v32 = *(void (**)(char *, uint64_t))(v91 + 8);
      v32(v22, v23);

    }
    sub_246527BD8();
    swift_allocError();
    *v45 = 0;
    swift_willThrow();

    v32(v95, v23);
    v37 = v93;
    goto LABEL_19;
  }
  v36 = v20;
  v37 = v93;
  if (!v20 || (v38 = v11, (v39 = (char *)objc_msgSend(v20, sel_program)) == 0))
  {
    if (qword_257589EA0 != -1)
      swift_once();
    v46 = sub_246529CB4();
    __swift_project_value_buffer(v46, (uint64_t)qword_25758BF70);
    v47 = v14;
    v48 = v94;
    v19(v14, (uint64_t)v95, v94);
    v49 = sub_246529C9C();
    v50 = sub_246529DEC();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = swift_slowAlloc();
      v90 = v36;
      v52 = (uint8_t *)v51;
      v53 = (void *)swift_slowAlloc();
      v97[0] = v53;
      *(_DWORD *)v52 = 136315138;
      sub_246527C9C();
      v54 = sub_246529F3C();
      v96 = sub_2465292E0(v54, v55, (uint64_t *)v97);
      v48 = v94;
      sub_246529E04();
      swift_bridgeObjectRelease();
      v56 = *(void (**)(char *, uint64_t))(v91 + 8);
      v56(v47, v48);
      _os_log_impl(&dword_246518000, v49, v50, "No ML program found for %s", v52, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24955D794](v53, -1, -1);
      v57 = v52;
      v36 = v90;
      MEMORY[0x24955D794](v57, -1, -1);
    }
    else
    {
      v56 = *(void (**)(char *, uint64_t))(v91 + 8);
      v56(v14, v48);
    }

    sub_246527BD8();
    swift_allocError();
    *v58 = 1;
    swift_willThrow();

    v56(v95, v48);
    goto LABEL_18;
  }
  v40 = v39;
  v41 = objc_allocWithZone(MEMORY[0x24BDC0020]);
  v97[0] = 0;
  swift_unknownObjectRetain();
  v42 = objc_msgSend(v41, sel_initWithProgram_learningRate_error_, v40, v97, a3);
  if (!v42)
  {
    v60 = v97[0];
    v61 = (void *)sub_246529BD0();

    swift_willThrow();
    swift_unknownObjectRelease();
    if (qword_257589EA0 != -1)
      swift_once();
    v62 = sub_246529CB4();
    __swift_project_value_buffer(v62, (uint64_t)qword_25758BF70);
    v63 = v38;
    v64 = v38;
    v65 = v94;
    v19(v64, (uint64_t)v95, v94);
    v66 = v61;
    v67 = v61;
    v68 = sub_246529C9C();
    v69 = sub_246529DEC();
    v70 = v69;
    if (os_log_type_enabled(v68, v69))
    {
      v71 = v61;
      v72 = swift_slowAlloc();
      v86 = (_QWORD *)swift_slowAlloc();
      v89 = (void *)swift_slowAlloc();
      v97[0] = v89;
      *(_DWORD *)v72 = 136315394;
      v88 = v70;
      sub_246527C9C();
      v87 = v68;
      v73 = sub_246529F3C();
      v96 = sub_2465292E0(v73, v74, (uint64_t *)v97);
      v90 = v40;
      sub_246529E04();
      swift_bridgeObjectRelease();
      v75 = v65;
      v76 = *(void (**)(char *, uint64_t))(v91 + 8);
      v76(v63, v75);
      *(_WORD *)(v72 + 12) = 2112;
      v77 = v71;
      v78 = v71;
      v79 = _swift_stdlib_bridgeErrorToNSError();
      v96 = v79;
      sub_246529E04();
      v80 = v86;
      *v86 = v79;
      v81 = v76;
      v85 = v77;

      v82 = v87;
      _os_log_impl(&dword_246518000, v87, (os_log_type_t)v88, "ML program trainer init failed for %s: %@", (uint8_t *)v72, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25758A170);
      swift_arrayDestroy();
      MEMORY[0x24955D794](v80, -1, -1);
      v83 = v89;
      swift_arrayDestroy();
      MEMORY[0x24955D794](v83, -1, -1);
      MEMORY[0x24955D794](v72, -1, -1);

      v65 = v94;
      v61 = v85;
    }
    else
    {
      v81 = *(void (**)(char *, uint64_t))(v91 + 8);
      v81(v63, v65);

    }
    sub_246527BD8();
    swift_allocError();
    *v84 = 1;
    swift_willThrow();

    swift_unknownObjectRelease();
    v81(v95, v65);
LABEL_18:

LABEL_19:
    type metadata accessor for ModelTrainer();
    swift_deallocPartialClassInstance();
    return v37;
  }
  v43 = v42;
  v44 = v97[0];

  swift_unknownObjectRelease_n();
  (*(void (**)(char *, uint64_t))(v91 + 8))(v95, v94);
  *(_QWORD *)(v37 + 16) = v43;

  return v37;
}

void sub_246523F7C(int a1, int64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v6;
  int64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  int64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  unint64_t v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  char v42;
  id v43[2];

  v4 = v3;
  v6 = a2;
  v43[1] = *(id *)MEMORY[0x24BDAC8D0];
  v7 = *(_QWORD *)(a3 + 16);
  v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v7)
  {
    v39 = v4;
    v43[0] = (id)MEMORY[0x24BEE4AF8];
    sub_246526A54(0, v7, 0);
    v8 = v43[0];
    v6 = sub_246526D60(a3);
    v4 = v9;
    v11 = v10 & 1;
    while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(a3 + 32))
    {
      if (((*(_QWORD *)(a3 + 56 + (((unint64_t)v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
        goto LABEL_28;
      if (*(_DWORD *)(a3 + 36) != (_DWORD)v4)
        goto LABEL_29;
      v42 = v11;
      v12 = *(_QWORD *)(a3 + 48) + 40 * v6;
      v13 = *(_QWORD *)(v12 + 16);
      v14 = *(_QWORD *)(v12 + 24);
      v43[0] = v8;
      v16 = v8[2];
      v15 = v8[3];
      swift_bridgeObjectRetain();
      if (v16 >= v15 >> 1)
      {
        sub_246526A54(v15 > 1, v16 + 1, 1);
        v8 = v43[0];
      }
      v8[2] = v16 + 1;
      v17 = &v8[2 * v16];
      v17[4] = v13;
      v17[5] = v14;
      v18 = sub_246526E00(v6, v4, v42 & 1, a3);
      v6 = v18;
      v4 = v19;
      v11 = v20 & 1;
      if (!--v7)
      {
        sub_246526EE4(v18, v19, v11);
        v4 = v39;
        v6 = a2;
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
  }
  else
  {
LABEL_11:
    sub_2465271C8((uint64_t)v8);
    swift_bridgeObjectRelease();
    if (qword_257589EA0 == -1)
      goto LABEL_12;
  }
  swift_once();
LABEL_12:
  v21 = sub_246529CB4();
  __swift_project_value_buffer(v21, (uint64_t)qword_25758BF70);
  swift_unknownObjectRetain();
  v22 = sub_246529C9C();
  v23 = sub_246529DD4();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc();
    *(_DWORD *)v24 = 134218240;
    HIDWORD(v43[0]) = (unint64_t)objc_msgSend((id)v6, sel_count) >> 32;
    sub_246529E04();
    swift_unknownObjectRelease();
    *(_WORD *)(v24 + 12) = 1024;
    LODWORD(v43[0]) = a1;
    sub_246529E04();
    _os_log_impl(&dword_246518000, v22, v23, "Training %ld for %u epochs.", (uint8_t *)v24, 0x12u);
    MEMORY[0x24955D794](v24, -1, -1);

  }
  else
  {

    swift_unknownObjectRelease();
  }
  v25 = (void *)v6;
  v26 = *(void **)(v4 + 16);
  v27 = (void *)sub_246529D98();
  v43[0] = 0;
  v28 = objc_msgSend(v26, sel_evaluateUsingTestData_evaluationMetricNames_error_, v25, v27, v43);

  if (v28)
  {
    v29 = v43[0];
    v30 = v25;
    v31 = (unint64_t)objc_msgSend(v25, sel_count);
    if ((v31 & 0x8000000000000000) != 0 || HIDWORD(v31))
    {
      sub_246529E70();
      __break(1u);
    }
    else
    {
      if (a1)
      {
        while (1)
        {
          v43[0] = 0;
          v32 = objc_msgSend(v26, sel_trainUsingTrainingData_error_, v30, v43);
          v33 = v43[0];
          if (!v32)
            break;

          if (!--a1)
            goto LABEL_21;
        }
        v38 = v33;
        swift_bridgeObjectRelease();
      }
      else
      {
LABEL_21:
        v34 = (void *)sub_246529D98();
        swift_bridgeObjectRelease();
        v43[0] = 0;
        v35 = objc_msgSend(v26, sel_evaluateUsingTestData_evaluationMetricNames_error_, v30, v34, v43);

        if (v35)
        {
          v36 = v43[0];
          swift_bridgeObjectRetain();
          return;
        }
        v38 = v43[0];
      }
      sub_246529BD0();

      swift_willThrow();
    }
  }
  else
  {
    v37 = v43[0];
    swift_bridgeObjectRelease();
    sub_246529BD0();

    swift_willThrow();
  }
}

uint64_t sub_2465244B0()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ModelTrainer()
{
  return objc_opt_self();
}

uint64_t sub_2465244F4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758A4A0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2465281C8();
  sub_246529FD8();
  v10[15] = 0;
  sub_246529EF4();
  if (!v2)
  {
    v10[14] = 1;
    sub_246529EF4();
    v10[13] = *(_BYTE *)(v3 + 32);
    v10[12] = 2;
    sub_246528294();
    sub_246529F18();
    v10[11] = 3;
    sub_2465282D8();
    sub_246529F18();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_24652467C()
{
  sub_246529FA8();
  swift_bridgeObjectRetain();
  sub_246529D08();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_246529D08();
  swift_bridgeObjectRelease();
  sub_246529D08();
  swift_bridgeObjectRelease();
  sub_246529D08();
  return sub_246529FC0();
}

void sub_246524764(char *a1)
{
  sub_246522978(*a1);
}

void sub_246524770()
{
  char *v0;

  sub_246522B00(*v0);
}

void sub_246524778(uint64_t a1)
{
  char *v1;

  sub_246522BE8(a1, *v1);
}

void sub_246524780(uint64_t a1)
{
  char *v1;

  sub_246522CA0(a1, *v1);
}

uint64_t sub_246524788@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_246527F08();
  *a1 = result;
  return result;
}

uint64_t sub_2465247B4()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_2465247E8 + 4 * byte_24652AD54[*v0]))();
}

void sub_2465247E8(_QWORD *a1@<X8>)
{
  *a1 = 0x74654D6C65646F4DLL;
  a1[1] = 0xEF656D614E636972;
}

void sub_246524810(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1 + 2;
  a1[1] = 0x800000024652B320;
}

void sub_24652482C(char *a1@<X8>)
{
  strcpy(a1, "MetricEncoding");
  a1[15] = -18;
}

uint64_t sub_246524854()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_246524888 + 4 * byte_24652AD58[*v0]))(0xD000000000000012, 0x800000024652B2F0);
}

uint64_t sub_246524888()
{
  return 0x74654D6C65646F4DLL;
}

uint64_t sub_2465248AC(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_2465248C4()
{
  return 0x6E4563697274654DLL;
}

uint64_t sub_2465248E8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_246527F08();
  *a1 = result;
  return result;
}

void sub_24652490C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_246524918()
{
  sub_2465281C8();
  return sub_246529FE4();
}

uint64_t sub_246524940()
{
  sub_2465281C8();
  return sub_246529FF0();
}

uint64_t sub_246524968(uint64_t a1, uint64_t a2)
{
  return sub_246526EF0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32), *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), *(_BYTE *)(a2 + 32)) & 1;
}

uint64_t sub_2465249B4()
{
  swift_bridgeObjectRetain();
  sub_246529D08();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_246529D08();
  swift_bridgeObjectRelease();
  sub_246529D08();
  swift_bridgeObjectRelease();
  return sub_246529D08();
}

uint64_t sub_246524A88()
{
  sub_246529FA8();
  swift_bridgeObjectRetain();
  sub_246529D08();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_246529D08();
  swift_bridgeObjectRelease();
  sub_246529D08();
  swift_bridgeObjectRelease();
  sub_246529D08();
  return sub_246529FC0();
}

double sub_246524B74@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  char v7;

  sub_246527F50(a1, (uint64_t)v6);
  if (!v2)
  {
    result = *(double *)v6;
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(_BYTE *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_246524BB8(_QWORD *a1)
{
  return sub_2465244F4(a1);
}

uint64_t sub_246524BCC(char *a1, char *a2)
{
  return sub_2465228D4(*a1, *a2);
}

uint64_t sub_246524BD8()
{
  sub_246529FA8();
  sub_246529D08();
  swift_bridgeObjectRelease();
  return sub_246529FC0();
}

uint64_t sub_246524C58()
{
  sub_246529D08();
  return swift_bridgeObjectRelease();
}

uint64_t sub_246524CB4()
{
  sub_246529FA8();
  sub_246529D08();
  swift_bridgeObjectRelease();
  return sub_246529FC0();
}

uint64_t sub_246524D30@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_246529EAC();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_246524D8C(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x656E696C65736142;
  if (*v1)
    v2 = 0x64656E69617254;
  v3 = 0xE800000000000000;
  if (*v1)
    v3 = 0xE700000000000000;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_246524DCC()
{
  sub_2465287A4();
  return sub_246529D2C();
}

uint64_t sub_246524E28()
{
  sub_2465287A4();
  return sub_246529D20();
}

uint64_t sub_246524E74()
{
  return 1;
}

uint64_t sub_246524E7C()
{
  sub_246529FA8();
  sub_246529D08();
  return sub_246529FC0();
}

uint64_t sub_246524EC8()
{
  return sub_246529D08();
}

uint64_t sub_246524EDC()
{
  sub_246529FA8();
  sub_246529D08();
  return sub_246529FC0();
}

uint64_t sub_246524F24@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_246529EAC();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_246524F74(_QWORD *a1@<X8>)
{
  *a1 = 0x72616C616353;
  a1[1] = 0xE600000000000000;
}

uint64_t sub_246524F8C()
{
  sub_2465287E8();
  return sub_246529D2C();
}

uint64_t sub_246524FE8()
{
  sub_2465287E8();
  return sub_246529D20();
}

uint64_t sub_246525034(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_246529FA8();
  swift_bridgeObjectRetain();
  sub_246529D08();
  v8 = sub_246529FC0();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_246529F48() & 1) != 0)
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
      if (v19 || (sub_246529F48() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_246525BE0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2465251E0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  BOOL v22;
  BOOL v23;
  uint64_t v24;
  unint64_t v25;
  char v27;
  char isUniquelyReferenced_nonNull_native;
  __int128 v29;
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

  v3 = v2;
  v7 = *(_QWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v9 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v10 = *v3;
  sub_246529FA8();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_246529D08();
  v42 = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v40 = v9;
  sub_246529D08();
  v41 = v8;
  swift_bridgeObjectRelease();
  if (*(_BYTE *)(a2 + 32))
    v11 = 0x64656E69617254;
  else
    v11 = 0x656E696C65736142;
  if (*(_BYTE *)(a2 + 32))
    v12 = 0xE700000000000000;
  else
    v12 = 0xE800000000000000;
  v38 = v11;
  sub_246529D08();
  swift_bridgeObjectRelease();
  sub_246529D08();
  v13 = sub_246529FC0();
  v14 = -1 << *(_BYTE *)(v10 + 32);
  v15 = v13 & ~v14;
  v39 = v10;
  v16 = v10 + 56;
  v37 = a1;
  v36 = a2;
  if (((*(_QWORD *)(v10 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
  {
LABEL_32:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v43 = *v3;
    *v3 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_246525D78(v36, v15, isUniquelyReferenced_nonNull_native);
    *v3 = v43;
    swift_bridgeObjectRelease();
    v29 = *(_OWORD *)(v36 + 16);
    *(_OWORD *)v37 = *(_OWORD *)v36;
    *(_OWORD *)(v37 + 16) = v29;
    *(_BYTE *)(v37 + 32) = *(_BYTE *)(v36 + 32);
    return 1;
  }
  v17 = ~v14;
  while (1)
  {
    v18 = *(_QWORD *)(v39 + 48) + 40 * v15;
    v20 = *(_QWORD *)(v18 + 16);
    v19 = *(_QWORD *)(v18 + 24);
    v21 = *(unsigned __int8 *)(v18 + 32);
    v22 = *(_QWORD *)v18 == v7 && *(_QWORD *)(v18 + 8) == v42;
    if (!v22 && (sub_246529F48() & 1) == 0)
      goto LABEL_9;
    v23 = v20 == v40 && v19 == v41;
    if (!v23 && (sub_246529F48() & 1) == 0)
      goto LABEL_9;
    v24 = v21 ? 0x64656E69617254 : 0x656E696C65736142;
    v25 = v21 ? 0xE700000000000000 : 0xE800000000000000;
    if (v24 == v38 && v25 == v12)
      break;
    v27 = sub_246529F48();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v27 & 1) != 0)
      goto LABEL_34;
    swift_bridgeObjectRelease();
LABEL_9:
    v15 = (v15 + 1) & v17;
    if (((*(_QWORD *)(v16 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
      goto LABEL_32;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
LABEL_34:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v31 = *(_QWORD *)(*v3 + 48) + 40 * v15;
  v33 = *(_QWORD *)v31;
  v32 = *(_QWORD *)(v31 + 8);
  v34 = *(_QWORD *)(v31 + 16);
  v35 = *(_QWORD *)(v31 + 24);
  LOBYTE(v31) = *(_BYTE *)(v31 + 32);
  *(_QWORD *)a1 = v33;
  *(_QWORD *)(a1 + 8) = v32;
  *(_QWORD *)(a1 + 16) = v34;
  *(_QWORD *)(a1 + 24) = v35;
  *(_BYTE *)(a1 + 32) = v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return 0;
}

uint64_t sub_24652555C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758A440);
  v3 = sub_246529E4C();
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
      sub_246529FA8();
      sub_246529D08();
      result = sub_246529FC0();
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

uint64_t sub_246525838()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  _QWORD *v33;
  uint64_t i;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758A460);
  v3 = sub_246529E4C();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v33 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v32 = (unint64_t)(v5 + 63) >> 6;
    v8 = v3 + 56;
    result = swift_retain();
    v10 = 0;
    for (i = v2; ; v2 = i)
    {
      if (v7)
      {
        v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v14 = v13 | (v10 << 6);
      }
      else
      {
        v15 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v32)
          goto LABEL_33;
        v16 = v33[v15];
        ++v10;
        if (!v16)
        {
          v10 = v15 + 1;
          if (v15 + 1 >= v32)
            goto LABEL_33;
          v16 = v33[v10];
          if (!v16)
          {
            v10 = v15 + 2;
            if (v15 + 2 >= v32)
              goto LABEL_33;
            v16 = v33[v10];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v32)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v31 = 1 << *(_BYTE *)(v2 + 32);
                if (v31 > 63)
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v33 = -1 << v31;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v33[v17];
              if (!v16)
              {
                while (1)
                {
                  v10 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v10 >= v32)
                    goto LABEL_33;
                  v16 = v33[v10];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v10 = v17;
            }
          }
        }
LABEL_23:
        v7 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v10 << 6);
      }
      v18 = *(_QWORD *)(v2 + 48) + 40 * v14;
      v19 = *(_QWORD *)v18;
      v20 = *(_QWORD *)(v18 + 8);
      v21 = *(_QWORD *)(v18 + 16);
      v22 = *(_QWORD *)(v18 + 24);
      v23 = *(_BYTE *)(v18 + 32);
      sub_246529FA8();
      swift_bridgeObjectRetain();
      sub_246529D08();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_246529D08();
      swift_bridgeObjectRelease();
      sub_246529D08();
      swift_bridgeObjectRelease();
      sub_246529D08();
      result = sub_246529FC0();
      v24 = -1 << *(_BYTE *)(v4 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v8 + 8 * (v25 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v8 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v8 + 8 * v26);
        }
        while (v30 == -1);
        v11 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      v12 = *(_QWORD *)(v4 + 48) + 40 * v11;
      *(_QWORD *)v12 = v19;
      *(_QWORD *)(v12 + 8) = v20;
      *(_QWORD *)(v12 + 16) = v21;
      *(_QWORD *)(v12 + 24) = v22;
      *(_BYTE *)(v12 + 32) = v23;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_246525BE0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_24652555C();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_2465260B0();
      goto LABEL_22;
    }
    sub_24652642C();
  }
  v11 = *v4;
  sub_246529FA8();
  sub_246529D08();
  result = sub_246529FC0();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_246529F48(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_246529F54();
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
          result = sub_246529F48();
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

uint64_t sub_246525D78(uint64_t result, unint64_t a2, char a3)
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
  BOOL v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  BOOL v24;
  uint64_t v25;
  unint64_t v26;
  char v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  v36 = result;
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if ((a3 & 1) != 0)
    {
      sub_246525838();
    }
    else
    {
      if (v7 > v6)
      {
        result = (uint64_t)sub_246526260();
        goto LABEL_39;
      }
      sub_2465266D8();
    }
    v8 = *v3;
    sub_246529FA8();
    v9 = *(_QWORD *)v5;
    v10 = *(_QWORD *)(v5 + 8);
    swift_bridgeObjectRetain();
    sub_246529D08();
    swift_bridgeObjectRelease();
    v11 = *(_QWORD *)(v5 + 16);
    v12 = *(_QWORD *)(v5 + 24);
    swift_bridgeObjectRetain();
    v40 = v11;
    sub_246529D08();
    v39 = v12;
    swift_bridgeObjectRelease();
    v13 = *(_BYTE *)(v5 + 32) == 0;
    if (*(_BYTE *)(v5 + 32))
      v14 = 0x64656E69617254;
    else
      v14 = 0x656E696C65736142;
    if (v13)
      v15 = 0xE800000000000000;
    else
      v15 = 0xE700000000000000;
    sub_246529D08();
    swift_bridgeObjectRelease();
    sub_246529D08();
    result = sub_246529FC0();
    v16 = -1 << *(_BYTE *)(v8 + 32);
    a2 = result & ~v16;
    v38 = v8;
    v17 = v8 + 56;
    if (((*(_QWORD *)(v17 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
    {
      v37 = v14;
      v18 = ~v16;
      do
      {
        v19 = *(_QWORD *)(v38 + 48) + 40 * a2;
        v20 = *(_QWORD *)(v19 + 16);
        v21 = *(_QWORD *)(v19 + 24);
        v22 = *(unsigned __int8 *)(v19 + 32);
        v23 = *(_QWORD *)v19 == v9 && *(_QWORD *)(v19 + 8) == v10;
        if (v23 || (result = sub_246529F48(), (result & 1) != 0))
        {
          v24 = v20 == v40 && v21 == v39;
          if (v24 || (result = sub_246529F48(), (result & 1) != 0))
          {
            if (v22)
              v25 = 0x64656E69617254;
            else
              v25 = 0x656E696C65736142;
            if (v22)
              v26 = 0xE700000000000000;
            else
              v26 = 0xE800000000000000;
            if (v25 == v37 && v26 == v15)
              goto LABEL_42;
            v28 = sub_246529F48();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v28 & 1) != 0)
              goto LABEL_43;
            result = swift_bridgeObjectRelease();
          }
        }
        a2 = (a2 + 1) & v18;
      }
      while (((*(_QWORD *)(v17 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
    }
  }
LABEL_39:
  v29 = *v35;
  *(_QWORD *)(*v35 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  v30 = *(_QWORD *)(v29 + 48) + 40 * a2;
  v31 = *(_OWORD *)(v36 + 16);
  *(_OWORD *)v30 = *(_OWORD *)v36;
  *(_OWORD *)(v30 + 16) = v31;
  *(_BYTE *)(v30 + 32) = *(_BYTE *)(v36 + 32);
  v32 = *(_QWORD *)(v29 + 16);
  v33 = __OFADD__(v32, 1);
  v34 = v32 + 1;
  if (v33)
  {
    __break(1u);
LABEL_42:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
LABEL_43:
    swift_bridgeObjectRelease();
    result = sub_246529F54();
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v29 + 16) = v34;
  }
  return result;
}

void *sub_2465260B0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758A440);
  v2 = *v0;
  v3 = sub_246529E40();
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

void *sub_246526260()
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758A460);
  v2 = *v0;
  v3 = sub_246529E40();
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v23 >= v13)
      goto LABEL_28;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_28;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
      {
        v9 = v23 + 2;
        if (v23 + 2 >= v13)
          goto LABEL_28;
        v24 = *(_QWORD *)(v6 + 8 * v9);
        if (!v24)
          break;
      }
    }
LABEL_27:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    v17 = *(_QWORD *)(v2 + 48) + v16;
    v19 = *(_QWORD *)v17;
    v18 = *(_QWORD *)(v17 + 8);
    v20 = *(_QWORD *)(v17 + 16);
    v21 = *(_QWORD *)(v17 + 24);
    LOBYTE(v17) = *(_BYTE *)(v17 + 32);
    v22 = *(_QWORD *)(v4 + 48) + v16;
    *(_QWORD *)v22 = v19;
    *(_QWORD *)(v22 + 8) = v18;
    *(_QWORD *)(v22 + 16) = v20;
    *(_QWORD *)(v22 + 24) = v21;
    *(_BYTE *)(v22 + 32) = v17;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 3;
  if (v25 >= v13)
    goto LABEL_28;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24652642C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758A440);
  v3 = sub_246529E4C();
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
    sub_246529FA8();
    swift_bridgeObjectRetain();
    sub_246529D08();
    result = sub_246529FC0();
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

uint64_t sub_2465266D8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t i;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758A460);
  v3 = sub_246529E4C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v31 = v2 + 56;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v32 = (unint64_t)(v5 + 63) >> 6;
  v8 = v3 + 56;
  result = swift_retain();
  v10 = 0;
  for (i = v2; ; v2 = i)
  {
    if (v7)
    {
      v13 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v14 = v13 | (v10 << 6);
      goto LABEL_24;
    }
    v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v32)
      goto LABEL_33;
    v16 = *(_QWORD *)(v31 + 8 * v15);
    ++v10;
    if (!v16)
    {
      v10 = v15 + 1;
      if (v15 + 1 >= v32)
        goto LABEL_33;
      v16 = *(_QWORD *)(v31 + 8 * v10);
      if (!v16)
      {
        v10 = v15 + 2;
        if (v15 + 2 >= v32)
          goto LABEL_33;
        v16 = *(_QWORD *)(v31 + 8 * v10);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v7 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v10 << 6);
LABEL_24:
    v18 = *(_QWORD *)(v2 + 48) + 40 * v14;
    v19 = *(_QWORD *)v18;
    v20 = *(_QWORD *)(v18 + 8);
    v21 = *(_QWORD *)(v18 + 16);
    v22 = *(_QWORD *)(v18 + 24);
    v23 = *(_BYTE *)(v18 + 32);
    sub_246529FA8();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_246529D08();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_246529D08();
    swift_bridgeObjectRelease();
    sub_246529D08();
    swift_bridgeObjectRelease();
    sub_246529D08();
    result = sub_246529FC0();
    v24 = -1 << *(_BYTE *)(v4 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v8 + 8 * (v25 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v8 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v8 + 8 * v26);
      }
      while (v30 == -1);
      v11 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    v12 = *(_QWORD *)(v4 + 48) + 40 * v11;
    *(_QWORD *)v12 = v19;
    *(_QWORD *)(v12 + 8) = v20;
    *(_QWORD *)(v12 + 16) = v21;
    *(_QWORD *)(v12 + 24) = v22;
    *(_BYTE *)(v12 + 32) = v23;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v32)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v31 + 8 * v17);
  if (v16)
  {
    v10 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v10 >= v32)
      goto LABEL_33;
    v16 = *(_QWORD *)(v31 + 8 * v10);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_246526A54(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_246526BF8(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_246526A70(char a1, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25758A1B8);
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25758A1A8);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_246529EA0();
  __break(1u);
  return result;
}

uint64_t sub_246526BF8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25758A448);
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
  result = sub_246529EA0();
  __break(1u);
  return result;
}

uint64_t sub_246526D60(uint64_t a1)
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

  v1 = *(_QWORD *)(a1 + 56);
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
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
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

int64_t sub_246526E00(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_246526EE4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_246526EF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  char v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;

  if (a1 == a6 && a2 == a7 || (v14 = 0, (sub_246529F48() & 1) != 0))
  {
    if (a3 == a8 && a4 == a9 || (v14 = 0, (sub_246529F48() & 1) != 0))
    {
      if ((a5 & 1) != 0)
        v15 = 0x64656E69617254;
      else
        v15 = 0x656E696C65736142;
      if ((a5 & 1) != 0)
        v16 = 0xE700000000000000;
      else
        v16 = 0xE800000000000000;
      if ((a10 & 1) != 0)
        v17 = 0x64656E69617254;
      else
        v17 = 0x656E696C65736142;
      if ((a10 & 1) != 0)
        v18 = 0xE700000000000000;
      else
        v18 = 0xE800000000000000;
      if (v15 == v17 && v16 == v18)
        v14 = 1;
      else
        v14 = sub_246529F48();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  return v14 & 1;
}

id sub_246527008(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  id v10;
  uint64_t v11;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = (void *)sub_246529BE8();
  v13[0] = 0;
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelWithContentsOfURL_configuration_error_, v4, a2, v13);

  v6 = v13[0];
  if (v5)
  {
    v7 = sub_246529C0C();
    v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
    v9 = v6;
    v8(a1, v7);
  }
  else
  {
    v10 = v13[0];
    sub_246529BD0();

    swift_willThrow();
    v11 = sub_246529C0C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

uint64_t sub_246527124(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  _BYTE v10[8];
  uint64_t v11;
  _QWORD v12[4];
  char v13;

  v2 = *(_QWORD *)(a1 + 16);
  sub_246527C1C();
  result = sub_246529DB0();
  v11 = result;
  if (v2)
  {
    v4 = (_BYTE *)(a1 + 64);
    do
    {
      v6 = *((_QWORD *)v4 - 4);
      v5 = *((_QWORD *)v4 - 3);
      v7 = *((_QWORD *)v4 - 2);
      v8 = *((_QWORD *)v4 - 1);
      v9 = *v4;
      v4 += 40;
      v12[0] = v6;
      v12[1] = v5;
      v12[2] = v7;
      v12[3] = v8;
      v13 = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2465251E0((uint64_t)v10, (uint64_t)v12);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      --v2;
    }
    while (v2);
    return v11;
  }
  return result;
}

uint64_t sub_2465271C8(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_246529DB0();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_246525034(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

void sub_24652725C(void *a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  id v15;
  _BYTE *v16;

  v2 = objc_msgSend(a1, sel_type);
  if (v2 == (id)1)
  {
    objc_msgSend(a1, sel_int64Value);
    return;
  }
  if (v2 == (id)5)
  {
    v3 = objc_msgSend(a1, sel_multiArrayValue);
    if (v3)
    {
      v4 = v3;
      if (objc_msgSend(v3, sel_count) == (id)1)
      {
        v5 = objc_msgSend(v4, sel_objectAtIndexedSubscript_, 0);
        objc_msgSend(v5, sel_floatValue);

        return;
      }

    }
    if (qword_257589EA0 != -1)
      swift_once();
    v14 = sub_246529CB4();
    __swift_project_value_buffer(v14, (uint64_t)qword_25758BF70);
    v7 = a1;
    v8 = sub_246529C9C();
    v9 = sub_246529DEC();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v10 = 138412290;
      v15 = v7;
      sub_246529E04();
      *v11 = v7;

      v13 = "Feature value not scalar: %@";
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (v2 == (id)2)
  {
    objc_msgSend(a1, sel_doubleValue);
    return;
  }
  if (qword_257589EA0 != -1)
    swift_once();
  v6 = sub_246529CB4();
  __swift_project_value_buffer(v6, (uint64_t)qword_25758BF70);
  v7 = a1;
  v8 = sub_246529C9C();
  v9 = sub_246529DEC();
  if (!os_log_type_enabled(v8, v9))
    goto LABEL_19;
  v10 = (uint8_t *)swift_slowAlloc();
  v11 = (_QWORD *)swift_slowAlloc();
  *(_DWORD *)v10 = 138412290;
  v12 = v7;
  sub_246529E04();
  *v11 = v7;

  v13 = "Invalid feature value %@";
LABEL_18:
  _os_log_impl(&dword_246518000, v8, v9, v13, v10, 0xCu);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758A170);
  swift_arrayDestroy();
  MEMORY[0x24955D794](v11, -1, -1);
  MEMORY[0x24955D794](v10, -1, -1);

LABEL_20:
  sub_246527BD8();
  swift_allocError();
  *v16 = 3;
  swift_willThrow();
}

uint64_t sub_2465275EC(void *a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  char *v8;
  void **p_ivar_lyt;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;
  unint64_t v22;
  int64_t v23;
  unint64_t *v24;
  void *v25;
  id v26;
  unint64_t v27;
  float v28;
  char v29;
  float v30;
  float v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  char v40;
  float v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE *v52;
  uint64_t result;
  char *v54;
  char *v55;
  id v56;
  uint64_t v57;
  int64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;

  v4 = v1;
  isUniquelyReferenced_nonNull_native = sub_24651A844(MEMORY[0x24BEE4AF8]);
  v56 = a1;
  v7 = (unint64_t)objc_msgSend(a1, sel_count);
  if ((v7 & 0x8000000000000000) != 0)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  if (v7)
  {
    v8 = 0;
    p_ivar_lyt = &ModelTrainer.ivar_lyt;
    v54 = (char *)v7;
LABEL_4:
    if (v8 != (char *)v7)
    {
      v55 = v8 + 1;
      v59 = objc_msgSend(v56, (SEL)p_ivar_lyt[53]);
      v10 = objc_msgSend(v59, sel_featureNames);
      v11 = isUniquelyReferenced_nonNull_native;
      v12 = sub_246529DA4();

      v13 = 0;
      v14 = *(_QWORD *)(v12 + 56);
      v57 = v12 + 56;
      v60 = v12;
      v15 = *(_BYTE *)(v12 + 32);
      isUniquelyReferenced_nonNull_native = v11;
      v16 = 1 << v15;
      if (v16 < 64)
        v17 = ~(-1 << v16);
      else
        v17 = -1;
      v18 = v17 & v14;
      v58 = (unint64_t)(v16 + 63) >> 6;
      while (1)
      {
        if (v18)
        {
          v19 = __clz(__rbit64(v18));
          v18 &= v18 - 1;
          v20 = v19 | (v13 << 6);
        }
        else
        {
          v21 = __OFADD__(v13++, 1);
          if (v21)
            goto LABEL_55;
          if (v13 >= v58)
          {
LABEL_44:
            swift_unknownObjectRelease();
            swift_release();
            v7 = (unint64_t)v54;
            v8 = v55;
            p_ivar_lyt = (void **)(&ModelTrainer + 16);
            if (v55 != v54)
              goto LABEL_4;
            return isUniquelyReferenced_nonNull_native;
          }
          v22 = *(_QWORD *)(v57 + 8 * v13);
          if (!v22)
          {
            v23 = v13 + 1;
            if (v13 + 1 >= v58)
              goto LABEL_44;
            v22 = *(_QWORD *)(v57 + 8 * v23);
            if (!v22)
            {
              v23 = v13 + 2;
              if (v13 + 2 >= v58)
                goto LABEL_44;
              v22 = *(_QWORD *)(v57 + 8 * v23);
              if (!v22)
              {
                v23 = v13 + 3;
                if (v13 + 3 >= v58)
                  goto LABEL_44;
                v22 = *(_QWORD *)(v57 + 8 * v23);
                if (!v22)
                {
                  while (1)
                  {
                    v13 = v23 + 1;
                    if (__OFADD__(v23, 1))
                      goto LABEL_56;
                    if (v13 >= v58)
                      goto LABEL_44;
                    v22 = *(_QWORD *)(v57 + 8 * v13);
                    ++v23;
                    if (v22)
                      goto LABEL_23;
                  }
                }
              }
            }
            v13 = v23;
          }
LABEL_23:
          v18 = (v22 - 1) & v22;
          v20 = __clz(__rbit64(v22)) + (v13 << 6);
        }
        v24 = (unint64_t *)(*(_QWORD *)(v60 + 48) + 16 * v20);
        v2 = *v24;
        v3 = v24[1];
        swift_bridgeObjectRetain();
        v25 = (void *)sub_246529CFC();
        v26 = objc_msgSend(v59, sel_featureValueForName_, v25);

        if (!v26)
          break;
        if (*(_QWORD *)(isUniquelyReferenced_nonNull_native + 16))
        {
          swift_bridgeObjectRetain();
          v27 = sub_2465299CC(v2, v3);
          v28 = 0.0;
          if ((v29 & 1) != 0)
            v28 = *(float *)(*(_QWORD *)(isUniquelyReferenced_nonNull_native + 56) + 4 * v27);
          swift_bridgeObjectRelease();
        }
        else
        {
          v28 = 0.0;
        }
        sub_24652725C(v26);
        if (v4)
        {
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();

          swift_release();
          return isUniquelyReferenced_nonNull_native;
        }
        v31 = v30;
        v32 = isUniquelyReferenced_nonNull_native;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v61 = v32;
        v33 = v2;
        v2 = sub_2465299CC(v2, v3);
        v35 = *(_QWORD *)(v32 + 16);
        v36 = (v34 & 1) == 0;
        v37 = v35 + v36;
        if (__OFADD__(v35, v36))
        {
          __break(1u);
LABEL_54:
          __break(1u);
LABEL_55:
          __break(1u);
LABEL_56:
          __break(1u);
          goto LABEL_57;
        }
        v38 = v34;
        if (*(_QWORD *)(v32 + 24) >= v37)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            sub_24651D124();
        }
        else
        {
          sub_24651C9F4(v37, isUniquelyReferenced_nonNull_native);
          v39 = sub_2465299CC(v33, v3);
          if ((v38 & 1) != (v40 & 1))
          {
            result = sub_246529F60();
            __break(1u);
            return result;
          }
          v2 = v39;
        }
        v41 = v28 + v31;
        isUniquelyReferenced_nonNull_native = v61;
        if ((v38 & 1) != 0)
        {
          *(float *)(*(_QWORD *)(v61 + 56) + 4 * v2) = v41;
        }
        else
        {
          *(_QWORD *)(v61 + 8 * (v2 >> 6) + 64) |= 1 << v2;
          v42 = (uint64_t *)(*(_QWORD *)(isUniquelyReferenced_nonNull_native + 48) + 16 * v2);
          *v42 = v33;
          v42[1] = v3;
          *(float *)(*(_QWORD *)(isUniquelyReferenced_nonNull_native + 56) + 4 * v2) = v41;
          v43 = *(_QWORD *)(isUniquelyReferenced_nonNull_native + 16);
          v21 = __OFADD__(v43, 1);
          v44 = v43 + 1;
          if (v21)
            goto LABEL_54;
          *(_QWORD *)(isUniquelyReferenced_nonNull_native + 16) = v44;
          swift_bridgeObjectRetain();
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v4 = 0;
      }
      if (qword_257589EA0 != -1)
        goto LABEL_59;
      goto LABEL_47;
    }
LABEL_58:
    __break(1u);
LABEL_59:
    swift_once();
LABEL_47:
    v45 = sub_246529CB4();
    __swift_project_value_buffer(v45, (uint64_t)qword_25758BF70);
    swift_bridgeObjectRetain();
    v46 = sub_246529C9C();
    v47 = sub_246529DEC();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      v49 = isUniquelyReferenced_nonNull_native;
      v50 = swift_slowAlloc();
      v61 = v50;
      *(_DWORD *)v48 = 136315138;
      swift_bridgeObjectRetain();
      sub_2465292E0(v2, v3, &v61);
      sub_246529E04();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_246518000, v46, v47, "Couldn't find feature value for %s", v48, 0xCu);
      swift_arrayDestroy();
      v51 = v50;
      isUniquelyReferenced_nonNull_native = v49;
      MEMORY[0x24955D794](v51, -1, -1);
      MEMORY[0x24955D794](v48, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_246527BD8();
    swift_allocError();
    *v52 = 2;
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_release();
    swift_unknownObjectRelease();
  }
  return isUniquelyReferenced_nonNull_native;
}

unint64_t sub_246527BD8()
{
  unint64_t result;

  result = qword_25758A450;
  if (!qword_25758A450)
  {
    result = MEMORY[0x24955D710](&unk_24652A814, &type metadata for ModelTrainerError);
    atomic_store(result, (unint64_t *)&qword_25758A450);
  }
  return result;
}

unint64_t sub_246527C1C()
{
  unint64_t result;

  result = qword_25758A458;
  if (!qword_25758A458)
  {
    result = MEMORY[0x24955D710](&unk_24652AE34, &type metadata for ModelEvaluationMetricSpecs);
    atomic_store(result, (unint64_t *)&qword_25758A458);
  }
  return result;
}

unint64_t sub_246527C60()
{
  unint64_t result;

  result = qword_25758A468;
  if (!qword_25758A468)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25758A468);
  }
  return result;
}

unint64_t sub_246527C9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25758A470;
  if (!qword_25758A470)
  {
    v1 = sub_246529C0C();
    result = MEMORY[0x24955D710](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_25758A470);
  }
  return result;
}

uint64_t destroy for ModelEvaluationMetricSpecs()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ModelEvaluationMetricSpecs(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ModelEvaluationMetricSpecs(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ModelEvaluationMetricSpecs(uint64_t a1, uint64_t a2)
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
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ModelEvaluationMetricSpecs(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 33))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ModelEvaluationMetricSpecs(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 33) = 1;
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
    *(_BYTE *)(result + 33) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ModelEvaluationMetricSpecs()
{
  return &type metadata for ModelEvaluationMetricSpecs;
}

unint64_t sub_246527EC4()
{
  unint64_t result;

  result = qword_25758A478;
  if (!qword_25758A478)
  {
    result = MEMORY[0x24955D710](&unk_24652AE0C, &type metadata for ModelEvaluationMetricSpecs);
    atomic_store(result, (unint64_t *)&qword_25758A478);
  }
  return result;
}

uint64_t sub_246527F08()
{
  unint64_t v0;

  v0 = sub_246529EAC();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_246527F50@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t result;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  unsigned __int8 v23;
  char v24;
  char v25;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758A480);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2465281C8();
  sub_246529FCC();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  v25 = 0;
  v9 = sub_246529EB8();
  v11 = v10;
  v24 = 1;
  swift_bridgeObjectRetain();
  v12 = sub_246529EB8();
  v14 = v13;
  v19 = v12;
  v22 = 2;
  sub_24652820C();
  swift_bridgeObjectRetain();
  v20 = v14;
  sub_246529EDC();
  v18 = v23;
  v21 = 3;
  sub_246528250();
  sub_246529EDC();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  v15 = v20;
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_QWORD *)(a2 + 16) = v19;
  *(_QWORD *)(a2 + 24) = v15;
  *(_BYTE *)(a2 + 32) = v18;
  return result;
}

unint64_t sub_2465281C8()
{
  unint64_t result;

  result = qword_25758A488;
  if (!qword_25758A488)
  {
    result = MEMORY[0x24955D710](&unk_24652B17C, &type metadata for ModelEvaluationMetricSpecs.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25758A488);
  }
  return result;
}

unint64_t sub_24652820C()
{
  unint64_t result;

  result = qword_25758A490;
  if (!qword_25758A490)
  {
    result = MEMORY[0x24955D710](&unk_24652B154, &type metadata for ModelEvaluationMetricType);
    atomic_store(result, (unint64_t *)&qword_25758A490);
  }
  return result;
}

unint64_t sub_246528250()
{
  unint64_t result;

  result = qword_25758A498;
  if (!qword_25758A498)
  {
    result = MEMORY[0x24955D710](&unk_24652B12C, &type metadata for MetricEncoding);
    atomic_store(result, (unint64_t *)&qword_25758A498);
  }
  return result;
}

unint64_t sub_246528294()
{
  unint64_t result;

  result = qword_25758A4A8;
  if (!qword_25758A4A8)
  {
    result = MEMORY[0x24955D710](&unk_24652B104, &type metadata for ModelEvaluationMetricType);
    atomic_store(result, (unint64_t *)&qword_25758A4A8);
  }
  return result;
}

unint64_t sub_2465282D8()
{
  unint64_t result;

  result = qword_25758A4B0;
  if (!qword_25758A4B0)
  {
    result = MEMORY[0x24955D710](&unk_24652B0DC, &type metadata for MetricEncoding);
    atomic_store(result, (unint64_t *)&qword_25758A4B0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ModelEvaluationMetricSpecs.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ModelEvaluationMetricSpecs.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2465283F8 + 4 * byte_24652AD61[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24652842C + 4 * byte_24652AD5C[v4]))();
}

uint64_t sub_24652842C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246528434(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24652843CLL);
  return result;
}

uint64_t sub_246528448(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246528450);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_246528454(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24652845C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ModelEvaluationMetricSpecs.CodingKeys()
{
  return &type metadata for ModelEvaluationMetricSpecs.CodingKeys;
}

uint64_t getEnumTagSinglePayload for MetricEncoding(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for MetricEncoding(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24652850C + 4 * byte_24652AD66[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24652852C + 4 * byte_24652AD6B[v4]))();
}

_BYTE *sub_24652850C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24652852C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246528534(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24652853C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246528544(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24652854C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_246528558()
{
  return 0;
}

ValueMetadata *type metadata accessor for MetricEncoding()
{
  return &type metadata for MetricEncoding;
}

uint64_t storeEnumTagSinglePayload for ModelEvaluationMetricType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2465285BC + 4 * byte_24652AD75[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2465285F0 + 4 * byte_24652AD70[v4]))();
}

uint64_t sub_2465285F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2465285F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246528600);
  return result;
}

uint64_t sub_24652860C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246528614);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246528618(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246528620(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ModelEvaluationMetricType()
{
  return &type metadata for ModelEvaluationMetricType;
}

unint64_t sub_246528640()
{
  unint64_t result;

  result = qword_25758A4B8;
  if (!qword_25758A4B8)
  {
    result = MEMORY[0x24955D710](&unk_24652AF24, &type metadata for ModelEvaluationMetricType);
    atomic_store(result, (unint64_t *)&qword_25758A4B8);
  }
  return result;
}

unint64_t sub_246528688()
{
  unint64_t result;

  result = qword_25758A4C0;
  if (!qword_25758A4C0)
  {
    result = MEMORY[0x24955D710](&unk_24652AFC4, &type metadata for MetricEncoding);
    atomic_store(result, (unint64_t *)&qword_25758A4C0);
  }
  return result;
}

unint64_t sub_2465286D0()
{
  unint64_t result;

  result = qword_25758A4C8;
  if (!qword_25758A4C8)
  {
    result = MEMORY[0x24955D710](&unk_24652B0B4, &type metadata for ModelEvaluationMetricSpecs.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25758A4C8);
  }
  return result;
}

unint64_t sub_246528718()
{
  unint64_t result;

  result = qword_25758A4D0;
  if (!qword_25758A4D0)
  {
    result = MEMORY[0x24955D710](&unk_24652AFEC, &type metadata for ModelEvaluationMetricSpecs.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25758A4D0);
  }
  return result;
}

unint64_t sub_246528760()
{
  unint64_t result;

  result = qword_25758A4D8;
  if (!qword_25758A4D8)
  {
    result = MEMORY[0x24955D710](&unk_24652B014, &type metadata for ModelEvaluationMetricSpecs.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25758A4D8);
  }
  return result;
}

unint64_t sub_2465287A4()
{
  unint64_t result;

  result = qword_25758A4E0;
  if (!qword_25758A4E0)
  {
    result = MEMORY[0x24955D710](&unk_24652AEAC, &type metadata for ModelEvaluationMetricType);
    atomic_store(result, (unint64_t *)&qword_25758A4E0);
  }
  return result;
}

unint64_t sub_2465287E8()
{
  unint64_t result;

  result = qword_25758A4E8;
  if (!qword_25758A4E8)
  {
    result = MEMORY[0x24955D710](&unk_24652AF4C, &type metadata for MetricEncoding);
    atomic_store(result, (unint64_t *)&qword_25758A4E8);
  }
  return result;
}

void sub_24652882C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20[2];

  v3 = v2;
  v20[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)sub_246529DC8();
  v7 = objc_msgSend(v6, sel_error);
  if (v7)
  {

    if (qword_257589EA0 != -1)
      swift_once();
    v8 = sub_246529CB4();
    __swift_project_value_buffer(v8, (uint64_t)qword_25758BF70);
    v9 = v6;
    swift_bridgeObjectRetain_n();
    v10 = v9;
    v11 = sub_246529C9C();
    v12 = sub_246529DEC();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc();
      v14 = (_QWORD *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v20[0] = v19;
      *(_DWORD *)v13 = 136315394;
      swift_bridgeObjectRetain();
      sub_2465292E0(a1, a2, v20);
      sub_246529E04();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v13 + 12) = 2112;
      if (objc_msgSend(v10, sel_error))
      {
        v15 = _swift_stdlib_bridgeErrorToNSError();
        sub_246529E04();
      }
      else
      {
        sub_246529E04();
        v15 = 0;
      }
      *v14 = v15;

      _os_log_impl(&dword_246518000, v11, v12, "Error executing %s in Biome: %@", (uint8_t *)v13, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25758A170);
      swift_arrayDestroy();
      MEMORY[0x24955D794](v14, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24955D794](v19, -1, -1);
      MEMORY[0x24955D794](v13, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v17 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = 0;

    sub_24652929C();
    swift_allocError();
    *v18 = 0;
    swift_willThrow();

  }
  else
  {
    v16 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v6;

  }
}

NSObject *sub_246528B64()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  os_log_type_t v16;
  uint8_t *v17;
  _BYTE *v18;
  _BYTE *v19;
  uint64_t v21;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    v2 = objc_msgSend(v1, sel_error);
    if (v2)
    {
      v3 = v2;
      if (qword_257589EA0 != -1)
        swift_once();
      v4 = sub_246529CB4();
      __swift_project_value_buffer(v4, (uint64_t)qword_25758BF70);
      v5 = v3;
      v6 = sub_246529C9C();
      v7 = sub_246529DEC();
      if (os_log_type_enabled(v6, v7))
      {
        v8 = (uint8_t *)swift_slowAlloc();
        v9 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v8 = 138412290;
        v10 = v5;
        v21 = _swift_stdlib_bridgeErrorToNSError();
        sub_246529E04();
        *v9 = v21;

        _os_log_impl(&dword_246518000, v6, v7, "Error in fetching row: %@", v8, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25758A170);
        swift_arrayDestroy();
        MEMORY[0x24955D794](v9, -1, -1);
        MEMORY[0x24955D794](v8, -1, -1);

      }
      else
      {

      }
      sub_24652929C();
      swift_allocError();
      *v19 = 0;
      swift_willThrow();

      return v5;
    }
    v11 = *(void **)(v0 + 16);
    if (v11)
    {
      v12 = objc_msgSend(v11, sel_row);
      if (v12)
      {
        v13 = v12;
        v14 = sub_246529CE4();

        v5 = sub_246528E90(v14);
        swift_bridgeObjectRelease();
        if (v5)
          return v5;
      }
    }
  }
  if (qword_257589EA0 != -1)
    swift_once();
  v15 = sub_246529CB4();
  __swift_project_value_buffer(v15, (uint64_t)qword_25758BF70);
  v5 = sub_246529C9C();
  v16 = sub_246529DE0();
  if (os_log_type_enabled(v5, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_246518000, v5, v16, "Row cannot be converted into SiriPrivateLearningPFLBiomeSQLRow", v17, 2u);
    MEMORY[0x24955D794](v17, -1, -1);
  }

  sub_24652929C();
  swift_allocError();
  *v18 = 1;
  swift_willThrow();
  return v5;
}

unint64_t sub_246528E90(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t result;
  int64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  __int128 v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  __int128 v24;
  _OWORD v25[2];
  _OWORD v26[2];
  __int128 v27;
  _OWORD v28[2];
  _OWORD v29[2];
  _OWORD v30[2];
  _OWORD v31[2];
  uint64_t v32;
  _OWORD v33[2];
  _OWORD v34[2];
  uint64_t v35;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25758A190);
    v2 = (_QWORD *)sub_246529E94();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v23 = a1 + 64;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(a1 + 64);
  v22 = (unint64_t)(63 - v4) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    if (v5)
    {
      v10 = (v5 - 1) & v5;
      v11 = __clz(__rbit64(v5)) | (v7 << 6);
      v12 = v7;
    }
    else
    {
      v13 = v7 + 1;
      if (__OFADD__(v7, 1))
        goto LABEL_37;
      if (v13 >= v22)
      {
LABEL_33:
        sub_24651E724();
        return (unint64_t)v2;
      }
      v14 = *(_QWORD *)(v23 + 8 * v13);
      v12 = v7 + 1;
      if (!v14)
      {
        v12 = v7 + 2;
        if (v7 + 2 >= v22)
          goto LABEL_33;
        v14 = *(_QWORD *)(v23 + 8 * v12);
        if (!v14)
        {
          v12 = v7 + 3;
          if (v7 + 3 >= v22)
            goto LABEL_33;
          v14 = *(_QWORD *)(v23 + 8 * v12);
          if (!v14)
          {
            v12 = v7 + 4;
            if (v7 + 4 >= v22)
              goto LABEL_33;
            v14 = *(_QWORD *)(v23 + 8 * v12);
            if (!v14)
            {
              v15 = v7 + 5;
              if (v7 + 5 >= v22)
                goto LABEL_33;
              v14 = *(_QWORD *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  v12 = v15 + 1;
                  if (__OFADD__(v15, 1))
                    goto LABEL_38;
                  if (v12 >= v22)
                    goto LABEL_33;
                  v14 = *(_QWORD *)(v23 + 8 * v12);
                  ++v15;
                  if (v14)
                    goto LABEL_26;
                }
              }
              v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      v10 = (v14 - 1) & v14;
      v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_246529920(*(_QWORD *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_24651E76C(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_246529920((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_24652995C((uint64_t)v30);
      swift_bridgeObjectRelease();
      sub_24651E724();
      swift_release();
      return 0;
    }
    sub_24651E76C((uint64_t)v31 + 8, (uint64_t)v25);
    sub_24652995C((uint64_t)v30);
    sub_24651E048(v25, v26);
    v27 = v24;
    sub_24651E048(v26, v28);
    v16 = v27;
    sub_24651E048(v28, v29);
    sub_24651E048(v29, &v27);
    result = sub_2465299CC(v16, *((uint64_t *)&v16 + 1));
    v17 = result;
    if ((v18 & 1) != 0)
    {
      v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v8 = v16;
      v9 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v9);
      result = (unint64_t)sub_24651E048(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    result = (unint64_t)sub_24651E048(&v27, (_OWORD *)(v2[7] + 32 * result));
    v19 = v2[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_36;
    v2[2] = v21;
LABEL_8:
    v7 = v12;
    v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_246529250()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BiomeSQLClient()
{
  return objc_opt_self();
}

unint64_t sub_24652929C()
{
  unint64_t result;

  result = qword_25758A5D0;
  if (!qword_25758A5D0)
  {
    result = MEMORY[0x24955D710](&unk_24652A8D4, &type metadata for BiomeSQLClientError);
    atomic_store(result, (unint64_t *)&qword_25758A5D0);
  }
  return result;
}

uint64_t sub_2465292E0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2465293B0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24651E76C((uint64_t)v12, *a3);
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
      sub_24651E76C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_2465293B0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_246529E10();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_246529568(a5, a6);
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
  v8 = sub_246529E64();
  if (!v8)
  {
    sub_246529E70();
    __break(1u);
LABEL_17:
    result = sub_246529EA0();
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

uint64_t sub_246529568(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2465295FC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2465297D4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2465297D4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2465295FC(uint64_t a1, unint64_t a2)
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
      v3 = sub_246529770(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_246529E58();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_246529E70();
      __break(1u);
LABEL_10:
      v2 = sub_246529D14();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_246529EA0();
    __break(1u);
LABEL_14:
    result = sub_246529E70();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_246529770(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25758A5E0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2465297D4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25758A5E0);
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
  result = sub_246529EA0();
  __break(1u);
  return result;
}

uint64_t sub_246529920(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_24652995C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758A5D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24652999C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_246529F9C();
  return sub_246529A30(a1, v2);
}

unint64_t sub_2465299CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_246529FA8();
  sub_246529D08();
  v4 = sub_246529FC0();
  return sub_246529ACC(a1, a2, v4);
}

unint64_t sub_246529A30(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_246529ACC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_246529F48() & 1) == 0)
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
      while (!v14 && (sub_246529F48() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_246529BAC()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_246529BB8()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_246529BC4()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_246529BD0()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_246529BDC()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_246529BE8()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_246529BF4()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_246529C00()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_246529C0C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_246529C18()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_246529C24()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_246529C30()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_246529C3C()
{
  return MEMORY[0x24BE789F0]();
}

uint64_t sub_246529C48()
{
  return MEMORY[0x24BE789F8]();
}

uint64_t sub_246529C54()
{
  return MEMORY[0x24BE78A08]();
}

uint64_t sub_246529C60()
{
  return MEMORY[0x24BE78A10]();
}

uint64_t sub_246529C6C()
{
  return MEMORY[0x24BE78A18]();
}

uint64_t sub_246529C78()
{
  return MEMORY[0x24BE78B08]();
}

uint64_t sub_246529C84()
{
  return MEMORY[0x24BE78B10]();
}

uint64_t sub_246529C90()
{
  return MEMORY[0x24BE78B18]();
}

uint64_t sub_246529C9C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_246529CA8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_246529CB4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_246529CC0()
{
  return MEMORY[0x24BEE0228]();
}

uint64_t sub_246529CCC()
{
  return MEMORY[0x24BEE0240]();
}

uint64_t sub_246529CD8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_246529CE4()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_246529CF0()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_246529CFC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_246529D08()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_246529D14()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_246529D20()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_246529D2C()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_246529D38()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_246529D44()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_246529D50()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_246529D5C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_246529D68()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_246529D74()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_246529D80()
{
  return MEMORY[0x24BEE1278]();
}

uint64_t sub_246529D8C()
{
  return MEMORY[0x24BDCFC78]();
}

uint64_t sub_246529D98()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_246529DA4()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_246529DB0()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_246529DBC()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_246529DC8()
{
  return MEMORY[0x24BE0CA88]();
}

uint64_t sub_246529DD4()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_246529DE0()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_246529DEC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_246529DF8()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_246529E04()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_246529E10()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_246529E1C()
{
  return MEMORY[0x24BEE2068]();
}

uint64_t sub_246529E28()
{
  return MEMORY[0x24BEE2070]();
}

uint64_t sub_246529E34()
{
  return MEMORY[0x24BEE2078]();
}

uint64_t sub_246529E40()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_246529E4C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_246529E58()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_246529E64()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_246529E70()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_246529E7C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_246529E88()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_246529E94()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_246529EA0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_246529EAC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_246529EB8()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_246529EC4()
{
  return MEMORY[0x24BEE3368]();
}

uint64_t sub_246529ED0()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_246529EDC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_246529EE8()
{
  return MEMORY[0x24BEE33B8]();
}

uint64_t sub_246529EF4()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_246529F00()
{
  return MEMORY[0x24BEE34B8]();
}

uint64_t sub_246529F0C()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_246529F18()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_246529F24()
{
  return MEMORY[0x24BEE3508]();
}

uint64_t sub_246529F30()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_246529F3C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_246529F48()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_246529F54()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_246529F60()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_246529F6C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_246529F78()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_246529F84()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_246529F90()
{
  return MEMORY[0x24BEE3F18]();
}

uint64_t sub_246529F9C()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_246529FA8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_246529FB4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_246529FC0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_246529FCC()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_246529FD8()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_246529FE4()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_246529FF0()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

