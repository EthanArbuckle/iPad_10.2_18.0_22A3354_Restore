ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

ValueMetadata *type metadata accessor for OSSignpostID()
{
  return &type metadata for OSSignpostID;
}

uint64_t static os_signpost_type_t.event.getter()
{
  return 0;
}

id Logger.logObject.getter()
{
  id *v0;

  return *v0;
}

uint64_t static os_log_type_t.default.getter()
{
  return 0;
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return 1;
}

uint64_t static os_signpost_type_t.end.getter()
{
  return 2;
}

uint64_t static os_log_type_t.debug.getter()
{
  return 2;
}

id OSSignposter.logHandle.getter()
{
  id *v0;

  return *v0;
}

uint64_t OSSignpostID.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t static os_log_type_t.info.getter()
{
  return 1;
}

ValueMetadata *type metadata accessor for OSSignposter()
{
  return &type metadata for OSSignposter;
}

uint64_t getEnumTag for OSLogFloatFormatting.Notation(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t static os_log_type_t.error.getter()
{
  return 16;
}

void OSSignpostIntervalState.signpostID.getter(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 16);
}

uint64_t OSSignpostIntervalState.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

ValueMetadata *type metadata accessor for OSSignpostError()
{
  return &type metadata for OSSignpostError;
}

uint64_t checkForErrorAndConsumeState(state:)@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  char v2;

  v2 = *(_BYTE *)(result + 24);
  *(_BYTE *)(result + 24) = 0;
  *a2 = v2;
  return result;
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)(_QWORD *a1, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = *a1;
  *(_BYTE *)(v2 + 24) = a2;
  return v2;
}

uint64_t OSSignposter.init(logHandle:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

id Logger.init()@<X0>(_QWORD *a1@<X8>)
{
  void *v2;

  if (one-time initialization token for default != -1)
    swift_once();
  v2 = (void *)static OS_os_log.default;
  *a1 = static OS_os_log.default;
  return v2;
}

_QWORD *static OSSignpostID.exclusive.getter@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (*result != -1)
    result = (_QWORD *)swift_once();
  *a3 = *a2;
  return result;
}

id static OS_os_log.default.getter()
{
  if (one-time initialization token for default != -1)
    swift_once();
  return (id)static OS_os_log.default;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x19401FDBC](a1, v6, a5);
}

BOOL OSSignposter.isEnabled.getter()
{
  os_log_t *v0;

  return os_signpost_enabled(*v0);
}

uint64_t OSSignposter.init(subsystem:category:)@<X0>(os_log_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  os_log_t v4;
  uint64_t result;

  v2 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v3 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v4 = os_log_create((const char *)(v2 + 32), (const char *)(v3 + 32));
  swift_release();
  result = swift_release();
  *a1 = v4;
  return result;
}

{
  uint64_t v2;
  uint64_t v3;
  os_log_t v4;
  uint64_t result;

  v2 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v3 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v4 = os_log_create((const char *)(v2 + 32), (const char *)(v3 + 32));
  swift_release();
  result = swift_release();
  *a1 = v4;
  return result;
}

void OSSignpostID.init(log:object:)(NSObject *a1@<X0>, const void *a2@<X1>, os_signpost_id_t *a3@<X8>)
{
  os_signpost_id_t v5;

  v5 = os_signpost_id_make_with_pointer(a1, a2);
  swift_unknownObjectRelease();

  *a3 = v5;
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return objc_opt_self();
}

uint64_t Logger.init(subsystem:category:)@<X0>(os_log_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  os_log_t v4;
  uint64_t result;

  v2 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v3 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v4 = os_log_create((const char *)(v2 + 32), (const char *)(v3 + 32));
  swift_release();
  result = swift_release();
  *a1 = v4;
  return result;
}

BOOL OS_os_log.signpostsEnabled.getter()
{
  NSObject *v0;

  return os_signpost_enabled(v0);
}

void OSSignpostID.init(log:)(NSObject *a1@<X0>, os_signpost_id_t *a2@<X8>)
{
  os_signpost_id_t v4;

  v4 = os_signpost_id_generate(a1);

  *a2 = v4;
}

uint64_t os_log(_:dso:log:_:_:)(os_log_type_t a1, uint64_t a2, os_log_t oslog, char *a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t result;
  uint64_t v15;

  result = os_log_type_enabled(oslog, a1);
  if ((_DWORD)result)
  {
    v15 = _swift_os_log_return_address();
    MEMORY[0x1E0C80A78]();
    if ((a6 & 1) == 0)
    {
      if (a4)
      {
        if ((a5 & 0x8000000000000000) == 0)
        {
          swift_bridgeObjectRetain();
          specialized withVaList<A>(_:_:)(a7, a2, v15, oslog, a1, a4);
          return swift_bridgeObjectRelease();
        }
        _fatalErrorMessage(_:_:file:line:flags:)();
        __break(1u);
      }
      goto LABEL_14;
    }
    if ((unint64_t)a4 >> 32 || WORD1(a4) > 0x10u || (a4 & 0xFFFFF800) == 0xD800)
    {
LABEL_14:
      result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
    return _ss7UnicodeO6ScalarV17withUTF8CodeUnitsyxxSRys5UInt8VGKXEKlFyt_Tg5024_ss12StaticStringV14withd14BufferyxxSRys5G20VGXElFxAFXEfU_yt_Tg5AHxRi_zRi0_zlyytIsgyr_Tf1ncn_n(a4, (uint64_t (*)(uint64_t *))partial apply for closure #1 in os_log(_:dso:log:_:_:));
  }
  return result;
}

os_log_t OS_os_log.init(subsystem:category:)()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;

  v0 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v1 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v2 = os_log_create((const char *)(v0 + 32), (const char *)(v1 + 32));
  swift_release();
  swift_release();
  return v2;
}

{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;

  v0 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v1 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v2 = os_log_create((const char *)(v0 + 32), (const char *)(v1 + 32));
  swift_release();
  swift_release();
  return v2;
}

void os_signpost(_:dso:log:name:signpostID:)(unsigned __int8 a1, uint64_t a2, os_log_t log, unint64_t a4, uint64_t a5, char a6, uint64_t *a7)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  uint64_t v22;

  v13 = *a7;
  if (one-time initialization token for invalid != -1)
    swift_once();
  if (v13 != static OSSignpostID.invalid)
  {
    if (one-time initialization token for null != -1)
      swift_once();
    v14 = static OSSignpostID.null;
    if (os_signpost_enabled(log) && v13 != v14)
    {
      v15 = _swift_os_log_return_address();
      if ((a6 & 1) != 0)
      {
        if (HIDWORD(a4))
        {
LABEL_26:
          _assertionFailure(_:_:file:line:flags:)();
          __break(1u);
          goto LABEL_27;
        }
        if (WORD1(a4) <= 0x10u && (a4 & 0xFFFFF800) != 0xD800)
        {
          if (a4 < 0x80)
          {
            v16 = a4 + 1;
LABEL_17:
            v17 = __clz(v16);
            v22 = (v16 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * (4 - (v17 >> 3))));
            closure #1 in os_signpost(_:dso:log:name:signpostID:)((uint64_t)&v22, 4 - (v17 >> 3), a2, v15, log, a1, v13);
            return;
          }
          v18 = (a4 & 0x3F) << 8;
          if (a4 < 0x800)
          {
            v19 = v18 | (a4 >> 6);
            v20 = 33217;
LABEL_21:
            v16 = v19 + v20;
            goto LABEL_17;
          }
          v21 = (v18 | (a4 >> 6) & 0x3F) << 8;
          if (!WORD1(a4))
          {
            v16 = (v21 | (a4 >> 12)) + 8487393;
            goto LABEL_17;
          }
LABEL_27:
          v19 = ((v21 | (a4 >> 12) & 0x3F) << 8) | (a4 >> 18);
          v20 = -2122219023;
          goto LABEL_21;
        }
      }
      else if (a4)
      {
        if ((a5 & 0x8000000000000000) == 0)
        {
          _swift_os_signpost(a2, v15, log, a1, a4, v13);
          return;
        }
        goto LABEL_25;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_25:
      _fatalErrorMessage(_:_:file:line:flags:)();
      __break(1u);
      goto LABEL_26;
    }
  }
}

void _swift_os_signpost(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _swift_os_signpost_with_format(a1, a2, a3, a4, a5, a6, 0, 0);
}

uint64_t specialized withVaList<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unsigned __int8 a5, char *a6)
{
  _QWORD *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _DWORD *v28;
  uint64_t result;
  _QWORD v35[3];
  uint64_t v36;
  uint64_t v37;

  type metadata accessor for __VaListBuilder();
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 8;
  v7[3] = 0;
  v8 = v7 + 3;
  v7[4] = 0;
  v7[5] = 0;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_26:
    v28 = (_DWORD *)__VaListBuilder.va_list()();
    _swift_os_log(a2, a3, a4, a5, a6, v28);

    return swift_release();
  }
  v10 = 0;
  v11 = a1 + 32;
  while (1)
  {
    outlined init with copy of CVarArg(v11 + 40 * v10, (uint64_t)v35);
    v12 = v36;
    v13 = v37;
    __swift_project_boxed_opaque_existential_1(v35, v36);
    v14 = MEMORY[0x19401FA68](v12, v13);
    v15 = *v8;
    v16 = *(_QWORD *)(v14 + 16);
    v17 = __OFADD__(*v8, v16);
    v18 = *v8 + v16;
    if (v17)
      break;
    v19 = v14;
    v20 = v7[4];
    if (v20 >= v18)
      goto LABEL_19;
    if (v20 + 0x4000000000000000 < 0)
      goto LABEL_29;
    v21 = (char *)v7[5];
    if (2 * v20 > v18)
      v18 = 2 * v20;
    v7[4] = v18;
    if ((unint64_t)(v18 - 0x1000000000000000) >> 61 != 7)
      goto LABEL_30;
    v22 = (char *)swift_slowAlloc();
    v7[5] = v22;
    if (v21)
    {
      if (v15 < 0)
        goto LABEL_32;
      if (v22 != v21 || v22 >= &v21[8 * v15])
        memmove(v22, v21, 8 * v15);
      __VaListBuilder.deallocStorage(wordCount:storage:)();
LABEL_19:
      v22 = (char *)v7[5];
    }
    if (!v22)
      goto LABEL_31;
    v24 = *(_QWORD *)(v19 + 16);
    if (v24)
    {
      v25 = (uint64_t *)(v19 + 32);
      v26 = *v8;
      while (1)
      {
        v27 = *v25++;
        *(_QWORD *)&v22[8 * v26] = v27;
        v26 = *v8 + 1;
        if (__OFADD__(*v8, 1))
          break;
        *v8 = v26;
        if (!--v24)
          goto LABEL_3;
      }
      __break(1u);
      break;
    }
LABEL_3:
    ++v10;
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
    if (v10 == v9)
      goto LABEL_26;
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
LABEL_32:

  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t os_signpost(_:dso:log:name:signpostID:_:_:)(uint64_t result, uint64_t a2, os_log_t log, unint64_t a4, uint64_t a5, char a6, uint64_t *a7, char *a8, uint64_t a9, char a10, uint64_t a11)
{
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v17 = result;
  v18 = *a7;
  if (one-time initialization token for invalid != -1)
    result = swift_once();
  if (v18 != static OSSignpostID.invalid)
  {
    if (one-time initialization token for null != -1)
      swift_once();
    v19 = static OSSignpostID.null;
    result = os_signpost_enabled(log);
    if ((_DWORD)result)
    {
      if (v18 != v19)
      {
        v21 = a5;
        _swift_os_log_return_address();
        MEMORY[0x1E0C80A78](&v21);
        if ((a6 & 1) != 0)
        {
          if (!HIDWORD(a4) && WORD1(a4) <= 0x10u && (a4 & 0xFFFFF800) != 0xD800)
            return _ss7UnicodeO6ScalarV17withUTF8CodeUnitsyxxSRys5UInt8VGKXEKlFyt_Tg5024_ss12StaticStringV14withd14BufferyxxSRys5G20VGXElFxAFXEfU_yt_Tg5AHxRi_zRi0_zlyytIsgyr_Tf1ncn_n(a4, (uint64_t (*)(uint64_t *))partial apply for closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:));
        }
        else if (a4)
        {
          if ((v21 & 0x8000000000000000) == 0)
            return closure #1 in closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:)(a4, a8, a9, a10, a11, a2, v20, log, v17, v18);
          _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
        }
        result = _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
    }
  }
  return result;
}

uint64_t os_log(_:dso:log:type:_:)(char *a1, uint64_t a2, char a3, uint64_t a4, os_log_t oslog, os_log_type_t a6, uint64_t a7)
{
  uint64_t result;
  uint64_t v15;

  result = os_log_type_enabled(oslog, a6);
  if ((_DWORD)result)
  {
    v15 = _swift_os_log_return_address();
    MEMORY[0x1E0C80A78](v15);
    if ((a3 & 1) == 0)
    {
      if (a1)
      {
        if ((a2 & 0x8000000000000000) == 0)
        {
          swift_bridgeObjectRetain();
          specialized withVaList<A>(_:_:)(a7, a4, v15, oslog, a6, a1);
          return swift_bridgeObjectRelease();
        }
        _fatalErrorMessage(_:_:file:line:flags:)();
        __break(1u);
      }
      goto LABEL_14;
    }
    if ((unint64_t)a1 >> 32 || WORD1(a1) > 0x10u || (a1 & 0xFFFFF800) == 0xD800)
    {
LABEL_14:
      result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
    return _ss7UnicodeO6ScalarV17withUTF8CodeUnitsyxxSRys5UInt8VGKXEKlFyt_Tg5024_ss12StaticStringV14withd14BufferyxxSRys5G20VGXElFxAFXEfU_yt_Tg5AHxRi_zRi0_zlyytIsgyr_Tf1ncn_n(a1, (uint64_t (*)(uint64_t *))partial apply for closure #1 in os_log(_:dso:log:type:_:));
  }
  return result;
}

uint64_t _swift_os_log_return_address()
{
  uint64_t vars0;

  return *(_QWORD *)(vars0 + 8);
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

uint64_t outlined init with copy of CVarArg(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void _swift_os_log(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, char *a5, _DWORD *a6)
{
  id v9;
  int v10;
  char *v11;
  void *v12;
  uint64_t v13;
  _WORD *v14;
  uint64_t v15;
  uint64_t v16;
  _WORD v17[433];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = *__error();
  v16 = 0x1000000000000;
  v14 = v17;
  v15 = 0x36200000000;
  if (_os_log_encode(v17, a5, a6, v10, (uint64_t)&v14))
  {
    _os_log_pack_size();
    v11 = (char *)&v13 - ((MEMORY[0x1E0C80A78]() + 15) & 0xFFFFFFFFFFFFFFF0);
    v12 = (void *)_os_log_pack_fill();
    *((_QWORD *)v11 + 4) = a2;
    memcpy(v12, v17, v15);
    os_log_pack_send();
  }

}

uint64_t _os_log_encode(_WORD *a1, char *__s, _DWORD *a3, int a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  unsigned int v9;
  char *i;
  char *v11;
  char *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  int v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  size_t v30;
  int v31;
  size_t v32;
  size_t v33;
  _DWORD *v34;
  char v35;
  char v36;
  _DWORD *v37;
  char v38;
  char v39;
  int *v40;
  char v41;
  char v42;
  uint64_t *v43;
  int *v44;
  char v45;
  uint64_t *v46;
  _DWORD *v47;
  char v48;
  uint64_t *v49;
  char v50;
  _DWORD *v51;
  char v52;
  char v53;
  _DWORD *v54;
  char v55;
  char v56;
  uint64_t *v57;
  _DWORD *v58;
  char v59;
  char v60;
  int *v61;
  char v62;
  _DWORD *v63;
  char v64;
  char v65;
  uint64_t v66;
  int *v67;
  void **v68;
  void *v69;
  id v70;
  char v71;
  int *v72;
  char v73;
  uint64_t *v74;
  uint64_t result;
  int v77;
  int v78;
  int v79;
  uint64_t v80;
  int v81;
  __int16 v82;
  __int16 __src;
  int v84;
  _DWORD *v85;

  v6 = a5;
  v85 = a3;
  v84 = a4;
  __src = 0;
  if ((*(_WORD *)(a5 + 20) & 2) == 0)
  {
    v8 = *(unsigned int *)(a5 + 8);
    if ((*(char *)(a5 + 22) + *(_DWORD *)(a5 + 12) - v8 - 1) <= 1)
    {
      os_trace_blob_add_slow(a5, &__src, 2uLL);
    }
    else
    {
      *(_WORD *)(*(_QWORD *)a5 + v8) = __src;
      v9 = *(_DWORD *)(a5 + 8) + 2;
      *(_DWORD *)(a5 + 8) = v9;
      if (!*(_BYTE *)(a5 + 22))
        *(_BYTE *)(*(_QWORD *)a5 + v9) = 0;
    }
  }
  for (i = strchr(__s, 37); i; i = strchr(v12, 37))
  {
    v11 = i + 1;
    if (i[1] == 37)
    {
      v12 = i + 2;
    }
    else
    {
      v82 = 0;
      v81 = 0;
      if (HIBYTE(__src) == 48)
        break;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = __src;
      while (2)
      {
        v20 = *v11;
        switch(*v11)
        {
          case '@':
            if (v18 == 2)
            {
              v47 = v85;
              v85 += 2;
              LODWORD(v80) = *v47;
              v82 = 1024;
              v48 = v16;
              _os_log_encode_arg(v6, (unsigned __int8 *)&v82, &v80);
              LOBYTE(v16) = v48;
              ++HIBYTE(__src);
              LOBYTE(v19) = __src;
            }
            LOBYTE(__src) = v19 | 2;
            v49 = (uint64_t *)v85;
            v85 += 2;
            v80 = *v49;
            v50 = 64;
            goto LABEL_98;
          case 'A':
          case 'E':
          case 'F':
          case 'G':
          case 'a':
          case 'e':
          case 'f':
          case 'g':
            if (v18 == 2)
            {
              v34 = v85;
              v85 += 2;
              LODWORD(v80) = *v34;
              v82 = 1024;
              v35 = v16;
              _os_log_encode_arg(v6, (unsigned __int8 *)&v82, &v80);
              LOBYTE(v16) = v35;
              ++HIBYTE(__src);
              v36 = v82;
            }
            else
            {
              v36 = 0;
            }
            if (v17 == 2)
            {
              LOBYTE(v82) = v36 & 0xF;
              HIBYTE(v82) = 4;
              v40 = v85;
              v85 += 2;
              v81 = *v40;
              v41 = v16;
              _os_log_encode_arg(v6, (unsigned __int8 *)&v82, &v81);
              LOBYTE(v16) = v41;
              ++HIBYTE(__src);
            }
            v42 = v16 & 0xF;
            v43 = (uint64_t *)v85;
            v85 += 2;
            v80 = *v43;
            goto LABEL_99;
          case 'B':
          case 'D':
          case 'H':
          case 'I':
          case 'J':
          case 'K':
          case 'M':
          case 'N':
          case 'O':
          case 'Q':
          case 'R':
          case 'S':
          case 'T':
          case 'U':
          case 'V':
          case 'W':
          case 'Y':
          case 'Z':
          case '[':
          case '\\':
          case ']':
          case '^':
          case '_':
          case 'b':
          case 'k':
          case 'n':
          case 'q':
          case 'r':
          case 'v':
          case 'w':
          case 'y':
            goto LABEL_16;
          case 'C':
            if (v18 == 2)
            {
              v51 = v85;
              v85 += 2;
              LODWORD(v80) = *v51;
              v82 = 1024;
              v52 = v16;
              _os_log_encode_arg(v6, (unsigned __int8 *)&v82, &v80);
              LOBYTE(v16) = v52;
              ++HIBYTE(__src);
              v53 = v82;
            }
            else
            {
              v53 = 0;
            }
            if (v17 == 2)
            {
              LOBYTE(v82) = v53 & 0xF;
              HIBYTE(v82) = 4;
              v61 = v85;
              v85 += 2;
              v81 = *v61;
              v62 = v16;
              _os_log_encode_arg(v6, (unsigned __int8 *)&v82, &v81);
              LOBYTE(v16) = v62;
              ++HIBYTE(__src);
            }
LABEL_86:
            v63 = v85;
            v85 += 2;
            LODWORD(v80) = *v63;
            LOBYTE(v82) = v16 & 0xF;
            v64 = 4;
            goto LABEL_100;
          case 'L':
            v14 = 1;
            goto LABEL_56;
          case 'P':
            if (v18 == 2)
            {
              v54 = v85;
              v85 += 2;
              LODWORD(v80) = *v54;
              v82 = 1024;
              v55 = v16;
              _os_log_encode_arg(v6, (unsigned __int8 *)&v82, &v80);
              LOBYTE(v16) = v55;
              ++HIBYTE(__src);
              v56 = v82;
              if (!v17)
                goto LABEL_97;
            }
            else
            {
              v56 = 0;
              if (!v17)
                goto LABEL_97;
            }
            LOBYTE(v82) = v56 & 0xF | 0x10;
            HIBYTE(v82) = 4;
            if (v17 == 2)
            {
              v72 = v85;
              v85 += 2;
              v81 = *v72;
            }
            else
            {
              LOBYTE(v82) = v16 & 0xF | 0x10;
            }
            v73 = v16;
            _os_log_encode_arg(v6, (unsigned __int8 *)&v82, &v81);
            LOBYTE(v16) = v73;
            ++HIBYTE(__src);
LABEL_97:
            LOBYTE(__src) = __src | 2;
            v74 = (uint64_t *)v85;
            v85 += 2;
            v80 = *v74;
            v50 = 48;
LABEL_98:
            v42 = v50 & 0xF0 | v16 & 0xF;
LABEL_99:
            LOBYTE(v82) = v42;
            v64 = 8;
LABEL_100:
            HIBYTE(v82) = v64;
            v57 = &v80;
LABEL_101:
            _os_log_encode_arg(v6, (unsigned __int8 *)&v82, v57);
            ++HIBYTE(__src);
            goto LABEL_102;
          case 'X':
          case 'c':
          case 'd':
          case 'i':
          case 'o':
          case 'u':
          case 'x':
            if (v18 == 2)
            {
              v37 = v85;
              v85 += 2;
              LODWORD(v80) = *v37;
              v82 = 1024;
              v38 = v16;
              _os_log_encode_arg(v6, (unsigned __int8 *)&v82, &v80);
              LOBYTE(v16) = v38;
              ++HIBYTE(__src);
              v39 = v82;
            }
            else
            {
              v39 = 0;
            }
            if (v17 == 2)
            {
              LOBYTE(v82) = v39 & 0xF;
              HIBYTE(v82) = 4;
              v44 = v85;
              v85 += 2;
              v81 = *v44;
              v45 = v16;
              _os_log_encode_arg(v6, (unsigned __int8 *)&v82, &v81);
              LOBYTE(v16) = v45;
              ++HIBYTE(__src);
            }
            switch(v15)
            {
              case -2:
              case -1:
              case 0:
                goto LABEL_86;
              case 1:
              case 2:
              case 3:
              case 4:
              case 5:
                goto LABEL_69;
              default:
                result = 0;
                break;
            }
            return result;
          case 'h':
            --v15;
            goto LABEL_56;
          case 'j':
            v15 = 4;
            goto LABEL_56;
          case 'l':
            ++v15;
            goto LABEL_56;
          case 'm':
            HIBYTE(v82) = 4;
            LOBYTE(v82) = v16 & 0xF;
            v57 = (uint64_t *)&v84;
            goto LABEL_101;
          case 'p':
LABEL_69:
            v46 = (uint64_t *)v85;
            v85 += 2;
            v80 = *v46;
            v42 = v16 & 0xF;
            goto LABEL_99;
          case 's':
            if (v18 == 2)
            {
              v58 = v85;
              v85 += 2;
              LODWORD(v80) = *v58;
              v82 = 1024;
              v59 = v16;
              _os_log_encode_arg(v6, (unsigned __int8 *)&v82, &v80);
              LOBYTE(v16) = v59;
              ++HIBYTE(__src);
              v60 = v82;
              if (!v17)
                goto LABEL_91;
            }
            else
            {
              v60 = 0;
              if (!v17)
              {
LABEL_91:
                v65 = v16;
                v66 = v5;
                goto LABEL_94;
              }
            }
            LOBYTE(v82) = v60 & 0xF | 0x10;
            HIBYTE(v82) = 4;
            if (v17 == 2)
            {
              v67 = v85;
              v85 += 2;
              v81 = *v67;
            }
            else
            {
              LOBYTE(v82) = v16 & 0xF | 0x10;
            }
            v65 = v16;
            v66 = v5;
            _os_log_encode_arg(v6, (unsigned __int8 *)&v82, &v81);
            ++HIBYTE(__src);
            v60 = v82;
LABEL_94:
            LOBYTE(__src) = __src | 2;
            LOBYTE(v82) = v60 & 0xF | 0x20;
            v68 = (void **)v85;
            v85 += 2;
            v69 = *v68;
            v80 = 0;
            v70 = objc_retainAutorelease(v69);
            v80 = objc_msgSend(v70, "UTF8String");
            LOBYTE(v82) = v82 & 0xF0 | v65 & 0xF;
            HIBYTE(v82) = 8;
            _os_log_encode_arg(v6, (unsigned __int8 *)&v82, &v80);
            v71 = HIBYTE(__src);

            HIBYTE(__src) = v71 + 1;
            v5 = v66;
LABEL_102:
            v12 = v11;
            break;
          case 't':
            v15 = 5;
            goto LABEL_56;
          case 'z':
            v15 = 3;
            goto LABEL_56;
          case '{':
            v21 = v5;
            v22 = v11 + 1;
            v23 = 1;
            while (2)
            {
              if (!v11[v23])
              {
                v5 = v21;
                goto LABEL_56;
              }
              if (v11[v23] != 125)
              {
                ++v23;
                continue;
              }
              break;
            }
            v77 = v18;
            v78 = v17;
            v26 = v6;
            v27 = v19;
            v79 = v14;
            v28 = v16;
            v29 = v23 - 1;
            if (v23 - 1 >= 9)
              v30 = 9;
            else
              v30 = v23 - 1;
            v31 = strncmp(v11 + 1, "sensitive", v30);
            v11 += v23;
            if (!v31)
            {
              v19 = v27 | 1;
              LOBYTE(__src) = v27 | 1;
              v16 = v28 | 5;
              v6 = v26;
LABEL_54:
              v5 = v21;
              v17 = v78;
              v14 = v79;
              goto LABEL_55;
            }
            if (v29 >= 7)
              v32 = 7;
            else
              v32 = v23 - 1;
            if (!strncmp(v22, "private", v32))
            {
              v19 = v27 | 1;
              LOBYTE(__src) = v27 | 1;
              v16 = v28 | 1;
              v6 = v26;
              goto LABEL_54;
            }
            if (v29 >= 6)
              v33 = 6;
            else
              v33 = v23 - 1;
            if (!strncmp(v22, "public", v33))
              v16 = v28 | 2;
            else
              v16 = v28;
            v5 = v21;
            v17 = v78;
            v14 = v79;
            v19 = v27;
            v6 = v26;
LABEL_55:
            v18 = v77;
LABEL_56:
            ++v11;
            continue;
          default:
            if (v20 > 0x2E)
              goto LABEL_16;
            if (((1 << *v11) & 0x288900000000) != 0)
              goto LABEL_56;
            if (v20 == 42)
            {
              v18 = 2;
              if (v11[1] != 46)
                goto LABEL_56;
              ++v11;
LABEL_29:
              v24 = v11[1];
              if (v24 == 42)
              {
                v17 = 2;
                ++v11;
              }
              else
              {
                v25 = v24 - 48;
                if ((v24 - 48) <= 9)
                {
                  do
                  {
                    v13 = v25 + 10 * v13;
                    v81 = v13;
                    v25 = v11[2] - 48;
                    ++v11;
                  }
                  while (v25 < 0xA);
                }
                if (v13 >= 1025)
                {
                  v13 = 1024;
                  v81 = 1024;
                }
                v17 = 1;
              }
              goto LABEL_56;
            }
            if (v20 == 46)
              goto LABEL_29;
LABEL_16:
            if ((v20 - 48) >= 0xA)
              goto LABEL_102;
            goto LABEL_56;
        }
        break;
      }
    }
  }
  *a1 = __src;
  return 1;
}

uint64_t _os_log_encode_arg(uint64_t result, unsigned __int8 *__src, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  uint64_t v9;
  unsigned int v10;

  v5 = result;
  if ((*(_WORD *)(result + 20) & 2) == 0)
  {
    v6 = *(unsigned int *)(result + 8);
    if ((*(char *)(result + 22) + *(_DWORD *)(result + 12) - v6 - 1) <= 1)
    {
      result = os_trace_blob_add_slow(result, __src, 2uLL);
    }
    else
    {
      *(_WORD *)(*(_QWORD *)result + v6) = *(_WORD *)__src;
      v7 = *(_DWORD *)(result + 8) + 2;
      *(_DWORD *)(result + 8) = v7;
      if (!*(_BYTE *)(result + 22))
        *(_BYTE *)(*(_QWORD *)result + v7) = 0;
    }
  }
  if ((*(_WORD *)(v5 + 20) & 2) == 0)
  {
    v8 = __src[1];
    v9 = *(unsigned int *)(v5 + 8);
    if (*(char *)(v5 + 22) + *(_DWORD *)(v5 + 12) - (int)v9 - 1 < v8)
    {
      return os_trace_blob_add_slow(v5, a3, v8);
    }
    else
    {
      result = (uint64_t)memcpy((void *)(*(_QWORD *)v5 + v9), a3, v8);
      v10 = *(_DWORD *)(v5 + 8) + v8;
      *(_DWORD *)(v5 + 8) = v10;
      if (!*(_BYTE *)(v5 + 22))
        *(_BYTE *)(*(_QWORD *)v5 + v10) = 0;
    }
  }
  return result;
}

uint64_t closure #1 in closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:)(uint64_t a1, char *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, unsigned __int8 a9, uint64_t a10)
{
  uint64_t result;

  if ((a4 & 1) == 0)
  {
    if (a2)
    {
      if ((a3 & 0x8000000000000000) == 0)
      {
        swift_bridgeObjectRetain();
        specialized withVaList<A>(_:_:)(a5, a6, a7, a8, a9, a1, a10, a2);
        return swift_bridgeObjectRelease();
      }
      goto LABEL_10;
    }
LABEL_9:
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_10:
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    goto LABEL_11;
  }
  if (!((unint64_t)a2 >> 32))
  {
    if (WORD1(a2) <= 0x10u && (a2 & 0xFFFFF800) != 0xD800)
      return _ss7UnicodeO6ScalarV17withUTF8CodeUnitsyxxSRys5UInt8VGKXEKlFyt_Tg5024_ss12StaticStringV14withd14BufferyxxSRys5G20VGXElFxAFXEfU_yt_Tg5AHxRi_zRi0_zlyytIsgyr_Tf1ncn_n(a2, (uint64_t (*)(uint64_t *))partial apply for closure #1 in closure #1 in closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:));
    goto LABEL_9;
  }
LABEL_11:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized withVaList<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unsigned __int8 a5, uint64_t a6, uint64_t a7, char *a8)
{
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _DWORD *v30;
  uint64_t result;
  _QWORD v39[3];
  uint64_t v40;
  uint64_t v41;

  type metadata accessor for __VaListBuilder();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 8;
  v9[3] = 0;
  v10 = v9 + 3;
  v9[4] = 0;
  v9[5] = 0;
  v11 = *(_QWORD *)(a1 + 16);
  if (!v11)
  {
LABEL_26:
    v30 = (_DWORD *)__VaListBuilder.va_list()();
    _swift_os_signpost_with_format(a2, a3, a4, a5, a6, a7, a8, v30);

    return swift_release();
  }
  v12 = 0;
  v13 = a1 + 32;
  while (1)
  {
    outlined init with copy of CVarArg(v13 + 40 * v12, (uint64_t)v39);
    v14 = v40;
    v15 = v41;
    __swift_project_boxed_opaque_existential_1(v39, v40);
    v16 = MEMORY[0x19401FA68](v14, v15);
    v17 = *v10;
    v18 = *(_QWORD *)(v16 + 16);
    v19 = __OFADD__(*v10, v18);
    v20 = *v10 + v18;
    if (v19)
      break;
    v21 = v16;
    v22 = v9[4];
    if (v22 >= v20)
      goto LABEL_19;
    if (v22 + 0x4000000000000000 < 0)
      goto LABEL_29;
    v23 = (char *)v9[5];
    if (2 * v22 > v20)
      v20 = 2 * v22;
    v9[4] = v20;
    if ((unint64_t)(v20 - 0x1000000000000000) >> 61 != 7)
      goto LABEL_30;
    v24 = (char *)swift_slowAlloc();
    v9[5] = v24;
    if (v23)
    {
      if (v17 < 0)
        goto LABEL_32;
      if (v24 != v23 || v24 >= &v23[8 * v17])
        memmove(v24, v23, 8 * v17);
      __VaListBuilder.deallocStorage(wordCount:storage:)();
LABEL_19:
      v24 = (char *)v9[5];
    }
    if (!v24)
      goto LABEL_31;
    v26 = *(_QWORD *)(v21 + 16);
    if (v26)
    {
      v27 = (uint64_t *)(v21 + 32);
      v28 = *v10;
      while (1)
      {
        v29 = *v27++;
        *(_QWORD *)&v24[8 * v28] = v29;
        v28 = *v10 + 1;
        if (__OFADD__(*v10, 1))
          break;
        *v10 = v28;
        if (!--v26)
          goto LABEL_3;
      }
      __break(1u);
      break;
    }
LABEL_3:
    ++v12;
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
    if (v12 == v11)
      goto LABEL_26;
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
LABEL_32:

  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void _swift_os_signpost_with_format(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, char *a7, _DWORD *a8)
{
  id v11;
  int v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _WORD *v17;
  uint64_t v18;
  uint64_t v19;
  _WORD v20[433];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = *__error();
  v19 = 0x1000000000362;
  v17 = v20;
  v18 = 0x36200000000;
  if (a7)
    v13 = a7;
  else
    v13 = "";
  if (_os_log_encode(v20, v13, a8, v12, (uint64_t)&v17))
  {
    v14 = _os_log_pack_size();
    v15 = (char *)&v17 - ((MEMORY[0x1E0C80A78](v14) + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = (void *)_os_signpost_pack_fill();
    *((_QWORD *)v15 + 4) = a2;
    memcpy(v16, v20, v18);
    _os_signpost_pack_send();
  }

}

_QWORD *OSSignposter.init(logger:)@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t Logger.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t OSSignpostID.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  type metadata accessor for os_unfair_lock_s(a1, &lazy cache variable for type metadata for os_unfair_lock_s);
}

_QWORD *static OSSignpostID.exclusive.getter@<X0>(_QWORD *a1@<X8>)
{
  return static OSSignpostID.exclusive.getter(&one-time initialization token for exclusive, &static OSSignpostID.exclusive, a1);
}

uint64_t type metadata accessor for OSAllocatedUnfairLock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for OSAllocatedUnfairLock);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1, unint64_t *a2)
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

uint64_t static OSLogIntegerFormatting.decimal(explicitPositiveSign:)(char a1)
{
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v2 = 10;
  v3 = a1 & 1;
  v4 = 0;
  v5 = 0;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  v6 = 0;
  v7 = 0;
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined destroy of OSLogIntegerFormatting((uint64_t)&v2);
  return 10;
}

uint64_t outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t static os_log_type_t.fault.getter()
{
  return 17;
}

void one-time initialization function for null()
{
  static OSSignpostID.null = 0;
}

void one-time initialization function for invalid()
{
  static OSSignpostID.invalid = -1;
}

void one-time initialization function for exclusive()
{
  static OSSignpostID.exclusive = 0xEEEEB0B5B2B2EEEELL;
}

id one-time initialization function for default()
{
  id result;

  result = (id)_swift_os_log_default();
  static OS_os_log.default = (uint64_t)result;
  return result;
}

uint64_t _swift_os_log_default()
{
  uint64_t v0;
  id v1;

  v0 = MEMORY[0x1E0C81028];
  v1 = MEMORY[0x1E0C81028];
  return v0;
}

uint64_t type metadata instantiation function for OSAllocatedUnfairLock()
{
  return swift_allocateGenericValueMetadata();
}

ValueMetadata *type metadata accessor for OS_os_log.Category()
{
  return &type metadata for OS_os_log.Category;
}

uint64_t static OS_os_log.Category.pointsOfInterest.getter@<X0>(_QWORD *a1@<X8>)
{
  return static OS_os_log.Category.pointsOfInterest.getter(&one-time initialization token for pointsOfInterest, &static OS_os_log.Category.pointsOfInterest, (uint64_t *)algn_1EE22C218, a1);
}

uint64_t one-time initialization function for pointsOfInterest()
{
  uint64_t result;
  uint64_t v1;

  result = String.init(cString:)();
  static OS_os_log.Category.pointsOfInterest = result;
  *(_QWORD *)algn_1EE22C218 = v1;
  return result;
}

uint64_t static OS_os_log.Category.pointsOfInterest.getter@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;

  if (*a1 != -1)
    swift_once();
  v7 = *a3;
  *a4 = *a2;
  a4[1] = v7;
  return swift_bridgeObjectRetain();
}

uint64_t outlined destroy of OSLogIntegerFormatting(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 16))
    swift_release();
  return a1;
}

uint64_t static OSLogIntegerFormatting.decimal.getter()
{
  char v0;

  v0 = default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:)();
  return static OSLogIntegerFormatting.decimal(explicitPositiveSign:)(v0 & 1);
}

uint64_t default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:)()
{
  return 0;
}

void os_trace_blob_destroy_slow(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 3954044928;
  *(_WORD *)(a1 + 20) = 0;
  free(v1);
}

void *os_trace_blob_detach(uint64_t a1, _QWORD *a2)
{
  __int16 v2;
  const void *v3;
  unsigned int v4;
  size_t v5;
  void *v6;

  v2 = *(_WORD *)(a1 + 20);
  v3 = *(const void **)a1;
  *(_QWORD *)a1 = 3954044928;
  *(_WORD *)(a1 + 20) = 0;
  if (a2)
    *a2 = *(unsigned int *)(a1 + 8);
  if ((v2 & 1) == 0)
  {
    v4 = *(_DWORD *)(a1 + 8);
    if (*(_BYTE *)(a1 + 22))
      v5 = v4;
    else
      v5 = v4 + 1;
    v6 = _os_trace_malloc(v5);
    memcpy(v6, v3, v5);
    return v6;
  }
  return (void *)v3;
}

size_t os_trace_blob_add_slow(uint64_t a1, void *__src, size_t __n)
{
  size_t v3;
  unsigned int v6;
  size_t v7;
  unsigned int v8;

  if ((*(_WORD *)(a1 + 20) & 2) != 0)
    return 0;
  v3 = __n;
  v6 = *(_DWORD *)(a1 + 12);
  v7 = *(char *)(a1 + 22) + v6 - *(_DWORD *)(a1 + 8) - 1;
  if (v7 < __n)
  {
    if (v6 < *(_DWORD *)(a1 + 16))
      v7 = os_trace_blob_grow(a1, __n);
    if (v7 < v3)
    {
      *(_WORD *)(a1 + 20) |= 2u;
      v3 = v7;
    }
  }
  memcpy((void *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)), __src, v3);
  v8 = *(_DWORD *)(a1 + 8) + v3;
  *(_DWORD *)(a1 + 8) = v8;
  if (!*(_BYTE *)(a1 + 22))
    *(_BYTE *)(*(_QWORD *)a1 + v8) = 0;
  return v3;
}

uint64_t os_trace_blob_grow(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  size_t v4;
  size_t v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = *(_DWORD *)(a1 + 8);
  if (*(_BYTE *)(a1 + 22))
    v4 = v3;
  else
    v4 = v3 + 1;
  v5 = v4 + a2;
  if (__CFADD__(v4, a2) || HIDWORD(v5))
  {
    v6 = *(_DWORD *)(a1 + 12);
    v7 = *(_DWORD *)(a1 + 16);
  }
  else
  {
    v6 = *(_DWORD *)(a1 + 12);
    if ((v6 & 0x80000000) != 0)
    {
      v7 = *(_DWORD *)(a1 + 16);
    }
    else
    {
      if (2 * v6 > v5)
        LODWORD(v5) = 2 * v6;
      if (*(_DWORD *)(a1 + 16) >= v5)
        v7 = v5;
      else
        v7 = *(_DWORD *)(a1 + 16);
    }
  }
  if (v7 > v6)
  {
    v8 = *(void **)a1;
    if ((*(_WORD *)(a1 + 20) & 1) != 0)
    {
      while (1)
      {
        v10 = malloc_type_realloc(v8, v7, 0x70A02AF0uLL);
        if (v10)
          break;
        _os_trace_temporary_resource_shortage();
      }
      *(_QWORD *)a1 = v10;
    }
    else
    {
      v9 = _os_trace_malloc(v7);
      *(_QWORD *)a1 = v9;
      memcpy(v9, v8, v4);
      *(_WORD *)(a1 + 20) |= 1u;
    }
    *(_DWORD *)(a1 + 12) = v7;
  }
  return v7 - v4;
}

void *_os_trace_malloc(size_t a1)
{
  size_t i;
  void *result;

  for (i = a1; ; a1 = i)
  {
    result = malloc_type_malloc(a1, 0xE7D9D2F0uLL);
    if (result)
      break;
    _os_trace_temporary_resource_shortage();
  }
  return result;
}

uint64_t _os_trace_temporary_resource_shortage()
{
  return sleep(1u);
}

uint64_t OSLogFloatFormatting.explicitPositiveSign.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t OSLogFloatFormatting.explicitPositiveSign.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*OSLogFloatFormatting.explicitPositiveSign.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogFloatFormatting.uppercase.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t OSLogFloatFormatting.uppercase.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = result;
  return result;
}

