uint64_t sub_244B50754()
{
  uint64_t result;
  integer_t task_info_out[4];
  __int128 v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)task_info_out = 0u;
  v2 = 0u;
  result = sub_244B51778(task_info_out);
  if ((_DWORD)result)
  {
    sub_244B64BAC();
    sub_244B64A2C();
    sub_244B64C90();
    sub_244B64A2C();
    swift_bridgeObjectRelease();
    result = sub_244B64C3C();
    __break(1u);
  }
  else
  {
    xmmword_2573DFD68 = *(_OWORD *)task_info_out;
    *(_OWORD *)&qword_2573DFD78 = v2;
  }
  return result;
}

uint64_t static AuditToken.currentProcess.getter()
{
  if (qword_2573DFD60 != -1)
    swift_once();
  return xmmword_2573DFD68;
}

uint64_t AuditToken.auditUserIdentifier.getter(uint64_t a1)
{
  return sub_244B50924(a1);
}

uint64_t AuditToken.effectiveUserIdentifier.getter(uint64_t a1)
{
  return sub_244B50924(a1);
}

uint64_t AuditToken.effectiveGroupIdentifier.getter(uint64_t a1)
{
  return sub_244B50924(a1);
}

uint64_t AuditToken.realUserIdentifier.getter(uint64_t a1)
{
  return sub_244B50924(a1);
}

uint64_t AuditToken.realGroupIdentifier.getter(uint64_t a1)
{
  return sub_244B50924(a1);
}

uint64_t AuditToken.processIdentifier.getter(uint64_t a1)
{
  return sub_244B50924(a1);
}

uint64_t AuditToken.auditSessionIdentifier.getter(uint64_t a1)
{
  return sub_244B50924(a1);
}

uint64_t AuditToken.processIdentifierVersion.getter(uint64_t a1)
{
  return sub_244B50924(a1);
}

uint64_t sub_244B50924(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t (*v3)(uint64_t *);
  uint64_t v5;
  int v6;
  int v7;

  v5 = a1;
  sub_244B51828();
  v6 = v1;
  v7 = v2;
  return v3(&v5);
}

void sub_244B50954(ProactiveDaemonSupport::AuditToken **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  AuditToken.init(rawValue:)(*a1, &(*a1)->rawValue);
  *(_QWORD *)a2 = v3;
  *(_QWORD *)(a2 + 8) = v4;
  *(_QWORD *)(a2 + 16) = v5;
  *(_QWORD *)(a2 + 24) = v6;
  *(_BYTE *)(a2 + 32) = 0;
}

__n128 sub_244B5098C@<Q0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)v1;
  v3 = *(_OWORD *)(v1 + 16);
  *a1 = *(_OWORD *)v1;
  a1[1] = v3;
  return result;
}

uint64_t AuditToken.hash(into:)()
{
  sub_244B51828();
  return sub_244B64D38();
}

uint64_t sub_244B50A08(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = sub_244B50B9C(a1, a1 + 32);
  v3 = v2;
  sub_244B511A0(&qword_2573DFDD0);
  sub_244B5173C();
  sub_244B64C84();
  return sub_244B50C54(v1, v3);
}

uint64_t static AuditToken.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  _QWORD v16[4];
  _QWORD v17[4];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v17[0] = a1;
  v17[1] = a2;
  v17[2] = a3;
  v17[3] = a4;
  v16[0] = a5;
  v16[1] = a6;
  v16[2] = a7;
  v16[3] = a8;
  v8 = sub_244B50B9C((uint64_t)v17, (uint64_t)&v18);
  v10 = v9;
  v11 = sub_244B50B9C((uint64_t)v16, (uint64_t)v17);
  v13 = v12;
  v14 = MEMORY[0x2495200FC](v8, v10, v11, v12);
  sub_244B50C54(v11, v13);
  sub_244B50C54(v8, v10);
  return v14 & 1;
}

uint64_t sub_244B50B9C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];

  v8[3] = MEMORY[0x24BEE0F88];
  v8[4] = MEMORY[0x24BDCFB90];
  v8[0] = a1;
  v8[1] = a2;
  v2 = sub_244B511E0(v8, MEMORY[0x24BEE0F88]);
  v3 = *v2;
  if (*v2 && (v4 = v2[1], v5 = v4 - v3, v4 != v3))
  {
    if (v5 <= 14)
    {
      v6 = sub_244B64840();
    }
    else if ((unint64_t)v5 >= 0x7FFFFFFF)
    {
      v6 = MEMORY[0x2495200E4]();
    }
    else
    {
      v6 = MEMORY[0x2495200F0]();
    }
  }
  else
  {
    v6 = 0;
  }
  sub_244B51240((uint64_t)v8);
  return v6;
}

uint64_t sub_244B50C54(uint64_t a1, unint64_t a2)
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

uint64_t AuditToken.hashValue.getter()
{
  sub_244B51858();
  AuditToken.hash(into:)();
  return sub_244B51864();
}

uint64_t sub_244B50CF0()
{
  return AuditToken.hashValue.getter();
}

uint64_t sub_244B50CFC()
{
  return AuditToken.hash(into:)();
}

uint64_t sub_244B50D08()
{
  sub_244B64D2C();
  AuditToken.hash(into:)();
  return sub_244B64D5C();
}

BOOL sub_244B50D60()
{
  uint64_t v0;

  v0 = sub_244B64C6C();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

uint64_t sub_244B50DA8(uint64_t *a1, uint64_t *a2)
{
  return static AuditToken.== infix(_:_:)(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

BOOL sub_244B50DC8(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_244B50DD8()
{
  return 1;
}

uint64_t sub_244B50DE4()
{
  sub_244B64D2C();
  sub_244B64A20();
  return sub_244B64D5C();
}

void sub_244B50E30()
{
  sub_244B51858();
  sub_244B5184C();
  sub_244B51864();
  sub_244B51840();
}

uint64_t sub_244B50E5C()
{
  return sub_244B64D50();
}

uint64_t sub_244B50E80()
{
  return sub_244B64A20();
}

uint64_t sub_244B50E98()
{
  sub_244B64D2C();
  sub_244B64A20();
  return sub_244B64D5C();
}

void sub_244B50EE0()
{
  sub_244B64D2C();
  sub_244B5184C();
  sub_244B51864();
  sub_244B51840();
}

BOOL sub_244B50F0C@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_244B50D60();
  *a1 = result;
  return result;
}

void sub_244B50F40(_QWORD *a1@<X8>)
{
  *a1 = 0x6E656B6F74;
  a1[1] = 0xE500000000000000;
}

uint64_t sub_244B50F58()
{
  return 0x6E656B6F74;
}

uint64_t sub_244B50F6C@<X0>(BOOL *a1@<X8>)
{
  uint64_t result;

  result = sub_244B50DA4();
  *a1 = result != 0;
  return result;
}

uint64_t sub_244B50F98()
{
  return 0;
}

void sub_244B50FA4(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_244B50FB0()
{
  sub_244B51204();
  return sub_244B64D98();
}

uint64_t sub_244B50FD8()
{
  sub_244B51204();
  return sub_244B64DA4();
}

_QWORD *AuditToken.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v5;
  unint64_t v6;

  sub_244B511A0(&qword_2573DFDB0);
  MEMORY[0x24BDAC7A8]();
  v3 = sub_244B511E0(a1, a1[3]);
  sub_244B51204();
  sub_244B64D74();
  if (!v1)
  {
    sub_244B51260();
    sub_244B64C78();
    sub_244B5129C();
    sub_244B64810();
    sub_244B51818();
    sub_244B50C54(v5, v6);
    v3 = 0;
  }
  sub_244B51240((uint64_t)a1);
  return v3;
}

uint64_t sub_244B511A0(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249520A2C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *sub_244B511E0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_244B51204()
{
  unint64_t result;

  result = qword_2573DFDB8;
  if (!qword_2573DFDB8)
  {
    result = MEMORY[0x249520A44](&unk_244B656D0, &type metadata for AuditToken.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573DFDB8);
  }
  return result;
}

uint64_t sub_244B51240(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_244B51260()
{
  unint64_t result;

  result = qword_2573DFDC0;
  if (!qword_2573DFDC0)
  {
    result = MEMORY[0x249520A44](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2573DFDC0);
  }
  return result;
}

unint64_t sub_244B5129C()
{
  unint64_t result;

  result = qword_2573DFDC8;
  if (!qword_2573DFDC8)
  {
    result = MEMORY[0x249520A44](MEMORY[0x24BDCDDC0], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2573DFDC8);
  }
  return result;
}

uint64_t AuditToken.encode(to:)(_QWORD *a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  int v5;
  int v6;
  int v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _DWORD v20[8];
  uint64_t v21;

  v18 = a5;
  v5 = a4;
  v6 = a3;
  v7 = a2;
  v15 = HIDWORD(a2);
  v16 = HIDWORD(a3);
  v21 = *MEMORY[0x24BDAC8D0];
  v17 = HIDWORD(a4);
  v19 = HIDWORD(a5);
  v9 = sub_244B511A0(&qword_2573DFDD0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244B511E0(a1, a1[3]);
  sub_244B51204();
  sub_244B64D8C();
  v20[0] = v7;
  v20[1] = v15;
  v20[2] = v6;
  v20[3] = v16;
  v20[4] = v5;
  v20[5] = v17;
  v20[6] = v18;
  v20[7] = v19;
  sub_244B50A08((uint64_t)v20);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

unint64_t sub_244B51438()
{
  unint64_t result;

  result = qword_2573DFDD8;
  if (!qword_2573DFDD8)
  {
    result = MEMORY[0x249520A44](&protocol conformance descriptor for AuditToken, &type metadata for AuditToken);
    atomic_store(result, (unint64_t *)&qword_2573DFDD8);
  }
  return result;
}

_QWORD *sub_244B51474@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = AuditToken.init(from:)(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_244B514B8(_QWORD *a1)
{
  unint64_t *v1;

  return AuditToken.encode(to:)(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t initializeBufferWithCopyOfBuffer for AuditToken(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 initializeWithCopy for AuditToken(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AuditToken(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AuditToken(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

ValueMetadata *type metadata accessor for AuditToken()
{
  return &type metadata for AuditToken;
}

void type metadata accessor for audit_token_t(uint64_t a1)
{
  sub_244B517C8(a1, &qword_2573DFE40);
}

uint64_t getEnumTagSinglePayload for AuditToken.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AuditToken.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_244B51618 + 4 * byte_244B65480[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_244B51638 + 4 * byte_244B65485[v4]))();
}

_BYTE *sub_244B51618(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_244B51638(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244B51640(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244B51648(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244B51650(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244B51658(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_244B51664()
{
  return 0;
}

ValueMetadata *type metadata accessor for AuditToken.CodingKeys()
{
  return &type metadata for AuditToken.CodingKeys;
}

unint64_t sub_244B51680()
{
  unint64_t result;

  result = qword_2573DFE48;
  if (!qword_2573DFE48)
  {
    result = MEMORY[0x249520A44](&unk_244B656A8, &type metadata for AuditToken.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573DFE48);
  }
  return result;
}

unint64_t sub_244B516C0()
{
  unint64_t result;

  result = qword_2573DFE50;
  if (!qword_2573DFE50)
  {
    result = MEMORY[0x249520A44](&unk_244B655E0, &type metadata for AuditToken.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573DFE50);
  }
  return result;
}

unint64_t sub_244B51700()
{
  unint64_t result;

  result = qword_2573DFE58;
  if (!qword_2573DFE58)
  {
    result = MEMORY[0x249520A44](&unk_244B65608, &type metadata for AuditToken.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573DFE58);
  }
  return result;
}

unint64_t sub_244B5173C()
{
  unint64_t result;

  result = qword_2573DFE60;
  if (!qword_2573DFE60)
  {
    result = MEMORY[0x249520A44](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2573DFE60);
  }
  return result;
}

uint64_t sub_244B51778(task_info_t task_info_out)
{
  mach_msg_type_number_t task_info_outCnt;

  task_info_outCnt = 8;
  return task_info(*MEMORY[0x24BDAEC58], 0xFu, task_info_out, &task_info_outCnt);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_244B517C8(a1, &qword_2543FBD68);
}

void sub_244B517C8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_244B51818()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_244B5184C()
{
  return sub_244B64D50();
}

uint64_t sub_244B51858()
{
  return sub_244B64D2C();
}

uint64_t sub_244B51864()
{
  return sub_244B64D5C();
}

uint64_t sub_244B5186C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 32))(v3 + *(_QWORD *)(*(_QWORD *)v3 + 88), a1);
  return v3;
}

uint64_t CopyOnWriteBox._Box.deinit()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 88));
  return v0;
}

uint64_t CopyOnWriteBox._Box.__deallocating_deinit()
{
  CopyOnWriteBox._Box.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_244B51918@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;

  v5 = a1 + *(_QWORD *)(*(_QWORD *)a1 + 88);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, v5, a2);
}

uint64_t sub_244B51980@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  v5 = *(_QWORD *)(a3 + a2 - 8);
  v6 = *(_QWORD *)a1 + *(_QWORD *)(**(_QWORD **)a1 + 88);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a4, v6, v5);
}

uint64_t sub_244B519F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_QWORD *)(a4 + a3 - 8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](a1, a1);
  v8 = (char *)&v14 - v7;
  (*(void (**)(char *))(v6 + 16))((char *)&v14 - v7);
  type metadata accessor for CopyOnWriteBox._Box(0, v5, v9, v10);
  if ((sub_244B64CA8() & 1) != 0)
  {
    v11 = *(_QWORD *)a2 + *(_QWORD *)(**(_QWORD **)a2 + 88);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 40))(v11, v8, v5);
    return swift_endAccess();
  }
  else
  {
    v13 = swift_allocObject();
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v13 + *(_QWORD *)(*(_QWORD *)v13 + 88), v8, v5);
    result = swift_release();
    *(_QWORD *)a2 = v13;
  }
  return result;
}

uint64_t static CopyOnWriteBox<A>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  void (*v14)(_BYTE *, uint64_t, uint64_t);
  uint64_t v15;
  char v16;
  void (*v17)(_BYTE *, uint64_t);
  _BYTE v19[24];

  v5 = *(_QWORD *)(a3 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1, a2);
  v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = MEMORY[0x24BDAC7A8](v6, v9);
  v12 = &v19[-v11];
  v13 = v10 + *(_QWORD *)(*(_QWORD *)v10 + 88);
  sub_244B5223C();
  v14 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16);
  v14(v12, v13, a3);
  v15 = a2 + *(_QWORD *)(*(_QWORD *)a2 + 88);
  sub_244B5223C();
  v14(v8, v15, a3);
  v16 = sub_244B649D8();
  v17 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
  v17(v8, a3);
  v17(v12, a3);
  return v16 & 1;
}

uint64_t sub_244B51C20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_BYTE *, uint64_t, uint64_t);
  uint64_t v16;
  char v17;
  void (*v18)(_BYTE *, uint64_t);
  _BYTE v20[24];

  v3 = *(_QWORD *)(a3 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1, a2);
  v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = MEMORY[0x24BDAC7A8](v5, v8);
  v11 = &v20[-v10];
  v13 = *v12;
  v14 = *(_QWORD *)v9 + *(_QWORD *)(**(_QWORD **)v9 + 88);
  swift_beginAccess();
  v15 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16);
  v15(v11, v14, v3);
  v16 = v13 + *(_QWORD *)(*(_QWORD *)v13 + 88);
  swift_beginAccess();
  v15(v7, v16, v3);
  v17 = sub_244B649D8();
  v18 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v18(v7, v3);
  v18(v11, v3);
  return v17 & 1;
}

uint64_t CopyOnWriteBox<A>.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v7 + *(_QWORD *)(*(_QWORD *)v7 + 88);
  sub_244B5223C();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, a3);
  sub_244B649C0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, a3);
}

uint64_t CopyOnWriteBox<A>.hashValue.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = *(_QWORD *)(a2 - 8);
  v4 = MEMORY[0x24BDAC7A8](a1, a2);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v4 + *(_QWORD *)(*(_QWORD *)v4 + 88);
  sub_244B5223C();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, a2);
  v8 = sub_244B649CC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, a2);
  return v8;
}

uint64_t sub_244B51EB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 8);
  return MEMORY[0x249520A44](&protocol conformance descriptor for <A> CopyOnWriteBox<A>, a1, &v4);
}

uint64_t sub_244B51EF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)v2 + *(_QWORD *)(**(_QWORD **)v2 + 88);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = sub_244B649CC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

uint64_t sub_244B51FB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)v2 + *(_QWORD *)(**(_QWORD **)v2 + 88);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  sub_244B649C0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_244B52078(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[24];

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_244B64D2C();
  v7 = *(_QWORD *)v2 + *(_QWORD *)(**(_QWORD **)v2 + 88);
  swift_beginAccess();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  sub_244B649C0();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  return sub_244B64D5C();
}

uint64_t sub_244B52150()
{
  return 8;
}

_QWORD *sub_244B5215C(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_244B52168()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for CopyOnWriteBox(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_244B52210(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CopyOnWriteBox);
}

uint64_t sub_244B52180()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for CopyOnWriteBox._Box(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_244B52210(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CopyOnWriteBox._Box);
}

uint64_t method lookup function for CopyOnWriteBox._Box()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CopyOnWriteBox._Box.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_244B52210(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2495209FC](a1, v6, a5);
}

uint64_t sub_244B5223C()
{
  return swift_beginAccess();
}

uint64_t static Daemon.enableSIGTERMHandling.getter()
{
  return 0;
}

void static Daemon.main()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;
  id v6;

  v5 = (void *)MEMORY[0x249520690]();
  sub_244B522D8(v2, a1, a2);
  objc_autoreleasePoolPop(v5);
  v6 = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
  objc_msgSend(v6, sel_run);

}

uint64_t sub_244B522D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t result;
  uint64_t v11;

  v5 = sub_244B648C4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244B57A8C(a2, a3);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3) & 1) != 0)
  {
    (*(void (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
    sub_244B52428();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  (*(void (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 40))(a2, a3);
  if ((result & 1) != 0)
  {
    (*(void (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
    sub_244B52514((uint64_t)v9);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  return result;
}

uint64_t dispatch thunk of static Daemon.logger.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static Daemon.iOSSandboxProfileName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static Daemon.macOSSandboxProfileName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static Daemon.enableSIGTERMHandling.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of static Daemon.enableDistributedNotificationReposting.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of static Daemon.start()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

void sub_244B52428()
{
  NSObject *v0;
  os_log_type_t v1;
  uint8_t *v2;
  void (__cdecl *v3)(int);
  uint64_t v4;
  os_unfair_lock_s *v5;

  v0 = sub_244B648B8();
  v1 = sub_244B64AE0();
  if (os_log_type_enabled(v0, v1))
  {
    v2 = (uint8_t *)sub_244B549F4();
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_244B4F000, v0, v1, "DaemonEventHandlers: Disabling standard SIGTERM handler", v2, 2u);
    sub_244B549E8();
  }

  v3 = (void (__cdecl *)(int))sub_244B64960();
  signal(15, v3);
  if (qword_2543FBB98 != -1)
    swift_once();
  v4 = qword_2543FBD70 + 16;
  v5 = (os_unfair_lock_s *)(qword_2543FBD70 + 28);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_2543FBD70 + 28));
  sub_244B53150(v4);
  os_unfair_lock_unlock(v5);
}

void sub_244B52514(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  NSObject *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD aBlock[6];

  v2 = sub_244B54A08();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2, v5);
  v6 = sub_244B648B8();
  v7 = sub_244B64AE0();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)sub_244B549F4();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_244B4F000, v6, v7, "DaemonEventHandlers: registerLaunchEvents called: registering for com.apple.distnoted.matching", v8, 2u);
    sub_244B549E8();
  }

  sub_244B54610(0, qword_2543FB860);
  v9 = sub_244B64AF8();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v10 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v11 + v10, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  aBlock[4] = sub_244B546A0;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244B53108;
  aBlock[3] = &unk_2515B5E20;
  v12 = _Block_copy(aBlock);
  swift_release();
  xpc_set_event_stream_handler("com.apple.distnoted.matching", v9, v12);
  _Block_release(v12);

}

uint64_t sub_244B526C0()
{
  uint64_t result;

  sub_244B511A0(&qword_2543FBBB8);
  result = swift_allocObject();
  *(_DWORD *)(result + 28) = 0;
  *(_QWORD *)(result + 16) = 0;
  *(_BYTE *)(result + 24) = -1;
  qword_2543FBD70 = result;
  return result;
}

void sub_244B52700()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSObject *oslog;
  os_log_t osloga;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25[3];
  uint64_t v26;

  v0 = MEMORY[0x249520C6C]();
  if (v0 == sub_244B64954())
  {
    swift_getObjectType();
    sub_244B5910C((uint64_t)v25);
    if (v26)
    {
      sub_244B511A0(&qword_2543FB7C0);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_244B64948();
        v3 = sub_244B649E4();
        if (v4)
        {
          sub_244B566D0(v3, v4, v23, v25);
          swift_bridgeObjectRelease();
          if (!v26)
          {
            swift_bridgeObjectRelease();
            sub_244B546D8((uint64_t)v25, qword_2543FBBC8);
LABEL_19:
            v10 = sub_244B648B8();
            v11 = sub_244B64AC8();
            if (os_log_type_enabled(v10, v11))
            {
              v12 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v12 = 0;
              v13 = "DaemonEventHandlers: Received distributed event with invalid name";
              goto LABEL_21;
            }
            goto LABEL_22;
          }
          if ((swift_dynamicCast() & 1) != 0)
          {
            sub_244B566D0(0x6F666E4972657355, 0xE800000000000000, v23, v25);
            swift_bridgeObjectRelease();
            if (v26)
            {
              if ((swift_dynamicCast() & 1) != 0)
              {
                swift_bridgeObjectRetain_n();
                swift_bridgeObjectRetain_n();
                v5 = sub_244B648B8();
                v6 = sub_244B64AE0();
                if (os_log_type_enabled(v5, v6))
                {
                  v7 = swift_slowAlloc();
                  osloga = (os_log_t)swift_slowAlloc();
                  v25[0] = (uint64_t)osloga;
                  *(_DWORD *)v7 = 136315394;
                  swift_bridgeObjectRetain();
                  sub_244B54E58(v23, v24, v25);
                  sub_244B64B70();
                  swift_bridgeObjectRelease_n();
                  *(_WORD *)(v7 + 12) = 2080;
                  v8 = sub_244B649A8();
                  sub_244B54E58(v8, v9, v25);
                  sub_244B64B70();
                  swift_bridgeObjectRelease_n();
                  swift_bridgeObjectRelease();
                  _os_log_impl(&dword_244B4F000, v5, v6, "Posting notification %s userInfo: %s", (uint8_t *)v7, 0x16u);
                  swift_arrayDestroy();
                  MEMORY[0x249520AE0](osloga, -1, -1);
                  MEMORY[0x249520AE0](v7, -1, -1);
                }
                else
                {
                  swift_bridgeObjectRelease_n();
                  swift_bridgeObjectRelease_n();
                }

                v18 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
                v19 = (void *)sub_244B649F0();
                swift_bridgeObjectRelease();
                v20 = sub_244B52D48(v23);
                swift_bridgeObjectRelease();
                sub_244B54710((uint64_t)v19, 0, v20, v18);
LABEL_31:

                return;
              }
            }
            else
            {
              sub_244B546D8((uint64_t)v25, qword_2543FBBC8);
            }
            swift_bridgeObjectRetain_n();
            v14 = sub_244B648B8();
            v15 = sub_244B64AE0();
            if (os_log_type_enabled(v14, v15))
            {
              v16 = (uint8_t *)swift_slowAlloc();
              v17 = swift_slowAlloc();
              v25[0] = v17;
              *(_DWORD *)v16 = 136315138;
              swift_bridgeObjectRetain();
              sub_244B54E58(v23, v24, v25);
              sub_244B64B70();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_244B4F000, v14, v15, "Posting notification %s", v16, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x249520AE0](v17, -1, -1);
              MEMORY[0x249520AE0](v16, -1, -1);
            }
            else
            {
              swift_bridgeObjectRelease_n();
            }

            v18 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
            v19 = (void *)sub_244B649F0();
            swift_bridgeObjectRelease();
            objc_msgSend(v18, sel_postNotificationName_object_, v19, 0);
            goto LABEL_31;
          }
        }
        swift_bridgeObjectRelease();
        goto LABEL_19;
      }
    }
    else
    {
      sub_244B546D8((uint64_t)v25, qword_2543FBBC8);
    }
    v10 = sub_244B648B8();
    v11 = sub_244B64AC8();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      v13 = "DaemonEventHandlers: Found invalid dictionary in distributed event";
LABEL_21:
      _os_log_impl(&dword_244B4F000, v10, v11, v13, v12, 2u);
      MEMORY[0x249520AE0](v12, -1, -1);
    }
LABEL_22:

    return;
  }
  oslog = sub_244B648B8();
  v1 = sub_244B64AC8();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_244B4F000, oslog, v1, "DaemonEventHandlers: Received distributed event with invalid type", v2, 2u);
    MEMORY[0x249520AE0](v2, -1, -1);
  }

}

uint64_t sub_244B52D48(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
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
    sub_244B511A0(&qword_2543FBB28);
    v2 = sub_244B64C54();
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
  if (!v5)
    goto LABEL_9;
LABEL_8:
  v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  v10 = v9 | (v8 << 6);
  while (1)
  {
    v15 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v17 = *v15;
    v16 = v15[1];
    sub_244B54798(*(_QWORD *)(a1 + 56) + 32 * v10, (uint64_t)v40);
    *(_QWORD *)&v39 = v17;
    *((_QWORD *)&v39 + 1) = v16;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v17;
    *((_QWORD *)&v37[0] + 1) = v16;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_244B547D4(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_244B547D4(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_244B547D4(v36, v37);
    sub_244B547D4(v37, &v33);
    result = sub_244B64BA0();
    v18 = -1 << *(_BYTE *)(v2 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v6 + 8 * (v19 >> 6))) == 0)
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        v24 = v20 == v23;
        if (v20 == v23)
          v20 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v6 + 8 * v20);
        if (v25 != -1)
        {
          v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v6 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(_QWORD *)(v6 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    v26 = *(_QWORD *)(v2 + 48) + 40 * v21;
    *(_OWORD *)v26 = v29;
    *(_OWORD *)(v26 + 16) = v30;
    *(_QWORD *)(v26 + 32) = v31;
    result = (uint64_t)sub_244B547D4(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v21));
    ++*(_QWORD *)(v2 + 16);
    if (v5)
      goto LABEL_8;
LABEL_9:
    v11 = v8 + 1;
    if (__OFADD__(v8, 1))
      goto LABEL_38;
    if (v11 >= v27)
      goto LABEL_36;
    v12 = *(_QWORD *)(v28 + 8 * v11);
    v13 = v8 + 1;
    if (!v12)
    {
      v13 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_36;
      v12 = *(_QWORD *)(v28 + 8 * v13);
      if (!v12)
      {
        v13 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_36;
        v12 = *(_QWORD *)(v28 + 8 * v13);
        if (!v12)
        {
          v13 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_36;
          v12 = *(_QWORD *)(v28 + 8 * v13);
          if (!v12)
            break;
        }
      }
    }
LABEL_24:
    v5 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
    v8 = v13;
  }
  v14 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_36:
    swift_release();
    sub_244B547E4();
    return v2;
  }
  v12 = *(_QWORD *)(v28 + 8 * v14);
  if (v12)
  {
    v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    v13 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v13 >= v27)
      goto LABEL_36;
    v12 = *(_QWORD *)(v28 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_24;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_244B53108(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_244B53150(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint8_t *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[6];
  uint64_t v27;

  v27 = sub_244B6496C();
  v25 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27, v3);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_244B64984();
  v23 = *(_QWORD *)(v6 - 8);
  v24 = v6;
  result = MEMORY[0x24BDAC7A8](v6, v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(unsigned __int8 *)(a1 + 8);
  if (v11 != 255)
  {
    if ((v11 & 1) != 0)
      return result;
    v12 = *(_QWORD *)a1;
    v13 = sub_244B648B8();
    v14 = sub_244B64AE0();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v22 = v1;
      v16 = v15;
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_244B4F000, v13, v14, "DaemonEventHandlers: Upgrading existing SIGTERM DispatchSource", v15, 2u);
      MEMORY[0x249520AE0](v16, -1, -1);
    }

    swift_getObjectType();
    sub_244B64B1C();
    sub_244B545FC(v12, v11);
    *(_QWORD *)a1 = 0;
    *(_BYTE *)(a1 + 8) = -1;
  }
  v17 = sub_244B648B8();
  v18 = sub_244B64AE0();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_244B4F000, v17, v18, "DaemonEventHandlers: Registering full SIGTERM DispatchSource", v19, 2u);
    MEMORY[0x249520AE0](v19, -1, -1);
  }

  sub_244B54610(0, &qword_2543FBB48);
  v20 = sub_244B64B04();
  swift_getObjectType();
  aBlock[4] = sub_244B53418;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244B62DD8;
  aBlock[3] = &unk_2515B5DD0;
  v21 = _Block_copy(aBlock);
  sub_244B64978();
  sub_244B534A0();
  sub_244B64B10();
  _Block_release(v21);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v27);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v24);
  result = sub_244B64B28();
  *(_QWORD *)a1 = v20;
  *(_BYTE *)(a1 + 8) = 1;
  return result;
}

