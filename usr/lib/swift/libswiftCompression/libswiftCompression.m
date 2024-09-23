Compression::Algorithm_optional __swiftcall Algorithm.init(rawValue:)(compression_algorithm rawValue)
{
  _BYTE *v1;

  if ((int)rawValue > 1793)
  {
    switch(rawValue)
    {
      case COMPRESSION_LZBITMAP:
        *v1 = 4;
        return (Compression::Algorithm_optional)rawValue;
      case COMPRESSION_LZFSE:
        *v1 = 0;
        return (Compression::Algorithm_optional)rawValue;
      case COMPRESSION_BROTLI:
        *v1 = 5;
        return (Compression::Algorithm_optional)rawValue;
    }
LABEL_14:
    *v1 = 6;
    return (Compression::Algorithm_optional)rawValue;
  }
  if (rawValue == COMPRESSION_LZ4)
  {
    *v1 = 2;
    return (Compression::Algorithm_optional)rawValue;
  }
  if (rawValue == COMPRESSION_ZLIB)
  {
    *v1 = 1;
    return (Compression::Algorithm_optional)rawValue;
  }
  if (rawValue != COMPRESSION_LZMA)
    goto LABEL_14;
  *v1 = 3;
  return (Compression::Algorithm_optional)rawValue;
}

uint64_t Algorithm.rawValue.getter()
{
  char *v0;

  return dword_20912B1B0[*v0];
}

void Algorithm.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

void *static Algorithm.allCases.getter()
{
  return &outlined read-only object #0 of static Algorithm.allCases.getter;
}

Swift::Int Algorithm.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance Algorithm(char *a1, char *a2)
{
  return dword_20912B1B0[*a1] == dword_20912B1B0[*a2];
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Algorithm()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance Algorithm()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Algorithm()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for static CaseIterable.allCases.getter in conformance Algorithm(_QWORD *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static Algorithm.allCases.getter;
}

Compression::Algorithm_optional protocol witness for RawRepresentable.init(rawValue:) in conformance Algorithm(compression_algorithm *a1)
{
  return Algorithm.init(rawValue:)(*a1);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance Algorithm(_DWORD *a1@<X8>)
{
  char *v1;

  *a1 = dword_20912B1B0[*v1];
}

Compression::FilterOperation_optional __swiftcall FilterOperation.init(rawValue:)(compression_stream_operation rawValue)
{
  char *v1;
  char v2;

  if (rawValue == COMPRESSION_STREAM_DECODE)
    v2 = 1;
  else
    v2 = 2;
  if (rawValue == COMPRESSION_STREAM_ENCODE)
    v2 = 0;
  *v1 = v2;
  return (Compression::FilterOperation_optional)rawValue;
}

uint64_t FilterOperation.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance FilterOperation(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

_DWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance FilterOperation@<X0>(_DWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance FilterOperation(_DWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

BOOL static FilterError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void FilterError.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

uint64_t OutputFilter.__allocating_init(_:using:bufferCapacity:writingTo:)(unsigned __int8 *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;

  v10 = swift_allocObject();
  OutputFilter.init(_:using:bufferCapacity:writingTo:)(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t OutputFilter.init(_:using:bufferCapacity:writingTo:)(unsigned __int8 *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v10;
  char v11;
  __int128 v12;
  char v14;
  unsigned __int8 v15;
  _OWORD v16[2];
  uint64_t v17;

  v10 = *a1;
  v11 = *a2;
  *(_BYTE *)(v5 + 88) = 0;
  v15 = v10;
  v14 = v11;
  specialized compression_stream.init(operation:algorithm:)(&v15, &v14, (uint64_t)v16);
  if (v6)
  {
    swift_release();
    type metadata accessor for OutputFilter();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v12 = v16[1];
    *(_OWORD *)(v5 + 16) = v16[0];
    *(_OWORD *)(v5 + 32) = v12;
    *(_QWORD *)(v5 + 48) = v17;
    *(_QWORD *)(v5 + 56) = swift_slowAlloc();
    *(_QWORD *)(v5 + 64) = a3;
    *(_QWORD *)(v5 + 72) = a4;
    *(_QWORD *)(v5 + 80) = a5;
  }
  return v5;
}

void OutputFilter.write<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unsigned int (*v23)(uint64_t, uint64_t, uint64_t);
  unsigned int v24;
  uint64_t v25;
  void (*v26)(char *);
  unsigned int (*v27)(char *, uint64_t, uint64_t);
  char v28;
  void (*v29)(char *, uint64_t);
  _BYTE *v30;
  uint64_t v31;
  char *v32;
  uint64_t AssociatedConformanceWitness;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(char *, char *, uint64_t);
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t);
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t AssociatedTypeWitness;
  uint64_t v58;
  uint64_t v59;

  swift_getAssociatedTypeWitness();
  v58 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedConformanceWitness() + 8) + 8);
  v55 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v45 = (char *)&v43 - v7;
  v50 = v8;
  type metadata accessor for Optional();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v53 = (char *)&v43 - v9;
  swift_checkMetadataState();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v46 = (char *)&v43 - v10;
  v47 = v11;
  v48 = v6;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v49 = *(_QWORD *)(AssociatedTypeWitness - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v56 = (char *)&v43 - v12;
  v13 = type metadata accessor for Optional();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v51 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v43 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v43 - v20;
  v22 = *(_QWORD *)(a2 - 8);
  v23 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48);
  v24 = v23(a1, 1, a2);
  v25 = a1;
  v26 = *(void (**)(char *))(v14 + 16);
  v52 = v25;
  v26(v21);
  if (v24 == 1)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v21, v13);
LABEL_5:
    OutputFilter.finalize()();
    return;
  }
  v44 = (void (*)(char *, uint64_t, uint64_t))v26;
  ((void (*)(char *, char *, uint64_t))v26)(v19, v21, v13);
  if (v23((uint64_t)v19, 1, a2) == 1)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }
  v27 = (unsigned int (*)(char *, uint64_t, uint64_t))v23;
  v28 = dispatch thunk of Collection.isEmpty.getter();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v21, v13);
  v29 = *(void (**)(char *, uint64_t))(v22 + 8);
  v29(v19, a2);
  if ((v28 & 1) != 0)
    goto LABEL_5;
  if (*(_BYTE *)(v59 + 88) == 1)
  {
    lazy protocol witness table accessor for type FilterError and conformance FilterError();
    swift_allocError();
    *v30 = 1;
    swift_willThrow();
    return;
  }
  v31 = a2;
  v32 = v51;
  v44(v51, v52, v13);
  if (v27(v32, 1, a2) == 1)
    goto LABEL_16;
  dispatch thunk of DataProtocol.regions.getter();
  v29(v32, a2);
  dispatch thunk of Sequence.makeIterator()();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v34 = v53;
  v52 = AssociatedConformanceWitness;
  dispatch thunk of IteratorProtocol.next()();
  v35 = v55;
  v36 = v50;
  v51 = *(char **)(v55 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v51)(v34, 1, v50) == 1)
  {
LABEL_13:
    (*(void (**)(char *, uint64_t))(v49 + 8))(v56, AssociatedTypeWitness);
  }
  else
  {
    v37 = *(uint64_t (**)(char *, char *, uint64_t))(v35 + 32);
    v39 = v53;
    v38 = v54;
    v40 = v45;
    while (1)
    {
      v41 = v37(v40, v39, v36);
      MEMORY[0x24BDAC7A8](v41);
      v42 = v58;
      *(&v43 - 4) = v31;
      *(&v43 - 3) = v42;
      *(&v43 - 2) = v59;
      *(&v43 - 1) = (uint64_t)v40;
      swift_getAssociatedConformanceWitness();
      dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
      if (v38)
        break;
      (*(void (**)(char *, uint64_t))(v55 + 8))(v40, v36);
      dispatch thunk of IteratorProtocol.next()();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v51)(v39, 1, v36) == 1)
        goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v49 + 8))(v56, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v40, v36);
  }
}