uint64_t (*OSLogFloatFormatting.uppercase.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t key path getter for OSLogFloatFormatting.precision : OSLogFloatFormatting@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t *a1@<X8>)@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)@<X0>(uint64_t *@<X8>);

  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int);
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v5;
  return outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v3);
}

uint64_t key path setter for OSLogFloatFormatting.precision : OSLogFloatFormatting(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t result;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = partial apply for thunk for @escaping @callee_guaranteed () -> (@out Int);
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *(_QWORD *)(a2 + 8);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v3);
  result = outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(v7);
  *(_QWORD *)(a2 + 8) = v6;
  *(_QWORD *)(a2 + 16) = v5;
  return result;
}

uint64_t OSLogFloatFormatting.precision.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v1);
  return v1;
}

uint64_t OSLogFloatFormatting.precision.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(*(_QWORD *)(v2 + 8));
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t (*OSLogFloatFormatting.precision.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

BOOL static OSLogFloatFormatting.Notation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void OSLogFloatFormatting.Notation.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int OSLogFloatFormatting.Notation.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance OSLogFloatFormatting.Notation(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance OSLogFloatFormatting.Notation()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance OSLogFloatFormatting.Notation()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance OSLogFloatFormatting.Notation()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void OSLogFloatFormatting.notation.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 24);
}

_BYTE *OSLogFloatFormatting.notation.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 24) = *result;
  return result;
}

uint64_t (*OSLogFloatFormatting.notation.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogFloatFormatting.init(explicitPositiveSign:uppercase:precision:notation:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _BYTE *a5@<X4>, uint64_t a6@<X8>)
{
  *(_BYTE *)a6 = result;
  *(_BYTE *)(a6 + 1) = a2;
  *(_QWORD *)(a6 + 8) = a3;
  *(_QWORD *)(a6 + 16) = a4;
  *(_BYTE *)(a6 + 24) = *a5;
  return result;
}

uint64_t static OSLogFloatFormatting.fixed.getter()
{
  return static OSLogFloatFormatting.fixed.getter(default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), (uint64_t (*)(_QWORD, _QWORD))static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:));
}

uint64_t static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:)@<X0>(char a1@<W0>, char a2@<W1>, uint64_t a3@<X8>)
{
  return static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:)(a1 & 1, a2 & 1, 1, a3);
}

uint64_t outlined init with copy of OSLogFloatFormatting(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for OSLogFloatFormatting(a2, a1);
  return a2;
}

uint64_t outlined destroy of OSLogFloatFormatting(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 8))
    swift_release();
  return a1;
}

uint64_t static OSLogFloatFormatting.fixed(precision:explicitPositiveSign:uppercase:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X8>)
{
  return static OSLogFloatFormatting.fixed(precision:explicitPositiveSign:uppercase:)(a1, a2, a3 & 1, a4 & 1, 1, a5);
}

uint64_t static OSLogFloatFormatting.hex.getter()
{
  return static OSLogFloatFormatting.fixed.getter(default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), (uint64_t (*)(_QWORD, _QWORD))static OSLogFloatFormatting.hex(explicitPositiveSign:uppercase:));
}

uint64_t static OSLogFloatFormatting.fixed.getter(uint64_t (*a1)(void), uint64_t (*a2)(void), uint64_t (*a3)(_QWORD, _QWORD))
{
  char v5;
  char v6;

  v5 = a1();
  v6 = a2();
  return a3(v5 & 1, v6 & 1);
}

uint64_t static OSLogFloatFormatting.hex(explicitPositiveSign:uppercase:)@<X0>(char a1@<W0>, char a2@<W1>, uint64_t a3@<X8>)
{
  return static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:)(a1 & 1, a2 & 1, 0, a3);
}

uint64_t static OSLogFloatFormatting.exponential.getter()
{
  return static OSLogFloatFormatting.fixed.getter(default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), (uint64_t (*)(_QWORD, _QWORD))static OSLogFloatFormatting.exponential(explicitPositiveSign:uppercase:));
}

uint64_t static OSLogFloatFormatting.exponential(explicitPositiveSign:uppercase:)@<X0>(char a1@<W0>, char a2@<W1>, uint64_t a3@<X8>)
{
  return static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:)(a1 & 1, a2 & 1, 2, a3);
}

uint64_t static OSLogFloatFormatting.exponential(precision:explicitPositiveSign:uppercase:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X8>)
{
  return static OSLogFloatFormatting.fixed(precision:explicitPositiveSign:uppercase:)(a1, a2, a3 & 1, a4 & 1, 2, a5);
}

uint64_t static OSLogFloatFormatting.hybrid.getter()
{
  return static OSLogFloatFormatting.fixed.getter(default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), (uint64_t (*)(_QWORD, _QWORD))static OSLogFloatFormatting.hybrid(explicitPositiveSign:uppercase:));
}

uint64_t static OSLogFloatFormatting.hybrid(explicitPositiveSign:uppercase:)@<X0>(char a1@<W0>, char a2@<W1>, uint64_t a3@<X8>)
{
  return static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:)(a1 & 1, a2 & 1, 3, a3);
}

uint64_t static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:)@<X0>(char a1@<W0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X8>)
{
  _BYTE v6[8];
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;

  v10 = a3;
  v6[0] = a1 & 1;
  v6[1] = a2 & 1;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  v7 = 0;
  v8 = 0;
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  v9 = v10;
  outlined init with copy of OSLogFloatFormatting((uint64_t)v6, a4);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  return outlined destroy of OSLogFloatFormatting((uint64_t)v6);
}

uint64_t static OSLogFloatFormatting.hybrid(precision:explicitPositiveSign:uppercase:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X8>)
{
  return static OSLogFloatFormatting.fixed(precision:explicitPositiveSign:uppercase:)(a1, a2, a3 & 1, a4 & 1, 3, a5);
}

uint64_t static OSLogFloatFormatting.fixed(precision:explicitPositiveSign:uppercase:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, char a5@<W4>, uint64_t a6@<X8>)
{
  _BYTE v13[8];
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;

  swift_retain();
  v17 = a5;
  v13[0] = a3 & 1;
  v13[1] = a4 & 1;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a1);
  v14 = a1;
  v15 = a2;
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  v16 = a5;
  outlined init with copy of OSLogFloatFormatting((uint64_t)v13, a6);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(a1);
  return outlined destroy of OSLogFloatFormatting((uint64_t)v13);
}

uint64_t static OSLogFloatFormatting._formatStringLengthModifier<A>(_:)()
{
  if (swift_dynamicCastMetatype() || swift_dynamicCastMetatype())
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
  else
    return 0;
}