uint64_t sub_244B53418()
{
  id v0;

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_2573DFD90 != -1)
    swift_once();
  objc_msgSend(v0, sel_postNotificationName_object_userInfo_, qword_2573E0090, 0, 0);

  return xpc_transaction_exit_clean();
}

uint64_t sub_244B534A0()
{
  sub_244B6496C();
  sub_244B54538(&qword_2543FBB30, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  sub_244B511A0(&qword_2543FBB38);
  sub_244B54574();
  return sub_244B64B94();
}

uint64_t sub_244B53534(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  _QWORD aBlock[8];

  v3 = sub_244B6496C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_244B64984();
  v9 = *(_QWORD *)(v8 - 8);
  result = MEMORY[0x24BDAC7A8](v8, v10);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned __int8 *)(a1 + 8) == 255)
  {
    sub_244B54610(0, &qword_2543FBB48);
    aBlock[7] = v1;
    v14 = sub_244B64B04();
    swift_getObjectType();
    v18 = (uint64_t *)a1;
    aBlock[4] = sub_244B536E4;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_244B62DD8;
    aBlock[3] = &unk_2515B59D0;
    v15 = _Block_copy(aBlock);
    sub_244B64978();
    sub_244B534A0();
    sub_244B64B10();
    _Block_release(v15);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
    result = sub_244B64B28();
    v16 = v18;
    *v18 = v14;
    *((_BYTE *)v16 + 8) = 0;
  }
  return result;
}

void sub_244B536E4()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v1 = v0;
  if (qword_2573DFD90 != -1)
  {
    swift_once();
    v0 = v1;
  }
  objc_msgSend(v0, sel_postNotificationName_object_userInfo_, qword_2573E0090, 0, 0);

}

BOOL static CancellableOSTransaction.ReleaseBehavior.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CancellableOSTransaction.ReleaseBehavior.hash(into:)()
{
  return sub_244B64D44();
}

uint64_t CancellableOSTransaction.ReleaseBehavior.hashValue.getter()
{
  sub_244B64D2C();
  sub_244B64D44();
  return sub_244B64D5C();
}

uint64_t sub_244B537FC()
{
  sub_244B64D2C();
  sub_244B64D44();
  return sub_244B64D5C();
}

uint64_t sub_244B5383C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 112) = 0;
  return swift_unknownObjectRelease();
}

uint64_t sub_244B53848()
{
  swift_unknownObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

void sub_244B5386C()
{
  sub_244B549D4();
}

void sub_244B53874()
{
  sub_244B5386C();
}

uint64_t CancellableOSTransaction.__allocating_init(_:onSIGTERM:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  sub_244B549C4();
  v8 = swift_allocObject();
  CancellableOSTransaction.init(_:onSIGTERM:)(a1, a2, a3, a4);
  return v8;
}

uint64_t CancellableOSTransaction.init(_:onSIGTERM:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  os_unfair_lock_s *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;

  v5 = v4;
  v8 = sub_244B511A0((uint64_t *)&unk_2543FBBA8);
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2543FBB98 != -1)
    swift_once();
  v12 = qword_2543FBD70 + 16;
  v13 = (os_unfair_lock_s *)(qword_2543FBD70 + 28);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_2543FBD70 + 28));
  sub_244B53534(v12);
  os_unfair_lock_unlock(v13);
  sub_244B64A08();
  swift_bridgeObjectRelease();
  v14 = os_transaction_create();
  result = swift_release();
  if (v14)
  {
    type metadata accessor for CancellableOSTransaction.Holder();
    v16 = swift_allocObject();
    swift_defaultActor_initialize();
    *(_QWORD *)(v16 + 112) = v14;
    *(_QWORD *)(v5 + 16) = v16;
    v17 = sub_244B64AA4();
    sub_244B53AA4((uint64_t)v11, 1, 1, v17);
    v18 = (_QWORD *)swift_allocObject();
    v18[2] = 0;
    v18[3] = 0;
    v18[4] = a3;
    v18[5] = a4;
    v18[6] = v16;
    swift_retain();
    *(_QWORD *)(v5 + 24) = sub_244B54000((uint64_t)v11, (uint64_t)&unk_2573E00A8, (uint64_t)v18);
    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for CancellableOSTransaction.Holder()
{
  return objc_opt_self();
}

uint64_t sub_244B53AA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_244B53AB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  sub_244B511A0(&qword_2573E00C8);
  v6[6] = swift_task_alloc();
  v7 = sub_244B64B40();
  v6[7] = v7;
  v6[8] = *(_QWORD *)(v7 - 8);
  v6[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244B53B38()
{
  uint64_t v0;
  id v1;
  _QWORD *v2;
  char *v4;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_2573DFD90 != -1)
    swift_once();
  sub_244B64B4C();

  sub_244B64B34();
  v4 = (char *)&dword_2573E00D0 + dword_2573E00D0;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v2;
  *v2 = v0;
  v2[1] = sub_244B53C2C;
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, uint64_t))v4)(*(_QWORD *)(v0 + 48), 0, 0, v0 + 16);
}

uint64_t sub_244B53C2C()
{
  swift_task_dealloc();
  return sub_244B549A4();
}

uint64_t sub_244B53C78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = sub_244B6481C();
  if (sub_244B543FC(v1, 1, v2) == 1)
  {
    sub_244B549BC(*(_QWORD *)(v0 + 64));
LABEL_5:
    sub_244B549DC();
    swift_task_dealloc();
    return sub_244B54998(*(uint64_t (**)(void))(v0 + 8));
  }
  (*(void (**)(void))(v0 + 24))();
  if ((*(_BYTE *)(v0 + 88) & 1) != 0)
  {
    v3 = *(_QWORD *)(v0 + 48);
    sub_244B549BC(*(_QWORD *)(v0 + 64));
    sub_244B546D8(v3, &qword_2573E00C8);
    goto LABEL_5;
  }
  return sub_244B549A4();
}

uint64_t sub_244B53D20()
{
  sub_244B5383C();
  return sub_244B549A4();
}

uint64_t sub_244B53D54()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  sub_244B549BC(*(_QWORD *)(v0 + 64));
  sub_244B546D8(v1, &qword_2573E00C8);
  sub_244B549DC();
  swift_task_dealloc();
  return sub_244B54998(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_244B53D9C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244B53DD0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_244B53E50;
  return sub_244B53AB0(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_244B53E50()
{
  uint64_t v0;

  sub_244B54978();
  return sub_244B54998(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_244B53E74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v3[3] = a2;
  v3[4] = a3;
  sub_244B64B40();
  sub_244B54538(&qword_2573E00D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDD0028], MEMORY[0x24BDD0038]);
  v4 = (_QWORD *)swift_task_alloc();
  v3[5] = v4;
  *v4 = v3;
  v4[1] = sub_244B53F08;
  return sub_244B64A8C();
}

uint64_t sub_244B53F08()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (!v0)
    return sub_244B549B0(*(uint64_t (**)(void))(v2 + 8));
  if (*(_QWORD *)(v2 + 24))
  {
    swift_getObjectType();
    sub_244B64A5C();
  }
  return swift_task_switch();
}

uint64_t sub_244B53F98()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 48);
  sub_244B511A0(&qword_2543FBB20);
  swift_dynamicCast();
  swift_willThrowTypedImpl();
  return sub_244B549B0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_244B54000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_244B64AA4();
  if (sub_244B543FC(a1, 1, v6) == 1)
  {
    sub_244B546D8(a1, (uint64_t *)&unk_2543FBBA8);
  }
  else
  {
    sub_244B64A98();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_244B64A5C();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t CancellableOSTransaction.deinit()
{
  uint64_t v0;

  sub_244B64AB0();
  swift_release();
  swift_release();
  return v0;
}

uint64_t CancellableOSTransaction.__deallocating_deinit()
{
  CancellableOSTransaction.deinit();
  sub_244B549C4();
  return swift_deallocClassInstance();
}

uint64_t sub_244B541A4()
{
  uint64_t result;

  result = sub_244B649F0();
  qword_2573E0090 = result;
  return result;
}

id static NSNotificationName.pds_SIGTERMReceived.getter()
{
  if (qword_2573DFD90 != -1)
    swift_once();
  return (id)qword_2573E0090;
}

unint64_t sub_244B5421C()
{
  unint64_t result;

  result = qword_2573E00B0;
  if (!qword_2573E00B0)
  {
    result = MEMORY[0x249520A44](&protocol conformance descriptor for CancellableOSTransaction.ReleaseBehavior, &type metadata for CancellableOSTransaction.ReleaseBehavior);
    atomic_store(result, (unint64_t *)&qword_2573E00B0);
  }
  return result;
}

uint64_t type metadata accessor for CancellableOSTransaction()
{
  return objc_opt_self();
}

uint64_t method lookup function for CancellableOSTransaction()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CancellableOSTransaction.__allocating_init(_:onSIGTERM:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

_BYTE *initializeBufferWithCopyOfBuffer for CancellableOSTransaction.ReleaseBehavior(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CancellableOSTransaction.ReleaseBehavior(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFF)
  {
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
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for CancellableOSTransaction.ReleaseBehavior(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244B5436C + 4 * byte_244B65855[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_244B543A0 + 4 * byte_244B65850[v4]))();
}

uint64_t sub_244B543A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244B543A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244B543B0);
  return result;
}

uint64_t sub_244B543BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244B543C4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_244B543C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244B543D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244B543DC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_244B543E4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void type metadata accessor for CancellableOSTransaction.ReleaseBehavior()
{
  sub_244B549D4();
}

uint64_t sub_244B543FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_244B54408(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_244B5446C;
  return v6(a1);
}

uint64_t sub_244B5446C()
{
  uint64_t v0;

  sub_244B54978();
  return sub_244B54998(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_244B54494()
{
  swift_release();
  sub_244B549C4();
  return swift_deallocObject();
}

uint64_t sub_244B544B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_244B53E50;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2573E00B8 + dword_2573E00B8))(a1, v4);
}

uint64_t sub_244B54520(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_244B54530()
{
  return swift_release();
}

void sub_244B54538(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x249520A44](a3, v5), a1);
  }
  sub_244B54A00();
}

unint64_t sub_244B54574()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2543FBB40;
  if (!qword_2543FBB40)
  {
    v1 = sub_244B545B8(&qword_2543FBB38);
    result = MEMORY[0x249520A44](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2543FBB40);
  }
  return result;
}

uint64_t sub_244B545B8(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249520A38](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_244B545FC(uint64_t a1, char a2)
{
  uint64_t result;

  if (a2 != -1)
    return swift_unknownObjectRelease();
  return result;
}

uint64_t sub_244B54610(uint64_t a1, unint64_t *a2)
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

uint64_t sub_244B54648()
{
  uint64_t v0;

  v0 = sub_244B54A08();
  sub_244B549BC(*(_QWORD *)(v0 - 8));
  return swift_deallocObject();
}

void sub_244B546A0()
{
  sub_244B54A08();
  sub_244B52700();
}

void sub_244B546D8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_244B511A0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  sub_244B54A00();
}

void sub_244B54710(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;

  v7 = (id)sub_244B64990();
  swift_bridgeObjectRelease();
  objc_msgSend(a4, sel_postNotificationName_object_userInfo_, a1, a2, v7);

}

uint64_t sub_244B54798(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_244B547D4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_244B547E4()
{
  return swift_release();
}

void type metadata accessor for DaemonEventHandlers()
{
  sub_244B549D4();
}

uint64_t sub_244B547F8(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t sub_244B5482C()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_244B54834(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t initializeWithTake for InterprocessError(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t sub_244B54888(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_unknownObjectRelease();
  return a1;
}

uint64_t _s22ProactiveDaemonSupport17InterprocessErrorVwet_0(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 1)
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

uint64_t _s22ProactiveDaemonSupport17InterprocessErrorVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_244B54944(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_244B5494C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

void type metadata accessor for DaemonEventHandlers.SIGTERMDispatchSource()
{
  sub_244B549D4();
}

uint64_t sub_244B54978()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t sub_244B54998(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_244B549A4()
{
  return swift_task_switch();
}

uint64_t sub_244B549B0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_244B549BC@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t sub_244B549C4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_244B549DC()
{
  return swift_task_dealloc();
}

void sub_244B549E8()
{
  JUMPOUT(0x249520AE0);
}

uint64_t sub_244B549F4()
{
  return swift_slowAlloc();
}

uint64_t sub_244B54A08()
{
  return sub_244B648C4();
}

uint64_t ExitReason.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_244B54A40 + 4 * byte_244B659C0[*v0]))(0x73736563637573, 0xE700000000000000);
}

unint64_t sub_244B54A40()
{
  return 0xD000000000000020;
}

ProactiveDaemonSupport::ExitReason_optional __swiftcall ExitReason.init(rawValue:)(Swift::Int32 rawValue)
{
  char *v1;
  char v2;

  if (rawValue >= 8)
    v2 = 8;
  else
    v2 = rawValue;
  *v1 = v2;
  return (ProactiveDaemonSupport::ExitReason_optional)rawValue;
}

uint64_t ExitReason.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_244B54B10(char *a1, char *a2)
{
  return sub_244B50DC8(*a1, *a2);
}

void sub_244B54B1C()
{
  sub_244B50E30();
}

uint64_t sub_244B54B24()
{
  return sub_244B50E5C();
}

void sub_244B54B2C()
{
  sub_244B50EE0();
}

ProactiveDaemonSupport::ExitReason_optional sub_244B54B34(Swift::Int32 *a1)
{
  return ExitReason.init(rawValue:)(*a1);
}

uint64_t sub_244B54B3C@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result;

  result = ExitReason.rawValue.getter();
  *a1 = result;
  return result;
}

void static Exit.exit(_:logger:)(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  _DWORD *v12;
  _QWORD v13[2];

  v4 = sub_244B511A0(&qword_2543FBBC0);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1;
  sub_244B54DD0(a2, (uint64_t)v7);
  v9 = sub_244B648C4();
  if (sub_244B543FC((uint64_t)v7, 1, v9) == 1)
  {
    sub_244B54E18((uint64_t)v7);
  }
  else
  {
    v10 = sub_244B648B8();
    v11 = sub_244B64AE0();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (_DWORD *)swift_slowAlloc();
      v13[1] = swift_slowAlloc();
      *v12 = 136315138;
      __asm { BR              X9 }
    }

    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v7, v9);
  }
  _exit(v8);
}

