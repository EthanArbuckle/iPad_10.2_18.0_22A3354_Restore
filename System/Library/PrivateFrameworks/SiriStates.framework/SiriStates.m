id one-time initialization function for abstract()
{
  id result;

  type metadata accessor for CallState();
  result = CallState.__allocating_init(name:parent:eventHandler:)(0x7463617274736241, 0xE800000000000000, 0, (uint64_t)implicit closure #1 in variable initialization expression of static CallState.abstract, 0);
  static CallState.abstract = (uint64_t)result;
  return result;
}

{
  id result;

  type metadata accessor for State();
  result = State.__allocating_init(name:parent:eventHandler:)(0x7463617274736241, 0xE800000000000000, 0, (uint64_t)implicit closure #1 in variable initialization expression of static CallState.abstract, 0);
  static State.abstract = (uint64_t)result;
  return result;
}

{
  id result;

  type metadata accessor for SharedState();
  result = SharedState.__allocating_init(name:parent:eventHandler:)(0x7463617274736241, 0xE800000000000000, 0, (uint64_t)implicit closure #1 in variable initialization expression of static CallState.abstract, 0);
  static SharedState.abstract = (uint64_t)result;
  return result;
}

uint64_t implicit closure #1 in variable initialization expression of static CallState.abstract()
{
  return 1;
}

uint64_t *CallState.abstract.unsafeMutableAddressor()
{
  if (one-time initialization token for abstract != -1)
    swift_once();
  return &static CallState.abstract;
}

id static CallState.abstract.getter()
{
  return static CallState.abstract.getter(&one-time initialization token for abstract, (id *)&static CallState.abstract);
}

uint64_t *State.abstract.unsafeMutableAddressor()
{
  if (one-time initialization token for abstract != -1)
    swift_once();
  return &static State.abstract;
}

id static State.abstract.getter()
{
  return static CallState.abstract.getter(&one-time initialization token for abstract, (id *)&static State.abstract);
}

uint64_t static SharedState.handleForAbstractState<A, B>(event:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a2, 2, 2, a1);
}

uint64_t *SharedState.abstract.unsafeMutableAddressor()
{
  if (one-time initialization token for abstract != -1)
    swift_once();
  return &static SharedState.abstract;
}

id static SharedState.abstract.getter()
{
  return static CallState.abstract.getter(&one-time initialization token for abstract, (id *)&static SharedState.abstract);
}

id static CallState.abstract.getter(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

id one-time initialization function for passive()
{
  void *v0;
  id v1;
  id result;

  type metadata accessor for SharedState();
  v0 = (void *)*SharedState.mirroring.unsafeMutableAddressor();
  v1 = v0;
  result = SharedState.__allocating_init(name:parent:eventHandler:)(0x65766973736150, 0xE700000000000000, v0, (uint64_t)implicit closure #1 in variable initialization expression of static SharedState.passive, 0);
  static SharedState.passive = (uint64_t)result;
  return result;
}

uint64_t implicit closure #1 in variable initialization expression of static SharedState.passive(uint64_t a1)
{
  void *v1;
  id v2;

  if (a1 == 6 || a1 == 4)
    return 1;
  if (a1 != 3)
    return 0;
  v1 = (void *)*SharedState.preparingToServe.unsafeMutableAddressor();
  v2 = v1;
  return (uint64_t)v1;
}

uint64_t *SharedState.passive.unsafeMutableAddressor()
{
  if (one-time initialization token for passive != -1)
    swift_once();
  return &static SharedState.passive;
}

id static SharedState.passive.getter()
{
  if (one-time initialization token for passive != -1)
    swift_once();
  return (id)static SharedState.passive;
}

id one-time initialization function for resting()
{
  void *v0;
  id v1;
  id result;

  type metadata accessor for State();
  v0 = (void *)*State.attending.unsafeMutableAddressor();
  v1 = v0;
  result = State.__allocating_init(name:parent:eventHandler:)(0x676E6974736552, 0xE700000000000000, v0, (uint64_t)implicit closure #1 in variable initialization expression of static State.resting, 0);
  static State.resting = (uint64_t)result;
  return result;
}

void *implicit closure #1 in variable initialization expression of static State.resting(uint64_t a1)
{
  void *v1;
  id v2;

  if ((a1 & 0xFFFFFFFFFFFFFFFELL) != 0xC)
    return 0;
  v1 = (void *)*State.available.unsafeMutableAddressor();
  v2 = v1;
  return v1;
}

uint64_t *State.resting.unsafeMutableAddressor()
{
  if (one-time initialization token for resting != -1)
    swift_once();
  return &static State.resting;
}

id static State.resting.getter()
{
  if (one-time initialization token for resting != -1)
    swift_once();
  return (id)static State.resting;
}

uint64_t variable initialization expression of SharedClient.delegate()
{
  return 0;
}

uint64_t SharedClient.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____SRSTSharedClient_delegate;
  swift_beginAccess();
  return MEMORY[0x2199DD49C](v1);
}

uint64_t SharedClient.delegate.setter()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t key path getter for SharedClient.delegate : SharedClient@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x70))();
  *a2 = result;
  return result;
}

uint64_t key path setter for SharedClient.delegate : SharedClient(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & **a2) + 0x78);
  v3 = swift_unknownObjectRetain();
  return v2(v3);
}

void (*SharedClient.delegate.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____SRSTSharedClient_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x2199DD49C](v5);
  return SharedClient.delegate.modify;
}

void SharedClient.delegate.modify(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t property wrapper backing initializer of SharedClient.currentState()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SharedState?);
  return Published.init(initialValue:)();
}

uint64_t SharedClient.currentState.getter()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t SharedClient.currentState.setter()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return static Published.subscript.setter();
}

uint64_t key path getter for SharedClient.currentState : SharedClient@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x88))();
  *a2 = result;
  return result;
}

uint64_t key path setter for SharedClient.currentState : SharedClient(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x24BEE4EA0] & **a2) + 0x90);
  v4 = *a1;
  return v3(v2);
}

uint64_t (*SharedClient.currentState.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return SharedClient.currentState.modify;
}

uint64_t key path getter for SharedClient.$currentState : SharedClient(_QWORD **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0xA0))();
}

uint64_t key path setter for SharedClient.$currentState : SharedClient(uint64_t a1, _QWORD **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<SharedState?>.Publisher);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v8 + 16))(v7, a1);
  return (*(uint64_t (**)(char *))((*MEMORY[0x24BEE4EA0] & **a2) + 0xA8))(v7);
}

uint64_t SharedClient.$currentState.getter()
{
  return SharedClient.$currentState.getter((uint64_t)&OBJC_IVAR____SRSTSharedClient__currentState, &demangling cache variable for type metadata for Published<SharedState?>);
}

uint64_t SharedClient.$currentState.setter(uint64_t a1)
{
  return SharedClient.$currentState.setter(a1, &demangling cache variable for type metadata for Published<SharedState?>.Publisher, (uint64_t)&OBJC_IVAR____SRSTSharedClient__currentState, &demangling cache variable for type metadata for Published<SharedState?>);
}

uint64_t (*SharedClient.$currentState.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<SharedState?>.Publisher);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____SRSTSharedClient__currentState;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<SharedState?>);
  Published.projectedValue.getter();
  swift_endAccess();
  return SharedClient.$currentState.modify;
}

uint64_t property wrapper backing initializer of SharedClient.mostRecentEvent()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SharedEvent?);
  return Published.init(initialValue:)();
}

uint64_t key path getter for SharedClient.mostRecentEvent : SharedClient@<X0>(_QWORD **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0xB8))();
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t key path setter for SharedClient.mostRecentEvent : SharedClient(uint64_t a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))((*MEMORY[0x24BEE4EA0] & **a2) + 0xC0))(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t SharedClient.mostRecentEvent.getter()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t SharedClient.mostRecentEvent.setter()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return static Published.subscript.setter();
}

uint64_t (*SharedClient.mostRecentEvent.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return SharedClient.currentState.modify;
}

void SharedClient.currentState.modify(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t variable initialization expression of SharedClient._mostRecentEvent()
{
  return 0;
}

uint64_t key path getter for SharedClient.$mostRecentEvent : SharedClient(_QWORD **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0xD0))();
}

uint64_t key path setter for SharedClient.$mostRecentEvent : SharedClient(uint64_t a1, _QWORD **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<SharedEvent?>.Publisher);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v8 + 16))(v7, a1);
  return (*(uint64_t (**)(char *))((*MEMORY[0x24BEE4EA0] & **a2) + 0xD8))(v7);
}

uint64_t SharedClient.$mostRecentEvent.getter()
{
  return SharedClient.$currentState.getter((uint64_t)&OBJC_IVAR____SRSTSharedClient__mostRecentEvent, &demangling cache variable for type metadata for Published<SharedEvent?>);
}

uint64_t SharedClient.$currentState.getter(uint64_t a1, uint64_t *a2)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  Published.projectedValue.getter();
  return swift_endAccess();
}

uint64_t SharedClient.$mostRecentEvent.setter(uint64_t a1)
{
  return SharedClient.$currentState.setter(a1, &demangling cache variable for type metadata for Published<SharedEvent?>.Publisher, (uint64_t)&OBJC_IVAR____SRSTSharedClient__mostRecentEvent, &demangling cache variable for type metadata for Published<SharedEvent?>);
}

uint64_t SharedClient.$currentState.setter(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  Published.projectedValue.setter();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*SharedClient.$mostRecentEvent.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<SharedEvent?>.Publisher);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____SRSTSharedClient__mostRecentEvent;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<SharedEvent?>);
  Published.projectedValue.getter();
  swift_endAccess();
  return SharedClient.$currentState.modify;
}

void SharedClient.$currentState.modify(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    Published.projectedValue.setter();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    Published.projectedValue.setter();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

uint64_t SharedClient.mostRecentEventName.getter()
{
  _QWORD *v0;
  uint64_t v1;
  char v2;

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
  if ((v2 & 1) != 0)
    return 0;
  else
    return SharedEvent.name.getter(v1);
}

uint64_t variable initialization expression of SharedClient.stopped()
{
  return 0;
}

void SharedClient.dispatchEvent(_:)(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;

  type metadata accessor for NotificationCenterHelper();
  v3 = a1;
  v2 = lazy protocol witness table accessor for type SharedEvent and conformance SharedEvent();
  static NotificationCenterHelper.dispatch<A>(_:)((uint64_t)&v3, (uint64_t)&type metadata for SharedEvent, v2);
}

id SharedClient.__deallocating_deinit()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  objc_class *v12;
  objc_super v14;

  v1 = v0;
  v2 = type metadata accessor for Logger();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*((_BYTE *)v1 + OBJC_IVAR____SRSTSharedClient_stopped) & 1) == 0)
  {
    type metadata accessor for SharedClient();
    lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type SharedClient and conformance SharedClient, (uint64_t (*)(uint64_t))type metadata accessor for SharedClient, (uint64_t)&protocol conformance descriptor for SharedClient);
    static Clientele.remove<A>(_:)((uint64_t)v1);
    v7 = Logger.framework.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
    v8 = Logger.logObject.getter();
    v9 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_215151000, v8, v9, "Deinit called for SharedClient", v10, 2u);
      MEMORY[0x2199DD454](v10, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    type metadata accessor for OS_dispatch_queue();
    *(_QWORD *)(swift_allocObject() + 16) = v1;
    v11 = v1;
    static OS_dispatch_queue.executeOnMain<A>(_:)((void (*)(void))partial apply for closure #1 in SharedClient.deinit);
    swift_release();
  }
  v12 = (objc_class *)type metadata accessor for SharedClient();
  v14.receiver = v1;
  v14.super_class = v12;
  return objc_msgSendSuper2(&v14, sel_dealloc);
}

void @objc closure #1 in variable initialization expression of static SharedClient.handleStateTransititionNotification(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;

  v10 = a1;
  v8 = a3;
  v9 = a5;
  specialized closure #1 in variable initialization expression of static SharedClient.handleStateTransititionNotification(a2, (uint64_t)a3);

}

uint64_t (**SharedClient.handleStateTransititionNotification.unsafeMutableAddressor())()
{
  return static SharedClient.handleStateTransititionNotification;
}

uint64_t (*static SharedClient.handleStateTransititionNotification.getter())()
{
  swift_beginAccess();
  return static SharedClient.handleStateTransititionNotification[0];
}

uint64_t static SharedClient.handleStateTransititionNotification.setter(uint64_t (*a1)())
{
  uint64_t result;

  result = swift_beginAccess();
  static SharedClient.handleStateTransititionNotification[0] = a1;
  return result;
}

uint64_t (*static SharedClient.handleStateTransititionNotification.modify())()
{
  swift_beginAccess();
  return static SharedClient.handleStateTransititionNotification.modify;
}

void @objc closure #1 in variable initialization expression of static SharedClient.handleEventNotification(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;

  v10 = a1;
  v8 = a3;
  v9 = a5;
  specialized closure #1 in variable initialization expression of static SharedClient.handleEventNotification(a2, (uint64_t)a3);

}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199DD3AC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SharedEvent and conformance SharedEvent()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent;
  if (!lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent)
  {
    result = MEMORY[0x2199DD3C4](&protocol conformance descriptor for SharedEvent, &type metadata for SharedEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent;
  if (!lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent)
  {
    result = MEMORY[0x2199DD3C4](&protocol conformance descriptor for SharedEvent, &type metadata for SharedEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent;
  if (!lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent)
  {
    result = MEMORY[0x2199DD3C4](&protocol conformance descriptor for SharedEvent, &type metadata for SharedEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent;
  if (!lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent)
  {
    result = MEMORY[0x2199DD3C4](&protocol conformance descriptor for SharedEvent, &type metadata for SharedEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SharedEvent and conformance SharedEvent);
  }
  return result;
}

uint64_t type metadata accessor for SharedClient()
{
  uint64_t result;

  result = type metadata singleton initialization cache for SharedClient;
  if (!type metadata singleton initialization cache for SharedClient)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t type metadata accessor for OS_dispatch_queue()
{
  unint64_t result;

  result = lazy cache variable for type metadata for OS_dispatch_queue;
  if (!lazy cache variable for type metadata for OS_dispatch_queue)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
  }
  return result;
}

uint64_t sub_215155D20()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t (**SharedClient.handleEventNotification.unsafeMutableAddressor())()
{
  return &static SharedClient.handleEventNotification;
}

uint64_t (*static SharedClient.handleEventNotification.getter())()
{
  swift_beginAccess();
  return static SharedClient.handleEventNotification;
}

uint64_t static SharedClient.handleEventNotification.setter(uint64_t (*a1)())
{
  uint64_t result;

  result = swift_beginAccess();
  static SharedClient.handleEventNotification = a1;
  return result;
}

uint64_t (*static SharedClient.handleEventNotification.modify())()
{
  swift_beginAccess();
  return static SharedClient.handleEventNotification.modify;
}

id SharedClient.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SharedClient.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  objc_class *v18;
  id v19;
  id v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  int64_t v35;
  unint64_t v36;
  uint64_t v37;
  CFNotificationCenterRef value;
  void (__cdecl *v39)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef);
  __CFNotificationCenter *v40;
  id v41;
  __CFString *v42;
  uint64_t v43;
  uint64_t *v44;
  CFNotificationCenterRef_optional *v45;
  unint64_t v46;
  uint64_t v47;
  CFNotificationCenterRef v48;
  void (__cdecl *v49)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef);
  __CFNotificationCenter *v50;
  __CFString *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  id v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int64_t v66;
  _QWORD *v67;
  _QWORD v68[3];
  ValueMetadata *v69;
  uint64_t v70;
  uint64_t v71;
  objc_super v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;

  v1 = type metadata accessor for Logger();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v3);
  v61 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<SharedEvent?>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<SharedState?>);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  v15 = &v0[OBJC_IVAR____SRSTSharedClient__currentState];
  v73 = 0;
  v16 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SharedState?);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v15, v14, v10);
  v17 = &v16[OBJC_IVAR____SRSTSharedClient__mostRecentEvent];
  v73 = 0;
  LOBYTE(v74) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SharedEvent?);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v17, v9, v5);
  v16[OBJC_IVAR____SRSTSharedClient_stopped] = 0;

  v18 = (objc_class *)type metadata accessor for SharedClient();
  v72.receiver = v16;
  v72.super_class = v18;
  v19 = objc_msgSendSuper2(&v72, sel_init);
  lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type SharedClient and conformance SharedClient, (uint64_t (*)(uint64_t))type metadata accessor for SharedClient, (uint64_t)&protocol conformance descriptor for SharedClient);
  v20 = v19;
  v21 = (const void *)static Clientele.add<A>(_:)((uint64_t)v20, (uint64_t)v18);
  v22 = *SharedState.allStates.unsafeMutableAddressor();
  v63 = v1;
  v62 = v2;
  v60 = v20;
  if ((v22 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for SharedState();
    lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type SharedState and conformance NSObject, (uint64_t (*)(uint64_t))type metadata accessor for SharedState, MEMORY[0x24BEE5BD8]);
    Set.Iterator.init(_cocoa:)();
    v22 = v73;
    v67 = v74;
    v23 = v75;
    v24 = v76;
    v25 = v77;
  }
  else
  {
    v26 = -1 << *(_BYTE *)(v22 + 32);
    v27 = *(_QWORD *)(v22 + 56);
    v67 = (_QWORD *)(v22 + 56);
    v23 = ~v26;
    v28 = -v26;
    if (v28 < 64)
      v29 = ~(-1 << v28);
    else
      v29 = -1;
    v25 = v29 & v27;
    swift_bridgeObjectRetain();
    v24 = 0;
  }
  v65 = v22 & 0x7FFFFFFFFFFFFFFFLL;
  v59 = v23;
  v66 = (unint64_t)(v23 + 64) >> 6;
  v64 = MEMORY[0x24BEE4AD0] + 8;
  if (v22 < 0)
    goto LABEL_10;
  while (1)
  {
    if (v25)
    {
      v30 = (v25 - 1) & v25;
      v31 = __clz(__rbit64(v25)) | (v24 << 6);
      v32 = v24;
      goto LABEL_27;
    }
    v35 = v24 + 1;
    if (__OFADD__(v24, 1))
    {
      __break(1u);
      return;
    }
    if (v35 >= v66)
      goto LABEL_30;
    v36 = v67[v35];
    v32 = v24 + 1;
    if (!v36)
    {
      v32 = v24 + 2;
      if (v24 + 2 >= v66)
        goto LABEL_30;
      v36 = v67[v32];
      if (!v36)
      {
        v32 = v24 + 3;
        if (v24 + 3 >= v66)
          goto LABEL_30;
        v36 = v67[v32];
        if (!v36)
        {
          v32 = v24 + 4;
          if (v24 + 4 >= v66)
            goto LABEL_30;
          v36 = v67[v32];
          if (!v36)
            break;
        }
      }
    }
LABEL_26:
    v30 = (v36 - 1) & v36;
    v31 = __clz(__rbit64(v36)) + (v32 << 6);
LABEL_27:
    v34 = *(id *)(*(_QWORD *)(v22 + 48) + 8 * v31);
    if (!v34)
      goto LABEL_30;
    while (1)
    {
      value = darwinNotificationCenter.unsafeMutableAddressor()->value;
      swift_beginAccess();
      v39 = (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))static SharedClient.handleStateTransititionNotification[0];
      type metadata accessor for NotificationCenterHelper();
      v69 = (ValueMetadata *)type metadata accessor for SharedState();
      v70 = lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type SharedState and conformance SharedState, (uint64_t (*)(uint64_t))type metadata accessor for SharedState, (uint64_t)&protocol conformance descriptor for SharedState);
      v68[0] = v34;
      v40 = value;
      v41 = v34;
      v42 = (__CFString *)static NotificationCenterHelper.notifcationName(for:)(v68);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v68);
      CFNotificationCenterAddObserver(v40, v21, v39, v42, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      v24 = v32;
      v25 = v30;
      if ((v22 & 0x8000000000000000) == 0)
        break;
LABEL_10:
      v33 = __CocoaSet.Iterator.next()();
      if (v33)
      {
        v71 = v33;
        type metadata accessor for SharedState();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v34 = (id)v68[0];
        swift_unknownObjectRelease();
        v32 = v24;
        v30 = v25;
        if (v34)
          continue;
      }
      goto LABEL_30;
    }
  }
  v37 = v24 + 5;
  while (v66 != v37)
  {
    v36 = v67[v37++];
    if (v36)
    {
      v32 = v37 - 1;
      goto LABEL_26;
    }
  }
LABEL_30:
  outlined consume of Set<SharedState>.Iterator._Variant();
  v67 = static SharedEvent.allCases.getter();
  v43 = v67[2];
  if (v43)
  {
    type metadata accessor for NotificationCenterHelper();
    v44 = v67 + 4;
    v45 = darwinNotificationCenter.unsafeMutableAddressor();
    swift_beginAccess();
    v46 = lazy protocol witness table accessor for type SharedEvent and conformance SharedEvent();
    do
    {
      v47 = *v44++;
      v48 = v45->value;
      v49 = (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))static SharedClient.handleEventNotification;
      v69 = &type metadata for SharedEvent;
      v70 = v46;
      v68[0] = v47;
      v50 = v48;
      v51 = (__CFString *)static NotificationCenterHelper.notifcationName(for:)(v68);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v68);
      CFNotificationCenterAddObserver(v50, v21, v49, v51, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      --v43;
    }
    while (v43);
  }
  swift_bridgeObjectRelease();
  v52 = Logger.framework.unsafeMutableAddressor();
  v53 = v62;
  v54 = v61;
  v55 = v63;
  (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v61, v52, v63);
  v56 = Logger.logObject.getter();
  v57 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v56, v57))
  {
    v58 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v58 = 0;
    _os_log_impl(&dword_215151000, v56, v57, "SharedClient added Darwin observers", v58, 2u);
    MEMORY[0x2199DD454](v58, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v53 + 8))(v54, v55);
}

Swift::Void __swiftcall SharedClient.stopClient()()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _BYTE *v12;
  uint64_t v13;

  v1 = v0;
  v2 = type metadata accessor for Logger();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = OBJC_IVAR____SRSTSharedClient_stopped;
  if ((v1[OBJC_IVAR____SRSTSharedClient_stopped] & 1) == 0)
  {
    v8 = Logger.framework.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v8, v2);
    v9 = Logger.logObject.getter();
    v10 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_215151000, v9, v10, "#SiriStates stopping client", v11, 2u);
      MEMORY[0x2199DD454](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    v1[v7] = 1;
    type metadata accessor for SharedClient();
    lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type SharedClient and conformance SharedClient, (uint64_t (*)(uint64_t))type metadata accessor for SharedClient, (uint64_t)&protocol conformance descriptor for SharedClient);
    static Clientele.remove<A>(_:)((uint64_t)v1);
    type metadata accessor for OS_dispatch_queue();
    *(_QWORD *)(swift_allocObject() + 16) = v1;
    v12 = v1;
    static OS_dispatch_queue.executeOnMain<A>(_:)((void (*)(void))partial apply for closure #1 in SharedClient.deinit);
    swift_release();
  }
}

uint64_t protocol witness for ClientProtocol.delegate.getter in conformance SharedClient@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x70))();
  *a1 = result;
  return result;
}

uint64_t protocol witness for ClientProtocol.delegate.setter in conformance SharedClient(_QWORD *a1)
{
  _QWORD *v1;

  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & *v1) + 0x78))(*a1);
}

uint64_t (*protocol witness for ClientProtocol.delegate.modify in conformance SharedClient(_QWORD *a1))()
{
  _QWORD *v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x80))();
  return protocol witness for ClientProtocol.delegate.modify in conformance SharedClient;
}

uint64_t protocol witness for ClientProtocol.currentState.getter in conformance SharedClient@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x88))();
  *a1 = result;
  return result;
}

uint64_t protocol witness for ClientProtocol.currentState.setter in conformance SharedClient(_QWORD *a1)
{
  _QWORD *v1;

  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & *v1) + 0x90))(*a1);
}

uint64_t (*protocol witness for ClientProtocol.currentState.modify in conformance SharedClient(_QWORD *a1))()
{
  _QWORD *v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x98))();
  return protocol witness for ClientProtocol.delegate.modify in conformance SharedClient;
}

uint64_t protocol witness for ClientProtocol.mostRecentEvent.getter in conformance SharedClient@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  char v4;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0xB8))();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v4 & 1;
  return result;
}

uint64_t protocol witness for ClientProtocol.mostRecentEvent.setter in conformance SharedClient(uint64_t a1)
{
  _QWORD *v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))((*MEMORY[0x24BEE4EA0] & *v1) + 0xC0))(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t (*protocol witness for ClientProtocol.mostRecentEvent.modify in conformance SharedClient(_QWORD *a1))()
{
  _QWORD *v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0xC8))();
  return protocol witness for ClientProtocol.delegate.modify in conformance SharedClient;
}

void protocol witness for ClientProtocol.delegate.modify in conformance SharedClient(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

id protocol witness for ClientProtocol.init() in conformance SharedClient()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t protocol witness for ClientProtocol.dispatchEvent(_:) in conformance SharedClient(_QWORD *a1)
{
  _QWORD *v1;

  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & *v1) + 0x108))(*a1);
}

uint64_t outlined destroy of weak SharedClientDelegate?(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t outlined consume of Set<SharedState>.Iterator._Variant()
{
  return swift_release();
}

uint64_t lazy protocol witness table accessor for type SharedClient and conformance SharedClient(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2199DD3C4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void partial apply for closure #1 in SharedClient.deinit()
{
  uint64_t v0;
  const void *v1;

  v1 = *(const void **)(v0 + 16);
  type metadata accessor for NotificationCenterHelper();
  static NotificationCenterHelper.removeEveryObserver(_:)(v1);
}

uint64_t associated type witness table accessor for ClientProtocol.StateType : StateProtocol in SharedClient()
{
  return lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type SharedState and conformance SharedState, (uint64_t (*)(uint64_t))type metadata accessor for SharedState, (uint64_t)&protocol conformance descriptor for SharedState);
}

uint64_t ObjC metadata update function for SharedClient()
{
  return type metadata accessor for SharedClient();
}

void type metadata completion function for SharedClient()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for Published<SharedState?>(319, &lazy cache variable for type metadata for Published<SharedState?>, &demangling cache variable for type metadata for SharedState?);
  if (v0 <= 0x3F)
  {
    type metadata accessor for Published<SharedState?>(319, &lazy cache variable for type metadata for Published<SharedEvent?>, &demangling cache variable for type metadata for SharedEvent?);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for SharedClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SharedClient.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of SharedClient.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SharedClient.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SharedClient.currentState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SharedClient.currentState.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of SharedClient.currentState.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SharedClient.$currentState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of SharedClient.$currentState.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of SharedClient.$currentState.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of SharedClient.mostRecentEvent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of SharedClient.mostRecentEvent.setter(uint64_t a1, char a2)
{
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v2) + 0xC0))(a1, a2 & 1);
}

uint64_t dispatch thunk of SharedClient.mostRecentEvent.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of SharedClient.$mostRecentEvent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of SharedClient.$mostRecentEvent.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of SharedClient.$mostRecentEvent.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of SharedClient.mostRecentEventName.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of SharedClient.dispatchEvent(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of SharedClient.stopClient()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199DD3B8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void type metadata accessor for Published<SharedState?>(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = type metadata accessor for Published();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
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

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
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

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void specialized closure #1 in variable initialization expression of static SharedClient.handleStateTransititionNotification(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  NSObject *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  char *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t *v31;
  void (*v32)(char *, uint64_t);
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  NSObject *v36;
  uint64_t (*v37)(void *);
  NSObject *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  NSObject *v44;
  _QWORD v45[2];
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t, uint64_t);
  uint64_t v52;
  void *v53;

  v4 = type metadata accessor for Logger();
  v5 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4, v6);
  v9 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7, v10);
  v12 = (char *)v45 - v11;
  type metadata accessor for NotificationCenterHelper();
  v13 = (char *)type metadata accessor for SharedState();
  v14 = lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type SharedState and conformance SharedState, (uint64_t (*)(uint64_t))type metadata accessor for SharedState, (uint64_t)&protocol conformance descriptor for SharedState);
  static NotificationCenterHelper.state<A>(from:)(a2, v13, v14, (uint64_t)&v53);
  v15 = v53;
  if (v53)
  {
    v16 = Logger.framework.unsafeMutableAddressor();
    v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v50 = v16;
    v51 = v17;
    ((void (*)(char *))v17)(v12);
    v18 = v15;
    v19 = Logger.logObject.getter();
    v20 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v19, v20))
    {
      v47 = v5;
      v21 = swift_slowAlloc();
      v49 = v4;
      v22 = (uint8_t *)v21;
      v46 = swift_slowAlloc();
      v53 = (void *)v46;
      v48 = v9;
      *(_DWORD *)v22 = 136315138;
      v45[1] = v22 + 4;
      v23 = (char *)v18 + OBJC_IVAR____SRSTSharedState_name;
      v24 = v15;
      v25 = a1;
      v26 = v18;
      v28 = *(uint64_t *)((char *)&v18->isa + OBJC_IVAR____SRSTSharedState_name);
      v27 = *((_QWORD *)v23 + 1);
      swift_bridgeObjectRetain();
      v29 = v28;
      v18 = v26;
      a1 = v25;
      v15 = v24;
      v52 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v29, v27, (uint64_t *)&v53);
      v9 = v48;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_215151000, v19, v20, "SharedClient received valid state transition: %s", v22, 0xCu);
      v30 = v46;
      swift_arrayDestroy();
      MEMORY[0x2199DD454](v30, -1, -1);
      v31 = v22;
      v4 = v49;
      MEMORY[0x2199DD454](v31, -1, -1);

      v32 = *(void (**)(char *, uint64_t))(v47 + 8);
    }
    else
    {

      v32 = *(void (**)(char *, uint64_t))(v5 + 8);
    }
    v32(v12, v4);
    type metadata accessor for SharedClient();
    lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type SharedClient and conformance SharedClient, (uint64_t (*)(uint64_t))type metadata accessor for SharedClient, (uint64_t)&protocol conformance descriptor for SharedClient);
    v33 = static Clientele.contains<A>(_:)(a1);
    if (v33)
    {
      v34 = v33;
      v35 = (_QWORD *)MEMORY[0x24BEE4EA0];
      v36 = v18;
      v37 = *(uint64_t (**)(void *))((*MEMORY[0x24BEE4EA0] & *v33) + 0x90);
      v38 = v36;
      v39 = v37(v15);
      v40 = (void *)(*(uint64_t (**)(uint64_t))((*v35 & *v34) + 0x70))(v39);
      if (v40)
      {
        objc_msgSend(v40, sel_stateMachineWithClient_didTransitionToState_, v34, v38);

        swift_unknownObjectRelease();
      }
      else
      {

      }
    }
    else
    {
      v51(v9, v50, v4);
      v41 = Logger.logObject.getter();
      v42 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v43 = 0;
        _os_log_impl(&dword_215151000, v41, v42, "Observer for darwin callback handler not found", v43, 2u);
        MEMORY[0x2199DD454](v43, -1, -1);
        v44 = v41;
      }
      else
      {
        v44 = v18;
        v18 = v41;
      }

      v32(v9, v4);
    }
  }
}

void specialized closure #1 in variable initialization expression of static SharedClient.handleEventNotification(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  void (*v28)(char *, uint64_t);
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t, uint64_t);
  void *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;

  v4 = type metadata accessor for Logger();
  v5 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4, v6);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7, v10);
  v12 = (char *)&v39 - v11;
  type metadata accessor for NotificationCenterHelper();
  v13 = lazy protocol witness table accessor for type SharedEvent and conformance SharedEvent();
  static NotificationCenterHelper.event<A>(from:)(a2, (uint64_t)&type metadata for SharedEvent, v13, (uint64_t)&v45);
  if ((v46 & 1) == 0)
  {
    v14 = v45;
    v15 = Logger.framework.unsafeMutableAddressor();
    v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v16(v12, v15, v4);
    v17 = Logger.logObject.getter();
    v18 = static os_log_type_t.info.getter();
    v19 = os_log_type_enabled(v17, v18);
    v43 = v14;
    if (v19)
    {
      v20 = swift_slowAlloc();
      v40 = v16;
      v21 = (uint8_t *)v20;
      v22 = swift_slowAlloc();
      v39 = v15;
      v23 = v22;
      v45 = v22;
      v41 = a1;
      v42 = v9;
      *(_DWORD *)v21 = 136315138;
      v24 = SharedEvent.name.getter(v14);
      v44 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v45);
      a1 = v41;
      v9 = v42;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_215151000, v17, v18, "SharedClient received valid event reception: %s", v21, 0xCu);
      swift_arrayDestroy();
      v26 = v23;
      v15 = v39;
      MEMORY[0x2199DD454](v26, -1, -1);
      v27 = v21;
      v16 = v40;
      MEMORY[0x2199DD454](v27, -1, -1);
    }

    v28 = *(void (**)(char *, uint64_t))(v5 + 8);
    v28(v12, v4);
    type metadata accessor for SharedClient();
    lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type SharedClient and conformance SharedClient, (uint64_t (*)(uint64_t))type metadata accessor for SharedClient, (uint64_t)&protocol conformance descriptor for SharedClient);
    v29 = static Clientele.contains<A>(_:)(a1);
    if (v29)
    {
      v30 = v29;
      v31 = (_QWORD *)MEMORY[0x24BEE4EA0];
      v32 = v43;
      v33 = (*(uint64_t (**)(uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v29) + 0xC0))(v43, 0);
      v34 = (void *)(*(uint64_t (**)(uint64_t))((*v31 & *v30) + 0x70))(v33);
      if (v34)
      {
        v35 = v34;
        if ((objc_msgSend(v34, sel_respondsToSelector_, sel_stateMachineWithClient_didReceiveEvent_) & 1) != 0)
          objc_msgSend(v35, sel_stateMachineWithClient_didReceiveEvent_, v30, v32);
        swift_unknownObjectRelease();
      }

    }
    else
    {
      v16(v9, v15, v4);
      v36 = Logger.logObject.getter();
      v37 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v36, v37))
      {
        v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v38 = 0;
        _os_log_impl(&dword_215151000, v36, v37, "Observer for darwin callback handler not found", v38, 2u);
        MEMORY[0x2199DD454](v38, -1, -1);
      }

      v28(v9, v4);
    }
  }
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

void SharedClient.stopped.setter()
{
  swift_deletedMethodError();
  __break(1u);
}

