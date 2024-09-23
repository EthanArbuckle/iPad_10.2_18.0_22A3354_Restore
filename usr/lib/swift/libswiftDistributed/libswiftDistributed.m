uint64_t DistributedActor.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_QWORD *)(a3 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v11 - v8;
  v12 = v3;
  MEMORY[0x22E2FE1B4](a2, v5);
  swift_getAssociatedConformanceWitness();
  dispatch thunk of Hashable.hash(into:)();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, AssociatedTypeWitness);
}

uint64_t static DistributedActor.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;

  v7 = *(_QWORD *)(a4 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v17 - v13;
  v18 = a1;
  MEMORY[0x22E2FE1B4](a3, v7);
  v18 = a2;
  MEMORY[0x22E2FE1B4](a3, v7);
  swift_getAssociatedConformanceWitness();
  LOBYTE(a1) = dispatch thunk of static Equatable.== infix(_:_:)();
  v15 = *(void (**)(char *, uint64_t))(v9 + 8);
  v15(v12, AssociatedTypeWitness);
  v15(v14, AssociatedTypeWitness);
  return a1 & 1;
}

uint64_t one-time initialization function for actorSystemKey()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CodingUserInfoKey?);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for CodingUserInfoKey();
  __swift_allocate_value_buffer(v3, static CodingUserInfoKey.actorSystemKey);
  v4 = __swift_project_value_buffer(v3, (uint64_t)static CodingUserInfoKey.actorSystemKey);
  CodingUserInfoKey.init(rawValue:)();
  v5 = *(_QWORD *)(v3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v3) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v4, v2, v3);
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t static CodingUserInfoKey.actorSystemKey.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (one-time initialization token for actorSystemKey != -1)
    swift_once();
  v2 = type metadata accessor for CodingUserInfoKey();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static CodingUserInfoKey.actorSystemKey);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t DistributedActor<>.init(from:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  void *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t AssociatedTypeWitness;
  uint64_t v45;
  _OWORD v46[3];
  _QWORD *v47;

  v42 = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v39 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v43 = (char *)&v38 - v7;
  v40 = a3;
  v45 = a2;
  v8 = swift_getAssociatedTypeWitness();
  v9 = type metadata accessor for Optional();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v38 - v12;
  v14 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v38 - v15;
  v18 = a1[3];
  v17 = a1[4];
  v47 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  v19 = MEMORY[0x22E2FE2F8](v18, v17);
  if (one-time initialization token for actorSystemKey != -1)
    swift_once();
  v20 = type metadata accessor for CodingUserInfoKey();
  v21 = __swift_project_value_buffer(v20, (uint64_t)static CodingUserInfoKey.actorSystemKey);
  if (*(_QWORD *)(v19 + 16) && (v22 = specialized __RawDictionaryStorage.find<A>(_:)(v21), (v23 & 1) != 0))
    outlined init with copy of Any(*(_QWORD *)(v19 + 56) + 32 * v22, (uint64_t)v46);
  else
    memset(v46, 0, 32);
  swift_bridgeObjectRelease();
  swift_getCanonicalSpecializedMetadata();
  v24 = swift_dynamicCast();
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  if ((v24 & 1) == 0)
  {
    v25(v13, 1, 1, v8);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    *(_QWORD *)&v46[0] = 0;
    *((_QWORD *)&v46[0] + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(39);
    swift_bridgeObjectRelease();
    *(_QWORD *)&v46[0] = 0xD000000000000024;
    *((_QWORD *)&v46[0] + 1) = 0x800000022C665630;
    v31._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v31);
    swift_bridgeObjectRelease();
    v32._countAndFlagsBits = 46;
    v32._object = (void *)0xE100000000000000;
    String.append(_:)(v32);
    v34 = (void *)*((_QWORD *)&v46[0] + 1);
    v33._countAndFlagsBits = *(_QWORD *)&v46[0];
    *(_QWORD *)&v46[0] = 0xD000000000000029;
    *((_QWORD *)&v46[0] + 1) = 0x800000022C665660;
    v33._object = v34;
    String.append(_:)(v33);
    swift_bridgeObjectRelease();
    v29 = *((_QWORD *)&v46[0] + 1);
    v35 = *(_QWORD *)&v46[0];
    lazy protocol witness table accessor for type DistributedActorCodingError and conformance DistributedActorCodingError();
    swift_allocError();
    *v36 = v35;
    v36[1] = v29;
    swift_willThrow();
    v26 = (uint64_t)v47;
    goto LABEL_12;
  }
  v25(v13, 0, 1, v8);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v13, v8);
  v26 = (uint64_t)v47;
  outlined init with copy of Decoder((uint64_t)v47, (uint64_t)v46);
  v28 = v43;
  v27 = AssociatedTypeWitness;
  v29 = AssociatedTypeWitness;
  v30 = v41;
  dispatch thunk of Decodable.init(from:)();
  if (v30)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v8);
LABEL_12:
    __swift_destroy_boxed_opaque_existential_1(v26);
    return v29;
  }
  v29 = (*(uint64_t (**)(char *, char *))(v40 + 64))(v28, v16);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v28, v27);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v8);
  __swift_destroy_boxed_opaque_existential_1(v26);
  return v29;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t DistributedActor<>.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD v14[2];
  _BYTE v15[24];
  uint64_t v16;
  uint64_t v17;

  v14[1] = a4;
  v5 = v4;
  v8 = *(_QWORD *)(a3 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v12 = (char *)v14 - v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  v17 = v5;
  MEMORY[0x22E2FE1B4](a2, v8);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v15, v16);
  dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, AssociatedTypeWitness);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
}

uint64_t _s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v9;

  v7[7] = v6;
  v7[8] = v9;
  v7[5] = a5;
  v7[6] = a6;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  v7[9] = *(_QWORD *)(a6 - 8);
  v7[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t _s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTY0_()
{
  uint64_t v0;
  _QWORD *v2;
  uint64_t (*v3)(_QWORD, _QWORD, _QWORD);

  if ((swift_distributed_actor_is_remote() & 1) != 0)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 40) - 8) + 56))(*(_QWORD *)(v0 + 16), 1, 1);
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v3 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))(**(int **)(v0 + 24) + *(_QWORD *)(v0 + 24));
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v2;
    *v2 = v0;
    v2[1] = _s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTQ1_;
    return v3(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
  }
}

uint64_t _s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTQ1_()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t _s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTY2_()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 40) - 8) + 56))(*(_QWORD *)(v0 + 16), 0, 1);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t _s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTY3_()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 32))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 48));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

BOOL __isLocalActor(_:)()
{
  return (swift_distributed_actor_is_remote() & 1) == 0;
}

uint64_t _s11Distributed0A5ActorPAAE9whenLocalyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v18;
  _QWORD *v19;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v9[2] = a6;
  v9[3] = a9;
  v9[4] = *(_QWORD *)(a6 - 8);
  v18 = swift_task_alloc();
  v9[5] = v18;
  v21 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&_s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTu + _s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTu);
  v19 = (_QWORD *)swift_task_alloc();
  v9[6] = v19;
  *v19 = v9;
  v19[1] = _s11Distributed0A5ActorPAAE9whenLocalyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTQ0_;
  return v21(a1, a2, a3, a4, a5, a6, a7, a8, v18);
}

uint64_t _s11Distributed0A5ActorPAAE9whenLocalyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTQ0_()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t _s11Distributed0A5ActorPAAE9whenLocalyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTY1_()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 32) + 32))(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 16));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DistributedActor.whenLocal<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;

  v7[8] = a6;
  v7[9] = v6;
  v7[6] = a4;
  v7[7] = a5;
  v7[4] = a2;
  v7[5] = a3;
  v7[3] = a1;
  return swift_task_switch();
}

void DistributedActor.whenLocal<A>(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  _QWORD *v4;
  char *v5;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v2;
  v3 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v2 + 32) = v1;
  *(_OWORD *)(v2 + 40) = v3;
  v5 = (char *)&_s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTu
     + _s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTu;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  *v4 = v0;
  v4[1] = DistributedActor.whenLocal<A>(_:);
  __asm { BR              X8 }
}

uint64_t DistributedActor.whenLocal<A>(_:)()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error)(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t);

  *(_QWORD *)(v8 + 16) = a8;
  v13 = (uint64_t (*)(uint64_t, uint64_t))((char *)a3 + *a3);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 24) = v11;
  *v11 = v8;
  v11[1] = thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error);
  return v13(a1, a2);
}

uint64_t thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error)()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = *v1;
  swift_task_dealloc();
  if (v0)
    **(_QWORD **)(v2 + 16) = v0;
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t DistributedActor.__actorUnownedExecutor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t DistributedActor.asLocalActor.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  MEMORY[0x22E2FE49C](&protocol conformance descriptor for A, a1, &v3);
  return swift_unknownObjectRetain();
}

void _distributedStubFatalError(function:)(uint64_t a1, void *a2)
{
  Swift::String v4;
  Swift::String v5;
  Swift::String v6;

  _StringGuts.grow(_:)(54);
  v4._object = (void *)0x800000022C6656B0;
  v4._countAndFlagsBits = 0xD00000000000002DLL;
  String.append(_:)(v4);
  v5._countAndFlagsBits = a1;
  v5._object = a2;
  String.append(_:)(v5);
  v6._countAndFlagsBits = 0x21627574732027;
  v6._object = (void *)0xE700000000000000;
  String.append(_:)(v6);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:)(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v8[12] = a7;
  v8[13] = v7;
  v8[10] = a4;
  v8[11] = a5;
  v8[8] = a1;
  v8[9] = a3;
  v9 = a2[1];
  v8[14] = *a2;
  v8[15] = v9;
  return swift_task_switch();
}

uint64_t DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:)()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t AssociatedConformanceWitness;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t WitnessTables;
  unsigned int ParameterCount;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int ParameterTypeInfo;
  char *v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  int v35;
  Swift::String v36;
  Swift::String v37;
  Swift::String v38;
  Swift::String v39;
  Swift::String v40;
  Swift::String v41;
  Swift::String v42;
  uint64_t v43;
  uint64_t ReturnTypeInfo;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  uint64_t v48;
  Swift::String v49;
  uint64_t v50;
  char *v51;
  Builtin::Word v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  Swift::String v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  Swift::String v61;
  Swift::String v62;
  Swift::String v63;
  uint64_t countAndFlagsBits;
  Swift::String_optional v65;
  void *object;
  void *v67;
  uint64_t v68;
  Swift::String v69;
  uint64_t v70;
  uint64_t result;
  void *v72;
  Swift::String v73;
  Swift::String v74;
  Swift::String v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  Swift::String v79;
  uint64_t *v80;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 120);
  swift_bridgeObjectRetain();
  specialized _copyCollectionToContiguousArray<A>(_:)(v1, v2);
  if (swift_distributed_getGenericEnvironment())
  {
    swift_getAssociatedTypeWitness();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v4 = *(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 16);
    v5 = swift_checkMetadataState();
    v6 = v4(v5, AssociatedConformanceWitness);
    v22 = v6;
    v23 = *(_QWORD *)(v6 + 16);
    if (v23)
    {
      if (v23 >> 60)
      {
        __break(1u);
      }
      else
      {
        v24 = swift_slowAlloc();
        v7 = v24;
        v25 = 0;
        while (v25 < *(_QWORD *)(v22 + 16))
        {
          *(_QWORD *)(v24 + 8 * v25) = *(_QWORD *)(v22 + 8 * v25 + 32);
          if (v23 == ++v25)
          {
            WitnessTables = swift_distributed_getWitnessTables();
            if ((v26 & 0x8000000000000000) == 0)
            {
              swift_bridgeObjectRelease();
              goto LABEL_4;
            }
            v53 = v7;
            v55 = *(_QWORD *)(v0 + 112);
            v54 = *(void **)(v0 + 120);
            swift_release();
            _StringGuts.grow(_:)(71);
            v56 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Generic substitutions ", 0x16uLL, 1);
            String.append(_:)(v56);
            swift_bridgeObjectRelease();
            v57 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any.Type);
            v58 = MEMORY[0x22E2FE0F4](v22, v57);
            v60 = v59;
            swift_bridgeObjectRelease();
            v61._countAndFlagsBits = v58;
            v61._object = v60;
            String.append(_:)(v61);
            swift_bridgeObjectRelease();
            v62 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" do not satisfy generic requirements of ", 0x28uLL, 1);
            String.append(_:)(v62);
            swift_bridgeObjectRelease();
            v63._countAndFlagsBits = v55;
            v63._object = v54;
            v65 = _getFunctionFullNameFromMangledName(mangledName:)(v63);
            countAndFlagsBits = v65.value._countAndFlagsBits;
            if (v65.value._object)
            {
              object = v65.value._object;
              v68 = *(_QWORD *)(v0 + 112);
              v67 = *(void **)(v0 + 120);
            }
            else
            {
              v67 = *(void **)(v0 + 120);
              swift_bridgeObjectRetain();
              v68 = *(_QWORD *)(v0 + 112);
              countAndFlagsBits = v68;
              object = v67;
            }
            v72 = object;
            String.append(_:)(*(Swift::String *)&countAndFlagsBits);
            swift_bridgeObjectRelease();
            v73 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" (", 2uLL, 1);
            String.append(_:)(v73);
            swift_bridgeObjectRelease();
            v74._countAndFlagsBits = v68;
            v74._object = v67;
            String.append(_:)(v74);
            swift_bridgeObjectRelease();
            v75 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(")", 1uLL, 1);
            String.append(_:)(v75);
            swift_bridgeObjectRelease();
            lazy protocol witness table accessor for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError();
            swift_allocError();
            *(_BYTE *)v76 = 3;
            *(_QWORD *)(v76 + 8) = 0;
            *(_QWORD *)(v76 + 16) = 0xE000000000000000;
            swift_willThrow();
            MEMORY[0x22E2FE538](v53, -1, -1);
            goto LABEL_42;
          }
        }
      }
      return _assertionFailure(_:_:file:line:flags:)();
    }
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    v49 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Cannot call generic method without generic argument substitutions", 0x41uLL, 1);
    lazy protocol witness table accessor for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError();
    swift_allocError();
    *(_BYTE *)v50 = 2;
    *(Swift::String *)(v50 + 8) = v49;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v7 = 0;
  WitnessTables = 0;