uint64_t sub_244B54DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_244B511A0(&qword_2543FBBC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_244B54E18(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_244B511A0(&qword_2543FBBC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_244B54E58(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_244B54F28(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_244B54798((uint64_t)v12, *a3);
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
      sub_244B54798((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_244B51240((uint64_t)v12);
  return v7;
}

uint64_t sub_244B54F28(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_244B5507C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_244B64B7C();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_244B55140(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_244B64BF4();
    if (!v8)
    {
      result = sub_244B64C30();
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

void *sub_244B5507C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_244B64C60();
  __break(1u);
  return result;
}

uint64_t sub_244B55140(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_244B551D4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_244B553A8(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_244B553A8((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_244B551D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_244B64A44();
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
  v3 = sub_244B55344(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_244B64BB8();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_244B64C60();
  __break(1u);
LABEL_14:
  result = sub_244B64C30();
  __break(1u);
  return result;
}

_QWORD *sub_244B55344(uint64_t a1, uint64_t a2)
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
  sub_244B511A0(&qword_2573E00E8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_244B553A8(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_244B511A0(&qword_2573E00E8);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
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
    sub_244B55540(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_244B5547C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_244B5547C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_244B64C60();
  __break(1u);
  return result;
}

char *sub_244B55540(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_244B64C60();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_244B555C4()
{
  unint64_t result;

  result = qword_2573E00E0;
  if (!qword_2573E00E0)
  {
    result = MEMORY[0x249520A44](&protocol conformance descriptor for ExitReason, &type metadata for ExitReason);
    atomic_store(result, (unint64_t *)&qword_2573E00E0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ExitReason(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF9)
  {
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
    v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v5 = v6 - 8;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ExitReason(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244B556D4 + 4 * byte_244B659D5[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_244B55708 + 4 * byte_244B659D0[v4]))();
}

uint64_t sub_244B55708(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244B55710(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244B55718);
  return result;
}

uint64_t sub_244B55724(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244B5572CLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_244B55730(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244B55738(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_244B55744(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ExitReason()
{
  return &type metadata for ExitReason;
}

ValueMetadata *type metadata accessor for Exit()
{
  return &type metadata for Exit;
}

_QWORD *sub_244B55780(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD v5[3];

  v2 = sub_244B56054(a1);
  sub_244B64D68();
  if (!v1)
  {
    sub_244B56054(v5);
    sub_244B51260();
    sub_244B64CCC();
    sub_244B54610(0, &qword_2573E0108);
    sub_244B54610(0, &qword_2573E0110);
    v3 = sub_244B64AEC();
    v2 = (_QWORD *)v3;
    if (v3)
    {
      sub_244B56040();
      sub_244B51240((uint64_t)v5);
      sub_244B5605C();
      return v2;
    }
    sub_244B55FEC();
    swift_allocError();
    swift_willThrow();
    sub_244B56040();
    sub_244B51240((uint64_t)v5);
  }
  sub_244B5605C();
  return v2;
}

uint64_t sub_244B558D4(_QWORD *a1, uint64_t a2)
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v9;
  id v10[6];

  v10[5] = *(id *)MEMORY[0x24BDAC8D0];
  v10[0] = 0;
  v3 = objc_msgSend((id)objc_opt_self(), sel_archivedDataWithRootObject_requiringSecureCoding_error_, a2, 1, v10);
  v4 = v10[0];
  if (v3)
  {
    v5 = sub_244B64870();
    v7 = v6;

    sub_244B511E0(a1, a1[3]);
    sub_244B64D80();
    sub_244B55D7C((uint64_t)v10, (uint64_t)v10[3]);
    sub_244B5173C();
    sub_244B64CD8();
    sub_244B50C54(v5, v7);
    return sub_244B51240((uint64_t)v10);
  }
  else
  {
    v9 = v4;
    sub_244B64834();

    return swift_willThrow();
  }
}

_QWORD *sub_244B55A28@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_244B55780(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_244B55A50(_QWORD *a1)
{
  uint64_t *v1;

  return sub_244B558D4(a1, *v1);
}

id InterprocessError.error.getter()
{
  id *v0;
  id v1;

  v1 = *v0;
  sub_244B55A94(*v0);
  return v1;
}

id sub_244B55A94(id a1)
{
  return a1;
}

id InterprocessError.nsError.getter()
{
  uint64_t v0;
  void *v1;
  id v3;
  uint64_t v4;
  void *v5;

  v1 = *(void **)v0;
  if ((*(_BYTE *)(v0 + 8) & 1) != 0)
    return v1;
  v5 = *(void **)v0;
  v3 = v1;
  v4 = sub_244B64828();
  sub_244B5604C(v5);
  return (id)v4;
}

void sub_244B55AFC(id a1)
{

}

uint64_t InterprocessError.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t InterprocessError.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  id v4;
  uint64_t v5;
  void *v7;
  _QWORD v8[4];

  sub_244B511E0(a1, a1[3]);
  sub_244B64D68();
  if (!v2)
  {
    sub_244B511E0(v8, v8[3]);
    sub_244B55C10();
    sub_244B64CCC();
    v4 = v7;
    v5 = NSError.pds_unlaunderSimpleNSError()();

    if (v5)
    {

      v4 = (id)v5;
    }
    sub_244B51240((uint64_t)v8);
    *(_QWORD *)a2 = v4;
    *(_BYTE *)(a2 + 8) = v5 == 0;
  }
  return sub_244B5605C();
}

unint64_t sub_244B55C10()
{
  unint64_t result;

  result = qword_2573E00F0;
  if (!qword_2573E00F0)
  {
    result = MEMORY[0x249520A44](&unk_244B65BC8, &unk_2515B5230);
    atomic_store(result, (unint64_t *)&qword_2573E00F0);
  }
  return result;
}

uint64_t InterprocessError.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  char v3;
  id v4;
  NSError *v5;
  void *v6;
  void *v7;
  _BYTE v9[24];
  uint64_t v10;

  v2 = *(void **)v1;
  v3 = *(_BYTE *)(v1 + 8);
  sub_244B56054(a1);
  sub_244B64D80();
  if ((v3 & 1) != 0)
  {
    sub_244B55D7C((uint64_t)v9, v10);
    sub_244B55DA4();
    sub_244B64CD8();
  }
  else
  {
    swift_getErrorValue();
    v4 = v2;
    Error.pds_launderToSimpleNSError(discardUserInfo:)(v5, 0);
    v7 = v6;
    sub_244B55D7C((uint64_t)v9, v10);
    sub_244B55DA4();
    sub_244B64CD8();

    sub_244B55AFC(v2);
  }
  return sub_244B51240((uint64_t)v9);
}

uint64_t sub_244B55D7C(uint64_t a1, uint64_t a2)
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

unint64_t sub_244B55DA4()
{
  unint64_t result;

  result = qword_2573E00F8;
  if (!qword_2573E00F8)
  {
    result = MEMORY[0x249520A44](&unk_244B65BA0, &unk_2515B5230);
    atomic_store(result, (unint64_t *)&qword_2573E00F8);
  }
  return result;
}

uint64_t sub_244B55DE0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return InterprocessError.init(from:)(a1, a2);
}

uint64_t sub_244B55DF4(_QWORD *a1)
{
  return InterprocessError.encode(to:)(a1);
}

uint64_t static InterprocessError.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  char v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v2 = *(void **)a1;
  v3 = *(_BYTE *)(a1 + 8);
  v4 = *(void **)a2;
  v5 = *(_BYTE *)(a2 + 8);
  v6 = *(void **)a1;
  if ((v3 & 1) != 0)
  {
    sub_244B55A94(v6);
    v7 = v2;
  }
  else
  {
    sub_244B55A94(v6);
    v7 = (void *)sub_244B64828();
    sub_244B5604C(v2);
  }
  sub_244B55A94(v4);
  if ((v5 & 1) != 0)
  {
    v8 = v4;
  }
  else
  {
    v8 = (void *)sub_244B64828();
    sub_244B5604C(v4);
  }
  sub_244B54610(0, &qword_2573E0100);
  v9 = sub_244B64B58();

  return v9 & 1;
}

void type metadata accessor for InterprocessError()
{
  sub_244B549D4();
}

uint64_t _s22ProactiveDaemonSupport17InterprocessErrorVwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  char v4;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_244B55A94(*(id *)a2);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

void _s22ProactiveDaemonSupport17InterprocessErrorVwxx_0(id *a1)
{
  sub_244B55AFC(*a1);
}

uint64_t _s22ProactiveDaemonSupport17InterprocessErrorVwca_0(uint64_t a1, uint64_t a2)
{
  id v3;
  char v4;
  void *v5;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_244B55A94(*(id *)a2);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_244B55AFC(v5);
  return a1;
}

uint64_t _s22ProactiveDaemonSupport17InterprocessErrorVwta_0(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  sub_244B55AFC(v4);
  return a1;
}

void type metadata accessor for InterprocessError.Representation()
{
  sub_244B549D4();
}

void type metadata accessor for InterprocessError.WrappedNSError()
{
  sub_244B549D4();
}

unint64_t sub_244B55FEC()
{
  unint64_t result;

  result = qword_2573E0118;
  if (!qword_2573E0118)
  {
    result = MEMORY[0x249520A44](&unk_244B65C0C, &unk_2515B5210);
    atomic_store(result, (unint64_t *)&qword_2573E0118);
  }
  return result;
}

void type metadata accessor for InterprocessError.WrappedNSError.CouldNotUnarchiveNSError()
{
  sub_244B549D4();
}

uint64_t sub_244B56040()
{
  unint64_t v0;
  uint64_t v1;

  return sub_244B50C54(v1, v0);
}

void sub_244B5604C(id a1)
{
  sub_244B55AFC(a1);
}

_QWORD *sub_244B56054(_QWORD *a1)
{
  uint64_t v1;

  return sub_244B511E0(a1, v1);
}

uint64_t sub_244B5605C()
{
  uint64_t v0;

  return sub_244B51240(v0);
}

uint64_t static MachIdentityToken.newTokenForCurrentProcess()()
{
  task_id_token_t v0;
  uint64_t result;
  task_id_token_t token;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  token = 0;
  if (task_create_identity_token(*MEMORY[0x24BDAEC58], &token))
  {
    sub_244B64BAC();
    sub_244B566A8();
    sub_244B56644();
    sub_244B56690();
    sub_244B56684();
    sub_244B566B0();
    sub_244B566C4();
    result = sub_244B56630();
    __break(1u);
  }
  else
  {
    v0 = token;
    result = sub_244B56674();
    if (!v0)
      __break(1u);
    *(_DWORD *)(result + 16) = v0;
  }
  return result;
}

void MachIdentityToken.__allocating_init(consumingToken:)(int a1)
{
  uint64_t v2;

  v2 = sub_244B56674();
  if (a1)
  {
    *(_DWORD *)(v2 + 16) = a1;
    sub_244B54A00();
  }
  else
  {
    __break(1u);
  }
}

void MachIdentityToken.__allocating_init(copyingToken:)(int a1)
{
  sub_244B56674();
  MachIdentityToken.init(copyingToken:)(a1);
  sub_244B54A00();
}

void MachIdentityToken.init(copyingToken:)(int a1)
{
  uint64_t v1;

  if (a1)
  {
    if (!sub_244B56698(*MEMORY[0x24BDAEC58]))
    {
      *(_DWORD *)(v1 + 16) = a1;
      sub_244B566B8();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  sub_244B5665C();
  sub_244B566A8();
  sub_244B56644();
  sub_244B56690();
  sub_244B56684();
  sub_244B566B0();
  sub_244B566C4();
  sub_244B56630();
  __break(1u);
}

uint64_t MachIdentityToken.init(consumingToken:)(uint64_t result)
{
  uint64_t v1;

  if ((_DWORD)result)
  {
    *(_DWORD *)(v1 + 16) = result;
    return v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void MachIdentityToken.__allocating_init(xpcObject:)()
{
  sub_244B56674();
  MachIdentityToken.init(xpcObject:)();
  sub_244B54A00();
}

uint64_t MachIdentityToken.init(xpcObject:)()
{
  uint64_t v0;
  int v1;

  v1 = xpc_mach_send_copy_right();
  swift_unknownObjectRelease();
  if (v1)
  {
    *(_DWORD *)(v0 + 16) = v1;
  }
  else
  {
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v0;
}

void MachIdentityToken.deinit()
{
  uint64_t v0;

  if (mach_port_deallocate(*MEMORY[0x24BDAEC58], *(_DWORD *)(v0 + 16)))
  {
    sub_244B5665C();
    sub_244B566A8();
    sub_244B56644();
    sub_244B56690();
    sub_244B56684();
    sub_244B566B0();
    sub_244B566C4();
    sub_244B56630();
    __break(1u);
  }
  else
  {
    sub_244B566B8();
  }
}

uint64_t MachIdentityToken.__deallocating_deinit()
{
  MachIdentityToken.deinit();
  return swift_deallocClassInstance();
}

uint64_t MachIdentityToken.xpcObject()()
{
  uint64_t result;

  result = xpc_mach_send_create();
  if (!result)
    __break(1u);
  return result;
}

kern_return_t *_s22ProactiveDaemonSupport17MachIdentityTokenC05auditF0AA05AuditF0VyAA0deF5ErrorVYKF(kern_return_t *a1)
{
  uint64_t v1;
  kern_return_t v3;
  mach_port_t v4;
  kern_return_t v5;
  integer_t task_info_out[4];
  __int128 v8;
  mach_port_t task_port;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  task_port = 0;
  v3 = task_identity_token_get_task_port(*(_DWORD *)(v1 + 16), 3u, &task_port);
  if (v3)
  {
    *a1 = v3;
    task_info_out[0] = v3;
    sub_244B564C8();
    swift_willThrowTypedImpl();
  }
  else
  {
    *(_OWORD *)task_info_out = 0u;
    v8 = 0u;
    v4 = task_port;
    v5 = sub_244B56504(task_info_out, task_port);
    if (v5)
    {
      *a1 = v5;
      sub_244B564C8();
      swift_willThrowTypedImpl();
    }
    else
    {
      a1 = *(kern_return_t **)task_info_out;
    }
    mach_port_deallocate(*MEMORY[0x24BDAEC58], v4);
  }
  return a1;
}

unint64_t sub_244B564C8()
{
  unint64_t result;

  result = qword_2573E0120;
  if (!qword_2573E0120)
  {
    result = MEMORY[0x249520A44](&protocol conformance descriptor for MachIdentityTokenError, &type metadata for MachIdentityTokenError);
    atomic_store(result, (unint64_t *)&qword_2573E0120);
  }
  return result;
}

uint64_t sub_244B56504(task_info_t task_info_out, task_name_t target_task)
{
  mach_msg_type_number_t task_info_outCnt;

  task_info_outCnt = 8;
  return task_info(target_task, 0xFu, task_info_out, &task_info_outCnt);
}

Swift::UInt32 __swiftcall MachIdentityToken.borrowToken()()
{
  uint64_t v0;

  return *(_DWORD *)(v0 + 16);
}

Swift::UInt32 __swiftcall MachIdentityToken.copyToken()()
{
  uint64_t v0;
  Swift::UInt32 v1;
  Swift::UInt32 result;

  v1 = *(_DWORD *)(v0 + 16);
  if (!sub_244B56698(*MEMORY[0x24BDAEC58]))
    return v1;
  sub_244B5665C();
  sub_244B566A8();
  sub_244B56644();
  sub_244B56690();
  sub_244B56684();
  sub_244B566B0();
  sub_244B566C4();
  result = sub_244B56630();
  __break(1u);
  return result;
}

uint64_t MachIdentityTokenError.kr.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t type metadata accessor for MachIdentityToken()
{
  return objc_opt_self();
}

uint64_t method lookup function for MachIdentityToken()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MachIdentityToken.__allocating_init(copyingToken:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of MachIdentityToken.__allocating_init(consumingToken:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of MachIdentityToken.__allocating_init(xpcObject:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

ValueMetadata *type metadata accessor for MachIdentityTokenError()
{
  return &type metadata for MachIdentityTokenError;
}

uint64_t sub_244B56630()
{
  return sub_244B64C3C();
}

uint64_t sub_244B5665C()
{
  return sub_244B64BAC();
}

uint64_t sub_244B56674()
{
  return swift_allocObject();
}

uint64_t sub_244B56684()
{
  return sub_244B64A2C();
}

uint64_t sub_244B56690()
{
  return sub_244B64C90();
}

uint64_t sub_244B56698(ipc_space_t a1)
{
  mach_port_name_t v1;

  return mach_port_mod_refs(a1, v1, 0, 1);
}

uint64_t sub_244B566A8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_244B566B0()
{
  return swift_bridgeObjectRelease();
}

double sub_244B566D0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  unint64_t v6;
  char v7;
  double result;

  if (*(_QWORD *)(a3 + 16) && (v6 = sub_244B57084(a1, a2), (v7 & 1) != 0))
  {
    sub_244B54798(*(_QWORD *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }
  else
  {
    result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t NSError.pds_unlaunderSimpleNSError()()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  _OWORD v19[2];
  _OWORD v20[2];

  v1 = v0;
  v2 = objc_msgSend(v0, sel_userInfo);
  v3 = sub_244B6499C();

  sub_244B566D0(0x657079745F736470, 0xEC000000746E6948, v3, &v17);
  swift_bridgeObjectRelease();
  if (!v18)
    goto LABEL_11;
  sub_244B547D4(&v17, v20);
  sub_244B54798((uint64_t)v20, (uint64_t)&v17);
  if ((sub_244B57A00() & 1) == 0)
  {
LABEL_15:
    sub_244B51240((uint64_t)v20);
    return 0;
  }
  v4 = objc_msgSend(v1, sel_userInfo);
  v5 = sub_244B6499C();

  sub_244B566D0(0x6F7272655F736470, 0xED00006174614472, v5, &v17);
  swift_bridgeObjectRelease();
  if (!v18)
  {
    sub_244B51240((uint64_t)v20);
    sub_244B566B0();
LABEL_11:
    sub_244B579C4((uint64_t)&v17, qword_2543FBBC8);
    return 0;
  }
  sub_244B547D4(&v17, v19);
  sub_244B54798((uint64_t)v19, (uint64_t)&v17);
  if ((sub_244B57A00() & 1) == 0)
  {
    sub_244B566B0();
LABEL_14:
    sub_244B51240((uint64_t)v19);
    goto LABEL_15;
  }
  v6 = sub_244B64BC4();
  sub_244B566B0();
  if (!v6 || (v7 = sub_244B56A38(v6)) == 0)
  {
    sub_244B57A10();
    goto LABEL_14;
  }
  v9 = v7;
  v10 = v8;
  if (qword_2573DFD98 != -1)
    swift_once();
  v15 = v9;
  v16 = v10;
  sub_244B56E58((uint64_t *)&v14);
  sub_244B647F8();
  sub_244B57A10();
  sub_244B51240((uint64_t)v19);
  sub_244B51240((uint64_t)v20);
  sub_244B56EC8(&v14, (uint64_t)&v17);
  sub_244B56EC8(&v17, (uint64_t)&v14);
  sub_244B511A0(&qword_2573E0130);
  sub_244B511A0(&qword_2543FBB20);
  v12 = sub_244B57A00();
  if ((v12 & 1) == 0)
    return 0;
  return v13;
}

uint64_t sub_244B56A38(uint64_t a1)
{
  if (swift_conformsToProtocol2())
    return a1;
  else
    return 0;
}

void __swiftcall Error.pds_launderToSimpleNSError(discardUserInfo:)(NSError *__return_ptr retstr, Swift::Bool discardUserInfo)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t inited;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  __int128 v36[3];
  __int128 v37;
  uint64_t v38;

  v3 = v2;
  v5 = *(_QWORD *)(v2 - 8);
  v6 = ((uint64_t (*)(Swift::Bool))MEMORY[0x24BDAC7A8])(discardUserInfo);
  v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) + 128;
  MEMORY[0x24BDAC7A8](v6, v9);
  v11 = (char *)v36 - v10 + 128;
  swift_getDynamicType();
  sub_244B57A1C((uint64_t)v11);
  v12 = sub_244B64C9C();
  if (v12)
  {
    v13 = (void *)v12;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v3);
  }
  else
  {
    v13 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v14, v11, v3);
  }
  v15 = (void *)sub_244B64828();

  sub_244B57A1C((uint64_t)v8);
  sub_244B511A0(&qword_2573E0138);
  if ((sub_244B57A00() & 1) != 0)
  {
    sub_244B5706C(v36, &v37);
    sub_244B511E0(&v37, v38);
    if (qword_2573DFDA0 != -1)
      swift_once();
    v20 = sub_244B64804();
    v22 = v21;
    sub_244B511A0(&qword_2573E0148);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_244B65CF0;
    strcpy((char *)(inited + 32), "pds_typeHint");
    *(_BYTE *)(inited + 45) = 0;
    *(_WORD *)(inited + 46) = -5120;
    v24 = sub_244B64C00();
    *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
    if (!v25)
      v24 = sub_244B64DB0();
    *(_QWORD *)(inited + 48) = v24;
    *(_QWORD *)(inited + 56) = v25;
    strcpy((char *)(inited + 80), "pds_errorData");
    *(_WORD *)(inited + 94) = -4864;
    *(_QWORD *)(inited + 120) = MEMORY[0x24BDCDDE8];
    *(_QWORD *)(inited + 96) = v20;
    *(_QWORD *)(inited + 104) = v22;
    v17 = sub_244B649B4();
    v16 = sub_244B51240((uint64_t)&v37);
    if (!discardUserInfo)
      goto LABEL_13;
  }
  else
  {
    memset(v36, 0, sizeof(v36));
    sub_244B579C4((uint64_t)v36, &qword_2573E0140);
    v16 = sub_244B649B4();
    v17 = v16;
    if (!discardUserInfo)
    {
LABEL_13:
      v26 = sub_244B57A08(v16, sel_userInfo);
      v19 = sub_244B6499C();

      goto LABEL_14;
    }
  }
  v18 = sub_244B649B4();
  v19 = v18;
LABEL_14:
  v27 = sub_244B57A08(v18, sel_domain);
  v28 = sub_244B649FC();
  v30 = v29;

  v32 = sub_244B57A08(v31, sel_code);
  v33 = sub_244B56F44(v17, v19);
  v34 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  sub_244B56FC0(v28, v30, (uint64_t)v32, v33);

}

uint64_t sub_244B56E3C(uint64_t a1)
{
  return sub_244B56EFC(a1, MEMORY[0x24BDCB268], MEMORY[0x24BDCB260], &qword_2573E1640);
}

uint64_t *sub_244B56E58(uint64_t *a1)
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

uint64_t sub_244B56E94(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x249520AE0);
  return result;
}

uint64_t sub_244B56EC8(__int128 *a1, uint64_t a2)
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

uint64_t sub_244B56EE0(uint64_t a1)
{
  return sub_244B56EFC(a1, MEMORY[0x24BDCB410], MEMORY[0x24BDCB400], &qword_2573E1648);
}

uint64_t sub_244B56EFC(uint64_t a1, void (*a2)(_QWORD), uint64_t (*a3)(void), uint64_t *a4)
{
  uint64_t result;

  a2(0);
  swift_allocObject();
  result = a3();
  *a4 = result;
  return result;
}

uint64_t sub_244B56F44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = a2;
  sub_244B57238(a1, (uint64_t)sub_244B57204, 0, isUniquelyReferenced_nonNull_native, &v8);
  v6 = v8;
  swift_bridgeObjectRelease();
  if (v2)
    swift_bridgeObjectRelease();
  return v6;
}

id sub_244B56FC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v7;
  void *v8;
  id v9;

  v7 = (void *)sub_244B649F0();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v8 = (void *)sub_244B64990();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, a3, v8);

  return v9;
}

_OWORD *sub_244B5706C(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

unint64_t sub_244B57084(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_244B64D2C();
  sub_244B64A20();
  v4 = sub_244B64D5C();
  return sub_244B570E8(a1, a2, v4);
}

unint64_t sub_244B570E8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_244B64CC0() & 1) == 0)
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
      while (!v14 && (sub_244B64CC0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_244B571C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_244B54798(a4, a1);
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_244B57204@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = sub_244B571C8((uint64_t)(a2 + 2), *a1, a1[1], (uint64_t)(a1 + 2));
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_244B57238(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  _OWORD *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t result;
  _OWORD v25[2];
  _OWORD v26[2];
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  sub_244B57764(a1, a2, a3, &v29);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_244B577A0(&v27);
  v7 = *((_QWORD *)&v27 + 1);
  if (!*((_QWORD *)&v27 + 1))
  {
LABEL_14:
    swift_release();
    swift_bridgeObjectRelease();
    sub_244B547E4();
    return swift_release();
  }
  while (1)
  {
    v8 = v27;
    sub_244B547D4(&v28, v26);
    v9 = *a5;
    v11 = sub_244B57084(v8, v7);
    v12 = *(_QWORD *)(v9 + 16);
    v13 = (v10 & 1) == 0;
    v14 = v12 + v13;
    if (__OFADD__(v12, v13))
      break;
    v15 = v10;
    if (*(_QWORD *)(v9 + 24) >= v14)
    {
      if ((a4 & 1) != 0)
      {
        if ((v10 & 1) != 0)
          goto LABEL_9;
      }
      else
      {
        sub_244B511A0(qword_2543FB7C8);
        sub_244B64C18();
        if ((v15 & 1) != 0)
          goto LABEL_9;
      }
    }
    else
    {
      sub_244B57450(v14, a4 & 1);
      v16 = sub_244B57084(v8, v7);
      if ((v15 & 1) != (v17 & 1))
        goto LABEL_17;
      v11 = v16;
      if ((v15 & 1) != 0)
      {
LABEL_9:
        sub_244B54798((uint64_t)v26, (uint64_t)v25);
        sub_244B51240((uint64_t)v26);
        swift_bridgeObjectRelease();
        v18 = (_OWORD *)(*(_QWORD *)(*a5 + 56) + 32 * v11);
        sub_244B51240((uint64_t)v18);
        sub_244B547D4(v25, v18);
        goto LABEL_13;
      }
    }
    v19 = (_QWORD *)*a5;
    *(_QWORD *)(*a5 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    v20 = (uint64_t *)(v19[6] + 16 * v11);
    *v20 = v8;
    v20[1] = v7;
    sub_244B547D4(v26, (_OWORD *)(v19[7] + 32 * v11));
    v21 = v19[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_16;
    v19[2] = v23;
LABEL_13:
    sub_244B577A0(&v27);
    v7 = *((_QWORD *)&v27 + 1);
    a4 = 1;
    if (!*((_QWORD *)&v27 + 1))
      goto LABEL_14;
  }
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  result = sub_244B64CF0();
  __break(1u);
  return result;
}

uint64_t sub_244B57450(uint64_t a1, char a2)
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
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  sub_244B511A0(&qword_2573E0150);
  v6 = sub_244B64C48();
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
    if (!v10)
      goto LABEL_7;
LABEL_6:
    v14 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (i = v14 | (v13 << 6); ; i = __clz(__rbit64(v17)) + (v13 << 6))
    {
      v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * i);
      v21 = *v19;
      v20 = v19[1];
      v22 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * i);
      if ((a2 & 1) != 0)
      {
        sub_244B547D4(v22, v35);
      }
      else
      {
        sub_244B54798((uint64_t)v22, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_244B64D2C();
      sub_244B64A20();
      result = sub_244B64D5C();
      v23 = -1 << *(_BYTE *)(v7 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v11 + 8 * (v24 >> 6))) == 0)
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v23) >> 6;
        while (++v25 != v28 || (v27 & 1) == 0)
        {
          v29 = v25 == v28;
          if (v25 == v28)
            v25 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v11 + 8 * v25);
          if (v30 != -1)
          {
            v26 = __clz(__rbit64(~v30)) + (v25 << 6);
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return result;
      }
      v26 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v11 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
      *(_QWORD *)(v11 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
      v31 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v26);
      *v31 = v21;
      v31[1] = v20;
      result = (uint64_t)sub_244B547D4(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v26));
      ++*(_QWORD *)(v7 + 16);
      if (v10)
        goto LABEL_6;
LABEL_7:
      v16 = v13 + 1;
      if (__OFADD__(v13, 1))
        goto LABEL_40;
      if (v16 >= v33)
        goto LABEL_33;
      v17 = v34[v16];
      ++v13;
      if (!v17)
      {
        v13 = v16 + 1;
        if (v16 + 1 >= v33)
          goto LABEL_33;
        v17 = v34[v13];
        if (!v17)
        {
          v18 = v16 + 2;
          if (v18 >= v33)
          {
LABEL_33:
            swift_release();
            v3 = v2;
            if ((a2 & 1) != 0)
            {
              v32 = 1 << *(_BYTE *)(v5 + 32);
              if (v32 >= 64)
                sub_244B57748(0, (unint64_t)(v32 + 63) >> 6, v34);
              else
                *v34 = -1 << v32;
              *(_QWORD *)(v5 + 16) = 0;
            }
            break;
          }
          v17 = v34[v18];
          if (!v17)
          {
            while (1)
            {
              v13 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_41;
              if (v13 >= v33)
                goto LABEL_33;
              v17 = v34[v13];
              ++v18;
              if (v17)
                goto LABEL_18;
            }
          }
          v13 = v18;
        }
      }
LABEL_18:
      v10 = (v17 - 1) & v17;
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_244B57748(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_244B57764@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
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

uint64_t sub_244B577A0@<X0>(_OWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  void (*v19)(_OWORD *);
  uint64_t result;
  _OWORD v21[3];
  _OWORD v22[3];
  __int128 v23;
  _OWORD v24[2];

  v3 = *v1;
  v4 = v1[1];
  v6 = v1[2];
  v5 = v1[3];
  v7 = v5;
  v8 = v1[4];
  if (v8)
  {
    v9 = (v8 - 1) & v8;
    v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    v11 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    v13 = *v11;
    v12 = v11[1];
    sub_244B54798(*(_QWORD *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(_QWORD *)&v23 = v13;
    *((_QWORD *)&v23 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    v16 = *(_QWORD *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      v9 = (v16 - 1) & v16;
      v10 = __clz(__rbit64(v16)) + (v14 << 6);
      v7 = v14;
      goto LABEL_3;
    }
    v17 = v5 + 2;
    v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      v16 = *(_QWORD *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        v14 = v17;
        goto LABEL_7;
      }
      v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        v16 = *(_QWORD *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          v14 = v5 + 3;
          goto LABEL_7;
        }
        v17 = v5 + 4;
        v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          v16 = *(_QWORD *)(v4 + 8 * v17);
          if (v16)
            goto LABEL_10;
          v14 = v5 + 5;
          v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            v16 = *(_QWORD *)(v4 + 8 * v14);
            if (v16)
              goto LABEL_7;
            v7 = v15 - 1;
            v18 = v5 + 6;
            while (v18 < v15)
            {
              v16 = *(_QWORD *)(v4 + 8 * v18++);
              if (v16)
              {
                v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  v9 = 0;
  memset(v24, 0, sizeof(v24));
  v23 = 0u;
LABEL_23:
  *v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  v19 = (void (*)(_OWORD *))v1[5];
  result = sub_244B5797C((uint64_t)&v23, (uint64_t)v22);
  if (*((_QWORD *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_244B579C4((uint64_t)v21, qword_2573E0160);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_244B5797C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_244B511A0(&qword_2573E0158);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_244B579C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_244B511A0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_244B57A00()
{
  return swift_dynamicCast();
}

id sub_244B57A08(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_244B57A10()
{
  unint64_t v0;
  uint64_t v1;

  return sub_244B50C54(v1, v0);
}

uint64_t sub_244B57A1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

uint64_t static OSVariant.osVariantAllowsInternalSecurityPolicies(subsystem:)(uint64_t a1, uint64_t a2)
{
  return sub_244B57A40(a1, a2, (uint64_t (*)(uint64_t))_pds_os_variant_allows_internal_security_policies);
}

uint64_t static OSVariant.osVariantHasInternalContent(subsystem:)(uint64_t a1, uint64_t a2)
{
  return sub_244B57A40(a1, a2, (uint64_t (*)(uint64_t))_pds_os_variant_has_internal_content);
}

uint64_t sub_244B57A40(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_244B64A08();
  v5 = a3(v4 + 32);
  swift_release();
  return v5;
}

ValueMetadata *type metadata accessor for OSVariant()
{
  return &type metadata for OSVariant;
}

void sub_244B57A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void (*v21)(uint64_t, uint64_t);
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  char *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  char v35;
  char v36;

  v4 = sub_244B511A0(&qword_2543FBBC0);
  v6 = MEMORY[0x24BDAC7A8](v4, v5);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6, v9);
  v11 = (char *)&v34 - v10;
  v12 = sub_244B648C4();
  v13 = *(_QWORD *)(v12 - 8);
  v15 = MEMORY[0x24BDAC7A8](v12, v14);
  v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15, v18);
  v20 = (char *)&v34 - v19;
  v21 = *(void (**)(uint64_t, uint64_t))(a2 + 16);
  v34 = a1;
  v21(a1, a2);
  sub_244B64A08();
  swift_bridgeObjectRelease();
  v22 = _set_user_dir_suffix();
  swift_release();
  if (!v22)
  {
    sub_244B57E94();
    v31 = sub_244B648B8();
    v32 = sub_244B64AC8();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)sub_244B549F4();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_244B4F000, v31, v32, "Sandbox: _set_user_dir_suffix returned nil", v33, 2u);
      sub_244B549E8();
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v17, v12);
    v36 = 7;
    sub_244B57E94();
    sub_244B57EA4((uint64_t)v8);
    v29 = &v36;
    v30 = (uint64_t)v8;
    goto LABEL_10;
  }
  sub_244B57D30(65537);
  if (!v23 || (sub_244B57E2C(), v25 = v24, swift_bridgeObjectRelease(), swift_bridgeObjectRelease(), !v25))
  {
    sub_244B57E94();
    v26 = sub_244B648B8();
    v27 = sub_244B64AC8();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)sub_244B549F4();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_244B4F000, v26, v27, "Sandbox: confstr(_CS_DARWIN_USER_TEMP_DIR) failed", v28, 2u);
      sub_244B549E8();
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v20, v12);
    v35 = 5;
    sub_244B57E94();
    sub_244B57EA4((uint64_t)v11);
    v29 = &v35;
    v30 = (uint64_t)v11;
LABEL_10:
    static Exit.exit(_:logger:)((unsigned __int8 *)v29, v30);
    __break(1u);
  }
}

void sub_244B57D30(int a1)
{
  uint64_t v2;

  v2 = sub_244B64A50();
  *(_QWORD *)(v2 + 16) = 1024;
  bzero((void *)(v2 + 32), 0x400uLL);
  if ((uint64_t)confstr(a1, (char *)(v2 + 32), 0x400uLL) < 1)
    swift_bridgeObjectRelease();
  else
    sub_244B57DAC(v2);
  sub_244B57EB4();
}

uint64_t sub_244B57DAC(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(_QWORD *)(result + 16);
  if (v1)
  {
    v2 = result;
    v3 = *(unsigned __int8 *)(result + 32);
    result += 32;
    if (!v3)
    {
LABEL_6:
      v7 = sub_244B64A14();
      swift_bridgeObjectRelease();
      return v7;
    }
    v4 = 0;
    v5 = v1 - 1;
    while (v5 != v4)
    {
      if (!*(unsigned __int8 *)(v2 + 33 + v4++))
        goto LABEL_6;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_244B57E2C()
{
  uint64_t v0;
  char *v1;

  v0 = sub_244B64A08();
  v1 = realpath_DARWIN_EXTSN((const char *)(v0 + 32), 0);
  swift_release();
  if (v1)
  {
    sub_244B64A38();
    sub_244B549E8();
  }
  sub_244B57EB4();
}

uint64_t sub_244B57E94()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD, uint64_t);
  uint64_t v2;

  return v1(*(_QWORD *)(v2 - 96), v0);
}

uint64_t sub_244B57EA4(uint64_t a1)
{
  uint64_t v1;

  return sub_244B53AA4(a1, 0, 1, v1);
}

uint64_t type metadata accessor for SendableLazy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_244B52210(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SendableLazy);
}

uint64_t sub_244B57ED0()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_244B57F48(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;

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
LABEL_18:
    swift_retain();
    return v3;
  }
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
    v11 = a2[1];
    *v3 = *a2;
    v3[1] = v11;
    *((_BYTE *)v3 + v5) = 0;
    goto LABEL_18;
  }
  (*(void (**)(uint64_t *))(v4 + 16))(a1);
  *((_BYTE *)v3 + v5) = 1;
  return v3;
}

uint64_t sub_244B5805C(uint64_t a1, uint64_t a2)
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
      return (*(uint64_t (**)(void))(v2 + 8))();
    else
      return swift_release();
  }
  else
  {
    if (v3 <= 3)
      v5 = v3;
    else
      v5 = 4;
    return ((uint64_t (*)(void))((char *)&loc_244B580A4 + 4 * byte_244B65D25[v5]))();
  }
}

_QWORD *sub_244B580FC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

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
    (*(void (**)(_QWORD *))(v4 + 16))(a1);
    v8 = 1;
  }
  else
  {
    v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    swift_retain();
    v8 = 0;
  }
  *((_BYTE *)a1 + v5) = v8;
  return a1;
}

_QWORD *sub_244B581D4(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
      (*(void (**)(_QWORD *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    else
      swift_release();
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
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
      *((_BYTE *)a1 + v7) = 1;
    }
    else
    {
      v12 = a2[1];
      *a1 = *a2;
      a1[1] = v12;
      *((_BYTE *)a1 + v7) = 0;
      swift_retain();
    }
  }
  return a1;
}

_OWORD *sub_244B58364(_OWORD *a1, _OWORD *a2, uint64_t a3)
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
    (*(void (**)(_OWORD *))(v4 + 32))(a1);
    v8 = 1;
  }
  else
  {
    v8 = 0;
    *a1 = *a2;
  }
  *((_BYTE *)a1 + v5) = v8;
  return a1;
}

_OWORD *sub_244B58438(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  char v12;

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
      (*(void (**)(_OWORD *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    else
      swift_release();
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
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
      v12 = 1;
    }
    else
    {
      v12 = 0;
      *a1 = *a2;
    }
    *((_BYTE *)a1 + v7) = v12;
  }
  return a1;
}

uint64_t sub_244B585C4(uint64_t a1, unsigned int a2, uint64_t a3)
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
  return ((uint64_t (*)(void))((char *)&loc_244B58688 + 4 * byte_244B65D48[(v4 - 1)]))();
}

void sub_244B586D4(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  char v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (v5 <= 0x10)
    v5 = 16;
  v6 = v5 + 1;
  v7 = 8 * (v5 + 1);
  if (a3 < 0xFF)
  {
    v8 = 0;
  }
  else if (v6 <= 3)
  {
    v10 = ((a3 + ~(-1 << v7) - 254) >> v7) + 1;
    if (HIWORD(v10))
    {
      v8 = 4u;
    }
    else if (v10 >= 0x100)
    {
      v8 = 2;
    }
    else
    {
      v8 = v10 > 1;
    }
  }
  else
  {
    v8 = 1u;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v9 = a2 - 255;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v11 = v9 & ~(-1 << v7);
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v11;
        *((_BYTE *)a1 + 2) = BYTE2(v11);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v11;
      }
      else
      {
        *(_BYTE *)a1 = v11;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v9;
  }
  __asm { BR              X10 }
}

uint64_t sub_244B58878(uint64_t a1, uint64_t a2)
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
  return ((uint64_t (*)(void))((char *)&loc_244B588C0 + 4 * byte_244B65D56[v3]))();
}

void sub_244B58908(_BYTE *a1, unsigned int a2, uint64_t a3)
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

uint64_t type metadata accessor for SendableLazy.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_244B52210(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SendableLazy.State);
}

uint64_t static Task<>.pds_xpcCallback<A>(priority:callback:body:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[4];

  v12 = sub_244B511A0((uint64_t *)&unk_2543FBBA8);
  MEMORY[0x24BDAC7A8](v12, v13);
  v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244B58B98(a1, (uint64_t)v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = a6;
  v16[5] = a4;
  v16[6] = a5;
  v16[7] = a2;
  v16[8] = a3;
  v17 = sub_244B64AA4();
  LODWORD(a4) = sub_244B543FC((uint64_t)v15, 1, v17);
  swift_retain();
  swift_retain();
  if ((_DWORD)a4 == 1)
  {
    sub_244B58FB0((uint64_t)v15);
    v18 = 0;
    v19 = 0;
  }
  else
  {
    sub_244B64A98();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v15, v17);
    if (v16[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v18 = sub_244B64A5C();
      v19 = v20;
      swift_unknownObjectRelease();
    }
    else
    {
      v18 = 0;
      v19 = 0;
    }
  }
  if (v19 | v18)
  {
    v22[0] = 0;
    v22[1] = 0;
    v22[2] = v18;
    v22[3] = v19;
  }
  return swift_task_create();
}

uint64_t sub_244B58B98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_244B511A0((uint64_t *)&unk_2543FBBA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_244B58BE0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t);

  v8[7] = a7;
  v8[8] = a8;
  v8[6] = a6;
  v11 = sub_244B64B64();
  v8[9] = v11;
  v8[10] = *(_QWORD *)(v11 - 8);
  v8[11] = swift_task_alloc();
  v8[12] = *(_QWORD *)(a8 - 8);
  v12 = swift_task_alloc();
  v8[13] = v12;
  v15 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v13 = (_QWORD *)swift_task_alloc();
  v8[14] = v13;
  *v13 = v8;
  v13[1] = sub_244B58CA4;
  return v15(v12);
}

uint64_t sub_244B58CA4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244B58D08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, _QWORD);

  v2 = *(_QWORD *)(v0 + 96);
  v1 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD *)(v0 + 72);
  v7 = *(void (**)(uint64_t, _QWORD))(v0 + 48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v1, v6);
  sub_244B53AA4(v3, 0, 1, v6);
  v7(v3, 0);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v6);
  sub_244B58FF0();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B58DBC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  char v6;
  NSError *v7;
  void *v8;
  void *v9;

  v1 = *(void **)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 72);
  v5 = *(void (**)(uint64_t, void *))(v0 + 48);
  sub_244B53AA4(v2, 1, 1, *(_QWORD *)(v0 + 64));
  swift_getErrorValue();
  v6 = sub_244B51664();
  Error.pds_launderToSimpleNSError(discardUserInfo:)(v7, v6 & 1);
  v9 = v8;
  v5(v2, v8);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_244B58FF0();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B58EA0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244B58ED4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (int *)v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_244B58F68;
  return sub_244B58BE0(a1, v4, v5, v7, v8, v9, v10, v6);
}

uint64_t sub_244B58F68()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_244B58FB0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_244B511A0((uint64_t *)&unk_2543FBBA8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_244B58FF0()
{
  return swift_task_dealloc();
}

uint64_t sub_244B58FFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  _BYTE v11[8];

  v7 = type metadata accessor for WeakReference(0, *(_QWORD *)(a3 + a2 - 8), a3, a4);
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  v9 = MEMORY[0x249520B88](v11);
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v11, v7);
  *a5 = v9;
  return result;
}

uint64_t sub_244B5907C()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_244B5908C()
{
  return 8;
}

_QWORD *sub_244B59098(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_244B590B8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_244B590D8(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
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
  *(_BYTE *)(result + 8) = v3;
  return result;
}

uint64_t type metadata accessor for WeakReference(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_244B52210(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for WeakReference);
}

void sub_244B5910C(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  unint64_t v30;
  uint64_t value;
  uint64_t v32;
  BOOL v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  int v45;
  _DWORD *v46;
  id v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  const void *bytes_ptr;
  const void *v55;
  size_t length;
  size_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  int v64;
  _DWORD *v65;
  id v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _DWORD *v73;
  _DWORD *v74;
  uint64_t v75;
  uint8_t *v76;
  uint64_t v77;
  uint64_t v78[4];

  v2 = v1;
  v4 = sub_244B511A0((uint64_t *)&unk_2543FB7B0);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_244B648C4();
  v9 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x24BDAC7A8](v8, v10);
  v13 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v11, v14);
  v17 = (char *)&v72 - v16;
  MEMORY[0x24BDAC7A8](v15, v18);
  v20 = (char *)&v72 - v19;
  v21 = MEMORY[0x249520C6C](v2);
  if (sub_244B648F4() == v21)
  {
    v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEF8]), sel_init);
    v30 = sub_244B5AB54();
LABEL_19:
    *(_QWORD *)(a1 + 24) = v30;
    *(_QWORD *)a1 = v29;
    return;
  }
  if (sub_244B64918() == v21)
  {
    value = xpc_int64_get_value(v2);
    v32 = MEMORY[0x24BEE4008];
LABEL_22:
    *(_QWORD *)(a1 + 24) = v32;
    *(_QWORD *)a1 = value;
    return;
  }
  if (sub_244B6493C() == v21)
  {
    value = xpc_uint64_get_value(v2);
    v32 = MEMORY[0x24BEE4568];
    goto LABEL_22;
  }
  if (sub_244B648D0() == v21)
  {
    v33 = xpc_BOOL_get_value(v2);
    *(_QWORD *)(a1 + 24) = MEMORY[0x24BEE1328];
    *(_BYTE *)a1 = v33;
    return;
  }
  if (sub_244B64924() == v21)
  {
    v34 = xpc_double_get_value(v2);
    *(_QWORD *)(a1 + 24) = MEMORY[0x24BEE13C8];
    *(double *)a1 = v34;
    return;
  }
  if (sub_244B64930() == v21)
  {
    if (!xpc_string_get_string_ptr(v2))
    {
      if (qword_2543FBB68 != -1)
        swift_once();
      v41 = sub_244B511A0(&qword_2543FBBC0);
      v42 = sub_244B59C8C(v41, (uint64_t)qword_2543FBB50);
      sub_244B5AC20();
      if (!sub_244B5AC14(v42))
      {
        sub_244B5AC54((uint64_t)v20, v42, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16));
        sub_244B5AC5C();
        v43 = sub_244B648B8();
        v44 = sub_244B64AC8();
        v45 = v44;
        if (os_log_type_enabled(v43, v44))
        {
          LODWORD(v76) = v45;
          v46 = (_DWORD *)sub_244B5AC30();
          v75 = sub_244B5AC30();
          v78[0] = v75;
          *v46 = 136315138;
          v73 = v46 + 1;
          v74 = v46;
          v47 = objc_msgSend(v2, sel_description);
          v48 = sub_244B649FC();
          v50 = v49;

          v51 = sub_244B54E58(v48, v50, v78);
          sub_244B5ABF8(v51);
          sub_244B5ABEC();
          swift_bridgeObjectRelease();
          sub_244B5AC38(&dword_244B4F000, v43, v52, "Failed to get string pointer of XPC object: %s");
          sub_244B5AC68();
          sub_244B549E8();
        }

        sub_244B5ABEC();
        (*(void (**)(char *, uint64_t))(v9 + 8))(v20, v8);
      }
      goto LABEL_50;
    }
    v35 = sub_244B64A38();
    v37 = MEMORY[0x24BEE0D00];
    goto LABEL_27;
  }
  if (sub_244B64900() == v21)
  {
    v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_initWithUUIDBytes_, xpc_uuid_get_bytes(v2));
    v39 = objc_msgSend(v38, sel_UUIDString);
    sub_244B649FC();

    sub_244B648A0();
    swift_bridgeObjectRelease();
    v40 = sub_244B648AC();
    if (sub_244B5AC14((uint64_t)v7) != 1)
    {
      *(_QWORD *)(a1 + 24) = v40;
      v53 = sub_244B56E58((uint64_t *)a1);
      sub_244B5AC54((uint64_t)v53, (uint64_t)v7, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 32));

      return;
    }

    sub_244B579C4((uint64_t)v7, (uint64_t *)&unk_2543FB7B0);
    goto LABEL_50;
  }
  if (sub_244B648E8() == v21)
  {
    xpc_date_get_value_absolute();
    *(_QWORD *)(a1 + 24) = sub_244B64894();
    sub_244B56E58((uint64_t *)a1);
    sub_244B64888();
    return;
  }
  if (sub_244B648DC() == v21)
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v2);
    if (!bytes_ptr)
    {
      if (qword_2543FBB68 != -1)
        swift_once();
      v60 = sub_244B511A0(&qword_2543FBBC0);
      v61 = sub_244B59C8C(v60, (uint64_t)qword_2543FBB50);
      sub_244B5AC20();
      if (!sub_244B5AC14(v61))
      {
        sub_244B5AC54((uint64_t)v17, v61, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16));
        sub_244B5AC5C();
        v62 = sub_244B648B8();
        v63 = sub_244B64AC8();
        v64 = v63;
        if (os_log_type_enabled(v62, v63))
        {
          LODWORD(v76) = v64;
          v65 = (_DWORD *)sub_244B5AC30();
          v75 = sub_244B5AC30();
          v78[0] = v75;
          *v65 = 136315138;
          v73 = v65 + 1;
          v74 = v65;
          v66 = objc_msgSend(v2, sel_description);
          v67 = sub_244B649FC();
          v69 = v68;

          v70 = sub_244B54E58(v67, v69, v78);
          sub_244B5ABF8(v70);
          sub_244B5ABEC();
          swift_bridgeObjectRelease();
          sub_244B5AC38(&dword_244B4F000, v62, v71, "Failed to get data pointer of XPC object: %s");
          sub_244B5AC68();
          sub_244B549E8();
        }

        sub_244B5ABEC();
        (*(void (**)(char *, uint64_t))(v9 + 8))(v17, v8);
      }
      goto LABEL_50;
    }
    v55 = bytes_ptr;
    length = xpc_data_get_length(v2);
    v35 = MEMORY[0x249520114](v55, length);
    v37 = MEMORY[0x24BDCDDE8];
