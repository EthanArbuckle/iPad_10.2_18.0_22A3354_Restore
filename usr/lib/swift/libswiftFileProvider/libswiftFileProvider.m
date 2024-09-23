BOOL static NSFileProviderDomainVersion.< infix(_:_:)(void *a1, uint64_t a2)
{
  return objc_msgSend(a1, sel_compare_, a2) == (id)-1;
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance NSFileProviderDomainVersion(id *a1, _QWORD *a2)
{
  return objc_msgSend(*a1, sel_compare_, *a2) == (id)-1;
}

void NSFileProviderManager.requestDownloadForItem(withIdentifier:requestedRange:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  void *v12;
  _QWORD v13[6];

  if ((a4 & 1) != 0)
  {
    a2 = NSNotFound.getter();
    a3 = NSNotFound.getter();
  }
  v13[4] = a5;
  v13[5] = a6;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  v13[3] = &block_descriptor;
  v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_requestDownloadForItemWithIdentifier_requestedRange_completionHandler_, a1, a2, a3, v12);
  _Block_release(v12);
}

void thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ()(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t NSFileProviderManager.requestDownloadForItem(withIdentifier:requestedRange:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v5 + 160) = a4;
  *(_QWORD *)(v5 + 136) = a3;
  *(_QWORD *)(v5 + 144) = v4;
  *(_QWORD *)(v5 + 120) = a1;
  *(_QWORD *)(v5 + 128) = a2;
  return swift_task_switch();
}

uint64_t NSFileProviderManager.requestDownloadForItem(withIdentifier:requestedRange:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  if ((*(_BYTE *)(v0 + 160) & 1) != 0)
  {
    v2 = NSNotFound.getter();
    v1 = NSNotFound.getter();
  }
  else
  {
    v2 = *(_QWORD *)(v0 + 128);
    v1 = *(_QWORD *)(v0 + 136);
  }
  v3 = *(void **)(v0 + 144);
  v4 = *(_QWORD *)(v0 + 120);
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = NSFileProviderManager.requestDownloadForItem(withIdentifier:requestedRange:);
  v5 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v6 = (_QWORD *)(v0 + 80);
  v6[1] = 0x40000000;
  v6[2] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> () with result type ();
  v6[3] = &block_descriptor_1;
  v6[4] = v5;
  objc_msgSend(v3, sel_requestDownloadForItemWithIdentifier_requestedRange_completionHandler_, v4, v2, v1, v6);
  return swift_continuation_await();
}

{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 152) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;

  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> () with result type ()(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

BOOL static NSFileProviderManager.EligibilityResult.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 8) == 1)
    return (*(_BYTE *)(a2 + 8) & 1) != 0;
  if ((*(_BYTE *)(a2 + 8) & 1) != 0)
    return 0;
  return *(_QWORD *)a1 == *(_QWORD *)a2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance NSFileProviderManager.EligibilityResult(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 8) == 1)
    return (*(_BYTE *)(a2 + 8) & 1) != 0;
  if ((*(_BYTE *)(a2 + 8) & 1) != 0)
    return 0;
  return *(_QWORD *)a1 == *(_QWORD *)a2;
}

