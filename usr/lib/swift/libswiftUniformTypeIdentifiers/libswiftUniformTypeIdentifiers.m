ValueMetadata *type metadata accessor for UTType()
{
  return &type metadata for UTType;
}

id static UTType._unconditionallyBridgeFromObjectiveC(_:)@<X0>(id result@<X0>, id *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

UTType __swiftcall UTType._bridgeToObjectiveC()()
{
  id *v0;

  return (UTType)*v0;
}

uint64_t UTType.localizedDescription.getter()
{
  return UTType.preferredFilenameExtension.getter((SEL *)&selRef_localizedDescription);
}

id static UTType.symbolicLink.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF85C0];
  *a1 = *MEMORY[0x24BDF85C0];
  return v1;
}

id static UTType.aliasFile.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8280];
  *a1 = *MEMORY[0x24BDF8280];
  return v1;
}

ValueMetadata *type metadata accessor for UTTagClass()
{
  return &type metadata for UTTagClass;
}

UniformTypeIdentifiers::UTType_optional __swiftcall UTType.init(filenameExtension:conformingTo:)(Swift::String filenameExtension, UniformTypeIdentifiers::UTType conformingTo)
{
  _QWORD *v2;
  objc_class *v3;
  Swift::Bool v4;
  UniformTypeIdentifiers::UTType_optional result;

  UTType.init(filenameExtension:conformingTo:)((void **)conformingTo._type.super.isa, (SEL *)&selRef_typeWithFilenameExtension_conformingToType_, v2);
  result.value._type.super.isa = v3;
  result.is_nil = v4;
  return result;
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance UTType()
{
  id *v0;

  return *v0;
}

uint64_t UTType.identifier.getter(SEL *a1)
{
  id *v1;
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(*v1, *a1);
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance UTType(void *a1, id *a2)
{

  *a2 = a1;
  return a1;
}

UniformTypeIdentifiers::UTType_optional __swiftcall UTType.init(_:)(Swift::String a1)
{
  _QWORD *v1;
  _QWORD *v2;
  void *v3;
  id v4;
  objc_class *v5;
  Swift::Bool v6;
  UniformTypeIdentifiers::UTType_optional result;

  v2 = v1;
  v3 = (void *)MEMORY[0x20BD03B98](a1._countAndFlagsBits);
  swift_bridgeObjectRelease();
  v4 = objc_msgSend((id)objc_opt_self(), sel_typeWithIdentifier_, v3);

  *v2 = v4;
  result.value._type.super.isa = v5;
  result.is_nil = v6;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UTType()
{
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for NSObject);
  return static NSObject.== infix(_:_:)() & 1;
}

uint64_t type metadata accessor for NSObject(uint64_t a1, unint64_t *a2)
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

Swift::Bool __swiftcall UTType.conforms(to:)(UniformTypeIdentifiers::UTType to)
{
  id *v1;

  return objc_msgSend(*v1, sel_conformsToType_, *(_QWORD *)to._type.super.isa);
}

void UTType.init(filenameExtension:conformingTo:)(void **a1@<X2>, SEL *a2@<X3>, _QWORD *a3@<X8>)
{
  void *v5;
  void *v6;
  id v7;

  v5 = *a1;
  v6 = (void *)MEMORY[0x20BD03B98]();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend((id)objc_opt_self(), *a2, v6, v5);

  *a3 = v7;
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UTType()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  Hasher.init(_seed:)();
  v2 = v1;
  NSObject.hash(into:)();

  return Hasher._finalize()();
}

uint64_t UTType.preferredFilenameExtension.getter(SEL *a1)
{
  id *v1;
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(*v1, *a1);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
}

id static UTType.data.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8350];
  *a1 = *MEMORY[0x24BDF8350];
  return v1;
}

id static UTType.folder.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF83C0];
  *a1 = *MEMORY[0x24BDF83C0];
  return v1;
}

id static UTType.item.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8430];
  *a1 = *MEMORY[0x24BDF8430];
  return v1;
}

id static UTType.content.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8348];
  *a1 = *MEMORY[0x24BDF8348];
  return v1;
}

id static UTType.package.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8500];
  *a1 = *MEMORY[0x24BDF8500];
  return v1;
}

uint64_t UTType.identifier.getter()
{
  return UTType.identifier.getter((SEL *)&selRef_identifier);
}

id static UTType.url.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF85F0];
  *a1 = *MEMORY[0x24BDF85F0];
  return v1;
}

id static UTType.playlist.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8518];
  *a1 = *MEMORY[0x24BDF8518];
  return v1;
}

id static UTType.flatRTFD.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF83B0];
  *a1 = *MEMORY[0x24BDF83B0];
  return v1;
}

id static UTType.archive.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF82C0];
  *a1 = *MEMORY[0x24BDF82C0];
  return v1;
}

id static UTType.script.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8590];
  *a1 = *MEMORY[0x24BDF8590];
  return v1;
}

id static UTType.image.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8410];
  *a1 = *MEMORY[0x24BDF8410];
  return v1;
}

id static UTType.text.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF85E0];
  *a1 = *MEMORY[0x24BDF85E0];
  return v1;
}

id static UTType.rtfd.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8560];
  *a1 = *MEMORY[0x24BDF8560];
  return v1;
}

id static UTType.json.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8440];
  *a1 = *MEMORY[0x24BDF8440];
  return v1;
}

id static UTType.pdf.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF84E0];
  *a1 = *MEMORY[0x24BDF84E0];
  return v1;
}

id static UTType.binaryPropertyList.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF82F0];
  *a1 = *MEMORY[0x24BDF82F0];
  return v1;
}

id static UTType.audiovisualContent.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF82D8];
  *a1 = *MEMORY[0x24BDF82D8];
  return v1;
}

id static UTType.xmlPropertyList.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8678];
  *a1 = *MEMORY[0x24BDF8678];
  return v1;
}

id static UTType.propertyList.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8530];
  *a1 = *MEMORY[0x24BDF8530];
  return v1;
}

id static UTType.presentation.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8528];
  *a1 = *MEMORY[0x24BDF8528];
  return v1;
}

id static UTType.spreadsheet.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF85B0];
  *a1 = *MEMORY[0x24BDF85B0];
  return v1;
}

id static UTType.webArchive.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8658];
  *a1 = *MEMORY[0x24BDF8658];
  return v1;
}

id static UTType.sourceCode.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF85A0];
  *a1 = *MEMORY[0x24BDF85A0];
  return v1;
}

id static UTType.executable.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF83A0];
  *a1 = *MEMORY[0x24BDF83A0];
  return v1;
}

unint64_t lazy protocol witness table accessor for type UTType and conformance UTType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UTType and conformance UTType;
  if (!lazy protocol witness table cache variable for type UTType and conformance UTType)
  {
    result = MEMORY[0x20BD04090](&protocol conformance descriptor for UTType, &type metadata for UTType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTType and conformance UTType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UTType and conformance UTType;
  if (!lazy protocol witness table cache variable for type UTType and conformance UTType)
  {
    result = MEMORY[0x20BD04090](&protocol conformance descriptor for UTType, &type metadata for UTType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTType and conformance UTType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UTType and conformance UTType;
  if (!lazy protocol witness table cache variable for type UTType and conformance UTType)
  {
    result = MEMORY[0x20BD04090](&protocol conformance descriptor for UTType, &type metadata for UTType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTType and conformance UTType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UTType and conformance UTType;
  if (!lazy protocol witness table cache variable for type UTType and conformance UTType)
  {
    result = MEMORY[0x20BD04090](&protocol conformance descriptor for UTType, &type metadata for UTType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTType and conformance UTType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UTType and conformance UTType;
  if (!lazy protocol witness table cache variable for type UTType and conformance UTType)
  {
    result = MEMORY[0x20BD04090](&protocol conformance descriptor for UTType, &type metadata for UTType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTType and conformance UTType);
  }
  return result;
}

id _UTSwiftOverlayRuntimeIssuesAssistant.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _UTSwiftOverlayRuntimeIssuesAssistant();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for _UTSwiftOverlayRuntimeIssuesAssistant()
{
  return objc_opt_self();
}

_QWORD *__swift_memcpy8_4(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UTHardwareColor(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for UTHardwareColor(uint64_t result, int a2, int a3)
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

void type metadata accessor for UTHardwareColor(uint64_t a1)
{
  type metadata accessor for UTHardwareColor(a1, &lazy cache variable for type metadata for UTHardwareColor);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance NSURLResourceKey()
{
  Swift::Int v0;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

unsigned __int8 *protocol witness for RawRepresentable.init(rawValue:) in conformance UTHardwareColorType@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance UTHardwareColorType(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NSURLResourceKey()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3)
    v5 = 1;
  else
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NSURLResourceKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for UTHardwareColor.__Unnamed_union___Anonymous_field2(uint64_t a1)
{
  type metadata accessor for UTHardwareColor(a1, &lazy cache variable for type metadata for UTHardwareColor.__Unnamed_union___Anonymous_field2);
}

void type metadata accessor for UTHardwareColorType(uint64_t a1)
{
  type metadata accessor for UTHardwareColor(a1, &lazy cache variable for type metadata for UTHardwareColorType);
}

void type metadata accessor for UTHardwareColor(uint64_t a1, unint64_t *a2)
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

uint64_t URLResourceValues.contentType.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  id v3;
  unint64_t v4;
  char v5;
  uint64_t result;
  __int128 v7;
  __int128 v8;

  v2 = URLResourceValues.allValues.getter();
  if (!*(_QWORD *)(v2 + 16))
  {
    v7 = 0u;
    v8 = 0u;
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  v3 = (id)*MEMORY[0x24BDBCBE8];
  v4 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v3);
  if ((v5 & 1) == 0)
  {
    v7 = 0u;
    v8 = 0u;

    goto LABEL_8;
  }
  outlined init with copy of Any(*(_QWORD *)(v2 + 56) + 32 * v4, (uint64_t)&v7);

  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v8 + 1))
  {
LABEL_9:
    result = outlined destroy of Any?((uint64_t)&v7);
    goto LABEL_10;
  }
  result = swift_dynamicCast();
  if ((result & 1) == 0)
LABEL_10:
    *a1 = 0;
  return result;
}

void URL.appendingPathComponent(_:conformingTo:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, NSURL *a4@<X8>)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = *a3;
  URL._bridgeToObjectiveC()(a4);
  v8 = v7;
  v9 = (void *)MEMORY[0x20BD03B98](a1, a2);
  v10 = objc_msgSend(v8, sel_URLByAppendingPathComponent_conformingToType_, v9, v6);

  static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Void __swiftcall URL.appendPathComponent(_:conformingTo:)(Swift::String _, UniformTypeIdentifiers::UTType conformingTo)
{
  uint64_t v2;
  uint64_t v3;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSURL *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;

  v3 = v2;
  object = _._object;
  countAndFlagsBits = _._countAndFlagsBits;
  v7 = type metadata accessor for URL();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)conformingTo._type.super.isa;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 32))(v10, v3, v7);
  URL._bridgeToObjectiveC()(v12);
  v14 = v13;
  v15 = (void *)MEMORY[0x20BD03B98](countAndFlagsBits, object);
  v16 = objc_msgSend(v14, sel_URLByAppendingPathComponent_conformingToType_, v15, v11);

  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void URL.appendingPathExtension(for:)(uint64_t *a1@<X0>, NSURL *a2@<X8>)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *a1;
  URL._bridgeToObjectiveC()(a2);
  v4 = v3;
  v5 = objc_msgSend(v3, sel_URLByAppendingPathExtensionForType_, v2);

  static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Void __swiftcall URL.appendPathExtension(for:)(UniformTypeIdentifiers::UTType a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSURL *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;

  v2 = v1;
  v4 = type metadata accessor for URL();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)a1._type.super.isa;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v2, v4);
  URL._bridgeToObjectiveC()(v9);
  v11 = v10;
  v12 = objc_msgSend(v10, sel_URLByAppendingPathExtensionForType_, v8);

  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void String.appendingPathExtension(for:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void String.appendingPathComponent(_:conformingTo:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  Swift::Int v2;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD04078]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  void *v4;
  Swift::UInt HashCode;
  Swift::Int v6;

  Hasher.init(_seed:)();
  v4 = (void *)MEMORY[0x20BD03B98](a1, a2);
  HashCode = _UTIdentifierGetHashCode();

  Hasher._combine(_:)(HashCode);
  v6 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v6);
}

{
  Swift::Int v4;

  Hasher.init(_seed:)();
  String.hash(into:)();
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16)
            break;
          v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * i);
    v10 = *v9;
    v11 = v9[1];
    swift_bridgeObjectRetain();
    v12 = (void *)MEMORY[0x20BD03B98](v10, v11);
    v13 = (void *)MEMORY[0x20BD03B98](a1, a2);
    v14 = _UTIdentifiersAreEqual();
    swift_bridgeObjectRelease();

    if ((v14 & 1) == 0)
    {
      v15 = ~v5;
      for (i = (i + 1) & v15; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v15)
      {
        v16 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * i);
        v17 = *v16;
        v18 = v16[1];
        swift_bridgeObjectRetain();
        v19 = (void *)MEMORY[0x20BD03B98](v17, v18);
        v20 = (void *)MEMORY[0x20BD03B98](a1, a2);
        LOBYTE(v17) = _UTIdentifiersAreEqual();
        swift_bridgeObjectRelease();

        if ((v17 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

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
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

UniformTypeIdentifiers::UTType_optional __swiftcall UTType.init(_rawBluetoothProductID:rawVendorID:)(Swift::UInt32 _rawBluetoothProductID, Swift::UInt16 rawVendorID)
{
  objc_class **v2;
  objc_class **v3;
  objc_class *v4;
  Swift::Bool v5;
  UniformTypeIdentifiers::UTType_optional result;

  v3 = v2;
  v4 = (objc_class *)objc_msgSend((id)objc_opt_self(), sel__typeWithBluetoothProductID_vendorID_, *(_QWORD *)&_rawBluetoothProductID, rawVendorID);
  *v3 = v4;
  result.value._type.super.isa = v4;
  result.is_nil = v5;
  return result;
}

UniformTypeIdentifiers::UTType_optional __swiftcall UTType.init(mimeType:conformingTo:)(Swift::String mimeType, UniformTypeIdentifiers::UTType conformingTo)
{
  _QWORD *v2;
  objc_class *v3;
  Swift::Bool v4;
  UniformTypeIdentifiers::UTType_optional result;

  UTType.init(filenameExtension:conformingTo:)((void **)conformingTo._type.super.isa, (SEL *)&selRef_typeWithMIMEType_conformingToType_, v2);
  result.value._type.super.isa = v3;
  result.is_nil = v4;
  return result;
}

uint64_t UTType.preferredFilenameExtension.getter()
{
  return UTType.preferredFilenameExtension.getter((SEL *)&selRef_preferredFilenameExtension);
}

uint64_t UTType.preferredMIMEType.getter()
{
  return UTType.preferredFilenameExtension.getter((SEL *)&selRef_preferredMIMEType);
}

id UTType.version.getter()
{
  id *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(*v0, sel_version);
  v2 = v1;
  if (!v1)
    return 0;
  v3 = objc_msgSend(v1, sel_integerValue);

  return v3;
}

uint64_t UTType.referenceURL.getter@<X0>(uint64_t a1@<X8>)
{
  id *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*v1, sel_referenceURL);
  if (v3)
  {
    v4 = v3;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v5 = type metadata accessor for URL();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 0;
  }
  else
  {
    v5 = type metadata accessor for URL();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

id UTType.isDynamic.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_isDynamic);
}

id UTType.isDeclared.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_isDeclared);
}

id UTType.isPublic.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_isPublicType);
}

Swift::Bool __swiftcall UTType.isSupertype(of:)(UniformTypeIdentifiers::UTType of)
{
  id *v1;

  return objc_msgSend(*v1, sel_isSupertypeOfType_, *(_QWORD *)of._type.super.isa);
}

Swift::Bool __swiftcall UTType.isSubtype(of:)(UniformTypeIdentifiers::UTType of)
{
  id *v1;

  return objc_msgSend(*v1, sel_isSubtypeOfType_, *(_QWORD *)of._type.super.isa);
}

uint64_t UTType.supertypes.getter()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(*v0, sel_supertypes);
  lazy protocol witness table accessor for type UTType and conformance UTType();
  v2 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

UniformTypeIdentifiers::UTType_optional __swiftcall UTType.init(tag:tagClass:conformingTo:)(Swift::String tag, UniformTypeIdentifiers::UTTagClass tagClass, UniformTypeIdentifiers::UTType_optional conformingTo)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  Swift::Bool v12;
  UniformTypeIdentifiers::UTType_optional result;

  v4 = v3;
  v5 = *(_QWORD *)tagClass.rawValue._countAndFlagsBits;
  v6 = *(_QWORD *)(tagClass.rawValue._countAndFlagsBits + 8);
  v7 = *(void **)tagClass.rawValue._object;
  v8 = (void *)MEMORY[0x20BD03B98](tag._countAndFlagsBits);
  swift_bridgeObjectRelease();
  v9 = (void *)MEMORY[0x20BD03B98](v5, v6);
  swift_bridgeObjectRelease();
  v10 = objc_msgSend((id)objc_opt_self(), sel_typeWithTag_tagClass_conformingToType_, v8, v9, v7);

  *v4 = v10;
  result.value._type.super.isa = v11;
  result.is_nil = v12;
  return result;
}