unint64_t lazy protocol witness table accessor for type OSLogFloatFormatting.Notation and conformance OSLogFloatFormatting.Notation()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSLogFloatFormatting.Notation and conformance OSLogFloatFormatting.Notation;
  if (!lazy protocol witness table cache variable for type OSLogFloatFormatting.Notation and conformance OSLogFloatFormatting.Notation)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSLogFloatFormatting.Notation, &type metadata for OSLogFloatFormatting.Notation);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogFloatFormatting.Notation and conformance OSLogFloatFormatting.Notation);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for OSLogFloatFormatting(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for OSLogFloatFormatting(uint64_t result)
{
  if (*(_QWORD *)(result + 8))
    return swift_release();
  return result;
}

uint64_t initializeWithCopy for OSLogFloatFormatting(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)a1 = *(_WORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    v5 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 8) = v4;
    *(_QWORD *)(a1 + 16) = v5;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  }
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t assignWithCopy for OSLogFloatFormatting(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  v4 = (_OWORD *)(a1 + 8);
  v6 = (_OWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (!*(_QWORD *)(a1 + 8))
  {
    if (v5)
    {
      v8 = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v8;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *v4 = *v6;
    goto LABEL_8;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  v7 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v7;
  swift_retain();
  swift_release();
LABEL_8:
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for OSLogFloatFormatting(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  v4 = (_OWORD *)(a1 + 8);
  v6 = (_OWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (!*(_QWORD *)(a1 + 8))
  {
    if (v5)
    {
      v8 = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v8;
      goto LABEL_8;
    }
LABEL_7:
    *v4 = *v6;
    goto LABEL_8;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  v7 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v7;
  swift_release();
LABEL_8:
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for OSLogFloatFormatting(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OSLogFloatFormatting(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for OSLogFloatFormatting()
{
  return &type metadata for OSLogFloatFormatting;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for OSLogFloatFormatting.Notation(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for OSLogFloatFormatting.Notation(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_191DA4784 + 4 * byte_191DB4015[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_191DA47B8 + 4 * byte_191DB4010[v4]))();
}

uint64_t sub_191DA47B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DA47C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x191DA47C8);
  return result;
}

uint64_t sub_191DA47D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x191DA47DCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_191DA47E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DA47E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *destructiveInjectEnumTag for OSLogFloatFormatting.Notation(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for OSLogFloatFormatting.Notation()
{
  return &type metadata for OSLogFloatFormatting.Notation;
}

__n128 __swift_memcpy40_4(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for os_workgroup_join_token_opaque_s(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for os_workgroup_join_token_opaque_s(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
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
  *(_BYTE *)(result + 40) = v3;
  return result;
}

void type metadata accessor for os_workgroup_join_token_opaque_s(uint64_t a1)
{
  type metadata accessor for os_unfair_lock_s(a1, &lazy cache variable for type metadata for os_workgroup_join_token_opaque_s);
}

uint64_t sub_191DA4888()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@out Int)()
{
  uint64_t v0;

  return thunk for @escaping @callee_guaranteed () -> (@out Int)(*(void (**)(uint64_t *__return_ptr))(v0 + 16));
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t OSLogFloatFormatting.formatSpecifier<A>(for:align:privacy:attributes:)(uint64_t a1, uint64_t a2, os::OSLogPrivacy a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  os::OSLogPrivacy v10;
  Swift::String v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t countAndFlagsBits;

  countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("%", 1uLL, 1)._countAndFlagsBits;
  v10 = a3;
  v11._countAndFlagsBits = a4;
  v11._object = a5;
  if ((unint64_t)concatPrivacyAndAttributes(privacy:attributes:)(v10, v11).value._object)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("{", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    static String.+= infix(_:_:)();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("}", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if ((*(_BYTE *)v5 & 1) != 0)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("+", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  if ((*(_BYTE *)(a2 + 16) & 1) == 0)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("-", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  v12 = *(_QWORD *)a2;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(*(_QWORD *)a2);
  if (v12)
  {
    swift_release();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("*", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  v13 = *(_QWORD *)(v5 + 8);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v13);
  if (v13)
  {
    swift_release();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(".*", 2uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  static OSLogFloatFormatting._formatStringLengthModifier<A>(_:)();
  if (!v14)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Float type has unknown length", 0x1DuLL, 1);
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    JUMPOUT(0x191DA4DF4);
  }
  static String.+= infix(_:_:)();
  switch(*(_BYTE *)(v5 + 24))
  {
    case 0:
      if ((*(_BYTE *)(v5 + 1) & 1) != 0)
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("A", 1uLL, 1);
      else
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("a", 1uLL, 1);
      goto LABEL_25;
    case 1:
      if ((*(_BYTE *)(v5 + 1) & 1) != 0)
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("F", 1uLL, 1);
      else
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("f", 1uLL, 1);
      goto LABEL_25;
    case 2:
      if ((*(_BYTE *)(v5 + 1) & 1) != 0)
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("E", 1uLL, 1);
      else
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("e", 1uLL, 1);
      goto LABEL_25;
    case 3:
      if ((*(_BYTE *)(v5 + 1) & 1) != 0)
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("G", 1uLL, 1);
      else
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("g", 1uLL, 1);
LABEL_25:
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    default:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Unknown float notation", 0x16uLL, 1);
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      break;
  }
  swift_bridgeObjectRelease();
  return countAndFlagsBits;
}

uint64_t OSLogInterpolation.appendInterpolation(_:privacy:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  Swift::String v7;

  swift_retain();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  OSLogInterpolation.appendInterpolation(_:privacy:attributes:)((uint64_t)partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:), v6, a3, v7._countAndFlagsBits, v7._object);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_191DA4EB8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v12;
  uint64_t result;
  os::OSLogPrivacy v14;
  Swift::String v15;
  os::OSLogPrivacy v16;
  os::OSLogPrivacy v17;
  unsigned int v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  char v22;
  _BYTE __dst[56];

  v6 = v5;
  v12 = *(_BYTE *)(v6 + 25);
  result = maxOSLogArgumentCount.getter();
  if (v12 < result)
  {
    memcpy(__dst, (const void *)v6, sizeof(__dst));
    outlined retain of OSLogInterpolation((uint64_t)__dst);
    v14 = (os::OSLogPrivacy)a3;
    v15._countAndFlagsBits = a4;
    v15._object = a5;
    OSLogInterpolation.getNSObjectFormatSpecifier(_:_:)(v14, v15);
    outlined release of OSLogInterpolation((uint64_t)__dst);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    if (*(_BYTE *)(a3 + 1) != 1)
    {
      v16 = (os::OSLogPrivacy)a3;
      OSLogInterpolation.appendMaskArgument(_:)(v16);
    }
    v17 = (os::OSLogPrivacy)a3;
    OSLogInterpolation.addNSObjectHeaders(_:)(v17);
    result = OSLogArguments.append(_:)(a1, a2);
    v18 = *(unsigned __int8 *)(v6 + 25) + 1;
    if (((v18 >> 8) & 1) != 0)
    {
      __break(1u);
    }
    else
    {
      *(_BYTE *)(v6 + 25) = v18;
      v19 = *(_QWORD *)(v6 + 48);
      v20 = __OFADD__(v19, 1);
      v21 = v19 + 1;
      v22 = v20;
      if ((v22 & 1) == 0)
      {
        *(_QWORD *)(v6 + 48) = v21;
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

Swift::String __swiftcall OSLogInterpolation.getNSObjectFormatSpecifier(_:_:)(os::OSLogPrivacy a1, Swift::String a2)
{
  void *object;
  uint64_t countAndFlagsBits;
  Swift::String v5;
  os::OSLogPrivacy v6;
  Swift::String v7;
  uint64_t v8;
  void *v9;
  Swift::String result;

  object = a2._object;
  countAndFlagsBits = a2._countAndFlagsBits;
  v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("%", 1uLL, 1);
  v6 = a1;
  v7._countAndFlagsBits = countAndFlagsBits;
  v7._object = object;
  if ((unint64_t)concatPrivacyAndAttributes(privacy:attributes:)(v6, v7).value._object)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("{", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    static String.+= infix(_:_:)();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("}", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("@", 1uLL, 1);
  static String.+= infix(_:_:)();
  swift_bridgeObjectRelease();
  v8 = v5._countAndFlagsBits;
  v9 = v5._object;
  result._object = v9;
  result._countAndFlagsBits = v8;
  return result;
}

Swift::Void __swiftcall OSLogInterpolation.addNSObjectHeaders(_:)(os::OSLogPrivacy a1)
{
  _QWORD *v1;
  _QWORD *v2;
  os::OSLogPrivacy v4;
  Swift::UInt8 v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  char v9;
  os::OSLogPrivacy v10;
  Swift::UInt8 v11;
  Swift::UInt8 v12;
  char v13;
  _BYTE v14[56];
  _BYTE __dst[56];

  v2 = v1;
  memcpy(__dst, v1, sizeof(__dst));
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  v13 = 4;
  v4 = a1;
  v5 = OSLogInterpolation.getArgumentHeader(privacy:type:)(v4, (os::OSLogInterpolation::ArgumentType)&v13);
  outlined release of OSLogInterpolation((uint64_t)__dst);
  OSLogArguments.append(_:)(v5);
  lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  OSLogArguments.append(_:)(v12);
  v6 = v1[4];
  v7 = __OFADD__(v6, 10);
  v8 = v6 + 10;
  v9 = v7;
  if ((v9 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v1[4] = v8;
    memcpy(v14, v1, sizeof(v14));
    outlined retain of OSLogInterpolation((uint64_t)v14);
    v10 = a1;
    v11 = OSLogInterpolation.getUpdatedPreamble(privacy:isScalar:)(v10, 0);
    outlined release of OSLogInterpolation((uint64_t)v14);
    *((_BYTE *)v2 + 24) = v11;
  }
}

uint64_t outlined retain of OSLogInterpolation(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t OSLogArguments.append(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_retain();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  return Array.append(_:)();
}

{
  uint64_t v4;

  swift_retain();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  return Array.append(_:)();
}

{
  uint64_t v4;

  swift_retain();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  return Array.append(_:)();
}

{
  uint64_t v4;

  swift_retain();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  return Array.append(_:)();
}

uint64_t outlined release of OSLogInterpolation(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t lazy protocol witness table accessor for type UInt8 and conformance UInt8()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UInt8 and conformance UInt8;
  if (!lazy protocol witness table cache variable for type UInt8 and conformance UInt8)
  {
    result = MEMORY[0x19401FDEC](MEMORY[0x1E0DEDEB0], MEMORY[0x1E0DEDE70]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt8 and conformance UInt8);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UInt8 and conformance UInt8;
  if (!lazy protocol witness table cache variable for type UInt8 and conformance UInt8)
  {
    result = MEMORY[0x19401FDEC](MEMORY[0x1E0DEDE90], MEMORY[0x1E0DEDE70]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt8 and conformance UInt8);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    result = MEMORY[0x19401FDEC](MEMORY[0x1E0DEB460], MEMORY[0x1E0DEB418]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    result = MEMORY[0x19401FDEC](MEMORY[0x1E0DEB470], MEMORY[0x1E0DEB418]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

void closure #1 in OSLogArguments.append(_:)(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
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

void partial apply for closure #1 in OSLogArguments.append(_:)(uint64_t *a1, _QWORD **a2, uint64_t a3)
{
  uint64_t v3;

  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x19401FDD4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

BOOL static OSLogPointerFormat.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void OSLogPointerFormat.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int OSLogPointerFormat.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t OSLogInterpolation.appendInterpolation(_:format:privacy:)(uint64_t a1, uint64_t a2, os::OSLogPointerFormat a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  Swift::String v10;

  swift_retain();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  swift_retain();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  v10 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  OSLogInterpolation.appendInterpolation(_:bytes:format:privacy:attributes:)((uint64_t)partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:privacy:), v8, (uint64_t)partial apply for implicit closure #2 in OSLogInterpolation.appendInterpolation(_:format:privacy:), v9, a3, a4, v10._countAndFlagsBits, v10._object);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:privacy:)(uint64_t (*a1)(void))
{
  uint64_t result;

  result = a1();
  if (!result)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t sub_191DA574C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:privacy:)()
{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t partial apply for implicit closure #2 in OSLogInterpolation.appendInterpolation(_:format:privacy:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = (*(uint64_t (**)(void))(v0 + 16))();
  if (v1)
    return v2 - v1;
  else
    return 0;
}

uint64_t OSLogInterpolation.appendInterpolation(_:bytes:format:privacy:attributes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, os::OSLogPointerFormat a5, uint64_t a6, uint64_t a7, void *a8)
{
  _BYTE *v8;
  _BYTE *v9;
  unsigned __int8 v18;
  uint64_t result;
  os::OSLogPrivacy v20;
  Swift::String v21;
  os::OSLogPrivacy v22;
  os::OSLogPrivacy v23;
  _BYTE *v24;
  int v25;
  char v26;
  _BYTE __dst[56];

  v9 = v8;
  v18 = v9[25];
  result = maxOSLogArgumentCount.getter();
  if (v18 < result)
  {
    memcpy(__dst, v9, sizeof(__dst));
    outlined retain of OSLogInterpolation((uint64_t)__dst);
    v20 = (os::OSLogPrivacy)a6;
    v21._countAndFlagsBits = a7;
    v21._object = a8;
    OSLogInterpolation.getPointerFormatSpecifier(_:_:_:)(a5, v20, v21);
    outlined release of OSLogInterpolation((uint64_t)__dst);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    if (*(_BYTE *)(a6 + 1) != 1)
    {
      v22 = (os::OSLogPrivacy)a6;
      OSLogInterpolation.appendMaskArgument(_:)(v22);
    }
    OSLogInterpolation.appendPrecisionArgument(_:)(a3, a4);
    v23 = (os::OSLogPrivacy)a6;
    OSLogInterpolation.addPointerHeaders(_:)(v23);
    result = OSLogArguments.append(_:)(a1, a2);
    v25 = v9[25];
    v24 = v9 + 25;
    v26 = v25 + 1;
    if ((((v25 + 1) >> 8) & 1) != 0)
      __break(1u);
    else
      *v24 = v26;
  }
  return result;
}

uint64_t OSLogInterpolation.appendInterpolation(_:bytes:format:privacy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, os::OSLogPointerFormat a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  Swift::String v14;

  swift_retain();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  swift_retain();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_QWORD *)(v13 + 24) = a4;
  v14 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  OSLogInterpolation.appendInterpolation(_:bytes:format:privacy:attributes:)((uint64_t)partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:), v12, (uint64_t)partial apply for implicit closure #2 in OSLogInterpolation.appendInterpolation(_:bytes:format:privacy:), v13, a5, a6, v14._countAndFlagsBits, v14._object);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

Swift::String __swiftcall OSLogInterpolation.getPointerFormatSpecifier(_:_:_:)(os::OSLogPointerFormat a1, os::OSLogPrivacy a2, Swift::String a3)
{
  _BYTE *v3;
  Swift::String_optional v5;
  BOOL v6;
  BOOL v7;
  Swift::String v8;
  uint64_t countAndFlagsBits;
  void *object;
  Swift::String result;
  BOOL v12;

  v3 = (_BYTE *)a1;
  v12 = *(_BYTE *)a1 != 5;
  v5 = concatPrivacyAndAttributes(privacy:attributes:)(a2, a3);
  v6 = v5.value._object != 0;
  v7 = v12 || v5.value._object != 0;
  if (!v12)
    v6 = 0;
  v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("%", 1uLL, 1);
  if (v7)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("{", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  switch(*v3)
  {
    case 0:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("network:in6_addr", 0x10uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 1:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("timeval", 7uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 2:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("timespec", 8uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 3:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("uuid_t", 6uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 4:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("network:sockaddr", 0x10uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    default:
      break;
  }
  if (v6)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(",", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  if (v5.value._object)
  {
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  if (v7)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("}", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(".*P", 3uLL, 1);
  static String.+= infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  countAndFlagsBits = v8._countAndFlagsBits;
  object = v8._object;
  result._object = object;
  result._countAndFlagsBits = countAndFlagsBits;
  return result;
}

Swift::Void __swiftcall OSLogInterpolation.addPointerHeaders(_:)(os::OSLogPrivacy a1)
{
  _QWORD *v1;
  _QWORD *v2;
  os::OSLogPrivacy v4;
  Swift::UInt8 v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  char v9;
  os::OSLogPrivacy v10;
  Swift::UInt8 v11;
  Swift::UInt8 v12;
  char v13;
  _BYTE v14[56];
  _BYTE __dst[56];

  v2 = v1;
  memcpy(__dst, v1, sizeof(__dst));
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  v13 = 3;
  v4 = a1;
  v5 = OSLogInterpolation.getArgumentHeader(privacy:type:)(v4, (os::OSLogInterpolation::ArgumentType)&v13);
  outlined release of OSLogInterpolation((uint64_t)__dst);
  OSLogArguments.append(_:)(v5);
  lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  OSLogArguments.append(_:)(v12);
  v6 = v1[4];
  v7 = __OFADD__(v6, 10);
  v8 = v6 + 10;
  v9 = v7;
  if ((v9 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v1[4] = v8;
    memcpy(v14, v1, sizeof(v14));
    outlined retain of OSLogInterpolation((uint64_t)v14);
    v10 = a1;
    v11 = OSLogInterpolation.getUpdatedPreamble(privacy:isScalar:)(v10, 0);
    outlined release of OSLogInterpolation((uint64_t)v14);
    *((_BYTE *)v2 + 24) = v11;
  }
}

uint64_t partial apply for closure #1 in OSLogArguments.append(_:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  (*(void (**)(void))(v1 + 16))();
  v3 = *a1 + 8;
  result = UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v3;
  return result;
}

{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  (*(void (**)(void))(v1 + 16))();
  v3 = *a1 + 8;
  result = UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v3;
  return result;
}

unint64_t lazy protocol witness table accessor for type OSLogPointerFormat and conformance OSLogPointerFormat()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSLogPointerFormat and conformance OSLogPointerFormat;
  if (!lazy protocol witness table cache variable for type OSLogPointerFormat and conformance OSLogPointerFormat)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSLogPointerFormat, &type metadata for OSLogPointerFormat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogPointerFormat and conformance OSLogPointerFormat);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for OSLogPointerFormat(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for OSLogPointerFormat(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_191DA60A8 + 4 * byte_191DB415A[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_191DA60DC + 4 * byte_191DB4155[v4]))();
}

uint64_t sub_191DA60DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DA60E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x191DA60ECLL);
  return result;
}

uint64_t sub_191DA60F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x191DA6100);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_191DA6104(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DA610C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OSLogPointerFormat()
{
  return &type metadata for OSLogPointerFormat;
}

void closure #1 in os_signpost(_:dso:log:name:signpostID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, unsigned __int8 a6, uint64_t a7)
{
  if (a1)
  {
    _swift_os_signpost(a3, a4, a5, a6, a1, a7);
  }
  else
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

uint64_t closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:)(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, unsigned __int8 a10, uint64_t a11)
{
  uint64_t result;

  if (a1)
    return closure #1 in closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:)(a1, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t closure #1 in closure #1 in closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, unsigned __int8 a7, uint64_t a8, uint64_t a9)
{
  uint64_t result;

  if (a1)
  {
    swift_bridgeObjectRetain();
    specialized withVaList<A>(_:_:)(a3, a4, a5, a6, a7, a8, a9, a1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t specialized withVaList<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, char *a7)
{
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _DWORD *v29;
  uint64_t result;
  _QWORD v37[3];
  uint64_t v38;
  uint64_t v39;

  type metadata accessor for __VaListBuilder();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 8;
  v8[3] = 0;
  v9 = v8 + 3;
  v8[4] = 0;
  v8[5] = 0;
  v10 = *(_QWORD *)(a1 + 16);
  if (!v10)
  {
LABEL_26:
    v29 = (_DWORD *)__VaListBuilder.va_list()();
    _swift_os_signpost_with_format(a2, a3, a4, 1, a5, a6, a7, v29);

    return swift_release();
  }
  v11 = 0;
  v12 = a1 + 32;
  while (1)
  {
    outlined init with copy of CVarArg(v12 + 40 * v11, (uint64_t)v37);
    v13 = v38;
    v14 = v39;
    __swift_project_boxed_opaque_existential_1(v37, v38);
    v15 = MEMORY[0x19401FA68](v13, v14);
    v16 = *v9;
    v17 = *(_QWORD *)(v15 + 16);
    v18 = __OFADD__(*v9, v17);
    v19 = *v9 + v17;
    if (v18)
      break;
    v20 = v15;
    v21 = v8[4];
    if (v21 >= v19)
      goto LABEL_19;
    if (v21 + 0x4000000000000000 < 0)
      goto LABEL_29;
    v22 = (char *)v8[5];
    if (2 * v21 > v19)
      v19 = 2 * v21;
    v8[4] = v19;
    if ((unint64_t)(v19 - 0x1000000000000000) >> 61 != 7)
      goto LABEL_30;
    v23 = (char *)swift_slowAlloc();
    v8[5] = v23;
    if (v22)
    {
      if (v16 < 0)
        goto LABEL_32;
      if (v23 != v22 || v23 >= &v22[8 * v16])
        memmove(v23, v22, 8 * v16);
      __VaListBuilder.deallocStorage(wordCount:storage:)();
LABEL_19:
      v23 = (char *)v8[5];
    }
    if (!v23)
      goto LABEL_31;
    v25 = *(_QWORD *)(v20 + 16);
    if (v25)
    {
      v26 = (uint64_t *)(v20 + 32);
      v27 = *v9;
      while (1)
      {
        v28 = *v26++;
        *(_QWORD *)&v23[8 * v27] = v28;
        v27 = *v9 + 1;
        if (__OFADD__(*v9, 1))
          break;
        *v9 = v27;
        if (!--v25)
          goto LABEL_3;
      }
      __break(1u);
      break;
    }
LABEL_3:
    ++v11;
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    if (v11 == v10)
      goto LABEL_26;
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
LABEL_32:

  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t static AnimationFormatString.constructOSLogInterpolation(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[7];
  _BYTE __src[56];

  OSLogInterpolation.init(literalCapacity:interpolationCount:)((uint64_t)__src);
  memcpy(v10, __src, sizeof(v10));
  static String.+= infix(_:_:)();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" isAnimation=YES", 0x10uLL, 1);
  static String.+= infix(_:_:)();
  result = swift_bridgeObjectRelease();
  v3 = v10[1];
  v4 = v10[2];
  v5 = v10[3];
  v6 = BYTE1(v10[3]);
  v7 = v10[4];
  v8 = v10[5];
  v9 = v10[6];
  *(_QWORD *)a1 = v10[0];
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 25) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  return result;
}

uint64_t AnimationFormatString.OSLogMessage.formatStringPointer.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*AnimationFormatString.OSLogMessage.formatStringPointer.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

void AnimationFormatString.OSLogMessage.init(stringLiteral:)()
{
  _BYTE v0[56];
  _BYTE v1[8];

  static AnimationFormatString.constructOSLogInterpolation(_:)((uint64_t)v0);
  swift_bridgeObjectRelease();
  OSLogMessage.init(stringInterpolation:)(v0, (uint64_t)v1);
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)v1);
  __break(1u);
}

void protocol witness for ExpressibleByStringLiteral.init(stringLiteral:) in conformance AnimationFormatString.OSLogMessage()
{
  _BYTE v0[56];
  _BYTE v1[8];

  static AnimationFormatString.constructOSLogInterpolation(_:)((uint64_t)v0);
  swift_bridgeObjectRelease();
  OSLogMessage.init(stringInterpolation:)(v0, (uint64_t)v1);
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)v1);
  __break(1u);
}

uint64_t static OSSignpostAnimationBegin.== infix(_:_:)()
{
  return 1;
}

void OSSignpostAnimationBegin.hash(into:)()
{
  Hasher._combine(_:)(0);
}

Swift::Int OSSignpostAnimationBegin.hashValue.getter()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance OSSignpostAnimationBegin()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance OSSignpostAnimationBegin()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance OSSignpostAnimationBegin()
{
  Hasher._combine(_:)(0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance OSSignpostAnimationBegin()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t animationBeginSignpostHelper(dso:log:name:signpostID:formatStringPointer:arguments:)(uint64_t result, os_log_t log, unint64_t a3, uint64_t a4, char a5, uint64_t *a6, char *a7, uint64_t a8)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  uint64_t v24;

  v14 = result;
  v15 = *a6;
  if (one-time initialization token for invalid != -1)
    result = swift_once();
  if (v15 != static OSSignpostID.invalid)
  {
    if (one-time initialization token for null != -1)
      swift_once();
    v16 = static OSSignpostID.null;
    result = os_signpost_enabled(log);
    if ((_DWORD)result)
    {
      if (v15 != v16)
      {
        v17 = _swift_os_log_return_address();
        if ((a5 & 1) != 0)
        {
          if (HIDWORD(a3))
          {
LABEL_26:
            _assertionFailure(_:_:file:line:flags:)();
            __break(1u);
            goto LABEL_27;
          }
          if (WORD1(a3) <= 0x10u && (a3 & 0xFFFFF800) != 0xD800)
          {
            if (a3 < 0x80)
            {
              v18 = a3 + 1;
LABEL_17:
              v19 = __clz(v18);
              v24 = (v18 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * (4 - (v19 >> 3))));
              return closure #1 in animationBeginSignpostHelper(dso:log:name:signpostID:formatStringPointer:arguments:)((uint64_t)&v24, 4 - (v19 >> 3), a8, v14, v17, log, v15, a7);
            }
            v20 = (a3 & 0x3F) << 8;
            if (a3 < 0x800)
            {
              v21 = v20 | (a3 >> 6);
              v22 = 33217;
LABEL_21:
              v18 = v21 + v22;
              goto LABEL_17;
            }
            v23 = (v20 | (a3 >> 6) & 0x3F) << 8;
            if (!WORD1(a3))
            {
              v18 = (v23 | (a3 >> 12)) + 8487393;
              goto LABEL_17;
            }
LABEL_27:
            v21 = ((v23 | (a3 >> 12) & 0x3F) << 8) | (a3 >> 18);
            v22 = -2122219023;
            goto LABEL_21;
          }
        }
        else if (a3)
        {
          if ((a4 & 0x8000000000000000) == 0)
          {
            swift_bridgeObjectRetain();
            specialized withVaList<A>(_:_:)(a8, v14, v17, log, a3, v15, a7);
            return swift_bridgeObjectRelease();
          }
          goto LABEL_25;
        }
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
LABEL_25:
        _fatalErrorMessage(_:_:file:line:flags:)();
        __break(1u);
        goto LABEL_26;
      }
    }
  }
  return result;
}

uint64_t closure #1 in animationBeginSignpostHelper(dso:log:name:signpostID:formatStringPointer:arguments:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, char *a8)
{
  uint64_t result;

  if (a1)
  {
    swift_bridgeObjectRetain();
    specialized withVaList<A>(_:_:)(a3, a4, a5, a6, a1, a7, a8);
    return swift_bridgeObjectRelease();
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t os_signpost(_:dso:log:name:signpostID:_:_:)(int a1, uint64_t a2, os_log_t log, unint64_t a4, uint64_t a5, char a6, uint64_t *a7, char *a8, uint64_t a9)
{
  return animationBeginSignpostHelper(dso:log:name:signpostID:formatStringPointer:arguments:)(a2, log, a4, a5, a6, a7, a8, a9);
}

uint64_t os_signpost(_:dso:log:name:signpostID:)(int a1, uint64_t a2, os_log_t log, unint64_t a4, uint64_t a5, char a6, uint64_t *a7)
{
  return animationBeginSignpostHelper(dso:log:name:signpostID:formatStringPointer:arguments:)(a2, log, a4, a5, a6, a7, "isAnimation=YES", MEMORY[0x1E0DEE9D8]);
}

_QWORD *static OSSignpostID.invalid.getter@<X0>(_QWORD *a1@<X8>)
{
  return static OSSignpostID.exclusive.getter(&one-time initialization token for invalid, &static OSSignpostID.invalid, a1);
}

_QWORD *static OSSignpostID.null.getter@<X0>(_QWORD *a1@<X8>)
{
  return static OSSignpostID.exclusive.getter(&one-time initialization token for null, &static OSSignpostID.null, a1);
}

BOOL static OSSignpostID.< infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

BOOL static OSSignpostID.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance OSSignpostID(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance OSSignpostID(_QWORD *a1, _QWORD *a2)
{
  return *a2 >= *a1;
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance OSSignpostID(_QWORD *a1, _QWORD *a2)
{
  return *a1 >= *a2;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance OSSignpostID(_QWORD *a1, _QWORD *a2)
{
  return *a2 < *a1;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance OSSignpostID(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t OS_os_log.Category.rawValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t one-time initialization function for dynamicTracing()
{
  uint64_t result;
  uint64_t v1;

  result = String.init(cString:)();
  static OS_os_log.Category.dynamicTracing = result;
  *(_QWORD *)algn_1EE22C308 = v1;
  return result;
}

uint64_t static OS_os_log.Category.dynamicTracing.getter@<X0>(_QWORD *a1@<X8>)
{
  return static OS_os_log.Category.pointsOfInterest.getter(&one-time initialization token for dynamicTracing, &static OS_os_log.Category.dynamicTracing, (uint64_t *)algn_1EE22C308, a1);
}

uint64_t one-time initialization function for dynamicStackTracing()
{
  uint64_t result;
  uint64_t v1;

  result = String.init(cString:)();
  static OS_os_log.Category.dynamicStackTracing = result;
  *(_QWORD *)algn_1EE22C318 = v1;
  return result;
}

uint64_t static OS_os_log.Category.dynamicStackTracing.getter@<X0>(_QWORD *a1@<X8>)
{
  return static OS_os_log.Category.pointsOfInterest.getter(&one-time initialization token for dynamicStackTracing, &static OS_os_log.Category.dynamicStackTracing, (uint64_t *)algn_1EE22C318, a1);
}

uint64_t _ss7UnicodeO6ScalarV17withUTF8CodeUnitsyxxSRys5UInt8VGKXEKlFyt_Tg5024_ss12StaticStringV14withd14BufferyxxSRys5G20VGXElFxAFXEfU_yt_Tg5AHxRi_zRi0_zlyytIsgyr_Tf1ncn_n(unsigned int a1, uint64_t (*a2)(uint64_t *))
{
  unsigned int v2;
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  if (a1 >= 0x80)
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

uint64_t partial apply for closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:)(a1, a2, *(char **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_BYTE *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56), *(void **)(v2 + 64), *(_BYTE *)(v2 + 72), *(_QWORD *)(v2 + 80));
}

unint64_t lazy protocol witness table accessor for type AnimationFormatString.OSLogMessage and conformance AnimationFormatString.OSLogMessage()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AnimationFormatString.OSLogMessage and conformance AnimationFormatString.OSLogMessage;
  if (!lazy protocol witness table cache variable for type AnimationFormatString.OSLogMessage and conformance AnimationFormatString.OSLogMessage)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for AnimationFormatString.OSLogMessage, &type metadata for AnimationFormatString.OSLogMessage);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnimationFormatString.OSLogMessage and conformance AnimationFormatString.OSLogMessage);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AnimationFormatString.OSLogMessage and conformance AnimationFormatString.OSLogMessage;
  if (!lazy protocol witness table cache variable for type AnimationFormatString.OSLogMessage and conformance AnimationFormatString.OSLogMessage)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for AnimationFormatString.OSLogMessage, &type metadata for AnimationFormatString.OSLogMessage);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnimationFormatString.OSLogMessage and conformance AnimationFormatString.OSLogMessage);
  }
  return result;
}

uint64_t associated type witness table accessor for ExpressibleByStringLiteral.StringLiteralType : _ExpressibleByBuiltinStringLiteral in AnimationFormatString.OSLogMessage()
{
  return MEMORY[0x1E0DEA9F0];
}

uint64_t associated type witness table accessor for ExpressibleByExtendedGraphemeClusterLiteral.ExtendedGraphemeClusterLiteralType : _ExpressibleByBuiltinExtendedGraphemeClusterLiteral in AnimationFormatString.OSLogMessage()
{
  return MEMORY[0x1E0DEAA00];
}

uint64_t associated type witness table accessor for ExpressibleByUnicodeScalarLiteral.UnicodeScalarLiteralType : _ExpressibleByBuiltinUnicodeScalarLiteral in AnimationFormatString.OSLogMessage()
{
  return MEMORY[0x1E0DEA9F8];
}

unint64_t lazy protocol witness table accessor for type OSSignpostAnimationBegin and conformance OSSignpostAnimationBegin()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSSignpostAnimationBegin and conformance OSSignpostAnimationBegin;
  if (!lazy protocol witness table cache variable for type OSSignpostAnimationBegin and conformance OSSignpostAnimationBegin)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSSignpostAnimationBegin, &type metadata for OSSignpostAnimationBegin);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSSignpostAnimationBegin and conformance OSSignpostAnimationBegin);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OSSignpostID and conformance OSSignpostID()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSSignpostID and conformance OSSignpostID;
  if (!lazy protocol witness table cache variable for type OSSignpostID and conformance OSSignpostID)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSSignpostID, &type metadata for OSSignpostID);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSSignpostID and conformance OSSignpostID);
  }
  return result;
}

ValueMetadata *type metadata accessor for AnimationFormatString()
{
  return &type metadata for AnimationFormatString;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AnimationFormatString.OSLogMessage(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)a1)
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for AnimationFormatString.OSLogMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)result = a2 - 2;
    if (a3 >= 2)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AnimationFormatString.OSLogMessage()
{
  return &type metadata for AnimationFormatString.OSLogMessage;
}

uint64_t getEnumTagSinglePayload for OSSignpostAnimationBegin(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for OSSignpostAnimationBegin(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_191DA71B8 + 4 * byte_191DB4200[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_191DA71D8 + 4 * byte_191DB4205[v4]))();
}

_BYTE *sub_191DA71B8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_191DA71D8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_191DA71E0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_191DA71E8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_191DA71F0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_191DA71F8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for OSSignpostAnimationBegin()
{
  return &type metadata for OSSignpostAnimationBegin;
}

_QWORD *initializeBufferWithCopyOfBuffer for OS_os_log.Category(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for OS_os_log.Category()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for OS_os_log.Category(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
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

_QWORD *assignWithTake for OS_os_log.Category(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for OS_os_log.Category(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OS_os_log.Category(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t partial apply for closure #1 in closure #1 in closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:)(char *a1, uint64_t a2)
{
  uint64_t v2;

  return closure #1 in closure #1 in closure #1 in os_signpost(_:dso:log:name:signpostID:_:_:)(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(void **)(v2 + 40), *(_BYTE *)(v2 + 48), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 64));
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

Swift::Void __swiftcall OSLogInterpolation.appendMaskArgument(_:)(os::OSLogPrivacy a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  _BYTE *v4;
  Swift::UInt8 v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  int v14;
  char v15;
  char v16;
  _BYTE v17[2];
  _BYTE __dst[56];

  v2 = v1;
  v3 = *(_QWORD *)&a1.privacy;
  memcpy(__dst, v1, sizeof(__dst));
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  static OSLogPrivacy.auto.getter(v17);
  v16 = 5;
  v4 = v17;
  v5 = OSLogInterpolation.getArgumentHeader(privacy:type:)((os::OSLogPrivacy)v4, (os::OSLogInterpolation::ArgumentType)&v16);
  outlined release of OSLogInterpolation((uint64_t)__dst);
  OSLogArguments.append(_:)(v5);
  OSLogArguments.append(_:)(8u);
  v6 = v1[4];
  v7 = __OFADD__(v6, 10);
  v8 = v6 + 10;
  v9 = v7;
  if ((v9 & 1) != 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  v1[4] = v8;
  switch(*(_BYTE *)(v3 + 1))
  {
    case 0:
    case 1:
      v10 = 1752392040;
      break;
    case 2:
      v10 = 0x656D616E6C69616DLL;
      break;
    case 3:
      v10 = 0x726464616C69616DLL;
      break;
    case 4:
      v10 = 0x6A6275736C69616DLL;
      break;
    case 5:
      v10 = 0x6D6D75736C69616DLL;
      break;
    case 6:
      v10 = 0x6F6363616C69616DLL;
      break;
    case 7:
      v10 = 0x786F626C69616DLL;
      break;
    case 8:
      v10 = 0x7075626D6C69616DLL;
      break;
    case 9:
      v10 = 0x617474616C69616DLL;
      break;
    default:
      v10 = 1752392040;
      break;
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = lazy protocol witness table accessor for type UInt64 and conformance UInt64();
  OSLogArguments.append<A>(_:)((uint64_t)partial apply for closure #1 in OSLogInterpolation.appendMaskArgument(_:), v11, MEMORY[0x1E0DEE190], v12);
  swift_release();
  v14 = *((unsigned __int8 *)v2 + 25);
  v13 = (char *)v2 + 25;
  v15 = v14 + 1;
  if ((((v14 + 1) >> 8) & 1) != 0)
  {
LABEL_19:
    __break(1u);
    JUMPOUT(0x191DA7594);
  }
  *v13 = v15;
}

uint64_t _ss27_withUnprotectedUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, char *);
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  _QWORD v19[2];

  v11 = *(_QWORD *)(a5 - 8);
  v12 = MEMORY[0x1E0C80A78](a1);
  v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64);
  if (v17 < 0)
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    result = v13(v12, v12 + v17, (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v8)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v15, a5);
  }
  return result;
}

void OSLogInterpolation.appendPrecisionArgument(_:)(uint64_t a1, uint64_t a2)
{
  OSLogInterpolation.appendPrecisionArgument(_:)(a1, a2, 1, (uint64_t)&unk_1E2DFB770, (uint64_t)partial apply for closure #1 in OSLogInterpolation.appendPrecisionAlignCount(_:_:));
}

uint64_t OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8)
{
  return OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_1E2DFB798, (uint64_t (*)(void))lazy protocol witness table accessor for type Int and conformance Int, MEMORY[0x1E0DEB418], (uint64_t)_sSiIegd_SiIegr_TRTA_0);
}

{
  return OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_1E2DFB7C0, (uint64_t (*)(void))lazy protocol witness table accessor for type Int8 and conformance Int8, MEMORY[0x1E0DEDA70], (uint64_t)partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int8));
}

{
  return OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_1E2DFB7E8, (uint64_t (*)(void))lazy protocol witness table accessor for type Int16 and conformance Int16, MEMORY[0x1E0DEDB58], (uint64_t)partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int16));
}

{
  return OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_1E2DFB810, (uint64_t (*)(void))lazy protocol witness table accessor for type Int32 and conformance Int32, MEMORY[0x1E0DEDBC8], (uint64_t)partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int32));
}

{
  return OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_1E2DFB838, (uint64_t (*)(void))lazy protocol witness table accessor for type Int64 and conformance Int64, MEMORY[0x1E0DEDC60], (uint64_t)partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int64));
}

{
  return OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_1E2DFB860, (uint64_t (*)(void))lazy protocol witness table accessor for type UInt and conformance UInt, MEMORY[0x1E0DEBB98], (uint64_t)partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int64));
}

{
  return OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_1E2DFB888, (uint64_t (*)(void))lazy protocol witness table accessor for type UInt8 and conformance UInt8, MEMORY[0x1E0DEDE70], (uint64_t)partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned UInt8));
}

{
  return OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_1E2DFB8B0, (uint64_t (*)(void))lazy protocol witness table accessor for type UInt16 and conformance UInt16, MEMORY[0x1E0DEE068], (uint64_t)partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned UInt16));
}

{
  return OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_1E2DFB8D8, (uint64_t (*)(void))lazy protocol witness table accessor for type UInt32 and conformance UInt32, MEMORY[0x1E0DEE0F8], (uint64_t)partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned UInt32));
}

{
  return OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_1E2DFB900, (uint64_t (*)(void))lazy protocol witness table accessor for type UInt64 and conformance UInt64, MEMORY[0x1E0DEE190], (uint64_t)partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int64));
}

uint64_t default argument 4 of OSLogInterpolation.appendInteger<A>(_:format:align:privacy:attributes:)()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
}

uint64_t OSLogInterpolation.appendInteger<A>(_:format:align:privacy:attributes:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;
  char v15;
  char v16;
  char v17;
  unsigned __int8 v20;
  uint64_t result;
  uint64_t v22;
  os::OSLogPrivacy v23;
  uint64_t v24;
  uint64_t v25;
  os::OSLogPrivacy v26;
  Swift::Int v27;
  os::OSLogPrivacy v28;
  _BYTE *v29;
  int v30;
  char v31;
  int v36;

  v13 = v12;
  v15 = a4 & 1;
  v16 = BYTE1(a4) & 1;
  v17 = BYTE2(a4) & 1;
  v20 = *(_BYTE *)(v13 + 25);
  result = maxOSLogArgumentCount.getter();
  if (v20 < result)
  {
    LOBYTE(v36) = v15 & 1;
    BYTE1(v36) = v16 & 1;
    BYTE2(v36) = v17 & 1;
    v22 = a5;
    v23 = (os::OSLogPrivacy)a8;
    OSLogIntegerFormatting.formatSpecifier<A>(for:align:privacy:attributes:)(a11, (uint64_t)a7, v23, a9, a10, a3, v36, a5);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    v24 = *a7;
    v25 = a7[1];
    outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(*a7);
    if (v24)
    {
      OSLogInterpolation.appendAlignmentArgument(_:)(v24, v25);
      swift_release();
    }
    if (*(_BYTE *)(a8 + 1) != 1)
    {
      v26 = (os::OSLogPrivacy)a8;
      OSLogInterpolation.appendMaskArgument(_:)(v26);
    }
    outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v22);
    if (v22)
    {
      OSLogInterpolation.appendPrecisionArgument(_:)(v22, a6);
      swift_release();
    }
    v27 = dispatch thunk of static FixedWidthInteger.bitWidth.getter() >> 3;
    v28 = (os::OSLogPrivacy)a8;
    OSLogInterpolation.addIntHeaders(_:_:)(v28, v27);
    result = OSLogArguments.append<A>(_:)(a1, a2, a11, a12);
    v30 = *(unsigned __int8 *)(v13 + 25);
    v29 = (_BYTE *)(v13 + 25);
    v31 = v30 + 1;
    if ((((v30 + 1) >> 8) & 1) != 0)
      __break(1u);
    else
      *v29 = v31;
  }
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int32)@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(void), uint64_t a11, uint64_t a12)
{
  char v14;
  char v15;
  char v16;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v27;

  v14 = a4 & 1;
  v15 = BYTE1(a4) & 1;
  v16 = BYTE2(a4) & 1;
  swift_retain();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = a1;
  *(_QWORD *)(v19 + 24) = a2;
  v20 = a10();
  v21 = default argument 4 of OSLogInterpolation.appendInteger<A>(_:format:align:privacy:attributes:)();
  LOBYTE(v27) = v14;
  BYTE1(v27) = v15;
  BYTE2(v27) = v16;
  OSLogInterpolation.appendInteger<A>(_:format:align:privacy:attributes:)(a12, v19, a3, v27, a5, a6, a7, a8, v21, v22, a11, v20);
  swift_bridgeObjectRelease();
  return swift_release();
}

void OSLogInterpolation.appendAlignmentArgument(_:)(uint64_t a1, uint64_t a2)
{
  OSLogInterpolation.appendPrecisionArgument(_:)(a1, a2, 0, (uint64_t)&unk_1E2DFB928, (uint64_t)partial apply for closure #1 in OSLogInterpolation.appendPrecisionAlignCount(_:_:));
}

void OSLogInterpolation.appendPrecisionArgument(_:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _BYTE *v10;
  Swift::UInt8 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  unsigned int v18;
  char v19;
  _BYTE v20[2];
  _BYTE __dst[56];

  memcpy(__dst, (const void *)v5, sizeof(__dst));
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  static OSLogPrivacy.auto.getter(v20);
  v19 = a3;
  v10 = v20;
  v11 = OSLogInterpolation.getArgumentHeader(privacy:type:)((os::OSLogPrivacy)v10, (os::OSLogInterpolation::ArgumentType)&v19);
  outlined release of OSLogInterpolation((uint64_t)__dst);
  OSLogArguments.append(_:)(v11);
  OSLogArguments.append(_:)(4u);
  v12 = *(_QWORD *)(v5 + 32);
  v13 = __OFADD__(v12, 6);
  v14 = v12 + 6;
  v15 = v13;
  if ((v15 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v5 + 32) = v14;
    swift_retain();
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = a1;
    *(_QWORD *)(v16 + 24) = a2;
    v17 = lazy protocol witness table accessor for type Int32 and conformance Int32();
    OSLogArguments.append<A>(_:)(a5, v16, MEMORY[0x1E0DEDBC8], v17);
    swift_release();
    v18 = *(unsigned __int8 *)(v5 + 25) + 1;
    if (((v18 >> 8) & 1) == 0)
    {
      *(_BYTE *)(v5 + 25) = v18;
      return;
    }
  }
  __break(1u);
}

Swift::Void __swiftcall OSLogInterpolation.addIntHeaders(_:_:)(os::OSLogPrivacy a1, Swift::Int a2)
{
  _QWORD *v2;
  _QWORD *v3;
  os::OSLogPrivacy v6;
  Swift::UInt8 v7;
  Swift::Int v8;
  uint64_t v10;
  BOOL v11;
  Swift::Int v12;
  char v13;
  os::OSLogPrivacy v14;
  Swift::UInt8 v15;
  Swift::UInt8 v16;
  char v17;
  _BYTE v18[56];
  _BYTE __dst[56];

  v3 = v2;
  memcpy(__dst, v2, sizeof(__dst));
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  v17 = 0;
  v6 = a1;
  v7 = OSLogInterpolation.getArgumentHeader(privacy:type:)(v6, (os::OSLogInterpolation::ArgumentType)&v17);
  outlined release of OSLogInterpolation((uint64_t)__dst);
  OSLogArguments.append(_:)(v7);
  lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  OSLogArguments.append(_:)(v16);
  v8 = a2 + 2;
  if (__OFADD__(a2, 2))
  {
    __break(1u);
  }
  else
  {
    v10 = v2[4];
    v11 = __OFADD__(v10, v8);
    v12 = v10 + v8;
    v13 = v11;
    if ((v13 & 1) == 0)
    {
      v2[4] = v12;
      memcpy(v18, v2, sizeof(v18));
      outlined retain of OSLogInterpolation((uint64_t)v18);
      v14 = a1;
      v15 = OSLogInterpolation.getUpdatedPreamble(privacy:isScalar:)(v14, 1);
      outlined release of OSLogInterpolation((uint64_t)v18);
      *((_BYTE *)v3 + 24) = v15;
      return;
    }
  }
  __break(1u);
}

uint64_t OSLogArguments.append<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;

  swift_retain();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a3;
  v8[3] = a4;
  v8[4] = a1;
  v8[5] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  return Array.append(_:)();
}

void OSLogInterpolation.appendPrecisionAlignCount(_:_:)(uint64_t a1, uint64_t a2, Swift::UInt8 a3)
{
  uint64_t v3;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unsigned int v11;

  OSLogArguments.append(_:)(a3);
  OSLogArguments.append(_:)(4u);
  v6 = *(_QWORD *)(v3 + 32);
  v7 = __OFADD__(v6, 6);
  v8 = v6 + 6;
  if (v7)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 32) = v8;
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = a1;
    *(_QWORD *)(v9 + 24) = a2;
    v10 = lazy protocol witness table accessor for type Int32 and conformance Int32();
    swift_retain();
    OSLogArguments.append<A>(_:)((uint64_t)partial apply for closure #1 in OSLogInterpolation.appendPrecisionAlignCount(_:_:), v9, MEMORY[0x1E0DEDBC8], v10);
    swift_release();
    v11 = *(unsigned __int8 *)(v3 + 25) + 1;
    if (((v11 >> 8) & 1) == 0)
    {
      *(_BYTE *)(v3 + 25) = v11;
      return;
    }
  }
  __break(1u);
}

uint64_t sub_191DA8158()
{
  return swift_deallocObject();
}

void partial apply for closure #1 in OSLogInterpolation.appendMaskArgument(_:)(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 16);
}

unint64_t lazy protocol witness table accessor for type UInt64 and conformance UInt64()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UInt64 and conformance UInt64;
  if (!lazy protocol witness table cache variable for type UInt64 and conformance UInt64)
  {
    result = MEMORY[0x19401FDEC](MEMORY[0x1E0DEE1D0], MEMORY[0x1E0DEE190]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt64 and conformance UInt64);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Int32 and conformance Int32()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    result = MEMORY[0x19401FDEC](MEMORY[0x1E0DEDC10], MEMORY[0x1E0DEDBC8]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
  }
  return result;
}

uint64_t _sSiIegd_SiIegr_TRTA_0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int8)@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type Int8 and conformance Int8()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int8 and conformance Int8;
  if (!lazy protocol witness table cache variable for type Int8 and conformance Int8)
  {
    result = MEMORY[0x19401FDEC](MEMORY[0x1E0DEDAA8], MEMORY[0x1E0DEDA70]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int8 and conformance Int8);
  }
  return result;
}

uint64_t sub_191DA82D8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int16)@<X0>(_WORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type Int16 and conformance Int16()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int16 and conformance Int16;
  if (!lazy protocol witness table cache variable for type Int16 and conformance Int16)
  {
    result = MEMORY[0x19401FDEC](MEMORY[0x1E0DEDB90], MEMORY[0x1E0DEDB58]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int16 and conformance Int16);
  }
  return result;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int32)@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type Int64 and conformance Int64()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int64 and conformance Int64;
  if (!lazy protocol witness table cache variable for type Int64 and conformance Int64)
  {
    result = MEMORY[0x19401FDEC](MEMORY[0x1E0DEDCB0], MEMORY[0x1E0DEDC60]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int64 and conformance Int64);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt and conformance UInt()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UInt and conformance UInt;
  if (!lazy protocol witness table cache variable for type UInt and conformance UInt)
  {
    result = MEMORY[0x19401FDEC](MEMORY[0x1E0DEBBE0], MEMORY[0x1E0DEBB98]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt and conformance UInt);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt16 and conformance UInt16()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UInt16 and conformance UInt16;
  if (!lazy protocol witness table cache variable for type UInt16 and conformance UInt16)
  {
    result = MEMORY[0x19401FDEC](MEMORY[0x1E0DEE0B0], MEMORY[0x1E0DEE068]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt16 and conformance UInt16);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt32 and conformance UInt32()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    result = MEMORY[0x19401FDEC](MEMORY[0x1E0DEE148], MEMORY[0x1E0DEE0F8]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    result = MEMORY[0x19401FDEC](MEMORY[0x1E0DEE120], MEMORY[0x1E0DEE0F8]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
  }
  return result;
}

uint64_t closure #1 in OSLogArguments.append<A>(_:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(uint64_t);
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  char v18[8];
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;

  v8 = *(_QWORD *)(a6 - 8);
  v9 = MEMORY[0x1E0C80A78](a1);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12(v9);
  v13 = dispatch thunk of static FixedWidthInteger.bitWidth.getter();
  if ((v13 & 0x8000000000000000) != 0)
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v14 = *a1 + (v13 >> 3);
    MEMORY[0x1E0C80A78](v13);
    v19 = v15;
    v20 = v14;
    _ss27_withUnprotectedUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF((uint64_t)v11, (uint64_t)partial apply for closure #1 in serialize<A>(_:at:), (uint64_t)v18, a6, MEMORY[0x1E0DEDCE8], MEMORY[0x1E0DEE9C0] + 8, MEMORY[0x1E0DEDD18], v16);
    *a1 = v14;
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, a6);
  }
  return result;
}

uint64_t sub_191DA85F8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in OSLogArguments.append<A>(_:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v3[4], v3[5], v3[2]);
}

uint64_t partial apply for closure #1 in OSLogInterpolation.appendPrecisionAlignCount(_:_:)@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (result <= 0x7FFFFFFF)
  {
    *a1 = result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t partial apply for closure #1 in serialize<A>(_:at:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t closure #1 in os_log(_:dso:log:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, void (*a8)(uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t))
{
  uint64_t result;

  if (a1)
  {
    swift_bridgeObjectRetain();
    a8(a3, a4, a5, a6, a7, a1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

id one-time initialization function for disabled()
{
  id result;

  result = (id)_swift_os_log_disabled();
  static OS_os_log.disabled = (uint64_t)result;
  return result;
}

id static OS_os_log.disabled.getter()
{
  if (one-time initialization token for disabled != -1)
    swift_once();
  return (id)static OS_os_log.disabled;
}

uint64_t partial apply for closure #1 in os_log(_:dso:log:_:_:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in os_log(_:dso:log:_:_:)(a1, a2, (void (*)(uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t))specialized withVaList<A>(_:_:));
}

void OS_LOG_TYPE_DEFAULT.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void OS_LOG_TYPE_INFO.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void OS_LOG_TYPE_DEBUG.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void OS_LOG_TYPE_ERROR.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void OS_LOG_TYPE_FAULT.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t partial apply for closure #1 in os_log(_:dso:log:type:_:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in os_log(_:dso:log:_:_:)(a1, a2, (void (*)(uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t))specialized withVaList<A>(_:_:));
}

uint64_t partial apply for closure #1 in os_log(_:dso:log:_:_:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t))
{
  uint64_t v3;

  return closure #1 in os_log(_:dso:log:_:_:)(a1, a2, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), *(void **)(v3 + 40), *(unsigned __int8 *)(v3 + 48), a3);
}

uint64_t _swift_os_log_disabled()
{
  uint64_t v0;
  id v1;

  v0 = MEMORY[0x1E0C81030];
  v1 = MEMORY[0x1E0C81030];
  return v0;
}

uint64_t OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v10;

  swift_retain();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  OSLogInterpolation.appendInterpolation(_:format:align:privacy:)((uint64_t)partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:), v10, a3, a4, a5);
  return swift_release();
}

{
  uint64_t v10;
  Swift::String v11;

  swift_retain();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  v11 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  OSLogInterpolation.appendInterpolation(_:format:align:privacy:attributes:)((uint64_t)partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:), v10, a3, a4, a5, v11._countAndFlagsBits, v11._object);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_191DA8A90()
{
  swift_release();
  return swift_deallocObject();
}

double partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)()
{
  uint64_t v0;

  return (*(float (**)(void))(v0 + 16))();
}

uint64_t OSLogInterpolation.appendInterpolation(_:format:align:privacy:attributes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v16;
  uint64_t result;
  os::OSLogPrivacy v18;
  uint64_t v19;
  uint64_t v20;
  os::OSLogPrivacy v21;
  uint64_t v22;
  uint64_t v23;
  os::OSLogPrivacy v24;
  _BYTE *v25;
  int v26;
  char v27;

  v8 = v7;
  v16 = *(_BYTE *)(v8 + 25);
  result = maxOSLogArgumentCount.getter();
  if (v16 < result)
  {
    lazy protocol witness table accessor for type Double and conformance Double();
    v18 = (os::OSLogPrivacy)a5;
    OSLogFloatFormatting.formatSpecifier<A>(for:align:privacy:attributes:)(MEMORY[0x1E0DEB070], (uint64_t)a4, v18, a6, a7);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    v19 = *a4;
    v20 = a4[1];
    outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v19);
    if (v19)
    {
      OSLogInterpolation.appendAlignmentArgument(_:)(v19, v20);
      swift_release();
    }
    if (*(_BYTE *)(a5 + 1) != 1)
    {
      v21 = (os::OSLogPrivacy)a5;
      OSLogInterpolation.appendMaskArgument(_:)(v21);
    }
    v22 = *(_QWORD *)(a3 + 8);
    v23 = *(_QWORD *)(a3 + 16);
    outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v22);
    if (v22)
    {
      OSLogInterpolation.appendPrecisionArgument(_:)(v22, v23);
      swift_release();
    }
    v24 = (os::OSLogPrivacy)a5;
    OSLogInterpolation.addDoubleHeaders(_:)(v24);
    result = OSLogArguments.append(_:)(a1, a2);
    v26 = *(unsigned __int8 *)(v8 + 25);
    v25 = (_BYTE *)(v8 + 25);
    v27 = v26 + 1;
    if ((((v26 + 1) >> 8) & 1) != 0)
      __break(1u);
    else
      *v25 = v27;
  }
  return result;
}

Swift::Void __swiftcall OSLogInterpolation.addDoubleHeaders(_:)(os::OSLogPrivacy a1)
{
  _QWORD *v1;
  _QWORD *v2;
  os::OSLogPrivacy v4;
  Swift::UInt8 v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  char v9;
  os::OSLogPrivacy v10;
  Swift::UInt8 v11;
  Swift::UInt8 v12;
  char v13;
  _BYTE v14[56];
  _BYTE __dst[56];

  v2 = v1;
  memcpy(__dst, v1, sizeof(__dst));
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  v13 = 0;
  v4 = a1;
  v5 = OSLogInterpolation.getArgumentHeader(privacy:type:)(v4, (os::OSLogInterpolation::ArgumentType)&v13);
  outlined release of OSLogInterpolation((uint64_t)__dst);
  OSLogArguments.append(_:)(v5);
  lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  OSLogArguments.append(_:)(v12);
  v6 = v1[4];
  v7 = __OFADD__(v6, 10);
  v8 = v6 + 10;
  v9 = v7;
  if ((v9 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v1[4] = v8;
    memcpy(v14, v1, sizeof(v14));
    outlined retain of OSLogInterpolation((uint64_t)v14);
    v10 = a1;
    v11 = OSLogInterpolation.getUpdatedPreamble(privacy:isScalar:)(v10, 1);
    outlined release of OSLogInterpolation((uint64_t)v14);
    *((_BYTE *)v2 + 24) = v11;
  }
}

unint64_t lazy protocol witness table accessor for type Double and conformance Double()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Double and conformance Double;
  if (!lazy protocol witness table cache variable for type Double and conformance Double)
  {
    result = MEMORY[0x19401FDEC](MEMORY[0x1E0DEB088], MEMORY[0x1E0DEB070]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Double and conformance Double);
  }
  return result;
}

uint64_t OSLogIntegerFormatting.formatSpecifier<A>(for:align:privacy:attributes:)(uint64_t a1, uint64_t a2, os::OSLogPrivacy a3, uint64_t a4, void *a5, uint64_t a6, int a7, uint64_t a8)
{
  char v12;
  char v13;
  char v15;
  BOOL v16;
  os::OSLogPrivacy v17;
  Swift::String v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  char v22;
  uint64_t countAndFlagsBits;
  __int16 v25;
  uint64_t v26;

  v22 = a7 & 1;
  v12 = BYTE1(a7) & 1;
  v13 = BYTE2(a7) & 1;
  v15 = dispatch thunk of static BinaryInteger.isSigned.getter();
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a8);
  v16 = (v15 & 1) != 0 && a6 != 10;
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(a8);
  if (v16)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Signed integers must be formatted using .decimal", 0x30uLL, 1);
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  LOBYTE(v25) = v22 & 1;
  HIBYTE(v25) = v12 & 1;
  v26 = OSLogIntegerFormatting._prefix.getter(a6, v25);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("%", 1uLL, 1);
  static String.+= infix(_:_:)();
  swift_bridgeObjectRelease();
  v17 = a3;
  v18._countAndFlagsBits = a4;
  v18._object = a5;
  if ((unint64_t)concatPrivacyAndAttributes(privacy:attributes:)(v17, v18).value._object)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("{", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    static String.+= infix(_:_:)();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("}", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if ((v22 & 1) != 0)
  {
    if ((dispatch thunk of static BinaryInteger.isSigned.getter() & 1) != 0)
    {
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("+", 1uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
    }
    else
    {
      countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("+", 1uLL, 1)._countAndFlagsBits;
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      v26 = countAndFlagsBits;
    }
  }
  if ((*(_BYTE *)(a2 + 16) & 1) == 0)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("-", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  v19 = *(_QWORD *)a2;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(*(_QWORD *)a2);
  if (v19)
  {
    swift_release();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("*", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a8);
  if (a8)
  {
    swift_release();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(".*", 2uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  static OSLogIntegerFormatting.formatSpecifierLengthModifier<A>(_:)();
  if (v20)
  {
    static String.+= infix(_:_:)();
    switch(a6)
    {
      case 10:
        if ((dispatch thunk of static BinaryInteger.isSigned.getter() & 1) != 0)
          String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("d", 1uLL, 1);
        else
          String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("u", 1uLL, 1);
        break;
      case 8:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("o", 1uLL, 1);
        static String.+= infix(_:_:)();
        swift_bridgeObjectRelease();
        goto LABEL_31;
      case 16:
        if ((v13 & 1) != 0)
          String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("X", 1uLL, 1);
        else
          String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("x", 1uLL, 1);
        break;
      default:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("radix must be 10, 8 or 16", 0x19uLL, 1);
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
        goto LABEL_31;
    }
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
LABEL_31:
    swift_bridgeObjectRelease();
    return v26;
  }
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Integer type has unknown byte length", 0x24uLL, 1);
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t OSLogIntegerFormatting.radix.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*OSLogIntegerFormatting.radix.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogIntegerFormatting.explicitPositiveSign.getter(uint64_t a1, char a2)
{
  return a2 & 1;
}

uint64_t OSLogIntegerFormatting.explicitPositiveSign.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 8) = result;
  return result;
}

uint64_t (*OSLogIntegerFormatting.explicitPositiveSign.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogIntegerFormatting.includePrefix.getter(uint64_t a1, unsigned int a2)
{
  return (a2 >> 8) & 1;
}

uint64_t OSLogIntegerFormatting.includePrefix.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 9) = result;
  return result;
}

uint64_t (*OSLogIntegerFormatting.includePrefix.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogIntegerFormatting.uppercase.getter(uint64_t a1, unsigned int a2)
{
  return HIWORD(a2) & 1;
}

uint64_t OSLogIntegerFormatting.uppercase.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 10) = result;
  return result;
}

uint64_t (*OSLogIntegerFormatting.uppercase.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t key path getter for OSLogIntegerFormatting.minDigits : OSLogIntegerFormatting@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t *a1@<X8>)@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)@<X0>(uint64_t *@<X8>);

  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  if (v3)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int);
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v5;
  return outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v3);
}

uint64_t key path setter for OSLogIntegerFormatting.minDigits : OSLogIntegerFormatting(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t result;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = partial apply for thunk for @escaping @callee_guaranteed () -> (@out Int);
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *(_QWORD *)(a2 + 16);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v3);
  result = outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(v7);
  *(_QWORD *)(a2 + 16) = v6;
  *(_QWORD *)(a2 + 24) = v5;
  return result;
}

uint64_t OSLogIntegerFormatting.minDigits.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a3);
  return a3;
}