LABEL_4:
  *(_QWORD *)(v0 + 128) = v7;
  *(_QWORD *)(v0 + 136) = WitnessTables;
  ParameterCount = swift_func_getParameterCount();
  v10 = ParameterCount;
  if ((ParameterCount & 0x80000000) != 0)
  {
    v27 = v7;
    v29 = *(_QWORD *)(v0 + 112);
    v28 = *(void **)(v0 + 120);
    swift_release();
    _StringGuts.grow(_:)(104);
    v30 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to decode distributed invocation target expected parameter count,\nerror code: ", 0x55uLL, 1);
    String.append(_:)(v30);
    swift_bridgeObjectRelease();
    *(_DWORD *)(v0 + 244) = v10;
    v31._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v31);
    swift_bridgeObjectRelease();
    v32 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("\nmangled name: ", 0xFuLL, 1);
    String.append(_:)(v32);
    swift_bridgeObjectRelease();
    v33._countAndFlagsBits = v29;
    v7 = v27;
    v33._object = v28;
    String.append(_:)(v33);
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError();
    swift_allocError();
    *(_BYTE *)v34 = 1;
    *(_QWORD *)(v34 + 8) = 0;
    *(_QWORD *)(v34 + 16) = 0xE000000000000000;
    swift_willThrow();
    if (!v27)
      goto LABEL_22;
    goto LABEL_21;
  }
  v11 = specialized static UnsafeMutableBufferPointer.allocate(capacity:)(ParameterCount);
  *(_QWORD *)(v0 + 144) = v11;
  if (v11)
  {
    v13 = v12;
    v80 = (uint64_t *)v11;
    ParameterTypeInfo = swift_func_getParameterTypeInfo();
    if (ParameterTypeInfo == v10)
    {
      v77 = WitnessTables;
      v78 = v7;
      v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v10, 0, MEMORY[0x24BEE4AF8]);
      v16 = v15;
      if (v13)
      {
        v17 = *((_QWORD *)v15 + 2);
        v18 = 8 * v13;
        v19 = v80;
        do
        {
          v20 = *v19;
          v21 = *((_QWORD *)v16 + 3);
          if (v17 >= v21 >> 1)
            v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v21 > 1), v17 + 1, 1, (uint64_t)v16);
          ++v19;
          *((_QWORD *)v16 + 2) = v17 + 1;
          *(_QWORD *)&v16[8 * v17++ + 32] = v20;
          v18 -= 8;
        }
        while (v18);
      }
      ReturnTypeInfo = swift_func_getReturnTypeInfo();
      *(_QWORD *)(v0 + 152) = ReturnTypeInfo;
      swift_release();
      if (ReturnTypeInfo)
      {
        v45 = static UnsafeMutablePointer.allocate(capacity:)();
        *(_QWORD *)(v0 + 160) = v45;
        if (v45)
        {
          swift_getAssociatedTypeWitness();
          v46 = swift_getAssociatedConformanceWitness();
          v47 = *(uint64_t (**)(uint64_t, uint64_t))(v46 + 40);
          v48 = swift_checkMetadataState();
          *(_QWORD *)(v0 + 168) = v47(v48, v46);
          if ((String.count.getter() & 0x8000000000000000) == 0)
          {
            swift_bridgeObjectRelease();
            *(_QWORD *)(v0 + 176) = String.utf8CString.getter();
            swift_bridgeObjectRelease();
            *(_QWORD *)(v0 + 16) = v0;
            *(_QWORD *)(v0 + 24) = DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:);
            return swift_distributed_execute_target();
          }
          return _assertionFailure(_:_:file:line:flags:)();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v51 = "Failed to allocate buffer for distributed target return type";
        v52 = 60;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v51 = "Failed to decode distributed target return type";
        v52 = 47;
      }
      v69 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(v51, v52, 1);
      lazy protocol witness table accessor for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError();
      swift_allocError();
      *(_BYTE *)v70 = 4;
      *(Swift::String *)(v70 + 8) = v69;
      swift_willThrow();
      MEMORY[0x22E2FE538](v80, -1, -1);
      if (v78)
        MEMORY[0x22E2FE538](v78, -1, -1);
      if (!v77)
        return (*(uint64_t (**)(void))(v0 + 8))();
LABEL_42:
      MEMORY[0x22E2FE538]();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    v35 = ParameterTypeInfo;
    v79 = *(Swift::String *)(v0 + 112);
    swift_release();
    _StringGuts.grow(_:)(145);
    v36 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to decode the expected number of params of distributed invocation target, error code: ", 0x5DuLL, 1);
    String.append(_:)(v36);
    swift_bridgeObjectRelease();
    *(_DWORD *)(v0 + 232) = v35;
    v37._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v37);
    swift_bridgeObjectRelease();
    v38 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("\ndecoded: ", 0xAuLL, 1);
    String.append(_:)(v38);
    swift_bridgeObjectRelease();
    *(_DWORD *)(v0 + 236) = v35;
    v39._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v39);
    swift_bridgeObjectRelease();
    v40 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(", expected params: ", 0x13uLL, 1);
    String.append(_:)(v40);
    swift_bridgeObjectRelease();
    *(_DWORD *)(v0 + 240) = v10;
    v41._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v41);
    swift_bridgeObjectRelease();
    v42 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("\nmangled name: ", 0xFuLL, 1);
    String.append(_:)(v42);
    swift_bridgeObjectRelease();
    String.append(_:)(v79);
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError();
    swift_allocError();
    *(_BYTE *)v43 = 1;
    *(_QWORD *)(v43 + 8) = 0;
    *(_QWORD *)(v43 + 16) = 0xE000000000000000;
    swift_willThrow();
    MEMORY[0x22E2FE538](v80, -1, -1);
    if (!v7)
    {
LABEL_22:
      if (!WitnessTables)
        return (*(uint64_t (**)(void))(v0 + 8))();
      goto LABEL_42;
    }
LABEL_21:
    MEMORY[0x22E2FE538](v7, -1, -1);
    goto LABEL_22;
  }
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t AssociatedConformanceWitness;
  int *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t (*v15)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD);
  uint64_t (*v16)(uint64_t, uint64_t);

  v2 = (_QWORD *)*v1;
  v2[23] = v0;
  if (v0)
    return swift_task_switch();
  v4 = v2[21];
  v5 = v2[19];
  swift_release();
  if (v4)
    v6 = v4;
  else
    v6 = v5;
  if (v6 == MEMORY[0x24BEE4AE0] + 8)
  {
    swift_getAssociatedTypeWitness();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v12 = *(int **)(AssociatedConformanceWitness + 24);
    v13 = swift_checkMetadataState();
    v16 = (uint64_t (*)(uint64_t, uint64_t))((char *)v12 + *v12);
    v14 = (_QWORD *)swift_task_alloc();
    v2[24] = v14;
    *v14 = v2;
    v14[1] = DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:);
    return v16(v13, AssociatedConformanceWitness);
  }
  else
  {
    v7 = v2[21];
    v8 = v2[19];
    v15 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD))(**(int **)(v2[12] + 136)
                                                                          + *(_QWORD *)(v2[12] + 136));
    v9 = (_QWORD *)swift_task_alloc();
    v2[25] = v9;
    *v9 = v2;
    v9[1] = DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:);
    if (v7)
      v10 = v7;
    else
      v10 = v8;
    return v15(v2[10], v2[20], v10, v2[11], v2[12]);
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedConformanceWitness;
  int *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  int *v11;

  v2 = *v1;
  v3 = *v1;
  swift_task_dealloc();
  if (!v0)
    return swift_task_switch();
  *(_QWORD *)(v2 + 56) = v0;
  v4 = v2 + 56;
  *(_QWORD *)(v4 + 152) = v0;
  swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v6 = *(int **)(AssociatedConformanceWitness + 32);
  v7 = swift_checkMetadataState();
  v11 = (int *)((char *)v6 + *v6);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 160) = v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  *v8 = v3;
  v8[1] = DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:);
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))v11)(v4, v9, MEMORY[0x24BEE3F20], v7, AssociatedConformanceWitness);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 128);
  UnsafePointer.deallocate()();
  MEMORY[0x22E2FE538](v1, -1, -1);
  if (v2)
    MEMORY[0x22E2FE538](*(_QWORD *)(v0 + 128), -1, -1);
  v3 = *(_QWORD *)(v0 + 136);
  if (v3)
    MEMORY[0x22E2FE538](v3, -1, -1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedConformanceWitness;
  int *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  int *v11;

  v2 = *v1;
  v3 = *v1;
  swift_task_dealloc();
  if (!v0)
    return swift_task_switch();
  *(_QWORD *)(v2 + 56) = v0;
  v4 = v2 + 56;
  *(_QWORD *)(v4 + 152) = v0;
  swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v6 = *(int **)(AssociatedConformanceWitness + 32);
  v7 = swift_checkMetadataState();
  v11 = (int *)((char *)v6 + *v6);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 160) = v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  *v8 = v3;
  v8[1] = DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:);
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))v11)(v4, v9, MEMORY[0x24BEE3F20], v7, AssociatedConformanceWitness);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 224) = v0;
  swift_task_dealloc();
  if (!v0)
    MEMORY[0x22E2FE40C](*(_QWORD *)(v2 + 208));
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t AssociatedConformanceWitness;
  int *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  int *v8;

  swift_release();
  v1 = v0[23];
  v0[26] = v1;
  v0[7] = v1;
  swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v3 = *(int **)(AssociatedConformanceWitness + 32);
  v4 = swift_checkMetadataState();
  v8 = (int *)((char *)v3 + *v3);
  v5 = (_QWORD *)swift_task_alloc();
  v0[27] = v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  *v5 = v0;
  v5[1] = DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:);
  return ((uint64_t (*)(_QWORD *, uint64_t, _QWORD, uint64_t, uint64_t))v8)(v0 + 7, v6, MEMORY[0x24BEE3F20], v4, AssociatedConformanceWitness);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 128);
  MEMORY[0x22E2FE40C](*(_QWORD *)(v0 + 208));
  UnsafePointer.deallocate()();
  MEMORY[0x22E2FE538](v1, -1, -1);
  if (v2)
    MEMORY[0x22E2FE538](*(_QWORD *)(v0 + 128), -1, -1);
  v3 = *(_QWORD *)(v0 + 136);
  if (v3)
    MEMORY[0x22E2FE538](v3, -1, -1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Distributed::ExecuteDistributedTargetError __swiftcall ExecuteDistributedTargetError.init(message:errorCode:)(Distributed::ExecuteDistributedTargetError message, Distributed::ExecuteDistributedTargetError::ErrorCode errorCode)
{
  uint64_t v2;

  *(_BYTE *)v2 = *(_BYTE *)errorCode;
  *(Swift::String *)(v2 + 8) = *(Swift::String *)&message.errorCode;
  LOBYTE(message.message._object) = errorCode;
  return message;
}

uint64_t specialized static UnsafeMutableBufferPointer.allocate(capacity:)(uint64_t a1)
{
  uint64_t result;

  if ((unint64_t)(a1 - 0x1000000000000000) >> 61 != 7)
  {
    __break(1u);
    goto LABEL_5;
  }
  result = swift_slowAlloc();
  if (a1 < 0)
  {
LABEL_5:
    result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t RemoteCallTarget.description.getter()
{
  Swift::String *v0;
  uint64_t countAndFlagsBits;
  uint64_t result;
  Swift::String_optional v3;

  countAndFlagsBits = v0->_countAndFlagsBits;
  v3 = _getFunctionFullNameFromMangledName(mangledName:)(*v0);
  result = v3.value._countAndFlagsBits;
  if (!v3.value._object)
  {
    swift_bridgeObjectRetain();
    return countAndFlagsBits;
  }
  return result;
}

uint64_t RemoteCallTarget.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance RemoteCallTarget()
{
  Swift::String *v0;
  uint64_t countAndFlagsBits;
  uint64_t result;
  Swift::String_optional v3;

  countAndFlagsBits = v0->_countAndFlagsBits;
  v3 = _getFunctionFullNameFromMangledName(mangledName:)(*v0);
  result = v3.value._countAndFlagsBits;
  if (!v3.value._object)
  {
    swift_bridgeObjectRetain();
    return countAndFlagsBits;
  }
  return result;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance RemoteCallTarget()
{
  return String.hash(into:)();
}

uint64_t RemoteCallArgument.label.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RemoteCallArgument.effectiveLabel.getter()
{
  uint64_t *v0;
  uint64_t v1;

  if (!v0[1])
    return 95;
  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RemoteCallArgument.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RemoteCallArgument.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 32));
}

uint64_t RemoteCallArgument.init(label:name:value:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  char *v9;

  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  v9 = (char *)a7 + *(int *)(type metadata accessor for RemoteCallArgument(0, a6, a3, a4) + 32);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 32))(v9, a5, a6);
}