uint64_t static UTType.types(tag:tagClass:conformingTo:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  v4 = *a3;
  v5 = a3[1];
  v6 = *a4;
  v7 = (void *)MEMORY[0x20BD03B98]();
  v8 = (void *)MEMORY[0x20BD03B98](v4, v5);
  v9 = objc_msgSend((id)objc_opt_self(), sel_typesWithTag_tagClass_conformingToType_, v7, v8, v6);

  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return v10;
}

uint64_t UTType.tags.getter()
{
  id *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = objc_msgSend(*v0, sel_tags);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v3 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSDySSSaySSGG_22UniformTypeIdentifiers10UTTagClassV_AFts5NeverOTg5012_sSSSaySSG22de13Identifiers10gh34VAAIgggro_SS3key_AA5valuetAD_AAts5I92OIegnrzr_TR04_s22ab31Identifiers6UTTypeV4tagsSDyAA10de19VSaySSGGvgAF_AGtSS_R5XEfU_Tf3nnnpf_nTf1cn_n(v2);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v3 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<UTTagClass, [String]>);
    v4 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v4 = MEMORY[0x24BEE4B00];
  }
  v7 = v4;
  v5 = (_QWORD *)swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v5, 1, &v7);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSDySSSaySSGG_22UniformTypeIdentifiers10UTTagClassV_AFts5NeverOTg5012_sSSSaySSG22de13Identifiers10gh34VAAIgggro_SS3key_AA5valuetAD_AAts5I92OIegnrzr_TR04_s22ab31Identifiers6UTTypeV4tagsSDyAA10de19VSaySSGGvgAF_AGtSS_R5XEfU_Tf3nnnpf_nTf1cn_n(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  int64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v3 = a1;
  v30 = MEMORY[0x24BEE4AF8];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
  v2 = v30;
  result = specialized Dictionary.startIndex.getter(v3);
  v6 = result;
  v7 = 0;
  v8 = v3 + 64;
  v24 = v3 + 80;
  v25 = v1;
  v26 = v5;
  v27 = v3 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(v3 + 32))
  {
    v11 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(v3 + 36) != v5)
      goto LABEL_24;
    v28 = v7;
    v12 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v6);
    v13 = v12[1];
    v29 = *v12;
    v14 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v6);
    v15 = v3;
    v17 = *(_QWORD *)(v30 + 16);
    v16 = *(_QWORD *)(v30 + 24);
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRetain();
    if (v17 >= v16 >> 1)
      result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v16 > 1), v17 + 1, 1);
    *(_QWORD *)(v30 + 16) = v17 + 1;
    v18 = (_QWORD *)(v30 + 24 * v17);
    v18[4] = v29;
    v18[5] = v13;
    v18[6] = v14;
    v9 = 1 << *(_BYTE *)(v15 + 32);
    if (v6 >= v9)
      goto LABEL_25;
    v8 = v27;
    v19 = *(_QWORD *)(v27 + 8 * v11);
    if ((v19 & (1 << v6)) == 0)
      goto LABEL_26;
    v3 = v15;
    v5 = v26;
    if (*(_DWORD *)(v15 + 36) != v26)
      goto LABEL_27;
    v20 = v19 & (-2 << (v6 & 0x3F));
    if (v20)
    {
      v9 = __clz(__rbit64(v20)) | v6 & 0xFFFFFFFFFFFFFFC0;
      v10 = v25;
    }
    else
    {
      v21 = v11 + 1;
      v22 = (unint64_t)(v9 + 63) >> 6;
      v10 = v25;
      if (v11 + 1 < v22)
      {
        v23 = *(_QWORD *)(v27 + 8 * v21);
        if (v23)
        {
LABEL_20:
          v9 = __clz(__rbit64(v23)) + (v21 << 6);
        }
        else
        {
          while (v22 - 2 != v11)
          {
            v23 = *(_QWORD *)(v24 + 8 * v11++);
            if (v23)
            {
              v21 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    v7 = v28 + 1;
    v6 = v9;
    if (v28 + 1 == v10)
      return v2;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

UniformTypeIdentifiers::UTType __swiftcall UTType.init(exportedAs:conformingTo:)(Swift::String exportedAs, UniformTypeIdentifiers::UTType_optional conformingTo)
{
  _QWORD *v2;
  UniformTypeIdentifiers::UTType result;

  UTType.init(exportedAs:conformingTo:)(exportedAs._countAndFlagsBits, (uint64_t)exportedAs._object, (id *)conformingTo.value._type.super.isa, (SEL *)&selRef_exportedTypeWithIdentifier_conformingToType_, (SEL *)&selRef_exportedTypeWithIdentifier_, v2);
  return result;
}

UniformTypeIdentifiers::UTType __swiftcall UTType.init(importedAs:conformingTo:)(Swift::String importedAs, UniformTypeIdentifiers::UTType_optional conformingTo)
{
  _QWORD *v2;
  UniformTypeIdentifiers::UTType result;

  UTType.init(exportedAs:conformingTo:)(importedAs._countAndFlagsBits, (uint64_t)importedAs._object, (id *)conformingTo.value._type.super.isa, (SEL *)&selRef_importedTypeWithIdentifier_conformingToType_, (SEL *)&selRef_importedTypeWithIdentifier_, v2);
  return result;
}

void UTType.init(exportedAs:conformingTo:)(uint64_t a1@<X0>, uint64_t a2@<X1>, id *a3@<X2>, SEL *a4@<X3>, SEL *a5@<X4>, _QWORD *a6@<X8>)
{
  id v10;
  void *v11;
  id v12;

  if (*a3)
  {
    v10 = *a3;
    v11 = (void *)MEMORY[0x20BD03B98](a1, a2);
    swift_bridgeObjectRelease();
    v12 = objc_msgSend((id)objc_opt_self(), *a4, v11, v10);

  }
  else
  {
    v11 = (void *)MEMORY[0x20BD03B98](a1, a2);
    swift_bridgeObjectRelease();
    v12 = objc_msgSend((id)objc_opt_self(), *a5, v11);
  }

  *a6 = v12;
}

uint64_t static UTType.== infix(_:_:)()
{
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for NSObject);
  return static NSObject.== infix(_:_:)() & 1;
}

void UTType.hash(into:)()
{
  id *v0;
  id v1;

  v1 = *v0;
  NSObject.hash(into:)();

}

Swift::Int UTType.hashValue.getter()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  Hasher.init(_seed:)();
  v2 = v1;
  NSObject.hash(into:)();

  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance UTType()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  Hasher.init(_seed:)();
  v2 = v1;
  NSObject.hash(into:)();

  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance UTType()
{
  id *v0;
  id v1;

  v1 = *v0;
  NSObject.hash(into:)();

}

uint64_t UTType.description.getter()
{
  return UTType.identifier.getter((SEL *)&selRef_description);
}

uint64_t UTType.debugDescription.getter()
{
  return UTType.identifier.getter((SEL *)&selRef_debugDescription);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance UTType(uint64_t a1, uint64_t a2)
{
  return protocol witness for CustomStringConvertible.description.getter in conformance UTType(a1, a2, (SEL *)&selRef_description);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance UTType(uint64_t a1, uint64_t a2)
{
  return protocol witness for CustomStringConvertible.description.getter in conformance UTType(a1, a2, (SEL *)&selRef_debugDescription);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance UTType(uint64_t a1, uint64_t a2, SEL *a3)
{
  id *v3;
  id v4;
  uint64_t v5;

  v4 = objc_msgSend(*v3, *a3);
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v5;
}

id static UTType._forceBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{

  *a2 = a1;
  return a1;
}

uint64_t static UTType._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  id v4;

  *a2 = a1;
  v4 = a1;
  return 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance UTType(void *a1, id *a2)
{
  id v4;

  *a2 = a1;
  v4 = a1;
  return 1;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance UTType@<X0>(id result@<X0>, id *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance UTType._CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance UTType._CodingKeys()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance UTType._CodingKeys()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UTType._CodingKeys()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance UTType._CodingKeys()
{
  _BYTE *v0;

  if (*v0)
    return 0x746E6174736E6F63;
  else
    return 0x696669746E656469;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance UTType._CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized UTType._CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance UTType._CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance UTType._CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance UTType._CodingKeys()
{
  lazy protocol witness table accessor for type UTType._CodingKeys and conformance UTType._CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance UTType._CodingKeys()
{
  lazy protocol witness table accessor for type UTType._CodingKeys and conformance UTType._CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t UTType.encode(to:)(_QWORD *a1)
{
  id *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  char *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t result;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD v26[2];
  char *v27;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<UTType._CodingKeys>);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v27 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v25 = (unint64_t)objc_msgSend(*v1, sel__constantIndex);
  if ((v25 & 0x8000000000000000) == 0)
    goto LABEL_2;
  v21 = v5;
  v22 = v4;
  v11 = a1[3];
  v24 = a1[4];
  v23 = __swift_project_boxed_opaque_existential_1(a1, v11);
  v12 = v7;
  v13 = objc_msgSend(v12, sel_identifier);
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = v15;

  v26[0] = v14;
  v26[1] = v16;
  v17 = Encoder.encodeSingleValueSafely<A>(_:)((uint64_t)v26, v11, MEMORY[0x24BEE0D00]);
  if (v2)
    return swift_bridgeObjectRelease();
  v19 = v17;
  result = swift_bridgeObjectRelease();
  v5 = v21;
  v4 = v22;
  if ((v19 & 1) == 0)
  {
LABEL_2:
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    lazy protocol witness table accessor for type UTType._CodingKeys and conformance UTType._CodingKeys();
    v8 = v27;
    dispatch thunk of Encoder.container<A>(keyedBy:)();
    v9 = v7;
    v10 = objc_msgSend(v9, sel_identifier);
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    LOBYTE(v26[0]) = 0;
    KeyedEncodingContainer.encode(_:forKey:)();
    if (v2)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    if ((v25 & 0x8000000000000000) == 0)
    {
      LOBYTE(v26[0]) = 1;
      KeyedEncodingContainer.encode(_:forKey:)();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return result;
}

uint64_t UTType.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  id v17;
  _QWORD v20[4];
  _QWORD *v21;

  v21 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<UTType._CodingKeys>?);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v20[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<UTType._CodingKeys>);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v20[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type UTType._CodingKeys and conformance UTType._CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {

    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    outlined destroy of KeyedDecodingContainer<UTType._CodingKeys>?((uint64_t)v5);
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    dispatch thunk of Decoder.singleValueContainer()();
    __swift_project_boxed_opaque_existential_1(v20, v20[3]);
    v11 = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
    v13 = v12;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    v14 = -1;
  }
  else
  {
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
    LOBYTE(v20[0]) = 0;
    v11 = KeyedDecodingContainer.decode(_:forKey:)();
    v13 = v10;
    LOBYTE(v20[0]) = 1;
    v14 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    v16 = v15;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    if ((v16 & 1) != 0)
      v14 = -1;
  }
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UTType);
  v17 = @nonobjc UTType.init(_identifier:constantIndex:)(v11, v13, v14);
  *v21 = v17;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

id @nonobjc UTType.init(_identifier:constantIndex:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x20BD03B98]();
  swift_bridgeObjectRelease();
  v9[0] = 0;
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel__typeWithIdentifier_constantIndex_error_, v4, a3, v9);

  if (v5)
  {
    v6 = v9[0];
  }
  else
  {
    v7 = v9[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v5;
}

uint64_t protocol witness for Decodable.init(from:) in conformance UTType@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return UTType.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance UTType(_QWORD *a1)
{
  return UTType.encode(to:)(a1);
}

void specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(_QWORD *a1, char a2, _QWORD *a3)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  _BOOL8 v14;
  BOOL v15;
  uint64_t v16;
  char v17;
  char v18;
  void *v19;
  id v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  _BOOL8 v31;
  uint64_t v32;
  char v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  Swift::String v38;
  Swift::String v39;

  LOBYTE(v4) = a2;
  v6 = a1[2];
  swift_bridgeObjectRetain();
  if (!v6)
    goto LABEL_23;
  v8 = a1[5];
  v7 = a1[6];
  v9 = a1[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!v8)
    goto LABEL_23;
  v10 = (_QWORD *)*a3;
  v11 = specialized __RawDictionaryStorage.find<A>(_:)(v9, v8);
  v13 = v10[2];
  v14 = (v12 & 1) == 0;
  v15 = __OFADD__(v13, v14);
  v16 = v13 + v14;
  if (v15)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v17 = v12;
  if (v10[3] < v16)
  {
    specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v16, v4 & 1);
    v11 = specialized __RawDictionaryStorage.find<A>(_:)(v9, v8);
    if ((v17 & 1) == (v18 & 1))
      goto LABEL_8;
LABEL_6:
    v11 = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
  }
  if ((v4 & 1) != 0)
  {
LABEL_8:
    if ((v17 & 1) != 0)
      goto LABEL_9;
    goto LABEL_12;
  }
  v21 = v11;
  specialized _NativeDictionary.copy()();
  v11 = v21;
  if ((v17 & 1) != 0)
  {
LABEL_9:
    v19 = (void *)swift_allocError();
    swift_willThrow();
    v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_28;
  }
LABEL_12:
  v22 = (_QWORD *)*a3;
  *(_QWORD *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
  v23 = (uint64_t *)(v22[6] + 16 * v11);
  *v23 = v9;
  v23[1] = v8;
  *(_QWORD *)(v22[7] + 8 * v11) = v7;
  v24 = v22[2];
  v15 = __OFADD__(v24, 1);
  v25 = v24 + 1;
  if (v15)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    _StringGuts.grow(_:)(30);
    v38._object = (void *)0x800000020830C920;
    v38._countAndFlagsBits = 0xD00000000000001BLL;
    String.append(_:)(v38);
    _print_unlocked<A, B>(_:_:)();
    v39._countAndFlagsBits = 39;
    v39._object = (void *)0xE100000000000000;
    String.append(_:)(v39);
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return;
  }
  v22[2] = v25;
  if (v6 != 1)
  {
    v4 = a1 + 9;
    v26 = 1;
    while (v26 < a1[2])
    {
      v8 = *(v4 - 1);
      v7 = *v4;
      v9 = *(v4 - 2);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!v8)
        goto LABEL_23;
      v27 = (_QWORD *)*a3;
      v28 = specialized __RawDictionaryStorage.find<A>(_:)(v9, v8);
      v30 = v27[2];
      v31 = (v29 & 1) == 0;
      v15 = __OFADD__(v30, v31);
      v32 = v30 + v31;
      if (v15)
        goto LABEL_25;
      v17 = v29;
      if (v27[3] < v32)
      {
        specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v32, 1);
        v28 = specialized __RawDictionaryStorage.find<A>(_:)(v9, v8);
        if ((v17 & 1) != (v33 & 1))
          goto LABEL_6;
      }
      if ((v17 & 1) != 0)
        goto LABEL_9;
      v34 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v28 >> 6) + 64) |= 1 << v28;
      v35 = (uint64_t *)(v34[6] + 16 * v28);
      *v35 = v9;
      v35[1] = v8;
      *(_QWORD *)(v34[7] + 8 * v28) = v7;
      v36 = v34[2];
      v15 = __OFADD__(v36, 1);
      v37 = v36 + 1;
      if (v15)
        goto LABEL_26;
      ++v26;
      v34[2] = v37;
      v4 += 3;
      if (v6 == v26)
        goto LABEL_23;
    }
    goto LABEL_27;
  }
LABEL_23:
  swift_bridgeObjectRelease_n();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type UTType._CodingKeys and conformance UTType._CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys;
  if (!lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys)
  {
    result = MEMORY[0x20BD04090](&protocol conformance descriptor for UTType._CodingKeys, &unk_24C091D70);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys;
  if (!lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys)
  {
    result = MEMORY[0x20BD04090](&protocol conformance descriptor for UTType._CodingKeys, &unk_24C091D70);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys;
  if (!lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys)
  {
    result = MEMORY[0x20BD04090](&protocol conformance descriptor for UTType._CodingKeys, &unk_24C091D70);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys;
  if (!lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys)
  {
    result = MEMORY[0x20BD04090](&protocol conformance descriptor for UTType._CodingKeys, &unk_24C091D70);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTType._CodingKeys and conformance UTType._CodingKeys);
  }
  return result;
}

uint64_t outlined destroy of KeyedDecodingContainer<UTType._CodingKeys>?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<UTType._CodingKeys>?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UTType._CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for UTType._CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2083055FC + 4 * byte_20830C075[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_208305630 + 4 * byte_20830C070[v4]))();
}

uint64_t sub_208305630(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_208305638(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x208305640);
  return result;
}

uint64_t sub_20830564C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x208305654);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_208305658(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_208305660(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for UTType._CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for UTType._CodingKeys(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void *type metadata accessor for UTType._CodingKeys()
{
  return &unk_24C091D70;
}

void *specialized _NativeDictionary.copy()()
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<UTTagClass, [String]>);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)();
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

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
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
  void *v14;
  Swift::UInt HashCode;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
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
  uint64_t *v35;
  int64_t v36;
  _QWORD *v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<UTTagClass, [String]>);
  v38 = a2;
  v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v35 = v2;
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v37 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v36 = (unint64_t)(v8 + 63) >> 6;
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
      }
      else
      {
        v23 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v36)
          goto LABEL_33;
        v24 = v37[v23];
        ++v13;
        if (!v24)
        {
          v13 = v23 + 1;
          if (v23 + 1 >= v36)
            goto LABEL_33;
          v24 = v37[v13];
          if (!v24)
          {
            v25 = v23 + 2;
            if (v25 >= v36)
            {
LABEL_33:
              swift_release();
              v3 = v35;
              if ((v38 & 1) != 0)
              {
                v34 = 1 << *(_BYTE *)(v5 + 32);
                if (v34 >= 64)
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v37 = -1 << v34;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v24 = v37[v25];
            if (!v24)
            {
              while (1)
              {
                v13 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_40;
                if (v13 >= v36)
                  goto LABEL_33;
                v24 = v37[v13];
                ++v25;
                if (v24)
                  goto LABEL_30;
              }
            }
            v13 = v25;
          }
        }
LABEL_30:
        v10 = (v24 - 1) & v24;
        v22 = __clz(__rbit64(v24)) + (v13 << 6);
      }
      v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v22);
      v32 = *v30;
      v31 = v30[1];
      v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v22);
      if ((v38 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      v14 = (void *)MEMORY[0x20BD03B98](v32, v31);
      HashCode = _UTIdentifierGetHashCode();

      Hasher._combine(_:)(HashCode);
      result = Hasher._finalize()();
      v16 = -1 << *(_BYTE *)(v7 + 32);
      v17 = result & ~v16;
      v18 = v17 >> 6;
      if (((-1 << v17) & ~*(_QWORD *)(v11 + 8 * (v17 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v11 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v28 = v18 == v27;
          if (v18 == v27)
            v18 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v11 + 8 * v18);
        }
        while (v29 == -1);
        v19 = __clz(__rbit64(~v29)) + (v18 << 6);
      }
      *(_QWORD *)(v11 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      v20 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v19);
      *v20 = v32;
      v20[1] = v31;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v19) = v33;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t specialized Dictionary.startIndex.getter(uint64_t a1)
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

uint64_t specialized UTType._CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E6174736E6F63 && a2 == 0xED00007865646E49)
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

uint64_t static UTTagClass._deviceModelCode.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

id static UTType.compositeContent.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8338];
  *a1 = *MEMORY[0x24BDF8338];
  return v1;
}

id static UTType.diskImage.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8378];
  *a1 = *MEMORY[0x24BDF8378];
  return v1;
}

