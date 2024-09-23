uint64_t TaskData.stepType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TaskData.taskId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TaskData.taskType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

double TaskData.version.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 128);
}

uint64_t TaskData.debugDescription.getter()
{
  _QWORD *v0;
  Swift::String v1;
  uint64_t v2;
  void *v3;
  Swift::String v4;
  Swift::String v5;
  uint64_t v6;
  void *v7;
  Swift::String v8;
  Swift::String v9;
  void *v10;
  uint64_t v11;
  Swift::String v12;

  _StringGuts.grow(_:)(55);
  v1._object = (void *)0x80000001B4F03510;
  v1._countAndFlagsBits = 0xD000000000000019;
  String.append(_:)(v1);
  v2 = v0[12];
  v3 = (void *)v0[13];
  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = v2;
  v4._object = v3;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0x79546B736174202CLL;
  v5._object = (void *)0xEC000000203A6570;
  String.append(_:)(v5);
  v6 = v0[14];
  v7 = (void *)v0[15];
  swift_bridgeObjectRetain();
  v8._countAndFlagsBits = v6;
  v8._object = v7;
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 0x795470657473202CLL;
  v9._object = (void *)0xEC000000203A6570;
  String.append(_:)(v9);
  v11 = v0[10];
  v10 = (void *)v0[11];
  swift_bridgeObjectRetain();
  v12._countAndFlagsBits = v11;
  v12._object = v10;
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  return 0;
}

__n128 TaskData.init(taskId:taskType:stepType:statusReason:activities:attribute:)@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, unint64_t a6@<X5>, unint64_t a7@<X6>, unint64_t a8@<X7>, __n128 *a9@<X8>, __n128 a10, unint64_t a11)
{
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  __n128 result;

  v17 = specialized static SiriKitMetricsUtils.formulateIntentTypeName(intentTypeName:)(a3, a4);
  v19 = v18;
  swift_bridgeObjectRelease();
  result = a10;
  *a9 = a10;
  a9[1].n128_u64[0] = a11;
  a9[1].n128_u8[8] = 0;
  a9[2].n128_u64[0] = 0;
  a9[2].n128_u64[1] = 0xE000000000000000;
  a9[3].n128_u64[0] = 0;
  a9[3].n128_u64[1] = 0xE000000000000000;
  a9[4].n128_u64[0] = a7;
  a9[4].n128_u64[1] = a8;
  a9[5].n128_u64[0] = a5;
  a9[5].n128_u64[1] = a6;
  a9[6].n128_u64[0] = a1;
  a9[6].n128_u64[1] = a2;
  a9[7].n128_u64[0] = v17;
  a9[7].n128_u64[1] = v19;
  a9[8].n128_u64[0] = 0x3FD999999999999ALL;
  return result;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance TaskData.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized TaskData.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance TaskData.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 10;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance TaskData.CodingKeys()
{
  lazy protocol witness table accessor for type TaskData.CodingKeys and conformance TaskData.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance TaskData.CodingKeys()
{
  lazy protocol witness table accessor for type TaskData.CodingKeys and conformance TaskData.CodingKeys();
  return CodingKey.debugDescription.getter();
}

unint64_t lazy protocol witness table accessor for type DefaultFlowActivity and conformance DefaultFlowActivity()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type DefaultFlowActivity and conformance DefaultFlowActivity;
  if (!lazy protocol witness table cache variable for type DefaultFlowActivity and conformance DefaultFlowActivity)
  {
    v1 = type metadata accessor for DefaultFlowActivity();
    result = MEMORY[0x1B5E44668](MEMORY[0x1E0D9AE18], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DefaultFlowActivity and conformance DefaultFlowActivity);
  }
  return result;
}

uint64_t destroy for TaskData()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TaskData(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v7;
  v8 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v8;
  v9 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v9;
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
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

uint64_t assignWithCopy for TaskData(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
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
  return a1;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  result = *(__n128 *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for TaskData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v10;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  return a1;
}

uint64_t getEnumTagSinglePayload for TaskData(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 136))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TaskData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 136) = 1;
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
    *(_BYTE *)(result + 136) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TaskData()
{
  return &type metadata for TaskData;
}

void *type metadata accessor for TaskData.CodingKeys()
{
  return &unk_1E6854FB8;
}

uint64_t specialized TaskData.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6974697669746361 && a2 == 0xEA00000000007365;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7475626972747461 && a2 == 0xE900000000000065
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x655364726143656DLL && a2 == 0xE900000000000074
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x64656D726F666572 && a2 == 0xEE00746E65746E49
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x496B736154666572 && a2 == 0xE900000000000064
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6552737574617473 && a2 == 0xEC0000006E6F7361
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6570795470657473 && a2 == 0xE800000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x64496B736174 && a2 == 0xE600000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x657079546B736174 && a2 == 0xE800000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 9;
    else
      return 10;
  }
}

uint64_t *TaskLoggingEventSink.instance.unsafeMutableAddressor()
{
  if (one-time initialization token for instance != -1)
    swift_once();
  return &static TaskLoggingEventSink.instance;
}

uint64_t TaskLoggingEventSink.receive(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v2;
  v9[5] = a1;
  v9[6] = a2;
  swift_retain();
  swift_retain();
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&async function pointer to partial apply for closure #1 in TaskLoggingEventSink.receive(_:_:), (uint64_t)v9);
  return swift_release();
}

uint64_t TaskLoggingEventSink.SiriKitEventMetricsState.__deallocating_deinit()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t protocol witness for MetricsState.taskId.getter in conformance TaskLoggingEventSink.SiriKitEventMetricsState()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 24) + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t protocol witness for MetricsState.interactionId.getter in conformance TaskLoggingEventSink.SiriKitEventMetricsState()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 16) + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t protocol witness for MetricsState.resultCandidateId.getter in conformance TaskLoggingEventSink.SiriKitEventMetricsState()
{
  return SiriKitEventContext.resultCandidateId.getter();
}

double protocol witness for MetricsState.taskStepStartTime.getter in conformance TaskLoggingEventSink.SiriKitEventMetricsState()
{
  double result;

  Date.timeIntervalSince1970.getter();
  return result;
}

uint64_t protocol witness for MetricsState.isFromClient.getter in conformance TaskLoggingEventSink.SiriKitEventMetricsState()
{
  uint64_t v0;

  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)v0 + 24) + 33);
}

uint64_t protocol witness for MetricsState.executionRequestId.getter in conformance TaskLoggingEventSink.SiriKitEventMetricsState()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 16) + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TaskLoggingEventSink.__allocating_init(loggingService:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t static TaskLoggingEventSink.instance.getter()
{
  if (one-time initialization token for instance != -1)
    swift_once();
  return swift_retain();
}

uint64_t TaskLoggingEventSink.init(loggingService:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t closure #1 in TaskLoggingEventSink.receive(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v9;
  *v9 = v6;
  v9[1] = protocol witness for FlowContextPublishing.publish(dialogEngineOutput:) in conformance AceServiceInvokerImpl;
  return TaskLoggingEventSink.receiveAsync(_:_:)(a5, a6);
}

uint64_t TaskLoggingEventSink.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t TaskLoggingEventSink.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t protocol witness for SiriKitEventSink.receive(_:_:) in conformance TaskLoggingEventSink(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  v9 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v8;
  v10[5] = a1;
  v10[6] = a2;
  swift_retain();
  swift_retain();
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&closure #1 in TaskLoggingEventSink.receive(_:_:)partial apply, (uint64_t)v10);
  return swift_release();
}

uint64_t protocol witness for SiriKitEventSink.receiveAsync(_:_:) in conformance TaskLoggingEventSink(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = protocol witness for FlowContextPublishing.publish(dialogEngineOutput:) in conformance AceServiceInvokerImpl;
  return TaskLoggingEventSink.receiveAsync(_:_:)(a1, a2);
}

uint64_t type metadata accessor for TaskLoggingEventSink()
{
  return objc_opt_self();
}

uint64_t method lookup function for TaskLoggingEventSink()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TaskLoggingEventSink.__allocating_init(loggingService:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t type metadata accessor for TaskLoggingEventSink.SiriKitEventMetricsState()
{
  return objc_opt_self();
}

uint64_t objectdestroyTm_12()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t closure #1 in TaskLoggingEventSink.receive(_:_:)partial apply()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = protocol witness for FlowContextPublishing.publish(nlContext:) in conformance AceServiceInvokerImpl;
  v5 = (_QWORD *)swift_task_alloc();
  v4[2] = v5;
  *v5 = v4;
  v5[1] = protocol witness for FlowContextPublishing.publish(dialogEngineOutput:) in conformance AceServiceInvokerImpl;
  return TaskLoggingEventSink.receiveAsync(_:_:)(v2, v3);
}

uint64_t sub_1B4EC7278()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 40))
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    result = MEMORY[0x1B5E44668](MEMORY[0x1E0DEB460], MEMORY[0x1E0DEB418]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

uint64_t *TaskLoggingService.instance.unsafeMutableAddressor()
{
  if (one-time initialization token for instance != -1)
    swift_once();
  return &static TaskLoggingService.instance;
}

BOOL FLOWSchemaFLOWStateType.isFirstTaskStep.getter(int a1)
{
  return a1 == 1;
}

BOOL FLOWSchemaFLOWStateType.isLastTaskStep.getter(unsigned int a1)
{
  _BOOL8 result;

  result = 1;
  if (a1 > 5 || ((1 << a1) & 0x34) == 0)
    return a1 == 128;
  return result;
}

BOOL FLOWSchemaFLOWStateType.isDelayedFailedStep.getter(int a1)
{
  return a1 == 4;
}

uint64_t TaskLoggingService.logAppResolutionResult(activityType:eventContext:eventTime:intentTypeName:statusReason:task:domainFlowActivity:flowMetadata:resolutionResult:)(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  void (*v25)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  __int128 v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  __CFString *v47;
  __CFString *v48;
  uint64_t v50;
  unint64_t v51;
  __CFString *v52;
  __CFString *v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  os_log_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t);
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
  int v81;
  os_log_t v82;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(uint64_t, uint64_t, uint64_t);
  void (*v86)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  char *v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  id v99;
  _QWORD *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106[3];
  uint64_t v107;
  uint64_t v108;

  v103 = a5;
  v93 = a8;
  v102 = a4;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SiriKitReliabilityCodes?);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v80 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = specialized static TaskLoggingService.getAppFrom(_:)(a10);
  if (!v18)
    v18 = specialized static TaskLoggingService.getAppFrom(_:)(a9);
  v90 = a9;
  v88 = specialized static TaskLoggingService.getAppResolutionInfo(flowMetadata:)(a9);
  v94 = v19;
  v21 = v20;
  v22 = type metadata accessor for SiriKitReliabilityCodes();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
  v89 = a6;
  v85 = v24;
  v24((uint64_t)v17, a6, v22);
  v25 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v23 + 56);
  v87 = v22;
  v86 = v25;
  v25((uint64_t)v17, 0, 1, v22);
  v92 = a1;
  v26 = ActivityType.asSELFTypeAndReason(_:)((uint64_t)v17);
  v27 = (uint64_t)v17;
  v29 = v28;
  v91 = v27;
  outlined destroy of ReferenceResolutionClientProtocol?(v27, &demangling cache variable for type metadata for SiriKitReliabilityCodes?);
  v30 = SiriKitEventContext.resultCandidateId.getter();
  if (v31)
    v32 = v30;
  else
    v32 = 13101;
  v33 = a2;
  if (v31)
    v34 = v31;
  else
    v34 = 0xE200000000000000;
  v35 = v33[10];
  v36 = v33[11];
  v100 = v33;
  v101 = a7;
  v37 = *(_QWORD *)(a7 + 16);
  v38 = *(_QWORD *)(a7 + 24);
  LOBYTE(v106[0]) = v29 & 1;
  *((_QWORD *)&v39 + 1) = v29 & 1;
  *(_QWORD *)&v39 = v26;
  v95 = v38;
  v96 = v37;
  v97 = v36;
  v98 = v35;
  v40 = v104;
  v41 = TaskLoggingService.createFlowTaskSELFClientEvent(activityType:eventTime:resultCandidateId:taskType:app:appResolutionType:attribute:domainContext:executionRequestId:parameterName:platformContext:statusReason:statusReasonDescription:taskId:)(v26, a3, v32, v34, v102, v103, v18, v21, 0, 0, 0, v35, v36, 0, 0, 0, v39 >> 32, 0, 0,
          v37,
          v38);
  swift_bridgeObjectRelease();
  v99 = v41;
  if (v41)
  {
    v84 = a3;
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v42 = type metadata accessor for Logger();
    __swift_project_value_buffer(v42, (uint64_t)static Logger.instrumentation);
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    v43 = Logger.logObject.getter();
    v44 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v43, (os_log_type_t)v44))
    {
      v81 = v44;
      v45 = swift_slowAlloc();
      v80 = swift_slowAlloc();
      v106[0] = v80;
      *(_DWORD *)v45 = 136315906;
      v82 = v43;
      if (v26 > 0xCF)
      {
        v47 = CFSTR("FLOWSTATETYPE_UNKNOWN");
        v48 = CFSTR("FLOWSTATETYPE_UNKNOWN");
      }
      else
      {
        v46 = (int)v26;
        v47 = off_1E6858558[v46];
        v48 = off_1E6858BD8[v46];
      }
      v51 = v95;
      v50 = v96;
      v52 = v47;
      v53 = v48;
      v54 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v56 = v55;

      v105 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v54, v56, v106);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v45 + 12) = 2080;
      swift_bridgeObjectRetain();
      v105 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v50, v51, v106);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v45 + 22) = 2080;
      v57 = v103;
      swift_bridgeObjectRetain();
      v105 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v102, v57, v106);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v45 + 32) = 2080;
      v58 = v100[12];
      v59 = v100[13];
      swift_bridgeObjectRetain();
      v105 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v58, v59, v106);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      v60 = v82;
      _os_log_impl(&dword_1B4BE6000, v82, (os_log_type_t)v81, "#TaskLoggingService SELF Log - logging task step: %s for taskId: %s, taskType: %s, interactionId:%s", (uint8_t *)v45, 0x2Au);
      v61 = v80;
      swift_arrayDestroy();
      MEMORY[0x1B5E44758](v61, -1, -1);
      MEMORY[0x1B5E44758](v45, -1, -1);

      v40 = v104;
    }
    else
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_release_n();
      v51 = v95;
      v50 = v96;
    }
    (*(void (**)(id))(v40 + 96))(v99);
    TaskLoggingService.emitRequestLink(executionRequestId:taskId:)(v98, v97, v50, v51);
    outlined init with copy of ReferenceResolutionClientProtocol(v40 + 16, (uint64_t)v106);
    v62 = v107;
    v63 = v108;
    __swift_project_boxed_opaque_existential_1(v106, v107);
    v64 = v89;
    v83 = v18;
    v65 = v102;
    if (v18)
    {
      swift_retain();
      v66 = App.appIdentifier.getter();
      v68 = v67;
      swift_release();
    }
    else
    {
      v66 = 0;
      v68 = 0;
    }
    v69 = SiriKitReliabilityCodes.rawValue.getter();
    v70 = *(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v63 + 8);
    v78 = v62;
    v79 = v63;
    v71 = v92;
    v72 = v84;
    v73 = v64;
    v74 = v103;
    v70(v92, v84, v65, v103, v66, v68, v98, v97, 0, 0, v69, v75, v96, v95, v78, v79);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v106);
    v76 = v91;
    v77 = v87;
    v85(v91, v73, v87);
    v86(v76, 0, 1, v77);
    TaskLoggingService.logAndDonateClassicFlowTask(activityType:eventContext:eventTime:task:app:attribute:domainFlowActivity:intent:intentTypeName:parameterName:responseId:statusDescription:statusReason:shouldDonateToCurare:appResolutionName:flowMetadata:)(v71, v100, v72, v101, v83, 0, 0, v93, 0, v65, v74, 0, 0, 0, 0, 0, 0, v76, 0,
      v88,
      v94,
      v90);
    swift_release();

    swift_bridgeObjectRelease();
    return outlined destroy of ReferenceResolutionClientProtocol?(v76, &demangling cache variable for type metadata for SiriKitReliabilityCodes?);
  }
  else
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
}

void TaskLoggingService.logTaskStepAndEntityContextTier1(activityType:eventContext:eventTime:task:app:attribute:chosenItem:disambiguationItems:domainContext:domainFlowActivity:intent:intentTypeName:parameterName:responseId:statusDescription:statusReason:)(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, NSObject *a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, char *a17, NSObject *a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  char *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  unint64_t v50;
  char *v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  os_log_type_t type;
  uint64_t v62;
  NSObject *v63;
  NSObject *log;
  uint64_t v65[2];

  v29 = a20;
  v28 = a21;
  v31 = a18;
  v30 = a19;
  v33 = a16;
  v32 = a17;
  v35 = a14;
  v34 = a15;
  v37 = a12;
  v36 = a13;
  v39 = a10;
  v38 = a11;
  if (a9 && *(_QWORD *)(a9 + 16))
  {
    v40 = TaskLoggingService.createFlowEntityContextTier1(disambiguationItems:chosenItem:)(a9, a8);
    if (v40)
    {
      v41 = v40;
      v42 = SiriKitEventContext.resultCandidateId.getter();
      v44 = 13101;
      if (v43)
        v44 = v42;
      v45 = a1;
      v46 = a3;
      v47 = a5;
      v48 = a6;
      v49 = a7;
      if (v43)
        v50 = v43;
      else
        v50 = 0xE200000000000000;
      TaskLoggingService.logSELFEntityContextTier1(entityContextTier1:resultCandidateId:executionRequestId:taskId:)((uint64_t)v41, v44, v50, a2[10], a2[11], *(_QWORD *)(a4 + 16), *(_QWORD *)(a4 + 24));
      a7 = v49;
      a6 = v48;
      a5 = v47;
      a3 = v46;
      a1 = v45;
      swift_bridgeObjectRelease();
      v51 = v41;
      v52 = (void *)specialized TaskLoggingService.createFlowPlatformContext(entityContextTier1:)(v41);

    }
    else
    {
      if (one-time initialization token for instrumentation != -1)
        swift_once();
      v53 = type metadata accessor for Logger();
      __swift_project_value_buffer(v53, (uint64_t)static Logger.instrumentation);
      swift_retain();
      swift_retain();
      v54 = Logger.logObject.getter();
      v55 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v54, v55))
      {
        log = v54;
        v56 = swift_slowAlloc();
        v62 = swift_slowAlloc();
        v65[0] = v62;
        *(_DWORD *)v56 = 136315394;
        v63 = a7;
        type = v55;
        v58 = *(_QWORD *)(a4 + 16);
        v57 = *(_QWORD *)(a4 + 24);
        swift_bridgeObjectRetain();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v58, v57, v65);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v56 + 12) = 2080;
        v59 = a2[10];
        v60 = a2[11];
        swift_bridgeObjectRetain();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v59, v60, v65);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        a7 = v63;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1B4BE6000, log, type, "#TaskLoggingService SELF Log - not logging EntityContextTier1 event for taskId: %s, executionRequestId: %s", (uint8_t *)v56, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1B5E44758](v62, -1, -1);
        MEMORY[0x1B5E44758](v56, -1, -1);

      }
      else
      {

        swift_release();
        swift_release();
      }
      v52 = 0;
    }
    v28 = a21;
    v39 = a10;
    v30 = a19;
    v29 = a20;
    v32 = a17;
    v31 = a18;
    v34 = a15;
    v33 = a16;
    v36 = a13;
    v35 = a14;
    v38 = a11;
    v37 = a12;
  }
  else
  {
    v52 = 0;
  }
  TaskLoggingService.logTaskStep(activityType:eventContext:eventTime:task:app:attribute:domainContext:domainFlowActivity:intent:intentTypeName:parameterName:responseId:statusDescription:statusReason:platformContext:)(a1, a2, a3, a4, a5, a6, a7, v39, v38, v37, v36, v35, v34, v33, v32, v31, v30, v29, v28,
    v52);

}

__n128 TaskLoggingService.logSELFFlowTask(activityType:eventContext:eventTime:task:taskType:app:attribute:domainContext:parameterName:responseId:statusReasonDescription:statusReason:)(signed int a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unint64_t a17)
{
  __n128 result;

  specialized TaskLoggingService.logSELFFlowTask(activityType:eventContext:eventTime:task:taskType:app:attribute:domainContext:parameterName:responseId:statusReasonDescription:statusReason:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a15, a16, a17 | ((HIDWORD(a17) & 1) << 32));
  return result;
}

void TaskLoggingService.logDomainPerfContext(eventContext:eventTime:task:taskType:domainPerfContext:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, id a6)
{
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  os_log_type_t type;
  void *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v12 = objc_msgSend(a6, sel_flowDomainExecutionContext);

  if (!v12)
  {
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v26 = type metadata accessor for Logger();
    __swift_project_value_buffer(v26, (uint64_t)static Logger.instrumentation);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    swift_retain_n();
    v27 = Logger.logObject.getter();
    v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = swift_slowAlloc();
      v30 = swift_slowAlloc();
      v46 = v30;
      *(_DWORD *)v29 = 136315650;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a4, a5, &v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v29 + 12) = 2080;
      v31 = *(_QWORD *)(a3 + 16);
      v32 = *(_QWORD *)(a3 + 24);
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v32, &v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 22) = 2080;
      v33 = a1[12];
      v34 = a1[13];
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v33, v34, &v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B4BE6000, v27, v28, "Ignoring domainPerfContext is not set for taskType: %s, taskId: %s, interactionId:%s", (uint8_t *)v29, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1B5E44758](v30, -1, -1);
      v35 = v29;
LABEL_18:
      MEMORY[0x1B5E44758](v35, -1, -1);

      return;
    }

    swift_release_n();
LABEL_23:
    swift_release_n();
    swift_bridgeObjectRelease_n();
    return;
  }
  v45 = a2;
  v13 = SiriKitEventContext.resultCandidateId.getter();
  if (v14)
  {
    v15 = v14;
  }
  else
  {
    v13 = 13101;
    v15 = 0xE200000000000000;
  }
  v17 = *(_QWORD *)(a3 + 16);
  v16 = *(_QWORD *)(a3 + 24);
  v43 = a1[11];
  v44 = a1[10];
  v18 = TaskLoggingService.constructMetaData(resultCandidateId:executionRequestId:taskId:)(v13, v15, v44, v43, v17, v16);
  swift_bridgeObjectRelease();
  if (!v18)
  {
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v36 = type metadata accessor for Logger();
    __swift_project_value_buffer(v36, (uint64_t)static Logger.instrumentation);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    v27 = Logger.logObject.getter();
    v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v37))
    {
      v38 = swift_slowAlloc();
      v39 = swift_slowAlloc();
      v46 = v39;
      *(_DWORD *)v38 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a4, a5, &v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v38 + 12) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v16, &v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B4BE6000, v27, v37, "#TaskLoggingService SELF Log - unable to construct metaData, not logging DomainPerfContext data for taskType: %s with taskId: %s", (uint8_t *)v38, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1B5E44758](v39, -1, -1);
      v35 = v38;
      goto LABEL_18;
    }

    goto LABEL_23;
  }
  v42 = v18;
  objc_msgSend(a6, sel_setEventMetadata_, v18);
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v19 = type metadata accessor for Logger();
  __swift_project_value_buffer(v19, (uint64_t)static Logger.instrumentation);
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  swift_retain_n();
  v20 = Logger.logObject.getter();
  v21 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v20, v21))
  {
    type = v21;
    v22 = swift_slowAlloc();
    v40 = swift_slowAlloc();
    v46 = v40;
    *(_DWORD *)v22 = 136315650;
    v23 = v16;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a4, a5, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 12) = 2080;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v16, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 22) = 2080;
    v24 = a1[12];
    v25 = a1[13];
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    v16 = v23;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B4BE6000, v20, type, "#TaskLoggingService SELF Log - logging DomainPerfContext data for taskType: %s, with taskId: %s, interactionId:%s", (uint8_t *)v22, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1B5E44758](v40, -1, -1);
    MEMORY[0x1B5E44758](v22, -1, -1);

  }
  else
  {

    swift_release_n();
    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
  objc_msgSend(objc_msgSend((id)objc_opt_self(), sel_sharedStream), sel_emitMessage_timestamp_, a6, v45);
  swift_unknownObjectRelease();
  TaskLoggingService.emitRequestLink(executionRequestId:taskId:)(v44, v43, v17, v16);

}

void TaskLoggingService.logDomainTier1Data(eventContext:task:taskType:tierOneFlowEvent:)(_QWORD *a1, uint64_t a2, uint64_t a3, unint64_t a4, id a5)
{
  uint64_t v5;
  uint64_t v6;
  id v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  os_log_type_t type;
  uint64_t v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v6 = v5;
  v12 = objc_msgSend(a5, sel_flowStep);

  if (v12)
  {
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v13 = type metadata accessor for Logger();
    __swift_project_value_buffer(v13, (uint64_t)static Logger.instrumentation);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    swift_retain_n();
    v14 = Logger.logObject.getter();
    v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = swift_slowAlloc();
      v17 = swift_slowAlloc();
      v47 = v17;
      *(_DWORD *)v16 = 136315650;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a3, a4, &v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 12) = 2080;
      v18 = *(_QWORD *)(a2 + 16);
      v19 = *(_QWORD *)(a2 + 24);
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, v19, &v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 22) = 2080;
      v20 = a1[12];
      v21 = a1[13];
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, &v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B4BE6000, v14, v15, "Ignoring tierOneFlowEvent with illegally set flowStep for taskType: %s, taskId: %s, interactionId:%s", (uint8_t *)v16, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1B5E44758](v17, -1, -1);
      v22 = v16;
LABEL_6:
      MEMORY[0x1B5E44758](v22, -1, -1);

      return;
    }

    swift_release_n();
LABEL_16:
    swift_release_n();
    swift_bridgeObjectRelease_n();
    return;
  }
  v23 = SiriKitEventContext.resultCandidateId.getter();
  if (v24)
  {
    v25 = v24;
  }
  else
  {
    v23 = 13101;
    v25 = 0xE200000000000000;
  }
  v26 = *(_QWORD *)(a2 + 24);
  v45 = a1[11];
  v46 = a1[10];
  v27 = *(_QWORD *)(a2 + 16);
  v28 = TaskLoggingService.constructMetaData(resultCandidateId:executionRequestId:taskId:)(v23, v25, v46, v45, v27, v26);
  swift_bridgeObjectRelease();
  if (!v28)
  {
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v36 = type metadata accessor for Logger();
    __swift_project_value_buffer(v36, (uint64_t)static Logger.instrumentation);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    v14 = Logger.logObject.getter();
    v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v37))
    {
      v38 = v27;
      v39 = swift_slowAlloc();
      v40 = swift_slowAlloc();
      v47 = v40;
      *(_DWORD *)v39 = 136315394;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a3, a4, &v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v39 + 12) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v38, v26, &v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B4BE6000, v14, v37, "#TaskLoggingService SELF Log - unable to construct metaData, not logging tier1 data for taskType: %s with taskId: %s", (uint8_t *)v39, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1B5E44758](v40, -1, -1);
      v22 = v39;
      goto LABEL_6;
    }

    goto LABEL_16;
  }
  v43 = v28;
  objc_msgSend(a5, sel_setEventMetadata_, v28);
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v29 = type metadata accessor for Logger();
  __swift_project_value_buffer(v29, (uint64_t)static Logger.instrumentation);
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  swift_retain_n();
  v30 = Logger.logObject.getter();
  v31 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v30, v31))
  {
    v44 = v26;
    v32 = swift_slowAlloc();
    v42 = swift_slowAlloc();
    v47 = v42;
    *(_DWORD *)v32 = 136315650;
    type = v31;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a3, a4, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v32 + 12) = 2080;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v27, v44, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 22) = 2080;
    v33 = a1[12];
    v34 = a1[13];
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v33, v34, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B4BE6000, v30, type, "#TaskLoggingService SELF Log - logging tier1 data for taskType: %s, with taskId: %s, interactionId:%s", (uint8_t *)v32, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1B5E44758](v42, -1, -1);
    v35 = v32;
    v26 = v44;
    MEMORY[0x1B5E44758](v35, -1, -1);

  }
  else
  {

    swift_release_n();
    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(id))(v6 + 96))(a5);
  TaskLoggingService.emitRequestLink(executionRequestId:taskId:)(v46, v45, v27, v26);

}

uint64_t TaskLoggingService.logTaskConfiguration(eventContext:eventTime:task:taskConfiguration:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v9;
  uint64_t v10;

  v9 = v4[10];
  v10 = v4[11];
  __swift_project_boxed_opaque_existential_1(v4 + 7, v9);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v10 + 16))(a1, a2, a4, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v9, v10);
}

void TaskLoggingService.logLocationAccessPrompt(eventContext:task:promptContext:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  unint64_t v26;
  NSObject *oslog;
  uint64_t v28;

  v4 = v3;
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D99638]), sel_init);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, sel_setLocationAccessPermissionPromptContext_, a3);
    v10 = SiriKitEventContext.resultCandidateId.getter();
    if (v11)
    {
      v12 = v11;
    }
    else
    {
      v10 = 13101;
      v12 = 0xE200000000000000;
    }
    v13 = TaskLoggingService.constructMetaData(resultCandidateId:executionRequestId:taskId:)(v10, v12, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_setEventMetadata_, v13);

    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Logger.instrumentation);
    v15 = a3;
    v16 = Logger.logObject.getter();
    v17 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v28 = v19;
      *(_DWORD *)v18 = 136315138;
      v20 = objc_msgSend(v15, sel_formattedJsonBody);
      if (v20)
      {
        v21 = v20;
        static String._unconditionallyBridgeFromObjectiveC(_:)();

      }
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for String?);
      v25 = String.init<A>(describing:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v25, v26, &v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B4BE6000, v16, v17, "#TaskLoggingService SELF Log - logging locationAccessPrompt; promptContext=%s",
        v18,
        0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E44758](v19, -1, -1);
      MEMORY[0x1B5E44758](v18, -1, -1);

    }
    else
    {

    }
    (*(void (**)(void *))(v4 + 96))(v9);

  }
  else
  {
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v22 = type metadata accessor for Logger();
    __swift_project_value_buffer(v22, (uint64_t)static Logger.instrumentation);
    oslog = Logger.logObject.getter();
    v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1B4BE6000, oslog, v23, "#TaskLoggingService SELF Log - locationAccessPrompt NOT logged; missing schema event",
        v24,
        2u);
      MEMORY[0x1B5E44758](v24, -1, -1);
    }

  }
}

uint64_t (*default argument 2 of TaskLoggingService.init(biomeDonator:curareDonator:selfEmitter:tier1LinkIdSupplier:derivedIdentifierSupplier:appInformationSupplier:sensitivityManager:featureChecker:)())(uint64_t a1)
{
  return closure #1 in default argument 5 of ConversationService.init(conversationHandlerLocator:referenceResolutionClient:useStubCamBridge:useNoopEventSender:doWarmup:selfEmitter:serverFallbackDisablingUtils:);
}

id (*default argument 3 of TaskLoggingService.init(biomeDonator:curareDonator:selfEmitter:tier1LinkIdSupplier:derivedIdentifierSupplier:appInformationSupplier:sensitivityManager:featureChecker:)())()
{
  return closure #1 in default argument 3 of TaskLoggingService.init(biomeDonator:curareDonator:selfEmitter:tier1LinkIdSupplier:derivedIdentifierSupplier:appInformationSupplier:sensitivityManager:featureChecker:);
}

uint64_t (*default argument 4 of TaskLoggingService.init(biomeDonator:curareDonator:selfEmitter:tier1LinkIdSupplier:derivedIdentifierSupplier:appInformationSupplier:sensitivityManager:featureChecker:)())@<X0>(uint64_t a1@<X8>)
{
  return closure #1 in default argument 4 of TaskLoggingService.init(biomeDonator:curareDonator:selfEmitter:tier1LinkIdSupplier:derivedIdentifierSupplier:appInformationSupplier:sensitivityManager:featureChecker:);
}

uint64_t (*default argument 5 of TaskLoggingService.init(biomeDonator:curareDonator:selfEmitter:tier1LinkIdSupplier:derivedIdentifierSupplier:appInformationSupplier:sensitivityManager:featureChecker:)())@<X0>(uint64_t *a1@<X8>)
{
  return closure #1 in default argument 5 of TaskLoggingService.init(biomeDonator:curareDonator:selfEmitter:tier1LinkIdSupplier:derivedIdentifierSupplier:appInformationSupplier:sensitivityManager:featureChecker:);
}

uint64_t TaskLoggingService.__allocating_init(biomeDonator:curareDonator:selfEmitter:tier1LinkIdSupplier:derivedIdentifierSupplier:appInformationSupplier:sensitivityManager:featureChecker:)(__int128 *a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v17 = *(_QWORD *)(a11 + 24);
  v18 = *(_QWORD *)(a11 + 32);
  v19 = __swift_mutable_project_boxed_opaque_existential_1(a11, v17);
  v20 = specialized TaskLoggingService.__allocating_init(biomeDonator:curareDonator:selfEmitter:tier1LinkIdSupplier:derivedIdentifierSupplier:appInformationSupplier:sensitivityManager:featureChecker:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, v19, v11, v17, v18);
  __swift_destroy_boxed_opaque_existential_1(a11);
  return v20;
}

uint64_t static TaskLoggingService.instance.getter()
{
  if (one-time initialization token for instance != -1)
    swift_once();
  return swift_retain();
}

id closure #1 in default argument 3 of TaskLoggingService.init(biomeDonator:curareDonator:selfEmitter:tier1LinkIdSupplier:derivedIdentifierSupplier:appInformationSupplier:sensitivityManager:featureChecker:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  Class isa;
  id v6;
  uint64_t v8;

  v0 = type metadata accessor for UUID();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  UUID.init()();
  v4 = objc_allocWithZone(MEMORY[0x1E0D9A4F8]);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  v6 = objc_msgSend(v4, sel_initWithNSUUID_, isa);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v6;
}

uint64_t closure #1 in default argument 4 of TaskLoggingService.init(biomeDonator:curareDonator:selfEmitter:tier1LinkIdSupplier:derivedIdentifierSupplier:appInformationSupplier:sensitivityManager:featureChecker:)@<X0>(uint64_t a1@<X8>)
{
  void *v2;
  Class isa;
  id v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)objc_opt_self();
  isa = UUID._bridgeToObjectiveC()().super.isa;
  v4 = objc_msgSend(v2, sel_derivedIdentifierForComponentName_fromSourceIdentifier_, 3, isa);

  if (v4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    v5 = type metadata accessor for UUID();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 0;
  }
  else
  {
    v5 = type metadata accessor for UUID();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

uint64_t closure #1 in default argument 5 of TaskLoggingService.init(biomeDonator:curareDonator:selfEmitter:tier1LinkIdSupplier:derivedIdentifierSupplier:appInformationSupplier:sensitivityManager:featureChecker:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = type metadata accessor for AppInformationResolver();
  swift_allocObject();
  swift_retain();
  result = AppInformationResolver.init(app:)();
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for AppInformationResolver;
  *a1 = result;
  return result;
}

uint64_t TaskLoggingService.init(biomeDonator:curareDonator:selfEmitter:tier1LinkIdSupplier:derivedIdentifierSupplier:appInformationSupplier:sensitivityManager:featureChecker:)(__int128 *a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v27 = a7;
  v28 = a8;
  v25 = a5;
  v26 = a6;
  v24 = a9;
  v16 = *(_QWORD *)(a11 + 24);
  v17 = *(_QWORD *)(a11 + 32);
  v18 = __swift_mutable_project_boxed_opaque_existential_1(a11, v16);
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v21 + 16))(v20);
  v22 = specialized TaskLoggingService.init(biomeDonator:curareDonator:selfEmitter:tier1LinkIdSupplier:derivedIdentifierSupplier:appInformationSupplier:sensitivityManager:featureChecker:)(a1, a2, a3, a4, v25, v26, v27, v28, v24, a10, (uint64_t)v20, v11, v16, v17);
  __swift_destroy_boxed_opaque_existential_1(a11);
  return v22;
}

char *TaskLoggingService.createFlowEntityContextTier1(disambiguationItems:chosenItem:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  char *v8;
  Class isa;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  void *v25;
  _BYTE v26[24];
  uint64_t v27;
  unint64_t v28;

  v2 = *(char **)(a1 + 16);
  if (v2)
  {
    v28 = MEMORY[0x1E0DEE9D8];
    v3 = a1 + 32;
    swift_bridgeObjectRetain();
    do
    {
      outlined init with copy of Any(v3, (uint64_t)v26);
      type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for INPerson);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D99660]), sel_init);
        if (v4)
        {
          v5 = v4;
          v6 = objc_msgSend(v25, sel_contactIdentifier);
          objc_msgSend(v5, sel_setEntityId_, v6);

          v7 = v5;
          MEMORY[0x1B5E43498]();
          if (*(_QWORD *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();

        }
      }
      v3 += 32;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
    if (v28 >> 62)
    {
      swift_bridgeObjectRetain();
      v20 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v20)
        goto LABEL_12;
    }
    else if (*(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_12:
      v8 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D99658]), sel_init);
      if (v8)
      {
        v2 = v8;
        type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for FLOWSchemaFLOWEntityTier1);
        isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        objc_msgSend(v2, sel_setEntitiesPresenteds_, isa);

        outlined init with copy of ReferenceResolutionClientProtocol?(a2, (uint64_t)v26, (uint64_t *)&demangling cache variable for type metadata for Any?);
        if (v27)
        {
          if ((swift_dynamicCast() & 1) != 0)
          {
            v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D99660]), sel_init);
            v11 = v23;
            if (v10)
            {
              v12 = v10;
              v13 = objc_msgSend(v25, sel_contactIdentifier);
              objc_msgSend(v12, sel_setEntityId_, v13);

              objc_msgSend(v2, sel_setEntitySelected_, v12);
            }
            else
            {

            }
            goto LABEL_23;
          }
        }
        else
        {
          outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)v26, (uint64_t *)&demangling cache variable for type metadata for Any?);
        }
        v11 = v23;
LABEL_23:
        v19 = (void *)(*(uint64_t (**)(void))(v11 + 112))();
        objc_msgSend(v2, sel_setLinkId_, v19);

        return v2;
      }
      swift_bridgeObjectRelease();
      if (one-time initialization token for instrumentation != -1)
        swift_once();
      v14 = type metadata accessor for Logger();
      __swift_project_value_buffer(v14, (uint64_t)static Logger.instrumentation);
      v15 = Logger.logObject.getter();
      v16 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v15, v16))
      {
LABEL_31:

        return 0;
      }
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      v18 = "#TaskLoggingService cannot initiate entityContextTier1";
LABEL_30:
      _os_log_impl(&dword_1B4BE6000, v15, v16, v18, v17, 2u);
      MEMORY[0x1B5E44758](v17, -1, -1);
      goto LABEL_31;
    }
    swift_bridgeObjectRelease();
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v21 = type metadata accessor for Logger();
    __swift_project_value_buffer(v21, (uint64_t)static Logger.instrumentation);
    v15 = Logger.logObject.getter();
    v16 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v15, v16))
      goto LABEL_31;
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    v18 = "#TaskLoggingService cannot initiate entityPresented or disambiguationItem is not INPerson";
    goto LABEL_30;
  }
  return v2;
}

void TaskLoggingService.logSELFEntityContextTier1(entityContextTier1:resultCandidateId:executionRequestId:taskId:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;

  v8 = v7;
  v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D99638]), sel_init);
  if (v37)
  {
    v16 = TaskLoggingService.constructMetaData(resultCandidateId:executionRequestId:taskId:)(a2, a3, a4, a5, a6, a7);
    if (v16)
    {
      v17 = v16;
      objc_msgSend(v37, sel_setFlowEntityContextTier1_, a1);
      objc_msgSend(v37, sel_setEventMetadata_, v17);
      if (one-time initialization token for instrumentation != -1)
        swift_once();
      v18 = type metadata accessor for Logger();
      __swift_project_value_buffer(v18, (uint64_t)static Logger.instrumentation);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v19 = Logger.logObject.getter();
      v20 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v19, v20))
      {
        v34 = a4;
        v21 = swift_slowAlloc();
        v33 = swift_slowAlloc();
        v38 = v33;
        *(_DWORD *)v21 = 136315650;
        swift_bridgeObjectRetain();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a2, a3, &v38);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v21 + 12) = 2080;
        swift_bridgeObjectRetain();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a6, a7, &v38);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v21 + 22) = 2080;
        swift_bridgeObjectRetain();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v34, a5, &v38);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1B4BE6000, v19, v20, "#TaskLoggingService SELF Log - logging entity for resultCandidateId: %s, taskId: %s, executionRequestId: %s", (uint8_t *)v21, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x1B5E44758](v33, -1, -1);
        v22 = v21;
        a4 = v34;
        MEMORY[0x1B5E44758](v22, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(id))(v8 + 96))(v37);
      TaskLoggingService.emitRequestLink(executionRequestId:taskId:)(a4, a5, a6, a7);

    }
    else
    {
      if (one-time initialization token for instrumentation != -1)
        swift_once();
      v28 = type metadata accessor for Logger();
      __swift_project_value_buffer(v28, (uint64_t)static Logger.instrumentation);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v29 = Logger.logObject.getter();
      v30 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = swift_slowAlloc();
        v36 = a6;
        v32 = swift_slowAlloc();
        v38 = v32;
        *(_DWORD *)v31 = 136315650;
        swift_bridgeObjectRetain();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a2, a3, &v38);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v31 + 12) = 2080;
        swift_bridgeObjectRetain();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v36, a7, &v38);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v31 + 22) = 2080;
        swift_bridgeObjectRetain();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a4, a5, &v38);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1B4BE6000, v29, v30, "#TaskLoggingService SELF Log - unable to instantiate SELF schema, not logging Task step for resultCandidateId: %s, taskId: %s, executionRequestId: %s", (uint8_t *)v31, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x1B5E44758](v32, -1, -1);
        MEMORY[0x1B5E44758](v31, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();

      }
    }
  }
  else
  {
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v23 = type metadata accessor for Logger();
    __swift_project_value_buffer(v23, (uint64_t)static Logger.instrumentation);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v24 = Logger.logObject.getter();
    v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = swift_slowAlloc();
      v35 = a6;
      v27 = swift_slowAlloc();
      v38 = v27;
      *(_DWORD *)v26 = 136315650;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a2, a3, &v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v26 + 12) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v35, a7, &v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v26 + 22) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a4, a5, &v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B4BE6000, v24, v25, "#TaskLoggingService SELF Log - unable to instantiate SELF schema, not logging Task step for resultCandidateId: %s, taskId: %s, executionRequestId: %s", (uint8_t *)v26, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1B5E44758](v27, -1, -1);
      MEMORY[0x1B5E44758](v26, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t static TaskLoggingService.createTaskContentString(taskType:stepType:statusReason:activities:attribute:taskId:)(uint64_t a1, unint64_t a2, char *a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, NSObject *a8, uint64_t a9, unint64_t a10)
{
  return specialized static TaskLoggingService.createTaskContentString(taskType:stepType:statusReason:activities:attribute:taskId:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

void TaskLoggingService.logViaSAMetrics(aceServiceInvoker:eventInformation:timings:originalCommandId:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v6;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;
  Class isa;
  void *v19;
  void *v20;
  Class v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  _QWORD *v27;
  id v28;
  NSObject *oslog;

  v6 = *(void **)(v5 + 160);
  if (!v6)
  {
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Logger.instrumentation);
    oslog = Logger.logObject.getter();
    v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1B4BE6000, oslog, v15, "#TaskLoggingService#MTEOptOut skipping sending metrics command because unable to initialize sensitivityManager", v16, 2u);
      MEMORY[0x1B5E44758](v16, -1, -1);
    }
    goto LABEL_12;
  }
  oslog = v6;
  if ((-[NSObject isOptedOutOfMTE](oslog, sel_isOptedOutOfMTE) & 1) != 0)
  {
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v10 = type metadata accessor for Logger();
    __swift_project_value_buffer(v10, (uint64_t)static Logger.instrumentation);
    v11 = Logger.logObject.getter();
    v12 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1B4BE6000, v11, v12, "#TaskLoggingService#MTEOptOut skipping sending metrics command because device is opted out of MTE", v13, 2u);
      MEMORY[0x1B5E44758](v13, -1, -1);
    }

LABEL_12:
    return;
  }
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D882C8]), sel_init);
  type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v17, sel_setTimings_, isa);

  v19 = (void *)MEMORY[0x1B5E432E8](0xD000000000000022, 0x80000001B4F04790);
  objc_msgSend(v17, sel_setCategory_, v19);

  v20 = (void *)MEMORY[0x1B5E432E8](a4, a5);
  objc_msgSend(v17, sel_setOriginalCommandId_, v20);

  v21 = Dictionary._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v17, sel_setEventInformation_, v21);

  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v22 = type metadata accessor for Logger();
  __swift_project_value_buffer(v22, (uint64_t)static Logger.instrumentation);
  v23 = v17;
  v24 = Logger.logObject.getter();
  v25 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    v27 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v26 = 138412290;
    v28 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v27 = v23;

    _os_log_impl(&dword_1B4BE6000, v24, v25, "#TaskLoggingService sending: %@", v26, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x1B5E44758](v27, -1, -1);
    MEMORY[0x1B5E44758](v26, -1, -1);

  }
  else
  {

  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of AceServiceInvokerAsync.submitAndForget(_:setRefId:)();

}

uint64_t TaskLoggingService.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1(v0 + 168);
  return v0;
}

uint64_t TaskLoggingService.__deallocating_deinit()
{
  TaskLoggingService.deinit();
  return swift_deallocClassInstance();
}

uint64_t App.versionOnCurrentDevice.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v7;
  id v8;
  void *v9;

  v0 = App.appIdentifier.getter();
  v2 = v1;
  if (v1)
  {
    v3 = v0;
    v4 = objc_allocWithZone(MEMORY[0x1E0CA5870]);
    v5 = @nonobjc LSApplicationRecord.init(bundleIdentifier:allowPlaceholder:)(v3, v2, 0);
    v7 = v5;
    if (v5)
    {
      v8 = objc_msgSend(v5, sel_bundleIdentifier);
      if (v8)
      {
        v9 = v8;
        v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();

        return v2;
      }

    }
    return 0;
  }
  return v2;
}

id @nonobjc LSApplicationRecord.init(bundleIdentifier:allowPlaceholder:)(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1B5E432E8]();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v6;
}

uint64_t specialized TaskLoggingService.init(biomeDonator:curareDonator:selfEmitter:tier1LinkIdSupplier:derivedIdentifierSupplier:appInformationSupplier:sensitivityManager:featureChecker:)(__int128 *a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t *boxed_opaque_existential_1;

  *(_QWORD *)(a12 + 192) = a13;
  *(_QWORD *)(a12 + 200) = a14;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(a12 + 168));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a13 - 8) + 32))(boxed_opaque_existential_1, a11, a13);
  outlined init with take of ReferenceResolutionClientProtocol(a1, a12 + 16);
  outlined init with take of ReferenceResolutionClientProtocol(a2, a12 + 56);
  *(_QWORD *)(a12 + 96) = a3;
  *(_QWORD *)(a12 + 104) = a4;
  *(_QWORD *)(a12 + 112) = a5;
  *(_QWORD *)(a12 + 120) = a6;
  *(_QWORD *)(a12 + 128) = a7;
  *(_QWORD *)(a12 + 136) = a8;
  *(_OWORD *)(a12 + 144) = a9;
  *(_QWORD *)(a12 + 160) = a10;
  return a12;
}

void specialized TaskLoggingService.updateFlowTaskState(aceServiceInvoker:taskName:interactionId:taskId:)(_QWORD *a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v14 = type metadata accessor for NLContextUpdate();
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a5)
  {
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v27 = type metadata accessor for Logger();
    __swift_project_value_buffer(v27, (uint64_t)static Logger.instrumentation);
    swift_bridgeObjectRetain_n();
    v28 = Logger.logObject.getter();
    v29 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v42 = v31;
      *(_DWORD *)v30 = 136315138;
      swift_bridgeObjectRetain();
      v41 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a2, a3, &v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      v32 = "#TaskLoggingService invalid interactionId, failed to update FlowTaskState from Client for taskName: %s";
LABEL_15:
      _os_log_impl(&dword_1B4BE6000, v28, v29, v32, v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E44758](v31, -1, -1);
      MEMORY[0x1B5E44758](v30, -1, -1);

      return;
    }
LABEL_16:

    swift_bridgeObjectRelease_n();
    return;
  }
  if (!a7)
  {
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v33 = type metadata accessor for Logger();
    __swift_project_value_buffer(v33, (uint64_t)static Logger.instrumentation);
    swift_bridgeObjectRetain_n();
    v28 = Logger.logObject.getter();
    v29 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v42 = v31;
      *(_DWORD *)v30 = 136315138;
      swift_bridgeObjectRetain();
      v41 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a2, a3, &v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      v32 = "#TaskLoggingService invalid taskId, failed to update FlowTaskState from Client for taskName: %s";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  v40 = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  NLContextUpdate.init()();
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D88188]), sel_init);
  v37 = a6;
  v19 = (void *)MEMORY[0x1B5E432E8](a6, a7);
  objc_msgSend(v18, sel_setTaskId_, v19);

  v38 = a4;
  v20 = (void *)MEMORY[0x1B5E432E8](a4, a5);
  objc_msgSend(v18, sel_setInteractionId_, v20);

  v21 = (void *)MEMORY[0x1B5E432E8](a2, a3);
  objc_msgSend(v18, sel_setIntentTypeName_, v21);

  objc_msgSend(v18, sel_setMetricsStateOrigin_, *MEMORY[0x1E0D88D18]);
  v39 = v18;
  NLContextUpdate.siriKitMetrics.setter();
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v22 = type metadata accessor for Logger();
  __swift_project_value_buffer(v22, (uint64_t)static Logger.instrumentation);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v23 = Logger.logObject.getter();
  v24 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = swift_slowAlloc();
    v35 = swift_slowAlloc();
    v42 = v35;
    *(_DWORD *)v25 = 136315650;
    v36 = a1;
    swift_bridgeObjectRetain();
    v41 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a2, a3, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v25 + 12) = 2080;
    swift_bridgeObjectRetain();
    v41 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v37, a7, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v25 + 22) = 2080;
    swift_bridgeObjectRetain();
    v41 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v38, a5, &v42);
    a1 = v36;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B4BE6000, v23, v24, "#TaskLoggingService update FlowTaskState from Client with taskName: %s taskId: %s interactionId: %s", (uint8_t *)v25, 0x20u);
    v26 = v35;
    swift_arrayDestroy();
    MEMORY[0x1B5E44758](v26, -1, -1);
    MEMORY[0x1B5E44758](v25, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v34 = (void *)NLContextUpdate.toAceContextUpdate()();
  AceServiceInvokerAsync.submitAndForget(_:)();

  (*(void (**)(char *, uint64_t))(v40 + 8))(v17, v14);
}

uint64_t specialized TaskLoggingService.resetFlowTaskState(aceServiceInvoker:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  void *v10;
  uint64_t v12;

  v2 = type metadata accessor for NLContextUpdate();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  NLContextUpdate.init()();
  NLContextUpdate.shouldResetFlowTaskState.setter();
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Logger.instrumentation);
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1B4BE6000, v7, v8, "#TaskLoggingService signalling server to reset FlowTaskState", v9, 2u);
    MEMORY[0x1B5E44758](v9, -1, -1);
  }

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v10 = (void *)NLContextUpdate.toAceContextUpdate()();
  AceServiceInvokerAsync.submitAndForget(_:)();

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t specialized static TaskLoggingService.getAppFrom(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  NSObject *v25;
  int v26;
  _BOOL4 v27;
  _DWORD *v28;
  uint8_t *v29;
  int v30;
  void (*v31)(char *, uint64_t);
  int v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  void (*v43)(char *, char *, uint64_t);
  uint64_t v44;
  uint64_t v45;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AppResolutionResult?);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for AppResolutionResult();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (uint64_t *)((char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = MEMORY[0x1E0C80A78](v7);
  v12 = (char *)&v39 - v11;
  v13 = MEMORY[0x1E0C80A78](v10);
  v15 = (char *)&v39 - v14;
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v39 - v16;
  outlined init with copy of ReferenceResolutionClientProtocol?(a1, (uint64_t)v4, &demangling cache variable for type metadata for AppResolutionResult?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v17, v4, v5);
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v23 = type metadata accessor for Logger();
    __swift_project_value_buffer(v23, (uint64_t)static Logger.instrumentation);
    v24 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
    v24(v15, v17, v5);
    v25 = Logger.logObject.getter();
    v26 = static os_log_type_t.debug.getter();
    v27 = os_log_type_enabled(v25, (os_log_type_t)v26);
    v28 = (_DWORD *)MEMORY[0x1E0D979D8];
    if (!v27)
    {
      v31 = *(void (**)(char *, uint64_t))(v6 + 8);
      v31(v15, v5);

      v32 = *MEMORY[0x1E0D979C0];
      goto LABEL_17;
    }
    v41 = v26;
    v29 = (uint8_t *)swift_slowAlloc();
    v40 = swift_slowAlloc();
    v45 = v40;
    *(_DWORD *)v29 = 136315138;
    v24(v12, v15, v5);
    v30 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v12, v5);
    v42 = *MEMORY[0x1E0D979C0];
    v43 = v24;
    if (v30 == v42 || v30 == *v28)
    {
      (*(void (**)(char *, uint64_t))(v6 + 96))(v12, v5);
      v33 = App.appIdentifier.getter();
      v35 = v34;
      swift_release();
      if (v35)
      {
LABEL_16:
        v44 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v33, v35, &v45);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v31 = *(void (**)(char *, uint64_t))(v6 + 8);
        v31(v15, v5);
        _os_log_impl(&dword_1B4BE6000, v25, (os_log_type_t)v41, "#TaskLoggingService SELF Log - found app %s in appResolutionResult", v29, 0xCu);
        v36 = v40;
        swift_arrayDestroy();
        MEMORY[0x1B5E44758](v36, -1, -1);
        MEMORY[0x1B5E44758](v29, -1, -1);

        v24 = v43;
        v28 = (_DWORD *)MEMORY[0x1E0D979D8];
        v32 = v42;
LABEL_17:
        v24((char *)v9, v17, v5);
        v37 = (*(uint64_t (**)(uint64_t *, uint64_t))(v6 + 88))(v9, v5);
        if (v37 == v32 || v37 == *v28)
        {
          (*(void (**)(uint64_t *, uint64_t))(v6 + 96))(v9, v5);
          v22 = *v9;
        }
        else
        {
          v31((char *)v9, v5);
          v22 = 0;
        }
        v31(v17, v5);
        return v22;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v12, v5);
    }
    swift_bridgeObjectRelease();
    v35 = 0xE300000000000000;
    v33 = 7104878;
    goto LABEL_16;
  }
  outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)v4, &demangling cache variable for type metadata for AppResolutionResult?);
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v18 = type metadata accessor for Logger();
  __swift_project_value_buffer(v18, (uint64_t)static Logger.instrumentation);
  v19 = Logger.logObject.getter();
  v20 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1B4BE6000, v19, v20, "#TaskLoggingService SELF Log - cannot get app from nil appResolutionResult", v21, 2u);
    MEMORY[0x1B5E44758](v21, -1, -1);
  }

  return 0;
}

{
  unint64_t v2;
  char v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18[4];

  if (!a1)
  {
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Logger.instrumentation);
    v10 = Logger.logObject.getter();
    v11 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v10, v11))
      goto LABEL_18;
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    v13 = "#TaskLoggingService SELF Log - cannot get app from nil flowMetadata";
    goto LABEL_17;
  }
  if (!*(_QWORD *)(a1 + 16)
    || (v2 = specialized __RawDictionaryStorage.find<A>(_:)(0x6C646E7542707061, 0xEB00000000644965), (v3 & 1) == 0)
    || (outlined init with copy of Any(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)v18), (swift_dynamicCast() & 1) == 0))
  {
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v9 = type metadata accessor for Logger();
    __swift_project_value_buffer(v9, (uint64_t)static Logger.instrumentation);
    v10 = Logger.logObject.getter();
    v11 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v10, v11))
      goto LABEL_18;
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    v13 = "#TaskLoggingService SELF Log - flowMetadata doesn't contain key 'appBundleId'";
LABEL_17:
    _os_log_impl(&dword_1B4BE6000, v10, v11, v13, v12, 2u);
    MEMORY[0x1B5E44758](v12, -1, -1);
LABEL_18:

    return 0;
  }
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)static Logger.instrumentation);
  swift_bridgeObjectRetain_n();
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v18[0] = v8;
    *(_DWORD *)v7 = 136315138;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v17, v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B4BE6000, v5, v6, "#TaskLoggingService SELF Log - found app %s in flowMetadata", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B5E44758](v8, -1, -1);
    MEMORY[0x1B5E44758](v7, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  type metadata accessor for App();
  return App.__allocating_init(appIdentifier:)();
}

uint64_t specialized static TaskLoggingService.getAppResolutionInfo(flowMetadata:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  Swift::String v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unsigned int v32;
  uint64_t v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  _OWORD v46[2];
  _OWORD v47[2];

  v2 = type metadata accessor for SiriKitReliabilityCodes();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1
    && *(_QWORD *)(a1 + 16)
    && (v6 = specialized __RawDictionaryStorage.find<A>(_:)(0x6974756C6F736572, 0xEE00657079546E6FLL), (v7 & 1) != 0))
  {
    outlined init with copy of Any(*(_QWORD *)(a1 + 56) + 32 * v6, (uint64_t)v46);
    outlined init with take of Any(v46, v47);
    outlined init with copy of Any((uint64_t)v47, (uint64_t)v46);
    if ((swift_dynamicCast() & 1) == 0)
    {
      if (one-time initialization token for instrumentation != -1)
        swift_once();
      v19 = type metadata accessor for Logger();
      __swift_project_value_buffer(v19, (uint64_t)static Logger.instrumentation);
      outlined init with copy of Any((uint64_t)v47, (uint64_t)v46);
      v20 = Logger.logObject.getter();
      v21 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = (uint8_t *)swift_slowAlloc();
        v23 = swift_slowAlloc();
        v45 = v23;
        *(_DWORD *)v22 = 136315138;
        outlined init with copy of Any((uint64_t)v46, (uint64_t)&v43);
        v24 = String.init<A>(describing:)();
        v43 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v45);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
        _os_log_impl(&dword_1B4BE6000, v20, v21, "#TaskLoggingService SELF Log - failed to map non-String: %s to SELF FLOWAppResolutionType, falling back to UNKNOWN", v22, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1B5E44758](v23, -1, -1);
        MEMORY[0x1B5E44758](v22, -1, -1);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
      }

      outlined init with copy of Any((uint64_t)v47, (uint64_t)v46);
      v8 = String.init<A>(describing:)();
      goto LABEL_29;
    }
    v8 = v43;
    v9 = (void *)v44;
    v10 = HIBYTE(v44) & 0xF;
    if ((v44 & 0x2000000000000000) == 0)
      v10 = v43 & 0xFFFFFFFFFFFFLL;
    if (v10)
    {
      swift_bridgeObjectRetain();
      v11._countAndFlagsBits = v8;
      v11._object = v9;
      AppResolutionType.init(rawValue:)(v11);
      v12 = v46[0];
      if (LOBYTE(v46[0]) == 12)
      {
        if (one-time initialization token for instrumentation != -1)
          swift_once();
        v13 = type metadata accessor for Logger();
        __swift_project_value_buffer(v13, (uint64_t)static Logger.instrumentation);
        swift_bridgeObjectRetain_n();
        v14 = Logger.logObject.getter();
        v15 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v14, v15))
        {
          v16 = (uint8_t *)swift_slowAlloc();
          v17 = swift_slowAlloc();
          *(_QWORD *)&v46[0] = v17;
          *(_DWORD *)v16 = 136315138;
          swift_bridgeObjectRetain();
          v43 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v8, (unint64_t)v9, (uint64_t *)v46);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_1B4BE6000, v14, v15, "#TaskLoggingService SELF Log - failed to map appResolutionTypeName: %s to SELF FLOWAppResolutionType, falling back to UNKNOWN", v16, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1B5E44758](v17, -1, -1);
          MEMORY[0x1B5E44758](v16, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }

LABEL_29:
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
        return v8;
      }
      if (one-time initialization token for instrumentation != -1)
        swift_once();
      v26 = type metadata accessor for Logger();
      __swift_project_value_buffer(v26, (uint64_t)static Logger.instrumentation);
      v27 = Logger.logObject.getter();
      v28 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = swift_slowAlloc();
        v42 = swift_slowAlloc();
        *(_QWORD *)&v46[0] = v42;
        *(_DWORD *)v29 = 136315394;
        LOBYTE(v43) = v12;
        v30 = AppResolutionType.rawValue.getter();
        v43 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, (uint64_t *)v46);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        *(_WORD *)(v29 + 12) = 2080;
        LOBYTE(v43) = v12;
        v32 = AppResolutionType.flowAppResolutionType.getter();
        if (v32 > 0xD)
        {
          v34 = CFSTR("FLOWAPPRESOLUTIONTYPE_UNKNOWN");
          v35 = CFSTR("FLOWAPPRESOLUTIONTYPE_UNKNOWN");
        }
        else
        {
          v33 = (int)v32;
          v34 = off_1E6859258[v33];
          v35 = off_1E68592C8[v33];
        }
        v36 = v34;
        v37 = v35;
        v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v40 = v39;

        v43 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v38, v40, (uint64_t *)v46);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1B4BE6000, v27, v28, "#TaskLoggingService SELF Log - mapping appResolutionTypeName: %s to SELF FLOWAppResolutionType %s", (uint8_t *)v29, 0x16u);
        v41 = v42;
        swift_arrayDestroy();
        MEMORY[0x1B5E44758](v41, -1, -1);
        MEMORY[0x1B5E44758](v29, -1, -1);
      }

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
      LOBYTE(v46[0]) = v12;
      AppResolutionType.flowAppResolutionType.getter();
    }
    else
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0D9B318], v2);
      v8 = SiriKitReliabilityCodes.rawValue.getter();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
    }
  }
  else
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0D9B318], v2);
    v8 = SiriKitReliabilityCodes.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v8;
}

uint64_t specialized TaskLoggingService.createFlowPlatformContext(entityContextTier1:)(void *a1)
{
  id v2;
  NSObject *v3;
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t result;

  if (!a1)
    return 0;
  v2 = objc_allocWithZone(MEMORY[0x1E0D99698]);
  v3 = a1;
  v4 = objc_msgSend(v2, sel_init);
  if (!v4)
    goto LABEL_9;
  v5 = v4;
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D99650]), sel_init);
  if (!v6)
  {

LABEL_9:
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v11 = type metadata accessor for Logger();
    __swift_project_value_buffer(v11, (uint64_t)static Logger.instrumentation);
    v10 = Logger.logObject.getter();
    v12 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v10, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1B4BE6000, v10, v12, "#TaskLoggingService unable to instantiate SELF platform/entity context", v13, 2u);
      MEMORY[0x1B5E44758](v13, -1, -1);
    }
    v5 = 0;
    v7 = v3;
    goto LABEL_14;
  }
  v7 = v6;
  v8 = -[NSObject linkId](v3, sel_linkId);
  -[NSObject setLinkId:](v7, sel_setLinkId_, v8);

  v9 = (unint64_t)-[NSObject entitiesPresentedCount](v3, sel_entitiesPresentedCount);
  if ((v9 & 0x8000000000000000) == 0 && !HIDWORD(v9))
  {
    -[NSObject setNumberOfEntitiesShown:](v7, sel_setNumberOfEntitiesShown_, v9);
    objc_msgSend(v5, sel_setEntityContextValue_, v7);
    v10 = v3;
LABEL_14:

    return (uint64_t)v5;
  }
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void specialized TaskLoggingService.logSELFFlowTask(activityType:eventContext:eventTime:task:taskType:app:attribute:domainContext:parameterName:responseId:statusReasonDescription:statusReason:)(signed int a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, unint64_t a15)
{
  uint64_t v15;
  uint64_t v16;
  unint64_t v18;
  _QWORD *v20;
  _QWORD *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  __CFString *v47;
  __CFString *v48;
  uint64_t v49;
  __CFString *v50;
  __CFString *v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  os_log_type_t type;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  os_log_type_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v66;
  uint64_t v68[3];

  v16 = v15;
  v18 = a6;
  v20 = a2;
  v22 = &unk_1ED510000;
  if (a1 <= 3)
  {
    if (a1 == 1)
    {
      specialized TaskLoggingService.updateFlowTaskState(aceServiceInvoker:taskName:interactionId:taskId:)(a2 + 4, a5, a6, a2[12], a2[13], *(_QWORD *)(a4 + 16), *(_QWORD *)(a4 + 24));
      goto LABEL_13;
    }
    if (a1 != 2)
      goto LABEL_13;
  }
  else if ((a1 - 4) >= 2 && a1 != 128)
  {
    goto LABEL_13;
  }
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v23 = type metadata accessor for Logger();
  __swift_project_value_buffer(v23, (uint64_t)static Logger.instrumentation);
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  v24 = Logger.logObject.getter();
  v25 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = swift_slowAlloc();
    v58 = swift_slowAlloc();
    v68[0] = v58;
    *(_DWORD *)v26 = 136315650;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a5, v18, v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v26 + 12) = 2080;
    v27 = v18;
    v28 = v20;
    v29 = v16;
    type = v25;
    v31 = *(_QWORD *)(a4 + 16);
    v30 = *(_QWORD *)(a4 + 24);
    swift_bridgeObjectRetain();
    v32 = v31;
    v16 = v29;
    v20 = v28;
    v18 = v27;
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v30, v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    v22 = (_QWORD *)&unk_1ED510000;
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 22) = 1024;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_1B4BE6000, v24, type, "#TaskLoggingService - sending update context to reset FlowTaskState for TaskType: %s, TaskId: %s, ActivityType: %d", (uint8_t *)v26, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x1B5E44758](v58, -1, -1);
    MEMORY[0x1B5E44758](v26, -1, -1);

  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
  specialized TaskLoggingService.resetFlowTaskState(aceServiceInvoker:)(v20 + 4);
LABEL_13:
  v33 = SiriKitEventContext.resultCandidateId.getter();
  if (v34)
    v35 = v33;
  else
    v35 = 13101;
  if (v34)
    v36 = v34;
  else
    v36 = 0xE200000000000000;
  v37 = v20[10];
  v38 = v20[11];
  v39 = *(_QWORD *)(a4 + 16);
  v40 = *(_QWORD *)(a4 + 24);
  LOBYTE(v68[0]) = 1;
  v59 = v39;
  v62 = v38;
  v63 = v37;
  v41 = TaskLoggingService.createFlowTaskSELFClientEvent(activityType:eventTime:resultCandidateId:taskType:app:appResolutionType:attribute:domainContext:executionRequestId:parameterName:platformContext:statusReason:statusReasonDescription:taskId:)(a1, a3, v35, v36, a5, v18, a7, 0x100000000, a8, a9, a10, v37, v38, a11, a12, 0, a15 | ((HIDWORD(a15) & 1) << 32), a13, a14,
          v39,
          v40);
  swift_bridgeObjectRelease();
  if (v41)
  {
    if (v22[303] != -1)
      swift_once();
    v42 = type metadata accessor for Logger();
    __swift_project_value_buffer(v42, (uint64_t)static Logger.instrumentation);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    swift_retain_n();
    v43 = Logger.logObject.getter();
    v44 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v43, v44))
    {
      v66 = v16;
      v45 = swift_slowAlloc();
      v60 = swift_slowAlloc();
      v68[0] = v60;
      *(_DWORD *)v45 = 136315906;
      v61 = v44;
      if (a1 > 0xCF)
      {
        v47 = CFSTR("FLOWSTATETYPE_UNKNOWN");
        v48 = CFSTR("FLOWSTATETYPE_UNKNOWN");
      }
      else
      {
        v46 = a1;
        v47 = off_1E6859338[v46];
        v48 = off_1E68599B8[v46];
      }
      v50 = v47;
      v51 = v48;
      v52 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v54 = v53;

      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v52, v54, v68);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v45 + 12) = 2080;
      swift_bridgeObjectRetain();
      v49 = v59;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v59, v40, v68);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v45 + 22) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a5, v18, v68);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v45 + 32) = 2080;
      v55 = v20[12];
      v56 = v20[13];
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v55, v56, v68);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B4BE6000, v43, v61, "#TaskLoggingService SELF Log - logging task step: %s for taskId: %s, taskType: %s, interactionId:%s", (uint8_t *)v45, 0x2Au);
      swift_arrayDestroy();
      MEMORY[0x1B5E44758](v60, -1, -1);
      MEMORY[0x1B5E44758](v45, -1, -1);

      v16 = v66;
    }
    else
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_release_n();
      v49 = v59;
    }
    (*(void (**)(void *))(v16 + 96))(v41);
    TaskLoggingService.emitRequestLink(executionRequestId:taskId:)(v63, v62, v49, v40);

  }
}

uint64_t specialized TaskLoggingService.__allocating_init(biomeDonator:curareDonator:selfEmitter:tier1LinkIdSupplier:derivedIdentifierSupplier:appInformationSupplier:sensitivityManager:featureChecker:)(__int128 *a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v26 = a7;
  v27 = a8;
  v24 = a5;
  v25 = a6;
  v23 = a4;
  v22 = a9;
  v17 = *(_QWORD *)(a13 - 8);
  MEMORY[0x1E0C80A78](a12);
  v19 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, a11, a13);
  return specialized TaskLoggingService.init(biomeDonator:curareDonator:selfEmitter:tier1LinkIdSupplier:derivedIdentifierSupplier:appInformationSupplier:sensitivityManager:featureChecker:)(a1, a2, a3, v23, v24, v25, v26, v27, v22, a10, (uint64_t)v19, v20, a13, a14);
}

uint64_t type metadata accessor for TaskLoggingService()
{
  return objc_opt_self();
}

uint64_t method lookup function for TaskLoggingService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TaskLoggingService.__allocating_init(biomeDonator:curareDonator:selfEmitter:tier1LinkIdSupplier:derivedIdentifierSupplier:appInformationSupplier:sensitivityManager:featureChecker:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of AppInformationProvider.resolveAppBundleId.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AppInformationProvider.resolveAppVersion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t outlined retain of SiriKitRequestEvent(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t outlined release of TaskData(uint64_t a1)
{
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

uint64_t FlowTaskProvider.init(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v2 = type metadata accessor for Date();
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1 + OBJC_IVAR____TtC14SiriKitRuntime8FlowTask_creationTime);
  swift_bridgeObjectRetain();
  v5 = dispatch thunk of FlowTaskProvider.__allocating_init(id:isClientInitiated:creationTime:)();
  swift_release();
  return v5;
}

uint64_t TaskService.currentTask.getter()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 32);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = _CocoaArrayWrapper.endIndex.getter();
    v2 = result;
    if (!result)
      goto LABEL_6;
  }
  else
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (!v2)
    {
LABEL_6:
      swift_bridgeObjectRelease();
      return v2;
    }
  }
  if ((v1 & 0xC000000000000001) != 0)
  {
    v2 = MEMORY[0x1B5E43B94](0, v1);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v2 = *(_QWORD *)(v1 + 32);
    swift_retain();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t SiriEnvironment.updateFlowTask(with:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  _QWORD v15[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Date();
  v6 = *(_QWORD *)(v5 - 8);
  result = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v10 = type metadata accessor for FlowTaskProvider();
    v11 = *(_QWORD *)(a1 + 16);
    v15[0] = v10;
    v15[1] = v11;
    v12 = a1 + OBJC_IVAR____TtC14SiriKitRuntime8FlowTask_creationTime;
    v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    v13(v9, a1 + OBJC_IVAR____TtC14SiriKitRuntime8FlowTask_creationTime, v5);
    swift_retain();
    swift_bridgeObjectRetain();
    dispatch thunk of FlowTaskProvider.__allocating_init(id:isClientInitiated:creationTime:)();
    SiriEnvironment.flowTask.setter();
    SiriEnvironment.currentRequest.getter();
    v13(v9, v12, v5);
    swift_bridgeObjectRetain();
    FlowTaskMetadata.init(id:isClientInitiated:creationTime:)();
    v14 = type metadata accessor for FlowTaskMetadata();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v4, 0, 1, v14);
    CurrentRequest.flowTaskMetadata.setter();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t (*default argument 1 of TaskService.init(initialTask:taskIdGenerator:)())()
{
  return closure #1 in default argument 1 of TaskService.init(initialTask:taskIdGenerator:);
}

_QWORD *TaskService.__allocating_init(initialTask:taskIdGenerator:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a2;
  v6[3] = a3;
  if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_1B4EEBC90;
    *(_QWORD *)(v7 + 32) = a1;
    v10 = v7;
    specialized Array._endMutation()();
    v8 = v10;
  }
  else
  {
    v8 = MEMORY[0x1E0DEE9D8];
  }
  v6[4] = v8;
  return v6;
}

Swift::Void __swiftcall TaskService.onTurnInvalidated()()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 32);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = _CocoaArrayWrapper.endIndex.getter();
    if (!v2)
      goto LABEL_16;
  }
  else
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v2)
    {
LABEL_16:
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
  }
  if ((v1 & 0xC000000000000001) != 0)
  {
    v2 = MEMORY[0x1B5E43B94](0, v1);
  }
  else
  {
    if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_24:
      swift_once();
      goto LABEL_12;
    }
    v2 = *(_QWORD *)(v1 + 32);
    swift_retain();
  }
  swift_bridgeObjectRelease();
  if (*(_BYTE *)(v2 + 32) && *(_BYTE *)(v2 + 32) != 1)
  {
    swift_release();
    goto LABEL_16;
  }
  v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {
    swift_release();
LABEL_17:
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v8 = type metadata accessor for Logger();
    __swift_project_value_buffer(v8, (uint64_t)static Logger.instrumentation);
    v9 = Logger.logObject.getter();
    v10 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B4BE6000, v9, v10, "TaskService - Turn invalidated with no current non-ended task, ignoring.", v11, 2u);
      MEMORY[0x1B5E44758](v11, -1, -1);
    }

    return;
  }
  if (one-time initialization token for instrumentation != -1)
    goto LABEL_24;
LABEL_12:
  v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)static Logger.instrumentation);
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B4BE6000, v5, v6, "TaskService - updating task state to .ended because turn is invalidated.", v7, 2u);
    MEMORY[0x1B5E44758](v7, -1, -1);
  }

  TaskService.update(task:state:)(v2, 2);
  swift_release();
  swift_release();
}

void TaskService.onExistingXPCTask(_:)(char *a1)
{
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;
  uint64_t v4;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  NSObject *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  NSObject *v32;

  v6 = (unint64_t *)(v1 + 32);
  swift_beginAccess();
  v7 = *(_QWORD *)(v1 + 32);
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = _CocoaArrayWrapper.endIndex.getter();
    if (!v8)
      goto LABEL_27;
  }
  else
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v8)
    {
LABEL_27:
      swift_bridgeObjectRelease();
LABEL_28:
      if (one-time initialization token for instrumentation != -1)
        swift_once();
      v22 = type metadata accessor for Logger();
      __swift_project_value_buffer(v22, (uint64_t)static Logger.instrumentation);
      v23 = a1;
      swift_retain_n();
      a1 = v23;
      v8 = Logger.logObject.getter();
      v3 = static os_log_type_t.debug.getter();
      if (!os_log_type_enabled((os_log_t)v8, v3))
      {

        swift_release_n();
        return;
      }
      v2 = swift_slowAlloc();
      v4 = swift_slowAlloc();
      v32 = v4;
      *(_DWORD *)v2 = 136315394;
      v7 = *v6;
      if (!(*v6 >> 62))
      {
        v24 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v24)
        {
LABEL_33:
          if ((v7 & 0xC000000000000001) != 0)
          {
            MEMORY[0x1B5E43B94](0, v7);
            goto LABEL_36;
          }
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            swift_retain();
LABEL_36:
            swift_bridgeObjectRelease();
            v25 = FlowTask.description.getter();
            v27 = v26;
            swift_release();
LABEL_42:
            getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v25, v27, (uint64_t *)&v32);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v2 + 12) = 2080;
            v28 = *(_QWORD *)&a1[OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_id];
            v29 = *(_QWORD *)&a1[OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_id + 8];
            swift_bridgeObjectRetain();
            getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v28, v29, (uint64_t *)&v32);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1B4BE6000, (os_log_t)v8, v3, "TaskService - Current task is %s; don't adopt from XPC: %s)",
              (uint8_t *)v2,
              0x16u);
            swift_arrayDestroy();
            MEMORY[0x1B5E44758](v4, -1, -1);
            MEMORY[0x1B5E44758](v2, -1, -1);

            return;
          }
          __break(1u);
          goto LABEL_45;
        }
LABEL_41:
        swift_bridgeObjectRelease();
        v27 = 0xE500000000000000;
        v25 = 0x3E4C494E3CLL;
        goto LABEL_42;
      }
LABEL_40:
      swift_bridgeObjectRetain();
      if (_CocoaArrayWrapper.endIndex.getter())
        goto LABEL_33;
      goto LABEL_41;
    }
  }
  if ((v7 & 0xC000000000000001) != 0)
  {
    v8 = MEMORY[0x1B5E43B94](0, v7);
  }
  else
  {
    if (!*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_40;
    }
    v8 = *(_QWORD *)(v7 + 32);
    swift_retain();
  }
  v2 = 0x64657461657263;
  swift_bridgeObjectRelease();
  if (*(_BYTE *)(v8 + 32) && *(_BYTE *)(v8 + 32) != 1)
  {
    swift_release();
    goto LABEL_27;
  }
  v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
  {
    swift_release();
    goto LABEL_28;
  }
  if (one-time initialization token for instrumentation != -1)
LABEL_45:
    swift_once();
  v10 = type metadata accessor for Logger();
  __swift_project_value_buffer(v10, (uint64_t)static Logger.instrumentation);
  swift_retain_n();
  v11 = Logger.logObject.getter();
  v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v30 = swift_slowAlloc();
    v32 = v30;
    *(_DWORD *)v13 = 136315394;
    v14 = *(_QWORD *)(v8 + 16);
    v15 = *(_QWORD *)(v8 + 24);
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v15, (uint64_t *)&v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    if (*(_BYTE *)(v8 + 32))
    {
      if (*(_BYTE *)(v8 + 32) == 1)
      {
        v16 = 0xE700000000000000;
        v2 = 0x676E696F676E6FLL;
      }
      else
      {
        v16 = 0xE500000000000000;
        v2 = 0x6465646E65;
      }
    }
    else
    {
      v16 = 0xE700000000000000;
    }
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v2, v16, (uint64_t *)&v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B4BE6000, v11, v12, "TaskService - Task %s has state %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1B5E44758](v30, -1, -1);
    MEMORY[0x1B5E44758](v13, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  if ((TaskService.hasLastXPCTaskEnded(flowTaskXPC:)(a1) & 1) == 0)
  {
    v17 = a1;
    v18 = Logger.logObject.getter();
    v19 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v31 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v20 = 138412290;
      v32 = v17;
      v21 = v17;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v31 = v17;

      _os_log_impl(&dword_1B4BE6000, v18, v19, "TaskService - begin adopting existing task from XPC: %@", v20, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x1B5E44758](v31, -1, -1);
      MEMORY[0x1B5E44758](v20, -1, -1);
    }
    else
    {

      v18 = v17;
    }

    TaskService.addNewTask(id:state:isClientInitiated:creationTime:)(*(uint64_t *)((char *)&v17->isa + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_id), *(uint64_t *)((char *)&v17[1].isa + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_id), *((unsigned __int8 *)&v17->isa + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_state), *((unsigned __int8 *)&v17->isa + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_isClientInitiated), (uint64_t)v17 + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_creationTime);
  }
  swift_release();
}

uint64_t TaskService.update(task:state:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50[3];
  uint64_t v51;
  uint64_t v52[3];

  v5 = type metadata accessor for Date();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
  {
LABEL_25:
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v17 = type metadata accessor for Logger();
    __swift_project_value_buffer(v17, (uint64_t)static Logger.instrumentation);
    swift_retain_n();
    v18 = Logger.logObject.getter();
    v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v52[0] = v21;
      *(_DWORD *)v20 = 136315138;
      swift_retain();
      v22 = FlowTask.description.getter();
      v24 = v23;
      swift_release();
      v50[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v24, v52);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B4BE6000, v18, v19, "TaskService - Illegal attempt to update task: %s as created", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E44758](v21, -1, -1);
      MEMORY[0x1B5E44758](v20, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    goto LABEL_31;
  }
  v10 = *(unsigned __int8 *)(a1 + 32);
  if (v10 == 1)
    v11 = 0x676E696F676E6FLL;
  else
    v11 = 0x6465646E65;
  if (v10 == 1)
    v12 = 0xE700000000000000;
  else
    v12 = 0xE500000000000000;
  if (*(_BYTE *)(a1 + 32))
    v13 = v11;
  else
    v13 = 0x64657461657263;
  if (*(_BYTE *)(a1 + 32))
    v14 = v12;
  else
    v14 = 0xE700000000000000;
  if (a2 == 2)
    v15 = 0x6465646E65;
  else
    v15 = 0x676E696F676E6FLL;
  if (a2 == 2)
    v16 = 0xE500000000000000;
  else
    v16 = 0xE700000000000000;
  if (v13 != v15 || v14 != v16)
  {
    v25 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v25 & 1) != 0)
      goto LABEL_31;
    v28 = *(_QWORD *)(a1 + 16);
    v27 = *(_QWORD *)(a1 + 24);
    v29 = *(_BYTE *)(a1 + 33);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1 + OBJC_IVAR____TtC14SiriKitRuntime8FlowTask_creationTime, v5);
    type metadata accessor for FlowTask(0);
    a1 = swift_allocObject();
    *(_QWORD *)(a1 + 16) = v28;
    *(_QWORD *)(a1 + 24) = v27;
    *(_BYTE *)(a1 + 32) = a2;
    *(_BYTE *)(a1 + 33) = v29;
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1 + OBJC_IVAR____TtC14SiriKitRuntime8FlowTask_creationTime, v8, v5);
    v30 = (uint64_t *)(v2 + 32);
    swift_beginAccess();
    swift_retain();
    swift_bridgeObjectRetain();
    v31 = swift_bridgeObjectRetain();
    v32 = specialized Collection.firstIndex(where:)(v31, a1);
    v34 = v33;
    swift_bridgeObjectRelease();
    swift_release();
    if ((v34 & 1) != 0)
    {
      if (one-time initialization token for instrumentation != -1)
        swift_once();
      v46 = type metadata accessor for Logger();
      __swift_project_value_buffer(v46, (uint64_t)static Logger.instrumentation);
      swift_retain_n();
      v38 = Logger.logObject.getter();
      v39 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v38, v39))
      {
        v40 = (uint8_t *)swift_slowAlloc();
        v41 = swift_slowAlloc();
        v50[0] = v41;
        *(_DWORD *)v40 = 136315138;
        swift_retain();
        v47 = FlowTask.description.getter();
        v49 = v48;
        swift_release();
        v51 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v47, v49, v50);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease();
        v45 = "TaskService - Returning unmanaged task: %s";
        goto LABEL_47;
      }
LABEL_48:

      swift_release_n();
      return a1;
    }
    swift_beginAccess();
    v35 = *v30;
    swift_retain();
    isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
    *v30 = v35;
    if (!isUniquelyReferenced_nonNull_bridgeObject || v35 < 0 || (v35 & 0x4000000000000000) != 0)
      specialized _ArrayBuffer._consumeAndCreateNew()(v35);
    if ((v32 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v32 < *(_QWORD *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      *(_QWORD *)((v35 & 0xFFFFFFFFFFFFFF8) + 8 * v32 + 0x20) = a1;
      swift_release();
      specialized Array._endMutation()();
      swift_endAccess();
      if (one-time initialization token for instrumentation == -1)
        goto LABEL_41;
      goto LABEL_51;
    }
    __break(1u);
LABEL_51:
    swift_once();
LABEL_41:
    v37 = type metadata accessor for Logger();
    __swift_project_value_buffer(v37, (uint64_t)static Logger.instrumentation);
    swift_retain_n();
    v38 = Logger.logObject.getter();
    v39 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      v41 = swift_slowAlloc();
      v50[0] = v41;
      *(_DWORD *)v40 = 136315138;
      swift_retain();
      v42 = FlowTask.description.getter();
      v44 = v43;
      swift_release();
      v51 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v42, v44, v50);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      v45 = "TaskService - Updated managed task: %s";
LABEL_47:
      _os_log_impl(&dword_1B4BE6000, v38, v39, v45, v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E44758](v41, -1, -1);
      MEMORY[0x1B5E44758](v40, -1, -1);

      return a1;
    }
    goto LABEL_48;
  }
  swift_bridgeObjectRelease_n();
LABEL_31:
  swift_retain();
  return a1;
}

uint64_t FlowTask.__allocating_init(id:state:isClientInitiated:creationTime:)(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  *(_BYTE *)(v10 + 32) = a3;
  *(_BYTE *)(v10 + 33) = a4;
  v11 = v10 + OBJC_IVAR____TtC14SiriKitRuntime8FlowTask_creationTime;
  v12 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v11, a5, v12);
  return v10;
}

uint64_t FlowTask.State.rawValue.getter(char a1)
{
  if (!a1)
    return 0x64657461657263;
  if (a1 == 1)
    return 0x676E696F676E6FLL;
  return 0x6465646E65;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance FlowTask.State(_BYTE *a1, _BYTE *a2)
{
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;

  v2 = *a1;
  v3 = 0xE700000000000000;
  v4 = 0xE700000000000000;
  v5 = 0x676E696F676E6FLL;
  if (v2 != 1)
  {
    v5 = 0x6465646E65;
    v4 = 0xE500000000000000;
  }
  if (*a1)
    v6 = v5;
  else
    v6 = 0x64657461657263;
  if (v2)
    v7 = v4;
  else
    v7 = 0xE700000000000000;
  v8 = 0x676E696F676E6FLL;
  if (*a2 != 1)
  {
    v8 = 0x6465646E65;
    v3 = 0xE500000000000000;
  }
  if (*a2)
    v9 = v8;
  else
    v9 = 0x64657461657263;
  if (*a2)
    v10 = v3;
  else
    v10 = 0xE700000000000000;
  if (v6 == v9 && v7 == v10)
    v11 = 1;
  else
    v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance FlowTask.State()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance FlowTask.State()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance FlowTask.State()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance FlowTask.State@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized FlowTask.State.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance FlowTask.State(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE700000000000000;
  v4 = 0xE700000000000000;
  v5 = 0x676E696F676E6FLL;
  if (v2 != 1)
  {
    v5 = 0x6465646E65;
    v4 = 0xE500000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x64657461657263;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t FlowTask.id.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FlowTask.state.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t FlowTask.isClientInitiated.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 33);
}

uint64_t FlowTask.creationTime.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC14SiriKitRuntime8FlowTask_creationTime;
  v4 = type metadata accessor for Date();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t FlowTask.init(id:state:isClientInitiated:creationTime:)(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  *(_BYTE *)(v5 + 32) = a3;
  *(_BYTE *)(v5 + 33) = a4;
  v7 = v5 + OBJC_IVAR____TtC14SiriKitRuntime8FlowTask_creationTime;
  v8 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, a5, v8);
  return v5;
}

id FlowTaskXPC.__allocating_init(id:state:isClientInitiated:creationTime:)(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5)
{
  objc_class *v5;
  _BYTE *v11;
  _QWORD *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  objc_super v18;

  v11 = objc_allocWithZone(v5);
  v12 = &v11[OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_id];
  *v12 = a1;
  v12[1] = a2;
  v11[OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_state] = a3;
  v11[OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_isClientInitiated] = a4;
  v13 = &v11[OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_creationTime];
  v14 = type metadata accessor for Date();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v13, a5, v14);
  v18.receiver = v11;
  v18.super_class = v5;
  v16 = objc_msgSendSuper2(&v18, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a5, v14);
  return v16;
}

uint64_t FlowTask.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC14SiriKitRuntime8FlowTask_creationTime;
  v2 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t FlowTask.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC14SiriKitRuntime8FlowTask_creationTime;
  v2 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FlowTask()
{
  return FlowTask.description.getter();
}

id protocol witness for XPCConvertible.xpcRepresentation.getter in conformance FlowTask()
{
  return FlowTask.xpcRepresentation.getter();
}

uint64_t FlowTaskXPC.id.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_id);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FlowTaskXPC.state.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_state);
}

uint64_t FlowTaskXPC.isClientInitiated.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_isClientInitiated);
}

uint64_t FlowTaskXPC.creationTime.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_creationTime;
  v4 = type metadata accessor for Date();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

void *FlowTaskXPC.supportsSecureCoding.unsafeMutableAddressor()
{
  return &static FlowTaskXPC.supportsSecureCoding;
}

uint64_t static FlowTaskXPC.supportsSecureCoding.getter()
{
  return 1;
}

id FlowTaskXPC.init(id:state:isClientInitiated:creationTime:)(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5)
{
  _BYTE *v5;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  objc_super v13;

  v7 = &v5[OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_id];
  *v7 = a1;
  v7[1] = a2;
  v5[OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_state] = a3;
  v5[OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_isClientInitiated] = a4;
  v8 = &v5[OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_creationTime];
  v9 = type metadata accessor for Date();
  v10 = *(_QWORD *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, a5, v9);
  v13.receiver = v5;
  v13.super_class = (Class)type metadata accessor for FlowTaskXPC(0);
  v11 = objc_msgSendSuper2(&v13, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a5, v9);
  return v11;
}

uint64_t FlowTaskXPC.swiftRepresentation()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v11;

  v1 = type metadata accessor for Date();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_id);
  v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_id + 8);
  v7 = *(_BYTE *)(v0 + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_state);
  v8 = *(_BYTE *)(v0 + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_isClientInitiated);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0 + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_creationTime, v1);
  type metadata accessor for FlowTask(0);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v6;
  *(_QWORD *)(v9 + 24) = v5;
  *(_BYTE *)(v9 + 32) = v7;
  *(_BYTE *)(v9 + 33) = v8;
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v9 + OBJC_IVAR____TtC14SiriKitRuntime8FlowTask_creationTime, v4, v1);
  swift_bridgeObjectRetain();
  return v9;
}

uint64_t FlowTaskXPC.CodingKeys.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B4ECE9A0 + 4 * byte_1B4EF21A8[a1]))(25705, 0xE200000000000000);
}

uint64_t sub_1B4ECE9A0()
{
  return 0x6574617473;
}

unint64_t sub_1B4ECE9B4()
{
  return 0xD000000000000011;
}

uint64_t sub_1B4ECE9D0()
{
  return 0x6E6F697461657263;
}

uint64_t FlowTaskXPC.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return FlowTaskXPC.init(coder:)(a1);
}

uint64_t FlowTaskXPC.init(coder:)(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  Swift::String v14;
  unint64_t v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  uint64_t ObjectType;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  id v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  os_log_type_t v44;
  uint8_t *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;

  v3 = type metadata accessor for Date();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for NSString);
  v6 = v1;
  v7 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v7)
  {

    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v29 = type metadata accessor for Logger();
    __swift_project_value_buffer(v29, (uint64_t)static Logger.instrumentation);
    v30 = Logger.logObject.getter();
    v31 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_1B4BE6000, v30, v31, "Error decoding FlowTaskXPC: Missing id", v32, 2u);
      MEMORY[0x1B5E44758](v32, -1, -1);
    }
    goto LABEL_31;
  }
  v8 = (void *)v7;
  v9 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v9)
  {

    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v33 = type metadata accessor for Logger();
    __swift_project_value_buffer(v33, (uint64_t)static Logger.instrumentation);
    v30 = Logger.logObject.getter();
    v34 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_1B4BE6000, v30, v34, "Error decoding FlowTaskXPC: Missing state", v35, 2u);
      MEMORY[0x1B5E44758](v35, -1, -1);
LABEL_30:

      goto LABEL_31;
    }

LABEL_32:
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  v10 = (void *)v9;
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;
  v14._countAndFlagsBits = v11;
  v14._object = v13;
  v15 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of FlowTask.State.init(rawValue:), v14);
  swift_bridgeObjectRelease();
  if (v15 >= 3)
  {

    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v36 = type metadata accessor for Logger();
    __swift_project_value_buffer(v36, (uint64_t)static Logger.instrumentation);
    v37 = v10;
    v30 = Logger.logObject.getter();
    v38 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      v40 = swift_slowAlloc();
      v52 = v40;
      v50 = v8;
      *(_DWORD *)v39 = 136315138;
      v41 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v51 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v41, v42, &v52);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B4BE6000, v30, v38, "Error decoding FlowTaskXPC: Invalid value for state: %s", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E44758](v40, -1, -1);
      MEMORY[0x1B5E44758](v39, -1, -1);

LABEL_31:
      goto LABEL_32;
    }

    goto LABEL_32;
  }
  v16 = (void *)MEMORY[0x1B5E432E8](0xD000000000000011, 0x80000001B4EF56F0);
  v17 = objc_msgSend(a1, sel_containsValueForKey_, v16);

  if (!v17)
  {

    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v43 = type metadata accessor for Logger();
    __swift_project_value_buffer(v43, (uint64_t)static Logger.instrumentation);
    v30 = Logger.logObject.getter();
    v44 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v45 = 0;
      v46 = "Error decoding FlowTaskXPC: Missing isClientInitiated";
LABEL_29:
      _os_log_impl(&dword_1B4BE6000, v30, v44, v46, v45, 2u);
      MEMORY[0x1B5E44758](v45, -1, -1);

      goto LABEL_30;
    }
LABEL_34:

    goto LABEL_32;
  }
  v18 = (void *)MEMORY[0x1B5E432E8](0xD000000000000011, 0x80000001B4EF56F0);
  v19 = objc_msgSend(a1, sel_decodeBoolForKey_, v18);

  type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for NSDate);
  v20 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v20)
  {

    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v47 = type metadata accessor for Logger();
    __swift_project_value_buffer(v47, (uint64_t)static Logger.instrumentation);
    v30 = Logger.logObject.getter();
    v44 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v45 = 0;
      v46 = "Error decoding FlowTaskXPC: Missing creationTime";
      goto LABEL_29;
    }
    goto LABEL_34;
  }
  v21 = (void *)v20;
  ObjectType = swift_getObjectType();
  LODWORD(v50) = v19;
  v23 = v8;
  v24 = ObjectType;

  v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v27 = v26;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  v28 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, _QWORD, char *))(v24 + 112))(v25, v27, v15, v50, v5);

  swift_deallocPartialClassInstance();
  return v28;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance FlowTaskXPC.CodingKeys(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1B4ECF164@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)sub_1B4ECF1D0 + 4 * byte_1B4EF21B0[a2]))(0x6574617473, a1, 25705);
}

uint64_t sub_1B4ECF1D0(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x6574617473 && v1 == 0xE500000000000000)
    v2 = 1;
  else
    v2 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void protocol witness for Hashable.hashValue.getter in conformance FlowTaskXPC.CodingKeys()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  __asm { BR              X9 }
}

Swift::Int sub_1B4ECF2C0()
{
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance FlowTaskXPC.CodingKeys()
{
  __asm { BR              X10 }
}

uint64_t sub_1B4ECF368()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance FlowTaskXPC.CodingKeys()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  __asm { BR              X9 }
}

Swift::Int sub_1B4ECF408()
{
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance FlowTaskXPC.CodingKeys@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized FlowTaskXPC.CodingKeys.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance FlowTaskXPC.CodingKeys()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1B4ECF4D0 + 4 * byte_1B4EF21C0[*v0]))();
}

void sub_1B4ECF4D0(_QWORD *a1@<X8>)
{
  *a1 = 0x6574617473;
  a1[1] = 0xE500000000000000;
}

void sub_1B4ECF4E8(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000011;
  a1[1] = 0x80000001B4EF56F0;
}

void sub_1B4ECF508(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "creationTime");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

uint64_t FlowTaskXPC.description.getter()
{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  void *v3;
  Swift::String v4;
  Swift::String v5;
  Swift::String v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  Swift::String v10;
  Swift::String v11;
  Swift::String v12;
  _BYTE v14[9];

  v14[8] = 0;
  _StringGuts.grow(_:)(71);
  v1._object = (void *)0x80000001B4F05130;
  v1._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v1);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_id);
  v3 = *(void **)(v0 + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_id + 8);
  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = v2;
  v4._object = v3;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0x3A6574617473202CLL;
  v5._object = (void *)0xE900000000000020;
  String.append(_:)(v5);
  *(_QWORD *)v14 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_state);
  _print_unlocked<A, B>(_:_:)();
  v6._countAndFlagsBits = 0xD000000000000015;
  v6._object = (void *)0x80000001B4F050F0;
  String.append(_:)(v6);
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_isClientInitiated))
    v7 = 1702195828;
  else
    v7 = 0x65736C6166;
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_isClientInitiated))
    v8 = 0xE400000000000000;
  else
    v8 = 0xE500000000000000;
  v9 = v8;
  String.append(_:)(*(Swift::String *)&v7);
  swift_bridgeObjectRelease();
  v10._object = (void *)0x80000001B4F05110;
  v10._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v10);
  type metadata accessor for Date();
  lazy protocol witness table accessor for type Date and conformance Date();
  v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 125;
  v12._object = (void *)0xE100000000000000;
  String.append(_:)(v12);
  return *(_QWORD *)&v14[1];
}

id FlowTaskXPC.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void FlowTaskXPC.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id FlowTaskXPC.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FlowTaskXPC(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t protocol witness for XPCRepresentation.swiftRepresentation() in conformance FlowTaskXPC@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x78))();
  if (!v2)
    *a1 = result;
  return result;
}

void *TaskService.maxTasksCount.unsafeMutableAddressor()
{
  return &static TaskService.maxTasksCount;
}

uint64_t static TaskService.maxTasksCount.getter()
{
  return 16;
}

void *TaskService.currentTaskIndex.unsafeMutableAddressor()
{
  return &static TaskService.currentTaskIndex;
}

uint64_t static TaskService.currentTaskIndex.getter()
{
  return 0;
}

void *TaskService.lastTaskIndex.unsafeMutableAddressor()
{
  return &static TaskService.lastTaskIndex;
}

uint64_t static TaskService.lastTaskIndex.getter()
{
  return 1;
}

uint64_t TaskService.tasksCount.getter()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 32);
  if (!(v1 >> 62))
    return *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v2 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t TaskService.taskQueue.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t closure #1 in default argument 1 of TaskService.init(initialTask:taskIdGenerator:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = type metadata accessor for UUID();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  UUID.init()();
  v4 = UUID.uuidString.getter();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t TaskService.init(initialTask:taskIdGenerator:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v4 = v3;
  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = a3;
  if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1B4EEBC90;
    *(_QWORD *)(v6 + 32) = a1;
    v9 = v6;
    specialized Array._endMutation()();
    v7 = v9;
  }
  else
  {
    v7 = MEMORY[0x1E0DEE9D8];
  }
  *(_QWORD *)(v4 + 32) = v7;
  return v4;
}

void TaskService.addNewTask(id:state:isClientInitiated:creationTime:)(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37[3];

  v6 = v5;
  v34 = a3;
  v35 = a4;
  v10 = type metadata accessor for Date();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (_QWORD *)(v5 + 32);
  v15 = swift_beginAccess();
  v16 = *(_QWORD *)(v5 + 32);
  if (!(v16 >> 62))
  {
    if (*(uint64_t *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10) < 16)
      goto LABEL_10;
LABEL_3:
    swift_beginAccess();
    if (*v14 >> 62)
    {
      swift_bridgeObjectRetain();
      v32 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v32)
      {
LABEL_5:
        if (specialized Array._customRemoveLast()())
        {
LABEL_9:
          swift_endAccess();
          v15 = swift_release();
          goto LABEL_10;
        }
        if (!(*v14 >> 62))
        {
          v17 = *(_QWORD *)((*v14 & 0xFFFFFFFFFFFFF8) + 0x10);
          v18 = v17 - 1;
          if (!__OFSUB__(v17, 1))
          {
LABEL_8:
            specialized Array.remove(at:)(v18);
            goto LABEL_9;
          }
LABEL_28:
          __break(1u);
          return;
        }
LABEL_26:
        swift_bridgeObjectRetain();
        v33 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        v18 = v33 - 1;
        if (!__OFSUB__(v33, 1))
          goto LABEL_8;
        goto LABEL_28;
      }
    }
    else if (*(_QWORD *)((*v14 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_26;
  }
  swift_bridgeObjectRetain();
  v30 = _CocoaArrayWrapper.endIndex.getter();
  v15 = swift_bridgeObjectRelease();
  if (v30 >= 16)
    goto LABEL_3;
LABEL_10:
  if (a2)
  {
    v19 = a2;
  }
  else
  {
    a1 = (*(uint64_t (**)(uint64_t))(v6 + 16))(v15);
    v19 = v20;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a5, v10);
  type metadata accessor for FlowTask(0);
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = a1;
  *(_QWORD *)(v21 + 24) = v19;
  *(_BYTE *)(v21 + 32) = v34;
  *(_BYTE *)(v21 + 33) = v35 & 1;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v21 + OBJC_IVAR____TtC14SiriKitRuntime8FlowTask_creationTime, v13, v10);
  swift_beginAccess();
  if (!(*v14 >> 62))
  {
    swift_bridgeObjectRetain();
    swift_retain();
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  v31 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if ((v31 & 0x8000000000000000) == 0)
  {
LABEL_15:
    specialized Array.replaceSubrange<A>(_:with:)(0, 0, v21);
    swift_endAccess();
    if (one-time initialization token for instrumentation == -1)
      goto LABEL_16;
    goto LABEL_23;
  }
  __break(1u);
LABEL_23:
  swift_once();
LABEL_16:
  v22 = type metadata accessor for Logger();
  __swift_project_value_buffer(v22, (uint64_t)static Logger.instrumentation);
  swift_retain_n();
  v23 = Logger.logObject.getter();
  v24 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    v26 = swift_slowAlloc();
    v37[0] = v26;
    *(_DWORD *)v25 = 136315138;
    swift_retain();
    v27 = FlowTask.description.getter();
    v29 = v28;
    swift_release();
    v36 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v27, v29, v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B4BE6000, v23, v24, "TaskService - Added new task: %s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B5E44758](v26, -1, -1);
    MEMORY[0x1B5E44758](v25, -1, -1);
    swift_release();

  }
  else
  {

    swift_release_n();
  }
}

uint64_t TaskService.hasLastXPCTaskEnded(flowTaskXPC:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  char *v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41[3];
  uint64_t v42;
  char *v43;

  v2 = v1;
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)static Logger.instrumentation);
  v5 = a1;
  v6 = Logger.logObject.getter();
  v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v43 = v5;
    v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v9 = v5;

    _os_log_impl(&dword_1B4BE6000, v6, v7, "TaskService - handling XPC task ending for flowTaskXPC: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x1B5E44758](v9, -1, -1);
    MEMORY[0x1B5E44758](v8, -1, -1);

  }
  else
  {

  }
  v11 = (uint64_t *)(v2 + 32);
  swift_beginAccess();
  v12 = *(_QWORD *)(v2 + 32);
  if (!(v12 >> 62))
  {
    if (*(uint64_t *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2)
      goto LABEL_8;
LABEL_14:
    swift_retain_n();
    v16 = Logger.logObject.getter();
    v17 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v41[0] = v19;
      *(_DWORD *)v18 = 136315138;
      v20 = type metadata accessor for FlowTask(0);
      v21 = swift_bridgeObjectRetain();
      v22 = MEMORY[0x1B5E434D4](v21, v20);
      v24 = v23;
      swift_bridgeObjectRelease();
      v42 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v24, v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B4BE6000, v16, v17, "TaskService - not able to identify previous task for end/terminal state for managed tasks: %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E44758](v19, -1, -1);
      MEMORY[0x1B5E44758](v18, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    v25 = 0;
    return v25 & 1;
  }
  swift_bridgeObjectRetain();
  v15 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v15 < 2)
    goto LABEL_14;
LABEL_8:
  swift_beginAccess();
  v13 = *v11;
  if ((*v11 & 0xC000000000000001) != 0)
  {
    LOBYTE(v2) = 1;
    v26 = MEMORY[0x1B5E43B94](1);
    swift_endAccess();
    v27 = *(unsigned __int8 *)(v26 + 32);
    swift_unknownObjectRelease();
    if (v27 >= 2)
      goto LABEL_20;
  }
  else
  {
    if (*(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
    {
      __break(1u);
      goto LABEL_35;
    }
    v14 = *(_QWORD *)(v13 + 40);
    swift_endAccess();
    if (*(_BYTE *)(v14 + 32) && *(_BYTE *)(v14 + 32) != 1)
    {
      LOBYTE(v2) = 1;
      goto LABEL_20;
    }
  }
  LOBYTE(v2) = _stringCompareWithSmolCheck(_:_:expecting:)();
LABEL_20:
  swift_bridgeObjectRelease();
  result = swift_beginAccess();
  v29 = *v11;
  if ((*v11 & 0xC000000000000001) != 0)
  {
LABEL_35:
    v30 = MEMORY[0x1B5E43B94](1);
    goto LABEL_23;
  }
  if (*(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    v30 = *(_QWORD *)(v29 + 40);
    swift_retain();
LABEL_23:
    swift_endAccess();
    v32 = *(_QWORD *)(v30 + 16);
    v31 = *(_QWORD *)(v30 + 24);
    swift_bridgeObjectRetain_n();
    swift_release();
    v33 = Logger.logObject.getter();
    v34 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = swift_slowAlloc();
      v36 = swift_slowAlloc();
      v41[0] = v36;
      *(_DWORD *)v35 = 67109378;
      LODWORD(v42) = v2 & 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v35 + 8) = 2080;
      swift_bridgeObjectRetain();
      v42 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v31, v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B4BE6000, v33, v34, "TaskService - previous task .ended state is %{BOOL}d; previous taskId %s",
        (uint8_t *)v35,
        0x12u);
      swift_arrayDestroy();
      MEMORY[0x1B5E44758](v36, -1, -1);
      MEMORY[0x1B5E44758](v35, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    if (v32 == *(_QWORD *)&v5[OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_id]
      && v31 == *(_QWORD *)&v5[OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_id + 8])
    {
      v37 = 1;
    }
    else
    {
      v37 = _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    swift_bridgeObjectRelease();
    v38 = Logger.logObject.getter();
    v39 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v40 = 67109120;
      LODWORD(v41[0]) = v37 & 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_1B4BE6000, v38, v39, "TaskService - previous task same taskId as xpc one - %{BOOL}d", v40, 8u);
      MEMORY[0x1B5E44758](v40, -1, -1);
    }

    v25 = v2 & v37;
    return v25 & 1;
  }
  __break(1u);
  return result;
}

uint64_t TaskService.deinit()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TaskService.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FlowTask(uint64_t a1)
{
  return type metadata accessor for CombiningAffinityScorer(a1, (uint64_t *)&type metadata singleton initialization cache for FlowTask);
}

uint64_t specialized Array._customRemoveLast()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *v0;
  result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v0 = v1;
  if (!(_DWORD)result || v1 < 0 || (v1 & 0x4000000000000000) != 0)
    specialized _ArrayBuffer._consumeAndCreateNew()(v1);
  v3 = v1 & 0xFFFFFFFFFFFFFF8;
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    v5 = v4 - 1;
    v6 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 8 * v5 + 0x20);
    *(_QWORD *)(v3 + 16) = v5;
    specialized Array._endMutation()();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t specialized FlowTask.State.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of FlowTask.State.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3)
    return 3;
  else
    return v3;
}

unint64_t specialized FlowTaskXPC.CodingKeys.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of FlowTaskXPC.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 4)
    return 4;
  else
    return v3;
}

unint64_t lazy protocol witness table accessor for type FlowTask.State and conformance FlowTask.State()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FlowTask.State and conformance FlowTask.State;
  if (!lazy protocol witness table cache variable for type FlowTask.State and conformance FlowTask.State)
  {
    result = MEMORY[0x1B5E44668](&protocol conformance descriptor for FlowTask.State, &type metadata for FlowTask.State);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FlowTask.State and conformance FlowTask.State);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FlowTaskXPC.CodingKeys and conformance FlowTaskXPC.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FlowTaskXPC.CodingKeys and conformance FlowTaskXPC.CodingKeys;
  if (!lazy protocol witness table cache variable for type FlowTaskXPC.CodingKeys and conformance FlowTaskXPC.CodingKeys)
  {
    result = MEMORY[0x1B5E44668](&protocol conformance descriptor for FlowTaskXPC.CodingKeys, &type metadata for FlowTaskXPC.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FlowTaskXPC.CodingKeys and conformance FlowTaskXPC.CodingKeys);
  }
  return result;
}

_UNKNOWN **associated type witness table accessor for XPCRepresentation.SwiftRepresentation : XPCConvertible in FlowTaskXPC()
{
  return &protocol witness table for FlowTask;
}

uint64_t ObjC metadata update function for FlowTask()
{
  return type metadata accessor for FlowTask(0);
}

uint64_t method lookup function for FlowTask()
{
  return swift_lookUpClassMethod();
}

uint64_t storeEnumTagSinglePayload for FlowTask.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B4ED08DC + 4 * byte_1B4EF21C9[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1B4ED0910 + 4 * byte_1B4EF21C4[v4]))();
}

uint64_t sub_1B4ED0910(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B4ED0918(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B4ED0920);
  return result;
}

uint64_t sub_1B4ED092C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B4ED0934);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1B4ED0938(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B4ED0940(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FlowTask.State()
{
  return &type metadata for FlowTask.State;
}

uint64_t ObjC metadata update function for FlowTaskXPC()
{
  return type metadata accessor for FlowTaskXPC(0);
}

uint64_t type metadata completion function for FlowTask()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for FlowTaskXPC()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FlowTaskXPC.__allocating_init(id:state:isClientInitiated:creationTime:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of FlowTaskXPC.swiftRepresentation()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of FlowTaskXPC.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of FlowTaskXPC.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t storeEnumTagSinglePayload for FlowTaskXPC.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B4ED0AA0 + 4 * byte_1B4EF21D3[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1B4ED0AD4 + 4 * byte_1B4EF21CE[v4]))();
}

uint64_t sub_1B4ED0AD4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B4ED0ADC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B4ED0AE4);
  return result;
}

uint64_t sub_1B4ED0AF0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B4ED0AF8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1B4ED0AFC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B4ED0B04(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FlowTaskXPC.CodingKeys()
{
  return &type metadata for FlowTaskXPC.CodingKeys;
}

uint64_t type metadata accessor for TaskService()
{
  return objc_opt_self();
}

uint64_t method lookup function for TaskService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TaskService.__allocating_init(initialTask:taskIdGenerator:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

SiriKitRuntime::TimerAffinityScorer __swiftcall TimerAffinityScorer.init()()
{
  void *v0;
  uint64_t v1;
  SiriKitRuntime::TimerAffinityScorer result;

  v0 = (void *)0x80000001B4EF6CC0;
  v1 = 0xD000000000000026;
  result.bundleIdentifier._object = v0;
  result.bundleIdentifier._countAndFlagsBits = v1;
  return result;
}

uint64_t *TimerAffinityScorer.kAppBundleIdMatches.unsafeMutableAddressor()
{
  if (one-time initialization token for kAppBundleIdMatches != -1)
    swift_once();
  return &static TimerAffinityScorer.kAppBundleIdMatches;
}

uint64_t static TimerAffinityScorer.kAppBundleIdMatches.getter()
{
  if (one-time initialization token for kAppBundleIdMatches != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t TimerAffinityScorer.bundleIdentifier.getter(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t specialized TimerAffinityScorer.supportedAppIsOnScreen(with:)(uint64_t a1)
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
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  char *v47;
  void (*v48)(char *, char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  Swift::Int v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  BOOL v60;
  uint64_t v61;
  unint64_t v62;
  _QWORD *v63;
  BOOL v64;
  char *v65;
  char *v66;
  unint64_t i;
  unint64_t v68;
  _QWORD *v69;
  BOOL v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  Swift::Int v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  BOOL v82;
  uint64_t v83;
  unint64_t v84;
  _QWORD *v85;
  BOOL v86;
  uint64_t v87;
  void (*v88)(char *, char *, uint64_t);
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t j;
  unint64_t v93;
  _QWORD *v94;
  BOOL v95;
  uint64_t v96;
  char *v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  uint64_t v105;
  char *v106;
  char *v107;
  int v108;
  char *v109;
  void (*v110)(char *, char *, uint64_t);
  unint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  void (*v118)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v119;
  char *v120;
  void (*v121)(char *, uint64_t);
  uint64_t v122;
  void (*v123)(char *, uint64_t, uint64_t);
  char *v124;
  unint64_t v125;
  unint64_t v126;
  char *v127;
  void (*v128)(char *, _QWORD, uint64_t);
  unint64_t v129;
  void (*v130)(char *);
  unint64_t v131;
  char *v132;
  unint64_t v133;
  char v134;
  void (*v135)(char *, uint64_t);
  char *v136;
  char *v137;
  unint64_t v138;
  uint64_t v139;
  char v140;
  uint64_t v141;
  char *v142;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char v147;
  uint64_t v148;
  char v149;
  unint64_t v150;
  uint64_t v151;
  char *v152;
  char v153;
  unint64_t v154;
  uint64_t v155;
  char *v156;
  char *v157;
  char v158;
  uint64_t v159;
  uint64_t v160;
  unsigned int v161;
  char *v162;
  unint64_t v163;
  unint64_t v164;
  uint64_t v165;
  unsigned int v166;
  uint64_t v167;
  void (*v168)(char *, uint64_t, uint64_t);
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  char *v173;
  uint64_t v174;
  char *v175;
  char *v176;
  char *v177;
  uint64_t v178;
  uint64_t v179;
  void (*v180)(char *, uint64_t);
  uint64_t v181;
  char *v182;
  char *v183;
  char *v184;
  char *v185;
  uint64_t v186;
  unint64_t v187;
  char *v188;
  uint64_t v189;
  int v190;
  char *v191;
  char *v192;
  char *v193;
  char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  char *v198;
  uint64_t v199;
  uint64_t v200;
  char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RRDataSourceMetadataValue?);
  MEMORY[0x1E0C80A78](v2);
  v202 = (uint64_t)&v160 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for RRMetadata();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v194 = (char *)&v160 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v201 = (char *)&v160 - v8;
  v9 = type metadata accessor for RRDataSourceMetadataValue();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v162 = (char *)&v160 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v11);
  v177 = (char *)&v160 - v14;
  v15 = MEMORY[0x1E0C80A78](v13);
  v191 = (char *)&v160 - v16;
  v17 = MEMORY[0x1E0C80A78](v15);
  v185 = (char *)&v160 - v18;
  v19 = MEMORY[0x1E0C80A78](v17);
  v184 = (char *)&v160 - v20;
  v21 = MEMORY[0x1E0C80A78](v19);
  v176 = (char *)&v160 - v22;
  MEMORY[0x1E0C80A78](v21);
  v182 = (char *)&v160 - v23;
  v24 = type metadata accessor for UsoIdentifier();
  v197 = *(_QWORD *)(v24 - 8);
  v25 = MEMORY[0x1E0C80A78](v24);
  v188 = (char *)&v160 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x1E0C80A78](v25);
  v193 = (char *)&v160 - v28;
  MEMORY[0x1E0C80A78](v27);
  v30 = (char *)&v160 - v29;
  v181 = type metadata accessor for RREntity();
  v174 = *(_QWORD *)(v181 - 8);
  v31 = MEMORY[0x1E0C80A78](v181);
  v173 = (char *)&v160 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v31);
  v175 = (char *)&v160 - v33;
  v179 = type metadata accessor for RRCandidate();
  MEMORY[0x1E0C80A78](v179);
  v183 = (char *)&v160 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v172 = *(_QWORD *)(a1 + 16);
  if (!v172)
    return 0;
  v36 = v34;
  v171 = type metadata accessor for UsoEntity_common_App();
  v170 = a1 + ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80));
  v190 = *MEMORY[0x1E0DA3D48];
  v166 = *MEMORY[0x1E0DA3DC0];
  v161 = *MEMORY[0x1E0DA3DB8];
  v169 = *(_QWORD *)(v36 + 72);
  v167 = v36;
  v168 = *(void (**)(char *, uint64_t, uint64_t))(v36 + 16);
  v160 = a1;
  swift_bridgeObjectRetain();
  v37 = 0;
  v199 = v4;
  v200 = v10;
  v195 = v5;
  v196 = v24;
  v198 = v30;
  while (1)
  {
    v178 = v37;
    v168(v183, v170 + v169 * v37, v179);
    v38 = v175;
    RRCandidate.entity.getter();
    RREntity.usoEntity.getter();
    v180 = *(void (**)(char *, uint64_t))(v174 + 8);
    v180(v38, v181);
    static UsoEntity_CodeGenConverter.convertAs<A>(entity:asType:)();
    swift_release();
    v39 = v203;
    if (v203)
    {
      swift_retain();
      v40 = dispatch thunk of CodeGenBase.usoIdentifiers.getter();
      result = swift_release();
      v42 = MEMORY[0x1E0DEE9D8];
      v204 = MEMORY[0x1E0DEE9D8];
      v187 = *(_QWORD *)(v40 + 16);
      if (v187)
      {
        v165 = v39;
        v43 = 0;
        v44 = v196;
        v186 = v40;
        while (1)
        {
          if (v43 >= *(_QWORD *)(v40 + 16))
          {
            __break(1u);
            goto LABEL_118;
          }
          v46 = *(_QWORD *)(v197 + 72);
          v192 = (char *)((*(unsigned __int8 *)(v197 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v197 + 80));
          v189 = v46;
          v47 = &v192[v40 + v46 * v43];
          v48 = *(void (**)(char *, char *, uint64_t))(v197 + 16);
          v48(v30, v47, v44);
          if (one-time initialization token for kAppBundleIdMatches != -1)
            swift_once();
          v49 = static TimerAffinityScorer.kAppBundleIdMatches;
          v50 = UsoIdentifier.appBundleId.getter();
          v52 = v51;
          if (*(_QWORD *)(v49 + 16))
          {
            v53 = v50;
            Hasher.init(_seed:)();
            String.hash(into:)();
            v54 = Hasher._finalize()();
            v55 = -1 << *(_BYTE *)(v49 + 32);
            v56 = v54 & ~v55;
            v57 = v49 + 56;
            if (((*(_QWORD *)(v49 + 56 + ((v56 >> 3) & 0xFFFFFFFFFFFFF8)) >> v56) & 1) != 0)
            {
              v58 = *(_QWORD *)(v49 + 48);
              v59 = (_QWORD *)(v58 + 16 * v56);
              v60 = *v59 == v53 && v59[1] == v52;
              if (v60 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
              {
LABEL_27:
                swift_bridgeObjectRelease();
                v65 = v193;
                v66 = v198;
                v44 = v196;
                v48(v193, v198, v196);
LABEL_50:
                v87 = v197;
                (*(void (**)(char *, uint64_t))(v197 + 8))(v65, v44);
                v88 = *(void (**)(char *, char *, uint64_t))(v87 + 32);
                v88(v188, v66, v44);
                v89 = v204;
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                {
                  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v89 + 16) + 1, 1);
                  v44 = v196;
                  v89 = v204;
                }
                v4 = v199;
                v10 = v200;
                v40 = v186;
                v91 = *(_QWORD *)(v89 + 16);
                v90 = *(_QWORD *)(v89 + 24);
                if (v91 >= v90 >> 1)
                {
                  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v90 > 1, v91 + 1, 1);
                  v44 = v196;
                  v89 = v204;
                }
                *(_QWORD *)(v89 + 16) = v91 + 1;
                result = ((uint64_t (*)(char *, char *, uint64_t))v88)(&v192[v89 + v91 * v189], v188, v44);
                v204 = v89;
                v30 = v198;
                goto LABEL_10;
              }
              v61 = ~v55;
              v62 = (v56 + 1) & v61;
              if (((*(_QWORD *)(v57 + ((v62 >> 3) & 0xFFFFFFFFFFFFF8)) >> v62) & 1) != 0)
              {
                v63 = (_QWORD *)(v58 + 16 * v62);
                v64 = *v63 == v53 && v63[1] == v52;
                if (v64 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                  goto LABEL_27;
                for (i = v62 + 1; ; i = v68 + 1)
                {
                  v68 = i & v61;
                  if (((*(_QWORD *)(v57 + (((i & v61) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v61)) & 1) == 0)
                    break;
                  v69 = (_QWORD *)(v58 + 16 * v68);
                  v70 = *v69 == v53 && v69[1] == v52;
                  if (v70 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                    goto LABEL_27;
                }
              }
            }
          }
          swift_bridgeObjectRelease();
          v48(v193, v198, v196);
          v71 = static TimerAffinityScorer.kAppBundleIdMatches;
          v72 = UsoIdentifier.value.getter();
          v74 = v73;
          if (*(_QWORD *)(v71 + 16))
          {
            v75 = v72;
            Hasher.init(_seed:)();
            String.hash(into:)();
            v76 = Hasher._finalize()();
            v77 = -1 << *(_BYTE *)(v71 + 32);
            v78 = v76 & ~v77;
            v79 = v71 + 56;
            if (((*(_QWORD *)(v71 + 56 + ((v78 >> 3) & 0xFFFFFFFFFFFFF8)) >> v78) & 1) != 0)
            {
              v80 = *(_QWORD *)(v71 + 48);
              v81 = (_QWORD *)(v80 + 16 * v78);
              v82 = *v81 == v75 && v81[1] == v74;
              if (v82 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
              {
LABEL_49:
                swift_bridgeObjectRelease();
                v44 = v196;
                v65 = v193;
                v66 = v198;
                goto LABEL_50;
              }
              v83 = ~v77;
              v84 = (v78 + 1) & ~v77;
              if (((*(_QWORD *)(v79 + ((v84 >> 3) & 0xFFFFFFFFFFFFF8)) >> v84) & 1) != 0)
              {
                v85 = (_QWORD *)(v80 + 16 * v84);
                v86 = *v85 == v75 && v85[1] == v74;
                if (v86 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                  goto LABEL_49;
                for (j = v84 + 1; ; j = v93 + 1)
                {
                  v93 = j & v83;
                  if (((*(_QWORD *)(v79 + (((j & v83) >> 3) & 0xFFFFFFFFFFFFF8)) >> (j & v83)) & 1) == 0)
                    break;
                  v94 = (_QWORD *)(v80 + 16 * v93);
                  v95 = *v94 == v75 && v94[1] == v74;
                  if (v95 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                    goto LABEL_49;
                }
              }
            }
          }
          swift_bridgeObjectRelease();
          v44 = v196;
          v45 = *(void (**)(char *, uint64_t))(v197 + 8);
          v45(v193, v196);
          v30 = v198;
          result = ((uint64_t (*)(char *, uint64_t))v45)(v198, v44);
          v4 = v199;
          v10 = v200;
          v40 = v186;
LABEL_10:
          ++v43;
          v5 = v195;
          if (v43 == v187)
          {
            v42 = v204;
            break;
          }
        }
      }
      swift_bridgeObjectRelease();
      v96 = *(_QWORD *)(v42 + 16);
      swift_release();
      swift_release();
      v97 = v194;
      if (v96)
      {
        (*(void (**)(char *, uint64_t))(v167 + 8))(v183, v179);
LABEL_114:
        v159 = 1;
LABEL_115:
        swift_bridgeObjectRelease();
        return v159;
      }
    }
    else
    {
      v97 = v194;
    }
    v98 = v173;
    RRCandidate.entity.getter();
    v99 = RREntity.metadata.getter();
    v180(v98, v181);
    v100 = *(_QWORD *)(v99 + 16);
    if (v100)
    {
      v101 = v99 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
      v189 = v99;
      swift_bridgeObjectRetain();
      v102 = *(_QWORD *)(v5 + 72);
      v192 = *(char **)(v5 + 16);
      v103 = MEMORY[0x1E0DEE9D8];
      do
      {
        v104 = v103;
        v105 = v9;
        v106 = v201;
        v107 = v192;
        ((void (*)(char *, unint64_t, uint64_t))v192)(v201, v101, v4);
        ((void (*)(char *, char *, uint64_t))v107)(v97, v106, v4);
        v108 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v97, v4);
        if (v108 == v190)
        {
          (*(void (**)(char *, uint64_t))(v5 + 96))(v97, v4);
          v109 = v97;
          v110 = *(void (**)(char *, char *, uint64_t))(v200 + 32);
          v111 = v104;
          v112 = v185;
          v113 = v202;
          v114 = v102;
          v115 = v5;
          v116 = v200;
          v110(v185, v109, v105);
          v117 = v112;
          v103 = v111;
          v110((char *)v113, v117, v105);
          v118 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v116 + 56);
          v9 = v105;
          v119 = v105;
          v10 = v116;
          v5 = v115;
          v102 = v114;
          v4 = v199;
          v118(v113, 0, 1, v119);
          (*(void (**)(char *, uint64_t))(v5 + 8))(v201, v4);
        }
        else
        {
          v120 = v97;
          v121 = *(void (**)(char *, uint64_t))(v5 + 8);
          v121(v120, v4);
          v122 = v105;
          v10 = v200;
          v9 = v122;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v200 + 56))(v202, 1, 1);
          v103 = v104;
          v121(v201, v4);
        }
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v202, 1, v9) == 1)
        {
          outlined destroy of ReferenceResolutionClientProtocol?(v202, &demangling cache variable for type metadata for RRDataSourceMetadataValue?);
        }
        else
        {
          v123 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 32);
          v124 = v184;
          v123(v184, v202, v9);
          v123(v191, (uint64_t)v124, v9);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v103 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v103 + 16) + 1, 1, v103);
          v126 = *(_QWORD *)(v103 + 16);
          v125 = *(_QWORD *)(v103 + 24);
          if (v126 >= v125 >> 1)
            v103 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v125 > 1, v126 + 1, 1, v103);
          *(_QWORD *)(v103 + 16) = v126 + 1;
          v123((char *)(v103+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(_QWORD *)(v10 + 72) * v126), (uint64_t)v191, v9);
          v4 = v199;
          v5 = v195;
        }
        v97 = v194;
        v101 += v102;
        --v100;
      }
      while (v100);
      swift_bridgeObjectRelease_n();
    }
    else
    {
      swift_bridgeObjectRelease();
      v103 = MEMORY[0x1E0DEE9D8];
    }
    v127 = v182;
    v128 = *(void (**)(char *, _QWORD, uint64_t))(v10 + 104);
    v128(v182, v166, v9);
    v192 = *(char **)(v103 + 16);
    if (!v192)
    {
      (*(void (**)(char *, uint64_t))(v10 + 8))(v127, v9);
      goto LABEL_4;
    }
    v164 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    v129 = v103 + v164;
    v130 = *(void (**)(char *))(v10 + 16);
    v131 = v103;
    v132 = v176;
    v186 = v129;
    v189 = (uint64_t)v130;
    v130(v176);
    v133 = lazy protocol witness table accessor for type RRDataSourceMetadataValue and conformance RRDataSourceMetadataValue();
    swift_bridgeObjectRetain();
    v187 = v133;
    v134 = dispatch thunk of static Equatable.== infix(_:_:)();
    v135 = *(void (**)(char *, uint64_t))(v10 + 8);
    v135(v132, v9);
    if ((v134 & 1) == 0)
      break;
    swift_bridgeObjectRelease();
    v136 = v162;
    v137 = v182;
    v138 = v131;
LABEL_85:
    v139 = v186;
LABEL_86:
    v135(v137, v9);
    v128(v177, v161, v9);
    ((void (*)(char *, uint64_t, uint64_t))v189)(v136, v139, v9);
    swift_bridgeObjectRetain();
    v140 = dispatch thunk of static Equatable.== infix(_:_:)();
    v135(v136, v9);
    if ((v140 & 1) == 0)
    {
      if (v192 == (char *)1)
        goto LABEL_88;
      v148 = *(_QWORD *)(v200 + 72);
      ((void (*)(char *, uint64_t, uint64_t))v189)(v136, v139 + v148, v9);
      v149 = dispatch thunk of static Equatable.== infix(_:_:)();
      v135(v136, v9);
      if ((v149 & 1) == 0)
      {
        if (v192 != (char *)2)
        {
          v150 = v138 + v164 + 2 * v148;
          v151 = 2;
          do
          {
            result = ((uint64_t (*)(char *, unint64_t, uint64_t))v189)(v136, v150, v9);
            v152 = (char *)(v151 + 1);
            if (__OFADD__(v151, 1))
              goto LABEL_119;
            v153 = dispatch thunk of static Equatable.== infix(_:_:)();
            v135(v136, v9);
            if ((v153 & 1) != 0)
              goto LABEL_3;
            ++v151;
            v150 += v148;
          }
          while (v152 != v192);
        }
LABEL_88:
        swift_bridgeObjectRelease();
        v135(v177, v9);
        swift_bridgeObjectRelease();
        if (one-time initialization token for kAppBundleIdMatches != -1)
          swift_once();
        v141 = static TimerAffinityScorer.kAppBundleIdMatches;
        v142 = v175;
        v143 = v183;
        RRCandidate.entity.getter();
        v144 = RREntity.appBundleId.getter();
        v146 = v145;
        v180(v142, v181);
        LOBYTE(v141) = specialized Set.contains(_:)(v144, v146, v141);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v167 + 8))(v143, v179);
        v4 = v199;
        v10 = v200;
        v5 = v195;
        v30 = v198;
        if ((v141 & 1) != 0)
          goto LABEL_114;
        goto LABEL_5;
      }
    }
LABEL_3:
    swift_bridgeObjectRelease();
    v135(v177, v9);
    v4 = v199;
    v10 = v200;
    v5 = v195;
LABEL_4:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v167 + 8))(v183, v179);
    v30 = v198;
LABEL_5:
    v37 = v178 + 1;
    if (v178 + 1 == v172)
    {
      v159 = 0;
      goto LABEL_115;
    }
  }
  v163 = v131;
  if (v192 == (char *)1)
    goto LABEL_104;
  v139 = v186;
  v165 = *(_QWORD *)(v200 + 72);
  ((void (*)(char *, uint64_t, uint64_t))v189)(v132, v186 + v165, v9);
  v147 = dispatch thunk of static Equatable.== infix(_:_:)();
  v135(v132, v9);
  v138 = v163;
  if ((v147 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v136 = v162;
    v137 = v182;
    goto LABEL_86;
  }
  if (v192 == (char *)2)
  {
LABEL_104:
    swift_bridgeObjectRelease();
LABEL_105:
    v10 = v200;
    v135(v182, v9);
    goto LABEL_4;
  }
  v154 = v163 + v164 + 2 * v165;
  v155 = 2;
  v136 = v162;
  while (1)
  {
    v156 = v176;
    result = ((uint64_t (*)(char *, unint64_t, uint64_t))v189)(v176, v154, v9);
    v157 = (char *)(v155 + 1);
    if (__OFADD__(v155, 1))
      break;
    v158 = dispatch thunk of static Equatable.== infix(_:_:)();
    v135(v156, v9);
    if ((v158 & 1) != 0)
    {
      v138 = v163;
      swift_bridgeObjectRelease();
      v137 = v182;
      goto LABEL_85;
    }
    ++v155;
    v154 += v165;
    if (v157 == v192)
    {
      swift_bridgeObjectRelease();
      v4 = v199;
      v5 = v195;
      goto LABEL_105;
    }
  }
LABEL_118:
  __break(1u);
LABEL_119:
  __break(1u);
  return result;
}

uint64_t specialized TimerAffinityScorer.priorityForSharedTask(_:environment:)()
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
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  void (*v31)(char *, char *, uint64_t);
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[2];
  _BYTE v63[24];
  uint64_t v64;
  _BYTE v65[40];

  v0 = type metadata accessor for RREntity();
  v57 = *(_QWORD *)(v0 - 8);
  v58 = v0;
  MEMORY[0x1E0C80A78](v0);
  v56 = (char *)&v51 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for RRCandidate();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v55 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v51 - v6;
  static UsoTask_CodegenConverter.convert(task:)();
  outlined init with copy of Any?((uint64_t)v65, (uint64_t)v63);
  if (v64)
  {
    outlined init with copy of Any?((uint64_t)v63, (uint64_t)&v59);
    type metadata accessor for UsoTask_noVerb_uso_NoEntity();
    if (swift_dynamicCast())
    {
      outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)v65, (uint64_t *)&demangling cache variable for type metadata for Any?);
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v59);
LABEL_44:
      v10 = 2;
      goto LABEL_45;
    }
    type metadata accessor for UsoTask_stop_common_MediaItem();
    if (swift_dynamicCast())
    {
      v8 = swift_retain();
      v9 = MEMORY[0x1B5E40804](v8);
      swift_release_n();
      outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)v65, (uint64_t *)&demangling cache variable for type metadata for Any?);
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v59);
      if (v9)
        v10 = 3;
      else
        v10 = 0;
      goto LABEL_45;
    }
    type metadata accessor for UsoTask_stop_uso_NoEntity();
    if (swift_dynamicCast())
    {
      v11 = swift_retain();
      v12 = MEMORY[0x1B5E40804](v11);
      swift_release_n();
      outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)v65, (uint64_t *)&demangling cache variable for type metadata for Any?);
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v59);
      if (v12)
        v10 = 3;
      else
        v10 = 1;
      goto LABEL_45;
    }
    type metadata accessor for UsoTask_enable_common_Setting();
    if (swift_dynamicCast()
      || (type metadata accessor for UsoTask_disable_common_Setting(), swift_dynamicCast()))
    {
      if (MSVDeviceIsAppleTV())
      {
        v13 = swift_retain();
        v14 = MEMORY[0x1B5E40828](v13);
        swift_release_n();
        outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)v65, (uint64_t *)&demangling cache variable for type metadata for Any?);
        swift_release();
        if (v14)
        {
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v59);
          v10 = 3;
          goto LABEL_45;
        }
      }
      else
      {
        outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)v65, (uint64_t *)&demangling cache variable for type metadata for Any?);
        swift_release();
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v59);
      v10 = 0;
      goto LABEL_45;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v59);
  }
  v59 = UsoTask.baseEntityAsString.getter();
  v60 = v15;
  strcpy((char *)v62, "uso_NoEntity");
  BYTE5(v62[1]) = 0;
  HIWORD(v62[1]) = -5120;
  v54 = lazy protocol witness table accessor for type String and conformance String();
  v16 = StringProtocol.contains<A>(_:)();
  swift_bridgeObjectRelease();
  if ((v16 & 1) == 0)
  {
LABEL_43:
    outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)v65, (uint64_t *)&demangling cache variable for type metadata for Any?);
    goto LABEL_44;
  }
  SiriEnvironment.salientEntitiesProvider.getter();
  v17 = dispatch thunk of SalientEntitiesDataProvider.salientEntities.getter();
  swift_release();
  v18 = MEMORY[0x1E0DEE9D8];
  v61 = MEMORY[0x1E0DEE9D8];
  v19 = *(_QWORD *)(v17 + 16);
  swift_bridgeObjectRetain();
  v53 = v19;
  if (v19)
  {
    v20 = 0;
    v52 = v2;
    v51 = v7;
    while (v20 < *(_QWORD *)(v17 + 16))
    {
      v21 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
      v22 = *(_QWORD *)(v3 + 72);
      v23 = v17;
      (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v7, v17 + v21 + v22 * v20, v2);
      v24 = v56;
      RRCandidate.entity.getter();
      RREntity.usoEntity.getter();
      (*(void (**)(char *, uint64_t))(v57 + 8))(v24, v58);
      v25 = v2;
      v26 = v7;
      v27 = UsoTask.verbString.getter();
      v29 = v28;
      swift_release();
      v59 = v27;
      v60 = v29;
      strcpy((char *)v62, "common_Timer");
      BYTE5(v62[1]) = 0;
      HIWORD(v62[1]) = -5120;
      v30 = StringProtocol.contains<A>(_:)();
      swift_bridgeObjectRelease();
      if ((v30 & 1) != 0)
      {
        v31 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
        v31(v55, v26, v25);
        v32 = v61;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v32 + 16) + 1, 1);
          v32 = v61;
        }
        v34 = *(_QWORD *)(v32 + 16);
        v33 = *(_QWORD *)(v32 + 24);
        if (v34 >= v33 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v33 > 1, v34 + 1, 1);
          v32 = v61;
        }
        *(_QWORD *)(v32 + 16) = v34 + 1;
        v35 = v32 + v21 + v34 * v22;
        v2 = v52;
        v31((char *)v35, v55, v52);
        v61 = v32;
        v7 = v51;
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v3 + 8))(v26, v25);
        v7 = v26;
        v2 = v25;
      }
      ++v20;
      v17 = v23;
      if (v53 == v20)
      {
        v18 = v61;
        goto LABEL_33;
      }
    }
    __break(1u);
    goto LABEL_50;
  }
LABEL_33:
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v18 + 16))
  {
    swift_release();
    v45 = specialized TimerAffinityScorer.supportedAppIsOnScreen(with:)(v17);
    swift_bridgeObjectRelease();
    if ((v45 & 1) == 0)
    {
      outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)v65, (uint64_t *)&demangling cache variable for type metadata for Any?);
      v10 = 0;
      goto LABEL_45;
    }
    if (one-time initialization token for executor != -1)
      swift_once();
    v46 = type metadata accessor for Logger();
    __swift_project_value_buffer(v46, (uint64_t)static Logger.executor);
    v47 = Logger.logObject.getter();
    v48 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_1B4BE6000, v47, v48, "TimerAffinityScorer found commonApp entity with Clock/NanoTimer bundle ID", v49, 2u);
      MEMORY[0x1B5E44758](v49, -1, -1);
    }

    goto LABEL_43;
  }
  swift_bridgeObjectRelease();
  if (one-time initialization token for executor != -1)
LABEL_50:
    swift_once();
  v36 = type metadata accessor for Logger();
  __swift_project_value_buffer(v36, (uint64_t)static Logger.executor);
  swift_retain();
  v37 = Logger.logObject.getter();
  v38 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    v40 = swift_slowAlloc();
    v59 = v40;
    *(_DWORD *)v39 = 136315138;
    v41 = swift_retain();
    v42 = MEMORY[0x1B5E434D4](v41, v2);
    v44 = v43;
    swift_release();
    v62[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v42, v44, &v59);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B4BE6000, v37, v38, "TimerAffinityScorer found salient timer entity %s", v39, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B5E44758](v40, -1, -1);
    MEMORY[0x1B5E44758](v39, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)v65, (uint64_t *)&demangling cache variable for type metadata for Any?);
  v10 = 3;
LABEL_45:
  outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)v63, (uint64_t *)&demangling cache variable for type metadata for Any?);
  return v10;
}

uint64_t specialized TimerAffinityScorer.score(input:environment:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v0 = type metadata accessor for Parse();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for USOParse();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  Input.parse.getter();
  if ((*(unsigned int (**)(char *, uint64_t))(v1 + 88))(v3, v0) == *MEMORY[0x1E0D9C678])
  {
    (*(void (**)(char *, uint64_t))(v1 + 96))(v3, v0);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    if (specialized static AffinityScorerUtils.getTask(_:)())
    {
      v32 = UsoTask.baseEntityAsString.getter();
      v33 = v8;
      v30 = 0x72656D6954;
      v31 = 0xE500000000000000;
      lazy protocol witness table accessor for type String and conformance String();
      v9 = StringProtocol.contains<A>(_:)();
      swift_bridgeObjectRelease();
      if ((v9 & 1) != 0)
      {
        if (one-time initialization token for executor != -1)
          swift_once();
        v10 = type metadata accessor for Logger();
        __swift_project_value_buffer(v10, (uint64_t)static Logger.executor);
        v11 = Logger.logObject.getter();
        v12 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v11, v12))
        {
          v13 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_1B4BE6000, v11, v12, "TimerAffinityScorer Task contains \"Timer\" – using .default affinity", v13, 2u);
          MEMORY[0x1B5E44758](v13, -1, -1);
        }

        swift_release();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        return 2;
      }
      v32 = UsoTask.baseEntityAsString.getter();
      v33 = v23;
      v30 = 0x6D72616C41;
      v31 = 0xE500000000000000;
      v24 = StringProtocol.contains<A>(_:)();
      swift_bridgeObjectRelease();
      if ((v24 & 1) == 0)
      {
        v17 = specialized TimerAffinityScorer.priorityForSharedTask(_:environment:)();
        swift_release();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        return v17;
      }
      if ((specialized static AlarmAffinityScorer.isCreateAlarmTaskWithRelativeOffset(task:)() & 1) != 0)
      {
        if (one-time initialization token for executor != -1)
          swift_once();
        v25 = type metadata accessor for Logger();
        __swift_project_value_buffer(v25, (uint64_t)static Logger.executor);
        v26 = Logger.logObject.getter();
        v27 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v26, v27))
        {
          v28 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v28 = 0;
          _os_log_impl(&dword_1B4BE6000, v26, v27, "TimerAffinityScorer Task is Create Alarm with relative offset duration – timer should take a first pass", v28, 2u);
          MEMORY[0x1B5E44758](v28, -1, -1);
        }

        swift_release();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        return 3;
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      swift_release();
    }
    else
    {
      if (one-time initialization token for executor != -1)
        swift_once();
      v19 = type metadata accessor for Logger();
      __swift_project_value_buffer(v19, (uint64_t)static Logger.executor);
      v20 = Logger.logObject.getter();
      v21 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_1B4BE6000, v20, v21, "TimerAffinityScorer Could not extract usoTask from parse", v22, 2u);
        MEMORY[0x1B5E44758](v22, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    return 0;
  }
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (one-time initialization token for executor != -1)
    swift_once();
  v14 = type metadata accessor for Logger();
  __swift_project_value_buffer(v14, (uint64_t)static Logger.executor);
  v15 = Logger.logObject.getter();
  v16 = static os_log_type_t.debug.getter();
  if (!os_log_type_enabled(v15, v16))
  {

    return 2;
  }
  v17 = 2;
  v18 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)v18 = 0;
  _os_log_impl(&dword_1B4BE6000, v15, v16, "TimerAffinityScorer Not a USO parse – .default", v18, 2u);
  MEMORY[0x1B5E44758](v18, -1, -1);

  return v17;
}

ValueMetadata *type metadata accessor for TimerAffinityScorer()
{
  return &type metadata for TimerAffinityScorer;
}

SiriKitRuntime::TranslationAffinityScorer __swiftcall TranslationAffinityScorer.init()()
{
  void *v0;
  uint64_t v1;
  SiriKitRuntime::TranslationAffinityScorer result;

  v0 = (void *)0x80000001B4EF6CF0;
  v1 = 0xD00000000000002CLL;
  result.bundleIdentifier._object = v0;
  result.bundleIdentifier._countAndFlagsBits = v1;
  return result;
}

void *TranslationAffinityScorer.translationSrrAppBundleId.unsafeMutableAddressor()
{
  return &static TranslationAffinityScorer.translationSrrAppBundleId;
}

unint64_t static TranslationAffinityScorer.translationSrrAppBundleId.getter()
{
  return 0xD000000000000025;
}

uint64_t TranslationAffinityScorer.bundleIdentifier.getter(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t specialized TranslationAffinityScorer.scoreRepeat(environment:)()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  char *v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  void (*v49)(char *, uint64_t);
  _QWORD v50[2];
  char *v51;
  char *v52;
  char *v53;
  char *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v0 = type metadata accessor for RREntity();
  v56 = *(_QWORD *)(v0 - 8);
  v57 = v0;
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)v50 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = type metadata accessor for RRCandidate();
  v3 = *(_QWORD *)(v58 - 8);
  v4 = MEMORY[0x1E0C80A78](v58);
  v6 = (char *)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x1E0C80A78](v4);
  v9 = (char *)v50 - v8;
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)v50 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RRCandidate?);
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)v50 - v16;
  SiriEnvironment.salientEntitiesProvider.getter();
  v18 = dispatch thunk of SalientEntitiesDataProvider.salientEntities.getter();
  swift_release();
  v19 = *(_QWORD *)(v18 + 16);
  if (v19)
  {
    v51 = v15;
    v52 = v6;
    v53 = v11;
    v54 = v17;
    v20 = v18;
    v21 = v18 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v22 = *(_QWORD *)(v3 + 72);
    v23 = v3;
    v24 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
    v50[1] = v20;
    swift_bridgeObjectRetain();
    v55 = 0x80000001B4F05220;
    v25 = v58;
    while (1)
    {
      v24(v9, v21, v25);
      RRCandidate.entity.getter();
      v26 = RREntity.appBundleId.getter();
      v28 = v27;
      (*(void (**)(char *, uint64_t))(v56 + 8))(v2, v57);
      if (v26 == 0xD000000000000025 && v28 == v55)
        break;
      v29 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v29 & 1) != 0)
        goto LABEL_10;
      v25 = v58;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v58);
      v21 += v22;
      if (!--v19)
      {
        swift_bridgeObjectRelease();
        v30 = 1;
        v11 = v53;
        v17 = v54;
        v3 = v23;
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
LABEL_10:
    swift_bridgeObjectRelease();
    v25 = v58;
    v3 = v23;
    v17 = v54;
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v54, v9, v58);
    v30 = 0;
    v11 = v53;
LABEL_11:
    v15 = v51;
    v6 = v52;
  }
  else
  {
    v30 = 1;
    v25 = v58;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v17, v30, 1, v25);
  swift_bridgeObjectRelease();
  outlined init with copy of RRCandidate?((uint64_t)v17, (uint64_t)v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v15, 1, v25) == 1)
  {
    outlined destroy of RRCandidate?((uint64_t)v15);
    if (one-time initialization token for executor != -1)
      swift_once();
    v31 = type metadata accessor for Logger();
    __swift_project_value_buffer(v31, (uint64_t)static Logger.executor);
    v32 = Logger.logObject.getter();
    v33 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_1B4BE6000, v32, v33, "TranslationAffinityScorer Found no salient entity", v34, 2u);
      MEMORY[0x1B5E44758](v34, -1, -1);
    }

    outlined destroy of RRCandidate?((uint64_t)v17);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v11, v15, v25);
    v36 = v25;
    if (one-time initialization token for executor != -1)
      swift_once();
    v37 = type metadata accessor for Logger();
    __swift_project_value_buffer(v37, (uint64_t)static Logger.executor);
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v11, v25);
    v38 = v3;
    v39 = Logger.logObject.getter();
    v40 = static os_log_type_t.debug.getter();
    v41 = v6;
    if (os_log_type_enabled(v39, v40))
    {
      v42 = swift_slowAlloc();
      v53 = v11;
      v43 = (uint8_t *)v42;
      v44 = swift_slowAlloc();
      v60 = v44;
      v54 = v17;
      *(_DWORD *)v43 = 136315138;
      lazy protocol witness table accessor for type RRCandidate and conformance RRCandidate();
      v45 = dispatch thunk of CustomStringConvertible.description.getter();
      v59 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v46, &v60);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v47 = *(void (**)(char *, uint64_t))(v38 + 8);
      v47(v41, v36);
      _os_log_impl(&dword_1B4BE6000, v39, v40, "TranslationAffinityScorer Found salient entity %s", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E44758](v44, -1, -1);
      MEMORY[0x1B5E44758](v43, -1, -1);

      v47(v53, v36);
      v48 = (uint64_t)v54;
    }
    else
    {

      v49 = *(void (**)(char *, uint64_t))(v38 + 8);
      v49(v41, v36);
      v49(v11, v36);
      v48 = (uint64_t)v17;
    }
    outlined destroy of RRCandidate?(v48);
    return 3;
  }
}

uint64_t specialized TranslationAffinityScorer.score(input:environment:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  char v18;
  uint64_t v20;

  v0 = type metadata accessor for Parse();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for USOParse();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  Input.parse.getter();
  if ((*(unsigned int (**)(char *, uint64_t))(v1 + 88))(v3, v0) == *MEMORY[0x1E0D9C678])
  {
    (*(void (**)(char *, uint64_t))(v1 + 96))(v3, v0);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    if (specialized static AffinityScorerUtils.getTask(_:)())
    {
      if (UsoTask.verbString.getter() == 0x746165706572 && v8 == 0xE600000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v10 & 1) == 0)
          goto LABEL_22;
      }
      if (UsoTask.baseEntityAsString.getter() == 0x6E456F4E5F6F7375 && v16 == 0xEC00000079746974)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v18 & 1) == 0)
        {
LABEL_22:
          (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
          swift_release();
          return 2;
        }
      }
      v14 = specialized TranslationAffinityScorer.scoreRepeat(environment:)();
      swift_release();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return v14;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  if (one-time initialization token for executor != -1)
    swift_once();
  v11 = type metadata accessor for Logger();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.executor);
  v12 = Logger.logObject.getter();
  v13 = static os_log_type_t.debug.getter();
  if (!os_log_type_enabled(v12, v13))
  {

    return 2;
  }
  v14 = 2;
  v15 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)v15 = 0;
  _os_log_impl(&dword_1B4BE6000, v12, v13, "TranslationAffinityScorer Not a USO parse – .default", v15, 2u);
  MEMORY[0x1B5E44758](v15, -1, -1);

  return v14;
}

ValueMetadata *type metadata accessor for TranslationAffinityScorer()
{
  return &type metadata for TranslationAffinityScorer;
}

uint64_t outlined init with copy of RRCandidate?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RRCandidate?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of RRCandidate?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RRCandidate?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t TrialExperimentationAssetManager.__allocating_init(trialClient:)(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = swift_allocObject();
  v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ExperimentationAnalyticsManager()), sel_init);
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return v2;
}

void *CAMAskRepeatTreatment.codePathId.unsafeMutableAddressor()
{
  return &static CAMAskRepeatTreatment.codePathId;
}

Swift::Void __swiftcall TrialExperimentationAssetManaging.emitTriggerLogging(codepathId:requestId:)(Swift::String codepathId, Swift::String_optional requestId)
{
  uint64_t v2;
  void *object;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  unsigned int (*v19)(char *, uint64_t, uint64_t);
  void *v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t countAndFlagsBits;
  uint64_t v35;
  uint64_t v36;

  v31 = v2;
  object = requestId.value._object;
  countAndFlagsBits = requestId.value._countAndFlagsBits;
  v4 = codepathId._object;
  v5 = codepathId._countAndFlagsBits;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v30 - v10;
  v12 = type metadata accessor for UUID();
  v13 = *(_QWORD **)(v12 - 8);
  v14 = MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v30 - v17;
  v33 = v5;
  UUID.init(uuidString:)();
  v19 = (unsigned int (*)(char *, uint64_t, uint64_t))v13[6];
  if (v19(v11, 1, v12) == 1)
  {
    outlined destroy of UUID?((uint64_t)v11);
  }
  else
  {
    v20 = v4;
    v21 = (void (*)(char *, char *, uint64_t))v13[4];
    v21(v18, v11, v12);
    if (object)
    {
      UUID.init(uuidString:)();
      if (v19(v9, 1, v12) != 1)
      {
        v21(v16, v9, v12);
        (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v18, v16, v31);
        v29 = (void (*)(char *, uint64_t))v13[1];
        v29(v16, v12);
        v29(v18, v12);
        return;
      }
      ((void (*)(char *, uint64_t))v13[1])(v18, v12);
      outlined destroy of UUID?((uint64_t)v9);
    }
    else
    {
      ((void (*)(char *, uint64_t))v13[1])(v18, v12);
    }
    v4 = v20;
  }
  if (one-time initialization token for conversationBridge != -1)
    swift_once();
  v22 = type metadata accessor for Logger();
  __swift_project_value_buffer(v22, (uint64_t)static Logger.conversationBridge);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v23 = Logger.logObject.getter();
  v24 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = swift_slowAlloc();
    v26 = swift_slowAlloc();
    v36 = v26;
    *(_DWORD *)v25 = 136315650;
    v35 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000029, 0x80000001B4F052B0, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v25 + 12) = 2080;
    swift_bridgeObjectRetain();
    v35 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v33, (unint64_t)v4, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v25 + 22) = 2080;
    if (object)
      v27 = countAndFlagsBits;
    else
      v27 = 7104878;
    if (object)
      v28 = (unint64_t)object;
    else
      v28 = 0xE300000000000000;
    swift_bridgeObjectRetain();
    v35 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v27, v28, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B4BE6000, v23, v24, "TrialExperimentationAssetManager.%s Unable to emit trigger logging due to invalid IDs. codepathId: %s requestId: %s", (uint8_t *)v25, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1B5E44758](v26, -1, -1);
    MEMORY[0x1B5E44758](v25, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

void *AskToRepeatTreatment.codePathId.unsafeMutableAddressor()
{
  return &static AskToRepeatTreatment.codePathId;
}

void *Tap2EditTreatment.codePathId.unsafeMutableAddressor()
{
  return &static Tap2EditTreatment.codePathId;
}

BOOL TrialExperimentationNamespace.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  Swift::Int v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of TrialExperimentationNamespace.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  return v3 != 0;
}

void *static TrialExperimentationNamespace.allCases.getter()
{
  return &outlined read-only object #0 of static TrialExperimentationNamespace.allCases.getter;
}

unint64_t TrialExperimentationNamespace.rawValue.getter()
{
  return 0xD00000000000001FLL;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance TrialExperimentationNamespace()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance TrialExperimentationNamespace()
{
  return String.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance TrialExperimentationNamespace()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance TrialExperimentationNamespace@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3;
  uint64_t result;

  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of protocol witness for RawRepresentable.init(rawValue:) in conformance TrialExperimentationNamespace, *a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance TrialExperimentationNamespace(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000001FLL;
  a1[1] = 0x80000001B4EF5710;
}

void protocol witness for static CaseIterable.allCases.getter in conformance TrialExperimentationNamespace(_QWORD *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of protocol witness for static CaseIterable.allCases.getter in conformance TrialExperimentationNamespace;
}

void *CAMAskRepeatTreatment.camAskRepeatFeatureDeprecatedFactor.unsafeMutableAddressor()
{
  return &static CAMAskRepeatTreatment.camAskRepeatFeatureDeprecatedFactor;
}

unint64_t static CAMAskRepeatTreatment.camAskRepeatFeatureDeprecatedFactor.getter()
{
  return 0xD00000000000001BLL;
}

unint64_t static CAMAskRepeatTreatment.codePathId.getter()
{
  return 0xD000000000000024;
}

void *AskToRepeatTreatment.askToRepeatFeatureFactor.unsafeMutableAddressor()
{
  return &static AskToRepeatTreatment.askToRepeatFeatureFactor;
}

unint64_t static AskToRepeatTreatment.askToRepeatFeatureFactor.getter()
{
  return 0xD000000000000011;
}

unint64_t static AskToRepeatTreatment.codePathId.getter()
{
  return 0xD000000000000024;
}

void *Tap2EditTreatment.askToRepeatFeatureFactor.unsafeMutableAddressor()
{
  return &static Tap2EditTreatment.askToRepeatFeatureFactor;
}

unint64_t static Tap2EditTreatment.askToRepeatFeatureFactor.getter()
{
  return 0xD000000000000010;
}

unint64_t static Tap2EditTreatment.codePathId.getter()
{
  return 0xD000000000000024;
}

BOOL static Tap2EditTreatment.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void Tap2EditTreatment.hash(into:)(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

Swift::Int CAMAskRepeatTreatment.hashValue.getter(char a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1 & 1);
  return Hasher._finalize()();
}

id TrialExperimentationAssetManager.trialClient.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

uint64_t TrialExperimentationAssetManager.init(trialClient:)(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ExperimentationAnalyticsManager()), sel_init);
  *(_QWORD *)(v1 + 16) = a1;
  *(_QWORD *)(v1 + 24) = v3;
  return v1;
}

SiriKitRuntime::CAMAskRepeatTreatment __swiftcall TrialExperimentationAssetManager.activeCAMAskRepeatTreatment()()
{
  return TrialExperimentationAssetManager.activeCAMAskRepeatTreatment()(0xD00000000000001BLL, 0x80000001B4F05250);
}

SiriKitRuntime::AskToRepeatTreatment __swiftcall TrialExperimentationAssetManager.askToRepeatTreatment()()
{
  return TrialExperimentationAssetManager.activeCAMAskRepeatTreatment()(0xD000000000000011, 0x80000001B4F05270);
}

SiriKitRuntime::Tap2EditTreatment __swiftcall TrialExperimentationAssetManager.tap2EditTreatment()()
{
  return TrialExperimentationAssetManager.activeCAMAskRepeatTreatment()(0xD000000000000010, 0x80000001B4F05290);
}

uint64_t TrialExperimentationAssetManager.activeCAMAskRepeatTreatment()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v17;

  v5 = *(void **)(v2 + 16);
  v6 = (void *)MEMORY[0x1B5E432E8]();
  v7 = (void *)MEMORY[0x1B5E432E8](0xD00000000000001FLL, 0x80000001B4EF5710);
  v8 = objc_msgSend(v5, sel_levelForFactor_withNamespaceName_, v6, v7);

  if (v8)
  {
    v9 = objc_msgSend(v8, sel_BOOLeanValue);

    return v9 ^ 1;
  }
  else
  {
    if (one-time initialization token for conversationBridge != -1)
      swift_once();
    v11 = type metadata accessor for Logger();
    __swift_project_value_buffer(v11, (uint64_t)static Logger.conversationBridge);
    v12 = Logger.logObject.getter();
    v13 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v17 = v15;
      *(_DWORD *)v14 = 136315138;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v17);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_1B4BE6000, v12, v13, "Trial: Failed to get the level value for %s, default to disabled", v14, 0xCu);
      v10 = 1;
      swift_arrayDestroy();
      MEMORY[0x1B5E44758](v15, -1, -1);
      MEMORY[0x1B5E44758](v14, -1, -1);

    }
    else
    {

      return 1;
    }
  }
  return v10;
}

uint64_t TrialExperimentationAssetManager.emitTriggerLogging(codepathId:requestId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  void (*v19)(_BYTE *, uint64_t, uint64_t);
  NSObject *v20;
  os_log_type_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void (*v27)(_BYTE *, uint64_t);
  uint64_t v28;
  unint64_t v29;
  os_log_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(_BYTE *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  void (*v36)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  void (*v42)(char *, _BYTE *, uint64_t);
  _BYTE v44[4];
  int v45;
  os_log_t v46;
  uint64_t v47;
  _BYTE *v48;
  _BYTE *v49;
  void (*v50)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v53 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v3);
  v5 = &v44[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = MEMORY[0x1E0C80A78](v6);
  v10 = &v44[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = MEMORY[0x1E0C80A78](v9);
  v51 = &v44[-v12];
  v13 = MEMORY[0x1E0C80A78](v11);
  v15 = &v44[-v14];
  MEMORY[0x1E0C80A78](v13);
  v17 = &v44[-v16];
  if (one-time initialization token for conversationBridge != -1)
    swift_once();
  v18 = type metadata accessor for Logger();
  __swift_project_value_buffer(v18, (uint64_t)static Logger.conversationBridge);
  v19 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16);
  v52 = a1;
  v19(v17, a1, v6);
  v50 = v19;
  v19(v15, v53, v6);
  v20 = Logger.logObject.getter();
  v21 = static os_log_type_t.debug.getter();
  v22 = v21;
  if (os_log_type_enabled(v20, v21))
  {
    v23 = swift_slowAlloc();
    v49 = v5;
    v24 = v23;
    v47 = swift_slowAlloc();
    v55 = v47;
    *(_DWORD *)v24 = 136315650;
    v46 = v20;
    v54 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000029, 0x80000001B4F052B0, &v55);
    v48 = &v44[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v24 + 12) = 2080;
    lazy protocol witness table accessor for type UUID and conformance UUID();
    v45 = v22;
    v25 = dispatch thunk of CustomStringConvertible.description.getter();
    v54 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v25, v26, &v55);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v27 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
    v27(v17, v6);
    *(_WORD *)(v24 + 22) = 2080;
    v28 = dispatch thunk of CustomStringConvertible.description.getter();
    v54 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v28, v29, &v55);
    v10 = v48;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v27(v15, v6);
    v30 = v46;
    _os_log_impl(&dword_1B4BE6000, v46, (os_log_type_t)v45, "TrialExperimentationAssetManager.%s codepathId: %s requestId: %s", (uint8_t *)v24, 0x20u);
    v31 = v47;
    swift_arrayDestroy();
    MEMORY[0x1B5E44758](v31, -1, -1);
    v32 = v24;
    v5 = v49;
    MEMORY[0x1B5E44758](v32, -1, -1);

  }
  else
  {
    v33 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
    v33(v17, v6);
    v33(v15, v6);

  }
  v34 = type metadata accessor for TaskPriority();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v5, 1, 1, v34);
  v35 = swift_allocObject();
  swift_weakInit();
  v36 = v50;
  v37 = v51;
  v50(v51, v52, v6);
  v36(v10, v53, v6);
  v38 = *(unsigned __int8 *)(v7 + 80);
  v39 = (v38 + 40) & ~v38;
  v40 = (v8 + v38 + v39) & ~v38;
  v41 = (char *)swift_allocObject();
  *((_QWORD *)v41 + 2) = 0;
  *((_QWORD *)v41 + 3) = 0;
  *((_QWORD *)v41 + 4) = v35;
  v42 = *(void (**)(char *, _BYTE *, uint64_t))(v7 + 32);
  v42(&v41[v39], v37, v6);
  v42(&v41[v40], v10, v6);
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v5, (uint64_t)&async function pointer to partial apply for closure #1 in TrialExperimentationAssetManager.emitTriggerLogging(codepathId:requestId:), (uint64_t)v41);
  return swift_release();
}

uint64_t closure #1 in TrialExperimentationAssetManager.emitTriggerLogging(codepathId:requestId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[10] = a5;
  v6[11] = a6;
  v6[9] = a4;
  v7 = type metadata accessor for UUID();
  v6[12] = v7;
  v6[13] = *(_QWORD *)(v7 - 8);
  v6[14] = swift_task_alloc();
  v6[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in TrialExperimentationAssetManager.emitTriggerLogging(codepathId:requestId:)()
{
  uint64_t v0;
  uint64_t Strong;
  void *v2;
  Class isa;
  Class v4;
  _QWORD *v5;
  uint64_t (*v7)(Class, unint64_t, unint64_t, Class);

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v2 = *(void **)(Strong + 24);
    *(_QWORD *)(v0 + 128) = v2;
    v2;
    swift_release();
    isa = UUID._bridgeToObjectiveC()().super.isa;
    *(_QWORD *)(v0 + 136) = isa;
    v4 = UUID._bridgeToObjectiveC()().super.isa;
    *(_QWORD *)(v0 + 144) = v4;
    v7 = (uint64_t (*)(Class, unint64_t, unint64_t, Class))((int)*MEMORY[0x1E0CF1350]
                                                                                  + MEMORY[0x1E0CF1350]);
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v5;
    *v5 = v0;
    v5[1] = closure #1 in TrialExperimentationAssetManager.emitTriggerLogging(codepathId:requestId:);
    return v7(isa, 0xD00000000000001FLL, 0x80000001B4EF5710, v4);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v4;
  void *v5;

  v2 = *v1;
  *(_QWORD *)(v2 + 160) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  v4 = *(void **)(v2 + 136);
  v5 = *(void **)(v2 + 128);

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t v32;
  os_log_type_t type;
  _QWORD *v34;
  NSObject *log;
  uint64_t v36;
  uint64_t v37;

  v1 = *(void **)(v0 + 136);
  v2 = *(void **)(v0 + 128);

  if (one-time initialization token for conversationBridge != -1)
    swift_once();
  v3 = *(void **)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 120);
  v6 = *(_QWORD *)(v0 + 96);
  v7 = *(_QWORD *)(v0 + 104);
  v9 = *(_QWORD *)(v0 + 80);
  v8 = *(_QWORD *)(v0 + 88);
  v10 = type metadata accessor for Logger();
  __swift_project_value_buffer(v10, (uint64_t)static Logger.conversationBridge);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v11(v4, v9, v6);
  v11(v5, v8, v6);
  v12 = v3;
  v13 = v3;
  v14 = Logger.logObject.getter();
  v15 = static os_log_type_t.debug.getter();
  v16 = os_log_type_enabled(v14, v15);
  v17 = *(void **)(v0 + 160);
  v19 = *(_QWORD *)(v0 + 112);
  v18 = *(_QWORD *)(v0 + 120);
  v21 = *(_QWORD *)(v0 + 96);
  v20 = *(_QWORD *)(v0 + 104);
  if (v16)
  {
    log = v14;
    v22 = swift_slowAlloc();
    v34 = (_QWORD *)swift_slowAlloc();
    v36 = swift_slowAlloc();
    v37 = v36;
    *(_DWORD *)v22 = 136315906;
    v32 = v19;
    *(_QWORD *)(v0 + 40) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000029, 0x80000001B4F052B0, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v22 + 12) = 2080;
    lazy protocol witness table accessor for type UUID and conformance UUID();
    v23 = dispatch thunk of CustomStringConvertible.description.getter();
    type = v15;
    *(_QWORD *)(v0 + 48) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, v24, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v25 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v25(v18, v21);
    *(_WORD *)(v22 + 22) = 2080;
    v26 = dispatch thunk of CustomStringConvertible.description.getter();
    *(_QWORD *)(v0 + 56) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v26, v27, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v25(v32, v21);
    *(_WORD *)(v22 + 32) = 2112;
    v28 = v17;
    v29 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 64) = v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v34 = v29;

    _os_log_impl(&dword_1B4BE6000, log, type, "TrialExperimentationAssetManager.%s Unable to emit trigger logging for codePathID: %s, request: %s, error: %@", (uint8_t *)v22, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x1B5E44758](v34, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1B5E44758](v36, -1, -1);
    MEMORY[0x1B5E44758](v22, -1, -1);

  }
  else
  {

    v30 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v30(v18, v21);
    v30(v19, v21);

  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t TrialExperimentationAssetManager.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t TrialExperimentationAssetManager.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t protocol witness for TrialExperimentationAssetManaging.activeCAMAskRepeatTreatment() in conformance TrialExperimentationAssetManager()
{
  return TrialExperimentationAssetManager.activeCAMAskRepeatTreatment()();
}

uint64_t protocol witness for TrialExperimentationAssetManaging.askToRepeatTreatment() in conformance TrialExperimentationAssetManager()
{
  return TrialExperimentationAssetManager.askToRepeatTreatment()();
}

uint64_t protocol witness for TrialExperimentationAssetManaging.tap2EditTreatment() in conformance TrialExperimentationAssetManager()
{
  return TrialExperimentationAssetManager.tap2EditTreatment()();
}

uint64_t protocol witness for TrialExperimentationAssetManaging.emitTriggerLogging(codepathId:requestId:) in conformance TrialExperimentationAssetManager(uint64_t a1, uint64_t a2)
{
  return TrialExperimentationAssetManager.emitTriggerLogging(codepathId:requestId:)(a1, a2);
}

uint64_t sub_1B4ED4A44()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1B4ED4A68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v1 = type metadata accessor for UUID();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = (*(_QWORD *)(v2 + 64) + v3 + v4) & ~v3;
  swift_unknownObjectRelease();
  swift_release();
  v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v6(v0 + v4, v1);
  v6(v0 + v5, v1);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in TrialExperimentationAssetManager.emitTriggerLogging(codepathId:requestId:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(type metadata accessor for UUID() - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = (v5 + 40) & ~v5;
  v7 = v1[2];
  v8 = v1[3];
  v9 = v1[4];
  v10 = (uint64_t)v1 + v6;
  v11 = (uint64_t)v1 + ((*(_QWORD *)(v4 + 64) + v5 + v6) & ~v5);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = protocol witness for FlowContextPublishing.publish(nlContext:) in conformance AceServiceInvokerImpl;
  return closure #1 in TrialExperimentationAssetManager.emitTriggerLogging(codepathId:requestId:)(a1, v7, v8, v9, v10, v11);
}

unint64_t lazy protocol witness table accessor for type TrialExperimentationNamespace and conformance TrialExperimentationNamespace()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TrialExperimentationNamespace and conformance TrialExperimentationNamespace;
  if (!lazy protocol witness table cache variable for type TrialExperimentationNamespace and conformance TrialExperimentationNamespace)
  {
    result = MEMORY[0x1B5E44668](&protocol conformance descriptor for TrialExperimentationNamespace, &type metadata for TrialExperimentationNamespace);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrialExperimentationNamespace and conformance TrialExperimentationNamespace);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [TrialExperimentationNamespace] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [TrialExperimentationNamespace] and conformance [A];
  if (!lazy protocol witness table cache variable for type [TrialExperimentationNamespace] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [TrialExperimentationNamespace]);
    result = MEMORY[0x1B5E44668](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [TrialExperimentationNamespace] and conformance [A]);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CAMAskRepeatTreatment and conformance CAMAskRepeatTreatment()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CAMAskRepeatTreatment and conformance CAMAskRepeatTreatment;
  if (!lazy protocol witness table cache variable for type CAMAskRepeatTreatment and conformance CAMAskRepeatTreatment)
  {
    result = MEMORY[0x1B5E44668](&protocol conformance descriptor for CAMAskRepeatTreatment, &type metadata for CAMAskRepeatTreatment);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CAMAskRepeatTreatment and conformance CAMAskRepeatTreatment);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AskToRepeatTreatment and conformance AskToRepeatTreatment()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AskToRepeatTreatment and conformance AskToRepeatTreatment;
  if (!lazy protocol witness table cache variable for type AskToRepeatTreatment and conformance AskToRepeatTreatment)
  {
    result = MEMORY[0x1B5E44668](&protocol conformance descriptor for AskToRepeatTreatment, &type metadata for AskToRepeatTreatment);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AskToRepeatTreatment and conformance AskToRepeatTreatment);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Tap2EditTreatment and conformance Tap2EditTreatment()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Tap2EditTreatment and conformance Tap2EditTreatment;
  if (!lazy protocol witness table cache variable for type Tap2EditTreatment and conformance Tap2EditTreatment)
  {
    result = MEMORY[0x1B5E44668](&protocol conformance descriptor for Tap2EditTreatment, &type metadata for Tap2EditTreatment);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Tap2EditTreatment and conformance Tap2EditTreatment);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TrialExperimentationNamespace(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1B4ED4D60 + 4 * asc_1B4EF2500[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1B4ED4D80 + 4 * byte_1B4EF2505[v4]))();
}

_BYTE *sub_1B4ED4D60(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1B4ED4D80(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B4ED4D88(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B4ED4D90(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B4ED4D98(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B4ED4DA0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for TrialExperimentationNamespace()
{
  return &type metadata for TrialExperimentationNamespace;
}

ValueMetadata *type metadata accessor for CAMAskRepeatTreatment()
{
  return &type metadata for CAMAskRepeatTreatment;
}

ValueMetadata *type metadata accessor for AskToRepeatTreatment()
{
  return &type metadata for AskToRepeatTreatment;
}

uint64_t storeEnumTagSinglePayload for CAMAskRepeatTreatment(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B4ED4E30 + 4 * byte_1B4EF250F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B4ED4E64 + 4 * byte_1B4EF250A[v4]))();
}

uint64_t sub_1B4ED4E64(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B4ED4E6C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B4ED4E74);
  return result;
}

uint64_t sub_1B4ED4E80(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B4ED4E88);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B4ED4E8C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B4ED4E94(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Tap2EditTreatment()
{
  return &type metadata for Tap2EditTreatment;
}

uint64_t dispatch thunk of TrialExperimentationAssetManaging.activeCAMAskRepeatTreatment()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))() & 1;
}

uint64_t dispatch thunk of TrialExperimentationAssetManaging.askToRepeatTreatment()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))() & 1;
}

uint64_t dispatch thunk of TrialExperimentationAssetManaging.tap2EditTreatment()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))() & 1;
}

uint64_t dispatch thunk of TrialExperimentationAssetManaging.emitTriggerLogging(codepathId:requestId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t type metadata accessor for TrialExperimentationAssetManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for TrialExperimentationAssetManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TrialExperimentationAssetManager.__allocating_init(trialClient:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

BOOL UserInputResult.isSupported.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int EnumCaseMultiPayload;
  uint64_t v6;

  v1 = type metadata accessor for UserInputResult();
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of UserInputResult(v0, (uint64_t)v3);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload != 2)
    outlined destroy of UserInputResult((uint64_t)v3);
  return EnumCaseMultiPayload == 2;
}

id static FlowExtensionUserInputResultXPC.unsupportedInput(exclude:)(char a1)
{
  objc_class *v2;
  _BYTE *v3;
  objc_super v5;

  v2 = (objc_class *)type metadata accessor for FlowExtensionUserInputResultXPC();
  v3 = objc_allocWithZone(v2);
  *(_QWORD *)&v3[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_type] = 1;
  *(_QWORD *)&v3[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_error] = 0;
  *(_OWORD *)&v3[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_reformedInputData] = xmmword_1B4EED3C0;
  v3[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_exclude] = a1;
  v5.receiver = v3;
  v5.super_class = v2;
  return objc_msgSendSuper2(&v5, sel_init);
}

id UserInputResult.xpcRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int EnumCaseMultiPayload;
  id v10;
  char v11;
  objc_class *v12;
  _BYTE *v13;
  objc_class *v15;
  _BYTE *v16;
  objc_super v18;
  objc_super v19;

  v1 = v0;
  v2 = type metadata accessor for Input();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for UserInputResult();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of UserInputResult(v1, (uint64_t)v8);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    v11 = *v8;
    v12 = (objc_class *)type metadata accessor for FlowExtensionUserInputResultXPC();
    v13 = objc_allocWithZone(v12);
    *(_QWORD *)&v13[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_type] = 1;
    *(_QWORD *)&v13[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_error] = 0;
    *(_OWORD *)&v13[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_reformedInputData] = xmmword_1B4EED3C0;
    v13[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_exclude] = v11;
    return objc_msgSendSuper2(&v19, sel_init, v18.receiver, v18.super_class, v13, v12);
  }
  if (EnumCaseMultiPayload != 1)
  {
    v15 = (objc_class *)type metadata accessor for FlowExtensionUserInputResultXPC();
    v16 = objc_allocWithZone(v15);
    *(_QWORD *)&v16[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_type] = 0;
    *(_QWORD *)&v16[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_error] = 0;
    *(_OWORD *)&v16[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_reformedInputData] = xmmword_1B4EED3C0;
    v16[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_exclude] = 0;
    return objc_msgSendSuper2(&v18, sel_init, v16, v15, v19.receiver, v19.super_class);
  }
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
  v10 = specialized static FlowExtensionUserInputResultXPC.reformedInput(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v10;
}

id static FlowExtensionUserInputResultXPC.supportedInput.getter()
{
  objc_class *v0;
  _BYTE *v1;
  objc_super v3;

  v0 = (objc_class *)type metadata accessor for FlowExtensionUserInputResultXPC();
  v1 = objc_allocWithZone(v0);
  *(_QWORD *)&v1[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_type] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_error] = 0;
  *(_OWORD *)&v1[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_reformedInputData] = xmmword_1B4EED3C0;
  v1[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_exclude] = 0;
  v3.receiver = v1;
  v3.super_class = v0;
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t FlowExtensionUserInputResultXPC.type.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_type);
}

uint64_t FlowExtensionUserInputResultXPC.reformedInputData.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_reformedInputData);
  outlined copy of Data?(v1, *(_QWORD *)(v0 + OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_reformedInputData + 8));
  return v1;
}

uint64_t FlowExtensionUserInputResultXPC.exclude.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_exclude);
}

void *FlowExtensionUserInputResultXPC.error.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_error);
  v2 = v1;
  return v1;
}

id FlowExtensionUserInputResultXPC.__allocating_init(type:error:reformedInputData:exclude:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  objc_class *v5;
  _BYTE *v11;
  _QWORD *v12;
  objc_super v14;

  v11 = objc_allocWithZone(v5);
  *(_QWORD *)&v11[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_type] = a1;
  *(_QWORD *)&v11[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_error] = a2;
  v12 = &v11[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_reformedInputData];
  *v12 = a3;
  v12[1] = a4;
  v11[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_exclude] = a5;
  v14.receiver = v11;
  v14.super_class = v5;
  return objc_msgSendSuper2(&v14, sel_init);
}

id FlowExtensionUserInputResultXPC.init(type:error:reformedInputData:exclude:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _BYTE *v5;
  _QWORD *v6;
  objc_super v8;

  *(_QWORD *)&v5[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_type] = a1;
  *(_QWORD *)&v5[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_error] = a2;
  v6 = &v5[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_reformedInputData];
  *v6 = a3;
  v6[1] = a4;
  v5[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_exclude] = a5;
  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for FlowExtensionUserInputResultXPC();
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t static FlowExtensionUserInputResultXPC.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall FlowExtensionUserInputResultXPC.encode(with:)(NSCoder with)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  Class isa;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_type);
  v4 = (void *)MEMORY[0x1B5E432E8](1701869940, 0xE400000000000000);
  -[objc_class encodeInteger:forKey:](with.super.isa, sel_encodeInteger_forKey_, v3, v4);

  v5 = (uint64_t *)(v1 + OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_reformedInputData);
  v6 = *(_QWORD *)(v1 + OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_reformedInputData + 8);
  if (v6 >> 60 != 15)
  {
    v7 = *v5;
    outlined copy of Data._Representation(*v5, *(_QWORD *)(v1 + OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_reformedInputData + 8));
    isa = Data._bridgeToObjectiveC()().super.isa;
    v9 = (void *)MEMORY[0x1B5E432E8](0xD000000000000011, 0x80000001B4EF4800);
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, isa, v9);

    outlined consume of Data?(v7, v6);
  }
  v10 = *(void **)(v1 + OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_error);
  if (v10)
  {
    v11 = v10;
    v12 = (void *)MEMORY[0x1B5E432E8](0x726F727265, 0xE500000000000000);
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v11, v12);

  }
  v13 = *(unsigned __int8 *)(v1 + OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_exclude);
  v14 = (id)MEMORY[0x1B5E432E8](0x6564756C637865, 0xE700000000000000);
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v13, v14);

}

uint64_t FlowExtensionUserInputResultXPC.CodingKeys.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B4ED5620 + 4 * byte_1B4EF2844[a1]))(1701869940, 0xE400000000000000);
}

uint64_t sub_1B4ED5620()
{
  return 0x726F727265;
}

unint64_t sub_1B4ED5634()
{
  return 0xD000000000000011;
}

uint64_t sub_1B4ED5650()
{
  return 0x6564756C637865;
}

id FlowExtensionUserInputResultXPC.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return FlowExtensionUserInputResultXPC.init(coder:)(a1);
}

unint64_t FlowExtensionUserInputResultTypeXPC.init(rawValue:)(unint64_t a1)
{
  return specialized FlowExtensionUserInputResultTypeXPC.init(rawValue:)(a1);
}

SiriKitRuntime::FlowExtensionUserInputResultXPC::CodingKeys_optional __swiftcall FlowExtensionUserInputResultXPC.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = stringValue._object;
  v2._countAndFlagsBits = stringValue._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of FlowExtensionUserInputResultXPC.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 4)
    return (SiriKitRuntime::FlowExtensionUserInputResultXPC::CodingKeys_optional)4;
  else
    return (SiriKitRuntime::FlowExtensionUserInputResultXPC::CodingKeys_optional)v3;
}

SiriKitRuntime::FlowExtensionUserInputResultXPC::CodingKeys_optional __swiftcall FlowExtensionUserInputResultXPC.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (SiriKitRuntime::FlowExtensionUserInputResultXPC::CodingKeys_optional)4;
}

uint64_t FlowExtensionUserInputResultXPC.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t FlowExtensionUserInputResultXPC.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B4ED5790 + 4 * byte_1B4EF2848[a1]))(1701869940, 0xE400000000000000);
}

uint64_t sub_1B4ED5790()
{
  return 0x726F727265;
}

unint64_t sub_1B4ED57A4()
{
  return 0xD000000000000011;
}

uint64_t sub_1B4ED57C0()
{
  return 0x6564756C637865;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance FlowExtensionUserInputResultXPC.CodingKeys(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1B4ED581C@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1B4ED587C + 4 * byte_1B4EF2850[a1]))(0x726F727265);
}

uint64_t sub_1B4ED587C(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x726F727265 && v1 == 0xE500000000000000)
    v2 = 1;
  else
    v2 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void protocol witness for Hashable.hashValue.getter in conformance FlowExtensionUserInputResultXPC.CodingKeys()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  __asm { BR              X9 }
}

Swift::Int sub_1B4ED5968()
{
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance FlowExtensionUserInputResultXPC.CodingKeys()
{
  __asm { BR              X10 }
}

uint64_t sub_1B4ED5A0C()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance FlowExtensionUserInputResultXPC.CodingKeys()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  __asm { BR              X9 }
}

Swift::Int sub_1B4ED5AA8()
{
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance FlowExtensionUserInputResultXPC.CodingKeys@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized FlowExtensionUserInputResultXPC.CodingKeys.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance FlowExtensionUserInputResultXPC.CodingKeys()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1B4ED5B6C + 4 * byte_1B4EF2860[*v0]))();
}

void sub_1B4ED5B6C(_QWORD *a1@<X8>)
{
  *a1 = 0x726F727265;
  a1[1] = 0xE500000000000000;
}

void sub_1B4ED5B84(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000011;
  a1[1] = 0x80000001B4EF4800;
}

void sub_1B4ED5BA4(_QWORD *a1@<X8>)
{
  *a1 = 0x6564756C637865;
  a1[1] = 0xE700000000000000;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance FlowExtensionUserInputResultXPC.CodingKeys()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B4ED5BE8 + 4 * byte_1B4EF2864[*v0]))(1701869940, 0xE400000000000000);
}

uint64_t sub_1B4ED5BE8()
{
  return 0x726F727265;
}

unint64_t sub_1B4ED5BFC()
{
  return 0xD000000000000011;
}

uint64_t sub_1B4ED5C18()
{
  return 0x6564756C637865;
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance FlowExtensionUserInputResultXPC.CodingKeys@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized FlowExtensionUserInputResultXPC.CodingKeys.init(rawValue:)(a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FlowExtensionUserInputResultXPC.CodingKeys()
{
  lazy protocol witness table accessor for type FlowExtensionUserInputResultXPC.CodingKeys and conformance FlowExtensionUserInputResultXPC.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance FlowExtensionUserInputResultXPC.CodingKeys()
{
  lazy protocol witness table accessor for type FlowExtensionUserInputResultXPC.CodingKeys and conformance FlowExtensionUserInputResultXPC.CodingKeys();
  return CodingKey.debugDescription.getter();
}

id FlowExtensionUserInputResultXPC.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void FlowExtensionUserInputResultXPC.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id FlowExtensionUserInputResultXPC.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FlowExtensionUserInputResultXPC();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t protocol witness for XPCRepresentation.swiftRepresentation() in conformance FlowExtensionUserInputResultXPC()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance FlowExtensionUserInputResultTypeXPC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = specialized FlowExtensionUserInputResultTypeXPC.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

id specialized static FlowExtensionUserInputResultXPC.error(_:)()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  Class isa;
  id v6;
  objc_class *v7;
  _BYTE *v8;
  objc_super v10;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B4EE3F50;
  *(_QWORD *)(inited + 32) = 0x7470697263736564;
  *(_QWORD *)(inited + 40) = 0xEB000000006E6F69;
  swift_getErrorValue();
  v1 = Error.localizedDescription.getter();
  *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 48) = v1;
  *(_QWORD *)(inited + 56) = v2;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  v3 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  v4 = (void *)MEMORY[0x1B5E432E8](0xD00000000000001DLL, 0x80000001B4EF9500);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v3, sel_initWithDomain_code_userInfo_, v4, -1, isa);

  v7 = (objc_class *)type metadata accessor for FlowExtensionUserInputResultXPC();
  v8 = objc_allocWithZone(v7);
  *(_QWORD *)&v8[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_type] = 3;
  *(_QWORD *)&v8[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_error] = v6;
  *(_OWORD *)&v8[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_reformedInputData] = xmmword_1B4EED3C0;
  v8[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_exclude] = 0;
  v10.receiver = v8;
  v10.super_class = v7;
  return objc_msgSendSuper2(&v10, sel_init);
}

id specialized static FlowExtensionUserInputResultXPC.reformedInput(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  objc_class *v3;
  _BYTE *v4;
  uint64_t *v5;
  objc_super v7;

  type metadata accessor for PropertyListEncoder();
  swift_allocObject();
  PropertyListEncoder.init()();
  type metadata accessor for Input();
  lazy protocol witness table accessor for type Input and conformance Input((unint64_t *)&lazy protocol witness table cache variable for type Input and conformance Input, MEMORY[0x1E0D9C598]);
  v0 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
  v2 = v1;
  swift_release();
  v3 = (objc_class *)type metadata accessor for FlowExtensionUserInputResultXPC();
  v4 = objc_allocWithZone(v3);
  *(_QWORD *)&v4[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_type] = 2;
  *(_QWORD *)&v4[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_error] = 0;
  v5 = (uint64_t *)&v4[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_reformedInputData];
  *v5 = v0;
  v5[1] = v2;
  v4[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_exclude] = 0;
  v7.receiver = v4;
  v7.super_class = v3;
  return objc_msgSendSuper2(&v7, sel_init);
}

unint64_t specialized FlowExtensionUserInputResultTypeXPC.init(rawValue:)(unint64_t result)
{
  if (result > 3)
    return 0;
  return result;
}

unint64_t specialized FlowExtensionUserInputResultXPC.CodingKeys.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of FlowExtensionUserInputResultXPC.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 4)
    return 4;
  else
    return v3;
}

unint64_t lazy protocol witness table accessor for type FlowExtensionUserInputResultXPC.CodingKeys and conformance FlowExtensionUserInputResultXPC.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FlowExtensionUserInputResultXPC.CodingKeys and conformance FlowExtensionUserInputResultXPC.CodingKeys;
  if (!lazy protocol witness table cache variable for type FlowExtensionUserInputResultXPC.CodingKeys and conformance FlowExtensionUserInputResultXPC.CodingKeys)
  {
    result = MEMORY[0x1B5E44668](&protocol conformance descriptor for FlowExtensionUserInputResultXPC.CodingKeys, &type metadata for FlowExtensionUserInputResultXPC.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FlowExtensionUserInputResultXPC.CodingKeys and conformance FlowExtensionUserInputResultXPC.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FlowExtensionUserInputResultXPC.CodingKeys and conformance FlowExtensionUserInputResultXPC.CodingKeys;
  if (!lazy protocol witness table cache variable for type FlowExtensionUserInputResultXPC.CodingKeys and conformance FlowExtensionUserInputResultXPC.CodingKeys)
  {
    result = MEMORY[0x1B5E44668](&protocol conformance descriptor for FlowExtensionUserInputResultXPC.CodingKeys, &type metadata for FlowExtensionUserInputResultXPC.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FlowExtensionUserInputResultXPC.CodingKeys and conformance FlowExtensionUserInputResultXPC.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FlowExtensionUserInputResultXPC.CodingKeys and conformance FlowExtensionUserInputResultXPC.CodingKeys;
  if (!lazy protocol witness table cache variable for type FlowExtensionUserInputResultXPC.CodingKeys and conformance FlowExtensionUserInputResultXPC.CodingKeys)
  {
    result = MEMORY[0x1B5E44668](&protocol conformance descriptor for FlowExtensionUserInputResultXPC.CodingKeys, &type metadata for FlowExtensionUserInputResultXPC.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FlowExtensionUserInputResultXPC.CodingKeys and conformance FlowExtensionUserInputResultXPC.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FlowExtensionUserInputResultXPC.CodingKeys and conformance FlowExtensionUserInputResultXPC.CodingKeys;
  if (!lazy protocol witness table cache variable for type FlowExtensionUserInputResultXPC.CodingKeys and conformance FlowExtensionUserInputResultXPC.CodingKeys)
  {
    result = MEMORY[0x1B5E44668](&protocol conformance descriptor for FlowExtensionUserInputResultXPC.CodingKeys, &type metadata for FlowExtensionUserInputResultXPC.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FlowExtensionUserInputResultXPC.CodingKeys and conformance FlowExtensionUserInputResultXPC.CodingKeys);
  }
  return result;
}

_UNKNOWN **associated type witness table accessor for XPCRepresentation.SwiftRepresentation : XPCConvertible in FlowExtensionUserInputResultXPC()
{
  return &protocol witness table for UserInputResult;
}

unint64_t lazy protocol witness table accessor for type FlowExtensionUserInputResultTypeXPC and conformance FlowExtensionUserInputResultTypeXPC()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FlowExtensionUserInputResultTypeXPC and conformance FlowExtensionUserInputResultTypeXPC;
  if (!lazy protocol witness table cache variable for type FlowExtensionUserInputResultTypeXPC and conformance FlowExtensionUserInputResultTypeXPC)
  {
    result = MEMORY[0x1B5E44668](&protocol conformance descriptor for FlowExtensionUserInputResultTypeXPC, &type metadata for FlowExtensionUserInputResultTypeXPC);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FlowExtensionUserInputResultTypeXPC and conformance FlowExtensionUserInputResultTypeXPC);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for UserInputResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = type metadata accessor for Input();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  return a1;
}

void *assignWithCopy for UserInputResult(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    outlined destroy of UserInputResult((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = type metadata accessor for Input();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

void *assignWithTake for UserInputResult(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    outlined destroy of UserInputResult((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = type metadata accessor for Input();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t type metadata completion function for UserInputResult()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Input();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t method lookup function for FlowExtensionUserInputResultXPC()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FlowExtensionUserInputResultXPC.__allocating_init(type:error:reformedInputData:exclude:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of FlowExtensionUserInputResultXPC.swiftRepresentation()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of FlowExtensionUserInputResultXPC.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of FlowExtensionUserInputResultXPC.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t storeEnumTagSinglePayload for FlowExtensionUserInputResultXPC.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B4ED666C + 4 * byte_1B4EF286D[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1B4ED66A0 + 4 * byte_1B4EF2868[v4]))();
}

uint64_t sub_1B4ED66A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B4ED66A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B4ED66B0);
  return result;
}

uint64_t sub_1B4ED66BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B4ED66C4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1B4ED66C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B4ED66D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FlowExtensionUserInputResultXPC.CodingKeys()
{
  return &type metadata for FlowExtensionUserInputResultXPC.CodingKeys;
}

ValueMetadata *type metadata accessor for FlowExtensionUserInputResultTypeXPC()
{
  return &type metadata for FlowExtensionUserInputResultTypeXPC;
}

uint64_t SIRINLUUserParse.toProtoUserParse()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, _QWORD, uint64_t, uint64_t);
  _BYTE v19[48];
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v3 = type metadata accessor for BinaryDecodingOptions();
  MEMORY[0x1E0C80A78](v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
  MEMORY[0x1E0C80A78](v4);
  v6 = &v19[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = objc_msgSend((id)objc_opt_self(), sel_convertFromUserParse_, v1);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, sel_data);
    if (v9)
    {
      v10 = v9;
      v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      v13 = v12;

      v14 = type metadata accessor for Siri_Nlu_External_UserParse();
      v21 = v11;
      v22 = v13;
      v20 = 0;
      memset(&v19[16], 0, 32);
      outlined copy of Data._Representation(v11, v13);
      BinaryDecodingOptions.init()();
      lazy protocol witness table accessor for type Siri_Nlu_External_UserParse and conformance Siri_Nlu_External_UserParse();
      Message.init<A>(contiguousBytes:extensions:partial:options:)();

      outlined consume of Data._Representation(v11, v13);
      v16 = *(_QWORD *)(v14 - 8);
      v17 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v16 + 56);
      v17((uint64_t)v6, 0, 1, v14);
      (*(void (**)(uint64_t, _BYTE *, uint64_t))(v16 + 32))(a1, v6, v14);
      return v17(a1, 0, 1, v14);
    }

  }
  v15 = type metadata accessor for Siri_Nlu_External_UserParse();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(a1, 1, 1, v15);
}

unint64_t lazy protocol witness table accessor for type Siri_Nlu_External_UserParse and conformance Siri_Nlu_External_UserParse()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type Siri_Nlu_External_UserParse and conformance Siri_Nlu_External_UserParse;
  if (!lazy protocol witness table cache variable for type Siri_Nlu_External_UserParse and conformance Siri_Nlu_External_UserParse)
  {
    v1 = type metadata accessor for Siri_Nlu_External_UserParse();
    result = MEMORY[0x1B5E44668](MEMORY[0x1E0D9F2E0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Siri_Nlu_External_UserParse and conformance Siri_Nlu_External_UserParse);
  }
  return result;
}

id Siri_Nlu_External_UserParse.toLegacyUserParse()()
{
  id v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  id v4;
  Class isa;
  id v6;

  type metadata accessor for Siri_Nlu_External_UserParse();
  lazy protocol witness table accessor for type Siri_Nlu_External_UserParse and conformance Siri_Nlu_External_UserParse();
  v1 = Message.serializedData(partial:)();
  v3 = v2;
  v4 = objc_allocWithZone(MEMORY[0x1E0D9F9B0]);
  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v1, v3);
  v6 = objc_msgSend(v4, sel_initWithData_, isa);

  if (!v6)
    return 0;
  v0 = objc_msgSend((id)objc_opt_self(), sel_convertUserParse_, v6);

  return v0;
}

void SIRINLUUserParse.preferredUserDialogAct.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t v15;

  v1 = objc_msgSend(v0, sel_userDialogActs);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SIRINLUUserDialogAct);
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62)
    goto LABEL_29;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = _CocoaArrayWrapper.endIndex.getter())
  {
    v4 = 4;
    while (1)
    {
      v5 = v4 - 4;
      if ((v2 & 0xC000000000000001) == 0)
        break;
      MEMORY[0x1B5E43B94](v4 - 4, v2);
      v6 = __OFADD__(v5, 1);
      v7 = v4 - 3;
      if (v6)
        goto LABEL_27;
LABEL_9:
      objc_opt_self();
      if (swift_dynamicCastObjCClass())
        goto LABEL_26;
      swift_unknownObjectRelease();
      ++v4;
      if (v7 == v3)
        goto LABEL_11;
    }
    swift_unknownObjectRetain();
    v6 = __OFADD__(v5, 1);
    v7 = v4 - 3;
    if (!v6)
      goto LABEL_9;
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease_n();
  v8 = objc_msgSend(v0, sel_userDialogActs);
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v9 = _CocoaArrayWrapper.endIndex.getter();
    if (v9)
      goto LABEL_13;
LABEL_21:
    swift_bridgeObjectRelease_n();
    v13 = objc_msgSend(v0, sel_userDialogActs);
    v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v14 >> 62)
    {
      swift_bridgeObjectRetain();
      v15 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v15)
        goto LABEL_34;
    }
    else if (!*(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_34;
    }
    if ((v14 & 0xC000000000000001) != 0)
    {
      MEMORY[0x1B5E43B94](0, v14);
    }
    else
    {
      if (!*(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return;
      }
      swift_unknownObjectRetain();
    }
LABEL_34:
    swift_bridgeObjectRelease();
    return;
  }
  v9 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v9)
    goto LABEL_21;
LABEL_13:
  v10 = 4;
  while (1)
  {
    v11 = v10 - 4;
    if ((v2 & 0xC000000000000001) != 0)
    {
      MEMORY[0x1B5E43B94](v10 - 4, v2);
      v6 = __OFADD__(v11, 1);
      v12 = v10 - 3;
      if (v6)
        goto LABEL_28;
    }
    else
    {
      swift_unknownObjectRetain();
      v6 = __OFADD__(v11, 1);
      v12 = v10 - 3;
      if (v6)
        goto LABEL_28;
    }
    objc_opt_self();
    if (swift_dynamicCastObjCClass())
      break;
    swift_unknownObjectRelease();
    ++v10;
    if (v12 == v9)
      goto LABEL_21;
  }
LABEL_26:
  swift_bridgeObjectRelease_n();
}

SiriKitRuntime::UserIdentityClassification_optional __swiftcall UserIdentityClassification.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  void *object;
  Swift::String v3;
  char *v4;
  unint64_t v5;
  SiriKitRuntime::UserIdentityClassification_optional result;
  char v7;

  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  v4 = v1;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of UserIdentityClassification.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  v7 = 5;
  if (v5 < 5)
    v7 = v5;
  *v4 = v7;
  return result;
}

uint64_t UserIdentityClassification.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B4ED6E28 + 4 * byte_1B4EF2B50[*v0]))(0x6E656469666E6F63, 0xE900000000000074);
}

uint64_t sub_1B4ED6E28()
{
  return 0x6E776F6E6BLL;
}

uint64_t sub_1B4ED6E3C()
{
  return 0x31657275736E75;
}

uint64_t sub_1B4ED6E54()
{
  return 0x4E657275736E75;
}

uint64_t sub_1B4ED6E6C()
{
  return 0x6E776F6E6B6E75;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance UserIdentityClassification(char *a1)
{
  specialized == infix<A>(_:_:)(*a1);
}

void protocol witness for Hashable.hashValue.getter in conformance UserIdentityClassification()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  __asm { BR              X9 }
}

Swift::Int sub_1B4ED6EE0()
{
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance UserIdentityClassification()
{
  __asm { BR              X10 }
}

uint64_t sub_1B4ED6FA4()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance UserIdentityClassification()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  __asm { BR              X9 }
}

Swift::Int sub_1B4ED7060()
{
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

SiriKitRuntime::UserIdentityClassification_optional protocol witness for RawRepresentable.init(rawValue:) in conformance UserIdentityClassification(Swift::String *a1)
{
  return UserIdentityClassification.init(rawValue:)(*a1);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance UserIdentityClassification()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1B4ED7124 + 4 * byte_1B4EF2B64[*v0]))();
}

void sub_1B4ED7124(_QWORD *a1@<X8>)
{
  *a1 = 0x6E776F6E6BLL;
  a1[1] = 0xE500000000000000;
}

void sub_1B4ED713C(_QWORD *a1@<X8>)
{
  *a1 = 0x31657275736E75;
  a1[1] = 0xE700000000000000;
}

void sub_1B4ED7158(_QWORD *a1@<X8>)
{
  *a1 = 0x4E657275736E75;
  a1[1] = 0xE700000000000000;
}

void sub_1B4ED7174(_QWORD *a1@<X8>)
{
  *a1 = 0x6E776F6E6B6E75;
  a1[1] = 0xE700000000000000;
}

SiriKitRuntime::UserAttribute_optional __swiftcall UserAttribute.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  void *object;
  Swift::String v3;
  char *v4;
  Swift::Int v5;
  SiriKitRuntime::UserAttribute_optional result;
  char v7;

  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  v4 = v1;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of UserAttribute.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  if (v5 == 1)
    v7 = 1;
  else
    v7 = 2;
  if (!v5)
    v7 = 0;
  *v4 = v7;
  return result;
}

uint64_t UserAttribute.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x726564697374756FLL;
  else
    return 0x72656E776FLL;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UserAttribute(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance UserAttribute()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance UserAttribute()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UserAttribute()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

SiriKitRuntime::UserAttribute_optional protocol witness for RawRepresentable.init(rawValue:) in conformance UserAttribute(Swift::String *a1)
{
  return UserAttribute.init(rawValue:)(*a1);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance UserAttribute(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x72656E776FLL;
  if (*v1)
    v2 = 0x726564697374756FLL;
  v3 = 0xE500000000000000;
  if (*v1)
    v3 = 0xE800000000000000;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t static UserSpecificInfo.supportsSecureCoding.getter()
{
  swift_beginAccess();
  return static UserSpecificInfo.supportsSecureCoding;
}

uint64_t static UserSpecificInfo.supportsSecureCoding.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static UserSpecificInfo.supportsSecureCoding = a1;
  return result;
}

uint64_t (*static UserSpecificInfo.supportsSecureCoding.modify())()
{
  swift_beginAccess();
  return static AmbiguityFeatureFlags.forceEnabled.modify;
}

uint64_t UserSpecificInfo.userId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_userId);
  swift_bridgeObjectRetain();
  return v1;
}

void UserSpecificInfo.userIdentityClassification.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + OBJC_IVAR___SKEUserSpecificInfo_userIdentityClassification);
}

uint64_t UserSpecificInfo.rawVoiceIDScore.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_rawVoiceIDScore);
}

void UserSpecificInfo.userAttribute.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + OBJC_IVAR___SKEUserSpecificInfo_userAttribute);
}

uint64_t UserSpecificInfo.isFirstInteractionForUser.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_isFirstInteractionForUser);
}

uint64_t UserSpecificInfo.didSpeakerChange.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_didSpeakerChange);
}

uint64_t UserSpecificInfo.isOnlyUserInHome.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_isOnlyUserInHome);
}

uint64_t UserSpecificInfo.voiceProfilesInFlight.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_voiceProfilesInFlight);
}

uint64_t UserSpecificInfo.twentyFourHourTimeDisplay.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_twentyFourHourTimeDisplay);
}

uint64_t UserSpecificInfo.explicitContentAllowed.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_explicitContentAllowed);
}

uint64_t UserSpecificInfo.censorSpeech.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_censorSpeech);
}

uint64_t UserSpecificInfo.companionAssistantId.getter()
{
  return ConversationCommitResultXPC.reparseExecutionRequestID.getter(&OBJC_IVAR___SKEUserSpecificInfo_companionAssistantId);
}

void *UserSpecificInfo.meCard.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR___SKEUserSpecificInfo_meCard);
  v2 = v1;
  return v1;
}

uint64_t UserSpecificInfo.preferredLanguage.getter()
{
  return ConversationCommitResultXPC.reparseExecutionRequestID.getter(&OBJC_IVAR___SKEUserSpecificInfo_preferredLanguage);
}

uint64_t UserSpecificInfo.countryCode.getter()
{
  return ConversationCommitResultXPC.reparseExecutionRequestID.getter(&OBJC_IVAR___SKEUserSpecificInfo_countryCode);
}

uint64_t UserSpecificInfo.temperatureUnit.getter()
{
  return ConversationCommitResultXPC.reparseExecutionRequestID.getter(&OBJC_IVAR___SKEUserSpecificInfo_temperatureUnit);
}

uint64_t UserSpecificInfo.wasSpeechProfileUsedByASR.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_wasSpeechProfileUsedByASR);
}

unint64_t UserSpecificInfo.lowScoreThreshold.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_lowScoreThreshold) | ((unint64_t)*(unsigned __int8 *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_lowScoreThreshold + 4) << 32);
}

id UserSpecificInfo.__allocating_init(userId:userIdentityClassification:rawVoiceIDScore:userAttribute:isFirstInteractionForUser:didSpeakerChange:isOnlyUserInHome:voiceProfilesInFlight:twentyFourHourTimeDisplay:explicitContentAllowed:censorSpeech:wasSpeechProfileUsedByASR:companionAssistantId:meCard:preferredLanguage:countryCode:temperatureUnit:lowScoreThreshold:)(uint64_t a1, uint64_t a2, char *a3, int a4, char *a5, char a6, char a7, char a8, char a9, char a10, char a11, char a12, char a13, __int128 a14, __int128 a15, __int128 a16, __int128 a17, uint64_t a18, unint64_t a19)
{
  objc_class *v19;
  id v22;
  unint64_t v24;

  v22 = objc_allocWithZone(v19);
  v24 = a19 | ((HIDWORD(a19) & 1) << 32);
  return UserSpecificInfo.init(userId:userIdentityClassification:rawVoiceIDScore:userAttribute:isFirstInteractionForUser:didSpeakerChange:isOnlyUserInHome:voiceProfilesInFlight:twentyFourHourTimeDisplay:explicitContentAllowed:censorSpeech:wasSpeechProfileUsedByASR:companionAssistantId:meCard:preferredLanguage:countryCode:temperatureUnit:lowScoreThreshold:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, *((uint64_t *)&a14 + 1), a15, *((uint64_t *)&a15 + 1), a16, *((uint64_t *)&a16 + 1),
           a17,
           *((uint64_t *)&a17 + 1),
           a18,
           v24,
           SBYTE4(v24));
}

id UserSpecificInfo.init(userId:userIdentityClassification:rawVoiceIDScore:userAttribute:isFirstInteractionForUser:didSpeakerChange:isOnlyUserInHome:voiceProfilesInFlight:twentyFourHourTimeDisplay:explicitContentAllowed:censorSpeech:wasSpeechProfileUsedByASR:companionAssistantId:meCard:preferredLanguage:countryCode:temperatureUnit:lowScoreThreshold:)(uint64_t a1, uint64_t a2, char *a3, int a4, char *a5, char a6, char a7, char a8, char a9, char a10, char a11, char a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,char a24)
{
  _BYTE *v24;
  char v25;
  char v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  char *v32;
  objc_super v34;

  v25 = *a3;
  v26 = *a5;
  v24[OBJC_IVAR___SKEUserSpecificInfo____lazy_storage___isGroundingConditionallyNeeded] = 2;
  v27 = &v24[OBJC_IVAR___SKEUserSpecificInfo_userId];
  *v27 = a1;
  v27[1] = a2;
  v24[OBJC_IVAR___SKEUserSpecificInfo_userIdentityClassification] = v25;
  *(_DWORD *)&v24[OBJC_IVAR___SKEUserSpecificInfo_rawVoiceIDScore] = a4;
  v24[OBJC_IVAR___SKEUserSpecificInfo_userAttribute] = v26 & 1;
  v24[OBJC_IVAR___SKEUserSpecificInfo_isFirstInteractionForUser] = a6;
  v24[OBJC_IVAR___SKEUserSpecificInfo_didSpeakerChange] = a7;
  v24[OBJC_IVAR___SKEUserSpecificInfo_isOnlyUserInHome] = a8;
  v24[OBJC_IVAR___SKEUserSpecificInfo_explicitContentAllowed] = a11;
  v24[OBJC_IVAR___SKEUserSpecificInfo_censorSpeech] = a12;
  v24[OBJC_IVAR___SKEUserSpecificInfo_wasSpeechProfileUsedByASR] = a13;
  v28 = &v24[OBJC_IVAR___SKEUserSpecificInfo_companionAssistantId];
  *v28 = a14;
  v28[1] = a15;
  *(_QWORD *)&v24[OBJC_IVAR___SKEUserSpecificInfo_meCard] = a16;
  v24[OBJC_IVAR___SKEUserSpecificInfo_voiceProfilesInFlight] = a9;
  v24[OBJC_IVAR___SKEUserSpecificInfo_twentyFourHourTimeDisplay] = a10;
  v29 = &v24[OBJC_IVAR___SKEUserSpecificInfo_preferredLanguage];
  *v29 = a17;
  v29[1] = a18;
  v30 = &v24[OBJC_IVAR___SKEUserSpecificInfo_countryCode];
  *v30 = a19;
  v30[1] = a20;
  v31 = &v24[OBJC_IVAR___SKEUserSpecificInfo_temperatureUnit];
  *v31 = a21;
  v31[1] = a22;
  v32 = &v24[OBJC_IVAR___SKEUserSpecificInfo_lowScoreThreshold];
  *(_DWORD *)v32 = a23;
  v32[4] = a24 & 1;
  v34.receiver = v24;
  v34.super_class = (Class)type metadata accessor for UserSpecificInfo();
  return objc_msgSendSuper2(&v34, sel_init);
}

uint64_t type metadata accessor for UserSpecificInfo()
{
  return objc_opt_self();
}

id UserSpecificInfo.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return UserSpecificInfo.init(coder:)(a1);
}

id UserSpecificInfo.init(coder:)(void *a1)
{
  _BYTE *v1;
  char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  Swift::String v11;
  void *v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  Swift::String v19;
  Swift::Int v20;
  char v21;
  id v22;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  void *v35;
  unsigned int v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char **v43;
  uint64_t *v44;
  void *v45;
  unsigned int v46;
  uint64_t v47;
  void *v48;
  unsigned int v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t *v56;
  void *v57;
  unsigned int v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t *v65;
  void *v66;
  unsigned int v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t *v74;
  void *v75;
  unsigned int v76;
  void *v77;
  unsigned int v78;
  char *v79;
  void *v80;
  objc_super v81;
  char v82;

  v1[OBJC_IVAR___SKEUserSpecificInfo____lazy_storage___isGroundingConditionallyNeeded] = 2;
  type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for NSString);
  v3 = v1;
  v4 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v4)
  {

LABEL_14:
    type metadata accessor for UserSpecificInfo();
    swift_deallocPartialClassInstance();
    return 0;
  }
  v5 = (void *)v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = (uint64_t *)&v3[OBJC_IVAR___SKEUserSpecificInfo_userId];
  *v7 = v6;
  v7[1] = v8;
  v9 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v9)
  {

LABEL_12:
    goto LABEL_13;
  }
  v10 = (void *)v9;
  v11._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  UserIdentityClassification.init(rawValue:)(v11);
  if (v82 == 5)
  {

LABEL_13:
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  v3[OBJC_IVAR___SKEUserSpecificInfo_userIdentityClassification] = v82;
  v12 = (void *)MEMORY[0x1B5E432E8](0x6563696F56776172, 0xEF65726F63534449);
  v13 = objc_msgSend(a1, sel_decodeInt32ForKey_, v12);

  *(_DWORD *)&v3[OBJC_IVAR___SKEUserSpecificInfo_rawVoiceIDScore] = v13;
  v14 = (void *)MEMORY[0x1B5E432E8](0xD000000000000019, 0x80000001B4F05500);
  LOBYTE(v13) = objc_msgSend(a1, sel_decodeBoolForKey_, v14);

  v3[OBJC_IVAR___SKEUserSpecificInfo_isFirstInteractionForUser] = v13;
  v15 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v15)
  {

    goto LABEL_12;
  }
  v80 = (void *)v15;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v18 = v17;
  v19._countAndFlagsBits = v16;
  v19._object = v18;
  v20 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of UserSpecificInfo.init(coder:), v19);
  swift_bridgeObjectRelease();
  if (v20)
  {
    if (v20 != 1)
    {

      goto LABEL_13;
    }
    v21 = 1;
  }
  else
  {
    v21 = 0;
  }
  v3[OBJC_IVAR___SKEUserSpecificInfo_userAttribute] = v21;
  v24 = (void *)MEMORY[0x1B5E432E8](0xD000000000000010, 0x80000001B4F05520);
  v25 = objc_msgSend(a1, (SEL)&selRef_firstName, v24);

  v3[OBJC_IVAR___SKEUserSpecificInfo_didSpeakerChange] = v25;
  v26 = (void *)MEMORY[0x1B5E432E8](0xD000000000000010, 0x80000001B4F05540);
  LOBYTE(v24) = objc_msgSend(a1, (SEL)&selRef_firstName, v26);

  v3[OBJC_IVAR___SKEUserSpecificInfo_isOnlyUserInHome] = (char)v24;
  v27 = (void *)MEMORY[0x1B5E432E8](0xD000000000000015, 0x80000001B4F05560);
  LOBYTE(v24) = objc_msgSend(a1, (SEL)&selRef_firstName, v27);

  v3[OBJC_IVAR___SKEUserSpecificInfo_voiceProfilesInFlight] = (char)v24;
  v28 = (void *)MEMORY[0x1B5E432E8](0xD000000000000019, 0x80000001B4F05580);
  v29 = objc_msgSend(a1, (SEL)&selRef_firstName, v28);

  v3[OBJC_IVAR___SKEUserSpecificInfo_twentyFourHourTimeDisplay] = v29;
  v30 = (void *)MEMORY[0x1B5E432E8](0xD000000000000016, 0x80000001B4F055A0);
  v31 = objc_msgSend(a1, (SEL)&selRef_firstName, v30);

  v3[OBJC_IVAR___SKEUserSpecificInfo_explicitContentAllowed] = v31;
  v32 = (void *)MEMORY[0x1B5E432E8](0x7053726F736E6563, 0xEC00000068636565);
  v33 = objc_msgSend(a1, (SEL)&selRef_firstName, v32);

  v3[OBJC_IVAR___SKEUserSpecificInfo_censorSpeech] = v33;
  v34 = (void *)MEMORY[0x1B5E432E8](0xD000000000000019, 0x80000001B4F055C0);
  LOBYTE(v24) = objc_msgSend(a1, (SEL)&selRef_firstName, v34);

  v3[OBJC_IVAR___SKEUserSpecificInfo_wasSpeechProfileUsedByASR] = (char)v24;
  v35 = (void *)MEMORY[0x1B5E432E8](0xD000000000000014, 0x80000001B4F055E0);
  v36 = objc_msgSend(a1, sel_containsValueForKey_, v35);

  if (v36)
  {
    v37 = NSCoder.decodeObject<A>(of:forKey:)();
    if (v37)
    {
      v38 = (void *)v37;
      v39 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v41 = v40;

    }
    else
    {
      v39 = 0;
      v41 = 0;
    }
    v43 = &selRef_reason;
    v44 = (uint64_t *)&v3[OBJC_IVAR___SKEUserSpecificInfo_companionAssistantId];
    *v44 = v39;
    v44[1] = v41;
  }
  else
  {
    v42 = &v3[OBJC_IVAR___SKEUserSpecificInfo_companionAssistantId];
    *(_QWORD *)v42 = 0;
    *((_QWORD *)v42 + 1) = 0;
    v43 = &selRef_reason;
  }
  v45 = (void *)MEMORY[0x1B5E432E8](0x64726143656DLL, 0xE600000000000000);
  v46 = objc_msgSend(a1, v43[86], v45);

  if (v46)
  {
    type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for SAPerson);
    v47 = NSCoder.decodeObject<A>(of:forKey:)();
  }
  else
  {
    v47 = 0;
  }
  *(_QWORD *)&v3[OBJC_IVAR___SKEUserSpecificInfo_meCard] = v47;
  v48 = (void *)MEMORY[0x1B5E432E8](0xD000000000000011, 0x80000001B4F05600);
  v49 = objc_msgSend(a1, v43[86], v48);

  if (v49)
  {
    v50 = NSCoder.decodeObject<A>(of:forKey:)();
    if (v50)
    {
      v51 = (void *)v50;
      v52 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v54 = v53;

    }
    else
    {
      v52 = 0;
      v54 = 0;
    }
    v56 = (uint64_t *)&v3[OBJC_IVAR___SKEUserSpecificInfo_preferredLanguage];
    *v56 = v52;
    v56[1] = v54;
    v43 = &selRef_reason;
  }
  else
  {
    v55 = &v3[OBJC_IVAR___SKEUserSpecificInfo_preferredLanguage];
    *(_QWORD *)v55 = 0;
    *((_QWORD *)v55 + 1) = 0;
  }
  v57 = (void *)MEMORY[0x1B5E432E8](0x437972746E756F63, 0xEB0000000065646FLL);
  v58 = objc_msgSend(a1, v43[86], v57);

  if (v58)
  {
    v59 = NSCoder.decodeObject<A>(of:forKey:)();
    if (v59)
    {
      v60 = (void *)v59;
      v61 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v63 = v62;

    }
    else
    {
      v61 = 0;
      v63 = 0;
    }
    v65 = (uint64_t *)&v3[OBJC_IVAR___SKEUserSpecificInfo_countryCode];
    *v65 = v61;
    v65[1] = v63;
    v43 = &selRef_reason;
  }
  else
  {
    v64 = &v3[OBJC_IVAR___SKEUserSpecificInfo_countryCode];
    *(_QWORD *)v64 = 0;
    *((_QWORD *)v64 + 1) = 0;
  }
  v66 = (void *)MEMORY[0x1B5E432E8](0x74617265706D6574, 0xEF74696E55657275);
  v67 = objc_msgSend(a1, v43[86], v66);

  if (v67)
  {
    v68 = NSCoder.decodeObject<A>(of:forKey:)();
    if (v68)
    {
      v69 = (void *)v68;
      v70 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v72 = v71;

    }
    else
    {
      v70 = 0;
      v72 = 0;
    }
    v74 = (uint64_t *)&v3[OBJC_IVAR___SKEUserSpecificInfo_temperatureUnit];
    *v74 = v70;
    v74[1] = v72;
  }
  else
  {
    v73 = &v3[OBJC_IVAR___SKEUserSpecificInfo_temperatureUnit];
    *(_QWORD *)v73 = 0;
    *((_QWORD *)v73 + 1) = 0;
  }
  v75 = (void *)MEMORY[0x1B5E432E8](0xD000000000000011, 0x80000001B4F00860);
  v76 = objc_msgSend(a1, v43[86], v75);

  if (v76)
  {
    v77 = (void *)MEMORY[0x1B5E432E8](0xD000000000000011, 0x80000001B4F00860);
    v78 = objc_msgSend(a1, sel_decodeInt32ForKey_, v77, v80);

  }
  else
  {
    v78 = 0;
  }

  v79 = &v3[OBJC_IVAR___SKEUserSpecificInfo_lowScoreThreshold];
  *(_DWORD *)v79 = v78;
  v79[4] = v76 ^ 1;

  v81.receiver = v3;
  v81.super_class = (Class)type metadata accessor for UserSpecificInfo();
  v22 = objc_msgSendSuper2(&v81, sel_init);

  return v22;
}

Swift::Void __swiftcall UserSpecificInfo.encode(with:)(NSCoder with)
{
  uint64_t v1;
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1B5E432E8](*(_QWORD *)(v1 + OBJC_IVAR___SKEUserSpecificInfo_userId), *(_QWORD *)(v1 + OBJC_IVAR___SKEUserSpecificInfo_userId + 8));
  v4 = (void *)MEMORY[0x1B5E432E8](0x644972657375, 0xE600000000000000);
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v3, v4);

  __asm { BR              X10 }
}

void sub_1B4ED82B4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;

  v25 = (void *)MEMORY[0x1B5E432E8](0x6E776F6E6BLL, 0xE500000000000000);
  swift_bridgeObjectRelease();
  v26 = (void *)MEMORY[0x1B5E432E8](0xD00000000000001ALL, 0x80000001B4F054E0);
  objc_msgSend(v22, *(SEL *)(v24 + 272), v25, v26);

  v27 = *(unsigned int *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_rawVoiceIDScore);
  v28 = (void *)MEMORY[0x1B5E432E8](0x6563696F56776172, 0xEF65726F63534449);
  objc_msgSend(v22, sel_encodeInt32_forKey_, v27, v28);

  v29 = *(unsigned __int8 *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_isFirstInteractionForUser);
  v30 = (void *)MEMORY[0x1B5E432E8](0xD000000000000019, 0x80000001B4F05500);
  objc_msgSend(v22, sel_encodeBool_forKey_, v29, v30);

  if (*(_BYTE *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_userAttribute))
    v31 = 0x726564697374756FLL;
  else
    v31 = 0x72656E776FLL;
  if (*(_BYTE *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_userAttribute))
    v32 = 0xE800000000000000;
  else
    v32 = 0xE500000000000000;
  v33 = (void *)MEMORY[0x1B5E432E8](v31, v32);
  swift_bridgeObjectRelease();
  v34 = (void *)MEMORY[0x1B5E432E8](0x7274744172657375, 0xED00006574756269);
  objc_msgSend(v22, *(SEL *)(v24 + 272), v33, v34);

  v35 = *(unsigned __int8 *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_didSpeakerChange);
  v36 = (void *)MEMORY[0x1B5E432E8](0xD000000000000010, 0x80000001B4F05520);
  objc_msgSend(v22, sel_encodeBool_forKey_, v35, v36);

  v37 = *(unsigned __int8 *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_isOnlyUserInHome);
  v38 = (void *)MEMORY[0x1B5E432E8](0xD000000000000010, 0x80000001B4F05540);
  objc_msgSend(v22, sel_encodeBool_forKey_, v37, v38);

  v39 = *(unsigned __int8 *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_voiceProfilesInFlight);
  v40 = (void *)MEMORY[0x1B5E432E8](0xD000000000000015, 0x80000001B4F05560);
  objc_msgSend(v22, sel_encodeBool_forKey_, v39, v40);

  v41 = *(unsigned __int8 *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_twentyFourHourTimeDisplay);
  v42 = (void *)MEMORY[0x1B5E432E8](0xD000000000000019, 0x80000001B4F05580);
  objc_msgSend(v22, sel_encodeBool_forKey_, v41, v42);

  v43 = *(unsigned __int8 *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_explicitContentAllowed);
  v44 = (void *)MEMORY[0x1B5E432E8](0xD000000000000016, 0x80000001B4F055A0);
  objc_msgSend(v22, sel_encodeBool_forKey_, v43, v44);

  v45 = *(unsigned __int8 *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_censorSpeech);
  v46 = (void *)MEMORY[0x1B5E432E8](0x7053726F736E6563, 0xEC00000068636565);
  objc_msgSend(v22, sel_encodeBool_forKey_, v45, v46);

  v47 = *(unsigned __int8 *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_wasSpeechProfileUsedByASR);
  v48 = (void *)MEMORY[0x1B5E432E8](0xD000000000000019, 0x80000001B4F055C0);
  objc_msgSend(v22, sel_encodeBool_forKey_, v47, v48);

  if (*(_QWORD *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_companionAssistantId + 8))
  {
    v49 = (void *)MEMORY[0x1B5E432E8](*(_QWORD *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_companionAssistantId));
    v50 = (void *)MEMORY[0x1B5E432E8](0xD000000000000014, 0x80000001B4F055E0);
    objc_msgSend(v22, *(SEL *)(v24 + 272), v49, v50);

  }
  v51 = *(void **)(v23 + OBJC_IVAR___SKEUserSpecificInfo_meCard);
  if (v51)
  {
    v52 = v51;
    v53 = (void *)MEMORY[0x1B5E432E8](0x64726143656DLL, 0xE600000000000000);
    objc_msgSend(v22, *(SEL *)(v24 + 272), v52, v53);

  }
  if (*(_QWORD *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_preferredLanguage + 8))
  {
    v54 = (void *)MEMORY[0x1B5E432E8](*(_QWORD *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_preferredLanguage));
    v55 = (void *)MEMORY[0x1B5E432E8](0xD000000000000011, 0x80000001B4F05600);
    objc_msgSend(v22, *(SEL *)(v24 + 272), v54, v55);

  }
  if (*(_QWORD *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_countryCode + 8))
  {
    v56 = (void *)MEMORY[0x1B5E432E8](*(_QWORD *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_countryCode));
    v57 = (void *)MEMORY[0x1B5E432E8](0x437972746E756F63, 0xEB0000000065646FLL);
    objc_msgSend(v22, *(SEL *)(v24 + 272), v56, v57);

  }
  if (*(_QWORD *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_temperatureUnit + 8))
  {
    v58 = (void *)MEMORY[0x1B5E432E8](*(_QWORD *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_temperatureUnit));
    v59 = (void *)MEMORY[0x1B5E432E8](0x74617265706D6574, 0xEF74696E55657275);
    objc_msgSend(v22, *(SEL *)(v24 + 272), v58, v59);

  }
  if ((*(_BYTE *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_lowScoreThreshold + 4) & 1) == 0)
  {
    v60 = *(unsigned int *)(v23 + OBJC_IVAR___SKEUserSpecificInfo_lowScoreThreshold);
    v61 = (void *)MEMORY[0x1B5E432E8](0xD000000000000011, 0x80000001B4F00860);
    objc_msgSend(v22, sel_encodeInt32_forKey_, v60, v61);

  }
}

uint64_t UserSpecificInfo.isGroundingConditionallyNeeded.getter()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  char v3;

  v1 = OBJC_IVAR___SKEUserSpecificInfo____lazy_storage___isGroundingConditionallyNeeded;
  v2 = *(unsigned __int8 *)(v0 + OBJC_IVAR___SKEUserSpecificInfo____lazy_storage___isGroundingConditionallyNeeded);
  if (v2 == 2)
  {
    v3 = closure #1 in UserSpecificInfo.isGroundingConditionallyNeeded.getter(v0);
    *(_BYTE *)(v0 + v1) = v3 & 1;
  }
  else
  {
    v3 = v2 & 1;
  }
  return v3 & 1;
}

uint64_t closure #1 in UserSpecificInfo.isGroundingConditionallyNeeded.getter(uint64_t a1)
{
  int v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  const char *v6;
  uint64_t v7;

  v1 = *(unsigned __int8 *)(a1 + OBJC_IVAR___SKEUserSpecificInfo_isOnlyUserInHome);
  if (v1 == 1)
  {
    if (one-time initialization token for executor != -1)
      swift_once();
    v2 = type metadata accessor for Logger();
    __swift_project_value_buffer(v2, (uint64_t)static Logger.executor);
    v3 = Logger.logObject.getter();
    v4 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      v6 = "isGroundingConditionallyNeeded: false: Only user in home";
LABEL_10:
      _os_log_impl(&dword_1B4BE6000, v3, v4, v6, v5, 2u);
      MEMORY[0x1B5E44758](v5, -1, -1);
    }
  }
  else
  {
    if (one-time initialization token for executor != -1)
      swift_once();
    v7 = type metadata accessor for Logger();
    __swift_project_value_buffer(v7, (uint64_t)static Logger.executor);
    v3 = Logger.logObject.getter();
    v4 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      v6 = "isGroundingConditionallyNeeded: true, DialogEngine will determine if grounding is needed";
      goto LABEL_10;
    }
  }

  return v1 ^ 1u;
}

uint64_t UserSpecificInfo.isGroundingConditionallyNeeded.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + OBJC_IVAR___SKEUserSpecificInfo____lazy_storage___isGroundingConditionallyNeeded) = result;
  return result;
}

uint64_t (*UserSpecificInfo.isGroundingConditionallyNeeded.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = UserSpecificInfo.isGroundingConditionallyNeeded.getter() & 1;
  return UserSpecificInfo.isGroundingConditionallyNeeded.modify;
}

uint64_t UserSpecificInfo.isGroundingConditionallyNeeded.modify(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)result + OBJC_IVAR___SKEUserSpecificInfo____lazy_storage___isGroundingConditionallyNeeded) = *(_BYTE *)(result + 8);
  return result;
}

uint64_t UserSpecificInfo.isEqual(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  char v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  char v26;
  int v27;
  _BYTE *v28;
  _BYTE v29[24];
  uint64_t v30;

  v2 = v1;
  outlined init with copy of Any?(a1, (uint64_t)v29);
  if (!v30)
  {
    outlined destroy of Any?((uint64_t)v29);
    return 0;
  }
  type metadata accessor for UserSpecificInfo();
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  v3 = *(_QWORD *)(v1 + OBJC_IVAR___SKEUserSpecificInfo_userId) == *(_QWORD *)&v28[OBJC_IVAR___SKEUserSpecificInfo_userId]
    && *(_QWORD *)(v1 + OBJC_IVAR___SKEUserSpecificInfo_userId + 8) == *(_QWORD *)&v28[OBJC_IVAR___SKEUserSpecificInfo_userId
                                                                                     + 8];
  if (!v3 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    goto LABEL_35;
  specialized == infix<A>(_:_:)(*(_BYTE *)(v1 + OBJC_IVAR___SKEUserSpecificInfo_userIdentityClassification));
  if ((v4 & 1) == 0
    || *(_DWORD *)(v1 + OBJC_IVAR___SKEUserSpecificInfo_rawVoiceIDScore) != *(_DWORD *)&v28[OBJC_IVAR___SKEUserSpecificInfo_rawVoiceIDScore]
    || *(unsigned __int8 *)(v1 + OBJC_IVAR___SKEUserSpecificInfo_isFirstInteractionForUser) != v28[OBJC_IVAR___SKEUserSpecificInfo_isFirstInteractionForUser])
  {
    goto LABEL_35;
  }
  if (*(_BYTE *)(v1 + OBJC_IVAR___SKEUserSpecificInfo_userAttribute))
    v5 = 0x726564697374756FLL;
  else
    v5 = 0x72656E776FLL;
  if (*(_BYTE *)(v1 + OBJC_IVAR___SKEUserSpecificInfo_userAttribute))
    v6 = 0xE800000000000000;
  else
    v6 = 0xE500000000000000;
  if (v28[OBJC_IVAR___SKEUserSpecificInfo_userAttribute])
    v7 = 0x726564697374756FLL;
  else
    v7 = 0x72656E776FLL;
  if (v28[OBJC_IVAR___SKEUserSpecificInfo_userAttribute])
    v8 = 0xE800000000000000;
  else
    v8 = 0xE500000000000000;
  if (v5 == v7 && v6 == v8)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
      goto LABEL_35;
  }
  if (*(unsigned __int8 *)(v2 + OBJC_IVAR___SKEUserSpecificInfo_didSpeakerChange) != v28[OBJC_IVAR___SKEUserSpecificInfo_didSpeakerChange]
    || *(unsigned __int8 *)(v2 + OBJC_IVAR___SKEUserSpecificInfo_isOnlyUserInHome) != v28[OBJC_IVAR___SKEUserSpecificInfo_isOnlyUserInHome]
    || *(unsigned __int8 *)(v2 + OBJC_IVAR___SKEUserSpecificInfo_voiceProfilesInFlight) != v28[OBJC_IVAR___SKEUserSpecificInfo_voiceProfilesInFlight]
    || *(unsigned __int8 *)(v2 + OBJC_IVAR___SKEUserSpecificInfo_twentyFourHourTimeDisplay) != v28[OBJC_IVAR___SKEUserSpecificInfo_twentyFourHourTimeDisplay]
    || *(unsigned __int8 *)(v2 + OBJC_IVAR___SKEUserSpecificInfo_explicitContentAllowed) != v28[OBJC_IVAR___SKEUserSpecificInfo_explicitContentAllowed]
    || *(unsigned __int8 *)(v2 + OBJC_IVAR___SKEUserSpecificInfo_censorSpeech) != v28[OBJC_IVAR___SKEUserSpecificInfo_censorSpeech]
    || *(unsigned __int8 *)(v2 + OBJC_IVAR___SKEUserSpecificInfo_wasSpeechProfileUsedByASR) != v28[OBJC_IVAR___SKEUserSpecificInfo_wasSpeechProfileUsedByASR])
  {
    goto LABEL_35;
  }
  v12 = *(_QWORD *)(v2 + OBJC_IVAR___SKEUserSpecificInfo_companionAssistantId + 8);
  v13 = *(_QWORD *)&v28[OBJC_IVAR___SKEUserSpecificInfo_companionAssistantId + 8];
  if (v12)
  {
    if (!v13
      || (*(_QWORD *)(v2 + OBJC_IVAR___SKEUserSpecificInfo_companionAssistantId) != *(_QWORD *)&v28[OBJC_IVAR___SKEUserSpecificInfo_companionAssistantId]
       || v12 != v13)
      && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      goto LABEL_35;
    }
  }
  else if (v13)
  {
    goto LABEL_35;
  }
  v14 = *(void **)(v2 + OBJC_IVAR___SKEUserSpecificInfo_meCard);
  v15 = *(void **)&v28[OBJC_IVAR___SKEUserSpecificInfo_meCard];
  if (v14)
  {
    if (!v15)
      goto LABEL_35;
    type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for SAPerson);
    v16 = v15;
    v17 = v14;
    v18 = static NSObject.== infix(_:_:)();

    if ((v18 & 1) == 0)
      goto LABEL_35;
  }
  else if (v15)
  {
    goto LABEL_35;
  }
  v19 = *(_QWORD *)(v2 + OBJC_IVAR___SKEUserSpecificInfo_preferredLanguage + 8);
  v20 = *(_QWORD *)&v28[OBJC_IVAR___SKEUserSpecificInfo_preferredLanguage + 8];
  if (v19)
  {
    if (!v20
      || (*(_QWORD *)(v2 + OBJC_IVAR___SKEUserSpecificInfo_preferredLanguage) != *(_QWORD *)&v28[OBJC_IVAR___SKEUserSpecificInfo_preferredLanguage]
       || v19 != v20)
      && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      goto LABEL_35;
    }
  }
  else if (v20)
  {
    goto LABEL_35;
  }
  v21 = *(_QWORD *)(v2 + OBJC_IVAR___SKEUserSpecificInfo_countryCode + 8);
  v22 = *(_QWORD *)&v28[OBJC_IVAR___SKEUserSpecificInfo_countryCode + 8];
  if (v21)
  {
    if (!v22
      || (*(_QWORD *)(v2 + OBJC_IVAR___SKEUserSpecificInfo_countryCode) != *(_QWORD *)&v28[OBJC_IVAR___SKEUserSpecificInfo_countryCode]
       || v21 != v22)
      && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      goto LABEL_35;
    }
  }
  else if (v22)
  {
    goto LABEL_35;
  }
  v23 = *(_QWORD *)(v2 + OBJC_IVAR___SKEUserSpecificInfo_temperatureUnit + 8);
  v24 = *(_QWORD *)&v28[OBJC_IVAR___SKEUserSpecificInfo_temperatureUnit + 8];
  if (!v23)
  {
    if (!v24)
      goto LABEL_71;
LABEL_35:

    return 0;
  }
  if (!v24
    || (*(_QWORD *)(v2 + OBJC_IVAR___SKEUserSpecificInfo_temperatureUnit) != *(_QWORD *)&v28[OBJC_IVAR___SKEUserSpecificInfo_temperatureUnit]
     || v23 != v24)
    && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    goto LABEL_35;
  }
LABEL_71:
  v25 = *(_DWORD *)(v2 + OBJC_IVAR___SKEUserSpecificInfo_lowScoreThreshold);
  v26 = *(_BYTE *)(v2 + OBJC_IVAR___SKEUserSpecificInfo_lowScoreThreshold + 4);
  v27 = *(_DWORD *)&v28[OBJC_IVAR___SKEUserSpecificInfo_lowScoreThreshold];
  v10 = v28[OBJC_IVAR___SKEUserSpecificInfo_lowScoreThreshold + 4];

  if ((v26 & 1) == 0)
    return (v25 == v27) & ~(_DWORD)v10;
  return v10;
}

void UserSpecificInfo.debugDescription.getter()
{
  char *v0;
  char *v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  Swift::String v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  Swift::String v11;
  Swift::String v12;
  uint64_t v13;
  void *v14;
  Swift::String v15;
  objc_super v16;
  unint64_t v17;
  unint64_t v18;

  v1 = v0;
  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for UserSpecificInfo();
  v2 = objc_msgSendSuper2(&v16, sel_debugDescription);
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;

  v17 = v3;
  v18 = v5;
  v6._countAndFlagsBits = 31520;
  v6._object = (void *)0xE200000000000000;
  String.append(_:)(v6);
  v8 = v17;
  v7 = v18;
  v17 = 0x203A644972657375;
  v18 = 0xE800000000000000;
  v9 = *(_QWORD *)&v1[OBJC_IVAR___SKEUserSpecificInfo_userId];
  v10 = *(void **)&v1[OBJC_IVAR___SKEUserSpecificInfo_userId + 8];
  swift_bridgeObjectRetain();
  v11._countAndFlagsBits = v9;
  v11._object = v10;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 8236;
  v12._object = (void *)0xE200000000000000;
  String.append(_:)(v12);
  v13 = v17;
  v14 = (void *)v18;
  v17 = v8;
  v18 = v7;
  swift_bridgeObjectRetain();
  v15._countAndFlagsBits = v13;
  v15._object = v14;
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v17 = 0xD00000000000001CLL;
  v18 = 0x80000001B4F05620;
  __asm { BR              X10 }
}

uint64_t sub_1B4ED913C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;
  Swift::String v6;
  Swift::String v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  Swift::String v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  Swift::String v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  Swift::String v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  Swift::String v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  Swift::String v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  Swift::String v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  Swift::String v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  Swift::String v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  Swift::String v43;
  uint64_t v44;
  void *v45;
  Swift::String v46;
  Swift::String v47;
  Swift::String v48;
  Swift::String v49;
  Swift::String v50;
  uint64_t v51;
  void *v52;
  Swift::String v53;
  Swift::String v54;
  uint64_t v55;
  void *v56;
  Swift::String v57;
  Swift::String v58;
  uint64_t v59;
  void *v60;
  Swift::String v61;
  Swift::String v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  Swift::String v67;
  Swift::String v68;
  Swift::String v70[7];

  v3._countAndFlagsBits = 0x6E776F6E6BLL;
  v3._object = (void *)0xE500000000000000;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 8236;
  v4._object = (void *)0xE200000000000000;
  String.append(_:)(v4);
  swift_bridgeObjectRetain();
  String.append(_:)(v70[0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 8236;
  v6._object = (void *)0xE200000000000000;
  String.append(_:)(v6);
  swift_bridgeObjectRetain();
  v7._countAndFlagsBits = v2 - 10;
  v7._object = (void *)0x80000001B4F05640;
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v70[0]._countAndFlagsBits = 0xD00000000000001BLL;
  v70[0]._object = (void *)0x80000001B4F05660;
  if (*(_BYTE *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_isFirstInteractionForUser))
    v8 = 1702195828;
  else
    v8 = 0x65736C6166;
  if (*(_BYTE *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_isFirstInteractionForUser))
    v9 = 0xE400000000000000;
  else
    v9 = 0xE500000000000000;
  v10 = v9;
  String.append(_:)(*(Swift::String *)&v8);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 8236;
  v11._object = (void *)0xE200000000000000;
  String.append(_:)(v11);
  swift_bridgeObjectRetain();
  String.append(_:)(v70[0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v70[0]._countAndFlagsBits = 0x7274744172657375;
  v70[0]._object = (void *)0xEF203A6574756269;
  if (*(_BYTE *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_userAttribute))
    v12 = 0x726564697374756FLL;
  else
    v12 = 0x72656E776FLL;
  if (*(_BYTE *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_userAttribute))
    v13 = 0xE800000000000000;
  else
    v13 = 0xE500000000000000;
  v14 = v13;
  String.append(_:)(*(Swift::String *)&v12);
  swift_bridgeObjectRelease();
  v15._countAndFlagsBits = 8236;
  v15._object = (void *)0xE200000000000000;
  String.append(_:)(v15);
  swift_bridgeObjectRetain();
  String.append(_:)(v70[0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v70[0]._countAndFlagsBits = 0xD000000000000012;
  v70[0]._object = (void *)0x80000001B4F05680;
  if (*(_BYTE *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_didSpeakerChange))
    v16 = 1702195828;
  else
    v16 = 0x65736C6166;
  if (*(_BYTE *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_didSpeakerChange))
    v17 = 0xE400000000000000;
  else
    v17 = 0xE500000000000000;
  v18 = v17;
  String.append(_:)(*(Swift::String *)&v16);
  swift_bridgeObjectRelease();
  v19._countAndFlagsBits = 8236;
  v19._object = (void *)0xE200000000000000;
  String.append(_:)(v19);
  swift_bridgeObjectRetain();
  String.append(_:)(v70[0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v70[0]._countAndFlagsBits = 0xD000000000000012;
  v70[0]._object = (void *)0x80000001B4F056A0;
  if (*(_BYTE *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_isOnlyUserInHome))
    v20 = 1702195828;
  else
    v20 = 0x65736C6166;
  if (*(_BYTE *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_isOnlyUserInHome))
    v21 = 0xE400000000000000;
  else
    v21 = 0xE500000000000000;
  v22 = v21;
  String.append(_:)(*(Swift::String *)&v20);
  swift_bridgeObjectRelease();
  v23._countAndFlagsBits = 8236;
  v23._object = (void *)0xE200000000000000;
  String.append(_:)(v23);
  swift_bridgeObjectRetain();
  String.append(_:)(v70[0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v70[0]._countAndFlagsBits = 0xD000000000000017;
  v70[0]._object = (void *)0x80000001B4F056C0;
  if (*(_BYTE *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_voiceProfilesInFlight))
    v24 = 1702195828;
  else
    v24 = 0x65736C6166;
  if (*(_BYTE *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_voiceProfilesInFlight))
    v25 = 0xE400000000000000;
  else
    v25 = 0xE500000000000000;
  v26 = v25;
  String.append(_:)(*(Swift::String *)&v24);
  swift_bridgeObjectRelease();
  v27._countAndFlagsBits = 8236;
  v27._object = (void *)0xE200000000000000;
  String.append(_:)(v27);
  swift_bridgeObjectRetain();
  String.append(_:)(v70[0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v70[0]._countAndFlagsBits = 0xD00000000000001BLL;
  v70[0]._object = (void *)0x80000001B4F056E0;
  if (*(_BYTE *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_twentyFourHourTimeDisplay))
    v28 = 1702195828;
  else
    v28 = 0x65736C6166;
  if (*(_BYTE *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_twentyFourHourTimeDisplay))
    v29 = 0xE400000000000000;
  else
    v29 = 0xE500000000000000;
  v30 = v29;
  String.append(_:)(*(Swift::String *)&v28);
  swift_bridgeObjectRelease();
  v31._countAndFlagsBits = 8236;
  v31._object = (void *)0xE200000000000000;
  String.append(_:)(v31);
  swift_bridgeObjectRetain();
  String.append(_:)(v70[0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v70[0]._countAndFlagsBits = 0xD000000000000018;
  v70[0]._object = (void *)0x80000001B4F05700;
  if (*(_BYTE *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_explicitContentAllowed))
    v32 = 1702195828;
  else
    v32 = 0x65736C6166;
  if (*(_BYTE *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_explicitContentAllowed))
    v33 = 0xE400000000000000;
  else
    v33 = 0xE500000000000000;
  v34 = v33;
  String.append(_:)(*(Swift::String *)&v32);
  swift_bridgeObjectRelease();
  v35._countAndFlagsBits = 8236;
  v35._object = (void *)0xE200000000000000;
  String.append(_:)(v35);
  swift_bridgeObjectRetain();
  String.append(_:)(v70[0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  strcpy((char *)v70, "censorSpeech: ");
  HIBYTE(v70[0]._object) = -18;
  if (*(_BYTE *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_censorSpeech))
    v36 = 1702195828;
  else
    v36 = 0x65736C6166;
  if (*(_BYTE *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_censorSpeech))
    v37 = 0xE400000000000000;
  else
    v37 = 0xE500000000000000;
  v38 = v37;
  String.append(_:)(*(Swift::String *)&v36);
  swift_bridgeObjectRelease();
  v39._countAndFlagsBits = 8236;
  v39._object = (void *)0xE200000000000000;
  String.append(_:)(v39);
  swift_bridgeObjectRetain();
  String.append(_:)(v70[0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v70[0]._countAndFlagsBits = 0xD00000000000001BLL;
  v70[0]._object = (void *)0x80000001B4F05720;
  if (*(_BYTE *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_wasSpeechProfileUsedByASR))
    v40 = 1702195828;
  else
    v40 = 0x65736C6166;
  if (*(_BYTE *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_wasSpeechProfileUsedByASR))
    v41 = 0xE400000000000000;
  else
    v41 = 0xE500000000000000;
  v42 = v41;
  String.append(_:)(*(Swift::String *)&v40);
  swift_bridgeObjectRelease();
  v43._countAndFlagsBits = 8236;
  v43._object = (void *)0xE200000000000000;
  String.append(_:)(v43);
  swift_bridgeObjectRetain();
  String.append(_:)(v70[0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v70[0]._countAndFlagsBits = 0xD000000000000016;
  v70[0]._object = (void *)0x80000001B4F05740;
  if (*(_QWORD *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_companionAssistantId + 8))
  {
    v44 = *(_QWORD *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_companionAssistantId);
    v45 = *(void **)(v0 + OBJC_IVAR___SKEUserSpecificInfo_companionAssistantId + 8);
  }
  else
  {
    v45 = (void *)0xE300000000000000;
    v44 = 7104878;
  }
  swift_bridgeObjectRetain();
  v46._countAndFlagsBits = v44;
  v46._object = v45;
  String.append(_:)(v46);
  swift_bridgeObjectRelease();
  v47._countAndFlagsBits = 8236;
  v47._object = (void *)0xE200000000000000;
  String.append(_:)(v47);
  swift_bridgeObjectRetain();
  String.append(_:)(v70[0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SAPerson?);
  v48._countAndFlagsBits = Optional.debugDescription.getter();
  String.append(_:)(v48);
  swift_bridgeObjectRelease();
  v49._countAndFlagsBits = 8236;
  v49._object = (void *)0xE200000000000000;
  String.append(_:)(v49);
  swift_bridgeObjectRetain();
  v50._countAndFlagsBits = 0x203A64726143656DLL;
  v50._object = (void *)0xE800000000000000;
  String.append(_:)(v50);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v70[0]._countAndFlagsBits = 0xD000000000000013;
  v70[0]._object = (void *)0x80000001B4F05760;
  if (*(_QWORD *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_preferredLanguage + 8))
  {
    v51 = *(_QWORD *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_preferredLanguage);
    v52 = *(void **)(v0 + OBJC_IVAR___SKEUserSpecificInfo_preferredLanguage + 8);
  }
  else
  {
    v52 = (void *)0xE300000000000000;
    v51 = 7104878;
  }
  swift_bridgeObjectRetain();
  v53._countAndFlagsBits = v51;
  v53._object = v52;
  String.append(_:)(v53);
  swift_bridgeObjectRelease();
  v54._countAndFlagsBits = 8236;
  v54._object = (void *)0xE200000000000000;
  String.append(_:)(v54);
  swift_bridgeObjectRetain();
  String.append(_:)(v70[0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  strcpy((char *)v70, "countryCode: ");
  HIWORD(v70[0]._object) = -4864;
  if (*(_QWORD *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_countryCode + 8))
  {
    v55 = *(_QWORD *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_countryCode);
    v56 = *(void **)(v0 + OBJC_IVAR___SKEUserSpecificInfo_countryCode + 8);
  }
  else
  {
    v56 = (void *)0xE300000000000000;
    v55 = 7104878;
  }
  swift_bridgeObjectRetain();
  v57._countAndFlagsBits = v55;
  v57._object = v56;
  String.append(_:)(v57);
  swift_bridgeObjectRelease();
  v58._countAndFlagsBits = 8236;
  v58._object = (void *)0xE200000000000000;
  String.append(_:)(v58);
  swift_bridgeObjectRetain();
  String.append(_:)(v70[0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v70[0]._countAndFlagsBits = v2 - 10;
  v70[0]._object = (void *)0x80000001B4F05780;
  if (*(_QWORD *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_temperatureUnit + 8))
  {
    v59 = *(_QWORD *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_temperatureUnit);
    v60 = *(void **)(v0 + OBJC_IVAR___SKEUserSpecificInfo_temperatureUnit + 8);
  }
  else
  {
    v60 = (void *)0xE300000000000000;
    v59 = 7104878;
  }
  swift_bridgeObjectRetain();
  v61._countAndFlagsBits = v59;
  v61._object = v60;
  String.append(_:)(v61);
  swift_bridgeObjectRelease();
  v62._countAndFlagsBits = 32;
  v62._object = (void *)0xE100000000000000;
  String.append(_:)(v62);
  swift_bridgeObjectRetain();
  String.append(_:)(v70[0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v70[0]._countAndFlagsBits = 0xD000000000000013;
  v70[0]._object = (void *)0x80000001B4F057A0;
  if ((*(_BYTE *)(v0 + OBJC_IVAR___SKEUserSpecificInfo_lowScoreThreshold + 4) & 1) != 0)
  {
    v63 = 0xE300000000000000;
    v64 = 7104878;
  }
  else
  {
    lazy protocol witness table accessor for type Int32 and conformance Int32();
    v64 = BinaryInteger.description.getter();
    v63 = v65;
  }
  v66 = v63;
  String.append(_:)(*(Swift::String *)&v64);
  swift_bridgeObjectRelease();
  v67._countAndFlagsBits = 32;
  v67._object = (void *)0xE100000000000000;
  String.append(_:)(v67);
  swift_bridgeObjectRetain();
  String.append(_:)(v70[0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v68._countAndFlagsBits = 125;
  v68._object = (void *)0xE100000000000000;
  String.append(_:)(v68);
  swift_bridgeObjectRelease();
  return v1;
}

unint64_t lazy protocol witness table accessor for type Int32 and conformance Int32()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    result = MEMORY[0x1B5E44668](MEMORY[0x1E0DEDC00], MEMORY[0x1E0DEDBC8]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
  }
  return result;
}

id UserSpecificInfo.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void UserSpecificInfo.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id UserSpecificInfo.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserSpecificInfo();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t lazy protocol witness table accessor for type UserIdentityClassification and conformance UserIdentityClassification()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UserIdentityClassification and conformance UserIdentityClassification;
  if (!lazy protocol witness table cache variable for type UserIdentityClassification and conformance UserIdentityClassification)
  {
    result = MEMORY[0x1B5E44668](&protocol conformance descriptor for UserIdentityClassification, &type metadata for UserIdentityClassification);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UserIdentityClassification and conformance UserIdentityClassification);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UserAttribute and conformance UserAttribute()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UserAttribute and conformance UserAttribute;
  if (!lazy protocol witness table cache variable for type UserAttribute and conformance UserAttribute)
  {
    result = MEMORY[0x1B5E44668](&protocol conformance descriptor for UserAttribute, &type metadata for UserAttribute);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UserAttribute and conformance UserAttribute);
  }
  return result;
}

uint64_t sub_1B4ED9DA0@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x100))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B4ED9DE4(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x108))(*a1);
}

uint64_t storeEnumTagSinglePayload for UserIdentityClassification(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B4ED9E6C + 4 * byte_1B4EF2B73[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1B4ED9EA0 + 4 * byte_1B4EF2B6E[v4]))();
}

uint64_t sub_1B4ED9EA0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B4ED9EA8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B4ED9EB0);
  return result;
}

uint64_t sub_1B4ED9EBC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B4ED9EC4);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1B4ED9EC8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B4ED9ED0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UserIdentityClassification()
{
  return &type metadata for UserIdentityClassification;
}

uint64_t storeEnumTagSinglePayload for UserAttribute(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B4ED9F38 + 4 * byte_1B4EF2B7D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B4ED9F6C + 4 * byte_1B4EF2B78[v4]))();
}

uint64_t sub_1B4ED9F6C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B4ED9F74(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B4ED9F7CLL);
  return result;
}

uint64_t sub_1B4ED9F88(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B4ED9F90);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B4ED9F94(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B4ED9F9C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UserAttribute()
{
  return &type metadata for UserAttribute;
}

uint64_t method lookup function for UserSpecificInfo()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UserSpecificInfo.__allocating_init(userId:userIdentityClassification:rawVoiceIDScore:userAttribute:isFirstInteractionForUser:didSpeakerChange:isOnlyUserInHome:voiceProfilesInFlight:twentyFourHourTimeDisplay:explicitContentAllowed:censorSpeech:wasSpeechProfileUsedByASR:companionAssistantId:meCard:preferredLanguage:countryCode:temperatureUnit:lowScoreThreshold:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 232))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

uint64_t dispatch thunk of UserSpecificInfo.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of UserSpecificInfo.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of UserSpecificInfo.isGroundingConditionallyNeeded.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of UserSpecificInfo.isGroundingConditionallyNeeded.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of UserSpecificInfo.isGroundingConditionallyNeeded.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t *ViewMetricsLogger.blockListDialogID.unsafeMutableAddressor()
{
  if (one-time initialization token for blockListDialogID != -1)
    swift_once();
  return &static ViewMetricsLogger.blockListDialogID;
}

uint64_t static ViewMetricsLogger.blockListDialogID.getter()
{
  if (one-time initialization token for blockListDialogID != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

id specialized static ViewMetricsLogger.getSparseAssistantUtteranceView(assistantUtteranceView:)(void *a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D88508]), sel_init);
  v3 = objc_msgSend(a1, sel_dialogIdentifier);
  objc_msgSend(v2, sel_setDialogIdentifier_, v3);

  v4 = objc_msgSend(a1, sel_dialogIdentifier);
  if (!v4)
    goto LABEL_10;
  v5 = v4;
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  if (one-time initialization token for blockListDialogID != -1)
    swift_once();
  v6 = static ViewMetricsLogger.blockListDialogID;
  v7 = *(_QWORD *)(static ViewMetricsLogger.blockListDialogID + 16);
  if (!v7)
  {
LABEL_9:
    swift_bridgeObjectRelease();
LABEL_10:
    v9 = v2;
    v10 = objc_msgSend(a1, sel_speakableText);
    objc_msgSend(v9, sel_setSpeakableText_, v10);

    v11 = objc_msgSend(a1, sel_text);
    objc_msgSend(v9, sel_setText_, v11);

    goto LABEL_11;
  }
  lazy protocol witness table accessor for type String and conformance String();
  swift_bridgeObjectRetain();
  v8 = v6 + 40;
  while ((StringProtocol.contains<A>(_:)() & 1) == 0)
  {
    v8 += 16;
    if (!--v7)
    {
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_11:
  v12 = v2;
  v13 = objc_msgSend(a1, sel_dialog);
  v14 = specialized static DialogMetricsLogger.getSparseDialog(_:)(v13);

  objc_msgSend(v12, sel_setDialog_, v14);
  return v12;
}

uint64_t specialized static ViewMetricsLogger.getSparseDisambiguationList(disambiguationList:)(void *a1)
{
  id v2;
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  Class isa;
  id v22;
  id v23;
  id v24;
  id v25;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D88558]), sel_init);
  v3 = objc_msgSend(a1, sel_items);
  if (v3)
  {
    v4 = v3;
    type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for SAUIListItem);
    v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (!(v5 >> 62))
      goto LABEL_3;
  }
  else
  {
    v5 = MEMORY[0x1E0DEE9D8];
    if (!(MEMORY[0x1E0DEE9D8] >> 62))
    {
LABEL_3:
      v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v6)
        goto LABEL_4;
LABEL_17:
      swift_bridgeObjectRelease();
LABEL_18:
      type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for SAUIListItem);
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      objc_msgSend(v2, sel_setItems_, isa);

      objc_msgSend(v2, sel_setAutoDisambiguationDisabled_, objc_msgSend(a1, sel_autoDisambiguationDisabled));
      v22 = objc_msgSend(a1, sel_title);
      objc_msgSend(v2, sel_setTitle_, v22);

      v23 = v2;
      v24 = objc_msgSend(a1, sel_speakableText);
      objc_msgSend(v23, sel_setSpeakableText_, v24);

      return (uint64_t)v23;
    }
  }
  swift_bridgeObjectRetain();
  v6 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v6)
    goto LABEL_17;
LABEL_4:
  result = specialized ContiguousArray.reserveCapacity(_:)();
  if ((v6 & 0x8000000000000000) == 0)
  {
    v25 = v2;
    v8 = 0;
    do
    {
      if ((v5 & 0xC000000000000001) != 0)
        v9 = (id)MEMORY[0x1B5E43B94](v8, v5);
      else
        v9 = *(id *)(v5 + 8 * v8 + 32);
      v10 = v9;
      v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D88560]), sel_init);
      v12 = objc_msgSend(v10, sel_title);
      if (v12)
      {
        v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v15 = v14;

        v12 = (id)MEMORY[0x1B5E432E8](v13, v15);
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v11, sel_setTitle_, v12);

      v16 = v11;
      v17 = objc_msgSend(v10, sel_speakableText);
      if (v17)
      {
        v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v20 = v19;

        v17 = (id)MEMORY[0x1B5E432E8](v18, v20);
        swift_bridgeObjectRelease();
      }
      ++v8;
      objc_msgSend(v16, sel_setSpeakableText_, v17);

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
    }
    while (v6 != v8);
    swift_bridgeObjectRelease();
    v2 = v25;
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

id specialized static ViewMetricsLogger.getSparseCardSnippet(cardSnippet:)(void *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  Class isa;
  id v17;
  id v18;
  id result;
  void *v20;
  Class v21;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D87FE0]), sel_init);
  v3 = objc_msgSend(a1, sel_dialog);
  v4 = specialized static DialogMetricsLogger.getSparseDialog(_:)(v3);

  objc_msgSend(v2, sel_setDialog_, v4);
  v5 = objc_msgSend(a1, sel_sash);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D88598]), sel_init);
    v8 = objc_msgSend(v6, sel_applicationBundleIdentifier);
    objc_msgSend(v7, sel_setApplicationBundleIdentifier_, v8);

    v9 = objc_msgSend(v6, sel_title);
    objc_msgSend(v7, sel_setTitle_, v9);

    objc_msgSend(v2, sel_setSash_, v7);
  }
  v10 = objc_msgSend(a1, sel_cardData);
  if (!v10)
    return v2;
  v11 = v10;
  v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;

  v15 = objc_allocWithZone(MEMORY[0x1E0D8C880]);
  outlined copy of Data._Representation(v12, v14);
  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v12, v14);
  v17 = objc_msgSend(v15, sel_initWithData_, isa);

  if (!v17
    || (v18 = objc_msgSend(v17, sel_dictionaryRepresentation),
        v17,
        !v18))
  {
    outlined consume of Data._Representation(v12, v14);
    return v2;
  }
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  result = objc_msgSend(v2, sel_dictionary);
  if (result)
  {
    v20 = result;
    v21 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v20, sel___swift_setObject_forKeyedSubscript_, v21, _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(), 0x647261635FLL, 0xE500000000000000);
    outlined consume of Data._Representation(v12, v14);

    swift_unknownObjectRelease();
    return v2;
  }
  __break(1u);
  return result;
}

id specialized static ViewMetricsLogger.getSparseSettingSnippet(snippet:)(void *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  Class isa;
  uint64_t v27;
  unint64_t v28;
  _BYTE v29[32];
  __int128 v30;
  uint64_t v31;
  uint64_t v32;

  objc_opt_self();
  v2 = swift_dynamicCastObjCClass();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = objc_allocWithZone(MEMORY[0x1E0D88458]);
    v5 = a1;
    v6 = objc_msgSend(v4, sel_init);
    objc_msgSend(v6, sel_setToggle_, objc_msgSend(v3, sel_toggle));
    v7 = objc_msgSend(v3, sel_value);
    objc_msgSend(v6, sel_setValue_, v7);

  }
  else
  {
    objc_opt_self();
    v8 = swift_dynamicCastObjCClass();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = objc_allocWithZone(MEMORY[0x1E0D88468]);
      v11 = a1;
      v12 = objc_msgSend(v10, sel_init);
      v13 = objc_msgSend(v9, sel_value);
      objc_msgSend(v12, sel_setValue_, v13);

      v6 = v12;
      objc_msgSend(v6, sel_setIncrement_, objc_msgSend(v9, sel_increment));

    }
    else
    {
      v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D88488]), sel_init);
    }
  }
  v14 = objc_msgSend(a1, sel_settingKeys);
  if (v14)
  {
    v15 = v14;
    v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    v17 = *(_QWORD *)(v16 + 16);
    if (v17)
    {
      v32 = MEMORY[0x1E0DEE9D8];
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v17, 0);
      v18 = v16 + 32;
      v19 = MEMORY[0x1E0DEA968];
      do
      {
        outlined init with copy of Any(v18, (uint64_t)v29);
        outlined init with copy of Any((uint64_t)v29, (uint64_t)&v30);
        if (swift_dynamicCast())
        {
          v20 = v27;
          v21 = v28;
        }
        else
        {
          v20 = 0;
          v21 = 0xE000000000000000;
        }
        v31 = v19;
        *(_QWORD *)&v30 = v20;
        *((_QWORD *)&v30 + 1) = v21;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
        v22 = v32;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v22 + 16) + 1, 1);
          v22 = v32;
        }
        v24 = *(_QWORD *)(v22 + 16);
        v23 = *(_QWORD *)(v22 + 24);
        if (v24 >= v23 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v23 > 1, v24 + 1, 1);
          v22 = v32;
        }
        *(_QWORD *)(v22 + 16) = v24 + 1;
        outlined init with take of Any(&v30, (_OWORD *)(v22 + 32 * v24 + 32));
        v18 += 32;
        --v17;
      }
      while (v17);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    isa = 0;
  }
  objc_msgSend(v6, sel_setSettingKeys_, isa);

  return v6;
}

id specialized static ViewMetricsLogger.getSparseIntentGroupSnippet(snippet:)(void *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D881A8]), sel_init);
  v3 = objc_msgSend(a1, sel_appId);
  objc_msgSend(v2, sel_setAppId_, v3);

  v4 = v2;
  v5 = objc_msgSend(a1, sel_dialog);
  v6 = specialized static DialogMetricsLogger.getSparseDialog(_:)(v5);

  objc_msgSend(v4, sel_setDialog_, v6);
  v7 = objc_msgSend(a1, sel_sash);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D88598]), sel_init);
    v10 = objc_msgSend(v8, sel_applicationBundleIdentifier);
    objc_msgSend(v9, sel_setApplicationBundleIdentifier_, v10);

    v11 = objc_msgSend(v8, sel_title);
    objc_msgSend(v9, sel_setTitle_, v11);

    objc_msgSend(v4, sel_setSash_, v9);
  }
  return v4;
}

id specialized static ViewMetricsLogger.getSparseView(view:)(void *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;

  objc_opt_self();
  v2 = swift_dynamicCastObjCClass();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = a1;
    v5 = (uint64_t)specialized static ViewMetricsLogger.getSparseAssistantUtteranceView(assistantUtteranceView:)(v3);
LABEL_3:
    v6 = v5;

    return (id)v6;
  }
  objc_opt_self();
  v8 = swift_dynamicCastObjCClass();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = objc_allocWithZone(MEMORY[0x1E0D88530]);
    v11 = a1;
    v12 = objc_msgSend(v10, sel_init);
    v13 = objc_msgSend(v9, sel_confirmText);
    objc_msgSend(v12, sel_setConfirmText_, v13);

    v14 = objc_msgSend(v9, sel_denyText);
    objc_msgSend(v12, sel_setDenyText_, v14);

    v15 = v12;
    v16 = objc_msgSend(v9, sel_speakableText);
LABEL_8:
    v23 = v16;
    objc_msgSend(v15, sel_setSpeakableText_, v23);

    return v15;
  }
  objc_opt_self();
  v17 = swift_dynamicCastObjCClass();
  if (v17)
  {
    v18 = (void *)v17;
    v19 = objc_allocWithZone(MEMORY[0x1E0D88510]);
    v11 = a1;
    v20 = objc_msgSend(v19, sel_init);
    v21 = objc_msgSend(v18, sel_text);
    objc_msgSend(v20, sel_setText_, v21);

    v22 = objc_msgSend(v18, sel_secondaryText);
    objc_msgSend(v20, sel_setSecondaryText_, v22);

    v15 = v20;
    v16 = objc_msgSend(v18, sel_speakableText);
    goto LABEL_8;
  }
  objc_opt_self();
  v24 = swift_dynamicCastObjCClass();
  if (v24)
  {
    v25 = (void *)v24;
    v4 = a1;
    v5 = specialized static ViewMetricsLogger.getSparseDisambiguationList(disambiguationList:)(v25);
    goto LABEL_3;
  }
  objc_opt_self();
  v26 = swift_dynamicCastObjCClass();
  if (v26)
  {
    v27 = (void *)v26;
    v4 = a1;
    v5 = (uint64_t)specialized static ViewMetricsLogger.getSparseCardSnippet(cardSnippet:)(v27);
    goto LABEL_3;
  }
  objc_opt_self();
  v28 = swift_dynamicCastObjCClass();
  if (v28)
  {
    v29 = (void *)v28;
    v4 = a1;
    v5 = (uint64_t)specialized static ViewMetricsLogger.getSparseSettingSnippet(snippet:)(v29);
    goto LABEL_3;
  }
  objc_opt_self();
  v30 = swift_dynamicCastObjCClass();
  if (v30)
  {
    v31 = (void *)v30;
    v4 = a1;
    v5 = (uint64_t)specialized static ViewMetricsLogger.getSparseIntentGroupSnippet(snippet:)(v31);
    goto LABEL_3;
  }
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v32 = type metadata accessor for Logger();
  __swift_project_value_buffer(v32, (uint64_t)static Logger.instrumentation);
  v33 = a1;
  v34 = Logger.logObject.getter();
  v35 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = (uint8_t *)swift_slowAlloc();
    v37 = swift_slowAlloc();
    v40 = v37;
    *(_DWORD *)v36 = 136315138;
    swift_getObjectType();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SAAceView.Type);
    v38 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v38, v39, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B4BE6000, v34, v35, "Logging SAAceView skipped : %s", v36, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B5E44758](v37, -1, -1);
    MEMORY[0x1B5E44758](v36, -1, -1);

  }
  else
  {

  }
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D87F78]), sel_init);
}

uint64_t specialized static ViewMetricsLogger.getSparseAddViews(addViews:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  Class isa;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = type metadata accessor for OSSignpostID();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for executor != -1)
    swift_once();
  v6 = (id)static Log.executor;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D884F8]), sel_init);
  v8 = objc_msgSend(a1, sel_dialogPhase);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v7, sel_setDialogPhase_, v8);

  }
  isa = (Class)objc_msgSend(a1, sel_views);
  if (!isa)
    goto LABEL_18;
  type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for SAAceView);
  v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v11 >> 62))
  {
    v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v12)
      goto LABEL_8;
LABEL_16:
    swift_bridgeObjectRelease();
LABEL_17:
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
LABEL_18:
    objc_msgSend(v7, sel_setViews_, isa);

    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (uint64_t)v7;
  }
  swift_bridgeObjectRetain();
  v12 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v12)
    goto LABEL_16;
LABEL_8:
  v20 = MEMORY[0x1E0DEE9D8];
  result = specialized ContiguousArray.reserveCapacity(_:)();
  if ((v12 & 0x8000000000000000) == 0)
  {
    v18 = v3;
    v19 = v2;
    v14 = 0;
    do
    {
      if ((v11 & 0xC000000000000001) != 0)
        v15 = (id)MEMORY[0x1B5E43B94](v14, v11);
      else
        v15 = *(id *)(v11 + 8 * v14 + 32);
      v16 = v15;
      ++v14;
      specialized static ViewMetricsLogger.getSparseView(view:)(v15);

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
    }
    while (v12 != v14);
    swift_bridgeObjectRelease();
    v3 = v18;
    v2 = v19;
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t specialized static ViewMetricsLogger.logAnalytics(view:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  unint64_t v11;
  void *v12;
  id v13;
  id v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  unint64_t v18;
  _OWORD v19[2];
  __int128 v20;
  uint64_t v21;
  unint64_t v22;

  v2 = type metadata accessor for OSSignpostID();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for executor != -1)
    swift_once();
  v6 = (id)static Log.executor;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)static Logger.instrumentation);
  v8 = Logger.logObject.getter();
  v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1B4BE6000, v8, v9, "Logging AddViews to AFAnalytics", v10, 2u);
    MEMORY[0x1B5E44758](v10, -1, -1);
  }

  v11 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E0DEE9D8]);
  v22 = v11;
  v12 = (void *)specialized static ViewMetricsLogger.getSparseAddViews(addViews:)(a1);
  v13 = objc_msgSend(v12, sel_dictionary);
  if (v13)
  {
    v14 = v13;
    v21 = type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for NSMutableDictionary);
    *(_QWORD *)&v20 = v14;
    outlined init with take of Any(&v20, v19);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = v11;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v19, 0x6C46746E65696C43, 0xEE0077656956776FLL, isUniquelyReferenced_nonNull_native);
    v16 = v18;
    swift_bridgeObjectRelease();
  }
  else
  {
    specialized Dictionary._Variant.removeValue(forKey:)(0x6C46746E65696C43, 0xEE0077656956776FLL, &v20);
    outlined destroy of Any?((uint64_t)&v20);
    v16 = v22;
  }
  specialized static Log.logAFAnalytics(eventType:eventContext:)(3700, v16);

  swift_bridgeObjectRelease();
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

ValueMetadata *type metadata accessor for ViewMetricsLogger()
{
  return &type metadata for ViewMetricsLogger;
}

uint64_t WaitUniversalActionOverride.__allocating_init(input:aceInputOrigin:isFirstRequestInSession:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8;
  _QWORD *v9;

  v8 = swift_allocObject();
  *(_BYTE *)(v8 + 16) = 7;
  outlined init with take of Input?(a1, v8 + OBJC_IVAR____TtC14SiriKitRuntime27WaitUniversalActionOverride_input);
  *(_BYTE *)(v8 + OBJC_IVAR____TtC14SiriKitRuntime27WaitUniversalActionOverride_isFirstRequestInSession) = a4;
  v9 = (_QWORD *)(v8 + OBJC_IVAR____TtC14SiriKitRuntime27WaitUniversalActionOverride_aceInputOrigin);
  *v9 = a2;
  v9[1] = a3;
  return v8;
}

uint64_t WaitUniversalActionOverride.overrideType.setter(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = swift_beginAccess();
  *(_BYTE *)(v1 + 16) = v2;
  return result;
}

uint64_t (*WaitUniversalActionOverride.overrideType.modify())()
{
  swift_beginAccess();
  return static AmbiguityFeatureFlags.forceEnabled.modify;
}

uint64_t WaitUniversalActionOverride.input.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of Input?(v1 + OBJC_IVAR____TtC14SiriKitRuntime27WaitUniversalActionOverride_input, a1);
}

uint64_t WaitUniversalActionOverride.isFirstRequestInSession.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC14SiriKitRuntime27WaitUniversalActionOverride_isFirstRequestInSession);
}

uint64_t WaitUniversalActionOverride.aceInputOrigin.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14SiriKitRuntime27WaitUniversalActionOverride_aceInputOrigin);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WaitUniversalActionOverride.init(input:aceInputOrigin:isFirstRequestInSession:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  _QWORD *v8;

  *(_BYTE *)(v4 + 16) = 7;
  outlined init with take of Input?(a1, v4 + OBJC_IVAR____TtC14SiriKitRuntime27WaitUniversalActionOverride_input);
  *(_BYTE *)(v4 + OBJC_IVAR____TtC14SiriKitRuntime27WaitUniversalActionOverride_isFirstRequestInSession) = a4;
  v8 = (_QWORD *)(v4 + OBJC_IVAR____TtC14SiriKitRuntime27WaitUniversalActionOverride_aceInputOrigin);
  *v8 = a2;
  v8[1] = a3;
  return v4;
}

uint64_t WaitUniversalActionOverride.deinit()
{
  uint64_t v0;

  outlined destroy of ReferenceResolutionClientProtocol?(v0 + OBJC_IVAR____TtC14SiriKitRuntime27WaitUniversalActionOverride_input, &demangling cache variable for type metadata for Input?);
  swift_bridgeObjectRelease();
  return v0;
}

_QWORD *sub_1B4EDBBEC@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  _QWORD *result;
  uint64_t v4;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr))(**(_QWORD **)a1 + 112))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_1B4EDBC2C(char *a1, uint64_t *a2)
{
  uint64_t v2;
  char v4;

  v2 = *a2;
  v4 = *a1;
  return (*(uint64_t (**)(char *))(*(_QWORD *)v2 + 120))(&v4);
}

uint64_t ObjC metadata update function for WaitUniversalActionOverride()
{
  return type metadata accessor for WaitUniversalActionOverride();
}

void type metadata completion function for WaitUniversalActionOverride()
{
  unint64_t v0;

  type metadata accessor for Input?();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for WaitUniversalActionOverride()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WaitUniversalActionOverride.overrideType.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of WaitUniversalActionOverride.overrideType.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of WaitUniversalActionOverride.overrideType.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of WaitUniversalActionOverride.__allocating_init(input:aceInputOrigin:isFirstRequestInSession:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of WaitUniversalActionOverride.evaluate()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of XPCConvertible.xpcRepresentation.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of XPCRepresentation.swiftRepresentation()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  BOOL v8;

  if (qword_1ED514D58 == -1)
  {
    if (qword_1ED514D60)
      return _availability_version_check();
  }
  else
  {
    dispatch_once_f(&qword_1ED514D58, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_1ED514D60)
      return _availability_version_check();
  }
  if (qword_1ED514D50 == -1)
  {
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_1ED514D50, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  if (v8)
    return 0;
  if (dword_1ED514D44 > a3)
    return 1;
  return dword_1ED514D44 >= a3 && dword_1ED514D48 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t (*v1)(void);
  BOOL v2;
  unsigned __int8 *v4;
  uint64_t (*v5)(_QWORD);
  unint64_t v6;
  uint64_t (*v7)(_QWORD, uint64_t, _QWORD, _QWORD);
  uint64_t (*v8)(_QWORD, const char *, uint64_t, unsigned __int8 *);
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t);
  uint64_t (*v11)(void);
  FILE *v12;
  FILE *v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  FILE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  FILE *v27;
  unsigned int (*v28)(uint64_t, char *, uint64_t, uint64_t);
  char v29[32];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = (uint64_t (*)(void))qword_1ED514D60;
  if (qword_1ED514D60)
    v2 = (_DWORD)result == 0;
  else
    v2 = 0;
  if (!v2)
  {
    if (MEMORY[0x1E0C80CC0])
    {
      qword_1ED514D60 = (uint64_t)MEMORY[0x1E0C80CC0];
      v1 = MEMORY[0x1E0C80CC0];
    }
    if (!v1 || (_DWORD)result != 0)
    {
      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        v4 = *(unsigned __int8 **)result;
        result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          v5 = (uint64_t (*)(_QWORD))result;
          v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            v7 = (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))result;
            result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              v8 = (uint64_t (*)(_QWORD, const char *, uint64_t, unsigned __int8 *))result;
              result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  v10 = (uint64_t (*)(uint64_t))result;
                  result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    v11 = (uint64_t (*)(void))result;
                    result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        v12 = (FILE *)result;
                        result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          v13 = (FILE *)result;
                          v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          v14 = MEMORY[0x1B5E4411C](v13);
                          if (v14 < 0)
                          {
                            v16 = 0;
                          }
                          else
                          {
                            v15 = v14;
                            rewind(v13);
                            v16 = malloc(v15);
                            if (v16)
                            {
                              v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                v17 = v5(0);
                                if (v17)
                                {
                                  v18 = v17;
                                  v19 = v13;
                                  if (v6)
                                    v20 = ((uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))v6)(0, v17, 0, 0, 0);
                                  else
                                    v20 = v7(0, v17, 0, 0);
                                  v21 = v20;
                                  if (v20)
                                  {
                                    v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      v23 = v22;
                                      v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984))
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_1ED514D44, &dword_1ED514D48);
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  v19 = v13;
                                }
                                v16 = v26;
                              }
                              else
                              {
                                v16 = v26;
                                v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
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
  }
  return result;
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t JSONEncoder.init()()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t type metadata accessor for CharacterSet()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t DateInterval.debugDescription.getter()
{
  return MEMORY[0x1E0CAE560]();
}

NSDateInterval __swiftcall DateInterval._bridgeToObjectiveC()()
{
  return (NSDateInterval)MEMORY[0x1E0CAE568]();
}

uint64_t static DateInterval._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CAE578]();
}

uint64_t DateInterval.init(start:duration:)()
{
  return MEMORY[0x1E0CAE598]();
}

uint64_t type metadata accessor for DateInterval()
{
  return MEMORY[0x1E0CAE5D0]();
}

uint64_t static DateComponents._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CAE9B8]();
}

uint64_t DateComponents.day.setter()
{
  return MEMORY[0x1E0CAE9D0]();
}

uint64_t DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)()
{
  return MEMORY[0x1E0CAEA80]();
}

uint64_t type metadata accessor for DateComponents()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return MEMORY[0x1E0CAEB20]();
}

uint64_t LocalizedError.failureReason.getter()
{
  return MEMORY[0x1E0CAEB38]();
}

uint64_t LocalizedError.errorDescription.getter()
{
  return MEMORY[0x1E0CAEB40]();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return MEMORY[0x1E0CAEB50]();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x1E0CAF5C8]();
}

uint64_t dispatch thunk of PropertyListDecoder.userInfo.modify()
{
  return MEMORY[0x1E0CAF5D8]();
}

uint64_t PropertyListDecoder.init()()
{
  return MEMORY[0x1E0CAF5F8]();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return MEMORY[0x1E0CAF608]();
}

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return MEMORY[0x1E0CAF638]();
}

uint64_t PropertyListEncoder.init()()
{
  return MEMORY[0x1E0CAF668]();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return MEMORY[0x1E0CAF670]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t NSFastEnumerationIterator.next()()
{
  return MEMORY[0x1E0CAFB50]();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return MEMORY[0x1E0CAFB58]();
}

uint64_t URL.init(fileURLWithPath:isDirectory:)()
{
  return MEMORY[0x1E0CAFDD8]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x1E0CAFE38](retstr);
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return MEMORY[0x1E0CAFE78]();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t URL.path.getter()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t Data.init(contentsOf:options:)()
{
  return MEMORY[0x1E0CB00A0]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x1E0CB01F0]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return MEMORY[0x1E0CB0680]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x1E0CB06B8]();
}

uint64_t static Date.> infix(_:_:)()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t static Date.+ infix(_:_:)()
{
  return MEMORY[0x1E0CB06E8]();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t static Date.now.getter()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t Date.init()()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t UUID.init(uuidString:)()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x1E0CB0910]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x1E0CB0930]();
}

uint64_t static UUID.== infix(_:_:)()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t Locale.Components.languageComponents.setter()
{
  return MEMORY[0x1E0CB0A18]();
}

uint64_t Locale.Components.init(languageCode:script:languageRegion:)()
{
  return MEMORY[0x1E0CB0A28]();
}

uint64_t Locale.Components.hourCycle.setter()
{
  return MEMORY[0x1E0CB0A58]();
}

uint64_t type metadata accessor for Locale.Components()
{
  return MEMORY[0x1E0CB0A60]();
}

uint64_t Locale.init(components:)()
{
  return MEMORY[0x1E0CB0A70]();
}

uint64_t Locale.identifier.getter()
{
  return MEMORY[0x1E0CB0A90]();
}

uint64_t type metadata accessor for Locale.LanguageCode()
{
  return MEMORY[0x1E0CB0AE8]();
}

uint64_t Locale.LanguageCode.init(_:)()
{
  return MEMORY[0x1E0CB0B18]();
}

uint64_t static Locale.autoupdatingCurrent.getter()
{
  return MEMORY[0x1E0CB0BF8]();
}

uint64_t type metadata accessor for Locale.Region()
{
  return MEMORY[0x1E0CB0C48]();
}

uint64_t Locale.Region.init(_:)()
{
  return MEMORY[0x1E0CB0C70]();
}

uint64_t type metadata accessor for Locale.Script()
{
  return MEMORY[0x1E0CB0C88]();
}

uint64_t Locale.Language.Components.init(languageCode:script:region:)()
{
  return MEMORY[0x1E0CB0D18]();
}

uint64_t type metadata accessor for Locale.Language.Components()
{
  return MEMORY[0x1E0CB0D58]();
}

uint64_t type metadata accessor for Locale.HourCycle()
{
  return MEMORY[0x1E0CB0E10]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t static Calendar.autoupdatingCurrent.getter()
{
  return MEMORY[0x1E0CB1030]();
}

uint64_t static Calendar.current.getter()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t type metadata accessor for Calendar()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t static TimeZone.autoupdatingCurrent.getter()
{
  return MEMORY[0x1E0CB1448]();
}

uint64_t static TimeZone.current.getter()
{
  return MEMORY[0x1E0CB1460]();
}

uint64_t type metadata accessor for TimeZone()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse()
{
  return MEMORY[0x1E0D6D1E0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ServerSuggestion.hasAlternateQuerySuggestion.getter()
{
  return MEMORY[0x1E0D6EF98]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion()
{
  return MEMORY[0x1E0D6EFA0]();
}

uint64_t SiriInCallFeatureFlag.isEnabled.getter()
{
  return MEMORY[0x1E0D98460]();
}

uint64_t type metadata accessor for SiriInCallFeatureFlag()
{
  return MEMORY[0x1E0D98468]();
}

uint64_t dispatch thunk of CorrectingFlow.correctionsExitValue.getter()
{
  return MEMORY[0x1E0D9A9E0]();
}

uint64_t dispatch thunk of CorrectingFlow.on(correction:)()
{
  return MEMORY[0x1E0D9A9E8]();
}

uint64_t dispatch thunk of PreparableFlow.prepare(completion:)()
{
  return MEMORY[0x1E0D9A9F8]();
}

uint64_t dispatch thunk of ParaphrasableFlow.paraphrase()()
{
  return MEMORY[0x1E0D9AB10]();
}

uint64_t AnyFlow.description.getter()
{
  return MEMORY[0x1E0D9AC78]();
}

uint64_t dispatch thunk of AnyFlow.siriEnvironment.getter()
{
  return MEMORY[0x1E0D9AC80]();
}

uint64_t dispatch thunk of AnyFlow.siriEnvironment.setter()
{
  return MEMORY[0x1E0D9AC88]();
}

uint64_t dispatch thunk of AnyFlow.flexibleExecutionSupport.getter()
{
  return MEMORY[0x1E0D9AC90]();
}

uint64_t dispatch thunk of AnyFlow.unbox<A>(as:)()
{
  return MEMORY[0x1E0D9ACA0]();
}

uint64_t dispatch thunk of AnyFlow.exitValue.getter()
{
  return MEMORY[0x1E0D9ACB8]();
}

uint64_t type metadata accessor for AnyFlow()
{
  return MEMORY[0x1E0D9ACC8]();
}

uint64_t TaskFlowConfiguration.debugDescription.getter()
{
  return MEMORY[0x1E0D9ACE0]();
}

uint64_t TaskFlowConfiguration.taskName.getter()
{
  return MEMORY[0x1E0D9ACE8]();
}

uint64_t TaskFlowConfiguration.taskType.getter()
{
  return MEMORY[0x1E0D9ACF0]();
}

uint64_t type metadata accessor for TaskFlowConfiguration()
{
  return MEMORY[0x1E0D9ACF8]();
}

uint64_t type metadata accessor for TaskFlowType()
{
  return MEMORY[0x1E0D9AD28]();
}

uint64_t dispatch thunk of ActingFlow.action.getter()
{
  return MEMORY[0x1E0D9AD58]();
}

uint64_t ActingFlow.isAdaptedFlow.getter()
{
  return MEMORY[0x1E0D9AD60]();
}

uint64_t ActingFlow.unwrap.getter()
{
  return MEMORY[0x1E0D9AD68]();
}

uint64_t LoadedFlowInfo.fromBundle.getter()
{
  return MEMORY[0x1E0D9ADA0]();
}

uint64_t LoadedFlowInfo.activeTasks.getter()
{
  return MEMORY[0x1E0D9ADA8]();
}

uint64_t LoadedFlowInfo.flow.getter()
{
  return MEMORY[0x1E0D9ADB0]();
}

uint64_t type metadata accessor for LoadedFlowInfo()
{
  return MEMORY[0x1E0D9ADB8]();
}

uint64_t type metadata accessor for UnsafeFlowOperationQueueError()
{
  return MEMORY[0x1E0D9ADC8]();
}

uint64_t DefaultFlowActivity.init(activityName:activityType:activityStartTime:)()
{
  return MEMORY[0x1E0D9ADD8]();
}

uint64_t dispatch thunk of DefaultFlowActivity.message.setter()
{
  return MEMORY[0x1E0D9ADE8]();
}

uint64_t dispatch thunk of DefaultFlowActivity.timestamp.setter()
{
  return MEMORY[0x1E0D9ADF0]();
}

uint64_t type metadata accessor for DefaultFlowActivity()
{
  return MEMORY[0x1E0D9AE00]();
}

uint64_t method lookup function for DefaultFlowActivity()
{
  return MEMORY[0x1E0D9AE10]();
}

uint64_t DefaultFlowActivity.deinit()
{
  return MEMORY[0x1E0D9AE20]();
}

uint64_t dispatch thunk of static SiriSuggestionsBroker.getInstance()()
{
  return MEMORY[0x1E0D9AED0]();
}

uint64_t dispatch thunk of SiriCorrectionsClientProvider.correctionsClient.setter()
{
  return MEMORY[0x1E0D9AED8]();
}

uint64_t SiriCorrectionsClientProvider.init()()
{
  return MEMORY[0x1E0D9AEE0]();
}

uint64_t type metadata accessor for SiriCorrectionsClientProvider()
{
  return MEMORY[0x1E0D9AEE8]();
}

uint64_t dispatch thunk of SiriSuggestionsBrokerProvider.initialize(initialize:postInit:)()
{
  return MEMORY[0x1E0D9AEF0]();
}

uint64_t static SiriSuggestionsBrokerProvider.instance.getter()
{
  return MEMORY[0x1E0D9AEF8]();
}

uint64_t type metadata accessor for SiriSuggestionsBrokerProvider()
{
  return MEMORY[0x1E0D9AF00]();
}

uint64_t Flow.eraseToAnyFlow()()
{
  return MEMORY[0x1E0D9AF20]();
}

uint64_t Flow.toActingFlow()()
{
  return MEMORY[0x1E0D9AF30]();
}

uint64_t Flow.deferToExecuteAsync(_:)()
{
  return MEMORY[0x1E0D9AF40]();
}

uint64_t Flow.flexibleExecutionSupport.getter()
{
  return MEMORY[0x1E0D9AF48]();
}

uint64_t Flow.onAsync(input:)()
{
  return MEMORY[0x1E0D9AF68]();
}

uint64_t Flow<>.exitValue.getter()
{
  return MEMORY[0x1E0D9AF78]();
}

uint64_t type metadata accessor for FlowActionType()
{
  return MEMORY[0x1E0D9AFB8]();
}

uint64_t type metadata accessor for FlowTraceEvent()
{
  return MEMORY[0x1E0D9B028]();
}

uint64_t dispatch thunk of FlowPluginBundle.bundlePath.getter()
{
  return MEMORY[0x1E0D9B038]();
}

uint64_t dispatch thunk of FlowPluginBundle.supportedTopics.getter()
{
  return MEMORY[0x1E0D9B040]();
}

uint64_t FlowSearchResult.actingFlow.getter()
{
  return MEMORY[0x1E0D9B048]();
}

uint64_t FlowSearchResult.transformer.getter()
{
  return MEMORY[0x1E0D9B050]();
}

uint64_t FlowSearchResult.flow.getter()
{
  return MEMORY[0x1E0D9B058]();
}

uint64_t static FlowSearchResult.flow(_:)()
{
  return MEMORY[0x1E0D9B060]();
}

uint64_t FlowSearchResult.exclude.getter()
{
  return MEMORY[0x1E0D9B068]();
}

uint64_t type metadata accessor for FlowSearchResult()
{
  return MEMORY[0x1E0D9B070]();
}

uint64_t dispatch thunk of FlowTaskProvider.__allocating_init(id:isClientInitiated:creationTime:)()
{
  return MEMORY[0x1E0D9B080]();
}

uint64_t type metadata accessor for FlowTaskProvider()
{
  return MEMORY[0x1E0D9B088]();
}

uint64_t dispatch thunk of FlowPluginExtended.findFlowForX(parse:)()
{
  return MEMORY[0x1E0D9B098]();
}

uint64_t type metadata accessor for FlowUnhandledReason()
{
  return MEMORY[0x1E0D9B0C0]();
}

uint64_t type metadata accessor for FlowOperationIgnored()
{
  return MEMORY[0x1E0D9B0D0]();
}

uint64_t FlowOperationIgnored.init(_:)()
{
  return MEMORY[0x1E0D9B0E0]();
}

uint64_t FlowPluginBundleImpl.init(bundlePath:supportedTopics:)()
{
  return MEMORY[0x1E0D9B0E8]();
}

uint64_t type metadata accessor for FlowPluginBundleImpl()
{
  return MEMORY[0x1E0D9B0F8]();
}

uint64_t FlowPluginLoadResult.init(success:wasInCache:)()
{
  return MEMORY[0x1E0D9B100]();
}

uint64_t type metadata accessor for FlowPluginLoadResult()
{
  return MEMORY[0x1E0D9B108]();
}

uint64_t dispatch thunk of FlowDelegatePluginLoader.loadFlow(rcId:parse:)()
{
  return MEMORY[0x1E0D9B110]();
}

uint64_t dispatch thunk of FlowDelegatePluginLoader.loadFlowPlugin(bundleIdentifier:)()
{
  return MEMORY[0x1E0D9B118]();
}

uint64_t static FlowDelegatePluginLoader.sharedInstance.getter()
{
  return MEMORY[0x1E0D9B120]();
}

uint64_t dispatch thunk of FlowDelegatePluginLoader.loadAndWarmBundle(bundleIdentifier:refId:)()
{
  return MEMORY[0x1E0D9B128]();
}

uint64_t type metadata accessor for FlowDelegatePluginLoader()
{
  return MEMORY[0x1E0D9B130]();
}

uint64_t type metadata accessor for FlowAbort()
{
  return MEMORY[0x1E0D9B138]();
}

uint64_t FlowAbort.init(_:)()
{
  return MEMORY[0x1E0D9B148]();
}

uint64_t static FlowTrace.trace(event:)()
{
  return MEMORY[0x1E0D9B150]();
}

uint64_t dispatch thunk of FlowAction.type.getter()
{
  return MEMORY[0x1E0D9B158]();
}

uint64_t dispatch thunk of FlowPlugin.makeFlowFor(parse:)()
{
  return MEMORY[0x1E0D9B168]();
}

uint64_t dispatch thunk of FlowPlugin.warmup(refId:)()
{
  return MEMORY[0x1E0D9B170]();
}

uint64_t dispatch thunk of FlowPlugin.init()()
{
  return MEMORY[0x1E0D9B178]();
}

uint64_t static SiriKitEventSender.current.getter()
{
  return MEMORY[0x1E0D9B190]();
}

uint64_t SiriKitEventPayload.description.getter()
{
  return MEMORY[0x1E0D9B1A0]();
}

uint64_t type metadata accessor for SiriKitEventPayload()
{
  return MEMORY[0x1E0D9B248]();
}

uint64_t dispatch thunk of SiriKitEventSending.send(_:)()
{
  return MEMORY[0x1E0D9B258]();
}

uint64_t dispatch thunk of SiriKitEventSending.sendAsync(_:)()
{
  return MEMORY[0x1E0D9B260]();
}

uint64_t SiriKitEventSending.sendAsync(_:)()
{
  return MEMORY[0x1E0D9B270]();
}

uint64_t SiriKitCommandHandler.notifyBegin(peerInfo:)()
{
  return MEMORY[0x1E0D9B290]();
}

uint64_t SiriKitEventOverrides.interactionId.getter()
{
  return MEMORY[0x1E0D9B298]();
}

uint64_t SiriKitEventOverrides.resultCandidateId.getter()
{
  return MEMORY[0x1E0D9B2A0]();
}

uint64_t SiriKitEventOverrides.taskId.getter()
{
  return MEMORY[0x1E0D9B2A8]();
}

uint64_t type metadata accessor for SiriKitEventOverrides()
{
  return MEMORY[0x1E0D9B2B0]();
}

uint64_t SiriKitReliabilityCodes.flowStatusReason.getter()
{
  return MEMORY[0x1E0D9B2D0]();
}

uint64_t SiriKitReliabilityCodes.rawValue.getter()
{
  return MEMORY[0x1E0D9B328]();
}

uint64_t type metadata accessor for SiriKitReliabilityCodes()
{
  return MEMORY[0x1E0D9B330]();
}

uint64_t type metadata accessor for SiriKitReliabilityEvent()
{
  return MEMORY[0x1E0D9B350]();
}

uint64_t SiriKitConfirmationState.init(rawValue:)()
{
  return MEMORY[0x1E0D9B360]();
}

uint64_t type metadata accessor for SiriKitConfirmationState()
{
  return MEMORY[0x1E0D9B380]();
}

uint64_t SiriKitParameterMetadata.init(parameterName:shouldResolve:confirmationStates:)()
{
  return MEMORY[0x1E0D9B390]();
}

uint64_t type metadata accessor for SiriKitParameterMetadata()
{
  return MEMORY[0x1E0D9B398]();
}

uint64_t SiriKitPlatformErrorCase.makePluginActionToRenderError()()
{
  return MEMORY[0x1E0D9B3A0]();
}

uint64_t type metadata accessor for SiriKitPlatformErrorCase()
{
  return MEMORY[0x1E0D9B3C0]();
}

uint64_t static SiriKitDirectInvocationPayloads.headGestureIdentifier.getter()
{
  return MEMORY[0x1E0D9B3D8]();
}

uint64_t dispatch thunk of SiriKitEvent.SiriKitEventBuilder.statusReasonDescription.setter()
{
  return MEMORY[0x1E0D9B3E8]();
}

uint64_t dispatch thunk of SiriKitEvent.SiriKitEventBuilder.attribute.setter()
{
  return MEMORY[0x1E0D9B3F0]();
}

uint64_t SiriKitEvent.withPayload(_:)()
{
  return MEMORY[0x1E0D9B3F8]();
}

uint64_t SiriKitEvent.__allocating_init(activityType:taskType:statusReason:_:)()
{
  return MEMORY[0x1E0D9B400]();
}

uint64_t SiriKitEvent.flowStateType.getter()
{
  return MEMORY[0x1E0D9B408]();
}

uint64_t SiriKitEvent.debugDescription.getter()
{
  return MEMORY[0x1E0D9B410]();
}

uint64_t SiriKitEvent.machAbsoluteTime.getter()
{
  return MEMORY[0x1E0D9B418]();
}

uint64_t SiriKitEvent.payload.getter()
{
  return MEMORY[0x1E0D9B420]();
}

uint64_t SiriKitEvent.overrides.getter()
{
  return MEMORY[0x1E0D9B428]();
}

uint64_t SiriKitEvent.timestamp.getter()
{
  return MEMORY[0x1E0D9B430]();
}

uint64_t type metadata accessor for SiriKitEvent()
{
  return MEMORY[0x1E0D9B438]();
}

uint64_t SiriKitEvent.__allocating_init(_:builder:)()
{
  return MEMORY[0x1E0D9B448]();
}

uint64_t static SiriKitLifecycle._logCrashToEventBus(_:)()
{
  return MEMORY[0x1E0D9B458]();
}

uint64_t Acceptance.type.getter()
{
  return MEMORY[0x1E0D9B460]();
}

uint64_t type metadata accessor for Acceptance()
{
  return MEMORY[0x1E0D9B468]();
}

uint64_t static AceService.currentAsync.getter()
{
  return MEMORY[0x1E0D9B478]();
}

uint64_t dispatch thunk of Executable.interruptionPolicy.getter()
{
  return MEMORY[0x1E0D9B488]();
}

uint64_t dispatch thunk of Executable.cancel(error:)()
{
  return MEMORY[0x1E0D9B490]();
}

uint64_t dispatch thunk of Executable.execute(with:)()
{
  return MEMORY[0x1E0D9B498]();
}

uint64_t DeviceState.isAuthenticated(for:)()
{
  return MEMORY[0x1E0D9B568]();
}

uint64_t static DialogPhase.completion.getter()
{
  return MEMORY[0x1E0D9B580]();
}

uint64_t static DialogPhase.reflection.getter()
{
  return MEMORY[0x1E0D9B588]();
}

uint64_t static DialogPhase.summary.getter()
{
  return MEMORY[0x1E0D9B5A8]();
}

uint64_t DialogPhase.init(aceValue:)()
{
  return MEMORY[0x1E0D9B5B0]();
}

uint64_t type metadata accessor for DialogPhase()
{
  return MEMORY[0x1E0D9B5C0]();
}

uint64_t type metadata accessor for IntentTopic.IntentTopicType()
{
  return MEMORY[0x1E0D9B608]();
}

uint64_t IntentTopic.makeWildcardFallbacks()()
{
  return MEMORY[0x1E0D9B618]();
}

uint64_t static IntentTopic.makeFromBundleInfoPlist(dictionary:)()
{
  return MEMORY[0x1E0D9B620]();
}

uint64_t IntentTopic.makeCacheKeyAndWildcardFallbacks()()
{
  return MEMORY[0x1E0D9B628]();
}

uint64_t static IntentTopic.make(from:)()
{
  return MEMORY[0x1E0D9B630]();
}

uint64_t IntentTopic.type.getter()
{
  return MEMORY[0x1E0D9B638]();
}

uint64_t IntentTopic.cacheKey.getter()
{
  return MEMORY[0x1E0D9B640]();
}

uint64_t type metadata accessor for IntentTopic()
{
  return MEMORY[0x1E0D9B648]();
}

uint64_t ActivityType.executionTaskStepType.getter()
{
  return MEMORY[0x1E0D9B678]();
}

uint64_t ActivityType.flowStateType.getter()
{
  return MEMORY[0x1E0D9B680]();
}

uint64_t ActivityType.rawValue.getter()
{
  return MEMORY[0x1E0D9B6E0]();
}

uint64_t type metadata accessor for ActivityType()
{
  return MEMORY[0x1E0D9B6F0]();
}

uint64_t BargeInError.init(rawError:)()
{
  return MEMORY[0x1E0D9B708]();
}

uint64_t type metadata accessor for BargeInError()
{
  return MEMORY[0x1E0D9B710]();
}

uint64_t MetricsState.turnId.getter()
{
  return MEMORY[0x1E0D9B720]();
}

uint64_t PluginAction.init(flowHandlerId:input:speechPackage:actionParaphrase:loggingId:)()
{
  return MEMORY[0x1E0D9B728]();
}

uint64_t PluginAction.init(flowHandlerId:input:speechPackage:utterance:actionParaphrase:userData:loggingId:)()
{
  return MEMORY[0x1E0D9B730]();
}

uint64_t PluginAction.init(flowHandlerId:input:)()
{
  return MEMORY[0x1E0D9B738]();
}

uint64_t PluginAction.flowHandlerId.getter()
{
  return MEMORY[0x1E0D9B740]();
}

uint64_t PluginAction.speechPackage.getter()
{
  return MEMORY[0x1E0D9B748]();
}

uint64_t PluginAction.init(data:)()
{
  return MEMORY[0x1E0D9B750]();
}

uint64_t PluginAction.input.getter()
{
  return MEMORY[0x1E0D9B758]();
}

uint64_t PluginAction.serialize()()
{
  return MEMORY[0x1E0D9B760]();
}

uint64_t PluginAction.utterance.getter()
{
  return MEMORY[0x1E0D9B768]();
}

uint64_t type metadata accessor for PluginAction()
{
  return MEMORY[0x1E0D9B770]();
}

uint64_t RecentDialog.init(addViews:expiresAt:requestId:)()
{
  return MEMORY[0x1E0D9B7B0]();
}

uint64_t RecentDialog.addViews.getter()
{
  return MEMORY[0x1E0D9B7B8]();
}

uint64_t RecentDialog.expiresAt.getter()
{
  return MEMORY[0x1E0D9B7C0]();
}

uint64_t type metadata accessor for RecentDialog()
{
  return MEMORY[0x1E0D9B7C8]();
}

uint64_t type metadata accessor for AcceptanceType()
{
  return MEMORY[0x1E0D9B830]();
}

uint64_t CommandFailure.init(errorCode:reason:)()
{
  return MEMORY[0x1E0D9B850]();
}

uint64_t type metadata accessor for CommandFailure()
{
  return MEMORY[0x1E0D9B858]();
}

uint64_t IdentifiedUser.homeUserID.setter()
{
  return MEMORY[0x1E0D9B878]();
}

uint64_t IdentifiedUser.sharedUserId.getter()
{
  return MEMORY[0x1E0D9B880]();
}

uint64_t IdentifiedUser.sharedUserId.setter()
{
  return MEMORY[0x1E0D9B888]();
}

uint64_t IdentifiedUser.sharedUserInfo.setter()
{
  return MEMORY[0x1E0D9B890]();
}

uint64_t IdentifiedUser.voiceIDScore.setter()
{
  return MEMORY[0x1E0D9B898]();
}

uint64_t IdentifiedUser.belongsToHome.setter()
{
  return MEMORY[0x1E0D9B8A0]();
}

uint64_t IdentifiedUser.iCloudAltDSID.setter()
{
  return MEMORY[0x1E0D9B8A8]();
}

uint64_t static IdentifiedUser.Classification.known.getter()
{
  return MEMORY[0x1E0D9B8B0]();
}

uint64_t static IdentifiedUser.Classification.unknown.getter()
{
  return MEMORY[0x1E0D9B8B8]();
}

uint64_t static IdentifiedUser.Classification.unsure1.getter()
{
  return MEMORY[0x1E0D9B8C0]();
}

uint64_t static IdentifiedUser.Classification.unsureN.getter()
{
  return MEMORY[0x1E0D9B8C8]();
}

uint64_t static IdentifiedUser.Classification.confident.getter()
{
  return MEMORY[0x1E0D9B8D0]();
}

uint64_t type metadata accessor for IdentifiedUser.Classification()
{
  return MEMORY[0x1E0D9B8D8]();
}

uint64_t IdentifiedUser.lowConfidenceThreshold.setter()
{
  return MEMORY[0x1E0D9B8E0]();
}

uint64_t IdentifiedUser.wasSpeechProfileUsedByASR.setter()
{
  return MEMORY[0x1E0D9B8E8]();
}

uint64_t IdentifiedUser.preferredTemperatureUnitName.setter()
{
  return MEMORY[0x1E0D9B8F0]();
}

uint64_t IdentifiedUser.voiceConfidenceClassification.setter()
{
  return MEMORY[0x1E0D9B8F8]();
}

uint64_t IdentifiedUser.locale.setter()
{
  return MEMORY[0x1E0D9B908]();
}

uint64_t IdentifiedUser.person.setter()
{
  return MEMORY[0x1E0D9B918]();
}

uint64_t IdentifiedUser.init()()
{
  return MEMORY[0x1E0D9B920]();
}

uint64_t type metadata accessor for IdentifiedUser()
{
  return MEMORY[0x1E0D9B928]();
}

uint64_t dispatch thunk of InputAccepting.accept(input:)()
{
  return MEMORY[0x1E0D9B940]();
}

uint64_t static PrescribedTool.searchTool.getter()
{
  return MEMORY[0x1E0D9B948]();
}

uint64_t type metadata accessor for PrescribedTool()
{
  return MEMORY[0x1E0D9B950]();
}

uint64_t dispatch thunk of SnippetManager.flowIdentifierOfCurrentSnippet.getter()
{
  return MEMORY[0x1E0D9B980]();
}

uint64_t dispatch thunk of SnippetManager.positionLookup.setter()
{
  return MEMORY[0x1E0D9B988]();
}

uint64_t static SnippetManager.sharedInstance.getter()
{
  return MEMORY[0x1E0D9B990]();
}

uint64_t dispatch thunk of SnippetManager.canSendAddViews.setter()
{
  return MEMORY[0x1E0D9B998]();
}

uint64_t dispatch thunk of SnippetManager.canSendXPCUpdates.setter()
{
  return MEMORY[0x1E0D9B9A0]();
}

uint64_t dispatch thunk of SnippetManager.snippetDisappeared()()
{
  return MEMORY[0x1E0D9B9A8]();
}

uint64_t type metadata accessor for SnippetManager()
{
  return MEMORY[0x1E0D9B9B0]();
}

uint64_t TemplatingText.text.getter()
{
  return MEMORY[0x1E0D9B9D0]();
}

uint64_t type metadata accessor for TemplatingText()
{
  return MEMORY[0x1E0D9B9D8]();
}

uint64_t ExecuteResponse.onChildFlowCompletion.getter()
{
  return MEMORY[0x1E0D9B9F0]();
}

uint64_t ExecuteResponse.retriggerNL.getter()
{
  return MEMORY[0x1E0D9B9F8]();
}

uint64_t ExecuteResponse.requireInput.getter()
{
  return MEMORY[0x1E0D9BA00]();
}

uint64_t ExecuteResponse.unhandledReason.getter()
{
  return MEMORY[0x1E0D9BA08]();
}

uint64_t ExecuteResponse.nextPluginAction.getter()
{
  return MEMORY[0x1E0D9BA10]();
}

uint64_t ExecuteResponse.next.getter()
{
  return MEMORY[0x1E0D9BA18]();
}

uint64_t ExecuteResponse.type.getter()
{
  return MEMORY[0x1E0D9BA20]();
}

uint64_t static ExecuteResponse.ongoing<A>(next:)()
{
  return MEMORY[0x1E0D9BA40]();
}

uint64_t static ExecuteResponse.complete()()
{
  return MEMORY[0x1E0D9BA60]();
}

uint64_t static ExecuteResponse.redirect(nextPluginAction:)()
{
  return MEMORY[0x1E0D9BA68]();
}

uint64_t type metadata accessor for ExecuteResponse()
{
  return MEMORY[0x1E0D9BA78]();
}

uint64_t NLContextUpdate.shouldResetFlowTaskState.setter()
{
  return MEMORY[0x1E0D9BA88]();
}

uint64_t NLContextUpdate.toAceContextUpdate()()
{
  return MEMORY[0x1E0D9BA90]();
}

uint64_t NLContextUpdate.doConvertToAceContextUpdate(options:)()
{
  return MEMORY[0x1E0D9BA98]();
}

uint64_t NLContextUpdate.doConvertToServerContextUpdate()()
{
  return MEMORY[0x1E0D9BAA0]();
}

uint64_t NLContextUpdate.siriKitMetrics.setter()
{
  return MEMORY[0x1E0D9BAA8]();
}

uint64_t NLContextUpdate.contextUpdateScope.getter()
{
  return MEMORY[0x1E0D9BAB0]();
}

uint64_t NLContextUpdate.rrEntities.getter()
{
  return MEMORY[0x1E0D9BAB8]();
}

uint64_t NLContextUpdate.isClientOnly.getter()
{
  return MEMORY[0x1E0D9BAD0]();
}

uint64_t NLContextUpdate.pommesContext.getter()
{
  return MEMORY[0x1E0D9BAD8]();
}

uint64_t NLContextUpdate.nluSystemDialogActs.getter()
{
  return MEMORY[0x1E0D9BAE8]();
}

uint64_t NLContextUpdate.nluSystemDialogActs.setter()
{
  return MEMORY[0x1E0D9BAF0]();
}

uint64_t NLContextUpdate.undoDirectInvocation.getter()
{
  return MEMORY[0x1E0D9BB00]();
}

uint64_t NLContextUpdate.restoreSessionForRequestId.getter()
{
  return MEMORY[0x1E0D9BB18]();
}

uint64_t NLContextUpdate.init()()
{
  return MEMORY[0x1E0D9BB38]();
}

uint64_t type metadata accessor for NLContextUpdate()
{
  return MEMORY[0x1E0D9BB40]();
}

uint64_t PrepareResponse.onChildFlowCompletion.getter()
{
  return MEMORY[0x1E0D9BB50]();
}

uint64_t PrepareResponse.needsExecute.getter()
{
  return MEMORY[0x1E0D9BB58]();
}

uint64_t PrepareResponse.next.getter()
{
  return MEMORY[0x1E0D9BB60]();
}

uint64_t PrepareResponse.type.getter()
{
  return MEMORY[0x1E0D9BB68]();
}

uint64_t static PrepareResponse.ongoing(needsExecute:)()
{
  return MEMORY[0x1E0D9BB70]();
}

uint64_t static PrepareResponse.complete()()
{
  return MEMORY[0x1E0D9BB78]();
}

uint64_t type metadata accessor for PrepareResponse()
{
  return MEMORY[0x1E0D9BB80]();
}

uint64_t ResponseFactory.init()()
{
  return MEMORY[0x1E0D9BBA8]();
}

uint64_t type metadata accessor for ResponseFactory()
{
  return MEMORY[0x1E0D9BBB0]();
}

uint64_t static ActionParaphrase.noParaphrase()()
{
  return MEMORY[0x1E0D9BBC0]();
}

uint64_t type metadata accessor for ActionParaphrase()
{
  return MEMORY[0x1E0D9BBC8]();
}

uint64_t static AttachmentOption.Default.getter()
{
  return MEMORY[0x1E0D9BC08]();
}

uint64_t type metadata accessor for AttachmentOption()
{
  return MEMORY[0x1E0D9BC10]();
}

uint64_t ExecutionContext.init(outputPublisher:aceServiceInvoker:)()
{
  return MEMORY[0x1E0D9BC20]();
}

uint64_t type metadata accessor for ExecutionContext()
{
  return MEMORY[0x1E0D9BC28]();
}

uint64_t static ResponsePatterns.taskComplete()()
{
  return MEMORY[0x1E0D9BC30]();
}

uint64_t static ResponsePatterns.unsupportedOperation()()
{
  return MEMORY[0x1E0D9BC40]();
}

uint64_t TemplatingResult.sections.getter()
{
  return MEMORY[0x1E0D9BC78]();
}

uint64_t type metadata accessor for TemplatingResult()
{
  return MEMORY[0x1E0D9BC80]();
}

uint64_t type metadata accessor for LaunchAppBehavior()
{
  return MEMORY[0x1E0D9BCB0]();
}

uint64_t dispatch thunk of LifeCycleModifier.onAttached()()
{
  return MEMORY[0x1E0D9BCC8]();
}

uint64_t dispatch thunk of LifeCycleModifier.onDetached(value:)()
{
  return MEMORY[0x1E0D9BCD0]();
}

uint64_t dispatch thunk of LifeCycleModifier.attachmentOption.getter()
{
  return MEMORY[0x1E0D9BCD8]();
}

uint64_t dispatch thunk of LifeCycleModifier.id.getter()
{
  return MEMORY[0x1E0D9BCE0]();
}

uint64_t dispatch thunk of PeerInfoProviding.getPeerName()()
{
  return MEMORY[0x1E0D9BCF0]();
}

uint64_t dispatch thunk of PeerInfoProviding.getDeviceIdiom()()
{
  return MEMORY[0x1E0D9BCF8]();
}

uint64_t dispatch thunk of PeerInfoProviding.getIdsIdentifier()()
{
  return MEMORY[0x1E0D9BD00]();
}

uint64_t dispatch thunk of PeerInfoProviding.isOwnedByCurrentUser()()
{
  return MEMORY[0x1E0D9BD08]();
}

uint64_t dispatch thunk of PeerInfoProviding.getMediaRouteIdentifier()()
{
  return MEMORY[0x1E0D9BD10]();
}

uint64_t dispatch thunk of PeerInfoProviding.getMediaSystemIdentifier()()
{
  return MEMORY[0x1E0D9BD18]();
}

uint64_t dispatch thunk of PeerInfoProviding.getRapportEffectiveIdentifier()()
{
  return MEMORY[0x1E0D9BD20]();
}

uint64_t TemplatingSection.spokenOnly.getter()
{
  return MEMORY[0x1E0D9BD28]();
}

uint64_t TemplatingSection.redactedContent.getter()
{
  return MEMORY[0x1E0D9BD30]();
}

uint64_t TemplatingSection.content.getter()
{
  return MEMORY[0x1E0D9BD48]();
}

uint64_t type metadata accessor for TemplatingSection()
{
  return MEMORY[0x1E0D9BD50]();
}

uint64_t dispatch thunk of AnyChildCompletion.completion(exitValue:)()
{
  return MEMORY[0x1E0D9BD60]();
}

uint64_t type metadata accessor for AnyChildCompletion()
{
  return MEMORY[0x1E0D9BD68]();
}

uint64_t AnyChildCompletion.init<A>(_:)()
{
  return MEMORY[0x1E0D9BD78]();
}

uint64_t ContextUpdateScope.init(rawValue:)()
{
  return MEMORY[0x1E0D9BD90]();
}

uint64_t ContextUpdateScope.rawValue.getter()
{
  return MEMORY[0x1E0D9BD98]();
}

uint64_t type metadata accessor for ContextUpdateScope()
{
  return MEMORY[0x1E0D9BDA8]();
}

uint64_t type metadata accessor for DialogEngineOutput()
{
  return MEMORY[0x1E0D9BDD8]();
}

uint64_t type metadata accessor for InterruptionPolicy()
{
  return MEMORY[0x1E0D9BE18]();
}

uint64_t type metadata accessor for SubmitCommandError()
{
  return MEMORY[0x1E0D9BE98]();
}

uint64_t AppShortcutProvider.init()()
{
  return MEMORY[0x1E0D9BED8]();
}

uint64_t type metadata accessor for AppShortcutProvider()
{
  return MEMORY[0x1E0D9BEE0]();
}

uint64_t ConversationContext.executionContext.getter()
{
  return MEMORY[0x1E0D9BF08]();
}

uint64_t ConversationContext.init(executionContext:)()
{
  return MEMORY[0x1E0D9BF10]();
}

uint64_t type metadata accessor for ConversationContext()
{
  return MEMORY[0x1E0D9BF18]();
}

uint64_t static CorrectionsPatterns.unsupportedUndo()()
{
  return MEMORY[0x1E0D9BF28]();
}

uint64_t type metadata accessor for ExecuteResponseType()
{
  return MEMORY[0x1E0D9BF58]();
}

uint64_t type metadata accessor for PrepareResponseType()
{
  return MEMORY[0x1E0D9BF80]();
}

uint64_t CoreAnalyticsService.sendReliabilityEvent(event:file:line:function:)()
{
  return MEMORY[0x1E0D9BFB0]();
}

Swift::Void __swiftcall CoreAnalyticsService.sendHandleRequestEvent(intentTypeName:)(Swift::String intentTypeName)
{
  MEMORY[0x1E0D9BFB8](intentTypeName._countAndFlagsBits, intentTypeName._object);
}

uint64_t static CoreAnalyticsService.instance.getter()
{
  return MEMORY[0x1E0D9BFC0]();
}

uint64_t type metadata accessor for CoreAnalyticsService()
{
  return MEMORY[0x1E0D9BFC8]();
}

uint64_t type metadata accessor for CorrectionsExitValue()
{
  return MEMORY[0x1E0D9BFE8]();
}

uint64_t dispatch thunk of OutputPublisherAsync.publish(output:)()
{
  return MEMORY[0x1E0D9C000]();
}

uint64_t SnippetEventHandling.handler(for:)()
{
  return MEMORY[0x1E0D9C030]();
}

uint64_t dispatch thunk of UserIdentityProvider.knownHomeMembers.setter()
{
  return MEMORY[0x1E0D9C048]();
}

uint64_t dispatch thunk of UserIdentityProvider.identityForCurrentRequest.setter()
{
  return MEMORY[0x1E0D9C050]();
}

uint64_t type metadata accessor for UserIdentityProvider()
{
  return MEMORY[0x1E0D9C058]();
}

uint64_t AppShortcutInvocation.actionIdentifier.getter()
{
  return MEMORY[0x1E0D9C060]();
}

uint64_t AppShortcutInvocation.bundleId.getter()
{
  return MEMORY[0x1E0D9C070]();
}

uint64_t type metadata accessor for AppShortcutInvocation()
{
  return MEMORY[0x1E0D9C078]();
}

uint64_t dispatch thunk of EndpointInfoProviding.getIdentifier()()
{
  return MEMORY[0x1E0D9C098]();
}

uint64_t dispatch thunk of EndpointInfoProviding.getMediaRouteIdentifier()()
{
  return MEMORY[0x1E0D9C0A0]();
}

uint64_t NamedParseTransformer.resolve()()
{
  return MEMORY[0x1E0D9C0A8]();
}

uint64_t type metadata accessor for NamedParseTransformer()
{
  return MEMORY[0x1E0D9C0B0]();
}

uint64_t static SystemDialogActHelper.systemAskedUserToRepeat()()
{
  return MEMORY[0x1E0D9C0C0]();
}

uint64_t dispatch thunk of AceServiceInvokerAsync.recentDialogs()()
{
  return MEMORY[0x1E0D9C0D0]();
}

uint64_t dispatch thunk of AceServiceInvokerAsync.submitAndForget(_:setRefId:)()
{
  return MEMORY[0x1E0D9C0E0]();
}

uint64_t AceServiceInvokerAsync.submitAndForget(_:)()
{
  return MEMORY[0x1E0D9C0E8]();
}

uint64_t AceServiceInvokerAsync.submit<A>(_:)()
{
  return MEMORY[0x1E0D9C0F0]();
}

uint64_t dispatch thunk of AppInformationResolver.isSiriKitSupportedApp.getter()
{
  return MEMORY[0x1E0D9C100]();
}

uint64_t dispatch thunk of AppInformationResolver.resolveAppName.getter()
{
  return MEMORY[0x1E0D9C108]();
}

uint64_t dispatch thunk of AppInformationResolver.resolveAppVersion.getter()
{
  return MEMORY[0x1E0D9C110]();
}

uint64_t dispatch thunk of AppInformationResolver.resolveAppBundleId.getter()
{
  return MEMORY[0x1E0D9C118]();
}

uint64_t dispatch thunk of AppInformationResolver.resolveBuild.getter()
{
  return MEMORY[0x1E0D9C120]();
}

uint64_t AppInformationResolver.init(app:)()
{
  return MEMORY[0x1E0D9C128]();
}

uint64_t type metadata accessor for AppInformationResolver()
{
  return MEMORY[0x1E0D9C130]();
}

uint64_t dispatch thunk of ConversationSELFHelper.makeAndSetConversationId(fromExecutionRequestId:)()
{
  return MEMORY[0x1E0D9C140]();
}

uint64_t dispatch thunk of ConversationSELFHelper.withExecutionFlowPluginLoadTime<A>(rcId:pluginId:hypothesisId:_:)()
{
  return MEMORY[0x1E0D9C148]();
}

uint64_t dispatch thunk of ConversationSELFHelper.withExecutionFlowPluginFindFlowTime<A>(rcId:hypothesisId:_:)()
{
  return MEMORY[0x1E0D9C158]();
}

uint64_t dispatch thunk of ConversationSELFHelper.emitDecisionEngineDecision(flowHandlerId:parseHypothesisId:isInterpretableAsUniversalAction:isExistingFlowSelected:)()
{
  return MEMORY[0x1E0D9C160]();
}

uint64_t dispatch thunk of ConversationSELFHelper.makeConversationIdAndEmitRequestLink(executionUUID:)()
{
  return MEMORY[0x1E0D9C168]();
}

uint64_t dispatch thunk of ConversationSELFHelper.setExecutionRequestId(fromExecutionRequestId:)()
{
  return MEMORY[0x1E0D9C170]();
}

uint64_t dispatch thunk of ConversationSELFHelper.emitExecutionOverrideInfo(rcId:executionOverrideDecision:)()
{
  return MEMORY[0x1E0D9C180]();
}

uint64_t dispatch thunk of ConversationSELFHelper.emitExecutionPrepareTimeEnd(rcId:)()
{
  return MEMORY[0x1E0D9C188]();
}

uint64_t dispatch thunk of ConversationSELFHelper.makeCamIdAndEmitRequestLink(executionUUID:)()
{
  return MEMORY[0x1E0D9C190]();
}

uint64_t dispatch thunk of ConversationSELFHelper.emitActionCandidatesCollated(rcId:collatedActions:)()
{
  return MEMORY[0x1E0D9C198]();
}

uint64_t dispatch thunk of ConversationSELFHelper.makeCaarIdAndEmitRequestLink(executionUUID:)()
{
  return MEMORY[0x1E0D9C1A0]();
}

uint64_t dispatch thunk of ConversationSELFHelper.emitActionCandidatesGenerated(rcId:actionCandidates:)()
{
  return MEMORY[0x1E0D9C1A8]();
}

uint64_t dispatch thunk of ConversationSELFHelper.emitExecutionPrepareTimeBegin(rcId:)()
{
  return MEMORY[0x1E0D9C1B0]();
}

uint64_t dispatch thunk of ConversationSELFHelper.emitEagerExecutionContextEnded(rcId:)()
{
  return MEMORY[0x1E0D9C1B8]();
}

uint64_t dispatch thunk of ConversationSELFHelper.emitFinalExecutionContextEnded(rcId:hypothesisId:)()
{
  return MEMORY[0x1E0D9C1C0]();
}

uint64_t dispatch thunk of ConversationSELFHelper.emitEagerExecutionContextFailed(rcId:reason:)()
{
  return MEMORY[0x1E0D9C1C8]();
}

uint64_t dispatch thunk of ConversationSELFHelper.emitFinalExecutionContextFailed(rcId:hypothesisId:reason:)()
{
  return MEMORY[0x1E0D9C1D0]();
}

uint64_t dispatch thunk of ConversationSELFHelper.emitEagerExecutionContextStarted(rcId:fromPlugin:)()
{
  return MEMORY[0x1E0D9C1D8]();
}

uint64_t dispatch thunk of ConversationSELFHelper.emitFinalExecutionContextStarted(rcId:hypothesisId:fromPlugin:stackDepth:)()
{
  return MEMORY[0x1E0D9C1E0]();
}

uint64_t static ConversationSELFHelper.shared.getter()
{
  return MEMORY[0x1E0D9C1E8]();
}

uint64_t static ConversationSELFHelper.makeUUID(fromExecutionRequestId:)()
{
  return MEMORY[0x1E0D9C1F0]();
}

uint64_t type metadata accessor for ConversationSELFHelper()
{
  return MEMORY[0x1E0D9C1F8]();
}

uint64_t ExecuteOnRemotePayload.input.getter()
{
  return MEMORY[0x1E0D9C200]();
}

uint64_t ExecuteOnRemotePayload.rrData.getter()
{
  return MEMORY[0x1E0D9C208]();
}

uint64_t type metadata accessor for ExecuteOnRemotePayload()
{
  return MEMORY[0x1E0D9C210]();
}

uint64_t type metadata accessor for InputContinuationState()
{
  return MEMORY[0x1E0D9C220]();
}

uint64_t static OutputPublisherFactory.makeOutputPublisherAsync()()
{
  return MEMORY[0x1E0D9C248]();
}

uint64_t static DeviceEnvironmentHelper.startUpdating()()
{
  return MEMORY[0x1E0D9C260]();
}

uint64_t type metadata accessor for DeviceEnvironmentHelper()
{
  return MEMORY[0x1E0D9C268]();
}

uint64_t type metadata accessor for CorrectionsActionOutcome()
{
  return MEMORY[0x1E0D9C288]();
}

uint64_t OutputGenerationManifest.init(dialogPhase:_:)()
{
  return MEMORY[0x1E0D9C298]();
}

uint64_t type metadata accessor for OutputGenerationManifest()
{
  return MEMORY[0x1E0D9C2F0]();
}

uint64_t dispatch thunk of AceServiceContextProvider.shouldFallbacktoAWDL.getter()
{
  return MEMORY[0x1E0D9C300]();
}

uint64_t type metadata accessor for AceServiceContextProvider()
{
  return MEMORY[0x1E0D9C308]();
}

uint64_t AppShortcutExactInvocation.actionIdentifier.getter()
{
  return MEMORY[0x1E0D9C340]();
}

uint64_t AppShortcutExactInvocation.bundleId.getter()
{
  return MEMORY[0x1E0D9C348]();
}

uint64_t type metadata accessor for AppShortcutExactInvocation()
{
  return MEMORY[0x1E0D9C350]();
}

uint64_t type metadata accessor for MetricsEnvironmentProvider()
{
  return MEMORY[0x1E0D9C360]();
}

uint64_t UniversalActionFeatureFlags.isEnabled.getter()
{
  return MEMORY[0x1E0D9C388]();
}

uint64_t type metadata accessor for UniversalActionFeatureFlags()
{
  return MEMORY[0x1E0D9C390]();
}

uint64_t dispatch thunk of CallStateEnvironmentProvider.callState.getter()
{
  return MEMORY[0x1E0D9C398]();
}

uint64_t dispatch thunk of CallStateEnvironmentProvider.isDropInCall.getter()
{
  return MEMORY[0x1E0D9C3B0]();
}

uint64_t dispatch thunk of CallStateEnvironmentProvider.onSpeaker.getter()
{
  return MEMORY[0x1E0D9C3C8]();
}

uint64_t type metadata accessor for CallStateEnvironmentProvider()
{
  return MEMORY[0x1E0D9C3D8]();
}

uint64_t static CamDirectInvocationIdentifiers.giveUpRepeat.getter()
{
  return MEMORY[0x1E0D9C3E8]();
}

uint64_t static CamDirectInvocationIdentifiers.disambiguateTopTwo.getter()
{
  return MEMORY[0x1E0D9C3F0]();
}

uint64_t static CamDirectInvocationIdentifiers.fallback.getter()
{
  return MEMORY[0x1E0D9C3F8]();
}

uint64_t static CamDirectInvocationIdentifiers.askRepeat.getter()
{
  return MEMORY[0x1E0D9C400]();
}

uint64_t static HandcraftedPluginManifestEntry.fromPluginBundleIdOrPath(_:)()
{
  return MEMORY[0x1E0D9C408]();
}

uint64_t HandcraftedPluginManifestEntry.isPersonalDomain.getter()
{
  return MEMORY[0x1E0D9C410]();
}

uint64_t HandcraftedPluginManifestEntry.sensitivityPolicy.getter()
{
  return MEMORY[0x1E0D9C418]();
}

uint64_t HandcraftedPluginManifestEntry.rawValue.getter()
{
  return MEMORY[0x1E0D9C428]();
}

uint64_t type metadata accessor for HandcraftedPluginManifestEntry()
{
  return MEMORY[0x1E0D9C430]();
}

uint64_t static FlexibleExecutionSupportOptions.inputContinuation.getter()
{
  return MEMORY[0x1E0D9C440]();
}

uint64_t static FlexibleExecutionSupportOptions.executeBeforeEndpoint.getter()
{
  return MEMORY[0x1E0D9C448]();
}

uint64_t FlexibleExecutionSupportOptions.init(rawValue:)()
{
  return MEMORY[0x1E0D9C450]();
}

uint64_t FlexibleExecutionSupportOptions.rawValue.getter()
{
  return MEMORY[0x1E0D9C458]();
}

uint64_t type metadata accessor for FlexibleExecutionSupportOptions()
{
  return MEMORY[0x1E0D9C460]();
}

uint64_t AppShortcutGeneralizedInvocation.extractedActionIdentifier.getter()
{
  return MEMORY[0x1E0D9C478]();
}

uint64_t AppShortcutGeneralizedInvocation.bundleId.getter()
{
  return MEMORY[0x1E0D9C480]();
}

uint64_t type metadata accessor for AppShortcutGeneralizedInvocation()
{
  return MEMORY[0x1E0D9C488]();
}

uint64_t dispatch thunk of ReferenceResolutionClientProtocol.siriMentioned(entities:configuration:completion:)()
{
  return MEMORY[0x1E0D9C4E8]();
}

uint64_t dispatch thunk of ReferenceResolutionClientProtocol.retrieveSalientEntities()()
{
  return MEMORY[0x1E0D9C4F0]();
}

uint64_t dispatch thunk of ReferenceResolutionClientProtocol.inRequest(requestId:)()
{
  return MEMORY[0x1E0D9C4F8]();
}

uint64_t ReferenceResolutionClientProtocol.collectSalientEntities()()
{
  return MEMORY[0x1E0D9C500]();
}

uint64_t type metadata accessor for NLContextUpdateSerializationOptions()
{
  return MEMORY[0x1E0D9C510]();
}

uint64_t Input.identifier.getter()
{
  return MEMORY[0x1E0D9C528]();
}

uint64_t Input.description.getter()
{
  return MEMORY[0x1E0D9C530]();
}

uint64_t Input.alternatives.getter()
{
  return MEMORY[0x1E0D9C538]();
}

uint64_t Input.continuationState.getter()
{
  return MEMORY[0x1E0D9C540]();
}

uint64_t Input.withReformedParse(_:)()
{
  return MEMORY[0x1E0D9C548]();
}

uint64_t Input.inputOrAlternativesDirectDismissal.getter()
{
  return MEMORY[0x1E0D9C550]();
}

uint64_t Input.inputOrAlternativesHasWantedToPause.getter()
{
  return MEMORY[0x1E0D9C558]();
}

uint64_t Input.inputOrAlternativesInterpretableAsUniversalAction.getter()
{
  return MEMORY[0x1E0D9C560]();
}

uint64_t Input.init(parse:alternatives:continuationState:)()
{
  return MEMORY[0x1E0D9C568]();
}

uint64_t Input.init(parse:alternatives:)()
{
  return MEMORY[0x1E0D9C570]();
}

uint64_t Input.parse.getter()
{
  return MEMORY[0x1E0D9C578]();
}

uint64_t Input.init(parse:)()
{
  return MEMORY[0x1E0D9C580]();
}

uint64_t type metadata accessor for Input()
{
  return MEMORY[0x1E0D9C588]();
}

uint64_t Parse.nlLocation.getter()
{
  return MEMORY[0x1E0D9C5B0]();
}

uint64_t Parse.hasRejected.getter()
{
  return MEMORY[0x1E0D9C5B8]();
}

uint64_t Parse.hasThankYou.getter()
{
  return MEMORY[0x1E0D9C5C0]();
}

uint64_t Parse.hasCancelled.getter()
{
  return MEMORY[0x1E0D9C5C8]();
}

uint64_t Parse.PegasusResult.init(pegasusResponse:)()
{
  return MEMORY[0x1E0D9C5D0]();
}

uint64_t type metadata accessor for Parse.PegasusResult()
{
  return MEMORY[0x1E0D9C5D8]();
}

uint64_t Parse.DirectInvocation.init(identifier:userData:)()
{
  return MEMORY[0x1E0D9C600]();
}

uint64_t Parse.DirectInvocation.identifier.getter()
{
  return MEMORY[0x1E0D9C608]();
}

uint64_t Parse.DirectInvocation.userData.getter()
{
  return MEMORY[0x1E0D9C610]();
}

uint64_t type metadata accessor for Parse.DirectInvocation()
{
  return MEMORY[0x1E0D9C618]();
}

uint64_t Parse.ServerConversion.init(siriKitIntent:confirmationState:parameterMetadata:appResolutionStateProviding:)()
{
  return MEMORY[0x1E0D9C638]();
}

uint64_t Parse.ServerConversion.siriKitIntent.getter()
{
  return MEMORY[0x1E0D9C640]();
}

uint64_t type metadata accessor for Parse.ServerConversion()
{
  return MEMORY[0x1E0D9C648]();
}

uint64_t Parse.hasDirectDismissal.getter()
{
  return MEMORY[0x1E0D9C660]();
}

uint64_t Parse.interpretableAsUniversalAction.getter()
{
  return MEMORY[0x1E0D9C670]();
}

uint64_t Parse.usoTasks.getter()
{
  return MEMORY[0x1E0D9C690]();
}

uint64_t type metadata accessor for Parse()
{
  return MEMORY[0x1E0D9C698]();
}

uint64_t static Metrics.setMetricsState(_:)()
{
  return MEMORY[0x1E0D9C6C0]();
}

uint64_t USOParse.groupIndex.getter()
{
  return MEMORY[0x1E0D9C6C8]();
}

uint64_t USOParse.appBundleId.getter()
{
  return MEMORY[0x1E0D9C6D0]();
}

uint64_t USOParse.parserIdentifier.getter()
{
  return MEMORY[0x1E0D9C6D8]();
}

uint64_t USOParse.isEnabledAppShortcutInvocation(provider:)()
{
  return MEMORY[0x1E0D9C6E0]();
}

uint64_t USOParse.userParse.getter()
{
  return MEMORY[0x1E0D9C6F0]();
}

uint64_t USOParse.init(userParse:parserIdentifier:appBundleId:groupIndex:)()
{
  return MEMORY[0x1E0D9C6F8]();
}

uint64_t USOParse.init(userParse:parserIdentifier:appBundleId:)()
{
  return MEMORY[0x1E0D9C700]();
}

uint64_t type metadata accessor for USOParse()
{
  return MEMORY[0x1E0D9C708]();
}

uint64_t LinkParse.init(usoParse:actionId:entityId:entityDisplayName:)()
{
  return MEMORY[0x1E0D9C738]();
}

uint64_t LinkParse.usoParse.getter()
{
  return MEMORY[0x1E0D9C740]();
}

uint64_t type metadata accessor for LinkParse()
{
  return MEMORY[0x1E0D9C748]();
}

uint64_t isFeatureEnabled(_:)()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t Siri_Nlu_External_Task.task.getter()
{
  return MEMORY[0x1E0D9F098]();
}

uint64_t type metadata accessor for Siri_Nlu_External_Task()
{
  return MEMORY[0x1E0D9F0B8]();
}

uint64_t Siri_Nlu_External_UUID.init()()
{
  return MEMORY[0x1E0D9F0D8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UUID()
{
  return MEMORY[0x1E0D9F0E0]();
}

uint64_t Siri_Nlu_External_Parser.hasParserID.getter()
{
  return MEMORY[0x1E0D9F0F0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier()
{
  return MEMORY[0x1E0D9F140]();
}

uint64_t Siri_Nlu_External_Parser.parserID.getter()
{
  return MEMORY[0x1E0D9F188]();
}

uint64_t type metadata accessor for Siri_Nlu_External_Parser()
{
  return MEMORY[0x1E0D9F198]();
}

uint64_t Siri_Nlu_External_UsoGraph.identifiers.getter()
{
  return MEMORY[0x1E0D9F230]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoGraph()
{
  return MEMORY[0x1E0D9F270]();
}

uint64_t Siri_Nlu_External_UserParse.hasParserID.getter()
{
  return MEMORY[0x1E0D9F290]();
}

uint64_t Siri_Nlu_External_UserParse.userDialogActs.modify()
{
  return MEMORY[0x1E0D9F2A8]();
}

uint64_t Siri_Nlu_External_UserParse.userDialogActs.getter()
{
  return MEMORY[0x1E0D9F2B8]();
}

uint64_t Siri_Nlu_External_UserParse.userDialogActs.setter()
{
  return MEMORY[0x1E0D9F2C8]();
}

uint64_t Siri_Nlu_External_UserParse.repetitionResult.getter()
{
  return MEMORY[0x1E0D9F2D0]();
}

uint64_t Siri_Nlu_External_UserParse.comparableProbability.getter()
{
  return MEMORY[0x1E0D9F2E8]();
}

uint64_t Siri_Nlu_External_UserParse.id.getter()
{
  return MEMORY[0x1E0D9F308]();
}

uint64_t Siri_Nlu_External_UserParse.parser.getter()
{
  return MEMORY[0x1E0D9F318]();
}

uint64_t Siri_Nlu_External_UserParse.parserID.getter()
{
  return MEMORY[0x1E0D9F328]();
}

uint64_t Siri_Nlu_External_UserParse.hasParser.getter()
{
  return MEMORY[0x1E0D9F330]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserParse()
{
  return MEMORY[0x1E0D9F340]();
}

uint64_t Siri_Nlu_External_AsrHypothesis.probability.setter()
{
  return MEMORY[0x1E0D9F390]();
}

uint64_t Siri_Nlu_External_AsrHypothesis.id.setter()
{
  return MEMORY[0x1E0D9F398]();
}

uint64_t Siri_Nlu_External_AsrHypothesis.asrTokens.setter()
{
  return MEMORY[0x1E0D9F3A0]();
}

uint64_t Siri_Nlu_External_AsrHypothesis.utterance.getter()
{
  return MEMORY[0x1E0D9F3A8]();
}

uint64_t Siri_Nlu_External_AsrHypothesis.utterance.setter()
{
  return MEMORY[0x1E0D9F3B0]();
}

uint64_t Siri_Nlu_External_AsrHypothesis.init()()
{
  return MEMORY[0x1E0D9F3B8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_AsrHypothesis()
{
  return MEMORY[0x1E0D9F3C0]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasUserStatedTask.getter()
{
  return MEMORY[0x1E0D9F3E8]();
}

uint64_t Siri_Nlu_External_UserDialogAct.extractAppShortcutInvocation(groupIndex:)()
{
  return MEMORY[0x1E0D9C750]();
}

uint64_t Siri_Nlu_External_UserDialogAct.extractGeneralizedAppShortcutInvocation(groupIndex:)()
{
  return MEMORY[0x1E0D9C758]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasAccepted.getter()
{
  return MEMORY[0x1E0D9F400]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasCancelled.getter()
{
  return MEMORY[0x1E0D9F418]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasDelegated.getter()
{
  return MEMORY[0x1E0D9F428]();
}

Swift::String_optional __swiftcall Siri_Nlu_External_UserDialogAct.typeAsString()()
{
  uint64_t v0;
  void *v1;
  Swift::String_optional result;

  v0 = MEMORY[0x1E0D9F430]();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

uint64_t Siri_Nlu_External_UserDialogAct.userStatedTask.getter()
{
  return MEMORY[0x1E0D9F448]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasWantedToRepeat.getter()
{
  return MEMORY[0x1E0D9F478]();
}

uint64_t Siri_Nlu_External_UserDialogAct.delegated.getter()
{
  return MEMORY[0x1E0D9F498]();
}

uint64_t Siri_Nlu_External_UserDialogAct.delegated.setter()
{
  return MEMORY[0x1E0D9F4A0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserDialogAct()
{
  return MEMORY[0x1E0D9F4B0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_ResponseStatus.StatusCode()
{
  return MEMORY[0x1E0D9F520]();
}

uint64_t type metadata accessor for Siri_Nlu_External_RewriteMessage.RewriteType()
{
  return MEMORY[0x1E0D9F560]();
}

uint64_t Siri_Nlu_External_RewriteMessage.rewriteType.getter()
{
  return MEMORY[0x1E0D9F568]();
}

uint64_t Siri_Nlu_External_RewriteMessage.rewrittenUtterance.getter()
{
  return MEMORY[0x1E0D9F570]();
}

uint64_t type metadata accessor for Siri_Nlu_External_RewriteMessage()
{
  return MEMORY[0x1E0D9F578]();
}

uint64_t Siri_Nlu_External_UserStatedTask.task.getter()
{
  return MEMORY[0x1E0D9F5C8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserStatedTask()
{
  return MEMORY[0x1E0D9F5E8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_LegacyNLContext.LegacyContextSource()
{
  return MEMORY[0x1E0D9F608]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.strictPrompt.setter()
{
  return MEMORY[0x1E0D9F610]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.renderedTexts.setter()
{
  return MEMORY[0x1E0D9F618]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.dictationPrompt.setter()
{
  return MEMORY[0x1E0D9F620]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.previousDomainName.setter()
{
  return MEMORY[0x1E0D9F628]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.legacyContextSource.setter()
{
  return MEMORY[0x1E0D9F630]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.listenAfterSpeaking.setter()
{
  return MEMORY[0x1E0D9F638]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.responseSemanticValues.getter()
{
  return MEMORY[0x1E0D9F648]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.responseSemanticValues.setter()
{
  return MEMORY[0x1E0D9F650]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.init()()
{
  return MEMORY[0x1E0D9F658]();
}

uint64_t type metadata accessor for Siri_Nlu_External_LegacyNLContext()
{
  return MEMORY[0x1E0D9F660]();
}

uint64_t type metadata accessor for Siri_Nlu_External_SystemDialogAct()
{
  return MEMORY[0x1E0D9F6B0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_RepetitionResult.RepetitionType()
{
  return MEMORY[0x1E0D9F6D0]();
}

uint64_t Siri_Nlu_External_RepetitionResult.repetitionType.getter()
{
  return MEMORY[0x1E0D9F6E0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_RepetitionResult()
{
  return MEMORY[0x1E0D9F6E8]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.beginIndex.getter()
{
  return MEMORY[0x1E0D9F770]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.beginIndex.setter()
{
  return MEMORY[0x1E0D9F778]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.postItnText.getter()
{
  return MEMORY[0x1E0D9F780]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.postItnText.setter()
{
  return MEMORY[0x1E0D9F788]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.addSpaceAfter.getter()
{
  return MEMORY[0x1E0D9F790]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.addSpaceAfter.setter()
{
  return MEMORY[0x1E0D9F798]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.phoneSequence.setter()
{
  return MEMORY[0x1E0D9F7A0]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.confidenceScore.setter()
{
  return MEMORY[0x1E0D9F7A8]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.endMilliSeconds.setter()
{
  return MEMORY[0x1E0D9F7B0]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.ipaPhoneSequence.setter()
{
  return MEMORY[0x1E0D9F7B8]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.removeSpaceAfter.getter()
{
  return MEMORY[0x1E0D9F7C0]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.removeSpaceAfter.setter()
{
  return MEMORY[0x1E0D9F7C8]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.removeSpaceBefore.getter()
{
  return MEMORY[0x1E0D9F7D0]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.removeSpaceBefore.setter()
{
  return MEMORY[0x1E0D9F7D8]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.startMilliSeconds.setter()
{
  return MEMORY[0x1E0D9F7E0]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.endIndex.getter()
{
  return MEMORY[0x1E0D9F7E8]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.endIndex.setter()
{
  return MEMORY[0x1E0D9F7F0]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.init()()
{
  return MEMORY[0x1E0D9F7F8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_AsrTokenInformation()
{
  return MEMORY[0x1E0D9F800]();
}

uint64_t Siri_Nlu_External_MultilingualVariant.languageVariantName.getter()
{
  return MEMORY[0x1E0D9F810]();
}

uint64_t type metadata accessor for Siri_Nlu_External_MultilingualVariant()
{
  return MEMORY[0x1E0D9F820]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.hasNamespace.getter()
{
  return MEMORY[0x1E0D9F860]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.backingAppBundleID.getter()
{
  return MEMORY[0x1E0D9F870]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.hasBackingAppBundleID.getter()
{
  return MEMORY[0x1E0D9F878]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.value.getter()
{
  return MEMORY[0x1E0D9F880]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.namespace.getter()
{
  return MEMORY[0x1E0D9F888]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoEntityIdentifier()
{
  return MEMORY[0x1E0D9F890]();
}

uint64_t Siri_Nlu_External_LanguageVariantResult.multilingualVariant.getter()
{
  return MEMORY[0x1E0D9F8A0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_LanguageVariantResult()
{
  return MEMORY[0x1E0D9F8A8]();
}

uint64_t Siri_Nlu_External_DelegatedUserDialogAct.hasRewrite.getter()
{
  return MEMORY[0x1E0D9F8B8]();
}

uint64_t Siri_Nlu_External_DelegatedUserDialogAct.externalParserID.getter()
{
  return MEMORY[0x1E0D9F8C8]();
}

uint64_t Siri_Nlu_External_DelegatedUserDialogAct.asrHypothesisIndex.getter()
{
  return MEMORY[0x1E0D9F8D8]();
}

uint64_t Siri_Nlu_External_DelegatedUserDialogAct.rewrittenUtterance.getter()
{
  return MEMORY[0x1E0D9F8E0]();
}

uint64_t Siri_Nlu_External_DelegatedUserDialogAct.rewrite.getter()
{
  return MEMORY[0x1E0D9F8F0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_DelegatedUserDialogAct()
{
  return MEMORY[0x1E0D9F8F8]();
}

uint64_t static SiriNLUTypesPrintUtils.printableProtoObject(object:)()
{
  return MEMORY[0x1E0D9F908]();
}

uint64_t type metadata accessor for SiriNLUTypesPrintUtils()
{
  return MEMORY[0x1E0D9F910]();
}

uint64_t static ConversionUtils.toUserParse(from:)()
{
  return MEMORY[0x1E0D9F918]();
}

uint64_t static ConversionUtils.toLegacyUserParse(from:)()
{
  return MEMORY[0x1E0D9F920]();
}

uint64_t static ConversionUtils.convertProtoToUuid(protoUuid:)()
{
  return MEMORY[0x1E0D9F928]();
}

uint64_t static ConversionUtils.convertUuidToProto(uuid:)()
{
  return MEMORY[0x1E0D9F930]();
}

uint64_t static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)()
{
  return MEMORY[0x1E0D9F938]();
}

uint64_t static UsoGraphProtoReader.fromSwiftProtobuf(protobufGraph:vocabManager:)()
{
  return MEMORY[0x1E0D9F950]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.strictPrompt.getter()
{
  return MEMORY[0x1E0DA0040]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.dictationPrompt.getter()
{
  return MEMORY[0x1E0DA0050]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.domainHints.getter()
{
  return MEMORY[0x1E0DA0068]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.responseOptions.getter()
{
  return MEMORY[0x1E0DA0098]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.previousDomainName.getter()
{
  return MEMORY[0x1E0DA00C0]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.listenAfterSpeaking.getter()
{
  return MEMORY[0x1E0DA00D0]();
}

uint64_t type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext()
{
  return MEMORY[0x1E0DA0100]();
}

uint64_t Com_Apple_Siri_Product_Proto_SemanticValue.serializedValue.getter()
{
  return MEMORY[0x1E0DA0110]();
}

uint64_t type metadata accessor for Com_Apple_Siri_Product_Proto_SemanticValue()
{
  return MEMORY[0x1E0DA0140]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_NoVerb.entity.getter()
{
  return MEMORY[0x1E0DA0190]();
}

uint64_t type metadata accessor for UsoEntity_common_AppEntity()
{
  return MEMORY[0x1E0DA0198]();
}

uint64_t dispatch thunk of UsoEntity_common_UserEntity.associatedUserEntities.getter()
{
  return MEMORY[0x1E0DA01A0]();
}

uint64_t dispatch thunk of UsoEntity_common_UserEntity.definedValue.getter()
{
  return MEMORY[0x1E0DA01A8]();
}

uint64_t type metadata accessor for UsoEntity_common_UserEntity.DefinedValues()
{
  return MEMORY[0x1E0DA01B8]();
}

uint64_t type metadata accessor for UsoEntity_common_UserEntity()
{
  return MEMORY[0x1E0DA01E0]();
}

uint64_t type metadata accessor for UsoTask_requestLog_common_HealthLog()
{
  return MEMORY[0x1E0DA0250]();
}

uint64_t type metadata accessor for Siri_Nl_Core_Protocol_UsoGraph()
{
  return MEMORY[0x1E0DA03B8]();
}

uint64_t dispatch thunk of UsoBuilder.addUsoIdentifier(usoIdentifier:)()
{
  return MEMORY[0x1E0DA0410]();
}

uint64_t dispatch thunk of CodeGenBase.usoIdentifiers.getter()
{
  return MEMORY[0x1E0DA0420]();
}

uint64_t SpanProperty.valueString.getter()
{
  return MEMORY[0x1E0DA04C0]();
}

uint64_t SpanProperty.key.getter()
{
  return MEMORY[0x1E0DA04D8]();
}

uint64_t type metadata accessor for SpanProperty()
{
  return MEMORY[0x1E0DA04E8]();
}

uint64_t UsoEntitySpan.properties.getter()
{
  return MEMORY[0x1E0DA0548]();
}

uint64_t UsoEntitySpan.originAppId.getter()
{
  return MEMORY[0x1E0DA0560]();
}

uint64_t UsoEntitySpan.indexesMatch(_:)()
{
  return MEMORY[0x1E0DA0570]();
}

uint64_t UsoEntitySpan.appBundleSemantic.getter()
{
  return MEMORY[0x1E0DA0580]();
}

uint64_t UsoEntitySpan.payloadAttachmentInfo.getter()
{
  return MEMORY[0x1E0DA0588]();
}

uint64_t static UsoEntitySpan.== infix(_:_:)()
{
  return MEMORY[0x1E0DA0590]();
}

uint64_t UsoEntitySpan.matchInfo.getter()
{
  return MEMORY[0x1E0DA05A8]();
}

uint64_t type metadata accessor for UsoEntitySpan()
{
  return MEMORY[0x1E0DA05B0]();
}

uint64_t UsoIdentifier.groupIndex.getter()
{
  return MEMORY[0x1E0DA05D8]();
}

uint64_t UsoIdentifier.appBundleId.getter()
{
  return MEMORY[0x1E0DA05E0]();
}

uint64_t type metadata accessor for UsoIdentifier.NluComponent()
{
  return MEMORY[0x1E0DA0620]();
}

uint64_t UsoIdentifier.sourceComponent.getter()
{
  return MEMORY[0x1E0DA0638]();
}

uint64_t UsoIdentifier.appBundleSemantic.getter()
{
  return MEMORY[0x1E0DA0640]();
}

uint64_t UsoIdentifier.namespaceSemantic.getter()
{
  return MEMORY[0x1E0DA0648]();
}

uint64_t UsoIdentifier.init(value:appBundleId:namespace:)()
{
  return MEMORY[0x1E0DA0670]();
}

uint64_t UsoIdentifier.value.getter()
{
  return MEMORY[0x1E0DA0678]();
}

uint64_t UsoIdentifier.namespace.getter()
{
  return MEMORY[0x1E0DA0680]();
}

uint64_t type metadata accessor for UsoIdentifier()
{
  return MEMORY[0x1E0DA0688]();
}

uint64_t dispatch thunk of CodeGenListEntry.entry.getter()
{
  return MEMORY[0x1E0DA0CA0]();
}

uint64_t dispatch thunk of CodeGenGlobalArgs.usoListPosition.getter()
{
  return MEMORY[0x1E0DA0D90]();
}

uint64_t dispatch thunk of CodeGenGlobalArgs.usoAssociatedApp.getter()
{
  return MEMORY[0x1E0DA0D98]();
}

uint64_t dispatch thunk of CodeGenGlobalArgs.usoReferenceType.getter()
{
  return MEMORY[0x1E0DA0DA0]();
}

uint64_t dispatch thunk of CodeGenGlobalArgs.getEntitySpansFor(attributeName:)()
{
  return MEMORY[0x1E0DA0DA8]();
}

uint64_t dispatch thunk of CodeGenGlobalArgs.getUsoIdentifiersFor(attributeName:)()
{
  return MEMORY[0x1E0DA0DB8]();
}

uint64_t static UsoGraphUnitIndex.inferQualifiedVerbData(taskName:)()
{
  return MEMORY[0x1E0DA0DD8]();
}

uint64_t static UsoConversionUtils.convertGraphToTasks(graph:)()
{
  return MEMORY[0x1E0DA0EB0]();
}

uint64_t static UsoConversionUtils.extractFirstEntityFromGraph(graph:)()
{
  return MEMORY[0x1E0DA0EC0]();
}

uint64_t static IdentifierAppBundle.== infix(_:_:)()
{
  return MEMORY[0x1E0DA0F18]();
}

uint64_t IdentifierAppBundle.rawValue.getter()
{
  return MEMORY[0x1E0DA0F30]();
}

uint64_t type metadata accessor for IdentifierAppBundle()
{
  return MEMORY[0x1E0DA0F38]();
}

uint64_t IdentifierNamespace.rawValue.getter()
{
  return MEMORY[0x1E0DA0F70]();
}

uint64_t type metadata accessor for IdentifierNamespace()
{
  return MEMORY[0x1E0DA0F78]();
}

uint64_t dispatch thunk of UsoEntity_common_App.name.getter()
{
  return MEMORY[0x1E0DA0F90]();
}

uint64_t type metadata accessor for UsoEntity_common_App()
{
  return MEMORY[0x1E0DA0F98]();
}

uint64_t NonTerminalIntentNode.ontologyNodeName.getter()
{
  return MEMORY[0x1E0DA1008]();
}

uint64_t type metadata accessor for NonTerminalIntentNode()
{
  return MEMORY[0x1E0DA1018]();
}

uint64_t type metadata accessor for PayloadAttachmentInfo.AttachmentType()
{
  return MEMORY[0x1E0DA1048]();
}

uint64_t PayloadAttachmentInfo.attachmentType.getter()
{
  return MEMORY[0x1E0DA1070]();
}

uint64_t type metadata accessor for PayloadAttachmentInfo()
{
  return MEMORY[0x1E0DA1078]();
}

uint64_t UsoEntity_common_Date.toDate()()
{
  return MEMORY[0x1E0D98478]();
}

uint64_t dispatch thunk of UsoEntity_common_Date.weekOfYear.getter()
{
  return MEMORY[0x1E0DA10C0]();
}

uint64_t dispatch thunk of UsoEntity_common_Date.monthOfYear.getter()
{
  return MEMORY[0x1E0DA10D0]();
}

uint64_t dispatch thunk of UsoEntity_common_Date.definedValue.getter()
{
  return MEMORY[0x1E0DA10E0]();
}

uint64_t type metadata accessor for UsoEntity_common_Date.DefinedValues()
{
  return MEMORY[0x1E0DA1110]();
}

uint64_t dispatch thunk of UsoEntity_common_Alarm.endDateTime.getter()
{
  return MEMORY[0x1E0DA11C0]();
}

uint64_t dispatch thunk of UsoEntity_common_Person.definedValue.getter()
{
  return MEMORY[0x1E0DA1218]();
}

uint64_t type metadata accessor for UsoEntity_common_Person.DefinedValues()
{
  return MEMORY[0x1E0DA1228]();
}

uint64_t dispatch thunk of UsoEntity_common_Person.associatedDate.getter()
{
  return MEMORY[0x1E0DA1240]();
}

uint64_t dispatch thunk of UsoEntity_common_Person.age.getter()
{
  return MEMORY[0x1E0DA1270]();
}

uint64_t type metadata accessor for UsoEntity_common_Window()
{
  return MEMORY[0x1E0DA1290]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_Target.target.getter()
{
  return MEMORY[0x1E0DA12A0]();
}

uint64_t dispatch thunk of UsoEntity_common_Message.mode.getter()
{
  return MEMORY[0x1E0DA12C0]();
}

uint64_t dispatch thunk of UsoEntity_common_Message.subject.getter()
{
  return MEMORY[0x1E0DA12C8]();
}

uint64_t dispatch thunk of UsoEntity_common_Setting.associatedSetting.getter()
{
  return MEMORY[0x1E0DA12D0]();
}

uint64_t dispatch thunk of UsoEntity_common_Setting.name.getter()
{
  return MEMORY[0x1E0DA12D8]();
}

uint64_t dispatch thunk of UsoEntity_common_Setting.value.getter()
{
  return MEMORY[0x1E0DA12E0]();
}

uint64_t type metadata accessor for UsoEntity_common_Setting()
{
  return MEMORY[0x1E0DA12E8]();
}

uint64_t static UsoTask_CodegenConverter.convert(task:)()
{
  return MEMORY[0x1E0DA12F8]();
}

uint64_t type metadata accessor for UsoTask_close_common_App()
{
  return MEMORY[0x1E0DA1300]();
}

uint64_t type metadata accessor for UsoTask_read_common_Note()
{
  return MEMORY[0x1E0DA1308]();
}

uint64_t type metadata accessor for UsoTask_undo_common_Note()
{
  return MEMORY[0x1E0DA1310]();
}

uint64_t static UsoBuilderConversionUtils.convertEntityBuilderToEntity(entityBuilder:)()
{
  return MEMORY[0x1E0DA1318]();
}

uint64_t dispatch thunk of UsoEntity_common_DateTime.offsetValue.getter()
{
  return MEMORY[0x1E0DA1340]();
}

uint64_t dispatch thunk of UsoEntity_common_DateTime.definedValue.getter()
{
  return MEMORY[0x1E0DA1348]();
}

uint64_t type metadata accessor for UsoEntity_common_DateTime.DefinedValues()
{
  return MEMORY[0x1E0DA1358]();
}

uint64_t dispatch thunk of UsoEntity_common_DateTime.offsetReference.getter()
{
  return MEMORY[0x1E0DA1370]();
}

uint64_t dispatch thunk of UsoEntity_common_DateTime.date.getter()
{
  return MEMORY[0x1E0DA1378]();
}

uint64_t dispatch thunk of UsoEntity_common_DateTime.time.getter()
{
  return MEMORY[0x1E0DA1388]();
}

uint64_t type metadata accessor for UsoTask_open_uso_NoEntity()
{
  return MEMORY[0x1E0DA1478]();
}

uint64_t type metadata accessor for UsoTask_play_uso_NoEntity()
{
  return MEMORY[0x1E0DA1480]();
}

uint64_t type metadata accessor for UsoTask_read_uso_NoEntity()
{
  return MEMORY[0x1E0DA1490]();
}

uint64_t type metadata accessor for UsoTask_stop_uso_NoEntity()
{
  return MEMORY[0x1E0DA1498]();
}

uint64_t static UsoEntity_CodeGenConverter.convert(entity:)()
{
  return MEMORY[0x1E0DA1500]();
}

uint64_t static UsoEntity_CodeGenConverter.convertAs<A>(entity:asType:)()
{
  return MEMORY[0x1E0DA1510]();
}

uint64_t dispatch thunk of UsoEntity_common_HealthLog.value.getter()
{
  return MEMORY[0x1E0DA1568]();
}

uint64_t type metadata accessor for UsoTask_close_uso_NoEntity()
{
  return MEMORY[0x1E0DA15C8]();
}

uint64_t type metadata accessor for UsoTask_create_common_Note()
{
  return MEMORY[0x1E0DA15D0]();
}

uint64_t type metadata accessor for UsoTask_delete_common_Note()
{
  return MEMORY[0x1E0DA15D8]();
}

uint64_t type metadata accessor for UsoTask_noVerb_common_Note()
{
  return MEMORY[0x1E0DA15E0]();
}

uint64_t type metadata accessor for UsoTask_pause_uso_NoEntity()
{
  return MEMORY[0x1E0DA15E8]();
}

uint64_t type metadata accessor for UsoTask_read_common_Person()
{
  return MEMORY[0x1E0DA15F0]();
}

uint64_t type metadata accessor for UsoTask_reply_uso_NoEntity()
{
  return MEMORY[0x1E0DA15F8]();
}

uint64_t type metadata accessor for UsoTask_set_common_Setting()
{
  return MEMORY[0x1E0DA1600]();
}

uint64_t type metadata accessor for UsoTask_update_common_Note()
{
  return MEMORY[0x1E0DA1610]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_Reference.userEntities.getter()
{
  return MEMORY[0x1E0DA1618]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_Reference.reference.getter()
{
  return MEMORY[0x1E0DA1620]();
}

uint64_t type metadata accessor for UsoTask_create_common_Alarm()
{
  return MEMORY[0x1E0DA1730]();
}

uint64_t type metadata accessor for UsoTask_noVerb_common_Alarm()
{
  return MEMORY[0x1E0DA1738]();
}

uint64_t type metadata accessor for UsoTask_noVerb_uso_NoEntity()
{
  return MEMORY[0x1E0DA1740]();
}

uint64_t type metadata accessor for UsoTask_open_common_Setting()
{
  return MEMORY[0x1E0DA1748]();
}

uint64_t type metadata accessor for UsoTask_read_common_Message()
{
  return MEMORY[0x1E0DA1750]();
}

uint64_t type metadata accessor for UsoTask_repeat_uso_NoEntity()
{
  return MEMORY[0x1E0DA1758]();
}

uint64_t type metadata accessor for UsoTask_request_common_Note()
{
  return MEMORY[0x1E0DA1760]();
}

uint64_t type metadata accessor for UsoTask_resume_uso_NoEntity()
{
  return MEMORY[0x1E0DA1768]();
}

uint64_t type metadata accessor for UsoTask_send_common_Message()
{
  return MEMORY[0x1E0DA1778]();
}

uint64_t dispatch thunk of UsoEntity_common_Measurement.components.getter()
{
  return MEMORY[0x1E0DA1820]();
}

uint64_t dispatch thunk of UsoEntity_common_MessageMode.definedValue.getter()
{
  return MEMORY[0x1E0DA1828]();
}

uint64_t type metadata accessor for UsoEntity_common_MessageMode.DefinedValues()
{
  return MEMORY[0x1E0DA1838]();
}

uint64_t type metadata accessor for UsoTask_create_common_Person()
{
  return MEMORY[0x1E0DA18D8]();
}

uint64_t type metadata accessor for UsoTask_delete_common_Person()
{
  return MEMORY[0x1E0DA18E0]();
}

uint64_t type metadata accessor for UsoTask_noVerb_common_Person()
{
  return MEMORY[0x1E0DA18E8]();
}

uint64_t type metadata accessor for UsoTask_read_common_Reminder()
{
  return MEMORY[0x1E0DA18F0]();
}

uint64_t type metadata accessor for UsoTask_reply_common_Message()
{
  return MEMORY[0x1E0DA18F8]();
}

uint64_t type metadata accessor for UsoTask_restart_uso_NoEntity()
{
  return MEMORY[0x1E0DA1900]();
}

uint64_t type metadata accessor for UsoTask_share_common_Message()
{
  return MEMORY[0x1E0DA1908]();
}

uint64_t type metadata accessor for UsoTask_update_common_Person()
{
  return MEMORY[0x1E0DA1910]();
}

uint64_t dispatch thunk of UsoEntity_common_Interjection.definedValue.getter()
{
  return MEMORY[0x1E0DA1970]();
}

uint64_t type metadata accessor for UsoEntity_common_Interjection.DefinedValues()
{
  return MEMORY[0x1E0DA1990]();
}

uint64_t dispatch thunk of UsoEntity_common_ListPosition.definedValue.getter()
{
  return MEMORY[0x1E0DA19A8]();
}

uint64_t UsoEntity_common_ListPosition.DefinedValues.rawValue.getter()
{
  return MEMORY[0x1E0DA1AB8]();
}

uint64_t type metadata accessor for UsoEntity_common_ListPosition.DefinedValues()
{
  return MEMORY[0x1E0DA1AC0]();
}

uint64_t type metadata accessor for UsoEntity_common_Notification()
{
  return MEMORY[0x1E0DA1AD0]();
}

uint64_t type metadata accessor for UsoTask_delete_common_Message()
{
  return MEMORY[0x1E0DA1B10]();
}

uint64_t type metadata accessor for UsoTask_enable_common_Setting()
{
  return MEMORY[0x1E0DA1B18]();
}

uint64_t type metadata accessor for UsoTask_noVerb_common_Message()
{
  return MEMORY[0x1E0DA1B30]();
}

uint64_t type metadata accessor for UsoTask_noVerb_common_Setting()
{
  return MEMORY[0x1E0DA1B38]();
}

uint64_t type metadata accessor for UsoTask_noVerb_common_Workout()
{
  return MEMORY[0x1E0DA1B40]();
}

uint64_t type metadata accessor for UsoTask_open_common_HealthLog()
{
  return MEMORY[0x1E0DA1B48]();
}

uint64_t type metadata accessor for UsoTask_play_common_MediaItem()
{
  return MEMORY[0x1E0DA1B50]();
}

uint64_t type metadata accessor for UsoTask_request_common_Person()
{
  return MEMORY[0x1E0DA1B60]();
}

uint64_t type metadata accessor for UsoTask_stop_common_MediaItem()
{
  return MEMORY[0x1E0DA1B68]();
}

uint64_t type metadata accessor for UsoTask_summarise_common_Note()
{
  return MEMORY[0x1E0DA1B70]();
}

uint64_t type metadata accessor for UsoTask_toggle_common_Setting()
{
  return MEMORY[0x1E0DA1B78]();
}

uint64_t type metadata accessor for UsoTask_unsend_common_Message()
{
  return MEMORY[0x1E0DA1B80]();
}

uint64_t type metadata accessor for UsoTask_update_common_Message()
{
  return MEMORY[0x1E0DA1B88]();
}

uint64_t dispatch thunk of UsoEntity_common_ReferenceType.definedValue.getter()
{
  return MEMORY[0x1E0DA1E50]();
}

uint64_t type metadata accessor for UsoEntity_common_ReferenceType.DefinedValues()
{
  return MEMORY[0x1E0DA1E68]();
}

uint64_t type metadata accessor for UsoTask_create_common_Reminder()
{
  return MEMORY[0x1E0DA1EE8]();
}

uint64_t type metadata accessor for UsoTask_delete_common_Reminder()
{
  return MEMORY[0x1E0DA1EF0]();
}

uint64_t type metadata accessor for UsoTask_disable_common_Setting()
{
  return MEMORY[0x1E0DA1EF8]();
}

uint64_t type metadata accessor for UsoTask_noVerb_common_Reminder()
{
  return MEMORY[0x1E0DA1F00]();
}

uint64_t type metadata accessor for UsoTask_ping_common_UserEntity()
{
  return MEMORY[0x1E0DA1F08]();
}

uint64_t type metadata accessor for UsoTask_request_common_Message()
{
  return MEMORY[0x1E0DA1F10]();
}

uint64_t type metadata accessor for UsoTask_snooze_common_Reminder()
{
  return MEMORY[0x1E0DA1F18]();
}

uint64_t type metadata accessor for UsoTask_unshare_common_Message()
{
  return MEMORY[0x1E0DA1F30]();
}

uint64_t type metadata accessor for UsoTask_update_common_Reminder()
{
  return MEMORY[0x1E0DA1F38]();
}

uint64_t type metadata accessor for UsoTask_create_common_HealthLog()
{
  return MEMORY[0x1E0DA1F90]();
}

uint64_t type metadata accessor for UsoTask_delete_common_HealthLog()
{
  return MEMORY[0x1E0DA1F98]();
}

uint64_t type metadata accessor for UsoTask_disable_common_Reminder()
{
  return MEMORY[0x1E0DA1FA0]();
}

uint64_t type metadata accessor for UsoTask_hangup_common_PhoneCall()
{
  return MEMORY[0x1E0DA1FB8]();
}

uint64_t type metadata accessor for UsoTask_noVerb_common_HealthLog()
{
  return MEMORY[0x1E0DA1FC0]();
}

uint64_t type metadata accessor for UsoTask_request_common_DateTime()
{
  return MEMORY[0x1E0DA1FE8]();
}

uint64_t type metadata accessor for UsoTask_request_common_Reminder()
{
  return MEMORY[0x1E0DA1FF0]();
}

uint64_t type metadata accessor for UsoTask_resume_common_MediaItem()
{
  return MEMORY[0x1E0DA1FF8]();
}

uint64_t type metadata accessor for UsoTask_run_common_VoiceCommand()
{
  return MEMORY[0x1E0DA2000]();
}

uint64_t type metadata accessor for UsoTask_summarise_common_Person()
{
  return MEMORY[0x1E0DA2010]();
}

uint64_t type metadata accessor for UsoTask_update_common_HealthLog()
{
  return MEMORY[0x1E0DA2028]();
}

uint64_t type metadata accessor for UsoTask_update_common_PhoneCall()
{
  return MEMORY[0x1E0DA2040]();
}

uint64_t type metadata accessor for UsoTask_create_common_NoteFolder()
{
  return MEMORY[0x1E0DA2158]();
}

uint64_t type metadata accessor for UsoTask_delete_common_NoteFolder()
{
  return MEMORY[0x1E0DA2160]();
}

uint64_t type metadata accessor for UsoTask_noVerb_common_NoteFolder()
{
  return MEMORY[0x1E0DA2170]();
}

uint64_t type metadata accessor for UsoTask_noVerb_common_UserEntity()
{
  return MEMORY[0x1E0DA2178]();
}

uint64_t type metadata accessor for UsoTask_play_common_Announcement()
{
  return MEMORY[0x1E0DA2180]();
}

uint64_t type metadata accessor for UsoTask_read_common_Notification()
{
  return MEMORY[0x1E0DA2190]();
}

uint64_t type metadata accessor for UsoTask_read_common_ReminderList()
{
  return MEMORY[0x1E0DA2198]();
}

uint64_t type metadata accessor for UsoTask_send_common_Announcement()
{
  return MEMORY[0x1E0DA21B0]();
}

uint64_t type metadata accessor for UsoTask_setNumber_common_Setting()
{
  return MEMORY[0x1E0DA21B8]();
}

uint64_t type metadata accessor for UsoTask_stop_common_Announcement()
{
  return MEMORY[0x1E0DA21D0]();
}

uint64_t type metadata accessor for UsoTask_summarise_common_Message()
{
  return MEMORY[0x1E0DA21D8]();
}

uint64_t type metadata accessor for UsoTask_summarise_common_Setting()
{
  return MEMORY[0x1E0DA21E0]();
}

uint64_t type metadata accessor for UsoTask_update_common_NoteFolder()
{
  return MEMORY[0x1E0DA21E8]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceSelect.select.getter()
{
  return MEMORY[0x1E0DA21F8]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceSelect.reference.getter()
{
  return MEMORY[0x1E0DA2200]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceTarget.userEntities.getter()
{
  return MEMORY[0x1E0DA2208]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceTarget.target.getter()
{
  return MEMORY[0x1E0DA2210]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceTarget.reference.getter()
{
  return MEMORY[0x1E0DA2218]();
}

uint64_t type metadata accessor for UsoTask_decreaseBy_common_Setting()
{
  return MEMORY[0x1E0DA2238]();
}

uint64_t type metadata accessor for UsoTask_enableSetting_common_Note()
{
  return MEMORY[0x1E0DA2240]();
}

uint64_t type metadata accessor for UsoTask_increaseBy_common_Setting()
{
  return MEMORY[0x1E0DA2250]();
}

uint64_t type metadata accessor for UsoTask_reply_common_Announcement()
{
  return MEMORY[0x1E0DA2258]();
}

uint64_t type metadata accessor for UsoTask_request_common_NoteFolder()
{
  return MEMORY[0x1E0DA2260]();
}

uint64_t type metadata accessor for UsoTask_request_common_UserEntity()
{
  return MEMORY[0x1E0DA2268]();
}

uint64_t type metadata accessor for UsoTask_setIdentity_common_Person()
{
  return MEMORY[0x1E0DA2270]();
}

uint64_t type metadata accessor for UsoTask_skipBackward_uso_NoEntity()
{
  return MEMORY[0x1E0DA2278]();
}

uint64_t type metadata accessor for UsoTask_summarise_common_Reminder()
{
  return MEMORY[0x1E0DA2280]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceControl.trigger.getter()
{
  return MEMORY[0x1E0DA2298]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceControl.reference.getter()
{
  return MEMORY[0x1E0DA22A0]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceTrigger.userEntities.getter()
{
  return MEMORY[0x1E0DA22A8]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceTrigger.trigger.getter()
{
  return MEMORY[0x1E0DA22B0]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceTrigger.reference.getter()
{
  return MEMORY[0x1E0DA22B8]();
}

uint64_t type metadata accessor for UsoTask_checkExistence_common_Note()
{
  return MEMORY[0x1E0DA2380]();
}

uint64_t type metadata accessor for UsoTask_create_common_ReminderList()
{
  return MEMORY[0x1E0DA2388]();
}

uint64_t type metadata accessor for UsoTask_delete_common_ReminderList()
{
  return MEMORY[0x1E0DA2390]();
}

uint64_t type metadata accessor for UsoTask_disableSetting_common_Note()
{
  return MEMORY[0x1E0DA2398]();
}

uint64_t type metadata accessor for UsoTask_noVerb_common_Interjection()
{
  return MEMORY[0x1E0DA23A0]();
}

uint64_t type metadata accessor for UsoTask_noVerb_common_ReminderList()
{
  return MEMORY[0x1E0DA23A8]();
}

uint64_t type metadata accessor for UsoTask_summarise_common_PhoneCall()
{
  return MEMORY[0x1E0DA23D0]();
}

uint64_t type metadata accessor for UsoTask_summarise_common_Voicemail()
{
  return MEMORY[0x1E0DA23D8]();
}

uint64_t type metadata accessor for UsoTask_update_common_ReminderList()
{
  return MEMORY[0x1E0DA23E8]();
}

uint64_t type metadata accessor for UsoTask_execute_common_VoiceCommand()
{
  return MEMORY[0x1E0DA2460]();
}

uint64_t type metadata accessor for UsoTask_request_common_ReminderList()
{
  return MEMORY[0x1E0DA2468]();
}

uint64_t type metadata accessor for UsoTask_summarise_common_NoteFolder()
{
  return MEMORY[0x1E0DA2470]();
}

uint64_t type metadata accessor for UsoTask_update_common_Communication()
{
  return MEMORY[0x1E0DA2480]();
}

uint64_t type metadata accessor for UsoTask_checkExistence_common_Person()
{
  return MEMORY[0x1E0DA2538]();
}

uint64_t dispatch thunk of UsoEntity_common_MeasurementComponent.unit.getter()
{
  return MEMORY[0x1E0DA2578]();
}

uint64_t type metadata accessor for UsoTask_checkExistence_common_Message()
{
  return MEMORY[0x1E0DA2580]();
}

uint64_t type metadata accessor for UsoTask_checkExistence_common_Setting()
{
  return MEMORY[0x1E0DA2588]();
}

uint64_t type metadata accessor for UsoTask_create_common_MedicationEvent()
{
  return MEMORY[0x1E0DA2590]();
}

uint64_t type metadata accessor for UsoTask_enableSetting_common_Reminder()
{
  return MEMORY[0x1E0DA2598]();
}

uint64_t type metadata accessor for UsoTask_getLocation_common_UserEntity()
{
  return MEMORY[0x1E0DA25A0]();
}

uint64_t type metadata accessor for UsoTask_snooze_common_MedicationEvent()
{
  return MEMORY[0x1E0DA25B0]();
}

uint64_t type metadata accessor for UsoTask_summarise_common_NotebookList()
{
  return MEMORY[0x1E0DA25B8]();
}

uint64_t type metadata accessor for UsoTask_summarise_common_ReminderList()
{
  return MEMORY[0x1E0DA25C0]();
}

uint64_t type metadata accessor for UsoTask_checkExistence_common_Reminder()
{
  return MEMORY[0x1E0DA25F0]();
}

uint64_t type metadata accessor for UsoTask_disableSetting_common_Reminder()
{
  return MEMORY[0x1E0DA25F8]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_LocalisedString.setStringValue(value:)()
{
  return MEMORY[0x1E0DA2600]();
}

uint64_t UsoEntityBuilder_common_LocalisedString.init()()
{
  return MEMORY[0x1E0DA2608]();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_LocalisedString()
{
  return MEMORY[0x1E0DA2610]();
}

uint64_t type metadata accessor for UsoTask_checkExistence_common_HealthLog()
{
  return MEMORY[0x1E0DA2670]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceNumberTrigger.userEntities.getter()
{
  return MEMORY[0x1E0DA26A0]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceNumberTrigger.trigger.getter()
{
  return MEMORY[0x1E0DA26A8]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceNumberTrigger.reference.getter()
{
  return MEMORY[0x1E0DA26B0]();
}

uint64_t type metadata accessor for UsoTask_action_common_SocialConversation()
{
  return MEMORY[0x1E0DA26E0]();
}

uint64_t type metadata accessor for UsoTask_checkExistence_common_NoteFolder()
{
  return MEMORY[0x1E0DA26E8]();
}

uint64_t type metadata accessor for UsoTask_create_common_MedicationSchedule()
{
  return MEMORY[0x1E0DA26F8]();
}

uint64_t type metadata accessor for UsoTask_delete_common_MedicationSchedule()
{
  return MEMORY[0x1E0DA2700]();
}

uint64_t type metadata accessor for UsoTask_update_common_MedicationSchedule()
{
  return MEMORY[0x1E0DA2708]();
}

uint64_t type metadata accessor for UsoTask_request_common_MedicationSchedule()
{
  return MEMORY[0x1E0DA2720]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceMeasurementUnit.reference.getter()
{
  return MEMORY[0x1E0DA2728]();
}

uint64_t type metadata accessor for UsoTask_checkExistence_common_ReminderList()
{
  return MEMORY[0x1E0DA2760]();
}

uint64_t type metadata accessor for UsoTask_summarise_common_MedicationSchedule()
{
  return MEMORY[0x1E0DA2768]();
}

uint64_t type metadata accessor for UsoTask_checkExistence_common_MedicationEvent()
{
  return MEMORY[0x1E0DA2798]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceVoiceCommandPayload.reference.getter()
{
  return MEMORY[0x1E0DA27A8]();
}

uint64_t type metadata accessor for UsoTask_checkExistence_common_MedicationSchedule()
{
  return MEMORY[0x1E0DA27C8]();
}

uint64_t Node.entitySpans.getter()
{
  return MEMORY[0x1E0DA28A0]();
}

uint64_t type metadata accessor for Node()
{
  return MEMORY[0x1E0DA2900]();
}

uint64_t dispatch thunk of Graph.description.getter()
{
  return MEMORY[0x1E0DA2940]();
}

uint64_t dispatch thunk of Graph.nodes.getter()
{
  return MEMORY[0x1E0DA2978]();
}

uint64_t UsoTask.verbString.getter()
{
  return MEMORY[0x1E0DA2A48]();
}

uint64_t UsoTask.baseEntityAsString.getter()
{
  return MEMORY[0x1E0DA2A50]();
}

uint64_t UsoTask.arguments.getter()
{
  return MEMORY[0x1E0DA2A58]();
}

uint64_t NLIntent.domainNode.getter()
{
  return MEMORY[0x1E0DA2A70]();
}

uint64_t NLIntent.init(protobufData:)()
{
  return MEMORY[0x1E0DA2A80]();
}

uint64_t type metadata accessor for NLIntent()
{
  return MEMORY[0x1E0DA2A90]();
}

uint64_t dispatch thunk of UsoValue.getAsPrimitiveValueString()()
{
  return MEMORY[0x1E0DA2AA8]();
}

uint64_t dispatch thunk of UsoValue.getUsoIdentifiers()()
{
  return MEMORY[0x1E0DA2AB0]();
}

uint64_t dispatch thunk of UsoValue.getAsEntity()()
{
  return MEMORY[0x1E0DA2AB8]();
}

uint64_t dispatch thunk of UsoValue.getEntitySpans()()
{
  return MEMORY[0x1E0DA2AC0]();
}

uint64_t MatchInfo.hasMatchSignals(_:)()
{
  return MEMORY[0x1E0DA2AF0]();
}

uint64_t static MatchInfo.MatchSignals.approximateMatch.getter()
{
  return MEMORY[0x1E0DA2AF8]();
}

uint64_t static MatchInfo.MatchSignals.aliasMatch.getter()
{
  return MEMORY[0x1E0DA2B00]();
}

uint64_t static MatchInfo.MatchSignals.exactMatch.getter()
{
  return MEMORY[0x1E0DA2B08]();
}

uint64_t static MatchInfo.MatchSignals.partialMatch.getter()
{
  return MEMORY[0x1E0DA2B10]();
}

uint64_t type metadata accessor for MatchInfo.MatchSignals()
{
  return MEMORY[0x1E0DA2B18]();
}

uint64_t type metadata accessor for MatchInfo()
{
  return MEMORY[0x1E0DA2B98]();
}

uint64_t UsoEntity.attributes.getter()
{
  return MEMORY[0x1E0DA2BA8]();
}

uint64_t UsoEntity.entitySpans.getter()
{
  return MEMORY[0x1E0DA2BB0]();
}

uint64_t UsoEntity.usoIdentifiers.getter()
{
  return MEMORY[0x1E0DA2BB8]();
}

uint64_t UsoEntity.valueTypeString.getter()
{
  return MEMORY[0x1E0DA2BC0]();
}

uint64_t TaggingService.init()()
{
  return MEMORY[0x1E0D97860]();
}

uint64_t type metadata accessor for TaggingService()
{
  return MEMORY[0x1E0D97868]();
}

uint64_t static DataClassificationTag.searchRequest(requestIdentifier:optedInToSearchSharing:)()
{
  return MEMORY[0x1E0D97878]();
}

uint64_t type metadata accessor for DataClassificationTag()
{
  return MEMORY[0x1E0D97888]();
}

uint64_t DateTimeResolver.makeRecommendation(value:context:spec:)()
{
  return MEMORY[0x1E0D98630]();
}

uint64_t DateTimeResolver.init()()
{
  return MEMORY[0x1E0D98638]();
}

uint64_t type metadata accessor for DateTimeResolver()
{
  return MEMORY[0x1E0D98640]();
}

uint64_t type metadata accessor for DateTimeResolutionSpec.DateTimeConvergenceStrategy()
{
  return MEMORY[0x1E0D98710]();
}

uint64_t type metadata accessor for DateTimeResolutionSpec.ExpandToType()
{
  return MEMORY[0x1E0D98728]();
}

uint64_t DateTimeResolutionSpec.init(expandToType:dateTimeConvergenceStrategy:overridesForDefinedDateTimeRanges:inferDurationAsInterval:witchingHourRoundOffEnabled:convergeToOperatingHours:)()
{
  return MEMORY[0x1E0D98730]();
}

uint64_t type metadata accessor for DateTimeResolutionSpec()
{
  return MEMORY[0x1E0D98740]();
}

uint64_t type metadata accessor for DateTimeResolutionContext.Hemisphere()
{
  return MEMORY[0x1E0D98780]();
}

uint64_t DateTimeResolutionContext.init(with:regionFormat:regionAwareLanguage:timeZone:hemisphere:calendar:date:)()
{
  return MEMORY[0x1E0D98788]();
}

uint64_t type metadata accessor for DateTimeResolutionContext()
{
  return MEMORY[0x1E0D98790]();
}

uint64_t DateTime.init(withDate:time:)()
{
  return MEMORY[0x1E0D98810]();
}

uint64_t DateTime.Time.init(withHour:)()
{
  return MEMORY[0x1E0D98818]();
}

uint64_t type metadata accessor for DateTime.Time()
{
  return MEMORY[0x1E0D98820]();
}

uint64_t type metadata accessor for DateTime.DateTimeRange.DefinedDateTimeRange()
{
  return MEMORY[0x1E0D98828]();
}

uint64_t DateTime.toINDateComponentsRange(calendar:timeZone:)()
{
  return MEMORY[0x1E0D98848]();
}

uint64_t type metadata accessor for DateTime()
{
  return MEMORY[0x1E0D98858]();
}

Swift::Void __swiftcall flushProcessWideSiriEnvironmentCache()()
{
  MEMORY[0x1E0DA7A78]();
}

uint64_t static SiriEnvironment.withTaskLocalEnvironment<A, B>(for:_:)()
{
  return MEMORY[0x1E0DA7A80]();
}

{
  return MEMORY[0x1E0DA7A88]();
}

uint64_t static SiriEnvironment.withTaskLocalEnvironment<A>(_:_:)()
{
  return MEMORY[0x1E0DA7A98]();
}

{
  return MEMORY[0x1E0DA7AA0]();
}

uint64_t SiriEnvironment.scopedReferenceResolutionData.getter()
{
  return MEMORY[0x1E0DA3C60]();
}

uint64_t SiriEnvironment.salientEntitiesProvider.getter()
{
  return MEMORY[0x1E0DA3C68]();
}

uint64_t SiriEnvironment.currentTCU.setter()
{
  return MEMORY[0x1E0D9C760]();
}

uint64_t SiriEnvironment.userIdentity.getter()
{
  return MEMORY[0x1E0D9C768]();
}

uint64_t SiriEnvironment.aceServiceContext.getter()
{
  return MEMORY[0x1E0D9C770]();
}

uint64_t SiriEnvironment.correctionsClientProvider.getter()
{
  return MEMORY[0x1E0D9C778]();
}

uint64_t SiriEnvironment.correctionsClientProvider.setter()
{
  return MEMORY[0x1E0D9C780]();
}

uint64_t SiriEnvironment.flowTask.setter()
{
  return MEMORY[0x1E0D9C788]();
}

uint64_t SiriEnvironment.callState.getter()
{
  return MEMORY[0x1E0D9C790]();
}

uint64_t SiriEnvironment.currentRequest.getter()
{
  return MEMORY[0x1E0D981D8]();
}

uint64_t SiriEnvironment.currentRequest.setter()
{
  return MEMORY[0x1E0D981E0]();
}

uint64_t SiriEnvironment.homeKitProvider.getter()
{
  return MEMORY[0x1E0D981E8]();
}

uint64_t SiriEnvironment.currentDevice.getter()
{
  return MEMORY[0x1E0DA7AB0]();
}

uint64_t SiriEnvironment.currentProcess.getter()
{
  return MEMORY[0x1E0DA7AB8]();
}

uint64_t static SiriEnvironment.forCurrentTask.getter()
{
  return MEMORY[0x1E0DA7AC0]();
}

uint64_t dispatch thunk of SiriEnvironment.requireProvider<A>(of:)()
{
  return MEMORY[0x1E0DA7AC8]();
}

uint64_t SiriEnvironment.networkAvailability.getter()
{
  return MEMORY[0x1E0DA7AD0]();
}

uint64_t static SiriEnvironment.root.getter()
{
  return MEMORY[0x1E0DA7AD8]();
}

uint64_t SiriEnvironment.init(parent:)()
{
  return MEMORY[0x1E0DA7AE0]();
}

uint64_t static SiriEnvironment.default.getter()
{
  return MEMORY[0x1E0DA7AE8]();
}

uint64_t dispatch thunk of SiriEnvironment.providers.getter()
{
  return MEMORY[0x1E0DA7AF0]();
}

uint64_t type metadata accessor for SiriEnvironment()
{
  return MEMORY[0x1E0DA7AF8]();
}

uint64_t dispatch thunk of SiriEnvironment.subscript.getter()
{
  return MEMORY[0x1E0DA7B08]();
}

uint64_t type metadata accessor for SiriVoiceGender()
{
  return MEMORY[0x1E0DA7B28]();
}

uint64_t dispatch thunk of SiriEnvironmentLocating.siriEnvironment.getter()
{
  return MEMORY[0x1E0DA7B48]();
}

uint64_t dispatch thunk of SiriEnvironmentLocating.siriEnvironment.setter()
{
  return MEMORY[0x1E0DA7B50]();
}

uint64_t SiriEnvironmentLocating<>.siriEnvironment.modify()
{
  return MEMORY[0x1E0DA7B58]();
}

uint64_t SiriEnvironmentLocating<>.siriEnvironment.getter()
{
  return MEMORY[0x1E0DA7B60]();
}

uint64_t SiriEnvironmentLocating<>.siriEnvironment.setter()
{
  return MEMORY[0x1E0DA7B68]();
}

uint64_t static SiriEnvironmentProvider.defaultScope.getter()
{
  return MEMORY[0x1E0DA7B70]();
}

uint64_t AudioSource.init(aceValue:)()
{
  return MEMORY[0x1E0DA7B78]();
}

uint64_t AudioSource.aceValue.getter()
{
  return MEMORY[0x1E0DA7B80]();
}

uint64_t type metadata accessor for AudioSource()
{
  return MEMORY[0x1E0DA7B88]();
}

uint64_t static BargeInMode.overSiri.getter()
{
  return MEMORY[0x1E0DA7B98]();
}

uint64_t static BargeInMode.none.getter()
{
  return MEMORY[0x1E0DA7BA0]();
}

uint64_t BargeInMode.init(rawValue:)()
{
  return MEMORY[0x1E0DA7BA8]();
}

uint64_t BargeInMode.rawValue.getter()
{
  return MEMORY[0x1E0DA7BB0]();
}

uint64_t static BargeInMode.overAlarm.getter()
{
  return MEMORY[0x1E0DA7BB8]();
}

uint64_t static BargeInMode.overMedia.getter()
{
  return MEMORY[0x1E0DA7BC0]();
}

uint64_t static BargeInMode.overTimer.getter()
{
  return MEMORY[0x1E0DA7BC8]();
}

uint64_t type metadata accessor for BargeInMode()
{
  return MEMORY[0x1E0DA7BD0]();
}

uint64_t static DeviceIdiom.== infix(_:_:)()
{
  return MEMORY[0x1E0DA7C48]();
}

uint64_t DeviceIdiom.init(aceValue:)()
{
  return MEMORY[0x1E0DA7CA0]();
}

uint64_t type metadata accessor for DeviceIdiom()
{
  return MEMORY[0x1E0DA7CA8]();
}

uint64_t dispatch thunk of IdleTracker.track(name:)()
{
  return MEMORY[0x1E0DA7CC8]();
}

uint64_t InputOrigin.init(aceValue:)()
{
  return MEMORY[0x1E0DA7D38]();
}

uint64_t InputOrigin.init(rawValue:)()
{
  return MEMORY[0x1E0DA7D40]();
}

uint64_t InputOrigin.rawValue.getter()
{
  return MEMORY[0x1E0DA7D48]();
}

uint64_t type metadata accessor for InputOrigin()
{
  return MEMORY[0x1E0DA7D50]();
}

{
  return MEMORY[0x1E0D9E7E0]();
}

uint64_t Transformer.transform.getter()
{
  return MEMORY[0x1E0DA7D80]();
}

uint64_t withTimeout<A>(seconds:operation:)()
{
  return MEMORY[0x1E0DA7D98]();
}

uint64_t dispatch thunk of PluginFinder.findAllPackages()()
{
  return MEMORY[0x1E0DA7DB0]();
}

uint64_t static ResponseMode.displayForward.getter()
{
  return MEMORY[0x1E0DA7DC8]();
}

uint64_t ResponseMode.init(aceValue:)()
{
  return MEMORY[0x1E0DA7DD0]();
}

uint64_t ResponseMode.aceValue.getter()
{
  return MEMORY[0x1E0DA7DD8]();
}

uint64_t type metadata accessor for ResponseMode()
{
  return MEMORY[0x1E0DA7DE8]();
}

uint64_t Restrictions.deviceRestrictions.getter()
{
  return MEMORY[0x1E0DA7E10]();
}

uint64_t Restrictions.init(deviceRestrictions:)()
{
  return MEMORY[0x1E0DA7E18]();
}

uint64_t Restrictions.init(restrictedCommands:)()
{
  return MEMORY[0x1E0DA7E20]();
}

uint64_t Restrictions.restrictedCommands.getter()
{
  return MEMORY[0x1E0DA7E28]();
}

uint64_t Restrictions.init(aceValue:)()
{
  return MEMORY[0x1E0DA7E30]();
}

uint64_t type metadata accessor for Restrictions()
{
  return MEMORY[0x1E0DA7E38]();
}

uint64_t type metadata accessor for TimeoutError()
{
  return MEMORY[0x1E0DA7E48]();
}

uint64_t CurrentDevice.localDeviceIdiom.getter()
{
  return MEMORY[0x1E0D9C7A8]();
}

uint64_t dispatch thunk of CurrentDevice.siriLocale.getter()
{
  return MEMORY[0x1E0DA7E50]();
}

uint64_t dispatch thunk of CurrentDevice.deviceClass.getter()
{
  return MEMORY[0x1E0DA7E60]();
}

uint64_t dispatch thunk of CurrentDevice.deviceIdiom.getter()
{
  return MEMORY[0x1E0DA7E70]();
}

uint64_t dispatch thunk of CurrentDevice.siriVoiceGender.getter()
{
  return MEMORY[0x1E0DA7E88]();
}

uint64_t dispatch thunk of CurrentDevice.deviceRegionCode.getter()
{
  return MEMORY[0x1E0DA7E98]();
}

uint64_t dispatch thunk of CurrentDevice.restrictedCommands.getter()
{
  return MEMORY[0x1E0DA7EA8]();
}

uint64_t dispatch thunk of CurrentDevice.supportsVehicleData.getter()
{
  return MEMORY[0x1E0DA7EB8]();
}

uint64_t dispatch thunk of CurrentDevice.isLockedWithPasscode.getter()
{
  return MEMORY[0x1E0DA7EC8]();
}

uint64_t dispatch thunk of CurrentDevice.isTextToSpeechEnabled.getter()
{
  return MEMORY[0x1E0DA7ED8]();
}

uint64_t dispatch thunk of CurrentDevice.isVoiceTriggerEnabled.getter()
{
  return MEMORY[0x1E0DA7EE8]();
}

uint64_t CurrentDevice.setRestrictedCommands(_:)()
{
  return MEMORY[0x1E0DA7EF8]();
}

uint64_t dispatch thunk of CurrentDevice.preferencesLanguageCode.getter()
{
  return MEMORY[0x1E0DA7F00]();
}

uint64_t dispatch thunk of CurrentDevice.personalDomainsAuthenticationMode.getter()
{
  return MEMORY[0x1E0DA7F10]();
}

uint64_t dispatch thunk of CurrentDevice.isAppleTV.getter()
{
  return MEMORY[0x1E0DA7F38]();
}

uint64_t dispatch thunk of PluginCatalog.getPlugin(id:)()
{
  return MEMORY[0x1E0DA7F68]();
}

uint64_t BargeInContext.approximatePreviousTTSInterval.getter()
{
  return MEMORY[0x1E0DA7F78]();
}

uint64_t BargeInContext.init(mode:approximatePreviousTTSInterval:)()
{
  return MEMORY[0x1E0DA7F80]();
}

uint64_t BargeInContext.mode.getter()
{
  return MEMORY[0x1E0DA7F88]();
}

uint64_t type metadata accessor for BargeInContext()
{
  return MEMORY[0x1E0DA7F90]();
}

uint64_t dispatch thunk of CurrentProcess.idleTracker.getter()
{
  return MEMORY[0x1E0DA7FA0]();
}

uint64_t static Transformation.defaultLengthLimit.getter()
{
  return MEMORY[0x1E0DA7FA8]();
}

uint64_t static Transformation.transform<A>(_:to:lengthLimit:)()
{
  return MEMORY[0x1E0DA7FB0]();
}

uint64_t TypeIdentifier.init(for:)()
{
  return MEMORY[0x1E0DA7FC0]();
}

uint64_t type metadata accessor for TypeIdentifier()
{
  return MEMORY[0x1E0DA7FD8]();
}

uint64_t InteractionType.init(aceValue:)()
{
  return MEMORY[0x1E0DA8020]();
}

uint64_t InteractionType.init(rawValue:)()
{
  return MEMORY[0x1E0DA8028]();
}

uint64_t InteractionType.rawValue.getter()
{
  return MEMORY[0x1E0DA8030]();
}

uint64_t type metadata accessor for InteractionType()
{
  return MEMORY[0x1E0DA8038]();
}

uint64_t TypeInformation.isOptional.getter()
{
  return MEMORY[0x1E0DA8048]();
}

uint64_t TypeInformation.init(for:)()
{
  return MEMORY[0x1E0DA8050]();
}

uint64_t type metadata accessor for TypeInformation()
{
  return MEMORY[0x1E0DA8058]();
}

uint64_t AudioDestination.init(aceValue:)()
{
  return MEMORY[0x1E0DA8060]();
}

uint64_t AudioDestination.aceValue.getter()
{
  return MEMORY[0x1E0DA8068]();
}

uint64_t type metadata accessor for AudioDestination()
{
  return MEMORY[0x1E0DA8070]();
}

uint64_t ExecutionLocation.description.getter()
{
  return MEMORY[0x1E0DA8080]();
}

uint64_t static ExecutionLocation.device.getter()
{
  return MEMORY[0x1E0DA8088]();
}

uint64_t static ExecutionLocation.server.getter()
{
  return MEMORY[0x1E0DA8090]();
}

uint64_t static ExecutionLocation.unknown.getter()
{
  return MEMORY[0x1E0DA8098]();
}

uint64_t type metadata accessor for ExecutionLocation()
{
  return MEMORY[0x1E0DA80A0]();
}

uint64_t static DeviceRestrictions.unauthenticatedByWatchProximity.getter()
{
  return MEMORY[0x1E0DA80D0]();
}

uint64_t static DeviceRestrictions.unauthenticatedByHeadphonesState.getter()
{
  return MEMORY[0x1E0DA80D8]();
}

uint64_t DeviceRestrictions.aceSet.getter()
{
  return MEMORY[0x1E0DA80E0]();
}

uint64_t DeviceRestrictions.init(rawValue:)()
{
  return MEMORY[0x1E0DA80F0]();
}

uint64_t DeviceRestrictions.rawValue.getter()
{
  return MEMORY[0x1E0DA80F8]();
}

uint64_t static DeviceRestrictions.starkMode.getter()
{
  return MEMORY[0x1E0DA8100]();
}

uint64_t type metadata accessor for DeviceRestrictions()
{
  return MEMORY[0x1E0DA8108]();
}

uint64_t ManagedContinuation.resume(with:)()
{
  return MEMORY[0x1E0DA8118]();
}

uint64_t ManagedContinuation.resume(throwing:)()
{
  return MEMORY[0x1E0DA8120]();
}

uint64_t ManagedContinuation.resume(returning:)()
{
  return MEMORY[0x1E0DA8128]();
}

uint64_t dispatch thunk of NetworkAvailability.isAvailable.getter()
{
  return MEMORY[0x1E0DA8138]();
}

uint64_t dispatch thunk of NetworkAvailability.isExpensive.getter()
{
  return MEMORY[0x1E0DA8148]();
}

uint64_t dispatch thunk of NetworkAvailability.isConstrained.getter()
{
  return MEMORY[0x1E0DA8158]();
}

uint64_t dispatch thunk of NetworkAvailability.isInAirplaneMode.getter()
{
  return MEMORY[0x1E0DA8168]();
}

uint64_t static NetworkAvailability.Status.== infix(_:_:)()
{
  return MEMORY[0x1E0DA8180]();
}

uint64_t type metadata accessor for NetworkAvailability.Status()
{
  return MEMORY[0x1E0DA8198]();
}

uint64_t dispatch thunk of NetworkAvailability.status.getter()
{
  return MEMORY[0x1E0DA81B0]();
}

uint64_t dispatch thunk of AutoBugCaptureManager.generateSnapshot(errorType:errorSubType:subTypeContext:completion:)()
{
  return MEMORY[0x1E0DA81D8]();
}

uint64_t AutoBugCaptureManager.init(domain:sessionDuration:)()
{
  return MEMORY[0x1E0DA81E0]();
}

uint64_t type metadata accessor for AutoBugCaptureManager()
{
  return MEMORY[0x1E0DA81E8]();
}

uint64_t dispatch thunk of PluginCapabilityCatalog.getPackages(capability:)()
{
  return MEMORY[0x1E0DA81F0]();
}

uint64_t static PluginCapabilityCatalog.load<A>(finder:cache:)()
{
  return MEMORY[0x1E0DA81F8]();
}

uint64_t PersonalDomainsAuthenticationMode.init(aceValue:)()
{
  return MEMORY[0x1E0DA8218]();
}

uint64_t type metadata accessor for PersonalDomainsAuthenticationMode()
{
  return MEMORY[0x1E0DA8220]();
}

uint64_t <+> infix(_:_:)()
{
  return MEMORY[0x1E0DA8230]();
}

uint64_t Builder.subscript.setter()
{
  return MEMORY[0x1E0DA8238]();
}

{
  return MEMORY[0x1E0DA8240]();
}

uint64_t HomeInfo.homeIdentifier.setter()
{
  return MEMORY[0x1E0DA8248]();
}

uint64_t HomeInfo.init()()
{
  return MEMORY[0x1E0DA8250]();
}

uint64_t type metadata accessor for HomeInfo()
{
  return MEMORY[0x1E0DA8258]();
}

uint64_t static Buildable.withBuilder(_:)()
{
  return MEMORY[0x1E0DA8268]();
}

uint64_t dispatch thunk of CorrectionsPlatformClient.setupNewTurn(executionUUID:)()
{
  return MEMORY[0x1E0D97BE0]();
}

uint64_t dispatch thunk of CorrectionsPlatformClient.setUndoInvocation(directInvocation:context:)()
{
  return MEMORY[0x1E0D97BE8]();
}

uint64_t CorrectionsPlatformClient.undoFollowUpPluginActionUserDataKey.getter()
{
  return MEMORY[0x1E0D97BF0]();
}

uint64_t dispatch thunk of CorrectionsPlatformClient.commit()()
{
  return MEMORY[0x1E0D97BF8]();
}

uint64_t dispatch thunk of CorrectionsPlatformClient.checkUndo(input:context:)()
{
  return MEMORY[0x1E0D97C00]();
}

uint64_t CorrectionsPlatformClient.init()()
{
  return MEMORY[0x1E0D97C08]();
}

uint64_t type metadata accessor for CorrectionsPlatformClient()
{
  return MEMORY[0x1E0D97C10]();
}

uint64_t CorrectionsDirectInvocation.init(identifier:userData:)()
{
  return MEMORY[0x1E0D97C20]();
}

uint64_t CorrectionsDirectInvocation.identifier.getter()
{
  return MEMORY[0x1E0D97C28]();
}

uint64_t CorrectionsDirectInvocation.userData.getter()
{
  return MEMORY[0x1E0D97C30]();
}

uint64_t type metadata accessor for CorrectionsDirectInvocation()
{
  return MEMORY[0x1E0D97C38]();
}

uint64_t type metadata accessor for CorrectionsParse()
{
  return MEMORY[0x1E0D97C58]();
}

uint64_t CorrectionsContext.init(userId:assistantId:)()
{
  return MEMORY[0x1E0D97C60]();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.assistantId(_:)()
{
  return MEMORY[0x1E0D97C68]();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.resultCandidateId(_:)()
{
  return MEMORY[0x1E0D97C70]();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.executionRequestId(_:)()
{
  return MEMORY[0x1E0D97C78]();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.build()()
{
  return MEMORY[0x1E0D97C80]();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.userId(_:)()
{
  return MEMORY[0x1E0D97C88]();
}

uint64_t static CorrectionsContext.builder.getter()
{
  return MEMORY[0x1E0D97C90]();
}

uint64_t type metadata accessor for CorrectionsContext()
{
  return MEMORY[0x1E0D97C98]();
}

uint64_t CorrectionsUSOParse.init(userParse:parserIdentifier:appBundleId:)()
{
  return MEMORY[0x1E0D97CA8]();
}

uint64_t UndoAction.parseExludingUndoUserDialogActs.getter()
{
  return MEMORY[0x1E0D97CB0]();
}

uint64_t UndoAction.isExclusive.getter()
{
  return MEMORY[0x1E0D97CB8]();
}

uint64_t UndoAction.directInvocation.getter()
{
  return MEMORY[0x1E0D97CC0]();
}

uint64_t type metadata accessor for UndoAction()
{
  return MEMORY[0x1E0D97CC8]();
}

uint64_t EncoreEvent.serviceName.getter()
{
  return MEMORY[0x1E0D1F288]();
}

uint64_t dispatch thunk of EncoreEvent.getValue<A>()()
{
  return MEMORY[0x1E0D1F290]();
}

uint64_t type metadata accessor for EncoreEvent()
{
  return MEMORY[0x1E0D1F298]();
}

uint64_t dispatch thunk of static EncoreService.service.getter()
{
  return MEMORY[0x1E0D1F2A8]();
}

uint64_t type metadata accessor for EncoreService()
{
  return MEMORY[0x1E0D1F2B8]();
}

uint64_t ServiceName.rawValue.getter()
{
  return MEMORY[0x1E0D1F2C0]();
}

uint64_t type metadata accessor for ServiceName()
{
  return MEMORY[0x1E0D1F2C8]();
}

uint64_t dispatch thunk of AsyncService.events.getter()
{
  return MEMORY[0x1E0D1F2D8]();
}

uint64_t type metadata accessor for SystemEvents()
{
  return MEMORY[0x1E0D1F2F0]();
}

uint64_t static SnippetService.EventDataKey.getter()
{
  return MEMORY[0x1E0D1F308]();
}

uint64_t static SnippetService.DirectInvocationIdentifier.getter()
{
  return MEMORY[0x1E0D1F310]();
}

uint64_t type metadata accessor for SnippetService()
{
  return MEMORY[0x1E0D1F318]();
}

uint64_t IntentEventStore.log(event:)()
{
  return MEMORY[0x1E0D9A6A8]();
}

uint64_t IntentEventStore.init()()
{
  return MEMORY[0x1E0D9A6B0]();
}

uint64_t type metadata accessor for IntentEventStore()
{
  return MEMORY[0x1E0D9A6B8]();
}

uint64_t type metadata accessor for IntentResultType()
{
  return MEMORY[0x1E0D9A6F0]();
}

uint64_t IntentEvent.init(intentId:intentStart:createdAt:)()
{
  return MEMORY[0x1E0D9A748]();
}

uint64_t IntentEvent.init(intentId:intentResult:createdAt:)()
{
  return MEMORY[0x1E0D9A750]();
}

uint64_t IntentEvent.init(intentId:confirmationOffer:createdAt:)()
{
  return MEMORY[0x1E0D9A760]();
}

uint64_t IntentEvent.init(intentId:confirmationResult:createdAt:)()
{
  return MEMORY[0x1E0D9A768]();
}

uint64_t IntentEvent.init(intentId:disambiguationOffer:createdAt:)()
{
  return MEMORY[0x1E0D9A770]();
}

uint64_t IntentEvent.init(intentId:disambiguationResult:createdAt:)()
{
  return MEMORY[0x1E0D9A778]();
}

uint64_t type metadata accessor for IntentEvent()
{
  return MEMORY[0x1E0D9A798]();
}

uint64_t IntentStart.init(intent:timestamp:)()
{
  return MEMORY[0x1E0D9A7B0]();
}

uint64_t type metadata accessor for IntentStart()
{
  return MEMORY[0x1E0D9A7B8]();
}

uint64_t IntentResult.init(intentType:type:intent:timestamp:)()
{
  return MEMORY[0x1E0D9A7D0]();
}

uint64_t type metadata accessor for IntentResult()
{
  return MEMORY[0x1E0D9A7E0]();
}

uint64_t ConfirmationOffer.init(parameterName:intentType:multicardinalIndexValue:item:timestamp:)()
{
  return MEMORY[0x1E0D9A8F8]();
}

uint64_t type metadata accessor for ConfirmationOffer()
{
  return MEMORY[0x1E0D9A908]();
}

uint64_t ConfirmationResult.init(parameterName:intentType:multicardinalIndexValue:confirmedValue:timestamp:)()
{
  return MEMORY[0x1E0D9A930]();
}

uint64_t ConfirmationResult.init(parameterName:intentType:multicardinalIndexValue:resolution:timestamp:)()
{
  return MEMORY[0x1E0D9A938]();
}

uint64_t type metadata accessor for ConfirmationResult()
{
  return MEMORY[0x1E0D9A940]();
}

uint64_t DisambiguationOffer.init(parameterName:intentType:multicardinalIndexValue:disambiguationItems:timestamp:)()
{
  return MEMORY[0x1E0D9A968]();
}

uint64_t type metadata accessor for DisambiguationOffer()
{
  return MEMORY[0x1E0D9A978]();
}

uint64_t DisambiguationResult.init(parameterName:intentType:multicardinalIndexValue:resolvedValue:timestamp:)()
{
  return MEMORY[0x1E0D9A988]();
}

uint64_t type metadata accessor for DisambiguationResult()
{
  return MEMORY[0x1E0D9A990]();
}

uint64_t type metadata accessor for ConfirmationResolution()
{
  return MEMORY[0x1E0D9A9B8]();
}

uint64_t type metadata accessor for EndRequestMessageBase()
{
  return MEMORY[0x1E0D9C888]();
}

uint64_t FlowOutputMessage.init(build:)()
{
  return MEMORY[0x1E0D9C8C8]();
}

uint64_t FlowOutputMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9C8D0]();
}

uint64_t FlowOutputMessage.Builder.invocationId.setter()
{
  return MEMORY[0x1E0D9C8D8]();
}

uint64_t FlowOutputMessage.Builder.listenAfterSpeaking.setter()
{
  return MEMORY[0x1E0D9C8E0]();
}

uint64_t FlowOutputMessage.Builder.commandExecutionInfo.setter()
{
  return MEMORY[0x1E0D9C8E8]();
}

uint64_t FlowOutputMessage.Builder.source.setter()
{
  return MEMORY[0x1E0D9C8F0]();
}

uint64_t FlowOutputMessage.Builder.command.setter()
{
  return MEMORY[0x1E0D9C8F8]();
}

uint64_t FlowOutputMessage.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9C900]();
}

uint64_t FlowOutputMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9C908]();
}

uint64_t type metadata accessor for FlowOutputMessage()
{
  return MEMORY[0x1E0D9C918]();
}

uint64_t MUXContextMessage.isRMVEnabled.getter()
{
  return MEMORY[0x1E0D9C928]();
}

uint64_t MUXContextMessage.userIdToHomeMember.getter()
{
  return MEMORY[0x1E0D9C930]();
}

uint64_t type metadata accessor for MUXContextMessage()
{
  return MEMORY[0x1E0D9C938]();
}

uint64_t TTResponseMessage.MitigationDecision.rawValue.getter()
{
  return MEMORY[0x1E0D9C960]();
}

uint64_t type metadata accessor for TTResponseMessage.MitigationDecision()
{
  return MEMORY[0x1E0D9C978]();
}

uint64_t TTResponseMessage.mitigationDecision.getter()
{
  return MEMORY[0x1E0D9C998]();
}

uint64_t TTResponseMessage.tcuMappedNLResponse.getter()
{
  return MEMORY[0x1E0D9C9A0]();
}

uint64_t TTResponseMessage.init(build:)()
{
  return MEMORY[0x1E0D9C9A8]();
}

uint64_t TTResponseMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9C9B0]();
}

uint64_t TTResponseMessage.Builder.tcuStateDict.setter()
{
  return MEMORY[0x1E0D9C9B8]();
}

uint64_t TTResponseMessage.Builder.trpCandidateId.setter()
{
  return MEMORY[0x1E0D9C9C0]();
}

uint64_t TTResponseMessage.Builder.mitigationDecision.setter()
{
  return MEMORY[0x1E0D9C9C8]();
}

uint64_t TTResponseMessage.Builder.tcuMappedNLResponse.setter()
{
  return MEMORY[0x1E0D9C9D0]();
}

uint64_t TTResponseMessage.Builder.source.setter()
{
  return MEMORY[0x1E0D9C9D8]();
}

uint64_t TTResponseMessage.Builder.userId.setter()
{
  return MEMORY[0x1E0D9C9E0]();
}

uint64_t TTResponseMessage.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9C9E8]();
}

uint64_t TTResponseMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9C9F0]();
}

uint64_t type metadata accessor for TTResponseMessage()
{
  return MEMORY[0x1E0D9C9F8]();
}

uint64_t NLRepetitionMessage.repetitionResults.getter()
{
  return MEMORY[0x1E0D9CA08]();
}

uint64_t type metadata accessor for NLRepetitionMessage()
{
  return MEMORY[0x1E0D9CA10]();
}

uint64_t type metadata accessor for SessionEndedMessage()
{
  return MEMORY[0x1E0D9CA20]();
}

uint64_t StartRequestMessageBase.optionalRequestContextData.getter()
{
  return MEMORY[0x1E0D9CA28]();
}

uint64_t StartRequestMessageBase.inputOrigin.getter()
{
  return MEMORY[0x1E0D9CA30]();
}

uint64_t type metadata accessor for StartRequestMessageBase()
{
  return MEMORY[0x1E0D9CA68]();
}

uint64_t type metadata accessor for CancelRequestMessage()
{
  return MEMORY[0x1E0D9CB08]();
}

uint64_t FlowCompletedMessage.init(build:)()
{
  return MEMORY[0x1E0D9CB60]();
}

uint64_t FlowCompletedMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9CB68]();
}

uint64_t FlowCompletedMessage.Builder.source.setter()
{
  return MEMORY[0x1E0D9CB78]();
}

uint64_t FlowCompletedMessage.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9CB80]();
}

uint64_t FlowCompletedMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9CB88]();
}

uint64_t type metadata accessor for FlowCompletedMessage()
{
  return MEMORY[0x1E0D9CB90]();
}

uint64_t FlowPluginInfoMessage.init(build:)()
{
  return MEMORY[0x1E0D9CBA0]();
}

uint64_t FlowPluginInfoMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9CBA8]();
}

uint64_t FlowPluginInfoMessage.Builder.isPersonalRequest.setter()
{
  return MEMORY[0x1E0D9CBB0]();
}

uint64_t FlowPluginInfoMessage.Builder.resultCandidateId.setter()
{
  return MEMORY[0x1E0D9CBB8]();
}

uint64_t FlowPluginInfoMessage.Builder.supportsOnDeviceNL.setter()
{
  return MEMORY[0x1E0D9CBC0]();
}

uint64_t FlowPluginInfoMessage.Builder.source.setter()
{
  return MEMORY[0x1E0D9CBC8]();
}

uint64_t FlowPluginInfoMessage.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9CBD0]();
}

uint64_t FlowPluginInfoMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9CBD8]();
}

uint64_t type metadata accessor for FlowPluginInfoMessage()
{
  return MEMORY[0x1E0D9CBE0]();
}

uint64_t RequestContextMessage.isEyesFree.getter()
{
  return MEMORY[0x1E0D9CC50]();
}

uint64_t RequestContextMessage.audioSource.getter()
{
  return MEMORY[0x1E0D9CC58]();
}

uint64_t RequestContextMessage.isInAmbient.getter()
{
  return MEMORY[0x1E0D9CC60]();
}

uint64_t RequestContextMessage.bargeInModes.getter()
{
  return MEMORY[0x1E0D9CC68]();
}

uint64_t RequestContextMessage.responseMode.getter()
{
  return MEMORY[0x1E0D9CC70]();
}

uint64_t RequestContextMessage.audioDestination.getter()
{
  return MEMORY[0x1E0D9CC78]();
}

uint64_t RequestContextMessage.deviceRestrictions.getter()
{
  return MEMORY[0x1E0D9CC80]();
}

uint64_t RequestContextMessage.voiceAudioSessionId.getter()
{
  return MEMORY[0x1E0D9CC88]();
}

uint64_t RequestContextMessage.isTextToSpeechEnabled.getter()
{
  return MEMORY[0x1E0D9CC90]();
}

uint64_t RequestContextMessage.isTriggerlessFollowup.getter()
{
  return MEMORY[0x1E0D9CC98]();
}

uint64_t RequestContextMessage.isVoiceTriggerEnabled.getter()
{
  return MEMORY[0x1E0D9CCA0]();
}

uint64_t RequestContextMessage.voiceTriggerEventInfo.getter()
{
  return MEMORY[0x1E0D9CCA8]();
}

uint64_t RequestContextMessage.isSystemApertureEnabled.getter()
{
  return MEMORY[0x1E0D9CCB0]();
}

uint64_t RequestContextMessage.isLiveActivitiesSupported.getter()
{
  return MEMORY[0x1E0D9CCB8]();
}

uint64_t RequestContextMessage.approximatePreviousTTSInterval.getter()
{
  return MEMORY[0x1E0D9CCC0]();
}

uint64_t type metadata accessor for RequestContextMessage()
{
  return MEMORY[0x1E0D9CCC8]();
}

uint64_t ResultSelectedMessage.init(build:)()
{
  return MEMORY[0x1E0D9CCD0]();
}

uint64_t type metadata accessor for ResultSelectedMessage()
{
  return MEMORY[0x1E0D9CCD8]();
}

uint64_t ResultSelectedMessageBase.isMitigated.getter()
{
  return MEMORY[0x1E0D9CCE0]();
}

uint64_t ResultSelectedMessageBase.endpointMode.getter()
{
  return MEMORY[0x1E0D9CCE8]();
}

uint64_t ResultSelectedMessageBase.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9CCF0]();
}

uint64_t ResultSelectedMessageBase.Builder.isMitigated.setter()
{
  return MEMORY[0x1E0D9CCF8]();
}

uint64_t ResultSelectedMessageBase.Builder.endpointMode.setter()
{
  return MEMORY[0x1E0D9CD00]();
}

uint64_t ResultSelectedMessageBase.Builder.resultCandidateId.setter()
{
  return MEMORY[0x1E0D9CD08]();
}

uint64_t ResultSelectedMessageBase.Builder.source.setter()
{
  return MEMORY[0x1E0D9CD10]();
}

uint64_t ResultSelectedMessageBase.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9CD18]();
}

uint64_t ResultSelectedMessageBase.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9CD20]();
}

uint64_t SessionStartedMessage.understandingOnDevice.getter()
{
  return MEMORY[0x1E0D9CD38]();
}

uint64_t SessionStartedMessage.userId.getter()
{
  return MEMORY[0x1E0D9CD48]();
}

uint64_t type metadata accessor for SessionStartedMessage()
{
  return MEMORY[0x1E0D9CD88]();
}

uint64_t StartIFRequestMessage.inputOrigin.getter()
{
  return MEMORY[0x1E0D9CD98]();
}

uint64_t StartIFRequestMessage.rootRequestId.getter()
{
  return MEMORY[0x1E0D9CDA0]();
}

uint64_t StartIFRequestMessage.requestContextData.getter()
{
  return MEMORY[0x1E0D9CDA8]();
}

uint64_t type metadata accessor for StartIFRequestMessage()
{
  return MEMORY[0x1E0D9CE00]();
}

uint64_t FallbackToPommesMessage.init(build:)()
{
  return MEMORY[0x1E0D9CE68]();
}

uint64_t FallbackToPommesMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9CE78]();
}

uint64_t FallbackToPommesMessage.Builder.fallbackReason.setter()
{
  return MEMORY[0x1E0D9CE80]();
}

uint64_t FallbackToPommesMessage.Builder.pommesCandidateId.setter()
{
  return MEMORY[0x1E0D9CE88]();
}

uint64_t FallbackToPommesMessage.Builder.delegatedUserDialogActs.setter()
{
  return MEMORY[0x1E0D9CE90]();
}

uint64_t FallbackToPommesMessage.Builder.source.setter()
{
  return MEMORY[0x1E0D9CE98]();
}

uint64_t FallbackToPommesMessage.Builder.userId.setter()
{
  return MEMORY[0x1E0D9CEA0]();
}

uint64_t FallbackToPommesMessage.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9CEA8]();
}

uint64_t FallbackToPommesMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9CEB0]();
}

uint64_t type metadata accessor for FallbackToPommesMessage()
{
  return MEMORY[0x1E0D9CEB8]();
}

uint64_t type metadata accessor for RequestCompletedMessage()
{
  return MEMORY[0x1E0D9CF50]();
}

uint64_t type metadata accessor for StartTextRequestMessage()
{
  return MEMORY[0x1E0D9CF68]();
}

uint64_t ExecuteNLOnServerMessage.isMuxStateRollback.getter()
{
  return MEMORY[0x1E0D9CF70]();
}

uint64_t ExecuteNLOnServerMessage.mostRecentVoiceIdScoreCard.getter()
{
  return MEMORY[0x1E0D9CF78]();
}

uint64_t ExecuteNLOnServerMessage.sharedUserIdToSpeechPackage.getter()
{
  return MEMORY[0x1E0D9CF80]();
}

uint64_t ExecuteNLOnServerMessage.init(build:)()
{
  return MEMORY[0x1E0D9CF88]();
}

uint64_t ExecuteNLOnServerMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9CF90]();
}

uint64_t ExecuteNLOnServerMessage.Builder.fallbackReason.setter()
{
  return MEMORY[0x1E0D9CF98]();
}

uint64_t ExecuteNLOnServerMessage.Builder.resultCandidateId.setter()
{
  return MEMORY[0x1E0D9CFA0]();
}

uint64_t ExecuteNLOnServerMessage.Builder.delegatedUserDialogActs.setter()
{
  return MEMORY[0x1E0D9CFA8]();
}

uint64_t ExecuteNLOnServerMessage.Builder.sharedUserIdToSpeechPackage.setter()
{
  return MEMORY[0x1E0D9CFB0]();
}

uint64_t ExecuteNLOnServerMessage.Builder.source.setter()
{
  return MEMORY[0x1E0D9CFB8]();
}

uint64_t ExecuteNLOnServerMessage.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9CFC0]();
}

uint64_t ExecuteNLOnServerMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9CFC8]();
}

uint64_t type metadata accessor for ExecuteNLOnServerMessage()
{
  return MEMORY[0x1E0D9CFD0]();
}

uint64_t ExecuteNLOnServerMessageBase.fallbackReason.getter()
{
  return MEMORY[0x1E0D9CFE0]();
}

uint64_t ExecuteNLOnServerMessageBase.delegatedUserDialogActs.getter()
{
  return MEMORY[0x1E0D9CFE8]();
}

uint64_t ExecuteNLOnServerMessageBase.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9CFF0]();
}

uint64_t ExecuteNLOnServerMessageBase.Builder.fallbackReason.setter()
{
  return MEMORY[0x1E0D9CFF8]();
}

uint64_t ExecuteNLOnServerMessageBase.Builder.resultCandidateId.setter()
{
  return MEMORY[0x1E0D9D000]();
}

uint64_t ExecuteNLOnServerMessageBase.Builder.delegatedUserDialogActs.setter()
{
  return MEMORY[0x1E0D9D008]();
}

uint64_t ExecuteNLOnServerMessageBase.Builder.source.setter()
{
  return MEMORY[0x1E0D9D010]();
}

uint64_t ExecuteNLOnServerMessageBase.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9D018]();
}

uint64_t ExecuteNLOnServerMessageBase.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9D020]();
}

uint64_t MUXServerFallbackMessage.init(build:)()
{
  return MEMORY[0x1E0D9D028]();
}

uint64_t type metadata accessor for MUXServerFallbackMessage()
{
  return MEMORY[0x1E0D9D030]();
}

uint64_t NLResultCandidateMessage.voiceIdScore.getter()
{
  return MEMORY[0x1E0D9D038]();
}

uint64_t NLResultCandidateMessage.voiceIdClassification.getter()
{
  return MEMORY[0x1E0D9D040]();
}

uint64_t NLResultCandidateMessage.init(build:)()
{
  return MEMORY[0x1E0D9D048]();
}

uint64_t NLResultCandidateMessage.Builder.resultCandidateId.setter()
{
  return MEMORY[0x1E0D9D050]();
}

uint64_t NLResultCandidateMessage.Builder.userParses.setter()
{
  return MEMORY[0x1E0D9D058]();
}

uint64_t NLResultCandidateMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9D060]();
}

uint64_t NLResultCandidateMessage.Builder.fallbackParse.setter()
{
  return MEMORY[0x1E0D9D068]();
}

uint64_t NLResultCandidateMessage.Builder.responseStatusCode.setter()
{
  return MEMORY[0x1E0D9D070]();
}

uint64_t NLResultCandidateMessage.Builder.languageVariantResult.setter()
{
  return MEMORY[0x1E0D9D078]();
}

uint64_t NLResultCandidateMessage.Builder.responseVariantResult.setter()
{
  return MEMORY[0x1E0D9D080]();
}

uint64_t NLResultCandidateMessage.Builder.source.setter()
{
  return MEMORY[0x1E0D9D088]();
}

uint64_t NLResultCandidateMessage.Builder.userId.setter()
{
  return MEMORY[0x1E0D9D090]();
}

uint64_t NLResultCandidateMessage.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9D098]();
}

uint64_t NLResultCandidateMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9D0A0]();
}

uint64_t type metadata accessor for NLResultCandidateMessage()
{
  return MEMORY[0x1E0D9D0A8]();
}

uint64_t NLResultCandidateMessageBase.userParses.getter()
{
  return MEMORY[0x1E0D9D0B8]();
}

uint64_t NLResultCandidateMessageBase.fallbackParse.getter()
{
  return MEMORY[0x1E0D9D0C0]();
}

uint64_t NLResultCandidateMessageBase.responseStatusCode.getter()
{
  return MEMORY[0x1E0D9D0C8]();
}

uint64_t NLResultCandidateMessageBase.languageVariantResult.getter()
{
  return MEMORY[0x1E0D9D0D0]();
}

uint64_t NLResultCandidateMessageBase.responseVariantResult.getter()
{
  return MEMORY[0x1E0D9D0D8]();
}

uint64_t RunPommesResponseMessage.nlResponse.getter()
{
  return MEMORY[0x1E0D9D1A8]();
}

uint64_t RunPommesResponseMessage.pommesResult.getter()
{
  return MEMORY[0x1E0D9D1B0]();
}

uint64_t RunPommesResponseMessage.pommesSearchReason.getter()
{
  return MEMORY[0x1E0D9D1B8]();
}

uint64_t RunPommesResponseMessage.userId.getter()
{
  return MEMORY[0x1E0D9D1C8]();
}

uint64_t type metadata accessor for RunPommesResponseMessage.UserInput()
{
  return MEMORY[0x1E0D9D220]();
}

uint64_t RunPommesResponseMessage.userInput.getter()
{
  return MEMORY[0x1E0D9D230]();
}

uint64_t type metadata accessor for RunPommesResponseMessage()
{
  return MEMORY[0x1E0D9D238]();
}

uint64_t type metadata accessor for StartLocalRequestMessage()
{
  return MEMORY[0x1E0D9D248]();
}

uint64_t AsrResultCandidateMessage.voiceIdScore.getter()
{
  return MEMORY[0x1E0D9D278]();
}

uint64_t AsrResultCandidateMessage.speechPackage.getter()
{
  return MEMORY[0x1E0D9D280]();
}

uint64_t AsrResultCandidateMessage.voiceIdClassification.getter()
{
  return MEMORY[0x1E0D9D288]();
}

uint64_t type metadata accessor for AsrResultCandidateMessage()
{
  return MEMORY[0x1E0D9D2D0]();
}

uint64_t DialogEngineOutputMessage.init(build:)()
{
  return MEMORY[0x1E0D9D2F0]();
}

uint64_t DialogEngineOutputMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9D2F8]();
}

uint64_t DialogEngineOutputMessage.Builder.redactedFullPrint.setter()
{
  return MEMORY[0x1E0D9D300]();
}

uint64_t DialogEngineOutputMessage.Builder.redactedFullSpeak.setter()
{
  return MEMORY[0x1E0D9D308]();
}

uint64_t DialogEngineOutputMessage.Builder.source.setter()
{
  return MEMORY[0x1E0D9D310]();
}

uint64_t DialogEngineOutputMessage.Builder.fullPrint.setter()
{
  return MEMORY[0x1E0D9D318]();
}

uint64_t DialogEngineOutputMessage.Builder.fullSpeak.setter()
{
  return MEMORY[0x1E0D9D320]();
}

uint64_t DialogEngineOutputMessage.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9D328]();
}

uint64_t DialogEngineOutputMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9D330]();
}

uint64_t type metadata accessor for DialogEngineOutputMessage()
{
  return MEMORY[0x1E0D9D348]();
}

uint64_t ExecutionFinalizedMessage.init(build:)()
{
  return MEMORY[0x1E0D9D358]();
}

uint64_t ExecutionFinalizedMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9D368]();
}

uint64_t ExecutionFinalizedMessage.Builder.flowPluginId.setter()
{
  return MEMORY[0x1E0D9D370]();
}

uint64_t ExecutionFinalizedMessage.Builder.trpCandidateId.setter()
{
  return MEMORY[0x1E0D9D378]();
}

uint64_t ExecutionFinalizedMessage.Builder.tcuId.setter()
{
  return MEMORY[0x1E0D9D380]();
}

uint64_t ExecutionFinalizedMessage.Builder.source.setter()
{
  return MEMORY[0x1E0D9D388]();
}

uint64_t ExecutionFinalizedMessage.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9D398]();
}

uint64_t ExecutionFinalizedMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9D3A0]();
}

uint64_t type metadata accessor for ExecutionFinalizedMessage()
{
  return MEMORY[0x1E0D9D3A8]();
}

uint64_t FlowOutputResponseMessage.commandResult.getter()
{
  return MEMORY[0x1E0D9D3B8]();
}

uint64_t FlowOutputResponseMessage.outputId.getter()
{
  return MEMORY[0x1E0D9D3F8]();
}

uint64_t type metadata accessor for FlowOutputResponseMessage()
{
  return MEMORY[0x1E0D9D400]();
}

uint64_t PommesTRPCandidateMessage.pommesResult.getter()
{
  return MEMORY[0x1E0D9D408]();
}

uint64_t PommesTRPCandidateMessage.searchReason.getter()
{
  return MEMORY[0x1E0D9D410]();
}

uint64_t PommesTRPCandidateMessage.init(build:)()
{
  return MEMORY[0x1E0D9D418]();
}

uint64_t PommesTRPCandidateMessage.tcuId.getter()
{
  return MEMORY[0x1E0D9D420]();
}

uint64_t PommesTRPCandidateMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9D428]();
}

uint64_t PommesTRPCandidateMessage.Builder.pommesResult.setter()
{
  return MEMORY[0x1E0D9D430]();
}

uint64_t PommesTRPCandidateMessage.Builder.searchReason.setter()
{
  return MEMORY[0x1E0D9D438]();
}

uint64_t PommesTRPCandidateMessage.Builder.trpCandidateId.setter()
{
  return MEMORY[0x1E0D9D440]();
}

uint64_t PommesTRPCandidateMessage.Builder.tcuId.setter()
{
  return MEMORY[0x1E0D9D448]();
}

uint64_t PommesTRPCandidateMessage.Builder.source.setter()
{
  return MEMORY[0x1E0D9D450]();
}

uint64_t PommesTRPCandidateMessage.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9D460]();
}

uint64_t PommesTRPCandidateMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9D468]();
}

uint64_t type metadata accessor for PommesTRPCandidateMessage()
{
  return MEMORY[0x1E0D9D470]();
}

uint64_t SpeechStopDetectedMessage.lastTRPId.getter()
{
  return MEMORY[0x1E0D9D478]();
}

uint64_t type metadata accessor for SpeechStopDetectedMessage()
{
  return MEMORY[0x1E0D9D480]();
}

uint64_t StartSpeechRequestMessage.asrOnServer.getter()
{
  return MEMORY[0x1E0D9D490]();
}

uint64_t type metadata accessor for StartSpeechRequestMessage()
{
  return MEMORY[0x1E0D9D4E8]();
}

uint64_t UserIdentificationMessage.userIdScores.getter()
{
  return MEMORY[0x1E0D9D4F8]();
}

uint64_t UserIdentificationMessage.voiceIdScoreCard.getter()
{
  return MEMORY[0x1E0D9D500]();
}

uint64_t UserIdentificationMessage.userClassification.getter()
{
  return MEMORY[0x1E0D9D508]();
}

uint64_t type metadata accessor for UserIdentificationMessage()
{
  return MEMORY[0x1E0D9D510]();
}

uint64_t TRPCandidateRequestMessage.tcuToContextList.getter()
{
  return MEMORY[0x1E0D9D520]();
}

uint64_t TRPCandidateRequestMessage.init(build:)()
{
  return MEMORY[0x1E0D9D528]();
}

uint64_t TRPCandidateRequestMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9D530]();
}

uint64_t TRPCandidateRequestMessage.Builder.trpCandidateId.setter()
{
  return MEMORY[0x1E0D9D538]();
}

uint64_t TRPCandidateRequestMessage.Builder.tcuToContextList.setter()
{
  return MEMORY[0x1E0D9D540]();
}

uint64_t TRPCandidateRequestMessage.Builder.source.setter()
{
  return MEMORY[0x1E0D9D548]();
}

uint64_t TRPCandidateRequestMessage.Builder.userId.setter()
{
  return MEMORY[0x1E0D9D550]();
}

uint64_t TRPCandidateRequestMessage.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9D558]();
}

uint64_t TRPCandidateRequestMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9D560]();
}

uint64_t type metadata accessor for TRPCandidateRequestMessage()
{
  return MEMORY[0x1E0D9D568]();
}

uint64_t TRPCandidateRequestMessageBase.trpCandidateId.getter()
{
  return MEMORY[0x1E0D9D578]();
}

uint64_t TRPCandidateRequestMessageBase.userId.getter()
{
  return MEMORY[0x1E0D9D580]();
}

uint64_t type metadata accessor for FallbackToIFRequestedMessage.PrescribedTool()
{
  return MEMORY[0x1E0D9D6F0]();
}

uint64_t FallbackToIFRequestedMessage.init(build:)()
{
  return MEMORY[0x1E0D9D708]();
}

uint64_t FallbackToIFRequestedMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9D710]();
}

uint64_t FallbackToIFRequestedMessage.Builder.prescribedTool.setter()
{
  return MEMORY[0x1E0D9D718]();
}

uint64_t FallbackToIFRequestedMessage.Builder.source.setter()
{
  return MEMORY[0x1E0D9D720]();
}

uint64_t FallbackToIFRequestedMessage.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9D728]();
}

uint64_t FallbackToIFRequestedMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9D730]();
}

uint64_t type metadata accessor for FallbackToIFRequestedMessage()
{
  return MEMORY[0x1E0D9D738]();
}

uint64_t MUXAsrResultCandidateMessage.voiceIdScoreCard.getter()
{
  return MEMORY[0x1E0D9D740]();
}

uint64_t MUXAsrResultCandidateMessage.speechPackageDict.getter()
{
  return MEMORY[0x1E0D9D748]();
}

uint64_t type metadata accessor for MUXAsrResultCandidateMessage()
{
  return MEMORY[0x1E0D9D750]();
}

uint64_t PommesResultCandidateMessage.searchReason.getter()
{
  return MEMORY[0x1E0D9D768]();
}

uint64_t PommesResultCandidateMessage.pommesResponse.getter()
{
  return MEMORY[0x1E0D9D770]();
}

uint64_t PommesResultCandidateMessage.init(build:)()
{
  return MEMORY[0x1E0D9D778]();
}

uint64_t PommesResultCandidateMessage.error.getter()
{
  return MEMORY[0x1E0D9D780]();
}

uint64_t PommesResultCandidateMessage.Builder.resultCandidateId.setter()
{
  return MEMORY[0x1E0D9D788]();
}

uint64_t PommesResultCandidateMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9D790]();
}

uint64_t PommesResultCandidateMessage.Builder.searchReason.setter()
{
  return MEMORY[0x1E0D9D798]();
}

uint64_t PommesResultCandidateMessage.Builder.pommesResponse.setter()
{
  return MEMORY[0x1E0D9D7A0]();
}

uint64_t PommesResultCandidateMessage.Builder.error.setter()
{
  return MEMORY[0x1E0D9D7A8]();
}

uint64_t PommesResultCandidateMessage.Builder.source.setter()
{
  return MEMORY[0x1E0D9D7B0]();
}

uint64_t PommesResultCandidateMessage.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9D7B8]();
}

uint64_t PommesResultCandidateMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9D7C0]();
}

uint64_t type metadata accessor for PommesResultCandidateMessage()
{
  return MEMORY[0x1E0D9D7C8]();
}

uint64_t type metadata accessor for StartCandidateRequestMessage()
{
  return MEMORY[0x1E0D9D800]();
}

uint64_t StartChildTextRequestMessage.textRequestType.getter()
{
  return MEMORY[0x1E0D9D818]();
}

uint64_t type metadata accessor for StartChildTextRequestMessage()
{
  return MEMORY[0x1E0D9D878]();
}

uint64_t TextBasedTRPCandidateMessage.tcuId.getter()
{
  return MEMORY[0x1E0D9D890]();
}

uint64_t TextBasedTRPCandidateMessage.utterance.getter()
{
  return MEMORY[0x1E0D9D8D8]();
}

uint64_t type metadata accessor for TextBasedTRPCandidateMessage()
{
  return MEMORY[0x1E0D9D8E0]();
}

uint64_t ConversationMitigationMessage.init(build:)()
{
  return MEMORY[0x1E0D9D8F0]();
}

uint64_t ConversationMitigationMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9D8F8]();
}

uint64_t ConversationMitigationMessage.Builder.isMitigated.setter()
{
  return MEMORY[0x1E0D9D900]();
}

uint64_t ConversationMitigationMessage.Builder.source.setter()
{
  return MEMORY[0x1E0D9D908]();
}

uint64_t ConversationMitigationMessage.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9D910]();
}

uint64_t ConversationMitigationMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9D918]();
}

uint64_t type metadata accessor for ConversationMitigationMessage()
{
  return MEMORY[0x1E0D9D920]();
}

uint64_t MUXFlowOutputCandidateMessage.init(build:)()
{
  return MEMORY[0x1E0D9D990]();
}

uint64_t MUXFlowOutputCandidateMessage.Builder.resultCandidateId.setter()
{
  return MEMORY[0x1E0D9D998]();
}

uint64_t MUXFlowOutputCandidateMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9D9A0]();
}

uint64_t MUXFlowOutputCandidateMessage.Builder.source.setter()
{
  return MEMORY[0x1E0D9D9A8]();
}

uint64_t MUXFlowOutputCandidateMessage.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9D9B0]();
}

uint64_t MUXFlowOutputCandidateMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9D9B8]();
}

uint64_t type metadata accessor for MUXFlowOutputCandidateMessage()
{
  return MEMORY[0x1E0D9D9C0]();
}

uint64_t ResultCandidateRequestMessageBase.resultCandidateId.getter()
{
  return MEMORY[0x1E0D9D9C8]();
}

uint64_t type metadata accessor for ExecutionSystemSwitchedMessage.SwitchType()
{
  return MEMORY[0x1E0D9DB18]();
}

uint64_t ExecutionSystemSwitchedMessage.switchType.getter()
{
  return MEMORY[0x1E0D9DB28]();
}

uint64_t ExecutionSystemSwitchedMessage.userId.getter()
{
  return MEMORY[0x1E0D9DB38]();
}

uint64_t type metadata accessor for ExecutionSystemSwitchedMessage()
{
  return MEMORY[0x1E0D9DB68]();
}

uint64_t type metadata accessor for StartChildSpeechRequestMessage()
{
  return MEMORY[0x1E0D9DBF8]();
}

uint64_t InitiateMUXStateRollbackMessage.init(build:)()
{
  return MEMORY[0x1E0D9DC08]();
}

uint64_t InitiateMUXStateRollbackMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9DC10]();
}

uint64_t InitiateMUXStateRollbackMessage.Builder.originalRequestId.setter()
{
  return MEMORY[0x1E0D9DC18]();
}

uint64_t InitiateMUXStateRollbackMessage.Builder.rollbackRequestId.setter()
{
  return MEMORY[0x1E0D9DC20]();
}

uint64_t InitiateMUXStateRollbackMessage.Builder.source.setter()
{
  return MEMORY[0x1E0D9DC28]();
}

uint64_t InitiateMUXStateRollbackMessage.Builder.userId.setter()
{
  return MEMORY[0x1E0D9DC30]();
}

uint64_t InitiateMUXStateRollbackMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9DC38]();
}

uint64_t type metadata accessor for InitiateMUXStateRollbackMessage()
{
  return MEMORY[0x1E0D9DC40]();
}

uint64_t type metadata accessor for StartDirectActionRequestMessage()
{
  return MEMORY[0x1E0D9DC50]();
}

uint64_t TextBasedResultCandidateMessage.init(build:)()
{
  return MEMORY[0x1E0D9DC58]();
}

uint64_t TextBasedResultCandidateMessage.Builder.resultCandidateId.setter()
{
  return MEMORY[0x1E0D9DC60]();
}

uint64_t TextBasedResultCandidateMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9DC68]();
}

uint64_t TextBasedResultCandidateMessage.Builder.source.setter()
{
  return MEMORY[0x1E0D9DC70]();
}

uint64_t TextBasedResultCandidateMessage.Builder.userId.setter()
{
  return MEMORY[0x1E0D9DC78]();
}

uint64_t TextBasedResultCandidateMessage.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9DC80]();
}

uint64_t TextBasedResultCandidateMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9DC88]();
}

uint64_t TextBasedResultCandidateMessage.Builder.utterance.setter()
{
  return MEMORY[0x1E0D9DC90]();
}

uint64_t TextBasedResultCandidateMessage.utterance.getter()
{
  return MEMORY[0x1E0D9DC98]();
}

uint64_t type metadata accessor for TextBasedResultCandidateMessage()
{
  return MEMORY[0x1E0D9DCA0]();
}

uint64_t UserIdAwareResultCandidateMessageBase.userId.getter()
{
  return MEMORY[0x1E0D9DE00]();
}

uint64_t DirectActionResultCandidateMessage.directAction.getter()
{
  return MEMORY[0x1E0D9DE08]();
}

uint64_t DirectActionResultCandidateMessage.requestExecutionParameters.getter()
{
  return MEMORY[0x1E0D9DE10]();
}

uint64_t type metadata accessor for DirectActionResultCandidateMessage()
{
  return MEMORY[0x1E0D9DE60]();
}

uint64_t GestureBasedResultCandidateMessage.gesture.getter()
{
  return MEMORY[0x1E0D9DE68]();
}

uint64_t type metadata accessor for GestureBasedResultCandidateMessage()
{
  return MEMORY[0x1E0D9DE70]();
}

uint64_t type metadata accessor for StartCorrectedSpeechRequestMessage()
{
  return MEMORY[0x1E0D9DFE0]();
}

uint64_t type metadata accessor for StartSpeechDictationRequestMessage()
{
  return MEMORY[0x1E0D9E020]();
}

uint64_t MultiUserTRPCandidateRequestMessage.userIdToTRPCandidateDict.getter()
{
  return MEMORY[0x1E0D9E0A8]();
}

uint64_t type metadata accessor for MultiUserTRPCandidateRequestMessage()
{
  return MEMORY[0x1E0D9E0B0]();
}

uint64_t type metadata accessor for StartUnderstandingOnServerRequestMessage()
{
  return MEMORY[0x1E0D9E260]();
}

uint64_t StoppedListeningForTextContinuationMessage.lastTRPId.getter()
{
  return MEMORY[0x1E0D9E310]();
}

uint64_t type metadata accessor for StoppedListeningForTextContinuationMessage()
{
  return MEMORY[0x1E0D9E318]();
}

uint64_t type metadata accessor for StartUnderstandingOnServerTextRequestMessage()
{
  return MEMORY[0x1E0D9E368]();
}

uint64_t StoppedListeningForSpeechContinuationMessage.init(build:)()
{
  return MEMORY[0x1E0D9E370]();
}

uint64_t StoppedListeningForSpeechContinuationMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9E378]();
}

uint64_t StoppedListeningForSpeechContinuationMessage.Builder.source.setter()
{
  return MEMORY[0x1E0D9E388]();
}

uint64_t StoppedListeningForSpeechContinuationMessage.Builder.lastTRPId.setter()
{
  return MEMORY[0x1E0D9E390]();
}

uint64_t StoppedListeningForSpeechContinuationMessage.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9E398]();
}

uint64_t StoppedListeningForSpeechContinuationMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9E3A0]();
}

uint64_t StoppedListeningForSpeechContinuationMessage.lastTRPId.getter()
{
  return MEMORY[0x1E0D9E3A8]();
}

uint64_t type metadata accessor for StoppedListeningForSpeechContinuationMessage()
{
  return MEMORY[0x1E0D9E3B0]();
}

uint64_t RunSiriKitExecutorMessage.invocationId.getter()
{
  return MEMORY[0x1E0D9E3D8]();
}

uint64_t RunSiriKitExecutorMessage.commandExecutionInfo.getter()
{
  return MEMORY[0x1E0D9E3E0]();
}

uint64_t RunSiriKitExecutorMessage.command.getter()
{
  return MEMORY[0x1E0D9E428]();
}

uint64_t type metadata accessor for RunSiriKitExecutorMessage()
{
  return MEMORY[0x1E0D9E430]();
}

uint64_t RunSiriKitExecutorResponseMessage.init(build:)()
{
  return MEMORY[0x1E0D9E440]();
}

uint64_t RunSiriKitExecutorResponseMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9E450]();
}

uint64_t RunSiriKitExecutorResponseMessage.Builder.invocationId.setter()
{
  return MEMORY[0x1E0D9E458]();
}

uint64_t RunSiriKitExecutorResponseMessage.Builder.error.setter()
{
  return MEMORY[0x1E0D9E460]();
}

uint64_t RunSiriKitExecutorResponseMessage.Builder.source.setter()
{
  return MEMORY[0x1E0D9E468]();
}

uint64_t RunSiriKitExecutorResponseMessage.Builder.response.setter()
{
  return MEMORY[0x1E0D9E470]();
}

uint64_t RunSiriKitExecutorResponseMessage.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9E478]();
}

uint64_t RunSiriKitExecutorResponseMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9E480]();
}

uint64_t type metadata accessor for RunSiriKitExecutorResponseMessage()
{
  return MEMORY[0x1E0D9E490]();
}

uint64_t type metadata accessor for MultiUserStoppedListeningForSpeechContinuationMessage()
{
  return MEMORY[0x1E0D9E4D0]();
}

uint64_t RequestMessageBase.requestId.getter()
{
  return MEMORY[0x1E0D9E4F8]();
}

uint64_t type metadata accessor for RequestMessageBase()
{
  return MEMORY[0x1E0D9E500]();
}

uint64_t SessionMessageBase.sessionId.getter()
{
  return MEMORY[0x1E0D9E528]();
}

uint64_t SiriXActionCandidate.init(build:)()
{
  return MEMORY[0x1E0D9E530]();
}

uint64_t SiriXActionCandidate.Builder.affinityScore.setter()
{
  return MEMORY[0x1E0D9E538]();
}

uint64_t SiriXActionCandidate.Builder.flowHandlerId.setter()
{
  return MEMORY[0x1E0D9E540]();
}

uint64_t SiriXActionCandidate.Builder.parse.setter()
{
  return MEMORY[0x1E0D9E548]();
}

uint64_t SiriXActionCandidate.Builder.loggingId.setter()
{
  return MEMORY[0x1E0D9E550]();
}

uint64_t type metadata accessor for SiriXActionCandidate()
{
  return MEMORY[0x1E0D9E558]();
}

uint64_t type metadata accessor for SiriXParse()
{
  return MEMORY[0x1E0D9E580]();
}

uint64_t SiriXUSOParse.init(build:)()
{
  return MEMORY[0x1E0D9E5B0]();
}

uint64_t SiriXUSOParse.Builder.groupIndex.setter()
{
  return MEMORY[0x1E0D9E5B8]();
}

uint64_t SiriXUSOParse.Builder.appBundleId.setter()
{
  return MEMORY[0x1E0D9E5C0]();
}

uint64_t SiriXUSOParse.Builder.parserIdentifier.setter()
{
  return MEMORY[0x1E0D9E5C8]();
}

uint64_t SiriXUSOParse.Builder.userParse.setter()
{
  return MEMORY[0x1E0D9E5D0]();
}

uint64_t type metadata accessor for SiriXUSOParse()
{
  return MEMORY[0x1E0D9E5D8]();
}

uint64_t dispatch thunk of MessagePublishing.postMessage(_:)()
{
  return MEMORY[0x1E0D9E5F0]();
}

uint64_t MessageBase.assistantId.getter()
{
  return MEMORY[0x1E0D9E5F8]();
}

uint64_t MessageBase.source.getter()
{
  return MEMORY[0x1E0D9E610]();
}

uint64_t MessageBase.messageId.getter()
{
  return MEMORY[0x1E0D9E618]();
}

uint64_t type metadata accessor for MessageBase()
{
  return MEMORY[0x1E0D9E620]();
}

uint64_t MessageSource.rawValue.getter()
{
  return MEMORY[0x1E0D9E660]();
}

uint64_t type metadata accessor for MessageSource()
{
  return MEMORY[0x1E0D9E670]();
}

uint64_t SiriWillPromptMessage.init(build:)()
{
  return MEMORY[0x1E0D9E680]();
}

uint64_t type metadata accessor for SiriWillPromptMessage()
{
  return MEMORY[0x1E0D9E6B0]();
}

uint64_t SiriWillAskForConfirmationMessage.init(build:)()
{
  return MEMORY[0x1E0D9E6B8]();
}

uint64_t type metadata accessor for SiriWillAskForConfirmationMessage()
{
  return MEMORY[0x1E0D9E6E0]();
}

uint64_t SiriXActionCandidatesGeneratedMessage.init(build:)()
{
  return MEMORY[0x1E0D9E6F8]();
}

uint64_t SiriXActionCandidatesGeneratedMessage.Builder.actionCandidates.setter()
{
  return MEMORY[0x1E0D9E700]();
}

uint64_t SiriXActionCandidatesGeneratedMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1E0D9E708]();
}

uint64_t SiriXActionCandidatesGeneratedMessage.Builder.rcId.setter()
{
  return MEMORY[0x1E0D9E710]();
}

uint64_t SiriXActionCandidatesGeneratedMessage.Builder.source.setter()
{
  return MEMORY[0x1E0D9E718]();
}

uint64_t SiriXActionCandidatesGeneratedMessage.Builder.requestId.setter()
{
  return MEMORY[0x1E0D9E720]();
}

uint64_t SiriXActionCandidatesGeneratedMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1E0D9E728]();
}

uint64_t type metadata accessor for SiriXActionCandidatesGeneratedMessage()
{
  return MEMORY[0x1E0D9E730]();
}

uint64_t InputOrigin.aceInputOrigin.getter()
{
  return MEMORY[0x1E0D9E7C0]();
}

uint64_t PommesError.rawValue.getter()
{
  return MEMORY[0x1E0D9E830]();
}

uint64_t type metadata accessor for PommesError()
{
  return MEMORY[0x1E0D9E848]();
}

uint64_t RequestType.rawValue.getter()
{
  return MEMORY[0x1E0D9E8B0]();
}

uint64_t type metadata accessor for RequestType()
{
  return MEMORY[0x1E0D9E8C0]();
}

uint64_t GestureInput.utterance.getter()
{
  return MEMORY[0x1E0D9E908]();
}

uint64_t type metadata accessor for GestureInput()
{
  return MEMORY[0x1E0D9E910]();
}

uint64_t NLParseResponse.userParses.getter()
{
  return MEMORY[0x1E0D9EAD8]();
}

uint64_t NLParseResponse.fallbackParse.getter()
{
  return MEMORY[0x1E0D9EAE0]();
}

uint64_t NLParseResponse.responseStatusCode.getter()
{
  return MEMORY[0x1E0D9EAE8]();
}

uint64_t NLParseResponse.serverFallbackReason.getter()
{
  return MEMORY[0x1E0D9EAF0]();
}

uint64_t NLParseResponse.languageVariantResult.getter()
{
  return MEMORY[0x1E0D9EAF8]();
}

uint64_t NLParseResponse.responseVariantResult.getter()
{
  return MEMORY[0x1E0D9EB00]();
}

uint64_t type metadata accessor for TextRequestType()
{
  return MEMORY[0x1E0D9EB68]();
}

uint64_t dispatch thunk of RootRequestAware.rootRequestId.getter()
{
  return MEMORY[0x1E0D9EBB0]();
}

uint64_t RequestContextData.audioSource.getter()
{
  return MEMORY[0x1E0D9EC00]();
}

uint64_t RequestContextData.responseMode.getter()
{
  return MEMORY[0x1E0D9EC18]();
}

uint64_t RequestContextData.conjunctionInfo.getter()
{
  return MEMORY[0x1E0D9EC28]();
}

uint64_t RequestContextData.audioDestination.getter()
{
  return MEMORY[0x1E0D9EC30]();
}

uint64_t RequestContextData.approximatePreviousTTSInterval.getter()
{
  return MEMORY[0x1E0D9EC80]();
}

uint64_t TCUMappedNLResponse.nlResponse.getter()
{
  return MEMORY[0x1E0D9ECE8]();
}

uint64_t TCUMappedNLResponse.init(tcuId:nlResponse:)()
{
  return MEMORY[0x1E0D9ECF0]();
}

uint64_t TCUMappedNLResponse.tcuId.getter()
{
  return MEMORY[0x1E0D9ECF8]();
}

uint64_t type metadata accessor for TCUMappedNLResponse()
{
  return MEMORY[0x1E0D9ED00]();
}

uint64_t ServerFallbackReason.rawValue.getter()
{
  return MEMORY[0x1E0D9ED58]();
}

uint64_t type metadata accessor for ServerFallbackReason()
{
  return MEMORY[0x1E0D9ED60]();
}

uint64_t ConversationSessionKey.rawValue.getter()
{
  return MEMORY[0x1E0D9EE00]();
}

uint64_t type metadata accessor for ConversationSessionKey()
{
  return MEMORY[0x1E0D9EE08]();
}

uint64_t type metadata accessor for RequestConjunctionInfo()
{
  return MEMORY[0x1E0D9EE40]();
}

uint64_t dispatch thunk of ConversationSessionState.sharedValue(forKey:)()
{
  return MEMORY[0x1E0D9EEB0]();
}

uint64_t dispatch thunk of ConversationSessionState.updateValue(_:forKey:userId:)()
{
  return MEMORY[0x1E0D9EEB8]();
}

uint64_t dispatch thunk of ConversationSessionState.updateValues(data:userId:)()
{
  return MEMORY[0x1E0D9EEC0]();
}

uint64_t dispatch thunk of ConversationSessionState.createSnapshot(requestId:)()
{
  return MEMORY[0x1E0D9EEC8]();
}

uint64_t dispatch thunk of ConversationSessionState.restoreSnapshot(requestId:)()
{
  return MEMORY[0x1E0D9EED0]();
}

uint64_t dispatch thunk of ConversationSessionState.immutableSnapshot()()
{
  return MEMORY[0x1E0D9EED8]();
}

uint64_t dispatch thunk of ConversationSessionState.updateSharedValue(_:forKey:)()
{
  return MEMORY[0x1E0D9EEE0]();
}

uint64_t dispatch thunk of ConversationSessionState.updateSharedValues(data:)()
{
  return MEMORY[0x1E0D9EEE8]();
}

uint64_t dispatch thunk of ConversationSessionState.value(forKey:userId:)()
{
  return MEMORY[0x1E0D9EEF0]();
}

uint64_t dispatch thunk of ConversationSessionsManaging.conversationSessionState(forConversationSessionId:)()
{
  return MEMORY[0x1E0D9EF18]();
}

uint64_t UserID.init(sharedUserId:)()
{
  return MEMORY[0x1E0D9EF68]();
}

uint64_t UserID.sharedUserId.getter()
{
  return MEMORY[0x1E0D9EF70]();
}

uint64_t type metadata accessor for UserID()
{
  return MEMORY[0x1E0D9EF80]();
}

uint64_t App.__allocating_init(appIdentifier:)()
{
  return MEMORY[0x1E0D978C0]();
}

uint64_t App.appIdentifier.getter()
{
  return MEMORY[0x1E0D978C8]();
}

uint64_t type metadata accessor for App()
{
  return MEMORY[0x1E0D978E8]();
}

uint64_t AppResolutionStateProvider.init(appSelectionState:)()
{
  return MEMORY[0x1E0D97950]();
}

uint64_t type metadata accessor for AppResolutionStateProvider()
{
  return MEMORY[0x1E0D97960]();
}

uint64_t type metadata accessor for AppResolutionResult()
{
  return MEMORY[0x1E0D979E0]();
}

uint64_t FlowTaskMetadata.init(id:isClientInitiated:creationTime:)()
{
  return MEMORY[0x1E0D981F8]();
}

uint64_t type metadata accessor for FlowTaskMetadata()
{
  return MEMORY[0x1E0D98208]();
}

uint64_t static MeCardOptions.ignoreLocalMeCard.getter()
{
  return MEMORY[0x1E0D98228]();
}

uint64_t static MeCardOptions.ignoreCachedMeCard.getter()
{
  return MEMORY[0x1E0D98230]();
}

uint64_t type metadata accessor for MeCardOptions()
{
  return MEMORY[0x1E0D98238]();
}

uint64_t static SharedContext.internalSharedContext.getter()
{
  return MEMORY[0x1E0D98248]();
}

uint64_t CurrentRequest.rootRequestId.getter()
{
  return MEMORY[0x1E0D98250]();
}

uint64_t CurrentRequest.executionRequestId.getter()
{
  return MEMORY[0x1E0D98258]();
}

uint64_t CurrentRequest.asrOnDevice.getter()
{
  return MEMORY[0x1E0D98270]();
}

uint64_t CurrentRequest.audioSource.getter()
{
  return MEMORY[0x1E0D98278]();
}

uint64_t CurrentRequest.inputOrigin.getter()
{
  return MEMORY[0x1E0D98280]();
}

uint64_t CurrentRequest.isInAmbient.getter()
{
  return MEMORY[0x1E0D98288]();
}

uint64_t CurrentRequest.responseMode.getter()
{
  return MEMORY[0x1E0D98290]();
}

uint64_t CurrentRequest.companionName.getter()
{
  return MEMORY[0x1E0D98298]();
}

uint64_t CurrentRequest.interactionId.getter()
{
  return MEMORY[0x1E0D982A0]();
}

uint64_t CurrentRequest.speechPackage.getter()
{
  return MEMORY[0x1E0D982A8]();
}

uint64_t CurrentRequest.bargeInContext.getter()
{
  return MEMORY[0x1E0D982B0]();
}

uint64_t CurrentRequest.multiUserState.getter()
{
  return MEMORY[0x1E0D982B8]();
}

uint64_t CurrentRequest.interactionType.getter()
{
  return MEMORY[0x1E0D982C0]();
}

uint64_t CurrentRequest.originatingHome.getter()
{
  return MEMORY[0x1E0D982C8]();
}

uint64_t CurrentRequest.audioDestination.getter()
{
  return MEMORY[0x1E0D982D0]();
}

uint64_t CurrentRequest.flowTaskMetadata.getter()
{
  return MEMORY[0x1E0D982D8]();
}

uint64_t CurrentRequest.flowTaskMetadata.setter()
{
  return MEMORY[0x1E0D982E0]();
}

uint64_t CurrentRequest.locationProvider.getter()
{
  return MEMORY[0x1E0D982E8]();
}

uint64_t CurrentRequest.locationProvider.setter()
{
  return MEMORY[0x1E0D982F0]();
}

uint64_t CurrentRequest.positionInSession.getter()
{
  return MEMORY[0x1E0D982F8]();
}

uint64_t CurrentRequest.resultCandidateId.getter()
{
  return MEMORY[0x1E0D98300]();
}

uint64_t CurrentRequest.nlExecutionLocation.getter()
{
  return MEMORY[0x1E0D98308]();
}

uint64_t CurrentRequest.voiceAudioSessionId.getter()
{
  return MEMORY[0x1E0D98310]();
}

uint64_t CurrentRequest.asrExecutionLocation.getter()
{
  return MEMORY[0x1E0D98318]();
}

uint64_t CurrentRequest.sharedContextService.getter()
{
  return MEMORY[0x1E0D98320]();
}

uint64_t CurrentRequest.voiceTriggerEventInfo.getter()
{
  return MEMORY[0x1E0D98328]();
}

uint64_t CurrentRequest.requestLanguageVariant.getter()
{
  return MEMORY[0x1E0D98330]();
}

uint64_t CurrentRequest.isSystemApertureEnabled.getter()
{
  return MEMORY[0x1E0D98340]();
}

uint64_t CurrentRequest.responseLanguageVariant.getter()
{
  return MEMORY[0x1E0D98348]();
}

uint64_t CurrentRequest.currentDeviceAssistantId.getter()
{
  return MEMORY[0x1E0D98358]();
}

uint64_t CurrentRequest.isLiveActivitiesSupported.getter()
{
  return MEMORY[0x1E0D98360]();
}

uint64_t CurrentRequest.isRecognizeMyVoiceEnabled.getter()
{
  return MEMORY[0x1E0D98368]();
}

uint64_t CurrentRequest.sessionHandoffContinuityID.getter()
{
  return MEMORY[0x1E0D98370]();
}

uint64_t CurrentRequest.aceId.getter()
{
  return MEMORY[0x1E0D98378]();
}

uint64_t CurrentRequest.refId.getter()
{
  return MEMORY[0x1E0D98380]();
}

uint64_t CurrentRequest.peerName.getter()
{
  return MEMORY[0x1E0D98388]();
}

uint64_t CurrentRequest.utterance.getter()
{
  return MEMORY[0x1E0D98390]();
}

uint64_t type metadata accessor for CurrentRequest()
{
  return MEMORY[0x1E0D98398]();
}

uint64_t type metadata accessor for MultiUserState()
{
  return MEMORY[0x1E0D983B8]();
}

uint64_t dispatch thunk of HomeKitProvider.areHomesConfigured(refresh:)()
{
  return MEMORY[0x1E0D983C8]();
}

uint64_t dispatch thunk of HomeKitProvider.debugInfo.getter()
{
  return MEMORY[0x1E0D983D0]();
}

uint64_t MultiUserContext.init(requiresUserGrounding:meCardProxy:handoffTargetDeviceID:)()
{
  return MEMORY[0x1E0D983D8]();
}

uint64_t type metadata accessor for MultiUserContext()
{
  return MEMORY[0x1E0D983E8]();
}

uint64_t InteractionTypeHelper.mapInteractionType(inputOrigin:isEyesFree:isDeviceInStarkMode:isDeviceInCarDND:audioSource:audioDestination:previousInteractionType:)()
{
  return MEMORY[0x1E0D983F8]();
}

uint64_t static InteractionTypeHelper.shared.getter()
{
  return MEMORY[0x1E0D98400]();
}

uint64_t type metadata accessor for InteractionTypeHelper()
{
  return MEMORY[0x1E0D98408]();
}

uint64_t dispatch thunk of RefreshableSharedContext.sharedContext.setter()
{
  return MEMORY[0x1E0D98410]();
}

uint64_t RequestPositionInSession.init(rawValue:)()
{
  return MEMORY[0x1E0D98428]();
}

uint64_t RequestPositionInSession.rawValue.getter()
{
  return MEMORY[0x1E0D98430]();
}

uint64_t type metadata accessor for RequestPositionInSession()
{
  return MEMORY[0x1E0D98440]();
}

uint64_t type metadata accessor for PommesCandidateId()
{
  return MEMORY[0x1E0D988D8]();
}

uint64_t PommesSearchReason.rawValue.getter()
{
  return MEMORY[0x1E0D98928]();
}

uint64_t type metadata accessor for PommesSearchReason()
{
  return MEMORY[0x1E0D98930]();
}

uint64_t type metadata accessor for DeviceExpertExperience()
{
  return MEMORY[0x1E0D98960]();
}

uint64_t BinaryDecodingOptions.init()()
{
  return MEMORY[0x1E0DA3738]();
}

{
  return MEMORY[0x1E0D3EA60]();
}

uint64_t type metadata accessor for BinaryDecodingOptions()
{
  return MEMORY[0x1E0DA3740]();
}

{
  return MEMORY[0x1E0D3EA68]();
}

uint64_t Message.init(serializedData:extensions:partial:options:)()
{
  return MEMORY[0x1E0DA3820]();
}

{
  return MEMORY[0x1E0D3EC50]();
}

uint64_t Message.debugDescription.getter()
{
  return MEMORY[0x1E0DA3830]();
}

{
  return MEMORY[0x1E0D3EC68]();
}

Swift::String __swiftcall Message.textFormatString()()
{
  uint64_t v0;
  void *v1;
  Swift::String result;

  v0 = MEMORY[0x1E0DA3838]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t Google_Protobuf_StringValue.init(stringLiteral:)()
{
  return MEMORY[0x1E0D3E710]();
}

uint64_t static Google_Protobuf_StringValue.== infix(_:_:)()
{
  return MEMORY[0x1E0D3E718]();
}

uint64_t Google_Protobuf_StringValue.value.getter()
{
  return MEMORY[0x1E0D3E720]();
}

uint64_t type metadata accessor for Google_Protobuf_StringValue()
{
  return MEMORY[0x1E0D3E740]();
}

uint64_t Message.serializedData(partial:)()
{
  return MEMORY[0x1E0D3EC58]();
}

uint64_t Message.init<A>(contiguousBytes:extensions:partial:options:)()
{
  return MEMORY[0x1E0D3EC60]();
}

uint64_t PommesContext.exportPromptContextData()()
{
  return MEMORY[0x1E0D989F0]();
}

uint64_t PommesContext.exportPegasusConversationContext()()
{
  return MEMORY[0x1E0D98A00]();
}

Swift::Int __swiftcall PommesContext.contextSize()()
{
  return MEMORY[0x1E0D98A10]();
}

uint64_t PommesContext.description.getter()
{
  return MEMORY[0x1E0D98A18]();
}

uint64_t PommesContext.renderedTexts.getter()
{
  return MEMORY[0x1E0D98A20]();
}

Swift::Bool __swiftcall PommesContext.isWithinMaxSize()()
{
  return MEMORY[0x1E0D98A28]();
}

uint64_t PommesContext.exportLegacyNLContext()()
{
  return MEMORY[0x1E0D98A40]();
}

uint64_t type metadata accessor for PommesContext.Source()
{
  return MEMORY[0x1E0D98A68]();
}

uint64_t PommesContext.init(source:domain:listenAfterSpeaking:)()
{
  return MEMORY[0x1E0D98A78]();
}

uint64_t PommesContext.update(with:)()
{
  return MEMORY[0x1E0D98A88]();
}

uint64_t type metadata accessor for PommesContext()
{
  return MEMORY[0x1E0D98A90]();
}

uint64_t dispatch thunk of PommesResponse.experiences.getter()
{
  return MEMORY[0x1E0D98AC8]();
}

uint64_t dispatch thunk of PommesResponse.searchReason.getter()
{
  return MEMORY[0x1E0D98AD8]();
}

uint64_t PommesResponse.metadataDomainName.getter()
{
  return MEMORY[0x1E0D98B10]();
}

uint64_t dispatch thunk of PommesResponse.primaryQueryConfidence()()
{
  return MEMORY[0x1E0D98B38]();
}

uint64_t PommesResponse.metadataFallbackTriggered.getter()
{
  return MEMORY[0x1E0D98B70]();
}

uint64_t dispatch thunk of GenericExperience.serverSuggestions.getter()
{
  return MEMORY[0x1E0D98E38]();
}

uint64_t type metadata accessor for GenericExperience()
{
  return MEMORY[0x1E0D98E48]();
}

uint64_t dispatch thunk of ScopedReferenceResolutionDataProvider.dataForCurrentRequest.setter()
{
  return MEMORY[0x1E0DA3C78]();
}

uint64_t type metadata accessor for ScopedReferenceResolutionDataProvider()
{
  return MEMORY[0x1E0DA3C80]();
}

uint64_t ReferenceResolutionClient.__allocating_init()()
{
  return MEMORY[0x1E0DA3CD0]();
}

uint64_t type metadata accessor for ReferenceResolutionClient()
{
  return MEMORY[0x1E0DA3CD8]();
}

uint64_t dispatch thunk of SalientEntitiesDataProvider.salientEntities.getter()
{
  return MEMORY[0x1E0DA3D28]();
}

uint64_t dispatch thunk of SalientEntitiesDataProvider.salientEntities.setter()
{
  return MEMORY[0x1E0DA3D30]();
}

uint64_t type metadata accessor for ExperimentationAnalyticsManager()
{
  return MEMORY[0x1E0CF1370]();
}

uint64_t os_log(_:dso:log:type:_:)()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:_:_:)()
{
  return MEMORY[0x1E0DF2088]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return MEMORY[0x1E0DF2090]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x1E0DF2100]();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return MEMORY[0x1E0DF2108]();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return MEMORY[0x1E0DF2110]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t OSSignposter.init(logger:)()
{
  return MEMORY[0x1E0DF2130]();
}

uint64_t OSSignposter.logHandle.getter()
{
  return MEMORY[0x1E0DF2150]();
}

uint64_t type metadata accessor for OSSignposter()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return MEMORY[0x1E0DF2198]();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return MEMORY[0x1E0DF2218]();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return MEMORY[0x1E0DF2220]();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return MEMORY[0x1E0DF2228]();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return MEMORY[0x1E0DF2238]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t Logger.init(_:)()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t type metadata accessor for RRMetadata()
{
  return MEMORY[0x1E0DA3D58]();
}

uint64_t RRCandidate.score.getter()
{
  return MEMORY[0x1E0DA3D60]();
}

uint64_t RRCandidate.entity.getter()
{
  return MEMORY[0x1E0DA3D68]();
}

uint64_t type metadata accessor for RRCandidate()
{
  return MEMORY[0x1E0DA3D70]();
}

uint64_t GroupIdentifier.init(id:seq:)()
{
  return MEMORY[0x1E0DA3D98]();
}

uint64_t type metadata accessor for GroupIdentifier()
{
  return MEMORY[0x1E0DA3DA0]();
}

uint64_t type metadata accessor for RRDataSourceMetadataValue()
{
  return MEMORY[0x1E0DA3DC8]();
}

uint64_t RREntity.appBundleId.getter()
{
  return MEMORY[0x1E0DA3E08]();
}

uint64_t RREntity.init(id:appBundleId:usoEntity:dataType:data:group:)()
{
  return MEMORY[0x1E0DA3E18]();
}

uint64_t RREntity.id.getter()
{
  return MEMORY[0x1E0DA3E20]();
}

uint64_t RREntity.group.setter()
{
  return MEMORY[0x1E0DA3E30]();
}

uint64_t RREntity.dataType.getter()
{
  return MEMORY[0x1E0DA3E38]();
}

uint64_t RREntity.metadata.getter()
{
  return MEMORY[0x1E0DA3E40]();
}

uint64_t RREntity.usoEntity.getter()
{
  return MEMORY[0x1E0DA3E48]();
}

uint64_t type metadata accessor for RREntity()
{
  return MEMORY[0x1E0DA3E50]();
}

uint64_t type metadata accessor for RRFilter()
{
  return MEMORY[0x1E0DA3E78]();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t dispatch thunk of Cam.action(request:)()
{
  return MEMORY[0x1E0D97A20]();
}

uint64_t static CamSingletonProvider.cam(camEnabledFeatures:)()
{
  return MEMORY[0x1E0D97A28]();
}

uint64_t type metadata accessor for CamSingletonProvider()
{
  return MEMORY[0x1E0D97A30]();
}

uint64_t type metadata accessor for CamParse()
{
  return MEMORY[0x1E0D97A50]();
}

uint64_t type metadata accessor for CamAction()
{
  return MEMORY[0x1E0D97A88]();
}

uint64_t type metadata accessor for CamFeature()
{
  return MEMORY[0x1E0D97AA8]();
}

uint64_t CamRequest.init(requestId:camId:rcId:maybeSpeechPackage:rankedActions:camEnabledFeatures:previousCamAction:)()
{
  return MEMORY[0x1E0D97AC0]();
}

uint64_t type metadata accessor for CamRequest()
{
  return MEMORY[0x1E0D97AC8]();
}

uint64_t CamResponse.camAction.getter()
{
  return MEMORY[0x1E0D97AD0]();
}

uint64_t type metadata accessor for CamResponse()
{
  return MEMORY[0x1E0D97AD8]();
}

uint64_t CamUSOParse.groupIndex.getter()
{
  return MEMORY[0x1E0D97AE0]();
}

uint64_t CamUSOParse.appBundleId.getter()
{
  return MEMORY[0x1E0D97AE8]();
}

uint64_t CamUSOParse.parserIdentifier.getter()
{
  return MEMORY[0x1E0D97AF0]();
}

uint64_t CamUSOParse.userParse.getter()
{
  return MEMORY[0x1E0D97AF8]();
}

uint64_t CamUSOParse.init(userParse:parserIdentifier:appBundleId:groupIndex:)()
{
  return MEMORY[0x1E0D97B00]();
}

uint64_t type metadata accessor for CamUSOParse()
{
  return MEMORY[0x1E0D97B08]();
}

uint64_t static CaarProvider.caar()()
{
  return MEMORY[0x1E0D97B10]();
}

uint64_t type metadata accessor for CaarProvider()
{
  return MEMORY[0x1E0D97B18]();
}

uint64_t RankedAction.alternatives.getter()
{
  return MEMORY[0x1E0D97B20]();
}

uint64_t RankedAction.init(flowHandlerId:parse:score:loggingId:alternatives:userData:)()
{
  return MEMORY[0x1E0D97B28]();
}

uint64_t RankedAction.init(flowHandlerId:parse:score:alternatives:userData:)()
{
  return MEMORY[0x1E0D97B30]();
}

uint64_t RankedAction.flowHandlerId.getter()
{
  return MEMORY[0x1E0D97B38]();
}

uint64_t RankedAction.parse.getter()
{
  return MEMORY[0x1E0D97B40]();
}

uint64_t RankedAction.score.getter()
{
  return MEMORY[0x1E0D97B48]();
}

uint64_t RankedAction.userData.getter()
{
  return MEMORY[0x1E0D97B50]();
}

uint64_t RankedAction.loggingId.getter()
{
  return MEMORY[0x1E0D97B58]();
}

uint64_t type metadata accessor for RankedAction()
{
  return MEMORY[0x1E0D97B60]();
}

uint64_t RankerContext.init(rrCandidates:responseMode:previousConversationHandlerId:maxNLProba:)()
{
  return MEMORY[0x1E0D97B78]();
}

uint64_t type metadata accessor for RankerContext()
{
  return MEMORY[0x1E0D97B80]();
}

uint64_t ActionCandidate.affinityScore.getter()
{
  return MEMORY[0x1E0D97B90]();
}

uint64_t ActionCandidate.init(flowHandlerId:parse:affinityScore:loggingId:userData:)()
{
  return MEMORY[0x1E0D97B98]();
}

uint64_t ActionCandidate.flowHandlerId.getter()
{
  return MEMORY[0x1E0D97BA0]();
}

uint64_t ActionCandidate.parse.getter()
{
  return MEMORY[0x1E0D97BA8]();
}

uint64_t ActionCandidate.userData.getter()
{
  return MEMORY[0x1E0D97BB0]();
}

uint64_t ActionCandidate.loggingId.getter()
{
  return MEMORY[0x1E0D97BB8]();
}

uint64_t type metadata accessor for ActionCandidate()
{
  return MEMORY[0x1E0D97BC0]();
}

uint64_t dispatch thunk of Caar.rank(requestId:caarId:rcId:actions:rankerContext:)()
{
  return MEMORY[0x1E0D97BD8]();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t static DispatchTimeoutResult.== infix(_:_:)()
{
  return MEMORY[0x1E0DEF4B8]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t static DispatchQoS.userInitiated.getter()
{
  return MEMORY[0x1E0DEF580]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t static DispatchTime.now()()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t DispatchTime.advanced(by:)()
{
  return MEMORY[0x1E0DEF6A0]();
}

uint64_t type metadata accessor for DispatchTime()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t + infix(_:_:)()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t Dictionary.init()()
{
  return MEMORY[0x1E0DE9D60]();
}

uint64_t Array.init()()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t CancellationError.init()()
{
  return MEMORY[0x1E0DF05B0]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x1E0CB17D8]();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB17F8]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t Dictionary.removeValue(forKey:)()
{
  return MEMORY[0x1E0DE9E40]();
}

uint64_t Dictionary.updateValue(_:forKey:)()
{
  return MEMORY[0x1E0DE9E48]();
}

uint64_t Dictionary.init(minimumCapacity:)()
{
  return MEMORY[0x1E0DE9E58]();
}

uint64_t Dictionary.debugDescription.getter()
{
  return MEMORY[0x1E0DE9E70]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t Dictionary.Keys.description.getter()
{
  return MEMORY[0x1E0DE9E90]();
}

uint64_t type metadata accessor for Dictionary.Keys()
{
  return MEMORY[0x1E0DE9EC0]();
}

uint64_t type metadata accessor for Dictionary.Values()
{
  return MEMORY[0x1E0DE9F78]();
}

Swift::Void __swiftcall Dictionary.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
  MEMORY[0x1E0DEA040](keepingCapacity);
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t dispatch thunk of Encodable.encode(to:)()
{
  return MEMORY[0x1E0DEA0F0]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t BidirectionalCollection<>.starts<A>(with:)()
{
  return MEMORY[0x1E0DF1FA0]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t ObjectIdentifier.debugDescription.getter()
{
  return MEMORY[0x1E0DEA510]();
}

uint64_t ObjectIdentifier.hashValue.getter()
{
  return MEMORY[0x1E0DEA518]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x1E0DEA568]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x1E0CB1940]();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return MEMORY[0x1E0CB1988]();
}

uint64_t String.init(data:encoding:)()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t String.init<A>(bytes:encoding:)()
{
  return MEMORY[0x1E0CB1998]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x1E0DEA5F8]();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0;
  void *v1;
  Swift::String result;

  v0 = MEMORY[0x1E0DEA610]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.init<A>(reflecting:)()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t String.toProtobufStringValue()()
{
  return MEMORY[0x1E0D9F968]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t String.debugDescription.getter()
{
  return MEMORY[0x1E0DEA698]();
}

uint64_t static String._fromUTF8Repairing(_:)()
{
  return MEMORY[0x1E0DEA6F0]();
}

uint64_t String.md5String.getter()
{
  return MEMORY[0x1E0DA3D38]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t String.index(before:)()
{
  return MEMORY[0x1E0DEA7C8]();
}

uint64_t String.index(_:offsetBy:)()
{
  return MEMORY[0x1E0DEA7D8]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x1E0DEA800](a1._countAndFlagsBits, a1._object);
}

uint64_t String.remove(at:)()
{
  return MEMORY[0x1E0DEA820]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x1E0DEA850]();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return MEMORY[0x1E0DEA940](a1._countAndFlagsBits, a1._object);
}

uint64_t String.hashValue.getter()
{
  return MEMORY[0x1E0DEA950]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x1E0DEAA08]();
}

{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t Sequence.compactMap<A>(_:)()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t Sequence._copyContents(initializing:)()
{
  return MEMORY[0x1E0DEAAB8]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t Sequence.contains(where:)()
{
  return MEMORY[0x1E0DEAB48]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1E0DEADA0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x1E0CB1AC0]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t Array<A>.hasWantedToUndo.getter()
{
  return MEMORY[0x1E0D9C7B8]();
}

uint64_t Array<A>.hasWantedToPause.getter()
{
  return MEMORY[0x1E0D9C7C0]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t Array._checkSubscript(_:wasNativeTypeChecked:)()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t Array.debugDescription.getter()
{
  return MEMORY[0x1E0DEADF0]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x1E0DEAE28]();
}

Swift::Bool __swiftcall Array._hoistableIsNativeTypeChecked()()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t Array.endIndex.getter()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x1E0DEAF00]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t type metadata accessor for CheckedContinuation()
{
  return MEMORY[0x1E0DF05D8]();
}

uint64_t type metadata accessor for CancellationError()
{
  return MEMORY[0x1E0DF05E0]();
}

uint64_t TaskGroup.makeAsyncIterator()()
{
  return MEMORY[0x1E0DF0608]();
}

uint64_t TaskGroup.awaitAllRemainingTasks(isolation:)()
{
  return MEMORY[0x1E0DF0610]();
}

uint64_t TaskGroup.next(isolation:)()
{
  return MEMORY[0x1E0DF0620]();
}

uint64_t TaskGroup.Iterator.next(isolation:)()
{
  return MEMORY[0x1E0DF0640]();
}

uint64_t static TaskPriority.background.getter()
{
  return MEMORY[0x1E0DF06F8]();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return MEMORY[0x1E0DF0700]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t static AsyncStream.makeStream(of:bufferingPolicy:)()
{
  return MEMORY[0x1E0DF0770]();
}

uint64_t type metadata accessor for AsyncStream.Continuation.YieldResult()
{
  return MEMORY[0x1E0DF0790]();
}

uint64_t type metadata accessor for AsyncStream.Continuation.BufferingPolicy()
{
  return MEMORY[0x1E0DF07C0]();
}

uint64_t AsyncStream.Continuation.yield(_:)()
{
  return MEMORY[0x1E0DF07D8]();
}

Swift::Void __swiftcall AsyncStream.Continuation.finish()()
{
  MEMORY[0x1E0DF07E0]();
}

uint64_t type metadata accessor for AsyncStream.Continuation()
{
  return MEMORY[0x1E0DF07E8]();
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return MEMORY[0x1E0DF07F8]();
}

uint64_t AsyncStream.Iterator.next(isolation:)()
{
  return MEMORY[0x1E0DF0800]();
}

uint64_t type metadata accessor for AsyncStream()
{
  return MEMORY[0x1E0DF0838]();
}

uint64_t AsyncStream.init(_:bufferingPolicy:_:)()
{
  return MEMORY[0x1E0DF0840]();
}

uint64_t static Task.== infix(_:_:)()
{
  return MEMORY[0x1E0DF0850]();
}

uint64_t Task.hash(into:)()
{
  return MEMORY[0x1E0DF0858]();
}

uint64_t Task.value.getter()
{
  return MEMORY[0x1E0DF0860]();
}

Swift::Void __swiftcall Task.cancel()()
{
  MEMORY[0x1E0DF0870]();
}

uint64_t Task<>.value.getter()
{
  return MEMORY[0x1E0DF08A8]();
}

uint64_t static Task<>.isCancelled.getter()
{
  return MEMORY[0x1E0DF08B8]();
}

uint64_t static Task<>.checkCancellation()()
{
  return MEMORY[0x1E0DF08C8]();
}

uint64_t static Task<>.sleep(nanoseconds:)()
{
  return MEMORY[0x1E0DF08D0]();
}

uint64_t ThrowingTaskGroup.next(isolation:)()
{
  return MEMORY[0x1E0DF0958]();
}

uint64_t Double.write<A>(to:)()
{
  return MEMORY[0x1E0DEB030]();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)MEMORY[0x1E0CB1BB0]();
}

uint64_t static Set._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB1BB8]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t Set.description.getter()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x1E0DEB310]();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1E0CB1C10]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return MEMORY[0x1E0CB1E68]();
}

uint64_t static NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(_:)()
{
  return MEMORY[0x1E0CB1E98]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t type metadata accessor for OS_dispatch_source.TimerFlags()
{
  return MEMORY[0x1E0DEF938]();
}

uint64_t static OS_dispatch_source.makeTimerSource(flags:queue:)()
{
  return MEMORY[0x1E0DEF978]();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return MEMORY[0x1E0DEF9F0]();
}

Swift::Void __swiftcall OS_dispatch_source.resume()()
{
  MEMORY[0x1E0DEFA20]();
}

uint64_t USOSerializedGraph.usoSerializedGraphToUsoGraphSiriNl()()
{
  return MEMORY[0x1E0DA2BE8]();
}

uint64_t static USOSerializedGraph.fromProto(protoGraph:)()
{
  return MEMORY[0x1E0DA2BF0]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t static os_signpost_type_t.event.getter()
{
  return MEMORY[0x1E0DF22A8]();
}

uint64_t OS_dispatch_semaphore.wait(timeout:)()
{
  return MEMORY[0x1E0DEFA60]();
}

Swift::Void __swiftcall OS_dispatch_semaphore.wait()()
{
  MEMORY[0x1E0DEFA68]();
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return MEMORY[0x1E0DEFA70]();
}

uint64_t SISchemaComponentName.description.getter()
{
  return MEMORY[0x1E0D99110]();
}

uint64_t SIRINLUSystemDialogAct.toNluSystemDialogAct()()
{
  return MEMORY[0x1E0D9C7D0]();
}

uint64_t OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)()
{
  return MEMORY[0x1E0DEFAA8]();
}

uint64_t SISchemaDeviceSensitivityState.description.getter()
{
  return MEMORY[0x1E0D99128]();
}

uint64_t SAIntentGroupRunSiriKitExecutor.executeOnRemotePayload()()
{
  return MEMORY[0x1E0D9C7D8]();
}

uint64_t SAIntentGroupRunSiriKitExecutor.hasExecuteOnRemotePayload.getter()
{
  return MEMORY[0x1E0D9C7E0]();
}

uint64_t CNVSchemaCNVExecutionOverrideDecision.description.getter()
{
  return MEMORY[0x1E0D99140]();
}

uint64_t NSSet.init(objects:)()
{
  return MEMORY[0x1E0CB1FB0]();
}

uint64_t NSArray.init(arrayLiteral:)()
{
  return MEMORY[0x1E0CB1FE8]();
}

uint64_t NSArray.makeIterator()()
{
  return MEMORY[0x1E0CB1FF0]();
}

uint64_t NSCoder.decodeObject<A>(of:forKey:)()
{
  return MEMORY[0x1E0CB2020]();
}

uint64_t NSCoder.decodeObject(of:forKey:)()
{
  return MEMORY[0x1E0CB2028]();
}

uint64_t NSCoder.decodeDictionary<A, B>(withKeyClass:objectClass:forKey:)()
{
  return MEMORY[0x1E0CB2038]();
}

uint64_t INIntent.debugDescriptionLite.getter()
{
  return MEMORY[0x1E0D9C7E8]();
}

uint64_t NSBundle.packageId.getter()
{
  return MEMORY[0x1E0DA8270]();
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)MEMORY[0x1E0CB20D0](BOOLeanLiteral);
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)MEMORY[0x1E0CB20E0](integerLiteral);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x1E0DEFCD8](seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return MEMORY[0x1E0DF22B0]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t Optional.debugDescription.getter()
{
  return MEMORY[0x1E0DEB930]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t Optional<A>.encode(to:)()
{
  return MEMORY[0x1E0DEB950]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t StringProtocol.range<A>(of:options:range:locale:)()
{
  return MEMORY[0x1E0CB2540]();
}

uint64_t StringProtocol.compare<A>(_:options:range:locale:)()
{
  return MEMORY[0x1E0CB2568]();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return MEMORY[0x1E0DEFF58]();
}

uint64_t BinaryInteger.description.getter()
{
  return MEMORY[0x1E0DEBE30]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t dispatch thunk of SetAlgebra.isSuperset(of:)()
{
  return MEMORY[0x1E0DEBFC0]();
}

uint64_t SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return MEMORY[0x1E0DEC078]();
}

Swift::Void __swiftcall _NativeSet.removeAll(isUnique:)(Swift::Bool isUnique)
{
  MEMORY[0x1E0DEC090](isUnique);
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t __CocoaSet.count.getter()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t __CocoaSet.member(for:)()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t __CocoaSet.contains(_:)()
{
  return MEMORY[0x1E0DEC118]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x1E0DEC168](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t static GlobalActor.sharedUnownedExecutor.getter()
{
  return MEMORY[0x1E0DF0B00]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x1E0DEC260]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x1E0DEC2A8](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t dispatch thunk of Identifiable.id.getter()
{
  return MEMORY[0x1E0DEC2F0]();
}

uint64_t StaticString.description.getter()
{
  return MEMORY[0x1E0DEC338]();
}

Swift::Void __swiftcall _ArrayBuffer._typeCheckSlowPath(_:)(Swift::Int a1)
{
  MEMORY[0x1E0DEC3D0](a1);
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t withTaskGroup<A, B>(of:returning:isolation:body:)()
{
  return MEMORY[0x1E0DF0B08]();
}

uint64_t _ArrayProtocol.filter(_:)()
{
  return MEMORY[0x1E0DEC5F8]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x1E0DEC670]();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
  MEMORY[0x1E0DEC680](a1);
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t ContiguousArray.append(_:)()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t ContiguousArray.init()()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t dispatch thunk of _AnySequenceBox._makeIterator()()
{
  return MEMORY[0x1E0DEC888]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t CodingUserInfoKey.init(rawValue:)()
{
  return MEMORY[0x1E0DEC980]();
}

uint64_t type metadata accessor for CodingUserInfoKey()
{
  return MEMORY[0x1E0DEC990]();
}

Swift::Void __swiftcall _NativeDictionary.removeAll(isUnique:)(Swift::Bool isUnique)
{
  MEMORY[0x1E0DECB18](isUnique);
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECBE0]();
}

{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t _assertionFailure(_:_:flags:)()
{
  return MEMORY[0x1E0DECBF0]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return MEMORY[0x1E0DECD20]();
}

{
  return MEMORY[0x1E0DECD28]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t dispatch thunk of _AnyIteratorBoxBase.next()()
{
  return MEMORY[0x1E0DECD90]();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return MEMORY[0x1E0DECE70]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x1E0DECF28](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t withThrowingTaskGroup<A, B>(of:returning:isolation:body:)()
{
  return MEMORY[0x1E0DF0D38]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x1E0DECFC0]();
}

{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x1E0DED0F0]();
}

{
  return MEMORY[0x1E0DED0F8]();
}

{
  return MEMORY[0x1E0DED100]();
}

{
  return MEMORY[0x1E0DED110]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x1E0DED120]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x1E0DED1B0](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t withCheckedContinuation<A>(isolation:function:_:)()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t _getErrorEmbeddedNSError<A>(_:)()
{
  return MEMORY[0x1E0DED4A0]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t withTaskCancellationHandler<A>(operation:onCancel:)()
{
  return MEMORY[0x1E0DF0E88]();
}

uint64_t dispatch thunk of CustomDebugStringConvertible.debugDescription.getter()
{
  return MEMORY[0x1E0DED610]();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t _copySequenceToContiguousArray<A>(_:)()
{
  return MEMORY[0x1E0DED980]();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return MEMORY[0x1E0DED998]();
}

uint64_t withCheckedThrowingContinuation<A>(isolation:function:_:)()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1E0DEDEF8]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x1E0DEDF10](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
  MEMORY[0x1E0DEDF18](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
  MEMORY[0x1E0DEDF28](*(_QWORD *)&a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t Mirror.superclassMirror.getter()
{
  return MEMORY[0x1E0DEDF78]();
}

uint64_t Mirror.init(reflecting:)()
{
  return MEMORY[0x1E0DEDF80]();
}

uint64_t Mirror.subjectType.getter()
{
  return MEMORY[0x1E0DEDF90]();
}

uint64_t type metadata accessor for Mirror()
{
  return MEMORY[0x1E0DEE000]();
}

uint64_t type metadata accessor for Result()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t dispatch thunk of Decoder.userInfo.getter()
{
  return MEMORY[0x1E0DEE238]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t dispatch thunk of OptionSet.init(rawValue:)()
{
  return MEMORY[0x1E0DEE8F8]();
}

uint64_t TaskLocal.init(wrappedValue:)()
{
  return MEMORY[0x1E0DF0F28]();
}

uint64_t TaskLocal.get()()
{
  return MEMORY[0x1E0DF0F38]();
}

uint64_t TaskLocal.withValue<A>(_:operation:file:line:)()
{
  return MEMORY[0x1E0DF0F40]();
}

uint64_t TaskLocal.withValue<A>(_:operation:isolation:file:line:)()
{
  return MEMORY[0x1E0DF0F48]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AFCurrentUserInterfaceIdiom()
{
  return MEMORY[0x1E0CFE3C8]();
}

uint64_t AFDeviceSupportsSAE()
{
  return MEMORY[0x1E0CFE438]();
}

uint64_t AFDeviceSupportsSAEByDeviceCapabilityAndFeatureFlags()
{
  return MEMORY[0x1E0CFE440]();
}

uint64_t AFDeviceSupportsSiriMUX()
{
  return MEMORY[0x1E0CFE448]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x1E0CFE4D0]();
}

uint64_t AFSupportsASROnDevice()
{
  return MEMORY[0x1E0CFE728]();
}

uint64_t AFSupportsCallHangUp()
{
  return MEMORY[0x1E0CFE738]();
}

uint64_t AFSupportsMultiUser()
{
  return MEMORY[0x1E0CFE740]();
}

uint64_t AFSupportsSiriInCall()
{
  return MEMORY[0x1E0CFE750]();
}

uint64_t AFSystemRootDirectory()
{
  return MEMORY[0x1E0CFE770]();
}

uint64_t INIntentCreate()
{
  return MEMORY[0x1E0CBD438]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

uint64_t MSVDeviceIsAppleTV()
{
  return MEMORY[0x1E0D4CE70]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

uint64_t _availability_version_check()
{
  return MEMORY[0x1E0C80CC0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

int getrusage(int a1, rusage *a2)
{
  return MEMORY[0x1E0C837C0](*(_QWORD *)&a1, a2);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

void rewind(FILE *a1)
{
  MEMORY[0x1E0C85120](a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x1E0DF0F68]();
}

uint64_t swift_asyncLet_finish()
{
  return MEMORY[0x1E0DF0F70]();
}

uint64_t swift_asyncLet_get()
{
  return MEMORY[0x1E0DF0F78]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
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

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1E0DEEB78]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBB8]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1E0DEEBD0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getAtAnyKeyPath()
{
  return MEMORY[0x1E0DEEC10]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x1E0DEED00]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1E0DEED10]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1E0DEED80]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1E0DEED90]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x1E0DEEDB8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_taskGroup_wait_next_throwing()
{
  return MEMORY[0x1E0DF0FF0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x1E0DF1020]();
}

uint64_t swift_task_localValuePop()
{
  return MEMORY[0x1E0DF1030]();
}

uint64_t swift_task_localValuePush()
{
  return MEMORY[0x1E0DF1038]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1E0DEEF80]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