void ExecuteDistributedTargetError.errorCode.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t ExecuteDistributedTargetError.message.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

BOOL static ExecuteDistributedTargetError.ErrorCode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void ExecuteDistributedTargetError.ErrorCode.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int ExecuteDistributedTargetError.ErrorCode.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ExecuteDistributedTargetError.ErrorCode(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ExecuteDistributedTargetError.ErrorCode()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ExecuteDistributedTargetError.ErrorCode()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ExecuteDistributedTargetError.ErrorCode()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Distributed::ExecuteDistributedTargetError __swiftcall ExecuteDistributedTargetError.init(message:)(Distributed::ExecuteDistributedTargetError message)
{
  uint64_t v1;

  *(_BYTE *)v1 = 5;
  *(Swift::String *)(v1 + 8) = *(Swift::String *)&message.errorCode;
  return message;
}

void static DistributedActorCodingError.missingActorSystemUserInfo<A>(_:)(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000036;
  a1[1] = 0x800000022C665A10;
}

void _diagnoseDistributedStubMethodCalled(className:funcName:file:line:column:)()
{
  Swift::String v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;

  _StringGuts.grow(_:)(32);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = StaticString.description.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 46;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  v2._countAndFlagsBits = StaticString.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 39;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t DistributedActor.preconditionIsolated(_:file:line:)(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void (*v11)(uint64_t, uint64_t);
  uint64_t result;
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;

  v11 = *(void (**)(uint64_t, uint64_t))(a8 + 56);
  v11(a7, a8);
  UnownedSerialExecutor._executor.getter();
  result = swift_task_isCurrentExecutor();
  if ((result & 1) == 0)
  {
    _StringGuts.grow(_:)(63);
    v13._object = (void *)0x800000022C665A70;
    v13._countAndFlagsBits = 0xD00000000000002FLL;
    String.append(_:)(v13);
    v11(a7, a8);
    _print_unlocked<A, B>(_:_:)();
    v14._countAndFlagsBits = 0x7475636578652027;
    v14._object = (void *)0xEC000000202E726FLL;
    String.append(_:)(v14);
    v15._countAndFlagsBits = a1();
    String.append(_:)(v15);
    swift_bridgeObjectRelease();
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t DistributedActor.assertIsolated(_:file:line:)(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  Swift::String v10;
  Swift::String v11;
  Swift::String v12;

  (*(void (**)(uint64_t, uint64_t))(a8 + 56))(a7, a8);
  UnownedSerialExecutor._executor.getter();
  result = swift_task_isCurrentExecutor();
  if ((result & 1) == 0)
  {
    _StringGuts.grow(_:)(63);
    v10._object = (void *)0x800000022C665A70;
    v10._countAndFlagsBits = 0xD00000000000002FLL;
    String.append(_:)(v10);
    _print_unlocked<A, B>(_:_:)();
    v11._countAndFlagsBits = 0x7475636578652027;
    v11._object = (void *)0xEC000000202E726FLL;
    String.append(_:)(v11);
    v12._countAndFlagsBits = a1();
    String.append(_:)(v12);
    swift_bridgeObjectRelease();
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t DistributedActor.assumeIsolated<A>(_:file:line:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t result;
  char isEscapingClosureAtFileLocation;
  Swift::String v18;
  Swift::String v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  Swift::String v23;

  if ((swift_distributed_actor_is_remote() & 1) != 0)
    goto LABEL_7;
  (*(void (**)(uint64_t, uint64_t))(a9 + 56))(a7, a9);
  UnownedSerialExecutor._executor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
  {
LABEL_8:
    _StringGuts.grow(_:)(66);
    v22._countAndFlagsBits = 0xD00000000000003FLL;
    v22._object = (void *)0x800000022C665F70;
    String.append(_:)(v22);
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    v23._countAndFlagsBits = 46;
    v23._object = (void *)0xE100000000000000;
    String.append(_:)(v23);
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a7;
  v14[3] = a8;
  v14[4] = a9;
  v14[5] = a1;
  v14[6] = a2;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a7;
  v15[3] = a8;
  v15[4] = a9;
  v15[5] = partial apply for thunk for @callee_guaranteed (@guaranteed A) -> (@out A1, @error @owned Error);
  v15[6] = v14;
  swift_retain();
  partial apply for thunk for @callee_guaranteed (@guaranteed A) -> (@out A1, @error @owned Error)();
  swift_release();
  if (v9)
    return swift_release();
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
LABEL_7:
    _StringGuts.grow(_:)(91);
    v18._object = (void *)0x800000022C665FE0;
    v18._countAndFlagsBits = 0xD00000000000001ELL;
    String.append(_:)(v18);
    v19._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v19);
    swift_bridgeObjectRelease();
    v20._countAndFlagsBits = 0xD00000000000001BLL;
    v20._object = (void *)0x800000022C666000;
    String.append(_:)(v20);
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    v21._object = (void *)0x800000022C666020;
    v21._countAndFlagsBits = 0xD00000000000001ELL;
    String.append(_:)(v21);
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    goto LABEL_8;
  }
  return result;
}

{
  return DistributedActor.assumeIsolated<A>(_:file:line:)(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t DistributedRemoteActorReferenceExecutor.asUnownedSerialExecutor()()
{
  uint64_t v0;

  lazy protocol witness table accessor for type DistributedRemoteActorReferenceExecutor and conformance DistributedRemoteActorReferenceExecutor(&lazy protocol witness table cache variable for type DistributedRemoteActorReferenceExecutor and conformance DistributedRemoteActorReferenceExecutor, (uint64_t)&protocol conformance descriptor for DistributedRemoteActorReferenceExecutor);
  return v0;
}

uint64_t DistributedRemoteActorReferenceExecutor.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t DistributedRemoteActorReferenceExecutor.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t protocol witness for SerialExecutor.enqueue(_:) in conformance DistributedRemoteActorReferenceExecutor()
{
  lazy protocol witness table accessor for type DistributedRemoteActorReferenceExecutor and conformance DistributedRemoteActorReferenceExecutor(&lazy protocol witness table cache variable for type DistributedRemoteActorReferenceExecutor and conformance DistributedRemoteActorReferenceExecutor, (uint64_t)&protocol conformance descriptor for DistributedRemoteActorReferenceExecutor);
  return Executor.enqueue(_:)();
}

{
  lazy protocol witness table accessor for type DistributedRemoteActorReferenceExecutor and conformance DistributedRemoteActorReferenceExecutor(&lazy protocol witness table cache variable for type DistributedRemoteActorReferenceExecutor and conformance DistributedRemoteActorReferenceExecutor, (uint64_t)&protocol conformance descriptor for DistributedRemoteActorReferenceExecutor);
  return Executor.enqueue(_:)();
}

uint64_t protocol witness for SerialExecutor.asUnownedSerialExecutor() in conformance DistributedRemoteActorReferenceExecutor()
{
  uint64_t v0;

  return v0;
}

uint64_t protocol witness for SerialExecutor.isSameExclusiveExecutionContext(other:) in conformance DistributedRemoteActorReferenceExecutor()
{
  return SerialExecutor.isSameExclusiveExecutionContext(other:)();
}

void protocol witness for SerialExecutor.checkIsolated() in conformance DistributedRemoteActorReferenceExecutor()
{
  JUMPOUT(0x22E2FE124);
}

uint64_t protocol witness for Executor.enqueue(_:) in conformance DistributedRemoteActorReferenceExecutor()
{
  return Executor.enqueue(_:)();
}

{
  return Executor.enqueue(_:)();
}

uint64_t buildDefaultDistributedRemoteActorExecutor<A>(_:)()
{
  uint64_t inited;

  type metadata accessor for DistributedRemoteActorReferenceExecutor();
  inited = swift_initStaticObject();
  lazy protocol witness table accessor for type DistributedRemoteActorReferenceExecutor and conformance DistributedRemoteActorReferenceExecutor(&lazy protocol witness table cache variable for type DistributedRemoteActorReferenceExecutor and conformance DistributedRemoteActorReferenceExecutor, (uint64_t)&protocol conformance descriptor for DistributedRemoteActorReferenceExecutor);
  return inited;
}

Swift::Int32 __swiftcall _getParameterCount(mangledMethodName:)(Swift::String mangledMethodName)
{
  Swift::Int32 ParameterCount;

  specialized _copyCollectionToContiguousArray<A>(_:)(mangledMethodName._countAndFlagsBits, (unint64_t)mangledMethodName._object);
  ParameterCount = swift_func_getParameterCount();
  swift_release();
  return ParameterCount;
}

uint64_t _getParameterTypeInfo(mangledMethodName:genericEnv:genericArguments:into:length:)(uint64_t a1, unint64_t a2)
{
  uint64_t ParameterTypeInfo;

  specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  ParameterTypeInfo = swift_func_getParameterTypeInfo();
  swift_release();
  return ParameterTypeInfo;
}

uint64_t _getReturnTypeInfo(mangledMethodName:genericEnv:genericArguments:)(uint64_t a1, unint64_t a2)
{
  uint64_t ReturnTypeInfo;

  specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  ReturnTypeInfo = swift_func_getReturnTypeInfo();
  swift_release();
  return ReturnTypeInfo;
}

uint64_t swift_distributed_makeDistributedTargetAccessorNotFoundError()
{
  uint64_t result;
  uint64_t v1;

  lazy protocol witness table accessor for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError();
  result = swift_allocError();
  *(_BYTE *)v1 = 0;
  *(_QWORD *)(v1 + 8) = 0xD00000000000002ELL;
  *(_QWORD *)(v1 + 16) = 0x800000022C665AC0;
  return result;
}

uint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t result;
  __int128 v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    swift_retain();
    goto LABEL_12;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<LocalTestingActorID, DistributedActor>);
  v2 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
  v3 = *(_QWORD *)(a1 + 16);
  swift_retain();
  if (!v3)
  {
LABEL_12:
    swift_release();
    swift_bridgeObjectRelease();
    return (uint64_t)v2;
  }
  v4 = 0;
  v5 = (_OWORD *)(a1 + 48);
  while (v4 < *(_QWORD *)(a1 + 16))
  {
    v6 = *((_QWORD *)v5 - 1);
    v15 = *v5;
    if (!v6)
    {
      swift_unknownObjectRetain();
      goto LABEL_12;
    }
    v7 = *((_QWORD *)v5 - 2);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    v8 = specialized __RawDictionaryStorage.find<A>(_:)(v7, v6);
    if ((v9 & 1) != 0)
      goto LABEL_15;
    *(_QWORD *)((char *)v2 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v8;
    v10 = (uint64_t *)(v2[6] + 16 * v8);
    *v10 = v7;
    v10[1] = v6;
    *(_OWORD *)(v2[7] + 16 * v8) = v15;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
    {
      __break(1u);
      break;
    }
    ++v4;
    v2[2] = v13;
    v5 += 2;
    if (v3 == v4)
      goto LABEL_12;
  }
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
LABEL_15:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t LocalTestingDistributedActorSystem.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  LocalTestingDistributedActorSystem.init()();
  return v0;
}

_QWORD *LocalTestingDistributedActorSystem.init()()
{
  _QWORD *v0;
  uint64_t v1;
  _DWORD *v2;
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  _DWORD *v6;

  v0[2] = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x24BEE4AF8]);
  type metadata accessor for _Lock();
  v1 = swift_allocObject();
  v2 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = 0;
  v0[3] = v1;
  v3 = swift_allocObject();
  v4 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = 0;
  v0[4] = 0;
  v0[5] = v3;
  v0[6] = MEMORY[0x24BEE4B08];
  v5 = swift_allocObject();
  v6 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v5 + 16) = v6;
  *v6 = 0;
  v0[7] = v5;
  return v0;
}

uint64_t LocalTestingDistributedActorSystem.resolve<A>(id:as:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  Swift::String v10;
  Swift::String v11;
  _OWORD *v12;
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;
  uint64_t v16;
  __int128 v17;

  v3 = *a1;
  v2 = a1[1];
  v4 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + 24) + 16);
  os_unfair_lock_lock(v4);
  v5 = *(_QWORD *)(v1 + 16);
  if (!*(_QWORD *)(v5 + 16) || (v6 = specialized __RawDictionaryStorage.find<A>(_:)(v3, v2), (v7 & 1) == 0))
  {
    os_unfair_lock_unlock(v4);
    goto LABEL_7;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 16 * v6);
  swift_unknownObjectRetain();
  os_unfair_lock_unlock(v4);
  if (!v8)
  {
LABEL_7:
    *(_QWORD *)&v17 = 0;
    *((_QWORD *)&v17 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(32);
    v10._object = (void *)0x800000022C665AF0;
    v10._countAndFlagsBits = 0xD000000000000015;
    String.append(_:)(v10);
    _print_unlocked<A, B>(_:_:)();
    v11._countAndFlagsBits = 0x6C6C61636F6C2027;
    v11._object = (void *)0xE900000000000079;
    String.append(_:)(v11);
    goto LABEL_8;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DistributedActor);
  if ((swift_dynamicCast() & 1) != 0)
    return v16;
  *(_QWORD *)&v17 = 0;
  *((_QWORD *)&v17 + 1) = 0xE000000000000000;
  _StringGuts.grow(_:)(31);
  v13._countAndFlagsBits = 0xD000000000000016;
  v13._object = (void *)0x800000022C665B10;
  String.append(_:)(v13);
  _print_unlocked<A, B>(_:_:)();
  v14._countAndFlagsBits = 0x2073612027;
  v14._object = (void *)0xE500000000000000;
  String.append(_:)(v14);
  swift_getMetatypeMetadata();
  v15._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
LABEL_8:
  lazy protocol witness table accessor for type LocalTestingDistributedActorSystemError and conformance LocalTestingDistributedActorSystemError();
  swift_allocError();
  *v12 = v17;
  return swift_willThrow();
}

Distributed::LocalTestingDistributedActorSystemError __swiftcall LocalTestingDistributedActorSystemError.init(message:)(Distributed::LocalTestingDistributedActorSystemError message)
{
  Distributed::LocalTestingDistributedActorSystemError *v1;

  *v1 = message;
  return message;
}

void LocalTestingDistributedActorSystem.assignID<A>(_:)(Swift::Int *a1@<X8>)
{
  _QWORD *v1;
  os_unfair_lock_s *v3;
  uint64_t v4;
  Swift::Int v5;
  Swift::Int v6;
  Swift::Int v7;
  os_unfair_lock_s *v8;
  Swift::Int v9;

  v3 = *(os_unfair_lock_s **)(v1[5] + 16);
  swift_retain();
  os_unfair_lock_lock(v3);
  v4 = v1[4];
  if (__OFADD__(v4, 1))
  {
    __break(1u);
  }
  else
  {
    v1[4] = v4 + 1;
    os_unfair_lock_unlock(v3);
    swift_release();
    v5 = dispatch thunk of CustomStringConvertible.description.getter();
    v7 = v6;
    v8 = *(os_unfair_lock_s **)(v1[7] + 16);
    os_unfair_lock_lock(v8);
    swift_bridgeObjectRetain();
    specialized Set._Variant.insert(_:)(&v9, v5, v7);
    os_unfair_lock_unlock(v8);
    swift_bridgeObjectRelease();
    *a1 = v5;
    a1[1] = v7;
  }
}

void LocalTestingDistributedActorSystem.actorReady<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  os_unfair_lock_s *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = v3;
  v8 = *(os_unfair_lock_s **)(v3[7] + 16);
  os_unfair_lock_lock(v8);
  v9 = v3[6];
  v18 = a1;
  v10 = *(_QWORD *)(a3 + 16);
  swift_bridgeObjectRetain();
  MEMORY[0x22E2FE1B4](&v19, a2, v10);
  v11 = specialized Set.contains(_:)(v19, v20, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v8);
  if ((v11 & 1) != 0)
  {
    v12 = *(os_unfair_lock_s **)(v3[3] + 16);
    os_unfair_lock_lock(v12);
    v18 = a1;
    MEMORY[0x22E2FE1B4](&v19, a2, v10);
    v13 = v19;
    v14 = v20;
    swift_unknownObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = v4[2];
    v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a1, v13, v14, isUniquelyReferenced_nonNull_native, &v18, a2, a3);
    swift_bridgeObjectRelease();
    v4[2] = v18;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v12);
  }
  else
  {
    v19 = 0;
    v20 = 0xE000000000000000;
    _StringGuts.grow(_:)(45);
    v16._object = (void *)0x800000022C665B30;
    v16._countAndFlagsBits = 0xD000000000000024;
    String.append(_:)(v16);
    MEMORY[0x22E2FE1B4](&v18, a2, v10);
    _print_unlocked<A, B>(_:_:)();
    swift_bridgeObjectRelease();
    v17._countAndFlagsBits = 0x79646165722027;
    v17._object = (void *)0xE700000000000000;
    String.append(_:)(v17);
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

uint64_t specialized Set.contains(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Swift::Int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;

  if (!*(_QWORD *)(a3 + 16))
    return 0;
  Hasher.init(_seed:)();
  String.hash(into:)();
  v6 = Hasher._finalize()();
  v7 = -1 << *(_BYTE *)(a3 + 32);
  v8 = v6 & ~v7;
  v9 = a3 + 56;
  if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
    return 0;
  v10 = ~v7;
  v11 = *(_QWORD *)(a3 + 48);
  while (1)
  {
    v12 = (_QWORD *)(v11 + 16 * v8);
    v13 = *v12 == a1 && v12[1] == a2;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      break;
    v8 = (v8 + 1) & v10;
    if (((*(_QWORD *)(v9 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
      return 0;
  }
  return 1;
}

Swift::Void __swiftcall LocalTestingDistributedActorSystem.resignID(_:)(Distributed::LocalTestingActorID a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  os_unfair_lock_s *v4;

  v2 = *(_QWORD *)a1.id._countAndFlagsBits;
  v3 = *(_QWORD *)(a1.id._countAndFlagsBits + 8);
  v4 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + 24) + 16);
  os_unfair_lock_lock(v4);
  specialized Dictionary._Variant.removeValue(forKey:)(v2, v3);
  swift_unknownObjectRelease();
  os_unfair_lock_unlock(v4);
}

uint64_t LocalTestingDistributedActorSystem.remoteCall<A, B, C>(on:target:invocation:throwing:returning:)(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v9;

  v7[3] = a2;
  v7[4] = a7;
  swift_conformsToProtocol();
  swift_conformsToProtocol();
  v9 = a3[1];
  v7[5] = *a3;
  v7[6] = v9;
  return swift_task_switch();
}

uint64_t LocalTestingDistributedActorSystem.remoteCall<A, B, C>(on:target:invocation:throwing:returning:)()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  Swift::String v3;
  Swift::String v4;
  uint64_t countAndFlagsBits;
  Swift::String_optional v6;
  void *object;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;

  v2 = v0[5];
  v1 = (void *)v0[6];
  swift_bridgeObjectRetain();
  _StringGuts.grow(_:)(79);
  v3._countAndFlagsBits = 0xD000000000000021;
  v3._object = (void *)0x800000022C665BA0;
  String.append(_:)(v3);
  v4._countAndFlagsBits = v2;
  v4._object = v1;
  v6 = _getFunctionFullNameFromMangledName(mangledName:)(v4);
  countAndFlagsBits = v6.value._countAndFlagsBits;
  if (v6.value._object)
  {
    object = v6.value._object;
  }
  else
  {
    object = (void *)v0[6];
    swift_bridgeObjectRetain();
    countAndFlagsBits = v0[5];
  }
  v8 = v0[3];
  v9 = object;
  String.append(_:)(*(Swift::String *)&countAndFlagsBits);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 0x6F746361206E6F20;
  v10._object = (void *)0xEA00000000002072;
  String.append(_:)(v10);
  v0[2] = v8;
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v11._object = (void *)0x800000022C665BD0;
  v11._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v11);
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:)(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, _QWORD *, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, _QWORD *, uint64_t, uint64_t))((char *)&async function pointer to specialized LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:)
                                                                    + async function pointer to specialized LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:);
  return v12(a1, a2, a3, a5);
}