id static NSFileProviderManager.checkDomainsCanBeStoredOnVolume(at:)@<X0>(uint64_t a1@<X8>)
{
  void *v2;
  NSURL *v3;
  void *v4;
  void *v5;
  id v6;
  char v7;
  uint64_t v8;
  id v10;
  id v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v12 = 0;
  v2 = (void *)objc_opt_self();
  URL._bridgeToObjectiveC()(v3);
  v5 = v4;
  v11 = 0;
  LODWORD(v2) = objc_msgSend(v2, sel_checkDomainsCanBeStored_onVolumeAtURL_unsupportedReason_error_, &v13, v4, &v12, &v11);

  v6 = v11;
  if ((_DWORD)v2)
  {
    v7 = v13;
    v8 = v12;
    if (v13)
      v8 = 0;
    *(_QWORD *)a1 = v8;
    *(_BYTE *)(a1 + 8) = v7;
    return v6;
  }
  else
  {
    v10 = v11;
    _convertNSErrorToError(_:)();

    return (id)swift_willThrow();
  }
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

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance NSFileProviderVolumeUnsupportedReason@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance NSFileProviderVolumeUnsupportedReason(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void protocol witness for SetAlgebra.init() in conformance NSFileProviderVolumeUnsupportedReason(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *protocol witness for SetAlgebra.union(_:) in conformance NSFileProviderVolumeUnsupportedReason@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.intersection(_:) in conformance NSFileProviderVolumeUnsupportedReason@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance NSFileProviderVolumeUnsupportedReason@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance NSFileProviderVolumeUnsupportedReason(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *protocol witness for SetAlgebra.remove(_:) in conformance NSFileProviderVolumeUnsupportedReason@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *protocol witness for SetAlgebra.update(with:) in conformance NSFileProviderVolumeUnsupportedReason@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formUnion(_:) in conformance NSFileProviderVolumeUnsupportedReason(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formIntersection(_:) in conformance NSFileProviderVolumeUnsupportedReason(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance NSFileProviderVolumeUnsupportedReason(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.subtracting(_:) in conformance NSFileProviderVolumeUnsupportedReason@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance NSFileProviderVolumeUnsupportedReason(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance NSFileProviderVolumeUnsupportedReason(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance NSFileProviderVolumeUnsupportedReason(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance NSFileProviderVolumeUnsupportedReason()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance NSFileProviderVolumeUnsupportedReason()
{
  return SetAlgebra.init<A>(_:)();
}

_QWORD *protocol witness for SetAlgebra.subtract(_:) in conformance NSFileProviderVolumeUnsupportedReason(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance NSFileProviderVolumeUnsupportedReason(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance NSFileProviderVolumeUnsupportedReason@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = specialized SetAlgebra<>.init(arrayLiteral:)(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

_QWORD *protocol witness for OptionSet.init(rawValue:) in conformance NSFileProviderVolumeUnsupportedReason@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t base witness table accessor for Equatable in NSFileProviderDomainVersion()
{
  return lazy protocol witness table accessor for type NSFileProviderDomainVersion and conformance NSObject(&lazy protocol witness table cache variable for type NSFileProviderDomainVersion and conformance NSObject, (uint64_t (*)(uint64_t))type metadata accessor for NSFileProviderDomainVersion, MEMORY[0x24BEE5BE0]);
}

unint64_t type metadata accessor for NSFileProviderDomainVersion()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSFileProviderDomainVersion;
  if (!lazy cache variable for type metadata for NSFileProviderDomainVersion)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSFileProviderDomainVersion);
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for NSFileProviderManager.EligibilityResult(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for NSFileProviderManager.EligibilityResult(uint64_t result, int a2, int a3)
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

uint64_t getEnumTag for NSFileProviderManager.EligibilityResult(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t destructiveInjectEnumTag for NSFileProviderManager.EligibilityResult(uint64_t result, int a2)
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

ValueMetadata *type metadata accessor for NSFileProviderManager.EligibilityResult()
{
  return &type metadata for NSFileProviderManager.EligibilityResult;
}

void type metadata accessor for NSFileProviderVolumeUnsupportedReason()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!lazy cache variable for type metadata for NSFileProviderVolumeUnsupportedReason)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for NSFileProviderVolumeUnsupportedReason);
  }
}

uint64_t base witness table accessor for Equatable in NSFileProviderVolumeUnsupportedReason()
{
  return lazy protocol witness table accessor for type NSFileProviderDomainVersion and conformance NSObject(&lazy protocol witness table cache variable for type NSFileProviderVolumeUnsupportedReason and conformance NSFileProviderVolumeUnsupportedReason, (uint64_t (*)(uint64_t))type metadata accessor for NSFileProviderVolumeUnsupportedReason, (uint64_t)&protocol conformance descriptor for NSFileProviderVolumeUnsupportedReason);
}

uint64_t base witness table accessor for ExpressibleByArrayLiteral in NSFileProviderVolumeUnsupportedReason()
{
  return lazy protocol witness table accessor for type NSFileProviderDomainVersion and conformance NSObject(&lazy protocol witness table cache variable for type NSFileProviderVolumeUnsupportedReason and conformance NSFileProviderVolumeUnsupportedReason, (uint64_t (*)(uint64_t))type metadata accessor for NSFileProviderVolumeUnsupportedReason, (uint64_t)&protocol conformance descriptor for NSFileProviderVolumeUnsupportedReason);
}

uint64_t base witness table accessor for RawRepresentable in NSFileProviderVolumeUnsupportedReason()
{
  return lazy protocol witness table accessor for type NSFileProviderDomainVersion and conformance NSObject(&lazy protocol witness table cache variable for type NSFileProviderVolumeUnsupportedReason and conformance NSFileProviderVolumeUnsupportedReason, (uint64_t (*)(uint64_t))type metadata accessor for NSFileProviderVolumeUnsupportedReason, (uint64_t)&protocol conformance descriptor for NSFileProviderVolumeUnsupportedReason);
}

uint64_t base witness table accessor for SetAlgebra in NSFileProviderVolumeUnsupportedReason()
{
  return lazy protocol witness table accessor for type NSFileProviderDomainVersion and conformance NSObject(&lazy protocol witness table cache variable for type NSFileProviderVolumeUnsupportedReason and conformance NSFileProviderVolumeUnsupportedReason, (uint64_t (*)(uint64_t))type metadata accessor for NSFileProviderVolumeUnsupportedReason, (uint64_t)&protocol conformance descriptor for NSFileProviderVolumeUnsupportedReason);
}

uint64_t lazy protocol witness table accessor for type NSFileProviderDomainVersion and conformance NSObject(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x20BD0ED48](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD0ED3C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t NSNotFound.getter()
{
  return MEMORY[0x24BDCAF28]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
}

uint64_t static Comparable.> infix(_:_:)()
{
  return MEMORY[0x24BEE07F8]();
}

uint64_t static Comparable.>= infix(_:_:)()
{
  return MEMORY[0x24BEE0800]();
}

uint64_t static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x24BEE0808]();
}

uint64_t SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22B0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

