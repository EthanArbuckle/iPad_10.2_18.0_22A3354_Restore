uint64_t CRCKError.errorDescription.getter()
{
  return 0x20676E697373694DLL;
}

uint64_t CRCKError.rawValue.getter()
{
  return 0x20676E697373694DLL;
}

uint64_t CRCKError.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_21FFFD948();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_21FFFC370()
{
  return 1;
}

uint64_t sub_21FFFC378()
{
  sub_21FFFD984();
  sub_21FFFD90C();
  return sub_21FFFD990();
}

uint64_t sub_21FFFC3D0()
{
  return sub_21FFFD90C();
}

uint64_t sub_21FFFC3F0()
{
  sub_21FFFD984();
  sub_21FFFD90C();
  return sub_21FFFD990();
}

uint64_t sub_21FFFC444@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_21FFFD948();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_21FFFC494(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "Missing CRDT");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

uint64_t sub_21FFFC4B8()
{
  return 0x20676E697373694DLL;
}

uint64_t CRCKMergeable.crdt.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_21FFFD924();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t CRCKMergeable.crdt.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_21FFFD924();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*CRCKMergeable.crdt.modify())()
{
  return nullsub_1;
}

uint64_t CRCKMergeable.init(crdt:context:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(a5, 1, 1, a3);
  v10 = sub_21FFFD924();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(a5, a1, v10);
  result = type metadata accessor for CRCKMergeable(0, a3, a4, v11);
  *(_QWORD *)(a5 + *(int *)(result + 36)) = a2;
  return result;
}

uint64_t type metadata accessor for CRCKMergeable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CRCKMergeable);
}

char *CRCKMergeable.mergeableDeltas(for:)(void *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unsigned int (*v16)(char *, uint64_t, char *);
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v31[3];
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;

  v3 = v2;
  v31[0] = a1;
  v32 = sub_21FFFD900();
  v34 = *(_QWORD *)(v32 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31[1] = a2;
  v7 = (char *)a2[2];
  v8 = sub_21FFFD924();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)v31 - v11;
  v13 = *((_QWORD *)v7 - 1);
  MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v3, v8);
  v16 = *(unsigned int (**)(char *, uint64_t, char *))(v13 + 48);
  v33 = v7;
  if (v16(v12, 1, v7) == 1)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    sub_21FFFC914();
    swift_allocError();
    swift_willThrow();
  }
  else
  {
    v17 = v13;
    (*(void (**)(char *, char *, char *))(v13 + 32))(v15, v12, v33);
    v18 = v32;
    (*(void (**)(char *, _QWORD, uint64_t))(v34 + 104))(v6, *MEMORY[0x24BE184E0], v32);
    v7 = v15;
    v19 = v31[2];
    v20 = sub_21FFFD8DC();
    if (v19)
    {
      (*(void (**)(char *, uint64_t))(v34 + 8))(v6, v18);
    }
    else
    {
      v22 = v20;
      v23 = v21;
      (*(void (**)(char *, uint64_t))(v34 + 8))(v6, v18);
      v24 = objc_allocWithZone(MEMORY[0x24BDB9128]);
      sub_21FFFC958(v22, v23);
      v25 = v22;
      v26 = v31[0];
      v27 = (void *)sub_21FFFD8C4();
      v28 = objc_msgSend(v24, sel_initWithData_metadata_, v27, v26);

      sub_21FFFC99C(v25, v23);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2555985A8);
      v29 = swift_allocObject();
      *(_OWORD *)(v29 + 16) = xmmword_21FFFDB30;
      *(_QWORD *)(v29 + 32) = v28;
      v35 = v29;
      sub_21FFFD918();
      v7 = (char *)v35;
      sub_21FFFC99C(v25, v23);
    }
    (*(void (**)(char *, char *))(v17 + 8))(v15, v33);
  }
  return v7;
}

unint64_t sub_21FFFC914()
{
  unint64_t result;

  result = qword_2555985A0;
  if (!qword_2555985A0)
  {
    result = MEMORY[0x2207DBB00](&protocol conformance descriptor for CRCKError, &type metadata for CRCKError);
    atomic_store(result, (unint64_t *)&qword_2555985A0);
  }
  return result;
}