id one-time initialization function for ongoingCall()
{
  void *v0;
  id v1;
  id result;

  type metadata accessor for CallState();
  v0 = (void *)*CallState.abstract.unsafeMutableAddressor();
  v1 = v0;
  result = CallState.__allocating_init(name:parent:eventHandler:)(0x43676E696F676E4FLL, 0xEB000000006C6C61, v0, (uint64_t)implicit closure #1 in variable initialization expression of static CallState.ongoingCall, 0);
  static CallState.ongoingCall = (uint64_t)result;
  return result;
}

uint64_t implicit closure #1 in variable initialization expression of static CallState.ongoingCall(uint64_t a1)
{
  id v1;
  id *v2;
  id v3;

  v1 = 0;
  switch(a1)
  {
    case 0:
    case 2:
    case 10:
      return 1;
    case 1:
    case 3:
    case 6:
    case 11:
      v2 = (id *)CallState.micMutedCall.unsafeMutableAddressor();
      goto LABEL_6;
    case 4:
    case 5:
      v2 = (id *)CallState.noCall.unsafeMutableAddressor();
      goto LABEL_6;
    case 8:
      v2 = (id *)CallState.onHoldCall.unsafeMutableAddressor();
LABEL_6:
      v1 = *v2;
      v3 = *v2;
      break;
    default:
      return (uint64_t)v1;
  }
  return (uint64_t)v1;
}

uint64_t static CallState.handleForOngoingCallState(event:)(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  id v3;

  v1 = 1;
  switch(a1)
  {
    case 0:
    case 2:
    case 10:
      return v1;
    case 1:
    case 3:
    case 6:
    case 11:
      v2 = (id *)CallState.micMutedCall.unsafeMutableAddressor();
      goto LABEL_6;
    case 4:
    case 5:
      v2 = (id *)CallState.noCall.unsafeMutableAddressor();
      goto LABEL_6;
    case 8:
      v2 = (id *)CallState.onHoldCall.unsafeMutableAddressor();
LABEL_6:
      v1 = (uint64_t)*v2;
      v3 = *v2;
      break;
    default:
      v1 = 0;
      break;
  }
  return v1;
}

uint64_t *CallState.ongoingCall.unsafeMutableAddressor()
{
  if (one-time initialization token for ongoingCall != -1)
    swift_once();
  return &static CallState.ongoingCall;
}

id static CallState.ongoingCall.getter()
{
  if (one-time initialization token for ongoingCall != -1)
    swift_once();
  return (id)static CallState.ongoingCall;
}

id one-time initialization function for responding()
{
  void *v0;
  id v1;
  id result;

  type metadata accessor for State();
  v0 = (void *)*State.abstract.unsafeMutableAddressor();
  v1 = v0;
  result = State.__allocating_init(name:parent:eventHandler:)(0x69646E6F70736552, 0xEA0000000000676ELL, v0, (uint64_t)implicit closure #1 in variable initialization expression of static State.responding, 0);
  static State.responding = (uint64_t)result;
  return result;
}

id implicit closure #1 in variable initialization expression of static State.responding(uint64_t a1)
{
  id *v1;
  id v2;
  id v3;

  if (a1 == 13)
  {
    v1 = (id *)State.available.unsafeMutableAddressor();
  }
  else if (a1 == 7)
  {
    v1 = (id *)State.postResponse.unsafeMutableAddressor();
  }
  else
  {
    if (a1)
      return 0;
    v1 = (id *)State.analyzing.unsafeMutableAddressor();
  }
  v2 = *v1;
  v3 = *v1;
  return v2;
}

uint64_t *State.responding.unsafeMutableAddressor()
{
  if (one-time initialization token for responding != -1)
    swift_once();
  return &static State.responding;
}

id static State.responding.getter()
{
  if (one-time initialization token for responding != -1)
    swift_once();
  return (id)static State.responding;
}

__CFNotificationCenter *one-time initialization function for darwinNotificationCenter()
{
  __CFNotificationCenter *result;

  result = CFNotificationCenterGetDarwinNotifyCenter();
  darwinNotificationCenter.value = result;
  return result;
}

CFNotificationCenterRef_optional *darwinNotificationCenter.unsafeMutableAddressor()
{
  if (one-time initialization token for darwinNotificationCenter != -1)
    swift_once();
  return &darwinNotificationCenter;
}

Swift::String *eventDispatchNotificationNamePrefix.unsafeMutableAddressor()
{
  return &eventDispatchNotificationNamePrefix;
}

Swift::String *stateTransitionNotificationNamePrefix.unsafeMutableAddressor()
{
  return &stateTransitionNotificationNamePrefix;
}

Swift::String *eventReceivedNotificationNamePrefix.unsafeMutableAddressor()
{
  return &eventReceivedNotificationNamePrefix;
}

Swift::String *unknownNotificationName.unsafeMutableAddressor()
{
  return &unknownNotificationName;
}

unint64_t SharedEvent.init(rawValue:)(unint64_t a1)
{
  return specialized SharedEvent.init(rawValue:)(a1);
}

void *static SharedEvent.allCases.getter()
{
  return &outlined read-only object #0 of static SharedEvent.allCases.getter;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SharedEvent(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SharedEvent()
{
  Swift::UInt *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance SharedEvent()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SharedEvent()
{
  Swift::UInt *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance SharedEvent@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = specialized SharedEvent.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance SharedEvent(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void protocol witness for static CaseIterable.allCases.getter in conformance SharedEvent(_QWORD *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static SharedEvent.allCases.getter;
}

unint64_t specialized SharedEvent.init(rawValue:)(unint64_t result)
{
  if (result > 9)
    return 0;
  return result;
}

unint64_t instantiation function for generic protocol witness table for SharedEvent(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type SharedEvent and conformance SharedEvent();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table accessor for type SharedEvent and conformance SharedEvent();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type [SharedEvent] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [SharedEvent] and conformance [A];
  if (!lazy protocol witness table cache variable for type [SharedEvent] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [SharedEvent]);
    result = MEMORY[0x2199DD3C4](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [SharedEvent] and conformance [A]);
  }
  return result;
}

ValueMetadata *type metadata accessor for SharedEvent()
{
  return &type metadata for SharedEvent;
}

id one-time initialization function for micMutedCall()
{
  void *v0;
  id v1;
  id result;

  type metadata accessor for CallState();
  v0 = (void *)*CallState.abstract.unsafeMutableAddressor();
  v1 = v0;
  result = CallState.__allocating_init(name:parent:eventHandler:)(0x646574754D63694DLL, 0xEC0000006C6C6143, v0, (uint64_t)implicit closure #1 in variable initialization expression of static CallState.micMutedCall, 0);
  static CallState.micMutedCall = (uint64_t)result;
  return result;
}

uint64_t implicit closure #1 in variable initialization expression of static CallState.micMutedCall(uint64_t a1)
{
  id v1;
  id *v2;
  id v3;

  v1 = 0;
  switch(a1)
  {
    case 0:
    case 2:
    case 7:
    case 10:
      v2 = (id *)CallState.ongoingCall.unsafeMutableAddressor();
      goto LABEL_6;
    case 1:
    case 3:
    case 11:
      return 1;
    case 4:
    case 5:
      v2 = (id *)CallState.noCall.unsafeMutableAddressor();
      goto LABEL_6;
    case 8:
      v2 = (id *)CallState.onHoldCall.unsafeMutableAddressor();
LABEL_6:
      v1 = *v2;
      v3 = *v2;
      break;
    default:
      return (uint64_t)v1;
  }
  return (uint64_t)v1;
}

uint64_t static CallState.handleForMicMutedCallState(event:)(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  id v3;

  v1 = 1;
  switch(a1)
  {
    case 0:
    case 2:
    case 7:
    case 10:
      v2 = (id *)CallState.ongoingCall.unsafeMutableAddressor();
      goto LABEL_6;
    case 1:
    case 3:
    case 11:
      return v1;
    case 4:
    case 5:
      v2 = (id *)CallState.noCall.unsafeMutableAddressor();
      goto LABEL_6;
    case 8:
      v2 = (id *)CallState.onHoldCall.unsafeMutableAddressor();
LABEL_6:
      v1 = (uint64_t)*v2;
      v3 = *v2;
      break;
    default:
      v1 = 0;
      break;
  }
  return v1;
}

uint64_t *CallState.micMutedCall.unsafeMutableAddressor()
{
  if (one-time initialization token for micMutedCall != -1)
    swift_once();
  return &static CallState.micMutedCall;
}

id static CallState.micMutedCall.getter()
{
  if (one-time initialization token for micMutedCall != -1)
    swift_once();
  return (id)static CallState.micMutedCall;
}

id one-time initialization function for noCall()
{
  void *v0;
  id v1;
  id result;

  type metadata accessor for CallState();
  v0 = (void *)*CallState.abstract.unsafeMutableAddressor();
  v1 = v0;
  result = CallState.__allocating_init(name:parent:eventHandler:)(0x6C6C61436F4ELL, 0xE600000000000000, v0, (uint64_t)implicit closure #1 in variable initialization expression of static CallState.noCall, 0);
  static CallState.noCall = (uint64_t)result;
  return result;
}

id implicit closure #1 in variable initialization expression of static CallState.noCall(uint64_t a1)
{
  id *v1;
  id v2;
  id v3;

  switch(a1)
  {
    case 0:
    case 2:
      v1 = (id *)CallState.ongoingCall.unsafeMutableAddressor();
      goto LABEL_4;
    case 1:
    case 3:
      v1 = (id *)CallState.micMutedCall.unsafeMutableAddressor();
LABEL_4:
      v2 = *v1;
      v3 = *v1;
      break;
    default:
      v2 = 0;
      break;
  }
  return v2;
}

id static CallState.handleForNoCallState(event:)(uint64_t a1)
{
  id *v1;
  id v2;
  id v3;

  switch(a1)
  {
    case 0:
    case 2:
      v1 = (id *)CallState.ongoingCall.unsafeMutableAddressor();
      goto LABEL_4;
    case 1:
    case 3:
      v1 = (id *)CallState.micMutedCall.unsafeMutableAddressor();
LABEL_4:
      v2 = *v1;
      v3 = *v1;
      break;
    default:
      v2 = 0;
      break;
  }
  return v2;
}

uint64_t *CallState.noCall.unsafeMutableAddressor()
{
  if (one-time initialization token for noCall != -1)
    swift_once();
  return &static CallState.noCall;
}

id static CallState.noCall.getter()
{
  if (one-time initialization token for noCall != -1)
    swift_once();
  return (id)static CallState.noCall;
}

id one-time initialization function for mirroring()
{
  void *v0;
  id v1;
  id result;

  type metadata accessor for SharedState();
  v0 = (void *)*SharedState.abstract.unsafeMutableAddressor();
  v1 = v0;
  result = SharedState.__allocating_init(name:parent:eventHandler:)(0x6E69726F7272694DLL, 0xE900000000000067, v0, (uint64_t)implicit closure #1 in variable initialization expression of static SharedState.mirroring, 0);
  static SharedState.mirroring = (uint64_t)result;
  return result;
}

uint64_t implicit closure #1 in variable initialization expression of static SharedState.mirroring(uint64_t a1)
{
  id *v1;
  id v2;
  id v3;

  switch(a1)
  {
    case 0:
      return 1;
    case 5:
      v1 = (id *)SharedState.serving.unsafeMutableAddressor();
      break;
    case 1:
      v1 = (id *)SharedState.unshared.unsafeMutableAddressor();
      break;
    default:
      return 0;
  }
  v2 = *v1;
  v3 = *v1;
  return (uint64_t)v2;
}

uint64_t *SharedState.mirroring.unsafeMutableAddressor()
{
  if (one-time initialization token for mirroring != -1)
    swift_once();
  return &static SharedState.mirroring;
}

id static SharedState.mirroring.getter()
{
  if (one-time initialization token for mirroring != -1)
    swift_once();
  return (id)static SharedState.mirroring;
}

uint64_t dispatch thunk of EventProtocol.init(name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of EventProtocol.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static EventProtocol.enterEvent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of static EventProtocol.exitEvent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of static EventProtocol.initialEvent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

id one-time initialization function for available()
{
  void *v0;
  id v1;
  id result;

  type metadata accessor for State();
  v0 = (void *)*State.abstract.unsafeMutableAddressor();
  v1 = v0;
  result = State.__allocating_init(name:parent:eventHandler:)(0x6C62616C69617641, 0xE900000000000065, v0, (uint64_t)implicit closure #1 in variable initialization expression of static State.available, 0);
  static State.available = (uint64_t)result;
  return result;
}

id implicit closure #1 in variable initialization expression of static State.available(uint64_t a1)
{
  id *v1;
  id v2;
  id v3;

  if (a1)
  {
    if (a1 != 4)
      return 0;
    v1 = (id *)State.disabled.unsafeMutableAddressor();
  }
  else
  {
    v1 = (id *)State.analyzing.unsafeMutableAddressor();
  }
  v2 = *v1;
  v3 = *v1;
  return v2;
}

uint64_t *State.available.unsafeMutableAddressor()
{
  if (one-time initialization token for available != -1)
    swift_once();
  return &static State.available;
}

id static State.available.getter()
{
  if (one-time initialization token for available != -1)
    swift_once();
  return (id)static State.available;
}

id one-time initialization function for onHoldCall()
{
  void *v0;
  id v1;
  id result;

  type metadata accessor for CallState();
  v0 = (void *)*CallState.abstract.unsafeMutableAddressor();
  v1 = v0;
  result = CallState.__allocating_init(name:parent:eventHandler:)(0x6143646C6F486E4FLL, 0xEA00000000006C6CLL, v0, (uint64_t)implicit closure #1 in variable initialization expression of static CallState.onHoldCall, 0);
  static CallState.onHoldCall = (uint64_t)result;
  return result;
}

id implicit closure #1 in variable initialization expression of static CallState.onHoldCall(unint64_t a1)
{
  id v1;
  id *v2;
  id v3;

  v1 = 0;
  if (a1 <= 0xB)
  {
    if (((1 << a1) & 0x605) != 0)
    {
      v2 = (id *)CallState.ongoingCall.unsafeMutableAddressor();
      goto LABEL_8;
    }
    if (((1 << a1) & 0x80A) != 0)
    {
      v2 = (id *)CallState.micMutedCall.unsafeMutableAddressor();
LABEL_8:
      v1 = *v2;
      v3 = *v2;
      return v1;
    }
    if (((1 << a1) & 0x30) != 0)
    {
      v2 = (id *)CallState.noCall.unsafeMutableAddressor();
      goto LABEL_8;
    }
  }
  return v1;
}

id static CallState.handleForOnHoldCallState(event:)(unint64_t a1)
{
  id v1;
  id *v2;
  id v3;

  v1 = 0;
  if (a1 <= 0xB)
  {
    if (((1 << a1) & 0x605) != 0)
    {
      v2 = (id *)CallState.ongoingCall.unsafeMutableAddressor();
      goto LABEL_8;
    }
    if (((1 << a1) & 0x80A) != 0)
    {
      v2 = (id *)CallState.micMutedCall.unsafeMutableAddressor();
LABEL_8:
      v1 = *v2;
      v3 = *v2;
      return v1;
    }
    if (((1 << a1) & 0x30) != 0)
    {
      v2 = (id *)CallState.noCall.unsafeMutableAddressor();
      goto LABEL_8;
    }
  }
  return v1;
}

uint64_t *CallState.onHoldCall.unsafeMutableAddressor()
{
  if (one-time initialization token for onHoldCall != -1)
    swift_once();
  return &static CallState.onHoldCall;
}

id static CallState.onHoldCall.getter()
{
  if (one-time initialization token for onHoldCall != -1)
    swift_once();
  return (id)static CallState.onHoldCall;
}

uint64_t CallEvent.init(name:)(uint64_t a1, uint64_t a2)
{
  return specialized CallEvent.init(name:)(a1, a2);
}

uint64_t CallEvent.name.getter(uint64_t a1)
{
  uint64_t result;
  unsigned int v3;

  result = 0x6C61437472617473;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 0xD000000000000011;
      break;
    case 2:
      result = 0x6C6C61436E696F6ALL;
      break;
    case 3:
      result = 0xD000000000000010;
      break;
    case 4:
      result = 0x6C6143657661656CLL;
      break;
    case 5:
      result = 0x6C6C6143646E65;
      break;
    case 6:
      v3 = 1702131053;
      goto LABEL_15;
    case 7:
      result = 0x61436574756D6E75;
      break;
    case 8:
      v3 = 1684828008;
LABEL_15:
      result = v3 | 0x6C6C614300000000;
      break;
    case 9:
      result = 0x6143646C6F686E75;
      break;
    case 10:
      result = 0x6143686374697773;
      break;
    case 11:
      result = 0xD000000000000013;
      break;
    case 12:
      result = 1953069157;
      break;
    case 13:
      result = 0x7265746E65;
      break;
    case 14:
      result = 0x6C616974696E69;
      break;
    default:
      result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
      __break(1u);
      break;
  }
  return result;
}

void *CallEvent.exitEvent.unsafeMutableAddressor()
{
  return &static CallEvent.exitEvent;
}

uint64_t static CallEvent.exitEvent.getter()
{
  return 12;
}

void *CallEvent.enterEvent.unsafeMutableAddressor()
{
  return &static CallEvent.enterEvent;
}

uint64_t static CallEvent.enterEvent.getter()
{
  return 13;
}

void *CallEvent.initialEvent.unsafeMutableAddressor()
{
  return &static CallEvent.initialEvent;
}

uint64_t static CallEvent.initialEvent.getter()
{
  return 14;
}

uint64_t protocol witness for EventProtocol.init(name:) in conformance CallEvent@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;
  char v5;

  result = specialized CallEvent.init(name:)(a1, a2);
  *(_QWORD *)a3 = result;
  *(_BYTE *)(a3 + 8) = v5 & 1;
  return result;
}

uint64_t protocol witness for EventProtocol.name.getter in conformance CallEvent()
{
  uint64_t *v0;

  return CallEvent.name.getter(*v0);
}

void protocol witness for static EventProtocol.enterEvent.getter in conformance CallEvent(_QWORD *a1@<X8>)
{
  *a1 = 13;
}

void protocol witness for static EventProtocol.exitEvent.getter in conformance CallEvent(_QWORD *a1@<X8>)
{
  *a1 = 12;
}

void protocol witness for static EventProtocol.initialEvent.getter in conformance CallEvent(_QWORD *a1@<X8>)
{
  *a1 = 14;
}

uint64_t Event.init(name:)(uint64_t a1, uint64_t a2)
{
  return specialized Event.init(name:)(a1, a2);
}

uint64_t Event.name.getter(uint64_t a1)
{
  uint64_t result;

  result = 0x72656767697274;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
    case 2:
      result = 0x6F69746E65747461;
      break;
    case 3:
      result = 0x656C62616E65;
      break;
    case 4:
      result = 0x656C6261736964;
      break;
    case 5:
      result = 0x4372656767697274;
      break;
    case 6:
      result = 0x655274696D627573;
      break;
    case 7:
      result = 0x6449656D6F636562;
      break;
    case 8:
      result = 0x636F72506C696166;
      break;
    case 9:
      result = 0x52746E6573657270;
      break;
    case 10:
      result = 0x71655274726F6261;
      break;
    case 11:
      result = 0x5474756F656D6974;
      break;
    case 12:
      result = 0xD000000000000013;
      break;
    case 13:
      result = 0x7373696D736964;
      break;
    case 14:
      result = 1953069157;
      break;
    case 15:
      result = 0x7265746E65;
      break;
    case 16:
      result = 0x6C616974696E69;
      break;
    default:
      result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
      __break(1u);
      break;
  }
  return result;
}

void *Event.exitEvent.unsafeMutableAddressor()
{
  return &static Event.exitEvent;
}

uint64_t static Event.exitEvent.getter()
{
  return 14;
}

void *Event.enterEvent.unsafeMutableAddressor()
{
  return &static Event.enterEvent;
}

uint64_t static Event.enterEvent.getter()
{
  return 15;
}

void *Event.initialEvent.unsafeMutableAddressor()
{
  return &static Event.initialEvent;
}

uint64_t static Event.initialEvent.getter()
{
  return 16;
}

uint64_t protocol witness for EventProtocol.init(name:) in conformance Event@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;
  char v5;

  result = specialized Event.init(name:)(a1, a2);
  *(_QWORD *)a3 = result;
  *(_BYTE *)(a3 + 8) = v5 & 1;
  return result;
}

uint64_t protocol witness for EventProtocol.name.getter in conformance Event()
{
  uint64_t *v0;

  return Event.name.getter(*v0);
}

void protocol witness for static EventProtocol.enterEvent.getter in conformance Event(_QWORD *a1@<X8>)
{
  *a1 = 15;
}

void protocol witness for static EventProtocol.initialEvent.getter in conformance Event(_QWORD *a1@<X8>)
{
  *a1 = 16;
}

uint64_t SharedEvent.init(name:)(uint64_t a1, uint64_t a2)
{
  return specialized SharedEvent.init(name:)(a1, a2);
}

uint64_t SharedEvent.name.getter(uint64_t a1)
{
  uint64_t result;

  result = 0xD000000000000017;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 0xD000000000000019;
      break;
    case 2:
      result = 0xD000000000000015;
      break;
    case 3:
      result = 0xD000000000000012;
      break;
    case 4:
    case 6:
      result = 0xD000000000000016;
      break;
    case 5:
      result = 0xD000000000000018;
      break;
    case 7:
      result = 1953069157;
      break;
    case 8:
      result = 0x7265746E65;
      break;
    case 9:
      result = 0x6C616974696E69;
      break;
    default:
      result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
      __break(1u);
      break;
  }
  return result;
}

void *SharedEvent.exitEvent.unsafeMutableAddressor()
{
  return &static SharedEvent.exitEvent;
}

uint64_t static SharedEvent.exitEvent.getter()
{
  return 7;
}

void *SharedEvent.enterEvent.unsafeMutableAddressor()
{
  return &static SharedEvent.enterEvent;
}

uint64_t static SharedEvent.enterEvent.getter()
{
  return 8;
}

void *SharedEvent.initialEvent.unsafeMutableAddressor()
{
  return &static SharedEvent.initialEvent;
}

uint64_t static SharedEvent.initialEvent.getter()
{
  return 9;
}

uint64_t protocol witness for EventProtocol.init(name:) in conformance SharedEvent@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;
  char v5;

  result = specialized SharedEvent.init(name:)(a1, a2);
  *(_QWORD *)a3 = result;
  *(_BYTE *)(a3 + 8) = v5 & 1;
  return result;
}

uint64_t protocol witness for EventProtocol.name.getter in conformance SharedEvent()
{
  uint64_t *v0;

  return SharedEvent.name.getter(*v0);
}

void protocol witness for static EventProtocol.enterEvent.getter in conformance SharedEvent(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

void protocol witness for static EventProtocol.exitEvent.getter in conformance SharedEvent(_QWORD *a1@<X8>)
{
  *a1 = 7;
}

void protocol witness for static EventProtocol.initialEvent.getter in conformance SharedEvent(_QWORD *a1@<X8>)
{
  *a1 = 9;
}

uint64_t specialized CallEvent.init(name:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6C61437472617473 && a2 == 0xE90000000000006CLL;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000021516E6C0
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6C61436E696F6ALL && a2 == 0xE800000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000021516E6A0
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C6143657661656CLL && a2 == 0xE90000000000006CLL
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6C6C6143646E65 && a2 == 0xE700000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6C6C61436574756DLL && a2 == 0xEB0000000063694DLL
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x61436574756D6E75 && a2 == 0xED000063694D6C6CLL
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6C6C6143646C6F68 && a2 == 0xE800000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x6143646C6F686E75 && a2 == 0xEA00000000006C6CLL
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6143686374697773 && a2 == 0xEB00000000736C6CLL
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000021516E680
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 1953069157 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x7265746E65 && a2 == 0xE500000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x6C616974696E69 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 14;
    else
      return 0;
  }
}

uint64_t specialized Event.init(name:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x72656767697274 && a2 == 0xE700000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F69746E65747461 && a2 == 0xED00006E6961476ELL
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F69746E65747461 && a2 == 0xED000073736F4C6ELL
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656C62616E65 && a2 == 0xE600000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656C6261736964 && a2 == 0xE700000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x4372656767697274 && a2 == 0xED000074696D6D6FLL
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x655274696D627573 && a2 == 0xED00007473657571
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6449656D6F636562 && a2 == 0xEA0000000000656CLL
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x636F72506C696166 && a2 == 0xEE00676E69737365
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x52746E6573657270 && a2 == 0xEF65736E6F707365
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x71655274726F6261 && a2 == 0xEC00000074736575
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x5474756F656D6974 && a2 == 0xEB000000006E7275
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000021516E6E0
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x7373696D736964 && a2 == 0xE700000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 1953069157 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 0x7265746E65 && a2 == 0xE500000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else if (a1 == 0x6C616974696E69 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 16;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 16;
    else
      return 0;
  }
}

uint64_t specialized SharedEvent.init(name:)(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000017 && a2 == 0x800000021516E7C0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000021516E7A0
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000021516E780
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000021516E760
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000021516E740
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000021516E720
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000021516E700
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 1953069157 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x7265746E65 && a2 == 0xE500000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x6C616974696E69 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 9;
    else
      return 0;
  }
}

unint64_t instantiation function for generic protocol witness table for CallEvent(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type CallEvent and conformance CallEvent();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table accessor for type CallEvent and conformance CallEvent();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type CallEvent and conformance CallEvent()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CallEvent and conformance CallEvent;
  if (!lazy protocol witness table cache variable for type CallEvent and conformance CallEvent)
  {
    result = MEMORY[0x2199DD3C4](&protocol conformance descriptor for CallEvent, &type metadata for CallEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CallEvent and conformance CallEvent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CallEvent and conformance CallEvent;
  if (!lazy protocol witness table cache variable for type CallEvent and conformance CallEvent)
  {
    result = MEMORY[0x2199DD3C4](&protocol conformance descriptor for CallEvent, &type metadata for CallEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CallEvent and conformance CallEvent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CallEvent and conformance CallEvent;
  if (!lazy protocol witness table cache variable for type CallEvent and conformance CallEvent)
  {
    result = MEMORY[0x2199DD3C4](&protocol conformance descriptor for CallEvent, &type metadata for CallEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CallEvent and conformance CallEvent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CallEvent and conformance CallEvent;
  if (!lazy protocol witness table cache variable for type CallEvent and conformance CallEvent)
  {
    result = MEMORY[0x2199DD3C4](&protocol conformance descriptor for CallEvent, &type metadata for CallEvent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CallEvent and conformance CallEvent);
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for Event(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type Event and conformance Event();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table accessor for type Event and conformance Event();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type Event and conformance Event()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Event and conformance Event;
  if (!lazy protocol witness table cache variable for type Event and conformance Event)
  {
    result = MEMORY[0x2199DD3C4](&protocol conformance descriptor for Event, &type metadata for Event);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Event and conformance Event);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Event and conformance Event;
  if (!lazy protocol witness table cache variable for type Event and conformance Event)
  {
    result = MEMORY[0x2199DD3C4](&protocol conformance descriptor for Event, &type metadata for Event);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Event and conformance Event);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Event and conformance Event;
  if (!lazy protocol witness table cache variable for type Event and conformance Event)
  {
    result = MEMORY[0x2199DD3C4](&protocol conformance descriptor for Event, &type metadata for Event);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Event and conformance Event);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Event and conformance Event;
  if (!lazy protocol witness table cache variable for type Event and conformance Event)
  {
    result = MEMORY[0x2199DD3C4](&protocol conformance descriptor for Event, &type metadata for Event);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Event and conformance Event);
  }
  return result;
}

id one-time initialization function for postResponse()
{
  void *v0;
  id v1;
  id result;

  type metadata accessor for State();
  v0 = (void *)*State.attending.unsafeMutableAddressor();
  v1 = v0;
  result = State.__allocating_init(name:parent:eventHandler:)(0x7365522D74736F50, 0xED000065736E6F70, v0, (uint64_t)implicit closure #1 in variable initialization expression of static State.postResponse, 0);
  static State.postResponse = (uint64_t)result;
  return result;
}

id implicit closure #1 in variable initialization expression of static State.postResponse(uint64_t a1)
{
  id *v1;
  id v2;
  id v3;

  switch(a1)
  {
    case 9:
      v1 = (id *)State.responding.unsafeMutableAddressor();
      break;
    case 13:
      v1 = (id *)State.available.unsafeMutableAddressor();
      break;
    case 11:
      v1 = (id *)State.resting.unsafeMutableAddressor();
      break;
    default:
      return 0;
  }
  v2 = *v1;
  v3 = *v1;
  return v2;
}

uint64_t *State.postResponse.unsafeMutableAddressor()
{
  if (one-time initialization token for postResponse != -1)
    swift_once();
  return &static State.postResponse;
}

id static State.postResponse.getter()
{
  if (one-time initialization token for postResponse != -1)
    swift_once();
  return (id)static State.postResponse;
}

uint64_t key path getter for CallState.parent : CallState@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return key path getter for CallState.parent : CallState(a1, &OBJC_IVAR____SRSTCallState_parent, a2);
}

uint64_t key path setter for CallState.parent : CallState()
{
  return key path setter for CallState.parent : CallState();
}

{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t CallState.parent.getter()
{
  return CallState.parent.getter(&OBJC_IVAR____SRSTCallState_parent);
}

void CallState.parent.setter(void *a1)
{
  CallState.parent.setter(a1);
}

{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();

}

uint64_t (*CallState.parent.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____SRSTCallState_parent;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x2199DD49C](v5);
  return CallState.parent.modify;
}

uint64_t CallState.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____SRSTCallState_name);
  swift_bridgeObjectRetain();
  return v1;
}

id CallState.__allocating_init(name:parent:eventHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return CallState.__allocating_init(name:parent:eventHandler:)(a1, a2, a3, a4, a5, (uint64_t)&OBJC_IVAR____SRSTCallState_parent, &OBJC_IVAR____SRSTCallState_name, &OBJC_IVAR____SRSTCallState_eventHandler);
}

id CallState.init(name:parent:eventHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return CallState.init(name:parent:eventHandler:)(a1, a2, a3, a4, a5, (uint64_t)&OBJC_IVAR____SRSTCallState_parent, &OBJC_IVAR____SRSTCallState_name, &OBJC_IVAR____SRSTCallState_eventHandler);
}

uint64_t CallState.isEqual(_:)(uint64_t a1)
{
  return CallState.isEqual(_:)(a1, &OBJC_IVAR____SRSTCallState_name);
}

uint64_t outlined init with copy of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t CallState.hash.getter()
{
  return CallState.hash.getter();
}

{
  lazy protocol witness table accessor for type String and conformance String();
  return StringProtocol.hash.getter();
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x2199DD3C4](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

id CallState.makeProxy()()
{
  return CallState.makeProxy()(type metadata accessor for CallStateProxy, &OBJC_IVAR____SRSTCallStateProxy_state);
}

id CallStateProxy.__allocating_init(_:)(uint64_t a1)
{
  return CallStateProxy.__allocating_init(_:)(a1, &OBJC_IVAR____SRSTCallStateProxy_state);
}

uint64_t type metadata accessor for CallStateProxy()
{
  return objc_opt_self();
}

void CallState.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CallStateProxy.state.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____SRSTCallStateProxy_state);
}

id CallStateProxy.init(_:)(uint64_t a1)
{
  return CallStateProxy.init(_:)(a1, &OBJC_IVAR____SRSTCallStateProxy_state);
}

uint64_t CallStateProxy.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return CallStateProxy.init(from:)(a1);
}

uint64_t CallStateProxy.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  objc_class *ObjectType;
  _QWORD *v5;
  char *v6;
  id v7;
  uint64_t result;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  objc_super v18;
  _QWORD v19[4];

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v6 = v1;
  v7 = v5;
  dispatch thunk of Decoder.singleValueContainer()();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    swift_deallocPartialClassInstance();
    return (uint64_t)v7;
  }
  __swift_project_boxed_opaque_existential_1(v19, v19[3]);
  v9 = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
  v11 = v10;
  CallState.allStates.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v12 = swift_bridgeObjectRetain();
  specialized Sequence.first(where:)(v12, v9, (uint64_t)v11, (void (*)(void))type metadata accessor for CallState, &lazy protocol witness table cache variable for type CallState and conformance NSObject, &OBJC_IVAR____SRSTCallState_name);
  v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14)
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)&v6[OBJC_IVAR____SRSTCallStateProxy_state] = v14;

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
    v18.receiver = v6;
    v18.super_class = ObjectType;
    v7 = objc_msgSendSuper2(&v18, sel_init);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    return (uint64_t)v7;
  }
  _StringGuts.grow(_:)(67);
  v15._object = (void *)0x800000021516E840;
  v15._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v15);
  v16._countAndFlagsBits = v9;
  v16._object = v11;
  String.append(_:)(v16);
  v17._countAndFlagsBits = 0xD000000000000026;
  v17._object = (void *)0x800000021516E860;
  String.append(_:)(v17);
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t static CallState.named(_:)(uint64_t a1, uint64_t a2)
{
  return static CallState.named(_:)(a1, a2, (void (*)(void))CallState.allStates.unsafeMutableAddressor, (void (*)(void))type metadata accessor for CallState, &lazy protocol witness table cache variable for type CallState and conformance NSObject, &OBJC_IVAR____SRSTCallState_name);
}

uint64_t CallStateProxy.encode(to:)(_QWORD *a1)
{
  return CallStateProxy.encode(to:)(a1);
}

{
  _BYTE v2[24];
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  swift_bridgeObjectRetain();
  dispatch thunk of SingleValueEncodingContainer.encode(_:)();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
}

void CallStateProxy.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t protocol witness for Decodable.init(from:) in conformance CallStateProxy@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return protocol witness for Decodable.init(from:) in conformance CallStateProxy(a1, (uint64_t (*)(uint64_t))CallStateProxy.init(from:), a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance CallStateProxy(_QWORD *a1)
{
  return protocol witness for Encodable.encode(to:) in conformance CallStateProxy(a1);
}

{
  _BYTE v2[24];
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  swift_bridgeObjectRetain();
  dispatch thunk of SingleValueEncodingContainer.encode(_:)();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
}

id protocol witness for ProxyProtocol.state.getter in conformance CallStateProxy@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  void *v2;

  v2 = *(void **)(*v1 + OBJC_IVAR____SRSTCallStateProxy_state);
  *a1 = v2;
  return v2;
}

uint64_t CallStateProxy.isEqual(_:)(uint64_t a1)
{
  return CallStateProxy.isEqual(_:)(a1, &OBJC_IVAR____SRSTCallStateProxy_state);
}

uint64_t @objc CallState.isEqual(_:)(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_OWORD *))
{
  id v6;
  id v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v6 = a1;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = a1;
  }
  v8 = a4(v10);

  outlined destroy of Any?((uint64_t)v10);
  return v8 & 1;
}

uint64_t CallStateProxy.hash.getter()
{
  return CallStateProxy.hash.getter();
}

{
  lazy protocol witness table accessor for type String and conformance String();
  return StringProtocol.hash.getter();
}

uint64_t CallState.handle(event:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + OBJC_IVAR____SRSTCallState_eventHandler))();
}

uint64_t protocol witness for StateProtocol.parent.getter in conformance CallState@<X0>(uint64_t *a1@<X8>)
{
  return protocol witness for StateProtocol.parent.getter in conformance CallState(&OBJC_IVAR____SRSTCallState_parent, a1);
}

uint64_t protocol witness for StateProtocol.name.getter in conformance CallState(uint64_t a1, uint64_t a2)
{
  return protocol witness for StateProtocol.name.getter in conformance CallState(a1, a2, &OBJC_IVAR____SRSTCallState_name);
}

uint64_t protocol witness for StateProtocol.handle(event:) in conformance CallState@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return protocol witness for StateProtocol.handle(event:) in conformance CallState(a1, &OBJC_IVAR____SRSTCallState_eventHandler, a2);
}

id protocol witness for StateProtocol.makeProxy() in conformance CallState@<X0>(_QWORD *a1@<X8>)
{
  return protocol witness for StateProtocol.makeProxy() in conformance CallState(type metadata accessor for CallStateProxy, &OBJC_IVAR____SRSTCallStateProxy_state, a1);
}