uint64_t LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t LocalTestingDistributedActorSystem.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t LocalTestingDistributedActorSystem.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t LocalTestingDistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = a3;
  return swift_task_switch();
}

uint64_t LocalTestingDistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = dynamic_cast_existential_2_unconditional(v0[3]);
  v3 = v2;
  v5 = v4;
  v6 = (_QWORD *)swift_task_alloc();
  v0[4] = (uint64_t)v6;
  *v6 = v0;
  v6[1] = LocalTestingDistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:);
  return doInvokeOnReturn #1 <A>(returnType:) in LocalTestingDistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:)(v1, v0[2], v1, v3, v5);
}

{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t doInvokeOnReturn #1 <A>(returnType:) in LocalTestingDistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v5[7] = *(_QWORD *)(a3 - 8);
  v5[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t doInvokeOnReturn #1 <A>(returnType:) in LocalTestingDistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:)()
{
  uint64_t v0;
  _QWORD *v1;

  UnsafeRawPointer.load<A>(fromByteOffset:as:)();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v1;
  *v1 = v0;
  v1[1] = doInvokeOnReturn #1 <A>(returnType:) in LocalTestingDistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:);
  return LocalTestingInvocationResultHandler.onReturn<A>(value:)();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 32);
  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch();
}

{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t protocol witness for DistributedActorSystem.resolve<A>(id:as:) in conformance LocalTestingDistributedActorSystem(uint64_t *a1)
{
  return LocalTestingDistributedActorSystem.resolve<A>(id:as:)(a1);
}

void protocol witness for DistributedActorSystem.assignID<A>(_:) in conformance LocalTestingDistributedActorSystem(Swift::Int *a1@<X8>)
{
  LocalTestingDistributedActorSystem.assignID<A>(_:)(a1);
}

void protocol witness for DistributedActorSystem.actorReady<A>(_:) in conformance LocalTestingDistributedActorSystem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  LocalTestingDistributedActorSystem.actorReady<A>(_:)(a1, a2, a3);
}

void protocol witness for DistributedActorSystem.resignID(_:) in conformance LocalTestingDistributedActorSystem(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  os_unfair_lock_s *v4;

  v2 = *a1;
  v3 = a1[1];
  v4 = *(os_unfair_lock_s **)(*(_QWORD *)(*(_QWORD *)v1 + 24) + 16);
  os_unfair_lock_lock(v4);
  specialized Dictionary._Variant.removeValue(forKey:)(v2, v3);
  swift_unknownObjectRelease();
  os_unfair_lock_unlock(v4);
}

uint64_t protocol witness for DistributedActorSystem.remoteCall<A, B, C>(on:target:invocation:throwing:returning:) in conformance LocalTestingDistributedActorSystem(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v11;
  uint64_t v12;

  swift_conformsToProtocol();
  swift_conformsToProtocol();
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v11;
  *v11 = v7;
  v11[1] = protocol witness for DistributedActorSystem.remoteCall<A, B, C>(on:target:invocation:throwing:returning:) in conformance LocalTestingDistributedActorSystem;
  v11[3] = a2;
  v11[4] = a7;
  v12 = a3[1];
  v11[5] = *a3;
  v11[6] = v12;
  return swift_task_switch();
}

uint64_t protocol witness for DistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:) in conformance LocalTestingDistributedActorSystem(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, _QWORD *, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, _QWORD *, uint64_t, uint64_t))((char *)&async function pointer to specialized LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:)
                                                                    + async function pointer to specialized LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = protocol witness for DistributedActorSystem.remoteCall<A, B, C>(on:target:invocation:throwing:returning:) in conformance LocalTestingDistributedActorSystem;
  return v12(a1, a2, a3, a5);
}

