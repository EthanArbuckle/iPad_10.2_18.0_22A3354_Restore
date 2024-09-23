uint64_t OSLogStore.PrivateIterator.next()(void *a1)
{
  uint64_t v2;
  _OWORD v3[2];
  __int128 v4;
  uint64_t v5;
  __int128 v6;

  if (objc_msgSend(a1, sel_nextObject))
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  outlined init with take of Any?((uint64_t)v3, (uint64_t)&v4);
  if (v5)
  {
    outlined init with take of Any(&v4, &v6);
    type metadata accessor for OSLogEntry();
    swift_dynamicCast();
    return v2;
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v4);
    return 0;
  }
}

uint64_t protocol witness for IteratorProtocol.next() in conformance OSLogStore.PrivateIterator@<X0>(uint64_t *a1@<X8>)
{
  void **v1;
  uint64_t result;

  result = OSLogStore.PrivateIterator.next()(*v1);
  *a1 = result;
  return result;
}

_QWORD *OSLogStore.getEntries(with:at:matching:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x24BDAC8D0];
  v11[0] = 0;
  v4 = objc_msgSend(v3, sel_entriesEnumeratorWithOptions_position_predicate_error_, a1, a2, a3, v11);
  v5 = v11[0];
  if (v4)
  {
    v6 = v4;
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SequenceBox<_ClosureBasedSequence<OSLogStore.PrivateIterator>>);
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = partial apply for closure #1 in OSLogStore.getEntries(with:at:matching:);
    v8[3] = v7;
    v9 = v5;
  }
  else
  {
    v8 = v11[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v8;
}

uint64_t sub_208438588()
{
  uint64_t v0;

  return swift_deallocObject();
}

id partial apply for closure #1 in OSLogStore.getEntries(with:at:matching:)@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 16);
  *a1 = v2;
  return v2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD07604]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void OSLogMessageComponent.argument.getter(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  switch((unint64_t)objc_msgSend(v1, sel_argumentCategory))
  {
    case 1uLL:
      v3 = objc_msgSend(v1, sel_argumentDataValue);
      if (!v3)
      {
        __break(1u);
LABEL_12:
        __break(1u);
        JUMPOUT(0x208438734);
      }
      v4 = v3;
      v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      v7 = v6;

      *(_QWORD *)a1 = v5;
      *(_QWORD *)(a1 + 8) = v7;
      *(_BYTE *)(a1 + 16) = 0;
      break;
    case 2uLL:
      objc_msgSend(v1, sel_argumentDoubleValue);
      *(_QWORD *)a1 = v14;
      *(_QWORD *)(a1 + 8) = 0;
      v8 = 1;
      goto LABEL_10;
    case 3uLL:
      *(_QWORD *)a1 = objc_msgSend(v1, sel_argumentInt64Value);
      *(_QWORD *)(a1 + 8) = 0;
      v8 = 2;
      goto LABEL_10;
    case 4uLL:
      v9 = objc_msgSend(v1, sel_argumentStringValue);
      if (!v9)
        goto LABEL_12;
      v10 = v9;
      v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v13 = v12;

      *(_QWORD *)a1 = v11;
      *(_QWORD *)(a1 + 8) = v13;
      v8 = 3;
LABEL_10:
      *(_BYTE *)(a1 + 16) = v8;
      break;
    case 5uLL:
      *(_QWORD *)a1 = objc_msgSend(v1, sel_argumentUInt64Value);
      *(_QWORD *)(a1 + 8) = 0;
      v8 = 4;
      goto LABEL_10;
    default:
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      v8 = 5;
      goto LABEL_10;
  }
}

uint64_t outlined copy of OSLogMessageComponent.Argument(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 3)
    return swift_bridgeObjectRetain();
  if (!a3)
    return outlined copy of Data._Representation(result, a2);
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

uint64_t destroy for OSLogMessageComponent.Argument(uint64_t a1)
{
  return outlined consume of OSLogMessageComponent.Argument(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t outlined consume of OSLogMessageComponent.Argument(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 3)
    return swift_bridgeObjectRelease();
  if (!a3)
    return outlined consume of Data._Representation(result, a2);
  return result;
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

uint64_t initializeBufferWithCopyOfBuffer for OSLogMessageComponent.Argument(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  outlined copy of OSLogMessageComponent.Argument(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for OSLogMessageComponent.Argument(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  outlined copy of OSLogMessageComponent.Argument(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  outlined consume of OSLogMessageComponent.Argument(v6, v7, v8);
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

uint64_t assignWithTake for OSLogMessageComponent.Argument(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  outlined consume of OSLogMessageComponent.Argument(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for OSLogMessageComponent.Argument(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFB && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 251);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 5)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OSLogMessageComponent.Argument(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 251;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t getEnumTag for OSLogMessageComponent.Argument(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 4u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 5);
}

uint64_t destructiveInjectEnumTag for OSLogMessageComponent.Argument(uint64_t result, unsigned int a2)
{
  if (a2 >= 5)
  {
    *(_QWORD *)result = a2 - 5;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 5;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for OSLogMessageComponent.Argument()
{
  return &type metadata for OSLogMessageComponent.Argument;
}

void *type metadata accessor for OSLogStore.PrivateIterator()
{
  return &unk_24C09EEC0;
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t type metadata accessor for OSLogEntry()
{
  unint64_t result;

  result = lazy cache variable for type metadata for OSLogEntry;
  if (!lazy cache variable for type metadata for OSLogEntry)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OSLogEntry);
  }
  return result;
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x24BEE20A8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