id static UTType.directory.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8368];
  *a1 = *MEMORY[0x24BDF8368];
  return v1;
}

id static UTType.resolvable.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8570];
  *a1 = *MEMORY[0x24BDF8570];
  return v1;
}

id static UTType.mountPoint.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF84B0];
  *a1 = *MEMORY[0x24BDF84B0];
  return v1;
}

id static UTType.urlBookmarkData.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF85F8];
  *a1 = *MEMORY[0x24BDF85F8];
  return v1;
}

id static UTType.fileURL.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF83A8];
  *a1 = *MEMORY[0x24BDF83A8];
  return v1;
}

id static UTType.plainText.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8510];
  *a1 = *MEMORY[0x24BDF8510];
  return v1;
}

id static UTType.utf8PlainText.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8620];
  *a1 = *MEMORY[0x24BDF8620];
  return v1;
}

id static UTType.utf16ExternalPlainText.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8610];
  *a1 = *MEMORY[0x24BDF8610];
  return v1;
}

id static UTType.utf16PlainText.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8618];
  *a1 = *MEMORY[0x24BDF8618];
  return v1;
}

id static UTType.delimitedText.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8360];
  *a1 = *MEMORY[0x24BDF8360];
  return v1;
}

id static UTType.commaSeparatedText.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8330];
  *a1 = *MEMORY[0x24BDF8330];
  return v1;
}

id static UTType.tabSeparatedText.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF85D8];
  *a1 = *MEMORY[0x24BDF85D8];
  return v1;
}

id static UTType.utf8TabSeparatedText.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8628];
  *a1 = *MEMORY[0x24BDF8628];
  return v1;
}

id static UTType.rtf.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8558];
  *a1 = *MEMORY[0x24BDF8558];
  return v1;
}

id static UTType.html.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF83F8];
  *a1 = *MEMORY[0x24BDF83F8];
  return v1;
}

id static UTType.xml.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8670];
  *a1 = *MEMORY[0x24BDF8670];
  return v1;
}

id static UTType.yaml.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8688];
  *a1 = *MEMORY[0x24BDF8688];
  return v1;
}

void static UTType.css.getter(_QWORD *a1@<X8>)
{
  static UTType.css.getter(a1);
}

{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x20BD03B98]();
  v3 = objc_msgSend((id)objc_opt_self(), sel_typeWithIdentifier_, v2);

  if (v3)
    *a1 = v3;
  else
    __break(1u);
}

id static UTType.assemblyLanguageSource.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF82C8];
  *a1 = *MEMORY[0x24BDF82C8];
  return v1;
}

id static UTType.cSource.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8320];
  *a1 = *MEMORY[0x24BDF8320];
  return v1;
}

id static UTType.objectiveCSource.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF84D8];
  *a1 = *MEMORY[0x24BDF84D8];
  return v1;
}

id static UTType.swiftSource.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF85B8];
  *a1 = *MEMORY[0x24BDF85B8];
  return v1;
}

id static UTType.cPlusPlusSource.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8318];
  *a1 = *MEMORY[0x24BDF8318];
  return v1;
}

id static UTType.objectiveCPlusPlusSource.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF84D0];
  *a1 = *MEMORY[0x24BDF84D0];
  return v1;
}

id static UTType.cHeader.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8308];
  *a1 = *MEMORY[0x24BDF8308];
  return v1;
}

id static UTType.cPlusPlusHeader.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8310];
  *a1 = *MEMORY[0x24BDF8310];
  return v1;
}

id static UTType.appleScript.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF82A0];
  *a1 = *MEMORY[0x24BDF82A0];
  return v1;
}

id static UTType.osaScript.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF84C0];
  *a1 = *MEMORY[0x24BDF84C0];
  return v1;
}

id static UTType.osaScriptBundle.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF84C8];
  *a1 = *MEMORY[0x24BDF84C8];
  return v1;
}

id static UTType.javaScript.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8448];
  *a1 = *MEMORY[0x24BDF8448];
  return v1;
}

id static UTType.shellScript.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8598];
  *a1 = *MEMORY[0x24BDF8598];
  return v1;
}

id static UTType.perlScript.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8508];
  *a1 = *MEMORY[0x24BDF8508];
  return v1;
}

id static UTType.pythonScript.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8538];
  *a1 = *MEMORY[0x24BDF8538];
  return v1;
}

id static UTType.rubyScript.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8578];
  *a1 = *MEMORY[0x24BDF8578];
  return v1;
}

id static UTType.phpScript.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF84E8];
  *a1 = *MEMORY[0x24BDF84E8];
  return v1;
}

id static UTType.makefile.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF84A0];
  *a1 = *MEMORY[0x24BDF84A0];
  return v1;
}

id static UTType.jpeg.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8438];
  *a1 = *MEMORY[0x24BDF8438];
  return v1;
}

id static UTType.tiff.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF85D0];
  *a1 = *MEMORY[0x24BDF85D0];
  return v1;
}

id static UTType.gif.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF83D8];
  *a1 = *MEMORY[0x24BDF83D8];
  return v1;
}

id static UTType.png.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF84F8];
  *a1 = *MEMORY[0x24BDF84F8];
  return v1;
}

id static UTType.icns.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8400];
  *a1 = *MEMORY[0x24BDF8400];
  return v1;
}

id static UTType.bmp.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF82E0];
  *a1 = *MEMORY[0x24BDF82E0];
  return v1;
}

id static UTType.ico.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8408];
  *a1 = *MEMORY[0x24BDF8408];
  return v1;
}

id static UTType.rawImage.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8550];
  *a1 = *MEMORY[0x24BDF8550];
  return v1;
}

id static UTType.svg.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8580];
  *a1 = *MEMORY[0x24BDF8580];
  return v1;
}

id static UTType.livePhoto.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8450];
  *a1 = *MEMORY[0x24BDF8450];
  return v1;
}

id static UTType.heif.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF83F0];
  *a1 = *MEMORY[0x24BDF83F0];
  return v1;
}

id static UTType.heic.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF83E8];
  *a1 = *MEMORY[0x24BDF83E8];
  return v1;
}

void static UTType.heics.getter(_QWORD *a1@<X8>)
{
  static UTType.css.getter(a1);
}

id static UTType.webP.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8660];
  *a1 = *MEMORY[0x24BDF8660];
  return v1;
}

void static UTType.exr.getter(_QWORD *a1@<X8>)
{
  static UTType.css.getter(a1);
}

void static UTType.dng.getter(_QWORD *a1@<X8>)
{
  static UTType.css.getter(a1);
}

id static UTType.threeDContent.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8258];
  *a1 = *MEMORY[0x24BDF8258];
  return v1;
}

id static UTType.usd.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8600];
  *a1 = *MEMORY[0x24BDF8600];
  return v1;
}

id static UTType.usdz.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8608];
  *a1 = *MEMORY[0x24BDF8608];
  return v1;
}

id static UTType.realityFile.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8568];
  *a1 = *MEMORY[0x24BDF8568];
  return v1;
}

id static UTType.sceneKitScene.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8588];
  *a1 = *MEMORY[0x24BDF8588];
  return v1;
}

id static UTType.arReferenceObject.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8270];
  *a1 = *MEMORY[0x24BDF8270];
  return v1;
}

id static UTType.movie.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF84B8];
  *a1 = *MEMORY[0x24BDF84B8];
  return v1;
}

id static UTType.video.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8640];
  *a1 = *MEMORY[0x24BDF8640];
  return v1;
}

id static UTType.audio.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF82D0];
  *a1 = *MEMORY[0x24BDF82D0];
  return v1;
}

id static UTType.quickTimeMovie.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8548];
  *a1 = *MEMORY[0x24BDF8548];
  return v1;
}

id static UTType.mpeg.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8478];
  *a1 = *MEMORY[0x24BDF8478];
  return v1;
}

id static UTType.mpeg2Video.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8488];
  *a1 = *MEMORY[0x24BDF8488];
  return v1;
}

id static UTType.mpeg2TransportStream.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8480];
  *a1 = *MEMORY[0x24BDF8480];
  return v1;
}

id static UTType.mp3.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8470];
  *a1 = *MEMORY[0x24BDF8470];
  return v1;
}

id static UTType.mpeg4Movie.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8498];
  *a1 = *MEMORY[0x24BDF8498];
  return v1;
}

id static UTType.mpeg4Audio.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8490];
  *a1 = *MEMORY[0x24BDF8490];
  return v1;
}

id static UTType.appleProtectedMPEG4Audio.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8290];
  *a1 = *MEMORY[0x24BDF8290];
  return v1;
}

id static UTType.appleProtectedMPEG4Video.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8298];
  *a1 = *MEMORY[0x24BDF8298];
  return v1;
}

id static UTType.avi.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8278];
  *a1 = *MEMORY[0x24BDF8278];
  return v1;
}

id static UTType.aiff.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8268];
  *a1 = *MEMORY[0x24BDF8268];
  return v1;
}

id static UTType.wav.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8650];
  *a1 = *MEMORY[0x24BDF8650];
  return v1;
}

id static UTType.midi.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8468];
  *a1 = *MEMORY[0x24BDF8468];
  return v1;
}

id static UTType.m3uPlaylist.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8460];
  *a1 = *MEMORY[0x24BDF8460];
  return v1;
}

id static UTType.volume.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8648];
  *a1 = *MEMORY[0x24BDF8648];
  return v1;
}

id static UTType.bundle.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8300];
  *a1 = *MEMORY[0x24BDF8300];
  return v1;
}

id static UTType.pluginBundle.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8520];
  *a1 = *MEMORY[0x24BDF8520];
  return v1;
}

id static UTType.spotlightImporter.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF85A8];
  *a1 = *MEMORY[0x24BDF85A8];
  return v1;
}

id static UTType.quickLookGenerator.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8540];
  *a1 = *MEMORY[0x24BDF8540];
  return v1;
}

id static UTType.xpcService.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8680];
  *a1 = *MEMORY[0x24BDF8680];
  return v1;
}

id static UTType.framework.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF83D0];
  *a1 = *MEMORY[0x24BDF83D0];
  return v1;
}

id static UTType.application.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF82A8];
  *a1 = *MEMORY[0x24BDF82A8];
  return v1;
}

id static UTType.applicationBundle.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF82B0];
  *a1 = *MEMORY[0x24BDF82B0];
  return v1;
}

id static UTType.applicationExtension.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF82B8];
  *a1 = *MEMORY[0x24BDF82B8];
  return v1;
}

id static UTType.unixExecutable.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8630];
  *a1 = *MEMORY[0x24BDF8630];
  return v1;
}

id static UTType.exe.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8388];
  *a1 = *MEMORY[0x24BDF8388];
  return v1;
}

id static UTType.systemPreferencesPane.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF85C8];
  *a1 = *MEMORY[0x24BDF85C8];
  return v1;
}

id static UTType.gzip.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF83E0];
  *a1 = *MEMORY[0x24BDF83E0];
  return v1;
}

id static UTType.bz2.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF82E8];
  *a1 = *MEMORY[0x24BDF82E8];
  return v1;
}

id static UTType.zip.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8690];
  *a1 = *MEMORY[0x24BDF8690];
  return v1;
}

id static UTType.appleArchive.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8288];
  *a1 = *MEMORY[0x24BDF8288];
  return v1;
}

void static UTType.tarArchive.getter(_QWORD *a1@<X8>)
{
  static UTType.css.getter(a1);
}