uint64_t closure #1 in OutputFilter.write<A>(_:)(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  compression_stream *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void (*v24)(uint64_t, unint64_t);
  _BYTE *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  compression_stream *v30;

  v3 = v2;
  v6 = type metadata accessor for Data.Deallocator();
  v7 = *(_QWORD *)(v6 - 8);
  v28 = v6;
  v29 = v7;
  MEMORY[0x24BDAC7A8]();
  v27 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v9 = dispatch thunk of Collection.count.getter();
  v30 = (compression_stream *)(a2 + 2);
  result = swift_beginAccess();
  a2[5] = v9;
  if (!a1)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  a2[4] = a1;
  if (v9 >= 1)
  {
    HIDWORD(v26) = *MEMORY[0x24BDCDB98];
    v11 = v28;
    while (1)
    {
      v12 = a2[7];
      v13 = v30;
      swift_beginAccess();
      v14 = a2[8];
      a2[2] = v12;
      a2[3] = v14;
      LODWORD(v12) = compression_stream_process(v13, 0);
      result = swift_endAccess();
      if ((_DWORD)v12 == -1)
      {
        lazy protocol witness table accessor for type FilterError and conformance FilterError();
        swift_allocError();
        *v25 = 1;
        return swift_willThrow();
      }
      v15 = a2[3];
      v16 = v14 - v15;
      if (__OFSUB__(v14, v15))
        break;
      if (v16 > 0)
      {
        v17 = v29;
        v18 = v3;
        v19 = v27;
        (*(void (**)(char *, _QWORD, uint64_t))(v29 + 104))(v27, HIDWORD(v26), v11);
        Data.Deallocator._deallocator.getter();
        type metadata accessor for __DataStorage();
        swift_allocObject();
        swift_retain();
        v20 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
        v21 = specialized Data._Representation.init(_:count:)(v20, v16);
        v23 = v22;
        swift_release();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v11);
        v24 = (void (*)(uint64_t, unint64_t))a2[9];
        outlined copy of Data._Representation(v21, v23);
        v24(v21, v23);
        v3 = v18;
        outlined consume of Data._Representation(v21, v23);
        result = outlined consume of Data._Representation(v21, v23);
        if (v18)
          return result;
      }
      if ((uint64_t)a2[5] <= 0)
        return result;
    }
    __break(1u);
    goto LABEL_13;
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> OutputFilter.finalize()()
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
  compression_stream *v9;
  compression_status v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, _QWORD, uint64_t);
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void (*v20)(uint64_t, unint64_t);
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  unsigned int v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  compression_stream *v28;
  uint64_t v29;

  v2 = v1;
  v3 = v0;
  v4 = type metadata accessor for Data.Deallocator();
  v26 = *(_QWORD *)(v4 - 8);
  v27 = v4;
  MEMORY[0x24BDAC7A8]();
  v25 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_BYTE *)(v0 + 88) & 1) == 0)
  {
    v28 = (compression_stream *)(v0 + 16);
    swift_beginAccess();
    *(_QWORD *)(v0 + 40) = 0;
    v6 = *(_QWORD *)(v0 + 64);
    v24 = *MEMORY[0x24BDCDB98];
    v23 = v6;
    v7 = v27;
    while (1)
    {
      v8 = *(_QWORD *)(v3 + 56);
      v9 = v28;
      swift_beginAccess();
      *(_QWORD *)(v3 + 16) = v8;
      *(_QWORD *)(v3 + 24) = v6;
      v10 = compression_stream_process(v9, 1);
      swift_endAccess();
      if (v10 == COMPRESSION_STATUS_ERROR)
      {
        lazy protocol witness table accessor for type FilterError and conformance FilterError();
        swift_allocError();
        *v22 = 1;
        swift_willThrow();
        return;
      }
      v11 = *(_QWORD *)(v3 + 24);
      v12 = v6 - v11;
      if (__OFSUB__(v6, v11))
        break;
      if (v12 >= 1)
      {
        v13 = v26;
        v14 = *(void (**)(char *, _QWORD, uint64_t))(v26 + 104);
        v29 = v2;
        v15 = v25;
        v14(v25, v24, v7);
        Data.Deallocator._deallocator.getter();
        type metadata accessor for __DataStorage();
        swift_allocObject();
        swift_retain();
        v16 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
        v17 = specialized Data._Representation.init(_:count:)(v16, v12);
        v19 = v18;
        swift_release();
        (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v7);
        v20 = *(void (**)(uint64_t, unint64_t))(v3 + 72);
        outlined copy of Data._Representation(v17, v19);
        v21 = v29;
        v20(v17, v19);
        v2 = v21;
        outlined consume of Data._Representation(v17, v19);
        outlined consume of Data._Representation(v17, v19);
        if (v21)
          return;
        v6 = v23;
      }
      if (v10 == COMPRESSION_STATUS_END)
      {
        *(_BYTE *)(v3 + 88) = 1;
        (*(void (**)(_QWORD, unint64_t))(v3 + 72))(0, 0xF000000000000000);
        return;
      }
    }
    __break(1u);
  }
}