uint64_t protocol witness for static StateProtocol.named(_:) in conformance CallState@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return protocol witness for static StateProtocol.named(_:) in conformance CallState(a1, a2, (void (*)(void))CallState.allStates.unsafeMutableAddressor, (void (*)(void))type metadata accessor for CallState, &lazy protocol witness table cache variable for type CallState and conformance NSObject, &OBJC_IVAR____SRSTCallState_name, a3);
}

uint64_t key path getter for State.parent : State@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return key path getter for CallState.parent : CallState(a1, &OBJC_IVAR____SRSTState_parent, a2);
}

uint64_t key path setter for State.parent : State()
{
  return key path setter for CallState.parent : CallState();
}

uint64_t State.parent.getter()
{
  return CallState.parent.getter(&OBJC_IVAR____SRSTState_parent);
}

void State.parent.setter(void *a1)
{
  CallState.parent.setter(a1);
}

uint64_t (*State.parent.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____SRSTState_parent;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x2199DD49C](v5);
  return CallState.parent.modify;
}

uint64_t State.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____SRSTState_name);
  swift_bridgeObjectRetain();
  return v1;
}

id State.__allocating_init(name:parent:eventHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return CallState.__allocating_init(name:parent:eventHandler:)(a1, a2, a3, a4, a5, (uint64_t)&OBJC_IVAR____SRSTState_parent, &OBJC_IVAR____SRSTState_name, &OBJC_IVAR____SRSTState_eventHandler);
}

id State.init(name:parent:eventHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return CallState.init(name:parent:eventHandler:)(a1, a2, a3, a4, a5, (uint64_t)&OBJC_IVAR____SRSTState_parent, &OBJC_IVAR____SRSTState_name, &OBJC_IVAR____SRSTState_eventHandler);
}

uint64_t State.isEqual(_:)(uint64_t a1)
{
  return CallState.isEqual(_:)(a1, &OBJC_IVAR____SRSTState_name);
}

uint64_t State.hash.getter()
{
  return CallState.hash.getter();
}

id State.makeProxy()()
{
  return CallState.makeProxy()(type metadata accessor for StateProxy, &OBJC_IVAR____SRSTStateProxy_state);
}

id StateProxy.__allocating_init(_:)(uint64_t a1)
{
  return CallStateProxy.__allocating_init(_:)(a1, &OBJC_IVAR____SRSTStateProxy_state);
}

void State.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id StateProxy.state.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____SRSTStateProxy_state);
}

id StateProxy.init(_:)(uint64_t a1)
{
  return CallStateProxy.init(_:)(a1, &OBJC_IVAR____SRSTStateProxy_state);
}

uint64_t StateProxy.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return StateProxy.init(from:)(a1);
}

uint64_t StateProxy.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  objc_class *ObjectType;
  _QWORD *v5;
  char *v6;
  id v7;
  uint64_t result;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  objc_super v18;
  _QWORD v19[4];

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v6 = v1;
  v7 = v5;
  dispatch thunk of Decoder.singleValueContainer()();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    swift_deallocPartialClassInstance();
    return (uint64_t)v7;
  }
  __swift_project_boxed_opaque_existential_1(v19, v19[3]);
  v9 = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
  v11 = v10;
  State.allStates.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v12 = swift_bridgeObjectRetain();
  specialized Sequence.first(where:)(v12, v9, (uint64_t)v11, (void (*)(void))type metadata accessor for State, &lazy protocol witness table cache variable for type State and conformance NSObject, &OBJC_IVAR____SRSTState_name);
  v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14)
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)&v6[OBJC_IVAR____SRSTStateProxy_state] = v14;

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
    v18.receiver = v6;
    v18.super_class = ObjectType;
    v7 = objc_msgSendSuper2(&v18, sel_init);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    return (uint64_t)v7;
  }
  _StringGuts.grow(_:)(67);
  v15._object = (void *)0x800000021516E840;
  v15._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v15);
  v16._countAndFlagsBits = v9;
  v16._object = v11;
  String.append(_:)(v16);
  v17._countAndFlagsBits = 0xD000000000000026;
  v17._object = (void *)0x800000021516E860;
  String.append(_:)(v17);
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t static State.named(_:)(uint64_t a1, uint64_t a2)
{
  return static CallState.named(_:)(a1, a2, (void (*)(void))State.allStates.unsafeMutableAddressor, (void (*)(void))type metadata accessor for State, &lazy protocol witness table cache variable for type State and conformance NSObject, &OBJC_IVAR____SRSTState_name);
}

uint64_t StateProxy.encode(to:)(_QWORD *a1)
{
  return CallStateProxy.encode(to:)(a1);
}

id StateProxy.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void StateProxy.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t protocol witness for Decodable.init(from:) in conformance StateProxy@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return protocol witness for Decodable.init(from:) in conformance CallStateProxy(a1, (uint64_t (*)(uint64_t))StateProxy.init(from:), a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance StateProxy(_QWORD *a1)
{
  return protocol witness for Encodable.encode(to:) in conformance CallStateProxy(a1);
}

id protocol witness for ProxyProtocol.state.getter in conformance StateProxy@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  void *v2;

  v2 = *(void **)(*v1 + OBJC_IVAR____SRSTStateProxy_state);
  *a1 = v2;
  return v2;
}

uint64_t StateProxy.isEqual(_:)(uint64_t a1)
{
  return CallStateProxy.isEqual(_:)(a1, &OBJC_IVAR____SRSTStateProxy_state);
}

uint64_t StateProxy.hash.getter()
{
  return CallStateProxy.hash.getter();
}

uint64_t State.handle(event:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + OBJC_IVAR____SRSTState_eventHandler))();
}

uint64_t protocol witness for StateProtocol.parent.getter in conformance State@<X0>(uint64_t *a1@<X8>)
{
  return protocol witness for StateProtocol.parent.getter in conformance CallState(&OBJC_IVAR____SRSTState_parent, a1);
}

uint64_t protocol witness for StateProtocol.name.getter in conformance State(uint64_t a1, uint64_t a2)
{
  return protocol witness for StateProtocol.name.getter in conformance CallState(a1, a2, &OBJC_IVAR____SRSTState_name);
}

uint64_t protocol witness for StateProtocol.handle(event:) in conformance State@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return protocol witness for StateProtocol.handle(event:) in conformance CallState(a1, &OBJC_IVAR____SRSTState_eventHandler, a2);
}

id protocol witness for StateProtocol.makeProxy() in conformance State@<X0>(_QWORD *a1@<X8>)
{
  return protocol witness for StateProtocol.makeProxy() in conformance CallState(type metadata accessor for StateProxy, &OBJC_IVAR____SRSTStateProxy_state, a1);
}

uint64_t protocol witness for static StateProtocol.named(_:) in conformance State@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return protocol witness for static StateProtocol.named(_:) in conformance CallState(a1, a2, (void (*)(void))State.allStates.unsafeMutableAddressor, (void (*)(void))type metadata accessor for State, &lazy protocol witness table cache variable for type State and conformance NSObject, &OBJC_IVAR____SRSTState_name, a3);
}

uint64_t key path getter for SharedState.parent : SharedState@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return key path getter for CallState.parent : CallState(a1, &OBJC_IVAR____SRSTSharedState_parent, a2);
}

uint64_t key path getter for CallState.parent : CallState@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = *a1 + *a2;
  swift_beginAccess();
  result = MEMORY[0x2199DD49C](v4);
  *a3 = result;
  return result;
}

uint64_t key path setter for SharedState.parent : SharedState()
{
  return key path setter for CallState.parent : CallState();
}

uint64_t SharedState.parent.getter()
{
  return CallState.parent.getter(&OBJC_IVAR____SRSTSharedState_parent);
}

uint64_t CallState.parent.getter(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + *a1;
  swift_beginAccess();
  return MEMORY[0x2199DD49C](v2);
}

void SharedState.parent.setter(void *a1)
{
  CallState.parent.setter(a1);
}

uint64_t (*SharedState.parent.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____SRSTSharedState_parent;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x2199DD49C](v5);
  return CallState.parent.modify;
}

void CallState.parent.modify(id **a1, char a2)
{
  id *v3;
  id v4;

  v3 = *a1;
  v4 = (*a1)[3];
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {

    swift_endAccess();
  }
  else
  {
    swift_endAccess();

  }
  free(v3);
}

id @objc CallState.name.getter(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (uint64_t *)(a1 + *a3);
  v4 = *v3;
  v5 = v3[1];
  swift_bridgeObjectRetain();
  v6 = (void *)MEMORY[0x2199DCD04](v4, v5);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t SharedState.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____SRSTSharedState_name);
  swift_bridgeObjectRetain();
  return v1;
}

id SharedState.__allocating_init(name:parent:eventHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return CallState.__allocating_init(name:parent:eventHandler:)(a1, a2, a3, a4, a5, (uint64_t)&OBJC_IVAR____SRSTSharedState_parent, &OBJC_IVAR____SRSTSharedState_name, &OBJC_IVAR____SRSTSharedState_eventHandler);
}

id CallState.__allocating_init(name:parent:eventHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7, _QWORD *a8)
{
  objc_class *v8;
  char *v16;
  char *v17;
  char *v18;
  id v19;
  objc_super v21;

  v16 = (char *)objc_allocWithZone(v8);
  swift_unknownObjectWeakInit();
  v17 = &v16[*a7];
  *(_QWORD *)v17 = a1;
  *((_QWORD *)v17 + 1) = a2;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  v18 = &v16[*a8];
  *(_QWORD *)v18 = a4;
  *((_QWORD *)v18 + 1) = a5;
  v21.receiver = v16;
  v21.super_class = v8;
  v19 = objc_msgSendSuper2(&v21, sel_init);

  return v19;
}

id SharedState.init(name:parent:eventHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return CallState.init(name:parent:eventHandler:)(a1, a2, a3, a4, a5, (uint64_t)&OBJC_IVAR____SRSTSharedState_parent, &OBJC_IVAR____SRSTSharedState_name, &OBJC_IVAR____SRSTSharedState_eventHandler);
}

id CallState.init(name:parent:eventHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7, _QWORD *a8)
{
  char *v8;
  objc_class *ObjectType;
  char *v17;
  char *v18;
  id v19;
  objc_super v21;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  v17 = &v8[*a7];
  *(_QWORD *)v17 = a1;
  *((_QWORD *)v17 + 1) = a2;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  v18 = &v8[*a8];
  *(_QWORD *)v18 = a4;
  *((_QWORD *)v18 + 1) = a5;
  v21.receiver = v8;
  v21.super_class = ObjectType;
  v19 = objc_msgSendSuper2(&v21, sel_init);

  return v19;
}

uint64_t SharedState.isEqual(_:)(uint64_t a1)
{
  return CallState.isEqual(_:)(a1, &OBJC_IVAR____SRSTSharedState_name);
}

uint64_t CallState.isEqual(_:)(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  char *v5;
  _QWORD *v6;
  char v8;
  char *v10;
  _BYTE v11[24];
  uint64_t v12;

  swift_getObjectType();
  outlined init with copy of Any?(a1, (uint64_t)v11);
  if (!v12)
  {
    outlined destroy of Any?((uint64_t)v11);
    goto LABEL_9;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    v8 = 0;
    return v8 & 1;
  }
  v5 = &v10[*a2];
  v6 = (_QWORD *)(v2 + *a2);
  if (*(_QWORD *)v5 == *v6 && *((_QWORD *)v5 + 1) == v6[1])
  {

    v8 = 1;
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();

  }
  return v8 & 1;
}

uint64_t @objc CallState.hash.getter()
{
  lazy protocol witness table accessor for type String and conformance String();
  return StringProtocol.hash.getter();
}

uint64_t SharedState.hash.getter()
{
  return CallState.hash.getter();
}

id SharedState.makeProxy()()
{
  return CallState.makeProxy()(type metadata accessor for SharedStateProxy, &OBJC_IVAR____SRSTSharedStateProxy_state);
}

id CallState.makeProxy()(uint64_t (*a1)(void), _QWORD *a2)
{
  void *v2;
  objc_class *v4;
  char *v5;
  id v6;
  objc_super v8;

  v4 = (objc_class *)a1();
  v5 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v5[*a2] = v2;
  v8.receiver = v5;
  v8.super_class = v4;
  v6 = v2;
  return objc_msgSendSuper2(&v8, sel_init);
}

id SharedStateProxy.__allocating_init(_:)(uint64_t a1)
{
  return CallStateProxy.__allocating_init(_:)(a1, &OBJC_IVAR____SRSTSharedStateProxy_state);
}

id CallStateProxy.__allocating_init(_:)(uint64_t a1, _QWORD *a2)
{
  objc_class *v2;
  char *v5;
  objc_super v7;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[*a2] = a1;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id @objc CallState.makeProxy()(void *a1, uint64_t a2, uint64_t (*a3)(void), _QWORD *a4)
{
  objc_class *v6;
  char *v7;
  id v8;
  objc_super v10;

  v6 = (objc_class *)a3();
  v7 = (char *)objc_allocWithZone(v6);
  *(_QWORD *)&v7[*a4] = a1;
  v10.receiver = v7;
  v10.super_class = v6;
  v8 = a1;
  return objc_msgSendSuper2(&v10, sel_init);
}

void SharedState.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t @objc CallState.__ivar_destroyer()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  return swift_release();
}

id SharedStateProxy.state.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____SRSTSharedStateProxy_state);
}

id SharedStateProxy.init(_:)(uint64_t a1)
{
  return CallStateProxy.init(_:)(a1, &OBJC_IVAR____SRSTSharedStateProxy_state);
}

id CallStateProxy.init(_:)(uint64_t a1, _QWORD *a2)
{
  char *v2;
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v2[*a2] = a1;
  v7.receiver = v2;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

id @objc CallStateProxy.init(_:)(char *a1, uint64_t a2, void *a3, _QWORD *a4)
{
  objc_class *ObjectType;
  id v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&a1[*a4] = a3;
  v10.receiver = a1;
  v10.super_class = ObjectType;
  v8 = a3;
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t SharedStateProxy.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return SharedStateProxy.init(from:)(a1);
}

uint64_t SharedStateProxy.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  objc_class *ObjectType;
  _QWORD *v5;
  char *v6;
  id v7;
  uint64_t result;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  objc_super v18;
  _QWORD v19[4];

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v6 = v1;
  v7 = v5;
  dispatch thunk of Decoder.singleValueContainer()();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    swift_deallocPartialClassInstance();
    return (uint64_t)v7;
  }
  __swift_project_boxed_opaque_existential_1(v19, v19[3]);
  v9 = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
  v11 = v10;
  SharedState.allStates.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v12 = swift_bridgeObjectRetain();
  specialized Sequence.first(where:)(v12, v9, (uint64_t)v11, (void (*)(void))type metadata accessor for SharedState, &lazy protocol witness table cache variable for type SharedState and conformance NSObject, &OBJC_IVAR____SRSTSharedState_name);
  v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14)
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)&v6[OBJC_IVAR____SRSTSharedStateProxy_state] = v14;

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
    v18.receiver = v6;
    v18.super_class = ObjectType;
    v7 = objc_msgSendSuper2(&v18, sel_init);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    return (uint64_t)v7;
  }
  _StringGuts.grow(_:)(67);
  v15._object = (void *)0x800000021516E840;
  v15._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v15);
  v16._countAndFlagsBits = v9;
  v16._object = v11;
  String.append(_:)(v16);
  v17._countAndFlagsBits = 0xD000000000000026;
  v17._object = (void *)0x800000021516E860;
  String.append(_:)(v17);
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t static SharedState.named(_:)(uint64_t a1, uint64_t a2)
{
  return static CallState.named(_:)(a1, a2, (void (*)(void))SharedState.allStates.unsafeMutableAddressor, (void (*)(void))type metadata accessor for SharedState, &lazy protocol witness table cache variable for type SharedState and conformance NSObject, &OBJC_IVAR____SRSTSharedState_name);
}

uint64_t static CallState.named(_:)(uint64_t a1, uint64_t a2, void (*a3)(void), void (*a4)(void), unint64_t *a5, _QWORD *a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  a3();
  swift_bridgeObjectRetain();
  v11 = swift_bridgeObjectRetain();
  specialized Sequence.first(where:)(v11, a1, a2, a4, a5, a6);
  v13 = v12;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t SharedStateProxy.encode(to:)(_QWORD *a1)
{
  return CallStateProxy.encode(to:)(a1);
}

void SharedStateProxy.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CallState.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t protocol witness for Decodable.init(from:) in conformance SharedStateProxy@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return protocol witness for Decodable.init(from:) in conformance CallStateProxy(a1, (uint64_t (*)(uint64_t))SharedStateProxy.init(from:), a2);
}

uint64_t protocol witness for Decodable.init(from:) in conformance CallStateProxy@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t)@<X3>, uint64_t *a3@<X8>)
{
  objc_class *v3;
  uint64_t v4;
  id v8;
  uint64_t result;

  v8 = objc_allocWithZone(v3);
  result = a2(a1);
  if (!v4)
    *a3 = result;
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance SharedStateProxy(_QWORD *a1)
{
  return protocol witness for Encodable.encode(to:) in conformance CallStateProxy(a1);
}

id protocol witness for ProxyProtocol.state.getter in conformance SharedStateProxy@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  void *v2;

  v2 = *(void **)(*v1 + OBJC_IVAR____SRSTSharedStateProxy_state);
  *a1 = v2;
  return v2;
}

uint64_t SharedStateProxy.isEqual(_:)(uint64_t a1)
{
  return CallStateProxy.isEqual(_:)(a1, &OBJC_IVAR____SRSTSharedStateProxy_state);
}

uint64_t CallStateProxy.isEqual(_:)(uint64_t a1, _QWORD *a2)
{
  id v4;
  char v5;
  char *v7;
  _BYTE v8[24];
  uint64_t v9;

  swift_getObjectType();
  outlined init with copy of Any?(a1, (uint64_t)v8);
  if (!v9)
  {
    outlined destroy of Any?((uint64_t)v8);
    goto LABEL_5;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    v5 = 0;
    return v5 & 1;
  }
  type metadata accessor for NSObject();
  v4 = *(id *)&v7[*a2];
  v5 = static NSObject.== infix(_:_:)();

  return v5 & 1;
}

uint64_t @objc CallStateProxy.hash.getter()
{
  lazy protocol witness table accessor for type String and conformance String();
  return StringProtocol.hash.getter();
}

uint64_t SharedStateProxy.hash.getter()
{
  return CallStateProxy.hash.getter();
}

uint64_t SharedState.handle(event:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + OBJC_IVAR____SRSTSharedState_eventHandler))();
}

uint64_t protocol witness for StateProtocol.parent.getter in conformance SharedState@<X0>(uint64_t *a1@<X8>)
{
  return protocol witness for StateProtocol.parent.getter in conformance CallState(&OBJC_IVAR____SRSTSharedState_parent, a1);
}

uint64_t protocol witness for StateProtocol.parent.getter in conformance CallState@<X0>(_QWORD *a1@<X2>, uint64_t *a2@<X8>)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t result;

  v4 = *v2 + *a1;
  swift_beginAccess();
  result = MEMORY[0x2199DD49C](v4);
  *a2 = result;
  return result;
}

uint64_t protocol witness for StateProtocol.name.getter in conformance SharedState(uint64_t a1, uint64_t a2)
{
  return protocol witness for StateProtocol.name.getter in conformance CallState(a1, a2, &OBJC_IVAR____SRSTSharedState_name);
}

uint64_t protocol witness for StateProtocol.name.getter in conformance CallState(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;
  uint64_t v4;

  v4 = *(_QWORD *)(*v3 + *a3);
  swift_bridgeObjectRetain();
  return v4;
}

uint64_t protocol witness for StateProtocol.handle(event:) in conformance SharedState@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return protocol witness for StateProtocol.handle(event:) in conformance CallState(a1, &OBJC_IVAR____SRSTSharedState_eventHandler, a2);
}

uint64_t protocol witness for StateProtocol.handle(event:) in conformance CallState@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, uint64_t *a3@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD))(*v3 + *a2))(*a1);
  *a3 = result;
  return result;
}

id protocol witness for StateProtocol.makeProxy() in conformance SharedState@<X0>(_QWORD *a1@<X8>)
{
  return protocol witness for StateProtocol.makeProxy() in conformance CallState(type metadata accessor for SharedStateProxy, &OBJC_IVAR____SRSTSharedStateProxy_state, a1);
}

id protocol witness for StateProtocol.makeProxy() in conformance CallState@<X0>(uint64_t (*a1)(void)@<X2>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  void **v3;
  void *v6;
  objc_class *v7;
  char *v8;
  id v9;
  id result;
  objc_super v11;

  v6 = *v3;
  v7 = (objc_class *)a1();
  v8 = (char *)objc_allocWithZone(v7);
  *(_QWORD *)&v8[*a2] = v6;
  v11.receiver = v8;
  v11.super_class = v7;
  v9 = v6;
  result = objc_msgSendSuper2(&v11, sel_init);
  *a3 = result;
  return result;
}

uint64_t protocol witness for static StateProtocol.named(_:) in conformance SharedState@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return protocol witness for static StateProtocol.named(_:) in conformance CallState(a1, a2, (void (*)(void))SharedState.allStates.unsafeMutableAddressor, (void (*)(void))type metadata accessor for SharedState, &lazy protocol witness table cache variable for type SharedState and conformance NSObject, &OBJC_IVAR____SRSTSharedState_name, a3);
}

uint64_t protocol witness for static StateProtocol.named(_:) in conformance CallState@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(void)@<X4>, void (*a4)(void)@<X5>, unint64_t *a5@<X6>, _QWORD *a6@<X7>, _QWORD *a7@<X8>)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;

  a3();
  swift_bridgeObjectRetain();
  v13 = swift_bridgeObjectRetain();
  specialized Sequence.first(where:)(v13, a1, a2, a4, a5, a6);
  v15 = v14;
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a7 = v15;
  return result;
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

unint64_t type metadata accessor for NSObject()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSObject;
  if (!lazy cache variable for type metadata for NSObject)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSObject);
  }
  return result;
}

uint64_t type metadata accessor for StateProxy()
{
  return objc_opt_self();
}

void specialized Sequence.first(where:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), unint64_t *a5, _QWORD *a6)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  int64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  BOOL v26;
  int64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;

  v8 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    a4();
    lazy protocol witness table accessor for type CallState and conformance CallState(a5, (uint64_t (*)(void))a4, MEMORY[0x24BEE5BD8]);
    Set.Iterator.init(_cocoa:)();
    v8 = v31;
    v29 = v32;
    v11 = v33;
    v12 = v34;
    v13 = v35;
  }
  else
  {
    v14 = -1 << *(_BYTE *)(a1 + 32);
    v29 = a1 + 56;
    v15 = ~v14;
    v16 = -v14;
    if (v16 < 64)
      v17 = ~(-1 << v16);
    else
      v17 = -1;
    v13 = v17 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v11 = v15;
    v12 = 0;
  }
  v28 = (unint64_t)(v11 + 64) >> 6;
  if (v8 < 0)
    goto LABEL_10;
LABEL_8:
  if (v13)
  {
    v18 = (v13 - 1) & v13;
    v19 = __clz(__rbit64(v13)) | (v12 << 6);
    v20 = v12;
    goto LABEL_29;
  }
  v22 = v12 + 1;
  if (!__OFADD__(v12, 1))
  {
    if (v22 < v28)
    {
      v23 = *(_QWORD *)(v29 + 8 * v22);
      v20 = v12 + 1;
      if (v23)
        goto LABEL_28;
      v20 = v12 + 2;
      if (v12 + 2 >= v28)
        goto LABEL_37;
      v23 = *(_QWORD *)(v29 + 8 * v20);
      if (v23)
        goto LABEL_28;
      v20 = v12 + 3;
      if (v12 + 3 >= v28)
        goto LABEL_37;
      v23 = *(_QWORD *)(v29 + 8 * v20);
      if (v23)
        goto LABEL_28;
      v20 = v12 + 4;
      if (v12 + 4 >= v28)
        goto LABEL_37;
      v23 = *(_QWORD *)(v29 + 8 * v20);
      if (v23)
      {
LABEL_28:
        v18 = (v23 - 1) & v23;
        v19 = __clz(__rbit64(v23)) + (v20 << 6);
LABEL_29:
        v21 = (char *)*(id *)(*(_QWORD *)(v8 + 48) + 8 * v19);
        if (v21)
        {
          do
          {
            v25 = &v21[*a6];
            v26 = *(_QWORD *)v25 == a2 && *((_QWORD *)v25 + 1) == a3;
            if (v26 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
              break;

            v12 = v20;
            v13 = v18;
            if ((v8 & 0x8000000000000000) == 0)
              goto LABEL_8;
LABEL_10:
            if (!__CocoaSet.Iterator.next()())
              break;
            a4();
            swift_unknownObjectRetain();
            swift_dynamicCast();
            v21 = v36;
            swift_unknownObjectRelease();
            v20 = v12;
            v18 = v13;
          }
          while (v36);
        }
        goto LABEL_37;
      }
      v20 = v12 + 5;
      if (v12 + 5 < v28)
      {
        v23 = *(_QWORD *)(v29 + 8 * v20);
        if (!v23)
        {
          v24 = v12 + 6;
          while (v28 != v24)
          {
            v23 = *(_QWORD *)(v29 + 8 * v24++);
            if (v23)
            {
              v20 = v24 - 1;
              goto LABEL_28;
            }
          }
          goto LABEL_37;
        }
        goto LABEL_28;
      }
    }
LABEL_37:
    outlined consume of Set<SharedState>.Iterator._Variant();
    return;
  }
  __break(1u);
}

uint64_t type metadata accessor for SharedStateProxy()
{
  return objc_opt_self();
}

uint64_t associated type witness table accessor for ProxyProtocol.StateType : StateProtocol in CallStateProxy()
{
  return lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type CallState and conformance CallState, type metadata accessor for CallState, (uint64_t)&protocol conformance descriptor for CallState);
}

uint64_t type metadata accessor for CallState()
{
  return objc_opt_self();
}

uint64_t instantiation function for generic protocol witness table for CallStateProxy(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type CallStateProxy and conformance CallStateProxy, type metadata accessor for CallStateProxy, (uint64_t)&protocol conformance descriptor for CallStateProxy);
  result = lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type CallStateProxy and conformance CallStateProxy, type metadata accessor for CallStateProxy, (uint64_t)&protocol conformance descriptor for CallStateProxy);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t associated type witness table accessor for StateProtocol.ProxyType : ProxyProtocol in CallState()
{
  return lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type CallStateProxy and conformance CallStateProxy, type metadata accessor for CallStateProxy, (uint64_t)&protocol conformance descriptor for CallStateProxy);
}

uint64_t instantiation function for generic protocol witness table for CallState(uint64_t a1)
{
  uint64_t result;

  result = lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type CallState and conformance NSObject, type metadata accessor for CallState, MEMORY[0x24BEE5BD8]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t associated type witness table accessor for ProxyProtocol.StateType : StateProtocol in StateProxy()
{
  return lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type State and conformance State, type metadata accessor for State, (uint64_t)&protocol conformance descriptor for State);
}

uint64_t type metadata accessor for State()
{
  return objc_opt_self();
}

uint64_t instantiation function for generic protocol witness table for StateProxy(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type StateProxy and conformance StateProxy, type metadata accessor for StateProxy, (uint64_t)&protocol conformance descriptor for StateProxy);
  result = lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type StateProxy and conformance StateProxy, type metadata accessor for StateProxy, (uint64_t)&protocol conformance descriptor for StateProxy);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t associated type witness table accessor for StateProtocol.ProxyType : ProxyProtocol in State()
{
  return lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type StateProxy and conformance StateProxy, type metadata accessor for StateProxy, (uint64_t)&protocol conformance descriptor for StateProxy);
}

uint64_t instantiation function for generic protocol witness table for State(uint64_t a1)
{
  uint64_t result;

  result = lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type State and conformance NSObject, type metadata accessor for State, MEMORY[0x24BEE5BD8]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t associated type witness table accessor for ProxyProtocol.StateType : StateProtocol in SharedStateProxy()
{
  return lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type SharedState and conformance SharedState, type metadata accessor for SharedState, (uint64_t)&protocol conformance descriptor for SharedState);
}

uint64_t type metadata accessor for SharedState()
{
  return objc_opt_self();
}

uint64_t instantiation function for generic protocol witness table for SharedStateProxy(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type SharedStateProxy and conformance SharedStateProxy, type metadata accessor for SharedStateProxy, (uint64_t)&protocol conformance descriptor for SharedStateProxy);
  result = lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type SharedStateProxy and conformance SharedStateProxy, type metadata accessor for SharedStateProxy, (uint64_t)&protocol conformance descriptor for SharedStateProxy);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t associated type witness table accessor for StateProtocol.ProxyType : ProxyProtocol in SharedState()
{
  return lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type SharedStateProxy and conformance SharedStateProxy, type metadata accessor for SharedStateProxy, (uint64_t)&protocol conformance descriptor for SharedStateProxy);
}