id static UTType.database.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8358];
  *a1 = *MEMORY[0x24BDF8358];
  return v1;
}

id static UTType.message.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF84A8];
  *a1 = *MEMORY[0x24BDF84A8];
  return v1;
}

id static UTType.contact.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8340];
  *a1 = *MEMORY[0x24BDF8340];
  return v1;
}

id static UTType.vCard.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8638];
  *a1 = *MEMORY[0x24BDF8638];
  return v1;
}

id static UTType.toDoItem.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF85E8];
  *a1 = *MEMORY[0x24BDF85E8];
  return v1;
}

id static UTType.calendarEvent.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8328];
  *a1 = *MEMORY[0x24BDF8328];
  return v1;
}

id static UTType.emailMessage.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8398];
  *a1 = *MEMORY[0x24BDF8398];
  return v1;
}

id static UTType.internetLocation.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8418];
  *a1 = *MEMORY[0x24BDF8418];
  return v1;
}

id static UTType.internetShortcut.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8420];
  *a1 = *MEMORY[0x24BDF8420];
  return v1;
}

id static UTType.font.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF83C8];
  *a1 = *MEMORY[0x24BDF83C8];
  return v1;
}

id static UTType.bookmark.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF82F8];
  *a1 = *MEMORY[0x24BDF82F8];
  return v1;
}

id static UTType.pkcs12.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF84F0];
  *a1 = *MEMORY[0x24BDF84F0];
  return v1;
}

id static UTType.x509Certificate.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8668];
  *a1 = *MEMORY[0x24BDF8668];
  return v1;
}

id static UTType.epub.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8380];
  *a1 = *MEMORY[0x24BDF8380];
  return v1;
}

id static UTType.log.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8458];
  *a1 = *MEMORY[0x24BDF8458];
  return v1;
}

id static UTType.ahap.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8260];
  *a1 = *MEMORY[0x24BDF8260];
  return v1;
}

void static UTType.geoJSON.getter(_QWORD *a1@<X8>)
{
  static UTType.css.getter(a1);
}

void static UTType.linkPresentationMetadata.getter(_QWORD *a1@<X8>)
{
  static UTType.css.getter(a1);
}