uint64_t sub_21FFFC958(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_21FFFC99C(uint64_t a1, unint64_t a2)
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207DBAF4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CRCKMergeable.merge(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char *v4;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, unint64_t);
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  void (*v23)(char *, uint64_t, unint64_t);
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unsigned int (*v27)(uint64_t, uint64_t, uint64_t);
  char *v28;
  void *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *rawValue;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  char *v42;
  char *v43;
  id v44[2];

  v4 = v3;
  v44[1] = *(id *)MEMORY[0x24BDAC8D0];
  v37 = v1;
  v6 = *(_QWORD *)(v1 + 16);
  v7 = sub_21FFFD924();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v30 - v10;
  v31 = *(char **)(v6 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v42 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((unint64_t)a1._rawValue >> 62)
  {
LABEL_23:
    swift_bridgeObjectRetain();
    v13 = sub_21FFFD93C();
    if (v13)
      goto LABEL_3;
  }
  else
  {
    v13 = *(_QWORD *)(((unint64_t)a1._rawValue & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v13)
    {
LABEL_3:
      v33 = v7;
      v34 = v2;
      v43 = v4;
      rawValue = a1._rawValue;
      v36 = (unint64_t)a1._rawValue & 0xC000000000000001;
      v14 = 4;
      v40 = v8;
      v4 = v11;
      v11 = v31;
      v32 = v13;
      do
      {
        v2 = v14 - 4;
        if (v36)
        {
          v16 = (id)MEMORY[0x2207DB98C](v14 - 4, a1._rawValue);
          v17 = v14 - 3;
          if (__OFADD__(v2, 1))
            goto LABEL_22;
        }
        else
        {
          v16 = *((id *)a1._rawValue + v14);
          v17 = v14 - 3;
          if (__OFADD__(v2, 1))
          {
LABEL_22:
            __break(1u);
            goto LABEL_23;
          }
        }
        v39 = v17;
        v44[0] = 0;
        v41 = v16;
        v18 = objc_msgSend(v16, sel_dataWithError_, v44);
        v19 = v44[0];
        if (!v18)
        {
          v29 = v19;
          swift_bridgeObjectRelease();
          sub_21FFFD8B8();

          swift_willThrow();
LABEL_20:

          return;
        }
        v38 = v14;
        v20 = sub_21FFFD8D0();
        v7 = v21;

        sub_21FFFC958(v20, v7);
        v22 = v43;
        sub_21FFFD8E8();
        v43 = v22;
        if (v22)
        {
          swift_bridgeObjectRelease();
          sub_21FFFC99C(v20, v7);
          goto LABEL_20;
        }
        v23 = *(void (**)(char *, uint64_t, unint64_t))(v8 + 16);
        v24 = v34;
        v25 = v6;
        v26 = v33;
        v23(v4, v34, v33);
        v27 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))*((_QWORD *)v11 + 6);
        if (v27((uint64_t)v4, 1, v25) == 1)
        {

          sub_21FFFC99C(v20, v7);
          v15 = *(void (**)(char *, unint64_t))(v40 + 8);
          v15(v4, v26);
          v15((char *)v24, v26);
          (*((void (**)(uint64_t, char *, uint64_t))v11 + 4))(v24, v42, v25);
          (*((void (**)(uint64_t, _QWORD, uint64_t, uint64_t))v11 + 7))(v24, 0, 1, v25);
          a1._rawValue = rawValue;
          v6 = v25;
        }
        else
        {
          (*(void (**)(char *, unint64_t))(v40 + 8))(v4, v26);
          v6 = v25;
          if (v27(v24, 1, v25))
          {
            v11 = v31;
            (*((void (**)(char *, uint64_t))v31 + 1))(v42, v25);
            sub_21FFFC99C(v20, v7);

          }
          else
          {
            v28 = v42;
            sub_21FFFD8F4();

            sub_21FFFC99C(v20, v7);
            v11 = v31;
            (*((void (**)(char *, uint64_t))v31 + 1))(v28, v6);
          }
          a1._rawValue = rawValue;
        }
        v14 = v38 + 1;
        v8 = v40;
      }
      while (v39 != v32);
    }
  }
  swift_bridgeObjectRelease();
}