uint64_t instantiation function for generic protocol witness table for SharedState(uint64_t a1)
{
  uint64_t result;

  result = lazy protocol witness table accessor for type CallState and conformance CallState(&lazy protocol witness table cache variable for type SharedState and conformance NSObject, type metadata accessor for SharedState, MEMORY[0x24BEE5BD8]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t lazy protocol witness table accessor for type CallState and conformance CallState(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2();
    result = MEMORY[0x2199DD3C4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t method lookup function for CallState()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for CallStateProxy()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for State()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for StateProxy()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StateProxy.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of StateProxy.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t method lookup function for SharedState()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SharedState.__allocating_init(name:parent:eventHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t method lookup function for SharedStateProxy()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CallStateProxy.__allocating_init(from:)()
{
  return dispatch thunk of StateProxy.__allocating_init(from:)();
}

uint64_t dispatch thunk of SharedStateProxy.__allocating_init(from:)()
{
  return dispatch thunk of StateProxy.__allocating_init(from:)();
}

id one-time initialization function for preparingToServe()
{
  void *v0;
  id v1;
  id result;

  type metadata accessor for SharedState();
  v0 = (void *)*SharedState.mirroring.unsafeMutableAddressor();
  v1 = v0;
  result = SharedState.__allocating_init(name:parent:eventHandler:)(0xD000000000000010, 0x800000021516EAB0, v0, (uint64_t)implicit closure #1 in variable initialization expression of static SharedState.preparingToServe, 0);
  static SharedState.preparingToServe = (uint64_t)result;
  return result;
}

uint64_t implicit closure #1 in variable initialization expression of static SharedState.preparingToServe(uint64_t a1)
{
  void *v1;
  id v2;

  if (a1 == 3)
    return 1;
  if (a1 != 4 && a1 != 6)
    return 0;
  v1 = (void *)*SharedState.passive.unsafeMutableAddressor();
  v2 = v1;
  return (uint64_t)v1;
}

uint64_t *SharedState.preparingToServe.unsafeMutableAddressor()
{
  if (one-time initialization token for preparingToServe != -1)
    swift_once();
  return &static SharedState.preparingToServe;
}

id static SharedState.preparingToServe.getter()
{
  if (one-time initialization token for preparingToServe != -1)
    swift_once();
  return (id)static SharedState.preparingToServe;
}

id one-time initialization function for unshared()
{
  void *v0;
  id v1;
  id result;

  type metadata accessor for SharedState();
  v0 = (void *)*SharedState.abstract.unsafeMutableAddressor();
  v1 = v0;
  result = SharedState.__allocating_init(name:parent:eventHandler:)(0x6465726168736E55, 0xE800000000000000, v0, (uint64_t)implicit closure #1 in variable initialization expression of static SharedState.unshared, 0);
  static SharedState.unshared = (uint64_t)result;
  return result;
}

void *implicit closure #1 in variable initialization expression of static SharedState.unshared(uint64_t a1)
{
  void *v1;
  id v2;

  if (a1)
    return 0;
  v1 = (void *)*SharedState.passive.unsafeMutableAddressor();
  v2 = v1;
  return v1;
}

uint64_t *SharedState.unshared.unsafeMutableAddressor()
{
  if (one-time initialization token for unshared != -1)
    swift_once();
  return &static SharedState.unshared;
}

id static SharedState.unshared.getter()
{
  if (one-time initialization token for unshared != -1)
    swift_once();
  return (id)static SharedState.unshared;
}

id one-time initialization function for listening()
{
  void *v0;
  id v1;
  id result;

  type metadata accessor for State();
  v0 = (void *)*State.abstract.unsafeMutableAddressor();
  v1 = v0;
  result = State.__allocating_init(name:parent:eventHandler:)(0x6E696E657473694CLL, 0xE900000000000067, v0, (uint64_t)variable initialization expression of SharedClient.delegate, 0);
  static State.listening = (uint64_t)result;
  return result;
}

uint64_t static State.handleForListeningState(event:)()
{
  return 0;
}

uint64_t *State.listening.unsafeMutableAddressor()
{
  if (one-time initialization token for listening != -1)
    swift_once();
  return &static State.listening;
}

id static State.listening.getter()
{
  if (one-time initialization token for listening != -1)
    swift_once();
  return (id)static State.listening;
}

uint64_t dispatch thunk of ClientProtocol.delegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ClientProtocol.delegate.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of ClientProtocol.delegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of ClientProtocol.currentState.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of ClientProtocol.currentState.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of ClientProtocol.currentState.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of ClientProtocol.mostRecentEvent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of ClientProtocol.mostRecentEvent.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of ClientProtocol.mostRecentEvent.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of ClientProtocol.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of ClientProtocol.dispatchEvent(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t CallServer.currentState.getter()
{
  return CallServer.currentState.getter(&OBJC_IVAR____SRSTCallServer_stateMachine);
}

id CallServer.__deallocating_deinit()
{
  return CallServer.__deallocating_deinit("Deinit called for CallServer", (uint64_t)&unk_24D2AC2B0, (void (*)(void))partial apply for closure #1 in SharedClient.deinit, (uint64_t (*)(_QWORD))type metadata accessor for CallServer);
}

uint64_t sub_21515D5B8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t type metadata accessor for CallServer()
{
  return objc_opt_self();
}

id CallServer.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

char *CallServer.__allocating_init(instrumentationManager:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return CallServer.init(instrumentationManager:)(a1);
}

char *CallServer.init(instrumentationManager:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  uint64_t v9;
  uint64_t *v10;
  CFNotificationCenterRef_optional *v11;
  uint64_t v12;
  __CFNotificationCenter *v13;
  Swift::String *v14;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v17;
  void *v18;
  void *v19;
  Swift::String v20;
  __CFString *v21;
  void (*v22)(uint64_t);
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  void *v35;
  objc_super v36;

  v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CallState>.Publisher);
  v30 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32, v3);
  v29 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v1[OBJC_IVAR____SRSTCallServer_stateMachineObserver] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StateMachine<CallState>);
  v5 = v1;
  v6 = swift_retain();
  v31 = a1;
  *(_QWORD *)&v5[OBJC_IVAR____SRSTCallServer_stateMachine] = StateMachine<>.init(instrumentationManager:)(v6);

  v7 = (objc_class *)type metadata accessor for CallServer();
  v36.receiver = v5;
  v36.super_class = v7;
  v8 = (char *)objc_msgSendSuper2(&v36, sel_init);
  v33 = static CallEvent.allCases.getter();
  v9 = v33[2];
  if (v9)
  {
    v10 = v33 + 4;
    v11 = darwinNotificationCenter.unsafeMutableAddressor();
    do
    {
      v12 = *v10++;
      v13 = v11->value;
      v14 = eventDispatchNotificationNamePrefix.unsafeMutableAddressor();
      countAndFlagsBits = v14->_countAndFlagsBits;
      object = v14->_object;
      swift_bridgeObjectRetain();
      v17 = CallEvent.name.getter(v12);
      v19 = v18;
      v34 = countAndFlagsBits;
      v35 = object;
      swift_bridgeObjectRetain();
      v20._countAndFlagsBits = v17;
      v20._object = v19;
      String.append(_:)(v20);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v21 = (__CFString *)MEMORY[0x2199DCD04](v34, v35);
      swift_bridgeObjectRelease();
      CFNotificationCenterAddObserver(v13, v8, (CFNotificationCallback)@objc closure #1 in CallServer.init(instrumentationManager:), v21, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      --v9;
    }
    while (v9);
  }
  swift_bridgeObjectRelease();
  v22 = *(void (**)(uint64_t))(**(_QWORD **)&v8[OBJC_IVAR____SRSTCallServer_stateMachine] + 160);
  v23 = swift_retain();
  v24 = v29;
  v22(v23);
  swift_release();
  lazy protocol witness table accessor for type Published<CallState>.Publisher and conformance Published<A>.Publisher(&lazy protocol witness table cache variable for type Published<CallState>.Publisher and conformance Published<A>.Publisher, &demangling cache variable for type metadata for Published<CallState>.Publisher);
  v25 = v32;
  v26 = Publisher<>.sink(receiveValue:)();
  swift_release();

  (*(void (**)(char *, uint64_t))(v30 + 8))(v24, v25);
  *(_QWORD *)&v8[OBJC_IVAR____SRSTCallServer_stateMachineObserver] = v26;
  swift_release();
  return v8;
}

void @objc closure #1 in CallServer.init(instrumentationManager:)(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;

  v8 = a1;
  v9 = a3;
  v10 = a5;
  specialized closure #1 in CallServer.init(instrumentationManager:)(a2, (uint64_t)a3, "CallServer received valid event dispatch: %s", "CallServer posting darwin notification for event reception", &OBJC_IVAR____SRSTCallServer_stateMachine, (uint64_t (*)(uint64_t, void *))CallEvent.init(name:));

}

void closure #2 in CallServer.init(instrumentationManager:)(void **a1)
{
  closure #2 in CallServer.init(instrumentationManager:)(a1, &OBJC_IVAR____SRSTCallState_name, "CallServer posting darwin notification for state transition state=%s");
}

uint64_t Server.currentState.getter()
{
  return CallServer.currentState.getter(&OBJC_IVAR____SRSTServer_stateMachine);
}

id Server.__deallocating_deinit()
{
  return CallServer.__deallocating_deinit("Deinit called for Server", (uint64_t)&unk_24D2AC2D8, (void (*)(void))partial apply for closure #1 in SharedClient.deinit, (uint64_t (*)(_QWORD))type metadata accessor for Server);
}

id CallServer.__deallocating_deinit(const char *a1, uint64_t a2, void (*a3)(void), uint64_t (*a4)(_QWORD))
{
  void *v4;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  void (*v17)(void);
  uint64_t (*v18)(_QWORD);
  uint8_t *v19;
  uint8_t *v20;
  id v21;
  uint64_t v22;
  objc_class *v23;
  objc_super v25;

  v8 = v4;
  v9 = type metadata accessor for Logger();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = Logger.framework.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v14, v9);
  v15 = Logger.logObject.getter();
  v16 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = a3;
    v18 = a4;
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_215151000, v15, v16, a1, v19, 2u);
    v20 = v19;
    a4 = v18;
    a3 = v17;
    MEMORY[0x2199DD454](v20, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  type metadata accessor for OS_dispatch_queue();
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  v21 = v8;
  static OS_dispatch_queue.executeOnMain<A>(_:)(a3);
  v22 = swift_release();
  v23 = (objc_class *)a4(v22);
  v25.receiver = v21;
  v25.super_class = v23;
  return objc_msgSendSuper2(&v25, sel_dealloc);
}

char *Server.__allocating_init(instrumentationManager:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return Server.init(instrumentationManager:)(a1);
}

char *Server.init(instrumentationManager:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  uint64_t v9;
  uint64_t *v10;
  CFNotificationCenterRef_optional *v11;
  uint64_t v12;
  __CFNotificationCenter *v13;
  Swift::String *v14;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v17;
  void *v18;
  void *v19;
  Swift::String v20;
  __CFString *v21;
  void (*v22)(uint64_t);
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  void *v35;
  objc_super v36;

  v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<State>.Publisher);
  v30 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32, v3);
  v29 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v1[OBJC_IVAR____SRSTServer_stateMachineObserver] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StateMachine<State>);
  v5 = v1;
  v6 = swift_retain();
  v31 = a1;
  *(_QWORD *)&v5[OBJC_IVAR____SRSTServer_stateMachine] = StateMachine<>.init(instrumentationManager:)(v6);

  v7 = (objc_class *)type metadata accessor for Server();
  v36.receiver = v5;
  v36.super_class = v7;
  v8 = (char *)objc_msgSendSuper2(&v36, sel_init);
  v33 = static Event.allCases.getter();
  v9 = v33[2];
  if (v9)
  {
    v10 = v33 + 4;
    v11 = darwinNotificationCenter.unsafeMutableAddressor();
    do
    {
      v12 = *v10++;
      v13 = v11->value;
      v14 = eventDispatchNotificationNamePrefix.unsafeMutableAddressor();
      countAndFlagsBits = v14->_countAndFlagsBits;
      object = v14->_object;
      swift_bridgeObjectRetain();
      v17 = Event.name.getter(v12);
      v19 = v18;
      v34 = countAndFlagsBits;
      v35 = object;
      swift_bridgeObjectRetain();
      v20._countAndFlagsBits = v17;
      v20._object = v19;
      String.append(_:)(v20);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v21 = (__CFString *)MEMORY[0x2199DCD04](v34, v35);
      swift_bridgeObjectRelease();
      CFNotificationCenterAddObserver(v13, v8, (CFNotificationCallback)@objc closure #1 in Server.init(instrumentationManager:), v21, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      --v9;
    }
    while (v9);
  }
  swift_bridgeObjectRelease();
  v22 = *(void (**)(uint64_t))(**(_QWORD **)&v8[OBJC_IVAR____SRSTServer_stateMachine] + 160);
  v23 = swift_retain();
  v24 = v29;
  v22(v23);
  swift_release();
  lazy protocol witness table accessor for type Published<CallState>.Publisher and conformance Published<A>.Publisher(&lazy protocol witness table cache variable for type Published<State>.Publisher and conformance Published<A>.Publisher, &demangling cache variable for type metadata for Published<State>.Publisher);
  v25 = v32;
  v26 = Publisher<>.sink(receiveValue:)();
  swift_release();

  (*(void (**)(char *, uint64_t))(v30 + 8))(v24, v25);
  *(_QWORD *)&v8[OBJC_IVAR____SRSTServer_stateMachineObserver] = v26;
  swift_release();
  return v8;
}

void @objc closure #1 in Server.init(instrumentationManager:)(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;

  v8 = a1;
  v9 = a3;
  v10 = a5;
  specialized closure #1 in CallServer.init(instrumentationManager:)(a2, (uint64_t)a3, "Server received valid event dispatch: %s", "Server posting darwin notification for event reception", &OBJC_IVAR____SRSTServer_stateMachine, (uint64_t (*)(uint64_t, void *))Event.init(name:));

}

void closure #2 in Server.init(instrumentationManager:)(void **a1)
{
  closure #2 in CallServer.init(instrumentationManager:)(a1, &OBJC_IVAR____SRSTState_name, "Server posting darwin notification for state transition state=%s");
}

id @objc CallServer.currentState.getter(char *a1, uint64_t a2, _QWORD *a3)
{
  void (*v3)(id *__return_ptr);
  char *v4;
  id v6;

  v3 = *(void (**)(id *__return_ptr))(**(_QWORD **)&a1[*a3] + 136);
  v4 = a1;
  v3(&v6);

  return v6;
}

uint64_t SharedServer.currentState.getter()
{
  return CallServer.currentState.getter(&OBJC_IVAR____SRSTSharedServer_stateMachine);
}

uint64_t CallServer.currentState.getter(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;

  (*(void (**)(uint64_t *__return_ptr))(**(_QWORD **)(v1 + *a1) + 136))(&v3);
  return v3;
}

id SharedServer.__deallocating_deinit()
{
  return CallServer.__deallocating_deinit("Deinit called for SharedServer", (uint64_t)&unk_24D2AC300, (void (*)(void))partial apply for closure #1 in SharedClient.deinit, (uint64_t (*)(_QWORD))type metadata accessor for SharedServer);
}

uint64_t @objc CallServer.__ivar_destroyer()
{
  swift_release();
  return swift_release();
}

uint64_t CallServer.init()()
{
  uint64_t ObjectType;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  ObjectType = swift_getObjectType();
  InstrumentationManager.sharedLogger.unsafeMutableAddressor();
  v1 = *(uint64_t (**)(uint64_t))(ObjectType + 128);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_deallocPartialClassInstance();
  return v3;
}

uint64_t @objc CallServer.init()()
{
  uint64_t ObjectType;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  ObjectType = swift_getObjectType();
  InstrumentationManager.sharedLogger.unsafeMutableAddressor();
  v1 = *(uint64_t (**)(uint64_t))(ObjectType + 128);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_deallocPartialClassInstance();
  return v3;
}

char *SharedServer.__allocating_init(instrumentationManager:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return SharedServer.init(instrumentationManager:)(a1);
}

char *SharedServer.init(instrumentationManager:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  uint64_t v9;
  uint64_t *v10;
  CFNotificationCenterRef_optional *v11;
  uint64_t v12;
  __CFNotificationCenter *v13;
  Swift::String *v14;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v17;
  void *v18;
  void *v19;
  Swift::String v20;
  __CFString *v21;
  void (*v22)(uint64_t);
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  void *v35;
  objc_super v36;

  v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<SharedState>.Publisher);
  v30 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32, v3);
  v29 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v1[OBJC_IVAR____SRSTSharedServer_stateMachineObserver] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StateMachine<SharedState>);
  v5 = v1;
  v6 = swift_retain();
  v31 = a1;
  *(_QWORD *)&v5[OBJC_IVAR____SRSTSharedServer_stateMachine] = StateMachine<>.init(instrumentationManager:)(v6);

  v7 = (objc_class *)type metadata accessor for SharedServer();
  v36.receiver = v5;
  v36.super_class = v7;
  v8 = (char *)objc_msgSendSuper2(&v36, sel_init);
  v33 = static SharedEvent.allCases.getter();
  v9 = v33[2];
  if (v9)
  {
    v10 = v33 + 4;
    v11 = darwinNotificationCenter.unsafeMutableAddressor();
    do
    {
      v12 = *v10++;
      v13 = v11->value;
      v14 = eventDispatchNotificationNamePrefix.unsafeMutableAddressor();
      countAndFlagsBits = v14->_countAndFlagsBits;
      object = v14->_object;
      swift_bridgeObjectRetain();
      v17 = SharedEvent.name.getter(v12);
      v19 = v18;
      v34 = countAndFlagsBits;
      v35 = object;
      swift_bridgeObjectRetain();
      v20._countAndFlagsBits = v17;
      v20._object = v19;
      String.append(_:)(v20);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v21 = (__CFString *)MEMORY[0x2199DCD04](v34, v35);
      swift_bridgeObjectRelease();
      CFNotificationCenterAddObserver(v13, v8, (CFNotificationCallback)@objc closure #1 in SharedServer.init(instrumentationManager:), v21, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      --v9;
    }
    while (v9);
  }
  swift_bridgeObjectRelease();
  v22 = *(void (**)(uint64_t))(**(_QWORD **)&v8[OBJC_IVAR____SRSTSharedServer_stateMachine] + 160);
  v23 = swift_retain();
  v24 = v29;
  v22(v23);
  swift_release();
  lazy protocol witness table accessor for type Published<CallState>.Publisher and conformance Published<A>.Publisher(&lazy protocol witness table cache variable for type Published<SharedState>.Publisher and conformance Published<A>.Publisher, &demangling cache variable for type metadata for Published<SharedState>.Publisher);
  v25 = v32;
  v26 = Publisher<>.sink(receiveValue:)();
  swift_release();

  (*(void (**)(char *, uint64_t))(v30 + 8))(v24, v25);
  *(_QWORD *)&v8[OBJC_IVAR____SRSTSharedServer_stateMachineObserver] = v26;
  swift_release();
  return v8;
}

void @objc closure #1 in SharedServer.init(instrumentationManager:)(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;

  v8 = a1;
  v9 = a3;
  v10 = a5;
  specialized closure #1 in CallServer.init(instrumentationManager:)(a2, (uint64_t)a3, "SharedServer received valid event dispatch: %s", "SharedServer posting darwin notification for event reception", &OBJC_IVAR____SRSTSharedServer_stateMachine, (uint64_t (*)(uint64_t, void *))SharedEvent.init(name:));

}

void closure #2 in SharedServer.init(instrumentationManager:)(void **a1)
{
  closure #2 in CallServer.init(instrumentationManager:)(a1, &OBJC_IVAR____SRSTSharedState_name, "SharedServer posting darwin notification for state transition state=%s");
}

void closure #2 in CallServer.init(instrumentationManager:)(void **a1, _QWORD *a2, const char *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint8_t *v24;
  __CFNotificationCenter *v25;
  Swift::String *v26;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t *v29;
  uint64_t v30;
  void *v31;
  Swift::String v32;
  __CFString *v33;
  _QWORD v34[2];
  const char *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;

  v6 = type metadata accessor for Logger();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *a1;
  v12 = Logger.framework.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v12, v6);
  v13 = v11;
  v14 = Logger.logObject.getter();
  v15 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v37 = a2;
    v17 = (uint8_t *)v16;
    v18 = swift_slowAlloc();
    v35 = a3;
    v19 = v18;
    *(_DWORD *)v17 = 136315138;
    v39 = v18;
    v34[1] = v17 + 4;
    v20 = (uint64_t *)&v13[*v37];
    v36 = v6;
    v21 = v13;
    v22 = *v20;
    v23 = v20[1];
    swift_bridgeObjectRetain();
    v38 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v23, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    v13 = v21;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_215151000, v14, v15, v35, v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199DD454](v19, -1, -1);
    v24 = v17;
    a2 = v37;
    MEMORY[0x2199DD454](v24, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v36);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  v25 = darwinNotificationCenter.unsafeMutableAddressor()->value;
  v26 = stateTransitionNotificationNamePrefix.unsafeMutableAddressor();
  countAndFlagsBits = v26->_countAndFlagsBits;
  object = v26->_object;
  v29 = (uint64_t *)&v13[*a2];
  v30 = *v29;
  v31 = (void *)v29[1];
  v39 = countAndFlagsBits;
  v40 = object;
  swift_bridgeObjectRetain();
  v32._countAndFlagsBits = v30;
  v32._object = v31;
  String.append(_:)(v32);
  v33 = (__CFString *)MEMORY[0x2199DCD04](v39, v40);
  swift_bridgeObjectRelease();
  CFNotificationCenterPostNotification(v25, v33, 0, 0, 1u);

}

uint64_t type metadata accessor for Server()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for SharedServer()
{
  return objc_opt_self();
}

uint64_t lazy protocol witness table accessor for type Published<CallState>.Publisher and conformance Published<A>.Publisher(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199DD3C4](MEMORY[0x24BDB9EE8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t method lookup function for CallServer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CallServer.currentState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of CallServer.__allocating_init(instrumentationManager:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t method lookup function for Server()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for SharedServer()
{
  return swift_lookUpClassMethod();
}

void specialized closure #1 in CallServer.init(instrumentationManager:)(void *a1, uint64_t a2, const char *a3, const char *a4, _QWORD *a5, uint64_t (*a6)(uint64_t, void *))
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void *v25;
  Swift::String *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  NSObject *v33;
  os_log_type_t v34;
  _BOOL4 v35;
  uint64_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint8_t *v39;
  Swift::String *v40;
  unint64_t object;
  uint64_t countAndFlagsBits;
  unint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t);
  char *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  __CFNotificationCenter *v54;
  Swift::String *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  Swift::String v59;
  __CFString *v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t, uint64_t);
  uint64_t v66;
  uint64_t (*v67)(uint64_t, void *);
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  const char *v72;
  id v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;

  v72 = a3;
  v11 = type metadata accessor for Logger();
  v12 = *(_QWORD *)(v11 - 8);
  v14 = MEMORY[0x24BDAC7A8](v11, v13);
  v16 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v14, v17);
  v20 = (char *)&v64 - v19;
  MEMORY[0x24BDAC7A8](v18, v21);
  v23 = (char *)&v64 - v22;
  if (!a2)
  {
    v40 = unknownNotificationName.unsafeMutableAddressor();
    countAndFlagsBits = v40->_countAndFlagsBits;
    object = (unint64_t)v40->_object;
    swift_bridgeObjectRetain();
    goto LABEL_7;
  }
  v68 = a4;
  v71 = a5;
  v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v73 = a1;
  v78 = v24;
  v79 = v25;
  v26 = eventDispatchNotificationNamePrefix.unsafeMutableAddressor();
  v27 = v26->_object;
  v76 = v26->_countAndFlagsBits;
  v77 = v27;
  v74 = 0;
  v75 = 0xE000000000000000;
  lazy protocol witness table accessor for type String and conformance String();
  v28 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  v30 = v29;
  swift_bridgeObjectRelease();
  if (!v73)
  {
    swift_bridgeObjectRelease();
    countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
    object = v43;
LABEL_7:
    v44 = Logger.framework.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v16, v44, v11);
    swift_bridgeObjectRetain();
    v45 = Logger.logObject.getter();
    v46 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v45, v46))
    {
      v70 = v11;
      v47 = (uint8_t *)swift_slowAlloc();
      v48 = swift_slowAlloc();
      v78 = v48;
      *(_DWORD *)v47 = 136315138;
      swift_bridgeObjectRetain();
      v76 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(countAndFlagsBits, object, &v78);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_215151000, v45, v46, "Event dispatch darwin notification was malformed: %s", v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199DD454](v48, -1, -1);
      MEMORY[0x2199DD454](v47, -1, -1);

      (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v70);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v11);
    }
    return;
  }
  v69 = v28;
  v31 = Logger.framework.unsafeMutableAddressor();
  v32 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v32(v23, v31, v11);
  swift_bridgeObjectRetain_n();
  v33 = Logger.logObject.getter();
  v34 = static os_log_type_t.info.getter();
  v35 = os_log_type_enabled(v33, v34);
  v67 = a6;
  if (v35)
  {
    v70 = v11;
    v36 = swift_slowAlloc();
    v65 = v32;
    v37 = (uint8_t *)v36;
    v38 = swift_slowAlloc();
    v78 = v38;
    v66 = v31;
    *(_DWORD *)v37 = 136315138;
    swift_bridgeObjectRetain();
    v76 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v69, (unint64_t)v30, &v78);
    v11 = v70;
    v31 = v66;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_215151000, v33, v34, v72, v37, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199DD454](v38, -1, -1);
    v39 = v37;
    v32 = v65;
    MEMORY[0x2199DD454](v39, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v49 = *(void (**)(char *, uint64_t))(v12 + 8);
  v49(v23, v11);
  v50 = (char *)v73;
  v32(v20, v31, v11);
  v51 = Logger.logObject.getter();
  v52 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v51, v52))
  {
    v53 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v53 = 0;
    _os_log_impl(&dword_215151000, v51, v52, v68, v53, 2u);
    MEMORY[0x2199DD454](v53, -1, -1);
  }

  v49(v20, v11);
  v54 = darwinNotificationCenter.unsafeMutableAddressor()->value;
  v55 = eventReceivedNotificationNamePrefix.unsafeMutableAddressor();
  v57 = v55->_countAndFlagsBits;
  v56 = v55->_object;
  v78 = v57;
  v79 = v56;
  swift_bridgeObjectRetain();
  v58 = v69;
  v59._countAndFlagsBits = v69;
  v59._object = v30;
  String.append(_:)(v59);
  v60 = (__CFString *)MEMORY[0x2199DCD04](v78, v79);
  swift_bridgeObjectRelease();
  CFNotificationCenterPostNotification(v54, v60, 0, 0, 1u);

  v61 = *(_QWORD *)&v50[*v71];
  v62 = v67(v58, v30);
  if ((v63 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v78 = v62;
    (*(void (**)(uint64_t *))(*(_QWORD *)v61 + 216))(&v78);

  }
}

id one-time initialization function for disabled()
{
  void *v0;
  id v1;
  id result;

  type metadata accessor for State();
  v0 = (void *)*State.abstract.unsafeMutableAddressor();
  v1 = v0;
  result = State.__allocating_init(name:parent:eventHandler:)(0x64656C6261736944, 0xE800000000000000, v0, (uint64_t)implicit closure #1 in variable initialization expression of static State.disabled, 0);
  static State.disabled = (uint64_t)result;
  return result;
}

void *implicit closure #1 in variable initialization expression of static State.disabled(uint64_t a1)
{
  void *v1;
  id v2;

  if (a1 != 3)
    return 0;
  v1 = *(void **)State.available.unsafeMutableAddressor();
  v2 = v1;
  return v1;
}

uint64_t *State.disabled.unsafeMutableAddressor()
{
  if (one-time initialization token for disabled != -1)
    swift_once();
  return &static State.disabled;
}

id static State.disabled.getter()
{
  if (one-time initialization token for disabled != -1)
    swift_once();
  return (id)static State.disabled;
}

id one-time initialization function for analyzing()
{
  void *v0;
  id v1;
  id result;

  type metadata accessor for State();
  v0 = (void *)*State.listening.unsafeMutableAddressor();
  v1 = v0;
  result = State.__allocating_init(name:parent:eventHandler:)(0x6E697A796C616E41, 0xE900000000000067, v0, (uint64_t)implicit closure #1 in variable initialization expression of static State.analyzing, 0);
  static State.analyzing = (uint64_t)result;
  return result;
}

id implicit closure #1 in variable initialization expression of static State.analyzing(uint64_t a1)
{
  id v1;
  id *v2;
  id v3;

  v1 = 0;
  switch(a1)
  {
    case 5:
      v2 = (id *)State.understanding.unsafeMutableAddressor();
      goto LABEL_5;
    case 7:
      v2 = (id *)State.postResponse.unsafeMutableAddressor();
      goto LABEL_5;
    case 10:
    case 13:
      v2 = (id *)State.available.unsafeMutableAddressor();
LABEL_5:
      v1 = *v2;
      v3 = *v2;
      break;
    default:
      return v1;
  }
  return v1;
}

uint64_t *State.analyzing.unsafeMutableAddressor()
{
  if (one-time initialization token for analyzing != -1)
    swift_once();
  return &static State.analyzing;
}

id static State.analyzing.getter()
{
  if (one-time initialization token for analyzing != -1)
    swift_once();
  return (id)static State.analyzing;
}

uint64_t one-time initialization function for allStates()
{
  unint64_t inited;
  uint64_t *v1;
  void *v2;
  id v3;
  uint64_t *v4;
  void *v5;
  id v6;
  uint64_t *v7;
  void *v8;
  id v9;
  uint64_t *v10;
  void *v11;
  id v12;
  uint64_t *v13;
  void *v14;
  id v15;
  uint64_t *v16;
  void *v17;
  id v18;
  uint64_t *v19;
  void *v20;
  id v21;
  uint64_t *v22;
  void *v23;
  id v24;
  uint64_t *v25;
  void *v26;
  id v27;
  uint64_t *v28;
  void *v29;
  id v30;
  uint64_t *v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21516D9A0;
  v1 = State.abstract.unsafeMutableAddressor();
  v2 = (void *)*v1;
  *(_QWORD *)(inited + 32) = *v1;
  v3 = v2;
  v4 = State.disabled.unsafeMutableAddressor();
  v5 = (void *)*v4;
  *(_QWORD *)(inited + 40) = *v4;
  v6 = v5;
  v7 = State.available.unsafeMutableAddressor();
  v8 = (void *)*v7;
  *(_QWORD *)(inited + 48) = *v7;
  v9 = v8;
  v10 = State.listening.unsafeMutableAddressor();
  v11 = (void *)*v10;
  *(_QWORD *)(inited + 56) = *v10;
  v12 = v11;
  v13 = State.analyzing.unsafeMutableAddressor();
  v14 = (void *)*v13;
  *(_QWORD *)(inited + 64) = *v13;
  v15 = v14;
  v16 = State.understanding.unsafeMutableAddressor();
  v17 = (void *)*v16;
  *(_QWORD *)(inited + 72) = *v16;
  v18 = v17;
  v19 = State.processing.unsafeMutableAddressor();
  v20 = (void *)*v19;
  *(_QWORD *)(inited + 80) = *v19;
  v21 = v20;
  v22 = State.responding.unsafeMutableAddressor();
  v23 = (void *)*v22;
  *(_QWORD *)(inited + 88) = *v22;
  v24 = v23;
  v25 = State.attending.unsafeMutableAddressor();
  v26 = (void *)*v25;
  *(_QWORD *)(inited + 96) = *v25;
  v27 = v26;
  v28 = State.postResponse.unsafeMutableAddressor();
  v29 = (void *)*v28;
  *(_QWORD *)(inited + 104) = *v28;
  v30 = v29;
  v31 = State.resting.unsafeMutableAddressor();
  v32 = (void *)*v31;
  *(_QWORD *)(inited + 112) = *v31;
  specialized Array._endMutation()();
  if (inited >> 62)
  {
    v37 = v32;
    swift_bridgeObjectRetain();
    v38 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v38)
      goto LABEL_3;
LABEL_5:
    v36 = MEMORY[0x24BEE4B08];
    goto LABEL_6;
  }
  v33 = *(_QWORD *)((inited & 0xFFFFFFFFFFFFF8) + 0x10);
  v34 = v32;
  if (!v33)
    goto LABEL_5;
LABEL_3:
  specialized Set.init(_nonEmptyArrayLiteral:)(inited);
  v36 = v35;
LABEL_6:
  result = swift_bridgeObjectRelease();
  static State.allStates = v36;
  return result;
}

{
  unint64_t inited;
  uint64_t *v1;
  void *v2;
  id v3;
  uint64_t *v4;
  void *v5;
  id v6;
  uint64_t *v7;
  void *v8;
  id v9;
  uint64_t *v10;
  void *v11;
  id v12;
  uint64_t *v13;
  void *v14;
  id v15;
  uint64_t *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21516D9B0;
  v1 = SharedState.abstract.unsafeMutableAddressor();
  v2 = (void *)*v1;
  *(_QWORD *)(inited + 32) = *v1;
  v3 = v2;
  v4 = SharedState.unshared.unsafeMutableAddressor();
  v5 = (void *)*v4;
  *(_QWORD *)(inited + 40) = *v4;
  v6 = v5;
  v7 = SharedState.mirroring.unsafeMutableAddressor();
  v8 = (void *)*v7;
  *(_QWORD *)(inited + 48) = *v7;
  v9 = v8;
  v10 = SharedState.passive.unsafeMutableAddressor();
  v11 = (void *)*v10;
  *(_QWORD *)(inited + 56) = *v10;
  v12 = v11;
  v13 = SharedState.preparingToServe.unsafeMutableAddressor();
  v14 = (void *)*v13;
  *(_QWORD *)(inited + 64) = *v13;
  v15 = v14;
  v16 = SharedState.serving.unsafeMutableAddressor();
  v17 = (void *)*v16;
  *(_QWORD *)(inited + 72) = *v16;
  specialized Array._endMutation()();
  if (inited >> 62)
  {
    v22 = v17;
    swift_bridgeObjectRetain();
    v23 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v23)
      goto LABEL_3;
LABEL_5:
    v21 = MEMORY[0x24BEE4B08];
    goto LABEL_6;
  }
  v18 = *(_QWORD *)((inited & 0xFFFFFFFFFFFFF8) + 0x10);
  v19 = v17;
  if (!v18)
    goto LABEL_5;
LABEL_3:
  specialized Set.init(_nonEmptyArrayLiteral:)(inited);
  v21 = v20;
LABEL_6:
  result = swift_bridgeObjectRelease();
  static SharedState.allStates = v21;
  return result;
}

{
  unint64_t inited;
  uint64_t *v1;
  void *v2;
  id v3;
  uint64_t *v4;
  void *v5;
  id v6;
  uint64_t *v7;
  void *v8;
  id v9;
  uint64_t *v10;
  void *v11;
  id v12;
  uint64_t *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21516DFA0;
  v1 = CallState.abstract.unsafeMutableAddressor();
  v2 = (void *)*v1;
  *(_QWORD *)(inited + 32) = *v1;
  v3 = v2;
  v4 = CallState.noCall.unsafeMutableAddressor();
  v5 = (void *)*v4;
  *(_QWORD *)(inited + 40) = *v4;
  v6 = v5;
  v7 = CallState.ongoingCall.unsafeMutableAddressor();
  v8 = (void *)*v7;
  *(_QWORD *)(inited + 48) = *v7;
  v9 = v8;
  v10 = CallState.onHoldCall.unsafeMutableAddressor();
  v11 = (void *)*v10;
  *(_QWORD *)(inited + 56) = *v10;
  v12 = v11;
  v13 = CallState.micMutedCall.unsafeMutableAddressor();
  v14 = (void *)*v13;
  *(_QWORD *)(inited + 64) = *v13;
  specialized Array._endMutation()();
  if (inited >> 62)
  {
    v19 = v14;
    swift_bridgeObjectRetain();
    v20 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v20)
      goto LABEL_3;
LABEL_5:
    v18 = MEMORY[0x24BEE4B08];
    goto LABEL_6;
  }
  v15 = *(_QWORD *)((inited & 0xFFFFFFFFFFFFF8) + 0x10);
  v16 = v14;
  if (!v15)
    goto LABEL_5;
LABEL_3:
  specialized Set.init(_nonEmptyArrayLiteral:)(inited);
  v18 = v17;
LABEL_6:
  result = swift_bridgeObjectRelease();
  static CallState.allStates = v18;
  return result;
}

uint64_t *State.allStates.unsafeMutableAddressor()
{
  if (one-time initialization token for allStates != -1)
    swift_once();
  return &static State.allStates;
}

uint64_t static State.allStates.getter()
{
  if (one-time initialization token for allStates != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t StateMachine<>.init(instrumentationManager:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, id *, uint64_t);
  id v5;
  id v7;

  if (one-time initialization token for allStates != -1)
    swift_once();
  v3 = static State.allStates;
  swift_bridgeObjectRetain();
  v7 = (id)*State.available.unsafeMutableAddressor();
  v4 = *(uint64_t (**)(uint64_t, id *, uint64_t))(v1 + 208);
  v5 = v7;
  return v4(v3, &v7, a1);
}

{
  uint64_t v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, id *, uint64_t);
  id v5;
  id v7;

  if (one-time initialization token for allStates != -1)
    swift_once();
  v3 = static SharedState.allStates;
  swift_bridgeObjectRetain();
  v7 = (id)*SharedState.unshared.unsafeMutableAddressor();
  v4 = *(uint64_t (**)(uint64_t, id *, uint64_t))(v1 + 208);
  v5 = v7;
  return v4(v3, &v7, a1);
}

{
  uint64_t v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, id *, uint64_t);
  id v5;
  id v7;

  if (one-time initialization token for allStates != -1)
    swift_once();
  v3 = static CallState.allStates;
  swift_bridgeObjectRetain();
  v7 = (id)*CallState.noCall.unsafeMutableAddressor();
  v4 = *(uint64_t (**)(uint64_t, id *, uint64_t))(v1 + 208);
  v5 = v7;
  return v4(v3, &v7, a1);
}

void specialized Set.init(_nonEmptyArrayLiteral:)(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  Swift::Int v25;
  id v26;
  Swift::Int v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  char v34;
  uint64_t v35;
  id v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<State>);
      v3 = static _SetStorage.allocate(capacity:)();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return;
LABEL_9:
  v6 = v3 + 56;
  v42 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v40 = v1;
    while (1)
    {
      v8 = MEMORY[0x2199DCEE4](v7, v1);
      v9 = __OFADD__(v7++, 1);
      if (v9)
      {
        __break(1u);
        goto LABEL_37;
      }
      v10 = v8;
      v11 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v3 + 40));
      v12 = -1 << *(_BYTE *)(v3 + 32);
      v13 = v11 & ~v12;
      v14 = v13 >> 6;
      v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
      v16 = 1 << v13;
      if (((1 << v13) & v15) != 0)
      {
        type metadata accessor for State();
        v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
        v18 = static NSObject.== infix(_:_:)();

        if ((v18 & 1) != 0)
        {
LABEL_11:
          swift_unknownObjectRelease();
          v1 = v40;
          goto LABEL_12;
        }
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = static NSObject.== infix(_:_:)();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v40;
      }
      *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
      v22 = *(_QWORD *)(v3 + 16);
      v9 = __OFADD__(v22, 1);
      v23 = v22 + 1;
      if (v9)
        goto LABEL_38;
      *(_QWORD *)(v3 + 16) = v23;
LABEL_12:
      if (v7 == v42)
        return;
    }
  }
  v24 = 0;
  v41 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v41)
  {
    v25 = *(_QWORD *)(v3 + 40);
    v26 = *(id *)(v1 + 32 + 8 * v24);
    v27 = NSObject._rawHashValue(seed:)(v25);
    v28 = -1 << *(_BYTE *)(v3 + 32);
    v29 = v27 & ~v28;
    v30 = v29 >> 6;
    v31 = *(_QWORD *)(v6 + 8 * (v29 >> 6));
    v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      type metadata accessor for State();
      v33 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v29);
      v34 = static NSObject.== infix(_:_:)();

      if ((v34 & 1) != 0)
        goto LABEL_24;
      v35 = ~v28;
      v29 = (v29 + 1) & v35;
      v30 = v29 >> 6;
      v31 = *(_QWORD *)(v6 + 8 * (v29 >> 6));
      v32 = 1 << v29;
      if ((v31 & (1 << v29)) != 0)
      {
        while (1)
        {
          v36 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v29);
          v37 = static NSObject.== infix(_:_:)();

          if ((v37 & 1) != 0)
            break;
          v29 = (v29 + 1) & v35;
          v30 = v29 >> 6;
          v31 = *(_QWORD *)(v6 + 8 * (v29 >> 6));
          v32 = 1 << v29;
          if ((v31 & (1 << v29)) == 0)
            goto LABEL_32;
        }
LABEL_24:

        v4 = v42;
        goto LABEL_25;
      }
LABEL_32:
      v4 = v42;
    }
    *(_QWORD *)(v6 + 8 * v30) = v32 | v31;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v29) = v26;
    v38 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v38, 1);
    v39 = v38 + 1;
    if (v9)
      goto LABEL_39;
    *(_QWORD *)(v3 + 16) = v39;
LABEL_25:
    if (++v24 == v4)
      return;
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  Swift::Int v25;
  id v26;
  Swift::Int v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  char v34;
  uint64_t v35;
  id v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<SharedState>);
      v3 = static _SetStorage.allocate(capacity:)();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return;