char *static UTType._namedConstants_UTCoreTypes.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void **v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void **v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void **v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void **v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void **v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void **v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void **v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void **v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void **v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void **v47;
  void **v48;
  void **v49;
  void **v50;
  void **v51;
  void **v52;
  void **v53;
  void **v54;
  void **v55;
  void **v56;
  void **v57;
  void **v58;
  void **v59;
  void **v60;
  void **v61;
  void **v62;
  void **v63;
  void **v64;
  void **v65;
  void **v66;
  void **v67;
  void **v68;
  void **v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  id v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id v190;
  id v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  char *v201;
  unint64_t v202;
  id v203;
  void *v204;
  void *v205;
  id v206;
  unint64_t v207;
  unint64_t v208;
  void *v209;
  id v210;
  unint64_t v211;
  unint64_t v212;
  void *v213;
  id v214;
  unint64_t v215;
  unint64_t v216;
  void *v217;
  id v218;
  unint64_t v219;
  unint64_t v220;
  void *v221;
  id v222;
  unint64_t v223;
  unint64_t v224;
  void *v225;
  id v226;
  unint64_t v227;
  unint64_t v228;
  void *v229;
  id v230;
  unint64_t v231;
  unint64_t v232;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UTType>);
  v0 = swift_allocObject();
  v1 = (void **)MEMORY[0x24BDF8430];
  *(_OWORD *)(v0 + 16) = xmmword_20830C360;
  v2 = *v1;
  v3 = (void *)*MEMORY[0x24BDF8348];
  *(_QWORD *)(v0 + 32) = v2;
  *(_QWORD *)(v0 + 40) = v3;
  v4 = (void *)*MEMORY[0x24BDF8338];
  v5 = (void *)*MEMORY[0x24BDF8378];
  *(_QWORD *)(v0 + 48) = *MEMORY[0x24BDF8338];
  *(_QWORD *)(v0 + 56) = v5;
  v6 = (void *)*MEMORY[0x24BDF8350];
  v7 = (void *)*MEMORY[0x24BDF8368];
  v8 = (void **)MEMORY[0x24BDF8570];
  *(_QWORD *)(v0 + 64) = *MEMORY[0x24BDF8350];
  *(_QWORD *)(v0 + 72) = v7;
  v9 = *v8;
  v10 = (void *)*MEMORY[0x24BDF85C0];
  *(_QWORD *)(v0 + 80) = *v8;
  *(_QWORD *)(v0 + 88) = v10;
  v11 = (void *)*MEMORY[0x24BDF83A0];
  v12 = (void *)*MEMORY[0x24BDF84B0];
  *(_QWORD *)(v0 + 96) = *MEMORY[0x24BDF83A0];
  *(_QWORD *)(v0 + 104) = v12;
  v234 = (void *)*MEMORY[0x24BDF8280];
  v235 = (void *)*MEMORY[0x24BDF85F8];
  v13 = *MEMORY[0x24BDF85F8];
  v14 = (void **)MEMORY[0x24BDF85F0];
  *(_QWORD *)(v0 + 112) = *MEMORY[0x24BDF8280];
  *(_QWORD *)(v0 + 120) = v13;
  v236 = *v14;
  v239 = (void *)*MEMORY[0x24BDF83A8];
  v15 = *MEMORY[0x24BDF83A8];
  *(_QWORD *)(v0 + 128) = v236;
  *(_QWORD *)(v0 + 136) = v15;
  v237 = (void *)*MEMORY[0x24BDF85E0];
  v240 = (void *)*MEMORY[0x24BDF8510];
  v16 = *MEMORY[0x24BDF8510];
  *(_QWORD *)(v0 + 144) = *MEMORY[0x24BDF85E0];
  *(_QWORD *)(v0 + 152) = v16;
  v238 = (void *)*MEMORY[0x24BDF8620];
  v241 = (void *)*MEMORY[0x24BDF8610];
  v17 = *MEMORY[0x24BDF8610];
  v18 = (void **)MEMORY[0x24BDF8618];
  *(_QWORD *)(v0 + 160) = *MEMORY[0x24BDF8620];
  *(_QWORD *)(v0 + 168) = v17;
  v242 = *v18;
  v245 = (void *)*MEMORY[0x24BDF8360];
  v19 = *MEMORY[0x24BDF8360];
  *(_QWORD *)(v0 + 176) = v242;
  *(_QWORD *)(v0 + 184) = v19;
  v243 = (void *)*MEMORY[0x24BDF8330];
  v246 = (void *)*MEMORY[0x24BDF85D8];
  v20 = *MEMORY[0x24BDF85D8];
  *(_QWORD *)(v0 + 192) = *MEMORY[0x24BDF8330];
  *(_QWORD *)(v0 + 200) = v20;
  v244 = (void *)*MEMORY[0x24BDF8628];
  v247 = (void *)*MEMORY[0x24BDF8558];
  v21 = *MEMORY[0x24BDF8558];
  v22 = (void **)MEMORY[0x24BDF83F8];
  *(_QWORD *)(v0 + 208) = *MEMORY[0x24BDF8628];
  *(_QWORD *)(v0 + 216) = v21;
  v248 = *v22;
  v250 = (void *)*MEMORY[0x24BDF8670];
  v23 = *MEMORY[0x24BDF8670];
  *(_QWORD *)(v0 + 224) = v248;
  *(_QWORD *)(v0 + 232) = v23;
  v249 = (void *)*MEMORY[0x24BDF8688];
  v252 = (void *)*MEMORY[0x24BDF85A0];
  v24 = *MEMORY[0x24BDF85A0];
  *(_QWORD *)(v0 + 240) = *MEMORY[0x24BDF8688];
  *(_QWORD *)(v0 + 248) = v24;
  v251 = (void *)*MEMORY[0x24BDF82C8];
  v253 = (void *)*MEMORY[0x24BDF8320];
  v25 = *MEMORY[0x24BDF8320];
  *(_QWORD *)(v0 + 256) = *MEMORY[0x24BDF82C8];
  v26 = (void **)MEMORY[0x24BDF84D8];
  *(_QWORD *)(v0 + 264) = v25;
  v254 = *v26;
  v256 = (void *)*MEMORY[0x24BDF85B8];
  v27 = *MEMORY[0x24BDF85B8];
  *(_QWORD *)(v0 + 272) = v254;
  *(_QWORD *)(v0 + 280) = v27;
  v255 = (void *)*MEMORY[0x24BDF8318];
  v258 = (void *)*MEMORY[0x24BDF84D0];
  v28 = *MEMORY[0x24BDF84D0];
  *(_QWORD *)(v0 + 288) = *MEMORY[0x24BDF8318];
  *(_QWORD *)(v0 + 296) = v28;
  v257 = (void *)*MEMORY[0x24BDF8308];
  v259 = (void *)*MEMORY[0x24BDF8310];
  v29 = *MEMORY[0x24BDF8310];
  *(_QWORD *)(v0 + 304) = *MEMORY[0x24BDF8308];
  v30 = (void **)MEMORY[0x24BDF8590];
  *(_QWORD *)(v0 + 312) = v29;
  v260 = *v30;
  v262 = (void *)*MEMORY[0x24BDF82A0];
  v31 = *MEMORY[0x24BDF82A0];
  *(_QWORD *)(v0 + 320) = v260;
  *(_QWORD *)(v0 + 328) = v31;
  v261 = (void *)*MEMORY[0x24BDF84C0];
  v264 = (void *)*MEMORY[0x24BDF84C8];
  v32 = *MEMORY[0x24BDF84C8];
  *(_QWORD *)(v0 + 336) = *MEMORY[0x24BDF84C0];
  *(_QWORD *)(v0 + 344) = v32;
  v263 = (void *)*MEMORY[0x24BDF8448];
  v265 = (void *)*MEMORY[0x24BDF8598];
  v33 = *MEMORY[0x24BDF8598];
  *(_QWORD *)(v0 + 352) = *MEMORY[0x24BDF8448];
  v34 = (void **)MEMORY[0x24BDF8508];
  *(_QWORD *)(v0 + 360) = v33;
  v266 = *v34;
  v268 = (void *)*MEMORY[0x24BDF8538];
  v35 = *MEMORY[0x24BDF8538];
  *(_QWORD *)(v0 + 368) = v266;
  *(_QWORD *)(v0 + 376) = v35;
  v267 = (void *)*MEMORY[0x24BDF8578];
  v270 = (void *)*MEMORY[0x24BDF84E8];
  v36 = *MEMORY[0x24BDF84E8];
  *(_QWORD *)(v0 + 384) = *MEMORY[0x24BDF8578];
  *(_QWORD *)(v0 + 392) = v36;
  v269 = (void *)*MEMORY[0x24BDF8440];
  v271 = (void *)*MEMORY[0x24BDF8530];
  v37 = *MEMORY[0x24BDF8530];
  *(_QWORD *)(v0 + 400) = *MEMORY[0x24BDF8440];
  v38 = (void **)MEMORY[0x24BDF8678];
  *(_QWORD *)(v0 + 408) = v37;
  v272 = *v38;
  v274 = (void *)*MEMORY[0x24BDF82F0];
  v39 = *MEMORY[0x24BDF82F0];
  *(_QWORD *)(v0 + 416) = v272;
  *(_QWORD *)(v0 + 424) = v39;
  v273 = (void *)*MEMORY[0x24BDF84E0];
  v276 = (void *)*MEMORY[0x24BDF8560];
  v40 = *MEMORY[0x24BDF8560];
  *(_QWORD *)(v0 + 432) = *MEMORY[0x24BDF84E0];
  *(_QWORD *)(v0 + 440) = v40;
  v275 = (void *)*MEMORY[0x24BDF83B0];
  v277 = (void *)*MEMORY[0x24BDF8658];
  v41 = *MEMORY[0x24BDF8658];
  *(_QWORD *)(v0 + 448) = *MEMORY[0x24BDF83B0];
  v42 = (void **)MEMORY[0x24BDF8410];
  *(_QWORD *)(v0 + 456) = v41;
  v278 = *v42;
  v280 = (void *)*MEMORY[0x24BDF8438];
  v43 = *MEMORY[0x24BDF8438];
  *(_QWORD *)(v0 + 464) = v278;
  *(_QWORD *)(v0 + 472) = v43;
  v279 = (void *)*MEMORY[0x24BDF85D0];
  v282 = (void *)*MEMORY[0x24BDF83D8];
  v44 = *MEMORY[0x24BDF83D8];
  *(_QWORD *)(v0 + 480) = *MEMORY[0x24BDF85D0];
  *(_QWORD *)(v0 + 488) = v44;
  v281 = (void *)*MEMORY[0x24BDF84F8];
  v283 = (void *)*MEMORY[0x24BDF8400];
  v45 = *MEMORY[0x24BDF8400];
  *(_QWORD *)(v0 + 496) = *MEMORY[0x24BDF84F8];
  v284 = (void *)*MEMORY[0x24BDF82E0];
  v46 = *MEMORY[0x24BDF82E0];
  *(_QWORD *)(v0 + 504) = v45;
  *(_QWORD *)(v0 + 512) = v46;
  v286 = (void *)*MEMORY[0x24BDF8408];
  *(_QWORD *)(v0 + 520) = *MEMORY[0x24BDF8408];
  v285 = (void *)*MEMORY[0x24BDF8550];
  v47 = (void **)MEMORY[0x24BDF8580];
  *(_QWORD *)(v0 + 528) = *MEMORY[0x24BDF8550];
  v287 = *v47;
  *(_QWORD *)(v0 + 536) = *v47;
  v289 = (void *)*MEMORY[0x24BDF8450];
  *(_QWORD *)(v0 + 544) = *MEMORY[0x24BDF8450];
  v288 = (void *)*MEMORY[0x24BDF83F0];
  v48 = (void **)MEMORY[0x24BDF83E8];
  *(_QWORD *)(v0 + 552) = *MEMORY[0x24BDF83F0];
  v290 = *v48;
  *(_QWORD *)(v0 + 560) = *v48;
  v292 = (void *)*MEMORY[0x24BDF8660];
  *(_QWORD *)(v0 + 568) = *MEMORY[0x24BDF8660];
  v291 = (void *)*MEMORY[0x24BDF8258];
  v49 = (void **)MEMORY[0x24BDF8600];
  *(_QWORD *)(v0 + 576) = *MEMORY[0x24BDF8258];
  v293 = *v49;
  *(_QWORD *)(v0 + 584) = *v49;
  v295 = (void *)*MEMORY[0x24BDF8608];
  *(_QWORD *)(v0 + 592) = *MEMORY[0x24BDF8608];
  v294 = (void *)*MEMORY[0x24BDF8568];
  v50 = (void **)MEMORY[0x24BDF8588];
  *(_QWORD *)(v0 + 600) = *MEMORY[0x24BDF8568];
  v296 = *v50;
  *(_QWORD *)(v0 + 608) = *v50;
  v298 = (void *)*MEMORY[0x24BDF8270];
  *(_QWORD *)(v0 + 616) = *MEMORY[0x24BDF8270];
  v297 = (void *)*MEMORY[0x24BDF82D8];
  v51 = (void **)MEMORY[0x24BDF84B8];
  *(_QWORD *)(v0 + 624) = *MEMORY[0x24BDF82D8];
  v299 = *v51;
  *(_QWORD *)(v0 + 632) = *v51;
  v301 = (void *)*MEMORY[0x24BDF8640];
  *(_QWORD *)(v0 + 640) = *MEMORY[0x24BDF8640];
  v300 = (void *)*MEMORY[0x24BDF82D0];
  v52 = (void **)MEMORY[0x24BDF8548];
  *(_QWORD *)(v0 + 648) = *MEMORY[0x24BDF82D0];
  v302 = *v52;
  *(_QWORD *)(v0 + 656) = *v52;
  v304 = (void *)*MEMORY[0x24BDF8478];
  *(_QWORD *)(v0 + 664) = *MEMORY[0x24BDF8478];
  v303 = (void *)*MEMORY[0x24BDF8488];
  v53 = (void **)MEMORY[0x24BDF8480];
  *(_QWORD *)(v0 + 672) = *MEMORY[0x24BDF8488];
  v305 = *v53;
  *(_QWORD *)(v0 + 680) = *v53;
  v307 = (void *)*MEMORY[0x24BDF8470];
  *(_QWORD *)(v0 + 688) = *MEMORY[0x24BDF8470];
  v306 = (void *)*MEMORY[0x24BDF8498];
  v54 = (void **)MEMORY[0x24BDF8490];
  *(_QWORD *)(v0 + 696) = *MEMORY[0x24BDF8498];
  v308 = *v54;
  *(_QWORD *)(v0 + 704) = *v54;
  v310 = (void *)*MEMORY[0x24BDF8290];
  *(_QWORD *)(v0 + 712) = *MEMORY[0x24BDF8290];
  v309 = (void *)*MEMORY[0x24BDF8298];
  v55 = (void **)MEMORY[0x24BDF8278];
  *(_QWORD *)(v0 + 720) = *MEMORY[0x24BDF8298];
  v311 = *v55;
  *(_QWORD *)(v0 + 728) = *v55;
  v313 = (void *)*MEMORY[0x24BDF8268];
  *(_QWORD *)(v0 + 736) = *MEMORY[0x24BDF8268];
  v312 = (void *)*MEMORY[0x24BDF8650];
  v56 = (void **)MEMORY[0x24BDF8468];
  *(_QWORD *)(v0 + 744) = *MEMORY[0x24BDF8650];
  v314 = *v56;
  *(_QWORD *)(v0 + 752) = *v56;
  v316 = (void *)*MEMORY[0x24BDF8518];
  *(_QWORD *)(v0 + 760) = *MEMORY[0x24BDF8518];
  v315 = (void *)*MEMORY[0x24BDF8460];
  v57 = (void **)MEMORY[0x24BDF83C0];
  *(_QWORD *)(v0 + 768) = *MEMORY[0x24BDF8460];
  v317 = *v57;
  *(_QWORD *)(v0 + 776) = *v57;
  v319 = (void *)*MEMORY[0x24BDF8648];
  *(_QWORD *)(v0 + 784) = *MEMORY[0x24BDF8648];
  v318 = (void *)*MEMORY[0x24BDF8500];
  v58 = (void **)MEMORY[0x24BDF8300];
  *(_QWORD *)(v0 + 792) = *MEMORY[0x24BDF8500];
  v320 = *v58;
  *(_QWORD *)(v0 + 800) = *v58;
  v322 = (void *)*MEMORY[0x24BDF8520];
  *(_QWORD *)(v0 + 808) = *MEMORY[0x24BDF8520];
  v321 = (void *)*MEMORY[0x24BDF85A8];
  v59 = (void **)MEMORY[0x24BDF8540];
  *(_QWORD *)(v0 + 816) = *MEMORY[0x24BDF85A8];
  v323 = *v59;
  *(_QWORD *)(v0 + 824) = *v59;
  v325 = (void *)*MEMORY[0x24BDF8680];
  *(_QWORD *)(v0 + 832) = *MEMORY[0x24BDF8680];
  v324 = (void *)*MEMORY[0x24BDF83D0];
  v60 = (void **)MEMORY[0x24BDF82A8];
  *(_QWORD *)(v0 + 840) = *MEMORY[0x24BDF83D0];
  v326 = *v60;
  *(_QWORD *)(v0 + 848) = *v60;
  v328 = (void *)*MEMORY[0x24BDF82B0];
  *(_QWORD *)(v0 + 856) = *MEMORY[0x24BDF82B0];
  v327 = (void *)*MEMORY[0x24BDF82B8];
  v61 = (void **)MEMORY[0x24BDF8630];
  *(_QWORD *)(v0 + 864) = *MEMORY[0x24BDF82B8];
  v329 = *v61;
  *(_QWORD *)(v0 + 872) = *v61;
  v331 = (void *)*MEMORY[0x24BDF8388];
  *(_QWORD *)(v0 + 880) = *MEMORY[0x24BDF8388];
  v330 = (void *)*MEMORY[0x24BDF85C8];
  v62 = (void **)MEMORY[0x24BDF82C0];
  *(_QWORD *)(v0 + 888) = *MEMORY[0x24BDF85C8];
  v332 = *v62;
  *(_QWORD *)(v0 + 896) = *v62;
  v334 = (void *)*MEMORY[0x24BDF83E0];
  *(_QWORD *)(v0 + 904) = *MEMORY[0x24BDF83E0];
  v333 = (void *)*MEMORY[0x24BDF82E8];
  v63 = (void **)MEMORY[0x24BDF8690];
  *(_QWORD *)(v0 + 912) = *MEMORY[0x24BDF82E8];
  v335 = *v63;
  *(_QWORD *)(v0 + 920) = *v63;
  v337 = (void *)*MEMORY[0x24BDF8288];
  *(_QWORD *)(v0 + 928) = *MEMORY[0x24BDF8288];
  v336 = (void *)*MEMORY[0x24BDF85B0];
  v64 = (void **)MEMORY[0x24BDF8528];
  *(_QWORD *)(v0 + 936) = *MEMORY[0x24BDF85B0];
  v338 = *v64;
  *(_QWORD *)(v0 + 944) = *v64;
  v340 = (void *)*MEMORY[0x24BDF8358];
  *(_QWORD *)(v0 + 952) = *MEMORY[0x24BDF8358];
  v339 = (void *)*MEMORY[0x24BDF84A8];
  v65 = (void **)MEMORY[0x24BDF8340];
  *(_QWORD *)(v0 + 960) = *MEMORY[0x24BDF84A8];
  v341 = *v65;
  *(_QWORD *)(v0 + 968) = *v65;
  v343 = (void *)*MEMORY[0x24BDF8638];
  *(_QWORD *)(v0 + 976) = *MEMORY[0x24BDF8638];
  v342 = (void *)*MEMORY[0x24BDF85E8];
  v66 = (void **)MEMORY[0x24BDF8328];
  *(_QWORD *)(v0 + 984) = *MEMORY[0x24BDF85E8];
  v344 = *v66;
  *(_QWORD *)(v0 + 992) = *v66;
  v346 = (void *)*MEMORY[0x24BDF8398];
  *(_QWORD *)(v0 + 1000) = *MEMORY[0x24BDF8398];
  v345 = (void *)*MEMORY[0x24BDF8418];
  v67 = (void **)MEMORY[0x24BDF8420];
  *(_QWORD *)(v0 + 1008) = *MEMORY[0x24BDF8418];
  v347 = *v67;
  *(_QWORD *)(v0 + 1016) = *v67;
  v349 = (void *)*MEMORY[0x24BDF83C8];
  *(_QWORD *)(v0 + 1024) = *MEMORY[0x24BDF83C8];
  v348 = (void *)*MEMORY[0x24BDF82F8];
  v68 = (void **)MEMORY[0x24BDF84F0];
  *(_QWORD *)(v0 + 1032) = *MEMORY[0x24BDF82F8];
  v350 = *v68;
  *(_QWORD *)(v0 + 1040) = *v68;
  v352 = (void *)*MEMORY[0x24BDF8668];
  *(_QWORD *)(v0 + 1048) = *MEMORY[0x24BDF8668];
  v351 = (void *)*MEMORY[0x24BDF8380];
  v69 = (void **)MEMORY[0x24BDF8458];
  *(_QWORD *)(v0 + 1056) = *MEMORY[0x24BDF8380];
  v353 = *v69;
  *(_QWORD *)(v0 + 1064) = *v69;
  v354 = (void *)*MEMORY[0x24BDF84A0];
  v70 = v2;
  v71 = v3;
  v72 = v4;
  v73 = v5;
  v74 = v6;
  v75 = v7;
  v76 = v9;
  v77 = v10;
  v78 = v11;
  v79 = v12;
  v80 = v234;
  v81 = v235;
  v82 = v236;
  v83 = v239;
  v84 = v237;
  v85 = v240;
  v86 = v238;
  v87 = v241;
  v88 = v242;
  v89 = v245;
  v90 = v243;
  v91 = v246;
  v92 = v244;
  v93 = v247;
  v94 = v248;
  v95 = v250;
  v96 = v249;
  v97 = v252;
  v98 = v251;
  v99 = v253;
  v100 = v254;
  v101 = v256;
  v102 = v255;
  v103 = v258;
  v104 = v257;
  v105 = v259;
  v106 = v260;
  v107 = v262;
  v108 = v261;
  v109 = v264;
  v110 = v263;
  v111 = v265;
  v112 = v266;
  v113 = v268;
  v114 = v267;
  v115 = v270;
  v116 = v269;
  v117 = v271;
  v118 = v272;
  v119 = v274;
  v120 = v273;
  v121 = v276;
  v122 = v275;
  v123 = v277;
  v124 = v278;
  v125 = v280;
  v126 = v279;
  v127 = v282;
  v128 = v281;
  v129 = v283;
  v130 = v284;
  v131 = v286;
  v132 = v285;
  v133 = v287;
  v134 = v289;
  v135 = v288;
  v136 = v290;
  v137 = v292;
  v138 = v291;
  v139 = v293;
  v140 = v295;
  v141 = v294;
  v142 = v296;
  v143 = v298;
  v144 = v297;
  v145 = v299;
  v146 = v301;
  v147 = v300;
  v148 = v302;
  v149 = v304;
  v150 = v303;
  v151 = v305;
  v152 = v307;
  v153 = v306;
  v154 = v308;
  v155 = v310;
  v156 = v309;
  v157 = v311;
  v158 = v313;
  v159 = v312;
  v160 = v314;
  v161 = v316;
  v162 = v315;
  v163 = v317;
  v164 = v319;
  v165 = v318;
  v166 = v320;
  v167 = v322;
  v168 = v321;
  v169 = v323;
  v170 = v325;
  v171 = v324;
  v172 = v326;
  v173 = v328;
  v174 = v327;
  v175 = v329;
  v176 = v331;
  v177 = v330;
  v178 = v332;
  v179 = v334;
  v180 = v333;
  v181 = v335;
  v182 = v337;
  v183 = v336;
  v184 = v338;
  v185 = v340;
  v186 = v339;
  v187 = v341;
  v188 = v343;
  v189 = v342;
  v190 = v344;
  v191 = v346;
  v192 = v345;
  v193 = v347;
  v194 = v349;
  v195 = v348;
  v196 = v350;
  v197 = v352;
  v198 = v351;
  v199 = v353;
  v200 = v354;
  v201 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)1, 131, 1, (char *)v0);
  *((_QWORD *)v201 + 2) = 131;
  *((_QWORD *)v201 + 134) = v200;
  v202 = *((_QWORD *)v201 + 3);
  v203 = (id)*MEMORY[0x24BDF8260];
  if (v202 <= 0x107)
    v201 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v202 > 1), 132, 1, v201);
  *((_QWORD *)v201 + 2) = 132;
  *((_QWORD *)v201 + 135) = v203;
  v204 = (void *)MEMORY[0x20BD03B98](0x632E63696C627570, 0xEA00000000007373);
  v205 = (void *)objc_opt_self();
  v206 = objc_msgSend(v205, sel_typeWithIdentifier_, v204);

  if (!v206)
  {
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v208 = *((_QWORD *)v201 + 2);
  v207 = *((_QWORD *)v201 + 3);
  if (v208 >= v207 >> 1)
    v201 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v207 > 1), v208 + 1, 1, v201);
  *((_QWORD *)v201 + 2) = v208 + 1;
  *(_QWORD *)&v201[8 * v208 + 32] = v206;
  v209 = (void *)MEMORY[0x20BD03B98](0x682E63696C627570, 0xEC00000073636965);
  v210 = objc_msgSend(v205, sel_typeWithIdentifier_, v209);

  if (!v210)
    goto LABEL_26;
  v212 = *((_QWORD *)v201 + 2);
  v211 = *((_QWORD *)v201 + 3);
  if (v212 >= v211 >> 1)
    v201 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v211 > 1), v212 + 1, 1, v201);
  *((_QWORD *)v201 + 2) = v212 + 1;
  *(_QWORD *)&v201[8 * v212 + 32] = v210;
  v213 = (void *)MEMORY[0x20BD03B98](0xD000000000000015, 0x800000020830C940);
  v214 = objc_msgSend(v205, sel_typeWithIdentifier_, v213);

  if (!v214)
    goto LABEL_27;
  v216 = *((_QWORD *)v201 + 2);
  v215 = *((_QWORD *)v201 + 3);
  if (v216 >= v215 >> 1)
    v201 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v215 > 1), v216 + 1, 1, v201);
  *((_QWORD *)v201 + 2) = v216 + 1;
  *(_QWORD *)&v201[8 * v216 + 32] = v214;
  v217 = (void *)MEMORY[0x20BD03B98](0xD000000000000013, 0x800000020830C960);
  v218 = objc_msgSend(v205, sel_typeWithIdentifier_, v217);

  if (!v218)
    goto LABEL_28;
  v220 = *((_QWORD *)v201 + 2);
  v219 = *((_QWORD *)v201 + 3);
  if (v220 >= v219 >> 1)
    v201 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v219 > 1), v220 + 1, 1, v201);
  *((_QWORD *)v201 + 2) = v220 + 1;
  *(_QWORD *)&v201[8 * v220 + 32] = v218;
  v221 = (void *)MEMORY[0x20BD03B98](0xD000000000000012, 0x800000020830C980);
  v222 = objc_msgSend(v205, sel_typeWithIdentifier_, v221);

  if (!v222)
    goto LABEL_29;
  v224 = *((_QWORD *)v201 + 2);
  v223 = *((_QWORD *)v201 + 3);
  if (v224 >= v223 >> 1)
    v201 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v223 > 1), v224 + 1, 1, v201);
  *((_QWORD *)v201 + 2) = v224 + 1;
  *(_QWORD *)&v201[8 * v224 + 32] = v222;
  v225 = (void *)MEMORY[0x20BD03B98](0x672E63696C627570, 0xEE006E6F736A6F65);
  v226 = objc_msgSend(v205, sel_typeWithIdentifier_, v225);

  if (!v226)
    goto LABEL_30;
  v228 = *((_QWORD *)v201 + 2);
  v227 = *((_QWORD *)v201 + 3);
  if (v228 >= v227 >> 1)
    v201 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v227 > 1), v228 + 1, 1, v201);
  *((_QWORD *)v201 + 2) = v228 + 1;
  *(_QWORD *)&v201[8 * v228 + 32] = v226;
  v229 = (void *)MEMORY[0x20BD03B98](0xD000000000000023, 0x800000020830C9A0);
  v230 = objc_msgSend(v205, sel_typeWithIdentifier_, v229);

  if (!v230)
LABEL_31:
    __break(1u);
  v232 = *((_QWORD *)v201 + 2);
  v231 = *((_QWORD *)v201 + 3);
  if (v232 >= v231 >> 1)
    v201 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v231 > 1), v232 + 1, 1, v201);
  *((_QWORD *)v201 + 2) = v232 + 1;
  *(_QWORD *)&v201[8 * v232 + 32] = v230;
  return v201;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UTType>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

id NSItemProvider.init(contentsOf:contentType:openInPlace:coordinated:visibility:)@<X0>(uint64_t a1@<X0>, void **a2@<X1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X4>, NSURL *a6@<X8>)
{
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;

  v10 = *a2;
  URL._bridgeToObjectiveC()(a6);
  v12 = v11;
  v13 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithContentsOfURL_contentType_openInPlace_coordinated_visibility_, v11, v10, a3 & 1, a4 & 1, a5);

  v14 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(a1, v14);
  return v13;
}

void NSItemProvider.registerDataRepresentation(for:visibility:loadHandler:)(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[6];

  v6 = *a1;
  v9[4] = a3;
  v9[5] = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?);
  v9[3] = &block_descriptor;
  v7 = _Block_copy(v9);
  v8 = v6;
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_registerDataRepresentationForContentType_visibility_loadHandler_, v8, a2, v7);
  _Block_release(v7);

}

id thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?)(uint64_t a1, void *a2)
{
  return thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?)(a1, a2, (uint64_t)&unk_24C092180, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSData?, @unowned NSError?) -> ());
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

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSData?, @unowned NSError?) -> ()(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  Class isa;
  uint64_t v7;
  id v8;

  if (a2 >> 60 != 15)
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    if (a3)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  isa = 0;
  if (!a3)
    goto LABEL_5;
LABEL_3:
  v7 = _convertErrorToNSError(_:)();
LABEL_6:
  v8 = (id)v7;
  (*(void (**)(uint64_t, Class))(a4 + 16))(a4, isa);

}

void NSItemProvider.registerFileRepresentation(for:visibility:openInPlace:loadHandler:)(void **a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[6];

  v8 = *a1;
  v11[4] = a4;
  v11[5] = a5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed (@in_guaranteed URL?, @unowned Bool, @guaranteed Error?) -> ()) -> (@owned NSProgress?);
  v11[3] = &block_descriptor_3;
  v9 = _Block_copy(v11);
  v10 = v8;
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_registerFileRepresentationForContentType_visibility_openInPlace_loadHandler_, v10, a2, a3 & 1, v9);
  _Block_release(v9);

}

id thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed (@in_guaranteed URL?, @unowned Bool, @guaranteed Error?) -> ()) -> (@owned NSProgress?)(uint64_t a1, void *a2)
{
  return thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?)(a1, a2, (uint64_t)&unk_24C092158, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSURL?, @unowned Bool, @unowned NSError?) -> ());
}

id thunk for @escaping @callee_guaranteed @Sendable (@guaranteed @escaping @callee_guaranteed (@guaranteed Data?, @guaranteed Error?) -> ()) -> (@owned NSProgress?)(uint64_t a1, void *aBlock, uint64_t a3, uint64_t a4)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  v6 = _Block_copy(aBlock);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  swift_retain();
  v8 = (void *)v5(a4, v7);
  swift_release();
  swift_release();
  return v8;
}

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSURL?, @unowned Bool, @unowned NSError?) -> ()(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSURL *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of URL?(a1, (uint64_t)v9);
  v10 = type metadata accessor for URL();
  v11 = *(_QWORD *)(v10 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
  {
    URL._bridgeToObjectiveC()(v12);
    v13 = v14;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
  }
  if (a3)
    v15 = (void *)_convertErrorToNSError(_:)();
  else
    v15 = 0;
  (*(void (**)(uint64_t, void *, _QWORD, void *))(a4 + 16))(a4, v13, a2 & 1, v15);

}

id NSItemProvider.loadDataRepresentation(for:completionHandler:)(void **a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[6];

  v4 = *a1;
  v9[4] = a2;
  v9[5] = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ();
  v9[3] = &block_descriptor_6;
  v5 = _Block_copy(v9);
  v6 = v4;
  swift_retain();
  swift_release();
  v7 = objc_msgSend(v3, sel_loadDataRepresentationForContentType_completionHandler_, v6, v5);
  _Block_release(v5);

  return v7;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ()(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void (*v5)(void *, unint64_t, void *);
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v4 = a2;
  v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v6 = v4;
    v4 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;

  }
  else
  {
    swift_retain();
    v8 = 0xF000000000000000;
  }
  v9 = a3;
  v5(v4, v8, a3);

  outlined consume of Data?((uint64_t)v4, v8);
  return swift_release();
}

id NSItemProvider.loadFileRepresentation(for:openInPlace:completionHandler:)(void **a1, char a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[6];

  v6 = *a1;
  v11[4] = a3;
  v11[5] = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed URL?, @unowned Bool, @guaranteed Error?) -> ();
  v11[3] = &block_descriptor_9;
  v7 = _Block_copy(v11);
  v8 = v6;
  swift_retain();
  swift_release();
  v9 = objc_msgSend(v4, sel_loadFileRepresentationForContentType_openInPlace_completionHandler_, v8, a2 & 1, v7);
  _Block_release(v7);

  return v9;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed URL?, @unowned Bool, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8;
  char *v9;
  void (*v10)(char *, uint64_t, void *);
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void (**)(char *, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    v11 = type metadata accessor for URL();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 0, 1, v11);
  }
  else
  {
    v12 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  }
  swift_retain();
  v13 = a4;
  v10(v9, a3, a4);
  swift_release();

  return outlined destroy of URL?((uint64_t)v9);
}

uint64_t outlined destroy of URL?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

uint64_t sub_20830832C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSURL?, @unowned Bool, @unowned NSError?) -> ()(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;

  thunk for @escaping @callee_unowned @convention(block) (@unowned NSURL?, @unowned Bool, @unowned NSError?) -> ()(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t outlined init with copy of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSData?, @unowned NSError?) -> ()(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;

  thunk for @escaping @callee_unowned @convention(block) (@unowned NSData?, @unowned NSError?) -> ()(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t Encoder.encodeSingleValueSafely<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v16;
  _QWORD v17[7];

  v17[6] = a1;
  v7 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v17[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(MEMORY[0x20BD03D90](v10, v11) + 16);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3, a2);
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a2);
  }
  else
  {
    v17[0] = swift_getDynamicType();
    swift_getMetatypeMetadata();
    String.init<A>(describing:)();
    v16 = a3;
    v13 = specialized Sequence<>.starts<A>(with:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a2);
    if ((v13 & 1) != 0)
    {
      v14 = 0;
      return v14 & 1;
    }
  }
  dispatch thunk of Encoder.singleValueContainer()();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v17, v17[3]);
  dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  if (!v4)
    v14 = 1;
  return v14 & 1;
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

uint64_t specialized Sequence<>.starts<A>(with:)()
{
  Swift::String_optional v0;
  uint64_t countAndFlagsBits;
  void *object;
  char v3;
  Swift::String_optional v4;
  Swift::String_optional v5;
  void *v6;
  _BOOL8 v7;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v0 = String.Iterator.next()();
  if (v0.value._object)
  {
    countAndFlagsBits = v0.value._countAndFlagsBits;
    object = v0.value._object;
    do
    {
      v5 = String.Iterator.next()();
      if (!v5.value._object)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (countAndFlagsBits == v5.value._countAndFlagsBits && object == v5.value._object)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v3 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      v4 = String.Iterator.next()();
      countAndFlagsBits = v4.value._countAndFlagsBits;
      object = v4.value._object;
    }
    while (v4.value._object);
  }
  swift_bridgeObjectRelease();
  v6 = String.Iterator.next()().value._object;
  swift_bridgeObjectRelease();
  v7 = v6 == 0;
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t static UTType._enumerateAllDeclaredTypes(using:)(uint64_t a1, uint64_t a2)
{
  return specialized static UTType._enumerateAllDeclaredTypes(using:)(a1, a2);
}

{
  _QWORD v3[6];

  v3[2] = a1;
  v3[3] = a2;
  return specialized static UTType._enumerateAllDeclaredTypes(using:)((uint64_t)partial apply for closure #1 in static UTType._enumerateAllDeclaredTypes(using:), (uint64_t)v3);
}

uint64_t closure #1 in static UTType._enumerateAllDeclaredTypes(using:)(uint64_t *a1, _BYTE *a2, uint64_t (*a3)(uint64_t *, char *))
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char v7;

  v4 = *a1;
  v7 = 0;
  v6 = v4;
  result = a3(&v6, &v7);
  *a2 = v7;
  return result;
}

void thunk for @escaping @callee_guaranteed (@in_guaranteed UTType, @unowned UnsafeMutablePointer<ObjCBool>) -> ()(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v4)(void **, uint64_t);
  id v5;
  void *v6;

  v4 = *(void (**)(void **, uint64_t))(a1 + 32);
  v6 = a2;
  v5 = a2;
  v4(&v6, a3);

}

uint64_t static UTType._types(identifiers:)()
{
  void *v0;
  Class isa;
  id v2;
  uint64_t v3;

  v0 = (void *)objc_opt_self();
  isa = Set._bridgeToObjectiveC()().super.isa;
  v2 = objc_msgSend(v0, sel__typesWithIdentifiers_, isa);

  v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return v3;
}

Swift::String_optional __swiftcall UTType._localizedDescription(using:)(Swift::OpaquePointer using)
{
  uint64_t v1;
  void *v2;
  Swift::String_optional result;

  v1 = UTType._localizedDescription(using:)((uint64_t)using._rawValue, (SEL *)&selRef__localizedDescriptionWithPreferredLocalizations_);
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

uint64_t UTType._localizedDescriptionDictionary.getter()
{
  return UTType._localizedDescriptionDictionary.getter((SEL *)&selRef__localizedDescriptionDictionary);
}

uint64_t UTType._kindString.getter()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*v0, sel__kindString);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

Swift::String_optional __swiftcall UTType._kindString(using:)(Swift::OpaquePointer using)
{
  uint64_t v1;
  void *v2;
  Swift::String_optional result;

  v1 = UTType._localizedDescription(using:)((uint64_t)using._rawValue, (SEL *)&selRef__kindStringWithPreferredLocalizations_);
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

uint64_t UTType._localizedDescription(using:)(uint64_t a1, SEL *a2)
{
  void **v2;
  void *v4;
  Class isa;
  id v6;
  uint64_t v7;

  v4 = *v2;
  isa = Array._bridgeToObjectiveC()().super.isa;
  v6 = objc_msgSend(v4, *a2, isa);

  if (!v6)
    return 0;
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v7;
}

uint64_t UTType._kindStringDictionary.getter()
{
  return UTType._localizedDescriptionDictionary.getter((SEL *)&selRef__kindStringDictionary);
}

uint64_t UTType._localizedDescriptionDictionary.getter(SEL *a1)
{
  id *v1;
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(*v1, *a1);
  v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t UTType.init(_ofItemAt:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t result;
  id v11;
  uint64_t v12;

  v5 = type metadata accessor for URL();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for UTType();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  v9 = @nonobjc UTType.init(_ofItemAt:)((uint64_t)v8);
  if (v2)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  v11 = v9;
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  *a2 = v11;
  return result;
}

id @nonobjc UTType.init(_ofItemAt:)(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  id v8;
  id v9;
  uint64_t v10;
  id v12;
  NSURL *v13;

  v13 = (NSURL *)*MEMORY[0x24BDAC8D0];
  URL._bridgeToObjectiveC()(v13);
  v3 = v2;
  v12 = 0;
  v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel__typeOfItemAtFileURL_error_, v2, &v12);

  v5 = v12;
  if (v4)
  {
    v6 = type metadata accessor for URL();
    v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
    v8 = v5;
    v7(a1, v6);
  }
  else
  {
    v9 = v12;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    v10 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a1, v10);
  }
  return v4;
}

char *UTType._parentTypes.getter()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  _BYTE v11[32];
  uint64_t v12;
  _OWORD v13[2];
  __int128 v14;
  uint64_t v15;

  v1 = type metadata accessor for NSFastEnumerationIterator();
  v10 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = &v11[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v4 = objc_msgSend(*v0, sel__parentTypes);
  NSOrderedSet.makeIterator()();

  lazy protocol witness table accessor for type NSFastEnumerationIterator and conformance NSFastEnumerationIterator();
  dispatch thunk of IteratorProtocol.next()();
  if (v15)
  {
    v5 = (char *)MEMORY[0x24BEE4AF8];
    do
    {
      outlined init with take of Any(&v14, v13);
      outlined init with copy of Any((uint64_t)v13, (uint64_t)v11);
      if ((swift_dynamicCast() & 1) == 0)
        v12 = 0;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
      v6 = v12;
      if (v12)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
        v8 = *((_QWORD *)v5 + 2);
        v7 = *((_QWORD *)v5 + 3);
        if (v8 >= v7 >> 1)
          v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, v5);
        *((_QWORD *)v5 + 2) = v8 + 1;
        *(_QWORD *)&v5[8 * v8 + 32] = v6;
      }
      dispatch thunk of IteratorProtocol.next()();
    }
    while (v15);
  }
  else
  {
    v5 = (char *)MEMORY[0x24BEE4AF8];
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v3, v1);

  return v5;
}

uint64_t UTType._childTypes.getter()
{
  return UTType._childTypes.getter((SEL *)&selRef__childTypes);
}

uint64_t UTType._subtypes.getter()
{
  return UTType._childTypes.getter((SEL *)&selRef__subtypes);
}

uint64_t UTType._childTypes.getter(SEL *a1)
{
  id *v1;
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(*v1, *a1);
  lazy protocol witness table accessor for type UTType and conformance UTType();
  v3 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

id UTType._isExported.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel__isExported);
}

id UTType._isImported.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel__isImported);
}

id UTType._isWildcard.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel__isWildcard);
}

id UTType._isCoreType.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel__isCoreType);
}

UniformTypeIdentifiers::UTType __swiftcall UTType.init(_exportedAs:from:conformingTo:)(Swift::String _exportedAs, NSBundle from, UniformTypeIdentifiers::UTType_optional conformingTo)
{
  _QWORD *v3;
  UniformTypeIdentifiers::UTType result;

  UTType.init(_exportedAs:from:conformingTo:)(from.super.isa, (void **)conformingTo.value._type.super.isa, (SEL *)&selRef__exportedTypeWithIdentifier_bundle_conformingToType_, v3);
  return result;
}

UniformTypeIdentifiers::UTType __swiftcall UTType.init(_importedAs:from:conformingTo:)(Swift::String _importedAs, NSBundle from, UniformTypeIdentifiers::UTType_optional conformingTo)
{
  _QWORD *v3;
  UniformTypeIdentifiers::UTType result;

  UTType.init(_exportedAs:from:conformingTo:)(from.super.isa, (void **)conformingTo.value._type.super.isa, (SEL *)&selRef__importedTypeWithIdentifier_bundle_conformingToType_, v3);
  return result;
}

void UTType.init(_exportedAs:from:conformingTo:)(void *a1@<X2>, void **a2@<X3>, SEL *a3@<X4>, _QWORD *a4@<X8>)
{
  void *v7;
  void *v8;
  id v9;

  v7 = *a2;
  v8 = (void *)MEMORY[0x20BD03B98]();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend((id)objc_opt_self(), *a3, v8, a1, v7);

  *a4 = v9;
}

UniformTypeIdentifiers::UTType_optional __swiftcall UTType.init(_identifier:allowUndeclared:)(Swift::String _identifier, Swift::Bool allowUndeclared)
{
  _QWORD *v2;
  _QWORD *v4;
  void *v5;
  id v6;
  objc_class *v7;
  Swift::Bool v8;
  UniformTypeIdentifiers::UTType_optional result;

  v4 = v2;
  v5 = (void *)MEMORY[0x20BD03B98](_identifier._countAndFlagsBits);
  swift_bridgeObjectRelease();
  v6 = objc_msgSend((id)objc_opt_self(), sel__typeWithIdentifier_allowUndeclared_, v5, allowUndeclared);

  *v4 = v6;
  result.value._type.super.isa = v7;
  result.is_nil = v8;
  return result;
}

uint64_t specialized static UTType._enumerateAllDeclaredTypes(using:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  id v9;
  _QWORD v10[6];
  id v11;

  v11 = 0;
  v4 = objc_opt_self();
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = a1;
  v5[3] = a2;
  v5[4] = &v11;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = partial apply for closure #1 in static UTType._enumerateAllDeclaredTypes(using:);
  *(_QWORD *)(v6 + 24) = v5;
  v10[4] = partial apply for thunk for @callee_guaranteed (@in_guaranteed UTType, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  v10[5] = v6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed UTType, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  v10[3] = &block_descriptor_0;
  v7 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend((id)v4, sel__enumerateAllDeclaredTypesUsingBlock_, v7);
  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v4 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    if (v11)
    {
      v9 = v11;
      swift_willThrow();

    }
    return swift_release();
  }
  return result;
}

uint64_t partial apply for closure #1 in static UTType._enumerateAllDeclaredTypes(using:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = *a1;
  return v2(&v4);
}