uint64_t OSLogIntegerFormatting.minDigits.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(*(_QWORD *)(v2 + 16));
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*OSLogIntegerFormatting.minDigits.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t static OSLogIntegerFormatting.decimal(explicitPositiveSign:minDigits:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7;
  char v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;

  swift_retain();
  v7 = 10;
  v8 = a1 & 1;
  v9 = 0;
  v10 = 0;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a2);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a2);
  v11 = a2;
  v12 = a3;
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a2);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a2);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(a2);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(a2);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(a2);
  outlined destroy of OSLogIntegerFormatting((uint64_t)&v7);
  return 10;
}

uint64_t static OSLogIntegerFormatting.hex(explicitPositiveSign:includePrefix:uppercase:minDigits:)(char a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  return static OSLogIntegerFormatting.hex(explicitPositiveSign:includePrefix:uppercase:minDigits:)(a1 & 1, a2 & 1, a3 & 1, a4, a5, 16);
}

uint64_t static OSLogIntegerFormatting.hex(explicitPositiveSign:includePrefix:uppercase:)(char a1, char a2, char a3)
{
  return static OSLogIntegerFormatting.hex(explicitPositiveSign:includePrefix:uppercase:)(a1 & 1, a2 & 1, a3 & 1, 16);
}

uint64_t static OSLogIntegerFormatting.hex.getter()
{
  return static OSLogIntegerFormatting.hex.getter(default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), (uint64_t (*)(_QWORD, _QWORD, _QWORD))static OSLogIntegerFormatting.hex(explicitPositiveSign:includePrefix:uppercase:));
}

uint64_t static OSLogIntegerFormatting.octal(explicitPositiveSign:includePrefix:uppercase:minDigits:)(char a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  return static OSLogIntegerFormatting.hex(explicitPositiveSign:includePrefix:uppercase:minDigits:)(a1 & 1, a2 & 1, a3 & 1, a4, a5, 8);
}

uint64_t static OSLogIntegerFormatting.hex(explicitPositiveSign:includePrefix:uppercase:minDigits:)(char a1, char a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13;
  char v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;

  swift_retain();
  v13 = a6;
  v14 = a1 & 1;
  v15 = a2 & 1;
  v16 = a3 & 1;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a4);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a4);
  v17 = a4;
  v18 = a5;
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a4);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a4);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(a4);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(a4);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(a4);
  outlined destroy of OSLogIntegerFormatting((uint64_t)&v13);
  return a6;
}

uint64_t static OSLogIntegerFormatting.octal(explicitPositiveSign:includePrefix:uppercase:)(char a1, char a2, char a3)
{
  return static OSLogIntegerFormatting.hex(explicitPositiveSign:includePrefix:uppercase:)(a1 & 1, a2 & 1, a3 & 1, 8);
}

uint64_t static OSLogIntegerFormatting.hex(explicitPositiveSign:includePrefix:uppercase:)(char a1, char a2, char a3, uint64_t a4)
{
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a4;
  v7 = a1 & 1;
  v8 = a2 & 1;
  v9 = a3 & 1;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  v10 = 0;
  v11 = 0;
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  outlined destroy of OSLogIntegerFormatting((uint64_t)&v6);
  return a4;
}

uint64_t static OSLogIntegerFormatting.octal.getter()
{
  return static OSLogIntegerFormatting.hex.getter(default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), default argument 0 of static OSLogFloatFormatting.fixed(explicitPositiveSign:uppercase:), (uint64_t (*)(_QWORD, _QWORD, _QWORD))static OSLogIntegerFormatting.octal(explicitPositiveSign:includePrefix:uppercase:));
}

uint64_t static OSLogIntegerFormatting.hex.getter(uint64_t (*a1)(void), uint64_t (*a2)(void), uint64_t (*a3)(void), uint64_t (*a4)(_QWORD, _QWORD, _QWORD))
{
  char v7;
  char v8;

  v7 = a1();
  LOBYTE(a2) = a2();
  v8 = a3();
  return a4(v7 & 1, a2 & 1, v8 & 1);
}

uint64_t OSLogIntegerFormatting._prefix.getter(uint64_t a1, __int16 a2)
{
  if ((a2 & 0x100) == 0)
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
  switch(a1)
  {
    case 2:
      return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("0b", 2uLL, 1)._countAndFlagsBits;
    case 8:
      return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("0o", 2uLL, 1)._countAndFlagsBits;
    case 16:
      return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("0x", 2uLL, 1)._countAndFlagsBits;
    default:
      return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
  }
}

uint64_t static OSLogIntegerFormatting.formatSpecifierLengthModifier<A>(_:)()
{
  if (swift_dynamicCastMetatype() || swift_dynamicCastMetatype())
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("hh", 2uLL, 1)._countAndFlagsBits;
  if (swift_dynamicCastMetatype() || swift_dynamicCastMetatype())
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("h", 1uLL, 1)._countAndFlagsBits;
  if (swift_dynamicCastMetatype() || swift_dynamicCastMetatype())
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
  if (swift_dynamicCastMetatype() || swift_dynamicCastMetatype())
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("l", 1uLL, 1)._countAndFlagsBits;
  if (swift_dynamicCastMetatype() || swift_dynamicCastMetatype())
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ll", 2uLL, 1)._countAndFlagsBits;
  return 0;
}

uint64_t destroy for OSLogIntegerFormatting(uint64_t result)
{
  if (*(_QWORD *)(result + 16))
    return swift_release();
  return result;
}

uint64_t initializeWithCopy for OSLogIntegerFormatting(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_WORD *)(a1 + 9) = *(_WORD *)(a2 + 9);
  v3 = *(_QWORD *)(a2 + 16);
  if (v3)
  {
    v4 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v3;
    *(_QWORD *)(a1 + 24) = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  }
  return a1;
}

uint64_t assignWithCopy for OSLogIntegerFormatting(uint64_t a1, uint64_t a2)
{
  _OWORD *v3;
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  *(_BYTE *)(a1 + 10) = *(_BYTE *)(a2 + 10);
  v3 = (_OWORD *)(a1 + 16);
  v5 = (_OWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 16);
  if (!*(_QWORD *)(a1 + 16))
  {
    if (v4)
    {
      v7 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = v4;
      *(_QWORD *)(a1 + 24) = v7;
      swift_retain();
      return a1;
    }
LABEL_7:
    *v3 = *v5;
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v6;
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for OSLogIntegerFormatting(uint64_t a1, uint64_t a2)
{
  _OWORD *v3;
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  *(_BYTE *)(a1 + 10) = *(_BYTE *)(a2 + 10);
  v3 = (_OWORD *)(a1 + 16);
  v5 = (_OWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 16);
  if (!*(_QWORD *)(a1 + 16))
  {
    if (v4)
    {
      v7 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = v4;
      *(_QWORD *)(a1 + 24) = v7;
      return a1;
    }
LABEL_7:
    *v3 = *v5;
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v6;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for OSLogIntegerFormatting(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OSLogIntegerFormatting(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for OSLogIntegerFormatting()
{
  return &type metadata for OSLogIntegerFormatting;
}

uint64_t sub_191DAA178()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t static OSLogPrivacy.auto.getter@<X0>(_BYTE *a1@<X8>)
{
  return static OSLogPrivacy.auto.getter(3, a1);
}

BOOL OSLogPrivacy.hasMask.getter()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + 1) != 1;
}

uint64_t OSLogPrivacy.maskValue.getter()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + 1) - 2) > 7u)
    return 1752392040;
  else
    return *(_QWORD *)&aMailnamemailad[8 * (char)(*(_BYTE *)(v0 + 1) - 2)];
}

BOOL static OSLogPrivacy.PrivacyOption.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void OSLogPrivacy.PrivacyOption.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

void OSLogPrivacy.privacy.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *OSLogPrivacy.privacy.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*OSLogPrivacy.privacy.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

void OSLogPrivacy.mask.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 1);
}

_BYTE *OSLogPrivacy.mask.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = *result;
  return result;
}

