uint64_t sub_10006B7E0()
{
  uint64_t v0;

  sub_10004CB6C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  sub_100003C60(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_BYTE *)(v0 + 56));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 64));
  return swift_deallocObject(v0, 73, 7);
}

uint64_t sub_10006B81C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a2);
  else
    return swift_bridgeObjectRetain(a1);
}

uint64_t sub_10006B82C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005104(&qword_1000B9BC8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10006B86C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005104(&qword_1000B9BC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10006B8B4()
{
  unint64_t result;

  result = qword_1000B9BD0;
  if (!qword_1000B9BD0)
  {
    result = swift_getWitnessTable(&unk_10009A014, &type metadata for HelpRequested);
    atomic_store(result, (unint64_t *)&qword_1000B9BD0);
  }
  return result;
}

uint64_t sub_10006B8F8(uint64_t a1)
{
  sub_10006B948(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return a1;
}

uint64_t sub_10006B948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  if ((a6 & 0x7FFFFFFFFFFFFF3ELL) != 0x7FFFFFF3ELL)
    return sub_100066ED8(a4, a5, a6, a7, a8);
  return result;
}

unint64_t sub_10006B97C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000B9BE0;
  if (!qword_1000B9BE0)
  {
    v1 = type metadata accessor for ArgumentDecoder();
    result = swift_getWitnessTable(&unk_1000994FC, v1);
    atomic_store(result, (unint64_t *)&qword_1000B9BE0);
  }
  return result;
}

_QWORD *sub_10006B9C4(_QWORD *result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result[3] - 8);
  if ((*(_DWORD *)(v1 + 80) & 0x20000) != 0)
    return (_QWORD *)swift_slowDealloc(*result, *(_QWORD *)(v1 + 64)+ ((*(_DWORD *)(v1 + 80) + 16) & ~(unint64_t)*(_DWORD *)(v1 + 80)), *(_DWORD *)(v1 + 80) | 7);
  return result;
}

unint64_t sub_10006B9F8()
{
  unint64_t result;

  result = qword_1000B9BE8;
  if (!qword_1000B9BE8)
  {
    result = swift_getWitnessTable(&unk_100099FF8, &type metadata for GenerateCompletions);
    atomic_store(result, (unint64_t *)&qword_1000B9BE8);
  }
  return result;
}

unint64_t sub_10006BA3C()
{
  unint64_t result;

  result = qword_1000B9BF0;
  if (!qword_1000B9BF0)
  {
    result = swift_getWitnessTable(&unk_100099FDC, &type metadata for AutodetectedGenerateCompletions);
    atomic_store(result, (unint64_t *)&qword_1000B9BF0);
  }
  return result;
}

uint64_t sub_10006BA80(uint64_t a1)
{
  sub_10002D820(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  return a1;
}

uint64_t sub_10006BAB0(uint64_t a1)
{
  sub_10002D9A0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  return a1;
}

void sub_10006BAE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v5;

  if (!qword_1000B9BF8)
  {
    v4 = _s19InitializationErrorOMa(0, a2, a3, a4);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1000B9BF8);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for AutodetectedGenerateCompletions(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_10006BB9C(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t))sub_100003B00);
}

uint64_t destroy for AutodetectedGenerateCompletions(uint64_t a1)
{
  return sub_100003C60(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t *assignWithCopy for AutodetectedGenerateCompletions(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_10006BBF8(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t))sub_100003B00, (void (*)(uint64_t, uint64_t, uint64_t))sub_100003C60);
}

uint64_t *assignWithTake for AutodetectedGenerateCompletions(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_10006BC64(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_100003C60);
}

ValueMetadata *type metadata accessor for AutodetectedGenerateCompletions()
{
  return &type metadata for AutodetectedGenerateCompletions;
}

uint64_t initializeBufferWithCopyOfBuffer for GenerateCompletions(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_10006BB9C(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t))sub_100003AF0);
}

uint64_t destroy for GenerateCompletions(uint64_t a1)
{
  return sub_100003C50(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_10006BB9C(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(_QWORD, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *a2;
  v6 = a2[1];
  v7 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v6, v7);
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = v7;
  return a1;
}

uint64_t *assignWithCopy for GenerateCompletions(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_10006BBF8(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t))sub_100003AF0, (void (*)(uint64_t, uint64_t, uint64_t))sub_100003C50);
}

uint64_t *sub_10006BBF8(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(_QWORD, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = *a2;
  v8 = a2[1];
  v9 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v8, v9);
  v10 = *a1;
  v11 = a1[1];
  v12 = *((unsigned __int8 *)a1 + 16);
  *a1 = v7;
  a1[1] = v8;
  *((_BYTE *)a1 + 16) = v9;
  a5(v10, v11, v12);
  return a1;
}

uint64_t *assignWithTake for GenerateCompletions(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_10006BC64(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_100003C50);
}

uint64_t *sub_10006BC64(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_BYTE *)(a2 + 16);
  v6 = *a1;
  v7 = a1[1];
  v8 = *((unsigned __int8 *)a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_BYTE *)a1 + 16) = v5;
  a4(v6, v7, v8);
  return a1;
}

ValueMetadata *type metadata accessor for GenerateCompletions()
{
  return &type metadata for GenerateCompletions;
}

uint64_t storeEnumTagSinglePayload for HelpRequested(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10006BD04 + 4 * byte_100099E99[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10006BD38 + 4 * byte_100099E94[v4]))();
}

uint64_t sub_10006BD38(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10006BD40(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10006BD48);
  return result;
}

uint64_t sub_10006BD54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10006BD5CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_10006BD60(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10006BD68(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HelpRequested()
{
  return &type metadata for HelpRequested;
}

unint64_t sub_10006BD84(uint64_t a1)
{
  unint64_t result;

  result = sub_10006BDA8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10006BDA8()
{
  unint64_t result;

  result = qword_1000B9C00;
  if (!qword_1000B9C00)
  {
    result = swift_getWitnessTable(&unk_100099F54, &type metadata for GenerateCompletions);
    atomic_store(result, (unint64_t *)&qword_1000B9C00);
  }
  return result;
}

unint64_t sub_10006BDEC(uint64_t a1)
{
  unint64_t result;

  result = sub_10006BE10();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10006BE10()
{
  unint64_t result;

  result = qword_1000B9C08;
  if (!qword_1000B9C08)
  {
    result = swift_getWitnessTable(&unk_100099F98, &type metadata for AutodetectedGenerateCompletions);
    atomic_store(result, (unint64_t *)&qword_1000B9C08);
  }
  return result;
}

unint64_t sub_10006BE54(uint64_t a1)
{
  unint64_t result;

  result = sub_10006BE78();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10006BE78()
{
  unint64_t result;

  result = qword_1000B9C10;
  if (!qword_1000B9C10)
  {
    result = swift_getWitnessTable(&unk_100099FC0, &type metadata for AutodetectedGenerateCompletions);
    atomic_store(result, (unint64_t *)&qword_1000B9C10);
  }
  return result;
}

unint64_t sub_10006BEBC(uint64_t a1)
{
  unint64_t result;

  result = sub_10006BEE0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10006BEE0()
{
  unint64_t result;

  result = qword_1000B9C18;
  if (!qword_1000B9C18)
  {
    result = swift_getWitnessTable(&unk_100099F7C, &type metadata for GenerateCompletions);
    atomic_store(result, (unint64_t *)&qword_1000B9C18);
  }
  return result;
}

uint64_t sub_10006BF24()
{
  _QWORD *v0;
  uint64_t v1;

  swift_bridgeObjectRelease(v0[2]);
  v1 = v0[5];
  if (v1)
  {
    swift_bridgeObjectRelease(v1);
    swift_bridgeObjectRelease(v0[7]);
    swift_bridgeObjectRelease(v0[9]);
  }
  return swift_deallocObject(v0, 81, 7);
}

unint64_t sub_10006BF64()
{
  unint64_t result;

  result = qword_1000B9C28;
  if (!qword_1000B9C28)
  {
    result = swift_getWitnessTable(&unk_10009A220, &type metadata for AutodetectedGenerateCompletions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9C28);
  }
  return result;
}

uint64_t sub_10006BFA8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  v1 = *(_QWORD *)(v0 + 32);
  if (v1)
  {
    swift_bridgeObjectRelease(v1);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 64));
  }
  v2 = *(unsigned __int8 *)(v0 + 96);
  if (v2 != 255)
    sub_10002D9A0(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88), v2);
  return swift_deallocObject(v0, 97, 7);
}

uint64_t sub_10006BFFC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1000678F4(a1, a2, a3, *(_QWORD *)(v3 + 16), (uint64_t *)(v3 + 24), *(_BYTE *)(v3 + 73), *(_QWORD *)(v3 + 80), *(_QWORD *)(v3 + 88), *(_BYTE *)(v3 + 96));
}

uint64_t sub_10006C030()
{
  _QWORD *v0;

  swift_release(v0[3]);
  swift_bridgeObjectRelease(v0[5]);
  swift_bridgeObjectRelease(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

_QWORD *sub_10006C064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  return sub_100079BE4(a1, a2, a3, a4, a5, a6, a7, *(_QWORD *(**)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16), *(_QWORD *)(v7 + 24), *(_QWORD *)(v7 + 32), *(_QWORD *)(v7 + 40), *(_QWORD *)(v7 + 48));
}

uint64_t sub_10006C094()
{
  _QWORD *v0;
  unint64_t v1;

  v1 = v0[2];
  if (v1 >= 2)
    swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(v0[4]);
  swift_bridgeObjectRelease(v0[6]);
  swift_bridgeObjectRelease(v0[7]);
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10006C0D8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_100079F3C(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t sub_10006C0F8(uint64_t result, uint64_t a2, char a3)
{
  if (a3 != -1)
    return sub_10002D9A0(result, a2, a3);
  return result;
}

unint64_t sub_10006C10C()
{
  unint64_t result;

  result = qword_1000B9C48;
  if (!qword_1000B9C48)
  {
    result = swift_getWitnessTable(&unk_10009A1D0, &type metadata for GenerateCompletions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9C48);
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerateCompletions.CodingKeys()
{
  return &type metadata for GenerateCompletions.CodingKeys;
}

uint64_t _s14ArgumentParser19GenerateCompletionsV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_10006C1A8 + 4 * byte_100099E9E[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_10006C1C8 + 4 * byte_100099EA3[v4]))();
}

_BYTE *sub_10006C1A8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_10006C1C8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10006C1D0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10006C1D8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10006C1E0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10006C1E8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AutodetectedGenerateCompletions.CodingKeys()
{
  return &type metadata for AutodetectedGenerateCompletions.CodingKeys;
}

unint64_t sub_10006C208()
{
  unint64_t result;

  result = qword_1000B9C60;
  if (!qword_1000B9C60)
  {
    result = swift_getWitnessTable(&unk_10009A0F0, &type metadata for AutodetectedGenerateCompletions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9C60);
  }
  return result;
}

unint64_t sub_10006C250()
{
  unint64_t result;

  result = qword_1000B9C68;
  if (!qword_1000B9C68)
  {
    result = swift_getWitnessTable(&unk_10009A1A8, &type metadata for GenerateCompletions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9C68);
  }
  return result;
}

unint64_t sub_10006C298()
{
  unint64_t result;

  result = qword_1000B9C70;
  if (!qword_1000B9C70)
  {
    result = swift_getWitnessTable(&unk_10009A118, &type metadata for GenerateCompletions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9C70);
  }
  return result;
}

unint64_t sub_10006C2E0()
{
  unint64_t result;

  result = qword_1000B9C78;
  if (!qword_1000B9C78)
  {
    result = swift_getWitnessTable(&unk_10009A140, &type metadata for GenerateCompletions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9C78);
  }
  return result;
}

unint64_t sub_10006C328()
{
  unint64_t result;

  result = qword_1000B9C80;
  if (!qword_1000B9C80)
  {
    result = swift_getWitnessTable(&unk_10009A060, &type metadata for AutodetectedGenerateCompletions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9C80);
  }
  return result;
}

unint64_t sub_10006C370()
{
  unint64_t result;

  result = qword_1000B9C88;
  if (!qword_1000B9C88)
  {
    result = swift_getWitnessTable(&unk_10009A088, &type metadata for AutodetectedGenerateCompletions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9C88);
  }
  return result;
}

void sub_10006C3BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  Swift::UInt v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  swift_bridgeObjectRetain(a3);
  String.hash(into:)(a1, a2, a3);
  swift_bridgeObjectRelease(a3);
  v8 = *(_QWORD *)(a4 + 16);
  Hasher._combine(_:)(v8);
  if (v8)
  {
    swift_bridgeObjectRetain(a4);
    v9 = (_QWORD *)(a4 + 40);
    do
    {
      v10 = *(v9 - 1);
      v11 = *v9;
      swift_bridgeObjectRetain(*v9);
      String.hash(into:)(a1, v10, v11);
      swift_bridgeObjectRelease(v11);
      v9 += 2;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease(a4);
  }
}

Swift::Int sub_10006C478()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[9];

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  Hasher.init(_seed:)(v5, 0);
  sub_10006C3BC((uint64_t)v5, v1, v2, v3);
  return Hasher._finalize()();
}

void sub_10006C4D0(uint64_t a1)
{
  uint64_t *v1;

  sub_10006C3BC(a1, *v1, v1[1], v1[2]);
}

Swift::Int sub_10006C4DC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v2 = *v1;
  v3 = v1[1];
  v4 = v1[2];
  Hasher.init(_seed:)(v6, a1);
  sub_10006C3BC((uint64_t)v6, v2, v3, v4);
  return Hasher._finalize()();
}

uint64_t sub_10006C530(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  BOOL v9;

  v4 = *a1;
  v5 = a1[1];
  v6 = (_QWORD *)a1[2];
  v7 = a2[1];
  v8 = (_QWORD *)a2[2];
  v9 = v4 == *a2 && v5 == v7;
  if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, *a2, v7, 0) & 1) != 0)
    return sub_100057670(v6, v8);
  else
    return 0;
}

uint64_t sub_10006C590(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  swift_bridgeObjectRetain_n(a2, 2);
  v6 = swift_bridgeObjectRetain(a3);
  if ((swift_isUniquelyReferenced_nonNull_native(v6) & 1) == 0)
    a3 = sub_100057AB8(0, *((_QWORD *)a3 + 2) + 1, 1, a3);
  v8 = *((_QWORD *)a3 + 2);
  v7 = *((_QWORD *)a3 + 3);
  if (v8 >= v7 >> 1)
    a3 = sub_100057AB8((char *)(v7 > 1), v8 + 1, 1, a3);
  *((_QWORD *)a3 + 2) = v8 + 1;
  v9 = &a3[16 * v8];
  *((_QWORD *)v9 + 4) = a1;
  *((_QWORD *)v9 + 5) = a2;
  swift_bridgeObjectRelease(a2);
  v10 = sub_100005104(&qword_1000B90C8);
  v11 = sub_10005EC18();
  v12 = BidirectionalCollection<>.joined(separator:)(46, 0xE100000000000000, v10, v11);
  swift_bridgeObjectRelease(a3);
  return v12;
}

uint64_t sub_10006C694()
{
  uint64_t v0;

  return sub_10006C590(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(char **)(v0 + 16));
}

uint64_t sub_10006C6A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;

  v7 = *(_QWORD *)(a3 - 8);
  __chkstk_darwin(a1);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 32))(v9);
  v10 = dispatch thunk of CodingKey.stringValue.getter(a3, a4);
  v12 = v10;
  v13 = *(_QWORD *)(a2 + 16);
  if (v13)
  {
    v25 = v11;
    v26 = v10;
    v28 = v7;
    v32 = _swiftEmptyArrayStorage;
    sub_10004FDF4(0, v13, 0);
    v27 = a2;
    v14 = a2 + 32;
    v15 = v32;
    do
    {
      sub_100033F10(v14, (uint64_t)v29);
      v16 = v30;
      v17 = v31;
      sub_100006270(v29, v30);
      v18 = dispatch thunk of CodingKey.stringValue.getter(v16, v17);
      v20 = v19;
      sub_1000062D8(v29);
      if ((swift_isUniquelyReferenced_nonNull_native(v15) & 1) == 0)
      {
        sub_10004FDF4(0, v15[2] + 1, 1);
        v15 = v32;
      }
      v22 = v15[2];
      v21 = v15[3];
      if (v22 >= v21 >> 1)
      {
        sub_10004FDF4((char *)(v21 > 1), v22 + 1, 1);
        v15 = v32;
      }
      v15[2] = v22 + 1;
      v23 = &v15[2 * v22];
      v23[4] = v18;
      v23[5] = v20;
      v14 += 40;
      --v13;
    }
    while (v13);
    swift_bridgeObjectRelease(v27);
    v7 = v28;
    v12 = v26;
  }
  else
  {
    swift_bridgeObjectRelease(a2);
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a3);
  return v12;
}

uint64_t sub_10006C86C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;

  swift_bridgeObjectRetain(a2);
  v10 = sub_10005141C(a1, a2);
  v12 = v11;
  swift_bridgeObjectRelease(a2);
  if (v12)
  {
    if (v10 == 95 && v12 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease(0xE100000000000000);
    }
    else
    {
      v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, v12, 95, 0xE100000000000000, 0);
      swift_bridgeObjectRelease(v12);
      if ((v13 & 1) == 0)
        goto LABEL_7;
    }
    v14 = sub_100033710(1uLL, a1, a2);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    swift_bridgeObjectRelease(a2);
    a1 = static String._fromSubstring(_:)(v14, v16, v18, v20);
    swift_bridgeObjectRelease(v20);
  }
LABEL_7:
  if (a4)
  {
    swift_bridgeObjectRetain(a4);
    v21 = swift_bridgeObjectRetain(a5);
    v22 = (char *)a5;
    if ((swift_isUniquelyReferenced_nonNull_native(v21) & 1) == 0)
      v22 = sub_100057AB8(0, *(_QWORD *)(a5 + 16) + 1, 1, (char *)a5);
    v24 = *((_QWORD *)v22 + 2);
    v23 = *((_QWORD *)v22 + 3);
    if (v24 >= v23 >> 1)
      v22 = sub_100057AB8((char *)(v23 > 1), v24 + 1, 1, v22);
    *((_QWORD *)v22 + 2) = v24 + 1;
    v25 = &v22[16 * v24];
    *((_QWORD *)v25 + 4) = a3;
    *((_QWORD *)v25 + 5) = a4;
    swift_bridgeObjectRelease(a5);
    swift_bridgeObjectRelease(a4);
  }
  return a1;
}

uint64_t destroy for InputKey(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
}

_QWORD *_s14ArgumentParser8InputKeyVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

_QWORD *assignWithCopy for InputKey(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = a2[2];
  v7 = a1[2];
  a1[2] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

__n128 initializeWithTake for InputKey(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

_QWORD *assignWithTake for InputKey(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;

  *a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease(a1[1]);
  v4 = a1[2];
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for InputKey(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InputKey(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for InputKey()
{
  return &type metadata for InputKey;
}

unint64_t sub_10006CBD0()
{
  unint64_t result;

  result = qword_1000B9C90;
  if (!qword_1000B9C90)
  {
    result = swift_getWitnessTable(&unk_10009A2B0, &type metadata for InputKey);
    atomic_store(result, (unint64_t *)&qword_1000B9C90);
  }
  return result;
}

ValueMetadata *type metadata accessor for InputOrigin()
{
  return &type metadata for InputOrigin;
}

uint64_t sub_10006CC24(Swift::UInt a1, Swift::UInt a2, __int16 a3, uint64_t a4)
{
  uint64_t v4;
  _BYTE v9[24];
  uint64_t v10;

  v4 = a4;
  if ((sub_10006668C(a1, a2, a3 & 0x1FF, a4) & 1) != 0 || (v10 = v4, (sub_10006668C(a1, a2, a3 & 0x1FF, v4) & 1) != 0))
  {
    swift_bridgeObjectRetain(v4);
  }
  else
  {
    swift_bridgeObjectRetain(v4);
    sub_10005954C((uint64_t)v9, a1, a2, a3 & 0x1FF);
    return v10;
  }
  return v4;
}

BOOL sub_10006CCCC(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(a1 + 17) & 1) != 0)
    return 0;
  if ((*(_BYTE *)(a2 + 17) & 1) != 0)
    return 1;
  if (*(_QWORD *)a1 < *(_QWORD *)a2)
    return 1;
  if (*(_QWORD *)a1 != *(_QWORD *)a2)
    return 0;
  if ((*(_BYTE *)(a1 + 16) & 1) == 0)
    return (*(_BYTE *)(a2 + 16) & 1) == 0 && *(_QWORD *)(a1 + 8) < *(_QWORD *)(a2 + 8);
  return (*(_BYTE *)(a2 + 16) & 1) == 0;
}

uint64_t sub_10006CD3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10006CD98(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10006CD48);
}

BOOL sub_10006CD48(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4, uint64_t a5, __int16 a6)
{
  if ((a6 & 0x100) == 0)
  {
    if ((a3 & 0x100) != 0 || a4 < a1)
      return 0;
    if (a4 == a1)
    {
      if ((a6 & 1) == 0)
        return (a3 & 1) != 0 || a5 >= a2;
      if ((a3 & 1) == 0)
        return 0;
    }
  }
  return 1;
}

uint64_t sub_10006CD8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10006CD98(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10006CDD0);
}

uint64_t sub_10006CD98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  return a5(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(unsigned __int8 *)(a1 + 16) | (*(unsigned __int8 *)(a1 + 17) << 8), *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(unsigned __int8 *)(a2 + 16) | (*(unsigned __int8 *)(a2 + 17) << 8));
}

BOOL sub_10006CDD0(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4, uint64_t a5, __int16 a6)
{
  if ((a3 & 0x100) == 0)
  {
    if ((a6 & 0x100) != 0 || a1 < a4)
      return 0;
    if (a1 == a4)
    {
      if ((a3 & 1) == 0)
        return (a6 & 1) != 0 || a2 >= a5;
      if ((a6 & 1) == 0)
        return 0;
    }
  }
  return 1;
}

BOOL sub_10006CE14(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(a2 + 17) & 1) != 0)
    return 0;
  if ((*(_BYTE *)(a1 + 17) & 1) != 0)
    return 1;
  if (*(_QWORD *)a2 < *(_QWORD *)a1)
    return 1;
  if (*(_QWORD *)a2 != *(_QWORD *)a1)
    return 0;
  if ((*(_BYTE *)(a2 + 16) & 1) == 0)
    return (*(_BYTE *)(a1 + 16) & 1) == 0 && *(_QWORD *)(a2 + 8) < *(_QWORD *)(a1 + 8);
  return (*(_BYTE *)(a1 + 16) & 1) == 0;
}

Swift::Int sub_10006CE84()
{
  uint64_t v0;
  Swift::UInt v1;
  Swift::UInt v2;
  char v3;
  char v4;
  Swift::UInt v5;
  _QWORD v7[9];

  v1 = *(_QWORD *)v0;
  v2 = *(_QWORD *)(v0 + 8);
  v3 = *(_BYTE *)(v0 + 16);
  v4 = *(_BYTE *)(v0 + 17);
  Hasher.init(_seed:)(v7, 0);
  v5 = 0;
  if ((v4 & 1) == 0)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
    if ((v3 & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      Hasher._combine(_:)(1uLL);
      v5 = v2;
    }
  }
  Hasher._combine(_:)(v5);
  return Hasher._finalize()();
}

void sub_10006CF10()
{
  uint64_t v0;
  char v1;
  Swift::UInt v2;
  Swift::UInt v3;

  if ((*(_BYTE *)(v0 + 17) & 1) != 0
    || (v1 = *(_BYTE *)(v0 + 16),
        v3 = *(_QWORD *)v0,
        v2 = *(_QWORD *)(v0 + 8),
        Hasher._combine(_:)(1uLL),
        Hasher._combine(_:)(v3),
        (v1 & 1) != 0))
  {
    v2 = 0;
  }
  else
  {
    Hasher._combine(_:)(1uLL);
  }
  Hasher._combine(_:)(v2);
}

Swift::Int sub_10006CF74(uint64_t a1)
{
  uint64_t v1;
  Swift::UInt v2;
  Swift::UInt v3;
  char v4;
  char v5;
  _QWORD v7[9];

  v3 = *(_QWORD *)v1;
  v2 = *(_QWORD *)(v1 + 8);
  v4 = *(_BYTE *)(v1 + 16);
  v5 = *(_BYTE *)(v1 + 17);
  Hasher.init(_seed:)(v7, a1);
  if ((v5 & 1) != 0 || (Hasher._combine(_:)(1uLL), Hasher._combine(_:)(v3), (v4 & 1) != 0))
    v2 = 0;
  else
    Hasher._combine(_:)(1uLL);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10006CFF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(unsigned __int8 *)(a2 + 17);
  if ((*(_BYTE *)(a1 + 17) & 1) == 0)
  {
    if ((v2 & 1) == 0 && *(_QWORD *)a1 == *(_QWORD *)a2)
    {
      if ((*(_BYTE *)(a1 + 16) & 1) != 0)
      {
        if ((*(_BYTE *)(a2 + 16) & 1) != 0)
          return 1;
      }
      else if ((*(_BYTE *)(a2 + 16) & 1) == 0 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
      {
        return 1;
      }
    }
    return 0;
  }
  return v2;
}

Swift::Int sub_10006D050(Swift::Int *a1, uint64_t *a2)
{
  return sub_10006D098(*a1, *a2);
}

uint64_t sub_10006D05C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = sub_10006D354(a1);
  result = swift_bridgeObjectRelease(a1);
  *a2 = v4;
  return result;
}

Swift::Int sub_10006D098(Swift::Int result, uint64_t a2)
{
  Swift::Int v3;
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
  uint64_t v14;
  uint64_t v15;
  Swift::UInt v16;
  Swift::UInt v17;
  char v18;
  char v19;
  Swift::UInt v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  Swift::Int v26;
  int64_t v27;
  int64_t v28;
  uint64_t v29[9];

  if (result != a2)
  {
    v3 = result;
    if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
      return 0;
    v4 = 0;
    v26 = result + 56;
    v5 = 1 << *(_BYTE *)(result + 32);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(result + 56);
    v27 = (unint64_t)(v5 + 63) >> 6;
    v8 = a2 + 56;
LABEL_7:
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v28 = v4;
      v10 = v9 | (v4 << 6);
LABEL_25:
      v15 = *(_QWORD *)(v3 + 48) + 24 * v10;
      v16 = *(_QWORD *)v15;
      v17 = *(_QWORD *)(v15 + 8);
      v18 = *(_BYTE *)(v15 + 16);
      v19 = *(_BYTE *)(v15 + 17);
      Hasher.init(_seed:)(v29, *(_QWORD *)(a2 + 40));
      if ((v19 & 1) != 0 || (Hasher._combine(_:)(1uLL), Hasher._combine(_:)(v16), (v18 & 1) != 0))
      {
        v20 = 0;
      }
      else
      {
        Hasher._combine(_:)(1uLL);
        v20 = v17;
      }
      Hasher._combine(_:)(v20);
      result = Hasher._finalize()();
      v21 = -1 << *(_BYTE *)(a2 + 32);
      v22 = result & ~v21;
      if (((*(_QWORD *)(v8 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8)) >> v22) & 1) != 0)
      {
        v23 = ~v21;
        while (1)
        {
          v24 = *(_QWORD *)(a2 + 48) + 24 * v22;
          if ((*(_BYTE *)(v24 + 17) & 1) != 0)
          {
            if ((v19 & 1) != 0)
            {
              v4 = v28;
              goto LABEL_7;
            }
          }
          else
          {
            if (*(_QWORD *)v24 == v16)
              v25 = v19;
            else
              v25 = 1;
            if ((v25 & 1) == 0)
            {
              if ((*(_BYTE *)(v24 + 16) & 1) != 0)
              {
                if ((v18 & 1) != 0)
                {
                  v4 = v28;
                  goto LABEL_7;
                }
              }
              else if ((v18 & 1) == 0 && *(_QWORD *)(v24 + 8) == v17)
              {
                v4 = v28;
                goto LABEL_7;
              }
            }
          }
          v22 = (v22 + 1) & v23;
          if (((*(_QWORD *)(v8 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8)) >> v22) & 1) == 0)
            return 0;
        }
      }
      return 0;
    }
    v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
LABEL_49:
      __break(1u);
      return result;
    }
    if (v11 < v27)
    {
      v12 = *(_QWORD *)(v26 + 8 * v11);
      v13 = v4 + 1;
      if (v12)
        goto LABEL_24;
      v13 = v4 + 2;
      if (v4 + 2 >= v27)
        return 1;
      v12 = *(_QWORD *)(v26 + 8 * v13);
      if (v12)
        goto LABEL_24;
      v13 = v4 + 3;
      if (v4 + 3 >= v27)
        return 1;
      v12 = *(_QWORD *)(v26 + 8 * v13);
      if (v12)
        goto LABEL_24;
      v13 = v4 + 4;
      if (v4 + 4 >= v27)
        return 1;
      v12 = *(_QWORD *)(v26 + 8 * v13);
      if (v12)
      {
LABEL_24:
        v7 = (v12 - 1) & v12;
        v28 = v13;
        v10 = __clz(__rbit64(v12)) + (v13 << 6);
        goto LABEL_25;
      }
      v14 = v4 + 5;
      if (v4 + 5 < v27)
      {
        v12 = *(_QWORD *)(v26 + 8 * v14);
        if (v12)
        {
          v13 = v4 + 5;
          goto LABEL_24;
        }
        while (1)
        {
          v13 = v14 + 1;
          if (__OFADD__(v14, 1))
            goto LABEL_49;
          if (v13 >= v27)
            return 1;
          v12 = *(_QWORD *)(v26 + 8 * v13);
          ++v14;
          if (v12)
            goto LABEL_24;
        }
      }
    }
  }
  return 1;
}

uint64_t sub_10006D354(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t result;
  unsigned __int8 *v5;
  Swift::UInt v6;
  Swift::UInt v7;
  int v8;
  int v9;
  _BYTE v10[24];
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = sub_100067054();
  result = Set.init(minimumCapacity:)(v2, &type metadata for InputOrigin.Element, v3);
  v11 = result;
  if (v2)
  {
    v5 = (unsigned __int8 *)(a1 + 49);
    do
    {
      v6 = *(_QWORD *)(v5 - 17);
      v7 = *(_QWORD *)(v5 - 9);
      v8 = *(v5 - 1);
      v9 = *v5;
      v5 += 24;
      sub_10005954C((uint64_t)v10, v6, v7, v8 | (v9 << 8));
      --v2;
    }
    while (v2);
    return v11;
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for InputOrigin.Element(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for InputOrigin.Element(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 18))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for InputOrigin.Element(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_WORD *)(result + 16) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 18) = v3;
  return result;
}

uint64_t sub_10006D438(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_10006D454(uint64_t result, int a2)
{
  if (a2)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    *(_BYTE *)(result + 17) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for InputOrigin.Element()
{
  return &type metadata for InputOrigin.Element;
}

unint64_t sub_10006D48C()
{
  unint64_t result;

  result = qword_1000B9C98;
  if (!qword_1000B9C98)
  {
    result = swift_getWitnessTable(&unk_10009A394, &type metadata for InputOrigin.Element);
    atomic_store(result, (unint64_t *)&qword_1000B9C98);
  }
  return result;
}

uint64_t destroy for Name(uint64_t a1)
{
  return sub_10002DA24(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s14ArgumentParser4NameOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100030508(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for Name(uint64_t a1, uint64_t a2)
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
  sub_100030508(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_10002DA24(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for Name(uint64_t a1, uint64_t a2)
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
  sub_10002DA24(v4, v5, v6);
  return a1;
}

uint64_t sub_10006D5C4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16) >> 6;
}

uint64_t sub_10006D5D0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = *(_BYTE *)(result + 16) & 1 | (a2 << 6);
  return result;
}

ValueMetadata *type metadata accessor for Name()
{
  return &type metadata for Name;
}

unint64_t sub_10006D5F8()
{
  unint64_t result;

  result = qword_1000B9CA0[0];
  if (!qword_1000B9CA0[0])
  {
    result = swift_getWitnessTable(&unk_10009A498, &type metadata for Name);
    atomic_store(result, qword_1000B9CA0);
  }
  return result;
}

uint64_t sub_10006D63C(Swift::String a1, unsigned __int8 a2)
{
  void *object;
  uint64_t countAndFlagsBits;
  Swift::String v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v8;
  unint64_t v9;

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  if (!(a2 >> 6))
  {
    v5 = 11565;
    v6 = 0xE200000000000000;
LABEL_6:
    v8 = v5;
    v9 = v6;
    String.append(_:)(a1);
    return v8;
  }
  if (a2 >> 6 != 1)
  {
    v5 = 45;
    v6 = 0xE100000000000000;
    goto LABEL_6;
  }
  v8 = 0;
  v9 = 0xE000000000000000;
  v4._countAndFlagsBits = 45;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);
  Character.write<A>(to:)(&v8, countAndFlagsBits, object, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  return v8;
}

Swift::Int sub_10006D6E4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  Swift::UInt v6;
  _QWORD v8[9];

  Hasher.init(_seed:)(v8, 0);
  if (!(a3 >> 6))
  {
    v6 = 0;
LABEL_6:
    Hasher._combine(_:)(v6);
    String.hash(into:)(v8, a1, a2);
    return Hasher._finalize()();
  }
  if (a3 >> 6 != 1)
  {
    v6 = 2;
    goto LABEL_6;
  }
  Hasher._combine(_:)(1uLL);
  Character.hash(into:)(v8, a1, a2);
  Hasher._combine(_:)(a3 & 1);
  return Hasher._finalize()();
}

uint64_t sub_10006D794(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  Swift::String v16;
  Swift::String v17;

  v2 = *(void **)(a1 + 8);
  v3 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a1 + 16);
  v6 = *(_BYTE *)(a2 + 16);
  v16._countAndFlagsBits = *(_QWORD *)a1;
  v16._object = v2;
  v7 = sub_10006D63C(v16, v5);
  v9 = v8;
  v17._countAndFlagsBits = v3;
  v17._object = v4;
  v10 = sub_10006D63C(v17, v6);
  if (v7 == v10 && v9 == v11)
  {
    v14 = 0;
    v13 = v9;
  }
  else
  {
    v13 = v11;
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 1);
  }
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v13);
  return v14 & 1;
}

uint64_t sub_10006D83C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  char v12;
  char v13;
  Swift::String v15;

  v2 = *(_QWORD *)a1;
  v3 = *(void **)(a1 + 8);
  v4 = *(_BYTE *)(a1 + 16);
  v5 = sub_10006D63C(*(Swift::String *)a2, *(_BYTE *)(a2 + 16));
  v7 = v6;
  v15._countAndFlagsBits = v2;
  v15._object = v3;
  v8 = sub_10006D63C(v15, v4);
  if (v5 == v8 && v7 == v9)
  {
    swift_bridgeObjectRelease_n(v7, 2);
    v13 = 1;
  }
  else
  {
    v11 = v9;
    v12 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v7, v8, v9, 1);
    swift_bridgeObjectRelease(v7);
    swift_bridgeObjectRelease(v11);
    v13 = v12 ^ 1;
  }
  return v13 & 1;
}

uint64_t sub_10006D8F0(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  char v15;
  Swift::String v17;
  Swift::String v18;

  v2 = *(void **)(a1 + 8);
  v3 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a1 + 16);
  v6 = *(_BYTE *)(a2 + 16);
  v17._countAndFlagsBits = *(_QWORD *)a1;
  v17._object = v2;
  v7 = sub_10006D63C(v17, v5);
  v9 = v8;
  v18._countAndFlagsBits = v3;
  v18._object = v4;
  v10 = sub_10006D63C(v18, v6);
  if (v7 == v10 && v9 == v11)
  {
    swift_bridgeObjectRelease_n(v9, 2);
    v15 = 1;
  }
  else
  {
    v13 = v11;
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 1);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    v15 = v14 ^ 1;
  }
  return v15 & 1;
}

uint64_t sub_10006D9A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  char v12;
  Swift::String v14;

  v2 = *(_QWORD *)a1;
  v3 = *(void **)(a1 + 8);
  v4 = *(_BYTE *)(a1 + 16);
  v5 = sub_10006D63C(*(Swift::String *)a2, *(_BYTE *)(a2 + 16));
  v7 = v6;
  v14._countAndFlagsBits = v2;
  v14._object = v3;
  v8 = sub_10006D63C(v14, v4);
  if (v5 == v8 && v7 == v9)
  {
    v12 = 0;
    v11 = v7;
  }
  else
  {
    v11 = v9;
    v12 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v7, v8, v9, 1);
  }
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v11);
  return v12 & 1;
}

uint64_t sub_10006DA4C(uint64_t a1, uint64_t a2)
{
  return sub_10006DD50(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_BYTE *)(a2 + 16));
}

Swift::Int sub_10006DA68()
{
  uint64_t v0;

  return sub_10006D6E4(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

void sub_10006DA74(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  Swift::UInt8 v6;
  Swift::UInt v7;

  v4 = *v1;
  v3 = v1[1];
  v5 = *((unsigned __int8 *)v1 + 16);
  if (v5 >> 6)
  {
    if (v5 >> 6 == 1)
    {
      v6 = v5 & 1;
      Hasher._combine(_:)(1uLL);
      Character.hash(into:)(a1, v4, v3);
      Hasher._combine(_:)(v6);
      return;
    }
    v7 = 2;
  }
  else
  {
    v7 = 0;
  }
  Hasher._combine(_:)(v7);
  String.hash(into:)(a1, v4, v3);
}

Swift::Int sub_10006DB14(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  Swift::UInt v5;
  _QWORD v7[9];

  v3 = *v1;
  v2 = v1[1];
  v4 = *((unsigned __int8 *)v1 + 16);
  Hasher.init(_seed:)(v7, a1);
  if (!(v4 >> 6))
  {
    v5 = 0;
LABEL_6:
    Hasher._combine(_:)(v5);
    String.hash(into:)(v7, v3, v2);
    return Hasher._finalize()();
  }
  if (v4 >> 6 != 1)
  {
    v5 = 2;
    goto LABEL_6;
  }
  Hasher._combine(_:)(1uLL);
  Character.hash(into:)(v7, v3, v2);
  Hasher._combine(_:)(v4 & 1);
  return Hasher._finalize()();
}

BOOL sub_10006DBBC(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  Swift::String_optional v16;
  void *object;
  _BOOL8 v18;

  v10 = a4 >> 14;
  swift_bridgeObjectRetain(a2);
  if (v10 == a3 >> 14)
  {
LABEL_10:
    object = String.Iterator.next()().value._object;
    swift_bridgeObjectRelease(a2);
    v18 = object == 0;
  }
  else
  {
    swift_bridgeObjectRetain(a6);
    v11 = a3;
    while (1)
    {
      while (1)
      {
        v13 = Substring.subscript.getter(v11, a3, a4, a5, a6);
        v15 = v14;
        v11 = Substring.index(after:)(v11, a3, a4, a5, a6);
        v16 = String.Iterator.next()();
        if (!v16.value._object)
        {
          swift_bridgeObjectRelease(a6);
          swift_bridgeObjectRelease(v15);
          v18 = 1;
          goto LABEL_13;
        }
        if (v13 != v16.value._countAndFlagsBits || v16.value._object != v15)
          break;
        swift_bridgeObjectRelease(v15);
        swift_bridgeObjectRelease(v16.value._object);
        if (v10 == v11 >> 14)
        {
LABEL_9:
          swift_bridgeObjectRelease(a6);
          goto LABEL_10;
        }
      }
      v12 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v15, v16.value._countAndFlagsBits, v16.value._object, 0);
      swift_bridgeObjectRelease(v15);
      swift_bridgeObjectRelease(v16.value._object);
      if ((v12 & 1) == 0)
        break;
      if (v10 == v11 >> 14)
        goto LABEL_9;
    }
    swift_bridgeObjectRelease(a6);
    v18 = 0;
LABEL_13:
    object = a2;
  }
  swift_bridgeObjectRelease(object);
  return v18;
}

uint64_t sub_10006DD50(uint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  char v8;
  char v9;

  if (a3 >> 6)
  {
    if (a3 >> 6 == 1)
    {
      if ((a6 & 0xC0) == 0x40)
      {
        if (a1 == a4 && a2 == a5
          || (v8 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a4, a5, 0), v9 = 0, (v8 & 1) != 0))
        {
          v9 = ((a3 & 1) == 0) ^ a6;
        }
        return v9 & 1;
      }
      goto LABEL_13;
    }
    if ((a6 & 0xC0) != 0x80)
    {
LABEL_13:
      v9 = 0;
      return v9 & 1;
    }
  }
  else if (a6 >= 0x40u)
  {
    goto LABEL_13;
  }
  if (a1 == a4 && a2 == a5)
  {
    v9 = 1;
    return v9 & 1;
  }
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a4, a5, 0);
}

uint64_t sub_10006DE14(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;

  v4 = a4;
  if (sub_10006DBBC(11565, (void *)0xE200000000000000, a1, a2, a3, a4))
  {
    v8 = Substring.index(_:offsetBy:limitedBy:)(a1, 2, a2, a1, a2, a3, v4);
    if ((v9 & 1) != 0)
      v8 = a2;
    if (a2 >> 14 >= v8 >> 14)
    {
LABEL_12:
      v14 = Substring.subscript.getter(v8);
      v16 = v15;
      v18 = v17;
      v20 = v19;
      swift_bridgeObjectRelease(v4);
      v12 = static String._fromSubstring(_:)(v14, v16, v18, v20);
      v4 = v20;
      goto LABEL_13;
    }
    __break(1u);
    goto LABEL_15;
  }
  swift_bridgeObjectRetain(v4);
  v10 = Substring.distance(from:to:)(a1, a2, a1, a2, a3, v4);
  swift_bridgeObjectRelease(v4);
  if (v10 != 2)
  {
    v8 = Substring.index(_:offsetBy:limitedBy:)(a1, 1, a2, a1, a2, a3, v4);
    if ((v13 & 1) != 0)
      v8 = a2;
    if (a2 >> 14 >= v8 >> 14)
      goto LABEL_12;
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if ((a2 ^ a1) >= 0x4000)
  {
    v11 = Substring.index(before:)(a2, a1, a2, a3, v4);
    v12 = Substring.subscript.getter(v11, a1, a2, a3, v4);
LABEL_13:
    swift_bridgeObjectRelease(v4);
    return v12;
  }
LABEL_16:
  result = swift_bridgeObjectRelease(v4);
  __break(1u);
  return result;
}

uint64_t sub_10006E024(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  result = swift_checkMetadataState(319, *(_QWORD *)(a1 + 16));
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = (char *)&value witness table for () + 64;
    swift_initEnumMetadataMultiPayload(a1, 0, 2, v4);
    return 0;
  }
  return result;
}

uint64_t *sub_10006E098(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x10uLL)
    v5 = 16;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
  }
  else
  {
    v9 = *((unsigned __int8 *)a2 + v5);
    if (v9 >= 2)
    {
      if (v5 <= 3)
        v10 = v5;
      else
        v10 = 4;
      __asm { BR              X13 }
    }
    if (v9 != 1)
    {
      (*(void (**)(uint64_t *))(v4 + 16))(a1);
      *((_BYTE *)v3 + v5) = 0;
      return v3;
    }
    v8 = a2[1];
    *v3 = *a2;
    v3[1] = v8;
    *((_BYTE *)v3 + v5) = 1;
  }
  swift_retain(v8);
  return v3;
}

uint64_t sub_10006E1AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  if (v3 <= 0x10)
    v3 = 16;
  v4 = *(unsigned __int8 *)(a1 + v3);
  if (v4 < 2)
  {
    if (v4 == 1)
      return swift_release(*(_QWORD *)(a1 + 8));
    else
      return (*(uint64_t (**)(void))(v2 + 8))();
  }
  else
  {
    if (v3 <= 3)
      v5 = v3;
    else
      v5 = 4;
    return ((uint64_t (*)(void))((char *)&loc_10006E1F4 + 4 * byte_10009A515[v5]))();
  }
}

_QWORD *sub_10006E24C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x10uLL)
    v5 = 16;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *((unsigned __int8 *)a2 + v5);
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    swift_retain(v8);
    v9 = 1;
  }
  else
  {
    (*(void (**)(_QWORD *))(v4 + 16))(a1);
    v9 = 0;
  }
  *((_BYTE *)a1 + v5) = v9;
  return a1;
}

_QWORD *sub_10006E324(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 0x10uLL)
      v7 = 16;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = *((unsigned __int8 *)a1 + v7);
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)
      swift_release(a1[1]);
    else
      (*(void (**)(_QWORD *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    v10 = *((unsigned __int8 *)a2 + v7);
    if (v10 >= 2)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      v12 = a2[1];
      *a1 = *a2;
      a1[1] = v12;
      *((_BYTE *)a1 + v7) = 1;
      swift_retain(v12);
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
      *((_BYTE *)a1 + v7) = 0;
    }
  }
  return a1;
}

_OWORD *sub_10006E4B4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x10uLL)
    v5 = 16;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *((unsigned __int8 *)a2 + v5);
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    *a1 = *a2;
    v8 = 1;
  }
  else
  {
    (*(void (**)(_OWORD *))(v4 + 32))(a1);
    v8 = 0;
  }
  *((_BYTE *)a1 + v5) = v8;
  return a1;
}

uint64_t sub_10006E588(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  char v12;

  if ((_OWORD *)a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 0x10uLL)
      v7 = 16;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = *(unsigned __int8 *)(a1 + v7);
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)
      swift_release(*(_QWORD *)(a1 + 8));
    else
      (*(void (**)(uint64_t, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    v10 = *((unsigned __int8 *)a2 + v7);
    if (v10 >= 2)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      *(_OWORD *)a1 = *a2;
      v12 = 1;
    }
    else
    {
      (*(void (**)(uint64_t, _OWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
      v12 = 0;
    }
    *(_BYTE *)(a1 + v7) = v12;
  }
  return a1;
}

uint64_t sub_10006E714(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v3 = 16;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) > 0x10uLL)
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_21;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 254) >> v5) + 1;
    if (HIWORD(v8))
    {
      v6 = *(_DWORD *)(a1 + v4);
      if (!v6)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 > 0xFF)
    {
      v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4))
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 < 2)
    {
LABEL_21:
      v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 2)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4))
    goto LABEL_21;
LABEL_14:
  v9 = (v6 - 1) << v5;
  if (v4 > 3)
    v9 = 0;
  if (!(_DWORD)v4)
    return (v9 + 255);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_10006E7D8 + 4 * byte_10009A538[(v4 - 1)]))();
}

void sub_10006E824(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (v5 <= 0x10)
    v5 = 16;
  v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    v7 = 0;
  }
  else if (v6 <= 3)
  {
    v9 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v9))
    {
      v7 = &dword_100000004;
    }
    else if (v9 >= 0x100)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 > 1;
    }
  }
  else
  {
    v7 = &_mh_execute_header.magic + 1;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v8 = a2 - 255;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v10 = v8 & ~(-1 << (8 * v6));
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v10;
        *((_BYTE *)a1 + 2) = BYTE2(v10);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v10;
      }
      else
      {
        *(_BYTE *)a1 = v10;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v8;
  }
  __asm { BR              X10 }
}

uint64_t sub_10006E9CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 16;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) > 0x10uLL)
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 2u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_10006EA14 + 4 * byte_10009A546[v3]))();
}

void sub_10006EA5C(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) <= 0x10uLL)
    v4 = 16;
  else
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (a2 > 1)
  {
    v5 = a2 - 2;
    if (v4 < 4)
    {
      v6 = v5 >> (8 * v4);
      v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if ((_DWORD)v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if ((_DWORD)v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t type metadata accessor for Parsed(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100037B54(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Parsed);
}

_QWORD *sub_10006EB30@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  char v56;
  _BYTE v57[48];
  _OWORD v58[3];
  _OWORD v59[4];
  char v60;
  _QWORD *v61;

  v47 = a4;
  v48 = a3;
  v46 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, a3);
  v45 = type metadata accessor for Parsed(0, AssociatedTypeWitness, v6, v7);
  __chkstk_darwin(v45);
  v9 = (char *)&v39 - v8;
  v10 = type metadata accessor for Optional(0, AssociatedTypeWitness);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v39 - v13;
  v15 = *(_QWORD *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(v12);
  v17 = (char *)&v39 - v16;
  v61 = a1;
  sub_100033F10((uint64_t)a1, (uint64_t)v57);
  v18 = sub_100005104(&qword_1000B9460);
  if ((swift_dynamicCast(&v49, v57, v18, &type metadata for SingleValueDecoder, 6) & 1) != 0)
  {
    v19 = AssociatedTypeWitness;
    v40 = v11;
    v41 = v10;
    v42 = v14;
    v43 = v15;
    v44 = v17;
    v20 = v48;
    v59[1] = v53;
    v59[2] = v54;
    v59[3] = v55;
    v60 = v56;
    v58[0] = v49;
    v58[1] = v50;
    v58[2] = v51;
    v59[0] = v52;
    sub_10005BCDC((uint64_t)v59, (uint64_t)&v49, &qword_1000B9888);
    if (*((_QWORD *)&v49 + 1))
    {
      sub_10005BCDC((uint64_t)&v50 + 8, (uint64_t)v57, &qword_1000B9360);
      sub_10003D920(&v49);
    }
    else
    {
      sub_10004E740((uint64_t)&v49, &qword_1000B9888);
      memset(v57, 0, 32);
    }
    v25 = v9;
    v27 = v43;
    v26 = v44;
    v28 = v42;
    v29 = sub_100005104(&qword_1000B9360);
    v30 = swift_dynamicCast(v28, v57, v29, v19, 6);
    v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
    if ((v30 & 1) != 0)
    {
      v31(v28, 0, 1, v19);
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v26, v28, v19);
      (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v25, v26, v19);
      swift_storeEnumTagMultiPayload(v25, v45, 0);
      (*(void (**)(char *, uint64_t, uint64_t))(v20 + 40))(v25, v46, v20);
      sub_1000062D8(v61);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v26, v19);
      return sub_10004408C(v58);
    }
    else
    {
      v31(v28, 1, 1, v19);
      (*(void (**)(char *, uint64_t))(v40 + 8))(v28, v41);
      sub_10005BCDC((uint64_t)v59, (uint64_t)&v49, &qword_1000B9888);
      v32 = *((_QWORD *)&v49 + 1);
      if (*((_QWORD *)&v49 + 1))
      {
        v33 = v49;
        v34 = v50;
        swift_bridgeObjectRetain(*((_QWORD *)&v49 + 1));
        swift_bridgeObjectRetain(v34);
        sub_10003D920(&v49);
        sub_10005BCA8((uint64_t *)v58, (uint64_t)&v49);
      }
      else
      {
        sub_10004E740((uint64_t)&v49, &qword_1000B9888);
        sub_10005BCA8((uint64_t *)v58, (uint64_t)&v49);
        v33 = *((_QWORD *)&v50 + 1);
        v34 = *((_QWORD *)&v51 + 1);
        v32 = v51;
        swift_bridgeObjectRetain(v51);
        swift_bridgeObjectRetain(v34);
      }
      v35 = v61;
      sub_10004408C(&v49);
      v36 = sub_10002EA1C();
      v37 = swift_allocError(&type metadata for ParserError, v36, 0, 0);
      *(_QWORD *)v38 = v33;
      *(_QWORD *)(v38 + 8) = v32;
      *(_QWORD *)(v38 + 16) = v34;
      *(_OWORD *)(v38 + 24) = 0u;
      *(_OWORD *)(v38 + 40) = 0u;
      *(_OWORD *)(v38 + 56) = 0u;
      *(_QWORD *)(v38 + 72) = 0;
      *(_BYTE *)(v38 + 80) = 11;
      swift_willThrow(v37);
      sub_1000062D8(v35);
      return sub_10004408C(v58);
    }
  }
  else
  {
    v56 = 0;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
    sub_10004E740((uint64_t)&v49, &qword_1000B9468);
    v21 = sub_10002EA1C();
    v22 = swift_allocError(&type metadata for ParserError, v21, 0, 0);
    *(_QWORD *)v23 = 3;
    *(_OWORD *)(v23 + 8) = 0u;
    *(_OWORD *)(v23 + 24) = 0u;
    *(_OWORD *)(v23 + 40) = 0u;
    *(_OWORD *)(v23 + 56) = 0u;
    *(_QWORD *)(v23 + 72) = 0;
    *(_BYTE *)(v23 + 80) = 15;
    swift_willThrow(v22);
    return (_QWORD *)sub_1000062D8(v61);
  }
}

uint64_t sub_10006EF78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100098020, a4);
  return sub_10006EFD4(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_10006EFD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, a5);
  v13 = type metadata accessor for Parsed(0, AssociatedTypeWitness, v11, v12);
  __chkstk_darwin(v13);
  v15 = (char *)&v19 - v14;
  (*(void (**)(uint64_t, uint64_t))(a5 + 32))(a4, a5);
  if (swift_getEnumCaseMultiPayload(v15, v13) == 1)
  {
    v16 = *((_QWORD *)v15 + 1);
    v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))v15)(a1, a2, a3);
    swift_release(v16);
    return v17;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000003FLL, 0x800000010009DB70, "ArgumentParser/Parsed.swift", 27, 2, 59, 0);
    __break(1u);
  }
  return result;
}

uint64_t sub_10006F11C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v6;

  *a5 = a1;
  a5[1] = a2;
  v6 = type metadata accessor for Parsed(0, a3, a3, a4);
  return swift_storeEnumTagMultiPayload(a5, v6, 1);
}

uint64_t sub_10006F154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100098634, a4);
  return sub_10006EFD4(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_10006F1B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100098A70, a4);
  return sub_10006EFD4(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_10006F20C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char v25;
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  char *v27;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  char v43;
  _BYTE v44[48];
  _OWORD v45[3];
  _OWORD v46[4];
  char v47;
  uint64_t v48;

  v34 = a5;
  v48 = a3;
  v35 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, a3);
  v9 = type metadata accessor for Optional(0, AssociatedTypeWitness);
  v29 = *(_QWORD *)(v9 - 8);
  v30 = v9;
  __chkstk_darwin(v9);
  v31 = (char *)&v29 - v10;
  v33 = type metadata accessor for Parsed(0, AssociatedTypeWitness, v11, v12);
  v13 = __chkstk_darwin(v33);
  v32 = (char *)&v29 - v14;
  v15 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v20 = (char *)&v29 - v19;
  sub_100033F10((uint64_t)a1, (uint64_t)v45);
  dispatch thunk of Decodable.init(from:)(v45, AssociatedTypeWitness, a4);
  if (!v5)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v18, AssociatedTypeWitness);
LABEL_10:
    v27 = v32;
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v32, v20, AssociatedTypeWitness);
    swift_storeEnumTagMultiPayload(v27, v33, 0);
    (*(void (**)(char *, uint64_t))(v48 + 40))(v27, v35);
    sub_1000062D8(a1);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v20, AssociatedTypeWitness);
  }
  sub_100033F10((uint64_t)a1, (uint64_t)v44);
  v21 = sub_100005104(&qword_1000B9460);
  if ((swift_dynamicCast(&v36, v44, v21, &type metadata for SingleValueDecoder, 6) & 1) != 0)
  {
    v46[1] = v40;
    v46[2] = v41;
    v46[3] = v42;
    v47 = v43;
    v45[0] = v36;
    v45[1] = v37;
    v45[2] = v38;
    v46[0] = v39;
    sub_10005BCDC((uint64_t)v46, (uint64_t)&v36, &qword_1000B9888);
    sub_10004408C(v45);
    if (*((_QWORD *)&v36 + 1))
    {
      sub_10005BCDC((uint64_t)&v37 + 8, (uint64_t)v44, &qword_1000B9360);
      sub_10003D920(&v36);
    }
    else
    {
      sub_10004E740((uint64_t)&v36, &qword_1000B9888);
      memset(v44, 0, 32);
    }
    v23 = sub_100005104(&qword_1000B9360);
    v24 = v31;
    v25 = swift_dynamicCast(v31, v44, v23, AssociatedTypeWitness, 6);
    v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
    if ((v25 & 1) != 0)
    {
      v26(v24, 0, 1, AssociatedTypeWitness);
      swift_errorRelease(v5);
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v24, AssociatedTypeWitness);
      goto LABEL_10;
    }
    v26(v24, 1, 1, AssociatedTypeWitness);
    v22 = (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v24, v30);
  }
  else
  {
    v43 = 0;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v36 = 0u;
    v22 = sub_10004E740((uint64_t)&v36, &qword_1000B9468);
  }
  swift_willThrow(v22);
  return sub_1000062D8(a1);
}

uint64_t sub_10006F588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100098C84, a4);
  return sub_10006EFD4(a1, a2, a3, a4, WitnessTable);
}

uint64_t destroy for ParsedValues(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[2]);
  return swift_bridgeObjectRelease(a1[4]);
}

uint64_t *initializeWithCopy for ParsedValues(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v6 = a2[2];
  v5 = a2[3];
  a1[2] = v6;
  a1[3] = v5;
  v7 = a2[4];
  a1[4] = v7;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  return a1;
}

uint64_t *assignWithCopy for ParsedValues(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = a2[2];
  v9 = a1[2];
  a1[2] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[3] = a2[3];
  v10 = a2[4];
  v11 = a1[4];
  a1[4] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  return a1;
}

__n128 initializeWithTake for ParsedArgument(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

_QWORD *assignWithTake for ParsedValues(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease(v4);
  v5 = a1[2];
  a1[2] = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = a1[4];
  a1[3] = *(_QWORD *)(a2 + 24);
  a1[4] = v6;
  swift_bridgeObjectRelease(v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for ParsedValues(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ParsedValues(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ParsedValues()
{
  return &type metadata for ParsedValues;
}

uint64_t destroy for ParsedValues.Element(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[2]);
  if (a1[6])
    sub_1000062D8(a1 + 3);
  return swift_bridgeObjectRelease(a1[7]);
}

uint64_t initializeWithCopy for ParsedValues.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v5;
  v6 = (_OWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  if (v7)
  {
    *(_QWORD *)(a1 + 48) = v7;
    (**(void (***)(uint64_t, _OWORD *, uint64_t))(v7 - 8))(a1 + 24, v6, v7);
  }
  else
  {
    v8 = v6[1];
    *(_OWORD *)(a1 + 24) = *v6;
    *(_OWORD *)(a1 + 40) = v8;
  }
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 56) = v9;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  swift_bridgeObjectRetain(v9);
  return a1;
}

uint64_t assignWithCopy for ParsedValues.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 48);
  if (!*(_QWORD *)(a1 + 48))
  {
    if (v8)
    {
      *(_QWORD *)(a1 + 48) = v8;
      (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 24, a2 + 24);
      goto LABEL_8;
    }
LABEL_7:
    v9 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v9;
    goto LABEL_8;
  }
  if (!v8)
  {
    sub_1000062D8((_QWORD *)(a1 + 24));
    goto LABEL_7;
  }
  sub_100052ED8((_QWORD *)(a1 + 24), (_QWORD *)(a2 + 24));
LABEL_8:
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

__n128 initializeWithTake for ParsedValues.Element(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for ParsedValues.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease(v6);
  if (*(_QWORD *)(a1 + 48))
    sub_1000062D8((_QWORD *)(a1 + 24));
  v7 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = v7;
  v8 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease(v8);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for ParsedValues.Element(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 65))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ParsedValues.Element(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 64) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 65) = 1;
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
    *(_BYTE *)(result + 65) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ParsedValues.Element()
{
  return &type metadata for ParsedValues.Element;
}

_QWORD *sub_10006FB28(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t *), uint64_t a7, uint64_t a8)
{
  __int128 *v8;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  __int128 v28;
  _OWORD v29[2];
  __int128 v30;
  char v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v16 = v8[1];
  v32 = *v8;
  v33 = v16;
  v34 = *((_QWORD *)v8 + 4);
  sub_10006FD1C(a1, a2, a3, (uint64_t)&v23);
  if (*((_QWORD *)&v23 + 1))
  {
    v29[1] = v25;
    v30 = v26;
    v31 = v27;
    v28 = v23;
    v29[0] = v24;
  }
  else
  {
    v17 = type metadata accessor for Array(0, a8);
    *(_QWORD *)&v28 = a1;
    *((_QWORD *)&v28 + 1) = a2;
    *(_QWORD *)&v29[0] = a3;
    *((_QWORD *)&v29[0] + 1) = a5;
    *(_QWORD *)&v30 = v17;
    *((_QWORD *)&v30 + 1) = &_swiftEmptySetSingleton;
    v31 = 1;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a3);
    swift_bridgeObjectRetain(a5);
    sub_10004E740((uint64_t)&v23, &qword_1000B9888);
  }
  sub_10003D8D8((uint64_t)v29 + 8, (uint64_t)&v23);
  if (!*((_QWORD *)&v24 + 1))
  {
    sub_10004E740((uint64_t)&v23, &qword_1000B9360);
    goto LABEL_8;
  }
  v18 = type metadata accessor for Array(0, a8);
  if (!swift_dynamicCast(&v22, &v23, (char *)&type metadata for Any + 8, v18, 6))
  {
LABEL_8:
    v22 = a5;
    swift_bridgeObjectRetain(a5);
  }
  if (v31 == 1)
  {
    type metadata accessor for Array(0, a8);
    Array.removeAll(keepingCapacity:)(0);
    v31 = 0;
  }
  a6(&v22);
  v19 = v22;
  *((_QWORD *)&v24 + 1) = type metadata accessor for Array(0, a8);
  *(_QWORD *)&v23 = v19;
  sub_1000671BC((uint64_t)&v23, (uint64_t)v29 + 8);
  v20 = swift_bridgeObjectRetain(a4);
  sub_10005750C(v20);
  sub_10007029C((uint64_t *)&v28);
  return sub_10003D920(&v28);
}

uint64_t sub_10006FD1C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v9;
  unint64_t v10;
  char v11;

  v6 = *v4;
  if (*(_QWORD *)(v6 + 16))
  {
    v9 = result;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a3);
    v10 = sub_100058C68(v9, a2, a3);
    if ((v11 & 1) != 0)
    {
      sub_10005BD20(*(_QWORD *)(v6 + 56) + 72 * v10, a4);
    }
    else
    {
      *(_BYTE *)(a4 + 64) = 0;
      *(_OWORD *)(a4 + 32) = 0u;
      *(_OWORD *)(a4 + 48) = 0u;
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
    }
    swift_bridgeObjectRelease(a3);
    return swift_bridgeObjectRelease(a2);
  }
  else
  {
    *(_BYTE *)(a4 + 64) = 0;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
  }
  return result;
}

uint64_t sub_10006FDDC(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v4;
  _QWORD *v5;
  __int128 v9;
  __int128 v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v14;
  _OWORD v15[4];
  char v16;

  v5 = v4;
  if (*(_QWORD *)(a1 + 8))
  {
    v9 = *(_OWORD *)(a1 + 48);
    v15[2] = *(_OWORD *)(a1 + 32);
    v15[3] = v9;
    v16 = *(_BYTE *)(a1 + 64);
    v10 = *(_OWORD *)(a1 + 16);
    v15[0] = *(_OWORD *)a1;
    v15[1] = v10;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    v14 = *v4;
    *v4 = 0x8000000000000000;
    sub_100071CE0((uint64_t)v15, a2, a3, a4, isUniquelyReferenced_nonNull_native);
    v12 = *v4;
    *v5 = v14;
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(a3);
    return swift_bridgeObjectRelease(v12);
  }
  else
  {
    sub_10004E740(a1, &qword_1000B9888);
    sub_10007192C(a2, a3, a4, (uint64_t)v15);
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(a3);
    return sub_10004E740((uint64_t)v15, &qword_1000B9888);
  }
}

_QWORD *sub_10006FEDC(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, void (*a6)(char *), uint64_t a7, uint64_t a8)
{
  __int128 *v8;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  __int128 v24;
  void (*v25)(char *, uint64_t, uint64_t);
  void (*v26)(char *, uint64_t);
  char *v27;
  uint64_t v28;
  int v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *);
  uint64_t v42;
  __int128 *v43;
  char *v44;
  uint64_t v45;
  _QWORD v46[3];
  uint64_t v47;
  _OWORD v48[4];
  char v49;
  __int128 v50;
  _OWORD v51[2];
  __int128 v52;
  char v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v40 = a7;
  v41 = a6;
  v45 = a5;
  v42 = a4;
  v39 = type metadata accessor for Optional(0, a8);
  v38 = *(_QWORD *)(v39 - 8);
  v13 = __chkstk_darwin(v39);
  v15 = (char *)&v35 - v14;
  v16 = *(_QWORD *)(a8 - 8);
  v17 = __chkstk_darwin(v13);
  v44 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __chkstk_darwin(v17);
  v21 = (char *)&v35 - v20;
  __chkstk_darwin(v19);
  v23 = (char *)&v35 - v22;
  v24 = v8[1];
  v54 = *v8;
  v55 = v24;
  v43 = v8;
  v56 = *((_QWORD *)v8 + 4);
  v37 = a1;
  sub_10006FD1C(a1, a2, a3, (uint64_t)v48);
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v25(v23, v45, a8);
  if (*((_QWORD *)&v48[0] + 1))
  {
    v26 = *(void (**)(char *, uint64_t))(v16 + 8);
    v26(v23, a8);
    v51[1] = v48[2];
    v52 = v48[3];
    v53 = v49;
    v50 = v48[0];
    v51[0] = v48[1];
  }
  else
  {
    v47 = a8;
    v27 = (char *)sub_10000B40C(v46);
    v25(v27, (uint64_t)v23, a8);
    v26 = *(void (**)(char *, uint64_t))(v16 + 8);
    v36 = v25;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a3);
    v26(v23, a8);
    *(_QWORD *)&v50 = v37;
    *((_QWORD *)&v50 + 1) = a2;
    v25 = v36;
    *(_QWORD *)&v51[0] = a3;
    sub_10004E85C((uint64_t)v46, (uint64_t)v51 + 8);
    *((_QWORD *)&v52 + 1) = &_swiftEmptySetSingleton;
    v53 = 1;
    sub_10004E740((uint64_t)v48, &qword_1000B9888);
  }
  sub_10003D8D8((uint64_t)v51 + 8, (uint64_t)v46);
  v28 = sub_100005104(&qword_1000B9360);
  v29 = swift_dynamicCast(v15, v46, v28, a8, 6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v15, v29 ^ 1u, 1, a8);
  v30 = v44;
  v25(v44, v45, a8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v15, 1, a8) == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v30, a8);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v15, v39);
  }
  else
  {
    v26(v30, a8);
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v15, a8);
  }
  v31 = v42;
  v41(v21);
  v47 = a8;
  v32 = (char *)sub_10000B40C(v46);
  v25(v32, (uint64_t)v21, a8);
  sub_1000671BC((uint64_t)v46, (uint64_t)v51 + 8);
  v33 = swift_bridgeObjectRetain(v31);
  sub_10005750C(v33);
  sub_10007029C((uint64_t *)&v50);
  v26(v21, a8);
  return sub_10003D920(&v50);
}

_QWORD *sub_10007029C(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  __int128 v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _BYTE v16[72];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  _OWORD v22[3];
  __int128 v23;
  char v24;

  v3 = *v1;
  if (*(_QWORD *)(v3 + 16))
  {
    v5 = *a1;
    v4 = a1[1];
    v6 = (_QWORD *)a1[2];
    swift_bridgeObjectRetain(v4);
    swift_bridgeObjectRetain(v6);
    v7 = sub_100058C68(v5, v4, v6);
    if ((v8 & 1) != 0)
    {
      sub_10005BD20(*(_QWORD *)(v3 + 56) + 72 * v7, (uint64_t)&v17);
      swift_bridgeObjectRelease(v6);
      swift_bridgeObjectRelease(v4);
      if (*((_QWORD *)&v17 + 1))
      {
        v22[2] = v19;
        v23 = v20;
        v24 = v21;
        v22[0] = v17;
        v22[1] = v18;
        sub_10005BD20((uint64_t)a1, (uint64_t)&v17);
        v9 = swift_bridgeObjectRetain(*((_QWORD *)&v23 + 1));
        sub_10005750C(v9);
        v10 = v17;
        v11 = (_QWORD *)v18;
        sub_10005BD20((uint64_t)&v17, (uint64_t)v16);
        swift_bridgeObjectRetain(*((_QWORD *)&v10 + 1));
        swift_bridgeObjectRetain(v11);
        sub_10006FDDC((uint64_t)v16, v10, *((uint64_t *)&v10 + 1), v11);
        sub_10003D920(&v17);
        return sub_10003D920(v22);
      }
    }
    else
    {
      v21 = 0;
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      swift_bridgeObjectRelease(v6);
      swift_bridgeObjectRelease(v4);
    }
  }
  else
  {
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
  }
  sub_10004E740((uint64_t)&v17, &qword_1000B9888);
  v13 = *a1;
  v14 = a1[1];
  v15 = (_QWORD *)a1[2];
  sub_10005BD20((uint64_t)a1, (uint64_t)v22);
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v15);
  return (_QWORD *)sub_10006FDDC((uint64_t)v22, v13, v14, v15);
}

void *sub_10007044C()
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
  unsigned __int8 v23;
  unint64_t v25;
  int64_t v26;

  v1 = v0;
  sub_100005104(qword_1000B9608);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
    result = (void *)swift_release(v2);
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
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v25 = *(_QWORD *)(v6 + 8 * v9);
    if (!v25)
      break;
LABEL_23:
    v12 = (v25 - 1) & v25;
    v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    v16 = 24 * v15;
    v17 = *(_QWORD *)(v2 + 48) + 24 * v15;
    v18 = *(_QWORD *)v17;
    v19 = *(_QWORD *)(v17 + 8);
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = *(_QWORD *)(v4 + 48) + v16;
    v23 = *(_BYTE *)(v17 + 16);
    *(_QWORD *)v22 = *(_QWORD *)v17;
    *(_QWORD *)(v22 + 8) = v19;
    *(_BYTE *)(v22 + 16) = v23;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    result = (void *)sub_100030508(v18, v19, v23);
  }
  v26 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v25 = *(_QWORD *)(v6 + 8 * v26);
  if (v25)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v25 = *(_QWORD *)(v6 + 8 * v9);
    ++v26;
    if (v25)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_1000705EC()
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
  __int128 v22;
  __int128 v23;
  __int128 v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  __int128 v28;
  _OWORD v29[4];
  char v30;

  v1 = v0;
  sub_100005104(&qword_1000B9D28);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
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
    v16 = 24 * v15;
    v17 = *(_QWORD *)(v2 + 48) + 24 * v15;
    v18 = *(_QWORD *)v17;
    v19 = 72 * v15;
    v28 = *(_OWORD *)(v17 + 8);
    sub_10005BD20(*(_QWORD *)(v2 + 56) + 72 * v15, (uint64_t)v29);
    v20 = *(_QWORD *)(v4 + 48) + v16;
    *(_QWORD *)v20 = v18;
    *(_OWORD *)(v20 + 8) = v28;
    v21 = *(_QWORD *)(v4 + 56) + v19;
    *(_OWORD *)v21 = v29[0];
    v22 = v29[1];
    v23 = v29[2];
    v24 = v29[3];
    *(_BYTE *)(v21 + 64) = v30;
    *(_OWORD *)(v21 + 32) = v23;
    *(_OWORD *)(v21 + 48) = v24;
    *(_OWORD *)(v21 + 16) = v22;
    swift_bridgeObjectRetain(v28);
    result = (void *)swift_bridgeObjectRetain(*((_QWORD *)&v28 + 1));
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

void *sub_1000707FC()
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
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  sub_100005104(&qword_1000B9D38);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
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
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    result = (void *)swift_bridgeObjectRetain(v20);
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

void *sub_1000709B0()
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
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v1 = v0;
  sub_100005104(&qword_1000B9D30);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
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
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    swift_retain(v17);
    result = (void *)swift_retain(v18);
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

Swift::Int sub_100070B58(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  Swift::UInt v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  char v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100005104(qword_1000B9608);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_47;
  v36 = v3;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v39 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v38 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  v37 = a2;
  while (1)
  {
    if (v11)
    {
      v17 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v18 = v17 | (v14 << 6);
      goto LABEL_23;
    }
    if (__OFADD__(v14++, 1))
      goto LABEL_49;
    if (v14 >= v38)
      break;
    v20 = (_QWORD *)(v5 + 64);
    v21 = *(_QWORD *)(v39 + 8 * v14);
    if (!v21)
    {
      v22 = v14 + 1;
      if (v14 + 1 >= v38)
      {
LABEL_40:
        swift_release(v5);
        v3 = v36;
        if ((a2 & 1) == 0)
          goto LABEL_47;
        goto LABEL_43;
      }
      v21 = *(_QWORD *)(v39 + 8 * v22);
      if (!v21)
      {
        while (1)
        {
          v14 = v22 + 1;
          if (__OFADD__(v22, 1))
            break;
          if (v14 >= v38)
            goto LABEL_40;
          v21 = *(_QWORD *)(v39 + 8 * v14);
          ++v22;
          if (v21)
            goto LABEL_22;
        }
LABEL_48:
        __break(1u);
LABEL_49:
        __break(1u);
        return result;
      }
      ++v14;
    }
LABEL_22:
    v11 = (v21 - 1) & v21;
    v18 = __clz(__rbit64(v21)) + (v14 << 6);
LABEL_23:
    v23 = *(_QWORD *)(v5 + 48) + 24 * v18;
    v25 = *(_QWORD *)v23;
    v24 = *(_QWORD *)(v23 + 8);
    v26 = *(unsigned __int8 *)(v23 + 16);
    v40 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v18);
    if ((a2 & 1) == 0)
      sub_100030508(v25, v24, v26);
    Hasher.init(_seed:)(v41, *(_QWORD *)(v8 + 40));
    if (v26 >> 6)
    {
      if (v26 >> 6 == 1)
      {
        Hasher._combine(_:)(1uLL);
        Character.hash(into:)(v41, v25, v24);
        LOBYTE(a2) = v37;
        Hasher._combine(_:)(v26 & 1);
        goto LABEL_31;
      }
      v27 = 2;
    }
    else
    {
      v27 = 0;
    }
    Hasher._combine(_:)(v27);
    String.hash(into:)(v41, v25, v24);
LABEL_31:
    result = Hasher._finalize()();
    v28 = -1 << *(_BYTE *)(v8 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_48;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = *(_QWORD *)(v8 + 48) + 24 * v15;
    *(_QWORD *)v16 = v25;
    *(_QWORD *)(v16 + 8) = v24;
    *(_BYTE *)(v16 + 16) = v26;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v15) = v40;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v36;
  v20 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_47;
LABEL_43:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v20, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v20 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_47:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_100070EC4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t i;
  unint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  _QWORD *v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  char v43;
  unint64_t v44;
  BOOL v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  int64_t v49;
  _QWORD *v50;
  char v51;
  int64_t v52;
  __int128 v53;
  _QWORD v54[9];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  char v59;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100005104(&qword_1000B9D28);
  v51 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_48;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v50 = (_QWORD *)(v5 + 64);
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v48 = v3;
  v49 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  for (i = 0; ; i = v52)
  {
    if (v11)
    {
      v22 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v23 = v22 | (i << 6);
      goto LABEL_25;
    }
    v24 = i + 1;
    if (__OFADD__(i, 1))
    {
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
      return result;
    }
    if (v24 >= v49)
      break;
    v25 = v50;
    v26 = v50[v24];
    ++i;
    if (!v26)
    {
      i = v24 + 1;
      if (v24 + 1 >= v49)
        goto LABEL_41;
      v26 = v50[i];
      if (!v26)
      {
        v27 = v24 + 2;
        if (v27 >= v49)
        {
LABEL_41:
          swift_release(v5);
          v3 = v48;
          if ((v51 & 1) == 0)
            goto LABEL_48;
          goto LABEL_44;
        }
        v26 = v50[v27];
        if (!v26)
        {
          while (1)
          {
            i = v27 + 1;
            if (__OFADD__(v27, 1))
              goto LABEL_50;
            if (i >= v49)
              goto LABEL_41;
            v26 = v50[i];
            ++v27;
            if (v26)
              goto LABEL_24;
          }
        }
        i = v27;
      }
    }
LABEL_24:
    v11 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (i << 6);
LABEL_25:
    v28 = *(_QWORD *)(v5 + 48) + 24 * v23;
    v29 = *(_QWORD *)v28;
    v30 = *(_QWORD *)(v5 + 56) + 72 * v23;
    v31 = *(_QWORD *)(v28 + 16);
    v52 = i;
    v53 = *(_OWORD *)(v28 + 8);
    if ((v51 & 1) != 0)
    {
      v55 = *(_OWORD *)v30;
      v32 = *(_OWORD *)(v30 + 16);
      v33 = *(_OWORD *)(v30 + 32);
      v34 = *(_OWORD *)(v30 + 48);
      v59 = *(_BYTE *)(v30 + 64);
      v57 = v33;
      v58 = v34;
      v56 = v32;
    }
    else
    {
      sub_10005BD20(v30, (uint64_t)&v55);
      swift_bridgeObjectRetain(v53);
      swift_bridgeObjectRetain(v31);
    }
    Hasher.init(_seed:)(v54, *(_QWORD *)(v8 + 40));
    swift_bridgeObjectRetain(v53);
    String.hash(into:)(v54, v29, v53);
    swift_bridgeObjectRelease(v53);
    Hasher._combine(_:)(*(_QWORD *)(v31 + 16));
    v35 = *(_QWORD *)(v31 + 16);
    if (v35)
    {
      v36 = v5;
      swift_bridgeObjectRetain(v31);
      v37 = (_QWORD *)(v31 + 40);
      do
      {
        v38 = *(v37 - 1);
        v39 = *v37;
        swift_bridgeObjectRetain(*v37);
        String.hash(into:)(v54, v38, v39);
        swift_bridgeObjectRelease(v39);
        v37 += 2;
        --v35;
      }
      while (v35);
      swift_bridgeObjectRelease(v31);
      v5 = v36;
    }
    result = Hasher._finalize()();
    v40 = -1 << *(_BYTE *)(v8 + 32);
    v41 = result & ~v40;
    v42 = v41 >> 6;
    if (((-1 << v41) & ~*(_QWORD *)(v12 + 8 * (v41 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v41) & ~*(_QWORD *)(v12 + 8 * (v41 >> 6)))) | v41 & 0x7FFFFFFFFFFFFFC0;
      v16 = v53;
    }
    else
    {
      v43 = 0;
      v44 = (unint64_t)(63 - v40) >> 6;
      v16 = v53;
      do
      {
        if (++v42 == v44 && (v43 & 1) != 0)
        {
          __break(1u);
          goto LABEL_49;
        }
        v45 = v42 == v44;
        if (v42 == v44)
          v42 = 0;
        v43 |= v45;
        v46 = *(_QWORD *)(v12 + 8 * v42);
      }
      while (v46 == -1);
      v15 = __clz(__rbit64(~v46)) + (v42 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v17 = *(_QWORD *)(v8 + 48) + 24 * v15;
    *(_QWORD *)v17 = v29;
    *(_OWORD *)(v17 + 8) = v16;
    v18 = *(_QWORD *)(v8 + 56) + 72 * v15;
    *(_OWORD *)v18 = v55;
    v19 = v56;
    v20 = v57;
    v21 = v58;
    *(_BYTE *)(v18 + 64) = v59;
    *(_OWORD *)(v18 + 32) = v20;
    *(_OWORD *)(v18 + 48) = v21;
    *(_OWORD *)(v18 + 16) = v19;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v48;
  v25 = v50;
  if ((v51 & 1) == 0)
    goto LABEL_48;
LABEL_44:
  v47 = 1 << *(_BYTE *)(v5 + 32);
  if (v47 >= 64)
    bzero(v25, ((unint64_t)(v47 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v25 = -1 << v47;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_48:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_1000712CC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
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
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  char v37;
  _QWORD v38[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100005104(&qword_1000B9D38);
  v37 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v35 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v22 >= v35)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v35)
        goto LABEL_36;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_36:
          swift_release(v5);
          if ((v37 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_45;
            if (v14 >= v35)
              goto LABEL_36;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_33;
          }
        }
        v14 = v25;
      }
    }
LABEL_33:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      swift_bridgeObjectRetain(v33);
    }
    Hasher.init(_seed:)(v38, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v38, v32, v31);
    result = Hasher._finalize()();
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
          goto LABEL_44;
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
  swift_release(v5);
  v23 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_1000715E0(uint64_t a1, uint64_t a2)
{
  Swift::Int *v2;
  Swift::Int *v3;
  Swift::Int v5;
  uint64_t v6;
  Swift::Int result;
  Swift::Int v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  Swift::Int v13;
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
  Swift::UInt v30;
  uint64_t v31;
  uint64_t v32;
  Swift::Int *v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100005104(&qword_1000B9D30);
  result = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v33 = v3;
    v9 = 0;
    v35 = (_QWORD *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v34 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v20 = v19 | (v9 << 6);
      }
      else
      {
        v21 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v21 >= v34)
          goto LABEL_36;
        v22 = v35[v21];
        ++v9;
        if (!v22)
        {
          v9 = v21 + 1;
          if (v21 + 1 >= v34)
            goto LABEL_36;
          v22 = v35[v9];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v34)
            {
LABEL_36:
              if ((a2 & 1) == 0)
              {
                result = swift_release(v5);
                v3 = v33;
                goto LABEL_43;
              }
              v32 = 1 << *(_BYTE *)(v5 + 32);
              if (v32 >= 64)
                bzero(v35, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v35 = -1 << v32;
              v3 = v33;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v22 = v35[v23];
            if (!v22)
            {
              while (1)
              {
                v9 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_45;
                if (v9 >= v34)
                  goto LABEL_36;
                v22 = v35[v9];
                ++v23;
                if (v22)
                  goto LABEL_33;
              }
            }
            v9 = v23;
          }
        }
LABEL_33:
        v12 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v9 << 6);
      }
      v28 = 8 * v20;
      v29 = *(_QWORD *)(v5 + 48);
      v30 = *(_QWORD *)(v29 + v28);
      v31 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v28);
      if ((a2 & 1) == 0)
      {
        swift_retain(*(_QWORD *)(v29 + v28));
        swift_retain(v31);
      }
      Hasher.init(_seed:)(v36, *(_QWORD *)(v8 + 40));
      Hasher._combine(_:)(v30);
      result = Hasher._finalize()();
      v14 = -1 << *(_BYTE *)(v8 + 32);
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
            goto LABEL_44;
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
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + v18) = v30;
      *(_QWORD *)(*(_QWORD *)(v8 + 56) + v18) = v31;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
LABEL_43:
  *v3 = v8;
  return result;
}

unint64_t sub_1000718C0(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = (_QWORD *)(a6[6] + 24 * result);
  *v6 = a2;
  v6[1] = a3;
  v6[2] = a4;
  v7 = a6[7] + 72 * result;
  *(_BYTE *)(v7 + 64) = *(_BYTE *)(a5 + 64);
  v8 = *(_OWORD *)(a5 + 48);
  *(_OWORD *)(v7 + 32) = *(_OWORD *)(a5 + 32);
  *(_OWORD *)(v7 + 48) = v8;
  v9 = *(_OWORD *)(a5 + 16);
  *(_OWORD *)v7 = *(_OWORD *)a5;
  *(_OWORD *)(v7 + 16) = v9;
  v10 = a6[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a6[2] = v12;
  return result;
}

double sub_10007192C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v10;
  unint64_t v11;
  char v12;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  double result;
  uint64_t v22;

  v5 = v4;
  v10 = *v5;
  swift_bridgeObjectRetain(*v5);
  v11 = sub_100058C68(a1, a2, a3);
  LOBYTE(a3) = v12;
  swift_bridgeObjectRelease(v10);
  if ((a3 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v5);
    v14 = *v5;
    v22 = *v5;
    *v5 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1000705EC();
      v14 = v22;
    }
    v15 = *(_QWORD *)(v14 + 48) + 24 * v11;
    v16 = *(_QWORD *)(v15 + 8);
    swift_bridgeObjectRelease(*(_QWORD *)(v15 + 16));
    swift_bridgeObjectRelease(v16);
    v17 = *(_QWORD *)(v14 + 56) + 72 * v11;
    v18 = *(_OWORD *)(v17 + 48);
    *(_OWORD *)(a4 + 32) = *(_OWORD *)(v17 + 32);
    *(_OWORD *)(a4 + 48) = v18;
    *(_BYTE *)(a4 + 64) = *(_BYTE *)(v17 + 64);
    v19 = *(_OWORD *)(v17 + 16);
    *(_OWORD *)a4 = *(_OWORD *)v17;
    *(_OWORD *)(a4 + 16) = v19;
    sub_100071A4C(v11, v14);
    v20 = *v5;
    *v5 = v14;
    swift_bridgeObjectRelease(v20);
  }
  else
  {
    *(_BYTE *)(a4 + 64) = 0;
    result = 0.0;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
  }
  return result;
}

unint64_t sub_100071A4C(unint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  Swift::Int v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  __int128 *v24;
  __int128 v25;
  uint64_t v26;
  const void *v27;
  BOOL v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  unint64_t v35;
  int64_t v36;
  _QWORD v37[9];

  v2 = a2;
  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      v35 = v8;
      do
      {
        v9 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 24 * v6);
        v10 = *v9;
        v11 = v9[1];
        v12 = v9[2];
        Hasher.init(_seed:)(v37, *(_QWORD *)(v2 + 40));
        swift_bridgeObjectRetain(v11);
        swift_bridgeObjectRetain(v12);
        String.hash(into:)(v37, v10, v11);
        Hasher._combine(_:)(*(_QWORD *)(v12 + 16));
        v13 = *(_QWORD *)(v12 + 16);
        if (v13)
        {
          v36 = v3;
          v14 = v2;
          v15 = v7;
          v16 = v4;
          swift_bridgeObjectRetain(v12);
          v17 = (_QWORD *)(v12 + 40);
          do
          {
            v18 = *(v17 - 1);
            v19 = *v17;
            swift_bridgeObjectRetain(*v17);
            String.hash(into:)(v37, v18, v19);
            swift_bridgeObjectRelease(v19);
            v17 += 2;
            --v13;
          }
          while (v13);
          swift_bridgeObjectRelease(v12);
          v4 = v16;
          v7 = v15;
          v2 = v14;
          v8 = v35;
          v3 = v36;
        }
        v20 = Hasher._finalize()();
        swift_bridgeObjectRelease(v12);
        result = swift_bridgeObjectRelease(v11);
        v21 = v20 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v21 < v8)
            goto LABEL_5;
        }
        else if (v21 >= v8)
        {
          goto LABEL_15;
        }
        if (v3 >= (uint64_t)v21)
        {
LABEL_15:
          v22 = *(_QWORD *)(v2 + 48);
          v23 = v22 + 24 * v3;
          v24 = (__int128 *)(v22 + 24 * v6);
          if (v3 != v6 || v23 >= (unint64_t)v24 + 24)
          {
            v25 = *v24;
            *(_QWORD *)(v23 + 16) = *((_QWORD *)v24 + 2);
            *(_OWORD *)v23 = v25;
          }
          v26 = *(_QWORD *)(v2 + 56);
          result = v26 + 72 * v3;
          v27 = (const void *)(v26 + 72 * v6);
          if (72 * v3 < (uint64_t)(72 * v6) || result >= (unint64_t)v27 + 72 || (v28 = v3 == v6, v3 = v6, !v28))
          {
            result = (unint64_t)memmove((void *)result, v27, 0x48uLL);
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v29 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v30 = *v29;
    v31 = (-1 << v3) - 1;
  }
  else
  {
    v29 = (uint64_t *)(v4 + 8 * (result >> 6));
    v31 = *v29;
    v30 = (-1 << result) - 1;
  }
  *v29 = v31 & v30;
  v32 = *(_QWORD *)(v2 + 16);
  v33 = __OFSUB__(v32, 1);
  v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v2 + 16) = v34;
    ++*(_DWORD *)(v2 + 36);
  }
  return result;
}

uint64_t sub_100071CE0(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, char a5)
{
  _QWORD *v5;
  _QWORD **v6;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t result;
  unint64_t v22;
  char v23;

  v6 = (_QWORD **)v5;
  v12 = (_QWORD *)*v5;
  v14 = sub_100058C68(a2, a3, a4);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a5 & 1) != 0)
    {
LABEL_7:
      v20 = *v6;
      if ((v18 & 1) != 0)
        return sub_100071E2C(a1, v20[7] + 72 * v14);
      goto LABEL_11;
    }
    if (v19 >= v17 && (a5 & 1) == 0)
    {
      sub_1000705EC();
      goto LABEL_7;
    }
    sub_100070EC4(v17, a5 & 1);
    v22 = sub_100058C68(a2, a3, a4);
    if ((v18 & 1) == (v23 & 1))
    {
      v14 = v22;
      v20 = *v6;
      if ((v18 & 1) != 0)
        return sub_100071E2C(a1, v20[7] + 72 * v14);
LABEL_11:
      sub_1000718C0(v14, a2, a3, (uint64_t)a4, a1, v20);
      swift_bridgeObjectRetain(a3);
      return swift_bridgeObjectRetain(a4);
    }
  }
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for InputKey);
  __break(1u);
  return result;
}

uint64_t sub_100071E2C(uint64_t a1, uint64_t a2)
{
  assignWithTake for ParsedValues.Element(a2, a1);
  return a2;
}

uint64_t destroy for ParserError(uint64_t a1)
{
  return sub_10006749C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_BYTE *)(a1 + 80));
}

uint64_t initializeWithCopy for ParserError(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  char v14;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_BYTE *)(a2 + 80);
  sub_100067314(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v13;
  *(_BYTE *)(a1 + 80) = v14;
  return a1;
}

uint64_t assignWithCopy for ParserError(uint64_t a1, uint64_t a2)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v24;
  char v25;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v24 = *(_QWORD *)(a2 + 72);
  v25 = *(_BYTE *)(a2 + 80);
  sub_100067314(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25);
  v12 = *(_QWORD *)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(_QWORD *)(a1 + 64);
  v21 = *(_QWORD *)(a1 + 72);
  v22 = *(_BYTE *)(a1 + 80);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v24;
  *(_BYTE *)(a1 + 80) = v25;
  sub_10006749C(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  return a1;
}

__n128 initializeWithTake for ParserError(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for ParserError(uint64_t a1, uint64_t a2)
{
  char v3;
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
  char v14;
  __int128 v15;
  __int128 v16;

  v3 = *(_BYTE *)(a2 + 80);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 72);
  v14 = *(_BYTE *)(a1 + 80);
  v15 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v15;
  v16 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v16;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = v3;
  sub_10006749C(v4, v6, v5, v7, v8, v9, v10, v11, v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for ParserError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xF1 && *(_BYTE *)(a1 + 81))
    return (*(_DWORD *)a1 + 241);
  v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 <= 0xF)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ParserError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 80) = 0;
    *(_QWORD *)result = a2 - 241;
    if (a3 >= 0xF1)
      *(_BYTE *)(result + 81) = 1;
  }
  else
  {
    if (a3 >= 0xF1)
      *(_BYTE *)(result + 81) = 0;
    if (a2)
      *(_BYTE *)(result + 80) = -(char)a2;
  }
  return result;
}

uint64_t sub_100072168(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 80) <= 0xEu)
    return *(unsigned __int8 *)(a1 + 80);
  else
    return (*(_DWORD *)a1 + 15);
}

uint64_t sub_100072180(uint64_t result, unsigned int a2)
{
  if (a2 >= 0xF)
  {
    *(_QWORD *)result = a2 - 15;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)(result + 72) = 0;
    LOBYTE(a2) = 15;
  }
  *(_BYTE *)(result + 80) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ParserError()
{
  return &type metadata for ParserError;
}

uint64_t destroy for InternalParseError(uint64_t result)
{
  uint64_t v1;
  unsigned int v2;

  v1 = result;
  v2 = *(unsigned __int8 *)(result + 56);
  if (v2 >= 4)
    v2 = *(_DWORD *)result + 4;
  if (!v2)
  {
    if (*(_QWORD *)(result + 24))
      sub_1000062D8((_QWORD *)result);
    swift_bridgeObjectRelease(*(_QWORD *)(v1 + 40));
    return swift_bridgeObjectRelease(*(_QWORD *)(v1 + 48));
  }
  return result;
}

uint64_t initializeWithCopy for InternalParseError(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(unsigned __int8 *)(a2 + 56);
  if (v4 >= 4)
    v4 = *(_DWORD *)a2 + 4;
  switch(v4)
  {
    case 0u:
      v5 = *(_QWORD *)(a2 + 24);
      if (v5)
      {
        *(_QWORD *)(a1 + 24) = v5;
        (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
      }
      else
      {
        v7 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v7;
      }
      v8 = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 40) = v8;
      v9 = *(_QWORD *)(a2 + 48);
      *(_QWORD *)(a1 + 48) = v9;
      *(_BYTE *)(a1 + 56) = 0;
      swift_bridgeObjectRetain(v8);
      swift_bridgeObjectRetain(v9);
      break;
    case 1u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_BYTE *)(a1 + 56) = 1;
      break;
    case 2u:
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_BYTE *)(a1 + 56) = 2;
      break;
    case 3u:
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_BYTE *)(a1 + 56) = 3;
      break;
    default:
      v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
      break;
  }
  return a1;
}

uint64_t assignWithCopy for InternalParseError(uint64_t a1, __int128 *a2)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  if ((__int128 *)a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 56);
    if (v4 >= 4)
      v4 = *(_DWORD *)a1 + 4;
    if (!v4)
    {
      if (*(_QWORD *)(a1 + 24))
        sub_1000062D8((_QWORD *)a1);
      swift_bridgeObjectRelease(*(_QWORD *)(a1 + 40));
      swift_bridgeObjectRelease(*(_QWORD *)(a1 + 48));
    }
    v5 = *((unsigned __int8 *)a2 + 56);
    if (v5 >= 4)
      v5 = *(_DWORD *)a2 + 4;
    switch(v5)
    {
      case 0u:
        v6 = *((_QWORD *)a2 + 3);
        if (v6)
        {
          *(_QWORD *)(a1 + 24) = v6;
          (**(void (***)(uint64_t, __int128 *))(v6 - 8))(a1, a2);
        }
        else
        {
          v10 = a2[1];
          *(_OWORD *)a1 = *a2;
          *(_OWORD *)(a1 + 16) = v10;
        }
        *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
        v11 = *((_QWORD *)a2 + 5);
        *(_QWORD *)(a1 + 40) = v11;
        v12 = *((_QWORD *)a2 + 6);
        *(_QWORD *)(a1 + 48) = v12;
        *(_BYTE *)(a1 + 56) = 0;
        swift_bridgeObjectRetain(v11);
        swift_bridgeObjectRetain(v12);
        break;
      case 1u:
        *(_OWORD *)a1 = *a2;
        *(_BYTE *)(a1 + 56) = 1;
        break;
      case 2u:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_BYTE *)(a1 + 56) = 2;
        break;
      case 3u:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_BYTE *)(a1 + 56) = 3;
        break;
      default:
        v7 = *a2;
        v8 = a2[1];
        v9 = a2[2];
        *(_OWORD *)(a1 + 41) = *(__int128 *)((char *)a2 + 41);
        *(_OWORD *)(a1 + 16) = v8;
        *(_OWORD *)(a1 + 32) = v9;
        *(_OWORD *)a1 = v7;
        break;
    }
  }
  return a1;
}

__n128 initializeWithTake for SplitArguments.Element(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for InternalParseError(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  __int128 v6;
  __int128 v7;
  char v8;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 56);
    if (v4 >= 4)
      v4 = *(_DWORD *)a1 + 4;
    if (!v4)
    {
      if (*(_QWORD *)(a1 + 24))
        sub_1000062D8((_QWORD *)a1);
      swift_bridgeObjectRelease(*(_QWORD *)(a1 + 40));
      swift_bridgeObjectRelease(*(_QWORD *)(a1 + 48));
    }
    v5 = *(unsigned __int8 *)(a2 + 56);
    if (v5 >= 4)
      v5 = *(_DWORD *)a2 + 4;
    switch(v5)
    {
      case 0u:
        v6 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v6;
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
        *(_BYTE *)(a1 + 56) = 0;
        return a1;
      case 1u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        v8 = 1;
        goto LABEL_16;
      case 2u:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        v8 = 2;
        goto LABEL_16;
      case 3u:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        v8 = 3;
LABEL_16:
        *(_BYTE *)(a1 + 56) = v8;
        break;
      default:
        v7 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v7;
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
        break;
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for InternalParseError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 57))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 56);
  if (v3 >= 5)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for InternalParseError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_OWORD *)(result + 41) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)result = 0u;
    *(_DWORD *)result = a2 - 252;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 57) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 57) = 0;
    if (a2)
      *(_BYTE *)(result + 56) = -(char)a2;
  }
  return result;
}

uint64_t sub_100072614(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 56);
  if (result >= 4)
    return (*(_DWORD *)a1 + 4);
  return result;
}

uint64_t sub_100072630(uint64_t result, unsigned int a2)
{
  if (a2 > 3)
  {
    *(_QWORD *)(result + 48) = 0;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)result = 0u;
    *(_DWORD *)result = a2 - 4;
    LOBYTE(a2) = 4;
  }
  *(_BYTE *)(result + 56) = a2;
  return result;
}

ValueMetadata *type metadata accessor for InternalParseError()
{
  return &type metadata for InternalParseError;
}

uint64_t sub_10007266C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  int64x2_t v9;
  char v10;
  int64_t v11;
  int64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64x2_t v18;
  int64x2_t v19;

  v6 = *v4;
  v7 = v4[1];
  result = sub_100075A84(a1, a2, a3 & 0x1FF, *v4, v7);
  v9 = 0uLL;
  if ((v10 & 1) != 0)
    goto LABEL_16;
  if (v7 < 0)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v11 = result;
  v12 = *(_QWORD *)(v6 + 16);
  if (v12 < (unint64_t)v7 || v12 < result)
    goto LABEL_20;
  if (result >= v7)
  {
    if (result != v12)
    {
      v14 = v6 + (result << 6) + 48;
      while (1)
      {
        if (v11 >= v12)
        {
          __break(1u);
          goto LABEL_19;
        }
        if ((*(_BYTE *)(v14 + 40) & 1) != 0)
          break;
        ++v11;
        v14 += 64;
        if (v12 == v11)
          goto LABEL_16;
      }
      if ((*(_QWORD *)v14 & 0x6000000000000000) != 0x2000000000000000)
        goto LABEL_16;
      v15 = *(_QWORD *)(v14 - 16);
      v16 = *(_QWORD *)(v14 - 8);
      v17 = *(_QWORD *)(v14 + 24);
      v18 = vdupq_n_s64(1uLL);
      v18.i64[0] = *(_QWORD *)(v14 + 32);
      v19 = v18;
      sub_10005BDF8(v15, v16, *(_QWORD *)v14, *(_QWORD *)(v14 + 8), *(_QWORD *)(v14 + 16));
      result = (uint64_t)sub_100074228((char **)v4, v11);
      v9 = v19;
      goto LABEL_17;
    }
LABEL_16:
    v17 = 0;
    v15 = 0;
    v16 = 0;
LABEL_17:
    *(_QWORD *)a4 = v17;
    *(int64x2_t *)(a4 + 8) = v9;
    *(_QWORD *)(a4 + 24) = v15;
    *(_QWORD *)(a4 + 32) = v16;
    return result;
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_10007278C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, _QWORD *a4@<X8>)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  char v9;
  int64_t v10;
  int64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = *v4;
  v7 = v4[1];
  result = sub_100075A84(a1, a2, a3 & 0x1FF, *v4, v7);
  if ((v9 & 1) != 0)
    goto LABEL_16;
  if (v7 < 0)
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v10 = result;
  v11 = *(_QWORD *)(v6 + 16);
  if (v11 < (unint64_t)v7 || v11 < result)
    goto LABEL_24;
  if (result < v7)
    goto LABEL_25;
  if (result == v11)
  {
LABEL_16:
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    goto LABEL_17;
  }
  result = swift_bridgeObjectRetain(v6);
  v13 = v6 + (v10 << 6) + 48;
  while (1)
  {
    if (v10 >= v11)
    {
      __break(1u);
      goto LABEL_23;
    }
    v14 = (*(_QWORD *)v13 >> 61) & 3;
    if ((_DWORD)v14)
      break;
LABEL_10:
    ++v10;
    v13 += 64;
    if (v11 == v10)
    {
      result = swift_bridgeObjectRelease(v6);
      goto LABEL_16;
    }
  }
  if ((_DWORD)v14 == 2)
  {
    result = sub_100066ED8(*(_QWORD *)(v13 - 16), *(_QWORD *)(v13 - 8), *(_QWORD *)v13, *(_QWORD *)(v13 + 8), *(_QWORD *)(v13 + 16));
    goto LABEL_10;
  }
  result = swift_bridgeObjectRelease(v6);
  v20 = *(_QWORD *)(v6 + 16);
  if (v20 < v7)
    goto LABEL_26;
  if (v10 >= v20)
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    return result;
  }
  v21 = *(_QWORD *)v13;
  if ((*(_QWORD *)v13 & 0x6000000000000000) != 0x2000000000000000)
    goto LABEL_28;
  v22 = *(_QWORD *)(v13 + 8);
  v23 = *(_QWORD *)(v13 + 16);
  v18 = *(_QWORD *)(v13 - 16);
  v19 = *(_QWORD *)(v13 - 8);
  v17 = *(unsigned __int8 *)(v13 + 40);
  v24 = v13 + 24;
  v15 = *(_QWORD *)(v13 + 24);
  v16 = *(_QWORD *)(v24 + 8);
  sub_10005BDF8(v18, v19, v21, v22, v23);
  result = (uint64_t)sub_100074228((char **)v4, v10);
LABEL_17:
  *a4 = v15;
  a4[1] = v16;
  a4[2] = v17;
  a4[3] = v18;
  a4[4] = v19;
  return result;
}

uint64_t sub_1000728F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  int64x2_t v9;
  char v10;
  int64_t v11;
  _BYTE *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v6 = *v4;
  v7 = v4[1];
  result = sub_100075A84(a1, a2, a3 & 0x1FF, *v4, v7);
  v9 = 0uLL;
  if ((v10 & 1) != 0)
    goto LABEL_13;
  if (v7 < 0)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    return result;
  }
  v11 = *(_QWORD *)(v6 + 16);
  if (v11 < (unint64_t)v7 || v11 < result)
    goto LABEL_20;
  if (result < v7)
    goto LABEL_21;
  if (result != v11)
  {
    v13 = (_BYTE *)(v6 + (result << 6) + 88);
    while (1)
    {
      if (result >= v11)
      {
        __break(1u);
        goto LABEL_19;
      }
      if ((*v13 & 1) != 0)
        break;
      ++result;
      v13 += 64;
      if (v11 == result)
        goto LABEL_13;
    }
    v14 = *((_QWORD *)v13 - 2);
    v16 = *((_QWORD *)v13 - 1);
    result = sub_100074388(v14, v16, 1);
    if ((v14 & 0x8000000000000000) != 0)
      goto LABEL_22;
    v17 = v4[2];
    if (v14 < *(_QWORD *)(v17 + 16))
    {
      v18 = v17 + 16 * v14;
      v15 = *(_QWORD *)(v18 + 32);
      result = swift_bridgeObjectRetain(*(_QWORD *)(v18 + 40));
      v9 = vdupq_n_s64(1uLL);
      v9.i64[0] = v16;
      goto LABEL_14;
    }
    goto LABEL_23;
  }
LABEL_13:
  v14 = 0;
  v15 = 0;
  result = 0;
LABEL_14:
  *(_QWORD *)a4 = v14;
  *(int64x2_t *)(a4 + 8) = v9;
  *(_QWORD *)(a4 + 24) = v15;
  *(_QWORD *)(a4 + 32) = result;
  return result;
}

uint64_t sub_100072A00@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  __int128 v11;

  v3 = v1[1];
  v4 = *(_QWORD *)(*v1 + 16);
  if (v4 < v3)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v3 < 0)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  v5 = 0uLL;
  if (v3 != v4)
  {
    v6 = *v1 + (v3 << 6) + 48;
    while (v3 < v4)
    {
      if ((*(_QWORD *)v6 & 0x6000000000000000) == 0x2000000000000000)
      {
        v8 = *(_QWORD *)(v6 - 16);
        v9 = *(_QWORD *)(v6 - 8);
        v11 = *(_OWORD *)(v6 + 24);
        v7 = *(unsigned __int8 *)(v6 + 40);
        sub_10005BDF8(v8, v9, *(_QWORD *)v6, *(_QWORD *)(v6 + 8), *(_QWORD *)(v6 + 16));
        result = sub_100074524(v3);
        v5 = v11;
        goto LABEL_10;
      }
      ++v3;
      v6 += 64;
      if (v4 == v3)
        goto LABEL_8;
    }
    __break(1u);
    goto LABEL_12;
  }
LABEL_8:
  v7 = 0;
  v8 = 0;
  v9 = 0;
LABEL_10:
  *(_OWORD *)a1 = v5;
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  *(_QWORD *)(a1 + 32) = v9;
  return result;
}

_QWORD *sub_100072ADC(_QWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;
  char *v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  _QWORD *v14;

  v3 = result[2];
  if (v3 < a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (a2 < 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v6 = result;
  v7 = v3 - a2;
  if (v3 == a2)
  {
    v8 = (char *)_swiftEmptyArrayStorage;
LABEL_15:
    swift_bridgeObjectRetain(v6);
    v13 = sub_100074E94(v6 + 4, a2, (2 * v3) | 1, v8);
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v8);
    swift_bridgeObjectRetain(v6);
    swift_bridgeObjectRetain(a3);
    v14 = sub_10007509C((uint64_t)v13, a3);
    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease(a3);
    swift_bridgeObjectRelease(v6);
    return v14;
  }
  if (v3 > (unint64_t)a2)
  {
    swift_bridgeObjectRetain(result);
    v9 = &v6[8 * a2 + 11];
    v8 = (char *)_swiftEmptyArrayStorage;
    do
    {
      if (*v9 == 1)
      {
        v10 = *((_QWORD *)v9 - 2);
        if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0)
          v8 = sub_100058538(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
        v12 = *((_QWORD *)v8 + 2);
        v11 = *((_QWORD *)v8 + 3);
        if (v12 >= v11 >> 1)
          v8 = sub_100058538((char *)(v11 > 1), v12 + 1, 1, v8);
        *((_QWORD *)v8 + 2) = v12 + 1;
        *(_QWORD *)&v8[8 * v12 + 32] = v10;
      }
      v9 += 64;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease(v6);
    goto LABEL_15;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_100072C84(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t result;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
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
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  char *v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v67[5];
  _OWORD v68[2];
  uint64_t v69;
  __n128 v70;
  uint64_t v71;
  __n128 v72;
  __n128 v73;
  unsigned __int8 v74;

  if ((a2 & 0x2000000000000000) != 0)
    v6 = HIBYTE(a2) & 0xF;
  else
    v6 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v6)
  {
LABEL_11:
    v13 = String.count.getter(a1, a2);
    if (v13 < 2)
    {
      v14 = sub_100005104(&qword_1000B9700);
      v3 = swift_allocObject(v14, 96, 7);
      *(_OWORD *)(v3 + 16) = xmmword_100096510;
      *(_QWORD *)(v3 + 32) = a1;
      *(_QWORD *)(v3 + 40) = a2;
      *(_QWORD *)(v3 + 48) = 0x2000000000000000;
      *(_QWORD *)(v3 + 56) = 0;
      *(_QWORD *)(v3 + 64) = 0;
      *(_QWORD *)(v3 + 72) = a3;
      *(_QWORD *)(v3 + 80) = 0;
      *(_BYTE *)(v3 + 88) = 1;
      swift_bridgeObjectRetain(a2);
      return v3;
    }
    if (v13 != 2)
      goto LABEL_27;
    v15 = sub_100005104(&qword_1000B9700);
    v16 = swift_allocObject(v15, 96, 7);
    v3 = v16;
    *(_OWORD *)(v16 + 16) = xmmword_100096510;
    *(_QWORD *)(v16 + 32) = 0;
    *(_QWORD *)(v16 + 40) = 0;
    *(_QWORD *)(v16 + 48) = 0x4000000000000000;
    *(_QWORD *)(v16 + 56) = 0;
    *(_QWORD *)(v16 + 64) = 0;
    *(_QWORD *)(v16 + 72) = a3;
    goto LABEL_15;
  }
  v7 = 0;
  v8 = 4 * v6;
  v3 = 15;
  while (1)
  {
    v10 = String.subscript.getter(v3, a1, a2);
    v12 = v11;
    if (v10 == 45 && v11 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease(0xE100000000000000);
      goto LABEL_7;
    }
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, v11, 45, 0xE100000000000000, 0);
    swift_bridgeObjectRelease(v12);
    if ((v9 & 1) == 0)
      break;
LABEL_7:
    v3 = String.index(after:)(v3, a1, a2);
    v7 = v3 >> 14;
    if (v3 >> 14 == v8)
      goto LABEL_11;
  }
  v17 = String.distance(from:to:)(15, v3, a1, a2);
  if (v8 < v7)
  {
    __break(1u);
LABEL_48:
    result = swift_bridgeObjectRelease(v12);
    __break(1u);
    return result;
  }
  v18 = v17;
  v19 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0)
    v19 = 11;
  v20 = String.subscript.getter(v3, v19 | (v6 << 16), a1, a2);
  v12 = v23;
  if (v18 == 1)
  {
    v25 = v20;
    v26 = v21;
    v27 = v22;
    swift_bridgeObjectRetain(v23);
    sub_100075434(v25, v26, v27, v12, v67);
    if (v64)
    {
      swift_bridgeObjectRelease(v12);
      return v3;
    }
    v60 = v67[0];
    v62 = v67[1];
    v35 = v67[3];
    v65 = v67[2];
    v36 = v67[4];
    sub_100066F84((uint64_t)v67, (uint64_t)&v70);
    if (v71 < 0)
    {
      v71 &= ~0x8000000000000000;
    }
    else
    {
      sub_100066FC0(&v70, &v72);
      sub_100066FC0(&v72, &v73);
      if (v74 >> 6 > 1u)
      {
        v74 &= 0x3Fu;
        v39 = v73.n128_i64[1];
        v38 = v73.n128_u64[0];
        sub_100030508(v60, v62, v65);
        v37 = sub_100060EC4(v38, v39);
        sub_100066FFC(v67);
        goto LABEL_35;
      }
      v74 &= 0x3Fu;
    }
    v37 = _swiftEmptyArrayStorage;
LABEL_35:
    v40 = v37[2];
    if (v40)
    {
      if (v40 != 1)
      {
        swift_bridgeObjectRelease(v12);
        v47 = sub_100005104(&qword_1000B9700);
        v3 = swift_allocObject(v47, 96, 7);
        *(_OWORD *)(v3 + 16) = xmmword_100096510;
        *(_QWORD *)(v3 + 32) = v60;
        *(_QWORD *)(v3 + 40) = v62;
        *(_QWORD *)(v3 + 48) = v65;
        *(_QWORD *)(v3 + 56) = v35;
        *(_QWORD *)(v3 + 64) = v36;
        *(_QWORD *)(v3 + 72) = a3;
        *(_QWORD *)(v3 + 80) = 0;
        *(_BYTE *)(v3 + 88) = 1;
        v48 = v37[2];
        if (v48)
        {
          v61 = v37;
          v49 = v37 + 9;
          do
          {
            v50 = *(v49 - 4);
            v63 = *(v49 - 5);
            v51 = *(v49 - 3);
            v52 = *(v49 - 2);
            v53 = *(v49 - 1);
            v54 = *v49;
            sub_10005BE18(v50, v51, v52, v53, *v49);
            v56 = *(_QWORD *)(v3 + 16);
            v55 = *(_QWORD *)(v3 + 24);
            v57 = v56 + 1;
            if (v56 >= v55 >> 1)
            {
              v59 = sub_100058438((char *)(v55 > 1), v56 + 1, 1, (char *)v3);
              v57 = v56 + 1;
              v3 = (unint64_t)v59;
            }
            v49 += 6;
            *(_QWORD *)(v3 + 16) = v57;
            v58 = v3 + (v56 << 6);
            *(_QWORD *)(v58 + 32) = v50;
            *(_QWORD *)(v58 + 40) = v51;
            *(_QWORD *)(v58 + 48) = v52;
            *(_QWORD *)(v58 + 56) = v53;
            *(_QWORD *)(v58 + 64) = v54;
            *(_QWORD *)(v58 + 72) = a3;
            *(_QWORD *)(v58 + 80) = v63;
            *(_BYTE *)(v58 + 88) = 0;
            --v48;
          }
          while (v48);
          swift_bridgeObjectRelease(v61);
        }
        else
        {
          swift_bridgeObjectRelease(v37);
        }
        return v3;
      }
      sub_100066FFC(v67);
      swift_bridgeObjectRelease(v37);
      v41 = sub_100005104(&qword_1000B9700);
      v42 = swift_allocObject(v41, 96, 7);
      *(_OWORD *)(v42 + 16) = xmmword_100096510;
      if ((v25 ^ v26) >> 14)
      {
        v3 = v42;
        v43 = Substring.subscript.getter(v25, v25, v26, v27, v12);
        v45 = v44;
        swift_bridgeObjectRelease(v12);
        *(_QWORD *)(v3 + 32) = v43;
        *(_QWORD *)(v3 + 40) = v45;
        *(_QWORD *)(v3 + 48) = 64;
        *(_QWORD *)(v3 + 56) = 0;
        *(_QWORD *)(v3 + 64) = 0;
LABEL_26:
        *(_QWORD *)(v3 + 72) = a3;
        *(_QWORD *)(v3 + 80) = 0;
        *(_BYTE *)(v3 + 88) = 1;
        return v3;
      }
      goto LABEL_48;
    }
    swift_bridgeObjectRelease(v37);
    swift_bridgeObjectRelease(v12);
    v46 = sub_100005104(&qword_1000B9700);
    v16 = swift_allocObject(v46, 96, 7);
    v3 = v16;
    *(_OWORD *)(v16 + 16) = xmmword_100096510;
    *(_QWORD *)(v16 + 32) = v60;
    *(_QWORD *)(v16 + 40) = v62;
    *(_QWORD *)(v16 + 48) = v65;
    *(_QWORD *)(v16 + 56) = v35;
    *(_QWORD *)(v16 + 64) = v36;
    *(_QWORD *)(v16 + 72) = a3;
LABEL_15:
    *(_QWORD *)(v16 + 80) = 0;
    *(_BYTE *)(v16 + 88) = 1;
    return v3;
  }
  if (!v18)
  {
    swift_bridgeObjectRelease(v23);
    v24 = sub_100005104(&qword_1000B9700);
    v3 = swift_allocObject(v24, 96, 7);
    *(_OWORD *)(v3 + 16) = xmmword_100096510;
    *(_QWORD *)(v3 + 32) = a1;
    *(_QWORD *)(v3 + 40) = a2;
    *(_QWORD *)(v3 + 48) = 0x2000000000000000;
    *(_QWORD *)(v3 + 56) = 0;
    *(_QWORD *)(v3 + 64) = 0;
    *(_QWORD *)(v3 + 72) = a3;
    *(_QWORD *)(v3 + 80) = 0;
    *(_BYTE *)(v3 + 88) = 1;
    swift_bridgeObjectRetain(a2);
    return v3;
  }
  swift_bridgeObjectRelease(v23);
  if (v18 == 2)
  {
    v28 = sub_100005104(&qword_1000B9700);
    v3 = swift_allocObject(v28, 96, 7);
    *(_OWORD *)(v3 + 16) = xmmword_100096510;
    swift_bridgeObjectRetain(a2);
    sub_1000732B4(a1, a2, (uint64_t *)v68);
    v29 = v69;
    v30 = v68[1];
    *(_OWORD *)(v3 + 32) = v68[0];
    *(_OWORD *)(v3 + 48) = v30;
    *(_QWORD *)(v3 + 64) = v29;
    goto LABEL_26;
  }
LABEL_27:
  v31 = sub_10002EA1C();
  swift_allocError(&type metadata for ParserError, v31, 0, 0);
  *(_QWORD *)v32 = a1;
  *(_QWORD *)(v32 + 8) = a2;
  *(_OWORD *)(v32 + 16) = 0u;
  *(_OWORD *)(v32 + 32) = 0u;
  *(_OWORD *)(v32 + 48) = 0u;
  *(_OWORD *)(v32 + 64) = 0u;
  *(_BYTE *)(v32 + 80) = 5;
  v33 = swift_bridgeObjectRetain(a2);
  swift_willThrow(v33);
  return v3;
}

unint64_t sub_1000732B4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v6;
  char v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t result;
  char v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v6 = sub_10007CD40(61, 0xE100000000000000, a1, a2);
  if ((v7 & 1) != 0)
  {
    v9 = HIBYTE(a2) & 0xF;
    if ((a2 & 0x2000000000000000) == 0)
      v9 = a1;
    v10 = v9 << 16;
    if ((a2 & 0x1000000000000000) == 0 || (a1 & 0x800000000000000) != 0)
      v8 = v10 | 7;
    else
      v8 = v10 | 0xB;
  }
  else
  {
    v8 = v6;
  }
  v11 = String.subscript.getter(15, v8, a1, a2);
  v13 = v12;
  v15 = v14;
  v41 = v16;
  v17 = sub_100014AA0(v8, a1, a2);
  v19 = v18;
  v21 = v20;
  result = Substring.index(_:offsetBy:limitedBy:)(v17, 1, v19, v17, v19, v22, v20);
  if ((v24 & 1) != 0)
    result = v19;
  if (v19 >> 14 < result >> 14)
  {
    __break(1u);
  }
  else
  {
    v25 = Substring.subscript.getter(result);
    v27 = v26;
    v29 = v28;
    v31 = v30;
    swift_bridgeObjectRelease(v21);
    v32 = sub_10006DE14(v11, v13, v15, v41);
    v34 = v33;
    v36 = v35;
    if ((v25 ^ v27) >> 14)
    {
      v37 = static String._fromSubstring(_:)(v25, v27, v29, v31);
      v38 = v40;
      swift_bridgeObjectRelease(a2);
      result = swift_bridgeObjectRelease(v31);
      v39 = v36 | 0x8000000000000000;
    }
    else
    {
      swift_bridgeObjectRelease(v31);
      result = swift_bridgeObjectRelease(a2);
      v37 = 0;
      v38 = 0;
      v39 = v36;
    }
    *a3 = v32;
    a3[1] = v34;
    a3[2] = v39;
    a3[3] = v37;
    a3[4] = v38;
  }
  return result;
}

unint64_t sub_10007347C()
{
  uint64_t v0;
  unsigned __int8 v1;
  int v2;
  __n128 v3;
  Swift::String v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  Swift::String v8;
  Swift::String v9;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __n128 v21;
  __n128 v22;
  unsigned __int8 v23;

  sub_100066F84(v0, (uint64_t)&v17);
  v1 = v18;
  if (v18 < 0)
  {
    v18 &= ~0x8000000000000000;
    v5 = v19;
    v6 = v20;
    v22.n128_u64[0] = sub_10006D63C(v17, v1);
    v22.n128_u64[1] = v7;
    v8._countAndFlagsBits = 61;
    v8._object = (void *)0xE100000000000000;
    String.append(_:)(v8);
    v9._countAndFlagsBits = v5;
    v9._object = v6;
    String.append(_:)(v9);
    return v22.n128_u64[0];
  }
  sub_100066FC0((__n128 *)&v17, &v21);
  sub_100066FC0(&v21, &v22);
  v2 = v23 >> 6;
  if (!v2)
  {
    v23 &= 0x3Fu;
    v12 = v22.n128_u64[1];
    v11 = v22.n128_u64[0];
    v13 = 11565;
    v14 = 0xE200000000000000;
LABEL_8:
    v15 = v13;
    v16 = v14;
    String.append(_:)(*(Swift::String *)&v11);
    return v15;
  }
  if (v2 != 1)
  {
    v23 &= 0x3Fu;
    v12 = v22.n128_u64[1];
    v11 = v22.n128_u64[0];
    v13 = 45;
    v14 = 0xE100000000000000;
    goto LABEL_8;
  }
  v23 &= 0x3Fu;
  v3 = v22;
  v15 = 0;
  v16 = 0xE000000000000000;
  v4._countAndFlagsBits = 45;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);
  Character.write<A>(to:)(&v15, v3.n128_u64[0], v3.n128_u64[1], &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  return v15;
}

uint64_t sub_1000735A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000735FC(a1, a2, a3, a4, (void (*)(uint64_t, _BYTE *))sub_100066F84, (uint64_t (*)(_BYTE *, _BYTE *))sub_10007482C);
}

unint64_t sub_1000735B4()
{
  uint64_t v0;
  _BYTE v2[40];

  sub_100066F84(v0, (uint64_t)v2);
  return sub_10007347C();
}

uint64_t sub_1000735E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000735FC(a1, a2, a3, a4, (void (*)(uint64_t, _BYTE *))sub_100045320, (uint64_t (*)(_BYTE *, _BYTE *))sub_100074AE8);
}

uint64_t sub_1000735FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, _BYTE *), uint64_t (*a6)(_BYTE *, _BYTE *))
{
  _BYTE v10[40];
  _BYTE v11[40];

  a5(a1, v10);
  a5(a2, v11);
  return a6(v10, v11) & 1;
}

uint64_t sub_100073654(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v11;
  _BYTE v12[40];
  _BYTE v13[40];

  sub_100066F84(a1, (uint64_t)v12);
  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(unsigned __int8 *)(a1 + 56);
  sub_100066F84(a2, (uint64_t)v13);
  v8 = *(_QWORD *)(a2 + 40);
  v7 = *(_QWORD *)(a2 + 48);
  v9 = *(unsigned __int8 *)(a2 + 56);
  if ((sub_100074AE8((uint64_t)v12, (uint64_t)v13) & 1) != 0 && v5 == v8)
  {
    if (v6)
    {
      if ((v9 & 1) != 0)
        return 1;
    }
    else
    {
      if (v4 == v7)
        v11 = v9;
      else
        v11 = 1;
      if (v11 != 1)
        return 1;
    }
  }
  return 0;
}

Swift::Int sub_1000736EC()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100073730()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100073758(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

BOOL sub_100073798(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

BOOL sub_1000737AC(_QWORD *a1, _QWORD *a2)
{
  return *a2 >= *a1;
}

BOOL sub_1000737C0(_QWORD *a1, _QWORD *a2)
{
  return *a1 >= *a2;
}

BOOL sub_1000737D4(_QWORD *a1, _QWORD *a2)
{
  return *a2 < *a1;
}

Swift::Int sub_1000737E8()
{
  uint64_t v0;
  Swift::UInt v1;
  char v2;
  Swift::UInt v3;
  _QWORD v5[9];

  v1 = *(_QWORD *)v0;
  v2 = *(_BYTE *)(v0 + 8);
  Hasher.init(_seed:)(v5, 0);
  v3 = 0;
  if ((v2 & 1) == 0)
  {
    Hasher._combine(_:)(1uLL);
    v3 = v1;
  }
  Hasher._combine(_:)(v3);
  return Hasher._finalize()();
}

void sub_100073844()
{
  uint64_t v0;
  Swift::UInt v1;

  if ((*(_BYTE *)(v0 + 8) & 1) != 0)
  {
    v1 = 0;
  }
  else
  {
    v1 = *(_QWORD *)v0;
    Hasher._combine(_:)(1uLL);
  }
  Hasher._combine(_:)(v1);
}

Swift::Int sub_100073888(uint64_t a1)
{
  uint64_t v1;
  Swift::UInt v2;
  char v3;
  _QWORD v5[9];

  v2 = *(_QWORD *)v1;
  v3 = *(_BYTE *)(v1 + 8);
  Hasher.init(_seed:)(v5, a1);
  if ((v3 & 1) != 0)
    v2 = 0;
  else
    Hasher._combine(_:)(1uLL);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_1000738E4(uint64_t a1, uint64_t a2)
{
  char v2;

  v2 = *(_BYTE *)(a2 + 8);
  if (*(_BYTE *)(a1 + 8) == 1)
  {
    if ((*(_BYTE *)(a2 + 8) & 1) == 0)
      return 1;
  }
  else
  {
    if (*(_QWORD *)a1 >= *(_QWORD *)a2)
      v2 = 1;
    if ((v2 & 1) == 0)
      return 1;
  }
  return 0;
}

uint64_t sub_10007391C(uint64_t a1, uint64_t a2)
{
  char v2;

  v2 = *(_BYTE *)(a1 + 8);
  if (*(_BYTE *)(a2 + 8) == 1)
  {
    if ((*(_BYTE *)(a1 + 8) & 1) == 0)
      return 0;
  }
  else
  {
    if (*(_QWORD *)a2 >= *(_QWORD *)a1)
      v2 = 1;
    if ((v2 & 1) == 0)
      return 0;
  }
  return 1;
}

uint64_t sub_100073954(uint64_t a1, uint64_t a2)
{
  char v2;

  v2 = *(_BYTE *)(a2 + 8);
  if (*(_BYTE *)(a1 + 8) == 1)
  {
    if ((*(_BYTE *)(a2 + 8) & 1) == 0)
      return 0;
  }
  else
  {
    if (*(_QWORD *)a1 >= *(_QWORD *)a2)
      v2 = 1;
    if ((v2 & 1) == 0)
      return 0;
  }
  return 1;
}

uint64_t sub_10007398C(uint64_t a1, uint64_t a2)
{
  char v2;

  v2 = *(_BYTE *)(a1 + 8);
  if (*(_BYTE *)(a2 + 8) == 1)
  {
    if ((*(_BYTE *)(a1 + 8) & 1) == 0)
      return 1;
  }
  else
  {
    if (*(_QWORD *)a2 >= *(_QWORD *)a1)
      v2 = 1;
    if ((v2 & 1) == 0)
      return 1;
  }
  return 0;
}

BOOL sub_1000739C4(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 8) == 1)
    return (*(_BYTE *)(a2 + 8) & 1) != 0;
  if ((*(_BYTE *)(a2 + 8) & 1) != 0)
    return 0;
  return *(_QWORD *)a1 == *(_QWORD *)a2;
}

Swift::Int sub_100073A00()
{
  uint64_t v0;
  Swift::UInt v1;
  Swift::UInt v2;
  char v3;
  Swift::UInt v4;
  _QWORD v6[9];

  v1 = *(_QWORD *)v0;
  v2 = *(_QWORD *)(v0 + 8);
  v3 = *(_BYTE *)(v0 + 16);
  Hasher.init(_seed:)(v6, 0);
  Hasher._combine(_:)(v1);
  v4 = 0;
  if ((v3 & 1) == 0)
  {
    Hasher._combine(_:)(1uLL);
    v4 = v2;
  }
  Hasher._combine(_:)(v4);
  return Hasher._finalize()();
}

void sub_100073A70()
{
  uint64_t v0;
  Swift::UInt v1;
  char v2;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_BYTE *)(v0 + 16);
  Hasher._combine(_:)(*(_QWORD *)v0);
  if ((v2 & 1) != 0)
    v1 = 0;
  else
    Hasher._combine(_:)(1uLL);
  Hasher._combine(_:)(v1);
}

Swift::Int sub_100073AC0(uint64_t a1)
{
  uint64_t v1;
  Swift::UInt v2;
  Swift::UInt v3;
  char v4;
  _QWORD v6[9];

  v3 = *(_QWORD *)v1;
  v2 = *(_QWORD *)(v1 + 8);
  v4 = *(_BYTE *)(v1 + 16);
  Hasher.init(_seed:)(v6, a1);
  Hasher._combine(_:)(v3);
  if ((v4 & 1) != 0)
    v2 = 0;
  else
    Hasher._combine(_:)(1uLL);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100073B30(uint64_t a1, uint64_t a2)
{
  int v3;

  if (*(_QWORD *)a1 < *(_QWORD *)a2)
    return 1;
  if (*(_QWORD *)a1 == *(_QWORD *)a2)
  {
    v3 = *(unsigned __int8 *)(a2 + 16);
    if (*(_BYTE *)(a1 + 16))
    {
      if ((v3 & 1) == 0)
        return 1;
    }
    else
    {
      if (*(_QWORD *)(a1 + 8) >= *(_QWORD *)(a2 + 8))
        v3 = 1;
      if (v3 != 1)
        return 1;
    }
  }
  return 0;
}

uint64_t sub_100073B80(uint64_t a1, uint64_t a2)
{
  int v3;

  if (*(_QWORD *)a2 < *(_QWORD *)a1)
    return 0;
  if (*(_QWORD *)a2 == *(_QWORD *)a1)
  {
    v3 = *(unsigned __int8 *)(a1 + 16);
    if (*(_BYTE *)(a2 + 16))
    {
      if ((v3 & 1) == 0)
        return 0;
    }
    else
    {
      if (*(_QWORD *)(a2 + 8) >= *(_QWORD *)(a1 + 8))
        v3 = 1;
      if (v3 != 1)
        return 0;
    }
  }
  return 1;
}

uint64_t sub_100073BD0(uint64_t a1, uint64_t a2)
{
  int v3;

  if (*(_QWORD *)a1 < *(_QWORD *)a2)
    return 0;
  if (*(_QWORD *)a1 == *(_QWORD *)a2)
  {
    v3 = *(unsigned __int8 *)(a2 + 16);
    if (*(_BYTE *)(a1 + 16))
    {
      if ((v3 & 1) == 0)
        return 0;
    }
    else
    {
      if (*(_QWORD *)(a1 + 8) >= *(_QWORD *)(a2 + 8))
        v3 = 1;
      if (v3 != 1)
        return 0;
    }
  }
  return 1;
}

uint64_t sub_100073C20(uint64_t a1, uint64_t a2)
{
  int v3;

  if (*(_QWORD *)a2 < *(_QWORD *)a1)
    return 1;
  if (*(_QWORD *)a2 == *(_QWORD *)a1)
  {
    v3 = *(unsigned __int8 *)(a1 + 16);
    if (*(_BYTE *)(a2 + 16))
    {
      if ((v3 & 1) == 0)
        return 1;
    }
    else
    {
      if (*(_QWORD *)(a2 + 8) >= *(_QWORD *)(a1 + 8))
        v3 = 1;
      if (v3 != 1)
        return 1;
    }
  }
  return 0;
}

uint64_t sub_100073C70(uint64_t a1, uint64_t a2)
{
  int v2;

  if (*(_QWORD *)a1 == *(_QWORD *)a2)
  {
    v2 = *(unsigned __int8 *)(a2 + 16);
    if (*(_BYTE *)(a1 + 16) == 1)
    {
      if ((v2 & 1) != 0)
        return 1;
    }
    else
    {
      if (*(_QWORD *)(a1 + 8) != *(_QWORD *)(a2 + 8))
        v2 = 1;
      if (v2 != 1)
        return 1;
    }
  }
  return 0;
}

uint64_t sub_100073CBC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = a1[1];
  v3 = (_QWORD *)a1[2];
  v4 = a2[1];
  v5 = (_QWORD *)a2[2];
  if ((sub_100057734(*a1, *a2) & 1) != 0 && v2 == v4)
    return sub_100057670(v3, v5);
  else
    return 0;
}

unint64_t sub_100073D20()
{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  unsigned __int8 v4;
  int v5;
  __n128 v6;
  Swift::String v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  _BYTE v22[40];
  Swift::String v23;
  unint64_t v24;
  _BYTE v25[40];
  Swift::String v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __n128 v30;
  __n128 v31;
  unsigned __int8 v32;

  sub_100066F84(v0, (uint64_t)v22);
  sub_100066F84((uint64_t)v22, (uint64_t)&v23);
  v1 = (v24 >> 61) & 3;
  if (!(_DWORD)v1)
  {
    v24 &= 0x9FFFFFFFFFFFFFFFLL;
    sub_100066F84((uint64_t)&v23, (uint64_t)v25);
    sub_100066F84((uint64_t)v25, (uint64_t)&v26);
    v4 = v27;
    if (v27 < 0)
    {
      v27 &= ~0x8000000000000000;
      v8 = v28;
      v9 = v29;
      v10 = sub_10006D63C(v26, v4);
      v12 = v11;
      v31.n128_u64[0] = 0x2065756C6176203BLL;
      v31.n128_u64[1] = 0xE900000000000027;
      v13._countAndFlagsBits = v8;
      v13._object = v9;
      String.append(_:)(v13);
      v14._countAndFlagsBits = 39;
      v14._object = (void *)0xE100000000000000;
      String.append(_:)(v14);
      v15 = (Swift::String)v31;
      v31.n128_u64[0] = v10;
      v31.n128_u64[1] = v12;
      swift_bridgeObjectRetain(v12);
      String.append(_:)(v15);
      swift_bridgeObjectRelease(v12);
      swift_bridgeObjectRelease(v15._object);
      return v31.n128_u64[0];
    }
    sub_100066FC0((__n128 *)&v26, &v30);
    sub_100066FC0(&v30, &v31);
    v5 = v32 >> 6;
    if (v5)
    {
      if (v5 == 1)
      {
        v32 &= 0x3Fu;
        v6 = v31;
        v20 = 0;
        v21 = 0xE000000000000000;
        v7._countAndFlagsBits = 45;
        v7._object = (void *)0xE100000000000000;
        String.append(_:)(v7);
        Character.write<A>(to:)(&v20, v6.n128_u64[0], v6.n128_u64[1], &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
        return v20;
      }
      v32 &= 0x3Fu;
      v17 = v31.n128_u64[1];
      v16 = v31.n128_u64[0];
      v18 = 45;
      v19 = 0xE100000000000000;
    }
    else
    {
      v32 &= 0x3Fu;
      v17 = v31.n128_u64[1];
      v16 = v31.n128_u64[0];
      v18 = 11565;
      v19 = 0xE200000000000000;
    }
    v20 = v18;
    v21 = v19;
    String.append(_:)(*(Swift::String *)&v16);
    return v20;
  }
  if ((_DWORD)v1 != 1)
    return 0x74616E696D726574;
  v24 &= 0x9FFFFFFFFFFFFFFFLL;
  v26._countAndFlagsBits = 0x272065756C6176;
  v26._object = (void *)0xE700000000000000;
  String.append(_:)(v23);
  v2._countAndFlagsBits = 39;
  v2._object = (void *)0xE100000000000000;
  String.append(_:)(v2);
  return v26._countAndFlagsBits;
}

unint64_t sub_100073F38()
{
  return sub_100073D20();
}

uint64_t sub_100073F78(uint64_t a1, uint64_t a2, char a3)
{
  Swift::String v3;
  Swift::String v4;
  void *object;
  uint64_t v7;

  if ((a3 & 1) != 0)
    return dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v7 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v3._countAndFlagsBits = 46;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  v4._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  object = v4._object;
  String.append(_:)(v4);
  swift_bridgeObjectRelease(object);
  return v7;
}

uint64_t sub_10007402C()
{
  uint64_t v0;

  return sub_100073F78(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

void sub_100074038(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  Swift::String v11;
  void *v12;
  Swift::String v13;
  uint64_t v14;
  void *v15;
  Swift::String v16;
  void *v17;
  Swift::String v18;
  Swift::String v19;
  void *v20;
  Swift::String v21;
  void *object;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  Swift::String v27;
  void *v28;
  Swift::String v29;
  Swift::String v30;
  void *v31;
  Swift::String v32;
  Swift::String v33;
  Swift::String v34;

  v5 = *(_QWORD *)a1;
  v4 = *(void **)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_BYTE *)(a1 + 56);
  v10 = (v6 >> 61) & 3;
  if ((_DWORD)v10)
  {
    if ((_DWORD)v10 != 1)
    {
      v21._countAndFlagsBits = sub_100073F78(v7, v8, v9);
      object = v21._object;
      String.append(_:)(v21);
      swift_bridgeObjectRelease(object);
      v23 = 757932125;
      v24 = 0xE400000000000000;
LABEL_9:
      String.append(_:)(*(Swift::String *)&v23);
      goto LABEL_10;
    }
    v11._countAndFlagsBits = sub_100073F78(v7, v8, v9);
    v12 = v11._object;
    String.append(_:)(v11);
    swift_bridgeObjectRelease(v12);
    v13._countAndFlagsBits = 2564189;
    v13._object = (void *)0xE300000000000000;
    String.append(_:)(v13);
    v14 = v5;
    v15 = v4;
LABEL_8:
    String.append(_:)(*(Swift::String *)&v14);
    v23 = 39;
    v24 = 0xE100000000000000;
    goto LABEL_9;
  }
  if ((v6 & 0x8000000000000000) != 0)
  {
    v25 = *(_QWORD *)(a1 + 24);
    v26 = *(void **)(a1 + 32);
    v27._countAndFlagsBits = sub_100073F78(v7, v8, v9);
    v28 = v27._object;
    String.append(_:)(v27);
    swift_bridgeObjectRelease(v28);
    v29._countAndFlagsBits = 8285;
    v29._object = (void *)0xE200000000000000;
    String.append(_:)(v29);
    v34._countAndFlagsBits = v5;
    v34._object = v4;
    v30._countAndFlagsBits = sub_10006D63C(v34, v6);
    v31 = v30._object;
    String.append(_:)(v30);
    swift_bridgeObjectRelease(v31);
    v32._countAndFlagsBits = 10045;
    v32._object = (void *)0xE200000000000000;
    String.append(_:)(v32);
    v14 = v25;
    v15 = v26;
    goto LABEL_8;
  }
  v16._countAndFlagsBits = sub_100073F78(v7, v8, v9);
  v17 = v16._object;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(v17);
  v18._countAndFlagsBits = 8285;
  v18._object = (void *)0xE200000000000000;
  String.append(_:)(v18);
  v33._countAndFlagsBits = v5;
  v33._object = v4;
  v19._countAndFlagsBits = sub_10006D63C(v33, v6);
  v20 = v19._object;
  String.append(_:)(v19);
  swift_bridgeObjectRelease(v20);
LABEL_10:
  *a2 = 91;
  a2[1] = 0xE100000000000000;
}

void sub_100074220()
{
  uint64_t *v0;

  sub_100075C7C(*v0, v0[1]);
}

char **sub_100074228(char **result, int64_t a2)
{
  int64_t v2;
  char **v3;
  uint64_t v4;
  char *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;

  v2 = (int64_t)result[1];
  if (v2 <= a2)
  {
    v3 = result;
    if (v2 != a2)
    {
      v4 = a2;
      v5 = *result;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*result);
      *v3 = v5;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        goto LABEL_16;
      while (1)
      {
        v7 = (v4 << 6) + 88;
        v19 = v2;
        while (v2 < v4)
        {
          v8 = v4 - 1;
          if (v4 < 1)
            goto LABEL_13;
          v9 = *((_QWORD *)v5 + 2);
          if (v8 >= v9)
            goto LABEL_14;
          v10 = &v5[v7];
          v4 = *(_QWORD *)&v5[v7 - 120];
          v11 = *(_QWORD *)&v5[v7 - 112];
          v23 = v5;
          v2 = *(_QWORD *)&v5[v7 - 104];
          v5 = *(char **)&v5[v7 - 96];
          v12 = *((_QWORD *)v10 - 11);
          v21 = *((_QWORD *)v10 - 9);
          v22 = *((_QWORD *)v10 - 10);
          v20 = *(v10 - 64);
          sub_10005BDF8(v4, v11, v2, (uint64_t)v5, v12);
          *v3 = v23;
          v13 = v8 + 1;
          if (v13 >= v9)
            goto LABEL_15;
          v14 = *((_QWORD *)v10 - 7);
          v15 = *((_QWORD *)v10 - 6);
          v16 = *((_QWORD *)v10 - 5);
          v17 = *((_QWORD *)v10 - 4);
          v18 = *((_QWORD *)v10 - 3);
          *((_QWORD *)v10 - 7) = v4;
          *((_QWORD *)v10 - 6) = v11;
          *((_QWORD *)v10 - 5) = v2;
          *((_QWORD *)v10 - 4) = v5;
          *((_QWORD *)v10 - 3) = v12;
          *((_QWORD *)v10 - 2) = v22;
          *((_QWORD *)v10 - 1) = v21;
          *v10 = v20;
          result = (char **)sub_100066ED8(v14, v15, v16, v17, v18);
          v5 = *v3;
          v7 -= 64;
          v4 = v13 - 1;
          v2 = v19;
          if (v13 - 1 == v19)
            goto LABEL_10;
        }
        __break(1u);
LABEL_13:
        __break(1u);
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
LABEL_16:
        v5 = sub_10005B898((uint64_t)v5);
      }
    }
LABEL_10:
    if (__OFADD__(v2, 1))
      __break(1u);
    else
      v3[1] = (char *)(v2 + 1);
  }
  return result;
}

uint64_t sub_100074388(uint64_t result, uint64_t a2, char a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v14;
  uint64_t *v15;
  int64_t v16;
  uint64_t v17;
  _BYTE *v18;

  v4 = *v3;
  v5 = v3[1];
  v6 = *(_QWORD *)(*v3 + 16);
  if (v6 < v5)
  {
    __break(1u);
    goto LABEL_39;
  }
  if (v5 < 0)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if (v5 != v6)
  {
    v8 = result;
    v9 = v3[1];
    if (v5 < (unint64_t)v6)
    {
      v10 = (uint64_t *)(v4 + (v5 << 6) + 72);
      v9 = v3[1];
      while (1)
      {
        v11 = *v10;
        v10 += 8;
        v12 = v11 <= result;
        if (v11 == result)
          break;
        if (!v12 || v6 - 1 == v9++)
          return result;
      }
    }
    if (v9 < v6)
    {
      if ((a3 & 1) != 0)
      {
        if (v9 >= v5)
        {
          v15 = (uint64_t *)(v4 + (v9 << 6) + 72);
          v16 = v9;
          while (1)
          {
            v17 = *v15;
            v15 += 8;
            if (v17 != result)
              break;
            if (v6 == ++v16)
            {
              v16 = *(_QWORD *)(*v3 + 16);
              break;
            }
          }
          if (v16 >= v9)
            return sub_100074674(v9, v16);
          goto LABEL_46;
        }
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
        return result;
      }
      if (v9 < v5)
        goto LABEL_41;
      if (*(_BYTE *)(v4 + (v9 << 6) + 88) == 1)
      {
        result = sub_100074524(v9++);
        v4 = *v3;
        v5 = v3[1];
      }
      if (v5 < 0)
        goto LABEL_42;
      v14 = *(_QWORD *)(v4 + 16);
      if (v14 < (unint64_t)v5 || v14 < v9)
        goto LABEL_43;
      if (v9 < v5)
      {
LABEL_44:
        __break(1u);
        goto LABEL_45;
      }
      if (v9 == v14)
        return result;
      v18 = (_BYTE *)(v4 + (v9 << 6) + 88);
      while (v9 < v14)
      {
        if (*((_QWORD *)v18 - 2) == v8 && (*v18 & 1) == 0 && *((_QWORD *)v18 - 1) == a2)
          return sub_100074524(v9);
        ++v9;
        v18 += 64;
        if (v14 == v9)
          return result;
      }
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
  }
  return result;
}

uint64_t sub_100074524(uint64_t result)
{
  char **v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char **v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;

  v2 = (uint64_t)v1[1];
  if (v2 <= result)
  {
    if (v2 != result)
    {
      v3 = result;
      v20 = *v1;
      v18 = v1;
      if ((swift_isUniquelyReferenced_nonNull_native(*v1) & 1) == 0)
LABEL_17:
        v20 = sub_10005B898((uint64_t)v20);
      v4 = (uint64_t)&v20[64 * v3 + 32];
      v19 = v2;
      do
      {
        if (v2 >= v3)
        {
          __break(1u);
LABEL_14:
          __break(1u);
LABEL_15:
          __break(1u);
LABEL_16:
          __break(1u);
          goto LABEL_17;
        }
        v5 = v3 - 1;
        if (v3 < 1)
          goto LABEL_14;
        v6 = *((_QWORD *)v20 + 2);
        if (v5 >= v6)
          goto LABEL_15;
        v3 = *(_QWORD *)(v4 - 64);
        v2 = *(_QWORD *)(v4 - 56);
        v7 = *(_QWORD *)(v4 - 48);
        v8 = *(_QWORD *)(v4 - 40);
        v9 = *(_QWORD *)(v4 - 32);
        v21 = *(_QWORD *)(v4 - 24);
        v10 = *(_QWORD *)(v4 - 16);
        v11 = *(_BYTE *)(v4 - 8);
        sub_10005BDF8(v3, v2, v7, v8, v9);
        v12 = v5 + 1;
        if (v12 >= v6)
          goto LABEL_16;
        v13 = *(_QWORD *)v4;
        v14 = *(_QWORD *)(v4 + 8);
        v15 = *(_QWORD *)(v4 + 16);
        v16 = *(_QWORD *)(v4 + 24);
        v17 = *(_QWORD *)(v4 + 32);
        *(_QWORD *)v4 = v3;
        *(_QWORD *)(v4 + 8) = v2;
        *(_QWORD *)(v4 + 16) = v7;
        *(_QWORD *)(v4 + 24) = v8;
        *(_QWORD *)(v4 + 32) = v9;
        *(_QWORD *)(v4 + 40) = v21;
        *(_QWORD *)(v4 + 48) = v10;
        *(_BYTE *)(v4 + 56) = v11;
        result = sub_100066ED8(v13, v14, v15, v16, v17);
        v4 -= 64;
        v3 = v12 - 1;
        v2 = v19;
      }
      while (v12 - 1 != v19);
      v1 = v18;
      *v18 = v20;
    }
    if (__OFADD__(v2, 1))
      __break(1u);
    else
      v1[1] = (char *)(v2 + 1);
  }
  return result;
}

uint64_t sub_100074674(uint64_t result, unint64_t a2)
{
  char **v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  BOOL v7;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  char **v25;
  char *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;

  v4 = result;
  v27 = (uint64_t)v2[1];
  if (v27 >= result)
    goto LABEL_10;
  v26 = *v2;
  v25 = v2;
  if ((swift_isUniquelyReferenced_nonNull_native(*v2) & 1) == 0)
    goto LABEL_19;
  while (1)
  {
    v23 = v4;
    v24 = a2;
    v5 = v4;
    v6 = &v26[64 * v4];
    do
    {
      v7 = __OFSUB__(a2--, 1);
      if (v7)
      {
        __break(1u);
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
      if (v5-- < 1)
        goto LABEL_14;
      v9 = *((_QWORD *)v26 + 2);
      if (v5 >= v9)
        goto LABEL_15;
      v10 = *((_QWORD *)v6 - 4);
      v11 = *((_QWORD *)v6 - 3);
      v12 = *((_QWORD *)v6 - 2);
      v13 = *((_QWORD *)v6 - 1);
      v14 = *(_QWORD *)v6;
      v4 = *((_QWORD *)v6 + 1);
      v29 = *((_QWORD *)v6 + 2);
      v28 = v6[24];
      sub_10005BDF8(v10, v11, v12, v13, *(_QWORD *)v6);
      if (a2 >= v9)
        goto LABEL_16;
      v15 = (uint64_t)&v26[64 * a2 + 32];
      v16 = *(_QWORD *)v15;
      v17 = *(_QWORD *)(v15 + 8);
      v18 = *(_QWORD *)(v15 + 16);
      v19 = *(_QWORD *)(v15 + 24);
      v20 = *(_QWORD *)(v15 + 32);
      *(_QWORD *)v15 = v10;
      *(_QWORD *)(v15 + 8) = v11;
      *(_QWORD *)(v15 + 16) = v12;
      *(_QWORD *)(v15 + 24) = v13;
      *(_QWORD *)(v15 + 32) = v14;
      *(_QWORD *)(v15 + 40) = v4;
      *(_QWORD *)(v15 + 48) = v29;
      *(_BYTE *)(v15 + 56) = v28;
      result = sub_100066ED8(v16, v17, v18, v19, v20);
      v6 -= 64;
    }
    while (v27 < v5);
    a2 = v24;
    v2 = v25;
    *v25 = v26;
    v4 = v23;
LABEL_10:
    v21 = a2 - v4;
    if (__OFSUB__(a2, v4))
    {
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
    v7 = __OFADD__(v27, v21);
    v22 = (char *)(v27 + v21);
    if (!v7)
      break;
LABEL_18:
    __break(1u);
LABEL_19:
    v26 = sub_10005B898((uint64_t)v26);
  }
  v2[1] = v22;
  return result;
}

uint64_t sub_1000747E8(uint64_t result, uint64_t a2, __int16 a3)
{
  if ((a3 & 0x100) == 0)
    return sub_100074388(result, a2, a3 & 1);
  return result;
}

uint64_t sub_100074810(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(a2 + 16) < result)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (result < 0)
LABEL_5:
    __break(1u);
  return result;
}

uint64_t sub_10007482C(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v3;
  int v4;
  int v5;
  __n128 v6;
  int v7;
  __n128 v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  int v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  char v20;
  char v21;
  char v23;
  __n128 v24;
  __n128 v25;
  unsigned __int8 v26;
  __n128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __n128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __n128 v35;
  __n128 v36;
  unsigned __int8 v37;

  sub_100066F84(a1, (uint64_t)&v31);
  v3 = v32;
  if ((v32 & 0x8000000000000000) == 0)
  {
    sub_100066FC0(&v31, &v35);
    sub_100066F84(a2, (uint64_t)&v27);
    if (v28 < 0)
      goto LABEL_32;
    sub_100066FC0(&v27, &v24);
    sub_100066FC0(&v35, &v36);
    v4 = v37;
    v5 = v37 >> 6;
    if (v5)
    {
      if (v5 == 1)
      {
        v37 &= 0x3Fu;
        v6 = v36;
        sub_100066FC0(&v24, &v25);
        v7 = v26;
        if ((v26 & 0xC0) == 0x40)
        {
          v26 &= 0x3Fu;
          if (*(_OWORD *)&v6 == *(_OWORD *)&v25)
          {
            if (((v4 ^ v7) & 1) != 0)
              goto LABEL_32;
          }
          else
          {
            v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v6.n128_u64[0], v6.n128_u64[1], v25.n128_u64[0], v25.n128_u64[1], 0);
            if (((v4 ^ v7) & 1) != 0 || (v21 & 1) == 0)
              goto LABEL_32;
          }
LABEL_38:
          v20 = 1;
          return v20 & 1;
        }
LABEL_32:
        v20 = 0;
        return v20 & 1;
      }
      v37 &= 0x3Fu;
      v18 = v36.n128_u64[1];
      v17 = v36.n128_u64[0];
      sub_100066FC0(&v24, &v25);
      if ((v26 & 0xC0) != 0x80)
        goto LABEL_32;
      v26 &= 0x3Fu;
    }
    else
    {
      v37 &= 0x3Fu;
      v18 = v36.n128_u64[1];
      v17 = v36.n128_u64[0];
      sub_100066FC0(&v24, &v25);
      if (v26 >= 0x40u)
        goto LABEL_32;
    }
    if (__PAIR128__(v18, v17) != *(_OWORD *)&v25
      && (_stringCompareWithSmolCheck(_:_:expecting:)(v17, v18, v25.n128_u64[0], v25.n128_u64[1], 0) & 1) == 0)
    {
      goto LABEL_32;
    }
    goto LABEL_38;
  }
  v32 &= ~0x8000000000000000;
  v8 = v31;
  v9 = v33;
  v10 = v34;
  sub_100066F84(a2, (uint64_t)&v27);
  v11 = v28;
  if ((v28 & 0x8000000000000000) == 0)
  {
    sub_100066FC0(&v27, &v36);
    goto LABEL_32;
  }
  v12 = v3;
  v28 &= ~0x8000000000000000;
  v13 = v11;
  v14 = v3 >> 6;
  v16 = v29;
  v15 = v30;
  if (!v14)
  {
    if (v13 >= 0x40)
      goto LABEL_32;
    goto LABEL_27;
  }
  if (v14 != 1)
  {
    if ((v13 & 0xC0) != 0x80)
      goto LABEL_32;
LABEL_27:
    if (*(_OWORD *)&v8 == *(_OWORD *)&v27)
      goto LABEL_36;
    v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v8.n128_u64[0], v8.n128_u64[1], v27.n128_u64[0], v27.n128_u64[1], 0);
    v20 = 0;
    if ((v19 & 1) != 0)
      goto LABEL_36;
    return v20 & 1;
  }
  if ((v13 & 0xC0) != 0x40)
    goto LABEL_32;
  if (*(_OWORD *)&v8 == *(_OWORD *)&v27)
  {
    if (((v12 ^ v13) & 1) != 0)
      goto LABEL_32;
LABEL_36:
    if (v9 != v16 || v10 != v15)
    {
      v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v9, v10, v16, v15, 0);
      return v20 & 1;
    }
    goto LABEL_38;
  }
  v23 = _stringCompareWithSmolCheck(_:_:expecting:)(v8.n128_u64[0], v8.n128_u64[1], v27.n128_u64[0], v27.n128_u64[1], 0);
  v20 = 0;
  if (((v12 ^ v13) & 1) == 0 && (v23 & 1) != 0)
    goto LABEL_36;
  return v20 & 1;
}

uint64_t sub_100074AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  char v6;
  unsigned __int8 v7;
  int v8;
  int v9;
  __n128 v10;
  int v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  unsigned __int8 v16;
  int v17;
  unsigned int v18;
  int v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  _BYTE v31[16];
  uint64_t v32;
  _BYTE v33[40];
  __n128 v34;
  __n128 v35;
  unsigned __int8 v36;
  __n128 v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  _QWORD v41[2];
  unint64_t v42;
  _BYTE v43[40];
  int8x16_t v44;
  uint64_t v45;
  int8x16_t v46;
  __n128 v47;
  __n128 v48;
  unsigned __int8 v49;

  sub_100066F84(a1, (uint64_t)v41);
  v3 = (v42 >> 61) & 3;
  if (!(_DWORD)v3)
  {
    v42 &= 0x9FFFFFFFFFFFFFFFLL;
    sub_100066F84((uint64_t)v41, (uint64_t)v43);
    sub_100066F84(a2, (uint64_t)v31);
    if ((v32 & 0x6000000000000000) != 0)
      goto LABEL_47;
    v32 &= 0x9FFFFFFFFFFFFFFFLL;
    sub_100066F84((uint64_t)v31, (uint64_t)v33);
    sub_100066F84((uint64_t)v43, (uint64_t)&v44);
    v7 = v45;
    if ((v45 & 0x8000000000000000) == 0)
    {
      sub_100066FC0((__n128 *)&v44, &v47);
      sub_100066F84((uint64_t)v33, (uint64_t)&v37);
      if (v38 < 0)
        goto LABEL_47;
      sub_100066FC0(&v37, &v34);
      sub_100066FC0(&v47, &v48);
      v8 = v49;
      v9 = v49 >> 6;
      if (v9)
      {
        if (v9 == 1)
        {
          v49 &= 0x3Fu;
          v10 = v48;
          sub_100066FC0(&v34, &v35);
          v11 = v36;
          if ((v36 & 0xC0) == 0x40)
          {
            v36 &= 0x3Fu;
            if (*(_OWORD *)&v10 == *(_OWORD *)&v35)
            {
              if (((v8 ^ v11) & 1) == 0)
                goto LABEL_18;
            }
            else
            {
              v28 = _stringCompareWithSmolCheck(_:_:expecting:)(v10.n128_u64[0], v10.n128_u64[1], v35.n128_u64[0], v35.n128_u64[1], 0);
              if (((v8 ^ v11) & 1) == 0 && (v28 & 1) != 0)
                goto LABEL_18;
            }
          }
LABEL_47:
          v6 = 0;
          return v6 & 1;
        }
        v49 &= 0x3Fu;
        v23 = v48.n128_u64[1];
        v22 = v48.n128_u64[0];
        sub_100066FC0(&v34, &v35);
        if ((v36 & 0xC0) != 0x80)
          goto LABEL_47;
        v36 &= 0x3Fu;
      }
      else
      {
        v49 &= 0x3Fu;
        v23 = v48.n128_u64[1];
        v22 = v48.n128_u64[0];
        sub_100066FC0(&v34, &v35);
        if (v36 >= 0x40u)
          goto LABEL_47;
      }
      v25 = v35.n128_u64[1];
      v24 = v35.n128_u64[0];
      if (__PAIR128__(v23, v22) == *(_OWORD *)&v35)
        goto LABEL_18;
      v26 = v22;
      v27 = v23;
LABEL_46:
      if ((_stringCompareWithSmolCheck(_:_:expecting:)(v26, v27, v24, v25, 0) & 1) != 0)
        goto LABEL_18;
      goto LABEL_47;
    }
    v45 &= ~0x8000000000000000;
    v14 = v44;
    v15 = v46;
    sub_100066F84((uint64_t)v33, (uint64_t)&v37);
    v16 = v38;
    if ((v38 & 0x8000000000000000) == 0)
    {
      sub_100066FC0(&v37, &v48);
      goto LABEL_47;
    }
    v17 = v7;
    v38 &= ~0x8000000000000000;
    v18 = v16;
    v19 = v7 >> 6;
    v21 = v39;
    v20 = v40;
    if (v19)
    {
      if (v19 == 1)
      {
        if ((v18 & 0xC0) != 0x40)
          goto LABEL_47;
        if (*(_OWORD *)&v14 == *(_OWORD *)&v37)
        {
          if (((v17 ^ v18) & 1) != 0)
            goto LABEL_47;
        }
        else
        {
          v29 = _stringCompareWithSmolCheck(_:_:expecting:)(v14.i64[0], v14.i64[1], v37.n128_u64[0], v37.n128_u64[1], 0);
          if (((v17 ^ v18) & 1) != 0 || (v29 & 1) == 0)
            goto LABEL_47;
        }
        goto LABEL_44;
      }
      if ((v18 & 0xC0) != 0x80)
        goto LABEL_47;
    }
    else if (v18 >= 0x40)
    {
      goto LABEL_47;
    }
    if (*(_OWORD *)&v14 != *(_OWORD *)&v37
      && (_stringCompareWithSmolCheck(_:_:expecting:)(v14.i64[0], v14.i64[1], v37.n128_u64[0], v37.n128_u64[1], 0) & 1) == 0)
    {
      goto LABEL_47;
    }
LABEL_44:
    if (*(_OWORD *)&v15 == __PAIR128__(v20, v21))
      goto LABEL_18;
    v27 = v15.u64[1];
    v26 = v15.i64[0];
    v24 = v21;
    v25 = v20;
    goto LABEL_46;
  }
  if ((_DWORD)v3 != 1)
  {
    sub_100066F84(a2, (uint64_t)&v44);
    if ((v45 & 0x6000000000000000) == 0x4000000000000000 && v45 == 0x4000000000000000)
    {
      v12 = vorrq_s8(v46, v44);
      v13 = vextq_s8(v12, v12, 8uLL);
      if (!*(_QWORD *)&vorr_s8(*(int8x8_t *)v13.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL)))
        goto LABEL_18;
    }
    goto LABEL_47;
  }
  v42 &= 0x9FFFFFFFFFFFFFFFLL;
  v4 = v41[0];
  v5 = v41[1];
  sub_100066F84(a2, (uint64_t)&v44);
  if ((v45 & 0x6000000000000000) != 0x2000000000000000)
    goto LABEL_47;
  v45 &= 0x9FFFFFFFFFFFFFFFLL;
  if (__PAIR128__(v5, v4) == *(_OWORD *)&v44)
  {
LABEL_18:
    v6 = 1;
    return v6 & 1;
  }
  v6 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, v44.i64[0], v44.i64[1], 0);
  return v6 & 1;
}

_QWORD *sub_100074E94(_QWORD *result, uint64_t a2, unint64_t a3, _QWORD *a4)
{
  int64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a3 >> 1;
  if (a3 >> 1 != a2)
  {
    v6 = a2;
    v29 = a3 >> 1;
    v30 = a2;
    v28 = result;
    do
    {
      v7 = v6;
      while (1)
      {
        if (v7 < a2 || v6 >= v4)
          goto LABEL_32;
        v8 = &result[8 * v6];
        v9 = *v8;
        v10 = v8[1];
        v11 = v8[2];
        v12 = v8[3];
        v13 = v8[4];
        ++v6;
        v14 = (v11 & 0x6000000000000000) == 0x4000000000000000 && v11 == 0x4000000000000000;
        if (!v14 || (v10 | *v8 | v12 | v13) != 0)
        {
          v16 = v8[5];
          v17 = *((_BYTE *)v8 + 56);
          if ((v17 & 1) != 0)
            goto LABEL_25;
          v18 = a4[2];
          if (!v18)
            goto LABEL_25;
          if (a4[4] != v16)
          {
            if (v18 == 1)
              goto LABEL_25;
            if (a4[5] != v16)
              break;
          }
        }
LABEL_5:
        if (v6 == v4)
          return _swiftEmptyArrayStorage;
      }
      if (v18 != 2)
      {
        v19 = 6;
        while (1)
        {
          v20 = v19 - 3;
          if (__OFADD__(v19 - 4, 1))
            break;
          if (a4[v19] == v16)
            goto LABEL_5;
          ++v19;
          if (v20 == v18)
            goto LABEL_25;
        }
        __break(1u);
LABEL_32:
        __break(1u);
        return result;
      }
LABEL_25:
      v31 = v8[6];
      v32 = v8[4];
      sub_10005BDF8(v9, v10, v11, v12, v13);
      if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0)
        sub_10004FE80(0, _swiftEmptyArrayStorage[2] + 1, 1);
      v4 = v29;
      a2 = v30;
      v22 = _swiftEmptyArrayStorage[2];
      v21 = _swiftEmptyArrayStorage[3];
      v23 = v22 + 1;
      result = v28;
      v24 = v32;
      if (v22 >= v21 >> 1)
      {
        v26 = v22 + 1;
        v27 = _swiftEmptyArrayStorage[2];
        sub_10004FE80((char *)(v21 > 1), v22 + 1, 1);
        v23 = v26;
        v22 = v27;
        v24 = v32;
        result = v28;
        v4 = v29;
        a2 = v30;
      }
      _swiftEmptyArrayStorage[2] = v23;
      v25 = &_swiftEmptyArrayStorage[8 * v22];
      v25[4] = v9;
      v25[5] = v10;
      v25[6] = v11;
      v25[7] = v12;
      v25[8] = v24;
      v25[9] = v16;
      v25[10] = v31;
      *((_BYTE *)v25 + 88) = v17;
    }
    while (v6 != v4);
  }
  return _swiftEmptyArrayStorage;
}

_QWORD *sub_10007509C(uint64_t a1, uint64_t a2)
{
  int64_t v3;
  _QWORD *result;
  uint64_t i;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::UInt v12;
  uint64_t *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  int v21;
  uint64_t v22;
  Swift::String v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  Swift::String v27;
  unint64_t v28;
  uint64_t v29;
  Swift::String v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  Swift::String v34;
  Swift::String v35;
  Swift::String v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  Swift::UInt v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _QWORD *v48;

  v3 = *(_QWORD *)(a1 + 16);
  result = _swiftEmptyArrayStorage;
  if (!v3)
    return result;
  v48 = _swiftEmptyArrayStorage;
  sub_10004FEB8(0, v3, 0);
  result = _swiftEmptyArrayStorage;
  v38 = a2 + 32;
  v39 = a2;
  for (i = a1 + 48; ; i += 64)
  {
    v7 = *(_QWORD *)(i - 16);
    v8 = *(void **)(i - 8);
    v9 = *(_QWORD *)i;
    v10 = *(_QWORD *)(i + 8);
    v11 = *(_QWORD *)(i + 16);
    v12 = *(_QWORD *)(i + 24);
    v43 = *(_QWORD *)(i + 32);
    v44 = result;
    v42 = *(unsigned __int8 *)(i + 40);
    v41 = v10;
    if (v42 == 1)
      break;
    if ((v9 & 0x6000000000000000) == 0)
    {
      v21 = v9 >> 6;
      if ((v9 & 0x8000000000000000) != 0)
      {
        v37 = *(_QWORD *)i;
        if (v9 >> 6)
        {
          if (v21 == 1)
          {
            v45 = 0;
            v46 = 0xE000000000000000;
            v24 = v9;
            v25 = v10;
            v26 = v10;
            v15 = (void *)v11;
            sub_10005BDF8(v7, (uint64_t)v8, v24, v26, v11);
            v27._countAndFlagsBits = 45;
            v27._object = (void *)0xE100000000000000;
            String.append(_:)(v27);
            Character.write<A>(to:)(&v45, v7, v8, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
LABEL_29:
            v35._countAndFlagsBits = 61;
            v35._object = (void *)0xE100000000000000;
            String.append(_:)(v35);
            v36._countAndFlagsBits = v25;
            v36._object = v15;
            String.append(_:)(v36);
            v14 = v46;
            v40 = v45;
            v9 = v37;
            goto LABEL_11;
          }
          v45 = 45;
          v31 = 0xE100000000000000;
        }
        else
        {
          v45 = 11565;
          v31 = 0xE200000000000000;
        }
        v46 = v31;
        v32 = v9;
        v25 = v10;
        v33 = v10;
        v15 = (void *)v11;
        sub_10005BDF8(v7, (uint64_t)v8, v32, v33, v11);
        v34._countAndFlagsBits = v7;
        v34._object = v8;
        String.append(_:)(v34);
        goto LABEL_29;
      }
      if (v9 >> 6)
      {
        if (v21 == 1)
        {
          v45 = 0;
          v46 = 0xE000000000000000;
          v22 = v10;
          v15 = (void *)v11;
          sub_10005BDF8(v7, (uint64_t)v8, v9, v22, v11);
          v23._countAndFlagsBits = 45;
          v23._object = (void *)0xE100000000000000;
          String.append(_:)(v23);
          Character.write<A>(to:)(&v45, v7, v8, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
LABEL_25:
          v14 = v46;
          v40 = v45;
          goto LABEL_11;
        }
        v45 = 45;
        v28 = 0xE100000000000000;
      }
      else
      {
        v45 = 11565;
        v28 = 0xE200000000000000;
      }
      v46 = v28;
      v29 = v10;
      v15 = (void *)v11;
      sub_10005BDF8(v7, (uint64_t)v8, v9, v29, v11);
      v30._countAndFlagsBits = v7;
      v30._object = v8;
      String.append(_:)(v30);
      goto LABEL_25;
    }
    if ((v12 & 0x8000000000000000) != 0)
      goto LABEL_33;
    if (v12 >= *(_QWORD *)(v39 + 16))
      goto LABEL_34;
LABEL_10:
    v13 = (uint64_t *)(v38 + 16 * v12);
    v14 = v13[1];
    v40 = *v13;
    v15 = *(void **)(i + 16);
    sub_10005BDF8(v7, (uint64_t)v8, v9, *(_QWORD *)(i + 8), v11);
    swift_bridgeObjectRetain(v14);
LABEL_11:
    v16 = sub_100067054();
    v47 = Set.init(minimumCapacity:)(1, &type metadata for InputOrigin.Element, v16);
    sub_10005954C((uint64_t)&v45, v12, v43, v42);
    v17 = v47;
    sub_100066ED8(v7, (uint64_t)v8, v9, v41, (uint64_t)v15);
    result = v44;
    v48 = v44;
    v19 = v44[2];
    v18 = v44[3];
    if (v19 >= v18 >> 1)
    {
      sub_10004FEB8((_QWORD *)(v18 > 1), v19 + 1, 1);
      result = v48;
    }
    result[2] = v19 + 1;
    v20 = &result[3 * v19];
    v20[4] = v17;
    v20[5] = v40;
    v20[6] = v14;
    if (!--v3)
      return result;
  }
  if ((v12 & 0x8000000000000000) == 0)
  {
    if (v12 >= *(_QWORD *)(v39 + 16))
      goto LABEL_32;
    goto LABEL_10;
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

unint64_t sub_100075434@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  unint64_t result;
  char v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
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
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  Swift::String v52;

  result = sub_10007CBC8(61, 0xE100000000000000, a1, a2, a3, a4);
  if ((v11 & 1) != 0)
  {
    swift_bridgeObjectRetain(a4);
    v22 = Substring.distance(from:to:)(a1, a2, a1, a2, a3, a4);
    result = swift_bridgeObjectRelease(a4);
    if (v22 == 1)
    {
      if ((a2 ^ a1) < 0x4000)
      {
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }
      swift_bridgeObjectRetain(a4);
      v23 = Substring.subscript.getter(a1, a1, a2, a3, a4);
      v25 = v24;
      result = swift_bridgeObjectRelease_n(a4, 2);
      v26 = 0;
      v27 = 0;
      v28 = 64;
    }
    else
    {
      v23 = static String._fromSubstring(_:)(a1, a2, a3, a4);
      v25 = v29;
      result = swift_bridgeObjectRelease(a4);
      v26 = 0;
      v27 = 0;
      v28 = 128;
    }
LABEL_18:
    *a5 = v23;
    a5[1] = v25;
    a5[2] = v28;
    a5[3] = v26;
    a5[4] = v27;
    return result;
  }
  v12 = result;
  if (a1 >> 14 > result >> 14)
  {
    __break(1u);
    goto LABEL_20;
  }
  v13 = Substring.subscript.getter(a1);
  v51 = v16;
  if ((v13 ^ v14) < 0x4000)
  {
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRetain(a4);
    v17 = Substring.distance(from:to:)(a1, a2, a1, a2, a3, a4);
    result = swift_bridgeObjectRelease(a4);
    if (v17 != 1)
    {
      v18 = static String._fromSubstring(_:)(a1, a2, a3, a4);
      v20 = v42;
      v21 = 0x80;
      goto LABEL_15;
    }
    if (a1 >> 14 != a2 >> 14)
    {
      swift_bridgeObjectRetain(a4);
      v18 = Substring.subscript.getter(a1, a1, a2, a3, a4);
      v20 = v19;
      swift_bridgeObjectRelease(a4);
      v21 = 64;
LABEL_15:
      swift_bridgeObjectRelease(a4);
      v52._countAndFlagsBits = v18;
      v52._object = v20;
      v43 = sub_10006D63C(v52, v21);
      v45 = v44;
      sub_10002DA24(v18, (uint64_t)v20, v21);
      v46 = sub_10002EA1C();
      v47 = swift_allocError(&type metadata for ParserError, v46, 0, 0);
      *(_QWORD *)v48 = v43;
      *(_QWORD *)(v48 + 8) = v45;
      *(_OWORD *)(v48 + 16) = 0u;
      *(_OWORD *)(v48 + 32) = 0u;
      *(_OWORD *)(v48 + 48) = 0u;
      *(_OWORD *)(v48 + 64) = 0u;
      *(_BYTE *)(v48 + 80) = 5;
      return swift_willThrow(v47);
    }
    goto LABEL_22;
  }
  v30 = v13;
  v31 = v14;
  v50 = v15;
  result = Substring.index(after:)(v12, a1, a2, a3, a4);
  if (a2 >> 14 >= result >> 14)
  {
    v28 = 0x8000000000000040;
    v32 = Substring.subscript.getter(result);
    v34 = v33;
    v36 = v35;
    v38 = v37;
    swift_bridgeObjectRelease(a4);
    v26 = static String._fromSubstring(_:)(v32, v34, v36, v38);
    v27 = v39;
    swift_bridgeObjectRelease(v38);
    swift_bridgeObjectRetain(v50);
    v40 = Substring.distance(from:to:)(v30, v31, v30, v31, v51, v50);
    swift_bridgeObjectRelease(v50);
    if (v40 == 1)
    {
      swift_bridgeObjectRetain(v50);
      v23 = Substring.subscript.getter(v30, v30, v31, v51, v50);
      v25 = v41;
      swift_bridgeObjectRelease(v50);
    }
    else
    {
      v23 = static String._fromSubstring(_:)(v30, v31, v51, v50);
      v25 = v49;
      v28 = 0x8000000000000080;
    }
    result = swift_bridgeObjectRelease(v50);
    goto LABEL_18;
  }
LABEL_21:
  __break(1u);
LABEL_22:
  __break(1u);
  return result;
}

char *sub_100075808(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char *result;
  uint64_t v26;
  unint64_t v27;

  v2 = v1;
  v4 = (char *)_swiftEmptyArrayStorage;
  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    swift_bridgeObjectRetain(a1);
    v6 = 0;
    v7 = (_QWORD *)(a1 + 56);
    v26 = a1;
    v27 = v5 - 1;
    while (1)
    {
      v9 = *(v7 - 3);
      v8 = *(v7 - 2);
      swift_bridgeObjectRetain(v8);
      v10 = sub_100072C84(v9, v8, v6);
      if (v2)
      {
        swift_unknownObjectRelease(v26);
        swift_bridgeObjectRelease(v8);
        v4 = (char *)_swiftEmptyArrayStorage;
        swift_bridgeObjectRelease(v26);
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        return v4;
      }
      v11 = v10;
      swift_bridgeObjectRelease(v8);
      swift_bridgeObjectRetain(v11);
      sub_100056B60((char *)v11);
      if (!*(_QWORD *)(v11 + 16))
        goto LABEL_30;
      v12 = *(_QWORD *)(v11 + 32);
      v13 = *(_QWORD *)(v11 + 40);
      v14 = *(_QWORD *)(v11 + 48);
      v15 = *(_QWORD *)(v11 + 56);
      v16 = *(_QWORD *)(v11 + 64);
      swift_bridgeObjectRelease(v11);
      if ((v14 & 0x6000000000000000) == 0x4000000000000000)
      {
        v18 = v14 == 0x4000000000000000 && (v13 | v12 | v15 | v16) == 0;
        if (v27 == v6 || v18)
        {
          if (v27 == v6)
          {
LABEL_17:
            swift_unknownObjectRelease(v26);
            return (char *)_swiftEmptyArrayStorage;
          }
          v19 = v6 + 1;
          if (v6 + 1 < v5)
          {
            v4 = (char *)_swiftEmptyArrayStorage;
            swift_unknownObjectRetain(v26);
            do
            {
              v21 = *(v7 - 1);
              v20 = *v7;
              swift_bridgeObjectRetain(*v7);
              if ((swift_isUniquelyReferenced_nonNull_native(v4) & 1) == 0)
                v4 = sub_100058438(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
              v23 = *((_QWORD *)v4 + 2);
              v22 = *((_QWORD *)v4 + 3);
              if (v23 >= v22 >> 1)
                v4 = sub_100058438((char *)(v22 > 1), v23 + 1, 1, v4);
              v24 = &v4[64 * v23];
              *((_QWORD *)v24 + 8) = 0;
              *((_QWORD *)v24 + 9) = v19;
              v7 += 2;
              *((_QWORD *)v4 + 2) = v23 + 1;
              *((_QWORD *)v24 + 4) = v21;
              *((_QWORD *)v24 + 5) = v20;
              *((_QWORD *)v24 + 6) = 0x2000000000000000;
              *((_QWORD *)v24 + 7) = 0;
              *((_QWORD *)v24 + 10) = 0;
              ++v19;
              v24[88] = 1;
            }
            while (v5 != v19);
            swift_unknownObjectRelease_n(v26, 2);
            return v4;
          }
LABEL_29:
          __break(1u);
LABEL_30:
          result = (char *)swift_bridgeObjectRelease(v11);
          __break(1u);
          return result;
        }
      }
      else if (v27 == v6)
      {
        goto LABEL_17;
      }
      ++v6;
      v7 += 2;
      v2 = 0;
      if (v5 == v6)
      {
        __break(1u);
        goto LABEL_29;
      }
    }
  }
  return v4;
}

uint64_t sub_100075A84(uint64_t result, uint64_t a2, __int16 a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  int v8;

  if ((a3 & 0x100) != 0)
    return 0;
  v5 = *(_QWORD *)(a4 + 16);
  if (v5 < a5)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if ((a5 & 0x8000000000000000) == 0)
  {
    if (v5 != a5)
    {
      v6 = (unsigned __int8 *)(a4 + (a5 << 6) + 88);
      while (a5 < v5)
      {
        v7 = *((_QWORD *)v6 - 2);
        if (v7 > result)
          return a5;
        if (v7 == result)
        {
          v8 = *v6;
          if ((a3 & 1) != 0)
          {
            if ((v8 & 1) == 0)
              return a5;
          }
          else
          {
            if (*((_QWORD *)v6 - 1) <= a2)
              v8 = 1;
            if (v8 != 1)
              return a5;
          }
        }
        if (__OFADD__(a5, 1))
          goto LABEL_20;
        ++a5;
        v6 += 64;
        if (a5 == v5)
          return 0;
      }
      __break(1u);
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    return 0;
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_100075B28@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;

  v4 = *(_QWORD *)(result + 16);
  if ((uint64_t)v4 < (uint64_t)a2)
  {
    __break(1u);
    goto LABEL_9;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v4 == a2)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0x7FFFFFF3ELL;
LABEL_7:
    *(_QWORD *)a3 = v5;
    *(_QWORD *)(a3 + 8) = v6;
    *(_QWORD *)(a3 + 16) = v7;
    *(_QWORD *)(a3 + 24) = v8;
    *(_QWORD *)(a3 + 32) = v9;
    *(_QWORD *)(a3 + 40) = v13;
    *(_QWORD *)(a3 + 48) = v10;
    *(_QWORD *)(a3 + 56) = v11;
    *(_QWORD *)(a3 + 64) = v5;
    *(_QWORD *)(a3 + 72) = v6;
    *(_BYTE *)(a3 + 80) = v12;
    return result;
  }
  if (v4 > a2)
  {
    v14 = result + (a2 << 6);
    v8 = *(_QWORD *)(v14 + 32);
    v9 = *(_QWORD *)(v14 + 40);
    v13 = *(_QWORD *)(v14 + 48);
    v10 = *(_QWORD *)(v14 + 56);
    v11 = *(_QWORD *)(v14 + 64);
    v5 = *(_QWORD *)(v14 + 72);
    v6 = *(_QWORD *)(v14 + 80);
    v7 = *(unsigned __int8 *)(v14 + 88);
    result = sub_10005BDF8(v8, v9, v13, v10, v11);
    v12 = v7;
    goto LABEL_7;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_100075C04(uint64_t result, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  int8x16_t v4;
  int8x8_t v5;

  v2 = *(_QWORD *)(result + 16);
  if ((uint64_t)v2 < (uint64_t)a2)
  {
    __break(1u);
    goto LABEL_15;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return result;
  }
  if (v2 == a2)
    return 0;
  if ((uint64_t)(v2 - a2) > 1)
    return 1;
  if (v2 <= a2)
    goto LABEL_16;
  v3 = result + (a2 << 6);
  v4 = vorrq_s8(*(int8x16_t *)(v3 + 32), *(int8x16_t *)(v3 + 56));
  v5 = vorr_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL));
  return *(_QWORD *)(v3 + 48) != 0x4000000000000000 || *(_QWORD *)&v5 != 0;
}

void sub_100075C7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  _OWORD v23[3];
  uint64_t v24;
  char v25;
  _QWORD v26[2];
  _QWORD *v27;

  v22 = *(_QWORD *)(a1 + 16);
  if (v22 < a2)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v2 = v22 - a2;
  if (v22 == a2)
    return;
  v27 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRetain(a1);
  sub_10004FDF4(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = 0;
    v5 = v27;
    v19 = a1;
    v6 = a2;
    v7 = (_BYTE *)(a1 + (a2 << 6) + 88);
    v21 = v2;
    while (1)
    {
      v8 = v4 + 1;
      if (__OFADD__(v4, 1))
        break;
      if (v6 + v4 >= v22 || v4 >= v2)
        goto LABEL_14;
      v9 = *((_QWORD *)v7 - 1);
      v10 = *v7;
      v11 = *(_OWORD *)(v7 - 40);
      v23[0] = *(_OWORD *)(v7 - 56);
      v23[1] = v11;
      v23[2] = *(_OWORD *)(v7 - 24);
      v24 = v9;
      v25 = v10;
      sub_100074038((uint64_t)v23, v26);
      v13 = v26[0];
      v12 = v26[1];
      v27 = v5;
      v15 = v5[2];
      v14 = v5[3];
      if (v15 >= v14 >> 1)
      {
        sub_10004FDF4((char *)(v14 > 1), v15 + 1, 1);
        v6 = a2;
        v5 = v27;
      }
      v5[2] = v15 + 1;
      v16 = &v5[2 * v15];
      v16[4] = v13;
      v16[5] = v12;
      ++v4;
      v7 += 64;
      v2 = v21;
      if (v8 == v21)
      {
        swift_bridgeObjectRelease(v19);
        *(_QWORD *)&v23[0] = v5;
        v17 = sub_100005104(&qword_1000B90C8);
        v18 = sub_10005EC18();
        BidirectionalCollection<>.joined(separator:)(32, 0xE100000000000000, v17, v18);
        swift_bridgeObjectRelease(v5);
        return;
      }
    }
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
LABEL_17:
  __break(1u);
}

ValueMetadata *type metadata accessor for SplitArguments.InputIndex()
{
  return &type metadata for SplitArguments.InputIndex;
}

uint64_t destroy for ParsedArgument(_QWORD *a1, uint64_t a2)
{
  return sub_100076180(a1, a2, sub_100066EF8);
}

_QWORD *initializeWithCopy for ParsedArgument(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  return sub_100075F08(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))sub_10005BE18);
}

uint64_t *assignWithCopy for ParsedArgument(uint64_t *a1, _QWORD *a2, uint64_t a3)
{
  return sub_100075F80(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))sub_10005BE18, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100066EF8);
}

_QWORD *assignWithTake for ParsedArgument(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_10007600C(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100066EF8);
}

uint64_t sub_100075EAC(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16) >> 63;
}

uint64_t sub_100075EB8(uint64_t result)
{
  *(_QWORD *)(result + 16) &= ~0x8000000000000000;
  return result;
}

uint64_t sub_100075EC8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 16) = *(_QWORD *)(result + 16) & 0xC1 | (a2 << 63);
  return result;
}

ValueMetadata *type metadata accessor for ParsedArgument()
{
  return &type metadata for ParsedArgument;
}

uint64_t destroy for SplitArguments.Element.Value(_QWORD *a1, uint64_t a2)
{
  return sub_100076180(a1, a2, sub_100066ED8);
}

_QWORD *initializeWithCopy for SplitArguments.Element.Value(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  return sub_100075F08(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))sub_10005BDF8);
}

_QWORD *sub_100075F08(_QWORD *a1, _QWORD *a2, uint64_t a3, void (*a4)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *a2;
  v6 = a2[1];
  v7 = a2[2];
  v8 = a2[3];
  v9 = a2[4];
  a4(*a2, v6, v7, v8, v9);
  *a1 = v5;
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  a1[4] = v9;
  return a1;
}

uint64_t *assignWithCopy for SplitArguments.Element.Value(uint64_t *a1, _QWORD *a2, uint64_t a3)
{
  return sub_100075F80(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))sub_10005BDF8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100066ED8);
}

uint64_t *sub_100075F80(uint64_t *a1, _QWORD *a2, uint64_t a3, void (*a4)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
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

  v7 = *a2;
  v8 = a2[1];
  v9 = a2[2];
  v10 = a2[3];
  v11 = a2[4];
  a4(*a2, v8, v9, v10, v11);
  v12 = *a1;
  v13 = a1[1];
  v14 = a1[2];
  v15 = a1[3];
  v16 = a1[4];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v9;
  a1[3] = v10;
  a1[4] = v11;
  a5(v12, v13, v14, v15, v16);
  return a1;
}

_QWORD *assignWithTake for SplitArguments.Element.Value(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_10007600C(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100066ED8);
}

_QWORD *sub_10007600C(_QWORD *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  v6 = *(_QWORD *)(a2 + 32);
  v7 = *a1;
  v9 = a1[1];
  v8 = a1[2];
  v10 = a1[3];
  v11 = a1[4];
  v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v12;
  a1[4] = v6;
  a4(v7, v9, v8, v10, v11);
  return a1;
}

uint64_t _s14ArgumentParser14ParsedArgumentOwet_0(uint64_t a1, int a2)
{
  unsigned int v2;
  int v3;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = (*(_QWORD *)(a1 + 16) >> 3) & 0xFFFFFFE0 | (*(_QWORD *)(a1 + 16) >> 1) & 0x1F;
  if (v2 > 0x80000000)
    v3 = ~v2;
  else
    v3 = -1;
  return (v3 + 1);
}

uint64_t sub_1000760A8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 24) = 0;
      *(_QWORD *)(result + 32) = 0;
      *(_QWORD *)(result + 16) = (8 * -a2) & 0x7FFFFFF00 | (2 * (-a2 & 0x1FLL));
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_100076104(uint64_t a1)
{
  if (((*(_QWORD *)(a1 + 16) >> 61) & 2) != 0)
    return (*(_DWORD *)a1 + 2);
  else
    return (*(_QWORD *)(a1 + 16) >> 61) & 3;
}

uint64_t sub_100076124(uint64_t result)
{
  *(_QWORD *)(result + 16) &= 0x9FFFFFFFFFFFFFFFLL;
  return result;
}

uint64_t sub_100076134(uint64_t result, uint64_t a2)
{
  if (a2 < 2)
  {
    *(_QWORD *)(result + 16) = *(_QWORD *)(result + 16) & 0x80000000000000C1 | (a2 << 61);
  }
  else
  {
    *(_QWORD *)result = (a2 - 2);
    *(_OWORD *)(result + 8) = xmmword_100097E40;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)(result + 32) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SplitArguments.Element.Value()
{
  return &type metadata for SplitArguments.Element.Value;
}

uint64_t sub_100076180(_QWORD *a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  return a3(*a1, a1[1], a1[2], a1[3], a1[4]);
}

uint64_t initializeWithCopy for SplitArguments.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  sub_10005BDF8(*(_QWORD *)a2, v5, v6, v7, v8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t assignWithCopy for SplitArguments.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  sub_10005BDF8(*(_QWORD *)a2, v5, v6, v7, v8);
  v9 = *(_QWORD *)a1;
  v10 = *(_QWORD *)(a1 + 8);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  sub_100066ED8(v9, v10, v11, v12, v13);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v14 = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v14;
  return a1;
}

uint64_t assignWithTake for SplitArguments.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  sub_100066ED8(v4, v5, v6, v7, v8);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for SplitArguments.Element(uint64_t a1, int a2)
{
  unsigned int v2;
  int v3;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 57))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = (*(_QWORD *)(a1 + 16) >> 3) & 0xFFFFFFE0 | (*(_QWORD *)(a1 + 16) >> 1) & 0x1F;
  if (v2 > 0x80000000)
    v3 = ~v2;
  else
    v3 = -1;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for SplitArguments.Element(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 24) = 0;
      *(_QWORD *)(result + 32) = 0;
      *(_QWORD *)(result + 16) = (8 * -a2) & 0x7FFFFFF00 | (2 * (-a2 & 0x1FLL));
      return result;
    }
    *(_BYTE *)(result + 57) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SplitArguments.Element()
{
  return &type metadata for SplitArguments.Element;
}

uint64_t getEnumTagSinglePayload for SplitArguments.Index(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SplitArguments.Index(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 17) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SplitArguments.Index()
{
  return &type metadata for SplitArguments.Index;
}

uint64_t destroy for SplitArguments(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  return swift_bridgeObjectRelease(a1[2]);
}

uint64_t *_s14ArgumentParser14SplitArgumentsVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[2];
  a1[2] = v5;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v5);
  return a1;
}

uint64_t *assignWithCopy for SplitArguments(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[1] = a2[1];
  v6 = a2[2];
  v7 = a1[2];
  a1[2] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

uint64_t *assignWithTake for SplitArguments(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v4);
  v5 = a2[2];
  v6 = a1[2];
  a1[1] = a2[1];
  a1[2] = v5;
  swift_bridgeObjectRelease(v6);
  return a1;
}

ValueMetadata *type metadata accessor for SplitArguments()
{
  return &type metadata for SplitArguments;
}

unint64_t sub_100076544()
{
  unint64_t result;

  result = qword_1000B9D40;
  if (!qword_1000B9D40)
  {
    result = swift_getWitnessTable(&unk_10009A7A0, &type metadata for SplitArguments.Index);
    atomic_store(result, (unint64_t *)&qword_1000B9D40);
  }
  return result;
}

unint64_t sub_10007658C()
{
  unint64_t result;

  result = qword_1000B9D48;
  if (!qword_1000B9D48)
  {
    result = swift_getWitnessTable(&unk_10009A8F0, &type metadata for SplitArguments.InputIndex);
    atomic_store(result, (unint64_t *)&qword_1000B9D48);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SplitArguments.SubIndex(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for SplitArguments.SubIndex(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SplitArguments.SubIndex(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_100076634(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100076650(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SplitArguments.SubIndex()
{
  return &type metadata for SplitArguments.SubIndex;
}

unint64_t sub_100076684()
{
  unint64_t result;

  result = qword_1000B9D50;
  if (!qword_1000B9D50)
  {
    result = swift_getWitnessTable(&unk_10009A9E4, &type metadata for SplitArguments.SubIndex);
    atomic_store(result, (unint64_t *)&qword_1000B9D50);
  }
  return result;
}

_QWORD *sub_1000766C8(uint64_t a1)
{
  int64_t v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _OWORD *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t *v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  uint64_t v31;
  uint64_t v32;
  _OWORD v33[2];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD *v44;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return _swiftEmptyArrayStorage;
  v44 = _swiftEmptyArrayStorage;
  sub_10004FDF4(0, v1, 0);
  v3 = 0;
  v4 = _swiftEmptyArrayStorage;
  v5 = a1 + 32;
  v31 = a1 + 32;
  do
  {
    v6 = (_OWORD *)(v5 + 192 * v3);
    v7 = v6[9];
    v40 = v6[8];
    v41 = v7;
    v8 = v6[11];
    v42 = v6[10];
    v43 = v8;
    v9 = v6[5];
    v36 = v6[4];
    v37 = v9;
    v10 = v6[7];
    v38 = v6[6];
    v39 = v10;
    v11 = v6[1];
    v33[0] = *v6;
    v33[1] = v11;
    v12 = v6[3];
    v34 = v6[2];
    v35 = v12;
    v14 = *((_QWORD *)&v37 + 1);
    v13 = v38;
    v15 = BYTE7(v38) & 0xF;
    if ((v38 & 0x2000000000000000) == 0)
      v15 = *((_QWORD *)&v37 + 1) & 0xFFFFFFFFFFFFLL;
    if (v15)
    {
      swift_bridgeObjectRetain(v38);
    }
    else
    {
      v16 = (_QWORD *)v34;
      v17 = _swiftEmptyArrayStorage;
      if (*(_QWORD *)&v33[0] >= 2uLL)
        v17 = (_QWORD *)swift_bridgeObjectRetain(*(_QWORD *)&v33[0]);
      v18 = v17[2];
      if (v18)
      {
        v19 = v17 + 4;
        do
        {
          v20 = *((unsigned __int8 *)v19 + 16);
          if (v20 >> 6 != 1)
          {
            v14 = *v19;
            v13 = v19[1];
            sub_10002D724((uint64_t)v33);
            sub_100030508(v14, v13, v20);
            swift_bridgeObjectRelease(v17);
            sub_10002D8A4((uint64_t)v33);
            goto LABEL_21;
          }
          v19 += 3;
          --v18;
        }
        while (v18);
        v14 = v17[4];
        v21 = v17[5];
        v22 = *((unsigned __int8 *)v17 + 48);
        sub_10002D724((uint64_t)v33);
        swift_bridgeObjectRetain(v13);
        v32 = v21;
        sub_100030508(v14, v21, v22);
        swift_bridgeObjectRelease(v17);
        if (v22 >> 6)
        {
          v5 = v31;
          swift_bridgeObjectRelease(v13);
          sub_10002D8A4((uint64_t)v33);
        }
        else
        {
          swift_bridgeObjectRelease(v13);
          sub_10002D8A4((uint64_t)v33);
          v5 = v31;
        }
        v13 = v32;
      }
      else
      {
        sub_10002D724((uint64_t)v33);
        swift_bridgeObjectRetain(v13);
        swift_bridgeObjectRelease(v17);
        if (v16[2])
        {
          v23 = v16[4];
          v24 = v16[5];
          swift_bridgeObjectRetain(v24);
          v14 = sub_10004E9B4(45, 0xE100000000000000, v23, v24);
          v26 = v25;
          swift_bridgeObjectRelease(v13);
          swift_bridgeObjectRelease(v24);
          sub_10002D8A4((uint64_t)v33);
          v13 = v26;
        }
        else
        {
          swift_bridgeObjectRelease(v13);
          sub_10002D8A4((uint64_t)v33);
          v13 = 0xE500000000000000;
          v14 = 0x65756C6176;
        }
      }
    }
LABEL_21:
    v44 = v4;
    v28 = v4[2];
    v27 = v4[3];
    if (v28 >= v27 >> 1)
    {
      sub_10004FDF4((char *)(v27 > 1), v28 + 1, 1);
      v4 = v44;
    }
    ++v3;
    v4[2] = v28 + 1;
    v29 = &v4[2 * v28];
    v29[4] = v14;
    v29[5] = v13;
  }
  while (v3 != v1);
  return v4;
}

_QWORD *sub_10007698C(uint64_t a1)
{
  int64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_10004FDF4(0, v1, 0);
    v3 = (_QWORD *)(a1 + 96);
    do
    {
      v5 = *(v3 - 1);
      v4 = *v3;
      v7 = _swiftEmptyArrayStorage[2];
      v6 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain(*v3);
      if (v7 >= v6 >> 1)
        sub_10004FDF4((char *)(v6 > 1), v7 + 1, 1);
      _swiftEmptyArrayStorage[2] = v7 + 1;
      v8 = &_swiftEmptyArrayStorage[2 * v7];
      v8[4] = v5;
      v8[5] = v4;
      v3 += 24;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

_QWORD *sub_100076A60(uint64_t a1)
{
  int64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_10004FDF4(0, v1, 0);
    v3 = (_QWORD *)(a1 + 112);
    do
    {
      v5 = *(v3 - 1);
      v4 = *v3;
      v7 = _swiftEmptyArrayStorage[2];
      v6 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain(*v3);
      if (v7 >= v6 >> 1)
        sub_10004FDF4((char *)(v6 > 1), v7 + 1, 1);
      _swiftEmptyArrayStorage[2] = v7 + 1;
      v8 = &_swiftEmptyArrayStorage[2 * v7];
      v8[4] = v5;
      v8[5] = v4;
      v3 += 24;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

_QWORD *sub_100076B34(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  v3 = sub_10007889C(a1, a2);
  swift_bridgeObjectRelease(a2);
  return v3;
}

char *sub_100076B80(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  char *result;
  _QWORD *v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (char *)_swiftEmptyArrayStorage;
  swift_bridgeObjectRetain(a1);
  v3 = 32;
  v4 = (char *)_swiftEmptyArrayStorage;
  while (1)
  {
    result = *(char **)(a1 + v3);
    v6 = (unint64_t)result >= 2 ? *(_QWORD **)(a1 + v3) : _swiftEmptyArrayStorage;
    v7 = v6[2];
    v8 = *((_QWORD *)v4 + 2);
    v9 = v8 + v7;
    if (__OFADD__(v8, v7))
      break;
    sub_10002D810((unint64_t)result);
    result = (char *)swift_isUniquelyReferenced_nonNull_native(v4);
    if ((_DWORD)result && v9 <= *((_QWORD *)v4 + 3) >> 1)
    {
      if (v6[2])
        goto LABEL_17;
    }
    else
    {
      if (v8 <= v9)
        v10 = v8 + v7;
      else
        v10 = v8;
      result = sub_100057BB8(result, v10, 1, v4);
      v4 = result;
      if (v6[2])
      {
LABEL_17:
        v11 = *((_QWORD *)v4 + 2);
        if ((*((_QWORD *)v4 + 3) >> 1) - v11 < v7)
          goto LABEL_26;
        result = (char *)swift_arrayInitWithCopy(&v4[24 * v11 + 32], v6 + 4, v7, &type metadata for Name);
        if (v7)
        {
          v12 = *((_QWORD *)v4 + 2);
          v13 = __OFADD__(v12, v7);
          v14 = v12 + v7;
          if (v13)
            goto LABEL_27;
          *((_QWORD *)v4 + 2) = v14;
        }
        goto LABEL_4;
      }
    }
    if (v7)
      goto LABEL_25;
LABEL_4:
    swift_bridgeObjectRelease(v6);
    v3 += 192;
    if (!--v1)
    {
      swift_bridgeObjectRelease(a1);
      return v4;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

char *sub_100076CD0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (char *)_swiftEmptyArrayStorage;
  v3 = (_QWORD *)(swift_bridgeObjectRetain(a1) + 56);
  v4 = (char *)_swiftEmptyArrayStorage;
  do
  {
    v6 = *v3;
    if (*v3)
    {
      v7 = *(v3 - 1);
      swift_bridgeObjectRetain(*v3);
      if ((swift_isUniquelyReferenced_nonNull_native(v4) & 1) == 0)
        v4 = sub_100057AB8(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
      v9 = *((_QWORD *)v4 + 2);
      v8 = *((_QWORD *)v4 + 3);
      if (v9 >= v8 >> 1)
        v4 = sub_100057AB8((char *)(v8 > 1), v9 + 1, 1, v4);
      *((_QWORD *)v4 + 2) = v9 + 1;
      v5 = &v4[16 * v9];
      *((_QWORD *)v5 + 4) = v7;
      *((_QWORD *)v5 + 5) = v6;
    }
    v3 += 24;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease(a1);
  return v4;
}

uint64_t sub_100076DD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
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
  void (*v15)(_OWORD *, _QWORD);
  void (*v16)(char *, uint64_t);
  __int128 v17;
  __int128 v18;
  __int128 v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v29[16];
  _OWORD v30[6];

  v1 = v0;
  v2 = type metadata accessor for String.Encoding(0);
  __chkstk_darwin(v2);
  v4 = &v29[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = type metadata accessor for JSONEncoder.OutputFormatting(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = &v29[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  v11 = &v29[-v10];
  v12 = type metadata accessor for JSONEncoder(0);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  v13 = JSONEncoder.init()();
  static JSONEncoder.OutputFormatting.prettyPrinted.getter();
  v14 = dispatch thunk of JSONEncoder.outputFormatting.setter(v11);
  static JSONEncoder.OutputFormatting.sortedKeys.getter(v14);
  v15 = (void (*)(_OWORD *, _QWORD))dispatch thunk of JSONEncoder.outputFormatting.modify(v30);
  sub_100076FE4(v11, (uint64_t)v9);
  v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v9, v5);
  v16(v11, v5);
  v15(v30, 0);
  v17 = *(_OWORD *)(v1 + 48);
  v30[2] = *(_OWORD *)(v1 + 32);
  v30[3] = v17;
  v18 = *(_OWORD *)(v1 + 80);
  v30[4] = *(_OWORD *)(v1 + 64);
  v30[5] = v18;
  v19 = *(_OWORD *)(v1 + 16);
  v30[0] = *(_OWORD *)v1;
  v30[1] = v19;
  sub_100077204((_QWORD *)v1);
  v20 = sub_100077288();
  v21 = dispatch thunk of JSONEncoder.encode<A>(_:)(v30, &type metadata for ToolInfoV0, v20);
  v23 = v22;
  v24 = sub_1000772CC((_QWORD *)v1);
  static String.Encoding.utf8.getter(v24);
  v25 = String.init(data:encoding:)(v21, v23, v4);
  if (v26)
  {
    v27 = v25;
    sub_10001BB38(v21, v23);
    swift_release(v13);
  }
  else
  {
    sub_10001BB38(v21, v23);
    swift_release(v13);
    return 0;
  }
  return v27;
}

uint64_t sub_100076FE4(char *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  char v19;
  char *v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  char *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;

  v30 = a1;
  v4 = sub_100005104(&qword_1000B9D60);
  v5 = __chkstk_darwin(v4);
  v28 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v8 = (char *)&v25 - v7;
  v9 = type metadata accessor for JSONEncoder.OutputFormatting(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v25 - v14;
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v27 = v2;
  v16(v13, v2, v9);
  v17 = sub_100077350(&qword_1000B9D68, (uint64_t)&protocol conformance descriptor for JSONEncoder.OutputFormatting);
  dispatch thunk of SetAlgebra.intersection(_:)(a2, v9, v17);
  v18 = sub_100077350(&qword_1000B9D70, (uint64_t)&protocol conformance descriptor for JSONEncoder.OutputFormatting);
  v26 = a2;
  v19 = dispatch thunk of static Equatable.== infix(_:_:)(v15, a2, v9, v18) ^ 1;
  v29 = v4;
  v20 = &v8[*(int *)(v4 + 48)];
  *v8 = v19 & 1;
  if ((v19 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
    v22 = v26;
    v16(v20, v26, v9);
    v16(v13, v22, v9);
    dispatch thunk of SetAlgebra.formUnion(_:)(v13, v9, v17);
    v21 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  }
  else
  {
    v21 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v21(v20, v15, v9);
  }
  v23 = &v28[*(int *)(v29 + 48)];
  v21(v23, v20, v9);
  v21(v30, v23, v9);
  return v19 & 1;
}

_QWORD *sub_100077204(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a1[1];
  v3 = a1[3];
  v4 = a1[5];
  v5 = a1[7];
  v6 = a1[9];
  v7 = a1[10];
  swift_bridgeObjectRetain(a1[11]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  return a1;
}

unint64_t sub_100077288()
{
  unint64_t result;

  result = qword_1000B9D58;
  if (!qword_1000B9D58)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ToolInfoV0, &type metadata for ToolInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000B9D58);
  }
  return result;
}

_QWORD *sub_1000772CC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a1[1];
  v3 = a1[5];
  v4 = a1[7];
  v5 = a1[9];
  v6 = a1[10];
  v7 = a1[11];
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

uint64_t sub_100077350(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for JSONEncoder.OutputFormatting(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *sub_100077390(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _BYTE v8[32];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  Swift::String_optional (__swiftcall *v18)(Swift::String);
  uint64_t v19;
  _BYTE v20[192];
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[192];
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  char v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  _BYTE v34[153];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[2];
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  _OWORD v52[12];

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v21 = sub_10004D160(*(_QWORD *)(a1 + 16 * v1 + 16), *(_QWORD *)(*(_QWORD *)(a1 + 16 * v1 + 24) + 8), 2, 0, 0, 0);
    v22 = v3;
    sub_100032A2C(a1, (uint64_t)v23);
    sub_10002AACC((uint64_t)v23, (uint64_t)v20, &qword_1000B9148);
    sub_10002AACC((uint64_t)v23, (uint64_t)v34, &qword_1000B9148);
    if (sub_100033CB4((uint64_t)v34) != 1)
    {
      sub_10002AACC((uint64_t)v20, (uint64_t)&v35, &qword_1000B9148);
      v52[8] = v43;
      v52[9] = v44;
      v52[10] = v45;
      v52[11] = v46;
      v52[4] = v39;
      v52[5] = v40;
      v52[6] = v41;
      v52[7] = v42;
      v52[0] = v35;
      v52[1] = v36;
      v52[2] = v37;
      v52[3] = v38;
      sub_100060FF8((uint64_t)v52);
      sub_100033CCC((uint64_t)v23);
    }
    v4 = sub_100032880(0, a1);
    v5 = v4;
    if (*(_QWORD *)(v4 + 16))
    {
      v47[0] = 0xD000000000000016;
      v47[1] = 0x800000010009D570;
      v48 = xmmword_100097E30;
      v50 = 0;
      v49 = 0;
      v51 = 0;
      sub_10005EC6C((uint64_t)_swiftEmptyArrayStorage, 1, (uint64_t)v47, 0, 0, 0, 0xE000000000000000, (uint64_t)_swiftEmptyArrayStorage, (uint64_t)&v24, 0);
      *(_QWORD *)v8 = v5;
      *(_OWORD *)&v8[8] = v24;
      *(_QWORD *)&v8[24] = v25;
      v9 = v26;
      LOBYTE(v10) = v27;
      *((_QWORD *)&v10 + 1) = v28;
      v11 = v29;
      v12 = v30;
      *(_QWORD *)&v13 = v31;
      BYTE8(v13) = v32;
      v14 = v33;
      v15 = 0uLL;
      LOWORD(v16) = 4;
      *((_QWORD *)&v16 + 1) = String.init(argument:);
      *(_QWORD *)&v17 = 0;
      BYTE8(v17) = 0;
      v18 = String.init(argument:);
      v19 = 0;
      v37 = v26;
      v38 = v10;
      v35 = *(_OWORD *)v8;
      v36 = *(_OWORD *)&v8[16];
      v42 = v33;
      v40 = v30;
      v41 = v13;
      v39 = v29;
      v46 = (unint64_t)String.init(argument:);
      v45 = v17;
      v44 = v16;
      v43 = 0uLL;
      sub_100060FF8((uint64_t)&v35);
      sub_10002D8A4((uint64_t)v8);
    }
    else
    {
      swift_bridgeObjectRelease(v4);
    }
    return (_QWORD *)v21;
  }
  else
  {
    v6 = _swiftEmptyArrayStorage;
    sub_100079598((uint64_t)_swiftEmptyArrayStorage);
  }
  return v6;
}

uint64_t sub_100077610(unint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  int64_t v5;
  uint64_t result;
  int64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  __int128 *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  char v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v60;
  unint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  char *v72;
  _QWORD *v73;
  _QWORD *v74;
  uint64_t v75;
  unint64_t *v76;
  uint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  _QWORD *v81;
  _QWORD *v82;
  uint64_t v83;
  unint64_t *v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  unint64_t *v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int64_t v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  char v101;
  char v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  unint64_t v111;
  char v112[121];
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[32];
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _BYTE v133[32];
  __int128 v134;
  _QWORD *v135;
  unint64_t v136;
  _OWORD v137[13];

  v4 = _swiftEmptyArrayStorage;
  v135 = _swiftEmptyArrayStorage;
  v136 = sub_100079598((uint64_t)_swiftEmptyArrayStorage);
  v5 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain(a1);
  v91 = a2;
  result = swift_bridgeObjectRetain(a2);
  if (!v5)
  {
LABEL_87:
    swift_bridgeObjectRelease(v91);
    swift_bridgeObjectRelease(a1);
    return (uint64_t)v4;
  }
  v7 = 0;
  v98 = a1 + 32;
  v93 = a1;
  v97 = v5;
  while (1)
  {
    if (v7 >= v5)
    {
      __break(1u);
LABEL_89:
      __break(1u);
LABEL_90:
      __break(1u);
      goto LABEL_91;
    }
    if (v7 < 0)
      goto LABEL_89;
    v17 = *(_QWORD *)(a1 + 16);
    if (v7 >= (unint64_t)v17)
      goto LABEL_90;
    v18 = (__int128 *)(v98 + 192 * v7);
    v19 = v18[9];
    v132 = v18[8];
    *(_OWORD *)v133 = v19;
    v20 = v18[11];
    *(_OWORD *)&v133[16] = v18[10];
    v134 = v20;
    v21 = v18[5];
    v128 = v18[4];
    v129 = v21;
    v22 = v18[7];
    v130 = v18[6];
    v131 = v22;
    v23 = v18[1];
    v124 = *v18;
    v125 = v23;
    v24 = v18[3];
    v126 = v18[2];
    v127 = v24;
    v25 = v24;
    v26 = v7 + 1;
    v27 = *((_QWORD *)&v125 + 1);
    v99 = v129;
    v28 = v128;
    v29 = v130;
    v107 = *(_OWORD *)&v133[8];
    v108 = v132;
    v109 = v134;
    v110 = v126;
    v106 = BYTE8(v130);
    v104 = *((_QWORD *)&v131 + 1);
    v105 = v131;
    v102 = v133[1];
    v103 = v133[0];
    v101 = v133[24];
    v100 = *((_QWORD *)&v124 + 1);
    v111 = v124;
    if (v24 != 1)
    {
      v8 = *((_QWORD *)&v127 + 1);
      v9 = a1;
      v10 = v125;
      v11 = *((_QWORD *)&v129 + 1);
      v12 = *((_QWORD *)&v128 + 1);
      sub_10002D724((uint64_t)&v124);
      v13 = v27;
      v14 = v26;
      v15 = v10;
      a1 = v9;
      v16 = v99;
      goto LABEL_4;
    }
    v94 = v130;
    v95 = *((_QWORD *)&v125 + 1);
    v96 = v128;
    if (v26 != v5)
      break;
    v14 = v5;
LABEL_54:
    v60 = sub_100005104(&qword_1000B9230);
    result = swift_initStackObject(v60, v112);
    *(_OWORD *)(result + 16) = xmmword_100096510;
    v61 = v124;
    v63 = v130;
    v62 = v131;
    v64 = v129;
    *(_OWORD *)(result + 96) = v128;
    *(_OWORD *)(result + 112) = v64;
    v66 = v126;
    v65 = v127;
    v67 = v125;
    *(_OWORD *)(result + 32) = v124;
    *(_OWORD *)(result + 48) = v67;
    v69 = *(_OWORD *)&v133[16];
    v68 = v134;
    v70 = *(_OWORD *)v133;
    *(_OWORD *)(result + 160) = v132;
    *(_OWORD *)(result + 176) = v70;
    *(_OWORD *)(result + 192) = v69;
    *(_OWORD *)(result + 208) = v68;
    *(_OWORD *)(result + 128) = v63;
    *(_OWORD *)(result + 144) = v62;
    *(_OWORD *)(result + 64) = v66;
    *(_OWORD *)(result + 80) = v65;
    if (v14 <= v7)
      goto LABEL_94;
    if (v5 < v14)
      goto LABEL_95;
    *(_QWORD *)&v113 = result;
    sub_10002D724((uint64_t)&v124);
    sub_10002D724((uint64_t)&v124);
    swift_bridgeObjectRetain(a1);
    swift_bridgeObjectRetain(v91);
    sub_100056F0C(v26, v14, a1, v91);
    v71 = v113;
    if (v61 >= 2)
    {
      v72 = sub_100076B80(v113);
      sub_10002D990(v111);
      v111 = (unint64_t)v72;
    }
    v73 = sub_1000766C8(v71);
    v74 = v73;
    v75 = v73[2];
    if (v75)
    {
      v76 = v73 + 5;
      while (1)
      {
        v11 = *(v76 - 1);
        v29 = *v76;
        v77 = HIBYTE(*v76) & 0xF;
        if ((*v76 & 0x2000000000000000) == 0)
          v77 = v11 & 0xFFFFFFFFFFFFLL;
        if (v77)
          break;
        v76 += 2;
        if (!--v75)
          goto LABEL_64;
      }
      swift_bridgeObjectRetain(*v76);
    }
    else
    {
LABEL_64:
      v11 = 0;
      v29 = 0xE000000000000000;
    }
    swift_bridgeObjectRelease(v74);
    swift_bridgeObjectRelease(v94);
    v78 = sub_100076CD0(v71);
    v79 = v78;
    if (*((_QWORD *)v78 + 2))
    {
      v15 = *((_QWORD *)v78 + 4);
      v80 = *((_QWORD *)v78 + 5);
      swift_bridgeObjectRetain(v80);
    }
    else
    {
      v15 = 0;
      v80 = 0;
    }
    swift_bridgeObjectRelease(v79);
    swift_bridgeObjectRelease(v95);
    v81 = sub_10007698C(v71);
    v82 = v81;
    v83 = v81[2];
    if (v83)
    {
      v84 = v81 + 5;
      while (1)
      {
        v8 = *(v84 - 1);
        v28 = *v84;
        v85 = HIBYTE(*v84) & 0xF;
        if ((*v84 & 0x2000000000000000) == 0)
          v85 = v8 & 0xFFFFFFFFFFFFLL;
        if (v85)
          break;
        v84 += 2;
        if (!--v83)
          goto LABEL_75;
      }
      swift_bridgeObjectRetain(*v84);
    }
    else
    {
LABEL_75:
      v8 = 0;
      v28 = 0xE000000000000000;
    }
    swift_bridgeObjectRelease(v82);
    swift_bridgeObjectRelease(v96);
    v86 = sub_100076A60(v71);
    swift_bridgeObjectRelease(v71);
    v87 = v86[2];
    if (v87)
    {
      v88 = v86 + 5;
      while (1)
      {
        v12 = *(v88 - 1);
        v89 = *v88;
        v90 = HIBYTE(*v88) & 0xF;
        if ((*v88 & 0x2000000000000000) == 0)
          v90 = v12 & 0xFFFFFFFFFFFFLL;
        if (v90)
          break;
        v88 += 2;
        if (!--v87)
          goto LABEL_83;
      }
      swift_bridgeObjectRetain(*v88);
    }
    else
    {
LABEL_83:
      v12 = 0;
      v89 = 0xE000000000000000;
    }
    swift_bridgeObjectRelease(v86);
    swift_bridgeObjectRelease(v99);
    v16 = v89;
    a1 = v93;
    v25 = 1;
    v13 = v80;
LABEL_4:
    *(_QWORD *)&v113 = v111;
    *((_QWORD *)&v113 + 1) = v100;
    *(_QWORD *)&v114 = v15;
    *((_QWORD *)&v114 + 1) = v13;
    v115 = v110;
    LOBYTE(v116) = v25 & 1;
    *((_QWORD *)&v116 + 1) = v8;
    *(_QWORD *)&v117 = v28;
    *((_QWORD *)&v117 + 1) = v12;
    *(_QWORD *)&v118 = v16;
    *((_QWORD *)&v118 + 1) = v11;
    *(_QWORD *)&v119 = v29;
    BYTE8(v119) = v106;
    *(_QWORD *)&v120 = v105;
    *((_QWORD *)&v120 + 1) = v104;
    v121 = v108;
    v122[0] = v103;
    v122[1] = v102;
    *(_OWORD *)&v122[8] = v107;
    v122[24] = v101 & 1;
    v123 = v109;
    v137[0] = v113;
    v137[1] = v114;
    v137[9] = *(_OWORD *)v122;
    v137[2] = v110;
    v137[3] = v116;
    v137[7] = v120;
    v137[8] = v108;
    v137[5] = v118;
    v137[6] = v119;
    v137[4] = v117;
    v137[11] = v109;
    v137[10] = *(_OWORD *)&v122[16];
    sub_10002D724((uint64_t)&v113);
    sub_100060FF8((uint64_t)v137);
    sub_10002D8A4((uint64_t)&v113);
    result = sub_10002D8A4((uint64_t)&v113);
    v7 = v14;
    v5 = v97;
    if (v14 == v97)
    {
      v4 = v135;
      goto LABEL_87;
    }
  }
  v30 = *(_QWORD *)(v126 + 16);
  v92 = v17;
  v31 = v126 + 32;
  v14 = v7 + 1;
  while (v14 < v5)
  {
    if (v14 >= v17)
      goto LABEL_92;
    v32 = *(_QWORD *)(v98 + 192 * v14 + 32);
    if (*(_QWORD *)(v32 + 16) != v30)
      goto LABEL_52;
    if (v30 && v32 != (_QWORD)v110)
    {
      v33 = 0;
      v34 = v32 + 32;
      while (1)
      {
        v35 = (uint64_t *)(v34 + 24 * v33);
        result = *v35;
        v36 = v35[1];
        v37 = (_QWORD *)v35[2];
        v38 = (_QWORD *)(v31 + 24 * v33);
        v39 = v38[1];
        v40 = (_QWORD *)v38[2];
        if (*v35 != *v38 || v36 != v39)
        {
          result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v36, *v38, v39, 0);
          if ((result & 1) == 0)
            break;
        }
        v42 = v37[2];
        if (v42 != v40[2])
          break;
        if (v42)
          v43 = v37 == v40;
        else
          v43 = 1;
        if (!v43)
        {
          result = v37[4];
          v44 = v37[5];
          v45 = v40[4];
          v46 = v40[5];
          if (result != v45 || v44 != v46)
          {
            result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v44, v45, v46, 0);
            if ((result & 1) == 0)
              break;
          }
          if (v42 != 1)
          {
            result = v37[6];
            v48 = v37[7];
            v49 = v40[6];
            v50 = v40[7];
            if (result != v49 || v48 != v50)
            {
              result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v48, v49, v50, 0);
              if ((result & 1) == 0)
                break;
            }
            v52 = v42 - 2;
            if (v52)
            {
              v53 = v40 + 9;
              v54 = v37 + 9;
              do
              {
                result = *(v54 - 1);
                v55 = *v54;
                v56 = *(v53 - 1);
                v57 = *v53;
                if (result != v56 || v55 != v57)
                {
                  result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v55, v56, v57, 0);
                  if ((result & 1) == 0)
                    goto LABEL_53;
                }
                v53 += 2;
                v54 += 2;
              }
              while (--v52);
            }
          }
        }
        if (++v33 == v30)
          goto LABEL_49;
      }
LABEL_53:
      a1 = v93;
      v5 = v97;
      v26 = v7 + 1;
      goto LABEL_54;
    }
LABEL_49:
    if (__OFADD__(v14++, 1))
      goto LABEL_93;
    v5 = v97;
    v26 = v7 + 1;
    v17 = v92;
    if (v14 == v97)
    {
      v14 = v97;
LABEL_52:
      a1 = v93;
      goto LABEL_54;
    }
  }
LABEL_91:
  __break(1u);
LABEL_92:
  __break(1u);
LABEL_93:
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
  return result;
}

uint64_t sub_100077CF4@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  BOOL v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  void (*v18)(_OWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t i;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  unint64_t v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  _QWORD *v57;
  unint64_t v58;
  uint64_t v59;
  void (*v60)(_OWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v63;
  _QWORD *v64;
  _QWORD v65[2];
  uint64_t v66;
  _QWORD v67[14];
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  _QWORD v71[13];
  uint64_t v72;
  _OWORD v73[2];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  _QWORD v81[9];
  unint64_t v82;
  _OWORD v83[5];
  uint64_t v84;
  _BYTE v85[136];
  _BYTE v86[136];
  _BYTE v87[16];
  _BYTE v88[16];
  _OWORD v89[12];
  uint64_t v90;
  uint64_t v91;
  _QWORD v92[4];

  v2 = *(_QWORD *)(result + 16);
  if (v2)
  {
    v3 = result;
    v4 = v2 - 1;
    v9 = v2 == 1;
    v5 = result + 16 * (v2 - 1);
    v7 = *(_QWORD *)(v5 + 32);
    v6 = *(_QWORD *)(v5 + 40);
    v8 = v4 & 0x7FFFFFFFFFFFFFFFLL;
    v9 = v9 || v8 == 0;
    v63 = *(_QWORD *)(v5 + 40);
    if (v9)
    {
      v64 = _swiftEmptyArrayStorage;
      swift_bridgeObjectRetain(result);
    }
    else
    {
      *(_QWORD *)&v89[0] = _swiftEmptyArrayStorage;
      swift_bridgeObjectRetain(result);
      sub_10004FDF4(0, v8, 0);
      v10 = _swiftEmptyArrayStorage;
      v11 = v3 + 40;
      do
      {
        v12 = (*(uint64_t (**)(void))(*(_QWORD *)v11 + 24))();
        v14 = v13;
        *(_QWORD *)&v89[0] = v10;
        v16 = v10[2];
        v15 = v10[3];
        if (v16 >= v15 >> 1)
        {
          sub_10004FDF4((char *)(v15 > 1), v16 + 1, 1);
          v10 = *(_QWORD **)&v89[0];
        }
        v10[2] = v16 + 1;
        v17 = &v10[2 * v16];
        v17[4] = v12;
        v17[5] = v14;
        v11 += 16;
        --v8;
      }
      while (v8);
      v64 = v10;
      (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)(v3 + 40) + 16))(v65);
      sub_10002AACC((uint64_t)&v66, (uint64_t)v88, &qword_1000B9110);
      sub_10002E7A0((uint64_t)v88);
      sub_10002CC24(v65);
      sub_10002AACC((uint64_t)v88, (uint64_t)&v90, &qword_1000B9110);
      v6 = v63;
      if (v91)
        sub_10007826C(0, 0, v90, v91);
    }
    v18 = *(void (**)(_OWORD *__return_ptr, uint64_t, uint64_t))(v6 + 16);
    v18(v67, v7, v6);
    sub_10002CC24(v67);
    sub_10002AACC((uint64_t)&v68, (uint64_t)v87, &qword_1000B9720);
    sub_10002AACC((uint64_t)v87, (uint64_t)v92, &qword_1000B9720);
    if (v92[0])
    {
      (*(void (**)(uint64_t *__return_ptr))(v92[1] + 16))(&v69);
      v58 = v70;
      v59 = v69;
      swift_bridgeObjectRetain(v70);
      sub_10002CC24(&v69);
    }
    else
    {
      v58 = 0;
      v59 = 0;
    }
    v60 = v18;
    v18(v71, v7, v6);
    v19 = v72;
    swift_bridgeObjectRetain(v72);
    sub_10002CC24(v71);
    swift_bridgeObjectRetain(v3);
    v57 = sub_100076B34(v19, v3);
    swift_bridgeObjectRelease(v19);
    v20 = sub_100077390(v3);
    v22 = v21;
    v61 = v3;
    swift_bridgeObjectRelease(v3);
    v23 = sub_100077610((unint64_t)v20, v22);
    v25 = v24;
    swift_bridgeObjectRelease(v22);
    swift_bridgeObjectRelease(v20);
    v26 = *(_QWORD *)(v23 + 16);
    if (v26)
    {
      swift_bridgeObjectRetain(v23);
      v56 = v25;
      swift_bridgeObjectRetain(v25);
      v27 = v26 - 1;
      v28 = (char *)_swiftEmptyArrayStorage;
      for (i = 32; ; i += 192)
      {
        v30 = *(_OWORD *)(v23 + i);
        v31 = *(_OWORD *)(v23 + i + 16);
        v32 = *(_OWORD *)(v23 + i + 32);
        v89[3] = *(_OWORD *)(v23 + i + 48);
        v89[2] = v32;
        v89[1] = v31;
        v89[0] = v30;
        v33 = *(_OWORD *)(v23 + i + 64);
        v34 = *(_OWORD *)(v23 + i + 80);
        v35 = *(_OWORD *)(v23 + i + 96);
        v89[7] = *(_OWORD *)(v23 + i + 112);
        v89[6] = v35;
        v89[5] = v34;
        v89[4] = v33;
        v36 = *(_OWORD *)(v23 + i + 128);
        v37 = *(_OWORD *)(v23 + i + 144);
        v38 = *(_OWORD *)(v23 + i + 160);
        v89[11] = *(_OWORD *)(v23 + i + 176);
        v89[10] = v38;
        v89[9] = v37;
        v89[8] = v36;
        sub_10002D724((uint64_t)v89);
        sub_1000784E4((uint64_t)v89, (uint64_t)v85);
        sub_10002AACC((uint64_t)v85, (uint64_t)v81, &qword_1000B9D78);
        sub_10002D8A4((uint64_t)v89);
        sub_10002AACC((uint64_t)v85, (uint64_t)v86, &qword_1000B9D78);
        if (sub_100078848((uint64_t)v86) != 1)
        {
          if ((swift_isUniquelyReferenced_nonNull_native(v28) & 1) == 0)
            v28 = sub_10005885C(0, *((_QWORD *)v28 + 2) + 1, 1, v28);
          v40 = *((_QWORD *)v28 + 2);
          v39 = *((_QWORD *)v28 + 3);
          if (v40 >= v39 >> 1)
            v28 = sub_10005885C((char *)(v39 > 1), v40 + 1, 1, v28);
          sub_10002AACC((uint64_t)v81, (uint64_t)v73, &qword_1000B9D78);
          *((_QWORD *)v28 + 2) = v40 + 1;
          v41 = &v28[136 * v40];
          *((_OWORD *)v41 + 2) = v73[0];
          v42 = v76;
          v44 = v73[1];
          v43 = v74;
          *((_OWORD *)v41 + 5) = v75;
          *((_OWORD *)v41 + 6) = v42;
          *((_OWORD *)v41 + 3) = v44;
          *((_OWORD *)v41 + 4) = v43;
          v46 = v78;
          v45 = v79;
          v47 = v77;
          *((_QWORD *)v41 + 20) = v80;
          *((_OWORD *)v41 + 8) = v46;
          *((_OWORD *)v41 + 9) = v45;
          *((_OWORD *)v41 + 7) = v47;
        }
        if (!v27)
          break;
        --v27;
      }
      swift_bridgeObjectRelease_n(v56, 2);
      swift_bridgeObjectRelease_n(v23, 2);
    }
    else
    {
      swift_bridgeObjectRelease(v25);
      swift_bridgeObjectRelease(v23);
      v28 = (char *)_swiftEmptyArrayStorage;
    }
    v48 = (*(uint64_t (**)(uint64_t, uint64_t))(v63 + 24))(v7, v63);
    v50 = v49;
    v60(v73, v7, v63);
    v51 = v74;
    swift_bridgeObjectRetain(*((_QWORD *)&v74 + 1));
    sub_10002CC24(v73);
    v60(v81, v7, v63);
    v52 = v81[8];
    v53 = v82;
    swift_bridgeObjectRetain(v82);
    sub_10002CC24(v81);
    CommandInfoV0.init(superCommands:commandName:abstract:discussion:defaultSubcommand:subcommands:arguments:)((uint64_t)v64, v48, v50, v51, *((unint64_t *)&v51 + 1), v52, v53, v59, v83, v58, (uint64_t)v57, (uint64_t)v28);
    result = swift_unknownObjectRelease(v61);
    v54 = v83[3];
    *(_OWORD *)(a2 + 32) = v83[2];
    *(_OWORD *)(a2 + 48) = v54;
    *(_OWORD *)(a2 + 64) = v83[4];
    *(_QWORD *)(a2 + 80) = v84;
    v55 = v83[1];
    *(_OWORD *)a2 = v83[0];
    *(_OWORD *)(a2 + 16) = v55;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10007822C(uint64_t result, uint64_t a2)
{
  if ((result & 0x8000000000000000) == 0)
    return a2;
  __break(1u);
  return result;
}

unint64_t sub_10007826C(unint64_t result, int64_t a2, uint64_t a3, uint64_t a4)
{
  char **v4;
  char *v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v15;
  char *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  v6 = *v4;
  v7 = *((_QWORD *)*v4 + 2);
  if (v7 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v8 = result;
  v9 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = 1 - v9;
  if (__OFSUB__(1, v9))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v11 = v7 + v10;
  if (__OFADD__(v7, v10))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(*v4);
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v11 > *((_QWORD *)v6 + 3) >> 1)
  {
    if (v7 <= v11)
      v15 = v7 + v10;
    else
      v15 = v7;
    v6 = sub_100057AB8(isUniquelyReferenced_nonNull_native, v15, 1, v6);
  }
  v16 = &v6[16 * v8 + 32];
  result = swift_arrayDestroy(v16, v9, &type metadata for String);
  if (!v10)
    goto LABEL_19;
  v17 = *((_QWORD *)v6 + 2);
  v18 = __OFSUB__(v17, a2);
  v19 = v17 - a2;
  if (v18)
    goto LABEL_25;
  result = (unint64_t)(v16 + 16);
  v20 = &v6[16 * a2 + 32];
  if (v16 + 16 != v20 || result >= (unint64_t)&v20[16 * v19])
    result = (unint64_t)memmove((void *)result, v20, 16 * v19);
  v21 = *((_QWORD *)v6 + 2);
  v18 = __OFADD__(v21, v10);
  v22 = v21 + v10;
  if (!v18)
  {
    *((_QWORD *)v6 + 2) = v22;
LABEL_19:
    *(_QWORD *)v16 = a3;
    *((_QWORD *)v16 + 1) = a4;
    *v4 = v6;
    return result;
  }
LABEL_26:
  __break(1u);
  return result;
}

_OWORD *sub_100078398(_QWORD *a1, int64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _OWORD *result;
  _OWORD *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  result = malloc(0x240uLL);
  *a1 = result;
  if (a2 < a3 || a2 >= a4)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (a2 < 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_QWORD *)(a5 + 16) > (unint64_t)a2)
  {
    v11 = (_OWORD *)(a5 + 192 * a2);
    v13 = v11[10];
    v12 = v11[11];
    v14 = v11[9];
    result[8] = v13;
    result[9] = v12;
    v15 = v11[11];
    v17 = v11[12];
    v16 = v11[13];
    result[10] = v17;
    result[11] = v16;
    v19 = v11[6];
    v18 = v11[7];
    v20 = v11[5];
    result[4] = v19;
    result[5] = v18;
    v21 = v11[7];
    v23 = v11[8];
    v22 = v11[9];
    result[6] = v23;
    result[7] = v22;
    v24 = v11[3];
    *result = v11[2];
    result[1] = v24;
    v25 = v11[5];
    v27 = v11[2];
    v26 = v11[3];
    v28 = v11[4];
    result[2] = v28;
    result[3] = v25;
    result[20] = v13;
    result[21] = v15;
    v29 = v11[13];
    result[22] = v17;
    result[23] = v29;
    result[16] = v19;
    result[17] = v21;
    result[18] = v23;
    result[19] = v14;
    result[12] = v27;
    result[13] = v26;
    result[14] = v28;
    result[15] = v20;
    sub_10002D724((uint64_t)result);
    return sub_10007848C;
  }
LABEL_8:
  __break(1u);
  return result;
}

void sub_10007848C(_OWORD **a1)
{
  _OWORD *v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v1 = *a1;
  v2 = (uint64_t)(*a1 + 24);
  v3 = v1[21];
  v1[32] = v1[20];
  v1[33] = v3;
  v4 = v1[23];
  v1[34] = v1[22];
  v1[35] = v4;
  v5 = v1[17];
  v1[28] = v1[16];
  v1[29] = v5;
  v6 = v1[19];
  v1[30] = v1[18];
  v1[31] = v6;
  v7 = v1[13];
  v1[24] = v1[12];
  v1[25] = v7;
  v8 = v1[15];
  v1[26] = v1[14];
  v1[27] = v8;
  sub_10002D8A4(v2);
  free(v1);
}

uint64_t sub_1000784E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  _QWORD *v10;
  int64_t v11;
  _QWORD *v12;
  unsigned __int8 *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  unint64_t v31;
  Swift::String v32;
  _QWORD *v34;
  int v35;
  unint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  __int128 v51;
  _BYTE v52[136];
  __int128 v53;
  __int128 v54;
  __n128 v55;
  __n128 v56;
  char v57;
  _QWORD v58[18];

  v4 = *(_QWORD **)a1;
  if (*(_QWORD *)a1)
  {
    if (v4 == (_QWORD *)1)
    {
      sub_10007886C((uint64_t)v52);
      sub_10002AACC((uint64_t)v52, (uint64_t)v58, &qword_1000B9D78);
      return sub_10002AACC((uint64_t)v58, a2, &qword_1000B9D78);
    }
    sub_10002D868((__n128 *)(a1 + 152), &v55);
    sub_10002D868(&v55, &v56);
    if (v57)
      v5 = 1;
    else
      v5 = 2;
    v49 = v5;
  }
  else
  {
    v49 = 0;
  }
  v6 = *(_QWORD *)(a1 + 8);
  v47 = *(_QWORD *)(a1 + 24);
  v48 = *(_QWORD *)(a1 + 16);
  v45 = *(_QWORD *)(a1 + 40);
  v42 = *(_QWORD *)(a1 + 64);
  v43 = *(_QWORD *)(a1 + 56);
  v40 = *(_QWORD *)(a1 + 80);
  v41 = *(_QWORD *)(a1 + 72);
  v53 = *(_OWORD *)(a1 + 88);
  v7 = *(_QWORD *)(a1 + 120);
  v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0)
    v8 = *(_QWORD *)(a1 + 112) & 0xFFFFFFFFFFFFLL;
  v9 = *(unsigned __int8 *)(a1 + 104);
  if (v8)
  {
    v46 = *(_QWORD *)(a1 + 112);
    v44 = *(_QWORD *)(a1 + 120);
    swift_bridgeObjectRetain(v7);
  }
  else
  {
    v46 = 0;
    v44 = 0;
  }
  v10 = _swiftEmptyArrayStorage;
  if ((unint64_t)v4 >= 2)
  {
    swift_bridgeObjectRetain(v4);
    v10 = v4;
  }
  v11 = v10[2];
  v50 = a2;
  if (v11)
  {
    v35 = v9;
    v36 = (unint64_t)v4;
    v38 = v6;
    v58[0] = _swiftEmptyArrayStorage;
    sub_10004FF54(0, v11, 0);
    v12 = (_QWORD *)v58[0];
    v34 = v10;
    v13 = (unsigned __int8 *)(v10 + 6);
    do
    {
      v14 = *((_QWORD *)v13 - 2);
      v15 = *((_QWORD *)v13 - 1);
      v16 = *v13;
      sub_100030508(v14, v15, *v13);
      v58[0] = v12;
      v18 = v12[2];
      v17 = v12[3];
      if (v18 >= v17 >> 1)
      {
        sub_10004FF54((char *)(v17 > 1), v18 + 1, 1);
        v12 = (_QWORD *)v58[0];
      }
      v12[2] = v18 + 1;
      v19 = &v12[3 * v18];
      *((_BYTE *)v19 + 32) = v16 >> 6;
      v13 += 24;
      v19[5] = v14;
      v19[6] = v15;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease(v34);
    v4 = (_QWORD *)v36;
    LOBYTE(v6) = v38;
    v9 = v35;
    if (v36 < 2)
      goto LABEL_22;
LABEL_24:
    swift_bridgeObjectRetain(v4);
    goto LABEL_25;
  }
  swift_bridgeObjectRelease(v10);
  v12 = _swiftEmptyArrayStorage;
  if ((unint64_t)v4 >= 2)
    goto LABEL_24;
LABEL_22:
  v4 = _swiftEmptyArrayStorage;
LABEL_25:
  v20 = sub_10005CF90((uint64_t)v4);
  v22 = v21;
  v24 = v23;
  v25 = v23;
  swift_bridgeObjectRelease(v4);
  if (v25 <= 0xFD)
    v26 = v24 >> 6;
  else
    v26 = 0;
  v39 = v26;
  if (v25 <= 0xFD)
    v27 = v20;
  else
    v27 = 0;
  v37 = v27;
  if (v25 <= 0xFD)
    v28 = v22;
  else
    v28 = 0;
  v54 = v53;
  v29 = v53 & 0xFFFFFFFFFFFFLL;
  if ((*((_QWORD *)&v53 + 1) & 0x2000000000000000) != 0)
    v29 = HIBYTE(*((_QWORD *)&v53 + 1)) & 0xFLL;
  if (v29)
  {
    v51 = v53;
    swift_bridgeObjectRetain(*((_QWORD *)&v53 + 1));
  }
  else
  {
    swift_bridgeObjectRetain(*((_QWORD *)&v53 + 1));
    sub_10005D218((_QWORD *)a1, (unint64_t *)&v51);
    sub_100030564((uint64_t)&v54);
  }
  v30 = v51;
  swift_bridgeObjectRetain(v47);
  swift_bridgeObjectRetain(v45);
  swift_bridgeObjectRetain(v42);
  v31 = swift_bridgeObjectRetain(v40);
  ArgumentInfoV0.init(kind:shouldDisplay:sectionTitle:isOptional:isRepeating:names:preferredName:valueName:defaultValue:allValues:abstract:discussion:)(v49, v9 == 0, v46, v44, v6 & 1, (v6 & 2) != 0, (uint64_t)v12, v39, (uint64_t)v52, v37, v28, v30, *((unint64_t *)&v30 + 1), v48, v47, v45, v43, v42, v41,
    v31);
  v32._countAndFlagsBits = (uint64_t)v52;
  String.init(argument:)(v32);
  sub_10002AACC((uint64_t)v52, (uint64_t)v58, &qword_1000B9D78);
  a2 = v50;
  return sub_10002AACC((uint64_t)v58, a2, &qword_1000B9D78);
}

uint64_t sub_100078848(uint64_t a1)
{
  unint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  v2 = v1 - 1;
  if (v2 < 0)
    v2 = -1;
  return (v2 + 1);
}

double sub_10007886C(uint64_t a1)
{
  double result;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 1;
  result = 0.0;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  return result;
}

_QWORD *sub_10007889C(uint64_t a1, uint64_t a2)
{
  int64_t v2;
  __int128 *v5;
  uint64_t v6;
  char isUniquelyReferenced_nonNull_native;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v19;
  _OWORD v20[5];
  uint64_t v21;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_10004FF1C(0, v2, 0);
    v5 = (__int128 *)(a1 + 32);
    do
    {
      v19 = *v5;
      v6 = swift_bridgeObjectRetain(a2);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v6);
      v8 = (char *)a2;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        v8 = sub_100057FEC(0, *(_QWORD *)(a2 + 16) + 1, 1, (char *)a2);
      v10 = *((_QWORD *)v8 + 2);
      v9 = *((_QWORD *)v8 + 3);
      if (v10 >= v9 >> 1)
        v8 = sub_100057FEC((char *)(v9 > 1), v10 + 1, 1, v8);
      *((_QWORD *)v8 + 2) = v10 + 1;
      *(_OWORD *)&v8[16 * v10 + 32] = v19;
      sub_100077CF4(v20, v8);
      v12 = _swiftEmptyArrayStorage[2];
      v11 = _swiftEmptyArrayStorage[3];
      if (v12 >= v11 >> 1)
        sub_10004FF1C((char *)(v11 > 1), v12 + 1, 1);
      _swiftEmptyArrayStorage[2] = v12 + 1;
      v13 = &_swiftEmptyArrayStorage[11 * v12];
      v14 = v20[1];
      *((_OWORD *)v13 + 2) = v20[0];
      *((_OWORD *)v13 + 3) = v14;
      v15 = v20[2];
      v16 = v20[3];
      v17 = v20[4];
      v13[14] = v21;
      *((_OWORD *)v13 + 5) = v16;
      *((_OWORD *)v13 + 6) = v17;
      *((_OWORD *)v13 + 4) = v15;
      ++v5;
      --v2;
    }
    while (v2);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t destroy for HelpCommand(uint64_t a1)
{
  sub_10004CB6C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  sub_100003C60(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 48));
}

uint64_t initializeWithCopy for HelpCommand(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_10006B81C(*(_QWORD *)a2, v5, v6);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_BYTE *)(a2 + 40);
  sub_100003B00(v7, v8, v9);
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_BYTE *)(a1 + 40) = v9;
  v10 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v10;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  swift_bridgeObjectRetain(v10);
  return a1;
}

uint64_t assignWithCopy for HelpCommand(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_10006B81C(*(_QWORD *)a2, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_10004CB6C(v7, v8, v9);
  v10 = *(_QWORD *)(a2 + 24);
  v11 = *(_QWORD *)(a2 + 32);
  v12 = *(_BYTE *)(a2 + 40);
  sub_100003B00(v10, v11, v12);
  v13 = *(_QWORD *)(a1 + 24);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_BYTE *)(a1 + 40);
  *(_QWORD *)(a1 + 24) = v10;
  *(_QWORD *)(a1 + 32) = v11;
  *(_BYTE *)(a1 + 40) = v12;
  sub_100003C60(v13, v14, v15);
  v16 = *(_QWORD *)(a2 + 48);
  v17 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t assignWithTake for HelpCommand(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v4 = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_10004CB6C(v5, v6, v7);
  v8 = *(_BYTE *)(a2 + 40);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_BYTE *)(a1 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = v8;
  sub_100003C60(v9, v10, v11);
  v12 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease(v12);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for HelpCommand(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 57))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HelpCommand(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 48) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 57) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HelpCommand()
{
  return &type metadata for HelpCommand;
}

uint64_t sub_100078CA4(uint64_t a1)
{
  _OWORD *v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  int64_t v15;
  unsigned __int8 *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t result;
  uint64_t v24;
  int64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  int64_t v33;
  __int128 *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _OWORD *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD *v57;

  v42 = *(_QWORD *)(a1 + 16);
  if (!v42)
    return (uint64_t)_swiftEmptyArrayStorage;
  v41 = a1 + 32;
  v1 = (_OWORD *)swift_bridgeObjectRetain(a1);
  v2 = 0;
  v3 = v1[11];
  v53 = v1[10];
  v54 = v3;
  v4 = v1[13];
  v55 = v1[12];
  v56 = v4;
  v5 = v1[7];
  v49 = v1[6];
  v50 = v5;
  v6 = v1[9];
  v51 = v1[8];
  v52 = v6;
  v7 = v1[3];
  v45 = v1[2];
  v46 = v7;
  v8 = v1[4];
  v9 = v1[5];
  v40 = v1;
  v10 = 1;
  v11 = _swiftEmptyArrayStorage;
  while (1)
  {
    v47 = v8;
    v48 = v9;
    v12 = v10;
    v13 = v45;
    v14 = (unint64_t)v45 >= 2 ? (_QWORD *)v45 : _swiftEmptyArrayStorage;
    v15 = v14[2];
    if (v15)
    {
      v44 = v10;
      v57 = v11;
      sub_10002D724((uint64_t)&v45);
      sub_10002D810(v13);
      sub_10004FF38(0, v15, 0);
      v43 = v14;
      v16 = (unsigned __int8 *)(v14 + 6);
      do
      {
        v17 = *((_QWORD *)v16 - 2);
        v18 = *((_QWORD *)v16 - 1);
        if ((*v16 & 0xC0) == 0x40)
          v19 = 64;
        else
          v19 = *v16;
        sub_100030508(*((_QWORD *)v16 - 2), *((_QWORD *)v16 - 1), *v16);
        v21 = _swiftEmptyArrayStorage[2];
        v20 = _swiftEmptyArrayStorage[3];
        if (v21 >= v20 >> 1)
          sub_10004FF38((_QWORD *)(v20 > 1), v21 + 1, 1);
        v16 += 24;
        _swiftEmptyArrayStorage[2] = v21 + 1;
        v22 = &_swiftEmptyArrayStorage[4 * v21];
        v22[4] = v17;
        v22[5] = v18;
        *((_BYTE *)v22 + 48) = v19;
        v22[7] = v2;
        --v15;
      }
      while (v15);
      swift_bridgeObjectRelease(v43);
      result = sub_10002D8A4((uint64_t)&v45);
      v11 = v57;
      v12 = v44;
    }
    else
    {
      sub_10002D810(v45);
      result = swift_bridgeObjectRelease(v14);
    }
    v24 = _swiftEmptyArrayStorage[2];
    v25 = v11[2];
    v26 = v25 + v24;
    if (__OFADD__(v25, v24))
      break;
    result = swift_isUniquelyReferenced_nonNull_native(v11);
    if ((result & 1) != 0 && v26 <= v11[3] >> 1)
    {
      if (_swiftEmptyArrayStorage[2])
        goto LABEL_20;
    }
    else
    {
      if (v25 <= v26)
        v33 = v25 + v24;
      else
        v33 = v25;
      result = (uint64_t)sub_100057CCC((_QWORD *)result, v33, 1, v11);
      v11 = (_QWORD *)result;
      if (_swiftEmptyArrayStorage[2])
      {
LABEL_20:
        v27 = v11[2];
        if ((v11[3] >> 1) - v27 < v24)
          goto LABEL_36;
        v28 = (uint64_t)&v11[4 * v27 + 4];
        v29 = sub_100005104(&qword_1000B96B0);
        result = swift_arrayInitWithCopy(v28, &_swiftEmptyArrayStorage[4], v24, v29);
        if (v24)
        {
          v30 = v11[2];
          v31 = __OFADD__(v30, v24);
          v32 = v30 + v24;
          if (v31)
            goto LABEL_37;
          v11[2] = v32;
        }
        goto LABEL_29;
      }
    }
    if (v24)
      goto LABEL_35;
LABEL_29:
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
    if (v12 == v42)
    {
      swift_bridgeObjectRelease(v40);
      return (uint64_t)v11;
    }
    v34 = (__int128 *)(v41 + 192 * v12);
    v35 = v34[9];
    v53 = v34[8];
    v54 = v35;
    v36 = v34[11];
    v55 = v34[10];
    v56 = v36;
    v37 = v34[5];
    v49 = v34[4];
    v50 = v37;
    v38 = v34[7];
    v51 = v34[6];
    v52 = v38;
    v39 = v34[1];
    v45 = *v34;
    v46 = v39;
    v8 = v34[2];
    v9 = v34[3];
    v10 = v12 + 1;
    v2 = v12;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100078F80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  char v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  char v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  char v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;

  if (*(_QWORD *)(a6 + 16))
  {
    *(_QWORD *)&v45 = a6;
    *((_QWORD *)&v45 + 1) = sub_10007A76C;
    v46 = 0;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a3);
    sub_100037ACC(a4);
    swift_bridgeObjectRetain(a6);
    sub_100037B40(a7, a8, a9);
    v16 = sub_100005104(&qword_1000B9D90);
    v17 = sub_10007A928();
    v18 = BidirectionalCollection<>.joined(separator:)(8236, 0xE200000000000000, v16, v17);
    v20 = v19;
  }
  else
  {
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a3);
    sub_100037ACC(a4);
    swift_bridgeObjectRetain(a6);
    sub_100037B40(a7, a8, a9);
    v18 = 0;
    v20 = 0;
  }
  if (a9 == 255)
    v21 = 0;
  else
    v21 = a7;
  if (a9 == 255)
    v22 = 0;
  else
    v22 = a8;
  v40 = v22;
  v41 = v21;
  if (a9 == 255)
    v23 = 4;
  else
    v23 = a9;
  v39 = v23;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a3);
  sub_100037B40(a7, a8, a9);
  sub_10005EC6C((uint64_t)_swiftEmptyArrayStorage, 3, (uint64_t)a4, v18, v20, a1, a2, a3, (uint64_t)&v45, 0);
  v31 = v45;
  v24 = v46;
  v38 = v48;
  v36 = v50;
  v37 = v49;
  v25 = v51;
  v35 = v52;
  v34 = v53;
  v32 = v55;
  v33 = v54;
  v26 = (_QWORD *)swift_allocObject(&unk_1000B3C20, 56, 7);
  v26[2] = sub_100069EBC;
  v26[3] = 0;
  v26[4] = a1;
  v26[5] = a2;
  v26[6] = a3;
  v43 = a6;
  v27 = (_QWORD *)swift_allocObject(&unk_1000B3C48, 56, 7);
  v27[2] = 0;
  sub_10002AACC((uint64_t)&v43, (uint64_t)(v27 + 3), &qword_1000B9DA0);
  v27[4] = a1;
  v27[5] = a2;
  v27[6] = a3;
  v44 = 1;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a3);
  sub_10006C0F8(a7, a8, a9);
  v28 = sub_100005104(&qword_1000B9230);
  v29 = swift_allocObject(v28, 224, 7);
  *(_OWORD *)(v29 + 16) = xmmword_100096510;
  *(_QWORD *)(v29 + 32) = 0;
  *(_OWORD *)(v29 + 40) = v31;
  *(_QWORD *)(v29 + 56) = v24;
  *(_OWORD *)(v29 + 64) = v47;
  *(_BYTE *)(v29 + 80) = v38;
  *(_OWORD *)(v29 + 88) = v37;
  *(_OWORD *)(v29 + 104) = v36;
  *(_QWORD *)(v29 + 120) = v25;
  *(_QWORD *)(v29 + 128) = v35;
  *(_BYTE *)(v29 + 136) = v34;
  *(_QWORD *)(v29 + 144) = v33;
  *(_QWORD *)(v29 + 152) = v32;
  *(_QWORD *)(v29 + 160) = v41;
  *(_QWORD *)(v29 + 168) = v40;
  *(_BYTE *)(v29 + 176) = v39;
  *(_BYTE *)(v29 + 177) = a5;
  *(_QWORD *)(v29 + 184) = sub_10007A9C0;
  *(_QWORD *)(v29 + 192) = v26;
  *(_BYTE *)(v29 + 200) = v44;
  *(_QWORD *)(v29 + 208) = sub_10007AA34;
  *(_QWORD *)(v29 + 216) = v27;
  return sub_100079288(v29);
}

uint64_t sub_100079288(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v8;

  v2 = sub_100079598((uint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease(v2);
  v3 = swift_bridgeObjectRetain(a1);
  v4 = sub_100078CA4(v3);
  swift_bridgeObjectRelease(a1);
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    sub_100005104(qword_1000B9608);
    v6 = (void *)static _DictionaryStorage.allocate(capacity:)(v5);
  }
  else
  {
    v6 = &_swiftEmptyDictionarySingleton;
  }
  v8 = v6;
  sub_10007AA54(v4, 1, &v8);
  swift_bridgeObjectRelease(v4);
  return a1;
}

_QWORD *sub_100079344(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, void (*a6)(_QWORD **))
{
  uint64_t *v6;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  __int128 v27;
  _OWORD v28[2];
  __int128 v29;
  char v30;

  v13 = *v6;
  if (*(_QWORD *)(v13 + 16))
  {
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a3);
    v14 = sub_100058C68(a1, a2, a3);
    if ((v15 & 1) != 0)
    {
      sub_10005BD20(*(_QWORD *)(v13 + 56) + 72 * v14, (uint64_t)&v22);
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(a2);
      if (*((_QWORD *)&v22 + 1))
      {
        v28[1] = v24;
        v29 = v25;
        v30 = v26;
        v27 = v22;
        v28[0] = v23;
        goto LABEL_8;
      }
    }
    else
    {
      v26 = 0;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(a2);
    }
  }
  else
  {
    v26 = 0;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
  }
  v16 = sub_100005104(&qword_1000B90C8);
  *(_QWORD *)&v27 = a1;
  *((_QWORD *)&v27 + 1) = a2;
  *(_QWORD *)&v28[0] = a3;
  *((_QWORD *)&v28[0] + 1) = a5;
  *(_QWORD *)&v29 = v16;
  *((_QWORD *)&v29 + 1) = &_swiftEmptySetSingleton;
  v30 = 1;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(a5);
  sub_10004E740((uint64_t)&v22, &qword_1000B9888);
LABEL_8:
  sub_10005BCDC((uint64_t)v28 + 8, (uint64_t)&v22, &qword_1000B9360);
  if (*((_QWORD *)&v23 + 1))
  {
    v17 = sub_100005104(&qword_1000B90C8);
    if ((swift_dynamicCast(&v21, &v22, (char *)&type metadata for Any + 8, v17, 6) & 1) != 0)
    {
      a5 = v21;
      goto LABEL_13;
    }
  }
  else
  {
    sub_10004E740((uint64_t)&v22, &qword_1000B9360);
  }
  v21 = a5;
  swift_bridgeObjectRetain(a5);
LABEL_13:
  if (v30 == 1)
  {
    swift_bridgeObjectRelease(a5);
    v21 = _swiftEmptyArrayStorage;
    v30 = 0;
  }
  a6(&v21);
  v18 = v21;
  *((_QWORD *)&v23 + 1) = sub_100005104(&qword_1000B90C8);
  *(_QWORD *)&v22 = v18;
  sub_1000671BC((uint64_t)&v22, (uint64_t)v28 + 8);
  v19 = swift_bridgeObjectRetain(a4);
  sub_10005750C(v19);
  sub_10007029C((uint64_t *)&v27);
  return sub_10003D920(&v27);
}

unint64_t sub_100079598(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t result;
  char v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;

  v1 = a1;
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005104(qword_1000B9608);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(v1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(v1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v17 = v1;
  v6 = (_QWORD *)(v1 + 56);
  while (1)
  {
    v7 = *(v6 - 3);
    v8 = *(v6 - 2);
    v9 = *((unsigned __int8 *)v6 - 8);
    v10 = *v6;
    sub_100030508(v7, v8, *((_BYTE *)v6 - 8));
    result = sub_100058B9C(v7, v8, v9);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = v4[6] + 24 * result;
    *(_QWORD *)v13 = v7;
    *(_QWORD *)(v13 + 8) = v8;
    *(_BYTE *)(v13 + 16) = v9;
    *(_QWORD *)(v4[7] + 8 * result) = v10;
    v14 = v4[2];
    v15 = __OFADD__(v14, 1);
    v16 = v14 + 1;
    if (v15)
      goto LABEL_11;
    v6 += 4;
    v4[2] = v16;
    if (!--v5)
    {
      swift_release(v4);
      v1 = v17;
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1000796D0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v20 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v20);
    return (unint64_t)v4;
  }
  sub_100005104(&qword_1000B9D28);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
    goto LABEL_9;
  v6 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_10005BCDC(v6, (uint64_t)&v21, &qword_1000B9DD0);
    v7 = v21;
    v8 = v22;
    v9 = v23;
    result = sub_100058C68(v21, v22, v23);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 24 * result);
    *v12 = v7;
    v12[1] = v8;
    v12[2] = (uint64_t)v9;
    v13 = v4[7] + 72 * result;
    *(_OWORD *)v13 = v24;
    v14 = v25;
    v15 = v26;
    v16 = v27;
    *(_BYTE *)(v13 + 64) = v28;
    *(_OWORD *)(v13 + 32) = v15;
    *(_OWORD *)(v13 + 48) = v16;
    *(_OWORD *)(v13 + 16) = v14;
    v17 = v4[2];
    v18 = __OFADD__(v17, 1);
    v19 = v17 + 1;
    if (v18)
      goto LABEL_12;
    v4[2] = v19;
    v6 += 96;
    if (!--v5)
    {
      swift_release(v4);
      v20 = a1;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_100079838(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t result;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = sub_100005104(&qword_1000B9DC0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v23 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v23);
    return (unint64_t)v8;
  }
  sub_100005104(&qword_1000B9DC8);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_9;
  v10 = &v5[*(int *)(v2 + 48)];
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25 = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_10005BCDC(v13, (uint64_t)v5, &qword_1000B9DC0);
    result = sub_100058CE0((uint64_t)v5);
    if ((v16 & 1) != 0)
      break;
    v17 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v18 = v8[6];
    v19 = type metadata accessor for CodingUserInfoKey(0);
    (*(void (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v17, v5, v19);
    result = (unint64_t)sub_10005BD5C(v10, (_OWORD *)(v8[7] + 32 * v17));
    v20 = v8[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
      goto LABEL_12;
    v8[2] = v22;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      v23 = v25;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_1000799D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005104(&qword_1000B9D38);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v7 = *(v6 - 2);
    v8 = *(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    result = sub_100023BB8(v7, v8);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v7;
    v12[1] = v8;
    *(_QWORD *)(v4[7] + 8 * result) = v9;
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v6 += 3;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

_QWORD *sub_100079AEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _QWORD *(*a8)(_QWORD *__return_ptr, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a9, uint64_t a10, uint64_t a11, _QWORD *a12)
{
  uint64_t v12;
  _QWORD *result;
  uint64_t v15;
  _QWORD v16[2];

  result = a8(v16, a10, a11, a12, a1, a2, a3, a4, a5, a6);
  if (!v12)
  {
    v15 = v16[1];
    __chkstk_darwin(result);
    sub_100079344(a10, a11, a12, a1, _swiftEmptyArrayStorage, (void (*)(_QWORD **))sub_10007AD10);
    return (_QWORD *)swift_bridgeObjectRelease(v15);
  }
  return result;
}

_QWORD *sub_100079BE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _QWORD *(*a8)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  _QWORD *result;
  uint64_t v15;
  uint64_t v16[3];
  _QWORD v17[5];
  char v18;
  _QWORD v19[4];
  uint64_t v20;
  uint64_t v21;

  result = a8(&v20, a10, a11, a12, a1, a2, a3, a4, a5, a6);
  if (!v12)
  {
    v15 = v21;
    v19[3] = &type metadata for String;
    v19[0] = v20;
    v19[1] = v21;
    sub_10005BCDC((uint64_t)v19, (uint64_t)v17, &qword_1000B9360);
    v16[0] = a10;
    v16[1] = a11;
    v16[2] = a12;
    v17[4] = a1;
    v18 = 1;
    swift_bridgeObjectRetain(v15);
    swift_bridgeObjectRetain(a11);
    swift_bridgeObjectRetain(a12);
    swift_bridgeObjectRetain(a1);
    sub_10007029C(v16);
    sub_10003D920(v16);
    sub_10004E740((uint64_t)v19, &qword_1000B9360);
    return (_QWORD *)swift_bridgeObjectRelease(v15);
  }
  return result;
}

_QWORD *sub_100079D00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _QWORD *(*a8)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  _QWORD *result;
  uint64_t v15[3];
  _QWORD v16[5];
  char v17;
  _QWORD v18[4];
  _QWORD v19[4];

  result = a8(v19, a10, a11, a12, a1, a2, a3, a4, a5, a6);
  if (!v12)
  {
    v18[3] = (char *)&type metadata for Any + 8;
    v18[0] = swift_allocObject(&unk_1000B3C70, 48, 7);
    sub_10004E704((uint64_t)v19, v18[0] + 16);
    sub_10005BCDC((uint64_t)v18, (uint64_t)v16, &qword_1000B9360);
    v15[0] = a10;
    v15[1] = a11;
    v15[2] = a12;
    v16[4] = a1;
    v17 = 1;
    swift_bridgeObjectRetain(a11);
    swift_bridgeObjectRetain(a12);
    swift_bridgeObjectRetain(a1);
    sub_10007029C(v15);
    sub_10003D920(v15);
    sub_10004E740((uint64_t)v18, &qword_1000B9360);
    return (_QWORD *)sub_1000062D8(v19);
  }
  return result;
}

uint64_t sub_100079E2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v13[3];
  _QWORD v14[5];
  char v15;
  __int128 v16;
  __int128 v17;

  if (a3 != 1)
  {
    v11 = a1;
    swift_bridgeObjectRetain(a1);
    if (a4)
      goto LABEL_3;
LABEL_5:
    v16 = 0u;
    v17 = 0u;
    goto LABEL_6;
  }
  v11 = sub_10006D354((uint64_t)&off_1000AFD98);
  if (!a4)
    goto LABEL_5;
LABEL_3:
  *((_QWORD *)&v17 + 1) = sub_100005104(&qword_1000B90C8);
  *(_QWORD *)&v16 = a4;
LABEL_6:
  sub_10005BCDC((uint64_t)&v16, (uint64_t)v14, &qword_1000B9360);
  v13[0] = a5;
  v13[1] = a6;
  v13[2] = a7;
  v14[4] = v11;
  v15 = 1;
  swift_bridgeObjectRetain(a4);
  swift_bridgeObjectRetain(a6);
  swift_bridgeObjectRetain(a7);
  swift_bridgeObjectRetain(v11);
  sub_10007029C(v13);
  sub_10003D920(v13);
  swift_bridgeObjectRelease(v11);
  return sub_10004E740((uint64_t)&v16, &qword_1000B9360);
}

uint64_t sub_100079F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  uint64_t v15[3];
  _QWORD v16[5];
  char v17;
  __int128 v18;
  __int128 v19;

  if (a3 != 1)
  {
    v13 = a1;
    swift_bridgeObjectRetain(a1);
    if (a5)
      goto LABEL_3;
LABEL_5:
    v18 = 0u;
    v19 = 0u;
    goto LABEL_6;
  }
  v13 = sub_10006D354((uint64_t)&off_1000AFDD0);
  if (!a5)
    goto LABEL_5;
LABEL_3:
  *((_QWORD *)&v19 + 1) = &type metadata for String;
  *(_QWORD *)&v18 = a4;
  *((_QWORD *)&v18 + 1) = a5;
LABEL_6:
  sub_10005BCDC((uint64_t)&v18, (uint64_t)v16, &qword_1000B9360);
  v15[0] = a6;
  v15[1] = a7;
  v15[2] = a8;
  v16[4] = v13;
  v17 = 1;
  swift_bridgeObjectRetain(a5);
  swift_bridgeObjectRetain(a7);
  swift_bridgeObjectRetain(a8);
  swift_bridgeObjectRetain(v13);
  sub_10007029C(v15);
  sub_10003D920(v15);
  swift_bridgeObjectRelease(v13);
  return sub_10004E740((uint64_t)&v18, &qword_1000B9360);
}

uint64_t sub_10007A04C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  __int128 v13;
  uint64_t v14;
  _QWORD v15[5];
  char v16;
  __int128 v17;
  __int128 v18;

  if (a3 == 1)
  {
    v11 = sub_10006D354((uint64_t)&off_1000AFE08);
  }
  else
  {
    v11 = a1;
    swift_bridgeObjectRetain(a1);
  }
  sub_10005BCDC(a4, (uint64_t)&v13, &qword_1000B9360);
  if (v15[0])
  {
    *((_QWORD *)&v18 + 1) = (char *)&type metadata for Any + 8;
    *(_QWORD *)&v17 = swift_allocObject(&unk_1000B3C70, 48, 7);
    sub_10005BD5C(&v13, (_OWORD *)(v17 + 16));
  }
  else
  {
    sub_10004E740((uint64_t)&v13, &qword_1000B9360);
    v17 = 0u;
    v18 = 0u;
  }
  sub_10005BCDC((uint64_t)&v17, (uint64_t)v15, &qword_1000B9360);
  *(_QWORD *)&v13 = a5;
  *((_QWORD *)&v13 + 1) = a6;
  v14 = a7;
  v15[4] = v11;
  v16 = 1;
  swift_bridgeObjectRetain(a6);
  swift_bridgeObjectRetain(a7);
  swift_bridgeObjectRetain(v11);
  sub_10007029C((uint64_t *)&v13);
  sub_10003D920(&v13);
  swift_bridgeObjectRelease(v11);
  return sub_10004E740((uint64_t)&v17, &qword_1000B9360);
}

char *sub_10007A19C(char **a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  char *result;
  unint64_t v8;
  unint64_t v9;
  char *v10;

  v6 = *a1;
  swift_bridgeObjectRetain(a3);
  result = (char *)swift_isUniquelyReferenced_nonNull_native(v6);
  if ((result & 1) == 0)
  {
    result = sub_100057AB8(0, *((_QWORD *)v6 + 2) + 1, 1, v6);
    v6 = result;
  }
  v9 = *((_QWORD *)v6 + 2);
  v8 = *((_QWORD *)v6 + 3);
  if (v9 >= v8 >> 1)
  {
    result = sub_100057AB8((char *)(v8 > 1), v9 + 1, 1, v6);
    v6 = result;
  }
  *((_QWORD *)v6 + 2) = v9 + 1;
  v10 = &v6[16 * v9];
  *((_QWORD *)v10 + 4) = a2;
  *((_QWORD *)v10 + 5) = a3;
  *a1 = v6;
  return result;
}

double sub_10007A248()
{
  uint64_t v0;
  double result;

  v0 = sub_10003F288((uint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease(&_swiftEmptySetSingleton);
  *(_QWORD *)&result = 1886152040;
  xmmword_1000BA560 = xmmword_100097E50;
  qword_1000BA570 = 0;
  unk_1000BA578 = 0;
  *(_QWORD *)&xmmword_1000BA580 = 0xD000000000000021;
  *((_QWORD *)&xmmword_1000BA580 + 1) = 0x800000010009DBB0;
  qword_1000BA590 = 0;
  unk_1000BA598 = 0;
  *(_QWORD *)&xmmword_1000BA5A0 = 0;
  *((_QWORD *)&xmmword_1000BA5A0 + 1) = 0xE000000000000000;
  qword_1000BA5B0 = 0;
  unk_1000BA5B8 = 0xE000000000000000;
  LOBYTE(xmmword_1000BA5C0) = 1;
  *((_QWORD *)&xmmword_1000BA5C0 + 1) = _swiftEmptyArrayStorage;
  unk_1000BA5D0 = 0;
  qword_1000BA5D8 = 0;
  qword_1000BA5E0 = v0;
  return result;
}

uint64_t (*sub_10007A2F4(char a1))(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v2;
  uint64_t v3;
  _OWORD v5[2];
  uint64_t v6;
  uint64_t v7;
  char v8;

  v2 = sub_10003F288((uint64_t)&off_1000AFA80);
  swift_bridgeObjectRelease(&_swiftEmptySetSingleton);
  swift_arrayDestroy(&unk_1000AFAA0, 3, &type metadata for NameSpecification.Element);
  v5[0] = xmmword_100097E30;
  v5[1] = xmmword_100097E30;
  v6 = 0;
  v7 = 0;
  v8 = 2;
  v3 = swift_allocObject(&unk_1000B3BF8, 81, 7);
  *(_QWORD *)(v3 + 16) = v2;
  *(_BYTE *)(v3 + 24) = a1;
  sub_10002AACC((uint64_t)v5, v3 + 32, &qword_1000B9158);
  return sub_1000398D4;
}

uint64_t sub_10007A3C0()
{
  _BYTE *v0;

  if (*v0)
    return 1886152040;
  else
    return 0x616D6D6F63627573;
}

uint64_t sub_10007A3FC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10007AD1C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10007A420(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10007B018();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10007A448(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10007B018();
  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_10007A470@<Q0>(uint64_t a1@<X8>)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __n128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  if (qword_1000B90B8 != -1)
    swift_once(&qword_1000B90B8, sub_10007A248);
  v12 = xmmword_1000BA5C0;
  v13 = unk_1000BA5D0;
  v14 = qword_1000BA5E0;
  v8 = xmmword_1000BA580;
  v9 = *(_OWORD *)&qword_1000BA590;
  v10 = xmmword_1000BA5A0;
  v11 = *(_OWORD *)&qword_1000BA5B0;
  v6 = xmmword_1000BA560;
  v7 = *(__n128 *)&qword_1000BA570;
  sub_10007A7CC(&v6);
  v2 = v13;
  *(_OWORD *)(a1 + 96) = v12;
  *(_OWORD *)(a1 + 112) = v2;
  *(_QWORD *)(a1 + 128) = v14;
  v3 = v9;
  *(_OWORD *)(a1 + 32) = v8;
  *(_OWORD *)(a1 + 48) = v3;
  v4 = v11;
  *(_OWORD *)(a1 + 64) = v10;
  *(_OWORD *)(a1 + 80) = v4;
  result = v7;
  *(_OWORD *)a1 = v6;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t sub_10007A51C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(unsigned __int8 *)(v0 + 56);
  v3 = sub_10005134C();
  swift_allocError(&type metadata for CommandError, v3, 0, 0);
  *(_QWORD *)v4 = v1;
  *(_QWORD *)(v4 + 8) = v2;
  *(_OWORD *)(v4 + 16) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  *(_OWORD *)(v4 + 73) = 0u;
  v5 = swift_bridgeObjectRetain(v1);
  return swift_willThrow(v5);
}

uint64_t (*sub_10007A58C@<X0>(uint64_t a1@<X8>))(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v2;
  uint64_t (*result)(uint64_t, unint64_t, uint64_t);
  uint64_t v4;
  _OWORD v5[3];
  char v6;

  v6 = 0;
  memset(v5, 0, sizeof(v5));
  v2 = swift_allocObject(&unk_1000B3BD0, 97, 7);
  sub_10002AACC((uint64_t)v5, v2 + 16, &qword_1000B9158);
  *(_BYTE *)(v2 + 65) = 0;
  *(_QWORD *)(v2 + 80) = 0;
  *(_QWORD *)(v2 + 88) = 0;
  *(_QWORD *)(v2 + 72) = _swiftEmptyArrayStorage;
  *(_BYTE *)(v2 + 96) = -1;
  result = sub_10007A2F4(0);
  *(_QWORD *)a1 = sub_10007A8B4;
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = sub_1000398D4;
  *(_QWORD *)(a1 + 32) = v4;
  *(_BYTE *)(a1 + 40) = 1;
  *(_QWORD *)(a1 + 48) = _swiftEmptyArrayStorage;
  *(_BYTE *)(a1 + 56) = 0;
  return result;
}

double sub_10007A644@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  _OWORD v7[2];

  sub_10007AE14(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    a2[2] = v7[0];
    result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 41) = *(_OWORD *)((char *)v7 + 9);
  }
  return result;
}

unint64_t sub_10007A68C(uint64_t a1)
{
  unint64_t result;

  result = sub_10007A6B0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10007A6B0()
{
  unint64_t result;

  result = qword_1000B9D80;
  if (!qword_1000B9D80)
  {
    result = swift_getWitnessTable(&unk_10009AACC, &type metadata for HelpCommand);
    atomic_store(result, (unint64_t *)&qword_1000B9D80);
  }
  return result;
}

unint64_t sub_10007A6F4(uint64_t a1)
{
  unint64_t result;

  result = sub_10007A718();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10007A718()
{
  unint64_t result;

  result = qword_1000B9D88;
  if (!qword_1000B9D88)
  {
    result = swift_getWitnessTable(&unk_10009AAF4, &type metadata for HelpCommand);
    atomic_store(result, (unint64_t *)&qword_1000B9D88);
  }
  return result;
}

uint64_t sub_10007A75C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 16) = a2;
  *(_QWORD *)(result + 24) = 2 * a2;
  return result;
}

uint64_t sub_10007A76C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  unint64_t v6;
  _QWORD v7[2];
  uint64_t v8;
  unint64_t v9;

  v3 = *a1;
  v4 = a1[1];
  v8 = 0;
  v9 = 0xE000000000000000;
  v7[0] = v3;
  v7[1] = v4;
  result = _print_unlocked<A, B>(_:_:)(v7, &v8, &type metadata for String, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v6 = v9;
  *a2 = v8;
  a2[1] = v6;
  return result;
}

_QWORD *sub_10007A7CC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a1[1];
  v3 = a1[3];
  v4 = a1[5];
  v5 = a1[7];
  v6 = a1[9];
  v7 = a1[11];
  v8 = a1[13];
  swift_bridgeObjectRetain(a1[16]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  return a1;
}

uint64_t sub_10007A860()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(v0 + 24);
  if (v1)
  {
    swift_bridgeObjectRelease(v1);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 56));
  }
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 72));
  v2 = *(unsigned __int8 *)(v0 + 96);
  if (v2 != 255)
    sub_10002D9A0(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88), v2);
  return swift_deallocObject(v0, 97, 7);
}

uint64_t sub_10007A8B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_100078F80(a1, a2, a3, (uint64_t *)(v3 + 16), *(_BYTE *)(v3 + 65), *(_QWORD *)(v3 + 72), *(_QWORD *)(v3 + 80), *(_QWORD *)(v3 + 88), *(_BYTE *)(v3 + 96));
}

uint64_t sub_10007A8E8()
{
  _QWORD *v0;
  uint64_t v1;

  swift_bridgeObjectRelease(v0[2]);
  v1 = v0[5];
  if (v1)
  {
    swift_bridgeObjectRelease(v1);
    swift_bridgeObjectRelease(v0[7]);
    swift_bridgeObjectRelease(v0[9]);
  }
  return swift_deallocObject(v0, 81, 7);
}

unint64_t sub_10007A928()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000B9D98;
  if (!qword_1000B9D98)
  {
    v1 = sub_10000593C(&qword_1000B9D90);
    sub_10005EC18();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> LazyMapSequence<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000B9D98);
  }
  return result;
}

uint64_t sub_10007A98C()
{
  _QWORD *v0;

  swift_release(v0[3]);
  swift_bridgeObjectRelease(v0[5]);
  swift_bridgeObjectRelease(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

_QWORD *sub_10007A9C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  return sub_100079AEC(a1, a2, a3, a4, a5, a6, a7, *(_QWORD *(**)(_QWORD *__return_ptr, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16), *(_QWORD *)(v7 + 24), *(_QWORD *)(v7 + 32), *(_QWORD *)(v7 + 40), *(_QWORD **)(v7 + 48));
}

uint64_t sub_10007A9F0()
{
  _QWORD *v0;
  unint64_t v1;

  v1 = v0[2];
  if (v1 >= 2)
    swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(v0[3]);
  swift_bridgeObjectRelease(v0[5]);
  swift_bridgeObjectRelease(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10007AA34(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_100079E2C(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t sub_10007AA54(uint64_t result, char a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  char v14;
  char v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *i;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  _QWORD *v31;
  char v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  char v36;
  char v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  if (*(_QWORD *)(result + 16))
  {
    v5 = result;
    v43 = *(_QWORD *)(result + 16);
    v7 = *(_QWORD *)(result + 32);
    v6 = *(_QWORD *)(result + 40);
    v8 = *(unsigned __int8 *)(result + 48);
    v42 = *(_QWORD *)(result + 56);
    v9 = (_QWORD *)*a3;
    sub_100030508(v7, v6, v8);
    v11 = sub_100058B9C(v7, v6, v8);
    v12 = v9[2];
    v13 = (v10 & 1) == 0;
    result = v12 + v13;
    if (__OFADD__(v12, v13))
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v14 = v10;
    if (v9[3] < result)
    {
      sub_100070B58(result, a2 & 1);
      result = sub_100058B9C(v7, v6, v8);
      if ((v14 & 1) != (v15 & 1))
      {
LABEL_26:
        result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for Name);
        __break(1u);
        return result;
      }
      v11 = result;
      v16 = (_QWORD *)*a3;
      if ((v14 & 1) == 0)
        goto LABEL_11;
LABEL_9:
      v17 = 8 * v11;
      v18 = *(_QWORD *)(v16[7] + 8 * v11);
      result = sub_10002DA24(v7, v6, v8);
      *(_QWORD *)(v16[7] + v17) = v18;
LABEL_13:
      v23 = v43 - 1;
      if (v43 == 1)
        return result;
      for (i = (_QWORD *)(v5 + 88); ; i += 4)
      {
        v28 = *(i - 3);
        v27 = *(i - 2);
        v29 = *((unsigned __int8 *)i - 8);
        v30 = *i;
        v31 = (_QWORD *)*a3;
        sub_100030508(v28, v27, *((_BYTE *)i - 8));
        result = sub_100058B9C(v28, v27, v29);
        v33 = v31[2];
        v34 = (v32 & 1) == 0;
        v21 = __OFADD__(v33, v34);
        v35 = v33 + v34;
        if (v21)
          break;
        v36 = v32;
        if (v31[3] < v35)
        {
          sub_100070B58(v35, 1);
          result = sub_100058B9C(v28, v27, v29);
          if ((v36 & 1) != (v37 & 1))
            goto LABEL_26;
        }
        v38 = (_QWORD *)*a3;
        if ((v36 & 1) != 0)
        {
          v25 = 8 * result;
          v26 = *(_QWORD *)(v38[7] + 8 * result);
          result = sub_10002DA24(v28, v27, v29);
          *(_QWORD *)(v38[7] + v25) = v26;
        }
        else
        {
          v38[((unint64_t)result >> 6) + 8] |= 1 << result;
          v39 = v38[6] + 24 * result;
          *(_QWORD *)v39 = v28;
          *(_QWORD *)(v39 + 8) = v27;
          *(_BYTE *)(v39 + 16) = v29;
          *(_QWORD *)(v38[7] + 8 * result) = v30;
          v40 = v38[2];
          v21 = __OFADD__(v40, 1);
          v41 = v40 + 1;
          if (v21)
            goto LABEL_25;
          v38[2] = v41;
        }
        if (!--v23)
          return result;
      }
      goto LABEL_24;
    }
    if ((a2 & 1) != 0)
    {
      v16 = (_QWORD *)*a3;
      if ((v10 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      result = (uint64_t)sub_10007044C();
      v16 = (_QWORD *)*a3;
      if ((v14 & 1) != 0)
        goto LABEL_9;
    }
LABEL_11:
    v16[(v11 >> 6) + 8] |= 1 << v11;
    v19 = v16[6] + 24 * v11;
    *(_QWORD *)v19 = v7;
    *(_QWORD *)(v19 + 8) = v6;
    *(_BYTE *)(v19 + 16) = v8;
    *(_QWORD *)(v16[7] + 8 * v11) = v42;
    v20 = v16[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    v16[2] = v22;
    goto LABEL_13;
  }
  return result;
}

char *sub_10007AD10(char **a1)
{
  uint64_t v1;

  return sub_10007A19C(a1, **(_QWORD **)(v1 + 16), *(_QWORD *)(*(_QWORD *)(v1 + 16) + 8));
}

uint64_t sub_10007AD1C(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  char v7;

  if (a1 == 0x616D6D6F63627573 && a2 == 0xEB0000000073646ELL)
  {
    v5 = 0xEB0000000073646ELL;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x616D6D6F63627573, 0xEB0000000073646ELL, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 1886152040 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease(0xE400000000000000);
    return 1;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(1886152040, 0xE400000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_10007AE14@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;

  v20 = a2;
  v4 = sub_100005104(&qword_1000B9DA8);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10007A2F4(0);
  v9 = v8;
  v10 = a1[3];
  v11 = a1[4];
  sub_100006270(a1, v10);
  v12 = sub_10007B018();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for HelpCommand.CodingKeys, &type metadata for HelpCommand.CodingKeys, v12, v10, v11);
  if (v2)
  {
    sub_100003C60((uint64_t)sub_1000398D4, v9, 1);
    return sub_1000062D8(a1);
  }
  else
  {
    v13 = v5;
    v14 = v9;
    v15 = v20;
    v16 = sub_100005104(&qword_1000B90C8);
    v22 = 0;
    v17 = sub_10007B05C();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v23, v16, &v22, v4, v16, v17);
    v18 = v23;
    v21 = 1;
    LOBYTE(v16) = KeyedDecodingContainer.decode(_:forKey:)(&v21, v4);
    sub_100003C60((uint64_t)sub_1000398D4, v14, 1);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v7, v4);
    result = sub_1000062D8(a1);
    *(_QWORD *)v15 = v18;
    *(_QWORD *)(v15 + 8) = 0;
    *(_BYTE *)(v15 + 16) = 0;
    *(_QWORD *)(v15 + 24) = v16 & 1;
    *(_QWORD *)(v15 + 32) = 0;
    *(_BYTE *)(v15 + 40) = 0;
    *(_QWORD *)(v15 + 48) = _swiftEmptyArrayStorage;
    *(_BYTE *)(v15 + 56) = 0;
  }
  return result;
}

unint64_t sub_10007B018()
{
  unint64_t result;

  result = qword_1000B9DB0;
  if (!qword_1000B9DB0)
  {
    result = swift_getWitnessTable(&unk_10009ABF0, &type metadata for HelpCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9DB0);
  }
  return result;
}

unint64_t sub_10007B05C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000B9DB8;
  if (!qword_1000B9DB8)
  {
    v1 = sub_10000593C(&qword_1000B90C8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000B9DB8);
  }
  return result;
}

uint64_t sub_10007B0B8@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t result;
  uint64_t v16;
  char v17;

  sub_10007A2F4(0);
  v7 = *(_QWORD *)(a1 + 16);
  if (v7)
  {
    v16 = v6;
    v17 = a2;
    swift_bridgeObjectRetain(a1);
    sub_10004FDF4(0, v7, 0);
    v8 = a1 + 40;
    do
    {
      v9 = (*(uint64_t (**)(void))(*(_QWORD *)v8 + 24))();
      v11 = v10;
      v13 = _swiftEmptyArrayStorage[2];
      v12 = _swiftEmptyArrayStorage[3];
      if (v13 >= v12 >> 1)
        sub_10004FDF4((char *)(v12 > 1), v13 + 1, 1);
      _swiftEmptyArrayStorage[2] = v13 + 1;
      v14 = &_swiftEmptyArrayStorage[2 * v13];
      v14[4] = v9;
      v14[5] = v11;
      v8 += 16;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease(a1);
    result = sub_100003C60((uint64_t)sub_1000398D4, v16, 1);
    a2 = v17;
  }
  else
  {
    result = sub_100003C60((uint64_t)sub_1000398D4, v6, 1);
  }
  *(_QWORD *)a3 = _swiftEmptyArrayStorage;
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 32) = 0;
  *(_BYTE *)(a3 + 40) = 0;
  *(_QWORD *)(a3 + 48) = a1;
  *(_BYTE *)(a3 + 56) = a2;
  return result;
}

unint64_t sub_10007B208(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  unint64_t result;
  char v5;
  __int128 *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  __int128 v12;
  char v13;
  __int128 v14;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  sub_100005104(&qword_1000B9D30);
  v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v1);
  v14 = *(_OWORD *)(a1 + 32);
  result = sub_100058D30(*(_QWORD *)(a1 + 32));
  if ((v5 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain(result);
    swift_retain(v1);
    return (unint64_t)v3;
  }
  v6 = (__int128 *)(a1 + 48);
  v7 = v1 - 1;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v8 = v14;
    *(_QWORD *)(v3[6] + 8 * result) = v14;
    *(_QWORD *)(v3[7] + 8 * result) = *((_QWORD *)&v14 + 1);
    v9 = v3[2];
    v10 = __OFADD__(v9, 1);
    v11 = v9 + 1;
    if (v10)
      break;
    v1 = *((_QWORD *)&v14 + 1);
    result = v14;
    v3[2] = v11;
    if (!v7)
      goto LABEL_8;
    v12 = *v6++;
    v14 = v12;
    swift_retain(v8);
    swift_retain(v1);
    result = sub_100058D30(v12);
    --v7;
    if ((v13 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_10007B320()
{
  uint64_t v0;

  sub_1000062D8((_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t storeEnumTagSinglePayload for HelpCommand.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10007B390 + 4 * byte_10009AAA9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10007B3C4 + 4 * byte_10009AAA4[v4]))();
}

uint64_t sub_10007B3C4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10007B3CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10007B3D4);
  return result;
}

uint64_t sub_10007B3E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10007B3E8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10007B3EC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10007B3F4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HelpCommand.CodingKeys()
{
  return &type metadata for HelpCommand.CodingKeys;
}

unint64_t sub_10007B414()
{
  unint64_t result;

  result = qword_1000B9DD8;
  if (!qword_1000B9DD8)
  {
    result = swift_getWitnessTable(&unk_10009ABC8, &type metadata for HelpCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9DD8);
  }
  return result;
}

unint64_t sub_10007B45C()
{
  unint64_t result;

  result = qword_1000B9DE0;
  if (!qword_1000B9DE0)
  {
    result = swift_getWitnessTable(&unk_10009AB38, &type metadata for HelpCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9DE0);
  }
  return result;
}

unint64_t sub_10007B4A4()
{
  unint64_t result;

  result = qword_1000B9DE8;
  if (!qword_1000B9DE8)
  {
    result = swift_getWitnessTable(&unk_10009AB60, &type metadata for HelpCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9DE8);
  }
  return result;
}

uint64_t sub_10007B4E8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return 0;
  v5 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0)
    v5 = 11;
  v6 = String.index(before:)(v5 | (v2 << 16), a1, a2);
  return String.subscript.getter(v6, a1, a2);
}

_QWORD *sub_10007B560(uint64_t a1, uint64_t *a2)
{
  int64_t v2;
  _QWORD *v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = _swiftEmptyArrayStorage;
  if (v2)
  {
    sub_10004FF00(0, v2, 0);
    v5 = (uint64_t *)(a1 + 40);
    do
    {
      v7 = *(v5 - 1);
      v6 = *v5;
      v8 = *a2;
      v9 = *(_QWORD *)(*a2 + 16);
      swift_bridgeObjectRetain(*v5);
      if (v9)
      {
        swift_bridgeObjectRetain_n(v6, 2);
        v10 = sub_100023BB8(v7, v6);
        if ((v11 & 1) != 0)
        {
          v3 = *(_QWORD **)(*(_QWORD *)(v8 + 56) + 8 * v10);
          swift_bridgeObjectRetain(v3);
        }
        swift_bridgeObjectRelease_n(v6, 2);
      }
      v13 = _swiftEmptyArrayStorage[2];
      v12 = _swiftEmptyArrayStorage[3];
      if (v13 >= v12 >> 1)
        sub_10004FF00((char *)(v12 > 1), v13 + 1, 1);
      v5 += 2;
      _swiftEmptyArrayStorage[2] = v13 + 1;
      v14 = &_swiftEmptyArrayStorage[6 * v13];
      v14[4] = v7;
      v14[5] = v6;
      v14[6] = v3;
      v14[7] = 0;
      v14[8] = 0xE000000000000000;
      *((_BYTE *)v14 + 72) = 0;
      --v2;
      v3 = _swiftEmptyArrayStorage;
    }
    while (v2);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_10007B6A8(uint64_t a1, char a2)
{
  _QWORD *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t result;
  _QWORD *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  Swift::String v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  Swift::String v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  Swift::String v70;
  Swift::String v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  Swift::String v75;
  Swift::String v76;
  uint64_t v77;
  void *v78;
  void *v79;
  Swift::String v80;
  Swift::String v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  _QWORD *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  _BYTE v93[16];
  uint64_t v94;
  uint64_t v95;

  if ((a2 & 1) != 0)
  {
    v90 = 0;
    v4 = TIOCGWINSZ.getter();
    v5 = ioctl(_:_:_:)(1, v4, &v90);
    if (WORD1(v90))
      v6 = WORD1(v90);
    else
      v6 = 80;
    if (v5)
      a1 = 80;
    else
      a1 = v6;
  }
  v86 = v2;
  v7 = v2[5];
  v89 = v7;
  v8 = *(_QWORD *)(v7 + 16);
  v9 = _swiftEmptyArrayStorage;
  if (v8)
  {
    v90 = (uint64_t)_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain(v7);
    sub_10004FDF4(0, v8, 0);
    v9 = (_QWORD *)v90;
    v10 = (uint64_t *)(v7 + 64);
    do
    {
      v11 = *(v10 - 4);
      v12 = *(v10 - 3);
      v13 = *(v10 - 2);
      v14 = *v10;
      sub_100080D20(v11, v12);
      swift_bridgeObjectRetain(v13);
      swift_bridgeObjectRetain(v14);
      v15 = sub_100080A88(a1, v11, v12, v13);
      v17 = v16;
      sub_100080D34(v11, v12);
      swift_bridgeObjectRelease(v14);
      swift_bridgeObjectRelease(v13);
      v90 = (uint64_t)v9;
      v19 = v9[2];
      v18 = v9[3];
      if (v19 >= v18 >> 1)
      {
        sub_10004FDF4((char *)(v18 > 1), v19 + 1, 1);
        v9 = (_QWORD *)v90;
      }
      v9[2] = v19 + 1;
      v20 = &v9[2 * v19];
      v20[4] = v15;
      v20[5] = v17;
      v10 += 6;
      --v8;
    }
    while (v8);
    sub_10002ABC8(&v89);
  }
  v21 = v9[2];
  v22 = _swiftEmptyArrayStorage;
  if (v21)
  {
    v23 = v9 + 5;
    do
    {
      v27 = *(v23 - 1);
      v28 = *v23;
      v29 = HIBYTE(*v23) & 0xFLL;
      if ((*v23 & 0x2000000000000000) == 0)
        v29 = v27 & 0xFFFFFFFFFFFFLL;
      if (v29)
      {
        swift_bridgeObjectRetain(*v23);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v22);
        v90 = (uint64_t)v22;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_10004FDF4(0, v22[2] + 1, 1);
          v22 = (_QWORD *)v90;
        }
        v25 = v22[2];
        v24 = v22[3];
        if (v25 >= v24 >> 1)
        {
          sub_10004FDF4((char *)(v24 > 1), v25 + 1, 1);
          v22 = (_QWORD *)v90;
        }
        v22[2] = v25 + 1;
        v26 = &v22[2 * v25];
        v26[4] = v27;
        v26[5] = v28;
      }
      v23 += 2;
      --v21;
    }
    while (v21);
  }
  swift_bridgeObjectRelease(v9);
  v90 = (uint64_t)v22;
  v31 = sub_100005104(&qword_1000B90C8);
  v32 = sub_1000062F8((unint64_t *)&qword_1000B90D0, &qword_1000B90C8, (uint64_t)&protocol conformance descriptor for [A]);
  v33 = BidirectionalCollection<>.joined(separator:)(10, 0xE100000000000000, v31, v32);
  v35 = v34;
  result = swift_release(v22);
  v37 = v86;
  v38 = v86[1];
  v39 = v86[2];
  v40 = HIBYTE(v39) & 0xF;
  if ((v39 & 0x2000000000000000) == 0)
    v40 = v38 & 0xFFFFFFFFFFFFLL;
  if (v40)
  {
    v90 = 0x574549565245564FLL;
    v91 = 0xEA0000000000203ALL;
    swift_bridgeObjectRetain(v39);
    v41._countAndFlagsBits = v38;
    v41._object = (void *)v39;
    String.append(_:)(v41);
    swift_bridgeObjectRelease(v39);
    v42 = v91;
    v43 = sub_10007BD34(a1, 0, v90, v91);
    v45 = v44;
    swift_bridgeObjectRelease(v42);
    v90 = v43;
    v91 = v45;
    swift_bridgeObjectRetain(v45);
    v46._countAndFlagsBits = 2570;
    v46._object = (void *)0xE200000000000000;
    String.append(_:)(v46);
    result = swift_bridgeObjectRelease(v45);
    v47 = v90;
  }
  else
  {
    v47 = 0;
  }
  v48 = v86[5];
  v49 = *(_QWORD *)(v48 + 16);
  if (!v49)
    goto LABEL_42;
  v50 = v48 + 48;
  while (*(_QWORD *)(v50 - 8) != 1)
  {
    v50 += 48;
    if (!--v49)
      goto LABEL_42;
  }
  if (*(_QWORD *)(*(_QWORD *)v50 + 16))
  {
    v82 = v31;
    v83 = v47;
    v84 = v33;
    v85 = v35;
    v51 = *v86;
    v88 = v51;
    v52 = *(_QWORD *)(v51 + 16);
    if (!v52)
    {
      __break(1u);
      return result;
    }
    v90 = (uint64_t)_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain(v51);
    sub_10004FDF4(0, v52, 0);
    v53 = v90;
    v54 = v51 + 40;
    do
    {
      v55 = (*(uint64_t (**)(void))(*(_QWORD *)v54 + 24))();
      v57 = v56;
      v90 = v53;
      v59 = *(_QWORD *)(v53 + 16);
      v58 = *(_QWORD *)(v53 + 24);
      if (v59 >= v58 >> 1)
      {
        sub_10004FDF4((char *)(v58 > 1), v59 + 1, 1);
        v53 = v90;
      }
      *(_QWORD *)(v53 + 16) = v59 + 1;
      v60 = v53 + 16 * v59;
      *(_QWORD *)(v60 + 32) = v55;
      *(_QWORD *)(v60 + 40) = v57;
      v54 += 16;
      --v52;
    }
    while (v52);
    sub_10002ABC8(&v88);
    v87 = v53;
    (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)(v51 + 40) + 16))(&v90);
    sub_10002AACC((uint64_t)&v92, (uint64_t)v93, &qword_1000B9110);
    sub_10002E7A0((uint64_t)v93);
    sub_10002CC24(&v90);
    sub_10002AACC((uint64_t)v93, (uint64_t)&v94, &qword_1000B9110);
    if (v95)
      sub_10007826C(0, 0, v94, v95);
    v35 = v85;
    v37 = v86;
    v47 = v83;
    v33 = v84;
    if (!*(_QWORD *)(v53 + 16))
      __break(1u);
    sub_10007826C(1uLL, 1, 1886152040, 0xE400000000000000);
    _StringGuts.grow(_:)(43);
    swift_bridgeObjectRelease(0xE000000000000000);
    v77 = BidirectionalCollection<>.joined(separator:)(32, 0xE100000000000000, v82, v32);
    v79 = v78;
    swift_bridgeObjectRelease(v87);
    v80._countAndFlagsBits = v77;
    v80._object = v79;
    String.append(_:)(v80);
    swift_bridgeObjectRelease(v79);
    v81._object = (void *)0x800000010009DBE0;
    v81._countAndFlagsBits = 0xD000000000000021;
    String.append(_:)(v81);
    v61 = 0x272065655320200ALL;
    v62 = (void *)0xE800000000000000;
  }
  else
  {
LABEL_42:
    v61 = 0;
    v62 = (void *)0xE000000000000000;
  }
  v64 = v37[3];
  v63 = v37[4];
  v65 = HIBYTE(v63) & 0xF;
  if ((v63 & 0x2000000000000000) == 0)
    v65 = v64 & 0xFFFFFFFFFFFFLL;
  if (v65)
  {
    swift_bridgeObjectRetain(v63);
    sub_10007D540(7, v64, v63);
    v67 = v66;
    v69 = v68;
    swift_bridgeObjectRelease(v63);
    v70._countAndFlagsBits = v67;
    v70._object = v69;
    String.append(_:)(v70);
    swift_bridgeObjectRelease(v69);
    v71._countAndFlagsBits = 2570;
    v71._object = (void *)0xE200000000000000;
    String.append(_:)(v71);
    v72 = 0x203A4547415355;
    v73 = 0xE700000000000000;
  }
  else
  {
    v72 = 0;
    v73 = 0xE000000000000000;
  }
  v74 = v73;
  String.append(_:)(*(Swift::String *)&v72);
  swift_bridgeObjectRelease(v73);
  v75._countAndFlagsBits = v33;
  v75._object = v35;
  String.append(_:)(v75);
  swift_bridgeObjectRelease(v35);
  v76._countAndFlagsBits = v61;
  v76._object = v62;
  String.append(_:)(v76);
  swift_bridgeObjectRelease(v62);
  return v47;
}

uint64_t sub_10007BD34(uint64_t a1, Swift::Int a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  _QWORD *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  BOOL v50;
  unint64_t v51;
  char v52;
  char v53;
  BOOL v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  char *v65;
  unint64_t v66;
  uint64_t v67;
  char *v68;
  unint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  unint64_t v94;
  unint64_t v95;
  char *v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  char *v102;
  unint64_t v103;
  char v104;
  char v105;
  unint64_t i;
  unint64_t v107;
  uint64_t v108;
  char *v109;
  char v110;
  uint64_t v111;
  char *v112;
  char v113;
  uint64_t v114;
  char *v115;
  char v116;
  unint64_t v117;
  uint64_t v118;
  char *v119;
  char v121;
  unint64_t v122;
  uint64_t v123;
  char *v124;
  char v125;
  unint64_t v126;
  uint64_t v127;
  char *v128;
  uint64_t v130;
  unint64_t v131;
  unint64_t v132;
  char *v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;
  _QWORD *v138;
  _QWORD *v139;
  _QWORD *v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  Swift::String v145;
  Swift::String v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  unint64_t v150;
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
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  unint64_t v164;
  unint64_t v165;
  _QWORD *v166;
  _QWORD *v167;
  uint64_t v168;
  uint64_t v169;
  unint64_t v170;
  uint64_t v173;
  unint64_t v174;
  unint64_t v175;
  unint64_t v176;
  uint64_t v177;
  unint64_t v178;
  unint64_t v181;
  uint64_t v182;
  unint64_t v183;
  uint64_t v184;
  unint64_t v185;
  char *v186;
  _QWORD *v187;
  Swift::String v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  _QWORD *v193;
  char *v194;

  v8 = a1 - a2;
  if (__OFSUB__(a1, a2))
    goto LABEL_142;
  if (v8 < 1)
    return 0;
  v9 = 0;
  v194 = (char *)_swiftEmptyArrayStorage;
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  v11 = 7;
  if (((a4 >> 60) & ((a3 & 0x800000000000000) == 0)) != 0)
    v11 = 11;
  v177 = v11 | (v10 << 16);
  v178 = 4 * v10;
  v5 = 15;
  v173 = a1 - a2;
  v12 = String.subscript.getter(15, v177, a3, a4);
  while (2)
  {
    v4 = v12;
    v28 = v13;
    v7 = v14;
    v6 = (unint64_t)v15;
    v29 = Substring.index(_:offsetBy:limitedBy:)(v12, v8, v28, v12, v28, v14, v15);
    if ((v30 & 1) != 0)
      v31 = v28;
    else
      v31 = v29;
    if (v31 >> 14 < v4 >> 14)
    {
LABEL_137:
      __break(1u);
      break;
    }
    v32 = Substring.subscript.getter(v4);
    v34 = v33;
    v4 = v35;
    v37 = v36;
    swift_bridgeObjectRelease(v6);
    v8 = v32 >> 14;
    if (v34 >> 14 == v32 >> 14)
    {
      if (v8 != v178)
      {
LABEL_20:
        swift_bridgeObjectRelease(v37);
        v38 = String.subscript.getter(v5, v177, a3, a4);
        v4 = v41;
        v42 = v39 >> 14;
        v43 = v38 >> 14;
        if (v38 >> 14 != v39 >> 14)
        {
          v7 = v38;
          v44 = v39;
          v45 = v40;
          v46 = Substring.subscript.getter(v38, v38, v39, v40, v41);
          v6 = (unint64_t)v47;
          if (v46 == 32 && v47 == (char *)0xE100000000000000)
            goto LABEL_23;
          v174 = v7;
          v53 = _stringCompareWithSmolCheck(_:_:expecting:)(v46, v47, 32, 0xE100000000000000, 0);
          swift_bridgeObjectRelease(v6);
          if ((v53 & 1) != 0)
          {
            swift_bridgeObjectRelease(v4);
            v7 = v174;
            goto LABEL_32;
          }
          v69 = Substring.index(after:)(v174, v174, v44, v45, v4);
          v43 = v69 >> 14;
          if (v69 >> 14 != v42)
          {
            v7 = v69;
            v70 = Substring.subscript.getter(v69, v174, v44, v45, v4);
            v6 = (unint64_t)v71;
            if (v70 == 32 && v71 == (char *)0xE100000000000000)
            {
LABEL_23:
              swift_bridgeObjectRelease(v4);
              swift_bridgeObjectRelease(0xE100000000000000);
              goto LABEL_32;
            }
            v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v70, v71, 32, 0xE100000000000000, 0);
            swift_bridgeObjectRelease(v6);
            if ((v8 & 1) == 0)
            {
              for (i = v7; ; i = v8)
              {
                v107 = Substring.index(after:)(i, v174, v44, v45, v4);
                v43 = v107 >> 14;
                if (v107 >> 14 == v42)
                  goto LABEL_123;
                v8 = v107;
                v108 = Substring.subscript.getter(v107, v174, v44, v45, v4);
                v6 = (unint64_t)v109;
                if (v108 == 32 && v109 == (char *)0xE100000000000000)
                  break;
                v110 = _stringCompareWithSmolCheck(_:_:expecting:)(v108, v109, 32, 0xE100000000000000, 0);
                swift_bridgeObjectRelease(v6);
                if ((v110 & 1) != 0)
                {
                  v122 = v4;
                  goto LABEL_119;
                }
              }
              swift_bridgeObjectRelease(v4);
              v122 = 0xE100000000000000;
LABEL_119:
              swift_bridgeObjectRelease(v122);
              v7 = v8;
              goto LABEL_32;
            }
            swift_bridgeObjectRelease(v4);
LABEL_32:
            v54 = v43 >= v9;
            v56 = a3;
            v55 = a4;
            if (!v54)
              goto LABEL_139;
            goto LABEL_34;
          }
        }
LABEL_123:
        v131 = v4;
LABEL_125:
        swift_bridgeObjectRelease(v131);
        v4 = sub_100014AA0(v5, a3, a4);
        v5 = v132;
        v6 = (unint64_t)v133;
        v7 = v134;
        v8 = (uint64_t)v194;
        if ((swift_isUniquelyReferenced_nonNull_native(v194) & 1) == 0)
          goto LABEL_144;
        goto LABEL_126;
      }
LABEL_124:
      v131 = v37;
      goto LABEL_125;
    }
    v7 = Substring.index(before:)(v34, v32, v34, v4, v37);
    v48 = Substring.subscript.getter(v7, v32, v34, v4, v37);
    v50 = v48 == 10 && v49 == (char *)0xE100000000000000;
    if (v50)
      goto LABEL_52;
    v6 = (unint64_t)v49;
    v185 = v32 >> 14;
    v8 = v4;
    v4 = v9;
    v51 = v7;
    v52 = _stringCompareWithSmolCheck(_:_:expecting:)(v48, v49, 10, 0xE100000000000000, 0);
    swift_bridgeObjectRelease(v6);
    if ((v52 & 1) == 0)
    {
      v66 = v51;
      v50 = v185 == v51 >> 14;
      v9 = v4;
      v4 = v8;
      if (!v50)
      {
        v7 = Substring.index(before:)(v66, v32, v34, v8, v37);
        v72 = Substring.subscript.getter(v7, v32, v34, v8, v37);
        v6 = (unint64_t)v73;
        if (v72 == 10 && v73 == (char *)0xE100000000000000)
        {
LABEL_52:
          swift_bridgeObjectRelease(v37);
          v74 = 0xE100000000000000;
LABEL_53:
          swift_bridgeObjectRelease(v74);
          goto LABEL_54;
        }
        v176 = v7;
        v105 = _stringCompareWithSmolCheck(_:_:expecting:)(v72, v73, 10, 0xE100000000000000, 0);
        swift_bridgeObjectRelease(v6);
        if ((v105 & 1) != 0)
        {
LABEL_81:
          swift_bridgeObjectRelease(v37);
          v7 = v176;
          goto LABEL_54;
        }
        if (v185 != v176 >> 14)
        {
          v7 = Substring.index(before:)(v176, v32, v34, v8, v37);
          v123 = Substring.subscript.getter(v7, v32, v34, v8, v37);
          v6 = (unint64_t)v124;
          if (v123 == 10 && v124 == (char *)0xE100000000000000)
            goto LABEL_52;
          v176 = v7;
          v125 = _stringCompareWithSmolCheck(_:_:expecting:)(v123, v124, 10, 0xE100000000000000, 0);
          swift_bridgeObjectRelease(v6);
          if ((v125 & 1) != 0)
            goto LABEL_81;
          v126 = v176;
          if (v185 != v176 >> 14)
          {
            do
            {
              v7 = Substring.index(before:)(v126, v32, v34, v4, v37);
              v127 = Substring.subscript.getter(v7, v32, v34, v4, v37);
              if (v127 == 10 && v128 == (char *)0xE100000000000000)
                goto LABEL_52;
              v6 = (unint64_t)v128;
              v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v127, v128, 10, 0xE100000000000000, 0);
              swift_bridgeObjectRelease(v6);
              if ((v8 & 1) != 0)
              {
                v74 = v37;
                goto LABEL_53;
              }
              v126 = v7;
            }
            while (v185 != v7 >> 14);
          }
        }
      }
      v8 = v32 >> 14;
      if (v34 >> 14 == v178)
        goto LABEL_124;
      v7 = Substring.index(before:)(v34, v32, v34, v4, v37);
      v67 = Substring.subscript.getter(v7, v32, v34, v4, v37);
      v6 = (unint64_t)v68;
      if (v67 == 32 && v68 == (char *)0xE100000000000000)
        goto LABEL_44;
      v103 = v7;
      v104 = _stringCompareWithSmolCheck(_:_:expecting:)(v67, v68, 32, 0xE100000000000000, 0);
      swift_bridgeObjectRelease(v6);
      if ((v104 & 1) != 0)
      {
LABEL_77:
        swift_bridgeObjectRelease(v37);
        v7 = v103;
LABEL_78:
        v56 = a3;
        v55 = a4;
        if (v9 > v7 >> 14)
          goto LABEL_143;
LABEL_34:
        v57 = v7;
        v4 = String.subscript.getter(v5, v7, v56, v55);
        v59 = v58;
        v61 = v60;
        v7 = v62;
        v6 = (unint64_t)v194;
        if ((swift_isUniquelyReferenced_nonNull_native(v194) & 1) == 0)
          v6 = (unint64_t)sub_100057EEC(0, *((_QWORD *)v194 + 2) + 1, 1, v194);
        v64 = *(_QWORD *)(v6 + 16);
        v63 = *(_QWORD *)(v6 + 24);
        if (v64 >= v63 >> 1)
          v6 = (unint64_t)sub_100057EEC((char *)(v63 > 1), v64 + 1, 1, (char *)v6);
        *(_QWORD *)(v6 + 16) = v64 + 1;
        v65 = (char *)(v6 + 32 * v64);
        *((_QWORD *)v65 + 4) = v4;
        *((_QWORD *)v65 + 5) = v59;
        *((_QWORD *)v65 + 6) = v61;
        *((_QWORD *)v65 + 7) = v7;
        v194 = (char *)v6;
        v27 = v57;
        goto LABEL_12;
      }
      if (v185 == v103 >> 14)
        goto LABEL_20;
      v7 = Substring.index(before:)(v103, v32, v34, v4, v37);
      v111 = Substring.subscript.getter(v7, v32, v34, v4, v37);
      v6 = (unint64_t)v112;
      if (v111 != 32 || v112 != (char *)0xE100000000000000)
      {
        v103 = v7;
        v113 = _stringCompareWithSmolCheck(_:_:expecting:)(v111, v112, 32, 0xE100000000000000, 0);
        swift_bridgeObjectRelease(v6);
        if ((v113 & 1) != 0)
          goto LABEL_77;
        if (v185 == v103 >> 14)
          goto LABEL_20;
        v7 = Substring.index(before:)(v103, v32, v34, v4, v37);
        v114 = Substring.subscript.getter(v7, v32, v34, v4, v37);
        v6 = (unint64_t)v115;
        if (v114 != 32 || v115 != (char *)0xE100000000000000)
        {
          v103 = v7;
          v116 = _stringCompareWithSmolCheck(_:_:expecting:)(v114, v115, 32, 0xE100000000000000, 0);
          swift_bridgeObjectRelease(v6);
          if ((v116 & 1) != 0)
            goto LABEL_77;
          if (v185 == v103 >> 14)
            goto LABEL_20;
          v117 = v103;
          while (1)
          {
            v7 = Substring.index(before:)(v117, v32, v34, v4, v37);
            v118 = Substring.subscript.getter(v7, v32, v34, v4, v37);
            if (v118 == 32 && v119 == (char *)0xE100000000000000)
              break;
            v6 = (unint64_t)v119;
            v103 = v7;
            v121 = _stringCompareWithSmolCheck(_:_:expecting:)(v118, v119, 32, 0xE100000000000000, 0);
            swift_bridgeObjectRelease(v6);
            if ((v121 & 1) != 0)
              goto LABEL_77;
            v117 = v103;
            if (v185 == v103 >> 14)
              goto LABEL_20;
          }
        }
      }
LABEL_44:
      swift_bridgeObjectRelease(v37);
      swift_bridgeObjectRelease(0xE100000000000000);
      goto LABEL_78;
    }
    swift_bridgeObjectRelease(v37);
    v7 = v51;
    v9 = v4;
LABEL_54:
    v56 = a3;
    v55 = a4;
    if (v9 > v7 >> 14)
      goto LABEL_140;
    v175 = v7;
    v75 = String.subscript.getter(v5, v7, a3, a4);
    v77 = v75;
    v79 = v78;
    v81 = v80;
    v5 = v76;
    v181 = v76;
    v183 = v78 >> 14;
    if (v78 >> 14 == v75 >> 14)
    {
      v6 = Substring.subscript.getter(v75);
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v22 = sub_100057EEC(0, 1, 1, (char *)_swiftEmptyArrayStorage);
      v24 = *((_QWORD *)v22 + 2);
      v23 = *((_QWORD *)v22 + 3);
      v7 = v24 + 1;
      if (v24 >= v23 >> 1)
        v22 = sub_100057EEC((char *)(v23 > 1), v24 + 1, 1, v22);
      *((_QWORD *)v22 + 2) = v7;
      v25 = &v22[32 * v24];
      *((_QWORD *)v25 + 4) = v6;
      v26 = v25 + 32;
      goto LABEL_11;
    }
    swift_bridgeObjectRetain(v76);
    v82 = v77;
    v8 = v77;
    v7 = v77;
    v186 = (char *)_swiftEmptyArrayStorage;
    v83 = v81;
    do
    {
      v84 = Substring.subscript.getter(v82, v77, v79, v83, v5);
      v4 = v85;
      if (v84 == 10 && v85 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease(0xE100000000000000);
      }
      else
      {
        v6 = _stringCompareWithSmolCheck(_:_:expecting:)(v84, v85, 10, 0xE100000000000000, 0);
        swift_bridgeObjectRelease(v4);
        if ((v6 & 1) == 0)
        {
          v82 = Substring.index(after:)(v82, v77, v79, v83, v5);
          continue;
        }
      }
      if (v82 >> 14 < (unint64_t)v8 >> 14)
      {
        __break(1u);
        goto LABEL_137;
      }
      v86 = v83;
      v87 = Substring.subscript.getter(v8);
      v89 = v88;
      v6 = (unint64_t)v90;
      v92 = v91;
      if ((swift_isUniquelyReferenced_nonNull_native(v186) & 1) != 0)
        v93 = v186;
      else
        v93 = sub_100057EEC(0, *((_QWORD *)v186 + 2) + 1, 1, v186);
      v95 = *((_QWORD *)v93 + 2);
      v94 = *((_QWORD *)v93 + 3);
      v4 = v95 + 1;
      if (v95 >= v94 >> 1)
        v93 = sub_100057EEC((char *)(v94 > 1), v95 + 1, 1, v93);
      *((_QWORD *)v93 + 2) = v4;
      v186 = v93;
      v96 = &v93[32 * v95];
      *((_QWORD *)v96 + 4) = v87;
      *((_QWORD *)v96 + 5) = v89;
      *((_QWORD *)v96 + 6) = v6;
      *((_QWORD *)v96 + 7) = v92;
      v83 = v86;
      v5 = v181;
      v82 = Substring.index(after:)(v82, v77, v79, v86, v181);
      v8 = v82;
      v7 = v82;
    }
    while (v183 != v82 >> 14);
    if (v183 < v7 >> 14)
      goto LABEL_141;
    v7 = Substring.subscript.getter(v7);
    v97 = v5;
    v17 = v98;
    v19 = v99;
    v21 = v100;
    swift_bridgeObjectRelease(v97);
    if ((swift_isUniquelyReferenced_nonNull_native(v186) & 1) != 0)
    {
      v56 = a3;
      v55 = a4;
      v22 = v186;
    }
    else
    {
      v22 = sub_100057EEC(0, *((_QWORD *)v186 + 2) + 1, 1, v186);
      v56 = a3;
      v55 = a4;
    }
    v6 = *((_QWORD *)v22 + 2);
    v101 = *((_QWORD *)v22 + 3);
    if (v6 >= v101 >> 1)
      v22 = sub_100057EEC((char *)(v101 > 1), v6 + 1, 1, v22);
    *((_QWORD *)v22 + 2) = v6 + 1;
    v102 = &v22[32 * v6];
    *((_QWORD *)v102 + 4) = v7;
    v26 = v102 + 32;
LABEL_11:
    v4 = (unint64_t)v22;
    v26[1] = v17;
    v26[2] = v19;
    v26[3] = v21;
    swift_bridgeObjectRelease(v181);
    sub_100057328((char *)v4);
    v27 = v175;
LABEL_12:
    v5 = String.index(after:)(v27, v56, v55);
    v9 = v5 >> 14;
    v8 = v173;
    if (v178 >= v5 >> 14)
    {
      v12 = String.subscript.getter(v5, v177, v56, v55);
      continue;
    }
    break;
  }
  __break(1u);
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
  v8 = (uint64_t)sub_100057EEC(0, *(_QWORD *)(v8 + 16) + 1, 1, (char *)v8);
LABEL_126:
  v136 = *(_QWORD *)(v8 + 16);
  v135 = *(_QWORD *)(v8 + 24);
  v137 = v136 + 1;
  if (v136 >= v135 >> 1)
    v8 = (uint64_t)sub_100057EEC((char *)(v135 > 1), v136 + 1, 1, (char *)v8);
  *(_QWORD *)(v8 + 16) = v137;
  v138 = (_QWORD *)(v8 + 32 * v136);
  v138[4] = v4;
  v138[5] = v5;
  v138 += 4;
  v138[2] = v6;
  v138[3] = v7;
  v193 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRetain(v8);
  sub_10004FE2C(0, v136 + 1, 0);
  v139 = _swiftEmptyArrayStorage;
  v182 = v8;
  v140 = (_QWORD *)(v8 + 56);
  do
  {
    v141 = *(v140 - 3);
    v142 = *(v140 - 2);
    v143 = *(v140 - 1);
    v144 = *v140;
    swift_bridgeObjectRetain(*v140);
    if ((v142 ^ v141) >= 0x4000)
    {
      v145._countAndFlagsBits = 32;
      v145._object = (void *)0xE100000000000000;
      v146 = String.init(repeating:count:)(v145, a2);
      Substring.distance(from:to:)(v141, v142, v141, v142, v143, v144);
      String.count.getter(v146._countAndFlagsBits, v146._object);
      v188 = v146;
      swift_bridgeObjectRetain(v146._object);
      v191 = static String._fromSubstring(_:)(15, 7, 0, 0xE000000000000000);
      v192 = v147;
      String.append<A>(contentsOf:)(&v188, &type metadata for String, &protocol witness table for String);
      v148 = Substring.init(_:)(v191, v192);
      v184 = v149;
      v187 = v139;
      v150 = v137;
      v152 = v151;
      v154 = v153;
      swift_bridgeObjectRelease(v146._object);
      v188._countAndFlagsBits = v141;
      v188._object = (void *)v142;
      v189 = v143;
      v190 = v144;
      swift_bridgeObjectRetain(v144);
      v155 = v152;
      v137 = v150;
      v156 = static String._fromSubstring(_:)(v148, v184, v155, v154);
      v158 = v157;
      swift_bridgeObjectRelease(v154);
      v191 = v156;
      v192 = v158;
      v139 = v187;
      v159 = sub_100033C3C();
      String.append<A>(contentsOf:)(&v188, &type metadata for Substring, v159);
      v141 = Substring.init(_:)(v191, v192);
      v142 = v160;
      v143 = v161;
      v163 = v162;
      swift_bridgeObjectRelease(v146._object);
      swift_bridgeObjectRelease_n(v144, 2);
      v144 = v163;
    }
    v193 = v139;
    v165 = v139[2];
    v164 = v139[3];
    if (v165 >= v164 >> 1)
    {
      sub_10004FE2C((char *)(v164 > 1), v165 + 1, 1);
      v139 = v193;
    }
    v139[2] = v165 + 1;
    v166 = &v139[4 * v165];
    v166[4] = v141;
    v166[5] = v142;
    v166[6] = v143;
    v166[7] = v144;
    v140 += 4;
    --v137;
  }
  while (v137);
  swift_bridgeObjectRelease_n(v182, 2);
  v188._countAndFlagsBits = (uint64_t)v139;
  v167 = v139;
  v168 = sub_100005104(&qword_1000B90D8);
  v169 = sub_1000062F8(&qword_1000B90E0, &qword_1000B90D8, (uint64_t)&protocol conformance descriptor for [A]);
  v170 = sub_10002D69C();
  v130 = Sequence<>.joined(separator:)(10, 0xE100000000000000, v168, v169, v170);
  swift_bridgeObjectRelease(v167);
  return v130;
}

unint64_t sub_10007CBC8(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v23;

  v23 = a4 >> 14;
  if (a4 >> 14 == a3 >> 14)
    return 0;
  v13 = Substring.subscript.getter(a3, a3, a4, a5, a6);
  v15 = v14;
  if (v13 == a1 && v14 == a2)
  {
    v6 = a3;
LABEL_6:
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v16 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v14, a1, a2, 0);
    swift_bridgeObjectRelease(v15);
    if ((v16 & 1) != 0)
    {
      return a3;
    }
    else
    {
      v6 = a3;
      while (1)
      {
        v18 = Substring.index(after:)(v6, a3, a4, a5, a6);
        if (v18 >> 14 == v23)
          return 0;
        v6 = v18;
        v19 = Substring.subscript.getter(v18, a3, a4, a5, a6);
        v21 = v20;
        if (v19 == a1 && v20 == a2)
          goto LABEL_6;
        v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v19, v20, a1, a2, 0);
        swift_bridgeObjectRelease(v21);
        if ((v17 & 1) != 0)
          return v6;
      }
    }
  }
  return v6;
}

unint64_t sub_10007CD40(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v4 = a3 & 0xFFFFFFFFFFFFLL;
  if (!v4)
    return 0;
  v9 = 4 * v4;
  v10 = 15;
  while (1)
  {
    v11 = String.subscript.getter(v10, a3, a4);
    v13 = v12;
    if (v11 == a1 && v12 == a2)
      break;
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v11, v12, a1, a2, 0);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) != 0)
      return v10;
    v10 = String.index(after:)(v10, a3, a4);
    if (v9 == v10 >> 14)
      return 0;
  }
  swift_bridgeObjectRelease(a2);
  return v10;
}

uint64_t sub_10007CE2C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  Swift::String v4;
  Swift::String v5;
  uint64_t v6;
  void *v7;
  Swift::String v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  Swift::String v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  Swift::String v35;
  Swift::String v36;
  Swift::String v37;
  Swift::String v38;
  void *v40;

  v2 = v1;
  v4._countAndFlagsBits = 32;
  v4._object = (void *)0xE100000000000000;
  v5 = String.init(repeating:count:)(v4, 2);
  v6 = *v1;
  v7 = (void *)v1[1];
  swift_bridgeObjectRetain(v5._object);
  v8._countAndFlagsBits = v6;
  v8._object = v7;
  String.append(_:)(v8);
  swift_bridgeObjectRelease(v5._object);
  v9 = v1[2];
  v10 = v1[3];
  swift_bridgeObjectRetain(v10);
  v11 = sub_10007BD34(a1, 26, v9, v10);
  v13 = v12;
  swift_bridgeObjectRelease(v10);
  v15 = v1[4];
  v14 = v1[5];
  v16 = HIBYTE(v14) & 0xF;
  if ((v14 & 0x2000000000000000) == 0)
    v16 = v15 & 0xFFFFFFFFFFFFLL;
  if (v16)
  {
    swift_bridgeObjectRetain(v2[5]);
    v17 = sub_10007BD34(a1, 8, v15, v14);
    v19 = v18;
    swift_bridgeObjectRelease(v14);
    v40 = v19;
    swift_bridgeObjectRetain(v19);
    v20._countAndFlagsBits = 10;
    v20._object = (void *)0xE100000000000000;
    String.append(_:)(v20);
    swift_bridgeObjectRelease(v19);
    v22 = v17;
    v21 = v40;
  }
  else
  {
    v22 = 0;
    v21 = (void *)0xE000000000000000;
  }
  v23 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0)
    v23 = v9 & 0xFFFFFFFFFFFFLL;
  if (v23)
  {
    if (String.count.getter(v5._countAndFlagsBits, v5._object) >= 26)
    {
      v35._countAndFlagsBits = v11;
      v35._object = v13;
      String.append(_:)(v35);
      swift_bridgeObjectRelease(v13);
      v32 = 10;
      v34 = (void *)0xE100000000000000;
    }
    else
    {
      swift_bridgeObjectRetain(v13);
      v24 = String.count.getter(v5._countAndFlagsBits, v5._object);
      v25 = sub_100033710(v24, v11, (unint64_t)v13);
      v27 = v26;
      v29 = v28;
      v31 = v30;
      swift_bridgeObjectRelease(v13);
      v32 = static String._fromSubstring(_:)(v25, v27, v29, v31);
      v34 = v33;
      swift_bridgeObjectRelease(v13);
      swift_bridgeObjectRelease(v31);
    }
  }
  else
  {
    swift_bridgeObjectRelease(v13);
    v32 = 0;
    v34 = (void *)0xE000000000000000;
  }
  swift_bridgeObjectRetain(v5._object);
  v36._countAndFlagsBits = v32;
  v36._object = v34;
  String.append(_:)(v36);
  swift_bridgeObjectRelease(v34);
  swift_bridgeObjectRelease(v5._object);
  swift_bridgeObjectRetain(v5._object);
  v37._countAndFlagsBits = 10;
  v37._object = (void *)0xE100000000000000;
  String.append(_:)(v37);
  swift_bridgeObjectRelease(v5._object);
  swift_bridgeObjectRetain(v5._object);
  v38._countAndFlagsBits = v22;
  v38._object = v21;
  String.append(_:)(v38);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v5._object);
  return v5._countAndFlagsBits;
}

Swift::Int sub_10007D0B0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[9];

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  v6 = v0[4];
  v5 = v0[5];
  Hasher.init(_seed:)(v8, 0);
  swift_bridgeObjectRetain(v2);
  String.hash(into:)(v8, v1, v2);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(v8, v3, v4);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRetain(v5);
  String.hash(into:)(v8, v6, v5);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

uint64_t sub_10007D160(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *v1;
  v4 = v1[1];
  v5 = v1[2];
  v6 = v1[3];
  v8 = v1[4];
  v7 = v1[5];
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(a1, v3, v4);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRetain(v6);
  String.hash(into:)(a1, v5, v6);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(a1, v8, v7);
  return swift_bridgeObjectRelease(v7);
}

Swift::Int sub_10007D1FC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[9];

  v2 = *v1;
  v3 = v1[1];
  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  Hasher.init(_seed:)(v9, a1);
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(v9, v2, v3);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRetain(v5);
  String.hash(into:)(v9, v4, v5);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRetain(v6);
  String.hash(into:)(v9, v7, v6);
  swift_bridgeObjectRelease(v6);
  return Hasher._finalize()();
}

uint64_t sub_10007D2A8(_OWORD *a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[3];
  _OWORD v8[3];

  v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  v3 = *a2;
  v4 = a2[1];
  v7[2] = a1[2];
  v8[0] = v3;
  v5 = a2[2];
  v8[1] = v4;
  v8[2] = v5;
  return sub_10007F1B8((uint64_t *)v7, v8) & 1;
}

uint64_t sub_10007D2EC()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[1];
  v2 = 0x616D6D6F63627553;
  v3 = 0x736E6F6974704FLL;
  if (v1 != 2)
    v3 = *v0;
  if (v1 != 1)
    v2 = v3;
  if (v1)
    v4 = v2;
  else
    v4 = 0x746E656D75677241;
  sub_100080D20(*v0, v1);
  return v4;
}

uint64_t sub_10007D380(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;

  v3 = a1[1];
  v4 = a2[1];
  switch(v3)
  {
    case 0:
      return !v4;
    case 1:
      return v4 == 1;
    case 2:
      return v4 == 2;
  }
  if (v4 < 3)
    return 0;
  v6 = *a1;
  if (v6 == *a2 && v3 == v4)
    return 1;
  return _stringCompareWithSmolCheck(_:_:expecting:)(v6, v3, *a2, v4, 0);
}

unint64_t sub_10007D3F8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;
  unint64_t v3;

  result = sub_100084E38();
  *a1 = result;
  a1[1] = v3;
  return result;
}

BOOL sub_10007D45C(_QWORD *a1)
{
  unint64_t v1;
  uint64_t v2;

  v1 = a1[1];
  v2 = *a1 & 0xFFFFFFFFFFFFLL;
  if ((v1 & 0x2000000000000000) != 0)
    v2 = HIBYTE(v1) & 0xF;
  return v2 != 0;
}

uint64_t sub_10007D47C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = a1[1];
  *a2 = v2;
  a2[1] = v3;
  return swift_bridgeObjectRetain(v3);
}

void sub_10007D488(_QWORD *a1@<X8>)
{
  *a1 = _swiftEmptyArrayStorage;
}

uint64_t sub_10007D498()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  Swift::String v8;

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0)
    v3 = v2 & 0xFFFFFFFFFFFFLL;
  if (!v3)
    return 0;
  swift_bridgeObjectRetain(v1);
  sub_10007D540(7, v2, v1);
  v5 = v4;
  v7 = v6;
  swift_bridgeObjectRelease(v1);
  v8._countAndFlagsBits = v5;
  v8._object = v7;
  String.append(_:)(v8);
  swift_bridgeObjectRelease(v7);
  return 0x203A6567617355;
}

void sub_10007D540(Swift::Int a1, uint64_t a2, unint64_t a3)
{
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  Swift::String v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  Swift::String v22;
  Swift::String v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  Swift::String v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  _QWORD v35[4];
  char v36[16];
  uint64_t *v37;
  _QWORD v38[3];
  uint64_t v39;
  unint64_t v40;

  v39 = 10;
  v40 = 0xE100000000000000;
  v37 = &v39;
  swift_bridgeObjectRetain(a3);
  v6 = sub_100032C14(1, 0, sub_10002D680, (uint64_t)v36, a2, a3);
  v7 = v6;
  if (*((_QWORD *)v6 + 2) == 2)
  {
    v8 = *((_QWORD *)v6 + 4);
    v9 = *((_QWORD *)v6 + 5);
    v10 = *((_QWORD *)v6 + 6);
    v11 = *((_QWORD *)v6 + 7);
    swift_bridgeObjectRetain(v11);
    v12 = static String._fromSubstring(_:)(v8, v9, v10, v11);
    v14 = v13;
    swift_bridgeObjectRelease(v11);
    v39 = v12;
    v40 = v14;
    v15._countAndFlagsBits = 10;
    v15._object = (void *)0xE100000000000000;
    String.append(_:)(v15);
    if (*((_QWORD *)v7 + 2) < 2uLL)
    {
      __break(1u);
    }
    else
    {
      v16 = *((_QWORD *)v7 + 8);
      v17 = *((_QWORD *)v7 + 9);
      v19 = *((_QWORD *)v7 + 10);
      v18 = *((_QWORD *)v7 + 11);
      swift_bridgeObjectRetain(v18);
      v20 = swift_bridgeObjectRelease(v7);
      v38[0] = 10;
      v38[1] = 0xE100000000000000;
      __chkstk_darwin(v20);
      v35[2] = v38;
      swift_bridgeObjectRetain(v18);
      v21 = sub_10003302C(0x7FFFFFFFFFFFFFFFLL, 0, sub_1000155F8, (uint64_t)v35, v16, v17, v19, v18);
      v22._countAndFlagsBits = 32;
      v22._object = (void *)0xE100000000000000;
      v23 = String.init(repeating:count:)(v22, a1);
      v24 = sub_1000337AC(v21, v23._countAndFlagsBits, (uint64_t)v23._object);
      swift_bridgeObjectRelease(v21);
      swift_bridgeObjectRelease(v23._object);
      v38[0] = v24;
      v25 = sub_100005104(&qword_1000B90D8);
      v26 = sub_1000062F8(&qword_1000B90E0, &qword_1000B90D8, (uint64_t)&protocol conformance descriptor for [A]);
      v27 = sub_10002D69C();
      v28 = Sequence<>.joined(separator:)(10, 0xE100000000000000, v25, v26, v27);
      v30 = v29;
      swift_bridgeObjectRelease(v18);
      swift_bridgeObjectRelease(v24);
      v31._countAndFlagsBits = v28;
      v31._object = v30;
      String.append(_:)(v31);
      swift_bridgeObjectRelease(v30);
    }
  }
  else
  {
    v39 = (uint64_t)v6;
    v32 = sub_100005104(&qword_1000B90D8);
    v33 = sub_1000062F8(&qword_1000B90E0, &qword_1000B90D8, (uint64_t)&protocol conformance descriptor for [A]);
    v34 = sub_10002D69C();
    Sequence<>.joined(separator:)(0, 0xE000000000000000, v32, v33, v34);
    swift_bridgeObjectRelease(v7);
  }
}

BOOL sub_10007D7F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t i;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v1 + 16);
  if (!v2)
    return 0;
  for (i = v1 + 48; *(_QWORD *)(i - 8) != 1; i += 48)
  {
    if (!--v2)
      return 0;
  }
  return *(_QWORD *)(*(_QWORD *)i + 16) != 0;
}

char *sub_10007D834(char a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unsigned __int8 *v20;
  char *v21;
  char *v22;
  void *v23;
  char *v24;
  unsigned int v25;
  Swift::String v26;
  Swift::String v27;
  Swift::String v28;
  Swift::String v29;
  unint64_t v30;
  unint64_t v31;
  char *v33;
  char v34;
  char *v35;
  unint64_t v36;

  v4 = 1886152040;
  v5 = String.subscript.getter(15, 1886152040, 0xE400000000000000);
  if (v5 == 95 && v6 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease(0xE100000000000000);
    goto LABEL_8;
  }
  v8 = v6;
  v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v6, 95, 0xE100000000000000, 0);
  swift_bridgeObjectRelease(v8);
  if ((v9 & 1) != 0)
  {
LABEL_8:
    v11 = sub_100033710(1uLL, 1886152040, 0xE400000000000000);
    v13 = v12;
    v4 = static String._fromSubstring(_:)(v11, v14, v15, v12);
    v10 = v16;
    swift_bridgeObjectRelease(v13);
    goto LABEL_9;
  }
  v10 = 0xE400000000000000;
LABEL_9:
  swift_bridgeObjectRetain(v10);
  v17 = swift_bridgeObjectRetain(a2);
  v18 = sub_10007F258(v17, v4, v10);
  swift_bridgeObjectRelease(a2);
  swift_bridgeObjectRelease_n(v10, 2);
  v19 = *((_QWORD *)v18 + 2);
  if (!v19)
  {
    swift_bridgeObjectRelease(v18);
    v21 = (char *)_swiftEmptyArrayStorage;
    goto LABEL_25;
  }
  swift_bridgeObjectRetain(v18);
  v33 = v18;
  v20 = (unsigned __int8 *)(v18 + 48);
  v21 = (char *)_swiftEmptyArrayStorage;
  do
  {
    v24 = (char *)*((_QWORD *)v20 - 2);
    v23 = (void *)*((_QWORD *)v20 - 1);
    v25 = *v20;
    if (a1)
    {
      if (v25 >> 6)
      {
        if (v25 >> 6 == 1)
          goto LABEL_12;
        v35 = 0;
        v36 = 0xE000000000000000;
        swift_bridgeObjectRetain(v23);
        v26._countAndFlagsBits = (uint64_t)v24;
        v26._object = v23;
        String.append(_:)(v26);
        v27._countAndFlagsBits = 45;
        v27._object = (void *)0xE100000000000000;
        String.append(_:)(v27);
        v34 = a1;
        _print_unlocked<A, B>(_:_:)(&v34, &v35, &type metadata for ArgumentVisibility, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
        sub_10002DA24((uint64_t)v24, (uint64_t)v23, v25);
        v24 = v35;
        v23 = (void *)v36;
        LOBYTE(v25) = 0x80;
      }
      else
      {
        v35 = 0;
        v36 = 0xE000000000000000;
        swift_bridgeObjectRetain(v23);
        v28._countAndFlagsBits = (uint64_t)v24;
        v28._object = v23;
        String.append(_:)(v28);
        v29._countAndFlagsBits = 45;
        v29._object = (void *)0xE100000000000000;
        String.append(_:)(v29);
        v34 = a1;
        _print_unlocked<A, B>(_:_:)(&v34, &v35, &type metadata for ArgumentVisibility.Representation, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
        sub_10002DA24((uint64_t)v24, (uint64_t)v23, v25);
        LOBYTE(v25) = 0;
        v24 = v35;
        v23 = (void *)v36;
      }
    }
    else
    {
      sub_100030508(*((_QWORD *)v20 - 2), *((_QWORD *)v20 - 1), *v20);
    }
    if ((swift_isUniquelyReferenced_nonNull_native(v21) & 1) == 0)
      v21 = sub_100057BB8(0, *((_QWORD *)v21 + 2) + 1, 1, v21);
    v31 = *((_QWORD *)v21 + 2);
    v30 = *((_QWORD *)v21 + 3);
    if (v31 >= v30 >> 1)
      v21 = sub_100057BB8((char *)(v30 > 1), v31 + 1, 1, v21);
    *((_QWORD *)v21 + 2) = v31 + 1;
    v22 = &v21[24 * v31];
    *((_QWORD *)v22 + 4) = v24;
    *((_QWORD *)v22 + 5) = v23;
    v22[48] = v25;
LABEL_12:
    v20 += 24;
    --v19;
  }
  while (v19);
  swift_bridgeObjectRelease_n(v33, 2);
LABEL_25:
  v35 = v21;
  swift_bridgeObjectRetain(v21);
  sub_10007DB50(&v35);
  swift_bridgeObjectRelease(v21);
  return v35;
}

uint64_t sub_10007DB50(char **a1)
{
  char *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
    v2 = sub_10007F164((uint64_t)v2);
  v3 = *((_QWORD *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  result = sub_10007DBB8(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_10007DBB8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  Swift::Int v9;
  uint64_t v10;
  unint64_t v11;
  Swift::Int v12;
  Swift::Int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  Swift::String v22;
  unint64_t v23;
  Swift::String v24;
  uint64_t v25;
  unint64_t v26;
  Swift::String v27;
  unint64_t v28;
  Swift::String v29;
  unint64_t v30;
  unsigned __int8 *v31;
  uint64_t v32;
  void *v33;
  unsigned int v34;
  void *v35;
  uint64_t v36;
  unsigned int v37;
  Swift::String v38;
  unint64_t v39;
  Swift::String v40;
  uint64_t v41;
  unint64_t v42;
  Swift::String v43;
  unint64_t v44;
  Swift::String v45;
  unint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  Swift::Int v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  __int128 v54;
  uint64_t v55;
  Swift::Int v56;
  uint64_t v57;
  Swift::Int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  unsigned int v66;
  Swift::String v67;
  unint64_t v68;
  Swift::String v69;
  uint64_t v70;
  unint64_t v71;
  Swift::String v72;
  unint64_t v73;
  Swift::String v74;
  unint64_t v75;
  char v76;
  char v77;
  __int128 v78;
  unint64_t v79;
  unint64_t v80;
  _QWORD *v81;
  char *v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  _QWORD *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  BOOL v94;
  unint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  BOOL v104;
  uint64_t v105;
  char v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  BOOL v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  _QWORD *v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  unint64_t v134;
  uint64_t *v135;
  uint64_t v136;
  _QWORD *v137;
  uint64_t v138;
  char *v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  Swift::Int v143;
  Swift::Int v144;
  Swift::Int v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  Swift::Int v149;
  Swift::Int v150;
  Swift::Int v151;
  uint64_t v152;
  int v153;
  void *v154;
  uint64_t v155;
  unint64_t v156;
  uint64_t v157;

  v2 = v1;
  v4 = a1[1];
  result = _minimumMergeRunLength(_:)(v4);
  if (result >= v4)
  {
    if (v4 < 0)
      goto LABEL_179;
    if (v4)
      return sub_10007E758(0, v4, 1, a1);
    return result;
  }
  if (v4 >= 0)
    v6 = v4;
  else
    v6 = v4 + 1;
  if (v4 < -1)
    goto LABEL_178;
  v138 = result;
  v135 = a1;
  if (v4 <= 1)
  {
    v8 = (char *)_swiftEmptyArrayStorage;
    v147 = (char *)&_swiftEmptyArrayStorage[4];
    v137 = _swiftEmptyArrayStorage;
    if (v4 != 1)
    {
      v11 = _swiftEmptyArrayStorage[2];
LABEL_144:
      if (v11 >= 2)
      {
        v129 = *v135;
        do
        {
          v130 = v11 - 2;
          if (v11 < 2)
            goto LABEL_173;
          if (!v129)
            goto LABEL_186;
          v131 = *(_QWORD *)&v8[16 * v130 + 32];
          v132 = *(_QWORD *)&v8[16 * v11 + 24];
          result = sub_10007EA28((char *)(v129 + 24 * v131), (char *)(v129 + 24 * *(_QWORD *)&v8[16 * v11 + 16]), v129 + 24 * v132, v147);
          if (v2)
            break;
          if (v132 < v131)
            goto LABEL_174;
          result = swift_isUniquelyReferenced_nonNull_native(v8);
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_10007F150((uint64_t)v8);
            v8 = (char *)result;
          }
          if (v130 >= *((_QWORD *)v8 + 2))
            goto LABEL_175;
          v133 = &v8[16 * v130 + 32];
          *(_QWORD *)v133 = v131;
          *((_QWORD *)v133 + 1) = v132;
          v134 = *((_QWORD *)v8 + 2);
          if (v11 > v134)
            goto LABEL_176;
          result = (uint64_t)memmove(&v8[16 * v11 + 16], &v8[16 * v11 + 32], 16 * (v134 - v11));
          *((_QWORD *)v8 + 2) = v134 - 1;
          v11 = v134 - 1;
        }
        while (v134 > 2);
      }
LABEL_155:
      swift_bridgeObjectRelease(v8);
      v137[2] = 0;
      return swift_bridgeObjectRelease(v137);
    }
  }
  else
  {
    v7 = v6 >> 1;
    result = static Array._allocateBufferUninitialized(minimumCapacity:)(v6 >> 1, &type metadata for Name);
    *(_QWORD *)(result + 16) = v7;
    v137 = (_QWORD *)result;
    v147 = (char *)(result + 32);
  }
  v9 = 0;
  v10 = *a1;
  v136 = *a1 + 64;
  v8 = (char *)_swiftEmptyArrayStorage;
  v144 = v4;
  v148 = *a1;
  while (2)
  {
    v12 = v9;
    v13 = v9 + 1;
    v145 = v9;
    if (v9 + 1 >= v4)
      goto LABEL_64;
    v139 = v8;
    v141 = v2;
    v14 = v10 + 24 * v13;
    v15 = *(_QWORD *)v14;
    v16 = *(void **)(v14 + 8);
    v17 = *(unsigned __int8 *)(v14 + 16);
    v18 = v10 + 24 * v9;
    v19 = *(_QWORD *)v18;
    v20 = *(void **)(v18 + 8);
    v21 = *(unsigned __int8 *)(v18 + 16);
    if (v21 >> 6)
    {
      if (v21 >> 6 == 1)
      {
        v155 = 0;
        v156 = 0xE000000000000000;
        sub_100030508(v15, (uint64_t)v16, v17);
        sub_100030508(v19, (uint64_t)v20, v21);
        v22._countAndFlagsBits = 45;
        v22._object = (void *)0xE100000000000000;
        String.append(_:)(v22);
        Character.write<A>(to:)(&v155, v19, v20, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
        goto LABEL_22;
      }
      v155 = 45;
      v23 = 0xE100000000000000;
    }
    else
    {
      v155 = 11565;
      v23 = 0xE200000000000000;
    }
    v156 = v23;
    sub_100030508(v15, (uint64_t)v16, v17);
    sub_100030508(v19, (uint64_t)v20, v21);
    v24._countAndFlagsBits = v19;
    v24._object = v20;
    String.append(_:)(v24);
LABEL_22:
    v25 = v155;
    v26 = v156;
    if (v17 >> 6)
    {
      if (v17 >> 6 == 1)
      {
        v155 = 0;
        v156 = 0xE000000000000000;
        v27._countAndFlagsBits = 45;
        v27._object = (void *)0xE100000000000000;
        String.append(_:)(v27);
        Character.write<A>(to:)(&v155, v15, v16, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
        goto LABEL_28;
      }
      v155 = 45;
      v28 = 0xE100000000000000;
    }
    else
    {
      v155 = 11565;
      v28 = 0xE200000000000000;
    }
    v156 = v28;
    v29._countAndFlagsBits = v15;
    v29._object = v16;
    String.append(_:)(v29);
LABEL_28:
    v30 = v156;
    if (v25 == v155 && v26 == v156)
    {
      v153 = 0;
      v30 = v26;
    }
    else
    {
      v153 = _stringCompareWithSmolCheck(_:_:expecting:)(v25, v26, v155, v156, 1);
    }
    swift_bridgeObjectRelease(v26);
    swift_bridgeObjectRelease(v30);
    sub_10002DA24(v19, (uint64_t)v20, v21);
    result = sub_10002DA24(v15, (uint64_t)v16, v17);
    v4 = v144;
    v12 = v145;
    v13 = v145 + 2;
    if (v145 + 2 >= v144)
      goto LABEL_55;
    v149 = v145 + 2;
    v31 = (unsigned __int8 *)(v136 + 24 * v145);
    while (1)
    {
      v32 = *((_QWORD *)v31 - 2);
      v33 = (void *)*((_QWORD *)v31 - 1);
      v34 = *v31;
      v36 = *((_QWORD *)v31 - 5);
      v35 = (void *)*((_QWORD *)v31 - 4);
      v37 = *(v31 - 24);
      v157 = v32;
      if (v37 >> 6)
      {
        if (v37 >> 6 == 1)
        {
          v155 = 0;
          v156 = 0xE000000000000000;
          sub_100030508(v32, (uint64_t)v33, v34);
          sub_100030508(v36, (uint64_t)v35, v37);
          v38._countAndFlagsBits = 45;
          v38._object = (void *)0xE100000000000000;
          String.append(_:)(v38);
          Character.write<A>(to:)(&v155, v36, v35, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
          goto LABEL_40;
        }
        v155 = 45;
        v39 = 0xE100000000000000;
      }
      else
      {
        v155 = 11565;
        v39 = 0xE200000000000000;
      }
      v156 = v39;
      sub_100030508(v32, (uint64_t)v33, v34);
      sub_100030508(v36, (uint64_t)v35, v37);
      v40._countAndFlagsBits = v36;
      v40._object = v35;
      String.append(_:)(v40);
LABEL_40:
      v41 = v155;
      v42 = v156;
      if (!(v34 >> 6))
      {
        v155 = 11565;
        v44 = 0xE200000000000000;
LABEL_45:
        v156 = v44;
        v45._countAndFlagsBits = v157;
        v45._object = v33;
        String.append(_:)(v45);
        goto LABEL_46;
      }
      if (v34 >> 6 != 1)
      {
        v155 = 45;
        v44 = 0xE100000000000000;
        goto LABEL_45;
      }
      v155 = 0;
      v156 = 0xE000000000000000;
      v43._countAndFlagsBits = 45;
      v43._object = (void *)0xE100000000000000;
      String.append(_:)(v43);
      Character.write<A>(to:)(&v155, v157, v33, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
LABEL_46:
      v46 = v156;
      if (v41 == v155 && v42 == v156)
      {
        v47 = 0;
        v46 = v42;
      }
      else
      {
        v47 = _stringCompareWithSmolCheck(_:_:expecting:)(v41, v42, v155, v156, 1);
      }
      swift_bridgeObjectRelease(v42);
      swift_bridgeObjectRelease(v46);
      sub_10002DA24(v36, (uint64_t)v35, v37);
      result = sub_10002DA24(v157, (uint64_t)v33, v34);
      if (((v153 ^ v47) & 1) != 0)
        break;
      v31 += 24;
      if (v144 == ++v149)
      {
        v4 = v144;
        v13 = v144;
        goto LABEL_54;
      }
    }
    v4 = v144;
    v13 = v149;
LABEL_54:
    v12 = v145;
LABEL_55:
    v8 = v139;
    v2 = v141;
    v10 = v148;
    if ((v153 & 1) != 0)
    {
      if (v13 < v12)
        goto LABEL_180;
      if (v12 < v13)
      {
        v48 = 24 * v13;
        v49 = 24 * v12;
        v50 = v13;
        do
        {
          if (v12 != --v50)
          {
            if (!v148)
              goto LABEL_185;
            v51 = v148 + v49;
            v52 = v148 + v48;
            v53 = *(_BYTE *)(v148 + v49 + 16);
            v54 = *(_OWORD *)(v148 + v49);
            v55 = *(_QWORD *)(v148 + v48 - 8);
            *(_OWORD *)v51 = *(_OWORD *)(v148 + v48 - 24);
            *(_QWORD *)(v51 + 16) = v55;
            *(_OWORD *)(v52 - 24) = v54;
            *(_BYTE *)(v52 - 8) = v53;
          }
          ++v12;
          v48 -= 24;
          v49 += 24;
        }
        while (v12 < v50);
        v12 = v145;
      }
    }
LABEL_64:
    if (v13 >= v4)
      goto LABEL_96;
    if (__OFSUB__(v13, v12))
      goto LABEL_177;
    if (v13 - v12 >= v138)
    {
LABEL_95:
      v12 = v145;
      goto LABEL_96;
    }
    v12 = v145;
    v56 = v145 + v138;
    if (__OFADD__(v145, v138))
      goto LABEL_181;
    if (v56 >= v4)
      v56 = v4;
    if (v56 >= v145)
    {
      if (v13 != v56)
      {
        v142 = v2;
        v143 = v56;
        v140 = v8;
        v57 = v10 + 24 * v13;
        while (1)
        {
          v150 = v13;
          v58 = v145;
          v146 = v57;
          v59 = v57;
          while (1)
          {
            v60 = *(_QWORD *)v57;
            v61 = *(_QWORD *)(v57 + 8);
            v62 = *(unsigned __int8 *)(v57 + 16);
            v64 = *(_QWORD *)(v59 - 24);
            v59 -= 24;
            v63 = v64;
            v65 = *(void **)(v57 - 16);
            v66 = *(unsigned __int8 *)(v57 - 8);
            v157 = *(_QWORD *)v57;
            v154 = (void *)v61;
            v152 = v64;
            if (v66 >> 6)
            {
              if (v66 >> 6 == 1)
              {
                v155 = 0;
                v156 = 0xE000000000000000;
                sub_100030508(v60, v61, v62);
                sub_100030508(v63, (uint64_t)v65, v66);
                v67._countAndFlagsBits = 45;
                v67._object = (void *)0xE100000000000000;
                String.append(_:)(v67);
                Character.write<A>(to:)(&v155, v63, v65, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
                goto LABEL_82;
              }
              v155 = 45;
              v68 = 0xE100000000000000;
            }
            else
            {
              v155 = 11565;
              v68 = 0xE200000000000000;
            }
            v156 = v68;
            sub_100030508(v60, v61, v62);
            sub_100030508(v63, (uint64_t)v65, v66);
            v69._countAndFlagsBits = v63;
            v69._object = v65;
            String.append(_:)(v69);
LABEL_82:
            v70 = v155;
            v71 = v156;
            if (!(v62 >> 6))
            {
              v155 = 11565;
              v73 = 0xE200000000000000;
LABEL_87:
              v156 = v73;
              v74._countAndFlagsBits = v157;
              v74._object = v154;
              String.append(_:)(v74);
              goto LABEL_88;
            }
            if (v62 >> 6 != 1)
            {
              v155 = 45;
              v73 = 0xE100000000000000;
              goto LABEL_87;
            }
            v155 = 0;
            v156 = 0xE000000000000000;
            v72._countAndFlagsBits = 45;
            v72._object = (void *)0xE100000000000000;
            String.append(_:)(v72);
            Character.write<A>(to:)(&v155, v157, v154, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
LABEL_88:
            v75 = v156;
            if (v70 == v155 && v71 == v156)
              break;
            v76 = _stringCompareWithSmolCheck(_:_:expecting:)(v70, v71, v155, v156, 1);
            swift_bridgeObjectRelease(v71);
            swift_bridgeObjectRelease(v75);
            sub_10002DA24(v152, (uint64_t)v65, v66);
            result = sub_10002DA24(v157, (uint64_t)v154, v62);
            if ((v76 & 1) == 0)
              goto LABEL_74;
            if (!v148)
              goto LABEL_183;
            v77 = *(_BYTE *)(v57 + 16);
            v78 = *(_OWORD *)v57;
            *(_OWORD *)v57 = *(_OWORD *)v59;
            *(_QWORD *)(v57 + 16) = *(_QWORD *)(v59 + 16);
            *(_OWORD *)(v57 - 24) = v78;
            *(_BYTE *)(v57 - 8) = v77;
            ++v58;
            v57 = v59;
            if (v150 == v58)
              goto LABEL_74;
          }
          swift_bridgeObjectRelease_n(v71, 2);
          sub_10002DA24(v152, (uint64_t)v65, v66);
          result = sub_10002DA24(v157, (uint64_t)v154, v62);
LABEL_74:
          v13 = v150 + 1;
          v57 = v146 + 24;
          if (v150 + 1 == v143)
          {
            v2 = v142;
            v13 = v143;
            v8 = v140;
            v10 = v148;
            goto LABEL_95;
          }
        }
      }
LABEL_96:
      if (v13 < v12)
        goto LABEL_172;
      result = swift_isUniquelyReferenced_nonNull_native(v8);
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_10007F058(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
        v8 = (char *)result;
      }
      v80 = *((_QWORD *)v8 + 2);
      v79 = *((_QWORD *)v8 + 3);
      v11 = v80 + 1;
      if (v80 >= v79 >> 1)
      {
        result = (uint64_t)sub_10007F058((char *)(v79 > 1), v80 + 1, 1, v8);
        v8 = (char *)result;
      }
      *((_QWORD *)v8 + 2) = v11;
      v81 = v8 + 32;
      v82 = &v8[16 * v80 + 32];
      *(_QWORD *)v82 = v145;
      *((_QWORD *)v82 + 1) = v13;
      v151 = v13;
      if (!v80)
      {
        v11 = 1;
LABEL_14:
        v4 = v144;
        v9 = v151;
        if (v151 >= v144)
          goto LABEL_144;
        continue;
      }
LABEL_102:
      v83 = v11 - 1;
      if (v11 >= 4)
      {
        v88 = &v81[2 * v11];
        v89 = *(v88 - 8);
        v90 = *(v88 - 7);
        v94 = __OFSUB__(v90, v89);
        v91 = v90 - v89;
        if (v94)
          goto LABEL_161;
        v93 = *(v88 - 6);
        v92 = *(v88 - 5);
        v94 = __OFSUB__(v92, v93);
        v86 = v92 - v93;
        v87 = v94;
        if (v94)
          goto LABEL_162;
        v95 = v11 - 2;
        v96 = &v81[2 * v11 - 4];
        v98 = *v96;
        v97 = v96[1];
        v94 = __OFSUB__(v97, v98);
        v99 = v97 - v98;
        if (v94)
          goto LABEL_163;
        v94 = __OFADD__(v86, v99);
        v100 = v86 + v99;
        if (v94)
          goto LABEL_165;
        if (v100 >= v91)
        {
          v118 = &v81[2 * v83];
          v120 = *v118;
          v119 = v118[1];
          v94 = __OFSUB__(v119, v120);
          v121 = v119 - v120;
          if (v94)
            goto LABEL_171;
          v111 = v86 < v121;
        }
        else
        {
LABEL_115:
          if ((v87 & 1) != 0)
            goto LABEL_164;
          v95 = v11 - 2;
          v101 = &v81[2 * v11 - 4];
          v103 = *v101;
          v102 = v101[1];
          v104 = __OFSUB__(v102, v103);
          v105 = v102 - v103;
          v106 = v104;
          if (v104)
            goto LABEL_166;
          v107 = &v81[2 * v83];
          v109 = *v107;
          v108 = v107[1];
          v94 = __OFSUB__(v108, v109);
          v110 = v108 - v109;
          if (v94)
            goto LABEL_168;
          if (__OFADD__(v105, v110))
            goto LABEL_170;
          if (v105 + v110 < v86)
            goto LABEL_127;
          v111 = v86 < v110;
        }
        if (v111)
          v83 = v95;
      }
      else
      {
        if (v11 == 3)
        {
          v85 = *((_QWORD *)v8 + 4);
          v84 = *((_QWORD *)v8 + 5);
          v94 = __OFSUB__(v84, v85);
          v86 = v84 - v85;
          v87 = v94;
          goto LABEL_115;
        }
        v112 = *((_QWORD *)v8 + 4);
        v113 = *((_QWORD *)v8 + 5);
        v94 = __OFSUB__(v113, v112);
        v105 = v113 - v112;
        v106 = v94;
LABEL_127:
        if ((v106 & 1) != 0)
          goto LABEL_167;
        v114 = &v81[2 * v83];
        v116 = *v114;
        v115 = v114[1];
        v94 = __OFSUB__(v115, v116);
        v117 = v115 - v116;
        if (v94)
          goto LABEL_169;
        if (v117 < v105)
          goto LABEL_14;
      }
      v122 = v83 - 1;
      if (v83 - 1 >= v11)
      {
        __break(1u);
LABEL_158:
        __break(1u);
LABEL_159:
        __break(1u);
LABEL_160:
        __break(1u);
LABEL_161:
        __break(1u);
LABEL_162:
        __break(1u);
LABEL_163:
        __break(1u);
LABEL_164:
        __break(1u);
LABEL_165:
        __break(1u);
LABEL_166:
        __break(1u);
LABEL_167:
        __break(1u);
LABEL_168:
        __break(1u);
LABEL_169:
        __break(1u);
LABEL_170:
        __break(1u);
LABEL_171:
        __break(1u);
LABEL_172:
        __break(1u);
LABEL_173:
        __break(1u);
LABEL_174:
        __break(1u);
LABEL_175:
        __break(1u);
LABEL_176:
        __break(1u);
LABEL_177:
        __break(1u);
LABEL_178:
        __break(1u);
LABEL_179:
        __break(1u);
LABEL_180:
        __break(1u);
LABEL_181:
        __break(1u);
        break;
      }
      if (!v10)
        goto LABEL_184;
      v123 = v10;
      v124 = &v81[2 * v122];
      v125 = *v124;
      v126 = &v81[2 * v83];
      v127 = v126[1];
      result = sub_10007EA28((char *)(v123 + 24 * *v124), (char *)(v123 + 24 * *v126), v123 + 24 * v127, v147);
      if (v2)
        goto LABEL_155;
      if (v127 < v125)
        goto LABEL_158;
      if (v83 > *((_QWORD *)v8 + 2))
        goto LABEL_159;
      *v124 = v125;
      v81[2 * v122 + 1] = v127;
      v128 = *((_QWORD *)v8 + 2);
      if (v83 >= v128)
        goto LABEL_160;
      v11 = v128 - 1;
      result = (uint64_t)memmove(&v81[2 * v83], v126 + 2, 16 * (v128 - 1 - v83));
      *((_QWORD *)v8 + 2) = v128 - 1;
      v10 = v148;
      if (v128 <= 2)
        goto LABEL_14;
      goto LABEL_102;
    }
    break;
  }
  __break(1u);
LABEL_183:
  __break(1u);
LABEL_184:
  __break(1u);
LABEL_185:
  __break(1u);
LABEL_186:
  __break(1u);
  return result;
}

uint64_t sub_10007E758(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  Swift::String v12;
  unint64_t v13;
  Swift::String v14;
  uint64_t v15;
  unint64_t v16;
  Swift::String v17;
  unint64_t v18;
  Swift::String v19;
  unint64_t v20;
  char v21;
  char v22;
  __int128 v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;

  v25 = result;
  v28 = a3;
  if (a3 != a2)
  {
    v27 = *a4;
    v4 = *a4 + 24 * a3;
LABEL_6:
    v5 = v25;
    v26 = v4;
    v6 = v4;
    while (1)
    {
      v33 = *(_QWORD *)v4;
      v30 = *(void **)(v4 + 8);
      v7 = *(unsigned __int8 *)(v4 + 16);
      v9 = *(_QWORD *)(v6 - 24);
      v6 -= 24;
      v8 = v9;
      v10 = *(void **)(v4 - 16);
      v11 = *(unsigned __int8 *)(v4 - 8);
      v29 = (uint64_t)v10;
      if (v11 >> 6)
      {
        if (v11 >> 6 == 1)
        {
          v31 = 0;
          v32 = 0xE000000000000000;
          sub_100030508(v33, (uint64_t)v30, v7);
          sub_100030508(v8, (uint64_t)v10, v11);
          v12._countAndFlagsBits = 45;
          v12._object = (void *)0xE100000000000000;
          String.append(_:)(v12);
          Character.write<A>(to:)(&v31, v8, v10, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
          goto LABEL_13;
        }
        v31 = 45;
        v13 = 0xE100000000000000;
      }
      else
      {
        v31 = 11565;
        v13 = 0xE200000000000000;
      }
      v32 = v13;
      sub_100030508(v33, (uint64_t)v30, v7);
      sub_100030508(v8, (uint64_t)v10, v11);
      v14._countAndFlagsBits = v8;
      v14._object = v10;
      String.append(_:)(v14);
LABEL_13:
      v15 = v31;
      v16 = v32;
      if (!(v7 >> 6))
      {
        v31 = 11565;
        v18 = 0xE200000000000000;
LABEL_18:
        v32 = v18;
        v19._countAndFlagsBits = v33;
        v19._object = v30;
        String.append(_:)(v19);
        goto LABEL_19;
      }
      if (v7 >> 6 != 1)
      {
        v31 = 45;
        v18 = 0xE100000000000000;
        goto LABEL_18;
      }
      v31 = 0;
      v32 = 0xE000000000000000;
      v17._countAndFlagsBits = 45;
      v17._object = (void *)0xE100000000000000;
      String.append(_:)(v17);
      Character.write<A>(to:)(&v31, v33, v30, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
LABEL_19:
      v20 = v32;
      if (v15 == v31 && v16 == v32)
      {
        swift_bridgeObjectRelease_n(v16, 2);
        sub_10002DA24(v8, v29, v11);
        result = sub_10002DA24(v33, (uint64_t)v30, v7);
LABEL_5:
        v4 = v26 + 24;
        if (++v28 == a2)
          return result;
        goto LABEL_6;
      }
      v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, v31, v32, 1);
      swift_bridgeObjectRelease(v16);
      swift_bridgeObjectRelease(v20);
      sub_10002DA24(v8, v29, v11);
      result = sub_10002DA24(v33, (uint64_t)v30, v7);
      if ((v21 & 1) == 0)
        goto LABEL_5;
      if (!v27)
      {
        __break(1u);
        return result;
      }
      v22 = *(_BYTE *)(v4 + 16);
      v23 = *(_OWORD *)v4;
      *(_OWORD *)v4 = *(_OWORD *)v6;
      *(_QWORD *)(v4 + 16) = *(_QWORD *)(v6 + 16);
      *(_OWORD *)(v4 - 24) = v23;
      *(_BYTE *)(v4 - 8) = v22;
      ++v5;
      v4 = v6;
      if (v28 == v5)
        goto LABEL_5;
    }
  }
  return result;
}

uint64_t sub_10007EA28(char *__dst, char *__src, unint64_t a3, char *a4)
{
  char *v4;
  char *v5;
  char *v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  Swift::String v19;
  unint64_t v20;
  Swift::String v21;
  unint64_t v22;
  uint64_t v23;
  Swift::String v24;
  unint64_t v25;
  Swift::String v26;
  unint64_t v27;
  char v28;
  char *v29;
  char *v30;
  __int128 v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  char *v36;
  unsigned int v37;
  uint64_t v38;
  char *v39;
  unsigned int v40;
  Swift::String v41;
  unint64_t v42;
  Swift::String v43;
  unint64_t v44;
  uint64_t v45;
  Swift::String v46;
  unint64_t v47;
  Swift::String v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char *v53;
  unint64_t v54;
  __int128 v55;
  size_t v56;
  unsigned __int8 v58;
  uint64_t v59;
  unsigned __int8 v60;
  void *v62;
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  unint64_t v70;
  char *v71;

  v4 = a4;
  v5 = __src;
  v6 = __dst;
  v7 = __src - __dst;
  v8 = (__src - __dst) / 24;
  v9 = a3 - (_QWORD)__src;
  v10 = (uint64_t)(a3 - (_QWORD)__src) / 24;
  if (v8 >= v10)
  {
    v32 = 24 * v10;
    if (a4 != __src || &__src[v32] <= a4)
      memmove(a4, __src, 24 * v10);
    v12 = &v4[v32];
    if (v6 >= v5 || v9 < 24)
      goto LABEL_66;
    v33 = a3 - 24;
    v66 = v6;
    v68 = v4;
    while (1)
    {
      v34 = *((_QWORD *)v12 - 3);
      v35 = (void *)*((_QWORD *)v12 - 2);
      v36 = v12 - 24;
      v37 = *(v12 - 8);
      v38 = *((_QWORD *)v5 - 3);
      v39 = v5 - 24;
      v62 = (void *)*((_QWORD *)v5 - 2);
      v40 = *(v5 - 8);
      v71 = v5;
      v64 = v12;
      v59 = v38;
      v58 = v40;
      if (v40 >> 6)
      {
        if (v40 >> 6 == 1)
        {
          v69 = 0;
          v70 = 0xE000000000000000;
          sub_100030508(v34, (uint64_t)v35, v37);
          sub_100030508(v38, (uint64_t)v62, v40);
          v41._countAndFlagsBits = 45;
          v41._object = (void *)0xE100000000000000;
          String.append(_:)(v41);
          Character.write<A>(to:)(&v69, v38, v62, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
          goto LABEL_43;
        }
        v69 = 45;
        v42 = 0xE100000000000000;
      }
      else
      {
        v69 = 11565;
        v42 = 0xE200000000000000;
      }
      v70 = v42;
      sub_100030508(v34, (uint64_t)v35, v37);
      sub_100030508(v38, (uint64_t)v62, v40);
      v43._countAndFlagsBits = v38;
      v43._object = v62;
      String.append(_:)(v43);
LABEL_43:
      v45 = v69;
      v44 = v70;
      v60 = v37;
      if (!(v37 >> 6))
      {
        v69 = 11565;
        v47 = 0xE200000000000000;
LABEL_48:
        v70 = v47;
        v48._countAndFlagsBits = v34;
        v48._object = v35;
        String.append(_:)(v48);
        goto LABEL_49;
      }
      if (v37 >> 6 != 1)
      {
        v69 = 45;
        v47 = 0xE100000000000000;
        goto LABEL_48;
      }
      v69 = 0;
      v70 = 0xE000000000000000;
      v46._countAndFlagsBits = 45;
      v46._object = (void *)0xE100000000000000;
      String.append(_:)(v46);
      Character.write<A>(to:)(&v69, v34, v35, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
LABEL_49:
      v49 = v70;
      v50 = (uint64_t)v35;
      if (v45 == v69 && v44 == v70)
      {
        v51 = v34;
        v52 = 0;
        v49 = v44;
      }
      else
      {
        v51 = v34;
        v52 = _stringCompareWithSmolCheck(_:_:expecting:)(v45, v44, v69, v70, 1);
      }
      v53 = (char *)(v33 + 24);
      swift_bridgeObjectRelease(v44);
      swift_bridgeObjectRelease(v49);
      sub_10002DA24(v59, (uint64_t)v62, v58);
      sub_10002DA24(v51, v50, v60);
      if ((v52 & 1) != 0)
      {
        v4 = v68;
        v12 = v64;
        if (v53 == v71)
        {
          v5 = v39;
          v54 = (unint64_t)v66;
          if (v33 < (unint64_t)v71)
            goto LABEL_64;
          goto LABEL_63;
        }
        v5 = v39;
      }
      else
      {
        v4 = v68;
        v39 = v36;
        if (v53 == v64)
        {
          v12 = v36;
          v5 = v71;
          v54 = (unint64_t)v66;
          if (v33 < (unint64_t)v64)
            goto LABEL_64;
          goto LABEL_63;
        }
        v12 = v36;
        v5 = v71;
      }
      v54 = (unint64_t)v66;
LABEL_63:
      v55 = *(_OWORD *)v39;
      *(_QWORD *)(v33 + 16) = *((_QWORD *)v39 + 2);
      *(_OWORD *)v33 = v55;
LABEL_64:
      if ((unint64_t)v5 > v54)
      {
        v33 -= 24;
        if (v12 > v4)
          continue;
      }
      goto LABEL_66;
    }
  }
  v11 = 24 * v8;
  if (a4 != __dst || &__dst[v11] <= a4)
    memmove(a4, __dst, v11);
  v12 = &v4[v11];
  if ((unint64_t)v5 < a3 && v7 >= 24)
  {
    v63 = &v4[v11];
    do
    {
      v65 = v6;
      v67 = v4;
      v14 = *(_QWORD *)v5;
      v13 = (void *)*((_QWORD *)v5 + 1);
      v15 = v5[16];
      v16 = *(_QWORD *)v4;
      v17 = (void *)*((_QWORD *)v4 + 1);
      v18 = v4[16];
      v71 = v5;
      if (v18 >> 6)
      {
        if (v18 >> 6 == 1)
        {
          v69 = 0;
          v70 = 0xE000000000000000;
          sub_100030508(v14, (uint64_t)v13, v15);
          sub_100030508(v16, (uint64_t)v17, v18);
          v19._countAndFlagsBits = 45;
          v19._object = (void *)0xE100000000000000;
          String.append(_:)(v19);
          Character.write<A>(to:)(&v69, v16, v17, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
          goto LABEL_14;
        }
        v69 = 45;
        v20 = 0xE100000000000000;
      }
      else
      {
        v69 = 11565;
        v20 = 0xE200000000000000;
      }
      v70 = v20;
      sub_100030508(v14, (uint64_t)v13, v15);
      sub_100030508(v16, (uint64_t)v17, v18);
      v21._countAndFlagsBits = v16;
      v21._object = v17;
      String.append(_:)(v21);
LABEL_14:
      v23 = v69;
      v22 = v70;
      if (!(v15 >> 6))
      {
        v69 = 11565;
        v25 = 0xE200000000000000;
LABEL_19:
        v70 = v25;
        v26._countAndFlagsBits = v14;
        v26._object = v13;
        String.append(_:)(v26);
        goto LABEL_20;
      }
      if (v15 >> 6 != 1)
      {
        v69 = 45;
        v25 = 0xE100000000000000;
        goto LABEL_19;
      }
      v69 = 0;
      v70 = 0xE000000000000000;
      v24._countAndFlagsBits = 45;
      v24._object = (void *)0xE100000000000000;
      String.append(_:)(v24);
      Character.write<A>(to:)(&v69, v14, v13, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
LABEL_20:
      v27 = v70;
      if (v23 == v69 && v22 == v70)
      {
        swift_bridgeObjectRelease_n(v22, 2);
        sub_10002DA24(v16, (uint64_t)v17, v18);
        sub_10002DA24(v14, (uint64_t)v13, v15);
LABEL_26:
        v30 = v65;
        v29 = v67;
        v4 = v67 + 24;
        v5 = v71;
        if (v65 == v67)
          goto LABEL_28;
LABEL_27:
        v31 = *(_OWORD *)v29;
        *((_QWORD *)v30 + 2) = *((_QWORD *)v29 + 2);
        *(_OWORD *)v30 = v31;
        goto LABEL_28;
      }
      v28 = _stringCompareWithSmolCheck(_:_:expecting:)(v23, v22, v69, v70, 1);
      swift_bridgeObjectRelease(v22);
      swift_bridgeObjectRelease(v27);
      sub_10002DA24(v16, (uint64_t)v17, v18);
      sub_10002DA24(v14, (uint64_t)v13, v15);
      if ((v28 & 1) == 0)
        goto LABEL_26;
      v29 = v71;
      v5 = v71 + 24;
      v30 = v65;
      v4 = v67;
      if (v65 != v71)
        goto LABEL_27;
LABEL_28:
      v6 = v30 + 24;
      v12 = v63;
    }
    while (v4 < v63 && (unint64_t)v5 < a3);
  }
  v5 = v6;
LABEL_66:
  v56 = 24 * ((v12 - v4) / 24);
  if (v5 != v4 || v5 >= &v4[v56])
    memmove(v5, v4, v56);
  return 1;
}

char *sub_10007F058(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

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
    v10 = sub_100005104(&qword_1000B9DF0);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 16 * v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_10007F150(uint64_t a1)
{
  return sub_10007F058(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_10007F164(uint64_t a1)
{
  return sub_10004FF70(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_10007F178(uint64_t a1)
{
  return sub_100050B68(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

BOOL sub_10007F18C(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8) != 0;
}

uint64_t sub_10007F19C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;

  result = a1[1];
  if (result)
  {
    *a2 = *a1;
    a2[1] = result;
    return swift_bridgeObjectRetain(result);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10007F1B8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  char v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = *a1;
  v5 = a1[1];
  v6 = a2[1];
  v7 = v4 == *a2 && v5 == v6;
  if (v7 || (v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, *a2, v6, 0), result = 0, (v8 & 1) != 0))
  {
    v10 = a1[2];
    v11 = a1[3];
    v12 = a2[2];
    v13 = a2[3];
    v14 = v10 == v12 && v11 == v13;
    if (v14
      || (v15 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, v11, v12, v13, 0), result = 0, (v15 & 1) != 0))
    {
      v16 = a1[4];
      v17 = a1[5];
      v18 = a2[4];
      v19 = a2[5];
      if (v16 == v18 && v17 == v19)
        return 1;
      else
        return _stringCompareWithSmolCheck(_:_:expecting:)(v16, v17, v18, v19, 0);
    }
  }
  return result;
}

char *sub_10007F258(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *result;
  Swift::String v19;
  Swift::String v20;
  Swift::String v21;
  uint64_t v22;
  uint64_t v23;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0)
      v4 = a2 & 0xFFFFFFFFFFFFLL;
    v23 = v4;
    v22 = swift_bridgeObjectRetain(a1);
    v5 = (unsigned __int8 *)(v22 + 48);
    v6 = (char *)_swiftEmptyArrayStorage;
    while (1)
    {
      v7 = *((_QWORD *)v5 - 2);
      v8 = *((_QWORD *)v5 - 1);
      v9 = *v5;
      if (!(v9 >> 6))
        break;
      if (v9 >> 6 == 1)
      {
        v10 = v9 & 1 | 0x40;
LABEL_9:
        v11 = *((_QWORD *)v5 - 2);
        v12 = *((_QWORD *)v5 - 1);
        goto LABEL_10;
      }
      if (v8 | v7 || v9 != 128)
      {
        if (!v23)
        {
          _StringGuts.grow(_:)(54);
          v19._countAndFlagsBits = 0x272079654BLL;
          v19._object = (void *)0xE500000000000000;
          String.append(_:)(v19);
          swift_bridgeObjectRetain(a3);
          v20._countAndFlagsBits = a2;
          v20._object = (void *)a3;
          String.append(_:)(v20);
          swift_bridgeObjectRelease(a3);
          v21._object = (void *)0x800000010009D8E0;
          v21._countAndFlagsBits = 0xD00000000000002FLL;
          String.append(_:)(v21);
          result = (char *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "ArgumentParser/NameSpecification.swift", 38, 2, 141, 0);
          __break(1u);
          return result;
        }
        swift_bridgeObjectRetain(a3);
        v11 = String.subscript.getter(15, a2, a3);
        v12 = v17;
        swift_bridgeObjectRelease(a3);
        v10 = 64;
      }
      else
      {
        swift_bridgeObjectRetain(a3);
        v11 = sub_10004E9B4(45, 0xE100000000000000, a2, a3);
        v12 = v16;
        swift_bridgeObjectRelease(a3);
        v10 = 0;
      }
LABEL_10:
      sub_10003F6B0(v7, v8, v9);
      if ((swift_isUniquelyReferenced_nonNull_native(v6) & 1) == 0)
        v6 = sub_100057BB8(0, *((_QWORD *)v6 + 2) + 1, 1, v6);
      v14 = *((_QWORD *)v6 + 2);
      v13 = *((_QWORD *)v6 + 3);
      if (v14 >= v13 >> 1)
        v6 = sub_100057BB8((char *)(v13 > 1), v14 + 1, 1, v6);
      v5 += 24;
      *((_QWORD *)v6 + 2) = v14 + 1;
      v15 = &v6[24 * v14];
      *((_QWORD *)v15 + 4) = v11;
      *((_QWORD *)v15 + 5) = v12;
      v15[48] = v10;
      if (!--v3)
      {
        swift_bridgeObjectRelease(v22);
        return v6;
      }
    }
    v10 = (_BYTE)v9 << 7;
    goto LABEL_9;
  }
  return (char *)_swiftEmptyArrayStorage;
}

char *sub_10007F4E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::String v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[12];
  char v21;
  _QWORD v22[5];
  uint64_t v23;
  _BYTE v24[16];
  _QWORD v25[3];
  uint64_t v26;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return (char *)_swiftEmptyArrayStorage;
  v26 = a2 + 112;
  v18 = swift_bridgeObjectRetain(a1);
  v3 = (uint64_t *)(v18 + 40);
  v4 = (char *)_swiftEmptyArrayStorage;
  do
  {
    v7 = *(v3 - 1);
    v6 = *v3;
    v8 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*v3 + 16);
    v8(v20, v7, *v3);
    sub_10002CC24(v20);
    if ((v21 & 1) != 0)
    {
      v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 24))(v7, v6);
      v11 = v10;
      v19 = v10;
      sub_10002AACC(v26, (uint64_t)v24, &qword_1000B9720);
      sub_10002AACC((uint64_t)v24, (uint64_t)v25, &qword_1000B9720);
      if (v25[0] && v7 == v25[0])
      {
        v12._countAndFlagsBits = 0x6C75616665642820;
        v12._object = (void *)0xEA00000000002974;
        String.append(_:)(v12);
        v11 = v19;
      }
      v8(v22, v7, v6);
      v14 = v22[4];
      v13 = v23;
      swift_bridgeObjectRetain(v23);
      sub_10002CC24(v22);
      if ((swift_isUniquelyReferenced_nonNull_native(v4) & 1) == 0)
        v4 = sub_100058744(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
      v16 = *((_QWORD *)v4 + 2);
      v15 = *((_QWORD *)v4 + 3);
      if (v16 >= v15 >> 1)
        v4 = sub_100058744((char *)(v15 > 1), v16 + 1, 1, v4);
      *((_QWORD *)v4 + 2) = v16 + 1;
      v5 = &v4[48 * v16];
      *((_QWORD *)v5 + 4) = v9;
      *((_QWORD *)v5 + 5) = v11;
      *((_QWORD *)v5 + 6) = v14;
      *((_QWORD *)v5 + 7) = v13;
      *((_QWORD *)v5 + 8) = 0;
      *((_QWORD *)v5 + 9) = 0xE000000000000000;
    }
    v3 += 2;
    --v2;
  }
  while (v2);
  swift_bridgeObjectRelease(v18);
  return v4;
}

_QWORD *sub_10007F6BC(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  int64_t v3;
  unint64_t v4;
  char *v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char *v12;
  __int128 *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  Swift::String v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  BOOL v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  BOOL v61;
  uint64_t v62;
  _OWORD *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  Swift::String v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  _QWORD *v85;
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
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char v101;
  char v102;
  unint64_t v103;
  unint64_t v104;
  char *v105;
  char v106;
  uint64_t v107;
  _BOOL8 v108;
  uint64_t v109;
  char v110;
  unint64_t v111;
  char v112;
  unint64_t v113;
  unint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  BOOL v117;
  uint64_t v118;
  char v119;
  unint64_t v120;
  unint64_t v121;
  char *v122;
  unint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v131;
  char *v132;
  unint64_t v133;
  int64_t v134;
  char *v135;
  _QWORD *result;
  uint64_t v137;
  char *v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  char *v142;
  uint64_t v143;
  _QWORD *v144;
  void (*v145)(_QWORD *@<X8>);
  int64_t v146;
  char *v147;
  _QWORD *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  unint64_t v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  BOOL (*v158)(uint64_t);
  uint64_t v159;
  uint64_t (*v160)@<X0>(_QWORD *@<X0>, _QWORD *@<X8>);
  uint64_t v161;
  BOOL (*v162)(_QWORD *);
  uint64_t v163;
  uint64_t v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  unint64_t v177;
  uint64_t v178[3];

  if (!*(_QWORD *)(a1 + 16))
    return _swiftEmptyArrayStorage;
  v6 = (char *)a1;
  v137 = *(_QWORD *)(a1 + 16);
  v154 = sub_1000799D4((uint64_t)_swiftEmptyArrayStorage);
  v138 = v6;
  v7 = sub_10003076C(a2, (uint64_t)v6);
  v8 = (unint64_t)v7;
  v140 = v9;
  v10 = (void *)v7[2];
  if (!v10)
  {
    v145 = 0;
    v147 = (char *)_swiftEmptyArrayStorage;
    v142 = (char *)_swiftEmptyArrayStorage;
    v139 = (char *)_swiftEmptyArrayStorage;
LABEL_117:
    (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)&v138[16 * v137 + 24] + 16))(&v155);
    v125 = v164;
    v126 = swift_bridgeObjectRetain(v164);
    a2 = (uint64_t)sub_10007F4E0(v126, (uint64_t)&v155);
    swift_bridgeObjectRelease(v125);
    sub_10002CC24(&v155);
    v127 = sub_100005104(&qword_1000B96D8);
    v6 = (char *)swift_allocObject(v127, 80, 7);
    *((_OWORD *)v6 + 1) = xmmword_100096510;
    *((_QWORD *)v6 + 4) = 0;
    *((_QWORD *)v6 + 5) = 0;
    *((_QWORD *)v6 + 6) = v139;
    *((_QWORD *)v6 + 7) = 0;
    *((_QWORD *)v6 + 8) = 0xE000000000000000;
    v6[72] = 0;
    swift_bridgeObjectRetain(v139);
    v128 = swift_bridgeObjectRetain(v147);
    v11 = (uint64_t)sub_10007B560(v128, (uint64_t *)&v154);
    swift_bridgeObjectRelease(v139);
    swift_bridgeObjectRelease_n(v147, 2);
    sub_100056E20((char *)v11);
    v2 = *((_QWORD *)v6 + 2);
    v3 = v2 + 2;
    if (__OFADD__(v2, 2))
    {
LABEL_139:
      __break(1u);
    }
    else
    {
      v129 = swift_bridgeObjectRetain(v6);
      isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(v129);
      if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v11 = (uint64_t)v6, v3 > *((_QWORD *)v6 + 3) >> 1))
      {
        if ((uint64_t)v2 <= v3)
          v131 = v2 + 2;
        else
          v131 = v2;
        v11 = (uint64_t)sub_100058630(isUniquelyReferenced_nonNull_native, v131, 1, v6);
      }
      v3 = *(_QWORD *)(v11 + 16);
      v4 = *(_QWORD *)(v11 + 24);
      v2 = v3 + 1;
      swift_bridgeObjectRetain(v142);
      if (v3 < v4 >> 1)
        goto LABEL_125;
    }
    v11 = (uint64_t)sub_100058630((char *)(v4 > 1), v2, 1, (char *)v11);
LABEL_125:
    *(_QWORD *)(v11 + 16) = v2;
    v132 = (char *)(v11 + 48 * v3);
    *((_OWORD *)v132 + 2) = xmmword_100097E60;
    *((_QWORD *)v132 + 6) = v142;
    *((_QWORD *)v132 + 7) = 0;
    *((_QWORD *)v132 + 8) = 0xE000000000000000;
    v132[72] = 0;
    v133 = *(_QWORD *)(v11 + 24);
    v134 = v3 + 2;
    swift_bridgeObjectRetain(a2);
    if (v2 >= v133 >> 1)
      v11 = (uint64_t)sub_100058630((char *)(v133 > 1), v134, 1, (char *)v11);
    *(_QWORD *)(v11 + 16) = v134;
    v135 = (char *)(v11 + 48 * v2);
    *((_OWORD *)v135 + 2) = xmmword_100097E70;
    *((_QWORD *)v135 + 6) = a2;
    *((_QWORD *)v135 + 7) = 0;
    *((_QWORD *)v135 + 8) = 0xE000000000000000;
    v135[72] = 0;
    swift_bridgeObjectRelease(v140);
    swift_bridgeObjectRelease(v8);
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v142);
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(v154);
    sub_100080EF4((uint64_t)v145, 0);
    return (_QWORD *)v11;
  }
  v145 = 0;
  v11 = 0;
  v148 = v7 + 4;
  v146 = v7[2];
  v147 = (char *)_swiftEmptyArrayStorage;
  v142 = (char *)_swiftEmptyArrayStorage;
  v139 = (char *)_swiftEmptyArrayStorage;
  v144 = v7;
  while (1)
  {
    if (v11 >= (uint64_t)v10)
    {
      __break(1u);
LABEL_130:
      __break(1u);
LABEL_131:
      __break(1u);
      goto LABEL_132;
    }
    if (v11 < 0)
      goto LABEL_130;
    v6 = *(char **)(v8 + 16);
    if (v11 >= (unint64_t)v6)
      goto LABEL_131;
    v13 = (__int128 *)&v148[24 * v11];
    v14 = *v13;
    v15 = v13[1];
    v16 = v13[3];
    v167 = v13[2];
    v168 = v16;
    v165 = v14;
    v166 = v15;
    v17 = v13[4];
    v18 = v13[5];
    v19 = v13[7];
    v171 = v13[6];
    v172 = v19;
    v169 = v17;
    v170 = v18;
    v20 = v13[8];
    v21 = v13[9];
    v22 = v13[11];
    v175 = v13[10];
    v176 = v22;
    v173 = v20;
    v174 = v21;
    v2 = *((_QWORD *)&v166 + 1);
    v149 = v166;
    v150 = *((_QWORD *)&v169 + 1);
    v151 = v172;
    v152 = v170;
    v153 = *((_QWORD *)&v172 + 1);
    v23 = v11 + 1;
    if ((v168 & 1) != 0)
    {
      v143 = *((_QWORD *)&v166 + 1);
      v3 = (int64_t)v10;
      if ((void *)v23 != v10)
      {
        v8 = *(_QWORD *)(v167 + 16);
        v141 = v167;
        v2 = v167 + 32;
        v3 = v11 + 1;
        while (v3 < (uint64_t)v10)
        {
          if (v3 >= (uint64_t)v6)
            goto LABEL_133;
          v34 = v148[24 * v3 + 4];
          if (*(_QWORD *)(v34 + 16) != v8)
            goto LABEL_58;
          if (v8 && v34 != v141)
          {
            a2 = 0;
            v35 = v34 + 32;
            while (1)
            {
              v36 = (_QWORD *)(v35 + 24 * a2);
              v37 = v36[1];
              v38 = (_QWORD *)v36[2];
              v39 = (_QWORD *)(v2 + 24 * a2);
              v40 = v39[1];
              v41 = (_QWORD *)v39[2];
              v42 = *v36 == *v39 && v37 == v40;
              if (!v42 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v36, v37, *v39, v40, 0) & 1) == 0)
                break;
              v4 = v38[2];
              if (v4 != v41[2])
                break;
              if (v4)
                v43 = v38 == v41;
              else
                v43 = 1;
              if (!v43)
              {
                v44 = v38[4];
                v45 = v38[5];
                v46 = v41[4];
                v47 = v41[5];
                v48 = v44 == v46 && v45 == v47;
                if (!v48 && (_stringCompareWithSmolCheck(_:_:expecting:)(v44, v45, v46, v47, 0) & 1) == 0)
                  break;
                if (v4 != 1)
                {
                  v49 = v38[6];
                  v50 = v38[7];
                  v51 = v41[6];
                  v52 = v41[7];
                  v53 = v49 == v51 && v50 == v52;
                  if (!v53 && (_stringCompareWithSmolCheck(_:_:expecting:)(v49, v50, v51, v52, 0) & 1) == 0)
                    break;
                  v4 -= 2;
                  if (v4)
                  {
                    v54 = v41 + 9;
                    v55 = v38 + 9;
                    do
                    {
                      v56 = *(v55 - 1);
                      v57 = *v55;
                      v58 = *(v54 - 1);
                      v59 = *v54;
                      v60 = v56 == v58 && v57 == v59;
                      if (!v60 && (_stringCompareWithSmolCheck(_:_:expecting:)(v56, v57, v58, v59, 0) & 1) == 0)
                        goto LABEL_59;
                      v54 += 2;
                      v55 += 2;
                    }
                    while (--v4);
                  }
                }
              }
              if (++a2 == v8)
                goto LABEL_55;
            }
LABEL_59:
            v8 = (unint64_t)v144;
            v10 = (void *)v146;
            v23 = v11 + 1;
            goto LABEL_60;
          }
LABEL_55:
          v61 = __OFADD__(v3++, 1);
          v23 = v11 + 1;
          if (v61)
            goto LABEL_135;
          v10 = (void *)v146;
          if (v3 == v146)
          {
            v3 = v146;
LABEL_58:
            v8 = (unint64_t)v144;
            goto LABEL_60;
          }
        }
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
LABEL_60:
      v62 = sub_100005104(&qword_1000B9230);
      v63 = (_OWORD *)swift_allocObject(v62, 224, 7);
      v64 = v173;
      v65 = v175;
      v66 = v176;
      v63[11] = v174;
      v63[12] = v65;
      v63[13] = v66;
      v67 = v169;
      v68 = v171;
      v69 = v172;
      v63[7] = v170;
      v63[8] = v68;
      v63[9] = v69;
      v63[10] = v64;
      v70 = v165;
      v71 = v166;
      v63[1] = xmmword_100096510;
      v63[2] = v70;
      v72 = v167;
      v73 = v168;
      v63[3] = v71;
      v63[4] = v72;
      v63[5] = v73;
      v63[6] = v67;
      if (v3 <= v11)
        goto LABEL_136;
      if ((uint64_t)v10 < v3)
        goto LABEL_137;
      v155 = (uint64_t)v63;
      sub_10002D724((uint64_t)&v165);
      sub_10002D724((uint64_t)&v165);
      swift_bridgeObjectRetain(v8);
      swift_bridgeObjectRetain(v140);
      sub_100056F0C(v23, v3, v8, v140);
      v74 = v155;
      v156 = sub_10007D3F8;
      v157 = 0;
      swift_bridgeObjectRetain(v155);
      v75 = sub_100005104(&qword_1000B9E50);
      v76 = sub_100080E54(&qword_1000B9E58, &qword_1000B9E50, &qword_1000B9E60, &qword_1000B9E68);
      v27 = BidirectionalCollection<>.joined(separator:)(47, 0xE100000000000000, v75, v76);
      v78 = v77;
      swift_bridgeObjectRelease(v155);
      v79 = v143;
      if (v143)
      {
        v155 = 0x746C756166656428;
        v156 = (void *)0xEA0000000000203ALL;
        v80 = v149;
        String.append(_:)(*(Swift::String *)(&v79 - 1));
        v81._countAndFlagsBits = 41;
        v81._object = (void *)0xE100000000000000;
        String.append(_:)(v81);
        v82 = 0x746C756166656428;
        v83 = 0xEA0000000000203ALL;
        v84 = *(_QWORD *)(v74 + 16);
        if (!v84)
          goto LABEL_72;
      }
      else
      {
        v82 = 0;
        v83 = 0xE000000000000000;
        v84 = *(_QWORD *)(v155 + 16);
        if (!v84)
        {
LABEL_72:
          v8 = v78;
          v87 = 0;
          v86 = 0;
LABEL_74:
          swift_bridgeObjectRelease(v74);
          v89 = sub_100005104(&qword_1000B9DF8);
          v90 = swift_allocObject(v89, 64, 7);
          *(_OWORD *)(v90 + 16) = xmmword_1000970B0;
          *(_QWORD *)(v90 + 32) = v87;
          *(_QWORD *)(v90 + 40) = v86;
          *(_QWORD *)(v90 + 48) = v82;
          *(_QWORD *)(v90 + 56) = v83;
          v155 = v90;
          v156 = sub_10007D458;
          v157 = 0;
          v158 = sub_10007F18C;
          v159 = 0;
          v160 = sub_10007F19C;
          v161 = 0;
          v162 = sub_10007D45C;
          v163 = 0;
          v91 = sub_100005104(&qword_1000B9E00);
          v92 = sub_100080D6C(&qword_1000B9E08, &qword_1000B9E00, (void (*)(void))sub_100080D48, (uint64_t)&protocol conformance descriptor for <> LazyFilterSequence<A>);
          a2 = BidirectionalCollection<>.joined(separator:)(32, 0xE100000000000000, v91, v92);
          v4 = v93;
          swift_bridgeObjectRelease(v90);
          goto LABEL_77;
        }
      }
      v85 = (_QWORD *)(v74 + 96);
      while (1)
      {
        v87 = *(v85 - 1);
        v86 = *v85;
        v88 = HIBYTE(*v85) & 0xFLL;
        if ((*v85 & 0x2000000000000000) == 0)
          v88 = v87 & 0xFFFFFFFFFFFFLL;
        if (v88)
          break;
        v85 += 24;
        if (!--v84)
          goto LABEL_72;
      }
      v8 = v78;
      swift_bridgeObjectRetain(*v85);
      goto LABEL_74;
    }
    v24 = *((_QWORD *)&v168 + 1);
    v25 = v169;
    sub_10002D724((uint64_t)&v165);
    v27 = sub_100084E38();
    if (v2)
    {
      v28 = HIBYTE(v2) & 0xF;
      v29 = v149;
      v8 = v26;
      if ((v2 & 0x2000000000000000) == 0)
        v28 = v149 & 0xFFFFFFFFFFFFLL;
      if (v28)
      {
        v30 = v2;
        String.append(_:)(*(Swift::String *)&v29);
        v31._countAndFlagsBits = 41;
        v31._object = (void *)0xE100000000000000;
        String.append(_:)(v31);
        v33 = 0x746C756166656428;
        v32 = 0xEA0000000000203ALL;
      }
      else
      {
        v33 = 0;
        v32 = 0;
      }
    }
    else
    {
      v8 = v26;
      v32 = 0;
      v33 = v149;
    }
    v94 = sub_100005104(&qword_1000B9DF8);
    v95 = swift_allocObject(v94, 64, 7);
    *(_OWORD *)(v95 + 16) = xmmword_1000970B0;
    *(_QWORD *)(v95 + 32) = v24;
    *(_QWORD *)(v95 + 40) = v25;
    *(_QWORD *)(v95 + 48) = v33;
    *(_QWORD *)(v95 + 56) = v32;
    v155 = v95;
    v156 = sub_10007D458;
    v157 = 0;
    v158 = sub_10007F18C;
    v159 = 0;
    v160 = sub_10007F19C;
    v161 = 0;
    v162 = sub_1000819A4;
    v163 = 0;
    swift_bridgeObjectRetain(v25);
    v96 = sub_100005104(&qword_1000B9E00);
    v97 = sub_100080D6C(&qword_1000B9E08, &qword_1000B9E00, (void (*)(void))sub_100080D48, (uint64_t)&protocol conformance descriptor for <> LazyFilterSequence<A>);
    a2 = BidirectionalCollection<>.joined(separator:)(32, 0xE100000000000000, v96, v97);
    v4 = v98;
    swift_bridgeObjectRelease(v95);
    v3 = v23;
LABEL_77:
    v11 = v3;
    v3 = v153;
    if ((v153 & 0x2000000000000000) != 0)
      v99 = HIBYTE(v153) & 0xF;
    else
      v99 = v151 & 0xFFFFFFFFFFFFLL;
    sub_10005EC08(&v165, &v177);
    if (!v99)
    {
      sub_10005EC08(&v177, v178);
      if (v178[0])
      {
        swift_bridgeObjectRetain(v152);
        if ((swift_isUniquelyReferenced_nonNull_native(v142) & 1) == 0)
          v142 = sub_100058744(0, *((_QWORD *)v142 + 2) + 1, 1, v142);
        v2 = *((_QWORD *)v142 + 2);
        v113 = *((_QWORD *)v142 + 3);
        v6 = (char *)(v2 + 1);
        if (v2 >= v113 >> 1)
          v142 = sub_100058744((char *)(v113 > 1), v2 + 1, 1, v142);
        *((_QWORD *)v142 + 2) = v6;
        v12 = &v142[48 * v2];
        *((_QWORD *)v12 + 4) = v27;
        *((_QWORD *)v12 + 5) = v8;
        *((_QWORD *)v12 + 6) = a2;
        *((_QWORD *)v12 + 7) = v4;
        *((_QWORD *)v12 + 8) = v150;
        *((_QWORD *)v12 + 9) = v152;
      }
      else
      {
        swift_bridgeObjectRetain(v153);
        swift_bridgeObjectRetain(v152);
        if ((swift_isUniquelyReferenced_nonNull_native(v139) & 1) == 0)
          v139 = sub_100058744(0, *((_QWORD *)v139 + 2) + 1, 1, v139);
        v2 = *((_QWORD *)v139 + 2);
        v123 = *((_QWORD *)v139 + 3);
        v6 = (char *)(v2 + 1);
        if (v2 >= v123 >> 1)
          v139 = sub_100058744((char *)(v123 > 1), v2 + 1, 1, v139);
        *((_QWORD *)v139 + 2) = v6;
        v124 = &v139[48 * v2];
        *((_QWORD *)v124 + 4) = v27;
        *((_QWORD *)v124 + 5) = v8;
        *((_QWORD *)v124 + 6) = a2;
        *((_QWORD *)v124 + 7) = v4;
        *((_QWORD *)v124 + 8) = v150;
        *((_QWORD *)v124 + 9) = v152;
        swift_bridgeObjectRelease(v153);
      }
      sub_10002D8A4((uint64_t)&v165);
      goto LABEL_6;
    }
    v6 = (char *)v154;
    v100 = *(_QWORD *)(v154 + 16);
    swift_bridgeObjectRetain_n(v153, 2);
    swift_bridgeObjectRetain(v152);
    sub_100080ECC(&v177);
    if (!v100
      || (swift_bridgeObjectRetain(v154),
          sub_100023BB8(v151, v153),
          v102 = v101,
          swift_bridgeObjectRelease(v154),
          (v102 & 1) == 0))
    {
      swift_bridgeObjectRetain(v153);
      if ((swift_isUniquelyReferenced_nonNull_native(v147) & 1) == 0)
        v147 = sub_100057AB8(0, *((_QWORD *)v147 + 2) + 1, 1, v147);
      v104 = *((_QWORD *)v147 + 2);
      v103 = *((_QWORD *)v147 + 3);
      if (v104 >= v103 >> 1)
        v147 = sub_100057AB8((char *)(v103 > 1), v104 + 1, 1, v147);
      *((_QWORD *)v147 + 2) = v104 + 1;
      v105 = &v147[16 * v104];
      *((_QWORD *)v105 + 4) = v151;
      *((_QWORD *)v105 + 5) = v153;
      v6 = (char *)v154;
    }
    sub_100080EF4((uint64_t)v145, 0);
    v2 = swift_isUniquelyReferenced_nonNull_native(v6);
    v155 = (uint64_t)v6;
    v3 = sub_100023BB8(v151, v153);
    v107 = *((_QWORD *)v6 + 2);
    v108 = (v106 & 1) == 0;
    v109 = v107 + v108;
    if (__OFADD__(v107, v108))
      goto LABEL_134;
    v110 = v106;
    if (*((_QWORD *)v6 + 3) >= v109)
    {
      if ((v2 & 1) == 0)
      {
        sub_1000707FC();
        v6 = (char *)v155;
      }
      goto LABEL_99;
    }
    sub_1000712CC(v109, v2);
    v6 = (char *)v155;
    v111 = sub_100023BB8(v151, v153);
    if ((v110 & 1) != (v112 & 1))
      break;
    v3 = v111;
LABEL_99:
    v154 = (unint64_t)v6;
    swift_bridgeObjectRelease(0x8000000000000000);
    v114 = (unint64_t)v6;
    if ((v110 & 1) == 0)
    {
      *(_QWORD *)&v6[8 * ((unint64_t)v3 >> 6) + 64] |= 1 << v3;
      v115 = (uint64_t *)(*((_QWORD *)v6 + 6) + 16 * v3);
      *v115 = v151;
      v115[1] = v153;
      *(_QWORD *)(*((_QWORD *)v6 + 7) + 8 * v3) = _swiftEmptyArrayStorage;
      v116 = *((_QWORD *)v6 + 2);
      v2 = v116 + 1;
      v117 = __OFADD__(v116, 1);
      swift_bridgeObjectRetain(v6);
      if (v117)
        goto LABEL_138;
      *((_QWORD *)v6 + 2) = v2;
      v114 = v153;
    }
    swift_bridgeObjectRetain(v114);
    v118 = *((_QWORD *)v6 + 7);
    swift_bridgeObjectRelease(v6);
    v6 = *(char **)(v118 + 8 * v3);
    v119 = swift_isUniquelyReferenced_nonNull_native(v6);
    *(_QWORD *)(v118 + 8 * v3) = v6;
    if ((v119 & 1) == 0)
    {
      v6 = sub_100058744(0, *((_QWORD *)v6 + 2) + 1, 1, v6);
      *(_QWORD *)(v118 + 8 * v3) = v6;
    }
    v121 = *((_QWORD *)v6 + 2);
    v120 = *((_QWORD *)v6 + 3);
    v2 = v121 + 1;
    if (v121 >= v120 >> 1)
    {
      v6 = sub_100058744((char *)(v120 > 1), v121 + 1, 1, v6);
      *(_QWORD *)(v118 + 8 * v3) = v6;
    }
    *((_QWORD *)v6 + 2) = v2;
    v122 = &v6[48 * v121];
    *((_QWORD *)v122 + 4) = v27;
    *((_QWORD *)v122 + 5) = v8;
    *((_QWORD *)v122 + 6) = a2;
    *((_QWORD *)v122 + 7) = v4;
    *((_QWORD *)v122 + 8) = v150;
    *((_QWORD *)v122 + 9) = v152;
    sub_100080F04(&v177);
    a2 = v153;
    swift_bridgeObjectRelease(v153);
    sub_10002D8A4((uint64_t)&v165);
    swift_bridgeObjectRelease(v153);
    v145 = sub_10007D488;
    v10 = (void *)v146;
LABEL_6:
    v8 = (unint64_t)v144;
    if ((void *)v11 == v10)
      goto LABEL_117;
  }
  result = (_QWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

_QWORD *sub_100080428@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  Swift::String v23;
  Swift::String v24;
  void (*v25)(_QWORD *__return_ptr, _QWORD);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  Swift::String v46;
  Swift::String v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  Swift::String v52;
  uint64_t v53;
  void *v54;
  Swift::String v55;
  Swift::String v56;
  _QWORD *result;
  uint64_t v58;
  uint64_t v59;
  uint64_t v62;
  _BYTE v63[24];
  _QWORD v64[2];
  uint64_t v65;
  _QWORD v66[6];
  uint64_t v67;
  _QWORD v68[10];
  uint64_t v69;
  _QWORD v70[4];
  __int128 v71;
  _QWORD v72[8];
  __int128 v73;
  _OWORD v74[4];
  uint64_t v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  _BYTE v80[16];
  _BYTE v81[16];
  __int128 v82;
  uint64_t v83;
  uint64_t v84;

  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "ArgumentParser/HelpGenerator.swift", 34, 2, 97, 0);
    __break(1u);
    result = (_QWORD *)swift_release(v3);
    __break(1u);
    return result;
  }
  v6 = a1 + 16 * v4;
  v7 = *(_QWORD *)(v6 + 16);
  v62 = *(_QWORD *)(v6 + 24);
  v8 = sub_10004D160(v7, *(_QWORD *)(v62 + 8), a2, 0, 0, 0);
  v58 = v9;
  v59 = v8;
  *(_QWORD *)v63 = a1;
  *(_QWORD *)&v74[0] = _swiftEmptyArrayStorage;
  swift_bridgeObjectRetain(a1);
  sub_10004FDF4(0, v4, 0);
  v10 = _swiftEmptyArrayStorage;
  v11 = a1 + 40;
  do
  {
    v12 = (*(uint64_t (**)(void))(*(_QWORD *)v11 + 24))();
    v14 = v13;
    *(_QWORD *)&v74[0] = v10;
    v16 = v10[2];
    v15 = v10[3];
    if (v16 >= v15 >> 1)
    {
      sub_10004FDF4((char *)(v15 > 1), v16 + 1, 1);
      v10 = *(_QWORD **)&v74[0];
    }
    v10[2] = v16 + 1;
    v17 = &v10[2 * v16];
    v17[4] = v12;
    v17[5] = v14;
    v11 += 16;
    --v4;
  }
  while (v4);
  *(_QWORD *)&v74[0] = v10;
  v18 = sub_100005104(&qword_1000B90C8);
  v19 = sub_1000062F8((unint64_t *)&qword_1000B90D0, &qword_1000B90C8, (uint64_t)&protocol conformance descriptor for [A]);
  v20 = BidirectionalCollection<>.joined(separator:)(32, 0xE100000000000000, v18, v19);
  v22 = v21;
  swift_release(v10);
  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)(a1 + 40) + 16))(v64);
  sub_10002AACC((uint64_t)&v65, (uint64_t)v81, &qword_1000B9110);
  sub_10002E7A0((uint64_t)v81);
  sub_10002CC24(v64);
  sub_10002AACC((uint64_t)v81, (uint64_t)&v82, &qword_1000B9110);
  if (*((_QWORD *)&v82 + 1))
  {
    v74[0] = v82;
    v23._countAndFlagsBits = 32;
    v23._object = (void *)0xE100000000000000;
    String.append(_:)(v23);
    v24._countAndFlagsBits = v20;
    v24._object = v22;
    String.append(_:)(v24);
    swift_bridgeObjectRelease(v22);
    v22 = (void *)*((_QWORD *)&v74[0] + 1);
    v20 = *(_QWORD *)&v74[0];
  }
  v25 = *(void (**)(_QWORD *__return_ptr, _QWORD))(v62 + 16);
  v25(v66, v7);
  sub_10002AACC((uint64_t)&v67, (uint64_t)v80, &qword_1000B9110);
  sub_10002E7A0((uint64_t)v80);
  sub_10002CC24(v66);
  sub_10002AACC((uint64_t)v80, (uint64_t)&v83, &qword_1000B9110);
  v26 = v84;
  if (!v84)
  {
    v28 = sub_100005104(&qword_1000B98F0);
    v29 = swift_allocObject(v28, 48, 7);
    *(_OWORD *)(v29 + 16) = xmmword_100096510;
    *(_QWORD *)(v29 + 32) = v59;
    *(_QWORD *)(v29 + 40) = v58;
    v30 = sub_100079598((uint64_t)_swiftEmptyArrayStorage);
    swift_bridgeObjectRelease(v30);
    v31 = sub_10008C304(v29);
    v32 = swift_bridgeObjectRetain(v31);
    v33 = sub_100078CA4(v32);
    swift_release(v31);
    v34 = *(_QWORD *)(v33 + 16);
    if (v34)
    {
      sub_100005104(qword_1000B9608);
      v35 = (void *)static _DictionaryStorage.allocate(capacity:)(v34);
    }
    else
    {
      v35 = &_swiftEmptyDictionarySingleton;
    }
    *(_QWORD *)&v74[0] = v35;
    sub_10007AA54(v33, 1, v74);
    swift_bridgeObjectRelease(v33);
    v36 = *(_QWORD *)&v74[0];
    swift_setDeallocating(v29);
    swift_arrayDestroy(v29 + 32, *(_QWORD *)(v29 + 16), &type metadata for ArgumentSet);
    swift_deallocClassInstance(v29, 32, 7);
    v37 = sub_1000847CC(v20, v22, v31, v36);
    v39 = v38;
    swift_release(v36);
    swift_release(v31);
    swift_bridgeObjectRelease(v22);
    *(_QWORD *)&v74[0] = v37;
    *((_QWORD *)&v74[0] + 1) = v39;
    swift_bridgeObjectRetain(v39);
    ((void (*)(_QWORD *__return_ptr, uint64_t, uint64_t))v25)(v68, v7, v62);
    v40 = v69;
    v79 = v69;
    swift_bridgeObjectRetain(v69);
    sub_10002CC24(v68);
    v41 = *(_QWORD *)(v40 + 16);
    sub_10002ABC8(&v79);
    if (!v41)
    {
      swift_bridgeObjectRelease(v39);
LABEL_22:
      v26 = *((_QWORD *)&v74[0] + 1);
      v27 = *(_QWORD *)&v74[0];
      goto LABEL_23;
    }
    v42 = sub_10007B4E8(v37, v39);
    v44 = v43;
    swift_bridgeObjectRelease(v39);
    if (v44)
    {
      if (v42 == 32 && v44 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease(0xE100000000000000);
LABEL_21:
        v47._countAndFlagsBits = 0x6D6D6F636275733CLL;
        v47._object = (void *)0xEC0000003E646E61;
        String.append(_:)(v47);
        goto LABEL_22;
      }
      v45 = _stringCompareWithSmolCheck(_:_:expecting:)(v42, v44, 32, 0xE100000000000000, 0);
      swift_bridgeObjectRelease(v44);
      if ((v45 & 1) != 0)
        goto LABEL_21;
    }
    v46._countAndFlagsBits = 32;
    v46._object = (void *)0xE100000000000000;
    String.append(_:)(v46);
    goto LABEL_21;
  }
  v27 = v83;
  swift_bridgeObjectRelease(v58);
  swift_bridgeObjectRelease(v59);
  swift_bridgeObjectRelease(v22);
LABEL_23:
  ((void (*)(_QWORD *__return_ptr, uint64_t, uint64_t))v25)(v70, v7, v62);
  v78 = v71;
  v48 = v71;
  swift_bridgeObjectRetain(*((_QWORD *)&v71 + 1));
  sub_10002CC24(v70);
  *(_OWORD *)&v63[8] = v78;
  swift_bridgeObjectRetain(*((_QWORD *)&v48 + 1));
  ((void (*)(_QWORD *__return_ptr, uint64_t, uint64_t))v25)(v72, v7, v62);
  v77 = v73;
  v49 = v73;
  swift_bridgeObjectRetain(*((_QWORD *)&v73 + 1));
  sub_10002CC24(v72);
  sub_100030564((uint64_t)&v77);
  v50 = HIBYTE(*((_QWORD *)&v49 + 1)) & 0xFLL;
  if ((*((_QWORD *)&v49 + 1) & 0x2000000000000000) == 0)
    v50 = v49 & 0xFFFFFFFFFFFFLL;
  if (v50)
  {
    sub_100030564((uint64_t)&v78);
    v51 = HIBYTE(*((_QWORD *)&v48 + 1)) & 0xFLL;
    if ((*((_QWORD *)&v48 + 1) & 0x2000000000000000) == 0)
      v51 = v48 & 0xFFFFFFFFFFFFLL;
    if (v51)
    {
      v52._countAndFlagsBits = 10;
      v52._object = (void *)0xE100000000000000;
      String.append(_:)(v52);
    }
    ((void (*)(_OWORD *__return_ptr, uint64_t, uint64_t))v25)(v74, v7, v62);
    v53 = v75;
    v54 = v76;
    swift_bridgeObjectRetain(v76);
    sub_10002CC24(v74);
    v55._countAndFlagsBits = v53;
    v55._object = v54;
    String.append(_:)(v55);
    swift_bridgeObjectRelease(v54);
    v56._countAndFlagsBits = 10;
    v56._object = (void *)0xE100000000000000;
    String.append(_:)(v56);
    swift_bridgeObjectRelease(0xE100000000000000);
  }
  else
  {
    sub_100030564((uint64_t)&v78);
  }
  result = sub_10007F6BC(a1, a2);
  *(_OWORD *)a3 = *(_OWORD *)v63;
  *(_QWORD *)(a3 + 16) = *(_QWORD *)&v63[16];
  *(_QWORD *)(a3 + 24) = v27;
  *(_QWORD *)(a3 + 32) = v26;
  *(_QWORD *)(a3 + 40) = result;
  *(_QWORD *)(a3 + 48) = _swiftEmptyArrayStorage;
  return result;
}

uint64_t sub_100080A88(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  int64_t v4;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  Swift::String v24;
  Swift::String v25;
  Swift::String v26;
  uint64_t v28;
  uint64_t v31;

  v4 = *(_QWORD *)(a4 + 16);
  if (!v4)
    return 0;
  swift_bridgeObjectRetain(a4);
  sub_10004FDF4(0, v4, 0);
  v28 = a4;
  v7 = (uint64_t *)(a4 + 72);
  do
  {
    v8 = *(v7 - 2);
    v9 = *v7;
    v31 = *(v7 - 4);
    swift_bridgeObjectRetain(v31);
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    v10 = sub_10007CE2C(a1);
    v12 = v11;
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v8);
    swift_bridgeObjectRelease(v31);
    v14 = _swiftEmptyArrayStorage[2];
    v13 = _swiftEmptyArrayStorage[3];
    if (v14 >= v13 >> 1)
      sub_10004FDF4((char *)(v13 > 1), v14 + 1, 1);
    v7 += 6;
    _swiftEmptyArrayStorage[2] = v14 + 1;
    v15 = &_swiftEmptyArrayStorage[2 * v14];
    v15[4] = v10;
    v15[5] = v12;
    --v4;
  }
  while (v4);
  swift_bridgeObjectRelease(v28);
  v16 = sub_100005104(&qword_1000B90C8);
  v17 = sub_1000062F8((unint64_t *)&qword_1000B90D0, &qword_1000B90C8, (uint64_t)&protocol conformance descriptor for [A]);
  v18 = BidirectionalCollection<>.joined(separator:)(0, 0xE000000000000000, v16, v17);
  v20 = v19;
  swift_release(_swiftEmptyArrayStorage);
  v21 = 0xEB0000000073646ELL;
  v22 = 0xE700000000000000;
  if (a3 != 2)
    v22 = a3;
  if (a3 != 1)
    v21 = v22;
  if (a3)
    v23 = v21;
  else
    v23 = 0xE900000000000073;
  v24 = String.uppercased()();
  sub_100080D20(a2, a3);
  swift_bridgeObjectRelease(v23);
  String.append(_:)(v24);
  swift_bridgeObjectRelease(v24._object);
  v25._countAndFlagsBits = 2618;
  v25._object = (void *)0xE200000000000000;
  String.append(_:)(v25);
  swift_bridgeObjectRetain(0xE000000000000000);
  v26._countAndFlagsBits = v18;
  v26._object = v20;
  String.append(_:)(v26);
  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(0xE000000000000000);
  return 0;
}

uint64_t sub_100080D20(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 3)
    return swift_bridgeObjectRetain(a2);
  return result;
}

uint64_t sub_100080D34(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 3)
    return swift_bridgeObjectRelease(a2);
  return result;
}

uint64_t sub_100080D48()
{
  return sub_100080D6C(&qword_1000B9E10, &qword_1000B9E18, (void (*)(void))sub_100080DD0, (uint64_t)&protocol conformance descriptor for <> LazyMapSequence<A, B>);
}

uint64_t sub_100080D6C(unint64_t *a1, uint64_t *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v8 = sub_10000593C(a2);
    a3();
    result = swift_getWitnessTable(a4, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100080DD0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000B9E20;
  if (!qword_1000B9E20)
  {
    v1 = sub_10000593C(&qword_1000B9E28);
    sub_100080E54(&qword_1000B9E30, &qword_1000B9E38, &qword_1000B9E40, &qword_1000B9E48);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> LazyFilterSequence<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000B9E20);
  }
  return result;
}

uint64_t sub_100080E54(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v8 = sub_10000593C(a2);
    sub_1000062F8(a3, a4, (uint64_t)&protocol conformance descriptor for [A]);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> LazyMapSequence<A, B>, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t *sub_100080ECC(unint64_t *a1)
{
  sub_10002D810(*a1);
  return a1;
}

uint64_t sub_100080EF4(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

unint64_t *sub_100080F04(unint64_t *a1)
{
  sub_10002D990(*a1);
  return a1;
}

_QWORD *initializeWithCopy for HelpGenerator.Section.Element(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

_QWORD *assignWithCopy for HelpGenerator.Section.Element(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  v6 = a2[3];
  v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[4] = a2[4];
  v8 = a2[5];
  v9 = a1[5];
  a1[5] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

__n128 initializeWithTake for HelpGenerator.Section.Element(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

_QWORD *assignWithTake for HelpGenerator.Section.Element(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a2[1];
  v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  v6 = a2[3];
  v7 = a1[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  v8 = a2[5];
  v9 = a1[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease(v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for HelpGenerator.Section.Element(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HelpGenerator.Section.Element(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
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
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HelpGenerator.Section.Element()
{
  return &type metadata for HelpGenerator.Section.Element;
}

uint64_t destroy for HelpGenerator(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  swift_bridgeObjectRelease(a1[2]);
  swift_bridgeObjectRelease(a1[4]);
  swift_bridgeObjectRelease(a1[5]);
  return swift_bridgeObjectRelease(a1[6]);
}

uint64_t *initializeWithCopy for HelpGenerator(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v6 = a2[2];
  v5 = a2[3];
  a1[2] = v6;
  a1[3] = v5;
  v7 = a2[4];
  v8 = a2[5];
  a1[4] = v7;
  a1[5] = v8;
  v9 = a2[6];
  a1[6] = v9;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  return a1;
}

uint64_t *assignWithCopy for HelpGenerator(uint64_t *a1, uint64_t *a2)
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

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[1] = a2[1];
  v6 = a2[2];
  v7 = a1[2];
  a1[2] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[3] = a2[3];
  v8 = a2[4];
  v9 = a1[4];
  a1[4] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  v10 = a2[5];
  v11 = a1[5];
  a1[5] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  v12 = a2[6];
  v13 = a1[6];
  a1[6] = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  return a1;
}

_QWORD *assignWithTake for HelpGenerator(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *a1;
  *a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease(v4);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = a1[2];
  a1[1] = *(_QWORD *)(a2 + 8);
  a1[2] = v5;
  swift_bridgeObjectRelease(v6);
  a1[3] = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease(a1[4]);
  v7 = a1[5];
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease(v7);
  v8 = a1[6];
  a1[6] = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease(v8);
  return a1;
}

ValueMetadata *type metadata accessor for HelpGenerator()
{
  return &type metadata for HelpGenerator;
}

uint64_t destroy for HelpGenerator.Section(_QWORD *a1)
{
  unint64_t v2;

  v2 = a1[1];
  if (v2 >= 3)
    swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(a1[2]);
  return swift_bridgeObjectRelease(a1[4]);
}

uint64_t initializeWithCopy for HelpGenerator.Section(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  if (v4 >= 3)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v4;
    swift_bridgeObjectRetain(v4);
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v7);
  return a1;
}

uint64_t assignWithCopy for HelpGenerator.Section(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (v4 >= 3)
  {
    if (v5 >= 3)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v7 = *(_QWORD *)(a2 + 8);
      *(_QWORD *)(a1 + 8) = v7;
      swift_bridgeObjectRetain(v7);
      swift_bridgeObjectRelease(v4);
      goto LABEL_8;
    }
    sub_100081484(a1);
    goto LABEL_6;
  }
  if (v5 < 3)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRetain(v6);
LABEL_8:
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v10 = *(_QWORD *)(a2 + 32);
  v11 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t sub_100081484(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for String - 1) + 8))();
  return a1;
}

__n128 initializeWithTake for HelpGenerator.Section(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for HelpGenerator.Section(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a1 + 8);
  if (v4 >= 3)
  {
    v5 = *(_QWORD *)(a2 + 8);
    if (v5 >= 3)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = v5;
      swift_bridgeObjectRelease(v4);
      goto LABEL_6;
    }
    sub_100081484(a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  v6 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease(v6);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  swift_bridgeObjectRelease(v8);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for HelpGenerator.Section(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 41))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HelpGenerator.Section(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 41) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HelpGenerator.Section()
{
  return &type metadata for HelpGenerator.Section;
}

unint64_t sub_1000815F8()
{
  unint64_t result;

  result = qword_1000B9E70;
  if (!qword_1000B9E70)
  {
    result = swift_getWitnessTable(&unk_10009AC78, &type metadata for HelpGenerator.Section.Element);
    atomic_store(result, (unint64_t *)&qword_1000B9E70);
  }
  return result;
}

_QWORD *initializeWithCopy for HelpGenerator.DiscussionSection(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

_QWORD *assignWithCopy for HelpGenerator.DiscussionSection(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  v6 = a2[3];
  v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

_QWORD *assignWithTake for HelpGenerator.DiscussionSection(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a2[1];
  v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  v6 = a2[3];
  v7 = a1[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  return a1;
}

ValueMetadata *type metadata accessor for HelpGenerator.DiscussionSection()
{
  return &type metadata for HelpGenerator.DiscussionSection;
}

unint64_t destroy for HelpGenerator.Section.Header(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease(result);
  return result;
}

uint64_t _s14ArgumentParser13HelpGeneratorV7SectionV6HeaderOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain(v3);
  }
  return a1;
}

_QWORD *assignWithCopy for HelpGenerator.Section.Header(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a1[1];
  v5 = a2[1];
  if (v4 < 0xFFFFFFFF)
  {
    if (v5 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      v7 = a2[1];
      a1[1] = v7;
      swift_bridgeObjectRetain(v7);
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v5 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease(a1[1]);
    goto LABEL_7;
  }
  *a1 = *a2;
  v6 = a2[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t assignWithTake for HelpGenerator.Section.Header(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;

  v4 = *(_QWORD *)(a1 + 8);
  if (v4 < 0xFFFFFFFF)
    goto LABEL_5;
  v5 = *(_QWORD *)(a2 + 8);
  if (v5 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease(v4);
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for HelpGenerator.Section.Header(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFD && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483645);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 2;
  if (v4 >= 4)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HelpGenerator.Section.Header(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 2;
  }
  return result;
}

uint64_t sub_100081948(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_100081960(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for HelpGenerator.Section.Header()
{
  return &type metadata for HelpGenerator.Section.Header;
}

uint64_t sub_100081990(uint64_t a1, uint64_t a2)
{
  return String.init(argument:)(*(Swift::String *)&a1).value._countAndFlagsBits;
}

uint64_t sub_1000819A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t result;

  if (!a7 || a7 == 2)
    return swift_bridgeObjectRetain(a2);
  if (a7 == 1)
  {
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a4);
    return swift_bridgeObjectRetain(a6);
  }
  return result;
}

uint64_t destroy for MessageInfo(uint64_t a1)
{
  return sub_10004CBB4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
}

uint64_t initializeWithCopy for MessageInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  sub_1000819A8(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_BYTE *)(a1 + 48) = v9;
  return a1;
}

uint64_t assignWithCopy for MessageInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  sub_1000819A8(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9);
  v10 = *(_QWORD *)a1;
  v11 = *(_QWORD *)(a1 + 8);
  v12 = *(_QWORD *)(a1 + 16);
  v13 = *(_QWORD *)(a1 + 24);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  v16 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v9;
  sub_10004CBB4(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

uint64_t assignWithTake for MessageInfo(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;

  v3 = *(_BYTE *)(a2 + 48);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v11 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v3;
  sub_10004CBB4(v4, v6, v5, v7, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageInfo(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 49))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MessageInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 49) = 0;
    if (a2)
      *(_BYTE *)(result + 48) = -(char)a2;
  }
  return result;
}

uint64_t sub_100081C14(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 48);
}

uint64_t sub_100081C1C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 48) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MessageInfo()
{
  return &type metadata for MessageInfo;
}

uint64_t sub_100081C34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  unint64_t v22;
  unint64_t v23;
  uint64_t result;
  uint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
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
  unint64_t v52;
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
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  int64_t v89;
  uint64_t v90;
  _QWORD *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  _QWORD *v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  unsigned __int8 v108;
  unsigned __int8 v109;
  unsigned int v110;
  _QWORD *v111;
  uint64_t v112;
  uint64_t v113;
  Swift::String v114;
  Swift::String v115;
  Swift::String v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  void *v120;
  Swift::String v121;
  Swift::String v122;
  Swift::String v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  void *v135;
  Swift::String v136;
  void *v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  char *v141;
  uint64_t v142;
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
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  unint64_t v162;
  unint64_t v163;
  uint64_t v164;
  unint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  char v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  unint64_t v182;
  unint64_t v183;
  uint64_t v184;
  unint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  _QWORD *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  int64_t v203;
  _QWORD *v204;
  uint64_t v205;
  __int128 v206;
  unint64_t v207;
  unint64_t v208;
  uint64_t v209;
  uint64_t v210;
  _QWORD *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  __int128 v215;
  uint64_t v216;
  uint64_t v217;
  __int128 v218;
  uint64_t v219;
  uint64_t v220;
  char v221;
  _QWORD *v222;
  unint64_t v223;
  unint64_t v224;
  unint64_t v225;
  unint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
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
  uint64_t v242;
  uint64_t v243;
  unint64_t v244;
  unint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  unint64_t v255;
  unint64_t v256;
  uint64_t v257;
  uint64_t DynamicType;
  unint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
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
  uint64_t v273;
  uint64_t v274;
  _QWORD *v275;
  uint64_t v276;
  __int128 *v277;
  uint64_t v278;
  uint64_t v279;
  unint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  __int128 v289;
  uint64_t v290;
  uint64_t v291;
  _QWORD *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  _QWORD *v297;
  _QWORD v298[3];
  uint64_t v299;
  _QWORD v300[3];
  uint64_t v301;
  _QWORD v302[2];
  char v303;
  uint64_t v304;
  uint64_t v305;
  unint64_t v306;
  __int128 v307;
  uint64_t v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  unsigned __int8 v313;
  __int128 v314;
  uint64_t v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  uint64_t v320;
  __int128 v321;
  uint64_t v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  Swift::String v327;

  v302[0] = a1;
  swift_errorRetain(a1);
  v8 = sub_100005104(&qword_1000B98A0);
  v9 = swift_dynamicCast(&v307, v302, v8, &type metadata for CommandError, 0);
  v290 = a1;
  if ((_DWORD)v9)
  {
    v281 = v8;
    v288 = a3;
    *(_QWORD *)&v289 = a2;
    v11 = *((_QWORD *)&v307 + 1);
    v10 = v307;
    v12 = *((_QWORD *)&v309 + 1);
    v15 = *((_QWORD *)&v310 + 1);
    v13 = v310;
    v14 = v311;
    v16 = v312;
    v296 = v308;
    v297 = (_QWORD *)*((_QWORD *)&v311 + 1);
    v293 = v309;
    switch(v313)
    {
      case 0u:
        v295 = *((_QWORD *)&v312 + 1);
        v17 = *((_QWORD *)&v310 + 1);
        v18 = v312;
        v19 = swift_bridgeObjectRetain(v307);
        sub_100080428(v19, v11, (uint64_t)&v320);
        swift_bridgeObjectRelease(v10);
        v20 = v13;
        v21 = v14;
        v294 = sub_10007B6A8(0, 1);
        v23 = v22;
        swift_errorRelease(v290);
        swift_bridgeObjectRelease(v10);
        sub_10006749C(v11, v296, v293, v12, v20, v17, v21, (uint64_t)v297, v18, v295, 0);
        sub_10004DBA8(&v320);
        result = swift_errorRelease(v302[0]);
        v25 = 0;
        v288 = 0;
        *(_QWORD *)&v289 = 0;
        v26 = 0;
        v27 = 0;
        v11 = v294;
        v28 = v23;
        goto LABEL_48;
      case 1u:
        v282 = v307;
        v62 = v309;
        v63 = *((_QWORD *)&v312 + 1);
        v287 = *((_QWORD *)&v307 + 1);
        v64 = v311;
        v291 = v311;
        v65 = v312;
        v281 = sub_10004C608(v289, v288);
        v285 = v66;
        sub_100067314(v287, v296, v62, v12, v13, v15, v64, (uint64_t)v297, v65, v63, 1);
        sub_100067314(v287, v296, v62, v12, v13, v15, v291, (uint64_t)v297, v65, v63, 1);
        v67 = sub_10002E7C8(v281, v285, v287, v296);
        v280 = v199;
        v285 = sub_10002E1A0(v67, v199, v200, v201);
        v281 = v202;
        swift_errorRelease(v290);
        swift_bridgeObjectRelease(v282);
        sub_10006749C(v287, v296, v293, v12, v13, v15, v291, (uint64_t)v297, v65, v63, 1);
        sub_10006749C(v287, v296, v293, v12, v13, v15, v291, (uint64_t)v297, v65, v63, 1);
        swift_bridgeObjectRelease(v280);
        result = swift_errorRelease(v302[0]);
        v25 = 0;
        v288 = 0;
        *(_QWORD *)&v289 = 0;
        v26 = 0;
        v27 = 0;
        v11 = v285;
        v28 = v281;
        goto LABEL_48;
      case 2u:
        v58 = v307;
        v59 = a4;
        v60 = *((_QWORD *)&v312 + 1);
        v294 = *((_QWORD *)&v310 + 1);
        v61 = v312;
        swift_errorRelease(v290);
        v28 = v296;
        swift_bridgeObjectRetain(v296);
        swift_bridgeObjectRelease(v58);
        v276 = v60;
        a4 = v59;
        sub_10006749C(v11, v296, v293, v12, v13, v294, v14, (uint64_t)v297, v61, v276, 2);
        result = swift_errorRelease(v302[0]);
        v25 = 0;
        v288 = 0;
        *(_QWORD *)&v289 = 0;
        v26 = 0;
        v27 = 0;
        goto LABEL_48;
      case 0xFu:
        v68 = v310 | *((_QWORD *)&v310 + 1) | v311;
        v69 = *((_QWORD *)&v311 + 1) | v312 | *((_QWORD *)&v312 + 1);
        if (!((unint64_t)v309 | v296 | *((_QWORD *)&v307 + 1) | *((_QWORD *)&v309 + 1) | v68 | v69))
        {
          v295 = *((_QWORD *)&v312 + 1);
          v283 = v310;
          v291 = v311;
          v203 = *(_QWORD *)(v307 + 16);
          v204 = _swiftEmptyArrayStorage;
          v286 = a4;
          v287 = *((_QWORD *)&v307 + 1);
          v284 = *((_QWORD *)&v309 + 1);
          if (v203)
          {
            v292 = (_QWORD *)v312;
            v294 = *((_QWORD *)&v310 + 1);
            *(_QWORD *)&v314 = _swiftEmptyArrayStorage;
            swift_bridgeObjectRetain(v307);
            sub_10004FDF4(0, v203, 0);
            v204 = (_QWORD *)v314;
            v205 = v10 + 40;
            do
            {
              (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v205 + 16))(&v320);
              v206 = v326;
              swift_bridgeObjectRetain(*((_QWORD *)&v326 + 1));
              sub_10002CC24(&v320);
              *(_QWORD *)&v314 = v204;
              v208 = v204[2];
              v207 = v204[3];
              if (v208 >= v207 >> 1)
              {
                sub_10004FDF4((char *)(v207 > 1), v208 + 1, 1);
                v204 = (_QWORD *)v314;
              }
              v204[2] = v208 + 1;
              *(_OWORD *)&v204[2 * v208 + 4] = v206;
              v205 += 16;
              --v203;
            }
            while (v203);
            v9 = swift_bridgeObjectRelease(v10);
            v15 = v294;
            v16 = (uint64_t)v292;
          }
          *(_QWORD *)&v314 = v204;
          v209 = v204[2];
          if (v209)
          {
            v210 = v209 - 1;
            v211 = &v204[2 * v209 + 3];
            while (1)
            {
              v212 = *(v211 - 1) & 0xFFFFFFFFFFFFLL;
              if ((*v211 & 0x2000000000000000) != 0)
                v212 = HIBYTE(*v211) & 0xFLL;
              if (v212)
                break;
              v211 -= 2;
              if (--v210 == -1)
              {
                v213 = v16;
                goto LABEL_74;
              }
            }
            v213 = v16;
          }
          else
          {
            v213 = v16;
          }
LABEL_74:
          __chkstk_darwin(v9);
          v277 = &v314;
          v222 = sub_100033664((_QWORD *(*)(uint64_t *__return_ptr, uint64_t *))sub_100083D34, (uint64_t)&v275, v220, v221);
          v224 = v223;
          swift_bridgeObjectRelease(v204);
          v225 = 0xD000000000000013;
          if (v224)
            v225 = (unint64_t)v222;
          v294 = v225;
          v226 = 0x800000010009DC60;
          if (v224)
            v226 = v224;
          v292 = (_QWORD *)v226;
          swift_errorRelease(v290);
          swift_bridgeObjectRelease(v10);
          v227 = v295;
          v275 = (_QWORD *)v213;
          v228 = v213;
          v229 = v287;
          v230 = (uint64_t)v297;
          v231 = v293;
          v232 = v283;
          v233 = v284;
          v234 = v291;
          sub_10006749C(v287, v296, v293, v284, v283, v15, v291, (uint64_t)v297, (uint64_t)v275, v295, 15);
          sub_10006749C(v229, v296, v231, v233, v232, v15, v234, v230, v228, v227, 15);
          result = swift_errorRelease(v302[0]);
          v25 = 0;
          v288 = 0;
          *(_QWORD *)&v289 = 0;
          v26 = 0;
          v27 = 0;
          v11 = v294;
          v28 = (unint64_t)v292;
          goto LABEL_47;
        }
        if (*((_QWORD *)&v307 + 1) == 1 && !((unint64_t)v309 | v296 | *((_QWORD *)&v309 + 1) | v68 | v69))
        {
          v286 = a4;
          v70 = *((_QWORD *)&v312 + 1);
          v71 = *((_QWORD *)&v310 + 1);
          v72 = v312;
          v73 = swift_bridgeObjectRetain(v307);
          sub_100077CF4(v73, (uint64_t)&v314);
          v321 = v314;
          v320 = 0;
          v322 = v315;
          v323 = v316;
          v324 = v317;
          v325 = v318;
          v326 = v319;
          v74 = v72;
          v75 = v13;
          v11 = sub_100076DD0();
          v76 = v12;
          v78 = v77;
          swift_errorRelease(v290);
          swift_bridgeObjectRelease(v10);
          v276 = v70;
          a4 = v286;
          sub_10006749C(1, v296, v293, v76, v75, v71, v14, (uint64_t)v297, v74, v276, 15);
          sub_10004DC0C((uint64_t *)&v314);
          result = swift_errorRelease(v302[0]);
          v25 = 0;
          v288 = 0;
          *(_QWORD *)&v289 = 0;
          v26 = 0;
          v27 = 0;
          v28 = v78;
          goto LABEL_48;
        }
LABEL_13:
        v286 = a4;
        v79 = *((_QWORD *)&v312 + 1);
        v80 = v313;
        v81 = *((_QWORD *)&v311 + 1);
        v294 = *((_QWORD *)&v310 + 1);
        v291 = v311;
        v82 = v310;
        v83 = v312;
        v84 = v309;
        swift_bridgeObjectRetain(v307);
        v287 = v11;
        sub_100067314(v11, v296, v84, v12, v82, v294, v291, v81, v83, v79, v80);
        swift_bridgeObjectRelease(v10);
        v285 = v80;
        LOBYTE(v277) = v80;
        v55 = v296;
        v295 = v79;
        v276 = v79;
        a4 = v286;
        v292 = (_QWORD *)v83;
        v275 = (_QWORD *)v83;
        v283 = v82;
        v57 = v291;
        sub_10006749C(v11, v296, v84, v12, v82, v294, v291, v81, (uint64_t)v275, v276, (char)v277);
        swift_errorRelease(v302[0]);
        v56 = v294;
        break;
      default:
        goto LABEL_13;
    }
  }
  else
  {
    swift_errorRelease(v302[0]);
    *(_QWORD *)&v314 = a1;
    swift_errorRetain(a1);
    if (swift_dynamicCast(&v320, &v314, v8, &type metadata for ParserError, 0))
    {
      v29 = v321;
      v286 = a4;
      v30 = *((_QWORD *)&v321 + 1);
      v31 = v322;
      v296 = *((_QWORD *)&v323 + 1);
      v297 = (_QWORD *)v323;
      v294 = *((_QWORD *)&v324 + 1);
      v295 = v324;
      v32 = a3;
      v33 = *((_QWORD *)&v325 + 1);
      v292 = (_QWORD *)v320;
      v293 = v325;
      v34 = v326;
      v35 = sub_100005104(&qword_1000B90C0);
      v36 = swift_allocObject(v35, 48, 7);
      *(_OWORD *)(v36 + 16) = xmmword_100096510;
      *(_QWORD *)(v36 + 32) = sub_10004C608(a2, a3);
      *(_QWORD *)(v36 + 40) = v37;
      v38 = sub_10005134C();
      v39 = swift_allocError(&type metadata for CommandError, v38, 0, 0);
      v40 = (uint64_t)v292;
      v41 = v293;
      *(_QWORD *)v42 = v36;
      *(_QWORD *)(v42 + 8) = v40;
      v43 = v29;
      *(_QWORD *)(v42 + 16) = v29;
      *(_QWORD *)(v42 + 24) = v30;
      v44 = v30;
      v291 = v30;
      v287 = v31;
      v46 = v296;
      v45 = (uint64_t)v297;
      *(_QWORD *)(v42 + 32) = v31;
      *(_QWORD *)(v42 + 40) = v45;
      v48 = v294;
      v47 = v295;
      *(_QWORD *)(v42 + 48) = v46;
      *(_QWORD *)(v42 + 56) = v47;
      *(_QWORD *)(v42 + 64) = v48;
      *(_QWORD *)(v42 + 72) = v41;
      *(_QWORD *)(v42 + 80) = v33;
      *(_BYTE *)(v42 + 88) = v34;
      v49 = v40;
      v50 = v43;
      sub_100067314(v40, v43, v44, v31, v45, v46, v47, v48, v41, v33, v34);
      sub_100081C34(&v307, v39, a2, v32);
      v28 = *((_QWORD *)&v307 + 1);
      v51 = v307;
      v25 = v308;
      v52 = v310;
      v288 = *((_QWORD *)&v309 + 1);
      *(_QWORD *)&v289 = v309;
      v27 = BYTE8(v310);
      swift_errorRelease(v290);
      LOBYTE(v277) = v34;
      v11 = v51;
      sub_10006749C(v49, v50, v291, v287, (uint64_t)v297, v296, v295, v294, v293, v33, (char)v277);
      result = swift_errorRelease(v314);
      v26 = v52;
      a4 = v286;
      goto LABEL_48;
    }
    v281 = v8;
    swift_errorRelease(v314);
    v53 = sub_100005104(&qword_1000B90C0);
    v10 = swift_allocObject(v53, 48, 7);
    *(_OWORD *)(v10 + 16) = xmmword_100096510;
    v288 = a3;
    *(_QWORD *)&v289 = a2;
    *(_QWORD *)(v10 + 32) = sub_10004C608(a2, a3);
    *(_QWORD *)(v10 + 40) = v54;
    swift_errorRetain(a1);
    v55 = 0;
    v292 = 0;
    v293 = 0;
    v12 = 0;
    v283 = 0;
    v56 = 0;
    v57 = 0;
    v297 = 0;
    v295 = 0;
    v285 = 13;
    v11 = a1;
  }
  v284 = v12;
  v294 = v56;
  v291 = v57;
  v287 = v11;
  v296 = v55;
  v85 = swift_bridgeObjectRetain(v10);
  sub_100080428(v85, 0, (uint64_t)&v314);
  swift_bridgeObjectRelease(v10);
  v86 = sub_10007D498();
  v88 = v87;
  sub_10004DBA8((uint64_t *)&v314);
  v280 = v86;
  v305 = v86;
  v306 = v88;
  v89 = *(_QWORD *)(v10 + 16);
  v282 = v10;
  v286 = a4;
  if (v89)
  {
    v320 = (uint64_t)_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain(v10);
    swift_bridgeObjectRetain(v88);
    sub_10004FDF4(0, v89, 0);
    v90 = v10;
    v91 = (_QWORD *)v320;
    v92 = v90 + 40;
    do
    {
      v93 = (*(uint64_t (**)(void))(*(_QWORD *)v92 + 24))();
      v95 = v94;
      v320 = (uint64_t)v91;
      v97 = v91[2];
      v96 = v91[3];
      if (v97 >= v96 >> 1)
      {
        sub_10004FDF4((char *)(v96 > 1), v97 + 1, 1);
        v91 = (_QWORD *)v320;
      }
      v91[2] = v97 + 1;
      v98 = &v91[2 * v97];
      v98[4] = v93;
      v98[5] = v95;
      v92 += 16;
      --v89;
    }
    while (v89);
    v99 = v282;
    swift_bridgeObjectRelease(v282);
    a4 = v286;
  }
  else
  {
    swift_bridgeObjectRetain(v88);
    v99 = v10;
    v91 = _swiftEmptyArrayStorage;
  }
  v320 = (uint64_t)v91;
  v100 = sub_100005104(&qword_1000B90C8);
  v101 = sub_10005EC18();
  v279 = BidirectionalCollection<>.joined(separator:)(32, 0xE100000000000000, v100, v101);
  v103 = v102;
  swift_bridgeObjectRelease(v91);
  swift_bridgeObjectRetain(v99);
  v104 = sub_100032880(0, v99);
  v105 = sub_10005CF90(v104);
  v107 = v106;
  v109 = v108;
  v110 = v108;
  swift_bridgeObjectRelease(v99);
  swift_bridgeObjectRelease(v104);
  swift_bridgeObjectRelease(v88);
  if (v110 <= 0xFD)
  {
    v113 = HIBYTE(v88) & 0xF;
    if ((v88 & 0x2000000000000000) == 0)
      v113 = v280 & 0xFFFFFFFFFFFFLL;
    v112 = v291;
    if (v113)
    {
      v114._countAndFlagsBits = 10;
      v114._object = (void *)0xE100000000000000;
      String.append(_:)(v114);
    }
    v320 = 0;
    *(_QWORD *)&v321 = 0xE000000000000000;
    _StringGuts.grow(_:)(35);
    swift_bridgeObjectRelease(v321);
    v320 = 0x27206565532020;
    *(_QWORD *)&v321 = 0xE700000000000000;
    v115._countAndFlagsBits = v279;
    v115._object = v103;
    String.append(_:)(v115);
    swift_bridgeObjectRelease(v103);
    v116._countAndFlagsBits = 32;
    v116._object = (void *)0xE100000000000000;
    String.append(_:)(v116);
    v327._countAndFlagsBits = v105;
    v117 = (uint64_t)v107;
    v327._object = v107;
    v118 = sub_10006D63C(v327, v109);
    v120 = v119;
    sub_10002DA3C(v105, v117, v109);
    v121._countAndFlagsBits = v118;
    v121._object = v120;
    String.append(_:)(v121);
    swift_bridgeObjectRelease(v120);
    v122._countAndFlagsBits = 0xD000000000000017;
    v122._object = (void *)0x800000010009DC40;
    String.append(_:)(v122);
    v123._countAndFlagsBits = v320;
    v103 = (void *)v321;
    v123._object = (void *)v321;
    String.append(_:)(v123);
    v111 = v297;
  }
  else
  {
    v111 = v297;
    v112 = v291;
  }
  v124 = (uint64_t)v292;
  swift_bridgeObjectRelease(v103);
  v125 = v296;
  v126 = v287;
  v127 = v283;
  if ((_DWORD)v285 == 14)
  {
    v129 = sub_100005104(&qword_1000B90C0);
    v130 = v283;
    v131 = swift_allocObject(v129, 48, 7);
    *(_OWORD *)(v131 + 16) = xmmword_100096510;
    *(_QWORD *)(v131 + 32) = sub_10004C608(v289, v288);
    *(_QWORD *)(v131 + 40) = v132;
    sub_100067314(v126, v125, v293, v284, v130, v294, v112, (uint64_t)v111, v124, v295, 14);
    sub_100080428(v131, 0, (uint64_t)&v320);
    swift_bridgeObjectRelease(v131);
    v133 = sub_10007B6A8(0, 1);
    v135 = v134;
    sub_10004DBA8(&v320);
    *(_QWORD *)&v307 = 10;
    *((_QWORD *)&v307 + 1) = 0xE100000000000000;
    v136._countAndFlagsBits = v133;
    v136._object = v135;
    String.append(_:)(v136);
    v137 = v135;
    v138 = v284;
    swift_bridgeObjectRelease(v137);
    *(_QWORD *)&v289 = *((_QWORD *)&v307 + 1);
    v281 = v307;
LABEL_34:
    v140 = v125;
    v141 = (char *)v282;
    v142 = *(_QWORD *)(v282 + 16);
    if (!v142)
    {
LABEL_132:
      swift_bridgeObjectRelease(v141);
      sub_100083CD8(v126, v140, v293, v138, v283, v294, v291, (uint64_t)v297, (uint64_t)v292, v295, v285);
      __break(1u);
      goto LABEL_133;
    }
    v143 = v282 + 16 * v142;
    v145 = *(_QWORD *)(v143 + 16);
    v144 = *(_QWORD *)(v143 + 24);
    swift_bridgeObjectRelease(v282);
    swift_bridgeObjectRelease(v306);
    v288 = sub_10004D160(v145, *(_QWORD *)(v144 + 8), 0, 0, 0, 0);
    v147 = v146;
    v278 = v146;
    v280 = sub_10002EA1C();
    v148 = swift_allocError(&type metadata for ParserError, v280, 0, 0);
    *(_QWORD *)v149 = v126;
    *(_QWORD *)(v149 + 8) = v140;
    v151 = v293;
    v150 = v294;
    *(_QWORD *)(v149 + 16) = v293;
    *(_QWORD *)(v149 + 24) = v138;
    v152 = v283;
    *(_QWORD *)(v149 + 32) = v283;
    *(_QWORD *)(v149 + 40) = v150;
    v153 = v150;
    v155 = v291;
    v154 = (uint64_t)v292;
    v156 = (uint64_t)v297;
    *(_QWORD *)(v149 + 48) = v291;
    *(_QWORD *)(v149 + 56) = v156;
    v157 = v295;
    *(_QWORD *)(v149 + 64) = v154;
    *(_QWORD *)(v149 + 72) = v157;
    v158 = v285;
    *(_BYTE *)(v149 + 80) = v285;
    v159 = v138;
    v160 = v153;
    sub_100067314(v126, v140, v151, v159, v152, v153, v155, v156, v154, v157, v158);
    v161 = sub_1000851F8(v148, v288, v147);
    v163 = v162;
    swift_errorRelease(v148);
    if (v163)
      v164 = v161;
    else
      v164 = 0;
    v282 = v164;
    v165 = 0xE000000000000000;
    if (v163)
      v165 = v163;
    v279 = v165;
    v166 = swift_allocError(&type metadata for ParserError, v280, 0, 0);
    v167 = v287;
    *(_QWORD *)v168 = v287;
    *(_QWORD *)(v168 + 8) = v140;
    v169 = v151;
    v293 = v151;
    v170 = v284;
    *(_QWORD *)(v168 + 16) = v151;
    *(_QWORD *)(v168 + 24) = v170;
    v171 = v152;
    *(_QWORD *)(v168 + 32) = v152;
    *(_QWORD *)(v168 + 40) = v160;
    v172 = v160;
    v173 = v155;
    *(_QWORD *)(v168 + 48) = v155;
    *(_QWORD *)(v168 + 56) = v156;
    v297 = (_QWORD *)v156;
    v174 = (uint64_t)v292;
    v175 = v295;
    *(_QWORD *)(v168 + 64) = v292;
    *(_QWORD *)(v168 + 72) = v175;
    v176 = v285;
    *(_BYTE *)(v168 + 80) = v285;
    v276 = v175;
    v177 = v175;
    v178 = v167;
    v179 = v171;
    sub_100067314(v167, v140, v169, v170, v171, v172, v173, v156, v174, v276, v176);
    v180 = v166;
    v181 = sub_100085524(v166, v288, v278);
    v183 = v182;
    swift_bridgeObjectRelease(v278);
    swift_bridgeObjectRelease(v288);
    swift_errorRelease(v180);
    if (v183)
      v184 = v181;
    else
      v184 = 0;
    v288 = v184;
    if (v183)
      v185 = v183;
    else
      v185 = 0xE000000000000000;
    v280 = v185;
    swift_errorRelease(v290);
    sub_100083CD8(v178, v296, v293, v284, v179, v294, v291, (uint64_t)v297, (uint64_t)v292, v177, v176);
    result = sub_100083CD8(v178, v296, v293, v284, v179, v294, v291, (uint64_t)v297, (uint64_t)v292, v295, v285);
    v28 = v279;
    v26 = v280;
    v27 = 1;
    v25 = v281;
    v11 = v282;
LABEL_47:
    a4 = v286;
    goto LABEL_48;
  }
  if ((_DWORD)v285 != 13)
  {
    v139 = v306;
    v281 = v305;
    v138 = v284;
    sub_100083CB8(v287, v296, v293, v284, v283, v294, v112, (uint64_t)v111, (uint64_t)v292, v295, v285);
    *(_QWORD *)&v289 = v139;
    swift_bridgeObjectRetain(v139);
    goto LABEL_34;
  }
  *(_QWORD *)&v307 = v287;
  v128 = v284;
  sub_100083CB8(v287, v296, v293, v284, v283, v294, v112, (uint64_t)v111, (uint64_t)v292, v295, 0xDu);
  swift_errorRetain(v287);
  if (swift_dynamicCast(&v320, &v307, v281, &type metadata for ValidationError, 0))
  {
    swift_bridgeObjectRelease(v282);
    v285 = v320;
    v281 = v305;
    v282 = v321;
    *(_QWORD *)&v289 = v306;
    swift_errorRelease(v290);
    sub_100083CD8(v287, v296, v293, v284, v283, v294, v291, (uint64_t)v111, (uint64_t)v292, v295, 0xDu);
    v25 = v281;
    sub_100083CD8(v287, v296, v293, v284, v283, v294, v291, (uint64_t)v111, (uint64_t)v292, v295, 0xDu);
    result = swift_errorRelease(v307);
    v288 = 0;
    v27 = 1;
    v26 = 0xE000000000000000;
    v11 = v285;
    v28 = v282;
    goto LABEL_48;
  }
  v297 = v111;
  swift_errorRelease(v307);
  v112 = v287;
  v304 = v287;
  swift_errorRetain(v287);
  if (swift_dynamicCast(v302, &v304, v281, &type metadata for CleanExit, 0))
  {
    swift_bridgeObjectRelease(v306);
    v187 = v302[0];
    v188 = v302[1];
    v189 = (uint64_t)v292;
    v190 = (_QWORD *)v282;
    v140 = v296;
    if (v303)
    {
      if (v303 == 1)
      {
        swift_errorRelease(v290);
        v285 = v188;
        sub_100083CD8(v287, v296, v293, v284, v283, v294, v291, (uint64_t)v297, (uint64_t)v292, v295, 0xDu);
        swift_bridgeObjectRelease(v282);
        LOBYTE(v277) = 13;
        v275 = v292;
        v276 = v295;
        v191 = v287;
        v192 = v296;
        v193 = v293;
        v194 = v284;
        v195 = v283;
        v196 = v294;
        v197 = v291;
        v198 = (uint64_t)v297;
LABEL_128:
        sub_100083CD8(v191, v192, v193, v194, v195, v196, v197, v198, (uint64_t)v275, v276, v277);
        result = swift_errorRelease(v304);
        v25 = 0;
        v288 = 0;
        *(_QWORD *)&v289 = 0;
        v26 = 0;
        v27 = 0;
        v11 = v187;
        goto LABEL_129;
      }
      if (!v302[0])
      {
        v257 = (uint64_t)v297;
LABEL_126:
        sub_100077CF4((uint64_t)v190, (uint64_t)&v307);
        v321 = v307;
        v320 = 0;
        v322 = v308;
        v323 = v309;
        v324 = v310;
        v325 = v311;
        v326 = v312;
        v187 = sub_100076DD0();
        v285 = v272;
        swift_errorRelease(v290);
        v264 = v295;
        v273 = v140;
        v266 = v293;
        v267 = v284;
        v274 = v127;
        v269 = v294;
        v270 = v291;
        sub_100083CD8(v112, v273, v293, v284, v274, v294, v291, v257, v189, v295, 0xDu);
        sub_10004DC0C((uint64_t *)&v307);
        goto LABEL_127;
      }
      swift_bridgeObjectRelease(v282);
      v246 = sub_10004C608(v289, v288);
      v111 = sub_10006A41C(v246, v247);
      v126 = v248;
      v288 = v249;
      v250 = sub_10008B57C((uint64_t)v111, v187);
      v251 = v250;
      if ((unint64_t)v250 >> 62)
      {
        if (v250 >= 0)
          v250 &= 0xFFFFFFFFFFFFFF8uLL;
        v138 = _CocoaArrayWrapper.endIndex.getter(v250);
        if (v138)
        {
LABEL_94:
          v285 = v126;
          v320 = (uint64_t)_swiftEmptyArrayStorage;
          v141 = sub_10004FE48(0, v138 & ~(v138 >> 63), 0);
          if ((v138 & 0x8000000000000000) == 0)
          {
            v252 = 0;
            v190 = (_QWORD *)v320;
            do
            {
              v253 = a4;
              if ((v251 & 0xC000000000000001) != 0)
                v254 = specialized _ArrayBuffer._getElementSlowPath(_:)(v252, v251);
              else
                v254 = swift_retain(*(_QWORD *)(v251 + 8 * v252 + 32));
              v289 = *(_OWORD *)(v254 + 16);
              swift_release(v254);
              v320 = (uint64_t)v190;
              v256 = v190[2];
              v255 = v190[3];
              if (v256 >= v255 >> 1)
              {
                sub_10004FE48((char *)(v255 > 1), v256 + 1, 1);
                v190 = (_QWORD *)v320;
              }
              ++v252;
              v190[2] = v256 + 1;
              *(_OWORD *)&v190[2 * v256 + 4] = v289;
              a4 = v253;
            }
            while (v138 != v252);
            swift_bridgeObjectRelease(v251);
            v140 = v296;
            v112 = v287;
            v126 = v285;
            goto LABEL_123;
          }
          goto LABEL_131;
        }
      }
      else
      {
        v138 = *(_QWORD *)((v250 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v138)
          goto LABEL_94;
      }
      swift_bridgeObjectRelease(v251);
      v190 = _swiftEmptyArrayStorage;
LABEL_123:
      v127 = v283;
      if (!v190[2])
      {
        swift_bridgeObjectRelease(v190);
        v271 = sub_100005104(&qword_1000B90C0);
        v190 = (_QWORD *)swift_allocObject(v271, 48, 7);
        *((_OWORD *)v190 + 1) = xmmword_100096510;
        *((_OWORD *)v190 + 2) = *((_OWORD *)v111 + 1);
      }
      swift_release(v111);
      swift_bridgeObjectRelease(v288);
      swift_release(v126);
      v257 = (uint64_t)v297;
      v189 = (uint64_t)v292;
      goto LABEL_126;
    }
    if (!v302[0])
    {
      v257 = (uint64_t)v297;
LABEL_118:
      sub_100080428((uint64_t)v190, 0, (uint64_t)&v320);
      swift_bridgeObjectRelease(v190);
      v187 = sub_10007B6A8(0, 1);
      v285 = v263;
      swift_errorRelease(v290);
      v264 = v295;
      v265 = v140;
      v266 = v293;
      v267 = v284;
      v268 = v127;
      v269 = v294;
      v270 = v291;
      sub_100083CD8(v112, v265, v293, v284, v268, v294, v291, v257, v189, v295, 0xDu);
      sub_10004DBA8(&v320);
LABEL_127:
      LOBYTE(v277) = 13;
      v275 = (_QWORD *)v189;
      v276 = v264;
      v191 = v112;
      v192 = v296;
      v193 = v266;
      v194 = v267;
      v195 = v283;
      v196 = v269;
      v197 = v270;
      v198 = v257;
      goto LABEL_128;
    }
    swift_bridgeObjectRelease(v282);
    v235 = sub_10004C608(v289, v288);
    v111 = sub_10006A41C(v235, v236);
    v126 = v237;
    v288 = v238;
    v239 = sub_10008B57C((uint64_t)v111, v187);
    v240 = v239;
    if ((unint64_t)v239 >> 62)
    {
      if (v239 >= 0)
        v239 &= 0xFFFFFFFFFFFFFF8uLL;
      v138 = _CocoaArrayWrapper.endIndex.getter(v239);
      if (v138)
        goto LABEL_82;
    }
    else
    {
      v138 = *(_QWORD *)((v239 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v138)
      {
LABEL_82:
        v285 = v126;
        v320 = (uint64_t)_swiftEmptyArrayStorage;
        v141 = sub_10004FE48(0, v138 & ~(v138 >> 63), 0);
        if (v138 < 0)
        {
          __break(1u);
LABEL_131:
          __break(1u);
          goto LABEL_132;
        }
        v241 = 0;
        v190 = (_QWORD *)v320;
        do
        {
          v242 = a4;
          if ((v240 & 0xC000000000000001) != 0)
            v243 = specialized _ArrayBuffer._getElementSlowPath(_:)(v241, v240);
          else
            v243 = swift_retain(*(_QWORD *)(v240 + 8 * v241 + 32));
          v289 = *(_OWORD *)(v243 + 16);
          swift_release(v243);
          v320 = (uint64_t)v190;
          v245 = v190[2];
          v244 = v190[3];
          if (v245 >= v244 >> 1)
          {
            sub_10004FE48((char *)(v244 > 1), v245 + 1, 1);
            v190 = (_QWORD *)v320;
          }
          ++v241;
          v190[2] = v245 + 1;
          *(_OWORD *)&v190[2 * v245 + 4] = v289;
          a4 = v242;
        }
        while (v138 != v241);
        swift_bridgeObjectRelease(v240);
        v140 = v296;
        v112 = v287;
        v126 = v285;
        goto LABEL_115;
      }
    }
    swift_bridgeObjectRelease(v240);
    v190 = _swiftEmptyArrayStorage;
LABEL_115:
    v127 = v283;
    if (!v190[2])
    {
      swift_bridgeObjectRelease(v190);
      v262 = sub_100005104(&qword_1000B90C0);
      v190 = (_QWORD *)swift_allocObject(v262, 48, 7);
      *((_OWORD *)v190 + 1) = xmmword_100096510;
      *((_OWORD *)v190 + 2) = *((_OWORD *)v111 + 1);
    }
    swift_release(v111);
    swift_bridgeObjectRelease(v288);
    swift_release(v126);
    v257 = (uint64_t)v297;
    v189 = (uint64_t)v292;
    goto LABEL_118;
  }
  swift_bridgeObjectRelease(v282);
  swift_errorRelease(v304);
  v320 = v287;
  swift_errorRetain(v287);
  v111 = v292;
  v140 = v296;
  if (swift_dynamicCast(&v307, &v320, v281, &type metadata for ExitCode, 0))
  {
    swift_bridgeObjectRelease(v306);
    v281 = v307;
    swift_errorRelease(v290);
    sub_100083CD8(v287, v296, v293, v284, v283, v294, v291, (uint64_t)v297, (uint64_t)v292, v295, 0xDu);
    a4 = v286;
    v25 = v281;
    sub_100083CD8(v287, v296, v293, v284, v283, v294, v291, (uint64_t)v297, (uint64_t)v292, v295, 0xDu);
    result = swift_errorRelease(v320);
    v11 = 0;
    v288 = 0;
    *(_QWORD *)&v289 = 0;
    v26 = 0;
    v27 = 2;
    v28 = 0xE000000000000000;
    goto LABEL_48;
  }
  swift_errorRelease(v320);
  v302[0] = v287;
  swift_errorRetain(v287);
  v214 = sub_100005104(&qword_1000B9E78);
  if (swift_dynamicCast(&v320, v302, v281, v214, 0))
  {
    sub_100045320((__int128 *)&v320, (uint64_t)&v307);
    v215 = v309;
    sub_100006270(&v307, v309);
    dispatch thunk of LocalizedError.errorDescription.getter(v215, *((_QWORD *)&v215 + 1));
    v217 = v216;
    swift_bridgeObjectRelease(v216);
    if (v217)
    {
      v218 = v309;
      sub_100006270(&v307, v309);
      v282 = dispatch thunk of LocalizedError.errorDescription.getter(v218, *((_QWORD *)&v218 + 1));
      v285 = v219;
      if (v219)
      {
        swift_bridgeObjectRelease(v306);
        swift_errorRelease(v290);
        sub_100083CD8(v287, v296, v293, v284, v283, v294, v291, (uint64_t)v297, (uint64_t)v292, v295, 0xDu);
        sub_100083CD8(v287, v296, v293, v284, v283, v294, v291, (uint64_t)v297, (uint64_t)v292, v295, 0xDu);
        sub_1000062D8(&v307);
        result = swift_errorRelease(v302[0]);
        v288 = 0;
        *(_QWORD *)&v289 = 0;
        v26 = 0;
        v27 = 2;
        v25 = 1;
        v11 = v282;
LABEL_129:
        v28 = v285;
        a4 = v286;
        goto LABEL_48;
      }
LABEL_133:
      sub_100083CD8(v112, v140, v293, v284, v283, v294, v291, (uint64_t)v297, (uint64_t)v111, v295, 0xDu);
      __break(1u);
      JUMPOUT(0x100083A2CLL);
    }
    swift_bridgeObjectRelease(v306);
    sub_1000062D8(&v307);
    v127 = v283;
    v128 = v284;
  }
  else
  {
    swift_bridgeObjectRelease(v306);
  }
  swift_errorRelease(v302[0]);
  swift_getErrorValue(v287, &v301, v300);
  DynamicType = swift_getDynamicType(v300[0], v300[1], 1);
  v259 = sub_100083CF8();
  if (swift_dynamicCastMetatype(DynamicType, v259))
  {
    swift_getErrorValue(v287, &v299, v298);
    v260 = Error.localizedDescription.getter(v298[1], v298[2]);
  }
  else
  {
    v320 = v287;
    swift_errorRetain(v287);
    v260 = String.init<A>(describing:)(&v320, v281);
  }
  v285 = v260;
  v282 = v261;
  swift_errorRelease(v290);
  sub_100083CD8(v287, v296, v293, v128, v127, v294, v291, (uint64_t)v297, (uint64_t)v292, v295, 0xDu);
  result = sub_100083CD8(v287, v296, v293, v128, v127, v294, v291, (uint64_t)v297, (uint64_t)v292, v295, 0xDu);
  v288 = 0;
  *(_QWORD *)&v289 = 0;
  v26 = 0;
  v27 = 2;
  v25 = 1;
  v11 = v285;
  a4 = v286;
  v28 = v282;
LABEL_48:
  *(_QWORD *)a4 = v11;
  *(_QWORD *)(a4 + 8) = v28;
  v186 = v289;
  *(_QWORD *)(a4 + 16) = v25;
  *(_QWORD *)(a4 + 24) = v186;
  *(_QWORD *)(a4 + 32) = v288;
  *(_QWORD *)(a4 + 40) = v26;
  *(_BYTE *)(a4 + 48) = v27;
  return result;
}

uint64_t sub_100083A6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::String v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  uint64_t v22;
  unint64_t v23;
  Swift::String v24;
  Swift::String v25;
  Swift::String v26;
  unint64_t v27;
  Swift::String v28;
  Swift::String v29;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34[8];
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  char v42;

  sub_10004CAE0(v2, (uint64_t)v34);
  v5 = v35;
  sub_10004CAE0(v2, (uint64_t)&v36);
  if (v42)
  {
    if (v42 == 1)
    {
      v6 = v36;
      v7 = v37;
      v8 = v38;
      v9 = v39;
      v10 = v40;
      v11 = v41;
      v12 = HIBYTE(v41) & 0xF;
      if ((v41 & 0x2000000000000000) == 0)
        v12 = v40 & 0xFFFFFFFFFFFFLL;
      if (v12)
      {
        String.append(_:)(*(Swift::String *)&v10);
        v13._countAndFlagsBits = 10;
        v13._object = (void *)0xE100000000000000;
        String.append(_:)(v13);
        v15 = 0x20203A706C6548;
        v14 = (void *)0xE700000000000000;
      }
      else
      {
        v15 = 0;
        v14 = (void *)0xE000000000000000;
      }
      v22 = HIBYTE(v7) & 0xF;
      if ((v7 & 0x2000000000000000) == 0)
        v22 = v6 & 0xFFFFFFFFFFFFLL;
      if (v22)
      {
        v32 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
        v33 = v23;
        v24._countAndFlagsBits = 8250;
        v24._object = (void *)0xE200000000000000;
        String.append(_:)(v24);
        v25._countAndFlagsBits = v6;
        v25._object = (void *)v7;
        String.append(_:)(v25);
        v26._countAndFlagsBits = 10;
        v26._object = (void *)0xE100000000000000;
        String.append(_:)(v26);
        v22 = v32;
        v27 = v33;
      }
      else
      {
        v27 = 0xE000000000000000;
      }
      v31 = v22;
      swift_bridgeObjectRetain(v27);
      v28._countAndFlagsBits = v15;
      v28._object = v14;
      String.append(_:)(v28);
      swift_bridgeObjectRelease(v27);
      swift_bridgeObjectRelease(v14);
      swift_bridgeObjectRetain(v27);
      v29._countAndFlagsBits = v8;
      v29._object = v9;
      String.append(_:)(v29);
      swift_bridgeObjectRelease(v27);
    }
    else
    {
      v17 = v36;
      v18 = (void *)v37;
      v19 = HIBYTE(v37) & 0xF;
      if ((v37 & 0x2000000000000000) == 0)
        v19 = v36 & 0xFFFFFFFFFFFFLL;
      if (!v19)
        return 0;
      v31 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
      v20._countAndFlagsBits = 8250;
      v20._object = (void *)0xE200000000000000;
      String.append(_:)(v20);
      v21._countAndFlagsBits = v17;
      v21._object = v18;
      String.append(_:)(v21);
    }
    return v31;
  }
  else
  {
    v16 = v36;
    swift_bridgeObjectRetain(v5);
  }
  return v16;
}

unint64_t *sub_100083C78@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  if ((*result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(_QWORD *)(*(_QWORD *)a2 + 16))
  {
    v4 = *(_QWORD *)a2 + 16 * v3;
    v5 = *(_QWORD *)(v4 + 40);
    *a3 = *(_QWORD *)(v4 + 32);
    a3[1] = v5;
    return (unint64_t *)swift_bridgeObjectRetain(v5);
  }
  __break(1u);
  return result;
}

uint64_t sub_100083CB8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11)
{
  if (a11 != 255)
    return sub_100067314(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  return result;
}

uint64_t sub_100083CD8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11)
{
  if (a11 != 255)
    return sub_10006749C(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  return result;
}

unint64_t sub_100083CF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000B9E80[0];
  if (!qword_1000B9E80[0])
  {
    v1 = objc_opt_self(NSError);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, qword_1000B9E80);
  }
  return result;
}

unint64_t *sub_100083D34@<X0>(unint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_100083C78(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_100083D50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  Swift::String v29;
  __int128 *v30;
  _OWORD v32[12];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;

  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_8:
    sub_100033E1C(&v33);
    v30 = &v33;
    goto LABEL_9;
  }
  swift_bridgeObjectRetain(a1);
  swift_bridgeObjectRetain(a2);
  v13 = *(_OWORD *)(a1 + 176);
  v41 = *(_OWORD *)(a1 + 160);
  v42 = v13;
  v14 = *(_OWORD *)(a1 + 208);
  v43 = *(_OWORD *)(a1 + 192);
  v44 = v14;
  v15 = *(_OWORD *)(a1 + 112);
  v37 = *(_OWORD *)(a1 + 96);
  v38 = v15;
  v16 = *(_OWORD *)(a1 + 144);
  v39 = *(_OWORD *)(a1 + 128);
  v40 = v16;
  v17 = *(_OWORD *)(a1 + 48);
  v33 = *(_OWORD *)(a1 + 32);
  v34 = v17;
  v18 = *(_OWORD *)(a1 + 80);
  v35 = *(_OWORD *)(a1 + 64);
  v36 = v18;
  if ((sub_100084464(a3, a4, a5, v35) & 1) == 0)
  {
    v19 = 224;
    while (--v9)
    {
      v20 = v19 + 192;
      v21 = (__int128 *)(a1 + v19);
      v22 = v21[9];
      v41 = v21[8];
      v42 = v22;
      v23 = v21[11];
      v43 = v21[10];
      v44 = v23;
      v24 = v21[5];
      v37 = v21[4];
      v38 = v24;
      v25 = v21[7];
      v39 = v21[6];
      v40 = v25;
      v26 = v21[1];
      v33 = *v21;
      v34 = v26;
      v27 = v21[3];
      v35 = v21[2];
      v36 = v27;
      v28 = sub_100084464(a3, a4, a5, v35);
      v19 = v20;
      if ((v28 & 1) != 0)
        goto LABEL_6;
    }
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a1);
    goto LABEL_8;
  }
LABEL_6:
  sub_10002D724((uint64_t)&v33);
  swift_bridgeObjectRelease(a2);
  swift_bridgeObjectRelease(a1);
  v32[8] = v41;
  v32[9] = v42;
  v32[10] = v43;
  v32[11] = v44;
  v32[4] = v37;
  v32[5] = v38;
  v32[6] = v39;
  v32[7] = v40;
  v32[0] = v33;
  v32[1] = v34;
  v32[2] = v35;
  v32[3] = v36;
  v29._countAndFlagsBits = (uint64_t)v32;
  String.init(argument:)(v29);
  v30 = v32;
LABEL_9:
  sub_10005BFC4((uint64_t)v30, a6);
  swift_bridgeObjectRelease(a5);
  return swift_bridgeObjectRelease(a4);
}

uint64_t sub_100083EF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD *v20;
  uint64_t v21;
  unsigned __int8 *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  BOOL v26;
  BOOL v27;
  __int128 *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  Swift::String v35;
  uint64_t v37;
  uint64_t v39;
  _OWORD v40[12];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v9 = a6;
  v53 = *(_QWORD *)(a1 + 16);
  if (v53)
  {
    v12 = a1 + 32;
    swift_bridgeObjectRetain(a1);
    v37 = a2;
    swift_bridgeObjectRetain(a2);
    v13 = 0;
    v14 = *(_OWORD *)(a1 + 176);
    v49 = *(_OWORD *)(a1 + 160);
    v50 = v14;
    v15 = *(_OWORD *)(a1 + 208);
    v51 = *(_OWORD *)(a1 + 192);
    v52 = v15;
    v16 = *(_OWORD *)(a1 + 112);
    v45 = *(_OWORD *)(a1 + 96);
    v46 = v16;
    v17 = *(_OWORD *)(a1 + 144);
    v47 = *(_OWORD *)(a1 + 128);
    v48 = v17;
    v18 = *(_OWORD *)(a1 + 48);
    v41 = *(_OWORD *)(a1 + 32);
    v42 = v18;
    v19 = *(_OWORD *)(a1 + 80);
    v43 = *(_OWORD *)(a1 + 64);
    v44 = v19;
    v39 = v12;
    while (1)
    {
      v20 = _swiftEmptyArrayStorage;
      if ((unint64_t)v41 >= 2)
      {
        sub_10002D810(v41);
        v20 = (_QWORD *)v41;
      }
      v21 = v20[2];
      if (v21)
        break;
      swift_bridgeObjectRelease(v20);
LABEL_29:
      if (++v13 == v53)
      {
        swift_bridgeObjectRelease(v37);
        swift_bridgeObjectRelease(a1);
        sub_10002DA24(a3, a4, a5);
        v9 = a6;
        goto LABEL_33;
      }
      v28 = (__int128 *)(v12 + 192 * v13);
      v29 = v28[9];
      v49 = v28[8];
      v50 = v29;
      v30 = v28[11];
      v51 = v28[10];
      v52 = v30;
      v31 = v28[5];
      v45 = v28[4];
      v46 = v31;
      v32 = v28[7];
      v47 = v28[6];
      v48 = v32;
      v33 = v28[1];
      v41 = *v28;
      v42 = v33;
      v34 = v28[3];
      v43 = v28[2];
      v44 = v34;
    }
    v22 = (unsigned __int8 *)(v20 + 6);
    while (1)
    {
      v23 = *((_QWORD *)v22 - 2);
      v24 = *((_QWORD *)v22 - 1);
      v25 = *v22;
      if (v25 >> 6)
      {
        if (v25 >> 6 == 1)
        {
          if ((a5 & 0xC0) == 0x40)
          {
            v26 = v23 == a3 && v24 == a4;
            if ((v26 || (_stringCompareWithSmolCheck(_:_:expecting:)(v23, v24, a3, a4, 0) & 1) != 0)
              && ((a5 ^ v25) & 1) == 0)
            {
              goto LABEL_31;
            }
          }
          goto LABEL_8;
        }
        if ((a5 & 0xC0) != 0x80)
          goto LABEL_8;
      }
      else if (a5 >= 0x40u)
      {
        goto LABEL_8;
      }
      v27 = v23 == a3 && v24 == a4;
      if (v27 || (_stringCompareWithSmolCheck(_:_:expecting:)(v23, v24, a3, a4, 0) & 1) != 0)
      {
LABEL_31:
        sub_10002D724((uint64_t)&v41);
        swift_bridgeObjectRelease(v37);
        swift_bridgeObjectRelease(a1);
        swift_bridgeObjectRelease(v20);
        sub_10002DA24(a3, a4, a5);
        v40[8] = v49;
        v40[9] = v50;
        v40[10] = v51;
        v40[11] = v52;
        v40[4] = v45;
        v40[5] = v46;
        v40[6] = v47;
        v40[7] = v48;
        v40[0] = v41;
        v40[1] = v42;
        v40[2] = v43;
        v40[3] = v44;
        v35._countAndFlagsBits = (uint64_t)v40;
        String.init(argument:)(v35);
        return sub_10005BFC4((uint64_t)v40, a6);
      }
LABEL_8:
      v22 += 24;
      if (!--v21)
      {
        swift_bridgeObjectRelease(v20);
        v12 = v39;
        goto LABEL_29;
      }
    }
  }
  sub_10002DA24(a3, a4, a5);
LABEL_33:
  sub_100033E1C(&v41);
  return sub_10005BFC4((uint64_t)&v41, v9);
}

uint64_t sub_1000841B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  Swift::String v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;
  Swift::String v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  Swift::String v18;
  Swift::String v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  void *object;
  Swift::String v24;
  void *v25;
  Swift::String v26;
  uint64_t result;
  Swift::String v28;
  uint64_t v29;
  uint64_t v30;
  Swift::String v31;
  __n128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  Swift::String v38;
  __int128 v39;
  uint64_t v40;
  Swift::String v41;
  char v42;

  v1 = v0;
  v2 = *(_QWORD *)v0;
  if (!*(_QWORD *)v0)
  {
    v32.n128_u64[0] = 60;
    v32.n128_u64[1] = 0xE100000000000000;
    v4 = *(Swift::String *)(v0 + 88);
    v37 = *(_OWORD *)(v0 + 72);
    v38 = v4;
    v39 = *(_OWORD *)(v0 + 104);
    v40 = *(_QWORD *)(v0 + 120);
    v5 = *(_OWORD *)(v0 + 24);
    v33 = *(_OWORD *)(v0 + 8);
    v34 = v5;
    v6 = *(_OWORD *)(v0 + 56);
    v35 = *(_OWORD *)(v0 + 40);
    v36 = v6;
    v41 = v38;
    v7 = v38._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
    if (((uint64_t)v38._object & 0x2000000000000000) != 0)
      v7 = ((unint64_t)v38._object >> 56) & 0xF;
    if (v7)
    {
      v31 = v38;
      swift_bridgeObjectRetain(v38._object);
    }
    else
    {
      swift_bridgeObjectRetain(v38._object);
      sub_10005D218((_QWORD *)v0, (unint64_t *)&v31);
      sub_100030564((uint64_t)&v41);
    }
    object = v31._object;
    String.append(_:)(v31);
    swift_bridgeObjectRelease(object);
    v24._countAndFlagsBits = 62;
    v24._object = (void *)0xE100000000000000;
    String.append(_:)(v24);
    return v32.n128_u64[0];
  }
  if (v2 == 1)
    return 0;
  v8 = sub_10005CF90(v2);
  if (v10 <= 0xFDu)
  {
    v11 = v8;
    v12 = v9;
    v13 = v10;
    sub_10002D868((__n128 *)(v1 + 152), &v32);
    sub_10002D868(&v32, (__n128 *)&v41);
    v14._countAndFlagsBits = v11;
    v14._object = v12;
    if (v42 == 1)
    {
      v15 = sub_10006D63C(v14, v13);
      v17 = v16;
      sub_10002DA3C(v11, (uint64_t)v12, v13);
      v29 = v15;
      v30 = v17;
      v18._countAndFlagsBits = 15392;
      v18._object = (void *)0xE200000000000000;
      String.append(_:)(v18);
      v19 = *(Swift::String *)(v1 + 88);
      v37 = *(_OWORD *)(v1 + 72);
      v38 = v19;
      v39 = *(_OWORD *)(v1 + 104);
      v40 = *(_QWORD *)(v1 + 120);
      v20 = *(_OWORD *)(v1 + 24);
      v33 = *(_OWORD *)(v1 + 8);
      v34 = v20;
      v21 = *(_OWORD *)(v1 + 56);
      v35 = *(_OWORD *)(v1 + 40);
      v36 = v21;
      v31 = v19;
      v22 = v19._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
      if (((uint64_t)v19._object & 0x2000000000000000) != 0)
        v22 = ((unint64_t)v19._object >> 56) & 0xF;
      if (v22)
      {
        v28 = v38;
        swift_bridgeObjectRetain(v19._object);
      }
      else
      {
        swift_bridgeObjectRetain(v19._object);
        sub_10005D218((_QWORD *)v1, (unint64_t *)&v28);
        sub_100030564((uint64_t)&v31);
      }
      v25 = v28._object;
      String.append(_:)(v28);
      swift_bridgeObjectRelease(v25);
      v26._countAndFlagsBits = 62;
      v26._object = (void *)0xE100000000000000;
      String.append(_:)(v26);
      return v29;
    }
    else
    {
      v3 = sub_10006D63C(v14, v13);
      sub_10002DA3C(v11, (uint64_t)v12, v13);
    }
    return v3;
  }
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000002FLL, 0x800000010009DCB0, "ArgumentParser/UsageGenerator.swift", 35, 2, 95, 0);
  __break(1u);
  return result;
}

uint64_t sub_100084464(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t *i;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t *v34;

  v4 = *(_QWORD *)(a4 + 16);
  if (v4)
  {
    v8 = 0;
    v9 = a4 + 32;
    v34 = a3 + 9;
    do
    {
      v10 = (_QWORD *)(v9 + 24 * v8);
      v11 = v10[1];
      v12 = (_QWORD *)v10[2];
      v13 = *v10 == a1 && v11 == a2;
      if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) != 0)
      {
        v14 = v12[2];
        if (v14 == a3[2])
        {
          if (!v14 || v12 == a3)
            return 1;
          v15 = v12[4];
          v16 = v12[5];
          v17 = a3[4];
          v18 = a3[5];
          v19 = v15 == v17 && v16 == v18;
          if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, v17, v18, 0) & 1) != 0)
          {
            if (v14 == 1)
              return 1;
            v20 = v12[6];
            v21 = v12[7];
            v22 = a3[6];
            v23 = a3[7];
            v24 = v20 == v22 && v21 == v23;
            if (v24 || (_stringCompareWithSmolCheck(_:_:expecting:)(v20, v21, v22, v23, 0) & 1) != 0)
            {
              v25 = v14 - 2;
              if (!v25)
                return 1;
              v26 = v12 + 9;
              for (i = v34; ; i += 2)
              {
                v28 = *(v26 - 1);
                v29 = *v26;
                v30 = *(i - 1);
                v31 = *i;
                v32 = v28 == v30 && v29 == v31;
                if (!v32 && (_stringCompareWithSmolCheck(_:_:expecting:)(v28, v29, v30, v31, 0) & 1) == 0)
                  break;
                v26 += 2;
                if (!--v25)
                  return 1;
              }
            }
          }
        }
      }
      ++v8;
    }
    while (v8 != v4);
  }
  return 0;
}

_QWORD *sub_1000845C8(uint64_t a1)
{
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v18 = swift_bridgeObjectRetain(a1);
    v2 = (_BYTE *)(v18 + 48);
    v3 = v1;
    do
    {
      v7 = *v2;
      if ((*v2 & 0xC0) == 0x40)
      {
        v9 = *((_QWORD *)v2 - 2);
        v8 = *((_QWORD *)v2 - 1);
        swift_bridgeObjectRetain(v8);
        if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0)
          sub_10004FED4(0, _swiftEmptyArrayStorage[2] + 1, 1);
        v5 = _swiftEmptyArrayStorage[2];
        v4 = _swiftEmptyArrayStorage[3];
        if (v5 >= v4 >> 1)
          sub_10004FED4((char *)(v4 > 1), v5 + 1, 1);
        _swiftEmptyArrayStorage[2] = v5 + 1;
        v6 = &_swiftEmptyArrayStorage[3 * v5];
        v6[4] = v9;
        v6[5] = v8;
        *((_BYTE *)v6 + 48) = v7;
      }
      v2 += 24;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease(v18);
    swift_bridgeObjectRetain(v18);
    v10 = (unsigned __int8 *)(v18 + 48);
    do
    {
      v14 = *v10;
      if ((*v10 & 0xC0) != 0x40)
      {
        v15 = *((_QWORD *)v10 - 2);
        v16 = *((_QWORD *)v10 - 1);
        sub_100030508(v15, v16, *v10);
        if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0)
          sub_10004FED4(0, _swiftEmptyArrayStorage[2] + 1, 1);
        v12 = _swiftEmptyArrayStorage[2];
        v11 = _swiftEmptyArrayStorage[3];
        if (v12 >= v11 >> 1)
          sub_10004FED4((char *)(v11 > 1), v12 + 1, 1);
        _swiftEmptyArrayStorage[2] = v12 + 1;
        v13 = &_swiftEmptyArrayStorage[3 * v12];
        v13[4] = v15;
        v13[5] = v16;
        *((_BYTE *)v13 + 48) = v14;
      }
      v10 += 24;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease(v18);
  }
  sub_100056D34((char *)_swiftEmptyArrayStorage);
  return _swiftEmptyArrayStorage;
}

uint64_t sub_1000847CC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  Swift::String v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v23;
  unint64_t v24;
  _OWORD *v25;
  Swift::String v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  char v46;
  Swift::String v47;
  Swift::String v48;
  void *object;
  uint64_t countAndFlagsBits;
  unint64_t v51;
  unint64_t v52;
  _QWORD *v53;
  int64_t v54;
  Swift::String v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  Swift::String v61;
  Swift::String v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  void *v73;
  char v74;
  Swift::String v75;
  void *v76;
  Swift::String v77;
  void *v78;
  void *v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  Swift::String v90;
  Swift::String v91;
  Swift::String v93;
  Swift::String v94;
  Swift::String v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _QWORD *v107;
  Swift::String v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;

  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(a4);
  v8 = sub_10004F988(a3, a4);
  swift_bridgeObjectRelease(a4);
  swift_bridgeObjectRelease(a3);
  v9 = v8[2];
  if (v9)
  {
    v93._countAndFlagsBits = a1;
    v93._object = a2;
    if (v9 < 0xD)
    {
      sub_10004FDF4(0, v9, 0);
      v35 = 4;
      do
      {
        v36 = *(_OWORD *)&v8[v35];
        v37 = *(_OWORD *)&v8[v35 + 2];
        v38 = *(_OWORD *)&v8[v35 + 6];
        v111 = *(_OWORD *)&v8[v35 + 4];
        v112 = v38;
        v109 = v36;
        v110 = v37;
        v39 = *(_OWORD *)&v8[v35 + 8];
        v40 = *(_OWORD *)&v8[v35 + 10];
        v41 = *(_OWORD *)&v8[v35 + 14];
        v115 = *(_OWORD *)&v8[v35 + 12];
        v116 = v41;
        v113 = v39;
        v114 = v40;
        v42 = *(_OWORD *)&v8[v35 + 16];
        v43 = *(_OWORD *)&v8[v35 + 18];
        v44 = *(_OWORD *)&v8[v35 + 22];
        v119 = *(_OWORD *)&v8[v35 + 20];
        v120 = v44;
        v117 = v42;
        v118 = v43;
        sub_10002D724((uint64_t)&v109);
        v95._countAndFlagsBits = sub_1000841B8();
        v95._object = v45;
        v46 = BYTE8(v109);
        if ((BYTE8(v109) & 2) != 0)
        {
          v47._countAndFlagsBits = 774778400;
          v47._object = (void *)0xE400000000000000;
          String.append(_:)(v47);
        }
        if ((v46 & 1) != 0)
        {
          v108._countAndFlagsBits = 91;
          v108._object = (void *)0xE100000000000000;
          String.append(_:)(v95);
          swift_bridgeObjectRelease(v95._object);
          v48._countAndFlagsBits = 93;
          v48._object = (void *)0xE100000000000000;
          String.append(_:)(v48);
          v95 = v108;
        }
        if (BYTE1(v118) == 5)
        {
          v108._countAndFlagsBits = 2108717;
          v108._object = (void *)0xE300000000000000;
          String.append(_:)(v95);
          swift_bridgeObjectRelease(v95._object);
          sub_10002D8A4((uint64_t)&v109);
          object = (void *)0xE300000000000000;
          countAndFlagsBits = 2108717;
        }
        else
        {
          sub_10002D8A4((uint64_t)&v109);
          object = v95._object;
          countAndFlagsBits = v95._countAndFlagsBits;
        }
        v52 = _swiftEmptyArrayStorage[2];
        v51 = _swiftEmptyArrayStorage[3];
        if (v52 >= v51 >> 1)
          sub_10004FDF4((char *)(v51 > 1), v52 + 1, 1);
        _swiftEmptyArrayStorage[2] = v52 + 1;
        v53 = &_swiftEmptyArrayStorage[2 * v52];
        v53[4] = countAndFlagsBits;
        v53[5] = object;
        v35 += 24;
        --v9;
      }
      while (v9);
      swift_release(v8);
      v56 = sub_100005104(&qword_1000B90C8);
      v57 = sub_1000062F8((unint64_t *)&qword_1000B90D0, &qword_1000B90C8, (uint64_t)&protocol conformance descriptor for [A]);
      v58 = BidirectionalCollection<>.joined(separator:)(32, 0xE100000000000000, v56, v57);
      v60 = v59;
      swift_release(_swiftEmptyArrayStorage);
      swift_bridgeObjectRetain(v93._object);
      v61._countAndFlagsBits = 32;
      v61._object = (void *)0xE100000000000000;
      String.append(_:)(v61);
      v62._countAndFlagsBits = v58;
      v62._object = v60;
      String.append(_:)(v62);
      swift_bridgeObjectRelease(v60);
      return v93._countAndFlagsBits;
    }
    else
    {
      v10 = v9 - 1;
      v11 = 4;
      v12 = _swiftEmptyArrayStorage;
      while (1)
      {
        v13 = *(Swift::String *)&v8[v11];
        v14 = *(_OWORD *)&v8[v11 + 2];
        v15 = *(_OWORD *)&v8[v11 + 6];
        v97 = *(_OWORD *)&v8[v11 + 4];
        v98 = v15;
        v95 = v13;
        v96 = v14;
        v16 = *(_OWORD *)&v8[v11 + 8];
        v17 = *(_OWORD *)&v8[v11 + 10];
        v18 = *(_OWORD *)&v8[v11 + 12];
        v102 = *(_OWORD *)&v8[v11 + 14];
        v100 = v17;
        v101 = v18;
        v99 = v16;
        v19 = *(_OWORD *)&v8[v11 + 16];
        v20 = *(_OWORD *)&v8[v11 + 18];
        v21 = *(_OWORD *)&v8[v11 + 22];
        v105 = *(_OWORD *)&v8[v11 + 20];
        v106 = v21;
        v103 = v19;
        v104 = v20;
        if (!v95._countAndFlagsBits || ((uint64_t)v95._object & 1) == 0)
        {
          sub_10002D724((uint64_t)&v95);
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v12);
          v107 = v12;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_10004FE10(0, v12[2] + 1, 1);
            v12 = v107;
          }
          v24 = v12[2];
          v23 = v12[3];
          if (v24 >= v23 >> 1)
          {
            sub_10004FE10((char *)(v23 > 1), v24 + 1, 1);
            v12 = v107;
          }
          v12[2] = v24 + 1;
          v25 = &v12[24 * v24];
          v26 = v95;
          v27 = v96;
          v28 = v98;
          v25[4] = v97;
          v25[5] = v28;
          v25[2] = v26;
          v25[3] = v27;
          v29 = v99;
          v30 = v100;
          v31 = v102;
          v25[8] = v101;
          v25[9] = v31;
          v25[6] = v29;
          v25[7] = v30;
          v32 = v103;
          v33 = v104;
          v34 = v106;
          v25[12] = v105;
          v25[13] = v34;
          v25[10] = v32;
          v25[11] = v33;
        }
        if (!v10)
          break;
        --v10;
        v11 += 24;
      }
      swift_release(v8);
      v54 = v12[2];
      if ((unint64_t)(v54 - 13) >= 0xFFFFFFFFFFFFFFF4)
      {
        sub_10004FDF4(0, v54, 0);
        v63 = 4;
        do
        {
          v64 = *(_OWORD *)&v12[v63];
          v65 = *(_OWORD *)&v12[v63 + 2];
          v66 = *(_OWORD *)&v12[v63 + 6];
          v111 = *(_OWORD *)&v12[v63 + 4];
          v112 = v66;
          v109 = v64;
          v110 = v65;
          v67 = *(_OWORD *)&v12[v63 + 8];
          v68 = *(_OWORD *)&v12[v63 + 10];
          v69 = *(_OWORD *)&v12[v63 + 14];
          v115 = *(_OWORD *)&v12[v63 + 12];
          v116 = v69;
          v113 = v67;
          v114 = v68;
          v70 = *(_OWORD *)&v12[v63 + 16];
          v71 = *(_OWORD *)&v12[v63 + 18];
          v72 = *(_OWORD *)&v12[v63 + 22];
          v119 = *(_OWORD *)&v12[v63 + 20];
          v120 = v72;
          v117 = v70;
          v118 = v71;
          sub_10002D724((uint64_t)&v109);
          v108._countAndFlagsBits = sub_1000841B8();
          v108._object = v73;
          v74 = BYTE8(v109);
          if ((BYTE8(v109) & 2) != 0)
          {
            v75._countAndFlagsBits = 774778400;
            v75._object = (void *)0xE400000000000000;
            String.append(_:)(v75);
          }
          if ((v74 & 1) != 0)
          {
            v94._countAndFlagsBits = 91;
            v94._object = (void *)0xE100000000000000;
            v76 = v108._object;
            String.append(_:)(v108);
            swift_bridgeObjectRelease(v76);
            v77._countAndFlagsBits = 93;
            v77._object = (void *)0xE100000000000000;
            String.append(_:)(v77);
            v108 = v94;
          }
          if (BYTE1(v118) == 5)
          {
            v78 = v108._object;
            String.append(_:)(v108);
            swift_bridgeObjectRelease(v78);
            sub_10002D8A4((uint64_t)&v109);
            v79 = (void *)0xE300000000000000;
            v80 = 2108717;
          }
          else
          {
            sub_10002D8A4((uint64_t)&v109);
            v79 = v108._object;
            v80 = v108._countAndFlagsBits;
          }
          v82 = _swiftEmptyArrayStorage[2];
          v81 = _swiftEmptyArrayStorage[3];
          if (v82 >= v81 >> 1)
            sub_10004FDF4((char *)(v81 > 1), v82 + 1, 1);
          _swiftEmptyArrayStorage[2] = v82 + 1;
          v83 = &_swiftEmptyArrayStorage[2 * v82];
          v83[4] = v80;
          v83[5] = v79;
          v63 += 24;
          --v54;
        }
        while (v54);
        swift_release(v12);
        v108._countAndFlagsBits = (uint64_t)_swiftEmptyArrayStorage;
        v84 = sub_100005104(&qword_1000B90C8);
        v85 = sub_1000062F8((unint64_t *)&qword_1000B90D0, &qword_1000B90C8, (uint64_t)&protocol conformance descriptor for [A]);
        v86 = BidirectionalCollection<>.joined(separator:)(32, 0xE100000000000000, v84, v85);
        v88 = v87;
        swift_release(_swiftEmptyArrayStorage);
        v108._countAndFlagsBits = 0;
        v108._object = (void *)0xE000000000000000;
        _StringGuts.grow(_:)(17);
        v89 = v108._object;
        swift_bridgeObjectRetain(v93._object);
        swift_bridgeObjectRelease(v89);
        v108 = v93;
        v90._countAndFlagsBits = 0x6F6974706F3C5B20;
        v90._object = (void *)0xED0000205D3E736ELL;
        String.append(_:)(v90);
        v91._countAndFlagsBits = v86;
        v91._object = v88;
        String.append(_:)(v91);
        swift_bridgeObjectRelease(v88);
        return v108._countAndFlagsBits;
      }
      else
      {
        swift_release(v12);
        *(_QWORD *)&v109 = v93._countAndFlagsBits;
        *((_QWORD *)&v109 + 1) = a2;
        swift_bridgeObjectRetain(a2);
        v55._countAndFlagsBits = 0x6E6F6974706F3C20;
        v55._object = (void *)0xEA00000000003E73;
        String.append(_:)(v55);
        return v109;
      }
    }
  }
  else
  {
    swift_release(v8);
    swift_bridgeObjectRetain(a2);
  }
  return a1;
}

unint64_t sub_100084E38()
{
  unint64_t *v0;
  unint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  Swift::String v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  int64_t v10;
  _QWORD *countAndFlagsBits;
  unsigned __int8 *v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  Swift::String v16;
  unint64_t v17;
  Swift::String v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  void *object;
  Swift::String v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  Swift::String v28;
  Swift::String v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  void *v33;
  Swift::String v34;
  _QWORD *v36;
  Swift::String v37;
  uint64_t v38;
  uint64_t v39;
  Swift::String v40;
  __n128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  Swift::String v47;
  __int128 v48;
  unint64_t v49;
  Swift::String v50;
  char v51;

  v1 = v0;
  v2 = *v0;
  if (!v2)
  {
    v41.n128_u64[0] = 60;
    v41.n128_u64[1] = 0xE100000000000000;
    v4 = *(Swift::String *)(v1 + 11);
    v46 = *(_OWORD *)(v1 + 9);
    v47 = v4;
    v48 = *(_OWORD *)(v1 + 13);
    v49 = v1[15];
    v5 = *(_OWORD *)(v1 + 3);
    v42 = *(_OWORD *)(v1 + 1);
    v43 = v5;
    v6 = *(_OWORD *)(v1 + 7);
    v44 = *(_OWORD *)(v1 + 5);
    v45 = v6;
    v50 = v47;
    v7 = v47._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
    if (((uint64_t)v47._object & 0x2000000000000000) != 0)
      v7 = ((unint64_t)v47._object >> 56) & 0xF;
    if (v7)
    {
      v40 = v47;
      swift_bridgeObjectRetain(v47._object);
    }
    else
    {
      swift_bridgeObjectRetain(v47._object);
      sub_10005D218(v1, (unint64_t *)&v40);
      sub_100030564((uint64_t)&v50);
    }
    object = v40._object;
    String.append(_:)(v40);
    swift_bridgeObjectRelease(object);
    v23._countAndFlagsBits = 62;
    v23._object = (void *)0xE100000000000000;
    String.append(_:)(v23);
    return v41.n128_u64[0];
  }
  if (v2 == 1)
    return 0;
  v8 = swift_bridgeObjectRetain(v2);
  v9 = sub_1000845C8(v8);
  sub_10002D990(v2);
  v10 = v9[2];
  if (!v10)
  {
    swift_bridgeObjectRelease(v9);
    countAndFlagsBits = _swiftEmptyArrayStorage;
    goto LABEL_23;
  }
  v50._countAndFlagsBits = (uint64_t)_swiftEmptyArrayStorage;
  sub_10004FDF4(0, v10, 0);
  countAndFlagsBits = _swiftEmptyArrayStorage;
  v36 = v9;
  v12 = (unsigned __int8 *)(v9 + 6);
  do
  {
    v14 = *((_QWORD *)v12 - 2);
    v13 = (void *)*((_QWORD *)v12 - 1);
    v15 = *v12;
    if (v15 >> 6)
    {
      if (v15 >> 6 == 1)
      {
        *(_QWORD *)&v42 = 0;
        *((_QWORD *)&v42 + 1) = 0xE000000000000000;
        swift_bridgeObjectRetain(v13);
        v16._countAndFlagsBits = 45;
        v16._object = (void *)0xE100000000000000;
        String.append(_:)(v16);
        Character.write<A>(to:)(&v42, v14, v13, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
        goto LABEL_16;
      }
      *(_QWORD *)&v42 = 45;
      v17 = 0xE100000000000000;
    }
    else
    {
      *(_QWORD *)&v42 = 11565;
      v17 = 0xE200000000000000;
    }
    *((_QWORD *)&v42 + 1) = v17;
    swift_bridgeObjectRetain(v13);
    v18._countAndFlagsBits = v14;
    v18._object = v13;
    String.append(_:)(v18);
LABEL_16:
    sub_10002DA24(v14, (uint64_t)v13, v15);
    v19 = v42;
    v50._countAndFlagsBits = (uint64_t)countAndFlagsBits;
    v21 = countAndFlagsBits[2];
    v20 = countAndFlagsBits[3];
    if (v21 >= v20 >> 1)
    {
      sub_10004FDF4((char *)(v20 > 1), v21 + 1, 1);
      countAndFlagsBits = (_QWORD *)v50._countAndFlagsBits;
    }
    v12 += 24;
    countAndFlagsBits[2] = v21 + 1;
    *(_OWORD *)&countAndFlagsBits[2 * v21 + 4] = v19;
    --v10;
  }
  while (v10);
  swift_bridgeObjectRelease(v36);
LABEL_23:
  *(_QWORD *)&v42 = countAndFlagsBits;
  v24 = sub_100005104(&qword_1000B90C8);
  v25 = sub_1000062F8((unint64_t *)&qword_1000B90D0, &qword_1000B90C8, (uint64_t)&protocol conformance descriptor for [A]);
  v3 = BidirectionalCollection<>.joined(separator:)(8236, 0xE200000000000000, v24, v25);
  v27 = v26;
  swift_bridgeObjectRelease(countAndFlagsBits);
  sub_10002D868((__n128 *)(v1 + 19), &v41);
  sub_10002D868(&v41, (__n128 *)&v50);
  if ((v51 & 1) != 0)
  {
    v38 = v3;
    v39 = v27;
    v28._countAndFlagsBits = 15392;
    v28._object = (void *)0xE200000000000000;
    String.append(_:)(v28);
    v29 = *(Swift::String *)(v1 + 11);
    v46 = *(_OWORD *)(v1 + 9);
    v47 = v29;
    v48 = *(_OWORD *)(v1 + 13);
    v49 = v1[15];
    v30 = *(_OWORD *)(v1 + 3);
    v42 = *(_OWORD *)(v1 + 1);
    v43 = v30;
    v31 = *(_OWORD *)(v1 + 7);
    v44 = *(_OWORD *)(v1 + 5);
    v45 = v31;
    v40 = v29;
    v32 = v29._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
    if (((uint64_t)v29._object & 0x2000000000000000) != 0)
      v32 = ((unint64_t)v29._object >> 56) & 0xF;
    if (v32)
    {
      v37 = v47;
      swift_bridgeObjectRetain(v29._object);
    }
    else
    {
      swift_bridgeObjectRetain(v29._object);
      sub_10005D218(v1, (unint64_t *)&v37);
      sub_100030564((uint64_t)&v40);
    }
    v33 = v37._object;
    String.append(_:)(v37);
    swift_bridgeObjectRelease(v33);
    v34._countAndFlagsBits = 62;
    v34._object = (void *)0xE100000000000000;
    String.append(_:)(v34);
    return v38;
  }
  return v3;
}

uint64_t sub_1000851F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
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
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;

  v55 = a1;
  swift_errorRetain(a1);
  v6 = sub_100005104(&qword_1000B98A0);
  if (swift_dynamicCast(&v43, &v55, v6, &type metadata for ParserError, 0))
  {
    v7 = v43;
    v8 = v44;
    v26 = v46;
    v27 = v45;
    v9 = v47;
    v10 = v49;
    v11 = v50;
    v12 = v51;
    v13 = v53;
    v56 = a2;
    v57 = a3;
    v58 = v43;
    v59 = v44;
    v33 = v43;
    v35 = v49;
    v37 = v47;
    v39 = v44;
    v60 = v45;
    v61 = v46;
    v62 = v47;
    v63 = v48;
    v64 = v49;
    v65 = v50;
    v29 = v48;
    v31 = v50;
    v66 = v51;
    v67 = v52;
    v14 = v52;
    v68 = v53;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a3);
    sub_100067314(v7, v8, v27, v26, v9, v29, v10, v11, v12, v14, v13);
    sub_100085DBC();
    v42 = v15;
    swift_bridgeObjectRelease(a3);
    swift_bridgeObjectRelease(a2);
    sub_10006749C(v33, v39, v27, v26, v37, v29, v35, v31, v12, v14, v13);
    sub_10006749C(v33, v39, v27, v26, v37, v29, v35, v31, v12, v14, v13);
LABEL_5:
    swift_errorRelease(v55);
    return v42;
  }
  swift_errorRelease(v55);
  v55 = a1;
  swift_errorRetain(a1);
  if (swift_dynamicCast(&v43, &v55, v6, &type metadata for CommandError, 0))
  {
    v16 = v44;
    v41 = v43;
    v18 = v45;
    v17 = v46;
    v28 = v48;
    v30 = v47;
    v20 = v49;
    v19 = v50;
    v21 = v52;
    v22 = v54;
    v56 = a2;
    v57 = a3;
    v58 = v44;
    v59 = v45;
    v36 = v45;
    v38 = v44;
    v60 = v46;
    v61 = v47;
    v62 = v48;
    v63 = v49;
    v40 = v49;
    v64 = v50;
    v65 = v51;
    v66 = v52;
    v67 = v53;
    v23 = v53;
    v32 = v51;
    v34 = v53;
    v68 = v54;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a3);
    sub_100067314(v16, v18, v17, v30, v28, v20, v19, v32, v21, v23, v22);
    sub_100085DBC();
    v42 = v24;
    swift_bridgeObjectRelease(a3);
    swift_bridgeObjectRelease(a2);
    sub_10006749C(v38, v36, v17, v30, v28, v40, v19, v32, v21, v34, v22);
    swift_bridgeObjectRelease(v41);
    sub_10006749C(v38, v36, v17, v30, v28, v40, v19, v32, v21, v34, v22);
    goto LABEL_5;
  }
  swift_errorRelease(v55);
  return 0;
}

uint64_t sub_100085524(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
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
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
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
  void *v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  _QWORD *v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD *v93;
  _QWORD *v94;
  _QWORD *v95;
  char v96;

  v83 = a1;
  swift_errorRetain(a1);
  v6 = sub_100005104(&qword_1000B98A0);
  if (swift_dynamicCast(&v71, &v83, v6, &type metadata for ParserError, 0))
  {
    v7 = v71;
    v8 = v72;
    v10 = v73;
    v9 = (uint64_t)v74;
    v11 = a2;
    v12 = v79;
    v13 = (uint64_t)v80;
    v14 = v81;
    v84 = v11;
    v85 = a3;
    v15 = a3;
    v86 = v71;
    v87 = v72;
    v88 = v73;
    v89 = v74;
    v90 = v75;
    v91 = v76;
    v16 = v77;
    v92 = v77;
    v93 = (_QWORD *)v78;
    v17 = v78;
    v94 = v79;
    v95 = v80;
    v96 = v81;
    v67 = v11;
    v60 = v75;
    if (v81 == 7)
    {
      v34 = v76;
      v57 = v76;
      v48 = v72;
      v35 = v75;
      swift_bridgeObjectRetain(v11);
      v63 = v15;
      swift_bridgeObjectRetain(v15);
      v47 = (uint64_t)v12;
      v36 = v16;
      v37 = (uint64_t)v12;
      v49 = (uint64_t)v12;
      v38 = v36;
      sub_100067314(v7, v48, (uint64_t)v10, v9, v35, v34, v36, v17, v47, v13, 7);
      v20 = sub_100086BE0(v48, v10, v9);
      swift_bridgeObjectRelease(v63);
      swift_bridgeObjectRelease(v67);
      sub_10006749C(v7, v48, (uint64_t)v10, v9, v60, v57, v38, v17, v37, v13, 7);
      sub_10006749C(v7, v48, (uint64_t)v10, v9, v60, v57, v38, v17, v49, v13, 7);
      goto LABEL_21;
    }
    if (v81 == 11)
    {
      v39 = v76;
      v58 = v76;
      v53 = v73;
      v40 = v75;
      swift_bridgeObjectRetain(v11);
      v64 = v15;
      swift_bridgeObjectRetain(v15);
      sub_100067314(v7, v8, (uint64_t)v53, v9, v40, v39, v16, v17, (uint64_t)v12, v13, 11);
      v20 = sub_100086DA8(v7, v8, v53);
      swift_bridgeObjectRelease(v64);
      swift_bridgeObjectRelease(v67);
      sub_10006749C(v7, v8, (uint64_t)v53, v9, v60, v58, v16, v17, (uint64_t)v12, v13, 11);
      sub_10006749C(v7, v8, (uint64_t)v53, v9, v60, v58, v16, v17, (uint64_t)v12, v13, 11);
      goto LABEL_21;
    }
    v54 = v77;
    if (v81 == 12)
    {
      v18 = v76;
      v50 = v78;
      v19 = v75;
      swift_bridgeObjectRetain(v11);
      v62 = v15;
      swift_bridgeObjectRetain(v15);
      sub_100067314(v7, v8, (uint64_t)v10, v9, v19, v18, v16, v50, (uint64_t)v12, v13, 12);
      swift_errorRetain(v13);
      v20 = sub_10008A9CC(v8, v10, v9, v16, v50, v12);
      swift_errorRelease(v13);
      swift_bridgeObjectRelease(v62);
      swift_bridgeObjectRelease(v67);
      sub_10006749C(v7, v8, (uint64_t)v10, v9, v60, v18, v16, v50, (uint64_t)v12, v13, 12);
      sub_10006749C(v7, v8, (uint64_t)v10, v9, v60, v18, v54, v50, (uint64_t)v12, v13, 12);
LABEL_21:
      swift_errorRelease(v83);
      return v20;
    }
    v59 = v76;
    v41 = v75;
    swift_bridgeObjectRetain(v11);
    swift_bridgeObjectRetain(v15);
    sub_100067314(v7, v8, (uint64_t)v10, v9, v41, v59, v54, v17, (uint64_t)v12, v13, v14);
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v67);
    sub_10006749C(v7, v8, (uint64_t)v10, v9, v41, v59, v54, v17, (uint64_t)v12, v13, v14);
    sub_10006749C(v7, v8, (uint64_t)v10, v9, v60, v59, v54, v17, (uint64_t)v12, v13, v14);
LABEL_20:
    v20 = 0;
    goto LABEL_21;
  }
  swift_errorRelease(v83);
  v83 = a1;
  swift_errorRetain(a1);
  if (swift_dynamicCast(&v71, &v83, v6, &type metadata for CommandError, 0))
  {
    v21 = v72;
    v23 = (uint64_t)v73;
    v22 = v74;
    v24 = v75;
    v25 = v78;
    v26 = v80;
    v27 = v81;
    v28 = v82;
    v84 = a2;
    v85 = a3;
    v86 = v72;
    v87 = (uint64_t)v73;
    v88 = v74;
    v89 = (_QWORD *)v75;
    v90 = v76;
    v91 = v77;
    v92 = v78;
    v93 = v79;
    v94 = v80;
    v95 = (_QWORD *)v81;
    v96 = v82;
    v55 = v71;
    v56 = v77;
    v61 = (uint64_t)v79;
    v52 = v76;
    switch(v82)
    {
      case 7:
        v42 = (uint64_t)v79;
        swift_bridgeObjectRetain(a2);
        v65 = a3;
        swift_bridgeObjectRetain(a3);
        v68 = a2;
        v30 = v52;
        v32 = v56;
        sub_100067314(v21, v23, (uint64_t)v22, v24, v52, v56, v25, v42, (uint64_t)v26, v27, 7);
        v51 = sub_100086BE0(v23, v22, v24);
        swift_bridgeObjectRelease(v65);
        swift_bridgeObjectRelease(v68);
        v31 = v61;
        sub_10006749C(v21, v23, (uint64_t)v22, v24, v52, v56, v25, v61, (uint64_t)v26, v27, 7);
        swift_bridgeObjectRelease(v55);
        v33 = 7;
        break;
      case 11:
        v43 = (uint64_t)v79;
        swift_bridgeObjectRetain(a2);
        v66 = a3;
        swift_bridgeObjectRetain(a3);
        v69 = a2;
        v30 = v52;
        v32 = v56;
        sub_100067314(v21, v23, (uint64_t)v22, v24, v52, v56, v25, v43, (uint64_t)v26, v27, 11);
        v51 = sub_100086DA8(v21, v23, v22);
        swift_bridgeObjectRelease(v66);
        swift_bridgeObjectRelease(v69);
        v31 = v61;
        sub_10006749C(v21, v23, (uint64_t)v22, v24, v52, v56, v25, v61, (uint64_t)v26, v27, 11);
        swift_bridgeObjectRelease(v55);
        v33 = 11;
        break;
      case 12:
        v29 = v77;
        swift_bridgeObjectRetain(a2);
        swift_bridgeObjectRetain(a3);
        sub_100067314(v21, v23, (uint64_t)v22, v24, v52, v29, v25, v61, (uint64_t)v26, v27, 12);
        swift_errorRetain(v27);
        v51 = sub_10008A9CC(v23, v22, v24, v25, v61, v26);
        swift_errorRelease(v27);
        swift_bridgeObjectRelease(a3);
        swift_bridgeObjectRelease(a2);
        v30 = v52;
        v32 = v56;
        v31 = v61;
        sub_10006749C(v21, v23, (uint64_t)v22, v24, v52, v56, v25, v61, (uint64_t)v26, v27, 12);
        swift_bridgeObjectRelease(v55);
        v33 = 12;
        break;
      default:
        v70 = v78;
        v45 = v76;
        swift_bridgeObjectRetain(a2);
        swift_bridgeObjectRetain(a3);
        sub_100067314(v21, v23, (uint64_t)v22, v24, v45, v56, v70, v61, (uint64_t)v26, v27, v28);
        swift_bridgeObjectRelease(a3);
        swift_bridgeObjectRelease(a2);
        sub_10006749C(v21, v23, (uint64_t)v22, v24, v45, v56, v70, v61, (uint64_t)v26, v27, v28);
        swift_bridgeObjectRelease(v55);
        sub_10006749C(v21, v23, (uint64_t)v22, v24, v52, v56, v70, v61, (uint64_t)v26, v27, v28);
        goto LABEL_20;
    }
    v44 = v24;
    v20 = v51;
    sub_10006749C(v21, v23, (uint64_t)v22, v44, v30, v32, v25, v31, (uint64_t)v26, v27, v33);
    goto LABEL_21;
  }
  swift_errorRelease(v83);
  return 0;
}

void sub_100085DBC()
{
  __asm { BR              X10 }
}

uint64_t sub_100085E18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!v7)
    return sub_100089454();
  v15 = v8;
  v16 = v1;
  v9 = v2;
  v10 = v8;
  v11 = v2;
  v12 = v0;
  sub_100067314(v3, (uint64_t)v7, v4, v9, v10, v0, v17, v5, v1, v6, 3);
  v13 = sub_10008929C(v3, v7);
  sub_10006749C(v3, (uint64_t)v7, v4, v11, v15, v12, v17, v5, v16, v6, 3);
  return v13;
}

uint64_t sub_100086728(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char v22;
  int v23;
  void *v24;
  Swift::String v25;
  uint64_t countAndFlagsBits;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  Swift::String v34;
  Swift::String v35;
  void *object;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  Swift::String v42;
  uint64_t result;
  uint64_t v44;
  char *v45;
  Swift::String v46;
  _OWORD v47[3];
  _BYTE v48[32];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[32];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[32];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[32];
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;

  v7 = *v3;
  v65 = v3[1];
  v66 = v7;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a3);
  sub_10002AB10(&v66);
  sub_10002AB10(&v65);
  v8 = sub_10008A29C(v7, a1, a2, a3);
  swift_bridgeObjectRelease(a3);
  swift_bridgeObjectRelease(a2);
  sub_10002ABC8(&v66);
  sub_10002ABC8(&v65);
  v9 = *(_QWORD *)(v8 + 16);
  if (!v9)
  {
    swift_bridgeObjectRelease(v8);
    v11 = (char *)_swiftEmptyArrayStorage;
    v31 = _swiftEmptyArrayStorage[2];
    if (v31)
      goto LABEL_17;
LABEL_21:
    swift_bridgeObjectRelease(v11);
    *(_QWORD *)&v55 = 0;
    *((_QWORD *)&v55 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(86);
    v34._countAndFlagsBits = 0xD000000000000022;
    v34._object = (void *)0x800000010009E040;
    String.append(_:)(v34);
    v35._countAndFlagsBits = sub_10006C590(a1, a2, a3);
    object = v35._object;
    String.append(_:)(v35);
    swift_bridgeObjectRelease(object);
    v37 = 0xD000000000000032;
    v38 = 0x800000010009E070;
LABEL_24:
    String.append(_:)(*(Swift::String *)&v37);
    return v55;
  }
  v44 = a1;
  v45 = a3;
  swift_bridgeObjectRetain(v8);
  v10 = v9 - 1;
  v11 = (char *)_swiftEmptyArrayStorage;
  for (i = 32; ; i += 192)
  {
    v13 = *(_OWORD *)(v8 + i);
    v14 = *(_OWORD *)(v8 + i + 16);
    v15 = *(_OWORD *)(v8 + i + 48);
    v57 = *(_OWORD *)(v8 + i + 32);
    *(_OWORD *)v58 = v15;
    v55 = v13;
    v56 = v14;
    v16 = *(_OWORD *)(v8 + i + 64);
    v17 = *(_OWORD *)(v8 + i + 80);
    v18 = *(_OWORD *)(v8 + i + 112);
    v60 = *(_OWORD *)(v8 + i + 96);
    v61 = v18;
    *(_OWORD *)&v58[16] = v16;
    v59 = v17;
    v19 = *(_OWORD *)(v8 + i + 128);
    v20 = *(_OWORD *)(v8 + i + 144);
    v21 = *(_OWORD *)(v8 + i + 176);
    *(_OWORD *)&v63[16] = *(_OWORD *)(v8 + i + 160);
    v64 = v21;
    v62 = v19;
    *(_OWORD *)v63 = v20;
    if (!BYTE8(v60))
    {
      v22 = BYTE8(v55);
      v23 = v63[1];
      *(_QWORD *)&v47[0] = v55;
      *((_QWORD *)&v47[0] + 1) = *((_QWORD *)&v55 + 1) & 0xFFFFFFFFFFFFFFFELL;
      v47[1] = v56;
      v47[2] = v57;
      v48[0] = v58[0];
      *(_OWORD *)&v48[8] = *(_OWORD *)&v58[8];
      *(_QWORD *)&v48[24] = *(_QWORD *)&v58[24];
      v49 = v59;
      *(_QWORD *)&v50 = v60;
      BYTE8(v50) = 0;
      v51 = v61;
      v52 = v62;
      *(_WORD *)v53 = *(_WORD *)v63;
      *(_OWORD *)&v53[8] = *(_OWORD *)&v63[8];
      v53[24] = v63[24];
      v54 = v64;
      v73 = v50;
      v74 = v61;
      v71 = *(_OWORD *)&v48[16];
      v72 = v59;
      v69 = v57;
      v70 = *(_OWORD *)v48;
      v67 = v47[0];
      v68 = v56;
      v77 = *(_OWORD *)&v53[16];
      v78 = v64;
      v75 = v62;
      v76 = *(_OWORD *)v53;
      sub_10002D724((uint64_t)&v55);
      sub_10002D724((uint64_t)&v55);
      v46._countAndFlagsBits = sub_1000841B8();
      v46._object = v24;
      if ((v22 & 2) != 0)
      {
        v25._countAndFlagsBits = 774778400;
        v25._object = (void *)0xE400000000000000;
        String.append(_:)(v25);
      }
      if (v23 == 5)
      {
        String.append(_:)(v46);
        swift_bridgeObjectRelease(v46._object);
        sub_10002D8A4((uint64_t)v47);
        sub_10002D8A4((uint64_t)&v55);
        countAndFlagsBits = 2108717;
        v27 = 0xE300000000000000;
      }
      else
      {
        sub_10002D8A4((uint64_t)v47);
        sub_10002D8A4((uint64_t)&v55);
        v27 = (unint64_t)v46._object;
        countAndFlagsBits = v46._countAndFlagsBits;
      }
      if ((swift_isUniquelyReferenced_nonNull_native(v11) & 1) == 0)
        v11 = sub_100057AB8(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
      v29 = *((_QWORD *)v11 + 2);
      v28 = *((_QWORD *)v11 + 3);
      if (v29 >= v28 >> 1)
        v11 = sub_100057AB8((char *)(v28 > 1), v29 + 1, 1, v11);
      *((_QWORD *)v11 + 2) = v29 + 1;
      v30 = &v11[16 * v29];
      *((_QWORD *)v30 + 4) = countAndFlagsBits;
      *((_QWORD *)v30 + 5) = v27;
    }
    if (!v10)
      break;
    --v10;
  }
  swift_bridgeObjectRelease_n(v8, 2);
  a1 = v44;
  a3 = v45;
  v31 = *((_QWORD *)v11 + 2);
  if (!v31)
    goto LABEL_21;
LABEL_17:
  if (v31 != 1)
  {
    *(_QWORD *)&v55 = v11;
    v39 = sub_100005104(&qword_1000B90C8);
    v40 = sub_1000062F8((unint64_t *)&qword_1000B90D0, &qword_1000B90C8, (uint64_t)&protocol conformance descriptor for [A]);
    v32 = BidirectionalCollection<>.joined(separator:)(656419879, 0xE400000000000000, v39, v40);
    v33 = v41;
    swift_bridgeObjectRelease(v11);
    *(_QWORD *)&v55 = 0;
    *((_QWORD *)&v55 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(20);
    swift_bridgeObjectRelease(*((_QWORD *)&v55 + 1));
    *(_QWORD *)&v55 = 0xD000000000000011;
    *((_QWORD *)&v55 + 1) = 0x800000010009E000;
    goto LABEL_23;
  }
  *(_QWORD *)&v55 = 0;
  *((_QWORD *)&v55 + 1) = 0xE000000000000000;
  _StringGuts.grow(_:)(30);
  swift_bridgeObjectRelease(*((_QWORD *)&v55 + 1));
  *(_QWORD *)&v55 = 0xD00000000000001BLL;
  *((_QWORD *)&v55 + 1) = 0x800000010009E020;
  if (*((_QWORD *)v11 + 2))
  {
    v32 = *((_QWORD *)v11 + 4);
    v33 = (void *)*((_QWORD *)v11 + 5);
    swift_bridgeObjectRetain(v33);
    swift_bridgeObjectRelease(v11);
LABEL_23:
    v42._countAndFlagsBits = v32;
    v42._object = v33;
    String.append(_:)(v42);
    swift_bridgeObjectRelease(v33);
    v37 = 39;
    v38 = 0xE100000000000000;
    goto LABEL_24;
  }
  result = swift_bridgeObjectRelease(v11);
  __break(1u);
  return result;
}

uint64_t sub_100086BE0(uint64_t a1, void *a2, int a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  Swift::String v15;
  uint64_t v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  unint64_t v20[3];
  _QWORD v21[24];
  _OWORD v22[12];
  _BYTE v23[192];
  _OWORD v24[3];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  Swift::String v34;

  v8 = *v3;
  v7 = v3[1];
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v7);
  sub_100030508(a1, (uint64_t)a2, a3);
  sub_100083EF8(v8, v7, a1, (uint64_t)a2, a3, (uint64_t)v21);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v8);
  sub_10005BFC4((uint64_t)v21, (uint64_t)v23);
  sub_10005BFC4((uint64_t)v23, (uint64_t)v24);
  if (sub_100033CB4((uint64_t)v24) == 1)
    return 0;
  v22[8] = v30;
  v22[9] = v31;
  v22[10] = v32;
  v22[11] = v33;
  v22[4] = v26;
  v22[5] = v27;
  v22[6] = v28;
  v22[7] = v29;
  v22[0] = v24[0];
  v22[1] = v24[1];
  v22[2] = v24[2];
  v22[3] = v25;
  v10 = *((_QWORD *)&v25 + 1);
  v11 = (void *)v26;
  v12 = *((_QWORD *)&v27 + 1);
  v13 = v28;
  swift_bridgeObjectRetain(v26);
  v34._countAndFlagsBits = a1;
  v34._object = a2;
  v21[0] = sub_10006D63C(v34, a3);
  v21[1] = v14;
  v15._countAndFlagsBits = 15392;
  v15._object = (void *)0xE200000000000000;
  String.append(_:)(v15);
  if ((v13 & 0x2000000000000000) != 0)
    v16 = HIBYTE(v13) & 0xF;
  else
    v16 = v12 & 0xFFFFFFFFFFFFLL;
  swift_bridgeObjectRetain(v13);
  if (!v16)
  {
    sub_10005D218(v22, v20);
    swift_bridgeObjectRelease(v13);
    v12 = v20[0];
    v13 = v20[1];
  }
  v17._countAndFlagsBits = v12;
  v17._object = (void *)v13;
  String.append(_:)(v17);
  swift_bridgeObjectRelease(v13);
  v18._countAndFlagsBits = 2105406;
  v18._object = (void *)0xE300000000000000;
  String.append(_:)(v18);
  v19._countAndFlagsBits = v10;
  v19._object = v11;
  String.append(_:)(v19);
  swift_bridgeObjectRelease(v11);
  sub_100033CCC((uint64_t)v23);
  return v21[0];
}

uint64_t sub_100086DA8(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD *v22;
  uint64_t v24;
  void *v25;
  unsigned __int8 v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  Swift::String v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *object;
  Swift::String v35;
  Swift::String v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  Swift::String v41;
  uint64_t v42;
  unint64_t v43;
  char v44[24];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE v53[192];
  _BYTE v54[128];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  Swift::String v67;
  _BYTE v68[192];
  _BYTE v69[208];
  Swift::String v70;

  v7 = *v3;
  v8 = v3[1];
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  sub_100083D50(v7, v8, a1, a2, a3, (uint64_t)v53);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v7);
  sub_10005BFC4((uint64_t)v53, (uint64_t)v68);
  sub_10005BFC4((uint64_t)v68, (uint64_t)v69);
  if (sub_100033CB4((uint64_t)v69) == 1)
    return 0;
  sub_10005BFC4((uint64_t)v68, (uint64_t)v44);
  v40 = a1;
  v9 = v46;
  v39 = v45;
  v10 = v47;
  v11 = v49;
  v37 = v48;
  v12 = v50;
  v13 = v51;
  v14 = v52;
  swift_bridgeObjectRetain(v45);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v10);
  v38 = v11;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRetain(v14);
  sub_100033CCC((uint64_t)v68);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v39);
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  v15 = sub_10008A29C(v7, v40, a2, a3);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(a3);
  swift_bridgeObjectRelease(a2);
  if (!*(_QWORD *)(v15 + 16))
  {
    swift_bridgeObjectRelease(v38);
    swift_bridgeObjectRelease(v15);
    return 0;
  }
  v16 = *(_OWORD *)(v15 + 176);
  v55 = *(_OWORD *)(v15 + 160);
  v56 = v16;
  v17 = *(_OWORD *)(v15 + 208);
  v57 = *(_OWORD *)(v15 + 192);
  v58 = v17;
  v18 = *(_OWORD *)(v15 + 112);
  *(_OWORD *)&v54[64] = *(_OWORD *)(v15 + 96);
  *(_OWORD *)&v54[80] = v18;
  v19 = *(_OWORD *)(v15 + 144);
  *(_OWORD *)&v54[96] = *(_OWORD *)(v15 + 128);
  *(_OWORD *)&v54[112] = v19;
  v20 = *(_OWORD *)(v15 + 48);
  *(_OWORD *)v54 = *(_OWORD *)(v15 + 32);
  *(_OWORD *)&v54[16] = v20;
  v21 = *(_OWORD *)(v15 + 80);
  *(_OWORD *)&v54[32] = *(_OWORD *)(v15 + 64);
  *(_OWORD *)&v54[48] = v21;
  v22 = *(_QWORD **)v54;
  sub_10002D724((uint64_t)v54);
  swift_bridgeObjectRelease(v15);
  if ((unint64_t)v22 >= 2)
    swift_bridgeObjectRetain(v22);
  else
    v22 = _swiftEmptyArrayStorage;
  v63 = *(_OWORD *)&v54[72];
  v64 = *(_OWORD *)&v54[88];
  v65 = *(_OWORD *)&v54[104];
  v66 = *(_QWORD *)&v54[120];
  v59 = *(_OWORD *)&v54[8];
  v60 = *(_OWORD *)&v54[24];
  v61 = *(_OWORD *)&v54[40];
  v62 = *(_OWORD *)&v54[56];
  v67 = *(Swift::String *)&v54[88];
  if (v22[2])
  {
    v24 = v22[4];
    v25 = (void *)v22[5];
    v26 = *((_BYTE *)v22 + 48);
    sub_100030508(v24, (uint64_t)v25, v26);
    swift_bridgeObjectRelease(v22);
    v70._countAndFlagsBits = v24;
    v70._object = v25;
    v27 = sub_10006D63C(v70, v26);
    v29 = v28;
    sub_10002DA24(v24, (uint64_t)v25, v26);
    v42 = v27;
    v43 = v29;
    v30._countAndFlagsBits = 15392;
    v30._object = (void *)0xE200000000000000;
    String.append(_:)(v30);
    v31 = v67._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
    if (((uint64_t)v67._object & 0x2000000000000000) != 0)
      v31 = ((unint64_t)v67._object >> 56) & 0xF;
    if (v31)
    {
      v41 = v67;
      swift_bridgeObjectRetain(v67._object);
    }
    else
    {
      swift_bridgeObjectRetain(v67._object);
      sub_10005D218(v54, (unint64_t *)&v41);
      sub_100030564((uint64_t)&v67);
    }
    v33 = v38;
  }
  else
  {
    swift_bridgeObjectRelease(v22);
    v42 = 60;
    v43 = 0xE100000000000000;
    v32 = v67._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
    if (((uint64_t)v67._object & 0x2000000000000000) != 0)
      v32 = ((unint64_t)v67._object >> 56) & 0xF;
    v33 = v38;
    if (v32)
    {
      v41 = v67;
      swift_bridgeObjectRetain(v67._object);
    }
    else
    {
      swift_bridgeObjectRetain(v67._object);
      sub_10005D218(v54, (unint64_t *)&v41);
      sub_100030564((uint64_t)&v67);
    }
  }
  object = v41._object;
  String.append(_:)(v41);
  swift_bridgeObjectRelease(object);
  v35._countAndFlagsBits = 2105406;
  v35._object = (void *)0xE300000000000000;
  String.append(_:)(v35);
  v36._countAndFlagsBits = v37;
  v36._object = v33;
  String.append(_:)(v36);
  swift_bridgeObjectRelease(v33);
  sub_10002D8A4((uint64_t)v54);
  return v42;
}

unint64_t sub_100087188(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v13;
  _OWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[192];
  _OWORD v23[12];
  _BYTE v24[192];
  _BYTE v25[192];

  v8 = *v3;
  v7 = v3[1];
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v7);
  sub_100030508(a1, a2, a3);
  sub_100083EF8(v8, v7, a1, a2, a3, (uint64_t)v22);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v8);
  sub_10005BFC4((uint64_t)v22, (uint64_t)v24);
  sub_10005BFC4((uint64_t)v24, (uint64_t)v25);
  v9 = 0;
  if (sub_100033CB4((uint64_t)v25) != 1)
  {
    sub_10005BFC4((uint64_t)v24, (uint64_t)v14);
    v9 = *((_QWORD *)&v15 + 1);
    v10 = v16;
    if ((v16 & 0x2000000000000000) != 0)
      v11 = BYTE7(v16) & 0xF;
    else
      v11 = *((_QWORD *)&v15 + 1) & 0xFFFFFFFFFFFFLL;
    v23[8] = v18;
    v23[9] = v19;
    v23[10] = v20;
    v23[11] = v21;
    v23[4] = v14[4];
    v23[5] = v15;
    v23[6] = v16;
    v23[7] = v17;
    v23[0] = v14[0];
    v23[1] = v14[1];
    v23[2] = v14[2];
    v23[3] = v14[3];
    swift_bridgeObjectRetain(v16);
    if (v11)
    {
      sub_100033CCC((uint64_t)v24);
    }
    else
    {
      sub_10005D218(v23, &v13);
      swift_bridgeObjectRelease(v10);
      sub_100033CCC((uint64_t)v24);
      return v13;
    }
  }
  return v9;
}

void sub_1000872F4(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
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
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  BOOL v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;

  v5 = a3;
  v8 = String.count.getter(a3, a4);
  v109 = a1;
  v111 = a2;
  v9 = String.count.getter(a1, a2);
  if (v8 < 1 || v9 < 1)
    return;
  if ((a2 & 0x2000000000000000) != 0)
    v10 = HIBYTE(a2) & 0xF;
  else
    v10 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a4 & 0x2000000000000000) != 0)
    v11 = HIBYTE(a4) & 0xF;
  else
    v11 = v5 & 0xFFFFFFFFFFFFLL;
  v103 = 4 * v11;
  v105 = 4 * v10;
  v107 = v5;
  v12 = 0;
  if (!v11)
  {
    v23 = 0;
LABEL_22:
    v13 = 15;
    v14 = 15;
    goto LABEL_25;
  }
  if (!v10)
  {
    v23 = 1;
    goto LABEL_22;
  }
  v13 = 15;
  v14 = 15;
  while (1)
  {
    swift_bridgeObjectRetain(a4);
    v15 = String.subscript.getter(v14, v5, a4);
    v17 = v16;
    v19 = String.subscript.getter(v13, v109, v111);
    v20 = v18;
    if (v15 == v19 && v17 == v18)
    {
      swift_bridgeObjectRelease(a4);
      swift_bridgeObjectRelease_n(v17, 2);
      goto LABEL_16;
    }
    v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v17, v19, v18, 0);
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(v17);
    swift_bridgeObjectRelease(v20);
    if ((v21 & 1) == 0)
      break;
LABEL_16:
    v5 = v107;
    v14 = String.index(after:)(v14, v107, a4);
    v22 = String.index(after:)(v13, v109, v111);
    v13 = v22;
    v12 = v14 >> 14;
    if (v14 >> 14 >= v103)
    {
      v23 = 0;
      goto LABEL_25;
    }
    if (v105 <= v22 >> 14)
    {
      v23 = 1;
      goto LABEL_25;
    }
  }
  v23 = 1;
  v5 = v107;
LABEL_25:
  v24 = 7;
  if (((a4 >> 60) & ((v5 & 0x800000000000000) == 0)) != 0)
    v25 = 11;
  else
    v25 = 7;
  v26 = v25 | (v11 << 16);
  if (((v111 >> 60) & ((v109 & 0x800000000000000) == 0)) != 0)
    v24 = 11;
  v27 = v24 | (v10 << 16);
  v28 = v13 >> 14;
  if (v23 && v28 < v105)
  {
    v97 = v25 | (v11 << 16);
    v29 = String.index(before:)(v26, v5, a4);
    v100 = v27;
    v30 = String.index(before:)(v27, v109, v111);
    v94 = v29;
    v31 = String.subscript.getter(v29, v5, a4);
    v33 = v32;
    v35 = String.subscript.getter(v30, v109, v111);
    v36 = v34;
    if (v31 == v35 && v33 == v34)
    {
      swift_bridgeObjectRelease_n(v33, 2);
      v28 = v13 >> 14;
LABEL_36:
      v26 = v94;
      if (v12 >= v94 >> 14)
      {
        v27 = v30;
      }
      else
      {
        v27 = v30;
        if (v28 < v30 >> 14)
        {
          while (1)
          {
            v98 = v26;
            v38 = String.index(before:)(v26, v5, a4);
            v101 = v27;
            v39 = String.index(before:)(v27, v109, v111);
            v40 = String.subscript.getter(v38, v5, a4);
            v42 = v41;
            v44 = String.subscript.getter(v39, v109, v111);
            v45 = v43;
            if (v40 != v44)
              goto LABEL_41;
            if (v42 == v43)
            {
              swift_bridgeObjectRelease_n(v42, 2);
              v5 = v107;
              v28 = v13 >> 14;
            }
            else
            {
LABEL_41:
              v46 = _stringCompareWithSmolCheck(_:_:expecting:)(v40, v42, v44, v43, 0);
              swift_bridgeObjectRelease(v42);
              swift_bridgeObjectRelease(v45);
              v5 = v107;
              v28 = v13 >> 14;
              v26 = v98;
              v27 = v101;
              if ((v46 & 1) == 0)
                goto LABEL_47;
            }
            if (v12 >= v38 >> 14)
              break;
            v27 = v39;
            v26 = v38;
            if (v28 >= v39 >> 14)
              goto LABEL_47;
          }
          v27 = v39;
          v26 = v38;
        }
      }
    }
    else
    {
      v37 = _stringCompareWithSmolCheck(_:_:expecting:)(v31, v33, v35, v34, 0);
      swift_bridgeObjectRelease(v33);
      swift_bridgeObjectRelease(v36);
      v28 = v13 >> 14;
      v26 = v97;
      v27 = v100;
      if ((v37 & 1) != 0)
        goto LABEL_36;
    }
  }
LABEL_47:
  if (v12 == v103 && v28 == v105)
    return;
  if (v12 >= v26 >> 14)
  {
    v47 = v13;
    v26 = v27;
    v48 = v109;
    v49 = v111;
    goto LABEL_56;
  }
  v47 = v14;
  v48 = v5;
  v49 = a4;
  if (v28 >= v27 >> 14)
  {
LABEL_56:
    String.distance(from:to:)(v47, v26, v48, v49);
    return;
  }
  v50 = String.subscript.getter(v14, v26, v5, a4);
  v52 = v51;
  v54 = v53;
  v56 = v55;
  v57 = String.subscript.getter(v13, v27, v109, v111);
  v59 = v58;
  v61 = v60;
  v63 = v62;
  swift_bridgeObjectRetain(v56);
  v108 = v50;
  v99 = v54;
  v102 = v52;
  v90 = Substring.distance(from:to:)(v50, v52, v50, v52, v54, v56);
  v106 = v56;
  swift_bridgeObjectRelease(v56);
  swift_bridgeObjectRetain(v63);
  v104 = v61;
  v64 = Substring.distance(from:to:)(v57, v59, v57, v59, v61, v63);
  swift_bridgeObjectRelease(v63);
  v65 = v64 + 1;
  if (__OFADD__(v64, 1))
  {
LABEL_97:
    __break(1u);
    goto LABEL_98;
  }
  if (v65 < 0)
  {
LABEL_98:
    __break(1u);
LABEL_99:
    __break(1u);
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  if (v64 == -1)
  {
    v66 = (char *)_swiftEmptyArrayStorage;
  }
  else
  {
    v66 = (char *)static Array._allocateBufferUninitialized(minimumCapacity:)(v64 + 1, &type metadata for Int);
    *((_QWORD *)v66 + 2) = v65;
    bzero(v66 + 32, 8 * v64 + 8);
  }
  if (v64 < 0)
    goto LABEL_99;
  v96 = v59;
  v67 = (char *)sub_10004FCF8(0, v64);
  if (v90 < 1 || !v64)
    goto LABEL_100;
  v68 = v67;
  v69 = 1;
  v110 = v50;
  v92 = v64;
  v93 = v57;
  while (1)
  {
    if ((swift_isUniquelyReferenced_nonNull_native(v66) & 1) != 0)
    {
      v70 = v66;
      if (!*((_QWORD *)v66 + 2))
        break;
      goto LABEL_64;
    }
    v70 = sub_10005B93C((uint64_t)v66);
    if (!*((_QWORD *)v70 + 2))
      break;
LABEL_64:
    v71 = 0;
    v72 = 0;
    v91 = v69;
    *((_QWORD *)v70 + 4) = v69;
    v73 = v57;
    v74 = v96;
    v75 = v104;
    v95 = v70;
    do
    {
      v76 = v68;
      v112 = v72 + 1;
      v77 = Substring.subscript.getter(v110, v108, v102, v99, v106);
      v79 = v78;
      v80 = v57;
      v81 = v63;
      v83 = Substring.subscript.getter(v73, v80, v74, v75, v63);
      v84 = v82;
      if (v77 == v83 && v79 == v82)
      {
        swift_bridgeObjectRelease_n(v79, 2);
      }
      else
      {
        v85 = _stringCompareWithSmolCheck(_:_:expecting:)(v77, v79, v83, v82, 0);
        swift_bridgeObjectRelease(v79);
        swift_bridgeObjectRelease(v84);
        if ((v85 & 1) == 0)
        {
          if (v112 >= *((_QWORD *)v76 + 2))
            goto LABEL_92;
          v68 = v76;
          v70 = v95;
          v87 = *((_QWORD *)v95 + 2);
          if (v72 >= v87)
            goto LABEL_93;
          v88 = *(_QWORD *)&v68[v71 + 32];
          if (v88 >= *(_QWORD *)&v95[v71 + 32])
            v88 = *(_QWORD *)&v95[v71 + 32];
          if (v88 >= *(_QWORD *)&v68[v71 + 40])
            v88 = *(_QWORD *)&v68[v71 + 40];
          v89 = __OFADD__(v88, 1);
          v86 = v88 + 1;
          if (v89)
            goto LABEL_94;
          if (v112 >= v87)
            goto LABEL_95;
          v63 = v81;
          v75 = v104;
          goto LABEL_65;
        }
      }
      v75 = v104;
      if (v72 >= *((_QWORD *)v76 + 2))
      {
        __break(1u);
LABEL_91:
        __break(1u);
LABEL_92:
        __break(1u);
LABEL_93:
        __break(1u);
LABEL_94:
        __break(1u);
LABEL_95:
        __break(1u);
LABEL_96:
        __break(1u);
        goto LABEL_97;
      }
      v68 = v76;
      v70 = v95;
      if (v112 >= *((_QWORD *)v95 + 2))
        goto LABEL_91;
      v63 = v81;
      v86 = *(_QWORD *)&v68[v71 + 32];
LABEL_65:
      *(_QWORD *)&v70[v71 + 40] = v86;
      v57 = v93;
      v74 = v96;
      v73 = Substring.index(after:)(v73, v93, v96, v75, v63);
      ++v72;
      v71 += 8;
      v64 = v92;
    }
    while (v92 != v72);
    v110 = Substring.index(after:)(v110, v108, v102, v99, v106);
    if (v91 == v90)
      goto LABEL_88;
    v66 = v68;
    v68 = v70;
    v69 = v91 + 1;
    if (__OFADD__(v91, 1))
      goto LABEL_96;
  }
  __break(1u);
LABEL_88:
  swift_bridgeObjectRelease(v63);
  swift_bridgeObjectRelease(v106);
  if (v64 < *((_QWORD *)v70 + 2))
  {
    swift_bridgeObjectRelease(v68);
    swift_bridgeObjectRelease(v70);
    return;
  }
LABEL_101:
  __break(1u);
}

uint64_t sub_100087B00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  Swift::String v13;
  Swift::String v14;
  void *v15;
  char *v16;
  uint64_t v17;
  Swift::String v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  Swift::String v22;
  Swift::String v23;
  Swift::String v24;
  uint64_t result;
  uint64_t v26;
  unint64_t v27;

  v4 = swift_bridgeObjectRetain(a1);
  v5 = (char *)sub_10004FC04(v4);
  swift_bridgeObjectRelease(a1);
  v26 = (uint64_t)v5;
  swift_retain(v5);
  sub_100088394((char **)&v26);
  swift_release(v5);
  if (*(_QWORD *)(v26 + 16))
  {
    v6 = *(_QWORD *)(v26 + 32);
    v7 = *(_QWORD *)(v26 + 40);
    v8 = *(_BYTE *)(v26 + 48);
    v9 = *(_BYTE *)(v26 + 49);
    swift_release(v26);
    if ((v9 & 1) == 0)
    {
      v26 = 39;
      v27 = 0xE100000000000000;
      if ((v6 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (v6 < *(_QWORD *)(a2 + 16))
      {
        v10 = a2 + 16 * v6;
        v11 = *(_QWORD *)(v10 + 32);
        v12 = *(void **)(v10 + 40);
        swift_bridgeObjectRetain(v12);
        v13._countAndFlagsBits = v11;
        v13._object = v12;
        String.append(_:)(v13);
        swift_bridgeObjectRelease(v12);
        v14._countAndFlagsBits = 39;
        v14._object = (void *)0xE100000000000000;
        String.append(_:)(v14);
        v16 = (char *)v26;
        v15 = (void *)v27;
        if ((v8 & 1) != 0)
        {
LABEL_8:
          v26 = 0x2067616C66;
          v27 = 0xE500000000000000;
          v24._countAndFlagsBits = (uint64_t)v16;
          v24._object = v15;
          String.append(_:)(v24);
          swift_bridgeObjectRelease(v15);
          return v26;
        }
        if (!__OFADD__(v7, 2))
        {
          v17 = String.index(_:offsetBy:)(15, v7 + 2, v26, v27);
          v26 = 0;
          v27 = 0xE000000000000000;
          v18._countAndFlagsBits = 39;
          v18._object = (void *)0xE100000000000000;
          String.append(_:)(v18);
          v19 = String.subscript.getter(v17, v16, v15);
          v21 = v20;
          Character.write<A>(to:)(&v26, v19, v20, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
          swift_bridgeObjectRelease(v21);
          v22._countAndFlagsBits = 0x206E692027;
          v22._object = (void *)0xE500000000000000;
          String.append(_:)(v22);
          v23._countAndFlagsBits = (uint64_t)v16;
          v23._object = v15;
          String.append(_:)(v23);
          swift_bridgeObjectRelease(v15);
          v16 = (char *)v26;
          v15 = (void *)v27;
          goto LABEL_8;
        }
        goto LABEL_14;
      }
      __break(1u);
LABEL_14:
      __break(1u);
      result = swift_release(v26);
      __break(1u);
      return result;
    }
  }
  else
  {
    swift_release(v26);
  }
  return 0;
}

uint64_t sub_100087CEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Swift::String v15;
  void *object;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30[12];

  if (!a1)
  {
    sub_10005BFC4(a2, (uint64_t)&v18);
    if (sub_100033CB4((uint64_t)&v18) == 1)
      return 0;
    v30[8] = v26;
    v30[9] = v27;
    v30[10] = v28;
    v30[11] = v29;
    v30[4] = v22;
    v30[5] = v23;
    v30[6] = v24;
    v30[7] = v25;
    v30[0] = v18;
    v30[1] = v19;
    v30[2] = v20;
    v30[3] = v21;
    return sub_100087EDC();
  }
  v17 = a1;
  swift_errorRetain(a1);
  v3 = sub_100005104(&qword_1000B98A0);
  v4 = sub_100005104(&qword_1000B9E78);
  if (!swift_dynamicCast(v30, &v17, v3, v4, 0))
    goto LABEL_10;
  sub_100045320(v30, (uint64_t)&v18);
  v5 = *((_QWORD *)&v19 + 1);
  v6 = v20;
  sub_100006270(&v18, *((uint64_t *)&v19 + 1));
  dispatch thunk of LocalizedError.errorDescription.getter(v5, v6);
  v8 = v7;
  swift_bridgeObjectRelease(v7);
  if (!v8)
  {
    sub_1000062D8(&v18);
LABEL_10:
    swift_errorRelease(v17);
    *(_QWORD *)&v30[0] = a1;
    swift_errorRetain(a1);
    swift_errorRetain(a1);
    v15._countAndFlagsBits = String.init<A>(describing:)(v30, v3);
    object = v15._object;
    *(_QWORD *)&v30[0] = 8250;
    *((_QWORD *)&v30[0] + 1) = 0xE200000000000000;
    String.append(_:)(v15);
    swift_bridgeObjectRelease(object);
    swift_errorRelease(a1);
    return *(_QWORD *)&v30[0];
  }
  v9 = *((_QWORD *)&v19 + 1);
  v10 = v20;
  sub_100006270(&v18, *((uint64_t *)&v19 + 1));
  result = dispatch thunk of LocalizedError.errorDescription.getter(v9, v10);
  if (v12)
  {
    v13 = v12;
    String.append(_:)(*(Swift::String *)&result);
    swift_bridgeObjectRelease(v13);
    v14 = 8250;
    sub_1000062D8(&v18);
    swift_errorRelease(v17);
    return v14;
  }
  __break(1u);
  return result;
}

uint64_t sub_100087EDC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  Swift::String v6;
  Swift::String v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t result;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  Swift::String v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  Swift::String v29;
  Swift::String v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  Swift::String v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  Swift::String v40;
  Swift::String v41;
  unint64_t v42;
  uint64_t v43;

  v1 = *(_QWORD *)(v0 + 40);
  v43 = v1;
  v2 = *(_QWORD *)(v1 + 16);
  if (!v2)
    return 0;
  if (v2 > 5)
  {
    swift_bridgeObjectRetain(v1);
    sub_10004FDF4(0, v2, 0);
    v12 = (_QWORD *)(v1 + 40);
    do
    {
      v13 = *(v12 - 1);
      v14 = (void *)*v12;
      swift_bridgeObjectRetain(*v12);
      v15._countAndFlagsBits = v13;
      v15._object = v14;
      String.append(_:)(v15);
      swift_bridgeObjectRelease(v14);
      v17 = _swiftEmptyArrayStorage[2];
      v16 = _swiftEmptyArrayStorage[3];
      if (v17 >= v16 >> 1)
        sub_10004FDF4((char *)(v16 > 1), v17 + 1, 1);
      v12 += 2;
      _swiftEmptyArrayStorage[2] = v17 + 1;
      v18 = &_swiftEmptyArrayStorage[2 * v17];
      v18[4] = 539828256;
      v18[5] = 0xE400000000000000;
      --v2;
    }
    while (v2);
    sub_10002ABC8(&v43);
    v31 = sub_100005104(&qword_1000B90C8);
    v32 = sub_1000062F8((unint64_t *)&qword_1000B90D0, &qword_1000B90C8, (uint64_t)&protocol conformance descriptor for [A]);
    v33 = BidirectionalCollection<>.joined(separator:)(10, 0xE100000000000000, v31, v32);
    v35 = v34;
    swift_release(_swiftEmptyArrayStorage);
    _StringGuts.grow(_:)(41);
    swift_bridgeObjectRelease(0xE000000000000000);
    v42 = 0xD000000000000027;
    v36._countAndFlagsBits = v33;
    v36._object = v35;
    String.append(_:)(v36);
    swift_bridgeObjectRelease(v35);
    return v42;
  }
  swift_bridgeObjectRetain(v1);
  sub_10004FDF4(0, v2, 0);
  v3 = (_QWORD *)(v1 + 40);
  do
  {
    v4 = *(v3 - 1);
    v5 = (void *)*v3;
    swift_bridgeObjectRetain(*v3);
    v6._countAndFlagsBits = v4;
    v6._object = v5;
    String.append(_:)(v6);
    v7._countAndFlagsBits = 39;
    v7._object = (void *)0xE100000000000000;
    String.append(_:)(v7);
    swift_bridgeObjectRelease(v5);
    v9 = _swiftEmptyArrayStorage[2];
    v8 = _swiftEmptyArrayStorage[3];
    if (v9 >= v8 >> 1)
      sub_10004FDF4((char *)(v8 > 1), v9 + 1, 1);
    v3 += 2;
    _swiftEmptyArrayStorage[2] = v9 + 1;
    v10 = &_swiftEmptyArrayStorage[2 * v9 + 4];
    *v10 = 39;
    v10[1] = 0xE100000000000000;
    --v2;
  }
  while (v2);
  sub_10002ABC8(&v43);
  if (_swiftEmptyArrayStorage[2] <= 2uLL)
  {
    v37 = sub_100005104(&qword_1000B90C8);
    v38 = sub_1000062F8((unint64_t *)&qword_1000B90D0, &qword_1000B90C8, (uint64_t)&protocol conformance descriptor for [A]);
    v22 = BidirectionalCollection<>.joined(separator:)(0x20646E6120, 0xE500000000000000, v37, v38);
    v24 = v39;
    swift_release(_swiftEmptyArrayStorage);
    goto LABEL_18;
  }
  v19 = sub_10007822C(1, (uint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRetain(_swiftEmptyArrayStorage);
  v20 = sub_100005104(&qword_1000B9130);
  v21 = sub_1000062F8(&qword_1000B9138, &qword_1000B9130, (uint64_t)&protocol conformance descriptor for ArraySlice<A>);
  v22 = BidirectionalCollection<>.joined(separator:)(8236, 0xE200000000000000, v20, v21);
  v24 = v23;
  swift_unknownObjectRelease(v19);
  v25 = _swiftEmptyArrayStorage[2];
  if (v25)
  {
    v26 = &_swiftEmptyArrayStorage[2 * v25 + 4];
    v27 = *(v26 - 2);
    v28 = (void *)*(v26 - 1);
    swift_bridgeObjectRetain(v28);
    swift_release(_swiftEmptyArrayStorage);
    v29._countAndFlagsBits = v27;
    v29._object = v28;
    String.append(_:)(v29);
    swift_bridgeObjectRelease(v28);
    swift_bridgeObjectRetain(v24);
    v30._countAndFlagsBits = 544370464;
    v30._object = (void *)0xE400000000000000;
    String.append(_:)(v30);
    swift_bridgeObjectRelease(v24);
    swift_bridgeObjectRelease(0xE400000000000000);
LABEL_18:
    _StringGuts.grow(_:)(27);
    swift_bridgeObjectRelease(0xE000000000000000);
    v42 = 0xD000000000000018;
    v40._countAndFlagsBits = v22;
    v40._object = v24;
    String.append(_:)(v40);
    swift_bridgeObjectRelease(v24);
    v41._countAndFlagsBits = 46;
    v41._object = (void *)0xE100000000000000;
    String.append(_:)(v41);
    return v42;
  }
  result = swift_release(_swiftEmptyArrayStorage);
  __break(1u);
  return result;
}

uint64_t sub_100088348(uint64_t result)
{
  uint64_t v1;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v1 = result;
    if (result)
    {
      result = static Array._allocateBufferUninitialized(minimumCapacity:)(result, &type metadata for InputOrigin.Element);
      *(_QWORD *)(result + 16) = v1;
    }
    else
    {
      return (uint64_t)_swiftEmptyArrayStorage;
    }
  }
  return result;
}

uint64_t sub_100088394(char **a1)
{
  char *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
    v2 = sub_10007F178((uint64_t)v2);
  v3 = *((_QWORD *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  result = sub_1000883FC(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_1000883FC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t *v2;
  Swift::Int v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  Swift::Int v9;
  uint64_t v10;
  unint64_t v11;
  Swift::Int v12;
  uint64_t v13;
  Swift::Int v14;
  int v15;
  uint64_t v16;
  Swift::Int v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  Swift::Int v23;
  Swift::Int v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  __int128 v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  char *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
  unint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  uint64_t v57;
  char v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  BOOL v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  Swift::Int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  __int128 v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  unint64_t v94;
  uint64_t *v95;
  _QWORD *v96;
  uint64_t v97;
  Swift::Int v98;
  Swift::Int v99;
  char *v100;

  v2 = a1;
  v3 = a1[1];
  result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_169;
    if (v3)
      return sub_100088B40(0, v3, 1, v2);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_168;
  v6 = result;
  if (v3 <= 1)
  {
    v8 = (char *)_swiftEmptyArrayStorage;
    v100 = (char *)&_swiftEmptyArrayStorage[4];
    v96 = _swiftEmptyArrayStorage;
    if (v3 != 1)
    {
      v11 = _swiftEmptyArrayStorage[2];
      if (v11 < 2)
        goto LABEL_146;
      goto LABEL_134;
    }
  }
  else
  {
    v7 = v5 >> 1;
    result = static Array._allocateBufferUninitialized(minimumCapacity:)(v5 >> 1, &type metadata for InputOrigin.Element);
    *(_QWORD *)(result + 16) = v7;
    v96 = (_QWORD *)result;
    v100 = (char *)(result + 32);
  }
  v9 = 0;
  v95 = v2;
  v10 = *v2;
  v8 = (char *)_swiftEmptyArrayStorage;
  v97 = v6;
  v98 = v3;
  while (2)
  {
    v12 = v9 + 1;
    if (v9 + 1 >= v3)
      goto LABEL_53;
    v13 = v10 + 24 * v12;
    if ((*(_BYTE *)(v13 + 17) & 1) != 0)
      goto LABEL_17;
    v16 = v10 + 24 * v9;
    if ((*(_BYTE *)(v16 + 17) & 1) == 0 && *(_QWORD *)v13 >= *(_QWORD *)v16)
    {
      if (*(_QWORD *)v13 == *(_QWORD *)v16)
      {
        if ((*(_BYTE *)(v13 + 16) & 1) != 0)
        {
          if ((*(_BYTE *)(v16 + 16) & 1) == 0)
            goto LABEL_21;
        }
        else if ((*(_BYTE *)(v16 + 16) & 1) == 0 && *(_QWORD *)(v13 + 8) < *(_QWORD *)(v16 + 8))
        {
          goto LABEL_21;
        }
      }
LABEL_17:
      v14 = v9 + 2;
      if (v9 + 2 >= v3)
        goto LABEL_52;
      v15 = 0;
      goto LABEL_23;
    }
LABEL_21:
    v14 = v9 + 2;
    if (v9 + 2 >= v3)
      goto LABEL_46;
    v15 = 1;
LABEL_23:
    if (v3 <= v14 + 1)
      v17 = v14 + 1;
    else
      v17 = v3;
    v18 = (_BYTE *)(v10 + 17 + 24 * v14);
    do
    {
      if ((*v18 & 1) == 0)
      {
        v19 = v10 + 24 * v12;
        if ((*(_BYTE *)(v19 + 17) & 1) != 0 || (v20 = *(_QWORD *)(v18 - 17), v20 < *(_QWORD *)v19))
        {
LABEL_32:
          if ((v15 & 1) == 0)
            goto LABEL_52;
          goto LABEL_28;
        }
        if (v20 == *(_QWORD *)v19)
        {
          if ((*(v18 - 1) & 1) != 0)
          {
            if ((*(_BYTE *)(v19 + 16) & 1) == 0)
              goto LABEL_32;
          }
          else if ((*(_BYTE *)(v19 + 16) & 1) == 0 && *(_QWORD *)(v18 - 9) < *(_QWORD *)(v19 + 8))
          {
            if (!v15)
              goto LABEL_52;
            goto LABEL_28;
          }
        }
      }
      if ((v15 & 1) != 0)
      {
        v17 = v14;
        goto LABEL_45;
      }
LABEL_28:
      v12 = v14;
      v18 += 24;
      ++v14;
    }
    while (v14 < v3);
    if (!v15)
      goto LABEL_63;
LABEL_45:
    v14 = v17;
    if (v17 < v9)
      goto LABEL_170;
LABEL_46:
    if (v9 < v14)
    {
      v21 = 24 * v14;
      v22 = 24 * v9;
      v23 = v14;
      v24 = v9;
      do
      {
        if (v24 != --v23)
        {
          if (!v10)
            goto LABEL_175;
          v25 = v10 + v22;
          v26 = v10 + v21;
          v27 = *(_BYTE *)(v10 + v22 + 16);
          v28 = *(_BYTE *)(v10 + v22 + 17);
          v29 = *(_OWORD *)(v10 + v22);
          v30 = *(_QWORD *)(v10 + v21 - 8);
          *(_OWORD *)v25 = *(_OWORD *)(v10 + v21 - 24);
          *(_QWORD *)(v25 + 16) = v30;
          *(_OWORD *)(v26 - 24) = v29;
          *(_BYTE *)(v26 - 8) = v27;
          *(_BYTE *)(v26 - 7) = v28;
        }
        ++v24;
        v21 -= 24;
        v22 += 24;
      }
      while (v24 < v23);
    }
LABEL_52:
    v12 = v14;
LABEL_53:
    if (v12 >= v3)
      goto LABEL_62;
    if (__OFSUB__(v12, v9))
      goto LABEL_167;
    if (v12 - v9 >= v6)
    {
LABEL_62:
      v17 = v12;
      goto LABEL_63;
    }
    if (__OFADD__(v9, v6))
      goto LABEL_171;
    if (v9 + v6 >= v3)
      v17 = v3;
    else
      v17 = v9 + v6;
    if (v17 >= v9)
    {
      if (v12 == v17)
        goto LABEL_62;
      v80 = v10 - 24 + 24 * v12;
      do
      {
        v81 = v9;
        v82 = v80;
        do
        {
          if ((*(_BYTE *)(v82 + 41) & 1) != 0)
            break;
          v83 = v82 + 24;
          v84 = *(_QWORD *)(v82 + 24);
          v85 = *(_QWORD *)(v82 + 32);
          v86 = *(_BYTE *)(v82 + 40);
          if ((*(_BYTE *)(v82 + 17) & 1) == 0 && v84 >= *(_QWORD *)v82)
          {
            if (v84 != *(_QWORD *)v82)
              break;
            if ((*(_BYTE *)(v82 + 40) & 1) != 0)
            {
              if ((*(_BYTE *)(v82 + 16) & 1) != 0)
                break;
            }
            else if ((*(_BYTE *)(v82 + 16) & 1) != 0 || v85 >= *(_QWORD *)(v82 + 8))
            {
              break;
            }
          }
          if (!v10)
            goto LABEL_173;
          v87 = *(_OWORD *)v82;
          v88 = *(_QWORD *)(v82 + 16);
          *(_QWORD *)v82 = v84;
          *(_QWORD *)(v82 + 8) = v85;
          *(_BYTE *)(v82 + 16) = v86;
          *(_BYTE *)(v82 + 17) = 0;
          v82 -= 24;
          *(_OWORD *)v83 = v87;
          *(_QWORD *)(v83 + 16) = v88;
          ++v81;
        }
        while (v12 != v81);
        ++v12;
        v80 += 24;
      }
      while (v12 != v17);
LABEL_63:
      if (v17 < v9)
        goto LABEL_162;
      result = swift_isUniquelyReferenced_nonNull_native(v8);
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_10007F058(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
        v8 = (char *)result;
      }
      v32 = *((_QWORD *)v8 + 2);
      v31 = *((_QWORD *)v8 + 3);
      v11 = v32 + 1;
      v99 = v17;
      if (v32 >= v31 >> 1)
      {
        result = (uint64_t)sub_10007F058((char *)(v31 > 1), v32 + 1, 1, v8);
        v8 = (char *)result;
      }
      *((_QWORD *)v8 + 2) = v11;
      v33 = v8 + 32;
      v34 = &v8[16 * v32 + 32];
      *(_QWORD *)v34 = v9;
      *((_QWORD *)v34 + 1) = v99;
      if (v32)
      {
        while (2)
        {
          v35 = v11 - 1;
          if (v11 >= 4)
          {
            v40 = &v33[2 * v11];
            v41 = *(v40 - 8);
            v42 = *(v40 - 7);
            v46 = __OFSUB__(v42, v41);
            v43 = v42 - v41;
            if (v46)
              goto LABEL_151;
            v45 = *(v40 - 6);
            v44 = *(v40 - 5);
            v46 = __OFSUB__(v44, v45);
            v38 = v44 - v45;
            v39 = v46;
            if (v46)
              goto LABEL_152;
            v47 = v11 - 2;
            v48 = &v33[2 * v11 - 4];
            v50 = *v48;
            v49 = v48[1];
            v46 = __OFSUB__(v49, v50);
            v51 = v49 - v50;
            if (v46)
              goto LABEL_153;
            v46 = __OFADD__(v38, v51);
            v52 = v38 + v51;
            if (v46)
              goto LABEL_155;
            if (v52 >= v43)
            {
              v70 = &v33[2 * v35];
              v72 = *v70;
              v71 = v70[1];
              v46 = __OFSUB__(v71, v72);
              v73 = v71 - v72;
              if (v46)
                goto LABEL_161;
              v63 = v38 < v73;
            }
            else
            {
LABEL_82:
              if ((v39 & 1) != 0)
                goto LABEL_154;
              v47 = v11 - 2;
              v53 = &v33[2 * v11 - 4];
              v55 = *v53;
              v54 = v53[1];
              v56 = __OFSUB__(v54, v55);
              v57 = v54 - v55;
              v58 = v56;
              if (v56)
                goto LABEL_156;
              v59 = &v33[2 * v35];
              v61 = *v59;
              v60 = v59[1];
              v46 = __OFSUB__(v60, v61);
              v62 = v60 - v61;
              if (v46)
                goto LABEL_158;
              if (__OFADD__(v57, v62))
                goto LABEL_160;
              if (v57 + v62 < v38)
                goto LABEL_94;
              v63 = v38 < v62;
            }
            if (v63)
              v35 = v47;
          }
          else
          {
            if (v11 == 3)
            {
              v37 = *((_QWORD *)v8 + 4);
              v36 = *((_QWORD *)v8 + 5);
              v46 = __OFSUB__(v36, v37);
              v38 = v36 - v37;
              v39 = v46;
              goto LABEL_82;
            }
            v64 = *((_QWORD *)v8 + 4);
            v65 = *((_QWORD *)v8 + 5);
            v46 = __OFSUB__(v65, v64);
            v57 = v65 - v64;
            v58 = v46;
LABEL_94:
            if ((v58 & 1) != 0)
              goto LABEL_157;
            v66 = &v33[2 * v35];
            v68 = *v66;
            v67 = v66[1];
            v46 = __OFSUB__(v67, v68);
            v69 = v67 - v68;
            if (v46)
              goto LABEL_159;
            if (v69 < v57)
              goto LABEL_14;
          }
          v74 = v35 - 1;
          if (v35 - 1 >= v11)
          {
            __break(1u);
LABEL_148:
            __break(1u);
LABEL_149:
            __break(1u);
LABEL_150:
            __break(1u);
LABEL_151:
            __break(1u);
LABEL_152:
            __break(1u);
LABEL_153:
            __break(1u);
LABEL_154:
            __break(1u);
LABEL_155:
            __break(1u);
LABEL_156:
            __break(1u);
LABEL_157:
            __break(1u);
LABEL_158:
            __break(1u);
LABEL_159:
            __break(1u);
LABEL_160:
            __break(1u);
LABEL_161:
            __break(1u);
LABEL_162:
            __break(1u);
LABEL_163:
            __break(1u);
LABEL_164:
            __break(1u);
LABEL_165:
            __break(1u);
LABEL_166:
            __break(1u);
LABEL_167:
            __break(1u);
LABEL_168:
            __break(1u);
LABEL_169:
            __break(1u);
LABEL_170:
            __break(1u);
LABEL_171:
            __break(1u);
            goto LABEL_172;
          }
          if (!v10)
            goto LABEL_174;
          v75 = &v33[2 * v74];
          v76 = *v75;
          v77 = &v33[2 * v35];
          v78 = v77[1];
          result = sub_100088C00((char *)(v10 + 24 * *v75), (char *)(v10 + 24 * *v77), v10 + 24 * v78, v100);
          if (v1)
            goto LABEL_146;
          if (v78 < v76)
            goto LABEL_148;
          if (v35 > *((_QWORD *)v8 + 2))
            goto LABEL_149;
          *v75 = v76;
          v33[2 * v74 + 1] = v78;
          v79 = *((_QWORD *)v8 + 2);
          if (v35 >= v79)
            goto LABEL_150;
          v11 = v79 - 1;
          result = (uint64_t)memmove(&v33[2 * v35], v77 + 2, 16 * (v79 - 1 - v35));
          *((_QWORD *)v8 + 2) = v79 - 1;
          if (v79 <= 2)
            goto LABEL_14;
          continue;
        }
      }
      v11 = 1;
LABEL_14:
      v3 = v98;
      v9 = v99;
      v6 = v97;
      if (v99 >= v98)
      {
        v2 = v95;
        if (v11 < 2)
        {
LABEL_146:
          swift_bridgeObjectRelease(v8);
          v96[2] = 0;
          return swift_bridgeObjectRelease(v96);
        }
LABEL_134:
        v89 = *v2;
        while (1)
        {
          v90 = v11 - 2;
          if (v11 < 2)
            goto LABEL_163;
          if (!v89)
            goto LABEL_176;
          v91 = *(_QWORD *)&v8[16 * v90 + 32];
          v92 = *(_QWORD *)&v8[16 * v11 + 24];
          result = sub_100088C00((char *)(v89 + 24 * v91), (char *)(v89 + 24 * *(_QWORD *)&v8[16 * v11 + 16]), v89 + 24 * v92, v100);
          if (v1)
            goto LABEL_146;
          if (v92 < v91)
            goto LABEL_164;
          result = swift_isUniquelyReferenced_nonNull_native(v8);
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_10007F150((uint64_t)v8);
            v8 = (char *)result;
          }
          if (v90 >= *((_QWORD *)v8 + 2))
            goto LABEL_165;
          v93 = &v8[16 * v90 + 32];
          *(_QWORD *)v93 = v91;
          *((_QWORD *)v93 + 1) = v92;
          v94 = *((_QWORD *)v8 + 2);
          if (v11 > v94)
            goto LABEL_166;
          result = (uint64_t)memmove(&v8[16 * v11 + 16], &v8[16 * v11 + 32], 16 * (v94 - v11));
          *((_QWORD *)v8 + 2) = v94 - 1;
          v11 = v94 - 1;
          if (v94 <= 2)
            goto LABEL_146;
        }
      }
      continue;
    }
    break;
  }
LABEL_172:
  __break(1u);
LABEL_173:
  __break(1u);
LABEL_174:
  __break(1u);
LABEL_175:
  __break(1u);
LABEL_176:
  __break(1u);
  return result;
}

uint64_t sub_100088B40(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  uint64_t v13;

  if (a3 != a2)
  {
    v4 = *a4;
    v5 = *a4 + 24 * a3 - 24;
LABEL_5:
    v6 = result;
    v7 = v5;
    while (1)
    {
      if ((*(_BYTE *)(v7 + 41) & 1) != 0)
      {
LABEL_4:
        ++a3;
        v5 += 24;
        if (a3 == a2)
          return result;
        goto LABEL_5;
      }
      v8 = v7 + 24;
      v9 = *(_QWORD *)(v7 + 24);
      v10 = *(_QWORD *)(v7 + 32);
      v11 = *(_BYTE *)(v7 + 40);
      if ((*(_BYTE *)(v7 + 17) & 1) == 0 && v9 >= *(_QWORD *)v7)
      {
        if (v9 != *(_QWORD *)v7)
          goto LABEL_4;
        if ((*(_BYTE *)(v7 + 40) & 1) != 0)
        {
          if ((*(_BYTE *)(v7 + 16) & 1) != 0)
            goto LABEL_4;
        }
        else if ((*(_BYTE *)(v7 + 16) & 1) != 0 || v10 >= *(_QWORD *)(v7 + 8))
        {
          goto LABEL_4;
        }
      }
      if (!v4)
        break;
      v12 = *(_OWORD *)v7;
      v13 = *(_QWORD *)(v7 + 16);
      *(_QWORD *)v7 = v9;
      *(_QWORD *)(v7 + 8) = v10;
      *(_BYTE *)(v7 + 16) = v11;
      *(_BYTE *)(v7 + 17) = 0;
      v7 -= 24;
      *(_OWORD *)v8 = v12;
      *(_QWORD *)(v8 + 16) = v13;
      if (a3 == ++v6)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_100088C00(char *__src, char *__dst, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  char *v13;
  char *v14;
  BOOL v15;
  __int128 v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  BOOL v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  size_t v26;

  v4 = a4;
  v6 = __dst;
  v7 = __src;
  v8 = __dst - __src;
  v9 = (__dst - __src) / 24;
  v10 = a3 - (_QWORD)__dst;
  v11 = (uint64_t)(a3 - (_QWORD)__dst) / 24;
  if (v9 >= v11)
  {
    v17 = 24 * v11;
    if (a4 != __dst || &__dst[v17] <= a4)
      memmove(a4, __dst, 24 * v11);
    v13 = &v4[v17];
    if (v7 >= v6 || v10 < 24)
      goto LABEL_56;
    v18 = a3 - 24;
    while (1)
    {
      v19 = (char *)(v18 + 24);
      v20 = *((_QWORD *)v13 - 3);
      if ((*(v13 - 7) & 1) != 0)
        break;
      v21 = v6 - 24;
      v23 = *((_QWORD *)v6 - 3);
      if ((*(v6 - 7) & 1) == 0 && v20 >= v23)
      {
        if (v20 != v23)
          break;
        if ((*(v13 - 8) & 1) != 0)
        {
          if ((*(v6 - 8) & 1) != 0)
            break;
        }
        else if ((*(v6 - 8) & 1) != 0 || *((_QWORD *)v13 - 2) >= *((_QWORD *)v6 - 2))
        {
          break;
        }
      }
      if (v19 != v6)
      {
        v6 -= 24;
        goto LABEL_49;
      }
      v22 = v18 >= (unint64_t)v6;
      v6 -= 24;
      if (v22)
        goto LABEL_49;
LABEL_50:
      if (v6 > v7)
      {
        v18 -= 24;
        if (v13 > v4)
          continue;
      }
      goto LABEL_56;
    }
    v21 = v13 - 24;
    if (v19 != v13)
    {
      v13 -= 24;
LABEL_49:
      v24 = *(_OWORD *)v21;
      *(_QWORD *)(v18 + 16) = *((_QWORD *)v21 + 2);
      *(_OWORD *)v18 = v24;
      goto LABEL_50;
    }
    v22 = v18 >= (unint64_t)v13;
    v13 -= 24;
    if (v22)
      goto LABEL_49;
    goto LABEL_50;
  }
  v12 = 24 * v9;
  if (a4 != __src || &__src[v12] <= a4)
    memmove(a4, __src, v12);
  v13 = &v4[v12];
  if ((unint64_t)v6 < a3 && v8 >= 24)
  {
    while ((v6[17] & 1) == 0)
    {
      if ((v4[17] & 1) == 0 && *(_QWORD *)v6 >= *(_QWORD *)v4)
      {
        if (*(_QWORD *)v6 != *(_QWORD *)v4)
          break;
        if ((v6[16] & 1) != 0)
        {
          if ((v4[16] & 1) != 0)
            break;
        }
        else if ((v4[16] & 1) != 0 || *((_QWORD *)v6 + 1) >= *((_QWORD *)v4 + 1))
        {
          break;
        }
      }
      v14 = v6;
      v15 = v7 == v6;
      v6 += 24;
      if (!v15)
        goto LABEL_9;
LABEL_10:
      v7 += 24;
      if (v4 >= v13 || (unint64_t)v6 >= a3)
        goto LABEL_55;
    }
    v14 = v4;
    v15 = v7 == v4;
    v4 += 24;
    if (v15)
      goto LABEL_10;
LABEL_9:
    v16 = *(_OWORD *)v14;
    *((_QWORD *)v7 + 2) = *((_QWORD *)v14 + 2);
    *(_OWORD *)v7 = v16;
    goto LABEL_10;
  }
LABEL_55:
  v6 = v7;
LABEL_56:
  v25 = (unsigned __int128)((v13 - v4) * (__int128)0x2AAAAAAAAAAAAAABLL) >> 64;
  v26 = 24 * ((v25 >> 2) + ((unint64_t)v25 >> 63));
  if (v6 != v4 || v6 >= &v4[v26])
    memmove(v6, v4, v26);
  return 1;
}

char *sub_100088EB4(char *result)
{
  unint64_t v1;
  unint64_t v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  char *v15;

  v1 = 0;
  v2 = *((_QWORD *)result + 2);
  v3 = result + 48;
LABEL_2:
  if (v1 <= v2)
    v4 = v2;
  else
    v4 = v1;
  v5 = v4 + 1;
  v6 = (unsigned __int8 *)&v3[24 * v1];
  while (1)
  {
    if (v2 == v1)
      return (char *)_swiftEmptyArrayStorage;
    if (v5 == ++v1)
      break;
    v7 = v6 + 24;
    v8 = *v6;
    v9 = *v6 & 0xC0;
    v6 += 24;
    if (v9 != 64)
    {
      v15 = v3;
      v10 = *((_QWORD *)v7 - 5);
      v11 = *((_QWORD *)v7 - 4);
      sub_100030508(v10, v11, v8);
      result = (char *)swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage);
      if ((result & 1) == 0)
        result = sub_10004FED4(0, _swiftEmptyArrayStorage[2] + 1, 1);
      v13 = _swiftEmptyArrayStorage[2];
      v12 = _swiftEmptyArrayStorage[3];
      if (v13 >= v12 >> 1)
        result = sub_10004FED4((char *)(v12 > 1), v13 + 1, 1);
      _swiftEmptyArrayStorage[2] = v13 + 1;
      v14 = &_swiftEmptyArrayStorage[3 * v13];
      v14[4] = v10;
      v14[5] = v11;
      *((_BYTE *)v14 + 48) = v8;
      v3 = v15;
      goto LABEL_2;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100088FE8(uint64_t result, uint64_t a2, void *a3, unsigned __int8 a4, uint64_t a5)
{
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  unsigned __int8 *i;
  void *v12;
  uint64_t v13;
  unsigned int v14;
  Swift::String v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  Swift::String v20;
  Swift::String v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  Swift::String v32;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  _QWORD *v37;

  v32._object = a3;
  v32._countAndFlagsBits = a2;
  v5 = *(_QWORD *)(result + 16);
  if (v5)
  {
    v6 = 0;
    v7 = a4 >> 6;
    v8 = result + 48;
    v31 = -(uint64_t)v5;
    v9 = _swiftEmptyArrayStorage;
    v28 = result + 48;
    v29 = *(_QWORD *)(result + 16);
    while (1)
    {
      v30 = v9;
      if (v6 <= v5)
        v10 = v5;
      else
        v10 = v6;
      v34 = -(uint64_t)v10;
      for (i = (unsigned __int8 *)(v8 + 24 * v6++); ; i += 24)
      {
        if (v34 + v6 == 1)
        {
          __break(1u);
          return result;
        }
        v13 = *((_QWORD *)i - 2);
        v12 = (void *)*((_QWORD *)i - 1);
        v14 = *i;
        if (v14 >> 6)
        {
          if (v14 >> 6 == 1)
          {
            v35 = 0;
            v36 = 0xE000000000000000;
            swift_bridgeObjectRetain(v12);
            v15._countAndFlagsBits = 45;
            v15._object = (void *)0xE100000000000000;
            String.append(_:)(v15);
            Character.write<A>(to:)(&v35, v13, v12, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
            v16 = v35;
            v17 = v36;
            if (!v7)
              goto LABEL_11;
            goto LABEL_15;
          }
          v35 = 45;
          v19 = 0xE100000000000000;
        }
        else
        {
          v35 = 11565;
          v19 = 0xE200000000000000;
        }
        v36 = v19;
        swift_bridgeObjectRetain(v12);
        v20._countAndFlagsBits = v13;
        v20._object = v12;
        String.append(_:)(v20);
        v16 = v35;
        v17 = v36;
        if (!v7)
        {
LABEL_11:
          v35 = 11565;
          v18 = 0xE200000000000000;
          goto LABEL_18;
        }
LABEL_15:
        if (v7 == 1)
        {
          v35 = 0;
          v36 = 0xE000000000000000;
          v21._countAndFlagsBits = 45;
          v21._object = (void *)0xE100000000000000;
          String.append(_:)(v21);
          Character.write<A>(to:)(&v35, v32._countAndFlagsBits, v32._object, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
          goto LABEL_19;
        }
        v35 = 45;
        v18 = 0xE100000000000000;
LABEL_18:
        v36 = v18;
        String.append(_:)(v32);
LABEL_19:
        v22 = v36;
        sub_1000872F4(v35, v36, v16, v17);
        v24 = v23;
        swift_bridgeObjectRelease(v17);
        swift_bridgeObjectRelease(v22);
        if (v24 < a5)
          break;
        result = sub_10002DA24(v13, (uint64_t)v12, v14);
        ++v6;
        if (v31 + v6 == 1)
          return (uint64_t)v30;
      }
      v9 = v30;
      result = swift_isUniquelyReferenced_nonNull_native(v30);
      v37 = v30;
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_10004FED4(0, v30[2] + 1, 1);
        v9 = v37;
      }
      v26 = v9[2];
      v25 = v9[3];
      if (v26 >= v25 >> 1)
      {
        result = (uint64_t)sub_10004FED4((char *)(v25 > 1), v26 + 1, 1);
        v9 = v37;
      }
      v9[2] = v26 + 1;
      v27 = &v9[3 * v26];
      v27[4] = v13;
      v27[5] = v12;
      *((_BYTE *)v27 + 48) = v14;
      v8 = v28;
      v5 = v29;
      if (!(v31 + v6))
        return (uint64_t)v9;
    }
  }
  return (uint64_t)_swiftEmptyArrayStorage;
}

uint64_t sub_10008929C(uint64_t a1, void *a2)
{
  Swift::String v4;
  Swift::String v5;
  Swift::String v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  Swift::String v19;

  _StringGuts.grow(_:)(111);
  v4._object = (void *)0x800000010009DE30;
  v4._countAndFlagsBits = 0xD000000000000027;
  String.append(_:)(v4);
  v5._countAndFlagsBits = a1;
  v5._object = a2;
  String.append(_:)(v5);
  v6._countAndFlagsBits = 0xD000000000000044;
  v6._object = (void *)0x800000010009DE60;
  String.append(_:)(v6);
  v7 = 3;
  sub_10004FDF4(0, 3, 0);
  v8 = &unk_1000AFC08;
  do
  {
    v10 = *(v8 - 1);
    v9 = *v8;
    v12 = _swiftEmptyArrayStorage[2];
    v11 = _swiftEmptyArrayStorage[3];
    swift_bridgeObjectRetain(*v8);
    if (v12 >= v11 >> 1)
      sub_10004FDF4((char *)(v11 > 1), v12 + 1, 1);
    v8 += 2;
    _swiftEmptyArrayStorage[2] = v12 + 1;
    v13 = &_swiftEmptyArrayStorage[2 * v12];
    v13[4] = v10;
    v13[5] = v9;
    --v7;
  }
  while (v7);
  v14 = sub_100005104(&qword_1000B90C8);
  v15 = sub_1000062F8((unint64_t *)&qword_1000B90D0, &qword_1000B90C8, (uint64_t)&protocol conformance descriptor for [A]);
  v16 = BidirectionalCollection<>.joined(separator:)(32, 0xE100000000000000, v14, v15);
  v18 = v17;
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  v19._countAndFlagsBits = v16;
  v19._object = v18;
  String.append(_:)(v19);
  swift_bridgeObjectRelease(v18);
  return 0;
}

uint64_t sub_100089454()
{
  Swift::String v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  Swift::String v13;

  _StringGuts.grow(_:)(103);
  v0._object = (void *)0x800000010009DEB0;
  v0._countAndFlagsBits = 0xD000000000000065;
  String.append(_:)(v0);
  v1 = 3;
  sub_10004FDF4(0, 3, 0);
  v2 = &unk_1000AFC08;
  do
  {
    v4 = *(v2 - 1);
    v3 = *v2;
    v6 = _swiftEmptyArrayStorage[2];
    v5 = _swiftEmptyArrayStorage[3];
    swift_bridgeObjectRetain(*v2);
    if (v6 >= v5 >> 1)
      sub_10004FDF4((char *)(v5 > 1), v6 + 1, 1);
    v2 += 2;
    _swiftEmptyArrayStorage[2] = v6 + 1;
    v7 = &_swiftEmptyArrayStorage[2 * v6];
    v7[4] = v4;
    v7[5] = v3;
    --v1;
  }
  while (v1);
  v8 = sub_100005104(&qword_1000B90C8);
  v9 = sub_1000062F8((unint64_t *)&qword_1000B90D0, &qword_1000B90C8, (uint64_t)&protocol conformance descriptor for [A]);
  v10 = BidirectionalCollection<>.joined(separator:)(32, 0xE100000000000000, v8, v9);
  v12 = v11;
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  v13._countAndFlagsBits = v10;
  v13._object = v12;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(v12);
  return 0;
}

uint64_t sub_1000895D0(uint64_t a1, uint64_t a2, void *a3, unsigned __int8 a4)
{
  unint64_t v4;
  uint64_t v6;
  void *v7;
  uint64_t countAndFlagsBits;
  unsigned __int8 v9;
  uint64_t result;
  int v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unsigned __int8 *v15;
  Swift::String v16;
  void *object;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  Swift::String v21;
  Swift::String v22;
  Swift::String v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  Swift::String v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  Swift::String v32;
  Swift::String v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unsigned __int8 v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  Swift::String v44;
  unsigned int v45;
  Swift::String v46;
  unint64_t v47;
  void *v48;

  v48 = a3;
  v46._countAndFlagsBits = a2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
    return 0;
  v6 = a1;
  countAndFlagsBits = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v9 = *(_BYTE *)(a1 + 48);
  swift_bridgeObjectRetain(a1);
  result = sub_100030508(countAndFlagsBits, (uint64_t)v7, v9);
  if (v4 == 1)
    goto LABEL_37;
  v11 = a4 >> 6;
  v12 = v6 + 48;
  v41 = -(uint64_t)v4;
  v13 = 1;
  v37 = v6 + 48;
  v38 = v4;
  v39 = v6;
  while (2)
  {
    v44._countAndFlagsBits = countAndFlagsBits;
    v44._object = v7;
    v40 = v9;
    v42 = v9 >> 6;
    if (v13 <= v4)
      v14 = v4;
    else
      v14 = v13;
    v43 = -(uint64_t)v14;
    v15 = (unsigned __int8 *)(v12 + 24 * v13++);
    while (1)
    {
      if (v43 + v13 == 1)
      {
        __break(1u);
        return result;
      }
      countAndFlagsBits = *((_QWORD *)v15 - 2);
      v7 = (void *)*((_QWORD *)v15 - 1);
      v45 = *v15;
      if (v45 >> 6)
      {
        if (v45 >> 6 == 1)
        {
          v46._object = 0;
          v47 = 0xE000000000000000;
          swift_bridgeObjectRetain(v7);
          v16._countAndFlagsBits = 45;
          v16._object = (void *)0xE100000000000000;
          String.append(_:)(v16);
          Character.write<A>(to:)(&v46._object, countAndFlagsBits, v7, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
          object = v46._object;
          v18 = v47;
          if (!v11)
            goto LABEL_12;
          goto LABEL_16;
        }
        v46._object = (void *)45;
        v20 = 0xE100000000000000;
      }
      else
      {
        v46._object = (void *)11565;
        v20 = 0xE200000000000000;
      }
      v47 = v20;
      swift_bridgeObjectRetain(v7);
      v21._countAndFlagsBits = countAndFlagsBits;
      v21._object = v7;
      String.append(_:)(v21);
      object = v46._object;
      v18 = v47;
      if (!v11)
      {
LABEL_12:
        v46._object = (void *)11565;
        v19 = 0xE200000000000000;
        goto LABEL_19;
      }
LABEL_16:
      if (v11 == 1)
      {
        v46._object = 0;
        v47 = 0xE000000000000000;
        v22._countAndFlagsBits = 45;
        v22._object = (void *)0xE100000000000000;
        String.append(_:)(v22);
        Character.write<A>(to:)(&v46._object, v46._countAndFlagsBits, v48, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
        goto LABEL_20;
      }
      v46._object = (void *)45;
      v19 = 0xE100000000000000;
LABEL_19:
      v47 = v19;
      v23._countAndFlagsBits = v46._countAndFlagsBits;
      v23._object = v48;
      String.append(_:)(v23);
LABEL_20:
      v24 = v47;
      sub_1000872F4((uint64_t)v46._object, v47, (uint64_t)object, v18);
      v26 = v25;
      swift_bridgeObjectRelease(v18);
      swift_bridgeObjectRelease(v24);
      if (v42)
      {
        if (v42 == 1)
        {
          v46._object = 0;
          v47 = 0xE000000000000000;
          v27._countAndFlagsBits = 45;
          v27._object = (void *)0xE100000000000000;
          String.append(_:)(v27);
          Character.write<A>(to:)(&v46._object, v44._countAndFlagsBits, v44._object, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
          v28 = v46._object;
          v29 = v47;
          if (!v11)
            goto LABEL_23;
          goto LABEL_27;
        }
        v46._object = (void *)45;
        v31 = 0xE100000000000000;
      }
      else
      {
        v46._object = (void *)11565;
        v31 = 0xE200000000000000;
      }
      v47 = v31;
      String.append(_:)(v44);
      v28 = v46._object;
      v29 = v47;
      if (!v11)
      {
LABEL_23:
        v46._object = (void *)11565;
        v30 = 0xE200000000000000;
        goto LABEL_30;
      }
LABEL_27:
      if (v11 == 1)
      {
        v46._object = 0;
        v47 = 0xE000000000000000;
        v32._countAndFlagsBits = 45;
        v32._object = (void *)0xE100000000000000;
        String.append(_:)(v32);
        Character.write<A>(to:)(&v46._object, v46._countAndFlagsBits, v48, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
        goto LABEL_31;
      }
      v46._object = (void *)45;
      v30 = 0xE100000000000000;
LABEL_30:
      v47 = v30;
      v33._countAndFlagsBits = v46._countAndFlagsBits;
      v33._object = v48;
      String.append(_:)(v33);
LABEL_31:
      v34 = v47;
      sub_1000872F4((uint64_t)v46._object, v47, (uint64_t)v28, v29);
      v36 = v35;
      swift_bridgeObjectRelease(v29);
      swift_bridgeObjectRelease(v34);
      if (v26 < v36)
        break;
      result = sub_10002DA24(countAndFlagsBits, (uint64_t)v7, v45);
      ++v13;
      v15 += 24;
      if (v41 + v13 == 1)
      {
        countAndFlagsBits = v44._countAndFlagsBits;
        v6 = v39;
        goto LABEL_37;
      }
    }
    result = sub_10002DA24(v44._countAndFlagsBits, (uint64_t)v44._object, v40);
    v6 = v39;
    v12 = v37;
    v4 = v38;
    v9 = v45;
    if (v41 + v13)
      continue;
    break;
  }
LABEL_37:
  swift_bridgeObjectRelease(v6);
  return countAndFlagsBits;
}

char *sub_10008999C(uint64_t a1, void *a2, unsigned __int8 a3)
{
  uint64_t *v3;
  unsigned __int8 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t *v10;
  char *v11;
  char *result;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  unsigned int v30;
  Swift::String v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  Swift::String v35;
  void *object;
  Swift::String v37;
  uint64_t v38;
  void *v39;
  void *v40;
  Swift::String v41;
  uint64_t v45;
  uint64_t v46;
  Swift::String v47;
  Swift::String v48;
  Swift::String v49;

  v4 = a3;
  v5 = a2;
  v6 = a1;
  if ((a3 & 0xC0) == 0x40)
  {
    _StringGuts.grow(_:)(19);
    swift_bridgeObjectRelease(0xE000000000000000);
    goto LABEL_27;
  }
  v7 = *v3;
  v8 = v3[1];
  v46 = v7;
  v9 = *(_QWORD *)(v7 + 16);
  if (!v9)
  {
    v11 = (char *)_swiftEmptyArrayStorage;
LABEL_25:
    sub_100030508(v6, (uint64_t)v5, v4);
    v23 = (char *)sub_100088FE8((uint64_t)v11, v6, v5, v4, 4);
    sub_10002DA24(v6, (uint64_t)v5, v4);
    swift_bridgeObjectRelease(v11);
    v24 = sub_100088EB4(v23);
    swift_bridgeObjectRelease(v23);
    sub_100030508(v6, (uint64_t)v5, v4);
    v25 = sub_1000895D0((uint64_t)v24, v6, v5, v4);
    v27 = v26;
    v29 = v28;
    v30 = v28;
    sub_10002DA24(v6, (uint64_t)v5, v4);
    swift_bridgeObjectRelease(v24);
    if (v30 <= 0xFD)
    {
      _StringGuts.grow(_:)(39);
      swift_bridgeObjectRelease(0xE000000000000000);
      v48._countAndFlagsBits = v6;
      v48._object = v5;
      v35._countAndFlagsBits = sub_10006D63C(v48, v4);
      object = v35._object;
      String.append(_:)(v35);
      swift_bridgeObjectRelease(object);
      v37._countAndFlagsBits = 0xD000000000000011;
      v37._object = (void *)0x800000010009DF40;
      String.append(_:)(v37);
      v49._countAndFlagsBits = v25;
      v49._object = v27;
      v38 = sub_10006D63C(v49, v29);
      v40 = v39;
      sub_10002DA3C(v25, (uint64_t)v27, v29);
      v41._countAndFlagsBits = v38;
      v41._object = v40;
      String.append(_:)(v41);
      swift_bridgeObjectRelease(v40);
      v33 = 16167;
      v34 = 0xE200000000000000;
      goto LABEL_29;
    }
    _StringGuts.grow(_:)(19);
    swift_bridgeObjectRelease(0xE000000000000000);
LABEL_27:
    v47._countAndFlagsBits = v6;
    v47._object = v5;
    v31._countAndFlagsBits = sub_10006D63C(v47, v4);
    v32 = v31._object;
    String.append(_:)(v31);
    swift_bridgeObjectRelease(v32);
    v33 = 39;
    v34 = 0xE100000000000000;
LABEL_29:
    String.append(_:)(*(Swift::String *)&v33);
    return (char *)0xD000000000000010;
  }
  v45 = v8;
  v10 = (unint64_t *)(v7 + 32);
  sub_10002AB10(&v46);
  sub_10002AB10(&v45);
  sub_10002AB10(&v46);
  sub_10002AB10(&v45);
  v11 = (char *)_swiftEmptyArrayStorage;
  while (1)
  {
    v13 = *v10;
    v10 += 24;
    result = (char *)v13;
    v14 = v13 >= 2 ? result : (char *)_swiftEmptyArrayStorage;
    v15 = *((_QWORD *)v14 + 2);
    v16 = *((_QWORD *)v11 + 2);
    v17 = v16 + v15;
    if (__OFADD__(v16, v15))
      break;
    sub_10002D810((unint64_t)result);
    result = (char *)swift_isUniquelyReferenced_nonNull_native(v11);
    if ((_DWORD)result && v17 <= *((_QWORD *)v11 + 3) >> 1)
    {
      if (*((_QWORD *)v14 + 2))
        goto LABEL_19;
    }
    else
    {
      if (v16 <= v17)
        v18 = v16 + v15;
      else
        v18 = v16;
      result = sub_100057BB8(result, v18, 1, v11);
      v11 = result;
      if (*((_QWORD *)v14 + 2))
      {
LABEL_19:
        v19 = *((_QWORD *)v11 + 2);
        if ((*((_QWORD *)v11 + 3) >> 1) - v19 < v15)
          goto LABEL_32;
        result = (char *)swift_arrayInitWithCopy(&v11[24 * v19 + 32], v14 + 32, v15, &type metadata for Name);
        if (v15)
        {
          v20 = *((_QWORD *)v11 + 2);
          v21 = __OFADD__(v20, v15);
          v22 = v20 + v15;
          if (v21)
            goto LABEL_33;
          *((_QWORD *)v11 + 2) = v22;
        }
        goto LABEL_6;
      }
    }
    if (v15)
      goto LABEL_31;
LABEL_6:
    swift_bridgeObjectRelease(v14);
    if (!--v9)
    {
      sub_10002ABC8(&v46);
      sub_10002ABC8(&v45);
      sub_10002ABC8(&v46);
      sub_10002ABC8(&v45);
      v4 = a3;
      v6 = a1;
      v5 = a2;
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

unint64_t sub_100089D64(uint64_t a1, void *a2, int a3)
{
  unsigned __int8 v3;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  void *object;
  Swift::String v12;
  Swift::String v13;
  uint64_t v14;
  unint64_t v15;
  Swift::String v16;
  void *v17;
  Swift::String v19;
  Swift::String v20;

  v3 = a3;
  v6 = sub_100087188(a1, (uint64_t)a2, a3);
  if (v7)
  {
    v8 = v6;
    v9 = v7;
    _StringGuts.grow(_:)(27);
    swift_bridgeObjectRelease(0xE000000000000000);
    v19._countAndFlagsBits = a1;
    v19._object = a2;
    v10._countAndFlagsBits = sub_10006D63C(v19, v3);
    object = v10._object;
    String.append(_:)(v10);
    swift_bridgeObjectRelease(object);
    v12._countAndFlagsBits = 15392;
    v12._object = (void *)0xE200000000000000;
    String.append(_:)(v12);
    v13._countAndFlagsBits = v8;
    v13._object = v9;
    String.append(_:)(v13);
    swift_bridgeObjectRelease(v9);
    v14 = 10046;
    v15 = 0xE200000000000000;
  }
  else
  {
    _StringGuts.grow(_:)(22);
    swift_bridgeObjectRelease(0xE000000000000000);
    v20._countAndFlagsBits = a1;
    v20._object = a2;
    v16._countAndFlagsBits = sub_10006D63C(v20, v3);
    v17 = v16._object;
    String.append(_:)(v16);
    swift_bridgeObjectRelease(v17);
    v14 = 39;
    v15 = 0xE100000000000000;
  }
  String.append(_:)(*(Swift::String *)&v14);
  return 0xD000000000000013;
}

unint64_t sub_100089EB4(_QWORD *a1)
{
  int64_t v1;
  uint64_t v3;
  void *v4;
  Swift::String v5;
  void *v6;
  _QWORD *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  unint64_t v24;

  v1 = a1[2];
  if (v1)
  {
    if (v1 == 1)
    {
      _StringGuts.grow(_:)(24);
      swift_bridgeObjectRelease(0xE000000000000000);
      v24 = 0xD000000000000015;
      v3 = a1[5];
      v4 = (void *)a1[6];
      swift_bridgeObjectRetain(v4);
      v5._countAndFlagsBits = v3;
      v5._object = v4;
      String.append(_:)(v5);
      v6 = v4;
    }
    else
    {
      sub_10004FDF4(0, v1, 0);
      v7 = a1 + 6;
      v8 = v1;
      do
      {
        v10 = *(v7 - 1);
        v9 = *v7;
        v12 = _swiftEmptyArrayStorage[2];
        v11 = _swiftEmptyArrayStorage[3];
        swift_bridgeObjectRetain(*v7);
        if (v12 >= v11 >> 1)
          sub_10004FDF4((char *)(v11 > 1), v12 + 1, 1);
        _swiftEmptyArrayStorage[2] = v12 + 1;
        v13 = &_swiftEmptyArrayStorage[2 * v12];
        v13[4] = v10;
        v13[5] = v9;
        v7 += 3;
        --v8;
      }
      while (v8);
      v14 = sub_100005104(&qword_1000B90C8);
      v15 = sub_1000062F8((unint64_t *)&qword_1000B90D0, &qword_1000B90C8, (uint64_t)&protocol conformance descriptor for [A]);
      v16 = BidirectionalCollection<>.joined(separator:)(656419879, 0xE400000000000000, v14, v15);
      v18 = v17;
      swift_release(_swiftEmptyArrayStorage);
      _StringGuts.grow(_:)(29);
      v19 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
      swift_bridgeObjectRelease(0xE000000000000000);
      v24 = v19;
      v20._countAndFlagsBits = 0xD000000000000018;
      v20._object = (void *)0x800000010009DF80;
      String.append(_:)(v20);
      v21._countAndFlagsBits = v16;
      v21._object = v18;
      String.append(_:)(v21);
      v6 = v18;
    }
    swift_bridgeObjectRelease(v6);
    v22._countAndFlagsBits = 39;
    v22._object = (void *)0xE100000000000000;
    String.append(_:)(v22);
    return v24;
  }
  return v1;
}

uint64_t sub_10008A0EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v6 = sub_100087B00(a2, a3);
  if (v7)
  {
    v8 = v6;
    v9 = v7;
  }
  else
  {
    v22 = 0;
    v23 = 0xE000000000000000;
    v10._countAndFlagsBits = 0x6E6F697469736F70;
    v10._object = (void *)0xE900000000000020;
    String.append(_:)(v10);
    v21 = a2;
    _print_unlocked<A, B>(_:_:)(&v21, &v22, &type metadata for InputOrigin, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
    v8 = v22;
    v9 = (void *)v23;
  }
  v11 = sub_100087B00(a1, a3);
  if (v12)
  {
    v13 = v11;
    v14 = v12;
  }
  else
  {
    v22 = 0;
    v23 = 0xE000000000000000;
    v15._countAndFlagsBits = 0x6E6F697469736F70;
    v15._object = (void *)0xE900000000000020;
    String.append(_:)(v15);
    v21 = a1;
    _print_unlocked<A, B>(_:_:)(&v21, &v22, &type metadata for InputOrigin, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
    v13 = v22;
    v14 = (void *)v23;
  }
  v22 = 0;
  v23 = 0xE000000000000000;
  _StringGuts.grow(_:)(52);
  v16._object = (void *)0x800000010009DFC0;
  v16._countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v16);
  v17._countAndFlagsBits = v8;
  v17._object = v9;
  String.append(_:)(v17);
  swift_bridgeObjectRelease(v9);
  v18._countAndFlagsBits = 0xD00000000000001BLL;
  v18._object = (void *)0x800000010009DFE0;
  String.append(_:)(v18);
  v19._countAndFlagsBits = v13;
  v19._object = v14;
  String.append(_:)(v19);
  swift_bridgeObjectRelease(v14);
  return v22;
}

uint64_t sub_10008A29C(uint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v4;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  __int128 *v12;
  unint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  _OWORD *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD *v45;

  v4 = *(_QWORD *)(result + 16);
  if (!v4)
    return (uint64_t)_swiftEmptyArrayStorage;
  v8 = 0;
  v9 = result + 32;
  v10 = _swiftEmptyArrayStorage;
  v32 = result + 32;
  do
  {
    if (v8 <= v4)
      v11 = v4;
    else
      v11 = v8;
    v12 = (__int128 *)(v9 + 192 * v8);
    for (i = v8; ; ++i)
    {
      if (v11 == i)
      {
        __break(1u);
        return result;
      }
      v14 = v12[9];
      v41 = v12[8];
      v42 = v14;
      v15 = v12[11];
      v43 = v12[10];
      v44 = v15;
      v16 = v12[5];
      v37 = v12[4];
      v38 = v16;
      v17 = v12[7];
      v39 = v12[6];
      v40 = v17;
      v18 = v12[1];
      v33 = *v12;
      v34 = v18;
      v19 = v12[3];
      v35 = v12[2];
      v36 = v19;
      v8 = i + 1;
      result = sub_100084464(a2, a3, a4, v35);
      if ((result & 1) != 0)
        break;
      v12 += 12;
      if (v4 == v8)
        return (uint64_t)v10;
    }
    sub_10002D724((uint64_t)&v33);
    result = swift_isUniquelyReferenced_nonNull_native(v10);
    v45 = v10;
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_10004FE10(0, v10[2] + 1, 1);
      v10 = v45;
    }
    v21 = v10[2];
    v20 = v10[3];
    if (v21 >= v20 >> 1)
    {
      result = (uint64_t)sub_10004FE10((char *)(v20 > 1), v21 + 1, 1);
      v10 = v45;
    }
    v10[2] = v21 + 1;
    v22 = &v10[24 * v21];
    v23 = v33;
    v24 = v34;
    v25 = v36;
    v22[4] = v35;
    v22[5] = v25;
    v22[2] = v23;
    v22[3] = v24;
    v26 = v37;
    v27 = v38;
    v28 = v40;
    v22[8] = v39;
    v22[9] = v28;
    v22[6] = v26;
    v22[7] = v27;
    v29 = v41;
    v30 = v42;
    v31 = v44;
    v22[12] = v43;
    v22[13] = v31;
    v22[10] = v29;
    v22[11] = v30;
    v9 = v32;
  }
  while (v4 - 1 != i);
  return (uint64_t)v10;
}

uint64_t sub_10008A454(uint64_t a1, void *a2, unsigned __int8 a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, _QWORD *a8, uint64_t a9)
{
  uint64_t *v9;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  Swift::String v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  Swift::String v35;
  Swift::String v36;
  Swift::String v37;
  Swift::String v38;
  Swift::String v39;
  uint64_t v40;
  Swift::String v41;
  uint64_t v42;
  unint64_t v43;
  Swift::String v44;
  Swift::String v45;
  Swift::String v46;
  void *object;
  Swift::String v48;
  Swift::String v49;
  Swift::String v50;
  Swift::String v51;
  Swift::String v52;
  Swift::String v53;
  uint64_t v54;
  void *v55;
  void *v56;
  Swift::String v57;
  Swift::String v58;
  uint64_t v60;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  _OWORD v76[12];
  _BYTE v77[128];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  __int128 v90;
  unint64_t v91[26];
  Swift::String v92;
  Swift::String v93;

  v17 = *v9;
  v74 = v9[1];
  v75 = v17;
  swift_bridgeObjectRetain(a7);
  swift_bridgeObjectRetain(a8);
  sub_10002AB10(&v75);
  sub_10002AB10(&v74);
  v18 = sub_10008A29C(v17, a6, a7, a8);
  swift_bridgeObjectRelease(a8);
  swift_bridgeObjectRelease(a7);
  sub_10002ABC8(&v75);
  sub_10002ABC8(&v74);
  if (*(_QWORD *)(v18 + 16))
  {
    v20 = *(_OWORD *)(v18 + 32);
    v19 = *(_OWORD *)(v18 + 48);
    v21 = *(_OWORD *)(v18 + 80);
    *(_OWORD *)&v77[32] = *(_OWORD *)(v18 + 64);
    *(_OWORD *)&v77[48] = v21;
    v22 = *(_OWORD *)(v18 + 96);
    v23 = *(_OWORD *)(v18 + 112);
    v24 = *(_OWORD *)(v18 + 144);
    *(_OWORD *)&v77[96] = *(_OWORD *)(v18 + 128);
    *(_OWORD *)&v77[112] = v24;
    *(_OWORD *)&v77[64] = v22;
    *(_OWORD *)&v77[80] = v23;
    v25 = *(_OWORD *)(v18 + 160);
    v26 = *(_OWORD *)(v18 + 176);
    v27 = *(_OWORD *)(v18 + 208);
    v80 = *(_OWORD *)(v18 + 192);
    v81 = v27;
    v78 = v25;
    v79 = v26;
    *(_OWORD *)v77 = v20;
    *(_OWORD *)&v77[16] = v19;
    v70 = *(_OWORD *)(v18 + 160);
    v71 = *(_OWORD *)(v18 + 176);
    v72 = *(_OWORD *)(v18 + 192);
    v73 = *(_OWORD *)(v18 + 208);
    v66 = *(_OWORD *)(v18 + 96);
    v67 = *(_OWORD *)(v18 + 112);
    v68 = *(_OWORD *)(v18 + 128);
    v69 = *(_OWORD *)(v18 + 144);
    v62 = *(_OWORD *)(v18 + 32);
    v63 = *(_OWORD *)(v18 + 48);
    v64 = *(_OWORD *)(v18 + 64);
    v65 = *(_OWORD *)(v18 + 80);
    sub_10002D724((uint64_t)v77);
    swift_bridgeObjectRelease(v18);
    v86 = *(_OWORD *)&v77[72];
    v87 = *(_OWORD *)&v77[88];
    v88 = *(_OWORD *)&v77[104];
    v89 = *(_QWORD *)&v77[120];
    v82 = *(_OWORD *)&v77[8];
    v83 = *(_OWORD *)&v77[24];
    v84 = *(_OWORD *)&v77[40];
    v85 = *(_OWORD *)&v77[56];
    v90 = *(_OWORD *)&v77[88];
    v76[10] = v72;
    v76[11] = v73;
    v76[8] = v70;
    v76[9] = v71;
    v76[6] = v68;
    v76[7] = v69;
    v76[4] = v66;
    v76[5] = v67;
    v76[2] = v64;
    v76[3] = v65;
    v76[0] = v62;
    v76[1] = v63;
    v28._countAndFlagsBits = (uint64_t)v76;
    String.init(argument:)(v28);
    v29 = v90 & 0xFFFFFFFFFFFFLL;
    if ((*((_QWORD *)&v90 + 1) & 0x2000000000000000) != 0)
      v29 = HIBYTE(*((_QWORD *)&v90 + 1)) & 0xFLL;
    if (v29)
    {
      *(_OWORD *)v91 = v90;
      swift_bridgeObjectRetain(*((_QWORD *)&v90 + 1));
    }
    else
    {
      sub_10002D724((uint64_t)v77);
      sub_10002E7A0((uint64_t)&v90);
      sub_10005D218(v77, v91);
      sub_100030564((uint64_t)&v90);
      sub_10002D8A4((uint64_t)v77);
    }
    v31 = (void *)v91[1];
    v30 = v91[0];
    sub_10005BFC4((uint64_t)v76, (uint64_t)v91);
  }
  else
  {
    swift_bridgeObjectRelease(v18);
    sub_100033E1C(v77);
    sub_10005BFC4((uint64_t)v77, (uint64_t)v91);
    v30 = 0;
    v31 = 0;
  }
  sub_10005BFC4((uint64_t)v91, (uint64_t)v76);
  v32 = sub_100087CEC(a9, (uint64_t)v76);
  v34 = v33;
  if (!v31)
  {
    v40 = v32;
    if (a3 <= 0xFDu)
    {
      sub_100030508(a1, (uint64_t)a2, a3);
      _StringGuts.grow(_:)(36);
      swift_bridgeObjectRelease(0xE000000000000000);
      v52._countAndFlagsBits = a4;
      v52._object = a5;
      String.append(_:)(v52);
      v53._object = (void *)0x800000010009E0B0;
      v53._countAndFlagsBits = 0xD000000000000012;
      String.append(_:)(v53);
      v93._countAndFlagsBits = a1;
      v93._object = a2;
      v54 = sub_10006D63C(v93, a3);
      v56 = v55;
      sub_10002DA3C(a1, (uint64_t)a2, a3);
      v57._countAndFlagsBits = v54;
      v57._object = v56;
      String.append(_:)(v57);
      swift_bridgeObjectRelease(v56);
      v42 = 39;
      v43 = 0xE100000000000000;
    }
    else
    {
      _StringGuts.grow(_:)(28);
      swift_bridgeObjectRelease(0xE000000000000000);
      v41._countAndFlagsBits = a4;
      v41._object = a5;
      String.append(_:)(v41);
      v42 = 0x766E692073692027;
      v43 = 0xED00002E64696C61;
    }
    String.append(_:)(*(Swift::String *)&v42);
    v58._countAndFlagsBits = v40;
    v58._object = v34;
    String.append(_:)(v58);
    goto LABEL_17;
  }
  v60 = v32;
  if (a3 > 0xFDu)
  {
    _StringGuts.grow(_:)(38);
    swift_bridgeObjectRelease(0xE000000000000000);
    v35._countAndFlagsBits = a4;
    v35._object = a5;
    String.append(_:)(v35);
    v36._countAndFlagsBits = 0xD000000000000013;
    v36._object = (void *)0x800000010009E0D0;
    String.append(_:)(v36);
    v37._countAndFlagsBits = v30;
    v37._object = v31;
    String.append(_:)(v37);
    v38._countAndFlagsBits = 10046;
    v38._object = (void *)0xE200000000000000;
    String.append(_:)(v38);
    v39._countAndFlagsBits = v60;
    v39._object = v34;
    String.append(_:)(v39);
    swift_bridgeObjectRelease(v31);
LABEL_17:
    swift_bridgeObjectRelease(v34);
    goto LABEL_18;
  }
  sub_100030508(a1, (uint64_t)a2, a3);
  _StringGuts.grow(_:)(41);
  swift_bridgeObjectRelease(0xE000000000000000);
  v44._countAndFlagsBits = a4;
  v44._object = a5;
  String.append(_:)(v44);
  v45._object = (void *)0x800000010009E0B0;
  v45._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v45);
  v92._countAndFlagsBits = a1;
  v92._object = a2;
  v46._countAndFlagsBits = sub_10006D63C(v92, a3);
  object = v46._object;
  String.append(_:)(v46);
  swift_bridgeObjectRelease(object);
  v48._countAndFlagsBits = 15392;
  v48._object = (void *)0xE200000000000000;
  String.append(_:)(v48);
  v49._countAndFlagsBits = v30;
  v49._object = v31;
  String.append(_:)(v49);
  v50._countAndFlagsBits = 10046;
  v50._object = (void *)0xE200000000000000;
  String.append(_:)(v50);
  v51._countAndFlagsBits = v60;
  v51._object = v34;
  String.append(_:)(v51);
  swift_bridgeObjectRelease(v31);
  swift_bridgeObjectRelease(v34);
  sub_10002DA3C(a1, (uint64_t)a2, a3);
LABEL_18:
  sub_100033CCC((uint64_t)v91);
  return 0x756C617620656854;
}

uint64_t sub_10008A9CC(uint64_t a1, void *a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  uint64_t *v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  Swift::String v30;
  void *v31;
  Swift::String v32;
  Swift::String v33;
  Swift::String v34;
  Swift::String v35;
  uint64_t v36;
  unsigned __int8 v37;
  uint64_t v38;
  uint64_t v39;
  Swift::String v40;
  char v41[24];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE v50[192];
  _BYTE v51[128];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  Swift::String v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  _BYTE v65[192];
  _BYTE v66[208];

  v13 = *v6;
  v14 = v6[1];
  swift_bridgeObjectRetain(a5);
  swift_bridgeObjectRetain(a6);
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRetain(v14);
  sub_100083D50(v13, v14, a4, a5, a6, (uint64_t)v50);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v13);
  sub_10005BFC4((uint64_t)v50, (uint64_t)v65);
  sub_10005BFC4((uint64_t)v65, (uint64_t)v66);
  if (sub_100033CB4((uint64_t)v66) == 1)
    return 0;
  v35._countAndFlagsBits = a1;
  v35._object = a2;
  v37 = a3;
  sub_10005BFC4((uint64_t)v65, (uint64_t)v41);
  v39 = a4;
  v15 = v43;
  v38 = v42;
  v16 = v44;
  v17 = v46;
  v36 = v45;
  v18 = v47;
  v19 = v48;
  v20 = v49;
  swift_bridgeObjectRetain(v42);
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRetain(v20);
  sub_100033CCC((uint64_t)v65);
  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v38);
  swift_bridgeObjectRetain(a5);
  swift_bridgeObjectRetain(a6);
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRetain(v14);
  v21 = sub_10008A29C(v13, v39, a5, a6);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(a6);
  swift_bridgeObjectRelease(a5);
  if (!*(_QWORD *)(v21 + 16))
  {
    swift_bridgeObjectRelease(v17);
    swift_bridgeObjectRelease(v21);
    return 0;
  }
  v22 = *(_OWORD *)(v21 + 176);
  v52 = *(_OWORD *)(v21 + 160);
  v53 = v22;
  v23 = *(_OWORD *)(v21 + 208);
  v54 = *(_OWORD *)(v21 + 192);
  v55 = v23;
  v24 = *(_OWORD *)(v21 + 112);
  *(_OWORD *)&v51[64] = *(_OWORD *)(v21 + 96);
  *(_OWORD *)&v51[80] = v24;
  v25 = *(_OWORD *)(v21 + 144);
  *(_OWORD *)&v51[96] = *(_OWORD *)(v21 + 128);
  *(_OWORD *)&v51[112] = v25;
  v26 = *(_OWORD *)(v21 + 48);
  *(_OWORD *)v51 = *(_OWORD *)(v21 + 32);
  *(_OWORD *)&v51[16] = v26;
  v27 = *(_OWORD *)(v21 + 80);
  *(_OWORD *)&v51[32] = *(_OWORD *)(v21 + 64);
  *(_OWORD *)&v51[48] = v27;
  sub_10002D724((uint64_t)v51);
  swift_bridgeObjectRelease(v21);
  v60 = *(_OWORD *)&v51[72];
  v61 = *(Swift::String *)&v51[88];
  v62 = *(_OWORD *)&v51[104];
  v63 = *(_QWORD *)&v51[120];
  v56 = *(_OWORD *)&v51[8];
  v57 = *(_OWORD *)&v51[24];
  v58 = *(_OWORD *)&v51[40];
  v59 = *(_OWORD *)&v51[56];
  v64 = *(_OWORD *)&v51[88];
  v28 = *(_QWORD *)&v51[88] & 0xFFFFFFFFFFFFLL;
  if ((*(_QWORD *)&v51[96] & 0x2000000000000000) != 0)
    v28 = HIBYTE(*(_QWORD *)&v51[96]) & 0xFLL;
  if (v28)
  {
    v40 = v61;
    swift_bridgeObjectRetain(*(_QWORD *)&v51[96]);
  }
  else
  {
    swift_bridgeObjectRetain(*(_QWORD *)&v51[96]);
    sub_10005D218(v51, (unint64_t *)&v40);
    sub_100030564((uint64_t)&v64);
  }
  sub_10002D8A4((uint64_t)v51);
  v30 = v40;
  if (v37 <= 0xFDu)
  {
    v40._countAndFlagsBits = sub_10006D63C(v35, v37);
    v40._object = v31;
    v32._countAndFlagsBits = 15392;
    v32._object = (void *)0xE200000000000000;
    String.append(_:)(v32);
  }
  else
  {
    v40._countAndFlagsBits = 60;
    v40._object = (void *)0xE100000000000000;
  }
  String.append(_:)(v30);
  v33._countAndFlagsBits = 2105406;
  v33._object = (void *)0xE300000000000000;
  String.append(_:)(v33);
  v34._countAndFlagsBits = v36;
  v34._object = v17;
  String.append(_:)(v34);
  swift_bridgeObjectRelease(v30._object);
  swift_bridgeObjectRelease(v17);
  return v40._countAndFlagsBits;
}

ValueMetadata *type metadata accessor for Platform.StandardError()
{
  return &type metadata for Platform.StandardError;
}

unint64_t sub_10008AD30(unint64_t a1, unint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  FILE *v9;
  unint64_t v10;
  unint64_t result;
  unint64_t v12;
  unsigned __int8 v13;
  _QWORD v14[2];

  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  swift_bridgeObjectRetain(a2);
  if (!v4)
    return swift_bridgeObjectRelease(a2);
  v6 = (a1 >> 59) & 1;
  if ((a2 & 0x1000000000000000) == 0)
    LOBYTE(v6) = 1;
  v7 = 4 << v6;
  v8 = 15;
  while (1)
  {
    v10 = v8 & 0xC;
    result = v8;
    if (v10 == v7)
      result = sub_10008AED8(v8, a1, a2);
    v12 = result >> 16;
    if (result >> 16 >= v4)
      break;
    if ((a2 & 0x1000000000000000) != 0)
    {
      result = String.UTF8View._foreignSubscript(position:)(result, a1, a2);
      v13 = result;
      if (v10 != v7)
        goto LABEL_20;
    }
    else if ((a2 & 0x2000000000000000) != 0)
    {
      v14[0] = a1;
      v14[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      v13 = *((_BYTE *)v14 + v12);
      if (v10 != v7)
        goto LABEL_20;
    }
    else
    {
      result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      if ((a1 & 0x1000000000000000) == 0)
        result = _StringObject.sharedUTF8.getter(a1, a2);
      v13 = *(_BYTE *)(result + v12);
      if (v10 != v7)
      {
LABEL_20:
        if ((a2 & 0x1000000000000000) == 0)
          goto LABEL_8;
        goto LABEL_21;
      }
    }
    result = sub_10008AED8(v8, a1, a2);
    v8 = result;
    if ((a2 & 0x1000000000000000) == 0)
    {
LABEL_8:
      v8 = (v8 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_9;
    }
LABEL_21:
    if (v4 <= v8 >> 16)
      goto LABEL_28;
    result = String.UTF8View._foreignIndex(after:)(v8, a1, a2);
    v8 = result;
LABEL_9:
    v9 = (FILE *)stderr.getter(result, v5);
    putc(v13, v9);
    if (4 * v4 == v8 >> 14)
      return swift_bridgeObjectRelease(a2);
  }
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_10008AEC4(unint64_t a1, unint64_t a2)
{
  return sub_10008AD30(a1, a2);
}

uint64_t sub_10008AED8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v5 = a1;
  v6 = a1 >> 16;
  v7 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v13 = String.UTF16View.index(_:offsetBy:)(15, v6, a2);
    v14 = v13 + (v7 << 16);
    v15 = v13 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v16 = v14 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v16 = v15;
    return v16 | 4;
  }
  else
  {
    v8 = String.UTF8View._foreignIndex(_:offsetBy:)(15, v6);
    v9 = v8 + (v7 << 16);
    v10 = v8 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v11 = v9 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v11 = v10;
    return v11 | 8;
  }
}

uint64_t sub_10008AF50()
{
  char *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[6];
  _QWORD v15[2];

  v0 = getenv("SHELL");
  if (!v0)
    return 0;
  v1 = String.init(cString:)(v0);
  v3 = v2;
  v15[0] = 47;
  v15[1] = 0xE100000000000000;
  __chkstk_darwin(v1);
  v14[2] = v15;
  swift_bridgeObjectRetain(v4);
  v5 = sub_100032C14(0x7FFFFFFFFFFFFFFFLL, 1, sub_10002D680, (uint64_t)v14, v1, v3);
  swift_bridgeObjectRelease(v3);
  v6 = *((_QWORD *)v5 + 2);
  if (!v6)
  {
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  v7 = &v5[32 * v6];
  v8 = *(_QWORD *)v7;
  v9 = *((_QWORD *)v7 + 1);
  v10 = *((_QWORD *)v7 + 2);
  v11 = *((_QWORD *)v7 + 3);
  swift_bridgeObjectRetain_n(v11, 2);
  swift_bridgeObjectRelease(v5);
  v12 = static String._fromSubstring(_:)(v8, v9, v10, v11);
  swift_bridgeObjectRelease_n(v11, 2);
  return v12;
}

uint64_t sub_10008B078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  _BYTE v14[16];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;

  v7 = *(_QWORD *)(a1 - 8);
  __chkstk_darwin(a1);
  v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v10);
  v19 = Set.init()(AssociatedTypeWitness, a3);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v9, v3, a1);
  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = &v19;
  v12 = Sequence.filter(_:)(sub_10008B25C, v14, a1, a2);
  swift_bridgeObjectRelease(v19);
  return v12;
}

uint64_t sub_10008B158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, a4);
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v9 = __chkstk_darwin(AssociatedTypeWitness);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v16 - v12;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, AssociatedTypeWitness);
  v14 = type metadata accessor for Set(0, AssociatedTypeWitness, a5);
  LOBYTE(a5) = Set.insert(_:)(v13, v11, v14);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, AssociatedTypeWitness);
  return a5 & 1;
}

uint64_t sub_10008B25C(uint64_t a1)
{
  uint64_t *v1;

  return sub_10008B158(a1, v1[5], v1[2], v1[3], v1[4]) & 1;
}

uint64_t sub_10008B27C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  result = swift_checkMetadataState(319, *(_QWORD *)(a1 + 80));
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = "\b";
    v4[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
    result = swift_initClassMetadata2(a1, 0, 3, v4, a1 + 88);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_10008B304(Swift::UInt a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v11;
  uint64_t v12;

  v2 = a2;
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)(a2 + 16))
    {
      v8 = sub_100058D30(a1);
      if ((v9 & 1) != 0)
      {
        v7 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v8);
        swift_retain(v7);
        return v7;
      }
    }
    return 0;
  }
  if (a2 >= 0)
    v2 = a2 & 0xFFFFFFFFFFFFFF8;
  v4 = swift_retain(a1);
  v5 = __CocoaDictionary.lookup(_:)(v4, v2);
  swift_release(a1);
  if (!v5)
    return 0;
  v11 = v5;
  swift_unknownObjectRetain(v5);
  v6 = sub_100005104(&qword_1000B98E0);
  swift_dynamicCast(&v12, &v11, (char *)&type metadata for Swift.AnyObject + 8, v6, 7);
  v7 = v12;
  swift_unknownObjectRelease(v5);
  return v7;
}

uint64_t sub_10008B3DC()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 88));
  swift_weakDestroy(v0 + *(_QWORD *)(*(_QWORD *)v0 + 96));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 104)));
  return v0;
}

uint64_t sub_10008B428()
{
  uint64_t v0;

  sub_10008B3DC();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t type metadata accessor for Tree(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100037B54(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Tree);
}

BOOL sub_10008B458(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_10008B464()
{
  Swift::UInt v0;

  Hasher._combine(_:)(v0);
}

Swift::Int sub_10008B48C()
{
  Swift::UInt v0;
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, 0);
  Hasher._combine(_:)(v0);
  return Hasher._finalize()();
}

Swift::Int sub_10008B4D0()
{
  return sub_10008B48C();
}

void sub_10008B4F0()
{
  sub_10008B464();
}

Swift::Int sub_10008B510(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  sub_10008B464();
  return Hasher._finalize()();
}

BOOL sub_10008B54C(uint64_t *a1, uint64_t *a2)
{
  return sub_10008B458(*a1, *a2);
}

uint64_t sub_10008B56C(uint64_t a1)
{
  return swift_getWitnessTable(&unk_10009AE88, a1);
}

uint64_t sub_10008B57C(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  Swift::Int v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  Swift::UInt v18;
  BOOL v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  Swift::UInt v24;
  Swift::UInt v25;
  uint64_t v26;
  char v27;
  Swift::Int v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  _BOOL8 v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t result;
  uint64_t v69;
  uint64_t v70;
  Swift::Int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  Swift::UInt v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  char v81;
  uint64_t (*v82)@<X0>(uint64_t *@<X0>, uint64_t *@<X8>);
  uint64_t v83;
  char v84;
  char v85[24];
  uint64_t v86;
  uint64_t v87;

  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0)
    goto LABEL_123;
LABEL_2:
  v3 = &_swiftEmptySetSingleton;
LABEL_3:
  v87 = (uint64_t)v3;
  v4 = sub_100005104(&qword_1000B9F08);
  v5 = swift_allocObject(v4, 40, 7);
  *(_OWORD *)(v5 + 16) = xmmword_100097E80;
  *(_QWORD *)(v5 + 32) = a1;
  v80 = v5;
  specialized Array._endMutation()(v5);
  v6 = v80;
  v86 = v80;
  v7 = sub_10007B208((uint64_t)_swiftEmptyArrayStorage);
  swift_retain(a1);
  v8 = 0;
  while (1)
  {
    if ((unint64_t)v6 >> 62)
    {
      if (v6 < 0)
        v61 = v6;
      else
        v61 = v6 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v6);
      v9 = _CocoaArrayWrapper.endIndex.getter(v61);
      swift_bridgeObjectRelease(v6);
      if (v9 < v8)
      {
LABEL_126:
        __break(1u);
LABEL_127:
        __break(1u);
LABEL_128:
        v69 = sub_100005104(&qword_1000B98E0);
        result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v69);
        __break(1u);
        return result;
      }
      swift_bridgeObjectRetain(v6);
      v62 = _CocoaArrayWrapper.endIndex.getter(v61);
      swift_bridgeObjectRelease(v6);
      if (v62 < v8)
        goto LABEL_127;
      swift_bridgeObjectRetain(v6);
      a1 = _CocoaArrayWrapper.endIndex.getter(v61);
      swift_bridgeObjectRelease(v6);
      if (a1 < v9)
        goto LABEL_118;
    }
    else
    {
      v9 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
      a1 = v9;
      if (v9 < (unint64_t)v8)
        goto LABEL_117;
    }
    if (v9 < 0)
      goto LABEL_119;
    if ((v6 & 0xC000000000000001) != 0 && v8 != v9)
    {
      if (v8 >= (unint64_t)v9)
        goto LABEL_122;
      v10 = v8;
      do
      {
        sub_100005104(&qword_1000B98E0);
        _ArrayBuffer._typeCheckSlowPath(_:)(v10++);
      }
      while (v9 != v10);
    }
    if ((unint64_t)v6 >> 62)
    {
      if (v6 < 0)
        v14 = v6;
      else
        v14 = v6 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v6);
      a1 = _CocoaArrayWrapper.subscript.getter(v8, v9, v14);
      v11 = v15;
      v13 = v16;
      v12 = v17;
      swift_bridgeObjectRelease(v6);
    }
    else
    {
      a1 = v6 & 0xFFFFFFFFFFFFFF8;
      v11 = (v6 & 0xFFFFFFFFFFFFFF8) + 32;
      v12 = (2 * v9) | 1;
      swift_bridgeObjectRetain(v6);
      v13 = v8;
    }
    if (v13 == v12 >> 1)
    {
      swift_bridgeObjectRelease(v7);
      swift_unknownObjectRelease(a1);
      v64 = v87;
      swift_bridgeObjectRelease(v6);
      v65 = _swiftEmptyArrayStorage;
      goto LABEL_110;
    }
    if (v13 >= (uint64_t)(v12 >> 1))
      goto LABEL_120;
    v18 = *(_QWORD *)(v11 + 8 * v13);
    swift_retain(v18);
    swift_unknownObjectRelease(a1);
    v19 = __OFADD__(v8++, 1);
    if (v19)
    {
LABEL_121:
      __break(1u);
LABEL_122:
      __break(1u);
LABEL_123:
      if (!_CocoaArrayWrapper.endIndex.getter(_swiftEmptyArrayStorage))
        goto LABEL_2;
      v3 = (void *)sub_10008CC44((Swift::Int)_swiftEmptyArrayStorage);
      goto LABEL_3;
    }
    if (*(_QWORD *)(v18 + 16) == a2)
      break;
    swift_retain(v18);
    sub_100059704((Swift::UInt *)&v80, v18);
    swift_release(v80);
    swift_beginAccess(v18 + 40, v85, 0, 0);
    v76 = v18;
    a1 = *(_QWORD *)(v18 + 40);
    if ((unint64_t)a1 >> 62)
    {
      if (a1 < 0)
        v63 = *(_QWORD *)(v18 + 40);
      else
        v63 = a1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain_n(*(_QWORD *)(v18 + 40), 2);
      v20 = _CocoaArrayWrapper.endIndex.getter(v63);
      swift_bridgeObjectRelease(a1);
      if (!v20)
        goto LABEL_107;
LABEL_26:
      v21 = 0;
      v22 = v87;
      v78 = v87 & 0xC000000000000001;
      v79 = a1 & 0xC000000000000001;
      v72 = v8;
      v73 = a1 + 32;
      v23 = v87 & 0xFFFFFFFFFFFFFF8;
      if (v87 < 0)
        v23 = v87;
      v74 = a1 & 0xFFFFFFFFFFFFFF8;
      v75 = v23;
      v77 = v87 + 56;
      v24 = v18;
      while (2)
      {
        while (2)
        {
          if (v79)
          {
            v25 = specialized _ArrayBuffer._getElementSlowPath(_:)(v21, a1);
            v19 = __OFADD__(v21++, 1);
            if (v19)
              goto LABEL_111;
          }
          else
          {
            if (v21 >= *(_QWORD *)(v74 + 16))
              goto LABEL_114;
            v25 = *(_QWORD *)(v73 + 8 * v21);
            swift_retain(v25);
            v19 = __OFADD__(v21++, 1);
            if (v19)
            {
LABEL_111:
              __break(1u);
LABEL_112:
              __break(1u);
              goto LABEL_113;
            }
          }
          if (v78)
          {
            swift_bridgeObjectRetain(v22);
            v26 = swift_retain(v25);
            v27 = __CocoaSet.contains(_:)(v26, v75);
            swift_bridgeObjectRelease(v22);
            swift_release(v25);
            if ((v27 & 1) != 0)
              goto LABEL_29;
          }
          else if (*(_QWORD *)(v22 + 16))
          {
            Hasher.init(_seed:)(&v80, *(_QWORD *)(v22 + 40));
            Hasher._combine(_:)(v25);
            v28 = Hasher._finalize()();
            v29 = -1 << *(_BYTE *)(v22 + 32);
            v30 = v28 & ~v29;
            if (((*(_QWORD *)(v77 + ((v30 >> 3) & 0xFFFFFFFFFFFFF8)) >> v30) & 1) != 0)
            {
              v31 = *(_QWORD *)(v22 + 48);
              if (*(_QWORD *)(v31 + 8 * v30) == v25)
              {
LABEL_29:
                swift_release(v25);
                if (v21 == v20)
                  goto LABEL_4;
                continue;
              }
              v32 = ~v29;
              while (1)
              {
                v30 = (v30 + 1) & v32;
                if (((*(_QWORD *)(v77 + ((v30 >> 3) & 0xFFFFFFFFFFFFF8)) >> v30) & 1) == 0)
                  break;
                if (*(_QWORD *)(v31 + 8 * v30) == v25)
                  goto LABEL_29;
              }
            }
          }
          break;
        }
        v33 = a1;
        v34 = v86;
        if (!((unint64_t)v86 >> 62))
        {
          a1 = *(_QWORD *)((v86 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain(v86);
          if (a1)
            goto LABEL_48;
LABEL_57:
          swift_bridgeObjectRelease(v34);
LABEL_58:
          v37 = swift_retain(v25);
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v37);
          v39 = *(_QWORD *)((v86 & 0xFFFFFFFFFFFFFF8) + 0x10);
          v38 = *(_QWORD *)((v86 & 0xFFFFFFFFFFFFFF8) + 0x18);
          if (v39 >= v38 >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v38 > 1, v39 + 1, 1);
          v40 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v39, v25);
          specialized Array._endMutation()(v40);
          if ((v7 & 0xC000000000000001) != 0)
          {
LABEL_61:
            if (v7 < 0)
              v41 = v7;
            else
              v41 = v7 & 0xFFFFFFFFFFFFFF8;
            swift_retain(v24);
            v42 = __CocoaDictionary.count.getter(v41);
            if (__OFADD__(v42, 1))
              goto LABEL_115;
            v7 = sub_10008C03C(v41, v42 + 1);
            goto LABEL_82;
          }
LABEL_81:
          swift_retain(v24);
LABEL_82:
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v7);
          v80 = v7;
          v51 = sub_100058D30(v25);
          v52 = *(_QWORD *)(v7 + 16);
          v53 = (v50 & 1) == 0;
          v54 = v52 + v53;
          if (__OFADD__(v52, v53))
            goto LABEL_112;
          a1 = v50;
          if (*(_QWORD *)(v7 + 24) >= v54)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              sub_1000709B0();
          }
          else
          {
            sub_1000715E0(v54, isUniquelyReferenced_nonNull_native);
            v55 = sub_100058D30(v25);
            if ((a1 & 1) != (v56 & 1))
              goto LABEL_128;
            v51 = v55;
          }
          v24 = v76;
          v7 = v80;
          v57 = 8 * v51;
          if ((a1 & 1) != 0)
          {
            v58 = *(_QWORD *)(v80 + 56);
            swift_release(*(_QWORD *)(v58 + v57));
            *(_QWORD *)(v58 + v57) = v76;
          }
          else
          {
            *(_QWORD *)(v80 + 8 * (v51 >> 6) + 64) |= 1 << v51;
            *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v51) = v25;
            *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v51) = v76;
            v59 = *(_QWORD *)(v7 + 16);
            v19 = __OFADD__(v59, 1);
            v60 = v59 + 1;
            if (v19)
              goto LABEL_116;
            *(_QWORD *)(v7 + 16) = v60;
            swift_retain(v25);
          }
          swift_release(v25);
          swift_bridgeObjectRelease(0x8000000000000000);
          a1 = v33;
          if (v21 == v20)
          {
LABEL_4:
            swift_release(v24);
            v8 = v72;
            goto LABEL_5;
          }
          continue;
        }
        break;
      }
      if (v86 < 0)
        v43 = v86;
      else
        v43 = v86 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v86);
      a1 = _CocoaArrayWrapper.endIndex.getter(v43);
      if (!a1)
        goto LABEL_57;
LABEL_48:
      if ((v34 & 0xC000000000000001) != 0)
      {
        v44 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, v34);
        swift_unknownObjectRelease(v44);
        if (v44 != v25)
        {
          if (a1 == 1)
            goto LABEL_57;
          v45 = specialized _ArrayBuffer._getElementSlowPath(_:)(1, v34);
          swift_unknownObjectRelease(v45);
          if (v45 != v25)
          {
            if (a1 == 2)
              goto LABEL_57;
            v46 = 2;
            while (1)
            {
              v47 = specialized _ArrayBuffer._getElementSlowPath(_:)(v46, v34);
              v70 = v46 + 1;
              if (__OFADD__(v46, 1))
              {
                __break(1u);
                goto LABEL_126;
              }
              v48 = v47;
              swift_unknownObjectRelease(v47);
              if (v48 == v25)
                break;
              ++v46;
              if (v70 == a1)
              {
                swift_bridgeObjectRelease(v34);
                v24 = v76;
                goto LABEL_58;
              }
            }
            swift_bridgeObjectRelease(v34);
            v24 = v76;
            if ((v7 & 0xC000000000000001) != 0)
              goto LABEL_61;
            goto LABEL_81;
          }
        }
      }
      else if (*(_QWORD *)(v34 + 32) != v25)
      {
        if (a1 == 1)
          goto LABEL_57;
        if (*(_QWORD *)(v34 + 40) != v25)
        {
          if (a1 != 2)
          {
            v35 = 6;
            while (1)
            {
              v36 = v35 - 3;
              if (__OFADD__(v35 - 4, 1))
                break;
              if (*(_QWORD *)(v34 + 8 * v35) == v25)
                goto LABEL_80;
              ++v35;
              if (v36 == a1)
                goto LABEL_57;
            }
LABEL_113:
            __break(1u);
LABEL_114:
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
            goto LABEL_121;
          }
          goto LABEL_57;
        }
      }
LABEL_80:
      swift_bridgeObjectRelease(v34);
      if ((v7 & 0xC000000000000001) != 0)
        goto LABEL_61;
      goto LABEL_81;
    }
    v20 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(*(_QWORD *)(v18 + 40));
    if (v20)
      goto LABEL_26;
LABEL_107:
    swift_release(v18);
LABEL_5:
    swift_bridgeObjectRelease(a1);
    v6 = v86;
  }
  swift_bridgeObjectRelease(v87);
  v66 = swift_allocObject(&unk_1000B4260, 24, 7);
  *(_QWORD *)(v66 + 16) = v7;
  v67 = swift_allocObject(&unk_1000B4288, 32, 7);
  *(_QWORD *)(v67 + 16) = sub_10008CF28;
  *(_QWORD *)(v67 + 24) = v66;
  v80 = v18;
  v81 = 1;
  v82 = sub_10008CF54;
  v83 = v67;
  v84 = 0;
  v65 = (_QWORD *)sub_10008BDFC();
  v64 = v86;
LABEL_110:
  swift_bridgeObjectRelease(v64);
  return (uint64_t)v65;
}

unint64_t sub_10008BDFC()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  v18 = *(_QWORD *)v0;
  v19 = *(_BYTE *)(v0 + 8);
  v1 = *(_QWORD *)(v0 + 24);
  sub_10008CF7C(&v18);
  swift_retain(v1);
  v2 = sub_10008C658((uint64_t *)v0);
  sub_10008CFA4(&v18);
  swift_release(v1);
  v17 = v2;
  if ((v2 & 0x8000000000000000) != 0 || (v2 & 0x4000000000000000) != 0)
    goto LABEL_37;
  v3 = *(_QWORD *)(v2 + 16);
  sub_10008CFA4(&v18);
  swift_release(v1);
  v4 = (unint64_t)v3 >> 1;
  while ((unint64_t)(v3 + 1) >= 3)
  {
    v2 = 0;
    while (1)
    {
      v7 = v2 + 1;
      v1 = v3 - (v2 + 1);
      if (__OFSUB__(v3, v2 + 1))
        break;
      if (v2 != v1)
      {
        v8 = v17;
        if ((v17 & 0xC000000000000001) != 0)
        {
          v10 = specialized _ArrayBuffer._getElementSlowPath(_:)(v2, v17);
          v11 = specialized _ArrayBuffer._getElementSlowPath(_:)(v3 - (v2 + 1), v17);
        }
        else
        {
          if ((v2 & 0x8000000000000000) != 0)
            goto LABEL_31;
          v9 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (v2 >= v9)
            goto LABEL_32;
          v10 = *(_QWORD *)(v17 + 8 * v2 + 32);
          swift_retain(v10);
          if ((v1 & 0x8000000000000000) != 0)
            goto LABEL_33;
          if (v1 >= v9)
            goto LABEL_35;
          v11 = *(_QWORD *)(v17 + 32 + 8 * v1);
          swift_retain(v11);
        }
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject(v17)
          || v17 < 0
          || (v17 & 0x4000000000000000) != 0)
        {
          v8 = sub_10005B8C0(v17);
          v17 = v8;
        }
        v12 = (v8 & 0xFFFFFFFFFFFFFF8) + 8 * v2;
        v13 = swift_release(*(_QWORD *)(v12 + 32));
        *(_QWORD *)(v12 + 32) = v11;
        specialized Array._endMutation()(v13);
        v2 = v17;
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject(v17)
          || v17 < 0
          || (v17 & 0x4000000000000000) != 0)
        {
          v2 = sub_10005B8C0(v17);
          v17 = v2;
        }
        if ((v1 & 0x8000000000000000) != 0)
          goto LABEL_34;
        if (v1 >= *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_36;
        v5 = (v2 & 0xFFFFFFFFFFFFFF8) + 8 * v1;
        v6 = swift_release(*(_QWORD *)(v5 + 32));
        *(_QWORD *)(v5 + 32) = v10;
        specialized Array._endMutation()(v6);
      }
      v2 = v7;
      if (v4 == v7)
        return v17;
    }
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    v15 = swift_retain(v2);
    v3 = _CocoaArrayWrapper.endIndex.getter(v15);
    swift_release(v2);
    sub_10008CFA4(&v18);
    swift_release(v1);
    if (v3 >= 0)
      v16 = v3;
    else
      v16 = v3 + 1;
    if (v3 < -1)
      __break(1u);
    v4 = v16 >> 1;
  }
  return v2;
}

Swift::Int sub_10008C03C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::UInt v9;
  uint64_t v10;
  Swift::Int result;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  BOOL v23;
  uint64_t v24;
  _QWORD v25[9];
  uint64_t v26;
  Swift::UInt v27;
  uint64_t v28;

  if (a2)
  {
    sub_100005104(&qword_1000B9D30);
    v4 = static _DictionaryStorage.convert(_:capacity:)(a1, a2);
    v28 = v4;
    v5 = __CocoaDictionary.makeIterator()(a1);
    v6 = __CocoaDictionary.Iterator.next()();
    if (v6)
    {
      v8 = v7;
      do
      {
        v25[0] = v6;
        v19 = sub_100005104(&qword_1000B98E0);
        swift_dynamicCast(&v27, v25, (char *)&type metadata for Swift.AnyObject + 8, v19, 7);
        v25[0] = v8;
        swift_dynamicCast(&v26, v25, (char *)&type metadata for Swift.AnyObject + 8, v19, 7);
        v20 = *(_QWORD *)(v4 + 16);
        if (*(_QWORD *)(v4 + 24) <= v20)
        {
          sub_1000715E0(v20 + 1, 1);
          v4 = v28;
        }
        v10 = v26;
        v9 = v27;
        Hasher.init(_seed:)(v25, *(_QWORD *)(v4 + 40));
        Hasher._combine(_:)(v9);
        result = Hasher._finalize()();
        v12 = v4 + 64;
        v13 = -1 << *(_BYTE *)(v4 + 32);
        v14 = result & ~v13;
        v15 = v14 >> 6;
        if (((-1 << v14) & ~*(_QWORD *)(v4 + 64 + 8 * (v14 >> 6))) != 0)
        {
          v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v4 + 64 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v21 = 0;
          v22 = (unint64_t)(63 - v13) >> 6;
          do
          {
            if (++v15 == v22 && (v21 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v23 = v15 == v22;
            if (v15 == v22)
              v15 = 0;
            v21 |= v23;
            v24 = *(_QWORD *)(v12 + 8 * v15);
          }
          while (v24 == -1);
          v16 = __clz(__rbit64(~v24)) + (v15 << 6);
        }
        *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
        v17 = 8 * v16;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + v17) = v9;
        *(_QWORD *)(*(_QWORD *)(v4 + 56) + v17) = v10;
        ++*(_QWORD *)(v4 + 16);
        v6 = __CocoaDictionary.Iterator.next()();
        v8 = v18;
      }
      while (v6);
    }
    swift_release(v5);
  }
  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  return v4;
}

uint64_t sub_10008C26C(uint64_t *a1, void (*a2)(uint64_t *__return_ptr, uint64_t *))
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  if (*((_BYTE *)a1 + 8) == 1)
  {
    *((_BYTE *)a1 + 8) = 0;
    swift_retain(v3);
  }
  else if (v3)
  {
    v7 = *a1;
    swift_retain(v3);
    a2(&v8, &v7);
    swift_release(v3);
    v5 = v8;
    swift_retain(v8);
    swift_release(v3);
    *a1 = v5;
    return v5;
  }
  return v3;
}

uint64_t sub_10008C304(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  _OWORD *v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _OWORD *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD *v31;
  unint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  const void *v40;
  BOOL v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;

  v55 = a1 + 32;
  result = swift_bridgeObjectRetain(a1);
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v54 = result + 56;
  v7 = _swiftEmptyArrayStorage;
  v8 = &_swiftEmptyArrayStorage[4];
LABEL_3:
  v10 = *(_QWORD *)(a1 + 16);
  if (v6 == v10)
    goto LABEL_32;
  v57 = v5;
  if (v6 >= v10)
  {
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v11 = v7;
  v12 = 16 * v6;
  v13 = (uint64_t *)(v55 + 16 * v6);
  v15 = *v13;
  v14 = v13[1];
  swift_bridgeObjectRetain(*v13);
  swift_bridgeObjectRetain(v14);
  result = sub_10004E8C8(v4, v3);
  ++v6;
  v16 = (uint64_t *)(v54 + v12);
  v4 = v15;
  if (!v15)
    goto LABEL_7;
LABEL_6:
  v9 = *(_QWORD *)(v4 + 16);
  if (v9)
  {
    v20 = 0;
    v3 = v14;
    v7 = v11;
    v5 = v57;
    while (1)
    {
      if (v20 >= v9)
        goto LABEL_37;
      v21 = (_OWORD *)(v4 + 192 * v20);
      v22 = v21[2];
      v23 = v21[3];
      v24 = v21[5];
      v61 = v21[4];
      v62 = v24;
      v59 = v22;
      v60 = v23;
      v25 = v21[6];
      v26 = v21[7];
      v27 = v21[9];
      v65 = v21[8];
      v66 = v27;
      v63 = v25;
      v64 = v26;
      v28 = v21[10];
      v29 = v21[11];
      v30 = v21[13];
      v69 = v21[12];
      v70 = v30;
      v67 = v28;
      v68 = v29;
      v56 = v3;
      if (v5)
      {
        result = sub_10002D724((uint64_t)&v59);
        v31 = v7;
      }
      else
      {
        v32 = v7[3];
        if ((uint64_t)((v32 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_39;
        v33 = v32 & 0xFFFFFFFFFFFFFFFELL;
        if (v33 <= 1)
          v34 = 1;
        else
          v34 = v33;
        v35 = sub_100005104(&qword_1000B9230);
        v31 = (_QWORD *)swift_allocObject(v35, (192 * v34) | 0x20, 7);
        v36 = (uint64_t)(j__malloc_size(v31) - 32) / 192;
        v31[2] = v34;
        v31[3] = 2 * v36;
        v37 = v7[3] >> 1;
        v8 = &v31[24 * v37 + 4];
        v38 = v36 & 0x7FFFFFFFFFFFFFFFLL;
        v5 = v38 - v37;
        if (v7[2])
        {
          v58 = v38 - v37;
          v39 = v7;
          if (v31 < v7 || v31 + 4 >= &v7[24 * v37 + 4])
          {
            v40 = v7 + 4;
            sub_10002D724((uint64_t)&v59);
          }
          else
          {
            v40 = v7 + 4;
            sub_10002D724((uint64_t)&v59);
            if (v31 == v39)
              goto LABEL_27;
          }
          memmove(v31 + 4, v40, 192 * v37);
LABEL_27:
          v39[2] = 0;
          result = swift_release(v39);
          v5 = v58;
          goto LABEL_28;
        }
        sub_10002D724((uint64_t)&v59);
        result = swift_release(v7);
      }
LABEL_28:
      v41 = __OFSUB__(v5--, 1);
      if (v41)
        goto LABEL_38;
      ++v20;
      v42 = v59;
      v43 = v60;
      v44 = v62;
      v8[2] = v61;
      v8[3] = v44;
      *v8 = v42;
      v8[1] = v43;
      v45 = v63;
      v46 = v64;
      v47 = v66;
      v8[6] = v65;
      v8[7] = v47;
      v8[4] = v45;
      v8[5] = v46;
      v48 = v67;
      v49 = v68;
      v50 = v70;
      v8[10] = v69;
      v8[11] = v50;
      v8[8] = v48;
      v8[9] = v49;
      v8 += 12;
      v7 = v31;
      v3 = v56;
      if (v4)
      {
        v9 = *(_QWORD *)(v4 + 16);
        if (v20 != v9)
          continue;
      }
      goto LABEL_3;
    }
  }
LABEL_7:
  while (1)
  {
    v17 = *(_QWORD *)(a1 + 16);
    if (v6 == v17)
      break;
    if (v6 >= v17)
      goto LABEL_36;
    v19 = *(v16 - 1);
    v18 = *v16;
    swift_bridgeObjectRetain(v19);
    swift_bridgeObjectRetain(v18);
    result = sub_10004E8C8(v4, v14);
    ++v6;
    v16 += 2;
    v14 = v18;
    v4 = v19;
    if (v19)
      goto LABEL_6;
  }
  v3 = v14;
  v7 = v11;
  v5 = v57;
LABEL_32:
  swift_bridgeObjectRelease(a1);
  result = sub_10004E8C8(v4, v3);
  v51 = v7[3];
  if (v51 < 2)
    return (uint64_t)v7;
  v52 = v51 >> 1;
  v41 = __OFSUB__(v52, v5);
  v53 = v52 - v5;
  if (!v41)
  {
    v7[2] = v53;
    return (uint64_t)v7;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_10008C658(uint64_t *a1)
{
  uint64_t v1;
  void (*v2)(uint64_t *__return_ptr, uint64_t *);
  char v3;
  uint64_t result;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  BOOL v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;

  v28 = *a1;
  v29 = *((_BYTE *)a1 + 8);
  v2 = (void (*)(uint64_t *__return_ptr, uint64_t *))a1[2];
  v1 = a1[3];
  v3 = *((_BYTE *)a1 + 32);
  v26 = v28;
  v27 = v29;
  sub_10008CF7C(&v28);
  swift_retain(v1);
  if ((v3 & 1) != 0)
  {
    v7 = 0;
    v6 = _swiftEmptyArrayStorage;
  }
  else
  {
    swift_retain(v1);
    v2(&v25, &v26);
    result = swift_release(v1);
    v5 = v25;
    v6 = _swiftEmptyArrayStorage;
    v7 = 0;
    if (v25)
    {
      v8 = &_swiftEmptyArrayStorage[4];
      while (1)
      {
        if (!v7)
        {
          v9 = v6[3];
          if ((uint64_t)((v9 >> 1) + 0x4000000000000000) < 0)
            goto LABEL_29;
          v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
          if (v10 <= 1)
            v11 = 1;
          else
            v11 = v10;
          v12 = sub_100005104(&qword_1000B9F08);
          v13 = (_QWORD *)swift_allocObject(v12, 8 * v11 + 32, 7);
          v14 = j__malloc_size(v13);
          v15 = v14 - 32;
          if (v14 < 32)
            v15 = v14 - 25;
          v16 = v15 >> 3;
          v13[2] = v11;
          v13[3] = (2 * (v15 >> 3)) | 1;
          v17 = (unint64_t)(v13 + 4);
          v18 = v6[3] >> 1;
          if (v6[2])
          {
            if (v13 != v6 || v17 >= (unint64_t)&v6[v18 + 4])
              memmove(v13 + 4, v6 + 4, 8 * v18);
            v6[2] = 0;
          }
          v8 = (_QWORD *)(v17 + 8 * v18);
          v7 = (v16 & 0x7FFFFFFFFFFFFFFFLL) - v18;
          result = swift_release(v6);
          v6 = v13;
        }
        v20 = __OFSUB__(v7--, 1);
        if (v20)
          break;
        *v8++ = v5;
        swift_retain(v1);
        v2(&v25, &v26);
        result = swift_release(v1);
        v5 = v25;
        if (!v25)
          goto LABEL_24;
      }
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }
LABEL_24:
  v21 = v26;
  swift_release(v1);
  result = swift_release(v21);
  v22 = v6[3];
  if (v22 < 2)
    return (uint64_t)v6;
  v23 = v22 >> 1;
  v20 = __OFSUB__(v23, v7);
  v24 = v23 - v7;
  if (!v20)
  {
    v6[2] = v24;
    return (uint64_t)v6;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10008C830@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  Swift::UInt v6;
  uint64_t v7;
  uint64_t result;

  v5 = *a1;
  v6 = swift_retain(*a1);
  v7 = sub_10008B304(v6, a2);
  result = swift_release(v5);
  *a3 = v7;
  return result;
}

_QWORD *sub_10008C87C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  void (*v10)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _BYTE v34[24];
  _QWORD v35[13];
  uint64_t v36;
  uint64_t v37;

  v3 = v2;
  v6 = sub_100005104(&qword_1000B98E0);
  v7 = (_QWORD *)swift_allocObject(v6, 48, 7);
  v8 = swift_weakInit(v7 + 4, 0);
  v7[2] = a1;
  v7[3] = a2;
  swift_weakAssign(v8, 0);
  v7[5] = _swiftEmptyArrayStorage;
  v9 = v7 + 5;
  v10 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(a2 + 16);
  swift_retain(v7);
  v10(v35, a1, a2);
  v11 = v36;
  v37 = v36;
  swift_bridgeObjectRetain(v36);
  sub_10002CC24(v35);
  v12 = *(_QWORD *)(v11 + 16);
  if (v12)
  {
    v13 = (_QWORD *)(v11 + 40);
    while (1)
    {
      v14 = *(v13 - 1);
      v15 = *v13;
      if (v14 == a1)
      {
        sub_10002ABC8(&v37);
        swift_release(v7);
        sub_10006BAE0(0, v22, v23, v24);
        v26 = v25;
        v30 = sub_10008CFD8(v25, v27, v28, v29);
        v31 = swift_allocError(v26, v30, 0, 0);
        *v32 = a1;
        v32[1] = v15;
        swift_willThrow(v31);
        goto LABEL_10;
      }
      v16 = sub_10008C87C(v14, *v13);
      if (v3)
        break;
      v17 = v16;
      swift_beginAccess(v7 + 5, v34, 33, 0);
      v18 = swift_retain(v17);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v18);
      v20 = *(_QWORD *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v19 = *(_QWORD *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v20 >= v19 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v19 > 1, v20 + 1, 1);
      v21 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v20, v17);
      specialized Array._endMutation()(v21);
      swift_endAccess(v34);
      swift_weakAssign(v17 + 32, v7);
      swift_release(v17);
      v13 += 2;
      if (!--v12)
        goto LABEL_8;
    }
    sub_10002ABC8(&v37);
    swift_release_n(v7, 2);
  }
  else
  {
LABEL_8:
    sub_10002ABC8(&v37);
LABEL_10:
    swift_release(v7);
  }
  return v7;
}

Swift::Int sub_10008CA80(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::UInt v7;
  Swift::UInt v8;
  char v9;
  char v10;
  Swift::UInt v11;
  Swift::Int result;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[9];

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_100005104(&qword_1000B98B0);
    v3 = static _SetStorage.allocate(capacity:)(v1);
    v4 = 0;
    v5 = v3 + 56;
    v25 = v1;
    v26 = a1 + 32;
    while (1)
    {
      v6 = v26 + 24 * v4;
      v7 = *(_QWORD *)v6;
      v8 = *(_QWORD *)(v6 + 8);
      v9 = *(_BYTE *)(v6 + 16);
      v10 = *(_BYTE *)(v6 + 17);
      Hasher.init(_seed:)(v27, *(_QWORD *)(v3 + 40));
      if ((v10 & 1) != 0 || (Hasher._combine(_:)(1uLL), Hasher._combine(_:)(v7), (v9 & 1) != 0))
      {
        v11 = 0;
      }
      else
      {
        Hasher._combine(_:)(1uLL);
        v11 = v8;
      }
      Hasher._combine(_:)(v11);
      result = Hasher._finalize()();
      v13 = ~(-1 << *(_BYTE *)(v3 + 32));
      v14 = result & v13;
      v15 = (result & (unint64_t)v13) >> 6;
      v16 = *(_QWORD *)(v5 + 8 * v15);
      v17 = 1 << (result & v13);
      v18 = *(_QWORD *)(v3 + 48);
      if ((v17 & v16) != 0)
      {
        do
        {
          v23 = v18 + 24 * v14;
          if ((*(_BYTE *)(v23 + 17) & 1) != 0)
          {
            if ((v10 & 1) != 0)
              goto LABEL_3;
          }
          else
          {
            if (*(_QWORD *)v23 == v7)
              v24 = v10;
            else
              v24 = 1;
            if ((v24 & 1) == 0)
            {
              if ((*(_BYTE *)(v23 + 16) & 1) != 0)
              {
                if ((v9 & 1) != 0)
                  goto LABEL_3;
              }
              else if ((v9 & 1) == 0 && *(_QWORD *)(v23 + 8) == v8)
              {
                goto LABEL_3;
              }
            }
          }
          v14 = (v14 + 1) & v13;
          v15 = v14 >> 6;
          v16 = *(_QWORD *)(v5 + 8 * (v14 >> 6));
          v17 = 1 << v14;
        }
        while ((v16 & (1 << v14)) != 0);
      }
      *(_QWORD *)(v5 + 8 * v15) = v17 | v16;
      v19 = v18 + 24 * v14;
      *(_QWORD *)v19 = v7;
      *(_QWORD *)(v19 + 8) = v8;
      *(_BYTE *)(v19 + 16) = v9;
      *(_BYTE *)(v19 + 17) = v10;
      v20 = *(_QWORD *)(v3 + 16);
      v21 = __OFADD__(v20, 1);
      v22 = v20 + 1;
      if (v21)
        break;
      *(_QWORD *)(v3 + 16) = v22;
LABEL_3:
      if (++v4 == v25)
        return v3;
    }
    __break(1u);
  }
  else
  {
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return result;
}

Swift::Int sub_10008CC44(Swift::Int result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  BOOL v10;
  Swift::UInt v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
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
  Swift::UInt v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[9];

  v1 = result;
  v2 = (unint64_t)result >> 62;
  if ((unint64_t)result >> 62)
  {
    if (result < 0)
      v6 = result;
    else
      v6 = result & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(result);
    v3 = _CocoaArrayWrapper.endIndex.getter(v6);
    result = swift_bridgeObjectRelease(v1);
    if (v3)
    {
LABEL_3:
      sub_100005104(&qword_1000B98E8);
      result = static _SetStorage.allocate(capacity:)(v3);
      v4 = (_QWORD *)result;
      if (!v2)
        goto LABEL_4;
LABEL_11:
      if (v1 < 0)
        v7 = v1;
      else
        v7 = v1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v1);
      v5 = _CocoaArrayWrapper.endIndex.getter(v7);
      result = swift_bridgeObjectRelease(v1);
      if (!v5)
        return (Swift::Int)v4;
      goto LABEL_15;
    }
  }
  else
  {
    v3 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
  }
  v4 = &_swiftEmptySetSingleton;
  if (v2)
    goto LABEL_11;
LABEL_4:
  v5 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v5)
    return (Swift::Int)v4;
LABEL_15:
  v8 = (char *)(v4 + 7);
  if ((v1 & 0xC000000000000001) == 0)
  {
    v21 = 0;
    v22 = v1 + 32;
    v23 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    while (1)
    {
      if (v21 == v23)
        goto LABEL_41;
      v26 = *(_QWORD *)(v22 + 8 * v21);
      Hasher.init(_seed:)(v34, v4[5]);
      Hasher._combine(_:)(v26);
      result = Hasher._finalize()();
      v27 = -1 << *((_BYTE *)v4 + 32);
      v28 = result & ~v27;
      v29 = v28 >> 6;
      v30 = *(_QWORD *)&v8[8 * (v28 >> 6)];
      v31 = 1 << v28;
      v32 = v4[6];
      if (((1 << v28) & v30) == 0)
        goto LABEL_29;
      if (*(_QWORD *)(v32 + 8 * v28) != v26)
        break;
LABEL_31:
      if (++v21 == v5)
        return (Swift::Int)v4;
    }
    v33 = ~v27;
    while (1)
    {
      v28 = (v28 + 1) & v33;
      v29 = v28 >> 6;
      v30 = *(_QWORD *)&v8[8 * (v28 >> 6)];
      v31 = 1 << v28;
      if ((v30 & (1 << v28)) == 0)
        break;
      if (*(_QWORD *)(v32 + 8 * v28) == v26)
        goto LABEL_31;
    }
LABEL_29:
    *(_QWORD *)&v8[8 * v29] = v31 | v30;
    *(_QWORD *)(v32 + 8 * v28) = v26;
    v24 = v4[2];
    v10 = __OFADD__(v24, 1);
    v25 = v24 + 1;
    if (v10)
      goto LABEL_42;
    v4[2] = v25;
    result = swift_retain(v26);
    goto LABEL_31;
  }
  v9 = 0;
  while (1)
  {
    result = specialized _ArrayBuffer._getElementSlowPath(_:)(v9, v1);
    v10 = __OFADD__(v9++, 1);
    if (v10)
      break;
    v11 = result;
    Hasher.init(_seed:)(v34, v4[5]);
    Hasher._combine(_:)(v11);
    result = Hasher._finalize()();
    v12 = -1 << *((_BYTE *)v4 + 32);
    v13 = result & ~v12;
    v14 = v13 >> 6;
    v15 = *(_QWORD *)&v8[8 * (v13 >> 6)];
    v16 = 1 << v13;
    v17 = v4[6];
    if (((1 << v13) & v15) == 0)
      goto LABEL_25;
    if (*(_QWORD *)(v17 + 8 * v13) == v11)
    {
LABEL_17:
      swift_unknownObjectRelease(v11);
      if (v9 == v5)
        return (Swift::Int)v4;
    }
    else
    {
      v18 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v18;
        v14 = v13 >> 6;
        v15 = *(_QWORD *)&v8[8 * (v13 >> 6)];
        v16 = 1 << v13;
        if ((v15 & (1 << v13)) == 0)
          break;
        if (*(_QWORD *)(v17 + 8 * v13) == v11)
          goto LABEL_17;
      }
LABEL_25:
      *(_QWORD *)&v8[8 * v14] = v16 | v15;
      *(_QWORD *)(v17 + 8 * v13) = v11;
      v19 = v4[2];
      v10 = __OFADD__(v19, 1);
      v20 = v19 + 1;
      if (v10)
        goto LABEL_40;
      v4[2] = v20;
      if (v9 == v5)
        return (Swift::Int)v4;
    }
  }
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_10008CF04()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10008CF28@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_10008C830(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_10008CF30()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10008CF54@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_10008C26C(a1, *(void (**)(uint64_t *__return_ptr, uint64_t *))(v2 + 16));
  *a2 = result;
  return result;
}

_QWORD *sub_10008CF7C(_QWORD *a1)
{
  swift_retain(*a1);
  return a1;
}

_QWORD *sub_10008CFA4(_QWORD *a1)
{
  swift_release(*a1);
  return a1;
}

uint64_t _s19InitializationErrorOMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100037B54(a1, a2, a3, a4, (uint64_t)&_s19InitializationErrorOMn);
}

unint64_t sub_10008CFD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t result;
  uint64_t v5;

  result = qword_1000B9F10[0];
  if (!qword_1000B9F10[0])
  {
    sub_10006BAE0(255, a2, a3, a4);
    result = swift_getWitnessTable(&unk_10009AF18, v5);
    atomic_store(result, qword_1000B9F10);
  }
  return result;
}

uint64_t sub_10008D020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 0);
}

uint64_t ToolInfoHeader.serializationVersion.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

unint64_t sub_10008D030()
{
  return 0xD000000000000014;
}

uint64_t sub_10008D04C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result;

  result = sub_100091224(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_10008D078(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10008D1CC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10008D0A0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10008D1CC();
  return CodingKey.debugDescription.getter(a1, v2);
}

_QWORD *ToolInfoHeader.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v3 = sub_100005104(&qword_1000B9F98);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  v9 = sub_100006270(a1, v7);
  v10 = sub_10008D1CC();
  v11 = dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for ToolInfoHeader.CodingKeys, &type metadata for ToolInfoHeader.CodingKeys, v10, v7, v8);
  if (!v1)
  {
    v9 = (_QWORD *)KeyedDecodingContainer.decode(_:forKey:)(v11, v3);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_1000062D8(a1);
  return v9;
}

unint64_t sub_10008D1CC()
{
  unint64_t result;

  result = qword_1000C2670;
  if (!qword_1000C2670)
  {
    result = swift_getWitnessTable(&unk_10009B9E4, &type metadata for ToolInfoHeader.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000C2670);
  }
  return result;
}

uint64_t sub_10008D210@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v5 = sub_100005104(&qword_1000B9F98);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100006270(a1, v9);
  v11 = sub_10008D1CC();
  v12 = dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for ToolInfoHeader.CodingKeys, &type metadata for ToolInfoHeader.CodingKeys, v11, v9, v10);
  if (v2)
    return sub_1000062D8(a1);
  v13 = KeyedDecodingContainer.decode(_:forKey:)(v12, v5);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  result = sub_1000062D8(a1);
  *a2 = v13;
  return result;
}

uint64_t ToolInfoV0.serializationVersion.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t *ToolInfoV0.command.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_10008D334((uint64_t *)(v1 + 8), a1);
}

uint64_t *sub_10008D334(uint64_t *a1, uint64_t *a2)
{
  return initializeWithCopy for CommandInfoV0(a2, a1);
}

_QWORD *ToolInfoV0.command.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_10008D34C(a1, (_QWORD *)(v1 + 8));
}

_QWORD *sub_10008D34C(uint64_t a1, _QWORD *a2)
{
  return assignWithTake for CommandInfoV0(a2, a1);
}

Swift::String_optional (__swiftcall *ToolInfoV0.command.modify())(Swift::String argument)
{
  return String.init(argument:);
}

__n128 ToolInfoV0.init(command:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __int128 v3;
  __n128 result;
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a2 = 0;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)a1;
  *(_QWORD *)(a2 + 24) = v2;
  v3 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 48) = v3;
  result = *(__n128 *)(a1 + 56);
  v5 = *(_OWORD *)(a1 + 72);
  *(__n128 *)(a2 + 64) = result;
  *(_OWORD *)(a2 + 80) = v5;
  return result;
}

_QWORD *ToolInfoV0.hash(into:)(uint64_t a1)
{
  Swift::UInt *v1;

  Hasher._combine(_:)(*v1);
  sub_100077204(v1);
  CommandInfoV0.hash(into:)(a1);
  return sub_1000772CC(v1);
}

uint64_t static ToolInfoV0.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  char v6;
  _OWORD v8[5];
  uint64_t v9;
  _OWORD v10[5];
  uint64_t v11;

  if (*(_QWORD *)a1 == *(_QWORD *)a2)
  {
    v2 = *(_OWORD *)(a1 + 56);
    v10[2] = *(_OWORD *)(a1 + 40);
    v10[3] = v2;
    v10[4] = *(_OWORD *)(a1 + 72);
    v11 = *(_QWORD *)(a1 + 88);
    v3 = *(_OWORD *)(a1 + 24);
    v10[0] = *(_OWORD *)(a1 + 8);
    v10[1] = v3;
    v4 = *(_OWORD *)(a2 + 56);
    v8[2] = *(_OWORD *)(a2 + 40);
    v8[3] = v4;
    v8[4] = *(_OWORD *)(a2 + 72);
    v9 = *(_QWORD *)(a2 + 88);
    v5 = *(_OWORD *)(a2 + 24);
    v8[0] = *(_OWORD *)(a2 + 8);
    v8[1] = v5;
    v6 = _s22ArgumentParserToolInfo07CommandD2V0V23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v10, (uint64_t)v8);
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

uint64_t sub_10008D4AC()
{
  _BYTE *v0;

  if (*v0)
    return 0x646E616D6D6F63;
  else
    return 0xD000000000000014;
}

uint64_t sub_10008D4EC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100091998(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10008D510(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100091910();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10008D538(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100091910();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ToolInfoV0.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  unint64_t v15;
  uint64_t v17;
  char v18;
  _OWORD v19[5];
  uint64_t v20;

  v3 = v1;
  v5 = sub_100005104(&qword_1000B9FA0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100006270(a1, v9);
  v11 = sub_100091910();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for ToolInfoV0.CodingKeys, &type metadata for ToolInfoV0.CodingKeys, v11, v9, v10);
  v12 = *v3;
  LOBYTE(v19[0]) = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v19, v5);
  if (!v2)
  {
    v13 = *(_OWORD *)(v3 + 7);
    v19[2] = *(_OWORD *)(v3 + 5);
    v19[3] = v13;
    v19[4] = *(_OWORD *)(v3 + 9);
    v20 = v3[11];
    v14 = *(_OWORD *)(v3 + 3);
    v19[0] = *(_OWORD *)(v3 + 1);
    v19[1] = v14;
    v18 = 1;
    v15 = sub_100091954();
    KeyedEncodingContainer.encode<A>(_:forKey:)(v19, &v18, v5, &type metadata for CommandInfoV0, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

Swift::Int ToolInfoV0.hashValue.getter()
{
  uint64_t v0;
  __int128 v1;
  __int128 v2;
  _QWORD v4[9];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  Hasher.init(_seed:)(v4, 0);
  Hasher._combine(_:)(*(_QWORD *)v0);
  v1 = *(_OWORD *)(v0 + 56);
  v7 = *(_OWORD *)(v0 + 40);
  v8 = v1;
  v9 = *(_OWORD *)(v0 + 72);
  v10 = *(_QWORD *)(v0 + 88);
  v2 = *(_OWORD *)(v0 + 24);
  v5 = *(_OWORD *)(v0 + 8);
  v6 = v2;
  sub_100077204((_QWORD *)v0);
  CommandInfoV0.hash(into:)((uint64_t)v4);
  sub_1000772CC((_QWORD *)v0);
  return Hasher._finalize()();
}

double ToolInfoV0.init(from:)@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[6];

  sub_100091A84(a1, (uint64_t *)v8);
  if (!v2)
  {
    v5 = v8[3];
    a2[2] = v8[2];
    a2[3] = v5;
    v6 = v8[5];
    a2[4] = v8[4];
    a2[5] = v6;
    result = *(double *)v8;
    v7 = v8[1];
    *a2 = v8[0];
    a2[1] = v7;
  }
  return result;
}

uint64_t sub_10008D77C(_QWORD *a1)
{
  return ToolInfoV0.encode(to:)(a1);
}

Swift::Int sub_10008D790()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  Swift::UInt v2;
  Swift::UInt v3;
  Swift::UInt v4;
  Swift::UInt v5;
  Swift::UInt v6;
  Swift::UInt v7;
  Swift::UInt v8;
  Swift::UInt v9;
  Swift::UInt v11;
  Swift::UInt v12;
  Swift::UInt v13;
  _QWORD v14[21];

  v2 = *v0;
  v1 = v0[1];
  v4 = v0[2];
  v3 = v0[3];
  v5 = v0[5];
  v6 = v0[7];
  v12 = v0[6];
  v13 = v0[4];
  v7 = v0[9];
  v11 = v0[8];
  v8 = v0[10];
  v9 = v0[11];
  Hasher.init(_seed:)(v14, 0);
  Hasher._combine(_:)(v2);
  v14[9] = v1;
  v14[10] = v4;
  v14[11] = v3;
  v14[12] = v13;
  v14[13] = v5;
  v14[14] = v12;
  v14[15] = v6;
  v14[16] = v11;
  v14[17] = v7;
  v14[18] = v8;
  v14[19] = v9;
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v1);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  CommandInfoV0.hash(into:)((uint64_t)v14);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v1);
  return Hasher._finalize()();
}

uint64_t sub_10008D8B0(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  Swift::UInt v3;
  Swift::UInt v4;
  Swift::UInt v5;
  Swift::UInt v6;
  Swift::UInt v7;
  Swift::UInt v8;

  v2 = v1[1];
  v3 = v1[3];
  v4 = v1[5];
  v5 = v1[7];
  v6 = v1[9];
  v7 = v1[10];
  v8 = v1[11];
  Hasher._combine(_:)(*v1);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  CommandInfoV0.hash(into:)(a1);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  return swift_bridgeObjectRelease(v2);
}

Swift::Int sub_10008D9C4(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  Swift::UInt v3;
  Swift::UInt v4;
  Swift::UInt v5;
  Swift::UInt v6;
  Swift::UInt v7;
  Swift::UInt v8;
  Swift::UInt v9;
  Swift::UInt v10;
  Swift::UInt v12;
  Swift::UInt v13;
  Swift::UInt v14;
  _QWORD v15[21];

  v3 = *v1;
  v2 = v1[1];
  v5 = v1[2];
  v4 = v1[3];
  v6 = v1[5];
  v7 = v1[7];
  v13 = v1[6];
  v14 = v1[4];
  v8 = v1[9];
  v12 = v1[8];
  v9 = v1[10];
  v10 = v1[11];
  Hasher.init(_seed:)(v15, a1);
  Hasher._combine(_:)(v3);
  v15[9] = v2;
  v15[10] = v5;
  v15[11] = v4;
  v15[12] = v14;
  v15[13] = v6;
  v15[14] = v13;
  v15[15] = v7;
  v15[16] = v12;
  v15[17] = v8;
  v15[18] = v9;
  v15[19] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  CommandInfoV0.hash(into:)((uint64_t)v15);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v2);
  return Hasher._finalize()();
}

uint64_t sub_10008DAE0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  char v10;
  _OWORD v12[5];
  uint64_t v13;
  _OWORD v14[5];
  uint64_t v15;

  v2 = *a1;
  v3 = *(_OWORD *)(a1 + 7);
  v12[2] = *(_OWORD *)(a1 + 5);
  v12[3] = v3;
  v12[4] = *(_OWORD *)(a1 + 9);
  v13 = a1[11];
  v4 = *(_OWORD *)(a1 + 3);
  v12[0] = *(_OWORD *)(a1 + 1);
  v12[1] = v4;
  v5 = *a2;
  v6 = *(_OWORD *)(a2 + 3);
  v14[0] = *(_OWORD *)(a2 + 1);
  v14[1] = v6;
  v7 = *(_OWORD *)(a2 + 5);
  v8 = *(_OWORD *)(a2 + 7);
  v9 = *(_OWORD *)(a2 + 9);
  v15 = a2[11];
  v14[3] = v8;
  v14[4] = v9;
  v14[2] = v7;
  if (v2 == v5)
    v10 = _s22ArgumentParserToolInfo07CommandD2V0V23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v12, (uint64_t)v14);
  else
    v10 = 0;
  return v10 & 1;
}

uint64_t CommandInfoV0.superCommands.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease(*v1);
  *v1 = a1;
  return result;
}

uint64_t ArgumentInfoV0.sectionTitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 16));
  return v1;
}

uint64_t ArgumentInfoV0.sectionTitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v2 + 16));
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t CommandInfoV0.abstract.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 32));
  return v1;
}

uint64_t CommandInfoV0.abstract.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v2 + 32));
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

Swift::String_optional (__swiftcall *ArgumentInfoV0.isOptional.modify())(Swift::String argument)
{
  return String.init(argument:);
}

uint64_t CommandInfoV0.discussion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 48));
  return v1;
}

uint64_t CommandInfoV0.discussion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v2 + 48));
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  return result;
}

Swift::String_optional (__swiftcall *ArgumentInfoV0.preferredName.modify())(Swift::String argument)
{
  return String.init(argument:);
}

uint64_t CommandInfoV0.defaultSubcommand.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 64));
  return v1;
}

uint64_t CommandInfoV0.defaultSubcommand.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v2 + 64));
  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = a2;
  return result;
}

Swift::String_optional (__swiftcall *CommandInfoV0.defaultSubcommand.modify())(Swift::String argument)
{
  return String.init(argument:);
}

uint64_t CommandInfoV0.subcommands.getter()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(v0 + 72));
}

uint64_t CommandInfoV0.subcommands.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v1 + 72));
  *(_QWORD *)(v1 + 72) = a1;
  return result;
}

Swift::String_optional (__swiftcall *CommandInfoV0.subcommands.modify())(Swift::String argument)
{
  return String.init(argument:);
}

uint64_t CommandInfoV0.arguments.getter()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(v0 + 80));
}

uint64_t CommandInfoV0.arguments.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v1 + 80));
  *(_QWORD *)(v1 + 80) = a1;
  return result;
}

uint64_t CommandInfoV0.init(superCommands:commandName:abstract:discussion:defaultSubcommand:subcommands:arguments:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, unint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, unint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v17;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;

  v17 = a1;
  if (!*(_QWORD *)(a1 + 16))
  {
    swift_bridgeObjectRelease(a1);
    v17 = 0;
  }
  v19 = a10;
  if ((a5 & 0x2000000000000000) != 0)
    v20 = HIBYTE(a5) & 0xF;
  else
    v20 = a4 & 0xFFFFFFFFFFFFLL;
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(a3);
  if (!v20)
  {
    swift_bridgeObjectRelease(a5);
    a4 = 0;
    a5 = 0;
  }
  v21 = a11;
  if ((a7 & 0x2000000000000000) != 0)
    v22 = HIBYTE(a7) & 0xF;
  else
    v22 = a6 & 0xFFFFFFFFFFFFLL;
  swift_bridgeObjectRetain(a5);
  if (v22)
  {
    v23 = a12;
    if (!a10)
      goto LABEL_18;
  }
  else
  {
    swift_bridgeObjectRelease(a7);
    a6 = 0;
    a7 = 0;
    v23 = a12;
    if (!a10)
      goto LABEL_18;
  }
  v24 = HIBYTE(a10) & 0xF;
  if ((a10 & 0x2000000000000000) == 0)
    v24 = a8 & 0xFFFFFFFFFFFFLL;
  if (v24)
  {
LABEL_18:
    swift_bridgeObjectRetain(a7);
    if (*(_QWORD *)(a11 + 16))
      goto LABEL_19;
LABEL_22:
    swift_bridgeObjectRetain(v19);
    swift_bridgeObjectRelease(a11);
    v21 = 0;
    if (*(_QWORD *)(v23 + 16))
      goto LABEL_20;
LABEL_23:
    swift_bridgeObjectRetain(v21);
    swift_bridgeObjectRelease(v23);
    v23 = 0;
    goto LABEL_24;
  }
  swift_bridgeObjectRetain(a7);
  swift_bridgeObjectRelease(a10);
  a8 = 0;
  v19 = 0;
  if (!*(_QWORD *)(a11 + 16))
    goto LABEL_22;
LABEL_19:
  swift_bridgeObjectRetain(v19);
  if (!*(_QWORD *)(v23 + 16))
    goto LABEL_23;
LABEL_20:
  swift_bridgeObjectRetain(v21);
LABEL_24:
  swift_bridgeObjectRetain(v23);
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRelease(v23);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(a7);
  swift_bridgeObjectRelease(a5);
  swift_bridgeObjectRelease(a3);
  result = swift_bridgeObjectRelease_n(v17, 2);
  *a9 = v17;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  a9[8] = v19;
  a9[9] = v21;
  a9[10] = v23;
  return result;
}

void CommandInfoV0.hash(into:)(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  Swift::UInt v5;
  _QWORD *v6;
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
  Swift::UInt v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  Swift::UInt v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _OWORD v33[8];
  uint64_t v34;
  _OWORD v35[5];
  uint64_t v36;

  v2 = v1;
  v4 = *v1;
  if (*v1)
  {
    Hasher._combine(_:)(1u);
    v5 = *(_QWORD *)(v4 + 16);
    Hasher._combine(_:)(v5);
    if (v5)
    {
      swift_bridgeObjectRetain(v4);
      v6 = (_QWORD *)(v4 + 40);
      do
      {
        v7 = *(v6 - 1);
        v8 = *v6;
        swift_bridgeObjectRetain(*v6);
        String.hash(into:)(a1, v7, v8);
        swift_bridgeObjectRelease(v8);
        v6 += 2;
        --v5;
      }
      while (v5);
      swift_bridgeObjectRelease(v4);
    }
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  v9 = v2[1];
  v10 = v2[2];
  swift_bridgeObjectRetain(v10);
  String.hash(into:)(a1, v9, v10);
  swift_bridgeObjectRelease(v10);
  v11 = v2[4];
  if (v11)
  {
    v12 = v2[3];
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain(v11);
    String.hash(into:)(a1, v12, v11);
    swift_bridgeObjectRelease(v11);
    v13 = v2[6];
    if (v13)
      goto LABEL_9;
  }
  else
  {
    Hasher._combine(_:)(0);
    v13 = v2[6];
    if (v13)
    {
LABEL_9:
      v14 = v2[5];
      Hasher._combine(_:)(1u);
      swift_bridgeObjectRetain(v13);
      String.hash(into:)(a1, v14, v13);
      swift_bridgeObjectRelease(v13);
      v15 = v2[8];
      if (v15)
        goto LABEL_10;
      goto LABEL_22;
    }
  }
  Hasher._combine(_:)(0);
  v15 = v2[8];
  if (v15)
  {
LABEL_10:
    v16 = v2[7];
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain(v15);
    String.hash(into:)(a1, v16, v15);
    swift_bridgeObjectRelease(v15);
    v17 = v2[9];
    if (v17)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  Hasher._combine(_:)(0);
  v17 = v2[9];
  if (v17)
  {
LABEL_11:
    Hasher._combine(_:)(1u);
    v18 = *(_QWORD *)(v17 + 16);
    Hasher._combine(_:)(v18);
    if (v18)
    {
      swift_bridgeObjectRetain(v17);
      v19 = 32;
      do
      {
        v20 = *(_OWORD *)(v17 + v19 + 16);
        v35[0] = *(_OWORD *)(v17 + v19);
        v35[1] = v20;
        v21 = *(_OWORD *)(v17 + v19 + 32);
        v22 = *(_OWORD *)(v17 + v19 + 48);
        v23 = *(_OWORD *)(v17 + v19 + 64);
        v36 = *(_QWORD *)(v17 + v19 + 80);
        v35[3] = v22;
        v35[4] = v23;
        v35[2] = v21;
        sub_100091CCC((uint64_t *)v35);
        CommandInfoV0.hash(into:)(a1);
        sub_10004DC0C((uint64_t *)v35);
        v19 += 88;
        --v18;
      }
      while (v18);
      swift_bridgeObjectRelease(v17);
    }
    v24 = v2[10];
    if (v24)
      goto LABEL_16;
LABEL_24:
    Hasher._combine(_:)(0);
    return;
  }
LABEL_23:
  Hasher._combine(_:)(0);
  v24 = v2[10];
  if (!v24)
    goto LABEL_24;
LABEL_16:
  Hasher._combine(_:)(1u);
  v25 = *(_QWORD *)(v24 + 16);
  Hasher._combine(_:)(v25);
  if (v25)
  {
    swift_bridgeObjectRetain(v24);
    v26 = 32;
    do
    {
      v33[0] = *(_OWORD *)(v24 + v26);
      v27 = *(_OWORD *)(v24 + v26 + 16);
      v28 = *(_OWORD *)(v24 + v26 + 32);
      v29 = *(_OWORD *)(v24 + v26 + 64);
      v33[3] = *(_OWORD *)(v24 + v26 + 48);
      v33[4] = v29;
      v33[1] = v27;
      v33[2] = v28;
      v30 = *(_OWORD *)(v24 + v26 + 80);
      v31 = *(_OWORD *)(v24 + v26 + 96);
      v32 = *(_OWORD *)(v24 + v26 + 112);
      v34 = *(_QWORD *)(v24 + v26 + 128);
      v33[6] = v31;
      v33[7] = v32;
      v33[5] = v30;
      sub_100091D50(v33);
      ArgumentInfoV0.hash(into:)(a1);
      sub_100091DE0(v33);
      v26 += 136;
      --v25;
    }
    while (v25);
    swift_bridgeObjectRelease(v24);
  }
}

uint64_t sub_10008E2A4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10008E2E4 + 4 * byte_10009AF60[a1]))(0x6D6F437265707573, 0xED000073646E616DLL);
}

uint64_t sub_10008E2E4()
{
  return 0x4E646E616D6D6F63;
}

uint64_t sub_10008E304()
{
  return 0x7463617274736261;
}

uint64_t sub_10008E31C()
{
  return 0x6973737563736964;
}

unint64_t sub_10008E338()
{
  return 0xD000000000000011;
}

uint64_t sub_10008E354()
{
  return 0x616D6D6F63627573;
}

uint64_t sub_10008E374()
{
  return 0x746E656D75677261;
}

uint64_t sub_10008E390()
{
  unsigned __int8 *v0;

  return sub_10008E2A4(*v0);
}

uint64_t sub_10008E398@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100091EF8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10008E3BC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100091E70();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10008E3E4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100091E70();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t CommandInfoV0.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
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
  uint64_t v27;
  char v28;
  char v29[8];
  _BYTE v30[8];
  _BYTE v31[8];
  _BYTE v32[8];

  v3 = v1;
  v5 = sub_100005104(&qword_1000B9FB0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100006270(a1, v9);
  v11 = sub_100091E70();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for CommandInfoV0.CodingKeys, &type metadata for CommandInfoV0.CodingKeys, v11, v9, v10);
  sub_10002AACC((uint64_t)v3, (uint64_t)v32, &qword_1000B9FB8);
  sub_10002AACC((uint64_t)v32, (uint64_t)v29, &qword_1000B9FB8);
  v28 = 0;
  v12 = sub_100005104(&qword_1000B9FC0);
  v13 = sub_1000952B8(&qword_1000B9FC8, (uint64_t)&protocol witness table for String, (uint64_t)&protocol conformance descriptor for <A> [A]);
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v29, &v28, v5, v12, v13);
  if (!v2)
  {
    v14 = v3[1];
    v15 = v3[2];
    v29[0] = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v14, v15, v29, v5);
    v16 = v3[3];
    v17 = v3[4];
    v29[0] = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v16, v17, v29, v5);
    v18 = v3[5];
    v19 = v3[6];
    v29[0] = 3;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v18, v19, v29, v5);
    v20 = v3[7];
    v21 = v3[8];
    v29[0] = 4;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v20, v21, v29, v5);
    sub_10002AACC((uint64_t)(v3 + 9), (uint64_t)v31, &qword_1000B9FD0);
    sub_10002AACC((uint64_t)v31, (uint64_t)v29, &qword_1000B9FD0);
    v28 = 5;
    v22 = sub_100005104(&qword_1000B9FD8);
    v23 = sub_100080D6C(&qword_1000B9FE0, &qword_1000B9FD8, (void (*)(void))sub_100091954, (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v29, &v28, v5, v22, v23);
    sub_10002AACC((uint64_t)(v3 + 10), (uint64_t)v30, &qword_1000B9FE8);
    sub_10002AACC((uint64_t)v30, (uint64_t)v29, &qword_1000B9FE8);
    v28 = 6;
    v24 = sub_100005104(&qword_1000B9FF0);
    v25 = sub_100080D6C(&qword_1000B9FF8, &qword_1000B9FF0, (void (*)(void))sub_100091EB4, (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v29, &v28, v5, v24, v25);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

Swift::Int CommandInfoV0.hashValue.getter()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  CommandInfoV0.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

double CommandInfoV0.init(from:)@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  _OWORD v7[5];
  uint64_t v8;

  sub_100092240(a1, v7);
  if (!v2)
  {
    v5 = v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v7[4];
    *(_QWORD *)(a2 + 80) = v8;
    result = *(double *)v7;
    v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_10008E7A0(_QWORD *a1)
{
  return CommandInfoV0.encode(to:)(a1);
}

Swift::Int sub_10008E7EC(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  CommandInfoV0.hash(into:)((uint64_t)v2);
  return Hasher._finalize()();
}

uint64_t sub_10008E824(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[5];
  uint64_t v8;
  _OWORD v9[5];
  uint64_t v10;

  v2 = *(_OWORD *)(a1 + 48);
  v7[2] = *(_OWORD *)(a1 + 32);
  v7[3] = v2;
  v7[4] = *(_OWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 80);
  v3 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v3;
  v4 = *(_OWORD *)(a2 + 48);
  v9[2] = *(_OWORD *)(a2 + 32);
  v9[3] = v4;
  v9[4] = *(_OWORD *)(a2 + 64);
  v10 = *(_QWORD *)(a2 + 80);
  v5 = *(_OWORD *)(a2 + 16);
  v9[0] = *(_OWORD *)a2;
  v9[1] = v5;
  return _s22ArgumentParserToolInfo07CommandD2V0V23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v7, (uint64_t)v9) & 1;
}

ArgumentParserToolInfo::ArgumentInfoV0::NameInfoV0::KindV0_optional __swiftcall ArgumentInfoV0.NameInfoV0.KindV0.init(rawValue:)(Swift::String rawValue)
{
  Swift::OpaquePointer v1;

  v1._rawValue = &off_1000B4370;
  return (ArgumentParserToolInfo::ArgumentInfoV0::NameInfoV0::KindV0_optional)sub_100092C10(rawValue, v1);
}

uint64_t ArgumentInfoV0.NameInfoV0.KindV0.rawValue.getter(char a1)
{
  if (!a1)
    return 1735290732;
  if (a1 == 1)
    return 0x74726F6873;
  return 0xD000000000000012;
}

uint64_t sub_10008E8F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10008E904(*a1, *a2);
}

uint64_t sub_10008E904(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  int v3;
  unint64_t v4;
  unint64_t v5;
  int v6;
  unint64_t v7;
  char v8;

  v2 = 1735290732;
  v3 = a1;
  if (a1)
  {
    if (a1 == 1)
      v4 = 0x74726F6873;
    else
      v4 = 0xD000000000000012;
    if (v3 == 1)
      v5 = 0xE500000000000000;
    else
      v5 = 0x800000010009E170;
    v6 = a2;
    if (a2)
    {
LABEL_9:
      if (v6 == 1)
        v2 = 0x74726F6873;
      else
        v2 = 0xD000000000000012;
      if (v6 == 1)
        v7 = 0xE500000000000000;
      else
        v7 = 0x800000010009E170;
      if (v4 != v2)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v5 = 0xE400000000000000;
    v4 = 1735290732;
    v6 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE400000000000000;
  if (v4 != 1735290732)
  {
LABEL_21:
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, v2, v7, 0);
    goto LABEL_22;
  }
LABEL_19:
  if (v5 != v7)
    goto LABEL_21;
  v8 = 1;
  v7 = v5;
LABEL_22:
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v7);
  return v8 & 1;
}

uint64_t sub_10008EA04(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xEA00000000006C61;
  v3 = 0x6E6F697469736F70;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0x6E6F6974706FLL;
    else
      v5 = 1734437990;
    if (v4 == 1)
      v6 = 0xE600000000000000;
    else
      v6 = 0xE400000000000000;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0x6E6F697469736F70;
  v6 = 0xEA00000000006C61;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v3 = 0x6E6F6974706FLL;
    else
      v3 = 1734437990;
    if (v7 == 1)
      v2 = 0xE600000000000000;
    else
      v2 = 0xE400000000000000;
  }
LABEL_15:
  if (v5 == v3 && v6 == v2)
  {
    v8 = 1;
    v2 = v6;
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v6, v3, v2, 0);
  }
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v2);
  return v8 & 1;
}

unint64_t sub_10008EB04@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  Swift::OpaquePointer v3;
  unint64_t result;

  v3._rawValue = &off_1000B4370;
  result = sub_100092C10(*a1, v3);
  *a2 = result;
  return result;
}

void sub_10008EB38(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE400000000000000;
  v4 = 0xE500000000000000;
  v5 = 0x74726F6873;
  if (v2 != 1)
  {
    v5 = 0xD000000000000012;
    v4 = 0x800000010009E170;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 1735290732;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_10008EB90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1000951EC();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_10008EBEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1000951EC();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

Swift::Int sub_10008EC38()
{
  unsigned __int8 *v0;
  int v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v7[9];

  v1 = *v0;
  Hasher.init(_seed:)(v7, 0);
  v2 = 0xE500000000000000;
  v3 = 0x74726F6873;
  if (v1 != 1)
  {
    v3 = 0xD000000000000012;
    v2 = 0x800000010009E170;
  }
  if (v1)
    v4 = v3;
  else
    v4 = 1735290732;
  if (v1)
    v5 = v2;
  else
    v5 = 0xE400000000000000;
  String.hash(into:)(v7, v4, v5);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

uint64_t sub_10008ECD0(uint64_t a1)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = 0xE500000000000000;
  v3 = 0x74726F6873;
  if (*v1 != 1)
  {
    v3 = 0xD000000000000012;
    v2 = 0x800000010009E170;
  }
  if (*v1)
    v4 = v3;
  else
    v4 = 1735290732;
  if (*v1)
    v5 = v2;
  else
    v5 = 0xE400000000000000;
  String.hash(into:)(a1, v4, v5);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_10008ED44(uint64_t a1)
{
  unsigned __int8 *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD v8[9];

  v2 = *v1;
  Hasher.init(_seed:)(v8, a1);
  v3 = 0xE500000000000000;
  v4 = 0x74726F6873;
  if (v2 != 1)
  {
    v4 = 0xD000000000000012;
    v3 = 0x800000010009E170;
  }
  if (v2)
    v5 = v4;
  else
    v5 = 1735290732;
  if (v2)
    v6 = v3;
  else
    v6 = 0xE400000000000000;
  String.hash(into:)(v8, v5, v6);
  swift_bridgeObjectRelease(v6);
  return Hasher._finalize()();
}

uint64_t ArgumentInfoV0.kind.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t ArgumentInfoV0.NameInfoV0.name.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain(a3);
  return a2;
}

uint64_t ArgumentInfoV0.NameInfoV0.hash(into:)(uint64_t a1, unsigned __int8 a2, uint64_t a3, uint64_t a4)
{
  int v7;
  unint64_t v8;
  unint64_t v9;

  v7 = a2;
  if (a2)
  {
    if (a2 == 1)
      v8 = 0x74726F6873;
    else
      v8 = 0xD000000000000012;
    if (v7 == 1)
      v9 = 0xE500000000000000;
    else
      v9 = 0x800000010009E170;
  }
  else
  {
    v9 = 0xE400000000000000;
    v8 = 1735290732;
  }
  String.hash(into:)(a1, v8, v9);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRetain(a4);
  String.hash(into:)(a1, a3, a4);
  return swift_bridgeObjectRelease(a4);
}

uint64_t sub_10008EEBC()
{
  _BYTE *v0;

  if (*v0)
    return 1701667182;
  else
    return 1684957547;
}

uint64_t sub_10008EEE0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1000929D4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10008EF04(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10009294C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10008EF2C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10009294C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ArgumentInfoV0.NameInfoV0.encode(to:)(_QWORD *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;

  v18 = a4;
  v8 = sub_100005104(&qword_1000BA008);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v13 = a1[4];
  sub_100006270(a1, v12);
  v14 = sub_10009294C();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for ArgumentInfoV0.NameInfoV0.CodingKeys, &type metadata for ArgumentInfoV0.NameInfoV0.CodingKeys, v14, v12, v13);
  v21 = a2;
  v20 = 0;
  v15 = sub_100092990();
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v21, &v20, v8, &type metadata for ArgumentInfoV0.NameInfoV0.KindV0, v15);
  if (!v4)
  {
    v19 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(a3, v18, &v19, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

Swift::Int ArgumentInfoV0.NameInfoV0.hashValue.getter(char a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  _QWORD v9[9];

  Hasher.init(_seed:)(v9, 0);
  if (a1)
  {
    if (a1 == 1)
      v6 = 0x74726F6873;
    else
      v6 = 0xD000000000000012;
    if (a1 == 1)
      v7 = 0xE500000000000000;
    else
      v7 = 0x800000010009E170;
  }
  else
  {
    v7 = 0xE400000000000000;
    v6 = 1735290732;
  }
  String.hash(into:)(v9, v6, v7);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRetain(a3);
  String.hash(into:)(v9, a2, a3);
  swift_bridgeObjectRelease(a3);
  return Hasher._finalize()();
}

uint64_t ArgumentInfoV0.NameInfoV0.init(from:)(_QWORD *a1)
{
  return sub_100092AA4(a1);
}

uint64_t sub_10008F178@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_100092AA4(a1);
  if (!v2)
  {
    *(_BYTE *)a2 = result;
    *(_QWORD *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_10008F1A4(_QWORD *a1)
{
  uint64_t v1;

  return ArgumentInfoV0.NameInfoV0.encode(to:)(a1, *(_BYTE *)v1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16));
}

Swift::Int sub_10008F1C0()
{
  uint64_t v0;

  return ArgumentInfoV0.NameInfoV0.hashValue.getter(*(_BYTE *)v0, *(_QWORD *)(v0 + 8), *(_QWORD *)(v0 + 16));
}

uint64_t sub_10008F1CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = *(_QWORD *)(v1 + 8);
  v2 = *(_QWORD *)(v1 + 16);
  v4 = 0xE500000000000000;
  v5 = 0x74726F6873;
  if (*(_BYTE *)v1 != 1)
  {
    v5 = 0xD000000000000012;
    v4 = 0x800000010009E170;
  }
  if (*(_BYTE *)v1)
    v6 = v5;
  else
    v6 = 1735290732;
  if (*(_BYTE *)v1)
    v7 = v4;
  else
    v7 = 0xE400000000000000;
  String.hash(into:)(a1, v6, v7);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRetain(v2);
  String.hash(into:)(a1, v3, v2);
  return swift_bridgeObjectRelease(v2);
}

Swift::Int sub_10008F278(uint64_t a1)
{
  unsigned __int8 *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD v10[9];

  v2 = *v1;
  v4 = *((_QWORD *)v1 + 1);
  v3 = *((_QWORD *)v1 + 2);
  Hasher.init(_seed:)(v10, a1);
  v5 = 0xE500000000000000;
  v6 = 0x74726F6873;
  if (v2 != 1)
  {
    v6 = 0xD000000000000012;
    v5 = 0x800000010009E170;
  }
  if (v2)
    v7 = v6;
  else
    v7 = 1735290732;
  if (v2)
    v8 = v5;
  else
    v8 = 0xE400000000000000;
  String.hash(into:)(v10, v7, v8);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(v10, v4, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_10008F338(uint64_t a1, uint64_t a2)
{
  return _s22ArgumentParserToolInfo0aD2V0V04NamedE0V23__derived_struct_equalsySbAE_AEtFZ_0(*(_BYTE *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16));
}

ArgumentParserToolInfo::ArgumentInfoV0::KindV0_optional __swiftcall ArgumentInfoV0.KindV0.init(rawValue:)(Swift::String rawValue)
{
  Swift::OpaquePointer v1;

  v1._rawValue = &off_1000B43D8;
  return (ArgumentParserToolInfo::ArgumentInfoV0::KindV0_optional)sub_100092C10(rawValue, v1);
}

uint64_t ArgumentInfoV0.KindV0.rawValue.getter(char a1)
{
  if (!a1)
    return 0x6E6F697469736F70;
  if (a1 == 1)
    return 0x6E6F6974706FLL;
  return 1734437990;
}

uint64_t sub_10008F3BC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10008EA04(*a1, *a2);
}

unint64_t sub_10008F3C8@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  Swift::OpaquePointer v3;
  unint64_t result;

  v3._rawValue = &off_1000B43D8;
  result = sub_100092C10(*a1, v3);
  *a2 = result;
  return result;
}

void sub_10008F3FC(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xEA00000000006C61;
  v4 = 0xE600000000000000;
  v5 = 0x6E6F6974706FLL;
  if (v2 != 1)
  {
    v5 = 1734437990;
    v4 = 0xE400000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x6E6F697469736F70;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_10008F454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1000951A8();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_10008F4B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1000951A8();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

Swift::Int sub_10008F4FC()
{
  unsigned __int8 *v0;
  int v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v7[9];

  v1 = *v0;
  Hasher.init(_seed:)(v7, 0);
  v2 = 0xE600000000000000;
  v3 = 0x6E6F6974706FLL;
  if (v1 != 1)
  {
    v3 = 1734437990;
    v2 = 0xE400000000000000;
  }
  if (v1)
    v4 = v3;
  else
    v4 = 0x6E6F697469736F70;
  if (v1)
    v5 = v2;
  else
    v5 = 0xEA00000000006C61;
  String.hash(into:)(v7, v4, v5);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

uint64_t sub_10008F594(uint64_t a1)
{
  _BYTE *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = 0xE600000000000000;
  v3 = 0x6E6F6974706FLL;
  if (*v1 != 1)
  {
    v3 = 1734437990;
    v2 = 0xE400000000000000;
  }
  if (*v1)
    v4 = v3;
  else
    v4 = 0x6E6F697469736F70;
  if (*v1)
    v5 = v2;
  else
    v5 = 0xEA00000000006C61;
  String.hash(into:)(a1, v4, v5);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_10008F608(uint64_t a1)
{
  unsigned __int8 *v1;
  int v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD v8[9];

  v2 = *v1;
  Hasher.init(_seed:)(v8, a1);
  v3 = 0xE600000000000000;
  v4 = 0x6E6F6974706FLL;
  if (v2 != 1)
  {
    v4 = 1734437990;
    v3 = 0xE400000000000000;
  }
  if (v2)
    v5 = v4;
  else
    v5 = 0x6E6F697469736F70;
  if (v2)
    v6 = v3;
  else
    v6 = 0xEA00000000006C61;
  String.hash(into:)(v8, v5, v6);
  swift_bridgeObjectRelease(v6);
  return Hasher._finalize()();
}

uint64_t ArgumentInfoV0.kind.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t ArgumentInfoV0.shouldDisplay.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t ArgumentInfoV0.shouldDisplay.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = result;
  return result;
}

Swift::String_optional (__swiftcall *ArgumentInfoV0.shouldDisplay.modify())(Swift::String argument)
{
  return String.init(argument:);
}

uint64_t ArgumentInfoV0.isOptional.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t ArgumentInfoV0.isOptional.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 24) = result;
  return result;
}

uint64_t ArgumentInfoV0.isRepeating.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 25);
}

uint64_t ArgumentInfoV0.isRepeating.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 25) = result;
  return result;
}

Swift::String_optional (__swiftcall *ArgumentInfoV0.isRepeating.modify())(Swift::String argument)
{
  return String.init(argument:);
}

uint64_t ArgumentInfoV0.names.getter()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(v0 + 32));
}

uint64_t ArgumentInfoV0.names.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v1 + 32));
  *(_QWORD *)(v1 + 32) = a1;
  return result;
}

uint64_t variable initialization expression of ArgumentInfoV0.preferredName()
{
  return 0;
}

uint64_t ArgumentInfoV0.preferredName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 56));
  return v1;
}

uint64_t ArgumentInfoV0.preferredName.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t result;

  result = swift_bridgeObjectRelease(v3[7]);
  v3[5] = a1;
  v3[6] = a2;
  v3[7] = a3;
  return result;
}

uint64_t ArgumentInfoV0.allValues.getter()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(v0 + 96));
}

uint64_t ArgumentInfoV0.allValues.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v1 + 96));
  *(_QWORD *)(v1 + 96) = a1;
  return result;
}

uint64_t ArgumentInfoV0.abstract.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 104);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 112));
  return v1;
}

uint64_t ArgumentInfoV0.abstract.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v2 + 112));
  *(_QWORD *)(v2 + 104) = a1;
  *(_QWORD *)(v2 + 112) = a2;
  return result;
}

uint64_t ArgumentInfoV0.discussion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 120);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 128));
  return v1;
}

uint64_t ArgumentInfoV0.discussion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v2 + 128));
  *(_QWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 128) = a2;
  return result;
}

Swift::String_optional (__swiftcall *ArgumentInfoV0.discussion.modify())(Swift::String argument)
{
  return String.init(argument:);
}

__n128 ArgumentInfoV0.init(kind:shouldDisplay:sectionTitle:isOptional:isRepeating:names:preferredName:valueName:defaultValue:allValues:abstract:discussion:)@<Q0>(char a1@<W0>, char a2@<W1>, uint64_t a3@<X2>, unint64_t a4@<X3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t a13, uint64_t a14, unint64_t a15, uint64_t a16, uint64_t a17, unint64_t a18, uint64_t a19, unint64_t a20)
{
  uint64_t v20;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __n128 result;
  uint64_t v43;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __n128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  unint64_t v60;

  v20 = a7;
  v23 = a15;
  v25 = a12;
  v24 = a13;
  if (a7)
  {
    v26 = *(_QWORD *)(a7 + 16);
    swift_bridgeObjectRetain(a4);
    if (!v26)
    {
      swift_bridgeObjectRelease(v20);
      v20 = 0;
    }
  }
  else
  {
    swift_bridgeObjectRetain(a4);
  }
  v27 = a16;
  v28 = a14;
  if (!a13)
    goto LABEL_9;
  v29 = HIBYTE(a13) & 0xF;
  if ((a13 & 0x2000000000000000) == 0)
    v29 = a12 & 0xFFFFFFFFFFFFLL;
  if (!v29)
  {
    swift_bridgeObjectRetain(a11);
    swift_bridgeObjectRetain(v20);
    swift_bridgeObjectRelease(a13);
    v25 = 0;
    v24 = 0;
  }
  else
  {
LABEL_9:
    swift_bridgeObjectRetain(a11);
    swift_bridgeObjectRetain(v20);
  }
  v30 = a18;
  v51 = v25;
  if (a15)
  {
    v31 = a4;
    v32 = HIBYTE(a15) & 0xF;
    if ((a15 & 0x2000000000000000) == 0)
      v32 = a14 & 0xFFFFFFFFFFFFLL;
    if (!v32)
    {
      swift_bridgeObjectRetain(v24);
      swift_bridgeObjectRelease(a15);
      v28 = 0;
      v23 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    v31 = a4;
  }
  swift_bridgeObjectRetain(v24);
LABEL_18:
  v33 = a20;
  v50 = v28;
  if (a16)
  {
    v34 = *(_QWORD *)(a16 + 16);
    swift_bridgeObjectRetain(v23);
    if (!v34)
    {
      swift_bridgeObjectRelease(a16);
      v27 = 0;
    }
    v35 = a19;
    if (!a18)
      goto LABEL_27;
  }
  else
  {
    swift_bridgeObjectRetain(v23);
    v35 = a19;
    if (!a18)
      goto LABEL_27;
  }
  v36 = HIBYTE(a18) & 0xF;
  if ((a18 & 0x2000000000000000) == 0)
    v36 = a17 & 0xFFFFFFFFFFFFLL;
  if (!v36)
  {
    swift_bridgeObjectRetain(v27);
    swift_bridgeObjectRelease(a18);
    v43 = 0;
    v30 = 0;
    v37 = a10;
    if (!a20)
      goto LABEL_33;
    goto LABEL_30;
  }
LABEL_27:
  v43 = a17;
  swift_bridgeObjectRetain(v27);
  v37 = a10;
  if (!a20)
    goto LABEL_33;
LABEL_30:
  v38 = HIBYTE(a20) & 0xF;
  if ((a20 & 0x2000000000000000) == 0)
    v38 = v35 & 0xFFFFFFFFFFFFLL;
  if (!v38)
  {
    swift_bridgeObjectRetain(v30);
    swift_bridgeObjectRelease(a20);
    v35 = 0;
    v33 = 0;
    goto LABEL_35;
  }
LABEL_33:
  swift_bridgeObjectRetain(v30);
LABEL_35:
  LOBYTE(v52) = a1;
  BYTE1(v52) = a2 & 1;
  *((_QWORD *)&v52 + 1) = a3;
  v53.n128_u64[0] = v31;
  v53.n128_u8[8] = a5 & 1;
  v53.n128_u8[9] = a6 & 1;
  *(_QWORD *)&v54 = v20;
  *((_QWORD *)&v54 + 1) = a8;
  *(_QWORD *)&v55 = v37;
  *((_QWORD *)&v55 + 1) = a11;
  *(_QWORD *)&v56 = v51;
  *((_QWORD *)&v56 + 1) = v24;
  *(_QWORD *)&v57 = v50;
  *((_QWORD *)&v57 + 1) = v23;
  *(_QWORD *)&v58 = v27;
  *((_QWORD *)&v58 + 1) = v43;
  *(_QWORD *)&v59 = v30;
  *((_QWORD *)&v59 + 1) = v35;
  v60 = v33;
  sub_100091D50(&v52);
  swift_bridgeObjectRelease(v30);
  swift_bridgeObjectRelease(v27);
  swift_bridgeObjectRelease(v23);
  swift_bridgeObjectRelease(v24);
  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(a11);
  swift_bridgeObjectRelease(v31);
  sub_100091DE0(&v52);
  v39 = v59;
  *(_OWORD *)(a9 + 96) = v58;
  *(_OWORD *)(a9 + 112) = v39;
  *(_QWORD *)(a9 + 128) = v60;
  v40 = v55;
  *(_OWORD *)(a9 + 32) = v54;
  *(_OWORD *)(a9 + 48) = v40;
  v41 = v57;
  *(_OWORD *)(a9 + 64) = v56;
  *(_OWORD *)(a9 + 80) = v41;
  result = v53;
  *(_OWORD *)a9 = v52;
  *(__n128 *)(a9 + 16) = result;
  return result;
}

void ArgumentInfoV0.hash(into:)(uint64_t a1)
{
  _BYTE *v1;
  _BYTE *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  Swift::UInt v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v2 = v1;
  v3 = 0xE600000000000000;
  v4 = 0x6E6F6974706FLL;
  if (*v1 != 1)
  {
    v4 = 1734437990;
    v3 = 0xE400000000000000;
  }
  if (*v1)
    v5 = v4;
  else
    v5 = 0x6E6F697469736F70;
  if (*v1)
    v6 = v3;
  else
    v6 = 0xEA00000000006C61;
  String.hash(into:)(a1, v5, v6);
  swift_bridgeObjectRelease(v6);
  Hasher._combine(_:)(v2[1] & 1);
  v8 = *((_QWORD *)v2 + 2);
  if (v8)
  {
    v9 = *((_QWORD *)v2 + 1);
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain(v8);
    String.hash(into:)(a1, v9, v8);
    swift_bridgeObjectRelease(v8);
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  Hasher._combine(_:)(v2[24] & 1);
  Hasher._combine(_:)(v2[25] & 1);
  v10 = *((_QWORD *)v2 + 4);
  if (v10)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain(v10);
    sub_10009112C(a1, v10);
    swift_bridgeObjectRelease(v10);
    v11 = *((_QWORD *)v2 + 7);
    if (v11)
      goto LABEL_14;
LABEL_33:
    Hasher._combine(_:)(0);
    v18 = *((_QWORD *)v2 + 9);
    if (v18)
      goto LABEL_23;
    goto LABEL_34;
  }
  Hasher._combine(_:)(0);
  v11 = *((_QWORD *)v2 + 7);
  if (!v11)
    goto LABEL_33;
LABEL_14:
  v12 = *((_QWORD *)v2 + 6);
  v13 = v2[40];
  Hasher._combine(_:)(1u);
  v14 = 0xE500000000000000;
  v15 = 0x74726F6873;
  if (v13 != 1)
  {
    v15 = 0xD000000000000012;
    v14 = 0x800000010009E170;
  }
  if (v13)
    v16 = v15;
  else
    v16 = 1735290732;
  if (v13)
    v17 = v14;
  else
    v17 = 0xE400000000000000;
  swift_bridgeObjectRetain_n(v11, 2);
  String.hash(into:)(a1, v16, v17);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRetain(v11);
  String.hash(into:)(a1, v12, v11);
  swift_bridgeObjectRelease_n(v11, 3);
  v18 = *((_QWORD *)v2 + 9);
  if (v18)
  {
LABEL_23:
    v19 = *((_QWORD *)v2 + 8);
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain(v18);
    String.hash(into:)(a1, v19, v18);
    swift_bridgeObjectRelease(v18);
    v20 = *((_QWORD *)v2 + 11);
    if (v20)
      goto LABEL_24;
    goto LABEL_35;
  }
LABEL_34:
  Hasher._combine(_:)(0);
  v20 = *((_QWORD *)v2 + 11);
  if (v20)
  {
LABEL_24:
    v21 = *((_QWORD *)v2 + 10);
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain(v20);
    String.hash(into:)(a1, v21, v20);
    swift_bridgeObjectRelease(v20);
    v22 = *((_QWORD *)v2 + 12);
    if (v22)
      goto LABEL_25;
LABEL_36:
    Hasher._combine(_:)(0);
    v27 = *((_QWORD *)v2 + 14);
    if (v27)
      goto LABEL_30;
LABEL_37:
    Hasher._combine(_:)(0);
    v29 = *((_QWORD *)v2 + 16);
    if (v29)
      goto LABEL_31;
    goto LABEL_38;
  }
LABEL_35:
  Hasher._combine(_:)(0);
  v22 = *((_QWORD *)v2 + 12);
  if (!v22)
    goto LABEL_36;
LABEL_25:
  Hasher._combine(_:)(1u);
  v23 = *(_QWORD *)(v22 + 16);
  Hasher._combine(_:)(v23);
  if (v23)
  {
    swift_bridgeObjectRetain(v22);
    v24 = (_QWORD *)(v22 + 40);
    do
    {
      v25 = *(v24 - 1);
      v26 = *v24;
      swift_bridgeObjectRetain(*v24);
      String.hash(into:)(a1, v25, v26);
      swift_bridgeObjectRelease(v26);
      v24 += 2;
      --v23;
    }
    while (v23);
    swift_bridgeObjectRelease(v22);
  }
  v27 = *((_QWORD *)v2 + 14);
  if (!v27)
    goto LABEL_37;
LABEL_30:
  v28 = *((_QWORD *)v2 + 13);
  Hasher._combine(_:)(1u);
  swift_bridgeObjectRetain(v27);
  String.hash(into:)(a1, v28, v27);
  swift_bridgeObjectRelease(v27);
  v29 = *((_QWORD *)v2 + 16);
  if (v29)
  {
LABEL_31:
    v30 = *((_QWORD *)v2 + 15);
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain(v29);
    String.hash(into:)(a1, v30, v29);
    swift_bridgeObjectRelease(v29);
    return;
  }
LABEL_38:
  Hasher._combine(_:)(0);
}

uint64_t sub_10008FEF8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10008FF24 + 4 * byte_10009AF67[a1]))(1684957547, 0xE400000000000000);
}

uint64_t sub_10008FF24()
{
  return 0x6944646C756F6873;
}

uint64_t sub_10008FF48()
{
  return 0x546E6F6974636573;
}

uint64_t sub_10008FF68()
{
  return 0x6E6F6974704F7369;
}

uint64_t sub_10008FF84()
{
  return 0x7461657065527369;
}

uint64_t sub_10008FFA4()
{
  return 0x73656D616ELL;
}

uint64_t sub_10008FFB8()
{
  return 0x6572726566657270;
}

uint64_t sub_10008FFDC()
{
  return 0x6D614E65756C6176;
}

uint64_t sub_10008FFF8()
{
  return 0x56746C7561666564;
}

uint64_t sub_100090018()
{
  return 0x65756C61566C6C61;
}

uint64_t sub_100090038()
{
  return 0x7463617274736261;
}

uint64_t sub_100090050()
{
  return 0x6973737563736964;
}

uint64_t sub_100090074()
{
  unsigned __int8 *v0;

  return sub_10008FEF8(*v0);
}

uint64_t sub_10009007C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100092D20(a1, a2);
  *a3 = result;
  return result;
}

void sub_1000900A0(_BYTE *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_1000900AC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100092C54();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000900D4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100092C54();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ArgumentInfoV0.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
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
  _BYTE v33[31];
  char v34;
  _BYTE v35[8];
  _BYTE v36[24];
  _BYTE v37[8];

  v3 = v1;
  v5 = sub_100005104(&qword_1000BA018);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v33[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = a1[3];
  v10 = a1[4];
  sub_100006270(a1, v9);
  v11 = sub_100092C54();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for ArgumentInfoV0.CodingKeys, &type metadata for ArgumentInfoV0.CodingKeys, v11, v9, v10);
  v33[0] = *(_BYTE *)v3;
  v34 = 0;
  v12 = sub_100092C98();
  KeyedEncodingContainer.encode<A>(_:forKey:)(v33, &v34, v5, &type metadata for ArgumentInfoV0.KindV0, v12);
  if (!v2)
  {
    v13 = *(unsigned __int8 *)(v3 + 1);
    v33[0] = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v13, v33, v5);
    v14 = *(_QWORD *)(v3 + 8);
    v15 = *(_QWORD *)(v3 + 16);
    v33[0] = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v14, v15, v33, v5);
    v16 = *(unsigned __int8 *)(v3 + 24);
    v33[0] = 3;
    KeyedEncodingContainer.encode(_:forKey:)(v16, v33, v5);
    v17 = *(unsigned __int8 *)(v3 + 25);
    v33[0] = 4;
    KeyedEncodingContainer.encode(_:forKey:)(v17, v33, v5);
    sub_10002AACC(v3 + 32, (uint64_t)v37, &qword_1000BA028);
    sub_10002AACC((uint64_t)v37, (uint64_t)v33, &qword_1000BA028);
    v34 = 5;
    v18 = sub_100005104(&qword_1000BA030);
    v19 = sub_100080D6C(&qword_1000BA038, &qword_1000BA030, (void (*)(void))sub_100092CDC, (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v33, &v34, v5, v18, v19);
    sub_10002AACC(v3 + 40, (uint64_t)v36, &qword_1000BA048);
    sub_10002AACC((uint64_t)v36, (uint64_t)v33, &qword_1000BA048);
    v34 = 6;
    v20 = sub_100092CDC();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v33, &v34, v5, &type metadata for ArgumentInfoV0.NameInfoV0, v20);
    v21 = *(_QWORD *)(v3 + 64);
    v22 = *(_QWORD *)(v3 + 72);
    v33[0] = 7;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v21, v22, v33, v5);
    v23 = *(_QWORD *)(v3 + 80);
    v24 = *(_QWORD *)(v3 + 88);
    v33[0] = 8;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v23, v24, v33, v5);
    sub_10002AACC(v3 + 96, (uint64_t)v35, &qword_1000B9FB8);
    sub_10002AACC((uint64_t)v35, (uint64_t)v33, &qword_1000B9FB8);
    v34 = 9;
    v25 = sub_100005104(&qword_1000B9FC0);
    v26 = sub_1000952B8(&qword_1000B9FC8, (uint64_t)&protocol witness table for String, (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v33, &v34, v5, v25, v26);
    v27 = *(_QWORD *)(v3 + 104);
    v28 = *(_QWORD *)(v3 + 112);
    v33[0] = 10;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v27, v28, v33, v5);
    v29 = *(_QWORD *)(v3 + 120);
    v30 = *(_QWORD *)(v3 + 128);
    v33[0] = 11;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v29, v30, v33, v5);
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

Swift::Int ArgumentInfoV0.hashValue.getter()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  ArgumentInfoV0.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

__n128 ArgumentInfoV0.init(from:)@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[8];
  uint64_t v9;

  sub_100093288(a1, (uint64_t)v8);
  if (!v2)
  {
    v5 = v8[7];
    *(_OWORD *)(a2 + 96) = v8[6];
    *(_OWORD *)(a2 + 112) = v5;
    *(_QWORD *)(a2 + 128) = v9;
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

uint64_t sub_100090554(_QWORD *a1)
{
  return ArgumentInfoV0.encode(to:)(a1);
}

Swift::Int sub_1000905A8(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  ArgumentInfoV0.hash(into:)((uint64_t)v2);
  return Hasher._finalize()();
}

uint64_t sub_1000905E0(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v11[8];
  uint64_t v12;
  _OWORD v13[8];
  uint64_t v14;

  v2 = *(_OWORD *)(a1 + 112);
  v11[6] = *(_OWORD *)(a1 + 96);
  v11[7] = v2;
  v12 = *(_QWORD *)(a1 + 128);
  v3 = *(_OWORD *)(a1 + 48);
  v11[2] = *(_OWORD *)(a1 + 32);
  v11[3] = v3;
  v4 = *(_OWORD *)(a1 + 80);
  v11[4] = *(_OWORD *)(a1 + 64);
  v11[5] = v4;
  v5 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v5;
  v6 = *(_OWORD *)(a2 + 112);
  v13[6] = *(_OWORD *)(a2 + 96);
  v13[7] = v6;
  v14 = *(_QWORD *)(a2 + 128);
  v7 = *(_OWORD *)(a2 + 48);
  v13[2] = *(_OWORD *)(a2 + 32);
  v13[3] = v7;
  v8 = *(_OWORD *)(a2 + 80);
  v13[4] = *(_OWORD *)(a2 + 64);
  v13[5] = v8;
  v9 = *(_OWORD *)(a2 + 16);
  v13[0] = *(_OWORD *)a2;
  v13[1] = v9;
  return _s22ArgumentParserToolInfo0aD2V0V23__derived_struct_equalsySbAC_ACtFZ_0((unsigned __int8 *)v11, (uint64_t)v13) & 1;
}

uint64_t sub_100090660(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v3 = (uint64_t *)(a2 + 48);
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v7 = *(v4 - 1);
    v6 = *v4;
    v8 = *((unsigned __int8 *)v4 - 16);
    v9 = *((unsigned __int8 *)v3 - 16);
    v11 = *(v3 - 1);
    v10 = *v3;
    v3 += 3;
    v4 += 3;
    if (v8 == 1)
      v12 = 0x74726F6873;
    else
      v12 = 0xD000000000000012;
    v13 = 0x800000010009E170;
    if (v8 == 1)
      v13 = 0xE500000000000000;
    if (v8)
      v14 = v12;
    else
      v14 = 1735290732;
    if (v8)
      v15 = v13;
    else
      v15 = 0xE400000000000000;
    v16 = 0x800000010009E170;
    if (v9 == 1)
      v17 = 0x74726F6873;
    else
      v17 = 0xD000000000000012;
    if (v9 == 1)
      v16 = 0xE500000000000000;
    if (v9)
      v18 = v17;
    else
      v18 = 1735290732;
    if (v9)
      v19 = v16;
    else
      v19 = 0xE400000000000000;
    if (v14 == v18 && v15 == v19)
    {
      swift_bridgeObjectRetain(v6);
      swift_bridgeObjectRetain(v10);
      swift_bridgeObjectRelease_n(v15, 2);
      goto LABEL_33;
    }
    v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, v15, v18, v19, 0);
    swift_bridgeObjectRetain(v6);
    swift_bridgeObjectRetain(v10);
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v19);
    if ((v20 & 1) == 0)
      break;
LABEL_33:
    if (v7 == v11 && v6 == v10)
    {
      swift_bridgeObjectRelease_n(v6, 2);
    }
    else
    {
      v5 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v6, v11, v10, 0);
      swift_bridgeObjectRelease(v6);
      swift_bridgeObjectRelease(v10);
      if ((v5 & 1) == 0)
        return 0;
    }
    if (!--v2)
      return 1;
  }
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v10);
  return 0;
}

uint64_t sub_100090860(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  _QWORD *v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  _OWORD v83[8];
  uint64_t v84;
  _OWORD v85[8];
  uint64_t v86;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v3 = 0;
  v4 = a1 + 32;
  v5 = a2 + 32;
  v64 = a1 + 32;
  v65 = *(_QWORD *)(a1 + 16);
  v63 = a2 + 32;
  while (1)
  {
    v68 = v3;
    v6 = 88 * v3;
    v7 = *(_QWORD **)(v4 + 88 * v3);
    v8 = *(_QWORD *)(v4 + 88 * v3 + 8);
    v9 = *(_QWORD *)(v4 + 88 * v3 + 24);
    v81 = *(_QWORD *)(v4 + 88 * v3 + 16);
    v10 = *(_QWORD *)(v4 + 88 * v3 + 40);
    v76 = *(_QWORD *)(v4 + v6 + 32);
    v12 = *(_QWORD *)(v4 + v6 + 48);
    v11 = *(_QWORD *)(v4 + v6 + 56);
    v13 = *(_QWORD *)(v4 + v6 + 64);
    v14 = *(_QWORD **)(v4 + v6 + 72);
    v73 = *(_QWORD **)(v4 + v6 + 80);
    v15 = (_QWORD *)(v5 + v6);
    v16 = (_QWORD *)*v15;
    v17 = v15[3];
    v82 = v15[2];
    v78 = v15[4];
    v79 = (_QWORD *)*v15;
    v66 = v11;
    v67 = v15[5];
    v77 = v15[6];
    v69 = v15[7];
    v71 = v15[8];
    v72 = (_QWORD *)v15[9];
    v70 = (_QWORD *)v15[10];
    v80 = v7;
    v74 = v15[1];
    if (!v7)
    {
      if (v16)
        return 0;
      goto LABEL_28;
    }
    if (!v16)
      return 0;
    v18 = v7[2];
    if (v18 != v16[2])
      return 0;
    if (v18 && v7 != v16)
    {
      result = v7[4];
      v21 = v7[5];
      v22 = v79[4];
      v23 = v79[5];
      if (result != v22 || v21 != v23)
      {
        result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v21, v22, v23, 0);
        if ((result & 1) == 0)
          return 0;
      }
      v25 = v18 - 1;
      if (v18 != 1)
        break;
    }
LABEL_28:
    if ((v8 != v74 || v81 != v82) && (_stringCompareWithSmolCheck(_:_:expecting:)(v8, v81, v74, v82, 0) & 1) == 0)
      return 0;
    v75 = v12;
    v32 = v76;
    if (v76)
    {
      v34 = v77;
      v33 = v78;
      if (!v78
        || (v9 != v17 || v76 != v78) && (_stringCompareWithSmolCheck(_:_:expecting:)(v9, v76, v17, v78, 0) & 1) == 0)
      {
        return 0;
      }
    }
    else
    {
      v34 = v77;
      v33 = v78;
      if (v78)
        return 0;
    }
    v35 = v75;
    if (v75)
    {
      v36 = v73;
      if (!v34)
        return 0;
      v37 = v14;
      v38 = v13;
      if ((v10 != v67 || v75 != v34) && (_stringCompareWithSmolCheck(_:_:expecting:)(v10, v75, v67, v34, 0) & 1) == 0)
        return 0;
    }
    else
    {
      v37 = v14;
      v38 = v13;
      v36 = v73;
      if (v34)
        return 0;
    }
    if (v38)
    {
      v40 = v71;
      v39 = v72;
      v41 = v70;
      if (!v71
        || (v66 != v69 || v38 != v71) && (_stringCompareWithSmolCheck(_:_:expecting:)(v66, v38, v69, v71, 0) & 1) == 0)
      {
        return 0;
      }
    }
    else
    {
      v40 = v71;
      v39 = v72;
      v41 = v70;
      if (v71)
        return 0;
    }
    if (v37)
    {
      if (!v39)
        return 0;
      swift_bridgeObjectRetain(v41);
      swift_bridgeObjectRetain_n(v39, 2);
      swift_bridgeObjectRetain_n(v37, 2);
      swift_bridgeObjectRetain(v80);
      swift_bridgeObjectRetain(v81);
      swift_bridgeObjectRetain(v76);
      swift_bridgeObjectRetain(v75);
      swift_bridgeObjectRetain(v38);
      swift_bridgeObjectRetain(v36);
      swift_bridgeObjectRetain(v79);
      swift_bridgeObjectRetain(v82);
      swift_bridgeObjectRetain(v33);
      swift_bridgeObjectRetain(v34);
      swift_bridgeObjectRetain(v40);
      v42 = sub_100090860(v37, v39);
      swift_bridgeObjectRelease(v37);
      swift_bridgeObjectRelease(v39);
      if ((v42 & 1) == 0)
      {
        swift_bridgeObjectRelease(v36);
        swift_bridgeObjectRelease(v37);
        swift_bridgeObjectRelease(v38);
        swift_bridgeObjectRelease(v75);
        swift_bridgeObjectRelease(v76);
        swift_bridgeObjectRelease(v81);
        swift_bridgeObjectRelease(v80);
        swift_bridgeObjectRelease(v41);
        swift_bridgeObjectRelease(v39);
        swift_bridgeObjectRelease(v40);
        swift_bridgeObjectRelease(v34);
        swift_bridgeObjectRelease(v78);
        swift_bridgeObjectRelease(v82);
        v61 = v79;
LABEL_82:
        swift_bridgeObjectRelease(v61);
        return 0;
      }
      if (!v36)
        goto LABEL_66;
    }
    else
    {
      if (v39)
        return 0;
      swift_bridgeObjectRetain(v41);
      swift_bridgeObjectRetain(v80);
      swift_bridgeObjectRetain(v81);
      swift_bridgeObjectRetain(v76);
      swift_bridgeObjectRetain(v75);
      swift_bridgeObjectRetain(v38);
      swift_bridgeObjectRetain(v36);
      swift_bridgeObjectRetain(v79);
      swift_bridgeObjectRetain(v82);
      swift_bridgeObjectRetain(v33);
      swift_bridgeObjectRetain(v34);
      swift_bridgeObjectRetain(v40);
      if (!v36)
      {
LABEL_66:
        v43 = v78;
        if (!v41)
        {
          swift_bridgeObjectRelease(v81);
          swift_bridgeObjectRelease_n(0, 2);
          swift_bridgeObjectRelease(v82);
          goto LABEL_71;
        }
        swift_bridgeObjectRelease(0);
        swift_bridgeObjectRelease(v81);
        swift_bridgeObjectRelease(v82);
        swift_bridgeObjectRelease(v79);
        swift_bridgeObjectRelease(v78);
        swift_bridgeObjectRelease(v34);
        swift_bridgeObjectRelease(v40);
        swift_bridgeObjectRelease(v39);
        v62 = v41;
LABEL_80:
        swift_bridgeObjectRelease(v62);
        swift_bridgeObjectRelease(v80);
        swift_bridgeObjectRelease(v76);
        v60 = v75;
LABEL_81:
        swift_bridgeObjectRelease(v60);
        swift_bridgeObjectRelease(v38);
        v61 = v37;
        goto LABEL_82;
      }
    }
    v43 = v78;
    if (!v41)
    {
      swift_bridgeObjectRelease(v81);
      swift_bridgeObjectRelease(0);
      swift_bridgeObjectRelease(v82);
      swift_bridgeObjectRelease(v79);
      swift_bridgeObjectRelease(v78);
      swift_bridgeObjectRelease(v34);
      swift_bridgeObjectRelease(v40);
      swift_bridgeObjectRelease(v39);
      swift_bridgeObjectRelease(v80);
      swift_bridgeObjectRelease(v76);
      swift_bridgeObjectRelease(v75);
      swift_bridgeObjectRelease(v38);
      swift_bridgeObjectRelease(v37);
      v61 = v36;
      goto LABEL_82;
    }
    v44 = v36[2];
    if (v44 != v41[2])
    {
      swift_bridgeObjectRelease(v36);
      swift_bridgeObjectRelease(v81);
      swift_bridgeObjectRelease(v41);
      swift_bridgeObjectRelease(v82);
      swift_bridgeObjectRelease(v79);
      swift_bridgeObjectRelease(v78);
      swift_bridgeObjectRelease(v77);
      swift_bridgeObjectRelease(v40);
      v62 = v39;
      goto LABEL_80;
    }
    if (v44)
    {
      if (v36 != v41)
      {
        swift_bridgeObjectRetain(v41);
        swift_bridgeObjectRetain(v36);
        v45 = 4;
        while (1)
        {
          v83[0] = *(_OWORD *)&v36[v45];
          v46 = *(_OWORD *)&v36[v45 + 2];
          v47 = *(_OWORD *)&v36[v45 + 4];
          v48 = *(_OWORD *)&v36[v45 + 8];
          v83[3] = *(_OWORD *)&v36[v45 + 6];
          v83[4] = v48;
          v83[1] = v46;
          v83[2] = v47;
          v49 = *(_OWORD *)&v36[v45 + 10];
          v50 = *(_OWORD *)&v36[v45 + 12];
          v51 = *(_OWORD *)&v36[v45 + 14];
          v84 = v36[v45 + 16];
          v83[6] = v50;
          v83[7] = v51;
          v83[5] = v49;
          v85[0] = *(_OWORD *)&v41[v45];
          v52 = *(_OWORD *)&v41[v45 + 2];
          v53 = *(_OWORD *)&v41[v45 + 4];
          v54 = *(_OWORD *)&v41[v45 + 8];
          v85[3] = *(_OWORD *)&v41[v45 + 6];
          v85[4] = v54;
          v85[1] = v52;
          v85[2] = v53;
          v55 = *(_OWORD *)&v41[v45 + 10];
          v56 = *(_OWORD *)&v41[v45 + 12];
          v57 = *(_OWORD *)&v41[v45 + 14];
          v86 = v41[v45 + 16];
          v85[6] = v56;
          v85[7] = v57;
          v85[5] = v55;
          sub_100091D50(v83);
          sub_100091D50(v85);
          v58 = _s22ArgumentParserToolInfo0aD2V0V23__derived_struct_equalsySbAC_ACtFZ_0((unsigned __int8 *)v83, (uint64_t)v85);
          sub_100091DE0(v85);
          sub_100091DE0(v83);
          if ((v58 & 1) == 0)
            break;
          v45 += 17;
          if (!--v44)
          {
            swift_bridgeObjectRelease(v81);
            swift_bridgeObjectRelease(v82);
            swift_bridgeObjectRelease_n(v36, 2);
            swift_bridgeObjectRelease_n(v41, 2);
            v32 = v76;
            v34 = v77;
            v43 = v78;
            v59 = v68;
            v35 = v75;
            goto LABEL_72;
          }
        }
        swift_bridgeObjectRelease(v81);
        swift_bridgeObjectRelease(v82);
        swift_bridgeObjectRelease_n(v36, 2);
        swift_bridgeObjectRelease_n(v41, 2);
        swift_bridgeObjectRelease(v79);
        swift_bridgeObjectRelease(v78);
        swift_bridgeObjectRelease(v77);
        swift_bridgeObjectRelease(v40);
        swift_bridgeObjectRelease(v39);
        swift_bridgeObjectRelease(v80);
        swift_bridgeObjectRelease(v76);
        v60 = v75;
        goto LABEL_81;
      }
      swift_bridgeObjectRelease(v81);
      swift_bridgeObjectRelease_n(v36, 2);
    }
    else
    {
      swift_bridgeObjectRelease(v36);
      swift_bridgeObjectRelease(v81);
      swift_bridgeObjectRelease(v41);
    }
    swift_bridgeObjectRelease(v82);
    v34 = v77;
LABEL_71:
    v59 = v68;
LABEL_72:
    v3 = v59 + 1;
    swift_bridgeObjectRelease(v79);
    swift_bridgeObjectRelease(v43);
    swift_bridgeObjectRelease(v34);
    swift_bridgeObjectRelease(v40);
    swift_bridgeObjectRelease(v39);
    swift_bridgeObjectRelease(v80);
    swift_bridgeObjectRelease(v32);
    swift_bridgeObjectRelease(v35);
    swift_bridgeObjectRelease(v38);
    swift_bridgeObjectRelease(v37);
    result = 1;
    v4 = v64;
    v5 = v63;
    if (v3 == v65)
      return result;
  }
  v26 = v79 + 7;
  v27 = v80 + 7;
  while (v25)
  {
    result = *(v27 - 1);
    v28 = *v27;
    v29 = *(v26 - 1);
    v30 = *v26;
    if (result != v29 || v28 != v30)
    {
      result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v28, v29, v30, 0);
      if ((result & 1) == 0)
        return 0;
    }
    v26 += 2;
    v27 += 2;
    if (!--v25)
      goto LABEL_28;
  }
  __break(1u);
  return result;
}

uint64_t sub_100091028(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  BOOL v16;
  _OWORD v18[8];
  uint64_t v19;
  _OWORD v20[8];
  uint64_t v21;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      v14 = 1;
    }
    else
    {
      v3 = a1 + 32;
      v4 = a2 + 32;
      v5 = v2 - 1;
      do
      {
        v6 = *(_OWORD *)(v3 + 112);
        v18[6] = *(_OWORD *)(v3 + 96);
        v18[7] = v6;
        v19 = *(_QWORD *)(v3 + 128);
        v7 = *(_OWORD *)(v3 + 48);
        v18[2] = *(_OWORD *)(v3 + 32);
        v18[3] = v7;
        v8 = *(_OWORD *)(v3 + 80);
        v18[4] = *(_OWORD *)(v3 + 64);
        v18[5] = v8;
        v9 = *(_OWORD *)(v3 + 16);
        v18[0] = *(_OWORD *)v3;
        v18[1] = v9;
        v10 = *(_OWORD *)(v4 + 112);
        v20[6] = *(_OWORD *)(v4 + 96);
        v20[7] = v10;
        v21 = *(_QWORD *)(v4 + 128);
        v11 = *(_OWORD *)(v4 + 48);
        v20[2] = *(_OWORD *)(v4 + 32);
        v20[3] = v11;
        v12 = *(_OWORD *)(v4 + 80);
        v20[4] = *(_OWORD *)(v4 + 64);
        v20[5] = v12;
        v13 = *(_OWORD *)(v4 + 16);
        v20[0] = *(_OWORD *)v4;
        v20[1] = v13;
        sub_100091D50(v18);
        sub_100091D50(v20);
        v14 = _s22ArgumentParserToolInfo0aD2V0V23__derived_struct_equalsySbAC_ACtFZ_0((unsigned __int8 *)v18, (uint64_t)v20);
        sub_100091DE0(v20);
        sub_100091DE0(v18);
        v16 = v5-- != 0;
        if ((v14 & 1) == 0)
          break;
        v3 += 136;
        v4 += 136;
      }
      while (v16);
    }
  }
  else
  {
    v14 = 0;
  }
  return v14 & 1;
}

void sub_10009112C(uint64_t a1, uint64_t a2)
{
  Swift::UInt v4;
  uint64_t *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v4 = *(_QWORD *)(a2 + 16);
  Hasher._combine(_:)(v4);
  if (v4)
  {
    v5 = (uint64_t *)(a2 + 48);
    do
    {
      v6 = *((unsigned __int8 *)v5 - 16);
      v8 = *(v5 - 1);
      v7 = *v5;
      v5 += 3;
      if (v6 == 1)
        v9 = 0x74726F6873;
      else
        v9 = 0xD000000000000012;
      v10 = 0xE500000000000000;
      if (v6 != 1)
        v10 = 0x800000010009E170;
      if (v6)
        v11 = v9;
      else
        v11 = 1735290732;
      if (v6)
        v12 = v10;
      else
        v12 = 0xE400000000000000;
      swift_bridgeObjectRetain(v7);
      String.hash(into:)(a1, v11, v12);
      swift_bridgeObjectRelease(v12);
      swift_bridgeObjectRetain(v7);
      String.hash(into:)(a1, v8, v7);
      swift_bridgeObjectRelease_n(v7, 2);
      --v4;
    }
    while (v4);
  }
}

uint64_t sub_100091224(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0xD000000000000014 && a2 == 0x800000010009E1A0)
  {
    swift_bridgeObjectRelease(0x800000010009E1A0);
    v3 = 0;
  }
  else
  {
    v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014, 0x800000010009E1A0, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    v3 = v4 ^ 1;
  }
  return v3 & 1;
}

uint64_t _s22ArgumentParserToolInfo0aD2V0V23__derived_struct_equalsySbAC_ACtFZ_0(unsigned __int8 *a1, uint64_t a2)
{
  int v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int v27;
  unint64_t v28;
  unint64_t v29;
  int v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v3 = *a1;
  v4 = 0xE600000000000000;
  v5 = 0x6E6F6974706FLL;
  if (v3 != 1)
  {
    v5 = 1734437990;
    v4 = 0xE400000000000000;
  }
  if (*a1)
    v6 = v5;
  else
    v6 = 0x6E6F697469736F70;
  if (v3)
    v7 = v4;
  else
    v7 = 0xEA00000000006C61;
  v9 = 0xE600000000000000;
  v10 = 0x6E6F6974706FLL;
  if (*(_BYTE *)a2 != 1)
  {
    v10 = 1734437990;
    v9 = 0xE400000000000000;
  }
  if (*(_BYTE *)a2)
    v11 = v10;
  else
    v11 = 0x6E6F697469736F70;
  if (*(_BYTE *)a2)
    v12 = v9;
  else
    v12 = 0xEA00000000006C61;
  if (v6 == v11 && v7 == v12)
  {
    swift_bridgeObjectRelease_n(v7, 2);
  }
  else
  {
    v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v6, v7, v11, v12, 0);
    swift_bridgeObjectRelease(v7);
    swift_bridgeObjectRelease(v12);
    result = 0;
    if ((v13 & 1) == 0)
      return result;
  }
  if (((a1[1] ^ *(unsigned __int8 *)(a2 + 1)) & 1) != 0)
    return 0;
  v15 = *((_QWORD *)a1 + 2);
  v16 = *(_QWORD *)(a2 + 16);
  if (v15)
  {
    if (!v16)
      return 0;
    v17 = *((_QWORD *)a1 + 1);
    v18 = *(_QWORD *)(a2 + 8);
    if (v17 != v18 || v15 != v16)
    {
      v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v17, v15, v18, v16, 0);
      result = 0;
      if ((v19 & 1) == 0)
        return result;
    }
  }
  else if (v16)
  {
    return 0;
  }
  if (((a1[24] ^ *(unsigned __int8 *)(a2 + 24)) & 1) != 0 || ((a1[25] ^ *(unsigned __int8 *)(a2 + 25)) & 1) != 0)
    return 0;
  v20 = *((_QWORD *)a1 + 4);
  v21 = *(_QWORD *)(a2 + 32);
  if (v20)
  {
    if (!v21)
      return 0;
    swift_bridgeObjectRetain(*(_QWORD *)(a2 + 32));
    v22 = swift_bridgeObjectRetain(v20);
    v23 = sub_100090660(v22, v21);
    swift_bridgeObjectRelease(v20);
    swift_bridgeObjectRelease(v21);
    if ((v23 & 1) == 0)
      return 0;
  }
  else if (v21)
  {
    return 0;
  }
  v24 = *((_QWORD *)a1 + 7);
  v25 = *(_QWORD *)(a2 + 56);
  if (v24)
  {
    if (!v25)
      return 0;
    v26 = 1735290732;
    v27 = *((_QWORD *)a1 + 5);
    if (*((_QWORD *)a1 + 5))
    {
      if (v27 == 1)
        v28 = 0x74726F6873;
      else
        v28 = 0xD000000000000012;
      if (v27 == 1)
        v29 = 0xE500000000000000;
      else
        v29 = 0x800000010009E170;
    }
    else
    {
      v29 = 0xE400000000000000;
      v28 = 1735290732;
    }
    v30 = *(_QWORD *)(a2 + 40);
    if (*(_QWORD *)(a2 + 40))
    {
      if (v30 == 1)
        v26 = 0x74726F6873;
      else
        v26 = 0xD000000000000012;
      if (v30 == 1)
        v31 = 0xE500000000000000;
      else
        v31 = 0x800000010009E170;
    }
    else
    {
      v31 = 0xE400000000000000;
    }
    v32 = *((_QWORD *)a1 + 6);
    v33 = *(_QWORD *)(a2 + 48);
    if (v28 == v26 && v29 == v31)
    {
      swift_bridgeObjectRetain(*(_QWORD *)(a2 + 56));
      swift_bridgeObjectRetain(v24);
      swift_bridgeObjectRelease_n(v29, 2);
    }
    else
    {
      v34 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v29, v26, v31, 0);
      swift_bridgeObjectRetain(v25);
      swift_bridgeObjectRetain(v24);
      swift_bridgeObjectRelease(v29);
      swift_bridgeObjectRelease(v31);
      if ((v34 & 1) == 0)
      {
        swift_bridgeObjectRelease(v24);
        swift_bridgeObjectRelease(v25);
        return 0;
      }
    }
    if (v32 == v33 && v24 == v25)
    {
      swift_bridgeObjectRelease(v24);
      swift_bridgeObjectRelease(v25);
    }
    else
    {
      v35 = _stringCompareWithSmolCheck(_:_:expecting:)(v32, v24, v33, v25, 0);
      swift_bridgeObjectRelease(v24);
      swift_bridgeObjectRelease(v25);
      result = 0;
      if ((v35 & 1) == 0)
        return result;
    }
  }
  else if (v25)
  {
    return 0;
  }
  v36 = *((_QWORD *)a1 + 9);
  v37 = *(_QWORD *)(a2 + 72);
  if (v36)
  {
    if (!v37)
      return 0;
    v38 = *((_QWORD *)a1 + 8);
    v39 = *(_QWORD *)(a2 + 64);
    if (v38 != v39 || v36 != v37)
    {
      v40 = _stringCompareWithSmolCheck(_:_:expecting:)(v38, v36, v39, v37, 0);
      result = 0;
      if ((v40 & 1) == 0)
        return result;
    }
  }
  else if (v37)
  {
    return 0;
  }
  v41 = *((_QWORD *)a1 + 11);
  v42 = *(_QWORD *)(a2 + 88);
  if (v41)
  {
    if (!v42)
      return 0;
    v43 = *((_QWORD *)a1 + 10);
    v44 = *(_QWORD *)(a2 + 80);
    if (v43 != v44 || v41 != v42)
    {
      v45 = _stringCompareWithSmolCheck(_:_:expecting:)(v43, v41, v44, v42, 0);
      result = 0;
      if ((v45 & 1) == 0)
        return result;
    }
  }
  else if (v42)
  {
    return 0;
  }
  v46 = (_QWORD *)*((_QWORD *)a1 + 12);
  v47 = *(_QWORD **)(a2 + 96);
  if (v46)
  {
    if (!v47 || (sub_100057670(v46, v47) & 1) == 0)
      return 0;
  }
  else if (v47)
  {
    return 0;
  }
  v48 = *((_QWORD *)a1 + 14);
  v49 = *(_QWORD *)(a2 + 112);
  if (!v48)
  {
    if (v49)
      return 0;
LABEL_93:
    v53 = *((_QWORD *)a1 + 16);
    v54 = *(_QWORD *)(a2 + 128);
    if (v53)
    {
      if (v54)
      {
        v55 = *((_QWORD *)a1 + 15);
        v56 = *(_QWORD *)(a2 + 120);
        if (v55 == v56 && v53 == v54)
          return 1;
        if ((_stringCompareWithSmolCheck(_:_:expecting:)(v55, v53, v56, v54, 0) & 1) != 0)
          return 1;
      }
    }
    else if (!v54)
    {
      return 1;
    }
    return 0;
  }
  if (!v49)
    return 0;
  v50 = *((_QWORD *)a1 + 13);
  v51 = *(_QWORD *)(a2 + 104);
  if (v50 == v51 && v48 == v49)
    goto LABEL_93;
  v52 = _stringCompareWithSmolCheck(_:_:expecting:)(v50, v48, v51, v49, 0);
  result = 0;
  if ((v52 & 1) != 0)
    goto LABEL_93;
  return result;
}

uint64_t _s22ArgumentParserToolInfo07CommandD2V0V23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  char v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;

  v4 = *(_QWORD **)a1;
  v5 = *(_QWORD **)a2;
  if (v4)
  {
    if (!v5 || (sub_100057670(v4, v5) & 1) == 0)
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a2 + 8);
  v9 = *(_QWORD *)(a2 + 16);
  v10 = v6 == v8 && v7 == v9;
  if (v10 || (v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v6, v7, v8, v9, 0), result = 0, (v11 & 1) != 0))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(a2 + 32);
    if (v13)
    {
      if (!v14)
        return 0;
      v15 = *(_QWORD *)(a1 + 24);
      v16 = *(_QWORD *)(a2 + 24);
      if (v15 != v16 || v13 != v14)
      {
        v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v13, v16, v14, 0);
        result = 0;
        if ((v17 & 1) == 0)
          return result;
      }
    }
    else if (v14)
    {
      return 0;
    }
    v18 = *(_QWORD *)(a1 + 48);
    v19 = *(_QWORD *)(a2 + 48);
    if (v18)
    {
      if (!v19)
        return 0;
      v20 = *(_QWORD *)(a1 + 40);
      v21 = *(_QWORD *)(a2 + 40);
      if (v20 != v21 || v18 != v19)
      {
        v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v20, v18, v21, v19, 0);
        result = 0;
        if ((v22 & 1) == 0)
          return result;
      }
    }
    else if (v19)
    {
      return 0;
    }
    v23 = *(_QWORD *)(a1 + 64);
    v24 = *(_QWORD *)(a2 + 64);
    if (v23)
    {
      if (!v24)
        return 0;
      v25 = *(_QWORD *)(a1 + 56);
      v26 = *(_QWORD *)(a2 + 56);
      if (v25 != v26 || v23 != v24)
      {
        v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v25, v23, v26, v24, 0);
        result = 0;
        if ((v27 & 1) == 0)
          return result;
      }
    }
    else if (v24)
    {
      return 0;
    }
    v28 = *(_QWORD *)(a1 + 72);
    v29 = *(_QWORD *)(a2 + 72);
    if (v28)
    {
      if (!v29)
        return 0;
      swift_bridgeObjectRetain(*(_QWORD *)(a2 + 72));
      v30 = swift_bridgeObjectRetain(v28);
      v31 = sub_100090860(v30, v29);
      swift_bridgeObjectRelease(v28);
      swift_bridgeObjectRelease(v29);
      if ((v31 & 1) == 0)
        return 0;
    }
    else if (v29)
    {
      return 0;
    }
    v32 = *(_QWORD *)(a1 + 80);
    v33 = *(_QWORD *)(a2 + 80);
    if (v32)
    {
      if (v33)
      {
        swift_bridgeObjectRetain(v33);
        v34 = swift_bridgeObjectRetain(v32);
        v35 = sub_100091028(v34, v33);
        swift_bridgeObjectRelease(v32);
        swift_bridgeObjectRelease(v33);
        if ((v35 & 1) != 0)
          return 1;
      }
    }
    else if (!v33)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

unint64_t sub_100091910()
{
  unint64_t result;

  result = qword_1000C2678;
  if (!qword_1000C2678)
  {
    result = swift_getWitnessTable(&unk_10009B994, &type metadata for ToolInfoV0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000C2678);
  }
  return result;
}

unint64_t sub_100091954()
{
  unint64_t result;

  result = qword_1000B9FA8;
  if (!qword_1000B9FA8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CommandInfoV0, &type metadata for CommandInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000B9FA8);
  }
  return result;
}

uint64_t sub_100091998(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  char v6;

  if (a1 == 0xD000000000000014)
  {
    v4 = 0x800000010009E1A0;
    if (a2 == 0x800000010009E1A0)
      goto LABEL_5;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014, 0x800000010009E1A0, a1, a2, 0) & 1) != 0)
  {
    v4 = a2;
LABEL_5:
    swift_bridgeObjectRelease(v4);
    return 0;
  }
  if (a1 == 0x646E616D6D6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease(0xE700000000000000);
    return 1;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x646E616D6D6F63, 0xE700000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_100091A84@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
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
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[4];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;

  v5 = sub_100005104((uint64_t *)&unk_1000BA0F0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100006270(a1, v9);
  v11 = sub_100091910();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for ToolInfoV0.CodingKeys, &type metadata for ToolInfoV0.CodingKeys, v11, v9, v10);
  if (v2)
    return sub_1000062D8(a1);
  LOBYTE(v37[0]) = 0;
  v12 = KeyedDecodingContainer.decode(_:forKey:)(v37, v5);
  v45 = 1;
  v13 = sub_10009535C();
  KeyedDecodingContainer.decode<A>(_:forKey:)(v37, &type metadata for CommandInfoV0, &v45, v5, &type metadata for CommandInfoV0, v13);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v14 = v37[0];
  v15 = v37[2];
  v35 = v37[3];
  v36 = v37[1];
  v16 = v38;
  v34 = v39;
  v17 = v40;
  v32 = v37[0];
  v33 = v41;
  v18 = v43;
  v29 = v42;
  v30 = v38;
  v19 = v44;
  v31 = v44;
  swift_bridgeObjectRetain(v44);
  swift_bridgeObjectRetain(v14);
  v20 = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRetain(v17);
  v21 = v29;
  swift_bridgeObjectRetain(v29);
  swift_bridgeObjectRetain(v18);
  sub_1000062D8(a1);
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(v18);
  v22 = v21;
  swift_bridgeObjectRelease(v21);
  v23 = v17;
  swift_bridgeObjectRelease(v17);
  v24 = v30;
  swift_bridgeObjectRelease(v30);
  swift_bridgeObjectRelease(v20);
  v25 = v32;
  result = swift_bridgeObjectRelease(v32);
  *a2 = v12;
  a2[1] = v25;
  a2[2] = v36;
  a2[3] = v20;
  a2[4] = v35;
  a2[5] = v24;
  a2[6] = v34;
  a2[7] = v23;
  a2[8] = v33;
  a2[9] = v22;
  v27 = v31;
  a2[10] = v18;
  a2[11] = v27;
  return result;
}

uint64_t *sub_100091CCC(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1;
  v3 = a1[2];
  v4 = a1[4];
  v5 = a1[6];
  v6 = a1[8];
  v7 = a1[9];
  swift_bridgeObjectRetain(a1[10]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  return a1;
}

_QWORD *sub_100091D50(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a1[2];
  v3 = a1[4];
  v4 = a1[7];
  v5 = a1[9];
  v6 = a1[11];
  v7 = a1[12];
  v8 = a1[14];
  swift_bridgeObjectRetain(a1[16]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  return a1;
}

_QWORD *sub_100091DE0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a1[4];
  v3 = a1[7];
  v4 = a1[9];
  v5 = a1[11];
  v6 = a1[12];
  v7 = a1[14];
  v8 = a1[16];
  swift_bridgeObjectRelease(a1[2]);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v8);
  return a1;
}

unint64_t sub_100091E70()
{
  unint64_t result;

  result = qword_1000C2680;
  if (!qword_1000C2680)
  {
    result = swift_getWitnessTable(&unk_10009B944, &type metadata for CommandInfoV0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000C2680);
  }
  return result;
}

unint64_t sub_100091EB4()
{
  unint64_t result;

  result = qword_1000BA000;
  if (!qword_1000BA000)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ArgumentInfoV0, &type metadata for ArgumentInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000BA000);
  }
  return result;
}

uint64_t sub_100091EF8(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char v12;

  if (a1 == 0x6D6F437265707573 && a2 == 0xED000073646E616DLL)
  {
    v5 = 0xED000073646E616DLL;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6D6F437265707573, 0xED000073646E616DLL, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x4E646E616D6D6F63 && a2 == 0xEB00000000656D61)
  {
    v7 = 0xEB00000000656D61;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x4E646E616D6D6F63, 0xEB00000000656D61, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x7463617274736261 && a2 == 0xE800000000000000)
  {
    v8 = 0xE800000000000000;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7463617274736261, 0xE800000000000000, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
    goto LABEL_20;
  }
  if (a1 == 0x6973737563736964 && a2 == 0xEA00000000006E6FLL)
  {
    v9 = 0xEA00000000006E6FLL;
LABEL_26:
    swift_bridgeObjectRelease(v9);
    return 3;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6973737563736964, 0xEA00000000006E6FLL, a1, a2, 0) & 1) != 0)
  {
    v9 = a2;
    goto LABEL_26;
  }
  if (a1 == 0xD000000000000011)
  {
    v10 = 0x800000010009E1C0;
    if (a2 == 0x800000010009E1C0)
      goto LABEL_31;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011, 0x800000010009E1C0, a1, a2, 0) & 1) != 0)
  {
    v10 = a2;
LABEL_31:
    swift_bridgeObjectRelease(v10);
    return 4;
  }
  if (a1 == 0x616D6D6F63627573 && a2 == 0xEB0000000073646ELL)
  {
    v11 = 0xEB0000000073646ELL;
LABEL_37:
    swift_bridgeObjectRelease(v11);
    return 5;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x616D6D6F63627573, 0xEB0000000073646ELL, a1, a2, 0) & 1) != 0)
  {
    v11 = a2;
    goto LABEL_37;
  }
  if (a1 == 0x746E656D75677261 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease(0xE900000000000073);
    return 6;
  }
  else
  {
    v12 = _stringCompareWithSmolCheck(_:_:expecting:)(0x746E656D75677261, 0xE900000000000073, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v12 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

uint64_t sub_100092240@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t result;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;

  v5 = sub_100005104(&qword_1000BA0C8);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100006270(a1, v9);
  v11 = sub_100091E70();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for CommandInfoV0.CodingKeys, &type metadata for CommandInfoV0.CodingKeys, v11, v9, v10);
  if (v2)
  {
    sub_1000062D8(a1);
    swift_bridgeObjectRelease(0);
    swift_bridgeObjectRelease(0);
    swift_bridgeObjectRelease(0);
    swift_bridgeObjectRelease(0);
    swift_bridgeObjectRelease(0);
    return swift_bridgeObjectRelease(0);
  }
  else
  {
    v12 = sub_100005104(&qword_1000B9FC0);
    v51 = 0;
    v13 = sub_1000952B8(&qword_1000BA0B0, (uint64_t)&protocol witness table for String, (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v52, v12, &v51, v5, v12, v13);
    v14 = v52;
    LOBYTE(v52) = 1;
    swift_bridgeObjectRetain(v14);
    v48 = KeyedDecodingContainer.decode(_:forKey:)(&v52, v5);
    v49 = v14;
    LOBYTE(v52) = 2;
    v16 = v15;
    swift_bridgeObjectRetain(v15);
    v17 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v52, v5);
    v50 = v16;
    v19 = v18;
    v47 = v17;
    LOBYTE(v52) = 3;
    swift_bridgeObjectRetain(v18);
    v20 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v52, v5);
    v45 = a2;
    v46 = v19;
    LOBYTE(v52) = 4;
    v22 = v21;
    swift_bridgeObjectRetain(v21);
    v23 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v52, v5);
    v25 = v24;
    v42 = v23;
    v43 = v20;
    v44 = v22;
    v26 = sub_100005104(&qword_1000B9FD8);
    v51 = 5;
    v27 = sub_100080D6C(&qword_1000BA0D0, &qword_1000B9FD8, (void (*)(void))sub_10009535C, (uint64_t)&protocol conformance descriptor for <A> [A]);
    swift_bridgeObjectRetain(v25);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v52, v26, &v51, v5, v26, v27);
    v28 = v52;
    v29 = sub_100005104(&qword_1000B9FF0);
    v51 = 6;
    v30 = sub_100080D6C(&qword_1000BA0E0, &qword_1000B9FF0, (void (*)(void))sub_1000953A0, (uint64_t)&protocol conformance descriptor for <A> [A]);
    swift_bridgeObjectRetain(v28);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v52, v29, &v51, v5, v29, v30);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v31 = v52;
    swift_bridgeObjectRetain(v52);
    swift_bridgeObjectRelease(0);
    sub_1000062D8(a1);
    swift_bridgeObjectRelease(v31);
    swift_bridgeObjectRelease(v28);
    swift_bridgeObjectRelease(v25);
    v32 = v44;
    swift_bridgeObjectRelease(v44);
    v33 = v46;
    swift_bridgeObjectRelease(v46);
    v34 = v50;
    swift_bridgeObjectRelease(v50);
    v35 = v49;
    result = swift_bridgeObjectRelease(v49);
    v37 = v45;
    v38 = v48;
    *v45 = v35;
    v37[1] = v38;
    v39 = v47;
    v37[2] = v34;
    v37[3] = v39;
    v40 = v43;
    v37[4] = v33;
    v37[5] = v40;
    v41 = v42;
    v37[6] = v32;
    v37[7] = v41;
    v37[8] = v25;
    v37[9] = v28;
    v37[10] = v31;
  }
  return result;
}

uint64_t _s22ArgumentParserToolInfo0aD2V0V04NamedE0V23__derived_struct_equalsySbAE_AEtFZ_0(unsigned __int8 a1, uint64_t a2, uint64_t a3, unsigned __int8 a4, uint64_t a5, uint64_t a6)
{
  unint64_t v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  unint64_t v15;
  char v16;
  uint64_t result;

  v10 = 1735290732;
  v11 = a1;
  if (!a1)
  {
    v13 = 0xE400000000000000;
    v12 = 1735290732;
    v14 = a4;
    if (a4)
      goto LABEL_9;
LABEL_18:
    v15 = 0xE400000000000000;
    if (v12 != 1735290732)
      goto LABEL_21;
    goto LABEL_19;
  }
  if (a1 == 1)
    v12 = 0x74726F6873;
  else
    v12 = 0xD000000000000012;
  if (v11 == 1)
    v13 = 0xE500000000000000;
  else
    v13 = 0x800000010009E170;
  v14 = a4;
  if (!a4)
    goto LABEL_18;
LABEL_9:
  if (v14 == 1)
    v10 = 0x74726F6873;
  else
    v10 = 0xD000000000000012;
  if (v14 == 1)
    v15 = 0xE500000000000000;
  else
    v15 = 0x800000010009E170;
  if (v12 != v10)
  {
LABEL_21:
    v16 = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v13, v10, v15, 0);
    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease(v15);
    result = 0;
    if ((v16 & 1) == 0)
      return result;
    goto LABEL_22;
  }
LABEL_19:
  if (v13 != v15)
    goto LABEL_21;
  swift_bridgeObjectRelease_n(v13, 2);
LABEL_22:
  if (a2 == a5 && a3 == a6)
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)(a2, a3, a5, a6, 0);
}

unint64_t sub_10009294C()
{
  unint64_t result;

  result = qword_1000C2688;
  if (!qword_1000C2688)
  {
    result = swift_getWitnessTable(&unk_10009B8F4, &type metadata for ArgumentInfoV0.NameInfoV0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000C2688);
  }
  return result;
}

unint64_t sub_100092990()
{
  unint64_t result;

  result = qword_1000BA010;
  if (!qword_1000BA010)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ArgumentInfoV0.NameInfoV0.KindV0, &type metadata for ArgumentInfoV0.NameInfoV0.KindV0);
    atomic_store(result, (unint64_t *)&qword_1000BA010);
  }
  return result;
}

uint64_t sub_1000929D4(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  char v7;

  if (a1 == 1684957547 && a2 == 0xE400000000000000)
  {
    v5 = 0xE400000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1684957547, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 1701667182 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease(0xE400000000000000);
    return 1;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(1701667182, 0xE400000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_100092AA4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;

  v3 = sub_100005104(&qword_1000BA0B8);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  sub_100006270(a1, v7);
  v9 = sub_10009294C();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for ArgumentInfoV0.NameInfoV0.CodingKeys, &type metadata for ArgumentInfoV0.NameInfoV0.CodingKeys, v9, v7, v8);
  if (!v1)
  {
    v14 = 0;
    v10 = sub_100095318();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v15, &type metadata for ArgumentInfoV0.NameInfoV0.KindV0, &v14, v3, &type metadata for ArgumentInfoV0.NameInfoV0.KindV0, v10);
    v7 = v15;
    v13 = 1;
    KeyedDecodingContainer.decode(_:forKey:)(&v13, v3);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_1000062D8(a1);
  return v7;
}

unint64_t sub_100092C10(Swift::String string, Swift::OpaquePointer cases)
{
  void *object;
  Swift::String v3;
  unint64_t v5;

  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)(cases, v3);
  swift_bridgeObjectRelease(object);
  if (v5 >= 3)
    return 3;
  else
    return v5;
}

unint64_t sub_100092C54()
{
  unint64_t result;

  result = qword_1000C2690[0];
  if (!qword_1000C2690[0])
  {
    result = swift_getWitnessTable(&unk_10009B8A4, &type metadata for ArgumentInfoV0.CodingKeys);
    atomic_store(result, qword_1000C2690);
  }
  return result;
}

unint64_t sub_100092C98()
{
  unint64_t result;

  result = qword_1000BA020;
  if (!qword_1000BA020)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ArgumentInfoV0.KindV0, &type metadata for ArgumentInfoV0.KindV0);
    atomic_store(result, (unint64_t *)&qword_1000BA020);
  }
  return result;
}

unint64_t sub_100092CDC()
{
  unint64_t result;

  result = qword_1000BA040;
  if (!qword_1000BA040)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ArgumentInfoV0.NameInfoV0, &type metadata for ArgumentInfoV0.NameInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000BA040);
  }
  return result;
}

uint64_t sub_100092D20(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;

  if (a1 == 1684957547 && a2 == 0xE400000000000000)
  {
    v5 = 0xE400000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1684957547, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x6944646C756F6873 && a2 == 0xED000079616C7073)
  {
    v7 = 0xED000079616C7073;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6944646C756F6873, 0xED000079616C7073, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x546E6F6974636573 && a2 == 0xEC000000656C7469)
  {
    v8 = 0xEC000000656C7469;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x546E6F6974636573, 0xEC000000656C7469, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
    goto LABEL_20;
  }
  if (a1 == 0x6E6F6974704F7369 && a2 == 0xEA00000000006C61)
  {
    v9 = 0xEA00000000006C61;
LABEL_26:
    swift_bridgeObjectRelease(v9);
    return 3;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6E6F6974704F7369, 0xEA00000000006C61, a1, a2, 0) & 1) != 0)
  {
    v9 = a2;
    goto LABEL_26;
  }
  if (a1 == 0x7461657065527369 && a2 == 0xEB00000000676E69)
  {
    v10 = 0xEB00000000676E69;
LABEL_32:
    swift_bridgeObjectRelease(v10);
    return 4;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7461657065527369, 0xEB00000000676E69, a1, a2, 0) & 1) != 0)
  {
    v10 = a2;
    goto LABEL_32;
  }
  if (a1 == 0x73656D616ELL && a2 == 0xE500000000000000)
  {
    v11 = 0xE500000000000000;
LABEL_38:
    swift_bridgeObjectRelease(v11);
    return 5;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x73656D616ELL, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v11 = a2;
    goto LABEL_38;
  }
  if (a1 == 0x6572726566657270 && a2 == 0xED0000656D614E64)
  {
    v12 = 0xED0000656D614E64;
LABEL_44:
    swift_bridgeObjectRelease(v12);
    return 6;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6572726566657270, 0xED0000656D614E64, a1, a2, 0) & 1) != 0)
  {
    v12 = a2;
    goto LABEL_44;
  }
  if (a1 == 0x6D614E65756C6176 && a2 == 0xE900000000000065)
  {
    v13 = 0xE900000000000065;
LABEL_50:
    swift_bridgeObjectRelease(v13);
    return 7;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6D614E65756C6176, 0xE900000000000065, a1, a2, 0) & 1) != 0)
  {
    v13 = a2;
    goto LABEL_50;
  }
  if (a1 == 0x56746C7561666564 && a2 == 0xEC00000065756C61)
  {
    v14 = 0xEC00000065756C61;
LABEL_56:
    swift_bridgeObjectRelease(v14);
    return 8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x56746C7561666564, 0xEC00000065756C61, a1, a2, 0) & 1) != 0)
  {
    v14 = a2;
    goto LABEL_56;
  }
  if (a1 == 0x65756C61566C6C61 && a2 == 0xE900000000000073)
  {
    v15 = 0xE900000000000073;
LABEL_62:
    swift_bridgeObjectRelease(v15);
    return 9;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x65756C61566C6C61, 0xE900000000000073, a1, a2, 0) & 1) != 0)
  {
    v15 = a2;
    goto LABEL_62;
  }
  if (a1 == 0x7463617274736261 && a2 == 0xE800000000000000)
  {
    v16 = 0xE800000000000000;
LABEL_68:
    swift_bridgeObjectRelease(v16);
    return 10;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7463617274736261, 0xE800000000000000, a1, a2, 0) & 1) != 0)
  {
    v16 = a2;
    goto LABEL_68;
  }
  if (a1 == 0x6973737563736964 && a2 == 0xEA00000000006E6FLL)
  {
    swift_bridgeObjectRelease(0xEA00000000006E6FLL);
    return 11;
  }
  else
  {
    v17 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6973737563736964, 0xEA00000000006E6FLL, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v17 & 1) != 0)
      return 11;
    else
      return 12;
  }
}

_QWORD *sub_100093288@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
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
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  int v77;
  _QWORD *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  char v92;
  int v93;
  __int16 v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char v108;
  int v109;
  __int16 v110;
  int v111;
  __int16 v112;
  uint64_t v113;

  v5 = sub_100005104(&qword_1000BA090);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  v78 = a1;
  sub_100006270(a1, v9);
  v11 = sub_100092C54();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for ArgumentInfoV0.CodingKeys, &type metadata for ArgumentInfoV0.CodingKeys, v11, v9, v10);
  if (v2)
  {
    v113 = v2;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
LABEL_4:
    sub_1000062D8(v78);
    swift_bridgeObjectRelease(0);
    swift_bridgeObjectRelease(v20);
    swift_bridgeObjectRelease(v21);
    swift_bridgeObjectRelease(v19);
    swift_bridgeObjectRelease(v18);
    swift_bridgeObjectRelease(v17);
    swift_bridgeObjectRelease(v16);
    return (_QWORD *)swift_bridgeObjectRelease(v15);
  }
  v12 = v6;
  LOBYTE(v79) = 0;
  v13 = sub_100095230();
  KeyedDecodingContainer.decode<A>(_:forKey:)(&v88, &type metadata for ArgumentInfoV0.KindV0, &v79, v5, &type metadata for ArgumentInfoV0.KindV0, v13);
  v14 = v88;
  LOBYTE(v88) = 1;
  v77 = KeyedDecodingContainer.decode(_:forKey:)(&v88, v5);
  LOBYTE(v88) = 2;
  v23 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v88, v5);
  v25 = v24;
  v76 = v14;
  LOBYTE(v88) = 3;
  swift_bridgeObjectRetain(v24);
  v73 = KeyedDecodingContainer.decode(_:forKey:)(&v88, v5);
  v74 = v23;
  v75 = v25;
  LOBYTE(v88) = 4;
  v72 = KeyedDecodingContainer.decode(_:forKey:)(&v88, v5);
  v26 = sub_100005104(&qword_1000BA030);
  LOBYTE(v79) = 5;
  v27 = sub_100080D6C(&qword_1000BA0A0, &qword_1000BA030, (void (*)(void))sub_100095274, (uint64_t)&protocol conformance descriptor for <A> [A]);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v88, v26, &v79, v5, v26, v27);
  v28 = v88;
  LOBYTE(v79) = 6;
  v29 = sub_100095274();
  v71 = v28;
  swift_bridgeObjectRetain(v28);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v88, &type metadata for ArgumentInfoV0.NameInfoV0, &v79, v5, &type metadata for ArgumentInfoV0.NameInfoV0, v29);
  v30 = v88;
  v70 = v89;
  LOBYTE(v88) = 7;
  v31 = v90;
  swift_bridgeObjectRetain(v90);
  v67 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v88, v5);
  v68 = v30;
  v69 = v31;
  LOBYTE(v88) = 8;
  v17 = v32;
  swift_bridgeObjectRetain(v32);
  v33 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v88, v5);
  v113 = 0;
  v35 = v33;
  v36 = v34;
  v65 = a2;
  v37 = sub_100005104(&qword_1000B9FC0);
  LOBYTE(v79) = 9;
  v38 = sub_1000952B8(&qword_1000BA0B0, (uint64_t)&protocol witness table for String, (uint64_t)&protocol conformance descriptor for <A> [A]);
  v66 = v36;
  swift_bridgeObjectRetain(v36);
  v39 = v38;
  v40 = v113;
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v88, v37, &v79, v5, v37, v39);
  v113 = v40;
  if (v40)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v5);
    v21 = v75;
    swift_bridgeObjectRelease(v75);
    v19 = v71;
    swift_bridgeObjectRelease(v71);
    v18 = v69;
    swift_bridgeObjectRelease(v69);
    swift_bridgeObjectRelease(v17);
    v16 = v66;
    swift_bridgeObjectRelease(v66);
    v15 = 0;
    v20 = 0;
    goto LABEL_4;
  }
  v41 = v88;
  LOBYTE(v88) = 10;
  v64 = v41;
  swift_bridgeObjectRetain(v41);
  v42 = v113;
  v43 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v88, v5);
  v113 = v42;
  if (v42)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v5);
    v21 = v75;
    swift_bridgeObjectRelease(v75);
    v19 = v71;
    swift_bridgeObjectRelease(v71);
    v18 = v69;
    swift_bridgeObjectRelease(v69);
    swift_bridgeObjectRelease(v17);
    v16 = v66;
    swift_bridgeObjectRelease(v66);
    v15 = v64;
    swift_bridgeObjectRelease(v64);
    v20 = 0;
    goto LABEL_4;
  }
  v45 = v43;
  v20 = v44;
  v108 = 11;
  swift_bridgeObjectRetain(v44);
  v46 = v113;
  v63 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v108, v5);
  v113 = v46;
  if (v46)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v5);
    v21 = v75;
    swift_bridgeObjectRelease(v75);
    v19 = v71;
    swift_bridgeObjectRelease(v71);
    v18 = v69;
    swift_bridgeObjectRelease(v69);
    swift_bridgeObjectRelease(v17);
    v16 = v66;
    swift_bridgeObjectRelease(v66);
    v15 = v64;
    swift_bridgeObjectRelease(v64);
    swift_bridgeObjectRelease(v20);
    goto LABEL_4;
  }
  v48 = v47;
  v62 = v77 & 1;
  v77 = v73 & 1;
  v73 = v72 & 1;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v5);
  swift_bridgeObjectRetain(v48);
  swift_bridgeObjectRelease(0);
  LOBYTE(v79) = v76;
  BYTE1(v79) = v62;
  v49 = v75;
  *((_QWORD *)&v79 + 1) = v74;
  *(_QWORD *)&v80 = v75;
  BYTE8(v80) = v77;
  BYTE9(v80) = v73;
  v50 = v71;
  v51 = v69;
  *(_QWORD *)&v81 = v71;
  *((_QWORD *)&v81 + 1) = v68;
  *(_QWORD *)&v82 = v70;
  *((_QWORD *)&v82 + 1) = v69;
  *(_QWORD *)&v83 = v67;
  *((_QWORD *)&v83 + 1) = v17;
  v61 = v35;
  *(_QWORD *)&v84 = v35;
  v52 = v66;
  *((_QWORD *)&v84 + 1) = v66;
  *(_QWORD *)&v85 = v64;
  *((_QWORD *)&v85 + 1) = v45;
  *(_QWORD *)&v86 = v20;
  *((_QWORD *)&v86 + 1) = v63;
  v87 = v48;
  sub_100091D50(&v79);
  swift_bridgeObjectRelease(v49);
  swift_bridgeObjectRelease(v50);
  swift_bridgeObjectRelease(v51);
  v53 = v17;
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v52);
  v54 = v64;
  swift_bridgeObjectRelease(v64);
  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(v48);
  sub_1000062D8(v78);
  LOBYTE(v88) = v76;
  BYTE1(v88) = v62;
  *(_DWORD *)((char *)&v88 + 2) = v111;
  HIWORD(v88) = v112;
  v89 = v74;
  v90 = v49;
  v91 = v77;
  v92 = v73;
  v93 = v109;
  v94 = v110;
  v95 = v71;
  v96 = v68;
  v97 = v70;
  v98 = v51;
  v99 = v67;
  v100 = v53;
  v101 = v61;
  v102 = v52;
  v103 = v54;
  v104 = v45;
  v105 = v20;
  v106 = v63;
  v107 = v48;
  result = sub_100091DE0(&v88);
  v55 = v86;
  v56 = v65;
  *(_OWORD *)(v65 + 96) = v85;
  *(_OWORD *)(v56 + 112) = v55;
  *(_QWORD *)(v56 + 128) = v87;
  v57 = v82;
  *(_OWORD *)(v56 + 32) = v81;
  *(_OWORD *)(v56 + 48) = v57;
  v58 = v84;
  *(_OWORD *)(v56 + 64) = v83;
  *(_OWORD *)(v56 + 80) = v58;
  v59 = v80;
  *(_OWORD *)v56 = v79;
  *(_OWORD *)(v56 + 16) = v59;
  return result;
}

unint64_t sub_100093ADC()
{
  unint64_t result;

  result = qword_1000BA050;
  if (!qword_1000BA050)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ToolInfoV0, &type metadata for ToolInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000BA050);
  }
  return result;
}

unint64_t sub_100093B24()
{
  unint64_t result;

  result = qword_1000BA058;
  if (!qword_1000BA058)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CommandInfoV0, &type metadata for CommandInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000BA058);
  }
  return result;
}

unint64_t sub_100093B6C()
{
  unint64_t result;

  result = qword_1000BA060;
  if (!qword_1000BA060)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ArgumentInfoV0.NameInfoV0.KindV0, &type metadata for ArgumentInfoV0.NameInfoV0.KindV0);
    atomic_store(result, (unint64_t *)&qword_1000BA060);
  }
  return result;
}

unint64_t sub_100093BB4()
{
  unint64_t result;

  result = qword_1000BA068;
  if (!qword_1000BA068)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ArgumentInfoV0.NameInfoV0, &type metadata for ArgumentInfoV0.NameInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000BA068);
  }
  return result;
}

unint64_t sub_100093BFC()
{
  unint64_t result;

  result = qword_1000BA070;
  if (!qword_1000BA070)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ArgumentInfoV0.KindV0, &type metadata for ArgumentInfoV0.KindV0);
    atomic_store(result, (unint64_t *)&qword_1000BA070);
  }
  return result;
}

unint64_t sub_100093C44()
{
  unint64_t result;

  result = qword_1000BA078;
  if (!qword_1000BA078)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ArgumentInfoV0, &type metadata for ArgumentInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000BA078);
  }
  return result;
}

ValueMetadata *type metadata accessor for ToolInfoHeader()
{
  return &type metadata for ToolInfoHeader;
}

uint64_t destroy for ToolInfoV0(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(a1[5]);
  swift_bridgeObjectRelease(a1[7]);
  swift_bridgeObjectRelease(a1[9]);
  swift_bridgeObjectRelease(a1[10]);
  return swift_bridgeObjectRelease(a1[11]);
}

_QWORD *initializeWithCopy for ToolInfoV0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  v8 = a2[10];
  v9 = a2[11];
  a1[10] = v8;
  a1[11] = v9;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  return a1;
}

_QWORD *assignWithCopy for ToolInfoV0(_QWORD *a1, _QWORD *a2)
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

  *a1 = *a2;
  v4 = a1[1];
  v5 = a2[1];
  a1[1] = v5;
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRelease(v4);
  a1[2] = a2[2];
  v6 = a2[3];
  v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[4] = a2[4];
  v8 = a2[5];
  v9 = a1[5];
  a1[5] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[6] = a2[6];
  v10 = a2[7];
  v11 = a1[7];
  a1[7] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  a1[8] = a2[8];
  v12 = a2[9];
  v13 = a1[9];
  a1[9] = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  v14 = a1[10];
  v15 = a2[10];
  a1[10] = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v14);
  v16 = a1[11];
  v17 = a2[11];
  a1[11] = v17;
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRelease(v16);
  return a1;
}

__n128 initializeWithTake for ToolInfoV0(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

_QWORD *assignWithTake for ToolInfoV0(_QWORD *a1, uint64_t a2)
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

  v4 = a1[1];
  v5 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v5;
  swift_bridgeObjectRelease(v4);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = a1[3];
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = a1[5];
  a1[4] = *(_QWORD *)(a2 + 32);
  a1[5] = v8;
  swift_bridgeObjectRelease(v9);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = a1[7];
  a1[6] = *(_QWORD *)(a2 + 48);
  a1[7] = v10;
  swift_bridgeObjectRelease(v11);
  a1[8] = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease(a1[9]);
  v12 = a1[10];
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 72);
  swift_bridgeObjectRelease(v12);
  v13 = a1[11];
  a1[11] = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRelease(v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for ToolInfoV0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 96))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ToolInfoV0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 96) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ToolInfoV0()
{
  return &type metadata for ToolInfoV0;
}

uint64_t destroy for CommandInfoV0(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  swift_bridgeObjectRelease(a1[2]);
  swift_bridgeObjectRelease(a1[4]);
  swift_bridgeObjectRelease(a1[6]);
  swift_bridgeObjectRelease(a1[8]);
  swift_bridgeObjectRelease(a1[9]);
  return swift_bridgeObjectRelease(a1[10]);
}

uint64_t *initializeWithCopy for CommandInfoV0(uint64_t *a1, uint64_t *a2)
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

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v6 = a2[2];
  v5 = a2[3];
  a1[2] = v6;
  a1[3] = v5;
  v8 = a2[4];
  v7 = a2[5];
  a1[4] = v8;
  a1[5] = v7;
  v10 = a2[6];
  v9 = a2[7];
  a1[6] = v10;
  a1[7] = v9;
  v11 = a2[8];
  v12 = a2[9];
  a1[8] = v11;
  a1[9] = v12;
  v13 = a2[10];
  a1[10] = v13;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v13);
  return a1;
}

uint64_t *assignWithCopy for CommandInfoV0(uint64_t *a1, uint64_t *a2)
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

  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRelease(v4);
  a1[1] = a2[1];
  v6 = a2[2];
  v7 = a1[2];
  a1[2] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[3] = a2[3];
  v8 = a2[4];
  v9 = a1[4];
  a1[4] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[5] = a2[5];
  v10 = a2[6];
  v11 = a1[6];
  a1[6] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  a1[7] = a2[7];
  v12 = a2[8];
  v13 = a1[8];
  a1[8] = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  v14 = a1[9];
  v15 = a2[9];
  a1[9] = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v14);
  v16 = a1[10];
  v17 = a2[10];
  a1[10] = v17;
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRelease(v16);
  return a1;
}

__n128 initializeWithTake for CommandInfoV0(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

_QWORD *assignWithTake for CommandInfoV0(_QWORD *a1, uint64_t a2)
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

  v4 = *a1;
  *a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease(v4);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = a1[2];
  a1[1] = *(_QWORD *)(a2 + 8);
  a1[2] = v5;
  swift_bridgeObjectRelease(v6);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = a1[4];
  a1[3] = *(_QWORD *)(a2 + 24);
  a1[4] = v7;
  swift_bridgeObjectRelease(v8);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = a1[6];
  a1[5] = *(_QWORD *)(a2 + 40);
  a1[6] = v9;
  swift_bridgeObjectRelease(v10);
  a1[7] = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease(a1[8]);
  v11 = a1[9];
  *((_OWORD *)a1 + 4) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease(v11);
  v12 = a1[10];
  a1[10] = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease(v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for CommandInfoV0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 88))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CommandInfoV0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
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
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CommandInfoV0()
{
  return &type metadata for CommandInfoV0;
}

uint64_t destroy for ArgumentInfoV0(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[2]);
  swift_bridgeObjectRelease(a1[4]);
  swift_bridgeObjectRelease(a1[7]);
  swift_bridgeObjectRelease(a1[9]);
  swift_bridgeObjectRelease(a1[11]);
  swift_bridgeObjectRelease(a1[12]);
  swift_bridgeObjectRelease(a1[14]);
  return swift_bridgeObjectRelease(a1[16]);
}

uint64_t initializeWithCopy for ArgumentInfoV0(uint64_t a1, uint64_t a2)
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

  *(_WORD *)a1 = *(_WORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v4;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v7;
  v9 = *(_QWORD *)(a2 + 96);
  v8 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = v9;
  *(_QWORD *)(a1 + 104) = v8;
  v11 = *(_QWORD *)(a2 + 112);
  v10 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = v11;
  *(_QWORD *)(a1 + 120) = v10;
  v12 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 128) = v12;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v12);
  return a1;
}

uint64_t assignWithCopy for ArgumentInfoV0(uint64_t a1, uint64_t a2)
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

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v6);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v8 = *(_QWORD *)(a2 + 56);
  v9 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v10 = *(_QWORD *)(a2 + 72);
  v11 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  v12 = *(_QWORD *)(a2 + 88);
  v13 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  v14 = *(_QWORD *)(a1 + 96);
  v15 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 96) = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v14);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  v16 = *(_QWORD *)(a2 + 112);
  v17 = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 112) = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  v18 = *(_QWORD *)(a2 + 128);
  v19 = *(_QWORD *)(a1 + 128);
  *(_QWORD *)(a1 + 128) = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  return a1;
}

__n128 initializeWithTake for ArgumentInfoV0(uint64_t a1, uint64_t a2)
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
  v7 = *(_OWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for ArgumentInfoV0(uint64_t a1, uint64_t a2)
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

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  v6 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease(v6);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v7 = *(_QWORD *)(a2 + 56);
  v8 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease(v8);
  v9 = *(_QWORD *)(a2 + 72);
  v10 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v9;
  swift_bridgeObjectRelease(v10);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 88));
  v11 = *(_QWORD *)(a1 + 96);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_bridgeObjectRelease(v11);
  v12 = *(_QWORD *)(a2 + 112);
  v13 = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v12;
  swift_bridgeObjectRelease(v13);
  v14 = *(_QWORD *)(a2 + 128);
  v15 = *(_QWORD *)(a1 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v14;
  swift_bridgeObjectRelease(v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for ArgumentInfoV0(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 136))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ArgumentInfoV0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 136) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 136) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0()
{
  return &type metadata for ArgumentInfoV0;
}

uint64_t destroy for ArgumentInfoV0.NameInfoV0(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
}

uint64_t _s22ArgumentParserToolInfo14ArgumentInfoV0V10NameInfoV0VwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t assignWithCopy for ArgumentInfoV0.NameInfoV0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

__n128 initializeWithTake for ArgumentInfoV0.NameInfoV0(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ArgumentInfoV0.NameInfoV0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ArgumentInfoV0.NameInfoV0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ArgumentInfoV0.NameInfoV0(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0.NameInfoV0()
{
  return &type metadata for ArgumentInfoV0.NameInfoV0;
}

_BYTE *initializeBufferWithCopyOfBuffer for ArgumentInfoV0.KindV0(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0.NameInfoV0.KindV0()
{
  return &type metadata for ArgumentInfoV0.NameInfoV0.KindV0;
}

uint64_t _s22ArgumentParserToolInfo14ArgumentInfoV0V6KindV0Owst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100094948 + 4 * byte_10009AF78[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10009497C + 4 * byte_10009AF73[v4]))();
}

uint64_t sub_10009497C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100094984(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10009498CLL);
  return result;
}

uint64_t sub_100094998(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000949A0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1000949A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000949AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0.KindV0()
{
  return &type metadata for ArgumentInfoV0.KindV0;
}

uint64_t getEnumTagSinglePayload for ArgumentInfoV0.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF5)
    goto LABEL_17;
  if (a2 + 11 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 11) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 11;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 11;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 11;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v8 = v6 - 12;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ArgumentInfoV0.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100094AA4 + 4 * byte_10009AF82[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_100094AD8 + 4 * byte_10009AF7D[v4]))();
}

uint64_t sub_100094AD8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100094AE0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100094AE8);
  return result;
}

uint64_t sub_100094AF4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100094AFCLL);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_100094B00(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100094B08(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0.CodingKeys()
{
  return &type metadata for ArgumentInfoV0.CodingKeys;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0.NameInfoV0.CodingKeys()
{
  return &type metadata for ArgumentInfoV0.NameInfoV0.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for CommandInfoV0.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100094B84 + 4 * byte_10009AF8C[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_100094BB8 + 4 * byte_10009AF87[v4]))();
}

uint64_t sub_100094BB8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100094BC0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100094BC8);
  return result;
}

uint64_t sub_100094BD4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100094BDCLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_100094BE0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100094BE8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CommandInfoV0.CodingKeys()
{
  return &type metadata for CommandInfoV0.CodingKeys;
}

uint64_t _s22ArgumentParserToolInfo14ArgumentInfoV0V10NameInfoV0V10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100094C50 + 4 * byte_10009AF96[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100094C84 + 4 * byte_10009AF91[v4]))();
}

uint64_t sub_100094C84(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100094C8C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100094C94);
  return result;
}

uint64_t sub_100094CA0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100094CA8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100094CAC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100094CB4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ToolInfoV0.CodingKeys()
{
  return &type metadata for ToolInfoV0.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for ToolInfoHeader.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100094D14 + 4 * byte_10009AF9B[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100094D34 + 4 * byte_10009AFA0[v4]))();
}

_BYTE *sub_100094D14(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100094D34(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100094D3C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100094D44(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100094D4C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100094D54(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ToolInfoHeader.CodingKeys()
{
  return &type metadata for ToolInfoHeader.CodingKeys;
}

unint64_t sub_100094D74()
{
  unint64_t result;

  result = qword_1000C3520[0];
  if (!qword_1000C3520[0])
  {
    result = swift_getWitnessTable(&unk_10009B59C, &type metadata for ToolInfoHeader.CodingKeys);
    atomic_store(result, qword_1000C3520);
  }
  return result;
}

unint64_t sub_100094DBC()
{
  unint64_t result;

  result = qword_1000C3730[0];
  if (!qword_1000C3730[0])
  {
    result = swift_getWitnessTable(&unk_10009B654, &type metadata for ToolInfoV0.CodingKeys);
    atomic_store(result, qword_1000C3730);
  }
  return result;
}

unint64_t sub_100094E04()
{
  unint64_t result;

  result = qword_1000C3940[0];
  if (!qword_1000C3940[0])
  {
    result = swift_getWitnessTable(&unk_10009B70C, &type metadata for CommandInfoV0.CodingKeys);
    atomic_store(result, qword_1000C3940);
  }
  return result;
}

unint64_t sub_100094E4C()
{
  unint64_t result;

  result = qword_1000C3B50[0];
  if (!qword_1000C3B50[0])
  {
    result = swift_getWitnessTable(&unk_10009B7C4, &type metadata for ArgumentInfoV0.NameInfoV0.CodingKeys);
    atomic_store(result, qword_1000C3B50);
  }
  return result;
}

unint64_t sub_100094E94()
{
  unint64_t result;

  result = qword_1000C3D60[0];
  if (!qword_1000C3D60[0])
  {
    result = swift_getWitnessTable(&unk_10009B87C, &type metadata for ArgumentInfoV0.CodingKeys);
    atomic_store(result, qword_1000C3D60);
  }
  return result;
}

unint64_t sub_100094EDC()
{
  unint64_t result;

  result = qword_1000C3E70;
  if (!qword_1000C3E70)
  {
    result = swift_getWitnessTable(&unk_10009B7EC, &type metadata for ArgumentInfoV0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000C3E70);
  }
  return result;
}

unint64_t sub_100094F24()
{
  unint64_t result;

  result = qword_1000C3E78;
  if (!qword_1000C3E78)
  {
    result = swift_getWitnessTable(&unk_10009B814, &type metadata for ArgumentInfoV0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000C3E78);
  }
  return result;
}

unint64_t sub_100094F6C()
{
  unint64_t result;

  result = qword_1000C3F00;
  if (!qword_1000C3F00)
  {
    result = swift_getWitnessTable(&unk_10009B734, &type metadata for ArgumentInfoV0.NameInfoV0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000C3F00);
  }
  return result;
}

unint64_t sub_100094FB4()
{
  unint64_t result;

  result = qword_1000C3F08[0];
  if (!qword_1000C3F08[0])
  {
    result = swift_getWitnessTable(&unk_10009B75C, &type metadata for ArgumentInfoV0.NameInfoV0.CodingKeys);
    atomic_store(result, qword_1000C3F08);
  }
  return result;
}

unint64_t sub_100094FFC()
{
  unint64_t result;

  result = qword_1000C3F90;
  if (!qword_1000C3F90)
  {
    result = swift_getWitnessTable(&unk_10009B67C, &type metadata for CommandInfoV0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000C3F90);
  }
  return result;
}

unint64_t sub_100095044()
{
  unint64_t result;

  result = qword_1000C3F98[0];
  if (!qword_1000C3F98[0])
  {
    result = swift_getWitnessTable(&unk_10009B6A4, &type metadata for CommandInfoV0.CodingKeys);
    atomic_store(result, qword_1000C3F98);
  }
  return result;
}

unint64_t sub_10009508C()
{
  unint64_t result;

  result = qword_1000C4020;
  if (!qword_1000C4020)
  {
    result = swift_getWitnessTable(&unk_10009B5C4, &type metadata for ToolInfoV0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000C4020);
  }
  return result;
}

unint64_t sub_1000950D4()
{
  unint64_t result;

  result = qword_1000C4028[0];
  if (!qword_1000C4028[0])
  {
    result = swift_getWitnessTable(&unk_10009B5EC, &type metadata for ToolInfoV0.CodingKeys);
    atomic_store(result, qword_1000C4028);
  }
  return result;
}

unint64_t sub_10009511C()
{
  unint64_t result;

  result = qword_1000C40B0;
  if (!qword_1000C40B0)
  {
    result = swift_getWitnessTable(&unk_10009B50C, &type metadata for ToolInfoHeader.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000C40B0);
  }
  return result;
}

unint64_t sub_100095164()
{
  unint64_t result;

  result = qword_1000C40B8[0];
  if (!qword_1000C40B8[0])
  {
    result = swift_getWitnessTable(&unk_10009B534, &type metadata for ToolInfoHeader.CodingKeys);
    atomic_store(result, qword_1000C40B8);
  }
  return result;
}

unint64_t sub_1000951A8()
{
  unint64_t result;

  result = qword_1000BA080;
  if (!qword_1000BA080)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ArgumentInfoV0.KindV0, &type metadata for ArgumentInfoV0.KindV0);
    atomic_store(result, (unint64_t *)&qword_1000BA080);
  }
  return result;
}

unint64_t sub_1000951EC()
{
  unint64_t result;

  result = qword_1000BA088;
  if (!qword_1000BA088)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ArgumentInfoV0.NameInfoV0.KindV0, &type metadata for ArgumentInfoV0.NameInfoV0.KindV0);
    atomic_store(result, (unint64_t *)&qword_1000BA088);
  }
  return result;
}

unint64_t sub_100095230()
{
  unint64_t result;

  result = qword_1000BA098;
  if (!qword_1000BA098)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ArgumentInfoV0.KindV0, &type metadata for ArgumentInfoV0.KindV0);
    atomic_store(result, (unint64_t *)&qword_1000BA098);
  }
  return result;
}

unint64_t sub_100095274()
{
  unint64_t result;

  result = qword_1000BA0A8;
  if (!qword_1000BA0A8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ArgumentInfoV0.NameInfoV0, &type metadata for ArgumentInfoV0.NameInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000BA0A8);
  }
  return result;
}

uint64_t sub_1000952B8(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000593C(&qword_1000B9FC0);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100095318()
{
  unint64_t result;

  result = qword_1000BA0C0;
  if (!qword_1000BA0C0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ArgumentInfoV0.NameInfoV0.KindV0, &type metadata for ArgumentInfoV0.NameInfoV0.KindV0);
    atomic_store(result, (unint64_t *)&qword_1000BA0C0);
  }
  return result;
}

unint64_t sub_10009535C()
{
  unint64_t result;

  result = qword_1000BA0D8;
  if (!qword_1000BA0D8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CommandInfoV0, &type metadata for CommandInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000BA0D8);
  }
  return result;
}

unint64_t sub_1000953A0()
{
  unint64_t result;

  result = qword_1000BA0E8;
  if (!qword_1000BA0E8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ArgumentInfoV0, &type metadata for ArgumentInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000BA0E8);
  }
  return result;
}