uint64_t OutputFilter.deinit()
{
  uint64_t v0;
  uint64_t v1;

  OutputFilter.finalize()();
  if (v1)
    MEMORY[0x20BD0E30C](v1);
  MEMORY[0x20BD0E39C](*(_QWORD *)(v0 + 56), -1, -1);
  swift_beginAccess();
  compression_stream_destroy((compression_stream *)(v0 + 16));
  swift_endAccess();
  swift_release();
  return v0;
}

uint64_t OutputFilter.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;

  OutputFilter.finalize()();
  if (v1)
    MEMORY[0x20BD0E30C](v1);
  MEMORY[0x20BD0E39C](*(_QWORD *)(v0 + 56), -1, -1);
  swift_beginAccess();
  compression_stream_destroy((compression_stream *)(v0 + 16));
  swift_endAccess();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t InputFilter.InputFilterBuffer.remaining()()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 120));
}

uint64_t InputFilter.InputFilterBuffer.withUnsafeBytes<A>(_:)@<X0>(uint64_t (*a1)(_QWORD, _QWORD)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, _QWORD);
  uint64_t v26;
  uint64_t (*v27)(_QWORD, _QWORD);
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(_QWORD, _QWORD);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43[32];
  char *v44;

  v38 = a3;
  v5 = v4;
  v36 = a2;
  v37 = a1;
  v40 = a4;
  v6 = *v4;
  v7 = *(_QWORD *)(*v4 + 104);
  v8 = *(_QWORD *)(*v4 + 88);
  swift_getAssociatedTypeWitness();
  v42 = v7;
  v9 = *(_QWORD *)(swift_getAssociatedConformanceWitness() + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v34 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v35 = AssociatedTypeWitness;
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v12 = (char *)v33 - v11;
  v13 = swift_checkMetadataState();
  v33[0] = *(_QWORD *)(v13 - 8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v33 - v15;
  v17 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33[1] = v9;
  v20 = swift_getAssociatedTypeWitness();
  v41 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v44 = (char *)v33 - v21;
  if (*(uint64_t *)((char *)v5 + *(_QWORD *)(v6 + 120)))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, (uint64_t)v5 + *(_QWORD *)(v6 + 112), v8);
    dispatch thunk of DataProtocol.regions.getter();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v8);
    v22 = (uint64_t)v5 + *(_QWORD *)(*v5 + 128);
    swift_beginAccess();
    v23 = v34;
    v24 = v35;
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v12, v22, v35);
    v25 = (void (*)(char *, _QWORD))dispatch thunk of Collection.subscript.read();
    (*(void (**)(char *))(v41 + 16))(v44);
    v25(v43, 0);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v24);
    v26 = (*(uint64_t (**)(char *, uint64_t))(v33[0] + 8))(v16, v13);
    MEMORY[0x24BDAC7A8](v26);
    v27 = v37;
    v33[-4] = v38;
    v33[-3] = v5;
    v28 = v36;
    v33[-2] = v27;
    v33[-1] = v28;
    swift_getAssociatedConformanceWitness();
    type metadata accessor for Optional();
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
    return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v44, v20);
  }
  else
  {
    v31 = v38;
    v30 = v39;
    v32 = v40;
    result = v37(0, 0);
    if (!v30)
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v32, 0, 1, v31);
  }
  return result;
}