uint64_t (*OSLogPrivacy.mask.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

os::OSLogPrivacy __swiftcall OSLogPrivacy.init(privacy:mask:)(os::OSLogPrivacy::PrivacyOption privacy, os::OSLogPrivacy::Mask mask)
{
  _BYTE *v2;
  os::OSLogPrivacy result;

  *v2 = *(_BYTE *)privacy;
  v2[1] = *(_BYTE *)mask;
  result.privacy = privacy;
  return result;
}

uint64_t static OSLogPrivacy.public.getter@<X0>(_BYTE *a1@<X8>)
{
  return static OSLogPrivacy.auto.getter(1, a1);
}

uint64_t static OSLogPrivacy.private.getter@<X0>(_BYTE *a1@<X8>)
{
  return static OSLogPrivacy.auto.getter(0, a1);
}

char *static OSLogPrivacy.private(mask:)@<X0>(char *a1@<X0>, _BYTE *a2@<X8>)
{
  return static OSLogPrivacy.private(mask:)(a1, 0, a2);
}

uint64_t static OSLogPrivacy.sensitive.getter@<X0>(_BYTE *a1@<X8>)
{
  return static OSLogPrivacy.auto.getter(2, a1);
}

uint64_t static OSLogPrivacy.auto.getter@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = result;
  a2[1] = 1;
  return result;
}

_BYTE *static OSLogPrivacy.mail(_:)@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  char v2;

  switch(*result)
  {
    case 0:
      v2 = 2;
      break;
    case 1:
      v2 = 3;
      break;
    case 2:
      v2 = 4;
      break;
    case 3:
      v2 = 5;
      break;
    case 4:
      v2 = 6;
      break;
    case 5:
      v2 = 7;
      break;
    case 6:
      v2 = 8;
      break;
    case 7:
      v2 = 9;
      break;
    default:
      v2 = 1;
      break;
  }
  *a2 = 2;
  a2[1] = v2;
  return result;
}

char *static OSLogPrivacy.sensitive(mask:)@<X0>(char *a1@<X0>, _BYTE *a2@<X8>)
{
  return static OSLogPrivacy.private(mask:)(a1, 2, a2);
}

char *static OSLogPrivacy.auto(mask:)@<X0>(char *a1@<X0>, _BYTE *a2@<X8>)
{
  return static OSLogPrivacy.private(mask:)(a1, 3, a2);
}

char *static OSLogPrivacy.private(mask:)@<X0>(char *result@<X0>, char a2@<W1>, _BYTE *a3@<X8>)
{
  char v3;

  v3 = *result;
  *a3 = a2;
  a3[1] = v3;
  return result;
}

uint64_t OSLogPrivacy.argumentFlag.getter()
{
  _BYTE *v0;

  switch(*v0)
  {
    case 0:
      return 1;
    case 1:
      return 2;
    case 2:
      return 5;
  }
  return 0;
}

BOOL OSLogPrivacy.isAtleastPrivate.getter()
{
  _BYTE *v0;

  return *v0 != 1 && *v0 != 3;
}

BOOL OSLogPrivacy.needsPrivacySpecifier.getter()
{
  _BYTE *v0;

  return !v0[1] || *v0 != 3;
}

uint64_t OSLogPrivacy.privacySpecifier.getter()
{
  _BYTE *v0;
  BOOL v1;
  uint64_t v3;
  uint64_t countAndFlagsBits;
  BOOL v5;

  v1 = v0[1] != 1;
  v5 = *v0 == 3;
  if (*v0 == 3 && v0[1] == 1)
    return 0;
  if (*v0)
  {
    if (*v0 == 1)
    {
      countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("public", 6uLL, 1)._countAndFlagsBits;
    }
    else
    {
      if (*v0 == 2)
        v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sensitive", 9uLL, 1)._countAndFlagsBits;
      else
        v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
      countAndFlagsBits = v3;
    }
  }
  else
  {
    countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("private", 7uLL, 1)._countAndFlagsBits;
  }
  if (v1)
  {
    if (!v5)
    {
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(",", 1uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
    }
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mask.", 5uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    switch(v0[1])
    {
      case 2:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mailname", 8uLL, 1);
        break;
      case 3:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mailaddr", 8uLL, 1);
        break;
      case 4:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mailsubj", 8uLL, 1);
        break;
      case 5:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mailsumm", 8uLL, 1);
        break;
      case 6:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mailacco", 8uLL, 1);
        break;
      case 7:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mailbox", 7uLL, 1);
        break;
      case 8:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mailmbup", 8uLL, 1);
        break;
      case 9:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mailatta", 8uLL, 1);
        break;
      default:
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("hash", 4uLL, 1);
        break;
    }
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  return countAndFlagsBits;
}

uint64_t OSLogPrivacy.maskSpecifier.getter()
{
  uint64_t v0;
  uint64_t result;
  char *v2;
  Builtin::Word v3;

  result = 0x6A6275736C69616DLL;
  switch(*(_BYTE *)(v0 + 1))
  {
    case 2:
      return 0x656D616E6C69616DLL;
    case 3:
      return 0x726464616C69616DLL;
    case 4:
      return result;
    case 5:
      v2 = "mailsumm";
      goto LABEL_10;
    case 6:
      v2 = "mailacco";
      goto LABEL_10;
    case 7:
      v2 = "mailbox";
      v3 = 7;
      return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(v2, v3, 1)._countAndFlagsBits;
    case 8:
      v2 = "mailmbup";
      goto LABEL_10;
    case 9:
      v2 = "mailatta";
LABEL_10:
      v3 = 8;
      break;
    default:
      v2 = "hash";
      v3 = 4;
      break;
  }
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(v2, v3, 1)._countAndFlagsBits;
}

unint64_t lazy protocol witness table accessor for type OSLogPrivacy.PrivacyOption and conformance OSLogPrivacy.PrivacyOption()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSLogPrivacy.PrivacyOption and conformance OSLogPrivacy.PrivacyOption;
  if (!lazy protocol witness table cache variable for type OSLogPrivacy.PrivacyOption and conformance OSLogPrivacy.PrivacyOption)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSLogPrivacy.PrivacyOption, &type metadata for OSLogPrivacy.PrivacyOption);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogPrivacy.PrivacyOption and conformance OSLogPrivacy.PrivacyOption);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OSLogPrivacy.Mask and conformance OSLogPrivacy.Mask()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSLogPrivacy.Mask and conformance OSLogPrivacy.Mask;
  if (!lazy protocol witness table cache variable for type OSLogPrivacy.Mask and conformance OSLogPrivacy.Mask)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSLogPrivacy.Mask, &type metadata for OSLogPrivacy.Mask);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogPrivacy.Mask and conformance OSLogPrivacy.Mask);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OSLogPrivacy._MailMask and conformance OSLogPrivacy._MailMask()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSLogPrivacy._MailMask and conformance OSLogPrivacy._MailMask;
  if (!lazy protocol witness table cache variable for type OSLogPrivacy._MailMask and conformance OSLogPrivacy._MailMask)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSLogPrivacy._MailMask, &type metadata for OSLogPrivacy._MailMask);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogPrivacy._MailMask and conformance OSLogPrivacy._MailMask);
  }
  return result;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for OSLogPrivacy(unsigned __int16 *a1, unsigned int a2)
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
  if (a2 + 65283 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 65283 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 65283;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 65283;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 65283;
  }
LABEL_17:
  v6 = *(unsigned __int8 *)a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for OSLogPrivacy(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65283 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65283 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_191DAABB4 + 4 * byte_191DB4479[v4]))();
  *a1 = a2 - 253;
  return ((uint64_t (*)(void))((char *)sub_191DAABE8 + 4 * byte_191DB4474[v4]))();
}

uint64_t sub_191DAABE8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_191DAABF0(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x191DAABF8);
  return result;
}

uint64_t sub_191DAAC04(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x191DAAC0CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_191DAAC10(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_191DAAC18(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OSLogPrivacy()
{
  return &type metadata for OSLogPrivacy;
}

uint64_t storeEnumTagSinglePayload for OSLogPrivacy.PrivacyOption(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_191DAAC80 + 4 * byte_191DB4483[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_191DAACB4 + 4 * byte_191DB447E[v4]))();
}

uint64_t sub_191DAACB4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DAACBC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x191DAACC4);
  return result;
}

uint64_t sub_191DAACD0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x191DAACD8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_191DAACDC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DAACE4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OSLogPrivacy.PrivacyOption()
{
  return &type metadata for OSLogPrivacy.PrivacyOption;
}

uint64_t getEnumTagSinglePayload for OSLogPrivacy.Mask(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for OSLogPrivacy.Mask(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_191DAADDC + 4 * byte_191DB448D[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_191DAAE10 + 4 * byte_191DB4488[v4]))();
}

uint64_t sub_191DAAE10(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DAAE18(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x191DAAE20);
  return result;
}

uint64_t sub_191DAAE2C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x191DAAE34);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_191DAAE38(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DAAE40(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OSLogPrivacy.Mask()
{
  return &type metadata for OSLogPrivacy.Mask;
}

uint64_t getEnumTagSinglePayload for OSLogPrivacy._MailMask(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for OSLogPrivacy._MailMask(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_191DAAF38 + 4 * byte_191DB4497[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_191DAAF6C + 4 * byte_191DB4492[v4]))();
}

uint64_t sub_191DAAF6C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DAAF74(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x191DAAF7CLL);
  return result;
}

uint64_t sub_191DAAF88(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x191DAAF90);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_191DAAF94(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DAAF9C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OSLogPrivacy._MailMask()
{
  return &type metadata for OSLogPrivacy._MailMask;
}

Swift::UInt32 __swiftcall OS_os_workgroup.copyPort()()
{
  OS_os_workgroup *v0;
  Swift::UInt32 result;
  Swift::String v2;
  mach_port_t mach_port_out;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  mach_port_out = 0;
  if (!os_workgroup_copy_port(v0, &mach_port_out))
    return mach_port_out;
  _StringGuts.grow(_:)(48);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

OS_os_workgroup_optional __swiftcall OS_os_workgroup.init(port:name:)(Swift::UInt32 port, Swift::String_optional name)
{
  uint64_t v3;
  OS_os_workgroup *v4;
  Swift::Bool v5;
  objc_class *v6;
  OS_os_workgroup_optional result;

  if (name.value._object)
  {
    v3 = String.utf8CString.getter();
    swift_bridgeObjectRelease();
    v4 = os_workgroup_create_with_port((const char *)(v3 + 32), port);
    swift_release();
    if (v4)

  }
  else
  {
    v4 = os_workgroup_create_with_port(0, port);
  }
  v6 = (objc_class *)v4;
  result.value.super.super.isa = v6;
  result.is_nil = v5;
  return result;
}

OS_os_workgroup_optional __swiftcall OS_os_workgroup.copy(name:)(Swift::String_optional name)
{
  OS_os_workgroup *v1;
  uint64_t v2;
  uint64_t v3;
  os_workgroup_t v4;
  Swift::Bool v5;
  _QWORD v6[6];
  OS_os_workgroup_optional result;

  if (name.value._object)
  {
    MEMORY[0x1E0C80A78](name.value._countAndFlagsBits);
    v6[2] = v1;
    v4 = (os_workgroup_t)specialized String.withCString<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr, _QWORD *))partial apply for closure #1 in OS_os_workgroup.copy(name:), (uint64_t)v6, v2, v3);
  }
  else
  {
    v4 = os_workgroup_create_with_workgroup(0, v1);
  }
  result.value.super.super.isa = (Class)v4;
  result.is_nil = v5;
  return result;
}

os_workgroup_t partial apply for closure #1 in OS_os_workgroup.copy(name:)@<X0>(const char *a1@<X0>, os_workgroup_t *a2@<X8>)
{
  uint64_t v2;
  os_workgroup_t result;

  result = os_workgroup_create_with_workgroup(a1, *(os_workgroup_t *)(v2 + 16));
  *a2 = result;
  return result;
}

_QWORD *specialized String.withCString<A>(_:)(_QWORD *(*a1)(uint64_t *__return_ptr, _QWORD *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  _QWORD *result;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[3];

  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_os_workgroup?);
    result = (_QWORD *)_StringGuts._slowWithCString<A>(_:)();
    if (!v4)
      return (_QWORD *)v10[2];
  }
  else if ((a4 & 0x2000000000000000) != 0)
  {
    v10[0] = a3;
    v10[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    result = a1(&v9, v10);
    if (!v4)
      return (_QWORD *)v9;
  }
  else
  {
    if ((a3 & 0x1000000000000000) != 0)
    {
      v6 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
    }
    else
    {
      v6 = _StringObject.sharedUTF8.getter();
      if (v8 < 0)
      {
        result = (_QWORD *)_fatalErrorMessage(_:_:file:line:flags:)();
        __break(1u);
        return result;
      }
    }
    result = a1(v10, (_QWORD *)v6);
    if (!v4)
      return (_QWORD *)v10[0];
  }
  return result;
}

uint64_t OS_os_workgroup.join()@<X0>(os_workgroup_join_token_opaque_s *a1@<X8>)
{
  OS_os_workgroup *v1;
  uint64_t result;
  Swift::String v4;
  os_workgroup_join_token_opaque_s token_out;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  memset(&token_out, 0, sizeof(token_out));
  result = os_workgroup_join(v1, &token_out);
  if ((_DWORD)result)
  {
    _StringGuts.grow(_:)(38);
    swift_bridgeObjectRelease();
    v4._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v4);
    swift_bridgeObjectRelease();
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    *a1 = token_out;
  }
  return result;
}

void OS_os_workgroup.leave(token:)(os_workgroup_join_token_opaque_s *a1)
{
  OS_os_workgroup *v1;
  os_workgroup_join_token_opaque_s v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  os_workgroup_leave(v1, &v2);
}

Swift::Void __swiftcall OS_os_workgroup.cancel()()
{
  OS_os_workgroup *v0;

  os_workgroup_cancel(v0);
}

BOOL OS_os_workgroup.isCancelled.getter()
{
  OS_os_workgroup *v0;

  return os_workgroup_testcancel(v0);
}

uint64_t OS_os_workgroup.maxParallelThreads.getter()
{
  OS_os_workgroup *v0;

  return os_workgroup_max_parallel_threads(v0, 0);
}

uint64_t OS_os_workgroup.setWorkingArena(arena:max_workers:destruct:)(void *arena, uint32_t max_workers, os_workgroup_working_arena_destructor_t destructor)
{
  OS_os_workgroup *v3;
  uint64_t result;
  Swift::String v5;

  result = os_workgroup_set_working_arena(v3, arena, max_workers, destructor);
  if ((_DWORD)result)
  {
    _StringGuts.grow(_:)(45);
    swift_bridgeObjectRelease();
    v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v5);
    swift_bridgeObjectRelease();
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

void *OS_os_workgroup.workingArena.getter()
{
  OS_os_workgroup *v0;
  os_workgroup_index index_out;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  index_out = 0;
  return os_workgroup_get_working_arena(v0, &index_out);
}

Swift::Void __swiftcall OS_os_workgroup.start(at:deadline:)(Swift::UInt64 at, Swift::UInt64 deadline)
{
  OS_os_workgroup *v2;
  Swift::String v3;
  Swift::String v4;

  if (os_workgroup_interval_start(v2, at, deadline, 0))
  {
    _StringGuts.grow(_:)(54);
    v3._object = (void *)0x8000000191DB56A0;
    v3._countAndFlagsBits = 0xD000000000000034;
    String.append(_:)(v3);
    v4._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v4);
    swift_bridgeObjectRelease();
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

Swift::Void __swiftcall OS_os_workgroup.updateDeadline(deadline:)(Swift::UInt64 deadline)
{
  OS_os_workgroup *v1;
  Swift::String v2;
  Swift::String v3;

  if (os_workgroup_interval_update(v1, deadline, 0))
  {
    _StringGuts.grow(_:)(66);
    v2._object = (void *)0x8000000191DB56E0;
    v2._countAndFlagsBits = 0xD000000000000040;
    String.append(_:)(v2);
    v3._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v3);
    swift_bridgeObjectRelease();
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

Swift::Void __swiftcall OS_os_workgroup.finish()()
{
  OS_os_workgroup *v0;
  Swift::String v1;
  Swift::String v2;

  if (os_workgroup_interval_finish(v0, 0))
  {
    _StringGuts.grow(_:)(55);
    v1._object = (void *)0x8000000191DB5730;
    v1._countAndFlagsBits = 0xD000000000000035;
    String.append(_:)(v1);
    v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v2);
    swift_bridgeObjectRelease();
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

OS_os_workgroup_parallel_optional __swiftcall OS_os_workgroup_parallel.init(name:)(Swift::String_optional name)
{
  uint64_t v1;
  OS_os_workgroup *v2;
  Swift::Bool v3;
  objc_class *v4;
  OS_os_workgroup_parallel_optional result;

  if (name.value._object)
  {
    v1 = String.utf8CString.getter();
    swift_bridgeObjectRelease();
    v2 = os_workgroup_parallel_create((const char *)(v1 + 32), 0);
    swift_release();
    if (v2)

  }
  else
  {
    v2 = os_workgroup_parallel_create(0, 0);
  }
  v4 = (objc_class *)v2;
  result.value.super.super.super.isa = v4;
  result.is_nil = v3;
  return result;
}

ValueMetadata *type metadata accessor for OS_os_workgroup.JoinToken()
{
  return &type metadata for OS_os_workgroup.JoinToken;
}

uint64_t OSLogInterpolation.appendInteger<A>(_:format:align:privacy:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, __int128 *a7, __int16 *a8, uint64_t a9, uint64_t a10)
{
  char v10;
  __int16 v11;
  __int16 v13;
  __int128 v14;
  char v15;

  v10 = *((_BYTE *)a7 + 16);
  v11 = *a8;
  v14 = *a7;
  v15 = v10;
  v13 = v11;
  return OSLogInterpolation.appendInteger<A>(_:format:align:privacy:attributes:)(a1, a2, a3, a4 & 0x10101, a5, a6, (uint64_t *)&v14, (uint64_t)&v13, 0, (void *)0xE000000000000000, a9, a10);
}

Swift::String __swiftcall OSLogInterpolation.getNSObjectFormatSpecifier(_:)(os::OSLogPrivacy a1)
{
  __int16 *v1;
  Swift::String v2;
  uint64_t countAndFlagsBits;
  void *object;
  Swift::String v5;
  Swift::String result;
  __int16 v7;

  v7 = **(_WORD **)&a1.privacy;
  v1 = &v7;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v5 = OSLogInterpolation.getNSObjectFormatSpecifier(_:_:)((os::OSLogPrivacy)v1, v2);
  object = v5._object;
  countAndFlagsBits = v5._countAndFlagsBits;
  result._object = object;
  result._countAndFlagsBits = countAndFlagsBits;
  return result;
}

Swift::String __swiftcall OSLogInterpolation.getPointerFormatSpecifier(_:_:)(os::OSLogPointerFormat a1, os::OSLogPrivacy a2)
{
  uint64_t v2;
  void *v3;
  Swift::String result;

  v2 = OSLogInterpolation.getPointerFormatSpecifier(_:_:)((char *)a1, *(__int16 **)&a2.privacy, (uint64_t (*)(char *, __int16 *, _QWORD, unint64_t))OSLogInterpolation.getPointerFormatSpecifier(_:_:_:));
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t OSLogInterpolation.getStringFormatSpecifier(_:_:)(__int128 *a1, __int16 *a2)
{
  char v2;
  __int16 v3;
  __int16 *v4;
  __int16 v6;
  __int128 v7;
  char v8;

  v2 = *((_BYTE *)a1 + 16);
  v3 = *a2;
  v7 = *a1;
  v8 = v2;
  v6 = v3;
  v4 = &v6;
  return OSLogInterpolation.getStringFormatSpecifier(_:_:_:)((uint64_t)&v7, (os::OSLogPrivacy)v4, 0, (void *)0xE000000000000000);
}

Swift::String __swiftcall OSLogInterpolation.getExtendedFormatSpecifier(_:_:)(os::OSLogInt32ExtendedFormat a1, os::OSLogPrivacy a2)
{
  uint64_t v2;
  void *v3;
  Swift::String result;

  v2 = OSLogInterpolation.getPointerFormatSpecifier(_:_:)((char *)a1, *(__int16 **)&a2.privacy, (uint64_t (*)(char *, __int16 *, _QWORD, unint64_t))OSLogInterpolation.getExtendedFormatSpecifier(_:_:_:));
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t OSLogInterpolation.getPointerFormatSpecifier(_:_:)(char *a1, __int16 *a2, uint64_t (*a3)(char *, __int16 *, _QWORD, unint64_t))
{
  __int16 v3;
  __int16 v5;
  char v6;

  v3 = *a2;
  v6 = *a1;
  v5 = v3;
  return a3(&v6, &v5, 0, 0xE000000000000000);
}

uint64_t OSLogIntegerFormatting.formatSpecifier<A>(for:align:privacy:)(uint64_t a1, __int128 *a2, __int16 *a3, uint64_t a4, int a5, uint64_t a6)
{
  char v6;
  __int16 v7;
  __int16 *v8;
  __int16 v10;
  __int128 v11;
  char v12;

  v6 = *((_BYTE *)a2 + 16);
  v7 = *a3;
  v11 = *a2;
  v12 = v6;
  v10 = v7;
  v8 = &v10;
  return OSLogIntegerFormatting.formatSpecifier<A>(for:align:privacy:attributes:)(a1, (uint64_t)&v11, (os::OSLogPrivacy)v8, 0, (void *)0xE000000000000000, a4, a5 & 0x10101, a6);
}

uint64_t OSLogFloatFormatting.formatSpecifier<A>(for:align:privacy:)(uint64_t a1, __int128 *a2, __int16 *a3)
{
  char *v3;
  char v4;
  __int16 v5;
  char v6;
  char v7;
  __int16 *v8;
  __int16 v10;
  __int128 v11;
  char v12;
  char v13;
  char v14;
  __int128 v15;
  char v16;

  v4 = *((_BYTE *)a2 + 16);
  v5 = *a3;
  v6 = v3[1];
  v7 = v3[24];
  v13 = *v3;
  v14 = v6;
  v15 = *(_OWORD *)(v3 + 8);
  v16 = v7;
  v11 = *a2;
  v12 = v4;
  v10 = v5;
  v8 = &v10;
  return OSLogFloatFormatting.formatSpecifier<A>(for:align:privacy:attributes:)(a1, (uint64_t)&v11, (os::OSLogPrivacy)v8, 0, (void *)0xE000000000000000);
}

uint64_t serialize(_:at:using:)(uint64_t a1, unint64_t a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v5;
  uint64_t result;

  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, a4);
  v5 = *a3 + 8;
  result = UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a3 = v5;
  return result;
}

id static OSSignposter.disabled.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v2;

  if (one-time initialization token for disabled != -1)
    swift_once();
  v2 = (void *)static OS_os_log.disabled;
  *a1 = static OS_os_log.disabled;
  return v2;
}

id OSSignposter.init()@<X0>(_QWORD *a1@<X8>)
{
  void *v2;

  if (one-time initialization token for default != -1)
    swift_once();
  v2 = (void *)static OS_os_log.default;
  *a1 = static OS_os_log.default;
  return v2;
}

void OSSignposter.emitEvent(_:id:_:)(unint64_t a1, uint64_t a2, char a3, uint64_t a4, const void *a5)
{
  id v9;
  uint64_t v10;
  void *v11;
  Swift::String v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  _QWORD v19[7];
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[56];
  _BYTE v23[56];
  _BYTE v24[63];
  char v25;
  _BYTE v26[63];
  char v27;
  _QWORD __dst[8];

  v9 = OSSignposter.logHandle.getter();
  static os_signpost_type_t.event.getter();
  memcpy(__dst, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  v10 = __dst[0];
  v11 = (void *)__dst[1];
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)__dst);
  v12._countAndFlagsBits = v10;
  v12._object = v11;
  id(_:)(v12);
  swift_bridgeObjectRelease();
  memcpy(v26, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)v26);
  v27 = v26[24];
  outlined release of OSLogInterpolation((uint64_t)v26);
  memcpy(v24, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)v24);
  v25 = v24[25];
  outlined release of OSLogInterpolation((uint64_t)v24);
  OSLogMessage.bufferSize.getter();
  memcpy(v23, a5, sizeof(v23));
  outlined retain of OSLogInterpolation((uint64_t)v23);
  outlined release of OSLogInterpolation((uint64_t)v23);
  memcpy(v22, a5, sizeof(v22));
  outlined retain of OSLogInterpolation((uint64_t)v22);
  outlined release of OSLogInterpolation((uint64_t)v22);
  memcpy(v19, a5, sizeof(v19));
  outlined retain of OSLogInterpolation((uint64_t)v19);
  v20 = v19[2];
  outlined retain of OSLogArguments((uint64_t)&v20);
  outlined release of OSLogInterpolation((uint64_t)v19);
  outlined retain of OSLogArguments((uint64_t)&v20);
  v21 = v20;
  outlined release of OSLogArguments((uint64_t)&v20);
  v13 = OS_os_log.signpostsEnabled.getter();
  if ((v13 & 1) != 0)
  {
    v18 = v27;
    v17 = v25;
    if ((a3 & 1) == 0)
    {
      if (a1)
        v15 = a1;
      else
        v15 = 0;
      v14 = v15;
      if (v15)
      {
        if (a2 < 0)
        {
          v14 = _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
        }
        closure #1 in _globalStringTablePointerOfStaticString(_:)(v14, &v16);
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
      v13 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 > 0xFFFFFFFF)
    {
      v13 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 < 0xD800 || a1 > 0xDFFF)
      goto LABEL_20;
    do
    {
      v13 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_20:
      ;
    }
    while (a1 > 0x10FFFF);
    MEMORY[0x1E0C80A78](v13);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnsafePointer<Int8>);
    Unicode.Scalar.withUTF8CodeUnits<A>(_:)();
    goto LABEL_13;
  }
  outlined release of OSLogArguments((uint64_t)&v21);
  swift_bridgeObjectRelease();
LABEL_14:

}

void OSSignposter.emitEvent(_:id:)(unint64_t a1, uint64_t a2, char a3, os_signpost_id_t *a4)
{
  NSObject *v8;
  os_signpost_type_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  uint8_t *v23;
  char *v24;
  uint64_t *v25;
  char *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31[2];
  int v32;
  os_signpost_id_t v33[3];
  char *v34;
  unsigned __int8 v35;
  unsigned __int8 v36;

  v8 = OSSignposter.logHandle.getter();
  v9 = static os_signpost_type_t.event.getter();
  v10 = OS_os_log.signpostsEnabled.getter();
  if ((v10 & 1) != 0)
  {
    v36 = 0;
    v35 = 0;
    if ((a3 & 1) == 0)
    {
      if (a1)
        v27 = a1;
      else
        v27 = 0;
      v11 = v27;
      if (v27)
      {
        if (a2 < 0)
        {
          v11 = _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
        }
        closure #1 in _globalStringTablePointerOfStaticString(_:)(v11, (uint64_t *)&v34);
LABEL_13:
        v12 = v34;
        v33[1] = (os_signpost_id_t)"";
        v21 = v36;
        v22 = v35;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        v13 = _allocateUninitializedArray<A>(_:)();
        v14 = v8;
        v33[0] = *a4;
        v25 = &v20;
        MEMORY[0x1E0C80A78](v14);
        v26 = "";
        v31[1] = (_BYTE *)2;
        lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        v24 = v12;
        lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        HIDWORD(v20) = v32;
        v15 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        v16 = createStorage<A>(capacity:type:)(0);
        v17 = createStorage<A>(capacity:type:)(0);
        v23 = v15;
        v31[0] = v15;
        v30 = v16;
        v29 = v17;
        serialize(_:at:)(v21, v31);
        v18 = serialize(_:at:)(v22, v31);
        v28 = v13;
        MEMORY[0x1E0C80A78](v18);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        v19 = v23;
        closure #1 in osSignpostWithoutMessage(log:name:id:type:state:formatString:)(v23, HIDWORD(v20), v8, v9, v33, v24, v26);
        destroyStorage<A>(_:count:)(v16);
        destroyStorage<A>(_:count:)(v17);
        MEMORY[0x19401F918](v19, MEMORY[0x1E0DEDE70]);

        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
      v10 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 > 0xFFFFFFFF)
    {
      v10 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 < 0xD800 || a1 > 0xDFFF)
      goto LABEL_20;
    do
    {
      v10 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_20:
      ;
    }
    while (a1 > 0x10FFFF);
    MEMORY[0x1E0C80A78](v10);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnsafePointer<Int8>);
    Unicode.Scalar.withUTF8CodeUnits<A>(_:)();
    goto LABEL_13;
  }
LABEL_14:

}

uint64_t OSSignposter.beginInterval(_:id:_:)(unint64_t a1, uint64_t a2, char a3, uint64_t *a4, const void *a5)
{
  id v9;
  uint64_t v10;
  void *v11;
  Swift::String v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  unint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  _QWORD v23[7];
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[56];
  _BYTE v27[56];
  _BYTE v28[63];
  char v29;
  _BYTE v30[63];
  char v31;
  _QWORD __dst[8];

  v9 = OSSignposter.logHandle.getter();
  static os_signpost_type_t.begin.getter();
  memcpy(__dst, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  v10 = __dst[0];
  v11 = (void *)__dst[1];
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)__dst);
  v12._countAndFlagsBits = v10;
  v12._object = v11;
  id(_:)(v12);
  swift_bridgeObjectRelease();
  memcpy(v30, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)v30);
  v31 = v30[24];
  outlined release of OSLogInterpolation((uint64_t)v30);
  memcpy(v28, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)v28);
  v29 = v28[25];
  outlined release of OSLogInterpolation((uint64_t)v28);
  OSLogMessage.bufferSize.getter();
  memcpy(v27, a5, sizeof(v27));
  outlined retain of OSLogInterpolation((uint64_t)v27);
  outlined release of OSLogInterpolation((uint64_t)v27);
  memcpy(v26, a5, sizeof(v26));
  outlined retain of OSLogInterpolation((uint64_t)v26);
  outlined release of OSLogInterpolation((uint64_t)v26);
  memcpy(v23, a5, sizeof(v23));
  outlined retain of OSLogInterpolation((uint64_t)v23);
  v24 = v23[2];
  outlined retain of OSLogArguments((uint64_t)&v24);
  outlined release of OSLogInterpolation((uint64_t)v23);
  outlined retain of OSLogArguments((uint64_t)&v24);
  v25 = v24;
  outlined release of OSLogArguments((uint64_t)&v24);
  v13 = OS_os_log.signpostsEnabled.getter();
  if ((v13 & 1) != 0)
  {
    v21 = v31;
    v20 = v29;
    if ((a3 & 1) == 0)
    {
      if (a1)
        v18 = a1;
      else
        v18 = 0;
      v14 = v18;
      if (v18)
      {
        if (a2 < 0)
        {
          v14 = _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
        }
        closure #1 in _globalStringTablePointerOfStaticString(_:)(v14, &v19);
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
      v13 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 > 0xFFFFFFFF)
    {
      v13 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 < 0xD800 || a1 > 0xDFFF)
      goto LABEL_20;
    do
    {
      v13 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_20:
      ;
    }
    while (a1 > 0x10FFFF);
    MEMORY[0x1E0C80A78](v13);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnsafePointer<Int8>);
    Unicode.Scalar.withUTF8CodeUnits<A>(_:)();
    goto LABEL_13;
  }
  outlined release of OSLogArguments((uint64_t)&v25);
  swift_bridgeObjectRelease();
