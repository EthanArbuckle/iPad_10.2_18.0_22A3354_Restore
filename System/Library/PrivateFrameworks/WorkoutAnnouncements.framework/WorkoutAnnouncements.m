uint64_t variable initialization expression of VoiceFeedbackAnnouncementFlow.data()
{
  return 0;
}

uint64_t variable initialization expression of VoiceFeedbackAnnouncementFlow.flowProvider@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  static OutputPublisherFactory.makeOutputPublisherAsync()();
  type metadata accessor for ResponseFactory();
  swift_allocObject();
  ResponseFactory.init()();
  v2 = type metadata accessor for PatternFlowProvider();
  swift_allocObject();
  result = PatternFlowProvider.init(outputPublisher:responseGenerator:)();
  v4 = MEMORY[0x24BE96AC8];
  a1[3] = v2;
  a1[4] = v4;
  *a1 = result;
  return result;
}

uint64_t VoiceFeedbackAnnouncementFlow.init(data:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  static OutputPublisherFactory.makeOutputPublisherAsync()();
  type metadata accessor for ResponseFactory();
  swift_allocObject();
  ResponseFactory.init()();
  v4 = type metadata accessor for PatternFlowProvider();
  swift_allocObject();
  result = PatternFlowProvider.init(outputPublisher:responseGenerator:)();
  v6 = MEMORY[0x24BE96AC8];
  a2[4] = v4;
  a2[5] = v6;
  *a2 = a1;
  a2[1] = result;
  return result;
}

uint64_t VoiceFeedbackAnnouncementFlow.on(input:)()
{
  return 1;
}

uint64_t VoiceFeedbackAnnouncementFlow.execute(completion:)()
{
  lazy protocol witness table accessor for type VoiceFeedbackAnnouncementFlow and conformance VoiceFeedbackAnnouncementFlow();
  return Flow.deferToExecuteAsync(_:)();
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackAnnouncementFlow and conformance VoiceFeedbackAnnouncementFlow()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackAnnouncementFlow and conformance VoiceFeedbackAnnouncementFlow;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackAnnouncementFlow and conformance VoiceFeedbackAnnouncementFlow)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackAnnouncementFlow, &type metadata for VoiceFeedbackAnnouncementFlow);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackAnnouncementFlow and conformance VoiceFeedbackAnnouncementFlow);
  }
  return result;
}

uint64_t VoiceFeedbackAnnouncementFlow.execute()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[42] = a1;
  v2[43] = v1;
  type metadata accessor for DialogPhase();
  v2[44] = swift_task_alloc();
  v3 = type metadata accessor for OutputGenerationManifest();
  v2[45] = v3;
  v2[46] = *(_QWORD *)(v3 - 8);
  v2[47] = swift_task_alloc();
  v4 = type metadata accessor for Logger();
  v2[48] = v4;
  v2[49] = *(_QWORD *)(v4 - 8);
  v2[50] = swift_task_alloc();
  v2[51] = swift_task_alloc();
  v2[52] = swift_task_alloc();
  v2[53] = swift_task_alloc();
  v2[54] = swift_task_alloc();
  v2[55] = swift_task_alloc();
  v2[56] = swift_task_alloc();
  v2[57] = swift_task_alloc();
  return swift_task_switch();
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 496) = a1;
  *(_QWORD *)(v3 + 504) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t VoiceFeedbackAnnouncementFlow.execute()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  unint64_t v37;
  char v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  os_log_type_t v44;
  uint8_t *v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t, uint64_t);
  NSObject *v52;
  os_log_type_t v53;
  _BOOL4 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  void (*v62)(uint64_t, uint64_t);
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;

  v1 = **(_QWORD **)(v0 + 344);
  if (!v1)
  {
    v25 = *(_QWORD *)(v0 + 392);
    v24 = *(_QWORD *)(v0 + 400);
    v26 = *(_QWORD *)(v0 + 384);
    v27 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v24, v27, v26);
    v28 = Logger.logObject.getter();
    v29 = static os_log_type_t.error.getter();
    v30 = os_log_type_enabled(v28, v29);
    v32 = *(_QWORD *)(v0 + 392);
    v31 = *(_QWORD *)(v0 + 400);
    v33 = *(_QWORD *)(v0 + 384);
    if (v30)
    {
      v34 = (uint8_t *)swift_slowAlloc();
      v35 = swift_slowAlloc();
      v66 = v35;
      *(_DWORD *)v34 = 136315138;
      *(_QWORD *)(v0 + 312) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001DLL, 0x800000024A61AAD0, &v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_24A5E6000, v28, v29, "No data was given to %s. Exiting silently.", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD15374](v35, -1, -1);
      MEMORY[0x24BD15374](v34, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
    goto LABEL_19;
  }
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!*(_QWORD *)(v1 + 16) || (v4 = specialized __RawDictionaryStorage.find<A>(_:)(v2, v3), (v5 & 1) == 0))
  {
    *(_OWORD *)(v0 + 48) = 0u;
    *(_OWORD *)(v0 + 64) = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  outlined init with copy of Any(*(_QWORD *)(v1 + 56) + 32 * v4, v0 + 48);
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 72))
  {
LABEL_11:
    outlined destroy of Any?(v0 + 48, &demangling cache variable for type metadata for Any?);
    goto LABEL_12;
  }
  v6 = (uint64_t *)(v0 + 288);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    v16 = *(_QWORD *)(v0 + 408);
    v17 = *(_QWORD *)(v0 + 384);
    v18 = *(_QWORD *)(v0 + 392);
    v19 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v16, v19, v17);
    v12 = Logger.logObject.getter();
    v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_24A5E6000, v12, v20, "There was synchronousBurstIndex present in the data. Exiting silently.", v21, 2u);
      MEMORY[0x24BD15374](v21, -1, -1);
    }
    v15 = *(_QWORD *)(v0 + 408);
    goto LABEL_15;
  }
  v7 = *v6;
  if (*v6)
  {
    v8 = *(_QWORD *)(v0 + 456);
    v9 = *(_QWORD *)(v0 + 384);
    v10 = *(_QWORD *)(v0 + 392);
    v11 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, v11, v9);
    v12 = Logger.logObject.getter();
    v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v14 = 134217984;
      *(_QWORD *)(v0 + 280) = v7;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_24A5E6000, v12, v13, "Supressing announcement because synchronousBurstIndex = %ld.", v14, 0xCu);
      MEMORY[0x24BD15374](v14, -1, -1);
    }
    v15 = *(_QWORD *)(v0 + 456);
LABEL_15:
    v22 = *(_QWORD *)(v0 + 384);
    v23 = *(_QWORD *)(v0 + 392);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v15, v22);
LABEL_19:
    static ExecuteResponse.complete()();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  if (!*(_QWORD *)(v1 + 16)
    || (v37 = specialized __RawDictionaryStorage.find<A>(_:)(0x7079547472656C61, 0xE900000000000065), (v38 & 1) == 0)
    || (outlined init with copy of Any(*(_QWORD *)(v1 + 56) + 32 * v37, v0 + 16), (swift_dynamicCast() & 1) == 0)
    || (v39 = specialized VoiceFeedbackAlertType.init(rawValue:)(*(_QWORD *)(v0 + 272)), v39 == 25))
  {
    v40 = *(_QWORD *)(v0 + 416);
    v41 = *(_QWORD *)(v0 + 384);
    v42 = *(_QWORD *)(v0 + 392);
    v43 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16))(v40, v43, v41);
    v12 = Logger.logObject.getter();
    v44 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v45 = 0;
      _os_log_impl(&dword_24A5E6000, v12, v44, "There was no valid alert type present in the data. Exiting silently.", v45, 2u);
      MEMORY[0x24BD15374](v45, -1, -1);
    }
    v15 = *(_QWORD *)(v0 + 416);
    goto LABEL_15;
  }
  v46 = v39;
  v47 = *(_QWORD *)(v0 + 448);
  v48 = *(_QWORD *)(v0 + 384);
  v49 = *(_QWORD *)(v0 + 392);
  v50 = Logger.workout.unsafeMutableAddressor();
  *(_QWORD *)(v0 + 464) = v50;
  swift_beginAccess();
  v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16);
  *(_QWORD *)(v0 + 472) = v51;
  v51(v47, v50, v48);
  v52 = Logger.logObject.getter();
  v53 = static os_log_type_t.debug.getter();
  v54 = os_log_type_enabled(v52, v53);
  v55 = *(_QWORD *)(v0 + 448);
  v56 = *(_QWORD *)(v0 + 384);
  v57 = *(_QWORD *)(v0 + 392);
  if (v54)
  {
    v65 = *(_QWORD *)(v0 + 448);
    v58 = (uint8_t *)swift_slowAlloc();
    v64 = v56;
    v59 = swift_slowAlloc();
    v66 = v59;
    *(_DWORD *)v58 = 136315138;
    *(_BYTE *)(v0 + 512) = v46;
    v60 = String.init<A>(describing:)();
    *(_QWORD *)(v0 + 328) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v60, v61, &v66);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A5E6000, v52, v53, "Trying to execute dialog for alert type: %s", v58, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v59, -1, -1);
    MEMORY[0x24BD15374](v58, -1, -1);

    v62 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
    v62(v65, v64);
  }
  else
  {

    v62 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
    v62(v55, v56);
  }
  *(_QWORD *)(v0 + 480) = v62;
  v63 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 488) = v63;
  *v63 = v0;
  v63[1] = VoiceFeedbackAnnouncementFlow.execute();
  return pattern(for:data:)(v46, v1);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  void *v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  uint64_t v42;
  os_log_type_t v43;
  NSObject *log;
  uint64_t v45;
  uint64_t v46;

  v1 = *(void **)(v0 + 496);
  v2 = *(_QWORD *)(v0 + 464);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 472);
  v4 = *(_QWORD *)(v0 + 440);
  v5 = *(_QWORD *)(v0 + 384);
  static DialogPhase.completion.getter();
  OutputGenerationManifest.init(dialogPhase:_:)();
  OutputGenerationManifest.canUseServerTTS.setter();
  swift_beginAccess();
  v3(v4, v2, v5);
  v6 = v1;
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.debug.getter();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(void **)(v0 + 496);
  if (!v9)
  {
    v28 = *(void (**)(uint64_t, uint64_t))(v0 + 480);
    v29 = *(_QWORD *)(v0 + 440);
    v30 = *(_QWORD *)(v0 + 384);

    v28(v29, v30);
LABEL_17:
    v37 = *(void **)(v0 + 496);
    v39 = *(_QWORD *)(v0 + 368);
    v38 = *(_QWORD *)(v0 + 376);
    v40 = *(_QWORD *)(v0 + 360);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 344) + 8), *(_QWORD *)(*(_QWORD *)(v0 + 344) + 32));
    dispatch thunk of PatternFlowProviding.makeResponseFlow(patternExecutionResult:outputGenerationManifest:)();
    static ExecuteResponse.complete(next:)();
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v40);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v11 = (uint8_t *)swift_slowAlloc();
  v12 = swift_slowAlloc();
  v45 = v12;
  *(_DWORD *)v11 = 136315138;
  v13 = objc_msgSend(v10, sel_dialog);
  type metadata accessor for PatternExecutionDialog();
  v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v14 >> 62)
  {
    swift_bridgeObjectRetain();
    v15 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  log = v7;
  v43 = v8;
  v42 = v12;
  if (!v15)
  {
    swift_bridgeObjectRelease();
    v18 = MEMORY[0x24BEE4AF8];
LABEL_16:
    v31 = *(void **)(v0 + 496);
    v41 = *(void (**)(uint64_t, uint64_t))(v0 + 480);
    v32 = *(_QWORD *)(v0 + 440);
    v33 = *(_QWORD *)(v0 + 384);
    v34 = MEMORY[0x24BD14D44](v18, MEMORY[0x24BEE0D00]);
    v36 = v35;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 320) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v34, v36, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24A5E6000, log, v43, "Dialogs: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v42, -1, -1);
    MEMORY[0x24BD15374](v11, -1, -1);

    v41(v32, v33);
    goto LABEL_17;
  }
  v46 = MEMORY[0x24BEE4AF8];
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v15 & ~(v15 >> 63), 0);
  if ((v15 & 0x8000000000000000) == 0)
  {
    v17 = 0;
    v18 = v46;
    do
    {
      if ((v14 & 0xC000000000000001) != 0)
        v19 = (id)MEMORY[0x24BD14DC8](v17, v14);
      else
        v19 = *(id *)(v14 + 8 * v17 + 32);
      v20 = v19;
      v21 = objc_msgSend(v19, sel_fullSpeak);
      v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v24 = v23;

      v46 = v18;
      v26 = *(_QWORD *)(v18 + 16);
      v25 = *(_QWORD *)(v18 + 24);
      if (v26 >= v25 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v25 > 1, v26 + 1, 1);
        v18 = v46;
      }
      ++v17;
      *(_QWORD *)(v18 + 16) = v26 + 1;
      v27 = v18 + 16 * v26;
      *(_QWORD *)(v27 + 32) = v22;
      *(_QWORD *)(v27 + 40) = v24;
    }
    while (v15 != v17);
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;

  v1 = *(void **)(v0 + 504);
  v3 = *(_QWORD *)(v0 + 464);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 472);
  v4 = *(_QWORD *)(v0 + 432);
  v5 = *(_QWORD *)(v0 + 384);
  swift_beginAccess();
  v2(v4, v3, v5);
  v6 = v1;
  v7 = v1;
  v8 = Logger.logObject.getter();
  v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = *(void **)(v0 + 504);
    v31 = *(_QWORD *)(v0 + 432);
    v32 = *(void (**)(uint64_t, uint64_t))(v0 + 480);
    v30 = *(_QWORD *)(v0 + 384);
    v11 = swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    v33 = swift_slowAlloc();
    v13 = v33;
    *(_DWORD *)v11 = 136315394;
    *(_QWORD *)(v0 + 296) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001DLL, 0x800000024A61AAD0, &v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v11 + 12) = 2112;
    v14 = v10;
    v15 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 304) = v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v12 = v15;
    MEMORY[0x24BD15248](v10);
    MEMORY[0x24BD15248](v10);
    _os_log_impl(&dword_24A5E6000, v8, v9, "%s caught an error: %@", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v12, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v13, -1, -1);
    MEMORY[0x24BD15374](v11, -1, -1);

    v32(v31, v30);
  }
  else
  {
    v16 = *(_QWORD *)(v0 + 504);
    v17 = *(void (**)(uint64_t, uint64_t))(v0 + 480);
    v18 = *(_QWORD *)(v0 + 432);
    v19 = *(_QWORD *)(v0 + 384);
    MEMORY[0x24BD15248](v16);
    MEMORY[0x24BD15248](v16);

    v17(v18, v19);
  }
  v20 = *(_QWORD *)(v0 + 464);
  v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 472);
  v22 = *(_QWORD *)(v0 + 424);
  v23 = *(_QWORD *)(v0 + 384);
  swift_beginAccess();
  v21(v22, v20, v23);
  v24 = Logger.logObject.getter();
  v25 = static os_log_type_t.error.getter();
  v26 = os_log_type_enabled(v24, v25);
  v27 = *(_QWORD *)(v0 + 504);
  if (v26)
  {
    v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v28 = 0;
    _os_log_impl(&dword_24A5E6000, v24, v25, "Could not execute any pattern for data. Exiting silently.", v28, 2u);
    MEMORY[0x24BD15374](v28, -1, -1);

    MEMORY[0x24BD15248](v27);
  }
  else
  {
    MEMORY[0x24BD15248](*(_QWORD *)(v0 + 504));

  }
  (*(void (**)(_QWORD, _QWORD))(v0 + 480))(*(_QWORD *)(v0 + 424), *(_QWORD *)(v0 + 384));
  static ExecuteResponse.complete()();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t pattern(for:data:)(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 1584) = a2;
  *(_BYTE *)(v2 + 210) = a1;
  v3 = type metadata accessor for Logger();
  *(_QWORD *)(v2 + 1592) = v3;
  *(_QWORD *)(v2 + 1600) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 1608) = swift_task_alloc();
  type metadata accessor for CATOption();
  *(_QWORD *)(v2 + 1616) = swift_task_alloc();
  return swift_task_switch();
}

void pattern(for:data:)()
{
  __asm { BR              X10 }
}

uint64_t sub_24A5E9A90@<X0>(char a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  _QWORD *v19;
  __int128 *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v1 + 984) = &type metadata for BasicVoiceFeedbackAlerts;
  *(_QWORD *)(v1 + 992) = &protocol witness table for BasicVoiceFeedbackAlerts;
  *(_BYTE *)(v1 + 960) = a1;
  outlined init with copy of VoiceFeedbackPatternResolving?(v21, (uint64_t)v20);
  if (*(_QWORD *)(v1 + 1104))
  {
    outlined init with take of VoiceFeedbackPatternResolving(v20, (uint64_t)v19);
    v2 = *(_QWORD *)(v1 + 1064);
    v3 = *(_QWORD *)(v1 + 1072);
    __swift_project_boxed_opaque_existential_1(v19, v2);
    v4 = type metadata accessor for WorkoutVoiceFeedbackCATPatternsExecutor(0);
    static CATOption.defaultMode.getter();
    v5 = CATWrapper.__allocating_init(options:globals:)();
    *(_QWORD *)(v1 + 1184) = v4;
    *(_QWORD *)(v1 + 1192) = &protocol witness table for WorkoutVoiceFeedbackCATPatternsExecutor;
    *(_QWORD *)(v1 + 1160) = v5;
    v22 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v3 + 8) + *(_QWORD *)(v3 + 8));
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 1624) = v6;
    *v6 = v1;
    v6[1] = pattern(for:data:);
    return v22(v1 + 1160, v2, v3);
  }
  else
  {
    v8 = *(_QWORD *)(v1 + 1608);
    v9 = *(_QWORD *)(v1 + 1600);
    v10 = *(_QWORD *)(v1 + 1592);
    outlined destroy of Any?((uint64_t)v20, &demangling cache variable for type metadata for VoiceFeedbackPatternResolving?);
    v11 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v11, v10);
    v12 = Logger.logObject.getter();
    v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_24A5E6000, v12, v13, "Could not create a model for executing any pattern from the data", v14, 2u);
      MEMORY[0x24BD15374](v14, -1, -1);
    }
    v15 = *(_QWORD *)(v1 + 1608);
    v16 = *(_QWORD *)(v1 + 1600);
    v17 = *(_QWORD *)(v1 + 1592);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    lazy protocol witness table accessor for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors();
    swift_allocError();
    *v18 = 1;
    swift_willThrow();
    outlined destroy of Any?(v21, &demangling cache variable for type metadata for VoiceFeedbackPatternResolving?);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t pattern(for:data:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 1632) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    *(_QWORD *)(v4 + 1640) = a1;
    __swift_destroy_boxed_opaque_existential_1Tm(v4 + 1160);
  }
  return swift_task_switch();
}

uint64_t pattern(for:data:)()
{
  uint64_t v0;

  outlined destroy of Any?(v0 + 960, &demangling cache variable for type metadata for VoiceFeedbackPatternResolving?);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 1040);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 1640));
}

{
  uint64_t v0;

  outlined destroy of Any?(v0 + 960, &demangling cache variable for type metadata for VoiceFeedbackPatternResolving?);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 1160);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 1040);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t protocol witness for Flow.on(input:) in conformance VoiceFeedbackAnnouncementFlow()
{
  return 1;
}

uint64_t protocol witness for Flow.onAsync(input:) in conformance VoiceFeedbackAnnouncementFlow()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = protocol witness for Flow.onAsync(input:) in conformance VoiceFeedbackAnnouncementFlow;
  return Flow.onAsync(input:)();
}

uint64_t protocol witness for Flow.onAsync(input:) in conformance VoiceFeedbackAnnouncementFlow(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t protocol witness for Flow.execute() in conformance VoiceFeedbackAnnouncementFlow(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = protocol witness for Flow.execute() in conformance VoiceFeedbackAnnouncementFlow;
  return VoiceFeedbackAnnouncementFlow.execute()(a1);
}

uint64_t protocol witness for Flow.execute() in conformance VoiceFeedbackAnnouncementFlow()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t variable initialization expression of GoalCompletionModel.alertType()
{
  return 1;
}

uint64_t variable initialization expression of VoiceFeedbackTargetZone.paceFormat()
{
  return 2;
}

uint64_t variable initialization expression of VoiceFeedbackTargetZone.zoneIndex()
{
  return 0;
}

uint64_t variable initialization expression of DistanceSplitModel.alertType()
{
  return 20;
}

uint64_t variable initialization expression of DistanceSplitModel.duration()
{
  return 0;
}

uint64_t variable initialization expression of HalfwayGoalCompletionModel.alertType()
{
  return 2;
}

uint64_t variable initialization expression of LapCompletionModel.alertType()
{
  return 5;
}

uint64_t variable initialization expression of WorkoutReminderAnnouncementFlow.state()
{
  type metadata accessor for WorkoutReminderAnnouncementFlow.State(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t variable initialization expression of AboveTargetZoneModel.alertType()
{
  return 23;
}

uint64_t variable initialization expression of AboveTargetZoneModel.paceFormat()
{
  return 2;
}

uint64_t variable initialization expression of TimeSplitModel.alertType()
{
  return 21;
}

uint64_t variable initialization expression of WorkoutReminderAnnouncementDirectInvocation.appBundleIdOfLastAnnouncement()
{
  return 0;
}

uint64_t variable initialization expression of PacerGoalCompletionModel.alertType()
{
  return 8;
}

uint64_t variable initialization expression of WorkoutReminderControlsDirectInvocation.identifier()
{
  return 0;
}

uint64_t variable initialization expression of BelowTargetZoneModel.alertType()
{
  return 24;
}

uint64_t variable initialization expression of BelowTargetZoneModel.paceFormat()
{
  return 2;
}

uint64_t variable initialization expression of VoiceFeedbackWorkoutStep.magnitude()
{
  return 0;
}

uint64_t variable initialization expression of VoiceFeedbackWorkoutStep.unit()
{
  return 0;
}

double variable initialization expression of VoiceFeedbackWorkoutStep.targetZone@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_WORD *)(a1 + 48) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t variable initialization expression of SegmentModel.alertType()
{
  return 18;
}

uint64_t variable initialization expression of UpcomingIntervalModel.alertType()
{
  return 4;
}

double variable initialization expression of UpcomingIntervalModel.completedStep@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 1;
  result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 74) = 0u;
  return result;
}

uint64_t variable initialization expression of EnteredTargetZoneModel.alertType()
{
  return 22;
}

uint64_t variable initialization expression of EnteredTargetZoneModel.paceFormat()
{
  return 2;
}

void protocol witness for SetAlgebra.init() in conformance NSPropertyListMutabilityOptions(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance AFWorkoutType(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance HKWorkoutActivityType(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *protocol witness for OptionSet.init(rawValue:) in conformance NSJSONWritingOptions@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
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

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(void (*a1)(void))
{
  a1();
  return _typeName(_:qualified:)();
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

_BYTE **closure #1 in OSLogArguments.append(_:)(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
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

uint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  Swift::Int v2;

  Hasher.init(_seed:)();
  VoiceFeedbackKeys.rawValue.getter(a1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;

  Hasher.init(_seed:)();
  String.hash(into:)();
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD152B4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

uint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

{
  char **v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<VoiceFeedbackKeys?>);
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
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

unint64_t type metadata accessor for PatternExecutionDialog()
{
  unint64_t result;

  result = lazy cache variable for type metadata for PatternExecutionDialog;
  if (!lazy cache variable for type metadata for PatternExecutionDialog)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for PatternExecutionDialog);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for VoiceFeedbackAnnouncementFlow(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for VoiceFeedbackAnnouncementFlow(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 8;
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1Tm(v1);
}

uint64_t initializeWithCopy for VoiceFeedbackAnnouncementFlow(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = a2 + 8;
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v4;
  v5 = v4;
  v6 = **(void (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  swift_bridgeObjectRetain();
  v6(a1 + 8, v3, v5);
  return a1;
}

_QWORD *assignWithCopy for VoiceFeedbackAnnouncementFlow(_QWORD *a1, _QWORD *a2)
{
  uint64_t *v3;

  v3 = a2 + 1;
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 1, v3);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
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

uint64_t assignWithTake for VoiceFeedbackAnnouncementFlow(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for VoiceFeedbackAnnouncementFlow(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VoiceFeedbackAnnouncementFlow(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for VoiceFeedbackAnnouncementFlow()
{
  return &type metadata for VoiceFeedbackAnnouncementFlow;
}

uint64_t outlined init with copy of VoiceFeedbackPatternResolving?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VoiceFeedbackPatternResolving?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Any?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackErrors, &type metadata for VoiceFeedbackErrors);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackErrors, &type metadata for VoiceFeedbackErrors);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors);
  }
  return result;
}

uint64_t outlined init with take of VoiceFeedbackPatternResolving(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_24A5EBD64()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24A5EBD88()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24A5EBDAC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24A5EBDD0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t outlined init with take of BelowTargetZoneModel?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t _s20WorkoutAnnouncements21UpcomingIntervalModelVSgWOg(uint64_t a1)
{
  unint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 128);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  v2 = v1 - 1;
  if (v2 < 0)
    v2 = -1;
  return (v2 + 1);
}

uint64_t sub_24A5EBE5C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 48) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24A5EBEA0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
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

uint64_t GoalCompletionModel.alertType.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*GoalCompletionModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

WorkoutAnnouncements::GoalCompletionModel __swiftcall GoalCompletionModel.init(magnitude:unit:)(Swift::Double magnitude, Swift::String unit)
{
  void *object;
  uint64_t countAndFlagsBits;
  WorkoutAnnouncements::VoiceFeedbackAlertType v4;
  WorkoutAnnouncements::GoalCompletionModel result;

  object = unit._object;
  countAndFlagsBits = unit._countAndFlagsBits;
  v4 = WorkoutAnnouncements_VoiceFeedbackAlertType_goalCompletion;
  result.magnitude = magnitude;
  result.unit._object = object;
  result.unit._countAndFlagsBits = countAndFlagsBits;
  result.alertType = v4;
  return result;
}

uint64_t static GoalCompletionModel.__derived_struct_equals(_:_:)(char a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, double a7, double a8)
{
  if (a1 != a4 || a7 != a8)
    return 0;
  if (a2 == a5 && a3 == a6)
    return 1;
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t GoalCompletionModel.CodingKeys.stringValue.getter(char a1)
{
  return *(_QWORD *)&aAlerttypmagnit[8 * a1];
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GoalCompletionModel.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GoalCompletionModel.CodingKeys()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance GoalCompletionModel.CodingKeys()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GoalCompletionModel.CodingKeys()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GoalCompletionModel.CodingKeys()
{
  char *v0;

  return GoalCompletionModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GoalCompletionModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized GoalCompletionModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance GoalCompletionModel.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance GoalCompletionModel.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GoalCompletionModel.CodingKeys()
{
  lazy protocol witness table accessor for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GoalCompletionModel.CodingKeys()
{
  lazy protocol witness table accessor for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t GoalCompletionModel.encode(to:)(_QWORD *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  char v13;
  char v14;
  char v15;
  char v16;

  v12 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GoalCompletionModel.CodingKeys>);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v16 = a2;
  v15 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v4)
  {
    v14 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v13 = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

double GoalCompletionModel.init(from:)(_QWORD *a1)
{
  return specialized GoalCompletionModel.init(from:)(a1);
}

uint64_t protocol witness for VoiceFeedbackAlerting.alertType.getter in conformance GoalCompletionModel()
{
  unsigned __int8 *v0;

  return *v0;
}

void protocol witness for Decodable.init(from:) in conformance GoalCompletionModel(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v4;
  uint64_t v5;
  uint64_t v6;
  double v7;

  v7 = specialized GoalCompletionModel.init(from:)(a1);
  if (!v2)
  {
    *(_BYTE *)a2 = v4;
    *(double *)(a2 + 8) = v7;
    *(_QWORD *)(a2 + 16) = v5;
    *(_QWORD *)(a2 + 24) = v6;
  }
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GoalCompletionModel(_QWORD *a1)
{
  uint64_t v1;

  return GoalCompletionModel.encode(to:)(a1, *(_BYTE *)v1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GoalCompletionModel(double *a1, double *a2)
{
  if (*(unsigned __int8 *)a1 != *(unsigned __int8 *)a2 || a1[1] != a2[1])
    return 0;
  if (*((_QWORD *)a1 + 2) == *((_QWORD *)a2 + 2) && *((_QWORD *)a1 + 3) == *((_QWORD *)a2 + 3))
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance GoalCompletionModel(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1[1];
  v3 = v1[3];
  v2[4] = v1[2];
  v2[5] = v3;
  return swift_task_switch();
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  swift_task_dealloc();
  v5 = swift_bridgeObjectRelease();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance GoalCompletionModel()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(char, uint64_t, uint64_t, uint64_t, double);

  v1 = *__swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
  v4 = (uint64_t (*)(char, uint64_t, uint64_t, uint64_t, double))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalCompletion(executeSashGroupOnWatch:_:)
                                                                       + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalCompletion(executeSashGroupOnWatch:_:));
  swift_bridgeObjectRetain();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  *v2 = v0;
  v2[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance GoalCompletionModel;
  return v4(0, v1, *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(double *)(v0 + 24));
}

unint64_t lazy protocol witness table accessor for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for GoalCompletionModel.CodingKeys, &unk_251BE9FA8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for GoalCompletionModel.CodingKeys, &unk_251BE9FA8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for GoalCompletionModel.CodingKeys, &unk_251BE9FA8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for GoalCompletionModel.CodingKeys, &unk_251BE9FA8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackAlertType, &type metadata for VoiceFeedbackAlertType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackAlertType, &type metadata for VoiceFeedbackAlertType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackAlertType, &type metadata for VoiceFeedbackAlertType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackAlertType, &type metadata for VoiceFeedbackAlertType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType);
  }
  return result;
}

uint64_t specialized Sequence.compactMap<A>(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t result;
  int64_t v8;
  _QWORD *v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t i;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  _OWORD v29[2];
  __int128 v30;
  _OWORD v31[2];
  _OWORD *v32;

  v2 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v6 = (unint64_t)(v3 + 63) >> 6;
  v32 = v29;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v5)
    goto LABEL_31;
LABEL_6:
  v10 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v10 < v6)
    {
      v11 = *(_QWORD *)(v2 + 8 * v10);
      ++v8;
      if (v11)
        goto LABEL_21;
      v8 = v10 + 1;
      if (v10 + 1 >= v6)
        goto LABEL_32;
      v11 = *(_QWORD *)(v2 + 8 * v8);
      if (v11)
        goto LABEL_21;
      v8 = v10 + 2;
      if (v10 + 2 >= v6)
        goto LABEL_32;
      v11 = *(_QWORD *)(v2 + 8 * v8);
      if (v11)
        goto LABEL_21;
      v8 = v10 + 3;
      if (v10 + 3 >= v6)
        goto LABEL_32;
      v11 = *(_QWORD *)(v2 + 8 * v8);
      if (v11)
      {
LABEL_21:
        v5 = (v11 - 1) & v11;
        for (i = __clz(__rbit64(v11)) + (v8 << 6); ; i = v21 | (v8 << 6))
        {
          v14 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
          v15 = *v14;
          v16 = v14[1];
          outlined init with copy of Any(*(_QWORD *)(a1 + 56) + 32 * i, (uint64_t)v31);
          *(_QWORD *)&v30 = v15;
          *((_QWORD *)&v30 + 1) = v16;
          v28 = v30;
          v29[0] = v31[0];
          v29[1] = v31[1];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v17 = specialized VoiceFeedbackKeys.init(rawValue:)();
          if (v17 == 17)
          {
            v27 = 0;
            v25 = 0u;
            v26 = 0u;
          }
          else
          {
            LOBYTE(v25) = v17;
            outlined init with copy of Any((uint64_t)v32, (uint64_t)&v25 + 8);
          }
          outlined destroy of Any?((uint64_t)&v28, &demangling cache variable for type metadata for (key: String, value: Any));
          if (v27)
          {
            v22 = v25;
            v23 = v26;
            v24 = v27;
            result = swift_isUniquelyReferenced_nonNull_native();
            if ((result & 1) == 0)
            {
              result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v9[2] + 1, 1, v9);
              v9 = (_QWORD *)result;
            }
            v19 = v9[2];
            v18 = v9[3];
            if (v19 >= v18 >> 1)
            {
              result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v18 > 1), v19 + 1, 1, v9);
              v9 = (_QWORD *)result;
            }
            v9[2] = v19 + 1;
            v20 = &v9[5 * v19];
            v20[8] = v24;
            *((_OWORD *)v20 + 2) = v22;
            *((_OWORD *)v20 + 3) = v23;
            if (!v5)
              goto LABEL_6;
          }
          else
          {
            result = outlined destroy of Any?((uint64_t)&v25, &demangling cache variable for type metadata for (VoiceFeedbackKeys, Any)?);
            if (!v5)
              goto LABEL_6;
          }
LABEL_31:
          v21 = __clz(__rbit64(v5));
          v5 &= v5 - 1;
        }
      }
      v12 = v10 + 4;
      if (v12 < v6)
      {
        v11 = *(_QWORD *)(v2 + 8 * v12);
        if (v11)
        {
          v8 = v12;
          goto LABEL_21;
        }
        while (1)
        {
          v8 = v12 + 1;
          if (__OFADD__(v12, 1))
            goto LABEL_34;
          if (v8 >= v6)
            break;
          v11 = *(_QWORD *)(v2 + 8 * v8);
          ++v12;
          if (v11)
            goto LABEL_21;
        }
      }
    }
LABEL_32:
    swift_release();
    return (uint64_t)v9;
  }
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(VoiceFeedbackKeys, Any)>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4])
          memmove(v12, a4 + 4, 40 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v7;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t result;
  void *v18;
  id v19;
  _QWORD *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  _BOOL8 v31;
  uint64_t v32;
  char v33;
  char v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  Swift::String v38;
  Swift::String v39;
  _OWORD v40[2];
  char v41[8];
  _OWORD v42[2];
  unsigned __int8 v43;

  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
    return swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  outlined init with copy of (VoiceFeedbackKeys, Any)(a1 + 32, (uint64_t)v41);
  v7 = v41[0];
  v43 = v41[0];
  outlined init with take of Any(v42, v40);
  v8 = (_QWORD *)*a3;
  v10 = specialized __RawDictionaryStorage.find<A>(_:)(v7);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
    goto LABEL_23;
  v14 = v9;
  if (v8[3] >= v13)
  {
    if ((a2 & 1) != 0)
    {
      if ((v9 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      specialized _NativeDictionary.copy()();
      if ((v14 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v20 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v10 >> 6) + 64) |= 1 << v10;
    *(_BYTE *)(v20[6] + v10) = v7;
    outlined init with take of Any(v40, (_OWORD *)(v20[7] + 32 * v10));
    v21 = v20[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v20[2] = v23;
    v24 = v4 - 1;
    if (!v24)
      return swift_bridgeObjectRelease_n();
    for (i = a1 + 72; ; i += 40)
    {
      outlined init with copy of (VoiceFeedbackKeys, Any)(i, (uint64_t)v41);
      v26 = v41[0];
      v43 = v41[0];
      outlined init with take of Any(v42, v40);
      v27 = (_QWORD *)*a3;
      v28 = specialized __RawDictionaryStorage.find<A>(_:)(v26);
      v30 = v27[2];
      v31 = (v29 & 1) == 0;
      v22 = __OFADD__(v30, v31);
      v32 = v30 + v31;
      if (v22)
        break;
      v33 = v29;
      if (v27[3] < v32)
      {
        specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v32, 1);
        v28 = specialized __RawDictionaryStorage.find<A>(_:)(v26);
        if ((v33 & 1) != (v34 & 1))
          goto LABEL_25;
      }
      if ((v33 & 1) != 0)
        goto LABEL_10;
      v35 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v28 >> 6) + 64) |= 1 << v28;
      *(_BYTE *)(v35[6] + v28) = v26;
      outlined init with take of Any(v40, (_OWORD *)(v35[7] + 32 * v28));
      v36 = v35[2];
      v22 = __OFADD__(v36, 1);
      v37 = v36 + 1;
      if (v22)
        goto LABEL_24;
      v35[2] = v37;
      if (!--v24)
        return swift_bridgeObjectRelease_n();
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v13, a2 & 1);
  v15 = specialized __RawDictionaryStorage.find<A>(_:)(v7);
  if ((v14 & 1) == (v16 & 1))
  {
    v10 = v15;
    if ((v14 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v18 = (void *)swift_allocError();
    swift_willThrow();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v40);
      swift_bridgeObjectRelease();
      return MEMORY[0x24BD15248](v18);
    }
    goto LABEL_26;
  }
LABEL_25:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
LABEL_26:
  _StringGuts.grow(_:)(30);
  v38._object = (void *)0x800000024A61E120;
  v38._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v38);
  _print_unlocked<A, B>(_:_:)();
  v39._countAndFlagsBits = 39;
  v39._object = (void *)0xE100000000000000;
  String.append(_:)(v39);
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
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
  char v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _OWORD v20[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
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
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v13)
        goto LABEL_26;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
        break;
    }
LABEL_25:
    v12 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    v16 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    outlined init with copy of Any(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v20);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = v16;
    result = outlined init with take of Any(v20, (_OWORD *)(*(_QWORD *)(v4 + 56) + 32 * v15));
  }
  v19 = v17 + 2;
  if (v19 >= v13)
    goto LABEL_26;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
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
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  _OWORD v20[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
  v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_29;
  v7 = 1 << *(_BYTE *)(v5 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v5 + 64);
  v19 = (unint64_t)(v7 + 63) >> 6;
  swift_retain();
  if (v9)
  {
    v10 = __clz(__rbit64(v9));
    goto LABEL_18;
  }
  if (v19 <= 1)
  {
    swift_release();
    v11 = (_QWORD *)(v5 + 64);
    if ((a2 & 1) == 0)
      goto LABEL_29;
    goto LABEL_25;
  }
  v11 = (_QWORD *)(v5 + 64);
  v12 = *(_QWORD *)(v5 + 72);
  v13 = 1;
  if (v12)
    goto LABEL_17;
  v13 = 2;
  if (v19 <= 2)
    goto LABEL_22;
  v12 = *(_QWORD *)(v5 + 80);
  if (v12)
  {
LABEL_17:
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
LABEL_18:
    v15 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 48) + v10);
    v16 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v10);
    if ((a2 & 1) != 0)
      outlined init with take of Any(v16, v20);
    else
      outlined init with copy of Any((uint64_t)v16, (uint64_t)v20);
    Hasher.init(_seed:)();
    __asm { BR              X8 }
  }
  v14 = 3;
  if (v19 > 3)
  {
    v12 = *(_QWORD *)(v5 + 88);
    if (v12)
    {
      v13 = 3;
      goto LABEL_17;
    }
    while (1)
    {
      v13 = v14 + 1;
      if (__OFADD__(v14, 1))
      {
        __break(1u);
        JUMPOUT(0x24A5ED2DCLL);
      }
      if (v13 >= v19)
        break;
      v12 = *(_QWORD *)(v5 + 64 + 8 * v13);
      ++v14;
      if (v12)
        goto LABEL_17;
    }
  }
LABEL_22:
  swift_release();
  if ((a2 & 1) == 0)
    goto LABEL_29;
LABEL_25:
  v17 = 1 << *(_BYTE *)(v5 + 32);
  if (v17 >= 64)
    bzero(v11, ((unint64_t)(v17 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v11 = -1 << v17;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_29:
  result = swift_release();
  *v3 = v6;
  return result;
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
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (VoiceFeedbackKeys, Any));
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized GoalCompletionModel.init(with:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;

  v2 = type metadata accessor for Logger();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(specialized Sequence.compactMap<A>(_:)(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
    v6 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v6 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v29 = v6;
  v7 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v7, 1, &v29);
  swift_bridgeObjectRelease();
  v8 = v29;
  v9 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
  swift_retain_n();
  v10 = Logger.logObject.getter();
  v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v27 = swift_slowAlloc();
    *(_QWORD *)&v29 = v27;
    *(_DWORD *)v12 = 136315394;
    v28 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000013, 0x800000024A61AC50, (uint64_t *)&v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v12 + 12) = 2080;
    v24 = v12 + 14;
    lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
    v26 = v2;
    swift_retain();
    v25 = v3;
    v13 = Dictionary.description.getter();
    v14 = a1;
    v16 = v15;
    swift_release();
    v28 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v16, (uint64_t *)&v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    a1 = v14;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A5E6000, v10, v11, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v12, 0x16u);
    v17 = v27;
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v17, -1, -1);
    MEMORY[0x24BD15374](v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v26);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  if (*(_QWORD *)(v8 + 16)
    && (v18 = specialized __RawDictionaryStorage.find<A>(_:)(6), (v19 & 1) != 0)
    && (outlined init with copy of Any(*(_QWORD *)(v8 + 56) + 32 * v18, (uint64_t)&v29), (swift_dynamicCast() & 1) != 0))
  {
    if (*(_QWORD *)(v8 + 16) && (v20 = specialized __RawDictionaryStorage.find<A>(_:)(15), (v21 & 1) != 0))
    {
      outlined init with copy of Any(*(_QWORD *)(v8 + 56) + 32 * v20, (uint64_t)&v29);
    }
    else
    {
      v29 = 0u;
      v30 = 0u;
    }
    swift_release();
    if (!*((_QWORD *)&v30 + 1))
    {
      swift_bridgeObjectRelease();
      outlined destroy of Any?((uint64_t)&v29, &demangling cache variable for type metadata for Any?);
      return 0;
    }
    if ((swift_dynamicCast() & 1) != 0)
    {
      swift_bridgeObjectRetain();
      v23 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1, 1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v23 & 1) != 0)
        return 1;
    }
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t specialized closure #1 in GoalCompletionModel.executePattern(wrapper:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = String.toDialogUnit.getter(a2, a3);
  v13 = v11;
  if (v12 == 115 && v11 == 0xE100000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    type metadata accessor for DialogDuration.Builder();
    swift_allocObject();
    DialogDuration.Builder.init()();
    dispatch thunk of DialogDuration.Builder.withSecs(_:)();
    swift_release();
    v14 = dispatch thunk of DialogDuration.Builder.build()();
    swift_release();
    result = swift_release();
    *(_QWORD *)a1 = v14;
  }
  else if ((String.isDialogDistanceUnit.getter(v12, v13) & 1) != 0)
  {
    type metadata accessor for DialogLength.Builder();
    swift_allocObject();
    MEMORY[0x24BD14B88]();
    dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
    swift_release();
    String.toSpeakableString.getter();
    swift_bridgeObjectRelease();
    v16 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v10, 0, 1, v16);
    dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
    swift_release();
    outlined destroy of Any?((uint64_t)v10, &demangling cache variable for type metadata for SpeakableString?);
    v17 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
    swift_release();
    result = swift_release();
    *(_QWORD *)(a1 + 16) = v17;
  }
  else
  {
    *(double *)(a1 + 24) = a4;
    *(_BYTE *)(a1 + 32) = 0;
    String.toSpeakableString.getter();
    swift_bridgeObjectRelease();
    v18 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v10, 0, 1, v18);
    v19 = type metadata accessor for WorkoutVoiceFeedbackGoalCompletionParameters(0);
    return outlined assign with take of SpeakableString?((uint64_t)v10, a1 + *(int *)(v19 + 32));
  }
  return result;
}

uint64_t specialized GoalCompletionModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7079547472656C61 && a2 == 0xE900000000000065;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x647574696E67616DLL && a2 == 0xE900000000000065
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1953066613 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

double specialized GoalCompletionModel.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  double v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  double v8;
  uint64_t v10;
  char v11;
  char v12;
  char v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GoalCompletionModel.CodingKeys>);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v1)
  {
    v13 = 0;
    lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v12 = 1;
    KeyedDecodingContainer.decode(_:forKey:)();
    v2 = v8;
    v11 = 2;
    KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return v2;
}

unint64_t instantiation function for generic protocol witness table for GoalCompletionModel(_QWORD *a1)
{
  unint64_t result;

  a1[1] = lazy protocol witness table accessor for type GoalCompletionModel and conformance GoalCompletionModel();
  a1[2] = lazy protocol witness table accessor for type GoalCompletionModel and conformance GoalCompletionModel();
  result = lazy protocol witness table accessor for type GoalCompletionModel and conformance GoalCompletionModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type GoalCompletionModel and conformance GoalCompletionModel()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GoalCompletionModel and conformance GoalCompletionModel;
  if (!lazy protocol witness table cache variable for type GoalCompletionModel and conformance GoalCompletionModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for GoalCompletionModel, &type metadata for GoalCompletionModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GoalCompletionModel and conformance GoalCompletionModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GoalCompletionModel and conformance GoalCompletionModel;
  if (!lazy protocol witness table cache variable for type GoalCompletionModel and conformance GoalCompletionModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for GoalCompletionModel, &type metadata for GoalCompletionModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GoalCompletionModel and conformance GoalCompletionModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GoalCompletionModel and conformance GoalCompletionModel;
  if (!lazy protocol witness table cache variable for type GoalCompletionModel and conformance GoalCompletionModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for GoalCompletionModel, &type metadata for GoalCompletionModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GoalCompletionModel and conformance GoalCompletionModel);
  }
  return result;
}

uint64_t destroy for GoalCompletionModel()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GoalCompletionModel(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for GoalCompletionModel(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
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

uint64_t assignWithTake for GoalCompletionModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GoalCompletionModel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GoalCompletionModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GoalCompletionModel()
{
  return &type metadata for GoalCompletionModel;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GoalCompletionModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for GoalCompletionModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A5EE100 + 4 * byte_24A61AB95[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24A5EE134 + 4 * asc_24A61AB90[v4]))();
}

uint64_t sub_24A5EE134(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5EE13C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A5EE144);
  return result;
}

uint64_t sub_24A5EE150(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A5EE158);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24A5EE15C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5EE164(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for GoalCompletionModel.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for GoalCompletionModel.CodingKeys(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void *type metadata accessor for GoalCompletionModel.CodingKeys()
{
  return &unk_251BE9FA8;
}

uint64_t outlined assign with take of SpeakableString?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackKeys, &type metadata for VoiceFeedbackKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackKeys, &type metadata for VoiceFeedbackKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackKeys, &type metadata for VoiceFeedbackKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys);
  }
  return result;
}

uint64_t outlined init with copy of (VoiceFeedbackKeys, Any)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (VoiceFeedbackKeys, Any));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void __swiftcall VoiceFeedbackTargetZone.init(minMagnitude:maxMagnitude:unit:metricType:paceFormat:zoneIndex:)(WorkoutAnnouncements::VoiceFeedbackTargetZone *__return_ptr retstr, Swift::Double minMagnitude, Swift::Double maxMagnitude, Swift::String unit, WorkoutAnnouncements::VoiceFeedbackMetricType metricType, WorkoutAnnouncements::VoiceFeedbackPaceFormat_optional paceFormat, Swift::Int_optional zoneIndex)
{
  retstr->minMagnitude = minMagnitude;
  retstr->maxMagnitude = maxMagnitude;
  retstr->unit = unit;
  retstr->metricType = metricType;
  retstr->paceFormat = paceFormat;
  retstr->zoneIndex.value = zoneIndex.value;
  retstr->zoneIndex.is_nil = zoneIndex.is_nil;
  retstr->isSingleThreshold = minMagnitude == maxMagnitude;
}

double VoiceFeedbackTargetZone.init(from:)@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;
  __int16 v8;

  specialized VoiceFeedbackTargetZone.init(from:)(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(_WORD *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t VoiceFeedbackTargetZone.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24A5EE444 + 4 * byte_24A61ADD0[a1]))(0xD000000000000011, 0x800000024A61DDC0);
}

uint64_t sub_24A5EE444()
{
  return 0x696E67614D6E696DLL;
}

uint64_t sub_24A5EE470()
{
  return 1953066613;
}

uint64_t sub_24A5EE480()
{
  return 0x795463697274656DLL;
}

uint64_t sub_24A5EE49C()
{
  return 0x6D726F4665636170;
}

uint64_t sub_24A5EE4BC()
{
  return 0x65646E49656E6F7ALL;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance VoiceFeedbackTargetZone.CodingKeys()
{
  unsigned __int8 *v0;

  return VoiceFeedbackTargetZone.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance VoiceFeedbackTargetZone.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized VoiceFeedbackTargetZone.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance VoiceFeedbackTargetZone.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance VoiceFeedbackTargetZone.CodingKeys()
{
  lazy protocol witness table accessor for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance VoiceFeedbackTargetZone.CodingKeys()
{
  lazy protocol witness table accessor for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t VoiceFeedbackTargetZone.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[9];
  _BYTE v11[6];
  char v12;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<VoiceFeedbackTargetZone.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v11[5] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    v11[4] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[3] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[2] = *(_BYTE *)(v3 + 32);
    v11[1] = 3;
    lazy protocol witness table accessor for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    outlined init with take of VoiceFeedbackPaceFormat?(v3 + 33, (uint64_t)&v12);
    outlined init with take of VoiceFeedbackPaceFormat?((uint64_t)&v12, (uint64_t)v11);
    v10[8] = 4;
    lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    v10[7] = 5;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v10[6] = 6;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

double protocol witness for Decodable.init(from:) in conformance VoiceFeedbackTargetZone@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;
  __int16 v8;

  specialized VoiceFeedbackTargetZone.init(from:)(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(_WORD *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance VoiceFeedbackTargetZone(_QWORD *a1)
{
  return VoiceFeedbackTargetZone.encode(to:)(a1);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance VoiceFeedbackTargetZone(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[3];
  __int16 v6;
  _OWORD v7[3];
  __int16 v8;

  v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  v5[2] = *(_OWORD *)(a1 + 32);
  v6 = *(_WORD *)(a1 + 48);
  v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a2 + 32);
  v8 = *(_WORD *)(a2 + 48);
  return specialized static VoiceFeedbackTargetZone.__derived_struct_equals(_:_:)((uint64_t)v5, (uint64_t)v7) & 1;
}

uint64_t specialized static VoiceFeedbackTargetZone.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  char v5;
  char v6;
  int v7;
  int v8;

  if (*(double *)a1 != *(double *)a2 || *(double *)(a1 + 8) != *(double *)(a2 + 8))
    goto LABEL_20;
  v4 = *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24);
  if (v4 || (v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), v6 = 0, (v5 & 1) != 0))
  {
    if (*(unsigned __int8 *)(a1 + 32) != *(unsigned __int8 *)(a2 + 32))
    {
LABEL_20:
      v6 = 0;
      return v6 & 1;
    }
    v7 = *(unsigned __int8 *)(a1 + 33);
    v8 = *(unsigned __int8 *)(a2 + 33);
    if (v7 == 2)
    {
      if (v8 != 2)
        goto LABEL_20;
    }
    else
    {
      v6 = 0;
      if (v8 == 2 || ((v8 ^ v7) & 1) != 0)
        return v6 & 1;
    }
    v6 = *(_BYTE *)(a2 + 48);
    if ((*(_BYTE *)(a1 + 48) & 1) == 0)
    {
      if (*(_QWORD *)(a1 + 40) != *(_QWORD *)(a2 + 40))
        v6 = 1;
      if ((v6 & 1) != 0)
        goto LABEL_20;
LABEL_22:
      v6 = ((*(_BYTE *)(a1 + 49) & 1) == 0) ^ *(_BYTE *)(a2 + 49);
      return v6 & 1;
    }
    if (*(_BYTE *)(a2 + 48))
      goto LABEL_22;
  }
  return v6 & 1;
}

uint64_t specialized VoiceFeedbackTargetZone.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  char v20;
  int v21;
  uint64_t v22;
  int v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<VoiceFeedbackTargetZone.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  v37 = 0;
  KeyedDecodingContainer.decode(_:forKey:)();
  v10 = v9;
  v36 = 1;
  KeyedDecodingContainer.decode(_:forKey:)();
  v12 = v11;
  v35 = 2;
  v14 = KeyedDecodingContainer.decode(_:forKey:)();
  v16 = v15;
  v34 = 3;
  swift_bridgeObjectRetain();
  v17 = KeyedDecodingContainer.decode(_:forKey:)();
  v18 = specialized VoiceFeedbackMetricType.init(rawValue:)(v17);
  if (v18 == 8)
  {
    swift_bridgeObjectRelease();
    v33 = 3;
    type metadata accessor for DecodingError();
    swift_allocError();
    lazy protocol witness table accessor for type KeyedDecodingContainer<VoiceFeedbackTargetZone.CodingKeys> and conformance KeyedDecodingContainer<A>();
LABEL_6:
    static DecodingError.dataCorruptedError<A>(forKey:in:debugDescription:)();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    return swift_bridgeObjectRelease();
  }
  v28 = v18;
  v32 = 4;
  v19 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  if ((v20 & 1) != 0)
  {
    v21 = 2;
  }
  else
  {
    if (!v19)
    {
      v27 = 0;
      goto LABEL_13;
    }
    if (v19 != 1)
    {
      swift_bridgeObjectRelease();
      v29 = 4;
      type metadata accessor for DecodingError();
      swift_allocError();
      lazy protocol witness table accessor for type KeyedDecodingContainer<VoiceFeedbackTargetZone.CodingKeys> and conformance KeyedDecodingContainer<A>();
      goto LABEL_6;
    }
    v21 = 1;
  }
  v27 = v21;
LABEL_13:
  v31 = 5;
  v22 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  HIDWORD(v25) = v23;
  v26 = v22;
  v30 = 6;
  v24 = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v10;
  *(_QWORD *)(a2 + 8) = v12;
  *(_QWORD *)(a2 + 16) = v14;
  *(_QWORD *)(a2 + 24) = v16;
  *(_BYTE *)(a2 + 32) = v28;
  *(_BYTE *)(a2 + 33) = v27;
  *(_QWORD *)(a2 + 40) = v26;
  *(_BYTE *)(a2 + 48) = BYTE4(v25) & 1;
  *(_BYTE *)(a2 + 49) = v24 & 1;
  return result;
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackTargetZone.CodingKeys, &unk_251BEA190);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackTargetZone.CodingKeys, &unk_251BEA190);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackTargetZone.CodingKeys, &unk_251BEA190);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackTargetZone.CodingKeys, &unk_251BEA190);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackMetricType, &type metadata for VoiceFeedbackMetricType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackMetricType, &type metadata for VoiceFeedbackMetricType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackMetricType, &type metadata for VoiceFeedbackMetricType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackMetricType, &type metadata for VoiceFeedbackMetricType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType);
  }
  return result;
}

uint64_t outlined init with take of VoiceFeedbackPaceFormat?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VoiceFeedbackPaceFormat?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackPaceFormat, &type metadata for VoiceFeedbackPaceFormat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackPaceFormat, &type metadata for VoiceFeedbackPaceFormat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackPaceFormat, &type metadata for VoiceFeedbackPaceFormat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackPaceFormat, &type metadata for VoiceFeedbackPaceFormat);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat);
  }
  return result;
}

uint64_t initializeWithCopy for VoiceFeedbackTargetZone(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for VoiceFeedbackTargetZone(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  v4 = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v4;
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  return a1;
}

__n128 __swift_memcpy50_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for VoiceFeedbackTargetZone(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  return a1;
}

uint64_t getEnumTagSinglePayload for VoiceFeedbackTargetZone(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 50))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VoiceFeedbackTargetZone(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 50) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 50) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for VoiceFeedbackTargetZone()
{
  return &type metadata for VoiceFeedbackTargetZone;
}

uint64_t getEnumTagSinglePayload for VoiceFeedbackTargetZone.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for VoiceFeedbackTargetZone.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_24A5EF0E8 + 4 * byte_24A61ADDC[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_24A5EF11C + 4 * byte_24A61ADD7[v4]))();
}

uint64_t sub_24A5EF11C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5EF124(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A5EF12CLL);
  return result;
}

uint64_t sub_24A5EF138(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A5EF140);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_24A5EF144(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5EF14C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for VoiceFeedbackTargetZone.CodingKeys()
{
  return &unk_251BEA190;
}

uint64_t specialized VoiceFeedbackTargetZone.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x696E67614D6E696DLL && a2 == 0xEC00000065647574;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x696E67614D78616DLL && a2 == 0xEC00000065647574
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1953066613 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x795463697274656DLL && a2 == 0xEA00000000006570
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6D726F4665636170 && a2 == 0xEA00000000007461
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x65646E49656E6F7ALL && a2 == 0xE900000000000078
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024A61DDC0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

unint64_t lazy protocol witness table accessor for type KeyedDecodingContainer<VoiceFeedbackTargetZone.CodingKeys> and conformance KeyedDecodingContainer<A>()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type KeyedDecodingContainer<VoiceFeedbackTargetZone.CodingKeys> and conformance KeyedDecodingContainer<A>;
  if (!lazy protocol witness table cache variable for type KeyedDecodingContainer<VoiceFeedbackTargetZone.CodingKeys> and conformance KeyedDecodingContainer<A>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for KeyedDecodingContainer<VoiceFeedbackTargetZone.CodingKeys>);
    result = MEMORY[0x24BD152CC](MEMORY[0x24BEE33F8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type KeyedDecodingContainer<VoiceFeedbackTargetZone.CodingKeys> and conformance KeyedDecodingContainer<A>);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD152C0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t DistanceSplitModel.alertType.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t DistanceSplitModel.alertType.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*DistanceSplitModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

void __swiftcall DistanceSplitModel.init(index:paceMagnitude:duration:unit:paceFormat:)(WorkoutAnnouncements::DistanceSplitModel *__return_ptr retstr, Swift::Int index, Swift::Double paceMagnitude, Swift::Double_optional duration, Swift::String unit, WorkoutAnnouncements::VoiceFeedbackPaceFormat paceFormat)
{
  char v6;

  retstr->alertType = WorkoutAnnouncements_VoiceFeedbackAlertType_transitionedNotableDistance;
  retstr->index = index;
  retstr->magnitude = paceMagnitude;
  retstr->duration.value = *(Swift::Double *)&duration.is_nil;
  retstr->duration.is_nil = unit._countAndFlagsBits & 1;
  retstr->unit._countAndFlagsBits = (uint64_t)unit._object;
  retstr->unit._object = (void *)paceFormat;
  retstr->paceFormat = v6 & 1;
  retstr->shouldOmitDuration = unit._countAndFlagsBits & 1;
}

uint64_t DistanceSplitModel.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24A5EF624 + 4 * byte_24A61AFB0[a1]))(0xD000000000000012, 0x800000024A61DE50);
}

uint64_t sub_24A5EF624()
{
  return 0x7079547472656C61;
}

uint64_t sub_24A5EF668()
{
  return 0x6E6F697461727564;
}

uint64_t sub_24A5EF680()
{
  return 1953066613;
}

uint64_t sub_24A5EF690()
{
  return 0x6D726F4665636170;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance DistanceSplitModel.CodingKeys()
{
  unsigned __int8 *v0;

  return DistanceSplitModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance DistanceSplitModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized DistanceSplitModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance DistanceSplitModel.CodingKeys()
{
  lazy protocol witness table accessor for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance DistanceSplitModel.CodingKeys()
{
  lazy protocol witness table accessor for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t DistanceSplitModel.encode(to:)(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<DistanceSplitModel.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v10[15] = *v3;
  v10[14] = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    v10[13] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[12] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[11] = 3;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v10[10] = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[9] = v3[56];
    v10[8] = 5;
    lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    v10[7] = 6;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

double DistanceSplitModel.init(from:)@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  _OWORD v7[2];

  specialized DistanceSplitModel.init(from:)(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    a2[2] = v7[0];
    result = *(double *)((char *)v7 + 10);
    *(_OWORD *)((char *)a2 + 42) = *(_OWORD *)((char *)v7 + 10);
  }
  return result;
}

double protocol witness for Decodable.init(from:) in conformance DistanceSplitModel@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  _OWORD v7[2];

  specialized DistanceSplitModel.init(from:)(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    a2[2] = v7[0];
    result = *(double *)((char *)v7 + 10);
    *(_OWORD *)((char *)a2 + 42) = *(_OWORD *)((char *)v7 + 10);
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance DistanceSplitModel(_QWORD *a1)
{
  return DistanceSplitModel.encode(to:)(a1);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance DistanceSplitModel(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[2];
  _OWORD v6[2];
  _OWORD v7[2];
  _OWORD v8[2];

  v2 = a1[1];
  v5[0] = *a1;
  v5[1] = v2;
  v6[0] = a1[2];
  *(_OWORD *)((char *)v6 + 10) = *(_OWORD *)((char *)a1 + 42);
  v3 = a2[1];
  v7[0] = *a2;
  v7[1] = v3;
  v8[0] = a2[2];
  *(_OWORD *)((char *)v8 + 10) = *(_OWORD *)((char *)a2 + 42);
  return specialized static DistanceSplitModel.__derived_struct_equals(_:_:)((unsigned __int8 *)v5, (unsigned __int8 *)v7) & 1;
}

uint64_t DistanceSplitModel.executePattern(wrapper:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(*v2 + 24);
  v5 = *v2;
  swift_task_dealloc();
  v6 = outlined release of DistanceSplitModel(v4);
  if (!v1)
    v6 = a1;
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(v6);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(*v2 + 24);
  v5 = *v2;
  swift_task_dealloc();
  v6 = outlined release of DistanceSplitModel(v4);
  if (!v1)
    v6 = a1;
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(v6);
}

uint64_t DistanceSplitModel.executePattern(wrapper:)()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t (*v7)(char, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_BYTE *)(v1 + 56);
  v3 = *__swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
  outlined retain of DistanceSplitModel(v1);
  if ((v2 & 1) != 0)
  {
    v7 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistancePace(executeSashGroupOnWatch:_:)
                                                        + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistancePace(executeSashGroupOnWatch:_:));
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 40) = v4;
    v5 = DistanceSplitModel.executePattern(wrapper:);
  }
  else
  {
    v7 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistanceSpeed(executeSashGroupOnWatch:_:)
                                                        + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistanceSpeed(executeSashGroupOnWatch:_:));
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 32) = v4;
    v5 = DistanceSplitModel.executePattern(wrapper:);
  }
  *v4 = v0;
  v4[1] = v5;
  return v7(0, v3, *(_QWORD *)(v0 + 24));
}

uint64_t closure #1 in DistanceSplitModel.executePattern(wrapper:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(double *)(a1 + 24) = (double)*(uint64_t *)(a2 + 8);
  *(_BYTE *)(a1 + 32) = 0;
  if ((*(_BYTE *)(a2 + 32) & 1) == 0)
  {
    type metadata accessor for DialogDuration.Builder();
    swift_allocObject();
    DialogDuration.Builder.init()();
    dispatch thunk of DialogDuration.Builder.withSecs(_:)();
    swift_release();
    v7 = dispatch thunk of DialogDuration.Builder.build()();
    swift_release();
    swift_release();
    *(_QWORD *)a1 = v7;
  }
  type metadata accessor for DialogLength.Builder();
  swift_allocObject();
  MEMORY[0x24BD14B88]();
  dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
  swift_release();
  String.toDialogUnit.getter(*(_QWORD *)(a2 + 40), *(_QWORD *)(a2 + 48));
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  v8 = type metadata accessor for SpeakableString();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 0, 1, v8);
  dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
  swift_release();
  outlined destroy of Any?((uint64_t)v6, &demangling cache variable for type metadata for SpeakableString?);
  v9 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
  swift_release();
  result = swift_release();
  *(_QWORD *)(a1 + 16) = v9;
  return result;
}

uint64_t closure #2 in DistanceSplitModel.executePattern(wrapper:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(double *)(a1 + 24) = (double)*(uint64_t *)(a2 + 8);
  *(_BYTE *)(a1 + 32) = 0;
  if ((*(_BYTE *)(a2 + 32) & 1) == 0)
  {
    type metadata accessor for DialogDuration.Builder();
    swift_allocObject();
    DialogDuration.Builder.init()();
    dispatch thunk of DialogDuration.Builder.withSecs(_:)();
    swift_release();
    v7 = dispatch thunk of DialogDuration.Builder.build()();
    swift_release();
    swift_release();
    *(_QWORD *)a1 = v7;
  }
  type metadata accessor for DialogDuration.Builder();
  swift_allocObject();
  DialogDuration.Builder.init()();
  dispatch thunk of DialogDuration.Builder.withSecs(_:)();
  swift_release();
  v8 = dispatch thunk of DialogDuration.Builder.build()();
  swift_release();
  swift_release();
  *(_QWORD *)(a1 + 16) = v8;
  String.toDialogUnit.getter(*(_QWORD *)(a2 + 40), *(_QWORD *)(a2 + 48));
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  v9 = type metadata accessor for SpeakableString();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 0, 1, v9);
  v10 = type metadata accessor for WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters(0);
  return outlined assign with take of SpeakableString?((uint64_t)v6, a1 + *(int *)(v10 + 32));
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance DistanceSplitModel(uint64_t a1)
{
  _OWORD *v1;
  uint64_t v2;
  __int128 v4;
  _QWORD *v5;

  v4 = v1[1];
  *(_OWORD *)(v2 + 16) = *v1;
  *(_OWORD *)(v2 + 32) = v4;
  *(_OWORD *)(v2 + 48) = v1[2];
  *(_OWORD *)(v2 + 58) = *(_OWORD *)((char *)v1 + 42);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 80) = v5;
  *v5 = v2;
  v5[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance DistanceSplitModel;
  v5[2] = a1;
  v5[3] = v2 + 16;
  return swift_task_switch();
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t specialized DistanceSplitModel.init(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  int v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t result;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  char v44;
  unsigned int v45;
  BOOL v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  __int128 v56;
  __int128 v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  char v62;

  v4 = type metadata accessor for Logger();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = 1;
  if (*(_QWORD *)(specialized Sequence.compactMap<A>(_:)(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
    v8 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v8 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v56 = v8;
  v9 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v9, 1, &v56);
  swift_bridgeObjectRelease();
  v10 = v56;
  v11 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
  swift_retain_n();
  v12 = Logger.logObject.getter();
  v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v15 = swift_slowAlloc();
    v52 = a2;
    v50 = v15;
    *(_QWORD *)&v56 = v15;
    *(_DWORD *)v14 = 136315394;
    v51 = a1;
    v53 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000012, 0x800000024A61B070, (uint64_t *)&v56);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v14 + 12) = 2080;
    lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
    v49 = v4;
    swift_retain();
    v48 = v5;
    v16 = Dictionary.description.getter();
    v18 = v17;
    swift_release();
    v53 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v18, (uint64_t *)&v56);
    a1 = v51;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A5E6000, v12, v13, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v14, 0x16u);
    v19 = v50;
    swift_arrayDestroy();
    a2 = v52;
    MEMORY[0x24BD15374](v19, -1, -1);
    MEMORY[0x24BD15374](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v48 + 8))(v7, v49);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_25;
  v20 = specialized __RawDictionaryStorage.find<A>(_:)(3);
  if ((v21 & 1) == 0)
    goto LABEL_25;
  outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v20, (uint64_t)&v56);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_25;
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_25;
  v22 = v53;
  v23 = specialized __RawDictionaryStorage.find<A>(_:)(6);
  if ((v24 & 1) == 0)
    goto LABEL_25;
  outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v23, (uint64_t)&v56);
  if ((swift_dynamicCast() & 1) != 0
    && *(_QWORD *)(v10 + 16)
    && (v25 = v53, v26 = specialized __RawDictionaryStorage.find<A>(_:)(14), (v27 & 1) != 0)
    && (outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v26, (uint64_t)&v56), (swift_dynamicCast() & 1) != 0)
    && *(_QWORD *)(v10 + 16)
    && (v28 = v53, v29 = specialized __RawDictionaryStorage.find<A>(_:)(15), (v30 & 1) != 0)
    && (outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v29, (uint64_t)&v56), (swift_dynamicCast() & 1) != 0))
  {
    v31 = v54;
    v32 = v10;
    if (!*(_QWORD *)(v10 + 16)
      || (v33 = v53, v34 = specialized __RawDictionaryStorage.find<A>(_:)(12), (v35 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_release();
      goto LABEL_27;
    }
    outlined init with copy of Any(*(_QWORD *)(v32 + 56) + 32 * v34, (uint64_t)&v56);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v36 = a2;
      if (v53)
      {
        if (v53 != 1)
        {
          swift_release();
          goto LABEL_45;
        }
        LODWORD(v52) = 1;
      }
      else
      {
        LODWORD(v52) = 0;
      }
      if (*(_QWORD *)(v32 + 16))
      {
        swift_bridgeObjectRetain();
        v43 = specialized __RawDictionaryStorage.find<A>(_:)(2);
        if ((v44 & 1) != 0)
        {
          outlined init with copy of Any(*(_QWORD *)(v32 + 56) + 32 * v43, (uint64_t)&v56);
        }
        else
        {
          v56 = 0u;
          v57 = 0u;
        }
      }
      else
      {
        v56 = 0u;
        v57 = 0u;
        swift_bridgeObjectRetain();
      }
      swift_release();
      if (*((_QWORD *)&v57 + 1))
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v45 = 0;
          v40 = v53;
          goto LABEL_46;
        }
      }
      else
      {
        outlined destroy of Any?((uint64_t)&v56, &demangling cache variable for type metadata for Any?);
      }
      v40 = 0;
      v45 = (v28 & v55);
      if ((v28 & 1) != 0 || !v55)
      {
LABEL_46:
        LOBYTE(v56) = 20;
        *((_QWORD *)&v56 + 1) = v22;
        *(_QWORD *)&v57 = v25;
        *((_QWORD *)&v57 + 1) = v40;
        v58 = v45;
        v59 = v33;
        v60 = v31;
        v61 = v52;
        v62 = v28;
        swift_bridgeObjectRetain();
        v46 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1);
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease_n();
        if (v46)
        {
          v39 = v25;
          v41 = v45;
          if (v28)
            v47 = 256;
          else
            v47 = 0;
          v42 = v47 | v52;
          v38 = 20;
          goto LABEL_52;
        }
LABEL_51:
        result = swift_bridgeObjectRelease();
        v38 = 0;
        v22 = 0;
        v39 = 0;
        v40 = 0;
        v41 = 0;
        v33 = 0;
        v31 = 0;
        v42 = 0;
LABEL_52:
        a2 = v36;
        goto LABEL_28;
      }
      swift_bridgeObjectRelease();
LABEL_45:
      swift_bridgeObjectRelease();
      goto LABEL_51;
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_25:
    swift_release();
  }
  result = swift_bridgeObjectRelease();
LABEL_27:
  v38 = 0;
  v22 = 0;
  v39 = 0;
  v40 = 0;
  v41 = 0;
  v33 = 0;
  v31 = 0;
  v42 = 0;
LABEL_28:
  *(_QWORD *)a2 = v38;
  *(_QWORD *)(a2 + 8) = v22;
  *(_QWORD *)(a2 + 16) = v39;
  *(_QWORD *)(a2 + 24) = v40;
  *(_QWORD *)(a2 + 32) = v41;
  *(_QWORD *)(a2 + 40) = v33;
  *(_QWORD *)(a2 + 48) = v31;
  *(_WORD *)(a2 + 56) = v42;
  return result;
}

uint64_t specialized static DistanceSplitModel.__derived_struct_equals(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  char v4;
  char v5;

  if (*a1 != *a2 || *((_QWORD *)a1 + 1) != *((_QWORD *)a2 + 1) || *((double *)a1 + 2) != *((double *)a2 + 2))
    goto LABEL_14;
  v4 = a2[32];
  if ((a1[32] & 1) == 0)
  {
    if (*((double *)a1 + 3) != *((double *)a2 + 3))
      v4 = 1;
    if ((v4 & 1) == 0)
      goto LABEL_10;
LABEL_14:
    v4 = 0;
    return v4 & 1;
  }
  if (!a2[32])
    return v4 & 1;
LABEL_10:
  if (*((_QWORD *)a1 + 5) == *((_QWORD *)a2 + 5) && *((_QWORD *)a1 + 6) == *((_QWORD *)a2 + 6)
    || (v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), v4 = 0, (v5 & 1) != 0))
  {
    if (a1[56] == a2[56])
    {
      v4 = ((a1[57] & 1) == 0) ^ a2[57];
      return v4 & 1;
    }
    goto LABEL_14;
  }
  return v4 & 1;
}

unint64_t lazy protocol witness table accessor for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for DistanceSplitModel.CodingKeys, &unk_251BEA3B0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for DistanceSplitModel.CodingKeys, &unk_251BEA3B0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for DistanceSplitModel.CodingKeys, &unk_251BEA3B0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for DistanceSplitModel.CodingKeys, &unk_251BEA3B0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys);
  }
  return result;
}

uint64_t specialized DistanceSplitModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7079547472656C61 && a2 == 0xE900000000000065;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7865646E69 && a2 == 0xE500000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x647574696E67616DLL && a2 == 0xE900000000000065
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1953066613 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6D726F4665636170 && a2 == 0xEA00000000007461
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024A61DE50)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

uint64_t specialized DistanceSplitModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  char v26;
  char v27;
  unsigned __int8 v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<DistanceSplitModel.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  v33 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v9 = v34;
  v32 = 1;
  v10 = KeyedDecodingContainer.decode(_:forKey:)();
  v31 = 2;
  KeyedDecodingContainer.decode(_:forKey:)();
  v12 = v11;
  v30 = 3;
  v13 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  v24 = v14;
  v25 = v13;
  v29 = 4;
  v15 = KeyedDecodingContainer.decode(_:forKey:)();
  v17 = v16;
  v22 = v15;
  v27 = 5;
  lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
  swift_bridgeObjectRetain();
  v23 = v17;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v21 = v28;
  v26 = 6;
  LOBYTE(v17) = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  v18 = v23;
  result = swift_bridgeObjectRelease();
  *(_BYTE *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v10;
  *(_QWORD *)(a2 + 16) = v12;
  *(_QWORD *)(a2 + 24) = v25;
  *(_BYTE *)(a2 + 32) = v24 & 1;
  *(_QWORD *)(a2 + 40) = v22;
  *(_QWORD *)(a2 + 48) = v18;
  *(_BYTE *)(a2 + 56) = v21;
  *(_BYTE *)(a2 + 57) = v17 & 1;
  return result;
}

unint64_t instantiation function for generic protocol witness table for DistanceSplitModel(_QWORD *a1)
{
  unint64_t result;

  a1[1] = lazy protocol witness table accessor for type DistanceSplitModel and conformance DistanceSplitModel();
  a1[2] = lazy protocol witness table accessor for type DistanceSplitModel and conformance DistanceSplitModel();
  result = lazy protocol witness table accessor for type DistanceSplitModel and conformance DistanceSplitModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type DistanceSplitModel and conformance DistanceSplitModel()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DistanceSplitModel and conformance DistanceSplitModel;
  if (!lazy protocol witness table cache variable for type DistanceSplitModel and conformance DistanceSplitModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for DistanceSplitModel, &type metadata for DistanceSplitModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DistanceSplitModel and conformance DistanceSplitModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DistanceSplitModel and conformance DistanceSplitModel;
  if (!lazy protocol witness table cache variable for type DistanceSplitModel and conformance DistanceSplitModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for DistanceSplitModel, &type metadata for DistanceSplitModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DistanceSplitModel and conformance DistanceSplitModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type DistanceSplitModel and conformance DistanceSplitModel;
  if (!lazy protocol witness table cache variable for type DistanceSplitModel and conformance DistanceSplitModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for DistanceSplitModel, &type metadata for DistanceSplitModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DistanceSplitModel and conformance DistanceSplitModel);
  }
  return result;
}

uint64_t destroy for DistanceSplitModel()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DistanceSplitModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v3 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v3;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DistanceSplitModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  return a1;
}

__n128 __swift_memcpy58_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 42) = *(_OWORD *)(a2 + 42);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DistanceSplitModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  return a1;
}

uint64_t getEnumTagSinglePayload for DistanceSplitModel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 58))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DistanceSplitModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 58) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 48) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 58) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DistanceSplitModel()
{
  return &type metadata for DistanceSplitModel;
}

uint64_t storeEnumTagSinglePayload for DistanceSplitModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_24A5F10A0 + 4 * byte_24A61AFBC[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_24A5F10D4 + 4 * byte_24A61AFB7[v4]))();
}

uint64_t sub_24A5F10D4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5F10DC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A5F10E4);
  return result;
}

uint64_t sub_24A5F10F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A5F10F8);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_24A5F10FC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5F1104(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for DistanceSplitModel.CodingKeys()
{
  return &unk_251BEA3B0;
}

uint64_t outlined retain of DistanceSplitModel(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t outlined release of DistanceSplitModel(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t HalfwayGoalCompletionModel.alertType.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*HalfwayGoalCompletionModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

WorkoutAnnouncements::HalfwayGoalCompletionModel __swiftcall HalfwayGoalCompletionModel.init(magnitude:unit:)(Swift::Double magnitude, Swift::String unit)
{
  void *object;
  uint64_t countAndFlagsBits;
  WorkoutAnnouncements::VoiceFeedbackAlertType v4;
  WorkoutAnnouncements::HalfwayGoalCompletionModel result;

  object = unit._object;
  countAndFlagsBits = unit._countAndFlagsBits;
  v4 = WorkoutAnnouncements_VoiceFeedbackAlertType_goalHalfwayPoint;
  result.magnitude = magnitude;
  result.unit._object = object;
  result.unit._countAndFlagsBits = countAndFlagsBits;
  result.alertType = v4;
  return result;
}

uint64_t static HalfwayGoalCompletionModel.__derived_struct_equals(_:_:)(char a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, double a7, double a8)
{
  if (a1 != a4 || a7 != a8)
    return 0;
  if (a2 == a5 && a3 == a6)
    return 1;
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t HalfwayGoalCompletionModel.CodingKeys.stringValue.getter(char a1)
{
  return *(_QWORD *)&aAlerttypmagnit_0[8 * a1];
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance HalfwayGoalCompletionModel.CodingKeys()
{
  char *v0;

  return HalfwayGoalCompletionModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance HalfwayGoalCompletionModel.CodingKeys()
{
  lazy protocol witness table accessor for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance HalfwayGoalCompletionModel.CodingKeys()
{
  lazy protocol witness table accessor for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t HalfwayGoalCompletionModel.encode(to:)(_QWORD *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  char v13;
  char v14;
  char v15;
  char v16;

  v12 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<HalfwayGoalCompletionModel.CodingKeys>);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v16 = a2;
  v15 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v4)
  {
    v14 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v13 = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

double HalfwayGoalCompletionModel.init(from:)(_QWORD *a1)
{
  return specialized HalfwayGoalCompletionModel.init(from:)(a1);
}

void protocol witness for Decodable.init(from:) in conformance HalfwayGoalCompletionModel(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v4;
  uint64_t v5;
  uint64_t v6;
  double v7;

  v7 = specialized HalfwayGoalCompletionModel.init(from:)(a1);
  if (!v2)
  {
    *(_BYTE *)a2 = v4;
    *(double *)(a2 + 8) = v7;
    *(_QWORD *)(a2 + 16) = v5;
    *(_QWORD *)(a2 + 24) = v6;
  }
}

uint64_t protocol witness for Encodable.encode(to:) in conformance HalfwayGoalCompletionModel(_QWORD *a1)
{
  uint64_t v1;

  return HalfwayGoalCompletionModel.encode(to:)(a1, *(_BYTE *)v1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance HalfwayGoalCompletionModel(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1[1];
  v3 = v1[3];
  v2[4] = v1[2];
  v2[5] = v3;
  return swift_task_switch();
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance HalfwayGoalCompletionModel()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(char, uint64_t, uint64_t, uint64_t, double);

  v1 = *__swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
  v4 = (uint64_t (*)(char, uint64_t, uint64_t, uint64_t, double))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalHalfwayPoint(executeSashGroupOnWatch:_:)
                                                                       + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalHalfwayPoint(executeSashGroupOnWatch:_:));
  swift_bridgeObjectRetain();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  *v2 = v0;
  v2[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance GoalCompletionModel;
  return v4(0, v1, *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(double *)(v0 + 24));
}

unint64_t lazy protocol witness table accessor for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for HalfwayGoalCompletionModel.CodingKeys, &unk_251BEA5D0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for HalfwayGoalCompletionModel.CodingKeys, &unk_251BEA5D0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for HalfwayGoalCompletionModel.CodingKeys, &unk_251BEA5D0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for HalfwayGoalCompletionModel.CodingKeys, &unk_251BEA5D0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys);
  }
  return result;
}

uint64_t specialized HalfwayGoalCompletionModel.init(with:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v30;
  unint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t *v43;
  void (*v44)(char *, uint64_t, uint64_t);
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48[2];
  __int128 v49;
  __int128 v50;

  v2 = type metadata accessor for Logger();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v40 - v7;
  if (*(_QWORD *)(specialized Sequence.compactMap<A>(_:)(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
    v9 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v9 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v49 = v9;
  v10 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v10, 1, &v49);
  swift_bridgeObjectRelease();
  v11 = v49;
  v12 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  v44 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v44(v8, v12, v2);
  swift_retain_n();
  v13 = Logger.logObject.getter();
  v14 = static os_log_type_t.debug.getter();
  v15 = os_log_type_enabled(v13, v14);
  v46 = v6;
  if (v15)
  {
    v16 = swift_slowAlloc();
    v42 = v3;
    v17 = v16;
    v41 = swift_slowAlloc();
    *(_QWORD *)&v49 = v41;
    *(_DWORD *)v17 = 136315394;
    v48[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001ALL, 0x800000024A61B280, (uint64_t *)&v49);
    v45 = v2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v17 + 12) = 2080;
    v40 = v17 + 14;
    lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
    v18 = a1;
    swift_retain();
    v43 = (uint8_t *)v12;
    v19 = Dictionary.description.getter();
    v21 = v20;
    swift_release();
    v22 = v19;
    a1 = v18;
    v48[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v21, (uint64_t *)&v49);
    v2 = v45;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A5E6000, v13, v14, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v17, 0x16u);
    v23 = v41;
    v12 = (uint64_t)v43;
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v23, -1, -1);
    MEMORY[0x24BD15374](v17, -1, -1);

    v24 = *(void (**)(char *, uint64_t))(v42 + 8);
  }
  else
  {

    swift_release_n();
    v24 = *(void (**)(char *, uint64_t))(v3 + 8);
  }
  v24(v8, v2);
  if (!*(_QWORD *)(v11 + 16)
    || (v25 = specialized __RawDictionaryStorage.find<A>(_:)(6), (v26 & 1) == 0)
    || (outlined init with copy of Any(*(_QWORD *)(v11 + 56) + 32 * v25, (uint64_t)&v49), (swift_dynamicCast() & 1) == 0))
  {
    swift_release();
    goto LABEL_14;
  }
  if (*(_QWORD *)(v11 + 16) && (v27 = specialized __RawDictionaryStorage.find<A>(_:)(15), (v28 & 1) != 0))
  {
    outlined init with copy of Any(*(_QWORD *)(v11 + 56) + 32 * v27, (uint64_t)&v49);
  }
  else
  {
    v49 = 0u;
    v50 = 0u;
  }
  swift_release();
  if (!*((_QWORD *)&v50 + 1))
  {
    swift_bridgeObjectRelease();
    outlined destroy of Any?((uint64_t)&v49, &demangling cache variable for type metadata for Any?);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_14;
  v30 = v48[0];
  v31 = v48[1];
  swift_beginAccess();
  v44(v46, v12, v2);
  swift_bridgeObjectRetain_n();
  v32 = Logger.logObject.getter();
  v33 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    v35 = swift_slowAlloc();
    v45 = v2;
    v36 = v35;
    v48[0] = v35;
    v44 = (void (*)(char *, uint64_t, uint64_t))a1;
    *(_DWORD *)v34 = 136315138;
    v43 = v34 + 4;
    swift_bridgeObjectRetain();
    v47 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, v48);
    a1 = (uint64_t)v44;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24A5E6000, v32, v33, "Value for unit: %s", v34, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v36, -1, -1);
    MEMORY[0x24BD15374](v34, -1, -1);

    v38 = v45;
    v37 = v46;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v37 = v46;
    v38 = v2;
  }
  v24(v37, v38);
  swift_bridgeObjectRetain();
  v39 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1, 2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v39 & 1) == 0)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    return 0;
  }
  return 2;
}

uint64_t specialized closure #1 in HalfwayGoalCompletionModel.executePattern(wrapper:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = String.toDialogUnit.getter(a2, a3);
  v13 = v11;
  if (v12 == 115 && v11 == 0xE100000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    type metadata accessor for DialogDuration.Builder();
    swift_allocObject();
    DialogDuration.Builder.init()();
    dispatch thunk of DialogDuration.Builder.withSecs(_:)();
    swift_release();
    v14 = dispatch thunk of DialogDuration.Builder.build()();
    swift_release();
    result = swift_release();
    *(_QWORD *)a1 = v14;
  }
  else if ((String.isDialogDistanceUnit.getter(v12, v13) & 1) != 0)
  {
    type metadata accessor for DialogLength.Builder();
    swift_allocObject();
    MEMORY[0x24BD14B88]();
    dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
    swift_release();
    String.toSpeakableString.getter();
    swift_bridgeObjectRelease();
    v16 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v10, 0, 1, v16);
    dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
    swift_release();
    outlined destroy of Any?((uint64_t)v10, &demangling cache variable for type metadata for SpeakableString?);
    v17 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
    swift_release();
    result = swift_release();
    *(_QWORD *)(a1 + 16) = v17;
  }
  else
  {
    *(double *)(a1 + 24) = a4;
    *(_BYTE *)(a1 + 32) = 0;
    String.toSpeakableString.getter();
    swift_bridgeObjectRelease();
    v18 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v10, 0, 1, v18);
    v19 = type metadata accessor for WorkoutVoiceFeedbackGoalHalfwayPointParameters(0);
    return outlined assign with take of SpeakableString?((uint64_t)v10, a1 + *(int *)(v19 + 32));
  }
  return result;
}

double specialized HalfwayGoalCompletionModel.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  double v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  double v8;
  uint64_t v10;
  char v11;
  char v12;
  char v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<HalfwayGoalCompletionModel.CodingKeys>);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v1)
  {
    v13 = 0;
    lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v12 = 1;
    KeyedDecodingContainer.decode(_:forKey:)();
    v2 = v8;
    v11 = 2;
    KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return v2;
}

unint64_t instantiation function for generic protocol witness table for HalfwayGoalCompletionModel(_QWORD *a1)
{
  unint64_t result;

  a1[1] = lazy protocol witness table accessor for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel();
  a1[2] = lazy protocol witness table accessor for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel();
  result = lazy protocol witness table accessor for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel;
  if (!lazy protocol witness table cache variable for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for HalfwayGoalCompletionModel, &type metadata for HalfwayGoalCompletionModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel;
  if (!lazy protocol witness table cache variable for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for HalfwayGoalCompletionModel, &type metadata for HalfwayGoalCompletionModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel;
  if (!lazy protocol witness table cache variable for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for HalfwayGoalCompletionModel, &type metadata for HalfwayGoalCompletionModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel);
  }
  return result;
}

ValueMetadata *type metadata accessor for HalfwayGoalCompletionModel()
{
  return &type metadata for HalfwayGoalCompletionModel;
}

uint64_t storeEnumTagSinglePayload for HalfwayGoalCompletionModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A5F2170 + 4 * byte_24A61B1C5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24A5F21A4 + 4 * byte_24A61B1C0[v4]))();
}

uint64_t sub_24A5F21A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5F21AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A5F21B4);
  return result;
}

uint64_t sub_24A5F21C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A5F21C8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24A5F21CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5F21D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for HalfwayGoalCompletionModel.CodingKeys()
{
  return &unk_251BEA5D0;
}

uint64_t VoiceFeedbackAlertType.rawValue.getter(uint64_t result)
{
  return result;
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance VoiceFeedbackAlertType@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized VoiceFeedbackAlertType.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance VoiceFeedbackAlertType(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t protocol witness for Decodable.init(from:) in conformance VoiceFeedbackAlertType()
{
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance VoiceFeedbackAlertType()
{
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  return RawRepresentable<>.encode(to:)();
}

unint64_t specialized VoiceFeedbackAlertType.init(rawValue:)(unint64_t result)
{
  if (result >= 0x19)
    return 25;
  return result;
}

unint64_t instantiation function for generic protocol witness table for VoiceFeedbackAlertType(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for VoiceFeedbackAlertType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xE8)
    goto LABEL_17;
  if (a2 + 24 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 24) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 24;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 24;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 24;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x19;
  v8 = v6 - 25;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for VoiceFeedbackAlertType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 24 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 24) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE7)
    return ((uint64_t (*)(void))((char *)&loc_24A5F254C + 4 * byte_24A61B415[v4]))();
  *a1 = a2 + 24;
  return ((uint64_t (*)(void))((char *)sub_24A5F2580 + 4 * byte_24A61B410[v4]))();
}

uint64_t sub_24A5F2580(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5F2588(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A5F2590);
  return result;
}

uint64_t sub_24A5F259C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A5F25A4);
  *(_BYTE *)result = a2 + 24;
  return result;
}

uint64_t sub_24A5F25A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5F25B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for VoiceFeedbackAlertType()
{
  return &type metadata for VoiceFeedbackAlertType;
}

uint64_t String.toDialogUnit.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = 1818321771;
  if ((a1 != 7102787 || a2 != 0xE300000000000000) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    v4 = 0x7364726179;
    if ((a1 != 25721 || a2 != 0xE200000000000000) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      v4 = 0x73726574656DLL;
      if ((a1 != 109 || a2 != 0xE100000000000000) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        v4 = 0x6574656D6F6C696BLL;
        if ((a1 != 28011 || a2 != 0xE200000000000000) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          v4 = 0x73656C696DLL;
          if ((a1 != 26989 || a2 != 0xE200000000000000) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
          {
            swift_bridgeObjectRetain();
            return a1;
          }
        }
      }
    }
  }
  return v4;
}

uint64_t String.isDialogDistanceUnit.getter(uint64_t a1, uint64_t a2)
{
  uint64_t inited;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A61B570;
  *(_QWORD *)(inited + 32) = 0xD000000000000012;
  *(_QWORD *)(inited + 40) = 0x800000024A61E1E0;
  *(_QWORD *)(inited + 48) = 0x74656D69746E6563;
  *(_QWORD *)(inited + 56) = 0xEB00000000737265;
  *(_QWORD *)(inited + 64) = 1952802150;
  *(_QWORD *)(inited + 72) = 0xE400000000000000;
  *(_QWORD *)(inited + 80) = 0x736568636E69;
  *(_QWORD *)(inited + 88) = 0xE600000000000000;
  *(_QWORD *)(inited + 96) = 0x6574656D6F6C696BLL;
  *(_QWORD *)(inited + 104) = 0xEA00000000007372;
  *(_QWORD *)(inited + 112) = 0x657920746867696CLL;
  *(_QWORD *)(inited + 120) = 0xEB00000000737261;
  *(_QWORD *)(inited + 128) = 0x73726574656DLL;
  *(_QWORD *)(inited + 136) = 0xE600000000000000;
  *(_QWORD *)(inited + 144) = 0x73656C696DLL;
  *(_QWORD *)(inited + 152) = 0xE500000000000000;
  *(_QWORD *)(inited + 160) = 0x74656D696C6C696DLL;
  *(_QWORD *)(inited + 168) = 0xEB00000000737265;
  strcpy((char *)(inited + 176), "nautical miles");
  *(_BYTE *)(inited + 191) = -18;
  *(_QWORD *)(inited + 192) = 0x7364726179;
  *(_QWORD *)(inited + 200) = 0xE500000000000000;
  LOBYTE(a2) = specialized Sequence<>.contains(_:)(a1, a2, (_QWORD *)inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  return a2 & 1;
}

uint64_t WorkoutReminderControlsFlow.on(input:)()
{
  return 1;
}

uint64_t WorkoutReminderControlsFlow.execute(completion:)()
{
  lazy protocol witness table accessor for type WorkoutReminderControlsFlow and conformance WorkoutReminderControlsFlow();
  return Flow.deferToExecuteAsync(_:)();
}

unint64_t lazy protocol witness table accessor for type WorkoutReminderControlsFlow and conformance WorkoutReminderControlsFlow()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type WorkoutReminderControlsFlow and conformance WorkoutReminderControlsFlow;
  if (!lazy protocol witness table cache variable for type WorkoutReminderControlsFlow and conformance WorkoutReminderControlsFlow)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for WorkoutReminderControlsFlow, &type metadata for WorkoutReminderControlsFlow);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type WorkoutReminderControlsFlow and conformance WorkoutReminderControlsFlow);
  }
  return result;
}

uint64_t WorkoutReminderControlsFlow.execute()(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[6] = a1;
  v2 = type metadata accessor for Logger();
  v1[7] = v2;
  v1[8] = *(_QWORD *)(v2 - 8);
  v1[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t WorkoutReminderControlsFlow.execute()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v2 = *(_QWORD *)(v0 + 64);
  v1 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v8 = *(_QWORD *)(v0 + 64);
    v7 = *(_QWORD *)(v0 + 72);
    v9 = *(_QWORD *)(v0 + 56);
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v16 = v11;
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v0 + 40) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001BLL, 0x800000024A61B560, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_24A5E6000, v5, v6, "%s should only be called on Apple Watch", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v11, -1, -1);
    MEMORY[0x24BD15374](v10, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  else
  {
    v13 = *(_QWORD *)(v0 + 64);
    v12 = *(_QWORD *)(v0 + 72);
    v14 = *(_QWORD *)(v0 + 56);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  static ExecuteResponse.complete()();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t protocol witness for Flow.execute(completion:) in conformance WorkoutReminderControlsFlow()
{
  return Flow.deferToExecuteAsync(_:)();
}

uint64_t protocol witness for Flow.execute() in conformance WorkoutReminderControlsFlow(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = protocol witness for Flow.execute() in conformance VoiceFeedbackAnnouncementFlow;
  return WorkoutReminderControlsFlow.execute()(a1);
}

uint64_t destroy for WorkoutReminderControlsFlow()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for WorkoutReminderControlsFlow(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WorkoutReminderControlsFlow(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for WorkoutReminderControlsFlow(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutReminderControlsFlow(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WorkoutReminderControlsFlow(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkoutReminderControlsFlow()
{
  return &type metadata for WorkoutReminderControlsFlow;
}

uint64_t LapCompletionModel.alertType.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t LapCompletionModel.alertType.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*LapCompletionModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

void __swiftcall LapCompletionModel.init(index:paceMagnitude:unit:paceFormat:)(WorkoutAnnouncements::LapCompletionModel *__return_ptr retstr, Swift::Int index, Swift::Double paceMagnitude, Swift::String unit, WorkoutAnnouncements::VoiceFeedbackPaceFormat paceFormat)
{
  retstr->alertType = WorkoutAnnouncements_VoiceFeedbackAlertType_lapCompletion;
  retstr->index = index;
  retstr->magnitude = paceMagnitude;
  retstr->unit = unit;
  retstr->paceFormat = paceFormat & 1;
}

uint64_t LapCompletionModel.CodingKeys.stringValue.getter(char a1)
{
  return *(_QWORD *)&aAlerttypindex[8 * a1];
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance LapCompletionModel.CodingKeys()
{
  char *v0;

  return LapCompletionModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance LapCompletionModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized LapCompletionModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance LapCompletionModel.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance LapCompletionModel.CodingKeys()
{
  lazy protocol witness table accessor for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance LapCompletionModel.CodingKeys()
{
  lazy protocol witness table accessor for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t LapCompletionModel.encode(to:)(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<LapCompletionModel.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v10[15] = *v3;
  v10[14] = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    v10[13] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[12] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[11] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[10] = v3[40];
    v10[9] = 4;
    lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

double LapCompletionModel.init(from:)@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  _OWORD v7[2];

  specialized LapCompletionModel.init(from:)(a1, (uint64_t)&v6);
  if (!v2)
  {
    v5 = v7[0];
    *a2 = v6;
    a2[1] = v5;
    result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 25) = *(_OWORD *)((char *)v7 + 9);
  }
  return result;
}

double protocol witness for Decodable.init(from:) in conformance LapCompletionModel@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  _OWORD v7[2];

  specialized LapCompletionModel.init(from:)(a1, (uint64_t)&v6);
  if (!v2)
  {
    v5 = v7[0];
    *a2 = v6;
    a2[1] = v5;
    result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 25) = *(_OWORD *)((char *)v7 + 9);
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance LapCompletionModel(_QWORD *a1)
{
  return LapCompletionModel.encode(to:)(a1);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance LapCompletionModel(__int128 *a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;
  _OWORD v8[2];

  v2 = a1[1];
  v5 = *a1;
  v6[0] = v2;
  *(_OWORD *)((char *)v6 + 9) = *(__int128 *)((char *)a1 + 25);
  v3 = a2[1];
  v7 = *a2;
  v8[0] = v3;
  *(_OWORD *)((char *)v8 + 9) = *(__int128 *)((char *)a2 + 25);
  return specialized static LapCompletionModel.__derived_struct_equals(_:_:)((unsigned __int8 *)&v5, (unsigned __int8 *)&v7) & 1;
}

uint64_t LapCompletionModel.executePattern(wrapper:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(*v2 + 24);
  v5 = *v2;
  swift_task_dealloc();
  v6 = outlined release of LapCompletionModel(v4);
  if (!v1)
    v6 = a1;
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(v6);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(*v2 + 24);
  v5 = *v2;
  swift_task_dealloc();
  v6 = outlined release of LapCompletionModel(v4);
  if (!v1)
    v6 = a1;
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(v6);
}

uint64_t LapCompletionModel.executePattern(wrapper:)()
{
  uint64_t v0;
  char v1;
  uint64_t *v2;
  double *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  _QWORD *v12;
  char *v13;
  char *v14;

  v1 = *(_BYTE *)(*(_QWORD *)(v0 + 24) + 40);
  v2 = __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
  v3 = *(double **)(v0 + 24);
  if ((v1 & 1) != 0)
  {
    v5 = *((_QWORD *)v3 + 3);
    v4 = *((_QWORD *)v3 + 4);
    v6 = *v2;
    v7 = v3[2];
    v8 = *((_QWORD *)v3 + 1);
    outlined retain of LapCompletionModel((uint64_t)v3);
    v13 = (char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionPace(executeSashGroupOnWatch:_:)
        + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionPace(executeSashGroupOnWatch:_:);
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 40) = v9;
    *v9 = v0;
    v9[1] = LapCompletionModel.executePattern(wrapper:);
    return ((uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, double))v13)(0, v6, v8, v5, v4, v7);
  }
  else
  {
    v11 = *v2;
    outlined retain of LapCompletionModel((uint64_t)v3);
    v14 = (char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionSpeed(executeSashGroupOnWatch:_:)
        + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionSpeed(executeSashGroupOnWatch:_:);
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 32) = v12;
    *v12 = v0;
    v12[1] = LapCompletionModel.executePattern(wrapper:);
    return ((uint64_t (*)(_QWORD, uint64_t, _QWORD))v14)(0, v11, *(_QWORD *)(v0 + 24));
  }
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance LapCompletionModel(uint64_t a1)
{
  _OWORD *v1;
  uint64_t v2;
  __int128 v4;
  _QWORD *v5;

  v4 = v1[1];
  *(_OWORD *)(v2 + 16) = *v1;
  *(_OWORD *)(v2 + 32) = v4;
  *(_OWORD *)(v2 + 41) = *(_OWORD *)((char *)v1 + 25);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 64) = v5;
  *v5 = v2;
  v5[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance LapCompletionModel;
  v5[2] = a1;
  v5[3] = v2 + 16;
  return swift_task_switch();
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t specialized LapCompletionModel.init(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t result;
  uint64_t v33;
  char v34;
  char v35;
  _QWORD v36[2];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;

  v4 = type metadata accessor for Logger();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(specialized Sequence.compactMap<A>(_:)(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
    v8 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v8 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v43 = v8;
  v9 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v9, 1, &v43);
  swift_bridgeObjectRelease();
  v10 = v43;
  v11 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
  swift_retain_n();
  v12 = Logger.logObject.getter();
  v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v38 = swift_slowAlloc();
    *(_QWORD *)&v43 = v38;
    *(_DWORD *)v14 = 136315394;
    v40 = a1;
    v41 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000012, 0x800000024A61B6E0, (uint64_t *)&v43);
    v39 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v14 + 12) = 2080;
    v36[1] = v14 + 14;
    lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
    v37 = v4;
    swift_retain();
    v15 = Dictionary.description.getter();
    v16 = a2;
    v18 = v17;
    swift_release();
    v41 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v18, (uint64_t *)&v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    a2 = v16;
    a1 = v40;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A5E6000, v12, v13, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v14, 0x16u);
    v19 = v38;
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v19, -1, -1);
    MEMORY[0x24BD15374](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v39 + 8))(v7, v37);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  if (*(_QWORD *)(v10 + 16)
    && (v20 = specialized __RawDictionaryStorage.find<A>(_:)(6), (v21 & 1) != 0)
    && (outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v20, (uint64_t)&v43), (swift_dynamicCast() & 1) != 0)
    && *(_QWORD *)(v10 + 16)
    && (v22 = v41, v23 = specialized __RawDictionaryStorage.find<A>(_:)(15), (v24 & 1) != 0)
    && (outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v23, (uint64_t)&v43), (swift_dynamicCast() & 1) != 0))
  {
    v25 = v42;
    if (!*(_QWORD *)(v10 + 16)
      || (v26 = v41, v27 = specialized __RawDictionaryStorage.find<A>(_:)(3), (v28 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_release();
      goto LABEL_21;
    }
    outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v27, (uint64_t)&v43);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v29 = v41;
      if (*(_QWORD *)(v10 + 16) && (v30 = specialized __RawDictionaryStorage.find<A>(_:)(12), (v31 & 1) != 0))
      {
        outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v30, (uint64_t)&v43);
      }
      else
      {
        v43 = 0u;
        v44 = 0u;
      }
      swift_release();
      if (*((_QWORD *)&v44 + 1))
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          if (!v41)
          {
            v34 = 0;
LABEL_35:
            swift_bridgeObjectRetain();
            v35 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1, 5);
            swift_bridgeObjectRelease();
            result = swift_bridgeObjectRelease();
            if ((v35 & 1) != 0)
            {
              v33 = 5;
              goto LABEL_22;
            }
            goto LABEL_20;
          }
          if (v41 == 1)
          {
            v34 = 1;
            goto LABEL_35;
          }
        }
      }
      else
      {
        outlined destroy of Any?((uint64_t)&v43);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_release();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_release();
  }
LABEL_20:
  result = swift_bridgeObjectRelease();
LABEL_21:
  v33 = 0;
  v29 = 0;
  v22 = 0;
  v26 = 0;
  v25 = 0;
  v34 = 0;
LABEL_22:
  *(_QWORD *)a2 = v33;
  *(_QWORD *)(a2 + 8) = v29;
  *(_QWORD *)(a2 + 16) = v22;
  *(_QWORD *)(a2 + 24) = v26;
  *(_QWORD *)(a2 + 32) = v25;
  *(_BYTE *)(a2 + 40) = v34;
  return result;
}

uint64_t specialized static LapCompletionModel.__derived_struct_equals(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  BOOL v4;
  char v5;
  char v6;

  if (*a1 == *a2 && *((_QWORD *)a1 + 1) == *((_QWORD *)a2 + 1) && *((double *)a1 + 2) == *((double *)a2 + 2))
  {
    v4 = *((_QWORD *)a1 + 3) == *((_QWORD *)a2 + 3) && *((_QWORD *)a1 + 4) == *((_QWORD *)a2 + 4);
    if (v4 || (v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), v6 = 0, (v5 & 1) != 0))
      v6 = a1[40] ^ a2[40] ^ 1;
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

unint64_t lazy protocol witness table accessor for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for LapCompletionModel.CodingKeys, &unk_251BEA9E0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for LapCompletionModel.CodingKeys, &unk_251BEA9E0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for LapCompletionModel.CodingKeys, &unk_251BEA9E0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for LapCompletionModel.CodingKeys, &unk_251BEA9E0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys);
  }
  return result;
}

uint64_t specialized LapCompletionModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7079547472656C61 && a2 == 0xE900000000000065;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7865646E69 && a2 == 0xE500000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x647574696E67616DLL && a2 == 0xE900000000000065
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1953066613 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6D726F4665636170 && a2 == 0xEA00000000007461)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t specialized LapCompletionModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<LapCompletionModel.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  v26 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v9 = v27;
  v25 = 1;
  v10 = KeyedDecodingContainer.decode(_:forKey:)();
  v24 = 2;
  KeyedDecodingContainer.decode(_:forKey:)();
  v12 = v11;
  v23 = 3;
  v13 = KeyedDecodingContainer.decode(_:forKey:)();
  v15 = v14;
  v19 = v13;
  v21 = 4;
  lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
  v20 = v15;
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  LOBYTE(v15) = v22;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  v16 = v20;
  result = swift_bridgeObjectRelease();
  *(_BYTE *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v10;
  *(_QWORD *)(a2 + 16) = v12;
  *(_QWORD *)(a2 + 24) = v19;
  *(_QWORD *)(a2 + 32) = v16;
  *(_BYTE *)(a2 + 40) = v15;
  return result;
}

unint64_t instantiation function for generic protocol witness table for LapCompletionModel(_QWORD *a1)
{
  unint64_t result;

  a1[1] = lazy protocol witness table accessor for type LapCompletionModel and conformance LapCompletionModel();
  a1[2] = lazy protocol witness table accessor for type LapCompletionModel and conformance LapCompletionModel();
  result = lazy protocol witness table accessor for type LapCompletionModel and conformance LapCompletionModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type LapCompletionModel and conformance LapCompletionModel()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LapCompletionModel and conformance LapCompletionModel;
  if (!lazy protocol witness table cache variable for type LapCompletionModel and conformance LapCompletionModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for LapCompletionModel, &type metadata for LapCompletionModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LapCompletionModel and conformance LapCompletionModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LapCompletionModel and conformance LapCompletionModel;
  if (!lazy protocol witness table cache variable for type LapCompletionModel and conformance LapCompletionModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for LapCompletionModel, &type metadata for LapCompletionModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LapCompletionModel and conformance LapCompletionModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LapCompletionModel and conformance LapCompletionModel;
  if (!lazy protocol witness table cache variable for type LapCompletionModel and conformance LapCompletionModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for LapCompletionModel, &type metadata for LapCompletionModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LapCompletionModel and conformance LapCompletionModel);
  }
  return result;
}

uint64_t destroy for LapCompletionModel()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LapCompletionModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v3;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LapCompletionModel(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for LapCompletionModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for LapCompletionModel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 41))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LapCompletionModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 41) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LapCompletionModel()
{
  return &type metadata for LapCompletionModel;
}

uint64_t getEnumTagSinglePayload for LapCompletionModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for LapCompletionModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A5F4230 + 4 * byte_24A61B625[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_24A5F4264 + 4 * byte_24A61B620[v4]))();
}

uint64_t sub_24A5F4264(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5F426C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A5F4274);
  return result;
}

uint64_t sub_24A5F4280(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A5F4288);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_24A5F428C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5F4294(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for LapCompletionModel.CodingKeys()
{
  return &unk_251BEA9E0;
}

uint64_t outlined retain of LapCompletionModel(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t outlined release of LapCompletionModel(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t WorkoutReminderAnnouncementFlow.__allocating_init(flowConfig:deviceResolutionService:)(__int128 *a1, __int128 *a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  type metadata accessor for WorkoutReminderAnnouncementFlow.State(0);
  swift_storeEnumTagMultiPayload();
  outlined init with take of VoiceFeedbackPatternResolving(a1, v4 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_flowConfig);
  outlined init with take of VoiceFeedbackPatternResolving(a2, v4 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_deviceResolutionService);
  return v4;
}

uint64_t WorkoutReminderAnnouncementFlow.init(flowConfig:deviceResolutionService:)(__int128 *a1, __int128 *a2)
{
  uint64_t v2;

  type metadata accessor for WorkoutReminderAnnouncementFlow.State(0);
  swift_storeEnumTagMultiPayload();
  outlined init with take of VoiceFeedbackPatternResolving(a1, v2 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_flowConfig);
  outlined init with take of VoiceFeedbackPatternResolving(a2, v2 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_deviceResolutionService);
  return v2;
}

uint64_t type metadata accessor for WorkoutReminderAnnouncementFlow.State(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutReminderAnnouncementFlow.State);
}

uint64_t WorkoutReminderAnnouncementFlow.on(input:)()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[6];
  _OWORD v28[3];

  v25 = type metadata accessor for WorkoutReminderAnnouncementFlow.State(0);
  v0 = MEMORY[0x24BDAC7A8](v25);
  v2 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v0);
  v4 = (_OWORD *)((char *)&v24 - v3);
  v5 = type metadata accessor for Parse();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Parse.DirectInvocation();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v24 - v14;
  Input.parse.getter();
  if ((*(unsigned int (**)(char *, uint64_t))(v6 + 88))(v8, v5) != *MEMORY[0x24BE98E88])
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return 0;
  }
  (*(void (**)(char *, uint64_t))(v6 + 96))(v8, v5);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
  v16 = Parse.DirectInvocation.identifier.getter();
  v18 = v17;
  if (one-time initialization token for identifier != -1)
    swift_once();
  if (v16 == static WorkoutReminderAnnouncementDirectInvocation.identifier && v18 == *(_QWORD *)algn_257943D58)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0)
    {
      (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
      return 0;
    }
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  specialized WorkoutReminderAnnouncementDirectInvocation.init(directInvocation:)((uint64_t)v13, v27);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v27, (uint64_t)v28, &demangling cache variable for type metadata for WorkoutReminderAnnouncementDirectInvocation?);
  if (!*(_QWORD *)&v28[0])
    return 0;
  v22 = v28[1];
  *v4 = v28[0];
  v4[1] = v22;
  v4[2] = v28[2];
  swift_storeEnumTagMultiPayload();
  outlined init with take of WorkoutReminderAnnouncementFlow.State((uint64_t)v4, (uint64_t)v2);
  v23 = v26 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_state;
  swift_beginAccess();
  outlined assign with take of WorkoutReminderAnnouncementFlow.State((uint64_t)v2, v23);
  swift_endAccess();
  return 1;
}

uint64_t WorkoutReminderAnnouncementFlow.execute(completion:)()
{
  type metadata accessor for WorkoutReminderAnnouncementFlow(0);
  lazy protocol witness table accessor for type WorkoutReminderAnnouncementFlow and conformance WorkoutReminderAnnouncementFlow(&lazy protocol witness table cache variable for type WorkoutReminderAnnouncementFlow and conformance WorkoutReminderAnnouncementFlow, type metadata accessor for WorkoutReminderAnnouncementFlow, (uint64_t)&protocol conformance descriptor for WorkoutReminderAnnouncementFlow);
  return Flow.deferToExecuteAsync(_:)();
}

uint64_t WorkoutReminderAnnouncementFlow.execute()(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[33] = a1;
  v2[34] = v1;
  v2[35] = *v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
  v2[36] = v3;
  v2[37] = *(_QWORD *)(v3 - 8);
  v2[38] = swift_task_alloc();
  type metadata accessor for CATOption();
  v2[39] = swift_task_alloc();
  v4 = type metadata accessor for Logger();
  v2[40] = v4;
  v2[41] = *(_QWORD *)(v4 - 8);
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  v2[44] = type metadata accessor for WorkoutReminderAnnouncementFlow.State(0);
  v2[45] = swift_task_alloc();
  return swift_task_switch();
}

{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 392) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t WorkoutReminderAnnouncementFlow.execute()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int EnumCaseMultiPayload;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  _QWORD *v10;
  __int128 *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
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
  uint64_t *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  NSObject *v59;
  NSObject *v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67[5];

  v1 = *(_QWORD *)(v0 + 360);
  v2 = *(_QWORD *)(v0 + 272) + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_state;
  swift_beginAccess();
  outlined init with copy of WorkoutReminderAnnouncementFlow.State(v2, v1);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v4 = *(_QWORD *)(v0 + 360);
      v6 = *(_QWORD *)(v0 + 296);
      v5 = *(_QWORD *)(v0 + 304);
      v7 = *(_QWORD *)(v0 + 288);
      v8 = (uint64_t *)(v4
                     + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (PromptResult<WorkoutReminderControlsDirectInvocation.Action>, to: WorkoutReminderAnnouncementDirectInvocation))
                              + 48));
      v9 = *v8;
      *(_QWORD *)(v0 + 368) = *v8;
      *(_QWORD *)(v0 + 376) = v8[2];
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v5, v4, v7);
      v64 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutReminderAnnouncementFlow.handleResponse(_:to:)
                                                     + async function pointer to specialized WorkoutReminderAnnouncementFlow.handleResponse(_:to:));
      v10 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 384) = v10;
      *v10 = v0;
      v10[1] = WorkoutReminderAnnouncementFlow.execute();
      return v64(*(_QWORD *)(v0 + 304), v9);
    }
    v26 = *(_QWORD *)(v0 + 344);
    v27 = *(_QWORD *)(v0 + 320);
    v28 = *(_QWORD *)(v0 + 328);
    v29 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v26, v29, v27);
    v30 = Logger.logObject.getter();
    v31 = static os_log_type_t.error.getter();
    v32 = os_log_type_enabled(v30, v31);
    v33 = *(_QWORD *)(v0 + 344);
    v34 = *(_QWORD *)(v0 + 320);
    v35 = *(_QWORD *)(v0 + 328);
    if (v32)
    {
      v66 = *(_QWORD *)(v0 + 328);
      v36 = swift_slowAlloc();
      v37 = swift_slowAlloc();
      v67[0] = v37;
      *(_DWORD *)v36 = 136315394;
      v38 = _typeName(_:qualified:)();
      *(_QWORD *)(v0 + 248) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v38, v39, v67);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 12) = 2080;
      v40 = _typeName(_:qualified:)();
      *(_QWORD *)(v0 + 256) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v40, v41, v67);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24A5E6000, v30, v31, "%s.execute() called before %s.on(input:) returned true", (uint8_t *)v36, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24BD15374](v37, -1, -1);
      MEMORY[0x24BD15374](v36, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v33, v34);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v33, v34);
    }
    static ExecuteResponse.complete()();
  }
  else
  {
    v12 = (__int128 *)(v0 + 16);
    v63 = v0 + 64;
    v13 = *(_OWORD **)(v0 + 360);
    v14 = *(_QWORD *)(v0 + 328);
    v15 = *(_QWORD *)(v0 + 336);
    v16 = *(_QWORD *)(v0 + 320);
    v18 = v13[1];
    v17 = v13[2];
    *(_OWORD *)(v0 + 16) = *v13;
    *(_OWORD *)(v0 + 32) = v18;
    *(_OWORD *)(v0 + 48) = v17;
    v19 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v15, v19, v16);
    v20 = *(void **)(v0 + 16);
    outlined init with take of BelowTargetZoneModel?(v0 + 24, v0 + 216, &demangling cache variable for type metadata for String?);
    v21 = v20;
    v65 = v0 + 216;
    outlined retain of String?(v0 + 216);
    v22 = Logger.logObject.getter();
    v23 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v62 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v24 = 138412290;
      *(_QWORD *)(v0 + 232) = v21;
      v25 = v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v62 = v21;

      outlined release of String?(v65);
      _os_log_impl(&dword_24A5E6000, v22, v23, "Making an annoucement for %@", v24, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x24BD15374](v62, -1, -1);
      MEMORY[0x24BD15374](v24, -1, -1);
    }
    else
    {

      outlined release of String?(v65);
      v22 = v21;
    }
    v43 = *(_QWORD *)(v0 + 328);
    v42 = *(_QWORD *)(v0 + 336);
    v44 = *(_QWORD *)(v0 + 320);
    v61 = *(_QWORD *)(v0 + 272);

    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v42, v44);
    v45 = type metadata accessor for WorkoutRemindersCATPatternsExecutor();
    v60 = v21;
    outlined retain of String?(v65);
    static CATOption.defaultMode.getter();
    v46 = CATWrapper.__allocating_init(options:globals:)();
    v47 = type metadata accessor for ResponseFactory();
    swift_allocObject();
    v48 = ResponseFactory.init()();
    v49 = MEMORY[0x24BE97F18];
    *(_QWORD *)(v0 + 128) = v47;
    *(_QWORD *)(v0 + 136) = v49;
    *(_QWORD *)(v0 + 104) = v48;
    *(_QWORD *)(v0 + 88) = v45;
    *(_QWORD *)(v0 + 96) = &protocol witness table for WorkoutRemindersCATPatternsExecutor;
    *(_QWORD *)(v0 + 64) = v46;
    type metadata accessor for WorkoutReminderPromptStrategy();
    v50 = swift_allocObject();
    v51 = __swift_mutable_project_boxed_opaque_existential_1(v63, v45);
    v52 = *(_QWORD *)(v45 - 8);
    v53 = (uint64_t *)swift_task_alloc();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v52 + 16))(v53, v51, v45);
    v54 = *v53;
    *(_QWORD *)(v50 + 88) = v45;
    *(_QWORD *)(v50 + 96) = &protocol witness table for WorkoutRemindersCATPatternsExecutor;
    *(_QWORD *)(v50 + 64) = v54;
    v55 = *(_OWORD *)(v0 + 48);
    v56 = *v12;
    *(_OWORD *)(v50 + 32) = *(_OWORD *)(v0 + 32);
    *(_OWORD *)(v50 + 48) = v55;
    *(_OWORD *)(v50 + 16) = v56;
    outlined init with take of VoiceFeedbackPatternResolving((__int128 *)(v0 + 104), v50 + 104);
    __swift_destroy_boxed_opaque_existential_1Tm(v63);
    swift_task_dealloc();
    static OutputPublisherFactory.makeOutputPublisherAsync()();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptForValueFlowAsync<WorkoutReminderControlsDirectInvocation.Action>);
    swift_allocObject();
    lazy protocol witness table accessor for type WorkoutReminderAnnouncementFlow and conformance WorkoutReminderAnnouncementFlow(&lazy protocol witness table cache variable for type WorkoutReminderPromptStrategy and conformance WorkoutReminderPromptStrategy, (uint64_t (*)(uint64_t))type metadata accessor for WorkoutReminderPromptStrategy, (uint64_t)&protocol conformance descriptor for WorkoutReminderPromptStrategy);
    *(_QWORD *)(v0 + 240) = PromptForValueFlowAsync.init<A>(strategy:outputPublisher:)();
    v57 = swift_allocObject();
    *(_QWORD *)(v57 + 16) = v61;
    v58 = *(_OWORD *)(v0 + 32);
    *(_OWORD *)(v57 + 24) = *v12;
    *(_OWORD *)(v57 + 40) = v58;
    *(_OWORD *)(v57 + 56) = *(_OWORD *)(v0 + 48);
    v59 = v60;
    outlined retain of String?(v65);
    lazy protocol witness table accessor for type PromptForValueFlowAsync<WorkoutReminderControlsDirectInvocation.Action> and conformance PromptForValueFlowAsync<A>(&lazy protocol witness table cache variable for type PromptForValueFlowAsync<WorkoutReminderControlsDirectInvocation.Action> and conformance PromptForValueFlowAsync<A>, &demangling cache variable for type metadata for PromptForValueFlowAsync<WorkoutReminderControlsDirectInvocation.Action>, MEMORY[0x24BE961F8]);
    swift_retain();
    static ExecuteResponse.replan<A>(next:childCompletion:)();

    outlined release of String?(v65);
    swift_release();
    swift_release();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 368);
  v3 = *(_QWORD *)(v0 + 296);
  v2 = *(_QWORD *)(v0 + 304);
  v4 = *(_QWORD *)(v0 + 288);
  if (*(_QWORD *)(v0 + 392))
  {
    static ExecuteResponse.complete(next:)();
    swift_release();
  }
  else
  {
    static ExecuteResponse.complete()();
  }

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #1 in WorkoutReminderAnnouncementFlow.execute()(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  _OWORD *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  id v17;
  _BYTE v20[16];

  v6 = type metadata accessor for WorkoutReminderAnnouncementFlow.State(0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  MEMORY[0x24BDAC7A8](v7);
  v11 = v20 - v10 + 16;
  v12 = v20
      + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (PromptResult<WorkoutReminderControlsDirectInvocation.Action>, to: WorkoutReminderAnnouncementDirectInvocation))
               + 48)
      + -8 * v10
      + 16;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, a1, v13);
  v14 = a3[1];
  *v12 = *a3;
  v12[1] = v14;
  v12[2] = a3[2];
  swift_storeEnumTagMultiPayload();
  outlined init with take of WorkoutReminderAnnouncementFlow.State((uint64_t)v11, (uint64_t)v9);
  v15 = a2 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_state;
  swift_beginAccess();
  v16 = *(void **)a3;
  outlined init with take of BelowTargetZoneModel?((uint64_t)a3 + 8, (uint64_t)v20, &demangling cache variable for type metadata for String?);
  v17 = v16;
  outlined retain of String?((uint64_t)v20);
  outlined assign with take of WorkoutReminderAnnouncementFlow.State((uint64_t)v9, v15);
  return swift_endAccess();
}

uint64_t closure #1 in WorkoutReminderAnnouncementFlow.handleResponseForRemoteControl(_:to:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<SABaseCommand, SubmitCommandError>);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v21 - v6;
  v8 = type metadata accessor for Logger();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  outlined init with copy of Result<SABaseCommand, SubmitCommandError>(a1, (uint64_t)v7);
  v13 = Logger.logObject.getter();
  v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v22 = v8;
    v17 = v16;
    v24 = v16;
    *(_DWORD *)v15 = 136315138;
    v21[1] = v15 + 4;
    outlined init with copy of Result<SABaseCommand, SubmitCommandError>((uint64_t)v7, (uint64_t)v5);
    v18 = String.init<A>(describing:)();
    v23 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, v19, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined destroy of Result<SABaseCommand, SubmitCommandError>((uint64_t)v7);
    _os_log_impl(&dword_24A5E6000, v13, v14, "Received response from sending startLocalRequest: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v17, -1, -1);
    MEMORY[0x24BD15374](v15, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v22);
  }
  else
  {
    outlined destroy of Result<SABaseCommand, SubmitCommandError>((uint64_t)v7);

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t WorkoutReminderAnnouncementFlow.findRemoteIfAvailable()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[7] = v0;
  v2 = type metadata accessor for DeviceIdiom();
  v1[8] = v2;
  v1[9] = *(_QWORD *)(v2 - 8);
  v1[10] = swift_task_alloc();
  return swift_task_switch();
}

{
  _QWORD *v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[9] + 104))(v0[10], *MEMORY[0x24BEA8990], v0[8]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[11] = v1;
  *v1 = v0;
  v1[1] = WorkoutReminderAnnouncementFlow.findRemoteIfAvailable();
  return findRemoteDevice(with:deviceResolutionService:)();
}

{
  uint64_t v0;
  _QWORD *v1;

  if (*(_QWORD *)(v0 + 96))
  {
    static AceService.currentAsync.getter();
    v1 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v1;
    *v1 = v0;
    v1[1] = WorkoutReminderAnnouncementFlow.findRemoteIfAvailable();
    return isRemoteDeviceReachable(remoteDevice:aceService:)();
  }
  else
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 96);
  if ((*(_BYTE *)(v0 + 112) & 1) == 0)
  {

    v1 = 0;
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void *))(v0 + 8))(v1);
}

uint64_t WorkoutReminderAnnouncementFlow.findRemoteIfAvailable()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  *(_QWORD *)(*(_QWORD *)v1 + 96) = a1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return swift_task_switch();
}

uint64_t WorkoutReminderAnnouncementFlow.findRemoteIfAvailable()(char a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)v1 + 16;
  *(_BYTE *)(*(_QWORD *)v1 + 112) = a1;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1Tm(v2);
  return swift_task_switch();
}

uint64_t WorkoutReminderAnnouncementFlow.deinit()
{
  uint64_t v0;

  outlined destroy of WorkoutReminderAnnouncementFlow.State(v0 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_state);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_flowConfig);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_deviceResolutionService);
  return v0;
}

uint64_t WorkoutReminderAnnouncementFlow.__deallocating_deinit()
{
  uint64_t v0;

  outlined destroy of WorkoutReminderAnnouncementFlow.State(v0 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_state);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_flowConfig);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_deviceResolutionService);
  return swift_deallocClassInstance();
}

uint64_t protocol witness for Flow.on(input:) in conformance WorkoutReminderAnnouncementFlow()
{
  return WorkoutReminderAnnouncementFlow.on(input:)() & 1;
}

uint64_t protocol witness for Flow.execute(completion:) in conformance WorkoutReminderAnnouncementFlow()
{
  type metadata accessor for WorkoutReminderAnnouncementFlow(0);
  return Flow.deferToExecuteAsync(_:)();
}

uint64_t protocol witness for Flow.execute() in conformance WorkoutReminderAnnouncementFlow(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = protocol witness for Flow.execute() in conformance VoiceFeedbackAnnouncementFlow;
  return WorkoutReminderAnnouncementFlow.execute()(a1);
}

uint64_t protocol witness for Flow.exitValue.getter in conformance WorkoutReminderAnnouncementFlow()
{
  type metadata accessor for WorkoutReminderAnnouncementFlow(0);
  return Flow<>.exitValue.getter();
}

uint64_t outlined init with take of WorkoutReminderAnnouncementFlow.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WorkoutReminderAnnouncementFlow.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined assign with take of WorkoutReminderAnnouncementFlow.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WorkoutReminderAnnouncementFlow.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for WorkoutReminderAnnouncementFlow(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutReminderAnnouncementFlow);
}

uint64_t type metadata accessor for WorkoutReminderAnnouncementFlow.State(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t outlined init with copy of WorkoutReminderAnnouncementFlow.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WorkoutReminderAnnouncementFlow.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:)(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v2 + 192) = a2;
  *(_BYTE *)(v2 + 376) = a1;
  type metadata accessor for DialogPhase();
  *(_QWORD *)(v2 + 200) = swift_task_alloc();
  v3 = type metadata accessor for OutputGenerationManifest();
  *(_QWORD *)(v2 + 208) = v3;
  *(_QWORD *)(v2 + 216) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 224) = swift_task_alloc();
  v4 = type metadata accessor for Logger();
  *(_QWORD *)(v2 + 232) = v4;
  *(_QWORD *)(v2 + 240) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 248) = swift_task_alloc();
  *(_QWORD *)(v2 + 256) = swift_task_alloc();
  *(_QWORD *)(v2 + 264) = swift_task_alloc();
  type metadata accessor for CATOption();
  *(_QWORD *)(v2 + 272) = swift_task_alloc();
  return swift_task_switch();
}

void specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:)()
{
  __asm { BR              X10 }
}

uint64_t sub_24A5F5B90()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  const char *v5;
  _QWORD *v7;
  _QWORD *v8;
  id v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(void);
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(unint64_t, unint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31[12];

  swift_bridgeObjectRelease();
  v1 = objc_msgSend(*(id *)(v0 + 192), sel_predictionType);
  if (v1 == (id)3)
  {
    type metadata accessor for WorkoutRemindersCATPatternsExecutor();
    static CATOption.defaultMode.getter();
    *(_QWORD *)(v0 + 344) = CATWrapper.__allocating_init(options:globals:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
    v2 = swift_allocObject();
    *(_QWORD *)(v2 + 32) = 0xD000000000000017;
    *(_QWORD *)(v2 + 40) = 0x800000024A61E2A0;
    *(_QWORD *)(v2 + 72) = MEMORY[0x24BEE1328];
    v29 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                              + MEMORY[0x24BE92868]);
    *(_QWORD *)(v0 + 352) = v2;
    *(_OWORD *)(v2 + 16) = xmmword_24A61B890;
    *(_BYTE *)(v2 + 48) = 0;
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 360) = v7;
    *v7 = v0;
    v7[1] = specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:);
    v4 = 0xD000000000000026;
    v5 = "workoutReminders#acceptedResumeWorkout";
    return v29(v4, (unint64_t)(v5 - 32) | 0x8000000000000000, v2);
  }
  if (v1 == (id)2)
  {
    type metadata accessor for WorkoutRemindersCATPatternsExecutor();
    static CATOption.defaultMode.getter();
    *(_QWORD *)(v0 + 312) = CATWrapper.__allocating_init(options:globals:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
    v2 = swift_allocObject();
    *(_QWORD *)(v2 + 32) = 0xD000000000000017;
    *(_QWORD *)(v2 + 40) = 0x800000024A61E2A0;
    *(_QWORD *)(v2 + 72) = MEMORY[0x24BEE1328];
    v29 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                              + MEMORY[0x24BE92868]);
    *(_QWORD *)(v0 + 320) = v2;
    *(_OWORD *)(v2 + 16) = xmmword_24A61B890;
    *(_BYTE *)(v2 + 48) = 0;
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 328) = v8;
    *v8 = v0;
    v8[1] = specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:);
    v4 = 0xD000000000000023;
    v5 = "workoutReminders#acceptedEndWorkout";
    return v29(v4, (unint64_t)(v5 - 32) | 0x8000000000000000, v2);
  }
  if (v1 == (id)1)
  {
    type metadata accessor for WorkoutRemindersCATPatternsExecutor();
    static CATOption.defaultMode.getter();
    *(_QWORD *)(v0 + 280) = CATWrapper.__allocating_init(options:globals:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
    v2 = swift_allocObject();
    *(_QWORD *)(v2 + 32) = 0xD000000000000017;
    *(_QWORD *)(v2 + 40) = 0x800000024A61E2A0;
    *(_QWORD *)(v2 + 72) = MEMORY[0x24BEE1328];
    v29 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                              + MEMORY[0x24BE92868]);
    *(_QWORD *)(v0 + 288) = v2;
    *(_OWORD *)(v2 + 16) = xmmword_24A61B890;
    *(_BYTE *)(v2 + 48) = 0;
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 296) = v3;
    *v3 = v0;
    v3[1] = specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:);
    v4 = 0xD000000000000025;
    v5 = "workoutReminders#acceptedStartWorkout";
    return v29(v4, (unint64_t)(v5 - 32) | 0x8000000000000000, v2);
  }
  objc_msgSend(*(id *)(v0 + 192), sel_predictionType);
  v9 = (id)AFWorkoutPredictionTypeGetName();
  if (v9)
  {
    v10 = v9;
    v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v12 = v11;

  }
  else
  {
    v12 = 0xE90000000000003ELL;
    v30 = 0x4E574F4E4B4E553CLL;
  }
  v13 = *(_QWORD *)(v0 + 264);
  v14 = *(_QWORD *)(v0 + 232);
  v15 = *(_QWORD *)(v0 + 240);
  v16 = objc_msgSend(*(id *)(v0 + 192), sel_predictionIdentifier);
  v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v18 = v17;

  v19 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v13, v19, v14);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20 = Logger.logObject.getter();
  v21 = static os_log_type_t.error.getter();
  v22 = os_log_type_enabled(v20, v21);
  v23 = *(_QWORD *)(v0 + 240);
  if (v22)
  {
    v27 = *(_QWORD *)(v0 + 240);
    v24 = swift_slowAlloc();
    v25 = swift_slowAlloc();
    v31[0] = v25;
    *(_DWORD *)v24 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 168) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v12, v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v24 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 160) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v28, v18, v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24A5E6000, v20, v21, "Unknown workout reminder prediction type %s for prediction id %s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v25, -1, -1);
    MEMORY[0x24BD15374](v24, -1, -1);

    v26 = *(void (**)(void))(v27 + 8);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    v26 = *(void (**)(void))(v23 + 8);
  }
  v26();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[11] = v2;
  v3[12] = a1;
  v3[13] = v1;
  v3[38] = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[14] = v2;
  v3[15] = a1;
  v3[16] = v1;
  v3[42] = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[17] = v2;
  v3[18] = a1;
  v3[19] = v1;
  v3[46] = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

uint64_t specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:)()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void **)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 224);
  v4 = *(_QWORD *)(v0 + 208);
  static DialogPhase.completion.getter();
  OutputGenerationManifest.init(dialogPhase:_:)();
  OutputGenerationManifest.canUseServerTTS.setter();
  static OutputPublisherFactory.makeOutputPublisherAsync()();
  type metadata accessor for ResponseFactory();
  swift_allocObject();
  ResponseFactory.init()();
  type metadata accessor for PatternFlowProvider();
  swift_allocObject();
  *(_QWORD *)(v0 + 184) = PatternFlowProvider.init(outputPublisher:responseGenerator:)();
  v5 = PatternFlowProviding.makeResponseFlow(patternExecutionResult:outputGenerationManifest:)();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v5);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;

  v1 = *(void **)(v0 + 304);
  v3 = *(_QWORD *)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 248);
  v4 = *(_QWORD *)(v0 + 232);
  swift_bridgeObjectRelease();
  swift_release();
  v5 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = Logger.logObject.getter();
  v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    v12 = v1;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 176) = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v11 = v13;
    MEMORY[0x24BD15248](v1);
    MEMORY[0x24BD15248](v1);
    _os_log_impl(&dword_24A5E6000, v8, v9, "Failed to create accept start/end workout pattern: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v11, -1, -1);
    MEMORY[0x24BD15374](v10, -1, -1);

    MEMORY[0x24BD15248](v1);
  }
  else
  {
    MEMORY[0x24BD15248](v1);
    MEMORY[0x24BD15248](v1);
    MEMORY[0x24BD15248](v1);

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 240) + 8))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 232));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void **)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 224);
  v4 = *(_QWORD *)(v0 + 208);
  static DialogPhase.completion.getter();
  OutputGenerationManifest.init(dialogPhase:_:)();
  OutputGenerationManifest.canUseServerTTS.setter();
  static OutputPublisherFactory.makeOutputPublisherAsync()();
  type metadata accessor for ResponseFactory();
  swift_allocObject();
  ResponseFactory.init()();
  type metadata accessor for PatternFlowProvider();
  swift_allocObject();
  *(_QWORD *)(v0 + 184) = PatternFlowProvider.init(outputPublisher:responseGenerator:)();
  v5 = PatternFlowProviding.makeResponseFlow(patternExecutionResult:outputGenerationManifest:)();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v5);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;

  v1 = *(void **)(v0 + 336);
  v3 = *(_QWORD *)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 248);
  v4 = *(_QWORD *)(v0 + 232);
  swift_bridgeObjectRelease();
  swift_release();
  v5 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = Logger.logObject.getter();
  v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    v12 = v1;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 176) = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v11 = v13;
    MEMORY[0x24BD15248](v1);
    MEMORY[0x24BD15248](v1);
    _os_log_impl(&dword_24A5E6000, v8, v9, "Failed to create accept start/end workout pattern: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v11, -1, -1);
    MEMORY[0x24BD15374](v10, -1, -1);

    MEMORY[0x24BD15248](v1);
  }
  else
  {
    MEMORY[0x24BD15248](v1);
    MEMORY[0x24BD15248](v1);
    MEMORY[0x24BD15248](v1);

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 240) + 8))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 232));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void **)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 224);
  v4 = *(_QWORD *)(v0 + 208);
  static DialogPhase.completion.getter();
  OutputGenerationManifest.init(dialogPhase:_:)();
  OutputGenerationManifest.canUseServerTTS.setter();
  static OutputPublisherFactory.makeOutputPublisherAsync()();
  type metadata accessor for ResponseFactory();
  swift_allocObject();
  ResponseFactory.init()();
  type metadata accessor for PatternFlowProvider();
  swift_allocObject();
  *(_QWORD *)(v0 + 184) = PatternFlowProvider.init(outputPublisher:responseGenerator:)();
  v5 = PatternFlowProviding.makeResponseFlow(patternExecutionResult:outputGenerationManifest:)();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v5);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;

  v1 = *(void **)(v0 + 368);
  v3 = *(_QWORD *)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 248);
  v4 = *(_QWORD *)(v0 + 232);
  swift_bridgeObjectRelease();
  swift_release();
  v5 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = Logger.logObject.getter();
  v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    v12 = v1;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 176) = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v11 = v13;
    MEMORY[0x24BD15248](v1);
    MEMORY[0x24BD15248](v1);
    _os_log_impl(&dword_24A5E6000, v8, v9, "Failed to create accept start/end workout pattern: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v11, -1, -1);
    MEMORY[0x24BD15374](v10, -1, -1);

    MEMORY[0x24BD15248](v1);
  }
  else
  {
    MEMORY[0x24BD15248](v1);
    MEMORY[0x24BD15248](v1);
    MEMORY[0x24BD15248](v1);

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 240) + 8))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 232));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t specialized WorkoutReminderAnnouncementFlow.handleResponseForLocalControl(_:to:)(char a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v3 + 120) = a2;
  *(_QWORD *)(v3 + 128) = v2;
  *(_BYTE *)(v3 + 184) = a1;
  *(_QWORD *)(v3 + 136) = *v2;
  v4 = type metadata accessor for Logger();
  *(_QWORD *)(v3 + 144) = v4;
  *(_QWORD *)(v3 + 152) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 160) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t specialized WorkoutReminderAnnouncementFlow.handleResponseForLocalControl(_:to:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t (*v21)(char, uint64_t);
  uint64_t v22;
  uint64_t v23;

  v1 = (_QWORD *)(*(_QWORD *)(v0 + 128)
                + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_flowConfig);
  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  v4 = dispatch thunk of DeviceState.isWatch.getter();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if ((v4 & 1) != 0)
  {
    v21 = (uint64_t (*)(char, uint64_t))((char *)&async function pointer to specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:)
                                                + async function pointer to specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:));
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 168) = v5;
    *v5 = v0;
    v5[1] = specialized WorkoutReminderAnnouncementFlow.handleResponseForLocalControl(_:to:);
    return v21(*(_BYTE *)(v0 + 184), *(_QWORD *)(v0 + 120));
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 152);
    v7 = *(_QWORD *)(v0 + 160);
    v9 = *(_QWORD *)(v0 + 144);
    v10 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v10, v9);
    v11 = Logger.logObject.getter();
    v12 = static os_log_type_t.error.getter();
    v13 = os_log_type_enabled(v11, v12);
    v14 = *(_QWORD *)(v0 + 152);
    v15 = *(_QWORD *)(v0 + 160);
    v16 = *(_QWORD *)(v0 + 144);
    if (v13)
    {
      v22 = *(_QWORD *)(v0 + 160);
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v23 = v18;
      *(_DWORD *)v17 = 136315138;
      v19 = _typeName(_:qualified:)();
      *(_QWORD *)(v0 + 104) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24A5E6000, v11, v12, "%s.handleResponseForLocalControl should only be called from a watch", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD15374](v18, -1, -1);
      MEMORY[0x24BD15374](v17, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v22, v16);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v16);
    }
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  char v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 176);
  v2 = *(_BYTE *)(v0 + 184);
  v3 = objc_msgSend(*(id *)(v0 + 120), sel_predictionIdentifier);
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;

  *(_BYTE *)(v0 + 80) = v2;
  *(_QWORD *)(v0 + 88) = v4;
  *(_QWORD *)(v0 + 96) = v6;
  lazy protocol witness table accessor for type WorkoutReminderControlsFlow and conformance WorkoutReminderControlsFlow();
  v7 = Flow.eraseToAnyFlow()();
  swift_bridgeObjectRelease();
  if (v1)
  {
    v8 = *(_QWORD *)(v0 + 176);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_24A61B8A0;
    *(_QWORD *)(v9 + 32) = v8;
    *(_QWORD *)(v9 + 40) = v7;
    specialized Array._endMutation()();
    type metadata accessor for SequenceFlow();
    v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BE40E90];
    swift_allocObject();
    swift_retain();
    swift_retain();
    *(_QWORD *)(v0 + 112) = SequenceFlow.init(with:)();
    lazy protocol witness table accessor for type WorkoutReminderAnnouncementFlow and conformance WorkoutReminderAnnouncementFlow(&lazy protocol witness table cache variable for type SequenceFlow and conformance SequenceFlow, v10, MEMORY[0x24BE40E80]);
    v11 = Flow.eraseToAnyFlow()();
    swift_release();
    swift_release();
    swift_release();
    v7 = v11;
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
}

uint64_t specialized WorkoutReminderAnnouncementFlow.handleResponseForLocalControl(_:to:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 176) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t specialized WorkoutReminderAnnouncementFlow.handleResponseForRemoteControl(_:to:)(char a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v3 + 232) = a2;
  *(_QWORD *)(v3 + 240) = v2;
  *(_BYTE *)(v3 + 344) = a1;
  *(_QWORD *)(v3 + 248) = *v2;
  v4 = type metadata accessor for Logger();
  *(_QWORD *)(v3 + 256) = v4;
  *(_QWORD *)(v3 + 264) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 272) = swift_task_alloc();
  *(_QWORD *)(v3 + 280) = swift_task_alloc();
  *(_QWORD *)(v3 + 288) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t specialized WorkoutReminderAnnouncementFlow.handleResponseForRemoteControl(_:to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;
  uint64_t v31;

  v1 = *(_QWORD *)(v0 + 240);
  v2 = OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_flowConfig;
  *(_QWORD *)(v0 + 296) = OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_flowConfig;
  v3 = (_QWORD *)(v1 + v2);
  v4 = *(_QWORD *)(v1 + v2 + 24);
  v5 = *(_QWORD *)(v1 + v2 + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + v2), v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  v6 = dispatch thunk of DeviceState.isWatch.getter();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if ((v6 & 1) != 0)
  {
    v7 = *(_QWORD *)(v0 + 288);
    v8 = *(_QWORD *)(v0 + 256);
    v9 = *(_QWORD *)(v0 + 264);
    v10 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v10, v8);
    v11 = Logger.logObject.getter();
    v12 = static os_log_type_t.error.getter();
    v13 = os_log_type_enabled(v11, v12);
    v14 = *(_QWORD *)(v0 + 288);
    v16 = *(_QWORD *)(v0 + 256);
    v15 = *(_QWORD *)(v0 + 264);
    if (v13)
    {
      v30 = *(_QWORD *)(v0 + 288);
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v31 = v18;
      *(_DWORD *)v17 = 136315138;
      v19 = _typeName(_:qualified:)();
      *(_QWORD *)(v0 + 224) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24A5E6000, v11, v12, "%s.handleResponseForRemoteControl should not be called from a watch", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD15374](v18, -1, -1);
      MEMORY[0x24BD15374](v17, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v30, v16);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
  else
  {
    v21 = *(_BYTE *)(v0 + 344);
    v22 = objc_msgSend(*(id *)(v0 + 232), sel_predictionIdentifier);
    v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v25 = v24;

    v26 = v3[3];
    v27 = v3[4];
    __swift_project_boxed_opaque_existential_1(v3, v26);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v27);
    *(_QWORD *)(v0 + 304) = WorkoutReminderControlsDirectInvocation.asStartLocalRequest(device:)((_QWORD *)(v0 + 56), v21, v23, v25);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
    v28 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 312) = v28;
    *v28 = v0;
    v28[1] = specialized WorkoutReminderAnnouncementFlow.handleResponseForRemoteControl(_:to:);
    return WorkoutReminderAnnouncementFlow.findRemoteIfAvailable()();
  }
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t (*v32)(char, uint64_t);
  uint64_t v33;

  v1 = *(void **)(v0 + 320);
  v2 = *(_QWORD *)(v0 + 256);
  v3 = *(_QWORD *)(v0 + 264);
  if (v1)
  {
    v4 = *(_QWORD *)(v0 + 280);
    v5 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v5, v2);
    v6 = v1;
    v7 = Logger.logObject.getter();
    v8 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v31 = *(_QWORD *)(v0 + 320);
      v9 = (uint8_t *)swift_slowAlloc();
      v30 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v9 = 138412290;
      *(_QWORD *)(v0 + 216) = v6;
      v10 = v6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v30 = v31;

      _os_log_impl(&dword_24A5E6000, v7, v8, "Submitting startLocalRequest to remote device: %@", v9, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x24BD15374](v30, -1, -1);
      MEMORY[0x24BD15374](v9, -1, -1);
    }
    else
    {

    }
    v24 = (_QWORD *)(*(_QWORD *)(v0 + 240) + *(_QWORD *)(v0 + 296));
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 264) + 8))(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 256));
    v25 = v24[3];
    v26 = v24[4];
    __swift_project_boxed_opaque_existential_1(v24, v25);
    (*(void (**)(uint64_t, uint64_t))(v26 + 16))(v25, v26);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 120));
    DeviceUnit.assistantId.getter();
    type metadata accessor for SABaseCommand();
    dispatch thunk of AceServiceInvoker.submitToRemote<A>(_:_:completion:)();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
    v32 = (uint64_t (*)(char, uint64_t))((char *)&async function pointer to specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:)
                                                + async function pointer to specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:));
    v27 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 328) = v27;
    *v27 = v0;
    v27[1] = specialized WorkoutReminderAnnouncementFlow.handleResponseForRemoteControl(_:to:);
    return v32(*(_BYTE *)(v0 + 344), *(_QWORD *)(v0 + 232));
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 272);
    v12 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v11, v12, v2);
    v13 = Logger.logObject.getter();
    v14 = static os_log_type_t.error.getter();
    v15 = os_log_type_enabled(v13, v14);
    v16 = *(void **)(v0 + 304);
    v18 = *(_QWORD *)(v0 + 264);
    v17 = *(_QWORD *)(v0 + 272);
    v19 = *(_QWORD *)(v0 + 256);
    if (v15)
    {
      v29 = *(_QWORD *)(v0 + 264);
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v33 = v21;
      *(_DWORD *)v20 = 136315138;
      v22 = _typeName(_:qualified:)();
      *(_QWORD *)(v0 + 208) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v23, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24A5E6000, v13, v14, "%s cannot find remote Watch", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD15374](v21, -1, -1);
      MEMORY[0x24BD15374](v20, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v17, v19);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 320);

  v2 = *(_QWORD *)(v0 + 336);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t specialized WorkoutReminderAnnouncementFlow.handleResponseForRemoteControl(_:to:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 320) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 336) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t specialized WorkoutReminderAnnouncementFlow.handleResponse(_:to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[15] = a2;
  v3[16] = v2;
  v3[14] = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
  v3[17] = v4;
  v3[18] = *(_QWORD *)(v4 - 8);
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  v5 = type metadata accessor for Logger();
  v3[21] = v5;
  v3[22] = *(_QWORD *)(v5 - 8);
  v3[23] = swift_task_alloc();
  v3[24] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t specialized WorkoutReminderAnnouncementFlow.handleResponse(_:to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint8_t *v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t, uint64_t);
  uint64_t (*v50)(char, uint64_t);
  uint64_t v51;

  v48 = *(_QWORD *)(v0 + 112);
  v1 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 168);
  v2 = *(_QWORD *)(v0 + 176);
  v4 = *(_QWORD *)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 136);
  v6 = *(_QWORD *)(v0 + 144);
  v7 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v47 = v7;
  v46(v1, v7, v3);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v8(v4, v48, v5);
  v9 = Logger.logObject.getter();
  v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = *(_QWORD *)(v0 + 160);
    v44 = *(_QWORD *)(v0 + 168);
    v45 = *(_QWORD *)(v0 + 192);
    v12 = *(_QWORD *)(v0 + 136);
    v42 = *(_QWORD *)(v0 + 144);
    v43 = *(_QWORD *)(v0 + 176);
    v49 = v8;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v51 = v14;
    *(_DWORD *)v13 = 136315138;
    lazy protocol witness table accessor for type PromptForValueFlowAsync<WorkoutReminderControlsDirectInvocation.Action> and conformance PromptForValueFlowAsync<A>(&lazy protocol witness table cache variable for type PromptResult<WorkoutReminderControlsDirectInvocation.Action> and conformance PromptResult<A>, &demangling cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>, MEMORY[0x24BE97958]);
    v15 = dispatch thunk of CustomStringConvertible.description.getter();
    *(_QWORD *)(v0 + 104) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v17 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
    v17(v11, v12);
    _os_log_impl(&dword_24A5E6000, v9, v10, "ExitValue from Workout Reminder prompt: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v14, -1, -1);
    v18 = v13;
    v8 = v49;
    MEMORY[0x24BD15374](v18, -1, -1);

    v19 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
    v19(v45, v44);
  }
  else
  {
    v20 = *(_QWORD *)(v0 + 192);
    v21 = *(_QWORD *)(v0 + 168);
    v22 = *(_QWORD *)(v0 + 176);
    v17 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 144) + 8);
    v17(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 136));

    v19 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
    v19(v20, v21);
  }
  v24 = *(_QWORD *)(v0 + 144);
  v23 = *(_QWORD *)(v0 + 152);
  v25 = *(_QWORD *)(v0 + 136);
  v8(v23, *(_QWORD *)(v0 + 112), v25);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v24 + 88))(v23, v25) == *MEMORY[0x24BE97938])
  {
    v26 = *(char **)(v0 + 152);
    v27 = *(_QWORD *)(v0 + 128);
    (*(void (**)(char *, _QWORD))(*(_QWORD *)(v0 + 144) + 96))(v26, *(_QWORD *)(v0 + 136));
    v28 = *v26;
    v29 = (_QWORD *)(v27 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_flowConfig);
    v30 = *(_QWORD *)(v27 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_flowConfig + 24);
    v31 = v29[4];
    __swift_project_boxed_opaque_existential_1(v29, v30);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v31);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    LOBYTE(v26) = dispatch thunk of DeviceState.isWatch.getter();
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
    if ((v26 & 1) != 0)
    {
      v50 = (uint64_t (*)(char, uint64_t))((char *)&async function pointer to specialized WorkoutReminderAnnouncementFlow.handleResponseForLocalControl(_:to:)
                                                  + async function pointer to specialized WorkoutReminderAnnouncementFlow.handleResponseForLocalControl(_:to:));
      v32 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 200) = v32;
      v33 = specialized WorkoutReminderAnnouncementFlow.handleResponse(_:to:);
    }
    else
    {
      v50 = (uint64_t (*)(char, uint64_t))((char *)&async function pointer to specialized WorkoutReminderAnnouncementFlow.handleResponseForRemoteControl(_:to:)
                                                  + async function pointer to specialized WorkoutReminderAnnouncementFlow.handleResponseForRemoteControl(_:to:));
      v32 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 208) = v32;
      v33 = specialized WorkoutReminderAnnouncementFlow.handleResponse(_:to:);
    }
    *v32 = v0;
    v32[1] = v33;
    return v50(v28, *(_QWORD *)(v0 + 120));
  }
  else
  {
    v34 = *(_QWORD *)(v0 + 184);
    v35 = *(_QWORD *)(v0 + 168);
    v17(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 136));
    swift_beginAccess();
    v46(v34, v47, v35);
    v36 = Logger.logObject.getter();
    v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_24A5E6000, v36, v37, "Did not receive a response from the strategy, treating as an ignore", v38, 2u);
      MEMORY[0x24BD15374](v38, -1, -1);
    }
    v39 = *(_QWORD *)(v0 + 184);
    v40 = *(_QWORD *)(v0 + 168);

    v19(v39, v40);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t specialized WorkoutReminderAnnouncementFlow.handleResponse(_:to:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t outlined retain of String?(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t outlined release of String?(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
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

uint64_t lazy protocol witness table accessor for type WorkoutReminderAnnouncementFlow and conformance WorkoutReminderAnnouncementFlow(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24BD152CC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24A5F8268()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in WorkoutReminderAnnouncementFlow.execute()(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in WorkoutReminderAnnouncementFlow.execute()(a1, *(_QWORD *)(v1 + 16), (_OWORD *)(v1 + 24));
}

uint64_t outlined destroy of WorkoutReminderAnnouncementFlow.State(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for WorkoutReminderAnnouncementFlow.State(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ObjC metadata update function for WorkoutReminderAnnouncementFlow()
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow(0);
}

uint64_t type metadata completion function for WorkoutReminderAnnouncementFlow()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for WorkoutReminderAnnouncementFlow.State(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for WorkoutReminderAnnouncementFlow.State(char *a1, char **a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v11 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v11[(v6 + 16) & ~(unint64_t)v6];
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
      (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(a1, a2, v12);
      v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (PromptResult<WorkoutReminderControlsDirectInvocation.Action>, to: WorkoutReminderAnnouncementDirectInvocation))
                   + 48);
      v14 = &a1[v13];
      v15 = (char *)a2 + v13;
      v16 = *(void **)v15;
      v17 = *((_QWORD *)v15 + 1);
      *(_QWORD *)v14 = *(_QWORD *)v15;
      *((_QWORD *)v14 + 1) = v17;
      *((_QWORD *)v14 + 2) = *((_QWORD *)v15 + 2);
      v14[24] = v15[24];
      *((_OWORD *)v14 + 2) = *((_OWORD *)v15 + 2);
      v18 = v16;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v8 = *a2;
      v9 = a2[1];
      *(_QWORD *)a1 = *a2;
      *((_QWORD *)a1 + 1) = v9;
      *((_QWORD *)a1 + 2) = a2[2];
      a1[24] = *((_BYTE *)a2 + 24);
      *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
      v10 = v8;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destroy for WorkoutReminderAnnouncementFlow.State(id *a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result)
  {
    if ((_DWORD)result != 1)
      return result;
    v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
    (*(void (**)(id *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
    a1 = (id *)((char *)a1
              + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (PromptResult<WorkoutReminderControlsDirectInvocation.Action>, to: WorkoutReminderAnnouncementDirectInvocation))
                       + 48));
  }

  return swift_bridgeObjectRelease();
}

void **initializeWithCopy for WorkoutReminderAnnouncementFlow.State(void **a1, void **a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  void *v14;
  uint64_t v15;
  id v16;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
    (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
    v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (PromptResult<WorkoutReminderControlsDirectInvocation.Action>, to: WorkoutReminderAnnouncementDirectInvocation))
                 + 48);
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = *(void **)v13;
    v15 = *((_QWORD *)v13 + 1);
    *(_QWORD *)v12 = *(_QWORD *)v13;
    *((_QWORD *)v12 + 1) = v15;
    *((_QWORD *)v12 + 2) = *((_QWORD *)v13 + 2);
    v12[24] = v13[24];
    *((_OWORD *)v12 + 2) = *((_OWORD *)v13 + 2);
    v16 = v14;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    a1[2] = a2[2];
    *((_BYTE *)a1 + 24) = *((_BYTE *)a2 + 24);
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
    v9 = v7;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void **assignWithCopy for WorkoutReminderAnnouncementFlow.State(void **a1, void **a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  void *v13;
  id v14;

  if (a1 != a2)
  {
    outlined destroy of WorkoutReminderAnnouncementFlow.State((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
      (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
      v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (PromptResult<WorkoutReminderControlsDirectInvocation.Action>, to: WorkoutReminderAnnouncementDirectInvocation))
                   + 48);
      v11 = (char *)a1 + v10;
      v12 = (char *)a2 + v10;
      v13 = *(void **)v12;
      *(_QWORD *)v11 = *(_QWORD *)v12;
      *((_QWORD *)v11 + 1) = *((_QWORD *)v12 + 1);
      *((_QWORD *)v11 + 2) = *((_QWORD *)v12 + 2);
      v11[24] = v12[24];
      *((_QWORD *)v11 + 4) = *((_QWORD *)v12 + 4);
      *((_QWORD *)v11 + 5) = *((_QWORD *)v12 + 5);
      v14 = v13;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = *a2;
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      *((_BYTE *)a1 + 24) = *((_BYTE *)a2 + 24);
      a1[4] = a2[4];
      a1[5] = a2[5];
      v8 = v7;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

char *initializeWithTake for WorkoutReminderAnnouncementFlow.State(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  __int128 v10;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (PromptResult<WorkoutReminderControlsDirectInvocation.Action>, to: WorkoutReminderAnnouncementDirectInvocation))
                + 48);
    v8 = &a1[v7];
    v9 = &a2[v7];
    v10 = *((_OWORD *)v9 + 1);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *((_OWORD *)v8 + 1) = v10;
    *((_OWORD *)v8 + 2) = *((_OWORD *)v9 + 2);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

char *assignWithTake for WorkoutReminderAnnouncementFlow.State(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  __int128 v10;

  if (a1 != a2)
  {
    outlined destroy of WorkoutReminderAnnouncementFlow.State((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (PromptResult<WorkoutReminderControlsDirectInvocation.Action>, to: WorkoutReminderAnnouncementDirectInvocation))
                  + 48);
      v8 = &a1[v7];
      v9 = &a2[v7];
      v10 = *((_OWORD *)v9 + 1);
      *(_OWORD *)v8 = *(_OWORD *)v9;
      *((_OWORD *)v8 + 1) = v10;
      *((_OWORD *)v8 + 2) = *((_OWORD *)v9 + 2);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutReminderAnnouncementFlow.State(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for WorkoutReminderAnnouncementFlow.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t destructiveInjectEnumTag for WorkoutReminderAnnouncementFlow.State()
{
  return swift_storeEnumTagMultiPayload();
}

void type metadata completion function for WorkoutReminderAnnouncementFlow.State()
{
  unint64_t v0;
  _QWORD v1[6];

  v1[4] = "0";
  type metadata accessor for PromptResult<WorkoutReminderControlsDirectInvocation.Action>();
  if (v0 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v1[5] = v1;
    swift_initEnumMetadataMultiPayload();
  }
}

void type metadata accessor for PromptResult<WorkoutReminderControlsDirectInvocation.Action>()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>)
  {
    v0 = type metadata accessor for PromptResult();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
  }
}

uint64_t lazy protocol witness table accessor for type PromptForValueFlowAsync<WorkoutReminderControlsDirectInvocation.Action> and conformance PromptForValueFlowAsync<A>(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24BD152CC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t type metadata accessor for SABaseCommand()
{
  unint64_t result;

  result = lazy cache variable for type metadata for SABaseCommand;
  if (!lazy cache variable for type metadata for SABaseCommand)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for SABaseCommand);
  }
  return result;
}

uint64_t outlined init with copy of Result<SABaseCommand, SubmitCommandError>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<SABaseCommand, SubmitCommandError>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Result<SABaseCommand, SubmitCommandError>(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<SABaseCommand, SubmitCommandError>);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t Encodable.asDictionary()()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _BYTE *v3;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  Class isa;
  id v9;
  id v10;
  id v11;
  _BYTE *v12;
  uint64_t v13;
  id v14[5];

  v14[4] = *(id *)MEMORY[0x24BDAC8D0];
  type metadata accessor for PropertyListEncoder();
  swift_allocObject();
  PropertyListEncoder.init()();
  v1 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
  if (v0)
  {
    MEMORY[0x24BD15248](v0);
    swift_release();
    lazy protocol witness table accessor for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors();
    swift_allocError();
    *v3 = 2;
    return swift_willThrow();
  }
  v5 = v1;
  v6 = v2;
  swift_release();
  v7 = (void *)objc_opt_self();
  isa = Data._bridgeToObjectiveC()().super.isa;
  v14[0] = 0;
  v9 = objc_msgSend(v7, sel_propertyListWithData_options_format_error_, isa, 0, 0, v14);

  if (v9)
  {
    v10 = v14[0];
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
    if ((swift_dynamicCast() & 1) != 0)
    {
      outlined consume of Data._Representation(v5, v6);
      return v13;
    }
    lazy protocol witness table accessor for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors();
    swift_allocError();
    *v12 = 3;
  }
  else
  {
    v11 = v14[0];
    _convertNSErrorToError(_:)();

  }
  swift_willThrow();
  return outlined consume of Data._Representation(v5, v6);
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

uint64_t VoiceFeedbackKeys.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24A5F8D9C + 4 * byte_24A61B990[a1]))(0xD000000000000014, 0x800000024A61DDA0);
}

uint64_t sub_24A5F8D9C()
{
  return 0x7079547472656C61;
}

uint64_t sub_24A5F8E28()
{
  return 0x795463697274656DLL;
}

uint64_t sub_24A5F8E44()
{
  return 0x706574537478656ELL;
}

uint64_t sub_24A5F8E68()
{
  uint64_t v0;

  return v0 + 1;
}

uint64_t sub_24A5F8E98()
{
  return 0x6D726F4665636170;
}

uint64_t sub_24A5F8EB8()
{
  return 0x746E656D676573;
}

uint64_t sub_24A5F8ED0()
{
  uint64_t v0;

  return v0 + 1;
}

uint64_t sub_24A5F8EE0()
{
  return 1953066613;
}

void sub_24A5F8EF0()
{
  JUMPOUT(0x24A5F8EFCLL);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance VoiceFeedbackKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = VoiceFeedbackKeys.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == VoiceFeedbackKeys.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance VoiceFeedbackKeys()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  VoiceFeedbackKeys.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance VoiceFeedbackKeys()
{
  unsigned __int8 *v0;

  VoiceFeedbackKeys.rawValue.getter(*v0);
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance VoiceFeedbackKeys()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  VoiceFeedbackKeys.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance VoiceFeedbackKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = specialized VoiceFeedbackKeys.init(rawValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance VoiceFeedbackKeys@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = VoiceFeedbackKeys.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance VoiceFeedbackKeys()
{
  lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance VoiceFeedbackKeys()
{
  lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
  return RawRepresentable<>.encode(to:)();
}

uint64_t specialized VoiceFeedbackKeys.init(rawValue:)()
{
  unint64_t v0;

  v0 = _findStringSwitchCaseWithCache(cases:string:cache:)();
  swift_bridgeObjectRelease();
  if (v0 >= 0x11)
    return 17;
  else
    return v0;
}

uint64_t getEnumTagSinglePayload for VoiceFeedbackKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF0)
    goto LABEL_17;
  if (a2 + 16 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 16) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 16;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 16;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 16;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x11;
  v8 = v6 - 17;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for VoiceFeedbackKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 16 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 16) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF0)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEF)
    return ((uint64_t (*)(void))((char *)&loc_24A5F9300 + 4 * byte_24A61B9A6[v4]))();
  *a1 = a2 + 16;
  return ((uint64_t (*)(void))((char *)sub_24A5F9334 + 4 * byte_24A61B9A1[v4]))();
}

uint64_t sub_24A5F9334(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5F933C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A5F9344);
  return result;
}

uint64_t sub_24A5F9350(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A5F9358);
  *(_BYTE *)result = a2 + 16;
  return result;
}

uint64_t sub_24A5F935C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5F9364(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for VoiceFeedbackKeys()
{
  return &type metadata for VoiceFeedbackKeys;
}

uint64_t AboveTargetZoneModel.alertType.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t AboveTargetZoneModel.alertType.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*AboveTargetZoneModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

void __swiftcall AboveTargetZoneModel.init(magnitude:unit:targetZone:)(WorkoutAnnouncements::AboveTargetZoneModel *__return_ptr retstr, Swift::Double magnitude, Swift::String unit, WorkoutAnnouncements::VoiceFeedbackTargetZone *targetZone)
{
  void *object;
  uint64_t countAndFlagsBits;
  Swift::Bool isSingleThreshold;
  WorkoutAnnouncements::VoiceFeedbackPaceFormat value;
  WorkoutAnnouncements::VoiceFeedbackMetricType metricType;

  object = unit._object;
  countAndFlagsBits = unit._countAndFlagsBits;
  outlined release of AboveTargetZoneModel((uint64_t)targetZone);
  isSingleThreshold = targetZone->isSingleThreshold;
  value = targetZone->paceFormat.value;
  metricType = targetZone->metricType;
  retstr->alertType = WorkoutAnnouncements_VoiceFeedbackAlertType_zoneExitedAbove;
  retstr->magnitude = magnitude;
  retstr->unit._countAndFlagsBits = countAndFlagsBits;
  retstr->unit._object = object;
  retstr->isSingleThreshold = isSingleThreshold;
  retstr->paceFormat.value = value;
  retstr->metricType = metricType;
}

uint64_t AboveTargetZoneModel.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24A5F948C + 4 * byte_24A61BAE0[a1]))(0xD000000000000011, 0x800000024A61DDC0);
}

uint64_t sub_24A5F948C()
{
  return 0x7079547472656C61;
}

uint64_t sub_24A5F94BC()
{
  return 1953066613;
}

uint64_t sub_24A5F94CC()
{
  return 0x6D726F4665636170;
}

uint64_t sub_24A5F94EC()
{
  return 0x795463697274656DLL;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance AboveTargetZoneModel.CodingKeys()
{
  unsigned __int8 *v0;

  return AboveTargetZoneModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance AboveTargetZoneModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized AboveTargetZoneModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance AboveTargetZoneModel.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AboveTargetZoneModel.CodingKeys()
{
  lazy protocol witness table accessor for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AboveTargetZoneModel.CodingKeys()
{
  lazy protocol witness table accessor for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t AboveTargetZoneModel.encode(to:)(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[9];
  _BYTE v11[6];
  char v12;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AboveTargetZoneModel.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v11[5] = *v3;
  v11[4] = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    v11[3] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[2] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[1] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    outlined init with take of VoiceFeedbackPaceFormat?((uint64_t)(v3 + 33), (uint64_t)&v12);
    outlined init with take of VoiceFeedbackPaceFormat?((uint64_t)&v12, (uint64_t)v11);
    v10[8] = 4;
    lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    v10[7] = v3[34];
    v10[6] = 5;
    lazy protocol witness table accessor for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

double AboveTargetZoneModel.init(from:)@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  _BYTE v7[19];

  specialized AboveTargetZoneModel.init(from:)(a1, (uint64_t)&v6);
  if (!v2)
  {
    result = *(double *)&v6;
    v5 = *(_OWORD *)v7;
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v5;
    *(_DWORD *)(a2 + 31) = *(_DWORD *)&v7[15];
  }
  return result;
}

double protocol witness for Decodable.init(from:) in conformance AboveTargetZoneModel@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  _BYTE v7[19];

  specialized AboveTargetZoneModel.init(from:)(a1, (uint64_t)&v6);
  if (!v2)
  {
    result = *(double *)&v6;
    v5 = *(_OWORD *)v7;
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v5;
    *(_DWORD *)(a2 + 31) = *(_DWORD *)&v7[15];
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance AboveTargetZoneModel(_QWORD *a1)
{
  return AboveTargetZoneModel.encode(to:)(a1);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance AboveTargetZoneModel(__int128 *a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;
  _OWORD v8[2];

  v2 = a1[1];
  v5 = *a1;
  v6[0] = v2;
  *(_DWORD *)((char *)v6 + 15) = *(_DWORD *)((char *)a1 + 31);
  v3 = a2[1];
  v7 = *a2;
  v8[0] = v3;
  *(_DWORD *)((char *)v8 + 15) = *(_DWORD *)((char *)a2 + 31);
  return specialized static AboveTargetZoneModel.__derived_struct_equals(_:_:)((double *)&v5, (double *)&v7);
}

uint64_t AboveTargetZoneModel.executePattern(wrapper:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[6] = a1;
  v2[7] = v1;
  v3 = type metadata accessor for Logger();
  v2[8] = v3;
  v2[9] = *(_QWORD *)(v3 - 8);
  v2[10] = swift_task_alloc();
  return swift_task_switch();
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  swift_task_dealloc();
  outlined release of AboveTargetZoneModel(*(_QWORD *)(v4 + 56));
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  swift_task_dealloc();
  outlined release of AboveTargetZoneModel(*(_QWORD *)(v4 + 56));
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  swift_task_dealloc();
  outlined release of AboveTargetZoneModel(*(_QWORD *)(v4 + 56));
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t AboveTargetZoneModel.executePattern(wrapper:)()
{
  uint64_t v0;
  unsigned __int8 v1;
  BOOL v2;
  uint64_t v3;
  uint64_t *v4;
  char v5;
  uint64_t v6;
  _QWORD *v7;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  char v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t (*v31)(uint64_t);
  _BYTE *v32;
  uint64_t v33;
  uint64_t (*v34)(char, char, uint64_t, uint64_t);
  uint64_t (*v35)(char, char, uint64_t, uint64_t);
  uint64_t v36;

  if (one-time initialization token for noPaceFormatMetrics != -1)
    swift_once();
  v1 = *(_BYTE *)(*(_QWORD *)(v0 + 56) + 34);
  v2 = specialized Sequence<>.contains(_:)(v1, (uint64_t)noPaceFormatMetrics._rawValue);
  v3 = *(_QWORD *)(v0 + 56);
  if (v2)
  {
    v4 = __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 48), *(_QWORD *)(*(_QWORD *)(v0 + 48) + 24));
    v5 = *(_BYTE *)(v3 + 32);
    v6 = *v4;
    outlined retain of AboveTargetZoneModel(v3);
    v34 = (uint64_t (*)(char, char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveNonPace(executeSashGroupOnWatch:isSingleThreshold:_:)
                                                               + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveNonPace(executeSashGroupOnWatch:isSingleThreshold:_:));
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v7;
    *v7 = v0;
    v7[1] = AboveTargetZoneModel.executePattern(wrapper:);
    return v34(0, v5, v6, *(_QWORD *)(v0 + 56));
  }
  else
  {
    outlined init with take of VoiceFeedbackPaceFormat?(v3 + 33, v0 + 113);
    outlined init with take of VoiceFeedbackPaceFormat?(v0 + 113, v0 + 112);
    v9 = *(unsigned __int8 *)(v0 + 112);
    if (v9 == 2)
    {
      v11 = *(_QWORD *)(v0 + 72);
      v10 = *(_QWORD *)(v0 + 80);
      v13 = *(_QWORD *)(v0 + 56);
      v12 = *(_QWORD *)(v0 + 64);
      v14 = Logger.workout.unsafeMutableAddressor();
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v10, v14, v12);
      outlined retain of AboveTargetZoneModel(v13);
      outlined retain of AboveTargetZoneModel(v13);
      v15 = Logger.logObject.getter();
      v16 = static os_log_type_t.error.getter();
      v17 = os_log_type_enabled(v15, v16);
      v19 = *(_QWORD *)(v0 + 72);
      v18 = *(_QWORD *)(v0 + 80);
      v21 = *(_QWORD *)(v0 + 56);
      v20 = *(_QWORD *)(v0 + 64);
      if (v17)
      {
        v33 = *(_QWORD *)(v0 + 64);
        v22 = (uint8_t *)swift_slowAlloc();
        v23 = swift_slowAlloc();
        v36 = v23;
        *(_DWORD *)v22 = 136315138;
        *(_BYTE *)(v0 + 114) = v1;
        v24 = String.init<A>(describing:)();
        *(_QWORD *)(v0 + 40) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v36);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        outlined release of AboveTargetZoneModel(v21);
        outlined release of AboveTargetZoneModel(v21);
        _os_log_impl(&dword_24A5E6000, v15, v16, "AboveTargetZoneModel needs a pace format for: %s", v22, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24BD15374](v23, -1, -1);
        MEMORY[0x24BD15374](v22, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v33);
      }
      else
      {
        outlined release of AboveTargetZoneModel(*(_QWORD *)(v0 + 56));
        outlined release of AboveTargetZoneModel(v21);

        (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
      }
      lazy protocol witness table accessor for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors();
      swift_allocError();
      *v32 = 1;
      swift_willThrow();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    else
    {
      v26 = *(_QWORD *)(v0 + 56);
      v27 = __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 48), *(_QWORD *)(*(_QWORD *)(v0 + 48) + 24));
      v28 = *(_BYTE *)(v26 + 32);
      v29 = *v27;
      outlined retain of AboveTargetZoneModel(v26);
      if ((v9 & 1) != 0)
      {
        v35 = (uint64_t (*)(char, char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAbovePace(executeSashGroupOnWatch:isSingleThreshold:_:)
                                                                   + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAbovePace(executeSashGroupOnWatch:isSingleThreshold:_:));
        v30 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 104) = v30;
        v31 = AboveTargetZoneModel.executePattern(wrapper:);
      }
      else
      {
        v35 = (uint64_t (*)(char, char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveSpeed(executeSashGroupOnWatch:isSingleThreshold:_:)
                                                                   + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveSpeed(executeSashGroupOnWatch:isSingleThreshold:_:));
        v30 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 96) = v30;
        v31 = AboveTargetZoneModel.executePattern(wrapper:);
      }
      *v30 = v0;
      v30[1] = v31;
      return v35(0, v28, v29, *(_QWORD *)(v0 + 56));
    }
  }
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance AboveTargetZoneModel(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v4;
  _QWORD *v5;

  v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v2 + 32) = v4;
  *(_DWORD *)(v2 + 47) = *(_DWORD *)(v1 + 31);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 56) = v5;
  *v5 = v2;
  v5[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance AboveTargetZoneModel;
  return AboveTargetZoneModel.executePattern(wrapper:)(a1);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t specialized AboveTargetZoneModel.init(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  double v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char v28;
  int v29;
  uint64_t v30;
  char v31;
  int v32;
  uint64_t result;
  uint64_t v34;
  double v35;
  int v36;
  int v37;
  uint64_t v38;
  char v39;
  char v40;
  unsigned __int8 v41;
  double v42;
  char v43;
  _QWORD v44[2];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  BOOL v53;
  unsigned __int8 v54;
  char v55;

  v4 = type metadata accessor for Logger();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(specialized Sequence.compactMap<A>(_:)(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
    v8 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v8 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v51 = v8;
  v9 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v9, 1, &v51);
  swift_bridgeObjectRelease();
  v10 = v51;
  v11 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
  swift_retain_n();
  v12 = Logger.logObject.getter();
  v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v46 = swift_slowAlloc();
    *(_QWORD *)&v51 = v46;
    *(_DWORD *)v14 = 136315394;
    v48 = a1;
    v49 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000014, 0x800000024A61BBA0, (uint64_t *)&v51));
    v47 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v14 + 12) = 2080;
    v44[1] = v14 + 14;
    lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
    v45 = v4;
    swift_retain();
    v15 = Dictionary.description.getter();
    v16 = a2;
    v18 = v17;
    swift_release();
    v49 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v18, (uint64_t *)&v51));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    a2 = v16;
    a1 = v48;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A5E6000, v12, v13, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v14, 0x16u);
    v19 = v46;
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v19, -1, -1);
    MEMORY[0x24BD15374](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v47 + 8))(v7, v45);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  if (*(_QWORD *)(v10 + 16)
    && (v20 = specialized __RawDictionaryStorage.find<A>(_:)(6), (v21 & 1) != 0)
    && (outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v20, (uint64_t)&v51), (swift_dynamicCast() & 1) != 0)
    && *(_QWORD *)(v10 + 16)
    && (v22 = v49, v23 = specialized __RawDictionaryStorage.find<A>(_:)(15), (v24 & 1) != 0)
    && (outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v23, (uint64_t)&v51), (swift_dynamicCast() & 1) != 0))
  {
    v25 = v50;
    if (!*(_QWORD *)(v10 + 16))
      goto LABEL_26;
    v26 = *(_QWORD *)&v49;
    v27 = specialized __RawDictionaryStorage.find<A>(_:)(5);
    if ((v28 & 1) == 0)
      goto LABEL_26;
    outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v27, (uint64_t)&v51);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*(_QWORD *)(v10 + 16))
      {
        v29 = LOBYTE(v49);
        v30 = specialized __RawDictionaryStorage.find<A>(_:)(7);
        if ((v31 & 1) != 0)
        {
          outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v30, (uint64_t)&v51);
          if ((swift_dynamicCast() & 1) == 0
            || (v32 = specialized VoiceFeedbackMetricType.init(rawValue:)(*(unint64_t *)&v49),
                v32 == 8))
          {
            swift_release();
            swift_bridgeObjectRelease();
            goto LABEL_23;
          }
          v37 = v32;
          if (*(_QWORD *)(v10 + 16) && (v38 = specialized __RawDictionaryStorage.find<A>(_:)(12), (v39 & 1) != 0))
          {
            outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v38, (uint64_t)&v51);
          }
          else
          {
            v51 = 0u;
            v52 = 0u;
          }
          swift_release();
          if (*((_QWORD *)&v52 + 1))
          {
            if ((swift_dynamicCast() & 1) != 0)
            {
              if (*(_QWORD *)&v49 == 1)
                v40 = 1;
              else
                v40 = 2;
              if (v49 == 0.0)
                v41 = 0;
              else
                v41 = v40;
LABEL_43:
              if (v29)
                v42 = v22;
              else
                v42 = v22 + 1.0;
              LOBYTE(v51) = 23;
              *((double *)&v51 + 1) = v22;
              *(_QWORD *)&v52 = v26;
              *((_QWORD *)&v52 + 1) = v25;
              v53 = v22 == v42;
              v54 = v41;
              v55 = v37;
              swift_bridgeObjectRetain();
              v43 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1);
              swift_bridgeObjectRelease();
              result = swift_bridgeObjectRelease();
              if ((v43 & 1) != 0)
              {
                v35 = v22;
                v36 = (v22 == v42) | (v41 << 8) | (v37 << 16);
                v34 = 23;
                goto LABEL_25;
              }
              goto LABEL_23;
            }
          }
          else
          {
            outlined destroy of Any?((uint64_t)&v51);
          }
          v41 = 2;
          goto LABEL_43;
        }
      }
LABEL_26:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_release();
      goto LABEL_24;
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
  }
LABEL_23:
  result = swift_bridgeObjectRelease();
LABEL_24:
  v34 = 0;
  v35 = 0.0;
  v26 = 0;
  v25 = 0;
  v36 = 0;
LABEL_25:
  *(_QWORD *)a2 = v34;
  *(double *)(a2 + 8) = v35;
  *(_QWORD *)(a2 + 16) = v26;
  *(_QWORD *)(a2 + 24) = v25;
  *(_WORD *)(a2 + 32) = v36;
  *(_BYTE *)(a2 + 34) = BYTE2(v36);
  return result;
}

BOOL specialized static AboveTargetZoneModel.__derived_struct_equals(_:_:)(double *a1, double *a2)
{
  BOOL v4;
  char v5;
  _BOOL8 result;
  int v7;
  int v8;

  if (*(unsigned __int8 *)a1 != *(unsigned __int8 *)a2 || a1[1] != a2[1])
    return 0;
  v4 = *((_QWORD *)a1 + 2) == *((_QWORD *)a2 + 2) && *((_QWORD *)a1 + 3) == *((_QWORD *)a2 + 3);
  if (v4 || (v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v5 & 1) != 0))
  {
    if (((*((unsigned __int8 *)a1 + 32) ^ *((unsigned __int8 *)a2 + 32)) & 1) != 0)
      return 0;
    v7 = *((unsigned __int8 *)a1 + 33);
    v8 = *((unsigned __int8 *)a2 + 33);
    if (v7 == 2)
    {
      if (v8 != 2)
        return 0;
      return *((unsigned __int8 *)a1 + 34) == *((unsigned __int8 *)a2 + 34);
    }
    result = 0;
    if (v8 != 2 && ((v8 ^ v7) & 1) == 0)
      return *((unsigned __int8 *)a1 + 34) == *((unsigned __int8 *)a2 + 34);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for AboveTargetZoneModel.CodingKeys, &unk_251BEAD80);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for AboveTargetZoneModel.CodingKeys, &unk_251BEAD80);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for AboveTargetZoneModel.CodingKeys, &unk_251BEAD80);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for AboveTargetZoneModel.CodingKeys, &unk_251BEAD80);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys);
  }
  return result;
}

uint64_t specialized AboveTargetZoneModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7079547472656C61 && a2 == 0xE900000000000065;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x647574696E67616DLL && a2 == 0xE900000000000065
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1953066613 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024A61DDC0
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6D726F4665636170 && a2 == 0xEA00000000007461
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x795463697274656DLL && a2 == 0xEA00000000006570)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t specialized AboveTargetZoneModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t result;
  int v18;
  int v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;
  unsigned __int8 v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<AboveTargetZoneModel.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  v28 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v9 = v29;
  v27 = 1;
  KeyedDecodingContainer.decode(_:forKey:)();
  v11 = v10;
  v26 = 2;
  v12 = KeyedDecodingContainer.decode(_:forKey:)();
  v14 = v13;
  v20 = v12;
  v25 = 3;
  swift_bridgeObjectRetain();
  v19 = KeyedDecodingContainer.decode(_:forKey:)();
  v23 = 4;
  lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  v18 = v24;
  v21 = 5;
  lazy protocol witness table accessor for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v15 = v19 & 1;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v16 = v22;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  result = swift_bridgeObjectRelease();
  *(_BYTE *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_QWORD *)(a2 + 16) = v20;
  *(_QWORD *)(a2 + 24) = v14;
  *(_BYTE *)(a2 + 32) = v15;
  *(_BYTE *)(a2 + 33) = v18;
  *(_BYTE *)(a2 + 34) = v16;
  return result;
}

unint64_t instantiation function for generic protocol witness table for AboveTargetZoneModel(_QWORD *a1)
{
  unint64_t result;

  a1[1] = lazy protocol witness table accessor for type AboveTargetZoneModel and conformance AboveTargetZoneModel();
  a1[2] = lazy protocol witness table accessor for type AboveTargetZoneModel and conformance AboveTargetZoneModel();
  result = lazy protocol witness table accessor for type AboveTargetZoneModel and conformance AboveTargetZoneModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type AboveTargetZoneModel and conformance AboveTargetZoneModel()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AboveTargetZoneModel and conformance AboveTargetZoneModel;
  if (!lazy protocol witness table cache variable for type AboveTargetZoneModel and conformance AboveTargetZoneModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for AboveTargetZoneModel, &type metadata for AboveTargetZoneModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AboveTargetZoneModel and conformance AboveTargetZoneModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AboveTargetZoneModel and conformance AboveTargetZoneModel;
  if (!lazy protocol witness table cache variable for type AboveTargetZoneModel and conformance AboveTargetZoneModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for AboveTargetZoneModel, &type metadata for AboveTargetZoneModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AboveTargetZoneModel and conformance AboveTargetZoneModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AboveTargetZoneModel and conformance AboveTargetZoneModel;
  if (!lazy protocol witness table cache variable for type AboveTargetZoneModel and conformance AboveTargetZoneModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for AboveTargetZoneModel, &type metadata for AboveTargetZoneModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AboveTargetZoneModel and conformance AboveTargetZoneModel);
  }
  return result;
}

uint64_t initializeWithCopy for AboveTargetZoneModel(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_WORD *)(a1 + 33) = *(_WORD *)(a2 + 33);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AboveTargetZoneModel(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_BYTE *)(a1 + 34) = *(_BYTE *)(a2 + 34);
  return a1;
}

__n128 __swift_memcpy35_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 31) = *(_DWORD *)(a2 + 31);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AboveTargetZoneModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_WORD *)(a1 + 33) = *(_WORD *)(a2 + 33);
  return a1;
}

uint64_t getEnumTagSinglePayload for AboveTargetZoneModel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 35))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AboveTargetZoneModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 34) = 0;
    *(_WORD *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 35) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 35) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AboveTargetZoneModel()
{
  return &type metadata for AboveTargetZoneModel;
}

uint64_t getEnumTagSinglePayload for AboveTargetZoneModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AboveTargetZoneModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A5FAE58 + 4 * byte_24A61BAEB[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_24A5FAE8C + 4 * byte_24A61BAE6[v4]))();
}

uint64_t sub_24A5FAE8C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5FAE94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A5FAE9CLL);
  return result;
}

uint64_t sub_24A5FAEA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A5FAEB0);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_24A5FAEB4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5FAEBC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for AboveTargetZoneModel.CodingKeys()
{
  return &unk_251BEAD80;
}

uint64_t outlined retain of AboveTargetZoneModel(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t outlined release of AboveTargetZoneModel(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t TimeSplitModel.alertType.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*TimeSplitModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

WorkoutAnnouncements::TimeSplitModel __swiftcall TimeSplitModel.init(duration:)(Swift::Double duration)
{
  WorkoutAnnouncements::VoiceFeedbackAlertType v1;
  WorkoutAnnouncements::TimeSplitModel result;

  v1 = WorkoutAnnouncements_VoiceFeedbackAlertType_transitionedNotableTime;
  result.duration = duration;
  result.alertType = v1;
  return result;
}

BOOL static TimeSplitModel.__derived_struct_equals(_:_:)(char a1, char a2, double a3, double a4)
{
  return a3 == a4 && a1 == a2;
}

uint64_t TimeSplitModel.CodingKeys.stringValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6E6F697461727564;
  else
    return 0x7079547472656C61;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance TimeSplitModel.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance TimeSplitModel.CodingKeys()
{
  char *v0;

  return TimeSplitModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance TimeSplitModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized TimeSplitModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance TimeSplitModel.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance TimeSplitModel.CodingKeys()
{
  lazy protocol witness table accessor for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance TimeSplitModel.CodingKeys()
{
  lazy protocol witness table accessor for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t TimeSplitModel.encode(to:)(_QWORD *a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;
  char v12;
  char v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<TimeSplitModel.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v13 = a2;
  v12 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    v11 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t lazy protocol witness table accessor for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for TimeSplitModel.CodingKeys, &unk_251BEAF98);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for TimeSplitModel.CodingKeys, &unk_251BEAF98);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for TimeSplitModel.CodingKeys, &unk_251BEAF98);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for TimeSplitModel.CodingKeys, &unk_251BEAF98);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys);
  }
  return result;
}

double TimeSplitModel.init(from:)(_QWORD *a1)
{
  return specialized TimeSplitModel.init(from:)(a1);
}

void protocol witness for Decodable.init(from:) in conformance TimeSplitModel(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v4;
  double v5;

  v5 = specialized TimeSplitModel.init(from:)(a1);
  if (!v2)
  {
    *(_BYTE *)a2 = v4;
    *(double *)(a2 + 8) = v5;
  }
}

uint64_t protocol witness for Encodable.encode(to:) in conformance TimeSplitModel(_QWORD *a1)
{
  char *v1;

  return TimeSplitModel.encode(to:)(a1, *v1);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance TimeSplitModel(double *a1, double *a2)
{
  return *(unsigned __int8 *)a1 == *(unsigned __int8 *)a2 && a1[1] == a2[1];
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance TimeSplitModel(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = *(_QWORD *)(v1 + 8);
  return swift_task_switch();
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance TimeSplitModel()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(char, uint64_t, double);

  v1 = *__swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
  v4 = (uint64_t (*)(char, uint64_t, double))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableTime(executeSashGroupOnWatch:_:)
                                                     + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableTime(executeSashGroupOnWatch:_:));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v2;
  *v2 = v0;
  v2[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance TimeSplitModel;
  return v4(0, v1, *(double *)(v0 + 24));
}

uint64_t specialized TimeSplitModel.init(with:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  BOOL v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;

  v2 = type metadata accessor for Logger();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(specialized Sequence.compactMap<A>(_:)(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
    v6 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v6 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v27 = v6;
  v7 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v7, 1, &v27);
  swift_bridgeObjectRelease();
  v8 = v27;
  v9 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
  swift_retain_n();
  v10 = Logger.logObject.getter();
  v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v24 = swift_slowAlloc();
    *(_QWORD *)&v27 = v24;
    *(_DWORD *)v12 = 136315394;
    v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0x696C7053656D6954, 0xEE006C65646F4D74, (uint64_t *)&v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v12 + 12) = 2080;
    lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
    v23 = v2;
    swift_retain();
    v25 = a1;
    v13 = Dictionary.description.getter();
    v22 = v3;
    v15 = v14;
    swift_release();
    v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v15, (uint64_t *)&v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A5E6000, v10, v11, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v12, 0x16u);
    v16 = v24;
    a1 = v25;
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v16, -1, -1);
    MEMORY[0x24BD15374](v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v22 + 8))(v5, v23);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  if (*(_QWORD *)(v8 + 16) && (v17 = specialized __RawDictionaryStorage.find<A>(_:)(2), (v18 & 1) != 0))
  {
    outlined init with copy of Any(*(_QWORD *)(v8 + 56) + 32 * v17, (uint64_t)&v27);
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
  }
  swift_release();
  if (!*((_QWORD *)&v28 + 1))
  {
    swift_bridgeObjectRelease();
    outlined destroy of Any?((uint64_t)&v27);
    return 25;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 25;
  }
  v19 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1, 0x15u);
  swift_bridgeObjectRelease();
  if (v19)
    return 21;
  else
    return 25;
}

uint64_t specialized TimeSplitModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7079547472656C61 && a2 == 0xE900000000000065;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000)
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

double specialized TimeSplitModel.init(from:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  double v6;
  double v7;
  uint64_t v9;
  char v10;
  char v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<TimeSplitModel.CodingKeys>);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  v11 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v10 = 1;
  KeyedDecodingContainer.decode(_:forKey:)();
  v7 = v6;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return v7;
}

unint64_t instantiation function for generic protocol witness table for TimeSplitModel(_QWORD *a1)
{
  unint64_t result;

  a1[1] = lazy protocol witness table accessor for type TimeSplitModel and conformance TimeSplitModel();
  a1[2] = lazy protocol witness table accessor for type TimeSplitModel and conformance TimeSplitModel();
  result = lazy protocol witness table accessor for type TimeSplitModel and conformance TimeSplitModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type TimeSplitModel and conformance TimeSplitModel()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TimeSplitModel and conformance TimeSplitModel;
  if (!lazy protocol witness table cache variable for type TimeSplitModel and conformance TimeSplitModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for TimeSplitModel, &type metadata for TimeSplitModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TimeSplitModel and conformance TimeSplitModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TimeSplitModel and conformance TimeSplitModel;
  if (!lazy protocol witness table cache variable for type TimeSplitModel and conformance TimeSplitModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for TimeSplitModel, &type metadata for TimeSplitModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TimeSplitModel and conformance TimeSplitModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TimeSplitModel and conformance TimeSplitModel;
  if (!lazy protocol witness table cache variable for type TimeSplitModel and conformance TimeSplitModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for TimeSplitModel, &type metadata for TimeSplitModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TimeSplitModel and conformance TimeSplitModel);
  }
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TimeSplitModel(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xE8 && a1[16])
    return (*(_DWORD *)a1 + 232);
  v3 = *a1;
  v4 = v3 >= 0x19;
  v5 = v3 - 25;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for TimeSplitModel(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xE7)
  {
    *(_QWORD *)result = a2 - 232;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xE8)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xE8)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 24;
  }
  return result;
}

ValueMetadata *type metadata accessor for TimeSplitModel()
{
  return &type metadata for TimeSplitModel;
}

uint64_t getEnumTagSinglePayload for TimeSplitModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TimeSplitModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A5FBCF4 + 4 * byte_24A61BCF5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24A5FBD28 + 4 * byte_24A61BCF0[v4]))();
}

uint64_t sub_24A5FBD28(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5FBD30(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A5FBD38);
  return result;
}

uint64_t sub_24A5FBD44(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A5FBD4CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24A5FBD50(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5FBD58(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *destructiveInjectEnumTag for TimeSplitModel.CodingKeys(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void *type metadata accessor for TimeSplitModel.CodingKeys()
{
  return &unk_251BEAF98;
}

uint64_t type metadata accessor for WorkoutRemindersCATs()
{
  uint64_t result;

  result = type metadata singleton initialization cache for WorkoutRemindersCATs;
  if (!type metadata singleton initialization cache for WorkoutRemindersCATs)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for WorkoutRemindersCATs()
{
  return swift_initClassMetadata2();
}

uint64_t WorkoutRemindersCATs.__allocating_init(templateDir:options:globals:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;

  v4 = type metadata accessor for CATOption();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  outlined init with copy of URL?(a1, (uint64_t)v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  v11 = CATWrapper.init(templateDir:options:globals:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  outlined destroy of URL?(a1);
  return v11;
}

uint64_t WorkoutRemindersCATs.__deallocating_deinit()
{
  CATWrapper.deinit();
  return swift_deallocClassInstance();
}

uint64_t ObjC metadata update function for WorkoutRemindersCATs()
{
  return type metadata accessor for WorkoutRemindersCATs();
}

uint64_t outlined init with copy of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of URL?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *WorkoutReminderAnnouncementDirectInvocation.identifier.unsafeMutableAddressor()
{
  if (one-time initialization token for identifier != -1)
    swift_once();
  return &static WorkoutReminderAnnouncementDirectInvocation.identifier;
}

uint64_t WorkoutReminderAnnouncementDirectInvocation.init(directInvocation:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD v4[6];

  specialized WorkoutReminderAnnouncementDirectInvocation.init(directInvocation:)(a1, v4);
  return outlined init with take of WorkoutReminderAnnouncementDirectInvocation?((uint64_t)v4, a2);
}

uint64_t one-time initialization function for identifier()
{
  uint64_t result;
  uint64_t v1;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static WorkoutReminderAnnouncementDirectInvocation.identifier = result;
  *(_QWORD *)algn_257943D58 = v1;
  return result;
}

uint64_t static WorkoutReminderAnnouncementDirectInvocation.identifier.getter()
{
  uint64_t v0;

  if (one-time initialization token for identifier != -1)
    swift_once();
  v0 = static WorkoutReminderAnnouncementDirectInvocation.identifier;
  swift_bridgeObjectRetain();
  return v0;
}

id AFSiriWorkoutReminder.init(data:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  Class isa;
  id v8;
  uint64_t v9;
  HKWorkoutActivityType v10;
  HKWorkoutSessionLocationType v11;
  HKWorkoutSwimmingLocationType v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v21;
  Swift::tuple_HKWorkoutActivityType_HKWorkoutSessionLocationType_HKWorkoutSwimmingLocationType v22;

  v2 = type metadata accessor for Logger();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (void *)objc_opt_self();
  specialized _dictionaryUpCast<A, B, C, D>(_:)(a1);
  swift_bridgeObjectRelease();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v6, sel_workoutReminderFromPayload_, isa);

  if (v8)
  {
    v9 = AFSiriWorkoutReminder.tryInferWorkoutType()();
    v22 = AFSiriWorkoutReminder.tryInferWorkoutActivityLocationType()();
    v10 = v22._0;
    v11 = v22._1;
    v12 = v22._2;
    v13 = objc_msgSend(v8, sel_predictionIdentifier);
    if (!v13)
    {
      v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v13 = (id)MEMORY[0x24BD14CB4](v14);
      swift_bridgeObjectRelease();
    }
    v15 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPredictionIdentifier_predictionType_workoutType_workoutActivityType_locationType_swimmingLocationType_, v13, objc_msgSend(v8, sel_predictionType), v9, v10, v11, v12);

  }
  else
  {
    v16 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v16, v2);
    v17 = Logger.logObject.getter();
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, (os_log_type_t)v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_24A5E6000, v17, (os_log_type_t)v18, "Failed to parse workout reminder from payload.", v19, 2u);
      MEMORY[0x24BD15374](v19, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return 0;
  }
  return v15;
}

uint64_t AFSiriWorkoutReminder.tryInferWorkoutType()()
{
  void *v0;
  uint64_t v1;
  BOOL v3;
  uint64_t v4;

  v1 = (uint64_t)objc_msgSend(v0, sel_workoutType);
  if (!objc_msgSend(v0, sel_workoutType))
  {
    v1 = 4;
    switch((unint64_t)objc_msgSend(v0, sel_workoutActivityType))
    {
      case 0xDuLL:
        return 2 * (objc_msgSend(v0, sel_workoutLocationType) != (id)2);
      case 0x10uLL:
        return 3;
      case 0x23uLL:
        return v1;
      case 0x25uLL:
        v3 = objc_msgSend(v0, sel_workoutLocationType) == (id)2;
        v4 = 5;
        goto LABEL_9;
      case 0x2EuLL:
        v3 = objc_msgSend(v0, sel_workoutSwimmingLocationType) == (id)1;
        v4 = 7;
        goto LABEL_9;
      case 0x34uLL:
        v3 = objc_msgSend(v0, sel_workoutLocationType) == (id)2;
        v4 = 9;
LABEL_9:
        if (v3)
          return v4;
        else
          return v4 + 1;
      default:
        return (uint64_t)objc_msgSend(v0, sel_workoutType);
    }
  }
  return v1;
}

Swift::tuple_HKWorkoutActivityType_HKWorkoutSessionLocationType_HKWorkoutSwimmingLocationType __swiftcall AFSiriWorkoutReminder.tryInferWorkoutActivityLocationType()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  HKWorkoutActivityType v5;
  HKWorkoutSessionLocationType v6;
  HKWorkoutSwimmingLocationType v7;
  Swift::tuple_HKWorkoutActivityType_HKWorkoutSessionLocationType_HKWorkoutSwimmingLocationType result;

  v1 = v0;
  v2 = (uint64_t)objc_msgSend(v0, sel_workoutActivityType);
  v3 = (uint64_t)objc_msgSend(v0, sel_workoutLocationType);
  v4 = (uint64_t)objc_msgSend(v0, sel_workoutSwimmingLocationType);
  if (!objc_msgSend(v1, sel_workoutActivityType))
  {
    v4 = 0;
    v2 = 13;
    v3 = 2;
    switch((unint64_t)objc_msgSend(v1, sel_workoutType))
    {
      case 1uLL:
        break;
      case 2uLL:
        v4 = 0;
        v2 = 13;
        v3 = 3;
        break;
      case 3uLL:
        v4 = 0;
        v2 = 16;
        v3 = 1;
        break;
      case 4uLL:
        v4 = 0;
        v2 = 35;
        v3 = 1;
        break;
      case 5uLL:
        v4 = 0;
        v2 = 37;
        v3 = 2;
        break;
      case 6uLL:
        v4 = 0;
        v2 = 37;
        v3 = 3;
        break;
      case 7uLL:
        v2 = 46;
        v4 = 1;
        v3 = 1;
        break;
      case 8uLL:
        v2 = 46;
        v3 = 1;
        v4 = 2;
        break;
      case 9uLL:
        v4 = 0;
        v2 = 52;
        v3 = 2;
        break;
      case 0xAuLL:
        v4 = 0;
        v2 = 52;
        v3 = 3;
        break;
      default:
        v2 = (uint64_t)objc_msgSend(v1, sel_workoutActivityType);
        v3 = (uint64_t)objc_msgSend(v1, sel_workoutLocationType);
        v4 = (uint64_t)objc_msgSend(v1, sel_workoutSwimmingLocationType);
        break;
    }
  }
  v5 = v2;
  v6 = v3;
  v7 = v4;
  result._2 = v7;
  result._1 = v6;
  result._0 = v5;
  return result;
}

uint64_t specialized WorkoutReminderAnnouncementDirectInvocation.init(directInvocation:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t result;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69[2];
  __int128 v70;
  __int128 v71;
  uint64_t v72;

  v4 = type metadata accessor for Logger();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v67 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v67 - v12;
  v14 = Parse.DirectInvocation.identifier.getter();
  v16 = v15;
  if (one-time initialization token for identifier != -1)
    swift_once();
  if (v14 == static WorkoutReminderAnnouncementDirectInvocation.identifier && v16 == *(_QWORD *)algn_257943D58)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
    {
      v19 = Logger.workout.unsafeMutableAddressor();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v13, v19, v4);
      v20 = Logger.logObject.getter();
      v21 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v20, v21))
      {
        v68 = a1;
        v22 = (uint8_t *)swift_slowAlloc();
        v23 = swift_slowAlloc();
        v69[0] = v23;
        *(_DWORD *)v22 = 136315138;
        v72 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002BLL, 0x800000024A61BF80, v69);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl(&dword_24A5E6000, v20, v21, "%s does not support invocation identifier", v22, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24BD15374](v23, -1, -1);
        MEMORY[0x24BD15374](v22, -1, -1);

        v24 = type metadata accessor for Parse.DirectInvocation();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(v68, v24);
      }
      else
      {

        v44 = type metadata accessor for Parse.DirectInvocation();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 8))(a1, v44);
      }
      result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v13, v4);
      goto LABEL_26;
    }
  }
  v25 = Parse.DirectInvocation.userData.getter();
  if (!v25)
  {
LABEL_21:
    v36 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v36, v4);
    v37 = Logger.logObject.getter();
    v38 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v37, v38))
    {
      v68 = v4;
      v39 = (uint8_t *)swift_slowAlloc();
      v40 = swift_slowAlloc();
      v69[0] = v40;
      *(_DWORD *)v39 = 136315138;
      v72 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002BLL, 0x800000024A61BF80, v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_24A5E6000, v37, v38, "%s Failed to deserialize invocation payload", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD15374](v40, -1, -1);
      MEMORY[0x24BD15374](v39, -1, -1);

      v41 = type metadata accessor for Parse.DirectInvocation();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 8))(a1, v41);
      result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v68);
    }
    else
    {

      v43 = type metadata accessor for Parse.DirectInvocation();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 8))(a1, v43);
      result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
LABEL_26:
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v31 = 0;
    v48 = 0;
    v49 = 0;
    goto LABEL_27;
  }
  v26 = v25;
  v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!*(_QWORD *)(v26 + 16) || (v29 = specialized __RawDictionaryStorage.find<A>(_:)(v27, v28), (v30 & 1) == 0))
  {
    v70 = 0u;
    v71 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  outlined init with copy of Any(*(_QWORD *)(v26 + 56) + 32 * v29, (uint64_t)&v70);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v71 + 1))
    goto LABEL_20;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_35:
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  v31 = LOBYTE(v69[0]);
  v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(_QWORD *)(v26 + 16))
  {
    v34 = specialized __RawDictionaryStorage.find<A>(_:)(v32, v33);
    if ((v35 & 1) != 0)
    {
      outlined init with copy of Any(*(_QWORD *)(v26 + 56) + 32 * v34, (uint64_t)&v70);
    }
    else
    {
      v70 = 0u;
      v71 = 0u;
    }
  }
  else
  {
    v70 = 0u;
    v71 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v71 + 1))
  {
LABEL_20:
    swift_bridgeObjectRelease();
    outlined destroy of Any?((uint64_t)&v70);
    goto LABEL_21;
  }
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_35;
  v68 = a1;
  v48 = v69[0];
  v50 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(_QWORD *)(v26 + 16))
  {
    v52 = specialized __RawDictionaryStorage.find<A>(_:)(v50, v51);
    if ((v53 & 1) != 0)
    {
      outlined init with copy of Any(*(_QWORD *)(v26 + 56) + 32 * v52, (uint64_t)&v70);
    }
    else
    {
      v70 = 0u;
      v71 = 0u;
    }
  }
  else
  {
    v70 = 0u;
    v71 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v71 + 1))
  {
    swift_bridgeObjectRelease();
    outlined destroy of Any?((uint64_t)&v70);
    a1 = v68;
    goto LABEL_21;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    a1 = v68;
    goto LABEL_21;
  }
  v49 = v69[0];
  type metadata accessor for AFSiriWorkoutReminder();
  v54 = swift_bridgeObjectRetain();
  v55 = AFSiriWorkoutReminder.init(data:)(v54);
  if (!v55)
  {
    swift_bridgeObjectRelease();
    v61 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, v61, v4);
    v62 = Logger.logObject.getter();
    v63 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v62, v63))
    {
      v64 = (uint8_t *)swift_slowAlloc();
      v65 = swift_slowAlloc();
      v69[0] = v65;
      *(_DWORD *)v64 = 136315138;
      v72 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002BLL, 0x800000024A61BF80, v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_24A5E6000, v62, v63, "%s Unable to create a workout reminder from the payload", v64, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD15374](v65, -1, -1);
      MEMORY[0x24BD15374](v64, -1, -1);
    }

    v66 = type metadata accessor for Parse.DirectInvocation();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 8))(v68, v66);
    result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    goto LABEL_26;
  }
  v45 = v55;
  v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(_QWORD *)(v26 + 16) && (v58 = specialized __RawDictionaryStorage.find<A>(_:)(v56, v57), (v59 & 1) != 0))
  {
    outlined init with copy of Any(*(_QWORD *)(v26 + 56) + 32 * v58, (uint64_t)&v70);
  }
  else
  {
    v70 = 0u;
    v71 = 0u;
  }
  swift_bridgeObjectRelease();
  v60 = type metadata accessor for Parse.DirectInvocation();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 8))(v68, v60);
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v71 + 1))
  {
    result = swift_dynamicCast();
    v46 = v69[0];
    v47 = v69[1];
    if (!(_DWORD)result)
    {
      v46 = 0;
      v47 = 0;
    }
  }
  else
  {
    result = outlined destroy of Any?((uint64_t)&v70);
    v46 = 0;
    v47 = 0;
  }
LABEL_27:
  *a2 = v45;
  a2[1] = v46;
  a2[2] = v47;
  a2[3] = v31;
  a2[4] = v48;
  a2[5] = v49;
  return result;
}

uint64_t outlined init with take of WorkoutReminderAnnouncementDirectInvocation?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WorkoutReminderAnnouncementDirectInvocation?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t destroy for WorkoutReminderAnnouncementDirectInvocation(id *a1)
{

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for WorkoutReminderAnnouncementDirectInvocation(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WorkoutReminderAnnouncementDirectInvocation(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t assignWithTake for WorkoutReminderAnnouncementDirectInvocation(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutReminderAnnouncementDirectInvocation(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WorkoutReminderAnnouncementDirectInvocation(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkoutReminderAnnouncementDirectInvocation()
{
  return &type metadata for WorkoutReminderAnnouncementDirectInvocation;
}

unint64_t type metadata accessor for AFSiriWorkoutReminder()
{
  unint64_t result;

  result = lazy cache variable for type metadata for AFSiriWorkoutReminder;
  if (!lazy cache variable for type metadata for AFSiriWorkoutReminder)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for AFSiriWorkoutReminder);
  }
  return result;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSD4KeysVySSyp_G_20WorkoutAnnouncements013VoiceFeedbackD0OSgs5NeverOTg504_s20e15Announcements21gH60AlertingPAAE12hasValidKeys2inSbSDySSypG_tFZAA0cdH0OSgSSXEfU_Tf1cn_n(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v23 = MEMORY[0x24BEE4AF8];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
  v2 = v23;
  result = specialized _NativeDictionary.startIndex.getter(a1);
  v6 = result;
  v7 = 0;
  v8 = a1 + 64;
  v20 = v1;
  v21 = v5;
  v22 = a1 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(a1 + 32))
  {
    v11 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(a1 + 36) != v5)
      goto LABEL_24;
    swift_bridgeObjectRetain();
    result = specialized VoiceFeedbackKeys.init(rawValue:)();
    v12 = result;
    v14 = *(_QWORD *)(v23 + 16);
    v13 = *(_QWORD *)(v23 + 24);
    if (v14 >= v13 >> 1)
      result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v13 > 1, v14 + 1, 1);
    *(_QWORD *)(v23 + 16) = v14 + 1;
    *(_BYTE *)(v23 + v14 + 32) = v12;
    v9 = 1 << *(_BYTE *)(a1 + 32);
    if (v6 >= v9)
      goto LABEL_25;
    v8 = a1 + 64;
    v15 = *(_QWORD *)(v22 + 8 * v11);
    if ((v15 & (1 << v6)) == 0)
      goto LABEL_26;
    v5 = v21;
    if (*(_DWORD *)(a1 + 36) != v21)
      goto LABEL_27;
    v16 = v15 & (-2 << (v6 & 0x3F));
    if (v16)
    {
      v9 = __clz(__rbit64(v16)) | v6 & 0xFFFFFFFFFFFFFFC0;
      v10 = v20;
    }
    else
    {
      v17 = v11 + 1;
      v18 = (unint64_t)(v9 + 63) >> 6;
      v10 = v20;
      if (v11 + 1 < v18)
      {
        v19 = *(_QWORD *)(v22 + 8 * v17);
        if (v19)
        {
LABEL_20:
          v9 = __clz(__rbit64(v19)) + (v17 << 6);
        }
        else
        {
          while (v18 - 2 != v11)
          {
            v19 = *(_QWORD *)(a1 + 80 + 8 * v11++);
            if (v19)
            {
              v17 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v7;
    v6 = v9;
    if (v7 == v10)
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

BOOL specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(uint64_t a1)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  unint64_t v4;
  char v5;
  unsigned __int8 v6;
  unint64_t v8;
  _BYTE v9[32];

  if (*(_QWORD *)(a1 + 16)
    && (v2 = v1,
        v4 = specialized __RawDictionaryStorage.find<A>(_:)(0x7079547472656C61, 0xE900000000000065),
        (v5 & 1) != 0)
    && (outlined init with copy of Any(*(_QWORD *)(a1 + 56) + 32 * v4, (uint64_t)v9), (swift_dynamicCast() & 1) != 0)
    && (v6 = specialized VoiceFeedbackAlertType.init(rawValue:)(v8), v6 != 25))
  {
    return *v2 == v6;
  }
  else
  {
    return 0;
  }
}

BOOL specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(uint64_t a1, unsigned __int8 a2)
{
  unint64_t v4;
  char v5;
  int v6;
  unint64_t v9;
  _BYTE v10[32];

  if (!*(_QWORD *)(a1 + 16))
    return 0;
  v4 = specialized __RawDictionaryStorage.find<A>(_:)(0x7079547472656C61, 0xE900000000000065);
  if ((v5 & 1) == 0)
    return 0;
  outlined init with copy of Any(*(_QWORD *)(a1 + 56) + 32 * v4, (uint64_t)v10);
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  v6 = specialized VoiceFeedbackAlertType.init(rawValue:)(v9);
  return v6 != 25 && v6 == a2;
}

uint64_t specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(uint64_t a1, unsigned __int8 a2)
{
  unint64_t v4;
  char v5;
  uint64_t result;
  int v7;
  unint64_t v9;
  _BYTE v10[32];

  if (!*(_QWORD *)(a1 + 16))
    return 0;
  v4 = specialized __RawDictionaryStorage.find<A>(_:)(0x7079547472656C61, 0xE900000000000065);
  if ((v5 & 1) == 0)
    return 0;
  outlined init with copy of Any(*(_QWORD *)(a1 + 56) + 32 * v4, (uint64_t)v10);
  result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    v7 = specialized VoiceFeedbackAlertType.init(rawValue:)(v9);
    return v7 != 25 && v7 == a2;
  }
  return result;
}

Swift::Bool __swiftcall VoiceFeedbackAlerting.hasValidAlertType(in:)(Swift::OpaquePointer in)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;
  char v7;
  int v8;
  Swift::Bool result;
  unint64_t v10;
  _BYTE v11[32];

  result = *((_QWORD *)in._rawValue + 2)
        && (v3 = v2,
            v4 = v1,
            v6 = specialized __RawDictionaryStorage.find<A>(_:)(0x7079547472656C61, 0xE900000000000065),
            (v7 & 1) != 0)
        && (outlined init with copy of Any(*((_QWORD *)in._rawValue + 7) + 32 * v6, (uint64_t)v11),
            (swift_dynamicCast() & 1) != 0)
        && (v8 = specialized VoiceFeedbackAlertType.init(rawValue:)(v10), v8 != 25)
        && v8 == (*(unsigned __int8 (**)(uint64_t, uint64_t))(v3 + 32))(v4, v3);
  return result;
}

BOOL protocol witness for static VoiceFeedbackAlerting.hasValidKeys(in:) in conformance GoalCompletionModel()
{
  return specialized static VoiceFeedbackAlerting.hasValidKeys(in:)();
}

BOOL specialized static VoiceFeedbackAlerting.hasValidKeys(in:)()
{
  uint64_t v0;
  uint64_t valid;
  uint64_t v2;
  unsigned __int8 *v3;
  uint64_t v4;
  int v5;
  int v6;
  BOOL v8;
  _BOOL8 v9;

  v0 = swift_bridgeObjectRetain();
  valid = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSD4KeysVySSyp_G_20WorkoutAnnouncements013VoiceFeedbackD0OSgs5NeverOTg504_s20e15Announcements21gH60AlertingPAAE12hasValidKeys2inSbSDySSypG_tFZAA0cdH0OSgSSXEfU_Tf1cn_n(v0);
  swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(valid + 16);
  if (v2)
  {
    v3 = (unsigned __int8 *)(valid + 32);
    v4 = v2 - 1;
    do
    {
      v6 = *v3++;
      v5 = v6;
      v8 = v4-- != 0;
      v9 = v5 != 17;
    }
    while (v5 != 17 && v8);
  }
  else
  {
    v9 = 1;
  }
  swift_bridgeObjectRelease();
  return v9;
}

BOOL static VoiceFeedbackAlerting.hasValidKeys(in:)()
{
  uint64_t v0;
  uint64_t valid;
  uint64_t v2;
  unsigned __int8 *v3;
  uint64_t v4;
  int v5;
  int v6;
  BOOL v8;
  _BOOL8 v9;

  v0 = swift_bridgeObjectRetain();
  valid = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSD4KeysVySSyp_G_20WorkoutAnnouncements013VoiceFeedbackD0OSgs5NeverOTg504_s20e15Announcements21gH60AlertingPAAE12hasValidKeys2inSbSDySSypG_tFZAA0cdH0OSgSSXEfU_Tf1cn_n(v0);
  swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(valid + 16);
  if (v2)
  {
    v3 = (unsigned __int8 *)(valid + 32);
    v4 = v2 - 1;
    do
    {
      v6 = *v3++;
      v5 = v6;
      v8 = v4-- != 0;
      v9 = v5 != 17;
    }
    while (v5 != 17 && v8);
  }
  else
  {
    v9 = 1;
  }
  swift_bridgeObjectRelease();
  return v9;
}

BOOL protocol witness for VoiceFeedbackAlerting.hasValidAlertType(in:) in conformance GoalCompletionModel(uint64_t a1)
{
  unsigned __int8 *v1;

  return specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1, *v1);
}

BOOL protocol witness for VoiceFeedbackAlerting.hasValidAlertType(in:) in conformance DistanceSplitModel(uint64_t a1)
{
  return specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1);
}

BOOL protocol witness for VoiceFeedbackAlerting.hasValidAlertType(in:) in conformance AboveTargetZoneModel(uint64_t a1)
{
  return specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1);
}

BOOL protocol witness for VoiceFeedbackAlerting.hasValidAlertType(in:) in conformance TimeSplitModel(uint64_t a1)
{
  unsigned __int8 *v1;

  return specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1, *v1);
}

uint64_t protocol witness for VoiceFeedbackAlerting.hasValidAlertType(in:) in conformance BasicVoiceFeedbackAlerts(uint64_t a1)
{
  unsigned __int8 *v1;

  return specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1, *v1);
}

BOOL protocol witness for VoiceFeedbackAlerting.hasValidAlertType(in:) in conformance SegmentModel(uint64_t a1)
{
  unsigned __int8 *v1;

  return specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1, *v1);
}

BOOL protocol witness for VoiceFeedbackAlerting.hasValidAlertType(in:) in conformance UpcomingIntervalModel(uint64_t a1)
{
  return specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1);
}

uint64_t specialized _NativeDictionary.startIndex.getter(uint64_t a1)
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
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 80);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v1 = *(_QWORD *)(a1 + 88);
  if (v1)
  {
    v2 = 192;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 4)
    v7 = 4;
  v8 = v7 - 4;
  v9 = (unint64_t *)(a1 + 96);
  v2 = 192;
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

uint64_t PacerGoalCompletionModel.alertType.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t PacerGoalCompletionModel.alertType.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*PacerGoalCompletionModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

void __swiftcall PacerGoalCompletionModel.init(magnitude:unit:duration:)(WorkoutAnnouncements::PacerGoalCompletionModel *__return_ptr retstr, Swift::Double magnitude, Swift::String unit, Swift::Double duration)
{
  retstr->alertType = WorkoutAnnouncements_VoiceFeedbackAlertType_pacerGoalCompletion;
  retstr->magnitude = magnitude;
  retstr->unit = unit;
  retstr->duration = duration;
}

uint64_t PacerGoalCompletionModel.CodingKeys.stringValue.getter(char a1)
{
  return *(_QWORD *)&aAlerttypmagnit_1[8 * a1];
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance PacerGoalCompletionModel.CodingKeys()
{
  char *v0;

  return PacerGoalCompletionModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance PacerGoalCompletionModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized PacerGoalCompletionModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance PacerGoalCompletionModel.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance PacerGoalCompletionModel.CodingKeys()
{
  lazy protocol witness table accessor for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance PacerGoalCompletionModel.CodingKeys()
{
  lazy protocol witness table accessor for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t PacerGoalCompletionModel.encode(to:)(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<PacerGoalCompletionModel.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v10[15] = *v3;
  v10[14] = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    v10[13] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[12] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[11] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

double PacerGoalCompletionModel.init(from:)@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  uint64_t v7;

  specialized PacerGoalCompletionModel.init(from:)(a1, (uint64_t)v6);
  if (!v2)
  {
    result = *(double *)v6;
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(_QWORD *)(a2 + 32) = v7;
  }
  return result;
}

double protocol witness for Decodable.init(from:) in conformance PacerGoalCompletionModel@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  uint64_t v7;

  specialized PacerGoalCompletionModel.init(from:)(a1, (uint64_t)v6);
  if (!v2)
  {
    result = *(double *)v6;
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(_QWORD *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance PacerGoalCompletionModel(_QWORD *a1)
{
  return PacerGoalCompletionModel.encode(to:)(a1);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance PacerGoalCompletionModel(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[2];
  uint64_t v6;
  _OWORD v7[2];
  uint64_t v8;

  v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  v6 = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  v8 = *(_QWORD *)(a2 + 32);
  return specialized static PacerGoalCompletionModel.__derived_struct_equals(_:_:)((double *)v5, (double *)v7);
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance PacerGoalCompletionModel(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v3 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 48) = *(_QWORD *)(v1 + 32);
  *(_QWORD *)(v2 + 56) = a1;
  return swift_task_switch();
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *v2 + 16;
  v5 = *v2;
  swift_task_dealloc();
  v6 = outlined release of AboveTargetZoneModel(v4);
  if (!v1)
    v6 = a1;
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(v6);
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance PacerGoalCompletionModel()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  char *v4;

  v1 = *__swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 56), *(_QWORD *)(*(_QWORD *)(v0 + 56) + 24));
  outlined retain of AboveTargetZoneModel(v0 + 16);
  v4 = (char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.pacerGoalCompletion(executeSashGroupOnWatch:_:)
     + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.pacerGoalCompletion(executeSashGroupOnWatch:_:);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v2;
  *v2 = v0;
  v2[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance PacerGoalCompletionModel;
  return ((uint64_t (*)(_QWORD, uint64_t, uint64_t))v4)(0, v1, v0 + 16);
}

uint64_t specialized PacerGoalCompletionModel.init(with:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  char v32;
  _QWORD v33[2];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;

  v4 = type metadata accessor for Logger();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(specialized Sequence.compactMap<A>(_:)(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
    v8 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v8 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v40 = v8;
  v9 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v9, 1, &v40);
  swift_bridgeObjectRelease();
  v10 = v40;
  v11 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
  swift_retain_n();
  v12 = Logger.logObject.getter();
  v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v35 = swift_slowAlloc();
    *(_QWORD *)&v40 = v35;
    *(_DWORD *)v14 = 136315394;
    v37 = a1;
    v38 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000018, 0x800000024A61C0D0, (uint64_t *)&v40);
    v36 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v14 + 12) = 2080;
    v33[1] = v14 + 14;
    lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
    v34 = v4;
    swift_retain();
    v15 = Dictionary.description.getter();
    v16 = a2;
    v18 = v17;
    swift_release();
    v38 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v18, (uint64_t *)&v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    a2 = v16;
    a1 = v37;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A5E6000, v12, v13, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v14, 0x16u);
    v19 = v35;
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v19, -1, -1);
    MEMORY[0x24BD15374](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v36 + 8))(v7, v34);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  if (*(_QWORD *)(v10 + 16)
    && (v20 = specialized __RawDictionaryStorage.find<A>(_:)(6), (v21 & 1) != 0)
    && (outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v20, (uint64_t)&v40), (swift_dynamicCast() & 1) != 0)
    && *(_QWORD *)(v10 + 16)
    && (v22 = v38, v23 = specialized __RawDictionaryStorage.find<A>(_:)(15), (v24 & 1) != 0)
    && (outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v23, (uint64_t)&v40), (swift_dynamicCast() & 1) != 0))
  {
    v26 = v38;
    v25 = v39;
    if (*(_QWORD *)(v10 + 16) && (v27 = specialized __RawDictionaryStorage.find<A>(_:)(2), (v28 & 1) != 0))
    {
      outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v27, (uint64_t)&v40);
    }
    else
    {
      v40 = 0u;
      v41 = 0u;
    }
    swift_release();
    if (!*((_QWORD *)&v41 + 1))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = outlined destroy of Any?((uint64_t)&v40, &demangling cache variable for type metadata for Any?);
      goto LABEL_18;
    }
    if ((swift_dynamicCast() & 1) != 0)
    {
      v31 = v38;
      swift_bridgeObjectRetain();
      v32 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1, 8);
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      if ((v32 & 1) != 0)
      {
        v30 = 8;
        goto LABEL_19;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_release();
  }
  result = swift_bridgeObjectRelease();
LABEL_18:
  v30 = 0;
  v22 = 0;
  v26 = 0;
  v25 = 0;
  v31 = 0;
LABEL_19:
  *a2 = v30;
  a2[1] = v22;
  a2[2] = v26;
  a2[3] = v25;
  a2[4] = v31;
  return result;
}

uint64_t specialized closure #1 in PacerGoalCompletionModel.executePattern(wrapper:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DialogDuration.Builder();
  swift_allocObject();
  DialogDuration.Builder.init()();
  dispatch thunk of DialogDuration.Builder.withSecs(_:)();
  swift_release();
  v9 = dispatch thunk of DialogDuration.Builder.build()();
  swift_release();
  swift_release();
  *a1 = v9;
  type metadata accessor for DialogLength.Builder();
  swift_allocObject();
  MEMORY[0x24BD14B88]();
  dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
  swift_release();
  String.toDialogUnit.getter(a2, a3);
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  v10 = type metadata accessor for SpeakableString();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 0, 1, v10);
  dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
  swift_release();
  outlined destroy of Any?((uint64_t)v8, &demangling cache variable for type metadata for SpeakableString?);
  v11 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
  swift_release();
  result = swift_release();
  a1[2] = v11;
  return result;
}

BOOL specialized static PacerGoalCompletionModel.__derived_struct_equals(_:_:)(double *a1, double *a2)
{
  char v5;
  _BOOL8 result;

  if (*(unsigned __int8 *)a1 != *(unsigned __int8 *)a2 || a1[1] != a2[1])
    return 0;
  if (*((_QWORD *)a1 + 2) == *((_QWORD *)a2 + 2) && *((_QWORD *)a1 + 3) == *((_QWORD *)a2 + 3))
    return a1[4] == a2[4];
  v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  result = 0;
  if ((v5 & 1) != 0)
    return a1[4] == a2[4];
  return result;
}

unint64_t lazy protocol witness table accessor for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for PacerGoalCompletionModel.CodingKeys, &unk_251BEB270);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for PacerGoalCompletionModel.CodingKeys, &unk_251BEB270);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for PacerGoalCompletionModel.CodingKeys, &unk_251BEB270);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for PacerGoalCompletionModel.CodingKeys, &unk_251BEB270);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys);
  }
  return result;
}

uint64_t specialized PacerGoalCompletionModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7079547472656C61 && a2 == 0xE900000000000065;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x647574696E67616DLL && a2 == 0xE900000000000065
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1953066613 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t specialized PacerGoalCompletionModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<PacerGoalCompletionModel.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  v23 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v9 = v24;
  v22 = 1;
  KeyedDecodingContainer.decode(_:forKey:)();
  v11 = v10;
  v21 = 2;
  v12 = KeyedDecodingContainer.decode(_:forKey:)();
  v14 = v13;
  v19 = v12;
  v20 = 3;
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode(_:forKey:)();
  v16 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  result = swift_bridgeObjectRelease();
  *(_BYTE *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_QWORD *)(a2 + 16) = v19;
  *(_QWORD *)(a2 + 24) = v14;
  *(_QWORD *)(a2 + 32) = v16;
  return result;
}

unint64_t instantiation function for generic protocol witness table for PacerGoalCompletionModel(_QWORD *a1)
{
  unint64_t result;

  a1[1] = lazy protocol witness table accessor for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel();
  a1[2] = lazy protocol witness table accessor for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel();
  result = lazy protocol witness table accessor for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel;
  if (!lazy protocol witness table cache variable for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for PacerGoalCompletionModel, &type metadata for PacerGoalCompletionModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel;
  if (!lazy protocol witness table cache variable for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for PacerGoalCompletionModel, &type metadata for PacerGoalCompletionModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel;
  if (!lazy protocol witness table cache variable for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for PacerGoalCompletionModel, &type metadata for PacerGoalCompletionModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel);
  }
  return result;
}

uint64_t initializeWithCopy for PacerGoalCompletionModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PacerGoalCompletionModel(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
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

uint64_t assignWithTake for PacerGoalCompletionModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for PacerGoalCompletionModel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PacerGoalCompletionModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PacerGoalCompletionModel()
{
  return &type metadata for PacerGoalCompletionModel;
}

uint64_t getEnumTagSinglePayload for PacerGoalCompletionModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PacerGoalCompletionModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A5FEC1C + 4 * byte_24A61C015[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24A5FEC50 + 4 * asc_24A61C010[v4]))();
}

uint64_t sub_24A5FEC50(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5FEC58(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A5FEC60);
  return result;
}

uint64_t sub_24A5FEC6C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A5FEC74);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24A5FEC78(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5FEC80(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for PacerGoalCompletionModel.CodingKeys()
{
  return &unk_251BEB270;
}

uint64_t BasicVoiceFeedbackAlerts.alertType.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*BasicVoiceFeedbackAlerts.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

char *BasicVoiceFeedbackAlerts.exerciseRingCompleted.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.exerciseRingCompleted;
}

uint64_t static BasicVoiceFeedbackAlerts.exerciseRingCompleted.getter()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted;
}

uint64_t static BasicVoiceFeedbackAlerts.exerciseRingCompleted.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.exerciseRingCompleted = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify())()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.intervalEnded.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.intervalEnded;
}

uint64_t static BasicVoiceFeedbackAlerts.intervalEnded.getter()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.intervalEnded;
}

uint64_t static BasicVoiceFeedbackAlerts.intervalEnded.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.intervalEnded = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.intervalEnded.modify())()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.moveRingCompleted.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.moveRingCompleted;
}

uint64_t static BasicVoiceFeedbackAlerts.moveRingCompleted.getter()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.moveRingCompleted;
}

uint64_t static BasicVoiceFeedbackAlerts.moveRingCompleted.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.moveRingCompleted = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.moveRingCompleted.modify())()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.raceAheadOfGhost.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.raceAheadOfGhost;
}

uint64_t static BasicVoiceFeedbackAlerts.raceAheadOfGhost.getter()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.raceAheadOfGhost;
}

uint64_t static BasicVoiceFeedbackAlerts.raceAheadOfGhost.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.raceAheadOfGhost = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.raceAheadOfGhost.modify())()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.raceBehindGhost.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.raceBehindGhost;
}

uint64_t static BasicVoiceFeedbackAlerts.raceBehindGhost.getter()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.raceBehindGhost;
}

uint64_t static BasicVoiceFeedbackAlerts.raceBehindGhost.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.raceBehindGhost = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.raceBehindGhost.modify())()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.raceExpired.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.raceExpired;
}

uint64_t static BasicVoiceFeedbackAlerts.raceExpired.getter()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.raceExpired;
}

uint64_t static BasicVoiceFeedbackAlerts.raceExpired.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.raceExpired = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.raceExpired.modify())()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.raceExpired.modify;
}

char *BasicVoiceFeedbackAlerts.raceOffRoute.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.raceOffRoute;
}

uint64_t static BasicVoiceFeedbackAlerts.raceOffRoute.getter()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.raceOffRoute;
}

uint64_t static BasicVoiceFeedbackAlerts.raceOffRoute.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.raceOffRoute = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.raceOffRoute.modify())()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.raceOnRoute.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.raceOnRoute;
}

uint64_t static BasicVoiceFeedbackAlerts.raceOnRoute.getter()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.raceOnRoute;
}

uint64_t static BasicVoiceFeedbackAlerts.raceOnRoute.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.raceOnRoute = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.raceOnRoute.modify())()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.raceRouteCompletedRaceLost.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.raceRouteCompletedRaceLost;
}

uint64_t static BasicVoiceFeedbackAlerts.raceRouteCompletedRaceLost.getter()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.raceRouteCompletedRaceLost;
}

uint64_t static BasicVoiceFeedbackAlerts.raceRouteCompletedRaceLost.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.raceRouteCompletedRaceLost = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.raceRouteCompletedRaceLost.modify())()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.raceRouteCompleteRaceWon.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.raceRouteCompleteRaceWon;
}

uint64_t static BasicVoiceFeedbackAlerts.raceRouteCompleteRaceWon.getter()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.raceRouteCompleteRaceWon;
}

uint64_t static BasicVoiceFeedbackAlerts.raceRouteCompleteRaceWon.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.raceRouteCompleteRaceWon = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.raceRouteCompleteRaceWon.modify())()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.trackStatusChanged.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.trackStatusChanged;
}

uint64_t static BasicVoiceFeedbackAlerts.trackStatusChanged.getter()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.trackStatusChanged;
}

uint64_t static BasicVoiceFeedbackAlerts.trackStatusChanged.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.trackStatusChanged = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.trackStatusChanged.modify())()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.workoutPaused.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.workoutPaused;
}

uint64_t static BasicVoiceFeedbackAlerts.workoutPaused.getter()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.workoutPaused;
}

uint64_t static BasicVoiceFeedbackAlerts.workoutPaused.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.workoutPaused = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.workoutPaused.modify())()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.workoutResumed.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.workoutResumed;
}

uint64_t static BasicVoiceFeedbackAlerts.workoutResumed.getter()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.workoutResumed;
}

uint64_t static BasicVoiceFeedbackAlerts.workoutResumed.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.workoutResumed = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.workoutResumed.modify())()
{
  swift_beginAccess();
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

BOOL static BasicVoiceFeedbackAlerts.__derived_struct_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance BasicVoiceFeedbackAlerts.CodingKeys()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance BasicVoiceFeedbackAlerts.CodingKeys()
{
  Hasher._combine(_:)(0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance BasicVoiceFeedbackAlerts.CodingKeys()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance BasicVoiceFeedbackAlerts.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized BasicVoiceFeedbackAlerts.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance BasicVoiceFeedbackAlerts.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance BasicVoiceFeedbackAlerts.CodingKeys()
{
  lazy protocol witness table accessor for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance BasicVoiceFeedbackAlerts.CodingKeys()
{
  lazy protocol witness table accessor for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t BasicVoiceFeedbackAlerts.encode(to:)(_QWORD *a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE v9[16];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<BasicVoiceFeedbackAlerts.CodingKeys>);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v9[15] = a2;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t lazy protocol witness table accessor for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys;
  if (!lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for BasicVoiceFeedbackAlerts.CodingKeys, &unk_251BEB478);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys;
  if (!lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for BasicVoiceFeedbackAlerts.CodingKeys, &unk_251BEB478);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys;
  if (!lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for BasicVoiceFeedbackAlerts.CodingKeys, &unk_251BEB478);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys;
  if (!lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for BasicVoiceFeedbackAlerts.CodingKeys, &unk_251BEB478);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys);
  }
  return result;
}

_QWORD *BasicVoiceFeedbackAlerts.init(from:)(_QWORD *a1)
{
  return specialized BasicVoiceFeedbackAlerts.init(from:)(a1);
}

_QWORD *protocol witness for Decodable.init(from:) in conformance BasicVoiceFeedbackAlerts@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = specialized BasicVoiceFeedbackAlerts.init(from:)(a1);
  if (!v2)
    *a2 = (_BYTE)result;
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance BasicVoiceFeedbackAlerts(_QWORD *a1)
{
  char *v1;

  return BasicVoiceFeedbackAlerts.encode(to:)(a1, *v1);
}

uint64_t specialized BasicVoiceFeedbackAlerts.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x7079547472656C61 && a2 == 0xE900000000000065)
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

uint64_t specialized BasicVoiceFeedbackAlerts.CodingKeys.stringValue.getter()
{
  return 0x7079547472656C61;
}

_QWORD *specialized BasicVoiceFeedbackAlerts.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _QWORD *v7;
  _BYTE v9[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<BasicVoiceFeedbackAlerts.CodingKeys>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  else
  {
    lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
    v7 = (_QWORD *)v9[15];
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  return v7;
}

unint64_t instantiation function for generic protocol witness table for BasicVoiceFeedbackAlerts(_QWORD *a1)
{
  unint64_t result;

  a1[1] = lazy protocol witness table accessor for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts();
  a1[2] = lazy protocol witness table accessor for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts();
  result = lazy protocol witness table accessor for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts;
  if (!lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for BasicVoiceFeedbackAlerts, &type metadata for BasicVoiceFeedbackAlerts);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts;
  if (!lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for BasicVoiceFeedbackAlerts, &type metadata for BasicVoiceFeedbackAlerts);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts;
  if (!lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for BasicVoiceFeedbackAlerts, &type metadata for BasicVoiceFeedbackAlerts);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for BasicVoiceFeedbackAlerts(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 24 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 24) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE7)
    return ((uint64_t (*)(void))((char *)&loc_24A5FFE00 + 4 * byte_24A61C265[v4]))();
  *a1 = a2 + 24;
  return ((uint64_t (*)(void))((char *)sub_24A5FFE34 + 4 * byte_24A61C260[v4]))();
}

uint64_t sub_24A5FFE34(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5FFE3C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A5FFE44);
  return result;
}

uint64_t sub_24A5FFE50(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A5FFE58);
  *(_BYTE *)result = a2 + 24;
  return result;
}

uint64_t sub_24A5FFE5C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A5FFE64(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BasicVoiceFeedbackAlerts()
{
  return &type metadata for BasicVoiceFeedbackAlerts;
}

uint64_t getEnumTagSinglePayload for BasicVoiceFeedbackAlerts.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BasicVoiceFeedbackAlerts.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24A5FFF14 + 4 * byte_24A61C26A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24A5FFF34 + 4 * byte_24A61C26F[v4]))();
}

_BYTE *sub_24A5FFF14(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24A5FFF34(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24A5FFF3C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24A5FFF44(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24A5FFF4C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24A5FFF54(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t getEnumTag for BasicVoiceFeedbackAlerts.CodingKeys()
{
  return 0;
}

void *type metadata accessor for BasicVoiceFeedbackAlerts.CodingKeys()
{
  return &unk_251BEB478;
}

uint64_t specialized == infix<A>(_:_:)(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aAccept_1[8 * a1] == *(_QWORD *)&aAccept_1[8 * a2]
    && *(_QWORD *)&aMutefort[8 * a1 + 8] == *(_QWORD *)&aMutefort[8 * a2 + 8])
  {
    v3 = 1;
  }
  else
  {
    v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Int specialized RawRepresentable<>.hashValue.getter()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

id WorkoutReminderControlsDirectInvocation.asStartLocalRequest(device:)(_QWORD *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  id v14;
  void *isa;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v21;

  v8 = type metadata accessor for Parse.DirectInvocation();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_allocWithZone(MEMORY[0x24BE99168]);
  v13 = (void *)MEMORY[0x24BD14CB4](0xD00000000000003ELL, 0x800000024A61E360);
  v14 = objc_msgSend(v12, sel_initWithIdentifier_, v13);

  WorkoutReminderControlsDirectInvocation.asDirectInvocation()(a2, a3, a4);
  isa = (void *)Parse.DirectInvocation.userData.getter();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (isa)
  {
    specialized _dictionaryUpCast<A, B, C, D>(_:)((uint64_t)isa);
    swift_bridgeObjectRelease();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v14, sel_setUserData_, isa);

  v16 = (void *)objc_opt_self();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v17 = (void *)DeviceState.asInvocationContext.getter();
  v18 = objc_msgSend(v16, sel_runSiriKitExecutorCommandWithContext_payload_, v17, v14);

  v19 = objc_msgSend(v16, sel_wrapCommandInStartLocalRequest_, v18);
  return v19;
}

uint64_t specialized _dictionaryUpCast<A, B, C, D>(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[3];
  _OWORD v38[2];
  __int128 v39;
  _OWORD v40[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
    v2 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_37;
      v14 = *(_QWORD *)(v28 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_37;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_37;
          v14 = *(_QWORD *)(v28 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    outlined init with copy of Any(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    outlined init with take of Any(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    outlined init with take of Any(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    outlined init with take of Any(v36, v37);
    outlined init with take of Any(v37, &v33);
    result = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(_QWORD *)(v10 + 32) = v31;
    result = (uint64_t)outlined init with take of Any(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    outlined consume of [String : Any].Iterator._Variant();
    return v2;
  }
  v14 = *(_QWORD *)(v28 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

void *WorkoutReminderControlsDirectInvocation.identifier.unsafeMutableAddressor()
{
  return &static WorkoutReminderControlsDirectInvocation.identifier;
}

unint64_t static WorkoutReminderControlsDirectInvocation.identifier.getter()
{
  return 0xD00000000000003ELL;
}

void *static WorkoutReminderControlsDirectInvocation.Action.allCases.getter()
{
  return &outlined read-only object #0 of static WorkoutReminderControlsDirectInvocation.Action.allCases.getter;
}

uint64_t WorkoutReminderControlsDirectInvocation.Action.rawValue.getter(char a1)
{
  return *(_QWORD *)&aAccept_1[8 * a1];
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance WorkoutReminderControlsDirectInvocation.Action(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance WorkoutReminderControlsDirectInvocation.Action()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance WorkoutReminderControlsDirectInvocation.Action()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance WorkoutReminderControlsDirectInvocation.Action()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance WorkoutReminderControlsDirectInvocation.Action@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized WorkoutReminderControlsDirectInvocation.Action.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance WorkoutReminderControlsDirectInvocation.Action@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = WorkoutReminderControlsDirectInvocation.Action.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void protocol witness for static CaseIterable.allCases.getter in conformance WorkoutReminderControlsDirectInvocation.Action(_QWORD *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of protocol witness for static CaseIterable.allCases.getter in conformance WorkoutReminderControlsDirectInvocation.Action;
}

uint64_t WorkoutReminderControlsDirectInvocation.init(directInvocation:)(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  char v49;
  unint64_t v50;
  char v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  Swift::String v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v2 = type metadata accessor for Parse.DirectInvocation();
  v56 = *(_QWORD *)(v2 - 8);
  v57 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Logger();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v52 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v52 - v14;
  if (Parse.DirectInvocation.identifier.getter() == 0xD00000000000003ELL && v16 == 0x800000024A61E360)
  {
    v17 = v6;
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = v6;
    v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
    {
      v35 = Logger.workout.unsafeMutableAddressor();
      swift_beginAccess();
      v36 = v17;
      (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v9, v35, v5);
      v37 = v56;
      v38 = v57;
      (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v4, a1, v57);
      v39 = Logger.logObject.getter();
      v40 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v39, v40))
      {
        v41 = swift_slowAlloc();
        v42 = swift_slowAlloc();
        v55 = v36;
        v43 = v42;
        v58._countAndFlagsBits = v42;
        *(_DWORD *)v41 = 136315394;
        v61 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000027, 0x800000024A61C490, &v58._countAndFlagsBits);
        v54 = v5;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v41 + 12) = 2080;
        v53 = a1;
        v44 = Parse.DirectInvocation.identifier.getter();
        v61 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v44, v45, &v58._countAndFlagsBits);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v46 = *(void (**)(char *, uint64_t))(v37 + 8);
        v47 = v57;
        v46(v4, v57);
        _os_log_impl(&dword_24A5E6000, v39, v40, "Unsupported identifier for %s: %s", (uint8_t *)v41, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24BD15374](v43, -1, -1);
        MEMORY[0x24BD15374](v41, -1, -1);

        v46(v53, v47);
        (*(void (**)(char *, uint64_t))(v55 + 8))(v9, v54);
      }
      else
      {

        v48 = *(void (**)(char *, uint64_t))(v37 + 8);
        v48(v4, v38);
        v48(a1, v38);
        (*(void (**)(char *, uint64_t))(v36 + 8))(v9, v5);
      }
      return 0;
    }
  }
  v19 = Parse.DirectInvocation.userData.getter();
  if (v19)
  {
    v20 = v19;
    if (*(_QWORD *)(v19 + 16))
    {
      v21 = specialized __RawDictionaryStorage.find<A>(_:)(0x6E6F69746361, 0xE600000000000000);
      if ((v22 & 1) != 0)
      {
        outlined init with copy of Any(*(_QWORD *)(v20 + 56) + 32 * v21, (uint64_t)&v59);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v23 = specialized WorkoutReminderControlsDirectInvocation.Action.init(rawValue:)(v58);
          if (v23 != 4)
          {
            v49 = v23;
            if (*(_QWORD *)(v20 + 16)
              && (v50 = specialized __RawDictionaryStorage.find<A>(_:)(0x696669746E656469, 0xEA00000000007265),
                  (v51 & 1) != 0))
            {
              outlined init with copy of Any(*(_QWORD *)(v20 + 56) + 32 * v50, (uint64_t)&v59);
            }
            else
            {
              v59 = 0u;
              v60 = 0u;
            }
            swift_bridgeObjectRelease();
            if (*((_QWORD *)&v60 + 1))
              swift_dynamicCast();
            else
              outlined destroy of Any?((uint64_t)&v59);
            __asm { BR              X10 }
          }
        }
      }
    }
    swift_bridgeObjectRelease();
    v24 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v12, v24, v5);
    v25 = Logger.logObject.getter();
    v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = swift_slowAlloc();
      v58._countAndFlagsBits = v28;
      *(_DWORD *)v27 = 136315138;
      v61 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000027, 0x800000024A61C490, &v58._countAndFlagsBits);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_24A5E6000, v25, v26, "%s: Found no action in the direct invocation data", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD15374](v28, -1, -1);
      MEMORY[0x24BD15374](v27, -1, -1);

      (*(void (**)(char *, uint64_t))(v56 + 8))(a1, v57);
      (*(void (**)(char *, uint64_t))(v17 + 8))(v12, v5);
      return 0;
    }

    (*(void (**)(char *, uint64_t))(v56 + 8))(a1, v57);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v12, v5);
  }
  else
  {
    v29 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v15, v29, v5);
    v30 = Logger.logObject.getter();
    v31 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      v33 = swift_slowAlloc();
      v58._countAndFlagsBits = v33;
      *(_DWORD *)v32 = 136315138;
      v61 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000027, 0x800000024A61C490, &v58._countAndFlagsBits);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_24A5E6000, v30, v31, "%s: No user data in the direct invocation", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD15374](v33, -1, -1);
      MEMORY[0x24BD15374](v32, -1, -1);

      (*(void (**)(char *, uint64_t))(v56 + 8))(a1, v57);
      (*(void (**)(char *, uint64_t))(v17 + 8))(v15, v5);
      return 0;
    }

    (*(void (**)(char *, uint64_t))(v56 + 8))(a1, v57);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v15, v5);
  }
  return 0;
}

void sub_24A601030()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if ((v7 & 1) == 0 && !v0)
  {
    v8 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v8, v1);
    v9 = Logger.logObject.getter();
    v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = swift_slowAlloc();
      v12 = swift_slowAlloc();
      *(_QWORD *)(v6 - 176) = v12;
      *(_QWORD *)(v6 - 144) = v12;
      *(_DWORD *)v11 = 136315394;
      *(_QWORD *)(v6 - 168) = v5;
      *(_QWORD *)(v6 - 88) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000027, 0x800000024A61C490, (uint64_t *)(v6 - 144));
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v13 = 8 * v4;
      v14 = *(_QWORD *)&aAccept_2[v13];
      *(_WORD *)(v11 + 12) = 2080;
      *(_QWORD *)(v6 - 88) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, *(_QWORD *)((char *)&unk_24A61C5F8 + v13), (uint64_t *)(v6 - 144));
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24A5E6000, v9, v10, "%s: A prediction identifier is required for %s", (uint8_t *)v11, 0x16u);
      v15 = *(_QWORD *)(v6 - 176);
      swift_arrayDestroy();
      MEMORY[0x24BD15374](v15, -1, -1);
      MEMORY[0x24BD15374](v11, -1, -1);
    }

    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v6 - 160) + 8))(v2, *(_QWORD *)(v6 - 152));
    JUMPOUT(0x24A600F2CLL);
  }
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v6 - 160) + 8))(v2, *(_QWORD *)(v6 - 152));
  swift_bridgeObjectRelease();
  JUMPOUT(0x24A600F40);
}

uint64_t WorkoutReminderControlsDirectInvocation.asDirectInvocation()(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A61C650;
  *(_QWORD *)(inited + 32) = 0x696669746E656469;
  *(_QWORD *)(inited + 40) = 0xEA00000000007265;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  *(_QWORD *)(inited + 48) = a2;
  *(_QWORD *)(inited + 56) = a3;
  *(_QWORD *)(inited + 72) = v7;
  *(_QWORD *)(inited + 80) = 0x6E6F69746361;
  *(_QWORD *)(inited + 88) = 0xE600000000000000;
  v8 = 8 * a1;
  v9 = *(_QWORD *)&aAccept_1[v8];
  v10 = *(_QWORD *)&aMutefort[v8 + 8];
  *(_QWORD *)(inited + 120) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 96) = v9;
  *(_QWORD *)(inited + 104) = v10;
  swift_bridgeObjectRetain();
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  return Parse.DirectInvocation.init(identifier:userData:)();
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
  v2 = static _DictionaryStorage.allocate(capacity:)();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    outlined init with copy of (String, Any)(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = specialized __RawDictionaryStorage.find<A>(_:)(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)outlined init with take of Any(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t specialized WorkoutReminderControlsDirectInvocation.Action.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of WorkoutReminderControlsDirectInvocation.Action.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 4)
    return 4;
  else
    return v3;
}

unint64_t lazy protocol witness table accessor for type WorkoutReminderControlsDirectInvocation.Action and conformance WorkoutReminderControlsDirectInvocation.Action()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type WorkoutReminderControlsDirectInvocation.Action and conformance WorkoutReminderControlsDirectInvocation.Action;
  if (!lazy protocol witness table cache variable for type WorkoutReminderControlsDirectInvocation.Action and conformance WorkoutReminderControlsDirectInvocation.Action)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for WorkoutReminderControlsDirectInvocation.Action, &type metadata for WorkoutReminderControlsDirectInvocation.Action);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type WorkoutReminderControlsDirectInvocation.Action and conformance WorkoutReminderControlsDirectInvocation.Action);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [WorkoutReminderControlsDirectInvocation.Action] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [WorkoutReminderControlsDirectInvocation.Action] and conformance [A];
  if (!lazy protocol witness table cache variable for type [WorkoutReminderControlsDirectInvocation.Action] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [WorkoutReminderControlsDirectInvocation.Action]);
    result = MEMORY[0x24BD152CC](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [WorkoutReminderControlsDirectInvocation.Action] and conformance [A]);
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkoutReminderControlsDirectInvocation()
{
  return &type metadata for WorkoutReminderControlsDirectInvocation;
}

uint64_t storeEnumTagSinglePayload for WorkoutReminderControlsDirectInvocation.Action(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A6015F0 + 4 * byte_24A61C4A9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24A601624 + 4 * byte_24A61C4A4[v4]))();
}

uint64_t sub_24A601624(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A60162C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A601634);
  return result;
}

uint64_t sub_24A601640(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A601648);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24A60164C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A601654(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WorkoutReminderControlsDirectInvocation.Action()
{
  return &type metadata for WorkoutReminderControlsDirectInvocation.Action;
}

uint64_t outlined init with copy of (String, Any)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *static VoiceFeedbackStepType.allCases.getter()
{
  return &outlined read-only object #0 of static VoiceFeedbackStepType.allCases.getter;
}

uint64_t VoiceFeedbackStepType.rawValue.getter(uint64_t result)
{
  return result;
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance VoiceFeedbackStepType@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized VoiceFeedbackStepType.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance VoiceFeedbackStepType()
{
  lazy protocol witness table accessor for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType();
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance VoiceFeedbackStepType()
{
  lazy protocol witness table accessor for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType();
  return RawRepresentable<>.encode(to:)();
}

void protocol witness for static CaseIterable.allCases.getter in conformance VoiceFeedbackStepType(_QWORD *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of protocol witness for static CaseIterable.allCases.getter in conformance VoiceFeedbackStepType;
}

unint64_t specialized VoiceFeedbackStepType.init(rawValue:)(unint64_t result)
{
  if (result >= 4)
    return 4;
  return result;
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackStepType, &type metadata for VoiceFeedbackStepType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackStepType, &type metadata for VoiceFeedbackStepType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackStepType, &type metadata for VoiceFeedbackStepType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [VoiceFeedbackStepType] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [VoiceFeedbackStepType] and conformance [A];
  if (!lazy protocol witness table cache variable for type [VoiceFeedbackStepType] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [VoiceFeedbackStepType]);
    result = MEMORY[0x24BD152CC](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [VoiceFeedbackStepType] and conformance [A]);
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for VoiceFeedbackStepType(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t storeEnumTagSinglePayload for VoiceFeedbackStepType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A601914 + 4 * byte_24A61C665[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24A601948 + 4 * byte_24A61C660[v4]))();
}

uint64_t sub_24A601948(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A601950(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A601958);
  return result;
}

uint64_t sub_24A601964(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A60196CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24A601970(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A601978(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for VoiceFeedbackStepType()
{
  return &type metadata for VoiceFeedbackStepType;
}

uint64_t WorkoutReminderPromptStrategy.parseValueResponse(input:)(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *v1;
  v2[13] = a1;
  v2[14] = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
  v2[15] = swift_task_alloc();
  v4 = type metadata accessor for Siri_Nlu_External_UserParse();
  v2[16] = v4;
  v2[17] = *(_QWORD *)(v4 - 8);
  v2[18] = swift_task_alloc();
  v5 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  v2[19] = v5;
  v2[20] = *(_QWORD *)(v5 - 8);
  v2[21] = swift_task_alloc();
  v6 = type metadata accessor for Parse();
  v2[22] = v6;
  v2[23] = *(_QWORD *)(v6 - 8);
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  v7 = type metadata accessor for USOParse();
  v2[26] = v7;
  v2[27] = *(_QWORD *)(v7 - 8);
  v2[28] = swift_task_alloc();
  v8 = type metadata accessor for Input();
  v2[29] = v8;
  v2[30] = *(_QWORD *)(v8 - 8);
  v2[31] = swift_task_alloc();
  v9 = type metadata accessor for Logger();
  v2[32] = v9;
  v2[33] = *(_QWORD *)(v9 - 8);
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t WorkoutReminderPromptStrategy.parseValueResponse(input:)()
{
  uint64_t *v0;
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
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
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  void (*v49)(uint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  void (*v75)(uint64_t, uint64_t, uint64_t);
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  void (*v79)(uint64_t, uint64_t);
  uint64_t v80;

  v1 = v0;
  v2 = v0 + 13;
  v77 = v0[13];
  v3 = v0[36];
  v5 = v0[32];
  v4 = v0[33];
  v7 = v2[17];
  v6 = v2[18];
  v8 = v2[16];
  v9 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  v74 = v9;
  v75 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v75(v3, v9, v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v77, v8);
  v10 = Logger.logObject.getter();
  v11 = static os_log_type_t.debug.getter();
  v73 = v2;
  if (os_log_type_enabled(v10, v11))
  {
    v78 = v1[36];
    v12 = v1[31];
    v71 = v1[33];
    v72 = v1[32];
    v13 = v1[29];
    v69 = v1[30];
    v14 = swift_slowAlloc();
    v70 = swift_slowAlloc();
    v80 = v70;
    *(_DWORD *)v14 = 136315394;
    v15 = _typeName(_:qualified:)();
    v1[11] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v80);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    lazy protocol witness table accessor for type Input and conformance Input();
    v17 = dispatch thunk of CustomStringConvertible.description.getter();
    v1[12] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v18, &v80);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v12, v13);
    _os_log_impl(&dword_24A5E6000, v10, v11, "%s Parsing Input: %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v70, -1, -1);
    MEMORY[0x24BD15374](v14, -1, -1);

    v19 = v72;
    v20 = *(void (**)(uint64_t, uint64_t))(v71 + 8);
    v21 = v78;
  }
  else
  {
    v22 = v1[36];
    v23 = v1[32];
    v24 = v1[33];
    (*(void (**)(uint64_t, uint64_t))(v1[30] + 8))(v1[31], v1[29]);

    v20 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    v21 = v22;
    v19 = v23;
  }
  v79 = v20;
  v20(v21, v19);
  v25 = v1[25];
  v26 = v1[22];
  v27 = v1[23];
  Input.parse.getter();
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v27 + 88))(v25, v26) == *MEMORY[0x24BE98E98])
  {
    v29 = v1 + 28;
    v28 = v1[28];
    v30 = v1[27];
    v31 = v1[26];
    v32 = v1[25];
    v34 = v1[17];
    v33 = v1[18];
    v35 = v1[16];
    (*(void (**)(uint64_t, uint64_t))(v1[23] + 96))(v32, v1[22]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 32))(v28, v32, v31);
    v36 = USOParse.userParse.getter();
    v37 = MEMORY[0x24BD14A38](v36);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v35);
    if (*(_QWORD *)(v37 + 16))
    {
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v1[20] + 16))(v1[15], v37 + ((*(unsigned __int8 *)(v1[20] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1[20] + 80)), v1[19]);
      v38 = 0;
    }
    else
    {
      v38 = 1;
    }
    v39 = v1[19];
    v40 = v1[20];
    v41 = v1[15];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v40 + 56))(v41, v38, 1, v39);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48))(v41, 1, v39) == 1)
    {
      v42 = v1[15];
      (*(void (**)(uint64_t, uint64_t))(v1[27] + 8))(v1[28], v1[26]);
      outlined destroy of Any?(v42, &demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
      goto LABEL_11;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v1[20] + 32))(v1[21], v1[15], v1[19]);
    if ((Siri_Nlu_External_UserDialogAct.hasAccepted.getter() & 1) != 0)
      goto LABEL_15;
    if ((Siri_Nlu_External_UserDialogAct.hasRejected.getter() & 1) != 0)
    {
      v51 = v1[27];
      (*(void (**)(uint64_t, uint64_t))(v1[20] + 8))(v1[21], v1[19]);
      v49 = *(void (**)(uint64_t, uint64_t))(v51 + 8);
      v52 = 1;
    }
    else
    {
      v54 = v1[23];
      v53 = v1[24];
      v55 = v1[22];
      Input.parse.getter();
      v56 = isProbablyWorkout(from:requireWorkoutIdentifier:)();
      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v53, v55);
      if ((v56 & 1) != 0)
      {
LABEL_15:
        v50 = v1[27];
        (*(void (**)(uint64_t, uint64_t))(v1[20] + 8))(v1[21], v1[19]);
        v76 = 0;
        v49 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
LABEL_23:
        v43 = v1 + 26;
        goto LABEL_24;
      }
      v57 = v1[35];
      v58 = v1[32];
      swift_beginAccess();
      v75(v57, v74, v58);
      v59 = Logger.logObject.getter();
      v60 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v59, v60))
      {
        v61 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v61 = 0;
        _os_log_impl(&dword_24A5E6000, v59, v60, "Parse did not contain accept, reject, or workout task", v61, 2u);
        MEMORY[0x24BD15374](v61, -1, -1);
      }
      v62 = v1[35];
      v63 = v1[32];
      v64 = v1[27];
      v66 = v1[20];
      v65 = v1[21];
      v67 = v1[19];

      v79(v62, v63);
      (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v65, v67);
      v49 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
      v52 = 4;
    }
    v76 = v52;
    goto LABEL_23;
  }
  (*(void (**)(uint64_t, uint64_t))(v1[23] + 8))(v1[25], v1[22]);
LABEL_11:
  v43 = v73 + 19;
  v29 = v1 + 34;
  v44 = v1[34];
  v45 = v1[32];
  swift_beginAccess();
  v75(v44, v74, v45);
  v46 = Logger.logObject.getter();
  v47 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v48 = 0;
    _os_log_impl(&dword_24A5E6000, v46, v47, "Received unsupported type of input", v48, 2u);
    MEMORY[0x24BD15374](v48, -1, -1);
  }

  v76 = 4;
  v49 = v79;
LABEL_24:
  v49(*v29, *v43);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(_QWORD))v1[1])(v76);
}

uint64_t WorkoutReminderPromptStrategy.actionForInput(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char v41;
  void (*v42)(char *, uint64_t);
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char v53;
  void (*v54)(char *, uint64_t);
  char v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;

  v66 = *v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
  MEMORY[0x24BDAC7A8](v5);
  v58 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Siri_Nlu_External_UserParse();
  v61 = *(_QWORD *)(v7 - 8);
  v62 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v60 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  v75 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v74 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v59 = (char *)&v56 - v12;
  v63 = type metadata accessor for USOParse();
  v65 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v64 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for Parse();
  v71 = *(_QWORD *)(v14 - 8);
  v72 = v14;
  v15 = MEMORY[0x24BDAC7A8](v14);
  v67 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v70 = (char *)&v56 - v17;
  v18 = type metadata accessor for Input();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for Logger();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v56 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  v68 = v23;
  v69 = v22;
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v25, v26, v22);
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  v73 = a1;
  v27(v21, a1, v18);
  v28 = Logger.logObject.getter();
  v29 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = swift_slowAlloc();
    v56 = swift_slowAlloc();
    v77 = v56;
    *(_DWORD *)v30 = 136315394;
    v31 = _typeName(_:qualified:)();
    v66 = a2;
    v76 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v32, &v77);
    v57 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2080;
    lazy protocol witness table accessor for type Input and conformance Input();
    v33 = dispatch thunk of CustomStringConvertible.description.getter();
    v76 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v33, v34, &v77);
    v9 = v57;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
    _os_log_impl(&dword_24A5E6000, v28, v29, "%s Handling Input: %s", (uint8_t *)v30, 0x16u);
    v35 = v56;
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v35, -1, -1);
    MEMORY[0x24BD15374](v30, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  }

  (*(void (**)(char *, uint64_t))(v68 + 8))(v25, v69);
  v37 = v74;
  v36 = v75;
  v38 = v72;
  v40 = v70;
  v39 = v71;
  Input.parse.getter();
  v41 = isProbablyWorkout(from:requireWorkoutIdentifier:)();
  v42 = *(void (**)(char *, uint64_t))(v39 + 8);
  v42(v40, v38);
  if ((v41 & 1) != 0)
    return static ActionForInput.handle()();
  v44 = v67;
  Input.parse.getter();
  if ((*(unsigned int (**)(char *, uint64_t))(v39 + 88))(v44, v38) == *MEMORY[0x24BE98E98])
  {
    (*(void (**)(char *, uint64_t))(v39 + 96))(v44, v38);
    v45 = v63;
    (*(void (**)(char *, char *, uint64_t))(v65 + 32))(v64, v44, v63);
    v46 = v60;
    v47 = USOParse.userParse.getter();
    v48 = MEMORY[0x24BD14A38](v47);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v46, v62);
    if (*(_QWORD *)(v48 + 16))
    {
      v49 = (uint64_t)v58;
      (*(void (**)(char *, unint64_t, uint64_t))(v36 + 16))(v58, v48 + ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80)), v9);
      v50 = 0;
    }
    else
    {
      v50 = 1;
      v49 = (uint64_t)v58;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 56))(v49, v50, 1, v9);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v36 + 48))(v49, 1, v9) != 1)
    {
      v51 = v49;
      v52 = v59;
      (*(void (**)(char *, uint64_t, uint64_t))(v36 + 32))(v59, v51, v9);
      v53 = Siri_Nlu_External_UserDialogAct.hasAccepted.getter();
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v37, v52, v9);
      if ((v53 & 1) != 0)
      {
        v54 = *(void (**)(char *, uint64_t))(v36 + 8);
        v54(v37, v9);
      }
      else
      {
        v55 = Siri_Nlu_External_UserDialogAct.hasRejected.getter();
        v54 = *(void (**)(char *, uint64_t))(v36 + 8);
        v54(v37, v9);
        if ((v55 & 1) == 0)
        {
          v54(v59, v9);
          (*(void (**)(char *, uint64_t))(v65 + 8))(v64, v45);
          return static ActionForInput.ignore()();
        }
      }
      static ActionForInput.handle()();
      v54(v59, v9);
      return (*(uint64_t (**)(char *, uint64_t))(v65 + 8))(v64, v45);
    }
    (*(void (**)(char *, uint64_t))(v65 + 8))(v64, v45);
    outlined destroy of Any?(v49, &demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
  }
  else
  {
    v42(v44, v38);
  }
  return static ActionForInput.ignore()();
}

uint64_t WorkoutReminderPromptStrategy.makePromptForValue()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;

  v2[7] = a1;
  v2[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NLContextUpdate?);
  v2[9] = swift_task_alloc();
  type metadata accessor for DialogPhase();
  v2[10] = swift_task_alloc();
  v3 = type metadata accessor for OutputGenerationManifest();
  v2[11] = v3;
  v2[12] = *(_QWORD *)(v3 - 8);
  v2[13] = swift_task_alloc();
  v4 = (_QWORD *)swift_task_alloc();
  v2[14] = v4;
  *v4 = v2;
  v4[1] = WorkoutReminderPromptStrategy.makePromptForValue();
  v4[2] = v1;
  return swift_task_switch();
}

{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t WorkoutReminderPromptStrategy.makePromptForValue()()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  _QWORD *v3;

  if (*(_QWORD *)(v0 + 120))
  {
    v1 = *(_QWORD *)(v0 + 72);
    static DialogPhase.confirmation.getter();
    OutputGenerationManifest.init(dialogPhase:_:)();
    WorkoutReminderPromptStrategy.confirmationSDA()(v1);
    OutputGenerationManifest.nlContextUpdate.setter();
    OutputGenerationManifest.canUseServerTTS.setter();
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81968]), sel_init);
    *(_QWORD *)(v0 + 128) = v2;
    objc_msgSend(v2, sel_setNotificationType_, *MEMORY[0x24BE823B8]);
    static AceService.currentAsync.getter();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v3;
    type metadata accessor for SABaseCommand();
    *v3 = v0;
    v3[1] = WorkoutReminderPromptStrategy.makePromptForValue();
    return AceServiceInvokerAsync.submit<A>(_:)();
  }
  else
  {
    lazy protocol witness table accessor for type WorkoutReminderErrors and conformance WorkoutReminderErrors();
    swift_allocError();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0 + 64);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 104), *(_QWORD *)(v1 + 128));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v2;
  *v2 = v0;
  v2[1] = WorkoutReminderPromptStrategy.makePromptForValue();
  return dispatch thunk of ResponseGenerating.makeResponseOutput(patternExecutionResult:outputGenerationManifest:)();
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 88);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 88);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 88);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t WorkoutReminderPromptStrategy.makePromptForValue()(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 144) = v1;
  swift_task_dealloc();
  if (!v1)

  return swift_task_switch();
}

uint64_t WorkoutReminderPromptStrategy.announcementDialog()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

{
  uint64_t v0;
  id v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v4)(uint64_t);
  uint64_t (*v6)(char, uint64_t, uint64_t);

  v1 = objc_msgSend(*(id *)(*(_QWORD *)(v0 + 16) + 16), sel_predictionType);
  if (v1 == (id)3)
  {
    v2 = *__swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 16) + 64), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 88));
    v6 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutRemindersCATPatternsExecutor.resume(executeSashGroupOnWatch:_:)
                                                        + async function pointer to specialized WorkoutRemindersCATPatternsExecutor.resume(executeSashGroupOnWatch:_:));
    swift_retain();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 40) = v3;
    v4 = WorkoutReminderPromptStrategy.announcementDialog();
    goto LABEL_7;
  }
  if (v1 == (id)2)
  {
    v2 = *__swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 16) + 64), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 88));
    v6 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutRemindersCATPatternsExecutor.end(executeSashGroupOnWatch:_:)
                                                        + async function pointer to specialized WorkoutRemindersCATPatternsExecutor.end(executeSashGroupOnWatch:_:));
    swift_retain();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 32) = v3;
    v4 = WorkoutReminderPromptStrategy.announcementDialog();
    goto LABEL_7;
  }
  if (v1 == (id)1)
  {
    v2 = *__swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 16) + 64), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 88));
    v6 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutRemindersCATPatternsExecutor.start(executeSashGroupOnWatch:_:)
                                                        + async function pointer to specialized WorkoutRemindersCATPatternsExecutor.start(executeSashGroupOnWatch:_:));
    swift_retain();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 24) = v3;
    v4 = WorkoutReminderPromptStrategy.announcementDialog();
LABEL_7:
    *v3 = v0;
    v3[1] = v4;
    return v6(0, v2, *(_QWORD *)(v0 + 16));
  }
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t WorkoutReminderPromptStrategy.announcementDialog()(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    MEMORY[0x24BD15248](v1);
    a1 = 0;
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    MEMORY[0x24BD15248](v1);
    a1 = 0;
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    MEMORY[0x24BD15248](v1);
    a1 = 0;
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t WorkoutReminderPromptStrategy.confirmationSDA()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t common;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_SystemDialogAct?);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Siri_Nlu_External_SystemDialogAct();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Logger();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend(*(id *)(v1 + 16), sel_predictionType);
  if (v14 == (id)3)
  {
    type metadata accessor for UsoTaskBuilder_resume_common_Workout();
    swift_allocObject();
    common = UsoTaskBuilder_resume_common_Workout.init()();
  }
  else if (v14 == (id)2)
  {
    type metadata accessor for UsoTaskBuilder_stop_common_Workout();
    swift_allocObject();
    common = UsoTaskBuilder_stop_common_Workout.init()();
  }
  else
  {
    if (v14 != (id)1)
    {
      v20 = Logger.workout.unsafeMutableAddressor();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v20, v10);
      v21 = Logger.logObject.getter();
      v22 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_24A5E6000, v21, v22, "Unknown prediction type - unable to build SystemDialogAct", v23, 2u);
        MEMORY[0x24BD15374](v23, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      goto LABEL_13;
    }
    type metadata accessor for UsoTaskBuilder_create_common_Workout();
    swift_allocObject();
    common = UsoTaskBuilder_create_common_Workout.init()();
  }
  WorkoutReminderPromptStrategy.makeConfirmationAct(for:)(common, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
    NLContextUpdate.init()();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Siri_Nlu_External_SystemDialogAct>);
    v16 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_24A61B890;
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 16))(v17 + v16, v9, v6);
    NLContextUpdate.nluSystemDialogActs.setter();
    swift_release();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v18 = type metadata accessor for NLContextUpdate();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(a1, 0, 1, v18);
  }
  swift_release();
  outlined destroy of Any?((uint64_t)v5, &demangling cache variable for type metadata for Siri_Nlu_External_SystemDialogAct?);
LABEL_13:
  v24 = type metadata accessor for NLContextUpdate();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(a1, 1, 1, v24);
}

uint64_t WorkoutReminderPromptStrategy.makeConfirmationAct(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v12;
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
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint8_t *v39;
  void (*v40)(char *, char *, uint64_t);
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v68 = a2;
  v64 = type metadata accessor for Logger();
  v67 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v66 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Siri_Nlu_External_SystemOffered();
  v62 = *(_QWORD *)(v4 - 8);
  v63 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v61 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v60 = (char *)&v53 - v7;
  v8 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  v58 = *(_QWORD *)(v8 - 8);
  v59 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v57 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v53 - v11;
  v13 = type metadata accessor for Siri_Nlu_External_UserWantedToProceed();
  v65 = *(_QWORD *)(v13 - 8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v56 = (char *)&v53 - v17;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v53 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v53 - v26;
  v28 = a1;
  UsoTaskBuilder.toProtobufUsoGraph()();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1)
  {
    outlined destroy of Any?((uint64_t)v20, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    v29 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    v30 = v64;
    (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v66, v29, v64);
    swift_retain_n();
    v31 = Logger.logObject.getter();
    v32 = static os_log_type_t.error.getter();
    v33 = os_log_type_enabled(v31, v32);
    v34 = v68;
    if (v33)
    {
      v35 = (uint8_t *)swift_slowAlloc();
      v36 = swift_slowAlloc();
      v69 = v28;
      v70 = v36;
      *(_DWORD *)v35 = 136315138;
      type metadata accessor for UsoTaskBuilder();
      swift_retain();
      v37 = String.init<A>(describing:)();
      v69 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v37, v38, &v70);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24A5E6000, v31, v32, "Failed to create protobuf UsoGraph from Task builder %s", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD15374](v36, -1, -1);
      v39 = v35;
      v34 = v68;
      MEMORY[0x24BD15374](v39, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v67 + 8))(v66, v30);
    v52 = type metadata accessor for Siri_Nlu_External_SystemDialogAct();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 56))(v34, 1, 1, v52);
  }
  else
  {
    v40 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
    v41 = v27;
    v55 = v27;
    v40(v27, v20, v21);
    v42 = v56;
    Siri_Nlu_External_UserWantedToProceed.init()();
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v25, v41, v21);
    Siri_Nlu_External_UserWantedToProceed.reference.setter();
    Siri_Nlu_External_UserDialogAct.init()();
    (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v16, v42, v13);
    Siri_Nlu_External_UserDialogAct.wantedToProceed.setter();
    v43 = v60;
    Siri_Nlu_External_SystemOffered.init()();
    v67 = v13;
    v44 = v12;
    v54 = v12;
    v45 = v58;
    v46 = v59;
    (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v57, v44, v59);
    Siri_Nlu_External_SystemOffered.offeredAct.setter();
    v47 = v68;
    Siri_Nlu_External_SystemDialogAct.init()();
    v48 = v62;
    v49 = v63;
    (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v61, v43, v63);
    Siri_Nlu_External_SystemDialogAct.offered.setter();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v43, v49);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v54, v46);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v42, v67);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v55, v21);
    v50 = type metadata accessor for Siri_Nlu_External_SystemDialogAct();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v47, 0, 1, v50);
  }
}

uint64_t WorkoutReminderPromptStrategy.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 64);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 104);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WorkoutReminderPromptStrategy()
{
  return objc_opt_self();
}

uint64_t protocol witness for PromptForValueFlowStrategyAsync.parseValueResponse(input:) in conformance WorkoutReminderPromptStrategy(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v4;
  *v4 = v2;
  v4[1] = protocol witness for PromptForValueFlowStrategyAsync.parseValueResponse(input:) in conformance WorkoutReminderPromptStrategy;
  return WorkoutReminderPromptStrategy.parseValueResponse(input:)(a2);
}

uint64_t protocol witness for PromptForValueFlowStrategyAsync.parseValueResponse(input:) in conformance WorkoutReminderPromptStrategy(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (!v1)
    **(_BYTE **)(v4 + 16) = a1;
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t protocol witness for PromptForValueFlowStrategyAsync.makePromptForValue() in conformance WorkoutReminderPromptStrategy(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = protocol witness for PromptForValueFlowStrategyAsync.makeRepromptOnEmptyParse() in conformance WorkoutReminderPromptStrategy;
  return WorkoutReminderPromptStrategy.makePromptForValue()(a1);
}

uint64_t protocol witness for PromptForValueFlowStrategyAsync.makeRepromptOnEmptyParse() in conformance WorkoutReminderPromptStrategy()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = protocol witness for PromptForValueFlowStrategyAsync.makeRepromptOnEmptyParse() in conformance WorkoutReminderPromptStrategy;
  return PromptForValueFlowStrategyAsync.makeRepromptOnEmptyParse()();
}

uint64_t protocol witness for PromptForValueFlowStrategyAsync.makeRepromptOnLowConfidence() in conformance WorkoutReminderPromptStrategy()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = protocol witness for PromptForValueFlowStrategyAsync.makeRepromptOnEmptyParse() in conformance WorkoutReminderPromptStrategy;
  return PromptForValueFlowStrategyAsync.makeRepromptOnLowConfidence()();
}

uint64_t protocol witness for PromptForValueFlowStrategyAsync.makeFlowCancelledResponse() in conformance WorkoutReminderPromptStrategy()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = protocol witness for Flow.execute() in conformance VoiceFeedbackAnnouncementFlow;
  return PromptForValueFlowStrategyAsync.makeFlowCancelledResponse()();
}

uint64_t protocol witness for PromptForValueFlowStrategyAsync.makeErrorResponse(_:) in conformance WorkoutReminderPromptStrategy()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = protocol witness for PromptForValueFlowStrategyAsync.makeRepromptOnEmptyParse() in conformance WorkoutReminderPromptStrategy;
  return PromptForValueFlowStrategyAsync.makeErrorResponse(_:)();
}

unint64_t lazy protocol witness table accessor for type WorkoutReminderErrors and conformance WorkoutReminderErrors()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type WorkoutReminderErrors and conformance WorkoutReminderErrors;
  if (!lazy protocol witness table cache variable for type WorkoutReminderErrors and conformance WorkoutReminderErrors)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for WorkoutReminderErrors, &type metadata for WorkoutReminderErrors);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type WorkoutReminderErrors and conformance WorkoutReminderErrors);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type WorkoutReminderErrors and conformance WorkoutReminderErrors;
  if (!lazy protocol witness table cache variable for type WorkoutReminderErrors and conformance WorkoutReminderErrors)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for WorkoutReminderErrors, &type metadata for WorkoutReminderErrors);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type WorkoutReminderErrors and conformance WorkoutReminderErrors);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Input and conformance Input()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type Input and conformance Input;
  if (!lazy protocol witness table cache variable for type Input and conformance Input)
  {
    v1 = type metadata accessor for Input();
    result = MEMORY[0x24BD152CC](MEMORY[0x24BE98DE0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Input and conformance Input);
  }
  return result;
}

uint64_t BelowTargetZoneModel.alertType.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t BelowTargetZoneModel.alertType.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*BelowTargetZoneModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

void __swiftcall BelowTargetZoneModel.init(magnitude:unit:targetZone:)(WorkoutAnnouncements::BelowTargetZoneModel *__return_ptr retstr, Swift::Double magnitude, Swift::String unit, WorkoutAnnouncements::VoiceFeedbackTargetZone *targetZone)
{
  void *object;
  uint64_t countAndFlagsBits;
  Swift::Bool isSingleThreshold;
  WorkoutAnnouncements::VoiceFeedbackPaceFormat value;
  WorkoutAnnouncements::VoiceFeedbackMetricType metricType;

  object = unit._object;
  countAndFlagsBits = unit._countAndFlagsBits;
  outlined release of AboveTargetZoneModel((uint64_t)targetZone);
  isSingleThreshold = targetZone->isSingleThreshold;
  value = targetZone->paceFormat.value;
  metricType = targetZone->metricType;
  retstr->alertType = WorkoutAnnouncements_VoiceFeedbackAlertType_zoneExitedBelow;
  retstr->magnitude = magnitude;
  retstr->unit._countAndFlagsBits = countAndFlagsBits;
  retstr->unit._object = object;
  retstr->isSingleThreshold = isSingleThreshold;
  retstr->paceFormat.value = value;
  retstr->metricType = metricType;
}

uint64_t BelowTargetZoneModel.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24A603D54 + 4 * byte_24A61C8C0[a1]))(0xD000000000000011, 0x800000024A61DDC0);
}

uint64_t sub_24A603D54()
{
  return 0x7079547472656C61;
}

uint64_t sub_24A603D84()
{
  return 1953066613;
}

uint64_t sub_24A603D94()
{
  return 0x6D726F4665636170;
}

uint64_t sub_24A603DB4()
{
  return 0x795463697274656DLL;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance BelowTargetZoneModel.CodingKeys()
{
  unsigned __int8 *v0;

  return BelowTargetZoneModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance BelowTargetZoneModel.CodingKeys()
{
  lazy protocol witness table accessor for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance BelowTargetZoneModel.CodingKeys()
{
  lazy protocol witness table accessor for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t BelowTargetZoneModel.encode(to:)(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[9];
  _BYTE v11[6];
  char v12;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<BelowTargetZoneModel.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v11[5] = *v3;
  v11[4] = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    v11[3] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[2] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[1] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    outlined init with take of VoiceFeedbackPaceFormat?((uint64_t)(v3 + 33), (uint64_t)&v12);
    outlined init with take of VoiceFeedbackPaceFormat?((uint64_t)&v12, (uint64_t)v11);
    v10[8] = 4;
    lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    v10[7] = v3[34];
    v10[6] = 5;
    lazy protocol witness table accessor for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

double BelowTargetZoneModel.init(from:)@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  _BYTE v7[19];

  specialized BelowTargetZoneModel.init(from:)(a1, (uint64_t)&v6);
  if (!v2)
  {
    result = *(double *)&v6;
    v5 = *(_OWORD *)v7;
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v5;
    *(_DWORD *)(a2 + 31) = *(_DWORD *)&v7[15];
  }
  return result;
}

double protocol witness for Decodable.init(from:) in conformance BelowTargetZoneModel@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  _BYTE v7[19];

  specialized BelowTargetZoneModel.init(from:)(a1, (uint64_t)&v6);
  if (!v2)
  {
    result = *(double *)&v6;
    v5 = *(_OWORD *)v7;
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v5;
    *(_DWORD *)(a2 + 31) = *(_DWORD *)&v7[15];
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance BelowTargetZoneModel(_QWORD *a1)
{
  return BelowTargetZoneModel.encode(to:)(a1);
}

uint64_t BelowTargetZoneModel.executePattern(wrapper:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[6] = a1;
  v2[7] = v1;
  v3 = type metadata accessor for Logger();
  v2[8] = v3;
  v2[9] = *(_QWORD *)(v3 - 8);
  v2[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t BelowTargetZoneModel.executePattern(wrapper:)()
{
  uint64_t v0;
  unsigned __int8 v1;
  BOOL v2;
  uint64_t v3;
  uint64_t *v4;
  char v5;
  uint64_t v6;
  _QWORD *v7;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  char v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t (*v31)(uint64_t);
  _BYTE *v32;
  uint64_t v33;
  uint64_t (*v34)(char, char, uint64_t, uint64_t);
  uint64_t (*v35)(char, char, uint64_t, uint64_t);
  uint64_t v36;

  if (one-time initialization token for noPaceFormatMetrics != -1)
    swift_once();
  v1 = *(_BYTE *)(*(_QWORD *)(v0 + 56) + 34);
  v2 = specialized Sequence<>.contains(_:)(v1, (uint64_t)noPaceFormatMetrics._rawValue);
  v3 = *(_QWORD *)(v0 + 56);
  if (v2)
  {
    v4 = __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 48), *(_QWORD *)(*(_QWORD *)(v0 + 48) + 24));
    v5 = *(_BYTE *)(v3 + 32);
    v6 = *v4;
    outlined retain of AboveTargetZoneModel(v3);
    v34 = (uint64_t (*)(char, char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowNonPace(executeSashGroupOnWatch:isSingleThreshold:_:)
                                                               + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowNonPace(executeSashGroupOnWatch:isSingleThreshold:_:));
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v7;
    *v7 = v0;
    v7[1] = AboveTargetZoneModel.executePattern(wrapper:);
    return v34(0, v5, v6, *(_QWORD *)(v0 + 56));
  }
  else
  {
    outlined init with take of VoiceFeedbackPaceFormat?(v3 + 33, v0 + 113);
    outlined init with take of VoiceFeedbackPaceFormat?(v0 + 113, v0 + 112);
    v9 = *(unsigned __int8 *)(v0 + 112);
    if (v9 == 2)
    {
      v11 = *(_QWORD *)(v0 + 72);
      v10 = *(_QWORD *)(v0 + 80);
      v13 = *(_QWORD *)(v0 + 56);
      v12 = *(_QWORD *)(v0 + 64);
      v14 = Logger.workout.unsafeMutableAddressor();
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v10, v14, v12);
      outlined retain of AboveTargetZoneModel(v13);
      outlined retain of AboveTargetZoneModel(v13);
      v15 = Logger.logObject.getter();
      v16 = static os_log_type_t.error.getter();
      v17 = os_log_type_enabled(v15, v16);
      v19 = *(_QWORD *)(v0 + 72);
      v18 = *(_QWORD *)(v0 + 80);
      v21 = *(_QWORD *)(v0 + 56);
      v20 = *(_QWORD *)(v0 + 64);
      if (v17)
      {
        v33 = *(_QWORD *)(v0 + 64);
        v22 = (uint8_t *)swift_slowAlloc();
        v23 = swift_slowAlloc();
        v36 = v23;
        *(_DWORD *)v22 = 136315138;
        *(_BYTE *)(v0 + 114) = v1;
        v24 = String.init<A>(describing:)();
        *(_QWORD *)(v0 + 40) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v36);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        outlined release of AboveTargetZoneModel(v21);
        outlined release of AboveTargetZoneModel(v21);
        _os_log_impl(&dword_24A5E6000, v15, v16, "BelowTargetZoneModel needs a pace format for: %s", v22, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24BD15374](v23, -1, -1);
        MEMORY[0x24BD15374](v22, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v33);
      }
      else
      {
        outlined release of AboveTargetZoneModel(*(_QWORD *)(v0 + 56));
        outlined release of AboveTargetZoneModel(v21);

        (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
      }
      lazy protocol witness table accessor for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors();
      swift_allocError();
      *v32 = 1;
      swift_willThrow();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    else
    {
      v26 = *(_QWORD *)(v0 + 56);
      v27 = __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 48), *(_QWORD *)(*(_QWORD *)(v0 + 48) + 24));
      v28 = *(_BYTE *)(v26 + 32);
      v29 = *v27;
      outlined retain of AboveTargetZoneModel(v26);
      if ((v9 & 1) != 0)
      {
        v35 = (uint64_t (*)(char, char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowPace(executeSashGroupOnWatch:isSingleThreshold:_:)
                                                                   + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowPace(executeSashGroupOnWatch:isSingleThreshold:_:));
        v30 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 104) = v30;
        v31 = AboveTargetZoneModel.executePattern(wrapper:);
      }
      else
      {
        v35 = (uint64_t (*)(char, char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowSpeed(executeSashGroupOnWatch:isSingleThreshold:_:)
                                                                   + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowSpeed(executeSashGroupOnWatch:isSingleThreshold:_:));
        v30 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 96) = v30;
        v31 = AboveTargetZoneModel.executePattern(wrapper:);
      }
      *v30 = v0;
      v30[1] = v31;
      return v35(0, v28, v29, *(_QWORD *)(v0 + 56));
    }
  }
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance BelowTargetZoneModel(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v4;
  _QWORD *v5;

  v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v2 + 32) = v4;
  *(_DWORD *)(v2 + 47) = *(_DWORD *)(v1 + 31);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 56) = v5;
  *v5 = v2;
  v5[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance AboveTargetZoneModel;
  return BelowTargetZoneModel.executePattern(wrapper:)(a1);
}

uint64_t specialized BelowTargetZoneModel.init(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  double v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char v28;
  int v29;
  uint64_t v30;
  char v31;
  int v32;
  uint64_t result;
  uint64_t v34;
  double v35;
  int v36;
  int v37;
  uint64_t v38;
  char v39;
  char v40;
  unsigned __int8 v41;
  double v42;
  char v43;
  _QWORD v44[2];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  BOOL v53;
  unsigned __int8 v54;
  char v55;

  v4 = type metadata accessor for Logger();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(specialized Sequence.compactMap<A>(_:)(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
    v8 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v8 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v51 = v8;
  v9 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v9, 1, &v51);
  swift_bridgeObjectRelease();
  v10 = v51;
  v11 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
  swift_retain_n();
  v12 = Logger.logObject.getter();
  v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v46 = swift_slowAlloc();
    *(_QWORD *)&v51 = v46;
    *(_DWORD *)v14 = 136315394;
    v48 = a1;
    v49 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000014, 0x800000024A61C980, (uint64_t *)&v51));
    v47 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v14 + 12) = 2080;
    v44[1] = v14 + 14;
    lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
    v45 = v4;
    swift_retain();
    v15 = Dictionary.description.getter();
    v16 = a2;
    v18 = v17;
    swift_release();
    v49 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v18, (uint64_t *)&v51));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    a2 = v16;
    a1 = v48;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A5E6000, v12, v13, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v14, 0x16u);
    v19 = v46;
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v19, -1, -1);
    MEMORY[0x24BD15374](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v47 + 8))(v7, v45);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  if (*(_QWORD *)(v10 + 16)
    && (v20 = specialized __RawDictionaryStorage.find<A>(_:)(6), (v21 & 1) != 0)
    && (outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v20, (uint64_t)&v51), (swift_dynamicCast() & 1) != 0)
    && *(_QWORD *)(v10 + 16)
    && (v22 = v49, v23 = specialized __RawDictionaryStorage.find<A>(_:)(15), (v24 & 1) != 0)
    && (outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v23, (uint64_t)&v51), (swift_dynamicCast() & 1) != 0))
  {
    v25 = v50;
    if (!*(_QWORD *)(v10 + 16))
      goto LABEL_26;
    v26 = *(_QWORD *)&v49;
    v27 = specialized __RawDictionaryStorage.find<A>(_:)(5);
    if ((v28 & 1) == 0)
      goto LABEL_26;
    outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v27, (uint64_t)&v51);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*(_QWORD *)(v10 + 16))
      {
        v29 = LOBYTE(v49);
        v30 = specialized __RawDictionaryStorage.find<A>(_:)(7);
        if ((v31 & 1) != 0)
        {
          outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v30, (uint64_t)&v51);
          if ((swift_dynamicCast() & 1) == 0
            || (v32 = specialized VoiceFeedbackMetricType.init(rawValue:)(*(unint64_t *)&v49),
                v32 == 8))
          {
            swift_release();
            swift_bridgeObjectRelease();
            goto LABEL_23;
          }
          v37 = v32;
          if (*(_QWORD *)(v10 + 16) && (v38 = specialized __RawDictionaryStorage.find<A>(_:)(12), (v39 & 1) != 0))
          {
            outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v38, (uint64_t)&v51);
          }
          else
          {
            v51 = 0u;
            v52 = 0u;
          }
          swift_release();
          if (*((_QWORD *)&v52 + 1))
          {
            if ((swift_dynamicCast() & 1) != 0)
            {
              if (*(_QWORD *)&v49 == 1)
                v40 = 1;
              else
                v40 = 2;
              if (v49 == 0.0)
                v41 = 0;
              else
                v41 = v40;
LABEL_43:
              if (v29)
                v42 = v22;
              else
                v42 = v22 + 1.0;
              LOBYTE(v51) = 24;
              *((double *)&v51 + 1) = v22;
              *(_QWORD *)&v52 = v26;
              *((_QWORD *)&v52 + 1) = v25;
              v53 = v22 == v42;
              v54 = v41;
              v55 = v37;
              swift_bridgeObjectRetain();
              v43 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1);
              swift_bridgeObjectRelease();
              result = swift_bridgeObjectRelease();
              if ((v43 & 1) != 0)
              {
                v35 = v22;
                v36 = (v22 == v42) | (v41 << 8) | (v37 << 16);
                v34 = 24;
                goto LABEL_25;
              }
              goto LABEL_23;
            }
          }
          else
          {
            outlined destroy of Any?((uint64_t)&v51);
          }
          v41 = 2;
          goto LABEL_43;
        }
      }
LABEL_26:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_release();
      goto LABEL_24;
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
  }
LABEL_23:
  result = swift_bridgeObjectRelease();
LABEL_24:
  v34 = 0;
  v35 = 0.0;
  v26 = 0;
  v25 = 0;
  v36 = 0;
LABEL_25:
  *(_QWORD *)a2 = v34;
  *(double *)(a2 + 8) = v35;
  *(_QWORD *)(a2 + 16) = v26;
  *(_QWORD *)(a2 + 24) = v25;
  *(_WORD *)(a2 + 32) = v36;
  *(_BYTE *)(a2 + 34) = BYTE2(v36);
  return result;
}

unint64_t lazy protocol witness table accessor for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for BelowTargetZoneModel.CodingKeys, &unk_251BEB9C0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for BelowTargetZoneModel.CodingKeys, &unk_251BEB9C0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for BelowTargetZoneModel.CodingKeys, &unk_251BEB9C0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for BelowTargetZoneModel.CodingKeys, &unk_251BEB9C0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys);
  }
  return result;
}

uint64_t specialized BelowTargetZoneModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t result;
  int v18;
  int v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;
  unsigned __int8 v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<BelowTargetZoneModel.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  v28 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v9 = v29;
  v27 = 1;
  KeyedDecodingContainer.decode(_:forKey:)();
  v11 = v10;
  v26 = 2;
  v12 = KeyedDecodingContainer.decode(_:forKey:)();
  v14 = v13;
  v20 = v12;
  v25 = 3;
  swift_bridgeObjectRetain();
  v19 = KeyedDecodingContainer.decode(_:forKey:)();
  v23 = 4;
  lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  v18 = v24;
  v21 = 5;
  lazy protocol witness table accessor for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v15 = v19 & 1;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v16 = v22;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  result = swift_bridgeObjectRelease();
  *(_BYTE *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_QWORD *)(a2 + 16) = v20;
  *(_QWORD *)(a2 + 24) = v14;
  *(_BYTE *)(a2 + 32) = v15;
  *(_BYTE *)(a2 + 33) = v18;
  *(_BYTE *)(a2 + 34) = v16;
  return result;
}

unint64_t instantiation function for generic protocol witness table for BelowTargetZoneModel(_QWORD *a1)
{
  unint64_t result;

  a1[1] = lazy protocol witness table accessor for type BelowTargetZoneModel and conformance BelowTargetZoneModel();
  a1[2] = lazy protocol witness table accessor for type BelowTargetZoneModel and conformance BelowTargetZoneModel();
  result = lazy protocol witness table accessor for type BelowTargetZoneModel and conformance BelowTargetZoneModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type BelowTargetZoneModel and conformance BelowTargetZoneModel()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BelowTargetZoneModel and conformance BelowTargetZoneModel;
  if (!lazy protocol witness table cache variable for type BelowTargetZoneModel and conformance BelowTargetZoneModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for BelowTargetZoneModel, &type metadata for BelowTargetZoneModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BelowTargetZoneModel and conformance BelowTargetZoneModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BelowTargetZoneModel and conformance BelowTargetZoneModel;
  if (!lazy protocol witness table cache variable for type BelowTargetZoneModel and conformance BelowTargetZoneModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for BelowTargetZoneModel, &type metadata for BelowTargetZoneModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BelowTargetZoneModel and conformance BelowTargetZoneModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BelowTargetZoneModel and conformance BelowTargetZoneModel;
  if (!lazy protocol witness table cache variable for type BelowTargetZoneModel and conformance BelowTargetZoneModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for BelowTargetZoneModel, &type metadata for BelowTargetZoneModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BelowTargetZoneModel and conformance BelowTargetZoneModel);
  }
  return result;
}

ValueMetadata *type metadata accessor for BelowTargetZoneModel()
{
  return &type metadata for BelowTargetZoneModel;
}

uint64_t storeEnumTagSinglePayload for BelowTargetZoneModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A604FB8 + 4 * byte_24A61C8CB[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_24A604FEC + 4 * byte_24A61C8C6[v4]))();
}

uint64_t sub_24A604FEC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A604FF4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A604FFCLL);
  return result;
}

uint64_t sub_24A605008(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A605010);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_24A605014(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A60501C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for BelowTargetZoneModel.CodingKeys()
{
  return &unk_251BEB9C0;
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackCATPatternsExecutor(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackCATPatternsExecutor);
}

uint64_t type metadata completion function for WorkoutVoiceFeedbackCATPatternsExecutor()
{
  return swift_initClassMetadata2();
}

uint64_t WorkoutVoiceFeedbackGoalCompletionParameters.asKeyValuePairs()()
{
  return WorkoutVoiceFeedbackGoalCompletionParameters.asKeyValuePairs()(type metadata accessor for WorkoutVoiceFeedbackGoalCompletionParameters);
}

uint64_t WorkoutVoiceFeedbackGoalHalfwayPointParameters.asKeyValuePairs()()
{
  return WorkoutVoiceFeedbackGoalCompletionParameters.asKeyValuePairs()(type metadata accessor for WorkoutVoiceFeedbackGoalHalfwayPointParameters);
}

uint64_t WorkoutVoiceFeedbackGoalCompletionParameters.asKeyValuePairs()(uint64_t (*a1)(_QWORD))
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  uint64_t *boxed_opaque_existential_0;
  uint64_t v21;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_24A61CAD0;
  *(_QWORD *)(v6 + 32) = 0x6E6F697461727564;
  *(_QWORD *)(v6 + 40) = 0xE800000000000000;
  v7 = *v1;
  if (*v1)
  {
    v8 = type metadata accessor for DialogDuration();
    v9 = v7;
  }
  else
  {
    v9 = 0;
    v8 = 0;
    *(_QWORD *)(v6 + 56) = 0;
    *(_QWORD *)(v6 + 64) = 0;
  }
  *(_QWORD *)(v6 + 48) = v9;
  *(_QWORD *)(v6 + 72) = v8;
  *(_QWORD *)(v6 + 80) = 0xD000000000000017;
  *(_QWORD *)(v6 + 88) = 0x800000024A61E2A0;
  v10 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v6 + 96) = *((_BYTE *)v1 + 8);
  *(_QWORD *)(v6 + 120) = v10;
  *(_QWORD *)(v6 + 128) = 0x6874676E656CLL;
  *(_QWORD *)(v6 + 136) = 0xE600000000000000;
  v11 = v1[2];
  if (v11)
  {
    v12 = type metadata accessor for DialogLength();
    v13 = v11;
  }
  else
  {
    v13 = 0;
    v12 = 0;
    *(_QWORD *)(v6 + 152) = 0;
    *(_QWORD *)(v6 + 160) = 0;
  }
  *(_QWORD *)(v6 + 144) = v13;
  *(_QWORD *)(v6 + 168) = v12;
  *(_QWORD *)(v6 + 176) = 0x647574696E67616DLL;
  *(_QWORD *)(v6 + 184) = 0xE900000000000065;
  if ((v1[4] & 1) != 0)
  {
    v14 = 0;
    *(_QWORD *)(v6 + 200) = 0;
    *(_QWORD *)(v6 + 208) = 0;
    v15 = 0;
  }
  else
  {
    v15 = v1[3];
    v14 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v6 + 192) = v15;
  *(_QWORD *)(v6 + 216) = v14;
  *(_QWORD *)(v6 + 224) = 1953066613;
  *(_QWORD *)(v6 + 232) = 0xE400000000000000;
  v16 = a1(0);
  outlined init with copy of URL?((uint64_t)v1 + *(int *)(v16 + 32), (uint64_t)v5, &demangling cache variable for type metadata for SpeakableString?);
  v17 = type metadata accessor for SpeakableString();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v5, 1, v17) == 1)
  {
    swift_retain();
    swift_retain();
    outlined destroy of Any?((uint64_t)v5, &demangling cache variable for type metadata for SpeakableString?);
    *(_OWORD *)(v6 + 240) = 0u;
    *(_OWORD *)(v6 + 256) = 0u;
  }
  else
  {
    *(_QWORD *)(v6 + 264) = v17;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v6 + 240));
    (*(void (**)(uint64_t *, char *, uint64_t))(v18 + 32))(boxed_opaque_existential_0, v5, v17);
    swift_retain();
    swift_retain();
  }
  return v6;
}

uint64_t WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters.asKeyValuePairs()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v44 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v4 = swift_allocObject();
  v5 = v4;
  *(_OWORD *)(v4 + 16) = xmmword_24A61CAE0;
  *(_QWORD *)(v4 + 32) = 0xD000000000000020;
  *(_QWORD *)(v4 + 40) = 0x800000024A61E770;
  v6 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v4 + 48) = *(_BYTE *)v0;
  *(_QWORD *)(v4 + 72) = v6;
  *(_QWORD *)(v4 + 80) = 0xD000000000000013;
  *(_QWORD *)(v4 + 88) = 0x800000024A61E7A0;
  if ((*(_BYTE *)(v0 + 16) & 1) != 0)
  {
    v7 = 0;
    *(_QWORD *)(v4 + 104) = 0;
    *(_QWORD *)(v4 + 112) = 0;
    v8 = 0;
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 8);
    v7 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v4 + 120) = v7;
  *(_QWORD *)(v4 + 128) = 0xD000000000000017;
  *(_QWORD *)(v4 + 96) = v8;
  *(_QWORD *)(v4 + 136) = 0x800000024A61E2A0;
  *(_BYTE *)(v4 + 144) = *(_BYTE *)(v0 + 17);
  *(_QWORD *)(v4 + 168) = v6;
  *(_QWORD *)(v4 + 176) = 0x6E69577473726966;
  *(_QWORD *)(v4 + 184) = 0xEF657A6953776F64;
  if ((*(_BYTE *)(v0 + 32) & 1) != 0)
  {
    v9 = 0;
    *(_QWORD *)(v4 + 200) = 0;
    *(_QWORD *)(v4 + 208) = 0;
    v10 = 0;
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 24);
    v9 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v4 + 192) = v10;
  *(_QWORD *)(v4 + 216) = v9;
  *(_QWORD *)(v4 + 224) = 0xD000000000000012;
  *(_QWORD *)(v4 + 232) = 0x800000024A61E7C0;
  if ((*(_BYTE *)(v0 + 48) & 1) != 0)
  {
    v11 = 0;
    *(_QWORD *)(v4 + 248) = 0;
    *(_QWORD *)(v4 + 256) = 0;
    v12 = 0;
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 40);
    v11 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v4 + 240) = v12;
  *(_QWORD *)(v4 + 264) = v11;
  strcpy((char *)(v4 + 272), "goalDistance");
  *(_BYTE *)(v4 + 285) = 0;
  *(_WORD *)(v4 + 286) = -5120;
  v13 = *(_QWORD *)(v0 + 56);
  if (v13)
  {
    v14 = type metadata accessor for DialogLength();
    v15 = v13;
  }
  else
  {
    v15 = 0;
    v14 = 0;
    *(_QWORD *)(v5 + 296) = 0;
    *(_QWORD *)(v5 + 304) = 0;
  }
  *(_QWORD *)(v5 + 288) = v15;
  *(_QWORD *)(v5 + 312) = v14;
  strcpy((char *)(v5 + 320), "goalDuration");
  *(_BYTE *)(v5 + 333) = 0;
  *(_WORD *)(v5 + 334) = -5120;
  v16 = *(_QWORD *)(v0 + 64);
  if (v16)
  {
    v17 = type metadata accessor for DialogDuration();
    v18 = v16;
  }
  else
  {
    v18 = 0;
    v17 = 0;
    *(_QWORD *)(v5 + 344) = 0;
    *(_QWORD *)(v5 + 352) = 0;
  }
  *(_QWORD *)(v5 + 336) = v18;
  *(_QWORD *)(v5 + 360) = v17;
  strcpy((char *)(v5 + 368), "goalMagnitude");
  *(_WORD *)(v5 + 382) = -4864;
  if ((*(_BYTE *)(v0 + 80) & 1) != 0)
  {
    v19 = 0;
    *(_QWORD *)(v5 + 392) = 0;
    *(_QWORD *)(v5 + 400) = 0;
    v20 = 0;
  }
  else
  {
    v20 = *(_QWORD *)(v0 + 72);
    v19 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v5 + 384) = v20;
  *(_QWORD *)(v5 + 408) = v19;
  *(_QWORD *)(v5 + 416) = 0x74696E556C616F67;
  *(_QWORD *)(v5 + 424) = 0xE800000000000000;
  v21 = (int *)type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(0);
  outlined init with copy of URL?(v0 + v21[12], (uint64_t)v3, &demangling cache variable for type metadata for SpeakableString?);
  v22 = type metadata accessor for SpeakableString();
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v3, 1, v22) == 1)
  {
    swift_retain();
    swift_retain();
    outlined destroy of Any?((uint64_t)v3, &demangling cache variable for type metadata for SpeakableString?);
    *(_OWORD *)(v5 + 432) = 0u;
    *(_OWORD *)(v5 + 448) = 0u;
  }
  else
  {
    *(_QWORD *)(v5 + 456) = v22;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v5 + 432));
    (*(void (**)(uint64_t *, char *, uint64_t))(v23 + 32))(boxed_opaque_existential_0, v3, v22);
    swift_retain();
    swift_retain();
  }
  v25 = MEMORY[0x24BEE1328];
  strcpy((char *)(v5 + 464), "isFirstWindow");
  *(_WORD *)(v5 + 478) = -4864;
  *(_BYTE *)(v5 + 480) = *(_BYTE *)(v0 + v21[13]);
  *(_QWORD *)(v5 + 504) = v25;
  strcpy((char *)(v5 + 512), "isLastWindow");
  *(_BYTE *)(v5 + 525) = 0;
  *(_WORD *)(v5 + 526) = -5120;
  v26 = *(_BYTE *)(v0 + v21[14]);
  *(_QWORD *)(v5 + 552) = v25;
  *(_BYTE *)(v5 + 528) = v26;
  *(_QWORD *)(v5 + 560) = 0xD000000000000016;
  *(_QWORD *)(v5 + 568) = 0x800000024A61E7E0;
  v27 = *(_BYTE *)(v0 + v21[15]);
  *(_QWORD *)(v5 + 600) = v25;
  *(_BYTE *)(v5 + 576) = v27;
  *(_QWORD *)(v5 + 608) = 0xD000000000000010;
  *(_QWORD *)(v5 + 616) = 0x800000024A61E800;
  v28 = *(_QWORD *)(v0 + v21[16]);
  if (v28)
  {
    v29 = type metadata accessor for DialogLength();
    v30 = v28;
  }
  else
  {
    v30 = 0;
    v29 = 0;
    *(_OWORD *)(v5 + 632) = 0u;
  }
  *(_QWORD *)(v5 + 624) = v30;
  *(_QWORD *)(v5 + 648) = v29;
  *(_QWORD *)(v5 + 656) = 0xD000000000000010;
  *(_QWORD *)(v5 + 664) = 0x800000024A61E820;
  v31 = *(_QWORD *)(v0 + v21[17]);
  if (v31)
  {
    v32 = type metadata accessor for DialogDuration();
    v33 = v31;
  }
  else
  {
    v33 = 0;
    v32 = 0;
    *(_OWORD *)(v5 + 680) = 0u;
  }
  *(_QWORD *)(v5 + 672) = v33;
  *(_QWORD *)(v5 + 696) = v32;
  *(_QWORD *)(v5 + 704) = 0xD000000000000014;
  *(_QWORD *)(v5 + 712) = 0x800000024A61E840;
  v34 = (uint64_t *)(v0 + v21[18]);
  if ((v34[1] & 1) != 0)
  {
    v35 = 0;
    *(_OWORD *)(v5 + 728) = 0u;
    v36 = 0;
  }
  else
  {
    v36 = *v34;
    v35 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v5 + 720) = v36;
  *(_QWORD *)(v5 + 744) = v35;
  *(_QWORD *)(v5 + 752) = 0x6953776F646E6977;
  *(_QWORD *)(v5 + 760) = 0xEA0000000000657ALL;
  v37 = (uint64_t *)(v0 + v21[19]);
  if ((v37[1] & 1) != 0)
  {
    v38 = 0;
    *(_OWORD *)(v5 + 776) = 0u;
    v39 = 0;
  }
  else
  {
    v39 = *v37;
    v38 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v5 + 768) = v39;
  *(_QWORD *)(v5 + 792) = v38;
  *(_QWORD *)(v5 + 800) = 0x65646E49656E6F7ALL;
  *(_QWORD *)(v5 + 808) = 0xE900000000000078;
  v40 = (uint64_t *)(v0 + v21[20]);
  if ((v40[1] & 1) != 0)
  {
    v41 = 0;
    *(_OWORD *)(v5 + 824) = 0u;
    v42 = 0;
  }
  else
  {
    v42 = *v40;
    v41 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v5 + 816) = v42;
  *(_QWORD *)(v5 + 840) = v41;
  swift_retain();
  swift_retain();
  return v5;
}

uint64_t WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters.asKeyValuePairs()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *boxed_opaque_existential_0;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v4 = swift_allocObject();
  v5 = v4;
  *(_OWORD *)(v4 + 16) = xmmword_24A61CAF0;
  *(_QWORD *)(v4 + 32) = 0xD000000000000020;
  *(_QWORD *)(v4 + 40) = 0x800000024A61E770;
  v6 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v4 + 48) = *(_BYTE *)v0;
  *(_QWORD *)(v4 + 72) = v6;
  *(_QWORD *)(v4 + 80) = 0xD000000000000013;
  *(_QWORD *)(v4 + 88) = 0x800000024A61E7A0;
  if ((*(_BYTE *)(v0 + 16) & 1) != 0)
  {
    v7 = 0;
    *(_QWORD *)(v4 + 104) = 0;
    *(_QWORD *)(v4 + 112) = 0;
    v8 = 0;
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 8);
    v7 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v4 + 120) = v7;
  *(_QWORD *)(v4 + 128) = 0xD000000000000017;
  *(_QWORD *)(v4 + 96) = v8;
  *(_QWORD *)(v4 + 136) = 0x800000024A61E2A0;
  *(_BYTE *)(v4 + 144) = *(_BYTE *)(v0 + 17);
  *(_QWORD *)(v4 + 168) = v6;
  *(_QWORD *)(v4 + 176) = 0x6E69577473726966;
  *(_QWORD *)(v4 + 184) = 0xEF657A6953776F64;
  if ((*(_BYTE *)(v0 + 32) & 1) != 0)
  {
    v9 = 0;
    *(_QWORD *)(v4 + 200) = 0;
    *(_QWORD *)(v4 + 208) = 0;
    v10 = 0;
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 24);
    v9 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v4 + 192) = v10;
  *(_QWORD *)(v4 + 216) = v9;
  *(_QWORD *)(v4 + 224) = 0xD000000000000012;
  *(_QWORD *)(v4 + 232) = 0x800000024A61E7C0;
  if ((*(_BYTE *)(v0 + 48) & 1) != 0)
  {
    v11 = 0;
    *(_QWORD *)(v4 + 248) = 0;
    *(_QWORD *)(v4 + 256) = 0;
    v12 = 0;
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 40);
    v11 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v4 + 240) = v12;
  *(_QWORD *)(v4 + 264) = v11;
  strcpy((char *)(v4 + 272), "goalDistance");
  *(_BYTE *)(v4 + 285) = 0;
  *(_WORD *)(v4 + 286) = -5120;
  v13 = *(_QWORD *)(v0 + 56);
  if (v13)
  {
    v14 = type metadata accessor for DialogLength();
    v15 = v13;
  }
  else
  {
    v15 = 0;
    v14 = 0;
    *(_QWORD *)(v5 + 296) = 0;
    *(_QWORD *)(v5 + 304) = 0;
  }
  *(_QWORD *)(v5 + 288) = v15;
  *(_QWORD *)(v5 + 312) = v14;
  strcpy((char *)(v5 + 320), "goalDuration");
  *(_BYTE *)(v5 + 333) = 0;
  *(_WORD *)(v5 + 334) = -5120;
  v16 = *(_QWORD *)(v0 + 64);
  if (v16)
  {
    v17 = type metadata accessor for DialogDuration();
    v18 = v16;
  }
  else
  {
    v18 = 0;
    v17 = 0;
    *(_QWORD *)(v5 + 344) = 0;
    *(_QWORD *)(v5 + 352) = 0;
  }
  *(_QWORD *)(v5 + 336) = v18;
  *(_QWORD *)(v5 + 360) = v17;
  strcpy((char *)(v5 + 368), "goalMagnitude");
  *(_WORD *)(v5 + 382) = -4864;
  if ((*(_BYTE *)(v0 + 80) & 1) != 0)
  {
    v19 = 0;
    *(_QWORD *)(v5 + 392) = 0;
    *(_QWORD *)(v5 + 400) = 0;
    v20 = 0;
  }
  else
  {
    v20 = *(_QWORD *)(v0 + 72);
    v19 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v5 + 384) = v20;
  *(_QWORD *)(v5 + 408) = v19;
  *(_QWORD *)(v5 + 416) = 0x74696E556C616F67;
  *(_QWORD *)(v5 + 424) = 0xE800000000000000;
  v21 = (int *)type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(0);
  outlined init with copy of URL?(v0 + v21[12], (uint64_t)v3, &demangling cache variable for type metadata for SpeakableString?);
  v22 = type metadata accessor for SpeakableString();
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v3, 1, v22) == 1)
  {
    swift_retain();
    swift_retain();
    outlined destroy of Any?((uint64_t)v3, &demangling cache variable for type metadata for SpeakableString?);
    *(_OWORD *)(v5 + 432) = 0u;
    *(_OWORD *)(v5 + 448) = 0u;
  }
  else
  {
    *(_QWORD *)(v5 + 456) = v22;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v5 + 432));
    (*(void (**)(uint64_t *, char *, uint64_t))(v23 + 32))(boxed_opaque_existential_0, v3, v22);
    swift_retain();
    swift_retain();
  }
  *(_QWORD *)(v5 + 464) = 0x636E656461437369;
  *(_QWORD *)(v5 + 472) = 0xE900000000000065;
  *(_BYTE *)(v5 + 480) = *(_BYTE *)(v0 + v21[13]);
  *(_QWORD *)(v5 + 504) = v6;
  strcpy((char *)(v5 + 512), "isFirstWindow");
  *(_WORD *)(v5 + 526) = -4864;
  v25 = *(_BYTE *)(v0 + v21[14]);
  *(_QWORD *)(v5 + 552) = v6;
  *(_BYTE *)(v5 + 528) = v25;
  *(_QWORD *)(v5 + 560) = 0x5274726165487369;
  *(_QWORD *)(v5 + 568) = 0xEB00000000657461;
  v26 = *(_BYTE *)(v0 + v21[15]);
  *(_QWORD *)(v5 + 600) = v6;
  *(_BYTE *)(v5 + 576) = v26;
  strcpy((char *)(v5 + 608), "isLastWindow");
  *(_BYTE *)(v5 + 621) = 0;
  *(_WORD *)(v5 + 622) = -5120;
  v27 = *(_BYTE *)(v0 + v21[16]);
  *(_QWORD *)(v5 + 648) = v6;
  *(_BYTE *)(v5 + 624) = v27;
  *(_QWORD *)(v5 + 656) = 0xD000000000000016;
  *(_QWORD *)(v5 + 664) = 0x800000024A61E7E0;
  v28 = *(_BYTE *)(v0 + v21[17]);
  *(_QWORD *)(v5 + 696) = v6;
  *(_BYTE *)(v5 + 672) = v28;
  *(_QWORD *)(v5 + 704) = 0x7265776F507369;
  *(_QWORD *)(v5 + 712) = 0xE700000000000000;
  v29 = *(_BYTE *)(v0 + v21[18]);
  *(_QWORD *)(v5 + 744) = v6;
  *(_BYTE *)(v5 + 720) = v29;
  *(_QWORD *)(v5 + 752) = 0xD000000000000011;
  *(_QWORD *)(v5 + 760) = 0x800000024A61DDC0;
  v30 = *(_BYTE *)(v0 + v21[19]);
  *(_QWORD *)(v5 + 792) = v6;
  *(_BYTE *)(v5 + 768) = v30;
  strcpy((char *)(v5 + 800), "maxMagnitude");
  *(_BYTE *)(v5 + 813) = 0;
  *(_WORD *)(v5 + 814) = -5120;
  v31 = (uint64_t *)(v0 + v21[20]);
  if ((v31[1] & 1) != 0)
  {
    v32 = 0;
    *(_OWORD *)(v5 + 824) = 0u;
    v33 = 0;
  }
  else
  {
    v33 = *v31;
    v32 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v5 + 816) = v33;
  *(_QWORD *)(v5 + 840) = v32;
  strcpy((char *)(v5 + 848), "minMagnitude");
  *(_BYTE *)(v5 + 861) = 0;
  *(_WORD *)(v5 + 862) = -5120;
  v34 = (uint64_t *)(v0 + v21[21]);
  if ((v34[1] & 1) != 0)
  {
    v35 = 0;
    *(_OWORD *)(v5 + 872) = 0u;
    v36 = 0;
  }
  else
  {
    v36 = *v34;
    v35 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v5 + 864) = v36;
  *(_QWORD *)(v5 + 888) = v35;
  *(_QWORD *)(v5 + 896) = 0xD000000000000010;
  *(_QWORD *)(v5 + 904) = 0x800000024A61E800;
  v37 = *(_QWORD *)(v0 + v21[22]);
  if (v37)
  {
    v38 = type metadata accessor for DialogLength();
    v39 = v37;
  }
  else
  {
    v39 = 0;
    v38 = 0;
    *(_OWORD *)(v5 + 920) = 0u;
  }
  *(_QWORD *)(v5 + 912) = v39;
  *(_QWORD *)(v5 + 936) = v38;
  *(_QWORD *)(v5 + 944) = 0xD000000000000010;
  *(_QWORD *)(v5 + 952) = 0x800000024A61E820;
  v40 = *(_QWORD *)(v0 + v21[23]);
  if (v40)
  {
    v41 = type metadata accessor for DialogDuration();
    v42 = v40;
  }
  else
  {
    v42 = 0;
    v41 = 0;
    *(_OWORD *)(v5 + 968) = 0u;
  }
  *(_QWORD *)(v5 + 960) = v42;
  *(_QWORD *)(v5 + 984) = v41;
  *(_QWORD *)(v5 + 992) = 0xD000000000000014;
  *(_QWORD *)(v5 + 1000) = 0x800000024A61E840;
  v43 = (uint64_t *)(v0 + v21[24]);
  if ((v43[1] & 1) != 0)
  {
    v44 = 0;
    *(_OWORD *)(v5 + 1016) = 0u;
    v45 = 0;
  }
  else
  {
    v45 = *v43;
    v44 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v5 + 1008) = v45;
  *(_QWORD *)(v5 + 1032) = v44;
  *(_QWORD *)(v5 + 1040) = 0x6953776F646E6977;
  *(_QWORD *)(v5 + 1048) = 0xEA0000000000657ALL;
  v46 = (uint64_t *)(v0 + v21[25]);
  if ((v46[1] & 1) != 0)
  {
    v47 = 0;
    *(_OWORD *)(v5 + 1064) = 0u;
    v48 = 0;
  }
  else
  {
    v48 = *v46;
    v47 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v5 + 1056) = v48;
  *(_QWORD *)(v5 + 1080) = v47;
  swift_retain();
  swift_retain();
  return v5;
}

uint64_t WorkoutVoiceFeedbackIntervalUpcomingPaceParameters.asKeyValuePairs()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *boxed_opaque_existential_0;
  char v25;
  char v26;
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
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v4 = swift_allocObject();
  v5 = v4;
  *(_OWORD *)(v4 + 16) = xmmword_24A61CB00;
  *(_QWORD *)(v4 + 32) = 0xD000000000000020;
  *(_QWORD *)(v4 + 40) = 0x800000024A61E770;
  v6 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v4 + 48) = *(_BYTE *)v0;
  *(_QWORD *)(v4 + 72) = v6;
  *(_QWORD *)(v4 + 80) = 0xD000000000000013;
  *(_QWORD *)(v4 + 88) = 0x800000024A61E7A0;
  if ((*(_BYTE *)(v0 + 16) & 1) != 0)
  {
    v7 = 0;
    *(_QWORD *)(v4 + 104) = 0;
    *(_QWORD *)(v4 + 112) = 0;
    v8 = 0;
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 8);
    v7 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v4 + 120) = v7;
  *(_QWORD *)(v4 + 128) = 0xD000000000000017;
  *(_QWORD *)(v4 + 96) = v8;
  *(_QWORD *)(v4 + 136) = 0x800000024A61E2A0;
  *(_BYTE *)(v4 + 144) = *(_BYTE *)(v0 + 17);
  *(_QWORD *)(v4 + 168) = v6;
  *(_QWORD *)(v4 + 176) = 0x6E69577473726966;
  *(_QWORD *)(v4 + 184) = 0xEF657A6953776F64;
  if ((*(_BYTE *)(v0 + 32) & 1) != 0)
  {
    v9 = 0;
    *(_QWORD *)(v4 + 200) = 0;
    *(_QWORD *)(v4 + 208) = 0;
    v10 = 0;
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 24);
    v9 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v4 + 192) = v10;
  *(_QWORD *)(v4 + 216) = v9;
  *(_QWORD *)(v4 + 224) = 0xD000000000000012;
  *(_QWORD *)(v4 + 232) = 0x800000024A61E7C0;
  if ((*(_BYTE *)(v0 + 48) & 1) != 0)
  {
    v11 = 0;
    *(_QWORD *)(v4 + 248) = 0;
    *(_QWORD *)(v4 + 256) = 0;
    v12 = 0;
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 40);
    v11 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v4 + 240) = v12;
  *(_QWORD *)(v4 + 264) = v11;
  strcpy((char *)(v4 + 272), "goalDistance");
  *(_BYTE *)(v4 + 285) = 0;
  *(_WORD *)(v4 + 286) = -5120;
  v13 = *(_QWORD *)(v0 + 56);
  if (v13)
  {
    v14 = type metadata accessor for DialogLength();
    v15 = v13;
  }
  else
  {
    v15 = 0;
    v14 = 0;
    *(_QWORD *)(v5 + 296) = 0;
    *(_QWORD *)(v5 + 304) = 0;
  }
  *(_QWORD *)(v5 + 288) = v15;
  *(_QWORD *)(v5 + 312) = v14;
  strcpy((char *)(v5 + 320), "goalDuration");
  *(_BYTE *)(v5 + 333) = 0;
  *(_WORD *)(v5 + 334) = -5120;
  v16 = *(_QWORD *)(v0 + 64);
  if (v16)
  {
    v17 = type metadata accessor for DialogDuration();
    v18 = v16;
  }
  else
  {
    v18 = 0;
    v17 = 0;
    *(_QWORD *)(v5 + 344) = 0;
    *(_QWORD *)(v5 + 352) = 0;
  }
  *(_QWORD *)(v5 + 336) = v18;
  *(_QWORD *)(v5 + 360) = v17;
  strcpy((char *)(v5 + 368), "goalMagnitude");
  *(_WORD *)(v5 + 382) = -4864;
  if ((*(_BYTE *)(v0 + 80) & 1) != 0)
  {
    v19 = 0;
    *(_QWORD *)(v5 + 392) = 0;
    *(_QWORD *)(v5 + 400) = 0;
    v20 = 0;
  }
  else
  {
    v20 = *(_QWORD *)(v0 + 72);
    v19 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v5 + 384) = v20;
  *(_QWORD *)(v5 + 408) = v19;
  *(_QWORD *)(v5 + 416) = 0x74696E556C616F67;
  *(_QWORD *)(v5 + 424) = 0xE800000000000000;
  v21 = (int *)type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters(0);
  outlined init with copy of URL?(v0 + v21[12], (uint64_t)v3, &demangling cache variable for type metadata for SpeakableString?);
  v22 = type metadata accessor for SpeakableString();
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v3, 1, v22) == 1)
  {
    swift_retain();
    swift_retain();
    outlined destroy of Any?((uint64_t)v3, &demangling cache variable for type metadata for SpeakableString?);
    *(_OWORD *)(v5 + 432) = 0u;
    *(_OWORD *)(v5 + 448) = 0u;
  }
  else
  {
    *(_QWORD *)(v5 + 456) = v22;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v5 + 432));
    (*(void (**)(uint64_t *, char *, uint64_t))(v23 + 32))(boxed_opaque_existential_0, v3, v22);
    swift_retain();
    swift_retain();
  }
  strcpy((char *)(v5 + 464), "isFirstWindow");
  *(_WORD *)(v5 + 478) = -4864;
  *(_BYTE *)(v5 + 480) = *(_BYTE *)(v0 + v21[13]);
  *(_QWORD *)(v5 + 504) = v6;
  strcpy((char *)(v5 + 512), "isLastWindow");
  *(_BYTE *)(v5 + 525) = 0;
  *(_WORD *)(v5 + 526) = -5120;
  v25 = *(_BYTE *)(v0 + v21[14]);
  *(_QWORD *)(v5 + 552) = v6;
  *(_BYTE *)(v5 + 528) = v25;
  *(_QWORD *)(v5 + 560) = 0xD000000000000016;
  *(_QWORD *)(v5 + 568) = 0x800000024A61E7E0;
  v26 = *(_BYTE *)(v0 + v21[15]);
  *(_QWORD *)(v5 + 600) = v6;
  *(_BYTE *)(v5 + 576) = v26;
  *(_QWORD *)(v5 + 608) = 0xD000000000000011;
  *(_QWORD *)(v5 + 616) = 0x800000024A61DDC0;
  v27 = *(_BYTE *)(v0 + v21[16]);
  *(_QWORD *)(v5 + 648) = v6;
  *(_BYTE *)(v5 + 624) = v27;
  *(_QWORD *)(v5 + 656) = 0x6563615078616DLL;
  *(_QWORD *)(v5 + 664) = 0xE700000000000000;
  v28 = *(_QWORD *)(v0 + v21[17]);
  if (v28)
  {
    v29 = type metadata accessor for DialogDuration();
    v30 = v28;
  }
  else
  {
    v30 = 0;
    v29 = 0;
    *(_OWORD *)(v5 + 680) = 0u;
  }
  *(_QWORD *)(v5 + 672) = v30;
  *(_QWORD *)(v5 + 696) = v29;
  *(_QWORD *)(v5 + 704) = 0x656361506E696DLL;
  *(_QWORD *)(v5 + 712) = 0xE700000000000000;
  v31 = *(_QWORD *)(v0 + v21[18]);
  if (v31)
  {
    v32 = type metadata accessor for DialogDuration();
    v33 = v31;
  }
  else
  {
    v33 = 0;
    v32 = 0;
    *(_OWORD *)(v5 + 728) = 0u;
  }
  *(_QWORD *)(v5 + 720) = v33;
  *(_QWORD *)(v5 + 744) = v32;
  *(_QWORD *)(v5 + 752) = 0xD000000000000010;
  *(_QWORD *)(v5 + 760) = 0x800000024A61E800;
  v34 = *(_QWORD *)(v0 + v21[19]);
  if (v34)
  {
    v35 = type metadata accessor for DialogLength();
    v36 = v34;
  }
  else
  {
    v36 = 0;
    v35 = 0;
    *(_OWORD *)(v5 + 776) = 0u;
  }
  *(_QWORD *)(v5 + 768) = v36;
  *(_QWORD *)(v5 + 792) = v35;
  *(_QWORD *)(v5 + 800) = 0xD000000000000010;
  *(_QWORD *)(v5 + 808) = 0x800000024A61E820;
  v37 = *(_QWORD *)(v0 + v21[20]);
  if (v37)
  {
    v38 = type metadata accessor for DialogDuration();
    v39 = v37;
  }
  else
  {
    v39 = 0;
    v38 = 0;
    *(_OWORD *)(v5 + 824) = 0u;
  }
  *(_QWORD *)(v5 + 816) = v39;
  *(_QWORD *)(v5 + 840) = v38;
  *(_QWORD *)(v5 + 848) = 0xD000000000000014;
  *(_QWORD *)(v5 + 856) = 0x800000024A61E840;
  v40 = (uint64_t *)(v0 + v21[21]);
  if ((v40[1] & 1) != 0)
  {
    v41 = 0;
    *(_OWORD *)(v5 + 872) = 0u;
    v42 = 0;
  }
  else
  {
    v42 = *v40;
    v41 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v5 + 864) = v42;
  *(_QWORD *)(v5 + 888) = v41;
  *(_QWORD *)(v5 + 896) = 0x6953776F646E6977;
  *(_QWORD *)(v5 + 904) = 0xEA0000000000657ALL;
  v43 = (uint64_t *)(v0 + v21[22]);
  if ((v43[1] & 1) != 0)
  {
    v44 = 0;
    *(_OWORD *)(v5 + 920) = 0u;
    v45 = 0;
  }
  else
  {
    v45 = *v43;
    v44 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v5 + 912) = v45;
  *(_QWORD *)(v5 + 936) = v44;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return v5;
}

uint64_t WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters.asKeyValuePairs()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *boxed_opaque_existential_0;
  char v25;
  char v26;
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
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v4 = swift_allocObject();
  v5 = v4;
  *(_OWORD *)(v4 + 16) = xmmword_24A61CB00;
  *(_QWORD *)(v4 + 32) = 0xD000000000000020;
  *(_QWORD *)(v4 + 40) = 0x800000024A61E770;
  v6 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v4 + 48) = *(_BYTE *)v0;
  *(_QWORD *)(v4 + 72) = v6;
  *(_QWORD *)(v4 + 80) = 0xD000000000000013;
  *(_QWORD *)(v4 + 88) = 0x800000024A61E7A0;
  if ((*(_BYTE *)(v0 + 16) & 1) != 0)
  {
    v7 = 0;
    *(_QWORD *)(v4 + 104) = 0;
    *(_QWORD *)(v4 + 112) = 0;
    v8 = 0;
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 8);
    v7 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v4 + 120) = v7;
  *(_QWORD *)(v4 + 128) = 0xD000000000000017;
  *(_QWORD *)(v4 + 96) = v8;
  *(_QWORD *)(v4 + 136) = 0x800000024A61E2A0;
  *(_BYTE *)(v4 + 144) = *(_BYTE *)(v0 + 17);
  *(_QWORD *)(v4 + 168) = v6;
  *(_QWORD *)(v4 + 176) = 0x6E69577473726966;
  *(_QWORD *)(v4 + 184) = 0xEF657A6953776F64;
  if ((*(_BYTE *)(v0 + 32) & 1) != 0)
  {
    v9 = 0;
    *(_QWORD *)(v4 + 200) = 0;
    *(_QWORD *)(v4 + 208) = 0;
    v10 = 0;
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 24);
    v9 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v4 + 192) = v10;
  *(_QWORD *)(v4 + 216) = v9;
  *(_QWORD *)(v4 + 224) = 0xD000000000000012;
  *(_QWORD *)(v4 + 232) = 0x800000024A61E7C0;
  if ((*(_BYTE *)(v0 + 48) & 1) != 0)
  {
    v11 = 0;
    *(_QWORD *)(v4 + 248) = 0;
    *(_QWORD *)(v4 + 256) = 0;
    v12 = 0;
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 40);
    v11 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v4 + 240) = v12;
  *(_QWORD *)(v4 + 264) = v11;
  strcpy((char *)(v4 + 272), "goalDistance");
  *(_BYTE *)(v4 + 285) = 0;
  *(_WORD *)(v4 + 286) = -5120;
  v13 = *(_QWORD *)(v0 + 56);
  if (v13)
  {
    v14 = type metadata accessor for DialogLength();
    v15 = v13;
  }
  else
  {
    v15 = 0;
    v14 = 0;
    *(_QWORD *)(v5 + 296) = 0;
    *(_QWORD *)(v5 + 304) = 0;
  }
  *(_QWORD *)(v5 + 288) = v15;
  *(_QWORD *)(v5 + 312) = v14;
  strcpy((char *)(v5 + 320), "goalDuration");
  *(_BYTE *)(v5 + 333) = 0;
  *(_WORD *)(v5 + 334) = -5120;
  v16 = *(_QWORD *)(v0 + 64);
  if (v16)
  {
    v17 = type metadata accessor for DialogDuration();
    v18 = v16;
  }
  else
  {
    v18 = 0;
    v17 = 0;
    *(_QWORD *)(v5 + 344) = 0;
    *(_QWORD *)(v5 + 352) = 0;
  }
  *(_QWORD *)(v5 + 336) = v18;
  *(_QWORD *)(v5 + 360) = v17;
  strcpy((char *)(v5 + 368), "goalMagnitude");
  *(_WORD *)(v5 + 382) = -4864;
  if ((*(_BYTE *)(v0 + 80) & 1) != 0)
  {
    v19 = 0;
    *(_QWORD *)(v5 + 392) = 0;
    *(_QWORD *)(v5 + 400) = 0;
    v20 = 0;
  }
  else
  {
    v20 = *(_QWORD *)(v0 + 72);
    v19 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v5 + 384) = v20;
  *(_QWORD *)(v5 + 408) = v19;
  *(_QWORD *)(v5 + 416) = 0x74696E556C616F67;
  *(_QWORD *)(v5 + 424) = 0xE800000000000000;
  v21 = (int *)type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(0);
  outlined init with copy of URL?(v0 + v21[12], (uint64_t)v3, &demangling cache variable for type metadata for SpeakableString?);
  v22 = type metadata accessor for SpeakableString();
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v3, 1, v22) == 1)
  {
    swift_retain();
    swift_retain();
    outlined destroy of Any?((uint64_t)v3, &demangling cache variable for type metadata for SpeakableString?);
    *(_OWORD *)(v5 + 432) = 0u;
    *(_OWORD *)(v5 + 448) = 0u;
  }
  else
  {
    *(_QWORD *)(v5 + 456) = v22;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v5 + 432));
    (*(void (**)(uint64_t *, char *, uint64_t))(v23 + 32))(boxed_opaque_existential_0, v3, v22);
    swift_retain();
    swift_retain();
  }
  strcpy((char *)(v5 + 464), "isFirstWindow");
  *(_WORD *)(v5 + 478) = -4864;
  *(_BYTE *)(v5 + 480) = *(_BYTE *)(v0 + v21[13]);
  *(_QWORD *)(v5 + 504) = v6;
  strcpy((char *)(v5 + 512), "isLastWindow");
  *(_BYTE *)(v5 + 525) = 0;
  *(_WORD *)(v5 + 526) = -5120;
  v25 = *(_BYTE *)(v0 + v21[14]);
  *(_QWORD *)(v5 + 552) = v6;
  *(_BYTE *)(v5 + 528) = v25;
  *(_QWORD *)(v5 + 560) = 0xD000000000000016;
  *(_QWORD *)(v5 + 568) = 0x800000024A61E7E0;
  v26 = *(_BYTE *)(v0 + v21[15]);
  *(_QWORD *)(v5 + 600) = v6;
  *(_BYTE *)(v5 + 576) = v26;
  *(_QWORD *)(v5 + 608) = 0xD000000000000011;
  *(_QWORD *)(v5 + 616) = 0x800000024A61DDC0;
  v27 = *(_BYTE *)(v0 + v21[16]);
  *(_QWORD *)(v5 + 648) = v6;
  *(_BYTE *)(v5 + 624) = v27;
  *(_QWORD *)(v5 + 656) = 0x646565705378616DLL;
  *(_QWORD *)(v5 + 664) = 0xE800000000000000;
  v28 = *(_QWORD *)(v0 + v21[17]);
  if (v28)
  {
    v29 = type metadata accessor for DialogLength();
    v30 = v28;
  }
  else
  {
    v30 = 0;
    v29 = 0;
    *(_OWORD *)(v5 + 680) = 0u;
  }
  *(_QWORD *)(v5 + 672) = v30;
  *(_QWORD *)(v5 + 696) = v29;
  *(_QWORD *)(v5 + 704) = 0x64656570536E696DLL;
  *(_QWORD *)(v5 + 712) = 0xE800000000000000;
  v31 = *(_QWORD *)(v0 + v21[18]);
  if (v31)
  {
    v32 = type metadata accessor for DialogLength();
    v33 = v31;
  }
  else
  {
    v33 = 0;
    v32 = 0;
    *(_OWORD *)(v5 + 728) = 0u;
  }
  *(_QWORD *)(v5 + 720) = v33;
  *(_QWORD *)(v5 + 744) = v32;
  *(_QWORD *)(v5 + 752) = 0xD000000000000010;
  *(_QWORD *)(v5 + 760) = 0x800000024A61E800;
  v34 = *(_QWORD *)(v0 + v21[19]);
  if (v34)
  {
    v35 = type metadata accessor for DialogLength();
    v36 = v34;
  }
  else
  {
    v36 = 0;
    v35 = 0;
    *(_OWORD *)(v5 + 776) = 0u;
  }
  *(_QWORD *)(v5 + 768) = v36;
  *(_QWORD *)(v5 + 792) = v35;
  *(_QWORD *)(v5 + 800) = 0xD000000000000010;
  *(_QWORD *)(v5 + 808) = 0x800000024A61E820;
  v37 = *(_QWORD *)(v0 + v21[20]);
  if (v37)
  {
    v38 = type metadata accessor for DialogDuration();
    v39 = v37;
  }
  else
  {
    v39 = 0;
    v38 = 0;
    *(_OWORD *)(v5 + 824) = 0u;
  }
  *(_QWORD *)(v5 + 816) = v39;
  *(_QWORD *)(v5 + 840) = v38;
  *(_QWORD *)(v5 + 848) = 0xD000000000000014;
  *(_QWORD *)(v5 + 856) = 0x800000024A61E840;
  v40 = (uint64_t *)(v0 + v21[21]);
  if ((v40[1] & 1) != 0)
  {
    v41 = 0;
    *(_OWORD *)(v5 + 872) = 0u;
    v42 = 0;
  }
  else
  {
    v42 = *v40;
    v41 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v5 + 864) = v42;
  *(_QWORD *)(v5 + 888) = v41;
  *(_QWORD *)(v5 + 896) = 0x6953776F646E6977;
  *(_QWORD *)(v5 + 904) = 0xEA0000000000657ALL;
  v43 = (uint64_t *)(v0 + v21[22]);
  if ((v43[1] & 1) != 0)
  {
    v44 = 0;
    *(_OWORD *)(v5 + 920) = 0u;
    v45 = 0;
  }
  else
  {
    v45 = *v43;
    v44 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v5 + 912) = v45;
  *(_QWORD *)(v5 + 936) = v44;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return v5;
}

uint64_t WorkoutVoiceFeedbackLapCompletionPaceParameters.asKeyValuePairs()()
{
  return WorkoutVoiceFeedbackLapCompletionPaceParameters.asKeyValuePairs()(0x7865646E4970616CLL, 0xE800000000000000, type metadata accessor for WorkoutVoiceFeedbackLapCompletionPaceParameters);
}

uint64_t WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters.asKeyValuePairs()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t *boxed_opaque_existential_0;
  uint64_t v19;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24A61CAD0;
  *(_QWORD *)(v4 + 32) = 0x6E6F697461727564;
  *(_QWORD *)(v4 + 40) = 0xE800000000000000;
  v5 = *v0;
  if (*v0)
  {
    v6 = type metadata accessor for DialogDuration();
    v7 = v5;
  }
  else
  {
    v7 = 0;
    v6 = 0;
    *(_QWORD *)(v4 + 56) = 0;
    *(_QWORD *)(v4 + 64) = 0;
  }
  *(_QWORD *)(v4 + 48) = v7;
  *(_QWORD *)(v4 + 72) = v6;
  *(_QWORD *)(v4 + 80) = 0xD000000000000017;
  *(_QWORD *)(v4 + 88) = 0x800000024A61E2A0;
  v8 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v4 + 96) = *((_BYTE *)v0 + 8);
  *(_QWORD *)(v4 + 120) = v8;
  strcpy((char *)(v4 + 128), "paceDuration");
  *(_BYTE *)(v4 + 141) = 0;
  *(_WORD *)(v4 + 142) = -5120;
  v9 = v0[2];
  if (v9)
  {
    v10 = type metadata accessor for DialogDuration();
    v11 = v9;
  }
  else
  {
    v11 = 0;
    v10 = 0;
    *(_QWORD *)(v4 + 152) = 0;
    *(_QWORD *)(v4 + 160) = 0;
  }
  *(_QWORD *)(v4 + 144) = v11;
  *(_QWORD *)(v4 + 168) = v10;
  *(_QWORD *)(v4 + 176) = 0x74696C7073;
  *(_QWORD *)(v4 + 184) = 0xE500000000000000;
  if ((v0[4] & 1) != 0)
  {
    v12 = 0;
    *(_QWORD *)(v4 + 200) = 0;
    *(_QWORD *)(v4 + 208) = 0;
    v13 = 0;
  }
  else
  {
    v13 = v0[3];
    v12 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v4 + 192) = v13;
  *(_QWORD *)(v4 + 216) = v12;
  *(_QWORD *)(v4 + 224) = 1953066613;
  *(_QWORD *)(v4 + 232) = 0xE400000000000000;
  v14 = type metadata accessor for WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters(0);
  outlined init with copy of URL?((uint64_t)v0 + *(int *)(v14 + 32), (uint64_t)v3, &demangling cache variable for type metadata for SpeakableString?);
  v15 = type metadata accessor for SpeakableString();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v3, 1, v15) == 1)
  {
    swift_retain();
    swift_retain();
    outlined destroy of Any?((uint64_t)v3, &demangling cache variable for type metadata for SpeakableString?);
    *(_OWORD *)(v4 + 240) = 0u;
    *(_OWORD *)(v4 + 256) = 0u;
  }
  else
  {
    *(_QWORD *)(v4 + 264) = v15;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v4 + 240));
    (*(void (**)(uint64_t *, char *, uint64_t))(v16 + 32))(boxed_opaque_existential_0, v3, v15);
    swift_retain();
    swift_retain();
  }
  return v4;
}

uint64_t WorkoutVoiceFeedbackTransitionedNotableDistanceSpeedParameters.asKeyValuePairs()()
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
  _BYTE v10[16];
  _BYTE v11[8];
  _BYTE v12[8];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_24A61CB10;
  *(_QWORD *)(v1 + 32) = 0x6E6F697461727564;
  *(_QWORD *)(v1 + 40) = 0xE800000000000000;
  outlined init with take of BelowTargetZoneModel?(v0, (uint64_t)v12, &demangling cache variable for type metadata for DialogDuration?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v12, (uint64_t)&v13, &demangling cache variable for type metadata for DialogDuration?);
  v2 = v13;
  if (v13)
  {
    v3 = type metadata accessor for DialogDuration();
  }
  else
  {
    v3 = 0;
    *(_QWORD *)(v1 + 56) = 0;
    *(_QWORD *)(v1 + 64) = 0;
  }
  *(_QWORD *)(v1 + 48) = v2;
  *(_QWORD *)(v1 + 72) = v3;
  *(_QWORD *)(v1 + 80) = 0xD000000000000017;
  *(_QWORD *)(v1 + 88) = 0x800000024A61E2A0;
  v4 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v1 + 96) = *(_BYTE *)(v0 + 8);
  *(_QWORD *)(v1 + 120) = v4;
  *(_QWORD *)(v1 + 128) = 0x6874676E656CLL;
  *(_QWORD *)(v1 + 136) = 0xE600000000000000;
  outlined init with take of BelowTargetZoneModel?(v0 + 16, (uint64_t)v11, &demangling cache variable for type metadata for DialogLength?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v11, (uint64_t)&v14, &demangling cache variable for type metadata for DialogLength?);
  v5 = v14;
  if (v14)
  {
    v6 = type metadata accessor for DialogLength();
  }
  else
  {
    v6 = 0;
    *(_QWORD *)(v1 + 152) = 0;
    *(_QWORD *)(v1 + 160) = 0;
  }
  *(_QWORD *)(v1 + 144) = v5;
  *(_QWORD *)(v1 + 168) = v6;
  *(_QWORD *)(v1 + 176) = 0x74696C7073;
  *(_QWORD *)(v1 + 184) = 0xE500000000000000;
  outlined init with take of BelowTargetZoneModel?(v0 + 24, (uint64_t)v10, &demangling cache variable for type metadata for Double?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v10, (uint64_t)&v15, &demangling cache variable for type metadata for Double?);
  if ((v16 & 1) != 0)
  {
    v7 = 0;
    *(_QWORD *)(v1 + 200) = 0;
    *(_QWORD *)(v1 + 208) = 0;
    v8 = 0;
  }
  else
  {
    v7 = MEMORY[0x24BEE13C8];
    v8 = v15;
  }
  *(_QWORD *)(v1 + 192) = v8;
  *(_QWORD *)(v1 + 216) = v7;
  outlined retain of DialogLength?((uint64_t)v12);
  outlined retain of DialogLength?((uint64_t)v11);
  return v1;
}

uint64_t WorkoutVoiceFeedbackZoneEnteredPaceParameters.asKeyValuePairs()()
{
  return WorkoutVoiceFeedbackLapCompletionPaceParameters.asKeyValuePairs()(0x63697274656DLL, 0xE600000000000000, type metadata accessor for WorkoutVoiceFeedbackZoneEnteredPaceParameters);
}

uint64_t WorkoutVoiceFeedbackLapCompletionPaceParameters.asKeyValuePairs()(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  uint64_t *boxed_opaque_existential_0;
  uint64_t v23;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v10 = swift_allocObject();
  v11 = v10;
  *(_OWORD *)(v10 + 16) = xmmword_24A61CB10;
  *(_QWORD *)(v10 + 32) = 0xD000000000000017;
  *(_QWORD *)(v10 + 40) = 0x800000024A61E2A0;
  v12 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v10 + 48) = *(_BYTE *)v3;
  *(_QWORD *)(v10 + 72) = v12;
  *(_QWORD *)(v10 + 80) = a1;
  *(_QWORD *)(v10 + 88) = a2;
  if ((*(_BYTE *)(v3 + 16) & 1) != 0)
  {
    v13 = 0;
    *(_QWORD *)(v10 + 104) = 0;
    *(_QWORD *)(v10 + 112) = 0;
    v14 = 0;
  }
  else
  {
    v14 = *(_QWORD *)(v3 + 8);
    v13 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v10 + 96) = v14;
  *(_QWORD *)(v10 + 120) = v13;
  strcpy((char *)(v10 + 128), "paceDuration");
  *(_BYTE *)(v10 + 141) = 0;
  *(_WORD *)(v10 + 142) = -5120;
  v15 = *(_QWORD *)(v3 + 24);
  if (v15)
  {
    v16 = type metadata accessor for DialogDuration();
    v17 = v15;
  }
  else
  {
    v17 = 0;
    v16 = 0;
    *(_QWORD *)(v11 + 152) = 0;
    *(_QWORD *)(v11 + 160) = 0;
  }
  *(_QWORD *)(v11 + 144) = v17;
  *(_QWORD *)(v11 + 168) = v16;
  *(_QWORD *)(v11 + 176) = 1953066613;
  *(_QWORD *)(v11 + 184) = 0xE400000000000000;
  v18 = a3(0);
  outlined init with copy of URL?(v3 + *(int *)(v18 + 28), (uint64_t)v9, &demangling cache variable for type metadata for SpeakableString?);
  v19 = type metadata accessor for SpeakableString();
  v20 = *(_QWORD *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v9, 1, v19) == 1)
  {
    swift_retain();
    outlined destroy of Any?((uint64_t)v9, &demangling cache variable for type metadata for SpeakableString?);
    *(_OWORD *)(v11 + 192) = 0u;
    *(_OWORD *)(v11 + 208) = 0u;
  }
  else
  {
    *(_QWORD *)(v11 + 216) = v19;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v11 + 192));
    (*(void (**)(uint64_t *, char *, uint64_t))(v20 + 32))(boxed_opaque_existential_0, v9, v19);
    swift_retain();
  }
  return v11;
}

uint64_t WorkoutVoiceFeedbackZoneExitedAbovePaceParameters.asKeyValuePairs()()
{
  return WorkoutVoiceFeedbackZoneExitedAbovePaceParameters.asKeyValuePairs()(type metadata accessor for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters);
}

uint64_t WorkoutVoiceFeedbackZoneExitedBelowPaceParameters.asKeyValuePairs()()
{
  return WorkoutVoiceFeedbackZoneExitedAbovePaceParameters.asKeyValuePairs()(type metadata accessor for WorkoutVoiceFeedbackZoneExitedBelowPaceParameters);
}

uint64_t WorkoutVoiceFeedbackZoneExitedAbovePaceParameters.asKeyValuePairs()(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  uint64_t *boxed_opaque_existential_0;
  uint64_t v19;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v6 = swift_allocObject();
  v7 = v6;
  *(_OWORD *)(v6 + 16) = xmmword_24A61CAD0;
  *(_QWORD *)(v6 + 32) = 0xD000000000000017;
  *(_QWORD *)(v6 + 40) = 0x800000024A61E2A0;
  v8 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v6 + 48) = *(_BYTE *)v1;
  *(_QWORD *)(v6 + 72) = v8;
  *(_QWORD *)(v6 + 80) = 0xD000000000000011;
  *(_QWORD *)(v6 + 88) = 0x800000024A61DDC0;
  *(_BYTE *)(v6 + 96) = *(_BYTE *)(v1 + 1);
  *(_QWORD *)(v6 + 120) = v8;
  *(_QWORD *)(v6 + 128) = 0x63697274656DLL;
  *(_QWORD *)(v6 + 136) = 0xE600000000000000;
  if ((*(_BYTE *)(v1 + 16) & 1) != 0)
  {
    v9 = 0;
    *(_QWORD *)(v6 + 152) = 0;
    *(_QWORD *)(v6 + 160) = 0;
    v10 = 0;
  }
  else
  {
    v10 = *(_QWORD *)(v1 + 8);
    v9 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v6 + 144) = v10;
  *(_QWORD *)(v6 + 168) = v9;
  strcpy((char *)(v6 + 176), "paceDuration");
  *(_BYTE *)(v6 + 189) = 0;
  *(_WORD *)(v6 + 190) = -5120;
  v11 = *(_QWORD *)(v1 + 24);
  if (v11)
  {
    v12 = type metadata accessor for DialogDuration();
    v13 = v11;
  }
  else
  {
    v13 = 0;
    v12 = 0;
    *(_QWORD *)(v7 + 200) = 0;
    *(_QWORD *)(v7 + 208) = 0;
  }
  *(_QWORD *)(v7 + 192) = v13;
  *(_QWORD *)(v7 + 216) = v12;
  *(_QWORD *)(v7 + 224) = 1953066613;
  *(_QWORD *)(v7 + 232) = 0xE400000000000000;
  v14 = a1(0);
  outlined init with copy of URL?(v1 + *(int *)(v14 + 32), (uint64_t)v5, &demangling cache variable for type metadata for SpeakableString?);
  v15 = type metadata accessor for SpeakableString();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v5, 1, v15) == 1)
  {
    swift_retain();
    outlined destroy of Any?((uint64_t)v5, &demangling cache variable for type metadata for SpeakableString?);
    *(_OWORD *)(v7 + 240) = 0u;
    *(_OWORD *)(v7 + 256) = 0u;
  }
  else
  {
    *(_QWORD *)(v7 + 264) = v15;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v7 + 240));
    (*(void (**)(uint64_t *, char *, uint64_t))(v16 + 32))(boxed_opaque_existential_0, v5, v15);
    swift_retain();
  }
  return v7;
}

uint64_t WorkoutVoiceFeedbackZoneExitedAboveSpeedParameters.asKeyValuePairs()(__int16 a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_24A61CB10;
  *(_QWORD *)(v8 + 32) = 0xD000000000000017;
  *(_QWORD *)(v8 + 40) = 0x800000024A61E2A0;
  v9 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v8 + 48) = a1 & 1;
  *(_QWORD *)(v8 + 72) = v9;
  *(_QWORD *)(v8 + 80) = 0xD000000000000011;
  *(_QWORD *)(v8 + 88) = 0x800000024A61DDC0;
  *(_BYTE *)(v8 + 96) = HIBYTE(a1) & 1;
  *(_QWORD *)(v8 + 120) = v9;
  *(_QWORD *)(v8 + 128) = 0x6874676E656CLL;
  *(_QWORD *)(v8 + 136) = 0xE600000000000000;
  if (a2)
  {
    v10 = type metadata accessor for DialogLength();
    v11 = a2;
  }
  else
  {
    v11 = 0;
    v10 = 0;
    *(_QWORD *)(v8 + 152) = 0;
    *(_QWORD *)(v8 + 160) = 0;
  }
  *(_QWORD *)(v8 + 144) = v11;
  *(_QWORD *)(v8 + 168) = v10;
  *(_QWORD *)(v8 + 176) = 0x63697274656DLL;
  *(_QWORD *)(v8 + 184) = 0xE600000000000000;
  if ((a4 & 1) != 0)
  {
    a3 = 0;
    v12 = 0;
    *(_QWORD *)(v8 + 200) = 0;
    *(_QWORD *)(v8 + 208) = 0;
  }
  else
  {
    v12 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v8 + 192) = a3;
  *(_QWORD *)(v8 + 216) = v12;
  swift_retain();
  return v8;
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:)(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 48) = a1;
  return swift_task_switch();
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:)()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  int *v3;
  _QWORD *v4;
  uint64_t (*v6)(unint64_t, unint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = 0xD000000000000017;
  *(_QWORD *)(v2 + 40) = 0x800000024A61E2A0;
  *(_QWORD *)(v2 + 72) = MEMORY[0x24BEE1328];
  v3 = (int *)MEMORY[0x24BE92868];
  *(_BYTE *)(v2 + 48) = v1;
  v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(_QWORD *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_24A61B890;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v4;
  *v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD00000000000002ALL, 0x800000024A61E6B0, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 40) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.intervalEnded(executeSashGroupOnWatch:)(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 48) = a1;
  return swift_task_switch();
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.intervalEnded(executeSashGroupOnWatch:)()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  int *v3;
  _QWORD *v4;
  uint64_t (*v6)(unint64_t, unint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = 0xD000000000000017;
  *(_QWORD *)(v2 + 40) = 0x800000024A61E2A0;
  *(_QWORD *)(v2 + 72) = MEMORY[0x24BEE1328];
  v3 = (int *)MEMORY[0x24BE92868];
  *(_BYTE *)(v2 + 48) = v1;
  v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(_QWORD *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_24A61B890;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v4;
  *v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD000000000000022, 0x800000024A61E680, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.moveRingCompleted(executeSashGroupOnWatch:)(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 48) = a1;
  return swift_task_switch();
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.moveRingCompleted(executeSashGroupOnWatch:)()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  int *v3;
  _QWORD *v4;
  uint64_t (*v6)(unint64_t, unint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = 0xD000000000000017;
  *(_QWORD *)(v2 + 40) = 0x800000024A61E2A0;
  *(_QWORD *)(v2 + 72) = MEMORY[0x24BEE1328];
  v3 = (int *)MEMORY[0x24BE92868];
  *(_BYTE *)(v2 + 48) = v1;
  v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(_QWORD *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_24A61B890;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v4;
  *v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD000000000000026, 0x800000024A61E650, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceAheadOfGhost(executeSashGroupOnWatch:)(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 48) = a1;
  return swift_task_switch();
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceAheadOfGhost(executeSashGroupOnWatch:)()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  int *v3;
  _QWORD *v4;
  uint64_t (*v6)(unint64_t, unint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = 0xD000000000000017;
  *(_QWORD *)(v2 + 40) = 0x800000024A61E2A0;
  *(_QWORD *)(v2 + 72) = MEMORY[0x24BEE1328];
  v3 = (int *)MEMORY[0x24BE92868];
  *(_BYTE *)(v2 + 48) = v1;
  v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(_QWORD *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_24A61B890;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v4;
  *v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD000000000000025, 0x800000024A61E620, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceBehindGhost(executeSashGroupOnWatch:)(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 48) = a1;
  return swift_task_switch();
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceBehindGhost(executeSashGroupOnWatch:)()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  int *v3;
  _QWORD *v4;
  uint64_t (*v6)(unint64_t, unint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = 0xD000000000000017;
  *(_QWORD *)(v2 + 40) = 0x800000024A61E2A0;
  *(_QWORD *)(v2 + 72) = MEMORY[0x24BEE1328];
  v3 = (int *)MEMORY[0x24BE92868];
  *(_BYTE *)(v2 + 48) = v1;
  v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(_QWORD *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_24A61B890;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v4;
  *v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD000000000000024, 0x800000024A61E5F0, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceExpired(executeSashGroupOnWatch:)(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 48) = a1;
  return swift_task_switch();
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceExpired(executeSashGroupOnWatch:)()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  int *v3;
  _QWORD *v4;
  uint64_t (*v6)(unint64_t, unint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = 0xD000000000000017;
  *(_QWORD *)(v2 + 40) = 0x800000024A61E2A0;
  *(_QWORD *)(v2 + 72) = MEMORY[0x24BEE1328];
  v3 = (int *)MEMORY[0x24BE92868];
  *(_BYTE *)(v2 + 48) = v1;
  v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(_QWORD *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_24A61B890;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v4;
  *v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.raceExpired(executeSashGroupOnWatch:);
  return v6(0xD000000000000020, 0x800000024A61E5C0, v2);
}

{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceExpired(executeSashGroupOnWatch:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 40) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceOffRoute(executeSashGroupOnWatch:)(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 48) = a1;
  return swift_task_switch();
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceOffRoute(executeSashGroupOnWatch:)()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  int *v3;
  _QWORD *v4;
  uint64_t (*v6)(unint64_t, unint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = 0xD000000000000017;
  *(_QWORD *)(v2 + 40) = 0x800000024A61E2A0;
  *(_QWORD *)(v2 + 72) = MEMORY[0x24BEE1328];
  v3 = (int *)MEMORY[0x24BE92868];
  *(_BYTE *)(v2 + 48) = v1;
  v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(_QWORD *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_24A61B890;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v4;
  *v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD000000000000021, 0x800000024A61E590, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceOnRoute(executeSashGroupOnWatch:)(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 48) = a1;
  return swift_task_switch();
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceOnRoute(executeSashGroupOnWatch:)()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  int *v3;
  _QWORD *v4;
  uint64_t (*v6)(unint64_t, unint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = 0xD000000000000017;
  *(_QWORD *)(v2 + 40) = 0x800000024A61E2A0;
  *(_QWORD *)(v2 + 72) = MEMORY[0x24BEE1328];
  v3 = (int *)MEMORY[0x24BE92868];
  *(_BYTE *)(v2 + 48) = v1;
  v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(_QWORD *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_24A61B890;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v4;
  *v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD000000000000020, 0x800000024A61E560, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceRouteCompleteRaceWon(executeSashGroupOnWatch:)(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 48) = a1;
  return swift_task_switch();
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceRouteCompleteRaceWon(executeSashGroupOnWatch:)()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  int *v3;
  _QWORD *v4;
  uint64_t (*v6)(unint64_t, unint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = 0xD000000000000017;
  *(_QWORD *)(v2 + 40) = 0x800000024A61E2A0;
  *(_QWORD *)(v2 + 72) = MEMORY[0x24BEE1328];
  v3 = (int *)MEMORY[0x24BE92868];
  *(_BYTE *)(v2 + 48) = v1;
  v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(_QWORD *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_24A61B890;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v4;
  *v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD00000000000002DLL, 0x800000024A61E530, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceRouteCompletedRaceLost(executeSashGroupOnWatch:)(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 48) = a1;
  return swift_task_switch();
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceRouteCompletedRaceLost(executeSashGroupOnWatch:)()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  int *v3;
  _QWORD *v4;
  uint64_t (*v6)(unint64_t, unint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = 0xD000000000000017;
  *(_QWORD *)(v2 + 40) = 0x800000024A61E2A0;
  *(_QWORD *)(v2 + 72) = MEMORY[0x24BEE1328];
  v3 = (int *)MEMORY[0x24BE92868];
  *(_BYTE *)(v2 + 48) = v1;
  v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(_QWORD *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_24A61B890;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v4;
  *v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD00000000000002FLL, 0x800000024A61E500, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.trackStatusChanged(executeSashGroupOnWatch:)(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 48) = a1;
  return swift_task_switch();
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.trackStatusChanged(executeSashGroupOnWatch:)()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  int *v3;
  _QWORD *v4;
  uint64_t (*v6)(unint64_t, unint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = 0xD000000000000017;
  *(_QWORD *)(v2 + 40) = 0x800000024A61E2A0;
  *(_QWORD *)(v2 + 72) = MEMORY[0x24BEE1328];
  v3 = (int *)MEMORY[0x24BE92868];
  *(_BYTE *)(v2 + 48) = v1;
  v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(_QWORD *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_24A61B890;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v4;
  *v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD000000000000027, 0x800000024A61E4D0, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.workoutPaused(executeSashGroupOnWatch:)(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 48) = a1;
  return swift_task_switch();
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.workoutPaused(executeSashGroupOnWatch:)()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  int *v3;
  _QWORD *v4;
  uint64_t (*v6)(unint64_t, unint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = 0xD000000000000017;
  *(_QWORD *)(v2 + 40) = 0x800000024A61E2A0;
  *(_QWORD *)(v2 + 72) = MEMORY[0x24BEE1328];
  v3 = (int *)MEMORY[0x24BE92868];
  *(_BYTE *)(v2 + 48) = v1;
  v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(_QWORD *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_24A61B890;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v4;
  *v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD000000000000022, 0x800000024A61E4A0, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.workoutResumed(executeSashGroupOnWatch:)(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 48) = a1;
  return swift_task_switch();
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.workoutResumed(executeSashGroupOnWatch:)()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  int *v3;
  _QWORD *v4;
  uint64_t (*v6)(unint64_t, unint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = 0xD000000000000017;
  *(_QWORD *)(v2 + 40) = 0x800000024A61E2A0;
  *(_QWORD *)(v2 + 72) = MEMORY[0x24BEE1328];
  v3 = (int *)MEMORY[0x24BE92868];
  *(_BYTE *)(v2 + 48) = v1;
  v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(_QWORD *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_24A61B890;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v4;
  *v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD000000000000023, 0x800000024A61E470, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.__allocating_init(templateDir:options:globals:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;

  v4 = type metadata accessor for CATOption();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  outlined init with copy of URL?(a1, (uint64_t)v10, &demangling cache variable for type metadata for URL?);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  v11 = CATWrapper.init(templateDir:options:globals:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  outlined destroy of Any?(a1, &demangling cache variable for type metadata for URL?);
  return v11;
}

uint64_t ObjC metadata update function for WorkoutVoiceFeedbackCATPatternsExecutor()
{
  return type metadata accessor for WorkoutVoiceFeedbackCATPatternsExecutor(0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.segmentMarked(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = a3;
  *(_BYTE *)(v3 + 56) = a1;
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.segmentMarked(executeSashGroupOnWatch:_:)()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(unint64_t, unint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 32) = 0xD000000000000017;
  *(_QWORD *)(v3 + 40) = 0x800000024A61E2A0;
  v4 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v3 + 48) = v1;
  *(_QWORD *)(v3 + 72) = v4;
  *(_QWORD *)(v3 + 80) = 0x746E656D676573;
  *(_QWORD *)(v3 + 88) = 0xE700000000000000;
  *(_QWORD *)(v3 + 120) = MEMORY[0x24BEE13C8];
  v7 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                           + MEMORY[0x24BE92868]);
  *(_QWORD *)(v0 + 32) = v3;
  *(_OWORD *)(v3 + 16) = xmmword_24A61C650;
  *(double *)(v3 + 96) = (double)v2;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v5;
  *v5 = v0;
  v5[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.segmentMarked(executeSashGroupOnWatch:_:);
  return v7(0xD000000000000022, 0x800000024A61E860, v3);
}

{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.segmentMarked(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 48) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableTime(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, double a3)
{
  uint64_t v3;

  *(double *)(v3 + 24) = a3;
  *(_QWORD *)(v3 + 16) = a2;
  *(_BYTE *)(v3 + 72) = a1;
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableTime(executeSashGroupOnWatch:_:)()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(unint64_t, unint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 72);
  type metadata accessor for DialogDuration.Builder();
  swift_allocObject();
  DialogDuration.Builder.init()();
  dispatch thunk of DialogDuration.Builder.withSecs(_:)();
  swift_release();
  v2 = dispatch thunk of DialogDuration.Builder.build()();
  *(_QWORD *)(v0 + 32) = v2;
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v3 = swift_allocObject();
  *(_QWORD *)(v0 + 40) = v3;
  *(_OWORD *)(v3 + 16) = xmmword_24A61C650;
  *(_QWORD *)(v3 + 32) = 0x6E6F697461727564;
  *(_QWORD *)(v3 + 40) = 0xE800000000000000;
  v4 = type metadata accessor for DialogDuration();
  *(_QWORD *)(v3 + 48) = v2;
  *(_QWORD *)(v3 + 88) = 0x800000024A61E2A0;
  *(_QWORD *)(v3 + 120) = MEMORY[0x24BEE1328];
  *(_BYTE *)(v3 + 96) = v1;
  v7 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                           + MEMORY[0x24BE92868]);
  *(_QWORD *)(v3 + 72) = v4;
  *(_QWORD *)(v3 + 80) = 0xD000000000000017;
  swift_retain();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v5;
  *v5 = v0;
  v5[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableTime(executeSashGroupOnWatch:_:);
  return v7(0xD00000000000002CLL, 0x800000024A61E950, v3);
}

{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 64));
}

{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableTime(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 56) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_QWORD *)(v4 + 64) = a1;
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistanceSpeed(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 96) = a2;
  *(_QWORD *)(v3 + 104) = a3;
  *(_BYTE *)(v3 + 49) = a1;
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistanceSpeed(executeSashGroupOnWatch:_:)()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(unint64_t, unint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 104);
  *(_QWORD *)(v0 + 56) = 0;
  *(_BYTE *)(v0 + 64) = *(_BYTE *)(v0 + 49);
  *(_QWORD *)(v0 + 72) = 0;
  *(_QWORD *)(v0 + 80) = 0;
  *(_BYTE *)(v0 + 88) = 1;
  closure #1 in DistanceSplitModel.executePattern(wrapper:)(v0 + 56, v1);
  v2 = *(_OWORD *)(v0 + 72);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 56);
  *(_OWORD *)(v0 + 32) = v2;
  *(_BYTE *)(v0 + 48) = *(_BYTE *)(v0 + 88);
  v3 = WorkoutVoiceFeedbackTransitionedNotableDistanceSpeedParameters.asKeyValuePairs()();
  *(_QWORD *)(v0 + 112) = v3;
  v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                           + MEMORY[0x24BE92868]);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v4;
  *v4 = v0;
  v4[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistanceSpeed(executeSashGroupOnWatch:_:);
  return v6(0xD000000000000035, 0x800000024A61EAA0, v3);
}

{
  uint64_t v0;

  swift_release();
  swift_release();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 136));
}

{
  uint64_t v0;

  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistanceSpeed(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 128) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_QWORD *)(v4 + 136) = a1;
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistancePace(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = a3;
  *(_BYTE *)(v3 + 80) = a1;
  *(_QWORD *)(v3 + 32) = type metadata accessor for WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters(0);
  *(_QWORD *)(v3 + 40) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistancePace(executeSashGroupOnWatch:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(unint64_t, unint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_BYTE *)(v0 + 80);
  v4 = v1 + *(int *)(*(_QWORD *)(v0 + 32) + 32);
  v5 = type metadata accessor for SpeakableString();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(_QWORD *)v1 = 0;
  *(_BYTE *)(v1 + 8) = v3;
  *(_QWORD *)(v1 + 16) = 0;
  *(_QWORD *)(v1 + 24) = 0;
  *(_BYTE *)(v1 + 32) = 1;
  closure #2 in DistanceSplitModel.executePattern(wrapper:)(v1, v2);
  v6 = WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters.asKeyValuePairs()();
  *(_QWORD *)(v0 + 48) = v6;
  v9 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                           + MEMORY[0x24BE92868]);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v7;
  *v7 = v0;
  v7[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistancePace(executeSashGroupOnWatch:_:);
  return v9(0xD000000000000034, 0x800000024A61EAE0, v6);
}

{
  uint64_t v0;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 40), type metadata accessor for WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters);
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 72));
}

{
  uint64_t v0;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 40), type metadata accessor for WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistancePace(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 64) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_QWORD *)(v4 + 72) = a1;
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionSpeed(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = a3;
  *(_BYTE *)(v3 + 80) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  *(_QWORD *)(v3 + 32) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionSpeed(executeSashGroupOnWatch:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t (*v13)(unint64_t, unint64_t, uint64_t);

  v2 = *(uint64_t **)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = *(_BYTE *)(v0 + 80);
  v5 = v2[3];
  v4 = v2[4];
  type metadata accessor for DialogLength.Builder();
  swift_allocObject();
  MEMORY[0x24BD14B88]();
  dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
  swift_release();
  String.toDialogUnit.getter(v5, v4);
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  v6 = type metadata accessor for SpeakableString();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v1, 0, 1, v6);
  dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
  swift_release();
  outlined destroy of Any?(v1, &demangling cache variable for type metadata for SpeakableString?);
  v7 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
  *(_QWORD *)(v0 + 40) = v7;
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v8 = swift_allocObject();
  *(_QWORD *)(v0 + 48) = v8;
  *(_OWORD *)(v8 + 16) = xmmword_24A61CB20;
  *(_QWORD *)(v8 + 32) = 0xD000000000000017;
  *(_QWORD *)(v8 + 40) = 0x800000024A61E2A0;
  *(_QWORD *)(v8 + 72) = MEMORY[0x24BEE1328];
  *(_BYTE *)(v8 + 48) = v3;
  v9 = (double)v2[1];
  *(_QWORD *)(v8 + 80) = 0x7865646E4970616CLL;
  *(_QWORD *)(v8 + 88) = 0xE800000000000000;
  v10 = MEMORY[0x24BEE13C8];
  *(double *)(v8 + 96) = v9;
  *(_QWORD *)(v8 + 120) = v10;
  *(_QWORD *)(v8 + 128) = 0x6874676E656CLL;
  *(_QWORD *)(v8 + 136) = 0xE600000000000000;
  *(_QWORD *)(v8 + 168) = type metadata accessor for DialogLength();
  *(_QWORD *)(v8 + 144) = v7;
  v13 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                            + MEMORY[0x24BE92868]);
  swift_retain();
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v11;
  *v11 = v0;
  v11[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionSpeed(executeSashGroupOnWatch:_:);
  return v13(0xD000000000000027, 0x800000024A61EA10, v8);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionSpeed(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 64) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_QWORD *)(v4 + 72) = a1;
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionPace(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v6;

  *(_QWORD *)(v6 + 40) = a4;
  *(_QWORD *)(v6 + 48) = a5;
  *(double *)(v6 + 32) = a6;
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  *(_BYTE *)(v6 + 112) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  *(_QWORD *)(v6 + 56) = swift_task_alloc();
  *(_QWORD *)(v6 + 64) = type metadata accessor for WorkoutVoiceFeedbackLapCompletionPaceParameters(0);
  *(_QWORD *)(v6 + 72) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionPace(executeSashGroupOnWatch:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v14)(unint64_t, unint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_BYTE *)(v0 + 112);
  v6 = v1 + *(int *)(*(_QWORD *)(v0 + 64) + 28);
  v7 = *(_QWORD *)(v0 + 24);
  v8 = type metadata accessor for SpeakableString();
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56);
  v9(v6, 1, 1, v8);
  *(_BYTE *)v1 = v5;
  *(_QWORD *)(v1 + 24) = 0;
  *(double *)(v1 + 8) = (double)v7;
  *(_BYTE *)(v1 + 16) = 0;
  type metadata accessor for DialogDuration.Builder();
  swift_allocObject();
  DialogDuration.Builder.init()();
  dispatch thunk of DialogDuration.Builder.withSecs(_:)();
  swift_release();
  v10 = dispatch thunk of DialogDuration.Builder.build()();
  swift_release();
  *(_QWORD *)(v1 + 24) = v10;
  String.toDialogUnit.getter(v4, v3);
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  v9(v2, 0, 1, v8);
  outlined assign with take of SpeakableString?(v2, v6);
  v11 = WorkoutVoiceFeedbackLapCompletionPaceParameters.asKeyValuePairs()(0x7865646E4970616CLL, 0xE800000000000000, type metadata accessor for WorkoutVoiceFeedbackLapCompletionPaceParameters);
  *(_QWORD *)(v0 + 80) = v11;
  v14 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                            + MEMORY[0x24BE92868]);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v12;
  *v12 = v0;
  v12[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionPace(executeSashGroupOnWatch:_:);
  return v14(0xD000000000000026, 0x800000024A61EA40, v11);
}

{
  uint64_t v0;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 72), type metadata accessor for WorkoutVoiceFeedbackLapCompletionPaceParameters);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 104));
}

{
  uint64_t v0;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 72), type metadata accessor for WorkoutVoiceFeedbackLapCompletionPaceParameters);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionPace(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 96) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_QWORD *)(v4 + 104) = a1;
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalCompletion(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 32) = a3;
  *(_QWORD *)(v5 + 40) = a4;
  *(double *)(v5 + 24) = a5;
  *(_QWORD *)(v5 + 16) = a2;
  *(_BYTE *)(v5 + 96) = a1;
  *(_QWORD *)(v5 + 48) = type metadata accessor for WorkoutVoiceFeedbackGoalCompletionParameters(0);
  *(_QWORD *)(v5 + 56) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalCompletion(executeSashGroupOnWatch:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(unint64_t, unint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v4 = *(double *)(v0 + 24);
  v5 = *(_BYTE *)(v0 + 96);
  v6 = v1 + *(int *)(*(_QWORD *)(v0 + 48) + 32);
  v7 = type metadata accessor for SpeakableString();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(_QWORD *)v1 = 0;
  *(_BYTE *)(v1 + 8) = v5;
  *(_QWORD *)(v1 + 16) = 0;
  *(_QWORD *)(v1 + 24) = 0;
  *(_BYTE *)(v1 + 32) = 1;
  specialized closure #1 in GoalCompletionModel.executePattern(wrapper:)(v1, v3, v2, v4);
  v8 = WorkoutVoiceFeedbackGoalCompletionParameters.asKeyValuePairs()(type metadata accessor for WorkoutVoiceFeedbackGoalCompletionParameters);
  *(_QWORD *)(v0 + 64) = v8;
  v11 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                            + MEMORY[0x24BE92868]);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v9;
  *v9 = v0;
  v9[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalCompletion(executeSashGroupOnWatch:_:);
  return v11(0xD000000000000023, 0x800000024A61EB20, v8);
}

{
  uint64_t v0;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 56), type metadata accessor for WorkoutVoiceFeedbackGoalCompletionParameters);
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 88));
}

{
  uint64_t v0;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 56), type metadata accessor for WorkoutVoiceFeedbackGoalCompletionParameters);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalCompletion(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 80) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_QWORD *)(v4 + 88) = a1;
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveNonPace(executeSashGroupOnWatch:isSingleThreshold:_:)(char a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a3;
  *(_QWORD *)(v4 + 24) = a4;
  *(_BYTE *)(v4 + 57) = a2;
  *(_BYTE *)(v4 + 56) = a1;
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveNonPace(executeSashGroupOnWatch:isSingleThreshold:_:)()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(unint64_t, unint64_t, uint64_t);

  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_BYTE *)(v0 + 57);
  v4 = *(_BYTE *)(v0 + 56);
  LOBYTE(v1) = *(_BYTE *)(v2 + 34);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v5 = swift_allocObject();
  *(_QWORD *)(v0 + 32) = v5;
  *(_OWORD *)(v5 + 16) = xmmword_24A61CB10;
  *(_QWORD *)(v5 + 32) = 0xD000000000000017;
  *(_QWORD *)(v5 + 40) = 0x800000024A61E2A0;
  v6 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v5 + 48) = v4;
  *(_QWORD *)(v5 + 72) = v6;
  *(_QWORD *)(v5 + 80) = 0xD000000000000011;
  *(_QWORD *)(v5 + 88) = 0x800000024A61DDC0;
  *(_QWORD *)(v5 + 120) = v6;
  *(_BYTE *)(v5 + 96) = v3;
  v7 = *(_QWORD *)(v2 + 8);
  *(_QWORD *)(v5 + 128) = 0x647574696E67616DLL;
  *(_QWORD *)(v5 + 136) = 0xE900000000000065;
  v8 = MEMORY[0x24BEE13C8];
  *(_QWORD *)(v5 + 144) = v7;
  *(_QWORD *)(v5 + 168) = v8;
  *(_QWORD *)(v5 + 176) = 0x63697274656DLL;
  *(_QWORD *)(v5 + 184) = 0xE600000000000000;
  *(_QWORD *)(v5 + 216) = v8;
  v11 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                            + MEMORY[0x24BE92868]);
  *(double *)(v5 + 192) = (double)v1;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v9;
  *v9 = v0;
  v9[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.segmentMarked(executeSashGroupOnWatch:_:);
  return v11(0xD00000000000002BLL, 0x800000024A61E980, v5);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveSpeed(executeSashGroupOnWatch:isSingleThreshold:_:)(char a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a3;
  *(_QWORD *)(v4 + 24) = a4;
  *(_BYTE *)(v4 + 81) = a2;
  *(_BYTE *)(v4 + 80) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  *(_QWORD *)(v4 + 32) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveSpeed(executeSashGroupOnWatch:isSingleThreshold:_:)(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  __int16 v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t (*v13)(unint64_t, unint64_t, uint64_t);

  v3 = *(_QWORD *)(v1 + 24);
  v2 = *(_QWORD *)(v1 + 32);
  v4 = *(unsigned __int8 *)(v1 + 81);
  v5 = *(unsigned __int8 *)(v1 + 80);
  LOBYTE(a1) = *(_BYTE *)(v3 + 34);
  v6 = (double)*(unint64_t *)&a1;
  type metadata accessor for DialogLength.Builder();
  swift_allocObject();
  MEMORY[0x24BD14B88]();
  dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
  swift_release();
  String.toDialogUnit.getter(*(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  v7 = type metadata accessor for SpeakableString();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v2, 0, 1, v7);
  dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
  swift_release();
  outlined destroy of Any?(v2, &demangling cache variable for type metadata for SpeakableString?);
  v8 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
  *(_QWORD *)(v1 + 40) = v8;
  swift_release();
  if (v4)
    v9 = 256;
  else
    v9 = 0;
  v10 = WorkoutVoiceFeedbackZoneExitedAboveSpeedParameters.asKeyValuePairs()(v9 | v5, v8, *(uint64_t *)&v6, 0);
  *(_QWORD *)(v1 + 48) = v10;
  v13 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                            + MEMORY[0x24BE92868]);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 56) = v11;
  *v11 = v1;
  v11[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveSpeed(executeSashGroupOnWatch:isSingleThreshold:_:);
  return v13(0xD000000000000029, 0x800000024A61E9B0, v10);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveSpeed(executeSashGroupOnWatch:isSingleThreshold:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 64) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_QWORD *)(v4 + 72) = a1;
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveSpeed(executeSashGroupOnWatch:isSingleThreshold:_:)()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 72));
}

{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAbovePace(executeSashGroupOnWatch:isSingleThreshold:_:)(char a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a3;
  *(_QWORD *)(v4 + 24) = a4;
  *(_BYTE *)(v4 + 89) = a2;
  *(_BYTE *)(v4 + 88) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  *(_QWORD *)(v4 + 32) = swift_task_alloc();
  *(_QWORD *)(v4 + 40) = type metadata accessor for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters(0);
  *(_QWORD *)(v4 + 48) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAbovePace(executeSashGroupOnWatch:isSingleThreshold:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  __n128 (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  __n128 v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v14)(unint64_t, unint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v4 = *(_BYTE *)(v0 + 89);
  v5 = *(_BYTE *)(v0 + 88);
  v6 = v1 + *(int *)(*(_QWORD *)(v0 + 40) + 32);
  v7 = type metadata accessor for SpeakableString();
  v8 = *(__n128 (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
  v9 = v8(v6, 1, 1, v7);
  *(_BYTE *)v1 = v5;
  *(_BYTE *)(v1 + 1) = v4;
  *(_QWORD *)(v1 + 24) = 0;
  v9.n128_u8[0] = *(_BYTE *)(v3 + 34);
  *(double *)(v1 + 8) = (double)v9.n128_u64[0];
  *(_BYTE *)(v1 + 16) = 0;
  type metadata accessor for DialogDuration.Builder();
  swift_allocObject();
  DialogDuration.Builder.init()();
  dispatch thunk of DialogDuration.Builder.withSecs(_:)();
  swift_release();
  v10 = dispatch thunk of DialogDuration.Builder.build()();
  swift_release();
  *(_QWORD *)(v1 + 24) = v10;
  String.toDialogUnit.getter(*(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  v8(v2, 0, 1, v7);
  outlined assign with take of SpeakableString?(v2, v6);
  v11 = WorkoutVoiceFeedbackZoneExitedAbovePaceParameters.asKeyValuePairs()(type metadata accessor for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters);
  *(_QWORD *)(v0 + 56) = v11;
  v14 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                            + MEMORY[0x24BE92868]);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v12;
  *v12 = v0;
  v12[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAbovePace(executeSashGroupOnWatch:isSingleThreshold:_:);
  return v14(0xD000000000000028, 0x800000024A61E9E0, v11);
}

{
  uint64_t v0;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 48), type metadata accessor for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 80));
}

{
  uint64_t v0;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 48), type metadata accessor for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAbovePace(executeSashGroupOnWatch:isSingleThreshold:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 72) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_QWORD *)(v4 + 80) = a1;
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowNonPace(executeSashGroupOnWatch:isSingleThreshold:_:)(char a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a3;
  *(_QWORD *)(v4 + 24) = a4;
  *(_BYTE *)(v4 + 57) = a2;
  *(_BYTE *)(v4 + 56) = a1;
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowNonPace(executeSashGroupOnWatch:isSingleThreshold:_:)()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(unint64_t, unint64_t, uint64_t);

  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_BYTE *)(v0 + 57);
  v4 = *(_BYTE *)(v0 + 56);
  LOBYTE(v1) = *(_BYTE *)(v2 + 34);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v5 = swift_allocObject();
  *(_QWORD *)(v0 + 32) = v5;
  *(_OWORD *)(v5 + 16) = xmmword_24A61CB10;
  *(_QWORD *)(v5 + 32) = 0xD000000000000017;
  *(_QWORD *)(v5 + 40) = 0x800000024A61E2A0;
  v6 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v5 + 48) = v4;
  *(_QWORD *)(v5 + 72) = v6;
  *(_QWORD *)(v5 + 80) = 0xD000000000000011;
  *(_QWORD *)(v5 + 88) = 0x800000024A61DDC0;
  *(_QWORD *)(v5 + 120) = v6;
  *(_BYTE *)(v5 + 96) = v3;
  v7 = *(_QWORD *)(v2 + 8);
  *(_QWORD *)(v5 + 128) = 0x647574696E67616DLL;
  *(_QWORD *)(v5 + 136) = 0xE900000000000065;
  v8 = MEMORY[0x24BEE13C8];
  *(_QWORD *)(v5 + 144) = v7;
  *(_QWORD *)(v5 + 168) = v8;
  *(_QWORD *)(v5 + 176) = 0x63697274656DLL;
  *(_QWORD *)(v5 + 184) = 0xE600000000000000;
  *(_QWORD *)(v5 + 216) = v8;
  v11 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                            + MEMORY[0x24BE92868]);
  *(double *)(v5 + 192) = (double)v1;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v9;
  *v9 = v0;
  v9[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowNonPace(executeSashGroupOnWatch:isSingleThreshold:_:);
  return v11(0xD00000000000002BLL, 0x800000024A61E890, v5);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowNonPace(executeSashGroupOnWatch:isSingleThreshold:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 48) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowSpeed(executeSashGroupOnWatch:isSingleThreshold:_:)(char a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a3;
  *(_QWORD *)(v4 + 24) = a4;
  *(_BYTE *)(v4 + 81) = a2;
  *(_BYTE *)(v4 + 80) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  *(_QWORD *)(v4 + 32) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowSpeed(executeSashGroupOnWatch:isSingleThreshold:_:)(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  __int16 v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t (*v13)(unint64_t, unint64_t, uint64_t);

  v3 = *(_QWORD *)(v1 + 24);
  v2 = *(_QWORD *)(v1 + 32);
  v4 = *(unsigned __int8 *)(v1 + 81);
  v5 = *(unsigned __int8 *)(v1 + 80);
  LOBYTE(a1) = *(_BYTE *)(v3 + 34);
  v6 = (double)*(unint64_t *)&a1;
  type metadata accessor for DialogLength.Builder();
  swift_allocObject();
  MEMORY[0x24BD14B88]();
  dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
  swift_release();
  String.toDialogUnit.getter(*(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  v7 = type metadata accessor for SpeakableString();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v2, 0, 1, v7);
  dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
  swift_release();
  outlined destroy of Any?(v2, &demangling cache variable for type metadata for SpeakableString?);
  v8 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
  *(_QWORD *)(v1 + 40) = v8;
  swift_release();
  if (v4)
    v9 = 256;
  else
    v9 = 0;
  v10 = WorkoutVoiceFeedbackZoneExitedAboveSpeedParameters.asKeyValuePairs()(v9 | v5, v8, *(uint64_t *)&v6, 0);
  *(_QWORD *)(v1 + 48) = v10;
  v13 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                            + MEMORY[0x24BE92868]);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 56) = v11;
  *v11 = v1;
  v11[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionSpeed(executeSashGroupOnWatch:_:);
  return v13(0xD000000000000029, 0x800000024A61E8C0, v10);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowPace(executeSashGroupOnWatch:isSingleThreshold:_:)(char a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a3;
  *(_QWORD *)(v4 + 24) = a4;
  *(_BYTE *)(v4 + 89) = a2;
  *(_BYTE *)(v4 + 88) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  *(_QWORD *)(v4 + 32) = swift_task_alloc();
  *(_QWORD *)(v4 + 40) = type metadata accessor for WorkoutVoiceFeedbackZoneExitedBelowPaceParameters(0);
  *(_QWORD *)(v4 + 48) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowPace(executeSashGroupOnWatch:isSingleThreshold:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  __n128 (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  __n128 v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v14)(unint64_t, unint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v4 = *(_BYTE *)(v0 + 89);
  v5 = *(_BYTE *)(v0 + 88);
  v6 = v1 + *(int *)(*(_QWORD *)(v0 + 40) + 32);
  v7 = type metadata accessor for SpeakableString();
  v8 = *(__n128 (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
  v9 = v8(v6, 1, 1, v7);
  *(_BYTE *)v1 = v5;
  *(_BYTE *)(v1 + 1) = v4;
  *(_QWORD *)(v1 + 24) = 0;
  v9.n128_u8[0] = *(_BYTE *)(v3 + 34);
  *(double *)(v1 + 8) = (double)v9.n128_u64[0];
  *(_BYTE *)(v1 + 16) = 0;
  type metadata accessor for DialogDuration.Builder();
  swift_allocObject();
  DialogDuration.Builder.init()();
  dispatch thunk of DialogDuration.Builder.withSecs(_:)();
  swift_release();
  v10 = dispatch thunk of DialogDuration.Builder.build()();
  swift_release();
  *(_QWORD *)(v1 + 24) = v10;
  String.toDialogUnit.getter(*(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  v8(v2, 0, 1, v7);
  outlined assign with take of SpeakableString?(v2, v6);
  v11 = WorkoutVoiceFeedbackZoneExitedAbovePaceParameters.asKeyValuePairs()(type metadata accessor for WorkoutVoiceFeedbackZoneExitedBelowPaceParameters);
  *(_QWORD *)(v0 + 56) = v11;
  v14 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                            + MEMORY[0x24BE92868]);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v12;
  *v12 = v0;
  v12[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowPace(executeSashGroupOnWatch:isSingleThreshold:_:);
  return v14(0xD000000000000028, 0x800000024A61E8F0, v11);
}

{
  uint64_t v0;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 48), type metadata accessor for WorkoutVoiceFeedbackZoneExitedBelowPaceParameters);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 80));
}

{
  uint64_t v0;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 48), type metadata accessor for WorkoutVoiceFeedbackZoneExitedBelowPaceParameters);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowPace(executeSashGroupOnWatch:isSingleThreshold:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 72) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_QWORD *)(v4 + 80) = a1;
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredNonPace(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = a3;
  *(_BYTE *)(v3 + 56) = a1;
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredNonPace(executeSashGroupOnWatch:_:)()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(unint64_t, unint64_t, uint64_t);

  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_BYTE *)(v0 + 56);
  LOBYTE(v1) = *(_BYTE *)(v2 + 34);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v4 = swift_allocObject();
  *(_QWORD *)(v0 + 32) = v4;
  *(_QWORD *)(v4 + 32) = 0xD000000000000017;
  *(_QWORD *)(v4 + 40) = 0x800000024A61E2A0;
  v5 = MEMORY[0x24BEE1328];
  *(_OWORD *)(v4 + 16) = xmmword_24A61CB20;
  *(_QWORD *)(v4 + 72) = v5;
  *(_BYTE *)(v4 + 48) = v3;
  v6 = *(_QWORD *)(v2 + 8);
  *(_QWORD *)(v4 + 80) = 0x647574696E67616DLL;
  *(_QWORD *)(v4 + 88) = 0xE900000000000065;
  v7 = MEMORY[0x24BEE13C8];
  *(_QWORD *)(v4 + 96) = v6;
  *(_QWORD *)(v4 + 120) = v7;
  *(_QWORD *)(v4 + 128) = 0x63697274656DLL;
  *(_QWORD *)(v4 + 136) = 0xE600000000000000;
  *(_QWORD *)(v4 + 168) = v7;
  *(double *)(v4 + 144) = (double)v1;
  v10 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                            + MEMORY[0x24BE92868]);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v8;
  *v8 = v0;
  v8[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowNonPace(executeSashGroupOnWatch:isSingleThreshold:_:);
  return v10(0xD000000000000027, 0x800000024A61E6E0, v4);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredSpeed(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = a3;
  *(_BYTE *)(v3 + 80) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  *(_QWORD *)(v3 + 32) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredSpeed(executeSashGroupOnWatch:_:)()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*v12)(unint64_t, unint64_t, uint64_t);

  v3 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v4 = *(_BYTE *)(v0 + 80);
  LOBYTE(v1) = *(_BYTE *)(v3 + 34);
  type metadata accessor for DialogLength.Builder();
  swift_allocObject();
  MEMORY[0x24BD14B88]();
  dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
  swift_release();
  String.toDialogUnit.getter(*(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  v5 = type metadata accessor for SpeakableString();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v2, 0, 1, v5);
  dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
  swift_release();
  outlined destroy of Any?(v2, &demangling cache variable for type metadata for SpeakableString?);
  v6 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
  *(_QWORD *)(v0 + 40) = v6;
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v7 = swift_allocObject();
  *(_QWORD *)(v0 + 48) = v7;
  *(_OWORD *)(v7 + 16) = xmmword_24A61CB20;
  *(_QWORD *)(v7 + 32) = 0xD000000000000017;
  *(_QWORD *)(v7 + 40) = 0x800000024A61E2A0;
  v8 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v7 + 48) = v4;
  *(_QWORD *)(v7 + 72) = v8;
  *(_QWORD *)(v7 + 80) = 0x6874676E656CLL;
  *(_QWORD *)(v7 + 88) = 0xE600000000000000;
  v9 = type metadata accessor for DialogLength();
  *(_QWORD *)(v7 + 96) = v6;
  *(_QWORD *)(v7 + 120) = v9;
  *(_QWORD *)(v7 + 128) = 0x63697274656DLL;
  *(_QWORD *)(v7 + 136) = 0xE600000000000000;
  *(_QWORD *)(v7 + 168) = MEMORY[0x24BEE13C8];
  *(double *)(v7 + 144) = (double)v1;
  v12 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                            + MEMORY[0x24BE92868]);
  swift_retain();
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v10;
  *v10 = v0;
  v10[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveSpeed(executeSashGroupOnWatch:isSingleThreshold:_:);
  return v12(0xD000000000000025, 0x800000024A61E710, v7);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredPace(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = a3;
  *(_BYTE *)(v3 + 88) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  *(_QWORD *)(v3 + 32) = swift_task_alloc();
  *(_QWORD *)(v3 + 40) = type metadata accessor for WorkoutVoiceFeedbackZoneEnteredPaceParameters(0);
  *(_QWORD *)(v3 + 48) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredPace(executeSashGroupOnWatch:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  __n128 (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  __n128 v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t (*v13)(unint64_t, unint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v4 = *(_BYTE *)(v0 + 88);
  v5 = v1 + *(int *)(*(_QWORD *)(v0 + 40) + 28);
  v6 = type metadata accessor for SpeakableString();
  v7 = *(__n128 (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
  v8 = v7(v5, 1, 1, v6);
  *(_BYTE *)v1 = v4;
  *(_QWORD *)(v1 + 24) = 0;
  v8.n128_u8[0] = *(_BYTE *)(v3 + 34);
  *(double *)(v1 + 8) = (double)v8.n128_u64[0];
  *(_BYTE *)(v1 + 16) = 0;
  type metadata accessor for DialogDuration.Builder();
  swift_allocObject();
  DialogDuration.Builder.init()();
  dispatch thunk of DialogDuration.Builder.withSecs(_:)();
  swift_release();
  v9 = dispatch thunk of DialogDuration.Builder.build()();
  swift_release();
  *(_QWORD *)(v1 + 24) = v9;
  String.toDialogUnit.getter(*(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  v7(v2, 0, 1, v6);
  outlined assign with take of SpeakableString?(v2, v5);
  v10 = WorkoutVoiceFeedbackLapCompletionPaceParameters.asKeyValuePairs()(0x63697274656DLL, 0xE600000000000000, type metadata accessor for WorkoutVoiceFeedbackZoneEnteredPaceParameters);
  *(_QWORD *)(v0 + 56) = v10;
  v13 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                            + MEMORY[0x24BE92868]);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v11;
  *v11 = v0;
  v11[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredPace(executeSashGroupOnWatch:_:);
  return v13(0xD000000000000024, 0x800000024A61E740, v10);
}

{
  uint64_t v0;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 48), type metadata accessor for WorkoutVoiceFeedbackZoneEnteredPaceParameters);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 80));
}

{
  uint64_t v0;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 48), type metadata accessor for WorkoutVoiceFeedbackZoneEnteredPaceParameters);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredPace(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 72) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_QWORD *)(v4 + 80) = a1;
  return swift_task_switch();
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackZoneEnteredPaceParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackZoneEnteredPaceParameters);
}

uint64_t outlined init with copy of URL?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters);
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters);
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters);
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters);
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackZoneExitedBelowPaceParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackZoneExitedBelowPaceParameters);
}

uint64_t outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.pacerGoalCompletion(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 40) = a2;
  *(_QWORD *)(v3 + 48) = a3;
  *(_BYTE *)(v3 + 104) = a1;
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.pacerGoalCompletion(executeSashGroupOnWatch:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*v12)(unint64_t, unint64_t, uint64_t);

  *(_QWORD *)(v0 + 16) = 0;
  v1 = *(_QWORD *)(v0 + 48);
  *(_BYTE *)(v0 + 24) = *(_BYTE *)(v0 + 104);
  *(_QWORD *)(v0 + 32) = 0;
  specialized closure #1 in PacerGoalCompletionModel.executePattern(wrapper:)((uint64_t *)(v0 + 16), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
  v2 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 56) = v2;
  v3 = *(_BYTE *)(v0 + 24);
  v4 = *(_QWORD *)(v0 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v5 = swift_allocObject();
  *(_QWORD *)(v0 + 64) = v5;
  *(_OWORD *)(v5 + 16) = xmmword_24A61CB20;
  *(_QWORD *)(v5 + 32) = 0x6E6F697461727564;
  *(_QWORD *)(v5 + 40) = 0xE800000000000000;
  if (v2)
  {
    v6 = type metadata accessor for DialogDuration();
    v7 = v2;
  }
  else
  {
    v7 = 0;
    v6 = 0;
    *(_QWORD *)(v5 + 56) = 0;
    *(_QWORD *)(v5 + 64) = 0;
  }
  *(_QWORD *)(v5 + 48) = v7;
  *(_QWORD *)(v5 + 72) = v6;
  *(_QWORD *)(v5 + 80) = 0xD000000000000017;
  *(_QWORD *)(v5 + 88) = 0x800000024A61E2A0;
  v8 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v5 + 96) = v3;
  *(_QWORD *)(v5 + 120) = v8;
  *(_QWORD *)(v5 + 128) = 0x6874676E656CLL;
  *(_QWORD *)(v5 + 136) = 0xE600000000000000;
  v9 = 0;
  if (v4)
  {
    v9 = type metadata accessor for DialogLength();
  }
  else
  {
    *(_QWORD *)(v5 + 152) = 0;
    *(_QWORD *)(v5 + 160) = 0;
  }
  *(_QWORD *)(v0 + 72) = v4;
  *(_QWORD *)(v5 + 144) = v4;
  *(_QWORD *)(v5 + 168) = v9;
  v12 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                            + MEMORY[0x24BE92868]);
  swift_retain();
  swift_retain();
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v10;
  *v10 = v0;
  v10[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.pacerGoalCompletion(executeSashGroupOnWatch:_:);
  return v12(0xD000000000000028, 0x800000024A61E920, v5);
}

{
  uint64_t v0;

  swift_release();
  swift_release();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 96));
}

{
  uint64_t v0;

  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.pacerGoalCompletion(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 88) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_QWORD *)(v4 + 96) = a1;
  return swift_task_switch();
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters);
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackLapCompletionPaceParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackLapCompletionPaceParameters);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalHalfwayPoint(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 32) = a3;
  *(_QWORD *)(v5 + 40) = a4;
  *(double *)(v5 + 24) = a5;
  *(_QWORD *)(v5 + 16) = a2;
  *(_BYTE *)(v5 + 96) = a1;
  *(_QWORD *)(v5 + 48) = type metadata accessor for WorkoutVoiceFeedbackGoalHalfwayPointParameters(0);
  *(_QWORD *)(v5 + 56) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalHalfwayPoint(executeSashGroupOnWatch:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(unint64_t, unint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v4 = *(double *)(v0 + 24);
  v5 = *(_BYTE *)(v0 + 96);
  v6 = v1 + *(int *)(*(_QWORD *)(v0 + 48) + 32);
  v7 = type metadata accessor for SpeakableString();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(_QWORD *)v1 = 0;
  *(_BYTE *)(v1 + 8) = v5;
  *(_QWORD *)(v1 + 16) = 0;
  *(_QWORD *)(v1 + 24) = 0;
  *(_BYTE *)(v1 + 32) = 1;
  specialized closure #1 in HalfwayGoalCompletionModel.executePattern(wrapper:)(v1, v3, v2, v4);
  v8 = WorkoutVoiceFeedbackGoalCompletionParameters.asKeyValuePairs()(type metadata accessor for WorkoutVoiceFeedbackGoalHalfwayPointParameters);
  *(_QWORD *)(v0 + 64) = v8;
  v11 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                            + MEMORY[0x24BE92868]);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v9;
  *v9 = v0;
  v9[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalHalfwayPoint(executeSashGroupOnWatch:_:);
  return v11(0xD000000000000025, 0x800000024A61EA70, v8);
}

{
  uint64_t v0;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 56), type metadata accessor for WorkoutVoiceFeedbackGoalHalfwayPointParameters);
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 88));
}

{
  uint64_t v0;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 56), type metadata accessor for WorkoutVoiceFeedbackGoalHalfwayPointParameters);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalHalfwayPoint(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 80) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_QWORD *)(v4 + 88) = a1;
  return swift_task_switch();
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackGoalHalfwayPointParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackGoalHalfwayPointParameters);
}

uint64_t outlined retain of DialogLength?(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters);
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackGoalCompletionParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackGoalCompletionParameters);
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackGoalCompletionParameters()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackGoalCompletionParameters()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void type metadata completion function for WorkoutVoiceFeedbackGoalCompletionParameters()
{
  type metadata completion function for WorkoutVoiceFeedbackGoalCompletionParameters();
}

{
  unint64_t v0;

  type metadata accessor for SpeakableString?();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void type metadata accessor for SpeakableString?()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for SpeakableString?)
  {
    type metadata accessor for SpeakableString();
    v0 = type metadata accessor for Optional();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for SpeakableString?);
  }
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t initializeBufferWithCopyOfBuffer for WorkoutVoiceFeedbackGoalCompletionParameters(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(const void *, uint64_t, uint64_t);
  uint64_t v13;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = v4 + ((v3 + 16) & ~(unint64_t)v3);
    swift_retain();
  }
  else
  {
    v5 = a1;
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    v6 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v6;
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    v7 = *(int *)(a3 + 32);
    v8 = (void *)(a1 + v7);
    v9 = (char *)a2 + v7;
    v10 = type metadata accessor for SpeakableString();
    v11 = *(_QWORD *)(v10 - 8);
    v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
    swift_retain();
    swift_retain();
    if (v12(v9, 1, v10))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
  }
  return v5;
}

uint64_t destroy for WorkoutVoiceFeedbackGoalCompletionParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_release();
  swift_release();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = type metadata accessor for SpeakableString();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

uint64_t initializeWithCopy for WorkoutVoiceFeedbackGoalCompletionParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int (*v10)(const void *, uint64_t, uint64_t);
  uint64_t v11;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v5 = *(int *)(a3 + 32);
  v6 = (void *)(a1 + v5);
  v7 = (const void *)(a2 + v5);
  v8 = type metadata accessor for SpeakableString();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48);
  swift_retain();
  swift_retain();
  if (v10(v7, 1, v8))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithCopy for WorkoutVoiceFeedbackGoalCompletionParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  v6 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(int *)(a3 + 32);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = type metadata accessor for SpeakableString();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t initializeWithTake for WorkoutVoiceFeedbackGoalCompletionParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v5 = *(int *)(a3 + 32);
  v6 = (void *)(a1 + v5);
  v7 = (const void *)(a2 + v5);
  v8 = type metadata accessor for SpeakableString();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(v6, v7, v8);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithTake for WorkoutVoiceFeedbackGoalCompletionParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v6 = *(int *)(a3 + 32);
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = type metadata accessor for SpeakableString();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackGoalHalfwayPointParameters()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(&a1[*(int *)(a3 + 32)], a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackGoalHalfwayPointParameters()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *__swift_store_extra_inhabitant_indexTm(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 32)], a2, a2, v7);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackLapCompletionPaceParameters()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackLapCompletionPaceParameters()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void type metadata completion function for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters()
{
  type metadata completion function for WorkoutVoiceFeedbackGoalCompletionParameters();
}

_QWORD *initializeBufferWithCopyOfBuffer for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  void *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int (*v10)(const void *, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_WORD *)a1 = *(_WORD *)a2;
    *(_QWORD *)(a1 + 8) = a2[1];
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    *(_QWORD *)(a1 + 24) = a2[3];
    v5 = *(int *)(a3 + 32);
    v6 = (void *)(a1 + v5);
    v7 = (char *)a2 + v5;
    v8 = type metadata accessor for SpeakableString();
    v9 = *(_QWORD *)(v8 - 8);
    v10 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48);
    swift_retain();
    if (v10(v7, 1, v8))
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
      memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
    }
  }
  return v3;
}

uint64_t destroy for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_release();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = type metadata accessor for SpeakableString();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

uint64_t initializeWithCopy for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int (*v9)(const void *, uint64_t, uint64_t);
  uint64_t v10;

  *(_WORD *)a1 = *(_WORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = *(int *)(a3 + 32);
  v5 = (void *)(a1 + v4);
  v6 = (const void *)(a2 + v4);
  v7 = type metadata accessor for SpeakableString();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  swift_retain();
  if (v9(v6, 1, v7))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(v5, v6, v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithCopy for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  v6 = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  v7 = *(int *)(a3 + 32);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = type metadata accessor for SpeakableString();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t initializeWithTake for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_WORD *)a1 = *(_WORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = *(int *)(a3 + 32);
  v5 = (void *)(a1 + v4);
  v6 = (const void *)(a2 + v4);
  v7 = type metadata accessor for SpeakableString();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithTake for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  v6 = *(int *)(a3 + 32);
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = type metadata accessor for SpeakableString();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackZoneExitedBelowPaceParameters()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_index_69Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackZoneExitedBelowPaceParameters()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_index_70Tm(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 24) = a2;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(const void *, uint64_t, uint64_t);
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

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *(_QWORD *)a1 = *a2;
    v4 = v16 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    *(_QWORD *)(a1 + 8) = a2[1];
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    *(_QWORD *)(a1 + 40) = a2[5];
    *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
    v7 = a2[7];
    v8 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v8;
    *(_BYTE *)(a1 + 80) = *((_BYTE *)a2 + 80);
    v9 = a3[12];
    v10 = (void *)(a1 + v9);
    v11 = (char *)a2 + v9;
    *(_QWORD *)(a1 + 56) = v7;
    v12 = type metadata accessor for SpeakableString();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48);
    swift_retain();
    swift_retain();
    if (v14(v11, 1, v12))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    v17 = a3[14];
    *(_BYTE *)(v4 + a3[13]) = *((_BYTE *)a2 + a3[13]);
    *(_BYTE *)(v4 + v17) = *((_BYTE *)a2 + v17);
    v18 = a3[16];
    *(_BYTE *)(v4 + a3[15]) = *((_BYTE *)a2 + a3[15]);
    *(_QWORD *)(v4 + v18) = *(uint64_t *)((char *)a2 + v18);
    v19 = a3[18];
    *(_QWORD *)(v4 + a3[17]) = *(uint64_t *)((char *)a2 + a3[17]);
    v20 = v4 + v19;
    v21 = (uint64_t)a2 + v19;
    *(_QWORD *)v20 = *(_QWORD *)v21;
    *(_BYTE *)(v20 + 8) = *(_BYTE *)(v21 + 8);
    v22 = a3[19];
    v23 = a3[20];
    v24 = v4 + v22;
    v25 = (uint64_t)a2 + v22;
    *(_QWORD *)v24 = *(_QWORD *)v25;
    *(_BYTE *)(v24 + 8) = *(_BYTE *)(v25 + 8);
    v26 = v4 + v23;
    v27 = (uint64_t)a2 + v23;
    *(_QWORD *)v26 = *(_QWORD *)v27;
    *(_BYTE *)(v26 + 8) = *(_BYTE *)(v27 + 8);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_release();
  swift_release();
  v4 = a1 + *(int *)(a2 + 48);
  v5 = type metadata accessor for SpeakableString();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
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

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 56);
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v8 = a3[12];
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  *(_QWORD *)(a1 + 56) = v6;
  v11 = type metadata accessor for SpeakableString();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  swift_retain();
  swift_retain();
  if (v13(v10, 1, v11))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v15 = a3[14];
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  v16 = a3[16];
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  *(_QWORD *)(a1 + v16) = *(_QWORD *)(a2 + v16);
  v17 = a3[18];
  *(_QWORD *)(a1 + a3[17]) = *(_QWORD *)(a2 + a3[17]);
  v18 = a1 + v17;
  v19 = a2 + v17;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
  v20 = a3[19];
  v21 = a3[20];
  v22 = a1 + v20;
  v23 = a2 + v20;
  *(_QWORD *)v22 = *(_QWORD *)v23;
  *(_BYTE *)(v22 + 8) = *(_BYTE *)(v23 + 8);
  v24 = a1 + v21;
  v25 = a2 + v21;
  *(_QWORD *)v24 = *(_QWORD *)v25;
  *(_BYTE *)(v24 + 8) = *(_BYTE *)(v25 + 8);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v7 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v7;
  v8 = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_retain();
  swift_release();
  v9 = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = v9;
  v10 = a3[12];
  v11 = (void *)(a1 + v10);
  v12 = (void *)(a2 + v10);
  v13 = type metadata accessor for SpeakableString();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 24))(v11, v12, v13);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v11, v12, v13);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
LABEL_7:
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  *(_QWORD *)(a1 + a3[16]) = *(_QWORD *)(a2 + a3[16]);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + a3[17]) = *(_QWORD *)(a2 + a3[17]);
  swift_retain();
  swift_release();
  v19 = a3[18];
  v20 = a1 + v19;
  v21 = (uint64_t *)(a2 + v19);
  v22 = *v21;
  *(_BYTE *)(v20 + 8) = *((_BYTE *)v21 + 8);
  *(_QWORD *)v20 = v22;
  v23 = a3[19];
  v24 = a1 + v23;
  v25 = (uint64_t *)(a2 + v23);
  v26 = *v25;
  *(_BYTE *)(v24 + 8) = *((_BYTE *)v25 + 8);
  *(_QWORD *)v24 = v26;
  v27 = a3[20];
  v28 = a1 + v27;
  v29 = (uint64_t *)(a2 + v27);
  v30 = *v29;
  *(_BYTE *)(v28 + 8) = *((_BYTE *)v29 + 8);
  *(_QWORD *)v28 = v30;
  return a1;
}

uint64_t initializeWithTake for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const void *v10;
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

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v6 = *(_OWORD *)(a2 + 56);
  v7 = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = v7;
  v8 = a3[12];
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  *(_OWORD *)(a1 + 56) = v6;
  v11 = type metadata accessor for SpeakableString();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v14 = a3[14];
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v14) = *(_BYTE *)(a2 + v14);
  v15 = a3[16];
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  *(_QWORD *)(a1 + v15) = *(_QWORD *)(a2 + v15);
  v16 = a3[18];
  *(_QWORD *)(a1 + a3[17]) = *(_QWORD *)(a2 + a3[17]);
  v17 = a1 + v16;
  v18 = a2 + v16;
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *(_BYTE *)(v17 + 8) = *(_BYTE *)(v18 + 8);
  v19 = a3[19];
  v20 = a3[20];
  v21 = a1 + v19;
  v22 = a2 + v19;
  *(_QWORD *)v21 = *(_QWORD *)v22;
  *(_BYTE *)(v21 + 8) = *(_BYTE *)(v22 + 8);
  v23 = a1 + v20;
  v24 = a2 + v20;
  *(_QWORD *)v23 = *(_QWORD *)v24;
  *(_BYTE *)(v23 + 8) = *(_BYTE *)(v24 + 8);
  return a1;
}

uint64_t assignWithTake for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
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

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_release();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_release();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v6 = a3[12];
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = type metadata accessor for SpeakableString();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  v15 = a3[14];
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  v16 = a3[16];
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  *(_QWORD *)(a1 + v16) = *(_QWORD *)(a2 + v16);
  swift_release();
  *(_QWORD *)(a1 + a3[17]) = *(_QWORD *)(a2 + a3[17]);
  swift_release();
  v17 = a3[18];
  v18 = a3[19];
  v19 = a1 + v17;
  v20 = a2 + v17;
  *(_QWORD *)v19 = *(_QWORD *)v20;
  *(_BYTE *)(v19 + 8) = *(_BYTE *)(v20 + 8);
  v21 = a1 + v18;
  v22 = a2 + v18;
  *(_QWORD *)v21 = *(_QWORD *)v22;
  *(_BYTE *)(v21 + 8) = *(_BYTE *)(v22 + 8);
  v23 = a3[20];
  v24 = a1 + v23;
  v25 = a2 + v23;
  *(_QWORD *)v24 = *(_QWORD *)v25;
  *(_BYTE *)(v24 + 8) = *(_BYTE *)(v25 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void type metadata completion function for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters()
{
  unint64_t v0;

  type metadata accessor for SpeakableString?();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t initializeBufferWithCopyOfBuffer for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(const void *, uint64_t, uint64_t);
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

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *(_QWORD *)a1 = *a2;
    v4 = v16 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    *(_QWORD *)(a1 + 8) = a2[1];
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    *(_QWORD *)(a1 + 40) = a2[5];
    *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
    v7 = a2[7];
    v8 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v8;
    *(_BYTE *)(a1 + 80) = *((_BYTE *)a2 + 80);
    v9 = a3[12];
    v10 = (void *)(a1 + v9);
    v11 = (char *)a2 + v9;
    *(_QWORD *)(a1 + 56) = v7;
    v12 = type metadata accessor for SpeakableString();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48);
    swift_retain();
    swift_retain();
    if (v14(v11, 1, v12))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    v17 = a3[14];
    *(_BYTE *)(v4 + a3[13]) = *((_BYTE *)a2 + a3[13]);
    *(_BYTE *)(v4 + v17) = *((_BYTE *)a2 + v17);
    v18 = a3[16];
    *(_BYTE *)(v4 + a3[15]) = *((_BYTE *)a2 + a3[15]);
    *(_BYTE *)(v4 + v18) = *((_BYTE *)a2 + v18);
    v19 = a3[18];
    *(_BYTE *)(v4 + a3[17]) = *((_BYTE *)a2 + a3[17]);
    *(_BYTE *)(v4 + v19) = *((_BYTE *)a2 + v19);
    v20 = a3[20];
    *(_BYTE *)(v4 + a3[19]) = *((_BYTE *)a2 + a3[19]);
    v21 = v4 + v20;
    v22 = (uint64_t)a2 + v20;
    *(_QWORD *)v21 = *(_QWORD *)v22;
    *(_BYTE *)(v21 + 8) = *(_BYTE *)(v22 + 8);
    v23 = a3[21];
    v24 = a3[22];
    v25 = v4 + v23;
    v26 = (uint64_t)a2 + v23;
    *(_QWORD *)v25 = *(_QWORD *)v26;
    *(_BYTE *)(v25 + 8) = *(_BYTE *)(v26 + 8);
    *(_QWORD *)(v4 + v24) = *(uint64_t *)((char *)a2 + v24);
    v27 = a3[24];
    *(_QWORD *)(v4 + a3[23]) = *(uint64_t *)((char *)a2 + a3[23]);
    v28 = v4 + v27;
    v29 = (uint64_t)a2 + v27;
    *(_QWORD *)v28 = *(_QWORD *)v29;
    *(_BYTE *)(v28 + 8) = *(_BYTE *)(v29 + 8);
    v30 = a3[25];
    v31 = v4 + v30;
    v32 = (uint64_t)a2 + v30;
    *(_QWORD *)v31 = *(_QWORD *)v32;
    *(_BYTE *)(v31 + 8) = *(_BYTE *)(v32 + 8);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_release();
  swift_release();
  v4 = a1 + *(int *)(a2 + 48);
  v5 = type metadata accessor for SpeakableString();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
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

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 56);
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v8 = a3[12];
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  *(_QWORD *)(a1 + 56) = v6;
  v11 = type metadata accessor for SpeakableString();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  swift_retain();
  swift_retain();
  if (v13(v10, 1, v11))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v15 = a3[14];
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  v16 = a3[16];
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  *(_BYTE *)(a1 + v16) = *(_BYTE *)(a2 + v16);
  v17 = a3[18];
  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  *(_BYTE *)(a1 + v17) = *(_BYTE *)(a2 + v17);
  v18 = a3[20];
  *(_BYTE *)(a1 + a3[19]) = *(_BYTE *)(a2 + a3[19]);
  v19 = a1 + v18;
  v20 = a2 + v18;
  *(_QWORD *)v19 = *(_QWORD *)v20;
  *(_BYTE *)(v19 + 8) = *(_BYTE *)(v20 + 8);
  v21 = a3[21];
  v22 = a3[22];
  v23 = a1 + v21;
  v24 = a2 + v21;
  *(_QWORD *)v23 = *(_QWORD *)v24;
  *(_BYTE *)(v23 + 8) = *(_BYTE *)(v24 + 8);
  *(_QWORD *)(a1 + v22) = *(_QWORD *)(a2 + v22);
  v25 = a3[24];
  *(_QWORD *)(a1 + a3[23]) = *(_QWORD *)(a2 + a3[23]);
  v26 = a1 + v25;
  v27 = a2 + v25;
  *(_QWORD *)v26 = *(_QWORD *)v27;
  *(_BYTE *)(v26 + 8) = *(_BYTE *)(v27 + 8);
  v28 = a3[25];
  v29 = a1 + v28;
  v30 = a2 + v28;
  *(_QWORD *)v29 = *(_QWORD *)v30;
  *(_BYTE *)(v29 + 8) = *(_BYTE *)(v30 + 8);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v7 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v7;
  v8 = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_retain();
  swift_release();
  v9 = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = v9;
  v10 = a3[12];
  v11 = (void *)(a1 + v10);
  v12 = (void *)(a2 + v10);
  v13 = type metadata accessor for SpeakableString();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 24))(v11, v12, v13);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v11, v12, v13);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
LABEL_7:
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  *(_BYTE *)(a1 + a3[16]) = *(_BYTE *)(a2 + a3[16]);
  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  *(_BYTE *)(a1 + a3[18]) = *(_BYTE *)(a2 + a3[18]);
  *(_BYTE *)(a1 + a3[19]) = *(_BYTE *)(a2 + a3[19]);
  v19 = a3[20];
  v20 = a1 + v19;
  v21 = (uint64_t *)(a2 + v19);
  v22 = *v21;
  *(_BYTE *)(v20 + 8) = *((_BYTE *)v21 + 8);
  *(_QWORD *)v20 = v22;
  v23 = a3[21];
  v24 = a1 + v23;
  v25 = (uint64_t *)(a2 + v23);
  v26 = *v25;
  *(_BYTE *)(v24 + 8) = *((_BYTE *)v25 + 8);
  *(_QWORD *)v24 = v26;
  *(_QWORD *)(a1 + a3[22]) = *(_QWORD *)(a2 + a3[22]);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + a3[23]) = *(_QWORD *)(a2 + a3[23]);
  swift_retain();
  swift_release();
  v27 = a3[24];
  v28 = a1 + v27;
  v29 = (uint64_t *)(a2 + v27);
  v30 = *v29;
  *(_BYTE *)(v28 + 8) = *((_BYTE *)v29 + 8);
  *(_QWORD *)v28 = v30;
  v31 = a3[25];
  v32 = a1 + v31;
  v33 = (uint64_t *)(a2 + v31);
  v34 = *v33;
  *(_BYTE *)(v32 + 8) = *((_BYTE *)v33 + 8);
  *(_QWORD *)v32 = v34;
  return a1;
}

uint64_t initializeWithTake for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const void *v10;
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

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v6 = *(_OWORD *)(a2 + 56);
  v7 = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = v7;
  v8 = a3[12];
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  *(_OWORD *)(a1 + 56) = v6;
  v11 = type metadata accessor for SpeakableString();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v14 = a3[14];
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v14) = *(_BYTE *)(a2 + v14);
  v15 = a3[16];
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  v16 = a3[18];
  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  *(_BYTE *)(a1 + v16) = *(_BYTE *)(a2 + v16);
  v17 = a3[20];
  *(_BYTE *)(a1 + a3[19]) = *(_BYTE *)(a2 + a3[19]);
  v18 = a1 + v17;
  v19 = a2 + v17;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
  v20 = a3[21];
  v21 = a3[22];
  v22 = a1 + v20;
  v23 = a2 + v20;
  *(_QWORD *)v22 = *(_QWORD *)v23;
  *(_BYTE *)(v22 + 8) = *(_BYTE *)(v23 + 8);
  *(_QWORD *)(a1 + v21) = *(_QWORD *)(a2 + v21);
  v24 = a3[24];
  *(_QWORD *)(a1 + a3[23]) = *(_QWORD *)(a2 + a3[23]);
  v25 = a1 + v24;
  v26 = a2 + v24;
  *(_QWORD *)v25 = *(_QWORD *)v26;
  *(_BYTE *)(v25 + 8) = *(_BYTE *)(v26 + 8);
  v27 = a3[25];
  v28 = a1 + v27;
  v29 = a2 + v27;
  *(_QWORD *)v28 = *(_QWORD *)v29;
  *(_BYTE *)(v28 + 8) = *(_BYTE *)(v29 + 8);
  return a1;
}

uint64_t assignWithTake for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
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

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_release();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_release();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v6 = a3[12];
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = type metadata accessor for SpeakableString();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  v15 = a3[14];
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  v16 = a3[16];
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  *(_BYTE *)(a1 + v16) = *(_BYTE *)(a2 + v16);
  v17 = a3[18];
  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  *(_BYTE *)(a1 + v17) = *(_BYTE *)(a2 + v17);
  v18 = a3[20];
  *(_BYTE *)(a1 + a3[19]) = *(_BYTE *)(a2 + a3[19]);
  v19 = a1 + v18;
  v20 = a2 + v18;
  *(_QWORD *)v19 = *(_QWORD *)v20;
  *(_BYTE *)(v19 + 8) = *(_BYTE *)(v20 + 8);
  v21 = a3[21];
  v22 = a3[22];
  v23 = a1 + v21;
  v24 = a2 + v21;
  *(_QWORD *)v23 = *(_QWORD *)v24;
  *(_BYTE *)(v23 + 8) = *(_BYTE *)(v24 + 8);
  *(_QWORD *)(a1 + v22) = *(_QWORD *)(a2 + v22);
  swift_release();
  *(_QWORD *)(a1 + a3[23]) = *(_QWORD *)(a2 + a3[23]);
  swift_release();
  v25 = a3[24];
  v26 = a3[25];
  v27 = a1 + v25;
  v28 = a2 + v25;
  *(_QWORD *)v27 = *(_QWORD *)v28;
  *(_BYTE *)(v27 + 8) = *(_BYTE *)(v28 + 8);
  v29 = a1 + v26;
  v30 = a2 + v26;
  *(_QWORD *)v29 = *(_QWORD *)v30;
  *(_BYTE *)(v29 + 8) = *(_BYTE *)(v30 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void type metadata completion function for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters()
{
  unint64_t v0;

  type metadata accessor for SpeakableString?();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t initializeBufferWithCopyOfBuffer for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(const void *, uint64_t, uint64_t);
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

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *(_QWORD *)a1 = *a2;
    v4 = v16 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    *(_QWORD *)(a1 + 8) = a2[1];
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    *(_QWORD *)(a1 + 40) = a2[5];
    *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
    v7 = a2[7];
    v8 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v8;
    *(_BYTE *)(a1 + 80) = *((_BYTE *)a2 + 80);
    v9 = a3[12];
    v10 = (void *)(a1 + v9);
    v11 = (char *)a2 + v9;
    *(_QWORD *)(a1 + 56) = v7;
    v12 = type metadata accessor for SpeakableString();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48);
    swift_retain();
    swift_retain();
    if (v14(v11, 1, v12))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    v17 = a3[14];
    *(_BYTE *)(v4 + a3[13]) = *((_BYTE *)a2 + a3[13]);
    *(_BYTE *)(v4 + v17) = *((_BYTE *)a2 + v17);
    v18 = a3[16];
    *(_BYTE *)(v4 + a3[15]) = *((_BYTE *)a2 + a3[15]);
    *(_BYTE *)(v4 + v18) = *((_BYTE *)a2 + v18);
    v19 = a3[18];
    *(_QWORD *)(v4 + a3[17]) = *(uint64_t *)((char *)a2 + a3[17]);
    *(_QWORD *)(v4 + v19) = *(uint64_t *)((char *)a2 + v19);
    v20 = a3[20];
    *(_QWORD *)(v4 + a3[19]) = *(uint64_t *)((char *)a2 + a3[19]);
    *(_QWORD *)(v4 + v20) = *(uint64_t *)((char *)a2 + v20);
    v21 = a3[21];
    v22 = a3[22];
    v23 = v4 + v21;
    v24 = (uint64_t)a2 + v21;
    *(_QWORD *)v23 = *(_QWORD *)v24;
    *(_BYTE *)(v23 + 8) = *(_BYTE *)(v24 + 8);
    v25 = v4 + v22;
    v26 = (uint64_t)a2 + v22;
    *(_QWORD *)v25 = *(_QWORD *)v26;
    *(_BYTE *)(v25 + 8) = *(_BYTE *)(v26 + 8);
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_release();
  swift_release();
  v4 = a1 + *(int *)(a2 + 48);
  v5 = type metadata accessor for SpeakableString();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
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

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 56);
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v8 = a3[12];
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  *(_QWORD *)(a1 + 56) = v6;
  v11 = type metadata accessor for SpeakableString();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  swift_retain();
  swift_retain();
  if (v13(v10, 1, v11))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v15 = a3[14];
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  v16 = a3[16];
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  *(_BYTE *)(a1 + v16) = *(_BYTE *)(a2 + v16);
  v17 = a3[18];
  *(_QWORD *)(a1 + a3[17]) = *(_QWORD *)(a2 + a3[17]);
  *(_QWORD *)(a1 + v17) = *(_QWORD *)(a2 + v17);
  v18 = a3[20];
  *(_QWORD *)(a1 + a3[19]) = *(_QWORD *)(a2 + a3[19]);
  *(_QWORD *)(a1 + v18) = *(_QWORD *)(a2 + v18);
  v19 = a3[21];
  v20 = a3[22];
  v21 = a1 + v19;
  v22 = a2 + v19;
  *(_QWORD *)v21 = *(_QWORD *)v22;
  *(_BYTE *)(v21 + 8) = *(_BYTE *)(v22 + 8);
  v23 = a1 + v20;
  v24 = a2 + v20;
  *(_QWORD *)v23 = *(_QWORD *)v24;
  *(_BYTE *)(v23 + 8) = *(_BYTE *)(v24 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v7 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v7;
  v8 = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_retain();
  swift_release();
  v9 = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = v9;
  v10 = a3[12];
  v11 = (void *)(a1 + v10);
  v12 = (void *)(a2 + v10);
  v13 = type metadata accessor for SpeakableString();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 24))(v11, v12, v13);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v11, v12, v13);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
LABEL_7:
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  *(_BYTE *)(a1 + a3[16]) = *(_BYTE *)(a2 + a3[16]);
  *(_QWORD *)(a1 + a3[17]) = *(_QWORD *)(a2 + a3[17]);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + a3[18]) = *(_QWORD *)(a2 + a3[18]);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + a3[19]) = *(_QWORD *)(a2 + a3[19]);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + a3[20]) = *(_QWORD *)(a2 + a3[20]);
  swift_retain();
  swift_release();
  v19 = a3[21];
  v20 = a1 + v19;
  v21 = (uint64_t *)(a2 + v19);
  v22 = *v21;
  *(_BYTE *)(v20 + 8) = *((_BYTE *)v21 + 8);
  *(_QWORD *)v20 = v22;
  v23 = a3[22];
  v24 = a1 + v23;
  v25 = (uint64_t *)(a2 + v23);
  v26 = *v25;
  *(_BYTE *)(v24 + 8) = *((_BYTE *)v25 + 8);
  *(_QWORD *)v24 = v26;
  return a1;
}

uint64_t initializeWithTake for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const void *v10;
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

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v6 = *(_OWORD *)(a2 + 56);
  v7 = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = v7;
  v8 = a3[12];
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  *(_OWORD *)(a1 + 56) = v6;
  v11 = type metadata accessor for SpeakableString();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v14 = a3[14];
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v14) = *(_BYTE *)(a2 + v14);
  v15 = a3[16];
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  v16 = a3[18];
  *(_QWORD *)(a1 + a3[17]) = *(_QWORD *)(a2 + a3[17]);
  *(_QWORD *)(a1 + v16) = *(_QWORD *)(a2 + v16);
  v17 = a3[20];
  *(_QWORD *)(a1 + a3[19]) = *(_QWORD *)(a2 + a3[19]);
  *(_QWORD *)(a1 + v17) = *(_QWORD *)(a2 + v17);
  v18 = a3[21];
  v19 = a3[22];
  v20 = a1 + v18;
  v21 = a2 + v18;
  *(_QWORD *)v20 = *(_QWORD *)v21;
  *(_BYTE *)(v20 + 8) = *(_BYTE *)(v21 + 8);
  v22 = a1 + v19;
  v23 = a2 + v19;
  *(_QWORD *)v22 = *(_QWORD *)v23;
  *(_BYTE *)(v22 + 8) = *(_BYTE *)(v23 + 8);
  return a1;
}

uint64_t assignWithTake for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_release();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_release();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v6 = a3[12];
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = type metadata accessor for SpeakableString();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  v15 = a3[14];
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  v16 = a3[16];
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  *(_BYTE *)(a1 + v16) = *(_BYTE *)(a2 + v16);
  *(_QWORD *)(a1 + a3[17]) = *(_QWORD *)(a2 + a3[17]);
  swift_release();
  *(_QWORD *)(a1 + a3[18]) = *(_QWORD *)(a2 + a3[18]);
  swift_release();
  *(_QWORD *)(a1 + a3[19]) = *(_QWORD *)(a2 + a3[19]);
  swift_release();
  *(_QWORD *)(a1 + a3[20]) = *(_QWORD *)(a2 + a3[20]);
  swift_release();
  v17 = a3[21];
  v18 = a3[22];
  v19 = a1 + v17;
  v20 = a2 + v17;
  *(_QWORD *)v19 = *(_QWORD *)v20;
  *(_BYTE *)(v19 + 8) = *(_BYTE *)(v20 + 8);
  v21 = a1 + v18;
  v22 = a2 + v18;
  *(_QWORD *)v21 = *(_QWORD *)v22;
  *(_BYTE *)(v21 + 8) = *(_BYTE *)(v22 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_index_73Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 56);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 48), a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_index_74Tm(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 56) = a2;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 48), a2, a2, v7);
  }
  return result;
}

void type metadata completion function for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters()
{
  unint64_t v0;

  type metadata accessor for SpeakableString?();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

_QWORD *initializeBufferWithCopyOfBuffer for WorkoutVoiceFeedbackLapCompletionPaceParameters(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  void *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int (*v10)(const void *, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    *(_QWORD *)(a1 + 8) = a2[1];
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    *(_QWORD *)(a1 + 24) = a2[3];
    v5 = *(int *)(a3 + 28);
    v6 = (void *)(a1 + v5);
    v7 = (char *)a2 + v5;
    v8 = type metadata accessor for SpeakableString();
    v9 = *(_QWORD *)(v8 - 8);
    v10 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48);
    swift_retain();
    if (v10(v7, 1, v8))
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
      memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
    }
  }
  return v3;
}

uint64_t destroy for WorkoutVoiceFeedbackLapCompletionPaceParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_release();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = type metadata accessor for SpeakableString();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

uint64_t initializeWithCopy for WorkoutVoiceFeedbackLapCompletionPaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int (*v9)(const void *, uint64_t, uint64_t);
  uint64_t v10;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = *(int *)(a3 + 28);
  v5 = (void *)(a1 + v4);
  v6 = (const void *)(a2 + v4);
  v7 = type metadata accessor for SpeakableString();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  swift_retain();
  if (v9(v6, 1, v7))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(v5, v6, v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithCopy for WorkoutVoiceFeedbackLapCompletionPaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  v7 = *(int *)(a3 + 28);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = type metadata accessor for SpeakableString();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t initializeWithTake for WorkoutVoiceFeedbackLapCompletionPaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = *(int *)(a3 + 28);
  v5 = (void *)(a1 + v4);
  v6 = (const void *)(a2 + v4);
  v7 = type metadata accessor for SpeakableString();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithTake for WorkoutVoiceFeedbackLapCompletionPaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  v6 = *(int *)(a3 + 28);
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = type metadata accessor for SpeakableString();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackZoneEnteredPaceParameters()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_index_67Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackZoneEnteredPaceParameters()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_index_68Tm(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 24) = a2;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

void type metadata completion function for WorkoutVoiceFeedbackLapCompletionPaceParameters()
{
  unint64_t v0;

  type metadata accessor for SpeakableString?();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t type metadata accessor for WorkoutRemindersCATPatternsExecutor()
{
  uint64_t result;

  result = type metadata singleton initialization cache for WorkoutRemindersCATPatternsExecutor;
  if (!type metadata singleton initialization cache for WorkoutRemindersCATPatternsExecutor)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for WorkoutRemindersCATPatternsExecutor()
{
  return swift_initClassMetadata2();
}

uint64_t WorkoutRemindersResumeParameters.asKeyValuePairs()()
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
  _OWORD *v11;
  uint64_t v12;
  _BYTE v14[16];
  _BYTE v15[16];
  _BYTE v16[16];
  _BYTE v17[16];
  _BYTE v18[16];
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  __int128 v27;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_24A61CEA0;
  *(_QWORD *)(v1 + 32) = 0x646E497473727562;
  *(_QWORD *)(v1 + 40) = 0xEA00000000007865;
  outlined init with take of BelowTargetZoneModel?(v0, (uint64_t)v18, &demangling cache variable for type metadata for Double?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v18, (uint64_t)&v19, &demangling cache variable for type metadata for Double?);
  if ((v20 & 1) != 0)
  {
    v2 = 0;
    *(_QWORD *)(v1 + 56) = 0;
    *(_QWORD *)(v1 + 64) = 0;
    v3 = 0;
  }
  else
  {
    v2 = MEMORY[0x24BEE13C8];
    v3 = v19;
  }
  *(_QWORD *)(v1 + 48) = v3;
  *(_QWORD *)(v1 + 72) = v2;
  *(_QWORD *)(v1 + 80) = 0xD000000000000017;
  *(_QWORD *)(v1 + 88) = 0x800000024A61E2A0;
  v4 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v1 + 96) = *(_BYTE *)(v0 + 9);
  *(_QWORD *)(v1 + 120) = v4;
  *(_QWORD *)(v1 + 128) = 0x74756F6B726F77;
  *(_QWORD *)(v1 + 136) = 0xE700000000000000;
  outlined init with take of BelowTargetZoneModel?(v0 + 16, (uint64_t)v17, &demangling cache variable for type metadata for Double?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v17, (uint64_t)&v21, &demangling cache variable for type metadata for Double?);
  if ((v22 & 1) != 0)
  {
    v5 = 0;
    *(_QWORD *)(v1 + 152) = 0;
    *(_QWORD *)(v1 + 160) = 0;
    v6 = 0;
  }
  else
  {
    v5 = MEMORY[0x24BEE13C8];
    v6 = v21;
  }
  *(_QWORD *)(v1 + 144) = v6;
  *(_QWORD *)(v1 + 168) = v5;
  *(_QWORD *)(v1 + 176) = 0x4C74756F6B726F77;
  *(_QWORD *)(v1 + 184) = 0xEF6E6F697461636FLL;
  outlined init with take of BelowTargetZoneModel?(v0 + 32, (uint64_t)v16, &demangling cache variable for type metadata for Double?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v16, (uint64_t)&v23, &demangling cache variable for type metadata for Double?);
  if ((v24 & 1) != 0)
  {
    v7 = 0;
    *(_QWORD *)(v1 + 200) = 0;
    *(_QWORD *)(v1 + 208) = 0;
    v8 = 0;
  }
  else
  {
    v7 = MEMORY[0x24BEE13C8];
    v8 = v23;
  }
  *(_QWORD *)(v1 + 192) = v8;
  *(_QWORD *)(v1 + 216) = v7;
  *(_QWORD *)(v1 + 224) = 0xD000000000000017;
  *(_QWORD *)(v1 + 232) = 0x800000024A61EBF0;
  outlined init with take of BelowTargetZoneModel?(v0 + 48, (uint64_t)v15, &demangling cache variable for type metadata for Double?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v15, (uint64_t)&v25, &demangling cache variable for type metadata for Double?);
  if ((v26 & 1) != 0)
  {
    v9 = 0;
    *(_QWORD *)(v1 + 248) = 0;
    *(_QWORD *)(v1 + 256) = 0;
    v10 = 0;
  }
  else
  {
    v9 = MEMORY[0x24BEE13C8];
    v10 = v25;
  }
  *(_QWORD *)(v1 + 240) = v10;
  v11 = (_OWORD *)(v1 + 288);
  *(_QWORD *)(v1 + 264) = v9;
  *(_QWORD *)(v1 + 272) = 0xD000000000000017;
  *(_QWORD *)(v1 + 280) = 0x800000024A61EC10;
  outlined init with take of BelowTargetZoneModel?(v0 + 64, (uint64_t)v14, &demangling cache variable for type metadata for String?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v14, (uint64_t)&v27, &demangling cache variable for type metadata for String?);
  v12 = *((_QWORD *)&v27 + 1);
  if (*((_QWORD *)&v27 + 1))
  {
    *v11 = v27;
    v12 = MEMORY[0x24BEE0D00];
  }
  else
  {
    *(_QWORD *)v11 = 0;
    *(_QWORD *)(v1 + 296) = 0;
    *(_QWORD *)(v1 + 304) = 0;
  }
  *(_QWORD *)(v1 + 312) = v12;
  outlined retain of WorkoutRemindersResumeParameters(v0);
  return v1;
}

uint64_t ObjC metadata update function for WorkoutRemindersCATPatternsExecutor()
{
  return type metadata accessor for WorkoutRemindersCATPatternsExecutor();
}

uint64_t specialized WorkoutRemindersCATPatternsExecutor.start(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = a3;
  *(_BYTE *)(v3 + 56) = a1;
  return swift_task_switch();
}

uint64_t specialized WorkoutRemindersCATPatternsExecutor.start(executeSashGroupOnWatch:_:)()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(unint64_t, unint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_BYTE *)(v0 + 56);
  v3 = objc_msgSend(*(id *)(v1 + 16), sel_workoutType);
  v4 = *(_QWORD *)(v1 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v5 = swift_allocObject();
  *(_QWORD *)(v0 + 32) = v5;
  *(_OWORD *)(v5 + 16) = xmmword_24A61CB20;
  *(_QWORD *)(v5 + 32) = 0x646E497473727562;
  *(_QWORD *)(v5 + 40) = 0xEA00000000007865;
  v6 = MEMORY[0x24BEE13C8];
  *(double *)(v5 + 48) = (double)v4;
  *(_QWORD *)(v5 + 72) = v6;
  *(_QWORD *)(v5 + 80) = 0xD000000000000017;
  *(_QWORD *)(v5 + 88) = 0x800000024A61E2A0;
  v7 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v5 + 96) = v2;
  *(_QWORD *)(v5 + 120) = v7;
  *(_QWORD *)(v5 + 128) = 0x5474756F6B726F77;
  *(_QWORD *)(v5 + 136) = 0xEB00000000657079;
  *(_QWORD *)(v5 + 168) = v6;
  *(double *)(v5 + 144) = (double)(uint64_t)v3;
  v10 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                            + MEMORY[0x24BE92868]);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v8;
  *v8 = v0;
  v8[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowNonPace(executeSashGroupOnWatch:isSingleThreshold:_:);
  return v10(0xD000000000000016, 0x800000024A61EB90, v5);
}

uint64_t specialized WorkoutRemindersCATPatternsExecutor.end(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = a3;
  *(_BYTE *)(v3 + 56) = a1;
  return swift_task_switch();
}

uint64_t specialized WorkoutRemindersCATPatternsExecutor.end(executeSashGroupOnWatch:_:)()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(unint64_t, unint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_BYTE *)(v0 + 56);
  v3 = objc_msgSend(*(id *)(v1 + 16), sel_workoutType);
  v4 = *(_QWORD *)(v1 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  v5 = swift_allocObject();
  *(_QWORD *)(v0 + 32) = v5;
  *(_OWORD *)(v5 + 16) = xmmword_24A61CB20;
  *(_QWORD *)(v5 + 32) = 0x646E497473727562;
  *(_QWORD *)(v5 + 40) = 0xEA00000000007865;
  v6 = MEMORY[0x24BEE13C8];
  *(double *)(v5 + 48) = (double)v4;
  *(_QWORD *)(v5 + 72) = v6;
  *(_QWORD *)(v5 + 80) = 0xD000000000000017;
  *(_QWORD *)(v5 + 88) = 0x800000024A61E2A0;
  v7 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v5 + 96) = v2;
  *(_QWORD *)(v5 + 120) = v7;
  *(_QWORD *)(v5 + 128) = 0x5474756F6B726F77;
  *(_QWORD *)(v5 + 136) = 0xEB00000000657079;
  *(_QWORD *)(v5 + 168) = v6;
  *(double *)(v5 + 144) = (double)(uint64_t)v3;
  v10 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                            + MEMORY[0x24BE92868]);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v8;
  *v8 = v0;
  v8[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.segmentMarked(executeSashGroupOnWatch:_:);
  return v10(0xD000000000000014, 0x800000024A61EBB0, v5);
}

uint64_t specialized WorkoutRemindersCATPatternsExecutor.resume(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 96) = a2;
  *(_QWORD *)(v3 + 104) = a3;
  *(_BYTE *)(v3 + 144) = a1;
  return swift_task_switch();
}

uint64_t specialized WorkoutRemindersCATPatternsExecutor.resume(executeSashGroupOnWatch:_:)()
{
  uint64_t v0;
  char v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(unint64_t, unint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 144);
  v2 = *(void **)(*(_QWORD *)(v0 + 104) + 16);
  v3 = (double)(unint64_t)objc_msgSend(v2, sel_workoutActivityType);
  v4 = (double)(uint64_t)objc_msgSend(v2, sel_workoutLocationType);
  v5 = (double)(uint64_t)objc_msgSend(v2, sel_workoutSwimmingLocationType);
  v6 = AFSiriWorkoutReminder.workoutAnnouncementDialogIdentifier.getter();
  *(_QWORD *)(v0 + 16) = 0;
  *(_BYTE *)(v0 + 24) = 1;
  *(_BYTE *)(v0 + 25) = v1;
  *(double *)(v0 + 32) = v3;
  *(_BYTE *)(v0 + 40) = 0;
  *(double *)(v0 + 48) = v4;
  *(_BYTE *)(v0 + 56) = 0;
  *(double *)(v0 + 64) = v5;
  *(_BYTE *)(v0 + 72) = 0;
  *(_QWORD *)(v0 + 80) = v6;
  *(_QWORD *)(v0 + 88) = v7;
  v8 = WorkoutRemindersResumeParameters.asKeyValuePairs()();
  *(_QWORD *)(v0 + 112) = v8;
  swift_bridgeObjectRelease();
  v11 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                            + MEMORY[0x24BE92868]);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v9;
  *v9 = v0;
  v9[1] = specialized WorkoutRemindersCATPatternsExecutor.resume(executeSashGroupOnWatch:_:);
  return v11(0xD000000000000017, 0x800000024A61EBD0, v8);
}

{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 136));
}

{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t specialized WorkoutRemindersCATPatternsExecutor.resume(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 128) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)(v4 + 136) = a1;
  }
  return swift_task_switch();
}

uint64_t outlined retain of WorkoutRemindersResumeParameters(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t storeEnumTagSinglePayload for VoiceFeedbackErrors(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A60F7B0 + 4 * byte_24A61CF55[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_24A60F7E4 + 4 * byte_24A61CF50[v4]))();
}

uint64_t sub_24A60F7E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A60F7EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A60F7F4);
  return result;
}

uint64_t sub_24A60F800(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A60F808);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_24A60F80C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A60F814(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for VoiceFeedbackErrors()
{
  return &type metadata for VoiceFeedbackErrors;
}

uint64_t storeEnumTagSinglePayload for WorkoutReminderErrors(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24A60F8C8 + 4 * byte_24A61CF5A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24A60F8E8 + 4 * byte_24A61CF5F[v4]))();
}

_BYTE *sub_24A60F8C8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24A60F8E8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24A60F8F0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24A60F8F8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24A60F900(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24A60F908(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for WorkoutReminderErrors()
{
  return &type metadata for WorkoutReminderErrors;
}

BOOL specialized Sequence<>.contains(_:)(_BOOL8 result, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t i;
  uint64_t v5;
  int v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v3 = result;
  if (*(_BYTE *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 33; ; ++i)
  {
    v5 = i - 31;
    if (__OFADD__(i - 32, 1))
      break;
    v6 = *(unsigned __int8 *)(a2 + i);
    result = v6 == v3;
    if (v6 == v3 || v5 == v2)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t specialized Sequence<>.contains(_:)(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t specialized Sequence<>.contains(_:)(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  _BOOL8 v5;
  BOOL v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  if (*(_QWORD *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 5; ; ++i)
  {
    v4 = i - 3;
    if (__OFADD__(i - 4, 1))
      break;
    v6 = *(_QWORD *)(a2 + 8 * i) == result;
    v5 = v6;
    v6 = v6 || v4 == v2;
    if (v6)
      return v5;
  }
  __break(1u);
  return result;
}

uint64_t AFSiriWorkoutReminder.workoutAnnouncementDialogIdentifier.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  Swift::String v11;
  Swift::String v12;

  if (objc_msgSend(v0, sel_workoutActivityType) != (id)46)
  {
    if (objc_msgSend(v0, sel_workoutLocationType) != (id)1
      && (specialized Sequence<>.contains(_:)((uint64_t)objc_msgSend(v0, sel_workoutActivityType), (uint64_t)&outlined read-only object #0 of AFSiriWorkoutReminder.workoutAnnouncementDialogIdentifier.getter) & 1) != 0)
    {
      v7 = objc_msgSend(v0, sel_workoutLocationType);
      v2 = 0xE700000000000000;
      v3 = 0xE700000000000000;
      v4 = 0x726F6F6474756FLL;
      v5 = 0x726F6F646E69;
      if (v7 == (id)2)
        v2 = 0xE600000000000000;
      else
        v5 = 0x6E776F6E6B6E75;
      v6 = v7 == (id)3;
      goto LABEL_13;
    }
    return HKWorkoutActivityType.dialogIdentifier.getter((uint64_t)objc_msgSend(v0, sel_workoutActivityType));
  }
  if (!objc_msgSend(v0, sel_workoutSwimmingLocationType))
    return HKWorkoutActivityType.dialogIdentifier.getter((uint64_t)objc_msgSend(v0, sel_workoutActivityType));
  v1 = objc_msgSend(v0, sel_workoutSwimmingLocationType);
  v2 = 0xE700000000000000;
  v3 = 0xEA00000000007265;
  v4 = 0x7461775F6E65706FLL;
  v5 = 1819242352;
  if (v1 == (id)1)
    v2 = 0xE400000000000000;
  else
    v5 = 0x6E776F6E6B6E75;
  v6 = v1 == (id)2;
LABEL_13:
  if (v6)
    v8 = v4;
  else
    v8 = v5;
  if (v6)
    v9 = v3;
  else
    v9 = v2;
  v10 = v9;
  String.append(_:)(*(Swift::String *)&v8);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 95;
  v11._object = (void *)0xE100000000000000;
  String.append(_:)(v11);
  v12._countAndFlagsBits = HKWorkoutActivityType.dialogIdentifier.getter((uint64_t)objc_msgSend(v0, sel_workoutActivityType));
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t HKWorkoutActivityType.dialogIdentifier.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;

  v1 = a1 - 1;
  result = 0xD000000000000011;
  switch(v1)
  {
    case 0:
    case 16:
    case 83:
      return result;
    case 1:
      return 0x79726568637261;
    case 2:
      return 0xD000000000000013;
    case 3:
      return 0x6F746E696D646162;
    case 4:
      v3 = 1702060386;
      return v3 | 0x6C6C616200000000;
    case 5:
      v4 = 0x74656B736162;
      goto LABEL_86;
    case 6:
      v5 = 1819766626;
      return v5 | 0x676E6900000000;
    case 7:
      return 0x676E69786F62;
    case 8:
      return 0x676E69626D696C63;
    case 9:
      return 0x74656B63697263;
    case 10:
      return 0x72745F73736F7263;
    case 11:
      v5 = 1819440483;
      return v5 | 0x676E6900000000;
    case 12:
      v5 = 1818458467;
      return v5 | 0x676E6900000000;
    case 13:
      return 0x65636E6164;
    case 14:
      return 0xD000000000000017;
    case 15:
      return 0x63697470696C6C65;
    case 17:
      v5 = 1668179302;
      return v5 | 0x676E6900000000;
    case 18:
      v5 = 1752394086;
      return v5 | 0x676E6900000000;
    case 19:
      return 0xD00000000000001CLL;
    case 20:
      return 1718382439;
    case 21:
      return 0x697473616E6D7967;
    case 22:
      v3 = 1684955496;
      return v3 | 0x6C6C616200000000;
    case 23:
      return 0x676E696B6968;
    case 24:
      return 0x79656B636F68;
    case 25:
      v5 = 1953396072;
      return v5 | 0x676E6900000000;
    case 26:
      return 0x6573736F7263616CLL;
    case 27:
      return 0x5F6C61697472616DLL;
    case 28:
      return 0x646E615F646E696DLL;
    case 29:
      return 0xD00000000000001FLL;
    case 30:
      return 0x735F656C64646170;
    case 31:
      return 2036427888;
    case 32:
      return 0xD000000000000018;
    case 33:
      return 0x6274657571636172;
    case 34:
      return 0x676E69776F72;
    case 35:
      return 0x7962677572;
    case 36:
      v5 = 1852732786;
      return v5 | 0x676E6900000000;
    case 37:
      v5 = 1818845555;
      return v5 | 0x676E6900000000;
    case 38:
      v6 = 1952541555;
      return v6 | 0x5F676E6900000000;
    case 39:
      v7 = 2003791475;
      return v7 | 0x6F70735F00000000;
    case 40:
      return 0x726563636F73;
    case 41:
      v3 = 1952870259;
      return v3 | 0x6C6C616200000000;
    case 42:
      return 0x687361757173;
    case 43:
      return 0x6C635F7269617473;
    case 44:
      v6 = 1718777203;
      return v6 | 0x5F676E6900000000;
    case 45:
      return 0x676E696D6D697773;
    case 46:
      return 0x65745F656C626174;
    case 47:
      return 0x73696E6E6574;
    case 48:
      return 0x6E615F6B63617274;
    case 49:
      return 0xD00000000000001DLL;
    case 50:
      v4 = 0x79656C6C6F76;
      goto LABEL_86;
    case 51:
      v5 = 1802264951;
      return v5 | 0x676E6900000000;
    case 52:
      return 0x69665F7265746177;
    case 53:
      return 0x6F705F7265746177;
    case 54:
      return 0x70735F7265746177;
    case 55:
      return 0x6E696C7473657277;
    case 56:
      return 1634168697;
    case 57:
      return 0x6572726162;
    case 58:
      v8 = 1701998435;
      return v8 | 0x6172745F00000000;
    case 59:
      return 0xD000000000000014;
    case 60:
      return 0x6C6C69686E776F64;
    case 61:
      return 0x6C69626978656C66;
    case 62:
      return 0xD000000000000020;
    case 63:
      return 0x706F725F706D756ALL;
    case 64:
      return 0x69786F626B63696BLL;
    case 65:
      return 0x736574616C6970;
    case 66:
      return 0x72616F62776F6E73;
    case 67:
      return 0x737269617473;
    case 68:
      v8 = 1885697139;
      return v8 | 0x6172745F00000000;
    case 69:
      return 0xD000000000000014;
    case 70:
      return 0xD000000000000013;
    case 71:
      return 0x6968635F696174;
    case 72:
      return 0x61635F646578696DLL;
    case 73:
      return 0x6379635F646E6168;
    case 74:
      v7 = 1668508004;
      return v7 | 0x6F70735F00000000;
    case 75:
      return 0x5F7373656E746966;
    case 76:
      v9 = 0x6F6964726163;
      goto LABEL_84;
    case 77:
      v9 = 0x6C6169636F73;
LABEL_84:
      result = v9 & 0xFFFFFFFFFFFFLL | 0x645F000000000000;
      break;
    case 78:
      v4 = 0x656C6B636970;
LABEL_86:
      result = v4 & 0xFFFFFFFFFFFFLL | 0x6162000000000000;
      break;
    case 79:
      result = 0x6E776F646C6F6F63;
      break;
    case 81:
      result = 0x6B69625F6D697773;
      break;
    case 82:
      result = 0x697469736E617274;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t VoiceFeedbackMetricType.rawValue.getter(uint64_t result)
{
  return result;
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance VoiceFeedbackMetricType@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized VoiceFeedbackMetricType.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance VoiceFeedbackMetricType()
{
  lazy protocol witness table accessor for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType();
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance VoiceFeedbackMetricType()
{
  lazy protocol witness table accessor for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType();
  return RawRepresentable<>.encode(to:)();
}

void one-time initialization function for noPaceFormatMetrics()
{
  noPaceFormatMetrics._rawValue = &outlined read-only object #0 of one-time initialization function for noPaceFormatMetrics;
}

uint64_t VoiceFeedbackMetricType.init(_:)(uint64_t a1)
{
  if ((unint64_t)(a1 - 4) > 0xC)
    return 8;
  else
    return byte_24A61D35A[a1 - 4];
}

unint64_t specialized VoiceFeedbackMetricType.init(rawValue:)(unint64_t result)
{
  if (result >= 8)
    return 8;
  return result;
}

unint64_t instantiation function for generic protocol witness table for VoiceFeedbackMetricType(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for VoiceFeedbackMetricType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for VoiceFeedbackMetricType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A610764 + 4 * byte_24A61D205[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_24A610798 + 4 * byte_24A61D200[v4]))();
}

uint64_t sub_24A610798(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A6107A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A6107A8);
  return result;
}

uint64_t sub_24A6107B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A6107BCLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_24A6107C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A6107C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for VoiceFeedbackMetricType()
{
  return &type metadata for VoiceFeedbackMetricType;
}

uint64_t BasicVoiceFeedbackAlerts.executePattern(wrapper:)(uint64_t a1, char a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 128) = a2;
  *(_QWORD *)(v2 + 16) = a1;
  return swift_task_switch();
}

uint64_t BasicVoiceFeedbackAlerts.executePattern(wrapper:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t result;
  _BYTE *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;

  switch(*(_BYTE *)(v0 + 128))
  {
    case 0:
      __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
      v1 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 24) = v1;
      *v1 = v0;
      v1[1] = BasicVoiceFeedbackAlerts.executePattern(wrapper:);
      result = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:)(0);
      break;
    case 3:
      __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
      v4 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 32) = v4;
      *v4 = v0;
      v4[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance TimeSplitModel;
      result = WorkoutVoiceFeedbackCATPatternsExecutor.intervalEnded(executeSashGroupOnWatch:)(0);
      break;
    case 7:
      __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
      v5 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 40) = v5;
      *v5 = v0;
      v5[1] = BasicVoiceFeedbackAlerts.executePattern(wrapper:);
      result = WorkoutVoiceFeedbackCATPatternsExecutor.moveRingCompleted(executeSashGroupOnWatch:)(0);
      break;
    case 9:
      __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
      v6 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 112) = v6;
      *v6 = v0;
      v6[1] = BasicVoiceFeedbackAlerts.executePattern(wrapper:);
      result = WorkoutVoiceFeedbackCATPatternsExecutor.workoutPaused(executeSashGroupOnWatch:)(0);
      break;
    case 0xA:
      __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
      v7 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 48) = v7;
      *v7 = v0;
      v7[1] = BasicVoiceFeedbackAlerts.executePattern(wrapper:);
      result = WorkoutVoiceFeedbackCATPatternsExecutor.raceAheadOfGhost(executeSashGroupOnWatch:)(0);
      break;
    case 0xB:
      __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
      v8 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 56) = v8;
      *v8 = v0;
      v8[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance AboveTargetZoneModel;
      result = WorkoutVoiceFeedbackCATPatternsExecutor.raceBehindGhost(executeSashGroupOnWatch:)(0);
      break;
    case 0xC:
      __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
      v9 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 64) = v9;
      *v9 = v0;
      v9[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance LapCompletionModel;
      result = WorkoutVoiceFeedbackCATPatternsExecutor.raceExpired(executeSashGroupOnWatch:)(0);
      break;
    case 0xD:
      __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
      v10 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 72) = v10;
      *v10 = v0;
      v10[1] = BasicVoiceFeedbackAlerts.executePattern(wrapper:);
      result = WorkoutVoiceFeedbackCATPatternsExecutor.raceOffRoute(executeSashGroupOnWatch:)(0);
      break;
    case 0xE:
      __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
      v11 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 80) = v11;
      *v11 = v0;
      v11[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance DistanceSplitModel;
      result = WorkoutVoiceFeedbackCATPatternsExecutor.raceOnRoute(executeSashGroupOnWatch:)(0);
      break;
    case 0xF:
      __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
      v12 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 88) = v12;
      *v12 = v0;
      v12[1] = BasicVoiceFeedbackAlerts.executePattern(wrapper:);
      result = WorkoutVoiceFeedbackCATPatternsExecutor.raceRouteCompletedRaceLost(executeSashGroupOnWatch:)(0);
      break;
    case 0x10:
      __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
      v13 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 96) = v13;
      *v13 = v0;
      v13[1] = BasicVoiceFeedbackAlerts.executePattern(wrapper:);
      result = WorkoutVoiceFeedbackCATPatternsExecutor.raceRouteCompleteRaceWon(executeSashGroupOnWatch:)(0);
      break;
    case 0x11:
      __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
      v14 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 120) = v14;
      *v14 = v0;
      v14[1] = BasicVoiceFeedbackAlerts.executePattern(wrapper:);
      result = WorkoutVoiceFeedbackCATPatternsExecutor.workoutResumed(executeSashGroupOnWatch:)(0);
      break;
    case 0x13:
      __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
      v15 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v15;
      *v15 = v0;
      v15[1] = BasicVoiceFeedbackAlerts.executePattern(wrapper:);
      result = WorkoutVoiceFeedbackCATPatternsExecutor.trackStatusChanged(executeSashGroupOnWatch:)(0);
      break;
    default:
      lazy protocol witness table accessor for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors();
      swift_allocError();
      *v3 = 1;
      swift_willThrow();
      result = (*(uint64_t (**)(void))(v0 + 8))();
      break;
  }
  return result;
}

uint64_t BasicVoiceFeedbackAlerts.executePattern(wrapper:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance BasicVoiceFeedbackAlerts(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  char v4;
  uint64_t v5;

  v4 = *v1;
  v5 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance BasicVoiceFeedbackAlerts;
  *(_BYTE *)(v5 + 128) = v4;
  *(_QWORD *)(v5 + 16) = a1;
  return swift_task_switch();
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

void __swiftcall VoiceFeedbackWorkoutStep.init(magnitude:unit:stepType:targetZone:)(WorkoutAnnouncements::VoiceFeedbackWorkoutStep *__return_ptr retstr, Swift::Double_optional magnitude, Swift::String_optional unit, WorkoutAnnouncements::VoiceFeedbackStepType stepType, WorkoutAnnouncements::VoiceFeedbackTargetZone_optional *targetZone)
{
  uint64_t v5;
  WorkoutAnnouncements::VoiceFeedbackStepType v6;
  void *v7;
  void *object;
  char countAndFlagsBits;
  Swift::Double v10;
  __int16 v12;
  __int128 v13;
  Swift::String v14;
  __int128 v15;
  _OWORD v16[3];
  __int16 v17;

  v6 = (char)targetZone;
  v7 = (void *)stepType;
  object = unit.value._object;
  countAndFlagsBits = unit.value._countAndFlagsBits;
  v10 = *(double *)&magnitude.is_nil;
  outlined init with take of VoiceFeedbackTargetZone?(v5, (uint64_t)v16);
  v12 = v17;
  v13 = v16[0];
  v14 = (Swift::String)v16[1];
  v15 = v16[2];
  retstr->magnitude.value = v10;
  retstr->magnitude.is_nil = countAndFlagsBits & 1;
  retstr->unit.value._countAndFlagsBits = (uint64_t)object;
  retstr->unit.value._object = v7;
  retstr->stepType = v6;
  *(_OWORD *)&retstr->targetZone.value.minMagnitude = v13;
  retstr->targetZone.value.unit = v14;
  *(_OWORD *)&retstr->targetZone.value.metricType = v15;
  *(_WORD *)&retstr->targetZone.value.zoneIndex.is_nil = v12;
}

uint64_t outlined init with take of VoiceFeedbackTargetZone?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double VoiceFeedbackWorkoutStep.init(from:)@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  _OWORD v7[4];
  _OWORD v8[2];

  specialized VoiceFeedbackWorkoutStep.init(from:)(a1, (uint64_t)v7);
  if (!v2)
  {
    v5 = v7[3];
    a2[2] = v7[2];
    a2[3] = v5;
    a2[4] = v8[0];
    *(_OWORD *)((char *)a2 + 74) = *(_OWORD *)((char *)v8 + 10);
    result = *(double *)v7;
    v6 = v7[1];
    *a2 = v7[0];
    a2[1] = v6;
  }
  return result;
}

uint64_t VoiceFeedbackWorkoutStep.CodingKeys.stringValue.getter(char a1)
{
  return *(_QWORD *)&aMagnitudunit[8 * a1];
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance VoiceFeedbackWorkoutStep.CodingKeys()
{
  char *v0;

  return VoiceFeedbackWorkoutStep.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance VoiceFeedbackWorkoutStep.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized VoiceFeedbackWorkoutStep.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance VoiceFeedbackWorkoutStep.CodingKeys()
{
  lazy protocol witness table accessor for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance VoiceFeedbackWorkoutStep.CodingKeys()
{
  lazy protocol witness table accessor for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t VoiceFeedbackWorkoutStep.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[55];
  char v11;
  _BYTE v12[56];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<VoiceFeedbackWorkoutStep.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v10[0] = 0;
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v2)
  {
    v10[0] = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v10[0] = *(_BYTE *)(v3 + 32);
    v11 = 2;
    lazy protocol witness table accessor for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    outlined init with take of VoiceFeedbackTargetZone?(v3 + 40, (uint64_t)v12);
    outlined init with take of VoiceFeedbackTargetZone?((uint64_t)v12, (uint64_t)v10);
    v11 = 3;
    lazy protocol witness table accessor for type VoiceFeedbackTargetZone and conformance VoiceFeedbackTargetZone();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

double protocol witness for Decodable.init(from:) in conformance VoiceFeedbackWorkoutStep@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  _OWORD v7[4];
  _OWORD v8[2];

  specialized VoiceFeedbackWorkoutStep.init(from:)(a1, (uint64_t)v7);
  if (!v2)
  {
    v5 = v7[3];
    a2[2] = v7[2];
    a2[3] = v5;
    a2[4] = v8[0];
    *(_OWORD *)((char *)a2 + 74) = *(_OWORD *)((char *)v8 + 10);
    result = *(double *)v7;
    v6 = v7[1];
    *a2 = v7[0];
    a2[1] = v6;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance VoiceFeedbackWorkoutStep(_QWORD *a1)
{
  return VoiceFeedbackWorkoutStep.encode(to:)(a1);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance VoiceFeedbackWorkoutStep(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[4];
  _OWORD v8[2];
  _OWORD v9[4];
  _OWORD v10[2];

  v2 = a1[3];
  v7[2] = a1[2];
  v7[3] = v2;
  v8[0] = a1[4];
  *(_OWORD *)((char *)v8 + 10) = *(_OWORD *)((char *)a1 + 74);
  v3 = a1[1];
  v7[0] = *a1;
  v7[1] = v3;
  v4 = a2[3];
  v9[2] = a2[2];
  v9[3] = v4;
  v10[0] = a2[4];
  *(_OWORD *)((char *)v10 + 10) = *(_OWORD *)((char *)a2 + 74);
  v5 = a2[1];
  v9[0] = *a2;
  v9[1] = v5;
  return specialized static VoiceFeedbackWorkoutStep.__derived_struct_equals(_:_:)((uint64_t)v7, (uint64_t)v9);
}

BOOL specialized static VoiceFeedbackWorkoutStep.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _BOOL8 result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int16 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;

  v4 = *(_BYTE *)(a2 + 8);
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 8))
      return 0;
  }
  else
  {
    if (*(double *)a1 != *(double *)a2)
      v4 = 1;
    if ((v4 & 1) != 0)
      return 0;
  }
  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a2 + 24);
  if (!v5)
  {
    if (v6)
      return 0;
    goto LABEL_14;
  }
  if (!v6)
    return 0;
  if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && v5 == v6
    || (v7 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v7 & 1) != 0))
  {
LABEL_14:
    if (*(unsigned __int8 *)(a1 + 32) == *(unsigned __int8 *)(a2 + 32))
    {
      v9 = *(_QWORD *)(a1 + 64);
      v10 = *(_QWORD *)(a2 + 64);
      if (v9)
      {
        if (!v10)
          return 0;
        v11 = *(_QWORD *)(a1 + 56);
        v12 = *(_QWORD *)(a1 + 72);
        v13 = *(_QWORD *)(a1 + 80);
        v14 = *(_WORD *)(a1 + 88);
        v15 = *(_OWORD *)(a2 + 40);
        v16 = *(_QWORD *)(a2 + 56);
        v17 = *(_QWORD *)(a2 + 72);
        v18 = *(_QWORD *)(a2 + 80);
        v19 = *(_WORD *)(a2 + 88);
        v20 = *(_OWORD *)(a1 + 40);
        v21 = v11;
        v22 = v9;
        v23 = v12;
        v24 = v13;
        v25 = v14 & 0x101;
        v26 = v15;
        v27 = v16;
        v28 = v10;
        v29 = v17;
        v30 = v18;
        v31 = v19 & 0x101;
        return (specialized static VoiceFeedbackTargetZone.__derived_struct_equals(_:_:)((uint64_t)&v20, (uint64_t)&v26) & 1) != 0;
      }
      if (!v10)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t specialized VoiceFeedbackWorkoutStep.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  __int128 v23;
  int v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int16 v31;
  int v32;
  char v33;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<VoiceFeedbackWorkoutStep.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    goto LABEL_3;
  LOBYTE(v26) = 0;
  v9 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  v32 = v10;
  LOBYTE(v26) = 1;
  v11 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  v14 = v13;
  v25 = v11;
  LOBYTE(v26) = 2;
  swift_bridgeObjectRetain();
  v15 = KeyedDecodingContainer.decode(_:forKey:)();
  v16 = specialized VoiceFeedbackStepType.init(rawValue:)(v15);
  if (v16 == 4)
  {
    swift_bridgeObjectRelease();
    LOBYTE(v26) = 2;
    type metadata accessor for DecodingError();
    swift_allocError();
    lazy protocol witness table accessor for type KeyedDecodingContainer<VoiceFeedbackWorkoutStep.CodingKeys> and conformance KeyedDecodingContainer<A>();
    static DecodingError.dataCorruptedError<A>(forKey:in:debugDescription:)();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
LABEL_3:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v24 = v16;
  v33 = 3;
  lazy protocol witness table accessor for type VoiceFeedbackTargetZone and conformance VoiceFeedbackTargetZone();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v23 = v26;
  v18 = v27;
  v17 = v28;
  v19 = v29;
  v20 = v30;
  v22 = v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v9;
  *(_BYTE *)(a2 + 8) = v32 & 1;
  *(_QWORD *)(a2 + 16) = v25;
  *(_QWORD *)(a2 + 24) = v14;
  *(_BYTE *)(a2 + 32) = v24;
  *(_OWORD *)(a2 + 40) = v23;
  *(_QWORD *)(a2 + 56) = v18;
  *(_QWORD *)(a2 + 64) = v17;
  *(_QWORD *)(a2 + 72) = v19;
  *(_QWORD *)(a2 + 80) = v20;
  *(_WORD *)(a2 + 88) = v22;
  return result;
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackWorkoutStep.CodingKeys, &unk_251BEBFE8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackWorkoutStep.CodingKeys, &unk_251BEBFE8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackWorkoutStep.CodingKeys, &unk_251BEBFE8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackWorkoutStep.CodingKeys, &unk_251BEBFE8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackTargetZone and conformance VoiceFeedbackTargetZone()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackTargetZone and conformance VoiceFeedbackTargetZone;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackTargetZone and conformance VoiceFeedbackTargetZone)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackTargetZone, &type metadata for VoiceFeedbackTargetZone);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackTargetZone and conformance VoiceFeedbackTargetZone);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackTargetZone and conformance VoiceFeedbackTargetZone;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackTargetZone and conformance VoiceFeedbackTargetZone)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackTargetZone, &type metadata for VoiceFeedbackTargetZone);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackTargetZone and conformance VoiceFeedbackTargetZone);
  }
  return result;
}

uint64_t destroy for VoiceFeedbackWorkoutStep()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for VoiceFeedbackWorkoutStep(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v4 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v4;
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_WORD *)(a1 + 88) = *(_WORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for VoiceFeedbackWorkoutStep(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  *(_QWORD *)(a1 + 40) = a2[5];
  *(_QWORD *)(a1 + 48) = a2[6];
  *(_QWORD *)(a1 + 56) = a2[7];
  *(_QWORD *)(a1 + 64) = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 72) = *((_BYTE *)a2 + 72);
  *(_BYTE *)(a1 + 73) = *((_BYTE *)a2 + 73);
  v5 = a2[10];
  *(_BYTE *)(a1 + 88) = *((_BYTE *)a2 + 88);
  *(_QWORD *)(a1 + 80) = v5;
  *(_BYTE *)(a1 + 89) = *((_BYTE *)a2 + 89);
  return a1;
}

__n128 __swift_memcpy90_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 74) = *(_OWORD *)(a2 + 74);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for VoiceFeedbackWorkoutStep(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 72) = *(_WORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_BYTE *)(a1 + 89) = *(_BYTE *)(a2 + 89);
  return a1;
}

uint64_t getEnumTagSinglePayload for VoiceFeedbackWorkoutStep(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 90))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for VoiceFeedbackWorkoutStep(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 88) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 90) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 90) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for VoiceFeedbackWorkoutStep()
{
  return &type metadata for VoiceFeedbackWorkoutStep;
}

uint64_t storeEnumTagSinglePayload for VoiceFeedbackWorkoutStep.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A611C74 + 4 * byte_24A61D3A5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24A611CA8 + 4 * byte_24A61D3A0[v4]))();
}

uint64_t sub_24A611CA8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A611CB0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A611CB8);
  return result;
}

uint64_t sub_24A611CC4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A611CCCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24A611CD0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A611CD8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for VoiceFeedbackWorkoutStep.CodingKeys()
{
  return &unk_251BEBFE8;
}

uint64_t specialized VoiceFeedbackWorkoutStep.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x647574696E67616DLL && a2 == 0xE900000000000065;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1953066613 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6570795470657473 && a2 == 0xE800000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6F5A746567726174 && a2 == 0xEA0000000000656ELL)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

unint64_t lazy protocol witness table accessor for type KeyedDecodingContainer<VoiceFeedbackWorkoutStep.CodingKeys> and conformance KeyedDecodingContainer<A>()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type KeyedDecodingContainer<VoiceFeedbackWorkoutStep.CodingKeys> and conformance KeyedDecodingContainer<A>;
  if (!lazy protocol witness table cache variable for type KeyedDecodingContainer<VoiceFeedbackWorkoutStep.CodingKeys> and conformance KeyedDecodingContainer<A>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for KeyedDecodingContainer<VoiceFeedbackWorkoutStep.CodingKeys>);
    result = MEMORY[0x24BD152CC](MEMORY[0x24BEE33F8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type KeyedDecodingContainer<VoiceFeedbackWorkoutStep.CodingKeys> and conformance KeyedDecodingContainer<A>);
  }
  return result;
}

uint64_t SegmentModel.alertType.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*SegmentModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

WorkoutAnnouncements::SegmentModel __swiftcall SegmentModel.init(index:)(Swift::Int index)
{
  WorkoutAnnouncements::VoiceFeedbackAlertType v2;
  WorkoutAnnouncements::SegmentModel result;

  v2 = WorkoutAnnouncements_VoiceFeedbackAlertType_segment;
  result.index = index;
  result.alertType = v2;
  return result;
}

BOOL static SegmentModel.__derived_struct_equals(_:_:)(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

uint64_t SegmentModel.CodingKeys.stringValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x7865646E69;
  else
    return 0x7079547472656C61;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SegmentModel.CodingKeys()
{
  char *v0;

  return SegmentModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SegmentModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized SegmentModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SegmentModel.CodingKeys()
{
  lazy protocol witness table accessor for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SegmentModel.CodingKeys()
{
  lazy protocol witness table accessor for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t SegmentModel.encode(to:)(_QWORD *a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;
  char v12;
  char v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SegmentModel.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v13 = a2;
  v12 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    v11 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t lazy protocol witness table accessor for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for SegmentModel.CodingKeys, &unk_251BEC1F0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for SegmentModel.CodingKeys, &unk_251BEC1F0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for SegmentModel.CodingKeys, &unk_251BEC1F0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for SegmentModel.CodingKeys, &unk_251BEC1F0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys);
  }
  return result;
}

uint64_t SegmentModel.init(from:)(_QWORD *a1)
{
  return specialized SegmentModel.init(from:)(a1);
}

uint64_t protocol witness for Decodable.init(from:) in conformance SegmentModel@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = specialized SegmentModel.init(from:)(a1);
  if (!v2)
  {
    *(_BYTE *)a2 = result;
    *(_QWORD *)(a2 + 8) = v5;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance SegmentModel(_QWORD *a1)
{
  char *v1;

  return SegmentModel.encode(to:)(a1, *v1);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SegmentModel(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && *((_QWORD *)a1 + 1) == *((_QWORD *)a2 + 1);
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance SegmentModel(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 8);
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance SegmentModel()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(char, uint64_t, uint64_t);

  v1 = *__swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
  v4 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.segmentMarked(executeSashGroupOnWatch:_:)
                                                      + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.segmentMarked(executeSashGroupOnWatch:_:));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v2;
  *v2 = v0;
  v2[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance TimeSplitModel;
  return v4(0, v1, *(_QWORD *)(v0 + 24));
}

uint64_t specialized SegmentModel.init(with:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;

  v2 = type metadata accessor for Logger();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(specialized Sequence.compactMap<A>(_:)(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
    v6 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v6 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v28 = v6;
  v7 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v7, 1, &v28);
  swift_bridgeObjectRelease();
  v8 = v28;
  v9 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
  swift_retain_n();
  v10 = Logger.logObject.getter();
  v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v25 = swift_slowAlloc();
    *(_QWORD *)&v28 = v25;
    *(_DWORD *)v12 = 136315394;
    v27 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0x4D746E656D676553, 0xEC0000006C65646FLL, (uint64_t *)&v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v12 + 12) = 2080;
    lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
    v24 = v2;
    swift_retain();
    v26 = a1;
    v13 = Dictionary.description.getter();
    v23 = v3;
    v15 = v14;
    swift_release();
    v27 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v15, (uint64_t *)&v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A5E6000, v10, v11, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v12, 0x16u);
    v16 = v25;
    a1 = v26;
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v16, -1, -1);
    MEMORY[0x24BD15374](v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v24);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  if (*(_QWORD *)(v8 + 16) && (v17 = specialized __RawDictionaryStorage.find<A>(_:)(3), (v18 & 1) != 0))
  {
    outlined init with copy of Any(*(_QWORD *)(v8 + 56) + 32 * v17, (uint64_t)&v28);
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
  }
  swift_release();
  if (*((_QWORD *)&v29 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v19 = 18;
      v20 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1, 0x12u);
      swift_bridgeObjectRelease();
      if (v20)
        return v19;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    outlined destroy of Any?((uint64_t)&v28);
  }
  return 25;
}

uint64_t specialized SegmentModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7079547472656C61 && a2 == 0xE900000000000065;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
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

uint64_t specialized SegmentModel.init(from:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE v8[16];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SegmentModel.CodingKeys>);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  v8[14] = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v6 = v8[15];
  v8[13] = 1;
  KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return v6;
}

unint64_t instantiation function for generic protocol witness table for SegmentModel(_QWORD *a1)
{
  unint64_t result;

  a1[1] = lazy protocol witness table accessor for type SegmentModel and conformance SegmentModel();
  a1[2] = lazy protocol witness table accessor for type SegmentModel and conformance SegmentModel();
  result = lazy protocol witness table accessor for type SegmentModel and conformance SegmentModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type SegmentModel and conformance SegmentModel()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SegmentModel and conformance SegmentModel;
  if (!lazy protocol witness table cache variable for type SegmentModel and conformance SegmentModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for SegmentModel, &type metadata for SegmentModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SegmentModel and conformance SegmentModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SegmentModel and conformance SegmentModel;
  if (!lazy protocol witness table cache variable for type SegmentModel and conformance SegmentModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for SegmentModel, &type metadata for SegmentModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SegmentModel and conformance SegmentModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SegmentModel and conformance SegmentModel;
  if (!lazy protocol witness table cache variable for type SegmentModel and conformance SegmentModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for SegmentModel, &type metadata for SegmentModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SegmentModel and conformance SegmentModel);
  }
  return result;
}

ValueMetadata *type metadata accessor for SegmentModel()
{
  return &type metadata for SegmentModel;
}

uint64_t storeEnumTagSinglePayload for SegmentModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A612AEC + 4 * byte_24A61D5C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24A612B20 + 4 * byte_24A61D5C0[v4]))();
}

uint64_t sub_24A612B20(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A612B28(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A612B30);
  return result;
}

uint64_t sub_24A612B3C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A612B44);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24A612B48(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A612B50(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for SegmentModel.CodingKeys()
{
  return &unk_251BEC1F0;
}

uint64_t UpcomingIntervalModel.alertType.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t UpcomingIntervalModel.alertType.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*UpcomingIntervalModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

void __swiftcall UpcomingIntervalModel.init(completedStep:nextStep:)(WorkoutAnnouncements::UpcomingIntervalModel *__return_ptr retstr, WorkoutAnnouncements::VoiceFeedbackWorkoutStep_optional *completedStep, WorkoutAnnouncements::VoiceFeedbackWorkoutStep *nextStep)
{
  Swift::Double value;
  Swift::Bool is_nil;
  uint64_t countAndFlagsBits;
  void *object;
  WorkoutAnnouncements::VoiceFeedbackStepType stepType;
  uint64_t v9;
  Swift::Int v10;
  __int16 v11;
  Swift::Int v12;
  __int16 v13;
  __int128 v14;
  Swift::String_optional v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  Swift::String unit;
  __int128 v20;
  _OWORD v21[5];
  Swift::Int v22;
  __int16 v23;

  value = nextStep->magnitude.value;
  is_nil = nextStep->magnitude.is_nil;
  countAndFlagsBits = nextStep->unit.value._countAndFlagsBits;
  object = nextStep->unit.value._object;
  stepType = nextStep->stepType;
  unit = nextStep->targetZone.value.unit;
  v20 = *(_OWORD *)&nextStep->targetZone.value.minMagnitude;
  v9 = *(_QWORD *)&nextStep->targetZone.value.metricType;
  v10 = nextStep->targetZone.value.zoneIndex.value;
  v11 = *(_WORD *)&nextStep->targetZone.value.zoneIndex.is_nil;
  outlined init with take of BelowTargetZoneModel?((uint64_t)completedStep, (uint64_t)v21, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
  v12 = v22;
  v13 = v23;
  v14 = v21[0];
  v15 = (Swift::String_optional)v21[1];
  v16 = v21[2];
  v17 = v21[3];
  v18 = v21[4];
  retstr->alertType = WorkoutAnnouncements_VoiceFeedbackAlertType_intervalUpcoming;
  *(_OWORD *)&retstr->completedStep.value.magnitude.value = v14;
  retstr->completedStep.value.unit = v15;
  *(_OWORD *)&retstr->completedStep.value.stepType = v16;
  *(_OWORD *)&retstr->completedStep.value.targetZone.value.maxMagnitude = v17;
  *(_OWORD *)&retstr->completedStep.value.targetZone.value.unit._object = v18;
  retstr->completedStep.value.targetZone.value.zoneIndex.value = v12;
  *(_WORD *)&retstr->completedStep.value.targetZone.value.zoneIndex.is_nil = v13;
  retstr->nextStep.magnitude.value = value;
  retstr->nextStep.magnitude.is_nil = is_nil;
  retstr->nextStep.unit.value._countAndFlagsBits = countAndFlagsBits;
  retstr->nextStep.unit.value._object = object;
  retstr->nextStep.stepType = stepType;
  *(_OWORD *)&retstr->nextStep.targetZone.value.minMagnitude = v20;
  retstr->nextStep.targetZone.value.unit = unit;
  *(_QWORD *)&retstr->nextStep.targetZone.value.metricType = v9;
  retstr->nextStep.targetZone.value.zoneIndex.value = v10;
  *(_WORD *)&retstr->nextStep.targetZone.value.zoneIndex.is_nil = v11;
}

uint64_t UpcomingIntervalModel.CodingKeys.stringValue.getter(char a1)
{
  return *(_QWORD *)&aAlerttypcomple[8 * a1];
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance UpcomingIntervalModel.CodingKeys()
{
  char *v0;

  return UpcomingIntervalModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance UpcomingIntervalModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized UpcomingIntervalModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance UpcomingIntervalModel.CodingKeys()
{
  lazy protocol witness table accessor for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance UpcomingIntervalModel.CodingKeys()
{
  lazy protocol witness table accessor for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t UpcomingIntervalModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  _OWORD v12[4];
  _OWORD v13[2];
  _BYTE v14[96];
  char v15;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<UpcomingIntervalModel.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v12[0]) = *(_BYTE *)v3;
  v15 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    outlined init with take of BelowTargetZoneModel?(v3 + 8, (uint64_t)v14, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
    outlined init with take of BelowTargetZoneModel?((uint64_t)v14, (uint64_t)v12, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
    v15 = 1;
    lazy protocol witness table accessor for type VoiceFeedbackWorkoutStep and conformance VoiceFeedbackWorkoutStep();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    v9 = *(_OWORD *)(v3 + 152);
    v12[2] = *(_OWORD *)(v3 + 136);
    v12[3] = v9;
    v13[0] = *(_OWORD *)(v3 + 168);
    *(_OWORD *)((char *)v13 + 10) = *(_OWORD *)(v3 + 178);
    v10 = *(_OWORD *)(v3 + 120);
    v12[0] = *(_OWORD *)(v3 + 104);
    v12[1] = v10;
    v15 = 2;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

__n128 UpcomingIntervalModel.init(from:)@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[12];
  __int16 v11;

  specialized UpcomingIntervalModel.init(from:)(a1, (uint64_t)v10);
  if (!v2)
  {
    v5 = v10[11];
    *(_OWORD *)(a2 + 160) = v10[10];
    *(_OWORD *)(a2 + 176) = v5;
    *(_WORD *)(a2 + 192) = v11;
    v6 = v10[7];
    *(_OWORD *)(a2 + 96) = v10[6];
    *(_OWORD *)(a2 + 112) = v6;
    v7 = v10[9];
    *(_OWORD *)(a2 + 128) = v10[8];
    *(_OWORD *)(a2 + 144) = v7;
    v8 = v10[3];
    *(_OWORD *)(a2 + 32) = v10[2];
    *(_OWORD *)(a2 + 48) = v8;
    v9 = v10[5];
    *(_OWORD *)(a2 + 64) = v10[4];
    *(_OWORD *)(a2 + 80) = v9;
    result = (__n128)v10[1];
    *(_OWORD *)a2 = v10[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

__n128 protocol witness for Decodable.init(from:) in conformance UpcomingIntervalModel@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[12];
  __int16 v11;

  specialized UpcomingIntervalModel.init(from:)(a1, (uint64_t)v10);
  if (!v2)
  {
    v5 = v10[11];
    *(_OWORD *)(a2 + 160) = v10[10];
    *(_OWORD *)(a2 + 176) = v5;
    *(_WORD *)(a2 + 192) = v11;
    v6 = v10[7];
    *(_OWORD *)(a2 + 96) = v10[6];
    *(_OWORD *)(a2 + 112) = v6;
    v7 = v10[9];
    *(_OWORD *)(a2 + 128) = v10[8];
    *(_OWORD *)(a2 + 144) = v7;
    v8 = v10[3];
    *(_OWORD *)(a2 + 32) = v10[2];
    *(_OWORD *)(a2 + 48) = v8;
    v9 = v10[5];
    *(_OWORD *)(a2 + 64) = v10[4];
    *(_OWORD *)(a2 + 80) = v9;
    result = (__n128)v10[1];
    *(_OWORD *)a2 = v10[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance UpcomingIntervalModel(_QWORD *a1)
{
  return UpcomingIntervalModel.encode(to:)(a1);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UpcomingIntervalModel(uint64_t a1, uint64_t a2)
{
  __int128 v2;
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
  _OWORD v15[12];
  __int16 v16;
  _OWORD v17[12];
  __int16 v18;

  v2 = *(_OWORD *)(a1 + 176);
  v15[10] = *(_OWORD *)(a1 + 160);
  v15[11] = v2;
  v16 = *(_WORD *)(a1 + 192);
  v3 = *(_OWORD *)(a1 + 112);
  v15[6] = *(_OWORD *)(a1 + 96);
  v15[7] = v3;
  v4 = *(_OWORD *)(a1 + 144);
  v15[8] = *(_OWORD *)(a1 + 128);
  v15[9] = v4;
  v5 = *(_OWORD *)(a1 + 48);
  v15[2] = *(_OWORD *)(a1 + 32);
  v15[3] = v5;
  v6 = *(_OWORD *)(a1 + 80);
  v15[4] = *(_OWORD *)(a1 + 64);
  v15[5] = v6;
  v7 = *(_OWORD *)(a1 + 16);
  v15[0] = *(_OWORD *)a1;
  v15[1] = v7;
  v8 = *(_OWORD *)(a2 + 176);
  v17[10] = *(_OWORD *)(a2 + 160);
  v17[11] = v8;
  v18 = *(_WORD *)(a2 + 192);
  v9 = *(_OWORD *)(a2 + 112);
  v17[6] = *(_OWORD *)(a2 + 96);
  v17[7] = v9;
  v10 = *(_OWORD *)(a2 + 144);
  v17[8] = *(_OWORD *)(a2 + 128);
  v17[9] = v10;
  v11 = *(_OWORD *)(a2 + 48);
  v17[2] = *(_OWORD *)(a2 + 32);
  v17[3] = v11;
  v12 = *(_OWORD *)(a2 + 80);
  v17[4] = *(_OWORD *)(a2 + 64);
  v17[5] = v12;
  v13 = *(_OWORD *)(a2 + 16);
  v17[0] = *(_OWORD *)a2;
  v17[1] = v13;
  return specialized static UpcomingIntervalModel.__derived_struct_equals(_:_:)((uint64_t *)v15, (uint64_t *)v17) & 1;
}

uint64_t UpcomingIntervalModel.executePattern(wrapper:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[59] = a1;
  v2[60] = v1;
  v3 = type metadata accessor for Logger();
  v2[61] = v3;
  v2[62] = *(_QWORD *)(v3 - 8);
  v2[63] = swift_task_alloc();
  v2[64] = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters(0);
  v2[65] = swift_task_alloc();
  v2[66] = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(0);
  v2[67] = swift_task_alloc();
  v2[68] = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(0);
  v2[69] = swift_task_alloc();
  v2[70] = swift_task_alloc();
  v2[71] = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(0);
  v2[72] = swift_task_alloc();
  return swift_task_switch();
}

{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[38] = v2;
  v3[39] = a1;
  v3[40] = v1;
  v3[75] = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[41] = v2;
  v3[42] = a1;
  v3[43] = v1;
  v3[78] = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[44] = v2;
  v3[45] = a1;
  v3[46] = v1;
  v3[81] = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[47] = v2;
  v3[48] = a1;
  v3[49] = v1;
  v3[84] = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[50] = v2;
  v3[51] = a1;
  v3[52] = v1;
  v3[87] = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t UpcomingIntervalModel.executePattern(wrapper:)()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t *v10;
  BOOL v11;
  BOOL v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  int *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  int *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  unint64_t v45;
  const char *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  _BOOL4 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t *v62;
  char v63;
  uint64_t v64;
  void (*v65)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v66;
  int *v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  _BYTE *v71;
  uint64_t v72;
  int *v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t (*v77)(unint64_t, unint64_t, uint64_t);
  uint64_t (*v78)(unint64_t, unint64_t, uint64_t);
  uint64_t v79[2];

  v1 = *(_QWORD *)(v0 + 480);
  v2 = *(_OWORD *)(v1 + 120);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v1 + 104);
  *(_OWORD *)(v0 + 32) = v2;
  v3 = *(_OWORD *)(v1 + 152);
  v4 = *(_OWORD *)(v1 + 168);
  v5 = *(_OWORD *)(v1 + 136);
  *(_OWORD *)(v0 + 90) = *(_OWORD *)(v1 + 178);
  *(_OWORD *)(v0 + 64) = v3;
  *(_OWORD *)(v0 + 80) = v4;
  *(_OWORD *)(v0 + 48) = v5;
  outlined init with take of BelowTargetZoneModel?(v0 + 56, v0 + 112, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  outlined init with take of BelowTargetZoneModel?(v0 + 112, v0 + 224, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  if (!*(_QWORD *)(v0 + 248))
  {
    v23 = *(_QWORD *)(v0 + 552);
    v24 = *(int **)(v0 + 544);
    v25 = *(uint64_t **)(v0 + 480);
    __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 472), *(_QWORD *)(*(_QWORD *)(v0 + 472) + 24));
    outlined retain of UpcomingIntervalModel(v25);
    v26 = v23 + v24[12];
    v27 = type metadata accessor for SpeakableString();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v26, 1, 1, v27);
    *(_BYTE *)v23 = 1;
    *(_QWORD *)(v23 + 8) = 0;
    *(_WORD *)(v23 + 16) = 1;
    *(_QWORD *)(v23 + 24) = 0;
    *(_BYTE *)(v23 + 32) = 1;
    *(_QWORD *)(v23 + 40) = 0;
    *(_BYTE *)(v23 + 48) = 1;
    *(_QWORD *)(v23 + 64) = 0;
    *(_QWORD *)(v23 + 72) = 0;
    *(_QWORD *)(v23 + 56) = 0;
    *(_BYTE *)(v23 + 80) = 1;
    *(_BYTE *)(v23 + v24[13]) = 0;
    *(_BYTE *)(v23 + v24[14]) = 1;
    *(_BYTE *)(v23 + v24[15]) = 0;
    *(_BYTE *)(v23 + v24[16]) = 1;
    *(_BYTE *)(v23 + v24[17]) = 0;
    *(_BYTE *)(v23 + v24[18]) = 0;
    *(_BYTE *)(v23 + v24[19]) = 0;
    v28 = v23 + v24[20];
    *(_QWORD *)v28 = 0;
    *(_BYTE *)(v28 + 8) = 1;
    v29 = v23 + v24[21];
    *(_QWORD *)v29 = 0;
    *(_BYTE *)(v29 + 8) = 1;
    *(_QWORD *)(v23 + v24[22]) = 0;
    *(_QWORD *)(v23 + v24[23]) = 0;
    v30 = v23 + v24[24];
    *(_QWORD *)v30 = 0;
    *(_BYTE *)(v30 + 8) = 1;
    v31 = v23 + v24[25];
    *(_QWORD *)v31 = 0;
    *(_BYTE *)(v31 + 8) = 1;
    UpcomingIntervalModel.buildNonPaceParameters(_:)(v23);
    v32 = WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters.asKeyValuePairs()();
    *(_QWORD *)(v0 + 680) = v32;
    v78 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                              + MEMORY[0x24BE92868]);
    v33 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 688) = v33;
    *v33 = v0;
    v33[1] = UpcomingIntervalModel.executePattern(wrapper:);
    v34 = 0x800000024A61EE00;
    v35 = 0xD00000000000002CLL;
    return v78(v35, v34, v32);
  }
  v6 = *(_OWORD *)(v0 + 240);
  *(_OWORD *)(v0 + 168) = *(_OWORD *)(v0 + 224);
  *(_OWORD *)(v0 + 184) = v6;
  *(_OWORD *)(v0 + 200) = *(_OWORD *)(v0 + 256);
  *(_WORD *)(v0 + 216) = *(_WORD *)(v0 + 272);
  outlined init with take of BelowTargetZoneModel?(v0 + 208, v0 + 424, &demangling cache variable for type metadata for Int?);
  outlined init with take of BelowTargetZoneModel?(v0 + 424, v0 + 440, &demangling cache variable for type metadata for Int?);
  if ((*(_BYTE *)(v0 + 448) & 1) == 0)
  {
    v36 = *(_QWORD *)(v0 + 576);
    v37 = *(int **)(v0 + 568);
    v38 = *(uint64_t **)(v0 + 480);
    __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 472), *(_QWORD *)(*(_QWORD *)(v0 + 472) + 24));
    outlined retain of UpcomingIntervalModel(v38);
    v39 = v36 + v37[12];
    v40 = type metadata accessor for SpeakableString();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v39, 1, 1, v40);
    *(_BYTE *)v36 = 1;
    *(_QWORD *)(v36 + 8) = 0;
    *(_WORD *)(v36 + 16) = 1;
    *(_QWORD *)(v36 + 24) = 0;
    *(_BYTE *)(v36 + 32) = 1;
    *(_QWORD *)(v36 + 40) = 0;
    *(_BYTE *)(v36 + 48) = 1;
    *(_QWORD *)(v36 + 64) = 0;
    *(_QWORD *)(v36 + 72) = 0;
    *(_QWORD *)(v36 + 56) = 0;
    *(_BYTE *)(v36 + 80) = 1;
    *(_BYTE *)(v36 + v37[13]) = 1;
    *(_BYTE *)(v36 + v37[14]) = 1;
    *(_BYTE *)(v36 + v37[15]) = 0;
    *(_QWORD *)(v36 + v37[16]) = 0;
    *(_QWORD *)(v36 + v37[17]) = 0;
    v41 = v36 + v37[18];
    *(_QWORD *)v41 = 0;
    *(_BYTE *)(v41 + 8) = 1;
    v42 = v36 + v37[19];
    *(_QWORD *)v42 = 0;
    *(_BYTE *)(v42 + 8) = 1;
    v43 = v36 + v37[20];
    *(_QWORD *)v43 = 0;
    *(_BYTE *)(v43 + 8) = 1;
    UpcomingIntervalModel.buildHeartRateZoneParameters(_:)(v36);
    v32 = WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters.asKeyValuePairs()();
    *(_QWORD *)(v0 + 584) = v32;
    v78 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                              + MEMORY[0x24BE92868]);
    v44 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 592) = v44;
    *v44 = v0;
    v44[1] = UpcomingIntervalModel.executePattern(wrapper:);
    v45 = 0xD000000000000032;
    v46 = "workoutVoiceFeedback#intervalUpcomingHeartRateZone";
LABEL_9:
    v34 = (unint64_t)(v46 - 32) | 0x8000000000000000;
    v35 = v45;
    return v78(v35, v34, v32);
  }
  v7 = *(unsigned __int8 *)(v0 + 200);
  if (one-time initialization token for noPaceFormatMetrics != -1)
    swift_once();
  if (specialized Sequence<>.contains(_:)(v7, (uint64_t)noPaceFormatMetrics._rawValue))
  {
    v8 = *(_QWORD *)(v0 + 560);
    v9 = *(int **)(v0 + 544);
    v10 = *(uint64_t **)(v0 + 480);
    __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 472), *(_QWORD *)(*(_QWORD *)(v0 + 472) + 24));
    v11 = specialized Sequence<>.contains(_:)(v7, (uint64_t)&outlined read-only object #0 of UpcomingIntervalModel.executePattern(wrapper:));
    v12 = specialized Sequence<>.contains(_:)(v7, (uint64_t)&outlined read-only object #1 of UpcomingIntervalModel.executePattern(wrapper:));
    v13 = *(_BYTE *)(v0 + 217);
    outlined retain of UpcomingIntervalModel(v10);
    v14 = v8 + v9[12];
    v15 = type metadata accessor for SpeakableString();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
    *(_BYTE *)v8 = 1;
    *(_QWORD *)(v8 + 8) = 0;
    *(_WORD *)(v8 + 16) = 1;
    *(_QWORD *)(v8 + 24) = 0;
    *(_BYTE *)(v8 + 32) = 1;
    *(_QWORD *)(v8 + 40) = 0;
    *(_BYTE *)(v8 + 48) = 1;
    *(_QWORD *)(v8 + 64) = 0;
    *(_QWORD *)(v8 + 72) = 0;
    *(_QWORD *)(v8 + 56) = 0;
    *(_BYTE *)(v8 + 80) = 1;
    *(_BYTE *)(v8 + v9[13]) = v11;
    *(_BYTE *)(v8 + v9[14]) = 1;
    *(_BYTE *)(v8 + v9[15]) = (_DWORD)v7 == 1;
    *(_BYTE *)(v8 + v9[16]) = 1;
    *(_BYTE *)(v8 + v9[17]) = 0;
    *(_BYTE *)(v8 + v9[18]) = v12;
    *(_BYTE *)(v8 + v9[19]) = v13;
    v16 = v8 + v9[20];
    *(_QWORD *)v16 = 0;
    *(_BYTE *)(v16 + 8) = 1;
    v17 = v8 + v9[21];
    *(_QWORD *)v17 = 0;
    *(_BYTE *)(v17 + 8) = 1;
    *(_QWORD *)(v8 + v9[22]) = 0;
    *(_QWORD *)(v8 + v9[23]) = 0;
    v18 = v8 + v9[24];
    *(_QWORD *)v18 = 0;
    *(_BYTE *)(v18 + 8) = 1;
    v19 = v8 + v9[25];
    *(_QWORD *)v19 = 0;
    *(_BYTE *)(v19 + 8) = 1;
    UpcomingIntervalModel.buildNonPaceParameters(_:)(v8);
    v20 = WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters.asKeyValuePairs()();
    *(_QWORD *)(v0 + 608) = v20;
    v77 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                              + MEMORY[0x24BE92868]);
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 616) = v21;
    *v21 = v0;
    v21[1] = UpcomingIntervalModel.executePattern(wrapper:);
    return v77(0xD00000000000002CLL, 0x800000024A61EE00, v20);
  }
  outlined init with take of BelowTargetZoneModel?(v0 + 201, v0 + 106, &demangling cache variable for type metadata for VoiceFeedbackPaceFormat?);
  outlined init with take of BelowTargetZoneModel?(v0 + 106, v0 + 108, &demangling cache variable for type metadata for VoiceFeedbackPaceFormat?);
  v47 = *(unsigned __int8 *)(v0 + 108);
  if (v47 != 2)
  {
    v62 = *(uint64_t **)(v0 + 480);
    __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 472), *(_QWORD *)(*(_QWORD *)(v0 + 472) + 24));
    v63 = *(_BYTE *)(v0 + 217);
    outlined retain of UpcomingIntervalModel(v62);
    v64 = type metadata accessor for SpeakableString();
    v65 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 56);
    if ((v47 & 1) != 0)
    {
      v72 = *(_QWORD *)(v0 + 520);
      v73 = *(int **)(v0 + 512);
      v65(v72 + v73[12], 1, 1, v64);
      *(_BYTE *)v72 = 1;
      *(_QWORD *)(v72 + 8) = 0;
      *(_WORD *)(v72 + 16) = 1;
      *(_QWORD *)(v72 + 24) = 0;
      *(_BYTE *)(v72 + 32) = 1;
      *(_QWORD *)(v72 + 40) = 0;
      *(_BYTE *)(v72 + 48) = 1;
      *(_QWORD *)(v72 + 64) = 0;
      *(_QWORD *)(v72 + 72) = 0;
      *(_QWORD *)(v72 + 56) = 0;
      *(_BYTE *)(v72 + 80) = 1;
      *(_BYTE *)(v72 + v73[13]) = 1;
      *(_BYTE *)(v72 + v73[14]) = 1;
      *(_BYTE *)(v72 + v73[15]) = 0;
      *(_BYTE *)(v72 + v73[16]) = v63;
      *(_QWORD *)(v72 + v73[17]) = 0;
      *(_QWORD *)(v72 + v73[18]) = 0;
      *(_QWORD *)(v72 + v73[19]) = 0;
      *(_QWORD *)(v72 + v73[20]) = 0;
      v74 = v72 + v73[21];
      *(_QWORD *)v74 = 0;
      *(_BYTE *)(v74 + 8) = 1;
      v75 = v72 + v73[22];
      *(_QWORD *)v75 = 0;
      *(_BYTE *)(v75 + 8) = 1;
      UpcomingIntervalModel.buildPaceParameters(_:)(v72);
      v32 = WorkoutVoiceFeedbackIntervalUpcomingPaceParameters.asKeyValuePairs()();
      *(_QWORD *)(v0 + 656) = v32;
      v78 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                                + MEMORY[0x24BE92868]);
      v76 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 664) = v76;
      *v76 = v0;
      v76[1] = UpcomingIntervalModel.executePattern(wrapper:);
      v45 = 0xD000000000000029;
      v46 = "workoutVoiceFeedback#intervalUpcomingPace";
    }
    else
    {
      v66 = *(_QWORD *)(v0 + 536);
      v67 = *(int **)(v0 + 528);
      v65(v66 + v67[12], 1, 1, v64);
      *(_BYTE *)v66 = 1;
      *(_QWORD *)(v66 + 8) = 0;
      *(_WORD *)(v66 + 16) = 1;
      *(_QWORD *)(v66 + 24) = 0;
      *(_BYTE *)(v66 + 32) = 1;
      *(_QWORD *)(v66 + 40) = 0;
      *(_BYTE *)(v66 + 48) = 1;
      *(_QWORD *)(v66 + 64) = 0;
      *(_QWORD *)(v66 + 72) = 0;
      *(_QWORD *)(v66 + 56) = 0;
      *(_BYTE *)(v66 + 80) = 1;
      *(_BYTE *)(v66 + v67[13]) = 1;
      *(_BYTE *)(v66 + v67[14]) = 1;
      *(_BYTE *)(v66 + v67[15]) = 0;
      *(_BYTE *)(v66 + v67[16]) = v63;
      *(_QWORD *)(v66 + v67[17]) = 0;
      *(_QWORD *)(v66 + v67[18]) = 0;
      *(_QWORD *)(v66 + v67[19]) = 0;
      *(_QWORD *)(v66 + v67[20]) = 0;
      v68 = v66 + v67[21];
      *(_QWORD *)v68 = 0;
      *(_BYTE *)(v68 + 8) = 1;
      v69 = v66 + v67[22];
      *(_QWORD *)v69 = 0;
      *(_BYTE *)(v69 + 8) = 1;
      UpcomingIntervalModel.buildSpeedParameters(_:)(v66);
      v32 = WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters.asKeyValuePairs()();
      *(_QWORD *)(v0 + 632) = v32;
      v78 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92868]
                                                                                + MEMORY[0x24BE92868]);
      v70 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 640) = v70;
      *v70 = v0;
      v70[1] = UpcomingIntervalModel.executePattern(wrapper:);
      v45 = 0xD00000000000002ALL;
      v46 = "workoutVoiceFeedback#intervalUpcomingSpeed";
    }
    goto LABEL_9;
  }
  v49 = *(_QWORD *)(v0 + 496);
  v48 = *(_QWORD *)(v0 + 504);
  v50 = *(_QWORD *)(v0 + 488);
  v51 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16))(v48, v51, v50);
  v52 = Logger.logObject.getter();
  v53 = static os_log_type_t.error.getter();
  v54 = os_log_type_enabled(v52, v53);
  v56 = *(_QWORD *)(v0 + 496);
  v55 = *(_QWORD *)(v0 + 504);
  v57 = *(_QWORD *)(v0 + 488);
  if (v54)
  {
    v58 = swift_slowAlloc();
    v59 = swift_slowAlloc();
    *(_DWORD *)v58 = 136315394;
    v79[0] = v59;
    *(_QWORD *)(v0 + 464) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000015, 0x800000024A61D8A0, v79);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v58 + 12) = 2080;
    *(_BYTE *)(v0 + 107) = v7;
    v60 = String.init<A>(describing:)();
    *(_QWORD *)(v0 + 456) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v60, v61, v79);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A5E6000, v52, v53, "%s needs a pace format for: %s", (uint8_t *)v58, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v59, -1, -1);
    MEMORY[0x24BD15374](v58, -1, -1);

  }
  else
  {

  }
  (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v57);
  lazy protocol witness table accessor for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors();
  swift_allocError();
  *v71 = 1;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 576), type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters);
  v1 = *(_QWORD *)(v0 + 312);
  outlined release of UpcomingIntervalModel(*(uint64_t **)(v0 + 480));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

{
  uint64_t v0;
  uint64_t *v1;

  v1 = *(uint64_t **)(v0 + 480);
  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 576), type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters);
  outlined release of UpcomingIntervalModel(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 560), type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters);
  v1 = *(_QWORD *)(v0 + 336);
  outlined release of UpcomingIntervalModel(*(uint64_t **)(v0 + 480));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

{
  uint64_t v0;
  uint64_t *v1;

  v1 = *(uint64_t **)(v0 + 480);
  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 560), type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters);
  outlined release of UpcomingIntervalModel(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 536), type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters);
  v1 = *(_QWORD *)(v0 + 360);
  outlined release of UpcomingIntervalModel(*(uint64_t **)(v0 + 480));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

{
  uint64_t v0;
  uint64_t *v1;

  v1 = *(uint64_t **)(v0 + 480);
  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 536), type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters);
  outlined release of UpcomingIntervalModel(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 520), type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters);
  v1 = *(_QWORD *)(v0 + 384);
  outlined release of UpcomingIntervalModel(*(uint64_t **)(v0 + 480));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

{
  uint64_t v0;
  uint64_t *v1;

  v1 = *(uint64_t **)(v0 + 480);
  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 520), type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters);
  outlined release of UpcomingIntervalModel(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 552), type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters);
  v1 = *(_QWORD *)(v0 + 408);
  outlined release of UpcomingIntervalModel(*(uint64_t **)(v0 + 480));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

{
  uint64_t v0;
  uint64_t *v1;

  v1 = *(uint64_t **)(v0 + 480);
  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(_QWORD *)(v0 + 552), type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters);
  outlined release of UpcomingIntervalModel(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t UpcomingIntervalModel.buildNonPaceParameters(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t inited;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t result;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _OWORD v58[2];
  _BYTE v59[16];
  _BYTE v60[96];
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  char v65;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v53 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v50 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v50 - v10;
  outlined init with take of BelowTargetZoneModel?(v1 + 8, (uint64_t)v60, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v60, (uint64_t)&v61, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
  v13 = v64;
  if (v64 != 1)
  {
    v52 = v9;
    v14 = v62;
    v15 = v63;
    LOBYTE(v12) = v65;
    v16 = (double)v12;
    v51 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(0);
    v17 = a1 + *(int *)(v51 + 96);
    *(double *)v17 = v16;
    *(_BYTE *)(v17 + 8) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String?>);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24A61C650;
    *(_OWORD *)(inited + 32) = xmmword_24A61D7C0;
    *(_OWORD *)(inited + 48) = xmmword_24A61D7D0;
    v19 = v14 & 1;
    if (v13
      && (v15 == 115 && v13 == 0xE100000000000000
       || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
       || (v20 = *(_QWORD *)(inited + 56)) != 0
       && (*(_QWORD *)(inited + 48) == v15 && v20 == v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)))
    {
      swift_bridgeObjectRelease();
      type metadata accessor for DialogDuration.Builder();
      swift_allocObject();
      DialogDuration.Builder.init()();
      if (!v19 && (v15 != 7235949 || v13 != 0xE300000000000000))
        _stringCompareWithSmolCheck(_:_:expecting:)();
      dispatch thunk of DialogDuration.Builder.withSecs(_:)();
      swift_release();
      v21 = dispatch thunk of DialogDuration.Builder.build()();
      swift_release();
      v22 = *(int *)(v51 + 92);
      swift_release();
      *(_QWORD *)(a1 + v22) = v21;
      v9 = v52;
    }
    else
    {
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
      swift_arrayDestroy();
      type metadata accessor for DialogLength.Builder();
      swift_allocObject();
      MEMORY[0x24BD14B88]();
      dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
      swift_release();
      if (v13)
      {
        String.toDialogUnit.getter(v15, v13);
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        v23 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v11, 0, 1, v23);
      }
      else
      {
        v24 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v11, 1, 1, v24);
      }
      v25 = v51;
      v9 = v52;
      dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
      swift_release();
      outlined destroy of SpeakableString?((uint64_t)v11);
      v26 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
      swift_release();
      v27 = *(int *)(v25 + 88);
      swift_release();
      *(_QWORD *)(a1 + v27) = v26;
    }
  }
  v28 = *(_OWORD *)(v2 + 120);
  v29 = *(_OWORD *)(v2 + 152);
  v56 = *(_OWORD *)(v2 + 136);
  v57 = v29;
  v58[0] = *(_OWORD *)(v2 + 168);
  *(_OWORD *)((char *)v58 + 10) = *(_OWORD *)(v2 + 178);
  v54 = *(_OWORD *)(v2 + 104);
  v55 = v28;
  v30 = v28;
  if (*((_QWORD *)&v28 + 1))
  {
    v31 = String.toDialogUnit.getter(v55, *((uint64_t *)&v55 + 1));
    v33 = String.isDialogDistanceUnit.getter(v31, v32);
    swift_bridgeObjectRelease();
  }
  else
  {
    v33 = 0;
  }
  LOBYTE(v28) = v56;
  *(double *)(a1 + 8) = (double)(unint64_t)v28;
  *(_BYTE *)(a1 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String?>);
  v34 = swift_initStackObject();
  *(_OWORD *)(v34 + 16) = xmmword_24A61C650;
  *(_OWORD *)(v34 + 32) = xmmword_24A61D7C0;
  *(_OWORD *)(v34 + 48) = xmmword_24A61D7D0;
  if (*((_QWORD *)&v30 + 1)
    && (v30 == __PAIR128__(0xE100000000000000, 115)
     || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
     || *(_QWORD *)(v34 + 56)
     && (*(_OWORD *)(v34 + 48) == v30 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)))
  {
    swift_bridgeObjectRelease();
    type metadata accessor for DialogDuration.Builder();
    swift_allocObject();
    DialogDuration.Builder.init()();
    if ((BYTE8(v54) & 1) == 0 && v30 != __PAIR128__(0xE300000000000000, 7235949))
      _stringCompareWithSmolCheck(_:_:expecting:)();
    dispatch thunk of DialogDuration.Builder.withSecs(_:)();
    swift_release();
    v35 = dispatch thunk of DialogDuration.Builder.build()();
    swift_release();
    swift_release();
    *(_QWORD *)(a1 + 64) = v35;
  }
  else
  {
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    swift_arrayDestroy();
    if ((v33 & 1) != 0)
    {
      type metadata accessor for DialogLength.Builder();
      swift_allocObject();
      MEMORY[0x24BD14B88]();
      dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
      swift_release();
      if (*((_QWORD *)&v30 + 1))
      {
        String.toDialogUnit.getter(v30, *((uint64_t *)&v30 + 1));
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        v36 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v9, 0, 1, v36);
      }
      else
      {
        v39 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v9, 1, 1, v39);
      }
      dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
      swift_release();
      outlined destroy of SpeakableString?((uint64_t)v9);
      v40 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
      swift_release();
      swift_release();
      *(_QWORD *)(a1 + 56) = v40;
    }
    else
    {
      outlined init with take of BelowTargetZoneModel?((uint64_t)&v54, (uint64_t)v59, &demangling cache variable for type metadata for Double?);
      outlined init with take of BelowTargetZoneModel?((uint64_t)v59, a1 + 72, &demangling cache variable for type metadata for Double?);
      if (*((_QWORD *)&v30 + 1))
      {
        String.toDialogUnit.getter(v30, *((uint64_t *)&v30 + 1));
        v37 = (uint64_t)v53;
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        v38 = type metadata accessor for SpeakableString();
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v37, 0, 1, v38);
      }
      else
      {
        v41 = type metadata accessor for SpeakableString();
        v37 = (uint64_t)v53;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v53, 1, 1, v41);
      }
      v42 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(0);
      outlined assign with take of SpeakableString?(v37, a1 + *(int *)(v42 + 48));
    }
  }
  v43 = *(_QWORD *)&v58[0] == 0;
  if (*(_QWORD *)&v58[0])
    v44 = *((_QWORD *)&v56 + 1);
  else
    v44 = 0;
  if (*(_QWORD *)&v58[0])
    v45 = v57;
  else
    v45 = 0;
  v46 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(0);
  v47 = a1 + *(int *)(v46 + 84);
  *(_QWORD *)v47 = v44;
  *(_BYTE *)(v47 + 8) = v43;
  result = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(0);
  v49 = a1 + *(int *)(v46 + 80);
  *(_QWORD *)v49 = v45;
  *(_BYTE *)(v49 + 8) = v43;
  return result;
}

uint64_t UpcomingIntervalModel.buildHeartRateZoneParameters(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t inited;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t result;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  __int128 v50;
  __int128 v51;
  _OWORD v52[2];
  _OWORD v53[2];
  _BYTE v54[16];
  _BYTE v55[56];
  _BYTE v56[96];
  _BYTE v57[16];
  uint64_t v58;
  uint64_t v59;
  char v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int16 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int16 v68;
  _BYTE v69[16];
  uint64_t v70;
  char v71;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v49 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v46 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v46 - v10;
  outlined init with take of BelowTargetZoneModel?(v1 + 8, (uint64_t)v56, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v56, (uint64_t)v57, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
  v13 = v59;
  if (v59 != 1)
  {
    v48 = v9;
    v14 = v57[8];
    v15 = v58;
    LOBYTE(v12) = v60;
    v16 = (double)v12;
    v47 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(0);
    v17 = a1 + *(int *)(v47 + 72);
    *(double *)v17 = v16;
    *(_BYTE *)(v17 + 8) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String?>);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24A61C650;
    *(_OWORD *)(inited + 32) = xmmword_24A61D7C0;
    *(_OWORD *)(inited + 48) = xmmword_24A61D7D0;
    v19 = v14 & 1;
    if (v13
      && (v15 == 115 && v13 == 0xE100000000000000
       || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
       || (v20 = *(_QWORD *)(inited + 56)) != 0
       && (*(_QWORD *)(inited + 48) == v15 && v20 == v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)))
    {
      swift_bridgeObjectRelease();
      type metadata accessor for DialogDuration.Builder();
      swift_allocObject();
      DialogDuration.Builder.init()();
      if (!v19 && (v15 != 7235949 || v13 != 0xE300000000000000))
        _stringCompareWithSmolCheck(_:_:expecting:)();
      dispatch thunk of DialogDuration.Builder.withSecs(_:)();
      swift_release();
      v21 = dispatch thunk of DialogDuration.Builder.build()();
      swift_release();
      v22 = *(int *)(v47 + 68);
      swift_release();
      *(_QWORD *)(a1 + v22) = v21;
      v9 = v48;
    }
    else
    {
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
      swift_arrayDestroy();
      type metadata accessor for DialogLength.Builder();
      swift_allocObject();
      MEMORY[0x24BD14B88]();
      dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
      swift_release();
      if (v13)
      {
        String.toDialogUnit.getter(v15, v13);
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        v23 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v11, 0, 1, v23);
      }
      else
      {
        v24 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v11, 1, 1, v24);
      }
      v25 = v47;
      v9 = v48;
      dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
      swift_release();
      outlined destroy of SpeakableString?((uint64_t)v11);
      v26 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
      swift_release();
      v27 = *(int *)(v25 + 64);
      swift_release();
      *(_QWORD *)(a1 + v27) = v26;
    }
  }
  v28 = *(_OWORD *)(v2 + 120);
  v29 = *(_OWORD *)(v2 + 152);
  v52[0] = *(_OWORD *)(v2 + 136);
  v52[1] = v29;
  v53[0] = *(_OWORD *)(v2 + 168);
  *(_OWORD *)((char *)v53 + 10) = *(_OWORD *)(v2 + 178);
  v50 = *(_OWORD *)(v2 + 104);
  v51 = v28;
  v30 = v28;
  if (*((_QWORD *)&v28 + 1))
  {
    v31 = String.toDialogUnit.getter(v51, *((uint64_t *)&v51 + 1));
    v33 = String.isDialogDistanceUnit.getter(v31, v32);
    swift_bridgeObjectRelease();
  }
  else
  {
    v33 = 0;
  }
  LOBYTE(v28) = v52[0];
  *(double *)(a1 + 8) = (double)(unint64_t)v28;
  *(_BYTE *)(a1 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String?>);
  v34 = swift_initStackObject();
  *(_OWORD *)(v34 + 16) = xmmword_24A61C650;
  *(_OWORD *)(v34 + 32) = xmmword_24A61D7C0;
  *(_OWORD *)(v34 + 48) = xmmword_24A61D7D0;
  if (*((_QWORD *)&v30 + 1)
    && (v30 == __PAIR128__(0xE100000000000000, 115)
     || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
     || *(_QWORD *)(v34 + 56)
     && (*(_OWORD *)(v34 + 48) == v30 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)))
  {
    swift_bridgeObjectRelease();
    type metadata accessor for DialogDuration.Builder();
    swift_allocObject();
    DialogDuration.Builder.init()();
    if ((BYTE8(v50) & 1) == 0 && v30 != __PAIR128__(0xE300000000000000, 7235949))
      _stringCompareWithSmolCheck(_:_:expecting:)();
    dispatch thunk of DialogDuration.Builder.withSecs(_:)();
    swift_release();
    v35 = dispatch thunk of DialogDuration.Builder.build()();
    swift_release();
    swift_release();
    *(_QWORD *)(a1 + 64) = v35;
  }
  else
  {
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    swift_arrayDestroy();
    if ((v33 & 1) != 0)
    {
      type metadata accessor for DialogLength.Builder();
      swift_allocObject();
      MEMORY[0x24BD14B88]();
      dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
      swift_release();
      if (*((_QWORD *)&v30 + 1))
      {
        String.toDialogUnit.getter(v30, *((uint64_t *)&v30 + 1));
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        v36 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v9, 0, 1, v36);
      }
      else
      {
        v39 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v9, 1, 1, v39);
      }
      dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
      swift_release();
      outlined destroy of SpeakableString?((uint64_t)v9);
      v40 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
      swift_release();
      swift_release();
      *(_QWORD *)(a1 + 56) = v40;
    }
    else
    {
      outlined init with take of BelowTargetZoneModel?((uint64_t)&v50, (uint64_t)v54, &demangling cache variable for type metadata for Double?);
      outlined init with take of BelowTargetZoneModel?((uint64_t)v54, a1 + 72, &demangling cache variable for type metadata for Double?);
      if (*((_QWORD *)&v30 + 1))
      {
        String.toDialogUnit.getter(v30, *((uint64_t *)&v30 + 1));
        v37 = (uint64_t)v49;
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        v38 = type metadata accessor for SpeakableString();
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v37, 0, 1, v38);
      }
      else
      {
        v41 = type metadata accessor for SpeakableString();
        v37 = (uint64_t)v49;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v49, 1, 1, v41);
      }
      v42 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(0);
      outlined assign with take of SpeakableString?(v37, a1 + *(int *)(v42 + 48));
    }
  }
  outlined init with take of BelowTargetZoneModel?((uint64_t)v52 + 8, (uint64_t)v55, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  result = outlined init with take of BelowTargetZoneModel?((uint64_t)v55, (uint64_t)&v61, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  if (*((_QWORD *)&v62 + 1))
  {
    v65 = v61;
    v66 = v62;
    v67 = v63;
    v68 = v64;
    outlined init with take of BelowTargetZoneModel?((uint64_t)&v67 + 8, (uint64_t)v69, &demangling cache variable for type metadata for Int?);
    result = outlined init with take of BelowTargetZoneModel?((uint64_t)v69, (uint64_t)&v70, &demangling cache variable for type metadata for Int?);
    if ((v71 & 1) == 0)
    {
      v44 = (double)v70;
      result = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(0);
      v45 = a1 + *(int *)(result + 80);
      *(double *)v45 = v44;
      *(_BYTE *)(v45 + 8) = 0;
    }
  }
  return result;
}

uint64_t UpcomingIntervalModel.buildSpeedParameters(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t inited;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
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
  uint64_t result;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  __int128 v64;
  __int128 v65;
  _OWORD v66[2];
  _OWORD v67[2];
  _BYTE v68[16];
  _BYTE v69[56];
  _BYTE v70[96];
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76[3];
  uint64_t v77;
  uint64_t v78;
  _BYTE v79[16];
  uint64_t v80;
  uint64_t v81;
  _QWORD v82[3];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v63 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v58 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v61 = (char *)&v58 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v62 = (char *)&v58 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v58 - v14;
  outlined init with take of BelowTargetZoneModel?(v1 + 8, (uint64_t)v70, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v70, (uint64_t)&v71, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
  v17 = v74;
  if (v74 != 1)
  {
    v60 = v71;
    v18 = v72;
    v19 = v73;
    LOBYTE(v16) = v75;
    v20 = (double)v16;
    v59 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(0);
    v21 = a1 + *(int *)(v59 + 84);
    *(double *)v21 = v20;
    *(_BYTE *)(v21 + 8) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String?>);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24A61C650;
    *(_OWORD *)(inited + 32) = xmmword_24A61D7C0;
    *(_OWORD *)(inited + 48) = xmmword_24A61D7D0;
    v23 = v18 & 1;
    if (v17
      && (v19 == 115 && v17 == 0xE100000000000000
       || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
       || (v24 = *(_QWORD *)(inited + 56)) != 0
       && (*(_QWORD *)(inited + 48) == v19 && v24 == v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)))
    {
      swift_bridgeObjectRelease();
      type metadata accessor for DialogDuration.Builder();
      swift_allocObject();
      DialogDuration.Builder.init()();
      if (v23)
      {
        v25 = v59;
      }
      else
      {
        v25 = v59;
        if (v19 != 7235949 || v17 != 0xE300000000000000)
          _stringCompareWithSmolCheck(_:_:expecting:)();
      }
      dispatch thunk of DialogDuration.Builder.withSecs(_:)();
      swift_release();
      v29 = dispatch thunk of DialogDuration.Builder.build()();
      swift_release();
      v30 = *(int *)(v25 + 80);
    }
    else
    {
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
      swift_arrayDestroy();
      type metadata accessor for DialogLength.Builder();
      swift_allocObject();
      MEMORY[0x24BD14B88]();
      dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
      swift_release();
      if (v17)
      {
        String.toDialogUnit.getter(v19, v17);
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        v26 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v15, 0, 1, v26);
      }
      else
      {
        v27 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v15, 1, 1, v27);
      }
      v28 = v59;
      dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
      swift_release();
      outlined destroy of SpeakableString?((uint64_t)v15);
      v29 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
      swift_release();
      v30 = *(int *)(v28 + 76);
    }
    swift_release();
    *(_QWORD *)(a1 + v30) = v29;
  }
  v31 = *(_OWORD *)(v2 + 120);
  v32 = *(_OWORD *)(v2 + 152);
  v66[0] = *(_OWORD *)(v2 + 136);
  v66[1] = v32;
  v67[0] = *(_OWORD *)(v2 + 168);
  *(_OWORD *)((char *)v67 + 10) = *(_OWORD *)(v2 + 178);
  v64 = *(_OWORD *)(v2 + 104);
  v65 = v31;
  v33 = v31;
  if (*((_QWORD *)&v31 + 1))
  {
    v34 = String.toDialogUnit.getter(v65, *((uint64_t *)&v65 + 1));
    v36 = String.isDialogDistanceUnit.getter(v34, v35);
    swift_bridgeObjectRelease();
  }
  else
  {
    v36 = 0;
  }
  LOBYTE(v31) = v66[0];
  *(double *)(a1 + 8) = (double)(unint64_t)v31;
  *(_BYTE *)(a1 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String?>);
  v37 = swift_initStackObject();
  *(_OWORD *)(v37 + 16) = xmmword_24A61C650;
  *(_OWORD *)(v37 + 32) = xmmword_24A61D7C0;
  *(_OWORD *)(v37 + 48) = xmmword_24A61D7D0;
  if (*((_QWORD *)&v33 + 1)
    && (v33 == __PAIR128__(0xE100000000000000, 115)
     || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
     || *(_QWORD *)(v37 + 56)
     && (*(_OWORD *)(v37 + 48) == v33 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)))
  {
    swift_bridgeObjectRelease();
    type metadata accessor for DialogDuration.Builder();
    swift_allocObject();
    DialogDuration.Builder.init()();
    if ((BYTE8(v64) & 1) == 0 && v33 != __PAIR128__(0xE300000000000000, 7235949))
      _stringCompareWithSmolCheck(_:_:expecting:)();
    v38 = (uint64_t)v63;
    dispatch thunk of DialogDuration.Builder.withSecs(_:)();
    swift_release();
    v39 = dispatch thunk of DialogDuration.Builder.build()();
    swift_release();
    swift_release();
    *(_QWORD *)(a1 + 64) = v39;
  }
  else
  {
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    swift_arrayDestroy();
    if ((v36 & 1) != 0)
    {
      type metadata accessor for DialogLength.Builder();
      swift_allocObject();
      MEMORY[0x24BD14B88]();
      dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
      swift_release();
      if (*((_QWORD *)&v33 + 1))
      {
        String.toDialogUnit.getter(v33, *((uint64_t *)&v33 + 1));
        v40 = (uint64_t)v62;
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        v41 = type metadata accessor for SpeakableString();
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v40, 0, 1, v41);
      }
      else
      {
        v44 = type metadata accessor for SpeakableString();
        v40 = (uint64_t)v62;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v62, 1, 1, v44);
      }
      v38 = (uint64_t)v63;
      dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
      swift_release();
      outlined destroy of SpeakableString?(v40);
      v45 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
      swift_release();
      swift_release();
      *(_QWORD *)(a1 + 56) = v45;
    }
    else
    {
      outlined init with take of BelowTargetZoneModel?((uint64_t)&v64, (uint64_t)v68, &demangling cache variable for type metadata for Double?);
      outlined init with take of BelowTargetZoneModel?((uint64_t)v68, a1 + 72, &demangling cache variable for type metadata for Double?);
      if (*((_QWORD *)&v33 + 1))
      {
        String.toDialogUnit.getter(v33, *((uint64_t *)&v33 + 1));
        v42 = (uint64_t)v61;
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        v43 = type metadata accessor for SpeakableString();
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v42, 0, 1, v43);
      }
      else
      {
        v46 = type metadata accessor for SpeakableString();
        v42 = (uint64_t)v61;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v61, 1, 1, v46);
      }
      v38 = (uint64_t)v63;
      v47 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(0);
      outlined assign with take of SpeakableString?(v42, a1 + *(int *)(v47 + 48));
    }
  }
  type metadata accessor for DialogLength.Builder();
  swift_allocObject();
  MEMORY[0x24BD14B88]();
  outlined init with take of BelowTargetZoneModel?((uint64_t)v66 + 8, (uint64_t)v69, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v69, (uint64_t)v82, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
  swift_release();
  outlined init with take of BelowTargetZoneModel?((uint64_t)v69, (uint64_t)v79, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  if (v81)
  {
    String.toDialogUnit.getter(v80, v81);
    String.toSpeakableString.getter();
    swift_bridgeObjectRelease();
    v48 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v9, 0, 1, v48);
  }
  else
  {
    v49 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v9, 1, 1, v49);
  }
  dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
  swift_release();
  outlined destroy of SpeakableString?((uint64_t)v9);
  v50 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
  swift_release();
  v51 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(0);
  v52 = *(int *)(v51 + 72);
  swift_release();
  *(_QWORD *)(a1 + v52) = v50;
  swift_allocObject();
  MEMORY[0x24BD14B88]();
  outlined init with take of BelowTargetZoneModel?((uint64_t)v69, (uint64_t)&v78, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
  swift_release();
  outlined init with take of BelowTargetZoneModel?((uint64_t)v69, (uint64_t)v76, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  if (v77)
  {
    String.toDialogUnit.getter(v76[2], v77);
    String.toSpeakableString.getter();
    swift_bridgeObjectRelease();
    v53 = type metadata accessor for SpeakableString();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56))(v38, 0, 1, v53);
  }
  else
  {
    v54 = type metadata accessor for SpeakableString();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 56))(v38, 1, 1, v54);
  }
  dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
  swift_release();
  outlined destroy of SpeakableString?(v38);
  v55 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
  swift_release();
  v56 = *(int *)(v51 + 68);
  result = swift_release();
  *(_QWORD *)(a1 + v56) = v55;
  return result;
}

uint64_t UpcomingIntervalModel.buildPaceParameters(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t inited;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
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
  uint64_t result;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  __int128 v53;
  __int128 v54;
  _OWORD v55[2];
  _OWORD v56[2];
  _BYTE v57[16];
  _BYTE v58[56];
  _BYTE v59[96];
  _BYTE v60[16];
  uint64_t v61;
  uint64_t v62;
  char v63;
  char v64[8];
  uint64_t v65[3];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v52 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v49 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v49 - v10;
  outlined init with take of BelowTargetZoneModel?(v1 + 8, (uint64_t)v59, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v59, (uint64_t)v60, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
  v13 = v62;
  if (v62 != 1)
  {
    v51 = v9;
    v14 = v60[8];
    v15 = v61;
    LOBYTE(v12) = v63;
    v16 = (double)v12;
    v50 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters(0);
    v17 = a1 + *(int *)(v50 + 84);
    *(double *)v17 = v16;
    *(_BYTE *)(v17 + 8) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String?>);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24A61C650;
    *(_OWORD *)(inited + 32) = xmmword_24A61D7C0;
    *(_OWORD *)(inited + 48) = xmmword_24A61D7D0;
    v19 = v14 & 1;
    if (v13
      && (v15 == 115 && v13 == 0xE100000000000000
       || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
       || (v20 = *(_QWORD *)(inited + 56)) != 0
       && (*(_QWORD *)(inited + 48) == v15 && v20 == v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)))
    {
      swift_bridgeObjectRelease();
      type metadata accessor for DialogDuration.Builder();
      swift_allocObject();
      DialogDuration.Builder.init()();
      if (!v19 && (v15 != 7235949 || v13 != 0xE300000000000000))
        _stringCompareWithSmolCheck(_:_:expecting:)();
      dispatch thunk of DialogDuration.Builder.withSecs(_:)();
      swift_release();
      v21 = dispatch thunk of DialogDuration.Builder.build()();
      swift_release();
      v22 = *(int *)(v50 + 80);
      swift_release();
      *(_QWORD *)(a1 + v22) = v21;
      v9 = v51;
    }
    else
    {
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
      swift_arrayDestroy();
      type metadata accessor for DialogLength.Builder();
      swift_allocObject();
      MEMORY[0x24BD14B88]();
      dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
      swift_release();
      if (v13)
      {
        String.toDialogUnit.getter(v15, v13);
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        v23 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v11, 0, 1, v23);
      }
      else
      {
        v24 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v11, 1, 1, v24);
      }
      v25 = v50;
      v9 = v51;
      dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
      swift_release();
      outlined destroy of SpeakableString?((uint64_t)v11);
      v26 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
      swift_release();
      v27 = *(int *)(v25 + 76);
      swift_release();
      *(_QWORD *)(a1 + v27) = v26;
    }
  }
  v28 = *(_OWORD *)(v2 + 120);
  v29 = *(_OWORD *)(v2 + 152);
  v55[0] = *(_OWORD *)(v2 + 136);
  v55[1] = v29;
  v56[0] = *(_OWORD *)(v2 + 168);
  *(_OWORD *)((char *)v56 + 10) = *(_OWORD *)(v2 + 178);
  v53 = *(_OWORD *)(v2 + 104);
  v54 = v28;
  v30 = v28;
  if (*((_QWORD *)&v28 + 1))
  {
    v31 = String.toDialogUnit.getter(v54, *((uint64_t *)&v54 + 1));
    v33 = String.isDialogDistanceUnit.getter(v31, v32);
    swift_bridgeObjectRelease();
  }
  else
  {
    v33 = 0;
  }
  LOBYTE(v28) = v55[0];
  *(double *)(a1 + 8) = (double)(unint64_t)v28;
  *(_BYTE *)(a1 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String?>);
  v34 = swift_initStackObject();
  *(_OWORD *)(v34 + 16) = xmmword_24A61C650;
  *(_OWORD *)(v34 + 32) = xmmword_24A61D7C0;
  *(_OWORD *)(v34 + 48) = xmmword_24A61D7D0;
  if (*((_QWORD *)&v30 + 1)
    && (v30 == __PAIR128__(0xE100000000000000, 115)
     || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
     || *(_QWORD *)(v34 + 56)
     && (*(_OWORD *)(v34 + 48) == v30 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)))
  {
    swift_bridgeObjectRelease();
    type metadata accessor for DialogDuration.Builder();
    swift_allocObject();
    DialogDuration.Builder.init()();
    if ((BYTE8(v53) & 1) == 0 && v30 != __PAIR128__(0xE300000000000000, 7235949))
      _stringCompareWithSmolCheck(_:_:expecting:)();
    dispatch thunk of DialogDuration.Builder.withSecs(_:)();
    swift_release();
    v35 = dispatch thunk of DialogDuration.Builder.build()();
    swift_release();
    swift_release();
    *(_QWORD *)(a1 + 64) = v35;
  }
  else
  {
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    swift_arrayDestroy();
    if ((v33 & 1) != 0)
    {
      type metadata accessor for DialogLength.Builder();
      swift_allocObject();
      MEMORY[0x24BD14B88]();
      dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
      swift_release();
      if (*((_QWORD *)&v30 + 1))
      {
        String.toDialogUnit.getter(v30, *((uint64_t *)&v30 + 1));
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        v36 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v9, 0, 1, v36);
      }
      else
      {
        v39 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v9, 1, 1, v39);
      }
      dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
      swift_release();
      outlined destroy of SpeakableString?((uint64_t)v9);
      v40 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
      swift_release();
      swift_release();
      *(_QWORD *)(a1 + 56) = v40;
    }
    else
    {
      outlined init with take of BelowTargetZoneModel?((uint64_t)&v53, (uint64_t)v57, &demangling cache variable for type metadata for Double?);
      outlined init with take of BelowTargetZoneModel?((uint64_t)v57, a1 + 72, &demangling cache variable for type metadata for Double?);
      if (*((_QWORD *)&v30 + 1))
      {
        String.toDialogUnit.getter(v30, *((uint64_t *)&v30 + 1));
        v37 = (uint64_t)v52;
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        v38 = type metadata accessor for SpeakableString();
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v37, 0, 1, v38);
      }
      else
      {
        v41 = type metadata accessor for SpeakableString();
        v37 = (uint64_t)v52;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v52, 1, 1, v41);
      }
      v42 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters(0);
      outlined assign with take of SpeakableString?(v37, a1 + *(int *)(v42 + 48));
    }
  }
  type metadata accessor for DialogDuration.Builder();
  swift_allocObject();
  DialogDuration.Builder.init()();
  outlined init with take of BelowTargetZoneModel?((uint64_t)v55 + 8, (uint64_t)v58, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v58, (uint64_t)v65, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  dispatch thunk of DialogDuration.Builder.withSecs(_:)();
  swift_release();
  v43 = dispatch thunk of DialogDuration.Builder.build()();
  swift_release();
  v44 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters(0);
  v45 = *(int *)(v44 + 72);
  swift_release();
  *(_QWORD *)(a1 + v45) = v43;
  swift_allocObject();
  DialogDuration.Builder.init()();
  outlined init with take of BelowTargetZoneModel?((uint64_t)v58, (uint64_t)v64, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  dispatch thunk of DialogDuration.Builder.withSecs(_:)();
  swift_release();
  v46 = dispatch thunk of DialogDuration.Builder.build()();
  swift_release();
  v47 = *(int *)(v44 + 68);
  result = swift_release();
  *(_QWORD *)(a1 + v47) = v46;
  return result;
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance UpcomingIntervalModel(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _QWORD *v10;

  v4 = *(_OWORD *)(v1 + 176);
  *(_OWORD *)(v2 + 176) = *(_OWORD *)(v1 + 160);
  *(_OWORD *)(v2 + 192) = v4;
  *(_WORD *)(v2 + 208) = *(_WORD *)(v1 + 192);
  v5 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(v2 + 112) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(v2 + 128) = v5;
  v6 = *(_OWORD *)(v1 + 144);
  *(_OWORD *)(v2 + 144) = *(_OWORD *)(v1 + 128);
  *(_OWORD *)(v2 + 160) = v6;
  v7 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v2 + 64) = v7;
  v8 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v2 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v2 + 96) = v8;
  v9 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v2 + 32) = v9;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 216) = v10;
  *v10 = v2;
  v10[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance UpcomingIntervalModel;
  return UpcomingIntervalModel.executePattern(wrapper:)(a1);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t specialized UpcomingIntervalModel.init(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  void (*v4)(char *, uint64_t);
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  void *v20;
  Class isa;
  id v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  __int128 *v41;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t, uint64_t);
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  char *v49;
  __int128 v50;
  uint64_t v51;
  _OWORD v52[12];
  __int16 v53;
  _OWORD v54[10];
  _OWORD v55[2];
  __int16 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _OWORD v67[2];
  __int16 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int16 v81;
  uint64_t v82[28];
  _OWORD v83[12];
  __int16 v84;
  uint64_t v85;

  v51 = a2;
  v85 = *MEMORY[0x24BDAC8D0];
  v3 = type metadata accessor for Logger();
  v4 = *(void (**)(char *, uint64_t))(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v44 - v8;
  v10 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  v46 = (void (*)(char *, uint64_t, uint64_t))*((_QWORD *)v4 + 2);
  v47 = v10;
  v46(v9, v10, v3);
  swift_bridgeObjectRetain_n();
  v11 = Logger.logObject.getter();
  v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v48 = v4;
    v14 = v13;
    v45 = swift_slowAlloc();
    *(_QWORD *)&v83[0] = v45;
    *(_DWORD *)v14 = 136315394;
    v49 = v7;
    v82[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000015, 0x800000024A61D8A0, (uint64_t *)v83);
    *(_QWORD *)&v50 = v3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v14 + 12) = 2080;
    v44 = v14 + 14;
    swift_bridgeObjectRetain();
    v15 = Dictionary.description.getter();
    v17 = v16;
    swift_bridgeObjectRelease();
    v82[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v17, (uint64_t *)v83);
    v7 = v49;
    v3 = v50;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A5E6000, v11, v12, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v14, 0x16u);
    v18 = v45;
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v18, -1, -1);
    MEMORY[0x24BD15374](v14, -1, -1);

    v19 = (void (*)(char *, uint64_t))*((_QWORD *)v48 + 1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v19 = (void (*)(char *, uint64_t))*((_QWORD *)v4 + 1);
  }
  v48 = v19;
  v19(v9, v3);
  v20 = (void *)objc_opt_self();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  *(_QWORD *)&v83[0] = 0;
  v22 = objc_msgSend(v20, sel_dataWithJSONObject_options_error_, isa, 0, v83);

  v23 = *(id *)&v83[0];
  if (v22)
  {
    v24 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v26 = v25;

    type metadata accessor for JSONDecoder();
    swift_allocObject();
    JSONDecoder.init()();
    lazy protocol witness table accessor for type UpcomingIntervalModel and conformance UpcomingIntervalModel();
    dispatch thunk of JSONDecoder.decode<A>(_:from:)();
    swift_release();
    v55[0] = v79;
    v55[1] = v80;
    v56 = v81;
    v54[6] = v75;
    v54[7] = v76;
    v54[8] = v77;
    v54[9] = v78;
    v54[2] = v71;
    v54[3] = v72;
    v54[4] = v73;
    v54[5] = v74;
    v54[0] = v69;
    v54[1] = v70;
    LOBYTE(v57) = 4;
    *((_QWORD *)&v57 + 1) = *((_QWORD *)&v69 + 1);
    v58 = v70;
    v59 = v71;
    v60 = v72;
    v61 = v73;
    v62 = v74;
    LOWORD(v63) = v75;
    *((_QWORD *)&v63 + 1) = *((_QWORD *)&v75 + 1);
    LOBYTE(v64) = v76;
    *((_QWORD *)&v64 + 1) = *((_QWORD *)&v76 + 1);
    *(_QWORD *)&v65 = v77;
    BYTE8(v65) = BYTE8(v77);
    v66 = v78;
    v50 = *(_OWORD *)((char *)v55 + 8);
    *(_OWORD *)((char *)v67 + 8) = *(_OWORD *)((char *)v55 + 8);
    *(_QWORD *)&v67[0] = v79;
    *((_QWORD *)&v67[1] + 1) = *((_QWORD *)&v80 + 1);
    v68 = v81;
    v83[6] = v63;
    v83[7] = v64;
    v84 = v81;
    v83[10] = v67[0];
    v83[11] = v67[1];
    v83[8] = v65;
    v83[9] = v78;
    v83[4] = v73;
    v83[5] = v74;
    v83[2] = v71;
    v83[3] = v72;
    v83[0] = v57;
    v83[1] = v70;
    outlined copy of VoiceFeedbackWorkoutStep?(*((uint64_t *)&v69 + 1), v70, *((uint64_t *)&v70 + 1), v71);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    outlined consume of Data._Representation(v24, v26);
    outlined release of UpcomingIntervalModel((uint64_t *)v54);
    outlined retain of UpcomingIntervalModel((uint64_t *)&v57);
    v43 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1);
    swift_bridgeObjectRelease();
    outlined release of UpcomingIntervalModel((uint64_t *)&v57);
    if (v43)
    {
      v52[10] = v67[0];
      v52[11] = v67[1];
      v53 = v68;
      v52[6] = v63;
      v52[7] = v64;
      v52[8] = v65;
      v52[9] = v66;
      v52[2] = v59;
      v52[3] = v60;
      v52[4] = v61;
      v52[5] = v62;
      v52[0] = v57;
      v52[1] = v58;
      closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:)(v52);
      v41 = v52;
      goto LABEL_11;
    }
    outlined release of UpcomingIntervalModel((uint64_t *)&v57);
  }
  else
  {
    v27 = v23;
    swift_bridgeObjectRelease();
    v28 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    v29 = v47;
    swift_beginAccess();
    v46(v7, v29, v3);
    v30 = v28;
    v31 = v28;
    v32 = Logger.logObject.getter();
    v33 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = swift_slowAlloc();
      v35 = (_QWORD *)swift_slowAlloc();
      v36 = swift_slowAlloc();
      v82[0] = v36;
      *(_DWORD *)v34 = 136315394;
      *(_QWORD *)&v50 = v3;
      *(_QWORD *)&v69 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000015, 0x800000024A61D8A0, v82);
      v49 = v7;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v34 + 12) = 2112;
      v37 = v28;
      v38 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)&v69 = v38;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v35 = v38;
      MEMORY[0x24BD15248](v28);
      MEMORY[0x24BD15248](v28);
      _os_log_impl(&dword_24A5E6000, v32, v33, "Error decoding %s: %@", (uint8_t *)v34, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x24BD15374](v35, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24BD15374](v36, -1, -1);
      MEMORY[0x24BD15374](v34, -1, -1);

      MEMORY[0x24BD15248](v28);
      v39 = v49;
      v40 = v50;
    }
    else
    {
      MEMORY[0x24BD15248](v28);
      MEMORY[0x24BD15248](v28);
      MEMORY[0x24BD15248](v28);

      v39 = v7;
      v40 = v3;
    }
    v48(v39, v40);
  }
  _s20WorkoutAnnouncements21UpcomingIntervalModelVSgWOi0_((uint64_t)&v69);
  v41 = &v69;
LABEL_11:
  outlined init with take of BelowTargetZoneModel?((uint64_t)v41, (uint64_t)v82, &demangling cache variable for type metadata for UpcomingIntervalModel?);
  return outlined init with take of BelowTargetZoneModel?((uint64_t)v82, v51, &demangling cache variable for type metadata for UpcomingIntervalModel?);
}

uint64_t specialized static UpcomingIntervalModel.__derived_struct_equals(_:_:)(uint64_t *a1, uint64_t *a2)
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
  __int16 v15;
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
  __int16 v27;
  uint64_t v28;
  int v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  int v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t result;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int16 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
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
  __int16 v76;
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
  __int16 v88;
  __int128 v89;
  uint64_t v90;
  uint64_t v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  __int128 v95;
  uint64_t v96;
  uint64_t v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  _QWORD v101[4];
  __int16 v102;
  uint64_t v103;
  __int16 v104;

  if (*(unsigned __int8 *)a1 != *(unsigned __int8 *)a2)
    return 0;
  v4 = a1[1];
  v5 = a1[2];
  v6 = a1[3];
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v11 = a1[8];
  v12 = a1[9];
  v14 = a1[10];
  v13 = a1[11];
  v15 = *((_WORD *)a1 + 48);
  v17 = a2[1];
  v16 = a2[2];
  v18 = a2[3];
  v19 = a2[4];
  v21 = a2[5];
  v20 = a2[6];
  v22 = a2[7];
  v23 = a2[8];
  v24 = a2[9];
  v25 = a2[10];
  v26 = a2[11];
  v27 = *((_WORD *)a2 + 48);
  if (v7 == 1)
  {
    if (v19 == 1)
    {
LABEL_4:
      v28 = a1[16];
      v29 = *((unsigned __int8 *)a1 + 136);
      v30 = *((_OWORD *)a1 + 9);
      v31 = a1[20];
      v32 = a1[21];
      v34 = a1[22];
      v33 = a1[23];
      v35 = *((_WORD *)a1 + 96);
      v36 = a2[16];
      v37 = *((unsigned __int8 *)a2 + 136);
      v38 = *((_OWORD *)a2 + 9);
      v39 = a2[20];
      v40 = a2[21];
      v42 = a2[22];
      v41 = a2[23];
      v43 = *((_WORD *)a2 + 96);
      if ((a1[14] & 1) != 0)
      {
        if ((a2[14] & 1) == 0)
          return 0;
      }
      else if ((a2[14] & 1) != 0 || *((double *)a1 + 13) != *((double *)a2 + 13))
      {
        return 0;
      }
      if (v28)
      {
        if (!v36)
          return 0;
        if (a1[15] != a2[15] || v28 != v36)
        {
          v61 = a2[23];
          v48 = a1[23];
          v63 = v38;
          v49 = v39;
          v59 = v30;
          v57 = v31;
          v50 = _stringCompareWithSmolCheck(_:_:expecting:)();
          v31 = v57;
          v30 = v59;
          v38 = v63;
          v41 = v61;
          if ((v50 & 1) == 0)
            return 0;
          v39 = v49;
          v33 = v48;
        }
      }
      else if (v36)
      {
        return 0;
      }
      if (v29 == v37)
      {
        if (v32)
        {
          if (v40)
          {
            v89 = v30;
            v90 = v31;
            v91 = v32;
            v92 = v34;
            v93 = v33;
            v94 = v35 & 0x101;
            v95 = v38;
            v96 = v39;
            v97 = v40;
            v98 = v42;
            v99 = v41;
            v100 = v43 & 0x101;
            if ((specialized static VoiceFeedbackTargetZone.__derived_struct_equals(_:_:)((uint64_t)&v89, (uint64_t)&v95) & 1) != 0)
              return 1;
          }
        }
        else if (!v40)
        {
          return 1;
        }
      }
      return 0;
    }
LABEL_9:
    v65 = v4;
    v66 = v5;
    v67 = v6;
    v68 = v7;
    v69 = v8;
    v70 = v9;
    v71 = v10;
    v72 = v11;
    v73 = v12;
    v74 = v14;
    v75 = v13;
    v76 = v15;
    v77 = v17;
    v78 = v16;
    v79 = v18;
    v80 = v19;
    v81 = v21;
    v82 = v20;
    v83 = v22;
    v84 = v23;
    v85 = v24;
    v86 = v25;
    v87 = v26;
    v88 = v27;
    v44 = v16;
    v45 = v18;
    v46 = v19;
    outlined copy of VoiceFeedbackWorkoutStep?(v4, v5, v6, v7);
    outlined copy of VoiceFeedbackWorkoutStep?(v17, v44, v45, v46);
    outlined release of (VoiceFeedbackWorkoutStep?, VoiceFeedbackWorkoutStep?)(&v65);
    return 0;
  }
  if (v19 == 1)
    goto LABEL_9;
  if ((v5 & 1) != 0)
  {
    if ((v16 & 1) == 0)
      return 0;
  }
  else if ((v16 & 1) != 0 || *(double *)&v4 != *(double *)&v17)
  {
    return 0;
  }
  if (!v7)
  {
    if (v19)
      return 0;
LABEL_38:
    if (v21 != v8)
      return 0;
    goto LABEL_39;
  }
  if (!v19)
    return 0;
  if (v6 == v18 && v7 == v19)
    goto LABEL_38;
  v52 = a1[11];
  v53 = *((_WORD *)a1 + 48);
  v54 = a1[6];
  v55 = a1[7];
  v56 = a2[10];
  v58 = *((_WORD *)a2 + 48);
  v60 = a2[9];
  v62 = a2[6];
  v64 = a2[7];
  v51 = _stringCompareWithSmolCheck(_:_:expecting:)();
  result = 0;
  if ((v51 & 1) != 0)
  {
    v20 = v62;
    v22 = v64;
    v24 = v60;
    v27 = v58;
    v10 = v55;
    LOWORD(v25) = v56;
    v9 = v54;
    v15 = v53;
    v13 = v52;
    if (v21 == v8)
    {
LABEL_39:
      if (v12)
      {
        if (!v24)
          return 0;
        v101[0] = v9;
        v101[1] = v10;
        v101[2] = v11;
        v101[3] = v12;
        v102 = v14;
        v103 = v13;
        v104 = v15 & 0x101;
        v65 = v20;
        v66 = v22;
        v67 = v23;
        v68 = v24;
        LOWORD(v69) = v25;
        v70 = v26;
        LOWORD(v71) = v27 & 0x101;
        if ((specialized static VoiceFeedbackTargetZone.__derived_struct_equals(_:_:)((uint64_t)v101, (uint64_t)&v65) & 1) == 0)
          return 0;
      }
      else if (v24)
      {
        return 0;
      }
      goto LABEL_4;
    }
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for UpcomingIntervalModel.CodingKeys, &unk_251BEC410);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for UpcomingIntervalModel.CodingKeys, &unk_251BEC410);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for UpcomingIntervalModel.CodingKeys, &unk_251BEC410);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for UpcomingIntervalModel.CodingKeys, &unk_251BEC410);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackWorkoutStep and conformance VoiceFeedbackWorkoutStep()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep and conformance VoiceFeedbackWorkoutStep;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep and conformance VoiceFeedbackWorkoutStep)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackWorkoutStep, &type metadata for VoiceFeedbackWorkoutStep);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep and conformance VoiceFeedbackWorkoutStep);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep and conformance VoiceFeedbackWorkoutStep;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep and conformance VoiceFeedbackWorkoutStep)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for VoiceFeedbackWorkoutStep, &type metadata for VoiceFeedbackWorkoutStep);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep and conformance VoiceFeedbackWorkoutStep);
  }
  return result;
}

uint64_t specialized UpcomingIntervalModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7079547472656C61 && a2 == 0xE900000000000065;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574656C706D6F63 && a2 == 0xED00007065745364
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x706574537478656ELL && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t *specialized UpcomingIntervalModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *result;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  unsigned __int16 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE v68[24];
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  uint64_t v89;
  unsigned __int8 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  unsigned __int16 v94;
  char v95;
  char v96;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<UpcomingIntervalModel.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v43 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  lazy protocol witness table accessor for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v44 = 0;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
    return (uint64_t *)outlined consume of VoiceFeedbackWorkoutStep?(0, v44, v49, 1);
  }
  else
  {
    v42 = v6;
    LOBYTE(v50) = 0;
    lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v10 = v63;
    LOBYTE(v50) = 1;
    lazy protocol witness table accessor for type VoiceFeedbackWorkoutStep and conformance VoiceFeedbackWorkoutStep();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    v96 = 2;
    v45 = (unsigned __int16)v72;
    v46 = v71;
    v47 = v70;
    v48 = v69;
    v11 = v63;
    v44 = v64;
    v49 = v65;
    v12 = v66;
    v39 = v67;
    v40 = *(_QWORD *)&v68[16];
    v41 = *(_OWORD *)v68;
    outlined copy of VoiceFeedbackWorkoutStep?(v63, v64, v65, v66);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v8, v5);
    v29 = v86;
    v42 = v88;
    v38 = v89;
    v37 = v90;
    v35 = *((_QWORD *)&v91 + 1);
    v36 = v91;
    v33 = *((_QWORD *)&v92 + 1);
    v34 = v92;
    v31 = *((_QWORD *)&v93 + 1);
    v32 = v93;
    v30 = v94;
    v95 = v87;
    LOBYTE(v50) = v10;
    v27 = v11;
    *((_QWORD *)&v50 + 1) = v11;
    *(_QWORD *)&v51 = v44;
    *((_QWORD *)&v51 + 1) = v49;
    *(_QWORD *)&v52 = v12;
    v13 = v12;
    v28 = v10;
    *((_QWORD *)&v52 + 1) = v39;
    v53 = v41;
    *(_QWORD *)&v54 = v40;
    *((_QWORD *)&v54 + 1) = v48;
    *(_QWORD *)&v55 = v47;
    *((_QWORD *)&v55 + 1) = v46;
    LOWORD(v56) = v45;
    *((_QWORD *)&v56 + 1) = v86;
    LOBYTE(v57) = v87;
    *((_QWORD *)&v57 + 1) = v88;
    *(_QWORD *)&v58 = v89;
    BYTE8(v58) = v90;
    v59 = v91;
    v60 = v92;
    v61 = v93;
    v62 = v94;
    outlined retain of UpcomingIntervalModel((uint64_t *)&v50);
    v14 = v27;
    v15 = v44;
    v16 = v49;
    v17 = v39;
    v18 = v40;
    outlined consume of VoiceFeedbackWorkoutStep?(v27, v44, v49, v13);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
    LOBYTE(v63) = v28;
    v64 = v14;
    v65 = v15;
    v66 = v16;
    v67 = v13;
    *(_QWORD *)v68 = v17;
    *(_OWORD *)&v68[8] = v41;
    v69 = v18;
    v70 = v48;
    v71 = v47;
    v72 = v46;
    v73 = v45;
    v74 = v29;
    v75 = v95;
    v76 = v42;
    v77 = v38;
    v78 = v37;
    v79 = v36;
    v80 = v35;
    v81 = v34;
    v82 = v33;
    v83 = v32;
    v84 = v31;
    v85 = v30;
    result = outlined release of UpcomingIntervalModel(&v63);
    v20 = v61;
    *(_OWORD *)(a2 + 160) = v60;
    *(_OWORD *)(a2 + 176) = v20;
    *(_WORD *)(a2 + 192) = v62;
    v21 = v57;
    *(_OWORD *)(a2 + 96) = v56;
    *(_OWORD *)(a2 + 112) = v21;
    v22 = v59;
    *(_OWORD *)(a2 + 128) = v58;
    *(_OWORD *)(a2 + 144) = v22;
    v23 = v53;
    *(_OWORD *)(a2 + 32) = v52;
    *(_OWORD *)(a2 + 48) = v23;
    v24 = v55;
    *(_OWORD *)(a2 + 64) = v54;
    *(_OWORD *)(a2 + 80) = v24;
    v25 = v51;
    *(_OWORD *)a2 = v50;
    *(_OWORD *)(a2 + 16) = v25;
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for UpcomingIntervalModel(_QWORD *a1)
{
  unint64_t result;

  a1[1] = lazy protocol witness table accessor for type UpcomingIntervalModel and conformance UpcomingIntervalModel();
  a1[2] = lazy protocol witness table accessor for type UpcomingIntervalModel and conformance UpcomingIntervalModel();
  result = lazy protocol witness table accessor for type UpcomingIntervalModel and conformance UpcomingIntervalModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type UpcomingIntervalModel and conformance UpcomingIntervalModel()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UpcomingIntervalModel and conformance UpcomingIntervalModel;
  if (!lazy protocol witness table cache variable for type UpcomingIntervalModel and conformance UpcomingIntervalModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for UpcomingIntervalModel, &type metadata for UpcomingIntervalModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UpcomingIntervalModel and conformance UpcomingIntervalModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UpcomingIntervalModel and conformance UpcomingIntervalModel;
  if (!lazy protocol witness table cache variable for type UpcomingIntervalModel and conformance UpcomingIntervalModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for UpcomingIntervalModel, &type metadata for UpcomingIntervalModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UpcomingIntervalModel and conformance UpcomingIntervalModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UpcomingIntervalModel and conformance UpcomingIntervalModel;
  if (!lazy protocol witness table cache variable for type UpcomingIntervalModel and conformance UpcomingIntervalModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for UpcomingIntervalModel, &type metadata for UpcomingIntervalModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UpcomingIntervalModel and conformance UpcomingIntervalModel);
  }
  return result;
}

uint64_t destroy for UpcomingIntervalModel(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UpcomingIntervalModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = a1 + 8;
  v5 = (_OWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 32);
  if (v6 == 1)
  {
    v7 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(v4 + 32) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(v4 + 48) = v7;
    *(_OWORD *)(v4 + 64) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(v4 + 74) = *(_OWORD *)(a2 + 82);
    v8 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)v4 = *v5;
    *(_OWORD *)(v4 + 16) = v8;
  }
  else
  {
    *(_QWORD *)v4 = *(_QWORD *)v5;
    *(_BYTE *)(v4 + 8) = *(_BYTE *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 32) = v6;
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    v9 = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 72) = v9;
    *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
    *(_BYTE *)(a1 + 81) = *(_BYTE *)(a2 + 81);
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    *(_WORD *)(a1 + 96) = *(_WORD *)(a2 + 96);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  v10 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v10;
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  v11 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v11;
  *(_BYTE *)(a1 + 176) = *(_BYTE *)(a2 + 176);
  *(_BYTE *)(a1 + 177) = *(_BYTE *)(a2 + 177);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  *(_WORD *)(a1 + 192) = *(_WORD *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UpcomingIntervalModel(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  _OWORD *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = (_OWORD *)(a1 + 8);
  v5 = (_OWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 32) == 1)
  {
    if (v6 == 1)
    {
      v7 = *(_OWORD *)(a2 + 24);
      *v4 = *v5;
      *(_OWORD *)(a1 + 24) = v7;
      v8 = *(_OWORD *)(a2 + 40);
      v9 = *(_OWORD *)(a2 + 56);
      v10 = *(_OWORD *)(a2 + 72);
      *(_OWORD *)(a1 + 82) = *(_OWORD *)(a2 + 82);
      *(_OWORD *)(a1 + 56) = v9;
      *(_OWORD *)(a1 + 72) = v10;
      *(_OWORD *)(a1 + 40) = v8;
    }
    else
    {
      v15 = *(_QWORD *)v5;
      *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
      *(_QWORD *)v4 = v15;
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
      *(_BYTE *)(a1 + 81) = *(_BYTE *)(a2 + 81);
      v16 = *(_QWORD *)(a2 + 88);
      *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
      *(_QWORD *)(a1 + 88) = v16;
      *(_BYTE *)(a1 + 97) = *(_BYTE *)(a2 + 97);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v6 == 1)
  {
    outlined destroy of VoiceFeedbackWorkoutStep(a1 + 8);
    v11 = v5[1];
    *v4 = *v5;
    v4[1] = v11;
    v13 = v5[3];
    v12 = v5[4];
    v14 = v5[2];
    *(_OWORD *)((char *)v4 + 74) = *(_OWORD *)((char *)v5 + 74);
    v4[3] = v13;
    v4[4] = v12;
    v4[2] = v14;
  }
  else
  {
    v17 = *(_QWORD *)v5;
    *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
    *(_QWORD *)v4 = v17;
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
    *(_BYTE *)(a1 + 81) = *(_BYTE *)(a2 + 81);
    v18 = *(_QWORD *)(a2 + 88);
    *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
    *(_QWORD *)(a1 + 88) = v18;
    *(_BYTE *)(a1 + 97) = *(_BYTE *)(a2 + 97);
  }
  v19 = *(_QWORD *)(a2 + 104);
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = v19;
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 176) = *(_BYTE *)(a2 + 176);
  *(_BYTE *)(a1 + 177) = *(_BYTE *)(a2 + 177);
  v20 = *(_QWORD *)(a2 + 184);
  *(_BYTE *)(a1 + 192) = *(_BYTE *)(a2 + 192);
  *(_QWORD *)(a1 + 184) = v20;
  *(_BYTE *)(a1 + 193) = *(_BYTE *)(a2 + 193);
  return a1;
}

uint64_t outlined destroy of VoiceFeedbackWorkoutStep(uint64_t a1)
{
  destroy for VoiceFeedbackWorkoutStep();
  return a1;
}

__n128 __swift_memcpy194_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __int128 v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  v5 = *(_OWORD *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  result = *(__n128 *)(a2 + 144);
  v9 = *(_OWORD *)(a2 + 160);
  v10 = *(_OWORD *)(a2 + 176);
  *(_WORD *)(a1 + 192) = *(_WORD *)(a2 + 192);
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 176) = v10;
  *(__n128 *)(a1 + 144) = result;
  return result;
}

uint64_t assignWithTake for UpcomingIntervalModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = a1 + 8;
  v5 = a2 + 8;
  if (*(_QWORD *)(a1 + 32) != 1)
  {
    v6 = *(_QWORD *)(a2 + 32);
    if (v6 != 1)
    {
      *(_QWORD *)v4 = *(_QWORD *)v5;
      *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 32) = v6;
      swift_bridgeObjectRelease();
      *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
      *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
      v9 = *(_QWORD *)(a2 + 72);
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 72) = v9;
      swift_bridgeObjectRelease();
      *(_WORD *)(a1 + 80) = *(_WORD *)(a2 + 80);
      *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
      *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
      *(_BYTE *)(a1 + 97) = *(_BYTE *)(a2 + 97);
      goto LABEL_6;
    }
    outlined destroy of VoiceFeedbackWorkoutStep(v4);
  }
  v7 = *(_OWORD *)(v5 + 48);
  *(_OWORD *)(v4 + 32) = *(_OWORD *)(v5 + 32);
  *(_OWORD *)(v4 + 48) = v7;
  *(_OWORD *)(v4 + 64) = *(_OWORD *)(v5 + 64);
  *(_OWORD *)(v4 + 74) = *(_OWORD *)(v5 + 74);
  v8 = *(_OWORD *)(v5 + 16);
  *(_OWORD *)v4 = *(_OWORD *)v5;
  *(_OWORD *)(v4 + 16) = v8;
LABEL_6:
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  v10 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v10;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  v11 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v11;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 176) = *(_WORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  *(_BYTE *)(a1 + 192) = *(_BYTE *)(a2 + 192);
  *(_BYTE *)(a1 + 193) = *(_BYTE *)(a2 + 193);
  return a1;
}

uint64_t getEnumTagSinglePayload for UpcomingIntervalModel(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 194))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 128);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for UpcomingIntervalModel(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 184) = 0;
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
    *(_WORD *)(result + 192) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 194) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 194) = 0;
    if (a2)
      *(_QWORD *)(result + 128) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for UpcomingIntervalModel()
{
  return &type metadata for UpcomingIntervalModel;
}

uint64_t storeEnumTagSinglePayload for UpcomingIntervalModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A6182AC + 4 * byte_24A61D7E5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24A6182E0 + 4 * byte_24A61D7E0[v4]))();
}

uint64_t sub_24A6182E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A6182E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A6182F0);
  return result;
}

uint64_t sub_24A6182FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A618304);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24A618308(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A618310(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for UpcomingIntervalModel.CodingKeys()
{
  return &unk_251BEC410;
}

uint64_t *outlined retain of UpcomingIntervalModel(uint64_t *a1)
{
  outlined copy of VoiceFeedbackWorkoutStep?(a1[1], a1[2], a1[3], a1[4]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t outlined copy of VoiceFeedbackWorkoutStep?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (a4 != 1)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t *outlined release of UpcomingIntervalModel(uint64_t *a1)
{
  outlined consume of VoiceFeedbackWorkoutStep?(a1[1], a1[2], a1[3], a1[4]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t outlined consume of VoiceFeedbackWorkoutStep?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (a4 != 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t outlined destroy of SpeakableString?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *outlined release of (VoiceFeedbackWorkoutStep?, VoiceFeedbackWorkoutStep?)(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = a1[13];
  v6 = a1[12];
  v3 = a1[14];
  v4 = a1[15];
  outlined consume of VoiceFeedbackWorkoutStep?(*a1, a1[1], a1[2], a1[3]);
  outlined consume of VoiceFeedbackWorkoutStep?(v6, v2, v3, v4);
  return a1;
}

double _s20WorkoutAnnouncements21UpcomingIntervalModelVSgWOi0_(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 128) = 1;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 178) = 0u;
  return result;
}

uint64_t EnteredTargetZoneModel.alertType.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t EnteredTargetZoneModel.alertType.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*EnteredTargetZoneModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

void __swiftcall EnteredTargetZoneModel.init(magnitude:unit:targetZone:)(WorkoutAnnouncements::EnteredTargetZoneModel *__return_ptr retstr, Swift::Double magnitude, Swift::String unit, WorkoutAnnouncements::VoiceFeedbackTargetZone *targetZone)
{
  void *object;
  uint64_t countAndFlagsBits;
  Swift::Bool isSingleThreshold;
  WorkoutAnnouncements::VoiceFeedbackPaceFormat value;
  WorkoutAnnouncements::VoiceFeedbackMetricType metricType;

  object = unit._object;
  countAndFlagsBits = unit._countAndFlagsBits;
  outlined release of AboveTargetZoneModel((uint64_t)targetZone);
  isSingleThreshold = targetZone->isSingleThreshold;
  value = targetZone->paceFormat.value;
  metricType = targetZone->metricType;
  retstr->alertType = WorkoutAnnouncements_VoiceFeedbackAlertType_zoneEntered;
  retstr->magnitude = magnitude;
  retstr->unit._countAndFlagsBits = countAndFlagsBits;
  retstr->unit._object = object;
  retstr->isSingleThreshold = isSingleThreshold;
  retstr->paceFormat.value = value;
  retstr->metricType = metricType;
}

uint64_t EnteredTargetZoneModel.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24A6187A8 + 4 * byte_24A61DA20[a1]))(0xD000000000000011, 0x800000024A61DDC0);
}

uint64_t sub_24A6187A8()
{
  return 0x7079547472656C61;
}

uint64_t sub_24A6187D8()
{
  return 1953066613;
}

uint64_t sub_24A6187E8()
{
  return 0x6D726F4665636170;
}

uint64_t sub_24A618808()
{
  return 0x795463697274656DLL;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance EnteredTargetZoneModel.CodingKeys()
{
  unsigned __int8 *v0;

  return EnteredTargetZoneModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance EnteredTargetZoneModel.CodingKeys()
{
  lazy protocol witness table accessor for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance EnteredTargetZoneModel.CodingKeys()
{
  lazy protocol witness table accessor for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t EnteredTargetZoneModel.encode(to:)(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[9];
  _BYTE v11[6];
  char v12;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<EnteredTargetZoneModel.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v11[5] = *v3;
  v11[4] = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    v11[3] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[2] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[1] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    outlined init with take of VoiceFeedbackPaceFormat?((uint64_t)(v3 + 33), (uint64_t)&v12);
    outlined init with take of VoiceFeedbackPaceFormat?((uint64_t)&v12, (uint64_t)v11);
    v10[8] = 4;
    lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    v10[7] = v3[34];
    v10[6] = 5;
    lazy protocol witness table accessor for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

double EnteredTargetZoneModel.init(from:)@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  _BYTE v7[19];

  specialized EnteredTargetZoneModel.init(from:)(a1, (uint64_t)&v6);
  if (!v2)
  {
    result = *(double *)&v6;
    v5 = *(_OWORD *)v7;
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v5;
    *(_DWORD *)(a2 + 31) = *(_DWORD *)&v7[15];
  }
  return result;
}

double protocol witness for Decodable.init(from:) in conformance EnteredTargetZoneModel@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  _BYTE v7[19];

  specialized EnteredTargetZoneModel.init(from:)(a1, (uint64_t)&v6);
  if (!v2)
  {
    result = *(double *)&v6;
    v5 = *(_OWORD *)v7;
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v5;
    *(_DWORD *)(a2 + 31) = *(_DWORD *)&v7[15];
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance EnteredTargetZoneModel(_QWORD *a1)
{
  return EnteredTargetZoneModel.encode(to:)(a1);
}

uint64_t EnteredTargetZoneModel.executePattern(wrapper:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[6] = a1;
  v2[7] = v1;
  v3 = type metadata accessor for Logger();
  v2[8] = v3;
  v2[9] = *(_QWORD *)(v3 - 8);
  v2[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t EnteredTargetZoneModel.executePattern(wrapper:)()
{
  uint64_t v0;
  unsigned __int8 v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t (*v27)(uint64_t);
  _BYTE *v28;
  uint64_t v29;
  uint64_t (*v30)(char, uint64_t, uint64_t);
  uint64_t (*v31)(char, uint64_t, uint64_t);
  uint64_t v32;

  if (one-time initialization token for noPaceFormatMetrics != -1)
    swift_once();
  v1 = *(_BYTE *)(*(_QWORD *)(v0 + 56) + 34);
  v2 = specialized Sequence<>.contains(_:)(v1, (uint64_t)noPaceFormatMetrics._rawValue);
  v3 = *(_QWORD *)(v0 + 56);
  if (v2)
  {
    v4 = *__swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 48), *(_QWORD *)(*(_QWORD *)(v0 + 48) + 24));
    outlined retain of AboveTargetZoneModel(v3);
    v30 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredNonPace(executeSashGroupOnWatch:_:)
                                                         + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredNonPace(executeSashGroupOnWatch:_:));
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v5;
    *v5 = v0;
    v5[1] = AboveTargetZoneModel.executePattern(wrapper:);
    return v30(0, v4, *(_QWORD *)(v0 + 56));
  }
  else
  {
    outlined init with take of VoiceFeedbackPaceFormat?(v3 + 33, v0 + 113);
    outlined init with take of VoiceFeedbackPaceFormat?(v0 + 113, v0 + 112);
    v7 = *(unsigned __int8 *)(v0 + 112);
    if (v7 == 2)
    {
      v9 = *(_QWORD *)(v0 + 72);
      v8 = *(_QWORD *)(v0 + 80);
      v11 = *(_QWORD *)(v0 + 56);
      v10 = *(_QWORD *)(v0 + 64);
      v12 = Logger.workout.unsafeMutableAddressor();
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v12, v10);
      outlined retain of AboveTargetZoneModel(v11);
      outlined retain of AboveTargetZoneModel(v11);
      v13 = Logger.logObject.getter();
      v14 = static os_log_type_t.error.getter();
      v15 = os_log_type_enabled(v13, v14);
      v17 = *(_QWORD *)(v0 + 72);
      v16 = *(_QWORD *)(v0 + 80);
      v19 = *(_QWORD *)(v0 + 56);
      v18 = *(_QWORD *)(v0 + 64);
      if (v15)
      {
        v29 = *(_QWORD *)(v0 + 64);
        v20 = (uint8_t *)swift_slowAlloc();
        v21 = swift_slowAlloc();
        v32 = v21;
        *(_DWORD *)v20 = 136315138;
        *(_BYTE *)(v0 + 114) = v1;
        v22 = String.init<A>(describing:)();
        *(_QWORD *)(v0 + 40) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v23, &v32);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        outlined release of AboveTargetZoneModel(v19);
        outlined release of AboveTargetZoneModel(v19);
        _os_log_impl(&dword_24A5E6000, v13, v14, "EnteredTargetZoneModel needs a pace format for: %s", v20, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24BD15374](v21, -1, -1);
        MEMORY[0x24BD15374](v20, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v29);
      }
      else
      {
        outlined release of AboveTargetZoneModel(*(_QWORD *)(v0 + 56));
        outlined release of AboveTargetZoneModel(v19);

        (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
      }
      lazy protocol witness table accessor for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors();
      swift_allocError();
      *v28 = 1;
      swift_willThrow();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    else
    {
      v24 = *(_QWORD *)(v0 + 56);
      v25 = *__swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 48), *(_QWORD *)(*(_QWORD *)(v0 + 48) + 24));
      outlined retain of AboveTargetZoneModel(v24);
      if ((v7 & 1) != 0)
      {
        v31 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredPace(executeSashGroupOnWatch:_:)
                                                             + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredPace(executeSashGroupOnWatch:_:));
        v26 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 104) = v26;
        v27 = AboveTargetZoneModel.executePattern(wrapper:);
      }
      else
      {
        v31 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredSpeed(executeSashGroupOnWatch:_:)
                                                             + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredSpeed(executeSashGroupOnWatch:_:));
        v26 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 96) = v26;
        v27 = AboveTargetZoneModel.executePattern(wrapper:);
      }
      *v26 = v0;
      v26[1] = v27;
      return v31(0, v25, *(_QWORD *)(v0 + 56));
    }
  }
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance EnteredTargetZoneModel(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v4;
  _QWORD *v5;

  v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v2 + 32) = v4;
  *(_DWORD *)(v2 + 47) = *(_DWORD *)(v1 + 31);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 56) = v5;
  *v5 = v2;
  v5[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance AboveTargetZoneModel;
  return EnteredTargetZoneModel.executePattern(wrapper:)(a1);
}

uint64_t specialized EnteredTargetZoneModel.init(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  double v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char v28;
  int v29;
  uint64_t v30;
  char v31;
  int v32;
  uint64_t result;
  uint64_t v34;
  double v35;
  int v36;
  int v37;
  uint64_t v38;
  char v39;
  char v40;
  unsigned __int8 v41;
  double v42;
  char v43;
  _QWORD v44[2];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  BOOL v53;
  unsigned __int8 v54;
  char v55;

  v4 = type metadata accessor for Logger();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(specialized Sequence.compactMap<A>(_:)(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
    v8 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v8 = MEMORY[0x24BEE4B00];
  }
  *(_QWORD *)&v51 = v8;
  v9 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v9, 1, &v51);
  swift_bridgeObjectRelease();
  v10 = v51;
  v11 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
  swift_retain_n();
  v12 = Logger.logObject.getter();
  v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v46 = swift_slowAlloc();
    *(_QWORD *)&v51 = v46;
    *(_DWORD *)v14 = 136315394;
    v48 = a1;
    v49 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000016, 0x800000024A61DAE0, (uint64_t *)&v51));
    v47 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v14 + 12) = 2080;
    v44[1] = v14 + 14;
    lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
    v45 = v4;
    swift_retain();
    v15 = Dictionary.description.getter();
    v16 = a2;
    v18 = v17;
    swift_release();
    v49 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v18, (uint64_t *)&v51));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    a2 = v16;
    a1 = v48;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A5E6000, v12, v13, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v14, 0x16u);
    v19 = v46;
    swift_arrayDestroy();
    MEMORY[0x24BD15374](v19, -1, -1);
    MEMORY[0x24BD15374](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v47 + 8))(v7, v45);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  if (*(_QWORD *)(v10 + 16)
    && (v20 = specialized __RawDictionaryStorage.find<A>(_:)(6), (v21 & 1) != 0)
    && (outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v20, (uint64_t)&v51), (swift_dynamicCast() & 1) != 0)
    && *(_QWORD *)(v10 + 16)
    && (v22 = v49, v23 = specialized __RawDictionaryStorage.find<A>(_:)(15), (v24 & 1) != 0)
    && (outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v23, (uint64_t)&v51), (swift_dynamicCast() & 1) != 0))
  {
    v25 = v50;
    if (!*(_QWORD *)(v10 + 16))
      goto LABEL_26;
    v26 = *(_QWORD *)&v49;
    v27 = specialized __RawDictionaryStorage.find<A>(_:)(5);
    if ((v28 & 1) == 0)
      goto LABEL_26;
    outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v27, (uint64_t)&v51);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*(_QWORD *)(v10 + 16))
      {
        v29 = LOBYTE(v49);
        v30 = specialized __RawDictionaryStorage.find<A>(_:)(7);
        if ((v31 & 1) != 0)
        {
          outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v30, (uint64_t)&v51);
          if ((swift_dynamicCast() & 1) == 0
            || (v32 = specialized VoiceFeedbackMetricType.init(rawValue:)(*(unint64_t *)&v49),
                v32 == 8))
          {
            swift_release();
            swift_bridgeObjectRelease();
            goto LABEL_23;
          }
          v37 = v32;
          if (*(_QWORD *)(v10 + 16) && (v38 = specialized __RawDictionaryStorage.find<A>(_:)(12), (v39 & 1) != 0))
          {
            outlined init with copy of Any(*(_QWORD *)(v10 + 56) + 32 * v38, (uint64_t)&v51);
          }
          else
          {
            v51 = 0u;
            v52 = 0u;
          }
          swift_release();
          if (*((_QWORD *)&v52 + 1))
          {
            if ((swift_dynamicCast() & 1) != 0)
            {
              if (*(_QWORD *)&v49 == 1)
                v40 = 1;
              else
                v40 = 2;
              if (v49 == 0.0)
                v41 = 0;
              else
                v41 = v40;
LABEL_43:
              if (v29)
                v42 = v22;
              else
                v42 = v22 + 1.0;
              LOBYTE(v51) = 22;
              *((double *)&v51 + 1) = v22;
              *(_QWORD *)&v52 = v26;
              *((_QWORD *)&v52 + 1) = v25;
              v53 = v22 == v42;
              v54 = v41;
              v55 = v37;
              swift_bridgeObjectRetain();
              v43 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1);
              swift_bridgeObjectRelease();
              result = swift_bridgeObjectRelease();
              if ((v43 & 1) != 0)
              {
                v35 = v22;
                v36 = (v22 == v42) | (v41 << 8) | (v37 << 16);
                v34 = 22;
                goto LABEL_25;
              }
              goto LABEL_23;
            }
          }
          else
          {
            outlined destroy of Any?((uint64_t)&v51);
          }
          v41 = 2;
          goto LABEL_43;
        }
      }
LABEL_26:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_release();
      goto LABEL_24;
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
  }
LABEL_23:
  result = swift_bridgeObjectRelease();
LABEL_24:
  v34 = 0;
  v35 = 0.0;
  v26 = 0;
  v25 = 0;
  v36 = 0;
LABEL_25:
  *(_QWORD *)a2 = v34;
  *(double *)(a2 + 8) = v35;
  *(_QWORD *)(a2 + 16) = v26;
  *(_QWORD *)(a2 + 24) = v25;
  *(_WORD *)(a2 + 32) = v36;
  *(_BYTE *)(a2 + 34) = BYTE2(v36);
  return result;
}

unint64_t lazy protocol witness table accessor for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for EnteredTargetZoneModel.CodingKeys, &unk_251BEC638);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for EnteredTargetZoneModel.CodingKeys, &unk_251BEC638);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for EnteredTargetZoneModel.CodingKeys, &unk_251BEC638);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for EnteredTargetZoneModel.CodingKeys, &unk_251BEC638);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys);
  }
  return result;
}

uint64_t specialized EnteredTargetZoneModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t result;
  int v18;
  int v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;
  unsigned __int8 v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<EnteredTargetZoneModel.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  v28 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v9 = v29;
  v27 = 1;
  KeyedDecodingContainer.decode(_:forKey:)();
  v11 = v10;
  v26 = 2;
  v12 = KeyedDecodingContainer.decode(_:forKey:)();
  v14 = v13;
  v20 = v12;
  v25 = 3;
  swift_bridgeObjectRetain();
  v19 = KeyedDecodingContainer.decode(_:forKey:)();
  v23 = 4;
  lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  v18 = v24;
  v21 = 5;
  lazy protocol witness table accessor for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v15 = v19 & 1;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v16 = v22;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  result = swift_bridgeObjectRelease();
  *(_BYTE *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_QWORD *)(a2 + 16) = v20;
  *(_QWORD *)(a2 + 24) = v14;
  *(_BYTE *)(a2 + 32) = v15;
  *(_BYTE *)(a2 + 33) = v18;
  *(_BYTE *)(a2 + 34) = v16;
  return result;
}

unint64_t instantiation function for generic protocol witness table for EnteredTargetZoneModel(_QWORD *a1)
{
  unint64_t result;

  a1[1] = lazy protocol witness table accessor for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel();
  a1[2] = lazy protocol witness table accessor for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel();
  result = lazy protocol witness table accessor for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel;
  if (!lazy protocol witness table cache variable for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for EnteredTargetZoneModel, &type metadata for EnteredTargetZoneModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel;
  if (!lazy protocol witness table cache variable for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for EnteredTargetZoneModel, &type metadata for EnteredTargetZoneModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel;
  if (!lazy protocol witness table cache variable for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel)
  {
    result = MEMORY[0x24BD152CC](&protocol conformance descriptor for EnteredTargetZoneModel, &type metadata for EnteredTargetZoneModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel);
  }
  return result;
}

ValueMetadata *type metadata accessor for EnteredTargetZoneModel()
{
  return &type metadata for EnteredTargetZoneModel;
}

uint64_t storeEnumTagSinglePayload for EnteredTargetZoneModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A6199FC + 4 * byte_24A61DA2B[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_24A619A30 + 4 * byte_24A61DA26[v4]))();
}

uint64_t sub_24A619A30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A619A38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A619A40);
  return result;
}

uint64_t sub_24A619A4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A619A54);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_24A619A58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A619A60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for EnteredTargetZoneModel.CodingKeys()
{
  return &unk_251BEC638;
}

WorkoutAnnouncements::VoiceFeedbackPaceFormat_optional __swiftcall VoiceFeedbackPaceFormat.init(rawValue:)(Swift::Int rawValue)
{
  WorkoutAnnouncements::VoiceFeedbackPaceFormat_optional v1;

  if (rawValue == 1)
    v1.value = WorkoutAnnouncements_VoiceFeedbackPaceFormat_pace;
  else
    v1.value = WorkoutAnnouncements_VoiceFeedbackPaceFormat_unknownDefault;
  if (rawValue)
    return v1;
  else
    return 0;
}

uint64_t VoiceFeedbackPaceFormat.rawValue.getter(char a1)
{
  return a1 & 1;
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance VoiceFeedbackPaceFormat@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
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

uint64_t protocol witness for Decodable.init(from:) in conformance VoiceFeedbackPaceFormat()
{
  lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance VoiceFeedbackPaceFormat()
{
  lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
  return RawRepresentable<>.encode(to:)();
}

unint64_t instantiation function for generic protocol witness table for VoiceFeedbackPaceFormat(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t storeEnumTagSinglePayload for VoiceFeedbackPaceFormat(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A619D38 + 4 * byte_24A61DC35[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24A619D6C + 4 * byte_24A61DC30[v4]))();
}

uint64_t sub_24A619D6C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A619D74(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A619D7CLL);
  return result;
}

uint64_t sub_24A619D88(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A619D90);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24A619D94(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A619D9C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for VoiceFeedbackPaceFormat()
{
  return &type metadata for VoiceFeedbackPaceFormat;
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

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t PropertyListEncoder.init()()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x24BDCDCA0]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t PromptForValueFlowStrategyAsync.makeFlowCancelledResponse()()
{
  return MEMORY[0x24BE96188]();
}

uint64_t PromptForValueFlowStrategyAsync.makeErrorResponse(_:)()
{
  return MEMORY[0x24BE96198]();
}

uint64_t PromptForValueFlowStrategyAsync.makeRepromptOnEmptyParse()()
{
  return MEMORY[0x24BE961A8]();
}

uint64_t PromptForValueFlowStrategyAsync.makeRepromptOnLowConfidence()()
{
  return MEMORY[0x24BE961B8]();
}

uint64_t PromptForValueFlowAsync.init<A>(strategy:outputPublisher:)()
{
  return MEMORY[0x24BE961E8]();
}

uint64_t PatternFlowProvider.init(outputPublisher:responseGenerator:)()
{
  return MEMORY[0x24BE96AC0]();
}

uint64_t type metadata accessor for PatternFlowProvider()
{
  return MEMORY[0x24BE96AD0]();
}

uint64_t dispatch thunk of PatternFlowProviding.makeResponseFlow(patternExecutionResult:outputGenerationManifest:)()
{
  return MEMORY[0x24BE96AE0]();
}

uint64_t PatternFlowProviding.makeResponseFlow(patternExecutionResult:outputGenerationManifest:)()
{
  return MEMORY[0x24BE96B00]();
}

uint64_t Flow.eraseToAnyFlow()()
{
  return MEMORY[0x24BE96E78]();
}

uint64_t Flow.deferToExecuteAsync(_:)()
{
  return MEMORY[0x24BE96E98]();
}

uint64_t Flow.flexibleExecutionSupport.getter()
{
  return MEMORY[0x24BE96EA0]();
}

uint64_t Flow.onAsync(input:)()
{
  return MEMORY[0x24BE96EC0]();
}

uint64_t Flow<>.exitValue.getter()
{
  return MEMORY[0x24BE96ED0]();
}

uint64_t static AceService.currentAsync.getter()
{
  return MEMORY[0x24BE973E0]();
}

uint64_t dispatch thunk of DeviceState.isWatch.getter()
{
  return MEMORY[0x24BE975F0]();
}

uint64_t DeviceState.asInvocationContext.getter()
{
  return MEMORY[0x24BE97670]();
}

uint64_t static DialogPhase.completion.getter()
{
  return MEMORY[0x24BE976A8]();
}

uint64_t static DialogPhase.confirmation.getter()
{
  return MEMORY[0x24BE976B8]();
}

uint64_t type metadata accessor for DialogPhase()
{
  return MEMORY[0x24BE97700]();
}

uint64_t type metadata accessor for PromptResult()
{
  return MEMORY[0x24BE97948]();
}

uint64_t static ActionForInput.handle()()
{
  return MEMORY[0x24BE97AB0]();
}

uint64_t static ActionForInput.ignore()()
{
  return MEMORY[0x24BE97AB8]();
}

uint64_t static ExecuteResponse.replan<A>(next:childCompletion:)()
{
  return MEMORY[0x24BE97CF8]();
}

uint64_t static ExecuteResponse.complete(next:)()
{
  return MEMORY[0x24BE97D48]();
}

uint64_t static ExecuteResponse.complete()()
{
  return MEMORY[0x24BE97D58]();
}

uint64_t NLContextUpdate.nluSystemDialogActs.setter()
{
  return MEMORY[0x24BE97DC8]();
}

uint64_t NLContextUpdate.init()()
{
  return MEMORY[0x24BE97E50]();
}

uint64_t type metadata accessor for NLContextUpdate()
{
  return MEMORY[0x24BE97E58]();
}

uint64_t ResponseFactory.init()()
{
  return MEMORY[0x24BE97F28]();
}

uint64_t type metadata accessor for ResponseFactory()
{
  return MEMORY[0x24BE97F30]();
}

uint64_t dispatch thunk of AceServiceInvoker.submitToRemote<A>(_:_:completion:)()
{
  return MEMORY[0x24BE98000]();
}

uint64_t dispatch thunk of ResponseGenerating.makeResponseOutput(patternExecutionResult:outputGenerationManifest:)()
{
  return MEMORY[0x24BE98288]();
}

uint64_t AceServiceInvokerAsync.submit<A>(_:)()
{
  return MEMORY[0x24BE98640]();
}

uint64_t static OutputPublisherFactory.makeOutputPublisherAsync()()
{
  return MEMORY[0x24BE986D0]();
}

uint64_t OutputGenerationManifest.init(dialogPhase:_:)()
{
  return MEMORY[0x24BE98808]();
}

uint64_t OutputGenerationManifest.canUseServerTTS.setter()
{
  return MEMORY[0x24BE98858]();
}

uint64_t OutputGenerationManifest.nlContextUpdate.setter()
{
  return MEMORY[0x24BE98868]();
}

uint64_t type metadata accessor for OutputGenerationManifest()
{
  return MEMORY[0x24BE988E0]();
}

uint64_t Input.parse.getter()
{
  return MEMORY[0x24BE98DC0]();
}

uint64_t type metadata accessor for Input()
{
  return MEMORY[0x24BE98DD0]();
}

uint64_t Parse.DirectInvocation.init(identifier:userData:)()
{
  return MEMORY[0x24BE98E28]();
}

uint64_t Parse.DirectInvocation.identifier.getter()
{
  return MEMORY[0x24BE98E30]();
}

uint64_t Parse.DirectInvocation.userData.getter()
{
  return MEMORY[0x24BE98E38]();
}

uint64_t type metadata accessor for Parse.DirectInvocation()
{
  return MEMORY[0x24BE98E40]();
}

uint64_t type metadata accessor for Parse()
{
  return MEMORY[0x24BE98EA8]();
}

uint64_t USOParse.userParse.getter()
{
  return MEMORY[0x24BE99040]();
}

uint64_t type metadata accessor for USOParse()
{
  return MEMORY[0x24BE99050]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoGraph()
{
  return MEMORY[0x24BE9C2B8]();
}

uint64_t Siri_Nlu_External_UserParse.userDialogActs.getter()
{
  return MEMORY[0x24BE9C3E8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserParse()
{
  return MEMORY[0x24BE9C450]();
}

uint64_t Siri_Nlu_External_SystemOffered.offeredAct.setter()
{
  return MEMORY[0x24BE9C6D0]();
}

uint64_t Siri_Nlu_External_SystemOffered.init()()
{
  return MEMORY[0x24BE9C6D8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_SystemOffered()
{
  return MEMORY[0x24BE9C6E0]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasAccepted.getter()
{
  return MEMORY[0x24BE9C720]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasRejected.getter()
{
  return MEMORY[0x24BE9C728]();
}

uint64_t Siri_Nlu_External_UserDialogAct.wantedToProceed.setter()
{
  return MEMORY[0x24BE9C7A0]();
}

uint64_t Siri_Nlu_External_UserDialogAct.init()()
{
  return MEMORY[0x24BE9C820]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserDialogAct()
{
  return MEMORY[0x24BE9C828]();
}

uint64_t Siri_Nlu_External_SystemDialogAct.offered.setter()
{
  return MEMORY[0x24BE9CD40]();
}

uint64_t Siri_Nlu_External_SystemDialogAct.init()()
{
  return MEMORY[0x24BE9CD68]();
}

uint64_t type metadata accessor for Siri_Nlu_External_SystemDialogAct()
{
  return MEMORY[0x24BE9CD70]();
}

uint64_t Siri_Nlu_External_UserWantedToProceed.reference.setter()
{
  return MEMORY[0x24BE9D0E0]();
}

uint64_t Siri_Nlu_External_UserWantedToProceed.init()()
{
  return MEMORY[0x24BE9D0E8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserWantedToProceed()
{
  return MEMORY[0x24BE9D0F0]();
}

uint64_t UsoTaskBuilder.toProtobufUsoGraph()()
{
  return MEMORY[0x24BE40E78]();
}

uint64_t type metadata accessor for UsoTaskBuilder()
{
  return MEMORY[0x24BE9FA18]();
}

uint64_t UsoTaskBuilder_stop_common_Workout.init()()
{
  return MEMORY[0x24BEA24C8]();
}

uint64_t type metadata accessor for UsoTaskBuilder_stop_common_Workout()
{
  return MEMORY[0x24BEA24D0]();
}

uint64_t UsoTaskBuilder_create_common_Workout.init()()
{
  return MEMORY[0x24BEA2958]();
}

uint64_t type metadata accessor for UsoTaskBuilder_create_common_Workout()
{
  return MEMORY[0x24BEA2960]();
}

uint64_t UsoTaskBuilder_resume_common_Workout.init()()
{
  return MEMORY[0x24BEA29A8]();
}

uint64_t type metadata accessor for UsoTaskBuilder_resume_common_Workout()
{
  return MEMORY[0x24BEA29B0]();
}

uint64_t type metadata accessor for DeviceIdiom()
{
  return MEMORY[0x24BEA89B0]();
}

uint64_t dispatch thunk of DialogAbstractMeasurement.Builder.build()()
{
  return MEMORY[0x24BE92398]();
}

uint64_t dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)()
{
  return MEMORY[0x24BE923A8]();
}

uint64_t dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)()
{
  return MEMORY[0x24BE923B0]();
}

uint64_t DialogLength.Builder.init()()
{
  return MEMORY[0x24BE92400]();
}

uint64_t type metadata accessor for DialogLength.Builder()
{
  return MEMORY[0x24BE92408]();
}

uint64_t type metadata accessor for DialogLength()
{
  return MEMORY[0x24BE92410]();
}

uint64_t dispatch thunk of DialogDuration.Builder.build()()
{
  return MEMORY[0x24BE92738]();
}

uint64_t dispatch thunk of DialogDuration.Builder.withSecs(_:)()
{
  return MEMORY[0x24BE92740]();
}

uint64_t DialogDuration.Builder.init()()
{
  return MEMORY[0x24BE92748]();
}

uint64_t type metadata accessor for DialogDuration.Builder()
{
  return MEMORY[0x24BE92750]();
}

uint64_t type metadata accessor for DialogDuration()
{
  return MEMORY[0x24BE92770]();
}

uint64_t CATWrapper.init(templateDir:options:globals:)()
{
  return MEMORY[0x24BE92860]();
}

uint64_t CATWrapper.__allocating_init(options:globals:)()
{
  return MEMORY[0x24BE92888]();
}

uint64_t CATWrapper.deinit()
{
  return MEMORY[0x24BE92898]();
}

uint64_t type metadata accessor for SpeakableString()
{
  return MEMORY[0x24BE929C8]();
}

uint64_t static CATOption.defaultMode.getter()
{
  return MEMORY[0x24BE92BF8]();
}

uint64_t type metadata accessor for CATOption()
{
  return MEMORY[0x24BE92C20]();
}

uint64_t SequenceFlow.init(with:)()
{
  return MEMORY[0x24BE40E88]();
}

uint64_t type metadata accessor for SequenceFlow()
{
  return MEMORY[0x24BE40E90]();
}

uint64_t findRemoteDevice(with:deviceResolutionService:)()
{
  return MEMORY[0x24BE40EA0]();
}

uint64_t isProbablyWorkout(from:requireWorkoutIdentifier:)()
{
  return MEMORY[0x24BE40EB8]();
}

uint64_t isRemoteDeviceReachable(remoteDevice:aceService:)()
{
  return MEMORY[0x24BE40EC0]();
}

uint64_t DeviceUnit.assistantId.getter()
{
  return MEMORY[0x24BEA90B8]();
}

uint64_t Logger.workout.unsafeMutableAddressor()
{
  return MEMORY[0x24BE40ED0]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x24BEE0270]();
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

uint64_t String.toSpeakableString.getter()
{
  return MEMORY[0x24BE92C48]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x24BEE1000]();
}

{
  return MEMORY[0x24BEE1018]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x24BEE1080]();
}

{
  return MEMORY[0x24BEE1098]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
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

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x24BEE20A8]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x24BEE23A0](seed);
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

uint64_t static DecodingError.dataCorruptedError<A>(forKey:in:debugDescription:)()
{
  return MEMORY[0x24BEE26C0]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x24BEE2BE0]();
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

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x24BEE3290](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE32D8]();
}

{
  return MEMORY[0x24BEE32E8]();
}

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
  return MEMORY[0x24BEE3358]();
}

{
  return MEMORY[0x24BEE3360]();
}

{
  return MEMORY[0x24BEE3370]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE3428]();
}

{
  return MEMORY[0x24BEE3438]();
}

{
  return MEMORY[0x24BEE3448]();
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

{
  return MEMORY[0x24BEE34B0]();
}

{
  return MEMORY[0x24BEE34C0]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return MEMORY[0x24BEE3D50]();
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

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AFWorkoutPredictionTypeGetName()
{
  return MEMORY[0x24BE090A0]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