unint64_t sub_21FFFCDFC()
{
  unint64_t result;

  result = qword_2555985B0;
  if (!qword_2555985B0)
  {
    result = MEMORY[0x2207DBB00](&protocol conformance descriptor for CRCKError, &type metadata for CRCKError);
    atomic_store(result, (unint64_t *)&qword_2555985B0);
  }
  return result;
}

char *sub_21FFFCE44(void *a1, _QWORD *a2)
{
  return CRCKMergeable.mergeableDeltas(for:)(a1, a2);
}

void sub_21FFFCE58(Swift::OpaquePointer a1)
{
  CRCKMergeable.merge(_:)(a1);
}

uint64_t getEnumTagSinglePayload for CRCKError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CRCKError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21FFFCF04 + 4 * byte_21FFFDB40[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21FFFCF24 + 4 * byte_21FFFDB45[v4]))();
}

_BYTE *sub_21FFFCF04(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21FFFCF24(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21FFFCF2C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21FFFCF34(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21FFFCF3C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21FFFCF44(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_21FFFCF50()
{
  return 0;
}

ValueMetadata *type metadata accessor for CRCKError()
{
  return &type metadata for CRCKError;
}

uint64_t sub_21FFFCF68()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_21FFFCF70()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21FFFD924();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_21FFFCFE8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (*(_DWORD *)(v6 + 84))
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  if ((v7 & 0x1000F8) != 0 || ((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    if ((*(unsigned int (**)(uint64_t *, uint64_t, _QWORD))(v6 + 48))(a2, 1, *(_QWORD *)(a3 + 16)))
    {
      memcpy(a1, a2, v8);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    }
    v11 = *(void **)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFF8);
    *(_QWORD *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFF8) = v11;
    v12 = v11;
  }
  return a1;
}

void sub_21FFFD0F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  v5 = a1 + *(_QWORD *)(v4 + 64);
  if (!*(_DWORD *)(v4 + 84))
    ++v5;

}

void *sub_21FFFD164(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  size_t v9;
  size_t v10;
  size_t v11;
  _QWORD *v12;
  void *v13;
  id v14;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
    if (v7)
      v9 = v8;
    else
      v9 = v8 + 1;
    memcpy(a1, a2, v9);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
  }
  if (v7)
    v10 = v8;
  else
    v10 = v8 + 1;
  v11 = v10 + 7;
  v12 = (_QWORD *)(((unint64_t)a1 + v11) & 0xFFFFFFFFFFFFF8);
  v13 = *(void **)(((unint64_t)a2 + v11) & 0xFFFFFFFFFFFFF8);
  *v12 = v13;
  v14 = v13;
  return a1;
}

void *sub_21FFFD22C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  void *v14;
  void *v15;
  id v16;

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
      goto LABEL_10;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
LABEL_10:
  if (*(_DWORD *)(v6 + 84))
    v11 = *(_QWORD *)(v6 + 64);
  else
    v11 = *(_QWORD *)(v6 + 64) + 1;
  v12 = v11 + 7;
  v13 = (void **)(((unint64_t)a1 + v12) & 0xFFFFFFFFFFFFFFF8);
  v14 = *(void **)(((unint64_t)a2 + v12) & 0xFFFFFFFFFFFFF8);
  v15 = *v13;
  *v13 = v14;
  v16 = v14;

  return a1;
}

void *sub_21FFFD344(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  size_t v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
    if (v7)
      v9 = v8;
    else
      v9 = v8 + 1;
    memcpy(a1, a2, v9);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
  }
  if (v7)
    v10 = v8;
  else
    v10 = v8 + 1;
  *(_QWORD *)(((unint64_t)a1 + v10 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v10 + 7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

void *sub_21FFFD408(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  void *v14;

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
      goto LABEL_10;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
LABEL_10:
  if (*(_DWORD *)(v6 + 84))
    v11 = *(_QWORD *)(v6 + 64);
  else
    v11 = *(_QWORD *)(v6 + 64) + 1;
  v12 = v11 + 7;
  v13 = (void **)(((unint64_t)a1 + v12) & 0xFFFFFFFFFFFFFFF8);
  v14 = *v13;
  *v13 = *(void **)(((unint64_t)a2 + v12) & 0xFFFFFFFFFFFFF8);

  return a1;
}

uint64_t sub_21FFFD51C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v13;
  unint64_t v14;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5)
    v6 = v5 - 1;
  else
    v6 = 0;
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = v6;
  v8 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v8;
  if (!a2)
    return 0;
  if (v7 < a2)
  {
    if (((((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v7 + 1;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    __asm { BR              X16 }
  }
  if (v6 < 0x7FFFFFFF)
  {
    v14 = *(_QWORD *)((a1 + v8 + 7) & 0xFFFFFFFFFFFFF8);
    if (v14 >= 0xFFFFFFFF)
      LODWORD(v14) = -1;
    return (v14 + 1);
  }
  else
  {
    v13 = (*(uint64_t (**)(void))(v4 + 48))();
    if (v13 >= 2)
      return v13 - 1;
    else
      return 0;
  }
}

void sub_21FFFD654(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;

  v6 = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  if (v9 <= 0x7FFFFFFF)
    v10 = 0x7FFFFFFF;
  else
    v10 = v9;
  v11 = *(_QWORD *)(v7 + 64);
  if (!v8)
    ++v11;
  if (v10 < a3)
  {
    v12 = a3 - v10;
    if ((((_DWORD)v11 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v13 = v12 + 1;
    else
      v13 = 2;
    if (v13 >= 0x10000)
      v14 = 4;
    else
      v14 = 2;
    if (v13 < 0x100)
      v14 = 1;
    if (v13 >= 2)
      v6 = v14;
    else
      v6 = 0;
  }
  if (a2 > v10)
  {
    if ((((_DWORD)v11 + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      v15 = ~v10 + a2;
      bzero(a1, ((v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
      *a1 = v15;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t sub_21FFFD74C@<X0>(unsigned int a1@<W1>, size_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  unsigned int v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  int v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t result;

  v12[v13] = 0;
  if (a1)
  {
    if (v10 < 0x7FFFFFFF)
    {
      v15 = (_QWORD *)((unint64_t)&v12[a2 + 7] & 0xFFFFFFFFFFFFFFF8);
      if ((a1 & 0x80000000) != 0)
        v16 = a1 ^ 0x80000000;
      else
        v16 = a1 - 1;
      *v15 = v16;
    }
    else if (v10 >= a1)
    {
      return (*(uint64_t (**)(_BYTE *, _QWORD))(v11 + 56))(v12, a1 + 1);
    }
    else if ((_DWORD)a2)
    {
      if (a2 <= 3)
        v14 = a2;
      else
        v14 = 4;
      bzero(v12, a2);
      __asm { BR              X10 }
    }
  }
  return result;
}

void sub_21FFFD844()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_21FFFD854()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
}

void sub_21FFFD85C()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2207DBAE8](a1, v6, a5);
}

uint64_t sub_21FFFD894()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_21FFFD8A0()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_21FFFD8AC()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_21FFFD8B8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21FFFD8C4()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_21FFFD8D0()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21FFFD8DC()
{
  return MEMORY[0x24BE181C0]();
}

uint64_t sub_21FFFD8E8()
{
  return MEMORY[0x24BE181C8]();
}

uint64_t sub_21FFFD8F4()
{
  return MEMORY[0x24BE181D0]();
}

uint64_t sub_21FFFD900()
{
  return MEMORY[0x24BE184E8]();
}

uint64_t sub_21FFFD90C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21FFFD918()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21FFFD924()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21FFFD930()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21FFFD93C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21FFFD948()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21FFFD954()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21FFFD960()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21FFFD96C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21FFFD978()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21FFFD984()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21FFFD990()
{
  return MEMORY[0x24BEE4328]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