LABEL_9:
  v6 = v3 + 56;
  v42 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v40 = v1;
    while (1)
    {
      v8 = MEMORY[0x2199DCEE4](v7, v1);
      v9 = __OFADD__(v7++, 1);
      if (v9)
      {
        __break(1u);
        goto LABEL_37;
      }
      v10 = v8;
      v11 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v3 + 40));
      v12 = -1 << *(_BYTE *)(v3 + 32);
      v13 = v11 & ~v12;
      v14 = v13 >> 6;
      v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
      v16 = 1 << v13;
      if (((1 << v13) & v15) != 0)
      {
        type metadata accessor for SharedState();
        v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
        v18 = static NSObject.== infix(_:_:)();

        if ((v18 & 1) != 0)
        {
LABEL_11:
          swift_unknownObjectRelease();
          v1 = v40;
          goto LABEL_12;
        }
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = static NSObject.== infix(_:_:)();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v40;
      }
      *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
      v22 = *(_QWORD *)(v3 + 16);
      v9 = __OFADD__(v22, 1);
      v23 = v22 + 1;
      if (v9)
        goto LABEL_38;
      *(_QWORD *)(v3 + 16) = v23;
LABEL_12:
      if (v7 == v42)
        return;
    }
  }
  v24 = 0;
  v41 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v41)
  {
    v25 = *(_QWORD *)(v3 + 40);
    v26 = *(id *)(v1 + 32 + 8 * v24);
    v27 = NSObject._rawHashValue(seed:)(v25);
    v28 = -1 << *(_BYTE *)(v3 + 32);
    v29 = v27 & ~v28;
    v30 = v29 >> 6;
    v31 = *(_QWORD *)(v6 + 8 * (v29 >> 6));
    v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      type metadata accessor for SharedState();
      v33 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v29);
      v34 = static NSObject.== infix(_:_:)();

      if ((v34 & 1) != 0)
        goto LABEL_24;
      v35 = ~v28;
      v29 = (v29 + 1) & v35;
      v30 = v29 >> 6;
      v31 = *(_QWORD *)(v6 + 8 * (v29 >> 6));
      v32 = 1 << v29;
      if ((v31 & (1 << v29)) != 0)
      {
        while (1)
        {
          v36 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v29);
          v37 = static NSObject.== infix(_:_:)();

          if ((v37 & 1) != 0)
            break;
          v29 = (v29 + 1) & v35;
          v30 = v29 >> 6;
          v31 = *(_QWORD *)(v6 + 8 * (v29 >> 6));
          v32 = 1 << v29;
          if ((v31 & (1 << v29)) == 0)
            goto LABEL_32;
        }
LABEL_24:

        v4 = v42;
        goto LABEL_25;
      }
LABEL_32:
      v4 = v42;
    }
    *(_QWORD *)(v6 + 8 * v30) = v32 | v31;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v29) = v26;
    v38 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v38, 1);
    v39 = v38 + 1;
    if (v9)
      goto LABEL_39;
    *(_QWORD *)(v3 + 16) = v39;
LABEL_25:
    if (++v24 == v4)
      return;
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  Swift::Int v25;
  id v26;
  Swift::Int v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  char v34;
  uint64_t v35;
  id v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<CallState>);
      v3 = static _SetStorage.allocate(capacity:)();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return;
LABEL_9:
  v6 = v3 + 56;
  v42 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v40 = v1;
    while (1)
    {
      v8 = MEMORY[0x2199DCEE4](v7, v1);
      v9 = __OFADD__(v7++, 1);
      if (v9)
      {
        __break(1u);
        goto LABEL_37;
      }
      v10 = v8;
      v11 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v3 + 40));
      v12 = -1 << *(_BYTE *)(v3 + 32);
      v13 = v11 & ~v12;
      v14 = v13 >> 6;
      v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
      v16 = 1 << v13;
      if (((1 << v13) & v15) != 0)
      {
        type metadata accessor for CallState();
        v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
        v18 = static NSObject.== infix(_:_:)();

        if ((v18 & 1) != 0)
        {
LABEL_11:
          swift_unknownObjectRelease();
          v1 = v40;
          goto LABEL_12;
        }
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = static NSObject.== infix(_:_:)();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v40;
      }
      *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
      v22 = *(_QWORD *)(v3 + 16);
      v9 = __OFADD__(v22, 1);
      v23 = v22 + 1;
      if (v9)
        goto LABEL_38;
      *(_QWORD *)(v3 + 16) = v23;
LABEL_12:
      if (v7 == v42)
        return;
    }
  }
  v24 = 0;
  v41 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v41)
  {
    v25 = *(_QWORD *)(v3 + 40);
    v26 = *(id *)(v1 + 32 + 8 * v24);
    v27 = NSObject._rawHashValue(seed:)(v25);
    v28 = -1 << *(_BYTE *)(v3 + 32);
    v29 = v27 & ~v28;
    v30 = v29 >> 6;
    v31 = *(_QWORD *)(v6 + 8 * (v29 >> 6));
    v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      type metadata accessor for CallState();
      v33 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v29);
      v34 = static NSObject.== infix(_:_:)();

      if ((v34 & 1) != 0)
        goto LABEL_24;
      v35 = ~v28;
      v29 = (v29 + 1) & v35;
      v30 = v29 >> 6;
      v31 = *(_QWORD *)(v6 + 8 * (v29 >> 6));
      v32 = 1 << v29;
      if ((v31 & (1 << v29)) != 0)
      {
        while (1)
        {
          v36 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v29);
          v37 = static NSObject.== infix(_:_:)();

          if ((v37 & 1) != 0)
            break;
          v29 = (v29 + 1) & v35;
          v30 = v29 >> 6;
          v31 = *(_QWORD *)(v6 + 8 * (v29 >> 6));
          v32 = 1 << v29;
          if ((v31 & (1 << v29)) == 0)
            goto LABEL_32;
        }
LABEL_24:

        v4 = v42;
        goto LABEL_25;
      }
LABEL_32:
      v4 = v42;
    }
    *(_QWORD *)(v6 + 8 * v30) = v32 | v31;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v29) = v26;
    v38 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v38, 1);
    v39 = v38 + 1;
    if (v9)
      goto LABEL_39;
    *(_QWORD *)(v3 + 16) = v39;
LABEL_25:
    if (++v24 == v4)
      return;
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t *SharedState.allStates.unsafeMutableAddressor()
{
  if (one-time initialization token for allStates != -1)
    swift_once();
  return &static SharedState.allStates;
}

uint64_t static SharedState.allStates.getter()
{
  if (one-time initialization token for allStates != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

id one-time initialization function for serving()
{
  void *v0;
  id v1;
  id result;

  type metadata accessor for SharedState();
  v0 = (void *)*SharedState.abstract.unsafeMutableAddressor();
  v1 = v0;
  result = SharedState.__allocating_init(name:parent:eventHandler:)(0x676E6976726553, 0xE700000000000000, v0, (uint64_t)implicit closure #1 in variable initialization expression of static SharedState.serving, 0);
  static SharedState.serving = (uint64_t)result;
  return result;
}

uint64_t implicit closure #1 in variable initialization expression of static SharedState.serving(uint64_t a1)
{
  id *v1;
  id v2;
  id v3;

  switch(a1)
  {
    case 5:
      return 1;
    case 2:
      v1 = (id *)SharedState.passive.unsafeMutableAddressor();
      break;
    case 1:
      v1 = (id *)SharedState.unshared.unsafeMutableAddressor();
      break;
    default:
      return 0;
  }
  v2 = *v1;
  v3 = *v1;
  return (uint64_t)v2;
}

uint64_t *SharedState.serving.unsafeMutableAddressor()
{
  if (one-time initialization token for serving != -1)
    swift_once();
  return &static SharedState.serving;
}

id static SharedState.serving.getter()
{
  if (one-time initialization token for serving != -1)
    swift_once();
  return (id)static SharedState.serving;
}

uint64_t Client.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____SRSTClient_delegate;
  swift_beginAccess();
  return MEMORY[0x2199DD49C](v1);
}

uint64_t Client.delegate.setter()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*Client.delegate.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____SRSTClient_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x2199DD49C](v5);
  return SharedClient.delegate.modify;
}

uint64_t property wrapper backing initializer of Client.currentState()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for State?);
  return Published.init(initialValue:)();
}

uint64_t Client.currentState.getter()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t Client.currentState.setter()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return static Published.subscript.setter();
}

uint64_t (*Client.currentState.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return SharedClient.currentState.modify;
}

uint64_t key path setter for Client.$currentState : Client(uint64_t a1, _QWORD **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<State?>.Publisher);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v8 + 16))(v7, a1);
  return (*(uint64_t (**)(char *))((*MEMORY[0x24BEE4EA0] & **a2) + 0xA8))(v7);
}

uint64_t Client.$currentState.getter()
{
  return SharedClient.$currentState.getter((uint64_t)&OBJC_IVAR____SRSTClient__currentState, &demangling cache variable for type metadata for Published<State?>);
}

uint64_t Client.$currentState.setter(uint64_t a1)
{
  return SharedClient.$currentState.setter(a1, &demangling cache variable for type metadata for Published<State?>.Publisher, (uint64_t)&OBJC_IVAR____SRSTClient__currentState, &demangling cache variable for type metadata for Published<State?>);
}

uint64_t (*Client.$currentState.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<State?>.Publisher);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____SRSTClient__currentState;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<State?>);
  Published.projectedValue.getter();
  swift_endAccess();
  return SharedClient.$currentState.modify;
}

uint64_t property wrapper backing initializer of Client.mostRecentEvent()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Event?);
  return Published.init(initialValue:)();
}

uint64_t Client.mostRecentEvent.getter()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t Client.mostRecentEvent.setter()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return static Published.subscript.setter();
}

uint64_t (*Client.mostRecentEvent.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return SharedClient.currentState.modify;
}

uint64_t key path setter for Client.$mostRecentEvent : Client(uint64_t a1, _QWORD **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Event?>.Publisher);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v8 + 16))(v7, a1);
  return (*(uint64_t (**)(char *))((*MEMORY[0x24BEE4EA0] & **a2) + 0xD8))(v7);
}

uint64_t Client.$mostRecentEvent.getter()
{
  return SharedClient.$currentState.getter((uint64_t)&OBJC_IVAR____SRSTClient__mostRecentEvent, &demangling cache variable for type metadata for Published<Event?>);
}

uint64_t Client.$mostRecentEvent.setter(uint64_t a1)
{
  return SharedClient.$currentState.setter(a1, &demangling cache variable for type metadata for Published<Event?>.Publisher, (uint64_t)&OBJC_IVAR____SRSTClient__mostRecentEvent, &demangling cache variable for type metadata for Published<Event?>);
}

uint64_t (*Client.$mostRecentEvent.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Event?>.Publisher);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____SRSTClient__mostRecentEvent;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Event?>);
  Published.projectedValue.getter();
  swift_endAccess();
  return SharedClient.$currentState.modify;
}

uint64_t Client.mostRecentEventName.getter()
{
  _QWORD *v0;
  uint64_t v1;
  char v2;

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
  if ((v2 & 1) != 0)
    return 0;
  else
    return Event.name.getter(v1);
}

void Client.dispatchEvent(_:)(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;

  type metadata accessor for NotificationCenterHelper();
  v3 = a1;
  v2 = lazy protocol witness table accessor for type Event and conformance Event();
  static NotificationCenterHelper.dispatch<A>(_:)((uint64_t)&v3, (uint64_t)&type metadata for Event, v2);
}

id Client.__deallocating_deinit()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  objc_class *v12;
  objc_super v14;

  v1 = v0;
  v2 = type metadata accessor for Logger();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*((_BYTE *)v1 + OBJC_IVAR____SRSTClient_stopped) & 1) == 0)
  {
    type metadata accessor for Client();
    lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type Client and conformance Client, (uint64_t (*)(uint64_t))type metadata accessor for Client, (uint64_t)&protocol conformance descriptor for Client);
    static Clientele.remove<A>(_:)((uint64_t)v1);
    v7 = Logger.framework.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
    v8 = Logger.logObject.getter();
    v9 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_215151000, v8, v9, "Deinit called for Client", v10, 2u);
      MEMORY[0x2199DD454](v10, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    type metadata accessor for OS_dispatch_queue();
    *(_QWORD *)(swift_allocObject() + 16) = v1;
    v11 = v1;
    static OS_dispatch_queue.executeOnMain<A>(_:)((void (*)(void))partial apply for closure #1 in SharedClient.deinit);
    swift_release();
  }
  v12 = (objc_class *)type metadata accessor for Client();
  v14.receiver = v1;
  v14.super_class = v12;
  return objc_msgSendSuper2(&v14, sel_dealloc);
}

void @objc closure #1 in variable initialization expression of static Client.handleStateTransititionNotification(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;

  v10 = a1;
  v8 = a3;
  v9 = a5;
  specialized closure #1 in variable initialization expression of static Client.handleStateTransititionNotification(a2, (uint64_t)a3);

}

uint64_t (**Client.handleStateTransititionNotification.unsafeMutableAddressor())()
{
  return static Client.handleStateTransititionNotification;
}

uint64_t (*static Client.handleStateTransititionNotification.getter())()
{
  swift_beginAccess();
  return static Client.handleStateTransititionNotification[0];
}

uint64_t static Client.handleStateTransititionNotification.setter(uint64_t (*a1)())
{
  uint64_t result;

  result = swift_beginAccess();
  static Client.handleStateTransititionNotification[0] = a1;
  return result;
}

uint64_t (*static Client.handleStateTransititionNotification.modify())()
{
  swift_beginAccess();
  return static SharedClient.handleStateTransititionNotification.modify;
}

void @objc closure #1 in variable initialization expression of static Client.handleEventNotification(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;

  v10 = a1;
  v8 = a3;
  v9 = a5;
  specialized closure #1 in variable initialization expression of static Client.handleEventNotification(a2, (uint64_t)a3);

}

uint64_t type metadata accessor for Client()
{
  uint64_t result;

  result = type metadata singleton initialization cache for Client;
  if (!type metadata singleton initialization cache for Client)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_215160B00()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t (**Client.handleEventNotification.unsafeMutableAddressor())()
{
  return &static Client.handleEventNotification;
}

uint64_t (*static Client.handleEventNotification.getter())()
{
  swift_beginAccess();
  return static Client.handleEventNotification;
}

uint64_t static Client.handleEventNotification.setter(uint64_t (*a1)())
{
  uint64_t result;

  result = swift_beginAccess();
  static Client.handleEventNotification = a1;
  return result;
}

uint64_t (*static Client.handleEventNotification.modify())()
{
  swift_beginAccess();
  return static SharedClient.handleEventNotification.modify;
}

id Client.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void Client.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  objc_class *v18;
  id v19;
  id v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  int64_t v35;
  unint64_t v36;
  uint64_t v37;
  CFNotificationCenterRef value;
  void (__cdecl *v39)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef);
  __CFNotificationCenter *v40;
  id v41;
  __CFString *v42;
  uint64_t v43;
  uint64_t *v44;
  CFNotificationCenterRef_optional *v45;
  unint64_t v46;
  uint64_t v47;
  CFNotificationCenterRef v48;
  void (__cdecl *v49)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef);
  __CFNotificationCenter *v50;
  __CFString *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  id v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int64_t v66;
  _QWORD *v67;
  _QWORD v68[3];
  ValueMetadata *v69;
  uint64_t v70;
  uint64_t v71;
  objc_super v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;

  v1 = type metadata accessor for Logger();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v3);
  v61 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Event?>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<State?>);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  v15 = &v0[OBJC_IVAR____SRSTClient__currentState];
  v73 = 0;
  v16 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for State?);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v15, v14, v10);
  v17 = &v16[OBJC_IVAR____SRSTClient__mostRecentEvent];
  v73 = 0;
  LOBYTE(v74) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Event?);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v17, v9, v5);
  v16[OBJC_IVAR____SRSTClient_stopped] = 0;

  v18 = (objc_class *)type metadata accessor for Client();
  v72.receiver = v16;
  v72.super_class = v18;
  v19 = objc_msgSendSuper2(&v72, sel_init);
  lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type Client and conformance Client, (uint64_t (*)(uint64_t))type metadata accessor for Client, (uint64_t)&protocol conformance descriptor for Client);
  v20 = v19;
  v21 = (const void *)static Clientele.add<A>(_:)((uint64_t)v20, (uint64_t)v18);
  v22 = *State.allStates.unsafeMutableAddressor();
  v63 = v1;
  v62 = v2;
  v60 = v20;
  if ((v22 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for State();
    lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type State and conformance NSObject, (uint64_t (*)(uint64_t))type metadata accessor for State, MEMORY[0x24BEE5BD8]);
    Set.Iterator.init(_cocoa:)();
    v22 = v73;
    v67 = v74;
    v23 = v75;
    v24 = v76;
    v25 = v77;
  }
  else
  {
    v26 = -1 << *(_BYTE *)(v22 + 32);
    v27 = *(_QWORD *)(v22 + 56);
    v67 = (_QWORD *)(v22 + 56);
    v23 = ~v26;
    v28 = -v26;
    if (v28 < 64)
      v29 = ~(-1 << v28);
    else
      v29 = -1;
    v25 = v29 & v27;
    swift_bridgeObjectRetain();
    v24 = 0;
  }
  v65 = v22 & 0x7FFFFFFFFFFFFFFFLL;
  v59 = v23;
  v66 = (unint64_t)(v23 + 64) >> 6;
  v64 = MEMORY[0x24BEE4AD0] + 8;
  if (v22 < 0)
    goto LABEL_10;
  while (1)
  {
    if (v25)
    {
      v30 = (v25 - 1) & v25;
      v31 = __clz(__rbit64(v25)) | (v24 << 6);
      v32 = v24;
      goto LABEL_27;
    }
    v35 = v24 + 1;
    if (__OFADD__(v24, 1))
    {
      __break(1u);
      return;
    }
    if (v35 >= v66)
      goto LABEL_30;
    v36 = v67[v35];
    v32 = v24 + 1;
    if (!v36)
    {
      v32 = v24 + 2;
      if (v24 + 2 >= v66)
        goto LABEL_30;
      v36 = v67[v32];
      if (!v36)
      {
        v32 = v24 + 3;
        if (v24 + 3 >= v66)
          goto LABEL_30;
        v36 = v67[v32];
        if (!v36)
        {
          v32 = v24 + 4;
          if (v24 + 4 >= v66)
            goto LABEL_30;
          v36 = v67[v32];
          if (!v36)
            break;
        }
      }
    }
LABEL_26:
    v30 = (v36 - 1) & v36;
    v31 = __clz(__rbit64(v36)) + (v32 << 6);
LABEL_27:
    v34 = *(id *)(*(_QWORD *)(v22 + 48) + 8 * v31);
    if (!v34)
      goto LABEL_30;
    while (1)
    {
      value = darwinNotificationCenter.unsafeMutableAddressor()->value;
      swift_beginAccess();
      v39 = (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))static Client.handleStateTransititionNotification[0];
      type metadata accessor for NotificationCenterHelper();
      v69 = (ValueMetadata *)type metadata accessor for State();
      v70 = lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type State and conformance State, (uint64_t (*)(uint64_t))type metadata accessor for State, (uint64_t)&protocol conformance descriptor for State);
      v68[0] = v34;
      v40 = value;
      v41 = v34;
      v42 = (__CFString *)static NotificationCenterHelper.notifcationName(for:)(v68);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v68);
      CFNotificationCenterAddObserver(v40, v21, v39, v42, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      v24 = v32;
      v25 = v30;
      if ((v22 & 0x8000000000000000) == 0)
        break;
LABEL_10:
      v33 = __CocoaSet.Iterator.next()();
      if (v33)
      {
        v71 = v33;
        type metadata accessor for State();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v34 = (id)v68[0];
        swift_unknownObjectRelease();
        v32 = v24;
        v30 = v25;
        if (v34)
          continue;
      }
      goto LABEL_30;
    }
  }
  v37 = v24 + 5;
  while (v66 != v37)
  {
    v36 = v67[v37++];
    if (v36)
    {
      v32 = v37 - 1;
      goto LABEL_26;
    }
  }
LABEL_30:
  outlined consume of Set<SharedState>.Iterator._Variant();
  v67 = static Event.allCases.getter();
  v43 = v67[2];
  if (v43)
  {
    type metadata accessor for NotificationCenterHelper();
    v44 = v67 + 4;
    v45 = darwinNotificationCenter.unsafeMutableAddressor();
    swift_beginAccess();
    v46 = lazy protocol witness table accessor for type Event and conformance Event();
    do
    {
      v47 = *v44++;
      v48 = v45->value;
      v49 = (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))static Client.handleEventNotification;
      v69 = &type metadata for Event;
      v70 = v46;
      v68[0] = v47;
      v50 = v48;
      v51 = (__CFString *)static NotificationCenterHelper.notifcationName(for:)(v68);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v68);
      CFNotificationCenterAddObserver(v50, v21, v49, v51, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      --v43;
    }
    while (v43);
  }
  swift_bridgeObjectRelease();
  v52 = Logger.framework.unsafeMutableAddressor();
  v53 = v62;
  v54 = v61;
  v55 = v63;
  (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v61, v52, v63);
  v56 = Logger.logObject.getter();
  v57 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v56, v57))
  {
    v58 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v58 = 0;
    _os_log_impl(&dword_215151000, v56, v57, "Client added Darwin observers", v58, 2u);
    MEMORY[0x2199DD454](v58, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v53 + 8))(v54, v55);
}

Swift::Void __swiftcall Client.stopClient()()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _BYTE *v12;
  uint64_t v13;

  v1 = v0;
  v2 = type metadata accessor for Logger();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = OBJC_IVAR____SRSTClient_stopped;
  if ((v1[OBJC_IVAR____SRSTClient_stopped] & 1) == 0)
  {
    v8 = Logger.framework.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v8, v2);
    v9 = Logger.logObject.getter();
    v10 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_215151000, v9, v10, "#SiriStates stopping client", v11, 2u);
      MEMORY[0x2199DD454](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    v1[v7] = 1;
    type metadata accessor for Client();
    lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type Client and conformance Client, (uint64_t (*)(uint64_t))type metadata accessor for Client, (uint64_t)&protocol conformance descriptor for Client);
    static Clientele.remove<A>(_:)((uint64_t)v1);
    type metadata accessor for OS_dispatch_queue();
    *(_QWORD *)(swift_allocObject() + 16) = v1;
    v12 = v1;
    static OS_dispatch_queue.executeOnMain<A>(_:)((void (*)(void))partial apply for closure #1 in SharedClient.deinit);
    swift_release();
  }
}

uint64_t associated type witness table accessor for ClientProtocol.StateType : StateProtocol in Client()
{
  return lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type State and conformance State, (uint64_t (*)(uint64_t))type metadata accessor for State, (uint64_t)&protocol conformance descriptor for State);
}

uint64_t ObjC metadata update function for Client()
{
  return type metadata accessor for Client();
}

void type metadata completion function for Client()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for Published<SharedState?>(319, &lazy cache variable for type metadata for Published<State?>, &demangling cache variable for type metadata for State?);
  if (v0 <= 0x3F)
  {
    type metadata accessor for Published<SharedState?>(319, &lazy cache variable for type metadata for Published<Event?>, &demangling cache variable for type metadata for Event?);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for Client()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Client.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of Client.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of Client.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of Client.currentState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of Client.currentState.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of Client.currentState.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of Client.$currentState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of Client.$currentState.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of Client.$currentState.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of Client.mostRecentEvent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of Client.mostRecentEvent.setter(uint64_t a1, char a2)
{
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v2) + 0xC0))(a1, a2 & 1);
}

uint64_t dispatch thunk of Client.mostRecentEvent.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of Client.$mostRecentEvent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of Client.$mostRecentEvent.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of Client.$mostRecentEvent.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of Client.mostRecentEventName.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of Client.dispatchEvent(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of Client.stopClient()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

void specialized closure #1 in variable initialization expression of static Client.handleStateTransititionNotification(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  NSObject *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  char *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t *v31;
  void (*v32)(char *, uint64_t);
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  NSObject *v36;
  uint64_t (*v37)(void *);
  NSObject *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  NSObject *v44;
  _QWORD v45[2];
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t, uint64_t);
  uint64_t v52;
  void *v53;

  v4 = type metadata accessor for Logger();
  v5 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4, v6);
  v9 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7, v10);
  v12 = (char *)v45 - v11;
  type metadata accessor for NotificationCenterHelper();
  v13 = (char *)type metadata accessor for State();
  v14 = lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type State and conformance State, (uint64_t (*)(uint64_t))type metadata accessor for State, (uint64_t)&protocol conformance descriptor for State);
  static NotificationCenterHelper.state<A>(from:)(a2, v13, v14, (uint64_t)&v53);
  v15 = v53;
  if (v53)
  {
    v16 = Logger.framework.unsafeMutableAddressor();
    v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v50 = v16;
    v51 = v17;
    ((void (*)(char *))v17)(v12);
    v18 = v15;
    v19 = Logger.logObject.getter();
    v20 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v19, v20))
    {
      v47 = v5;
      v21 = swift_slowAlloc();
      v49 = v4;
      v22 = (uint8_t *)v21;
      v46 = swift_slowAlloc();
      v53 = (void *)v46;
      v48 = v9;
      *(_DWORD *)v22 = 136315138;
      v45[1] = v22 + 4;
      v23 = (char *)v18 + OBJC_IVAR____SRSTState_name;
      v24 = v15;
      v25 = a1;
      v26 = v18;
      v28 = *(uint64_t *)((char *)&v18->isa + OBJC_IVAR____SRSTState_name);
      v27 = *((_QWORD *)v23 + 1);
      swift_bridgeObjectRetain();
      v29 = v28;
      v18 = v26;
      a1 = v25;
      v15 = v24;
      v52 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v29, v27, (uint64_t *)&v53);
      v9 = v48;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_215151000, v19, v20, "Client received valid state transition: %s", v22, 0xCu);
      v30 = v46;
      swift_arrayDestroy();
      MEMORY[0x2199DD454](v30, -1, -1);
      v31 = v22;
      v4 = v49;
      MEMORY[0x2199DD454](v31, -1, -1);

      v32 = *(void (**)(char *, uint64_t))(v47 + 8);
    }
    else
    {

      v32 = *(void (**)(char *, uint64_t))(v5 + 8);
    }
    v32(v12, v4);
    type metadata accessor for Client();
    lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type Client and conformance Client, (uint64_t (*)(uint64_t))type metadata accessor for Client, (uint64_t)&protocol conformance descriptor for Client);
    v33 = static Clientele.contains<A>(_:)(a1);
    if (v33)
    {
      v34 = v33;
      v35 = (_QWORD *)MEMORY[0x24BEE4EA0];
      v36 = v18;
      v37 = *(uint64_t (**)(void *))((*MEMORY[0x24BEE4EA0] & *v33) + 0x90);
      v38 = v36;
      v39 = v37(v15);
      v40 = (void *)(*(uint64_t (**)(uint64_t))((*v35 & *v34) + 0x70))(v39);
      if (v40)
      {
        objc_msgSend(v40, sel_stateMachineWithClient_didTransitionToState_, v34, v38);

        swift_unknownObjectRelease();
      }
      else
      {

      }
    }
    else
    {
      v51(v9, v50, v4);
      v41 = Logger.logObject.getter();
      v42 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v43 = 0;
        _os_log_impl(&dword_215151000, v41, v42, "Observer for darwin callback handler not found", v43, 2u);
        MEMORY[0x2199DD454](v43, -1, -1);
        v44 = v41;
      }
      else
      {
        v44 = v18;
        v18 = v41;
      }

      v32(v9, v4);
    }
  }
}

void specialized closure #1 in variable initialization expression of static Client.handleEventNotification(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  void (*v28)(char *, uint64_t);
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t, uint64_t);
  void *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;

  v4 = type metadata accessor for Logger();
  v5 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4, v6);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7, v10);
  v12 = (char *)&v39 - v11;
  type metadata accessor for NotificationCenterHelper();
  v13 = lazy protocol witness table accessor for type Event and conformance Event();
  static NotificationCenterHelper.event<A>(from:)(a2, (uint64_t)&type metadata for Event, v13, (uint64_t)&v45);
  if ((v46 & 1) == 0)
  {
    v14 = v45;
    v15 = Logger.framework.unsafeMutableAddressor();
    v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v16(v12, v15, v4);
    v17 = Logger.logObject.getter();
    v18 = static os_log_type_t.info.getter();
    v19 = os_log_type_enabled(v17, v18);
    v43 = v14;
    if (v19)
    {
      v20 = swift_slowAlloc();
      v40 = v16;
      v21 = (uint8_t *)v20;
      v22 = swift_slowAlloc();
      v39 = v15;
      v23 = v22;
      v45 = v22;
      v41 = a1;
      v42 = v9;
      *(_DWORD *)v21 = 136315138;
      v24 = Event.name.getter(v14);
      v44 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v45);
      a1 = v41;
      v9 = v42;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_215151000, v17, v18, "Client received valid event reception: %s", v21, 0xCu);
      swift_arrayDestroy();
      v26 = v23;
      v15 = v39;
      MEMORY[0x2199DD454](v26, -1, -1);
      v27 = v21;
      v16 = v40;
      MEMORY[0x2199DD454](v27, -1, -1);
    }

    v28 = *(void (**)(char *, uint64_t))(v5 + 8);
    v28(v12, v4);
    type metadata accessor for Client();
    lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type Client and conformance Client, (uint64_t (*)(uint64_t))type metadata accessor for Client, (uint64_t)&protocol conformance descriptor for Client);
    v29 = static Clientele.contains<A>(_:)(a1);
    if (v29)
    {
      v30 = v29;
      v31 = (_QWORD *)MEMORY[0x24BEE4EA0];
      v32 = v43;
      v33 = (*(uint64_t (**)(uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v29) + 0xC0))(v43, 0);
      v34 = (void *)(*(uint64_t (**)(uint64_t))((*v31 & *v30) + 0x70))(v33);
      if (v34)
      {
        v35 = v34;
        if ((objc_msgSend(v34, sel_respondsToSelector_, sel_stateMachineWithClient_didReceiveEvent_) & 1) != 0)
          objc_msgSend(v35, sel_stateMachineWithClient_didReceiveEvent_, v30, v32);
        swift_unknownObjectRelease();
      }

    }
    else
    {
      v16(v9, v15, v4);
      v36 = Logger.logObject.getter();
      v37 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v36, v37))
      {
        v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v38 = 0;
        _os_log_impl(&dword_215151000, v36, v37, "Observer for darwin callback handler not found", v38, 2u);
        MEMORY[0x2199DD454](v38, -1, -1);
      }

      v28(v9, v4);
    }
  }
}

uint64_t dispatch thunk of StateProtocol.parent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of StateProtocol.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of StateProtocol.handle(event:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of StateProtocol.makeProxy()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of static StateProtocol.named(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 80))();
}

uint64_t dispatch thunk of static StateProtocol.allStates.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of ProxyProtocol.state.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t type metadata instantiation function for EventHandlerResult()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for EventHandlerResult()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for EventHandlerResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int v11;
  _BOOL8 v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  _BOOL8 v20;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = v8;
  if (v7 <= 1)
  {
    if (v8 <= 3)
    {
      v11 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v11 > 0xFFFE)
      {
        v10 = 4;
      }
      else
      {
        v12 = v11 != 0;
        v13 = v11 >= 0xFF;
        v10 = 2;
        if (!v13)
          v10 = v12;
      }
    }
    else
    {
      v10 = 1;
    }
    v9 = v10 + v8;
  }
  v14 = *(_DWORD *)(v6 + 80);
  if (v14 <= 7 && v9 <= 0x18 && (*(_DWORD *)(v6 + 80) & 0x100000) == 0)
  {
    if ((*(unsigned int (**)(uint64_t *, uint64_t, _QWORD))(v6 + 48))(a2, 2, *(_QWORD *)(a3 + 16)))
    {
      if (v7 <= 1)
      {
        if (v8 <= 3)
        {
          v19 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
          if (v19 > 0xFFFE)
          {
            v18 = 4;
          }
          else
          {
            v20 = v19 != 0;
            v13 = v19 >= 0xFF;
            v18 = 2;
            if (!v13)
              v18 = v20;
          }
        }
        else
        {
          v18 = 1;
        }
        v8 += v18;
      }
      memcpy(a1, a2, v8);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
    }
  }
  else
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v14 + 16) & ~v14));
    swift_retain();
  }
  return a1;
}

uint64_t destroy for EventHandlerResult(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 2, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return result;
}