uint64_t InputFilter.InputFilterBuffer.advance(by:)(uint64_t a1)
{
  uint64_t *v1;
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
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  BOOL v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  char *v34;
  char v35;
  void (*v36)(char *, uint64_t);
  void (*v37)(char *, _QWORD);
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t AssociatedTypeWitness;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61[32];
  char *v62;

  v60 = a1;
  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 104);
  v4 = *(_QWORD *)(*v1 + 88);
  swift_getAssociatedTypeWitness();
  v59 = v3;
  v5 = *(_QWORD *)(swift_getAssociatedConformanceWitness() + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v54 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v53 = (char *)&v48 - v6;
  v7 = swift_getAssociatedTypeWitness();
  v56 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v55 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v62 = (char *)&v48 - v11;
  v57 = *(uint64_t **)(v4 - 8);
  v58 = v4;
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = swift_checkMetadataState();
  result = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v48 - v17;
  v19 = *(_QWORD *)(v2 + 136);
  v20 = *(uint64_t *)((char *)v1 + v19);
  v21 = __OFSUB__(v20, v60);
  v22 = v20 < v60;
  v23 = v20 - v60;
  if (v22)
  {
    lazy protocol witness table accessor for type FilterError and conformance FilterError();
    swift_allocError();
    *v24 = 0;
    return swift_willThrow();
  }
  if (v21)
  {
    __break(1u);
    goto LABEL_16;
  }
  v25 = v60;
  *(uint64_t *)((char *)v1 + v19) = v23;
  v26 = *(_QWORD *)(*v1 + 120);
  v27 = *(uint64_t *)((char *)v1 + v26);
  v21 = __OFSUB__(v27, v25);
  v28 = v27 - v25;
  if (v21)
  {
LABEL_16:
    __break(1u);
    return result;
  }
  v49 = v16;
  v50 = v26;
  *(uint64_t *)((char *)v1 + v26) = v28;
  v29 = v58;
  ((void (*)(char *, uint64_t, uint64_t))v57[2])(v13, (uint64_t)v1 + *(_QWORD *)(*v1 + 112), v58);
  dispatch thunk of DataProtocol.regions.getter();
  ((void (*)(char *, uint64_t))v57[1])(v13, v29);
  v57 = v1;
  v51 = v19;
  v30 = v62;
  if (!*(uint64_t *)((char *)v1 + v19))
  {
    v60 = (uint64_t)v57 + *(_QWORD *)(*v57 + 128);
    do
    {
      v31 = v60;
      swift_beginAccess();
      dispatch thunk of Collection.formIndex(after:)();
      swift_endAccess();
      v32 = v56;
      v33 = *(void (**)(char *, uint64_t, uint64_t))(v56 + 16);
      v33(v30, v31, v7);
      v34 = v55;
      dispatch thunk of Collection.endIndex.getter();
      swift_getAssociatedConformanceWitness();
      v35 = dispatch thunk of static Equatable.== infix(_:_:)();
      v36 = *(void (**)(char *, uint64_t))(v32 + 8);
      v36(v34, v7);
      v36(v30, v7);
      if ((v35 & 1) != 0)
        break;
      v33(v30, v60, v7);
      v37 = (void (*)(char *, _QWORD))dispatch thunk of Collection.subscript.read();
      v38 = v54;
      v39 = v14;
      v40 = v53;
      v41 = v18;
      v42 = v5;
      v43 = AssociatedTypeWitness;
      (*(void (**)(char *))(v54 + 16))(v53);
      v37(v61, 0);
      v36(v62, v7);
      swift_getAssociatedConformanceWitness();
      v44 = dispatch thunk of Collection.count.getter();
      v45 = v40;
      v14 = v39;
      v30 = v62;
      v46 = v43;
      v5 = v42;
      v18 = v41;
      (*(void (**)(char *, uint64_t))(v38 + 8))(v45, v46);
      *(uint64_t *)((char *)v57 + v51) = v44;
    }
    while (!v44);
  }
  if (!*(uint64_t *)((char *)v57 + v50) || *(uint64_t *)((char *)v57 + v51))
    return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v18, v14);
  lazy protocol witness table accessor for type FilterError and conformance FilterError();
  swift_allocError();
  *v47 = 0;
  swift_willThrow();
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v18, v14);
}

uint64_t InputFilter.InputFilterBuffer.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t AssociatedTypeWitness;

  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 88) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 112), *(_QWORD *)(*(_QWORD *)v0 + 88));
  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 128);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(v1, AssociatedTypeWitness);
  return swift_deallocClassInstance();
}

__n128 InputFilter._stream.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  __n128 result;

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 56);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 40);
  *(_QWORD *)(a1 + 16) = v3;
  result = *(__n128 *)(v1 + 64);
  *(__n128 *)(a1 + 24) = result;
  return result;
}

uint64_t InputFilter._buf.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 80) = a1;
  return swift_release();
}

uint64_t InputFilter._eofReached.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 88);
}

uint64_t InputFilter._eofReached.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 88) = result;
  return result;
}

uint64_t InputFilter._endReached.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 89);
}

uint64_t InputFilter._endReached.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 89) = result;
  return result;
}

