unint64_t mxSignpost(_:dso:log:name:signpostID:_:_:)(int a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10, uint64_t a11)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char v26;
  void (*v27)(char *, uint64_t);
  void (*v28)(char *, uint64_t, uint64_t);
  unint64_t result;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  unint64_t v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;

  v43 = a8;
  v40 = a6;
  v39 = a4;
  v41 = a2;
  v42 = a1;
  v13 = type metadata accessor for OSSignpostID();
  v14 = *(_QWORD *)(v13 - 8);
  v16 = MEMORY[0x24BDAC7A8](v13, v15);
  v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v16, v19);
  v22 = (char *)&v39 - v21;
  MEMORY[0x24BDAC7A8](v20, v23);
  v25 = (char *)&v39 - v24;
  static OSSignpostID.invalid.getter();
  lazy protocol witness table accessor for type OSSignpostID and conformance OSSignpostID();
  v26 = dispatch thunk of static Equatable.== infix(_:_:)();
  v27 = *(void (**)(char *, uint64_t))(v14 + 8);
  v27(v25, v13);
  v28 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v28(v22, a7, v13);
  if ((v26 & 1) != 0)
  {
    v27(v22, v13);
    return OS_os_log.signpostsEnabled.getter();
  }
  static OSSignpostID.null.getter();
  v30 = dispatch thunk of static Equatable.== infix(_:_:)();
  v27(v25, v13);
  v27(v22, v13);
  result = OS_os_log.signpostsEnabled.getter();
  if ((result & 1) != 0 && (v30 & 1) == 0)
  {
    v31 = _swift_os_log_return_address();
    v32 = ((uint64_t (*)(char *, uint64_t, uint64_t))v28)(v18, a7, v13);
    MEMORY[0x24BDAC7A8](v32, v33);
    v34 = v43;
    *(&v39 - 10) = v43;
    *(&v39 - 9) = a9;
    *((_BYTE *)&v39 - 64) = a10;
    v35 = v41;
    *(&v39 - 7) = a11;
    *(&v39 - 6) = v35;
    *(&v39 - 5) = v31;
    v36 = a3;
    LOBYTE(v37) = v42;
    v38 = v18;
    if ((v40 & 1) != 0)
    {
      result = v39;
      if (!HIDWORD(v39))
      {
        if (v39 >> 11 == 27)
        {
LABEL_17:
          __break(1u);
          return result;
        }
        if (WORD1(v39) <= 0x10u)
        {
          _ss7UnicodeO6ScalarV17withUTF8CodeUnitsyxxSRys5UInt8VGKXEKlFyt_Tg5024_ss12StaticStringV14withd14BufferyxxSRys5G20VGXElFxAFXEfU_yt_Tg5AHxRi_zRi0_zlyytIsgyr_Tf1ncn_n(v39, (uint64_t (*)(uint64_t *))partial apply for closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:));
          return ((uint64_t (*)(char *, uint64_t))v27)(v18, v13);
        }
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
    }
    else
    {
      result = v39;
      if (v39)
      {
        closure #1 in closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:)(v39, v34, a10, a11, v35, v31, a3, v42, (uint64_t)partial apply for closure #1 in closure #1 in closure #1 in mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:), (uint64_t)v18, (uint64_t)partial apply for closure #1 in closure #1 in closure #1 in closure #1 in closure #1 in mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:), (uint64_t (*)(uint64_t *))partial apply for closure #1 in closure #1 in closure #1 in mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:));
        return ((uint64_t (*)(char *, uint64_t))v27)(v18, v13);
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OSSignpostID and conformance OSSignpostID()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type OSSignpostID and conformance OSSignpostID;
  if (!lazy protocol witness table cache variable for type OSSignpostID and conformance OSSignpostID)
  {
    v1 = type metadata accessor for OSSignpostID();
    result = MEMORY[0x22E2C67F0](MEMORY[0x24BEE7770], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSSignpostID and conformance OSSignpostID);
  }
  return result;
}

uint64_t partial apply for closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return partial apply for closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:)(a1, (uint64_t)partial apply for closure #1 in closure #1 in closure #1 in closure #1 in closure #1 in mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:), (uint64_t (*)(uint64_t *))partial apply for closure #1 in closure #1 in closure #1 in mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:), a2);
}

char *specialized withVaList<A>(_:_:)(uint64_t a1, void (*a2)(uint64_t))
{
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;

  type metadata accessor for __VaListBuilder();
  v3 = (_QWORD *)swift_allocObject();
  v3[2] = 8;
  v3[3] = 0;
  v4 = v3 + 3;
  v3[4] = 0;
  v3[5] = 0;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_25:
    v21 = __VaListBuilder.va_list()();
    a2(v21);
    return (char *)swift_release();
  }
  v6 = 0;
  v7 = a1 + 32;
  while (1)
  {
    outlined init with copy of CVarArg(v7 + 40 * v6, (uint64_t)v23);
    v8 = v24;
    v9 = v25;
    __swift_project_boxed_opaque_existential_1(v23, v24);
    result = (char *)MEMORY[0x22E2C67A8](v8, v9);
    v11 = *v4;
    v12 = *((_QWORD *)result + 2);
    v13 = *v4 + v12;
    if (__OFADD__(*v4, v12))
      break;
    v14 = result;
    v15 = v3[4];
    if (v15 >= v13)
      goto LABEL_18;
    if (v15 + 0x4000000000000000 < 0)
      goto LABEL_28;
    v16 = (char *)v3[5];
    if (2 * v15 > v13)
      v13 = 2 * v15;
    v3[4] = v13;
    if ((unint64_t)(v13 - 0x1000000000000000) >> 61 != 7)
      goto LABEL_29;
    result = (char *)swift_slowAlloc();
    v3[5] = result;
    if (v16)
    {
      if (result != v16 || result >= &v16[8 * v11])
        memmove(result, v16, 8 * v11);
      __VaListBuilder.deallocStorage(wordCount:storage:)();
LABEL_18:
      result = (char *)v3[5];
    }
    if (!result)
      goto LABEL_30;
    if (v12)
    {
      v18 = (uint64_t *)(v14 + 32);
      v19 = *v4;
      while (1)
      {
        v20 = *v18++;
        *(_QWORD *)&result[8 * v19] = v20;
        v19 = *v4 + 1;
        if (__OFADD__(*v4, 1))
          break;
        *v4 = v19;
        if (!--v12)
          goto LABEL_3;
      }
      __break(1u);
      break;
    }
LABEL_3:
    swift_bridgeObjectRelease();
    ++v6;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    if (v6 == v5)
      goto LABEL_25;
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

unint64_t mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, int a5, uint64_t a6, unint64_t a7, uint64_t a8, unsigned __int8 a9, uint64_t a10)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char v25;
  void (*v26)(char *, uint64_t);
  void (*v27)(char *, uint64_t, uint64_t);
  unint64_t result;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  int v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  unint64_t v45;

  v42 = a8;
  v44 = a1;
  v45 = a7;
  v43 = a5;
  v40 = a3;
  v12 = type metadata accessor for OSSignpostID();
  v13 = *(_QWORD *)(v12 - 8);
  v15 = MEMORY[0x24BDAC7A8](v12, v14);
  v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v15, v18);
  v21 = (char *)&v39 - v20;
  MEMORY[0x24BDAC7A8](v19, v22);
  v24 = (char *)&v39 - v23;
  v41 = static os_signpost_type_t.begin.getter();
  static OSSignpostID.invalid.getter();
  lazy protocol witness table accessor for type OSSignpostID and conformance OSSignpostID();
  v25 = dispatch thunk of static Equatable.== infix(_:_:)();
  v26 = *(void (**)(char *, uint64_t))(v13 + 8);
  v26(v24, v12);
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v27(v21, a6, v12);
  if ((v25 & 1) != 0)
  {
    v26(v21, v12);
    return OS_os_log.signpostsEnabled.getter();
  }
  static OSSignpostID.null.getter();
  v29 = dispatch thunk of static Equatable.== infix(_:_:)();
  v26(v24, v12);
  v26(v21, v12);
  result = OS_os_log.signpostsEnabled.getter();
  if ((result & 1) != 0 && (v29 & 1) == 0)
  {
    v30 = _swift_os_log_return_address();
    v31 = ((uint64_t (*)(char *, uint64_t, uint64_t))v27)(v17, a6, v12);
    MEMORY[0x24BDAC7A8](v31, v32);
    v34 = v44;
    v33 = v45;
    v35 = v42;
    *(&v39 - 10) = v45;
    *(&v39 - 9) = v35;
    *((_BYTE *)&v39 - 64) = a9;
    *(&v39 - 7) = a10;
    *(&v39 - 6) = v34;
    *(&v39 - 5) = v30;
    v36 = a2;
    LOBYTE(v37) = v41;
    v38 = v17;
    if ((v43 & 1) != 0)
    {
      result = v40;
      if (!HIDWORD(v40))
      {
        if (v40 >> 11 == 27)
        {
LABEL_17:
          __break(1u);
          return result;
        }
        if (WORD1(v40) <= 0x10u)
        {
          _ss7UnicodeO6ScalarV17withUTF8CodeUnitsyxxSRys5UInt8VGKXEKlFyt_Tg5024_ss12StaticStringV14withd14BufferyxxSRys5G20VGXElFxAFXEfU_yt_Tg5AHxRi_zRi0_zlyytIsgyr_Tf1ncn_n(v40, (uint64_t (*)(uint64_t *))partial apply for closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:));
          return ((uint64_t (*)(char *, uint64_t))v26)(v17, v12);
        }
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
    }
    else
    {
      result = v40;
      if (v40)
      {
        closure #1 in closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:)(v40, v33, a9, a10, v34, v30, a2, v41, (uint64_t)partial apply for closure #1 in closure #1 in closure #1 in mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:), (uint64_t)v17, (uint64_t)partial apply for closure #1 in closure #1 in closure #1 in closure #1 in closure #1 in mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:), (uint64_t (*)(uint64_t *))partial apply for closure #1 in closure #1 in closure #1 in mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:));
        return ((uint64_t (*)(char *, uint64_t))v26)(v17, v12);
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }
  return result;
}

uint64_t closure #1 in closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t (*a12)(uint64_t *))
{
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  void (*v26)(uint64_t);
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  char *v35;
  int v36;

  v27[1] = a9;
  v36 = a3;
  type metadata accessor for OSSignpostID();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v20 = (char *)v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = v21;
  v23 = v22;
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 16))(v20, a10, v22);
  v29 = a4;
  v30 = a5;
  v31 = a6;
  v32 = a7;
  v33 = a8;
  v34 = a1;
  v35 = v20;
  if ((v36 & 1) == 0)
  {
    if (a2)
    {
      MEMORY[0x24BDAC7A8](result, a11);
      v27[-8] = v25;
      v27[-7] = a6;
      v27[-6] = a7;
      LOBYTE(v27[-5]) = a8;
      v27[-4] = a1;
      v27[-3] = v20;
      v27[-2] = a2;
      specialized withVaList<A>(_:_:)(a4, v26);
      return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v20, v23);
    }
    __break(1u);
    goto LABEL_10;
  }
  if (HIDWORD(a2))
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (a2 >> 11 != 27)
  {
    if (WORD1(a2) <= 0x10u)
    {
      _ss7UnicodeO6ScalarV17withUTF8CodeUnitsyxxSRys5UInt8VGKXEKlFyt_Tg5024_ss12StaticStringV14withd14BufferyxxSRys5G20VGXElFxAFXEfU_yt_Tg5AHxRi_zRi0_zlyytIsgyr_Tf1ncn_n(a2, a12);
      return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v20, v23);
    }
    goto LABEL_11;
  }