LABEL_27:
    *(_QWORD *)(a1 + 24) = v37;
    *(_QWORD *)a1 = v35;
    *(_QWORD *)(a1 + 8) = v36;
    return;
  }
  if (sub_244B6490C() == v21)
  {
    v57 = sub_244B5A230(v2);
    if (v57)
    {
      v29 = (id)v57;
      v58 = (uint64_t *)&unk_2573E02F8;
LABEL_43:
      v30 = sub_244B511A0(v58);
      goto LABEL_19;
    }
  }
  else
  {
    if (sub_244B64954() != v21)
    {
      if (qword_2543FBB68 != -1)
        swift_once();
      v22 = sub_244B511A0(&qword_2543FBBC0);
      v23 = sub_244B59C8C(v22, (uint64_t)qword_2543FBB50);
      sub_244B5AC20();
      if (!sub_244B5AC14(v23))
      {
        sub_244B5AC54((uint64_t)v13, v23, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16));
        v24 = sub_244B648B8();
        v25 = sub_244B64AC8();
        if (os_log_type_enabled(v24, v25))
        {
          v26 = (uint8_t *)sub_244B5AC30();
          v78[0] = sub_244B5AC30();
          *(_DWORD *)v26 = 136315138;
          v76 = v26 + 4;
          v27 = MEMORY[0x249520480](v21);
          v77 = sub_244B54E58(v27, v28, v78);
          sub_244B64B70();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_244B4F000, v24, v25, "Unsupported XPC object type %s", v26, 0xCu);
          sub_244B5AC68();
          sub_244B549E8();
        }

        (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
      }
      goto LABEL_50;
    }
    v59 = sub_244B5A7D0(v2);
    if (v59)
    {
      v29 = (id)v59;
      v58 = (uint64_t *)&unk_2543FB7C0;
      goto LABEL_43;
    }
  }
LABEL_50:
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
}

BOOL sub_244B598F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t ObjectType;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20[3];
  uint64_t v21;
  _OWORD v22[2];

  v0 = sub_244B648C4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2);
  v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_244B64A38();
  v7 = v6;
  ObjectType = swift_getObjectType();
  sub_244B5910C(v20, ObjectType);
  v9 = v21;
  if (v21)
  {
    sub_244B547D4(v20, v22);
    sub_244B54798((uint64_t)v22, (uint64_t)v20);
    sub_244B59BAC((uint64_t)v20, v5, v7);
    sub_244B51240((uint64_t)v22);
  }
  else
  {
    sub_244B579C4((uint64_t)v20, qword_2543FBBC8);
    if (qword_2543FBB68 != -1)
      swift_once();
    v10 = sub_244B511A0(&qword_2543FBBC0);
    v11 = sub_244B59C8C(v10, (uint64_t)qword_2543FBB50);
    swift_beginAccess();
    if (sub_244B543FC(v11, 1, v0))
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v11, v0);
      swift_bridgeObjectRetain();
      v12 = sub_244B648B8();
      v13 = sub_244B64AC8();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = (uint8_t *)swift_slowAlloc();
        v18 = swift_slowAlloc();
        v20[0] = v18;
        *(_DWORD *)v14 = 136315138;
        v17[1] = v14 + 4;
        swift_bridgeObjectRetain();
        v19 = sub_244B54E58(v5, v7, v20);
        sub_244B64B70();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_244B4F000, v12, v13, "Failed to get value in XPC dictionary for key: %s", v14, 0xCu);
        v15 = v18;
        swift_arrayDestroy();
        MEMORY[0x249520AE0](v15, -1, -1);
        MEMORY[0x249520AE0](v14, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    }
  }
  return v9 != 0;
}

uint64_t sub_244B59BAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD v6[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_244B547D4((_OWORD *)a1, v6);
    sub_244B5A030(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_244B579C4(a1, qword_2543FBBC8);
    sub_244B59F0C(a2, a3, v6);
    swift_bridgeObjectRelease();
    return sub_244B579C4((uint64_t)v6, qword_2543FBBC8);
  }
}

uint64_t sub_244B59C3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  char v6;

  v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v6 = v5(a2, a3);
  swift_unknownObjectRelease();
  return v6 & 1;
}

uint64_t sub_244B59C8C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

char *sub_244B59CA4(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

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
    sub_244B511A0(&qword_2573E0310);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_244B59E88((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_244B59D90(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_244B59D90(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_244B64C60();
  __break(1u);
  return result;
}

char *sub_244B59E88(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_244B64C60();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

double sub_244B59F0C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  double result;
  uint64_t v11;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_244B57084(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    *v4 = 0x8000000000000000;
    sub_244B511A0(qword_2543FB7C8);
    sub_244B64C0C();
    swift_bridgeObjectRelease();
    sub_244B547D4((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), a3);
    sub_244B64C24();
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_244B5A030(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_244B5A0AC(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

_OWORD *sub_244B5A0AC(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  _QWORD *v15;
  _OWORD *v16;
  _OWORD *result;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_244B57084(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  sub_244B511A0(qword_2543FB7C8);
  if ((sub_244B64C0C() & 1) == 0)
    goto LABEL_5;
  v13 = sub_244B57084(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = (_OWORD *)sub_244B64CF0();
    __break(1u);
    return result;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = (_OWORD *)(v15[7] + 32 * v11);
    sub_244B51240((uint64_t)v16);
    return sub_244B547D4(a1, v16);
  }
  else
  {
    sub_244B5A1C8(v11, a2, a3, a1, v15);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

_OWORD *sub_244B5A1C8(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_244B547D4(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

size_t sub_244B5A230(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  size_t result;
  __int128 v25;
  size_t v26;
  size_t v27;
  uint64_t *v28;
  id v29;
  uint64_t ObjectType;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  char *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  void *v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  unint64_t v54;

  v2 = sub_244B648C4();
  v3 = *(_QWORD *)(v2 - 8);
  v5 = MEMORY[0x24BDAC7A8](v2, v4);
  v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5, v8);
  v10 = (char *)&v46 - v9;
  v11 = MEMORY[0x249520C6C](a1);
  if (v11 != sub_244B6490C())
  {
    if (qword_2543FBB68 == -1)
      goto LABEL_3;
    goto LABEL_34;
  }
  result = xpc_array_get_count(a1);
  if ((result & 0x8000000000000000) == 0)
  {
    v26 = result;
    if (!result)
      return MEMORY[0x24BEE4AF8];
    v27 = 0;
    v14 = (char *)MEMORY[0x24BEE4AF8];
    v28 = (uint64_t *)&unk_2543FBBC8;
    *(_QWORD *)&v25 = 134217984;
    v48 = v25;
    v49 = a1;
    while (v26 != v27)
    {
      v29 = xpc_array_get_value(a1, v27);
      ObjectType = swift_getObjectType();
      sub_244B5910C(&v51, ObjectType);
      swift_unknownObjectRelease();
      if (v52)
      {
        sub_244B547D4(&v51, &v53);
        sub_244B54798((uint64_t)&v53, (uint64_t)&v51);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v14 = sub_244B59CA4(0, *((_QWORD *)v14 + 2) + 1, 1, (uint64_t)v14);
        v32 = *((_QWORD *)v14 + 2);
        v31 = *((_QWORD *)v14 + 3);
        v7 = (char *)(v32 + 1);
        if (v32 >= v31 >> 1)
          v14 = sub_244B59CA4((char *)(v31 > 1), v32 + 1, 1, (uint64_t)v14);
        *((_QWORD *)v14 + 2) = v7;
        sub_244B547D4(&v51, &v14[32 * v32 + 32]);
        sub_244B51240((uint64_t)&v53);
      }
      else
      {
        sub_244B579C4((uint64_t)&v51, v28);
        if (qword_2543FBB68 != -1)
          swift_once();
        v33 = sub_244B511A0(&qword_2543FBBC0);
        v34 = sub_244B59C8C(v33, (uint64_t)qword_2543FBB50);
        swift_beginAccess();
        if (!sub_244B543FC(v34, 1, v2))
        {
          (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v10, v34, v2);
          v35 = sub_244B648B8();
          v36 = sub_244B64AC8();
          if (os_log_type_enabled(v35, v36))
          {
            v37 = v10;
            v38 = v2;
            v39 = v28;
            v40 = v3;
            v41 = swift_slowAlloc();
            *(_DWORD *)v41 = v48;
            *(_QWORD *)(v41 + 4) = v27;
            _os_log_impl(&dword_244B4F000, v35, v36, "Failed to get value in XPC array at index: %ld", (uint8_t *)v41, 0xCu);
            v42 = v41;
            v3 = v40;
            v28 = v39;
            v2 = v38;
            v10 = v37;
            a1 = v49;
            MEMORY[0x249520AE0](v42, -1, -1);
          }

          (*(void (**)(char *, uint64_t))(v3 + 8))(v10, v2);
        }
        v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEF8]), sel_init);
        v54 = sub_244B5AB54();
        *(_QWORD *)&v53 = v43;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v14 = sub_244B59CA4(0, *((_QWORD *)v14 + 2) + 1, 1, (uint64_t)v14);
        v45 = *((_QWORD *)v14 + 2);
        v44 = *((_QWORD *)v14 + 3);
        v7 = (char *)(v45 + 1);
        if (v45 >= v44 >> 1)
          v14 = sub_244B59CA4((char *)(v44 > 1), v45 + 1, 1, (uint64_t)v14);
        *((_QWORD *)v14 + 2) = v7;
        sub_244B547D4(&v53, &v14[32 * v45 + 32]);
      }
      if (v26 == ++v27)
        return (size_t)v14;
    }
    __break(1u);
LABEL_34:
    swift_once();
LABEL_3:
    v12 = sub_244B511A0(&qword_2543FBBC0);
    v13 = sub_244B59C8C(v12, (uint64_t)qword_2543FBB50);
    swift_beginAccess();
    v14 = 0;
    if (!sub_244B543FC(v13, 1, v2))
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v7, v13, v2);
      swift_unknownObjectRetain_n();
      v15 = sub_244B648B8();
      v16 = sub_244B64AC8();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = (uint8_t *)swift_slowAlloc();
        *(_QWORD *)&v48 = swift_slowAlloc();
        *(_QWORD *)&v51 = v48;
        *(_DWORD *)v17 = 136315138;
        v18 = objc_msgSend(a1, sel_description, v17 + 4);
        v19 = sub_244B649FC();
        v47 = v3;
        v20 = v19;
        v22 = v21;

        v50 = sub_244B54E58(v20, v22, (uint64_t *)&v51);
        sub_244B64B70();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_244B4F000, v15, v16, "XPC object %s is not of type array", v17, 0xCu);
        v23 = v48;
        swift_arrayDestroy();
        MEMORY[0x249520AE0](v23, -1, -1);
        MEMORY[0x249520AE0](v17, -1, -1);

        (*(void (**)(char *, uint64_t))(v47 + 8))(v7, v2);
      }
      else
      {

        swift_unknownObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
      }
      return 0;
    }
    return (size_t)v14;
  }
  __break(1u);
  return result;
}

uint64_t sub_244B5A7D0(void *a1)
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
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v25[2];
  uint8_t *v26;
  uint64_t v27;
  _QWORD aBlock[7];
  uint64_t v29;

  v2 = sub_244B648C4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x249520C6C](a1);
  if (v7 != sub_244B64954())
  {
    if (qword_2543FBB68 != -1)
      swift_once();
    v8 = sub_244B511A0(&qword_2543FBBC0);
    v9 = sub_244B59C8C(v8, (uint64_t)qword_2543FBB50);
    swift_beginAccess();
    v10 = 0;
    if (!sub_244B543FC(v9, 1, v2))
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v9, v2);
      swift_unknownObjectRetain_n();
      v11 = sub_244B648B8();
      v12 = sub_244B64AC8();
      if (os_log_type_enabled(v11, v12))
      {
        v13 = (uint8_t *)swift_slowAlloc();
        v27 = swift_slowAlloc();
        v29 = v27;
        v26 = v13;
        *(_DWORD *)v13 = 136315138;
        v25[1] = v13 + 4;
        v14 = objc_msgSend(a1, sel_description);
        v15 = sub_244B649FC();
        v17 = v16;

        aBlock[6] = sub_244B54E58(v15, v17, &v29);
        sub_244B64B70();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        v18 = v26;
        _os_log_impl(&dword_244B4F000, v11, v12, "XPC object %s is not of type dictionary", v26, 0xCu);
        v19 = v27;
        swift_arrayDestroy();
        MEMORY[0x249520AE0](v19, -1, -1);
        MEMORY[0x249520AE0](v18, -1, -1);

      }
      else
      {

        swift_unknownObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      return 0;
    }
    return v10;
  }
  v29 = MEMORY[0x24BEE4B00];
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = &v29;
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = sub_244B5AB9C;
  *(_QWORD *)(v21 + 24) = v20;
  aBlock[4] = sub_244B5ABB0;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244B59C3C;
  aBlock[3] = &unk_2515B59F8;
  v22 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  xpc_dictionary_apply(a1, v22);
  _Block_release(v22);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    v10 = v29;
    swift_release();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_244B5AB54()
{
  unint64_t result;

  result = qword_2573E0300;
  if (!qword_2573E0300)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2573E0300);
  }
  return result;
}

uint64_t sub_244B5AB90()
{
  return sub_244B5AC4C();
}

BOOL sub_244B5AB9C()
{
  return sub_244B598F4();
}

uint64_t sub_244B5ABA4()
{
  return sub_244B5AC4C();
}

uint64_t sub_244B5ABB0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_244B5ABD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_244B5ABE4()
{
  return swift_release();
}

uint64_t sub_244B5ABEC()
{
  return swift_unknownObjectRelease_n();
}

uint64_t sub_244B5ABF8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 136) = a1;
  return sub_244B64B70();
}

uint64_t sub_244B5AC14(uint64_t a1)
{
  uint64_t v1;

  return sub_244B543FC(a1, 1, v1);
}

uint64_t sub_244B5AC20()
{
  return swift_beginAccess();
}

uint64_t sub_244B5AC30()
{
  return swift_slowAlloc();
}

void sub_244B5AC38(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  uint64_t v4;

  _os_log_impl(a1, a2, (os_log_type_t)*(_DWORD *)(v4 - 144), a4, *(uint8_t **)(v4 - 160), 0xCu);
}

uint64_t sub_244B5AC4C()
{
  return swift_deallocObject();
}

uint64_t sub_244B5AC54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t sub_244B5AC5C()
{
  return swift_unknownObjectRetain_n();
}

uint64_t sub_244B5AC68()
{
  return swift_arrayDestroy();
}

uint64_t sub_244B5AC70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  v7 = sub_244B60178((uint64_t)v6, a2);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
  return v7;
}

id static XPCService.xpcInterface()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;

  sub_244B609BC();
  v3 = (void *)(*(uint64_t (**)(void))(v2 + 16))();
  v4 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, v3);

  v11 = v1;
  v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 40))(v1, v0);
  v5 = *(_QWORD *)(v12 + 16);
  if (v5)
  {
    v6 = v12 + 48;
    do
    {
      v7 = *(_QWORD *)(v6 - 16);
      v8 = *(_QWORD *)(v6 - 8);
      v6 += 24;
      swift_bridgeObjectRetain();
      v9 = (void *)sub_244B64ABC();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_setClasses_forSelector_argumentIndex_ofReply_, v9, v7, v8, 1);

      --v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  (*(void (**)(id, uint64_t))(v0 + 56))(v4, v11);
  return v4;
}

uint64_t XPCServiceClientConnection.__allocating_init(delegate:)()
{
  uint64_t v0;

  sub_244B609BC();
  sub_244B6084C();
  v0 = swift_allocObject();
  XPCServiceClientConnection.init(delegate:)();
  return v0;
}

uint64_t *XPCServiceClientConnection.init(delegate:)()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  sub_244B609BC();
  v2 = *v1;
  v1[4] = 0;
  v3 = sub_244B609EC();
  v4 = *(_QWORD *)(v2 + 80);
  v5 = *(_QWORD *)(v2 + 88);
  v9 = 0;
  v7 = sub_244B60A00(v3, v4, v5, v6);
  v1[2] = sub_244B5AC70((uint64_t)&v9, v7);
  v1[4] = v0;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v1;
}

uint64_t type metadata accessor for XPCServiceClientConnection.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_244B52210(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for XPCServiceClientConnection.State);
}

_QWORD *XPCServiceClientConnection.deinit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = v4[2];
  v6 = *(_QWORD *)(*v4 + 88);
  v11 = *(_QWORD *)(*v4 + 80);
  v12 = v6;
  v7 = sub_244B60A00(a1, v11, v6, a4);
  v8 = sub_244B511A0((uint64_t *)&unk_2543FBB88);
  sub_244B60804((void (*)(uint64_t))sub_244B5AF84, (uint64_t)&v10, v5, v7, v8);
  swift_release();
  sub_244B5AFD4((uint64_t)(v4 + 3));
  return v4;
}

id *sub_244B5AF84@<X0>(id *result@<X0>, BOOL *a2@<X8>)
{
  id v3;

  v3 = *result;
  if (*result)
    result = (id *)objc_msgSend(*result, sel_invalidate);
  *a2 = v3 == 0;
  return result;
}

uint64_t sub_244B5AFD4(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t XPCServiceClientConnection.__deallocating_deinit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  XPCServiceClientConnection.deinit(a1, a2, a3, a4);
  sub_244B6084C();
  return swift_deallocClassInstance();
}

uint64_t sub_244B5B010(id *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(void);
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  _QWORD *v34;
  void *v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  uint64_t result;
  char *v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  unint64_t v46;
  os_log_t v47;
  char *v48;
  uint8_t *v49;
  uint8_t *v50;
  uint64_t v51;
  void (*v52)(void);
  os_log_t v53;
  uint64_t (*v54)(char *, uint64_t);
  uint64_t v55;
  char *v56;
  uint64_t v57;
  os_log_t aBlock;
  uint64_t v59;
  uint64_t (*v60)(uint64_t);
  void *v61;
  uint64_t (*v62)();
  _QWORD *v63;
  uint64_t v64;

  v4 = *v1;
  v57 = sub_244B648C4();
  v5 = *(_QWORD *)(v57 - 8);
  v7 = MEMORY[0x24BDAC7A8](v57, v6);
  v56 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)&v49 - v10;
  if (MEMORY[0x249520B88](v1 + 3))
  {
    v12 = v1[4];
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v12 + 32))(ObjectType, v12);
    if (v2 || *a1)
      return swift_unknownObjectRelease();
    v14 = *(_QWORD *)(v4 + 80);
    v15 = *(_QWORD *)(v4 + 88);
    v16 = *(void (**)(void))(v15 + 48);
    v55 = v14;
    v52 = v16;
    v16();
    v17 = sub_244B648B8();
    v18 = sub_244B64AE0();
    LODWORD(v54) = v18;
    if (os_log_type_enabled(v17, v18))
    {
      v53 = v17;
      v19 = (uint8_t *)swift_slowAlloc();
      v51 = swift_slowAlloc();
      aBlock = (os_log_t)v51;
      *(_DWORD *)v19 = 136315138;
      v49 = v19 + 4;
      v50 = v19;
      v20 = (*(uint64_t (**)(uint64_t))(v15 + 24))(v55);
      v64 = sub_244B54E58(v20, v21, (uint64_t *)&aBlock);
      sub_244B64B70();
      swift_bridgeObjectRelease();
      v22 = v50;
      _os_log_impl(&dword_244B4F000, v53, (os_log_type_t)v54, "%s: establishing connection.", v50, 0xCu);
      v23 = v51;
      swift_arrayDestroy();
      MEMORY[0x249520AE0](v23, -1, -1);
      MEMORY[0x249520AE0](v22, -1, -1);

    }
    else
    {

    }
    v24 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
    v25 = v15;
    v54 = v24;
    v24(v11, v57);
    sub_244B5BD18();
    v26 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 24);
    v27 = v55;
    v28 = v26(v55, v25);
    v30 = sub_244B5B5D8(v28, v29, 0);

    *a1 = v30;
    if (v30)
    {
      v31 = v30;
      v32 = static XPCService.xpcInterface()();
      objc_msgSend(v31, sel_setRemoteObjectInterface_, v32);

      v33 = swift_allocObject();
      swift_weakInit();
      v34 = (_QWORD *)swift_allocObject();
      v34[2] = v27;
      v34[3] = v25;
      v34[4] = v33;
      v62 = sub_244B604EC;
      v63 = v34;
      aBlock = (os_log_t)MEMORY[0x24BDAC760];
      v59 = 1107296256;
      v60 = sub_244B62DD8;
      v61 = &unk_2515B5B88;
      v35 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v31, sel_setInterruptionHandler_, v35);
      _Block_release(v35);
      v36 = swift_allocObject();
      swift_weakInit();
      v37 = (_QWORD *)swift_allocObject();
      v37[2] = v27;
      v37[3] = v25;
      v37[4] = v36;
      v62 = sub_244B60510;
      v63 = v37;
      aBlock = (os_log_t)MEMORY[0x24BDAC760];
      v59 = 1107296256;
      v60 = sub_244B62DD8;
      v61 = &unk_2515B6388;
      v38 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v31, sel_setInvalidationHandler_, v38);
      _Block_release(v38);
      objc_msgSend(v31, sel_resume);

      return swift_unknownObjectRelease();
    }
    v40 = v56;
    ((void (*)(uint64_t, uint64_t))v52)(v27, v25);
    v41 = v27;
    v42 = sub_244B648B8();
    v43 = sub_244B64AC8();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      v53 = (os_log_t)swift_slowAlloc();
      aBlock = v53;
      *(_DWORD *)v44 = 136315138;
      v52 = (void (*)(void))(v44 + 4);
      v45 = v26(v41, v25);
      v64 = sub_244B54E58(v45, v46, (uint64_t *)&aBlock);
      sub_244B64B70();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_244B4F000, v42, v43, "%s: did not create connection.", v44, 0xCu);
      v47 = v53;
      swift_arrayDestroy();
      MEMORY[0x249520AE0](v47, -1, -1);
      MEMORY[0x249520AE0](v44, -1, -1);
      swift_unknownObjectRelease();

      v48 = v56;
    }
    else
    {

      swift_unknownObjectRelease();
      v48 = v40;
    }
    return v54(v48, v57);
  }
  else
  {
    result = sub_244B64C3C();
    __break(1u);
  }
  return result;
}

id sub_244B5B5D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_244B649F0();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithMachServiceName_options_, v5, a3);

  return v6;
}

uint64_t sub_244B5B650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = sub_244B648C4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3);
  v11 = sub_244B648B8();
  v12 = sub_244B64AC8();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v22 = v6;
    v14 = (uint8_t *)v13;
    v15 = swift_slowAlloc();
    v23 = v3;
    v16 = v15;
    v25 = v15;
    v21 = v7;
    *(_DWORD *)v14 = 136315138;
    v20[1] = v14 + 4;
    v17 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
    v24 = sub_244B54E58(v17, v18, &v25);
    sub_244B64B70();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_244B4F000, v11, v12, "%s: Connection to XPC Server interrupted.", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249520AE0](v16, -1, -1);
    MEMORY[0x249520AE0](v14, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v10, v22);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
}

uint64_t sub_244B5B82C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjectType;
  _QWORD v14[5];

  sub_244B609A4();
  result = swift_weakLoadStrong();
  if (result)
  {
    v9 = result;
    v10 = *(_QWORD *)(result + 16);
    MEMORY[0x24BDAC7A8](result, v8);
    v14[2] = a2;
    v14[3] = a3;
    v12 = type metadata accessor for XPCServiceClientConnection.State(0, a2, a3, v11);
    sub_244B6099C();
    sub_244B60804(a4, (uint64_t)v14, v10, v12, MEMORY[0x24BEE4AE0] + 8);
    swift_release();
    if (MEMORY[0x249520B88](v9 + 24))
    {
      ObjectType = swift_getObjectType();
      sub_244B60A08(ObjectType);
      sub_244B609AC();
      return swift_unknownObjectRelease();
    }
    else
    {
      return sub_244B609AC();
    }
  }
  return result;
}