unint64_t type metadata accessor for UTType()
{
  unint64_t result;

  result = lazy cache variable for type metadata for UTType;
  if (!lazy cache variable for type metadata for UTType)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for UTType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type NSFastEnumerationIterator and conformance NSFastEnumerationIterator()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type NSFastEnumerationIterator and conformance NSFastEnumerationIterator;
  if (!lazy protocol witness table cache variable for type NSFastEnumerationIterator and conformance NSFastEnumerationIterator)
  {
    v1 = type metadata accessor for NSFastEnumerationIterator();
    result = MEMORY[0x20BD04090](MEMORY[0x24BDCD530], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NSFastEnumerationIterator and conformance NSFastEnumerationIterator);
  }
  return result;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_208309270()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static UTType._enumerateAllDeclaredTypes(using:)(uint64_t *a1, _BYTE *a2)
{
  uint64_t v2;

  return closure #1 in static UTType._enumerateAllDeclaredTypes(using:)(a1, a2, *(uint64_t (**)(uint64_t *, char *))(v2 + 16));
}

uint64_t sub_20830928C()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @callee_guaranteed (@in_guaranteed UTType, @unowned UnsafeMutablePointer<ObjCBool>) -> ()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t static UTHardwareColor.currentEnclosureColor.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = _UTHardwareColorGetCurrentEnclosureColor();
  if ((_DWORD)result)
    v3 = 0;
  else
    v3 = 0xFF00000000;
  *(_DWORD *)a1 = v3;
  *(_BYTE *)(a1 + 4) = BYTE4(v3);
  return result;
}

void UTHardwareColor.hash(into:)()
{
  uint64_t v0;
  Swift::UInt32 v1;

  v1 = *(_DWORD *)v0;
  if ((*(_BYTE *)(v0 + 4) & 1) != 0)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v1);
    Hasher._combine(_:)(BYTE1(v1));
    Hasher._combine(_:)(BYTE2(v1));
  }
}

Swift::Int UTHardwareColor.hashValue.getter()
{
  uint64_t v0;
  Swift::UInt32 v1;
  char v2;

  v1 = *(_DWORD *)v0;
  v2 = *(_BYTE *)(v0 + 4);
  Hasher.init(_seed:)();
  if ((v2 & 1) != 0)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v1);
    Hasher._combine(_:)(BYTE1(v1));
    Hasher._combine(_:)(BYTE2(v1));
  }
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance UTHardwareColor()
{
  uint64_t v0;
  Swift::UInt32 v1;
  char v2;

  v1 = *(_DWORD *)v0;
  v2 = *(_BYTE *)(v0 + 4);
  Hasher.init(_seed:)();
  if ((v2 & 1) != 0)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v1);
    Hasher._combine(_:)(BYTE1(v1));
    Hasher._combine(_:)(BYTE2(v1));
  }
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance UTHardwareColor()
{
  uint64_t v0;
  Swift::UInt32 v1;

  v1 = *(_DWORD *)v0;
  if ((*(_BYTE *)(v0 + 4) & 1) != 0)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v1);
    Hasher._combine(_:)(BYTE1(v1));
    Hasher._combine(_:)(BYTE2(v1));
  }
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UTHardwareColor()
{
  uint64_t v0;
  Swift::UInt32 v1;
  char v2;

  v1 = *(_DWORD *)v0;
  v2 = *(_BYTE *)(v0 + 4);
  Hasher.init(_seed:)();
  if ((v2 & 1) != 0)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v1);
    Hasher._combine(_:)(BYTE1(v1));
    Hasher._combine(_:)(BYTE2(v1));
  }
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance UTHardwareColor._CodingKey()
{
  _BYTE *v0;

  if (*v0)
    return 0x7865646E69;
  else
    return 6449010;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance UTHardwareColor._CodingKey@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized UTHardwareColor._CodingKey.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance UTHardwareColor._CodingKey()
{
  lazy protocol witness table accessor for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance UTHardwareColor._CodingKey()
{
  lazy protocol witness table accessor for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey();
  return CodingKey.debugDescription.getter();
}

uint64_t UTHardwareColor.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  _BYTE v14[16];
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<UTHardwareColor._CodingKey>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
    v14[15] = 0;
    lazy protocol witness table accessor for type [UInt8] and conformance <A> [A](&lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A], MEMORY[0x24BEE4290], MEMORY[0x24BEE12D0]);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    v10 = v15;
    if (!v15)
    {
      v14[14] = 1;
      v13 = KeyedDecodingContainer.decode(_:forKey:)();
      (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
      goto LABEL_9;
    }
    if (*(_QWORD *)(v15 + 16) == 3)
    {
      v11 = *(unsigned __int8 *)(v15 + 34);
      v12 = *(unsigned __int16 *)(v15 + 32);
      swift_bridgeObjectRelease();
      (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
      v13 = v12 | (v11 << 16);
LABEL_9:
      *(_DWORD *)a2 = v13;
      *(_BYTE *)(a2 + 4) = v10 == 0;
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    swift_bridgeObjectRelease();
    v14[13] = 0;
    type metadata accessor for DecodingError();
    swift_allocError();
    lazy protocol witness table accessor for type KeyedDecodingContainer<UTHardwareColor._CodingKey> and conformance KeyedDecodingContainer<A>();
    static DecodingError.dataCorruptedError<A>(forKey:in:debugDescription:)();
    swift_willThrow();
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t UTHardwareColor.encode(to:)(_QWORD *a1)
{
  int *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int v7;
  char v8;
  uint64_t v9;
  _QWORD v11[2];
  char v12;
  char v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<UTHardwareColor._CodingKey>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v8 = *((_BYTE *)v1 + 4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if ((v8 & 1) != 0)
  {
    v13 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_20830C380;
    *(_WORD *)(v9 + 32) = v7;
    *(_BYTE *)(v9 + 34) = BYTE2(v7);
    v11[1] = v9;
    v12 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
    lazy protocol witness table accessor for type [UInt8] and conformance <A> [A](&lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A], MEMORY[0x24BEE4268], MEMORY[0x24BEE12A0]);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    swift_bridgeObjectRelease();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t protocol witness for Decodable.init(from:) in conformance UTHardwareColor@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return UTHardwareColor.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance UTHardwareColor(_QWORD *a1)
{
  return UTHardwareColor.encode(to:)(a1);
}

uint64_t specialized static UTHardwareColor.== infix(_:_:)(int *a1, int *a2)
{
  int v2;
  int v3;
  char v4;

  v2 = *a1;
  v3 = *a2;
  v4 = *((_BYTE *)a2 + 4);
  if ((a1[1] & 1) != 0)
  {
    if (v2 == v3)
      return *((unsigned __int8 *)a2 + 4);
    else
      return 0;
  }
  else
  {
    if ((unsigned __int16)*a1 != (unsigned __int16)v3)
      v4 = 1;
    return (v4 & 1) == 0 && BYTE2(v2) == BYTE2(v3);
  }
}

unint64_t lazy protocol witness table accessor for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey;
  if (!lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey)
  {
    result = MEMORY[0x20BD04090](&protocol conformance descriptor for UTHardwareColor._CodingKey, &unk_24C091C50);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey;
  if (!lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey)
  {
    result = MEMORY[0x20BD04090](&protocol conformance descriptor for UTHardwareColor._CodingKey, &unk_24C091C50);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey;
  if (!lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey)
  {
    result = MEMORY[0x20BD04090](&protocol conformance descriptor for UTHardwareColor._CodingKey, &unk_24C091C50);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey;
  if (!lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey)
  {
    result = MEMORY[0x20BD04090](&protocol conformance descriptor for UTHardwareColor._CodingKey, &unk_24C091C50);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTHardwareColor._CodingKey and conformance UTHardwareColor._CodingKey);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD04084](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type KeyedDecodingContainer<UTHardwareColor._CodingKey> and conformance KeyedDecodingContainer<A>()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type KeyedDecodingContainer<UTHardwareColor._CodingKey> and conformance KeyedDecodingContainer<A>;
  if (!lazy protocol witness table cache variable for type KeyedDecodingContainer<UTHardwareColor._CodingKey> and conformance KeyedDecodingContainer<A>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for KeyedDecodingContainer<UTHardwareColor._CodingKey>);
    result = MEMORY[0x20BD04090](MEMORY[0x24BEE33F8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type KeyedDecodingContainer<UTHardwareColor._CodingKey> and conformance KeyedDecodingContainer<A>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type [UInt8] and conformance <A> [A](unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UInt8]);
    v8 = a2;
    result = MEMORY[0x20BD04090](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UTHardwareColor and conformance UTHardwareColor()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UTHardwareColor and conformance UTHardwareColor;
  if (!lazy protocol witness table cache variable for type UTHardwareColor and conformance UTHardwareColor)
  {
    result = MEMORY[0x20BD04090](&protocol conformance descriptor for UTHardwareColor, &type metadata for UTHardwareColor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTHardwareColor and conformance UTHardwareColor);
  }
  return result;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for UTHardwareColor(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 4);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for UTHardwareColor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 5) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 5) = 0;
    if (a2)
      *(_BYTE *)(result + 4) = -(char)a2;
  }
  return result;
}

uint64_t getEnumTag for UTHardwareColor(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 4);
}

uint64_t destructiveInjectEnumTag for UTHardwareColor(uint64_t result, char a2)
{
  *(_BYTE *)(result + 4) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for UTHardwareColor()
{
  return &type metadata for UTHardwareColor;
}

uint64_t storeEnumTagSinglePayload for UTHardwareColor._CodingKey(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_208309D98 + 4 * byte_20830C395[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_208309DCC + 4 * byte_20830C390[v4]))();
}

uint64_t sub_208309DCC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_208309DD4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x208309DDCLL);
  return result;
}

uint64_t sub_208309DE8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x208309DF0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_208309DF4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_208309DFC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for UTHardwareColor._CodingKey()
{
  return &unk_24C091C50;
}

uint64_t specialized UTHardwareColor._CodingKey.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 6449010 && a2 == 0xE300000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7865646E69 && a2 == 0xE500000000000000)
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

UniformTypeIdentifiers::UTTagClass __swiftcall UTTagClass.init(rawValue:)(UniformTypeIdentifiers::UTTagClass rawValue)
{
  UniformTypeIdentifiers::UTTagClass *v1;

  *v1 = rawValue;
  return rawValue;
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance UTTagClass@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance UTTagClass@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t static UTTagClass.filenameExtension.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t static UTTagClass.mimeType.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t static UTTagClass.== infix(_:_:)(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *a2;
  v3 = a2[1];
  v4 = (void *)MEMORY[0x20BD03B98](*a1, a1[1]);
  v5 = (void *)MEMORY[0x20BD03B98](v2, v3);
  v6 = _UTIdentifiersAreEqual();

  return v6;
}

void UTTagClass.hash(into:)()
{
  _QWORD *v0;
  void *v1;
  Swift::UInt HashCode;

  v1 = (void *)MEMORY[0x20BD03B98](*v0, v0[1]);
  HashCode = _UTIdentifierGetHashCode();

  Hasher._combine(_:)(HashCode);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UTTagClass(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *a2;
  v3 = a2[1];
  v4 = (void *)MEMORY[0x20BD03B98](*a1, a1[1]);
  v5 = (void *)MEMORY[0x20BD03B98](v2, v3);
  v6 = _UTIdentifiersAreEqual();

  return v6;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance UTTagClass()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  Swift::UInt HashCode;

  v1 = *v0;
  v2 = v0[1];
  Hasher.init(_seed:)();
  v3 = (void *)MEMORY[0x20BD03B98](v1, v2);
  HashCode = _UTIdentifierGetHashCode();

  Hasher._combine(_:)(HashCode);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance UTTagClass()
{
  _QWORD *v0;
  void *v1;
  Swift::UInt HashCode;

  v1 = (void *)MEMORY[0x20BD03B98](*v0, v0[1]);
  HashCode = _UTIdentifierGetHashCode();

  Hasher._combine(_:)(HashCode);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UTTagClass()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  Swift::UInt HashCode;

  v1 = *v0;
  v2 = v0[1];
  Hasher.init(_seed:)();
  v3 = (void *)MEMORY[0x20BD03B98](v1, v2);
  HashCode = _UTIdentifierGetHashCode();

  Hasher._combine(_:)(HashCode);
  return Hasher._finalize()();
}

uint64_t UTTagClass.description.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance UTTagClass()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UTTagClass._CodingKeys()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance UTTagClass._CodingKeys()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance UTTagClass._CodingKeys()
{
  Hasher._combine(_:)(0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UTTagClass._CodingKeys()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance UTTagClass._CodingKeys()
{
  return 0x7373616C43676174;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance UTTagClass._CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x7373616C43676174 && a2 == 0xE800000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance UTTagClass._CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance UTTagClass._CodingKeys()
{
  lazy protocol witness table accessor for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance UTTagClass._CodingKeys()
{
  lazy protocol witness table accessor for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t UTTagClass.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  _QWORD v13[4];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<UTTagClass._CodingKeys>);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = v1[1];
  v10 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v10);
  v13[0] = v8;
  v13[1] = v9;
  result = Encoder.encodeSingleValueSafely<A>(_:)((uint64_t)v13, v10, MEMORY[0x24BEE0D00]);
  if (!v2 && (result & 1) == 0)
  {
    v12 = a1[3];
    v13[3] = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v12);
    lazy protocol witness table accessor for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys();
    dispatch thunk of Encoder.container<A>(keyedBy:)();
    KeyedEncodingContainer.encode(_:forKey:)();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys;
  if (!lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys)
  {
    result = MEMORY[0x20BD04090](&protocol conformance descriptor for UTTagClass._CodingKeys, &unk_24C091B40);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys;
  if (!lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys)
  {
    result = MEMORY[0x20BD04090](&protocol conformance descriptor for UTTagClass._CodingKeys, &unk_24C091B40);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys;
  if (!lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys)
  {
    result = MEMORY[0x20BD04090](&protocol conformance descriptor for UTTagClass._CodingKeys, &unk_24C091B40);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys;
  if (!lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys)
  {
    result = MEMORY[0x20BD04090](&protocol conformance descriptor for UTTagClass._CodingKeys, &unk_24C091B40);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys);
  }
  return result;
}

uint64_t UTTagClass.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  void *v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  _QWORD v17[4];
  uint64_t *v18;

  v18 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<UTTagClass._CodingKeys>?);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v17[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<UTTagClass._CodingKeys>);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v17[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type UTTagClass._CodingKeys and conformance UTTagClass._CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {

    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    outlined destroy of KeyedDecodingContainer<UTTagClass._CodingKeys>?((uint64_t)v5);
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    dispatch thunk of Decoder.singleValueContainer()();
    __swift_project_boxed_opaque_existential_1(v17, v17[3]);
    v10 = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
    v12 = v11;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  }
  else
  {
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
    v10 = KeyedDecodingContainer.decode(_:forKey:)();
    v12 = v13;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  v14 = v18;
  *v18 = v10;
  v14[1] = v12;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t outlined destroy of KeyedDecodingContainer<UTTagClass._CodingKeys>?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<UTTagClass._CodingKeys>?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t lazy protocol witness table accessor for type UTTagClass and conformance UTTagClass()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UTTagClass and conformance UTTagClass;
  if (!lazy protocol witness table cache variable for type UTTagClass and conformance UTTagClass)
  {
    result = MEMORY[0x20BD04090](&protocol conformance descriptor for UTTagClass, &type metadata for UTTagClass);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UTTagClass and conformance UTTagClass);
  }
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance UTTagClass@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return UTTagClass.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance UTTagClass(_QWORD *a1)
{
  return UTTagClass.encode(to:)(a1);
}

_QWORD *initializeBufferWithCopyOfBuffer for UTTagClass(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for UTTagClass()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for UTTagClass(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for UTTagClass(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UTTagClass(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for UTTagClass(uint64_t result, int a2, int a3)
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

uint64_t getEnumTagSinglePayload for UTTagClass._CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for UTTagClass._CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_20830AA7C + 4 * byte_20830C5B0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_20830AA9C + 4 * byte_20830C5B5[v4]))();
}

_BYTE *sub_20830AA7C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_20830AA9C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_20830AAA4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_20830AAAC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_20830AAB4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_20830AABC(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t getEnumTag for UTTagClass._CodingKeys()
{
  return 0;
}

void *type metadata accessor for UTTagClass._CodingKeys()
{
  return &unk_24C091B40;
}

id static UTType._currentDevice.getter@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel__typeOfCurrentDevice);
  if (result)
    *a1 = result;
  else
    __break(1u);
  return result;
}

void UTType.init(_deviceModelCode:enclosureColor:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  if (*(unsigned __int8 *)(a3 + 4) == 255)
  {
    v7 = (void *)MEMORY[0x20BD03B98](a1, a2);
    swift_bridgeObjectRelease();
    v8 = objc_msgSend((id)objc_opt_self(), sel__typeWithDeviceModelCode_, v7);
  }
  else
  {
    if ((((unint64_t)*(unsigned __int8 *)(a3 + 4) << 32) & 0x100000000) != 0)
      v9 = _UTHardwareColorMakeWithIndex();
    else
      v9 = _UTHardwareColorMakeWithRGBComponents();
    v10 = v9;
    v7 = (void *)MEMORY[0x20BD03B98](a1, a2);
    swift_bridgeObjectRelease();
    v8 = objc_msgSend((id)objc_opt_self(), sel__typeWithDeviceModelCode_enclosureColor_, v7, v10);
  }
  v11 = v8;

  *a4 = v11;
}

id UTType._preferredEnclosureColor.getter@<X0>(uint64_t a1@<X8>)
{
  return UTType._preferredEnclosureColor.getter((SEL *)&selRef__getPreferredEnclosureColor_, a1);
}

id UTType._enclosureColors.getter()
{
  id *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id result;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = *v0;
  v2 = objc_msgSend(*v0, sel_tags);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(_QWORD *)(v3 + 16) && (v6 = specialized __RawDictionaryStorage.find<A>(_:)(v4, v5), (v7 & 1) != 0))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v6);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v9 = *(_QWORD *)(v8 + 16);
    swift_bridgeObjectRelease();
    if (v9)
    {
      type metadata accessor for UTHardwareColor(0);
      v10 = v1;
      v11 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(_QWORD *)(v11 + 16) = v9;
      goto LABEL_7;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v12 = v1;
  v9 = 0;
  v11 = MEMORY[0x24BEE4AF8];
LABEL_7:
  result = objc_msgSend(v1, sel__getEnclosureColors_count_, v11 + 32, v9);
  if (v9 < (uint64_t)result)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v11 + 16) = result;

    v14 = *(_QWORD *)(v11 + 16);
    if (v14)
    {
      v24 = MEMORY[0x24BEE4AF8];
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14, 0);
      v15 = 0;
      v16 = v24;
      v17 = *(_QWORD *)(v24 + 16);
      v18 = 8 * v17;
      do
      {
        v19 = *(unsigned __int8 *)(v11 + v15 + 32);
        if (v19 == 1)
          v20 = *(_DWORD *)(v11 + v15 + 36);
        else
          v20 = *(_DWORD *)(v11 + v15 + 36) & 0xFFFFFF;
        v21 = *(_QWORD *)(v24 + 24);
        v22 = v17 + 1;
        if (v17 >= v21 >> 1)
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v21 > 1), v17 + 1, 1);
        *(_QWORD *)(v24 + 16) = v22;
        v23 = v24 + v18 + v15;
        *(_DWORD *)(v23 + 32) = v20;
        *(_BYTE *)(v23 + 36) = v19 == 1;
        v15 += 8;
        v17 = v22;
        --v14;
      }
      while (v14);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      return (id)MEMORY[0x24BEE4AF8];
    }
    return (id)v16;
  }
  return result;
}

id UTType._enclosureColor.getter@<X0>(uint64_t a1@<X8>)
{
  return UTType._preferredEnclosureColor.getter((SEL *)&selRef__getEnclosureColor_, a1);
}

id UTType._preferredEnclosureColor.getter@<X0>(SEL *a1@<X0>, uint64_t a2@<X8>)
{
  void **v2;
  void *v4;
  id result;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v4 = *v2;
  v7[0] = 0;
  result = objc_msgSend(v4, *a1, v7);
  if ((_DWORD)result)
  {
    v6 = HIDWORD(v7[0]) & 0xFFFFFF;
    if (LOBYTE(v7[0]) == 1)
      v6 = HIDWORD(v7[0]) | 0x100000000;
  }
  else
  {
    v6 = 0xFF00000000;
  }
  *(_DWORD *)a2 = v6;
  *(_BYTE *)(a2 + 4) = BYTE4(v6);
  return result;
}

_QWORD *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(UTTagClass, [String])>);
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (UTTagClass, [String]));
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
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
  size_t v15;

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UTHardwareColor>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  v15 = 8 * v8;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[v15])
      memmove(v13, v14, v15);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v15);
  }
  swift_release();
  return v10;
}

