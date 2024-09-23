void sub_244E7D51C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_244E7D618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_244E7D970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v15;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a7 + 8)
                                                                                              + *(_QWORD *)(a7 + 8));
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v15;
  *v15 = v7;
  v15[1] = sub_244E7DA1C;
  return v17(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_244E7DA1C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_244E7DA64(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

ValueMetadata *type metadata accessor for MusicIssues()
{
  return &type metadata for MusicIssues;
}

_QWORD *sub_244E7DA80@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_244E7DC9C(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_244E7DAA8(uint64_t *a1, uint64_t *a2)
{
  return sub_244E9CEAC(*a1, *a2);
}

uint64_t sub_244E7DAB4()
{
  return 1;
}

uint64_t sub_244E7DABC()
{
  sub_244EA1500();
  sub_244EA1230();
  return sub_244EA1518();
}

uint64_t sub_244E7DB08()
{
  return sub_244EA1230();
}

uint64_t sub_244E7DB1C()
{
  sub_244EA1500();
  sub_244EA1230();
  return sub_244EA1518();
}

uint64_t sub_244E7DB64@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_244EA147C();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_244E7DBB4(_QWORD *a1@<X8>)
{
  *a1 = 0x6575737369;
  a1[1] = 0xE500000000000000;
}

uint64_t sub_244E7DBCC()
{
  return 0x6575737369;
}

uint64_t sub_244E7DBE0@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_244EA147C();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_244E7DC34()
{
  return 0;
}

void sub_244E7DC40(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_244E7DC4C()
{
  sub_244E7DE44();
  return sub_244EA1530();
}

uint64_t sub_244E7DC74()
{
  sub_244E7DE44();
  return sub_244EA153C();
}

_QWORD *sub_244E7DC9C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257425C10);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244E7DE44();
  sub_244EA1524();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257425C20);
    sub_244E7DEA8();
    sub_244EA1494();
    v7 = (_QWORD *)v9[1];
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249528E40]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_244E7DE44()
{
  unint64_t result;

  result = qword_257425C18;
  if (!qword_257425C18)
  {
    result = MEMORY[0x249528E58](&unk_244EA1D7C, &type metadata for MusicIssues.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425C18);
  }
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

unint64_t sub_244E7DEA8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_257425C28;
  if (!qword_257425C28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257425C20);
    v2 = sub_244E7DF50();
    result = MEMORY[0x249528E58](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_257425C28);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249528E4C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_244E7DF50()
{
  unint64_t result;

  result = qword_257425C30;
  if (!qword_257425C30)
  {
    result = MEMORY[0x249528E58](&unk_244EA2D24, &type metadata for MusicIssue);
    atomic_store(result, (unint64_t *)&qword_257425C30);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MusicIssues.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MusicIssues.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_244E7E02C + 4 * asc_244EA1C0C[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_244E7E04C + 4 * byte_244EA1C11[v4]))();
}

_BYTE *sub_244E7E02C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_244E7E04C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244E7E054(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244E7E05C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244E7E064(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244E7E06C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_244E7E078()
{
  return 0;
}

ValueMetadata *type metadata accessor for MusicIssues.CodingKeys()
{
  return &type metadata for MusicIssues.CodingKeys;
}

unint64_t sub_244E7E098()
{
  unint64_t result;

  result = qword_257425C38;
  if (!qword_257425C38)
  {
    result = MEMORY[0x249528E58](&unk_244EA1D54, &type metadata for MusicIssues.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425C38);
  }
  return result;
}

unint64_t sub_244E7E0E0()
{
  unint64_t result;

  result = qword_257425C40;
  if (!qword_257425C40)
  {
    result = MEMORY[0x249528E58](&unk_244EA1C8C, &type metadata for MusicIssues.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425C40);
  }
  return result;
}

unint64_t sub_244E7E128()
{
  unint64_t result;

  result = qword_257425C48;
  if (!qword_257425C48)
  {
    result = MEMORY[0x249528E58](&unk_244EA1CB4, &type metadata for MusicIssues.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425C48);
  }
  return result;
}

uint64_t sub_244E7E16C(char *a1, char *a2)
{
  return sub_244E8B008(*a1, *a2);
}

uint64_t sub_244E7E178()
{
  sub_244EA1500();
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

uint64_t sub_244E7E1E4()
{
  sub_244EA1230();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244E7E224()
{
  sub_244EA1500();
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

uint64_t sub_244E7E28C@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_244EA147C();
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

void sub_244E7E2E8(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;

  v2 = 0x6F65646976;
  if (*v1)
    v2 = 0x636973756DLL;
  *a1 = v2;
  a1[1] = 0xE500000000000000;
}

void sub_244E7E318(char *a1)
{
  sub_244E8AD5C(*a1);
}

void sub_244E7E324()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_244EA1500();
  __asm { BR              X9 }
}

uint64_t sub_244E7E368()
{
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

void sub_244E7E3E8()
{
  __asm { BR              X10 }
}

uint64_t sub_244E7E41C()
{
  sub_244EA1230();
  return swift_bridgeObjectRelease();
}

void sub_244E7E488()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_244EA1500();
  __asm { BR              X9 }
}

uint64_t sub_244E7E4C8()
{
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

uint64_t sub_244E7E548@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244E7EBA8();
  *a1 = result;
  return result;
}

uint64_t sub_244E7E574()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_244E7E59C + 4 * byte_244EA1DDF[*v0]))();
}

void sub_244E7E59C(_QWORD *a1@<X8>)
{
  *a1 = 0x6F65646976;
  a1[1] = 0xE500000000000000;
}

void sub_244E7E5B4(_QWORD *a1@<X8>)
{
  *a1 = 0x6D75626C61;
  a1[1] = 0xE500000000000000;
}

void sub_244E7E5CC(_QWORD *a1@<X8>)
{
  *a1 = 0x6E6F6974617473;
  a1[1] = 0xE700000000000000;
}

void sub_244E7E5E8(_QWORD *a1@<X8>)
{
  *a1 = 0x7473696C79616C70;
  a1[1] = 0xE800000000000000;
}

void sub_244E7E604(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_244E7E62C()
{
  if (qword_257425C00 != -1)
    swift_once();
  return sub_244EA1038();
}

BOOL LogLevel.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

BOOL sub_244E7E8D8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_244E7E8F0()
{
  return sub_244EA150C();
}

_QWORD *sub_244E7E91C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;

  v2 = *result != 1 && *result != 0;
  *(_QWORD *)a2 = *result == 1;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_244E7E950()
{
  sub_244EA1500();
  sub_244EA150C();
  return sub_244EA1518();
}

uint64_t sub_244E7E994()
{
  sub_244EA1500();
  sub_244EA150C();
  return sub_244EA1518();
}

uint64_t AppTarget.id.getter(uint64_t a1)
{
  uint64_t result;

  if (!a1)
    return 30324;
  if (a1 == 1)
    return 0x636973756DLL;
  result = sub_244EA14B8();
  __break(1u);
  return result;
}

uint64_t sub_244E7EA30@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;

  if (!*v1)
  {
    v2 = 0xE200000000000000;
    v3 = 30324;
LABEL_5:
    *a1 = v3;
    a1[1] = v2;
    return result;
  }
  if (*v1 == 1)
  {
    v2 = 0xE500000000000000;
    v3 = 0x636973756DLL;
    goto LABEL_5;
  }
  result = sub_244EA14B8();
  __break(1u);
  return result;
}

uint64_t static Constants.Config.RefreshFrequency.issue.getter()
{
  return 1800;
}

uint64_t static Constants.Config.RefreshFrequency.location.getter()
{
  return 3600;
}

uint64_t static Constants.Config.Synchronization.delay.getter()
{
  return 180;
}

unint64_t sub_244E7EAB0()
{
  unint64_t result;

  result = qword_257425C50;
  if (!qword_257425C50)
  {
    result = MEMORY[0x249528E58](&protocol conformance descriptor for LogLevel, &type metadata for LogLevel);
    atomic_store(result, (unint64_t *)&qword_257425C50);
  }
  return result;
}

unint64_t sub_244E7EAF8()
{
  unint64_t result;

  result = qword_257425C58;
  if (!qword_257425C58)
  {
    result = MEMORY[0x249528E58](&protocol conformance descriptor for AppTarget, &type metadata for AppTarget);
    atomic_store(result, (unint64_t *)&qword_257425C58);
  }
  return result;
}

uint64_t sub_244E7EB3C()
{
  return MEMORY[0x24BEE0D10];
}

ValueMetadata *type metadata accessor for LogLevel()
{
  return &type metadata for LogLevel;
}

ValueMetadata *type metadata accessor for AppTarget()
{
  return &type metadata for AppTarget;
}

ValueMetadata *type metadata accessor for Constants()
{
  return &type metadata for Constants;
}

ValueMetadata *type metadata accessor for Constants.Config()
{
  return &type metadata for Constants.Config;
}

ValueMetadata *type metadata accessor for Constants.Config.RefreshFrequency()
{
  return &type metadata for Constants.Config.RefreshFrequency;
}

ValueMetadata *type metadata accessor for Constants.Config.Synchronization()
{
  return &type metadata for Constants.Config.Synchronization;
}

uint64_t sub_244E7EBA8()
{
  unint64_t v0;

  v0 = sub_244EA147C();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ItemType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ItemType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244E7ECD8 + 4 * byte_244EA1DEE[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_244E7ED0C + 4 * byte_244EA1DE9[v4]))();
}

uint64_t sub_244E7ED0C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E7ED14(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244E7ED1CLL);
  return result;
}

uint64_t sub_244E7ED28(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244E7ED30);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_244E7ED34(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E7ED3C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E7ED48(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_244E7ED50(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ItemType()
{
  return &type metadata for ItemType;
}

uint64_t getEnumTagSinglePayload for CriteriaType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CriteriaType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244E7EE44 + 4 * byte_244EA1DF8[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_244E7EE78 + 4 * byte_244EA1DF3[v4]))();
}

uint64_t sub_244E7EE78(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E7EE80(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244E7EE88);
  return result;
}

uint64_t sub_244E7EE94(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244E7EE9CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_244E7EEA0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E7EEA8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_244E7EEB4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CriteriaType()
{
  return &type metadata for CriteriaType;
}

unint64_t sub_244E7EED4()
{
  unint64_t result;

  result = qword_257425C60;
  if (!qword_257425C60)
  {
    result = MEMORY[0x249528E58](&unk_244EA2060, &type metadata for CriteriaType);
    atomic_store(result, (unint64_t *)&qword_257425C60);
  }
  return result;
}

unint64_t sub_244E7EF1C()
{
  unint64_t result;

  result = qword_257425C68;
  if (!qword_257425C68)
  {
    result = MEMORY[0x249528E58](&unk_244EA2100, &type metadata for ItemType);
    atomic_store(result, (unint64_t *)&qword_257425C68);
  }
  return result;
}

double sub_244E7EF74@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  sub_244E80270(a1, (uint64_t)v10);
  if (!v2)
  {
    v5 = v18;
    *(_OWORD *)(a2 + 128) = v17;
    *(_OWORD *)(a2 + 144) = v5;
    *(_OWORD *)(a2 + 160) = v19;
    *(_QWORD *)(a2 + 176) = v20;
    v6 = v14;
    *(_OWORD *)(a2 + 64) = v13;
    *(_OWORD *)(a2 + 80) = v6;
    v7 = v16;
    *(_OWORD *)(a2 + 96) = v15;
    *(_OWORD *)(a2 + 112) = v7;
    v8 = v10[1];
    *(_OWORD *)a2 = v10[0];
    *(_OWORD *)(a2 + 16) = v8;
    result = *(double *)&v11;
    v9 = v12;
    *(_OWORD *)(a2 + 32) = v11;
    *(_OWORD *)(a2 + 48) = v9;
  }
  return result;
}

uint64_t sub_244E7EFF0()
{
  sub_244EA1500();
  sub_244EA1230();
  sub_244EA1230();
  return sub_244EA1518();
}

uint64_t sub_244E7F054()
{
  sub_244EA1230();
  return sub_244EA1230();
}

uint64_t sub_244E7F090()
{
  sub_244EA1500();
  sub_244EA1230();
  sub_244EA1230();
  return sub_244EA1518();
}

uint64_t sub_244E7F0F0(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_244EA14AC();
}

uint64_t initializeBufferWithCopyOfBuffer for MusicDeviceCriteria(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TVIssue(_QWORD *a1)
{
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = a1[7];
  if (result != 1)
  {
    if (result == 2)
      return result;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[9] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[17] != 1)
    swift_bridgeObjectRelease();
  result = a1[19];
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for TVIssue(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  v7 = a2 + 48;
  v9 = (_OWORD *)(a2 + 56);
  v8 = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v8 == 2)
  {
    v10 = *(_OWORD *)(v7 + 112);
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(v7 + 96);
    *(_OWORD *)(a1 + 160) = v10;
    *(_QWORD *)(a1 + 176) = *(_QWORD *)(v7 + 128);
    v11 = *(_OWORD *)(v7 + 48);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(v7 + 32);
    *(_OWORD *)(a1 + 96) = v11;
    v12 = *(_OWORD *)(v7 + 80);
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(v7 + 64);
    *(_OWORD *)(a1 + 128) = v12;
    v13 = *(_OWORD *)(v7 + 16);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)v7;
    *(_OWORD *)(a1 + 64) = v13;
  }
  else
  {
    *(_BYTE *)(a1 + 48) = *(_BYTE *)v7;
    if (v8 == 1)
    {
      *(_OWORD *)(a1 + 56) = *v9;
    }
    else
    {
      v14 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = v8;
      *(_QWORD *)(a1 + 64) = v14;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    v15 = *(_QWORD *)(a2 + 72);
    if (v15 == 1)
    {
      v16 = *(_OWORD *)(a2 + 88);
      *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
      *(_OWORD *)(a1 + 88) = v16;
      v17 = *(_OWORD *)(a2 + 120);
      *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
      *(_OWORD *)(a1 + 120) = v17;
    }
    else
    {
      v18 = *(_QWORD *)(a2 + 80);
      v19 = *(_QWORD *)(a2 + 88);
      *(_QWORD *)(a1 + 72) = v15;
      *(_QWORD *)(a1 + 80) = v18;
      v20 = *(_QWORD *)(a2 + 96);
      v21 = *(_QWORD *)(a2 + 104);
      *(_QWORD *)(a1 + 88) = v19;
      *(_QWORD *)(a1 + 96) = v20;
      v22 = *(_QWORD *)(a2 + 112);
      v23 = *(_QWORD *)(a2 + 120);
      *(_QWORD *)(a1 + 104) = v21;
      *(_QWORD *)(a1 + 112) = v22;
      v24 = *(_QWORD *)(a2 + 128);
      *(_QWORD *)(a1 + 120) = v23;
      *(_QWORD *)(a1 + 128) = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    v25 = *(_QWORD *)(a2 + 136);
    if (v25 != 1)
      v25 = swift_bridgeObjectRetain();
    *(_QWORD *)(a1 + 136) = v25;
    v26 = *(_QWORD *)(a2 + 152);
    if (v26 == 1)
    {
      v27 = *(_OWORD *)(a2 + 160);
      *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
      *(_OWORD *)(a1 + 160) = v27;
      *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
    }
    else
    {
      *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
      *(_QWORD *)(a1 + 152) = v26;
      v28 = *(_QWORD *)(a2 + 168);
      *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
      *(_QWORD *)(a1 + 168) = v28;
      *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  return a1;
}

uint64_t assignWithCopy for TVIssue(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
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
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  _OWORD *v30;
  uint64_t v31;
  __int128 *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 *v42;
  __int128 *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (_OWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = (_OWORD *)(a1 + 48);
  v8 = (_OWORD *)(a2 + 56);
  v7 = *(_QWORD *)(a2 + 56);
  v9 = (_OWORD *)(a2 + 48);
  if (v5 == 2)
  {
    if (v7 == 2)
    {
      *v6 = *v9;
      v10 = *(_OWORD *)(a2 + 64);
      v11 = *(_OWORD *)(a2 + 80);
      v12 = *(_OWORD *)(a2 + 112);
      *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
      *(_OWORD *)(a1 + 112) = v12;
      *(_OWORD *)(a1 + 64) = v10;
      *(_OWORD *)(a1 + 80) = v11;
      v13 = *(_OWORD *)(a2 + 128);
      v14 = *(_OWORD *)(a2 + 144);
      v15 = *(_OWORD *)(a2 + 160);
      *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
      *(_OWORD *)(a1 + 144) = v14;
      *(_OWORD *)(a1 + 160) = v15;
      *(_OWORD *)(a1 + 128) = v13;
      return a1;
    }
    *(_BYTE *)v6 = *(_BYTE *)v9;
    if (*(_QWORD *)v8 == 1)
    {
      *v4 = *v8;
    }
    else
    {
      *(_QWORD *)(a1 + 56) = *(_QWORD *)v8;
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    v23 = *(_QWORD *)(a2 + 72);
    if (v23 == 1)
    {
      v24 = *(_OWORD *)(a2 + 72);
      v25 = *(_OWORD *)(a2 + 88);
      v26 = *(_OWORD *)(a2 + 120);
      *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
      *(_OWORD *)(a1 + 120) = v26;
      *(_OWORD *)(a1 + 72) = v24;
      *(_OWORD *)(a1 + 88) = v25;
    }
    else
    {
      *(_QWORD *)(a1 + 72) = v23;
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
      *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
      *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
      *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
      *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
      *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    v27 = *(_QWORD *)(a2 + 136);
    if (v27 != 1)
      v27 = swift_bridgeObjectRetain();
    *(_QWORD *)(a1 + 136) = v27;
    if (*(_QWORD *)(a2 + 152) == 1)
    {
      v28 = *(_OWORD *)(a2 + 144);
      v29 = *(_OWORD *)(a2 + 160);
      *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
      *(_OWORD *)(a1 + 144) = v28;
      *(_OWORD *)(a1 + 160) = v29;
      return a1;
    }
LABEL_41:
    *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
    *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
    *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
    *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
    *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return a1;
  }
  if (v7 == 2)
  {
    sub_244E7FA9C((_QWORD *)(a1 + 48));
    *v6 = *v9;
    v16 = *(_OWORD *)(a2 + 112);
    v18 = *(_OWORD *)(a2 + 64);
    v17 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 112) = v16;
    *(_OWORD *)(a1 + 64) = v18;
    *(_OWORD *)(a1 + 80) = v17;
    v20 = *(_OWORD *)(a2 + 144);
    v19 = *(_OWORD *)(a2 + 160);
    v21 = *(_OWORD *)(a2 + 128);
    *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
    *(_OWORD *)(a1 + 144) = v20;
    *(_OWORD *)(a1 + 160) = v19;
    *(_OWORD *)(a1 + 128) = v21;
    return a1;
  }
  *(_BYTE *)v6 = *(_BYTE *)v9;
  v22 = *(_QWORD *)v8;
  if (v5 == 1)
  {
    if (v22 != 1)
    {
      *(_QWORD *)(a1 + 56) = v22;
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_23;
    }
    goto LABEL_16;
  }
  if (v22 == 1)
  {
    sub_244E7F9CC(a1 + 56);
LABEL_16:
    *v4 = *v8;
    goto LABEL_23;
  }
  *(_QWORD *)(a1 + 56) = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_23:
  v30 = (_OWORD *)(a1 + 72);
  v32 = (__int128 *)(a2 + 72);
  v31 = *(_QWORD *)(a2 + 72);
  if (*(_QWORD *)(a1 + 72) == 1)
  {
    if (v31 == 1)
    {
      v33 = *v32;
      v34 = *(_OWORD *)(a2 + 88);
      v35 = *(_OWORD *)(a2 + 120);
      *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
      *(_OWORD *)(a1 + 120) = v35;
      *v30 = v33;
      *(_OWORD *)(a1 + 88) = v34;
    }
    else
    {
      *(_QWORD *)(a1 + 72) = v31;
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
      *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
      *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
      *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
      *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
      *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v31 == 1)
  {
    sub_244E7FA00(a1 + 72);
    v36 = *(_OWORD *)(a2 + 120);
    v38 = *v32;
    v37 = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 120) = v36;
    *v30 = v38;
    *(_OWORD *)(a1 + 88) = v37;
  }
  else
  {
    *(_QWORD *)(a1 + 72) = v31;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  v39 = (uint64_t *)(a1 + 136);
  v40 = *(_QWORD *)(a2 + 136);
  if (*(_QWORD *)(a1 + 136) == 1)
  {
    if (v40 == 1)
    {
      v41 = 1;
LABEL_35:
      *v39 = v41;
      goto LABEL_38;
    }
    *v39 = v40;
    swift_bridgeObjectRetain();
  }
  else
  {
    if (v40 == 1)
    {
      sub_244E7FA34(a1 + 136);
      v41 = *(_QWORD *)(a2 + 136);
      goto LABEL_35;
    }
    *v39 = v40;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
LABEL_38:
  v42 = (__int128 *)(a1 + 144);
  v43 = (__int128 *)(a2 + 144);
  v44 = *(_QWORD *)(a2 + 152);
  if (*(_QWORD *)(a1 + 152) == 1)
  {
    if (v44 == 1)
    {
      v45 = *v43;
      v46 = *(_OWORD *)(a2 + 160);
      *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
      *v42 = v45;
      *(_OWORD *)(a1 + 160) = v46;
      return a1;
    }
    goto LABEL_41;
  }
  if (v44 == 1)
  {
    sub_244E7FA68(a1 + 144);
    v47 = *(_QWORD *)(a2 + 176);
    v48 = *(_OWORD *)(a2 + 160);
    *v42 = *v43;
    *(_OWORD *)(a1 + 160) = v48;
    *(_QWORD *)(a1 + 176) = v47;
  }
  else
  {
    *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
    *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

uint64_t sub_244E7F9CC(uint64_t a1)
{
  destroy for LocationCriteria();
  return a1;
}

uint64_t sub_244E7FA00(uint64_t a1)
{
  destroy for TVDeviceCriteria();
  return a1;
}

uint64_t sub_244E7FA34(uint64_t a1)
{
  destroy for MiscCriteria();
  return a1;
}

uint64_t sub_244E7FA68(uint64_t a1)
{
  destroy for TVContentCriteria();
  return a1;
}

_QWORD *sub_244E7FA9C(_QWORD *a1)
{
  destroy for TVCriteria(a1);
  return a1;
}

__n128 __swift_memcpy184_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __int128 v10;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  v5 = a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  result = (__n128)a2[8];
  v9 = a2[9];
  v10 = a2[10];
  *(_QWORD *)(a1 + 176) = *((_QWORD *)a2 + 22);
  *(_OWORD *)(a1 + 144) = v9;
  *(_OWORD *)(a1 + 160) = v10;
  *(__n128 *)(a1 + 128) = result;
  return result;
}

uint64_t assignWithTake for TVIssue(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  uint64_t v9;
  _OWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a1 + 56);
  v8 = (_OWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a2 + 56);
  v10 = (_OWORD *)(a2 + 48);
  if (v7 == 2)
    goto LABEL_4;
  if (v9 == 2)
  {
    sub_244E7FA9C((_QWORD *)(a1 + 48));
LABEL_4:
    v11 = *(_OWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 160) = v11;
    *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
    v12 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 96) = v12;
    v13 = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 128) = v13;
    v14 = *(_OWORD *)(a2 + 64);
    *v8 = *v10;
    *(_OWORD *)(a1 + 64) = v14;
    return a1;
  }
  *(_BYTE *)v8 = *(_BYTE *)v10;
  if (v7 == 1)
    goto LABEL_8;
  if (v9 == 1)
  {
    sub_244E7F9CC(a1 + 56);
LABEL_8:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_10;
  }
  *(_QWORD *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
LABEL_10:
  v15 = *(_QWORD *)(a2 + 72);
  if (*(_QWORD *)(a1 + 72) == 1)
  {
LABEL_13:
    v16 = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 88) = v16;
    v17 = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 120) = v17;
    goto LABEL_15;
  }
  if (v15 == 1)
  {
    sub_244E7FA00(a1 + 72);
    goto LABEL_13;
  }
  *(_QWORD *)(a1 + 72) = v15;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRelease();
LABEL_15:
  v18 = (uint64_t *)(a1 + 136);
  v19 = *(_QWORD *)(a2 + 136);
  if (*(_QWORD *)(a1 + 136) != 1)
  {
    if (v19 != 1)
    {
      *v18 = v19;
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    sub_244E7FA34(a1 + 136);
    v19 = 1;
  }
  *v18 = v19;
LABEL_20:
  if (*(_QWORD *)(a1 + 152) != 1)
  {
    v20 = *(_QWORD *)(a2 + 152);
    if (v20 != 1)
    {
      *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
      *(_QWORD *)(a1 + 152) = v20;
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_244E7FA68(a1 + 144);
  }
  v21 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v21;
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  return a1;
}

uint64_t getEnumTagSinglePayload for TVIssue(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 184))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TVIssue(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
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
      *(_BYTE *)(result + 184) = 1;
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
    *(_BYTE *)(result + 184) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TVIssue()
{
  return &type metadata for TVIssue;
}

unint64_t sub_244E7FE44()
{
  unint64_t result;

  result = qword_257425C70;
  if (!qword_257425C70)
  {
    result = MEMORY[0x249528E58](&unk_244EA215C, &type metadata for TVIssue);
    atomic_store(result, (unint64_t *)&qword_257425C70);
  }
  return result;
}

void sub_244E7FE88(char *a1)
{
  sub_244E8A568(*a1);
}

void sub_244E7FE94()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_244EA1500();
  __asm { BR              X9 }
}

uint64_t sub_244E7FEE4()
{
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

void sub_244E7FF58()
{
  __asm { BR              X10 }
}

uint64_t sub_244E7FF98()
{
  sub_244EA1230();
  return swift_bridgeObjectRelease();
}

void sub_244E7FFF8()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_244EA1500();
  __asm { BR              X9 }
}

uint64_t sub_244E80044()
{
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

uint64_t sub_244E800B8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244E80858();
  *a1 = result;
  return result;
}

uint64_t sub_244E800E4()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_244E80118 + 4 * byte_244EA2134[*v0]))();
}

void sub_244E80118(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "errorMessage");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void sub_244E8013C(_QWORD *a1@<X8>)
{
  *a1 = 0x656C61636F6CLL;
  a1[1] = 0xE600000000000000;
}

void sub_244E80154(_QWORD *a1@<X8>)
{
  *a1 = 0x6169726574697263;
  a1[1] = 0xE800000000000000;
}

uint64_t sub_244E80170()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244E801A4 + 4 * byte_244EA2138[*v0]))(0x746954726F727265, 0xEA0000000000656CLL);
}

uint64_t sub_244E801A4()
{
  return 0x73654D726F727265;
}

uint64_t sub_244E801C4()
{
  return 0x656C61636F6CLL;
}

uint64_t sub_244E801D8()
{
  return 0x6169726574697263;
}

uint64_t sub_244E801F0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244E80858();
  *a1 = result;
  return result;
}

void sub_244E80214(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_244E80220()
{
  sub_244E80530();
  return sub_244EA1530();
}

uint64_t sub_244E80248()
{
  sub_244E80530();
  return sub_244EA153C();
}

uint64_t sub_244E80270@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
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
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _BYTE v41[136];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257425C78);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244E80530();
  sub_244EA1524();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v18 = (uint64_t)a1;
  v7 = v5;
  LOBYTE(v19) = 0;
  v8 = v4;
  v9 = v46;
  *(_QWORD *)&v42 = sub_244EA1488();
  *((_QWORD *)&v42 + 1) = v10;
  LOBYTE(v19) = 1;
  *(_QWORD *)&v43 = sub_244EA1488();
  *((_QWORD *)&v43 + 1) = v11;
  LOBYTE(v19) = 2;
  *(_QWORD *)&v44 = sub_244EA1488();
  *((_QWORD *)&v44 + 1) = v12;
  v31 = 3;
  sub_244E80574();
  sub_244EA1494();
  v25 = v38;
  v26 = v39;
  *(_QWORD *)&v27 = v40;
  v21 = v34;
  v22 = v35;
  v23 = v36;
  v24 = v37;
  v19 = v32;
  v20 = v33;
  nullsub_1(&v19);
  sub_244E805DC((uint64_t)&v19, (uint64_t)v41);
  (*(void (**)(_QWORD, uint64_t))(v7 + 8))(0, v8);
  sub_244E805DC((uint64_t)v41, (uint64_t)&v45);
  v19 = v42;
  v20 = v43;
  v21 = v44;
  sub_244E805DC((uint64_t)v41, (uint64_t)&v22);
  result = __swift_destroy_boxed_opaque_existential_1(v18);
  v13 = v28;
  *(_OWORD *)(v9 + 128) = v27;
  *(_OWORD *)(v9 + 144) = v13;
  *(_OWORD *)(v9 + 160) = v29;
  *(_QWORD *)(v9 + 176) = v30;
  v14 = v24;
  *(_OWORD *)(v9 + 64) = v23;
  *(_OWORD *)(v9 + 80) = v14;
  v15 = v26;
  *(_OWORD *)(v9 + 96) = v25;
  *(_OWORD *)(v9 + 112) = v15;
  v16 = v20;
  *(_OWORD *)v9 = v19;
  *(_OWORD *)(v9 + 16) = v16;
  v17 = v22;
  *(_OWORD *)(v9 + 32) = v21;
  *(_OWORD *)(v9 + 48) = v17;
  return result;
}

unint64_t sub_244E80530()
{
  unint64_t result;

  result = qword_257425C80;
  if (!qword_257425C80)
  {
    result = MEMORY[0x249528E58](&unk_244EA22E8, &type metadata for TVIssue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425C80);
  }
  return result;
}

unint64_t sub_244E80574()
{
  unint64_t result;

  result = qword_257425C88;
  if (!qword_257425C88)
  {
    result = MEMORY[0x249528E58](&unk_244EA2FD4, &type metadata for TVCriteria);
    atomic_store(result, (unint64_t *)&qword_257425C88);
  }
  return result;
}

double sub_244E805B8(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)a1 = xmmword_244EA2340;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_QWORD *)(a1 + 128) = 0;
  return result;
}

uint64_t sub_244E805DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257425C90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t getEnumTagSinglePayload for TVIssue.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TVIssue.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244E80700 + 4 * byte_244EA2141[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_244E80734 + 4 * byte_244EA213C[v4]))();
}

uint64_t sub_244E80734(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E8073C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244E80744);
  return result;
}

uint64_t sub_244E80750(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244E80758);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_244E8075C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E80764(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TVIssue.CodingKeys()
{
  return &type metadata for TVIssue.CodingKeys;
}

unint64_t sub_244E80784()
{
  unint64_t result;

  result = qword_257425C98;
  if (!qword_257425C98)
  {
    result = MEMORY[0x249528E58](&unk_244EA22C0, &type metadata for TVIssue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425C98);
  }
  return result;
}

unint64_t sub_244E807CC()
{
  unint64_t result;

  result = qword_257425CA0;
  if (!qword_257425CA0)
  {
    result = MEMORY[0x249528E58](&unk_244EA21F8, &type metadata for TVIssue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425CA0);
  }
  return result;
}

unint64_t sub_244E80814()
{
  unint64_t result;

  result = qword_257425CA8;
  if (!qword_257425CA8)
  {
    result = MEMORY[0x249528E58](&unk_244EA2220, &type metadata for TVIssue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425CA8);
  }
  return result;
}

uint64_t sub_244E80858()
{
  unint64_t v0;

  v0 = sub_244EA147C();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_244E808A0()
{
  uint64_t v0;

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Network()
{
  return objc_opt_self();
}

uint64_t sub_244E808EC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Util()
{
  return objc_opt_self();
}

uint64_t sub_244E8091C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;

  v1 = v0[1];
  if ((v1 & 0x2000000000000000) == 0)
  {
    if ((*v0 & 0xFFFFFFFFFFFFLL) != 0)
    {
LABEL_5:
      sub_244EA1248();
      return sub_244EA1284();
    }
    __break(1u);
  }
  if ((v1 & 0xF00000000000000) != 0)
    goto LABEL_5;
  __break(1u);
  return result;
}

uint64_t sub_244E80970(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
    return sub_244EA12FC();
  else
    return 0;
}

uint64_t sub_244E809B0(unint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  swift_bridgeObjectRetain();
  sub_244EA13B0();
  v13 = v12;
  swift_bridgeObjectRelease();
  if ((v13 & 0x1000000000000000) != 0)
    goto LABEL_25;
  swift_bridgeObjectRetain();
  sub_244EA13B0();
  v15 = v14;
  result = swift_bridgeObjectRelease();
  if ((v15 & 0x1000000000000000) != 0)
    goto LABEL_25;
  v17 = (a5 >> 59) & 1;
  if ((a6 & 0x1000000000000000) == 0)
    LOBYTE(v17) = 1;
  v18 = 4 << v17;
  v19 = a1;
  if ((a1 & 0xC) == 4 << v17)
  {
    result = sub_244E80D40(a1, a5, a6);
    v19 = result;
  }
  v40 = a3;
  v20 = a2;
  v21 = a5 & 0x800000000000000;
  if ((a6 & 0x1000000000000000) != 0)
  {
    v23 = a6 & 0x2000000000000000;
    v25 = a5 & 0xFFFFFFFFFFFFLL;
    v24 = HIBYTE(a6) & 0xF;
    if ((a6 & 0x2000000000000000) != 0)
      v32 = HIBYTE(a6) & 0xF;
    else
      v32 = a5 & 0xFFFFFFFFFFFFLL;
    if (v32 < v19 >> 16)
      goto LABEL_43;
    result = sub_244EA12C0();
    v22 = result;
    if (v21)
      v26 = 7;
    else
      v26 = 11;
  }
  else
  {
    v22 = v19 >> 16;
    v23 = a6 & 0x2000000000000000;
    v24 = HIBYTE(a6) & 0xF;
    v25 = a5 & 0xFFFFFFFFFFFFLL;
    v26 = 7;
  }
  if (!v23)
    v24 = v25;
  v27 = 4 << (v21 >> 59);
  v28 = v26 | (v24 << 16);
  a2 = v20;
  if ((a6 & 0x1000000000000000) == 0)
    v27 = 8;
  v29 = v20;
  if ((v20 & 0xC) == v27)
  {
    v33 = v20;
    v34 = v22;
    result = sub_244E80D40(v33, a5, a6);
    v22 = v34;
    v29 = result;
  }
  if ((v26 & 0xC) == v18)
  {
    v35 = v26 | (v24 << 16);
    v36 = v22;
    result = sub_244E80D40(v35, a5, a6);
    v22 = v36;
    v28 = result;
    if ((a6 & 0x1000000000000000) == 0)
    {
LABEL_17:
      v30 = (v28 >> 16) - (v29 >> 16);
      if ((a4 & 0x1000000000000000) == 0)
        goto LABEL_18;
      goto LABEL_37;
    }
  }
  else if ((a6 & 0x1000000000000000) == 0)
  {
    goto LABEL_17;
  }
  if (v24 < v29 >> 16)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (v24 >= v28 >> 16)
  {
    v37 = v22;
    v38 = sub_244EA12C0();
    v22 = v37;
    v30 = v38;
    if ((a4 & 0x1000000000000000) == 0)
    {
LABEL_18:
      if ((a4 & 0x2000000000000000) != 0)
      {
        result = HIBYTE(a4) & 0xF;
        v31 = v22 + result;
        if (!__OFADD__(v22, result))
          goto LABEL_23;
      }
      else
      {
        result = v40 & 0xFFFFFFFFFFFFLL;
        v31 = v22 + (v40 & 0xFFFFFFFFFFFFLL);
        if (!__OFADD__(v22, v40 & 0xFFFFFFFFFFFFLL))
          goto LABEL_23;
      }
      goto LABEL_39;
    }
LABEL_37:
    v39 = v22;
    result = sub_244EA129C();
    v31 = v39 + result;
    if (!__OFADD__(v39, result))
    {
LABEL_23:
      result = v31 + v30;
      if (!__OFADD__(v31, v30))
      {
        MEMORY[0x2495287A4](result);
LABEL_25:
        sub_244EA1314();
        sub_244E81C84();
        sub_244EA1260();
        swift_bridgeObjectRelease();
        sub_244EA1260();
        sub_244E80CF4(a2, a5, a6);
        sub_244EA1260();
        swift_bridgeObjectRelease();
        return 0;
      }
      goto LABEL_40;
    }
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

unint64_t sub_244E80CF4(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v3 = a2 & 0xFFFFFFFFFFFFLL;
  if (4 * v3 >= result >> 14)
    return sub_244EA1314();
  __break(1u);
  return result;
}

uint64_t sub_244E80D40(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_244EA12D8();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x249528840](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_244E80DB8(uint64_t result)
{
  char v1;

  if (result)
  {
    if (result < 0)
    {
      __break(1u);
    }
    else
    {
      result = sub_244EA1254();
      if ((v1 & 1) == 0)
        return sub_244EA120C();
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_244E80E2C(uint64_t a1, unint64_t a2)
{
  char v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  char v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  char v16;
  char v17;
  uint64_t v18;
  unint64_t v19;

  sub_244E81524();
  if ((sub_244EA1404() & 1) == 0)
    goto LABEL_31;
  if (sub_244EA123C() == 1)
  {
    v4 = 1;
    return v4 & 1;
  }
  v18 = a1;
  v19 = a2;
  swift_bridgeObjectRetain();
  result = sub_244EA12E4();
  v17 = result;
  if ((result & 1) == 0)
  {
LABEL_16:
    swift_bridgeObjectRetain();
    v11 = sub_244EA12F0();
    swift_bridgeObjectRelease();
    if ((v11 & 1) != 0)
    {
      sub_244E8091C();
      swift_bridgeObjectRelease();
      v13 = v18;
      v12 = v19;
      swift_bridgeObjectRetain();
      v14 = sub_244EA12F0();
      result = swift_bridgeObjectRelease();
      if ((v14 & 1) != 0)
      {
        do
        {
          if ((v12 & 0x2000000000000000) != 0)
          {
            if ((v12 & 0xF00000000000000) == 0)
              goto LABEL_36;
          }
          else if ((v13 & 0xFFFFFFFFFFFFLL) == 0)
          {
            __break(1u);
            break;
          }
          sub_244EA1248();
          sub_244EA1284();
          swift_bridgeObjectRelease();
          v13 = v18;
          v12 = v19;
          swift_bridgeObjectRetain();
          v15 = sub_244EA12F0();
          result = swift_bridgeObjectRelease();
        }
        while ((v15 & 1) != 0);
      }
    }
    if ((sub_244EA1404() & 1) == 0)
    {
      if ((v17 & 1) != 0)
      {
        if ((v11 & 1) != 0)
          v16 = sub_244EA1404();
        else
          v16 = sub_244EA12F0();
        goto LABEL_34;
      }
      if ((v11 & 1) != 0)
      {
        v16 = sub_244EA12E4();
LABEL_34:
        v4 = v16;
        swift_bridgeObjectRelease();
        return v4 & 1;
      }
    }
    swift_bridgeObjectRelease();
LABEL_31:
    v4 = 0;
    return v4 & 1;
  }
  v6 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v6 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v6)
    goto LABEL_37;
  result = sub_244E80970(a1, a2);
  if (v7)
  {
    sub_244E80DB8(1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v8 = sub_244EA12E4();
    result = swift_bridgeObjectRelease();
    if ((v8 & 1) != 0)
    {
      while (1)
      {
        if ((a2 & 0x2000000000000000) != 0)
        {
          if ((a2 & 0xF00000000000000) == 0)
            goto LABEL_35;
        }
        else if ((a1 & 0xFFFFFFFFFFFFLL) == 0)
        {
          __break(1u);
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
        sub_244EA12FC();
        result = sub_244EA1254();
        if ((v9 & 1) != 0)
          goto LABEL_38;
        sub_244EA120C();
        swift_bridgeObjectRelease();
        a1 = v18;
        a2 = v19;
        swift_bridgeObjectRetain();
        v10 = sub_244EA12E4();
        result = swift_bridgeObjectRelease();
        if ((v10 & 1) == 0)
          goto LABEL_16;
      }
    }
    goto LABEL_16;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_244E811F8(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;

  v44 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257425D48);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v7 - 8) + 64), v7);
  v45 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_244EA0FCC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(v10 + 64), v9);
  v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = a1;
  v47 = a2;
  sub_244EA0FC0();
  v13 = sub_244E81524();
  v14 = sub_244EA13D4();
  v16 = v15;
  v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v12, v9);
  v46 = a3;
  v47 = v44;
  sub_244EA0FC0();
  v44 = v13;
  v18 = sub_244EA13D4();
  v20 = v19;
  v17(v12, v9);
  v21 = 0xE000000000000000;
  v50 = 0;
  v51 = 0xE000000000000000;
  v22 = HIBYTE(v16) & 0xF;
  if ((v16 & 0x2000000000000000) == 0)
    v22 = v14 & 0xFFFFFFFFFFFFLL;
  v46 = v14;
  v47 = v16;
  v48 = 0;
  v49 = v22;
  v23 = sub_244EA1290();
  if (v24)
  {
    v25 = v23;
    v26 = v24;
    do
    {
      if ((sub_244EA11A0() & 1) == 0)
        MEMORY[0x2495287F8](v25, v26);
      swift_bridgeObjectRelease();
      v25 = sub_244EA1290();
      v26 = v27;
    }
    while (v27);
    v29 = v50;
    v28 = v51;
  }
  else
  {
    v29 = 0;
    v28 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  v50 = 0;
  v51 = 0xE000000000000000;
  v30 = HIBYTE(v20) & 0xF;
  if ((v20 & 0x2000000000000000) == 0)
    v30 = v18 & 0xFFFFFFFFFFFFLL;
  v46 = v18;
  v47 = v20;
  v48 = 0;
  v49 = v30;
  v31 = sub_244EA1290();
  v33 = v32;
  if (v32)
  {
    v34 = v31;
    do
    {
      if ((sub_244EA11A0() & 1) == 0)
        MEMORY[0x2495287F8](v34, v33);
      swift_bridgeObjectRelease();
      v34 = sub_244EA1290();
      v33 = v35;
    }
    while (v35);
    v33 = v50;
    v21 = v51;
  }
  swift_bridgeObjectRelease();
  v46 = v29;
  v47 = v28;
  v50 = v33;
  v51 = v21;
  v36 = sub_244EA10F8();
  v37 = 1;
  v38 = (uint64_t)v45;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v45, 1, 1, v36);
  v39 = sub_244EA13F8();
  sub_244E81568(v38);
  if (v39)
  {
    v40 = sub_244EA1200();
    v42 = v41;
    swift_bridgeObjectRelease();
    sub_244EA1200();
    swift_bridgeObjectRelease();
    v37 = sub_244E80E2C(v40, v42);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v37 & 1;
}

unint64_t sub_244E81524()
{
  unint64_t result;

  result = qword_257425D50;
  if (!qword_257425D50)
  {
    result = MEMORY[0x249528E58](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257425D50);
  }
  return result;
}

uint64_t sub_244E81568(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257425D48);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_244E815A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned __int8 a4@<W3>, _QWORD *a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v28 = a5;
  v9 = sub_244EA0FCC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(v10 + 64), v9);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = a2;
  v45 = a3;
  sub_244EA0FB4();
  v39 = sub_244E81524();
  v13 = sub_244EA13BC();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v14 = 0;
  v15 = *(_QWORD *)(v13 + 16);
  v16 = v13 + 32;
  v33 = v13;
  v34 = (uint64_t *)(a1 + 80);
  v17 = *(_QWORD *)(a1 + 16);
  v36 = a4;
  v18 = v15;
  v31 = v15;
  v32 = a1;
  v29 = v17;
  v30 = v13 + 32;
  while (1)
  {
    if (*(_QWORD *)(v13 + 16) < v18)
    {
      __break(1u);
      JUMPOUT(0x244E819DCLL);
    }
    v44 = v13;
    v45 = v16;
    v46 = 0;
    v47 = (2 * v18) | 1;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257425D68);
    sub_244E81CC8();
    v40 = sub_244EA11AC();
    v20 = v19;
    swift_bridgeObjectRelease();
    if (v17)
      break;
    swift_bridgeObjectRelease();
    if (v14 == v15)
      goto LABEL_13;
LABEL_11:
    ++v14;
    v18 = v15 - v14;
    if ((uint64_t)(v15 - v14) < 0)
    {
      __break(1u);
      JUMPOUT(0x244E81934);
    }
  }
  v35 = v14;
  swift_bridgeObjectRetain();
  v21 = v34;
  v22 = v17;
  do
  {
    v23 = *(v21 - 6);
    v37 = *(v21 - 4);
    v38 = v23;
    v41 = *((unsigned __int8 *)v21 - 16);
    v24 = *v21;
    v44 = *(v21 - 1);
    v45 = v24;
    v42 = v40;
    v43 = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (!sub_244EA13EC())
      __asm { BR              X8 }
    v21 += 7;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    --v22;
  }
  while (v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v13 = v33;
  v14 = v35;
  v16 = v30;
  v15 = v31;
  v17 = v29;
  if (v35 != v31)
    goto LABEL_11;
LABEL_13:
  result = swift_bridgeObjectRelease();
  v41 = 0;
  v26 = v28;
  *v28 = 0;
  v26[1] = 0;
  v26[2] = 0;
  v26[3] = 0;
  v26[4] = v41;
  v26[5] = 0;
  v26[6] = 0;
  return result;
}

id sub_244E81A08(uint64_t a1, void (*a2)(_QWORD, unint64_t, unint64_t))
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v3 = objc_msgSend((id)objc_opt_self(), sel_sharedSession);
  v4 = objc_msgSend(v3, sel_configuration);

  v5 = objc_msgSend(v4, sel_URLCache);
  if (!v5
    || (v6 = (void *)sub_244EA0F60(),
        v7 = objc_msgSend(v5, sel_cachedResponseForRequest_, v6),
        v5,
        v6,
        !v7))
  {
    sub_244EA1428();
    swift_bridgeObjectRelease();
    sub_244EA0F78();
    sub_244E81D14();
    sub_244EA14A0();
    sub_244EA1278();
    swift_bridgeObjectRelease();
    a2(0, 0xD000000000000017, 0x8000000244EA4730);
    swift_bridgeObjectRelease();
    return 0;
  }
  return v7;
}

uint64_t sub_244E81B70(unint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;

  sub_244E81C40();
  v8 = (_QWORD *)sub_244EA1368();
  if (v8[2])
  {
    v9 = v8[4];
    v10 = v8[5];
    swift_bridgeObjectRelease();
    return sub_244E809B0(v9, v10, a3, a4, a1, a2);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  return a1;
}

unint64_t sub_244E81C40()
{
  unint64_t result;

  result = qword_257425D58;
  if (!qword_257425D58)
  {
    result = MEMORY[0x249528E58](MEMORY[0x24BEE0D40], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257425D58);
  }
  return result;
}

unint64_t sub_244E81C84()
{
  unint64_t result;

  result = qword_257425D60;
  if (!qword_257425D60)
  {
    result = MEMORY[0x249528E58](MEMORY[0x24BEE1E20], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_257425D60);
  }
  return result;
}

unint64_t sub_244E81CC8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257425D70;
  if (!qword_257425D70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257425D68);
    result = MEMORY[0x249528E58](MEMORY[0x24BEE2170], v1);
    atomic_store(result, (unint64_t *)&qword_257425D70);
  }
  return result;
}

unint64_t sub_244E81D14()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257425D78;
  if (!qword_257425D78)
  {
    v1 = sub_244EA0F78();
    result = MEMORY[0x249528E58](MEMORY[0x24BDCB0E8], v1);
    atomic_store(result, (unint64_t *)&qword_257425D78);
  }
  return result;
}

double sub_244E81D5C@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;
  uint64_t v8;

  sub_244E82474(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(_QWORD *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_244E81DA8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[3];
  uint64_t v6;
  _OWORD v7[3];
  uint64_t v8;

  v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  v5[2] = *(_OWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 48);
  return sub_244E82164((uint64_t)v5, (uint64_t)v7) & 1;
}

void sub_244E81E00(char *a1)
{
  sub_244E8AECC(*a1);
}

void sub_244E81E0C()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_244EA1500();
  __asm { BR              X9 }
}

uint64_t sub_244E81E54()
{
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

void sub_244E81EB8()
{
  __asm { BR              X10 }
}

uint64_t sub_244E81EF0()
{
  sub_244EA1230();
  return swift_bridgeObjectRelease();
}

void sub_244E81F40()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_244EA1500();
  __asm { BR              X9 }
}

uint64_t sub_244E81F84()
{
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

uint64_t sub_244E81FE8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244E828D0();
  *a1 = result;
  return result;
}

uint64_t sub_244E82014()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_244E82040 + 4 * byte_244EA23A0[*v0]))();
}

void sub_244E82040(_QWORD *a1@<X8>)
{
  *a1 = 2036625250;
  a1[1] = 0xE400000000000000;
}

void sub_244E82054(_QWORD *a1@<X8>)
{
  *a1 = 0x657079546D657469;
  a1[1] = 0xE800000000000000;
}

void sub_244E82070(_QWORD *a1@<X8>)
{
  *a1 = 0x656C61636F6CLL;
  a1[1] = 0xE600000000000000;
}

uint64_t sub_244E82088()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244E820B4 + 4 * byte_244EA23A4[*v0]))(0x656C746974, 0xE500000000000000);
}

uint64_t sub_244E820B4()
{
  return 2036625250;
}

uint64_t sub_244E820C4()
{
  return 0x657079546D657469;
}

uint64_t sub_244E820DC()
{
  return 0x656C61636F6CLL;
}

uint64_t sub_244E820F0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244E828D0();
  *a1 = result;
  return result;
}

uint64_t sub_244E82114()
{
  sub_244E826E8();
  return sub_244EA1530();
}

uint64_t sub_244E8213C()
{
  sub_244E826E8();
  return sub_244EA153C();
}

uint64_t sub_244E82164(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  char v5;
  uint64_t result;
  BOOL v7;
  char v8;
  int v9;
  int v10;
  char v11;

  v4 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v4 || (v5 = sub_244EA14AC(), result = 0, (v5 & 1) != 0))
  {
    v7 = *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24);
    if (v7 || (v8 = sub_244EA14AC(), result = 0, (v8 & 1) != 0))
    {
      v9 = *(unsigned __int8 *)(a1 + 32);
      v10 = *(unsigned __int8 *)(a2 + 32);
      if (v9 == 5)
      {
        if (v10 != 5)
          return 0;
      }
      else
      {
        if (v10 == 5)
          return 0;
        sub_244E8AD5C(v9);
        if ((v11 & 1) == 0)
          return 0;
      }
      if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(a2 + 40) && *(_QWORD *)(a1 + 48) == *(_QWORD *)(a2 + 48))
        return 1;
      else
        return sub_244EA14AC();
    }
  }
  return result;
}

uint64_t destroy for MusicMessage()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MusicMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MusicMessage(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for MusicMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MusicMessage(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MusicMessage(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicMessage()
{
  return &type metadata for MusicMessage;
}

uint64_t sub_244E82474@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
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
  char v24;
  char v25;
  char v26;
  char v27;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257425D80);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244E826E8();
  sub_244EA1524();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v27 = 0;
  v10 = sub_244EA1488();
  v23 = v6;
  v12 = v11;
  v21 = v10;
  v26 = 1;
  swift_bridgeObjectRetain();
  v13 = sub_244EA1488();
  v15 = v14;
  v20 = v13;
  v25 = 2;
  swift_bridgeObjectRetain();
  sub_244EA1488();
  sub_244EA1200();
  v22 = v16;
  swift_bridgeObjectRelease();
  LODWORD(v22) = sub_244E7EBA8();
  v24 = 3;
  v17 = sub_244EA1488();
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v21;
  *(_QWORD *)(a2 + 8) = v12;
  *(_QWORD *)(a2 + 16) = v20;
  *(_QWORD *)(a2 + 24) = v15;
  *(_BYTE *)(a2 + 32) = v22;
  *(_QWORD *)(a2 + 40) = v17;
  *(_QWORD *)(a2 + 48) = v19;
  return result;
}

unint64_t sub_244E826E8()
{
  unint64_t result;

  result = qword_257425D88;
  if (!qword_257425D88)
  {
    result = MEMORY[0x249528E58](&unk_244EA2518, &type metadata for MusicMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425D88);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for MusicMessage.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244E82778 + 4 * byte_244EA23AD[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_244E827AC + 4 * byte_244EA23A8[v4]))();
}

uint64_t sub_244E827AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E827B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244E827BCLL);
  return result;
}

uint64_t sub_244E827C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244E827D0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_244E827D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E827DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MusicMessage.CodingKeys()
{
  return &type metadata for MusicMessage.CodingKeys;
}

unint64_t sub_244E827FC()
{
  unint64_t result;

  result = qword_257425D90;
  if (!qword_257425D90)
  {
    result = MEMORY[0x249528E58](&unk_244EA24F0, &type metadata for MusicMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425D90);
  }
  return result;
}

unint64_t sub_244E82844()
{
  unint64_t result;

  result = qword_257425D98;
  if (!qword_257425D98)
  {
    result = MEMORY[0x249528E58](&unk_244EA2428, &type metadata for MusicMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425D98);
  }
  return result;
}

unint64_t sub_244E8288C()
{
  unint64_t result;

  result = qword_257425DA0;
  if (!qword_257425DA0)
  {
    result = MEMORY[0x249528E58](&unk_244EA2450, &type metadata for MusicMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425DA0);
  }
  return result;
}

uint64_t sub_244E828D0()
{
  unint64_t v0;

  v0 = sub_244EA147C();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

Swift::String __swiftcall String.noBreakingSpaced()()
{
  uint64_t v0;
  void *v1;
  Swift::String result;

  sub_244E81524();
  v0 = sub_244EA13E0();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

unsigned __int8 *sub_244E8298C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int16 v25;
  unsigned __int8 *v26;
  char v27;
  int v28;
  char v29;
  char v30;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;

  v4 = sub_244EA0FCC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(v5 + 64), v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = a1;
  v38 = a2;
  v35 = 44;
  v36 = 0xE100000000000000;
  sub_244E81524();
  v8 = sub_244EA13C8();
  v9 = *(_QWORD *)(v8 + 16);
  if (v9)
  {
    v32 = v7;
    v33 = v5;
    v34 = v4;
    swift_bridgeObjectRetain();
    v10 = (uint64_t *)(v8 + 40);
    while (1)
    {
      v11 = *(v10 - 1);
      v12 = *v10;
      v37 = v11;
      v38 = v12;
      v35 = 0x6567612D78616DLL;
      v36 = 0xE700000000000000;
      swift_bridgeObjectRetain();
      if ((sub_244EA1404() & 1) != 0)
        break;
      v10 += 2;
      swift_bridgeObjectRelease();
      if (!--v9)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease_n();
    v37 = v11;
    v38 = v12;
    v20 = v32;
    sub_244EA0FC0();
    v21 = sub_244EA13D4();
    v23 = v22;
    (*(void (**)(char *, uint64_t))(v33 + 8))(v20, v34);
    swift_bridgeObjectRelease();
    v37 = v21;
    v38 = v23;
    v35 = 0x3D6567612D78616DLL;
    v36 = 0xE800000000000000;
    sub_244E81C40();
    sub_244EA135C();
    swift_bridgeObjectRelease();
    v13 = v39;
    v15 = v40;
    v17 = v41;
    v19 = v42;
  }
  else
  {
LABEL_6:
    swift_bridgeObjectRelease();
    v13 = MEMORY[0x249528930](0, 0xE000000000000000);
    v15 = v14;
    v17 = v16;
    v19 = v18;
  }
  if ((v15 ^ v13) >> 14)
  {
    v24 = sub_244E834C0(v13, v15, v17, v19, 10);
    if ((v25 & 0x100) != 0)
    {
      v26 = sub_244E82C34(v13, v15, v17, v19, 10);
      v30 = v29;
      swift_bridgeObjectRelease();
      v28 = v30 & 1;
    }
    else
    {
      v26 = (unsigned __int8 *)v24;
      v27 = v25;
      swift_bridgeObjectRelease();
      v28 = v27 & 1;
    }
    if (v28)
      return 0;
    else
      return v26;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

unsigned __int8 *sub_244E82C34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  sub_244E81C84();
  swift_bridgeObjectRetain();
  v7 = sub_244EA1308();
  v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v10 = HIBYTE(v8) & 0xF;
    v15 = v7;
    v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  v7 = sub_244E82FA0();
  v12 = v11;
  swift_bridgeObjectRelease();
  v8 = v12;
  if ((v12 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = (unsigned __int8 *)sub_244EA1434();
  }
LABEL_7:
  v13 = sub_244E82D24(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13;
}

unsigned __int8 *sub_244E82D24(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 *v19;
  unsigned int v20;
  char v21;
  uint64_t v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  uint64_t v29;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  v13 = 0;
                  if (v11 < 0x61 || v11 >= v8)
                    return (unsigned __int8 *)v13;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v14 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v14 - (v11 + v12);
              if (__OFSUB__(v14, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_66;
    }
    if (a2)
    {
      v23 = a3 + 48;
      v24 = a3 + 55;
      v25 = a3 + 87;
      if (a3 > 10)
      {
        v23 = 58;
      }
      else
      {
        v25 = 97;
        v24 = 65;
      }
      if (result)
      {
        v26 = 0;
        do
        {
          v27 = *result;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              v13 = 0;
              if (v27 < 0x61 || v27 >= v25)
                return (unsigned __int8 *)v13;
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          v29 = v26 * a3;
          if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63)
            return 0;
          v26 = v29 + (v27 + v28);
          if (__OFADD__(v29, (v27 + v28)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v29 + (v27 + v28));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  v15 = a2 - 1;
  if (a2 == 1)
    return 0;
  v16 = a3 + 48;
  v17 = a3 + 55;
  v18 = a3 + 87;
  if (a3 > 10)
  {
    v16 = 58;
  }
  else
  {
    v18 = 97;
    v17 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v19 = result + 1;
  do
  {
    v20 = *v19;
    if (v20 < 0x30 || v20 >= v16)
    {
      if (v20 < 0x41 || v20 >= v17)
      {
        v13 = 0;
        if (v20 < 0x61 || v20 >= v18)
          return (unsigned __int8 *)v13;
        v21 = -87;
      }
      else
      {
        v21 = -55;
      }
    }
    else
    {
      v21 = -48;
    }
    v22 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v22 + (v20 + v21);
    if (__OFADD__(v22, (v20 + v21)))
      return 0;
    ++v19;
    --v15;
  }
  while (v15);
  return (unsigned __int8 *)v9;
}

uint64_t sub_244E82FA0()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_244EA1314();
  v4 = sub_244E8301C(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_244E8301C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_244E83160(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_244E8324C(v9, 0);
      v12 = sub_244E832B0((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x2495287B0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x2495287B0);
LABEL_9:
      sub_244EA1434();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x2495287B0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_244E83160(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_244E80D40(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_244E80D40(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_244EA12C0();
  }
  __break(1u);
  return result;
}

_QWORD *sub_244E8324C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257425DA8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_244E832B0(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_244E80D40(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_244EA12CC();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_244EA1434();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_244E80D40(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_244EA12A8();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_244E834C0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t result;
  char v13;
  _QWORD v14[2];
  char v15;

  if ((a4 & 0x1000000000000000) != 0)
  {
    result = 0;
    goto LABEL_8;
  }
  if ((a4 & 0x2000000000000000) != 0)
  {
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    v11 = v14;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    v11 = (_QWORD *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    v11 = (_QWORD *)sub_244EA1434();
  }
  result = sub_244E83594((uint64_t)v11, a1, a2, a3, a4, a5);
  if (!v5)
  {
    v15 = v13 & 1;
LABEL_8:
    LOBYTE(v14[0]) = (a4 & 0x1000000000000000) != 0;
  }
  return result;
}

uint64_t sub_244E83594(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unsigned __int8 *v19;
  int v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  uint64_t v24;
  unsigned __int8 *v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 *v34;
  uint64_t v35;
  unsigned int v36;
  char v37;
  uint64_t v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  uint64_t v42;
  unsigned int v43;
  char v44;
  uint64_t v45;

  v10 = a2;
  v11 = result;
  v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0)
    LOBYTE(v12) = 1;
  v13 = 4 << v12;
  v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    result = sub_244E80D40(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      v15 = a2 >> 16;
      if (v14 != v13)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0)
    v16 = HIBYTE(a5) & 0xF;
  if (v16 < a2 >> 16)
    goto LABEL_95;
  result = sub_244EA12C0();
  v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    result = sub_244E80D40(v10, a4, a5);
    v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    result = sub_244E80D40(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0)
      goto LABEL_8;
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0)
    v17 = a4 & 0xFFFFFFFFFFFFLL;
  if (v17 < v10 >> 16)
    goto LABEL_91;
  if (v17 < a3 >> 16)
  {
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  result = sub_244EA12C0();
LABEL_21:
  v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_90;
  }
  if (v18 < v15)
  {
LABEL_90:
    __break(1u);
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11)
    v19 = 0;
  v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        v31 = a6 + 48;
        v32 = a6 + 55;
        v33 = a6 + 87;
        if (a6 > 10)
        {
          v31 = 58;
        }
        else
        {
          v33 = 97;
          v32 = 65;
        }
        if (v19)
        {
          v24 = 0;
          v34 = v19 + 1;
          v35 = result - 1;
          do
          {
            v36 = *v34;
            if (v36 < 0x30 || v36 >= v31)
            {
              if (v36 < 0x41 || v36 >= v32)
              {
                v29 = 0;
                if (v36 < 0x61 || v36 >= v33)
                  return v29;
                v37 = -87;
              }
              else
              {
                v37 = -55;
              }
            }
            else
            {
              v37 = -48;
            }
            v38 = v24 * a6;
            if ((unsigned __int128)(v24 * (__int128)a6) >> 64 != (v24 * a6) >> 63)
              return 0;
            v24 = v38 + (v36 + v37);
            if (__OFADD__(v38, (v36 + v37)))
              return 0;
            ++v34;
            --v35;
          }
          while (v35);
          return v24;
        }
        return 0;
      }
      return 0;
    }
    goto LABEL_94;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      v39 = a6 + 48;
      v40 = a6 + 55;
      v41 = a6 + 87;
      if (a6 > 10)
      {
        v39 = 58;
      }
      else
      {
        v41 = 97;
        v40 = 65;
      }
      if (v19)
      {
        v42 = 0;
        do
        {
          v43 = *v19;
          if (v43 < 0x30 || v43 >= v39)
          {
            if (v43 < 0x41 || v43 >= v40)
            {
              v29 = 0;
              if (v43 < 0x61 || v43 >= v41)
                return v29;
              v44 = -87;
            }
            else
            {
              v44 = -55;
            }
          }
          else
          {
            v44 = -48;
          }
          v45 = v42 * a6;
          if ((unsigned __int128)(v42 * (__int128)a6) >> 64 != (v42 * a6) >> 63)
            return 0;
          v42 = v45 + (v43 + v44);
          if (__OFADD__(v45, (v43 + v44)))
            return 0;
          ++v19;
          --result;
        }
        while (result);
        return v45 + (v43 + v44);
      }
      return 0;
    }
    return 0;
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      v21 = a6 + 48;
      v22 = a6 + 55;
      v23 = a6 + 87;
      if (a6 > 10)
      {
        v21 = 58;
      }
      else
      {
        v23 = 97;
        v22 = 65;
      }
      if (v19)
      {
        v24 = 0;
        v25 = v19 + 1;
        v26 = result - 1;
        while (1)
        {
          v27 = *v25;
          if (v27 < 0x30 || v27 >= v21)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              v29 = 0;
              if (v27 < 0x61 || v27 >= v23)
                return v29;
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          v30 = v24 * a6;
          if ((unsigned __int128)(v24 * (__int128)a6) >> 64 != (v24 * a6) >> 63)
            return 0;
          v24 = v30 - (v27 + v28);
          if (__OFSUB__(v30, (v27 + v28)))
            return 0;
          ++v25;
          if (!--v26)
            return v24;
        }
      }
      return 0;
    }
    return 0;
  }
LABEL_93:
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
  return result;
}

uint64_t destroy for LocationCriteria()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s10QOSToolkit16LocationCriteriaVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for LocationCriteria(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for LocationCriteria(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LocationCriteria(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LocationCriteria(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for LocationCriteria()
{
  return &type metadata for LocationCriteria;
}

uint64_t sub_244E83B78@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = sub_244E83EF4(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_244E83BA0(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;

  v4 = *(_QWORD **)a1;
  v5 = *(_QWORD **)(a1 + 8);
  v6 = *(_QWORD **)a2;
  v7 = *(_QWORD **)(a2 + 8);
  if (v4)
  {
    if (!v6 || (sub_244E9D2A4(v4, v6) & 1) == 0)
      return 0;
  }
  else if (v6)
  {
    return 0;
  }
  if (v5)
  {
    if (v7 && (sub_244E9D2A4(v5, v7) & 1) != 0)
      return 1;
  }
  else if (!v7)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_244E83C10(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_244E8A564(*a1, *a2);
}

uint64_t sub_244E83C1C()
{
  sub_244EA1500();
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

uint64_t sub_244E83C98()
{
  sub_244EA1230();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244E83CF0()
{
  sub_244EA1500();
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

uint64_t sub_244E83D68@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_244EA147C();
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

void sub_244E83DC4(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x7972746E756F63;
  if (*v1)
    v2 = 0x6574617473;
  v3 = 0xE700000000000000;
  if (*v1)
    v3 = 0xE500000000000000;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_244E83E00()
{
  _BYTE *v0;

  if (*v0)
    return 0x6574617473;
  else
    return 0x7972746E756F63;
}

uint64_t sub_244E83E38@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_244EA147C();
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

void sub_244E83E98(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_244E83EA4()
{
  sub_244E84098();
  return sub_244EA1530();
}

uint64_t sub_244E83ECC()
{
  sub_244E84098();
  return sub_244EA153C();
}

uint64_t sub_244E83EF4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257425DB0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_244E84098();
  sub_244EA1524();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257425DC0);
    v10 = 0;
    sub_244E840DC();
    sub_244EA1494();
    v7 = v11;
    v10 = 1;
    sub_244EA1494();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7;
}

unint64_t sub_244E84098()
{
  unint64_t result;

  result = qword_257425DB8;
  if (!qword_257425DB8)
  {
    result = MEMORY[0x249528E58](&unk_244EA26F0, &type metadata for LocationCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425DB8);
  }
  return result;
}

unint64_t sub_244E840DC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_257425DC8;
  if (!qword_257425DC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257425DC0);
    v2 = MEMORY[0x24BEE0D38];
    result = MEMORY[0x249528E58](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_257425DC8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for LocationCriteria.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244E84184 + 4 * byte_244EA2575[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_244E841B8 + 4 * byte_244EA2570[v4]))();
}

uint64_t sub_244E841B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E841C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244E841C8);
  return result;
}

uint64_t sub_244E841D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244E841DCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_244E841E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E841E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LocationCriteria.CodingKeys()
{
  return &type metadata for LocationCriteria.CodingKeys;
}

unint64_t sub_244E84208()
{
  unint64_t result;

  result = qword_257425DD0;
  if (!qword_257425DD0)
  {
    result = MEMORY[0x249528E58](&unk_244EA26C8, &type metadata for LocationCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425DD0);
  }
  return result;
}

unint64_t sub_244E84250()
{
  unint64_t result;

  result = qword_257425DD8;
  if (!qword_257425DD8)
  {
    result = MEMORY[0x249528E58](&unk_244EA2600, &type metadata for LocationCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425DD8);
  }
  return result;
}

unint64_t sub_244E84298()
{
  unint64_t result;

  result = qword_257425DE0;
  if (!qword_257425DE0)
  {
    result = MEMORY[0x249528E58](&unk_244EA2628, &type metadata for LocationCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425DE0);
  }
  return result;
}

uint64_t QOSConfig.appTarget.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___QOSConfigInternal_appTarget);
}

uint64_t QOSConfig.locale.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___QOSConfigInternal_locale);
  swift_bridgeObjectRetain();
  return v1;
}

id QOSConfig.__allocating_init(appTarget:locale:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  objc_super v15;

  v7 = (char *)objc_allocWithZone(v3);
  v8 = &v7[OBJC_IVAR___QOSConfigInternal_issuesUrl];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  v9 = &v7[OBJC_IVAR___QOSConfigInternal_locationUrl];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  v10 = &v7[OBJC_IVAR___QOSConfigInternal_issueRefreshFrequencyInSecs];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = &v7[OBJC_IVAR___QOSConfigInternal_locationRefreshFrequencyInSecs];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  v12 = &v7[OBJC_IVAR___QOSConfigInternal_syncStartDelayOffsetInSecs];
  *(_QWORD *)v12 = 0;
  v12[8] = 1;
  *(_QWORD *)&v7[OBJC_IVAR___QOSConfigInternal_appTarget] = a1;
  v13 = &v7[OBJC_IVAR___QOSConfigInternal_locale];
  *(_QWORD *)v13 = a2;
  *((_QWORD *)v13 + 1) = a3;
  v15.receiver = v7;
  v15.super_class = v3;
  return objc_msgSendSuper2(&v15, sel_init);
}

id QOSConfig.init(appTarget:locale:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  objc_super v11;

  v4 = &v3[OBJC_IVAR___QOSConfigInternal_issuesUrl];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = &v3[OBJC_IVAR___QOSConfigInternal_locationUrl];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v6 = &v3[OBJC_IVAR___QOSConfigInternal_issueRefreshFrequencyInSecs];
  *(_QWORD *)v6 = 0;
  v6[8] = 1;
  v7 = &v3[OBJC_IVAR___QOSConfigInternal_locationRefreshFrequencyInSecs];
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  v8 = &v3[OBJC_IVAR___QOSConfigInternal_syncStartDelayOffsetInSecs];
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  *(_QWORD *)&v3[OBJC_IVAR___QOSConfigInternal_appTarget] = a1;
  v9 = &v3[OBJC_IVAR___QOSConfigInternal_locale];
  *(_QWORD *)v9 = a2;
  *((_QWORD *)v9 + 1) = a3;
  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for QOSConfig();
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t type metadata accessor for QOSConfig()
{
  return objc_opt_self();
}

id QOSConfig.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void QOSConfig.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id QOSConfig.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QOSConfig();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for QOSConfig()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of QOSConfig.__allocating_init(appTarget:locale:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t sub_244E8470C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_244E84724()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = v0[3];
  v0[4] = sub_244E84D18();
  v2 = *(_QWORD *)(v1 + OBJC_IVAR___QOSConfigInternal_appTarget);
  if (v2 == 1)
  {
    v6 = (_QWORD *)swift_task_alloc();
    v0[8] = v6;
    *v6 = v0;
    v6[1] = sub_244E848C8;
    v4 = 0x8000000244EA4870;
    v5 = 0xD000000000000016;
    return sub_244E91B00(v5, v4);
  }
  if (!v2)
  {
    v3 = (_QWORD *)swift_task_alloc();
    v0[5] = v3;
    *v3 = v0;
    v3[1] = sub_244E8481C;
    v4 = 0x8000000244EA4940;
    v5 = 0xD000000000000021;
    return sub_244E91B00(v5, v4);
  }
  v0[2] = v2;
  return sub_244EA14B8();
}

uint64_t sub_244E8481C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 48) = a1;
  *(_QWORD *)(v3 + 56) = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244E84878()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 32);
  *(_OWORD *)(*(_QWORD *)(v0 + 24) + OBJC_IVAR___QOSConfigInternal_issuesUrl) = *(_OWORD *)(v0 + 48);

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244E848C8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 72) = a1;
  *(_QWORD *)(v3 + 80) = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244E84924()
{
  uint64_t v0;
  _QWORD *v1;

  *(_OWORD *)(*(_QWORD *)(v0 + 24) + OBJC_IVAR___QOSConfigInternal_issuesUrl) = *(_OWORD *)(v0 + 72);
  swift_bridgeObjectRelease();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  *v1 = v0;
  v1[1] = sub_244E849A4;
  return sub_244E91B00(0xD000000000000018, 0x8000000244EA4890);
}

uint64_t sub_244E849A4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 96) = a1;
  *(_QWORD *)(v3 + 104) = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244E84A00()
{
  uint64_t v0;
  _QWORD *v1;

  *(_OWORD *)(*(_QWORD *)(v0 + 24) + OBJC_IVAR___QOSConfigInternal_locationUrl) = *(_OWORD *)(v0 + 96);
  swift_bridgeObjectRelease();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v1;
  *v1 = v0;
  v1[1] = sub_244E84A80;
  return sub_244E91D00(0xD00000000000002BLL, 0x8000000244EA48B0);
}

uint64_t sub_244E84A80(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 120) = a1;
  *(_BYTE *)(v3 + 160) = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244E84AE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = 1800;
  if ((*(_BYTE *)(v0 + 160) & 1) == 0)
    v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 24) + OBJC_IVAR___QOSConfigInternal_issueRefreshFrequencyInSecs;
  *(_QWORD *)v2 = v1;
  *(_BYTE *)(v2 + 8) = 0;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v3;
  *v3 = v0;
  v3[1] = sub_244E84B6C;
  return sub_244E91D00(0xD00000000000002ELL, 0x8000000244EA48E0);
}

uint64_t sub_244E84B6C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 136) = a1;
  *(_BYTE *)(v3 + 161) = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244E84BCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = 3600;
  if ((*(_BYTE *)(v0 + 161) & 1) == 0)
    v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 24) + OBJC_IVAR___QOSConfigInternal_locationRefreshFrequencyInSecs;
  *(_QWORD *)v2 = v1;
  *(_BYTE *)(v2 + 8) = 0;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v3;
  *v3 = v0;
  v3[1] = sub_244E84C58;
  return sub_244E91D00(0xD00000000000002BLL, 0x8000000244EA4910);
}

uint64_t sub_244E84C58(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 152) = a1;
  *(_BYTE *)(v3 + 162) = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244E84CB8()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_BYTE *)(v0 + 162);
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 24);

  v4 = 180;
  if ((v1 & 1) == 0)
    v4 = v2;
  v5 = v3 + OBJC_IVAR___QOSConfigInternal_syncStartDelayOffsetInSecs;
  *(_QWORD *)v5 = v4;
  *(_BYTE *)(v5 + 8) = 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244E84D18()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t result;

  if (*(_QWORD *)(v0 + OBJC_IVAR___QOSConfigInternal_appTarget) > 1uLL)
  {
    result = sub_244EA14B8();
    __break(1u);
  }
  else
  {
    v1 = (void *)sub_244EA11B8();
    v2 = (void *)sub_244EA11B8();
    v3 = objc_msgSend((id)objc_opt_self(), sel_bagForProfile_profileVersion_, v1, v2);

    return (uint64_t)v3;
  }
  return result;
}

__n128 sub_244E84DE8@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[11];

  sub_244E86740(a1, (uint64_t)v9);
  if (!v2)
  {
    v5 = v9[9];
    *(_OWORD *)(a2 + 128) = v9[8];
    *(_OWORD *)(a2 + 144) = v5;
    *(_OWORD *)(a2 + 160) = v9[10];
    v6 = v9[5];
    *(_OWORD *)(a2 + 64) = v9[4];
    *(_OWORD *)(a2 + 80) = v6;
    v7 = v9[7];
    *(_OWORD *)(a2 + 96) = v9[6];
    *(_OWORD *)(a2 + 112) = v7;
    v8 = v9[1];
    *(_OWORD *)a2 = v9[0];
    *(_OWORD *)(a2 + 16) = v8;
    result = (__n128)v9[3];
    *(_OWORD *)(a2 + 32) = v9[2];
    *(__n128 *)(a2 + 48) = result;
  }
  return result;
}

BOOL sub_244E84E48(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[11];
  _OWORD v14[11];

  v2 = a1[9];
  v13[8] = a1[8];
  v13[9] = v2;
  v13[10] = a1[10];
  v3 = a1[5];
  v13[4] = a1[4];
  v13[5] = v3;
  v4 = a1[7];
  v13[6] = a1[6];
  v13[7] = v4;
  v5 = a1[1];
  v13[0] = *a1;
  v13[1] = v5;
  v6 = a1[3];
  v13[2] = a1[2];
  v13[3] = v6;
  v7 = a2[9];
  v14[8] = a2[8];
  v14[9] = v7;
  v14[10] = a2[10];
  v8 = a2[5];
  v14[4] = a2[4];
  v14[5] = v8;
  v9 = a2[7];
  v14[6] = a2[6];
  v14[7] = v9;
  v10 = a2[1];
  v14[0] = *a2;
  v14[1] = v10;
  v11 = a2[3];
  v14[2] = a2[2];
  v14[3] = v11;
  return sub_244E8529C(v13, v14);
}

uint64_t sub_244E84ED8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_244E8AD58(*a1, *a2);
}

void sub_244E84EE4()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_244EA1500();
  __asm { BR              X9 }
}

uint64_t sub_244E84F28()
{
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

void sub_244E84FA0()
{
  __asm { BR              X10 }
}

uint64_t sub_244E84FD4()
{
  sub_244EA1230();
  return swift_bridgeObjectRelease();
}

void sub_244E85038()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_244EA1500();
  __asm { BR              X9 }
}

uint64_t sub_244E85078()
{
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

uint64_t sub_244E850F0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244E86E80();
  *a1 = result;
  return result;
}

uint64_t sub_244E8511C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_244E85144 + 4 * byte_244EA278F[*v0]))();
}

void sub_244E85144(_QWORD *a1@<X8>)
{
  *a1 = 0x6E6F697461636F6CLL;
  a1[1] = 0xE800000000000000;
}

void sub_244E85160(_QWORD *a1@<X8>)
{
  *a1 = 0x746E65746E6F63;
  a1[1] = 0xE700000000000000;
}

void sub_244E8517C(_QWORD *a1@<X8>)
{
  *a1 = 0x656369766564;
  a1[1] = 0xE600000000000000;
}

void sub_244E85194(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 1668508013;
  a1[1] = v1;
}

uint64_t sub_244E851A4()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244E851CC + 4 * byte_244EA2794[*v0]))(1701869940, 0xE400000000000000);
}

uint64_t sub_244E851CC()
{
  return 0x6E6F697461636F6CLL;
}

uint64_t sub_244E851E4()
{
  return 0x746E65746E6F63;
}

uint64_t sub_244E851FC()
{
  return 0x656369766564;
}

uint64_t sub_244E85210()
{
  return 1668508013;
}

uint64_t sub_244E8521C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244E86E80();
  *a1 = result;
  return result;
}

void sub_244E85240(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_244E8524C()
{
  sub_244E86B88();
  return sub_244EA1530();
}

uint64_t sub_244E85274()
{
  sub_244E86B88();
  return sub_244EA153C();
}

BOOL sub_244E8529C(_QWORD *a1, _QWORD *a2)
{
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _BOOL8 result;
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
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  _QWORD *v31;
  _QWORD *v32;
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
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
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
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD v83[12];
  _QWORD v84[6];
  _QWORD v85[7];

  v4 = *(unsigned __int8 *)a1;
  v5 = *(unsigned __int8 *)a2;
  if (v4 == 2)
  {
    if (v5 != 2)
      return 0;
  }
  else
  {
    if (v5 == 2)
      return 0;
    if ((v4 & 1) != 0)
      v6 = 0x636973756DLL;
    else
      v6 = 0x6F65646976;
    if ((v5 & 1) != 0)
      v7 = 0x636973756DLL;
    else
      v7 = 0x6F65646976;
    if (v6 == v7)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v8 = sub_244EA14AC();
      swift_bridgeObjectRelease_n();
      result = 0;
      if ((v8 & 1) == 0)
        return result;
    }
  }
  v10 = a1[1];
  v11 = a2[1];
  if (v10 != 1)
  {
    if (v11 == 1)
      return 0;
    v24 = (_QWORD *)a1[2];
    v25 = (_QWORD *)a2[2];
    if (v10)
    {
      v26 = (_QWORD *)a1[1];
      if (!v11)
      {
        sub_244E85B9C((uint64_t)v26);
        sub_244E85B9C(v10);
        sub_244E85B9C(0);
        goto LABEL_42;
      }
      if ((sub_244E9D2A4(v26, (_QWORD *)a2[1]) & 1) == 0)
      {
        sub_244E85B9C(v10);
        v27 = v10;
LABEL_28:
        sub_244E85B9C(v27);
LABEL_29:
        v29 = v11;
LABEL_30:
        sub_244E85B9C(v29);
        swift_bridgeObjectRelease();
LABEL_42:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_244E85BD0(v10);
        return 0;
      }
    }
    else if (v11)
    {
      sub_244E85B9C(0);
      v27 = 0;
      goto LABEL_28;
    }
    if (v24)
    {
      if (!v25)
      {
        sub_244E85B9C(v10);
        sub_244E85B9C(v10);
        v29 = v11;
        goto LABEL_30;
      }
      v30 = sub_244E9D2A4(v24, v25);
      sub_244E85B9C(v10);
      sub_244E85B9C(v10);
      sub_244E85B9C(v11);
      swift_bridgeObjectRelease();
      if ((v30 & 1) == 0)
        goto LABEL_42;
    }
    else
    {
      sub_244E85B9C(v10);
      sub_244E85B9C(v10);
      if (v25)
        goto LABEL_29;
      sub_244E85B9C(v11);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_244E85BD0(v10);
    goto LABEL_16;
  }
  if (v11 != 1)
    return 0;
LABEL_16:
  v12 = a1[3];
  v13 = a1[4];
  v15 = a1[5];
  v14 = a1[6];
  v16 = a1[7];
  v17 = a1[8];
  v19 = a2[3];
  v18 = a2[4];
  v21 = a2[5];
  v20 = a2[6];
  v23 = a2[7];
  v22 = a2[8];
  if (v12 != 1)
  {
    if (v19 != 1)
    {
      v84[0] = a1[3];
      v84[1] = v13;
      v84[2] = v15;
      v84[3] = v14;
      v84[4] = v16;
      v84[5] = v17;
      v85[0] = v19;
      v85[1] = v18;
      v85[2] = v21;
      v85[3] = v20;
      v85[4] = v23;
      v85[5] = v22;
      v57 = v19;
      v58 = sub_244E9E784((uint64_t)v84, (uint64_t)v85);
      sub_244E85858(v12);
      sub_244E85858(v12);
      sub_244E85858(v57);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_244E858CC(v12);
      if ((v58 & 1) == 0)
        return 0;
      goto LABEL_36;
    }
LABEL_25:
    v28 = a2[3];
    sub_244E85858(v12);
    sub_244E85858(v28);
    sub_244E858CC(v12);
    sub_244E858CC(v28);
    return 0;
  }
  if (v19 != 1)
    goto LABEL_25;
LABEL_36:
  v31 = (_QWORD *)a1[9];
  v32 = (_QWORD *)a2[9];
  if (v31 == (_QWORD *)1)
  {
    if (v32 != (_QWORD *)1)
      return 0;
  }
  else
  {
    if (v32 == (_QWORD *)1)
      return 0;
    if (v31)
    {
      if (!v32 || (sub_244E9D2A4(v31, v32) & 1) == 0)
        return 0;
    }
    else if (v32)
    {
      return 0;
    }
  }
  v33 = a1[10];
  v34 = a1[11];
  v35 = a1[12];
  v36 = a1[13];
  v37 = a1[14];
  v38 = a1[15];
  v39 = a1[16];
  v40 = a1[17];
  v41 = a1[18];
  v42 = a1[19];
  v43 = a1[20];
  v44 = a1[21];
  v46 = a2[10];
  v45 = a2[11];
  v48 = a2[12];
  v47 = a2[13];
  v50 = a2[14];
  v49 = a2[15];
  v52 = a2[16];
  v51 = a2[17];
  v54 = a2[18];
  v53 = a2[19];
  v55 = a2[20];
  v56 = a2[21];
  if (v33 == 1)
  {
    if (v46 == 1)
      return 1;
    goto LABEL_55;
  }
  if (v46 == 1)
  {
LABEL_55:
    v59 = v33;
    v60 = v34;
    v61 = v35;
    v62 = v36;
    v63 = v37;
    v64 = v38;
    v65 = v39;
    v66 = v40;
    v67 = v41;
    v68 = v42;
    v69 = v43;
    v70 = v44;
    v71 = v46;
    v72 = v45;
    v73 = v48;
    v74 = v47;
    v75 = v50;
    v76 = v49;
    v77 = v52;
    v78 = v51;
    v79 = v54;
    v80 = v53;
    v81 = v55;
    v82 = v56;
    sub_244E8593C(v33);
    sub_244E8593C(v46);
    sub_244E85A0C(&v59);
    return 0;
  }
  v83[0] = v33;
  v83[1] = v34;
  v83[2] = v35;
  v83[3] = v36;
  v83[4] = v37;
  v83[5] = v38;
  v83[6] = v39;
  v83[7] = v40;
  v83[8] = v41;
  v83[9] = v42;
  v83[10] = v43;
  v83[11] = v44;
  v59 = v46;
  v60 = v45;
  v61 = v48;
  v62 = v47;
  v63 = v50;
  v64 = v49;
  v65 = v52;
  v66 = v51;
  v67 = v54;
  v68 = v53;
  v69 = v55;
  v70 = v56;
  return (sub_244E950A8((uint64_t)v83, (uint64_t)&v59) & 1) != 0;
}

uint64_t sub_244E85858(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_244E858CC(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_244E8593C(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t *sub_244E85A0C(uint64_t *a1)
{
  uint64_t v3;

  v3 = a1[12];
  sub_244E85ACC(*a1);
  sub_244E85ACC(v3);
  return a1;
}

uint64_t sub_244E85ACC(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_244E85B9C(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_244E85BD0(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t destroy for MusicCriteria(_QWORD *a1)
{
  uint64_t result;

  if (a1[1] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[3] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[9] != 1)
    swift_bridgeObjectRelease();
  result = a1[10];
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for MusicCriteria(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
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
  uint64_t v30;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = (_OWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (v5 == 1)
  {
    *v4 = *(_OWORD *)(a2 + 8);
  }
  else
  {
    v6 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 8) = v5;
    *(_QWORD *)(a1 + 16) = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  v7 = *(_QWORD *)(a2 + 24);
  if (v7 == 1)
  {
    v8 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v8;
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  else
  {
    v9 = *(_QWORD *)(a2 + 32);
    v10 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 24) = v7;
    *(_QWORD *)(a1 + 32) = v9;
    v11 = *(_QWORD *)(a2 + 48);
    v12 = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 40) = v10;
    *(_QWORD *)(a1 + 48) = v11;
    v13 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = v12;
    *(_QWORD *)(a1 + 64) = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  v14 = *(_QWORD *)(a2 + 72);
  if (v14 != 1)
    v14 = swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 72) = v14;
  v15 = *(_QWORD *)(a2 + 80);
  if (v15 == 1)
  {
    v16 = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 128) = v16;
    v17 = *(_OWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 160) = v17;
    v18 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 96) = v18;
  }
  else
  {
    v19 = *(_QWORD *)(a2 + 88);
    v20 = *(_QWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 80) = v15;
    *(_QWORD *)(a1 + 88) = v19;
    v21 = *(_QWORD *)(a2 + 104);
    v22 = *(_QWORD *)(a2 + 112);
    *(_QWORD *)(a1 + 96) = v20;
    *(_QWORD *)(a1 + 104) = v21;
    v23 = *(_QWORD *)(a2 + 120);
    v24 = *(_QWORD *)(a2 + 128);
    *(_QWORD *)(a1 + 112) = v22;
    *(_QWORD *)(a1 + 120) = v23;
    v25 = *(_QWORD *)(a2 + 136);
    v26 = *(_QWORD *)(a2 + 144);
    *(_QWORD *)(a1 + 128) = v24;
    *(_QWORD *)(a1 + 136) = v25;
    v27 = *(_QWORD *)(a2 + 152);
    v30 = *(_QWORD *)(a2 + 160);
    *(_QWORD *)(a1 + 144) = v26;
    *(_QWORD *)(a1 + 152) = v27;
    v28 = *(_QWORD *)(a2 + 168);
    *(_QWORD *)(a1 + 160) = v30;
    *(_QWORD *)(a1 + 168) = v28;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for MusicCriteria(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  __int128 *v8;
  uint64_t v9;
  __int128 *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = (_OWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  v7 = (_OWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 8);
  if (v5 == 1)
  {
    if (v6 != 1)
    {
      *(_QWORD *)(a1 + 8) = v6;
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v6 == 1)
  {
    sub_244E7F9CC((uint64_t)v4);
LABEL_6:
    *v4 = *v7;
    goto LABEL_8;
  }
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_8:
  v8 = (__int128 *)(a1 + 24);
  v10 = (__int128 *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 24);
  if (*(_QWORD *)(a1 + 24) == 1)
  {
    if (v9 == 1)
    {
      v11 = *v10;
      v12 = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a1 + 56) = v12;
      *v8 = v11;
    }
    else
    {
      *(_QWORD *)(a1 + 24) = v9;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v9 == 1)
  {
    sub_244E86364(a1 + 24);
    v14 = *(_OWORD *)(a2 + 40);
    v13 = *(_OWORD *)(a2 + 56);
    *v8 = *v10;
    *(_OWORD *)(a1 + 40) = v14;
    *(_OWORD *)(a1 + 56) = v13;
  }
  else
  {
    *(_QWORD *)(a1 + 24) = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  v15 = (uint64_t *)(a1 + 72);
  v16 = *(_QWORD *)(a2 + 72);
  if (*(_QWORD *)(a1 + 72) == 1)
  {
    if (v16 == 1)
    {
      v17 = 1;
LABEL_20:
      *v15 = v17;
      goto LABEL_23;
    }
    *v15 = v16;
    swift_bridgeObjectRetain();
  }
  else
  {
    if (v16 == 1)
    {
      sub_244E7FA34(a1 + 72);
      v17 = *(_QWORD *)(a2 + 72);
      goto LABEL_20;
    }
    *v15 = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
LABEL_23:
  v18 = (_OWORD *)(a1 + 80);
  v20 = (_OWORD *)(a2 + 80);
  v19 = *(_QWORD *)(a2 + 80);
  if (*(_QWORD *)(a1 + 80) == 1)
  {
    if (v19 == 1)
    {
      v21 = *(_OWORD *)(a2 + 96);
      *v18 = *v20;
      *(_OWORD *)(a1 + 96) = v21;
      v22 = *(_OWORD *)(a2 + 112);
      v23 = *(_OWORD *)(a2 + 128);
      v24 = *(_OWORD *)(a2 + 160);
      *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
      *(_OWORD *)(a1 + 160) = v24;
      *(_OWORD *)(a1 + 112) = v22;
      *(_OWORD *)(a1 + 128) = v23;
    }
    else
    {
      *(_QWORD *)(a1 + 80) = v19;
      *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
      *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
      *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
      *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
      *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
      *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
      *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
      *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
      *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
      *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v19 == 1)
  {
    sub_244E86398(a1 + 80);
    v25 = *(_OWORD *)(a2 + 96);
    *v18 = *v20;
    *(_OWORD *)(a1 + 96) = v25;
    v26 = *(_OWORD *)(a2 + 160);
    v28 = *(_OWORD *)(a2 + 112);
    v27 = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 160) = v26;
    *(_OWORD *)(a1 + 112) = v28;
    *(_OWORD *)(a1 + 128) = v27;
  }
  else
  {
    *(_QWORD *)(a1 + 80) = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

uint64_t sub_244E86364(uint64_t a1)
{
  destroy for MusicDeviceCriteria();
  return a1;
}

uint64_t sub_244E86398(uint64_t a1)
{
  destroy for MusicContentCriteria();
  return a1;
}

__n128 __swift_memcpy176_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;
  __int128 v9;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  v4 = a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  result = (__n128)a2[7];
  v8 = a2[8];
  v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(__n128 *)(a1 + 112) = result;
  *(_OWORD *)(a1 + 128) = v8;
  return result;
}

uint64_t assignWithTake for MusicCriteria(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = (_OWORD *)(a1 + 8);
  v6 = (_OWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (*(_QWORD *)(a1 + 8) == 1)
    goto LABEL_4;
  if (v5 == 1)
  {
    sub_244E7F9CC((uint64_t)v4);
LABEL_4:
    *v4 = *v6;
    goto LABEL_6;
  }
  *(_QWORD *)(a1 + 8) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
LABEL_6:
  v7 = *(_QWORD *)(a2 + 24);
  if (*(_QWORD *)(a1 + 24) == 1)
  {
LABEL_9:
    v8 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v8;
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_11;
  }
  if (v7 == 1)
  {
    sub_244E86364(a1 + 24);
    goto LABEL_9;
  }
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
LABEL_11:
  v9 = (uint64_t *)(a1 + 72);
  v10 = *(_QWORD *)(a2 + 72);
  if (*(_QWORD *)(a1 + 72) == 1)
  {
LABEL_14:
    *v9 = v10;
    goto LABEL_16;
  }
  if (v10 == 1)
  {
    sub_244E7FA34(a1 + 72);
    v10 = 1;
    goto LABEL_14;
  }
  *v9 = v10;
  swift_bridgeObjectRelease();
LABEL_16:
  v11 = *(_QWORD *)(a2 + 80);
  if (*(_QWORD *)(a1 + 80) != 1)
  {
    if (v11 != 1)
    {
      *(_QWORD *)(a1 + 80) = v11;
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_244E86398(a1 + 80);
  }
  v12 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v12;
  v13 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v13;
  v14 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v14;
  return a1;
}

uint64_t getEnumTagSinglePayload for MusicCriteria(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;
  BOOL v5;
  int v6;

  if (!a2)
    return 0;
  if (a2 > 0x7FFFFFFD && *(_BYTE *)(a1 + 176))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  v5 = __OFSUB__(v4, 1);
  v6 = v4 - 1;
  if (v6 < 0 != v5)
    v6 = -1;
  return (v6 + 1);
}

uint64_t storeEnumTagSinglePayload for MusicCriteria(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)(result + 168) = 0;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 2147483646;
    if (a3 > 0x7FFFFFFD)
      *(_BYTE *)(result + 176) = 1;
  }
  else
  {
    if (a3 > 0x7FFFFFFD)
      *(_BYTE *)(result + 176) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicCriteria()
{
  return &type metadata for MusicCriteria;
}

uint64_t sub_244E86740@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  int v11;
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
  int v55;
  char v56;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257425E28);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244E86B88();
  sub_244EA1524();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v43) = 0;
  sub_244EA1488();
  v10 = sub_244EA147C();
  swift_bridgeObjectRelease();
  if (v10 == 1)
    v11 = 1;
  else
    v11 = 2;
  if (!v10)
    v11 = 0;
  v55 = v11;
  v56 = 1;
  sub_244E86BCC();
  sub_244EA1494();
  v40 = v44;
  v41 = v43;
  v56 = 2;
  sub_244E86C10();
  sub_244EA1494();
  v38 = v44;
  v39 = v43;
  v36 = v46;
  v37 = v45;
  v34 = v48;
  v35 = v47;
  v33 = v49;
  v32 = v50;
  v31 = v51;
  v30 = v52;
  v29 = v53;
  v28 = v54;
  v42 = v6;
  v56 = 3;
  sub_244E86C54();
  sub_244EA1494();
  v27 = v43;
  v26 = v44;
  v12 = v46;
  v25 = v45;
  v13 = v47;
  v14 = v48;
  v56 = 4;
  sub_244E86C98();
  sub_244EA1494();
  v15 = v43;
  (*(void (**)(char *, uint64_t))(v42 + 8))(v8, v5);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *(_BYTE *)a2 = v55;
  v16 = v40;
  *(_QWORD *)(a2 + 8) = v41;
  *(_QWORD *)(a2 + 16) = v16;
  v17 = v26;
  *(_QWORD *)(a2 + 24) = v27;
  *(_QWORD *)(a2 + 32) = v17;
  *(_QWORD *)(a2 + 40) = v25;
  *(_QWORD *)(a2 + 48) = v12;
  *(_QWORD *)(a2 + 56) = v13;
  *(_QWORD *)(a2 + 64) = v14;
  v18 = v39;
  *(_QWORD *)(a2 + 72) = v15;
  *(_QWORD *)(a2 + 80) = v18;
  v19 = v37;
  *(_QWORD *)(a2 + 88) = v38;
  *(_QWORD *)(a2 + 96) = v19;
  v20 = v35;
  *(_QWORD *)(a2 + 104) = v36;
  *(_QWORD *)(a2 + 112) = v20;
  v21 = v33;
  *(_QWORD *)(a2 + 120) = v34;
  *(_QWORD *)(a2 + 128) = v21;
  v22 = v31;
  *(_QWORD *)(a2 + 136) = v32;
  *(_QWORD *)(a2 + 144) = v22;
  v23 = v29;
  *(_QWORD *)(a2 + 152) = v30;
  *(_QWORD *)(a2 + 160) = v23;
  *(_QWORD *)(a2 + 168) = v28;
  return result;
}

unint64_t sub_244E86B88()
{
  unint64_t result;

  result = qword_257425E30;
  if (!qword_257425E30)
  {
    result = MEMORY[0x249528E58](&unk_244EA2908, &type metadata for MusicCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425E30);
  }
  return result;
}

unint64_t sub_244E86BCC()
{
  unint64_t result;

  result = qword_257425E38;
  if (!qword_257425E38)
  {
    result = MEMORY[0x249528E58](&unk_244EA25CC, &type metadata for LocationCriteria);
    atomic_store(result, (unint64_t *)&qword_257425E38);
  }
  return result;
}

unint64_t sub_244E86C10()
{
  unint64_t result;

  result = qword_257425E40;
  if (!qword_257425E40)
  {
    result = MEMORY[0x249528E58](&unk_244EA3560, &type metadata for MusicContentCriteria);
    atomic_store(result, (unint64_t *)&qword_257425E40);
  }
  return result;
}

unint64_t sub_244E86C54()
{
  unint64_t result;

  result = qword_257425E48;
  if (!qword_257425E48)
  {
    result = MEMORY[0x249528E58](&unk_244EA3C8C, &type metadata for MusicDeviceCriteria);
    atomic_store(result, (unint64_t *)&qword_257425E48);
  }
  return result;
}

unint64_t sub_244E86C98()
{
  unint64_t result;

  result = qword_257425E50;
  if (!qword_257425E50)
  {
    result = MEMORY[0x249528E58](&unk_244EA3E4C, &type metadata for MiscCriteria);
    atomic_store(result, (unint64_t *)&qword_257425E50);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for MusicCriteria.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244E86D28 + 4 * byte_244EA279E[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_244E86D5C + 4 * byte_244EA2799[v4]))();
}

uint64_t sub_244E86D5C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E86D64(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244E86D6CLL);
  return result;
}

uint64_t sub_244E86D78(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244E86D80);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_244E86D84(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E86D8C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MusicCriteria.CodingKeys()
{
  return &type metadata for MusicCriteria.CodingKeys;
}

unint64_t sub_244E86DAC()
{
  unint64_t result;

  result = qword_257425E58;
  if (!qword_257425E58)
  {
    result = MEMORY[0x249528E58](&unk_244EA28E0, &type metadata for MusicCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425E58);
  }
  return result;
}

unint64_t sub_244E86DF4()
{
  unint64_t result;

  result = qword_257425E60;
  if (!qword_257425E60)
  {
    result = MEMORY[0x249528E58](&unk_244EA2818, &type metadata for MusicCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425E60);
  }
  return result;
}

unint64_t sub_244E86E3C()
{
  unint64_t result;

  result = qword_257425E68;
  if (!qword_257425E68)
  {
    result = MEMORY[0x249528E58](&unk_244EA2840, &type metadata for MusicCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425E68);
  }
  return result;
}

uint64_t sub_244E86E80()
{
  unint64_t v0;

  v0 = sub_244EA147C();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

BOOL static QOSItem.QOSMusicItem.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t QOSItem.QOSMusicItem.hash(into:)()
{
  return sub_244EA150C();
}

uint64_t _s10QOSToolkit7QOSItemO9QOSTVItemO9hashValueSivg_0()
{
  sub_244EA1500();
  sub_244EA150C();
  return sub_244EA1518();
}

BOOL sub_244E86F58(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_244E86F6C()
{
  return sub_244EA150C();
}

uint64_t sub_244E86F94()
{
  sub_244EA1500();
  sub_244EA150C();
  return sub_244EA1518();
}

uint64_t QOSItem.hash(into:)()
{
  sub_244EA150C();
  return sub_244EA150C();
}

BOOL static QOSItem.== infix(_:_:)(unsigned __int8 *a1, char *a2)
{
  int v2;
  int v3;
  _BOOL4 v4;

  v2 = *a1;
  v3 = *a2;
  if ((v2 & 0x80u) == 0)
    v4 = v3 >= 0;
  else
    v4 = v3 < 0;
  return v2 == v3 && v4;
}

uint64_t QOSItem.hashValue.getter()
{
  sub_244EA1500();
  sub_244EA150C();
  sub_244EA150C();
  return sub_244EA1518();
}

uint64_t sub_244E87094()
{
  sub_244EA1500();
  sub_244EA150C();
  sub_244EA150C();
  return sub_244EA1518();
}

uint64_t sub_244E870E8()
{
  sub_244EA150C();
  return sub_244EA150C();
}

uint64_t sub_244E87128()
{
  sub_244EA1500();
  sub_244EA150C();
  sub_244EA150C();
  return sub_244EA1518();
}

BOOL sub_244E87178(unsigned __int8 *a1, char *a2)
{
  int v2;
  int v3;
  _BOOL4 v4;

  v2 = *a1;
  v3 = *a2;
  if ((v2 & 0x80u) == 0)
    v4 = v3 >= 0;
  else
    v4 = v3 < 0;
  return v2 == v3 && v4;
}

uint64_t QOSItem.id.getter()
{
  char *v0;
  uint64_t v1;

  v1 = *v0;
  if (*v0 < 0)
    return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244E87230 + 4 * byte_244EA2958[v1 & 0x7F]))(0x657079546D657469, 0xE900000000000073);
  else
    return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244E871E4 + 4 * byte_244EA2965[v1]))(0x54746E65746E6F63, 0xEB00000000657079);
}

uint64_t sub_244E871E4()
{
  return 0x6449646E617262;
}

uint64_t sub_244E87230()
{
  return 0x7364497465737361;
}

uint64_t sub_244E87248()
{
  return 0x656C61636F6CLL;
}

uint64_t sub_244E8725C()
{
  return 0x656449616964656DLL;
}

uint64_t sub_244E87280()
{
  return 0x5465636976726573;
}

unint64_t sub_244E8736C()
{
  return 0xD000000000000014;
}

unint64_t sub_244E87388()
{
  return 0xD000000000000016;
}

uint64_t QOSItem.QOSTVItem.id.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244E873E0 + 4 * byte_244EA2969[*v0]))(0x54746E65746E6F63, 0xEB00000000657079);
}

uint64_t sub_244E873E0()
{
  return 0x6449646E617262;
}

uint64_t sub_244E873F8()
{
  return 0x656449616964656DLL;
}

uint64_t sub_244E8741C()
{
  return 0x656C61636F6CLL;
}

uint64_t QOSItem.QOSMusicItem.id.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244E87464 + 4 * byte_244EA296D[*v0]))(0x657079546D657469, 0xE900000000000073);
}

uint64_t sub_244E87464()
{
  return 0x7364497465737361;
}

uint64_t sub_244E8747C()
{
  return 0x5465636976726573;
}

unint64_t sub_244E87568()
{
  return 0xD000000000000014;
}

unint64_t sub_244E87584()
{
  return 0xD000000000000016;
}

uint64_t sub_244E875A4()
{
  return 0x656C61636F6CLL;
}

unint64_t sub_244E875BC()
{
  unint64_t result;

  result = qword_257425E70;
  if (!qword_257425E70)
  {
    result = MEMORY[0x249528E58](&protocol conformance descriptor for QOSItem.QOSTVItem, &type metadata for QOSItem.QOSTVItem);
    atomic_store(result, (unint64_t *)&qword_257425E70);
  }
  return result;
}

unint64_t sub_244E87604()
{
  unint64_t result;

  result = qword_257425E78;
  if (!qword_257425E78)
  {
    result = MEMORY[0x249528E58](&protocol conformance descriptor for QOSItem.QOSMusicItem, &type metadata for QOSItem.QOSMusicItem);
    atomic_store(result, (unint64_t *)&qword_257425E78);
  }
  return result;
}

unint64_t sub_244E8764C()
{
  unint64_t result;

  result = qword_257425E80;
  if (!qword_257425E80)
  {
    result = MEMORY[0x249528E58](&protocol conformance descriptor for QOSItem, &type metadata for QOSItem);
    atomic_store(result, (unint64_t *)&qword_257425E80);
  }
  return result;
}

uint64_t sub_244E87690@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = QOSItem.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_244E876B4()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_244E876EC + 4 * byte_244EA297A[*v0]))();
}

void sub_244E876EC(_QWORD *a1@<X8>)
{
  *a1 = 0x6449646E617262;
  a1[1] = 0xE700000000000000;
}

void sub_244E87708(_QWORD *a1@<X8>)
{
  *a1 = 0x656449616964656DLL;
  a1[1] = 0xEF7265696669746ELL;
}

void sub_244E87730(_QWORD *a1@<X8>)
{
  *a1 = 0x656C61636F6CLL;
  a1[1] = 0xE600000000000000;
}

uint64_t sub_244E87748@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = QOSItem.QOSMusicItem.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for QOSItem(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;

  if (!a2)
    return 0;
  if (a2 < 0xF)
    goto LABEL_17;
  if (a2 + 241 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 241) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 241;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 241;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 241;
  }
LABEL_17:
  v6 = ((*a1 >> 3) & 0xE | (*a1 >> 7)) ^ 0xF;
  if (v6 >= 0xE)
    v6 = -1;
  return v6 + 1;
}

uint64_t storeEnumTagSinglePayload for QOSItem(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 241 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 241) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE)
    return ((uint64_t (*)(void))((char *)&loc_244E87858 + 4 * byte_244EA2983[v4]))();
  *a1 = a2 - 15;
  return ((uint64_t (*)(void))((char *)sub_244E8788C + 4 * byte_244EA297E[v4]))();
}

uint64_t sub_244E8788C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E87894(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244E8789CLL);
  return result;
}

uint64_t sub_244E878B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244E878BCLL);
  *(_BYTE *)result = 16 * (((-a2 >> 1) & 7) - 8 * a2);
  return result;
}

uint64_t sub_244E878C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E878C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E878D4(unsigned __int8 *a1)
{
  return *a1 >> 7;
}

_BYTE *sub_244E878E0(_BYTE *result)
{
  *result &= ~0x80u;
  return result;
}

_BYTE *sub_244E878F0(_BYTE *result, char a2)
{
  *result = *result & 0xF | (a2 << 7);
  return result;
}

ValueMetadata *type metadata accessor for QOSItem()
{
  return &type metadata for QOSItem;
}

uint64_t storeEnumTagSinglePayload for QOSItem.QOSTVItem(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244E87960 + 4 * byte_244EA298D[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_244E87994 + 4 * byte_244EA2988[v4]))();
}

uint64_t sub_244E87994(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E8799C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244E879A4);
  return result;
}

uint64_t sub_244E879B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244E879B8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_244E879BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E879C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for QOSItem.QOSTVItem()
{
  return &type metadata for QOSItem.QOSTVItem;
}

uint64_t getEnumTagSinglePayload for QOSItem.QOSMusicItem(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for QOSItem.QOSMusicItem(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244E87ABC + 4 * byte_244EA2997[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_244E87AF0 + 4 * byte_244EA2992[v4]))();
}

uint64_t sub_244E87AF0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E87AF8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244E87B00);
  return result;
}

uint64_t sub_244E87B0C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244E87B14);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_244E87B18(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E87B20(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for QOSItem.QOSMusicItem()
{
  return &type metadata for QOSItem.QOSMusicItem;
}

uint64_t sub_244E87B54()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_244E87B90 + 4 * byte_244EA2BFC[*v0]))();
}

void sub_244E87B90(char *a1@<X8>)
{
  strcpy(a1, "Content-Length");
  a1[15] = -18;
}

void sub_244E87BB8(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "Content-Type");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void sub_244E87BDC(_QWORD *a1@<X8>)
{
  *a1 = 1702125892;
  a1[1] = 0xE400000000000000;
}

void sub_244E87BF0(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "Last-Modified");
  *(_WORD *)(a1 + 14) = -4864;
}

void sub_244E87C18(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000011;
  a1[1] = 0x8000000244EA4970;
}

uint64_t getEnumTagSinglePayload for HTTPHeaderField(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HTTPHeaderField(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244E87D14 + 4 * byte_244EA2C07[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_244E87D48 + 4 * byte_244EA2C02[v4]))();
}

uint64_t sub_244E87D48(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E87D50(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244E87D58);
  return result;
}

uint64_t sub_244E87D64(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244E87D6CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_244E87D70(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E87D78(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HTTPHeaderField()
{
  return &type metadata for HTTPHeaderField;
}

unint64_t sub_244E87D98()
{
  unint64_t result;

  result = qword_257425E88;
  if (!qword_257425E88)
  {
    result = MEMORY[0x249528E58](&unk_244EA2CA0, &type metadata for HTTPHeaderField);
    atomic_store(result, (unint64_t *)&qword_257425E88);
  }
  return result;
}

void *sub_244E87DDC(char a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char **v21;
  uint64_t v23;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257425D48);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v8 - 8) + 64), v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257425E90);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v11 - 8) + 64), v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244E87FDC(a2, (uint64_t)v13, &qword_257425E90);
  v14 = sub_244EA1128();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) != 1)
  {
    v16 = (void *)sub_244EA1110();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v13, v14);
  }
  objc_msgSend(v4, sel_setTimeZone_, v16);

  sub_244E87FDC(a3, (uint64_t)v10, &qword_257425D48);
  v17 = sub_244EA10F8();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v10, 1, v17) != 1)
  {
    v19 = (void *)sub_244EA10E0();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v17);
  }
  objc_msgSend(v4, sel_setLocale_, v19);

  v20 = (void *)sub_244EA11B8();
  if ((a1 & 1) != 0)
    v21 = &selRef_setLocalizedDateFormatFromTemplate_;
  else
    v21 = &selRef_setDateFormat_;
  objc_msgSend(v4, *v21, v20);

  return v4;
}

uint64_t sub_244E87FDC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

double sub_244E88020@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[13];
  uint64_t v12;

  sub_244E8992C(a1, (uint64_t)v11);
  if (!v2)
  {
    v5 = v11[11];
    *(_OWORD *)(a2 + 160) = v11[10];
    *(_OWORD *)(a2 + 176) = v5;
    *(_OWORD *)(a2 + 192) = v11[12];
    *(_QWORD *)(a2 + 208) = v12;
    v6 = v11[7];
    *(_OWORD *)(a2 + 96) = v11[6];
    *(_OWORD *)(a2 + 112) = v6;
    v7 = v11[9];
    *(_OWORD *)(a2 + 128) = v11[8];
    *(_OWORD *)(a2 + 144) = v7;
    v8 = v11[3];
    *(_OWORD *)(a2 + 32) = v11[2];
    *(_OWORD *)(a2 + 48) = v8;
    v9 = v11[5];
    *(_OWORD *)(a2 + 64) = v11[4];
    *(_OWORD *)(a2 + 80) = v9;
    result = *(double *)v11;
    v10 = v11[1];
    *(_OWORD *)a2 = v11[0];
    *(_OWORD *)(a2 + 16) = v10;
  }
  return result;
}

uint64_t sub_244E880A8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v15[13];
  uint64_t v16;
  _OWORD v17[13];
  uint64_t v18;

  v2 = *(_OWORD *)(a1 + 176);
  v15[10] = *(_OWORD *)(a1 + 160);
  v15[11] = v2;
  v15[12] = *(_OWORD *)(a1 + 192);
  v16 = *(_QWORD *)(a1 + 208);
  v3 = *(_OWORD *)(a1 + 112);
  v15[6] = *(_OWORD *)(a1 + 96);
  v15[7] = v3;
  v4 = *(_OWORD *)(a1 + 144);
  v15[8] = *(_OWORD *)(a1 + 128);
  v15[9] = v4;
  v5 = *(_OWORD *)(a1 + 48);
  v15[2] = *(_OWORD *)(a1 + 32);
  v15[3] = v5;
  v6 = *(_OWORD *)(a1 + 80);
  v15[4] = *(_OWORD *)(a1 + 64);
  v15[5] = v6;
  v7 = *(_OWORD *)(a1 + 16);
  v15[0] = *(_OWORD *)a1;
  v15[1] = v7;
  v8 = *(_OWORD *)(a2 + 176);
  v17[10] = *(_OWORD *)(a2 + 160);
  v17[11] = v8;
  v17[12] = *(_OWORD *)(a2 + 192);
  v18 = *(_QWORD *)(a2 + 208);
  v9 = *(_OWORD *)(a2 + 112);
  v17[6] = *(_OWORD *)(a2 + 96);
  v17[7] = v9;
  v10 = *(_OWORD *)(a2 + 144);
  v17[8] = *(_OWORD *)(a2 + 128);
  v17[9] = v10;
  v11 = *(_OWORD *)(a2 + 48);
  v17[2] = *(_OWORD *)(a2 + 32);
  v17[3] = v11;
  v12 = *(_OWORD *)(a2 + 80);
  v17[4] = *(_OWORD *)(a2 + 64);
  v17[5] = v12;
  v13 = *(_OWORD *)(a2 + 16);
  v17[0] = *(_OWORD *)a2;
  v17[1] = v13;
  return sub_244E88520((uint64_t)v15, (uint64_t)v17) & 1;
}

void sub_244E88158(char *a1)
{
  sub_244E8B1DC(*a1);
}

void sub_244E88164()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_244EA1500();
  __asm { BR              X9 }
}

uint64_t sub_244E881B4()
{
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

void sub_244E88224()
{
  __asm { BR              X10 }
}

uint64_t sub_244E88264()
{
  sub_244EA1230();
  return swift_bridgeObjectRelease();
}

void sub_244E882C0()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_244EA1500();
  __asm { BR              X9 }
}

uint64_t sub_244E8830C()
{
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

uint64_t sub_244E8837C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244E8A51C();
  *a1 = result;
  return result;
}

uint64_t sub_244E883A8()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_244E883DC + 4 * byte_244EA2CD4[*v0]))();
}

void sub_244E883DC(_QWORD *a1@<X8>)
{
  *a1 = 0x656D6954646E65;
  a1[1] = 0xE700000000000000;
}

void sub_244E883F8(_QWORD *a1@<X8>)
{
  *a1 = 0x6169726574697263;
  a1[1] = 0xE800000000000000;
}

void sub_244E88414(_QWORD *a1@<X8>)
{
  *a1 = 0x736567617373656DLL;
  a1[1] = 0xE800000000000000;
}

uint64_t sub_244E88430()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244E88464 + 4 * byte_244EA2CD8[*v0]))(0x6D69547472617473, 0xE900000000000065);
}

uint64_t sub_244E88464()
{
  return 0x656D6954646E65;
}

uint64_t sub_244E8847C()
{
  return 0x6169726574697263;
}

uint64_t sub_244E88494()
{
  return 0x736567617373656DLL;
}

uint64_t sub_244E884AC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244E8A51C();
  *a1 = result;
  return result;
}

uint64_t sub_244E884D0()
{
  sub_244E8A078();
  return sub_244EA1530();
}

uint64_t sub_244E884F8()
{
  sub_244E8A078();
  return sub_244EA153C();
}

uint64_t sub_244E88520(uint64_t a1, uint64_t a2)
{
  char v4;
  char v5;
  BOOL v6;
  char v7;
  _OWORD v9[11];
  _OWORD v10[11];
  _BYTE v11[176];
  _OWORD v12[11];
  uint64_t v13;
  uint64_t v14[22];
  uint64_t v15[22];
  _BYTE v16[176];
  _OWORD v17[11];

  v4 = *(_BYTE *)(a2 + 8);
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 8))
      goto LABEL_20;
  }
  else
  {
    if (*(double *)a1 != *(double *)a2)
      v4 = 1;
    if ((v4 & 1) != 0)
      goto LABEL_20;
  }
  v5 = *(_BYTE *)(a2 + 24);
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 24))
      goto LABEL_20;
  }
  else
  {
    if (*(double *)(a1 + 16) != *(double *)(a2 + 16))
      v5 = 1;
    if ((v5 & 1) != 0)
      goto LABEL_20;
  }
  sub_244E887DC(a1 + 32, (uint64_t)v14);
  sub_244E887DC(a2 + 32, (uint64_t)v15);
  sub_244E887DC((uint64_t)v14, (uint64_t)v16);
  if (sub_244E88824((uint64_t)v16) == 1)
  {
    sub_244E887DC((uint64_t)v15, (uint64_t)v12);
    if (sub_244E88824((uint64_t)v12) == 1)
      goto LABEL_19;
    goto LABEL_17;
  }
  sub_244E887DC((uint64_t)v15, (uint64_t)v11);
  if (sub_244E88824((uint64_t)v11) == 1)
  {
LABEL_17:
    sub_244E887DC((uint64_t)v14, (uint64_t)v12);
    sub_244E887DC((uint64_t)v15, (uint64_t)&v13);
    sub_244E88AEC(v14, (void (*)(uint64_t, uint64_t))sub_244E85B9C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E85858, (void (*)(uint64_t))sub_244E88840, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E8593C);
    sub_244E88AEC(v15, (void (*)(uint64_t, uint64_t))sub_244E85B9C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E85858, (void (*)(uint64_t))sub_244E88840, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E8593C);
    sub_244E88850((uint64_t)v12);
LABEL_20:
    v7 = 0;
    return v7 & 1;
  }
  sub_244E887DC((uint64_t)v14, (uint64_t)v9);
  v17[8] = v9[8];
  v17[9] = v9[9];
  v17[10] = v9[10];
  v17[4] = v9[4];
  v17[5] = v9[5];
  v17[6] = v9[6];
  v17[7] = v9[7];
  v17[0] = v9[0];
  v17[1] = v9[1];
  v17[2] = v9[2];
  v17[3] = v9[3];
  sub_244E887DC((uint64_t)v15, (uint64_t)v10);
  v12[8] = v10[8];
  v12[9] = v10[9];
  v12[10] = v10[10];
  v12[4] = v10[4];
  v12[5] = v10[5];
  v12[6] = v10[6];
  v12[7] = v10[7];
  v12[0] = v10[0];
  v12[1] = v10[1];
  v12[2] = v10[2];
  v12[3] = v10[3];
  sub_244E88AEC(v14, (void (*)(uint64_t, uint64_t))sub_244E85B9C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E85858, (void (*)(uint64_t))sub_244E88840, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E8593C);
  sub_244E88AEC(v15, (void (*)(uint64_t, uint64_t))sub_244E85B9C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E85858, (void (*)(uint64_t))sub_244E88840, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E8593C);
  v6 = sub_244E8529C(v17, v12);
  sub_244E88AEC(v15, (void (*)(uint64_t, uint64_t))sub_244E85BD0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E858CC, (void (*)(uint64_t))sub_244E88ADC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E85ACC);
  sub_244E88AEC(v14, (void (*)(uint64_t, uint64_t))sub_244E85BD0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E858CC, (void (*)(uint64_t))sub_244E88ADC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E85ACC);
  if (!v6)
    goto LABEL_20;
LABEL_19:
  v7 = sub_244E9D368(*(_QWORD *)(a1 + 208), *(_QWORD *)(a2 + 208));
  return v7 & 1;
}

uint64_t sub_244E887DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257425E98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_244E88824(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return ((_DWORD)v1 - 1) & ~(((int)v1 - 1) >> 31);
}

uint64_t sub_244E88840(uint64_t result)
{
  if (result != 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_244E88850(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v17 = *(_QWORD *)(a1 + 184);
  v18 = *(_QWORD *)(a1 + 176);
  v15 = *(_QWORD *)(a1 + 200);
  v16 = *(_QWORD *)(a1 + 192);
  v2 = *(_QWORD *)(a1 + 216);
  v14 = *(_QWORD *)(a1 + 208);
  v3 = *(_QWORD *)(a1 + 224);
  v4 = *(_QWORD *)(a1 + 232);
  v12 = *(_OWORD *)(a1 + 256);
  v13 = *(_OWORD *)(a1 + 240);
  v11 = *(_OWORD *)(a1 + 272);
  v9 = *(_OWORD *)(a1 + 304);
  v10 = *(_OWORD *)(a1 + 288);
  v8 = *(_OWORD *)(a1 + 320);
  v6 = *(_QWORD *)(a1 + 336);
  v5 = *(_QWORD *)(a1 + 344);
  sub_244E8899C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    (void (*)(uint64_t, uint64_t))sub_244E85BD0,
    (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E858CC,
    (void (*)(uint64_t))sub_244E88ADC,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E85ACC);
  sub_244E8899C(v18, v17, v16, v15, v14, v2, v3, v4, v13, *((uint64_t *)&v13 + 1), v12, *((uint64_t *)&v12 + 1), v11, *((uint64_t *)&v11 + 1), v10, *((uint64_t *)&v10 + 1), v9, *((uint64_t *)&v9 + 1), v8,
    *((uint64_t *)&v8 + 1),
    v6,
    v5,
    (void (*)(uint64_t, uint64_t))sub_244E85BD0,
    (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E858CC,
    (void (*)(uint64_t))sub_244E88ADC,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E85ACC);
  return a1;
}

uint64_t sub_244E8899C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void (*a23)(uint64_t, uint64_t),void (*a24)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t),void (*a25)(uint64_t),uint64_t (*a26)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t result;

  if (a2 != 2)
  {
    a23(a2, a3);
    a24(a4, a5, a6, a7, a8, a9);
    a25(a10);
    return a26(a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22);
  }
  return result;
}

uint64_t sub_244E88ADC(uint64_t result)
{
  if (result != 1)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t *sub_244E88AEC(uint64_t *a1, void (*a2)(uint64_t, uint64_t), void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), void (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  sub_244E8899C(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18],
    a1[19],
    a1[20],
    a1[21],
    a2,
    a3,
    a4,
    a5);
  return a1;
}

uint64_t destroy for MusicIssue(_QWORD *a1)
{
  uint64_t v2;

  v2 = a1[5];
  if (v2 != 1)
  {
    if (v2 == 2)
      return swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[7] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[13] != 1)
    swift_bridgeObjectRelease();
  if (a1[14] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MusicIssue(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
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
  uint64_t v35;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = (_OWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  if (v5 == 2)
  {
    v6 = *(_OWORD *)(a2 + 176);
    *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 176) = v6;
    *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
    v7 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 112) = v7;
    v8 = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 144) = v8;
    v9 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *v4;
    *(_OWORD *)(a1 + 48) = v9;
    v10 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v10;
  }
  else
  {
    *(_BYTE *)(a1 + 32) = *(_BYTE *)v4;
    if (v5 == 1)
    {
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    }
    else
    {
      v11 = *(_QWORD *)(a2 + 48);
      *(_QWORD *)(a1 + 40) = v5;
      *(_QWORD *)(a1 + 48) = v11;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    v12 = *(_QWORD *)(a2 + 56);
    if (v12 == 1)
    {
      v13 = *(_OWORD *)(a2 + 72);
      *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a1 + 72) = v13;
      *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    }
    else
    {
      v14 = *(_QWORD *)(a2 + 64);
      v15 = *(_QWORD *)(a2 + 72);
      *(_QWORD *)(a1 + 56) = v12;
      *(_QWORD *)(a1 + 64) = v14;
      v16 = *(_QWORD *)(a2 + 80);
      v17 = *(_QWORD *)(a2 + 88);
      *(_QWORD *)(a1 + 72) = v15;
      *(_QWORD *)(a1 + 80) = v16;
      v18 = *(_QWORD *)(a2 + 96);
      *(_QWORD *)(a1 + 88) = v17;
      *(_QWORD *)(a1 + 96) = v18;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    v19 = *(_QWORD *)(a2 + 104);
    if (v19 != 1)
      v19 = swift_bridgeObjectRetain();
    *(_QWORD *)(a1 + 104) = v19;
    v20 = *(_QWORD *)(a2 + 112);
    if (v20 == 1)
    {
      v21 = *(_OWORD *)(a2 + 160);
      *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
      *(_OWORD *)(a1 + 160) = v21;
      v22 = *(_OWORD *)(a2 + 192);
      *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
      *(_OWORD *)(a1 + 192) = v22;
      v23 = *(_OWORD *)(a2 + 128);
      *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
      *(_OWORD *)(a1 + 128) = v23;
    }
    else
    {
      v24 = *(_QWORD *)(a2 + 120);
      v25 = *(_QWORD *)(a2 + 128);
      *(_QWORD *)(a1 + 112) = v20;
      *(_QWORD *)(a1 + 120) = v24;
      v26 = *(_QWORD *)(a2 + 136);
      v27 = *(_QWORD *)(a2 + 144);
      *(_QWORD *)(a1 + 128) = v25;
      *(_QWORD *)(a1 + 136) = v26;
      v28 = *(_QWORD *)(a2 + 152);
      v29 = *(_QWORD *)(a2 + 160);
      *(_QWORD *)(a1 + 144) = v27;
      *(_QWORD *)(a1 + 152) = v28;
      v30 = *(_QWORD *)(a2 + 168);
      v31 = *(_QWORD *)(a2 + 176);
      *(_QWORD *)(a1 + 160) = v29;
      *(_QWORD *)(a1 + 168) = v30;
      v32 = *(_QWORD *)(a2 + 184);
      v35 = *(_QWORD *)(a2 + 192);
      *(_QWORD *)(a1 + 176) = v31;
      *(_QWORD *)(a1 + 184) = v32;
      v33 = *(_QWORD *)(a2 + 200);
      *(_QWORD *)(a1 + 192) = v35;
      *(_QWORD *)(a1 + 200) = v33;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MusicIssue(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  __int128 *v8;
  __int128 *v9;
  _OWORD *v10;
  uint64_t v11;
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
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 *v38;
  uint64_t v39;
  __int128 *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _OWORD *v48;
  _OWORD *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;

  v4 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v4;
  v5 = a2[2];
  *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  v7 = a2 + 5;
  v6 = a2[5];
  v8 = (__int128 *)(a1 + 32);
  v9 = (__int128 *)(a2 + 4);
  v10 = (_OWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 40);
  if (v11 == 2)
  {
    if (v6 == 2)
    {
      v12 = *v9;
      v13 = *((_OWORD *)a2 + 4);
      *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
      *(_OWORD *)(a1 + 64) = v13;
      *v8 = v12;
      v14 = *((_OWORD *)a2 + 5);
      v15 = *((_OWORD *)a2 + 6);
      v16 = *((_OWORD *)a2 + 8);
      *(_OWORD *)(a1 + 112) = *((_OWORD *)a2 + 7);
      *(_OWORD *)(a1 + 128) = v16;
      *(_OWORD *)(a1 + 80) = v14;
      *(_OWORD *)(a1 + 96) = v15;
      v17 = *((_OWORD *)a2 + 9);
      v18 = *((_OWORD *)a2 + 10);
      v19 = *((_OWORD *)a2 + 12);
      *(_OWORD *)(a1 + 176) = *((_OWORD *)a2 + 11);
      *(_OWORD *)(a1 + 192) = v19;
      *(_OWORD *)(a1 + 144) = v17;
      *(_OWORD *)(a1 + 160) = v18;
      goto LABEL_45;
    }
    *(_BYTE *)v8 = *(_BYTE *)v9;
    if (*(_QWORD *)v7 == 1)
    {
      *v10 = *v7;
    }
    else
    {
      *(_QWORD *)(a1 + 40) = *(_QWORD *)v7;
      *(_QWORD *)(a1 + 48) = a2[6];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    v29 = a2[7];
    if (v29 == 1)
    {
      v30 = *(_OWORD *)(a2 + 7);
      v31 = *(_OWORD *)(a2 + 11);
      *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 9);
      *(_OWORD *)(a1 + 88) = v31;
      *(_OWORD *)(a1 + 56) = v30;
    }
    else
    {
      *(_QWORD *)(a1 + 56) = v29;
      *(_QWORD *)(a1 + 64) = a2[8];
      *(_QWORD *)(a1 + 72) = a2[9];
      *(_QWORD *)(a1 + 80) = a2[10];
      *(_QWORD *)(a1 + 88) = a2[11];
      *(_QWORD *)(a1 + 96) = a2[12];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    v32 = a2[13];
    if (v32 != 1)
      v32 = swift_bridgeObjectRetain();
    *(_QWORD *)(a1 + 104) = v32;
    v33 = a2[14];
    if (v33 == 1)
    {
      v34 = *((_OWORD *)a2 + 8);
      *(_OWORD *)(a1 + 112) = *((_OWORD *)a2 + 7);
      *(_OWORD *)(a1 + 128) = v34;
      v35 = *((_OWORD *)a2 + 9);
      v36 = *((_OWORD *)a2 + 10);
      v37 = *((_OWORD *)a2 + 12);
      *(_OWORD *)(a1 + 176) = *((_OWORD *)a2 + 11);
      *(_OWORD *)(a1 + 192) = v37;
      *(_OWORD *)(a1 + 144) = v35;
      *(_OWORD *)(a1 + 160) = v36;
      goto LABEL_45;
    }
LABEL_41:
    *(_QWORD *)(a1 + 112) = v33;
    *(_QWORD *)(a1 + 120) = a2[15];
    *(_QWORD *)(a1 + 128) = a2[16];
    *(_QWORD *)(a1 + 136) = a2[17];
    *(_QWORD *)(a1 + 144) = a2[18];
    *(_QWORD *)(a1 + 152) = a2[19];
    *(_QWORD *)(a1 + 160) = a2[20];
    *(_QWORD *)(a1 + 168) = a2[21];
    *(_QWORD *)(a1 + 176) = a2[22];
    *(_QWORD *)(a1 + 184) = a2[23];
    *(_QWORD *)(a1 + 192) = a2[24];
    *(_QWORD *)(a1 + 200) = a2[25];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_45;
  }
  if (v6 == 2)
  {
    sub_244E8950C((_QWORD *)(a1 + 32));
    v21 = v9[1];
    v20 = v9[2];
    *v8 = *v9;
    v8[1] = v21;
    v8[2] = v20;
    v22 = v9[6];
    v24 = v9[3];
    v23 = v9[4];
    v8[5] = v9[5];
    v8[6] = v22;
    v8[3] = v24;
    v8[4] = v23;
    v25 = v9[10];
    v27 = v9[7];
    v26 = v9[8];
    v8[9] = v9[9];
    v8[10] = v25;
    v8[7] = v27;
    v8[8] = v26;
    goto LABEL_45;
  }
  *(_BYTE *)v8 = *(_BYTE *)v9;
  v28 = *(_QWORD *)v7;
  if (v11 == 1)
  {
    if (v28 != 1)
    {
      *(_QWORD *)(a1 + 40) = v28;
      *(_QWORD *)(a1 + 48) = a2[6];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_23;
    }
    goto LABEL_16;
  }
  if (v28 == 1)
  {
    sub_244E7F9CC((uint64_t)v10);
LABEL_16:
    *v10 = *v7;
    goto LABEL_23;
  }
  *(_QWORD *)(a1 + 40) = v28;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_23:
  v38 = (__int128 *)(a1 + 56);
  v40 = (__int128 *)(a2 + 7);
  v39 = a2[7];
  if (*(_QWORD *)(a1 + 56) == 1)
  {
    if (v39 == 1)
    {
      v41 = *v40;
      v42 = *(_OWORD *)(a2 + 11);
      *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 9);
      *(_OWORD *)(a1 + 88) = v42;
      *v38 = v41;
    }
    else
    {
      *(_QWORD *)(a1 + 56) = v39;
      *(_QWORD *)(a1 + 64) = a2[8];
      *(_QWORD *)(a1 + 72) = a2[9];
      *(_QWORD *)(a1 + 80) = a2[10];
      *(_QWORD *)(a1 + 88) = a2[11];
      *(_QWORD *)(a1 + 96) = a2[12];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v39 == 1)
  {
    sub_244E86364(a1 + 56);
    v44 = *(_OWORD *)(a2 + 9);
    v43 = *(_OWORD *)(a2 + 11);
    *v38 = *v40;
    *(_OWORD *)(a1 + 72) = v44;
    *(_OWORD *)(a1 + 88) = v43;
  }
  else
  {
    *(_QWORD *)(a1 + 56) = v39;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 64) = a2[8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 72) = a2[9];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 80) = a2[10];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 88) = a2[11];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 96) = a2[12];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  v45 = (uint64_t *)(a1 + 104);
  v46 = a2[13];
  if (*(_QWORD *)(a1 + 104) == 1)
  {
    if (v46 == 1)
    {
      v47 = 1;
LABEL_35:
      *v45 = v47;
      goto LABEL_38;
    }
    *v45 = v46;
    swift_bridgeObjectRetain();
  }
  else
  {
    if (v46 == 1)
    {
      sub_244E7FA34(a1 + 104);
      v47 = a2[13];
      goto LABEL_35;
    }
    *v45 = v46;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
LABEL_38:
  v48 = (_OWORD *)(a1 + 112);
  v49 = a2 + 14;
  v33 = a2[14];
  if (*(_QWORD *)(a1 + 112) == 1)
  {
    if (v33 == 1)
    {
      v50 = *((_OWORD *)a2 + 8);
      *v48 = *v49;
      *(_OWORD *)(a1 + 128) = v50;
      v51 = *((_OWORD *)a2 + 9);
      v52 = *((_OWORD *)a2 + 10);
      v53 = *((_OWORD *)a2 + 12);
      *(_OWORD *)(a1 + 176) = *((_OWORD *)a2 + 11);
      *(_OWORD *)(a1 + 192) = v53;
      *(_OWORD *)(a1 + 144) = v51;
      *(_OWORD *)(a1 + 160) = v52;
      goto LABEL_45;
    }
    goto LABEL_41;
  }
  if (v33 == 1)
  {
    sub_244E86398(a1 + 112);
    v54 = *((_OWORD *)a2 + 8);
    *v48 = *v49;
    *(_OWORD *)(a1 + 128) = v54;
    v55 = *((_OWORD *)a2 + 12);
    v57 = *((_OWORD *)a2 + 9);
    v56 = *((_OWORD *)a2 + 10);
    *(_OWORD *)(a1 + 176) = *((_OWORD *)a2 + 11);
    *(_OWORD *)(a1 + 192) = v55;
    *(_OWORD *)(a1 + 144) = v57;
    *(_OWORD *)(a1 + 160) = v56;
  }
  else
  {
    *(_QWORD *)(a1 + 112) = v33;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 120) = a2[15];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 128) = a2[16];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 136) = a2[17];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 144) = a2[18];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 152) = a2[19];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 160) = a2[20];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 168) = a2[21];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 176) = a2[22];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 184) = a2[23];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 192) = a2[24];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 200) = a2[25];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
LABEL_45:
  *(_QWORD *)(a1 + 208) = a2[26];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *sub_244E8950C(_QWORD *a1)
{
  destroy for MusicCriteria(a1);
  return a1;
}

__n128 __swift_memcpy216_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;
  __int128 v11;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  result = *(__n128 *)(a2 + 160);
  v10 = *(_OWORD *)(a2 + 176);
  v11 = *(_OWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 176) = v10;
  *(_OWORD *)(a1 + 192) = v11;
  *(__n128 *)(a1 + 160) = result;
  return result;
}

uint64_t assignWithTake for MusicIssue(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = a1 + 32;
  v5 = (_OWORD *)(a2 + 32);
  v7 = (_OWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 == 2)
    goto LABEL_4;
  v9 = (_OWORD *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 40);
  if (v8 == 2)
  {
    sub_244E8950C((_QWORD *)v4);
LABEL_4:
    v10 = v5[9];
    *(_OWORD *)(v4 + 128) = v5[8];
    *(_OWORD *)(v4 + 144) = v10;
    *(_OWORD *)(v4 + 160) = v5[10];
    v11 = v5[5];
    *(_OWORD *)(v4 + 64) = v5[4];
    *(_OWORD *)(v4 + 80) = v11;
    v12 = v5[7];
    *(_OWORD *)(v4 + 96) = v5[6];
    *(_OWORD *)(v4 + 112) = v12;
    v13 = v5[1];
    *(_OWORD *)v4 = *v5;
    *(_OWORD *)(v4 + 16) = v13;
    v14 = v5[3];
    *(_OWORD *)(v4 + 32) = v5[2];
    *(_OWORD *)(v4 + 48) = v14;
    goto LABEL_25;
  }
  *(_BYTE *)v4 = *(_BYTE *)v5;
  if (v6 == 1)
    goto LABEL_8;
  if (v8 == 1)
  {
    sub_244E7F9CC((uint64_t)v7);
LABEL_8:
    *v7 = *v9;
    goto LABEL_10;
  }
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
LABEL_10:
  v15 = *(_QWORD *)(a2 + 56);
  if (*(_QWORD *)(a1 + 56) == 1)
  {
LABEL_13:
    v16 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v16;
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    goto LABEL_15;
  }
  if (v15 == 1)
  {
    sub_244E86364(a1 + 56);
    goto LABEL_13;
  }
  *(_QWORD *)(a1 + 56) = v15;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
LABEL_15:
  v17 = (uint64_t *)(a1 + 104);
  v18 = *(_QWORD *)(a2 + 104);
  if (*(_QWORD *)(a1 + 104) != 1)
  {
    if (v18 != 1)
    {
      *v17 = v18;
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    sub_244E7FA34(a1 + 104);
    v18 = 1;
  }
  *v17 = v18;
LABEL_20:
  v19 = *(_QWORD *)(a2 + 112);
  if (*(_QWORD *)(a1 + 112) != 1)
  {
    if (v19 != 1)
    {
      *(_QWORD *)(a1 + 112) = v19;
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
      swift_bridgeObjectRelease();
      goto LABEL_25;
    }
    sub_244E86398(a1 + 112);
  }
  v20 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v20;
  v21 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v21;
  v22 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v22;
LABEL_25:
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MusicIssue(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 216))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 208);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MusicIssue(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
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
      *(_BYTE *)(result + 216) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 208) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 216) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicIssue()
{
  return &type metadata for MusicIssue;
}

uint64_t *sub_244E8992C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t *result;
  char *v9;
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
  void (*v21)(__int128 *__return_ptr);
  BOOL v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(__int128 *__return_ptr);
  uint64_t v39;
  char v40;
  _BYTE *v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
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
  __int128 v66;
  __int128 v67;
  uint64_t v68;
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
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  char v83;
  uint64_t v84[22];
  __int128 v85;
  __int128 v86;
  _OWORD v87[11];
  uint64_t v88;
  uint64_t v89;

  v89 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257425EA0);
  v5 = *(_QWORD *)(v4 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v85 = 0;
  BYTE8(v85) = 1;
  *(_QWORD *)&v86 = 0;
  BYTE8(v86) = 1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244E8A078();
  sub_244EA1524();
  if (v2)
    return (uint64_t *)__swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v53 = a1;
  v54 = v5;
  LOBYTE(v69) = 0;
  v9 = v7;
  sub_244EA1488();
  v10 = v4;
  v12 = v11;
  *(_QWORD *)&v55 = 0;
  v13 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  *(&v51 - 2) = (uint64_t)&v55;
  if ((v15 & 0x1000000000000000) == 0 && v12 & 0x2000000000000000 | v14 & 0x1000000000000000)
  {
    MEMORY[0x24BDAC7A8](sub_244E8A2F8, v13);
    *(&v51 - 2) = v18;
    *(&v51 - 1) = (uint64_t)(&v51 - 4);
    v19 = v89;
    if ((v12 & 0x2000000000000000) != 0)
    {
      *(_QWORD *)&v69 = v16;
      *((_QWORD *)&v69 + 1) = v12 & 0xFFFFFFFFFFFFFFLL;
      if (v16 <= 0x20u && ((0x100003E01uLL >> v16) & 1) != 0)
      {
        v22 = 0;
        v23 = v54;
      }
      else
      {
        v24 = (_BYTE *)_swift_stdlib_strtod_clocale();
        v23 = v54;
        if (v24)
          v22 = *v24 == 0;
        else
          v22 = 0;
      }
      goto LABEL_15;
    }
    v52 = v17;
    if ((v16 & 0x1000000000000000) != 0)
    {
      v20 = (v12 & 0xFFFFFFFFFFFFFFFLL) + 32;
      v21 = (void (*)(__int128 *__return_ptr))sub_244E8A2F8;
    }
    else
    {
      v20 = sub_244EA1434();
      v21 = (void (*)(__int128 *__return_ptr))*(&v51 - 2);
      if (!v20)
      {
        v21(&v69);
        v22 = v69;
        v23 = v54;
        v19 = v89;
        goto LABEL_15;
      }
      v19 = v89;
    }
    ((void (*)(__int128 *__return_ptr, uint64_t))v21)(&v69, v20);
    v22 = v69;
    v23 = v54;
LABEL_15:
    LOBYTE(v84[0]) = v22;
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  sub_244EA141C();
  swift_bridgeObjectRelease();
  v23 = v54;
  v19 = v89;
LABEL_16:
  v25 = v55;
  if (!LOBYTE(v84[0]))
    v25 = 0;
  v26 = (uint64_t)v53;
  *(_QWORD *)&v85 = v25;
  BYTE8(v85) = LOBYTE(v84[0]) ^ 1;
  LOBYTE(v69) = 1;
  v27 = sub_244EA1488();
  v29 = v28;
  *(_QWORD *)&v55 = 0;
  v31 = MEMORY[0x24BDAC7A8](v30, v27);
  *(&v51 - 2) = (uint64_t)&v55;
  v52 = v33;
  if ((v34 & 0x1000000000000000) != 0
    || (v35 = (_QWORD *)(v29 & 0x2000000000000000 | v32 & 0x1000000000000000)) == 0)
  {
    sub_244EA141C();
    goto LABEL_25;
  }
  MEMORY[0x24BDAC7A8](v35, v31);
  v38 = (void (*)(__int128 *__return_ptr))sub_244E8A2F8;
  *(&v51 - 2) = (uint64_t)sub_244E8A2F8;
  *(&v51 - 1) = (uint64_t)(&v51 - 4);
  if ((v29 & 0x2000000000000000) != 0)
  {
    *(_QWORD *)&v69 = v36;
    *((_QWORD *)&v69 + 1) = v29 & 0xFFFFFFFFFFFFFFLL;
    if (v36 <= 0x20u && ((0x100003E01uLL >> v36) & 1) != 0)
    {
      v42 = 0;
      v23 = v54;
    }
    else
    {
      v41 = (_BYTE *)_swift_stdlib_strtod_clocale();
      v23 = v54;
      if (v41)
        v42 = *v41 == 0;
      else
        v42 = 0;
    }
    LOBYTE(v84[0]) = v42;
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
  v51 = v37;
  if ((v36 & 0x1000000000000000) != 0)
  {
    v39 = (v29 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v39 = sub_244EA1434();
    v38 = (void (*)(__int128 *__return_ptr))*(&v51 - 2);
    if (!v39)
    {
      v38(&v69);
      v40 = v69;
      v26 = (uint64_t)v53;
      v23 = v54;
      v19 = v89;
      goto LABEL_24;
    }
    v26 = (uint64_t)v53;
    v19 = v89;
  }
  ((void (*)(__int128 *__return_ptr, uint64_t))v38)(&v69, v39);
  v40 = v69;
  v23 = v54;
LABEL_24:
  LOBYTE(v84[0]) = v40;
LABEL_25:
  swift_bridgeObjectRelease();
LABEL_33:
  v43 = v55;
  if (!LOBYTE(v84[0]))
    v43 = 0;
  *(_QWORD *)&v86 = v43;
  BYTE8(v86) = LOBYTE(v84[0]) ^ 1;
  v83 = 2;
  sub_244E8A0BC();
  sub_244EA1494();
  v63 = v77;
  v64 = v78;
  v65 = v79;
  v59 = v73;
  v60 = v74;
  v61 = v75;
  v62 = v76;
  v55 = v69;
  v56 = v70;
  v57 = v71;
  v58 = v72;
  nullsub_1(&v55);
  sub_244E887DC((uint64_t)&v55, (uint64_t)v84);
  sub_244E887DC((uint64_t)v84, (uint64_t)v87);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257425EB8);
  LOBYTE(v55) = 3;
  sub_244E88AEC(v84, (void (*)(uint64_t, uint64_t))sub_244E85B9C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E85858, (void (*)(uint64_t))sub_244E88840, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E8593C);
  sub_244E8A128();
  sub_244EA1494();
  v44 = v69;
  (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v10);
  v88 = v44;
  *(_QWORD *)&v55 = v85;
  BYTE8(v55) = BYTE8(v85);
  *(_QWORD *)&v56 = v86;
  BYTE8(v56) = BYTE8(v86);
  sub_244E887DC((uint64_t)v84, (uint64_t)&v57);
  v68 = v44;
  sub_244E8A1D0((uint64_t *)&v55);
  sub_244E88AEC(v84, (void (*)(uint64_t, uint64_t))sub_244E85BD0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E858CC, (void (*)(uint64_t))sub_244E88ADC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E85ACC);
  __swift_destroy_boxed_opaque_existential_1(v26);
  v79 = v87[8];
  v80 = v87[9];
  v81 = v87[10];
  v82 = v88;
  v75 = v87[4];
  v76 = v87[5];
  v77 = v87[6];
  v78 = v87[7];
  v71 = v87[0];
  v72 = v87[1];
  v73 = v87[2];
  v74 = v87[3];
  v69 = v85;
  v70 = v86;
  result = sub_244E8A264((uint64_t *)&v69);
  v45 = v66;
  *(_OWORD *)(v19 + 160) = v65;
  *(_OWORD *)(v19 + 176) = v45;
  *(_OWORD *)(v19 + 192) = v67;
  *(_QWORD *)(v19 + 208) = v68;
  v46 = v62;
  *(_OWORD *)(v19 + 96) = v61;
  *(_OWORD *)(v19 + 112) = v46;
  v47 = v64;
  *(_OWORD *)(v19 + 128) = v63;
  *(_OWORD *)(v19 + 144) = v47;
  v48 = v58;
  *(_OWORD *)(v19 + 32) = v57;
  *(_OWORD *)(v19 + 48) = v48;
  v49 = v60;
  *(_OWORD *)(v19 + 64) = v59;
  *(_OWORD *)(v19 + 80) = v49;
  v50 = v56;
  *(_OWORD *)v19 = v55;
  *(_OWORD *)(v19 + 16) = v50;
  return result;
}

unint64_t sub_244E8A078()
{
  unint64_t result;

  result = qword_257425EA8;
  if (!qword_257425EA8)
  {
    result = MEMORY[0x249528E58](&unk_244EA2E48, &type metadata for MusicIssue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425EA8);
  }
  return result;
}

unint64_t sub_244E8A0BC()
{
  unint64_t result;

  result = qword_257425EB0;
  if (!qword_257425EB0)
  {
    result = MEMORY[0x249528E58](&unk_244EA27E4, &type metadata for MusicCriteria);
    atomic_store(result, (unint64_t *)&qword_257425EB0);
  }
  return result;
}

double sub_244E8A100(_OWORD *a1)
{
  double result;

  result = 0.0;
  *a1 = xmmword_244EA2340;
  a1[1] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  return result;
}

unint64_t sub_244E8A128()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_257425EC0;
  if (!qword_257425EC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257425EB8);
    v2 = sub_244E8A18C();
    result = MEMORY[0x249528E58](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_257425EC0);
  }
  return result;
}

unint64_t sub_244E8A18C()
{
  unint64_t result;

  result = qword_257425EC8;
  if (!qword_257425EC8)
  {
    result = MEMORY[0x249528E58](&unk_244EA23F4, &type metadata for MusicMessage);
    atomic_store(result, (unint64_t *)&qword_257425EC8);
  }
  return result;
}

uint64_t *sub_244E8A1D0(uint64_t *a1)
{
  sub_244E8899C(a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18], a1[19], a1[20], a1[21], a1[22],
    a1[23],
    a1[24],
    a1[25],
    (void (*)(uint64_t, uint64_t))sub_244E85B9C,
    (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E85858,
    (void (*)(uint64_t))sub_244E88840,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E8593C);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *sub_244E8A264(uint64_t *a1)
{
  sub_244E8899C(a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18], a1[19], a1[20], a1[21], a1[22],
    a1[23],
    a1[24],
    a1[25],
    (void (*)(uint64_t, uint64_t))sub_244E85BD0,
    (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E858CC,
    (void (*)(uint64_t))sub_244E88ADC,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E85ACC);
  swift_bridgeObjectRelease();
  return a1;
}

_BYTE *sub_244E8A2F8@<X0>(_BYTE *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_244E8A30C(a1, a2);
}

_BYTE *sub_244E8A30C@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = *result;
  v4 = v3 > 0x20;
  v5 = (1 << v3) & 0x100003E01;
  v6 = v4 || v5 == 0;
  v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

uint64_t storeEnumTagSinglePayload for MusicIssue.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244E8A3C4 + 4 * byte_244EA2CE1[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_244E8A3F8 + 4 * byte_244EA2CDC[v4]))();
}

uint64_t sub_244E8A3F8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E8A400(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244E8A408);
  return result;
}

uint64_t sub_244E8A414(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244E8A41CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_244E8A420(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E8A428(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MusicIssue.CodingKeys()
{
  return &type metadata for MusicIssue.CodingKeys;
}

unint64_t sub_244E8A448()
{
  unint64_t result;

  result = qword_257425ED0;
  if (!qword_257425ED0)
  {
    result = MEMORY[0x249528E58](&unk_244EA2E20, &type metadata for MusicIssue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425ED0);
  }
  return result;
}

unint64_t sub_244E8A490()
{
  unint64_t result;

  result = qword_257425ED8;
  if (!qword_257425ED8)
  {
    result = MEMORY[0x249528E58](&unk_244EA2D58, &type metadata for MusicIssue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425ED8);
  }
  return result;
}

unint64_t sub_244E8A4D8()
{
  unint64_t result;

  result = qword_257425EE0;
  if (!qword_257425EE0)
  {
    result = MEMORY[0x249528E58](&unk_244EA2D80, &type metadata for MusicIssue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425EE0);
  }
  return result;
}

uint64_t sub_244E8A51C()
{
  unint64_t v0;

  v0 = sub_244EA147C();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

void sub_244E8A568(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_244E8A5C4(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_244E8A628 + 4 * byte_244EA2EA4[a2]))(0x73654D726F727265);
}

uint64_t sub_244E8A628(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x73654D726F727265 && v1 == 0xEC00000065676173)
    v2 = 1;
  else
    v2 = sub_244EA14AC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_244E8A6D4(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_244E8A738(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_244E8A7D4 + 4 * byte_244EA2EAE[a2]))(0x614E656369766564);
}

uint64_t sub_244E8A7D4(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x614E656369766564 && v1 == 0xEA0000000000656DLL)
    v2 = 1;
  else
    v2 = sub_244EA14AC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_244E8A8C4(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_244E8A928(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_244E8A988 + 4 * byte_244EA2EB8[a2]))(0x6449646E617262);
}

uint64_t sub_244E8A988(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x6449646E617262 && v1 == 0xE700000000000000)
    v2 = 1;
  else
    v2 = sub_244EA14AC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_244E8AA30(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_244E8AA94(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_244E8AB74 + 4 * byte_244EA2EC4[a2]))(0x614E656369766564);
}

uint64_t sub_244E8AB74(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x614E656369766564 && v1 == 0xEA0000000000656DLL)
    v2 = 1;
  else
    v2 = sub_244EA14AC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_244E8ACB8(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x6574617473;
  else
    v3 = 0x7972746E756F63;
  if (v2)
    v4 = 0xE700000000000000;
  else
    v4 = 0xE500000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x6574617473;
  else
    v5 = 0x7972746E756F63;
  if ((a2 & 1) != 0)
    v6 = 0xE500000000000000;
  else
    v6 = 0xE700000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_244EA14AC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_244E8AD5C(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_244E8AD9C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_244E8AE10 + 4 * byte_244EA2ED1[a2]))(0x6F65646976);
}

uint64_t sub_244E8AE10(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x6F65646976 && v1 == 0xE500000000000000)
    v2 = 1;
  else
    v2 = sub_244EA14AC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_244E8AECC(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_244E8AF14(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_244E8AF6C + 4 * byte_244EA2EDA[a2]))(2036625250);
}

uint64_t sub_244E8AF6C(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 2036625250 && v1 == 0xE400000000000000)
    v2 = 1;
  else
    v2 = sub_244EA14AC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_244E8B008(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  if ((a1 & 1) != 0)
    v2 = 0x636973756DLL;
  else
    v2 = 0x6F65646976;
  if ((a2 & 1) != 0)
    v3 = 0x636973756DLL;
  else
    v3 = 0x6F65646976;
  if (v2 == v3)
    v4 = 1;
  else
    v4 = sub_244EA14AC();
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

void sub_244E8B07C(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_244E8B0BC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_244E8B128 + 4 * byte_244EA2EE3[a2]))(0x6E6F697461636F6CLL);
}

uint64_t sub_244E8B128(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x6E6F697461636F6CLL && v1 == 0xE800000000000000)
    v2 = 1;
  else
    v2 = sub_244EA14AC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_244E8B1DC(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_244E8B238(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_244E8B298 + 4 * byte_244EA2EEC[a2]))(0x656D6954646E65);
}

uint64_t sub_244E8B298(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x656D6954646E65 && v1 == 0xE700000000000000)
    v2 = 1;
  else
    v2 = sub_244EA14AC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_244E8B340(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  void (*v19)(void);
  uint64_t v20;
  id v21;
  unint64_t v23;
  char v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  objc_class *v33;
  char *v34;
  uint64_t *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  char v48;
  char v49;
  __int128 *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t *v72;
  unint64_t v73;
  double v74;
  double v75;
  double v76;
  void (*v77)(char *, uint64_t);
  double v78;
  double v79;
  double v80;
  void (*v81)(char *, uint64_t);
  char v82;
  void (*v83)(uint64_t);
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(uint64_t);
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  __int128 v92;
  objc_class *v93;
  char *v94;
  unint64_t *v95;
  id v96;
  void (*v97)(_QWORD, id, unint64_t);
  uint64_t v98;
  _QWORD v99[2];
  uint64_t v100;
  unint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  uint64_t v105;
  unint64_t v106;
  _QWORD *v107;
  Class v108;
  uint64_t v109;
  unint64_t v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  int v118;
  __int128 *v119;
  uint64_t v120;
  objc_super v121;
  __int128 v122;
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
  __int128 v133;
  __int128 v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  uint64_t v144;
  _BYTE v145[176];
  objc_super v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  uint64_t v160;
  _QWORD v161[12];
  uint64_t v162[7];
  _OWORD v163[3];
  uint64_t v164;
  _OWORD v165[3];
  uint64_t v166;
  uint64_t v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  uint64_t v173;
  id v174;
  unint64_t v175;

  v3 = v2;
  v6 = sub_244EA10BC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](*(_QWORD **)(v7 + 64), v6);
  v10 = (char *)v99 - (((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9, v8);
  v12 = (char *)v99 - v11;
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_6;
  v13 = sub_244E8C4C8(0x80u);
  if ((v14 & 1) == 0 || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v13) + 16))
    goto LABEL_6;
  v15 = sub_244EA1200();
  v17 = v16;
  swift_bridgeObjectRetain();
  v18 = sub_244E7EBA8();
  if (v18 == 5)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    (*(void (**)(_QWORD, unint64_t, unint64_t))(v3 + 56))(0, 0xD00000000000001BLL, 0x8000000244EA4A60);
LABEL_7:
    v19 = *(void (**)(void))(v3 + 72);
    sub_244E8C4A0((uint64_t)&v147);
    sub_244E8DFFC((uint64_t)&v147, (uint64_t)&v174, &qword_257425EF0);
    sub_244E8D5AC(a1, (uint64_t)&v174, (uint64_t)objc_msgSend(a2, sel_code), 1);
    v19();
    v20 = swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v3 + 88))(v20);
  }
  v118 = v18;
  v116 = v15;
  if (!*(_QWORD *)(a1 + 16)
    || (v23 = sub_244E8C4C8(0x8Cu), (v24 & 1) == 0)
    || (v25 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * v23), !v25[2]))
  {
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD, unint64_t, unint64_t))(v3 + 56))(0, 0xD000000000000012, 0x8000000244EA4A80);
    goto LABEL_7;
  }
  v26 = v25[5];
  v109 = v25[4];
  v27 = qword_257425C00;
  v114 = v17;
  v115 = v26;
  swift_bridgeObjectRetain();
  if (v27 != -1)
    swift_once();
  v28 = sub_244EA1038();
  v119 = (__int128 *)v29;
  v120 = v28;
  sub_244E7E604(v118);
  v117 = v30;
  v32 = v31;
  v33 = (objc_class *)type metadata accessor for QOSAlertMessage();
  v34 = (char *)objc_allocWithZone(v33);
  v35 = (uint64_t *)&v34[OBJC_IVAR___QOSAlertMessageInternal_title];
  v36 = (uint64_t)v119;
  *v35 = v120;
  v35[1] = v36;
  v37 = &v34[OBJC_IVAR___QOSAlertMessageInternal_body];
  *(_QWORD *)v37 = v117;
  *((_QWORD *)v37 + 1) = v32;
  v146.receiver = v34;
  v108 = v33;
  v146.super_class = v33;
  v21 = objc_msgSendSuper2(&v146, sel_init);
  sub_244E8DEF4(v3 + 104, (uint64_t)&v174);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257425F00);
  type metadata accessor for MusicIssuesService();
  if (!swift_dynamicCast()
    || (v112 = *(_QWORD *)(v147 + 112), swift_bridgeObjectRetain(), swift_release(), !v112))
  {
LABEL_52:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD, unint64_t, unint64_t))(v3 + 56))(0, 0xD000000000000012, 0x8000000244EA4AE0);
    v83 = *(void (**)(uint64_t))(v3 + 72);
    sub_244E8C4A0((uint64_t)&v147);
    sub_244E8DFFC((uint64_t)&v147, (uint64_t)&v174, &qword_257425EF0);
LABEL_53:
    v84 = sub_244E8D5AC(a1, (uint64_t)&v174, (uint64_t)objc_msgSend(a2, sel_code), 1);
    goto LABEL_54;
  }
  v38 = *(_QWORD *)(v112 + 16);
  if (!v38)
  {
    swift_bridgeObjectRelease();
    goto LABEL_52;
  }
  v117 = v112 + 32;
  v113 = v38;
  v39 = v112;
  swift_bridgeObjectRetain_n();
  v40 = *(_OWORD *)(v39 + 208);
  v157 = *(_OWORD *)(v39 + 192);
  v158 = v40;
  v159 = *(_OWORD *)(v39 + 224);
  v160 = *(_QWORD *)(v39 + 240);
  v41 = *(_OWORD *)(v39 + 144);
  v153 = *(_OWORD *)(v39 + 128);
  v154 = v41;
  v42 = *(_OWORD *)(v39 + 176);
  v155 = *(_OWORD *)(v39 + 160);
  v156 = v42;
  v43 = *(_OWORD *)(v39 + 80);
  v149 = *(_OWORD *)(v39 + 64);
  v150 = v43;
  v44 = *(_OWORD *)(v39 + 112);
  v151 = *(_OWORD *)(v39 + 96);
  v152 = v44;
  v45 = *(_OWORD *)(v39 + 32);
  v46 = *(_OWORD *)(v39 + 48);
  v47 = v113;
  v147 = v45;
  v148 = v46;
  v119 = &v149;
  v120 = 1;
  v110 = 0x8000000244EA4B20;
  v111 = 0xD000000000000011;
  v104 = xmmword_244EA2F60;
  while (1)
  {
    sub_244E8DFFC((uint64_t)v119, (uint64_t)v145, &qword_257425E98);
    if (sub_244E88824((uint64_t)v145) != 1 && v145[0] != 2)
      break;
LABEL_30:
    if (v120 == v47)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      sub_244E8C4A0((uint64_t)&v147);
      sub_244E8DFFC((uint64_t)&v147, (uint64_t)&v174, &qword_257425EF0);
      (*(void (**)(_QWORD, unint64_t, unint64_t))(v3 + 56))(0, 0xD000000000000017, 0x8000000244EA4B00);
      v83 = *(void (**)(uint64_t))(v3 + 72);
      goto LABEL_53;
    }
    v50 = (__int128 *)(v117 + 216 * v120);
    v51 = v50[1];
    v147 = *v50;
    v148 = v51;
    v52 = v50[2];
    v53 = v50[3];
    v54 = v50[5];
    v151 = v50[4];
    v152 = v54;
    v149 = v52;
    v150 = v53;
    v55 = v50[6];
    v56 = v50[7];
    v57 = v50[9];
    v155 = v50[8];
    v156 = v57;
    v153 = v55;
    v154 = v56;
    v58 = v50[10];
    v59 = v50[11];
    v60 = v50[12];
    v160 = *((_QWORD *)v50 + 26);
    v158 = v59;
    v159 = v60;
    v157 = v58;
    ++v120;
  }
  if ((v145[0] & 1) != 0)
  {
    sub_244E8A1D0((uint64_t *)&v147);
    swift_bridgeObjectRelease();
  }
  else
  {
    v48 = sub_244EA14AC();
    sub_244E8A1D0((uint64_t *)&v147);
    swift_bridgeObjectRelease();
    if ((v48 & 1) == 0)
      goto LABEL_29;
  }
  sub_244E8DFFC((uint64_t)v119, (uint64_t)&v136, &qword_257425E98);
  if (v138 == 1)
    goto LABEL_28;
  v168 = v139;
  v169 = v140;
  v170 = v141;
  v171 = v142;
  v172 = v143;
  v167 = v138;
  v173 = v144;
  sub_244E8D21C(a1, v161);
  v49 = sub_244E9397C(v161);
  sub_244E8DF38((uint64_t)v161);
  if ((v49 & 1) == 0)
  {
LABEL_28:
    (*(void (**)(_QWORD, unint64_t, unint64_t))(v3 + 56))(0, v111, v110);
    goto LABEL_29;
  }
  if (v137 == 1)
  {
LABEL_27:
    (*(void (**)(_QWORD, uint64_t, unint64_t))(v3 + 56))(0, 0x206373696D206F4ELL, 0xEE002E686374616DLL);
LABEL_29:
    sub_244E8A264((uint64_t *)&v147);
    v47 = v113;
    goto LABEL_30;
  }
  v107 = (_QWORD *)v137;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257425F08);
  v105 = swift_allocObject();
  *(_OWORD *)(v105 + 16) = v104;
  v174 = objc_msgSend(a2, sel_code);
  v61 = sub_244EA14A0();
  v62 = v107;
  v63 = v105;
  v64 = v105;
  *(_QWORD *)(v105 + 32) = v61;
  v65 = v64 + 32;
  v66 = v63;
  *(_QWORD *)(v63 + 40) = v67;
  if (v62)
  {
    v68 = v62[2];
    if (v68)
    {
      v99[1] = v65;
      v100 = v68;
      v103 = v62[4];
      v101 = (unint64_t *)v62[5];
      v69 = v66;
      sub_244E88840((uint64_t)v62);
      v102 = *(_QWORD *)(v69 + 32);
      v106 = *(_QWORD *)(v69 + 40);
      swift_bridgeObjectRetain();
      sub_244E88840((uint64_t)v107);
      swift_bridgeObjectRetain();
      v70 = (unint64_t)v101;
      swift_bridgeObjectRetain();
      LODWORD(v103) = sub_244E811F8(v103, v70, v102, v106);
      swift_bridgeObjectRelease();
      if ((v103 & 1) == 0)
      {
        if (v100 == 1)
        {
LABEL_36:
          sub_244E88ADC((uint64_t)v107);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_244E88ADC((uint64_t)v107);
          swift_setDeallocating();
          swift_arrayDestroy();
          swift_deallocClassInstance();
          goto LABEL_27;
        }
        v103 = v100 - 1;
        v71 = v107[7];
        v101 = (unint64_t *)v107[6];
        swift_bridgeObjectRetain();
        LODWORD(v101) = sub_244E811F8((uint64_t)v101, v71, v102, v106);
        swift_bridgeObjectRelease();
        if ((v101 & 1) == 0)
        {
          v72 = v107 + 9;
          while (v103 != 1)
          {
            --v103;
            v73 = *v72;
            v100 = *(v72 - 1);
            v101 = v72 + 2;
            swift_bridgeObjectRetain();
            LODWORD(v100) = sub_244E811F8(v100, v73, v102, v106);
            swift_bridgeObjectRelease();
            v72 = v101;
            if ((v100 & 1) != 0)
              goto LABEL_41;
          }
          goto LABEL_36;
        }
      }
LABEL_41:
      sub_244E88ADC((uint64_t)v107);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_244E88ADC((uint64_t)v107);
    }
  }
  swift_bridgeObjectRelease();
  v107 = (_QWORD *)v148;
  if ((BYTE8(v147) & 1) == 0 && (BYTE8(v148) & 1) == 0)
  {
    v74 = *(double *)&v147;
    sub_244EA10B0();
    sub_244EA1098();
    v76 = v75 * 1000.0;
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
    if (v74 <= v76)
    {
      v78 = *(double *)&v107;
      sub_244EA1098();
      v80 = v79 * 1000.0;
      v81 = *(void (**)(char *, uint64_t))(v7 + 8);
      v81(v10, v6);
      v81(v12, v6);
      if (v80 < v78)
      {
        v82 = 0;
        goto LABEL_56;
      }
    }
    else
    {
      v77 = *(void (**)(char *, uint64_t))(v7 + 8);
      v77(v10, v6);
      v77(v12, v6);
    }
    goto LABEL_29;
  }
  v82 = BYTE8(v148);
  (*(void (**)(_QWORD, unint64_t, unint64_t))(v3 + 56))(0, 0xD00000000000001BLL, 0x8000000244EA4B40);
LABEL_56:
  swift_bridgeObjectRelease_n();
  v85 = v109;
  v86 = v115;
  sub_244E815A8(v160, v109, v115, v118, v162);
  sub_244E8DFFC((uint64_t)v162, (uint64_t)v163, &qword_257425F10);
  if (*((_QWORD *)&v163[0] + 1))
  {
    v165[0] = v163[0];
    v165[1] = v163[1];
    v165[2] = v163[2];
    v166 = v164;
    swift_bridgeObjectRelease();
    v87 = *(void (**)(uint64_t))(v3 + 72);
    v132 = v157;
    v133 = v158;
    v134 = v159;
    v135 = v160;
    v128 = v153;
    v129 = v154;
    v130 = v155;
    v131 = v156;
    v124 = v149;
    v125 = v150;
    v126 = v151;
    v127 = v152;
    v122 = v147;
    v123 = v148;
    nullsub_1(&v122);
    sub_244E8DFFC((uint64_t)&v122, (uint64_t)&v174, &qword_257425EF0);
    sub_244E8A1D0((uint64_t *)&v147);
    v88 = sub_244E8D5AC(a1, (uint64_t)&v174, (uint64_t)objc_msgSend(a2, sel_code), 0);
    sub_244E8A264((uint64_t *)&v147);
    v87(v88);
    swift_bridgeObjectRelease();
    v89 = sub_244E8C030((uint64_t)v165, v85, v86, (uint64_t)v107, v82);
    v91 = v90;
    swift_bridgeObjectRelease();
    sub_244E8A264((uint64_t *)&v147);
    v92 = v165[0];
    v93 = v108;
    v94 = (char *)objc_allocWithZone(v108);
    *(_OWORD *)&v94[OBJC_IVAR___QOSAlertMessageInternal_title] = v92;
    v95 = (unint64_t *)&v94[OBJC_IVAR___QOSAlertMessageInternal_body];
    *v95 = v89;
    v95[1] = v91;
    v121.receiver = v94;
    v121.super_class = v93;
    swift_bridgeObjectRetain();
    v96 = objc_msgSendSuper2(&v121, sel_init);
    sub_244E8E040(v162);

    return (uint64_t)v96;
  }
  v97 = *(void (**)(_QWORD, id, unint64_t))(v3 + 56);
  v174 = 0;
  v175 = 0xE000000000000000;
  sub_244EA1428();
  swift_bridgeObjectRelease();
  v174 = (id)0xD00000000000001FLL;
  v175 = 0x8000000244EA4B60;
  sub_244EA1278();
  swift_bridgeObjectRelease();
  sub_244EA1278();
  sub_244EA1278();
  swift_bridgeObjectRelease();
  v97(0, v174, v175);
  swift_bridgeObjectRelease();
  v83 = *(void (**)(uint64_t))(v3 + 72);
  v132 = v157;
  v133 = v158;
  v134 = v159;
  v135 = v160;
  v128 = v153;
  v129 = v154;
  v130 = v155;
  v131 = v156;
  v124 = v149;
  v125 = v150;
  v126 = v151;
  v127 = v152;
  v122 = v147;
  v123 = v148;
  nullsub_1(&v122);
  sub_244E8DFFC((uint64_t)&v122, (uint64_t)&v174, &qword_257425EF0);
  v98 = sub_244E8D5AC(a1, (uint64_t)&v174, (uint64_t)objc_msgSend(a2, sel_code), 1);
  sub_244E8A264((uint64_t *)&v147);
  v84 = v98;
LABEL_54:
  v83(v84);
  swift_bridgeObjectRelease();
  return (uint64_t)v21;
}

unint64_t sub_244E8C030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  _QWORD v33[2];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  v6 = v5;
  v33[1] = a2;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257425E90);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v9 - 8) + 64), v9);
  v11 = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257425D48);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v12 - 8) + 64), v12);
  v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_244EA10BC();
  v34 = *(_QWORD *)(v15 - 8);
  v35 = v15;
  MEMORY[0x24BDAC7A8](*(_QWORD **)(v34 + 64), v15);
  v17 = (char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *(_QWORD *)(a1 + 16);
  v19 = *(_QWORD *)(a1 + 24);
  if ((a5 & 1) != 0
    || (v40 = v18,
        v41 = v19,
        v38 = 0x4040656D69744040,
        v39 = 0xE800000000000000,
        sub_244E81524(),
        (sub_244EA1404() & 1) == 0))
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_244EA108C();
    v20 = *(id *)(v6 + 144);
    swift_bridgeObjectRetain();
    sub_244EA10D4();
    v21 = sub_244EA10F8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v14, 0, 1, v21);
    sub_244EA111C();
    v22 = sub_244EA1128();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v11, 0, 1, v22);
    v23 = sub_244E87DDC(1, (uint64_t)v11, (uint64_t)v14);

    sub_244E8E0B0((uint64_t)v11, &qword_257425E90);
    sub_244E8E0B0((uint64_t)v14, &qword_257425D48);
    v24 = (void *)sub_244EA1074();
    v25 = objc_msgSend(v23, sel_stringFromDate_, v24);

    v26 = sub_244EA11C4();
    v28 = v27;

    v40 = v26;
    v41 = v28;
    v38 = 32;
    v39 = 0xE100000000000000;
    v36 = 41154;
    v37 = 0xA200000000000000;
    v29 = sub_244EA13E0();
    v31 = v30;
    swift_bridgeObjectRelease();
    v18 = sub_244E81B70(v18, v19, v29, v31);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v17, v35);
  }
  return v18;
}

uint64_t sub_244E8C348()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MusicPlaybackErrorMessage()
{
  return objc_opt_self();
}

uint64_t sub_244E8C3B4(uint64_t a1, void *a2)
{
  return sub_244E8B340(a1, a2);
}

uint64_t sub_244E8C3D4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3[56] = a1;
  v3[57] = a2;
  v3[58] = *v2;
  return swift_task_switch();
}

uint64_t sub_244E8C3F4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(void);
  uint64_t v5;
  uint64_t v6;

  v1 = *(void **)(v0 + 456);
  v2 = *(_QWORD *)(v0 + 464);
  v3 = *(_QWORD *)(v0 + 448);
  v4 = *(void (**)(void))(v2 + 72);
  sub_244E8C4A0(v0 + 16);
  sub_244E8DFFC(v0 + 16, v0 + 232, &qword_257425EF0);
  sub_244E8D5AC(v3, v0 + 232, (uint64_t)objc_msgSend(v1, sel_code), 1);
  v4();
  v5 = swift_bridgeObjectRelease();
  v6 = (*(uint64_t (**)(uint64_t))(v2 + 88))(v5);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v6);
}

double sub_244E8C4A0(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 208) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

unint64_t sub_244E8C4C8(unsigned __int8 a1)
{
  uint64_t v2;

  sub_244EA1500();
  sub_244EA150C();
  sub_244EA150C();
  v2 = sub_244EA1518();
  return sub_244E8C590(a1, v2);
}

unint64_t sub_244E8C52C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_244EA1500();
  sub_244EA1230();
  v4 = sub_244EA1518();
  return sub_244E8C624(a1, a2, v4);
}

unint64_t sub_244E8C590(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v4 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v6 = ~v4;
    v7 = *(_QWORD *)(v2 + 48);
    do
    {
      v8 = *(unsigned __int8 *)(v7 + result);
      if (*(char *)(v7 + result) < 0)
      {
        if ((a1 & 0x80) != 0 && ((v8 ^ a1) & 0x7F) == 0)
          return result;
      }
      else if ((a1 & 0x80) == 0 && v8 == a1)
      {
        return result;
      }
      result = (result + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

unint64_t sub_244E8C624(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_244EA14AC() & 1) == 0)
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
      while (!v14 && (sub_244EA14AC() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_244E8C704(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257425EF8);
  v42 = a2;
  v6 = sub_244EA1464();
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
    sub_244EA1500();
    sub_244EA1230();
    result = sub_244EA1518();
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

uint64_t sub_244E8CA28(uint64_t a1, char a2)
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
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257425F18);
  v36 = a2;
  v6 = sub_244EA1464();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
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
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_244EA1500();
    sub_244EA1230();
    result = sub_244EA1518();
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
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
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

uint64_t sub_244E8CD3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_244E8C52C(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_244E8CEB0();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (_QWORD *)(v20[7] + 16 * v14);
      result = swift_bridgeObjectRelease();
      *v21 = a1;
      v21[1] = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_244E8C704(v17, a5 & 1);
  v23 = sub_244E8C52C(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_244EA14C4();
  __break(1u);
  return result;
}

void *sub_244E8CEB0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257425EF8);
  v2 = *v0;
  v3 = sub_244EA1458();
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

void *sub_244E8D068()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257425F18);
  v2 = *v0;
  v3 = sub_244EA1458();
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
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
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

uint64_t sub_244E8D21C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  unint64_t v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t result;
  char v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  if (!*(_QWORD *)(a1 + 16))
  {
    v18 = MEMORY[0x24BEE4AF8];
    v36 = MEMORY[0x24BEE4AF8];
    v37 = MEMORY[0x24BEE4AF8];
    v38 = MEMORY[0x24BEE4AF8];
    v6 = MEMORY[0x24BEE4AF8];
LABEL_24:
    v15 = v18;
LABEL_25:
    v19 = v18;
    goto LABEL_26;
  }
  v4 = sub_244E8C4C8(0x80u);
  if ((v5 & 1) != 0)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v4);
    swift_bridgeObjectRetain();
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_4;
    goto LABEL_17;
  }
  v6 = MEMORY[0x24BEE4AF8];
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_17:
    v18 = MEMORY[0x24BEE4AF8];
    v36 = MEMORY[0x24BEE4AF8];
    v37 = MEMORY[0x24BEE4AF8];
    v38 = MEMORY[0x24BEE4AF8];
    goto LABEL_24;
  }
LABEL_4:
  v7 = sub_244E8C4C8(0x81u);
  if ((v8 & 1) != 0)
  {
    v38 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v7);
    swift_bridgeObjectRetain();
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_6;
    goto LABEL_19;
  }
  v38 = MEMORY[0x24BEE4AF8];
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_19:
    v18 = MEMORY[0x24BEE4AF8];
    v36 = MEMORY[0x24BEE4AF8];
    v37 = MEMORY[0x24BEE4AF8];
    goto LABEL_24;
  }
LABEL_6:
  v9 = sub_244E8C4C8(0x82u);
  if ((v10 & 1) != 0)
  {
    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v9);
    swift_bridgeObjectRetain();
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_8;
    goto LABEL_21;
  }
  v37 = MEMORY[0x24BEE4AF8];
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_21:
    v18 = MEMORY[0x24BEE4AF8];
    v36 = MEMORY[0x24BEE4AF8];
    goto LABEL_24;
  }
LABEL_8:
  v11 = sub_244E8C4C8(0x84u);
  if ((v12 & 1) != 0)
  {
    v36 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_10;
    goto LABEL_23;
  }
  v36 = MEMORY[0x24BEE4AF8];
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_23:
    v18 = MEMORY[0x24BEE4AF8];
    goto LABEL_24;
  }
LABEL_10:
  v13 = sub_244E8C4C8(0x85u);
  if ((v14 & 1) != 0)
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v13);
    swift_bridgeObjectRetain();
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_12;
    goto LABEL_51;
  }
  v15 = MEMORY[0x24BEE4AF8];
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_51:
    v18 = MEMORY[0x24BEE4AF8];
    goto LABEL_25;
  }
LABEL_12:
  v16 = sub_244E8C4C8(0x86u);
  if ((v17 & 1) != 0)
  {
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v16);
    swift_bridgeObjectRetain();
    if (!*(_QWORD *)(a1 + 16))
      goto LABEL_55;
  }
  else
  {
    v18 = MEMORY[0x24BEE4AF8];
    if (!*(_QWORD *)(a1 + 16))
      goto LABEL_55;
  }
  v34 = sub_244E8C4C8(0x87u);
  if ((v35 & 1) != 0)
  {
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v34);
    swift_bridgeObjectRetain();
    goto LABEL_26;
  }
LABEL_55:
  v19 = MEMORY[0x24BEE4AF8];
LABEL_26:
  if (!*(_QWORD *)(a1 + 16))
  {
    v31 = MEMORY[0x24BEE4AF8];
    v25 = MEMORY[0x24BEE4AF8];
    v22 = MEMORY[0x24BEE4AF8];
LABEL_41:
    v28 = v31;
    goto LABEL_42;
  }
  v20 = sub_244E8C4C8(0x83u);
  if ((v21 & 1) != 0)
  {
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v20);
    swift_bridgeObjectRetain();
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_29;
    goto LABEL_38;
  }
  v22 = MEMORY[0x24BEE4AF8];
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_38:
    v31 = MEMORY[0x24BEE4AF8];
    v25 = MEMORY[0x24BEE4AF8];
    goto LABEL_41;
  }
LABEL_29:
  v23 = sub_244E8C4C8(0x88u);
  if ((v24 & 1) == 0)
  {
    v25 = MEMORY[0x24BEE4AF8];
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_31;
    goto LABEL_40;
  }
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v23);
  swift_bridgeObjectRetain();
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_40:
    v31 = MEMORY[0x24BEE4AF8];
    goto LABEL_41;
  }
LABEL_31:
  v26 = sub_244E8C4C8(0x89u);
  if ((v27 & 1) != 0)
  {
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v26);
    swift_bridgeObjectRetain();
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_33;
  }
  else
  {
    v28 = MEMORY[0x24BEE4AF8];
    if (*(_QWORD *)(a1 + 16))
    {
LABEL_33:
      v29 = sub_244E8C4C8(0x8Au);
      if ((v30 & 1) != 0)
      {
        v31 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v29);
        swift_bridgeObjectRetain();
        if (!*(_QWORD *)(a1 + 16))
          goto LABEL_49;
      }
      else
      {
        v31 = MEMORY[0x24BEE4AF8];
        if (!*(_QWORD *)(a1 + 16))
          goto LABEL_49;
      }
      sub_244E8C4C8(0x8Bu);
      if ((v33 & 1) != 0)
      {
        result = swift_bridgeObjectRetain();
        goto LABEL_43;
      }
LABEL_49:
      result = MEMORY[0x24BEE4AF8];
      goto LABEL_43;
    }
  }
  v31 = MEMORY[0x24BEE4AF8];
LABEL_42:
  result = v31;
LABEL_43:
  *a2 = v6;
  a2[1] = v37;
  a2[2] = v36;
  a2[3] = v15;
  a2[4] = v18;
  a2[5] = v19;
  a2[6] = v38;
  a2[7] = v22;
  a2[8] = v25;
  a2[9] = v28;
  a2[10] = v31;
  a2[11] = result;
  return result;
}

uint64_t sub_244E8D5AC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  char v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  unint64_t v33;
  char v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  char v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  unint64_t v45;
  char v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  unint64_t v51;
  char v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  unint64_t v57;
  char v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  unint64_t v63;
  char v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  unint64_t v69;
  char v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  unint64_t v75;
  char v76;
  _QWORD *v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  _QWORD v94[3];
  uint64_t v95;
  _QWORD *v96;
  _QWORD *v97;
  _QWORD *v98;
  _BYTE v99[97];
  char v100;
  _QWORD *v101;
  _OWORD v102[13];
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  _OWORD v106[11];
  uint64_t v107;

  if ((a4 & 1) != 0)
    v6 = 0x746C7561666564;
  else
    v6 = 0x6465636E61686E65;
  if ((a4 & 1) != 0)
    v7 = 0xE700000000000000;
  else
    v7 = 0xE800000000000000;
  v8 = MEMORY[0x24BEE4B00];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_244E8CD3C(v6, v7, 0x546567617373656DLL, 0xEB00000000657079, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  v10 = sub_244EA14A0();
  v12 = v11;
  v13 = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v104 = v8;
  sub_244E8CD3C(v10, v12, 0x646F43726F727265, 0xE900000000000065, v13);
  v14 = v8;
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 16))
  {
    v15 = sub_244E8C4C8(0x80u);
    if ((v16 & 1) != 0)
    {
      v17 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * v15);
      if (v17[2])
      {
        v18 = v17[4];
        v19 = v17[5];
        swift_bridgeObjectRetain();
        v20 = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)&v104 = v8;
        sub_244E8CD3C(v18, v19, 0x657079546D657469, 0xE800000000000000, v20);
        swift_bridgeObjectRelease();
      }
    }
    if (*(_QWORD *)(a1 + 16))
    {
      v21 = sub_244E8C4C8(0x8Cu);
      if ((v22 & 1) != 0)
      {
        v23 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * v21);
        if (v23[2])
        {
          v24 = v23[4];
          v25 = v23[5];
          swift_bridgeObjectRetain();
          v26 = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)&v104 = v8;
          sub_244E8CD3C(v24, v25, 0x656C61636F6CLL, 0xE600000000000000, v26);
          swift_bridgeObjectRelease();
        }
      }
      if (*(_QWORD *)(a1 + 16))
      {
        v27 = sub_244E8C4C8(0x81u);
        if ((v28 & 1) != 0)
        {
          v29 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * v27);
          if (v29[2])
          {
            v30 = v29[4];
            v31 = v29[5];
            swift_bridgeObjectRetain();
            v32 = swift_isUniquelyReferenced_nonNull_native();
            *(_QWORD *)&v104 = v8;
            sub_244E8CD3C(v30, v31, 0x64497465737361, 0xE700000000000000, v32);
            swift_bridgeObjectRelease();
          }
        }
        if (*(_QWORD *)(a1 + 16))
        {
          v33 = sub_244E8C4C8(0x89u);
          if ((v34 & 1) != 0)
          {
            v35 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * v33);
            if (v35[2])
            {
              v36 = v35[4];
              v37 = v35[5];
              swift_bridgeObjectRetain();
              v38 = swift_isUniquelyReferenced_nonNull_native();
              *(_QWORD *)&v104 = v8;
              sub_244E8CD3C(v36, v37, 0x546E6F6974617473, 0xEB00000000657079, v38);
              swift_bridgeObjectRelease();
            }
          }
          if (*(_QWORD *)(a1 + 16))
          {
            v39 = sub_244E8C4C8(0x87u);
            if ((v40 & 1) != 0)
            {
              v41 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * v39);
              if (v41[2])
              {
                v42 = v41[4];
                v43 = v41[5];
                swift_bridgeObjectRetain();
                v44 = swift_isUniquelyReferenced_nonNull_native();
                *(_QWORD *)&v104 = v8;
                sub_244E8CD3C(v42, v43, 0x6E65526F69647561, 0xEE006E6F69746964, v44);
                swift_bridgeObjectRelease();
              }
            }
            if (*(_QWORD *)(a1 + 16))
            {
              v45 = sub_244E8C4C8(0x8Au);
              if ((v46 & 1) != 0)
              {
                v47 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * v45);
                if (v47[2])
                {
                  v48 = v47[4];
                  v49 = v47[5];
                  swift_bridgeObjectRetain();
                  v50 = swift_isUniquelyReferenced_nonNull_native();
                  *(_QWORD *)&v104 = v8;
                  sub_244E8CD3C(v48, v49, 0xD000000000000013, 0x8000000244EA4A40, v50);
                  swift_bridgeObjectRelease();
                }
              }
              if (*(_QWORD *)(a1 + 16))
              {
                v51 = sub_244E8C4C8(0x8Bu);
                if ((v52 & 1) != 0)
                {
                  v53 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * v51);
                  if (v53[2])
                  {
                    v54 = v53[4];
                    v55 = v53[5];
                    swift_bridgeObjectRetain();
                    v56 = swift_isUniquelyReferenced_nonNull_native();
                    *(_QWORD *)&v104 = v8;
                    sub_244E8CD3C(v54, v55, 0xD000000000000015, 0x8000000244EA4A20, v56);
                    swift_bridgeObjectRelease();
                  }
                }
                if (*(_QWORD *)(a1 + 16))
                {
                  v57 = sub_244E8C4C8(0x85u);
                  if ((v58 & 1) != 0)
                  {
                    v59 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * v57);
                    if (v59[2])
                    {
                      v60 = v59[4];
                      v61 = v59[5];
                      swift_bridgeObjectRetain();
                      v62 = swift_isUniquelyReferenced_nonNull_native();
                      *(_QWORD *)&v104 = v8;
                      sub_244E8CD3C(v60, v61, 0x6574614379616C70, 0xEC00000079726F67, v62);
                      swift_bridgeObjectRelease();
                    }
                  }
                  if (*(_QWORD *)(a1 + 16))
                  {
                    v63 = sub_244E8C4C8(0x82u);
                    if ((v64 & 1) != 0)
                    {
                      v65 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * v63);
                      if (v65[2])
                      {
                        v66 = v65[4];
                        v67 = v65[5];
                        swift_bridgeObjectRetain();
                        v68 = swift_isUniquelyReferenced_nonNull_native();
                        *(_QWORD *)&v104 = v8;
                        sub_244E8CD3C(v66, v67, 0x5465636976726573, 0xEB00000000657079, v68);
                        swift_bridgeObjectRelease();
                      }
                    }
                    if (*(_QWORD *)(a1 + 16))
                    {
                      v69 = sub_244E8C4C8(0x83u);
                      if ((v70 & 1) != 0)
                      {
                        v71 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * v69);
                        if (v71[2])
                        {
                          v72 = v71[4];
                          v73 = v71[5];
                          swift_bridgeObjectRetain();
                          v74 = swift_isUniquelyReferenced_nonNull_native();
                          *(_QWORD *)&v104 = v8;
                          sub_244E8CD3C(v72, v73, 0x707954616964656DLL, 0xE900000000000065, v74);
                          swift_bridgeObjectRelease();
                        }
                      }
                      if (*(_QWORD *)(a1 + 16))
                      {
                        v75 = sub_244E8C4C8(0x84u);
                        if ((v76 & 1) != 0)
                        {
                          v77 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * v75);
                          if (v77[2])
                          {
                            v78 = v77[4];
                            v79 = v77[5];
                            swift_bridgeObjectRetain();
                            v80 = swift_isUniquelyReferenced_nonNull_native();
                            *(_QWORD *)&v104 = v8;
                            sub_244E8CD3C(v78, v79, 0x6570795479616C70, 0xE800000000000000, v80);
                            swift_bridgeObjectRelease();
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  sub_244E8DFFC(a2, (uint64_t)v102, &qword_257425EF0);
  if (sub_244E8DEDC((uint64_t)v102) != 1)
  {
    v106[8] = v102[10];
    v106[9] = v102[11];
    v106[10] = v102[12];
    v107 = v103;
    v106[4] = v102[6];
    v106[5] = v102[7];
    v106[6] = v102[8];
    v106[7] = v102[9];
    v106[0] = v102[2];
    v106[1] = v102[3];
    v106[2] = v102[4];
    v106[3] = v102[5];
    v104 = v102[0];
    v105 = v102[1];
    sub_244E8DFFC((uint64_t)v106, (uint64_t)v99, &qword_257425E98);
    sub_244E8DFFC((uint64_t)v99, (uint64_t)&v100, &qword_257425E98);
    if (sub_244E88824((uint64_t)&v100) != 1)
    {
      if ((unint64_t)v101 >= 2 && v101[2])
      {
        v81 = v101[4];
        v82 = v101[5];
        swift_bridgeObjectRetain();
        v83 = swift_isUniquelyReferenced_nonNull_native();
        v94[0] = v8;
        sub_244E8CD3C(v81, v82, 0x6146656369766564, 0xEC000000796C696DLL, v83);
        swift_bridgeObjectRelease();
      }
      sub_244E8DFFC((uint64_t)v99, (uint64_t)v94, &qword_257425E98);
      if (v95 != 1 && v96 && v96[2])
      {
        v84 = v96[4];
        v85 = v96[5];
        swift_bridgeObjectRetain();
        v86 = swift_isUniquelyReferenced_nonNull_native();
        v94[0] = v8;
        sub_244E8CD3C(v84, v85, 0x6F4D656369766564, 0xEB000000006C6564, v86);
        v14 = v94[0];
        swift_bridgeObjectRelease();
      }
      sub_244E8DFFC((uint64_t)v99, (uint64_t)v94, &qword_257425E98);
      if (v95 != 1 && v98 && v98[2])
      {
        v87 = v98[4];
        v88 = v98[5];
        swift_bridgeObjectRetain();
        v89 = swift_isUniquelyReferenced_nonNull_native();
        v94[0] = v14;
        sub_244E8CD3C(v87, v88, 29551, 0xE200000000000000, v89);
        v14 = v94[0];
        swift_bridgeObjectRelease();
      }
      sub_244E8DFFC((uint64_t)v99, (uint64_t)v94, &qword_257425E98);
      if (v95 != 1 && v97 && v97[2])
      {
        v90 = v97[4];
        v91 = v97[5];
        swift_bridgeObjectRetain();
        v92 = swift_isUniquelyReferenced_nonNull_native();
        v94[0] = v14;
        sub_244E8CD3C(v90, v91, 0x6F6973726556736FLL, 0xE90000000000006ELL, v92);
        v14 = v94[0];
        swift_bridgeObjectRelease();
      }
    }
  }
  return v14;
}

uint64_t sub_244E8DEDC(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 208);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t sub_244E8DEF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_244E8DF38(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
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

uint64_t sub_244E8DFFC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t *sub_244E8E040(uint64_t *a1)
{
  sub_244E8E074(*a1, a1[1]);
  return a1;
}

uint64_t sub_244E8E074(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_244E8E0B0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t destroy for TVCriteria(_QWORD *a1)
{
  uint64_t result;

  if (a1[1] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[3] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[11] != 1)
    swift_bridgeObjectRelease();
  result = a1[13];
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for TVCriteria(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = (_OWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (v5 == 1)
  {
    *v4 = *(_OWORD *)(a2 + 8);
  }
  else
  {
    v6 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 8) = v5;
    *(_QWORD *)(a1 + 16) = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  v7 = *(_QWORD *)(a2 + 24);
  if (v7 == 1)
  {
    v8 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v8;
    v9 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v9;
  }
  else
  {
    v10 = *(_QWORD *)(a2 + 32);
    v11 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 24) = v7;
    *(_QWORD *)(a1 + 32) = v10;
    v12 = *(_QWORD *)(a2 + 48);
    v13 = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 40) = v11;
    *(_QWORD *)(a1 + 48) = v12;
    v14 = *(_QWORD *)(a2 + 64);
    v15 = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 56) = v13;
    *(_QWORD *)(a1 + 64) = v14;
    v16 = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 72) = v15;
    *(_QWORD *)(a1 + 80) = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  v17 = *(_QWORD *)(a2 + 88);
  if (v17 != 1)
    v17 = swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 88) = v17;
  v18 = *(_QWORD *)(a2 + 104);
  if (v18 == 1)
  {
    v19 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 112) = v19;
    *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  }
  else
  {
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 104) = v18;
    v20 = *(_QWORD *)(a2 + 120);
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    *(_QWORD *)(a1 + 120) = v20;
    *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for TVCriteria(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  __int128 *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 *v20;
  __int128 *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = (_OWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  v7 = (_OWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 8);
  if (v5 == 1)
  {
    if (v6 != 1)
    {
      *(_QWORD *)(a1 + 8) = v6;
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v6 == 1)
  {
    sub_244E7F9CC((uint64_t)v4);
LABEL_6:
    *v4 = *v7;
    goto LABEL_8;
  }
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_8:
  v8 = (_OWORD *)(a1 + 24);
  v10 = (__int128 *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 24);
  if (*(_QWORD *)(a1 + 24) == 1)
  {
    if (v9 == 1)
    {
      v11 = *v10;
      v12 = *(_OWORD *)(a2 + 40);
      v13 = *(_OWORD *)(a2 + 72);
      *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a1 + 72) = v13;
      *v8 = v11;
      *(_OWORD *)(a1 + 40) = v12;
    }
    else
    {
      *(_QWORD *)(a1 + 24) = v9;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v9 == 1)
  {
    sub_244E7FA00(a1 + 24);
    v14 = *(_OWORD *)(a2 + 72);
    v16 = *v10;
    v15 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v14;
    *v8 = v16;
    *(_OWORD *)(a1 + 40) = v15;
  }
  else
  {
    *(_QWORD *)(a1 + 24) = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  v17 = (uint64_t *)(a1 + 88);
  v18 = *(_QWORD *)(a2 + 88);
  if (*(_QWORD *)(a1 + 88) == 1)
  {
    if (v18 == 1)
    {
      v19 = 1;
LABEL_20:
      *v17 = v19;
      goto LABEL_23;
    }
    *v17 = v18;
    swift_bridgeObjectRetain();
  }
  else
  {
    if (v18 == 1)
    {
      sub_244E7FA34(a1 + 88);
      v19 = *(_QWORD *)(a2 + 88);
      goto LABEL_20;
    }
    *v17 = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
LABEL_23:
  v20 = (__int128 *)(a1 + 96);
  v21 = (__int128 *)(a2 + 96);
  v22 = *(_QWORD *)(a2 + 104);
  if (*(_QWORD *)(a1 + 104) == 1)
  {
    if (v22 == 1)
    {
      v23 = *v21;
      v24 = *(_OWORD *)(a2 + 112);
      *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
      *v20 = v23;
      *(_OWORD *)(a1 + 112) = v24;
    }
    else
    {
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
      *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
      *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
      *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
      *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v22 == 1)
  {
    sub_244E7FA68(a1 + 96);
    v25 = *(_QWORD *)(a2 + 128);
    v26 = *(_OWORD *)(a2 + 112);
    *v20 = *v21;
    *(_OWORD *)(a1 + 112) = v26;
    *(_QWORD *)(a1 + 128) = v25;
  }
  else
  {
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for TVCriteria(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = (_OWORD *)(a1 + 8);
  v6 = (_OWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (*(_QWORD *)(a1 + 8) == 1)
    goto LABEL_4;
  if (v5 == 1)
  {
    sub_244E7F9CC((uint64_t)v4);
LABEL_4:
    *v4 = *v6;
    goto LABEL_6;
  }
  *(_QWORD *)(a1 + 8) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
LABEL_6:
  v7 = *(_QWORD *)(a2 + 24);
  if (*(_QWORD *)(a1 + 24) == 1)
  {
LABEL_9:
    v8 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v8;
    v9 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v9;
    goto LABEL_11;
  }
  if (v7 == 1)
  {
    sub_244E7FA00(a1 + 24);
    goto LABEL_9;
  }
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
LABEL_11:
  v10 = (uint64_t *)(a1 + 88);
  v11 = *(_QWORD *)(a2 + 88);
  if (*(_QWORD *)(a1 + 88) == 1)
  {
LABEL_14:
    *v10 = v11;
    goto LABEL_16;
  }
  if (v11 == 1)
  {
    sub_244E7FA34(a1 + 88);
    v11 = 1;
    goto LABEL_14;
  }
  *v10 = v11;
  swift_bridgeObjectRelease();
LABEL_16:
  if (*(_QWORD *)(a1 + 104) != 1)
  {
    v12 = *(_QWORD *)(a2 + 104);
    if (v12 != 1)
    {
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
      *(_QWORD *)(a1 + 104) = v12;
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_244E7FA68(a1 + 96);
  }
  v13 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v13;
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  return a1;
}

uint64_t getEnumTagSinglePayload for TVCriteria(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;
  BOOL v5;
  int v6;

  if (!a2)
    return 0;
  if (a2 > 0x7FFFFFFD && *(_BYTE *)(a1 + 136))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  v5 = __OFSUB__(v4, 1);
  v6 = v4 - 1;
  if (v6 < 0 != v5)
    v6 = -1;
  return (v6 + 1);
}

uint64_t storeEnumTagSinglePayload for TVCriteria(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_QWORD *)result = a2 - 2147483646;
    if (a3 > 0x7FFFFFFD)
      *(_BYTE *)(result + 136) = 1;
  }
  else
  {
    if (a3 > 0x7FFFFFFD)
      *(_BYTE *)(result + 136) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for TVCriteria()
{
  return &type metadata for TVCriteria;
}

__n128 sub_244E8E9D8@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[8];
  uint64_t v9;

  sub_244E8F34C(a1, (uint64_t)v8);
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

BOOL sub_244E8EA40(uint64_t a1, uint64_t a2)
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
  return sub_244E8EE6C(v11, v13);
}

void sub_244E8EAC0()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_244EA1500();
  __asm { BR              X9 }
}

uint64_t sub_244E8EB04()
{
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

void sub_244E8EB7C()
{
  __asm { BR              X10 }
}

uint64_t sub_244E8EBB0()
{
  sub_244EA1230();
  return swift_bridgeObjectRelease();
}

void sub_244E8EC14()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_244EA1500();
  __asm { BR              X9 }
}

uint64_t sub_244E8EC54()
{
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

uint64_t sub_244E8ECCC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244E8FB88();
  *a1 = result;
  return result;
}

uint64_t sub_244E8ECF8()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_244E8ED20 + 4 * byte_244EA2F7F[*v0]))();
}

void sub_244E8ED20(_QWORD *a1@<X8>)
{
  *a1 = 0x6E6F697461636F6CLL;
  a1[1] = 0xE800000000000000;
}

void sub_244E8ED3C(_QWORD *a1@<X8>)
{
  *a1 = 0x746E65746E6F63;
  a1[1] = 0xE700000000000000;
}

void sub_244E8ED58(_QWORD *a1@<X8>)
{
  *a1 = 0x656369766564;
  a1[1] = 0xE600000000000000;
}

void sub_244E8ED70(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 1668508013;
  a1[1] = v1;
}

uint64_t sub_244E8ED80()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244E8EDA8 + 4 * byte_244EA2F84[*v0]))(1701869940, 0xE400000000000000);
}

uint64_t sub_244E8EDA8()
{
  return 0x6E6F697461636F6CLL;
}

uint64_t sub_244E8EDC0()
{
  return 0x746E65746E6F63;
}

uint64_t sub_244E8EDD8()
{
  return 0x656369766564;
}

uint64_t sub_244E8EDEC()
{
  return 1668508013;
}

uint64_t sub_244E8EDF8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244E8FB88();
  *a1 = result;
  return result;
}

uint64_t sub_244E8EE1C()
{
  sub_244E8F6C0();
  return sub_244EA1530();
}

uint64_t sub_244E8EE44()
{
  sub_244E8F6C0();
  return sub_244EA153C();
}

BOOL sub_244E8EE6C(_QWORD *a1, _QWORD *a2)
{
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _BOOL8 result;
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
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  _QWORD *v34;
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
  char v46;
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
  _QWORD v63[5];
  _QWORD v64[5];
  _QWORD v65[9];

  v4 = *(unsigned __int8 *)a1;
  v5 = *(unsigned __int8 *)a2;
  if (v4 == 2)
  {
    if (v5 != 2)
      return 0;
  }
  else
  {
    if (v5 == 2)
      return 0;
    if ((v4 & 1) != 0)
      v6 = 0x636973756DLL;
    else
      v6 = 0x6F65646976;
    if ((v5 & 1) != 0)
      v7 = 0x636973756DLL;
    else
      v7 = 0x6F65646976;
    if (v6 == v7)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v8 = sub_244EA14AC();
      swift_bridgeObjectRelease_n();
      result = 0;
      if ((v8 & 1) == 0)
        return result;
    }
  }
  v10 = a1[1];
  v11 = a2[1];
  if (v10 != 1)
  {
    if (v11 == 1)
      return 0;
    v28 = (_QWORD *)a1[2];
    v29 = (_QWORD *)a2[2];
    if (v10)
    {
      v30 = (_QWORD *)a1[1];
      if (!v11)
      {
        sub_244E85B9C((uint64_t)v30);
        sub_244E85B9C(v10);
        sub_244E85B9C(0);
        goto LABEL_42;
      }
      if ((sub_244E9D2A4(v30, (_QWORD *)a2[1]) & 1) == 0)
      {
        sub_244E85B9C(v10);
        v31 = v10;
LABEL_28:
        sub_244E85B9C(v31);
LABEL_29:
        v32 = v11;
LABEL_30:
        sub_244E85B9C(v32);
        swift_bridgeObjectRelease();
LABEL_42:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_244E85BD0(v10);
        return 0;
      }
    }
    else if (v11)
    {
      sub_244E85B9C(0);
      v31 = 0;
      goto LABEL_28;
    }
    if (v28)
    {
      if (!v29)
      {
        sub_244E85B9C(v10);
        sub_244E85B9C(v10);
        v32 = v11;
        goto LABEL_30;
      }
      v33 = sub_244E9D2A4(v28, v29);
      sub_244E85B9C(v10);
      sub_244E85B9C(v10);
      sub_244E85B9C(v11);
      swift_bridgeObjectRelease();
      if ((v33 & 1) == 0)
        goto LABEL_42;
    }
    else
    {
      sub_244E85B9C(v10);
      sub_244E85B9C(v10);
      if (v29)
        goto LABEL_29;
      sub_244E85B9C(v11);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_244E85BD0(v10);
    goto LABEL_16;
  }
  if (v11 != 1)
    return 0;
LABEL_16:
  v12 = a1[3];
  v13 = a1[4];
  v14 = a1[5];
  v15 = a1[6];
  v16 = a1[7];
  v17 = a1[8];
  v18 = a1[9];
  v19 = a1[10];
  v20 = a2[3];
  v21 = a2[4];
  v23 = a2[5];
  v22 = a2[6];
  v25 = a2[7];
  v24 = a2[8];
  v27 = a2[9];
  v26 = a2[10];
  if (v12 != 1)
  {
    if (v20 != 1)
    {
      v65[0] = a1[3];
      v65[1] = v13;
      v65[2] = v14;
      v65[3] = v15;
      v65[4] = v16;
      v65[5] = v17;
      v65[6] = v18;
      v65[7] = v19;
      v47 = v20;
      v48 = v21;
      v49 = v23;
      v50 = v22;
      v51 = v25;
      v52 = v24;
      v53 = v27;
      v54 = v26;
      if ((sub_244E965E0((uint64_t)v65, (uint64_t)&v47) & 1) == 0)
        return 0;
      goto LABEL_36;
    }
LABEL_25:
    v47 = a1[3];
    v48 = v13;
    v49 = v14;
    v50 = v15;
    v51 = v16;
    v52 = v17;
    v53 = v18;
    v54 = v19;
    v55 = v20;
    v56 = v21;
    v57 = v23;
    v58 = v22;
    v59 = v25;
    v60 = v24;
    v61 = v27;
    v62 = v26;
    sub_244E8F78C(v12);
    sub_244E8F78C(v20);
    sub_244E8F820(&v47);
    return 0;
  }
  if (v20 != 1)
    goto LABEL_25;
LABEL_36:
  v34 = (_QWORD *)a1[11];
  v35 = a2[11];
  if (v34 == (_QWORD *)1)
  {
    if (v35 != 1)
      return 0;
  }
  else
  {
    if (v35 == 1)
      return 0;
    if (v34)
    {
      if (!v35 || (sub_244E9D2A4(v34, (_QWORD *)a2[11]) & 1) == 0)
        return 0;
    }
    else
    {
      sub_244E88ADC(0);
      if (v35)
        return 0;
    }
  }
  v37 = a1[12];
  v36 = a1[13];
  v39 = a1[14];
  v38 = a1[15];
  v40 = a1[16];
  v42 = a2[12];
  v41 = a2[13];
  v44 = a2[14];
  v43 = a2[15];
  v45 = a2[16];
  if (v36 == 1)
  {
    if (v41 == 1)
      return 1;
    goto LABEL_55;
  }
  if (v41 == 1)
  {
LABEL_55:
    sub_244E8F93C(v37, v36);
    sub_244E8F93C(v42, v41);
    sub_244E8F990(v37, v36);
    sub_244E8F990(v42, v41);
    return 0;
  }
  v63[0] = v37;
  v63[1] = v36;
  v63[2] = v39;
  v63[3] = v38;
  v63[4] = v40;
  v64[0] = v42;
  v64[1] = v41;
  v64[2] = v44;
  v64[3] = v43;
  v64[4] = v45;
  v46 = sub_244E93440(v63, v64);
  sub_244E8F93C(v37, v36);
  sub_244E8F93C(v37, v36);
  sub_244E8F93C(v42, v41);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_244E8F990(v37, v36);
  return (v46 & 1) != 0;
}

uint64_t sub_244E8F34C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  int v11;
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  char v44;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257425F20);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(v6 + 64), v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244E8F6C0();
  sub_244EA1524();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v35) = 0;
  sub_244EA1488();
  v10 = sub_244EA147C();
  swift_bridgeObjectRelease();
  if (v10 == 1)
    v11 = 1;
  else
    v11 = 2;
  if (!v10)
    v11 = 0;
  v43 = v11;
  v44 = 1;
  sub_244E86BCC();
  sub_244EA1494();
  v33 = v36;
  v34 = v35;
  v44 = 2;
  sub_244E8F704();
  sub_244EA1494();
  v31 = v36;
  v32 = v35;
  v29 = v38;
  v30 = v37;
  v28 = v39;
  v44 = 3;
  sub_244E8F748();
  sub_244EA1494();
  v26 = v36;
  v27 = v35;
  v24 = v38;
  v25 = v37;
  v12 = v41;
  v22 = v40;
  v23 = v39;
  v13 = v42;
  v44 = 4;
  sub_244E86C98();
  sub_244EA1494();
  v14 = v35;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *(_BYTE *)a2 = v43;
  v15 = v33;
  *(_QWORD *)(a2 + 8) = v34;
  *(_QWORD *)(a2 + 16) = v15;
  v16 = v26;
  *(_QWORD *)(a2 + 24) = v27;
  *(_QWORD *)(a2 + 32) = v16;
  v17 = v24;
  *(_QWORD *)(a2 + 40) = v25;
  *(_QWORD *)(a2 + 48) = v17;
  v18 = v22;
  *(_QWORD *)(a2 + 56) = v23;
  *(_QWORD *)(a2 + 64) = v18;
  *(_QWORD *)(a2 + 72) = v12;
  *(_QWORD *)(a2 + 80) = v13;
  v19 = v32;
  *(_QWORD *)(a2 + 88) = v14;
  *(_QWORD *)(a2 + 96) = v19;
  v20 = v30;
  *(_QWORD *)(a2 + 104) = v31;
  *(_QWORD *)(a2 + 112) = v20;
  v21 = v28;
  *(_QWORD *)(a2 + 120) = v29;
  *(_QWORD *)(a2 + 128) = v21;
  return result;
}

unint64_t sub_244E8F6C0()
{
  unint64_t result;

  result = qword_257425F28;
  if (!qword_257425F28)
  {
    result = MEMORY[0x249528E58](&unk_244EA30F8, &type metadata for TVCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425F28);
  }
  return result;
}

unint64_t sub_244E8F704()
{
  unint64_t result;

  result = qword_257425F30;
  if (!qword_257425F30)
  {
    result = MEMORY[0x249528E58](&unk_244EA337C, &type metadata for TVContentCriteria);
    atomic_store(result, (unint64_t *)&qword_257425F30);
  }
  return result;
}

unint64_t sub_244E8F748()
{
  unint64_t result;

  result = qword_257425F38;
  if (!qword_257425F38)
  {
    result = MEMORY[0x249528E58](&unk_244EA374C, &type metadata for TVDeviceCriteria);
    atomic_store(result, (unint64_t *)&qword_257425F38);
  }
  return result;
}

uint64_t sub_244E8F78C(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t *sub_244E8F820(uint64_t *a1)
{
  uint64_t v2;

  v2 = a1[8];
  sub_244E8F8AC(*a1);
  sub_244E8F8AC(v2);
  return a1;
}

uint64_t sub_244E8F8AC(uint64_t result)
{
  if (result != 1)
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
  return result;
}

uint64_t sub_244E8F93C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_244E8F990(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TVCriteria.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244E8FA30 + 4 * byte_244EA2F8E[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_244E8FA64 + 4 * byte_244EA2F89[v4]))();
}

uint64_t sub_244E8FA64(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E8FA6C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244E8FA74);
  return result;
}

uint64_t sub_244E8FA80(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244E8FA88);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_244E8FA8C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E8FA94(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TVCriteria.CodingKeys()
{
  return &type metadata for TVCriteria.CodingKeys;
}

unint64_t sub_244E8FAB4()
{
  unint64_t result;

  result = qword_257425F40;
  if (!qword_257425F40)
  {
    result = MEMORY[0x249528E58](&unk_244EA30D0, &type metadata for TVCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425F40);
  }
  return result;
}

unint64_t sub_244E8FAFC()
{
  unint64_t result;

  result = qword_257425F48;
  if (!qword_257425F48)
  {
    result = MEMORY[0x249528E58](&unk_244EA3008, &type metadata for TVCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425F48);
  }
  return result;
}

unint64_t sub_244E8FB44()
{
  unint64_t result;

  result = qword_257425F50;
  if (!qword_257425F50)
  {
    result = MEMORY[0x249528E58](&unk_244EA3030, &type metadata for TVCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257425F50);
  }
  return result;
}

uint64_t sub_244E8FB88()
{
  unint64_t v0;

  v0 = sub_244EA147C();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t sub_244E8FBD0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_244E8FBD8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_244E8FBE0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_244E8FBE8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_244E8FBF0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_244E8FC14(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_244E8FC38(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_244E8FC5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 64) + *(_QWORD *)(a2 + 64));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_244E7DA1C;
  return v7(a1, a2);
}

id QOSAlertMessage.__allocating_init(title:body:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  char *v9;
  char *v10;
  char *v11;
  objc_super v13;

  v9 = (char *)objc_allocWithZone(v4);
  v10 = &v9[OBJC_IVAR___QOSAlertMessageInternal_title];
  *(_QWORD *)v10 = a1;
  *((_QWORD *)v10 + 1) = a2;
  v11 = &v9[OBJC_IVAR___QOSAlertMessageInternal_body];
  *(_QWORD *)v11 = a3;
  *((_QWORD *)v11 + 1) = a4;
  v13.receiver = v9;
  v13.super_class = v4;
  return objc_msgSendSuper2(&v13, sel_init);
}

BOOL static QOSError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t QOSError.hash(into:)()
{
  return sub_244EA150C();
}

uint64_t QOSError.hashValue.getter()
{
  sub_244EA1500();
  sub_244EA150C();
  return sub_244EA1518();
}

BOOL sub_244E8FDC8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t QOSAlertMessage.title.getter()
{
  return sub_244E8FE78(&OBJC_IVAR___QOSAlertMessageInternal_title);
}

id sub_244E8FE14(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v3;

  if (*(_QWORD *)(a1 + *a3 + 8))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_244EA11B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

uint64_t QOSAlertMessage.body.getter()
{
  return sub_244E8FE78(&OBJC_IVAR___QOSAlertMessageInternal_body);
}

uint64_t sub_244E8FE78(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *a1);
  swift_bridgeObjectRetain();
  return v2;
}

id QOSAlertMessage.init(title:body:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  char *v5;
  char *v6;
  objc_super v8;

  v5 = &v4[OBJC_IVAR___QOSAlertMessageInternal_title];
  *(_QWORD *)v5 = a1;
  *((_QWORD *)v5 + 1) = a2;
  v6 = &v4[OBJC_IVAR___QOSAlertMessageInternal_body];
  *(_QWORD *)v6 = a3;
  *((_QWORD *)v6 + 1) = a4;
  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for QOSAlertMessage();
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t type metadata accessor for QOSAlertMessage()
{
  return objc_opt_self();
}

id QOSAlertMessage.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void QOSAlertMessage.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id QOSAlertMessage.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QOSAlertMessage();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_244E900A4()
{
  sub_244EA1440();
  sub_244EA1278();
  sub_244EA1278();
  sub_244EA10C8();
  return swift_bridgeObjectRelease();
}

uint64_t (*static QOSErrorMessage.logger.getter())()
{
  return sub_244E900A4;
}

uint64_t sub_244E90154()
{
  sub_244EA1194();
  sub_244EA10C8();
  return swift_bridgeObjectRelease();
}

uint64_t (*static QOSErrorMessage.metricsRecorder.getter())()
{
  return sub_244E90154;
}

uint64_t static QOSErrorMessage.getObjcInstance(config:logger:metricsRecorder:defaultAlert:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_244E910E4(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t static QOSErrorMessage.getSwiftInstance(config:logger:metricsRecorder:defaultAlert:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  _QWORD *v23;
  uint64_t result;
  _UNKNOWN **v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[3];
  uint64_t v38;
  _UNKNOWN **v39;

  v13 = *(_QWORD *)&a1[OBJC_IVAR___QOSConfigInternal_appTarget];
  v35 = a4;
  v36 = a6;
  v34 = a2;
  if (v13 == 1)
  {
    v14 = type metadata accessor for QOSConfig();
    v38 = v14;
    v39 = &off_2515E8ED8;
    v37[0] = a1;
    v15 = type metadata accessor for MusicPlaybackErrorMessage();
    v16 = (_QWORD *)swift_allocObject();
    v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v37, v14);
    MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v14 - 8) + 64), v17);
    v19 = (uint64_t *)((char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v20 + 16))(v19);
    v21 = *v19;
    v22 = a1;
    swift_retain();
    swift_retain();
    swift_retain();
    v23 = sub_244E9096C(v21, v34, a3, v35, a5, v36, a7, v16);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    v25 = &off_2515E95E8;
LABEL_5:
    a8[3] = v15;
    a8[4] = v25;
    *a8 = v23;
    return result;
  }
  if (!v13)
  {
    v26 = type metadata accessor for QOSConfig();
    v38 = v26;
    v39 = &off_2515E8ED8;
    v37[0] = a1;
    v15 = type metadata accessor for TVPlaybackErrorMessage();
    v27 = (_QWORD *)swift_allocObject();
    v28 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v37, v26);
    MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v26 - 8) + 64), v28);
    v30 = (uint64_t *)((char *)&v34 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v31 + 16))(v30);
    v32 = *v30;
    v33 = a1;
    swift_retain();
    swift_retain();
    swift_retain();
    v23 = sub_244E90EE8(v32, v34, a3, v35, a5, v36, a7, v27);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    v25 = &off_2515EA018;
    goto LABEL_5;
  }
  result = sub_244EA14B8();
  __break(1u);
  return result;
}

id QOSErrorMessage.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_244E905EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_244EA1338();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_244EA132C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_244E91640(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_244EA1320();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_244E90730(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_244E90794;
  return v6(a1);
}

uint64_t sub_244E90794()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_244E907E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  _UNKNOWN **v26;
  __int128 v27;
  uint64_t v28;
  _UNKNOWN **v29;
  _QWORD v30[3];
  uint64_t v31;
  _UNKNOWN **v32;
  _QWORD v33[6];

  v8 = type metadata accessor for QOSConfig();
  v33[3] = v8;
  v33[4] = &off_2515E8ED8;
  v33[0] = a1;
  v9 = type metadata accessor for Network();
  v31 = v9;
  v32 = &off_2515E8B10;
  v30[0] = a2;
  type metadata accessor for LocationService();
  v10 = swift_allocObject();
  v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v33, v8);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v8 - 8) + 64), v11);
  v13 = (uint64_t *)((char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  v15 = v31;
  v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v30, v31);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v15 - 8) + 64), v16);
  v18 = (uint64_t *)((char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v19 + 16))(v18);
  v20 = *v13;
  v21 = *v18;
  v28 = v8;
  v29 = &off_2515E8ED8;
  v26 = &off_2515E8B10;
  *(_QWORD *)&v27 = v20;
  v25 = v9;
  *(_QWORD *)&v24 = v21;
  *(_OWORD *)(v10 + 112) = 0u;
  *(_OWORD *)(v10 + 128) = 0u;
  sub_244E91A98(&v27, v10 + 16);
  sub_244E91A98(&v24, v10 + 56);
  *(_QWORD *)(v10 + 96) = a3;
  *(_QWORD *)(v10 + 104) = a4;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  return v10;
}

_QWORD *sub_244E9096C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _QWORD *a8)
{
  void *v16;
  id v17;
  id v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  __int128 v35;
  uint64_t v36;
  _UNKNOWN **v37;
  _QWORD v38[5];

  v38[3] = type metadata accessor for QOSConfig();
  v38[4] = &off_2515E8ED8;
  v38[0] = a1;
  a8[18] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  sub_244E8DEF4((uint64_t)v38, (uint64_t)(a8 + 2));
  a8[7] = a2;
  a8[8] = a3;
  a8[9] = a4;
  a8[10] = a5;
  a8[11] = a6;
  a8[12] = a7;
  v16 = (void *)objc_opt_self();
  swift_retain();
  swift_retain();
  swift_retain();
  v17 = objc_msgSend(v16, sel_defaultSessionConfiguration);
  v18 = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_, v17);

  type metadata accessor for Network();
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = v18;
  v19[3] = a2;
  v19[4] = a3;
  sub_244E8DEF4((uint64_t)v38, (uint64_t)&v35);
  v20 = v36;
  v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v35, v36);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v20 - 8) + 64), v21);
  v23 = (uint64_t *)((char *)&v35 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v24 + 16))(v23);
  v25 = *v23;
  swift_retain_n();
  swift_retain();
  v26 = sub_244E907E0(v25, (uint64_t)v19, a2, a3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v35);
  sub_244E8DEF4((uint64_t)v38, (uint64_t)&v35);
  v27 = v36;
  v28 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v35, v36);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v27 - 8) + 64), v28);
  v30 = (uint64_t *)((char *)&v35 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v31 + 16))(v30);
  v32 = *v30;
  swift_retain();
  swift_retain();
  swift_retain();
  v33 = sub_244E91894(v32, (uint64_t)v19, v26, a2, a3);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v35);
  v36 = type metadata accessor for MusicIssuesService();
  v37 = &off_2574262E0;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  *(_QWORD *)&v35 = v33;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  sub_244E91A98(&v35, (uint64_t)(a8 + 13));
  return a8;
}

_QWORD *sub_244E90C40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD v17[5];
  _QWORD v18[5];

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FFBD0);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v10 - 8) + 64), v10);
  v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[3] = type metadata accessor for QOSConfig();
  v18[4] = &off_2515E8ED8;
  v18[0] = a1;
  v17[3] = type metadata accessor for Network();
  v17[4] = &off_2515E8B10;
  v17[0] = a2;
  a5[14] = 0;
  a5[15] = 0;
  sub_244E8DEF4((uint64_t)v18, (uint64_t)(a5 + 2));
  sub_244E8DEF4((uint64_t)v17, (uint64_t)(a5 + 7));
  a5[12] = a3;
  a5[13] = a4;
  v13 = sub_244EA1338();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = a5;
  swift_retain();
  v15 = sub_244E905EC((uint64_t)v12, (uint64_t)&unk_257425FA8, (uint64_t)v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  a5[15] = v15;
  swift_release();
  return a5;
}

_QWORD *sub_244E90D90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD v21[3];
  uint64_t v22;
  _UNKNOWN **v23;
  _QWORD v24[5];

  v8 = type metadata accessor for QOSConfig();
  v24[3] = v8;
  v24[4] = &off_2515E8ED8;
  v24[0] = a1;
  v22 = type metadata accessor for Network();
  v23 = &off_2515E8B10;
  v21[0] = a2;
  type metadata accessor for TVIssuesService();
  v9 = (_QWORD *)swift_allocObject();
  v10 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v24, v8);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v8 - 8) + 64), v10);
  v12 = (_QWORD *)((char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v13 + 16))(v12);
  v14 = v22;
  v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v14 - 8) + 64), v15);
  v17 = (_QWORD *)((char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v18 + 16))(v17);
  v19 = sub_244E90C40(*v12, *v17, a3, a4, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  return v19;
}

_QWORD *sub_244E90EE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _QWORD *a8)
{
  void *v16;
  id v17;
  id v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  __int128 v28;
  uint64_t v29;
  _UNKNOWN **v30;
  _QWORD v31[5];

  v31[3] = type metadata accessor for QOSConfig();
  v31[4] = &off_2515E8ED8;
  v31[0] = a1;
  sub_244E8DEF4((uint64_t)v31, (uint64_t)(a8 + 2));
  a8[7] = a2;
  a8[8] = a3;
  a8[9] = a4;
  a8[10] = a5;
  a8[11] = a6;
  a8[12] = a7;
  v16 = (void *)objc_opt_self();
  swift_retain();
  swift_retain();
  swift_retain();
  v17 = objc_msgSend(v16, sel_defaultSessionConfiguration);
  v18 = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_, v17);

  type metadata accessor for Network();
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = v18;
  v19[3] = a2;
  v19[4] = a3;
  sub_244E8DEF4((uint64_t)v31, (uint64_t)&v28);
  v20 = v29;
  v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v28, v29);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v20 - 8) + 64), v21);
  v23 = (uint64_t *)((char *)&v28 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v24 + 16))(v23);
  v25 = *v23;
  swift_retain_n();
  swift_retain();
  v26 = sub_244E90D90(v25, (uint64_t)v19, a2, a3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v28);
  v29 = type metadata accessor for TVIssuesService();
  v30 = &off_257426530;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  *(_QWORD *)&v28 = v26;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  sub_244E91A98(&v28, (uint64_t)(a8 + 13));
  return a8;
}

uint64_t sub_244E910E4(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  _BYTE *v22;
  uint64_t result;
  uint64_t v24;
  _QWORD *v25;
  uint64_t *v26;
  _QWORD v27[5];
  uint64_t v28;

  v8 = *(_QWORD *)&a1[OBJC_IVAR___QOSConfigInternal_appTarget];
  if (!v8)
  {
    v28 = a6;
    v15 = type metadata accessor for QOSConfig();
    v27[3] = v15;
    v27[4] = &off_2515E8ED8;
    v27[0] = a1;
    type metadata accessor for TVPlaybackErrorMessage();
    v25 = (_QWORD *)swift_allocObject();
    v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v27, v15);
    v26 = &v24;
    MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v15 - 8) + 64), v16);
    v18 = (uint64_t *)((char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v19 + 16))(v18);
    v20 = *v18;
    v21 = a1;
    swift_retain();
    swift_retain();
    swift_retain();
    v7 = sub_244E90EE8(v20, a2, a3, a4, a5, v28, a7, v25);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
    return (uint64_t)v7;
  }
  if (v8 == 1)
  {
    sub_244E91AB0();
    swift_allocError();
    *v22 = 0;
    swift_willThrow();
    return (uint64_t)v7;
  }
  result = sub_244EA14B8();
  __break(1u);
  return result;
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

unint64_t sub_244E912C8()
{
  unint64_t result;

  result = qword_257425F70;
  if (!qword_257425F70)
  {
    result = MEMORY[0x249528E58](&protocol conformance descriptor for QOSError, &type metadata for QOSError);
    atomic_store(result, (unint64_t *)&qword_257425F70);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for QOSError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244E91358 + 4 * byte_244EA3165[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_244E9138C + 4 * asc_244EA3160[v4]))();
}

uint64_t sub_244E9138C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E91394(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244E9139CLL);
  return result;
}

uint64_t sub_244E913A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244E913B0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_244E913B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E913BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for QOSError()
{
  return &type metadata for QOSError;
}

uint64_t method lookup function for QOSAlertMessage()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of QOSAlertMessage.__allocating_init(title:body:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of SwiftQOSErrorMessageProtocol.getLocalizedErrorMessage(for:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of SwiftQOSErrorMessageProtocol.fetchLocalizedErrorMessage(for:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 16) + *(_QWORD *)(a4 + 16));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_244E91478;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_244E91478(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t type metadata accessor for QOSErrorMessage()
{
  return objc_opt_self();
}

uint64_t sub_244E914E8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_244E9150C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = (id)sub_244EA11B8();
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a1, v4);

}

void sub_244E9155C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = (id)sub_244EA117C();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

id sub_244E915B0()
{
  uint64_t v0;

  return (id)(*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_244E915D4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_244E7DA1C;
  return sub_244EA07BC(a1, v4, v5, v6);
}

uint64_t sub_244E91640(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FFBD0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_244E91680()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244E916A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_244E7DA1C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_257425FB0 + dword_257425FB0))(a1, v4);
}

_QWORD *sub_244E91714(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD v18[5];
  _QWORD v19[5];

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FFBD0);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v12 - 8) + 64), v12);
  v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[3] = type metadata accessor for QOSConfig();
  v19[4] = &off_2515E8ED8;
  v19[0] = a1;
  v18[3] = type metadata accessor for Network();
  v18[4] = &off_2515E8B10;
  v18[0] = a2;
  a6[14] = 0;
  a6[16] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  sub_244E8DEF4((uint64_t)v19, (uint64_t)(a6 + 2));
  sub_244E8DEF4((uint64_t)v18, (uint64_t)(a6 + 7));
  a6[12] = a4;
  a6[13] = a5;
  a6[15] = a3;
  v15 = sub_244EA1338();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = a6;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_244E905EC((uint64_t)v14, (uint64_t)&unk_257425FC0, (uint64_t)v16);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  return a6;
}

_QWORD *sub_244E91894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD v23[3];
  uint64_t v24;
  _UNKNOWN **v25;
  _QWORD v26[5];

  v10 = type metadata accessor for QOSConfig();
  v26[3] = v10;
  v26[4] = &off_2515E8ED8;
  v26[0] = a1;
  v24 = type metadata accessor for Network();
  v25 = &off_2515E8B10;
  v23[0] = a2;
  type metadata accessor for MusicIssuesService();
  v11 = (_QWORD *)swift_allocObject();
  v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v10);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v10 - 8) + 64), v12);
  v14 = (_QWORD *)((char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v15 + 16))(v14);
  v16 = v24;
  v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v23, v24);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v16 - 8) + 64), v17);
  v19 = (_QWORD *)((char *)v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v20 + 16))(v19);
  v21 = sub_244E91714(*v14, *v19, a3, a4, a5, v11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  return v21;
}

uint64_t objectdestroy_9Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244E91A2C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_244E91AF4;
  return sub_244E9AA18(a1, v4, v5, v6);
}

uint64_t sub_244E91A98(__int128 *a1, uint64_t a2)
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

unint64_t sub_244E91AB0()
{
  unint64_t result;

  result = qword_257425FC8;
  if (!qword_257425FC8)
  {
    result = MEMORY[0x249528E58](&protocol conformance descriptor for QOSError, &type metadata for QOSError);
    atomic_store(result, &qword_257425FC8);
  }
  return result;
}

uint64_t sub_244E91B00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[18] = a2;
  v3[19] = v2;
  v3[17] = a1;
  return swift_task_switch();
}

uint64_t sub_244E91B1C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = (void *)v0[19];
  v2 = sub_244EA11B8();
  v0[20] = v2;
  v3 = objc_msgSend(v1, sel_stringForKey_, v2);
  v0[21] = v3;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_244E91BE8;
  v4 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v5 = v0 + 10;
  v5[1] = 0x40000000;
  v5[2] = sub_244E91F10;
  v5[3] = &block_descriptor_1;
  v5[4] = v4;
  objc_msgSend(v3, sel_valueWithCompletion_, v5);
  return swift_continuation_await();
}

uint64_t sub_244E91BE8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 176) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_244E91C48()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 160);

  v2 = sub_244EA11F4();
  v4 = v3;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v4);
}

uint64_t sub_244E91CA0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(v0 + 168);
  v2 = *(void **)(v0 + 176);
  v3 = *(void **)(v0 + 160);
  swift_willThrow();

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
}

uint64_t sub_244E91D00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[18] = a2;
  v3[19] = v2;
  v3[17] = a1;
  return swift_task_switch();
}

uint64_t sub_244E91D1C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = (void *)v0[19];
  v2 = sub_244EA11B8();
  v0[20] = v2;
  v3 = objc_msgSend(v1, sel_integerForKey_, v2);
  v0[21] = v3;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_244E91DE8;
  v4 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v5 = v0 + 10;
  v5[1] = 0x40000000;
  v5[2] = sub_244E91F10;
  v5[3] = &block_descriptor;
  v5[4] = v4;
  objc_msgSend(v3, sel_valueWithCompletion_, v5);
  return swift_continuation_await();
}

uint64_t sub_244E91DE8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 176) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_244E91E48()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 160);
  v2 = *(void **)(v0 + 120);

  v3 = sub_244EA1350();
  return (*(uint64_t (**)(uint64_t, BOOL))(v0 + 8))(v3, *(_QWORD *)(v0 + 176) != 0);
}

uint64_t sub_244E91EA8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(v0 + 168);
  v2 = *(void **)(v0 + 176);
  v3 = *(void **)(v0 + 160);
  swift_willThrow();

  return (*(uint64_t (**)(_QWORD, BOOL))(v0 + 8))(0, *(_QWORD *)(v0 + 176) != 0);
}

uint64_t sub_244E91F14(uint64_t result, void *a2, char a3, void *a4)
{
  _QWORD *v5;
  id v6;
  uint64_t v7;
  id v8;

  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543FFF18);
    swift_allocError();
    *v5 = a4;
    v6 = a4;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 64) + 40);
    *(_QWORD *)v7 = a2;
    *(_BYTE *)(v7 + 8) = a3;
    v8 = a2;
    return swift_continuation_throwingResume();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_244E91FA4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_244E91FAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 48) + *(_QWORD *)(a5 + 48));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_244E7DA1C;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t sub_244E92040()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_244E92048()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244EA1398();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_244E920B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (*(_DWORD *)(v6 + 84))
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  if (*(_DWORD *)(v6 + 80) > 7u || (v7 & 0x100000) != 0 || v8 > 0x18)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v7 + 16) & ~(unint64_t)v7));
    swift_retain();
  }
  else if ((*(unsigned int (**)(uint64_t *, uint64_t, _QWORD))(v6 + 48))(a2, 1, *(_QWORD *)(a3 + 16)))
  {
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_244E9218C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return result;
}

void *sub_244E921E8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84))
      v7 = *(_QWORD *)(v6 + 64);
    else
      v7 = *(_QWORD *)(v6 + 64) + 1;
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_244E92280(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 1, v5);
  v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
  return a1;
}

void *sub_244E92360(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84))
      v7 = *(_QWORD *)(v6 + 64);
    else
      v7 = *(_QWORD *)(v6 + 64) + 1;
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_244E923F8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 1, v5);
  v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
  return a1;
}

uint64_t sub_244E924D8(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  char v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  unsigned int v14;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = v5 - 1;
  if (!v5)
    v6 = 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v7;
  if (!a2)
    return 0;
  v8 = a2 - v6;
  if (a2 > v6)
  {
    v9 = 8 * v7;
    if (v7 > 3)
      goto LABEL_8;
    v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      v10 = *(_DWORD *)(a1 + v7);
      if (v10)
        goto LABEL_15;
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2)
          goto LABEL_24;
LABEL_8:
        v10 = *(unsigned __int8 *)(a1 + v7);
        if (!*(_BYTE *)(a1 + v7))
          goto LABEL_24;
LABEL_15:
        v12 = (v10 - 1) << v9;
        if (v7 > 3)
          v12 = 0;
        if ((_DWORD)v7)
        {
          if (v7 <= 3)
            v13 = v7;
          else
            v13 = 4;
          __asm { BR              X12 }
        }
        return v6 + v12 + 1;
      }
      v10 = *(unsigned __int16 *)(a1 + v7);
      if (*(_WORD *)(a1 + v7))
        goto LABEL_15;
    }
  }
LABEL_24:
  if (v5 < 2)
    return 0;
  v14 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v14 >= 2)
    return v14 - 1;
  else
    return 0;
}

void sub_244E92618(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  size_t v10;
  BOOL v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v6 = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = v8 - 1;
  if (v8)
  {
    v10 = *(_QWORD *)(v7 + 64);
  }
  else
  {
    v9 = 0;
    v10 = *(_QWORD *)(v7 + 64) + 1;
  }
  v11 = a3 >= v9;
  v12 = a3 - v9;
  if (v12 != 0 && v11)
  {
    if (v10 > 3)
    {
      v6 = 1u;
      if (v9 < a2)
        goto LABEL_14;
      goto LABEL_21;
    }
    v13 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
    if (HIWORD(v13))
    {
      v6 = 4u;
      if (v9 < a2)
      {
LABEL_14:
        v14 = ~v9 + a2;
        if (v10 < 4)
        {
          if ((_DWORD)v10)
          {
            v15 = v14 & ~(-1 << (8 * v10));
            bzero(a1, v10);
            if ((_DWORD)v10 == 3)
            {
              *a1 = v15;
              *((_BYTE *)a1 + 2) = BYTE2(v15);
            }
            else if ((_DWORD)v10 == 2)
            {
              *a1 = v15;
            }
            else
            {
              *(_BYTE *)a1 = v15;
            }
          }
        }
        else
        {
          bzero(a1, v10);
          *(_DWORD *)a1 = v14;
        }
        __asm { BR              X10 }
      }
LABEL_21:
      __asm { BR              X11 }
    }
    if (v13 >= 0x100)
      v6 = 2;
    else
      v6 = v13 > 1;
  }
  if (v9 < a2)
    goto LABEL_14;
  goto LABEL_21;
}

void sub_244E927C0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_244E927C8()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

uint64_t type metadata accessor for Cache(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Cache);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x249528E1C](a1, v6, a5);
}

uint64_t sub_244E92824@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unsigned int (*v9)(char *, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v12;

  v2 = sub_244EA1014();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(v3 + 64), v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257426068);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v6 - 8) + 64), v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EA1008();
  v9 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
  if (!v9(v8, 1, v2))
  {
    swift_bridgeObjectRetain();
    sub_244EA0FF0();
  }
  if (v9(v8, 1, v2))
  {
    v10 = sub_244EA1050();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(a1, 1, 1, v10);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
    sub_244EA0FFC();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return sub_244E92984((uint64_t)v8);
}

uint64_t sub_244E92984(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257426068);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for QoSDevice()
{
  return objc_opt_self();
}

uint64_t sub_244E929E4(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_244E92AA4(_BYTE *__src, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  if (a2 <= 14)
    return sub_244E929E4(__src, &__src[a2]);
  sub_244EA102C();
  swift_allocObject();
  sub_244EA1020();
  if ((unint64_t)a2 < 0x7FFFFFFF)
    return a2 << 32;
  sub_244EA105C();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_244E92B50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  utsname v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v0 = sub_244EA0FCC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(v1 + 64), v0);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_244EA11E8();
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v4 - 8) + 64), v4);
  bzero(&v14, 0x500uLL);
  uname(&v14);
  v5 = sub_244E92AA4(v14.machine, 256);
  v7 = v6;
  v15 = v5;
  v16 = v6;
  sub_244EA11DC();
  sub_244E92CF0();
  v8 = sub_244EA11D0();
  v10 = v9;
  sub_244E92D34(v5, v7);
  if (!v10)
    __break(1u);
  v15 = v8;
  v16 = v10;
  sub_244EA0FA8();
  sub_244E81524();
  v11 = sub_244EA13D4();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_244E92CF0()
{
  unint64_t result;

  result = qword_257426108;
  if (!qword_257426108)
  {
    result = MEMORY[0x249528E58](MEMORY[0x24BDCDE28], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_257426108);
  }
  return result;
}

uint64_t sub_244E92D34(uint64_t a1, unint64_t a2)
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

uint64_t destroy for TVContentCriteria()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for TVContentCriteria(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for TVContentCriteria(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for TVContentCriteria(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TVContentCriteria(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TVContentCriteria(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for TVContentCriteria()
{
  return &type metadata for TVContentCriteria;
}

double sub_244E92FD8@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  uint64_t v7;

  sub_244E93508(a1, (uint64_t *)v6);
  if (!v2)
  {
    result = *(double *)v6;
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(_QWORD *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_244E9301C(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[2];
  uint64_t v6;
  _OWORD v7[2];
  uint64_t v8;

  v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  v6 = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  v8 = *(_QWORD *)(a2 + 32);
  return sub_244E93440(v5, v7) & 1;
}

void sub_244E93064(char *a1)
{
  sub_244E8A8C4(*a1);
}

void sub_244E93070()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_244EA1500();
  __asm { BR              X9 }
}

uint64_t sub_244E930C4()
{
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

void sub_244E93134()
{
  __asm { BR              X10 }
}

uint64_t sub_244E93178()
{
  sub_244EA1230();
  return swift_bridgeObjectRelease();
}

void sub_244E931D4()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_244EA1500();
  __asm { BR              X9 }
}

uint64_t sub_244E93224()
{
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

uint64_t sub_244E93294@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244E93934();
  *a1 = result;
  return result;
}

uint64_t sub_244E932C0()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_244E932F8 + 4 * byte_244EA331C[*v0]))();
}

void sub_244E932F8(_QWORD *a1@<X8>)
{
  *a1 = 0x6449646E617262;
  a1[1] = 0xE700000000000000;
}

void sub_244E93314(_QWORD *a1@<X8>)
{
  *a1 = 0x4965636976726573;
  a1[1] = 0xE900000000000064;
}

void sub_244E93334(_QWORD *a1@<X8>)
{
  *a1 = 0x64496D616461;
  a1[1] = 0xE600000000000000;
}

uint64_t sub_244E9334C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244E93384 + 4 * byte_244EA3320[*v0]))(0x54746E65746E6F63, 0xEB00000000657079);
}

uint64_t sub_244E93384()
{
  return 0x6449646E617262;
}

uint64_t sub_244E9339C()
{
  return 0x4965636976726573;
}

uint64_t sub_244E933B8()
{
  return 0x64496D616461;
}

uint64_t sub_244E933CC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244E93934();
  *a1 = result;
  return result;
}

uint64_t sub_244E933F0()
{
  sub_244E9374C();
  return sub_244EA1530();
}

uint64_t sub_244E93418()
{
  sub_244E9374C();
  return sub_244EA153C();
}

uint64_t sub_244E93440(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  char v7;
  uint64_t result;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;

  v4 = a1[1];
  v5 = a2[1];
  if (!v4)
  {
    if (v5)
      return 0;
    goto LABEL_10;
  }
  if (!v5)
    return 0;
  v6 = *a1 == *a2 && v4 == v5;
  if (v6 || (v7 = sub_244EA14AC(), result = 0, (v7 & 1) != 0))
  {
LABEL_10:
    v9 = (_QWORD *)a1[2];
    v10 = (_QWORD *)a2[2];
    if (v9)
    {
      if (!v10 || (sub_244E9D2A4(v9, v10) & 1) == 0)
        return 0;
    }
    else if (v10)
    {
      return 0;
    }
    v11 = (_QWORD *)a1[3];
    v12 = (_QWORD *)a2[3];
    if (v11)
    {
      if (!v12 || (sub_244E9D2A4(v11, v12) & 1) == 0)
        return 0;
    }
    else if (v12)
    {
      return 0;
    }
    v13 = (_QWORD *)a1[4];
    v14 = (_QWORD *)a2[4];
    if (v13)
    {
      if (v14 && (sub_244E9D2A4(v13, v14) & 1) != 0)
        return 1;
    }
    else if (!v14)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_244E93508@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
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
  uint64_t v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257426110);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(v6 + 64), v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244E9374C();
  sub_244EA1524();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v20) = 0;
  v10 = sub_244EA1488();
  v18 = v6;
  v16 = v11;
  v17 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257425DC0);
  v19 = 1;
  sub_244E840DC();
  sub_244EA1494();
  v12 = v20;
  v19 = 2;
  sub_244EA1494();
  v13 = v20;
  v19 = 3;
  sub_244EA1494();
  v14 = v20;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v5);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v15 = v16;
  *a2 = v17;
  a2[1] = v15;
  a2[2] = v12;
  a2[3] = v13;
  a2[4] = v14;
  return result;
}

unint64_t sub_244E9374C()
{
  unint64_t result;

  result = qword_257426118;
  if (!qword_257426118)
  {
    result = MEMORY[0x249528E58](&unk_244EA34A0, &type metadata for TVContentCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426118);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TVContentCriteria.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244E937DC + 4 * byte_244EA3329[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_244E93810 + 4 * byte_244EA3324[v4]))();
}

uint64_t sub_244E93810(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E93818(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244E93820);
  return result;
}

uint64_t sub_244E9382C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244E93834);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_244E93838(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E93840(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TVContentCriteria.CodingKeys()
{
  return &type metadata for TVContentCriteria.CodingKeys;
}

unint64_t sub_244E93860()
{
  unint64_t result;

  result = qword_257426120;
  if (!qword_257426120)
  {
    result = MEMORY[0x249528E58](&unk_244EA3478, &type metadata for TVContentCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426120);
  }
  return result;
}

unint64_t sub_244E938A8()
{
  unint64_t result;

  result = qword_257426128;
  if (!qword_257426128)
  {
    result = MEMORY[0x249528E58](&unk_244EA33B0, &type metadata for TVContentCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426128);
  }
  return result;
}

unint64_t sub_244E938F0()
{
  unint64_t result;

  result = qword_257426130;
  if (!qword_257426130)
  {
    result = MEMORY[0x249528E58](&unk_244EA33D8, &type metadata for TVContentCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426130);
  }
  return result;
}

uint64_t sub_244E93934()
{
  unint64_t v0;

  v0 = sub_244EA147C();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_244E9397C(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t i;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t *v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t *v30;
  uint64_t v31;
  unint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t *v46;
  uint64_t v47;
  unint64_t *v48;
  unint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  unint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t *v62;
  uint64_t v63;
  unint64_t *v64;
  unint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  unint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t *v78;
  uint64_t v79;
  unint64_t *v80;
  unint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t *v88;
  unint64_t v89;
  uint64_t v90;
  char v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t *v94;
  uint64_t v95;
  unint64_t *v96;
  unint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  unint64_t v105;
  uint64_t v106;
  char v107;
  uint64_t v108;
  unint64_t v109;
  unint64_t *v110;
  uint64_t v111;
  unint64_t *v112;
  unint64_t v113;
  uint64_t v114;
  _QWORD *v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t *v121;
  unint64_t v122;
  uint64_t v123;
  char v124;
  uint64_t v125;
  unint64_t v126;
  unint64_t *v127;
  uint64_t v128;
  unint64_t *v129;
  unint64_t v130;
  uint64_t v131;
  _QWORD *v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  uint64_t *v137;
  unint64_t v138;
  uint64_t v139;
  char v140;
  uint64_t v141;
  unint64_t v142;
  unint64_t *v143;
  uint64_t v144;
  unint64_t *v145;
  unint64_t v146;
  uint64_t v147;
  _QWORD *v148;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  uint64_t v152;
  uint64_t *v153;
  unint64_t v154;
  uint64_t v155;
  char v156;
  uint64_t v157;
  unint64_t v158;
  unint64_t *v159;
  uint64_t v160;
  unint64_t *v161;
  unint64_t v162;
  uint64_t v163;
  _QWORD *v164;
  uint64_t v165;
  uint64_t v166;
  unint64_t v167;
  uint64_t v168;
  uint64_t *v169;
  unint64_t v170;
  uint64_t v171;
  char v172;
  uint64_t v173;
  unint64_t v174;
  unint64_t *v175;
  uint64_t v176;
  unint64_t *v177;
  unint64_t v178;
  uint64_t v179;
  _QWORD *v180;
  uint64_t v181;
  uint64_t v182;
  unint64_t v183;
  uint64_t v184;
  uint64_t *v186;
  unint64_t v187;
  uint64_t v188;
  char v189;
  uint64_t v190;
  unint64_t v191;
  unint64_t *v192;
  uint64_t v193;
  unint64_t *v194;
  unint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  _QWORD *v231;
  _QWORD *v232;
  _QWORD *v233;
  _QWORD *v234;
  _QWORD *v235;
  _QWORD *v236;
  _QWORD *v237;
  _QWORD *v238;
  _QWORD *v239;
  _QWORD *v240;
  _QWORD *v241;
  uint64_t v242;
  _QWORD *v243;
  _QWORD *v244;
  _QWORD *v245;
  _QWORD *v246;
  _QWORD *v247;
  _QWORD *v248;
  _QWORD *v249;
  _QWORD *v250;
  _QWORD *v251;
  _QWORD *v252;
  _QWORD *v253;
  uint64_t v254;

  v2 = a1;
  v3 = (_QWORD *)*v1;
  if (*v1)
  {
    v4 = *a1;
    if (!*v2)
      return 0;
    v5 = v3[2];
    if (v5)
    {
      v197 = *(_QWORD *)(v4 + 16);
      if (v197)
      {
        v243 = v2;
        v6 = v3[5];
        v208 = v3[4];
        v219 = v4 + 32;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        for (i = 0; i != v197; ++i)
        {
          v8 = (uint64_t *)(v219 + 16 * i);
          v10 = *v8;
          v9 = v8[1];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v11 = sub_244E811F8(v208, v6, v10, v9);
          swift_bridgeObjectRelease();
          if ((v11 & 1) != 0)
          {
LABEL_12:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            v1 = v231;
            v2 = v243;
            goto LABEL_13;
          }
          if (v5 != 1)
          {
            v12 = v3[6];
            v13 = v3[7];
            swift_bridgeObjectRetain();
            LOBYTE(v12) = sub_244E811F8(v12, v13, v10, v9);
            swift_bridgeObjectRelease();
            v15 = v5 - 1;
            v14 = v3 + 9;
            if ((v12 & 1) != 0)
              goto LABEL_12;
            while (--v15)
            {
              v16 = v14 + 2;
              v18 = *(v14 - 1);
              v17 = *v14;
              swift_bridgeObjectRetain();
              LOBYTE(v18) = sub_244E811F8(v18, v17, v10, v9);
              swift_bridgeObjectRelease();
              v14 = v16;
              if ((v18 & 1) != 0)
                goto LABEL_12;
            }
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
LABEL_90:
        v120 = 0;
        goto LABEL_91;
      }
      return 0;
    }
  }
LABEL_13:
  v19 = (_QWORD *)v1[1];
  if (v19)
  {
    v20 = v2[1];
    if (!v20)
      return 0;
    v21 = v19[2];
    if (v21)
    {
      v198 = *(_QWORD *)(v20 + 16);
      if (!v198)
        return 0;
      v232 = v1;
      v244 = v2;
      v22 = v19[5];
      v209 = v19[4];
      v220 = v20 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v23 = 0;
      while (1)
      {
        v24 = (uint64_t *)(v220 + 16 * v23);
        v26 = *v24;
        v25 = v24[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v27 = sub_244E811F8(v209, v22, v26, v25);
        swift_bridgeObjectRelease();
        if ((v27 & 1) != 0)
          break;
        if (v21 != 1)
        {
          v28 = v19[6];
          v29 = v19[7];
          swift_bridgeObjectRetain();
          LOBYTE(v28) = sub_244E811F8(v28, v29, v26, v25);
          swift_bridgeObjectRelease();
          v31 = v21 - 1;
          v30 = v19 + 9;
          if ((v28 & 1) != 0)
            break;
          while (--v31)
          {
            v32 = v30 + 2;
            v34 = *(v30 - 1);
            v33 = *v30;
            swift_bridgeObjectRetain();
            LOBYTE(v34) = sub_244E811F8(v34, v33, v26, v25);
            swift_bridgeObjectRelease();
            v30 = v32;
            if ((v34 & 1) != 0)
              goto LABEL_24;
          }
        }
        ++v23;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v23 == v198)
          goto LABEL_90;
      }
LABEL_24:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v1 = v232;
      v2 = v244;
    }
  }
  v35 = (_QWORD *)v1[2];
  if (v35)
  {
    v36 = v2[2];
    if (!v36)
      return 0;
    v37 = v35[2];
    if (v37)
    {
      v199 = *(_QWORD *)(v36 + 16);
      if (!v199)
        return 0;
      v233 = v1;
      v245 = v2;
      v38 = v35[5];
      v210 = v35[4];
      v221 = v36 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v39 = 0;
      while (1)
      {
        v40 = (uint64_t *)(v221 + 16 * v39);
        v42 = *v40;
        v41 = v40[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v43 = sub_244E811F8(v210, v38, v42, v41);
        swift_bridgeObjectRelease();
        if ((v43 & 1) != 0)
          break;
        if (v37 != 1)
        {
          v44 = v35[6];
          v45 = v35[7];
          swift_bridgeObjectRetain();
          LOBYTE(v44) = sub_244E811F8(v44, v45, v42, v41);
          swift_bridgeObjectRelease();
          v47 = v37 - 1;
          v46 = v35 + 9;
          if ((v44 & 1) != 0)
            break;
          while (--v47)
          {
            v48 = v46 + 2;
            v50 = *(v46 - 1);
            v49 = *v46;
            swift_bridgeObjectRetain();
            LOBYTE(v50) = sub_244E811F8(v50, v49, v42, v41);
            swift_bridgeObjectRelease();
            v46 = v48;
            if ((v50 & 1) != 0)
              goto LABEL_36;
          }
        }
        ++v39;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v39 == v199)
          goto LABEL_90;
      }
LABEL_36:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v1 = v233;
      v2 = v245;
    }
  }
  v51 = (_QWORD *)v1[3];
  if (v51)
  {
    v52 = v2[3];
    if (!v52)
      return 0;
    v53 = v51[2];
    if (v53)
    {
      v200 = *(_QWORD *)(v52 + 16);
      if (!v200)
        return 0;
      v234 = v1;
      v246 = v2;
      v54 = v51[5];
      v211 = v51[4];
      v222 = v52 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v55 = 0;
      while (1)
      {
        v56 = (uint64_t *)(v222 + 16 * v55);
        v58 = *v56;
        v57 = v56[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v59 = sub_244E811F8(v211, v54, v58, v57);
        swift_bridgeObjectRelease();
        if ((v59 & 1) != 0)
          break;
        if (v53 != 1)
        {
          v60 = v51[6];
          v61 = v51[7];
          swift_bridgeObjectRetain();
          LOBYTE(v60) = sub_244E811F8(v60, v61, v58, v57);
          swift_bridgeObjectRelease();
          v63 = v53 - 1;
          v62 = v51 + 9;
          if ((v60 & 1) != 0)
            break;
          while (--v63)
          {
            v64 = v62 + 2;
            v66 = *(v62 - 1);
            v65 = *v62;
            swift_bridgeObjectRetain();
            LOBYTE(v66) = sub_244E811F8(v66, v65, v58, v57);
            swift_bridgeObjectRelease();
            v62 = v64;
            if ((v66 & 1) != 0)
              goto LABEL_48;
          }
        }
        ++v55;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v55 == v200)
          goto LABEL_90;
      }
LABEL_48:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v1 = v234;
      v2 = v246;
    }
  }
  v67 = (_QWORD *)v1[4];
  if (v67)
  {
    v68 = v2[4];
    if (!v68)
      return 0;
    v69 = v67[2];
    if (v69)
    {
      v201 = *(_QWORD *)(v68 + 16);
      if (!v201)
        return 0;
      v235 = v1;
      v247 = v2;
      v70 = v67[5];
      v212 = v67[4];
      v223 = v68 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v71 = 0;
      while (1)
      {
        v72 = (uint64_t *)(v223 + 16 * v71);
        v74 = *v72;
        v73 = v72[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v75 = sub_244E811F8(v212, v70, v74, v73);
        swift_bridgeObjectRelease();
        if ((v75 & 1) != 0)
          break;
        if (v69 != 1)
        {
          v76 = v67[6];
          v77 = v67[7];
          swift_bridgeObjectRetain();
          LOBYTE(v76) = sub_244E811F8(v76, v77, v74, v73);
          swift_bridgeObjectRelease();
          v79 = v69 - 1;
          v78 = v67 + 9;
          if ((v76 & 1) != 0)
            break;
          while (--v79)
          {
            v80 = v78 + 2;
            v82 = *(v78 - 1);
            v81 = *v78;
            swift_bridgeObjectRetain();
            LOBYTE(v82) = sub_244E811F8(v82, v81, v74, v73);
            swift_bridgeObjectRelease();
            v78 = v80;
            if ((v82 & 1) != 0)
              goto LABEL_60;
          }
        }
        ++v71;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v71 == v201)
          goto LABEL_90;
      }
LABEL_60:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v1 = v235;
      v2 = v247;
    }
  }
  v83 = (_QWORD *)v1[5];
  if (v83)
  {
    v84 = v2[5];
    if (!v84)
      return 0;
    v85 = v83[2];
    if (v85)
    {
      v202 = *(_QWORD *)(v84 + 16);
      if (!v202)
        return 0;
      v236 = v1;
      v248 = v2;
      v86 = v83[5];
      v213 = v83[4];
      v224 = v84 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v87 = 0;
      while (1)
      {
        v88 = (uint64_t *)(v224 + 16 * v87);
        v90 = *v88;
        v89 = v88[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v91 = sub_244E811F8(v213, v86, v90, v89);
        swift_bridgeObjectRelease();
        if ((v91 & 1) != 0)
          break;
        if (v85 != 1)
        {
          v92 = v83[6];
          v93 = v83[7];
          swift_bridgeObjectRetain();
          LOBYTE(v92) = sub_244E811F8(v92, v93, v90, v89);
          swift_bridgeObjectRelease();
          v95 = v85 - 1;
          v94 = v83 + 9;
          if ((v92 & 1) != 0)
            break;
          while (--v95)
          {
            v96 = v94 + 2;
            v98 = *(v94 - 1);
            v97 = *v94;
            swift_bridgeObjectRetain();
            LOBYTE(v98) = sub_244E811F8(v98, v97, v90, v89);
            swift_bridgeObjectRelease();
            v94 = v96;
            if ((v98 & 1) != 0)
              goto LABEL_72;
          }
        }
        ++v87;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v87 == v202)
          goto LABEL_90;
      }
LABEL_72:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v1 = v236;
      v2 = v248;
    }
  }
  v99 = (_QWORD *)v1[6];
  if (v99)
  {
    v100 = v2[6];
    if (!v100)
      return 0;
    v101 = v99[2];
    if (v101)
    {
      v203 = *(_QWORD *)(v100 + 16);
      if (!v203)
        return 0;
      v237 = v1;
      v249 = v2;
      v102 = v99[5];
      v214 = v99[4];
      v225 = v100 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v103 = 0;
      while (1)
      {
        v104 = (uint64_t *)(v225 + 16 * v103);
        v106 = *v104;
        v105 = v104[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v107 = sub_244E811F8(v214, v102, v106, v105);
        swift_bridgeObjectRelease();
        if ((v107 & 1) != 0)
          break;
        if (v101 != 1)
        {
          v108 = v99[6];
          v109 = v99[7];
          swift_bridgeObjectRetain();
          LOBYTE(v108) = sub_244E811F8(v108, v109, v106, v105);
          swift_bridgeObjectRelease();
          v111 = v101 - 1;
          v110 = v99 + 9;
          if ((v108 & 1) != 0)
            break;
          while (--v111)
          {
            v112 = v110 + 2;
            v114 = *(v110 - 1);
            v113 = *v110;
            swift_bridgeObjectRetain();
            LOBYTE(v114) = sub_244E811F8(v114, v113, v106, v105);
            swift_bridgeObjectRelease();
            v110 = v112;
            if ((v114 & 1) != 0)
              goto LABEL_84;
          }
        }
        ++v103;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v103 == v203)
          goto LABEL_90;
      }
LABEL_84:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v1 = v237;
      v2 = v249;
    }
  }
  v115 = (_QWORD *)v1[7];
  if (v115)
  {
    v116 = v2[7];
    if (!v116)
      return 0;
    v117 = v115[2];
    if (v117)
    {
      v204 = *(_QWORD *)(v116 + 16);
      if (!v204)
        return 0;
      v238 = v1;
      v250 = v2;
      v118 = v115[5];
      v215 = v115[4];
      v226 = v116 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v119 = 0;
      while (1)
      {
        v121 = (uint64_t *)(v226 + 16 * v119);
        v123 = *v121;
        v122 = v121[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v124 = sub_244E811F8(v215, v118, v123, v122);
        swift_bridgeObjectRelease();
        if ((v124 & 1) != 0)
          break;
        if (v117 != 1)
        {
          v125 = v115[6];
          v126 = v115[7];
          swift_bridgeObjectRetain();
          LOBYTE(v125) = sub_244E811F8(v125, v126, v123, v122);
          swift_bridgeObjectRelease();
          v128 = v117 - 1;
          v127 = v115 + 9;
          if ((v125 & 1) != 0)
            break;
          while (--v128)
          {
            v129 = v127 + 2;
            v131 = *(v127 - 1);
            v130 = *v127;
            swift_bridgeObjectRetain();
            LOBYTE(v131) = sub_244E811F8(v131, v130, v123, v122);
            swift_bridgeObjectRelease();
            v127 = v129;
            if ((v131 & 1) != 0)
              goto LABEL_98;
          }
        }
        ++v119;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v120 = 0;
        if (v119 == v204)
          goto LABEL_91;
      }
LABEL_98:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v1 = v238;
      v2 = v250;
    }
  }
  v132 = (_QWORD *)v1[8];
  if (v132)
  {
    v133 = v2[8];
    if (!v133)
      return 0;
    v134 = v132[2];
    if (v134)
    {
      v205 = *(_QWORD *)(v133 + 16);
      if (!v205)
        return 0;
      v239 = v1;
      v251 = v2;
      v135 = v132[5];
      v216 = v132[4];
      v227 = v133 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v136 = 0;
      while (1)
      {
        v137 = (uint64_t *)(v227 + 16 * v136);
        v139 = *v137;
        v138 = v137[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v140 = sub_244E811F8(v216, v135, v139, v138);
        swift_bridgeObjectRelease();
        if ((v140 & 1) != 0)
          break;
        if (v134 != 1)
        {
          v141 = v132[6];
          v142 = v132[7];
          swift_bridgeObjectRetain();
          LOBYTE(v141) = sub_244E811F8(v141, v142, v139, v138);
          swift_bridgeObjectRelease();
          v144 = v134 - 1;
          v143 = v132 + 9;
          if ((v141 & 1) != 0)
            break;
          while (--v144)
          {
            v145 = v143 + 2;
            v147 = *(v143 - 1);
            v146 = *v143;
            swift_bridgeObjectRetain();
            LOBYTE(v147) = sub_244E811F8(v147, v146, v139, v138);
            swift_bridgeObjectRelease();
            v143 = v145;
            if ((v147 & 1) != 0)
              goto LABEL_110;
          }
        }
        ++v136;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v120 = 0;
        if (v136 == v205)
          goto LABEL_91;
      }
LABEL_110:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v1 = v239;
      v2 = v251;
    }
  }
  v148 = (_QWORD *)v1[9];
  if (v148)
  {
    v149 = v2[9];
    if (!v149)
      return 0;
    v150 = v148[2];
    if (v150)
    {
      v206 = *(_QWORD *)(v149 + 16);
      if (!v206)
        return 0;
      v240 = v1;
      v252 = v2;
      v151 = v148[5];
      v217 = v148[4];
      v228 = v149 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v152 = 0;
      while (1)
      {
        v153 = (uint64_t *)(v228 + 16 * v152);
        v155 = *v153;
        v154 = v153[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v156 = sub_244E811F8(v217, v151, v155, v154);
        swift_bridgeObjectRelease();
        if ((v156 & 1) != 0)
          break;
        if (v150 != 1)
        {
          v157 = v148[6];
          v158 = v148[7];
          swift_bridgeObjectRetain();
          LOBYTE(v157) = sub_244E811F8(v157, v158, v155, v154);
          swift_bridgeObjectRelease();
          v160 = v150 - 1;
          v159 = v148 + 9;
          if ((v157 & 1) != 0)
            break;
          while (--v160)
          {
            v161 = v159 + 2;
            v163 = *(v159 - 1);
            v162 = *v159;
            swift_bridgeObjectRetain();
            LOBYTE(v163) = sub_244E811F8(v163, v162, v155, v154);
            swift_bridgeObjectRelease();
            v159 = v161;
            if ((v163 & 1) != 0)
              goto LABEL_122;
          }
        }
        ++v152;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v120 = 0;
        if (v152 == v206)
          goto LABEL_91;
      }
LABEL_122:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v1 = v240;
      v2 = v252;
    }
  }
  v164 = (_QWORD *)v1[10];
  if (v164)
  {
    v165 = v2[10];
    if (!v165)
      return 0;
    v166 = v164[2];
    if (v166)
    {
      v207 = *(_QWORD *)(v165 + 16);
      if (!v207)
        return 0;
      v241 = v1;
      v253 = v2;
      v167 = v164[5];
      v218 = v164[4];
      v229 = v165 + 32;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v168 = 0;
      while (1)
      {
        v169 = (uint64_t *)(v229 + 16 * v168);
        v171 = *v169;
        v170 = v169[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v172 = sub_244E811F8(v218, v167, v171, v170);
        swift_bridgeObjectRelease();
        if ((v172 & 1) != 0)
          break;
        if (v166 != 1)
        {
          v173 = v164[6];
          v174 = v164[7];
          swift_bridgeObjectRetain();
          LOBYTE(v173) = sub_244E811F8(v173, v174, v171, v170);
          swift_bridgeObjectRelease();
          v176 = v166 - 1;
          v175 = v164 + 9;
          if ((v173 & 1) != 0)
            break;
          while (--v176)
          {
            v177 = v175 + 2;
            v179 = *(v175 - 1);
            v178 = *v175;
            swift_bridgeObjectRetain();
            LOBYTE(v179) = sub_244E811F8(v179, v178, v171, v170);
            swift_bridgeObjectRelease();
            v175 = v177;
            if ((v179 & 1) != 0)
              goto LABEL_134;
          }
        }
        ++v168;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v120 = 0;
        if (v168 == v207)
          goto LABEL_91;
      }
LABEL_134:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v1 = v241;
      v2 = v253;
    }
  }
  v180 = (_QWORD *)v1[11];
  if (!v180)
    return 1;
  v181 = v2[11];
  if (!v181)
    return 0;
  v182 = v180[2];
  if (!v182)
    return 1;
  v230 = *(_QWORD *)(v181 + 16);
  if (!v230)
    return 0;
  v183 = v180[5];
  v242 = v180[4];
  v254 = v181 + 32;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v184 = 0;
  while (1)
  {
    v186 = (uint64_t *)(v254 + 16 * v184);
    v188 = *v186;
    v187 = v186[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v189 = sub_244E811F8(v242, v183, v188, v187);
    swift_bridgeObjectRelease();
    if ((v189 & 1) != 0)
      break;
    if (v182 != 1)
    {
      v190 = v180[6];
      v191 = v180[7];
      swift_bridgeObjectRetain();
      LOBYTE(v190) = sub_244E811F8(v190, v191, v188, v187);
      swift_bridgeObjectRelease();
      v193 = v182 - 1;
      v192 = v180 + 9;
      if ((v190 & 1) != 0)
        break;
      while (--v193)
      {
        v194 = v192 + 2;
        v196 = *(v192 - 1);
        v195 = *v192;
        swift_bridgeObjectRetain();
        LOBYTE(v196) = sub_244E811F8(v196, v195, v188, v187);
        swift_bridgeObjectRelease();
        v192 = v194;
        if ((v196 & 1) != 0)
          goto LABEL_149;
      }
    }
    ++v184;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v120 = 0;
    if (v184 == v230)
      goto LABEL_91;
  }
LABEL_149:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v120 = 1;
LABEL_91:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  return v120;
}

double sub_244E94AA0@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[6];

  sub_244E95694(a1, v8);
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

uint64_t sub_244E94AE8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244E94B20 + 4 * byte_244EA34F0[a1]))(0x657079546D657469, 0xE900000000000073);
}

uint64_t sub_244E94B20()
{
  return 0x5465636976726573;
}

uint64_t sub_244E94B40()
{
  return 0x6570795479616C70;
}

uint64_t sub_244E94B54()
{
  return 0x6574614379616C70;
}

uint64_t sub_244E94B78()
{
  return 0x726F466F69647561;
}

uint64_t sub_244E94B98()
{
  return 0x6E65526F69647561;
}

uint64_t sub_244E94BBC()
{
  return 0x7364497465737361;
}

uint64_t sub_244E94BD4()
{
  return 0x707954616964656DLL;
}

uint64_t sub_244E94BF0()
{
  return 0x614C64726F636572;
}

uint64_t sub_244E94C10()
{
  return 0x546E6F6974617473;
}

unint64_t sub_244E94C30()
{
  return 0xD000000000000014;
}

unint64_t sub_244E94C4C()
{
  return 0xD000000000000016;
}

uint64_t sub_244E94C6C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244E94CA4 + 4 * byte_244EA34FC[a1]))(0x657079546D657469, 0xE900000000000073);
}

uint64_t sub_244E94CA4()
{
  return 0x5465636976726573;
}

uint64_t sub_244E94CC4()
{
  return 0x6570795479616C70;
}

uint64_t sub_244E94CD8()
{
  return 0x6574614379616C70;
}

uint64_t sub_244E94CFC()
{
  return 0x726F466F69647561;
}

uint64_t sub_244E94D1C()
{
  return 0x6E65526F69647561;
}

uint64_t sub_244E94D40()
{
  return 0x7364497465737361;
}

uint64_t sub_244E94D58()
{
  return 0x707954616964656DLL;
}

uint64_t sub_244E94D74()
{
  return 0x614C64726F636572;
}

uint64_t sub_244E94D94()
{
  return 0x546E6F6974617473;
}

unint64_t sub_244E94DB4()
{
  return 0xD000000000000014;
}

unint64_t sub_244E94DD0()
{
  return 0xD000000000000016;
}

uint64_t sub_244E94DF0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v9[6];
  _OWORD v10[6];

  v2 = a1[3];
  v9[2] = a1[2];
  v9[3] = v2;
  v3 = a1[5];
  v9[4] = a1[4];
  v9[5] = v3;
  v4 = a1[1];
  v9[0] = *a1;
  v9[1] = v4;
  v5 = a2[3];
  v10[2] = a2[2];
  v10[3] = v5;
  v6 = a2[5];
  v10[4] = a2[4];
  v10[5] = v6;
  v7 = a2[1];
  v10[0] = *a2;
  v10[1] = v7;
  return sub_244E950A8((uint64_t)v9, (uint64_t)v10) & 1;
}

uint64_t sub_244E94E48(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_244E94AE8(*a1);
  v5 = v4;
  if (v3 == sub_244E94AE8(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_244EA14AC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_244E94ED0()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_244EA1500();
  sub_244E94AE8(v1);
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

uint64_t sub_244E94F30()
{
  unsigned __int8 *v0;

  sub_244E94AE8(*v0);
  sub_244EA1230();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244E94F70()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_244EA1500();
  sub_244E94AE8(v1);
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

uint64_t sub_244E94FCC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244E95EE0();
  *a1 = result;
  return result;
}

uint64_t sub_244E94FF8@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_244E94AE8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_244E95020()
{
  unsigned __int8 *v0;

  return sub_244E94C6C(*v0);
}

uint64_t sub_244E95028@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244E95EE0();
  *a1 = result;
  return result;
}

void sub_244E9504C(_BYTE *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_244E95058()
{
  sub_244E95C68();
  return sub_244EA1530();
}

uint64_t sub_244E95080()
{
  sub_244E95C68();
  return sub_244EA153C();
}

uint64_t sub_244E950A8(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;

  v4 = *(_QWORD **)a1;
  v5 = *(_QWORD **)a2;
  if (v4)
  {
    if (!v5 || (sub_244E9D2A4(v4, v5) & 1) == 0)
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  v6 = *(_QWORD **)(a1 + 8);
  v7 = *(_QWORD **)(a2 + 8);
  if (v6)
  {
    if (!v7 || (sub_244E9D2A4(v6, v7) & 1) == 0)
      return 0;
  }
  else if (v7)
  {
    return 0;
  }
  v8 = *(_QWORD **)(a1 + 16);
  v9 = *(_QWORD **)(a2 + 16);
  if (v8)
  {
    if (!v9 || (sub_244E9D2A4(v8, v9) & 1) == 0)
      return 0;
  }
  else if (v9)
  {
    return 0;
  }
  v10 = *(_QWORD **)(a1 + 24);
  v11 = *(_QWORD **)(a2 + 24);
  if (v10)
  {
    if (!v11 || (sub_244E9D2A4(v10, v11) & 1) == 0)
      return 0;
  }
  else if (v11)
  {
    return 0;
  }
  v12 = *(_QWORD **)(a1 + 32);
  v13 = *(_QWORD **)(a2 + 32);
  if (v12)
  {
    if (!v13 || (sub_244E9D2A4(v12, v13) & 1) == 0)
      return 0;
  }
  else if (v13)
  {
    return 0;
  }
  v14 = *(_QWORD **)(a1 + 40);
  v15 = *(_QWORD **)(a2 + 40);
  if (v14)
  {
    if (!v15 || (sub_244E9D2A4(v14, v15) & 1) == 0)
      return 0;
  }
  else if (v15)
  {
    return 0;
  }
  v16 = *(_QWORD **)(a1 + 48);
  v17 = *(_QWORD **)(a2 + 48);
  if (v16)
  {
    if (!v17 || (sub_244E9D2A4(v16, v17) & 1) == 0)
      return 0;
  }
  else if (v17)
  {
    return 0;
  }
  v18 = *(_QWORD **)(a1 + 56);
  v19 = *(_QWORD **)(a2 + 56);
  if (v18)
  {
    if (!v19 || (sub_244E9D2A4(v18, v19) & 1) == 0)
      return 0;
  }
  else if (v19)
  {
    return 0;
  }
  v20 = *(_QWORD **)(a1 + 64);
  v21 = *(_QWORD **)(a2 + 64);
  if (v20)
  {
    if (!v21 || (sub_244E9D2A4(v20, v21) & 1) == 0)
      return 0;
  }
  else if (v21)
  {
    return 0;
  }
  v22 = *(_QWORD **)(a1 + 72);
  v23 = *(_QWORD **)(a2 + 72);
  if (v22)
  {
    if (!v23 || (sub_244E9D2A4(v22, v23) & 1) == 0)
      return 0;
  }
  else if (v23)
  {
    return 0;
  }
  v24 = *(_QWORD **)(a1 + 80);
  v25 = *(_QWORD **)(a2 + 80);
  if (v24)
  {
    if (!v25 || (sub_244E9D2A4(v24, v25) & 1) == 0)
      return 0;
  }
  else if (v25)
  {
    return 0;
  }
  v26 = *(_QWORD **)(a1 + 88);
  v27 = *(_QWORD **)(a2 + 88);
  if (v26)
  {
    if (v27 && (sub_244E9D2A4(v26, v27) & 1) != 0)
      return 1;
  }
  else if (!v27)
  {
    return 1;
  }
  return 0;
}

uint64_t destroy for MusicContentCriteria()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for MusicContentCriteria(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
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

_QWORD *assignWithCopy for MusicContentCriteria(_QWORD *a1, _QWORD *a2)
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
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
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

_OWORD *assignWithTake for MusicContentCriteria(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MusicContentCriteria(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 96))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MusicContentCriteria(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 96) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 96) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicContentCriteria()
{
  return &type metadata for MusicContentCriteria;
}

uint64_t sub_244E95694@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  char v43;
  _QWORD *v44;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257426138);
  v6 = *(_QWORD **)(v5 - 8);
  MEMORY[0x24BDAC7A8]((_QWORD *)v6[8], v5);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244E95C68();
  sub_244EA1524();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return swift_bridgeObjectRelease_n();
  }
  else
  {
    v41 = v6;
    v42 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257425DC0);
    v43 = 0;
    sub_244E840DC();
    sub_244EA1494();
    v43 = 1;
    v40 = v44;
    swift_bridgeObjectRetain();
    sub_244EA1494();
    v43 = 2;
    v39 = v44;
    swift_bridgeObjectRetain();
    sub_244EA1494();
    v43 = 3;
    v38 = v44;
    swift_bridgeObjectRetain();
    sub_244EA1494();
    v43 = 4;
    v37 = v44;
    swift_bridgeObjectRetain();
    sub_244EA1494();
    v36 = a2;
    v43 = 5;
    v35 = v44;
    swift_bridgeObjectRetain();
    sub_244EA1494();
    v43 = 6;
    v34 = v44;
    swift_bridgeObjectRetain();
    sub_244EA1494();
    v43 = 7;
    v33 = v44;
    swift_bridgeObjectRetain();
    sub_244EA1494();
    v43 = 8;
    v32 = v44;
    swift_bridgeObjectRetain();
    sub_244EA1494();
    v10 = v44;
    LOBYTE(v44) = 9;
    v11 = v10;
    swift_bridgeObjectRetain();
    v12 = sub_244EA1488();
    v14 = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257425F08);
    v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_244EA2F60;
    *(_QWORD *)(v15 + 32) = v12;
    *(_QWORD *)(v15 + 40) = v14;
    v16 = v15;
    v43 = 10;
    sub_244EA1494();
    v17 = v44;
    v43 = 11;
    swift_bridgeObjectRetain();
    sub_244EA1494();
    v18 = (uint64_t)v42;
    v42 = v44;
    ((void (*)(char *, uint64_t))v41[1])(v8, v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v31 = v16;
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1(v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v30 = v11;
    swift_bridgeObjectRelease();
    v19 = v32;
    swift_bridgeObjectRelease();
    v20 = v33;
    swift_bridgeObjectRelease();
    v41 = v17;
    v21 = v34;
    swift_bridgeObjectRelease();
    v22 = v35;
    swift_bridgeObjectRelease();
    v23 = v37;
    swift_bridgeObjectRelease();
    v24 = v38;
    swift_bridgeObjectRelease();
    v25 = v39;
    swift_bridgeObjectRelease();
    v26 = v40;
    result = swift_bridgeObjectRelease();
    v27 = v36;
    *v36 = v26;
    v27[1] = v25;
    v27[2] = v24;
    v27[3] = v23;
    v27[4] = v22;
    v27[5] = v21;
    v27[6] = v20;
    v27[7] = v19;
    v28 = v31;
    v27[8] = v30;
    v27[9] = v28;
    v29 = v42;
    v27[10] = v41;
    v27[11] = v29;
  }
  return result;
}

unint64_t sub_244E95C68()
{
  unint64_t result;

  result = qword_257426140;
  if (!qword_257426140)
  {
    result = MEMORY[0x249528E58](&unk_244EA3684, &type metadata for MusicContentCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426140);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MusicContentCriteria.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MusicContentCriteria.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244E95D88 + 4 * byte_244EA350D[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_244E95DBC + 4 * byte_244EA3508[v4]))();
}

uint64_t sub_244E95DBC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E95DC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244E95DCCLL);
  return result;
}

uint64_t sub_244E95DD8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244E95DE0);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_244E95DE4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E95DEC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MusicContentCriteria.CodingKeys()
{
  return &type metadata for MusicContentCriteria.CodingKeys;
}

unint64_t sub_244E95E0C()
{
  unint64_t result;

  result = qword_257426148;
  if (!qword_257426148)
  {
    result = MEMORY[0x249528E58](&unk_244EA365C, &type metadata for MusicContentCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426148);
  }
  return result;
}

unint64_t sub_244E95E54()
{
  unint64_t result;

  result = qword_257426150;
  if (!qword_257426150)
  {
    result = MEMORY[0x249528E58](&unk_244EA3594, &type metadata for MusicContentCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426150);
  }
  return result;
}

unint64_t sub_244E95E9C()
{
  unint64_t result;

  result = qword_257426158;
  if (!qword_257426158)
  {
    result = MEMORY[0x249528E58](&unk_244EA35BC, &type metadata for MusicContentCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426158);
  }
  return result;
}

uint64_t sub_244E95EE0()
{
  unint64_t v0;

  v0 = sub_244EA147C();
  swift_bridgeObjectRelease();
  if (v0 >= 0xC)
    return 12;
  else
    return v0;
}

uint64_t destroy for TVDeviceCriteria()
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

_QWORD *initializeWithCopy for TVDeviceCriteria(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

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

_QWORD *assignWithCopy for TVDeviceCriteria(_QWORD *a1, _QWORD *a2)
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
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

_OWORD *assignWithTake for TVDeviceCriteria(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TVDeviceCriteria(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 64))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TVDeviceCriteria(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 64) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for TVDeviceCriteria()
{
  return &type metadata for TVDeviceCriteria;
}

double sub_244E96268@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;

  sub_244E96708(a1, v7);
  if (!v2)
  {
    v5 = v7[1];
    *a2 = v7[0];
    a2[1] = v5;
    result = *(double *)&v8;
    v6 = v9;
    a2[2] = v8;
    a2[3] = v6;
  }
  return result;
}

uint64_t sub_244E962A8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[4];
  _OWORD v8[4];

  v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  v3 = a1[3];
  v7[2] = a1[2];
  v7[3] = v3;
  v4 = a2[1];
  v8[0] = *a2;
  v8[1] = v4;
  v5 = a2[3];
  v8[2] = a2[2];
  v8[3] = v5;
  return sub_244E965E0((uint64_t)v7, (uint64_t)v8) & 1;
}

void sub_244E962F0(char *a1)
{
  sub_244E8AA30(*a1);
}

void sub_244E962FC()
{
  char *v0;

  sub_244E9E18C(0, *v0);
}

void sub_244E96308(uint64_t a1)
{
  char *v1;

  sub_244E9E068(a1, *v1);
}

void sub_244E96310(uint64_t a1)
{
  char *v1;

  sub_244E9E18C(a1, *v1);
}

uint64_t sub_244E96318@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244E96D9C();
  *a1 = result;
  return result;
}

uint64_t sub_244E96344()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_244E9637C + 4 * byte_244EA36E0[*v0]))();
}

void sub_244E9637C(_QWORD *a1@<X8>)
{
  *a1 = 0x614E656369766564;
  a1[1] = 0xEA0000000000656DLL;
}

void sub_244E9639C(_QWORD *a1@<X8>)
{
  *a1 = 0x6F4D656369766564;
  a1[1] = 0xEB000000006C6564;
}

void sub_244E963C0(_QWORD *a1@<X8>)
{
  *a1 = 0x6973726556707061;
  a1[1] = 0xEA00000000006E6FLL;
}

void sub_244E963E4(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "hlsjsVersion");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void sub_244E96408(_QWORD *a1@<X8>)
{
  *a1 = 0x657261776D726966;
  a1[1] = 0xEF6E6F6973726556;
}

void sub_244E96430(_QWORD *a1@<X8>)
{
  *a1 = 0x6F6973726556736FLL;
  a1[1] = 0xE90000000000006ELL;
}

void sub_244E96450(_QWORD *a1@<X8>)
{
  *a1 = 29551;
  a1[1] = 0xE200000000000000;
}

uint64_t sub_244E96460()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244E96498 + 4 * byte_244EA36E8[*v0]))(0x6146656369766564, 0xEC000000796C696DLL);
}

uint64_t sub_244E96498()
{
  return 0x614E656369766564;
}

uint64_t sub_244E964B4()
{
  return 0x6F4D656369766564;
}

uint64_t sub_244E964D4()
{
  return 0x6973726556707061;
}

uint64_t sub_244E964F4()
{
  return 0x726556736A736C68;
}

uint64_t sub_244E96514()
{
  return 0x657261776D726966;
}

uint64_t sub_244E96538()
{
  return 0x6F6973726556736FLL;
}

uint64_t sub_244E96554()
{
  return 29551;
}

uint64_t sub_244E96560@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244E96D9C();
  *a1 = result;
  return result;
}

void sub_244E96584(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_244E96590()
{
  sub_244E96B24();
  return sub_244EA1530();
}

uint64_t sub_244E965B8()
{
  sub_244E96B24();
  return sub_244EA153C();
}

uint64_t sub_244E965E0(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;

  v4 = *(_QWORD **)a1;
  v5 = *(_QWORD **)a2;
  if (v4)
  {
    if (!v5 || (sub_244E9D2A4(v4, v5) & 1) == 0)
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  v6 = *(_QWORD **)(a1 + 8);
  v7 = *(_QWORD **)(a2 + 8);
  if (v6)
  {
    if (!v7 || (sub_244E9D2A4(v6, v7) & 1) == 0)
      return 0;
  }
  else if (v7)
  {
    return 0;
  }
  v8 = *(_QWORD **)(a1 + 16);
  v9 = *(_QWORD **)(a2 + 16);
  if (v8)
  {
    if (!v9 || (sub_244E9D2A4(v8, v9) & 1) == 0)
      return 0;
  }
  else if (v9)
  {
    return 0;
  }
  v10 = *(_QWORD **)(a1 + 24);
  v11 = *(_QWORD **)(a2 + 24);
  if (v10)
  {
    if (!v11 || (sub_244E9D2A4(v10, v11) & 1) == 0)
      return 0;
  }
  else if (v11)
  {
    return 0;
  }
  v12 = *(_QWORD **)(a1 + 32);
  v13 = *(_QWORD **)(a2 + 32);
  if (v12)
  {
    if (!v13 || (sub_244E9D2A4(v12, v13) & 1) == 0)
      return 0;
  }
  else if (v13)
  {
    return 0;
  }
  v14 = *(_QWORD **)(a1 + 40);
  v15 = *(_QWORD **)(a2 + 40);
  if (v14)
  {
    if (!v15 || (sub_244E9D2A4(v14, v15) & 1) == 0)
      return 0;
  }
  else if (v15)
  {
    return 0;
  }
  v16 = *(_QWORD **)(a1 + 48);
  v17 = *(_QWORD **)(a2 + 48);
  if (v16)
  {
    if (!v17 || (sub_244E9D2A4(v16, v17) & 1) == 0)
      return 0;
  }
  else if (v17)
  {
    return 0;
  }
  v18 = *(_QWORD **)(a1 + 56);
  v19 = *(_QWORD **)(a2 + 56);
  if (v18)
  {
    if (v19 && (sub_244E9D2A4(v18, v19) & 1) != 0)
      return 1;
  }
  else if (!v19)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_244E96708@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  char v27;
  _QWORD *v28;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257426160);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(v6 + 64), v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244E96B24();
  sub_244EA1524();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return swift_bridgeObjectRelease_n();
  }
  else
  {
    v25 = v6;
    v26 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257425DC0);
    v27 = 2;
    sub_244E840DC();
    sub_244EA1494();
    v27 = 0;
    v24 = v28;
    swift_bridgeObjectRetain();
    sub_244EA1494();
    v27 = 1;
    v23 = v28;
    swift_bridgeObjectRetain();
    sub_244EA1494();
    v27 = 3;
    v22 = v28;
    swift_bridgeObjectRetain();
    sub_244EA1494();
    v27 = 4;
    v21 = v28;
    swift_bridgeObjectRetain();
    sub_244EA1494();
    v27 = 5;
    v20 = v28;
    swift_bridgeObjectRetain();
    sub_244EA1494();
    v27 = 6;
    v10 = v28;
    swift_bridgeObjectRetain();
    sub_244EA1494();
    v27 = 7;
    v11 = v28;
    swift_bridgeObjectRetain();
    sub_244EA1494();
    v12 = v26;
    v26 = v28;
    (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    v13 = v11;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v14 = v20;
    swift_bridgeObjectRelease();
    v15 = v21;
    swift_bridgeObjectRelease();
    v16 = v24;
    swift_bridgeObjectRelease();
    v17 = v22;
    swift_bridgeObjectRelease();
    v18 = v23;
    result = swift_bridgeObjectRelease();
    *v12 = v18;
    v12[1] = v17;
    v12[2] = v16;
    v12[3] = v15;
    v12[4] = v14;
    v12[5] = v10;
    v19 = v26;
    v12[6] = v13;
    v12[7] = v19;
  }
  return result;
}

unint64_t sub_244E96B24()
{
  unint64_t result;

  result = qword_257426168;
  if (!qword_257426168)
  {
    result = MEMORY[0x249528E58](&unk_244EA3870, &type metadata for TVDeviceCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426168);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TVDeviceCriteria.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TVDeviceCriteria.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244E96C44 + 4 * byte_244EA36F5[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_244E96C78 + 4 * byte_244EA36F0[v4]))();
}

uint64_t sub_244E96C78(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E96C80(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244E96C88);
  return result;
}

uint64_t sub_244E96C94(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244E96C9CLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_244E96CA0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E96CA8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TVDeviceCriteria.CodingKeys()
{
  return &type metadata for TVDeviceCriteria.CodingKeys;
}

unint64_t sub_244E96CC8()
{
  unint64_t result;

  result = qword_257426170;
  if (!qword_257426170)
  {
    result = MEMORY[0x249528E58](&unk_244EA3848, &type metadata for TVDeviceCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426170);
  }
  return result;
}

unint64_t sub_244E96D10()
{
  unint64_t result;

  result = qword_257426178;
  if (!qword_257426178)
  {
    result = MEMORY[0x249528E58](&unk_244EA3780, &type metadata for TVDeviceCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426178);
  }
  return result;
}

unint64_t sub_244E96D58()
{
  unint64_t result;

  result = qword_257426180;
  if (!qword_257426180)
  {
    result = MEMORY[0x249528E58](&unk_244EA37A8, &type metadata for TVDeviceCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426180);
  }
  return result;
}

uint64_t sub_244E96D9C()
{
  unint64_t v0;

  v0 = sub_244EA147C();
  swift_bridgeObjectRelease();
  if (v0 >= 8)
    return 8;
  else
    return v0;
}

uint64_t sub_244E96E64(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  v4 = sub_244EA11C4();
  v6 = v5;
  swift_retain();
  v3(a2, v4, v6);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244E96F48(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = sub_244EA1188();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

id sub_244E97028(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  void *v3;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = (void *)v1(v2);
  swift_release();
  return v3;
}

uint64_t sub_244E97158(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[149] = v2;
  v3[148] = a2;
  v3[147] = a1;
  v4 = sub_244EA0FE4();
  v3[150] = v4;
  v3[151] = *(_QWORD *)(v4 - 8);
  v3[152] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244E971C0()
{
  uint64_t v0;
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  int *v17;

  *(_QWORD *)(v0 + 1160) = objc_msgSend(*(id *)(v0 + 1184), sel_code);
  sub_244EA14A0();
  sub_244EA0FD8();
  swift_bridgeObjectRelease();
  v1 = (_QWORD *)sub_244E986AC(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v3 = v1[2];
  v2 = v1[3];
  if (v3 >= v2 >> 1)
    v1 = (_QWORD *)sub_244E986AC(v2 > 1, v3 + 1, 1, v1);
  v4 = *(_QWORD *)(v0 + 1216);
  v5 = *(_QWORD *)(v0 + 1208);
  v6 = *(_QWORD *)(v0 + 1200);
  v7 = *(_QWORD **)(v0 + 1192);
  v8 = *(_QWORD *)(v0 + 1176);
  v1[2] = v3 + 1;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 32))((unint64_t)v1+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v3, v4, v6);
  *(_QWORD *)(v0 + 1168) = v1;
  *(_QWORD *)(swift_task_alloc() + 16) = v0 + 1168;
  sub_244E98D94(v8, (void (*)(uint64_t, uint64_t, uint64_t))sub_244E98BB0);
  swift_task_dealloc();
  v9 = v7[16];
  v10 = v7[17];
  __swift_project_boxed_opaque_existential_1(v7 + 13, v9);
  v11 = *(_QWORD *)(v0 + 1168);
  *(_QWORD *)(v0 + 1224) = v11;
  v12 = *(int **)(v10 + 48);
  *(_QWORD *)(v0 + 1232) = swift_getAssociatedTypeWitness();
  v13 = sub_244EA1398();
  *(_QWORD *)(v0 + 1240) = v13;
  *(_QWORD *)(v0 + 1248) = *(_QWORD *)(v13 - 8);
  v14 = swift_task_alloc();
  *(_QWORD *)(v0 + 1256) = v14;
  v17 = (int *)((char *)v12 + *v12);
  swift_bridgeObjectRetain();
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 1264) = v15;
  *v15 = v0;
  v15[1] = sub_244E973E0;
  return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t))v17)(v14, 0, v11, v9, v10);
}

uint64_t sub_244E973E0()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_244E97440()
{
  uint64_t v0;
  _OWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *boxed_opaque_existential_0;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t i;
  int v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void (*v36)(void);
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void (*v49)(uint64_t);
  uint64_t v50;
  objc_class *v51;
  char *v52;
  char *v53;
  char *v54;
  _OWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v1 = (_OWORD *)(v0 + 1072);
  v2 = *(_QWORD *)(v0 + 1256);
  v3 = *(_QWORD *)(v0 + 1232);
  v4 = *(_QWORD *)(v3 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 1248) + 8))(v2, *(_QWORD *)(v0 + 1240));
    swift_task_dealloc();
    *v1 = 0u;
    *(_OWORD *)(v0 + 1088) = 0u;
  }
  else
  {
    *(_QWORD *)(v0 + 1096) = v3;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 1072));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v4 + 32))(boxed_opaque_existential_0, v2, v3);
    swift_task_dealloc();
  }
  sub_244E98F2C(v0 + 1072, v0 + 1104);
  if (!*(_QWORD *)(v0 + 1128))
  {
    sub_244E8E0B0(v0 + 1104, &qword_257426268);
    goto LABEL_18;
  }
  v6 = (uint64_t *)(v0 + 1152);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_18:
    v33 = *(_QWORD *)(v0 + 1192);
    v34 = *(void **)(v0 + 1184);
    v35 = *(_QWORD *)(v0 + 1176);
    v36 = *(void (**)(void))(v33 + 72);
    sub_244E98F74(v0 + 752);
    sub_244E8DFFC(v0 + 752, v0 + 200, &qword_257426270);
    sub_244E98F98(v35, v0 + 200, (uint64_t)objc_msgSend(v34, sel_code), 1);
    v36();
    v37 = swift_bridgeObjectRelease();
    v38 = (id)(*(uint64_t (**)(uint64_t))(v33 + 88))(v37);
    v39 = (uint64_t)v1;
    goto LABEL_19;
  }
  v7 = *v6;
  v8 = *(_QWORD *)(*v6 + 16);
  if (!v8)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  v55 = (_OWORD *)(v0 + 384);
  v56 = v0 + 16;
  v9 = (_OWORD *)(v0 + 568);
  swift_bridgeObjectRetain();
  v10 = *(_OWORD *)(v7 + 32);
  v11 = *(_OWORD *)(v7 + 48);
  v12 = *(_OWORD *)(v7 + 80);
  *(_OWORD *)(v0 + 600) = *(_OWORD *)(v7 + 64);
  *(_OWORD *)(v0 + 616) = v12;
  *(_OWORD *)(v0 + 568) = v10;
  *(_OWORD *)(v0 + 584) = v11;
  v13 = *(_OWORD *)(v7 + 96);
  v14 = *(_OWORD *)(v7 + 112);
  v15 = *(_OWORD *)(v7 + 144);
  *(_OWORD *)(v0 + 664) = *(_OWORD *)(v7 + 128);
  *(_OWORD *)(v0 + 680) = v15;
  *(_OWORD *)(v0 + 632) = v13;
  *(_OWORD *)(v0 + 648) = v14;
  v16 = *(_OWORD *)(v7 + 160);
  v17 = *(_OWORD *)(v7 + 176);
  v18 = *(_OWORD *)(v7 + 192);
  *(_QWORD *)(v0 + 744) = *(_QWORD *)(v7 + 208);
  *(_OWORD *)(v0 + 712) = v17;
  *(_OWORD *)(v0 + 728) = v18;
  *(_OWORD *)(v0 + 696) = v16;
  v19 = v8 - 1;
  for (i = 216; ; i += 184)
  {
    sub_244E8DFFC(v0 + 616, v0 + 936, &qword_257425C90);
    if (sub_244E88824(v0 + 936) == 1)
      goto LABEL_13;
    v21 = *(unsigned __int8 *)(v0 + 936);
    if (v21 == 2)
      goto LABEL_13;
    v22 = *(_QWORD *)(v0 + 576);
    v58 = *(_QWORD *)(v0 + 568);
    v59 = *(_QWORD *)(v0 + 584);
    v57 = *(_QWORD *)(v0 + 592);
    if ((v21 & 1) == 0)
      break;
    v23 = sub_244EA14AC();
    sub_244E99620(v0 + 568);
    swift_bridgeObjectRelease();
    if ((v23 & 1) != 0)
      goto LABEL_21;
    sub_244E99724(v0 + 568);
LABEL_13:
    if (!v19)
    {
      swift_bridgeObjectRelease_n();
      v1 = (_OWORD *)(v0 + 1072);
      goto LABEL_18;
    }
    v24 = *(_OWORD *)(v7 + i);
    v25 = *(_OWORD *)(v7 + i + 16);
    v26 = *(_OWORD *)(v7 + i + 48);
    *(_OWORD *)(v0 + 600) = *(_OWORD *)(v7 + i + 32);
    *(_OWORD *)(v0 + 616) = v26;
    *v9 = v24;
    *(_OWORD *)(v0 + 584) = v25;
    v27 = *(_OWORD *)(v7 + i + 64);
    v28 = *(_OWORD *)(v7 + i + 80);
    v29 = *(_OWORD *)(v7 + i + 112);
    *(_OWORD *)(v0 + 664) = *(_OWORD *)(v7 + i + 96);
    *(_OWORD *)(v0 + 680) = v29;
    *(_OWORD *)(v0 + 632) = v27;
    *(_OWORD *)(v0 + 648) = v28;
    v30 = *(_OWORD *)(v7 + i + 128);
    v31 = *(_OWORD *)(v7 + i + 144);
    v32 = *(_OWORD *)(v7 + i + 160);
    *(_QWORD *)(v0 + 744) = *(_QWORD *)(v7 + i + 176);
    *(_OWORD *)(v0 + 712) = v31;
    *(_OWORD *)(v0 + 728) = v32;
    *(_OWORD *)(v0 + 696) = v30;
    --v19;
  }
  sub_244E99620(v0 + 568);
  swift_bridgeObjectRelease();
LABEL_21:
  v41 = *(_QWORD *)(v0 + 1192);
  v42 = *(void **)(v0 + 1184);
  v43 = *(_QWORD *)(v0 + 1176);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v44 = *(_OWORD *)(v0 + 712);
  *(_OWORD *)(v0 + 512) = *(_OWORD *)(v0 + 696);
  *(_OWORD *)(v0 + 528) = v44;
  *(_OWORD *)(v0 + 544) = *(_OWORD *)(v0 + 728);
  *(_QWORD *)(v0 + 560) = *(_QWORD *)(v0 + 744);
  v45 = *(_OWORD *)(v0 + 648);
  *(_OWORD *)(v0 + 448) = *(_OWORD *)(v0 + 632);
  *(_OWORD *)(v0 + 464) = v45;
  v46 = *(_OWORD *)(v0 + 680);
  *(_OWORD *)(v0 + 480) = *(_OWORD *)(v0 + 664);
  *(_OWORD *)(v0 + 496) = v46;
  v47 = *(_OWORD *)(v0 + 584);
  *v55 = *v9;
  *(_OWORD *)(v0 + 400) = v47;
  v48 = *(_OWORD *)(v0 + 616);
  *(_OWORD *)(v0 + 416) = *(_OWORD *)(v0 + 600);
  *(_OWORD *)(v0 + 432) = v48;
  nullsub_1(v55);
  sub_244E8DFFC((uint64_t)v55, v56, &qword_257426270);
  v49 = *(void (**)(uint64_t))(v41 + 72);
  sub_244E99620(v0 + 568);
  v50 = sub_244E98F98(v43, v56, (uint64_t)objc_msgSend(v42, sel_code), 0);
  sub_244E99724(v0 + 568);
  v49(v50);
  swift_bridgeObjectRelease();
  v51 = (objc_class *)type metadata accessor for QOSAlertMessage();
  v52 = (char *)objc_allocWithZone(v51);
  v53 = &v52[OBJC_IVAR___QOSAlertMessageInternal_title];
  *(_QWORD *)v53 = v58;
  *((_QWORD *)v53 + 1) = v22;
  v54 = &v52[OBJC_IVAR___QOSAlertMessageInternal_body];
  *(_QWORD *)v54 = v59;
  *((_QWORD *)v54 + 1) = v57;
  *(_QWORD *)(v0 + 1136) = v52;
  *(_QWORD *)(v0 + 1144) = v51;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v38 = objc_msgSendSuper2((objc_super *)(v0 + 1136), sel_init);
  sub_244E99724(v0 + 568);
  v39 = v0 + 1072;
LABEL_19:
  sub_244E8E0B0(v39, &qword_257426268);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v38);
}

uint64_t sub_244E978C8(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD **a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v12;
  unint64_t v13;
  _QWORD v15[2];

  v6 = sub_244EA0FE4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(v7 + 64), v6);
  v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[1] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257425DC0);
  sub_244E99974();
  sub_244EA11AC();
  sub_244EA0FD8();
  swift_bridgeObjectRelease();
  v10 = *a4;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a4 = v10;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v10 = (_QWORD *)sub_244E986AC(0, v10[2] + 1, 1, v10);
    *a4 = v10;
  }
  v13 = v10[2];
  v12 = v10[3];
  if (v13 >= v12 >> 1)
  {
    v10 = (_QWORD *)sub_244E986AC(v12 > 1, v13 + 1, 1, v10);
    *a4 = v10;
  }
  v10[2] = v13 + 1;
  return (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))((unint64_t)v10+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v13, v9, v6);
}

uint64_t sub_244E97B70(int a1, void *a2, void *aBlock, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v6;
  id v7;
  _QWORD *v8;

  v4[2] = a2;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257425DC0);
  v6 = sub_244EA1188();
  v4[5] = v6;
  v7 = a2;
  swift_retain();
  v8 = (_QWORD *)swift_task_alloc();
  v4[6] = v8;
  *v8 = v4;
  v8[1] = sub_244E97C24;
  return sub_244E97158(v6, (uint64_t)v7);
}

uint64_t sub_244E97C24(void *a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  uint64_t v6;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 32);
  v4 = *(void **)(*v1 + 16);
  v6 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();

  ((void (**)(_QWORD, void *))v3)[2](v3, a1);
  _Block_release(v3);

  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_244E97CB8(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v6)(uint64_t);
  id v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  _BYTE v14[184];
  _BYTE v15[184];

  v3 = v2;
  v6 = *(void (**)(uint64_t))(v3 + 72);
  sub_244E98F74((uint64_t)v15);
  sub_244E8DFFC((uint64_t)v15, (uint64_t)v14, &qword_257426270);
  v7 = objc_msgSend(a2, sel_code);
  if (*(_QWORD *)(sub_244E97F5C(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257425F18);
    v8 = sub_244EA1470();
  }
  else
  {
    v8 = MEMORY[0x24BEE4B00];
  }
  v13 = v8;
  v9 = (_QWORD *)swift_bridgeObjectRetain();
  sub_244E98820(v9, 1, &v13);
  swift_bridgeObjectRelease();
  v10 = sub_244E98F98(v13, (uint64_t)v14, (uint64_t)v7, 1);
  swift_release();
  v6(v10);
  v11 = swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v3 + 88))(v11);
}

uint64_t sub_244E97DF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return swift_task_switch();
}

uint64_t sub_244E97E14()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;

  if (*(_QWORD *)(sub_244E97F5C(v0[3]) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257425F18);
    v1 = sub_244EA1470();
  }
  else
  {
    v1 = MEMORY[0x24BEE4B00];
  }
  v6 = v1;
  v2 = (_QWORD *)swift_bridgeObjectRetain();
  sub_244E98820(v2, 1, &v6);
  swift_bridgeObjectRelease();
  v3 = v6;
  v0[6] = v6;
  v4 = (_QWORD *)swift_task_alloc();
  v0[7] = (uint64_t)v4;
  *v4 = v0;
  v4[1] = sub_244E97F04;
  return sub_244E97158(v3, v0[4]);
}

uint64_t sub_244E97F04(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  swift_release();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_244E97F5C(uint64_t a1)
{
  int64_t v1;
  uint64_t v3;
  int v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_244E98BB8(0, v1, 0);
    v3 = sub_244E98D0C(a1);
    if (v3 < 0 || v3 >= 1 << *(_BYTE *)(a1 + 32))
    {
      __break(1u);
    }
    else if ((*(_QWORD *)(a1 + 64 + 8 * ((unint64_t)v3 >> 6)) & (1 << v3)) != 0)
    {
      if (*(_DWORD *)(a1 + 36) == v4)
      {
        v5 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + v3);
        if ((*(char *)(*(_QWORD *)(a1 + 48) + v3) & 0x80000000) == 0)
          __asm { BR              X9 }
        __asm { BR              X9 }
      }
LABEL_12:
      __break(1u);
      JUMPOUT(0x244E98370);
    }
    __break(1u);
    goto LABEL_12;
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_244E983C0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TVPlaybackErrorMessage()
{
  return objc_opt_self();
}

uint64_t sub_244E98424(uint64_t a1, void *a2)
{
  return sub_244E97CB8(a1, a2);
}

uint64_t sub_244E98444(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = *v2;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_244E91478;
  v7[4] = a2;
  v7[5] = v6;
  v7[3] = a1;
  return swift_task_switch();
}

uint64_t sub_244E984B8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_244E91AF4;
  return v6();
}

uint64_t sub_244E9850C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_244E91AF4;
  return v7();
}

uint64_t sub_244E98560(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_244EA1338();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_244EA132C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_244E8E0B0(a1, &qword_2543FFBD0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_244EA1320();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

size_t sub_244E986AC(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257426280);
  v10 = *(_QWORD *)(sub_244EA0FE4() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(sub_244EA0FE4() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

void sub_244E98820(_QWORD *a1, char a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  void *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  char v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  if (!a1[2])
  {
    swift_bridgeObjectRelease();
    return;
  }
  v41 = a1[2];
  v7 = a1[4];
  v6 = a1[5];
  v8 = a1[6];
  swift_bridgeObjectRetain();
  v9 = (_QWORD *)*a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = sub_244E8C52C(v7, v6);
  v12 = v9[2];
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
    goto LABEL_23;
  v15 = v10;
  if (v9[3] >= v14)
  {
    if ((a2 & 1) != 0)
    {
      if ((v10 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_244E8D068();
      if ((v15 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v19 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    v20 = (uint64_t *)(v19[6] + 16 * v11);
    *v20 = v7;
    v20[1] = v6;
    *(_QWORD *)(v19[7] + 8 * v11) = v8;
    v21 = v19[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v19[2] = v23;
    v24 = v41 - 1;
    if (v41 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    v25 = a1 + 9;
    while (1)
    {
      v27 = *(v25 - 2);
      v26 = *(v25 - 1);
      v28 = *v25;
      v29 = (_QWORD *)*a3;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v30 = sub_244E8C52C(v27, v26);
      v32 = v29[2];
      v33 = (v31 & 1) == 0;
      v22 = __OFADD__(v32, v33);
      v34 = v32 + v33;
      if (v22)
        break;
      v35 = v31;
      if (v29[3] < v34)
      {
        sub_244E8CA28(v34, 1);
        v30 = sub_244E8C52C(v27, v26);
        if ((v35 & 1) != (v36 & 1))
          goto LABEL_25;
      }
      if ((v35 & 1) != 0)
        goto LABEL_10;
      v37 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v30 >> 6) + 64) |= 1 << v30;
      v38 = (uint64_t *)(v37[6] + 16 * v30);
      *v38 = v27;
      v38[1] = v26;
      *(_QWORD *)(v37[7] + 8 * v30) = v28;
      v39 = v37[2];
      v22 = __OFADD__(v39, 1);
      v40 = v39 + 1;
      if (v22)
        goto LABEL_24;
      v37[2] = v40;
      v25 += 3;
      if (!--v24)
        goto LABEL_22;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_244E8CA28(v14, a2 & 1);
  v16 = sub_244E8C52C(v7, v6);
  if ((v15 & 1) == (v17 & 1))
  {
    v11 = v16;
    if ((v15 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v18 = (void *)swift_allocError();
    swift_willThrow();
    MEMORY[0x249528E04](v18);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543FFF18);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_244EA14C4();
  __break(1u);
LABEL_26:
  sub_244EA1428();
  sub_244EA1278();
  sub_244EA1440();
  sub_244EA1278();
  sub_244EA144C();
  __break(1u);
}

uint64_t sub_244E98BB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_244E978C8(a1, a2, a3, *(_QWORD ***)(v3 + 16));
}

_QWORD *sub_244E98BB8(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_244E98BD4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_244E98BD4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257426288);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[3 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 24 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257426290);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_244E98D0C(uint64_t a1)
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

uint64_t sub_244E98D94(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    v17 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v17 >= v8)
      return swift_release();
    v18 = *(_QWORD *)(v4 + 8 * v17);
    ++v10;
    if (!v18)
    {
      v10 = v17 + 1;
      if (v17 + 1 >= v8)
        return swift_release();
      v18 = *(_QWORD *)(v4 + 8 * v10);
      if (!v18)
      {
        v10 = v17 + 2;
        if (v17 + 2 >= v8)
          return swift_release();
        v18 = *(_QWORD *)(v4 + 8 * v10);
        if (!v18)
        {
          v10 = v17 + 3;
          if (v17 + 3 >= v8)
            return swift_release();
          v18 = *(_QWORD *)(v4 + 8 * v10);
          if (!v18)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v18 - 1) & v18;
    v12 = __clz(__rbit64(v18)) + (v10 << 6);
LABEL_5:
    v13 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v14 = *v13;
    v15 = v13[1];
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v12);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a2(v14, v15, v16);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v19 = v17 + 4;
  if (v19 >= v8)
    return swift_release();
  v18 = *(_QWORD *)(v4 + 8 * v19);
  if (v18)
  {
    v10 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v10 >= v8)
      return swift_release();
    v18 = *(_QWORD *)(v4 + 8 * v10);
    ++v19;
    if (v18)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_244E98F2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257426268);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

double sub_244E98F74(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 176) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_244E98F98(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  char v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  unint64_t v25;
  char v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  char v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  char v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  _QWORD v56[3];
  uint64_t v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD *v60;
  _BYTE v61[136];
  _BYTE v62[24];
  _QWORD *v63;
  _OWORD v64[11];
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _OWORD v69[8];
  uint64_t v70;

  v7 = MEMORY[0x24BEE4B00];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_244E8CD3C(0xD000000000000014, 0x8000000244EA4DF0, 0x6449676F6C616964, 0xE800000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  v9 = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v66 = v7;
  sub_244E8CD3C(0xD000000000000014, 0x8000000244EA4DF0, 0x7954676F6C616964, 0xEA00000000006570, v9);
  swift_bridgeObjectRelease();
  v10 = (a4 & 1) == 0;
  if ((a4 & 1) != 0)
    v11 = 0x746C7561666564;
  else
    v11 = 0x6465636E61686E65;
  if (v10)
    v12 = 0xE800000000000000;
  else
    v12 = 0xE700000000000000;
  v13 = swift_isUniquelyReferenced_nonNull_native();
  sub_244E8CD3C(v11, v12, 0xD000000000000018, 0x8000000244EA4E10, v13);
  swift_bridgeObjectRelease();
  v14 = sub_244EA14A0();
  v16 = v15;
  v17 = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v66 = v7;
  sub_244E8CD3C(v14, v16, 0x646F43726F727265, 0xE900000000000065, v17);
  v18 = v7;
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 16))
  {
    v19 = sub_244E8C52C(0x656C61636F6CLL, 0xE600000000000000);
    if ((v20 & 1) != 0)
    {
      v21 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * v19);
      if (v21[2])
      {
        v22 = v21[4];
        v23 = v21[5];
        swift_bridgeObjectRetain();
        v24 = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)&v66 = v7;
        sub_244E8CD3C(v22, v23, 0x656C61636F6CLL, 0xE600000000000000, v24);
        swift_bridgeObjectRelease();
      }
    }
    if (*(_QWORD *)(a1 + 16))
    {
      v25 = sub_244E8C52C(0x656449616964656DLL, 0xEF7265696669746ELL);
      if ((v26 & 1) != 0)
      {
        v27 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * v25);
        if (v27[2])
        {
          v28 = v27[4];
          v29 = v27[5];
          swift_bridgeObjectRetain();
          v30 = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)&v66 = v7;
          sub_244E8CD3C(v28, v29, 0x656449616964656DLL, 0xEF7265696669746ELL, v30);
          swift_bridgeObjectRelease();
        }
      }
      if (*(_QWORD *)(a1 + 16))
      {
        v31 = sub_244E8C52C(0x54746E65746E6F63, 0xEB00000000657079);
        if ((v32 & 1) != 0)
        {
          v33 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * v31);
          if (v33[2])
          {
            v34 = v33[4];
            v35 = v33[5];
            swift_bridgeObjectRetain();
            v36 = swift_isUniquelyReferenced_nonNull_native();
            *(_QWORD *)&v66 = v7;
            sub_244E8CD3C(v34, v35, 0x54746E65746E6F63, 0xEB00000000657079, v36);
            swift_bridgeObjectRelease();
          }
        }
        if (*(_QWORD *)(a1 + 16))
        {
          v37 = sub_244E8C52C(0x6449646E617262, 0xE700000000000000);
          if ((v38 & 1) != 0)
          {
            v39 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * v37);
            if (v39[2])
            {
              v40 = v39[4];
              v41 = v39[5];
              swift_bridgeObjectRetain();
              v42 = swift_isUniquelyReferenced_nonNull_native();
              *(_QWORD *)&v66 = v7;
              sub_244E8CD3C(v40, v41, 0x6449646E617262, 0xE700000000000000, v42);
              swift_bridgeObjectRelease();
            }
          }
        }
      }
    }
  }
  sub_244E8DFFC(a2, (uint64_t)v64, &qword_257426270);
  if (sub_244E9995C((uint64_t)v64) != 1)
  {
    v69[5] = v64[8];
    v69[6] = v64[9];
    v69[7] = v64[10];
    v70 = v65;
    v69[1] = v64[4];
    v69[2] = v64[5];
    v69[3] = v64[6];
    v69[4] = v64[7];
    v66 = v64[0];
    v67 = v64[1];
    v68 = v64[2];
    v69[0] = v64[3];
    sub_244E8DFFC((uint64_t)v69, (uint64_t)v61, &qword_257425C90);
    sub_244E8DFFC((uint64_t)v61, (uint64_t)v62, &qword_257425C90);
    if (sub_244E88824((uint64_t)v62) != 1)
    {
      if ((unint64_t)v63 >= 2 && v63[2])
      {
        v43 = v63[4];
        v44 = v63[5];
        swift_bridgeObjectRetain();
        v45 = swift_isUniquelyReferenced_nonNull_native();
        v56[0] = v7;
        sub_244E8CD3C(v43, v44, 0x6146656369766564, 0xEC000000796C696DLL, v45);
        swift_bridgeObjectRelease();
      }
      sub_244E8DFFC((uint64_t)v61, (uint64_t)v56, &qword_257425C90);
      if (v57 != 1 && v58 && v58[2])
      {
        v46 = v58[4];
        v47 = v58[5];
        swift_bridgeObjectRetain();
        v48 = swift_isUniquelyReferenced_nonNull_native();
        v56[0] = v7;
        sub_244E8CD3C(v46, v47, 0x6F4D656369766564, 0xEB000000006C6564, v48);
        v18 = v56[0];
        swift_bridgeObjectRelease();
      }
      sub_244E8DFFC((uint64_t)v61, (uint64_t)v56, &qword_257425C90);
      if (v57 != 1 && v60 && v60[2])
      {
        v49 = v60[4];
        v50 = v60[5];
        swift_bridgeObjectRetain();
        v51 = swift_isUniquelyReferenced_nonNull_native();
        v56[0] = v18;
        sub_244E8CD3C(v49, v50, 29551, 0xE200000000000000, v51);
        v18 = v56[0];
        swift_bridgeObjectRelease();
      }
      sub_244E8DFFC((uint64_t)v61, (uint64_t)v56, &qword_257425C90);
      if (v57 != 1 && v59 && v59[2])
      {
        v52 = v59[4];
        v53 = v59[5];
        swift_bridgeObjectRetain();
        v54 = swift_isUniquelyReferenced_nonNull_native();
        v56[0] = v18;
        sub_244E8CD3C(v52, v53, 0x6F6973726556736FLL, 0xE90000000000006ELL, v54);
        v18 = v56[0];
        swift_bridgeObjectRelease();
      }
    }
  }
  return v18;
}

uint64_t sub_244E99620(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 88);
  v7 = *(_QWORD *)(a1 + 96);
  v14 = *(_QWORD *)(a1 + 104);
  v15 = *(_QWORD *)(a1 + 48);
  v13 = *(_OWORD *)(a1 + 112);
  v11 = *(_OWORD *)(a1 + 144);
  v12 = *(_OWORD *)(a1 + 128);
  v10 = *(_OWORD *)(a1 + 160);
  v8 = *(_QWORD *)(a1 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_244E99828(v15, v2, v3, v4, v5, v6, v7, v14, v13, *((uint64_t *)&v13 + 1), v12, *((uint64_t *)&v12 + 1), v11, *((uint64_t *)&v11 + 1), v10, *((uint64_t *)&v10 + 1), v8, (void (*)(uint64_t, uint64_t))sub_244E85B9C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E8F78C,
    (void (*)(uint64_t))sub_244E88840,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E8F93C);
  return a1;
}

uint64_t sub_244E99724(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 88);
  v7 = *(_QWORD *)(a1 + 96);
  v14 = *(_QWORD *)(a1 + 104);
  v15 = *(_QWORD *)(a1 + 48);
  v13 = *(_OWORD *)(a1 + 112);
  v11 = *(_OWORD *)(a1 + 144);
  v12 = *(_OWORD *)(a1 + 128);
  v10 = *(_OWORD *)(a1 + 160);
  v8 = *(_QWORD *)(a1 + 176);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_244E99828(v15, v2, v3, v4, v5, v6, v7, v14, v13, *((uint64_t *)&v13 + 1), v12, *((uint64_t *)&v12 + 1), v11, *((uint64_t *)&v11 + 1), v10, *((uint64_t *)&v10 + 1), v8, (void (*)(uint64_t, uint64_t))sub_244E85BD0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E8F8AC,
    (void (*)(uint64_t))sub_244E88ADC,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E8F990);
  return a1;
}

uint64_t sub_244E99828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void (*a18)(uint64_t, uint64_t), void (*a19)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), void (*a20)(uint64_t),uint64_t (*a21)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t result;

  if (a2 != 2)
  {
    a18(a2, a3);
    a19(a4, a5, a6, a7, a8, a9, a10, a11);
    a20(a12);
    return a21(a13, a14, a15, a16, a17);
  }
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

uint64_t sub_244E9995C(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

unint64_t sub_244E99974()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257426278;
  if (!qword_257426278)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257425DC0);
    result = MEMORY[0x249528E58](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_257426278);
  }
  return result;
}

uint64_t sub_244E999C0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244E999FC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = (void *)v0[3];
  v5 = (void *)v0[4];
  v4 = v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_244E7DA1C;
  return ((uint64_t (*)(int, void *, void *, uint64_t))((char *)&dword_257426298 + dword_257426298))(v2, v3, v5, v4);
}

uint64_t sub_244E99A78()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_244E91AF4;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2574262A8 + dword_2574262A8))(v2, v3, v4);
}

uint64_t objectdestroy_7Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244E99B20(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_244E91AF4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2574262B8 + dword_2574262B8))(a1, v4, v5, v6);
}

uint64_t sub_244E99BA4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244E99BC8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_244E7DA1C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2574262C8 + dword_2574262C8))(a1, v4);
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

uint64_t sub_244E99C60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = v1;
  return swift_task_switch();
}

uint64_t sub_244E99C78()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_244E99CD4;
  return sub_244EA1374();
}

uint64_t sub_244E99CD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v5 = (_QWORD *)*v4;
  v5[9] = a1;
  v5[10] = a2;
  v5[11] = a3;
  v5[12] = v3;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244E99D44()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void (*v13)(uint64_t, unint64_t, unint64_t);
  id v14;

  objc_opt_self();
  v1 = swift_dynamicCastObjCClass();
  if (!v1)
    goto LABEL_6;
  v2 = (void *)v1;
  v3 = *(id *)(v0 + 88);
  if (objc_msgSend(v2, sel_statusCode) != (id)200)
  {

LABEL_6:
    v10 = *(_QWORD *)(v0 + 80);
    v11 = *(void **)(v0 + 88);
    v12 = *(_QWORD *)(v0 + 72);
    v13 = *(void (**)(uint64_t, unint64_t, unint64_t))(*(_QWORD *)(v0 + 56) + 24);
    sub_244EA1428();
    swift_bridgeObjectRelease();
    v14 = objc_msgSend(v11, sel_description);
    sub_244EA11C4();

    sub_244EA1278();
    swift_bridgeObjectRelease();
    v13(1, 0xD000000000000018, 0x8000000244EA4F90);

    sub_244E92D34(v12, v10);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
  v4 = *(void **)(v0 + 96);
  sub_244EA0F9C();
  swift_allocObject();
  sub_244EA0F90();
  sub_244E9BCA4();
  sub_244EA0F84();
  v5 = v4;
  v6 = *(_QWORD *)(v0 + 80);
  v7 = *(void **)(v0 + 88);
  v8 = *(_QWORD *)(v0 + 72);
  if (!v5)
  {
    swift_release();

    sub_244E92D34(v8, v6);
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 40));
  }
  v9 = *(_QWORD *)(v0 + 56);

  swift_release();
  (*(void (**)(uint64_t, uint64_t, unint64_t))(v9 + 24))(1, 0x676E69646F636544, 0xEE00726F72724520);

  sub_244E92D34(v8, v6);
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_244E99F6C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = v1;
  return swift_task_switch();
}

uint64_t sub_244E99F84()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_244E99FE0;
  return sub_244EA1374();
}

uint64_t sub_244E99FE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v5 = (_QWORD *)*v4;
  v5[9] = a1;
  v5[10] = a2;
  v5[11] = a3;
  v5[12] = v3;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244E9A050()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void (*v13)(uint64_t, unint64_t, unint64_t);
  id v14;

  objc_opt_self();
  v1 = swift_dynamicCastObjCClass();
  if (!v1)
    goto LABEL_6;
  v2 = (void *)v1;
  v3 = *(id *)(v0 + 88);
  if (objc_msgSend(v2, sel_statusCode) != (id)200)
  {

LABEL_6:
    v10 = *(_QWORD *)(v0 + 80);
    v11 = *(void **)(v0 + 88);
    v12 = *(_QWORD *)(v0 + 72);
    v13 = *(void (**)(uint64_t, unint64_t, unint64_t))(*(_QWORD *)(v0 + 56) + 24);
    sub_244EA1428();
    swift_bridgeObjectRelease();
    v14 = objc_msgSend(v11, sel_description);
    sub_244EA11C4();

    sub_244EA1278();
    swift_bridgeObjectRelease();
    v13(1, 0xD000000000000018, 0x8000000244EA4F90);

    sub_244E92D34(v12, v10);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
  v4 = *(void **)(v0 + 96);
  sub_244EA0F9C();
  swift_allocObject();
  sub_244EA0F90();
  sub_244E9BC60();
  sub_244EA0F84();
  v5 = v4;
  v6 = *(_QWORD *)(v0 + 80);
  v7 = *(void **)(v0 + 88);
  v8 = *(_QWORD *)(v0 + 72);
  if (!v5)
  {
    swift_release();

    sub_244E92D34(v8, v6);
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 40));
  }
  v9 = *(_QWORD *)(v0 + 56);

  swift_release();
  (*(void (**)(uint64_t, uint64_t, unint64_t))(v9 + 24))(1, 0x676E69646F636544, 0xEE00726F72724520);

  sub_244E92D34(v8, v6);
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_244E9A278()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, _QWORD, _QWORD);

  v1 = *(void **)(v0 + 96);
  v2 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 24);
  sub_244EA1428();
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0xE000000000000000;
  sub_244EA1278();
  *(_QWORD *)(v0 + 32) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543FFF18);
  sub_244EA1440();
  v2(1, *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease();

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_244E9A364(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = v1;
  return swift_task_switch();
}

uint64_t sub_244E9A37C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  *v1 = v0;
  v1[1] = sub_244E9A3D8;
  return sub_244EA1374();
}

uint64_t sub_244E9A3D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v5 = (_QWORD *)*v4;
  v5[12] = a1;
  v5[13] = a2;
  v5[14] = a3;
  v5[15] = v3;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244E9A448()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void (*v13)(uint64_t, unint64_t, unint64_t);
  id v14;

  objc_opt_self();
  v1 = swift_dynamicCastObjCClass();
  if (!v1)
    goto LABEL_6;
  v2 = (void *)v1;
  v3 = *(id *)(v0 + 112);
  if (objc_msgSend(v2, sel_statusCode) != (id)200)
  {

LABEL_6:
    v10 = *(_QWORD *)(v0 + 104);
    v11 = *(void **)(v0 + 112);
    v12 = *(_QWORD *)(v0 + 96);
    v13 = *(void (**)(uint64_t, unint64_t, unint64_t))(*(_QWORD *)(v0 + 80) + 24);
    sub_244EA1428();
    swift_bridgeObjectRelease();
    v14 = objc_msgSend(v11, sel_description);
    sub_244EA11C4();

    sub_244EA1278();
    swift_bridgeObjectRelease();
    v13(1, 0xD000000000000018, 0x8000000244EA4F90);

    sub_244E92D34(v12, v10);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v0 + 8))(0, 0, 0, 0);
  }
  v4 = *(void **)(v0 + 120);
  sub_244EA0F9C();
  swift_allocObject();
  sub_244EA0F90();
  sub_244E9C4CC();
  sub_244EA0F84();
  v5 = v4;
  v6 = *(_QWORD *)(v0 + 104);
  v7 = *(void **)(v0 + 112);
  v8 = *(_QWORD *)(v0 + 96);
  if (!v5)
  {
    swift_release();

    sub_244E92D34(v8, v6);
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  }
  v9 = *(_QWORD *)(v0 + 80);

  swift_release();
  (*(void (**)(uint64_t, uint64_t, unint64_t))(v9 + 24))(1, 0x676E69646F636544, 0xEE00726F72724520);

  sub_244E92D34(v8, v6);
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v0 + 8))(0, 0, 0, 0);
}

uint64_t sub_244E9A680()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, _QWORD, _QWORD);

  v1 = *(void **)(v0 + 120);
  v2 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 24);
  sub_244EA1428();
  *(_QWORD *)(v0 + 48) = 0;
  *(_QWORD *)(v0 + 56) = 0xE000000000000000;
  sub_244EA1278();
  *(_QWORD *)(v0 + 64) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543FFF18);
  sub_244EA1440();
  v2(1, *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
  swift_bridgeObjectRelease();

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v0 + 8))(0, 0, 0, 0);
}

uint64_t sub_244E9A778(uint64_t a1, void (*a2)(uint64_t, unint64_t, unint64_t))
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;

  v3 = sub_244E81A08(a1, a2);
  if (v3)
  {
    v4 = v3;
    sub_244EA0F9C();
    swift_allocObject();
    sub_244EA0F90();
    v5 = objc_msgSend(v4, sel_data);
    v6 = sub_244EA1068();
    v8 = v7;

    sub_244E9C4CC();
    sub_244EA0F84();

    sub_244E92D34(v6, v8);
    swift_release();
    return v10;
  }
  else
  {
    sub_244EA1428();
    swift_bridgeObjectRelease();
    a2(1, 0xD000000000000017, 0x8000000244EA50A0);
    return 0;
  }
}

uint64_t sub_244E9A8D0(uint64_t a1, void (*a2)(uint64_t, unint64_t, unint64_t))
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;

  v3 = sub_244E81A08(a1, a2);
  if (v3)
  {
    v4 = v3;
    sub_244EA0F9C();
    swift_allocObject();
    sub_244EA0F90();
    v5 = objc_msgSend(v4, sel_data);
    v6 = sub_244EA1068();
    v8 = v7;

    sub_244E9BC60();
    sub_244EA0F84();

    sub_244E92D34(v6, v8);
    swift_release();
    return v10;
  }
  else
  {
    sub_244EA1428();
    swift_bridgeObjectRelease();
    a2(1, 0xD00000000000001ALL, 0x8000000244EA5050);
    return 0;
  }
}

uint64_t sub_244E9AA18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_244E9AA30()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 16) + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 40));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_244E9AA88;
  return sub_244E8470C();
}

uint64_t sub_244E9AA88()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244E9AADC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v1 + 112) = sub_244E9AB20();
  swift_bridgeObjectRelease();
  sub_244E9ADD0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244E9AB20()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, unint64_t, unint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  size_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, unint64_t, unint64_t);
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v33;
  char *v34;

  v1 = sub_244EA0F78();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](*(_QWORD **)(v2 + 64), v1);
  v5 = (char *)&v33 - (((unint64_t)v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4, v3);
  v7 = (char *)&v33 - v6;
  v8 = (uint64_t *)(*__swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]) + OBJC_IVAR___QOSConfigInternal_locationUrl);
  v9 = v8[1];
  if (!v9)
    return 0;
  v10 = *v8;
  v11 = (uint64_t *)(*__swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]) + OBJC_IVAR___QOSConfigInternal_issuesUrl);
  v12 = v11[1];
  if (!v12)
    return 0;
  v33 = *v11;
  v34 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_244EA0444(1uLL, v10, v9, (uint64_t)v7);
  swift_bridgeObjectRelease();
  v13 = (void (*)(uint64_t, unint64_t, unint64_t))v0[12];
  swift_retain();
  v14 = sub_244E9A778((uint64_t)v7, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = v7;
  v22 = *(void (**)(char *, uint64_t))(v2 + 8);
  v23 = v1;
  v22(v21, v1);
  swift_release();
  if (!v16)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v24 = sub_244E9B688(v14, v16, v18, v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v25 = (uint64_t)v34;
  sub_244E9FD90(1uLL, v33, v12, v24, (uint64_t)v34);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((sub_244E9BCE8(v25) & 1) == 0)
  {
    v28 = objc_msgSend((id)objc_opt_self(), sel_sharedSession);
    v29 = objc_msgSend(v28, sel_configuration);

    v30 = objc_msgSend(v29, sel_URLCache);
    if (v30)
    {
      v31 = (void *)sub_244EA0F60();
      objc_msgSend(v30, sel_removeCachedResponseForRequest_, v31);

    }
    v22((char *)v25, v23);
    return 0;
  }
  v26 = (void (*)(uint64_t, unint64_t, unint64_t))v0[12];
  swift_retain();
  v27 = sub_244E9A8D0(v25, v26);
  v22((char *)v25, v23);
  swift_release();
  return v27;
}

_QWORD *sub_244E9ADD0()
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
  _QWORD *v10;
  _QWORD *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *result;
  uint64_t v20;
  void (*v21)(uint64_t, unint64_t, unint64_t);
  double v22;
  void *v23;
  void (*v24)(char *, uint64_t);
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_244EA1134();
  v33 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(v33 + 64), v2);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_244EA114C();
  v31 = *(_QWORD *)(v5 - 8);
  v32 = v5;
  MEMORY[0x24BDAC7A8](*(_QWORD **)(v31 + 64), v5);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_244EA1164();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](*(_QWORD **)(v9 + 64), v8);
  v12 = (char *)&v28 - (((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v10);
  v14 = (char *)&v28 - v13;
  v15 = (_QWORD *)(v0 + 16);
  v16 = *__swift_project_boxed_opaque_existential_1(v15, *(_QWORD *)(v1 + 40))
      + OBJC_IVAR___QOSConfigInternal_syncStartDelayOffsetInSecs;
  if ((*(_BYTE *)(v16 + 8) & 1) != 0
    || (v17 = *(_QWORD *)v16,
        v18 = *__swift_project_boxed_opaque_existential_1(v15, *(_QWORD *)(v1 + 40))
            + OBJC_IVAR___QOSConfigInternal_locationRefreshFrequencyInSecs,
        (*(_BYTE *)(v18 + 8) & 1) != 0)
    || (v30 = *(_QWORD *)v18,
        result = __swift_project_boxed_opaque_existential_1(v15, *(_QWORD *)(v1 + 40)),
        v20 = *result + OBJC_IVAR___QOSConfigInternal_issueRefreshFrequencyInSecs,
        (*(_BYTE *)(v20 + 8) & 1) != 0))
  {
    v21 = *(void (**)(uint64_t, unint64_t, unint64_t))(v1 + 96);
    swift_retain();
    v21(1, 0xD000000000000026, 0x8000000244EA4FB0);
    return (_QWORD *)swift_release();
  }
  else if (v17 < 0)
  {
    __break(1u);
  }
  else
  {
    v29 = *(_QWORD *)v20;
    v22 = (double)(uint64_t)sub_244E9C27C(v17 + 1);
    sub_244E9C304();
    v23 = (void *)sub_244EA138C();
    sub_244EA1158();
    MEMORY[0x2495286FC](v12, v22);
    v24 = *(void (**)(char *, uint64_t))(v9 + 8);
    v24(v12, v8);
    v25 = (_QWORD *)swift_allocObject();
    v26 = v30;
    v25[2] = v1;
    v25[3] = v26;
    v25[4] = v29;
    aBlock[4] = sub_244E9C364;
    aBlock[5] = v25;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_244E9B348;
    aBlock[3] = &block_descriptor_1;
    v27 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_244EA1140();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_244E9C510(&qword_2543FFEF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543FFF00);
    sub_244E9C388();
    sub_244EA1410();
    MEMORY[0x24952890C](v14, v7, v4, v27);
    _Block_release(v27);

    (*(void (**)(char *, uint64_t))(v33 + 8))(v4, v2);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v32);
    return (_QWORD *)((uint64_t (*)(char *, uint64_t))v24)(v14, v8);
  }
  return result;
}

void sub_244E9B150(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  double v12;
  void *v13;
  id v14;
  double v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  uint64_t (*v22)();
  uint64_t v23;

  v6 = *(_QWORD *)(a1 + 120);
  v7 = (void *)objc_opt_self();
  v22 = (uint64_t (*)())sub_244E9C3D4;
  v23 = v6;
  v8 = MEMORY[0x24BDAC760];
  v18 = MEMORY[0x24BDAC760];
  v19 = 1107296256;
  v20 = sub_244E9B4CC;
  v21 = &block_descriptor_8;
  v9 = _Block_copy(&v18);
  swift_retain_n();
  swift_release();
  v10 = objc_msgSend(v7, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v9, 0.0);
  _Block_release(v9);
  swift_release();

  v11 = *(_QWORD *)(a1 + 120);
  v12 = (double)a2;
  v22 = (uint64_t (*)())sub_244E9C3DC;
  v23 = v11;
  v18 = v8;
  v19 = 1107296256;
  v20 = sub_244E9B4CC;
  v21 = &block_descriptor_11;
  v13 = _Block_copy(&v18);
  swift_retain_n();
  swift_release();
  v14 = objc_msgSend(v7, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v13, v12);
  _Block_release(v13);
  swift_release();

  v15 = (double)a3;
  v22 = sub_244E9C3E4;
  v23 = a1;
  v18 = v8;
  v19 = 1107296256;
  v20 = sub_244E9B4CC;
  v21 = &block_descriptor_14;
  v16 = _Block_copy(&v18);
  swift_retain();
  swift_release();
  v17 = objc_msgSend(v7, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v16, v15);
  _Block_release(v16);

}

uint64_t sub_244E9B348(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_244E9B374()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  void (*v12)(uint64_t, unint64_t, unint64_t);
  uint64_t v13;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FFBD0);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v1 - 8) + 64), v1);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (_QWORD *)v0[15];
  v5 = v4[15];
  if (v5)
  {
    v7 = v4[16];
    v6 = v4[17];
    v8 = v4[14];
    v9 = sub_244EA1338();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v3, 1, 1, v9);
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = v0;
    v10[5] = v8;
    v10[6] = v5;
    v10[7] = v7;
    v10[8] = v6;
    sub_244E9C49C(v8, v5);
    swift_retain();
    sub_244E905EC((uint64_t)v3, (uint64_t)&unk_257426350, (uint64_t)v10);
  }
  else
  {
    v0[14] = 0;
    swift_bridgeObjectRelease();
    v12 = (void (*)(uint64_t, unint64_t, unint64_t))v0[12];
    swift_retain();
    v12(1, 0xD00000000000002CLL, 0x8000000244EA5000);
  }
  return swift_release();
}

void sub_244E9B4CC(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_244E9B51C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  v8[2] = a4;
  return swift_task_switch();
}

uint64_t sub_244E9B53C()
{
  uint64_t *v0;
  size_t v1;
  _QWORD *v2;

  v1 = sub_244E9B688(v0[3], v0[4], v0[5], v0[6]);
  v0[7] = v1;
  v2 = (_QWORD *)swift_task_alloc();
  v0[8] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = sub_244E9B5A4;
  return sub_244E9B82C(1, v1);
}

uint64_t sub_244E9B5A4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_244E9B608()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, unint64_t, unint64_t);

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 16);
  if (v1)
  {
    *(_QWORD *)(v2 + 112) = v1;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(v2 + 112) = 0;
    swift_bridgeObjectRelease();
    v3 = *(void (**)(uint64_t, unint64_t, unint64_t))(v2 + 96);
    swift_retain();
    v3(1, 0xD000000000000015, 0x8000000244EA5030);
    swift_release();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

size_t sub_244E9B688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  size_t v9;
  _QWORD v11[2];

  v11[1] = a4;
  v11[0] = sub_244EA0FE4();
  v5 = *(_QWORD *)(v11[0] - 8);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(v5 + 64), v11[0]);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257426280);
  v8 = ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
     + 2 * *(_QWORD *)(v5 + 72);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_244EA3940;
  sub_244EA0FD8();
  sub_244EA0FD8();
  if (*(_QWORD *)(*__swift_project_boxed_opaque_existential_1((_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 40))
                 + OBJC_IVAR___QOSConfigInternal_locale
                 + 8))
  {
    swift_bridgeObjectRetain();
    sub_244EA0FD8();
    swift_bridgeObjectRelease();
    v9 = sub_244E986AC(1uLL, 3, 1, (_QWORD *)v9);
    *(_QWORD *)(v9 + 16) = 3;
    (*(void (**)(size_t, char *, _QWORD))(v5 + 32))(v9 + v8, v7, v11[0]);
  }
  return v9;
}

uint64_t sub_244E9B82C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  v4 = sub_244EA0F78();
  v3[10] = v4;
  v3[11] = *(_QWORD *)(v4 - 8);
  v3[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244E9B890()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void (*v9)(uint64_t, unint64_t, unint64_t);
  uint64_t (*v10)(_QWORD);

  v1 = (uint64_t *)(*__swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 72) + 16), *(_QWORD *)(*(_QWORD *)(v0 + 72) + 40))+ OBJC_IVAR___QOSConfigInternal_issuesUrl);
  v2 = v1[1];
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 96);
    v4 = *(_QWORD *)(v0 + 64);
    v5 = *(_QWORD *)(v0 + 56);
    v6 = *v1;
    sub_244E8DEF4(*(_QWORD *)(v0 + 72) + 56, v0 + 16);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    swift_bridgeObjectRetain();
    sub_244E9FD90(v5, v6, v2, v4, v3);
    swift_bridgeObjectRelease();
    v10 = (uint64_t (*)(_QWORD))((char *)&dword_257426320 + dword_257426320);
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v7;
    *v7 = v0;
    v7[1] = sub_244E9B9F0;
    return v10(*(_QWORD *)(v0 + 96));
  }
  else
  {
    v9 = *(void (**)(uint64_t, unint64_t, unint64_t))(*(_QWORD *)(v0 + 72) + 96);
    swift_retain();
    v9(1, 0xD000000000000023, 0x8000000244EA4F30);
    swift_release();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_244E9B9F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 96);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  *(_QWORD *)(*(_QWORD *)v1 + 112) = a1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return swift_task_switch();
}

uint64_t sub_244E9BA68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, unint64_t);
  void (*v5)(uint64_t, unint64_t, unint64_t);

  v1 = *(_QWORD *)(v0 + 112);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (!v1)
  {
    v5 = *(void (**)(uint64_t, unint64_t, unint64_t))(*(_QWORD *)(v0 + 72) + 96);
    swift_retain();
    v5(1, 0xD000000000000029, 0x8000000244EA4F60);
    goto LABEL_5;
  }
  v2 = *(_QWORD *)(v0 + 112);
  if (!*(_QWORD *)(v2 + 16))
  {
    v3 = *(_QWORD *)(v0 + 72);
    swift_bridgeObjectRelease();
    v4 = *(void (**)(uint64_t, uint64_t, unint64_t))(v3 + 96);
    swift_retain();
    v4(1, 0x726F727265206F4ELL, 0xEE00646E756F6620);
LABEL_5:
    swift_release();
    v2 = 0;
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_244E9BB40()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MusicIssuesService()
{
  return objc_opt_self();
}

uint64_t sub_244E9BBAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v6;

  *(_QWORD *)(v3 + 16) = a1;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v6;
  *v6 = v3;
  v6[1] = sub_244E9BC10;
  return sub_244E9B82C(a2, a3);
}

uint64_t sub_244E9BC10(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v5;

  v3 = *(_QWORD **)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();
  *v3 = a1;
  return (*(uint64_t (**)(void))(v5 + 8))();
}

unint64_t sub_244E9BC60()
{
  unint64_t result;

  result = qword_257426328;
  if (!qword_257426328)
  {
    result = MEMORY[0x249528E58](&unk_244EA1C58, &type metadata for MusicIssues);
    atomic_store(result, (unint64_t *)&qword_257426328);
  }
  return result;
}

unint64_t sub_244E9BCA4()
{
  unint64_t result;

  result = qword_257426338;
  if (!qword_257426338)
  {
    result = MEMORY[0x249528E58](&unk_244EA3A84, &type metadata for TVIssues);
    atomic_store(result, &qword_257426338);
  }
  return result;
}

uint64_t sub_244E9BCE8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  void (*v17)(_QWORD, unint64_t, unint64_t);
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  char *v41;
  uint64_t v42;
  char *v43;
  unsigned __int8 *v44;
  char v45;
  char v46;
  double v47;
  double v48;
  void (*v50)(_QWORD, unint64_t, unint64_t);
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  unint64_t v57;
  unint64_t v58;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257426368);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v3 - 8) + 64), v3);
  v5 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257425D48);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v6 - 8) + 64), v6);
  v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257425E90);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v9 - 8) + 64), v9);
  v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_244EA10BC();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](*(_QWORD **)(v13 + 64), v12);
  v56 = (char *)&v51 - (((unint64_t)v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15, v14);
  v55 = (char *)&v51 - v16;
  v17 = *(void (**)(_QWORD, unint64_t, unint64_t))(v1 + 96);
  swift_retain();
  v18 = sub_244E81A08(a1, v17);
  swift_release();
  if (!v18)
    goto LABEL_16;
  v53 = v13;
  v54 = v12;
  v19 = objc_msgSend(v18, sel_response);
  objc_opt_self();
  v20 = swift_dynamicCastObjCClass();
  if (!v20)
  {

    v19 = v18;
LABEL_15:

LABEL_16:
    v50 = *(void (**)(_QWORD, unint64_t, unint64_t))(v1 + 96);
    v57 = 0;
    v58 = 0xE000000000000000;
    swift_retain();
    sub_244EA1428();
    swift_bridgeObjectRelease();
    v57 = 0xD000000000000021;
    v58 = 0x8000000244EA5070;
    sub_244EA0F78();
    sub_244E9C510((unint64_t *)&qword_257425D78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB0C0], MEMORY[0x24BDCB0E8]);
    sub_244EA14A0();
    sub_244EA1278();
    swift_bridgeObjectRelease();
    v50(0, v57, v58);
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  v21 = (void *)v20;
  v52 = v5;
  v22 = (void *)sub_244EA11B8();
  v23 = objc_msgSend(v21, sel_valueForHTTPHeaderField_, v22);

  if (!v23)
  {
LABEL_14:

    goto LABEL_15;
  }
  v51 = sub_244EA11C4();
  v25 = v24;

  v19 = objc_msgSend(v18, sel_response);
  objc_opt_self();
  v26 = swift_dynamicCastObjCClass();
  if (!v26)
  {

    swift_bridgeObjectRelease();
    v19 = v18;
    goto LABEL_15;
  }
  v27 = (void *)v26;
  v28 = v25;
  v29 = (void *)sub_244EA11B8();
  v30 = objc_msgSend(v27, sel_valueForHTTPHeaderField_, v29);

  if (!v30)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  sub_244EA11C4();

  v31 = *(id *)(v1 + 128);
  sub_244EA1104();
  sub_244EA10EC();
  v32 = sub_244EA10F8();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v8, 0, 1, v32);
  v33 = sub_244E87DDC(0, (uint64_t)v11, (uint64_t)v8);

  sub_244E8E0B0((uint64_t)v8, &qword_257425D48);
  sub_244E8E0B0((uint64_t)v11, &qword_257425E90);
  v34 = (void *)sub_244EA11B8();
  swift_bridgeObjectRelease();
  v35 = objc_msgSend(v33, sel_dateFromString_, v34);

  v36 = v28;
  if (!v35)
  {
    v38 = (uint64_t)v52;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v53 + 56))(v52, 1, 1, v54);
    goto LABEL_19;
  }
  v37 = v56;
  sub_244EA10A4();

  v38 = (uint64_t)v52;
  v39 = v53;
  v40 = *(void (**)(char *, char *, uint64_t))(v53 + 32);
  v41 = v37;
  v42 = v54;
  v40(v52, v41, v54);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v39 + 56))(v38, 0, 1, v42);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(v38, 1, v42) == 1)
  {
LABEL_19:
    swift_bridgeObjectRelease();

    sub_244E8E0B0(v38, &qword_257426368);
    return 0;
  }
  v43 = v55;
  v40(v55, (char *)v38, v42);
  v44 = sub_244E8298C(v51, v36);
  v46 = v45;
  swift_bridgeObjectRelease();
  if ((v46 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v39 + 8))(v43, v42);

  }
  else
  {
    sub_244EA1080();
    v48 = v47;

    (*(void (**)(char *, uint64_t))(v39 + 8))(v43, v42);
    if (fabs(v48) < (double)(uint64_t)v44)
      return 1;
  }
  return 0;
}

unint64_t sub_244E9C27C(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (result)
  {
    v1 = result;
    v3 = 0;
    MEMORY[0x249528ED0](&v3, 8);
    result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          v3 = 0;
          MEMORY[0x249528ED0](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_244E9C304()
{
  unint64_t result;

  result = qword_2543FFF10;
  if (!qword_2543FFF10)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2543FFF10);
  }
  return result;
}

uint64_t sub_244E9C340()
{
  swift_release();
  return swift_deallocObject();
}

void sub_244E9C364()
{
  uint64_t *v0;

  sub_244E9B150(v0[2], v0[3], v0[4]);
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

unint64_t sub_244E9C388()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2543FFF08;
  if (!qword_2543FFF08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543FFF00);
    result = MEMORY[0x249528E58](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2543FFF08);
  }
  return result;
}

id sub_244E9C3D4(void *a1)
{
  uint64_t v1;

  return sub_244E9C56C(a1, v1);
}

uint64_t sub_244E9C3DC(uint64_t a1)
{
  uint64_t v1;

  return sub_244E9C9C8(a1, v1);
}

uint64_t sub_244E9C3E8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_244E9C424()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v5;
  __int128 v6;

  v5 = *(_OWORD *)(v0 + 48);
  v6 = *(_OWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_244E7DA1C;
  *(_QWORD *)(v3 + 48) = v2;
  *(_OWORD *)(v3 + 16) = v6;
  *(_OWORD *)(v3 + 32) = v5;
  return swift_task_switch();
}

uint64_t sub_244E9C49C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_244E9C4CC()
{
  unint64_t result;

  result = qword_257426360;
  if (!qword_257426360)
  {
    result = MEMORY[0x249528E58](&unk_244EA3FE0, &type metadata for Location);
    atomic_store(result, (unint64_t *)&qword_257426360);
  }
  return result;
}

uint64_t sub_244E9C510(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x249528E58](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

id sub_244E9C56C(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FFBD0);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v4 - 8) + 64), v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_244EA1338();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a2;
  swift_retain();
  sub_244E905EC((uint64_t)v6, (uint64_t)&unk_257426390, (uint64_t)v8);
  swift_release();
  return objc_msgSend(a1, sel_invalidate);
}

uint64_t sub_244E9C644(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  *(_QWORD *)(v4 + 16) = a4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 24) = v5;
  *v5 = v4;
  v5[1] = sub_244E9C690;
  return sub_244E9C6F0();
}

uint64_t sub_244E9C690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;

  v5 = (_QWORD *)*v4;
  v5[4] = a1;
  v5[5] = a2;
  v5[6] = a3;
  v5[7] = a4;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244E9C6F0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[7] = v0;
  v2 = sub_244EA0F78();
  v1[8] = v2;
  v1[9] = *(_QWORD *)(v2 - 8);
  v1[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244E9C750()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void (*v7)(uint64_t, unint64_t, unint64_t);
  uint64_t (*v8)(_QWORD);

  v1 = (uint64_t *)(*__swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 56) + 16), *(_QWORD *)(*(_QWORD *)(v0 + 56) + 40))+ OBJC_IVAR___QOSConfigInternal_locationUrl);
  v2 = v1[1];
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 80);
    v4 = *v1;
    sub_244E8DEF4(*(_QWORD *)(v0 + 56) + 56, v0 + 16);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    swift_bridgeObjectRetain();
    sub_244EA0444(1uLL, v4, v2, v3);
    swift_bridgeObjectRelease();
    v8 = (uint64_t (*)(_QWORD))((char *)&dword_257426358 + dword_257426358);
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v5;
    *v5 = v0;
    v5[1] = sub_244E9C8A8;
    return v8(*(_QWORD *)(v0 + 80));
  }
  else
  {
    v7 = *(void (**)(uint64_t, unint64_t, unint64_t))(*(_QWORD *)(v0 + 56) + 96);
    swift_retain();
    v7(1, 0xD000000000000025, 0x8000000244EA5100);
    swift_release();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v0 + 8))(0, 0, 0, 0);
  }
}

uint64_t sub_244E9C8A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD **)v4;
  v6 = *(_QWORD *)(*(_QWORD *)v4 + 80);
  v7 = *(_QWORD *)(*(_QWORD *)v4 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)v4 + 72);
  v5[12] = a1;
  v5[13] = a2;
  v5[14] = a3;
  v5[15] = a4;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  return swift_task_switch();
}

uint64_t sub_244E9C924()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, unint64_t, unint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 104);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 104);
  }
  else
  {
    v3 = *(void (**)(uint64_t, unint64_t, unint64_t))(*(_QWORD *)(v0 + 56) + 96);
    swift_retain();
    v3(1, 0xD000000000000025, 0x8000000244EA5130);
    swift_release();
    v2 = 0;
  }
  v5 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 120);
  v6 = *(_QWORD *)(v0 + 96);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 8))(v6, v2, v5, v4);
}

uint64_t sub_244E9C9C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[4];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FFBD0);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v3 - 8) + 64), v3);
  v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_244EA1338();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a2;
  v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  swift_retain();
  if (v9 == 1)
  {
    sub_244E91640((uint64_t)v5);
    v10 = 0;
    v11 = 0;
  }
  else
  {
    sub_244EA132C();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
    if (v8[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v10 = sub_244EA1320();
      v11 = v12;
      swift_unknownObjectRelease();
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
  }
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = &unk_257426378;
  *(_QWORD *)(v13 + 24) = v8;
  if (v11 | v10)
  {
    v15[0] = 0;
    v15[1] = 0;
    v15[2] = v10;
    v15[3] = v11;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_244E9CB94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  *(_QWORD *)(v4 + 16) = a4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 24) = v5;
  *v5 = v4;
  v5[1] = sub_244E9CBE0;
  return sub_244E9C6F0();
}

uint64_t sub_244E9CBE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;

  v5 = (_QWORD *)*v4;
  v5[4] = a1;
  v5[5] = a2;
  v5[6] = a3;
  v5[7] = a4;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244E9CC40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 + 112);
  v3 = *(_QWORD *)(v1 + 120);
  v4 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v1 + 112) = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v1 + 128) = v4;
  sub_244E9CCE0(v2, v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244E9CC80()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  sub_244E9CCE0(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LocationService()
{
  return objc_opt_self();
}

uint64_t sub_244E9CCE0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_244E9CD14()
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
  v3[1] = sub_244E7DA1C;
  v3[2] = v2;
  v4 = (_QWORD *)swift_task_alloc();
  v3[3] = v4;
  *v4 = v3;
  v4[1] = sub_244E9CBE0;
  return sub_244E9C6F0();
}

uint64_t sub_244E9CD80()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244E9CDA8()
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
  v3[1] = sub_244E91AF4;
  v3[2] = v2;
  v4 = (_QWORD *)swift_task_alloc();
  v3[3] = v4;
  *v4 = v3;
  v4[1] = sub_244E9C690;
  return sub_244E9C6F0();
}

ValueMetadata *type metadata accessor for TVIssues()
{
  return &type metadata for TVIssues;
}

uint64_t sub_244E9CE28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *i;
  BOOL v5;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    v3 = (_QWORD *)(a1 + 40);
    for (i = (_QWORD *)(a2 + 40); ; i += 23)
    {
      v5 = *(v3 - 1) == *(i - 1) && *v3 == *i;
      if (!v5 && (sub_244EA14AC() & 1) == 0)
        break;
      v3 += 23;
      if (!--v2)
        return 1;
    }
    return 0;
  }
  return 1;
}

uint64_t sub_244E9CEAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __int128 *v3;
  __int128 *v4;
  uint64_t i;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  char v19;
  BOOL v20;
  char v21;
  _OWORD v23[11];
  _OWORD v24[11];
  _BYTE v25[176];
  uint64_t v26;
  _BYTE v27[176];
  __int128 v28;
  __int128 v29;
  _OWORD v30[11];
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  _OWORD v34[11];
  uint64_t v35;
  _OWORD v36[11];
  _OWORD v37[12];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    v3 = (__int128 *)(a1 + 32);
    v4 = (__int128 *)(a2 + 32);
    for (i = v2 - 1; ; --i)
    {
      v6 = v3[11];
      v30[8] = v3[10];
      v30[9] = v6;
      v30[10] = v3[12];
      v31 = *((_QWORD *)v3 + 26);
      v7 = v3[7];
      v30[4] = v3[6];
      v30[5] = v7;
      v8 = v3[9];
      v30[6] = v3[8];
      v30[7] = v8;
      v9 = v3[3];
      v30[0] = v3[2];
      v30[1] = v9;
      v10 = v3[5];
      v30[2] = v3[4];
      v30[3] = v10;
      v11 = v3[1];
      v28 = *v3;
      v29 = v11;
      v12 = v4[11];
      v34[8] = v4[10];
      v34[9] = v12;
      v34[10] = v4[12];
      v35 = *((_QWORD *)v4 + 26);
      v13 = v4[7];
      v34[4] = v4[6];
      v34[5] = v13;
      v14 = v4[9];
      v34[6] = v4[8];
      v34[7] = v14;
      v15 = v4[3];
      v34[0] = v4[2];
      v34[1] = v15;
      v16 = v4[5];
      v34[2] = v4[4];
      v34[3] = v16;
      v17 = v4[1];
      v32 = *v4;
      v33 = v17;
      v18 = BYTE8(v32);
      if ((BYTE8(v28) & 1) != 0)
      {
        if (!BYTE8(v32))
          return 0;
      }
      else
      {
        if (*(double *)&v28 != *(double *)&v32)
          v18 = 1;
        if ((v18 & 1) != 0)
          return 0;
      }
      v19 = BYTE8(v33);
      if ((BYTE8(v29) & 1) != 0)
      {
        if (!BYTE8(v33))
          return 0;
      }
      else
      {
        if (*(double *)&v29 != *(double *)&v33)
          v19 = 1;
        if ((v19 & 1) != 0)
          return 0;
      }
      sub_244E887DC((uint64_t)v30, (uint64_t)v27);
      if (sub_244E88824((uint64_t)v27) == 1)
      {
        sub_244E887DC((uint64_t)v34, (uint64_t)v25);
        if (sub_244E88824((uint64_t)v25) != 1)
          goto LABEL_26;
        sub_244E8A1D0((uint64_t *)&v28);
        sub_244E8A1D0((uint64_t *)&v32);
      }
      else
      {
        sub_244E887DC((uint64_t)v34, (uint64_t)v25);
        if (sub_244E88824((uint64_t)v25) == 1)
        {
LABEL_26:
          sub_244E887DC((uint64_t)v30, (uint64_t)v25);
          sub_244E887DC((uint64_t)v34, (uint64_t)&v26);
          sub_244E88AEC((uint64_t *)v30, (void (*)(uint64_t, uint64_t))sub_244E85B9C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E85858, (void (*)(uint64_t))sub_244E88840, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E8593C);
          sub_244E88AEC((uint64_t *)v34, (void (*)(uint64_t, uint64_t))sub_244E85B9C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E85858, (void (*)(uint64_t))sub_244E88840, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E8593C);
          sub_244E88850((uint64_t)v25);
          return 0;
        }
        sub_244E887DC((uint64_t)v30, (uint64_t)v23);
        v36[8] = v23[8];
        v36[9] = v23[9];
        v36[10] = v23[10];
        v36[4] = v23[4];
        v36[5] = v23[5];
        v36[7] = v23[7];
        v36[6] = v23[6];
        v36[0] = v23[0];
        v36[1] = v23[1];
        v36[3] = v23[3];
        v36[2] = v23[2];
        sub_244E887DC((uint64_t)v34, (uint64_t)v24);
        v37[8] = v24[8];
        v37[9] = v24[9];
        v37[10] = v24[10];
        v37[4] = v24[4];
        v37[5] = v24[5];
        v37[7] = v24[7];
        v37[6] = v24[6];
        v37[0] = v24[0];
        v37[1] = v24[1];
        v37[3] = v24[3];
        v37[2] = v24[2];
        sub_244E8A1D0((uint64_t *)&v28);
        sub_244E8A1D0((uint64_t *)&v32);
        sub_244E88AEC((uint64_t *)v30, (void (*)(uint64_t, uint64_t))sub_244E85B9C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E85858, (void (*)(uint64_t))sub_244E88840, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E8593C);
        sub_244E88AEC((uint64_t *)v34, (void (*)(uint64_t, uint64_t))sub_244E85B9C, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E85858, (void (*)(uint64_t))sub_244E88840, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E8593C);
        v20 = sub_244E8529C(v36, v37);
        sub_244E88AEC((uint64_t *)v34, (void (*)(uint64_t, uint64_t))sub_244E85BD0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E858CC, (void (*)(uint64_t))sub_244E88ADC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E85ACC);
        sub_244E88AEC((uint64_t *)v30, (void (*)(uint64_t, uint64_t))sub_244E85BD0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E858CC, (void (*)(uint64_t))sub_244E88ADC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_244E85ACC);
        if (!v20)
        {
          sub_244E8A264((uint64_t *)&v32);
          sub_244E8A264((uint64_t *)&v28);
          return 0;
        }
      }
      v21 = sub_244E9D368(v31, v35);
      sub_244E8A264((uint64_t *)&v32);
      sub_244E8A264((uint64_t *)&v28);
      if ((v21 & 1) == 0)
        return 0;
      if (!i)
        return 1;
      v4 = (__int128 *)((char *)v4 + 216);
      v3 = (__int128 *)((char *)v3 + 216);
    }
  }
  return 1;
}

uint64_t sub_244E9D2A4(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  BOOL v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *i;
  BOOL v11;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_244EA14AC(), result = 0, (v6 & 1) != 0))
  {
    v8 = v2 - 1;
    if (!v8)
      return 1;
    v9 = a2 + 7;
    for (i = a1 + 7; ; i += 2)
    {
      v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (sub_244EA14AC() & 1) == 0)
        break;
      v9 += 2;
      if (!--v8)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_244E9D368(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    for (i = 0; ; i += 56)
    {
      v5 = *(_QWORD *)(a1 + i + 48);
      v6 = *(_QWORD *)(a1 + i + 56);
      v7 = *(unsigned __int8 *)(a1 + i + 64);
      v8 = *(_QWORD *)(a1 + i + 80);
      v9 = *(_QWORD *)(a2 + i + 48);
      v17 = *(_QWORD *)(a2 + i + 56);
      v10 = *(unsigned __int8 *)(a2 + i + 64);
      v11 = *(_QWORD *)(a2 + i + 80);
      v15 = *(_QWORD *)(a2 + i + 72);
      v16 = *(_QWORD *)(a1 + i + 72);
      if ((*(_QWORD *)(a1 + i + 32) != *(_QWORD *)(a2 + i + 32) || *(_QWORD *)(a1 + i + 40) != *(_QWORD *)(a2 + i + 40))
        && (sub_244EA14AC() & 1) == 0)
      {
        break;
      }
      if ((v5 != v9 || v6 != v17) && (sub_244EA14AC() & 1) == 0)
        break;
      if ((_DWORD)v7 != 5)
      {
        if (v10 != 5)
          __asm { BR              X8 }
        return 0;
      }
      if (v10 != 5)
        return 0;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v16 == v15 && v8 == v11)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v4 = sub_244EA14AC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
          return 0;
      }
      if (!--v2)
        return 1;
    }
    return 0;
  }
  return 1;
}

uint64_t sub_244E9D750(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v12[11];
  uint64_t v13;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_244EA150C();
  if (v3)
  {
    swift_bridgeObjectRetain();
    v5 = v3 - 1;
    for (i = 32; ; i += 184)
    {
      v7 = *(_OWORD *)(a2 + i + 144);
      v12[8] = *(_OWORD *)(a2 + i + 128);
      v12[9] = v7;
      v12[10] = *(_OWORD *)(a2 + i + 160);
      v13 = *(_QWORD *)(a2 + i + 176);
      v8 = *(_OWORD *)(a2 + i + 80);
      v12[4] = *(_OWORD *)(a2 + i + 64);
      v12[5] = v8;
      v9 = *(_OWORD *)(a2 + i + 112);
      v12[6] = *(_OWORD *)(a2 + i + 96);
      v12[7] = v9;
      v10 = *(_OWORD *)(a2 + i + 16);
      v12[0] = *(_OWORD *)(a2 + i);
      v12[1] = v10;
      v11 = *(_OWORD *)(a2 + i + 48);
      v12[2] = *(_OWORD *)(a2 + i + 32);
      v12[3] = v11;
      sub_244E99620((uint64_t)v12);
      sub_244EA1230();
      sub_244EA1230();
      sub_244E99724((uint64_t)v12);
      if (!v5)
        break;
      --v5;
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_244E9D844(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v11[11];
  uint64_t v12;

  sub_244EA1500();
  v2 = *(_QWORD *)(a1 + 16);
  sub_244EA150C();
  if (v2)
  {
    swift_bridgeObjectRetain();
    v3 = v2 - 1;
    for (i = 32; ; i += 184)
    {
      v5 = *(_OWORD *)(a1 + i + 144);
      v11[8] = *(_OWORD *)(a1 + i + 128);
      v11[9] = v5;
      v11[10] = *(_OWORD *)(a1 + i + 160);
      v12 = *(_QWORD *)(a1 + i + 176);
      v6 = *(_OWORD *)(a1 + i + 80);
      v11[4] = *(_OWORD *)(a1 + i + 64);
      v11[5] = v6;
      v7 = *(_OWORD *)(a1 + i + 112);
      v11[6] = *(_OWORD *)(a1 + i + 96);
      v11[7] = v7;
      v8 = *(_OWORD *)(a1 + i + 16);
      v11[0] = *(_OWORD *)(a1 + i);
      v11[1] = v8;
      v9 = *(_OWORD *)(a1 + i + 48);
      v11[2] = *(_OWORD *)(a1 + i + 32);
      v11[3] = v9;
      sub_244E99620((uint64_t)v11);
      sub_244EA1230();
      sub_244EA1230();
      sub_244E99724((uint64_t)v11);
      if (!v3)
        break;
      --v3;
    }
    swift_bridgeObjectRelease();
  }
  return sub_244EA1518();
}

_QWORD *sub_244E9D944@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_244E9DBC0(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_244E9D96C()
{
  uint64_t *v0;

  return sub_244E9D844(*v0);
}

uint64_t sub_244E9D974(uint64_t a1)
{
  uint64_t *v1;

  return sub_244E9D750(a1, *v1);
}

uint64_t sub_244E9D97C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v15[11];
  uint64_t v16;

  v1 = *v0;
  sub_244EA1500();
  v2 = *(_QWORD *)(v1 + 16);
  sub_244EA150C();
  if (v2)
  {
    swift_bridgeObjectRetain();
    v3 = v2 - 1;
    for (i = 32; ; i += 184)
    {
      v5 = *(_OWORD *)(v1 + i);
      v6 = *(_OWORD *)(v1 + i + 16);
      v7 = *(_OWORD *)(v1 + i + 48);
      v15[2] = *(_OWORD *)(v1 + i + 32);
      v15[3] = v7;
      v15[0] = v5;
      v15[1] = v6;
      v8 = *(_OWORD *)(v1 + i + 64);
      v9 = *(_OWORD *)(v1 + i + 80);
      v10 = *(_OWORD *)(v1 + i + 112);
      v15[6] = *(_OWORD *)(v1 + i + 96);
      v15[7] = v10;
      v15[4] = v8;
      v15[5] = v9;
      v11 = *(_OWORD *)(v1 + i + 128);
      v12 = *(_OWORD *)(v1 + i + 144);
      v13 = *(_OWORD *)(v1 + i + 160);
      v16 = *(_QWORD *)(v1 + i + 176);
      v15[9] = v12;
      v15[10] = v13;
      v15[8] = v11;
      sub_244E99620((uint64_t)v15);
      sub_244EA1230();
      sub_244EA1230();
      sub_244E99724((uint64_t)v15);
      if (!v3)
        break;
      --v3;
    }
    swift_bridgeObjectRelease();
  }
  return sub_244EA1518();
}

uint64_t sub_244E9DA78(uint64_t *a1, uint64_t *a2)
{
  return sub_244E9CE28(*a1, *a2);
}

unint64_t sub_244E9DA88()
{
  unint64_t result;

  result = qword_257426398;
  if (!qword_257426398)
  {
    result = MEMORY[0x249528E58](&unk_244EA3A1C, &type metadata for TVIssues);
    atomic_store(result, (unint64_t *)&qword_257426398);
  }
  return result;
}

uint64_t sub_244E9DACC@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_244EA147C();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_244E9DB1C@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_244EA147C();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_244E9DB70()
{
  sub_244E9DD04();
  return sub_244EA1530();
}

uint64_t sub_244E9DB98()
{
  sub_244E9DD04();
  return sub_244EA153C();
}

_QWORD *sub_244E9DBC0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574263A0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(v4 + 64), v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244E9DD04();
  sub_244EA1524();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574263B0);
    sub_244E9DD48();
    sub_244EA1494();
    v7 = (_QWORD *)v9[1];
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7;
}

unint64_t sub_244E9DD04()
{
  unint64_t result;

  result = qword_2574263A8;
  if (!qword_2574263A8)
  {
    result = MEMORY[0x249528E58](&unk_244EA3BA8, &type metadata for TVIssues.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574263A8);
  }
  return result;
}

unint64_t sub_244E9DD48()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2574263B8;
  if (!qword_2574263B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2574263B0);
    v2 = sub_244E9DDAC();
    result = MEMORY[0x249528E58](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2574263B8);
  }
  return result;
}

unint64_t sub_244E9DDAC()
{
  unint64_t result;

  result = qword_2574263C0;
  if (!qword_2574263C0)
  {
    result = MEMORY[0x249528E58](&unk_244EA21C4, &type metadata for TVIssue);
    atomic_store(result, (unint64_t *)&qword_2574263C0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TVIssues.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_244E9DE30 + 4 * byte_244EA39FE[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_244E9DE50 + 4 * byte_244EA3A03[v4]))();
}

_BYTE *sub_244E9DE30(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_244E9DE50(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244E9DE58(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244E9DE60(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244E9DE68(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244E9DE70(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for TVIssues.CodingKeys()
{
  return &type metadata for TVIssues.CodingKeys;
}

unint64_t sub_244E9DE90()
{
  unint64_t result;

  result = qword_2574263C8;
  if (!qword_2574263C8)
  {
    result = MEMORY[0x249528E58](&unk_244EA3B80, &type metadata for TVIssues.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574263C8);
  }
  return result;
}

unint64_t sub_244E9DED8()
{
  unint64_t result;

  result = qword_2574263D0;
  if (!qword_2574263D0)
  {
    result = MEMORY[0x249528E58](&unk_244EA3AB8, &type metadata for TVIssues.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574263D0);
  }
  return result;
}

unint64_t sub_244E9DF20()
{
  unint64_t result;

  result = qword_2574263D8;
  if (!qword_2574263D8)
  {
    result = MEMORY[0x249528E58](&unk_244EA3AE0, &type metadata for TVIssues.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574263D8);
  }
  return result;
}

void sub_244E9DF64(char a1)
{
  sub_244EA1500();
  __asm { BR              X10 }
}

uint64_t sub_244E9DFBC()
{
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

void sub_244E9E068(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_244E9E0B0()
{
  sub_244EA1230();
  return swift_bridgeObjectRelease();
}

void sub_244E9E18C(uint64_t a1, char a2)
{
  sub_244EA1500();
  __asm { BR              X10 }
}

uint64_t sub_244E9E1E0()
{
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

void sub_244E9E2D0(uint64_t a1, char a2)
{
  sub_244EA1500();
  __asm { BR              X10 }
}

uint64_t sub_244E9E324()
{
  sub_244EA1230();
  swift_bridgeObjectRelease();
  return sub_244EA1518();
}

double sub_244E9E3D0@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;

  sub_244E9EB30(a1, v6);
  if (!v2)
  {
    v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_244E9E410(_OWORD *a1, __int128 *a2)
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
  return sub_244E9E784((uint64_t)v7, (uint64_t)v8) & 1;
}

void sub_244E9E454(char *a1)
{
  sub_244E8A6D4(*a1);
}

void sub_244E9E460()
{
  char *v0;

  sub_244E9DF64(*v0);
}

void sub_244E9E468()
{
  __asm { BR              X10 }
}

uint64_t sub_244E9E4AC()
{
  sub_244EA1230();
  return swift_bridgeObjectRelease();
}

void sub_244E9E544(uint64_t a1)
{
  char *v1;

  sub_244E9E2D0(a1, *v1);
}

uint64_t sub_244E9E54C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244E9F00C();
  *a1 = result;
  return result;
}

uint64_t sub_244E9E578()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_244E9E5B0 + 4 * byte_244EA3C22[*v0]))();
}

void sub_244E9E5B0(_QWORD *a1@<X8>)
{
  *a1 = 0x614E656369766564;
  a1[1] = 0xEA0000000000656DLL;
}

void sub_244E9E5D0(_QWORD *a1@<X8>)
{
  *a1 = 0x6F4D656369766564;
  a1[1] = 0xEB000000006C6564;
}

void sub_244E9E5F4(_QWORD *a1@<X8>)
{
  *a1 = 0x6973726556707061;
  a1[1] = 0xEA00000000006E6FLL;
}

void sub_244E9E618(_QWORD *a1@<X8>)
{
  *a1 = 0x6F6973726556736FLL;
  a1[1] = 0xE90000000000006ELL;
}

void sub_244E9E638(_QWORD *a1@<X8>)
{
  *a1 = 29551;
  a1[1] = 0xE200000000000000;
}

uint64_t sub_244E9E648()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244E9E680 + 4 * byte_244EA3C28[*v0]))(0x6146656369766564, 0xEC000000796C696DLL);
}

uint64_t sub_244E9E680()
{
  return 0x614E656369766564;
}

uint64_t sub_244E9E69C()
{
  return 0x6F4D656369766564;
}

uint64_t sub_244E9E6BC()
{
  return 0x6973726556707061;
}

uint64_t sub_244E9E6DC()
{
  return 0x6F6973726556736FLL;
}

uint64_t sub_244E9E6F8()
{
  return 29551;
}

uint64_t sub_244E9E704@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244E9F00C();
  *a1 = result;
  return result;
}

void sub_244E9E728(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_244E9E734()
{
  sub_244E9EE24();
  return sub_244EA1530();
}

uint64_t sub_244E9E75C()
{
  sub_244E9EE24();
  return sub_244EA153C();
}

uint64_t sub_244E9E784(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;

  v4 = *(_QWORD **)a1;
  v5 = *(_QWORD **)a2;
  if (v4)
  {
    if (!v5 || (sub_244E9D2A4(v4, v5) & 1) == 0)
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  v6 = *(_QWORD **)(a1 + 8);
  v7 = *(_QWORD **)(a2 + 8);
  if (v6)
  {
    if (!v7 || (sub_244E9D2A4(v6, v7) & 1) == 0)
      return 0;
  }
  else if (v7)
  {
    return 0;
  }
  v8 = *(_QWORD **)(a1 + 16);
  v9 = *(_QWORD **)(a2 + 16);
  if (v8)
  {
    if (!v9 || (sub_244E9D2A4(v8, v9) & 1) == 0)
      return 0;
  }
  else if (v9)
  {
    return 0;
  }
  v10 = *(_QWORD **)(a1 + 24);
  v11 = *(_QWORD **)(a2 + 24);
  if (v10)
  {
    if (!v11 || (sub_244E9D2A4(v10, v11) & 1) == 0)
      return 0;
  }
  else if (v11)
  {
    return 0;
  }
  v12 = *(_QWORD **)(a1 + 32);
  v13 = *(_QWORD **)(a2 + 32);
  if (v12)
  {
    if (!v13 || (sub_244E9D2A4(v12, v13) & 1) == 0)
      return 0;
  }
  else if (v13)
  {
    return 0;
  }
  v14 = *(_QWORD **)(a1 + 40);
  v15 = *(_QWORD **)(a2 + 40);
  if (v14)
  {
    if (v15 && (sub_244E9D2A4(v14, v15) & 1) != 0)
      return 1;
  }
  else if (!v15)
  {
    return 1;
  }
  return 0;
}

uint64_t destroy for MusicDeviceCriteria()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for MusicDeviceCriteria(_QWORD *a1, _QWORD *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for MusicDeviceCriteria(_QWORD *a1, _QWORD *a2)
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
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
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

_OWORD *assignWithTake for MusicDeviceCriteria(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MusicDeviceCriteria(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 48))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MusicDeviceCriteria(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicDeviceCriteria()
{
  return &type metadata for MusicDeviceCriteria;
}

uint64_t sub_244E9EB30@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
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
  uint64_t v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574263E0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(v6 + 64), v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244E9EE24();
  sub_244EA1524();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257425DC0);
  v19 = 2;
  sub_244E840DC();
  sub_244EA1494();
  v17 = v20;
  v19 = 0;
  sub_244EA1494();
  v16 = v20;
  v19 = 1;
  sub_244EA1494();
  v15 = v20;
  v19 = 3;
  sub_244EA1494();
  v14 = v20;
  v18 = v6;
  v19 = 4;
  sub_244EA1494();
  v10 = v20;
  v19 = 5;
  sub_244EA1494();
  v11 = v20;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v5);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v12 = v15;
  *a2 = v16;
  a2[1] = v12;
  v13 = v14;
  a2[2] = v17;
  a2[3] = v13;
  a2[4] = v10;
  a2[5] = v11;
  return result;
}

unint64_t sub_244E9EE24()
{
  unint64_t result;

  result = qword_2574263E8;
  if (!qword_2574263E8)
  {
    result = MEMORY[0x249528E58](&unk_244EA3DB0, &type metadata for MusicDeviceCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574263E8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for MusicDeviceCriteria.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244E9EEB4 + 4 * byte_244EA3C33[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_244E9EEE8 + 4 * byte_244EA3C2E[v4]))();
}

uint64_t sub_244E9EEE8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E9EEF0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244E9EEF8);
  return result;
}

uint64_t sub_244E9EF04(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244E9EF0CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_244E9EF10(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E9EF18(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MusicDeviceCriteria.CodingKeys()
{
  return &type metadata for MusicDeviceCriteria.CodingKeys;
}

unint64_t sub_244E9EF38()
{
  unint64_t result;

  result = qword_2574263F0;
  if (!qword_2574263F0)
  {
    result = MEMORY[0x249528E58](&unk_244EA3D88, &type metadata for MusicDeviceCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574263F0);
  }
  return result;
}

unint64_t sub_244E9EF80()
{
  unint64_t result;

  result = qword_2574263F8;
  if (!qword_2574263F8)
  {
    result = MEMORY[0x249528E58](&unk_244EA3CC0, &type metadata for MusicDeviceCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574263F8);
  }
  return result;
}

unint64_t sub_244E9EFC8()
{
  unint64_t result;

  result = qword_257426400;
  if (!qword_257426400)
  {
    result = MEMORY[0x249528E58](&unk_244EA3CE8, &type metadata for MusicDeviceCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426400);
  }
  return result;
}

uint64_t sub_244E9F00C()
{
  unint64_t v0;

  v0 = sub_244EA147C();
  swift_bridgeObjectRelease();
  if (v0 >= 6)
    return 6;
  else
    return v0;
}

_QWORD *initializeBufferWithCopyOfBuffer for MiscCriteria(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for MiscCriteria()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for MiscCriteria(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *assignWithTake for MiscCriteria(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MiscCriteria(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MiscCriteria(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for MiscCriteria()
{
  return &type metadata for MiscCriteria;
}

_QWORD *sub_244E9F1B8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_244E9F40C(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_244E9F1E0(_QWORD **a1, _QWORD **a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = *a2;
  if (v2)
  {
    if (v3 && (sub_244E9D2A4(v2, v3) & 1) != 0)
      return 1;
  }
  else if (!v3)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_244E9F21C()
{
  sub_244EA1500();
  sub_244EA1230();
  return sub_244EA1518();
}

uint64_t sub_244E9F270()
{
  return sub_244EA1230();
}

uint64_t sub_244E9F28C()
{
  sub_244EA1500();
  sub_244EA1230();
  return sub_244EA1518();
}

uint64_t sub_244E9F2DC@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_244EA147C();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_244E9F32C(_QWORD *a1@<X8>)
{
  *a1 = 0x646F43726F727265;
  a1[1] = 0xEA00000000007365;
}

uint64_t sub_244E9F34C()
{
  return 0x646F43726F727265;
}

uint64_t sub_244E9F368@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_244EA147C();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_244E9F3BC()
{
  sub_244E9F550();
  return sub_244EA1530();
}

uint64_t sub_244E9F3E4()
{
  sub_244E9F550();
  return sub_244EA153C();
}

_QWORD *sub_244E9F40C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257426408);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(v4 + 64), v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244E9F550();
  sub_244EA1524();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257425DC0);
    sub_244E840DC();
    sub_244EA1494();
    v7 = (_QWORD *)v9[1];
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7;
}

unint64_t sub_244E9F550()
{
  unint64_t result;

  result = qword_257426410;
  if (!qword_257426410)
  {
    result = MEMORY[0x249528E58](&unk_244EA3F70, &type metadata for MiscCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426410);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for MiscCriteria.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_244E9F5D4 + 4 * byte_244EA3E00[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_244E9F5F4 + 4 * byte_244EA3E05[v4]))();
}

_BYTE *sub_244E9F5D4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_244E9F5F4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244E9F5FC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244E9F604(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244E9F60C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244E9F614(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for MiscCriteria.CodingKeys()
{
  return &type metadata for MiscCriteria.CodingKeys;
}

unint64_t sub_244E9F634()
{
  unint64_t result;

  result = qword_257426418;
  if (!qword_257426418)
  {
    result = MEMORY[0x249528E58](&unk_244EA3F48, &type metadata for MiscCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426418);
  }
  return result;
}

unint64_t sub_244E9F67C()
{
  unint64_t result;

  result = qword_257426420;
  if (!qword_257426420)
  {
    result = MEMORY[0x249528E58](&unk_244EA3E80, &type metadata for MiscCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426420);
  }
  return result;
}

unint64_t sub_244E9F6C4()
{
  unint64_t result;

  result = qword_257426428;
  if (!qword_257426428)
  {
    result = MEMORY[0x249528E58](&unk_244EA3EA8, &type metadata for MiscCriteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426428);
  }
  return result;
}

uint64_t destroy for Location()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for Location(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for Location(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_QWORD *assignWithTake for Location(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Location(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Location(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Location()
{
  return &type metadata for Location;
}

uint64_t sub_244E9F8C4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_244E9F9FC(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_244E9F8F0@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_244EA147C();
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

uint64_t sub_244E9F94C@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_244EA147C();
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

uint64_t sub_244E9F9AC()
{
  sub_244E9FBA8();
  return sub_244EA1530();
}

uint64_t sub_244E9F9D4()
{
  sub_244E9FBA8();
  return sub_244EA153C();
}

uint64_t sub_244E9F9FC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  char v10;
  char v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257426430);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(v4 + 64), v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244E9FBA8();
  sub_244EA1524();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v11 = 0;
    v7 = sub_244EA1488();
    v10 = 1;
    swift_bridgeObjectRetain();
    sub_244EA1488();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_244E9FBA8()
{
  unint64_t result;

  result = qword_257426438;
  if (!qword_257426438)
  {
    result = MEMORY[0x249528E58](&unk_244EA4104, &type metadata for Location.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426438);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for Location.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244E9FC38 + 4 * byte_244EA3FC5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_244E9FC6C + 4 * byte_244EA3FC0[v4]))();
}

uint64_t sub_244E9FC6C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E9FC74(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244E9FC7CLL);
  return result;
}

uint64_t sub_244E9FC88(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244E9FC90);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_244E9FC94(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244E9FC9C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Location.CodingKeys()
{
  return &type metadata for Location.CodingKeys;
}

unint64_t sub_244E9FCBC()
{
  unint64_t result;

  result = qword_257426440;
  if (!qword_257426440)
  {
    result = MEMORY[0x249528E58](&unk_244EA40DC, &type metadata for Location.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426440);
  }
  return result;
}

unint64_t sub_244E9FD04()
{
  unint64_t result;

  result = qword_257426448;
  if (!qword_257426448)
  {
    result = MEMORY[0x249528E58](&unk_244EA4014, &type metadata for Location.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426448);
  }
  return result;
}

unint64_t sub_244E9FD4C()
{
  unint64_t result;

  result = qword_257426450;
  if (!qword_257426450)
  {
    result = MEMORY[0x249528E58](&unk_244EA403C, &type metadata for Location.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257426450);
  }
  return result;
}

uint64_t sub_244E9FD90@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  size_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t result;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;

  v42 = a4;
  v43 = a2;
  v49 = a3;
  v40 = a5;
  v6 = sub_244EA0F78();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(v7 + 64), v6);
  v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257426458);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v10 - 8) + 64), v10);
  v41 = (uint64_t)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_244EA1050();
  v44 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](*(_QWORD **)(v44 + 64), v12);
  v37 = (char *)&v37 - (((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14, v13);
  v38 = (char *)&v37 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257426460);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v16 - 8) + 64), v16);
  v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257426280);
  sub_244EA0FE4();
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_244EA4160;
  v47 = v7;
  v48 = v6;
  v39 = v9;
  v45 = v12;
  v46 = v18;
  if (a1 <= 1)
  {
    swift_bridgeObjectRetain();
    sub_244EA0FD8();
    swift_bridgeObjectRelease();
    sub_244E92B50();
    sub_244EA0FD8();
    swift_bridgeObjectRelease();
    v20 = (void *)objc_opt_self();
    v21 = objc_msgSend(v20, sel_currentDevice);
    v22 = objc_msgSend(v21, sel_model);

    sub_244EA11C4();
    sub_244EA0FD8();
    swift_bridgeObjectRelease();
    v23 = objc_msgSend(v20, sel_currentDevice);
    v24 = objc_msgSend(v23, sel_systemName);

    sub_244EA11C4();
    sub_244EA0FD8();
    swift_bridgeObjectRelease();
    v25 = objc_msgSend(v20, sel_currentDevice);
    v26 = objc_msgSend(v25, sel_systemVersion);

    sub_244EA11C4();
    sub_244EA0FD8();
    swift_bridgeObjectRelease();
    v50 = v19;
    v27 = swift_bridgeObjectRetain();
    sub_244EA0304(v27);
    a1 = v50;
    v28 = v41;
    sub_244E92824(v41);
    v30 = v44;
    v29 = v45;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v44 + 48))(v28, 1, v45) == 1)
    {
      sub_244EA0404(v28);
      v32 = v46;
      v31 = v47;
      v33 = v48;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v47 + 56))(v46, 1, 1, v48);
    }
    else
    {
      v34 = v38;
      (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))(v38, v28, v29);
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v37, v34, v29);
      v35 = v39;
      sub_244EA0F6C();
      sub_244EA0F54();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v34, v29);
      v32 = v46;
      v31 = v47;
      v33 = v48;
      (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v46, v35, v48);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v32, 0, 1, v33);
      (*(void (**)(char *, uint64_t))(v31 + 8))(v35, v33);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v32, 1, v33) != 1)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v31 + 32))(v40, v32, v33);
    __break(1u);
  }
  v50 = a1;
  swift_bridgeObjectRetain();
  result = sub_244EA14B8();
  __break(1u);
  return result;
}

size_t sub_244EA0304(size_t result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  int64_t v11;

  v2 = *(_QWORD *)(result + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(v6 + 16))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v11 = v4 + v2;
  else
    v11 = v4;
  result = sub_244E986AC(result, v11, 1, v3);
  v3 = (_QWORD *)result;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  v7 = (v3[3] >> 1) - v3[2];
  result = sub_244EA0FE4();
  if (v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v8 = v3[2];
  v9 = __OFADD__(v8, v2);
  v10 = v8 + v2;
  if (!v9)
  {
    v3[2] = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_244EA0404(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257426458);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_244EA0444@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t result;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;

  v29 = a3;
  v26 = a4;
  v27 = a2;
  v5 = sub_244EA0F78();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(v6 + 64), v5);
  v25 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257426458);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v8 - 8) + 64), v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_244EA1050();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](*(_QWORD **)(v12 + 64), v11);
  v23 = (char *)&v23 - (((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14, v13);
  v24 = (char *)&v23 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257426460);
  MEMORY[0x24BDAC7A8](*(_QWORD **)(*(_QWORD *)(v16 - 8) + 64), v16);
  v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257426280);
  sub_244EA0FE4();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_244EA2F60;
  v28 = v5;
  if (a1)
  {
    if (a1 != 1)
      goto LABEL_11;
    a1 = 0xE500000000000000;
  }
  else
  {
    a1 = 0xE200000000000000;
  }
  swift_bridgeObjectRetain();
  sub_244EA0FD8();
  swift_bridgeObjectRelease();
  sub_244E92824((uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_244EA0404((uint64_t)v10);
    v19 = v28;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v18, 1, 1, v28);
  }
  else
  {
    v20 = v24;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v24, v10, v11);
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v23, v20, v11);
    v21 = v25;
    sub_244EA0F6C();
    sub_244EA0F54();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v20, v11);
    v19 = v28;
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v18, v21, v28);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v18, 0, 1, v19);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v21, v19);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v18, 1, v19) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(v26, v18, v19);
  __break(1u);
LABEL_11:
  v30 = a1;
  swift_bridgeObjectRetain();
  result = sub_244EA14B8();
  __break(1u);
  return result;
}

uint64_t sub_244EA07BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_244EA07D4()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 16) + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 40));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_244EA082C;
  return sub_244E8470C();
}

uint64_t sub_244EA082C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_244EA0874(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  v4 = sub_244EA0F78();
  v3[10] = v4;
  v3[11] = *(_QWORD *)(v4 - 8);
  v3[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244EA08D8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void (*v12)(uint64_t, unint64_t, unint64_t);
  uint64_t (*v13)(_QWORD);

  v1 = *(_QWORD **)(v0 + 72);
  v2 = v1[15];
  *(_QWORD *)(v0 + 104) = v2;
  if (v2)
  {
    swift_retain();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v3;
    *v3 = v0;
    v3[1] = sub_244EA0ABC;
    return sub_244EA1344();
  }
  else
  {
    v5 = (uint64_t *)(*__swift_project_boxed_opaque_existential_1(v1 + 2, v1[5]) + OBJC_IVAR___QOSConfigInternal_issuesUrl);
    v6 = v5[1];
    if (v6)
    {
      v7 = *(_QWORD *)(v0 + 96);
      v8 = *(_QWORD *)(v0 + 64);
      v9 = *(_QWORD *)(v0 + 56);
      v10 = *v5;
      sub_244E8DEF4(*(_QWORD *)(v0 + 72) + 56, v0 + 16);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
      swift_bridgeObjectRetain();
      sub_244E9FD90(v9, v10, v6, v8, v7);
      swift_bridgeObjectRelease();
      v13 = (uint64_t (*)(_QWORD))((char *)&dword_257426330 + dword_257426330);
      v11 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 120) = v11;
      *v11 = v0;
      v11[1] = sub_244EA0CAC;
      return v13(*(_QWORD *)(v0 + 96));
    }
    else
    {
      v12 = *(void (**)(uint64_t, unint64_t, unint64_t))(*(_QWORD *)(v0 + 72) + 96);
      swift_retain();
      v12(1, 0xD000000000000023, 0x8000000244EA4F30);
      swift_release();
      swift_task_dealloc();
      return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
    }
  }
}

uint64_t sub_244EA0ABC()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_244EA0B18()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void (*v9)(uint64_t, unint64_t, unint64_t);
  uint64_t (*v10)(_QWORD);

  if ((*(_BYTE *)(v0 + 136) & 1) != 0)
    return swift_willThrowTypedImpl();
  v2 = (uint64_t *)(*__swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 72) + 16), *(_QWORD *)(*(_QWORD *)(v0 + 72) + 40))+ OBJC_IVAR___QOSConfigInternal_issuesUrl);
  v3 = v2[1];
  if (v3)
  {
    v4 = *(_QWORD *)(v0 + 96);
    v5 = *(_QWORD *)(v0 + 64);
    v6 = *(_QWORD *)(v0 + 56);
    v7 = *v2;
    sub_244E8DEF4(*(_QWORD *)(v0 + 72) + 56, v0 + 16);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    swift_bridgeObjectRetain();
    sub_244E9FD90(v6, v7, v3, v5, v4);
    swift_bridgeObjectRelease();
    v10 = (uint64_t (*)(_QWORD))((char *)&dword_257426330 + dword_257426330);
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 120) = v8;
    *v8 = v0;
    v8[1] = sub_244EA0CAC;
    return v10(*(_QWORD *)(v0 + 96));
  }
  else
  {
    v9 = *(void (**)(uint64_t, unint64_t, unint64_t))(*(_QWORD *)(v0 + 72) + 96);
    swift_retain();
    v9(1, 0xD000000000000023, 0x8000000244EA4F30);
    swift_release();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_244EA0CAC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 96);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  *(_QWORD *)(*(_QWORD *)v1 + 128) = a1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch();
}

uint64_t sub_244EA0D28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  void (*v5)(uint64_t, unint64_t, unint64_t);

  v1 = *(_QWORD *)(v0 + 128);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (!v1)
  {
    v4 = 0x8000000244EA4F60;
    v3 = 0xD000000000000029;
    goto LABEL_5;
  }
  v2 = *(_QWORD *)(v0 + 128);
  if (!*(_QWORD *)(v2 + 16))
  {
    swift_bridgeObjectRelease();
    v3 = 0x726F727265206F4ELL;
    v4 = 0xEE00646E756F6620;
LABEL_5:
    v5 = *(void (**)(uint64_t, unint64_t, unint64_t))(*(_QWORD *)(v0 + 72) + 96);
    swift_retain();
    v5(1, v3, v4);
    swift_release();
    v2 = 0;
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_244EA0DF4()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TVIssuesService()
{
  return objc_opt_self();
}

uint64_t sub_244EA0E58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v6;

  *(_QWORD *)(v3 + 16) = a1;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v6;
  *v6 = v3;
  v6[1] = sub_244E9BC10;
  return sub_244EA0874(a2, a3);
}

void sub_244EA0EBC()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)sub_244EA11B8();
  v1 = (void *)objc_opt_self();
  v2 = objc_msgSend(v1, sel_bundleWithIdentifier_, v0);

  if (!v2)
    v2 = objc_msgSend(v1, sel_mainBundle);
  qword_25742AC00 = (uint64_t)v2;
}

uint64_t sub_244EA0F54()
{
  return MEMORY[0x24BDCAFF8]();
}

uint64_t sub_244EA0F60()
{
  return MEMORY[0x24BDCB030]();
}

uint64_t sub_244EA0F6C()
{
  return MEMORY[0x24BDCB070]();
}

uint64_t sub_244EA0F78()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_244EA0F84()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_244EA0F90()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_244EA0F9C()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_244EA0FA8()
{
  return MEMORY[0x24BDCB680]();
}

uint64_t sub_244EA0FB4()
{
  return MEMORY[0x24BDCB6B0]();
}

uint64_t sub_244EA0FC0()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_244EA0FCC()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_244EA0FD8()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_244EA0FE4()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_244EA0FF0()
{
  return MEMORY[0x24BDCBA60]();
}

uint64_t sub_244EA0FFC()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_244EA1008()
{
  return MEMORY[0x24BDCBB30]();
}

uint64_t sub_244EA1014()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_244EA1020()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_244EA102C()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_244EA1038()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_244EA1044()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_244EA1050()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_244EA105C()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_244EA1068()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_244EA1074()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_244EA1080()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_244EA108C()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_244EA1098()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_244EA10A4()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_244EA10B0()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_244EA10BC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_244EA10C8()
{
  return MEMORY[0x24BDCEAC8]();
}

uint64_t sub_244EA10D4()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_244EA10E0()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_244EA10EC()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_244EA10F8()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_244EA1104()
{
  return MEMORY[0x24BDCF4B0]();
}

uint64_t sub_244EA1110()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_244EA111C()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t sub_244EA1128()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_244EA1134()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_244EA1140()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_244EA114C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_244EA1158()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_244EA1164()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_244EA1170()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_244EA117C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_244EA1188()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_244EA1194()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_244EA11A0()
{
  return MEMORY[0x24BEE06A0]();
}

uint64_t sub_244EA11AC()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_244EA11B8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_244EA11C4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_244EA11D0()
{
  return MEMORY[0x24BDCFA50]();
}

uint64_t sub_244EA11DC()
{
  return MEMORY[0x24BDCFAD8]();
}

uint64_t sub_244EA11E8()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_244EA11F4()
{
  return MEMORY[0x24BDCFB30]();
}

uint64_t sub_244EA1200()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_244EA120C()
{
  return MEMORY[0x24BEE0A58]();
}

uint64_t sub_244EA1218()
{
  return MEMORY[0x24BEE0A70]();
}

uint64_t sub_244EA1224()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_244EA1230()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_244EA123C()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_244EA1248()
{
  return MEMORY[0x24BEE0B78]();
}

uint64_t sub_244EA1254()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_244EA1260()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_244EA126C()
{
  return MEMORY[0x24BEE0BB8]();
}

uint64_t sub_244EA1278()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_244EA1284()
{
  return MEMORY[0x24BEE0BE0]();
}

uint64_t sub_244EA1290()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_244EA129C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_244EA12A8()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_244EA12B4()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_244EA12C0()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_244EA12CC()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_244EA12D8()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_244EA12E4()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_244EA12F0()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_244EA12FC()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_244EA1308()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_244EA1314()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_244EA1320()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_244EA132C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_244EA1338()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_244EA1344()
{
  return MEMORY[0x24BEE6AD8]();
}

uint64_t sub_244EA1350()
{
  return MEMORY[0x24BDCFD18]();
}

uint64_t sub_244EA135C()
{
  return MEMORY[0x24BEE7610]();
}

uint64_t sub_244EA1368()
{
  return MEMORY[0x24BEE7620]();
}

uint64_t sub_244EA1374()
{
  return MEMORY[0x24BDCFED8]();
}

uint64_t sub_244EA1380()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_244EA138C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_244EA1398()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_244EA13A4()
{
  return MEMORY[0x24BEE1E58]();
}

uint64_t sub_244EA13B0()
{
  return MEMORY[0x24BEE1E68]();
}

uint64_t sub_244EA13BC()
{
  return MEMORY[0x24BDD04B8]();
}

uint64_t sub_244EA13C8()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_244EA13D4()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_244EA13E0()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_244EA13EC()
{
  return MEMORY[0x24BDD0580]();
}

uint64_t sub_244EA13F8()
{
  return MEMORY[0x24BDD0620]();
}

uint64_t sub_244EA1404()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_244EA1410()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_244EA141C()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_244EA1428()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_244EA1434()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_244EA1440()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_244EA144C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_244EA1458()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_244EA1464()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_244EA1470()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_244EA147C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_244EA1488()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_244EA1494()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_244EA14A0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_244EA14AC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_244EA14B8()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_244EA14C4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_244EA14D0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_244EA14DC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_244EA14E8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_244EA14F4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_244EA1500()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_244EA150C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_244EA1518()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_244EA1524()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_244EA1530()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_244EA153C()
{
  return MEMORY[0x24BEE4A10]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

int uname(utsname *a1)
{
  return MEMORY[0x24BDB02A8](a1);
}