void sub_244B5B930(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint8_t *v19;
  uint8_t *v20;
  uint64_t v21;
  id *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v7 = sub_244B648C4();
  v24 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3);
  v11 = sub_244B648B8();
  v12 = sub_244B64AE0();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v22 = a1;
    v14 = (uint8_t *)v13;
    v15 = swift_slowAlloc();
    v23 = v3;
    v16 = v15;
    v26 = v15;
    v21 = v7;
    *(_DWORD *)v14 = 136315138;
    v20 = v14 + 4;
    v17 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
    v25 = sub_244B54E58(v17, v18, &v26);
    sub_244B64B70();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_244B4F000, v11, v12, "%s: Connection to XPC Server invalidated.", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249520AE0](v16, -1, -1);
    v19 = v14;
    a1 = v22;
    MEMORY[0x249520AE0](v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v21);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v7);
  }

  *a1 = 0;
}

void XPCServiceClientConnection.call<A>(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
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
  unint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  _QWORD v25[3];
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  _QWORD *v30;
  void (*v31)(uint64_t);

  sub_244B606F8();
  v3 = v2;
  v31 = v4;
  v6 = v5;
  v7 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v4, v8);
  sub_244B60964();
  v9 = *(_QWORD *)(v0 + 16);
  v25[2] = v10;
  v26 = v0;
  v13 = *(_QWORD *)(v11 + 80);
  v12 = *(_QWORD *)(v11 + 88);
  v15 = type metadata accessor for XPCServiceClientConnection.State(0, v13, v12, v14);
  v16 = sub_244B60904();
  sub_244B60090((void (*)(uint64_t))sub_244B5BD00, (uint64_t)v25, v9, v15, v16);
  if (!v1)
  {
    v17 = v27;
    v18 = sub_244B6069C();
    *(_QWORD *)(v18 + 16) = 0;
    v19 = (_QWORD *)sub_244B6069C();
    v19[2] = v13;
    v19[3] = v3;
    v20 = v17;
    v19[4] = v12;
    v19[5] = v18;
    v29 = sub_244B5BD9C;
    v30 = v19;
    v27 = (void *)MEMORY[0x24BDAC760];
    v28 = 1107296256;
    v21 = sub_244B60A88((uint64_t)sub_244B5BDB8);
    swift_retain();
    sub_244B609B4();
    objc_msgSend(v20, sel_synchronousRemoteObjectProxyWithErrorHandler_, v21);
    _Block_release(v21);
    v22 = swift_unknownObjectRetain();
    v31(v22);
    sub_244B5223C();
    v23 = *(void **)(v18 + 16);
    if (v23)
    {
      v24 = v23;
      sub_244B609C8();

      sub_244B60A14();
      sub_244B60A28(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
      sub_244B6080C();
      sub_244B60A14();
    }
    else
    {

      sub_244B606CC();
      sub_244B60A1C(v6, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 32));
      sub_244B6080C();
    }
  }
  sub_244B60678();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(id, void (*)(uint64_t, void *), _QWORD *);
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void **v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_QWORD);
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[2];
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  id v54;
  _QWORD *v55;
  uint64_t v56;
  void (*v57)(id, void (*)(uint64_t, void *), _QWORD *);
  uint64_t v58;
  void (*v59)(_QWORD);
  _QWORD v60[3];
  _QWORD *v61;
  void *v62;
  uint64_t v63;
  void (*v64)(uint64_t);
  _QWORD *v65;

  sub_244B606F8();
  v3 = v2;
  v56 = v5;
  v57 = v4;
  v55 = v6;
  v7 = *v0;
  v59 = (void (*)(_QWORD))sub_244B609F4();
  v8 = *((_QWORD *)v59 - 1);
  MEMORY[0x24BDAC7A8](v59, v9);
  v11 = (char *)v49 - v10;
  v12 = v0[2];
  v58 = v3;
  v60[2] = v3;
  v61 = v0;
  v14 = *(_QWORD *)(v7 + 80);
  v13 = *(_QWORD *)(v7 + 88);
  v16 = type metadata accessor for XPCServiceClientConnection.State(0, v14, v13, v15);
  v17 = sub_244B60904();
  sub_244B60090((void (*)(uint64_t))sub_244B605FC, (uint64_t)v60, v12, v16, v17);
  if (!v1)
  {
    v51 = v8;
    v49[0] = v0;
    v52 = v11;
    v49[1] = 0;
    v18 = v62;
    v19 = sub_244B6069C();
    *(_QWORD *)(v19 + 16) = 0;
    v20 = (_QWORD *)(v19 + 16);
    v21 = (_QWORD *)sub_244B6069C();
    v22 = v58;
    v21[2] = v14;
    v21[3] = v22;
    v21[4] = v13;
    v21[5] = v19;
    v64 = sub_244B605C4;
    v65 = v21;
    v62 = (void *)MEMORY[0x24BDAC760];
    v63 = 1107296256;
    v23 = sub_244B609E0((uint64_t)sub_244B5BDB8);
    v53 = v19;
    sub_244B609D0();
    sub_244B609B4();
    v54 = v18;
    v24 = objc_msgSend(v18, sel_synchronousRemoteObjectProxyWithErrorHandler_, v23);
    _Block_release(v23);
    v25 = swift_allocBox();
    v50 = v26;
    sub_244B53AA4(v26, 1, 1, v22);
    v27 = sub_244B6069C();
    *(_QWORD *)(v27 + 16) = 0;
    v28 = (void **)(v27 + 16);
    v29 = (_QWORD *)sub_244B6069C();
    v29[2] = v14;
    v29[3] = v22;
    v30 = v27;
    v31 = v25;
    v29[4] = v13;
    v29[5] = v25;
    v29[6] = v30;
    swift_unknownObjectRetain();
    sub_244B6097C();
    sub_244B6099C();
    v57(v24, sub_244B5C5EC, v29);
    sub_244B6080C();
    sub_244B5223C();
    if (*v20)
    {
      sub_244B607F0();
      sub_244B60A74();

      swift_release();
LABEL_18:
      sub_244B606CC();
      sub_244B6094C();
      sub_244B60738();
      goto LABEL_19;
    }
    v57 = (void (*)(id, void (*)(uint64_t, void *), _QWORD *))v24;
    v32 = v54;
    v33 = v50;
    sub_244B5223C();
    v34 = v51;
    v35 = (uint64_t)v52;
    v36 = v33;
    v37 = v59;
    (*(void (**)(char *, uint64_t, void (*)(_QWORD)))(v51 + 16))(v52, v36, v59);
    if (sub_244B543FC(v35, 1, v22) == 1)
    {
      (*(void (**)(uint64_t, void (*)(_QWORD)))(v34 + 8))(v35, v37);
      sub_244B5223C();
      v38 = *v28;
      if (*v28)
      {
        sub_244B607F0();
        v39 = (void *)sub_244B64828();
        v40 = NSError.pds_unlaunderSimpleNSError()();

        if (v40)
        {
          swift_willThrow();

        }
        else
        {
          sub_244B60A74();
        }

        sub_244B6080C();
      }
      else
      {
        v41 = v49[0];
        if (MEMORY[0x249520B88](v49[0] + 24))
        {
          v56 = v31;
          v58 = v30;
          v42 = *(_QWORD *)(v41 + 32);
          swift_getObjectType();
          v59 = *(void (**)(_QWORD))(v42 + 24);
          sub_244B606B8();
          v55 = v49;
          sub_244B60740();
          MEMORY[0x24BDAC7A8](v43, v44);
          sub_244B606A4();
          v45 = sub_244B60A34();
          v59(v45);
          sub_244B6085C();
          if (sub_244B608B0())
          {
            sub_244B6098C();
          }
          else
          {
            v47 = sub_244B60690();
            sub_244B60888(v47, v48);
          }
          sub_244B606CC();
        }
        else
        {
          sub_244B5C5FC();
          sub_244B60690();
          *v46 = 2;
        }
        swift_willThrow();

        sub_244B6080C();
      }
      goto LABEL_18;
    }

    sub_244B606CC();
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v55, v35, v22);
    sub_244B6080C();
    sub_244B6094C();
    sub_244B60738();
  }
LABEL_19:
  sub_244B60678();
}

void sub_244B5BD00()
{
  sub_244B5C83C();
}

unint64_t sub_244B5BD18()
{
  unint64_t result;

  result = qword_2543FBB80;
  if (!qword_2543FBB80)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2543FBB80);
  }
  return result;
}

uint64_t sub_244B5BD54()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_244B5BD78()
{
  swift_release();
  return swift_deallocObject();
}

void sub_244B5BD9C(uint64_t a1)
{
  uint64_t *v1;

  sub_244B5C2D0(a1, v1[5], v1[2], v1[3], v1[4]);
}

void sub_244B5BDB8(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_244B5BE08(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_244B5BE18()
{
  return swift_release();
}

void sub_244B5C2D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23[3];

  v9 = sub_244B648C4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11);
  sub_244B60954();
  v14 = v13 - v12;
  (*(void (**)(uint64_t, uint64_t))(a5 + 48))(a3, a5);
  sub_244B607F0();
  sub_244B607F0();
  v15 = sub_244B648B8();
  v16 = sub_244B64AC8();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = sub_244B5AC30();
    v18 = (_QWORD *)sub_244B5AC30();
    v23[0] = sub_244B5AC30();
    *(_DWORD *)v17 = 136315394;
    v19 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 24))(a3, a5);
    sub_244B54E58(v19, v20, v23);
    sub_244B64B70();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2112;
    sub_244B607F0();
    v22 = _swift_stdlib_bridgeErrorToNSError();
    sub_244B64B70();
    *v18 = v22;
    sub_244B607E8();
    sub_244B607E8();
    _os_log_impl(&dword_244B4F000, v15, v16, "%s: error during call: %@.", (uint8_t *)v17, 0x16u);
    sub_244B511A0((uint64_t *)&unk_2573E0530);
    sub_244B5AC68();
    sub_244B549E8();
  }
  sub_244B607E8();
  sub_244B607E8();

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v14, v9);
  sub_244B609A4();
  v21 = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = a1;

  sub_244B607F0();
  sub_244B606E0();
}

void sub_244B5C50C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v7 = sub_244B64B64();
  v8 = swift_projectBox();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v8, a1, v7);
  swift_beginAccess();
  v9 = *(void **)(a4 + 16);
  *(_QWORD *)(a4 + 16) = a2;
  v10 = a2;

}

uint64_t sub_244B5C5C0()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_244B5C5EC(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_244B5C50C(a1, a2, *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48));
}

unint64_t sub_244B5C5FC()
{
  unint64_t result;

  result = qword_2573E0378;
  if (!qword_2573E0378)
  {
    result = MEMORY[0x249520A44](&protocol conformance descriptor for XPCServiceError, &type metadata for XPCServiceError);
    atomic_store(result, (unint64_t *)&qword_2573E0378);
  }
  return result;
}

uint64_t XPCServiceClientConnection.call<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;

  v5[6] = a4;
  v5[7] = v4;
  v5[4] = a2;
  v5[5] = a3;
  v5[3] = a1;
  v5[8] = *v4;
  return sub_244B60820();
}

uint64_t sub_244B5C658()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  __int128 v14;

  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v2 + 16);
  v5 = swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v3;
  *(_QWORD *)(v5 + 24) = v2;
  sub_244B60A00(v5, *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), v6);
  v7 = sub_244B60A7C();
  sub_244B60804((void (*)(uint64_t))sub_244B605FC, v5, v4, v1, v7);
  if (v4)
  {
    sub_244B60844();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 48);
    v9 = *(_QWORD *)(v0 + 56);
    v14 = *(_OWORD *)(v0 + 32);
    sub_244B60844();
    v11 = *(_QWORD *)(v0 + 16);
    *(_QWORD *)(v0 + 72) = v11;
    v12 = swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v12;
    *(_QWORD *)(v12 + 16) = v10;
    *(_QWORD *)(v12 + 24) = v11;
    *(_OWORD *)(v12 + 32) = v14;
    *(_QWORD *)(v12 + 48) = v9;
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v13;
    *v13 = v0;
    v13[1] = sub_244B5C77C;
    sub_244B60798();
    return sub_244B64CE4();
  }
}

uint64_t sub_244B5C77C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return sub_244B60814();
}

uint64_t sub_244B5C7E0()
{
  uint64_t v0;

  return sub_244B54998(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_244B5C80C()
{
  uint64_t v0;

  sub_244B60844();
  return sub_244B54998(*(uint64_t (**)(void))(v0 + 8));
}

void sub_244B5C83C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void **v3;
  id *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;

  sub_244B606F8();
  sub_244B60A60();
  sub_244B5B010(v4);
  if (!v1)
  {
    v5 = *v3;
    if (*v3)
    {
      *v0 = v5;
      v6 = v5;
    }
    else
    {
      if (MEMORY[0x249520B88](v2 + 24))
      {
        swift_getObjectType();
        sub_244B606B8();
        sub_244B60740();
        MEMORY[0x24BDAC7A8](v7, v8);
        sub_244B606A4();
        sub_244B60914();
        sub_244B6089C();
        if (sub_244B60874())
        {
          sub_244B608C4();
        }
        else
        {
          v10 = sub_244B60690();
          sub_244B6082C(v10, v11);
        }
        sub_244B606CC();
      }
      else
      {
        sub_244B5C5FC();
        sub_244B60690();
        *v9 = 0;
      }
      sub_244B609C8();
    }
  }
  sub_244B60678();
}

uint64_t sub_244B5C938(uint64_t a1, void *a2, void (*a3)(id, void (*)(), char *), uint64_t a4, _QWORD *a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  void *v21;
  id v22;
  char *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t);
  uint64_t v29;
  id v30;
  _QWORD *v31;
  uint64_t v32;
  void (*v33)(id, void (*)(), char *);
  _QWORD aBlock[6];

  v31 = a5;
  v32 = a4;
  v33 = a3;
  v29 = a1;
  v30 = a2;
  v8 = *a5;
  sub_244B545B8(&qword_2543FBB20);
  v9 = a6;
  v27 = a6;
  v10 = sub_244B64A80();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10, v13);
  v15 = (char *)&v26 - v14;
  v28 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v28((char *)&v26 - v14, a1, v10);
  v16 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v17 = (char *)swift_allocObject();
  v18 = *(_QWORD *)(v8 + 80);
  *((_QWORD *)v17 + 2) = v18;
  *((_QWORD *)v17 + 3) = v9;
  v19 = *(_QWORD *)(v8 + 88);
  *((_QWORD *)v17 + 4) = v19;
  v20 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v20(&v17[v16], v15, v10);
  aBlock[4] = sub_244B603A8;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244B5BDB8;
  aBlock[3] = &unk_2515B62C0;
  v21 = _Block_copy(aBlock);
  swift_release();
  v22 = objc_msgSend(v30, sel_remoteObjectProxyWithErrorHandler_, v21);
  _Block_release(v21);
  v28(v15, v29, v10);
  v23 = (char *)swift_allocObject();
  v24 = v27;
  *((_QWORD *)v23 + 2) = v18;
  *((_QWORD *)v23 + 3) = v24;
  *((_QWORD *)v23 + 4) = v19;
  v20(&v23[v16], v15, v10);
  *(_QWORD *)&v23[(v16 + v12 + 7) & 0xFFFFFFFFFFFFFFF8] = v31;
  swift_unknownObjectRetain();
  swift_retain();
  v33(v22, sub_244B6047C, v23);
  swift_release();
  return swift_unknownObjectRelease_n();
}

uint64_t sub_244B5CB58(uint64_t a1)
{
  return sub_244B5F698(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_244B5C938);
}

uint64_t sub_244B5CB64(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v10 = sub_244B648C4();
  v34 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v11);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a5 + 48))(a3, a5);
  v14 = a1;
  v15 = a1;
  v16 = sub_244B648B8();
  v17 = sub_244B64AC8();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc();
    v32 = a4;
    v19 = v18;
    v20 = swift_slowAlloc();
    v33 = a2;
    v21 = (_QWORD *)v20;
    v30 = swift_slowAlloc();
    v36 = v30;
    *(_DWORD *)v19 = 136315394;
    v31 = v10;
    v22 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 24))(a3, a5);
    v35 = sub_244B54E58(v22, v23, &v36);
    sub_244B64B70();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2112;
    v24 = a1;
    v25 = _swift_stdlib_bridgeErrorToNSError();
    v35 = v25;
    sub_244B64B70();
    *v21 = v25;

    _os_log_impl(&dword_244B4F000, v16, v17, "%s: error during call: %@.", (uint8_t *)v19, 0x16u);
    sub_244B511A0((uint64_t *)&unk_2573E0530);
    swift_arrayDestroy();
    MEMORY[0x249520AE0](v21, -1, -1);
    v26 = v30;
    swift_arrayDestroy();
    MEMORY[0x249520AE0](v26, -1, -1);
    MEMORY[0x249520AE0](v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v31);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v10);
  }
  v36 = (uint64_t)a1;
  v27 = a1;
  sub_244B545B8(&qword_2543FBB20);
  sub_244B64A80();
  return sub_244B64A68();
}

void sub_244B5CE38(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t ObjectType;
  void (*v29)(uint64_t *, uint64_t, uint64_t);
  uint64_t AssociatedTypeWitness;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v39 = a3;
  v9 = sub_244B64B64();
  v10 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x24BDAC7A8](v9, v11);
  v14 = (char *)&v39 - v13;
  v15 = *(_QWORD *)(a5 - 8);
  v17 = MEMORY[0x24BDAC7A8](v12, v16);
  v19 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17, v20);
  v22 = (char *)&v39 - v21;
  if (a2)
  {
    v23 = a2;
    v24 = (void *)sub_244B64828();
    v25 = (void *)NSError.pds_unlaunderSimpleNSError()();

    if (v25)
    {
      v40 = (uint64_t)v25;
      v26 = v25;
      sub_244B545B8(&qword_2543FBB20);
      sub_244B64A80();
      sub_244B64A68();

      return;
    }
    v40 = (uint64_t)a2;
    sub_244B545B8(&qword_2543FBB20);
    sub_244B64A80();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v14, a1, v9);
    if (sub_244B543FC((uint64_t)v14, 1, a5) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v22, v14, a5);
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v19, v22, a5);
      sub_244B545B8(&qword_2543FBB20);
      sub_244B64A80();
      sub_244B64A74();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v22, a5);
      return;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
    if (MEMORY[0x249520B88](a4 + 24))
    {
      v27 = *(_QWORD *)(a4 + 32);
      ObjectType = swift_getObjectType();
      LOBYTE(v40) = 2;
      v29 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v27 + 24);
      AssociatedTypeWitness = swift_getAssociatedTypeWitness();
      v31 = *(_QWORD *)(AssociatedTypeWitness - 8);
      MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v32);
      v34 = (char *)&v39 - v33;
      swift_unknownObjectRetain();
      v29(&v40, ObjectType, v27);
      swift_getAssociatedConformanceWitness();
      v35 = sub_244B64C9C();
      if (v35)
      {
        v36 = v35;
        (*(void (**)(char *, uint64_t))(v31 + 8))(v34, AssociatedTypeWitness);
      }
      else
      {
        v36 = swift_allocError();
        (*(void (**)(uint64_t, char *, uint64_t))(v31 + 32))(v38, v34, AssociatedTypeWitness);
      }
      swift_unknownObjectRelease_n();
    }
    else
    {
      sub_244B5C5FC();
      v36 = swift_allocError();
      *v37 = 2;
    }
    v40 = v36;
    sub_244B545B8(&qword_2543FBB20);
    sub_244B64A80();
  }
  sub_244B64A68();
}

void sub_244B5D1F4()
{
  XPCServiceClientConnection.call<A>(_:)();
}

void sub_244B5D214()
{
  XPCServiceClientConnection.call<A>(_:)();
}

uint64_t sub_244B5D234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_244B53E50;
  return XPCServiceClientConnection.call<A>(_:)(a1, a2, a3, a4);
}

_BYTE *static XPCServiceClientConnectionDelegate.translateXPCServiceError(_:)@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_244B5D2C4@<X0>(_BYTE *a1@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *a1;
  swift_unknownObjectWeakInit();
  return swift_unknownObjectRelease();
}

void BidirectionalXPCServiceClientConnection.__allocating_init(existingConnection:localObject:delegate:)(void *a1)
{
  sub_244B6069C();
  BidirectionalXPCServiceClientConnection.init(existingConnection:localObject:delegate:)(a1);
}

uint64_t sub_244B5D344()
{
  uint64_t v0;

  return v0;
}

void BidirectionalXPCServiceClientConnection.init(existingConnection:localObject:delegate:)(void *a1)
{
  uint64_t *v1;
  uint64_t v3;
  id v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[2];
  _BYTE v8[16];

  v3 = *v1;
  v1[5] = 0;
  sub_244B609EC();
  v1[3] = (uint64_t)a1;
  LOBYTE(v7[0]) = 1;
  v4 = a1;
  swift_unknownObjectRetain();
  v5 = *(_OWORD *)(v3 + 96);
  v6 = *(_OWORD *)(v3 + 80);
  sub_244B5D2C4(v7, v8);
  v7[0] = v6;
  v7[1] = v5;
  sub_244B60984();
}

uint64_t sub_244B5D3EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v8;

  v6 = sub_244B5AC70((uint64_t)&v8, a1);
  *(_QWORD *)(v1 + 16) = v6;
  *(_QWORD *)(v1 + 40) = v4;
  swift_unknownObjectWeakAssign();
  sub_244B609D0();
  sub_244B60090((void (*)(uint64_t))sub_244B5D49C, v1, v6, a1, MEMORY[0x24BEE4AE0] + 8);
  if (v2)
    swift_release();
  swift_release();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v1;
}

void type metadata accessor for BidirectionalXPCServiceClientConnection.State()
{
  JUMPOUT(0x2495209FCLL);
}

uint64_t sub_244B5D49C(_BYTE *a1)
{
  return sub_244B5D4B0(a1);
}

uint64_t sub_244B5D4B0(_BYTE *a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t ObjectType;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  uint64_t result;
  uint64_t v20;
  uint64_t aBlock;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  void (*v25)();
  _QWORD *v26;

  v4 = (_QWORD *)*v1;
  if (MEMORY[0x249520B88](v1 + 4))
  {
    v5 = v1[5];
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v5 + 32))(ObjectType, v5);
    if (v2 || *a1 > 1u)
    {
      return swift_unknownObjectRelease();
    }
    else
    {
      v7 = (void *)v1[3];
      v8 = v4[11];
      v20 = v4[13];
      v9 = static XPCService.xpcInterface()();
      objc_msgSend(v7, sel_setRemoteObjectInterface_, v9);

      v10 = v4[10];
      v11 = v4[12];
      v12 = static XPCService.xpcInterface()();
      objc_msgSend(v7, sel_setExportedInterface_, v12);

      objc_msgSend(v7, sel_setExportedObject_, MEMORY[0x249520B88](a1 + 8));
      swift_unknownObjectRelease();
      v13 = swift_allocObject();
      swift_weakInit();
      v14 = (_QWORD *)swift_allocObject();
      v14[2] = v10;
      v14[3] = v8;
      v14[4] = v11;
      v14[5] = v20;
      v14[6] = v13;
      v25 = sub_244B60298;
      v26 = v14;
      aBlock = MEMORY[0x24BDAC760];
      v22 = 1107296256;
      v23 = sub_244B62DD8;
      v24 = &unk_2515B5B10;
      v15 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v7, sel_setInterruptionHandler_, v15);
      _Block_release(v15);
      v16 = swift_allocObject();
      swift_weakInit();
      v17 = (_QWORD *)swift_allocObject();
      v17[2] = v10;
      v17[3] = v8;
      v17[4] = v11;
      v17[5] = v20;
      v17[6] = v16;
      v25 = sub_244B602A4;
      v26 = v17;
      aBlock = MEMORY[0x24BDAC760];
      v22 = 1107296256;
      v23 = sub_244B62DD8;
      v24 = &unk_2515B6270;
      v18 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v7, sel_setInvalidationHandler_, v18);
      _Block_release(v18);
      if (!*a1)
        objc_msgSend(v7, sel_resume);
      result = swift_unknownObjectRelease();
      *a1 = 2;
    }
  }
  else
  {
    result = sub_244B64C3C();
    __break(1u);
  }
  return result;
}

void BidirectionalXPCServiceClientConnection.__allocating_init(localObject:delegate:)()
{
  sub_244B6069C();
  BidirectionalXPCServiceClientConnection.init(localObject:delegate:)();
}

uint64_t sub_244B5D800()
{
  uint64_t v0;

  return v0;
}

void BidirectionalXPCServiceClientConnection.init(localObject:delegate:)()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  _BYTE v9[16];

  v1 = (_QWORD *)*v0;
  v0[5] = 0;
  sub_244B609EC();
  sub_244B60904();
  v2 = v1[11];
  v3 = v1[13];
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3);
  v0[3] = sub_244B5B5D8(v4, v5, 0);
  LOBYTE(v8[0]) = 0;
  v6 = v1[10];
  v7 = v1[12];
  swift_unknownObjectRetain();
  sub_244B5D2C4(v8, v9);
  v8[0] = v6;
  v8[1] = v2;
  v8[2] = v7;
  v8[3] = v3;
  sub_244B60984();
}

uint64_t sub_244B5D8C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  _QWORD v7[14];

  v3 = sub_244B5AC70((uint64_t)v7, a1);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v1 + 40) = v6;
  swift_unknownObjectWeakAssign();
  sub_244B6097C();
  v4 = v7[3];
  sub_244B60090((void (*)(uint64_t))sub_244B6058C, v1, v3, a1, MEMORY[0x24BEE4AE0] + 8);
  if (v4)
    swift_release();
  swift_release();
  sub_244B60A14();
  swift_unknownObjectRelease();
  return v1;
}

uint64_t BidirectionalXPCServiceClientConnection.deinit(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + 24);
  v3 = sub_244B60A54(a1, sel_setInterruptionHandler_);
  sub_244B60A54((uint64_t)v3, sel_setInvalidationHandler_);
  objc_msgSend(v2, sel_invalidate);
  swift_release();

  sub_244B5AFD4(v1 + 32);
  return v1;
}

uint64_t BidirectionalXPCServiceClientConnection.__deallocating_deinit(uint64_t a1)
{
  BidirectionalXPCServiceClientConnection.deinit(a1);
  return swift_deallocClassInstance();
}

ProactiveDaemonSupport::ConnectionState __swiftcall BidirectionalXPCServiceClientConnection.getCurrentConnectionState()()
{
  type metadata accessor for BidirectionalXPCServiceClientConnection.State();
}

void sub_244B5DA2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  sub_244B60804((void (*)(uint64_t))sub_244B5F598, (uint64_t)&v2, v1, a1, (uint64_t)&type metadata for ConnectionState);
}

BOOL static ConnectionState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void sub_244B5DA78()
{
  uint64_t Strong;
  uint64_t v1;

  sub_244B609A4();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    MEMORY[0x24BDAC7A8](Strong, v1);
    sub_244B609D0();
    type metadata accessor for BidirectionalXPCServiceClientConnection.State();
  }
  sub_244B606E0();
}

void sub_244B5DB7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t (*v23)(void);
  uint64_t (*v24)(void);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  unint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;

  sub_244B606F8();
  a19 = v20;
  a20 = v21;
  v41 = v22;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v31 = sub_244B648C4();
  v42 = *(_QWORD *)(v31 - 8);
  v43 = v31;
  MEMORY[0x24BDAC7A8](v31, v32);
  sub_244B60954();
  v35 = v34 - v33;
  (*(void (**)(uint64_t, uint64_t))(v26 + 48))(v28, v26);
  v36 = sub_244B648B8();
  v37 = v24();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc();
    a10 = swift_slowAlloc();
    *(_DWORD *)v38 = 136315138;
    v39 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 24))(v28, v26);
    sub_244B54E58(v39, v40, &a10);
    sub_244B64B70();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_244B4F000, v36, v37, v41, v38, 0xCu);
    swift_arrayDestroy();
    sub_244B549E8();
  }

  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v35, v43);
  *v30 = 3;
  sub_244B60678();
}

void BidirectionalXPCServiceClientConnection.call<A>(_:)()
{
  uint64_t v0;
  uint64_t v1;

  sub_244B606F8();
  MEMORY[0x24BDAC7A8](v0, v1);
  sub_244B60964();
  sub_244B60984();
}

{
  uint64_t v0;
  uint64_t v1;

  sub_244B606F8();
  v1 = sub_244B609F4();
  MEMORY[0x24BDAC7A8](v1, v0);
  sub_244B60984();
}

void sub_244B5DD84(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;

  v10 = sub_244B60904();
  sub_244B60090((void (*)(uint64_t))sub_244B5F5A4, v8 - 160, v4, a1, v10);
  if (!v3)
  {
    *(_QWORD *)(v8 - 176) = v7;
    *(_QWORD *)(v8 - 192) = v5;
    v11 = *(void **)(v8 - 72);
    v12 = sub_244B6069C();
    *(_QWORD *)(v12 + 16) = 0;
    v13 = (_QWORD *)sub_244B6069C();
    v13[2] = v1;
    v13[3] = v2;
    v13[4] = v12;
    *(_QWORD *)(v8 - 96) = sub_244B5F5C0;
    *(_QWORD *)(v8 - 88) = v13;
    *(_QWORD *)(v8 - 128) = MEMORY[0x24BDAC760];
    *(_QWORD *)(v8 - 120) = 1107296256;
    v14 = sub_244B60A88((uint64_t)sub_244B5BDB8);
    sub_244B6097C();
    sub_244B6099C();
    sub_244B609B4();
    *(_QWORD *)(v8 - 184) = v11;
    v15 = objc_msgSend(v11, sel_synchronousRemoteObjectProxyWithErrorHandler_, v14);
    _Block_release(v14);
    v16 = swift_unknownObjectRetain();
    v6(v16);
    sub_244B5223C();
    v17 = *(void **)(v12 + 16);
    if (v17)
    {
      v18 = v17;
      sub_244B609C8();

      swift_unknownObjectRelease();
      sub_244B60A28(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 176) + 8));
      sub_244B60738();
      swift_unknownObjectRelease();
    }
    else
    {

      sub_244B606CC();
      sub_244B60A1C(*(_QWORD *)(v8 - 192), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 176) + 32));
      sub_244B60738();
    }
  }
  sub_244B60678();
}