id static UTType._blockSpecial.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF86F0];
  *a1 = *MEMORY[0x24BDF86F0];
  return v1;
}

id static UTType._characterSpecial.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF86F8];
  *a1 = *MEMORY[0x24BDF86F8];
  return v1;
}

id static UTType._namedPipeOrFIFO.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8768];
  *a1 = *MEMORY[0x24BDF8768];
  return v1;
}

id static UTType._socket.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8788];
  *a1 = *MEMORY[0x24BDF8788];
  return v1;
}

id static UTType._device.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8708];
  *a1 = *MEMORY[0x24BDF8708];
  return v1;
}

id static UTType._computer.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8700];
  *a1 = *MEMORY[0x24BDF8700];
  return v1;
}

id static UTType._genericPC.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8718];
  *a1 = *MEMORY[0x24BDF8718];
  return v1;
}

id static UTType._speaker.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8790];
  *a1 = *MEMORY[0x24BDF8790];
  return v1;
}

id static UTType._display.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8710];
  *a1 = *MEMORY[0x24BDF8710];
  return v1;
}

id static UTType._appleDevice.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF86C8];
  *a1 = *MEMORY[0x24BDF86C8];
  return v1;
}

id static UTType._mac.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8730];
  *a1 = *MEMORY[0x24BDF8730];
  return v1;
}

id static UTType._iMac.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8798];
  *a1 = *MEMORY[0x24BDF8798];
  return v1;
}

id static UTType._macPro.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8760];
  *a1 = *MEMORY[0x24BDF8760];
  return v1;
}

id static UTType._macMini.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8758];
  *a1 = *MEMORY[0x24BDF8758];
  return v1;
}

id static UTType._macLaptop.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8750];
  *a1 = *MEMORY[0x24BDF8750];
  return v1;
}

id static UTType._macBook.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8738];
  *a1 = *MEMORY[0x24BDF8738];
  return v1;
}

id static UTType._macBookAir.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8740];
  *a1 = *MEMORY[0x24BDF8740];
  return v1;
}

id static UTType._macBookPro.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8748];
  *a1 = *MEMORY[0x24BDF8748];
  return v1;
}

id static UTType._iOSDevice.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF87A0];
  *a1 = *MEMORY[0x24BDF87A0];
  return v1;
}

id static UTType._iPhone.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF87B8];
  *a1 = *MEMORY[0x24BDF87B8];
  return v1;
}

id static UTType._iPad.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF87B0];
  *a1 = *MEMORY[0x24BDF87B0];
  return v1;
}

id static UTType._iPodTouch.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF87C0];
  *a1 = *MEMORY[0x24BDF87C0];
  return v1;
}

id static UTType._iOSSimulator.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF87A8];
  *a1 = *MEMORY[0x24BDF87A8];
  return v1;
}

id static UTType._appleWatch.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF86E8];
  *a1 = *MEMORY[0x24BDF86E8];
  return v1;
}

id static UTType._appleTV.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF86D8];
  *a1 = *MEMORY[0x24BDF86D8];
  return v1;
}

id static UTType._homePod.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8728];
  *a1 = *MEMORY[0x24BDF8728];
  return v1;
}

id static UTType._appleVisionPro.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF86E0];
  *a1 = *MEMORY[0x24BDF86E0];
  return v1;
}

id static UTType._passBundle.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8770];
  *a1 = *MEMORY[0x24BDF8770];
  return v1;
}

id static UTType._passData.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8778];
  *a1 = *MEMORY[0x24BDF8778];
  return v1;
}

id static UTType._passesData.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8780];
  *a1 = *MEMORY[0x24BDF8780];
  return v1;
}

id static UTType._heifStandard.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF8720];
  *a1 = *MEMORY[0x24BDF8720];
  return v1;
}

id static UTType._appleEncryptedArchive.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;

  v1 = (void *)*MEMORY[0x24BDF86D0];
  *a1 = *MEMORY[0x24BDF86D0];
  return v1;
}

char *static UTType._namedConstants_UTCoreTypesPriv.getter()
{
  uint64_t inited;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void **v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void **v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void **v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  char *v55;
  unint64_t v56;
  id v57;
  unint64_t v58;
  id v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UTType>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20830C850;
  v1 = (void *)*MEMORY[0x24BDF86F0];
  v2 = (void *)*MEMORY[0x24BDF86F8];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDF86F0];
  *(_QWORD *)(inited + 40) = v2;
  v3 = (void *)*MEMORY[0x24BDF8768];
  v4 = (void *)*MEMORY[0x24BDF8788];
  v5 = (void **)MEMORY[0x24BDF8708];
  *(_QWORD *)(inited + 48) = *MEMORY[0x24BDF8768];
  *(_QWORD *)(inited + 56) = v4;
  v6 = *v5;
  v7 = (void *)*MEMORY[0x24BDF8700];
  *(_QWORD *)(inited + 64) = *v5;
  *(_QWORD *)(inited + 72) = v7;
  v8 = (void *)*MEMORY[0x24BDF8718];
  v9 = (void *)*MEMORY[0x24BDF8790];
  *(_QWORD *)(inited + 80) = *MEMORY[0x24BDF8718];
  *(_QWORD *)(inited + 88) = v9;
  v10 = (void *)*MEMORY[0x24BDF8710];
  v11 = (void *)*MEMORY[0x24BDF86C8];
  v12 = (void **)MEMORY[0x24BDF8730];
  *(_QWORD *)(inited + 96) = *MEMORY[0x24BDF8710];
  *(_QWORD *)(inited + 104) = v11;
  v61 = *v12;
  v64 = (void *)*MEMORY[0x24BDF8798];
  v13 = *MEMORY[0x24BDF8798];
  *(_QWORD *)(inited + 112) = v61;
  *(_QWORD *)(inited + 120) = v13;
  v62 = (void *)*MEMORY[0x24BDF8760];
  v65 = (void *)*MEMORY[0x24BDF8758];
  v14 = *MEMORY[0x24BDF8758];
  *(_QWORD *)(inited + 128) = *MEMORY[0x24BDF8760];
  *(_QWORD *)(inited + 136) = v14;
  v63 = (void *)*MEMORY[0x24BDF8750];
  v66 = (void *)*MEMORY[0x24BDF8738];
  v15 = *MEMORY[0x24BDF8738];
  v16 = (void **)MEMORY[0x24BDF8740];
  *(_QWORD *)(inited + 144) = *MEMORY[0x24BDF8750];
  *(_QWORD *)(inited + 152) = v15;
  v67 = *v16;
  v70 = (void *)*MEMORY[0x24BDF8748];
  v17 = *MEMORY[0x24BDF8748];
  *(_QWORD *)(inited + 160) = v67;
  *(_QWORD *)(inited + 168) = v17;
  v68 = (void *)*MEMORY[0x24BDF87A0];
  v71 = (void *)*MEMORY[0x24BDF87B8];
  v18 = *MEMORY[0x24BDF87B8];
  *(_QWORD *)(inited + 176) = *MEMORY[0x24BDF87A0];
  *(_QWORD *)(inited + 184) = v18;
  v69 = (void *)*MEMORY[0x24BDF87B0];
  v72 = (void *)*MEMORY[0x24BDF87C0];
  v19 = *MEMORY[0x24BDF87C0];
  v20 = (void **)MEMORY[0x24BDF87A8];
  *(_QWORD *)(inited + 192) = *MEMORY[0x24BDF87B0];
  *(_QWORD *)(inited + 200) = v19;
  v73 = *v20;
  v76 = (void *)*MEMORY[0x24BDF86E8];
  v21 = *MEMORY[0x24BDF86E8];
  *(_QWORD *)(inited + 208) = v73;
  *(_QWORD *)(inited + 216) = v21;
  v74 = (void *)*MEMORY[0x24BDF86D8];
  v77 = (void *)*MEMORY[0x24BDF8728];
  v22 = *MEMORY[0x24BDF8728];
  *(_QWORD *)(inited + 224) = *MEMORY[0x24BDF86D8];
  *(_QWORD *)(inited + 232) = v22;
  v75 = (void *)*MEMORY[0x24BDF8770];
  v78 = (void *)*MEMORY[0x24BDF8778];
  v23 = *MEMORY[0x24BDF8778];
  v24 = (void **)MEMORY[0x24BDF8720];
  *(_QWORD *)(inited + 240) = *MEMORY[0x24BDF8770];
  *(_QWORD *)(inited + 248) = v23;
  v79 = *v24;
  *(_QWORD *)(inited + 256) = *v24;
  v80 = (void *)*MEMORY[0x24BDF8780];
  v25 = v1;
  v26 = v2;
  v27 = v3;
  v28 = v4;
  v29 = v6;
  v30 = v7;
  v31 = v8;
  v32 = v9;
  v33 = v10;
  v34 = v11;
  v35 = v61;
  v36 = v64;
  v37 = v62;
  v38 = v65;
  v39 = v63;
  v40 = v66;
  v41 = v67;
  v42 = v70;
  v43 = v68;
  v44 = v71;
  v45 = v69;
  v46 = v72;
  v47 = v73;
  v48 = v76;
  v49 = v74;
  v50 = v77;
  v51 = v75;
  v52 = v78;
  v53 = v79;
  v54 = v80;
  v55 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)1, 30, 1, (char *)inited);
  *((_QWORD *)v55 + 2) = 30;
  *((_QWORD *)v55 + 33) = v54;
  v56 = *((_QWORD *)v55 + 3);
  v57 = (id)*MEMORY[0x24BDF86D0];
  if (v56 <= 0x3D)
    v55 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v56 > 1), 31, 1, v55);
  *((_QWORD *)v55 + 2) = 31;
  *((_QWORD *)v55 + 34) = v57;
  v58 = *((_QWORD *)v55 + 3);
  v59 = (id)*MEMORY[0x24BDF86E0];
  if (v58 <= 0x3F)
    v55 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v58 > 1), 32, 1, v55);
  *((_QWORD *)v55 + 2) = 32;
  *((_QWORD *)v55 + 35) = v59;
  return v55;
}

uint64_t URLResourceValues.allValues.getter()
{
  return MEMORY[0x24BDCC6F8]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return MEMORY[0x24BDCD520]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x24BDCDCA0]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCF830]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0;
  void *v1;
  Swift::String_optional result;

  v0 = MEMORY[0x24BEE0C00]();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x24BEE1190]();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)MEMORY[0x24BDCFCC0]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t NSOrderedSet.makeIterator()()
{
  return MEMORY[0x24BDCFE90]();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t NSObject.hash(into:)()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x24BEE1E70]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t static DecodingError.dataCorruptedError<A>(forKey:in:debugDescription:)()
{
  return MEMORY[0x24BEE26C0]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE32F8]();
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
  return MEMORY[0x24BEE3398]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x24BEE34A0]();
}

{
  return MEMORY[0x24BEE34C0]();
}

{
  return MEMORY[0x24BEE34E8]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x24BEE3A58]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)()
{
  return MEMORY[0x24BEE3B20]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
  MEMORY[0x24BEE4300](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
  MEMORY[0x24BEE4310](*(_QWORD *)&a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t dispatch thunk of Encoder.codingPath.getter()
{
  return MEMORY[0x24BEE4618]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x24BEE4628]();
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

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _UTHardwareColorGetCurrentEnclosureColor()
{
  return MEMORY[0x24BDF8698]();
}

uint64_t _UTHardwareColorMakeWithIndex()
{
  return MEMORY[0x24BDF86A0]();
}

uint64_t _UTHardwareColorMakeWithRGBComponents()
{
  return MEMORY[0x24BDF86A8]();
}

uint64_t _UTIdentifierGetHashCode()
{
  return MEMORY[0x24BDF86B0]();
}

uint64_t _UTIdentifiersAreEqual()
{
  return MEMORY[0x24BDF86B8]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