uint64_t InputFilter.__allocating_init(_:using:bufferCapacity:readingFrom:)(unsigned __int8 *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;

  v10 = swift_allocObject();
  InputFilter.init(_:using:bufferCapacity:readingFrom:)(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t *InputFilter.init(_:using:bufferCapacity:readingFrom:)(unsigned __int8 *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v10;
  unsigned __int8 v11;
  char v12;
  uint64_t v13;
  __int128 v14;
  _OWORD v16[2];
  uint64_t v17;
  char v18;
  unsigned __int8 v19;

  v10 = *v5;
  v11 = *a1;
  v12 = *a2;
  v5[10] = 0;
  *((_WORD *)v5 + 44) = 0;
  v19 = v11;
  v18 = v12;
  specialized compression_stream.init(operation:algorithm:)(&v19, &v18, (uint64_t)v16);
  if (v6)
  {
    swift_release();
    swift_release();
    type metadata accessor for InputFilter(0, *(_QWORD *)(v10 + 80), *(_QWORD *)(v10 + 88), v13);
    swift_deallocPartialClassInstance();
  }
  else
  {
    v14 = v16[1];
    *(_OWORD *)(v5 + 5) = v16[0];
    *(_OWORD *)(v5 + 7) = v14;
    v5[9] = v17;
    v5[2] = a3;
    v5[3] = a4;
    v5[4] = a5;
  }
  return v5;
}

uint64_t InputFilter.readData(ofLength:)(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  if (result < 1)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((*(_BYTE *)(v1 + 89) & 1) != 0)
    return 0;
  v3 = result;
  v6 = specialized Data.init(count:)(result);
  v7 = v4;
  MEMORY[0x24BDAC7A8](v6);
  specialized Data._Representation.withUnsafeMutableBytes<A>(_:)();
  if (v2)
    return outlined consume of Data._Representation(v6, v7);
  swift_beginAccess();
  v5 = *(_QWORD *)(v1 + 48);
  result = v3 - v5;
  if (__OFSUB__(v3, v5))
    goto LABEL_10;
  if ((result & 0x8000000000000000) == 0)
  {
    Data._Representation.count.setter();
    return v6;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t closure #1 in InputFilter.readData(ofLength:)(uint8_t *a1, compression_stream *a2, size_t a3)
{
  uint64_t v3;
  uint8_t *dst_ptr;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  compression_stream *v16;
  uint64_t result;
  char *v18;
  uint64_t v19;
  char *v20;
  void (*v21)(uint64_t, char *, uint64_t);
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  char *v28;
  uint64_t v29;
  int dst_size_low;
  compression_status v31;
  _BYTE *v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  compression_stream *v37;
  uint64_t v38;
  uint8_t *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  _QWORD v43[4];
  char *v44;

  dst_ptr = a2->dst_ptr;
  v8 = *((_QWORD *)a2->dst_ptr + 10);
  v9 = type metadata accessor for Optional();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v40 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  MEMORY[0x24BDAC7A8](v13);
  v44 = (char *)&v33 - v15;
  if (!a1)
  {
LABEL_24:
    lazy protocol witness table accessor for type FilterError and conformance FilterError();
    swift_allocError();
    *v32 = 1;
    return swift_willThrow();
  }
  v39 = dst_ptr;
  v41 = v14;
  v16 = a2 + 1;
  swift_beginAccess();
  a2[1].dst_ptr = a1;
  a2[1].dst_size = a3;
  result = swift_beginAccess();
  if ((uint64_t)a2[1].dst_size > 0 && (a2[2].dst_size & 0x100) == 0)
  {
    v42 = MEMORY[0x24BEE4AE0] + 8;
    v37 = a2 + 1;
    v38 = v8;
    v36 = v10;
    v18 = v44;
    do
    {
      v19 = (uint64_t)a2[2].dst_ptr;
      if (v19 && *(_QWORD *)(v19 + *(_QWORD *)(*(_QWORD *)v19 + 120)))
        goto LABEL_16;
      if ((a2[2].dst_size & 1) == 0)
      {
        result = ((uint64_t (*)(const uint8_t *))a2->src_size)(a2->src_ptr);
        if (v3)
          return result;
        v20 = v18;
        v21 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 16);
        v22 = (char *)v41;
        v21(v41, v20, v9);
        v23 = v10;
        v24 = v9;
        v25 = *(_QWORD *)(v8 - 8);
        v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48);
        if (v26(v22, 1, v8) == 1)
        {
          (*(void (**)(char *, uint64_t))(v23 + 8))(v22, v24);
          v9 = v24;
        }
        else
        {
          v35 = *((_QWORD *)v39 + 11);
          v27 = dispatch thunk of Collection.count.getter();
          v34 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
          v34((uint64_t)v22, v8);
          v9 = v24;
          if (v27)
          {
            v28 = v40;
            v21((uint64_t)v40, v44, v24);
            v29 = v38;
            result = v26(v28, 1, v38);
            if ((_DWORD)result != 1)
            {
              v43[0] = v29;
              v43[1] = v29;
              v43[2] = v35;
              v43[3] = v35;
              type metadata accessor for InputFilter.InputFilterBuffer();
            }
            __break(1u);
            return result;
          }
        }
        LOBYTE(a2[2].dst_size) = 1;
        v16 = v37;
        v8 = v38;
        v18 = v44;
        a2[2].dst_ptr = 0;
        swift_release();
        v10 = v36;
        result = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v18, v9);
        v19 = (uint64_t)a2[2].dst_ptr;
      }
      if (v19)
      {
LABEL_16:
        MEMORY[0x24BDAC7A8](result);
        *(&v33 - 2) = (uint64_t)a2;
        *(&v33 - 1) = v19;
        swift_retain();
        InputFilter.InputFilterBuffer.withUnsafeBytes<A>(_:)(partial apply for closure #1 in closure #1 in InputFilter.readData(ofLength:), (uint64_t)(&v33 - 4), v42, (uint64_t)v43);
        result = swift_release();
        if (v3)
          return result;
      }
      else
      {
        dst_size_low = LOBYTE(a2[2].dst_size);
        swift_beginAccess();
        v31 = compression_stream_process(v16, dst_size_low);
        swift_endAccess();
        if (v31 == COMPRESSION_STATUS_END)
        {
          BYTE1(a2[2].dst_size) = 1;
        }
        else if (v31 == COMPRESSION_STATUS_ERROR)
        {
          goto LABEL_24;
        }
      }
      result = swift_beginAccess();
    }
    while ((uint64_t)a2[1].dst_size >= 1 && (a2[2].dst_size & 0x100) == 0);
  }
  return result;
}

compression_stream *InputFilter.deinit()
{
  compression_stream *v0;

  swift_beginAccess();
  compression_stream_destroy(v0 + 1);
  swift_endAccess();
  swift_release();
  swift_release();
  return v0;
}

uint64_t InputFilter.__deallocating_deinit()
{
  InputFilter.deinit();
  return swift_deallocClassInstance();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance compression_algorithm(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance compression_algorithm@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance compression_algorithm(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

void specialized Data._Representation.withUnsafeMutableBytes<A>(_:)()
{
  __asm { BR              X12 }
}

uint64_t sub_209129400@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *, char *);
  _QWORD *v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  unsigned __int8 v10;

  v6 = v1;
  LOWORD(v7) = a1;
  BYTE2(v7) = BYTE2(a1);
  HIBYTE(v7) = BYTE3(a1);
  v8 = BYTE4(a1);
  v9 = BYTE5(a1);
  v10 = BYTE6(a1);
  result = v2(&v6, (char *)&v6 + BYTE6(a1));
  v5 = v7 | ((unint64_t)v8 << 32) | ((unint64_t)v9 << 40) | ((unint64_t)v10 << 48);
  *v3 = v6;
  v3[1] = v5;
  return result;
}

void specialized Data.InlineSlice.withUnsafeMutableBytes<A>(_:)(void (*a1)(uint64_t, uint64_t))
{
  int *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  Data.InlineSlice.ensureUniqueReference()();
  v3 = *v1;
  v4 = v1[1];
  if ((int)v4 < (int)v3)
  {
    __break(1u);
    goto LABEL_9;
  }
  v5 = __DataStorage._bytes.getter();
  if (!v5)
  {
LABEL_10:
    __break(1u);
    return;
  }
  v6 = v5;
  v7 = __DataStorage._offset.getter();
  v8 = v3 - v7;
  if (__OFSUB__(v3, v7))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v9 = v4 - v3;
  v10 = __DataStorage._length.getter();
  if (v10 >= v9)
    v11 = v9;
  else
    v11 = v10;
  a1(v6 + v8, v6 + v8 + v11);
}

uint64_t specialized compression_stream.init(operation:algorithm:)@<X0>(unsigned __int8 *a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  compression_stream_operation v4;
  uint64_t v5;
  uint64_t result;
  _BYTE *v7;
  const uint8_t *src_ptr;
  __int128 v9;
  compression_stream v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v5 = *a2;
  *(_OWORD *)&v10.dst_ptr = 0xFFFFFFFFFFFFFFFFLL;
  *(_OWORD *)&v10.src_size = 0uLL;
  v10.src_ptr = (const uint8_t *)-1;
  result = compression_stream_init(&v10, v4, (compression_algorithm)dword_20912B1B0[v5]);
  if ((_DWORD)result)
  {
    lazy protocol witness table accessor for type FilterError and conformance FilterError();
    swift_allocError();
    *v7 = 0;
    return swift_willThrow();
  }
  else
  {
    src_ptr = v10.src_ptr;
    v9 = *(_OWORD *)&v10.src_size;
    *(_OWORD *)a3 = *(_OWORD *)&v10.dst_ptr;
    *(_QWORD *)(a3 + 16) = src_ptr;
    *(_OWORD *)(a3 + 24) = v9;
  }
  return result;
}

uint64_t type metadata accessor for OutputFilter()
{
  return objc_opt_self();
}

uint64_t partial apply for closure #1 in OutputFilter.write<A>(_:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in OutputFilter.write<A>(_:)(a1, *(_QWORD **)(v1 + 32));
}

unint64_t lazy protocol witness table accessor for type FilterError and conformance FilterError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilterError and conformance FilterError;
  if (!lazy protocol witness table cache variable for type FilterError and conformance FilterError)
  {
    result = MEMORY[0x20BD0E354](&protocol conformance descriptor for FilterError, &type metadata for FilterError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilterError and conformance FilterError);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilterError and conformance FilterError;
  if (!lazy protocol witness table cache variable for type FilterError and conformance FilterError)
  {
    result = MEMORY[0x20BD0E354](&protocol conformance descriptor for FilterError, &type metadata for FilterError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilterError and conformance FilterError);
  }
  return result;
}

uint64_t specialized Data.InlineData.init(_:)(_BYTE *__src, _BYTE *a2)
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

uint64_t specialized Data._Representation.init(_:count:)(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;

  if (!a2)
  {
    swift_release();
    return 0;
  }
  if (a2 > 14)
  {
    if ((unint64_t)a2 < 0x7FFFFFFF)
      return a2 << 32;
    type metadata accessor for Data.RangeReference();
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = 0;
    *(_QWORD *)(v3 + 24) = a2;
    return v3;
  }
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = (_BYTE *)__DataStorage._bytes.getter();
    if (!v4)
    {
LABEL_10:
      v5 = __DataStorage._length.getter();
      if (v5 >= a2)
        v6 = a2;
      else
        v6 = v5;
      v7 = &v4[v6];
      if (v4)
        v8 = v7;
      else
        v8 = 0;
      v3 = specialized Data.InlineData.init(_:)(v4, v8);
      swift_release();
      return v3;
    }
    result = __DataStorage._offset.getter();
    if (!__OFSUB__(0, result))
    {
      v4 -= result;
      goto LABEL_10;
    }
  }
  __break(1u);
  return result;
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
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

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for InputFilter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for InputFilter);
}