void sub_244B5DFA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  id *v21;
  _QWORD *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void **v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;

  v18 = sub_244B60904();
  sub_244B60090((void (*)(uint64_t))sub_244B60610, v16 - 224, v12, a1, v18);
  if (!v9)
  {
    *(_QWORD *)(v16 - 312) = v11;
    *(_QWORD *)(v16 - 304) = v10;
    *(_QWORD *)(v16 - 336) = v13;
    *(_QWORD *)(v16 - 328) = 0;
    v19 = *(void **)(v16 - 160);
    v20 = sub_244B6069C();
    *(_QWORD *)(v20 + 16) = 0;
    v21 = (id *)(v20 + 16);
    v22 = (_QWORD *)sub_244B6069C();
    v22[2] = v15;
    v22[3] = v14;
    v22[4] = v20;
    *(_QWORD *)(v16 - 104) = sub_244B5F60C;
    *(_QWORD *)(v16 - 96) = v22;
    *(_QWORD *)(v16 - 136) = MEMORY[0x24BDAC760];
    *(_QWORD *)(v16 - 128) = 1107296256;
    v23 = sub_244B609E0((uint64_t)sub_244B5BDB8);
    swift_retain();
    *(_QWORD *)(v16 - 296) = v20;
    sub_244B6097C();
    sub_244B609B4();
    *(_QWORD *)(v16 - 288) = v19;
    v24 = objc_msgSend(v19, sel_synchronousRemoteObjectProxyWithErrorHandler_, v23);
    _Block_release(v23);
    v25 = swift_allocBox();
    *(_QWORD *)(v16 - 320) = v26;
    sub_244B53AA4(v26, 1, 1, v15);
    v27 = sub_244B6069C();
    *(_QWORD *)(v27 + 16) = 0;
    v28 = (_QWORD *)sub_244B6069C();
    v29 = v25;
    v30 = v24;
    v31 = *(_QWORD *)(v16 - 272);
    v28[2] = *(_QWORD *)(v16 - 280);
    v28[3] = v31;
    v32 = *(_QWORD *)(v16 - 256);
    v28[4] = v15;
    v28[5] = v32;
    v28[6] = *(_QWORD *)(v16 - 264);
    v28[7] = v29;
    v28[8] = v27;
    swift_unknownObjectRetain();
    sub_244B6099C();
    swift_retain();
    (*(void (**)(id, void (*)(uint64_t, void *), _QWORD *))(v16 - 240))(v24, sub_244B5F65C, v28);
    sub_244B6094C();
    sub_244B5223C();
    if (*v21)
    {
      v33 = *v21;
      sub_244B609D8();

      sub_244B608EC();
      sub_244B606CC();
      sub_244B60738();
    }
    else
    {
      v34 = (void **)(v27 + 16);
      *(_QWORD *)(v16 - 240) = v27;
      v35 = *(void **)(v16 - 288);
      v36 = *(_QWORD *)(v16 - 320);
      sub_244B5223C();
      v37 = *(_QWORD *)(v16 - 312);
      v38 = *(_QWORD *)(v16 - 304);
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v37 + 16))(v38, v36, *(_QWORD *)(v16 - 232));
      if (sub_244B543FC(v38, 1, v15) != 1)
      {

        sub_244B606CC();
        (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(*(_QWORD *)(v16 - 336), v38, v15);
        sub_244B608EC();
        sub_244B60738();
        swift_release();
        goto LABEL_5;
      }
      (*(void (**)(uint64_t, _QWORD))(v37 + 8))(v38, *(_QWORD *)(v16 - 232));
      sub_244B5223C();
      v39 = *v34;
      if (*v34)
      {
        sub_244B607F0();
        v40 = (void *)sub_244B64828();
        v41 = NSError.pds_unlaunderSimpleNSError()();

        if (!v41)
        {
          sub_244B60A74();

          sub_244B608EC();
          sub_244B606CC();
          sub_244B60738();
          swift_release();
          goto LABEL_5;
        }
        sub_244B609D8();

      }
      else
      {
        if (MEMORY[0x249520B88](v14 + 32))
        {
          *(_QWORD *)(v16 - 248) = v30;
          *(_QWORD *)(v16 - 232) = v29;
          v42 = *(_QWORD *)(v14 + 40);
          swift_getObjectType();
          *(_BYTE *)(v16 - 65) = 2;
          v43 = *(void (**)(uint64_t))(v42 + 24);
          sub_244B606B8();
          *(_QWORD *)(v16 - 256) = &a9;
          sub_244B60740();
          MEMORY[0x24BDAC7A8](v44, v45);
          sub_244B606A4();
          v46 = sub_244B60A34();
          v43(v46);
          sub_244B6085C();
          if (sub_244B608B0())
          {
            sub_244B6098C();
          }
          else
          {
            v48 = sub_244B60690();
            sub_244B60888(v48, v49);
          }
          sub_244B606CC();
        }
        else
        {
          sub_244B5C5FC();
          sub_244B60690();
          *v47 = 2;
        }
        sub_244B609D8();

      }
      swift_release();
      sub_244B606CC();
      sub_244B60738();
    }
    swift_release();
  }
LABEL_5:
  sub_244B60678();
}

void sub_244B5E3FC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  os_log_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38[5];

  v35 = a4;
  v36 = a5;
  v6 = *a2;
  v7 = sub_244B648C4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  sub_244B60954();
  v12 = v11 - v10;
  v13 = *(_QWORD *)(v6 + 88);
  v34 = v6;
  v14 = *(_QWORD *)(v6 + 104);
  (*(void (**)(uint64_t, uint64_t))(v14 + 48))(v13, v14);
  sub_244B607F0();
  sub_244B607F0();
  v15 = sub_244B648B8();
  v16 = sub_244B64AC8();
  if (os_log_type_enabled(v15, v16))
  {
    v32 = v8;
    v17 = sub_244B5AC30();
    v29 = (_QWORD *)sub_244B5AC30();
    v31 = sub_244B5AC30();
    v38[0] = v31;
    *(_DWORD *)v17 = 136315394;
    v33 = a3;
    v18 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 24);
    v28 = v15;
    v19 = v18(v13, v14);
    sub_244B54E58(v19, v20, v38);
    v30 = v7;
    sub_244B64B70();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2112;
    sub_244B607F0();
    v37 = _swift_stdlib_bridgeErrorToNSError();
    sub_244B64B70();
    *v29 = v37;
    sub_244B607E8();
    sub_244B607E8();
    _os_log_impl(&dword_244B4F000, v28, v16, "%s: error during call: %@.", (uint8_t *)v17, 0x16u);
    sub_244B511A0((uint64_t *)&unk_2573E0530);
    sub_244B5AC68();
    sub_244B549E8();
  }
  sub_244B607E8();
  sub_244B607E8();

  v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v12, v7);
  MEMORY[0x24BDAC7A8](v21, v22);
  v23 = v34;
  v24 = v35;
  v25 = *(_QWORD *)(v34 + 80);
  *(&v27 - 6) = v25;
  *(&v27 - 5) = v13;
  v26 = *(_QWORD *)(v23 + 96);
  *(&v27 - 4) = v24;
  *(&v27 - 3) = v26;
  *(&v27 - 2) = v14;
  v38[0] = v25;
  v38[1] = v13;
  v38[2] = v26;
  v38[3] = v14;
  type metadata accessor for BidirectionalXPCServiceClientConnection.State();
}

void sub_244B5E688(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  sub_244B60804(*(void (**)(uint64_t))(v5 - 136), v3, v2, a1, MEMORY[0x24BEE4AE0] + 8);
  sub_244B609A4();
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v1;

  sub_244B607F0();
  sub_244B606E0();
}

void sub_244B5E6D8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v7 = sub_244B64B64();
  v8 = swift_projectBox();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v8, a1, v7);
  swift_beginAccess();
  v9 = *(void **)(a4 + 16);
  *(_QWORD *)(a4 + 16) = a2;
  v10 = a2;

}

uint64_t BidirectionalXPCServiceClientConnection.call<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;

  v5[10] = a4;
  v5[11] = v4;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  v5[12] = *v4;
  return sub_244B60820();
}

void sub_244B5E7AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = v1;
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v0 + 32) = *(_OWORD *)(v2 + 96);
  type metadata accessor for BidirectionalXPCServiceClientConnection.State();
}

uint64_t sub_244B5E804()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  __int128 v12;

  v5 = sub_244B60A7C();
  sub_244B60804((void (*)(uint64_t))sub_244B60610, v1, v0, v4, v5);
  if (v2)
  {
    sub_244B60844();
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
  else
  {
    v8 = *(_QWORD *)(v3 + 80);
    v7 = *(_QWORD *)(v3 + 88);
    v12 = *(_OWORD *)(v3 + 64);
    sub_244B60844();
    v9 = *(_QWORD *)(v3 + 48);
    *(_QWORD *)(v3 + 104) = v9;
    v10 = swift_task_alloc();
    *(_QWORD *)(v3 + 112) = v10;
    *(_QWORD *)(v10 + 16) = v8;
    *(_QWORD *)(v10 + 24) = v9;
    *(_QWORD *)(v10 + 32) = v7;
    *(_OWORD *)(v10 + 40) = v12;
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v3 + 120) = v11;
    *v11 = v3;
    v11[1] = sub_244B5E8D8;
    sub_244B60798();
    return sub_244B64CE4();
  }
}

uint64_t sub_244B5E8D8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return sub_244B60814();
}

uint64_t sub_244B5E93C()
{
  uint64_t v0;

  return sub_244B54998(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_244B5E968()
{
  uint64_t v0;

  sub_244B60844();
  return sub_244B54998(*(uint64_t (**)(void))(v0 + 8));
}

void sub_244B5E998()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;

  sub_244B606F8();
  sub_244B60A60();
  sub_244B5D4B0(v4);
  if (!v1)
  {
    if (*v3 == 3)
    {
      if (MEMORY[0x249520B88](v2 + 32))
      {
        swift_getObjectType();
        sub_244B606B8();
        sub_244B60740();
        MEMORY[0x24BDAC7A8](v5, v6);
        sub_244B606A4();
        sub_244B60914();
        sub_244B6089C();
        if (sub_244B60874())
        {
          sub_244B608C4();
        }
        else
        {
          v10 = sub_244B60690();
          sub_244B6082C(v10, v11);
        }
        sub_244B606CC();
      }
      else
      {
        sub_244B5C5FC();
        sub_244B60690();
        *v9 = 1;
      }
      sub_244B609C8();
    }
    else
    {
      v7 = *(void **)(v2 + 24);
      *v0 = v7;
      v8 = v7;
    }
  }
  sub_244B60678();
}

uint64_t sub_244B5EAA4(uint64_t a1, void *a2, _QWORD *a3, void (*a4)(uint64_t, void (*)(), char *), uint64_t a5, uint64_t a6)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  void *v21;
  id v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  uint64_t v34;
  id v35;
  uint64_t v36;
  void (*v37)(uint64_t, void (*)(), char *);
  _QWORD aBlock[6];

  v36 = a5;
  v37 = a4;
  v34 = a1;
  v35 = a2;
  v9 = (_QWORD *)*a3;
  sub_244B545B8(&qword_2543FBB20);
  v10 = a6;
  v30 = a6;
  v11 = sub_244B64A80();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11, v14);
  v16 = (char *)&v28 - v15;
  v33 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v33((char *)&v28 - v15, a1, v11);
  v17 = *(unsigned __int8 *)(v12 + 80);
  v32 = v17 | 7;
  v18 = (char *)swift_allocObject();
  v31 = v9[10];
  *((_QWORD *)v18 + 2) = v31;
  v29 = v9[11];
  *((_QWORD *)v18 + 3) = v29;
  *((_QWORD *)v18 + 4) = v10;
  v19 = v9[12];
  *((_QWORD *)v18 + 5) = v19;
  v28 = v9[13];
  *((_QWORD *)v18 + 6) = v28;
  *((_QWORD *)v18 + 7) = a3;
  v20 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v20(&v18[(v17 + 64) & ~v17], v16, v11);
  aBlock[4] = sub_244B5FF70;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244B5BDB8;
  aBlock[3] = &unk_2515B61A8;
  v21 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v22 = objc_msgSend(v35, sel_remoteObjectProxyWithErrorHandler_, v21);
  _Block_release(v21);
  v33(v16, v34, v11);
  v23 = (v17 + 56) & ~v17;
  v24 = (char *)swift_allocObject();
  v25 = v29;
  *((_QWORD *)v24 + 2) = v31;
  *((_QWORD *)v24 + 3) = v25;
  *((_QWORD *)v24 + 4) = v30;
  *((_QWORD *)v24 + 5) = v19;
  *((_QWORD *)v24 + 6) = v28;
  v20(&v24[v23], v16, v11);
  *(_QWORD *)&v24[(v13 + v23 + 7) & 0xFFFFFFFFFFFFFFF8] = a3;
  swift_retain();
  v26 = swift_unknownObjectRetain();
  v37(v26, sub_244B6003C, v24);
  swift_release();
  return swift_unknownObjectRelease_n();
}

void sub_244B5ECFC(void *a1, _QWORD *a2, uint64_t a3, NSObject *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  os_log_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  os_log_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40[5];

  v35 = a3;
  v37 = a2;
  v6 = *a2;
  v7 = sub_244B648C4();
  v36 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(NSObject **)(v6 + 88);
  v38 = v6;
  v12 = *(_QWORD *)(v6 + 104);
  (*(void (**)(NSObject *, uint64_t))(v12 + 48))(v11, v12);
  v13 = a1;
  v14 = a1;
  v15 = sub_244B648B8();
  v16 = sub_244B64AC8();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v31 = v15;
    v18 = v17;
    v19 = (_QWORD *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    v40[0] = v32;
    *(_DWORD *)v18 = 136315394;
    v33 = v7;
    v20 = (*(uint64_t (**)(NSObject *, uint64_t))(v12 + 24))(v11, v12);
    v39 = sub_244B54E58(v20, v21, v40);
    v34 = a4;
    sub_244B64B70();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2112;
    v22 = a1;
    v23 = _swift_stdlib_bridgeErrorToNSError();
    v39 = v23;
    a4 = v34;
    sub_244B64B70();
    *v19 = v23;

    v24 = v31;
    _os_log_impl(&dword_244B4F000, v31, v16, "%s: error during call: %@.", (uint8_t *)v18, 0x16u);
    sub_244B511A0((uint64_t *)&unk_2573E0530);
    swift_arrayDestroy();
    MEMORY[0x249520AE0](v19, -1, -1);
    v25 = v32;
    swift_arrayDestroy();
    MEMORY[0x249520AE0](v25, -1, -1);
    MEMORY[0x249520AE0](v18, -1, -1);

    v26 = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v10, v33);
  }
  else
  {

    v26 = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v10, v7);
  }
  MEMORY[0x24BDAC7A8](v26, v27);
  v28 = v38;
  v29 = *(NSObject **)(v38 + 80);
  *(&v31 - 6) = v29;
  *(&v31 - 5) = v11;
  v30 = *(NSObject **)(v28 + 96);
  *(&v31 - 4) = a4;
  *(&v31 - 3) = v30;
  *(&v31 - 2) = (os_log_t)v12;
  v40[0] = (uint64_t)v29;
  v40[1] = (uint64_t)v11;
  v40[2] = (uint64_t)v30;
  v40[3] = v12;
  type metadata accessor for BidirectionalXPCServiceClientConnection.State();
}

uint64_t sub_244B5EFD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  sub_244B60090((void (*)(uint64_t))sub_244B6064C, v2, v1, a1, MEMORY[0x24BEE4AE0] + 8);
  *(_QWORD *)(v4 - 120) = v3;
  v5 = v3;
  sub_244B545B8(&qword_2543FBB20);
  sub_244B64A80();
  return sub_244B64A68();
}

void sub_244B5F05C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t ObjectType;
  void (*v29)(uint64_t *, uint64_t, uint64_t);
  uint64_t AssociatedTypeWitness;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v39 = a3;
  v9 = sub_244B64B64();
  v10 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x24BDAC7A8](v9, v11);
  v14 = (char *)&v39 - v13;
  v15 = *(_QWORD *)(a5 - 8);
  v17 = MEMORY[0x24BDAC7A8](v12, v16);
  v19 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17, v20);
  v22 = (char *)&v39 - v21;
  if (a2)
  {
    v23 = a2;
    v24 = (void *)sub_244B64828();
    v25 = (void *)NSError.pds_unlaunderSimpleNSError()();

    if (v25)
    {
      v40 = (uint64_t)v25;
      v26 = v25;
      sub_244B545B8(&qword_2543FBB20);
      sub_244B64A80();
      sub_244B64A68();

      return;
    }
    v40 = (uint64_t)a2;
    sub_244B545B8(&qword_2543FBB20);
    sub_244B64A80();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v14, a1, v9);
    if (sub_244B543FC((uint64_t)v14, 1, a5) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v22, v14, a5);
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v19, v22, a5);
      sub_244B545B8(&qword_2543FBB20);
      sub_244B64A80();
      sub_244B64A74();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v22, a5);
      return;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
    if (MEMORY[0x249520B88](a4 + 32))
    {
      v27 = *(_QWORD *)(a4 + 40);
      ObjectType = swift_getObjectType();
      LOBYTE(v40) = 2;
      v29 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v27 + 24);
      AssociatedTypeWitness = swift_getAssociatedTypeWitness();
      v31 = *(_QWORD *)(AssociatedTypeWitness - 8);
      MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v32);
      v34 = (char *)&v39 - v33;
      swift_unknownObjectRetain();
      v29(&v40, ObjectType, v27);
      swift_getAssociatedConformanceWitness();
      v35 = sub_244B64C9C();
      if (v35)
      {
        v36 = v35;
        (*(void (**)(char *, uint64_t))(v31 + 8))(v34, AssociatedTypeWitness);
      }
      else
      {
        v36 = swift_allocError();
        (*(void (**)(uint64_t, char *, uint64_t))(v31 + 32))(v38, v34, AssociatedTypeWitness);
      }
      swift_unknownObjectRelease_n();
    }
    else
    {
      sub_244B5C5FC();
      v36 = swift_allocError();
      *v37 = 2;
    }
    v40 = v36;
    sub_244B545B8(&qword_2543FBB20);
    sub_244B64A80();
  }
  sub_244B64A68();
}

void sub_244B5F418()
{
  BidirectionalXPCServiceClientConnection.getCurrentConnectionState()();
}

void sub_244B5F438()
{
  BidirectionalXPCServiceClientConnection.call<A>(_:)();
}

void sub_244B5F458()
{
  BidirectionalXPCServiceClientConnection.call<A>(_:)();
}

uint64_t sub_244B5F478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_244B605B8;
  return BidirectionalXPCServiceClientConnection.call<A>(_:)(a1, a2, a3, a4);
}

uint64_t ConnectionState.hash(into:)()
{
  return sub_244B64D44();
}

void _s22ProactiveDaemonSupport15ConnectionStateO9hashValueSivg_0()
{
  sub_244B64D2C();
  sub_244B60A48();
  sub_244B64D5C();
  sub_244B51840();
}

void sub_244B5F568()
{
  sub_244B64D2C();
  sub_244B60A48();
  sub_244B64D5C();
  sub_244B51840();
}

_BYTE *sub_244B5F598@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_244B5F5A4()
{
  sub_244B5E998();
}

void sub_244B5F5C0(uint64_t a1)
{
  uint64_t v1;

  sub_244B5E3FC(a1, *(uint64_t **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 16), (uint64_t)sub_244B6032C);
}

uint64_t sub_244B5F5E8()
{
  swift_release();
  swift_release();
  sub_244B6084C();
  return swift_deallocObject();
}

void sub_244B5F60C(uint64_t a1)
{
  uint64_t v1;

  sub_244B5E3FC(a1, *(uint64_t **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 16), (uint64_t)sub_244B6064C);
}

uint64_t sub_244B5F630()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_244B5F65C(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_244B5E6D8(a1, a2, *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 64));
}

uint64_t sub_244B5F68C(uint64_t a1)
{
  return sub_244B5F698(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_244B5EAA4);
}

uint64_t sub_244B5F698(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[3], v2[4], v2[5], v2[6], v2[2]);
}

uint64_t sub_244B5F6AC(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 88);
}

uint64_t sub_244B5F6B4(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 96);
}

uint64_t sub_244B5F6BC(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 104);
}

unint64_t sub_244B5F6C8()
{
  unint64_t result;

  result = qword_2573E03A0;
  if (!qword_2573E03A0)
  {
    result = MEMORY[0x249520A44](&protocol conformance descriptor for ConnectionState, &type metadata for ConnectionState);
    atomic_store(result, (unint64_t *)&qword_2573E03A0);
  }
  return result;
}

unint64_t sub_244B5F708()
{
  unint64_t result;

  result = qword_2573E03A8;
  if (!qword_2573E03A8)
  {
    result = MEMORY[0x249520A44](&protocol conformance descriptor for XPCServiceError, &type metadata for XPCServiceError);
    atomic_store(result, (unint64_t *)&qword_2573E03A8);
  }
  return result;
}

uint64_t dispatch thunk of static XPCService.interface.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static XPCService.entitlementName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of static XPCService.logger.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of static XPCService.customize(serverInterface:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of ServiceConnectionProtocol.call<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of ServiceConnectionProtocol.call<A>(_:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);

  sub_244B60928();
  v1 = (_QWORD *)sub_244B608D8();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = sub_244B607C0(v1);
  return sub_244B60780(v2, v3, v4, v5, v6, v7, v8);
}

uint64_t dispatch thunk of BidirectionalServiceConnectionProtocol.getCurrentConnectionState()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of BidirectionalServiceConnectionProtocol.call<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

{
  return (*(uint64_t (**)(void))(a5 + 56))();
}

uint64_t dispatch thunk of BidirectionalServiceConnectionProtocol.call<A>(_:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);

  sub_244B60928();
  v1 = (_QWORD *)sub_244B608D8();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = sub_244B607C0(v1);
  return sub_244B60780(v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_244B5F864()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for XPCServiceClientConnection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_244B52210(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for XPCServiceClientConnection);
}

uint64_t method lookup function for XPCServiceClientConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCServiceClientConnection.__allocating_init(delegate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of static XPCServiceClientConnectionDelegate.translateXPCServiceError(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of XPCServiceClientConnectionDelegate.xpcConnectionIsAllowed()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_244B5F8F4()
{
  return swift_initClassMetadata2();
}

void type metadata accessor for BidirectionalXPCServiceClientConnection()
{
  JUMPOUT(0x2495209FCLL);
}

uint64_t method lookup function for BidirectionalXPCServiceClientConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BidirectionalXPCServiceClientConnection.__allocating_init(existingConnection:localObject:delegate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of BidirectionalXPCServiceClientConnection.__allocating_init(localObject:delegate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of InitializableFromExistingConnection.init(existingConnection:localObject:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t getEnumTagSinglePayload for ConnectionState(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFD)
  {
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
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ConnectionState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244B5FA84 + 4 * byte_244B65E15[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_244B5FAB8 + 4 * byte_244B65E10[v4]))();
}

uint64_t sub_244B5FAB8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244B5FAC0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244B5FAC8);
  return result;
}

uint64_t sub_244B5FAD4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244B5FADCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_244B5FAE0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244B5FAE8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ConnectionState()
{
  return &type metadata for ConnectionState;
}

uint64_t getEnumTagSinglePayload for XPCServiceError(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFE)
  {
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
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCServiceError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244B5FBD8 + 4 * byte_244B65E1F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_244B5FC0C + 4 * byte_244B65E1A[v4]))();
}

uint64_t sub_244B5FC0C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244B5FC14(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244B5FC1CLL);
  return result;
}

uint64_t sub_244B5FC28(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244B5FC30);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_244B5FC34(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244B5FC3C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for XPCServiceError()
{
  return &type metadata for XPCServiceError;
}

uint64_t sub_244B5FC58()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_244B5FC60()
{
  return swift_unknownObjectWeakDestroy();
}

_BYTE *sub_244B5FC68(_BYTE *a1, _BYTE *a2)
{
  *a1 = *a2;
  swift_unknownObjectWeakCopyInit();
  return a1;
}

_BYTE *sub_244B5FC94(_BYTE *a1, _BYTE *a2)
{
  *a1 = *a2;
  swift_unknownObjectWeakCopyAssign();
  return a1;
}

_BYTE *sub_244B5FCC0(_BYTE *a1, _BYTE *a2)
{
  *a1 = *a2;
  swift_unknownObjectWeakTakeInit();
  return a1;
}

_BYTE *sub_244B5FCEC(_BYTE *a1, _BYTE *a2)
{
  *a1 = *a2;
  swift_unknownObjectWeakTakeAssign();
  return a1;
}

uint64_t sub_244B5FD18(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFD && a1[16])
    {
      v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      v3 = *a1;
      v4 = v3 >= 4;
      v2 = v3 - 4;
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

uint64_t sub_244B5FD54(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 3;
  }
  return result;
}

uint64_t sub_244B5FD94()
{
  return swift_allocateGenericValueMetadata();
}

void **sub_244B5FD9C(void **a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  *a1 = *a2;
  v4 = v3;
  return a1;
}

void sub_244B5FDC8(id *a1)
{

}

void **sub_244B5FDD0(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a1;
  v4 = *a2;
  *a1 = *a2;
  v5 = v4;

  return a1;
}

_QWORD *sub_244B5FE04(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **sub_244B5FE10(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t sub_244B5FE40(uint64_t *a1, unsigned int a2)
{
  int v2;
  uint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
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

uint64_t sub_244B5FE94(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_244B5FEE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  sub_244B545B8(&qword_2543FBB20);
  v1 = sub_244B607F8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_244B5FF70(void *a1)
{
  uint64_t v1;
  NSObject *v3;
  uint64_t v4;

  v3 = *(NSObject **)(v1 + 32);
  sub_244B545B8(&qword_2543FBB20);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_244B64A80() - 8) + 80);
  sub_244B5ECFC(a1, *(_QWORD **)(v1 + 56), v1 + ((v4 + 64) & ~v4), v3);
}

uint64_t sub_244B5FFDC()
{
  uint64_t v0;

  sub_244B545B8(&qword_2543FBB20);
  v0 = sub_244B607F8();
  sub_244B60710(*(_QWORD *)(v0 - 8));
  swift_release();
  return sub_244B606D4();
}

void sub_244B6003C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_244B609BC();
  sub_244B545B8(&qword_2543FBB20);
  sub_244B608F8();
  v0 = sub_244B60754();
  sub_244B5F05C(v0, v1, v2, v3, v4);
}

void sub_244B60090(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  sub_244B600F8(a3 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)a3 + 16), (os_unfair_lock_t)(a3 + ((*(unsigned int *)(*(_QWORD *)a3 + 48) + 3) & 0x1FFFFFFFCLL)), a1, a2, a4, a5, &v5);
}

void sub_244B600F8(uint64_t a1, os_unfair_lock_t lock, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  uint64_t v7;

  os_unfair_lock_lock(lock);
  a3(a1);
  os_unfair_lock_unlock(lock);
  if (v7)
    *a7 = v7;
}

uint64_t sub_244B60178(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  type metadata accessor for os_unfair_lock_s(255);
  sub_244B64BDC();
  v4 = sub_244B64BD0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  return v4;
}

uint64_t sub_244B601FC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *(_DWORD *)((char *)a1 + ((*(unsigned int *)(*a1 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v2 + *MEMORY[0x24BEE27A8]) - 8) + 16))(a2);
}

uint64_t sub_244B60250()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_244B60274()
{
  swift_release();
  return swift_deallocObject();
}

void sub_244B60298()
{
  sub_244B602B0();
}

void sub_244B602A4()
{
  sub_244B602B0();
}

void sub_244B602B0()
{
  sub_244B5DA78();
}

#error "244B602F4: call analysis failed (funcsize=10)"

#error "244B60320: call analysis failed (funcsize=10)"

_BYTE *sub_244B6032C(_BYTE *result)
{
  *result = 3;
  return result;
}

uint64_t sub_244B60338()
{
  uint64_t v0;
  uint64_t v1;

  sub_244B545B8(&qword_2543FBB20);
  v1 = sub_244B607F8();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return sub_244B606D4();
}

uint64_t sub_244B603A8(void *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = v1[2];
  v4 = v1[3];
  v5 = v1[4];
  sub_244B545B8(&qword_2543FBB20);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(sub_244B608F8() - 8) + 80);
  return sub_244B5CB64(a1, (uint64_t)v1 + ((v6 + 40) & ~v6), v3, v4, v5);
}

uint64_t sub_244B6041C()
{
  uint64_t v0;

  sub_244B545B8(&qword_2543FBB20);
  v0 = sub_244B607F8();
  sub_244B60710(*(_QWORD *)(v0 - 8));
  swift_release();
  return sub_244B606D4();
}

