double OmniSearchTypesInfo.versionNumber.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

OmniSearchTypes::OmniSearchTypesInfo __swiftcall OmniSearchTypesInfo.init()()
{
  _QWORD *v0;
  OmniSearchTypes::OmniSearchTypesInfo result;

  *(OmniSearchTypes::OmniSearchTypesInfo *)&result.versionNumber = (OmniSearchTypes::OmniSearchTypesInfo)0x3FF0000000000000;
  *v0 = 0x3FF0000000000000;
  return result;
}

uint64_t default argument 1 of JSONEncoder.init(dateEncodingStrategy:outputFormatting:keyEncodingStrategy:)()
{
  type metadata accessor for JSONEncoder.OutputFormatting();
  lazy protocol witness table accessor for type JSONEncoder.OutputFormatting and conformance JSONEncoder.OutputFormatting();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [JSONEncoder.OutputFormatting]);
  lazy protocol witness table accessor for type [JSONEncoder.OutputFormatting] and conformance [A]();
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

unint64_t lazy protocol witness table accessor for type JSONEncoder.OutputFormatting and conformance JSONEncoder.OutputFormatting()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type JSONEncoder.OutputFormatting and conformance JSONEncoder.OutputFormatting;
  if (!lazy protocol witness table cache variable for type JSONEncoder.OutputFormatting and conformance JSONEncoder.OutputFormatting)
  {
    v1 = type metadata accessor for JSONEncoder.OutputFormatting();
    result = MEMORY[0x2494F7A00](MEMORY[0x24BDCB2C8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type JSONEncoder.OutputFormatting and conformance JSONEncoder.OutputFormatting);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2494F79E8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [JSONEncoder.OutputFormatting] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [JSONEncoder.OutputFormatting] and conformance [A];
  if (!lazy protocol witness table cache variable for type [JSONEncoder.OutputFormatting] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [JSONEncoder.OutputFormatting]);
    result = MEMORY[0x2494F7A00](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [JSONEncoder.OutputFormatting] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2494F79F4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t default argument 2 of JSONEncoder.init(dateEncodingStrategy:outputFormatting:keyEncodingStrategy:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BDCB2F0];
  v3 = type metadata accessor for JSONEncoder.KeyEncodingStrategy();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

ValueMetadata *type metadata accessor for OmniSearchTypesInfo()
{
  return &type metadata for OmniSearchTypesInfo;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for _NSRange(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for _NSRange(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for _NSRange()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!lazy cache variable for type metadata for _NSRange)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for _NSRange);
  }
}

uint64_t String.nilIfEmpty.getter(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v3 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v3)
    return 0;
  OUTLINED_FUNCTION_0();
  return v2;
}

Swift::String __swiftcall String.splitByCapitalLetters()()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  Swift::String result;

  OUTLINED_FUNCTION_0();
  specialized Collection.dropFirst(_:)(1, v1, v0);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  swift_bridgeObjectRetain();
  v10 = specialized Collection.prefix(_:)(1);
  v11 = MEMORY[0x2494F749C](v10);
  v13 = v12;
  swift_bridgeObjectRelease();
  specialized Sequence.reduce<A>(_:_:)(v11, v13, v3, v5, v7, v9);
  v15 = v14;
  v17 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v18 = v15;
  v19 = v17;
  result._object = v19;
  result._countAndFlagsBits = v18;
  return result;
}

void specialized Collection.dropFirst(_:)(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  if (a1 < 0)
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
    String.UnicodeScalarView.index(_:offsetBy:limitedBy:)(0xFuLL, a1, v5, a2, a3);
    if ((v7 & 1) != 0)
      v6 = v5;
    if (4 * v3 >= v6 >> 14)
    {
      String.UnicodeScalarView.subscript.getter();
      swift_bridgeObjectRelease();
      return;
    }
  }
  __break(1u);
}

uint64_t specialized Collection.prefix(_:)(uint64_t result)
{
  uint64_t v1;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    String.index(_:offsetBy:limitedBy:)();
    v1 = String.subscript.getter();
    swift_bridgeObjectRelease();
    return v1;
  }
  return result;
}

uint64_t closure #1 in String.splitByCapitalLetters()@<X0>(uint64_t *a1@<X0>, unsigned int *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  Swift::String v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  Swift::String v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  Swift::String v25;
  uint64_t result;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;

  v6 = type metadata accessor for CharacterSet();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *a1;
  v10 = a1[1];
  v12 = *a2;
  static CharacterSet.uppercaseLetters.getter();
  LOBYTE(a2) = CharacterSet.contains(_:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if ((a2 & 1) != 0)
  {
    v34 = v11;
    v35 = v10;
    swift_bridgeObjectRetain();
    v13._countAndFlagsBits = 32;
    v13._object = (void *)0xE100000000000000;
    String.append(_:)(v13);
    v14 = v34;
    v15 = v35;
    if (v12 > 0x7F)
    {
      v28 = (v12 & 0x3F) << 8;
      if (v12 >= 0x800)
      {
        v30 = (v28 | (v12 >> 6) & 0x3F) << 8;
        v31 = (((v30 | (v12 >> 12) & 0x3F) << 8) | (v12 >> 18)) - 2122219023;
        v16 = (v30 | (v12 >> 12)) + 8487393;
        if (HIWORD(v12))
          v16 = v31;
      }
      else
      {
        v16 = (v28 | (v12 >> 6)) + 33217;
      }
    }
    else
    {
      v16 = v12 + 1;
    }
    v34 = (v16 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * (4 - (__clz(v16) >> 3))));
    v17 = MEMORY[0x2494F74CC](&v34);
    v19 = v18;
    v34 = v14;
    v35 = v15;
    swift_bridgeObjectRetain();
    v20._countAndFlagsBits = v17;
    v20._object = v19;
    String.append(_:)(v20);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (v12 > 0x7F)
    {
      v29 = (v12 & 0x3F) << 8;
      if (v12 >= 0x800)
      {
        v32 = (v29 | (v12 >> 6) & 0x3F) << 8;
        v33 = (((v32 | (v12 >> 12) & 0x3F) << 8) | (v12 >> 18)) - 2122219023;
        v21 = (v32 | (v12 >> 12)) + 8487393;
        if (HIWORD(v12))
          v21 = v33;
      }
      else
      {
        v21 = (v29 | (v12 >> 6)) + 33217;
      }
    }
    else
    {
      v21 = v12 + 1;
    }
    v34 = (v21 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * (4 - (__clz(v21) >> 3))));
    v22 = MEMORY[0x2494F74CC](&v34);
    v24 = v23;
    v34 = v11;
    v35 = v10;
    swift_bridgeObjectRetain();
    v25._countAndFlagsBits = v22;
    v25._object = v24;
    String.append(_:)(v25);
  }
  result = swift_bridgeObjectRelease();
  v27 = v35;
  *a3 = v34;
  a3[1] = v27;
  return result;
}

void specialized Sequence.reduce<A>(_:_:)(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  unsigned int v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unsigned int v31;

  v30 = a2;
  v29 = a1;
  v26 = a4 >> 14;
  if (a4 >> 14 == a3 >> 14)
  {
    swift_bridgeObjectRetain();
    return;
  }
  v23 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v24 = a6 & 0xFFFFFFFFFFFFFFLL;
  v11 = (a5 >> 59) & 1;
  if ((a6 & 0x1000000000000000) == 0)
    LOBYTE(v11) = 1;
  v12 = 4 << v11;
  if ((a6 & 0x2000000000000000) != 0)
    v13 = HIBYTE(a6) & 0xF;
  else
    v13 = a5 & 0xFFFFFFFFFFFFLL;
  v25 = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14 = a3;
  while (1)
  {
    _StringGuts.validateScalarIndex(_:in:)(v14, a3, a4, a5, a6);
    if ((a6 & 0x1000000000000000) != 0)
    {
      v15 = _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
    }
    else
    {
      if ((a6 & 0x2000000000000000) != 0)
      {
        v27 = a5;
        v28 = v24;
      }
      else if ((a5 & 0x1000000000000000) == 0)
      {
        _StringObject.sharedUTF8.getter();
      }
      v15 = _decodeScalar(_:startingAt:)();
    }
    v16 = v15;
    if ((v14 & 0xC) != v12 && (v14 & 1) != 0)
      break;
    if ((v14 & 0xC) == v12)
    {
      _StringGuts._slowEnsureMatchingEncoding(_:)(v14, a5, a6);
      v14 = v22;
    }
    if (v25 <= v14 >> 16)
      goto LABEL_39;
    if ((v14 & 1) != 0)
      goto LABEL_24;
    v14 = v14 & 0xC | _StringGuts.scalarAlignSlow(_:)(v14, a5, a6) & 0xFFFFFFFFFFFFFFF3 | 1;
    if ((a6 & 0x1000000000000000) != 0)
    {
LABEL_34:
      v14 = String.UnicodeScalarView._foreignIndex(after:)();
      goto LABEL_35;
    }
LABEL_25:
    v17 = v14 >> 16;
    if ((a6 & 0x2000000000000000) != 0)
    {
      v27 = a5;
      v28 = v24;
      v19 = *((unsigned __int8 *)&v27 + v17);
    }
    else
    {
      v18 = v23;
      if ((a5 & 0x1000000000000000) == 0)
        v18 = _StringObject.sharedUTF8.getter();
      v19 = *(unsigned __int8 *)(v18 + v17);
    }
    v20 = (char)v19;
    v21 = __clz(v19 ^ 0xFF) - 24;
    if (v20 >= 0)
      LOBYTE(v21) = 1;
    v14 = ((v17 + v21) << 16) | 5;
LABEL_35:
    v31 = v16;
    closure #1 in String.splitByCapitalLetters()((uint64_t *)&v29, &v31, (uint64_t *)&v27);
    if (v6)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    swift_bridgeObjectRelease();
    v29 = v27;
    v30 = v28;
    if (v26 == v14 >> 14)
    {
      swift_bridgeObjectRelease();
      return;
    }
  }
  if (v25 > v14 >> 16)
  {
LABEL_24:
    if ((a6 & 0x1000000000000000) != 0)
      goto LABEL_34;
    goto LABEL_25;
  }
  __break(1u);
LABEL_39:
  __break(1u);
}

unint64_t _StringGuts.scalarAlignSlow(_:)(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  _QWORD v13[4];

  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    v5 = result >> 16;
    if ((a3 & 0x1000000000000000) != 0)
    {
      v10 = HIBYTE(a3) & 0xF;
      if ((a3 & 0x2000000000000000) == 0)
        v10 = a2 & 0xFFFFFFFFFFFFLL;
      if (v5 != v10)
        return _StringGuts.foreignScalarAlign(_:)();
    }
    else
    {
      v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((_BYTE *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            v9 = v5 - 1;
            v11 = *((_BYTE *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
        }
        else
        {
          v9 = result >> 16;
        }
        v5 = v9;
      }
      else
      {
        if ((a2 & 0x1000000000000000) != 0)
        {
          v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
          v7 = a2 & 0xFFFFFFFFFFFFLL;
        }
        else
        {
          v12 = result >> 16;
          v6 = _StringObject.sharedUTF8.getter();
          v5 = v12;
        }
        if (v5 != v7)
        {
          do
            v8 = *(_BYTE *)(v6 + v5--) & 0xC0;
          while (v8 == 128);
          ++v5;
        }
      }
      return v5 << 16;
    }
  }
  return result;
}

void _StringGuts.validateScalarIndex(_:in:)(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  char v9;
  unint64_t v10;
  unint64_t v11;

  v9 = (a5 & 0x1000000000000000) == 0 || (a4 & 0x800000000000000) != 0;
  v10 = a1 & 0xC;
  v11 = 4 << v9;
  if ((a1 & 1) == 0 || v10 == v11)
  {
LABEL_12:
    if (v10 == v11)
      _StringGuts._slowEnsureMatchingEncoding(_:)(a1, a4, a5);
    if (a1 >> 14 < a2 >> 14 || a1 >> 14 >= a3 >> 14)
    {
      __break(1u);
    }
    else if ((a1 & 1) != 0)
    {
      return;
    }
    _StringGuts.scalarAlignSlow(_:)(a1, a4, a5);
    return;
  }
  v10 = a1 >> 14;
  v11 = a3 >> 14;
  if (a1 >> 14 < a2 >> 14 || v10 >= v11)
  {
    __break(1u);
    goto LABEL_12;
  }
}

void _StringGuts.validateInclusiveScalarIndex(_:)(unint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((a1 & 1) == 0 || (a1 & 0xC) == 4 << v5)
    goto LABEL_9;
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 < a1 >> 16)
  {
    __break(1u);
LABEL_9:
    _StringGuts.validateInclusiveSubscalarIndex(_:)(a1, a2, a3);
    if ((v7 & 1) == 0)
      _StringGuts.scalarAlignSlow(_:)(v7, a2, a3);
  }
}

void _StringGuts.validateInclusiveSubscalarIndex(_:)(unint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((a1 & 0xC) == 4 << v5)
    _StringGuts._slowEnsureMatchingEncoding(_:)(a1, a2, a3);
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 < a1 >> 16)
    __break(1u);
}

void String.UnicodeScalarView.index(_:offsetBy:limitedBy:)(unint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  unint64_t v7;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  unsigned int v20;
  char *v21;
  unint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  char *v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  unint64_t v33;
  uint64_t v34;

  v7 = a3;
  v10 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0)
    LOBYTE(v10) = 1;
  v11 = 4 << v10;
  if ((a3 & 0xC) == 4 << v10)
  {
LABEL_55:
    _StringGuts._slowEnsureMatchingEncoding(_:)(v7, a4, a5);
    v7 = v30;
  }
  v12 = a1;
  if ((a1 & 0xC) == v11)
  {
    _StringGuts._slowEnsureMatchingEncoding(_:)(a1, a4, a5);
    v12 = v31;
  }
  _StringGuts.validateInclusiveScalarIndex(_:)(a1, a4, a5);
  v7 >>= 14;
  if (a2 < 0)
  {
    v11 = 0;
    a1 = v12 >> 14;
    v21 = (char *)&v32 + 6;
    do
    {
      if (a1 >= v7 && v7 >= v13 >> 14)
        break;
      if (v13 < 0x10000)
      {
LABEL_54:
        __break(1u);
        goto LABEL_55;
      }
      if ((a5 & 0x1000000000000000) != 0)
      {
        v29 = v21;
        v13 = String.UnicodeScalarView._foreignIndex(before:)();
        v21 = v29;
      }
      else
      {
        v23 = v13 >> 16;
        if ((a5 & 0x2000000000000000) != 0)
        {
          v33 = a4;
          v34 = a5 & 0xFFFFFFFFFFFFFFLL;
          if ((*((_BYTE *)&v33 + v23 - 1) & 0xC0) == 0x80)
          {
            v26 = 0;
            do
              v27 = v21[v23 + v26--] & 0xC0;
            while (v27 == 128);
            v28 = 1 - v26;
          }
          else
          {
            v28 = 1;
          }
          v23 -= v28;
        }
        else
        {
          v24 = (a5 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a4 & 0x1000000000000000) == 0)
          {
            v32 = v21;
            v24 = _StringObject.sharedUTF8.getter();
            v21 = v32;
          }
          do
            v25 = *(_BYTE *)(v24 - 1 + v23--) & 0xC0;
          while (v25 == 128);
        }
        v13 = (v23 << 16) | 5;
      }
      --v11;
    }
    while (v11 > a2);
  }
  else
  {
    a1 = v12 >> 14;
    if (a2)
    {
      if ((a5 & 0x2000000000000000) != 0)
        v14 = HIBYTE(a5) & 0xF;
      else
        v14 = a4 & 0xFFFFFFFFFFFFLL;
      v11 = a5 & 0xFFFFFFFFFFFFFFLL;
      do
      {
        if (v7 >= a1 && v13 >> 14 >= v7)
          break;
        v16 = v13 >> 16;
        if (v13 >> 16 >= v14)
        {
          __break(1u);
          goto LABEL_54;
        }
        if ((a5 & 0x1000000000000000) != 0)
        {
          v13 = String.UnicodeScalarView._foreignIndex(after:)();
        }
        else
        {
          if ((a5 & 0x2000000000000000) != 0)
          {
            v33 = a4;
            v34 = a5 & 0xFFFFFFFFFFFFFFLL;
            v18 = *((unsigned __int8 *)&v33 + v16);
          }
          else
          {
            v17 = (a5 & 0xFFFFFFFFFFFFFFFLL) + 32;
            if ((a4 & 0x1000000000000000) == 0)
              v17 = _StringObject.sharedUTF8.getter();
            v18 = *(unsigned __int8 *)(v17 + v16);
          }
          v19 = (char)v18;
          v20 = __clz(v18 ^ 0xFF) - 24;
          if (v19 >= 0)
            LOBYTE(v20) = 1;
          v13 = ((v16 + v20) << 16) | 5;
        }
        --a2;
      }
      while (a2);
    }
  }
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t SearchGlobalEntity.Timestamp.seconds.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void SearchGlobalEntity.Timestamp.timezone.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

BOOL static SearchGlobalEntity.Timestamp.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  BOOL v12;

  v4 = *(_BYTE *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_BYTE *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a2 + 40);
  if ((v4 & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 8))
      return 0;
  }
  else
  {
    if (*(_QWORD *)a1 == *(_QWORD *)a2)
      v10 = *(_BYTE *)(a2 + 8);
    else
      v10 = 1;
    if ((v10 & 1) != 0)
      return 0;
  }
  if ((v6 & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 24))
      return 0;
  }
  else
  {
    if (v5 == *(_QWORD *)(a2 + 16))
      v11 = *(_BYTE *)(a2 + 24);
    else
      v11 = 1;
    if ((v11 & 1) != 0)
      return 0;
  }
  if (v8)
  {
    if (!v9)
      return 0;
    v12 = v7 == *(_QWORD *)(a2 + 32) && v8 == v9;
    return v12 || (OUTLINED_FUNCTION_23() & 1) != 0;
  }
  return !v9;
}

uint64_t SearchGlobalEntity.Timestamp.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v8;

  v2 = a1 == 0x73646E6F636573 && a2 == 0xE700000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x657366664F637475 && a2 == 0xE900000000000074;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x656E6F7A656D6974 && a2 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t SearchGlobalEntity.Timestamp.CodingKeys.stringValue.getter(char a1)
{
  if (!a1)
    return 0x73646E6F636573;
  if (a1 == 1)
    return 0x657366664F637475;
  return 0x656E6F7A656D6974;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SearchGlobalEntity.Timestamp.CodingKeys()
{
  char *v0;

  return SearchGlobalEntity.Timestamp.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.Timestamp.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = SearchGlobalEntity.Timestamp.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.Timestamp.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.Timestamp.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys();
  return CodingKey.debugDescription.getter();
}

void SearchGlobalEntity.Timestamp.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  OUTLINED_FUNCTION_2();
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.Timestamp.CodingKeys>);
  OUTLINED_FUNCTION_102();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_10();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys();
  OUTLINED_FUNCTION_120();
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v1)
  {
    OUTLINED_FUNCTION_157();
    OUTLINED_FUNCTION_118();
    OUTLINED_FUNCTION_194();
    OUTLINED_FUNCTION_36();
  }
  OUTLINED_FUNCTION_47(v2, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  OUTLINED_FUNCTION_156();
  OUTLINED_FUNCTION_0_0();
}

void SearchGlobalEntity.Timestamp.init(from:)()
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
  char v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.Timestamp.CodingKeys>);
  OUTLINED_FUNCTION_56();
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_54();
  lazy protocol witness table accessor for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys();
  OUTLINED_FUNCTION_85();
  if (!v0)
  {
    v8 = OUTLINED_FUNCTION_84();
    v10 = v9;
    v11 = OUTLINED_FUNCTION_84();
    v19 = v12;
    v18 = v11;
    v13 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    v14 = (uint64_t)v7;
    v16 = v15;
    OUTLINED_FUNCTION_113(v14, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    *(_QWORD *)v5 = v8;
    *(_BYTE *)(v5 + 8) = v10 & 1;
    *(_QWORD *)(v5 + 16) = v18;
    *(_BYTE *)(v5 + 24) = v19 & 1;
    *(_QWORD *)(v5 + 32) = v13;
    *(_QWORD *)(v5 + 40) = v16;
  }
  __swift_destroy_boxed_opaque_existential_1Tm(v3);
  OUTLINED_FUNCTION_0_0();
}

uint64_t SearchGlobalEntity.Timestamp.init(seconds:utcOffset:timezone:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  *(_QWORD *)a7 = result;
  *(_BYTE *)(a7 + 8) = a2 & 1;
  *(_QWORD *)(a7 + 16) = a3;
  *(_BYTE *)(a7 + 24) = a4 & 1;
  *(_QWORD *)(a7 + 32) = a5;
  *(_QWORD *)(a7 + 40) = a6;
  return result;
}

void protocol witness for Decodable.init(from:) in conformance SearchGlobalEntity.Timestamp()
{
  SearchGlobalEntity.Timestamp.init(from:)();
}

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity.Timestamp()
{
  SearchGlobalEntity.Timestamp.encode(to:)();
}

void SearchGlobalEntity.Temperature.units.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

uint64_t static SearchGlobalEntity.Temperature.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v2;
  char v3;
  uint64_t v4;
  double v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t result;
  char v11;
  char v12;

  v2 = *(double *)(a1 + 16);
  v3 = *(_BYTE *)(a1 + 24);
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(double *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  if (!*(_QWORD *)(a1 + 8))
  {
    if (!v4)
      goto LABEL_10;
    return 0;
  }
  if (!v4)
    return 0;
  OUTLINED_FUNCTION_97(a1);
  v9 = v9 && v7 == v8;
  if (v9 || (OUTLINED_FUNCTION_23(), result = OUTLINED_FUNCTION_34(), (v11 & 1) != 0))
  {
LABEL_10:
    if ((v3 & 1) != 0)
    {
      if ((v6 & 1) == 0)
        return 0;
    }
    else
    {
      if (v2 == v5)
        v12 = v6;
      else
        v12 = 1;
      if ((v12 & 1) != 0)
        return 0;
    }
    return 1;
  }
  return result;
}

BOOL static SearchGlobalEntity.Temperature.CodingKeys.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void SearchGlobalEntity.Temperature.CodingKeys.hash(into:)(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

uint64_t SearchGlobalEntity.Temperature.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x7374696E75 && a2 == 0xE500000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t SearchGlobalEntity.Temperature.CodingKeys.init(intValue:)()
{
  return 2;
}

uint64_t SearchGlobalEntity.Temperature.CodingKeys.stringValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x65756C6176;
  else
    return 0x7374696E75;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SearchGlobalEntity.Temperature.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static SearchGlobalEntity.Temperature.CodingKeys.== infix(_:_:)(*a1, *a2);
}

void protocol witness for Hashable.hashValue.getter in conformance SearchGlobalEntity.Temperature.CodingKeys()
{
  char *v0;

  SearchGlobalEntity.Temperature.CodingKeys.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance SearchGlobalEntity.Temperature.CodingKeys(uint64_t a1)
{
  char *v1;

  SearchGlobalEntity.Temperature.CodingKeys.hash(into:)(a1, *v1);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SearchGlobalEntity.Temperature.CodingKeys()
{
  char *v0;

  return SearchGlobalEntity.Temperature.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.Temperature.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = SearchGlobalEntity.Temperature.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance SearchGlobalEntity.Temperature.CodingKeys()
{
  return SearchGlobalEntity.EntityType.CodingKeys.intValue.getter();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance SearchGlobalEntity.Temperature.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = SearchGlobalEntity.Temperature.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.Temperature.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.Temperature.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys();
  return CodingKey.debugDescription.getter();
}

void SearchGlobalEntity.Temperature.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.Temperature.CodingKeys>)
                 - 8);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_126();
  OUTLINED_FUNCTION_100(v3);
  lazy protocol witness table accessor for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys();
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_36();
  if (!v0)
  {
    OUTLINED_FUNCTION_157();
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  }
  OUTLINED_FUNCTION_81(v1, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_156();
  OUTLINED_FUNCTION_0_0();
}

void SearchGlobalEntity.Temperature.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);

  OUTLINED_FUNCTION_2();
  a22 = v24;
  a23 = v25;
  v27 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.Temperature.CodingKeys>);
  OUTLINED_FUNCTION_56();
  MEMORY[0x24BDAC7A8]();
  v29 = (char *)&a9 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_54();
  lazy protocol witness table accessor for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys();
  OUTLINED_FUNCTION_85();
  if (v23)
  {
    OUTLINED_FUNCTION_214();
  }
  else
  {
    a13 = 0;
    v30 = OUTLINED_FUNCTION_80();
    v32 = v31;
    a12 = 1;
    OUTLINED_FUNCTION_53();
    KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    v33 = OUTLINED_FUNCTION_203();
    OUTLINED_FUNCTION_47(v33, v34);
    *(_QWORD *)v27 = v30;
    *(_QWORD *)(v27 + 8) = v32;
    *(_QWORD *)(v27 + 16) = v29;
    *(_BYTE *)(v27 + 24) = v29 & 1;
    OUTLINED_FUNCTION_214();
    OUTLINED_FUNCTION_139();
  }
  OUTLINED_FUNCTION_177();
  OUTLINED_FUNCTION_0_0();
}

OmniSearchTypes::SearchGlobalEntity::Temperature __swiftcall SearchGlobalEntity.Temperature.init(units:value:)(Swift::String_optional units, Swift::Double_optional value)
{
  char v2;
  uint64_t v3;
  OmniSearchTypes::SearchGlobalEntity::Temperature result;

  *(Swift::String_optional *)v3 = units;
  *(_QWORD *)(v3 + 16) = *(_QWORD *)&value.is_nil;
  *(_BYTE *)(v3 + 24) = v2 & 1;
  result.units = units;
  result.value.value = value.value;
  result.value.is_nil = value.is_nil;
  return result;
}

#error "24338AC28: call analysis failed (funcsize=5)"

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity.Temperature()
{
  SearchGlobalEntity.Temperature.encode(to:)();
}

uint64_t SearchGlobalEntity.GeneralAttributes.alternateNames.getter()
{
  return swift_bridgeObjectRetain();
}

void SearchGlobalEntity.GeneralAttributes.alternateNames.setter(uint64_t a1)
{
  _QWORD *v1;

  swift_bridgeObjectRelease();
  *v1 = a1;
  OUTLINED_FUNCTION_5();
}

uint64_t (*SearchGlobalEntity.GeneralAttributes.alternateNames.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.GeneralAttributes.contentURL.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.GeneralAttributes.contentURL.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = v2;
  *(_QWORD *)(v1 + 16) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.GeneralAttributes.contentURL.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.GeneralAttributes.displayName.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.GeneralAttributes.displayName.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = v2;
  *(_QWORD *)(v1 + 32) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.GeneralAttributes.displayName.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.GeneralAttributes.thumbnailData.getter()
{
  uint64_t v0;

  outlined copy of Data?(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.GeneralAttributes.thumbnailData.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_51();
  outlined consume of Data?(*(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
  *(_QWORD *)(v1 + 40) = v2;
  *(_QWORD *)(v1 + 48) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.GeneralAttributes.thumbnailData.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.GeneralAttributes.title.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.GeneralAttributes.title.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_78();
  *(_QWORD *)(v1 + 56) = v2;
  *(_QWORD *)(v1 + 64) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.GeneralAttributes.title.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

uint64_t static SearchGlobalEntity.GeneralAttributes.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t result;
  char v14;
  char v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  BOOL v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v27 = *(_QWORD *)(a1 + 8);
  v28 = *(_QWORD *)(a1 + 16);
  v25 = *(_QWORD *)(a1 + 32);
  v26 = *(_QWORD *)(a1 + 24);
  v2 = *(_QWORD *)(a1 + 56);
  v23 = *(_QWORD *)(a1 + 40);
  v24 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  if ((specialized static Array<A>.== infix(_:_:)(*(_QWORD **)a1, *(_QWORD **)a2) & 1) == 0)
    return 0;
  if (!v28)
  {
    if (v5)
      return 0;
    goto LABEL_11;
  }
  if (!v5)
    return 0;
  v12 = v27 == v4 && v28 == v5;
  if (v12 || (OUTLINED_FUNCTION_23(), result = OUTLINED_FUNCTION_34(), (v14 & 1) != 0))
  {
LABEL_11:
    if (v25)
    {
      if (!v7)
        return 0;
      if (v26 != v6 || v25 != v7)
      {
        OUTLINED_FUNCTION_23();
        result = OUTLINED_FUNCTION_34();
        if ((v16 & 1) == 0)
          return result;
      }
    }
    else if (v7)
    {
      return 0;
    }
    if (v24 >> 60 == 15)
    {
      v17 = v8;
      if (v9 >> 60 == 15)
      {
LABEL_26:
        if (v3)
        {
          if (v11)
          {
            v22 = v2 == v10 && v3 == v11;
            if (v22 || (OUTLINED_FUNCTION_23() & 1) != 0)
              return 1;
          }
        }
        else if (!v11)
        {
          return 1;
        }
        return 0;
      }
    }
    else
    {
      v17 = v8;
      if (v9 >> 60 != 15)
      {
        v20 = OUTLINED_FUNCTION_125();
        v21 = MEMORY[0x2494F704C](v20);
        OUTLINED_FUNCTION_167(v8);
        outlined consume of Data?(v23, v24);
        if ((v21 & 1) == 0)
          return 0;
        goto LABEL_26;
      }
    }
    v18 = OUTLINED_FUNCTION_125();
    outlined consume of Data?(v18, v19);
    OUTLINED_FUNCTION_167(v17);
    return 0;
  }
  return result;
}

uint64_t specialized static Array<A>.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double *v3;
  uint64_t *i;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  char v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  double v56;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v3 = (double *)(a2 + 72);
  for (i = (uint64_t *)(a1 + 40); ; i += 6)
  {
    v6 = *(i - 1);
    v5 = *i;
    v7 = i[2];
    v8 = i[4];
    v10 = *((_QWORD *)v3 - 5);
    v9 = *((_QWORD *)v3 - 4);
    v11 = *((uint64_t *)v3 - 3);
    v54 = i[1];
    v55 = *((_QWORD *)v3 - 2);
    v12 = v55 >> 62;
    v56 = *v3;
    if (!(v7 >> 62))
    {
      if (v12)
        goto LABEL_56;
      if (v6 != v10 || v5 != v9)
      {
        v14 = *((_QWORD *)v3 - 4);
        v46 = _stringCompareWithSmolCheck(_:_:expecting:)();
        outlined copy of SearchGlobalEntity.CustomAttribute(v10, v14, v11, v55);
        outlined copy of SearchGlobalEntity.CustomAttribute(v6, v5, v54, v7);
        outlined consume of SearchGlobalEntity.CustomAttribute(v6, v5, v54, v7);
        outlined consume of SearchGlobalEntity.CustomAttribute(v10, v14, v11, v55);
        if ((v46 & 1) == 0)
          return 0;
        goto LABEL_54;
      }
      outlined copy of SearchGlobalEntity.CustomAttribute(v6, v5, v11, v55);
      outlined copy of SearchGlobalEntity.CustomAttribute(v6, v5, v54, v7);
      outlined consume of SearchGlobalEntity.CustomAttribute(v6, v5, v54, v7);
      v19 = v6;
      v20 = v5;
      v21 = v11;
      v22 = v55;
      goto LABEL_50;
    }
    if (v7 >> 62 == 1)
      break;
    if (v12 != 2)
    {
LABEL_56:
      v34 = *((_QWORD *)v3 - 3);
      v35 = v55;
      v49 = v10;
      v51 = v9;
      outlined copy of SearchGlobalEntity.CustomAttribute(v10, v9, v11, v55);
      v36 = v6;
      v37 = v5;
      v38 = v54;
      v39 = v54;
      v40 = v7;
      goto LABEL_64;
    }
    if (v5)
    {
      if (!v9)
      {
        outlined copy of SearchGlobalEntity.CustomAttribute(v10, 0, v11, v55);
        outlined copy of SearchGlobalEntity.CustomAttribute(v6, v5, v54, v7);
        outlined consume of SearchGlobalEntity.CustomAttribute(v6, v5, v54, v7);
        v41 = v10;
        v42 = 0;
        v43 = v11;
        v44 = v55;
        goto LABEL_65;
      }
      if (v6 != v10 || v5 != v9)
      {
        v16 = *((_QWORD *)v3 - 5);
        v48 = v16;
        v17 = *((_QWORD *)v3 - 4);
        v47 = _stringCompareWithSmolCheck(_:_:expecting:)();
        outlined copy of SearchGlobalEntity.CustomAttribute(v16, v17, v11, v55);
        outlined copy of SearchGlobalEntity.CustomAttribute(v6, v5, v54, v7);
        outlined consume of SearchGlobalEntity.CustomAttribute(v6, v5, v54, v7);
        v18 = *(double *)&v11;
        outlined consume of SearchGlobalEntity.CustomAttribute(v48, v17, v11, v55);
        if ((v47 & 1) == 0)
          return 0;
        if ((v7 & 1) != 0)
        {
LABEL_53:
          if ((v55 & 1) == 0)
            return 0;
          goto LABEL_54;
        }
        goto LABEL_28;
      }
      outlined copy of SearchGlobalEntity.CustomAttribute(v6, v5, v11, v55);
      outlined copy of SearchGlobalEntity.CustomAttribute(v6, v5, v54, v7);
      outlined consume of SearchGlobalEntity.CustomAttribute(v6, v5, v54, v7);
      v29 = v6;
      v30 = v5;
      v18 = *(double *)&v11;
      v31 = v11;
      v32 = v55;
    }
    else
    {
      if (v9)
      {
        v45 = *((_QWORD *)v3 - 4);
        swift_bridgeObjectRetain();
        outlined consume of SearchGlobalEntity.CustomAttribute(v6, 0, v54, v7);
        v41 = v10;
        v42 = v45;
        v43 = v11;
        v44 = v55;
        goto LABEL_65;
      }
      v28 = *(v3 - 3);
      outlined consume of SearchGlobalEntity.CustomAttribute(v6, 0, v54, v7);
      v29 = v10;
      v30 = 0;
      v18 = v28;
      v31 = *(_QWORD *)&v28;
      v32 = v55;
    }
    outlined consume of SearchGlobalEntity.CustomAttribute(v29, v30, v31, v32);
    if ((v7 & 1) != 0)
      goto LABEL_53;
LABEL_28:
    if ((v55 & 1) != 0 || *(double *)&v54 != v18)
      return 0;
LABEL_54:
    v3 += 6;
    if (!--v2)
      return 1;
  }
  if (v12 != 1)
    goto LABEL_56;
  v50 = *i;
  v51 = *((_QWORD *)v3 - 4);
  if ((v5 & 1) != 0)
  {
    if ((v9 & 1) == 0)
      goto LABEL_63;
  }
  else if ((v9 & 1) != 0 || v6 != v10)
  {
    goto LABEL_63;
  }
  if ((v7 & 1) != 0)
  {
    if ((v55 & 1) == 0)
      goto LABEL_63;
  }
  else if ((v55 & 1) != 0 || v54 != v11)
  {
    goto LABEL_63;
  }
  v52 = i[2];
  v53 = *((uint64_t *)v3 - 3);
  if (v8)
  {
    if (v56 == 0.0)
      goto LABEL_63;
    v23 = *(i - 1);
    v24 = i[1];
    if (i[3] != *((_QWORD *)v3 - 1) || v8 != *(_QWORD *)&v56)
    {
      v26 = *((_QWORD *)v3 - 4);
      v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
      v9 = v26;
      v11 = v53;
      if ((v27 & 1) == 0)
      {
        v7 = v52;
        goto LABEL_62;
      }
    }
LABEL_49:
    outlined copy of SearchGlobalEntity.CustomAttribute(v10, v9, v11, v55);
    outlined copy of SearchGlobalEntity.CustomAttribute(v23, v50, v24, v52);
    outlined consume of SearchGlobalEntity.CustomAttribute(v23, v50, v24, v52);
    v19 = v10;
    v20 = v51;
    v21 = v53;
    v22 = v55;
LABEL_50:
    outlined consume of SearchGlobalEntity.CustomAttribute(v19, v20, v21, v22);
    goto LABEL_54;
  }
  v23 = *(i - 1);
  v24 = i[1];
  if (v56 == 0.0)
    goto LABEL_49;
  v7 = i[2];
LABEL_62:
  v6 = v23;
LABEL_63:
  v49 = v10;
  v34 = v11;
  v35 = v55;
  outlined copy of SearchGlobalEntity.CustomAttribute(v10, v9, v11, v55);
  v36 = v6;
  v5 = v50;
  v37 = v50;
  v38 = v54;
  v39 = v54;
  v40 = v7;
LABEL_64:
  outlined copy of SearchGlobalEntity.CustomAttribute(v36, v37, v39, v40);
  outlined consume of SearchGlobalEntity.CustomAttribute(v6, v5, v38, v7);
  v41 = v49;
  v42 = v51;
  v43 = v34;
  v44 = v35;
LABEL_65:
  outlined consume of SearchGlobalEntity.CustomAttribute(v41, v42, v43, v44);
  return 0;
}

uint64_t specialized static Array<A>.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  unint64_t v2;
  uint64_t result;
  char v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  result = a1[4];
  if (result != a2[4] || a1[5] != a2[5])
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    result = 0;
    if ((v7 & 1) == 0)
      return result;
  }
  if (v2 == 1)
    return 1;
  v8 = a2 + 7;
  v9 = a1 + 7;
  v10 = 1;
  while (v10 < v2)
  {
    result = *(v9 - 1);
    if (result != *(v8 - 1) || *v9 != *v8)
    {
      result = _stringCompareWithSmolCheck(_:_:expecting:)();
      if ((result & 1) == 0)
        return 0;
    }
    ++v10;
    v8 += 2;
    v9 += 2;
    if (v2 == v10)
      return 1;
  }
  __break(1u);
  return result;
}

uint64_t SearchGlobalEntity.GeneralAttributes.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  char v10;

  v2 = a1 == 0x74616E7265746C61 && a2 == 0xEE0073656D614E65;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x55746E65746E6F63 && a2 == 0xEA00000000004C52;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x69616E626D756874 && a2 == 0xED0000617461446CLL;
        if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0x656C746974 && a2 == 0xE500000000000000)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if ((v10 & 1) != 0)
            return 4;
          else
            return 5;
        }
      }
    }
  }
}

uint64_t SearchGlobalEntity.GeneralAttributes.CodingKeys.init(intValue:)()
{
  return 5;
}

uint64_t SearchGlobalEntity.GeneralAttributes.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_24338BA04 + 4 * byte_2433A8020[a1]))(0x74616E7265746C61, 0xEE0073656D614E65);
}

uint64_t sub_24338BA04()
{
  return 0x55746E65746E6F63;
}

uint64_t sub_24338BA20()
{
  return 0x4E79616C70736964;
}

uint64_t sub_24338BA40()
{
  return 0x69616E626D756874;
}

uint64_t sub_24338BA64()
{
  return 0x656C746974;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SearchGlobalEntity.GeneralAttributes.CodingKeys()
{
  unsigned __int8 *v0;

  return SearchGlobalEntity.GeneralAttributes.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.GeneralAttributes.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = SearchGlobalEntity.GeneralAttributes.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance SearchGlobalEntity.GeneralAttributes.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = SearchGlobalEntity.GeneralAttributes.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.GeneralAttributes.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.GeneralAttributes.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys();
  return CodingKey.debugDescription.getter();
}

void SearchGlobalEntity.GeneralAttributes.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  OUTLINED_FUNCTION_2();
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.GeneralAttributes.CodingKeys>);
  OUTLINED_FUNCTION_56();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_10();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys();
  OUTLINED_FUNCTION_120();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  lazy protocol witness table accessor for type [String] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type [String] and conformance <A> [A]);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v0)
  {
    OUTLINED_FUNCTION_82();
    OUTLINED_FUNCTION_82();
    lazy protocol witness table accessor for type Data and conformance Data();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    OUTLINED_FUNCTION_82();
  }
  OUTLINED_FUNCTION_81(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_0_0();
}

uint64_t SearchGlobalEntity.GeneralAttributes.init(alternateNames:contentURL:displayName:thumbnailData:title:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  a9[8] = a10;
  return result;
}

void SearchGlobalEntity.GeneralAttributes.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  OUTLINED_FUNCTION_2();
  v4 = v3;
  v6 = v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.GeneralAttributes.CodingKeys>);
  OUTLINED_FUNCTION_153();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_100(v4);
  lazy protocol witness table accessor for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v0)
  {
    OUTLINED_FUNCTION_155();
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_31();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    lazy protocol witness table accessor for type [String] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type [String] and conformance <A> [A]);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    OUTLINED_FUNCTION_64();
    v18 = OUTLINED_FUNCTION_63();
    v19 = v20;
    LOBYTE(v20) = 2;
    v9 = v8;
    OUTLINED_FUNCTION_53();
    v10 = OUTLINED_FUNCTION_63();
    v12 = v11;
    v17 = v10;
    lazy protocol witness table accessor for type Data and conformance Data();
    OUTLINED_FUNCTION_64();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    OUTLINED_FUNCTION_205();
    v13 = OUTLINED_FUNCTION_63();
    v15 = v14;
    v16 = v13;
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v7);
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_149();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_181();
    OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_205();
    OUTLINED_FUNCTION_86();
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_139();
    OUTLINED_FUNCTION_31();
    *v6 = v19;
    v6[1] = v18;
    v6[2] = v9;
    v6[3] = v17;
    v6[4] = v12;
    v6[5] = v20;
    v6[6] = v21;
    v6[7] = v16;
    v6[8] = v15;
    OUTLINED_FUNCTION_155();
    OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_139();
    OUTLINED_FUNCTION_18();
  }
  OUTLINED_FUNCTION_86();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_0();
}

void protocol witness for Decodable.init(from:) in conformance SearchGlobalEntity.GeneralAttributes()
{
  SearchGlobalEntity.GeneralAttributes.init(from:)();
}

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity.GeneralAttributes()
{
  SearchGlobalEntity.GeneralAttributes.encode(to:)();
}

BOOL static SearchGlobalEntity.CustomAttribute.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  double v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  unint64_t v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  uint64_t v95;

  v3 = *a1;
  v2 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  v6 = a1[4];
  v7 = a1[5];
  v8 = *a2;
  v9 = a2[1];
  v10 = a2[2];
  v11 = a2[3];
  v12 = a2[4];
  if (!(v5 >> 62))
  {
    if (!(v11 >> 62))
    {
      v19 = a1[2];
      v20 = a2[2];
      if (v3 == v8 && v2 == v9)
      {
        v15 = 1;
      }
      else
      {
        OUTLINED_FUNCTION_123();
        v22 = v11;
        v24 = v23;
        v25 = _stringCompareWithSmolCheck(_:_:expecting:)();
        v8 = v24;
        v11 = v22;
        v15 = v25;
      }
      v79 = v8;
      outlined copy of SearchGlobalEntity.CustomAttribute(v8, v9, v20, v11);
      v52 = OUTLINED_FUNCTION_123();
      outlined copy of SearchGlobalEntity.CustomAttribute(v52, v53, v19, v5);
      v54 = OUTLINED_FUNCTION_166();
      outlined consume of SearchGlobalEntity.CustomAttribute(v54, v55, v56, v57);
      v16 = v79;
      v17 = v9;
      v18 = v20;
      goto LABEL_25;
    }
    goto LABEL_20;
  }
  if (v5 >> 62 == 1)
  {
    if (v11 >> 62 == 1)
    {
      v80 = *a1;
      v89 = a2[5];
      v90 = v3;
      v91 = v2 & 1;
      v92 = v4;
      v93 = v5 & 1;
      v94 = v6;
      v95 = v7;
      v84 = v8;
      v85 = v9 & 1;
      v86 = v10;
      v87 = v11 & 1;
      v88 = v12;
      v81 = v4;
      v13 = v8;
      v14 = v10;
      v15 = static SearchGlobalEntity.Timestamp.== infix(_:_:)((uint64_t)&v90, (uint64_t)&v84);
      OUTLINED_FUNCTION_105(v13);
      OUTLINED_FUNCTION_159(v80, v2, v81);
      OUTLINED_FUNCTION_158(v80, v2, v81);
      v16 = v13;
      v17 = v9;
      v18 = v14;
LABEL_25:
      OUTLINED_FUNCTION_137(v16, v17, v18);
      return v15;
    }
    goto LABEL_20;
  }
  if (v11 >> 62 != 2)
  {
LABEL_20:
    v83 = a2[3];
    v38 = *a2;
    v39 = a2[2];
    outlined copy of SearchGlobalEntity.CustomAttribute(*a2, a2[1], v10, v83);
    v40 = OUTLINED_FUNCTION_124();
    outlined copy of SearchGlobalEntity.CustomAttribute(v40, v41, v42, v43);
    v44 = OUTLINED_FUNCTION_124();
    outlined consume of SearchGlobalEntity.CustomAttribute(v44, v45, v46, v47);
    v48 = v38;
    v49 = v9;
    v50 = v39;
    v51 = v83;
LABEL_21:
    outlined consume of SearchGlobalEntity.CustomAttribute(v48, v49, v50, v51);
    return 0;
  }
  if (!v2)
  {
    if (!v9)
    {
      v82 = *((double *)a1 + 2);
      v76 = *a2;
      v77 = *((double *)a2 + 2);
      outlined consume of SearchGlobalEntity.CustomAttribute(*a1, 0, v4, v5);
      v72 = v76;
      v73 = 0;
      v37 = v77;
      v74 = *(_QWORD *)&v77;
      v75 = v11;
      goto LABEL_33;
    }
    v59 = *a2;
    v60 = a2[2];
    swift_bridgeObjectRetain();
LABEL_30:
    v64 = OUTLINED_FUNCTION_123();
    OUTLINED_FUNCTION_158(v64, v65, v66);
    v48 = v59;
    v49 = v9;
    v50 = v60;
    v51 = v11;
    goto LABEL_21;
  }
  if (!v9)
  {
    v61 = a1[2];
    v59 = *a2;
    v60 = a2[2];
    outlined copy of SearchGlobalEntity.CustomAttribute(*a2, 0, v10, v11);
    v62 = OUTLINED_FUNCTION_123();
    OUTLINED_FUNCTION_159(v62, v63, v61);
    v9 = 0;
    goto LABEL_30;
  }
  v82 = *((double *)a1 + 2);
  if (v3 == v8 && v2 == v9)
  {
    v67 = *((double *)a2 + 2);
    outlined copy of SearchGlobalEntity.CustomAttribute(v3, v2, v10, v11);
    v68 = OUTLINED_FUNCTION_165();
    outlined copy of SearchGlobalEntity.CustomAttribute(v68, v69, v70, v71);
    outlined consume of SearchGlobalEntity.CustomAttribute(v3, v2, v12, v5);
    v72 = OUTLINED_FUNCTION_123();
    v37 = v67;
    v74 = *(_QWORD *)&v67;
    v75 = v11;
LABEL_33:
    outlined consume of SearchGlobalEntity.CustomAttribute(v72, v73, v74, v75);
    goto LABEL_34;
  }
  v27 = *a2;
  v28 = a2[2];
  v78 = _stringCompareWithSmolCheck(_:_:expecting:)();
  OUTLINED_FUNCTION_105(v27);
  v29 = OUTLINED_FUNCTION_165();
  outlined copy of SearchGlobalEntity.CustomAttribute(v29, v30, v31, v32);
  v33 = OUTLINED_FUNCTION_166();
  outlined consume of SearchGlobalEntity.CustomAttribute(v33, v34, v35, v36);
  v37 = *(double *)&v28;
  OUTLINED_FUNCTION_137(v27, v9, v28);
  if ((v78 & 1) != 0)
  {
LABEL_34:
    if ((v5 & 1) != 0)
    {
      if ((v11 & 1) == 0)
        return 0;
    }
    else if ((v11 & 1) != 0 || v82 != v37)
    {
      return 0;
    }
    return 1;
  }
  return 0;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.Timestamp.CodingKeys, &unk_2513D8148);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.Timestamp.CodingKeys, &unk_2513D8148);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.Timestamp.CodingKeys, &unk_2513D8148);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.Timestamp.CodingKeys, &unk_2513D8148);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp.CodingKeys and conformance SearchGlobalEntity.Timestamp.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.Temperature.CodingKeys, &unk_2513D80B8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.Temperature.CodingKeys, &unk_2513D80B8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.Temperature.CodingKeys, &unk_2513D80B8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.Temperature.CodingKeys, &unk_2513D80B8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature.CodingKeys and conformance SearchGlobalEntity.Temperature.CodingKeys);
  }
  return result;
}

uint64_t outlined copy of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined copy of Data._Representation(a1, a2);
  return a1;
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

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined consume of Data._Representation(a1, a2);
  return a1;
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

uint64_t SearchGlobalEntity.CustomAttribute.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v8;

  v2 = a1 == 0x676E69727473 && a2 == 0xE600000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x74617265706D6574 && a2 == 0xEB00000000657275)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t SearchGlobalEntity.CustomAttribute.CodingKeys.stringValue.getter(char a1)
{
  if (!a1)
    return 0x676E69727473;
  if (a1 == 1)
    return 0x6D617473656D6974;
  return 0x74617265706D6574;
}

uint64_t static SearchGlobalEntity.CustomAttribute.StringCodingKeys.== infix(_:_:)()
{
  return 1;
}

void SearchGlobalEntity.CustomAttribute.StringCodingKeys.hash(into:)()
{
  Hasher._combine(_:)(0);
}

uint64_t SearchGlobalEntity.CustomAttribute.StringCodingKeys.stringValue.getter()
{
  return 12383;
}

uint64_t SearchGlobalEntity.CustomAttribute.StringCodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_129();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SearchGlobalEntity.CustomAttribute.CodingKeys()
{
  char *v0;

  return SearchGlobalEntity.CustomAttribute.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.CustomAttribute.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = SearchGlobalEntity.CustomAttribute.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.CustomAttribute.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.CustomAttribute.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys();
  return CodingKey.debugDescription.getter();
}

void protocol witness for Hashable.hashValue.getter in conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys()
{
  SearchGlobalEntity.CustomAttribute.StringCodingKeys.hashValue.getter();
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = SearchGlobalEntity.CustomAttribute.StringCodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys();
  return CodingKey.debugDescription.getter();
}

void SearchGlobalEntity.CustomAttribute.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
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

  OUTLINED_FUNCTION_2();
  v4 = v3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys>);
  v18 = *(_QWORD *)(v5 - 8);
  v19 = v5;
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v17 = v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.CustomAttribute.TimestampCodingKeys>);
  v15 = *(_QWORD *)(v7 - 8);
  v16 = v7;
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v14 = v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.CustomAttribute.StringCodingKeys>);
  OUTLINED_FUNCTION_44();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_14();
  v20 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.CustomAttribute.CodingKeys>)
                  - 8);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_45();
  v10 = *(_QWORD *)(v0 + 24);
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if (v10 >> 62)
  {
    if (v10 >> 62 == 1)
    {
      lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys();
      v11 = v14;
      OUTLINED_FUNCTION_24();
      OUTLINED_FUNCTION_196();
      lazy protocol witness table accessor for type SearchGlobalEntity.Timestamp and conformance SearchGlobalEntity.Timestamp();
      v12 = v16;
      OUTLINED_FUNCTION_154();
      v13 = v15;
    }
    else
    {
      OUTLINED_FUNCTION_193();
      v11 = v17;
      OUTLINED_FUNCTION_24();
      OUTLINED_FUNCTION_196();
      lazy protocol witness table accessor for type SearchGlobalEntity.Temperature and conformance SearchGlobalEntity.Temperature();
      v12 = v19;
      OUTLINED_FUNCTION_154();
      v13 = v18;
    }
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  else
  {
    lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys();
    OUTLINED_FUNCTION_24();
    KeyedEncodingContainer.encode(_:forKey:)();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v9);
  }
  OUTLINED_FUNCTION_119(*(uint64_t (**)(uint64_t, uint64_t))(v20 + 8));
  OUTLINED_FUNCTION_0_0();
}

void SearchGlobalEntity.CustomAttribute.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  unint64_t v25;
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
  unsigned __int8 v36;
  __int128 v37;

  OUTLINED_FUNCTION_2();
  v6 = v5;
  v30 = v7;
  v29 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys>)
                  - 8);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v32 = v8;
  v28 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.CustomAttribute.TimestampCodingKeys>)
                  - 8);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v31 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.CustomAttribute.StringCodingKeys>);
  OUTLINED_FUNCTION_102();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_10();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.CustomAttribute.CodingKeys>);
  OUTLINED_FUNCTION_151();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_73();
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v1)
  {
    v26 = v2;
    v27 = v3;
    v11 = KeyedDecodingContainer.allKeys.getter();
    v12 = v11;
    v13 = *(_QWORD *)(v11 + 16);
    if (v13)
    {
      v14 = *(unsigned __int8 *)(v11 + 32);
      specialized ArraySlice.subscript.getter(1, v13, v11, v11 + 32, 0, (2 * v13) | 1);
      v16 = v15;
      v18 = v17;
      OUTLINED_FUNCTION_18();
      if (v16 == v18 >> 1)
      {
        if (v14)
        {
          if (v14 == 1)
          {
            LOBYTE(v33) = 1;
            lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys();
            OUTLINED_FUNCTION_111();
            lazy protocol witness table accessor for type SearchGlobalEntity.Timestamp and conformance SearchGlobalEntity.Timestamp();
            KeyedDecodingContainer.decode<A>(_:forKey:)();
            OUTLINED_FUNCTION_47(v31, *(uint64_t (**)(uint64_t, uint64_t))(v28 + 8));
            OUTLINED_FUNCTION_96();
            OUTLINED_FUNCTION_81(v12, *(uint64_t (**)(uint64_t, uint64_t))(v27 + 8));
            v22 = v33;
            v16 = v34;
            v23 = v35;
            v24 = v37;
            v25 = v36 | 0x4000000000000000;
LABEL_12:
            *(_QWORD *)v30 = v22;
            *(_QWORD *)(v30 + 8) = v16;
            *(_QWORD *)(v30 + 16) = v23;
            *(_QWORD *)(v30 + 24) = v25;
            *(_OWORD *)(v30 + 32) = v24;
            goto LABEL_8;
          }
          OUTLINED_FUNCTION_193();
          OUTLINED_FUNCTION_111();
          lazy protocol witness table accessor for type SearchGlobalEntity.Temperature and conformance SearchGlobalEntity.Temperature();
          KeyedDecodingContainer.decode<A>(_:forKey:)();
          OUTLINED_FUNCTION_81(v32, *(uint64_t (**)(uint64_t, uint64_t))(v29 + 8));
          OUTLINED_FUNCTION_96();
          OUTLINED_FUNCTION_19(v12, *(uint64_t (**)(uint64_t, uint64_t))(v27 + 8));
          v22 = v33;
          v16 = v34;
          v23 = v35;
          v25 = v36 | 0x8000000000000000;
        }
        else
        {
          lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys();
          KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
          v22 = v26;
          KeyedDecodingContainer.decode(_:forKey:)();
          OUTLINED_FUNCTION_162();
          OUTLINED_FUNCTION_9(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
          OUTLINED_FUNCTION_161();
          (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v4, v10);
          v23 = 0;
          v25 = 0;
        }
        v24 = 0uLL;
        goto LABEL_12;
      }
    }
    v19 = type metadata accessor for DecodingError();
    OUTLINED_FUNCTION_185();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *v21 = &type metadata for SearchGlobalEntity.CustomAttribute;
    KeyedDecodingContainer.codingPath.getter();
    OUTLINED_FUNCTION_140();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v4, v10);
  }
LABEL_8:
  OUTLINED_FUNCTION_155();
  OUTLINED_FUNCTION_0_0();
}

void protocol witness for Decodable.init(from:) in conformance SearchGlobalEntity.CustomAttribute()
{
  SearchGlobalEntity.CustomAttribute.init(from:)();
}

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity.CustomAttribute()
{
  SearchGlobalEntity.CustomAttribute.encode(to:)();
}

void SearchGlobalEntity.EntityType.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
  OUTLINED_FUNCTION_5();
}

BOOL static SearchGlobalEntity.EntityType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

BOOL static SearchGlobalEntity.EntityType.CodingKeys.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void SearchGlobalEntity.EntityType.CodingKeys.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
}

uint64_t SearchGlobalEntity.EntityType.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v8;

  v2 = a1 == 0x636972656E6567 && a2 == 0xE700000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 1936744813 && a2 == 0xE400000000000000;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t SearchGlobalEntity.EntityType.CodingKeys.init(intValue:)()
{
  return 3;
}

uint64_t SearchGlobalEntity.EntityType.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t SearchGlobalEntity.EntityType.CodingKeys.stringValue.getter(char a1)
{
  if (!a1)
    return 0x636972656E6567;
  if (a1 == 1)
    return 1936744813;
  return 0x6E776F6E6B6E75;
}

uint64_t SearchGlobalEntity.EntityType.MapsCodingKeys.init(stringValue:)()
{
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t SearchGlobalEntity.EntityType.MapsCodingKeys.stringValue.getter()
{
  return 0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SearchGlobalEntity.EntityType.CodingKeys(char *a1, char *a2)
{
  return static SearchGlobalEntity.EntityType.CodingKeys.== infix(_:_:)(*a1, *a2);
}

void protocol witness for Hashable.hashValue.getter in conformance SearchGlobalEntity.EntityType.CodingKeys()
{
  unsigned __int8 *v0;

  SearchGlobalEntity.Timestamp.CodingKeys.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance SearchGlobalEntity.EntityType.CodingKeys(uint64_t a1)
{
  unsigned __int8 *v1;

  SearchGlobalEntity.EntityType.CodingKeys.hash(into:)(a1, *v1);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SearchGlobalEntity.EntityType.CodingKeys()
{
  char *v0;

  return SearchGlobalEntity.EntityType.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.EntityType.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = SearchGlobalEntity.EntityType.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance SearchGlobalEntity.EntityType.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = SearchGlobalEntity.EntityType.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.EntityType.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.EntityType.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.EntityType.GenericCodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.EntityType.GenericCodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.EntityType.MapsCodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = SearchGlobalEntity.EntityType.MapsCodingKeys.init(stringValue:)();
  *a1 = result & 1;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance SearchGlobalEntity.EntityType.MapsCodingKeys()
{
  return SearchGlobalEntity.EntityType.CodingKeys.intValue.getter();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance SearchGlobalEntity.EntityType.MapsCodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = static SearchGlobalEntity.CustomAttribute.StringCodingKeys.== infix(_:_:)();
  *a1 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.EntityType.MapsCodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.EntityType.MapsCodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.EntityType.UnknownCodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.EntityType.UnknownCodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys();
  return CodingKey.debugDescription.getter();
}

void SearchGlobalEntity.EntityType.encode(to:)()
{
  unsigned __int8 *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  OUTLINED_FUNCTION_2();
  v4 = v0;
  v6 = v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.EntityType.UnknownCodingKeys>);
  v15 = *(_QWORD *)(v7 - 8);
  v16 = v7;
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v14 = v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.EntityType.MapsCodingKeys>);
  v12 = *(_QWORD *)(v9 - 8);
  v13 = v9;
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_75();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.EntityType.GenericCodingKeys>);
  OUTLINED_FUNCTION_44();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_14();
  v17 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.EntityType.CodingKeys>)
                  - 8);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_45();
  v10 = *v4;
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if (v10)
  {
    if (v10 == 1)
    {
      OUTLINED_FUNCTION_199();
      OUTLINED_FUNCTION_24();
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v3, v13);
    }
    else
    {
      OUTLINED_FUNCTION_195();
      OUTLINED_FUNCTION_24();
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    }
  }
  else
  {
    lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys();
    OUTLINED_FUNCTION_24();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v11);
  }
  OUTLINED_FUNCTION_119(*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8));
  OUTLINED_FUNCTION_0_0();
}

void SearchGlobalEntity.EntityType.hashValue.getter()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  char v9;

  v0 = OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_128(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_38();
}

void SearchGlobalEntity.EntityType.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;

  OUTLINED_FUNCTION_2();
  v4 = v3;
  v28 = v5;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.EntityType.UnknownCodingKeys>);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.EntityType.MapsCodingKeys>);
  v25 = *(_QWORD *)(v6 - 8);
  v26 = v6;
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v29 = v7;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.EntityType.GenericCodingKeys>);
  OUTLINED_FUNCTION_151();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_75();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.EntityType.CodingKeys>);
  OUTLINED_FUNCTION_102();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_10();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
    goto LABEL_10;
  v30 = (uint64_t)v4;
  v8 = v2;
  v9 = KeyedDecodingContainer.allKeys.getter();
  v10 = *(_QWORD *)(v9 + 16);
  if (!v10
    || (v11 = *(unsigned __int8 *)(v9 + 32),
        specialized ArraySlice.subscript.getter(1, v10, v9, v9 + 32, 0, (2 * v10) | 1),
        v13 = v12,
        v15 = v14,
        swift_bridgeObjectRelease(),
        v13 != v15 >> 1))
  {
    v17 = type metadata accessor for DecodingError();
    OUTLINED_FUNCTION_185();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *v19 = &type metadata for SearchGlobalEntity.EntityType;
    KeyedDecodingContainer.codingPath.getter();
    OUTLINED_FUNCTION_140();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v19, *MEMORY[0x24BEE26D0], v17);
    swift_willThrow();
    OUTLINED_FUNCTION_215();
    OUTLINED_FUNCTION_47(v8, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
    v4 = (_QWORD *)v30;
LABEL_10:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v4);
    goto LABEL_11;
  }
  if (v11)
  {
    v31 = v11;
    if (v11 == 1)
    {
      OUTLINED_FUNCTION_199();
      OUTLINED_FUNCTION_91();
      v16 = v28;
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v29, v26);
    }
    else
    {
      OUTLINED_FUNCTION_195();
      OUTLINED_FUNCTION_91();
      v16 = v28;
      v22 = OUTLINED_FUNCTION_136();
      v23(v22, v27);
    }
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_19(v8, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  }
  else
  {
    lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys();
    OUTLINED_FUNCTION_91();
    v31 = 0;
    v20 = OUTLINED_FUNCTION_136();
    v21(v20, v24);
    OUTLINED_FUNCTION_215();
    OUTLINED_FUNCTION_19(v2, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
    v16 = v28;
  }
  *v16 = v31;
  __swift_destroy_boxed_opaque_existential_1Tm(v30);
LABEL_11:
  OUTLINED_FUNCTION_0_0();
}

void protocol witness for Decodable.init(from:) in conformance SearchGlobalEntity.EntityType()
{
  SearchGlobalEntity.EntityType.init(from:)();
}

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity.EntityType()
{
  SearchGlobalEntity.EntityType.encode(to:)();
}

uint64_t SearchGlobalEntity.EventAttributes.allDay.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t SearchGlobalEntity.EventAttributes.allDay.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*SearchGlobalEntity.EventAttributes.allDay.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

uint64_t SearchGlobalEntity.EventAttributes.startDate.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t SearchGlobalEntity.EventAttributes.startDate.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 8) = result;
  *(_BYTE *)(v2 + 16) = a2 & 1;
  return result;
}

uint64_t (*SearchGlobalEntity.EventAttributes.startDate.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

uint64_t SearchGlobalEntity.EventAttributes.endDate.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t SearchGlobalEntity.EventAttributes.endDate.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = result;
  *(_BYTE *)(v2 + 32) = a2 & 1;
  return result;
}

uint64_t (*SearchGlobalEntity.EventAttributes.endDate.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

uint64_t static SearchGlobalEntity.EventAttributes.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  uint64_t v3;
  unsigned __int8 v4;
  uint64_t v5;
  unsigned __int8 v6;
  int v7;
  uint64_t result;
  _BOOL4 v9;
  char v10;
  char v11;

  v2 = *a1;
  v3 = *((_QWORD *)a1 + 1);
  v4 = a1[16];
  v5 = *((_QWORD *)a1 + 3);
  v6 = a1[32];
  v7 = *a2;
  if (v2 == 2)
  {
    if (v7 != 2)
      return 0;
LABEL_6:
    if ((v4 & 1) != 0)
    {
      if (!a2[16])
        return 0;
    }
    else
    {
      if (v3 == *((_QWORD *)a2 + 1))
        v10 = a2[16];
      else
        v10 = 1;
      if ((v10 & 1) != 0)
        return 0;
    }
    if ((v6 & 1) != 0)
    {
      if ((a2[32] & 1) == 0)
        return 0;
    }
    else
    {
      if (v5 == *((_QWORD *)a2 + 3))
        v11 = a2[32];
      else
        v11 = 1;
      if ((v11 & 1) != 0)
        return 0;
    }
    return 1;
  }
  result = 0;
  v9 = (v2 & 1) == 0;
  if (v7 != 2 && ((v9 ^ v7) & 1) != 0)
    goto LABEL_6;
  return result;
}

uint64_t SearchGlobalEntity.EventAttributes.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v8;

  v2 = a1 == 0x7961446C6C61 && a2 == 0xE600000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x7461447472617473 && a2 == 0xE900000000000065;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x65746144646E65 && a2 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t SearchGlobalEntity.EventAttributes.CodingKeys.stringValue.getter(char a1)
{
  if (!a1)
    return 0x7961446C6C61;
  if (a1 == 1)
    return 0x7461447472617473;
  return 0x65746144646E65;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SearchGlobalEntity.EventAttributes.CodingKeys()
{
  char *v0;

  return SearchGlobalEntity.EventAttributes.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.EventAttributes.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = SearchGlobalEntity.EventAttributes.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.EventAttributes.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.EventAttributes.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys();
  return CodingKey.debugDescription.getter();
}

void SearchGlobalEntity.EventAttributes.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.EventAttributes.CodingKeys>)
                 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_100(v3);
  lazy protocol witness table accessor for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys();
  OUTLINED_FUNCTION_65();
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v0)
  {
    OUTLINED_FUNCTION_118();
    OUTLINED_FUNCTION_118();
  }
  OUTLINED_FUNCTION_81(v1, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_156();
  OUTLINED_FUNCTION_0_0();
}

void SearchGlobalEntity.EventAttributes.init()(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
}

uint64_t SearchGlobalEntity.EventAttributes.init(allDay:startDate:endDate:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(_BYTE *)a6 = result;
  *(_QWORD *)(a6 + 8) = a2;
  *(_BYTE *)(a6 + 16) = a3 & 1;
  *(_QWORD *)(a6 + 24) = a4;
  *(_BYTE *)(a6 + 32) = a5 & 1;
  return result;
}

void SearchGlobalEntity.EventAttributes.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11, char a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
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
  char v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);

  OUTLINED_FUNCTION_2();
  a23 = v25;
  a24 = v26;
  v28 = v27;
  v30 = v29;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.EventAttributes.CodingKeys>);
  OUTLINED_FUNCTION_56();
  MEMORY[0x24BDAC7A8]();
  v33 = (char *)&a9 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_54();
  lazy protocol witness table accessor for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys();
  OUTLINED_FUNCTION_85();
  if (!v24)
  {
    a14 = 0;
    v34 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    a13 = 1;
    v35 = OUTLINED_FUNCTION_84();
    a10 = v36;
    a12 = 2;
    OUTLINED_FUNCTION_84();
    v37 = OUTLINED_FUNCTION_203();
    v38(v37, v31);
    *(_BYTE *)v30 = v34;
    *(_QWORD *)(v30 + 8) = v35;
    *(_BYTE *)(v30 + 16) = a10 & 1;
    *(_QWORD *)(v30 + 24) = v33;
    *(_BYTE *)(v30 + 32) = v33 & 1;
  }
  __swift_destroy_boxed_opaque_existential_1Tm(v28);
  OUTLINED_FUNCTION_0_0();
}

#error "24338E0F8: call analysis failed (funcsize=5)"

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity.EventAttributes()
{
  SearchGlobalEntity.EventAttributes.encode(to:)();
}

void SearchGlobalEntity.PlaceAttributes.name.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.PlaceAttributes.name.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_33();
  *v1 = v2;
  v1[1] = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.name.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.PlaceAttributes.locality.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.PlaceAttributes.locality.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_52();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.locality.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.PlaceAttributes.subLocality.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.PlaceAttributes.subLocality.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_133();
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.subLocality.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.PlaceAttributes.administrativeArea.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.PlaceAttributes.administrativeArea.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_134();
  *(_QWORD *)(v1 + 48) = v2;
  *(_QWORD *)(v1 + 56) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.administrativeArea.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.PlaceAttributes.subAdministrativeArea.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.PlaceAttributes.subAdministrativeArea.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 64) = v2;
  *(_QWORD *)(v1 + 72) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.subAdministrativeArea.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.PlaceAttributes.country.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.PlaceAttributes.country.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 80) = v2;
  *(_QWORD *)(v1 + 88) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.country.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.PlaceAttributes.isoCountryCode.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.PlaceAttributes.isoCountryCode.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 96) = v2;
  *(_QWORD *)(v1 + 104) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.isoCountryCode.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.PlaceAttributes.postalAddress.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.PlaceAttributes.postalAddress.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 112) = v2;
  *(_QWORD *)(v1 + 120) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.postalAddress.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.PlaceAttributes.subThoroughfare.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.PlaceAttributes.subThoroughfare.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 128) = v2;
  *(_QWORD *)(v1 + 136) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.subThoroughfare.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.PlaceAttributes.thoroughfare.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.PlaceAttributes.thoroughfare.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 144) = v2;
  *(_QWORD *)(v1 + 152) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.thoroughfare.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

uint64_t SearchGlobalEntity.PlaceAttributes.latitude.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 160);
}

uint64_t SearchGlobalEntity.PlaceAttributes.latitude.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 160) = result;
  *(_BYTE *)(v2 + 168) = a2 & 1;
  return result;
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.latitude.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

uint64_t SearchGlobalEntity.PlaceAttributes.longitude.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 176);
}

uint64_t SearchGlobalEntity.PlaceAttributes.longitude.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 176) = result;
  *(_BYTE *)(v2 + 184) = a2 & 1;
  return result;
}

uint64_t (*SearchGlobalEntity.PlaceAttributes.longitude.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

uint64_t static SearchGlobalEntity.PlaceAttributes.== infix(_:_:)(uint64_t a1, uint64_t a2)
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
  double v15;
  double v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  uint64_t result;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  char v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  char v65;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  char v77;
  char v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  char v89;
  char v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char v100;
  char v101;
  char v103;
  char v105;
  char v107;
  char v109;
  char v110;
  char v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
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
  uint64_t v134;
  uint64_t v135;
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
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  char v169;
  char v170;
  int v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  char v185;

  v3 = *(_QWORD *)(a1 + 8);
  v184 = *(_QWORD *)(a1 + 24);
  v179 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v182 = *(_QWORD *)(a1 + 16);
  v183 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 88);
  v9 = *(_QWORD *)(a1 + 96);
  v11 = *(_QWORD *)(a1 + 104);
  v10 = *(_QWORD *)(a1 + 112);
  v13 = *(_QWORD *)(a1 + 120);
  v12 = *(_QWORD *)(a1 + 128);
  v14 = *(_QWORD *)(a1 + 136);
  v172 = *(_QWORD *)(a1 + 144);
  v173 = *(_QWORD *)(a1 + 152);
  v15 = *(double *)(a1 + 160);
  v170 = *(_BYTE *)(a1 + 168);
  v16 = *(double *)(a1 + 176);
  v17 = *(_BYTE *)(a1 + 184);
  v18 = *(_QWORD *)(a2 + 8);
  v181 = *(_QWORD *)(a2 + 16);
  v19 = *(_QWORD *)(a2 + 24);
  v178 = *(_QWORD *)(a2 + 32);
  v180 = *(_QWORD *)(a2 + 40);
  v176 = *(_QWORD *)(a2 + 48);
  v20 = *(_QWORD *)(a2 + 64);
  v177 = *(_QWORD *)(a2 + 56);
  v21 = *(double *)(a2 + 160);
  v22 = *(double *)(a2 + 176);
  v23 = *(_QWORD *)(a2 + 80);
  v175 = *(_QWORD *)(a2 + 72);
  v25 = *(_QWORD *)(a2 + 88);
  v24 = *(_QWORD *)(a2 + 96);
  v26 = *(_QWORD *)(a2 + 104);
  v27 = *(_QWORD *)(a2 + 112);
  v28 = *(_QWORD *)(a2 + 120);
  v29 = *(_QWORD *)(a2 + 128);
  v31 = *(_QWORD *)(a2 + 136);
  v30 = *(_QWORD *)(a2 + 144);
  v174 = *(_QWORD *)(a2 + 152);
  v171 = *(unsigned __int8 *)(a2 + 168);
  v169 = *(_BYTE *)(a2 + 184);
  if (!v3)
  {
    v168 = *(_QWORD *)(a1 + 56);
    if (v18)
      return 0;
    goto LABEL_10;
  }
  if (!v18)
    return 0;
  v168 = *(_QWORD *)(a1 + 56);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && v3 == v18)
    goto LABEL_10;
  v134 = *(_QWORD *)(a1 + 88);
  v139 = *(_QWORD *)(a2 + 120);
  v156 = *(_QWORD *)(a2 + 112);
  v162 = *(_QWORD *)(a2 + 136);
  v33 = *(_BYTE *)(a1 + 184);
  v34 = *(_QWORD *)(a1 + 128);
  v144 = *(_QWORD *)(a2 + 128);
  v150 = *(_QWORD *)(a2 + 144);
  v35 = *(_QWORD *)(a1 + 136);
  v36 = *(_QWORD *)(a1 + 112);
  v37 = *(_QWORD *)(a1 + 120);
  v119 = *(_QWORD *)(a2 + 64);
  v123 = *(_QWORD *)(a1 + 72);
  v38 = *(_QWORD *)(a1 + 96);
  v130 = *(_QWORD *)(a2 + 88);
  v115 = *(_QWORD *)(a1 + 104);
  v117 = *(_QWORD *)(a2 + 104);
  v39 = *(_QWORD *)(a1 + 80);
  v40 = *(_QWORD *)(a2 + 96);
  v112 = *(_QWORD *)(a1 + 64);
  v41 = _stringCompareWithSmolCheck(_:_:expecting:)();
  v5 = v112;
  v11 = v115;
  v24 = v40;
  v25 = v130;
  v8 = v134;
  v6 = v39;
  v7 = v123;
  v9 = v38;
  v26 = v117;
  v20 = v119;
  v13 = v37;
  v10 = v36;
  v14 = v35;
  v29 = v144;
  v30 = v150;
  v12 = v34;
  v28 = v139;
  v17 = v33;
  v27 = v156;
  v31 = v162;
  v42 = v41;
  result = 0;
  if ((v42 & 1) != 0)
  {
LABEL_10:
    if (v184)
    {
      if (!v19)
        return 0;
      if (v182 != v181 || v184 != v19)
      {
        v135 = v8;
        v140 = v28;
        v45 = v17;
        v126 = v23;
        v46 = v12;
        v145 = v29;
        v151 = v30;
        v47 = v14;
        v157 = v27;
        v163 = v31;
        v48 = v10;
        v49 = v13;
        v50 = v9;
        v116 = v11;
        v118 = v26;
        v120 = v20;
        v124 = v7;
        v51 = v6;
        v19 = v24;
        v52 = v5;
        v53 = _stringCompareWithSmolCheck(_:_:expecting:)();
        v5 = v52;
        v24 = v19;
        v11 = v116;
        v26 = v118;
        v8 = v135;
        v6 = v51;
        v20 = v120;
        v7 = v124;
        v9 = v50;
        v13 = v49;
        v10 = v48;
        v27 = v157;
        v31 = v163;
        v14 = v47;
        v29 = v145;
        v30 = v151;
        v12 = v46;
        v23 = v126;
        v17 = v45;
        v28 = v140;
        v54 = v53;
        result = 0;
        if ((v54 & 1) == 0)
          return result;
      }
    }
    else if (v19)
    {
      return 0;
    }
    if (v183)
    {
      if (!v180)
        return 0;
      if (v179 != v178 || v183 != v180)
      {
        v136 = v8;
        v185 = v17;
        v127 = v23;
        v131 = v25;
        v56 = v12;
        v146 = v29;
        v152 = v30;
        v57 = v14;
        v158 = v27;
        v164 = v31;
        v58 = v10;
        v59 = v13;
        v60 = v9;
        v141 = v28;
        v61 = v11;
        v62 = v6;
        v19 = v26;
        v121 = v20;
        v63 = v24;
        v113 = v5;
        v64 = _stringCompareWithSmolCheck(_:_:expecting:)();
        v5 = v113;
        v24 = v63;
        v20 = v121;
        v26 = v19;
        v6 = v62;
        v25 = v131;
        v8 = v136;
        v11 = v61;
        v9 = v60;
        v13 = v59;
        v28 = v141;
        v29 = v146;
        v10 = v58;
        v27 = v158;
        v31 = v164;
        v14 = v57;
        v30 = v152;
        v12 = v56;
        v23 = v127;
        v17 = v185;
        v65 = v64;
        result = 0;
        if ((v65 & 1) == 0)
          return result;
      }
    }
    else if (v180)
    {
      return 0;
    }
    if (v168)
    {
      if (!v177)
        return 0;
      if (v4 != v176 || v168 != v177)
      {
        v137 = v8;
        v142 = v28;
        v125 = v7;
        v128 = v23;
        v67 = v17;
        v68 = v12;
        v147 = v29;
        v153 = v30;
        v69 = v14;
        v159 = v27;
        v165 = v31;
        v70 = v10;
        v71 = v13;
        v72 = v9;
        v73 = v11;
        v132 = v25;
        v74 = v6;
        v19 = v26;
        v122 = v20;
        v75 = v24;
        v114 = v5;
        v76 = _stringCompareWithSmolCheck(_:_:expecting:)();
        v5 = v114;
        v24 = v75;
        v26 = v19;
        v6 = v74;
        v25 = v132;
        v8 = v137;
        v11 = v73;
        v9 = v72;
        v13 = v71;
        v28 = v142;
        v29 = v147;
        v10 = v70;
        v27 = v159;
        v31 = v165;
        v14 = v69;
        v30 = v153;
        v12 = v68;
        v23 = v128;
        v17 = v67;
        v20 = v122;
        v7 = v125;
        v77 = v76;
        result = 0;
        if ((v77 & 1) == 0)
          return result;
      }
    }
    else if (v177)
    {
      return 0;
    }
    if (v7)
    {
      if (!v175)
        return 0;
      if (v5 != v20 || v7 != v175)
      {
        v138 = v8;
        v143 = v28;
        v79 = v17;
        v129 = v23;
        v133 = v25;
        v80 = v12;
        v148 = v29;
        v154 = v30;
        v81 = v14;
        v160 = v27;
        v166 = v31;
        v82 = v10;
        v83 = v13;
        v84 = v9;
        v85 = v11;
        v86 = v6;
        v19 = v26;
        v87 = v24;
        v88 = _stringCompareWithSmolCheck(_:_:expecting:)();
        v24 = v87;
        v26 = v19;
        v6 = v86;
        v25 = v133;
        v8 = v138;
        v11 = v85;
        v9 = v84;
        v13 = v83;
        v28 = v143;
        v29 = v148;
        v10 = v82;
        v27 = v160;
        v31 = v166;
        v14 = v81;
        v30 = v154;
        v12 = v80;
        v23 = v129;
        v17 = v79;
        v89 = v88;
        result = 0;
        if ((v89 & 1) == 0)
          return result;
      }
    }
    else if (v175)
    {
      return 0;
    }
    if (v8)
    {
      if (!v25)
        return 0;
      if (v6 != v23 || v8 != v25)
      {
        v91 = v17;
        v92 = v12;
        v149 = v29;
        v155 = v30;
        v93 = v14;
        v161 = v27;
        v167 = v31;
        v94 = v10;
        v95 = v13;
        v96 = v9;
        v97 = v28;
        v98 = v11;
        v99 = v26;
        v19 = v24;
        v100 = _stringCompareWithSmolCheck(_:_:expecting:)();
        v24 = v19;
        v26 = v99;
        v11 = v98;
        v28 = v97;
        v9 = v96;
        v13 = v95;
        v10 = v94;
        v27 = v161;
        v31 = v167;
        v14 = v93;
        v29 = v149;
        v30 = v155;
        v12 = v92;
        v17 = v91;
        v101 = v100;
        result = 0;
        if ((v101 & 1) == 0)
          return result;
      }
    }
    else if (v25)
    {
      return 0;
    }
    if (v11)
    {
      if (!v26)
        return 0;
      if (v9 != v24 || v11 != v26)
      {
        OUTLINED_FUNCTION_170();
        _stringCompareWithSmolCheck(_:_:expecting:)();
        v30 = v19;
        result = OUTLINED_FUNCTION_34();
        if ((v103 & 1) == 0)
          return result;
      }
    }
    else if (v26)
    {
      return 0;
    }
    if (v13)
    {
      if (!v28)
        return 0;
      if (v10 != v27 || v13 != v28)
      {
        OUTLINED_FUNCTION_170();
        _stringCompareWithSmolCheck(_:_:expecting:)();
        v30 = v19;
        result = OUTLINED_FUNCTION_34();
        if ((v105 & 1) == 0)
          return result;
      }
    }
    else if (v28)
    {
      return 0;
    }
    if (v14)
    {
      if (!v31)
        return 0;
      if (v12 != v29 || v14 != v31)
      {
        OUTLINED_FUNCTION_213();
        result = OUTLINED_FUNCTION_34();
        if ((v107 & 1) == 0)
          return result;
      }
    }
    else if (v31)
    {
      return 0;
    }
    if (v173)
    {
      if (v174)
      {
        if (v172 != v30 || v173 != v174)
        {
          OUTLINED_FUNCTION_213();
          result = OUTLINED_FUNCTION_34();
          if ((v109 & 1) == 0)
            return result;
        }
LABEL_91:
        if ((v170 & 1) != 0)
        {
          if (!v171)
            return 0;
        }
        else
        {
          v110 = v171;
          if (v15 != v21)
            v110 = 1;
          if ((v110 & 1) != 0)
            return 0;
        }
        if ((v17 & 1) != 0)
        {
          if ((v169 & 1) == 0)
            return 0;
        }
        else
        {
          v111 = v169;
          if (v16 != v22)
            v111 = 1;
          if ((v111 & 1) != 0)
            return 0;
        }
        return 1;
      }
    }
    else if (!v174)
    {
      goto LABEL_91;
    }
    return 0;
  }
  return result;
}

uint64_t SearchGlobalEntity.PlaceAttributes.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  char v15;

  v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x7974696C61636F6CLL && a2 == 0xE800000000000000;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6C61636F4C627573 && a2 == 0xEB00000000797469;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000012 && a2 == 0x80000002433A7050
             || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000015 && a2 == 0x80000002433A7070
             || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        v8 = a1 == 0x7972746E756F63 && a2 == 0xE700000000000000;
        if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          v9 = a1 == 0x746E756F436F7369 && a2 == 0xEE0065646F437972;
          if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            v10 = a1 == 0x64416C6174736F70 && a2 == 0xED00007373657264;
            if (v10 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else
            {
              v11 = a1 == 0x6F726F6854627573 && a2 == 0xEF65726166686775;
              if (v11 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 8;
              }
              else
              {
                v12 = a1 == 0x6867756F726F6874 && a2 == 0xEC00000065726166;
                if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 9;
                }
                else
                {
                  v13 = a1 == 0x656475746974616CLL && a2 == 0xE800000000000000;
                  if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 10;
                  }
                  else if (a1 == 0x64757469676E6F6CLL && a2 == 0xE900000000000065)
                  {
                    swift_bridgeObjectRelease();
                    return 11;
                  }
                  else
                  {
                    v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
                    swift_bridgeObjectRelease();
                    if ((v15 & 1) != 0)
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
  }
}

uint64_t SearchGlobalEntity.PlaceAttributes.CodingKeys.init(intValue:)()
{
  return 12;
}

uint64_t SearchGlobalEntity.PlaceAttributes.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_24338F170 + 4 * byte_2433A8025[a1]))(1701667182, 0xE400000000000000);
}

uint64_t sub_24338F170()
{
  return 0x7974696C61636F6CLL;
}

uint64_t sub_24338F188()
{
  return 0x6C61636F4C627573;
}

unint64_t sub_24338F1A8()
{
  return 0xD000000000000012;
}

unint64_t sub_24338F1C4()
{
  return 0xD000000000000015;
}

uint64_t sub_24338F1E4()
{
  return 0x7972746E756F63;
}

uint64_t sub_24338F1FC()
{
  return 0x746E756F436F7369;
}

uint64_t sub_24338F220()
{
  return 0x64416C6174736F70;
}

uint64_t sub_24338F244()
{
  return 0x6F726F6854627573;
}

uint64_t sub_24338F268()
{
  return 0x6867756F726F6874;
}

uint64_t sub_24338F288()
{
  return 0x656475746974616CLL;
}

uint64_t sub_24338F2A0()
{
  return 0x64757469676E6F6CLL;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SearchGlobalEntity.PlaceAttributes.CodingKeys()
{
  unsigned __int8 *v0;

  return SearchGlobalEntity.PlaceAttributes.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.PlaceAttributes.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = SearchGlobalEntity.PlaceAttributes.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance SearchGlobalEntity.PlaceAttributes.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = SearchGlobalEntity.PlaceAttributes.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.PlaceAttributes.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.PlaceAttributes.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys();
  return CodingKey.debugDescription.getter();
}

void SearchGlobalEntity.PlaceAttributes.encode(to:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_2();
  v2 = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.PlaceAttributes.CodingKeys>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v5 = v2[3];
  v6 = v2;
  v8 = v7;
  __swift_project_boxed_opaque_existential_1(v6, v5);
  lazy protocol witness table accessor for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  OUTLINED_FUNCTION_179();
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v0)
  {
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_194();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  }
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v3);
  OUTLINED_FUNCTION_0_0();
}

void __swiftcall SearchGlobalEntity.PlaceAttributes.init()(OmniSearchTypes::SearchGlobalEntity::PlaceAttributes *__return_ptr retstr)
{
  bzero(retstr, 0xA8uLL);
  retstr->latitude.is_nil = 1;
  retstr->longitude.value = 0.0;
  retstr->longitude.is_nil = 1;
  OUTLINED_FUNCTION_108();
}

void SearchGlobalEntity.PlaceAttributes.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
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
  char v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
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
  _QWORD *v54;
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
  _BYTE v67[185];
  char v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
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
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _BYTE v89[7];
  uint64_t v90;
  char v91;
  char v92;
  _BYTE v93[7];
  char v94;
  uint64_t v95;

  OUTLINED_FUNCTION_2();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.PlaceAttributes.CodingKeys>);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = 1;
  v92 = 1;
  v10 = v3[3];
  v11 = v3[4];
  v54 = v3;
  OUTLINED_FUNCTION_100(v3);
  lazy protocol witness table accessor for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v0)
  {
    v62 = v0;
    OUTLINED_FUNCTION_41();
    v95 = 0;
    v14 = 0;
  }
  else
  {
    v12 = v5;
    LOBYTE(v69) = 0;
    v13 = OUTLINED_FUNCTION_13();
    v16 = v15;
    v51 = v13;
    LOBYTE(v69) = 1;
    OUTLINED_FUNCTION_53();
    v95 = v16;
    v50 = OUTLINED_FUNCTION_13();
    LOBYTE(v69) = 2;
    v18 = v17;
    OUTLINED_FUNCTION_53();
    v19 = OUTLINED_FUNCTION_13();
    v66 = v18;
    v20 = v19;
    v22 = v21;
    LOBYTE(v69) = 3;
    OUTLINED_FUNCTION_53();
    v23 = OUTLINED_FUNCTION_13();
    v52 = v22;
    v48 = v23;
    v49 = v20;
    OUTLINED_FUNCTION_138(4);
    v24 = OUTLINED_FUNCTION_13();
    v65 = v20;
    v47 = v24;
    OUTLINED_FUNCTION_138(5);
    v25 = OUTLINED_FUNCTION_13();
    v53 = v20;
    v46 = v25;
    LOBYTE(v69) = 6;
    v64 = v26;
    swift_bridgeObjectRetain();
    v45 = OUTLINED_FUNCTION_13();
    LOBYTE(v69) = 7;
    v63 = v27;
    swift_bridgeObjectRetain();
    v55 = OUTLINED_FUNCTION_13();
    LOBYTE(v69) = 8;
    v61 = v28;
    swift_bridgeObjectRetain();
    v60 = OUTLINED_FUNCTION_13();
    v62 = 0;
    v30 = v22;
    LOBYTE(v69) = 9;
    v58 = v29;
    OUTLINED_FUNCTION_53();
    v31 = v62;
    v57 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    v59 = v32;
    v62 = v31;
    if (!v31)
    {
      LOBYTE(v69) = 10;
      swift_bridgeObjectRetain();
      v56 = OUTLINED_FUNCTION_150();
      v62 = 0;
      v43 = v33 & 1;
      v94 = v33 & 1;
      v68 = 11;
      v44 = OUTLINED_FUNCTION_150();
      v62 = 0;
      v35 = v34;
      OUTLINED_FUNCTION_3();
      v92 = v35 & 1;
      *(_QWORD *)v67 = v51;
      *(_QWORD *)&v67[8] = v95;
      v36 = v66;
      *(_QWORD *)&v67[16] = v50;
      *(_QWORD *)&v67[24] = v66;
      *(_QWORD *)&v67[32] = v49;
      *(_QWORD *)&v67[40] = v22;
      *(_QWORD *)&v67[48] = v48;
      *(_QWORD *)&v67[56] = v65;
      *(_QWORD *)&v67[64] = v47;
      *(_QWORD *)&v67[72] = v20;
      v37 = v63;
      *(_QWORD *)&v67[80] = v46;
      *(_QWORD *)&v67[88] = v64;
      *(_QWORD *)&v67[96] = v45;
      *(_QWORD *)&v67[104] = v63;
      v38 = v61;
      *(_QWORD *)&v67[112] = v55;
      *(_QWORD *)&v67[120] = v61;
      *(_QWORD *)&v67[128] = v60;
      *(_QWORD *)&v67[136] = v58;
      *(_QWORD *)&v67[144] = v57;
      *(_QWORD *)&v67[152] = v59;
      *(_QWORD *)&v67[160] = v56;
      v67[168] = v43;
      *(_QWORD *)&v67[176] = v44;
      v67[184] = v35 & 1;
      outlined retain of SearchGlobalEntity.PlaceAttributes((uint64_t)v67);
      OUTLINED_FUNCTION_58();
      OUTLINED_FUNCTION_116();
      OUTLINED_FUNCTION_31();
      OUTLINED_FUNCTION_77();
      OUTLINED_FUNCTION_18();
      v39 = v64;
      OUTLINED_FUNCTION_77();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_87();
      v40 = v58;
      OUTLINED_FUNCTION_58();
      v41 = v59;
      OUTLINED_FUNCTION_18();
      memcpy(v12, v67, 0xB9uLL);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v54);
      v69 = v51;
      v70 = v95;
      v71 = (char *)v50;
      v72 = v36;
      v73 = v49;
      v74 = v30;
      v75 = v48;
      v76 = v65;
      v77 = v47;
      v78 = v53;
      v79 = v46;
      v80 = v39;
      v81 = v45;
      v82 = v37;
      v83 = v55;
      v84 = v38;
      v85 = v60;
      v86 = v40;
      v87 = v57;
      v88 = v41;
      OUTLINED_FUNCTION_184();
      *(_DWORD *)&v89[3] = *(_DWORD *)&v93[3];
      *(_DWORD *)v89 = *(_DWORD *)v93;
      v90 = v44;
      goto LABEL_5;
    }
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_79();
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_94();
    OUTLINED_FUNCTION_103();
    OUTLINED_FUNCTION_172();
    OUTLINED_FUNCTION_218();
    v56 = 0;
    v57 = 0;
    v59 = 0;
    v9 = (char *)v50;
    v14 = v51;
    v11 = v49;
    v1 = v47;
    v7 = v48;
    v6 = v45;
    v10 = v46;
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v54);
  v69 = v14;
  v70 = v95;
  v71 = v9;
  v72 = v66;
  v73 = v11;
  v74 = v52;
  v75 = v7;
  v76 = v65;
  v77 = v1;
  v78 = v53;
  v79 = v10;
  v80 = v64;
  v81 = v6;
  v82 = v63;
  v83 = v55;
  v84 = v61;
  v85 = v60;
  v86 = v58;
  v87 = v57;
  v88 = v59;
  OUTLINED_FUNCTION_184();
  *(_DWORD *)v89 = *(_DWORD *)v93;
  *(_DWORD *)&v89[3] = *(_DWORD *)&v93[3];
  v90 = 0;
LABEL_5:
  v91 = v92;
  outlined release of SearchGlobalEntity.PlaceAttributes((uint64_t)&v69);
  OUTLINED_FUNCTION_0_0();
}

void __swiftcall SearchGlobalEntity.PlaceAttributes.init(name:locality:subLocality:administrativeArea:subAdministrativeArea:country:isoCountryCode:postalAddress:subThoroughfare:thoroughfare:latitude:longitude:)(OmniSearchTypes::SearchGlobalEntity::PlaceAttributes *__return_ptr retstr, Swift::String_optional name, Swift::String_optional locality, Swift::String_optional subLocality, Swift::String_optional administrativeArea, Swift::String_optional subAdministrativeArea, Swift::String_optional country, Swift::String_optional isoCountryCode, Swift::String_optional postalAddress, Swift::String_optional subThoroughfare, Swift::String_optional thoroughfare, Swift::Double_optional latitude, Swift::Double_optional longitude)
{
  char v13;
  Swift::Double v14;
  char v15;

  retstr->name = name;
  retstr->locality = locality;
  retstr->subLocality = subLocality;
  retstr->administrativeArea = administrativeArea;
  retstr->subAdministrativeArea = subAdministrativeArea;
  retstr->country = country;
  retstr->isoCountryCode = isoCountryCode;
  retstr->postalAddress = postalAddress;
  retstr->subThoroughfare = subThoroughfare;
  retstr->thoroughfare = thoroughfare;
  retstr->latitude.value = *(Swift::Double *)&latitude.is_nil;
  retstr->latitude.is_nil = v13 & 1;
  retstr->longitude.value = v14;
  retstr->longitude.is_nil = v15 & 1;
}

void protocol witness for Decodable.init(from:) in conformance SearchGlobalEntity.PlaceAttributes()
{
  SearchGlobalEntity.PlaceAttributes.init(from:)();
}

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity.PlaceAttributes()
{
  SearchGlobalEntity.PlaceAttributes.encode(to:)();
}

void SearchGlobalEntity.IDAttributes.muid.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.IDAttributes.muid.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_33();
  *v1 = v2;
  v1[1] = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.IDAttributes.muid.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.IDAttributes.umcID.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.IDAttributes.umcID.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_52();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.IDAttributes.umcID.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

uint64_t static SearchGlobalEntity.IDAttributes.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t result;
  char v11;

  v2 = a1[2];
  v3 = a1[3];
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  if (!a1[1])
  {
    if (v4)
      return 0;
    goto LABEL_10;
  }
  if (!v4)
    return 0;
  OUTLINED_FUNCTION_97((uint64_t)a1);
  v9 = v9 && v7 == v8;
  if (v9 || (OUTLINED_FUNCTION_23(), result = OUTLINED_FUNCTION_34(), (v11 & 1) != 0))
  {
LABEL_10:
    if (v3)
    {
      if (v6)
      {
        if (v2 == v5 && v3 == v6)
          return 1;
        OUTLINED_FUNCTION_6();
        if ((OUTLINED_FUNCTION_23() & 1) != 0)
          return 1;
      }
    }
    else if (!v6)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t SearchGlobalEntity.IDAttributes.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 1684632941 && a2 == 0xE400000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4449636D75 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

void SearchGlobalEntity.Temperature.CodingKeys.hashValue.getter(char a1)
{
  OUTLINED_FUNCTION_90();
  Hasher._combine(_:)(a1 & 1);
  OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_38();
}

uint64_t SearchGlobalEntity.IDAttributes.CodingKeys.stringValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x4449636D75;
  else
    return 1684632941;
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance SearchGlobalEntity.Temperature.CodingKeys()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  char v9;

  v0 = OUTLINED_FUNCTION_212();
  OUTLINED_FUNCTION_128(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_38();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SearchGlobalEntity.IDAttributes.CodingKeys()
{
  char *v0;

  return SearchGlobalEntity.IDAttributes.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.IDAttributes.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = SearchGlobalEntity.IDAttributes.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.IDAttributes.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.IDAttributes.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys();
  return CodingKey.debugDescription.getter();
}

void SearchGlobalEntity.IDAttributes.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.IDAttributes.CodingKeys>)
                 - 8);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_126();
  OUTLINED_FUNCTION_100(v3);
  lazy protocol witness table accessor for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys();
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_36();
  if (!v0)
  {
    OUTLINED_FUNCTION_198();
    OUTLINED_FUNCTION_36();
  }
  OUTLINED_FUNCTION_81(v1, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_156();
  OUTLINED_FUNCTION_0_0();
}

OmniSearchTypes::SearchGlobalEntity::IDAttributes __swiftcall SearchGlobalEntity.IDAttributes.init()()
{
  _OWORD *v0;
  OmniSearchTypes::SearchGlobalEntity::IDAttributes result;

  *v0 = 0u;
  v0[1] = 0u;
  return result;
}

void SearchGlobalEntity.IDAttributes.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  uint64_t v14;

  OUTLINED_FUNCTION_2();
  v4 = v3;
  v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.IDAttributes.CodingKeys>);
  OUTLINED_FUNCTION_56();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_73();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v0)
  {
    v7 = OUTLINED_FUNCTION_80();
    v9 = v8;
    OUTLINED_FUNCTION_53();
    v10 = OUTLINED_FUNCTION_80();
    v12 = v11;
    v13 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8);
    v14 = v10;
    OUTLINED_FUNCTION_47(v1, v13);
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_149();
    *v6 = v7;
    v6[1] = v9;
    v6[2] = v14;
    v6[3] = v12;
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v4);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_177();
  OUTLINED_FUNCTION_0_0();
}

OmniSearchTypes::SearchGlobalEntity::IDAttributes __swiftcall SearchGlobalEntity.IDAttributes.init(muid:umcID:)(Swift::String_optional muid, Swift::String_optional umcID)
{
  Swift::String_optional *v2;
  OmniSearchTypes::SearchGlobalEntity::IDAttributes result;

  *v2 = muid;
  v2[1] = umcID;
  result.umcID = umcID;
  result.muid = muid;
  return result;
}

void protocol witness for Decodable.init(from:) in conformance SearchGlobalEntity.IDAttributes()
{
  SearchGlobalEntity.IDAttributes.init(from:)();
}

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity.IDAttributes()
{
  SearchGlobalEntity.IDAttributes.encode(to:)();
}

void SearchGlobalEntity.ContactAttributes.phoneNumber.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.ContactAttributes.phoneNumber.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_33();
  *v1 = v2;
  v1[1] = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.ContactAttributes.phoneNumber.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.ContactAttributes.email.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.ContactAttributes.email.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_52();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.ContactAttributes.email.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.ContactAttributes.imessageURL.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.ContactAttributes.imessageURL.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_133();
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.ContactAttributes.imessageURL.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.ContactAttributes.imessageID.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.ContactAttributes.imessageID.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_134();
  *(_QWORD *)(v1 + 48) = v2;
  *(_QWORD *)(v1 + 56) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.ContactAttributes.imessageID.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

uint64_t static SearchGlobalEntity.ContactAttributes.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
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
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t result;
  char v19;
  char v21;
  char v23;
  BOOL v24;

  v2 = a1[2];
  v4 = a1[3];
  v3 = a1[4];
  v6 = a1[5];
  v5 = a1[6];
  v7 = a1[7];
  v8 = a2[1];
  v9 = a2[2];
  v11 = a2[3];
  v10 = a2[4];
  v13 = a2[5];
  v12 = a2[6];
  v14 = a2[7];
  if (!a1[1])
  {
    if (v8)
      return 0;
    goto LABEL_10;
  }
  if (!v8)
    return 0;
  OUTLINED_FUNCTION_97((uint64_t)a1);
  v17 = v17 && v15 == v16;
  if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)(), result = OUTLINED_FUNCTION_34(), (v19 & 1) != 0))
  {
LABEL_10:
    if (v4)
    {
      if (!v11)
        return 0;
      if (v2 != v9 || v4 != v11)
      {
        OUTLINED_FUNCTION_179();
        _stringCompareWithSmolCheck(_:_:expecting:)();
        result = OUTLINED_FUNCTION_34();
        if ((v21 & 1) == 0)
          return result;
      }
    }
    else if (v11)
    {
      return 0;
    }
    if (v6)
    {
      if (!v13)
        return 0;
      if (v3 != v10 || v6 != v13)
      {
        _stringCompareWithSmolCheck(_:_:expecting:)();
        result = OUTLINED_FUNCTION_34();
        if ((v23 & 1) == 0)
          return result;
      }
    }
    else if (v13)
    {
      return 0;
    }
    if (v7)
    {
      if (v14)
      {
        v24 = v5 == v12 && v7 == v14;
        if (v24 || (OUTLINED_FUNCTION_23() & 1) != 0)
          return 1;
      }
    }
    else if (!v14)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t SearchGlobalEntity.ContactAttributes.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  char v9;

  v2 = a1 == 0x6D754E656E6F6870 && a2 == 0xEB00000000726562;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6C69616D65 && a2 == 0xE500000000000000;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6567617373656D69 && a2 == 0xEB000000004C5255;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x6567617373656D69 && a2 == 0xEA00000000004449)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 3;
        else
          return 4;
      }
    }
  }
}

uint64_t SearchGlobalEntity.ContactAttributes.CodingKeys.init(intValue:)()
{
  return 4;
}

uint64_t SearchGlobalEntity.ContactAttributes.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_243390834 + 4 * byte_2433A8031[a1]))(0x6D754E656E6F6870, 0xEB00000000726562);
}

uint64_t sub_243390834()
{
  return 0x6C69616D65;
}

uint64_t sub_243390848()
{
  return 0x6567617373656D69;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SearchGlobalEntity.ContactAttributes.CodingKeys()
{
  unsigned __int8 *v0;

  return SearchGlobalEntity.ContactAttributes.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.ContactAttributes.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = SearchGlobalEntity.ContactAttributes.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance SearchGlobalEntity.ContactAttributes.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = SearchGlobalEntity.ContactAttributes.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.ContactAttributes.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.ContactAttributes.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys();
  return CodingKey.debugDescription.getter();
}

void SearchGlobalEntity.ContactAttributes.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  OUTLINED_FUNCTION_2();
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.ContactAttributes.CodingKeys>);
  OUTLINED_FUNCTION_102();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_10();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v1)
  {
    OUTLINED_FUNCTION_198();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_179();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_36();
  }
  OUTLINED_FUNCTION_47(v2, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  OUTLINED_FUNCTION_156();
  OUTLINED_FUNCTION_0_0();
}

void __swiftcall SearchGlobalEntity.ContactAttributes.init()(OmniSearchTypes::SearchGlobalEntity::ContactAttributes *__return_ptr retstr)
{
  retstr->imessageURL = 0u;
  retstr->imessageID = 0u;
  retstr->phoneNumber = 0u;
  retstr->email = 0u;
}

void SearchGlobalEntity.ContactAttributes.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t *v5;
  uint64_t *v6;
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
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;

  OUTLINED_FUNCTION_2();
  v4 = v3;
  v6 = v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.ContactAttributes.CodingKeys>);
  OUTLINED_FUNCTION_44();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_75();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v4);
    OUTLINED_FUNCTION_149();
    OUTLINED_FUNCTION_87();
    OUTLINED_FUNCTION_18();
  }
  else
  {
    v8 = OUTLINED_FUNCTION_59();
    v10 = v9;
    v25 = v8;
    OUTLINED_FUNCTION_53();
    v11 = OUTLINED_FUNCTION_59();
    v13 = v12;
    v23 = v11;
    v24 = v6;
    OUTLINED_FUNCTION_53();
    v14 = OUTLINED_FUNCTION_59();
    v16 = v15;
    v22 = v14;
    OUTLINED_FUNCTION_53();
    v17 = OUTLINED_FUNCTION_59();
    v19 = v18;
    v20 = *(void (**)(uint64_t, uint64_t))(v1 + 8);
    v21 = v17;
    v20(v2, v7);
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_149();
    *v24 = v25;
    v24[1] = v10;
    v24[2] = v23;
    v24[3] = v13;
    v24[4] = v22;
    v24[5] = v16;
    v24[6] = v21;
    v24[7] = v19;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v4);
    OUTLINED_FUNCTION_77();
    OUTLINED_FUNCTION_87();
    OUTLINED_FUNCTION_31();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_177();
  OUTLINED_FUNCTION_0_0();
}

void __swiftcall SearchGlobalEntity.ContactAttributes.init(phoneNumber:email:imessageURL:imessageID:)(OmniSearchTypes::SearchGlobalEntity::ContactAttributes *__return_ptr retstr, Swift::String_optional phoneNumber, Swift::String_optional email, Swift::String_optional imessageURL, Swift::String_optional imessageID)
{
  retstr->phoneNumber = phoneNumber;
  retstr->email = email;
  retstr->imessageURL = imessageURL;
  retstr->imessageID = imessageID;
}

void protocol witness for Decodable.init(from:) in conformance SearchGlobalEntity.ContactAttributes()
{
  SearchGlobalEntity.ContactAttributes.init(from:)();
}

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity.ContactAttributes()
{
  SearchGlobalEntity.ContactAttributes.encode(to:)();
}

void SearchGlobalEntity.AppStoreAttributes.adamID.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.AppStoreAttributes.adamID.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_33();
  *v1 = v2;
  v1[1] = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.AppStoreAttributes.adamID.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

uint64_t static SearchGlobalEntity.AppStoreAttributes.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;

  v2 = *(_QWORD *)(a2 + 8);
  if (*(_QWORD *)(a1 + 8))
  {
    if (v2)
    {
      OUTLINED_FUNCTION_97(a1);
      v5 = v5 && v3 == v4;
      if (v5 || (OUTLINED_FUNCTION_23() & 1) != 0)
        return 1;
    }
  }
  else if (!v2)
  {
    return 1;
  }
  return 0;
}

uint64_t SearchGlobalEntity.AppStoreAttributes.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x44496D616461 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void SearchGlobalEntity.CustomAttribute.StringCodingKeys.hashValue.getter()
{
  OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_211();
  OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_38();
}

uint64_t SearchGlobalEntity.AppStoreAttributes.CodingKeys.stringValue.getter()
{
  return 0x44496D616461;
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys()
{
  OUTLINED_FUNCTION_212();
  OUTLINED_FUNCTION_211();
  OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_38();
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = SearchGlobalEntity.AppStoreAttributes.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys();
  return CodingKey.debugDescription.getter();
}

void SearchGlobalEntity.AppStoreAttributes.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.AppStoreAttributes.CodingKeys>);
  OUTLINED_FUNCTION_44();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_14();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  OUTLINED_FUNCTION_113(v0, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_0_0();
}

OmniSearchTypes::SearchGlobalEntity::AppStoreAttributes __swiftcall SearchGlobalEntity.AppStoreAttributes.init()()
{
  _QWORD *v0;
  OmniSearchTypes::SearchGlobalEntity::AppStoreAttributes result;

  *v0 = 0;
  v0[1] = 0;
  return result;
}

OmniSearchTypes::SearchGlobalEntity::AppStoreAttributes __swiftcall SearchGlobalEntity.AppStoreAttributes.init(adamID:)(OmniSearchTypes::SearchGlobalEntity::AppStoreAttributes adamID)
{
  OmniSearchTypes::SearchGlobalEntity::AppStoreAttributes *v1;

  *v1 = adamID;
  return adamID;
}

void SearchGlobalEntity.AppStoreAttributes.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_2();
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SearchGlobalEntity.AppStoreAttributes.CodingKeys>);
  OUTLINED_FUNCTION_56();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_54();
  lazy protocol witness table accessor for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys();
  OUTLINED_FUNCTION_85();
  if (!v0)
  {
    v5 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    v7 = v6;
    OUTLINED_FUNCTION_113(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
    *v4 = v5;
    v4[1] = v7;
  }
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_0_0();
}

void protocol witness for Decodable.init(from:) in conformance SearchGlobalEntity.AppStoreAttributes()
{
  SearchGlobalEntity.AppStoreAttributes.init(from:)();
}

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity.AppStoreAttributes()
{
  SearchGlobalEntity.AppStoreAttributes.encode(to:)();
}

void SearchGlobalEntity.id.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.domain.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.searchID.getter()
{
  uint64_t v0;

  outlined copy of Data?(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.text.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.text.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_78();
  *(_QWORD *)(v1 + 56) = v2;
  *(_QWORD *)(v1 + 64) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.text.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

uint64_t SearchGlobalEntity.generalAttributes.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_40(a1);
}

void SearchGlobalEntity.placeAttributes.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  _BYTE v3[192];

  OUTLINED_FUNCTION_76(v1 + 192, (uint64_t)v3);
  OUTLINED_FUNCTION_76((uint64_t)v3, a1);
  outlined retain of SearchGlobalEntity.PlaceAttributes?((uint64_t)v3);
  OUTLINED_FUNCTION_182();
}

uint64_t SearchGlobalEntity.lowConfidenceKnowledge.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 496);
}

uint64_t SearchGlobalEntity.lowConfidenceKnowledge.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 496) = result;
  return result;
}

uint64_t (*SearchGlobalEntity.lowConfidenceKnowledge.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.experienceFile.getter()
{
  EntityProperty.wrappedValue.getter();
  OUTLINED_FUNCTION_5();
}

void key path setter for SearchGlobalEntity.experienceFile : SearchGlobalEntity(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentFile?);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of IntentFile?(a1, (uint64_t)v3, &demangling cache variable for type metadata for IntentFile?);
  SearchGlobalEntity.experienceFile.setter((uint64_t)v3);
}

void SearchGlobalEntity.experienceFile.setter(uint64_t a1)
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentFile?);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_10();
  outlined init with copy of IntentFile?(a1, v1, &demangling cache variable for type metadata for IntentFile?);
  EntityProperty.wrappedValue.setter();
  outlined destroy of IntentFile?(a1, &demangling cache variable for type metadata for IntentFile?);
  OUTLINED_FUNCTION_1();
}

void SearchGlobalEntity.experienceFile.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_114();
  *v0 = v1;
  v1[4] = EntityProperty.wrappedValue.modify();
  OUTLINED_FUNCTION_1();
}

void SearchGlobalEntity.$experienceFile.getter()
{
  EntityProperty.projectedValue.getter();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.experienceSourceType.getter(_BYTE *a1@<X8>)
{
  *a1 = 18;
}

uint64_t SearchGlobalEntity.associatedQuery.getter()
{
  uint64_t v1;

  EntityProperty.wrappedValue.getter();
  return v1;
}

void key path setter for SearchGlobalEntity.associatedQuery : SearchGlobalEntity()
{
  swift_bridgeObjectRetain();
  SearchGlobalEntity.associatedQuery.setter();
}

void SearchGlobalEntity.associatedQuery.setter()
{
  EntityProperty.wrappedValue.setter();
  OUTLINED_FUNCTION_108();
}

void SearchGlobalEntity.associatedQuery.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_114();
  *v0 = v1;
  v1[4] = EntityProperty.wrappedValue.modify();
  OUTLINED_FUNCTION_1();
}

void SearchGlobalEntity.$associatedQuery.getter()
{
  EntityProperty.projectedValue.getter();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _OWORD v12[12];
  _QWORD v13[6];
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  _OWORD v26[13];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[6];
  char v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  _OWORD v53[13];
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;

  OUTLINED_FUNCTION_68();
  v11 = v3;
  v10 = type metadata accessor for UUID();
  OUTLINED_FUNCTION_44();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_73();
  OUTLINED_FUNCTION_189();
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<IntentFile?>);
  OUTLINED_FUNCTION_142();
  v4 = MEMORY[0x2494F6EC0](v0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<String?>);
  swift_retain();
  OUTLINED_FUNCTION_144();
  LocalizedStringResource.init(stringLiteral:)();
  v5 = MEMORY[0x2494F6ECC](v0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<[String]>);
  swift_retain();
  OUTLINED_FUNCTION_142();
  v6 = MEMORY[0x2494F6ECC](v0);
  swift_retain();
  UUID.init()();
  v7 = UUID.uuidString.getter();
  v9 = v8;
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  _s15OmniSearchTypes0B12GlobalEntityV15PlaceAttributesVSgWOi0_(v12);
  v13[0] = v7;
  v13[1] = v9;
  memset(&v13[2], 0, 24);
  v13[5] = 0xF000000000000000;
  v14 = 3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 3;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v12, (uint64_t)v26, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  v26[12] = xmmword_2433A9C00;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v30 = 1;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0;
  v35 = 1;
  v36 = 0;
  v37 = v4;
  v38 = v5;
  v39 = v6;
  outlined retain of SearchGlobalEntity(v13);
  OUTLINED_FUNCTION_87();
  swift_release();
  swift_release();
  swift_release();
  v40[0] = MEMORY[0x24BEE4AF8];
  EntityProperty.wrappedValue.setter();
  outlined release of SearchGlobalEntity(v13);
  v40[0] = v7;
  v40[1] = v9;
  memset(&v40[2], 0, 24);
  v40[5] = 0xF000000000000000;
  v41 = 3;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 3;
  v49 = 0;
  v52 = 0;
  v50 = 0;
  v51 = 0;
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v12, (uint64_t)v53, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  v53[12] = xmmword_2433A9C00;
  v54 = 0;
  v55 = 0;
  v56 = 0;
  v57 = 1;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0;
  v62 = 1;
  v63 = 0;
  v64 = v4;
  v65 = v5;
  v66 = v6;
  OUTLINED_FUNCTION_117(v11, v40);
  OUTLINED_FUNCTION_22();
}

void SearchGlobalEntity.supportedTypeIdentifiersForExport.setter()
{
  EntityProperty.wrappedValue.setter();
  OUTLINED_FUNCTION_108();
}

void SearchGlobalEntity.init(_:)(void (*a1)(_BYTE *)@<X0>, uint64_t a2@<X8>)
{
  _BYTE v4[528];
  _BYTE v5[504];
  _OWORD v6[12];
  _BYTE v7[32];
  uint64_t v8;
  unint64_t v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  _OWORD v22[13];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  _BYTE v33[528];

  _s15OmniSearchTypes0B12GlobalEntityV15PlaceAttributesVSgWOi0_(v6);
  memset(v7, 0, sizeof(v7));
  v8 = 0;
  v9 = 0xF000000000000000;
  v10 = 3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 3;
  v18 = 0;
  v20 = 0;
  v19 = 0;
  v21 = 0;
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v6, (uint64_t)v22, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  v22[12] = xmmword_2433A9C00;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 1;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0;
  v31 = 1;
  v32 = 0;
  OUTLINED_FUNCTION_61(v5, v7);
  a1(v5);
  SearchGlobalEntity.init(builder:)();
  OUTLINED_FUNCTION_76((uint64_t)v4, (uint64_t)v33);
  OUTLINED_FUNCTION_76((uint64_t)v33, a2);
}

void *SearchGlobalEntity.Builder.init()@<X0>(void *a1@<X8>)
{
  _OWORD v3[12];
  _OWORD v4[2];
  uint64_t v5;
  unint64_t v6;
  char v7;
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
  char v18;
  _OWORD v19[13];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  char v29;

  _s15OmniSearchTypes0B12GlobalEntityV15PlaceAttributesVSgWOi0_(v3);
  memset(v4, 0, sizeof(v4));
  v5 = 0;
  v6 = 0xF000000000000000;
  v7 = 3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 3;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v3, (uint64_t)v19, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  v19[12] = xmmword_2433A9C00;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = 1;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0;
  v28 = 1;
  v29 = 0;
  return OUTLINED_FUNCTION_61(a1, v4);
}

void SearchGlobalEntity.init(builder:)()
{
  uint64_t v0;
  const void *v1;
  const void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
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
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
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
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  _QWORD v63[6];
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  _QWORD v81[38];
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  __int128 v105;
  uint64_t v106;
  uint64_t v107;
  char v108;
  _QWORD v109[38];
  char v110;

  OUTLINED_FUNCTION_68();
  v2 = v1;
  v39 = v3;
  OUTLINED_FUNCTION_189();
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_61(&v86, v2);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<IntentFile?>);
  OUTLINED_FUNCTION_141();
  v4 = MEMORY[0x2494F6EC0](v0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<String?>);
  swift_retain();
  LocalizedStringResource.init(stringLiteral:)();
  v5 = MEMORY[0x2494F6ECC](v0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<[String]>);
  swift_retain();
  OUTLINED_FUNCTION_141();
  v54 = MEMORY[0x2494F6ECC](v0);
  if (v87)
  {
    v25 = v86;
    v31 = v88;
    v6 = v90;
    v45 = v90;
    v46 = v87;
    v7 = v91;
    v30 = v92;
    v29 = v93;
    v8 = v94;
    v52 = v95;
    v53 = v89;
    v57 = v97;
    v55 = v96;
    v56 = v98;
    v50 = v100;
    v51 = v99;
    v9 = v101;
    v37 = v102;
    v38 = v101;
    v28 = v105;
    v26 = v107;
    v27 = v106;
    v32 = v108;
    v36 = v104;
    v35 = v109[24];
    v42 = v109[25];
    v43 = v103;
    v58 = v109[27];
    v59 = v109[26];
    v48 = v109[30];
    v49 = v109[29];
    v60 = v109[32];
    v61 = v109[31];
    v44 = v109[33];
    v33 = v109[34];
    v40 = v109[28];
    v41 = v109[35];
    v47 = v109[36];
    v34 = v109[37];
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_181();
    outlined copy of Data?(v6, v7);
    swift_bridgeObjectRetain();
    v10 = OUTLINED_FUNCTION_204();
    outlined copy of SearchGlobalEntity.GeneralAttributes?(v10, v11, v12, v13, v14, v50, v9);
    swift_bridgeObjectRetain();
    outlined retain of SearchGlobalEntity.PlaceAttributes?((uint64_t)v109);
    outlined copy of SearchGlobalEntity.IDAttributes?(v35, v42);
    outlined copy of SearchGlobalEntity.ContactAttributes?(v40, v49);
    outlined copy of SearchGlobalEntity.AppStoreAttributes?(v47, v34);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    outlined copy of Data?(v45, v7);
    OUTLINED_FUNCTION_64();
    v15 = OUTLINED_FUNCTION_204();
    outlined copy of SearchGlobalEntity.GeneralAttributes?(v15, v16, v17, v18, v19, v50, v38);
    OUTLINED_FUNCTION_106();
    outlined retain of SearchGlobalEntity.PlaceAttributes?((uint64_t)v109);
    outlined copy of SearchGlobalEntity.IDAttributes?(v35, v42);
    outlined copy of SearchGlobalEntity.ContactAttributes?(v40, v49);
    outlined copy of SearchGlobalEntity.AppStoreAttributes?(v47, v34);
    swift_retain();
    outlined release of SearchGlobalEntity.Builder(&v86);
    v24 = v110;
    v63[0] = v25;
    v63[1] = v46;
    v63[2] = v31;
    v63[3] = v53;
    v63[4] = v45;
    v63[5] = v7;
    v64 = v30;
    v65 = v29;
    v66 = v8;
    v67 = v52;
    v68 = v55;
    v69 = v57;
    v70 = v56;
    v71 = v51;
    v72 = v50;
    v73 = v38;
    v74 = v37;
    v75 = v43;
    v76 = v36;
    v77 = v28;
    v78 = v27;
    v79 = v26;
    v80 = v32;
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v109, (uint64_t)v81, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
    v81[24] = v35;
    v81[25] = v42;
    v81[26] = v59;
    v81[27] = v58;
    v81[28] = v40;
    v81[29] = v49;
    v81[30] = v48;
    v81[31] = v61;
    v81[32] = v60;
    v81[33] = v44;
    v81[34] = v33;
    v81[35] = v41;
    v81[36] = v47;
    v81[37] = v34;
    v82 = v24;
    v83 = v4;
    v84 = v5;
    v85 = v54;
    OUTLINED_FUNCTION_117(&v62, v63);
    outlined retain of SearchGlobalEntity(v63);
    v62 = SearchGlobalEntity.validTypeIdentifiers.getter();
    EntityProperty.wrappedValue.setter();
    outlined release of SearchGlobalEntity(v63);
    outlined retain of SearchGlobalEntity(v63);
    swift_release();
    swift_release();
    swift_release();
    outlined consume of SearchGlobalEntity.AppStoreAttributes?(v47, v34);
    outlined consume of SearchGlobalEntity.ContactAttributes?(v40, v49);
    outlined consume of SearchGlobalEntity.IDAttributes?(v35, v42);
    outlined retain of SearchGlobalEntity.PlaceAttributes?((uint64_t)v109);
    swift_bridgeObjectRelease();
    outlined consume of SearchGlobalEntity.GeneralAttributes?(v52, v55, v57, v56, v51, v50, v38);
    swift_bridgeObjectRelease();
    outlined consume of Data?(v45, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_117(v39, v63);
    SearchGlobalEntity.GeneralAttributes.alternateNames.modify(v39);
    outlined release of SearchGlobalEntity(v63);
  }
  else
  {
    outlined release of SearchGlobalEntity.Builder(&v86);
    swift_release();
    swift_release();
    if (one-time initialization token for search != -1)
      swift_once();
    v20 = OUTLINED_FUNCTION_112();
    __swift_project_value_buffer(v20, (uint64_t)static Logging.search);
    v21 = Logger.logObject.getter();
    v22 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)OUTLINED_FUNCTION_70();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_243387000, v21, v22, "Attempting to create SearchGlobalEntity without id", v23, 2u);
      OUTLINED_FUNCTION_25();
    }

    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    _s15OmniSearchTypes0B12GlobalEntityVSgWOi0_(v63);
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v63, (uint64_t)v39, &demangling cache variable for type metadata for SearchGlobalEntity?);
  }
  OUTLINED_FUNCTION_22();
}

char *SearchGlobalEntity.validTypeIdentifiers.getter()
{
  const void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  uint64_t v8;
  int EnumTagSinglePayload;
  char *v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  unint64_t v13;
  unint64_t v14;
  char *v15;
  _QWORD v17[75];
  uint64_t v18;
  uint64_t v19;

  OUTLINED_FUNCTION_68();
  v18 = v4;
  v19 = v5;
  v6 = type metadata accessor for UTType();
  OUTLINED_FUNCTION_153();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_45();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentFile?);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_168();
  OUTLINED_FUNCTION_117(v17, v0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String?>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2433A9C10;
  outlined retain of SearchGlobalEntity(v17);
  EntityProperty.wrappedValue.getter();
  outlined release of SearchGlobalEntity(v17);
  v8 = type metadata accessor for IntentFile();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v2, 1, v8);
  outlined destroy of IntentFile?(v2, &demangling cache variable for type metadata for IntentFile?);
  if (EnumTagSinglePayload == 1)
  {
    *(_QWORD *)(inited + 32) = 0;
    *(_QWORD *)(inited + 40) = 0;
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    if (one-time initialization token for searchToolExportedExperiences != -1)
      swift_once();
    __swift_project_value_buffer(v6, (uint64_t)static UTType.searchToolExportedExperiences);
    OUTLINED_FUNCTION_83();
    v11 = OUTLINED_FUNCTION_200();
    v12(v11);
    UTType.identifier.getter();
    OUTLINED_FUNCTION_162();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v6);
    *(_QWORD *)(inited + 32) = v1;
    *(_QWORD *)(inited + 40) = &demangling cache variable for type metadata for IntentFile?;
    OUTLINED_FUNCTION_64();
    v10 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v14 = *((_QWORD *)v10 + 2);
    v13 = *((_QWORD *)v10 + 3);
    if (v14 >= v13 >> 1)
      v10 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v13 > 1), v14 + 1, 1, (uint64_t)v10);
    *((_QWORD *)v10 + 2) = v14 + 1;
    v15 = &v10[16 * v14];
    *((_QWORD *)v15 + 4) = v1;
    *((_QWORD *)v15 + 5) = &demangling cache variable for type metadata for IntentFile?;
  }
  swift_release();
  return v10;
}

void SearchGlobalEntity.Builder.id.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.Builder.id.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_33();
  *v1 = v2;
  v1[1] = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.Builder.id.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.Builder.domain.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.Builder.domain.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_52();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.Builder.domain.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.Builder.searchID.getter()
{
  uint64_t v0;

  outlined copy of Data?(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.Builder.searchID.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_51();
  outlined consume of Data?(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.Builder.searchID.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

_BYTE *SearchGlobalEntity.Builder.entityType.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 48) = *result;
  return result;
}

uint64_t (*SearchGlobalEntity.Builder.entityType.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.Builder.text.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.Builder.text.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_78();
  *(_QWORD *)(v1 + 56) = v2;
  *(_QWORD *)(v1 + 64) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.Builder.text.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

uint64_t SearchGlobalEntity.Builder.generalAttributes.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_40(a1);
}

__n128 SearchGlobalEntity.Builder.generalAttributes.setter(__int128 *a1)
{
  _QWORD *v1;
  uint64_t v2;
  __n128 result;
  __n128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v7 = *a1;
  v5 = a1[2];
  v6 = a1[1];
  v4 = (__n128)a1[3];
  v2 = *((_QWORD *)a1 + 8);
  outlined consume of SearchGlobalEntity.GeneralAttributes?(v1[9], v1[10], v1[11], v1[12], v1[13], v1[14], v1[15]);
  *(_OWORD *)(v1 + 9) = v7;
  *(_OWORD *)(v1 + 11) = v6;
  *(_OWORD *)(v1 + 13) = v5;
  result = v4;
  *(__n128 *)(v1 + 15) = v4;
  v1[17] = v2;
  return result;
}

uint64_t (*SearchGlobalEntity.Builder.generalAttributes.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.Builder.customAttributes.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 144) = a1;
  OUTLINED_FUNCTION_5();
}

uint64_t (*SearchGlobalEntity.Builder.customAttributes.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

__n128 SearchGlobalEntity.Builder.eventAttributes.setter(uint64_t a1)
{
  uint64_t v1;
  char v2;
  __n128 result;
  __int128 v4;

  v2 = *(_BYTE *)(a1 + 32);
  result = *(__n128 *)a1;
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 152) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 168) = v4;
  *(_BYTE *)(v1 + 184) = v2;
  return result;
}

uint64_t (*SearchGlobalEntity.Builder.eventAttributes.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.Builder.placeAttributes.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  _BYTE v3[192];

  OUTLINED_FUNCTION_76(v1 + 192, (uint64_t)v3);
  OUTLINED_FUNCTION_76((uint64_t)v3, a1);
  outlined retain of SearchGlobalEntity.PlaceAttributes?((uint64_t)v3);
  OUTLINED_FUNCTION_182();
}

void SearchGlobalEntity.Builder.placeAttributes.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE v3[192];
  _BYTE v4[192];

  OUTLINED_FUNCTION_49(a1, (uint64_t)v3);
  v2 = v1 + 192;
  OUTLINED_FUNCTION_49(v2, (uint64_t)v4);
  outlined retain of SearchGlobalEntity.PlaceAttributes?((uint64_t)v4);
  OUTLINED_FUNCTION_49((uint64_t)v3, v2);
}

uint64_t (*SearchGlobalEntity.Builder.placeAttributes.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

__n128 SearchGlobalEntity.Builder.idAttributes.setter(__int128 *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v5 = *a1;
  v2 = *((_QWORD *)a1 + 2);
  v3 = *((_QWORD *)a1 + 3);
  outlined consume of SearchGlobalEntity.IDAttributes?(v1[48], v1[49]);
  *((_OWORD *)v1 + 24) = v5;
  v1[50] = v2;
  v1[51] = v3;
  OUTLINED_FUNCTION_146();
  return result;
}

uint64_t (*SearchGlobalEntity.Builder.idAttributes.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

__n128 SearchGlobalEntity.Builder.contactAttributes.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __n128 result;
  __n128 v5;
  __int128 v6;
  __int128 v7;

  v6 = a1[1];
  v7 = *a1;
  v5 = (__n128)a1[2];
  v2 = *((_QWORD *)a1 + 6);
  v3 = *((_QWORD *)a1 + 7);
  outlined consume of SearchGlobalEntity.ContactAttributes?(*(_QWORD *)(v1 + 416), *(_QWORD *)(v1 + 424));
  *(_OWORD *)(v1 + 416) = v7;
  *(_OWORD *)(v1 + 432) = v6;
  result = v5;
  *(__n128 *)(v1 + 448) = v5;
  *(_QWORD *)(v1 + 464) = v2;
  *(_QWORD *)(v1 + 472) = v3;
  return result;
}

uint64_t (*SearchGlobalEntity.Builder.contactAttributes.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

void SearchGlobalEntity.Builder.appstoreAttributes.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = a1[1];
  outlined consume of SearchGlobalEntity.AppStoreAttributes?(*(_QWORD *)(v1 + 480), *(_QWORD *)(v1 + 488));
  *(_QWORD *)(v1 + 480) = v2;
  *(_QWORD *)(v1 + 488) = v3;
  OUTLINED_FUNCTION_1();
}

uint64_t (*SearchGlobalEntity.Builder.appstoreAttributes.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

uint64_t SearchGlobalEntity.Builder.lowConfidenceKnowledge.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 496);
}

uint64_t SearchGlobalEntity.Builder.lowConfidenceKnowledge.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 496) = result;
  return result;
}

uint64_t (*SearchGlobalEntity.Builder.lowConfidenceKnowledge.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

uint64_t default argument 12 of SearchGlobalEntity.Builder.init(id:domain:searchID:entityType:text:generalAttributes:customAttributes:eventAttributes:placeAttributes:idAttributes:contactAttributes:appstoreAttributes:lowConfidenceKnowledge:)()
{
  return 0;
}

__n128 SearchGlobalEntity.Builder.init(id:domain:searchID:entityType:text:generalAttributes:customAttributes:eventAttributes:placeAttributes:idAttributes:contactAttributes:appstoreAttributes:lowConfidenceKnowledge:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,__int128 *a22,uint64_t a23,__int128 *a24,uint64_t a25,__int128 *a26,__int128 *a27,uint64_t *a28,char a29)
{
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __n128 result;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE v67[200];

  OUTLINED_FUNCTION_68();
  v65 = v29;
  v66 = v30;
  v63 = v31;
  v64 = v32;
  v61 = v33;
  v62 = v34;
  v60 = v35;
  v37 = v36;
  v39 = *v38;
  v55 = a22[1];
  v56 = *a22;
  v53 = a22[3];
  v54 = a22[2];
  v40 = *((_QWORD *)a22 + 8);
  v58 = *a24;
  v41 = *((_QWORD *)a24 + 3);
  v57 = *((_QWORD *)a24 + 2);
  v59 = *((_BYTE *)a24 + 32);
  outlined init with take of SearchGlobalEntity.PlaceAttributes?(a25, (uint64_t)v67, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  v43 = *((_QWORD *)a26 + 2);
  v42 = *((_QWORD *)a26 + 3);
  v51 = *a27;
  v52 = *a26;
  v49 = a27[2];
  v50 = a27[1];
  v44 = *((_QWORD *)a27 + 6);
  v45 = *((_QWORD *)a27 + 7);
  v46 = *a28;
  v47 = a28[1];
  *(_QWORD *)v37 = v60;
  *(_QWORD *)(v37 + 8) = v61;
  *(_QWORD *)(v37 + 16) = v62;
  *(_QWORD *)(v37 + 24) = v63;
  *(_QWORD *)(v37 + 32) = v64;
  *(_QWORD *)(v37 + 40) = v65;
  *(_BYTE *)(v37 + 48) = v39;
  *(_QWORD *)(v37 + 56) = v66;
  *(_QWORD *)(v37 + 64) = a21;
  *(_OWORD *)(v37 + 72) = v56;
  *(_OWORD *)(v37 + 88) = v55;
  *(_OWORD *)(v37 + 104) = v54;
  *(_OWORD *)(v37 + 120) = v53;
  *(_QWORD *)(v37 + 136) = v40;
  *(_QWORD *)(v37 + 144) = a23;
  *(_OWORD *)(v37 + 152) = v58;
  *(_QWORD *)(v37 + 168) = v57;
  *(_QWORD *)(v37 + 176) = v41;
  *(_BYTE *)(v37 + 184) = v59;
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v67, v37 + 192, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  *(_OWORD *)(v37 + 384) = v52;
  *(_QWORD *)(v37 + 400) = v43;
  *(_QWORD *)(v37 + 408) = v42;
  *(_OWORD *)(v37 + 416) = v51;
  *(_OWORD *)(v37 + 432) = v50;
  *(_OWORD *)(v37 + 448) = v49;
  *(_QWORD *)(v37 + 464) = v44;
  *(_QWORD *)(v37 + 472) = v45;
  *(_QWORD *)(v37 + 480) = v46;
  *(_QWORD *)(v37 + 488) = v47;
  *(_BYTE *)(v37 + 496) = a29;
  OUTLINED_FUNCTION_22();
  return result;
}

uint64_t one-time initialization function for typeDisplayRepresentation()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LocalizedStringResource?);
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)&v5 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for LocalizedStringResource();
  MEMORY[0x24BDAC7A8]();
  v3 = type metadata accessor for TypeDisplayRepresentation();
  __swift_allocate_value_buffer(v3, static SearchGlobalEntity.typeDisplayRepresentation);
  __swift_project_value_buffer(v3, (uint64_t)static SearchGlobalEntity.typeDisplayRepresentation);
  LocalizedStringResource.init(stringLiteral:)();
  __swift_storeEnumTagSinglePayload((uint64_t)v1, 1, 1, v2);
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LocalizedStringResource?);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for LocalizedStringResource();
  MEMORY[0x24BDAC7A8](v3);
  v4 = type metadata accessor for TypeDisplayRepresentation();
  __swift_allocate_value_buffer(v4, static SearchResultType.typeDisplayRepresentation);
  __swift_project_value_buffer(v4, (uint64_t)static SearchResultType.typeDisplayRepresentation);
  LocalizedStringResource.init(stringLiteral:)();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v3);
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

void static SearchGlobalEntity.typeDisplayRepresentation.getter(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (one-time initialization token for typeDisplayRepresentation != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_190();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static SearchGlobalEntity.typeDisplayRepresentation);
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_208(a1, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16));
  OUTLINED_FUNCTION_152();
}

void static SearchGlobalEntity.typeDisplayRepresentation.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);

  if (one-time initialization token for typeDisplayRepresentation != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_190();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static SearchGlobalEntity.typeDisplayRepresentation);
  OUTLINED_FUNCTION_191();
  OUTLINED_FUNCTION_208(v3, a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 24));
  swift_endAccess();
  v4 = OUTLINED_FUNCTION_6();
  v5(v4);
  OUTLINED_FUNCTION_152();
}

void static SearchGlobalEntity.typeDisplayRepresentation.modify()
{
  uint64_t v0;

  if (one-time initialization token for typeDisplayRepresentation != -1)
    swift_once();
  v0 = OUTLINED_FUNCTION_190();
  __swift_project_value_buffer(v0, (uint64_t)static SearchGlobalEntity.typeDisplayRepresentation);
  OUTLINED_FUNCTION_191();
  OUTLINED_FUNCTION_5();
}

void SearchGlobalEntity.displayRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  Swift::String v6;
  Swift::String v7;
  Swift::String v8;
  uint64_t v9;
  void *v10;
  Swift::String v11;
  Swift::String v12;
  uint64_t v13;

  OUTLINED_FUNCTION_68();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DisplayRepresentation.Image?);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_74();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LocalizedStringResource?);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_10();
  v3 = OUTLINED_FUNCTION_189();
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_127();
  type metadata accessor for String.LocalizationValue.StringInterpolation();
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_169();
  v5 = *(_QWORD *)(v0 + 56);
  v4 = *(void **)(v0 + 64);
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v6._object = (void *)0x80000002433A6FD0;
  v6._countAndFlagsBits = 0xD000000000000018;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v6);
  OUTLINED_FUNCTION_181();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  v7._countAndFlagsBits = String.init<A>(describing:)();
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0xD000000000000020;
  v8._object = (void *)0x80000002433A6FF0;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v8);
  if (v4)
    v9 = v5;
  else
    v9 = 7104878;
  if (v4)
    v10 = v4;
  else
    v10 = (void *)0xE300000000000000;
  swift_bridgeObjectRetain();
  v11._countAndFlagsBits = v9;
  v11._object = v10;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v11);
  OUTLINED_FUNCTION_180();
  v12._countAndFlagsBits = 34;
  v12._object = (void *)0xE100000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v12);
  LocalizedStringResource.init(stringInterpolation:)();
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v3);
  v13 = type metadata accessor for DisplayRepresentation.Image();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v13);
  DisplayRepresentation.init(title:subtitle:image:)();
  OUTLINED_FUNCTION_22();
}

uint64_t SearchGlobalEntity.Query.entities(for:)()
{
  uint64_t v0;

  return SearchGlobalEntity.Query.entities(for:)(*(uint64_t (**)(uint64_t))(v0 + 8), v0, MEMORY[0x24BEE4AF8]);
}

uint64_t protocol witness for EntityQuery.entities(for:) in conformance SearchGlobalEntity.Query()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = protocol witness for EntityQuery.entities(for:) in conformance SearchGlobalEntity.Query;
  return SearchGlobalEntity.Query.entities(for:)();
}

uint64_t protocol witness for EntityQuery.entities(for:) in conformance SearchGlobalEntity.Query(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_26();
  if (!v1)
    v4 = a1;
  return (*(uint64_t (**)(uint64_t))(v2 + 8))(v4);
}

uint64_t protocol witness for EntityQuery.suggestedEntities() in conformance SearchGlobalEntity.Query()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = protocol witness for EntityQuery.suggestedEntities() in conformance SearchGlobalEntity.Query;
  return EntityQuery.suggestedEntities()();
}

{
  uint64_t v0;

  OUTLINED_FUNCTION_26();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t protocol witness for DynamicOptionsProvider.results() in conformance SearchGlobalEntity.Query()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  lazy protocol witness table accessor for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query();
  *v1 = v0;
  v1[1] = protocol witness for DynamicOptionsProvider.results() in conformance SearchGlobalEntity.Query;
  return EntityQuery.results()();
}

uint64_t protocol witness for DynamicOptionsProvider.defaultResult() in conformance SearchGlobalEntity.Query()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = protocol witness for EntityQuery.suggestedEntities() in conformance SearchGlobalEntity.Query;
  return DynamicOptionsProvider.defaultResult()();
}

uint64_t (*static SearchGlobalEntity.defaultQuery.modify())()
{
  return SearchGlobalEntity.GeneralAttributes.alternateNames.modify;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SearchGlobalEntity.validateParameters()()
{
  const void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int EnumTagSinglePayload;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13[9];
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_2();
  v14 = v2;
  v15 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentFile?);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_117(&v12, v0);
  OUTLINED_FUNCTION_187();
  EntityProperty.wrappedValue.getter();
  OUTLINED_FUNCTION_110();
  v4 = type metadata accessor for IntentFile();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v4);
  outlined destroy of IntentFile?(v1, &demangling cache variable for type metadata for IntentFile?);
  if (EnumTagSinglePayload == 1)
  {
    if (one-time initialization token for search != -1)
      swift_once();
    v6 = type metadata accessor for Logger();
    __swift_project_value_buffer(v6, (uint64_t)static Logging.search);
    OUTLINED_FUNCTION_187();
    OUTLINED_FUNCTION_187();
    v7 = Logger.logObject.getter();
    v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v13[0] = swift_slowAlloc();
      *(_DWORD *)v9 = 136315138;
      v10 = specialized Encodable.jsonPrettyPrinted()();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v11, v13);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_77();
      OUTLINED_FUNCTION_110();
      OUTLINED_FUNCTION_110();
      _os_log_impl(&dword_243387000, v7, v8, "Missing experience for globalEntity: %s", v9, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_25();
    }
    OUTLINED_FUNCTION_110();
    OUTLINED_FUNCTION_110();

  }
  OUTLINED_FUNCTION_177();
  OUTLINED_FUNCTION_0_0();
}

uint64_t specialized Encodable.jsonPrettyPrinted()()
{
  const void *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v8[528];

  type metadata accessor for String.Encoding();
  MEMORY[0x24BDAC7A8]();
  memcpy(v8, v0, sizeof(v8));
  if (one-time initialization token for iso8601PrettyPrinted != -1)
    swift_once();
  lazy protocol witness table accessor for type SearchGlobalEntity and conformance SearchGlobalEntity();
  v1 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  v3 = v2;
  static String.Encoding.utf8.getter();
  v4 = String.init(data:encoding:)();
  if (v5)
  {
    v6 = v4;
    outlined consume of Data._Representation(v1, v3);
  }
  else
  {
    outlined consume of Data._Representation(v1, v3);
    return 0;
  }
  return v6;
}

uint64_t SearchGlobalEntity.supportedTypeIdentifiersForExport.getter()
{
  uint64_t v1;

  EntityProperty.wrappedValue.getter();
  return v1;
}

void key path setter for SearchGlobalEntity.supportedTypeIdentifiersForExport : SearchGlobalEntity()
{
  swift_bridgeObjectRetain();
  SearchGlobalEntity.supportedTypeIdentifiersForExport.setter();
}

void SearchGlobalEntity.supportedTypeIdentifiersForExport.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_114();
  *v0 = v1;
  v1[4] = EntityProperty.wrappedValue.modify();
  OUTLINED_FUNCTION_1();
}

void SearchGlobalEntity.experienceFile.modify(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

void SearchGlobalEntity.$supportedTypeIdentifiersForExport.getter()
{
  EntityProperty.projectedValue.getter();
  OUTLINED_FUNCTION_5();
}

uint64_t static SearchGlobalEntity.transferRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for UTType();
  OUTLINED_FUNCTION_151();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_74();
  if (one-time initialization token for searchToolExportedExperiences != -1)
    swift_once();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static UTType.searchToolExportedExperiences);
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_208(v0, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
  lazy protocol witness table accessor for type SearchGlobalEntity and conformance SearchGlobalEntity();
  return DataRepresentation.init(exportedContentType:exporting:)();
}

uint64_t static SearchGlobalEntity.== infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char v16;
  char v17;
  BOOL v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  char v56;
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
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  char v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  int v134;
  int v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  uint64_t v139;
  char v140;
  uint64_t v141;
  _BYTE v142[96];
  _BYTE v143[96];
  _BYTE v144[96];
  _QWORD v145[12];
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  unint64_t v171;
  uint64_t v172;
  uint64_t v173;
  _BYTE v174[96];
  _BYTE v175[96];
  uint64_t v176;
  uint64_t v177;

  OUTLINED_FUNCTION_68();
  v176 = v0;
  v177 = v1;
  v3 = v2;
  v5 = v4;
  v7 = *v4;
  v6 = v4[1];
  v8 = v4[3];
  v139 = v4[2];
  v137 = v4[4];
  v138 = v4[5];
  v135 = *((unsigned __int8 *)v4 + 48);
  v130 = v4[7];
  v133 = v4[8];
  v121 = v4[9];
  v122 = v4[10];
  v123 = v4[11];
  v124 = v4[12];
  v125 = v4[13];
  v126 = v4[14];
  v127 = v4[15];
  v131 = v4[16];
  v120 = v4[17];
  v111 = v4[18];
  v109 = v4[19];
  v106 = v4[21];
  v107 = v4[20];
  v105 = v4[22];
  v104 = *((_BYTE *)v4 + 184);
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)(v4 + 24), (uint64_t)v174, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  v93 = v5[50];
  v98 = v5[51];
  v99 = v5[49];
  v95 = v5[48];
  v96 = v5[53];
  v86 = v5[54];
  v87 = v5[52];
  v90 = v5[57];
  v91 = v5[55];
  v83 = v5[58];
  v85 = v5[56];
  v88 = v5[59];
  v65 = v5[60];
  v81 = v5[61];
  HIDWORD(v63) = *((unsigned __int8 *)v5 + 496);
  v62 = v5[63];
  v60 = v5[64];
  v58 = v5[65];
  v9 = *v3;
  v10 = v3[1];
  v11 = v3[2];
  v12 = v3[3];
  v13 = v3[5];
  v136 = v3[4];
  v134 = *((unsigned __int8 *)v3 + 48);
  v132 = v3[8];
  v128 = v3[9];
  v129 = v3[7];
  v113 = v3[10];
  v114 = v3[11];
  v115 = v3[12];
  v116 = v3[13];
  v117 = v3[14];
  v118 = v3[15];
  v119 = v3[16];
  v112 = v3[17];
  v110 = v3[18];
  v108 = *((unsigned __int8 *)v3 + 152);
  v100 = v3[20];
  v101 = v3[21];
  v103 = v3[22];
  v102 = *((_BYTE *)v3 + 184);
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)(v3 + 24), (uint64_t)v175, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  v14 = v3[49];
  v94 = v3[48];
  v92 = v3[50];
  v97 = v3[51];
  v82 = v3[53];
  v67 = v3[52];
  v69 = v3[54];
  v71 = v3[55];
  v73 = v3[56];
  v75 = v3[57];
  v77 = v3[58];
  v79 = v3[59];
  v64 = v3[60];
  v66 = v3[61];
  LODWORD(v63) = *((unsigned __int8 *)v3 + 496);
  v61 = v3[63];
  v59 = v3[64];
  if (v7 != v9 || v6 != v10)
  {
    OUTLINED_FUNCTION_123();
    OUTLINED_FUNCTION_23();
    v16 = OUTLINED_FUNCTION_34();
    if ((v17 & 1) == 0)
      return v16 & 1;
  }
  if (!v8)
  {
    if (v12)
      goto LABEL_20;
    goto LABEL_15;
  }
  if (!v12)
    goto LABEL_20;
  v18 = v139 == v11 && v8 == v12;
  if (v18 || (OUTLINED_FUNCTION_23(), v16 = OUTLINED_FUNCTION_34(), (v19 & 1) != 0))
  {
LABEL_15:
    if (v138 >> 60 == 15)
    {
      if (v13 >> 60 == 15)
        goto LABEL_23;
    }
    else if (v13 >> 60 != 15)
    {
      v23 = OUTLINED_FUNCTION_200();
      outlined copy of Data?(v23, v24);
      outlined copy of Data?(v136, v13);
      v25 = OUTLINED_FUNCTION_200();
      v26 = MEMORY[0x2494F704C](v25);
      OUTLINED_FUNCTION_167(v136);
      v27 = OUTLINED_FUNCTION_200();
      outlined consume of Data?(v27, v28);
      if ((v26 & 1) == 0)
        goto LABEL_20;
LABEL_23:
      if (v135 == 3)
      {
        if (v134 != 3)
          goto LABEL_20;
      }
      else if (v134 == 3 || v135 != v134)
      {
        goto LABEL_20;
      }
      if (v133)
      {
        if (!v132)
          goto LABEL_20;
        if (v130 != v129 || v133 != v132)
        {
          OUTLINED_FUNCTION_23();
          v16 = OUTLINED_FUNCTION_34();
          if ((v31 & 1) == 0)
            return v16 & 1;
        }
      }
      else if (v132)
      {
        goto LABEL_20;
      }
      if (v121)
      {
        v146 = v121;
        v33 = v122;
        v32 = v123;
        v147 = v122;
        v148 = v123;
        v35 = v124;
        v34 = v125;
        v149 = v124;
        v150 = v125;
        v37 = v126;
        v36 = v127;
        v151 = v126;
        v152 = v127;
        v153 = v131;
        v38 = v120;
        v154 = v120;
        if (v128)
        {
          v165 = v128;
          v166 = v113;
          v167 = v114;
          v168 = v115;
          v169 = v116;
          v170 = v117;
          v171 = v118;
          v172 = v119;
          v173 = v112;
          OUTLINED_FUNCTION_64();
          OUTLINED_FUNCTION_130();
          OUTLINED_FUNCTION_106();
          outlined copy of Data?(v126, v127);
          OUTLINED_FUNCTION_4();
          OUTLINED_FUNCTION_130();
          OUTLINED_FUNCTION_106();
          OUTLINED_FUNCTION_64();
          outlined copy of Data?(v126, v127);
          OUTLINED_FUNCTION_4();
          v140 = static SearchGlobalEntity.GeneralAttributes.== infix(_:_:)((uint64_t)&v146, (uint64_t)&v165);
          OUTLINED_FUNCTION_31();
          OUTLINED_FUNCTION_180();
          OUTLINED_FUNCTION_129();
          outlined consume of Data?(v126, v127);
          OUTLINED_FUNCTION_77();
          v57 = v120;
          outlined consume of SearchGlobalEntity.GeneralAttributes?(v121, v122, v123, v124, v125, v126, v127);
          if ((v140 & 1) == 0)
            goto LABEL_20;
LABEL_45:
          if (v111)
          {
            if (!v110)
              goto LABEL_20;
            swift_bridgeObjectRetain();
            v41 = OUTLINED_FUNCTION_4();
            v42 = specialized static Array<A>.== infix(_:_:)(v41, v110);
            OUTLINED_FUNCTION_77();
            OUTLINED_FUNCTION_58();
            if ((v42 & 1) == 0)
              goto LABEL_20;
          }
          else if (v110)
          {
            goto LABEL_20;
          }
          if (v109 == 3)
          {
            if (v108 != 3)
              goto LABEL_20;
          }
          else
          {
            v146 = v109;
            v147 = v107;
            v148 = v106;
            v149 = v105;
            LOBYTE(v150) = v104;
            if (v108 == 3)
              goto LABEL_20;
            LOBYTE(v165) = v108;
            v166 = v100;
            LOBYTE(v167) = v101 & 1;
            v168 = v103;
            LOBYTE(v169) = v102 & 1;
            if ((static SearchGlobalEntity.EventAttributes.== infix(_:_:)((unsigned __int8 *)&v146, (unsigned __int8 *)&v165) & 1) == 0)goto LABEL_20;
          }
          outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v174, (uint64_t)&v165, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
          if (_s15OmniSearchTypes0B12GlobalEntityV15PlaceAttributesVSgWOg((uint64_t)&v165) == 1)
          {
            outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v175, (uint64_t)&v146, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
            v43 = _s15OmniSearchTypes0B12GlobalEntityV15PlaceAttributesVSgWOg((uint64_t)&v146);
            if ((_DWORD)v43 == 1)
              goto LABEL_64;
          }
          else
          {
            OUTLINED_FUNCTION_49((uint64_t)v174, (uint64_t)v145);
            OUTLINED_FUNCTION_49((uint64_t)v175, (uint64_t)&v146);
            if (_s15OmniSearchTypes0B12GlobalEntityV15PlaceAttributesVSgWOg((uint64_t)&v146) != 1)
            {
              OUTLINED_FUNCTION_49((uint64_t)v175, (uint64_t)v142);
              OUTLINED_FUNCTION_207(&v141, v142);
              v51 = static SearchGlobalEntity.PlaceAttributes.== infix(_:_:)((uint64_t)v145, (uint64_t)&v141);
              OUTLINED_FUNCTION_207(v143, v145);
              OUTLINED_FUNCTION_49((uint64_t)v174, (uint64_t)v144);
              outlined retain of SearchGlobalEntity.PlaceAttributes((uint64_t)v144);
              v43 = outlined release of SearchGlobalEntity.PlaceAttributes((uint64_t)v143);
              if ((v51 & 1) == 0)
                goto LABEL_20;
LABEL_64:
              if (v99 == 1)
              {
                if (v14 == 1)
                  goto LABEL_66;
              }
              else
              {
                if (v14 != 1)
                {
                  if (v99)
                  {
                    if (!v14)
                      goto LABEL_20;
                    if (v95 != v94 || v99 != v14)
                    {
                      v43 = OUTLINED_FUNCTION_23();
                      if ((v43 & 1) == 0)
                        goto LABEL_20;
                    }
                  }
                  else if (v14)
                  {
                    goto LABEL_20;
                  }
                  if (v98)
                  {
                    if (!v97)
                      goto LABEL_20;
                    if (v93 != v92 || v98 != v97)
                    {
                      v43 = OUTLINED_FUNCTION_23();
                      if ((v43 & 1) == 0)
                        goto LABEL_20;
                    }
                  }
                  else if (v97)
                  {
                    goto LABEL_20;
                  }
LABEL_66:
                  if (v96 == 1)
                  {
                    v52 = v82;
                    if (v82 == 1)
                    {
LABEL_93:
                      if (v81 == 1)
                      {
                        if (v66 == 1)
                        {
LABEL_95:
                          if (HIDWORD(v63) == (_DWORD)v63
                            && (specialized static EntityProperty<>.== infix(_:_:)() & 1) != 0
                            && (specialized static EntityProperty<>.== infix(_:_:)() & 1) != 0)
                          {
                            v16 = specialized static EntityProperty<>.== infix(_:_:)();
                            return v16 & 1;
                          }
                          goto LABEL_20;
                        }
                        goto LABEL_101;
                      }
                      if (v66 == 1)
                      {
                        swift_bridgeObjectRetain();
LABEL_101:
                        outlined copy of SearchGlobalEntity.AppStoreAttributes?(v64, v66);
                        outlined consume of SearchGlobalEntity.AppStoreAttributes?(v65, v81);
                        outlined consume of SearchGlobalEntity.AppStoreAttributes?(v64, v66);
                        goto LABEL_20;
                      }
                      if (v81)
                      {
                        if (v66)
                        {
                          if (v65 == v64 && v81 == v66)
                          {
                            outlined copy of SearchGlobalEntity.AppStoreAttributes?(v65, v81);
                            OUTLINED_FUNCTION_129();
                            goto LABEL_95;
                          }
                          v56 = OUTLINED_FUNCTION_23();
                          outlined copy of SearchGlobalEntity.AppStoreAttributes?(v65, v81);
                          OUTLINED_FUNCTION_77();
                          if ((v56 & 1) != 0)
                            goto LABEL_95;
                        }
                        else
                        {
                          outlined copy of SearchGlobalEntity.AppStoreAttributes?(v65, v81);
                          OUTLINED_FUNCTION_129();
                        }
                      }
                      else if (!v66)
                      {
                        goto LABEL_95;
                      }
LABEL_20:
                      v16 = 0;
                      return v16 & 1;
                    }
                  }
                  else
                  {
                    OUTLINED_FUNCTION_50(v43, v44, v45, v46, v47, v48, v49, v50, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67,
                      v69,
                      v71,
                      v73,
                      v75,
                      v77,
                      v79,
                      v81,
                      v82,
                      v83,
                      v85,
                      v86,
                      v87,
                      v88,
                      v90,
                      v91,
                      v92,
                      v93,
                      v94,
                      v95,
                      v96);
                    v52 = v82;
                    v152 = v83;
                    v153 = v88;
                    if (v82 != 1)
                    {
                      v145[0] = v67;
                      v145[1] = v82;
                      v145[2] = v69;
                      v145[3] = v71;
                      v145[4] = v73;
                      v145[5] = v75;
                      v145[6] = v77;
                      v145[7] = v79;
                      if ((static SearchGlobalEntity.ContactAttributes.== infix(_:_:)(&v146, v145) & 1) == 0)
                        goto LABEL_20;
                      goto LABEL_93;
                    }
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    v43 = swift_bridgeObjectRetain();
                  }
                  OUTLINED_FUNCTION_50(v43, v44, v45, v46, v47, v48, v49, v50, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67,
                    v69,
                    v71,
                    v73,
                    v75,
                    v77,
                    v79,
                    v81,
                    v82,
                    v83,
                    v85,
                    v86,
                    v87,
                    v88,
                    v90,
                    v91,
                    v92,
                    v93,
                    v94,
                    v95,
                    v96);
                  v152 = v84;
                  v153 = v89;
                  v154 = v68;
                  v155 = v52;
                  v156 = v70;
                  v157 = v72;
                  v158 = v74;
                  v159 = v76;
                  v160 = v78;
                  v161 = v80;
                  outlined copy of SearchGlobalEntity.ContactAttributes?(v68, v52);
                  outlined release of (SearchGlobalEntity.ContactAttributes?, SearchGlobalEntity.ContactAttributes?)(&v146);
                  goto LABEL_20;
                }
                OUTLINED_FUNCTION_130();
                swift_bridgeObjectRetain();
              }
              outlined copy of SearchGlobalEntity.IDAttributes?(v94, v14);
              outlined consume of SearchGlobalEntity.IDAttributes?(v95, v99);
              outlined consume of SearchGlobalEntity.IDAttributes?(v94, v14);
              goto LABEL_20;
            }
            OUTLINED_FUNCTION_207(v142, v145);
            OUTLINED_FUNCTION_49((uint64_t)v174, (uint64_t)v143);
            OUTLINED_FUNCTION_49((uint64_t)v174, (uint64_t)v144);
            outlined retain of SearchGlobalEntity.PlaceAttributes((uint64_t)v144);
            outlined retain of SearchGlobalEntity.PlaceAttributes((uint64_t)v143);
            outlined release of SearchGlobalEntity.PlaceAttributes((uint64_t)v142);
          }
          OUTLINED_FUNCTION_49((uint64_t)v174, (uint64_t)&v146);
          OUTLINED_FUNCTION_49((uint64_t)v175, (uint64_t)&v164);
          outlined retain of SearchGlobalEntity.PlaceAttributes?((uint64_t)v175);
          outlined release of (SearchGlobalEntity.PlaceAttributes?, SearchGlobalEntity.PlaceAttributes?)(&v146);
          goto LABEL_20;
        }
        OUTLINED_FUNCTION_64();
        OUTLINED_FUNCTION_130();
        OUTLINED_FUNCTION_106();
        outlined copy of Data?(v126, v127);
        OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_130();
        OUTLINED_FUNCTION_106();
        OUTLINED_FUNCTION_64();
        outlined copy of Data?(v126, v127);
        OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_31();
        OUTLINED_FUNCTION_180();
        OUTLINED_FUNCTION_129();
        outlined consume of Data?(v126, v127);
        OUTLINED_FUNCTION_77();
        v40 = 0;
        v39 = v131;
      }
      else
      {
        v39 = v131;
        v37 = v126;
        v36 = v127;
        v35 = v124;
        v34 = v125;
        v33 = v122;
        v32 = v123;
        v38 = v120;
        v40 = v128;
        if (!v128)
          goto LABEL_45;
      }
      v146 = v121;
      v147 = v33;
      v148 = v32;
      v149 = v35;
      v150 = v34;
      v151 = v37;
      v152 = v36;
      v153 = v39;
      v154 = v38;
      v155 = v40;
      v156 = v113;
      v157 = v114;
      v158 = v115;
      v159 = v116;
      v160 = v117;
      v161 = v118;
      v162 = v119;
      v163 = v112;
      outlined copy of SearchGlobalEntity.GeneralAttributes?(v40, v113, v114, v115, v116, v117, v118);
      outlined release of (SearchGlobalEntity.GeneralAttributes?, SearchGlobalEntity.GeneralAttributes?)(&v146);
      goto LABEL_20;
    }
    outlined copy of Data?(v137, v138);
    outlined copy of Data?(v136, v13);
    v20 = OUTLINED_FUNCTION_6();
    outlined consume of Data?(v20, v21);
    OUTLINED_FUNCTION_167(v136);
    goto LABEL_20;
  }
  return v16 & 1;
}

uint64_t specialized static EntityProperty<>.== infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
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
  char *v13;
  uint64_t v14;
  int EnumTagSinglePayload;
  uint64_t *v16;
  char v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  uint64_t v21;
  uint64_t v22;

  v0 = type metadata accessor for IntentFile();
  v22 = *(_QWORD *)(v0 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (IntentFile?, IntentFile?));
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentFile?);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v21 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v21 - v12;
  EntityProperty.wrappedValue.getter();
  EntityProperty.wrappedValue.getter();
  v14 = (uint64_t)&v5[*(int *)(v3 + 48)];
  outlined init with copy of IntentFile?((uint64_t)v13, (uint64_t)v5, &demangling cache variable for type metadata for IntentFile?);
  outlined init with copy of IntentFile?((uint64_t)v11, v14, &demangling cache variable for type metadata for IntentFile?);
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v0) == 1)
  {
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v14, 1, v0);
    if (EnumTagSinglePayload == 1)
      v16 = &demangling cache variable for type metadata for IntentFile?;
    else
      v16 = &demangling cache variable for type metadata for (IntentFile?, IntentFile?);
    if (EnumTagSinglePayload == 1)
      v17 = -1;
    else
      v17 = 0;
  }
  else
  {
    outlined init with copy of IntentFile?((uint64_t)v5, (uint64_t)v8, &demangling cache variable for type metadata for IntentFile?);
    if (__swift_getEnumTagSinglePayload(v14, 1, v0) == 1)
    {
      (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v0);
      v17 = 0;
      v16 = &demangling cache variable for type metadata for (IntentFile?, IntentFile?);
    }
    else
    {
      v18 = v22;
      (*(void (**)(char *, uint64_t, uint64_t))(v22 + 32))(v2, v14, v0);
      lazy protocol witness table accessor for type IntentFile and conformance IntentFile((uint64_t)&lazy protocol witness table cache variable for type IntentFile and conformance IntentFile);
      v17 = dispatch thunk of static Equatable.== infix(_:_:)();
      v19 = *(void (**)(char *, uint64_t))(v18 + 8);
      v19(v2, v0);
      v19(v8, v0);
      v16 = &demangling cache variable for type metadata for IntentFile?;
    }
  }
  outlined destroy of IntentFile?((uint64_t)v5, v16);
  outlined destroy of IntentFile?((uint64_t)v11, &demangling cache variable for type metadata for IntentFile?);
  outlined destroy of IntentFile?((uint64_t)v13, &demangling cache variable for type metadata for IntentFile?);
  return v17 & 1;
}

{
  char v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  EntityProperty.wrappedValue.getter();
  EntityProperty.wrappedValue.getter();
  if (v6)
  {
    if (v4)
    {
      if (v5 == v3 && v6 == v4)
      {
        swift_bridgeObjectRelease();
        v1 = 1;
      }
      else
      {
        v1 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      v1 = 0;
    }
  }
  else
  {
    if (!v4)
    {
      v1 = 1;
      return v1 & 1;
    }
    v1 = 0;
  }
  swift_bridgeObjectRelease();
  return v1 & 1;
}

{
  char v0;
  _QWORD *v2;
  _QWORD *v3;

  EntityProperty.wrappedValue.getter();
  EntityProperty.wrappedValue.getter();
  v0 = specialized static Array<A>.== infix(_:_:)(v3, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t SearchGlobalEntity.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  char v15;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6E69616D6F64 && a2 == 0xE600000000000000;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x4449686372616573 && a2 == 0xE800000000000000;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x7954797469746E65 && a2 == 0xEA00000000006570;
        if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 1954047348 && a2 == 0xE400000000000000;
          if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0xD000000000000011 && a2 == 0x80000002433A7090
                 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else if (a1 == 0xD000000000000010 && a2 == 0x80000002433A70B0
                 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            v10 = a1 == 0x747441746E657665 && a2 == 0xEF73657475626972;
            if (v10 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else
            {
              v11 = a1 == 0x7474416563616C70 && a2 == 0xEF73657475626972;
              if (v11 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 8;
              }
              else
              {
                v12 = a1 == 0x6269727474416469 && a2 == 0xEC00000073657475;
                if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 9;
                }
                else if (a1 == 0xD000000000000011 && a2 == 0x80000002433A70D0
                       || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 10;
                }
                else if (a1 == 0xD000000000000012 && a2 == 0x80000002433A70F0
                       || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 11;
                }
                else if (a1 == 0xD000000000000016 && a2 == 0x80000002433A7110
                       || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 12;
                }
                else
                {
                  v13 = a1 == 0x6E65697265707865 && a2 == 0xEE00656C69466563;
                  if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 13;
                  }
                  else
                  {
                    v14 = a1 == 0x746169636F737361 && a2 == 0xEF79726575516465;
                    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 14;
                    }
                    else if (a1 == 0xD000000000000021 && a2 == 0x80000002433A7020)
                    {
                      swift_bridgeObjectRelease();
                      return 15;
                    }
                    else
                    {
                      v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
                      swift_bridgeObjectRelease();
                      if ((v15 & 1) != 0)
                        return 15;
                      else
                        return 16;
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

uint64_t SearchGlobalEntity.CodingKeys.init(intValue:)()
{
  return 16;
}

void SearchGlobalEntity.Timestamp.CodingKeys.hashValue.getter(unsigned __int8 a1)
{
  OUTLINED_FUNCTION_90();
  Hasher._combine(_:)(a1);
  OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_38();
}

uint64_t SearchGlobalEntity.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_24339488C + 4 * byte_2433A8035[a1]))(25705, 0xE200000000000000);
}

uint64_t sub_24339488C()
{
  return 0x6E69616D6F64;
}

uint64_t sub_2433948A0()
{
  return 0x4449686372616573;
}

uint64_t sub_2433948B8()
{
  return 0x7954797469746E65;
}

uint64_t sub_2433948D4()
{
  return 1954047348;
}

unint64_t sub_2433948E4()
{
  return 0xD000000000000011;
}

unint64_t sub_243394978()
{
  return 0xD000000000000012;
}

unint64_t sub_243394990()
{
  return 0xD000000000000016;
}

uint64_t sub_2433949A8()
{
  return 0x6E65697265707865;
}

uint64_t sub_2433949CC()
{
  return 0x746169636F737361;
}

void sub_2433949F0()
{
  JUMPOUT(0x243394A04);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SearchGlobalEntity.CodingKeys()
{
  unsigned __int8 *v0;

  return SearchGlobalEntity.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SearchGlobalEntity.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = SearchGlobalEntity.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance SearchGlobalEntity.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = SearchGlobalEntity.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SearchGlobalEntity.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SearchGlobalEntity.CodingKeys()
{
  lazy protocol witness table accessor for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys();
  return CodingKey.debugDescription.getter();
}

void SearchGlobalEntity.encode(to:)()
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
  _BYTE v44[200];

  OUTLINED_FUNCTION_2();
  v5 = v4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SearchGlobalEntity.CodingKeys>);
  OUTLINED_FUNCTION_153();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_168();
  v33 = *(_QWORD *)(v0 + 112);
  v34 = *(_QWORD *)(v0 + 104);
  v31 = *(_QWORD *)(v0 + 128);
  v32 = *(_QWORD *)(v0 + 120);
  v30 = *(_QWORD *)(v0 + 136);
  v25 = *(_QWORD *)(v0 + 152);
  v26 = *(_QWORD *)(v0 + 160);
  v29 = *(_QWORD *)(v0 + 168);
  v28 = *(_QWORD *)(v0 + 176);
  v27 = *(_BYTE *)(v0 + 184);
  outlined init with take of SearchGlobalEntity.PlaceAttributes?(v0 + 192, (uint64_t)v44, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  v21 = *(_QWORD *)(v0 + 384);
  v22 = *(_QWORD *)(v0 + 392);
  v23 = *(_QWORD *)(v0 + 408);
  v24 = *(_QWORD *)(v0 + 400);
  v13 = *(_QWORD *)(v0 + 416);
  v14 = *(_QWORD *)(v0 + 424);
  v19 = *(_QWORD *)(v0 + 440);
  v20 = *(_QWORD *)(v0 + 432);
  v17 = *(_QWORD *)(v0 + 456);
  v18 = *(_QWORD *)(v0 + 448);
  v15 = *(_QWORD *)(v0 + 472);
  v16 = *(_QWORD *)(v0 + 464);
  v11 = *(_QWORD *)(v0 + 480);
  v12 = *(_QWORD *)(v0 + 488);
  v9 = *(_QWORD *)(v0 + 512);
  v10 = *(_QWORD *)(v0 + 504);
  v8 = *(_QWORD *)(v0 + 520);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  lazy protocol witness table accessor for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v35) = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (v1)
  {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v6);
  }
  else
  {
    OUTLINED_FUNCTION_145();
    lazy protocol witness table accessor for type Data and conformance Data();
    OUTLINED_FUNCTION_11();
    lazy protocol witness table accessor for type SearchGlobalEntity.EntityType and conformance SearchGlobalEntity.EntityType();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_145();
    v39 = v34;
    v40 = v33;
    v41 = v32;
    v42 = v31;
    v43 = v30;
    lazy protocol witness table accessor for type SearchGlobalEntity.GeneralAttributes and conformance SearchGlobalEntity.GeneralAttributes();
    OUTLINED_FUNCTION_11();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SearchGlobalEntity.CustomAttribute]);
    lazy protocol witness table accessor for type [SearchGlobalEntity.CustomAttribute] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type [SearchGlobalEntity.CustomAttribute] and conformance <A> [A]);
    OUTLINED_FUNCTION_27();
    v35 = v25;
    v36 = v26;
    v37 = v29;
    v38 = v28;
    LOBYTE(v39) = v27;
    lazy protocol witness table accessor for type SearchGlobalEntity.EventAttributes and conformance SearchGlobalEntity.EventAttributes();
    OUTLINED_FUNCTION_11();
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v44, (uint64_t)&v35, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
    lazy protocol witness table accessor for type SearchGlobalEntity.PlaceAttributes and conformance SearchGlobalEntity.PlaceAttributes();
    OUTLINED_FUNCTION_11();
    v35 = v21;
    v36 = v22;
    v37 = v24;
    v38 = v23;
    lazy protocol witness table accessor for type SearchGlobalEntity.IDAttributes and conformance SearchGlobalEntity.IDAttributes();
    OUTLINED_FUNCTION_11();
    v35 = v13;
    v36 = v14;
    v37 = v20;
    v38 = v19;
    v39 = v18;
    v40 = v17;
    v41 = v16;
    v42 = v15;
    lazy protocol witness table accessor for type SearchGlobalEntity.ContactAttributes and conformance SearchGlobalEntity.ContactAttributes();
    OUTLINED_FUNCTION_27();
    v35 = v11;
    v36 = v12;
    lazy protocol witness table accessor for type SearchGlobalEntity.AppStoreAttributes and conformance SearchGlobalEntity.AppStoreAttributes();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    LOBYTE(v35) = 12;
    KeyedEncodingContainer.encode(_:forKey:)();
    v35 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<IntentFile?>);
    lazy protocol witness table accessor for type EntityProperty<IntentFile?> and conformance <> EntityProperty<A>();
    OUTLINED_FUNCTION_28();
    v35 = v9;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<String?>);
    lazy protocol witness table accessor for type EntityProperty<String?> and conformance <> EntityProperty<A>();
    OUTLINED_FUNCTION_28();
    v35 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<[String]>);
    lazy protocol witness table accessor for type EntityProperty<[String]> and conformance <> EntityProperty<A>();
    OUTLINED_FUNCTION_28();
    (*(void (**)(uint64_t, _QWORD))(v3 + 8))(v2, 0);
  }
  OUTLINED_FUNCTION_0_0();
}

void protocol witness for Encodable.encode(to:) in conformance SearchGlobalEntity()
{
  SearchGlobalEntity.encode(to:)();
}

void protocol witness for ExperienceProviding.experienceSourceType.getter in conformance SearchGlobalEntity(_BYTE *a1@<X8>)
{
  SearchGlobalEntity.experienceSourceType.getter(a1);
}

void protocol witness for Identifiable.id.getter in conformance SearchGlobalEntity(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  SearchGlobalEntity.id.getter();
  *a1 = v2;
  a1[1] = v3;
}

uint64_t protocol witness for static _IntentValue.defaultResolverSpecification.getter in conformance SearchGlobalEntity()
{
  lazy protocol witness table accessor for type SearchGlobalEntity and conformance SearchGlobalEntity();
  return static AppEntity.defaultResolverSpecification.getter();
}

uint64_t protocol witness for CustomLocalizedStringResourceConvertible.localizedStringResource.getter in conformance SearchGlobalEntity()
{
  lazy protocol witness table accessor for type SearchGlobalEntity and conformance SearchGlobalEntity();
  return InstanceDisplayRepresentable.localizedStringResource.getter();
}

void SearchGlobalEntity.init(entity:domain:isLowConfidenceKnowledge:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
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
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  char v93;
  uint64_t v94;
  char v95;
  void (*v96)(uint64_t, uint64_t);
  uint64_t v97;
  void (*v98)(uint64_t, uint64_t);
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  uint64_t v104;
  void (*v105)(uint64_t, uint64_t, uint64_t);
  uint64_t v106;
  os_log_type_t v107;
  uint8_t *v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  os_log_type_t v116;
  _DWORD *v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t (*v121)(uint64_t, uint64_t);
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
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
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
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
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void (*v186)(uint64_t, _QWORD);
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  unint64_t v192;
  uint64_t v193;
  void (*v194)(uint64_t, unint64_t, uint64_t);
  char *v195;
  uint64_t v196;
  uint64_t v197;
  unint64_t v198;
  unint64_t v199;
  __int128 v200;
  char *v201;
  char *v202;
  uint64_t v203;
  unint64_t v204;
  char v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  char v209;
  uint64_t v210;
  uint64_t v211;
  char v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  _QWORD v219[2];
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
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  uint64_t v262;
  uint64_t v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  __int128 v272;
  __int128 v273;
  uint64_t v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  _BYTE v278[200];
  _QWORD v279[6];
  char v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  unsigned __int8 v297;
  _QWORD v298[38];
  unsigned __int8 v299;
  uint64_t v300;
  __int128 v301;
  _QWORD v302[63];
  _DWORD v303[132];
  _OWORD v304[2];
  uint64_t v305;
  unint64_t v306;
  char v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  uint64_t v313;
  char *v314;
  __int128 v315;
  uint64_t v316;
  uint64_t v317;
  char v318;
  _OWORD v319[18];
  uint64_t v320;
  uint64_t v321;
  char v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  char v346;
  _QWORD v347[38];
  char v348;
  uint64_t v349;
  __int128 v350;
  __int128 v351;
  uint64_t v352;
  __int128 v353;
  uint64_t v354;
  _BYTE v355[192];
  __int128 v356;
  __int128 v357;
  char *v358;
  unint64_t v359;
  char v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  uint64_t v366;
  char *v367;
  __int128 v368;
  uint64_t v369;
  uint64_t v370;
  unsigned __int8 v371;
  _BYTE v372[192];
  __int128 v373;
  __int128 v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  uint64_t v379;
  uint64_t v380;
  char v381;
  _OWORD v382[12];
  _BYTE v383[32];
  uint64_t v384;
  unint64_t v385;
  char v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  char v397;
  _OWORD v398[13];
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  uint64_t v406;
  uint64_t v407;
  char v408;

  v3 = MEMORY[0x24BDAC7A8](a1);
  LODWORD(v272) = v4;
  *(_QWORD *)&v266 = v5;
  *(_QWORD *)&v265 = v6;
  v270 = v3;
  v267 = v7;
  *(_QWORD *)&v273 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute();
  *(_QWORD *)&v277 = *(_QWORD *)(v273 - 8);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_8();
  v274 = v9;
  OUTLINED_FUNCTION_72();
  *(_QWORD *)&v258 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityAppstoreAttributes();
  *(_QWORD *)&v257 = *(_QWORD *)(v258 - 8);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_8();
  *(_QWORD *)&v256 = v11;
  OUTLINED_FUNCTION_72();
  *(_QWORD *)&v255 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityIDAttributes();
  v253 = *(_QWORD *)(v255 - 8);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_17();
  *(_QWORD *)&v254 = v13;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_104();
  v252 = v15;
  OUTLINED_FUNCTION_72();
  v251 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityEventAttributes();
  v248 = *(_QWORD *)(v251 - 8);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_17();
  v250 = v17;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_32();
  v249 = v19;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_104();
  v247 = v21;
  OUTLINED_FUNCTION_72();
  v246 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityContactAttributes();
  v242 = *(_QWORD *)(v246 - 8);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_17();
  v245 = v23;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_32();
  v244 = v25;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_32();
  v243 = v27;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_104();
  v241 = v29;
  OUTLINED_FUNCTION_72();
  v240 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes();
  v230 = *(_QWORD *)(v240 - 8);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_17();
  v239 = v31;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_32();
  v238 = v33;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_32();
  v237 = v35;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v36);
  OUTLINED_FUNCTION_32();
  v236 = v37;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_32();
  v235 = v39;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_32();
  v234 = v41;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_32();
  v233 = v43;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v44);
  OUTLINED_FUNCTION_32();
  v232 = v45;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v46);
  OUTLINED_FUNCTION_32();
  v231 = v47;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v48);
  OUTLINED_FUNCTION_104();
  v229 = v49;
  OUTLINED_FUNCTION_72();
  *(_QWORD *)&v260 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes();
  v225 = *(_QWORD *)(v260 - 8);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8](v50);
  OUTLINED_FUNCTION_17();
  v228 = v51;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v52);
  OUTLINED_FUNCTION_32();
  v227 = v53;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v54);
  OUTLINED_FUNCTION_32();
  v226 = v55;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v56);
  OUTLINED_FUNCTION_32();
  v222 = v57;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v58);
  OUTLINED_FUNCTION_104();
  *(_QWORD *)&v259 = v59;
  OUTLINED_FUNCTION_72();
  v60 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityMetadata();
  v262 = *(_QWORD *)(v60 - 8);
  v263 = v60;
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8](v61);
  OUTLINED_FUNCTION_8();
  v271 = v62;
  OUTLINED_FUNCTION_72();
  v63 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntity();
  v64 = *(_QWORD *)(v63 - 8);
  v268 = v63;
  v269 = v64;
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8](v65);
  OUTLINED_FUNCTION_17();
  v224 = v66;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v67);
  OUTLINED_FUNCTION_32();
  *(_QWORD *)&v261 = v68;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v69);
  OUTLINED_FUNCTION_104();
  v223 = v70;
  OUTLINED_FUNCTION_72();
  *(_QWORD *)&v276 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityType();
  *(_QWORD *)&v275 = *(_QWORD *)(v276 - 8);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8](v71);
  OUTLINED_FUNCTION_17();
  v219[1] = v72;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v73);
  v75 = (char *)v219 - v74;
  v76 = type metadata accessor for Google_Protobuf_Any();
  *(_QWORD *)&v264 = *(_QWORD *)(v76 - 8);
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8](v77);
  OUTLINED_FUNCTION_17();
  v220 = v78;
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v79);
  v81 = (char *)v219 - v80;
  v82 = type metadata accessor for UUID();
  OUTLINED_FUNCTION_44();
  MEMORY[0x24BDAC7A8](v83);
  OUTLINED_FUNCTION_169();
  _s15OmniSearchTypes0B12GlobalEntityV15PlaceAttributesVSgWOi0_(v382);
  memset(v383, 0, sizeof(v383));
  v384 = 0;
  v385 = 0xF000000000000000;
  v386 = 3;
  v387 = 0u;
  v388 = 0u;
  v389 = 0u;
  v390 = 0u;
  v391 = 0u;
  v392 = 0u;
  v393 = 3;
  v394 = 0;
  v396 = 0;
  v395 = 0;
  v397 = 0;
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v382, (uint64_t)v398, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
  v398[12] = xmmword_2433A9C00;
  v399 = 0;
  v400 = 0;
  v401 = 0;
  v402 = 1;
  v403 = 0u;
  v404 = 0u;
  v405 = 0u;
  v406 = 0;
  v407 = 1;
  v408 = 0;
  OUTLINED_FUNCTION_61(&v356, v383);
  UUID.init()();
  v84 = UUID.uuidString.getter();
  v86 = v85;
  OUTLINED_FUNCTION_47(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  swift_bridgeObjectRelease();
  *(_QWORD *)&v356 = v84;
  v87 = v270;
  *((_QWORD *)&v356 + 1) = v86;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v357 = v265;
  *((_QWORD *)&v357 + 1) = v266;
  v381 = v272;
  v88 = Apple_Parsec_Siri_V2alpha_AppEntity.hasSearchID.getter();
  v221 = v76;
  if ((v88 & 1) != 0)
  {
    Apple_Parsec_Siri_V2alpha_AppEntity.searchID.getter();
    lazy protocol witness table accessor for type IntentFile and conformance IntentFile((uint64_t)&lazy protocol witness table cache variable for type Google_Protobuf_Any and conformance Google_Protobuf_Any);
    Message.serializedData(partial:)();
    OUTLINED_FUNCTION_162();
    OUTLINED_FUNCTION_101((uint64_t)v81, *(uint64_t (**)(uint64_t, uint64_t))(v264 + 8));
    outlined consume of Data?((uint64_t)v358, v359);
    v358 = v81;
    v359 = v82;
  }
  v89 = v273;
  v90 = v274;
  v91 = v276;
  Apple_Parsec_Siri_V2alpha_AppEntity.type.getter();
  v92 = (*(uint64_t (**)(char *, uint64_t))(v275 + 88))(v75, v91);
  if (v92 == *MEMORY[0x24BE70828])
  {
    v93 = 2;
LABEL_9:
    v360 = v93;
    goto LABEL_10;
  }
  if (v92 == *MEMORY[0x24BE70820])
  {
    v360 = 0;
    goto LABEL_10;
  }
  if (v92 == *MEMORY[0x24BE70818])
  {
    v93 = 1;
    goto LABEL_9;
  }
  if (one-time initialization token for search != -1)
    swift_once();
  v112 = OUTLINED_FUNCTION_112();
  v113 = (void *)__swift_project_value_buffer(v112, (uint64_t)static Logging.search);
  v114 = v269;
  v115 = v223;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v269 + 16))(v223, v87, v268);
  Logger.logObject.getter();
  v116 = OUTLINED_FUNCTION_163();
  if (OUTLINED_FUNCTION_148(v116))
  {
    *(_QWORD *)&v272 = v113;
    v117 = (_DWORD *)OUTLINED_FUNCTION_70();
    *(_QWORD *)&v266 = OUTLINED_FUNCTION_70();
    *(_QWORD *)&v351 = v266;
    *(_QWORD *)&v265 = v117;
    *v117 = 136315138;
    v219[0] = v117 + 1;
    Apple_Parsec_Siri_V2alpha_AppEntity.type.getter();
    v118 = String.init<A>(describing:)();
    v120 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v118, v119, (uint64_t *)&v351);
    OUTLINED_FUNCTION_173(v120);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    OUTLINED_FUNCTION_77();
    OUTLINED_FUNCTION_101(v223, *(uint64_t (**)(uint64_t, uint64_t))(v114 + 8));
    OUTLINED_FUNCTION_174(&dword_243387000, v272, (os_log_type_t)v82, "Unknown AppEntity type %s", (uint8_t *)v265);
    OUTLINED_FUNCTION_176();
    OUTLINED_FUNCTION_25();
  }
  OUTLINED_FUNCTION_101(v115, *(uint64_t (**)(uint64_t, uint64_t))(v114 + 8));

  v360 = 2;
  (*(void (**)(char *, _QWORD))(v275 + 8))(v75, v276);
  v89 = v273;
LABEL_10:
  if ((Apple_Parsec_Siri_V2alpha_AppEntity.hasMetadata.getter() & 1) != 0)
  {
    Apple_Parsec_Siri_V2alpha_AppEntity.metadata.getter();
    if ((Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasGeneralAttributes.getter() & 1) != 0)
    {
      v94 = v259;
      OUTLINED_FUNCTION_66();
      v95 = Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.hasThumbnailData.getter();
      v96 = *(void (**)(uint64_t, uint64_t))(v225 + 8);
      v97 = v260;
      v96(v94, v260);
      if ((v95 & 1) != 0)
      {
        v98 = v96;
        v99 = v222;
        Apple_Parsec_Siri_V2alpha_AppEntityMetadata.generalAttributes.getter();
        v100 = v220;
        Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.thumbnailData.getter();
        *(_QWORD *)&v272 = v98;
        v98(v99, v97);
        lazy protocol witness table accessor for type IntentFile and conformance IntentFile((uint64_t)&lazy protocol witness table cache variable for type Google_Protobuf_Any and conformance Google_Protobuf_Any);
        v101 = Message.serializedData(partial:)();
        v121 = *(uint64_t (**)(uint64_t, uint64_t))(v264 + 8);
        *(_QWORD *)&v276 = v101;
        *(_QWORD *)&v275 = v122;
        OUTLINED_FUNCTION_47(v100, v121);
      }
      else
      {
        *(_QWORD *)&v276 = 0;
        *(_QWORD *)&v275 = 0xF000000000000000;
      }
      v123 = OUTLINED_FUNCTION_66();
      *(_QWORD *)&v272 = MEMORY[0x2494F734C](v123);
      OUTLINED_FUNCTION_48();
      OUTLINED_FUNCTION_66();
      v124 = Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.contentURL.getter();
      v126 = v125;
      OUTLINED_FUNCTION_48();
      *(_QWORD *)&v266 = String.nilIfEmpty.getter(v124, v126);
      *(_QWORD *)&v265 = v127;
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_66();
      Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.displayName.getter();
      OUTLINED_FUNCTION_48();
      v128 = OUTLINED_FUNCTION_30();
      *(_QWORD *)&v264 = v129;
      OUTLINED_FUNCTION_87();
      v130 = v228;
      OUTLINED_FUNCTION_66();
      v131 = Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.title.getter();
      OUTLINED_FUNCTION_48();
      OUTLINED_FUNCTION_30();
      OUTLINED_FUNCTION_202();
      OUTLINED_FUNCTION_87();
      outlined consume of SearchGlobalEntity.GeneralAttributes?(v362, *((uint64_t *)&v362 + 1), v363, *((uint64_t *)&v363 + 1), v364, *((uint64_t *)&v364 + 1), v365);
      *(_QWORD *)&v362 = v272;
      *((_QWORD *)&v362 + 1) = v266;
      *(_QWORD *)&v363 = v265;
      *((_QWORD *)&v363 + 1) = v128;
      *(_QWORD *)&v364 = v264;
      *((_QWORD *)&v364 + 1) = v276;
      *(_QWORD *)&v365 = v275;
      *((_QWORD *)&v365 + 1) = v131;
      v366 = v130;
      v90 = v274;
    }
    if ((Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasPlaceAttributes.getter() & 1) != 0)
    {
      v132 = v229;
      OUTLINED_FUNCTION_20();
      Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.latitude.getter();
      v134 = v133;
      OUTLINED_FUNCTION_43(v132);
      OUTLINED_FUNCTION_20();
      Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.longitude.getter();
      v136 = v135;
      OUTLINED_FUNCTION_29();
      v137 = v136;
      LODWORD(v272) = v134 == 0.0 && v136 == 0.0;
      if (v134 == 0.0 && v136 == 0.0)
        v137 = 0.0;
      *(double *)&v276 = v137;
      if (v134 == 0.0 && v136 == 0.0)
        v138 = 0.0;
      else
        v138 = v134;
      *(double *)&v275 = v138;
      OUTLINED_FUNCTION_20();
      Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.name.getter();
      OUTLINED_FUNCTION_16();
      *(_QWORD *)&v266 = OUTLINED_FUNCTION_21();
      *(_QWORD *)&v265 = v139;
      OUTLINED_FUNCTION_58();
      OUTLINED_FUNCTION_20();
      Apple_Parsec_Siri_V2alpha_Timestamp.timezone.getter();
      OUTLINED_FUNCTION_16();
      *(_QWORD *)&v264 = OUTLINED_FUNCTION_21();
      *(_QWORD *)&v261 = v140;
      OUTLINED_FUNCTION_58();
      OUTLINED_FUNCTION_20();
      Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.subLocality.getter();
      OUTLINED_FUNCTION_16();
      *(_QWORD *)&v260 = OUTLINED_FUNCTION_21();
      *(_QWORD *)&v259 = v141;
      OUTLINED_FUNCTION_58();
      OUTLINED_FUNCTION_20();
      Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.administrativeArea.getter();
      OUTLINED_FUNCTION_16();
      v142 = OUTLINED_FUNCTION_21();
      v232 = v143;
      v233 = v142;
      OUTLINED_FUNCTION_58();
      OUTLINED_FUNCTION_20();
      Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.subAdministrativeArea.getter();
      OUTLINED_FUNCTION_16();
      v234 = OUTLINED_FUNCTION_21();
      v231 = v144;
      OUTLINED_FUNCTION_58();
      OUTLINED_FUNCTION_20();
      Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.country.getter();
      OUTLINED_FUNCTION_16();
      v235 = OUTLINED_FUNCTION_21();
      v230 = v145;
      OUTLINED_FUNCTION_58();
      v146 = v236;
      OUTLINED_FUNCTION_42();
      Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.isoCountryCode.getter();
      OUTLINED_FUNCTION_162();
      OUTLINED_FUNCTION_43(v146);
      v236 = OUTLINED_FUNCTION_217();
      v229 = v147;
      OUTLINED_FUNCTION_31();
      v148 = v237;
      OUTLINED_FUNCTION_42();
      Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.postalAddress.getter();
      OUTLINED_FUNCTION_43(v148);
      v237 = OUTLINED_FUNCTION_30();
      v228 = v149;
      OUTLINED_FUNCTION_87();
      v150 = v238;
      OUTLINED_FUNCTION_42();
      Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.subThoroughfare.getter();
      OUTLINED_FUNCTION_43(v150);
      v151 = OUTLINED_FUNCTION_30();
      v238 = v152;
      OUTLINED_FUNCTION_87();
      v153 = v239;
      OUTLINED_FUNCTION_20();
      v154 = Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.thoroughfare.getter();
      v90 = v155;
      OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_30();
      OUTLINED_FUNCTION_122();
      LOBYTE(v279[0]) = v272 & 1;
      LOBYTE(v304[0]) = v272 & 1;
      v323 = v266;
      v324 = v265;
      v325 = v264;
      v326 = v261;
      v327 = v260;
      v328 = v259;
      v329 = v233;
      v330 = v232;
      v331 = v234;
      v332 = v231;
      v333 = v235;
      v334 = v230;
      v335 = v236;
      v336 = v229;
      v337 = v237;
      v338 = v228;
      v339 = v151;
      v340 = v238;
      v341 = v154;
      v342 = v153;
      v343 = v275;
      LOBYTE(v344) = v272 & 1;
      *(_DWORD *)((char *)&v344 + 1) = v303[0];
      HIDWORD(v344) = *(_DWORD *)((char *)v303 + 3);
      v345 = v276;
      v346 = v272 & 1;
      SearchGlobalEntity.GeneralAttributes.alternateNames.modify(&v323);
      outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v372, (uint64_t)&v351, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
      outlined retain of SearchGlobalEntity.PlaceAttributes?((uint64_t)&v351);
      outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)&v323, (uint64_t)v372, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
    }
    if ((Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasContactAttribute.getter() & 1) != 0)
    {
      v156 = v241;
      v157 = Apple_Parsec_Siri_V2alpha_AppEntityMetadata.contactAttribute.getter();
      MEMORY[0x2494F7304](v157);
      OUTLINED_FUNCTION_162();
      OUTLINED_FUNCTION_99(v156);
      *(_QWORD *)&v276 = OUTLINED_FUNCTION_217();
      *(_QWORD *)&v275 = v158;
      OUTLINED_FUNCTION_31();
      v159 = v243;
      v160 = OUTLINED_FUNCTION_188();
      MEMORY[0x2494F7310](v160);
      OUTLINED_FUNCTION_99(v159);
      *(_QWORD *)&v272 = OUTLINED_FUNCTION_30();
      *(_QWORD *)&v266 = v161;
      OUTLINED_FUNCTION_87();
      v162 = v244;
      v163 = OUTLINED_FUNCTION_188();
      MEMORY[0x2494F72F8](v163);
      OUTLINED_FUNCTION_99(v162);
      v164 = OUTLINED_FUNCTION_30();
      v166 = v165;
      OUTLINED_FUNCTION_87();
      v167 = v245;
      v168 = OUTLINED_FUNCTION_188();
      v169 = MEMORY[0x2494F72EC](v168);
      v90 = v170;
      OUTLINED_FUNCTION_99(v167);
      OUTLINED_FUNCTION_30();
      OUTLINED_FUNCTION_122();
      outlined consume of SearchGlobalEntity.ContactAttributes?(v375, *((uint64_t *)&v375 + 1));
      *(_QWORD *)&v375 = v276;
      *((_QWORD *)&v375 + 1) = v275;
      *(_QWORD *)&v376 = v272;
      *((_QWORD *)&v376 + 1) = v266;
      *(_QWORD *)&v377 = v164;
      *((_QWORD *)&v377 + 1) = v166;
      *(_QWORD *)&v378 = v169;
      *((_QWORD *)&v378 + 1) = v167;
    }
    if ((Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasEventAttributes.getter() & 1) != 0)
    {
      v171 = v247;
      OUTLINED_FUNCTION_121();
      *(_QWORD *)&v276 = Apple_Parsec_Siri_V2alpha_AppEntityEventAttributes.allDay.getter();
      (*(void (**)(uint64_t, uint64_t))(v248 + 8))(v171, v251);
      v172 = OUTLINED_FUNCTION_121();
      v173 = MEMORY[0x2494F7238](v172);
      OUTLINED_FUNCTION_48();
      OUTLINED_FUNCTION_121();
      v174 = Apple_Parsec_Siri_V2alpha_AppEntityEventAttributes.endDate.getter();
      OUTLINED_FUNCTION_48();
      *(_QWORD *)&v368 = v276 & 1;
      *((_QWORD *)&v368 + 1) = v173;
      v369 = 0;
      v370 = v174;
      v371 = 0;
    }
    if ((Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasIDAttributes.getter() & 1) != 0)
    {
      v175 = v252;
      v176 = Apple_Parsec_Siri_V2alpha_AppEntityMetadata.idAttributes.getter();
      MEMORY[0x2494F71D8](v176);
      OUTLINED_FUNCTION_202();
      OUTLINED_FUNCTION_99(v175);
      *(_QWORD *)&v276 = OUTLINED_FUNCTION_21();
      v178 = v177;
      OUTLINED_FUNCTION_58();
      v179 = v254;
      v180 = Apple_Parsec_Siri_V2alpha_AppEntityMetadata.idAttributes.getter();
      MEMORY[0x2494F71E4](v180);
      OUTLINED_FUNCTION_202();
      OUTLINED_FUNCTION_99(v179);
      v181 = OUTLINED_FUNCTION_21();
      v183 = v182;
      OUTLINED_FUNCTION_58();
      outlined consume of SearchGlobalEntity.IDAttributes?(v373, *((uint64_t *)&v373 + 1));
      *(_QWORD *)&v373 = v276;
      *((_QWORD *)&v373 + 1) = v178;
      *(_QWORD *)&v374 = v181;
      *((_QWORD *)&v374 + 1) = v183;
    }
    if ((Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasAppAttribute.getter() & 1) != 0)
    {
      v184 = Apple_Parsec_Siri_V2alpha_AppEntityMetadata.appAttribute.getter();
      MEMORY[0x2494F737C](v184);
      OUTLINED_FUNCTION_202();
      v185 = OUTLINED_FUNCTION_136();
      v186(v185, v258);
      v187 = OUTLINED_FUNCTION_21();
      v189 = v188;
      OUTLINED_FUNCTION_58();
      outlined consume of SearchGlobalEntity.AppStoreAttributes?(v379, v380);
      v379 = v187;
      v380 = v189;
    }
    v190 = Apple_Parsec_Siri_V2alpha_AppEntityMetadata.customAttributes.getter();
    v191 = *(_QWORD *)(v190 + 16);
    if (v191)
    {
      v192 = v190 + ((*(unsigned __int8 *)(v277 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v277 + 80));
      v193 = *(_QWORD *)(v277 + 72);
      v194 = *(void (**)(uint64_t, unint64_t, uint64_t))(v277 + 16);
      *(_QWORD *)&v266 = v190;
      swift_bridgeObjectRetain();
      v195 = (char *)MEMORY[0x24BEE4AF8];
      *(_QWORD *)&v272 = v193;
      do
      {
        v194(v90, v192, v89);
        closure #1 in SearchGlobalEntity.init(entity:domain:isLowConfidenceKnowledge:)(v90, (uint64_t)&v351);
        OUTLINED_FUNCTION_101(v90, *(uint64_t (**)(uint64_t, uint64_t))(v277 + 8));
        if ((unint64_t)v353 >> 1 != 0xFFFFFFFF)
        {
          v276 = v353;
          v275 = v351;
          v196 = v352;
          v197 = v354;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v195 = OUTLINED_FUNCTION_175(0, *((_QWORD *)v195 + 2) + 1);
          v199 = *((_QWORD *)v195 + 2);
          v198 = *((_QWORD *)v195 + 3);
          v200 = v276;
          if (v199 >= v198 >> 1)
          {
            v202 = OUTLINED_FUNCTION_175((char *)(v198 > 1), v199 + 1);
            v200 = v276;
            v195 = v202;
          }
          *((_QWORD *)v195 + 2) = v199 + 1;
          v201 = &v195[48 * v199];
          *((_OWORD *)v201 + 2) = v275;
          *((_QWORD *)v201 + 6) = v196;
          *(_OWORD *)(v201 + 56) = v200;
          *((_QWORD *)v201 + 9) = v197;
          v89 = v273;
          v90 = v274;
          v193 = v272;
        }
        v192 += v193;
        --v191;
      }
      while (v191);
      swift_bridgeObjectRelease_n();
    }
    else
    {
      swift_bridgeObjectRelease();
      v195 = (char *)MEMORY[0x24BEE4AF8];
    }
    swift_bridgeObjectRelease();
    v367 = v195;
    v272 = v357;
    v273 = v356;
    v203 = (uint64_t)v358;
    v204 = v359;
    v205 = v360;
    v265 = v362;
    v266 = v361;
    v264 = v363;
    v260 = v365;
    v261 = v364;
    v277 = v368;
    v206 = v366;
    *(_QWORD *)&v276 = v369;
    *(_QWORD *)&v275 = v370;
    LODWORD(v274) = v371;
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v372, (uint64_t)v278, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
    v258 = v374;
    v259 = v373;
    v256 = v376;
    v257 = v375;
    v254 = v378;
    v255 = v377;
    v207 = v379;
    v208 = v380;
    v209 = v381;
    v304[0] = v273;
    v304[1] = v272;
    v305 = v203;
    v306 = v204;
    v307 = v205;
    v308 = v266;
    v309 = v265;
    v310 = v264;
    v311 = v261;
    v312 = v260;
    v313 = v206;
    v314 = v195;
    v315 = v277;
    v316 = v276;
    v317 = v275;
    v318 = v274;
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v278, (uint64_t)v319, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
    v319[12] = v259;
    v319[13] = v258;
    v319[14] = v257;
    v319[15] = v256;
    v319[16] = v255;
    v319[17] = v254;
    v320 = v207;
    v321 = v208;
    v322 = v209;
    OUTLINED_FUNCTION_61(v279, v304);
    outlined retain of SearchGlobalEntity.Builder(v304);
    OUTLINED_FUNCTION_219();
    (*(void (**)(uint64_t, uint64_t))(v269 + 8))(v270, v268);
    (*(void (**)(uint64_t, uint64_t))(v262 + 8))(v271, v263);
  }
  else
  {
    if (one-time initialization token for search != -1)
      swift_once();
    v102 = OUTLINED_FUNCTION_112();
    v103 = __swift_project_value_buffer(v102, (uint64_t)static Logging.search);
    v104 = v268;
    v105 = *(void (**)(uint64_t, uint64_t, uint64_t))(v269 + 16);
    v106 = v261;
    v105(v261, v87, v268);
    Logger.logObject.getter();
    v107 = OUTLINED_FUNCTION_163();
    if (os_log_type_enabled(v103, v107))
    {
      v108 = (uint8_t *)OUTLINED_FUNCTION_70();
      *(_QWORD *)&v351 = OUTLINED_FUNCTION_70();
      *(_DWORD *)v108 = 136315138;
      *(_QWORD *)&v277 = v108 + 4;
      v105(v224, v106, v104);
      OUTLINED_FUNCTION_179();
      v109 = String.init<A>(describing:)();
      v111 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v109, v110, (uint64_t *)&v351);
      OUTLINED_FUNCTION_173(v111);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_178(v106);
      OUTLINED_FUNCTION_174(&dword_243387000, v103, v107, "AppEntity missing metadata %s", v108);
      OUTLINED_FUNCTION_176();
      OUTLINED_FUNCTION_25();
    }
    OUTLINED_FUNCTION_178(v106);

    OUTLINED_FUNCTION_55(v304);
    OUTLINED_FUNCTION_55(v279);
    outlined retain of SearchGlobalEntity.Builder(v304);
    OUTLINED_FUNCTION_219();
    OUTLINED_FUNCTION_178(v87);
  }
  OUTLINED_FUNCTION_76((uint64_t)v303, (uint64_t)&v323);
  OUTLINED_FUNCTION_76((uint64_t)&v323, (uint64_t)&v351);
  if (_s15OmniSearchTypes0B12GlobalEntityVSgWOg((uint64_t)&v351) == 1)
  {
    OUTLINED_FUNCTION_55(v279);
    outlined release of SearchGlobalEntity.Builder(v279);
    _s15OmniSearchTypes0B12GlobalEntityVSgWOi0_(&v351);
  }
  else
  {
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)&v323, (uint64_t)v279, &demangling cache variable for type metadata for SearchGlobalEntity?);
    OUTLINED_FUNCTION_55(v302);
    outlined release of SearchGlobalEntity.Builder(v302);
    v277 = v301;
    *(_QWORD *)&v276 = v300;
    LODWORD(v275) = v299;
    v274 = v298[36];
    *(_QWORD *)&v273 = v298[37];
    *(_QWORD *)&v272 = v298[28];
    v271 = v298[29];
    v269 = v298[31];
    v270 = v298[30];
    v268 = v298[32];
    *(_QWORD *)&v266 = v298[33];
    *(_QWORD *)&v265 = v298[34];
    v263 = v298[24];
    *(_QWORD *)&v264 = v298[35];
    v262 = v298[25];
    *(_QWORD *)&v261 = v298[26];
    *(_QWORD *)&v260 = v298[27];
    *(_QWORD *)&v259 = v293;
    *(_QWORD *)&v258 = v294;
    *(_QWORD *)&v257 = v295;
    *(_QWORD *)&v256 = v296;
    LODWORD(v255) = v297;
    v253 = v284;
    *(_QWORD *)&v254 = v283;
    v251 = v286;
    v252 = v285;
    v249 = v288;
    v250 = v287;
    v247 = v292;
    v248 = v289;
    v245 = v291;
    v246 = v290;
    v210 = v281;
    v211 = v282;
    v212 = v280;
    v213 = v279[4];
    v214 = v279[5];
    v215 = v279[2];
    v216 = v279[3];
    v217 = v279[0];
    v218 = v279[1];
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v298, (uint64_t)v355, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
    v323 = v217;
    v324 = v218;
    v325 = v215;
    v326 = v216;
    v327 = v213;
    v328 = v214;
    LOBYTE(v329) = v212;
    v330 = v210;
    v331 = v211;
    v332 = v254;
    v333 = v253;
    v334 = v252;
    v335 = v251;
    v336 = v250;
    v337 = v249;
    v338 = v248;
    v339 = v246;
    v340 = v245;
    v341 = v247;
    v342 = v259;
    v343 = v258;
    v344 = v257;
    v345 = v256;
    v346 = v255;
    outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v355, (uint64_t)v347, &demangling cache variable for type metadata for SearchGlobalEntity.PlaceAttributes?);
    v347[24] = v263;
    v347[25] = v262;
    v347[26] = v261;
    v347[27] = v260;
    v347[28] = v272;
    v347[29] = v271;
    v347[30] = v270;
    v347[31] = v269;
    v347[32] = v268;
    v347[33] = v266;
    v347[34] = v265;
    v347[35] = v264;
    v347[36] = v274;
    v347[37] = v273;
    v348 = v275;
    v349 = v276;
    v350 = v277;
    OUTLINED_FUNCTION_117(&v351, &v323);
    SearchGlobalEntity.GeneralAttributes.alternateNames.modify(&v351);
  }
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)&v351, v267, &demangling cache variable for type metadata for SearchGlobalEntity?);
}

void closure #1 in SearchGlobalEntity.init(entity:domain:isLowConfidenceKnowledge:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  char *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  unint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t *v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t *v54;
  uint8_t *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;

  v58 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute();
  v4 = *(_QWORD *)(v58 - 8);
  v5 = MEMORY[0x24BDAC7A8](v58);
  v56 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v59 = (char *)&v53 - v7;
  v8 = (uint8_t *)type metadata accessor for Apple_Parsec_Siri_V2alpha_Temperature();
  v54 = (uint8_t *)*((_QWORD *)v8 - 1);
  v55 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Apple_Parsec_Siri_V2alpha_Timestamp();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute.OneOf_Value?);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (uint64_t *)((char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v53 - v19;
  v57 = a1;
  Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute.value.getter();
  v21 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute.OneOf_Value();
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v21) != 1)
  {
    v53 = v4;
    outlined init with copy of IntentFile?((uint64_t)v20, (uint64_t)v18, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute.OneOf_Value?);
    v34 = *(_QWORD *)(v21 - 8);
    v35 = (*(uint64_t (**)(_QWORD *, uint64_t))(v34 + 88))(v18, v21);
    if (v35 == *MEMORY[0x24BE710D0])
    {
      (*(void (**)(_QWORD *, uint64_t))(v34 + 96))(v18, v21);
      v36 = v18[1];
      *(_QWORD *)a2 = *v18;
      *(_QWORD *)(a2 + 8) = v36;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      goto LABEL_14;
    }
    if (v35 == *MEMORY[0x24BE710E0])
    {
      (*(void (**)(_QWORD *, uint64_t))(v34 + 96))(v18, v21);
      (*(void (**)(char *, _QWORD *, uint64_t))(v12 + 32))(v14, v18, v11);
      v37 = Apple_Parsec_Siri_V2alpha_Timestamp.seconds.getter();
      v38 = Apple_Parsec_Siri_V2alpha_Timestamp.utcOffset.getter();
      v39 = Apple_Parsec_Siri_V2alpha_Timestamp.timezone.getter();
      v41 = v40;
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      v42 = String.nilIfEmpty.getter(v39, v41);
      v44 = v43;
      swift_bridgeObjectRelease();
      *(_QWORD *)a2 = v37;
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = v38;
      *(_QWORD *)(a2 + 24) = 0x4000000000000000;
      *(_QWORD *)(a2 + 32) = v42;
      *(_QWORD *)(a2 + 40) = v44;
      goto LABEL_14;
    }
    if (v35 == *MEMORY[0x24BE710D8])
    {
      (*(void (**)(_QWORD *, uint64_t))(v34 + 96))(v18, v21);
      v46 = v54;
      v45 = v55;
      v47 = (*((uint64_t (**)(char *, _QWORD *, uint8_t *))v54 + 4))(v10, v18, v55);
      v48 = MEMORY[0x2494F7100](v47);
      v50 = v49;
      Apple_Parsec_Siri_V2alpha_Temperature.value.getter();
      v52 = v51;
      (*((void (**)(char *, uint8_t *))v46 + 1))(v10, v45);
      *(_QWORD *)a2 = v48;
      *(_QWORD *)(a2 + 8) = v50;
      *(_QWORD *)(a2 + 16) = v52;
      *(_QWORD *)(a2 + 32) = 0;
      *(_QWORD *)(a2 + 40) = 0;
      *(_QWORD *)(a2 + 24) = 0x8000000000000000;
      goto LABEL_14;
    }
    (*(void (**)(_QWORD *, uint64_t))(v34 + 8))(v18, v21);
    v4 = v53;
  }
  if (one-time initialization token for search != -1)
    swift_once();
  v22 = type metadata accessor for Logger();
  __swift_project_value_buffer(v22, (uint64_t)static Logging.search);
  v23 = v4;
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v25 = v58;
  v26 = v59;
  v24(v59, v57, v58);
  v27 = Logger.logObject.getter();
  v28 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    v57 = swift_slowAlloc();
    v61 = v57;
    *(_DWORD *)v29 = 136315138;
    v54 = v29 + 4;
    v55 = v29;
    v24(v56, (uint64_t)v26, v25);
    v30 = String.init<A>(describing:)();
    v60 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, &v61);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v59, v25);
    v32 = v55;
    _os_log_impl(&dword_243387000, v27, v28, "SearchGlobalEntity unknown CustomAttribute %s", v55, 0xCu);
    v33 = v57;
    swift_arrayDestroy();
    MEMORY[0x2494F7A6C](v33, -1, -1);
    MEMORY[0x2494F7A6C](v32, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v26, v25);
  }

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0x1FFFFFFFELL;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
LABEL_14:
  outlined destroy of IntentFile?((uint64_t)v20, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute.OneOf_Value?);
}

void SearchGlobalEntity.init(overridePayload:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[32];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  _OWORD v51[13];
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[4];
  _QWORD v66[6];
  char v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  _OWORD v80[13];
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;

  OUTLINED_FUNCTION_2();
  v28 = v2;
  v4 = v3;
  type metadata accessor for UUID();
  OUTLINED_FUNCTION_44();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_127();
  type metadata accessor for LocalizedStringResource();
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_14();
  v90 = 0;
  v69 = 0;
  v68 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<IntentFile?>);
  OUTLINED_FUNCTION_142();
  v7 = MEMORY[0x2494F6EC0](v0);
  v91 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<String?>);
  swift_retain();
  OUTLINED_FUNCTION_144();
  LocalizedStringResource.init(stringLiteral:)();
  v92 = MEMORY[0x2494F6ECC](v0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EntityProperty<[String]>);
  v27 = v92;
  swift_retain();
  OUTLINED_FUNCTION_142();
  v8 = MEMORY[0x2494F6ECC](v0);
  v93 = v8;
  swift_retain();
  UUID.init()();
  v9 = UUID.uuidString.getter();
  v11 = v10;
  OUTLINED_FUNCTION_119(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  v26 = v9;
  v66[0] = v9;
  v66[1] = v11;
  v94 = v11;
  OUTLINED_FUNCTION_4();
  v12 = (void *)MEMORY[0x2494F7460](0x6E69616D6F64, 0xE600000000000000);
  v13 = objc_msgSend(v4, sel_valueForKey_, v12);

  if (v13)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
  }
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)&v31, (uint64_t)&v35, &demangling cache variable for type metadata for Any?);
  if (*((_QWORD *)&v36 + 1))
  {
    if (OUTLINED_FUNCTION_209())
    {
      v14 = *((_QWORD *)&v34 + 1);
      v15 = v34;
      goto LABEL_9;
    }
  }
  else
  {
    outlined destroy of IntentFile?((uint64_t)&v35, &demangling cache variable for type metadata for Any?);
  }
  v14 = 0xEA00000000005F65;
  v15 = 0x6469727265766F5FLL;
LABEL_9:
  v66[2] = v15;
  v66[3] = v14;
  v29 = v14;
  swift_bridgeObjectRetain();
  v16 = (void *)MEMORY[0x2494F7460](0x6449686372616573, 0xE800000000000000);
  v17 = objc_msgSend(v4, sel_valueForKey_, v16);

  if (v17)
  {
    _bridgeAnyObjectToAny(_:)();
    OUTLINED_FUNCTION_161();
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
  }
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)&v35, (uint64_t)v65, &demangling cache variable for type metadata for Any?);
  if (v65[3])
  {
    v18 = OUTLINED_FUNCTION_209();
    if (v18)
      v19 = v31;
    else
      v19 = 0;
    if (v18)
      v20 = *((_QWORD *)&v31 + 1);
    else
      v20 = 0xF000000000000000;
  }
  else
  {
    outlined destroy of IntentFile?((uint64_t)v65, &demangling cache variable for type metadata for Any?);
    v19 = 0;
    v20 = 0xF000000000000000;
  }
  v66[4] = v19;
  v66[5] = v20;
  v67 = 3;
  v68 = 0;
  v69 = 0;
  outlined copy of Data?(v19, v20);
  OUTLINED_FUNCTION_116();
  v74 = 0u;
  v73 = 0u;
  v72 = 0u;
  v71 = 0u;
  v70 = 0u;
  v75 = 3;
  v76 = 0;
  v78 = 0;
  v77 = 0;
  v79 = 0;
  _s15OmniSearchTypes0B12GlobalEntityV15PlaceAttributesVSgWOi0_(&v34);
  OUTLINED_FUNCTION_210(v21, (uint64_t)v80);
  v80[12] = xmmword_2433A9C00;
  v81 = 0;
  v82 = 0;
  v83 = 0;
  v84 = 1;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0;
  v89 = 1;
  *(_QWORD *)&v35 = v26;
  *((_QWORD *)&v35 + 1) = v94;
  *(_QWORD *)&v36 = v15;
  *((_QWORD *)&v36 + 1) = v29;
  v37 = v19;
  v38 = v20;
  v39 = 3;
  v45 = 0u;
  v44 = 0u;
  v43 = 0u;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v46 = 3;
  v47 = 0;
  v49 = 0;
  v48 = 0;
  v50 = 0;
  OUTLINED_FUNCTION_210(v22, (uint64_t)v51);
  v51[12] = xmmword_2433A9C00;
  v52 = 0;
  v53 = 0;
  v54 = 0;
  v55 = 1;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0;
  v60 = 1;
  v61 = 0;
  v62 = v7;
  v63 = v27;
  v64 = v8;
  outlined retain of SearchGlobalEntity(&v35);
  v23 = (void *)MEMORY[0x2494F7460](0xD000000000000021, 0x80000002433A7020);
  v24 = objc_msgSend(v4, sel_valueForKey_, v23);

  if (v24)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v33, 0, sizeof(v33));
  }
  outlined init with take of SearchGlobalEntity.PlaceAttributes?((uint64_t)v33, (uint64_t)&v31, &demangling cache variable for type metadata for Any?);
  if (!*((_QWORD *)&v32 + 1))
  {
    outlined destroy of IntentFile?((uint64_t)&v31, &demangling cache variable for type metadata for Any?);
    goto LABEL_27;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  if (!OUTLINED_FUNCTION_209())
  {
LABEL_27:
    v25 = MEMORY[0x24BEE4AF8];
    goto LABEL_28;
  }
  v25 = v30;
LABEL_28:
  *(_QWORD *)&v31 = v25;
  EntityProperty.wrappedValue.setter();

  outlined release of SearchGlobalEntity(&v35);
  outlined retain of SearchGlobalEntity(&v35);
  swift_release();
  swift_release();
  swift_release();
  outlined consume of Data?(v19, v20);
  OUTLINED_FUNCTION_46();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_117(v28, &v35);
  OUTLINED_FUNCTION_117(&v31, v66);
  outlined release of SearchGlobalEntity(&v31);
  OUTLINED_FUNCTION_0_0();
}

uint64_t specialized closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation()(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[5] = a1;
  v2 = type metadata accessor for UTType();
  v1[6] = v2;
  v1[7] = *(_QWORD *)(v2 - 8);
  v1[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentFile?);
  v1[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t specialized closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int EnumTagSinglePayload;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(v0 + 72);
  EntityProperty.wrappedValue.getter();
  v2 = type metadata accessor for IntentFile();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v2);
  v4 = *(_QWORD *)(v0 + 72);
  if (EnumTagSinglePayload == 1)
  {
    outlined destroy of IntentFile?(*(_QWORD *)(v0 + 72), &demangling cache variable for type metadata for IntentFile?);
    if (one-time initialization token for searchToolExportedExperiences != -1)
      swift_once();
    v5 = *(_QWORD *)(v0 + 64);
    v6 = *(_QWORD *)(v0 + 48);
    v7 = *(_QWORD *)(v0 + 56);
    v8 = __swift_project_value_buffer(v6, (uint64_t)static UTType.searchToolExportedExperiences);
    OUTLINED_FUNCTION_83();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, v8, v6);
    v9 = type metadata accessor for SearchTransferabilityError();
    lazy protocol witness table accessor for type IntentFile and conformance IntentFile((uint64_t)&lazy protocol witness table cache variable for type SearchTransferabilityError and conformance SearchTransferabilityError);
    swift_allocError();
    *(_WORD *)v10 = 4608;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(&v10[*(int *)(v9 + 24)], v5, v6);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v12 = IntentFile.data.getter();
    v14 = v13;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v4, v2);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v12, v14);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_51();
  v4 = *v3;
  v5 = swift_task_dealloc();
  if (!v1)
  {
    v5 = v2;
    v6 = v0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.GeneralAttributes.CodingKeys, &unk_2513D8028);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.GeneralAttributes.CodingKeys, &unk_2513D8028);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.GeneralAttributes.CodingKeys, &unk_2513D8028);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.GeneralAttributes.CodingKeys, &unk_2513D8028);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes.CodingKeys and conformance SearchGlobalEntity.GeneralAttributes.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Data and conformance Data()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    result = MEMORY[0x2494F7A00](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    result = MEMORY[0x2494F7A00](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

uint64_t outlined copy of SearchGlobalEntity.CustomAttribute(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t result;

  v4 = a4 >> 62;
  if (!(a4 >> 62) || (_DWORD)v4 == 2 || (_DWORD)v4 == 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t outlined consume of SearchGlobalEntity.CustomAttribute(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t result;

  v4 = a4 >> 62;
  if (!(a4 >> 62) || (_DWORD)v4 == 2 || (_DWORD)v4 == 1)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CustomAttribute.CodingKeys, &unk_2513D7DE8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CustomAttribute.CodingKeys, &unk_2513D7DE8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CustomAttribute.CodingKeys, &unk_2513D7DE8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CustomAttribute.CodingKeys, &unk_2513D7DE8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.CodingKeys and conformance SearchGlobalEntity.CustomAttribute.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys, &unk_2513D7F98);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys, &unk_2513D7F98);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys, &unk_2513D7F98);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys, &unk_2513D7F98);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.Temperature and conformance SearchGlobalEntity.Temperature()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature and conformance SearchGlobalEntity.Temperature;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature and conformance SearchGlobalEntity.Temperature)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.Temperature, &type metadata for SearchGlobalEntity.Temperature);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature and conformance SearchGlobalEntity.Temperature);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature and conformance SearchGlobalEntity.Temperature;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature and conformance SearchGlobalEntity.Temperature)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.Temperature, &type metadata for SearchGlobalEntity.Temperature);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Temperature and conformance SearchGlobalEntity.Temperature);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CustomAttribute.TimestampCodingKeys, &unk_2513D7F08);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CustomAttribute.TimestampCodingKeys, &unk_2513D7F08);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CustomAttribute.TimestampCodingKeys, &unk_2513D7F08);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CustomAttribute.TimestampCodingKeys, &unk_2513D7F08);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.TimestampCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TimestampCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.Timestamp and conformance SearchGlobalEntity.Timestamp()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp and conformance SearchGlobalEntity.Timestamp;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp and conformance SearchGlobalEntity.Timestamp)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.Timestamp, &type metadata for SearchGlobalEntity.Timestamp);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp and conformance SearchGlobalEntity.Timestamp);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp and conformance SearchGlobalEntity.Timestamp;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp and conformance SearchGlobalEntity.Timestamp)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.Timestamp, &type metadata for SearchGlobalEntity.Timestamp);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Timestamp and conformance SearchGlobalEntity.Timestamp);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CustomAttribute.StringCodingKeys, &unk_2513D7E78);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CustomAttribute.StringCodingKeys, &unk_2513D7E78);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CustomAttribute.StringCodingKeys, &unk_2513D7E78);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CustomAttribute.StringCodingKeys, &unk_2513D7E78);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute.StringCodingKeys and conformance SearchGlobalEntity.CustomAttribute.StringCodingKeys);
  }
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SearchGlobalEntity.CustomAttribute>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

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
    v10 = (char *)MEMORY[0x24BEE4AF8];
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

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

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
    v5 = a4 + 48 * a1 + 32;
    v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[48 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 48 * a2);
  }
  return __src;
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
    ObjectType = MEMORY[0x24BEE2520];
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
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
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
  Swift::Int v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = String.UTF8View._foreignCount()();
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
  v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = _StringGuts.copyUTF8(into:)();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
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
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

void _StringGuts._slowEnsureMatchingEncoding(_:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v4 = String.UTF16View.index(_:offsetBy:)();
    OUTLINED_FUNCTION_131(v4);
  }
  else
  {
    v3 = MEMORY[0x2494F7508](15, a1 >> 16);
    OUTLINED_FUNCTION_131(v3);
  }
  OUTLINED_FUNCTION_5();
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

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.EntityType.CodingKeys, &unk_2513D7CF8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.EntityType.CodingKeys, &unk_2513D7CF8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.EntityType.CodingKeys, &unk_2513D7CF8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.EntityType.CodingKeys, &unk_2513D7CF8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.CodingKeys and conformance SearchGlobalEntity.EntityType.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.EntityType.UnknownCodingKeys, &unk_2513D7D58);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.EntityType.UnknownCodingKeys, &unk_2513D7D58);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.EntityType.UnknownCodingKeys, &unk_2513D7D58);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.EntityType.MapsCodingKeys, &unk_2513D7D38);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.EntityType.MapsCodingKeys, &unk_2513D7D38);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.EntityType.MapsCodingKeys, &unk_2513D7D38);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.EntityType.GenericCodingKeys, &unk_2513D7D18);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.EntityType.GenericCodingKeys, &unk_2513D7D18);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.EntityType.GenericCodingKeys, &unk_2513D7D18);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType.GenericCodingKeys and conformance SearchGlobalEntity.EntityType.GenericCodingKeys);
  }
  return result;
}

uint64_t specialized ArraySlice.subscript.getter(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2)
    goto LABEL_10;
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0)
    return swift_unknownObjectRetain();
LABEL_12:
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.EventAttributes.CodingKeys, &unk_2513D7C68);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.EventAttributes.CodingKeys, &unk_2513D7C68);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.EventAttributes.CodingKeys, &unk_2513D7C68);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.EventAttributes.CodingKeys, &unk_2513D7C68);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes.CodingKeys and conformance SearchGlobalEntity.EventAttributes.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.PlaceAttributes.CodingKeys, &unk_2513D7BD8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.PlaceAttributes.CodingKeys, &unk_2513D7BD8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.PlaceAttributes.CodingKeys, &unk_2513D7BD8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.PlaceAttributes.CodingKeys, &unk_2513D7BD8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes.CodingKeys and conformance SearchGlobalEntity.PlaceAttributes.CodingKeys);
  }
  return result;
}

uint64_t outlined release of SearchGlobalEntity.PlaceAttributes(uint64_t a1)
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
  return a1;
}

uint64_t outlined retain of SearchGlobalEntity.PlaceAttributes(uint64_t a1)
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
  return a1;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.IDAttributes.CodingKeys, &unk_2513D7B48);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.IDAttributes.CodingKeys, &unk_2513D7B48);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.IDAttributes.CodingKeys, &unk_2513D7B48);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.IDAttributes.CodingKeys, &unk_2513D7B48);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes.CodingKeys and conformance SearchGlobalEntity.IDAttributes.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.ContactAttributes.CodingKeys, &unk_2513D7AB8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.ContactAttributes.CodingKeys, &unk_2513D7AB8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.ContactAttributes.CodingKeys, &unk_2513D7AB8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.ContactAttributes.CodingKeys, &unk_2513D7AB8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes.CodingKeys and conformance SearchGlobalEntity.ContactAttributes.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.AppStoreAttributes.CodingKeys, &unk_2513D7A28);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.AppStoreAttributes.CodingKeys, &unk_2513D7A28);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.AppStoreAttributes.CodingKeys, &unk_2513D7A28);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.AppStoreAttributes.CodingKeys, &unk_2513D7A28);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes.CodingKeys and conformance SearchGlobalEntity.AppStoreAttributes.CodingKeys);
  }
  return result;
}

uint64_t outlined copy of SearchGlobalEntity.GeneralAttributes?(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    outlined copy of Data?(a6, a7);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t outlined copy of SearchGlobalEntity.PlaceAttributes?(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
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
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t outlined copy of SearchGlobalEntity.IDAttributes?(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t outlined copy of SearchGlobalEntity.ContactAttributes?(uint64_t a1, uint64_t a2)
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

uint64_t outlined copy of SearchGlobalEntity.AppStoreAttributes?(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
    return swift_bridgeObjectRetain();
  return result;
}

void _s15OmniSearchTypes0B12GlobalEntityV15PlaceAttributesVSgWOi0_(_OWORD *a1)
{
  *a1 = xmmword_2433A9C00;
  bzero(a1 + 1, 0xA9uLL);
}

_QWORD *outlined retain of SearchGlobalEntity(_QWORD *a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v6;
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

  v2 = a1[4];
  v3 = a1[5];
  v10 = a1[10];
  v11 = a1[9];
  v4 = a1[12];
  v8 = a1[13];
  v9 = a1[11];
  v6 = a1[15];
  v7 = a1[14];
  v18 = a1[25];
  v19 = a1[24];
  v12 = a1[49];
  v13 = a1[48];
  v14 = a1[53];
  v15 = a1[52];
  v16 = a1[61];
  v17 = a1[60];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of Data?(v2, v3);
  swift_bridgeObjectRetain();
  outlined copy of SearchGlobalEntity.GeneralAttributes?(v11, v10, v9, v4, v8, v7, v6);
  swift_bridgeObjectRetain();
  outlined copy of SearchGlobalEntity.PlaceAttributes?(v19, v18);
  outlined copy of SearchGlobalEntity.IDAttributes?(v13, v12);
  outlined copy of SearchGlobalEntity.ContactAttributes?(v15, v14);
  outlined copy of SearchGlobalEntity.AppStoreAttributes?(v17, v16);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *outlined release of SearchGlobalEntity(_QWORD *a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v6;
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

  v2 = a1[4];
  v3 = a1[5];
  v10 = a1[10];
  v11 = a1[9];
  v4 = a1[12];
  v8 = a1[13];
  v9 = a1[11];
  v6 = a1[15];
  v7 = a1[14];
  v18 = a1[25];
  v19 = a1[24];
  v12 = a1[49];
  v13 = a1[48];
  v14 = a1[53];
  v15 = a1[52];
  v16 = a1[61];
  v17 = a1[60];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data?(v2, v3);
  swift_bridgeObjectRelease();
  outlined consume of SearchGlobalEntity.GeneralAttributes?(v11, v10, v9, v4, v8, v7, v6);
  swift_bridgeObjectRelease();
  outlined consume of SearchGlobalEntity.PlaceAttributes?(v19, v18);
  outlined consume of SearchGlobalEntity.IDAttributes?(v13, v12);
  outlined consume of SearchGlobalEntity.ContactAttributes?(v15, v14);
  outlined consume of SearchGlobalEntity.AppStoreAttributes?(v17, v16);
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t outlined consume of SearchGlobalEntity.GeneralAttributes?(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined consume of Data?(a6, a7);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t outlined consume of SearchGlobalEntity.PlaceAttributes?(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
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
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t outlined consume of SearchGlobalEntity.IDAttributes?(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t outlined consume of SearchGlobalEntity.ContactAttributes?(uint64_t a1, uint64_t a2)
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

uint64_t outlined consume of SearchGlobalEntity.AppStoreAttributes?(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
    return swift_bridgeObjectRelease();
  return result;
}

_QWORD *outlined release of SearchGlobalEntity.Builder(_QWORD *a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v6;
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

  v2 = a1[4];
  v3 = a1[5];
  v10 = a1[10];
  v11 = a1[9];
  v4 = a1[12];
  v8 = a1[13];
  v9 = a1[11];
  v6 = a1[15];
  v7 = a1[14];
  v18 = a1[25];
  v19 = a1[24];
  v12 = a1[49];
  v13 = a1[48];
  v14 = a1[53];
  v15 = a1[52];
  v16 = a1[61];
  v17 = a1[60];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data?(v2, v3);
  swift_bridgeObjectRelease();
  outlined consume of SearchGlobalEntity.GeneralAttributes?(v11, v10, v9, v4, v8, v7, v6);
  swift_bridgeObjectRelease();
  outlined consume of SearchGlobalEntity.PlaceAttributes?(v19, v18);
  outlined consume of SearchGlobalEntity.IDAttributes?(v13, v12);
  outlined consume of SearchGlobalEntity.ContactAttributes?(v15, v14);
  outlined consume of SearchGlobalEntity.AppStoreAttributes?(v17, v16);
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void _s15OmniSearchTypes0B12GlobalEntityVSgWOi0_(void *a1)
{
  bzero(a1, 0x210uLL);
}

uint64_t outlined retain of SearchGlobalEntity.PlaceAttributes?(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char);
  char v5;

  v2 = OUTLINED_FUNCTION_115(a1);
  v5 = *(_BYTE *)(v1 + 184);
  v3(v2, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 104), *(_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 120), *(_QWORD *)(v1 + 128), *(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 144),
    *(_QWORD *)(v1 + 152),
    *(_QWORD *)(v1 + 160),
    *(_QWORD *)(v1 + 168),
    *(_QWORD *)(v1 + 176),
    v5);
  return v1;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t SearchGlobalEntity.Query.entities(for:)(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t specialized closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation()(void *__src)
{
  uint64_t v1;
  _QWORD *v2;

  memcpy((void *)(v1 + 16), __src, 0x210uLL);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 544) = v2;
  *v2 = v1;
  v2[1] = specialized closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation();
  return specialized closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation()(v1 + 16);
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity and conformance SearchGlobalEntity()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity, &type metadata for SearchGlobalEntity);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity, &type metadata for SearchGlobalEntity);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity, &type metadata for SearchGlobalEntity);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity, &type metadata for SearchGlobalEntity);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity, &type metadata for SearchGlobalEntity);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity, &type metadata for SearchGlobalEntity);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity, &type metadata for SearchGlobalEntity);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity, &type metadata for SearchGlobalEntity);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity, &type metadata for SearchGlobalEntity);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity, &type metadata for SearchGlobalEntity);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity, &type metadata for SearchGlobalEntity);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity and conformance SearchGlobalEntity);
  }
  return result;
}

uint64_t *outlined release of (SearchGlobalEntity.GeneralAttributes?, SearchGlobalEntity.GeneralAttributes?)(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v2 = a1[9];
  v3 = a1[10];
  v4 = a1[11];
  v5 = a1[12];
  v6 = a1[13];
  v7 = a1[14];
  v8 = a1[15];
  outlined consume of SearchGlobalEntity.GeneralAttributes?(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6]);
  outlined consume of SearchGlobalEntity.GeneralAttributes?(v2, v3, v4, v5, v6, v7, v8);
  return a1;
}

uint64_t _s15OmniSearchTypes0B12GlobalEntityV15PlaceAttributesVSgWOg(uint64_t a1)
{
  unint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  v2 = v1 - 1;
  if (v2 < 0)
    v2 = -1;
  return (v2 + 1);
}

uint64_t *outlined release of (SearchGlobalEntity.PlaceAttributes?, SearchGlobalEntity.PlaceAttributes?)(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;

  v2 = a1[25];
  v4 = a1[24];
  outlined consume of SearchGlobalEntity.PlaceAttributes?(*a1, a1[1]);
  outlined consume of SearchGlobalEntity.PlaceAttributes?(v4, v2);
  return a1;
}

uint64_t *outlined release of (SearchGlobalEntity.ContactAttributes?, SearchGlobalEntity.ContactAttributes?)(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[8];
  v3 = a1[9];
  outlined consume of SearchGlobalEntity.ContactAttributes?(*a1, a1[1]);
  outlined consume of SearchGlobalEntity.ContactAttributes?(v2, v3);
  return a1;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CodingKeys, &unk_2513D7998);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CodingKeys, &unk_2513D7998);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CodingKeys, &unk_2513D7998);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CodingKeys, &unk_2513D7998);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CodingKeys and conformance SearchGlobalEntity.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.EntityType and conformance SearchGlobalEntity.EntityType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType and conformance SearchGlobalEntity.EntityType;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType and conformance SearchGlobalEntity.EntityType)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.EntityType, &type metadata for SearchGlobalEntity.EntityType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType and conformance SearchGlobalEntity.EntityType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType and conformance SearchGlobalEntity.EntityType;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType and conformance SearchGlobalEntity.EntityType)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.EntityType, &type metadata for SearchGlobalEntity.EntityType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EntityType and conformance SearchGlobalEntity.EntityType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.GeneralAttributes and conformance SearchGlobalEntity.GeneralAttributes()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes and conformance SearchGlobalEntity.GeneralAttributes;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes and conformance SearchGlobalEntity.GeneralAttributes)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.GeneralAttributes, &type metadata for SearchGlobalEntity.GeneralAttributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.GeneralAttributes and conformance SearchGlobalEntity.GeneralAttributes);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute and conformance SearchGlobalEntity.CustomAttribute()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute and conformance SearchGlobalEntity.CustomAttribute;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute and conformance SearchGlobalEntity.CustomAttribute)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.CustomAttribute, &type metadata for SearchGlobalEntity.CustomAttribute);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.CustomAttribute and conformance SearchGlobalEntity.CustomAttribute);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.EventAttributes and conformance SearchGlobalEntity.EventAttributes()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes and conformance SearchGlobalEntity.EventAttributes;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes and conformance SearchGlobalEntity.EventAttributes)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.EventAttributes, &type metadata for SearchGlobalEntity.EventAttributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.EventAttributes and conformance SearchGlobalEntity.EventAttributes);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.PlaceAttributes and conformance SearchGlobalEntity.PlaceAttributes()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes and conformance SearchGlobalEntity.PlaceAttributes;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes and conformance SearchGlobalEntity.PlaceAttributes)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.PlaceAttributes, &type metadata for SearchGlobalEntity.PlaceAttributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.PlaceAttributes and conformance SearchGlobalEntity.PlaceAttributes);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.IDAttributes and conformance SearchGlobalEntity.IDAttributes()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes and conformance SearchGlobalEntity.IDAttributes;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes and conformance SearchGlobalEntity.IDAttributes)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.IDAttributes, &type metadata for SearchGlobalEntity.IDAttributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.IDAttributes and conformance SearchGlobalEntity.IDAttributes);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.ContactAttributes and conformance SearchGlobalEntity.ContactAttributes()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes and conformance SearchGlobalEntity.ContactAttributes;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes and conformance SearchGlobalEntity.ContactAttributes)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.ContactAttributes, &type metadata for SearchGlobalEntity.ContactAttributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.ContactAttributes and conformance SearchGlobalEntity.ContactAttributes);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.AppStoreAttributes and conformance SearchGlobalEntity.AppStoreAttributes()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes and conformance SearchGlobalEntity.AppStoreAttributes;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes and conformance SearchGlobalEntity.AppStoreAttributes)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.AppStoreAttributes, &type metadata for SearchGlobalEntity.AppStoreAttributes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.AppStoreAttributes and conformance SearchGlobalEntity.AppStoreAttributes);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type EntityProperty<IntentFile?> and conformance <> EntityProperty<A>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type EntityProperty<IntentFile?> and conformance <> EntityProperty<A>;
  if (!lazy protocol witness table cache variable for type EntityProperty<IntentFile?> and conformance <> EntityProperty<A>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for EntityProperty<IntentFile?>);
    v2[0] = lazy protocol witness table accessor for type IntentFile? and conformance <A> A?((uint64_t)&lazy protocol witness table cache variable for type IntentFile? and conformance <A> A?);
    v2[1] = lazy protocol witness table accessor for type IntentFile? and conformance <A> A?((uint64_t)&lazy protocol witness table cache variable for type IntentFile? and conformance <A> A?);
    result = MEMORY[0x2494F7A00](MEMORY[0x24BDB5368], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EntityProperty<IntentFile?> and conformance <> EntityProperty<A>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type IntentFile? and conformance <A> A?(uint64_t a1)
{
  unint64_t *v1;
  unint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = OUTLINED_FUNCTION_115(a1);
  if (!result)
  {
    v5 = v4;
    v6 = v3;
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for IntentFile?);
    lazy protocol witness table accessor for type IntentFile and conformance IntentFile(v6);
    v9 = v8;
    result = MEMORY[0x2494F7A00](v5, v7, &v9);
    atomic_store(result, v1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type EntityProperty<String?> and conformance <> EntityProperty<A>()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = lazy protocol witness table cache variable for type EntityProperty<String?> and conformance <> EntityProperty<A>;
  if (!lazy protocol witness table cache variable for type EntityProperty<String?> and conformance <> EntityProperty<A>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for EntityProperty<String?>);
    lazy protocol witness table accessor for type [String] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type String? and conformance <A> A?);
    v3 = v2;
    lazy protocol witness table accessor for type [String] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type String? and conformance <A> A?);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2494F7A00](MEMORY[0x24BDB5368], v1, v5);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EntityProperty<String?> and conformance <> EntityProperty<A>);
  }
  return result;
}

void lazy protocol witness table accessor for type [String] and conformance <A> [A](uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  if (!OUTLINED_FUNCTION_115(a1))
  {
    v5 = OUTLINED_FUNCTION_171(0, v4);
    v6 = v3;
    atomic_store(MEMORY[0x2494F7A00](v2, v5, &v6), v1);
  }
  OUTLINED_FUNCTION_146();
}

unint64_t lazy protocol witness table accessor for type EntityProperty<[String]> and conformance <> EntityProperty<A>()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = lazy protocol witness table cache variable for type EntityProperty<[String]> and conformance <> EntityProperty<A>;
  if (!lazy protocol witness table cache variable for type EntityProperty<[String]> and conformance <> EntityProperty<A>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for EntityProperty<[String]>);
    lazy protocol witness table accessor for type [String] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type [String] and conformance <A> [A]);
    v3 = v2;
    lazy protocol witness table accessor for type [String] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type [String] and conformance <A> [A]);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2494F7A00](MEMORY[0x24BDB5368], v1, v5);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EntityProperty<[String]> and conformance <> EntityProperty<A>);
  }
  return result;
}

_QWORD *outlined retain of SearchGlobalEntity.Builder(_QWORD *a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v6;
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

  v2 = a1[4];
  v3 = a1[5];
  v10 = a1[10];
  v11 = a1[9];
  v4 = a1[12];
  v8 = a1[13];
  v9 = a1[11];
  v6 = a1[15];
  v7 = a1[14];
  v18 = a1[25];
  v19 = a1[24];
  v12 = a1[49];
  v13 = a1[48];
  v14 = a1[53];
  v15 = a1[52];
  v16 = a1[61];
  v17 = a1[60];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of Data?(v2, v3);
  swift_bridgeObjectRetain();
  outlined copy of SearchGlobalEntity.GeneralAttributes?(v11, v10, v9, v4, v8, v7, v6);
  swift_bridgeObjectRetain();
  outlined copy of SearchGlobalEntity.PlaceAttributes?(v19, v18);
  outlined copy of SearchGlobalEntity.IDAttributes?(v13, v12);
  outlined copy of SearchGlobalEntity.ContactAttributes?(v15, v14);
  outlined copy of SearchGlobalEntity.AppStoreAttributes?(v17, v16);
  return a1;
}

uint64_t _s15OmniSearchTypes0B12GlobalEntityVSgWOg(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

void outlined init with take of SearchGlobalEntity.PlaceAttributes?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_132(a1, a2, a3);
  OUTLINED_FUNCTION_216(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_5();
}

unint64_t lazy protocol witness table accessor for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.Query, &type metadata for SearchGlobalEntity.Query);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.Query, &type metadata for SearchGlobalEntity.Query);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.Query, &type metadata for SearchGlobalEntity.Query);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query;
  if (!lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchGlobalEntity.Query, &type metadata for SearchGlobalEntity.Query);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchGlobalEntity.Query and conformance SearchGlobalEntity.Query);
  }
  return result;
}

void associated type witness table accessor for DynamicOptionsProvider.Result : ResultsCollection in SearchGlobalEntity.Query()
{
  lazy protocol witness table accessor for type [SearchGlobalEntity.CustomAttribute] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type [SearchGlobalEntity] and conformance <A> [A]);
}

void lazy protocol witness table accessor for type [SearchGlobalEntity.CustomAttribute] and conformance <A> [A](uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  if (!OUTLINED_FUNCTION_115(a1))
  {
    v5 = OUTLINED_FUNCTION_171(0, v4);
    v6 = v3();
    atomic_store(MEMORY[0x2494F7A00](v2, v5, &v6), v1);
  }
  OUTLINED_FUNCTION_146();
}

uint64_t associated type witness table accessor for Identifiable.ID : EntityIdentifierConvertible in SearchGlobalEntity()
{
  return MEMORY[0x24BDB6618];
}

uint64_t associated type witness table accessor for Transferable.Representation : TransferRepresentation in SearchGlobalEntity()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in SearchGlobalEntity()
{
  return MEMORY[0x24BEE0D10];
}

void associated type witness table accessor for _IntentValue.Specification : ResolverSpecification in SearchGlobalEntity()
{
  lazy protocol witness table accessor for type EmptyResolverSpecification<SearchGlobalEntity> and conformance EmptyResolverSpecification<A>((uint64_t)&lazy protocol witness table cache variable for type EmptyResolverSpecification<SearchGlobalEntity> and conformance EmptyResolverSpecification<A>);
}

void sub_24339A578()
{
  SearchGlobalEntity.experienceFile.getter();
  OUTLINED_FUNCTION_5();
}

void sub_24339A598(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = SearchGlobalEntity.associatedQuery.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_5();
}

void sub_24339A5C0(uint64_t *a1@<X8>)
{
  *a1 = SearchGlobalEntity.supportedTypeIdentifiersForExport.getter();
  OUTLINED_FUNCTION_5();
}

uint64_t destroy for SearchGlobalEntity(uint64_t *a1)
{
  unint64_t v2;
  unint64_t v3;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = a1[5];
  if (v2 >> 60 != 15)
    outlined consume of Data._Representation(a1[4], v2);
  swift_bridgeObjectRelease();
  if (a1[9])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v3 = a1[15];
    if (v3 >> 60 != 15)
      outlined consume of Data._Representation(a1[14], v3);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  if (a1[25] != 1)
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
  }
  if (a1[49] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[53] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[61] != 1)
    swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for SearchGlobalEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  unint64_t v16;
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
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _OWORD *v40;
  uint64_t v41;
  uint64_t v42;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = (uint64_t *)(a2 + 32);
  v7 = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v6;
  }
  else
  {
    v8 = *v6;
    outlined copy of Data._Representation(*v6, v7);
    *(_QWORD *)(a1 + 32) = v8;
    *(_QWORD *)(a1 + 40) = v7;
  }
  v9 = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v10;
  swift_bridgeObjectRetain();
  if (v9)
  {
    v11 = *(_QWORD *)(a2 + 80);
    v12 = *(_QWORD *)(a2 + 88);
    *(_QWORD *)(a1 + 72) = v9;
    *(_QWORD *)(a1 + 80) = v11;
    v13 = *(_QWORD *)(a2 + 96);
    v14 = *(_QWORD *)(a2 + 104);
    *(_QWORD *)(a1 + 88) = v12;
    *(_QWORD *)(a1 + 96) = v13;
    *(_QWORD *)(a1 + 104) = v14;
    v15 = (uint64_t *)(a2 + 112);
    v16 = *(_QWORD *)(a2 + 120);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v16 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 112) = *(_OWORD *)v15;
    }
    else
    {
      v17 = *v15;
      outlined copy of Data._Representation(*v15, v16);
      *(_QWORD *)(a1 + 112) = v17;
      *(_QWORD *)(a1 + 120) = v16;
    }
    v18 = *(_QWORD *)(a2 + 136);
    *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
    *(_QWORD *)(a1 + 136) = v18;
    swift_bridgeObjectRetain();
  }
  else
  {
    memcpy((void *)(a1 + 72), (const void *)(a2 + 72), 0x48uLL);
  }
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  v19 = *(_QWORD *)(a2 + 200);
  swift_bridgeObjectRetain();
  if (v19 == 1)
  {
    memcpy((void *)(a1 + 192), (const void *)(a2 + 192), 0xB9uLL);
  }
  else
  {
    *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
    *(_QWORD *)(a1 + 200) = v19;
    v20 = *(_QWORD *)(a2 + 216);
    *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
    *(_QWORD *)(a1 + 216) = v20;
    v21 = *(_QWORD *)(a2 + 232);
    *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
    *(_QWORD *)(a1 + 232) = v21;
    v22 = *(_QWORD *)(a2 + 248);
    *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
    *(_QWORD *)(a1 + 248) = v22;
    v23 = *(_QWORD *)(a2 + 264);
    *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
    *(_QWORD *)(a1 + 264) = v23;
    v24 = *(_QWORD *)(a2 + 280);
    *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
    *(_QWORD *)(a1 + 280) = v24;
    v25 = *(_QWORD *)(a2 + 296);
    *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
    *(_QWORD *)(a1 + 296) = v25;
    v26 = *(_QWORD *)(a2 + 312);
    *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
    *(_QWORD *)(a1 + 312) = v26;
    v27 = *(_QWORD *)(a2 + 328);
    *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
    *(_QWORD *)(a1 + 328) = v27;
    v28 = *(_QWORD *)(a2 + 344);
    *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
    *(_QWORD *)(a1 + 344) = v28;
    v29 = *(_QWORD *)(a2 + 352);
    *(_BYTE *)(a1 + 360) = *(_BYTE *)(a2 + 360);
    *(_QWORD *)(a1 + 352) = v29;
    v30 = *(_QWORD *)(a2 + 368);
    *(_BYTE *)(a1 + 376) = *(_BYTE *)(a2 + 376);
    *(_QWORD *)(a1 + 368) = v30;
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
  v31 = *(_QWORD *)(a2 + 392);
  if (v31 == 1)
  {
    v32 = *(_OWORD *)(a2 + 400);
    *(_OWORD *)(a1 + 384) = *(_OWORD *)(a2 + 384);
    *(_OWORD *)(a1 + 400) = v32;
  }
  else
  {
    *(_QWORD *)(a1 + 384) = *(_QWORD *)(a2 + 384);
    *(_QWORD *)(a1 + 392) = v31;
    v33 = *(_QWORD *)(a2 + 408);
    *(_QWORD *)(a1 + 400) = *(_QWORD *)(a2 + 400);
    *(_QWORD *)(a1 + 408) = v33;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  v34 = *(_QWORD *)(a2 + 424);
  if (v34 == 1)
  {
    v35 = *(_OWORD *)(a2 + 432);
    *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
    *(_OWORD *)(a1 + 432) = v35;
    v36 = *(_OWORD *)(a2 + 464);
    *(_OWORD *)(a1 + 448) = *(_OWORD *)(a2 + 448);
    *(_OWORD *)(a1 + 464) = v36;
  }
  else
  {
    *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
    *(_QWORD *)(a1 + 424) = v34;
    v37 = *(_QWORD *)(a2 + 440);
    *(_QWORD *)(a1 + 432) = *(_QWORD *)(a2 + 432);
    *(_QWORD *)(a1 + 440) = v37;
    v38 = *(_QWORD *)(a2 + 456);
    *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
    *(_QWORD *)(a1 + 456) = v38;
    v39 = *(_QWORD *)(a2 + 472);
    *(_QWORD *)(a1 + 464) = *(_QWORD *)(a2 + 464);
    *(_QWORD *)(a1 + 472) = v39;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  v40 = (_OWORD *)(a2 + 480);
  v41 = *(_QWORD *)(a2 + 488);
  if (v41 == 1)
  {
    *(_OWORD *)(a1 + 480) = *v40;
  }
  else
  {
    *(_QWORD *)(a1 + 480) = *(_QWORD *)v40;
    *(_QWORD *)(a1 + 488) = v41;
    swift_bridgeObjectRetain();
  }
  *(_BYTE *)(a1 + 496) = *(_BYTE *)(a2 + 496);
  v42 = *(_QWORD *)(a2 + 512);
  *(_QWORD *)(a1 + 504) = *(_QWORD *)(a2 + 504);
  *(_QWORD *)(a1 + 512) = v42;
  *(_QWORD *)(a1 + 520) = *(_QWORD *)(a2 + 520);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SearchGlobalEntity(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  _OWORD *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  _OWORD *v32;
  __int128 *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (uint64_t *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  if (*(_QWORD *)(a1 + 40) >> 60 == 15)
  {
    if (v5 >> 60 != 15)
    {
      v6 = *v4;
      outlined copy of Data._Representation(*v4, *(_QWORD *)(a2 + 40));
      *(_QWORD *)(a1 + 32) = v6;
      *(_QWORD *)(a1 + 40) = v5;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
    outlined destroy of Data(a1 + 32);
LABEL_6:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  v7 = *v4;
  outlined copy of Data._Representation(*v4, *(_QWORD *)(a2 + 40));
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v5;
  outlined consume of Data._Representation(v8, v9);
LABEL_8:
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 72);
  if (*(_QWORD *)(a1 + 72))
  {
    if (v10)
    {
      *(_QWORD *)(a1 + 72) = v10;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
      *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
      *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v11 = (uint64_t *)(a2 + 112);
      v12 = *(_QWORD *)(a2 + 120);
      if (*(_QWORD *)(a1 + 120) >> 60 == 15)
      {
        if (v12 >> 60 != 15)
        {
          v13 = *v11;
          outlined copy of Data._Representation(*v11, *(_QWORD *)(a2 + 120));
          *(_QWORD *)(a1 + 112) = v13;
          *(_QWORD *)(a1 + 120) = v12;
LABEL_24:
          *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
          *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          goto LABEL_25;
        }
      }
      else
      {
        if (v12 >> 60 != 15)
        {
          v17 = *v11;
          outlined copy of Data._Representation(*v11, *(_QWORD *)(a2 + 120));
          v18 = *(_QWORD *)(a1 + 112);
          v19 = *(_QWORD *)(a1 + 120);
          *(_QWORD *)(a1 + 112) = v17;
          *(_QWORD *)(a1 + 120) = v12;
          outlined consume of Data._Representation(v18, v19);
          goto LABEL_24;
        }
        outlined destroy of Data(a1 + 112);
      }
      *(_OWORD *)(a1 + 112) = *(_OWORD *)v11;
      goto LABEL_24;
    }
    outlined destroy of SearchGlobalEntity.GeneralAttributes(a1 + 72);
LABEL_17:
    memcpy((void *)(a1 + 72), (const void *)(a2 + 72), 0x48uLL);
    goto LABEL_25;
  }
  if (!v10)
    goto LABEL_17;
  *(_QWORD *)(a1 + 72) = v10;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  v14 = (uint64_t *)(a2 + 112);
  v15 = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v15 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 112) = *(_OWORD *)v14;
  }
  else
  {
    v16 = *v14;
    outlined copy of Data._Representation(*v14, v15);
    *(_QWORD *)(a1 + 112) = v16;
    *(_QWORD *)(a1 + 120) = v15;
  }
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
LABEL_25:
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v20 = *(_OWORD *)(a2 + 152);
  v21 = *(_OWORD *)(a2 + 168);
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  *(_OWORD *)(a1 + 168) = v21;
  *(_OWORD *)(a1 + 152) = v20;
  v22 = *(_QWORD *)(a2 + 200);
  if (*(_QWORD *)(a1 + 200) == 1)
  {
    if (v22 != 1)
    {
      *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
      *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
      *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
      *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
      *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
      *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
      *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
      *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
      *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
      *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
      *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
      *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
      *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
      *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
      *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
      *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
      *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
      *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
      *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
      *(_QWORD *)(a1 + 344) = *(_QWORD *)(a2 + 344);
      v23 = *(_QWORD *)(a2 + 352);
      *(_BYTE *)(a1 + 360) = *(_BYTE *)(a2 + 360);
      *(_QWORD *)(a1 + 352) = v23;
      v24 = *(_QWORD *)(a2 + 368);
      *(_BYTE *)(a1 + 376) = *(_BYTE *)(a2 + 376);
      *(_QWORD *)(a1 + 368) = v24;
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
      goto LABEL_32;
    }
    goto LABEL_30;
  }
  if (v22 == 1)
  {
    outlined destroy of SearchGlobalEntity.PlaceAttributes(a1 + 192);
LABEL_30:
    memcpy((void *)(a1 + 192), (const void *)(a2 + 192), 0xB9uLL);
    goto LABEL_32;
  }
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  *(_QWORD *)(a1 + 344) = *(_QWORD *)(a2 + 344);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v25 = *(_QWORD *)(a2 + 352);
  *(_BYTE *)(a1 + 360) = *(_BYTE *)(a2 + 360);
  *(_QWORD *)(a1 + 352) = v25;
  v26 = *(_QWORD *)(a2 + 368);
  *(_BYTE *)(a1 + 376) = *(_BYTE *)(a2 + 376);
  *(_QWORD *)(a1 + 368) = v26;
LABEL_32:
  v27 = (_OWORD *)(a1 + 384);
  v28 = (_OWORD *)(a2 + 384);
  v29 = *(_QWORD *)(a2 + 392);
  if (*(_QWORD *)(a1 + 392) == 1)
  {
    if (v29 == 1)
    {
      v30 = *(_OWORD *)(a2 + 400);
      *v27 = *v28;
      *(_OWORD *)(a1 + 400) = v30;
    }
    else
    {
      *(_QWORD *)(a1 + 384) = *(_QWORD *)(a2 + 384);
      *(_QWORD *)(a1 + 392) = *(_QWORD *)(a2 + 392);
      *(_QWORD *)(a1 + 400) = *(_QWORD *)(a2 + 400);
      *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v29 == 1)
  {
    outlined destroy of SearchGlobalEntity.IDAttributes(a1 + 384);
    v31 = *(_OWORD *)(a2 + 400);
    *v27 = *v28;
    *(_OWORD *)(a1 + 400) = v31;
  }
  else
  {
    *(_QWORD *)(a1 + 384) = *(_QWORD *)(a2 + 384);
    *(_QWORD *)(a1 + 392) = *(_QWORD *)(a2 + 392);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 400) = *(_QWORD *)(a2 + 400);
    *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  v32 = (_OWORD *)(a1 + 416);
  v33 = (__int128 *)(a2 + 416);
  v34 = *(_QWORD *)(a2 + 424);
  if (*(_QWORD *)(a1 + 424) == 1)
  {
    if (v34 == 1)
    {
      v35 = *v33;
      v36 = *(_OWORD *)(a2 + 432);
      v37 = *(_OWORD *)(a2 + 464);
      *(_OWORD *)(a1 + 448) = *(_OWORD *)(a2 + 448);
      *(_OWORD *)(a1 + 464) = v37;
      *v32 = v35;
      *(_OWORD *)(a1 + 432) = v36;
    }
    else
    {
      *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
      *(_QWORD *)(a1 + 424) = *(_QWORD *)(a2 + 424);
      *(_QWORD *)(a1 + 432) = *(_QWORD *)(a2 + 432);
      *(_QWORD *)(a1 + 440) = *(_QWORD *)(a2 + 440);
      *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
      *(_QWORD *)(a1 + 456) = *(_QWORD *)(a2 + 456);
      *(_QWORD *)(a1 + 464) = *(_QWORD *)(a2 + 464);
      *(_QWORD *)(a1 + 472) = *(_QWORD *)(a2 + 472);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v34 == 1)
  {
    outlined destroy of SearchGlobalEntity.ContactAttributes(a1 + 416);
    v38 = *(_OWORD *)(a2 + 464);
    v40 = *v33;
    v39 = *(_OWORD *)(a2 + 432);
    *(_OWORD *)(a1 + 448) = *(_OWORD *)(a2 + 448);
    *(_OWORD *)(a1 + 464) = v38;
    *v32 = v40;
    *(_OWORD *)(a1 + 432) = v39;
  }
  else
  {
    *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
    *(_QWORD *)(a1 + 424) = *(_QWORD *)(a2 + 424);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 432) = *(_QWORD *)(a2 + 432);
    *(_QWORD *)(a1 + 440) = *(_QWORD *)(a2 + 440);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
    *(_QWORD *)(a1 + 456) = *(_QWORD *)(a2 + 456);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 464) = *(_QWORD *)(a2 + 464);
    *(_QWORD *)(a1 + 472) = *(_QWORD *)(a2 + 472);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  v41 = *(_QWORD *)(a2 + 488);
  if (*(_QWORD *)(a1 + 488) != 1)
  {
    if (v41 != 1)
    {
      *(_QWORD *)(a1 + 480) = *(_QWORD *)(a2 + 480);
      *(_QWORD *)(a1 + 488) = *(_QWORD *)(a2 + 488);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_53;
    }
    outlined destroy of SearchGlobalEntity.AppStoreAttributes(a1 + 480);
    goto LABEL_51;
  }
  if (v41 == 1)
  {
LABEL_51:
    *(_OWORD *)(a1 + 480) = *(_OWORD *)(a2 + 480);
    goto LABEL_53;
  }
  *(_QWORD *)(a1 + 480) = *(_QWORD *)(a2 + 480);
  *(_QWORD *)(a1 + 488) = *(_QWORD *)(a2 + 488);
  swift_bridgeObjectRetain();
LABEL_53:
  *(_BYTE *)(a1 + 496) = *(_BYTE *)(a2 + 496);
  *(_QWORD *)(a1 + 504) = *(_QWORD *)(a2 + 504);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 512) = *(_QWORD *)(a2 + 512);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 520) = *(_QWORD *)(a2 + 520);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t outlined destroy of Data(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDE8] - 8) + 8))();
  return a1;
}

uint64_t outlined destroy of SearchGlobalEntity.GeneralAttributes(uint64_t a1)
{
  destroy for SearchGlobalEntity.GeneralAttributes(a1);
  return a1;
}

uint64_t outlined destroy of SearchGlobalEntity.PlaceAttributes(uint64_t a1)
{
  destroy for SearchGlobalEntity.PlaceAttributes();
  return a1;
}

uint64_t outlined destroy of SearchGlobalEntity.IDAttributes(uint64_t a1)
{
  destroy for SearchGlobalEntity.IDAttributes();
  return a1;
}

uint64_t outlined destroy of SearchGlobalEntity.ContactAttributes(uint64_t a1)
{
  destroy for SearchGlobalEntity.ContactAttributes();
  return a1;
}

uint64_t outlined destroy of SearchGlobalEntity.AppStoreAttributes(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy528_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x210uLL);
}

uint64_t assignWithTake for SearchGlobalEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
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
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = (_OWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 >> 60 == 15)
    goto LABEL_4;
  v8 = *(_QWORD *)(a2 + 40);
  if (v8 >> 60 == 15)
  {
    outlined destroy of Data(a1 + 32);
LABEL_4:
    *(_OWORD *)(a1 + 32) = *v6;
    goto LABEL_6;
  }
  v9 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)v6;
  *(_QWORD *)(a1 + 40) = v8;
  outlined consume of Data._Representation(v9, v7);
LABEL_6:
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 72);
  if (!*(_QWORD *)(a1 + 72))
  {
LABEL_13:
    memcpy((void *)(a1 + 72), (const void *)(a2 + 72), 0x48uLL);
    goto LABEL_16;
  }
  if (!v11)
  {
    outlined destroy of SearchGlobalEntity.GeneralAttributes(a1 + 72);
    goto LABEL_13;
  }
  *(_QWORD *)(a1 + 72) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v12;
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v13;
  swift_bridgeObjectRelease();
  v14 = (_QWORD *)(a2 + 112);
  v15 = *(_QWORD *)(a1 + 120);
  if (v15 >> 60 != 15)
  {
    v16 = *(_QWORD *)(a2 + 120);
    if (v16 >> 60 != 15)
    {
      v17 = *(_QWORD *)(a1 + 112);
      *(_QWORD *)(a1 + 112) = *v14;
      *(_QWORD *)(a1 + 120) = v16;
      outlined consume of Data._Representation(v17, v15);
      goto LABEL_15;
    }
    outlined destroy of Data(a1 + 112);
  }
  *(_OWORD *)(a1 + 112) = *(_OWORD *)v14;
LABEL_15:
  v18 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v18;
  swift_bridgeObjectRelease();
LABEL_16:
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  if (*(_QWORD *)(a1 + 200) == 1)
  {
LABEL_19:
    memcpy((void *)(a1 + 192), (const void *)(a2 + 192), 0xB9uLL);
    goto LABEL_21;
  }
  v19 = *(_QWORD *)(a2 + 200);
  if (v19 == 1)
  {
    outlined destroy of SearchGlobalEntity.PlaceAttributes(a1 + 192);
    goto LABEL_19;
  }
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v19;
  swift_bridgeObjectRelease();
  v20 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v20;
  swift_bridgeObjectRelease();
  v21 = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = v21;
  swift_bridgeObjectRelease();
  v22 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v22;
  swift_bridgeObjectRelease();
  v23 = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v23;
  swift_bridgeObjectRelease();
  v24 = *(_QWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = v24;
  swift_bridgeObjectRelease();
  v25 = *(_QWORD *)(a2 + 296);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = v25;
  swift_bridgeObjectRelease();
  v26 = *(_QWORD *)(a2 + 312);
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = v26;
  swift_bridgeObjectRelease();
  v27 = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  *(_QWORD *)(a1 + 328) = v27;
  swift_bridgeObjectRelease();
  v28 = *(_QWORD *)(a2 + 344);
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  *(_QWORD *)(a1 + 344) = v28;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 352) = *(_QWORD *)(a2 + 352);
  *(_BYTE *)(a1 + 360) = *(_BYTE *)(a2 + 360);
  *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
  *(_BYTE *)(a1 + 376) = *(_BYTE *)(a2 + 376);
LABEL_21:
  if (*(_QWORD *)(a1 + 392) == 1)
  {
LABEL_24:
    v30 = *(_OWORD *)(a2 + 400);
    *(_OWORD *)(a1 + 384) = *(_OWORD *)(a2 + 384);
    *(_OWORD *)(a1 + 400) = v30;
    goto LABEL_26;
  }
  v29 = *(_QWORD *)(a2 + 392);
  if (v29 == 1)
  {
    outlined destroy of SearchGlobalEntity.IDAttributes(a1 + 384);
    goto LABEL_24;
  }
  *(_QWORD *)(a1 + 384) = *(_QWORD *)(a2 + 384);
  *(_QWORD *)(a1 + 392) = v29;
  swift_bridgeObjectRelease();
  v31 = *(_QWORD *)(a2 + 408);
  *(_QWORD *)(a1 + 400) = *(_QWORD *)(a2 + 400);
  *(_QWORD *)(a1 + 408) = v31;
  swift_bridgeObjectRelease();
LABEL_26:
  if (*(_QWORD *)(a1 + 424) == 1)
  {
LABEL_29:
    v33 = *(_OWORD *)(a2 + 432);
    *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
    *(_OWORD *)(a1 + 432) = v33;
    v34 = *(_OWORD *)(a2 + 464);
    *(_OWORD *)(a1 + 448) = *(_OWORD *)(a2 + 448);
    *(_OWORD *)(a1 + 464) = v34;
    goto LABEL_31;
  }
  v32 = *(_QWORD *)(a2 + 424);
  if (v32 == 1)
  {
    outlined destroy of SearchGlobalEntity.ContactAttributes(a1 + 416);
    goto LABEL_29;
  }
  *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
  *(_QWORD *)(a1 + 424) = v32;
  swift_bridgeObjectRelease();
  v35 = *(_QWORD *)(a2 + 440);
  *(_QWORD *)(a1 + 432) = *(_QWORD *)(a2 + 432);
  *(_QWORD *)(a1 + 440) = v35;
  swift_bridgeObjectRelease();
  v36 = *(_QWORD *)(a2 + 456);
  *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
  *(_QWORD *)(a1 + 456) = v36;
  swift_bridgeObjectRelease();
  v37 = *(_QWORD *)(a2 + 472);
  *(_QWORD *)(a1 + 464) = *(_QWORD *)(a2 + 464);
  *(_QWORD *)(a1 + 472) = v37;
  swift_bridgeObjectRelease();
LABEL_31:
  v38 = (_QWORD *)(a2 + 480);
  if (*(_QWORD *)(a1 + 488) != 1)
  {
    v39 = *(_QWORD *)(a2 + 488);
    if (v39 != 1)
    {
      *(_QWORD *)(a1 + 480) = *v38;
      *(_QWORD *)(a1 + 488) = v39;
      swift_bridgeObjectRelease();
      goto LABEL_36;
    }
    outlined destroy of SearchGlobalEntity.AppStoreAttributes(a1 + 480);
  }
  *(_OWORD *)(a1 + 480) = *(_OWORD *)v38;
LABEL_36:
  *(_BYTE *)(a1 + 496) = *(_BYTE *)(a2 + 496);
  *(_QWORD *)(a1 + 504) = *(_QWORD *)(a2 + 504);
  swift_release();
  *(_QWORD *)(a1 + 512) = *(_QWORD *)(a2 + 512);
  swift_release();
  *(_QWORD *)(a1 + 520) = *(_QWORD *)(a2 + 520);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 528))
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 520) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
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
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 528) = 1;
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
    *(_BYTE *)(result + 528) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for SearchGlobalEntity()
{
  OUTLINED_FUNCTION_37();
}

uint64_t destroy for SearchGlobalEntity.Timestamp()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SearchGlobalEntity.Timestamp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v3 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SearchGlobalEntity.Timestamp(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v3;
  v4 = a2[2];
  *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = a2[4];
  *(_QWORD *)(a1 + 40) = a2[5];
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

uint64_t assignWithTake for SearchGlobalEntity.Timestamp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v3 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.Timestamp(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 48))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 40);
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.Timestamp(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)(result + 40) = a2;
  }
  return result;
}

void type metadata accessor for SearchGlobalEntity.Timestamp()
{
  OUTLINED_FUNCTION_37();
}

uint64_t initializeBufferWithCopyOfBuffer for SearchGlobalEntity.Temperature(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SearchGlobalEntity.Temperature()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SearchGlobalEntity.Temperature(uint64_t a1, uint64_t a2)
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

uint64_t assignWithCopy for SearchGlobalEntity.Temperature(uint64_t a1, uint64_t a2)
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

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SearchGlobalEntity.Temperature(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.Temperature(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 25))
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.Temperature(uint64_t result, unsigned int a2, unsigned int a3)
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

void type metadata accessor for SearchGlobalEntity.Temperature()
{
  OUTLINED_FUNCTION_37();
}

uint64_t destroy for SearchGlobalEntity.GeneralAttributes(uint64_t a1)
{
  unint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >> 60 != 15)
    outlined consume of Data._Representation(*(_QWORD *)(a1 + 40), v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SearchGlobalEntity.GeneralAttributes(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = a2[3];
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = a2[4];
  v6 = a2 + 5;
  v7 = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)v6;
  }
  else
  {
    v8 = *v6;
    outlined copy of Data._Representation(*v6, v7);
    *(_QWORD *)(a1 + 40) = v8;
    *(_QWORD *)(a1 + 48) = v7;
  }
  v9 = a2[8];
  *(_QWORD *)(a1 + 56) = a2[7];
  *(_QWORD *)(a1 + 64) = v9;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SearchGlobalEntity.GeneralAttributes(_QWORD *a1, _QWORD *a2)
{
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2 + 5;
  v5 = a2[6];
  if (a1[6] >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      v7 = *v4;
      outlined copy of Data._Representation(*v4, a2[6]);
      v8 = a1[5];
      v9 = a1[6];
      a1[5] = v7;
      a1[6] = v5;
      outlined consume of Data._Representation(v8, v9);
      goto LABEL_8;
    }
    outlined destroy of Data((uint64_t)(a1 + 5));
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 5) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  v6 = *v4;
  outlined copy of Data._Representation(*v4, a2[6]);
  a1[5] = v6;
  a1[6] = v5;
LABEL_8:
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy72_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

_QWORD *assignWithTake for SearchGlobalEntity.GeneralAttributes(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  v6 = a2 + 5;
  v7 = a1[6];
  if (v7 >> 60 != 15)
  {
    v8 = a2[6];
    if (v8 >> 60 != 15)
    {
      v9 = a1[5];
      a1[5] = *v6;
      a1[6] = v8;
      outlined consume of Data._Representation(v9, v7);
      goto LABEL_6;
    }
    outlined destroy of Data((uint64_t)(a1 + 5));
  }
  *(_OWORD *)(a1 + 5) = *(_OWORD *)v6;
LABEL_6:
  v10 = a2[8];
  a1[7] = a2[7];
  a1[8] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.GeneralAttributes(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 72))
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.GeneralAttributes(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
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
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for SearchGlobalEntity.GeneralAttributes()
{
  OUTLINED_FUNCTION_37();
}

uint64_t destroy for SearchGlobalEntity.CustomAttribute(uint64_t a1)
{
  return outlined consume of SearchGlobalEntity.CustomAttribute(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t *initializeWithCopy for SearchGlobalEntity.CustomAttribute(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = a2[5];
  outlined copy of SearchGlobalEntity.CustomAttribute(*a2, v4, v5, v6);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  return a1;
}

uint64_t *assignWithCopy for SearchGlobalEntity.CustomAttribute(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = a2[5];
  outlined copy of SearchGlobalEntity.CustomAttribute(*a2, v4, v5, v6);
  v9 = *a1;
  v10 = a1[1];
  v11 = a1[2];
  v12 = a1[3];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  outlined consume of SearchGlobalEntity.CustomAttribute(v9, v10, v11, v12);
  return a1;
}

uint64_t assignWithTake for SearchGlobalEntity.CustomAttribute(uint64_t a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __int128 v7;

  v3 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 32) = a2[2];
  outlined consume of SearchGlobalEntity.CustomAttribute(v3, v5, v4, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.CustomAttribute(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 48))
    {
      v3 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24) >> 1;
      if (v2 > 0x80000000)
        v3 = ~(_DWORD)v2;
      else
        v3 = -1;
    }
  }
  else
  {
    v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.CustomAttribute(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = 0;
      *(_QWORD *)(result + 24) = 2 * -a2;
      *(_QWORD *)(result + 32) = 0;
      *(_QWORD *)(result + 40) = 0;
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t getEnumTag for SearchGlobalEntity.CustomAttribute(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24) >> 62;
}

uint64_t destructiveProjectEnumData for SearchGlobalEntity.CustomAttribute(uint64_t result)
{
  *(_QWORD *)(result + 24) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t destructiveInjectEnumTag for SearchGlobalEntity.CustomAttribute(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 24) = *(_QWORD *)(result + 24) & 1 | (a2 << 62);
  return result;
}

void type metadata accessor for SearchGlobalEntity.CustomAttribute()
{
  OUTLINED_FUNCTION_37();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

void type metadata accessor for SearchGlobalEntity.EntityType()
{
  OUTLINED_FUNCTION_37();
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

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.EventAttributes(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFE && a1[33])
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *a1;
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.EventAttributes(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 2;
  }
  return result;
}

void type metadata accessor for SearchGlobalEntity.EventAttributes()
{
  OUTLINED_FUNCTION_37();
}

uint64_t destroy for SearchGlobalEntity.PlaceAttributes()
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
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SearchGlobalEntity.PlaceAttributes(uint64_t a1, uint64_t a2)
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

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  v8 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v8;
  v9 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v9;
  v10 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v10;
  v11 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v11;
  v12 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v12;
  v13 = *(_QWORD *)(a2 + 160);
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = v13;
  v14 = *(_QWORD *)(a2 + 176);
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = v14;
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

uint64_t assignWithCopy for SearchGlobalEntity.PlaceAttributes(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 160);
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = v4;
  v5 = *(_QWORD *)(a2 + 176);
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = v5;
  return a1;
}

void *__swift_memcpy185_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xB9uLL);
}

uint64_t assignWithTake for SearchGlobalEntity.PlaceAttributes(uint64_t a1, uint64_t a2)
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
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v12;
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v13;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.PlaceAttributes(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 185))
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.PlaceAttributes(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
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
    *(_BYTE *)(result + 184) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 185) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 185) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

void type metadata accessor for SearchGlobalEntity.PlaceAttributes()
{
  OUTLINED_FUNCTION_37();
}

uint64_t destroy for SearchGlobalEntity.IDAttributes()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for SearchGlobalEntity.IDAttributes(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for SearchGlobalEntity.IDAttributes(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for SearchGlobalEntity.IDAttributes(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.IDAttributes(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.IDAttributes(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

void type metadata accessor for SearchGlobalEntity.IDAttributes()
{
  OUTLINED_FUNCTION_37();
}

uint64_t destroy for SearchGlobalEntity.ContactAttributes()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for SearchGlobalEntity.ContactAttributes(_QWORD *a1, _QWORD *a2)
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
  return a1;
}

_QWORD *assignWithCopy for SearchGlobalEntity.ContactAttributes(_QWORD *a1, _QWORD *a2)
{
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

_QWORD *assignWithTake for SearchGlobalEntity.ContactAttributes(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.ContactAttributes(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 64))
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.ContactAttributes(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

void type metadata accessor for SearchGlobalEntity.ContactAttributes()
{
  OUTLINED_FUNCTION_37();
}

_QWORD *initializeBufferWithCopyOfBuffer for SearchGlobalEntity.AppStoreAttributes(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SearchGlobalEntity.AppStoreAttributes(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for SearchGlobalEntity.AppStoreAttributes(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.AppStoreAttributes(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.AppStoreAttributes(uint64_t result, unsigned int a2, unsigned int a3)
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

void type metadata accessor for SearchGlobalEntity.AppStoreAttributes()
{
  OUTLINED_FUNCTION_37();
}

uint64_t destroy for SearchGlobalEntity.Builder(uint64_t *a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = a1[5];
  if (v2 >> 60 != 15)
    outlined consume of Data._Representation(a1[4], v2);
  swift_bridgeObjectRelease();
  if (a1[9])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v3 = a1[15];
    if (v3 >> 60 != 15)
      outlined consume of Data._Representation(a1[14], v3);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  if (a1[25] != 1)
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
  }
  if (a1[49] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[53] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  result = a1[61];
  if (result != 1)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t initializeWithCopy for SearchGlobalEntity.Builder(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  unint64_t v16;
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
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _OWORD *v40;
  uint64_t v41;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = (uint64_t *)(a2 + 32);
  v7 = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v6;
  }
  else
  {
    v8 = *v6;
    outlined copy of Data._Representation(*v6, v7);
    *(_QWORD *)(a1 + 32) = v8;
    *(_QWORD *)(a1 + 40) = v7;
  }
  v9 = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v10;
  swift_bridgeObjectRetain();
  if (v9)
  {
    v11 = *(_QWORD *)(a2 + 80);
    v12 = *(_QWORD *)(a2 + 88);
    *(_QWORD *)(a1 + 72) = v9;
    *(_QWORD *)(a1 + 80) = v11;
    v13 = *(_QWORD *)(a2 + 96);
    v14 = *(_QWORD *)(a2 + 104);
    *(_QWORD *)(a1 + 88) = v12;
    *(_QWORD *)(a1 + 96) = v13;
    *(_QWORD *)(a1 + 104) = v14;
    v15 = (uint64_t *)(a2 + 112);
    v16 = *(_QWORD *)(a2 + 120);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v16 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 112) = *(_OWORD *)v15;
    }
    else
    {
      v17 = *v15;
      outlined copy of Data._Representation(*v15, v16);
      *(_QWORD *)(a1 + 112) = v17;
      *(_QWORD *)(a1 + 120) = v16;
    }
    v18 = *(_QWORD *)(a2 + 136);
    *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
    *(_QWORD *)(a1 + 136) = v18;
    swift_bridgeObjectRetain();
  }
  else
  {
    memcpy((void *)(a1 + 72), (const void *)(a2 + 72), 0x48uLL);
  }
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  v19 = *(_QWORD *)(a2 + 200);
  swift_bridgeObjectRetain();
  if (v19 == 1)
  {
    memcpy((void *)(a1 + 192), (const void *)(a2 + 192), 0xB9uLL);
  }
  else
  {
    *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
    *(_QWORD *)(a1 + 200) = v19;
    v20 = *(_QWORD *)(a2 + 216);
    *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
    *(_QWORD *)(a1 + 216) = v20;
    v21 = *(_QWORD *)(a2 + 232);
    *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
    *(_QWORD *)(a1 + 232) = v21;
    v22 = *(_QWORD *)(a2 + 248);
    *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
    *(_QWORD *)(a1 + 248) = v22;
    v23 = *(_QWORD *)(a2 + 264);
    *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
    *(_QWORD *)(a1 + 264) = v23;
    v24 = *(_QWORD *)(a2 + 280);
    *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
    *(_QWORD *)(a1 + 280) = v24;
    v25 = *(_QWORD *)(a2 + 296);
    *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
    *(_QWORD *)(a1 + 296) = v25;
    v26 = *(_QWORD *)(a2 + 312);
    *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
    *(_QWORD *)(a1 + 312) = v26;
    v27 = *(_QWORD *)(a2 + 328);
    *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
    *(_QWORD *)(a1 + 328) = v27;
    v28 = *(_QWORD *)(a2 + 344);
    *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
    *(_QWORD *)(a1 + 344) = v28;
    v29 = *(_QWORD *)(a2 + 352);
    *(_BYTE *)(a1 + 360) = *(_BYTE *)(a2 + 360);
    *(_QWORD *)(a1 + 352) = v29;
    v30 = *(_QWORD *)(a2 + 368);
    *(_BYTE *)(a1 + 376) = *(_BYTE *)(a2 + 376);
    *(_QWORD *)(a1 + 368) = v30;
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
  v31 = *(_QWORD *)(a2 + 392);
  if (v31 == 1)
  {
    v32 = *(_OWORD *)(a2 + 400);
    *(_OWORD *)(a1 + 384) = *(_OWORD *)(a2 + 384);
    *(_OWORD *)(a1 + 400) = v32;
  }
  else
  {
    *(_QWORD *)(a1 + 384) = *(_QWORD *)(a2 + 384);
    *(_QWORD *)(a1 + 392) = v31;
    v33 = *(_QWORD *)(a2 + 408);
    *(_QWORD *)(a1 + 400) = *(_QWORD *)(a2 + 400);
    *(_QWORD *)(a1 + 408) = v33;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  v34 = *(_QWORD *)(a2 + 424);
  if (v34 == 1)
  {
    v35 = *(_OWORD *)(a2 + 432);
    *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
    *(_OWORD *)(a1 + 432) = v35;
    v36 = *(_OWORD *)(a2 + 464);
    *(_OWORD *)(a1 + 448) = *(_OWORD *)(a2 + 448);
    *(_OWORD *)(a1 + 464) = v36;
  }
  else
  {
    *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
    *(_QWORD *)(a1 + 424) = v34;
    v37 = *(_QWORD *)(a2 + 440);
    *(_QWORD *)(a1 + 432) = *(_QWORD *)(a2 + 432);
    *(_QWORD *)(a1 + 440) = v37;
    v38 = *(_QWORD *)(a2 + 456);
    *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
    *(_QWORD *)(a1 + 456) = v38;
    v39 = *(_QWORD *)(a2 + 472);
    *(_QWORD *)(a1 + 464) = *(_QWORD *)(a2 + 464);
    *(_QWORD *)(a1 + 472) = v39;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  v40 = (_OWORD *)(a2 + 480);
  v41 = *(_QWORD *)(a2 + 488);
  if (v41 == 1)
  {
    *(_OWORD *)(a1 + 480) = *v40;
  }
  else
  {
    *(_QWORD *)(a1 + 480) = *(_QWORD *)v40;
    *(_QWORD *)(a1 + 488) = v41;
    swift_bridgeObjectRetain();
  }
  *(_BYTE *)(a1 + 496) = *(_BYTE *)(a2 + 496);
  return a1;
}

uint64_t assignWithCopy for SearchGlobalEntity.Builder(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  _OWORD *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  _OWORD *v32;
  __int128 *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (uint64_t *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  if (*(_QWORD *)(a1 + 40) >> 60 == 15)
  {
    if (v5 >> 60 != 15)
    {
      v6 = *v4;
      outlined copy of Data._Representation(*v4, *(_QWORD *)(a2 + 40));
      *(_QWORD *)(a1 + 32) = v6;
      *(_QWORD *)(a1 + 40) = v5;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
    outlined destroy of Data(a1 + 32);
LABEL_6:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  v7 = *v4;
  outlined copy of Data._Representation(*v4, *(_QWORD *)(a2 + 40));
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v5;
  outlined consume of Data._Representation(v8, v9);
LABEL_8:
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 72);
  if (*(_QWORD *)(a1 + 72))
  {
    if (v10)
    {
      *(_QWORD *)(a1 + 72) = v10;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
      *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
      *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v11 = (uint64_t *)(a2 + 112);
      v12 = *(_QWORD *)(a2 + 120);
      if (*(_QWORD *)(a1 + 120) >> 60 == 15)
      {
        if (v12 >> 60 != 15)
        {
          v13 = *v11;
          outlined copy of Data._Representation(*v11, *(_QWORD *)(a2 + 120));
          *(_QWORD *)(a1 + 112) = v13;
          *(_QWORD *)(a1 + 120) = v12;
LABEL_24:
          *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
          *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          goto LABEL_25;
        }
      }
      else
      {
        if (v12 >> 60 != 15)
        {
          v17 = *v11;
          outlined copy of Data._Representation(*v11, *(_QWORD *)(a2 + 120));
          v18 = *(_QWORD *)(a1 + 112);
          v19 = *(_QWORD *)(a1 + 120);
          *(_QWORD *)(a1 + 112) = v17;
          *(_QWORD *)(a1 + 120) = v12;
          outlined consume of Data._Representation(v18, v19);
          goto LABEL_24;
        }
        outlined destroy of Data(a1 + 112);
      }
      *(_OWORD *)(a1 + 112) = *(_OWORD *)v11;
      goto LABEL_24;
    }
    outlined destroy of SearchGlobalEntity.GeneralAttributes(a1 + 72);
LABEL_17:
    memcpy((void *)(a1 + 72), (const void *)(a2 + 72), 0x48uLL);
    goto LABEL_25;
  }
  if (!v10)
    goto LABEL_17;
  *(_QWORD *)(a1 + 72) = v10;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  v14 = (uint64_t *)(a2 + 112);
  v15 = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v15 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 112) = *(_OWORD *)v14;
  }
  else
  {
    v16 = *v14;
    outlined copy of Data._Representation(*v14, v15);
    *(_QWORD *)(a1 + 112) = v16;
    *(_QWORD *)(a1 + 120) = v15;
  }
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
LABEL_25:
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v20 = *(_OWORD *)(a2 + 152);
  v21 = *(_OWORD *)(a2 + 168);
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  *(_OWORD *)(a1 + 168) = v21;
  *(_OWORD *)(a1 + 152) = v20;
  v22 = *(_QWORD *)(a2 + 200);
  if (*(_QWORD *)(a1 + 200) == 1)
  {
    if (v22 != 1)
    {
      *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
      *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
      *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
      *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
      *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
      *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
      *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
      *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
      *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
      *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
      *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
      *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
      *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
      *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
      *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
      *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
      *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
      *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
      *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
      *(_QWORD *)(a1 + 344) = *(_QWORD *)(a2 + 344);
      v23 = *(_QWORD *)(a2 + 352);
      *(_BYTE *)(a1 + 360) = *(_BYTE *)(a2 + 360);
      *(_QWORD *)(a1 + 352) = v23;
      v24 = *(_QWORD *)(a2 + 368);
      *(_BYTE *)(a1 + 376) = *(_BYTE *)(a2 + 376);
      *(_QWORD *)(a1 + 368) = v24;
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
      goto LABEL_32;
    }
    goto LABEL_30;
  }
  if (v22 == 1)
  {
    outlined destroy of SearchGlobalEntity.PlaceAttributes(a1 + 192);
LABEL_30:
    memcpy((void *)(a1 + 192), (const void *)(a2 + 192), 0xB9uLL);
    goto LABEL_32;
  }
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  *(_QWORD *)(a1 + 344) = *(_QWORD *)(a2 + 344);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v25 = *(_QWORD *)(a2 + 352);
  *(_BYTE *)(a1 + 360) = *(_BYTE *)(a2 + 360);
  *(_QWORD *)(a1 + 352) = v25;
  v26 = *(_QWORD *)(a2 + 368);
  *(_BYTE *)(a1 + 376) = *(_BYTE *)(a2 + 376);
  *(_QWORD *)(a1 + 368) = v26;
LABEL_32:
  v27 = (_OWORD *)(a1 + 384);
  v28 = (_OWORD *)(a2 + 384);
  v29 = *(_QWORD *)(a2 + 392);
  if (*(_QWORD *)(a1 + 392) == 1)
  {
    if (v29 == 1)
    {
      v30 = *(_OWORD *)(a2 + 400);
      *v27 = *v28;
      *(_OWORD *)(a1 + 400) = v30;
    }
    else
    {
      *(_QWORD *)(a1 + 384) = *(_QWORD *)(a2 + 384);
      *(_QWORD *)(a1 + 392) = *(_QWORD *)(a2 + 392);
      *(_QWORD *)(a1 + 400) = *(_QWORD *)(a2 + 400);
      *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v29 == 1)
  {
    outlined destroy of SearchGlobalEntity.IDAttributes(a1 + 384);
    v31 = *(_OWORD *)(a2 + 400);
    *v27 = *v28;
    *(_OWORD *)(a1 + 400) = v31;
  }
  else
  {
    *(_QWORD *)(a1 + 384) = *(_QWORD *)(a2 + 384);
    *(_QWORD *)(a1 + 392) = *(_QWORD *)(a2 + 392);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 400) = *(_QWORD *)(a2 + 400);
    *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  v32 = (_OWORD *)(a1 + 416);
  v33 = (__int128 *)(a2 + 416);
  v34 = *(_QWORD *)(a2 + 424);
  if (*(_QWORD *)(a1 + 424) == 1)
  {
    if (v34 == 1)
    {
      v35 = *v33;
      v36 = *(_OWORD *)(a2 + 432);
      v37 = *(_OWORD *)(a2 + 464);
      *(_OWORD *)(a1 + 448) = *(_OWORD *)(a2 + 448);
      *(_OWORD *)(a1 + 464) = v37;
      *v32 = v35;
      *(_OWORD *)(a1 + 432) = v36;
    }
    else
    {
      *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
      *(_QWORD *)(a1 + 424) = *(_QWORD *)(a2 + 424);
      *(_QWORD *)(a1 + 432) = *(_QWORD *)(a2 + 432);
      *(_QWORD *)(a1 + 440) = *(_QWORD *)(a2 + 440);
      *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
      *(_QWORD *)(a1 + 456) = *(_QWORD *)(a2 + 456);
      *(_QWORD *)(a1 + 464) = *(_QWORD *)(a2 + 464);
      *(_QWORD *)(a1 + 472) = *(_QWORD *)(a2 + 472);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v34 == 1)
  {
    outlined destroy of SearchGlobalEntity.ContactAttributes(a1 + 416);
    v38 = *(_OWORD *)(a2 + 464);
    v40 = *v33;
    v39 = *(_OWORD *)(a2 + 432);
    *(_OWORD *)(a1 + 448) = *(_OWORD *)(a2 + 448);
    *(_OWORD *)(a1 + 464) = v38;
    *v32 = v40;
    *(_OWORD *)(a1 + 432) = v39;
  }
  else
  {
    *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
    *(_QWORD *)(a1 + 424) = *(_QWORD *)(a2 + 424);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 432) = *(_QWORD *)(a2 + 432);
    *(_QWORD *)(a1 + 440) = *(_QWORD *)(a2 + 440);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
    *(_QWORD *)(a1 + 456) = *(_QWORD *)(a2 + 456);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 464) = *(_QWORD *)(a2 + 464);
    *(_QWORD *)(a1 + 472) = *(_QWORD *)(a2 + 472);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  v41 = *(_QWORD *)(a2 + 488);
  if (*(_QWORD *)(a1 + 488) != 1)
  {
    if (v41 != 1)
    {
      *(_QWORD *)(a1 + 480) = *(_QWORD *)(a2 + 480);
      *(_QWORD *)(a1 + 488) = *(_QWORD *)(a2 + 488);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_53;
    }
    outlined destroy of SearchGlobalEntity.AppStoreAttributes(a1 + 480);
    goto LABEL_51;
  }
  if (v41 == 1)
  {
LABEL_51:
    *(_OWORD *)(a1 + 480) = *(_OWORD *)(a2 + 480);
    goto LABEL_53;
  }
  *(_QWORD *)(a1 + 480) = *(_QWORD *)(a2 + 480);
  *(_QWORD *)(a1 + 488) = *(_QWORD *)(a2 + 488);
  swift_bridgeObjectRetain();
LABEL_53:
  *(_BYTE *)(a1 + 496) = *(_BYTE *)(a2 + 496);
  return a1;
}

void *__swift_memcpy497_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x1F1uLL);
}

uint64_t assignWithTake for SearchGlobalEntity.Builder(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
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
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = (_OWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 >> 60 == 15)
    goto LABEL_4;
  v8 = *(_QWORD *)(a2 + 40);
  if (v8 >> 60 == 15)
  {
    outlined destroy of Data(a1 + 32);
LABEL_4:
    *(_OWORD *)(a1 + 32) = *v6;
    goto LABEL_6;
  }
  v9 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)v6;
  *(_QWORD *)(a1 + 40) = v8;
  outlined consume of Data._Representation(v9, v7);
LABEL_6:
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 72);
  if (!*(_QWORD *)(a1 + 72))
  {
LABEL_13:
    memcpy((void *)(a1 + 72), (const void *)(a2 + 72), 0x48uLL);
    goto LABEL_16;
  }
  if (!v11)
  {
    outlined destroy of SearchGlobalEntity.GeneralAttributes(a1 + 72);
    goto LABEL_13;
  }
  *(_QWORD *)(a1 + 72) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v12;
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v13;
  swift_bridgeObjectRelease();
  v14 = (_QWORD *)(a2 + 112);
  v15 = *(_QWORD *)(a1 + 120);
  if (v15 >> 60 != 15)
  {
    v16 = *(_QWORD *)(a2 + 120);
    if (v16 >> 60 != 15)
    {
      v17 = *(_QWORD *)(a1 + 112);
      *(_QWORD *)(a1 + 112) = *v14;
      *(_QWORD *)(a1 + 120) = v16;
      outlined consume of Data._Representation(v17, v15);
      goto LABEL_15;
    }
    outlined destroy of Data(a1 + 112);
  }
  *(_OWORD *)(a1 + 112) = *(_OWORD *)v14;
LABEL_15:
  v18 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v18;
  swift_bridgeObjectRelease();
LABEL_16:
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  if (*(_QWORD *)(a1 + 200) == 1)
  {
LABEL_19:
    memcpy((void *)(a1 + 192), (const void *)(a2 + 192), 0xB9uLL);
    goto LABEL_21;
  }
  v19 = *(_QWORD *)(a2 + 200);
  if (v19 == 1)
  {
    outlined destroy of SearchGlobalEntity.PlaceAttributes(a1 + 192);
    goto LABEL_19;
  }
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v19;
  swift_bridgeObjectRelease();
  v20 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v20;
  swift_bridgeObjectRelease();
  v21 = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = v21;
  swift_bridgeObjectRelease();
  v22 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v22;
  swift_bridgeObjectRelease();
  v23 = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v23;
  swift_bridgeObjectRelease();
  v24 = *(_QWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = v24;
  swift_bridgeObjectRelease();
  v25 = *(_QWORD *)(a2 + 296);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = v25;
  swift_bridgeObjectRelease();
  v26 = *(_QWORD *)(a2 + 312);
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = v26;
  swift_bridgeObjectRelease();
  v27 = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  *(_QWORD *)(a1 + 328) = v27;
  swift_bridgeObjectRelease();
  v28 = *(_QWORD *)(a2 + 344);
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  *(_QWORD *)(a1 + 344) = v28;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 352) = *(_QWORD *)(a2 + 352);
  *(_BYTE *)(a1 + 360) = *(_BYTE *)(a2 + 360);
  *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
  *(_BYTE *)(a1 + 376) = *(_BYTE *)(a2 + 376);
LABEL_21:
  if (*(_QWORD *)(a1 + 392) == 1)
  {
LABEL_24:
    v30 = *(_OWORD *)(a2 + 400);
    *(_OWORD *)(a1 + 384) = *(_OWORD *)(a2 + 384);
    *(_OWORD *)(a1 + 400) = v30;
    goto LABEL_26;
  }
  v29 = *(_QWORD *)(a2 + 392);
  if (v29 == 1)
  {
    outlined destroy of SearchGlobalEntity.IDAttributes(a1 + 384);
    goto LABEL_24;
  }
  *(_QWORD *)(a1 + 384) = *(_QWORD *)(a2 + 384);
  *(_QWORD *)(a1 + 392) = v29;
  swift_bridgeObjectRelease();
  v31 = *(_QWORD *)(a2 + 408);
  *(_QWORD *)(a1 + 400) = *(_QWORD *)(a2 + 400);
  *(_QWORD *)(a1 + 408) = v31;
  swift_bridgeObjectRelease();
LABEL_26:
  if (*(_QWORD *)(a1 + 424) == 1)
  {
LABEL_29:
    v33 = *(_OWORD *)(a2 + 432);
    *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
    *(_OWORD *)(a1 + 432) = v33;
    v34 = *(_OWORD *)(a2 + 464);
    *(_OWORD *)(a1 + 448) = *(_OWORD *)(a2 + 448);
    *(_OWORD *)(a1 + 464) = v34;
    goto LABEL_31;
  }
  v32 = *(_QWORD *)(a2 + 424);
  if (v32 == 1)
  {
    outlined destroy of SearchGlobalEntity.ContactAttributes(a1 + 416);
    goto LABEL_29;
  }
  *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
  *(_QWORD *)(a1 + 424) = v32;
  swift_bridgeObjectRelease();
  v35 = *(_QWORD *)(a2 + 440);
  *(_QWORD *)(a1 + 432) = *(_QWORD *)(a2 + 432);
  *(_QWORD *)(a1 + 440) = v35;
  swift_bridgeObjectRelease();
  v36 = *(_QWORD *)(a2 + 456);
  *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
  *(_QWORD *)(a1 + 456) = v36;
  swift_bridgeObjectRelease();
  v37 = *(_QWORD *)(a2 + 472);
  *(_QWORD *)(a1 + 464) = *(_QWORD *)(a2 + 464);
  *(_QWORD *)(a1 + 472) = v37;
  swift_bridgeObjectRelease();
LABEL_31:
  v38 = (_QWORD *)(a2 + 480);
  if (*(_QWORD *)(a1 + 488) != 1)
  {
    v39 = *(_QWORD *)(a2 + 488);
    if (v39 != 1)
    {
      *(_QWORD *)(a1 + 480) = *v38;
      *(_QWORD *)(a1 + 488) = v39;
      swift_bridgeObjectRelease();
      goto LABEL_36;
    }
    outlined destroy of SearchGlobalEntity.AppStoreAttributes(a1 + 480);
  }
  *(_OWORD *)(a1 + 480) = *(_OWORD *)v38;
LABEL_36:
  *(_BYTE *)(a1 + 496) = *(_BYTE *)(a2 + 496);
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.Builder(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 497))
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.Builder(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 488) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
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
    *(_BYTE *)(result + 496) = 0;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 497) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 497) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

void type metadata accessor for SearchGlobalEntity.Builder()
{
  OUTLINED_FUNCTION_37();
}

void type metadata accessor for SearchGlobalEntity.Query()
{
  OUTLINED_FUNCTION_37();
}

void sub_24339DEC0()
{
  lazy protocol witness table accessor for type EmptyResolverSpecification<SearchGlobalEntity> and conformance EmptyResolverSpecification<A>((uint64_t)&lazy protocol witness table cache variable for type DataRepresentation<SearchGlobalEntity> and conformance DataRepresentation<A>);
}

void lazy protocol witness table accessor for type EmptyResolverSpecification<SearchGlobalEntity> and conformance EmptyResolverSpecification<A>(uint64_t a1)
{
  uint64_t *v1;

  if (!OUTLINED_FUNCTION_115(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v1);
    OUTLINED_FUNCTION_201();
  }
  OUTLINED_FUNCTION_5();
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF1)
  {
    if (a2 + 15 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 15) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 16;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x10;
  v5 = v6 - 16;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 15 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 15) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF1)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF0)
    return ((uint64_t (*)(void))((char *)&loc_24339DFF0 + 4 * byte_2433A804A[v4]))();
  *a1 = a2 + 15;
  return ((uint64_t (*)(void))((char *)sub_24339E024 + 4 * byte_2433A8045[v4]))();
}

uint64_t sub_24339E024(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24339E02C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24339E034);
  return result;
}

uint64_t sub_24339E040(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24339E048);
  *(_BYTE *)result = a2 + 15;
  return result;
}

uint64_t sub_24339E04C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24339E054(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for SearchGlobalEntity.CodingKeys()
{
  return &unk_2513D7998;
}

uint64_t getEnumTag for SearchGlobalEntity.AppStoreAttributes.CodingKeys()
{
  return 0;
}

void *type metadata accessor for SearchGlobalEntity.AppStoreAttributes.CodingKeys()
{
  return &unk_2513D7A28;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.ContactAttributes.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.ContactAttributes.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24339E168 + 4 * byte_2433A8054[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24339E19C + 4 * byte_2433A804F[v4]))();
}

uint64_t sub_24339E19C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24339E1A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24339E1ACLL);
  return result;
}

uint64_t sub_24339E1B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24339E1C0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24339E1C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24339E1CC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for SearchGlobalEntity.ContactAttributes.CodingKeys()
{
  return &unk_2513D7AB8;
}

void *type metadata accessor for SearchGlobalEntity.IDAttributes.CodingKeys()
{
  return &unk_2513D7B48;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.PlaceAttributes.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF5)
  {
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
    v5 = (*a1 | (v4 << 8)) - 12;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v5 = v6 - 12;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.PlaceAttributes.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24339E2D4 + 4 * byte_2433A805E[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_24339E308 + 4 * byte_2433A8059[v4]))();
}

uint64_t sub_24339E308(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24339E310(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24339E318);
  return result;
}

uint64_t sub_24339E324(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24339E32CLL);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_24339E330(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24339E338(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for SearchGlobalEntity.PlaceAttributes.CodingKeys()
{
  return &unk_2513D7BD8;
}

void *type metadata accessor for SearchGlobalEntity.EventAttributes.CodingKeys()
{
  return &unk_2513D7C68;
}

uint64_t getEnumTag for SearchGlobalEntity.EntityType.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for SearchGlobalEntity.EntityType.CodingKeys(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void *type metadata accessor for SearchGlobalEntity.EntityType.CodingKeys()
{
  return &unk_2513D7CF8;
}

void *type metadata accessor for SearchGlobalEntity.EntityType.GenericCodingKeys()
{
  return &unk_2513D7D18;
}

void *type metadata accessor for SearchGlobalEntity.EntityType.MapsCodingKeys()
{
  return &unk_2513D7D38;
}

void *type metadata accessor for SearchGlobalEntity.EntityType.UnknownCodingKeys()
{
  return &unk_2513D7D58;
}

void *type metadata accessor for SearchGlobalEntity.CustomAttribute.CodingKeys()
{
  return &unk_2513D7DE8;
}

void *type metadata accessor for SearchGlobalEntity.CustomAttribute.StringCodingKeys()
{
  return &unk_2513D7E78;
}

void *type metadata accessor for SearchGlobalEntity.CustomAttribute.TimestampCodingKeys()
{
  return &unk_2513D7F08;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.AppStoreAttributes.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.AppStoreAttributes.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24339E474 + 4 * byte_2433A8063[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24339E494 + 4 * byte_2433A8068[v4]))();
}

_BYTE *sub_24339E474(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24339E494(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24339E49C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24339E4A4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24339E4AC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24339E4B4(_DWORD *result)
{
  *result = 0;
  return result;
}

void *type metadata accessor for SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys()
{
  return &unk_2513D7F98;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.GeneralAttributes.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFC)
  {
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
    v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v5 = v6 - 5;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.GeneralAttributes.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24339E5A4 + 4 * byte_2433A8072[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_24339E5D8 + 4 * byte_2433A806D[v4]))();
}

uint64_t sub_24339E5D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24339E5E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24339E5E8);
  return result;
}

uint64_t sub_24339E5F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24339E5FCLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_24339E600(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24339E608(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for SearchGlobalEntity.GeneralAttributes.CodingKeys()
{
  return &unk_2513D8028;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.IDAttributes.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.IDAttributes.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24339E6F8 + 4 * byte_2433A807C[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24339E72C + 4 * byte_2433A8077[v4]))();
}

uint64_t sub_24339E72C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24339E734(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24339E73CLL);
  return result;
}

uint64_t sub_24339E748(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24339E750);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24339E754(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24339E75C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *destructiveInjectEnumTag for SearchGlobalEntity.Temperature.CodingKeys(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void *type metadata accessor for SearchGlobalEntity.Temperature.CodingKeys()
{
  return &unk_2513D80B8;
}

uint64_t getEnumTagSinglePayload for SearchGlobalEntity.EntityType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SearchGlobalEntity.EntityType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24339E858 + 4 * byte_2433A8086[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24339E88C + 4 * byte_2433A8081[v4]))();
}

uint64_t sub_24339E88C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24339E894(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24339E89CLL);
  return result;
}

uint64_t sub_24339E8A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24339E8B0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24339E8B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24339E8BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for SearchGlobalEntity.Timestamp.CodingKeys()
{
  return &unk_2513D8148;
}

void outlined init with copy of IntentFile?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_132(a1, a2, a3);
  OUTLINED_FUNCTION_216(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_5();
}

void outlined destroy of IntentFile?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_5();
}

void lazy protocol witness table accessor for type IntentFile and conformance IntentFile(uint64_t a1)
{
  void (*v1)(uint64_t);

  if (!OUTLINED_FUNCTION_115(a1))
  {
    v1(255);
    OUTLINED_FUNCTION_201();
  }
  OUTLINED_FUNCTION_5();
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t OUTLINED_FUNCTION_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_6()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_9@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_11()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_16()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_20()
{
  return Apple_Parsec_Siri_V2alpha_AppEntityMetadata.placeAttributes.getter();
}

uint64_t OUTLINED_FUNCTION_21()
{
  uint64_t v0;
  unint64_t v1;

  return String.nilIfEmpty.getter(v0, v1);
}

uint64_t OUTLINED_FUNCTION_23()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

void OUTLINED_FUNCTION_25()
{
  JUMPOUT(0x2494F7A6CLL);
}

uint64_t OUTLINED_FUNCTION_26()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_29()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_30()
{
  uint64_t v0;
  unint64_t v1;

  return String.nilIfEmpty.getter(v0, v1);
}

uint64_t OUTLINED_FUNCTION_31()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_35()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_36()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_39@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = v1[52];
  v3 = v1[53];
  v4 = v1[54];
  v5 = v1[55];
  v6 = v1[56];
  v7 = v1[57];
  v8 = v1[58];
  v9 = v1[59];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v8;
  a1[7] = v9;
  return outlined copy of SearchGlobalEntity.ContactAttributes?(v2, v3);
}

uint64_t OUTLINED_FUNCTION_40@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = v1[9];
  v3 = v1[10];
  v4 = v1[11];
  v5 = v1[12];
  v6 = v1[13];
  v7 = v1[14];
  v8 = v1[15];
  v9 = v1[16];
  v10 = v1[17];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v8;
  a1[7] = v9;
  a1[8] = v10;
  return outlined copy of SearchGlobalEntity.GeneralAttributes?(v2, v3, v4, v5, v6, v7, v8);
}

void OUTLINED_FUNCTION_41()
{
  _QWORD *v0;

  v0[14] = 0;
  v0[15] = 0;
  v0[16] = 0;
  v0[17] = 0;
  v0[18] = 0;
  v0[19] = 0;
  v0[13] = 0;
  v0[21] = 0;
  v0[22] = 0;
  v0[10] = 0;
  v0[11] = 0;
  v0[23] = 0;
  v0[24] = 0;
}

uint64_t OUTLINED_FUNCTION_42()
{
  return Apple_Parsec_Siri_V2alpha_AppEntityMetadata.placeAttributes.getter();
}

uint64_t OUTLINED_FUNCTION_43(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_47@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_48()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v0, v2);
}

void OUTLINED_FUNCTION_49(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  outlined init with take of SearchGlobalEntity.PlaceAttributes?(a1, a2, v2);
}

void OUTLINED_FUNCTION_50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,unint64_t a29,unint64_t a30,unint64_t a31,uint64_t a32,unint64_t a33,unint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,unint64_t a39)
{
  STACK[0x608] = a31;
  STACK[0x610] = a39;
  STACK[0x618] = a30;
  STACK[0x620] = a34;
  STACK[0x628] = a29;
  STACK[0x630] = a33;
}

uint64_t OUTLINED_FUNCTION_52()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_53()
{
  return swift_bridgeObjectRetain();
}

_QWORD *OUTLINED_FUNCTION_54()
{
  _QWORD *v0;

  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

void *OUTLINED_FUNCTION_55(void *a1)
{
  uint64_t v1;

  return memcpy(a1, (const void *)(v1 + 4152), 0x1F1uLL);
}

uint64_t OUTLINED_FUNCTION_57()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_58()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_59()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_60()
{
  return swift_bridgeObjectRelease();
}

void *OUTLINED_FUNCTION_61(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x1F1uLL);
}

uint64_t OUTLINED_FUNCTION_63()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_64()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_65()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t OUTLINED_FUNCTION_66()
{
  return Apple_Parsec_Siri_V2alpha_AppEntityMetadata.generalAttributes.getter();
}

uint64_t OUTLINED_FUNCTION_69@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = v1[48];
  v3 = v1[49];
  v4 = v1[50];
  v5 = v1[51];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return outlined copy of SearchGlobalEntity.IDAttributes?(v2, v3);
}

uint64_t OUTLINED_FUNCTION_70()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_71()
{
  _QWORD *v0;

  v0[14] = 0;
  v0[15] = 0;
  v0[16] = 0;
  v0[17] = 0;
  v0[18] = 0;
  v0[19] = 0;
  v0[13] = 0;
  v0[21] = 0;
  v0[22] = 0;
  v0[11] = 0;
}

uint64_t OUTLINED_FUNCTION_72()
{
  return 0;
}

void OUTLINED_FUNCTION_76(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  outlined init with take of SearchGlobalEntity.PlaceAttributes?(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_77()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_78()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_79()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_80()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_81@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_82()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_83()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_84()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_85()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t OUTLINED_FUNCTION_86()
{
  unint64_t v0;
  uint64_t v1;

  return outlined consume of Data?(v1, v0);
}

uint64_t OUTLINED_FUNCTION_87()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_88()
{
  JUMPOUT(0x2494F797CLL);
}

Swift::Int OUTLINED_FUNCTION_89()
{
  return Hasher._finalize()();
}

uint64_t OUTLINED_FUNCTION_90()
{
  return Hasher.init(_seed:)();
}

uint64_t OUTLINED_FUNCTION_91()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t OUTLINED_FUNCTION_94()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_95@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v1 + 480);
  v3 = *(_QWORD *)(v1 + 488);
  *a1 = v2;
  a1[1] = v3;
  return outlined copy of SearchGlobalEntity.AppStoreAttributes?(v2, v3);
}

uint64_t OUTLINED_FUNCTION_96()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_97(uint64_t a1)
{
  return *(_QWORD *)a1;
}

__n128 OUTLINED_FUNCTION_98@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  __n128 result;
  __int128 v4;

  v2 = *(_BYTE *)(v1 + 184);
  result = *(__n128 *)(v1 + 152);
  v4 = *(_OWORD *)(v1 + 168);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 32) = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_99(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

_QWORD *OUTLINED_FUNCTION_100(_QWORD *a1)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

uint64_t OUTLINED_FUNCTION_101@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_103()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_105(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return outlined copy of SearchGlobalEntity.CustomAttribute(a1, v2, v3, v1);
}

uint64_t OUTLINED_FUNCTION_106()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_109()
{
  return swift_bridgeObjectRetain();
}

_QWORD *OUTLINED_FUNCTION_110()
{
  uint64_t v0;

  return outlined release of SearchGlobalEntity((_QWORD *)(v0 + 8));
}

uint64_t OUTLINED_FUNCTION_111()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t OUTLINED_FUNCTION_112()
{
  return type metadata accessor for Logger();
}

uint64_t OUTLINED_FUNCTION_113@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

void *OUTLINED_FUNCTION_114()
{
  return malloc(0x28uLL);
}

uint64_t OUTLINED_FUNCTION_115(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t OUTLINED_FUNCTION_116()
{
  return swift_bridgeObjectRelease();
}

void *OUTLINED_FUNCTION_117(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x210uLL);
}

uint64_t OUTLINED_FUNCTION_118()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_119@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_120()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t OUTLINED_FUNCTION_121()
{
  return Apple_Parsec_Siri_V2alpha_AppEntityMetadata.eventAttributes.getter();
}

uint64_t OUTLINED_FUNCTION_122()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_123()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_124()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_125()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  outlined copy of Data?(v1, v0);
  outlined copy of Data?(v3, v2);
  return v1;
}

uint64_t OUTLINED_FUNCTION_127()
{
  return 0;
}

void OUTLINED_FUNCTION_128(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  Swift::UInt v10;

  Hasher._combine(_:)(v10);
}

uint64_t OUTLINED_FUNCTION_129()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_130()
{
  return swift_bridgeObjectRetain();
}

unint64_t OUTLINED_FUNCTION_131(uint64_t a1)
{
  char v1;

  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

uint64_t OUTLINED_FUNCTION_132(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_133()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_134()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_135()
{
  _QWORD *v0;

  v0[14] = 0;
  v0[15] = 0;
  v0[16] = 0;
  v0[17] = 0;
  v0[18] = 0;
  v0[19] = 0;
  v0[13] = 0;
}

uint64_t OUTLINED_FUNCTION_136()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_137(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;

  return outlined consume of SearchGlobalEntity.CustomAttribute(a1, a2, a3, v3);
}

uint64_t OUTLINED_FUNCTION_138@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 392) = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_139()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_140()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t OUTLINED_FUNCTION_141()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t OUTLINED_FUNCTION_142()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

unint64_t OUTLINED_FUNCTION_144()
{
  return 0xD000000000000010;
}

uint64_t OUTLINED_FUNCTION_145()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

BOOL OUTLINED_FUNCTION_148(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_149()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_150()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_154()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_155()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1Tm(v0);
}

uint64_t OUTLINED_FUNCTION_157()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return *(_QWORD *)(v0 - 96);
}

uint64_t OUTLINED_FUNCTION_158(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;

  return outlined consume of SearchGlobalEntity.CustomAttribute(a1, a2, a3, v3);
}

uint64_t OUTLINED_FUNCTION_159(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;

  return outlined copy of SearchGlobalEntity.CustomAttribute(a1, a2, a3, v3);
}

uint64_t OUTLINED_FUNCTION_161()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_163()
{
  return static os_log_type_t.error.getter();
}

uint64_t OUTLINED_FUNCTION_165()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_166()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_167(uint64_t a1)
{
  unint64_t v1;

  return outlined consume of Data?(a1, v1);
}

uint64_t OUTLINED_FUNCTION_171(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
}

uint64_t OUTLINED_FUNCTION_172()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_173(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 2896) = a1;
  return v1 + 2896;
}

void OUTLINED_FUNCTION_174(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

char *OUTLINED_FUNCTION_175(char *a1, int64_t a2)
{
  uint64_t v2;

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_176()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_178(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_179()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_180()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_181()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_184()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 552) = *(_QWORD *)(v0 + 112);
  *(_BYTE *)(v0 + 560) = *(_BYTE *)(v1 - 96);
}

uint64_t OUTLINED_FUNCTION_185()
{
  return swift_allocError();
}

void OUTLINED_FUNCTION_186(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 48);
}

_QWORD *OUTLINED_FUNCTION_187()
{
  uint64_t v0;

  return outlined retain of SearchGlobalEntity((_QWORD *)(v0 + 8));
}

uint64_t OUTLINED_FUNCTION_188()
{
  return Apple_Parsec_Siri_V2alpha_AppEntityMetadata.contactAttribute.getter();
}

uint64_t OUTLINED_FUNCTION_189()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t OUTLINED_FUNCTION_190()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t OUTLINED_FUNCTION_191()
{
  return swift_beginAccess();
}

unint64_t OUTLINED_FUNCTION_193()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 128) = 2;
  return lazy protocol witness table accessor for type SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys and conformance SearchGlobalEntity.CustomAttribute.TemperatureCodingKeys();
}

uint64_t OUTLINED_FUNCTION_194()
{
  uint64_t v0;
  uint64_t v1;

  *(_BYTE *)(v1 - 67) = 2;
  return v0;
}

unint64_t OUTLINED_FUNCTION_195()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 2;
  return lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.UnknownCodingKeys and conformance SearchGlobalEntity.EntityType.UnknownCodingKeys();
}

void OUTLINED_FUNCTION_196()
{
  char v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = *(_QWORD *)(v1 - 168);
  *(_BYTE *)(v1 - 104) = v0 & 1;
}

uint64_t OUTLINED_FUNCTION_198()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return *(_QWORD *)(v0 - 96);
}

unint64_t OUTLINED_FUNCTION_199()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return lazy protocol witness table accessor for type SearchGlobalEntity.EntityType.MapsCodingKeys and conformance SearchGlobalEntity.EntityType.MapsCodingKeys();
}

uint64_t OUTLINED_FUNCTION_200()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_201()
{
  JUMPOUT(0x2494F7A00);
}

uint64_t OUTLINED_FUNCTION_203()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_204()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_205()
{
  unint64_t v0;
  uint64_t v1;

  return outlined copy of Data?(v1, v0);
}

void OUTLINED_FUNCTION_206()
{
  JUMPOUT(0x2494F7988);
}

void *OUTLINED_FUNCTION_207(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xB9uLL);
}

uint64_t OUTLINED_FUNCTION_208@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_209()
{
  return swift_dynamicCast();
}

void OUTLINED_FUNCTION_210(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;

  outlined init with take of SearchGlobalEntity.PlaceAttributes?(v2 + 656, a2, v3);
}

void OUTLINED_FUNCTION_211()
{
  Hasher._combine(_:)(0);
}

uint64_t OUTLINED_FUNCTION_212()
{
  return Hasher.init(_seed:)();
}

uint64_t OUTLINED_FUNCTION_213()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t OUTLINED_FUNCTION_214()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1Tm(v0);
}

uint64_t OUTLINED_FUNCTION_215()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_216@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_217()
{
  uint64_t v0;
  unint64_t v1;

  return String.nilIfEmpty.getter(v0, v1);
}

uint64_t OUTLINED_FUNCTION_218()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_219()
{
  SearchGlobalEntity.init(builder:)();
}

uint64_t OUTLINED_FUNCTION_220()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t ExperienceProviding.experiences.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentFile?);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for IntentFile();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - v10;
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1)
  {
    _s10AppIntents10IntentFileVSgWOhTm_0((uint64_t)v6, &demangling cache variable for type metadata for IntentFile?);
    return MEMORY[0x24BEE4AF8];
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v6, v7);
    IntentFile.data.getter();
    v12 = static LoadExperience.fromData(_:)();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    OUTLINED_FUNCTION_2_0();
  }
  return v12;
}

uint64_t static LoadExperience.fromData(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  _QWORD v3[6];

  type metadata accessor for NSKeyedUnarchiver(0, &lazy cache variable for type metadata for NSKeyedUnarchiver);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject.Type>);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_2433A9C30;
  *(_QWORD *)(v1 + 32) = type metadata accessor for NSKeyedUnarchiver(0, &lazy cache variable for type metadata for NSArray);
  *(_QWORD *)(v1 + 40) = type metadata accessor for Experience();
  static NSKeyedUnarchiver.unarchivedObject(ofClasses:from:)();
  result = swift_bridgeObjectRelease();
  if (!v0)
  {
    if (v3[3])
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Experience]);
      if (swift_dynamicCast())
        return v3[5];
    }
    else
    {
      _s10AppIntents10IntentFileVSgWOhTm_0((uint64_t)v3, &demangling cache variable for type metadata for Any?);
    }
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t type metadata accessor for NSKeyedUnarchiver(uint64_t a1, unint64_t *a2)
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

uint64_t _s10AppIntents10IntentFileVSgWOhTm_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t dispatch thunk of ExperienceProviding.experienceSourceType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ExperienceProviding.experienceFile.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

ValueMetadata *type metadata accessor for LoadExperience()
{
  return &type metadata for LoadExperience;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  unint64_t v0;
  uint64_t v1;

  return outlined consume of Data._Representation(v1, v0);
}

uint64_t Logging.search.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for search != -1)
    swift_once();
  v0 = OUTLINED_FUNCTION_112();
  return __swift_project_value_buffer(v0, (uint64_t)static Logging.search);
}

uint64_t one-time initialization function for search()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_112();
  __swift_allocate_value_buffer(v0, static Logging.search);
  __swift_project_value_buffer(v0, (uint64_t)static Logging.search);
  return Logger.init(subsystem:category:)();
}

uint64_t static Logging.search.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (one-time initialization token for search != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_112();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static Logging.search);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

ValueMetadata *type metadata accessor for Logging()
{
  return &type metadata for Logging;
}

void MemoryCreationQUParse.query.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
}

uint64_t MemoryCreationQUParse.attributes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MemoryCreationQUParse.isTrip.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t MemoryCreationQUParse.isOpenEndedTimeRange.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 41);
}

void MemoryCreationQUParse.sortOrder.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 42);
}

uint64_t MemoryCreationQUParse.__allocating_init(query:attributes:isTrip:isOpenEndedTimeRange:sortOrder:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char *a6)
{
  uint64_t result;
  char v13;

  OUTLINED_FUNCTION_23_0();
  result = swift_allocObject();
  v13 = *a6;
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)(result + 32) = a3;
  *(_BYTE *)(result + 40) = a4;
  *(_BYTE *)(result + 41) = a5;
  *(_BYTE *)(result + 42) = v13;
  return result;
}

uint64_t MemoryCreationQUParse.init(query:attributes:isTrip:isOpenEndedTimeRange:sortOrder:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char *a6)
{
  uint64_t v6;
  char v7;

  v7 = *a6;
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  *(_QWORD *)(v6 + 32) = a3;
  *(_BYTE *)(v6 + 40) = a4;
  *(_BYTE *)(v6 + 41) = a5;
  *(_BYTE *)(v6 + 42) = v7;
  return v6;
}

uint64_t MemoryCreationQUParse.encode()()
{
  uint64_t v0;
  uint64_t v1;

  type metadata accessor for JSONEncoder();
  OUTLINED_FUNCTION_28_0();
  JSONEncoder.init()();
  type metadata accessor for MemoryCreationQUParse();
  lazy protocol witness table accessor for type MemoryCreationQUParse and conformance MemoryCreationQUParse(&lazy protocol witness table cache variable for type MemoryCreationQUParse and conformance MemoryCreationQUParse, v0, (uint64_t (*)(uint64_t))type metadata accessor for MemoryCreationQUParse, (uint64_t)&protocol conformance descriptor for MemoryCreationQUParse);
  v1 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  swift_release();
  return v1;
}

uint64_t type metadata accessor for MemoryCreationQUParse()
{
  return objc_opt_self();
}

uint64_t static MemoryCreationQUParse.makeFrom(data:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  type metadata accessor for JSONDecoder();
  OUTLINED_FUNCTION_28_0();
  JSONDecoder.init()();
  type metadata accessor for MemoryCreationQUParse();
  lazy protocol witness table accessor for type MemoryCreationQUParse and conformance MemoryCreationQUParse(&lazy protocol witness table cache variable for type MemoryCreationQUParse and conformance MemoryCreationQUParse, v1, (uint64_t (*)(uint64_t))type metadata accessor for MemoryCreationQUParse, (uint64_t)&protocol conformance descriptor for MemoryCreationQUParse);
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  result = swift_release();
  if (!v0)
    return v3;
  return result;
}

uint64_t MemoryCreationQUParse.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  Swift::String v3;
  Swift::String v4;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  Swift::String v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t result;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  Swift::String v40;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  OUTLINED_FUNCTION_29_0();
  v3._countAndFlagsBits = v1;
  v3._object = v2;
  String.append(_:)(v3);
  OUTLINED_FUNCTION_58();
  v4._countAndFlagsBits = 10;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);
  if (*(_BYTE *)(v0 + 40))
    v5 = 1702195828;
  else
    v5 = 0x65736C6166;
  OUTLINED_FUNCTION_13_0(v5);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9_0(v6, v7, v8, v9, v10, v11, v12, v13, 0x203A706972547369, (void *)0xE800000000000000);
  OUTLINED_FUNCTION_12_0();
  _StringGuts.grow(_:)(25);
  swift_bridgeObjectRelease();
  if (*(_BYTE *)(v0 + 41))
    v14 = 1702195828;
  else
    v14 = 0x65736C6166;
  OUTLINED_FUNCTION_13_0(v14);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9_0(v15, v16, v17, v18, v19, v20, v21, v22, 0xD000000000000016, (void *)0x80000002433A7480);
  OUTLINED_FUNCTION_12_0();
  v23 = 0x7473726966;
  if (*(_BYTE *)(v0 + 42) != 1)
    v23 = 1953718636;
  if (*(_BYTE *)(v0 + 42))
    v24 = v23;
  else
    v24 = 1701736302;
  OUTLINED_FUNCTION_13_0(v24);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9_0(v25, v26, v27, v28, v29, v30, v31, v32, 0x6564724F74726F73, (void *)0xEB00000000203A72);
  OUTLINED_FUNCTION_12_0();
  v33._countAndFlagsBits = 0x7475626972747441;
  v33._object = (void *)0xEC0000000A3A7365;
  String.append(_:)(v33);
  v34 = *(_QWORD *)(v0 + 32);
  if (!(v34 >> 62))
  {
    v35 = *(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = OUTLINED_FUNCTION_130();
    if (v35)
      goto LABEL_14;
LABEL_20:
    OUTLINED_FUNCTION_129();
    return 0x203A7972657551;
  }
  OUTLINED_FUNCTION_130();
  result = _CocoaArrayWrapper.endIndex.getter();
  v35 = result;
  if (!result)
    goto LABEL_20;
LABEL_14:
  if (v35 >= 1)
  {
    v37 = 0;
    do
    {
      if ((v34 & 0xC000000000000001) != 0)
      {
        v38 = MEMORY[0x2494F75EC](v37, v34);
      }
      else
      {
        v38 = *(_QWORD *)(v34 + 8 * v37 + 32);
        swift_retain();
      }
      ++v37;
      v40._countAndFlagsBits = (*(uint64_t (**)(void))(*(_QWORD *)v38 + 144))();
      v40._object = v39;
      OUTLINED_FUNCTION_4_0();
      String.append(_:)(v40);
      swift_release();
      swift_bridgeObjectRelease();
    }
    while (v35 != v37);
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t MemoryCreationQUParseSortOrder.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x7473726966;
  if (*v0 != 1)
    v1 = 1953718636;
  if (*v0)
    return v1;
  else
    return 1701736302;
}

uint64_t MemoryCreationQUParse.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  char v9;

  v2 = a1 == 0x7972657571 && a2 == 0xE500000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x7475626972747461 && a2 == 0xEA00000000007365;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x706972547369 && a2 == 0xE600000000000000;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000014 && a2 == 0x80000002433A7570
             || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0x6564724F74726F73 && a2 == 0xE900000000000072)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 4;
        else
          return 5;
      }
    }
  }
}

uint64_t MemoryCreationQUParse.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2433A1014 + 4 * byte_2433A9C80[a1]))(0x7972657571, 0xE500000000000000);
}

uint64_t sub_2433A1014()
{
  return 0x7475626972747461;
}

uint64_t sub_2433A1030()
{
  return 0x706972547369;
}

unint64_t sub_2433A1044()
{
  return 0xD000000000000014;
}

uint64_t sub_2433A1060()
{
  return 0x6564724F74726F73;
}

void protocol witness for Hashable.hashValue.getter in conformance MemoryCreationQUParse.CodingKeys()
{
  unsigned __int8 *v0;

  MemoryCreationQUParse.CodingKeys.hashValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance MemoryCreationQUParse.CodingKeys()
{
  unsigned __int8 *v0;

  return MemoryCreationQUParse.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance MemoryCreationQUParse.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = MemoryCreationQUParse.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance MemoryCreationQUParse.CodingKeys()
{
  lazy protocol witness table accessor for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance MemoryCreationQUParse.CodingKeys()
{
  lazy protocol witness table accessor for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t MemoryCreationQUParse.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t MemoryCreationQUParse.__deallocating_deinit()
{
  MemoryCreationQUParse.deinit();
  OUTLINED_FUNCTION_23_0();
  return swift_deallocClassInstance();
}

void MemoryCreationQUParse.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<MemoryCreationQUParse.CodingKeys>);
  OUTLINED_FUNCTION_26_0();
  MEMORY[0x24BDAC7A8](v3);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_11_0();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [MemoryCreationQUParseAttributes]);
    lazy protocol witness table accessor for type [MemoryCreationQUParseAttributes] and conformance <A> [A](&lazy protocol witness table cache variable for type [MemoryCreationQUParseAttributes] and conformance <A> [A], &lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes and conformance MemoryCreationQUParseAttributes, (uint64_t)&protocol conformance descriptor for MemoryCreationQUParseAttributes, MEMORY[0x24BEE12A0]);
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_19_0();
    OUTLINED_FUNCTION_19_0();
    lazy protocol witness table accessor for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder();
    OUTLINED_FUNCTION_7_0();
  }
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_16_0();
}

unint64_t lazy protocol witness table accessor for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for MemoryCreationQUParse.CodingKeys, &unk_2513D85C8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for MemoryCreationQUParse.CodingKeys, &unk_2513D85C8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for MemoryCreationQUParse.CodingKeys, &unk_2513D85C8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for MemoryCreationQUParse.CodingKeys, &unk_2513D85C8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys);
  }
  return result;
}

uint64_t type metadata accessor for MemoryCreationQUParseAttributes()
{
  return objc_opt_self();
}

unint64_t lazy protocol witness table accessor for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for MemoryCreationQUParseSortOrder, &type metadata for MemoryCreationQUParseSortOrder);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for MemoryCreationQUParseSortOrder, &type metadata for MemoryCreationQUParseSortOrder);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for MemoryCreationQUParseSortOrder, &type metadata for MemoryCreationQUParseSortOrder);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for MemoryCreationQUParseSortOrder, &type metadata for MemoryCreationQUParseSortOrder);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder);
  }
  return result;
}

void MemoryCreationQUParse.__allocating_init(from:)(_QWORD *a1)
{
  OUTLINED_FUNCTION_23_0();
  swift_allocObject();
  MemoryCreationQUParse.init(from:)(a1);
  OUTLINED_FUNCTION_32_0();
}

void MemoryCreationQUParse.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<MemoryCreationQUParse.CodingKeys>);
  OUTLINED_FUNCTION_24_0();
  MEMORY[0x24BDAC7A8](v4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type MemoryCreationQUParse.CodingKeys and conformance MemoryCreationQUParse.CodingKeys();
  OUTLINED_FUNCTION_14_0();
  if (v2)
  {
    type metadata accessor for MemoryCreationQUParse();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(_QWORD *)(v1 + 16) = OUTLINED_FUNCTION_10_0();
    *(_QWORD *)(v1 + 24) = v5;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [MemoryCreationQUParseAttributes]);
    lazy protocol witness table accessor for type [MemoryCreationQUParseAttributes] and conformance <A> [A](&lazy protocol witness table cache variable for type [MemoryCreationQUParseAttributes] and conformance <A> [A], &lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes and conformance MemoryCreationQUParseAttributes, (uint64_t)&protocol conformance descriptor for MemoryCreationQUParseAttributes, MEMORY[0x24BEE12D0]);
    OUTLINED_FUNCTION_2_1();
    *(_QWORD *)(v1 + 32) = v6;
    *(_BYTE *)(v1 + 40) = KeyedDecodingContainer.decode(_:forKey:)() & 1;
    *(_BYTE *)(v1 + 41) = KeyedDecodingContainer.decode(_:forKey:)() & 1;
    lazy protocol witness table accessor for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder();
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_0_2();
    *(_BYTE *)(v1 + 42) = v7;
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  OUTLINED_FUNCTION_0_0();
}

uint64_t lazy protocol witness table accessor for type [MemoryCreationQUParseAttributes] and conformance <A> [A](unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [MemoryCreationQUParseAttributes]);
    v11 = lazy protocol witness table accessor for type MemoryCreationQUParse and conformance MemoryCreationQUParse(a2, v10, (uint64_t (*)(uint64_t))type metadata accessor for MemoryCreationQUParseAttributes, a3);
    result = MEMORY[0x2494F7A00](a4, v9, &v11);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance MemoryCreationQUParse@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 152))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance MemoryCreationQUParse()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 144))();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance MemoryCreationQUParse()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 136))();
}

uint64_t MemoryCreationQUParseAttributes.range.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

void MemoryCreationQUParseAttributes.substring.getter()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
}

uint64_t MemoryCreationQUParseAttributes.expansionStringValues.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MemoryCreationQUParseAttributes.expansionDateValues.getter()
{
  return swift_bridgeObjectRetain();
}

_QWORD *MemoryCreationQUParseAttributes.__allocating_init(attributeKey:range:substring:expansionStringValues:expansionDateValues:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *result;

  OUTLINED_FUNCTION_22_0();
  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  result[6] = a5;
  result[7] = a6;
  result[8] = a7;
  result[9] = a8;
  return result;
}

_QWORD *MemoryCreationQUParseAttributes.init(attributeKey:range:substring:expansionStringValues:expansionDateValues:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[2] = a1;
  v8[3] = a2;
  v8[4] = a3;
  v8[5] = a4;
  v8[6] = a5;
  v8[7] = a6;
  v8[8] = a7;
  v8[9] = a8;
  return v8;
}

void MemoryCreationQUParseAttributes.__allocating_init(from:)(_QWORD *a1)
{
  OUTLINED_FUNCTION_22_0();
  swift_allocObject();
  MemoryCreationQUParseAttributes.init(from:)(a1);
  OUTLINED_FUNCTION_32_0();
}

void MemoryCreationQUParseAttributes.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<MemoryCreationQUParseAttributes.CodingKeys>);
  OUTLINED_FUNCTION_24_0();
  MEMORY[0x24BDAC7A8](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys();
  OUTLINED_FUNCTION_14_0();
  if (!v2)
  {
    LOBYTE(v17) = 0;
    *(_QWORD *)(v1 + 16) = OUTLINED_FUNCTION_10_0();
    *(_QWORD *)(v1 + 24) = v6;
    type metadata accessor for _NSRange();
    lazy protocol witness table accessor for type MemoryCreationQUParse and conformance MemoryCreationQUParse(&lazy protocol witness table cache variable for type _NSRange and conformance _NSRange, 255, (uint64_t (*)(uint64_t))type metadata accessor for _NSRange, MEMORY[0x24BDD0290]);
    OUTLINED_FUNCTION_2_1();
    *(_OWORD *)(v1 + 32) = v17;
    LOBYTE(v17) = 2;
    *(_QWORD *)(v1 + 48) = OUTLINED_FUNCTION_10_0();
    *(_QWORD *)(v1 + 56) = v7;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    lazy protocol witness table accessor for type [String] and conformance <A> [A](&lazy protocol witness table cache variable for type [String] and conformance <A> [A], MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    OUTLINED_FUNCTION_2_1();
    *(_QWORD *)(v1 + 64) = v17;
    LOBYTE(v19) = 4;
    lazy protocol witness table accessor for type Data and conformance Data();
    v8 = OUTLINED_FUNCTION_6_0();
    v9 = v17;
    OUTLINED_FUNCTION_21_0(v8, &lazy cache variable for type metadata for NSKeyedUnarchiver);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject.Type>);
    v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_2433A9C30;
    OUTLINED_FUNCTION_21_0(v10, &lazy cache variable for type metadata for NSArray);
    *(_QWORD *)(v10 + 32) = v11;
    OUTLINED_FUNCTION_21_0(v11, &lazy cache variable for type metadata for NSDate);
    *(_QWORD *)(v10 + 40) = v12;
    static NSKeyedUnarchiver.unarchivedObject(ofClasses:from:)();
    swift_bridgeObjectRelease();
    if (v18)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSDate]);
      v13 = swift_dynamicCast();
      v14 = *((_QWORD *)&v9 + 1);
      v15 = v9;
      if (v13)
      {
        v16 = v19;
        outlined consume of Data._Representation(v9, *((unint64_t *)&v9 + 1));
LABEL_10:
        OUTLINED_FUNCTION_0_2();
        *(_QWORD *)(v3 + 72) = v16;
        goto LABEL_4;
      }
    }
    else
    {
      outlined destroy of Any?((uint64_t)&v17);
      v14 = *((_QWORD *)&v9 + 1);
      v15 = v9;
    }
    outlined consume of Data._Representation(v15, v14);
    v16 = MEMORY[0x24BEE4AF8];
    goto LABEL_10;
  }
  type metadata accessor for MemoryCreationQUParseAttributes();
  swift_deallocPartialClassInstance();
LABEL_4:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  OUTLINED_FUNCTION_0_0();
}

unint64_t lazy protocol witness table accessor for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for MemoryCreationQUParseAttributes.CodingKeys, &type metadata for MemoryCreationQUParseAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for MemoryCreationQUParseAttributes.CodingKeys, &type metadata for MemoryCreationQUParseAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for MemoryCreationQUParseAttributes.CodingKeys, &type metadata for MemoryCreationQUParseAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys;
  if (!lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for MemoryCreationQUParseAttributes.CodingKeys, &type metadata for MemoryCreationQUParseAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys);
  }
  return result;
}

void _sSo17NSKeyedUnarchiverCMaTm_0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    objc_opt_self();
    atomic_store(swift_getObjCClassMetadata(), a2);
  }
  OUTLINED_FUNCTION_5();
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void MemoryCreationQUParseAttributes.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  Class isa;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  __int128 v14;
  uint64_t v15;

  v3 = v1;
  v15 = *MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<MemoryCreationQUParseAttributes.CodingKeys>);
  OUTLINED_FUNCTION_26_0();
  MEMORY[0x24BDAC7A8](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys();
  OUTLINED_FUNCTION_18_0();
  LOBYTE(v14) = 0;
  OUTLINED_FUNCTION_11_0();
  if (!v2)
  {
    v14 = *(_OWORD *)(v3 + 32);
    type metadata accessor for _NSRange();
    lazy protocol witness table accessor for type MemoryCreationQUParse and conformance MemoryCreationQUParse(&lazy protocol witness table cache variable for type _NSRange and conformance _NSRange, 255, (uint64_t (*)(uint64_t))type metadata accessor for _NSRange, MEMORY[0x24BDD0280]);
    OUTLINED_FUNCTION_5_0();
    LOBYTE(v14) = 2;
    OUTLINED_FUNCTION_11_0();
    *(_QWORD *)&v14 = *(_QWORD *)(v3 + 64);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    lazy protocol witness table accessor for type [String] and conformance <A> [A](&lazy protocol witness table cache variable for type [String] and conformance <A> [A], MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    OUTLINED_FUNCTION_5_0();
    v6 = (void *)objc_opt_self();
    OUTLINED_FUNCTION_21_0((uint64_t)v6, &lazy cache variable for type metadata for NSDate);
    isa = Array._bridgeToObjectiveC()().super.isa;
    *(_QWORD *)&v14 = 0;
    v8 = objc_msgSend(v6, sel_archivedDataWithRootObject_requiringSecureCoding_error_, isa, 1, &v14);

    v9 = (id)v14;
    if (v8)
    {
      v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      v12 = v11;

      *(_QWORD *)&v14 = v10;
      *((_QWORD *)&v14 + 1) = v12;
      lazy protocol witness table accessor for type Data and conformance Data();
      OUTLINED_FUNCTION_7_0();
      OUTLINED_FUNCTION_8_0();
      outlined consume of Data._Representation(v10, v12);
      goto LABEL_6;
    }
    v13 = v9;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  OUTLINED_FUNCTION_8_0();
LABEL_6:
  OUTLINED_FUNCTION_16_0();
}

uint64_t lazy protocol witness table accessor for type MemoryCreationQUParse and conformance MemoryCreationQUParse(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x2494F7A00](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type [String] and conformance <A> [A](unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    v8 = a2;
    result = MEMORY[0x2494F7A00](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

BOOL static MemoryCreationQUParseAttributes.CodingKeys.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional __swiftcall MemoryCreationQUParseAttributes.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  BOOL v1;
  void *object;
  uint64_t countAndFlagsBits;
  BOOL v5;
  BOOL v6;
  char v7;

  v1 = stringValue._countAndFlagsBits == 0x7475626972747461 && stringValue._object == (void *)0xEC00000079654B65;
  if (v1
    || (object = stringValue._object,
        countAndFlagsBits = stringValue._countAndFlagsBits,
        (OUTLINED_FUNCTION_1_0() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v5 = countAndFlagsBits == 0x65676E6172 && object == (void *)0xE500000000000000;
    if (v5 || (OUTLINED_FUNCTION_1_0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return (OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional)1;
    }
    else
    {
      v6 = countAndFlagsBits == 0x6E69727473627573 && object == (void *)0xE900000000000067;
      if (v6 || (OUTLINED_FUNCTION_1_0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return (OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional)2;
      }
      else if (countAndFlagsBits == 0xD000000000000015 && object == (void *)0x80000002433A74A0
             || (OUTLINED_FUNCTION_1_0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return (OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional)3;
      }
      else if (countAndFlagsBits == 0xD000000000000013 && object == (void *)0x80000002433A74C0)
      {
        swift_bridgeObjectRelease();
        return (OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional)4;
      }
      else
      {
        v7 = OUTLINED_FUNCTION_1_0();
        OUTLINED_FUNCTION_129();
        if ((v7 & 1) != 0)
          return (OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional)4;
        else
          return (OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional)5;
      }
    }
  }
}

OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional __swiftcall MemoryCreationQUParseAttributes.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional)5;
}

void MemoryCreationQUParse.CodingKeys.hashValue.getter(unsigned __int8 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  Hasher._finalize()();
  OUTLINED_FUNCTION_38();
}

uint64_t MemoryCreationQUParseAttributes.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t MemoryCreationQUParseAttributes.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2433A2194 + 4 * byte_2433A9C85[a1]))(0x7475626972747461, 0xEC00000079654B65);
}

uint64_t sub_2433A2194()
{
  return 0x65676E6172;
}

uint64_t sub_2433A21A8()
{
  return 0x6E69727473627573;
}

unint64_t sub_2433A21C4()
{
  return 0xD000000000000015;
}

unint64_t sub_2433A21E4()
{
  return 0xD000000000000013;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance MemoryCreationQUParseAttributes.CodingKeys(char *a1, char *a2)
{
  return static MemoryCreationQUParseAttributes.CodingKeys.== infix(_:_:)(*a1, *a2);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance MemoryCreationQUParseAttributes.CodingKeys()
{
  unsigned __int8 *v0;

  return MemoryCreationQUParse.CodingKeys.hashValue.getter(*v0);
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance MemoryCreationQUParse.CodingKeys()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  Hasher._finalize()();
  OUTLINED_FUNCTION_38();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance MemoryCreationQUParseAttributes.CodingKeys()
{
  unsigned __int8 *v0;

  return MemoryCreationQUParseAttributes.CodingKeys.stringValue.getter(*v0);
}

OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional protocol witness for CodingKey.init(stringValue:) in conformance MemoryCreationQUParseAttributes.CodingKeys@<W0>(uint64_t a1@<X0>, OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional *a2@<X8>)
{
  OmniSearchTypes::MemoryCreationQUParseAttributes::CodingKeys_optional result;

  result.value = MemoryCreationQUParseAttributes.CodingKeys.init(stringValue:)(*(Swift::String *)&a1).value;
  a2->value = result.value;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance MemoryCreationQUParseAttributes.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance MemoryCreationQUParseAttributes.CodingKeys()
{
  lazy protocol witness table accessor for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance MemoryCreationQUParseAttributes.CodingKeys()
{
  lazy protocol witness table accessor for type MemoryCreationQUParseAttributes.CodingKeys and conformance MemoryCreationQUParseAttributes.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t MemoryCreationQUParseAttributes.description.getter()
{
  Swift::String v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  uint64_t v4;
  Swift::String v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  _StringGuts.grow(_:)(67);
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_58();
  v0._countAndFlagsBits = 0x6E6172203E2D2D20;
  v0._object = (void *)0xEC000000203A6567;
  String.append(_:)(v0);
  v1._countAndFlagsBits = _NSRange.description.getter();
  String.append(_:)(v1);
  OUTLINED_FUNCTION_12_0();
  v2._countAndFlagsBits = 0x203A79656B202CLL;
  v2._object = (void *)0xE700000000000000;
  String.append(_:)(v2);
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_58();
  v3._countAndFlagsBits = 0xD000000000000014;
  v3._object = (void *)0x80000002433A74E0;
  String.append(_:)(v3);
  v4 = OUTLINED_FUNCTION_4();
  MEMORY[0x2494F7550](v4, MEMORY[0x24BEE0D00]);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_58();
  v5._object = (void *)0x80000002433A7500;
  v5._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v5);
  _sSo17NSKeyedUnarchiverCMaTm_0(0, &lazy cache variable for type metadata for NSDate);
  v7 = v6;
  v8 = OUTLINED_FUNCTION_130();
  MEMORY[0x2494F7550](v8, v7);
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_58();
  return 0;
}

uint64_t MemoryCreationQUParseAttributes.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t MemoryCreationQUParseAttributes.__deallocating_deinit()
{
  MemoryCreationQUParseAttributes.deinit();
  OUTLINED_FUNCTION_22_0();
  return swift_deallocClassInstance();
}

uint64_t protocol witness for Decodable.init(from:) in conformance MemoryCreationQUParseAttributes@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 128))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance MemoryCreationQUParseAttributes()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 136))();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance MemoryCreationQUParseAttributes()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 144))();
}

OmniSearchTypes::MemoryCreationQUParseSortOrder_optional __swiftcall MemoryCreationQUParseSortOrder.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  void *object;
  Swift::String v3;
  char *v4;
  unint64_t v5;
  OmniSearchTypes::MemoryCreationQUParseSortOrder_optional result;
  char v7;

  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  v4 = v1;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of MemoryCreationQUParseSortOrder.init(rawValue:), v3);
  result.value = OUTLINED_FUNCTION_129();
  v7 = 3;
  if (v5 < 3)
    v7 = v5;
  *v4 = v7;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance MemoryCreationQUParseSortOrder(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance MemoryCreationQUParseSortOrder()
{
  char *v0;

  return specialized RawRepresentable<>.hashValue.getter(*v0);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance MemoryCreationQUParseSortOrder(uint64_t a1)
{
  char *v1;

  return specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance MemoryCreationQUParseSortOrder(uint64_t a1)
{
  char *v1;

  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

OmniSearchTypes::MemoryCreationQUParseSortOrder_optional protocol witness for RawRepresentable.init(rawValue:) in conformance MemoryCreationQUParseSortOrder(Swift::String *a1)
{
  return MemoryCreationQUParseSortOrder.init(rawValue:)(*a1);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance MemoryCreationQUParseSortOrder@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = MemoryCreationQUParseSortOrder.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance MemoryCreationQUParseSortOrder()
{
  lazy protocol witness table accessor for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder();
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance MemoryCreationQUParseSortOrder()
{
  lazy protocol witness table accessor for type MemoryCreationQUParseSortOrder and conformance MemoryCreationQUParseSortOrder();
  return RawRepresentable<>.encode(to:)();
}

uint64_t method lookup function for MemoryCreationQUParse()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MemoryCreationQUParse.__allocating_init(query:attributes:isTrip:isOpenEndedTimeRange:sortOrder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of MemoryCreationQUParse.encode()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of MemoryCreationQUParse.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of MemoryCreationQUParse.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of MemoryCreationQUParse.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t method lookup function for MemoryCreationQUParseAttributes()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MemoryCreationQUParseAttributes.__allocating_init(attributeKey:range:substring:expansionStringValues:expansionDateValues:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of MemoryCreationQUParseAttributes.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of MemoryCreationQUParseAttributes.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of MemoryCreationQUParseAttributes.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

ValueMetadata *type metadata accessor for MemoryCreationQUParseAttributes.CodingKeys()
{
  return &type metadata for MemoryCreationQUParseAttributes.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for MemoryCreationQUParseSortOrder(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2433A2888 + 4 * byte_2433A9C8F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2433A28BC + 4 * byte_2433A9C8A[v4]))();
}

uint64_t sub_2433A28BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2433A28C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2433A28CCLL);
  return result;
}

uint64_t sub_2433A28D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2433A28E0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2433A28E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2433A28EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MemoryCreationQUParseSortOrder()
{
  return &type metadata for MemoryCreationQUParseSortOrder;
}

uint64_t storeEnumTagSinglePayload for MemoryCreationQUParseAttributes.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2433A2954 + 4 * byte_2433A9C99[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2433A2988 + 4 * byte_2433A9C94[v4]))();
}

uint64_t sub_2433A2988(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2433A2990(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2433A2998);
  return result;
}

uint64_t sub_2433A29A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2433A29ACLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2433A29B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2433A29B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for MemoryCreationQUParse.CodingKeys()
{
  return &unk_2513D85C8;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

void OUTLINED_FUNCTION_3_0()
{
  uint64_t v0;
  void *v1;
  Swift::String v2;

  v2._countAndFlagsBits = v0;
  v2._object = v1;
  String.append(_:)(v2);
}

void OUTLINED_FUNCTION_4_0()
{
  Swift::String v0;

  v0._countAndFlagsBits = 10;
  v0._object = (void *)0xE100000000000000;
  String.append(_:)(v0);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

void OUTLINED_FUNCTION_9_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  Swift::String v10;

  v10._countAndFlagsBits = a9;
  v10._object = a10;
  String.append(_:)(v10);
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_13_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1;
  String.append(_:)(*(Swift::String *)&a1);
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

void OUTLINED_FUNCTION_21_0(uint64_t a1, unint64_t *a2)
{
  _sSo17NSKeyedUnarchiverCMaTm_0(0, a2);
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return swift_bridgeObjectRetain();
}

Swift::String __swiftcall Encodable.jsonPrettyPrinted()()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  Swift::String result;

  v0 = type metadata accessor for String.Encoding();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_0_3();
  if (one-time initialization token for iso8601PrettyPrinted != -1)
    swift_once();
  dispatch thunk of JSONEncoder.encode<A>(_:)();
  static String.Encoding.utf8.getter();
  v1 = String.init(data:encoding:)();
  if (v2)
  {
    v3 = v1;
    v4 = v2;
    OUTLINED_FUNCTION_8_1();
  }
  else
  {
    OUTLINED_FUNCTION_8_1();
    v3 = 0;
    v4 = 0xE000000000000000;
  }
  v5 = v3;
  v6 = (void *)v4;
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t static EntityProperty<>.== infix(_:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char v9;
  void (*v10)(char *, uint64_t);
  uint64_t v12;

  v2 = *(_QWORD *)(v1 + *MEMORY[0x24BDB5358]);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v12 - v7;
  EntityProperty.wrappedValue.getter();
  EntityProperty.wrappedValue.getter();
  v9 = dispatch thunk of static Equatable.== infix(_:_:)();
  v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v6, v2);
  v10(v8, v2);
  return v9 & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> EntityProperty<A>(uint64_t *a1)
{
  return static EntityProperty<>.== infix(_:_:)(*a1);
}

BOOL static EntityProperty<>.CodingKeys.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void EntityProperty<>.CodingKeys.hash(into:)(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_6_1(a1, a2);
}

uint64_t EntityProperty<>.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;

  v2 = a1 == 0x5664657070617277 && a2 == 0xEC00000065756C61;
  if (v2 || (OUTLINED_FUNCTION_1_0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_4_1();
    if ((a1 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t EntityProperty<>.CodingKeys.init(intValue:)()
{
  return 2;
}

void EntityProperty<>.CodingKeys.hashValue.getter()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_10_1();
  Hasher._finalize()();
  OUTLINED_FUNCTION_38();
}

uint64_t EntityProperty<>.CodingKeys.stringValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x656C746974;
  else
    return 0x5664657070617277;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance EntityProperty<A><>.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static EntityProperty<>.CodingKeys.== infix(_:_:)(*a1, *a2);
}

void protocol witness for Hashable.hashValue.getter in conformance EntityProperty<A><>.CodingKeys()
{
  EntityProperty<>.CodingKeys.hashValue.getter();
}

void protocol witness for Hashable.hash(into:) in conformance EntityProperty<A><>.CodingKeys(uint64_t a1)
{
  char *v1;

  EntityProperty<>.CodingKeys.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance EntityProperty<A><>.CodingKeys()
{
  char *v0;
  _BYTE v2[72];

  Hasher.init(_seed:)();
  EntityProperty<>.CodingKeys.hash(into:)((uint64_t)v2, *v0);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance EntityProperty<A><>.CodingKeys()
{
  char *v0;

  return EntityProperty<>.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance EntityProperty<A><>.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = EntityProperty<>.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance EntityProperty<A><>.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance EntityProperty<A><>.CodingKeys(uint64_t a1)
{
  MEMORY[0x2494F7A00](&protocol conformance descriptor for EntityProperty<A><>.CodingKeys, a1);
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance EntityProperty<A><>.CodingKeys(uint64_t a1)
{
  MEMORY[0x2494F7A00](&protocol conformance descriptor for EntityProperty<A><>.CodingKeys, a1);
  return CodingKey.debugDescription.getter();
}

uint64_t EntityProperty<>.encode(to:)(_QWORD *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;

  v28 = a2;
  v5 = *v2;
  v27 = type metadata accessor for LocalizedStringResource();
  v25 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_0_3();
  v26 = v7 - v6;
  v8 = (uint64_t *)(v5 + *MEMORY[0x24BDB5358]);
  v9 = *(_QWORD *)(*v8 - 8);
  v29 = *v8;
  v30 = v9;
  MEMORY[0x24BDAC7A8](v10);
  v13 = type metadata accessor for EntityProperty<>.CodingKeys(255, v12, *(_QWORD *)(v11 + 8), a2);
  MEMORY[0x2494F7A00](&protocol conformance descriptor for EntityProperty<A><>.CodingKeys, v13);
  v14 = type metadata accessor for KeyedEncodingContainer();
  v32 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v24 - v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  EntityProperty.wrappedValue.getter();
  v34 = 0;
  v17 = v31;
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  v18 = OUTLINED_FUNCTION_5_1();
  if (!v17)
  {
    v20(v18);
    v21 = v26;
    EntityProperty.title.getter();
    v33 = 1;
    lazy protocol witness table accessor for type LocalizedStringResource and conformance LocalizedStringResource(&lazy protocol witness table cache variable for type LocalizedStringResource and conformance LocalizedStringResource, (uint64_t (*)(uint64_t))MEMORY[0x24BDCD380], MEMORY[0x24BDCD390]);
    v22 = v27;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    v20 = *(void (**)(uint64_t))(v25 + 8);
    v18 = v21;
    v19 = v22;
  }
  ((void (*)(uint64_t, uint64_t))v20)(v18, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v16, v14);
}

BOOL static IntentFile.CodingKeys.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void IntentFile.CodingKeys.hash(into:)(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_6_1(a1, a2);
}

uint64_t IntentFile.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;

  v2 = a1 == 1635017060 && a2 == 0xE400000000000000;
  if (v2 || (OUTLINED_FUNCTION_1_0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656D616E656C6966 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_4_1();
    if ((a1 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t IntentFile.CodingKeys.init(intValue:)()
{
  return 2;
}

void IntentFile.CodingKeys.hashValue.getter()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_10_1();
  Hasher._finalize()();
  OUTLINED_FUNCTION_38();
}

uint64_t IntentFile.CodingKeys.stringValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x656D616E656C6966;
  else
    return 1635017060;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance IntentFile.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static IntentFile.CodingKeys.== infix(_:_:)(*a1, *a2);
}

void protocol witness for Hashable.hashValue.getter in conformance IntentFile.CodingKeys()
{
  IntentFile.CodingKeys.hashValue.getter();
}

void protocol witness for Hashable.hash(into:) in conformance IntentFile.CodingKeys(uint64_t a1)
{
  char *v1;

  IntentFile.CodingKeys.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance IntentFile.CodingKeys()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance IntentFile.CodingKeys()
{
  char *v0;

  return IntentFile.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance IntentFile.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = IntentFile.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance IntentFile.CodingKeys()
{
  lazy protocol witness table accessor for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance IntentFile.CodingKeys()
{
  lazy protocol witness table accessor for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t IntentFile.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<IntentFile.CodingKeys>);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_0_3();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v4 = IntentFile.data.getter();
  v6 = v5;
  lazy protocol witness table accessor for type Data and conformance Data();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  outlined consume of Data._Representation(v4, v6);
  if (v1)
    return OUTLINED_FUNCTION_8_0();
  IntentFile.filename.getter();
  KeyedEncodingContainer.encode(_:forKey:)();
  OUTLINED_FUNCTION_8_0();
  return swift_bridgeObjectRelease();
}

uint64_t one-time initialization function for shared()
{
  uint64_t result;

  type metadata accessor for JSONEncoder();
  swift_allocObject();
  result = JSONEncoder.init()();
  static JSONEncoder.shared = result;
  return result;
}

uint64_t *JSONEncoder.shared.unsafeMutableAddressor()
{
  if (one-time initialization token for shared != -1)
    swift_once();
  return &static JSONEncoder.shared;
}

uint64_t static JSONEncoder.shared.getter()
{
  return static JSONEncoder.shared.getter(&one-time initialization token for shared);
}

uint64_t one-time initialization function for iso8601()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  _QWORD v13[2];

  v0 = type metadata accessor for JSONEncoder.KeyEncodingStrategy();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for JSONEncoder.OutputFormatting();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCB2A8];
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for JSONEncoder.DateEncodingStrategy();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for JSONEncoder();
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BDCB358], v8);
  v13[1] = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type LocalizedStringResource and conformance LocalizedStringResource((unint64_t *)&lazy protocol witness table cache variable for type JSONEncoder.OutputFormatting and conformance JSONEncoder.OutputFormatting, v5, MEMORY[0x24BDCB2C8]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [JSONEncoder.OutputFormatting]);
  lazy protocol witness table accessor for type [JSONEncoder.OutputFormatting] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDCB2F0], v0);
  result = JSONEncoder.init(dateEncodingStrategy:outputFormatting:keyEncodingStrategy:)((uint64_t)v11, (uint64_t)v7, (uint64_t)v3);
  static JSONEncoder.iso8601 = result;
  return result;
}

uint64_t JSONEncoder.init(dateEncodingStrategy:outputFormatting:keyEncodingStrategy:)(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v22;

  v22 = type metadata accessor for JSONEncoder.KeyEncodingStrategy();
  v4 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0_3();
  v7 = v6 - v5;
  v8 = type metadata accessor for JSONEncoder.OutputFormatting();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0_3();
  v12 = v11 - v10;
  v13 = type metadata accessor for JSONEncoder.DateEncodingStrategy();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0_3();
  v17 = v16 - v15;
  v18 = dispatch thunk of JSONEncoder.__allocating_init()();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v17, a1, v13);
  swift_retain();
  dispatch thunk of JSONEncoder.dateEncodingStrategy.setter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v12, a2, v8);
  dispatch thunk of JSONEncoder.outputFormatting.setter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v7, a3, v22);
  dispatch thunk of JSONEncoder.keyEncodingStrategy.setter();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a3, v22);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a2, v8);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a1, v13);
  return v18;
}

uint64_t *JSONEncoder.iso8601.unsafeMutableAddressor()
{
  if (one-time initialization token for iso8601 != -1)
    swift_once();
  return &static JSONEncoder.iso8601;
}

uint64_t static JSONEncoder.iso8601.getter()
{
  return static JSONEncoder.shared.getter(&one-time initialization token for iso8601);
}

uint64_t one-time initialization function for iso8601PrettyPrinted()
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
  uint64_t result;

  v0 = type metadata accessor for JSONEncoder.KeyEncodingStrategy();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0_3();
  v4 = v3 - v2;
  type metadata accessor for JSONEncoder.OutputFormatting();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0_3();
  v7 = v6 - v5;
  v8 = type metadata accessor for JSONEncoder.DateEncodingStrategy();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0_3();
  v12 = v11 - v10;
  type metadata accessor for JSONEncoder();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 104))(v12, *MEMORY[0x24BDCB358], v8);
  static JSONEncoder.OutputFormatting.prettyPrinted.getter();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BDCB2F0], v0);
  result = JSONEncoder.init(dateEncodingStrategy:outputFormatting:keyEncodingStrategy:)(v12, v7, v4);
  static JSONEncoder.iso8601PrettyPrinted = result;
  return result;
}

uint64_t *JSONEncoder.iso8601PrettyPrinted.unsafeMutableAddressor()
{
  if (one-time initialization token for iso8601PrettyPrinted != -1)
    swift_once();
  return &static JSONEncoder.iso8601PrettyPrinted;
}

uint64_t type metadata accessor for EntityProperty<>.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for EntityProperty<>.CodingKeys);
}

unint64_t lazy protocol witness table accessor for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys;
  if (!lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for IntentFile.CodingKeys, &type metadata for IntentFile.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys;
  if (!lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for IntentFile.CodingKeys, &type metadata for IntentFile.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys;
  if (!lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for IntentFile.CodingKeys, &type metadata for IntentFile.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys;
  if (!lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for IntentFile.CodingKeys, &type metadata for IntentFile.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type IntentFile.CodingKeys and conformance IntentFile.CodingKeys);
  }
  return result;
}

uint64_t static JSONEncoder.iso8601PrettyPrinted.getter()
{
  return static JSONEncoder.shared.getter(&one-time initialization token for iso8601PrettyPrinted);
}

uint64_t static JSONEncoder.shared.getter(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  return swift_retain();
}

void base witness table accessor for Equatable in EntityProperty<A><>.CodingKeys()
{
  JUMPOUT(0x2494F7A00);
}

void base witness table accessor for CustomDebugStringConvertible in EntityProperty<A><>.CodingKeys()
{
  JUMPOUT(0x2494F7A00);
}

void base witness table accessor for CustomStringConvertible in EntityProperty<A><>.CodingKeys()
{
  JUMPOUT(0x2494F7A00);
}

uint64_t type metadata instantiation function for EntityProperty<>.CodingKeys()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t storeEnumTagSinglePayload for EntityProperty<>.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2433A3DF8 + 4 * byte_2433AA1AD[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2433A3E2C + 4 * byte_2433AA1A8[v4]))();
}

uint64_t sub_2433A3E2C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2433A3E34(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2433A3E3CLL);
  return result;
}

uint64_t sub_2433A3E48(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2433A3E50);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2433A3E54(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2433A3E5C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IntentFile.CodingKeys()
{
  return &type metadata for IntentFile.CodingKeys;
}

uint64_t lazy protocol witness table accessor for type LocalizedStringResource and conformance LocalizedStringResource(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2494F7A00](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2494F79AC](a1, v6, a5);
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return Hasher.init(_seed:)();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_6_1(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  unint64_t v0;
  uint64_t v1;

  return outlined consume of Data._Representation(v1, v0);
}

void OUTLINED_FUNCTION_10_1()
{
  char v0;

  Hasher._combine(_:)(v0 & 1);
}

uint64_t specialized == infix<A>(_:_:)(char a1, char a2)
{
  uint64_t v2;
  char v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  unint64_t v8;
  unint64_t v9;
  char v11;

  v2 = 1701736302;
  if (a1)
  {
    OUTLINED_FUNCTION_14_1();
    if (v3)
      v5 = 0x7473726966;
    else
      v5 = 1953718636;
    if (v3)
      v6 = v4;
    else
      v6 = 0xE400000000000000;
  }
  else
  {
    v6 = 0xE400000000000000;
    v5 = 1701736302;
  }
  if (a2)
  {
    OUTLINED_FUNCTION_14_1();
    if (v7)
      v2 = 0x7473726966;
    else
      v2 = 1953718636;
    if (v7)
      v9 = v8;
    else
      v9 = 0xE400000000000000;
  }
  else
  {
    v9 = 0xE400000000000000;
  }
  if (v5 == v2 && v6 == v9)
    v11 = 1;
  else
    v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t specialized == infix<A>(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = SearchResultType.rawValue.getter();
  v2 = v1;
  if (v0 == SearchResultType.rawValue.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

Swift::Int specialized RawRepresentable<>.hashValue.getter(char a1)
{
  return specialized RawRepresentable<>._rawHashValue(seed:)(0, a1);
}

Swift::Int specialized RawRepresentable<>.hashValue.getter()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t specialized RawRepresentable<>.hash(into:)(uint64_t a1, char a2)
{
  if (a2)
    OUTLINED_FUNCTION_14_1();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  SearchResultType.rawValue.getter();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  Hasher.init(_seed:)();
  SearchResultType.rawValue.getter();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, char a2)
{
  Hasher.init(_seed:)();
  if (a2)
    OUTLINED_FUNCTION_14_1();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

void static SearchResultType.typeDisplayRepresentation.getter(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (one-time initialization token for typeDisplayRepresentation != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_190();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static SearchResultType.typeDisplayRepresentation);
  OUTLINED_FUNCTION_12_1();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
  OUTLINED_FUNCTION_152();
}

void static SearchResultType.typeDisplayRepresentation.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (one-time initialization token for typeDisplayRepresentation != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_190();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static SearchResultType.typeDisplayRepresentation);
  OUTLINED_FUNCTION_12_1();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
  OUTLINED_FUNCTION_152();
}

uint64_t (*static SearchResultType.typeDisplayRepresentation.modify())()
{
  uint64_t v0;

  if (one-time initialization token for typeDisplayRepresentation != -1)
    swift_once();
  v0 = OUTLINED_FUNCTION_190();
  __swift_project_value_buffer(v0, (uint64_t)static SearchResultType.typeDisplayRepresentation);
  OUTLINED_FUNCTION_12_1();
  return static SearchGlobalEntity.typeDisplayRepresentation.modify;
}

uint64_t static SearchResultType.caseDisplayRepresentations.getter()
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
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  _BYTE *v17;
  _BYTE *v18;
  _BYTE *v19;
  _BYTE *v20;
  _BYTE *v21;
  _BYTE *v22;
  _BYTE *v23;
  _BYTE *v24;
  _BYTE *v25;
  uint64_t v27;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DisplayRepresentation.Image?);
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_0_3();
  v3 = v2 - v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LocalizedStringResource?);
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_0_3();
  v7 = v6 - v5;
  v8 = type metadata accessor for LocalizedStringResource();
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_0_3();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(SearchResultType, DisplayRepresentation)>);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (SearchResultType, DisplayRepresentation))
                  - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_2433AA420;
  v13 = v27 + v12;
  *(_BYTE *)(v27 + v12) = 0;
  LocalizedStringResource.init(stringLiteral:)();
  __swift_storeEnumTagSinglePayload(v7, 1, 1, v8);
  v14 = type metadata accessor for DisplayRepresentation.Image();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v14);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_2();
  *v15 = 1;
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5_2(v16);
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5_2(v17);
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5_2(v18);
  LocalizedStringResource.init(stringLiteral:)();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5_2(v19);
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_2(6);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5_2(v20);
  LocalizedStringResource.init(stringLiteral:)();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5_2(v21);
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5_2(v22);
  OUTLINED_FUNCTION_11_1();
  LocalizedStringResource.init(stringLiteral:)();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_2(10);
  OUTLINED_FUNCTION_11_1();
  LocalizedStringResource.init(stringLiteral:)();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_2(11);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_2(12);
  LocalizedStringResource.init(stringLiteral:)();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_2(13);
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_2(14);
  LocalizedStringResource.init(stringLiteral:)();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5_2(v23);
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5_2(v24);
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2();
  *v25 = 17;
  LocalizedStringResource.init(stringLiteral:)();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_2(18);
  LocalizedStringResource.init(stringLiteral:)();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_2(19);
  LocalizedStringResource.init(stringLiteral:)();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_2(20);
  LocalizedStringResource.init(stringLiteral:)();
  OUTLINED_FUNCTION_0_4();
  *(_BYTE *)(v13 + 21 * v11) = 21;
  LocalizedStringResource.init(stringLiteral:)();
  __swift_storeEnumTagSinglePayload(v7, 1, 1, v8);
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v14);
  OUTLINED_FUNCTION_1_1();
  type metadata accessor for DisplayRepresentation();
  lazy protocol witness table accessor for type SearchResultType and conformance SearchResultType();
  return Dictionary.init(dictionaryLiteral:)();
}

unint64_t lazy protocol witness table accessor for type SearchResultType and conformance SearchResultType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchResultType, &type metadata for SearchResultType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchResultType, &type metadata for SearchResultType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchResultType, &type metadata for SearchResultType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchResultType, &type metadata for SearchResultType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchResultType, &type metadata for SearchResultType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchResultType, &type metadata for SearchResultType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchResultType, &type metadata for SearchResultType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchResultType, &type metadata for SearchResultType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchResultType, &type metadata for SearchResultType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchResultType, &type metadata for SearchResultType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchResultType, &type metadata for SearchResultType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType;
  if (!lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchResultType, &type metadata for SearchResultType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchResultType and conformance SearchResultType);
  }
  return result;
}

OmniSearchTypes::SearchResultType_optional __swiftcall SearchResultType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  OmniSearchTypes::SearchResultType_optional result;
  char v5;
  char v6;

  v2 = v1;
  v3 = _findStringSwitchCaseWithCache(cases:string:cache:)();
  result.value = swift_bridgeObjectRelease();
  v5 = 0;
  v6 = 4;
  switch(v3)
  {
    case 0:
      goto LABEL_6;
    case 1:
      v5 = 1;
      goto LABEL_6;
    case 2:
      v5 = 2;
      goto LABEL_6;
    case 3:
      v5 = 3;
LABEL_6:
      v6 = v5;
      break;
    case 4:
      break;
    case 5:
      v6 = 5;
      break;
    case 6:
      v6 = 6;
      break;
    case 7:
      v6 = 7;
      break;
    case 8:
      v6 = 8;
      break;
    case 9:
      v6 = 9;
      break;
    case 10:
      v6 = 10;
      break;
    case 11:
      v6 = 11;
      break;
    case 12:
      v6 = 12;
      break;
    case 13:
      v6 = 13;
      break;
    case 14:
      v6 = 14;
      break;
    case 15:
      v6 = 15;
      break;
    case 16:
      v6 = 16;
      break;
    case 17:
      v6 = 17;
      break;
    case 18:
      v6 = 18;
      break;
    case 19:
      v6 = 19;
      break;
    case 20:
      v6 = 20;
      break;
    case 21:
      v6 = 21;
      break;
    default:
      v6 = 22;
      break;
  }
  *v2 = v6;
  return result;
}

void *static SearchResultType.allCases.getter()
{
  return &outlined read-only object #0 of static SearchResultType.allCases.getter;
}

uint64_t SearchResultType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2433A4BA0 + 4 * byte_2433AA446[*v0]))(0x6567616D69, 0xE500000000000000);
}

uint64_t sub_2433A4BA0()
{
  return 1701603686;
}

uint64_t sub_2433A4BB0()
{
  return 1818845549;
}

uint64_t sub_2433A4BC0()
{
  return 0x6567617373656DLL;
}

uint64_t sub_2433A4BD8()
{
  return 0x7261646E656C6163;
}

uint64_t sub_2433A4BF0()
{
  return 1702129518;
}

unint64_t sub_2433A4C00()
{
  return 0xD000000000000011;
}

uint64_t sub_2433A4CA4()
{
  return 7300455;
}

uint64_t sub_2433A4CB4()
{
  return 0x6567616D49626577;
}

uint64_t sub_2433A4CCC()
{
  return 0x6577736E41626577;
}

uint64_t sub_2433A4CEC()
{
  return 0x6764656C776F6E6BLL;
}

uint64_t sub_2433A4D08()
{
  return 0x636972656E6567;
}

uint64_t sub_2433A4D20()
{
  return 0x7469746E45707061;
}

uint64_t sub_2433A4D40()
{
  return 0x6C61626F6C67;
}

uint64_t sub_2433A4D54()
{
  return 0x6867696C746F7073;
}

uint64_t sub_2433A4D74()
{
  return 0x726577736E61;
}

uint64_t sub_2433A4D88()
{
  return 0x6946746E65746E69;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance SearchResultType()
{
  return specialized == infix<A>(_:_:)();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SearchResultType()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance SearchResultType()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SearchResultType()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

OmniSearchTypes::SearchResultType_optional protocol witness for RawRepresentable.init(rawValue:) in conformance SearchResultType(Swift::String *a1)
{
  return SearchResultType.init(rawValue:)(*a1);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance SearchResultType@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = SearchResultType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t lazy protocol witness table accessor for type [SearchResultType] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [SearchResultType] and conformance [A];
  if (!lazy protocol witness table cache variable for type [SearchResultType] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [SearchResultType]);
    result = MEMORY[0x2494F7A00](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [SearchResultType] and conformance [A]);
  }
  return result;
}

void protocol witness for static CaseIterable.allCases.getter in conformance SearchResultType(_QWORD *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static SearchResultType.allCases.getter;
}

uint64_t associated type witness table accessor for RawRepresentable.RawValue : LosslessStringConvertible in SearchResultType()
{
  return MEMORY[0x24BEE0D78];
}

uint64_t associated type witness table accessor for _IntentValue.Specification : ResolverSpecification in SearchResultType()
{
  lazy protocol witness table accessor for type SearchResultType and conformance SearchResultType();
  return swift_getOpaqueTypeConformance2();
}

uint64_t protocol witness for static _IntentValue.defaultResolverSpecification.getter in conformance SearchResultType()
{
  lazy protocol witness table accessor for type SearchResultType and conformance SearchResultType();
  return static AppEnum.defaultResolverSpecification.getter();
}

uint64_t protocol witness for CustomLocalizedStringResourceConvertible.localizedStringResource.getter in conformance SearchResultType()
{
  lazy protocol witness table accessor for type SearchResultType and conformance SearchResultType();
  return CaseDisplayRepresentable.localizedStringResource.getter();
}

uint64_t getEnumTagSinglePayload for SearchResultType(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xEB)
  {
    if (a2 + 21 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 21) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 22;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x16;
  v5 = v6 - 22;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SearchResultType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 21 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 21) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEA)
    return ((uint64_t (*)(void))((char *)&loc_2433A52A8 + 4 * byte_2433AA461[v4]))();
  *a1 = a2 + 21;
  return ((uint64_t (*)(void))((char *)sub_2433A52DC + 4 * byte_2433AA45C[v4]))();
}

uint64_t sub_2433A52DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2433A52E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2433A52ECLL);
  return result;
}

uint64_t sub_2433A52F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2433A5300);
  *(_BYTE *)result = a2 + 21;
  return result;
}

uint64_t sub_2433A5304(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2433A530C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SearchResultType()
{
  return &type metadata for SearchResultType;
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  __swift_storeEnumTagSinglePayload(v1, 1, 1, v2);
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v3);
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

void OUTLINED_FUNCTION_2_2(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v2 + v1 * a1) = a1;
}

void OUTLINED_FUNCTION_4_2(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v2 + v1 * a1) = a1;
}

void OUTLINED_FUNCTION_5_2(_BYTE *a1@<X8>)
{
  char v1;

  *a1 = v1;
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return 0x20746E6174736E49;
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t UTType.searchToolExportedExperiences.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for searchToolExportedExperiences != -1)
    swift_once();
  v0 = OUTLINED_FUNCTION_0_5();
  return __swift_project_value_buffer(v0, (uint64_t)static UTType.searchToolExportedExperiences);
}

uint64_t static ExperienceProviding<>.experienceTransferableRepresentation()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;

  v6 = OUTLINED_FUNCTION_0_5();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for searchToolExportedExperiences != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v6, (uint64_t)static UTType.searchToolExportedExperiences);
  OUTLINED_FUNCTION_12_1();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a1;
  v11[3] = a2;
  v11[4] = a3;
  return DataRepresentation.init(exportedContentType:exporting:)();
}

BOOL static SearchTransferabilityError.Code.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void SearchTransferabilityError.Code.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int SearchTransferabilityError.Code.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void SearchTransferabilityError.code.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

void SearchTransferabilityError.sourceResultType.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 1);
}

uint64_t SearchTransferabilityError.targetTransferType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_4_3() + 24);
  v4 = OUTLINED_FUNCTION_0_5();
  return OUTLINED_FUNCTION_2_3(a1, v3, v4, *(uint64_t (**)(void))(*(_QWORD *)(v4 - 8) + 16));
}

uint64_t SearchTransferabilityError.init(code:sourceResultType:targetTransferType:)@<X0>(_BYTE *a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, _BYTE *a4@<X8>)
{
  char v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *a2;
  *a4 = *a1;
  a4[1] = v5;
  v6 = (uint64_t)&a4[*(int *)(OUTLINED_FUNCTION_4_3() + 24)];
  v7 = OUTLINED_FUNCTION_0_5();
  return OUTLINED_FUNCTION_2_3(v6, a3, v7, *(uint64_t (**)(void))(*(_QWORD *)(v7 - 8) + 32));
}

void one-time initialization function for searchToolExportedExperiences()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UTType?);
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)&v3 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = OUTLINED_FUNCTION_0_5();
  __swift_allocate_value_buffer(v2, static UTType.searchToolExportedExperiences);
  __swift_project_value_buffer(v2, (uint64_t)static UTType.searchToolExportedExperiences);
  static UTType.data.getter();
  __swift_storeEnumTagSinglePayload((uint64_t)v1, 0, 1, v2);
  UTType.init(exportedAs:conformingTo:)();
  OUTLINED_FUNCTION_1();
}

void static UTType.searchToolExportedExperiences.getter(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (one-time initialization token for searchToolExportedExperiences != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_0_5();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static UTType.searchToolExportedExperiences);
  OUTLINED_FUNCTION_12_1();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
  OUTLINED_FUNCTION_152();
}

void static UTType.searchToolExportedExperiences.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (one-time initialization token for searchToolExportedExperiences != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_0_5();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static UTType.searchToolExportedExperiences);
  OUTLINED_FUNCTION_12_1();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
  OUTLINED_FUNCTION_152();
}

uint64_t (*static UTType.searchToolExportedExperiences.modify())()
{
  uint64_t v0;

  if (one-time initialization token for searchToolExportedExperiences != -1)
    swift_once();
  v0 = OUTLINED_FUNCTION_0_5();
  __swift_project_value_buffer(v0, (uint64_t)static UTType.searchToolExportedExperiences);
  OUTLINED_FUNCTION_12_1();
  return static SearchGlobalEntity.typeDisplayRepresentation.modify;
}

uint64_t closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[6] = a2;
  v4[7] = a4;
  v4[5] = a1;
  v5 = type metadata accessor for UTType();
  v4[8] = v5;
  v4[9] = *(_QWORD *)(v5 - 8);
  v4[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentFile?);
  v4[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int EnumTagSinglePayload;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(_QWORD *)(v0 + 88);
  (*(void (**)(_QWORD))(*(_QWORD *)(v0 + 56) + 16))(*(_QWORD *)(v0 + 48));
  v2 = type metadata accessor for IntentFile();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v2);
  v4 = *(_QWORD *)(v0 + 88);
  if (EnumTagSinglePayload == 1)
  {
    v6 = *(_QWORD *)(v0 + 48);
    v5 = *(_QWORD *)(v0 + 56);
    outlined destroy of IntentFile?(*(_QWORD *)(v0 + 88));
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v5 + 8))(&v18, v6, v5);
    v7 = v18;
    if (one-time initialization token for searchToolExportedExperiences != -1)
      swift_once();
    v8 = *(_QWORD *)(v0 + 80);
    v9 = *(_QWORD *)(v0 + 64);
    v10 = *(_QWORD *)(v0 + 72);
    v11 = __swift_project_value_buffer(v9, (uint64_t)static UTType.searchToolExportedExperiences);
    OUTLINED_FUNCTION_12_1();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, v11, v9);
    v12 = OUTLINED_FUNCTION_4_3();
    lazy protocol witness table accessor for type SearchTransferabilityError and conformance SearchTransferabilityError();
    swift_allocError();
    *v13 = 0;
    v13[1] = v7;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v10 + 32))(&v13[*(int *)(v12 + 24)], v8, v9);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v15 = IntentFile.data.getter();
    v17 = v16;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v4, v2);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v15, v17);
  }
}

uint64_t sub_2433A5B70()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation()(uint64_t a1)
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
  v7[1] = partial apply for closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation();
  return closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation()(a1, v4, v5, v6);
}

uint64_t partial apply for closure #1 in static ExperienceProviding<>.experienceTransferableRepresentation()(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t type metadata accessor for SearchTransferabilityError()
{
  uint64_t result;

  result = type metadata singleton initialization cache for SearchTransferabilityError;
  if (!type metadata singleton initialization cache for SearchTransferabilityError)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t lazy protocol witness table accessor for type SearchTransferabilityError.Code and conformance SearchTransferabilityError.Code()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SearchTransferabilityError.Code and conformance SearchTransferabilityError.Code;
  if (!lazy protocol witness table cache variable for type SearchTransferabilityError.Code and conformance SearchTransferabilityError.Code)
  {
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchTransferabilityError.Code, &type metadata for SearchTransferabilityError.Code);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchTransferabilityError.Code and conformance SearchTransferabilityError.Code);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for SearchTransferabilityError(_BYTE *a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *(_BYTE *)a2;
    a1[1] = *((_BYTE *)a2 + 1);
    v5 = *(int *)(a3 + 24);
    v6 = &a1[v5];
    v7 = (uint64_t)a2 + v5;
    v8 = type metadata accessor for UTType();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t destroy for SearchTransferabilityError(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 24);
  v3 = type metadata accessor for UTType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_BYTE *initializeWithCopy for SearchTransferabilityError(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  v4 = *(int *)(a3 + 24);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = type metadata accessor for UTType();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_BYTE *assignWithCopy for SearchTransferabilityError(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  v4 = *(int *)(a3 + 24);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = type metadata accessor for UTType();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_BYTE *initializeWithTake for SearchTransferabilityError(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  v4 = *(int *)(a3 + 24);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = type metadata accessor for UTType();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_BYTE *assignWithTake for SearchTransferabilityError(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  v4 = *(int *)(a3 + 24);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = type metadata accessor for UTType();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchTransferabilityError()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2433A5F24(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  uint64_t v8;

  if ((_DWORD)a2 == 254)
  {
    v4 = *a1;
    if (v4 >= 2)
      return v4 - 1;
    else
      return 0;
  }
  else
  {
    v8 = OUTLINED_FUNCTION_0_5();
    return __swift_getEnumTagSinglePayload((uint64_t)&a1[*(int *)(a3 + 24)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for SearchTransferabilityError()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_2433A5F98(_BYTE *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 254)
  {
    *a1 = a2 + 1;
    OUTLINED_FUNCTION_1();
  }
  else
  {
    v7 = OUTLINED_FUNCTION_0_5();
    __swift_storeEnumTagSinglePayload((uint64_t)&a1[*(int *)(a4 + 24)], a2, a2, v7);
  }
}

uint64_t type metadata completion function for SearchTransferabilityError()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UTType();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SearchTransferabilityError.Code(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2433A60BC + 4 * byte_2433AA775[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2433A60F0 + 4 * byte_2433AA770[v4]))();
}

uint64_t sub_2433A60F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2433A60F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2433A6100);
  return result;
}

uint64_t sub_2433A610C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2433A6114);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2433A6118(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2433A6120(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SearchTransferabilityError.Code()
{
  return &type metadata for SearchTransferabilityError.Code;
}

uint64_t outlined destroy of IntentFile?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentFile?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t lazy protocol witness table accessor for type SearchTransferabilityError and conformance SearchTransferabilityError()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type SearchTransferabilityError and conformance SearchTransferabilityError;
  if (!lazy protocol witness table cache variable for type SearchTransferabilityError and conformance SearchTransferabilityError)
  {
    v1 = type metadata accessor for SearchTransferabilityError();
    result = MEMORY[0x2494F7A00](&protocol conformance descriptor for SearchTransferabilityError, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchTransferabilityError and conformance SearchTransferabilityError);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return type metadata accessor for UTType();
}

uint64_t OUTLINED_FUNCTION_2_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return type metadata accessor for SearchTransferabilityError();
}

uint64_t static AppEnum.defaultResolverSpecification.getter()
{
  return MEMORY[0x24BDB4D88]();
}

uint64_t static AppEntity.defaultResolverSpecification.getter()
{
  return MEMORY[0x24BDB4DB8]();
}

uint64_t IntentFile.data.getter()
{
  return MEMORY[0x24BDB4EE8]();
}

uint64_t IntentFile.filename.getter()
{
  return MEMORY[0x24BDB4F10]();
}

uint64_t type metadata accessor for IntentFile()
{
  return MEMORY[0x24BDB4F20]();
}

uint64_t EntityQuery.suggestedEntities()()
{
  return MEMORY[0x24BDB4F88]();
}

uint64_t EntityQuery.results()()
{
  return MEMORY[0x24BDB4F98]();
}

uint64_t EntityProperty.wrappedValue.modify()
{
  return MEMORY[0x24BDB52C8]();
}

uint64_t EntityProperty.wrappedValue.getter()
{
  return MEMORY[0x24BDB52D0]();
}

uint64_t EntityProperty.wrappedValue.setter()
{
  return MEMORY[0x24BDB52D8]();
}

uint64_t EntityProperty.projectedValue.getter()
{
  return MEMORY[0x24BDB52E0]();
}

uint64_t EntityProperty.title.getter()
{
  return MEMORY[0x24BDB52E8]();
}

uint64_t EntityProperty<>.init(title:)()
{
  return MEMORY[0x24BDB5300]();
}

{
  return MEMORY[0x24BDB5328]();
}

uint64_t type metadata accessor for DisplayRepresentation.Image()
{
  return MEMORY[0x24BDB5DB0]();
}

uint64_t DisplayRepresentation.init(title:subtitle:image:)()
{
  return MEMORY[0x24BDB5DD8]();
}

uint64_t type metadata accessor for DisplayRepresentation()
{
  return MEMORY[0x24BDB5DF0]();
}

uint64_t DynamicOptionsProvider.defaultResult()()
{
  return MEMORY[0x24BDB5EF0]();
}

uint64_t static DynamicOptionsProvider.useForParameterResolution.getter()
{
  return MEMORY[0x24BDB5F00]();
}

uint64_t CaseDisplayRepresentable.localizedStringResource.getter()
{
  return MEMORY[0x24BDB6150]();
}

uint64_t static PersistentlyIdentifiable.persistentIdentifier.getter()
{
  return MEMORY[0x24BDB6168]();
}

uint64_t TypeDisplayRepresentation.init(name:numericFormat:)()
{
  return MEMORY[0x24BDB61F8]();
}

uint64_t type metadata accessor for TypeDisplayRepresentation()
{
  return MEMORY[0x24BDB6200]();
}

uint64_t InstanceDisplayRepresentable.localizedStringResource.getter()
{
  return MEMORY[0x24BDB63B0]();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t static JSONEncoder.OutputFormatting.prettyPrinted.getter()
{
  return MEMORY[0x24BDCB290]();
}

uint64_t type metadata accessor for JSONEncoder.OutputFormatting()
{
  return MEMORY[0x24BDCB2A8]();
}

uint64_t dispatch thunk of JSONEncoder.outputFormatting.setter()
{
  return MEMORY[0x24BDCB2E0]();
}

uint64_t type metadata accessor for JSONEncoder.KeyEncodingStrategy()
{
  return MEMORY[0x24BDCB300]();
}

uint64_t dispatch thunk of JSONEncoder.keyEncodingStrategy.setter()
{
  return MEMORY[0x24BDCB318]();
}

uint64_t type metadata accessor for JSONEncoder.DateEncodingStrategy()
{
  return MEMORY[0x24BDCB360]();
}

uint64_t dispatch thunk of JSONEncoder.dateEncodingStrategy.setter()
{
  return MEMORY[0x24BDCB378]();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t dispatch thunk of JSONEncoder.__allocating_init()()
{
  return MEMORY[0x24BDCB3F8]();
}

uint64_t JSONEncoder.init()()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t static CharacterSet.uppercaseLetters.getter()
{
  return MEMORY[0x24BDCB678]();
}

uint64_t CharacterSet.contains(_:)()
{
  return MEMORY[0x24BDCB710]();
}

uint64_t type metadata accessor for CharacterSet()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t LocalizedStringResource.init(stringLiteral:)()
{
  return MEMORY[0x24BDCD320]();
}

uint64_t LocalizedStringResource.init(stringInterpolation:)()
{
  return MEMORY[0x24BDCD348]();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t static Data.== infix(_:_:)()
{
  return MEMORY[0x24BDCDCC8]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntity.hasMetadata.getter()
{
  return MEMORY[0x24BE70410]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntity.hasSearchID.getter()
{
  return MEMORY[0x24BE70418]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntity.type.getter()
{
  return MEMORY[0x24BE70428]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntity.metadata.getter()
{
  return MEMORY[0x24BE70430]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntity.searchID.getter()
{
  return MEMORY[0x24BE70438]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntity()
{
  return MEMORY[0x24BE70440]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Timestamp.seconds.getter()
{
  return MEMORY[0x24BE704A0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Timestamp.timezone.getter()
{
  return MEMORY[0x24BE704A8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Timestamp.utcOffset.getter()
{
  return MEMORY[0x24BE704B0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_Timestamp()
{
  return MEMORY[0x24BE704B8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Temperature.units.getter()
{
  return MEMORY[0x24BE705E0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Temperature.value.getter()
{
  return MEMORY[0x24BE705E8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_Temperature()
{
  return MEMORY[0x24BE705F0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityType()
{
  return MEMORY[0x24BE70830]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasAppAttribute.getter()
{
  return MEMORY[0x24BE70A98]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.appAttribute.getter()
{
  return MEMORY[0x24BE70AA0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.idAttributes.getter()
{
  return MEMORY[0x24BE70AA8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.eventAttributes.getter()
{
  return MEMORY[0x24BE70AB0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasIDAttributes.getter()
{
  return MEMORY[0x24BE70AB8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.placeAttributes.getter()
{
  return MEMORY[0x24BE70AC0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.contactAttribute.getter()
{
  return MEMORY[0x24BE70AC8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.customAttributes.getter()
{
  return MEMORY[0x24BE70AD0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.generalAttributes.getter()
{
  return MEMORY[0x24BE70AD8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasEventAttributes.getter()
{
  return MEMORY[0x24BE70AE0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasPlaceAttributes.getter()
{
  return MEMORY[0x24BE70AE8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasContactAttribute.getter()
{
  return MEMORY[0x24BE70AF0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityMetadata.hasGeneralAttributes.getter()
{
  return MEMORY[0x24BE70AF8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityMetadata()
{
  return MEMORY[0x24BE70B00]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityIDAttributes.muid.getter()
{
  return MEMORY[0x24BE70ED8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityIDAttributes.umcID.getter()
{
  return MEMORY[0x24BE70EE0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityIDAttributes()
{
  return MEMORY[0x24BE70EE8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute.OneOf_Value()
{
  return MEMORY[0x24BE710E8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute.value.getter()
{
  return MEMORY[0x24BE710F8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityCustomAttribute()
{
  return MEMORY[0x24BE71100]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityEventAttributes.allDay.getter()
{
  return MEMORY[0x24BE71108]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityEventAttributes.endDate.getter()
{
  return MEMORY[0x24BE71110]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityEventAttributes.startDate.getter()
{
  return MEMORY[0x24BE71118]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityEventAttributes()
{
  return MEMORY[0x24BE71120]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.subLocality.getter()
{
  return MEMORY[0x24BE71128]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.thoroughfare.getter()
{
  return MEMORY[0x24BE71130]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.postalAddress.getter()
{
  return MEMORY[0x24BE71138]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.isoCountryCode.getter()
{
  return MEMORY[0x24BE71140]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.subThoroughfare.getter()
{
  return MEMORY[0x24BE71148]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.administrativeArea.getter()
{
  return MEMORY[0x24BE71150]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.subAdministrativeArea.getter()
{
  return MEMORY[0x24BE71158]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.name.getter()
{
  return MEMORY[0x24BE71160]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.country.getter()
{
  return MEMORY[0x24BE71168]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.latitude.getter()
{
  return MEMORY[0x24BE71170]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.locality.getter()
{
  return MEMORY[0x24BE71178]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes.longitude.getter()
{
  return MEMORY[0x24BE71180]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityPlaceAttributes()
{
  return MEMORY[0x24BE71188]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityContactAttributes.imessageID.getter()
{
  return MEMORY[0x24BE711A0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityContactAttributes.imessageURL.getter()
{
  return MEMORY[0x24BE711A8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityContactAttributes.phoneNumber.getter()
{
  return MEMORY[0x24BE711B0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityContactAttributes.email.getter()
{
  return MEMORY[0x24BE711B8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityContactAttributes()
{
  return MEMORY[0x24BE711C0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.contentURL.getter()
{
  return MEMORY[0x24BE711C8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.displayName.getter()
{
  return MEMORY[0x24BE711D0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.thumbnailData.getter()
{
  return MEMORY[0x24BE711D8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.alternateNames.getter()
{
  return MEMORY[0x24BE711E0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.hasThumbnailData.getter()
{
  return MEMORY[0x24BE711E8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes.title.getter()
{
  return MEMORY[0x24BE711F0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityGeneralAttributes()
{
  return MEMORY[0x24BE711F8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppEntityAppstoreAttributes.adamID.getter()
{
  return MEMORY[0x24BE71258]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppEntityAppstoreAttributes()
{
  return MEMORY[0x24BE71260]();
}

uint64_t DataRepresentation.init(exportedContentType:exporting:)()
{
  return MEMORY[0x24BDC5038]();
}

uint64_t type metadata accessor for Google_Protobuf_Any()
{
  return MEMORY[0x24BE5BDE8]();
}

uint64_t Message.serializedData(partial:)()
{
  return MEMORY[0x24BE5C1C0]();
}

uint64_t type metadata accessor for Experience()
{
  return MEMORY[0x24BE94680]();
}

uint64_t UTType.init(exportedAs:conformingTo:)()
{
  return MEMORY[0x24BEE6188]();
}

uint64_t UTType.identifier.getter()
{
  return MEMORY[0x24BEE6190]();
}

uint64_t static UTType.data.getter()
{
  return MEMORY[0x24BEE62A8]();
}

uint64_t type metadata accessor for UTType()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x24BEE0980]();
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
  MEMORY[0x24BDCF910](a1._countAndFlagsBits, a1._object);
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
  MEMORY[0x24BDCF930](a1._countAndFlagsBits, a1._object);
}

uint64_t String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return MEMORY[0x24BDCF938]();
}

uint64_t type metadata accessor for String.LocalizationValue.StringInterpolation()
{
  return MEMORY[0x24BDCF948]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t String.init(data:encoding:)()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t String.UnicodeScalarView._foreignIndex(after:)()
{
  return MEMORY[0x24BEE0A80]();
}

uint64_t String.UnicodeScalarView._foreignIndex(before:)()
{
  return MEMORY[0x24BEE0A88]();
}

uint64_t String.UnicodeScalarView.subscript.getter()
{
  return MEMORY[0x24BEE0AC0]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x24BEE0B80]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x24BEE1080]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject(ofClasses:from:)()
{
  return MEMORY[0x24BDCFFB8]();
}

uint64_t _NSRange.description.getter()
{
  return MEMORY[0x24BDD0260]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t _StringGuts.foreignScalarAlign(_:)()
{
  return MEMORY[0x24BEE2500]();
}

uint64_t _StringGuts.foreignErrorCorrectedScalar(startingAt:)()
{
  return MEMORY[0x24BEE2508]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t _decodeScalar(_:startingAt:)()
{
  return MEMORY[0x24BEE2840]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x24BEE3290](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE32D8]();
}

{
  return MEMORY[0x24BEE32E0]();
}

{
  return MEMORY[0x24BEE32E8]();
}

{
  return MEMORY[0x24BEE3328]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x24BEE3350]();
}

{
  return MEMORY[0x24BEE3358]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE3428]();
}

{
  return MEMORY[0x24BEE3430]();
}

{
  return MEMORY[0x24BEE3438]();
}

{
  return MEMORY[0x24BEE3470]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x24BEE34A0]();
}

{
  return MEMORY[0x24BEE34A8]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t type metadata accessor for KeyedEncodingContainer()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return MEMORY[0x24BEE3D50]();
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

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x24BEE4A10]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