LABEL_12:
  __break(1u);
  return result;
}

char *closure #1 in closure #1 in closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:)(char *result, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t);

  if (result)
  {
    MEMORY[0x24BDAC7A8](result, a2);
    return specialized withVaList<A>(_:_:)(v2, v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t _ss7UnicodeO6ScalarV17withUTF8CodeUnitsyxxSRys5UInt8VGKXEKlFyt_Tg5024_ss12StaticStringV14withd14BufferyxxSRys5G20VGXElFxAFXEfU_yt_Tg5AHxRi_zRi0_zlyytIsgyr_Tf1ncn_n(unsigned int a1, uint64_t (*a2)(uint64_t *))
{
  unsigned int v2;
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  if (a1 > 0x7F)
  {
    v4 = (a1 & 0x3F) << 8;
    if (a1 >= 0x800)
    {
      v5 = (v4 | (a1 >> 6) & 0x3F) << 8;
      v6 = (((v5 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
      v2 = (v5 | (a1 >> 12)) + 8487393;
      if (HIWORD(a1))
        v2 = v6;
    }
    else
    {
      v2 = (v4 | (a1 >> 6)) + 33217;
    }
  }
  else
  {
    v2 = a1 + 1;
  }
  v7 = (v2 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * (4 - (__clz(v2) >> 3))));
  return a2(&v7);
}

uint64_t partial apply for closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X2>, uint64_t (*a3)(uint64_t *)@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;

  if (result)
    return closure #1 in closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:)(result, *(_QWORD *)(v4 + 16), *(unsigned __int8 *)(v4 + 32), *(_QWORD *)(v4 + 40), *(_QWORD *)(v4 + 48), *(_QWORD *)(v4 + 56), *(_QWORD *)(v4 + 64), *(_BYTE *)(v4 + 72), a4, *(_QWORD *)(v4 + 80), a2, a3);
  __break(1u);
  return result;
}

char *partial apply for closure #1 in closure #1 in closure #1 in mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:)(char *a1)
{
  return partial apply for closure #1 in closure #1 in closure #1 in mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:)(a1);
}

{
  uint64_t v1;

  return closure #1 in closure #1 in closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:)(a1, *(_QWORD *)(v1 + 16));
}

uint64_t outlined init with copy of CVarArg(uint64_t a1, uint64_t a2)
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

uint64_t partial apply for closure #1 in closure #1 in closure #1 in closure #1 in closure #1 in mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:)()
{
  OSSignpostID.rawValue.getter();
  return _swift_os_signpost_with_format();
}

uint64_t static OSSignpostID.null.getter()
{
  return MEMORY[0x24BEE7728]();
}

uint64_t static OSSignpostID.invalid.getter()
{
  return MEMORY[0x24BEE7730]();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t __VaListBuilder.deallocStorage(wordCount:storage:)()
{
  return MEMORY[0x24BEE2BC0]();
}

uint64_t __VaListBuilder.va_list()()
{
  return MEMORY[0x24BEE2BC8]();
}

uint64_t type metadata accessor for __VaListBuilder()
{
  return MEMORY[0x24BEE2BD0]();
}

uint64_t dispatch thunk of CVarArg._cVarArgEncoding.getter()
{
  return MEMORY[0x24BEE45D8]();
}

uint64_t _swift_os_log_return_address()
{
  return MEMORY[0x24BEE79A8]();
}

uint64_t _swift_os_signpost_with_format()
{
  return MEMORY[0x24BEE79B0]();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