_QWORD *specialized InputFilter.InputFilterBuffer.init(_:)(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  char *v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, _QWORD);
  char *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  void (*v49)(char *, char *, uint64_t);
  char *v50;
  uint64_t v51;
  char *v52;
  void (*v53)(char *, char *, uint64_t);
  uint64_t v54;
  char *v55;
  uint64_t AssociatedTypeWitness;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(char *, uint64_t);
  void (*v65)(char *, uint64_t);
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  char v69[32];
  uint64_t v70;

  v2 = v1;
  v4 = (_QWORD *)*v1;
  v70 = v4[13];
  v5 = v4[11];
  swift_getAssociatedTypeWitness();
  v68 = *(_QWORD *)(swift_getAssociatedConformanceWitness() + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v62 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v55 = (char *)&v49 - v6;
  v7 = swift_getAssociatedTypeWitness();
  v59 = *(_QWORD *)(v7 - 8);
  v60 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v61 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v58 = (char *)&v49 - v10;
  v11 = swift_checkMetadataState();
  v66 = *(_QWORD **)(v11 - 8);
  v67 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v49 - v13;
  v15 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = (char *)v2 + v4[14];
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v19(v18, a1, v5);
  v19(v17, (uint64_t)v18, v5);
  v20 = dispatch thunk of Collection.count.getter();
  v21 = *(void (**)(char *, uint64_t))(v15 + 8);
  v21(v17, v5);
  v64 = v21;
  *(_QWORD *)((char *)v2 + *(_QWORD *)(*v2 + 120)) = v20;
  v54 = *(_QWORD *)(*v2 + 136);
  *(_QWORD *)((char *)v2 + v54) = 0;
  v19(v17, (uint64_t)v18, v5);
  dispatch thunk of DataProtocol.regions.getter();
  v21(v17, v5);
  v22 = v58;
  v23 = v14;
  v57 = v14;
  v24 = v67;
  dispatch thunk of Collection.startIndex.getter();
  v65 = (void (*)(char *, uint64_t))v66[1];
  v65(v23, v24);
  v25 = *(_QWORD *)(*v2 + 128);
  v66 = v2;
  v26 = (char *)v2 + v25;
  v27 = v59;
  v28 = v60;
  v29 = v22;
  (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v26, v22, v60);
  swift_beginAccess();
  v30 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
  v31 = v27;
  v50 = v26;
  v49 = v30;
  v30(v29, v26, v28);
  v52 = v18;
  v32 = v18;
  v33 = v57;
  v53 = (void (*)(char *, char *, uint64_t))v19;
  v19(v17, (uint64_t)v32, v5);
  v34 = v28;
  v35 = v29;
  dispatch thunk of DataProtocol.regions.getter();
  v51 = v5;
  v64(v17, v5);
  v36 = v61;
  v37 = v67;
  dispatch thunk of Collection.endIndex.getter();
  v65(v33, v37);
  swift_getAssociatedConformanceWitness();
  LOBYTE(v27) = dispatch thunk of static Equatable.== infix(_:_:)();
  v38 = *(void (**)(char *, uint64_t))(v31 + 8);
  v38(v36, v34);
  v39 = v35;
  v38(v35, v34);
  if ((v27 & 1) == 0)
  {
    v40 = v51;
    v53(v17, v52, v51);
    dispatch thunk of DataProtocol.regions.getter();
    v64(v17, v40);
    v49(v35, v50, v34);
    v41 = v67;
    v42 = (void (*)(char *, _QWORD))dispatch thunk of Collection.subscript.read();
    v43 = v55;
    v44 = AssociatedTypeWitness;
    (*(void (**)(char *))(v62 + 16))(v55);
    v42(v69, 0);
    v38(v39, v34);
    v65(v33, v41);
    swift_getAssociatedConformanceWitness();
    v45 = dispatch thunk of Collection.count.getter();
    (*(void (**)(char *, uint64_t))(v62 + 8))(v43, v44);
    *(_QWORD *)((char *)v66 + v54) = v45;
  }
  v46 = v66;
  v47 = v63;
  InputFilter.InputFilterBuffer.advance(by:)(0);
  if (v47)
    swift_release();
  return v46;
}