uint64_t protocol witness for DistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:) in conformance LocalTestingDistributedActorSystem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = a3;
  return swift_task_switch();
}

uint64_t LocalTestingActorID.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[4];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Decoder.singleValueContainer()();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v9, v9[3]);
    v5 = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
    v7 = v6;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    *a2 = v5;
    a2[1] = v7;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t LocalTestingActorID.encode(to:)(_QWORD *a1)
{
  _BYTE v2[24];
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  dispatch thunk of SingleValueEncodingContainer.encode(_:)();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

uint64_t static RemoteCallTarget.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)();
}

Swift::Int RemoteCallTarget.hashValue.getter()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance RemoteCallTarget()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  return Hasher._finalize()();
}

uint64_t protocol witness for Decodable.init(from:) in conformance LocalTestingActorID@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[4];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Decoder.singleValueContainer()();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v9, v9[3]);
    v5 = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
    v7 = v6;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    *a2 = v5;
    a2[1] = v7;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance LocalTestingActorID(_QWORD *a1)
{
  _BYTE v2[24];
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  dispatch thunk of SingleValueEncodingContainer.encode(_:)();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

void LocalTestingInvocationEncoder.recordGenericSubstitution<A>(_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void LocalTestingInvocationEncoder.recordArgument<A>(_:)()
{
  swift_conformsToProtocol();
  swift_conformsToProtocol();
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void LocalTestingInvocationEncoder.recordErrorType<A>(_:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void LocalTestingInvocationEncoder.recordReturnType<A>(_:)()
{
  swift_conformsToProtocol();
  swift_conformsToProtocol();
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LocalTestingInvocationEncoder.doneRecording()()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void protocol witness for DistributedTargetInvocationEncoder.recordGenericSubstitution<A>(_:) in conformance LocalTestingInvocationEncoder()
{
  LocalTestingInvocationEncoder.recordGenericSubstitution<A>(_:)();
}

void protocol witness for DistributedTargetInvocationEncoder.recordArgument<A>(_:) in conformance LocalTestingInvocationEncoder()
{
  swift_conformsToProtocol();
  swift_conformsToProtocol();
  LocalTestingInvocationEncoder.recordArgument<A>(_:)();
}

void protocol witness for DistributedTargetInvocationEncoder.recordErrorType<A>(_:) in conformance LocalTestingInvocationEncoder()
{
  LocalTestingInvocationEncoder.recordErrorType<A>(_:)();
}

void protocol witness for DistributedTargetInvocationEncoder.recordReturnType<A>(_:) in conformance LocalTestingInvocationEncoder()
{
  swift_conformsToProtocol();
  swift_conformsToProtocol();
  LocalTestingInvocationEncoder.recordReturnType<A>(_:)();
}

void protocol witness for DistributedTargetInvocationEncoder.doneRecording() in conformance LocalTestingInvocationEncoder()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void LocalTestingInvocationDecoder.decodeGenericSubstitutions()()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void LocalTestingInvocationDecoder.decodeNextArgument<A>()()
{
  swift_conformsToProtocol();
  swift_conformsToProtocol();
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void LocalTestingInvocationDecoder.decodeErrorType()()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void LocalTestingInvocationDecoder.decodeReturnType()()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t LocalTestingInvocationDecoder.deinit()
{
  uint64_t v0;

  return v0;
}

void protocol witness for DistributedTargetInvocationDecoder.decodeGenericSubstitutions() in conformance LocalTestingInvocationDecoder()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void protocol witness for DistributedTargetInvocationDecoder.decodeNextArgument<A>() in conformance LocalTestingInvocationDecoder()
{
  swift_conformsToProtocol();
  swift_conformsToProtocol();
  LocalTestingInvocationDecoder.decodeNextArgument<A>()();
}

void protocol witness for DistributedTargetInvocationDecoder.decodeErrorType() in conformance LocalTestingInvocationDecoder()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void protocol witness for DistributedTargetInvocationDecoder.decodeReturnType() in conformance LocalTestingInvocationDecoder()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t LocalTestingInvocationResultHandler.onReturn<A>(value:)()
{
  swift_conformsToProtocol();
  swift_conformsToProtocol();
  return swift_task_switch();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t LocalTestingInvocationResultHandler.onReturnVoid()()
{
  return swift_task_switch();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t LocalTestingInvocationResultHandler.onThrow<A>(error:)()
{
  return swift_task_switch();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t protocol witness for DistributedTargetInvocationResultHandler.onReturn<A>(value:) in conformance LocalTestingInvocationResultHandler()
{
  uint64_t v0;
  _QWORD *v1;

  swift_conformsToProtocol();
  swift_conformsToProtocol();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = protocol witness for DistributedActorSystem.remoteCall<A, B, C>(on:target:invocation:throwing:returning:) in conformance LocalTestingDistributedActorSystem;
  return LocalTestingInvocationResultHandler.onReturn<A>(value:)();
}

uint64_t protocol witness for DistributedTargetInvocationResultHandler.onReturnVoid() in conformance LocalTestingInvocationResultHandler()
{
  return swift_task_switch();
}

uint64_t protocol witness for DistributedTargetInvocationResultHandler.onThrow<A>(error:) in conformance LocalTestingInvocationResultHandler()
{
  return swift_task_switch();
}

uint64_t LocalTestingDistributedActorSystemError.message.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t _Lock.__deallocating_deinit()
{
  uint64_t v0;

  MEMORY[0x22E2FE538](*(_QWORD *)(v0 + 16), -1, -1);
  return swift_deallocClassInstance();
}

uint64_t protocol witness for Actor.unownedExecutor.getter in conformance A(uint64_t a1, uint64_t a2)
{
  return DistributedActor.__actorUnownedExecutor.getter(a1, *(_QWORD *)(a2 - 8));
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v2;

  type metadata accessor for CodingUserInfoKey();
  v2 = dispatch thunk of Hashable._rawHashValue(seed:)();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t lazy protocol witness table accessor for type DistributedActorCodingError and conformance DistributedActorCodingError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DistributedActorCodingError and conformance DistributedActorCodingError;
  if (!lazy protocol witness table cache variable for type DistributedActorCodingError and conformance DistributedActorCodingError)
  {
    result = MEMORY[0x22E2FE49C](&protocol conformance descriptor for DistributedActorCodingError, &type metadata for DistributedActorCodingError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DistributedActorCodingError and conformance DistributedActorCodingError);
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

uint64_t outlined init with copy of Decoder(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t partial apply for thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  _QWORD *v13;

  v8 = v3[2];
  v9 = v3[3];
  v10 = v3[4];
  v11 = (int *)v3[5];
  v12 = v3[6];
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v13;
  *v13 = v4;
  v13[1] = protocol witness for DistributedActorSystem.remoteCall<A, B, C>(on:target:invocation:throwing:returning:) in conformance LocalTestingDistributedActorSystem;
  return ((uint64_t (*)(uint64_t, uint64_t, int *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&async function pointer to thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error) + async function pointer to thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error)))(a1, a2, v11, v12, v8, v9, v10, a3);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2FE490]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
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
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = type metadata accessor for CodingUserInfoKey();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      v14 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = ~v5;
    v10 = *(_QWORD *)(v3 + 48);
    do
    {
      v11 = (_QWORD *)(v10 + 16 * v6);
      if (*v11 == a1 && v11[1] == a2)
        break;
      if ((_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        break;
      v6 = (v6 + 1) & v9;
    }
    while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
  }
  return v6;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *(_QWORD *)(a4 + 24);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *(_QWORD *)(a4 + 16);
    if (v7 <= v8)
      v9 = *(_QWORD *)(a4 + 16);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any.Type>);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
      v13 = v10 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v13 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v8, v13);
        *(_QWORD *)(a4 + 16) = 0;
LABEL_18:
        swift_bridgeObjectRelease();
        return v10;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, v13, a4);
    goto LABEL_18;
  }
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
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

uint64_t specialized Set._Variant.insert(_:)(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t *v3;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;
  char isUniquelyReferenced_nonNull_native;
  Swift::Int *v17;
  Swift::Int v18;
  uint64_t v19;

  v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  v8 = Hasher._finalize()();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v7 + 48);
    while (1)
    {
      v13 = (_QWORD *)(v12 + 16 * v10);
      v14 = *v13 == a2 && v13[1] == a3;
      if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        goto LABEL_9;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v17 = (Swift::Int *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
    v18 = v17[1];
    *a1 = *v17;
    a1[1] = v18;
    swift_bridgeObjectRetain();
    return 0;
  }
  else
  {
LABEL_9:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v19 = *v3;
    *v3 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    specialized _NativeSet.insertNew(_:at:isUnique:)(a2, a3, v10, isUniquelyReferenced_nonNull_native);
    *v3 = v19;
    swift_bridgeObjectRelease();
    *a1 = a2;
    a1[1] = a3;
    return 1;
  }
}

uint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<LocalTestingActorID>);
  v3 = static _SetStorage.resize(original:capacity:move:)();
  if (*(_QWORD *)(v2 + 16))
  {
    v4 = 1 << *(_BYTE *)(v2 + 32);
    v5 = (_QWORD *)(v2 + 56);
    v6 = -1;
    if (v4 < 64)
      v6 = ~(-1 << v4);
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v4 + 63) >> 6;
    result = swift_retain();
    v10 = 0;
    while (1)
    {
      if (v7)
      {
        v11 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v12 = v11 | (v10 << 6);
      }
      else
      {
        v13 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
          __break(1u);
LABEL_26:
          __break(1u);
          return result;
        }
        if (v13 >= v8)
          goto LABEL_20;
        v14 = v5[v13];
        ++v10;
        if (!v14)
        {
          v10 = v13 + 1;
          if (v13 + 1 >= v8)
            goto LABEL_20;
          v14 = v5[v10];
          if (!v14)
          {
            v15 = v13 + 2;
            if (v15 >= v8)
            {
LABEL_20:
              swift_release();
              v16 = 1 << *(_BYTE *)(v2 + 32);
              if (v16 > 63)
                specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v16 + 63) >> 6, (int64x2_t *)(v2 + 56));
              else
                *v5 = -1 << v16;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v14 = v5[v15];
            if (!v14)
            {
              while (1)
              {
                v10 = v15 + 1;
                if (__OFADD__(v15, 1))
                  goto LABEL_26;
                if (v10 >= v8)
                  goto LABEL_20;
                v14 = v5[v10];
                ++v15;
                if (v14)
                  goto LABEL_19;
              }
            }
            v10 = v15;
          }
        }
LABEL_19:
        v7 = (v14 - 1) & v14;
        v12 = __clz(__rbit64(v14)) + (v10 << 6);
      }
      result = specialized _NativeSet._unsafeInsertNew(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v12), *(_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v12 + 8), v3);
    }
  }
  result = swift_release();
  *v1 = v3;
  return result;
}

Swift::Int specialized _NativeSet._unsafeInsertNew(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Swift::Int result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v17;

  Hasher.init(_seed:)();
  String.hash(into:)();
  result = Hasher._finalize()();
  v7 = -1 << *(_BYTE *)(a3 + 32);
  v8 = result & ~v7;
  v9 = a3 + 56;
  v10 = v8 >> 6;
  v11 = *(_QWORD *)(a3 + 56 + 8 * (v8 >> 6));
  v12 = 1 << v8;
  if (((1 << v8) & v11) != 0)
  {
    v13 = ~v7;
    v14 = *(_QWORD *)(a3 + 48);
    while (1)
    {
      v15 = (_QWORD *)(v14 + 16 * v8);
      if (*v15 == a1 && v15[1] == a2)
        break;
      result = _stringCompareWithSmolCheck(_:_:expecting:)();
      if ((result & 1) != 0)
        break;
      v8 = (v8 + 1) & v13;
      v10 = v8 >> 6;
      v11 = *(_QWORD *)(v9 + 8 * (v8 >> 6));
      v12 = 1 << v8;
      if ((v11 & (1 << v8)) == 0)
        goto LABEL_9;
    }
    result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
  }
  else
  {
LABEL_9:
    *(_QWORD *)(v9 + 8 * v10) = v12 | v11;
    v17 = (_QWORD *)(*(_QWORD *)(a3 + 48) + 16 * v8);
    *v17 = a1;
    v17[1] = a2;
    ++*(_QWORD *)(a3 + 16);
  }
  return result;
}

Swift::Int specialized _NativeSet.insertNew(_:at:isUnique:)(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  Swift::Int v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  Swift::Int *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_16;
  if ((a4 & 1) != 0)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v10 > v9)
    {
      result = (Swift::Int)specialized _NativeSet.copy()();
      goto LABEL_16;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  result = Hasher._finalize()();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = ~v12;
    v15 = *(_QWORD *)(v11 + 48);
    do
    {
      v16 = (_QWORD *)(v15 + 16 * a3);
      if (*v16 == v8 && v16[1] == a2)
        goto LABEL_19;
      result = _stringCompareWithSmolCheck(_:_:expecting:)();
      if ((result & 1) != 0)
        goto LABEL_19;
      a3 = (a3 + 1) & v14;
    }
    while (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0);
  }
LABEL_16:
  v18 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v19 = (Swift::Int *)(*(_QWORD *)(v18 + 48) + 16 * a3);
  *v19 = v8;
  v19[1] = a2;
  v20 = *(_QWORD *)(v18 + 16);
  v21 = __OFADD__(v20, 1);
  v22 = v20 + 1;
  if (!v21)
  {
    *(_QWORD *)(v18 + 16) = v22;
    return result;
  }
  __break(1u);
LABEL_19:
  result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

unint64_t specialized UnsafeMutablePointer.assign(repeating:count:)(unint64_t result, unint64_t a2, int64x2_t *a3)
{
  unint64_t v3;
  int64x2_t v4;
  int64x2_t *v5;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  if (a2)
  {
    if (a2 < 4)
    {
      v3 = 0;
LABEL_8:
      v7 = (unint64_t *)a3 + v3;
      v8 = a2 - v3;
      do
      {
        *v7++ = result;
        --v8;
      }
      while (v8);
      return result;
    }
    v3 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    v4 = vdupq_n_s64(result);
    v5 = a3 + 1;
    v6 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      v5[-1] = v4;
      *v5 = v4;
      v5 += 2;
      v6 -= 4;
    }
    while (v6);
    if (v3 != a2)
      goto LABEL_8;
  }
  return result;
}