void sub_244B6047C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_244B609BC();
  sub_244B545B8(&qword_2543FBB20);
  sub_244B608F8();
  v0 = sub_244B60754();
  sub_244B5CE38(v0, v1, v2, v3, v4);
}

uint64_t sub_244B604D0()
{
  swift_release();
  sub_244B6084C();
  return swift_deallocObject();
}

uint64_t sub_244B604EC()
{
  uint64_t *v0;

  return sub_244B5B82C(v0[4], v0[2], v0[3], (void (*)(uint64_t))sub_244B6054C);
}

uint64_t sub_244B60510()
{
  uint64_t *v0;

  return sub_244B5B82C(v0[4], v0[2], v0[3], (void (*)(uint64_t))sub_244B60534);
}

void sub_244B60534(id *a1)
{
  uint64_t v1;

  sub_244B5B930(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_244B6054C(uint64_t a1)
{
  uint64_t v1;

  return sub_244B5B650(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_244B60564@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_244B601FC(a1, a2);
}

uint64_t sub_244B6058C(_BYTE *a1)
{
  return sub_244B5D49C(a1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> BidirectionalXPCServiceClientConnectionDelegate.xpcBidirectionalConnectionIsAllowed()()
{
  XPCServiceClientConnectionDelegate.xpcConnectionIsAllowed()();
}

void sub_244B605FC()
{
  sub_244B5BD00();
}

void sub_244B60610()
{
  sub_244B5F5A4();
}

_BYTE *sub_244B6064C(_BYTE *a1)
{
  return sub_244B6032C(a1);
}

uint64_t dispatch thunk of BidirectionalXPCServiceClientConnectionDelegate.xpcBidirectionalConnectionIsAllowed()(uint64_t a1, uint64_t a2)
{
  return dispatch thunk of XPCServiceClientConnectionDelegate.xpcConnectionIsAllowed()(a1, a2);
}

uint64_t sub_244B60690()
{
  return swift_allocError();
}

uint64_t sub_244B6069C()
{
  return swift_allocObject();
}

uint64_t sub_244B606A4()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_244B606B8()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_244B606CC()
{
  return swift_unknownObjectRelease_n();
}

uint64_t sub_244B606D4()
{
  return swift_deallocObject();
}

uint64_t sub_244B60710@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v3 + (v2 & ~v1));
}

uint64_t sub_244B60738()
{
  return swift_release();
}

uint64_t sub_244B60754()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_244B60780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(void))
{
  return a7();
}

uint64_t sub_244B607C0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v2;
  a1[1] = v1;
  return v3;
}

void sub_244B607E8()
{
  void *v0;

}

id sub_244B607F0()
{
  void *v0;

  return v0;
}

uint64_t sub_244B607F8()
{
  return sub_244B64A80();
}

void sub_244B60804(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_244B60090(a1, a2, a3, a4, a5);
}

uint64_t sub_244B6080C()
{
  return swift_release();
}

uint64_t sub_244B60814()
{
  return swift_task_switch();
}

uint64_t sub_244B60820()
{
  return swift_task_switch();
}

uint64_t sub_244B6082C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(a2, v3, v2);
}

uint64_t sub_244B60844()
{
  return swift_task_dealloc();
}

uint64_t sub_244B6084C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_244B6085C()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_244B60874()
{
  return sub_244B64C9C();
}

uint64_t sub_244B60888(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(a2, v2, v4);
}

uint64_t sub_244B6089C()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_244B608B0()
{
  return sub_244B64C9C();
}

uint64_t sub_244B608C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_244B608D8()
{
  return swift_task_alloc();
}

uint64_t sub_244B608EC()
{
  return swift_release();
}

uint64_t sub_244B608F8()
{
  return sub_244B64A80();
}

unint64_t sub_244B60904()
{
  return sub_244B5BD18();
}

uint64_t _s22ProactiveDaemonSupport10XPCServiceP15selectorClassess13KeyValuePairsVy10ObjectiveC8SelectorV_SitShys11AnyHashableVGGvgZTj_0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_244B60914()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(v3 - 65, v0, v1);
}

uint64_t _s22ProactiveDaemonSupport10XPCServicePAAE15entitlementNameSSvgZ_0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_244B6094C()
{
  return swift_release();
}

uint64_t sub_244B6097C()
{
  return swift_retain();
}

void sub_244B60984()
{
  type metadata accessor for BidirectionalXPCServiceClientConnection.State();
}

uint64_t sub_244B6098C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t sub_244B6099C()
{
  return swift_retain();
}

uint64_t sub_244B609A4()
{
  return swift_beginAccess();
}

uint64_t sub_244B609AC()
{
  return swift_release();
}

uint64_t sub_244B609B4()
{
  return swift_release();
}

uint64_t sub_244B609C8()
{
  return swift_willThrow();
}

uint64_t sub_244B609D0()
{
  return swift_retain();
}

uint64_t sub_244B609D8()
{
  return swift_willThrow();
}

void *sub_244B609E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = a1;
  *(_QWORD *)(v2 - 112) = v1;
  return _Block_copy((const void *)(v2 - 136));
}

uint64_t sub_244B609EC()
{
  return swift_unknownObjectWeakInit();
}

uint64_t sub_244B609F4()
{
  return sub_244B64B64();
}

uint64_t sub_244B60A00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return type metadata accessor for XPCServiceClientConnection.State(0, a2, a3, a4);
}

uint64_t sub_244B60A08(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 40))(a1, v1);
}

uint64_t sub_244B60A14()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_244B60A1C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

uint64_t sub_244B60A28@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_244B60A34()
{
  uint64_t v0;

  return v0 - 65;
}

uint64_t sub_244B60A48()
{
  return sub_244B64D44();
}

id sub_244B60A54(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2, 0);
}

uint64_t sub_244B60A74()
{
  return swift_willThrow();
}

unint64_t sub_244B60A7C()
{
  return sub_244B5BD18();
}

void *sub_244B60A88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = a1;
  *(_QWORD *)(v2 - 104) = v1;
  return _Block_copy((const void *)(v2 - 128));
}

void static XPCServiceBidirectionalServer.start()(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedConformanceWitness;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  uint64_t v17;
  void *v18;

  v4 = sub_244B648C4();
  v17 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v5);
  sub_244B60D04();
  v6 = sub_244B628F4();
  sub_244B628F4();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(v6, AssociatedConformanceWitness);
  v8 = sub_244B60D40();
  sub_244B629A4((uint64_t)v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 56));
  v9 = sub_244B62A0C(*(uint64_t (**)(uint64_t, uint64_t))(a2 + 48));
  if (v9)
  {
    v18 = (void *)v9;
    type metadata accessor for BidirectionalDelegate(0, a1, a2, v10);
    v11 = sub_244B60DB0();
    sub_244B629A4((uint64_t)v11, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 80));
    sub_244B62A0C(*(uint64_t (**)(uint64_t, uint64_t))(a2 + 72));
    sub_244B62A54(v18, sel_setDelegate_);
    swift_unknownObjectRelease();
    objc_msgSend(v18, sel_resume, v17);

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 48))(v6, AssociatedConformanceWitness);
    v12 = sub_244B648B8();
    v13 = sub_244B64AD4();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)sub_244B5AC30();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_244B4F000, v12, v13, "Failed to create Internal XPC service", v14, 2u);
      sub_244B549E8();
    }

    v15 = sub_244B62A64();
    v16(v15);
  }
}

unint64_t sub_244B60D04()
{
  unint64_t result;

  result = qword_2543FBC60[0];
  if (!qword_2543FBC60[0])
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, qword_2543FBC60);
  }
  return result;
}

id sub_244B60D40()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_244B649F0();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithMachServiceName_, v1);

  return v2;
}

id sub_244B60DB0()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t XPCServiceBidirectionalServerInstanceParameters.clientApplicationIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static XPCServiceBidirectionalServerInstance.serviceEntitlementRequired.getter()
{
  return 1;
}

uint64_t sub_244B60E08(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedConformanceWitness;
  uint64_t AssociatedTypeWitness;
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
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_QWORD);
  NSObject *v38;
  os_log_type_t v39;
  _BOOL4 v40;
  uint64_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t);
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t);
  uint64_t (*v50)(id, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  os_log_type_t v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  uint64_t v73;
  NSObject *v74;
  os_log_type_t v75;
  uint8_t *v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  os_log_type_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  NSObject *v89;
  os_log_type_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const void *v98;
  const void *v99;
  void (*v100)(__int128 *, id, uint64_t, uint64_t);
  id v101;
  uint64_t v102;
  uint64_t v103;
  NSObject *v104;
  os_log_type_t v105;
  uint8_t *v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t);
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  void (*v112)(uint64_t, const void *, uint64_t);
  uint64_t v113;
  void (*v114)(_QWORD);
  uint64_t v115;
  void (*v116)(id, void (*)(_QWORD), uint64_t, uint64_t);
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const void *v123;
  const void *v124;
  _QWORD *v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  uint64_t v129;
  _QWORD *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t result;
  _QWORD v135[3];
  uint64_t v136;
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
  void (*v147)(uint64_t, const void *, uint64_t);
  const void *v148;
  void (*v149)(char *, uint64_t);
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void (*v153)(_QWORD);
  uint64_t v154;
  uint64_t v155;
  id v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  __int128 v160;
  __int128 v161;
  uint64_t (*v162)();
  _QWORD *v163;
  char v164[8];

  v156 = a2;
  v4 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x50);
  v3 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x58);
  sub_244B628F4();
  sub_244B62A64();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = sub_244B64B64();
  MEMORY[0x24BDAC7A8](v7, v8);
  sub_244B62940((uint64_t)v135 - v9);
  v10 = swift_checkMetadataState();
  v143 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v11);
  sub_244B629E4();
  sub_244B628B8();
  MEMORY[0x24BDAC7A8](v12, v13);
  sub_244B62940((uint64_t)v135 - v14);
  v139 = sub_244B64B64();
  v138 = *(_QWORD *)(v139 - 8);
  MEMORY[0x24BDAC7A8](v139, v15);
  sub_244B62940((uint64_t)v135 - v16);
  v17 = sub_244B648C4();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17, v19);
  sub_244B629E4();
  sub_244B628B8();
  MEMORY[0x24BDAC7A8](v20, v21);
  sub_244B62970();
  sub_244B628B8();
  MEMORY[0x24BDAC7A8](v22, v23);
  sub_244B62970();
  sub_244B628B8();
  MEMORY[0x24BDAC7A8](v24, v25);
  sub_244B62970();
  sub_244B628B8();
  MEMORY[0x24BDAC7A8](v26, v27);
  sub_244B62970();
  sub_244B628B8();
  MEMORY[0x24BDAC7A8](v28, v29);
  sub_244B62970();
  sub_244B628B8();
  MEMORY[0x24BDAC7A8](v30, v31);
  v33 = (char *)v135 - v32;
  v151 = v3;
  v150 = v4;
  v34 = sub_244B628F4();
  v152 = AssociatedConformanceWitness;
  v137 = swift_getAssociatedConformanceWitness();
  v148 = (const void *)AssociatedTypeWitness;
  v35 = swift_getAssociatedConformanceWitness();
  v36 = sub_244B62A64();
  v153 = v37;
  v37(v36);
  v38 = sub_244B648B8();
  v39 = sub_244B64AE0();
  v40 = os_log_type_enabled(v38, v39);
  v157 = v35;
  v155 = v17;
  v154 = v34;
  if (v40)
  {
    v41 = sub_244B5AC30();
    v135[2] = v10;
    v42 = (uint8_t *)v41;
    v43 = sub_244B5AC30();
    v135[1] = v18;
    *(_QWORD *)&v160 = v43;
    *(_DWORD *)v42 = 136446210;
    v44 = sub_244B62A64();
    v46 = v45(v44);
    v48 = sub_244B628D4(v46, v47);
    sub_244B62A40(v48);
    sub_244B64B70();
    sub_244B62908();
    sub_244B62A18(&dword_244B4F000, v38, v39, "%{public}s BidirectionalDelegate: Got connection request.", v42);
    sub_244B5AC68();
    sub_244B549E8();
  }

  v49 = *(void (**)(char *, uint64_t))(v18 + 8);
  v49(v33, v17);
  sub_244B5223C();
  v50 = (uint64_t (*)(id, uint64_t, uint64_t))off_2543FBB70;
  v51 = v154;
  v52 = v157;
  v53 = v152;
  if (off_2543FBB70)
  {
    swift_retain();
    v54 = v50(v156, v51, v52);
    sub_244B62768((uint64_t)v50);
    if ((v54 & 1) == 0)
    {
      v73 = v146;
      sub_244B628C8();
      v74 = sub_244B648B8();
      v75 = sub_244B64AE0();
      if (os_log_type_enabled(v74, v75))
      {
        v76 = (uint8_t *)sub_244B5AC30();
        *(_QWORD *)&v160 = sub_244B5AC30();
        *(_DWORD *)v76 = 136446210;
        v77 = (*(uint64_t (**)(void))(v52 + 24))();
        v79 = sub_244B628D4(v77, v78);
        sub_244B62A40(v79);
        sub_244B629D8();
        sub_244B62908();
        sub_244B62A18(&dword_244B4F000, v74, v75, "%{public}s BidirectionalDelegate: Failed global enablement check. Rejecting connection.", v76);
        sub_244B5AC68();
        sub_244B549E8();
      }

      v49((char *)v73, v17);
      return 0;
    }
  }
  if ((sub_244B62994(*(uint64_t (**)(uint64_t, uint64_t))(v53 + 40)) & 1) != 0)
  {
    v55 = sub_244B629B4(*(uint64_t (**)(uint64_t, uint64_t))(v52 + 24));
    v57 = v56;
    v58 = v10;
    v59 = sub_244B629B4(*(uint64_t (**)(uint64_t, uint64_t))(v52 + 32));
    v61 = v60;
    v62 = v53;
    v63 = v49;
    v64 = (uint64_t)v149;
    sub_244B628C8();
    v65 = v59;
    v10 = v58;
    LOBYTE(v55) = sub_244B62E04(v55, v57, v65, v61);
    swift_bridgeObjectRelease();
    v52 = v157;
    swift_bridgeObjectRelease();
    v66 = v64;
    v49 = v63;
    v53 = v62;
    sub_244B629CC(v66);
    if ((v55 & 1) == 0)
      return 0;
  }
  v67 = v150;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v68 = static XPCService.xpcInterface()();
  v69 = v156;
  sub_244B62A54(v156, sel_setRemoteObjectInterface_);

  v70 = static XPCService.xpcInterface()();
  sub_244B62A54(v69, sel_setExportedInterface_);

  v71 = (void *)sub_244B649F0();
  v72 = objc_msgSend(v69, sel_valueForEntitlement_, v71);

  if (v72)
  {
    sub_244B64B88();
    swift_unknownObjectRelease();
  }
  else
  {
    v160 = 0u;
    v161 = 0u;
  }
  sub_244B62778((uint64_t)&v160, (uint64_t)v164);
  sub_244B627C0((uint64_t)v164, (uint64_t)&v160);
  if (*((_QWORD *)&v161 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v149 = v49;
      v81 = v158;
      v80 = v159;
      v82 = v144;
      sub_244B628C8();
      swift_bridgeObjectRetain_n();
      v83 = sub_244B648B8();
      v84 = sub_244B64AE0();
      if (os_log_type_enabled(v83, v84))
      {
        v85 = sub_244B5AC30();
        v146 = sub_244B5AC30();
        *(_QWORD *)&v160 = v146;
        *(_DWORD *)v85 = 136446466;
        v86 = (*(uint64_t (**)(uint64_t, uint64_t))(v157 + 24))(v51, v157);
        v158 = sub_244B628D4(v86, v87);
        sub_244B64B70();
        sub_244B62908();
        *(_WORD *)(v85 + 12) = 2080;
        swift_bridgeObjectRetain();
        v158 = sub_244B54E58(v81, v80, (uint64_t *)&v160);
        sub_244B64B70();
        swift_bridgeObjectRelease_n();
        sub_244B629F8(&dword_244B4F000, v83, v84, "%{public}s BidirectionalDelegate: clientApplicationIdentifier: %s", (uint8_t *)v85);
        swift_arrayDestroy();
        sub_244B549E8();
      }

      swift_bridgeObjectRelease_n();
      sub_244B628E0(v82);
      goto LABEL_24;
    }
  }
  else
  {
    sub_244B62808((uint64_t)&v160);
  }
  if ((sub_244B62994(*(uint64_t (**)(uint64_t, uint64_t))(v53 + 32)) & 1) != 0)
  {
    v88 = v145;
    sub_244B628C8();
    v89 = sub_244B648B8();
    v90 = sub_244B64AC8();
    if (sub_244B62960(v90))
    {
      v91 = sub_244B5AC30();
      *(_QWORD *)&v160 = sub_244B5AC30();
      *(_DWORD *)v91 = 136446466;
      v92 = (*(uint64_t (**)(uint64_t))(v52 + 24))(v51);
      v94 = sub_244B628D4(v92, v93);
      sub_244B6297C(v94);
      sub_244B64B70();
      sub_244B62908();
      *(_WORD *)(v91 + 12) = 2082;
      v95 = sub_244B54E58(0xD000000000000016, 0x8000000244B66BE0, (uint64_t *)&v160);
      sub_244B6291C(v95);
      sub_244B629F8(&dword_244B4F000, v89, v67, "%{public}s BidirectionalDelegate: Client is missing '%{public}s' entitlement. This entitlement is required. Rejecting connection.", (uint8_t *)v91);
      swift_arrayDestroy();
      sub_244B549E8();
    }

    sub_244B629CC(v88);
    goto LABEL_28;
  }
  v149 = v49;
  v81 = 0;
  v80 = 0;
LABEL_24:
  v96 = (uint64_t)v148;
  v97 = (void *)swift_allocBox();
  v99 = v98;
  *(_QWORD *)&v160 = v81;
  *((_QWORD *)&v160 + 1) = v80;
  v100 = *(void (**)(__int128 *, id, uint64_t, uint64_t))(v53 + 24);
  v101 = v156;
  v102 = (uint64_t)v147;
  v100(&v160, v101, v10, v53);
  if (sub_244B543FC(v102, 1, v10) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v138 + 8))(v102, v139);
    swift_deallocBox();
    v103 = v141;
    sub_244B62A20();
    sub_244B628C8();
    v104 = sub_244B648B8();
    v105 = sub_244B64AC8();
    if (sub_244B62960(v105))
    {
      v106 = (uint8_t *)sub_244B5AC30();
      *(_QWORD *)&v160 = sub_244B5AC30();
      *(_DWORD *)v106 = 136446210;
      v107 = sub_244B62A20();
      v109 = v108(v107);
      v158 = sub_244B628D4(v109, v110);
      sub_244B629D8();
      sub_244B62908();
      sub_244B62A18(&dword_244B4F000, v104, (os_log_type_t)v102, "%{public}s BidirectionalDelegate: connection rejected by server instance.", v106);
      sub_244B5AC68();
      sub_244B549E8();
    }

    sub_244B628E0(v103);
LABEL_28:
    sub_244B62A38();
    return 0;
  }
  v156 = v97;
  v111 = v143;
  (*(void (**)(const void *, uint64_t, uint64_t))(v143 + 32))(v99, v102, v10);
  v112 = *(void (**)(uint64_t, const void *, uint64_t))(v111 + 16);
  v148 = v99;
  v147 = v112;
  v112(v140, v99, v10);
  swift_getAssociatedTypeWitness();
  v113 = v10;
  if (swift_dynamicCast())
  {
    v114 = (void (*)(_QWORD))v160;
    v115 = v137;
    v116 = *(void (**)(id, void (*)(_QWORD), uint64_t, uint64_t))(v137 + 24);
    v117 = v101;
    swift_unknownObjectRetain();
    v118 = v142;
    v116(v117, v114, v96, v115);
    v119 = v118;
    v120 = 1;
    sub_244B53AA4(v119, 0, 1, v96);
    v121 = v119;
    v122 = v117;
    v123 = v148;
    v124 = v148;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 56))(v121, v113, v53);
    v125 = (_QWORD *)sub_244B62A2C();
    v153 = v114;
    v126 = v150;
    v127 = v151;
    v125[2] = v150;
    v125[3] = v127;
    v128 = v156;
    v125[4] = v156;
    v162 = sub_244B6286C;
    v163 = v125;
    *(_QWORD *)&v160 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v160 + 1) = 1107296256;
    sub_244B62A00((uint64_t)&unk_2515B5A48);
    sub_244B62950();
    v129 = swift_release();
    sub_244B62910(v129, sel_setInterruptionHandler_);
    _Block_release(v124);
    v130 = (_QWORD *)sub_244B62A2C();
    v130[2] = v126;
    v130[3] = v127;
    v130[4] = v128;
    v162 = sub_244B62890;
    v163 = v130;
    *(_QWORD *)&v160 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v160 + 1) = 1107296256;
    sub_244B62A00((uint64_t)&unk_2515B5B38);
    sub_244B62950();
    v131 = swift_release();
    sub_244B62910(v131, sel_setInvalidationHandler_);
    _Block_release(v124);
    sub_244B5223C();
    v132 = v136;
    v147(v136, v123, v113);
    sub_244B64CB4();
    v133 = (*(uint64_t (**)(uint64_t, uint64_t))(v143 + 8))(v132, v113);
    sub_244B62910(v133, sel_setExportedObject_);
    swift_unknownObjectRelease();
    objc_msgSend(v122, sel_resume);
    sub_244B629C0();
    sub_244B62A38();
    swift_release();
    return v120;
  }
  result = sub_244B64C3C();
  __break(1u);
  return result;
}

uint64_t sub_244B61E50()
{
  uint64_t AssociatedTypeWitness;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t AssociatedConformanceWitness;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  _QWORD v24[2];
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32[3];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v1 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v2);
  v4 = (char *)v24 - v3;
  v5 = sub_244B648C4();
  v28 = *(_QWORD *)(v5 - 8);
  v29 = v5;
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = swift_projectBox();
  v9 = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v11 = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(v11 + 48))(v9, v11);
  v12 = sub_244B648B8();
  v13 = sub_244B64AC8();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v25 = AssociatedConformanceWitness;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc();
    v27 = v1;
    v17 = v16;
    v32[0] = v16;
    v26 = v4;
    *(_DWORD *)v15 = 136446210;
    v24[1] = v15 + 4;
    v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 24))(v9, v11);
    v31 = sub_244B54E58(v18, v19, v32);
    v4 = v26;
    sub_244B64B70();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_244B4F000, v12, v13, "%{public}s BidirectionalDelegate: connection interrupted.", v15, 0xCu);
    swift_arrayDestroy();
    v20 = v17;
    v1 = v27;
    MEMORY[0x249520AE0](v20, -1, -1);
    v21 = v15;
    AssociatedConformanceWitness = v25;
    MEMORY[0x249520AE0](v21, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v29);
  v22 = v30;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v22, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 72))(AssociatedTypeWitness, AssociatedConformanceWitness);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, AssociatedTypeWitness);
}

uint64_t sub_244B6216C()
{
  uint64_t AssociatedTypeWitness;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t AssociatedConformanceWitness;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  _QWORD v24[2];
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32[3];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v1 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v2);
  v4 = (char *)v24 - v3;
  v5 = sub_244B648C4();
  v28 = *(_QWORD *)(v5 - 8);
  v29 = v5;
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = swift_projectBox();
  v9 = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v11 = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(v11 + 48))(v9, v11);
  v12 = sub_244B648B8();
  v13 = sub_244B64AE0();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v25 = AssociatedConformanceWitness;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc();
    v27 = v1;
    v17 = v16;
    v32[0] = v16;
    v26 = v4;
    *(_DWORD *)v15 = 136446210;
    v24[1] = v15 + 4;
    v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 24))(v9, v11);
    v31 = sub_244B54E58(v18, v19, v32);
    v4 = v26;
    sub_244B64B70();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_244B4F000, v12, v13, "%{public}s BidirectionalDelegate: connection invalidated.", v15, 0xCu);
    swift_arrayDestroy();
    v20 = v17;
    v1 = v27;
    MEMORY[0x249520AE0](v20, -1, -1);
    v21 = v15;
    AssociatedConformanceWitness = v25;
    MEMORY[0x249520AE0](v21, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v29);
  v22 = v30;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v22, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 80))(AssociatedTypeWitness, AssociatedConformanceWitness);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, AssociatedTypeWitness);
}

uint64_t sub_244B62488(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  v9 = sub_244B60E08((uint64_t)v8, v7);

  return v9 & 1;
}

id sub_244B624E4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_244B62518()
{
  return sub_244B624E4();
}

id sub_244B62538()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BidirectionalDelegate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_244B52210(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BidirectionalDelegate);
}

uint64_t dispatch thunk of static XPCServiceBidirectionalServer.listener.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of static XPCServiceBidirectionalServer.listener.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of static XPCServiceBidirectionalServer.delegate.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of static XPCServiceBidirectionalServer.delegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

_QWORD *initializeBufferWithCopyOfBuffer for XPCServiceBidirectionalServerInstanceParameters(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for XPCServiceBidirectionalServerInstanceParameters()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for XPCServiceBidirectionalServerInstanceParameters(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for XPCServiceBidirectionalServerInstanceParameters(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for XPCServiceBidirectionalServerInstanceParameters(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCServiceBidirectionalServerInstanceParameters(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
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

uint64_t storeEnumTagSinglePayload for XPCServiceBidirectionalServerInstanceParameters(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCServiceBidirectionalServerInstanceParameters()
{
  return &type metadata for XPCServiceBidirectionalServerInstanceParameters;
}

uint64_t dispatch thunk of XPCServiceBidirectionalServerInstance.init(parameters:connection:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of static XPCServiceBidirectionalServerInstance.clientApplicationIdentifierEntitlementRequired.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of static XPCServiceBidirectionalServerInstance.serviceEntitlementRequired.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of XPCServiceBidirectionalServerInstance.clientProxy.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of XPCServiceBidirectionalServerInstance.xpcConnectionWasInvalidated()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t sub_244B62734()
{
  return swift_initClassMetadata2();
}

uint64_t sub_244B62768(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_244B62778(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_244B511A0(qword_2543FBBC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_244B627C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_244B511A0(qword_2543FBBC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_244B62808(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_244B511A0(qword_2543FBBC8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_244B62848()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244B6286C()
{
  return sub_244B61E50();
}

uint64_t sub_244B62878(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_244B62888()
{
  return swift_release();
}

uint64_t sub_244B62890()
{
  return sub_244B6216C();
}

void sub_244B628B8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

uint64_t sub_244B628C8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 - 280))();
}

uint64_t sub_244B628D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_244B54E58(a1, a2, (uint64_t *)(v2 - 224));
}

uint64_t sub_244B628E0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 - 312))(a1, *(_QWORD *)(v1 - 264));
}

uint64_t sub_244B628F4()
{
  return swift_getAssociatedTypeWitness();
}

void sub_244B62900()
{
  void *v0;

}

uint64_t sub_244B62908()
{
  return swift_bridgeObjectRelease();
}

id sub_244B62910(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t sub_244B6291C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 240) = a1;
  return sub_244B64B70();
}

uint64_t _s22ProactiveDaemonSupport29XPCServiceBidirectionalServerP8delegateSo21NSXPCListenerDelegate_pSgvgZTj_0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t _s22ProactiveDaemonSupport29XPCServiceBidirectionalServerP8listenerSo13NSXPCListenerCSgvsZTj_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t sub_244B62940@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return 0;
}

uint64_t sub_244B62950()
{
  return swift_retain();
}

BOOL sub_244B62960(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_244B6297C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 240) = a1;
  return v1 - 240;
}

uint64_t sub_244B62994@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_244B629A4@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

uint64_t sub_244B629B4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_244B629C0()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_244B629CC(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, _QWORD);
  uint64_t v2;

  return v1(a1, *(_QWORD *)(v2 - 264));
}

uint64_t sub_244B629D8()
{
  return sub_244B64B70();
}

void sub_244B629F8(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x16u);
}

void *sub_244B62A00@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 208) = v1;
  *(_QWORD *)(v2 - 200) = a1;
  return _Block_copy((const void *)(v2 - 224));
}

uint64_t sub_244B62A0C@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

void sub_244B62A18(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t sub_244B62A20()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_244B62A2C()
{
  return swift_allocObject();
}

uint64_t sub_244B62A38()
{
  uint64_t v0;

  return sub_244B62808(v0 - 160);
}

uint64_t sub_244B62A40(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 160) = a1;
  return v1 - 160;
}

id sub_244B62A54(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

id sub_244B62A5C()
{
  void *v0;

  return v0;
}

uint64_t sub_244B62A64()
{
  uint64_t v0;

  return v0;
}

void *static XPCServiceFrameworkGlobals.globalConnectionPolicy.getter()
{
  void *v0;

  sub_244B609A4();
  v0 = off_2543FBB70;
  sub_244B62AC0((uint64_t)off_2543FBB70);
  return v0;
}

uint64_t sub_244B62AC0(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t static XPCServiceFrameworkGlobals.globalConnectionPolicy.setter(void *a1, uint64_t a2)
{
  void *v4;

  sub_244B609A4();
  v4 = off_2543FBB70;
  off_2543FBB70 = a1;
  qword_2543FBB78 = a2;
  return sub_244B62768((uint64_t)v4);
}

uint64_t (*static XPCServiceFrameworkGlobals.globalConnectionPolicy.modify())()
{
  sub_244B609A4();
  return j_j__swift_endAccess;
}

uint64_t sub_244B62B60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_244B511A0(&qword_2543FBBC0);
  sub_244B62D94(v0, qword_2543FBB50);
  v1 = sub_244B59C8C(v0, (uint64_t)qword_2543FBB50);
  v2 = sub_244B648C4();
  return sub_244B53AA4(v1, 1, 1, v2);
}

void static XPCServiceFrameworkGlobals.xpcObjectLogging.getter(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2543FBB68 != -1)
    swift_once();
  v2 = sub_244B511A0(&qword_2543FBBC0);
  v3 = sub_244B59C8C(v2, (uint64_t)qword_2543FBB50);
  sub_244B609A4();
  sub_244B54DD0(v3, a1);
  sub_244B566B8();
}