uint64_t specialized Data.init(count:)(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      type metadata accessor for __DataStorage();
      swift_allocObject();
      __DataStorage.init(length:)();
      if (v1 >= 0x7FFFFFFF)
      {
        type metadata accessor for Data.RangeReference();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t partial apply for closure #1 in InputFilter.readData(ofLength:)(uint8_t *a1)
{
  uint64_t v1;

  return closure #1 in InputFilter.readData(ofLength:)(a1, *(compression_stream **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

unint64_t lazy protocol witness table accessor for type Algorithm and conformance Algorithm()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Algorithm and conformance Algorithm;
  if (!lazy protocol witness table cache variable for type Algorithm and conformance Algorithm)
  {
    result = MEMORY[0x20BD0E354](&protocol conformance descriptor for Algorithm, &type metadata for Algorithm);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Algorithm and conformance Algorithm);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [Algorithm] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [Algorithm] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Algorithm] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Algorithm]);
    result = MEMORY[0x20BD0E354](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [Algorithm] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD0E348](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FilterOperation and conformance FilterOperation()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FilterOperation and conformance FilterOperation;
  if (!lazy protocol witness table cache variable for type FilterOperation and conformance FilterOperation)
  {
    result = MEMORY[0x20BD0E354](&protocol conformance descriptor for FilterOperation, &type metadata for FilterOperation);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilterOperation and conformance FilterOperation);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Algorithm(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Algorithm(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20912A270 + 4 * byte_20912ACA5[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_20912A2A4 + 4 * byte_20912ACA0[v4]))();
}

uint64_t sub_20912A2A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20912A2AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20912A2B4);
  return result;
}