void *specialized _NativeSet.copy()()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *result;
  uint64_t v7;
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
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<LocalTestingActorID>);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  v5 = (unint64_t)((1 << *(_BYTE *)(v3 + 32)) + 63) >> 6;
  result = (void *)(v3 + 56);
  v7 = v2 + 56;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v5)
    result = memmove(result, (const void *)(v2 + 56), 8 * v5);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v7 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v7 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v7 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v7 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.copyAndResize(capacity:)()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<LocalTestingActorID>);
  v3 = static _SetStorage.resize(original:capacity:move:)();
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_21:
    result = swift_release();
    *v1 = v3;
    return result;
  }
  v4 = 1 << *(_BYTE *)(v2 + 32);
  v5 = v2 + 56;
  v6 = -1;
  if (v4 < 64)
    v6 = ~(-1 << v4);
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v8 = (unint64_t)(v4 + 63) >> 6;
  result = swift_retain_n();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v12 = v11 | (v10 << 6);
      goto LABEL_6;
    }
    v16 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v16 >= v8)
      goto LABEL_20;
    v17 = *(_QWORD *)(v5 + 8 * v16);
    ++v10;
    if (!v17)
    {
      v10 = v16 + 1;
      if (v16 + 1 >= v8)
        goto LABEL_20;
      v17 = *(_QWORD *)(v5 + 8 * v10);
      if (!v17)
        break;
    }
LABEL_19:
    v7 = (v17 - 1) & v17;
    v12 = __clz(__rbit64(v17)) + (v10 << 6);
LABEL_6:
    v13 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v12);
    v14 = *v13;
    v15 = v13[1];
    swift_bridgeObjectRetain();
    result = specialized _NativeSet._unsafeInsertNew(_:)(v14, v15, v3);
  }
  v18 = v16 + 2;
  if (v18 >= v8)
  {
LABEL_20:
    swift_release_n();
    goto LABEL_21;
  }
  v17 = *(_QWORD *)(v5 + 8 * v18);
  if (v17)
  {
    v10 = v18;
    goto LABEL_19;
  }
  while (1)
  {
    v10 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v10 >= v8)
      goto LABEL_20;
    v17 = *(_QWORD *)(v5 + 8 * v10);
    ++v18;
    if (v17)
      goto LABEL_19;
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t specialized Dictionary._Variant.removeValue(forKey:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    specialized _NativeDictionary.copy()();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 16 * v6);
  specialized _NativeDictionary._delete(at:)(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  _QWORD *v2;
  _QWORD *v3;
  int64x2_t *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  int64x2_t *v27;

  v3 = v2;
  v5 = (int64x2_t *)*v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<LocalTestingActorID, DistributedActor>);
  v6 = (_QWORD *)static _DictionaryStorage.resize(original:capacity:move:)();
  if (v5[1].i64[0])
  {
    v7 = 1 << v5[2].i8[0];
    v26 = v3;
    v27 = v5 + 4;
    v8 = -1;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    v9 = v8 & v5[4].i64[0];
    v10 = (unint64_t)(v7 + 63) >> 6;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v9)
      {
        v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v14 = v13 | (v12 << 6);
      }
      else
      {
        v15 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
          __break(1u);
LABEL_29:
          __break(1u);
          return result;
        }
        if (v15 >= v10)
          goto LABEL_22;
        v16 = v27->u64[v15];
        ++v12;
        if (!v16)
        {
          v12 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_22;
          v16 = v27->u64[v12];
          if (!v16)
          {
            v17 = v15 + 2;
            if (v17 >= v10)
            {
LABEL_22:
              swift_release();
              v3 = v26;
              if ((a2 & 1) != 0)
              {
                v25 = 1 << v5[2].i8[0];
                if (v25 > 63)
                  specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v25 + 63) >> 6, v27);
                else
                  v27->i64[0] = -1 << v25;
                v5[1].i64[0] = 0;
              }
              break;
            }
            v16 = v27->u64[v17];
            if (!v16)
            {
              while (1)
              {
                v12 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_29;
                if (v12 >= v10)
                  goto LABEL_22;
                v16 = v27->u64[v12];
                ++v17;
                if (v16)
                  goto LABEL_19;
              }
            }
            v12 = v17;
          }
        }
LABEL_19:
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v12 << 6);
      }
      v18 = 16 * v14;
      v19 = (uint64_t *)(v5[3].i64[0] + v18);
      v21 = *v19;
      v20 = v19[1];
      v22 = (uint64_t *)(v5[3].i64[1] + v18);
      v23 = *v22;
      v24 = v22[1];
      if ((a2 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain();
      }
      result = specialized _NativeDictionary._unsafeInsertNew(key:value:)(v21, v20, v23, v24, v6);
    }
  }
  result = swift_release();
  *v3 = v6;
  return result;
}

unint64_t specialized _NativeDictionary._delete(at:)(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  _OWORD *v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        swift_bridgeObjectRelease();
        result = Hasher._finalize()();
        v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8)
            goto LABEL_5;
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          v10 = *(_QWORD *)(a2 + 48);
          v11 = (_OWORD *)(v10 + 16 * v3);
          v12 = (_OWORD *)(v10 + 16 * v6);
          if (v3 != v6 || v11 >= v12 + 1)
            *v11 = *v12;
          v13 = *(_QWORD *)(a2 + 56);
          v14 = (_OWORD *)(v13 + 16 * v3);
          v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || (v3 = v6, v14 >= v15 + 1))
          {
            *v14 = *v15;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v17 = *v16;
    v18 = (-1 << v3) - 1;
  }
  else
  {
    v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    v18 = *v16;
    v17 = (-1 << result) - 1;
  }
  *v16 = v18 & v17;
  v19 = *(_QWORD *)(a2 + 16);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t specialized _NativeDictionary._unsafeInsertNew(key:value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  Swift::Int v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  _QWORD *v14;

  Hasher.init(_seed:)();
  String.hash(into:)();
  v10 = Hasher._finalize()();
  result = specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v10);
  if ((v12 & 1) != 0)
  {
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
  }
  else
  {
    a5[(result >> 6) + 8] |= 1 << result;
    v13 = (uint64_t *)(a5[6] + 16 * result);
    *v13 = a1;
    v13[1] = a2;
    v14 = (_QWORD *)(a5[7] + 16 * result);
    *v14 = a3;
    v14[1] = a4;
    ++a5[2];
  }
  return result;
}

void *specialized _NativeDictionary.copy()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  void *result;
  uint64_t v7;
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
  __int128 v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<LocalTestingActorID, DistributedActor>);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)();
  v4 = (_QWORD *)v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  v5 = (unint64_t)((1 << *(_BYTE *)(v3 + 32)) + 63) >> 6;
  result = (void *)(v3 + 64);
  v7 = v2 + 64;
  if (v4 != (_QWORD *)v2 || (unint64_t)result >= v2 + 64 + 8 * v5)
    result = memmove(result, (const void *)(v2 + 64), 8 * v5);
  v9 = 0;
  v4[2] = *(_QWORD *)(v2 + 16);
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
    v23 = *(_QWORD *)(v7 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v7 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = (_QWORD *)(v4[6] + v16);
    *v21 = v19;
    v21[1] = v18;
    *(_OWORD *)(v4[7] + v16) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_unknownObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v7 + 8 * v24);
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
    v23 = *(_QWORD *)(v7 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
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
        return MEMORY[0x24BEE4AF8];
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError;
  if (!lazy protocol witness table cache variable for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError)
  {
    result = MEMORY[0x22E2FE49C](&protocol conformance descriptor for ExecuteDistributedTargetError, &type metadata for ExecuteDistributedTargetError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError);
  }
  return result;
}