void *initializeWithCopy for EventHandlerResult(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  uint64_t v9;
  unsigned int v10;
  _BOOL8 v11;
  BOOL v12;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 2, v5))
  {
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
    if (v7 <= 1)
    {
      if (v8 <= 3)
      {
        v10 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
        if (v10 > 0xFFFE)
        {
          v9 = 4;
        }
        else
        {
          v11 = v10 != 0;
          v12 = v10 >= 0xFF;
          v9 = 2;
          if (!v12)
            v9 = v11;
        }
      }
      else
      {
        v9 = 1;
      }
      v8 += v9;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  return a1;
}

void *assignWithCopy for EventHandlerResult(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  unsigned int v10;
  size_t v11;
  uint64_t v12;
  unsigned int v13;
  _BOOL8 v14;
  BOOL v15;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 2, v5);
  v9 = v7(a2, 2, v5);
  if (v8)
  {
    if (v9)
    {
      v10 = *(_DWORD *)(v6 + 84);
      v11 = *(_QWORD *)(v6 + 64);
      if (v10 <= 1)
      {
        if (v11 > 3)
        {
LABEL_5:
          v12 = 1;
LABEL_16:
          v11 += v12;
          goto LABEL_17;
        }
LABEL_9:
        v13 = (~(-1 << (8 * v11)) - v10 + 2) >> (8 * v11);
        if (v13 > 0xFFFE)
        {
          v12 = 4;
        }
        else
        {
          v14 = v13 != 0;
          v15 = v13 >= 0xFF;
          v12 = 2;
          if (!v15)
            v12 = v14;
        }
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  else
  {
    if (v9)
    {
      (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
      v10 = *(_DWORD *)(v6 + 84);
      v11 = *(_QWORD *)(v6 + 64);
      if (v10 <= 1)
      {
        if (v11 > 3)
          goto LABEL_5;
        goto LABEL_9;
      }
LABEL_17:
      memcpy(a1, a2, v11);
      return a1;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
  }
  return a1;
}

void *initializeWithTake for EventHandlerResult(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  uint64_t v9;
  unsigned int v10;
  _BOOL8 v11;
  BOOL v12;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 2, v5))
  {
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
    if (v7 <= 1)
    {
      if (v8 <= 3)
      {
        v10 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
        if (v10 > 0xFFFE)
        {
          v9 = 4;
        }
        else
        {
          v11 = v10 != 0;
          v12 = v10 >= 0xFF;
          v9 = 2;
          if (!v12)
            v9 = v11;
        }
      }
      else
      {
        v9 = 1;
      }
      v8 += v9;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  return a1;
}

void *assignWithTake for EventHandlerResult(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  unsigned int v10;
  size_t v11;
  uint64_t v12;
  unsigned int v13;
  _BOOL8 v14;
  BOOL v15;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 2, v5);
  v9 = v7(a2, 2, v5);
  if (v8)
  {
    if (v9)
    {
      v10 = *(_DWORD *)(v6 + 84);
      v11 = *(_QWORD *)(v6 + 64);
      if (v10 <= 1)
      {
        if (v11 > 3)
        {
LABEL_5:
          v12 = 1;
LABEL_16:
          v11 += v12;
          goto LABEL_17;
        }
LABEL_9:
        v13 = (~(-1 << (8 * v11)) - v10 + 2) >> (8 * v11);
        if (v13 > 0xFFFE)
        {
          v12 = 4;
        }
        else
        {
          v14 = v13 != 0;
          v15 = v13 >= 0xFF;
          v12 = 2;
          if (!v15)
            v12 = v14;
        }
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  else
  {
    if (v9)
    {
      (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
      v10 = *(_DWORD *)(v6 + 84);
      v11 = *(_QWORD *)(v6 + 64);
      if (v10 <= 1)
      {
        if (v11 > 3)
          goto LABEL_5;
        goto LABEL_9;
      }
LABEL_17:
      memcpy(a1, a2, v11);
      return a1;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for EventHandlerResult(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  _BOOL8 v10;
  BOOL v11;
  int v12;
  char v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;
  unsigned int v18;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = v5 - 2;
  v7 = *(_QWORD *)(v4 + 64);
  if (v5 <= 1)
  {
    v6 = 0;
    if (v7 <= 3)
    {
      v9 = (~(-1 << (8 * v7)) - v5 + 2) >> (8 * v7);
      if (v9 > 0xFFFE)
      {
        v8 = 4;
      }
      else
      {
        v10 = v9 != 0;
        v11 = v9 >= 0xFF;
        v8 = 2;
        if (!v11)
          v8 = v10;
      }
    }
    else
    {
      v8 = 1;
    }
    v7 += v8;
  }
  if (!a2)
    return 0;
  v12 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_29;
  v13 = 8 * v7;
  if (v7 <= 3)
  {
    v15 = ((v12 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v15))
    {
      v14 = *(_DWORD *)(a1 + v7);
      if (!v14)
        goto LABEL_29;
      goto LABEL_20;
    }
    if (v15 > 0xFF)
    {
      v14 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_29;
      goto LABEL_20;
    }
    if (v15 < 2)
    {
LABEL_29:
      if (v6)
      {
        v18 = (*(uint64_t (**)(void))(v4 + 48))();
        if (v18 >= 3)
          return v18 - 2;
        else
          return 0;
      }
      return 0;
    }
  }
  v14 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_29;
LABEL_20:
  v16 = (v14 - 1) << v13;
  if (v7 > 3)
    v16 = 0;
  if ((_DWORD)v7)
  {
    if (v7 <= 3)
      v17 = v7;
    else
      v17 = 4;
    __asm { BR              X12 }
  }
  return v6 + v16 + 1;
}

void storeEnumTagSinglePayload for EventHandlerResult(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  size_t v9;
  uint64_t v10;
  unsigned int v11;
  _BOOL8 v12;
  BOOL v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  int v18;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = v7 - 2;
  v9 = *(_QWORD *)(v6 + 64);
  if (v7 <= 1)
  {
    v8 = 0;
    if (v9 <= 3)
    {
      v11 = (~(-1 << (8 * v9)) - v7 + 2) >> (8 * v9);
      if (v11 > 0xFFFE)
      {
        v10 = 4;
      }
      else
      {
        v12 = v11 != 0;
        v13 = v11 >= 0xFF;
        v10 = 2;
        if (!v13)
          v10 = v12;
      }
    }
    else
    {
      v10 = 1;
    }
    v9 += v10;
  }
  v13 = a3 >= v8;
  v14 = a3 - v8;
  if (v14 != 0 && v13)
  {
    if (v9 <= 3)
    {
      v17 = ((v14 + ~(-1 << (8 * v9))) >> (8 * v9)) + 1;
      if (HIWORD(v17))
      {
        v15 = 4u;
      }
      else if (v17 >= 0x100)
      {
        v15 = 2;
      }
      else
      {
        v15 = v17 > 1;
      }
    }
    else
    {
      v15 = 1u;
    }
  }
  else
  {
    v15 = 0;
  }
  if (v8 < a2)
  {
    v16 = ~v8 + a2;
    if (v9 < 4)
    {
      if ((_DWORD)v9)
      {
        v18 = v16 & ~(-1 << (8 * v9));
        bzero(a1, v9);
        if ((_DWORD)v9 == 3)
        {
          *a1 = v18;
          *((_BYTE *)a1 + 2) = BYTE2(v18);
        }
        else if ((_DWORD)v9 == 2)
        {
          *a1 = v18;
        }
        else
        {
          *(_BYTE *)a1 = v18;
        }
      }
    }
    else
    {
      bzero(a1, v9);
      *(_DWORD *)a1 = v16;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t getEnumTag for EventHandlerResult(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 48))(a1, 2);
}

uint64_t destructiveInjectEnumTag for EventHandlerResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 56))(a1, a2, 2);
}

uint64_t type metadata accessor for EventHandlerResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for EventHandlerResult);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2199DD370](a1, v6, a5);
}

uint64_t StateMachine.states.getter()
{
  return swift_bridgeObjectRetain();
}

id variable initialization expression of StateMachine.backingStateMachine()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BE29838]), sel_init);
}

uint64_t property wrapper backing initializer of StateMachine.currentState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  Published.init(wrappedValue:)((uint64_t)v6, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
}

uint64_t Published.init(wrappedValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  Published.init(initialValue:)();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
}

uint64_t key path getter for StateMachine.currentState : <A>StateMachine<A>(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 136))();
}

uint64_t key path setter for StateMachine.currentState : <A>StateMachine<A>(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  MEMORY[0x24BDAC7A8](a1, a1);
  v4 = (char *)&v7 - v3;
  (*(void (**)(char *))(v5 + 16))((char *)&v7 - v3);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 144))(v4);
}

void StateMachine.currentState.didset(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 80);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1, a2);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (void *)v2[3];
  (*(void (**)(uint64_t))(v3 + 136))(v6);
  v10 = (_QWORD *)((char *)v2 + *(_QWORD *)(*v2 + 120));
  swift_beginAccess();
  v11 = *v10;
  v12 = type metadata accessor for CUState();
  v13 = *(_QWORD *)(*(_QWORD *)(v3 + 88) + 8);
  swift_bridgeObjectRetain();
  MEMORY[0x2199DCCEC](&v15, v8, v11, v4, v12, v13);
  swift_bridgeObjectRelease();
  v14 = v15;
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    objc_msgSend(v9, sel_transitionToState_, v14);

  }
  else
  {
    __break(1u);
  }
}

uint64_t StateMachine.currentState.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  return swift_release();
}

uint64_t sub_215162DDC()
{
  return 16;
}

__n128 sub_215162DE8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t StateMachine.currentState.setter(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  specialized StateMachine.currentState.setter(a1, a2);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v4 + 80) - 8) + 8))(a1);
}

void (*StateMachine.currentState.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v3[1] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[2] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[3] = malloc(v6);
  v3[4] = malloc(v6);
  StateMachine.currentState.getter();
  return StateMachine.currentState.modify;
}

void StateMachine.currentState.modify(uint64_t a1, char a2)
{
  StateMachine.currentState.modify(a1, a2, (void (*)(void *))specialized StateMachine.currentState.setter);
}

uint64_t key path getter for StateMachine.$currentState : <A>StateMachine<A>(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 160))();
}

uint64_t key path setter for StateMachine.$currentState : <A>StateMachine<A>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = type metadata accessor for Published.Publisher();
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v10 - v6;
  (*(void (**)(char *, uint64_t))(v8 + 16))((char *)&v10 - v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 168))(v7);
}

uint64_t StateMachine.$currentState.getter()
{
  swift_beginAccess();
  type metadata accessor for Published();
  Published.projectedValue.getter();
  return swift_endAccess();
}

uint64_t StateMachine.$currentState.setter(uint64_t a1)
{
  uint64_t v2;

  specialized StateMachine.$currentState.setter(a1);
  v2 = type metadata accessor for Published.Publisher();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

void (*StateMachine.$currentState.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = type metadata accessor for Published.Publisher();
  v3[1] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[2] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[3] = malloc(v6);
  v3[4] = malloc(v6);
  StateMachine.$currentState.getter();
  return StateMachine.$currentState.modify;
}

void StateMachine.$currentState.modify(uint64_t a1, char a2)
{
  StateMachine.currentState.modify(a1, a2, (void (*)(void *))specialized StateMachine.$currentState.setter);
}

void StateMachine.currentState.modify(uint64_t a1, char a2, void (*a3)(void *))
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void *, uint64_t);

  v4 = *(void **)a1;
  v5 = *(void **)(*(_QWORD *)a1 + 24);
  v6 = *(void **)(*(_QWORD *)a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)a1 + 8);
  v8 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if ((a2 & 1) != 0)
  {
    (*(void (**)(_QWORD, void *, uint64_t))(v8 + 16))(*(_QWORD *)(*(_QWORD *)a1 + 24), v6, v7);
    a3(v5);
    v9 = *(void (**)(void *, uint64_t))(v8 + 8);
    v9(v5, v7);
  }
  else
  {
    a3(*(void **)(*(_QWORD *)a1 + 32));
    v9 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v9(v6, v7);
  free(v6);
  free(v5);
  free(v4);
}

uint64_t variable initialization expression of StateMachine.stateMapping()
{
  type metadata accessor for CUState();
  return Dictionary.init()();
}

uint64_t *StateMachine.__allocating_init(states:initialState:instrumentationManager:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v8;

  v4 = v3;
  swift_allocObject();
  v8 = specialized StateMachine.init(states:initialState:instrumentationManager:)(a1, a2, a3);
  swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v4 + 80) - 8) + 8))(a2);
  return v8;
}

uint64_t *StateMachine.init(states:initialState:instrumentationManager:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t *v6;

  v5 = *v3;
  v6 = specialized StateMachine.init(states:initialState:instrumentationManager:)(a1, a2, a3);
  swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v5 + 80) - 8) + 8))(a2);
  return v6;
}

id *StateMachine.deinit()
{
  id *v0;
  char *v1;
  uint64_t v2;

  objc_msgSend(v0[3], sel_invalidate);
  swift_bridgeObjectRelease();

  v1 = (char *)v0 + *((_QWORD *)*v0 + 14);
  v2 = type metadata accessor for Published();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t StateMachine.__deallocating_deinit()
{
  StateMachine.deinit();
  return swift_deallocClassInstance();
}

void StateMachine.dispatchEvent(_:)()
{
  uint64_t v0;
  void *v1;
  uint64_t AssociatedConformanceWitness;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v1 = *(void **)(v0 + 24);
  swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24);
  v4 = swift_checkMetadataState();
  v5 = v3(v4, AssociatedConformanceWitness);
  v7 = v6;
  v8 = objc_allocWithZone(MEMORY[0x24BE29830]);
  v9 = (void *)MEMORY[0x2199DCD04](v5, v7);
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_initWithName_userInfo_, v9, 0);

  objc_msgSend(v1, sel_dispatchEvent_, v10);
}

uint64_t StateMachine.constructStateMapping()()
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
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  void (*v44)(char *, char *, uint64_t);
  char *v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, char *, uint64_t);
  void (*v62)(char *, uint64_t);
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  _QWORD aBlock[7];
  uint64_t v72;

  v1 = *(_QWORD *)v0;
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  v3 = type metadata accessor for Optional();
  v59 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3, v4);
  v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v5, v8);
  v66 = (char *)&v53 - v10;
  v68 = *(_QWORD *)(v2 - 8);
  v11 = *(_QWORD *)(v68 + 64);
  v13 = MEMORY[0x24BDAC7A8](v9, v12);
  v58 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13, v14);
  v16 = (char *)&v53 - v15;
  v17 = *(_QWORD *)(v1 + 120);
  v67 = v0;
  v18 = v0 + v17;
  swift_beginAccess();
  v19 = type metadata accessor for CUState();
  v20 = *(_QWORD *)(v1 + 88);
  v21 = *(_QWORD *)(v20 + 8);
  v22 = swift_bridgeObjectRetain();
  v69 = v2;
  v60 = v21;
  v23 = MEMORY[0x2199DCCC8](v22, v2, v19, v21);
  result = swift_bridgeObjectRelease();
  if (!v23)
  {
    v65 = v20;
    v56 = v18;
    v57 = v16;
    v25 = *(_QWORD *)(v67 + 16);
    v72 = v25;
    swift_bridgeObjectRetain_n();
    v26 = v69;
    v27 = Set.count.getter();
    swift_bridgeObjectRelease();
    if (v27 < 1)
    {
      return swift_bridgeObjectRelease();
    }
    else
    {
      v64 = v19;
      v54 = v11 + 7;
      v28 = type metadata accessor for Set();
      v29 = 0;
      v30 = v68;
      v55 = v3;
      v53 = v28;
      v31 = v57;
      while (1)
      {
        aBlock[0] = v25;
        swift_bridgeObjectRetain();
        MEMORY[0x2199DD3C4](MEMORY[0x24BEE1718], v28);
        v32 = v66;
        Sequence.first(where:)();
        swift_bridgeObjectRelease();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v32, 1, v26) == 1)
          break;
        v61 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
        v61(v31, v66, v26);
        v33 = v65;
        (*(void (**)(uint64_t, uint64_t))(v65 + 48))(v26, v65);
        _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #2 in StateMachine.constructStateMapping(), v67, MEMORY[0x24BEE4078], v64, v34, (uint64_t)aBlock);
        v63 = v29;
        v62 = *(void (**)(char *, uint64_t))(v59 + 8);
        v62(v7, v3);
        v35 = (void *)aBlock[0];
        v36 = (*(uint64_t (**)(uint64_t, uint64_t))(v33 + 56))(v26, v33);
        v38 = v37;
        v39 = objc_allocWithZone(MEMORY[0x24BE29828]);
        v40 = v35;
        v41 = (void *)MEMORY[0x2199DCD04](v36, v38);
        swift_bridgeObjectRelease();
        v42 = objc_msgSend(v39, sel_initWithName_parent_, v41, v40);

        v43 = swift_allocObject();
        swift_weakInit();
        v44 = *(void (**)(char *, char *, uint64_t))(v68 + 16);
        v45 = v58;
        v44(v58, v31, v69);
        v46 = (*(unsigned __int8 *)(v68 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80);
        v47 = (v54 + v46) & 0xFFFFFFFFFFFFFFF8;
        v48 = swift_allocObject();
        v49 = v65;
        *(_QWORD *)(v48 + 16) = v69;
        *(_QWORD *)(v48 + 24) = v49;
        v61((char *)(v48 + v46), v45, v69);
        *(_QWORD *)(v48 + v47) = v43;
        aBlock[4] = partial apply for closure #3 in StateMachine.constructStateMapping();
        aBlock[5] = v48;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed CUStateEvent) -> (@unowned CUStateResult);
        aBlock[3] = &block_descriptor;
        v50 = _Block_copy(aBlock);
        swift_release();
        objc_msgSend(v42, sel_setEventHandler_, v50);
        _Block_release(v50);
        v44(v45, v31, v69);
        v70 = v42;
        swift_beginAccess();
        type metadata accessor for Dictionary();
        v51 = v42;
        v26 = v69;
        Dictionary.subscript.setter();
        swift_endAccess();
        v28 = v53;
        Set.remove(_:)();

        v3 = v55;
        v30 = v68;
        v62(v7, v3);
        (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v26);
        v25 = v72;
        swift_bridgeObjectRetain();
        v52 = Set.count.getter();
        swift_bridgeObjectRelease();
        v29 = v63;
        if (v52 <= 0)
          return swift_bridgeObjectRelease();
      }
      (*(void (**)(char *, uint64_t))(v59 + 8))(v66, v3);
      result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
  }
  return result;
}

uint64_t closure #1 in StateMachine.constructStateMapping()(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  _BOOL8 v19;
  char *v20;
  uint64_t result;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t *v28;
  void (*v29)(uint64_t, uint64_t);
  char *v30;
  id v31;

  v28 = a2;
  v3 = *a2;
  v4 = *(_QWORD *)(*a2 + 80);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Optional();
  v9 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x24BDAC7A8](v8, v10);
  v30 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)&v27 - v14;
  v16 = *(_QWORD *)(v3 + 88);
  v29 = *(void (**)(uint64_t, uint64_t))(v16 + 48);
  v29(v4, v16);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  v18 = v17(v15, 1, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  if (v18 == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return 1;
  }
  v20 = v30;
  v29(v4, v16);
  result = v17(v20, 1, v4);
  if ((_DWORD)result != 1)
  {
    v22 = (uint64_t *)((char *)v28 + *(_QWORD *)(*v28 + 120));
    swift_beginAccess();
    v23 = *v22;
    v24 = type metadata accessor for CUState();
    v25 = *(_QWORD *)(v16 + 8);
    swift_bridgeObjectRetain();
    MEMORY[0x2199DCCEC](&v31, v20, v23, v4, v24, v25);
    swift_bridgeObjectRelease();
    v26 = *(void (**)(char *, uint64_t))(v5 + 8);
    v26(v7, v4);
    v19 = v31 != 0;
    if (v31)

    v26(v20, v4);
    return v19;
  }
  __break(1u);
  return result;
}

uint64_t _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, char *);
  uint64_t v30;

  v27 = a5;
  v28 = a2;
  v30 = a4;
  v29 = a1;
  v26 = a3;
  v9 = *(_QWORD *)(a3 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1, a2);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v13 + 16);
  v15 = *(_QWORD *)(v14 - 8);
  v17 = MEMORY[0x24BDAC7A8](v10, v16);
  v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17, v20);
  v22 = (char *)&v26 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v23 + 16))(v22, v6);
  v24 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v22, 1, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v19, v22, v14);
    v29(v19, v12);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v19, v14);
    if (v7)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v27, v12, v26);
    v24 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(a6, v24, 1);
}

uint64_t closure #3 in StateMachine.constructStateMapping()(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t AssociatedTypeWitness;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char v38;
  uint64_t AssociatedConformanceWitness;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  int v44;
  uint64_t result;
  uint64_t Strong;
  char *v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t);
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  char *v74;
  char *v75;
  char *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;

  v78 = a3;
  v79 = a2;
  v80 = *(_QWORD *)(a4 - 8);
  v8 = MEMORY[0x24BDAC7A8](a1, a2);
  v10 = (char *)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v8, v11);
  v76 = (char *)&v74 - v13;
  MEMORY[0x24BDAC7A8](v12, v14);
  v16 = (char *)&v74 - v15;
  v81 = type metadata accessor for EventHandlerResult(0, v17, v18, v17);
  v83 = *(_QWORD *)(v81 - 8);
  v20 = MEMORY[0x24BDAC7A8](v81, v19);
  v22 = (char *)&v74 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20, v23);
  v84 = (char *)&v74 - v24;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v26 = type metadata accessor for Optional();
  v28 = MEMORY[0x24BDAC7A8](v26, v27);
  v74 = (char *)&v74 - v29;
  v82 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v28, v30);
  v32 = (char *)&v74 - v31;
  v77 = a1;
  v33 = objc_msgSend(a1, sel_name);
  v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v36 = v35;

  v75 = v10;
  if (v34 == 0x7265746E65 && v36 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    v37 = v16;
LABEL_5:
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(AssociatedTypeWitness, AssociatedConformanceWitness);
    goto LABEL_6;
  }
  v38 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  v37 = v16;
  if ((v38 & 1) != 0)
    goto LABEL_5;
  v54 = objc_msgSend(v77, sel_name);
  v55 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v57 = v56;

  if (v55 == 1953069157 && v57 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    v37 = v16;
LABEL_16:
    v59 = swift_getAssociatedConformanceWitness();
    (*(void (**)(uint64_t, uint64_t))(v59 + 40))(AssociatedTypeWitness, v59);
    goto LABEL_6;
  }
  v58 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  v37 = v16;
  if ((v58 & 1) != 0)
    goto LABEL_16;
  v60 = objc_msgSend(v77, sel_name);
  v61 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v63 = v62;

  if (v61 == 0x6C616974696E69 && v63 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    v37 = v16;
LABEL_25:
    v65 = swift_getAssociatedConformanceWitness();
    (*(void (**)(uint64_t, uint64_t))(v65 + 48))(AssociatedTypeWitness, v65);
    goto LABEL_6;
  }
  v64 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  v37 = v16;
  if ((v64 & 1) != 0)
    goto LABEL_25;
  v66 = objc_msgSend(v77, sel_name);
  v67 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v69 = v68;

  v70 = swift_getAssociatedConformanceWitness();
  v71 = v67;
  v72 = v74;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v70 + 16))(v71, v69, AssociatedTypeWitness, v70);
  v73 = v82;
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v82 + 48))(v72, 1, AssociatedTypeWitness);
  if ((_DWORD)result == 1)
  {
    __break(1u);
    return result;
  }
  (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v32, v72, AssociatedTypeWitness);
LABEL_6:
  v41 = v80;
  v40 = v81;
  v42 = v84;
  (*(void (**)(char *, uint64_t, uint64_t))(a5 + 64))(v32, a4, a5);
  v43 = v83;
  (*(void (**)(char *, char *, uint64_t))(v83 + 16))(v22, v42, v40);
  v44 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v41 + 48))(v22, 2, a4);
  if (v44)
  {
    if (v44 == 1)
    {
      (*(void (**)(char *, uint64_t))(v43 + 8))(v84, v40);
      (*(void (**)(char *, uint64_t))(v82 + 8))(v32, AssociatedTypeWitness);
      return 1;
    }
    (*(void (**)(char *, uint64_t))(v43 + 8))(v84, v40);
    goto LABEL_18;
  }
  (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v37, v22, a4);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  v47 = v37;
  if (!Strong)
  {
    (*(void (**)(char *, uint64_t))(v41 + 8))(v37, a4);
    (*(void (**)(char *, uint64_t))(v83 + 8))(v84, v40);
LABEL_18:
    (*(void (**)(char *, uint64_t))(v82 + 8))(v32, AssociatedTypeWitness);
    return 2;
  }
  v48 = Strong;
  v49 = v76;
  (*(void (**)(void))(*(_QWORD *)Strong + 136))();
  v50 = v75;
  (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v75, v47, a4);
  (*(void (**)(char *))(*(_QWORD *)v48 + 144))(v50);
  v51 = *(_QWORD *)(v48 + *(_QWORD *)(*(_QWORD *)v48 + 128));
  v52 = mach_absolute_time();
  (*(void (**)(char *, char *, char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v51 + 168))(v49, v47, v32, v52, a4, a5);
  v53 = *(void (**)(char *, uint64_t))(v41 + 8);
  v53(v49, a4);
  v53(v47, a4);
  (*(void (**)(char *, uint64_t))(v83 + 8))(v84, v40);
  (*(void (**)(char *, uint64_t))(v82 + 8))(v32, AssociatedTypeWitness);
  swift_release();
  return 2;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed CUStateEvent) -> (@unowned CUStateResult)(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = v3();
  swift_release();

  return v5;
}

void specialized StateMachine.currentState.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];

  v4 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v8 + 88);
  v12[2] = v4;
  v12[3] = v9;
  swift_getKeyPath();
  v12[0] = v4;
  v12[1] = v9;
  swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  swift_retain();
  v10 = static Published.subscript.setter();
  StateMachine.currentState.didset(v10, v11);
}

uint64_t specialized StateMachine.$currentState.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v2 = type metadata accessor for Published.Publisher();
  MEMORY[0x24BDAC7A8](v2, v3);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v7 - v5, a1);
  swift_beginAccess();
  type metadata accessor for Published();
  Published.projectedValue.setter();
  return swift_endAccess();
}

unint64_t type metadata accessor for CUState()
{
  unint64_t result;

  result = lazy cache variable for type metadata for CUState;
  if (!lazy cache variable for type metadata for CUState)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for CUState);
  }
  return result;
}

uint64_t *specialized StateMachine.init(states:initialState:instrumentationManager:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  id v18;
  Class isa;
  void (*v20)(void);
  id v21;
  void *v22;
  uint64_t v24;
  _QWORD v25[4];

  v24 = a2;
  v6 = *v3;
  v7 = *(_QWORD *)(*v3 + 80);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v10 = (char *)&v25[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE29838]), sel_init);
  v3[3] = (uint64_t)v11;
  v12 = *(_QWORD *)(*v3 + 120);
  v13 = type metadata accessor for CUState();
  v14 = *(_QWORD *)(*(_QWORD *)(v6 + 88) + 8);
  *(uint64_t *)((char *)v3 + v12) = Dictionary.init()();
  v3[2] = a1;
  v15 = v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v24, v7);
  swift_beginAccess();
  property wrapper backing initializer of StateMachine.currentState((uint64_t)v10, v7);
  swift_endAccess();
  *(uint64_t *)((char *)v3 + *(_QWORD *)(*v3 + 128)) = a3;
  swift_retain();
  StateMachine.constructStateMapping()();
  v16 = (uint64_t *)((char *)v3 + *(_QWORD *)(*v3 + 120));
  swift_beginAccess();
  v25[1] = *v16;
  v17 = type metadata accessor for Dictionary.Values();
  v18 = v11;
  swift_bridgeObjectRetain();
  MEMORY[0x2199DD3C4](MEMORY[0x24BEE03C0], v17);
  Array.init<A>(_:)();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v18, sel_setStates_, isa);

  v20 = *(void (**)(void))(*v3 + 136);
  v21 = (id)v3[3];
  v20();
  swift_beginAccess();
  MEMORY[0x2199DCCEC](v25, v10, *v16, v7, v13, v14);
  v22 = (void *)v25[0];
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v7);
  objc_msgSend(v21, sel_setInitialState_, v22);

  objc_msgSend((id)v3[3], sel_start);
  return v3;
}

uint64_t sub_2151648D4()
{
  return 16;
}

__n128 sub_2151648E0(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_2151648EC()
{
  return 16;
}

__n128 sub_2151648F8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t type metadata completion function for StateMachine()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Published();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for StateMachine(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for StateMachine);
}

uint64_t method lookup function for StateMachine()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StateMachine.currentState.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of StateMachine.currentState.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of StateMachine.currentState.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of StateMachine.$currentState.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of StateMachine.$currentState.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of StateMachine.$currentState.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of StateMachine.__allocating_init(states:initialState:instrumentationManager:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of StateMachine.dispatchEvent(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t partial apply for closure #1 in StateMachine.constructStateMapping()(uint64_t a1)
{
  uint64_t *v1;

  return closure #1 in StateMachine.constructStateMapping()(a1, v1) & 1;
}

uint64_t partial apply for closure #2 in StateMachine.constructStateMapping()@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v5 = *v2;
  v6 = (uint64_t *)((char *)v2 + *(_QWORD *)(*v2 + 120));
  swift_beginAccess();
  v7 = *v6;
  v8 = *(_QWORD *)(v5 + 80);
  v9 = type metadata accessor for CUState();
  v10 = *(_QWORD *)(*(_QWORD *)(v5 + 88) + 8);
  swift_bridgeObjectRetain();
  MEMORY[0x2199DCCEC](&v12, a1, v7, v8, v9, v10);
  result = swift_bridgeObjectRelease();
  if (v12)
    *a2 = v12;
  else
    __break(1u);
  return result;
}

uint64_t sub_215164AFC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_215164B20()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #3 in StateMachine.constructStateMapping()(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return closure #3 in StateMachine.constructStateMapping()(a1, v1 + v4, *(_QWORD *)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)), v2, *(_QWORD *)(v1 + 24));
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

void StateMachine.stateMapping.setter()
{
  swift_deletedMethodError();
  __break(1u);
}

void static OS_dispatch_queue.executeOnMain<A>(_:)(void (*a1)(void))
{
  void *v2;
  uint64_t v3;

  if (objc_msgSend((id)objc_opt_self(), sel_isMainThread))
  {
    a1();
  }
  else
  {
    type metadata accessor for OS_dispatch_queue();
    v2 = (void *)static OS_dispatch_queue.main.getter();
    MEMORY[0x24BDAC7A8](v2, v3);
    OS_dispatch_queue.sync<A>(execute:)();

  }
}

uint64_t partial apply for closure #1 in static OS_dispatch_queue.executeOnMain<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 24))();
}

void static NotificationCenterHelper.dispatch<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  NSObject *v20;
  os_log_type_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  __CFNotificationCenter *v34;
  Swift::String *v35;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  void *v40;
  void *v41;
  Swift::String v42;
  __CFString *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;

  v6 = *(_QWORD *)(a2 - 8);
  v7 = MEMORY[0x24BDAC7A8](a1, a2);
  v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7, v10);
  v12 = (char *)&v44 - v11;
  v13 = type metadata accessor for Logger();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13, v15);
  v17 = (char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = Logger.framework.unsafeMutableAddressor();
  v50 = v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v18, v13);
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v19(v12, a1, a2);
  v19(v9, a1, a2);
  v20 = Logger.logObject.getter();
  v21 = static os_log_type_t.info.getter();
  v22 = v21;
  if (os_log_type_enabled(v20, v21))
  {
    v23 = swift_slowAlloc();
    v49 = a1;
    v24 = v23;
    v48 = swift_slowAlloc();
    v52 = v48;
    *(_DWORD *)v24 = 136315394;
    v46 = v22;
    swift_getDynamicType();
    v25 = _typeName(_:qualified:)();
    v45 = a3;
    v51 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v25, v26, &v52);
    v47 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v27 = *(void (**)(char *, uint64_t))(v6 + 8);
    v27(v12, a2);
    *(_WORD *)(v24 + 12) = 2080;
    v28 = v45;
    v29 = (*(uint64_t (**)(uint64_t))(v45 + 24))(a2);
    v51 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v29, v30, &v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v27(v9, a2);
    _os_log_impl(&dword_215151000, v20, (os_log_type_t)v46, "Client posting darwin notification for event dispatch type=%s, event: %s", (uint8_t *)v24, 0x16u);
    v31 = v48;
    swift_arrayDestroy();
    MEMORY[0x2199DD454](v31, -1, -1);
    MEMORY[0x2199DD454](v24, -1, -1);

    (*(void (**)(char *, uint64_t))(v50 + 8))(v17, v47);
    v32 = v28;
  }
  else
  {
    v33 = *(void (**)(char *, uint64_t))(v6 + 8);
    v33(v12, a2);
    v33(v9, a2);

    (*(void (**)(char *, uint64_t))(v50 + 8))(v17, v13);
    v32 = a3;
  }
  v34 = darwinNotificationCenter.unsafeMutableAddressor()->value;
  v35 = eventDispatchNotificationNamePrefix.unsafeMutableAddressor();
  countAndFlagsBits = v35->_countAndFlagsBits;
  object = v35->_object;
  v38 = *(uint64_t (**)(uint64_t, uint64_t))(v32 + 24);
  swift_bridgeObjectRetain();
  v39 = v38(a2, v32);
  v41 = v40;
  v52 = countAndFlagsBits;
  v53 = object;
  swift_bridgeObjectRetain();
  v42._countAndFlagsBits = v39;
  v42._object = v41;
  String.append(_:)(v42);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v43 = (__CFString *)MEMORY[0x2199DCD04](v52, v53);
  swift_bridgeObjectRelease();
  CFNotificationCenterPostNotification(v34, v43, 0, 0, 1u);

}

void static NotificationCenterHelper.removeEveryObserver(_:)(const void *a1)
{
  CFNotificationCenterRef_optional *v2;

  v2 = darwinNotificationCenter.unsafeMutableAddressor();
  CFNotificationCenterRemoveEveryObserver(v2->value, a1);
}

uint64_t static NotificationCenterHelper.notifcationName(for:)(_QWORD *a1)
{
  Swift::String *v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
  void *v10;
  Swift::String v11;
  uint64_t v12;

  v2 = eventReceivedNotificationNamePrefix.unsafeMutableAddressor();
  countAndFlagsBits = v2->_countAndFlagsBits;
  object = v2->_object;
  v5 = a1[3];
  v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 24);
  swift_bridgeObjectRetain();
  v8 = v7(v5, v6);
  v10 = v9;
  swift_bridgeObjectRetain();
  v11._countAndFlagsBits = v8;
  v11._object = v10;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = MEMORY[0x2199DCD04](countAndFlagsBits, object);
  swift_bridgeObjectRelease();
  return v12;
}

{
  Swift::String *v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
  void *v10;
  Swift::String v11;
  uint64_t v12;

  v2 = stateTransitionNotificationNamePrefix.unsafeMutableAddressor();
  countAndFlagsBits = v2->_countAndFlagsBits;
  object = v2->_object;
  v5 = a1[3];
  v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 56);
  swift_bridgeObjectRetain();
  v8 = v7(v5, v6);
  v10 = v9;
  swift_bridgeObjectRetain();
  v11._countAndFlagsBits = v8;
  v11._object = v10;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = MEMORY[0x2199DCD04](countAndFlagsBits, object);
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t static NotificationCenterHelper.state<A>(from:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  Swift::String *v23;
  void *object;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint8_t *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  Swift::String *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t, uint64_t, char *);
  uint64_t v47;
  uint64_t v48;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t countAndFlagsBits;
  void *v59;
  uint64_t v60;
  unint64_t v61;

  v8 = type metadata accessor for Logger();
  v9 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x24BDAC7A8](v8, v10);
  v13 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v14);
  v55 = (char *)&v50 - v15;
  v16 = type metadata accessor for Optional();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16, v18);
  v20 = (char *)&v50 - v19;
  if (a1 && (v60 = 0, v61 = 0, static String._conditionallyBridgeFromObjectiveC(_:result:)(), (v21 = v61) != 0))
  {
    v54 = v8;
    v52 = a4;
    v22 = v60;
    v23 = stateTransitionNotificationNamePrefix.unsafeMutableAddressor();
    object = v23->_object;
    countAndFlagsBits = v23->_countAndFlagsBits;
    v59 = object;
    v56 = 0;
    v57 = 0xE000000000000000;
    lazy protocol witness table accessor for type String and conformance String();
    v25 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
    (*(void (**)(uint64_t))(a3 + 80))(v25);
    swift_bridgeObjectRelease();
    v26 = *((_QWORD *)a2 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, char *))(v26 + 48))(v20, 1, a2) != 1)
    {
      swift_bridgeObjectRelease();
      v48 = v52;
      (*(void (**)(uint64_t, char *, char *))(v26 + 32))(v52, v20, a2);
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, char *))(v26 + 56))(v48, 0, 1, a2);
    }
    v51 = v22;
    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
    v27 = Logger.framework.unsafeMutableAddressor();
    v29 = v54;
    v28 = v55;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v55, v27, v54);
    swift_bridgeObjectRetain();
    v30 = Logger.logObject.getter();
    v31 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = swift_slowAlloc();
      v53 = v9;
      v33 = (uint8_t *)v32;
      v34 = v28;
      v35 = swift_slowAlloc();
      v60 = v35;
      *(_DWORD *)v33 = 136315138;
      v50 = v33 + 4;
      swift_bridgeObjectRetain();
      countAndFlagsBits = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v51, v21, &v60);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_215151000, v30, v31, "State transition darwin notification was malformed: %s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199DD454](v35, -1, -1);
      MEMORY[0x2199DD454](v33, -1, -1);

      (*(void (**)(char *, uint64_t))(v53 + 8))(v34, v29);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v28, v29);
    }
    v46 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(v26 + 56);
    v47 = v52;
  }
  else
  {
    v36 = Logger.framework.unsafeMutableAddressor();
    v37 = v9;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, v36, v8);
    v38 = Logger.logObject.getter();
    v39 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v38, v39))
    {
      v54 = v8;
      v40 = (uint8_t *)swift_slowAlloc();
      v41 = swift_slowAlloc();
      v53 = v37;
      v42 = v41;
      v60 = v41;
      v55 = a2;
      *(_DWORD *)v40 = 136315138;
      v43 = unknownNotificationName.unsafeMutableAddressor();
      v45 = v43->_countAndFlagsBits;
      v44 = (unint64_t)v43->_object;
      swift_bridgeObjectRetain();
      countAndFlagsBits = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v44, &v60);
      a2 = v55;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_215151000, v38, v39, "State transition darwin notification was malformed: %s", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199DD454](v42, -1, -1);
      MEMORY[0x2199DD454](v40, -1, -1);

      (*(void (**)(char *, uint64_t))(v53 + 8))(v13, v54);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v37 + 8))(v13, v8);
    }
    v46 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(*((_QWORD *)a2 - 1) + 56);
    v47 = a4;
  }
  return v46(v47, 1, 1, a2);
}