uint64_t sub_20912A2C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20912A2C8);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_20912A2CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20912A2D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for Algorithm(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for Algorithm(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Algorithm()
{
  return &type metadata for Algorithm;
}

ValueMetadata *type metadata accessor for FilterOperation()
{
  return &type metadata for FilterOperation;
}

uint64_t getEnumTagSinglePayload for FilterOperation(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FilterOperation(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20912A3F8 + 4 * byte_20912ACAF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_20912A42C + 4 * byte_20912ACAA[v4]))();
}

uint64_t sub_20912A42C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20912A434(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20912A43CLL);
  return result;
}

uint64_t sub_20912A448(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20912A450);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20912A454(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20912A45C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *destructiveInjectEnumTag for FilterError(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FilterError()
{
  return &type metadata for FilterError;
}

uint64_t method lookup function for OutputFilter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of OutputFilter.__allocating_init(_:using:bufferCapacity:writingTo:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of OutputFilter.write<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of OutputFilter.finalize()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t type metadata completion function for InputFilter()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for InputFilter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InputFilter.__allocating_init(_:using:bufferCapacity:readingFrom:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of InputFilter.readData(ofLength:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t type metadata completion function for InputFilter.InputFilterBuffer()
{
  uint64_t AssociatedTypeWitness;
  unint64_t v1;
  unint64_t v2;

  AssociatedTypeWitness = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
      return swift_initClassMetadata2();
  }
  return AssociatedTypeWitness;
}

void type metadata accessor for InputFilter.InputFilterBuffer()
{
  JUMPOUT(0x20BD0E33CLL);
}

uint64_t initializeBufferWithCopyOfBuffer for compression_stream(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t getEnumTagSinglePayload for compression_stream(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)a1)
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for compression_stream(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 2;
    if (a3 >= 2)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)result = 0;
  }
  return result;
}

void type metadata accessor for compression_stream(uint64_t a1)
{
  type metadata accessor for compression_stream(a1, &lazy cache variable for type metadata for compression_stream);
}

void type metadata accessor for compression_stream_operation(uint64_t a1)
{
  type metadata accessor for compression_stream(a1, &lazy cache variable for type metadata for compression_stream_operation);
}

void type metadata accessor for compression_algorithm(uint64_t a1)
{
  type metadata accessor for compression_stream(a1, (unint64_t *)&lazy cache variable for type metadata for compression_algorithm);
}

void type metadata accessor for compression_stream(uint64_t a1, unint64_t *a2)
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

uint64_t partial apply for closure #1 in InputFilter.InputFilterBuffer.withUnsafeBytes<A>(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  if (!result)
    goto LABEL_7;
  v6 = *(_QWORD *)(*(_QWORD *)(v3 + 24) + *(_QWORD *)(**(_QWORD **)(v3 + 24) + 136));
  if (__OFSUB__(0, v6))
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  v7 = *(_QWORD *)(v3 + 16);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 32))(a2 - v6, a2);
  if (!v4)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(a3, 0, 1, v7);
  return result;
}

uint64_t partial apply for closure #1 in closure #1 in InputFilter.readData(ofLength:)(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  compression_status v7;
  uint64_t v8;
  _BYTE *v9;

  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)(v2 + 16);
    swift_beginAccess();
    v6 = a2 - v4;
    *(_QWORD *)(v5 + 56) = v4;
    *(_QWORD *)(v5 + 64) = a2 - v4;
    v7 = compression_stream_process((compression_stream *)(v5 + 40), *(unsigned __int8 *)(v5 + 88));
    swift_endAccess();
    if (v7 == COMPRESSION_STATUS_ERROR)
    {
      lazy protocol witness table accessor for type FilterError and conformance FilterError();
      swift_allocError();
      *v9 = 1;
      return swift_willThrow();
    }
    if (v7 == COMPRESSION_STATUS_END)
      *(_BYTE *)(v5 + 89) = 1;
    swift_beginAccess();
    v8 = *(_QWORD *)(v5 + 64);
    result = v6 - v8;
    if (!__OFSUB__(v6, v8))
      return InputFilter.InputFilterBuffer.advance(by:)(result);
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x20BD0E33C](a1, v6, a5);
}

uint64_t dispatch thunk of DataProtocol.regions.getter()
{
  return MEMORY[0x24BDCB7A8]();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t __DataStorage.init(length:)()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x24BDCC1E0]();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
  MEMORY[0x24BDCDB60]();
}

uint64_t Data.Deallocator._deallocator.getter()
{
  return MEMORY[0x24BDCDB80]();
}

uint64_t type metadata accessor for Data.Deallocator()
{
  return MEMORY[0x24BDCDBB0]();
}

Swift::Void __swiftcall Data.InlineSlice.ensureUniqueReference()()
{
  MEMORY[0x24BDCDBC8]();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t Data._Representation.count.setter()
{
  return MEMORY[0x24BDCDC38]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t dispatch thunk of Collection.isEmpty.getter()
{
  return MEMORY[0x24BEE1900]();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x24BEDB998](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB9A8](stream, *(_QWORD *)&operation, *(_QWORD *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x24BEDB9B0](stream, *(_QWORD *)&flags);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