uint64_t type metadata accessor for RemoteCallArgument(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RemoteCallArgument);
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

char *specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void specialized DistributedRemoteActorReferenceExecutor.enqueue(_:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;

  v0 = ExecutorJob.description.getter();
  v2 = v1;
  _StringGuts.grow(_:)(88);
  v3._object = (void *)0x800000022C665F00;
  v3._countAndFlagsBits = 0xD000000000000022;
  String.append(_:)(v3);
  v4._countAndFlagsBits = v0;
  v4._object = v2;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0xD000000000000034;
  v5._object = (void *)0x800000022C665F30;
  String.append(_:)(v5);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t type metadata accessor for DistributedRemoteActorReferenceExecutor()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for _Lock()
{
  return objc_opt_self();
}

unint64_t lazy protocol witness table accessor for type LocalTestingDistributedActorSystemError and conformance LocalTestingDistributedActorSystemError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LocalTestingDistributedActorSystemError and conformance LocalTestingDistributedActorSystemError;
  if (!lazy protocol witness table cache variable for type LocalTestingDistributedActorSystemError and conformance LocalTestingDistributedActorSystemError)
  {
    result = MEMORY[0x22E2FE49C](&protocol conformance descriptor for LocalTestingDistributedActorSystemError, &type metadata for LocalTestingDistributedActorSystemError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LocalTestingDistributedActorSystemError and conformance LocalTestingDistributedActorSystemError);
  }
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t result;
  unint64_t v24;
  char v25;
  uint64_t *v26;
  _QWORD *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;

  v13 = (_QWORD *)*a5;
  v15 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v19 = v14;
  v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    specialized _NativeDictionary.copy()();
LABEL_7:
    v21 = (_QWORD *)*a5;
    if ((v19 & 1) != 0)
    {
LABEL_8:
      v22 = (_QWORD *)(v21[7] + 16 * v15);
      *v22 = a1;
      v22[1] = a7;
      return swift_unknownObjectRelease();
    }
LABEL_11:
    v21[(v15 >> 6) + 8] |= 1 << v15;
    v26 = (uint64_t *)(v21[6] + 16 * v15);
    *v26 = a2;
    v26[1] = a3;
    v27 = (_QWORD *)(v21[7] + 16 * v15);
    *v27 = a1;
    v27[1] = a7;
    v28 = v21[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (!v29)
    {
      v21[2] = v30;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v18, a4 & 1);
  v24 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v19 & 1) == (v25 & 1))
  {
    v15 = v24;
    v21 = (_QWORD *)*a5;
    if ((v19 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t specialized LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:)(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[3] = a1;
  v4[4] = a4;
  v5 = a2[1];
  v4[5] = *a2;
  v4[6] = v5;
  return swift_task_switch();
}

uint64_t specialized LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:)()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  Swift::String v3;
  Swift::String v4;
  uint64_t countAndFlagsBits;
  Swift::String_optional v6;
  void *object;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;

  v2 = v0[5];
  v1 = (void *)v0[6];
  swift_bridgeObjectRetain();
  _StringGuts.grow(_:)(80);
  v3._object = (void *)0x800000022C665BA0;
  v3._countAndFlagsBits = 0xD000000000000021;
  String.append(_:)(v3);
  v4._countAndFlagsBits = v2;
  v4._object = v1;
  v6 = _getFunctionFullNameFromMangledName(mangledName:)(v4);
  countAndFlagsBits = v6.value._countAndFlagsBits;
  if (v6.value._object)
  {
    object = v6.value._object;
  }
  else
  {
    object = (void *)v0[6];
    swift_bridgeObjectRetain();
    countAndFlagsBits = v0[5];
  }
  v8 = v0[3];
  v9 = object;
  String.append(_:)(*(Swift::String *)&countAndFlagsBits);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 0x6F746361206E6F20;
  v10._object = (void *)0xEA00000000002072;
  String.append(_:)(v10);
  v0[2] = v8;
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v11._object = (void *)0x800000022C665DE0;
  v11._countAndFlagsBits = 0xD000000000000021;
  String.append(_:)(v11);
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t dynamic_cast_existential_2_unconditional(uint64_t a1)
{
  uint64_t result;

  result = swift_conformsToProtocol2();
  if (result)
  {
    result = swift_conformsToProtocol2();
    if (result)
      return a1;
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type RemoteCallTarget and conformance RemoteCallTarget()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type RemoteCallTarget and conformance RemoteCallTarget;
  if (!lazy protocol witness table cache variable for type RemoteCallTarget and conformance RemoteCallTarget)
  {
    result = MEMORY[0x22E2FE49C](&protocol conformance descriptor for RemoteCallTarget, &type metadata for RemoteCallTarget);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RemoteCallTarget and conformance RemoteCallTarget);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ExecuteDistributedTargetError.ErrorCode and conformance ExecuteDistributedTargetError.ErrorCode()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExecuteDistributedTargetError.ErrorCode and conformance ExecuteDistributedTargetError.ErrorCode;
  if (!lazy protocol witness table cache variable for type ExecuteDistributedTargetError.ErrorCode and conformance ExecuteDistributedTargetError.ErrorCode)
  {
    result = MEMORY[0x22E2FE49C](&protocol conformance descriptor for ExecuteDistributedTargetError.ErrorCode, &type metadata for ExecuteDistributedTargetError.ErrorCode);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExecuteDistributedTargetError.ErrorCode and conformance ExecuteDistributedTargetError.ErrorCode);
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for ExecuteDistributedTargetError(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t instantiation function for generic protocol witness table for DistributedActorCodingError(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type DistributedActorCodingError and conformance DistributedActorCodingError();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t base witness table accessor for Executor in DistributedRemoteActorReferenceExecutor()
{
  return lazy protocol witness table accessor for type DistributedRemoteActorReferenceExecutor and conformance DistributedRemoteActorReferenceExecutor(&lazy protocol witness table cache variable for type DistributedRemoteActorReferenceExecutor and conformance DistributedRemoteActorReferenceExecutor, (uint64_t)&protocol conformance descriptor for DistributedRemoteActorReferenceExecutor);
}

uint64_t lazy protocol witness table accessor for type DistributedRemoteActorReferenceExecutor and conformance DistributedRemoteActorReferenceExecutor(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for DistributedRemoteActorReferenceExecutor();
    result = MEMORY[0x22E2FE49C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type LocalTestingActorID and conformance LocalTestingActorID()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LocalTestingActorID and conformance LocalTestingActorID;
  if (!lazy protocol witness table cache variable for type LocalTestingActorID and conformance LocalTestingActorID)
  {
    result = MEMORY[0x22E2FE49C](&protocol conformance descriptor for LocalTestingActorID, &type metadata for LocalTestingActorID);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LocalTestingActorID and conformance LocalTestingActorID);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LocalTestingActorID and conformance LocalTestingActorID;
  if (!lazy protocol witness table cache variable for type LocalTestingActorID and conformance LocalTestingActorID)
  {
    result = MEMORY[0x22E2FE49C](&protocol conformance descriptor for LocalTestingActorID, &type metadata for LocalTestingActorID);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LocalTestingActorID and conformance LocalTestingActorID);
  }
  return result;
}

_UNKNOWN **associated type witness table accessor for DistributedActorSystem.InvocationDecoder : DistributedTargetInvocationDecoder in LocalTestingDistributedActorSystem()
{
  return &protocol witness table for LocalTestingInvocationDecoder;
}

_UNKNOWN **associated type witness table accessor for DistributedActorSystem.InvocationEncoder : DistributedTargetInvocationEncoder in LocalTestingDistributedActorSystem()
{
  return &protocol witness table for LocalTestingInvocationEncoder;
}

_UNKNOWN **associated type witness table accessor for DistributedActorSystem.ResultHandler : DistributedTargetInvocationResultHandler in LocalTestingDistributedActorSystem()
{
  return &protocol witness table for LocalTestingInvocationResultHandler;
}

unint64_t instantiation function for generic protocol witness table for LocalTestingDistributedActorSystemError(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type LocalTestingDistributedActorSystemError and conformance LocalTestingDistributedActorSystemError();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t dispatch thunk of DistributedActor.actorSystem.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of DistributedActor.unownedExecutor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of static DistributedActor.resolve(id:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t dispatch thunk of DistributedActorSystem.resolve<A>(id:as:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 80))();
}

uint64_t dispatch thunk of DistributedActorSystem.assignID<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 88))();
}

uint64_t dispatch thunk of DistributedActorSystem.actorReady<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 96))();
}

uint64_t dispatch thunk of DistributedActorSystem.resignID(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

uint64_t dispatch thunk of DistributedActorSystem.makeInvocationEncoder()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 112))();
}

uint64_t dispatch thunk of DistributedActorSystem.remoteCall<A, B, C>(on:target:invocation:throwing:returning:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  _QWORD *v18;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a13 + 120) + *(_QWORD *)(a13 + 120));
  v18 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v13 + 16) = v18;
  *v18 = v13;
  v18[1] = LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:);
  return v20(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t dispatch thunk of DistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  _QWORD *v18;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a10 + 128) + *(_QWORD *)(a10 + 128));
  v18 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v10 + 16) = v18;
  *v18 = v10;
  v18[1] = protocol witness for DistributedActorSystem.remoteCall<A, B, C>(on:target:invocation:throwing:returning:) in conformance LocalTestingDistributedActorSystem;
  return v20(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t dispatch thunk of DistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 136)
                                                                            + *(_QWORD *)(a5 + 136));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = protocol witness for DistributedActorSystem.remoteCall<A, B, C>(on:target:invocation:throwing:returning:) in conformance LocalTestingDistributedActorSystem;
  return v13(a1, a2, a3, a4, a5);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for RemoteCallTarget()
{
  return &type metadata for RemoteCallTarget;
}

uint64_t dispatch thunk of DistributedTargetInvocationEncoder.recordGenericSubstitution<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of DistributedTargetInvocationEncoder.recordArgument<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of DistributedTargetInvocationEncoder.recordErrorType<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of DistributedTargetInvocationEncoder.recordReturnType<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of DistributedTargetInvocationEncoder.doneRecording()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t type metadata instantiation function for RemoteCallArgument()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for RemoteCallArgument()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for RemoteCallArgument(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 32) & (unint64_t)~v6) + *(_QWORD *)(v5 + 64) > 0x18)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    v11 = (_QWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
    v12 = (_QWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
    *v11 = *v12;
    v11[1] = v12[1];
    v13 = ((unint64_t)v11 + v6 + 16) & ~v6;
    v14 = ((unint64_t)v12 + v6 + 16) & ~v6;
    v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v13, v14, v4);
  }
  return a1;
}