uint64_t static NotificationCenterHelper.event<A>(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  Swift::String *v23;
  void *object;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  os_log_type_t v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  Swift::String *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  _QWORD v50[2];
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t countAndFlagsBits;
  void *v58;
  uint64_t v59;
  unint64_t v60;

  v8 = type metadata accessor for Logger();
  v9 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x24BDAC7A8](v8, v10);
  v13 = (char *)v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v14);
  v53 = (char *)v50 - v15;
  v16 = type metadata accessor for Optional();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16, v18);
  v20 = (char *)v50 - v19;
  if (a1 && (v59 = 0, v60 = 0, static String._conditionallyBridgeFromObjectiveC(_:result:)(), (v21 = v60) != 0))
  {
    v52 = v8;
    v54 = a4;
    v22 = v59;
    v23 = eventReceivedNotificationNamePrefix.unsafeMutableAddressor();
    object = v23->_object;
    countAndFlagsBits = v23->_countAndFlagsBits;
    v58 = object;
    v55 = 0;
    v56 = 0xE000000000000000;
    lazy protocol witness table accessor for type String and conformance String();
    v25 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
    (*(void (**)(uint64_t))(a3 + 16))(v25);
    v26 = *(_QWORD *)(a2 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v20, 1, a2) != 1)
    {
      swift_bridgeObjectRelease();
      v48 = v54;
      (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(v54, v20, a2);
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v26 + 56))(v48, 0, 1, a2);
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
    v27 = Logger.framework.unsafeMutableAddressor();
    v29 = v52;
    v28 = v53;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v53, v27, v52);
    swift_bridgeObjectRetain();
    v30 = Logger.logObject.getter();
    v31 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = swift_slowAlloc();
      v51 = v9;
      v33 = (uint8_t *)v32;
      v34 = swift_slowAlloc();
      v59 = v34;
      *(_DWORD *)v33 = 136315138;
      v50[1] = v33 + 4;
      swift_bridgeObjectRetain();
      countAndFlagsBits = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v21, &v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_215151000, v30, v31, "Event reception darwin notification was malformed: %s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199DD454](v34, -1, -1);
      MEMORY[0x2199DD454](v33, -1, -1);

      (*(void (**)(char *, uint64_t))(v51 + 8))(v53, v29);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v28, v29);
    }
    v46 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56);
    v47 = v54;
  }
  else
  {
    v35 = Logger.framework.unsafeMutableAddressor();
    v36 = v9;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, v35, v8);
    v37 = Logger.logObject.getter();
    v38 = v8;
    v39 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v37, v39))
    {
      v54 = a4;
      v40 = swift_slowAlloc();
      v52 = v38;
      v41 = (uint8_t *)v40;
      v42 = swift_slowAlloc();
      v59 = v42;
      v51 = v36;
      *(_DWORD *)v41 = 136315138;
      v43 = unknownNotificationName.unsafeMutableAddressor();
      v45 = v43->_countAndFlagsBits;
      v44 = (unint64_t)v43->_object;
      swift_bridgeObjectRetain();
      countAndFlagsBits = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v44, &v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      a4 = v54;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_215151000, v37, v39, "Event reception darwin notification was malformed: %s", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199DD454](v42, -1, -1);
      MEMORY[0x2199DD454](v41, -1, -1);

      (*(void (**)(char *, uint64_t))(v51 + 8))(v13, v52);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v36 + 8))(v13, v38);
    }
    v46 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56);
    v47 = a4;
  }
  return v46(v47, 1, 1, a2);
}

uint64_t NotificationCenterHelper.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t NotificationCenterHelper.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t NotificationCenterHelper.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t NotificationCenterHelper.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t type metadata accessor for NotificationCenterHelper()
{
  return objc_opt_self();
}

uint64_t method lookup function for NotificationCenterHelper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NotificationCenterHelper.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

unint64_t CallEvent.init(rawValue:)(unint64_t a1)
{
  return specialized CallEvent.init(rawValue:)(a1);
}

void *static CallEvent.allCases.getter()
{
  return &outlined read-only object #0 of static CallEvent.allCases.getter;
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance CallEvent@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = specialized CallEvent.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void protocol witness for static CaseIterable.allCases.getter in conformance CallEvent(_QWORD *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static CallEvent.allCases.getter;
}

unint64_t specialized CallEvent.init(rawValue:)(unint64_t result)
{
  if (result > 0xE)
    return 0;
  return result;
}

unint64_t lazy protocol witness table accessor for type [CallEvent] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [CallEvent] and conformance [A];
  if (!lazy protocol witness table cache variable for type [CallEvent] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [CallEvent]);
    result = MEMORY[0x2199DD3C4](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [CallEvent] and conformance [A]);
  }
  return result;
}

ValueMetadata *type metadata accessor for CallEvent()
{
  return &type metadata for CallEvent;
}

uint64_t CallClient.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____SRSTCallClient_delegate;
  swift_beginAccess();
  return MEMORY[0x2199DD49C](v1);
}

uint64_t CallClient.delegate.setter()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*CallClient.delegate.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____SRSTCallClient_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x2199DD49C](v5);
  return SharedClient.delegate.modify;
}

uint64_t property wrapper backing initializer of CallClient.currentState()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CallState?);
  return Published.init(initialValue:)();
}

uint64_t CallClient.currentState.getter()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t CallClient.currentState.setter()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return static Published.subscript.setter();
}

uint64_t (*CallClient.currentState.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return SharedClient.currentState.modify;
}

uint64_t key path setter for CallClient.$currentState : CallClient(uint64_t a1, _QWORD **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CallState?>.Publisher);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v8 + 16))(v7, a1);
  return (*(uint64_t (**)(char *))((*MEMORY[0x24BEE4EA0] & **a2) + 0xA8))(v7);
}

uint64_t CallClient.$currentState.getter()
{
  return SharedClient.$currentState.getter((uint64_t)&OBJC_IVAR____SRSTCallClient__currentState, &demangling cache variable for type metadata for Published<CallState?>);
}

uint64_t CallClient.$currentState.setter(uint64_t a1)
{
  return SharedClient.$currentState.setter(a1, &demangling cache variable for type metadata for Published<CallState?>.Publisher, (uint64_t)&OBJC_IVAR____SRSTCallClient__currentState, &demangling cache variable for type metadata for Published<CallState?>);
}

uint64_t (*CallClient.$currentState.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CallState?>.Publisher);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____SRSTCallClient__currentState;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CallState?>);
  Published.projectedValue.getter();
  swift_endAccess();
  return SharedClient.$currentState.modify;
}

uint64_t property wrapper backing initializer of CallClient.mostRecentEvent()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CallEvent?);
  return Published.init(initialValue:)();
}

uint64_t CallClient.mostRecentEvent.getter()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t CallClient.mostRecentEvent.setter()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return static Published.subscript.setter();
}

uint64_t (*CallClient.mostRecentEvent.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return SharedClient.currentState.modify;
}

uint64_t key path setter for CallClient.$mostRecentEvent : CallClient(uint64_t a1, _QWORD **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CallEvent?>.Publisher);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v8 + 16))(v7, a1);
  return (*(uint64_t (**)(char *))((*MEMORY[0x24BEE4EA0] & **a2) + 0xD8))(v7);
}

uint64_t CallClient.$mostRecentEvent.getter()
{
  return SharedClient.$currentState.getter((uint64_t)&OBJC_IVAR____SRSTCallClient__mostRecentEvent, &demangling cache variable for type metadata for Published<CallEvent?>);
}

uint64_t CallClient.$mostRecentEvent.setter(uint64_t a1)
{
  return SharedClient.$currentState.setter(a1, &demangling cache variable for type metadata for Published<CallEvent?>.Publisher, (uint64_t)&OBJC_IVAR____SRSTCallClient__mostRecentEvent, &demangling cache variable for type metadata for Published<CallEvent?>);
}

uint64_t (*CallClient.$mostRecentEvent.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CallEvent?>.Publisher);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____SRSTCallClient__mostRecentEvent;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CallEvent?>);
  Published.projectedValue.getter();
  swift_endAccess();
  return SharedClient.$currentState.modify;
}

uint64_t CallClient.mostRecentEventName.getter()
{
  _QWORD *v0;
  uint64_t v1;
  char v2;

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
  if ((v2 & 1) != 0)
    return 0;
  else
    return CallEvent.name.getter(v1);
}

void CallClient.dispatchEvent(_:)(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;

  type metadata accessor for NotificationCenterHelper();
  v3 = a1;
  v2 = lazy protocol witness table accessor for type CallEvent and conformance CallEvent();
  static NotificationCenterHelper.dispatch<A>(_:)((uint64_t)&v3, (uint64_t)&type metadata for CallEvent, v2);
}

id CallClient.__deallocating_deinit()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  objc_class *v12;
  objc_super v14;

  v1 = v0;
  v2 = type metadata accessor for Logger();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*((_BYTE *)v1 + OBJC_IVAR____SRSTCallClient_stopped) & 1) == 0)
  {
    type metadata accessor for CallClient();
    lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type CallClient and conformance CallClient, (uint64_t (*)(uint64_t))type metadata accessor for CallClient, (uint64_t)&protocol conformance descriptor for CallClient);
    static Clientele.remove<A>(_:)((uint64_t)v1);
    v7 = Logger.framework.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
    v8 = Logger.logObject.getter();
    v9 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_215151000, v8, v9, "Deinit called for CallClient", v10, 2u);
      MEMORY[0x2199DD454](v10, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    type metadata accessor for OS_dispatch_queue();
    *(_QWORD *)(swift_allocObject() + 16) = v1;
    v11 = v1;
    static OS_dispatch_queue.executeOnMain<A>(_:)((void (*)(void))partial apply for closure #1 in SharedClient.deinit);
    swift_release();
  }
  v12 = (objc_class *)type metadata accessor for CallClient();
  v14.receiver = v1;
  v14.super_class = v12;
  return objc_msgSendSuper2(&v14, sel_dealloc);
}

void @objc closure #1 in variable initialization expression of static CallClient.handleStateTransititionNotification(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;

  v10 = a1;
  v8 = a3;
  v9 = a5;
  specialized closure #1 in variable initialization expression of static CallClient.handleStateTransititionNotification(a2, (uint64_t)a3);

}

uint64_t (**CallClient.handleStateTransititionNotification.unsafeMutableAddressor())()
{
  return static CallClient.handleStateTransititionNotification;
}

uint64_t (*static CallClient.handleStateTransititionNotification.getter())()
{
  swift_beginAccess();
  return static CallClient.handleStateTransititionNotification[0];
}

uint64_t static CallClient.handleStateTransititionNotification.setter(uint64_t (*a1)())
{
  uint64_t result;

  result = swift_beginAccess();
  static CallClient.handleStateTransititionNotification[0] = a1;
  return result;
}

uint64_t (*static CallClient.handleStateTransititionNotification.modify())()
{
  swift_beginAccess();
  return static SharedClient.handleStateTransititionNotification.modify;
}

void @objc closure #1 in variable initialization expression of static CallClient.handleEventNotification(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;

  v10 = a1;
  v8 = a3;
  v9 = a5;
  specialized closure #1 in variable initialization expression of static CallClient.handleEventNotification(a2, (uint64_t)a3);

}

uint64_t type metadata accessor for CallClient()
{
  uint64_t result;

  result = type metadata singleton initialization cache for CallClient;
  if (!type metadata singleton initialization cache for CallClient)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_215166BFC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t (**CallClient.handleEventNotification.unsafeMutableAddressor())()
{
  return &static CallClient.handleEventNotification;
}

uint64_t (*static CallClient.handleEventNotification.getter())()
{
  swift_beginAccess();
  return static CallClient.handleEventNotification;
}

uint64_t static CallClient.handleEventNotification.setter(uint64_t (*a1)())
{
  uint64_t result;

  result = swift_beginAccess();
  static CallClient.handleEventNotification = a1;
  return result;
}

uint64_t (*static CallClient.handleEventNotification.modify())()
{
  swift_beginAccess();
  return static SharedClient.handleEventNotification.modify;
}

id CallClient.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CallClient.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  objc_class *v18;
  id v19;
  id v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  int64_t v35;
  unint64_t v36;
  uint64_t v37;
  CFNotificationCenterRef value;
  void (__cdecl *v39)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef);
  __CFNotificationCenter *v40;
  id v41;
  __CFString *v42;
  uint64_t v43;
  uint64_t *v44;
  CFNotificationCenterRef_optional *v45;
  unint64_t v46;
  uint64_t v47;
  CFNotificationCenterRef v48;
  void (__cdecl *v49)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef);
  __CFNotificationCenter *v50;
  __CFString *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  id v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int64_t v66;
  _QWORD *v67;
  _QWORD v68[3];
  ValueMetadata *v69;
  uint64_t v70;
  uint64_t v71;
  objc_super v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;

  v1 = type metadata accessor for Logger();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v3);
  v61 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CallEvent?>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CallState?>);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  v15 = &v0[OBJC_IVAR____SRSTCallClient__currentState];
  v73 = 0;
  v16 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CallState?);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v15, v14, v10);
  v17 = &v16[OBJC_IVAR____SRSTCallClient__mostRecentEvent];
  v73 = 0;
  LOBYTE(v74) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CallEvent?);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v17, v9, v5);
  v16[OBJC_IVAR____SRSTCallClient_stopped] = 0;

  v18 = (objc_class *)type metadata accessor for CallClient();
  v72.receiver = v16;
  v72.super_class = v18;
  v19 = objc_msgSendSuper2(&v72, sel_init);
  lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type CallClient and conformance CallClient, (uint64_t (*)(uint64_t))type metadata accessor for CallClient, (uint64_t)&protocol conformance descriptor for CallClient);
  v20 = v19;
  v21 = (const void *)static Clientele.add<A>(_:)((uint64_t)v20, (uint64_t)v18);
  v22 = *CallState.allStates.unsafeMutableAddressor();
  v63 = v1;
  v62 = v2;
  v60 = v20;
  if ((v22 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for CallState();
    lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type CallState and conformance NSObject, (uint64_t (*)(uint64_t))type metadata accessor for CallState, MEMORY[0x24BEE5BD8]);
    Set.Iterator.init(_cocoa:)();
    v22 = v73;
    v67 = v74;
    v23 = v75;
    v24 = v76;
    v25 = v77;
  }
  else
  {
    v26 = -1 << *(_BYTE *)(v22 + 32);
    v27 = *(_QWORD *)(v22 + 56);
    v67 = (_QWORD *)(v22 + 56);
    v23 = ~v26;
    v28 = -v26;
    if (v28 < 64)
      v29 = ~(-1 << v28);
    else
      v29 = -1;
    v25 = v29 & v27;
    swift_bridgeObjectRetain();
    v24 = 0;
  }
  v65 = v22 & 0x7FFFFFFFFFFFFFFFLL;
  v59 = v23;
  v66 = (unint64_t)(v23 + 64) >> 6;
  v64 = MEMORY[0x24BEE4AD0] + 8;
  if (v22 < 0)
    goto LABEL_10;
  while (1)
  {
    if (v25)
    {
      v30 = (v25 - 1) & v25;
      v31 = __clz(__rbit64(v25)) | (v24 << 6);
      v32 = v24;
      goto LABEL_27;
    }
    v35 = v24 + 1;
    if (__OFADD__(v24, 1))
    {
      __break(1u);
      return;
    }
    if (v35 >= v66)
      goto LABEL_30;
    v36 = v67[v35];
    v32 = v24 + 1;
    if (!v36)
    {
      v32 = v24 + 2;
      if (v24 + 2 >= v66)
        goto LABEL_30;
      v36 = v67[v32];
      if (!v36)
      {
        v32 = v24 + 3;
        if (v24 + 3 >= v66)
          goto LABEL_30;
        v36 = v67[v32];
        if (!v36)
        {
          v32 = v24 + 4;
          if (v24 + 4 >= v66)
            goto LABEL_30;
          v36 = v67[v32];
          if (!v36)
            break;
        }
      }
    }
LABEL_26:
    v30 = (v36 - 1) & v36;
    v31 = __clz(__rbit64(v36)) + (v32 << 6);
LABEL_27:
    v34 = *(id *)(*(_QWORD *)(v22 + 48) + 8 * v31);
    if (!v34)
      goto LABEL_30;
    while (1)
    {
      value = darwinNotificationCenter.unsafeMutableAddressor()->value;
      swift_beginAccess();
      v39 = (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))static CallClient.handleStateTransititionNotification[0];
      type metadata accessor for NotificationCenterHelper();
      v69 = (ValueMetadata *)type metadata accessor for CallState();
      v70 = lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type CallState and conformance CallState, (uint64_t (*)(uint64_t))type metadata accessor for CallState, (uint64_t)&protocol conformance descriptor for CallState);
      v68[0] = v34;
      v40 = value;
      v41 = v34;
      v42 = (__CFString *)static NotificationCenterHelper.notifcationName(for:)(v68);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v68);
      CFNotificationCenterAddObserver(v40, v21, v39, v42, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      v24 = v32;
      v25 = v30;
      if ((v22 & 0x8000000000000000) == 0)
        break;
LABEL_10:
      v33 = __CocoaSet.Iterator.next()();
      if (v33)
      {
        v71 = v33;
        type metadata accessor for CallState();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v34 = (id)v68[0];
        swift_unknownObjectRelease();
        v32 = v24;
        v30 = v25;
        if (v34)
          continue;
      }
      goto LABEL_30;
    }
  }
  v37 = v24 + 5;
  while (v66 != v37)
  {
    v36 = v67[v37++];
    if (v36)
    {
      v32 = v37 - 1;
      goto LABEL_26;
    }
  }
LABEL_30:
  outlined consume of Set<SharedState>.Iterator._Variant();
  v67 = static CallEvent.allCases.getter();
  v43 = v67[2];
  if (v43)
  {
    type metadata accessor for NotificationCenterHelper();
    v44 = v67 + 4;
    v45 = darwinNotificationCenter.unsafeMutableAddressor();
    swift_beginAccess();
    v46 = lazy protocol witness table accessor for type CallEvent and conformance CallEvent();
    do
    {
      v47 = *v44++;
      v48 = v45->value;
      v49 = (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))static CallClient.handleEventNotification;
      v69 = &type metadata for CallEvent;
      v70 = v46;
      v68[0] = v47;
      v50 = v48;
      v51 = (__CFString *)static NotificationCenterHelper.notifcationName(for:)(v68);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v68);
      CFNotificationCenterAddObserver(v50, v21, v49, v51, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      --v43;
    }
    while (v43);
  }
  swift_bridgeObjectRelease();
  v52 = Logger.framework.unsafeMutableAddressor();
  v53 = v62;
  v54 = v61;
  v55 = v63;
  (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v61, v52, v63);
  v56 = Logger.logObject.getter();
  v57 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v56, v57))
  {
    v58 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v58 = 0;
    _os_log_impl(&dword_215151000, v56, v57, "CallClient added Darwin observers", v58, 2u);
    MEMORY[0x2199DD454](v58, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v53 + 8))(v54, v55);
}

Swift::Void __swiftcall CallClient.stopClient()()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _BYTE *v12;
  uint64_t v13;

  v1 = v0;
  v2 = type metadata accessor for Logger();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = OBJC_IVAR____SRSTCallClient_stopped;
  if ((v1[OBJC_IVAR____SRSTCallClient_stopped] & 1) == 0)
  {
    v8 = Logger.framework.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v8, v2);
    v9 = Logger.logObject.getter();
    v10 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_215151000, v9, v10, "#SiriStates stopping client", v11, 2u);
      MEMORY[0x2199DD454](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    v1[v7] = 1;
    type metadata accessor for CallClient();
    lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type CallClient and conformance CallClient, (uint64_t (*)(uint64_t))type metadata accessor for CallClient, (uint64_t)&protocol conformance descriptor for CallClient);
    static Clientele.remove<A>(_:)((uint64_t)v1);
    type metadata accessor for OS_dispatch_queue();
    *(_QWORD *)(swift_allocObject() + 16) = v1;
    v12 = v1;
    static OS_dispatch_queue.executeOnMain<A>(_:)((void (*)(void))partial apply for closure #1 in SharedClient.deinit);
    swift_release();
  }
}

uint64_t associated type witness table accessor for ClientProtocol.StateType : StateProtocol in CallClient()
{
  return lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type CallState and conformance CallState, (uint64_t (*)(uint64_t))type metadata accessor for CallState, (uint64_t)&protocol conformance descriptor for CallState);
}

uint64_t ObjC metadata update function for CallClient()
{
  return type metadata accessor for CallClient();
}

void type metadata completion function for CallClient()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for Published<SharedState?>(319, &lazy cache variable for type metadata for Published<CallState?>, &demangling cache variable for type metadata for CallState?);
  if (v0 <= 0x3F)
  {
    type metadata accessor for Published<SharedState?>(319, &lazy cache variable for type metadata for Published<CallEvent?>, &demangling cache variable for type metadata for CallEvent?);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for CallClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CallClient.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of CallClient.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of CallClient.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of CallClient.currentState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of CallClient.currentState.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of CallClient.currentState.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of CallClient.$currentState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of CallClient.$currentState.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of CallClient.$currentState.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of CallClient.mostRecentEvent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of CallClient.mostRecentEvent.setter(uint64_t a1, char a2)
{
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v2) + 0xC0))(a1, a2 & 1);
}

uint64_t dispatch thunk of CallClient.mostRecentEvent.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of CallClient.$mostRecentEvent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of CallClient.$mostRecentEvent.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of CallClient.$mostRecentEvent.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of CallClient.mostRecentEventName.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of CallClient.dispatchEvent(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of CallClient.stopClient()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

void specialized closure #1 in variable initialization expression of static CallClient.handleStateTransititionNotification(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  NSObject *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  char *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t *v31;
  void (*v32)(char *, uint64_t);
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  NSObject *v36;
  uint64_t (*v37)(void *);
  NSObject *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  NSObject *v44;
  _QWORD v45[2];
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t, uint64_t);
  uint64_t v52;
  void *v53;

  v4 = type metadata accessor for Logger();
  v5 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4, v6);
  v9 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7, v10);
  v12 = (char *)v45 - v11;
  type metadata accessor for NotificationCenterHelper();
  v13 = (char *)type metadata accessor for CallState();
  v14 = lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type CallState and conformance CallState, (uint64_t (*)(uint64_t))type metadata accessor for CallState, (uint64_t)&protocol conformance descriptor for CallState);
  static NotificationCenterHelper.state<A>(from:)(a2, v13, v14, (uint64_t)&v53);
  v15 = v53;
  if (v53)
  {
    v16 = Logger.framework.unsafeMutableAddressor();
    v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v50 = v16;
    v51 = v17;
    ((void (*)(char *))v17)(v12);
    v18 = v15;
    v19 = Logger.logObject.getter();
    v20 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v19, v20))
    {
      v47 = v5;
      v21 = swift_slowAlloc();
      v49 = v4;
      v22 = (uint8_t *)v21;
      v46 = swift_slowAlloc();
      v53 = (void *)v46;
      v48 = v9;
      *(_DWORD *)v22 = 136315138;
      v45[1] = v22 + 4;
      v23 = (char *)v18 + OBJC_IVAR____SRSTCallState_name;
      v24 = v15;
      v25 = a1;
      v26 = v18;
      v28 = *(uint64_t *)((char *)&v18->isa + OBJC_IVAR____SRSTCallState_name);
      v27 = *((_QWORD *)v23 + 1);
      swift_bridgeObjectRetain();
      v29 = v28;
      v18 = v26;
      a1 = v25;
      v15 = v24;
      v52 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v29, v27, (uint64_t *)&v53);
      v9 = v48;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_215151000, v19, v20, "CallClient received valid state transition: %s", v22, 0xCu);
      v30 = v46;
      swift_arrayDestroy();
      MEMORY[0x2199DD454](v30, -1, -1);
      v31 = v22;
      v4 = v49;
      MEMORY[0x2199DD454](v31, -1, -1);

      v32 = *(void (**)(char *, uint64_t))(v47 + 8);
    }
    else
    {

      v32 = *(void (**)(char *, uint64_t))(v5 + 8);
    }
    v32(v12, v4);
    type metadata accessor for CallClient();
    lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type CallClient and conformance CallClient, (uint64_t (*)(uint64_t))type metadata accessor for CallClient, (uint64_t)&protocol conformance descriptor for CallClient);
    v33 = static Clientele.contains<A>(_:)(a1);
    if (v33)
    {
      v34 = v33;
      v35 = (_QWORD *)MEMORY[0x24BEE4EA0];
      v36 = v18;
      v37 = *(uint64_t (**)(void *))((*MEMORY[0x24BEE4EA0] & *v33) + 0x90);
      v38 = v36;
      v39 = v37(v15);
      v40 = (void *)(*(uint64_t (**)(uint64_t))((*v35 & *v34) + 0x70))(v39);
      if (v40)
      {
        objc_msgSend(v40, sel_stateMachineWithClient_didTransitionToState_, v34, v38);

        swift_unknownObjectRelease();
      }
      else
      {

      }
    }
    else
    {
      v51(v9, v50, v4);
      v41 = Logger.logObject.getter();
      v42 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v43 = 0;
        _os_log_impl(&dword_215151000, v41, v42, "Observer for darwin callback handler not found", v43, 2u);
        MEMORY[0x2199DD454](v43, -1, -1);
        v44 = v41;
      }
      else
      {
        v44 = v18;
        v18 = v41;
      }

      v32(v9, v4);
    }
  }
}

void specialized closure #1 in variable initialization expression of static CallClient.handleEventNotification(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  void (*v28)(char *, uint64_t);
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t, uint64_t);
  void *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;

  v4 = type metadata accessor for Logger();
  v5 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4, v6);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7, v10);
  v12 = (char *)&v39 - v11;
  type metadata accessor for NotificationCenterHelper();
  v13 = lazy protocol witness table accessor for type CallEvent and conformance CallEvent();
  static NotificationCenterHelper.event<A>(from:)(a2, (uint64_t)&type metadata for CallEvent, v13, (uint64_t)&v45);
  if ((v46 & 1) == 0)
  {
    v14 = v45;
    v15 = Logger.framework.unsafeMutableAddressor();
    v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v16(v12, v15, v4);
    v17 = Logger.logObject.getter();
    v18 = static os_log_type_t.info.getter();
    v19 = os_log_type_enabled(v17, v18);
    v43 = v14;
    if (v19)
    {
      v20 = swift_slowAlloc();
      v40 = v16;
      v21 = (uint8_t *)v20;
      v22 = swift_slowAlloc();
      v39 = v15;
      v23 = v22;
      v45 = v22;
      v41 = a1;
      v42 = v9;
      *(_DWORD *)v21 = 136315138;
      v24 = CallEvent.name.getter(v14);
      v44 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v45);
      a1 = v41;
      v9 = v42;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_215151000, v17, v18, "CallClient received valid event reception: %s", v21, 0xCu);
      swift_arrayDestroy();
      v26 = v23;
      v15 = v39;
      MEMORY[0x2199DD454](v26, -1, -1);
      v27 = v21;
      v16 = v40;
      MEMORY[0x2199DD454](v27, -1, -1);
    }

    v28 = *(void (**)(char *, uint64_t))(v5 + 8);
    v28(v12, v4);
    type metadata accessor for CallClient();
    lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type CallClient and conformance CallClient, (uint64_t (*)(uint64_t))type metadata accessor for CallClient, (uint64_t)&protocol conformance descriptor for CallClient);
    v29 = static Clientele.contains<A>(_:)(a1);
    if (v29)
    {
      v30 = v29;
      v31 = (_QWORD *)MEMORY[0x24BEE4EA0];
      v32 = v43;
      v33 = (*(uint64_t (**)(uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v29) + 0xC0))(v43, 0);
      v34 = (void *)(*(uint64_t (**)(uint64_t))((*v31 & *v30) + 0x70))(v33);
      if (v34)
      {
        v35 = v34;
        if ((objc_msgSend(v34, sel_respondsToSelector_, sel_stateMachineWithClient_didReceiveEvent_) & 1) != 0)
          objc_msgSend(v35, sel_stateMachineWithClient_didReceiveEvent_, v30, v32);
        swift_unknownObjectRelease();
      }

    }
    else
    {
      v16(v9, v15, v4);
      v36 = Logger.logObject.getter();
      v37 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v36, v37))
      {
        v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v38 = 0;
        _os_log_impl(&dword_215151000, v36, v37, "Observer for darwin callback handler not found", v38, 2u);
        MEMORY[0x2199DD454](v38, -1, -1);
      }

      v28(v9, v4);
    }
  }
}

uint64_t one-time initialization function for framework()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.framework);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.framework);
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.framework.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for framework != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static Logger.framework);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static Logger.framework.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (one-time initialization token for framework != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.framework);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
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

id one-time initialization function for attending()
{
  void *v0;
  id v1;
  id result;

  type metadata accessor for State();
  v0 = (void *)*State.abstract.unsafeMutableAddressor();
  v1 = v0;
  result = State.__allocating_init(name:parent:eventHandler:)(0x6E69646E65747441, 0xE900000000000067, v0, (uint64_t)implicit closure #1 in variable initialization expression of static State.attending, 0);
  static State.attending = (uint64_t)result;
  return result;
}

void *implicit closure #1 in variable initialization expression of static State.attending(uint64_t a1)
{
  void *v1;
  id v2;

  if (a1)
    return 0;
  v1 = *(void **)State.analyzing.unsafeMutableAddressor();
  v2 = v1;
  return v1;
}

uint64_t *State.attending.unsafeMutableAddressor()
{
  if (one-time initialization token for attending != -1)
    swift_once();
  return &static State.attending;
}

id static State.attending.getter()
{
  if (one-time initialization token for attending != -1)
    swift_once();
  return (id)static State.attending;
}

id one-time initialization function for understanding()
{
  void *v0;
  id v1;
  id result;

  type metadata accessor for State();
  v0 = (void *)*State.listening.unsafeMutableAddressor();
  v1 = v0;
  result = State.__allocating_init(name:parent:eventHandler:)(0x6174737265646E55, 0xED0000676E69646ELL, v0, (uint64_t)implicit closure #1 in variable initialization expression of static State.understanding, 0);
  static State.understanding = (uint64_t)result;
  return result;
}

id implicit closure #1 in variable initialization expression of static State.understanding(uint64_t a1)
{
  id v1;
  id *v2;
  id v3;

  v1 = 0;
  switch(a1)
  {
    case 6:
      v2 = (id *)State.processing.unsafeMutableAddressor();
      goto LABEL_7;
    case 7:
      v2 = (id *)State.postResponse.unsafeMutableAddressor();
      goto LABEL_7;
    case 9:
      v2 = (id *)State.responding.unsafeMutableAddressor();
      goto LABEL_7;
    case 10:
      v2 = (id *)State.resting.unsafeMutableAddressor();
      goto LABEL_7;
    case 13:
      v2 = (id *)State.available.unsafeMutableAddressor();
LABEL_7:
      v1 = *v2;
      v3 = *v2;
      break;
    default:
      return v1;
  }
  return v1;
}

uint64_t *State.understanding.unsafeMutableAddressor()
{
  if (one-time initialization token for understanding != -1)
    swift_once();
  return &static State.understanding;
}

id static State.understanding.getter()
{
  if (one-time initialization token for understanding != -1)
    swift_once();
  return (id)static State.understanding;
}

uint64_t one-time initialization function for sharedLogger()
{
  id v0;
  uint64_t v1;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedStream);
  type metadata accessor for InstrumentationManager();
  swift_allocObject();
  v1 = specialized InstrumentationManager.init(_:)((uint64_t)v0);
  result = swift_unknownObjectRelease();
  static InstrumentationManager.sharedLogger = v1;
  return result;
}

uint64_t *InstrumentationManager.sharedLogger.unsafeMutableAddressor()
{
  if (one-time initialization token for sharedLogger != -1)
    swift_once();
  return &static InstrumentationManager.sharedLogger;
}

uint64_t static InstrumentationManager.sharedLogger.getter()
{
  if (one-time initialization token for sharedLogger != -1)
    swift_once();
  return swift_retain();
}

void *InstrumentationManager.kSRUIFPreferencesDefaultDomain.unsafeMutableAddressor()
{
  return &static InstrumentationManager.kSRUIFPreferencesDefaultDomain;
}

unint64_t static InstrumentationManager.kSRUIFPreferencesDefaultDomain.getter()
{
  return 0xD000000000000019;
}

void *InstrumentationManager.kSRUIFLastStoredUUIDTurnIdentifier.unsafeMutableAddressor()
{
  return &static InstrumentationManager.kSRUIFLastStoredUUIDTurnIdentifier;
}

unint64_t static InstrumentationManager.kSRUIFLastStoredUUIDTurnIdentifier.getter()
{
  return 0xD00000000000001DLL;
}

uint64_t key path getter for InstrumentationManager.currentSessionIdentifier : InstrumentationManager(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 112))();
}

uint64_t key path setter for InstrumentationManager.currentSessionIdentifier : InstrumentationManager(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = type metadata accessor for UUID();
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v8 + 16))(v7, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 120))(v7);
}

uint64_t InstrumentationManager.currentSessionIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_currentSessionIdentifier;
  swift_beginAccess();
  v4 = type metadata accessor for UUID();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t InstrumentationManager.currentSessionIdentifier.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_currentSessionIdentifier;
  swift_beginAccess();
  v4 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*InstrumentationManager.currentSessionIdentifier.modify())()
{
  swift_beginAccess();
  return static SharedClient.handleEventNotification.modify;
}

uint64_t InstrumentationManager.stream.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t InstrumentationManager.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2;

  swift_allocObject();
  v2 = specialized InstrumentationManager.init(_:)(a1);
  swift_unknownObjectRelease();
  return v2;
}

uint64_t InstrumentationManager.init(_:)(uint64_t a1)
{
  uint64_t v1;

  v1 = specialized InstrumentationManager.init(_:)(a1);
  swift_unknownObjectRelease();
  return v1;
}