void static XPCServiceFrameworkGlobals.xpcObjectLogging.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2543FBB68 != -1)
    swift_once();
  v2 = sub_244B511A0(&qword_2543FBBC0);
  v3 = sub_244B59C8C(v2, (uint64_t)qword_2543FBB50);
  sub_244B609A4();
  sub_244B62CC0(a1, v3);
  swift_endAccess();
  sub_244B54E18(a1);
  sub_244B566B8();
}

uint64_t sub_244B62CC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_244B511A0(&qword_2543FBBC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t (*static XPCServiceFrameworkGlobals.xpcObjectLogging.modify())()
{
  uint64_t v0;

  if (qword_2543FBB68 != -1)
    swift_once();
  v0 = sub_244B511A0(&qword_2543FBBC0);
  sub_244B59C8C(v0, (uint64_t)qword_2543FBB50);
  sub_244B609A4();
  return j__swift_endAccess;
}

ValueMetadata *type metadata accessor for XPCServiceFrameworkGlobals()
{
  return &type metadata for XPCServiceFrameworkGlobals;
}

uint64_t *sub_244B62D94(uint64_t a1, uint64_t *a2)
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

uint64_t sub_244B62DD8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_244B62E04(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  void *v4;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  char v34;
  _OWORD v35[2];
  uint64_t v36[4];

  v7 = (void *)sub_244B649F0();
  v8 = objc_msgSend(v4, sel_valueForEntitlement_, v7);

  if (v8)
  {
    sub_244B64B88();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v35, 0, sizeof(v35));
  }
  sub_244B62778((uint64_t)v35, (uint64_t)v36);
  if (v36[3])
  {
    if (swift_dynamicCast() && (v34 & 1) != 0)
    {
      sub_244B64744();
      v9 = v4;
      v10 = sub_244B648B8();
      v11 = sub_244B64AE0();
      if (os_log_type_enabled(v10, v11))
      {
        v12 = sub_244B5AC30();
        v36[0] = sub_244B5AC30();
        *(_DWORD *)v12 = 136446466;
        v13 = sub_244B647E8();
        *(_QWORD *)&v35[0] = sub_244B64770(v13, v14, v15, v16, v17, v18);
        sub_244B64B70();
        sub_244B6475C();
        *(_WORD *)(v12 + 12) = 1026;
        v19 = objc_msgSend(v9, sel_processIdentifier);

        LODWORD(v35[0]) = v19;
        sub_244B647A0();

        _os_log_impl(&dword_244B4F000, v10, v11, "%{public}s Delegate: XPC connection for service from %{public}d", (uint8_t *)v12, 0x12u);
        sub_244B5AC68();
        sub_244B549E8();
      }
      sub_244B64750();

      return 1;
    }
  }
  else
  {
    sub_244B62808((uint64_t)v36);
  }
  sub_244B64744();
  v20 = v4;
  swift_bridgeObjectRetain_n();
  v21 = v20;
  v22 = sub_244B648B8();
  v23 = sub_244B64AC8();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = sub_244B5AC30();
    v36[0] = sub_244B5AC30();
    *(_DWORD *)v24 = 136446722;
    v25 = sub_244B647E8();
    *(_QWORD *)&v35[0] = sub_244B64770(v25, v26, v27, v28, v29, v30);
    sub_244B64B70();
    sub_244B6475C();
    *(_WORD *)(v24 + 12) = 1026;
    v31 = objc_msgSend(v21, sel_processIdentifier);

    LODWORD(v35[0]) = v31;
    sub_244B647A0();

    *(_WORD *)(v24 + 18) = 2082;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v35[0] = sub_244B54E58(a3, a4, v36);
    sub_244B64B70();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_244B4F000, v22, v23, "%{public}s Delegate: Rejecting connection from %{public}d: lacking entitlement '%{public}s'", (uint8_t *)v24, 0x1Cu);
    swift_arrayDestroy();
    sub_244B549E8();
  }
  swift_bridgeObjectRelease_n();
  sub_244B64750();

  return 0;
}

uint64_t XPCServiceServerInstanceParameters.clientApplicationIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static XPCServiceServerInstance.serviceEntitlementRequired.getter()
{
  return 1;
}

void static XPCServiceServer.start()(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  id v20;

  v4 = sub_244B648C4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244B60D04();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = sub_244B647D0();
  (*(void (**)(uint64_t, uint64_t))(v10 + 24))(AssociatedTypeWitness, v10);
  v11 = sub_244B60D40();
  sub_244B629A4((uint64_t)v11, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 48));
  v12 = (void *)sub_244B62A0C(*(uint64_t (**)(uint64_t, uint64_t))(a2 + 40));
  if (v12)
  {
    v20 = v12;
    type metadata accessor for Delegate(0, a1, a2, v13);
    v14 = sub_244B60DB0();
    sub_244B629A4((uint64_t)v14, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 72));
    v15 = sub_244B62A0C(*(uint64_t (**)(uint64_t, uint64_t))(a2 + 64));
    objc_msgSend(v20, sel_setDelegate_, v15);
    swift_unknownObjectRelease();
    objc_msgSend(v20, sel_resume);

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v10 + 48))(AssociatedTypeWitness, v10);
    v16 = sub_244B648B8();
    v17 = sub_244B64AD4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)sub_244B5AC30();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_244B4F000, v16, v17, "Failed to create Internal XPC service", v18, 2u);
      sub_244B549E8();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
}

uint64_t sub_244B633F0(uint64_t a1, void *a2)
{
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
  char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint64_t v33;
  _DWORD *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(id, uint64_t, uint64_t);
  char v39;
  uint64_t AssociatedConformanceWitness;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  _QWORD *v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  _QWORD *v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  _BOOL4 v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t (*v76)(id, uint64_t, uint64_t);
  uint64_t v77;
  void (*v78)(__int128 *, id, uint64_t, uint64_t);
  id v79;
  uint64_t v80;
  os_log_type_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v85;
  char *v86;
  char *v87;
  uint64_t v88;
  void *v89;
  char *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  char *v109;
  uint64_t (*v110)(id, uint64_t, uint64_t);
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void (*v114)(uint64_t, uint64_t);
  id v115;
  _QWORD *v116;
  uint64_t v117;
  unint64_t v118;
  __int128 v119;
  __int128 v120;
  uint64_t (*v121)();
  uint64_t v122;
  _BYTE v123[24];

  v115 = a2;
  v4 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x50);
  v3 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x58);
  v5 = sub_244B64780();
  v100 = sub_244B64B64();
  v99 = *(_QWORD *)(v100 - 8);
  v7 = MEMORY[0x24BDAC7A8](v100, v6);
  v109 = (char *)&v95 - v8;
  v9 = *(_QWORD *)(v5 - 8);
  v11 = MEMORY[0x24BDAC7A8](v7, v10);
  v102 = (char *)&v95 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = v12;
  MEMORY[0x24BDAC7A8](v11, v13);
  v107 = (char *)&v95 - v14;
  v116 = (_QWORD *)sub_244B648C4();
  v113 = *(v116 - 1);
  MEMORY[0x24BDAC7A8](v116, v15);
  sub_244B628B8();
  MEMORY[0x24BDAC7A8](v16, v17);
  sub_244B62970();
  sub_244B628B8();
  MEMORY[0x24BDAC7A8](v18, v19);
  sub_244B62970();
  sub_244B628B8();
  MEMORY[0x24BDAC7A8](v20, v21);
  sub_244B62970();
  sub_244B628B8();
  MEMORY[0x24BDAC7A8](v22, v23);
  sub_244B62970();
  sub_244B628B8();
  MEMORY[0x24BDAC7A8](v24, v25);
  v27 = (char *)&v95 - v26;
  v28 = sub_244B64780();
  v112 = v3;
  v111 = v4;
  v29 = sub_244B647D0();
  v114 = *(void (**)(uint64_t, uint64_t))(v29 + 48);
  v114(v28, v29);
  v30 = sub_244B64768();
  v31 = sub_244B64AE0();
  v32 = os_log_type_enabled(v30, v31);
  v108 = v9;
  if (v32)
  {
    v33 = sub_244B5AC30();
    v98 = v5;
    v34 = (_DWORD *)v33;
    *(_QWORD *)&v119 = sub_244B5AC30();
    *v34 = 136446210;
    v35 = sub_244B64718(*(uint64_t (**)(uint64_t, uint64_t))(v29 + 24));
    v37 = sub_244B646CC(v35, v36);
    sub_244B62A40(v37);
    sub_244B64B70();
    sub_244B62908();
    sub_244B64724(&dword_244B4F000, v30, v31, "%{public}s Delegate: Got connection request.");
    sub_244B5AC68();
    sub_244B549E8();
  }

  v113 = *(_QWORD *)(v113 + 8);
  ((void (*)(char *, _QWORD *))v113)(v27, v116);
  swift_beginAccess();
  v38 = (uint64_t (*)(id, uint64_t, uint64_t))off_2543FBB70;
  if (off_2543FBB70)
  {
    swift_retain();
    v39 = v38(v115, v28, v29);
    sub_244B62768((uint64_t)v38);
    if ((v39 & 1) == 0)
    {
      v54 = v116;
      v55 = v106;
      sub_244B646D8();
      v56 = sub_244B64768();
      v57 = sub_244B64AE0();
      if (os_log_type_enabled(v56, v57))
      {
        sub_244B5AC30();
        *(_QWORD *)&v119 = sub_244B5AC30();
        v58 = sub_244B646EC(4.8751e-34);
        v60 = sub_244B646CC(v58, v59);
        sub_244B62A40(v60);
        sub_244B647C4();
        sub_244B62908();
        sub_244B64724(&dword_244B4F000, v56, v57, "%{public}s Delegate: Failed global enablement check. Rejecting connection.");
        sub_244B5AC68();
        sub_244B549E8();
      }

      ((void (*)(uint64_t, _QWORD *))v113)(v55, v54);
      return 0;
    }
  }
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  if ((sub_244B64790(*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24)) & 1) != 0)
  {
    v41 = sub_244B64718(*(uint64_t (**)(uint64_t, uint64_t))(v29 + 24));
    v106 = AssociatedConformanceWitness;
    v42 = v5;
    v44 = v43;
    v45 = sub_244B64718(*(uint64_t (**)(uint64_t, uint64_t))(v29 + 32));
    v46 = v29;
    v48 = v47;
    v38 = v110;
    v114(v28, v46);
    LOBYTE(v41) = sub_244B62E04(v41, v44, v45, v48);
    v5 = v42;
    v49 = v116;
    AssociatedConformanceWitness = v106;
    swift_bridgeObjectRelease();
    v29 = v46;
    swift_bridgeObjectRelease();
    ((void (*)(uint64_t (*)(id, uint64_t, uint64_t), _QWORD *))v113)(v38, v49);
    if ((v41 & 1) == 0)
      return 0;
  }
  v50 = static XPCService.xpcInterface()();
  v51 = v115;
  objc_msgSend(v115, sel_setExportedInterface_, v50);

  v52 = (void *)sub_244B649F0();
  v53 = objc_msgSend(v51, sel_valueForEntitlement_, v52);

  if (v53)
  {
    sub_244B64B88();
    swift_unknownObjectRelease();
  }
  else
  {
    v119 = 0u;
    v120 = 0u;
  }
  sub_244B62778((uint64_t)&v119, (uint64_t)v123);
  sub_244B627C0((uint64_t)v123, (uint64_t)&v119);
  if (*((_QWORD *)&v120 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v38 = (uint64_t (*)(id, uint64_t, uint64_t))v117;
      v61 = v118;
      v62 = v105;
      sub_244B646D8();
      sub_244B64744();
      v63 = sub_244B648B8();
      v64 = sub_244B64AE0();
      LODWORD(v110) = v64;
      v65 = os_log_type_enabled(v63, v64);
      v97 = v29;
      v96 = v28;
      if (v65)
      {
        v66 = sub_244B5AC30();
        v106 = sub_244B5AC30();
        *(_QWORD *)&v119 = v106;
        *(_DWORD *)v66 = 136446466;
        v67 = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 24))(v28, v29);
        v117 = sub_244B646CC(v67, v68);
        sub_244B64B70();
        sub_244B62908();
        *(_WORD *)(v66 + 12) = 2082;
        sub_244B647E8();
        v117 = sub_244B54E58((uint64_t)v38, v61, (uint64_t *)&v119);
        sub_244B64B70();
        sub_244B6475C();
        _os_log_impl(&dword_244B4F000, v63, (os_log_type_t)v110, "%{public}s Delegate: clientApplicationIdentifier: %{public}s", (uint8_t *)v66, 0x16u);
        swift_arrayDestroy();
        sub_244B549E8();
      }
      v75 = v5;

      sub_244B64750();
      sub_244B6470C(v62);
      v77 = (uint64_t)v109;
      v76 = v38;
      v28 = v96;
      goto LABEL_23;
    }
  }
  else
  {
    sub_244B62808((uint64_t)&v119);
  }
  if ((sub_244B64790(*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 16)) & 1) != 0)
  {
    v69 = v104;
    sub_244B646D8();
    v70 = sub_244B64768();
    v71 = sub_244B64AC8();
    if (sub_244B62960(v71))
    {
      v72 = sub_244B5AC30();
      *(_QWORD *)&v119 = sub_244B5AC30();
      *(_DWORD *)v72 = 136446466;
      v73 = (*(uint64_t (**)(uint64_t))(v29 + 24))(v28);
      v117 = sub_244B646CC(v73, v74);
      sub_244B64B70();
      sub_244B62908();
      *(_WORD *)(v72 + 12) = 2082;
      v117 = sub_244B54E58(0xD000000000000016, 0x8000000244B66BE0, (uint64_t *)&v119);
      sub_244B64B70();
      _os_log_impl(&dword_244B4F000, v70, (os_log_type_t)v38, "%{public}s Delegate: Client is missing '%{public}s' entitlement. This entitlement is required. Rejecting connection.", (uint8_t *)v72, 0x16u);
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  v97 = v29;
  v75 = v5;
  v76 = 0;
  v61 = 0;
  v77 = (uint64_t)v109;
LABEL_23:
  *(_QWORD *)&v119 = v76;
  *((_QWORD *)&v119 + 1) = v61;
  v78 = *(void (**)(__int128 *, id, uint64_t, uint64_t))(AssociatedConformanceWitness + 8);
  v79 = v115;
  v78(&v119, v79, v75, AssociatedConformanceWitness);
  v80 = v75;
  if (sub_244B543FC(v77, 1, v75) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v77, v100);
    v69 = v103;
    v114(v28, v97);
    v70 = sub_244B64768();
    v81 = sub_244B64AC8();
    if (sub_244B62960(v81))
    {
      sub_244B5AC30();
      *(_QWORD *)&v119 = sub_244B5AC30();
      v82 = sub_244B646EC(4.8751e-34);
      v117 = sub_244B646CC(v82, v83);
      sub_244B647C4();
      sub_244B62908();
      sub_244B64724(&dword_244B4F000, v70, (os_log_type_t)v38, "%{public}s Delegate: connection rejected by server instance.");
LABEL_26:
      swift_arrayDestroy();
      sub_244B549E8();
    }
LABEL_27:

    sub_244B6470C(v69);
    sub_244B62808((uint64_t)v123);
    return 0;
  }
  v85 = v108;
  v86 = v107;
  (*(void (**)(char *, uint64_t, uint64_t))(v108 + 32))(v107, v77, v80);
  v116 = *(_QWORD **)(v85 + 16);
  v87 = v102;
  ((void (*)(char *, char *, uint64_t))v116)(v102, v86, v80);
  v88 = sub_244B647AC();
  sub_244B64730(v88);
  v121 = sub_244B645A4;
  v122 = v88;
  *(_QWORD *)&v119 = MEMORY[0x24BDAC760];
  *((_QWORD *)&v119 + 1) = 1107296256;
  v89 = sub_244B647B8((uint64_t)&unk_2515B5A70);
  swift_release();
  objc_msgSend(v79, sel_setInterruptionHandler_, v89);
  _Block_release(v89);
  v90 = v107;
  ((void (*)(char *, char *, uint64_t))v116)(v87, v107, v80);
  v91 = sub_244B647AC();
  sub_244B64730(v91);
  v121 = sub_244B64640;
  v122 = v91;
  *(_QWORD *)&v119 = MEMORY[0x24BDAC760];
  *((_QWORD *)&v119 + 1) = 1107296256;
  v92 = sub_244B647B8((uint64_t)&unk_2515B5B60);
  v93 = swift_release();
  sub_244B647DC(v93, sel_setInvalidationHandler_);
  _Block_release(v92);
  v94 = sub_244B64CB4();
  sub_244B647DC(v94, sel_setExportedObject_);
  swift_unknownObjectRelease();
  objc_msgSend(v79, sel_resume);
  (*(void (**)(char *, uint64_t))(v108 + 8))(v90, v80);
  sub_244B62808((uint64_t)v123);
  return 1;
}

uint64_t sub_244B63FD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  _QWORD v21[4];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = sub_244B648C4();
  v22 = *(_QWORD *)(v4 - 8);
  v23 = v4;
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 48))(AssociatedTypeWitness, AssociatedConformanceWitness);
  v10 = sub_244B648B8();
  v11 = sub_244B64AC8();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v21[2] = a2;
    v13 = (uint8_t *)v12;
    v14 = swift_slowAlloc();
    v25 = v14;
    v21[3] = a1;
    *(_DWORD *)v13 = 136446210;
    v21[1] = v13 + 4;
    v15 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(AssociatedTypeWitness, AssociatedConformanceWitness);
    v24 = sub_244B54E58(v15, v16, &v25);
    sub_244B64B70();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_244B4F000, v10, v11, "%{public}s Delegate: connection interrupted.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249520AE0](v14, -1, -1);
    MEMORY[0x249520AE0](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v23);
  swift_getAssociatedTypeWitness();
  v17 = swift_getAssociatedConformanceWitness();
  v18 = *(uint64_t (**)(uint64_t, uint64_t))(v17 + 32);
  v19 = swift_checkMetadataState();
  return v18(v19, v17);
}

uint64_t sub_244B64248(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  _QWORD v21[4];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = sub_244B648C4();
  v22 = *(_QWORD *)(v4 - 8);
  v23 = v4;
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 48))(AssociatedTypeWitness, AssociatedConformanceWitness);
  v10 = sub_244B648B8();
  v11 = sub_244B64AE0();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v21[2] = a2;
    v13 = (uint8_t *)v12;
    v14 = swift_slowAlloc();
    v25 = v14;
    v21[3] = a1;
    *(_DWORD *)v13 = 136446210;
    v21[1] = v13 + 4;
    v15 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(AssociatedTypeWitness, AssociatedConformanceWitness);
    v24 = sub_244B54E58(v15, v16, &v25);
    sub_244B64B70();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_244B4F000, v10, v11, "%{public}s Delegate: connection invalidated.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249520AE0](v14, -1, -1);
    MEMORY[0x249520AE0](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v23);
  swift_getAssociatedTypeWitness();
  v17 = swift_getAssociatedConformanceWitness();
  v18 = *(uint64_t (**)(uint64_t, uint64_t))(v17 + 40);
  v19 = swift_checkMetadataState();
  return v18(v19, v17);
}

uint64_t sub_244B644B8(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  v9 = sub_244B633F0((uint64_t)v8, v7);

  return v9 & 1;
}

id sub_244B64514()
{
  return sub_244B624E4();
}

uint64_t type metadata accessor for Delegate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_244B52210(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Delegate);
}

uint64_t dispatch thunk of static XPCServiceServer.listener.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of static XPCServiceServer.listener.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of static XPCServiceServer.delegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of static XPCServiceServer.delegate.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of static XPCServiceServer.delegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

ValueMetadata *type metadata accessor for XPCServiceServerInstanceParameters()
{
  return &type metadata for XPCServiceServerInstanceParameters;
}

uint64_t dispatch thunk of XPCServiceServerInstance.init(parameters:connection:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of static XPCServiceServerInstance.clientApplicationIdentifierEntitlementRequired.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static XPCServiceServerInstance.serviceEntitlementRequired.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of XPCServiceServerInstance.xpcConnectionWasInterrupted()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_244B645A4()
{
  return sub_244B6464C((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_244B63FD8);
}

uint64_t sub_244B645B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_244B645C0()
{
  return swift_release();
}

uint64_t sub_244B645CC()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80)), AssociatedTypeWitness);
  return swift_deallocObject();
}

uint64_t sub_244B64640()
{
  return sub_244B6464C((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_244B64248);
}

uint64_t sub_244B6464C(uint64_t (*a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 80);
  return a1(v1 + ((v4 + 32) & ~v4), v2, v3);
}

uint64_t sub_244B646CC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_244B54E58(a1, a2, (uint64_t *)(v2 - 208));
}

uint64_t sub_244B646D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 - 248))(v1, v0);
}

uint64_t sub_244B646EC(float a1)
{
  float *v1;
  uint64_t v2;
  uint64_t v3;

  *v1 = a1;
  return (*(uint64_t (**)(uint64_t))(v2 + 24))(v3);
}

uint64_t sub_244B6470C(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 - 256))(a1, *(_QWORD *)(v1 - 232));
}

uint64_t sub_244B64718@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

void sub_244B64724(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t sub_244B64730(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  return v1(a1 + v3, v2, v6);
}

uint64_t sub_244B64744()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_244B64750()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_244B6475C()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_244B64768()
{
  return sub_244B648B8();
}

uint64_t sub_244B64770(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  unint64_t v6;
  uint64_t v7;
  va_list va;

  va_start(va, a6);
  return sub_244B54E58(v7, v6, (uint64_t *)va);
}

uint64_t sub_244B64780()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_244B64790@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_244B647A0()
{
  return sub_244B64B70();
}

uint64_t sub_244B647AC()
{
  return swift_allocObject();
}

void *sub_244B647B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 192) = v1;
  *(_QWORD *)(v2 - 184) = a1;
  return _Block_copy((const void *)(v2 - 208));
}

uint64_t sub_244B647C4()
{
  return sub_244B64B70();
}

uint64_t sub_244B647D0()
{
  return swift_getAssociatedConformanceWitness();
}

id sub_244B647DC(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_244B647E8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_244B647F8()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_244B64804()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_244B64810()
{
  return MEMORY[0x24BDCB7E0]();
}

uint64_t sub_244B6481C()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_244B64828()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_244B64834()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_244B64840()
{
  return MEMORY[0x24BDCDB58]();
}

uint64_t sub_244B6484C()
{
  return MEMORY[0x24BDCDB68]();
}

uint64_t sub_244B64858()
{
  return MEMORY[0x24BDCDBD0]();
}

uint64_t sub_244B64864()
{
  return MEMORY[0x24BDCDCC8]();
}

uint64_t sub_244B64870()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_244B6487C()
{
  return MEMORY[0x24BDCDD00]();
}

uint64_t sub_244B64888()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_244B64894()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_244B648A0()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_244B648AC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_244B648B8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_244B648C4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_244B648D0()
{
  return MEMORY[0x24BEE6440]();
}

uint64_t sub_244B648DC()
{
  return MEMORY[0x24BEE6448]();
}

uint64_t sub_244B648E8()
{
  return MEMORY[0x24BEE6450]();
}

uint64_t sub_244B648F4()
{
  return MEMORY[0x24BEE6458]();
}

uint64_t sub_244B64900()
{
  return MEMORY[0x24BEE6460]();
}

uint64_t sub_244B6490C()
{
  return MEMORY[0x24BEE6468]();
}

uint64_t sub_244B64918()
{
  return MEMORY[0x24BEE6478]();
}

uint64_t sub_244B64924()
{
  return MEMORY[0x24BEE6480]();
}

uint64_t sub_244B64930()
{
  return MEMORY[0x24BEE6488]();
}

uint64_t sub_244B6493C()
{
  return MEMORY[0x24BEE6490]();
}

uint64_t sub_244B64948()
{
  return MEMORY[0x24BEE64A8]();
}

uint64_t sub_244B64954()
{
  return MEMORY[0x24BEE64B8]();
}

uint64_t sub_244B64960()
{
  return MEMORY[0x24BEE76D0]();
}

uint64_t sub_244B6496C()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_244B64978()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_244B64984()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_244B64990()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_244B6499C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_244B649A8()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_244B649B4()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_244B649C0()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_244B649CC()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_244B649D8()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_244B649E4()
{
  return MEMORY[0x24BDCF880]();
}

uint64_t sub_244B649F0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_244B649FC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_244B64A08()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_244B64A14()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_244B64A20()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_244B64A2C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_244B64A38()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_244B64A44()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_244B64A50()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_244B64A5C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_244B64A68()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_244B64A74()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_244B64A80()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_244B64A8C()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_244B64A98()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_244B64AA4()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_244B64AB0()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_244B64ABC()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_244B64AC8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_244B64AD4()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_244B64AE0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_244B64AEC()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_244B64AF8()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_244B64B04()
{
  return MEMORY[0x24BEE5830]();
}

uint64_t sub_244B64B10()
{
  return MEMORY[0x24BEE58B8]();
}

uint64_t sub_244B64B1C()
{
  return MEMORY[0x24BEE58D0]();
}

uint64_t sub_244B64B28()
{
  return MEMORY[0x24BEE58D8]();
}

uint64_t sub_244B64B34()
{
  return MEMORY[0x24BDD0010]();
}

uint64_t sub_244B64B40()
{
  return MEMORY[0x24BDD0028]();
}

uint64_t sub_244B64B4C()
{
  return MEMORY[0x24BDD0058]();
}

uint64_t sub_244B64B58()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_244B64B64()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_244B64B70()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_244B64B7C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_244B64B88()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_244B64B94()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_244B64BA0()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_244B64BAC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_244B64BB8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_244B64BC4()
{
  return MEMORY[0x24BEE2528]();
}

uint64_t sub_244B64BD0()
{
  return MEMORY[0x24BEE2788]();
}

uint64_t sub_244B64BDC()
{
  return MEMORY[0x24BEE2798]();
}

uint64_t sub_244B64BE8()
{
  return MEMORY[0x24BEE27B8]();
}

uint64_t sub_244B64BF4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_244B64C00()
{
  return MEMORY[0x24BEE2CA8]();
}

uint64_t sub_244B64C0C()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_244B64C18()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_244B64C24()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_244B64C30()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_244B64C3C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_244B64C48()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_244B64C54()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_244B64C60()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_244B64C6C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_244B64C78()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_244B64C84()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_244B64C90()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_244B64C9C()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_244B64CA8()
{
  return MEMORY[0x24BEE3920]();
}

uint64_t sub_244B64CB4()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_244B64CC0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_244B64CCC()
{
  return MEMORY[0x24BEE3A88]();
}

uint64_t sub_244B64CD8()
{
  return MEMORY[0x24BEE3B20]();
}

uint64_t sub_244B64CE4()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_244B64CF0()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_244B64CFC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_244B64D08()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_244B64D14()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_244B64D20()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_244B64D2C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_244B64D38()
{
  return MEMORY[0x24BEE42E8]();
}

uint64_t sub_244B64D44()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_244B64D50()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_244B64D5C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_244B64D68()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_244B64D74()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_244B64D80()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t sub_244B64D8C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_244B64D98()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_244B64DA4()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_244B64DB0()
{
  return MEMORY[0x24BEE4A98]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _exit(int a1)
{
  MEMORY[0x24BDACAC8](*(_QWORD *)&a1);
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

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x24BDACC40]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x24BDADA08](*(_QWORD *)&a1, a2, a3);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x24BDAEBF8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
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

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDAFAC0](a1, a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x24BDAFE00](*(_QWORD *)&a1, a2);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
}

uint64_t swift_deallocBox()
{
  return MEMORY[0x24BEE4BF8]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
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

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x24BEE4FB8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x24BEE4FC0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x24BEE4FE0]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x24BEE4FE8]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

kern_return_t task_create_identity_token(task_t task, task_id_token_t *token)
{
  return MEMORY[0x24BDB0158](*(_QWORD *)&task, token);
}

kern_return_t task_identity_token_get_task_port(task_id_token_t token, task_flavor_t flavor, mach_port_t *task_port)
{
  return MEMORY[0x24BDB0178](*(_QWORD *)&token, *(_QWORD *)&flavor, task_port);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x24BDB0180](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x24BDB0880](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x24BDB0888](xdata);
}

uint64_t xpc_date_get_value_absolute()
{
  return MEMORY[0x24BDB08A8]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x24BDB09F0](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x24BDB0A88](xint);
}

uint64_t xpc_mach_send_copy_right()
{
  return MEMORY[0x24BDB0A90]();
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x24BDB0A98]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x24BDB0B58](stream, targetq, handler);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x24BDB0BC0]();
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x24BDB0BE0](xuint);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x24BDB0C00](xuuid);
}