LABEL_14:

  type metadata accessor for OSSignpostIntervalState();
  v22 = *a4;
  v15 = protocol witness for static Equatable.== infix(_:_:) in conformance OSSignpostAnimationBegin();
  return OSSignpostIntervalState.__allocating_init(id:isOpen:)(&v22, v15 & 1);
}

uint64_t OSSignpostIntervalState.__allocating_init(id:isOpen:)(_QWORD *a1, char a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = *a1;
  *(_BYTE *)(result + 24) = a2;
  return result;
}

uint64_t OSSignposter.beginInterval(_:id:)(unint64_t a1, uint64_t a2, char a3, os_signpost_id_t *a4)
{
  return OSSignposter.beginInterval(_:id:)(a1, a2, a3, a4, "", (uint64_t)closure #1 in emitSignpost<A>(preamble:argumentCount:bufferSize:objectCount:stringCount:argumentClosures:signpostTask:)partial apply);
}

uint64_t OSSignposter.beginAnimationInterval(_:id:)(unint64_t a1, uint64_t a2, char a3, os_signpost_id_t *a4)
{
  return OSSignposter.beginInterval(_:id:)(a1, a2, a3, a4, "isAnimation=YES", (uint64_t)closure #1 in emitSignpost<A>(preamble:argumentCount:bufferSize:objectCount:stringCount:argumentClosures:signpostTask:)partial apply);
}

uint64_t OSSignposter.beginInterval(_:id:)(unint64_t a1, uint64_t a2, char a3, os_signpost_id_t *a4, char *a5, uint64_t a6)
{
  NSObject *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  os_signpost_id_t *v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  char *v19;
  char *v20;
  uint64_t v21;
  NSObject *v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  char v28;
  uint64_t v30;
  os_signpost_id_t *v31;
  uint32_t v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  uint8_t *v36;
  char *v37;
  uint64_t *v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE *v45[2];
  uint32_t v46;
  os_signpost_id_t v47;
  char *v48;
  char *v49;
  unsigned __int8 v50;
  unsigned __int8 v51;
  os_signpost_id_t v52[2];

  v31 = a4;
  v11 = OSSignposter.logHandle.getter();
  v12 = static os_signpost_type_t.begin.getter();
  v13 = v11;
  v14 = OS_os_log.signpostsEnabled.getter();
  if ((v14 & 1) != 0)
  {
    v40 = a6;
    v51 = 0;
    v50 = 0;
    if ((a3 & 1) == 0)
    {
      if (a1)
        v41 = a1;
      else
        v41 = 0;
      v17 = v41;
      if (v41)
      {
        if (a2 < 0)
        {
          v17 = _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
        }
        closure #1 in _globalStringTablePointerOfStaticString(_:)(v17, (uint64_t *)&v49);
        v18 = v12;
        v15 = v31;
LABEL_13:
        v19 = v49;
        v48 = a5;
        v16 = v13;
        v20 = v48;
        v33 = v51;
        v34 = v50;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        v21 = _allocateUninitializedArray<A>(_:)();
        v22 = v13;
        v47 = *v15;
        v38 = &v30;
        MEMORY[0x1E0C80A78](v22);
        v39 = v20;
        v45[1] = (_BYTE *)2;
        lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        v35 = v18;
        v37 = v19;
        lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        v32 = v46;
        v23 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        v24 = createStorage<A>(capacity:type:)(0);
        v25 = createStorage<A>(capacity:type:)(0);
        v36 = v23;
        v45[0] = v23;
        v44 = v24;
        v43 = v25;
        serialize(_:at:)(v33, v45);
        v26 = serialize(_:at:)(v34, v45);
        v42 = v21;
        MEMORY[0x1E0C80A78](v26);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        v27 = v36;
        closure #1 in osSignpostWithoutMessage(log:name:id:type:state:formatString:)(v36, v32, v16, (os_signpost_type_t)v35, &v47, v37, v39);
        destroyStorage<A>(_:count:)(v24);
        destroyStorage<A>(_:count:)(v25);
        MEMORY[0x19401F918](v27, MEMORY[0x1E0DEDE70]);

        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
      v14 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 > 0xFFFFFFFF)
    {
      v14 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 < 0xD800 || a1 > 0xDFFF)
      goto LABEL_20;
    do
    {
      v14 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_20:
      ;
    }
    while (a1 > 0x10FFFF);
    MEMORY[0x1E0C80A78](v14);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnsafePointer<Int8>);
    Unicode.Scalar.withUTF8CodeUnits<A>(_:)();
    v18 = v12;
    v15 = v31;
    goto LABEL_13;
  }
  v15 = v31;
  v16 = v11;
LABEL_14:

  type metadata accessor for OSSignpostIntervalState();
  v52[0] = *v15;
  v28 = protocol witness for static Equatable.== infix(_:_:) in conformance OSSignpostAnimationBegin();
  return OSSignpostIntervalState.__allocating_init(id:isOpen:)(v52, v28 & 1);
}

uint64_t OSSignposter.beginAnimationInterval(_:id:_:)(unint64_t a1, uint64_t a2, char a3, uint64_t *a4, const void *a5)
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  unint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  Swift::String v20;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[56];
  _BYTE v25[56];
  _BYTE v26[63];
  char v27;
  _BYTE v28[63];
  char v29;
  _QWORD __dst[8];

  v10 = OSSignposter.logHandle.getter();
  static os_signpost_type_t.begin.getter();
  memcpy(__dst, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)__dst);
  v20 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  static String.+= infix(_:_:)();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" isAnimation=YES", 0x10uLL, 1);
  static String.+= infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  memcpy(v28, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)v28);
  v29 = v28[24];
  outlined release of OSLogInterpolation((uint64_t)v28);
  memcpy(v26, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)v26);
  v27 = v26[25];
  outlined release of OSLogInterpolation((uint64_t)v26);
  OSLogMessage.bufferSize.getter();
  memcpy(v25, a5, sizeof(v25));
  outlined retain of OSLogInterpolation((uint64_t)v25);
  outlined release of OSLogInterpolation((uint64_t)v25);
  memcpy(v24, a5, sizeof(v24));
  outlined retain of OSLogInterpolation((uint64_t)v24);
  outlined release of OSLogInterpolation((uint64_t)v24);
  memcpy(v21, a5, sizeof(v21));
  outlined retain of OSLogInterpolation((uint64_t)v21);
  v22 = v21[2];
  outlined retain of OSLogArguments((uint64_t)&v22);
  outlined release of OSLogInterpolation((uint64_t)v21);
  outlined retain of OSLogArguments((uint64_t)&v22);
  v23 = v22;
  outlined release of OSLogArguments((uint64_t)&v22);
  v11 = OS_os_log.signpostsEnabled.getter();
  if ((v11 & 1) != 0)
  {
    v18 = v29;
    v17 = v27;
    if ((a3 & 1) == 0)
    {
      if (a1)
        v15 = a1;
      else
        v15 = 0;
      v12 = v15;
      if (v15)
      {
        if (a2 < 0)
        {
          v12 = _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
        }
        closure #1 in _globalStringTablePointerOfStaticString(_:)(v12, &v16);
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
      v11 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 > 0xFFFFFFFF)
    {
      v11 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 < 0xD800 || a1 > 0xDFFF)
      goto LABEL_20;
    do
    {
      v11 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_20:
      ;
    }
    while (a1 > 0x10FFFF);
    MEMORY[0x1E0C80A78](v11);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnsafePointer<Int8>);
    Unicode.Scalar.withUTF8CodeUnits<A>(_:)();
    goto LABEL_13;
  }
  outlined release of OSLogArguments((uint64_t)&v23);
  swift_bridgeObjectRelease();
LABEL_14:

  type metadata accessor for OSSignpostIntervalState();
  v19 = *a4;
  v13 = protocol witness for static Equatable.== infix(_:_:) in conformance OSSignpostAnimationBegin();
  return OSSignpostIntervalState.__allocating_init(id:isOpen:)(&v19, v13 & 1);
}

void OSSignposter.endInterval(_:_:_:)(unint64_t a1, uint64_t a2, char a3, uint64_t a4, const void *a5)
{
  id v8;
  uint64_t v9;
  void *v10;
  Swift::String v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  _QWORD v20[7];
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[56];
  _BYTE v24[56];
  _BYTE v25[63];
  char v26;
  _BYTE v27[63];
  char v28;
  _QWORD __dst[8];

  v8 = OSSignposter.logHandle.getter();
  OSSignpostIntervalState.signpostID.getter(&v19);
  static os_signpost_type_t.end.getter();
  swift_retain();
  memcpy(__dst, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  v9 = __dst[0];
  v10 = (void *)__dst[1];
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)__dst);
  v11._countAndFlagsBits = v9;
  v11._object = v10;
  id(_:)(v11);
  swift_bridgeObjectRelease();
  memcpy(v27, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)v27);
  v28 = v27[24];
  outlined release of OSLogInterpolation((uint64_t)v27);
  memcpy(v25, a5, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)v25);
  v26 = v25[25];
  outlined release of OSLogInterpolation((uint64_t)v25);
  OSLogMessage.bufferSize.getter();
  memcpy(v24, a5, sizeof(v24));
  outlined retain of OSLogInterpolation((uint64_t)v24);
  outlined release of OSLogInterpolation((uint64_t)v24);
  memcpy(v23, a5, sizeof(v23));
  outlined retain of OSLogInterpolation((uint64_t)v23);
  outlined release of OSLogInterpolation((uint64_t)v23);
  memcpy(v20, a5, sizeof(v20));
  outlined retain of OSLogInterpolation((uint64_t)v20);
  v21 = v20[2];
  outlined retain of OSLogArguments((uint64_t)&v21);
  outlined release of OSLogInterpolation((uint64_t)v20);
  outlined retain of OSLogArguments((uint64_t)&v21);
  v22 = v21;
  outlined release of OSLogArguments((uint64_t)&v21);
  v12 = OS_os_log.signpostsEnabled.getter();
  if ((v12 & 1) != 0)
  {
    v18 = v28;
    v17 = v26;
    if ((a3 & 1) == 0)
    {
      if (a1)
        v15 = a1;
      else
        v15 = 0;
      v13 = v15;
      if (v15)
      {
        if (a2 < 0)
        {
          v13 = _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
        }
        closure #1 in _globalStringTablePointerOfStaticString(_:)(v13, &v16);
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
      v12 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 > 0xFFFFFFFF)
    {
      v12 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 < 0xD800 || a1 > 0xDFFF)
      goto LABEL_20;
    do
    {
      v12 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_20:
      ;
    }
    while (a1 > 0x10FFFF);
    MEMORY[0x1E0C80A78](v12);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnsafePointer<Int8>);
    Unicode.Scalar.withUTF8CodeUnits<A>(_:)();
    goto LABEL_13;
  }
  outlined release of OSLogArguments((uint64_t)&v22);
  swift_bridgeObjectRelease();
LABEL_14:
  swift_release();

}

void OSSignposter.endInterval(_:_:)(unint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  NSObject *v8;
  os_signpost_type_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint32_t v24;
  unsigned int v25;
  uint8_t *v26;
  char *v27;
  uint64_t *v28;
  char *v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE *v35[2];
  uint32_t v36;
  os_signpost_id_t v37;
  const char *v38;
  char *v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  os_signpost_id_t v42[2];

  v8 = OSSignposter.logHandle.getter();
  OSSignpostIntervalState.signpostID.getter(v42);
  v9 = static os_signpost_type_t.end.getter();
  swift_retain();
  v10 = OS_os_log.signpostsEnabled.getter();
  if ((v10 & 1) == 0)
    goto LABEL_19;
  v41 = 0;
  v40 = 0;
  if ((a3 & 1) != 0)
    goto LABEL_20;
  if (a1)
    v30 = a1;
  else
    v30 = 0;
  v11 = v30;
  if (!v30)
  {
    v10 = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_20:
    if (a1 > 0xFFFFFFFF)
    {
      v10 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 < 0xD800 || a1 > 0xDFFF)
      goto LABEL_25;
    do
    {
      v10 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_25:
      ;
    }
    while (a1 > 0x10FFFF);
    MEMORY[0x1E0C80A78](v10);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnsafePointer<Int8>);
    Unicode.Scalar.withUTF8CodeUnits<A>(_:)();
    goto LABEL_13;
  }
  if (a2 < 0)
  {
    v11 = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  closure #1 in _globalStringTablePointerOfStaticString(_:)(v11, (uint64_t *)&v39);
LABEL_13:
  v12 = v39;
  v38 = "";
  swift_retain();
  if (a4)
  {
    checkForErrorAndConsumeState(state:)(a4, &v31);
    if ((v31 & 1) == 0)
    {
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("[Error] Interval already ended", 0x1EuLL, 1);
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    swift_release();
  }
  v13 = (char *)v38;
  v25 = v41;
  HIDWORD(v22) = v40;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v14 = _allocateUninitializedArray<A>(_:)();
  v15 = v8;
  v37 = v42[0];
  v28 = &v22;
  MEMORY[0x1E0C80A78](v15);
  v29 = v13;
  v35[1] = (_BYTE *)2;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v27 = v12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v24 = v36;
  v16 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  v17 = createStorage<A>(capacity:type:)(0);
  v18 = createStorage<A>(capacity:type:)(0);
  v26 = v16;
  v35[0] = v16;
  v34 = v17;
  v33 = v18;
  serialize(_:at:)(v25, v35);
  v19 = serialize(_:at:)(HIDWORD(v22), v35);
  v23 = v14;
  v32 = v14;
  MEMORY[0x1E0C80A78](v19);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
  Sequence.forEach(_:)();
  v20 = v17;
  v21 = v26;
  closure #1 in osSignpostWithoutMessage(log:name:id:type:state:formatString:)(v26, v24, v8, v9, &v37, v27, v29);
  destroyStorage<A>(_:count:)(v20);
  destroyStorage<A>(_:count:)(v18);
  MEMORY[0x19401F918](v21, MEMORY[0x1E0DEDE70]);

  swift_bridgeObjectRelease();
LABEL_19:
  swift_release();

}

void OSSignposter.withIntervalSignpost<A>(_:id:_:around:)(unint64_t a1, uint64_t a2, char a3, int a4, void *__src)
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD v13[7];
  uint64_t v14;
  _BYTE v15[56];
  _BYTE v16[56];
  _BYTE v17[56];
  _BYTE v18[56];
  _QWORD __dst[9];

  memcpy(__dst, __src, 0x38uLL);
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)__dst);
  memcpy(v18, __src, sizeof(v18));
  outlined retain of OSLogInterpolation((uint64_t)v18);
  outlined release of OSLogInterpolation((uint64_t)v18);
  memcpy(v17, __src, sizeof(v17));
  outlined retain of OSLogInterpolation((uint64_t)v17);
  outlined release of OSLogInterpolation((uint64_t)v17);
  OSLogMessage.bufferSize.getter();
  memcpy(v16, __src, sizeof(v16));
  outlined retain of OSLogInterpolation((uint64_t)v16);
  outlined release of OSLogInterpolation((uint64_t)v16);
  memcpy(v15, __src, sizeof(v15));
  outlined retain of OSLogInterpolation((uint64_t)v15);
  outlined release of OSLogInterpolation((uint64_t)v15);
  memcpy(v13, __src, sizeof(v13));
  outlined retain of OSLogInterpolation((uint64_t)v13);
  v14 = v13[2];
  outlined retain of OSLogArguments((uint64_t)&v14);
  outlined release of OSLogInterpolation((uint64_t)v13);
  outlined retain of OSLogArguments((uint64_t)&v14);
  __dst[8] = v14;
  v9 = outlined release of OSLogArguments((uint64_t)&v14);
  if ((a3 & 1) != 0)
    goto LABEL_12;
  if (a1)
    v11 = a1;
  else
    v11 = 0;
  v10 = v11;
  if (!v11)
    goto LABEL_11;
  if (a2 < 0)
  {
    v10 = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  closure #1 in _globalStringTablePointerOfStaticString(_:)(v10, &v12);
  while (1)
  {
    __break(1u);
LABEL_11:
    v9 = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_12:
    if (a1 > 0xFFFFFFFF)
    {
      v9 = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    if (a1 >= 0xD800 && a1 <= 0xDFFF)
      break;
LABEL_17:
    if (a1 > 0x10FFFF)
      break;
    MEMORY[0x1E0C80A78](v9);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnsafePointer<Int8>);
    Unicode.Scalar.withUTF8CodeUnits<A>(_:)();
  }
  v9 = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  goto LABEL_17;
}

uint64_t OSSignposter.withIntervalSignpost<A>(_:id:around:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE **v31;
  uint64_t v32;
  uint64_t (*v33)@<X0>(uint64_t@<X0>, uint64_t *@<X8>);
  uint64_t v34;
  _BYTE v35[12];
  uint32_t v36;
  uint8_t *v37;
  _BYTE *v38;
  _BYTE *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint8_t *v46;
  uint64_t v47;
  _BYTE *v48[2];
  uint32_t v49;
  uint64_t v50;
  _BYTE v51[8];
  uint64_t v52;

  v9 = v7;
  v13 = MEMORY[0x1E0C80A78](a1);
  v18 = &v35[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if ((v19 & 1) == 0)
  {
    if (a1)
      v44 = a1;
    else
      v44 = 0;
    v20 = v44;
    if (v44)
    {
      if (v14 < 0)
      {
        LODWORD(v33) = 0;
        v32 = 1343;
        LOBYTE(v31) = 2;
        v20 = _fatalErrorMessage(_:_:file:line:flags:)();
        __break(1u);
      }
      v40 = v16;
      v42 = v8;
      v43 = v15;
      closure #1 in _globalStringTablePointerOfStaticString(_:)(v20, &v52);
      goto LABEL_11;
    }
    LODWORD(v33) = 0;
    v32 = 136;
    LOBYTE(v31) = 2;
    v13 = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (a1 > 0xFFFFFFFF)
  {
    LODWORD(v33) = 0;
    v32 = 3455;
    LOBYTE(v31) = 2;
    v13 = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (a1 < 0xD800 || a1 > 0xDFFF)
    goto LABEL_18;
  do
  {
    LODWORD(v33) = 0;
    v32 = 148;
    LOBYTE(v31) = 2;
    v13 = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_18:
    ;
  }
  while (a1 > 0x10FFFF);
  v40 = v16;
  v43 = v15;
  MEMORY[0x1E0C80A78](v13);
  v33 = closure #1 in _globalStringTablePointerOfStaticString(_:);
  v34 = 0;
  v42 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnsafePointer<Int8>);
  v29 = v42;
  Unicode.Scalar.withUTF8CodeUnits<A>(_:)();
  v42 = v29;
LABEL_11:
  v21 = v52;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v22 = _allocateUninitializedArray<A>(_:)();
  v23 = outlined init with copy of OSSignposter(v9, (uint64_t)v51);
  v50 = *a4;
  v39 = v35;
  MEMORY[0x1E0C80A78](v23);
  v38 = &v35[-80];
  *(_QWORD *)&v35[-64] = a7;
  *(_QWORD *)&v35[-56] = v51;
  *(_QWORD *)&v35[-48] = &v50;
  *(_QWORD *)&v35[-40] = v21;
  v48[1] = (_BYTE *)2;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v36 = v49;
  v24 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  v25 = createStorage<A>(capacity:type:)(0);
  v26 = (uint8_t *)createStorage<A>(capacity:type:)(0);
  v37 = v24;
  v48[0] = v24;
  v47 = v25;
  v46 = v26;
  serialize(_:at:)(0, v48);
  v27 = serialize(_:at:)(0, v48);
  v41 = v22;
  v45 = v22;
  MEMORY[0x1E0C80A78](v27);
  v31 = v48;
  v32 = (uint64_t)&v47;
  v33 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))&v46;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
  v28 = v42;
  Sequence.forEach(_:)();
  if (v28)
  {
    __break(1u);
  }
  else
  {
    v22 = (uint64_t)v26;
    v26 = v37;
    partial apply for closure #1 in OSSignposter.withIntervalSignpost<A>(_:id:around:)(v37, v36);
  }
  destroyStorage<A>(_:count:)(v25);
  destroyStorage<A>(_:count:)(v22);
  MEMORY[0x19401F918](v26, MEMORY[0x1E0DEDE70]);
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v40 + 32))(v43, v18, a7);
  outlined destroy of OSSignposter((uint64_t)v51);
  return swift_bridgeObjectRelease();
}

void closure #1 in OSSignposter.withIntervalSignpost<A>(_:id:around:)(uint8_t *a1, uint32_t a2, id *a3, os_signpost_id_t *a4, const char *a5, const char *a6, void (*a7)(void))
{
  os_signpost_id_t v12;
  NSObject *v13;
  uint64_t v14;

  v12 = *a4;
  v13 = *a3;
  _os_signpost_emit_with_name_impl(&dword_191DA0000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v12, a5, a6, a1, a2);
  a7();
  if (!v14)
    _os_signpost_emit_with_name_impl(&dword_191DA0000, v13, OS_SIGNPOST_INTERVAL_END, v12, a5, a6, a1, a2);

}

os_signpost_id_t OSSignposter.makeSignpostID()@<X0>(os_signpost_id_t *a1@<X8>)
{
  os_log_t *v1;
  os_signpost_id_t result;

  result = os_signpost_id_generate(*v1);
  *a1 = result;
  return result;
}

os_signpost_id_t OSSignposter.makeSignpostID(from:)@<X0>(void *ptr@<X0>, os_signpost_id_t *a2@<X8>)
{
  os_log_t *v2;
  os_signpost_id_t result;

  result = os_signpost_id_make_with_pointer(*v2, ptr);
  *a2 = result;
  return result;
}

BOOL static OSSignpostError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void OSSignpostError.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int OSSignpostError.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance OSSignpostError(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t static OSSignpostIntervalState.beginState(id:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *a1;
  type metadata accessor for OSSignpostIntervalState();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v1;
  *(_BYTE *)(result + 24) = 1;
  return result;
}

uint64_t OSSignpostIntervalState.CodingKeys.stringValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6E65704F7369;
  else
    return 0x74736F706E676973;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance OSSignpostIntervalState.CodingKeys()
{
  char *v0;

  return OSSignpostIntervalState.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance OSSignpostIntervalState.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized OSSignpostIntervalState.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance OSSignpostIntervalState.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance OSSignpostIntervalState.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance OSSignpostIntervalState.CodingKeys()
{
  lazy protocol witness table accessor for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance OSSignpostIntervalState.CodingKeys()
{
  lazy protocol witness table accessor for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t OSSignpostIntervalState.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  OSSignpostIntervalState.init(from:)(a1);
  return v2;
}

uint64_t OSSignpostIntervalState.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v10;
  uint64_t v11;
  char v12;
  char v13;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<OSSignpostIntervalState.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    type metadata accessor for OSSignpostIntervalState();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v13 = 0;
    *(_QWORD *)(v1 + 16) = KeyedDecodingContainer.decode(_:forKey:)();
    v12 = 1;
    v10 = KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_BYTE *)(v3 + 24) = v10 & 1;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t OSSignpostIntervalState.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<OSSignpostIntervalState.CodingKeys>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    v8[14] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t OSSignpostIntervalState._hasValue(id:isOpen:)(_QWORD *a1, int a2)
{
  uint64_t v2;

  if (*(_QWORD *)(v2 + 16) == *a1)
    return (*(unsigned __int8 *)(v2 + 24) ^ a2 ^ 1) & 1;
  else
    return 0;
}

uint64_t OSSignpostIntervalState.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t protocol witness for Decodable.init(from:) in conformance OSSignpostIntervalState@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  type metadata accessor for OSSignpostIntervalState();
  v5 = swift_allocObject();
  result = OSSignpostIntervalState.init(from:)(a1);
  if (!v2)
    *a2 = v5;
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance OSSignpostIntervalState(_QWORD *a1)
{
  return OSSignpostIntervalState.encode(to:)(a1);
}

Swift::String __swiftcall id(_:)(Swift::String a1)
{
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v3;
  void *v4;
  Swift::String result;

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  swift_bridgeObjectRetain();
  v3 = countAndFlagsBits;
  v4 = object;
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t outlined retain of OSLogArguments(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t outlined release of OSLogArguments(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

void closure #1 in osSignpostWithoutMessage(log:name:id:type:state:formatString:)(uint8_t *buf, uint32_t size, os_log_t log, os_signpost_type_t a4, os_signpost_id_t *a5, char *name, char *format)
{
  _os_signpost_emit_with_name_impl(&dword_191DA0000, log, a4, *a5, name, format, buf, size);
}

uint64_t closure #1 in _globalStringTablePointerOfStaticString(_:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t partial apply for closure #1 in StaticString.withUTF8Buffer<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(_:_:_:)]);
    result = MEMORY[0x19401FDEC](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x19401FDE0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t closure #1 in emitSignpost<A>(preamble:argumentCount:bufferSize:objectCount:stringCount:argumentClosures:signpostTask:)partial apply(uint64_t (**a1)(_QWORD, _QWORD, _QWORD))
{
  return closure #1 in emitSignpost<A>(preamble:argumentCount:bufferSize:objectCount:stringCount:argumentClosures:signpostTask:)partial apply(a1);
}

{
  _QWORD *v1;

  return (*a1)(v1[2], v1[3], v1[4]);
}

uint64_t outlined init with copy of OSSignposter(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t, ValueMetadata *))(MEMORY[0x1E0DE9D10] + 16))(a2, a1, &type metadata for OSSignposter);
  return a2;
}

uint64_t outlined destroy of OSSignposter(uint64_t a1)
{
  (*(void (**)(uint64_t, ValueMetadata *))(MEMORY[0x1E0DE9D10] + 8))(a1, &type metadata for OSSignposter);
  return a1;
}

void partial apply for closure #1 in OSSignposter.withIntervalSignpost<A>(_:id:around:)(uint8_t *a1, uint32_t a2)
{
  uint64_t v2;

  closure #1 in OSSignposter.withIntervalSignpost<A>(_:id:around:)(a1, a2, *(id **)(v2 + 24), *(os_signpost_id_t **)(v2 + 32), *(const char **)(v2 + 40), *(const char **)(v2 + 48), *(void (**)(void))(v2 + 56));
}

unint64_t lazy protocol witness table accessor for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys;
  if (!lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSSignpostIntervalState.CodingKeys, &type metadata for OSSignpostIntervalState.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys;
  if (!lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSSignpostIntervalState.CodingKeys, &type metadata for OSSignpostIntervalState.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys;
  if (!lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSSignpostIntervalState.CodingKeys, &type metadata for OSSignpostIntervalState.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys;
  if (!lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSSignpostIntervalState.CodingKeys, &type metadata for OSSignpostIntervalState.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSSignpostIntervalState.CodingKeys and conformance OSSignpostIntervalState.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OSSignpostError and conformance OSSignpostError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSSignpostError and conformance OSSignpostError;
  if (!lazy protocol witness table cache variable for type OSSignpostError and conformance OSSignpostError)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSSignpostError, &type metadata for OSSignpostError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSSignpostError and conformance OSSignpostError);
  }
  return result;
}

_BYTE *destructiveInjectEnumTag for OSSignpostError(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

uint64_t method lookup function for OSSignpostIntervalState()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of OSSignpostIntervalState.__allocating_init(id:isOpen:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of OSSignpostIntervalState.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of OSSignpostIntervalState.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of OSSignpostIntervalState._hasValue(id:isOpen:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t getEnumTagSinglePayload for OSSignpostError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for OSSignpostError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_191DAF394 + 4 * byte_191DB46D5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_191DAF3C8 + 4 * asc_191DB46D0[v4]))();
}

uint64_t sub_191DAF3C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DAF3D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x191DAF3D8);
  return result;
}

uint64_t sub_191DAF3E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x191DAF3ECLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_191DAF3F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DAF3F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OSSignpostIntervalState.CodingKeys()
{
  return &type metadata for OSSignpostIntervalState.CodingKeys;
}

uint64_t specialized OSSignpostIntervalState.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x74736F706E676973 && a2 == 0xEA00000000004449;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E65704F7369 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t closure #1 in StaticString.withUTF8Buffer<A>(_:)partial apply()
{
  return partial apply for closure #1 in StaticString.withUTF8Buffer<A>(_:)();
}

Swift::String_optional __swiftcall concatPrivacyAndAttributes(privacy:attributes:)(os::OSLogPrivacy privacy, Swift::String attributes)
{
  void *object;
  uint64_t countAndFlagsBits;
  BOOL v4;
  char v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  Swift::String_optional result;
  uint64_t v12;
  void *v13;

  object = attributes._object;
  countAndFlagsBits = attributes._countAndFlagsBits;
  v4 = OSLogPrivacy.needsPrivacySpecifier.getter();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  v5 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  v6 = v5 ^ 1;
  if (!v4)
    v6 = 0;
  swift_bridgeObjectRetain();
  v12 = countAndFlagsBits;
  v13 = object;
  if ((v6 & 1) != 0)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(",", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  OSLogPrivacy.privacySpecifier.getter();
  if (v7)
  {
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  v8 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
    outlined destroy of String((uint64_t)&v12);
    v9 = 0;
    v10 = 0;
  }
  else
  {
    v9 = v12;
    v10 = v13;
  }
  result.value._object = v10;
  result.value._countAndFlagsBits = v9;
  return result;
}

uint64_t maxOSLogArgumentCount.getter()
{
  return 48;
}

Swift::UInt8 __swiftcall OSLogInterpolation.getArgumentHeader(privacy:type:)(os::OSLogPrivacy privacy, os::OSLogInterpolation::ArgumentType type)
{
  char v2;

  v2 = OSLogInterpolation.ArgumentType.rawValue.getter();
  return OSLogPrivacy.argumentFlag.getter() | (16 * v2);
}

Swift::Void __swiftcall OSLogArguments.append(_:)(Swift::UInt8 a1)
{
  *(_BYTE *)(swift_allocObject() + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  Array.append(_:)();
}

Swift::UInt8 __swiftcall OSLogInterpolation.getUpdatedPreamble(privacy:isScalar:)(os::OSLogPrivacy privacy, Swift::Bool isScalar)
{
  uint64_t v2;
  _BOOL4 v3;
  uint64_t v4;
  Swift::UInt8 v5;
  Swift::UInt8 v8;

  v3 = isScalar;
  v4 = *(_QWORD *)&privacy.privacy;
  v5 = *(_BYTE *)(v2 + 24);
  v8 = v5;
  if (OSLogPrivacy.isAtleastPrivate.getter())
    v8 = v5 | 1;
  if (!v3 || *(_BYTE *)(v4 + 1) != 1)
    v8 |= 2u;
  return v8;
}

uint64_t OSLogInterpolation.init(literalCapacity:interpolationCount:)@<X0>(uint64_t a1@<X8>)
{
  Swift::String v2;
  uint64_t result;

  v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  result = OSLogArguments.init()();
  *(Swift::String *)a1 = v2;
  *(_QWORD *)(a1 + 16) = result;
  *(_BYTE *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 25) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  return result;
}

uint64_t OSLogMessage.init(stringInterpolation:)@<X0>(const void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  _QWORD __dst[7];

  outlined retain of OSLogInterpolation((uint64_t)a1);
  memcpy(__dst, a1, sizeof(__dst));
  v4 = __dst[0];
  v5 = __dst[1];
  v6 = __dst[2];
  v7 = __dst[3];
  v8 = BYTE1(__dst[3]);
  v9 = __dst[4];
  v10 = __dst[5];
  v11 = __dst[6];
  result = outlined release of OSLogInterpolation((uint64_t)a1);
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 16) = v6;
  *(_BYTE *)(a2 + 24) = v7;
  *(_BYTE *)(a2 + 25) = v8;
  *(_QWORD *)(a2 + 32) = v9;
  *(_QWORD *)(a2 + 40) = v10;
  *(_QWORD *)(a2 + 48) = v11;
  return result;
}

uint64_t OSLogMessage.bufferSize.getter()
{
  const void *v0;
  uint64_t result;
  _QWORD v3[7];
  uint64_t v4;

  memcpy(v3, v0, sizeof(v3));
  outlined retain of OSLogInterpolation((uint64_t)v3);
  v4 = v3[4];
  outlined release of OSLogInterpolation((uint64_t)v3);
  result = v4 + 2;
  if (__OFADD__(v4, 2))
    __break(1u);
  return result;
}

uint64_t createStorage<A>(capacity:type:)(uint64_t result)
{
  if (result)
    return static UnsafeMutablePointer.allocate(capacity:)();
  return result;
}

uint64_t serialize(_:at:)(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t destroyStorage<A>(_:count:)(uint64_t result)
{
  if (result)
  {
    UnsafeMutablePointer.deinitialize(count:)();
    JUMPOUT(0x19401F918);
  }
  return result;
}

uint64_t OSLogInterpolation.formatString.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t OSLogInterpolation.formatString.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*OSLogInterpolation.formatString.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogInterpolation.arguments.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t OSLogInterpolation.arguments.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*OSLogInterpolation.arguments.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

unint64_t OSLogInterpolation.ArgumentType.rawValue.getter()
{
  _BYTE *v0;

  return 0x70403020100uLL >> (8 * *v0);
}

BOOL static OSLogInterpolation.ArgumentType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void OSLogInterpolation.ArgumentType.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int OSLogInterpolation.ArgumentType.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t OSLogInterpolation.preamble.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t OSLogInterpolation.preamble.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 24) = result;
  return result;
}

uint64_t (*OSLogInterpolation.preamble.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogInterpolation.privateBitMask.getter()
{
  return 1;
}

uint64_t OSLogInterpolation.nonScalarBitMask.getter()
{
  return 2;
}

uint64_t OSLogInterpolation.argumentCount.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 25);
}

uint64_t OSLogInterpolation.argumentCount.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 25) = result;
  return result;
}