void InstrumentationManager.logStateTransition<A>(previousState:currentState:event:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t AssociatedTypeWitness;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t);
  NSObject *v42;
  os_log_type_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  uint64_t v50;
  unint64_t v51;
  void (*v52)(char *, uint64_t);
  char *v53;
  uint64_t v54;
  unint64_t v55;
  os_log_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t);
  void (*v60)(char *, uint64_t, uint64_t);
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  os_log_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(char *, uint64_t, uint64_t);
  char *v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  char *v86;
  char *v87;
  char *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94[4];

  v12 = *(_QWORD *)(a5 - 8);
  v13 = MEMORY[0x24BDAC7A8](a1, a2);
  v84 = (char *)&v72 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13, v15);
  v88 = (char *)&v72 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16, v18);
  v86 = (char *)&v72 - v20;
  MEMORY[0x24BDAC7A8](v19, v21);
  v23 = (char *)&v72 - v22;
  v24 = type metadata accessor for Logger();
  v90 = *(_QWORD *)(v24 - 8);
  v91 = v24;
  v26 = MEMORY[0x24BDAC7A8](v24, v25);
  v89 = (char *)&v72 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26, v28);
  v87 = (char *)&v72 - v29;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v32 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v31);
  v82 = (char *)&v72 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v32, v34);
  v81 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 16);
  v81((char *)&v72 - v36, a3, AssociatedTypeWitness);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for any RawRepresentable<Self.RawRepresentable.RawValue == String>);
  v80 = AssociatedTypeWitness;
  v37 = swift_dynamicCast();
  v79 = v6;
  v83 = a3;
  v85 = a2;
  if (v37)
  {
    __swift_project_boxed_opaque_existential_1(v94, v94[3]);
    dispatch thunk of RawRepresentable.rawValue.getter();
    v39 = v92;
    v38 = v93;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v94);
    v40 = Logger.framework.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v90 + 16))(v87, v40, v91);
    v41 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    v78 = a1;
    v41(v23, a1, a5);
    v41(v86, a2, a5);
    swift_bridgeObjectRetain();
    v42 = Logger.logObject.getter();
    v43 = static os_log_type_t.debug.getter();
    v44 = v43;
    if (os_log_type_enabled(v42, v43))
    {
      v45 = swift_slowAlloc();
      v75 = v44;
      v46 = v45;
      v76 = swift_slowAlloc();
      v94[0] = v76;
      *(_DWORD *)v46 = 136315906;
      v74 = v42;
      v47 = _typeName(_:qualified:)();
      v73 = v39;
      v92 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v47, v48, v94);
      v77 = v12;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v46 + 12) = 2080;
      v49 = *(uint64_t (**)(uint64_t, uint64_t))(a6 + 56);
      v50 = v49(a5, a6);
      v92 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v50, v51, v94);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v52 = *(void (**)(char *, uint64_t))(v77 + 8);
      v52(v23, a5);
      *(_WORD *)(v46 + 22) = 2080;
      v53 = v86;
      v54 = v49(a5, a6);
      v92 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v54, v55, v94);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v52(v53, a5);
      *(_WORD *)(v46 + 32) = 2080;
      swift_bridgeObjectRetain();
      v92 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v73, v38, v94);
      v12 = v77;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      v56 = v74;
      _os_log_impl(&dword_215151000, v74, (os_log_type_t)v75, "%s transition from=%s to=%s event=%s", (uint8_t *)v46, 0x2Au);
      v57 = v76;
      swift_arrayDestroy();
      MEMORY[0x2199DD454](v57, -1, -1);
      MEMORY[0x2199DD454](v46, -1, -1);

    }
    else
    {
      v59 = *(void (**)(char *, uint64_t))(v12 + 8);
      v59(v23, a5);
      v59(v86, a5);

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v90 + 8))(v87, v91);
    v58 = v78;
  }
  else
  {
    v58 = a1;
  }
  v60 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v60(v88, v58, a5);
  type metadata accessor for State();
  if ((swift_dynamicCast() & 1) != 0)
  {
    v61 = (void *)v94[0];
    v60(v84, v85, a5);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v62 = (void *)v94[0];
      v81(v82, v83, v80);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v63 = v94[0];
        v64 = mach_absolute_time();
        InstrumentationManager.doLogStateTransition(previousState:currentState:event:timestamp:)(v61, v62, v63, v64);

        return;
      }

    }
  }
  v65 = Logger.framework.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v90 + 16))(v89, v65, v91);
  v66 = Logger.logObject.getter();
  v67 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v66, v67))
  {
    v68 = (uint8_t *)swift_slowAlloc();
    v69 = swift_slowAlloc();
    v94[0] = v69;
    *(_DWORD *)v68 = 136315138;
    v70 = _typeName(_:qualified:)();
    v92 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v70, v71, v94);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_215151000, v66, v67, "No SELF state transition support added for type=%s", v68, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199DD454](v69, -1, -1);
    MEMORY[0x2199DD454](v68, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v90 + 8))(v89, v91);
}

uint64_t InstrumentationManager.doLogStateTransition(previousState:currentState:event:timestamp:)(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  void *v48;
  uint8_t *v49;
  uint8_t *v50;
  uint64_t v51;
  void *v52;
  _QWORD *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  char *v61;
  char *v62;
  _QWORD v64[2];
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t aBlock[7];

  v5 = v4;
  v71 = a3;
  v73 = a1;
  v8 = type metadata accessor for DispatchWorkItemFlags();
  v78 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v9);
  v77 = (char *)v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DispatchQoS();
  v75 = *(_QWORD *)(v11 - 8);
  v76 = v11;
  MEMORY[0x24BDAC7A8](v11, v12);
  v74 = (char *)v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x24BDAC7A8](v14, v15);
  v70 = (char *)v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for Logger();
  v18 = *(_QWORD *)(v17 - 8);
  v20 = MEMORY[0x24BDAC7A8](v17, v19);
  v22 = (char *)v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20, v23);
  v25 = (char *)v64 - v24;
  v72 = swift_allocBox();
  v27 = v26;
  v28 = type metadata accessor for UUID();
  v29 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56);
  v69 = v27;
  v29(v27, 1, 1, v28);
  v30 = *(void **)(v5 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_sruifUserDefaults);
  if (v30
    && (v31 = (void *)MEMORY[0x2199DCD04](0xD00000000000001DLL, 0x800000021516EE70),
        v32 = objc_msgSend(v30, sel_stringForKey_, v31),
        v31,
        v32))
  {
    v68 = v8;
    v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v35 = v34;

    v36 = Logger.framework.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v25, v36, v17);
    swift_bridgeObjectRetain_n();
    v37 = Logger.logObject.getter();
    v38 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = swift_slowAlloc();
      v66 = a4;
      v40 = (uint8_t *)v39;
      v41 = swift_slowAlloc();
      v67 = a2;
      v65 = v41;
      aBlock[0] = v41;
      *(_DWORD *)v40 = 136315138;
      v64[1] = v40 + 4;
      swift_bridgeObjectRetain();
      v79 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v33, v35, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_215151000, v37, v38, "#SRST RequestLinking turnID retrieved turn=%s", v40, 0xCu);
      v42 = v65;
      swift_arrayDestroy();
      a2 = v67;
      MEMORY[0x2199DD454](v42, -1, -1);
      v43 = v40;
      a4 = v66;
      MEMORY[0x2199DD454](v43, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v25, v17);
    v51 = (uint64_t)v70;
    UUID.init(uuidString:)();
    swift_bridgeObjectRelease();
    outlined assign with take of UUID?(v51, v69);
    v8 = v68;
  }
  else
  {
    v44 = Logger.framework.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v22, v44, v17);
    v45 = Logger.logObject.getter();
    v46 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = a4;
      v48 = a2;
      v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_215151000, v45, v46, "#SRST RequestLinking turnID not retrieved turn=nil", v49, 2u);
      v50 = v49;
      a2 = v48;
      a4 = v47;
      MEMORY[0x2199DD454](v50, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v18 + 8))(v22, v17);
  }
  v52 = *(void **)(v5 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_queue);
  v53 = (_QWORD *)swift_allocObject();
  v55 = v72;
  v54 = v73;
  v53[2] = v73;
  v53[3] = a2;
  v56 = v71;
  v53[4] = v5;
  v53[5] = v56;
  v53[6] = v55;
  v53[7] = a4;
  aBlock[4] = (uint64_t)partial apply for closure #1 in InstrumentationManager.doLogStateTransition(previousState:currentState:event:timestamp:);
  aBlock[5] = (uint64_t)v53;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = (uint64_t)&block_descriptor_0;
  v57 = _Block_copy(aBlock);
  v58 = v52;
  v59 = v54;
  v60 = a2;
  swift_retain();
  swift_retain();
  v61 = v74;
  static DispatchQoS.unspecified.getter();
  v79 = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  v62 = v77;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x2199DCE00](0, v61, v62, v57);
  _Block_release(v57);

  (*(void (**)(char *, uint64_t))(v78 + 8))(v62, v8);
  (*(void (**)(char *, uint64_t))(v75 + 8))(v61, v76);
  swift_release();
  return swift_release();
}

void closure #1 in InstrumentationManager.doLogStateTransition(previousState:currentState:event:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD, _QWORD), uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
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
  char *v35;
  uint64_t *v36;
  id v37;
  char v38;
  id v39;
  char v40;
  id v41;
  char v42;
  id v43;
  char v44;
  id v45;
  char v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  id v58;
  id v59;
  id v60;
  Class isa;
  id v62;
  uint64_t v63;
  void (*v64)(char *, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t (*v67)(char *, uint64_t, uint64_t);
  uint64_t v68;
  void *v69;
  void (*v70)(char *, char *, uint64_t);
  void *v71;
  Class v72;
  id v73;
  int v74;
  void (*v75)(char *, uint64_t);
  id v76;
  Class v77;
  id v78;
  id v79;
  Class v80;
  id v81;
  id v82;
  uint64_t v83;
  void *v84;
  id v85;
  void *v86;
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  uint64_t v93;
  NSObject *v94;
  os_log_type_t v95;
  NSObject *v96;
  BOOL v97;
  uint8_t *v98;
  uint8_t *v99;
  uint64_t v100;
  unint64_t v101;
  void (*v102)(char *, uint64_t);
  NSObject *v103;
  uint64_t v104;
  void **p_weak_ivar_lyt;
  _QWORD *v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  NSObject *v110;
  os_log_type_t v111;
  _BOOL4 v112;
  uint8_t *v113;
  uint8_t *v114;
  uint64_t v115;
  void (*v116)(char *, uint64_t);
  id v117;
  _DWORD *v118;
  uint64_t v119;
  id v120;
  void *v121;
  id v122;
  char *v123;
  char *v124;
  char *v125;
  char *v126;
  uint64_t v127;
  id v128;
  unint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;

  v127 = a6;
  v129 = (unint64_t)a4;
  v135 = a3;
  v6 = type metadata accessor for Logger();
  v133 = *(_QWORD *)(v6 - 8);
  v134 = v6;
  v8 = MEMORY[0x24BDAC7A8](v6, v7);
  v10 = (char *)&v118 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v8, v11);
  v125 = (char *)&v118 - v13;
  MEMORY[0x24BDAC7A8](v12, v14);
  v124 = (char *)&v118 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  v18 = MEMORY[0x24BDAC7A8](v16, v17);
  v20 = (char *)&v118 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18, v21);
  v23 = (char *)&v118 - v22;
  v132 = type metadata accessor for UUID();
  v130 = *(_QWORD *)(v132 - 8);
  v25 = MEMORY[0x24BDAC7A8](v132, v24);
  v123 = (char *)&v118 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v25, v27);
  v126 = (char *)&v118 - v29;
  v31 = MEMORY[0x24BDAC7A8](v28, v30);
  v131 = (char *)&v118 - v32;
  MEMORY[0x24BDAC7A8](v31, v33);
  v35 = (char *)&v118 - v34;
  v128 = (id)swift_projectBox();
  type metadata accessor for State();
  v36 = State.disabled.unsafeMutableAddressor();
  v37 = (id)*v36;
  v38 = static NSObject.== infix(_:_:)();

  if ((v38 & 1) != 0)
    goto LABEL_6;
  v39 = (id)*v36;
  v40 = static NSObject.== infix(_:_:)();

  if ((v40 & 1) != 0)
    goto LABEL_6;
  v41 = (id)*State.available.unsafeMutableAddressor();
  v42 = static NSObject.== infix(_:_:)();

  if ((v42 & 1) != 0)
  {
    v43 = (id)*State.analyzing.unsafeMutableAddressor();
    v44 = static NSObject.== infix(_:_:)();

    if ((v44 & 1) != 0
      || (v45 = (id)*State.responding.unsafeMutableAddressor(),
          v46 = static NSObject.== infix(_:_:)(),
          v45,
          (v46 & 1) != 0))
    {
LABEL_6:
      UUID.init()();
      (*(void (**)(char *))(*(_QWORD *)v135 + 120))(v35);
    }
  }
  v47 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95CC0]), sel_init);
  if (v47)
  {
    v48 = v47;
    v49 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95CB0]), sel_init);
    if (v49)
    {
      v50 = v49;
      v122 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95CB8]), sel_init);
      if (v122)
      {
        objc_msgSend(v48, sel_setPreviousState_, specialized InstrumentationManager.mapStateToStateEnum(state:)());
        objc_msgSend(v48, sel_setCurrentState_, specialized InstrumentationManager.mapStateToStateEnum(state:)());
        v121 = v50;
        if (v129 > 0x10)
          v51 = 0;
        else
          v51 = dword_21516DF44[v129];
        v58 = v122;
        v59 = objc_msgSend(v48, sel_setReason_, v51);
        (*(void (**)(id))(*(_QWORD *)v135 + 112))(v59);
        v60 = objc_allocWithZone(MEMORY[0x24BE95C78]);
        isa = UUID._bridgeToObjectiveC()().super.isa;
        v62 = objc_msgSend(v60, sel_initWithNSUUID_, isa);

        v63 = v130;
        v64 = *(void (**)(char *, uint64_t))(v130 + 8);
        v65 = v132;
        v64(v35, v132);
        objc_msgSend(v58, sel_setSessionId_, v62);

        v66 = (uint64_t)v128;
        swift_beginAccess();
        outlined init with copy of UUID?(v66, (uint64_t)v23);
        v67 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v63 + 48);
        if (v67(v23, 1, v65) == 1)
        {
          outlined destroy of UUID?((uint64_t)v23);
          v68 = v127;
          v69 = v121;
        }
        else
        {
          v129 = (unint64_t)v64;
          v70 = *(void (**)(char *, char *, uint64_t))(v63 + 32);
          v70(v131, v23, v65);
          v71 = (void *)objc_opt_self();
          v72 = UUID._bridgeToObjectiveC()().super.isa;
          v73 = objc_msgSend(v71, sel_derivedIdentifierForComponentName_fromSourceIdentifier_, 20, v72);

          if (v73)
          {
            static UUID._unconditionallyBridgeFromObjectiveC(_:)();

            v70(v20, v35, v65);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v63 + 56))(v20, 0, 1, v65);
            v74 = v67(v20, 1, v65);
            v69 = v121;
            v75 = (void (*)(char *, uint64_t))v129;
            if (v74 != 1)
            {
              v70(v126, v20, v65);
              v76 = objc_allocWithZone(MEMORY[0x24BE95C78]);
              v77 = UUID._bridgeToObjectiveC()().super.isa;
              v78 = objc_msgSend(v76, sel_initWithNSUUID_, v77);

              v79 = objc_allocWithZone(MEMORY[0x24BE95C78]);
              v80 = UUID._bridgeToObjectiveC()().super.isa;
              v81 = objc_msgSend(v79, sel_initWithNSUUID_, v80);

              v82 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B60]), sel_init);
              v83 = v134;
              v128 = v78;
              if (v82)
              {
                v84 = v82;
                v85 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B68]), sel_init);
                if (v85)
                {
                  v86 = v85;
                  v87 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B68]), sel_init);
                  if (v87)
                  {
                    v88 = v87;
                    objc_msgSend(v86, sel_setUuid_, v78);
                    objc_msgSend(v86, sel_setComponent_, 20);
                    objc_msgSend(v84, sel_setSource_, v86);
                    objc_msgSend(v88, sel_setUuid_, v81);
                    objc_msgSend(v88, sel_setComponent_, 2);
                    v125 = v88;
                    objc_msgSend(v84, sel_setTarget_, v88);
                    v89 = Logger.framework.unsafeMutableAddressor();
                    v90 = v133;
                    v91 = v124;
                    (*(void (**)(char *, uint64_t, uint64_t))(v133 + 16))(v124, v89, v83);
                    v92 = v123;
                    v93 = v132;
                    (*(void (**)(char *, char *, uint64_t))(v130 + 16))(v123, v126, v132);
                    v94 = Logger.logObject.getter();
                    v95 = static os_log_type_t.info.getter();
                    v96 = v94;
                    LODWORD(v130) = v95;
                    v97 = os_log_type_enabled(v94, v95);
                    v120 = v81;
                    if (v97)
                    {
                      v98 = (uint8_t *)swift_slowAlloc();
                      v119 = swift_slowAlloc();
                      v137 = v119;
                      *(_DWORD *)v98 = 136315138;
                      v118 = v98 + 4;
                      v99 = v98;
                      lazy protocol witness table accessor for type SharedClient and conformance SharedClient((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
                      v100 = dispatch thunk of CustomStringConvertible.description.getter();
                      v136 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v100, v101, &v137);
                      UnsafeMutableRawBufferPointer.copyMemory(from:)();
                      swift_bridgeObjectRelease();
                      v102 = (void (*)(char *, uint64_t))v129;
                      ((void (*)(char *, uint64_t))v129)(v92, v93);
                      v103 = v96;
                      _os_log_impl(&dword_215151000, v96, (os_log_type_t)v130, "#SRST RequestLinking setting srstId=%s", v99, 0xCu);
                      v104 = v119;
                      swift_arrayDestroy();
                      MEMORY[0x2199DD454](v104, -1, -1);
                      MEMORY[0x2199DD454](v99, -1, -1);

                      (*(void (**)(char *, uint64_t))(v133 + 8))(v124, v134);
                    }
                    else
                    {
                      v102 = (void (*)(char *, uint64_t))v129;
                      ((void (*)(char *, uint64_t))v129)(v92, v93);

                      (*(void (**)(char *, uint64_t))(v90 + 8))(v91, v134);
                    }
                    v68 = v127;
                    v117 = v128;
                    v58 = v122;
                    objc_msgSend(v122, sel_setSrstId_, v128);
                    v106 = &unk_254DB2000;
                    p_weak_ivar_lyt = &SRSTCallServer__metaData.weak_ivar_lyt;
                    objc_msgSend(*(id *)(v135 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_stream), sel_emitMessage_timestamp_, v84, v68);

                    v102(v126, v93);
                    v102(v131, v93);
                    v69 = v121;
                    goto LABEL_31;
                  }

                }
                else
                {
                  v86 = v84;
                }

                v69 = v121;
              }
              v107 = Logger.framework.unsafeMutableAddressor();
              v108 = v133;
              v109 = v125;
              (*(void (**)(char *, uint64_t, uint64_t))(v133 + 16))(v125, v107, v83);
              v110 = Logger.logObject.getter();
              v111 = static os_log_type_t.error.getter();
              v112 = os_log_type_enabled(v110, v111);
              v68 = v127;
              v106 = (_QWORD *)&unk_254DB2000;
              if (v112)
              {
                v113 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)v113 = 0;
                _os_log_impl(&dword_215151000, v110, v111, "#SRST RequestLinking Failed to create RequestLink event for SiriStates", v113, 2u);
                v114 = v113;
                v69 = v121;
                MEMORY[0x2199DD454](v114, -1, -1);
              }

              (*(void (**)(char *, uint64_t))(v108 + 8))(v109, v83);
              v115 = v132;
              v116 = (void (*)(char *, uint64_t))v129;
              ((void (*)(char *, uint64_t))v129)(v126, v132);
              v116(v131, v115);
              v58 = v122;
              p_weak_ivar_lyt = (void **)(&SRSTCallServer__metaData + 56);
              goto LABEL_31;
            }
          }
          else
          {
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v63 + 56))(v20, 1, 1, v65);
            v69 = v121;
            v75 = (void (*)(char *, uint64_t))v129;
          }
          v75(v131, v65);
          outlined destroy of UUID?((uint64_t)v20);
          v68 = v127;
          v58 = v122;
        }
        p_weak_ivar_lyt = &SRSTCallServer__metaData.weak_ivar_lyt;
        v106 = &unk_254DB2000;
LABEL_31:
        objc_msgSend(v69, sel_setEventMetadata_, v58);
        objc_msgSend(v69, sel_setStateTransitionEvent_, v48);
        objc_msgSend(*(id *)(v135 + v106[211]), (SEL)p_weak_ivar_lyt[390], v69, v68);

        return;
      }

    }
    else
    {
      v50 = v48;
    }

  }
  v52 = Logger.framework.unsafeMutableAddressor();
  v54 = v133;
  v53 = v134;
  (*(void (**)(char *, uint64_t, uint64_t))(v133 + 16))(v10, v52, v134);
  v55 = Logger.logObject.getter();
  v56 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v55, v56))
  {
    v57 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v57 = 0;
    _os_log_impl(&dword_215151000, v55, v56, "#SRST RequestLinking unable to init SSSchemaProvisionalSiriStateTransitionEvent", v57, 2u);
    MEMORY[0x2199DD454](v57, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v54 + 8))(v10, v53);
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> ()(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t InstrumentationManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_currentSessionIdentifier;
  v2 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  swift_unknownObjectRelease();
  return v0;
}

uint64_t InstrumentationManager.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_currentSessionIdentifier;
  v2 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t specialized InstrumentationManager.init(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = v1;
  v4 = type metadata accessor for UUID();
  v23 = *(_QWORD *)(v4 - 8);
  v24 = v4;
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v8 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22, v9);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for OS_dispatch_queue.Attributes();
  v13 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v12, v14);
  v15 = type metadata accessor for DispatchQoS();
  MEMORY[0x24BDAC7A8](v15, v16);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_stream) = a1;
  v21[1] = type metadata accessor for OS_dispatch_queue();
  swift_unknownObjectRetain();
  static DispatchQoS.utility.getter();
  v25 = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type SharedClient and conformance SharedClient(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, v13, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], &demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v11, *MEMORY[0x24BEE5750], v22);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_queue) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  UUID.init()();
  (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v2 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_currentSessionIdentifier, v7, v24);
  v17 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v18 = (void *)MEMORY[0x2199DCD04](0xD000000000000019, 0x800000021516EE50);
  v19 = objc_msgSend(v17, sel_initWithSuiteName_, v18);

  *(_QWORD *)(v2 + OBJC_IVAR____TtC10SiriStates22InstrumentationManager_sruifUserDefaults) = v19;
  return v2;
}

uint64_t ObjC metadata update function for InstrumentationManager()
{
  return type metadata accessor for InstrumentationManager();
}

uint64_t type metadata accessor for InstrumentationManager()
{
  uint64_t result;

  result = type metadata singleton initialization cache for InstrumentationManager;
  if (!type metadata singleton initialization cache for InstrumentationManager)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for InstrumentationManager()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for InstrumentationManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InstrumentationManager.currentSessionIdentifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of InstrumentationManager.currentSessionIdentifier.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of InstrumentationManager.currentSessionIdentifier.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of InstrumentationManager.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of InstrumentationManager.logStateTransition<A>(previousState:currentState:event:timestamp:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t sub_21516A448()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in InstrumentationManager.doLogStateTransition(previousState:currentState:event:timestamp:)()
{
  uint64_t v0;

  closure #1 in InstrumentationManager.doLogStateTransition(previousState:currentState:event:timestamp:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void (**)(_QWORD, _QWORD))(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
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

uint64_t outlined assign with take of UUID?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t specialized InstrumentationManager.mapStateToStateEnum(state:)()
{
  id v0;
  char v1;
  id v3;
  char v4;
  id v5;
  char v6;
  id v7;
  char v8;
  id v9;
  char v10;
  id v11;
  char v12;
  id v13;
  char v14;
  id v15;
  char v16;
  id v17;
  char v18;

  swift_getObjectType();
  v0 = (id)*State.abstract.unsafeMutableAddressor();
  v1 = static NSObject.== infix(_:_:)();

  if ((v1 & 1) != 0)
    return 0;
  v3 = (id)*State.analyzing.unsafeMutableAddressor();
  v4 = static NSObject.== infix(_:_:)();

  if ((v4 & 1) != 0)
    return 3;
  v5 = (id)*State.available.unsafeMutableAddressor();
  v6 = static NSObject.== infix(_:_:)();

  if ((v6 & 1) != 0)
    return 2;
  v7 = (id)*State.disabled.unsafeMutableAddressor();
  v8 = static NSObject.== infix(_:_:)();

  if ((v8 & 1) != 0)
    return 1;
  v9 = (id)*State.postResponse.unsafeMutableAddressor();
  v10 = static NSObject.== infix(_:_:)();

  if ((v10 & 1) != 0)
    return 8;
  v11 = (id)*State.processing.unsafeMutableAddressor();
  v12 = static NSObject.== infix(_:_:)();

  if ((v12 & 1) != 0)
    return 5;
  v13 = (id)*State.responding.unsafeMutableAddressor();
  v14 = static NSObject.== infix(_:_:)();

  if ((v14 & 1) != 0)
    return 6;
  v15 = (id)*State.resting.unsafeMutableAddressor();
  v16 = static NSObject.== infix(_:_:)();

  if ((v16 & 1) != 0)
    return 7;
  v17 = (id)*State.understanding.unsafeMutableAddressor();
  v18 = static NSObject.== infix(_:_:)();

  if ((v18 & 1) != 0)
    return 4;
  else
    return 0;
}

uint64_t outlined init with copy of UUID?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of UUID?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199DD3C4](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

id one-time initialization function for processing()
{
  void *v0;
  id v1;
  id result;

  type metadata accessor for State();
  v0 = (void *)*State.abstract.unsafeMutableAddressor();
  v1 = v0;
  result = State.__allocating_init(name:parent:eventHandler:)(0x69737365636F7250, 0xEA0000000000676ELL, v0, (uint64_t)implicit closure #1 in variable initialization expression of static State.processing, 0);
  static State.processing = (uint64_t)result;
  return result;
}

id implicit closure #1 in variable initialization expression of static State.processing(uint64_t a1)
{
  id v1;
  id *v2;
  id v3;

  v1 = 0;
  switch(a1)
  {
    case 0:
      v2 = (id *)State.analyzing.unsafeMutableAddressor();
      goto LABEL_6;
    case 7:
      v2 = (id *)State.postResponse.unsafeMutableAddressor();
      goto LABEL_6;
    case 9:
      v2 = (id *)State.responding.unsafeMutableAddressor();
      goto LABEL_6;
    case 13:
      v2 = (id *)State.available.unsafeMutableAddressor();
LABEL_6:
      v1 = *v2;
      v3 = *v2;
      break;
    default:
      return v1;
  }
  return v1;
}

uint64_t *State.processing.unsafeMutableAddressor()
{
  if (one-time initialization token for processing != -1)
    swift_once();
  return &static State.processing;
}

id static State.processing.getter()
{
  if (one-time initialization token for processing != -1)
    swift_once();
  return (id)static State.processing;
}

uint64_t *CallState.allStates.unsafeMutableAddressor()
{
  if (one-time initialization token for allStates != -1)
    swift_once();
  return &static CallState.allStates;
}

uint64_t static CallState.allStates.getter()
{
  if (one-time initialization token for allStates != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

unint64_t Event.init(rawValue:)(unint64_t a1)
{
  return specialized Event.init(rawValue:)(a1);
}

void *static Event.allCases.getter()
{
  return &outlined read-only object #0 of static Event.allCases.getter;
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance Event@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = specialized Event.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void protocol witness for static CaseIterable.allCases.getter in conformance Event(_QWORD *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static Event.allCases.getter;
}

unint64_t specialized Event.init(rawValue:)(unint64_t result)
{
  if (result > 0x10)
    return 0;
  return result;
}

unint64_t lazy protocol witness table accessor for type [Event] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [Event] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Event] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Event]);
    result = MEMORY[0x2199DD3C4](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [Event] and conformance [A]);
  }
  return result;
}

ValueMetadata *type metadata accessor for Event()
{
  return &type metadata for Event;
}

uint64_t one-time initialization function for lock()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  static Clientele.lock = result;
  return result;
}

void one-time initialization function for pointers()
{
  static Clientele.pointers = MEMORY[0x24BEE4B08];
}

uint64_t static Clientele.add<A>(_:)(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v6;

  if (one-time initialization token for lock != -1)
    a1 = swift_once();
  MEMORY[0x24BDAC7A8](a1, a2);
  v3 = v2 + 4;
  os_unfair_lock_lock(v2 + 4);
  partial apply for closure #1 in static Clientele.add<A>(_:)(&v6);
  v4 = v6;
  os_unfair_lock_unlock(v3);
  return v4;
}

uint64_t partial apply for closure #1 in static Clientele.add<A>(_:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *(_QWORD *)(v1 + 32);
  if (one-time initialization token for pointers != -1)
    swift_once();
  swift_beginAccess();
  specialized Set._Variant.insert(_:)(&v5, v3);
  result = swift_endAccess();
  *a1 = v3;
  return result;
}

void *static Clientele.contains<A>(_:)(void *a1)
{
  uint64_t v2;
  os_unfair_lock_s *v3;
  void *v4;
  id v5;

  if (one-time initialization token for lock != -1)
    swift_once();
  v2 = static Clientele.lock;
  type metadata accessor for Optional();
  v3 = (os_unfair_lock_s *)(v2 + ((*(unsigned int *)(*(_QWORD *)v2 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v3);
  if (a1)
  {
    if (one-time initialization token for pointers != -1)
      swift_once();
    swift_beginAccess();
    v4 = 0;
    if (specialized Set.contains(_:)((uint64_t)a1, static Clientele.pointers))
    {
      v5 = a1;
      v4 = a1;
    }
  }
  else
  {
    v4 = 0;
  }
  os_unfair_lock_unlock(v3);
  return v4;
}

BOOL specialized Set.contains(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 result;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  v4 = static Hasher._hash(seed:_:)();
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = v4 & ~v5;
  v7 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(a2 + 48);
  if (*(_QWORD *)(v8 + 8 * v6) == a1)
    return 1;
  v9 = ~v5;
  v10 = (v6 + 1) & v9;
  if (((*(_QWORD *)(v7 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
    return 0;
  do
  {
    v11 = *(_QWORD *)(v8 + 8 * v10);
    result = v11 == a1;
    if (v11 == a1)
      break;
    v10 = (v10 + 1) & v9;
  }
  while (((*(_QWORD *)(v7 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  return result;
}

void static Clientele.remove<A>(_:)(uint64_t a1)
{
  os_unfair_lock_s *v2;

  if (one-time initialization token for lock != -1)
    swift_once();
  v2 = (os_unfair_lock_s *)(static Clientele.lock + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(static Clientele.lock + 16));
  if (one-time initialization token for pointers != -1)
    swift_once();
  swift_beginAccess();
  specialized Set._Variant.remove(_:)(a1);
  swift_endAccess();
  os_unfair_lock_unlock(v2);
}

uint64_t specialized Set._Variant.insert(_:)(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;

  v3 = v2;
  v6 = *v2;
  v7 = static Hasher._hash(seed:_:)();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v3;
    *v3 = 0x8000000000000000;
    specialized _NativeSet.insertNew(_:at:isUnique:)(a2, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v14;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v10 = *(_QWORD *)(v6 + 48);
  if (*(_QWORD *)(v10 + 8 * v9) != a2)
  {
    v11 = ~v8;
    do
    {
      v9 = (v9 + 1) & v11;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_QWORD *)(v10 + 8 * v9) != a2);
  }
  result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<UnsafeMutableRawPointer>);
  result = static _SetStorage.resize(original:capacity:move:)();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (uint64_t *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    v26 = -1 << v7;
    v27 = v1;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v28 = 1 << *(_BYTE *)(v2 + 32);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10)
          goto LABEL_33;
        v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_33;
          v16 = v6[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v10)
              goto LABEL_33;
            v16 = v6[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                if (v28 >= 64)
                  bzero((void *)(v2 + 56), 8 * v10);
                else
                  *v6 = v26;
                v1 = v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v10)
                    goto LABEL_33;
                  v16 = v6[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
      result = static Hasher._hash(seed:_:)();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t specialized _NativeSet.insertNew(_:at:isUnique:)(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)specialized _NativeSet.copy()();
      goto LABEL_14;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  v8 = *v3;
  result = static Hasher._hash(seed:_:)();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_QWORD *)(v10 + 8 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

void *specialized _NativeSet.copy()()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<UnsafeMutableRawPointer>);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.copyAndResize(capacity:)()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<UnsafeMutableRawPointer>);
  result = static _SetStorage.resize(original:capacity:move:)();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v26 = v1;
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v10)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v10)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
    result = static Hasher._hash(seed:_:)();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v26;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t specialized Set._Variant.remove(_:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v2 = v1;
  v4 = *v2;
  v5 = static Hasher._hash(seed:_:)();
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = v5 & ~v6;
  if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(v4 + 48);
  if (*(_QWORD *)(v8 + 8 * v7) != a1)
  {
    v9 = ~v6;
    do
    {
      v7 = (v7 + 1) & v9;
      if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
        return 0;
    }
    while (*(_QWORD *)(v8 + 8 * v7) != a1);
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *v2;
  v14 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    specialized _NativeSet.copy()();
    v11 = v14;
  }
  v12 = *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * v7);
  specialized _NativeSet._delete(at:)(v7);
  *v2 = v14;
  swift_bridgeObjectRelease();
  return v12;
}

unint64_t specialized _NativeSet._delete(at:)(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = _HashTable.previousHole(before:)();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(_QWORD *)(v3 + 48);
        v11 = (_QWORD *)(v10 + 8 * v6);
        v12 = static Hasher._hash(seed:_:)() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v2 >= v12)
          {
LABEL_16:
            v15 = (_QWORD *)(v10 + 8 * v2);
            if (v2 != v6 || (v2 = v6, v15 >= v11 + 1))
            {
              *v15 = *v11;
              v2 = v6;
            }
          }
        }
        else if (v12 >= v9 || v2 >= v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v16 = *(_QWORD *)(v3 + 16);
  v17 = __OFSUB__(v16, 1);
  v18 = v16 - 1;
  if (v17)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v18;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

ValueMetadata *type metadata accessor for Clientele()
{
  return &type metadata for Clientele;
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

uint64_t UUID.init(uuidString:)()
{
  return MEMORY[0x24BDCE998]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x24BDCE9D0]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x24BDCEA58]();
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

uint64_t Published.init(initialValue:)()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t Published.projectedValue.getter()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t Published.projectedValue.setter()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t static Published.subscript.modify()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t static Published.subscript.getter()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t static Published.subscript.setter()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t type metadata accessor for Published.Publisher()
{
  return MEMORY[0x24BDB9ED8]();
}

uint64_t type metadata accessor for Published()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t static DispatchQoS.utility.getter()
{
  return MEMORY[0x24BEE54E8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t Dictionary.init()()
{
  return MEMORY[0x24BEE01A8]();
}

uint64_t Dictionary.count.getter()
{
  return MEMORY[0x24BEE0370]();
}

uint64_t type metadata accessor for Dictionary.Values()
{
  return MEMORY[0x24BEE03B0]();
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x24BEE04B0]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t Sequence.first(where:)()
{
  return MEMORY[0x24BEE0E98]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x24BEE0FD8]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t Set.count.getter()
{
  return MEMORY[0x24BEE1628]();
}

uint64_t Set.remove(_:)()
{
  return MEMORY[0x24BEE1658]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t type metadata accessor for Set()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x24BEE57A0]();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x24BEE5BB8](seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t StringProtocol.hash.getter()
{
  return MEMORY[0x24BDD05F0]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE24D0]();
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

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

{
  return MEMORY[0x24BEE2F48]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
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

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x24BEE42D0]();
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

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x24BEE4A98]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x24BDBC080](center, observer);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
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

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
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