uint64_t destroy for RemoteCallArgument(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((((a1 + 23) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

_QWORD *initializeWithCopy for RemoteCallArgument(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = (_QWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  v6 = (_QWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v5 = *v6;
  v5[1] = v6[1];
  v7 = *(_QWORD *)(a3 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = ((unint64_t)v5 + v9 + 16) & ~v9;
  v11 = ((unint64_t)v6 + v9 + 16) & ~v9;
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v10, v11, v7);
  return a1;
}

_QWORD *assignWithCopy for RemoteCallArgument(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (_QWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  v7 = (_QWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v6 = *v7;
  v6[1] = v7[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 24))(((unint64_t)v6 + *(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), ((unint64_t)v7 + *(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

_OWORD *initializeWithTake for RemoteCallArgument(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  _OWORD *v4;
  _OWORD *v5;
  uint64_t v6;

  *a1 = *a2;
  v4 = (_OWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  v5 = (_OWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v4 = *v5;
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 32))(((unint64_t)v4 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)v5 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

_QWORD *assignWithTake for RemoteCallArgument(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = (_QWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v9 + 40))(((unint64_t)v7 + *(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80), ((unint64_t)v8 + *(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a1;
}

uint64_t getEnumTagSinglePayload for RemoteCallArgument(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  char v10;
  int v11;
  unsigned int v13;
  int v14;
  unint64_t v15;
  unint64_t v16;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  v8 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_22;
  v9 = ((v7 + 32) & ~v7) + *(_QWORD *)(v4 + 64);
  v10 = 8 * v9;
  if (v9 <= 3)
  {
    v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      v11 = *(_DWORD *)(a1 + v9);
      if (!v11)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      v11 = *(unsigned __int16 *)(a1 + v9);
      if (!*(_WORD *)(a1 + v9))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_22:
      v15 = (a1 + 23) & 0xFFFFFFFFFFFFFFF8;
      if ((v5 & 0x80000000) != 0)
        return (*(uint64_t (**)(unint64_t))(v4 + 48))((v15 + v7 + 16) & ~v7);
      v16 = *(_QWORD *)(v15 + 8);
      if (v16 >= 0xFFFFFFFF)
        LODWORD(v16) = -1;
      return (v16 + 1);
    }
  }
  v11 = *(unsigned __int8 *)(a1 + v9);
  if (!*(_BYTE *)(a1 + v9))
    goto LABEL_22;
LABEL_15:
  v14 = (v11 - 1) << v10;
  if (v9 > 3)
    v14 = 0;
  if (!(_DWORD)v9)
    return v6 + v14 + 1;
  if (v9 > 3)
    LODWORD(v9) = 4;
  return ((uint64_t (*)(void))((char *)&loc_22C6634AC + 4 * byte_22C664DC0[(v9 - 1)]))();
}

void storeEnumTagSinglePayload for RemoteCallArgument(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
     + *(_QWORD *)(v5 + 64);
  if (a3 > v6)
  {
    if (v7 <= 3)
    {
      v10 = ((a3 - v6 + ~(-1 << (8 * v7))) >> (8 * v7)) + 1;
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
  }
  else
  {
    v8 = 0;
  }
  if (v6 < a2)
  {
    v9 = ~v6 + a2;
    if (v7 < 4)
    {
      if ((_DWORD)v7)
      {
        v11 = v9 & ~(-1 << (8 * v7));
        bzero(a1, v7);
        if ((_DWORD)v7 == 3)
        {
          *a1 = v11;
          *((_BYTE *)a1 + 2) = BYTE2(v11);
        }
        else if ((_DWORD)v7 == 2)
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
      bzero(a1, v7);
      *(_DWORD *)a1 = v9;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t dispatch thunk of DistributedTargetInvocationDecoder.decodeGenericSubstitutions()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of DistributedTargetInvocationDecoder.decodeNextArgument<A>()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of DistributedTargetInvocationDecoder.decodeErrorType()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of DistributedTargetInvocationDecoder.decodeReturnType()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of DistributedTargetInvocationResultHandler.onReturn<A>(value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 16) + *(_QWORD *)(a4 + 16));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = protocol witness for DistributedActorSystem.remoteCall<A, B, C>(on:target:invocation:throwing:returning:) in conformance LocalTestingDistributedActorSystem;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of DistributedTargetInvocationResultHandler.onReturnVoid()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 24) + *(_QWORD *)(a2 + 24));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = protocol witness for DistributedActorSystem.remoteCall<A, B, C>(on:target:invocation:throwing:returning:) in conformance LocalTestingDistributedActorSystem;
  return v7(a1, a2);
}

uint64_t dispatch thunk of DistributedTargetInvocationResultHandler.onThrow<A>(error:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 32) + *(_QWORD *)(a5 + 32));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = protocol witness for DistributedActorSystem.remoteCall<A, B, C>(on:target:invocation:throwing:returning:) in conformance LocalTestingDistributedActorSystem;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t destroy for ExecuteDistributedTargetError()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for ExecuteDistributedTargetError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ExecuteDistributedTargetError(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ExecuteDistributedTargetError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ExecuteDistributedTargetError(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ExecuteDistributedTargetError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ExecuteDistributedTargetError()
{
  return &type metadata for ExecuteDistributedTargetError;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ExecuteDistributedTargetError.ErrorCode(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ExecuteDistributedTargetError.ErrorCode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22C663B5C + 4 * byte_22C664DD3[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_22C663B90 + 4 * byte_22C664DCE[v4]))();
}

uint64_t sub_22C663B90(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22C663B98(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22C663BA0);
  return result;
}

uint64_t sub_22C663BAC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22C663BB4);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_22C663BB8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22C663BC0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for ExecuteDistributedTargetError.ErrorCode(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for ExecuteDistributedTargetError.ErrorCode(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ExecuteDistributedTargetError.ErrorCode()
{
  return &type metadata for ExecuteDistributedTargetError.ErrorCode;
}

ValueMetadata *type metadata accessor for DistributedActorCodingError()
{
  return &type metadata for DistributedActorCodingError;
}

uint64_t method lookup function for DistributedRemoteActorReferenceExecutor()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for LocalTestingDistributedActorSystem()
{
  return objc_opt_self();
}

uint64_t method lookup function for LocalTestingDistributedActorSystem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LocalTestingDistributedActorSystem.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

ValueMetadata *type metadata accessor for LocalTestingActorID()
{
  return &type metadata for LocalTestingActorID;
}

ValueMetadata *type metadata accessor for LocalTestingInvocationEncoder()
{
  return &type metadata for LocalTestingInvocationEncoder;
}

uint64_t type metadata accessor for LocalTestingInvocationDecoder()
{
  return objc_opt_self();
}

uint64_t method lookup function for LocalTestingInvocationDecoder()
{
  return swift_lookUpClassMethod();
}

ValueMetadata *type metadata accessor for LocalTestingInvocationResultHandler()
{
  return &type metadata for LocalTestingInvocationResultHandler;
}

_QWORD *initializeBufferWithCopyOfBuffer for LocalTestingDistributedActorSystemError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LocalTestingDistributedActorSystemError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for RemoteCallTarget(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for LocalTestingDistributedActorSystemError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for LocalTestingDistributedActorSystemError()
{
  return &type metadata for LocalTestingDistributedActorSystemError;
}

void type metadata accessor for os_unfair_lock_s()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!lazy cache variable for type metadata for os_unfair_lock_s)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for os_unfair_lock_s);
  }
}

_QWORD *initializeBufferWithCopyOfBuffer for LocalTestingDistributedActorSystem.ActorIDProvider(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for LocalTestingDistributedActorSystem.ActorIDProvider()
{
  return swift_release();
}

_QWORD *assignWithCopy for LocalTestingDistributedActorSystem.ActorIDProvider(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for LocalTestingDistributedActorSystem.ActorIDProvider(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for RemoteCallTarget(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RemoteCallTarget(uint64_t result, int a2, int a3)
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

void *type metadata accessor for LocalTestingDistributedActorSystem.ActorIDProvider()
{
  return &unk_24F6E1880;
}

uint64_t *initializeBufferWithCopyOfBuffer for Optional(uint64_t *a1, uint64_t *a2, uint64_t a3)
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

uint64_t destroy for Optional(uint64_t a1, uint64_t a2)
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

void *initializeWithCopy for Optional(void *a1, const void *a2, uint64_t a3)
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

void *assignWithCopy for Optional(void *a1, void *a2, uint64_t a3)
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

void *initializeWithTake for Optional(void *a1, const void *a2, uint64_t a3)
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

void *assignWithTake for Optional(void *a1, void *a2, uint64_t a3)
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

uint64_t getEnumTagSinglePayload for Optional(uint64_t a1, unsigned int a2, uint64_t a3)
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

void storeEnumTagSinglePayload for Optional(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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

void sub_22C6645E4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_22C6645EC()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

uint64_t getEnumTag for Optional(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 48))(a1, 1);
}

uint64_t destructiveInjectEnumTag for Optional(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 56))(a1, a2, 1);
}

uint64_t sub_22C664638()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed A) -> (@out A1, @error @owned Error)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 40))();
}

uint64_t sub_22C664668()
{
  swift_release();
  return swift_deallocObject();
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

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x22E2FE478](a1, v6, a5);
}

uint64_t swift_distributed_getGenericEnvironment()
{
  uint64_t result;
  uint64_t v1;

  result = swift_findAccessibleFunction();
  if (result)
  {
    v1 = *(int *)(result + 4);
    if ((_DWORD)v1)
      result += v1 + 4;
    else
      return 0;
  }
  return result;
}

uint64_t swift_distributed_execute_target()
{
  uint64_t v0;
  uint64_t AccessibleFunction;
  int *v2;
  _QWORD *v3;
  char *v5;

  AccessibleFunction = swift_findAccessibleFunction();
  if (AccessibleFunction)
  {
    v2 = (int *)(*(int *)(AccessibleFunction + 12) + AccessibleFunction + 12);
    v5 = (char *)v2 + *v2;
    v3 = (_QWORD *)swift_task_alloc();
    *v3 = v0;
    v3[1] = swift_distributed_execute_target_resume;
    __asm { BR              X8 }
  }
  swift_distributed_makeDistributedTargetAccessorNotFoundError();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t swift_distributed_execute_target_resume()
{
  uint64_t v0;
  uint64_t (*v2)(void);

  v2 = *(uint64_t (**)(void))(*(_QWORD *)v0 + 8);
  swift_task_dealloc();
  return v2();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x24BEE0618]();
}

Swift::Void __swiftcall UnsafePointer.deallocate()()
{
  MEMORY[0x24BEE0958]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x24BEE0A30]();
}

Swift::String __swiftcall String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  uint64_t v3;
  void *v4;
  Swift::String result;

  v3 = MEMORY[0x24BEE0AF8](_builtinStringLiteral, utf8CodeUnitCount, isASCII);
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x24BEE0B68]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t UnsafeRawPointer.load<A>(fromByteOffset:as:)()
{
  return MEMORY[0x24BEE0F50]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t Executor.enqueue(_:)()
{
  return MEMORY[0x24BEE6850]();
}

{
  return MEMORY[0x24BEE6858]();
}

uint64_t UnownedSerialExecutor._executor.getter()
{
  return MEMORY[0x24BEE6B60]();
}

Swift::Void __swiftcall SerialExecutor.checkIsolated()()
{
  MEMORY[0x24BEE6B80]();
}

uint64_t SerialExecutor.isSameExclusiveExecutionContext(other:)()
{
  return MEMORY[0x24BEE6B90]();
}

uint64_t dispatch thunk of Decodable.init(from:)()
{
  return MEMORY[0x24BEE1478]();
}

uint64_t static UnsafeMutablePointer.allocate(capacity:)()
{
  return MEMORY[0x24BEE1C20]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

Swift::String_optional __swiftcall _getFunctionFullNameFromMangledName(mangledName:)(Swift::String mangledName)
{
  uint64_t v1;
  void *v2;
  Swift::String_optional result;

  v1 = MEMORY[0x24BEE20B0](mangledName._countAndFlagsBits, mangledName._object);
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t ExecutorJob.description.getter()
{
  return MEMORY[0x24BEE6D50]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE24C0]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t dispatch thunk of Identifiable.id.getter()
{
  return MEMORY[0x24BEE2568]();
}

uint64_t StaticString.description.getter()
{
  return MEMORY[0x24BEE25B8]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t CodingUserInfoKey.init(rawValue:)()
{
  return MEMORY[0x24BEE2CB8]();
}

uint64_t type metadata accessor for CodingUserInfoKey()
{
  return MEMORY[0x24BEE2CC8]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

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

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x24BEE3A58]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x24BEE3AF0]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)()
{
  return MEMORY[0x24BEE3B20]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED8]();
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

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t dispatch thunk of Decoder.userInfo.getter()
{
  return MEMORY[0x24BEE4600]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x24BEE4A98]();
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_conformsToProtocol()
{
  return MEMORY[0x24BEE4BE8]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_distributed_actor_is_remote()
{
  return MEMORY[0x24BEE7200]();
}

uint64_t swift_distributed_getWitnessTables()
{
  return MEMORY[0x24BEE4C30]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_findAccessibleFunction()
{
  return MEMORY[0x24BEE4CB0]();
}

uint64_t swift_func_getParameterCount()
{
  return MEMORY[0x24BEE4CB8]();
}

uint64_t swift_func_getParameterTypeInfo()
{
  return MEMORY[0x24BEE4CC0]();
}

uint64_t swift_func_getReturnTypeInfo()
{
  return MEMORY[0x24BEE4CC8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getCanonicalSpecializedMetadata()
{
  return MEMORY[0x24BEE4CF8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x24BEE4E50]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
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

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x24BEE7250]();
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