uint64_t (*OSLogInterpolation.argumentCount.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogInterpolation.totalBytesForSerializingArguments.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t OSLogInterpolation.totalBytesForSerializingArguments.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = result;
  return result;
}

uint64_t (*OSLogInterpolation.totalBytesForSerializingArguments.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogInterpolation.stringArgumentCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t OSLogInterpolation.stringArgumentCount.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = result;
  return result;
}

uint64_t (*OSLogInterpolation.stringArgumentCount.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogInterpolation.objectArgumentCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t OSLogInterpolation.objectArgumentCount.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 48) = result;
  return result;
}

uint64_t (*OSLogInterpolation.objectArgumentCount.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogArguments.init()()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  return _allocateUninitializedArray<A>(_:)();
}

Swift::Void __swiftcall OSLogInterpolation.appendLiteral(_:)(Swift::String a1)
{
  String.percentEscapedString.getter(a1._countAndFlagsBits, (uint64_t)a1._object);
  static String.+= infix(_:_:)();
  swift_bridgeObjectRelease();
}

uint64_t String.percentEscapedString.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  Swift::String v8;
  uint64_t v9;
  uint64_t v10;

  swift_bridgeObjectRetain();
  v9 = a1;
  v10 = a2;
  v8 = Character.init(_builtinExtendedGraphemeClusterLiteral:utf8CodeUnitCount:isASCII:)("%", 1uLL, 1);
  lazy protocol witness table accessor for type String and conformance String();
  default argument 1 of Collection<>.split(separator:maxSplits:omittingEmptySubsequences:)();
  v4 = Collection<>.split(separator:maxSplits:omittingEmptySubsequences:)();
  outlined destroy of Character((uint64_t)&v8);
  v7 = v4;
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("%%", 2uLL, 1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Substring]);
  lazy protocol witness table accessor for type [Substring] and conformance [A]();
  lazy protocol witness table accessor for type Substring and conformance Substring();
  v5 = Sequence<>.joined(separator:)();
  outlined destroy of [Substring]((uint64_t)&v7);
  swift_bridgeObjectRelease();
  return v5;
}

double protocol witness for StringInterpolationProtocol.init(literalCapacity:interpolationCount:) in conformance OSLogInterpolation@<D0>(uint64_t a1@<X8>)
{
  __int128 v2;
  double result;
  _OWORD v4[2];
  __int128 v5;
  uint64_t v6;

  OSLogInterpolation.init(literalCapacity:interpolationCount:)((uint64_t)v4);
  v2 = v4[1];
  *(_OWORD *)a1 = v4[0];
  *(_OWORD *)(a1 + 16) = v2;
  result = *(double *)&v5;
  *(_OWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 48) = v6;
  return result;
}

void protocol witness for StringInterpolationProtocol.appendLiteral(_:) in conformance OSLogInterpolation(Swift::String *a1)
{
  OSLogInterpolation.appendLiteral(_:)(*a1);
}

uint64_t default argument 1 of Collection<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t OSLogMessage.interpolation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of OSLogInterpolation(v1, a1);
}

uint64_t OSLogMessage.init(stringLiteral:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  Swift::String v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  _QWORD v16[10];
  __int16 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE __src[64];

  OSLogInterpolation.init(literalCapacity:interpolationCount:)((uint64_t)__src);
  memcpy(v16, __src, 0x38uLL);
  v6._countAndFlagsBits = a1;
  v6._object = a2;
  OSLogInterpolation.appendLiteral(_:)(v6);
  v16[7] = v16[0];
  v16[8] = v16[1];
  v16[9] = v16[2];
  v17 = v16[3];
  v18 = v16[4];
  v19 = v16[5];
  v20 = v16[6];
  v7 = v16[0];
  v8 = v16[1];
  v9 = v16[2];
  v10 = v16[3];
  v11 = BYTE1(v16[3]);
  v12 = v16[4];
  v13 = v16[5];
  v14 = v16[6];
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a3 = v7;
  *(_QWORD *)(a3 + 8) = v8;
  *(_QWORD *)(a3 + 16) = v9;
  *(_BYTE *)(a3 + 24) = v10;
  *(_BYTE *)(a3 + 25) = v11;
  *(_QWORD *)(a3 + 32) = v12;
  *(_QWORD *)(a3 + 40) = v13;
  *(_QWORD *)(a3 + 48) = v14;
  return result;
}

double protocol witness for ExpressibleByStringInterpolation.init(stringInterpolation:) in conformance OSLogMessage@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  double result;
  _OWORD v6[2];
  __int128 v7;
  uint64_t v8;
  _OWORD v9[3];
  uint64_t v10;

  v3 = *(_OWORD *)(a1 + 16);
  v9[0] = *(_OWORD *)a1;
  v9[1] = v3;
  v9[2] = *(_OWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 48);
  OSLogMessage.init(stringInterpolation:)(v9, (uint64_t)v6);
  v4 = v6[1];
  *(_OWORD *)a2 = v6[0];
  *(_OWORD *)(a2 + 16) = v4;
  result = *(double *)&v7;
  *(_OWORD *)(a2 + 32) = v7;
  *(_QWORD *)(a2 + 48) = v8;
  return result;
}

double protocol witness for ExpressibleByStringLiteral.init(stringLiteral:) in conformance OSLogMessage@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v3;
  double result;
  _OWORD v5[2];
  __int128 v6;
  uint64_t v7;

  OSLogMessage.init(stringLiteral:)(*(_QWORD *)a1, *(void **)(a1 + 8), (uint64_t)v5);
  v3 = v5[1];
  *(_OWORD *)a2 = v5[0];
  *(_OWORD *)(a2 + 16) = v3;
  result = *(double *)&v6;
  *(_OWORD *)(a2 + 32) = v6;
  *(_QWORD *)(a2 + 48) = v7;
  return result;
}

uint64_t OSLogArguments.argumentClosures.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*OSLogArguments.argumentClosures.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t sub_191DB00E0()
{
  return swift_deallocObject();
}

_BYTE **partial apply for closure #1 in OSLogArguments.append(_:)(_BYTE **result)
{
  uint64_t v1;
  _BYTE *v2;

  v2 = *result;
  *v2 = *(_BYTE *)(v1 + 16);
  *result = v2 + 1;
  return result;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x19401FDEC](MEMORY[0x1E0DEA9A8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t outlined destroy of Character(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEA2D0] - 8) + 8))();
  return a1;
}

unint64_t lazy protocol witness table accessor for type [Substring] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [Substring] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Substring] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Substring]);
    result = MEMORY[0x19401FDEC](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [Substring] and conformance [A]);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Substring and conformance Substring()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Substring and conformance Substring;
  if (!lazy protocol witness table cache variable for type Substring and conformance Substring)
  {
    result = MEMORY[0x19401FDEC](MEMORY[0x1E0DEBB28], MEMORY[0x1E0DEBAF0]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Substring and conformance Substring);
  }
  return result;
}

uint64_t outlined destroy of [Substring](uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Substring]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with copy of OSLogInterpolation(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for OSLogInterpolation(a2, a1, &type metadata for OSLogInterpolation);
  return a2;
}

unint64_t lazy protocol witness table accessor for type OSLogInterpolation.ArgumentType and conformance OSLogInterpolation.ArgumentType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSLogInterpolation.ArgumentType and conformance OSLogInterpolation.ArgumentType;
  if (!lazy protocol witness table cache variable for type OSLogInterpolation.ArgumentType and conformance OSLogInterpolation.ArgumentType)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSLogInterpolation.ArgumentType, &type metadata for OSLogInterpolation.ArgumentType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogInterpolation.ArgumentType and conformance OSLogInterpolation.ArgumentType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OSLogMessage and conformance OSLogMessage()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSLogMessage and conformance OSLogMessage;
  if (!lazy protocol witness table cache variable for type OSLogMessage and conformance OSLogMessage)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSLogMessage, &type metadata for OSLogMessage);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogMessage and conformance OSLogMessage);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSLogMessage and conformance OSLogMessage;
  if (!lazy protocol witness table cache variable for type OSLogMessage and conformance OSLogMessage)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSLogMessage, &type metadata for OSLogMessage);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogMessage and conformance OSLogMessage);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSLogMessage and conformance OSLogMessage;
  if (!lazy protocol witness table cache variable for type OSLogMessage and conformance OSLogMessage)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSLogMessage, &type metadata for OSLogMessage);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogMessage and conformance OSLogMessage);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OSLogInterpolation and conformance OSLogInterpolation()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSLogInterpolation and conformance OSLogInterpolation;
  if (!lazy protocol witness table cache variable for type OSLogInterpolation and conformance OSLogInterpolation)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSLogInterpolation, &type metadata for OSLogInterpolation);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogInterpolation and conformance OSLogInterpolation);
  }
  return result;
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

ValueMetadata *type metadata accessor for OSLogInterpolation()
{
  return &type metadata for OSLogInterpolation;
}

uint64_t storeEnumTagSinglePayload for OSLogInterpolation.ArgumentType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_191DB0478 + 4 * byte_191DB4925[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_191DB04AC + 4 * byte_191DB4920[v4]))();
}

uint64_t sub_191DB04AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DB04B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x191DB04BCLL);
  return result;
}

uint64_t sub_191DB04C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x191DB04D0);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_191DB04D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DB04DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OSLogInterpolation.ArgumentType()
{
  return &type metadata for OSLogInterpolation.ArgumentType;
}

uint64_t destroy for OSLogInterpolation()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for OSLogInterpolation(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for OSLogInterpolation(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t assignWithTake for OSLogInterpolation(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for OSLogInterpolation(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for OSLogInterpolation(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for OSLogMessage()
{
  return &type metadata for OSLogMessage;
}

ValueMetadata *type metadata accessor for OSLogArguments()
{
  return &type metadata for OSLogArguments;
}

uint64_t outlined destroy of String(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEA968] - 8) + 8))();
  return a1;
}

uint64_t OSAllocatedUnfairLockFlags.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t OSAllocatedUnfairLockFlags.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static OSAllocatedUnfairLockFlags.adaptiveSpin.getter(_DWORD *a1@<X8>)
{
  *a1 = 2;
}

uint64_t OSAllocatedUnfairLockFlags._translatedValue.getter()
{
  _DWORD *v0;

  return (*v0 == 2) << 18;
}

_DWORD *protocol witness for OptionSet.init(rawValue:) in conformance OSAllocatedUnfairLockFlags@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_DWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance OSAllocatedUnfairLockFlags@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance OSAllocatedUnfairLockFlags(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

void protocol witness for SetAlgebra.init() in conformance OSAllocatedUnfairLockFlags(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

_DWORD *protocol witness for SetAlgebra.union(_:) in conformance OSAllocatedUnfairLockFlags@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.intersection(_:) in conformance OSAllocatedUnfairLockFlags@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance OSAllocatedUnfairLockFlags@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance OSAllocatedUnfairLockFlags(_DWORD *a1, int *a2)
{
  _DWORD *v2;
  int v3;
  int v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_DWORD *protocol witness for SetAlgebra.remove(_:) in conformance OSAllocatedUnfairLockFlags@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  _DWORD *v2;
  int v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_DWORD *)a2 = v3;
  *(_BYTE *)(a2 + 4) = v3 == 0;
  return result;
}

int *protocol witness for SetAlgebra.update(with:) in conformance OSAllocatedUnfairLockFlags@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  int *v2;
  int v3;
  int v4;
  int v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = v5 == 0;
  return result;
}

_DWORD *protocol witness for SetAlgebra.formUnion(_:) in conformance OSAllocatedUnfairLockFlags(_DWORD *result)
{
  _DWORD *v1;

  *v1 |= *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.formIntersection(_:) in conformance OSAllocatedUnfairLockFlags(_DWORD *result)
{
  _DWORD *v1;

  *v1 &= *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance OSAllocatedUnfairLockFlags(_DWORD *result)
{
  _DWORD *v1;

  *v1 ^= *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.subtracting(_:) in conformance OSAllocatedUnfairLockFlags@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance OSAllocatedUnfairLockFlags(_DWORD *a1)
{
  _DWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance OSAllocatedUnfairLockFlags(_DWORD *a1)
{
  _DWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance OSAllocatedUnfairLockFlags(_DWORD *a1)
{
  _DWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance OSAllocatedUnfairLockFlags()
{
  _DWORD *v0;

  return *v0 == 0;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance OSAllocatedUnfairLockFlags()
{
  return SetAlgebra.init<A>(_:)();
}

_DWORD *protocol witness for SetAlgebra.subtract(_:) in conformance OSAllocatedUnfairLockFlags(_DWORD *result)
{
  _DWORD *v1;

  *v1 &= ~*result;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance OSAllocatedUnfairLockFlags(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  int *v5;
  int v6;
  int v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (int *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

BOOL static OSAllocatedUnfairLock.Ownership.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void OSAllocatedUnfairLock.Ownership.hash(into:)(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

Swift::Int OSAllocatedUnfairLock.Ownership.hashValue.getter(char a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1 & 1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance OSAllocatedUnfairLock<A>.Ownership(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static OSAllocatedUnfairLock.Ownership.== infix(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance OSAllocatedUnfairLock<A>.Ownership()
{
  char *v0;

  return OSAllocatedUnfairLock.Ownership.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance OSAllocatedUnfairLock<A>.Ownership(uint64_t a1)
{
  char *v1;

  OSAllocatedUnfairLock.Ownership.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance OSAllocatedUnfairLock<A>.Ownership()
{
  char *v0;
  _BYTE v2[72];

  Hasher.init(_seed:)();
  OSAllocatedUnfairLock.Ownership.hash(into:)((uint64_t)v2, *v0);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags;
  if (!lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSAllocatedUnfairLockFlags, &type metadata for OSAllocatedUnfairLockFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags;
  if (!lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSAllocatedUnfairLockFlags, &type metadata for OSAllocatedUnfairLockFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags;
  if (!lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSAllocatedUnfairLockFlags, &type metadata for OSAllocatedUnfairLockFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags;
  if (!lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSAllocatedUnfairLockFlags, &type metadata for OSAllocatedUnfairLockFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSAllocatedUnfairLockFlags and conformance OSAllocatedUnfairLockFlags);
  }
  return result;
}

void base witness table accessor for Equatable in OSAllocatedUnfairLock<A>.Ownership()
{
  JUMPOUT(0x19401FDECLL);
}

ValueMetadata *type metadata accessor for OSAllocatedUnfairLockFlags()
{
  return &type metadata for OSAllocatedUnfairLockFlags;
}

uint64_t type metadata instantiation function for OSAllocatedUnfairLock.Ownership()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t storeEnumTagSinglePayload for OSAllocatedUnfairLock.Ownership(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_191DB0BFC + 4 * byte_191DB4B65[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_191DB0C30 + 4 * asc_191DB4B60[v4]))();
}

uint64_t sub_191DB0C30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DB0C38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x191DB0C40);
  return result;
}

uint64_t sub_191DB0C4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x191DB0C54);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_191DB0C58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DB0C60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t type metadata accessor for OSAllocatedUnfairLock.Ownership(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for OSAllocatedUnfairLock.Ownership);
}

void Logger.log(_:)(__int128 *a1)
{
  Logger.log(_:)(a1, (void (*)(id))static os_log_type_t.default.getter);
}

void Logger.log(level:_:)(uint64_t a1, __int128 *a2)
{
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
  uint64_t v24;
  _QWORD v25[2];
  _OWORD v26[3];
  uint64_t v27;
  _OWORD v28[3];
  uint64_t v29;
  _OWORD v30[3];
  uint64_t v31;
  _OWORD v32[3];
  uint64_t v33;
  _OWORD v34[3];
  uint64_t v35;

  Logger.logObject.getter();
  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v35 = *((_QWORD *)a2 + 6);
  v34[2] = v5;
  v34[1] = v4;
  v34[0] = v3;
  outlined retain of OSLogInterpolation((uint64_t)v34);
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)v34);
  v6 = *a2;
  v7 = a2[1];
  v8 = a2[2];
  v33 = *((_QWORD *)a2 + 6);
  v32[2] = v8;
  v32[1] = v7;
  v32[0] = v6;
  outlined retain of OSLogInterpolation((uint64_t)v32);
  outlined release of OSLogInterpolation((uint64_t)v32);
  v9 = *a2;
  v10 = a2[1];
  v11 = a2[2];
  v31 = *((_QWORD *)a2 + 6);
  v30[2] = v11;
  v30[1] = v10;
  v30[0] = v9;
  outlined retain of OSLogInterpolation((uint64_t)v30);
  outlined release of OSLogInterpolation((uint64_t)v30);
  OSLogMessage.bufferSize.getter();
  v12 = *a2;
  v13 = a2[1];
  v14 = a2[2];
  v29 = *((_QWORD *)a2 + 6);
  v28[2] = v14;
  v28[1] = v13;
  v28[0] = v12;
  outlined retain of OSLogInterpolation((uint64_t)v28);
  outlined release of OSLogInterpolation((uint64_t)v28);
  v15 = *a2;
  v16 = a2[1];
  v17 = a2[2];
  v27 = *((_QWORD *)a2 + 6);
  v26[2] = v17;
  v26[1] = v16;
  v26[0] = v15;
  outlined retain of OSLogInterpolation((uint64_t)v26);
  outlined release of OSLogInterpolation((uint64_t)v26);
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v18 = *a2;
  v19 = a2[1];
  v20 = a2[2];
  v24 = *((_QWORD *)a2 + 6);
  v23 = v20;
  v22 = v19;
  v21 = v18;
  outlined retain of OSLogInterpolation((uint64_t)&v21);
  v25[0] = v22;
  outlined retain of OSLogArguments((uint64_t)v25);
  outlined release of OSLogInterpolation((uint64_t)&v21);
  outlined retain of OSLogArguments((uint64_t)v25);
  v25[1] = v25[0];
  outlined release of OSLogArguments((uint64_t)v25);
  __break(1u);
}

void Logger.trace(_:)(__int128 *a1)
{
  Logger.log(_:)(a1, (void (*)(id))static os_log_type_t.debug.getter);
}

void Logger.debug(_:)(__int128 *a1)
{
  Logger.log(_:)(a1, (void (*)(id))static os_log_type_t.debug.getter);
}

void Logger.info(_:)(__int128 *a1)
{
  Logger.log(_:)(a1, (void (*)(id))static os_log_type_t.info.getter);
}

void Logger.notice(_:)(__int128 *a1)
{
  Logger.log(_:)(a1, (void (*)(id))static os_log_type_t.default.getter);
}

void Logger.warning(_:)(__int128 *a1)
{
  Logger.log(_:)(a1, (void (*)(id))static os_log_type_t.error.getter);
}

void Logger.error(_:)(__int128 *a1)
{
  Logger.log(_:)(a1, (void (*)(id))static os_log_type_t.error.getter);
}

void Logger.critical(_:)(__int128 *a1)
{
  Logger.log(_:)(a1, (void (*)(id))static os_log_type_t.fault.getter);
}

void Logger.fault(_:)(__int128 *a1)
{
  Logger.log(_:)(a1, (void (*)(id))static os_log_type_t.fault.getter);
}

void Logger.log(_:)(__int128 *a1, void (*a2)(id))
{
  id v4;
  __int128 v5;
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
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  _QWORD v27[2];
  _OWORD v28[3];
  uint64_t v29;
  _OWORD v30[3];
  uint64_t v31;
  _OWORD v32[3];
  uint64_t v33;
  _OWORD v34[3];
  uint64_t v35;
  _OWORD v36[3];
  uint64_t v37;

  v4 = Logger.logObject.getter();
  a2(v4);
  v5 = *a1;
  v6 = a1[1];
  v7 = a1[2];
  v37 = *((_QWORD *)a1 + 6);
  v36[2] = v7;
  v36[1] = v6;
  v36[0] = v5;
  outlined retain of OSLogInterpolation((uint64_t)v36);
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)v36);
  v8 = *a1;
  v9 = a1[1];
  v10 = a1[2];
  v35 = *((_QWORD *)a1 + 6);
  v34[2] = v10;
  v34[1] = v9;
  v34[0] = v8;
  outlined retain of OSLogInterpolation((uint64_t)v34);
  outlined release of OSLogInterpolation((uint64_t)v34);
  v11 = *a1;
  v12 = a1[1];
  v13 = a1[2];
  v33 = *((_QWORD *)a1 + 6);
  v32[2] = v13;
  v32[1] = v12;
  v32[0] = v11;
  outlined retain of OSLogInterpolation((uint64_t)v32);
  outlined release of OSLogInterpolation((uint64_t)v32);
  OSLogMessage.bufferSize.getter();
  v14 = *a1;
  v15 = a1[1];
  v16 = a1[2];
  v31 = *((_QWORD *)a1 + 6);
  v30[2] = v16;
  v30[1] = v15;
  v30[0] = v14;
  outlined retain of OSLogInterpolation((uint64_t)v30);
  outlined release of OSLogInterpolation((uint64_t)v30);
  v17 = *a1;
  v18 = a1[1];
  v19 = a1[2];
  v29 = *((_QWORD *)a1 + 6);
  v28[2] = v19;
  v28[1] = v18;
  v28[0] = v17;
  outlined retain of OSLogInterpolation((uint64_t)v28);
  outlined release of OSLogInterpolation((uint64_t)v28);
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v20 = *a1;
  v21 = a1[1];
  v22 = a1[2];
  v26 = *((_QWORD *)a1 + 6);
  v25 = v22;
  v24 = v21;
  v23 = v20;
  outlined retain of OSLogInterpolation((uint64_t)&v23);
  v27[0] = v24;
  outlined retain of OSLogArguments((uint64_t)v27);
  outlined release of OSLogInterpolation((uint64_t)&v23);
  outlined retain of OSLogArguments((uint64_t)v27);
  v27[1] = v27[0];
  outlined release of OSLogArguments((uint64_t)v27);
  __break(1u);
}

void os_log(_:log:_:)(uint64_t a1, uint64_t a2, __int128 *a3)
{
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
  uint64_t v25;
  _QWORD v26[2];
  _OWORD v27[3];
  uint64_t v28;
  _OWORD v29[3];
  uint64_t v30;
  _OWORD v31[3];
  uint64_t v32;
  _OWORD v33[3];
  uint64_t v34;
  _OWORD v35[3];
  uint64_t v36;

  v4 = *a3;
  v5 = a3[1];
  v6 = a3[2];
  v36 = *((_QWORD *)a3 + 6);
  v35[2] = v6;
  v35[1] = v5;
  v35[0] = v4;
  outlined retain of OSLogInterpolation((uint64_t)v35);
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)v35);
  v7 = *a3;
  v8 = a3[1];
  v9 = a3[2];
  v34 = *((_QWORD *)a3 + 6);
  v33[2] = v9;
  v33[1] = v8;
  v33[0] = v7;
  outlined retain of OSLogInterpolation((uint64_t)v33);
  outlined release of OSLogInterpolation((uint64_t)v33);
  v10 = *a3;
  v11 = a3[1];
  v12 = a3[2];
  v32 = *((_QWORD *)a3 + 6);
  v31[2] = v12;
  v31[1] = v11;
  v31[0] = v10;
  outlined retain of OSLogInterpolation((uint64_t)v31);
  outlined release of OSLogInterpolation((uint64_t)v31);
  OSLogMessage.bufferSize.getter();
  v13 = *a3;
  v14 = a3[1];
  v15 = a3[2];
  v30 = *((_QWORD *)a3 + 6);
  v29[2] = v15;
  v29[1] = v14;
  v29[0] = v13;
  outlined retain of OSLogInterpolation((uint64_t)v29);
  outlined release of OSLogInterpolation((uint64_t)v29);
  v16 = *a3;
  v17 = a3[1];
  v18 = a3[2];
  v28 = *((_QWORD *)a3 + 6);
  v27[2] = v18;
  v27[1] = v17;
  v27[0] = v16;
  outlined retain of OSLogInterpolation((uint64_t)v27);
  outlined release of OSLogInterpolation((uint64_t)v27);
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v19 = *a3;
  v20 = a3[1];
  v21 = a3[2];
  v25 = *((_QWORD *)a3 + 6);
  v24 = v21;
  v23 = v20;
  v22 = v19;
  outlined retain of OSLogInterpolation((uint64_t)&v22);
  v26[0] = v23;
  outlined retain of OSLogArguments((uint64_t)v26);
  outlined release of OSLogInterpolation((uint64_t)&v22);
  outlined retain of OSLogArguments((uint64_t)v26);
  v26[1] = v26[0];
  outlined release of OSLogArguments((uint64_t)v26);
  __break(1u);
}

uint64_t _checkFormatStringAndBuffer(_:with:)(__int128 *a1, void (*a2)(_QWORD, _QWORD, uint64_t, uint64_t))
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _OWORD v40[2];
  __int128 v41;
  uint64_t v42;
  _OWORD v43[3];
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  _OWORD v53[3];
  uint64_t v54;

  v3 = *a1;
  v4 = a1[1];
  v5 = a1[2];
  v54 = *((_QWORD *)a1 + 6);
  v53[2] = v5;
  v53[1] = v4;
  v53[0] = v3;
  outlined retain of OSLogInterpolation((uint64_t)v53);
  v6 = v53[0];
  swift_bridgeObjectRetain();
  outlined release of OSLogInterpolation((uint64_t)v53);
  v7 = *a1;
  v8 = a1[1];
  v9 = a1[2];
  v52 = *((_QWORD *)a1 + 6);
  v51 = v9;
  v50 = v8;
  v49 = v7;
  outlined retain of OSLogInterpolation((uint64_t)&v49);
  v10 = BYTE8(v50);
  outlined release of OSLogInterpolation((uint64_t)&v49);
  v11 = *a1;
  v12 = a1[1];
  v13 = a1[2];
  v48 = *((_QWORD *)a1 + 6);
  v47 = v13;
  v46 = v12;
  v45 = v11;
  outlined retain of OSLogInterpolation((uint64_t)&v45);
  v14 = BYTE9(v46);
  outlined release of OSLogInterpolation((uint64_t)&v45);
  OSLogMessage.bufferSize.getter();
  v15 = *a1;
  v16 = a1[1];
  v17 = a1[2];
  v44 = *((_QWORD *)a1 + 6);
  v43[2] = v17;
  v43[1] = v16;
  v43[0] = v15;
  outlined retain of OSLogInterpolation((uint64_t)v43);
  v18 = v44;
  outlined release of OSLogInterpolation((uint64_t)v43);
  v19 = *a1;
  v20 = a1[1];
  v21 = a1[2];
  v42 = *((_QWORD *)a1 + 6);
  v41 = v21;
  v40[1] = v20;
  v40[0] = v19;
  outlined retain of OSLogInterpolation((uint64_t)v40);
  v22 = *((_QWORD *)&v41 + 1);
  outlined release of OSLogInterpolation((uint64_t)v40);
  v23 = *a1;
  v24 = a1[1];
  v25 = a1[2];
  v37 = *((_QWORD *)a1 + 6);
  v36 = v25;
  v35 = v24;
  v34 = v23;
  outlined retain of OSLogInterpolation((uint64_t)&v34);
  v38 = v35;
  outlined retain of OSLogArguments((uint64_t)&v38);
  outlined release of OSLogInterpolation((uint64_t)&v34);
  outlined retain of OSLogArguments((uint64_t)&v38);
  v39 = v38;
  outlined release of OSLogArguments((uint64_t)&v38);
  v26 = (_BYTE *)static UnsafeMutablePointer.allocate(capacity:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  v27 = createStorage<A>(capacity:type:)(v18);
  v28 = createStorage<A>(capacity:type:)(v22);
  v33 = v26;
  serialize(_:at:)(v10, &v33);
  serialize(_:at:)(v14, &v33);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
  Sequence.forEach(_:)();
  v29 = UnsafeBufferPointer.init(start:count:)();
  a2(v6, *((_QWORD *)&v6 + 1), v29, v30);
  destroyStorage<A>(_:count:)(v27);
  destroyStorage<A>(_:count:)(v28);
  MEMORY[0x19401F918](v26, MEMORY[0x1E0DEDE70]);
  outlined release of OSLogArguments((uint64_t)&v39);
  return swift_bridgeObjectRelease();
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@out Int)(void (*a1)(uint64_t *__return_ptr))
{
  uint64_t v2;

  a1(&v2);
  return v2;
}

_QWORD *static OSLogStringAlignment.none.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3[2];
  char v4;
  char v5;

  v5 = 1;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  v3[0] = 0;
  v3[1] = 0;
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  v4 = 1;
  outlined init with copy of OSLogStringAlignment(v3, a1);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  return outlined destroy of OSLogStringAlignment(v3);
}

uint64_t outlined init with copy of OSLogStringAlignment(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a1;
  if (*a1)
  {
    v5 = a1[1];
    *(_QWORD *)a2 = v4;
    *(_QWORD *)(a2 + 8) = v5;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
  }
  *(_BYTE *)(a2 + 16) = *((_BYTE *)a1 + 16);
  return a2;
}

_QWORD *outlined destroy of OSLogStringAlignment(_QWORD *a1)
{
  if (*a1)
    swift_release();
  return a1;
}

BOOL static OSLogCollectionBound.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void OSLogCollectionBound.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int OSLogCollectionBound.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t key path getter for OSLogStringAlignment.minimumColumnWidth : OSLogStringAlignment@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)@<X0>(uint64_t *a1@<X8>)@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)@<X0>(uint64_t *@<X8>);

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int);
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v5;
  return outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v3);
}

uint64_t key path setter for OSLogStringAlignment.minimumColumnWidth : OSLogStringAlignment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t result;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = _sSiIegr_SiIegd_TRTA_0;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *a2;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v3);
  result = outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(v7);
  *a2 = (uint64_t)v6;
  a2[1] = v5;
  return result;
}

uint64_t OSLogStringAlignment.minimumColumnWidth.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(*v0);
  return v1;
}

uint64_t OSLogStringAlignment.minimumColumnWidth.setter(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t result;

  result = outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(*v2);
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*OSLogStringAlignment.minimumColumnWidth.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

void OSLogStringAlignment.anchor.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

_BYTE *OSLogStringAlignment.anchor.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = *result;
  return result;
}

uint64_t (*OSLogStringAlignment.anchor.modify())()
{
  return OSLogFloatFormatting.explicitPositiveSign.modify;
}

uint64_t OSLogStringAlignment.init(minimumColumnWidth:anchor:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X2>, uint64_t a4@<X8>)
{
  *(_QWORD *)a4 = result;
  *(_QWORD *)(a4 + 8) = a2;
  *(_BYTE *)(a4 + 16) = *a3;
  return result;
}

_QWORD *static OSLogStringAlignment.right(columns:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return static OSLogStringAlignment.right(columns:)(a1, a2, 1, a3);
}

_QWORD *static OSLogStringAlignment.left(columns:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return static OSLogStringAlignment.right(columns:)(a1, a2, 0, a3);
}

_QWORD *static OSLogStringAlignment.right(columns:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v9[2];
  char v10;
  char v11;

  swift_retain();
  v11 = a3 & 1;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(a1);
  v9[0] = a1;
  v9[1] = a2;
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(0);
  v10 = a3 & 1;
  outlined init with copy of OSLogStringAlignment(v9, a4);
  outlined consume of (@escaping @callee_guaranteed () -> (@unowned Int))?(a1);
  return outlined destroy of OSLogStringAlignment(v9);
}

unint64_t lazy protocol witness table accessor for type OSLogCollectionBound and conformance OSLogCollectionBound()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSLogCollectionBound and conformance OSLogCollectionBound;
  if (!lazy protocol witness table cache variable for type OSLogCollectionBound and conformance OSLogCollectionBound)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSLogCollectionBound, &type metadata for OSLogCollectionBound);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogCollectionBound and conformance OSLogCollectionBound);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for OSLogCollectionBound(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_191DB19EC + 4 * byte_191DB4E25[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_191DB1A20 + 4 * asc_191DB4E20[v4]))();
}

uint64_t sub_191DB1A20(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DB1A28(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x191DB1A30);
  return result;
}

uint64_t sub_191DB1A3C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x191DB1A44);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_191DB1A48(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DB1A50(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OSLogCollectionBound()
{
  return &type metadata for OSLogCollectionBound;
}

_QWORD *destroy for OSLogStringAlignment(_QWORD *result)
{
  if (*result)
    return (_QWORD *)swift_release();
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for OSLogStringAlignment(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (*(_QWORD *)a2)
  {
    v4 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t assignWithCopy for OSLogStringAlignment(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a2;
  if (!*(_QWORD *)a1)
  {
    if (v4)
    {
      v6 = a2[1];
      *(_QWORD *)a1 = v4;
      *(_QWORD *)(a1 + 8) = v6;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[1];
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  swift_retain();
  swift_release();
LABEL_8:
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for OSLogStringAlignment(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a2;
  if (!*(_QWORD *)a1)
  {
    if (v4)
    {
      v6 = a2[1];
      *(_QWORD *)a1 = v4;
      *(_QWORD *)(a1 + 8) = v6;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[1];
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  swift_release();
LABEL_8:
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for OSLogStringAlignment(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 17))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OSLogStringAlignment(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for OSLogStringAlignment()
{
  return &type metadata for OSLogStringAlignment;
}

uint64_t sub_191DB1C98()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _sSiIegr_SiIegd_TRTA_0()
{
  uint64_t v0;
  uint64_t v2;

  (*(void (**)(uint64_t *__return_ptr))(v0 + 16))(&v2);
  return v2;
}

uint64_t OSLogInterpolation.getStringFormatSpecifier(_:_:_:)(uint64_t a1, os::OSLogPrivacy a2, uint64_t a3, void *a4)
{
  os::OSLogPrivacy v8;
  Swift::String v9;
  uint64_t v10;
  uint64_t countAndFlagsBits;

  countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("%", 1uLL, 1)._countAndFlagsBits;
  v8 = a2;
  v9._countAndFlagsBits = a3;
  v9._object = a4;
  if ((unint64_t)concatPrivacyAndAttributes(privacy:attributes:)(v8, v9).value._object)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("{", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    static String.+= infix(_:_:)();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("}", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if ((*(_BYTE *)(a1 + 16) & 1) == 0)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("-", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  v10 = *(_QWORD *)a1;
  outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(*(_QWORD *)a1);
  if (v10)
  {
    swift_release();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("*", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("s", 1uLL, 1);
  static String.+= infix(_:_:)();
  swift_bridgeObjectRelease();
  return countAndFlagsBits;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v8;
  Swift::String v9;

  swift_retain();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  v9 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  OSLogInterpolation.appendInterpolation(_:align:privacy:attributes:)((uint64_t)partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:), v8, a3, a4, v9._countAndFlagsBits, v9._object);
  swift_bridgeObjectRelease();
  return swift_release();
}

{
  uint64_t v8;

  swift_retain();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  OSLogInterpolation.appendInterpolation(_:align:privacy:)((uint64_t)partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:), v8, a3, a4);
  return swift_release();
}

uint64_t sub_191DB2068()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t OSLogInterpolation.appendInterpolation(_:align:privacy:attributes:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v14;
  uint64_t result;
  os::OSLogPrivacy v16;
  uint64_t v17;
  uint64_t v18;
  os::OSLogPrivacy v19;
  os::OSLogPrivacy v20;
  unsigned int v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  char v25;
  _BYTE __dst[56];

  v7 = v6;
  v14 = *(_BYTE *)(v7 + 25);
  result = maxOSLogArgumentCount.getter();
  if (v14 < result)
  {
    memcpy(__dst, (const void *)v7, sizeof(__dst));
    outlined retain of OSLogInterpolation((uint64_t)__dst);
    v16 = (os::OSLogPrivacy)a4;
    OSLogInterpolation.getStringFormatSpecifier(_:_:_:)((uint64_t)a3, v16, a5, a6);
    outlined release of OSLogInterpolation((uint64_t)__dst);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    v17 = *a3;
    v18 = a3[1];
    outlined copy of (@escaping @callee_guaranteed () -> (@unowned Int))?(v17);
    if (v17)
    {
      OSLogInterpolation.appendAlignmentArgument(_:)(v17, v18);
      swift_release();
    }
    if (*(_BYTE *)(a4 + 1) != 1)
    {
      v19 = (os::OSLogPrivacy)a4;
      OSLogInterpolation.appendMaskArgument(_:)(v19);
    }
    v20 = (os::OSLogPrivacy)a4;
    OSLogInterpolation.addStringHeaders(_:)(v20);
    result = OSLogArguments.append(_:)(a1, a2);
    v21 = *(unsigned __int8 *)(v7 + 25) + 1;
    if (((v21 >> 8) & 1) != 0)
    {
      __break(1u);
    }
    else
    {
      *(_BYTE *)(v7 + 25) = v21;
      v22 = *(_QWORD *)(v7 + 40);
      v23 = __OFADD__(v22, 1);
      v24 = v22 + 1;
      v25 = v23;
      if ((v25 & 1) == 0)
      {
        *(_QWORD *)(v7 + 40) = v24;
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall OSLogInterpolation.addStringHeaders(_:)(os::OSLogPrivacy a1)
{
  _QWORD *v1;
  _QWORD *v2;
  os::OSLogPrivacy v4;
  Swift::UInt8 v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  char v9;
  os::OSLogPrivacy v10;
  Swift::UInt8 v11;
  Swift::UInt8 v12;
  char v13;
  _BYTE v14[56];
  _BYTE __dst[56];

  v2 = v1;
  memcpy(__dst, v1, sizeof(__dst));
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  v13 = 2;
  v4 = a1;
  v5 = OSLogInterpolation.getArgumentHeader(privacy:type:)(v4, (os::OSLogInterpolation::ArgumentType)&v13);
  outlined release of OSLogInterpolation((uint64_t)__dst);
  OSLogArguments.append(_:)(v5);
  lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  OSLogArguments.append(_:)(v12);
  v6 = v1[4];
  v7 = __OFADD__(v6, 10);
  v8 = v6 + 10;
  v9 = v7;
  if ((v9 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v1[4] = v8;
    memcpy(v14, v1, sizeof(v14));
    outlined retain of OSLogInterpolation((uint64_t)v14);
    v10 = a1;
    v11 = OSLogInterpolation.getUpdatedPreamble(privacy:isScalar:)(v10, 0);
    outlined release of OSLogInterpolation((uint64_t)v14);
    *((_BYTE *)v2 + 24) = v11;
  }
}

uint64_t closure #1 in OSLogArguments.append(_:)(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v7, a3);
  v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t partial apply for closure #1 in OSLogArguments.append(_:)(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = _StringObject.sharedUTF8.getter();
    if (!v8)
    {
      result = _assertionFailure(_:_:file:line:flags:)();
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

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
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
      v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = _StringGuts.copyUTF8(into:)();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      v2 = String.UTF8View._foreignCount()();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    specialized UnsafeMutablePointer.initialize(from:count:)(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *specialized UnsafeMutablePointer.initialize(from:count:)(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

Swift::String __swiftcall OSLogInterpolation.getExtendedFormatSpecifier(_:_:_:)(os::OSLogInt32ExtendedFormat a1, os::OSLogPrivacy a2, Swift::String a3)
{
  void *object;
  uint64_t countAndFlagsBits;
  _BYTE *v6;
  Swift::String v7;
  os::OSLogPrivacy v8;
  Swift::String v9;
  uint64_t v10;
  void *v11;
  Swift::String result;

  object = a3._object;
  countAndFlagsBits = a3._countAndFlagsBits;
  v6 = (_BYTE *)a1;
  v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("%{", 2uLL, 1);
  switch(*v6)
  {
    case 0:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("network:in_addr", 0xFuLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 1:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("time_t", 6uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 2:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("darwin.errno", 0xCuLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 3:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("darwin.mode", 0xBuLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 4:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("darwin.signal", 0xDuLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 5:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mach.errno", 0xAuLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 6:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("bitrate", 7uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 7:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("iec-bitrate", 0xBuLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 8:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("bytes", 5uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 9:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("iec-bytes", 9uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 0xA:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("BOOL", 4uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    case 0xB:
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("BOOL", 4uLL, 1);
      static String.+= infix(_:_:)();
      swift_bridgeObjectRelease();
      break;
    default:
      break;
  }
  v8 = a2;
  v9._countAndFlagsBits = countAndFlagsBits;
  v9._object = object;
  if ((unint64_t)concatPrivacyAndAttributes(privacy:attributes:)(v8, v9).value._object)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(",", 1uLL, 1);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
  }
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("}d", 2uLL, 1);
  static String.+= infix(_:_:)();
  swift_bridgeObjectRelease();
  v10 = v7._countAndFlagsBits;
  v11 = v7._object;
  result._object = v11;
  result._countAndFlagsBits = v10;
  return result;
}

BOOL static OSLogBoolFormat.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void OSLogBoolFormat.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int OSLogBoolFormat.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL static OSLogIntExtendedFormat.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void OSLogIntExtendedFormat.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

uint64_t OSLogInterpolation.appendInterpolation(_:format:privacy:)(uint64_t a1, uint64_t a2, os::OSLogInt32ExtendedFormat a3, uint64_t a4)
{
  uint64_t v8;
  Swift::String v9;

  swift_retain();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  v9 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  OSLogInterpolation.appendInterpolation(_:format:privacy:attributes:)((uint64_t)partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:), v8, a3, a4, v9._countAndFlagsBits, v9._object);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_191DB30A0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t OSLogInterpolation.appendInterpolation(_:format:privacy:attributes:)(uint64_t a1, uint64_t a2, os::OSLogInt32ExtendedFormat a3, uint64_t a4, uint64_t a5, void *a6)
{
  _BYTE *v6;
  _BYTE *v7;
  unsigned __int8 v14;
  uint64_t result;
  os::OSLogPrivacy v16;
  Swift::String v17;
  os::OSLogPrivacy v18;
  os::OSLogPrivacy v19;
  uint64_t v20;
  unint64_t v21;
  _BYTE *v22;
  int v23;
  char v24;
  _BYTE __dst[56];

  v7 = v6;
  v14 = v7[25];
  result = maxOSLogArgumentCount.getter();
  if (v14 < result)
  {
    memcpy(__dst, v7, sizeof(__dst));
    outlined retain of OSLogInterpolation((uint64_t)__dst);
    v16 = (os::OSLogPrivacy)a4;
    v17._countAndFlagsBits = a5;
    v17._object = a6;
    OSLogInterpolation.getExtendedFormatSpecifier(_:_:_:)(a3, v16, v17);
    outlined release of OSLogInterpolation((uint64_t)__dst);
    static String.+= infix(_:_:)();
    swift_bridgeObjectRelease();
    if (*(_BYTE *)(a4 + 1) != 1)
    {
      v18 = (os::OSLogPrivacy)a4;
      OSLogInterpolation.appendMaskArgument(_:)(v18);
    }
    v19 = (os::OSLogPrivacy)a4;
    OSLogInterpolation.addIntHeaders(_:_:)(v19, 4);
    swift_retain();
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = a1;
    *(_QWORD *)(v20 + 24) = a2;
    v21 = lazy protocol witness table accessor for type Int32 and conformance Int32();
    OSLogArguments.append<A>(_:)((uint64_t)_ss5Int32VIegd_ABIegr_TRTA_0, v20, MEMORY[0x1E0DEDBC8], v21);
    result = swift_release();
    v23 = v7[25];
    v22 = v7 + 25;
    v24 = v23 + 1;
    if ((((v23 + 1) >> 8) & 1) != 0)
      __break(1u);
    else
      *v22 = v24;
  }
  return result;
}

uint64_t OSLogInterpolation.appendInterpolation(_:format:privacy:)(uint64_t a1, uint64_t a2, os::OSLogBoolFormat a3, uint64_t a4)
{
  const void *v4;
  uint64_t v9;
  char v11;
  _BYTE __dst[56];

  swift_retain();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  memcpy(__dst, v4, sizeof(__dst));
  outlined retain of OSLogInterpolation((uint64_t)__dst);
  OSLogInterpolation.getInt32BoolFormat(_:)(a3);
  outlined release of OSLogInterpolation((uint64_t)__dst);
  OSLogInterpolation.appendInterpolation(_:format:privacy:)((uint64_t)partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:privacy:), v9, (os::OSLogInt32ExtendedFormat)&v11, a4);
  return swift_release();
}

os::OSLogInt32ExtendedFormat __swiftcall OSLogInterpolation.getInt32BoolFormat(_:)(os::OSLogInt32ExtendedFormat result)
{
  _BYTE *v1;

  if ((*(_BYTE *)result & 1) != 0)
    *v1 = 11;
  else
    *v1 = 10;
  return result;
}

unint64_t lazy protocol witness table accessor for type OSLogBoolFormat and conformance OSLogBoolFormat()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSLogBoolFormat and conformance OSLogBoolFormat;
  if (!lazy protocol witness table cache variable for type OSLogBoolFormat and conformance OSLogBoolFormat)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSLogBoolFormat, &type metadata for OSLogBoolFormat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogBoolFormat and conformance OSLogBoolFormat);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OSLogInt32ExtendedFormat and conformance OSLogInt32ExtendedFormat()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSLogInt32ExtendedFormat and conformance OSLogInt32ExtendedFormat;
  if (!lazy protocol witness table cache variable for type OSLogInt32ExtendedFormat and conformance OSLogInt32ExtendedFormat)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSLogInt32ExtendedFormat, &type metadata for OSLogInt32ExtendedFormat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogInt32ExtendedFormat and conformance OSLogInt32ExtendedFormat);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OSLogIntExtendedFormat and conformance OSLogIntExtendedFormat()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OSLogIntExtendedFormat and conformance OSLogIntExtendedFormat;
  if (!lazy protocol witness table cache variable for type OSLogIntExtendedFormat and conformance OSLogIntExtendedFormat)
  {
    result = MEMORY[0x19401FDEC](&protocol conformance descriptor for OSLogIntExtendedFormat, &type metadata for OSLogIntExtendedFormat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSLogIntExtendedFormat and conformance OSLogIntExtendedFormat);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for OSLogBoolFormat(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_191DB3480 + 4 * byte_191DB4EF1[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_191DB34B4 + 4 * byte_191DB4EEC[v4]))();
}

uint64_t sub_191DB34B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DB34BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x191DB34C4);
  return result;
}

uint64_t sub_191DB34D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x191DB34D8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_191DB34DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DB34E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OSLogBoolFormat()
{
  return &type metadata for OSLogBoolFormat;
}

uint64_t getEnumTagSinglePayload for OSLogInt32ExtendedFormat(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for OSLogInt32ExtendedFormat(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_191DB35DC + 4 * byte_191DB4EFB[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_191DB3610 + 4 * byte_191DB4EF6[v4]))();
}

uint64_t sub_191DB3610(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DB3618(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x191DB3620);
  return result;
}

uint64_t sub_191DB362C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x191DB3634);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_191DB3638(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DB3640(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OSLogInt32ExtendedFormat()
{
  return &type metadata for OSLogInt32ExtendedFormat;
}

uint64_t storeEnumTagSinglePayload for OSLogIntExtendedFormat(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_191DB36A8 + 4 * byte_191DB4F05[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_191DB36DC + 4 * byte_191DB4F00[v4]))();
}

uint64_t sub_191DB36DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DB36E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x191DB36ECLL);
  return result;
}

uint64_t sub_191DB36F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x191DB3700);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_191DB3704(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_191DB370C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OSLogIntExtendedFormat()
{
  return &type metadata for OSLogIntExtendedFormat;
}

uint64_t _ss5Int32VIegd_ABIegr_TRTA_0@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int32)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v12;

  swift_retain();
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a5;
  v12[3] = a6;
  v12[4] = a1;
  v12[5] = a2;
  OSLogInterpolation.appendInterpolation(_:align:privacy:)((uint64_t)partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:), (uint64_t)v12, a3, a4);
  return swift_release();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void (*v5)(void);
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = *(_QWORD *)(a3 - 8);
  v5 = (void (*)(void))MEMORY[0x1E0C80A78](a1);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5();
  v8 = dispatch thunk of CustomStringConvertible.description.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, a3);
  return v8;
}

uint64_t sub_191DB387C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)()
{
  uint64_t *v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v0[4], v0[5], v0[2]);
}

uint64_t sub_191DB3934()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  return _typeName(_:qualified:)();
}

Swift::String __swiftcall Character.init(_builtinExtendedGraphemeClusterLiteral:utf8CodeUnitCount:isASCII:)(Builtin::RawPointer _builtinExtendedGraphemeClusterLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  uint64_t v3;
  void *v4;
  Swift::String result;

  v3 = MEMORY[0x1E0DEA298](_builtinExtendedGraphemeClusterLiteral, utf8CodeUnitCount, isASCII);
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t UnsafeBufferPointer.init(start:count:)()
{
  return MEMORY[0x1E0DEA588]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x1E0DEA630]();
}

Swift::String __swiftcall String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  uint64_t v3;
  void *v4;
  Swift::String result;

  v3 = MEMORY[0x1E0DEA718](_builtinStringLiteral, utf8CodeUnitCount, isASCII);
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t static String.== infix(_:_:)()
{
  return MEMORY[0x1E0DEA730]();
}

uint64_t static String.+= infix(_:_:)()
{
  return MEMORY[0x1E0DEA738]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x1E0DEA800](a1._countAndFlagsBits, a1._object);
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x1E0DEA830]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t Sequence.forEach(_:)()
{
  return MEMORY[0x1E0DEAB40]();
}

uint64_t Sequence<>.joined(separator:)()
{
  return MEMORY[0x1E0DEABB0]();
}

uint64_t UnsignedInteger<>.init<A>(_:)()
{
  return MEMORY[0x1E0DEABC0]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t Collection<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return MEMORY[0x1E0DEB6B0]();
}

Swift::Void __swiftcall UnsafeMutablePointer.deallocate()()
{
  MEMORY[0x1E0DEB8C8]();
}

uint64_t UnsafeMutablePointer.deinitialize(count:)()
{
  return MEMORY[0x1E0DEB8E8]();
}

uint64_t static UnsafeMutablePointer.allocate(capacity:)()
{
  return MEMORY[0x1E0DEB908]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return MEMORY[0x1E0DEBE10]();
}

uint64_t SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return MEMORY[0x1E0DEC280]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x1E0DEC2A8](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t __VaListBuilder.deallocStorage(wordCount:storage:)()
{
  return MEMORY[0x1E0DEC8C0]();
}

uint64_t __VaListBuilder.va_list()()
{
  return MEMORY[0x1E0DEC8C8]();
}

uint64_t type metadata accessor for __VaListBuilder()
{
  return MEMORY[0x1E0DEC8D0]();
}

uint64_t dispatch thunk of static FixedWidthInteger.bitWidth.getter()
{
  return MEMORY[0x1E0DEC9F0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECBE0]();
}

{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x1E0DECFC8]();
}

{
  return MEMORY[0x1E0DED030]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x1E0DED0F8]();
}

{
  return MEMORY[0x1E0DED160]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t _allocateUninitializedArray<A>(_:)()
{
  return MEMORY[0x1E0DED5E8]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1E0DEDEF8]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x1E0DEDF10](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t dispatch thunk of CVarArg._cVarArgEncoding.getter()
{
  return MEMORY[0x1E0DEE210]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t Unicode.Scalar.withUTF8CodeUnits<A>(_:)()
{
  return MEMORY[0x1E0DEE6F8]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x1E0DEE978]();
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_log_pack_fill()
{
  return MEMORY[0x1E0C81058]();
}

uint64_t _os_log_pack_size()
{
  return MEMORY[0x1E0C81060]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _os_signpost_pack_fill()
{
  return MEMORY[0x1E0C810D8]();
}

uint64_t _os_signpost_pack_send()
{
  return MEMORY[0x1E0C810E0]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

uint64_t os_log_pack_send()
{
  return MEMORY[0x1E0C84740]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

void os_workgroup_cancel(os_workgroup_t wg)
{
  MEMORY[0x1E0C84A38](wg);
}

int os_workgroup_copy_port(os_workgroup_t wg, mach_port_t *mach_port_out)
{
  return MEMORY[0x1E0C84A40](wg, mach_port_out);
}

os_workgroup_t os_workgroup_create_with_port(const char *name, mach_port_t mach_port)
{
  return (os_workgroup_t)MEMORY[0x1E0C84A50](name, *(_QWORD *)&mach_port);
}

os_workgroup_t os_workgroup_create_with_workgroup(const char *name, os_workgroup_t wg)
{
  return (os_workgroup_t)MEMORY[0x1E0C84A58](name, wg);
}

void *__cdecl os_workgroup_get_working_arena(os_workgroup_t wg, os_workgroup_index *index_out)
{
  return (void *)MEMORY[0x1E0C84A60](wg, index_out);
}

int os_workgroup_interval_finish(os_workgroup_interval_t wg, os_workgroup_interval_data_t data)
{
  return MEMORY[0x1E0C84A88](wg, data);
}

int os_workgroup_interval_start(os_workgroup_interval_t wg, uint64_t start, uint64_t deadline, os_workgroup_interval_data_t data)
{
  return MEMORY[0x1E0C84A90](wg, start, deadline, data);
}

int os_workgroup_interval_update(os_workgroup_interval_t wg, uint64_t deadline, os_workgroup_interval_data_t data)
{
  return MEMORY[0x1E0C84A98](wg, deadline, data);
}

int os_workgroup_join(os_workgroup_t wg, os_workgroup_join_token_t token_out)
{
  return MEMORY[0x1E0C84AA0](wg, token_out);
}

void os_workgroup_leave(os_workgroup_t wg, os_workgroup_join_token_t token)
{
  MEMORY[0x1E0C84AA8](wg, token);
}

int os_workgroup_max_parallel_threads(os_workgroup_t wg, os_workgroup_mpt_attr_t attr)
{
  return MEMORY[0x1E0C84AB0](wg, attr);
}

os_workgroup_parallel_t os_workgroup_parallel_create(const char *name, os_workgroup_attr_t attr)
{
  return (os_workgroup_parallel_t)MEMORY[0x1E0C84AB8](name, attr);
}

int os_workgroup_set_working_arena(os_workgroup_t wg, void *arena, uint32_t max_workers, os_workgroup_working_arena_destructor_t destructor)
{
  return MEMORY[0x1E0C84AC0](wg, arena, *(_QWORD *)&max_workers, destructor);
}

BOOL os_workgroup_testcancel(os_workgroup_t wg)
{
  return MEMORY[0x1E0C84AC8](wg);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_reportError()
{
  return MEMORY[0x1E0DEEE40]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

